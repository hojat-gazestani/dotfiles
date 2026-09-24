---
name: ci-cd
description: Use when building or improving CI/CD pipelines with GitHub Actions, GitLab CI, or other CI platforms.
---

# CI/CD Pipelines

## When to Use This Skill
- Setting up a new CI/CD pipeline for a project
- Improving build speed with caching and matrix builds
- Configuring deployment strategies (blue-green, canary, rolling)
- Managing secrets and artifacts in CI

## Workflow
1. Choose the CI platform: GitHub Actions, GitLab CI, Jenkins, or CircleCI
2. Define triggers: push, pull_request, schedule, or manual
3. Set up the job: runner type, language runtime, and dependencies
4. Add caching: cache dependency directories keyed by lockfile hash
5. Configure matrix builds for multiple OS or language versions
6. Add steps: lint, test, build, deploy — in that order
7. Configure deployment: environment targets, approval gates, and rollback
8. Store secrets in the CI platform's secret store, never in code

## Rules
- Cache dependencies aggressively — it's the biggest speed win
- Fail fast: run lint and typecheck before tests
- Use matrix builds to test on multiple platforms in parallel
- Never log secrets — use the platform's secret masking
- Require status checks to pass before merging to main
- Keep pipelines under 10 minutes — split long jobs if needed
