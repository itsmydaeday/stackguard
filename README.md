# StackGuard Sprint 0

StackGuard Sprint 0 provides runnable local scaffolding for backend API, scheduler worker, frontend shell, and LocalStack.

## Architecture

```text
┌─────────────┐      HTTP       ┌──────────────┐
│  Frontend   │ ──────────────▶ │   Backend    │
│ Next.js:3000│ ◀────────────── │ FastAPI:8000 │
└─────────────┘                 └──────┬───────┘
                                        │ SQLAlchemy (SQLite)
                                        │ JWT + RBAC
                                        ▼
                                  ┌──────────────┐
                                  │  stackguard  │
                                  │     .db      │
                                  └──────────────┘

┌─────────────┐      HTTP       ┌──────────────┐
│   Worker    │ ──────────────▶ │   Backend    │
│ APScheduler │                 └──────────────┘
│             │ ──────────────▶ LocalStack:4566 (S3/IAM/KMS/CloudTrail/Logs)
└─────────────┘
```

## Monorepo Layout

- `backend/`: FastAPI service, SQLAlchemy models, Alembic migration, auth/RBAC
- `worker/`: APScheduler loop probing backend and LocalStack S3
- `frontend/`: Next.js + TypeScript + Tailwind mobile-first shell
- `infra/`: infrastructure-oriented assets (reserved for future Sprint items)
- `docs/`: planning and research docs

## Development Credentials (Dev Only)

- username: `admin`
- password: `admin123!`

These credentials are seeded automatically by backend startup for local development only.

## Runbook

1. Bootstrap dependencies:

```bash
make bootstrap
```

2. Start full stack:

```bash
make dev
```

3. Open services:
- Frontend: `http://localhost:3000`
- Backend health: `http://localhost:8000/health`
- LocalStack edge: `http://localhost:4566`

4. Verify project checks:

```bash
make verify
```

## Sprint 0 API

- `GET /health` (no auth)
- `POST /api/v1/token` (OAuth2 password flow)
- `GET /api/v1/me` (auth required)

RBAC roles: `viewer`, `analyst`, `admin`.

## Safety Notes

- LocalStack is an emulator and should only be used with fake development credentials.
- Do not use real cloud account keys, real customer data, or production secrets in this repo.
- Keep `.env` local and out of source control; `.env.example` is safe defaults only.
