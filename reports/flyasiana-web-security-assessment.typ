// Flyasiana.com — Web Security Assessment Report (Template)
// Primary format: Typst

#set page(margin: 22mm)
#set text(font: "Noto Sans", size: 11pt)
#set heading(numbering: "1.")
#set par(leading: 0.35em)

= Web Security Assessment Report

== Engagement overview
- Target: *flyasiana.com* (and authorized subdomains)
- Testing window: 22:00–04:00 UTC
- Constraints: see Appendix A (RoE)
- Evidence: Authorization screenshot stored in repo under `pentest/flyasiana/evidence/authorization-2026-02-14.png`

== Executive summary (English)
=== Objectives
- Identify exposed subdomains and reachable services.
- Review TLS posture and HTTP security headers.
- Perform low-impact automated scanning within agreed rate limits.
- Verify authentication rate limiting (max 10 attempts/account).

=== High-level results
- Overall risk rating: *TBD*
- Total findings: *TBD*
  - Critical: TBD
  - High: TBD
  - Medium: TBD
  - Low: TBD
  - Informational: TBD

=== Key recommendations
- TBD

== Scope
- In scope: `*.flyasiana.com` subdomain enumeration and testing where authorized.
- Out of scope / prohibited: DoS/DDoS, phishing/social engineering, credential stuffing, data exfiltration.

== Methodology
- Passive reconnaissance
- DNS enumeration + resolution
- Service discovery (HTTP/S)
- TLS configuration review
- HTTP header inspection
- Limited automated scanning (rate controlled)
- Auth rate-limit verification

== Findings
// For each finding, include: impact, affected assets, evidence, reproduction (safe), remediation, references.

=== Finding 1 — Title (Severity)
*Status:* Open / Fixed / Accepted risk

*Affected assets:*
- 

*Description:*
- 

*Impact:*
- 

*Evidence:*
- 

*Remediation:*
- 

== Appendix A — Rules of Engagement (RoE)
- Paste the finalized RoE here.

== Appendix B — Asset inventory (raw)
- Link/attach the Markdown raw export.
