# Sprint 0 Research Notes

## Related Repositories

- localstack-security: https://github.com/localstack-samples/localstack-security
- localstack-security-lab: https://github.com/localstack-samples/localstack-security-lab

## Differences and Positioning

- `localstack-security` is oriented toward sample security checks and service interactions. It is useful as a compact reference for API patterns and AWS-like service behavior in LocalStack.
- `localstack-security-lab` is oriented toward workshop/lab-style exercises with guided scenarios, making it better for training flows and reproducible learning steps.
- StackGuard Sprint 0 intentionally differs from both by focusing on product scaffolding:
  - monorepo service layout (`backend`, `worker`, `frontend`, `infra`, `docs`)
  - authenticated API foundation with RBAC and seed admin for development
  - baseline UI shell for operations pages
  - verify-able local developer workflow (`make verify`)

This gives StackGuard a runnable platform foundation, while the two references remain useful for future scenario content and security rule inspiration.
