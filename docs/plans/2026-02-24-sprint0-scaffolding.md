# Sprint 0 Scaffolding Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Deliver runnable Sprint 0 monorepo scaffolding for backend, worker, frontend, infra, docs, and developer tooling.

**Architecture:** FastAPI backend provides health/auth/me endpoints with JWT RBAC and SQLite persistence via SQLAlchemy/Alembic. APScheduler worker polls backend and LocalStack S3. Next.js frontend provides login + shell pages and backend health indicator. Docker Compose orchestrates LocalStack/backend/worker/frontend for local development.

**Tech Stack:** Python 3.12, FastAPI, SQLAlchemy, Alembic, APScheduler, boto3, Next.js (TypeScript), Tailwind CSS, Docker Compose, Make.

---

### Task 1: Backend RED tests then implementation

**Files:**
- Create: `backend/tests/test_smoke.py`
- Create: `backend/app/main.py`
- Create: `backend/app/api/routes.py`
- Create: `backend/app/core/{auth.py,db.py,logging.py,middleware.py,security.py}`
- Create: `backend/app/models.py`
- Create: `backend/alembic.ini`
- Create: `backend/alembic/env.py`
- Create: `backend/alembic/versions/0001_initial.py`

### Task 2: Worker implementation

**Files:**
- Create: `worker/requirements.txt`
- Create: `worker/main.py`

### Task 3: Frontend implementation

**Files:**
- Create: `frontend/package.json`
- Create: `frontend/next.config.js`
- Create: `frontend/tsconfig.json`
- Create: `frontend/tailwind.config.ts`
- Create: `frontend/postcss.config.js`
- Create: `frontend/app/{layout.tsx,page.tsx,overview/page.tsx,assets/page.tsx,findings/page.tsx,compliance/page.tsx,scenarios/page.tsx}`
- Create: `frontend/app/globals.css`
- Create: `frontend/components/{nav.tsx,status.tsx}`

### Task 4: Infra + tooling + docs

**Files:**
- Create: `docker-compose.yml`
- Create: `Makefile`
- Create: `.env.example`
- Create/Modify: `.gitignore`
- Create: `README.md`
- Create: `docs/research.md`

### Task 5: Verification

**Steps:**
1. Run backend tests and ensure smoke test passes.
2. Run frontend build.
3. Run `docker compose config`.
4. Run `make verify` and fix issues.
