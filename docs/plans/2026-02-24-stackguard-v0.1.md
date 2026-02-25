# StackGuard v0.1 Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Deliver a LocalStack-first AWS security posture MVP with API, scheduler worker, scenario generator, scanner, rule engine, risk scoring, lifecycle, auth/RBAC, frontend, tests, and docs.

**Architecture:** FastAPI backend exposes auth/scenario/scanning/findings APIs and stores state in SQLite via SQLAlchemy. Worker schedules periodic scan jobs by calling backend endpoints and can trigger scenario apply flows. Next.js frontend consumes backend APIs for Overview/Assets/Findings/Compliance/Scenarios; Docker Compose brings up LocalStack, backend, worker, frontend.

**Tech Stack:** Python 3.12, FastAPI, SQLAlchemy, Alembic, APScheduler, boto3, Next.js 14, TypeScript, Tailwind, Docker Compose.

---

### Task 1: Scaffold monorepo structure
### Task 2: Build backend domain, auth, findings lifecycle, rule engine, scoring, scanner, scenario apply
### Task 3: Build worker scheduler
### Task 4: Build frontend pages and API client
### Task 5: Add LocalStack/sample-scenarios infra
### Task 6: Add tests (unit + integration) and run RED->GREEN
### Task 7: Add docs and run full verification (make verify)
### Task 8: Commit on main
