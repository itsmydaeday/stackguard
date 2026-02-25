# Self-Hosted Cloud Security Platform: Architecture & Security Control Design

## 1. Executive Summary

This document outlines the architecture and security control set for a self-hosted cloud security platform designed to scan Infrastructure as Code (IaC) and cloud configuration artifacts, generate risk scores, and present findings via a web dashboard. The design prioritizes scalability, security, multi-tenancy, and accurate risk assessment.

## 2. High-Level Architecture

The platform operates on a microservices architecture deployed within a Kubernetes cluster (e.g., EKS, GKE, or self-managed).

**Components:**

*   **API Gateway:** Ingress point for all external traffic (UI, API clients, CI/CD integrations). Handles authentication, rate limiting, and request routing.
*   **Scanner Engine (Worker Nodes):** Horizontally scalable fleet of workers. Pulls scan jobs from a message queue, retrieves IaC/cloud config artifacts (via Git integrations or direct API pulls), executes analysis engines (e.g., Checkov, OPA/Rego, custom rules), and publishes results.
*   **Policy & Rules Service:** Manages the central repository of security policies, compliance frameworks (CIS, NIST), and custom rules. Serves rules to the Scanner Engine.
*   **Risk Scoring Engine:** Consumes raw scan results, applies the scoring model, and aggregates risk metrics across resources, projects, and tenants.
*   **Dashboard & UI Service:** Serves the frontend web application (React/Vue). Provides visualizations, reporting, and management interfaces.
*   **Event Router/Message Broker:** (e.g., Kafka, RabbitMQ) Decouples services, handles job queuing, and routes internal events (scan complete, policy updated).
*   **Datastores:**
    *   **Relational DB (PostgreSQL):** Stores relational data (tenants, users, policies, metadata).
    *   **Document/NoSQL DB (MongoDB or Elasticsearch):** Stores raw scan findings, historical state, and audit logs for fast querying and aggregation.
    *   **Cache (Redis):** Caches frequent API responses and session data.

## 3. Security Control Taxonomy

Controls are categorized based on their function within the platform's lifecycle.

| Category | Description | Key Controls |
| :--- | :--- | :--- |
| **Preventative** | Stops insecure configurations before deployment (Shift-Left). | PR/MR blocking via CI/CD integration; IDE plugins; strict RBAC for policy modification; mutual TLS (mTLS) between microservices. |
| **Detective** | Identifies misconfigurations in existing environments or codebases. | Continuous scheduled scans of repositories and cloud accounts; anomaly detection in event streams; secrets scanning. |
| **Corrective** | Facilitates remediation of identified issues. | Automated remediation scripts (auto-remediation); contextual remediation guidance in dashboard; ticketing system integration (Jira, ServiceNow). |
| **Compensating** | Mitigates risk when primary controls fail or are unfeasible. | Alerting on high-risk drift; regular penetration testing of the platform itself; comprehensive audit logging. |

## 4. Risk Scoring Model

The scoring model moves beyond simple severity (High/Med/Low) to provide actionable context.

*   **Base Score (0-10):** Derived from the policy violation severity (e.g., exposed S3 bucket = 9.0).
*   **Contextual Multipliers:**
    *   **Environment Context:** Production (x1.5), Staging (x1.0), Dev (x0.5).
    *   **Exposure Context:** Publicly accessible (x2.0), Internal only (x0.8).
    *   **Data Sensitivity:** Contains PII/PCI (x1.5), Non-sensitive (x1.0).
*   **Exploitability Factor:** How easily can the vulnerability be exploited? (High = 1.2, Low = 0.8)
*   **Final Risk Score = (Base Score) * (Environment) * (Exposure) * (Data Sensitivity) * (Exploitability)**

*Thresholds:* Critical (85-100), High (65-84), Medium (40-64), Low (0-39).

## 5. Multi-Tenant Considerations

To support multiple distinct teams or business units within the self-hosted environment:

*   **Logical Isolation:** Data separation at the database layer (e.g., Tenant ID column in RDBMS, separate indices in Elasticsearch).
*   **Hierarchical RBAC:** Global Admins (platform management) vs. Tenant Admins (project/policy management for their specific unit) vs. Viewers.
*   **Namespace/Project Boundaries:** Scans, rules, and findings are strictly bound to specific projects within a tenant.
*   **Resource Quotas:** Prevent noisy neighbor problems by enforcing rate limits and scan concurrency limits per tenant at the API Gateway and message queue level.
*   **Custom Policies per Tenant:** Allow tenants to override global policies or define custom Rego rules specific to their operational needs.

## 6. Eventing Model

An event-driven architecture ensures responsiveness and scalability.

1.  **Trigger:** An event occurs (e.g., code pushed to Git, AWS CloudTrail event detected, manual scan requested).
2.  **Ingestion:** API Gateway or external webhook listener receives the event and publishes an `ScanRequested` event to the message broker.
3.  **Processing:** Scanner Engine consumes `ScanRequested`, performs the analysis, and publishes `ScanCompleted` (containing raw findings).
4.  **Analysis:** Risk Scoring Engine consumes `ScanCompleted`, applies the model, and publishes `RiskScoreCalculated`.
5.  **Action:** Dashboard Service updates the UI via WebSockets. Alerting Service consumes the event and triggers external notifications (Slack, Email, PagerDuty) based on tenant configuration.

## 7. False-Positive Management Strategy

Managing noise is critical for user adoption.

*   **Granular Suppression Rules:** Allow users to suppress findings based on specific criteria (e.g., "Suppress rule X for resource Y in project Z until Date").
*   **Audit Trail for Suppressions:** Require justification for suppressions and log the user who approved it.
*   **Time-Bound Suppressions:** Automatically expire suppressions after a set period to force re-evaluation.
*   **Feedback Loop:** Implement a "Report False Positive" button in the UI. This data feeds back to the security team to refine global rules (e.g., tuning Rego policies).
*   **Context-Aware Analysis:** Utilize graph-based analysis (e.g., evaluating security groups + routing tables + IAM) to reduce "in-theory" vulnerabilities that are mitigated by other compensating controls.

## 8. Verification Gates

Ensure the platform's outputs are reliable and actionable before integration into workflows.

*   **Gate 1: Dry-Run Mode:** New rules are deployed in a "shadow" mode. They generate findings but do not trigger alerts or block PRs until validated.
*   **Gate 2: Confidence Scoring:** Rules are assigned a confidence score (High/Medium/Low). Only High-confidence rules can enforce blocking actions in CI/CD.
*   **Gate 3: Peer Review for Custom Rules:** All custom OPA/Rego rules must go through a standard SDLC (linting, unit testing, peer review) before deployment to the Policy Service.
*   **Gate 4: Platform Health Checks:** Continuous monitoring of the Scanner Engine's queue depth and processing time to ensure findings are timely.

## 9. 30-Day Improvement Roadmap

**Phase 1: Foundation & Visibility (Days 1-10)**
*   Deploy core microservices (API, Scanner, Dashboard) to the Kubernetes cluster.
*   Integrate with primary Identity Provider (IdP) for SSO/RBAC.
*   Connect to one major Git provider (e.g., GitHub/GitLab) and run baseline IaC scans across top 5 critical repositories.

**Phase 2: Context & Remediation (Days 11-20)**
*   Implement the Risk Scoring Engine with initial contextual multipliers (Environment, Exposure).
*   Deploy the Policy Service and enable rule suppression workflows.
*   Integrate with Slack/Teams for high-priority alerts.

**Phase 3: Enforcement & Automation (Days 21-30)**
*   Integrate Scanner Engine into CI/CD pipelines for PR blocking (Gate 2 enforcement).
*   Implement basic auto-remediation scripts for common low-risk misconfigurations (e.g., enforcing tag compliance).
*   Conduct internal penetration test of the platform infrastructure.
