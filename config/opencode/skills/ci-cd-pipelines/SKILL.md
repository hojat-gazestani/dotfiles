---
title: "CI/CD Pipelines"
catalogNumber: "No. 156"
tagline: "Ship code with confidence"
description: "Build production CI/CD pipelines — GitHub Actions, testing strategies, deployment gates, rollback patterns, and infrastructure as code."
category: devops
version: "1.0.0"
license: "MIT"
triggers:
  - "setting up CI/CD"
  - "GitHub Actions workflow"
  - "deployment pipeline"
  - "automated testing in CI"
  - "infrastructure as code"
downloadFile: "ci-cd-pipelines.zip"
contents:
  - "SKILL.md"
  - "references/github-actions-patterns.md"
  - "references/deployment-strategies.md"
---

CI/CD isn't just about automation — it's about confidence. A good
pipeline catches bugs before they reach production and makes deploys
boring and predictable.

## GitHub Actions workflow

```yaml
name: CI/CD Pipeline
on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

concurrency:
  group: ${{ github.workflow }}-${{ github.ref }}
  cancel-in-progress: true

jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: pnpm/action-setup@v2
      - uses: actions/setup-node@v4
        with:
          node-version: 22
          cache: pnpm
      - run: pnpm install --frozen-lockfile
      - run: pnpm lint
      - run: pnpm typecheck

  test:
    runs-on: ubuntu-latest
    needs: lint
    steps:
      - uses: actions/checkout@v4
      - uses: pnpm/action-setup@v2
      - uses: actions/setup-node@v4
        with:
          node-version: 22
          cache: pnpm
      - run: pnpm install --frozen-lockfile
      - run: pnpm test -- --coverage
      - uses: codecov/codecov-action@v3
        with:
          files: ./coverage/lcov.info

  build:
    runs-on: ubuntu-latest
    needs: test
    steps:
      - uses: actions/checkout@v4
      - uses: pnpm/action-setup@v2
      - uses: actions/setup-node@v4
        with:
          node-version: 22
          cache: pnpm
      - run: pnpm install --frozen-lockfile
      - run: pnpm build
      - uses: actions/upload-artifact@v4
        with:
          name: dist
          path: dist/

  deploy-staging:
    runs-on: ubuntu-latest
    needs: build
    if: github.ref == 'refs/heads/main'
    environment: staging
    steps:
      - uses: actions/download-artifact@v4
        with:
          name: dist
          path: dist/
      - run: npx wrangler pages deploy dist/ --project-name=staging

  deploy-production:
    runs-on: ubuntu-latest
    needs: deploy-staging
    if: github.ref == 'refs/heads/main'
    environment: production
    steps:
      - uses: actions/download-artifact@v4
        with:
          name: dist
          path: dist/
      - run: npx wrangler pages deploy dist/ --project-name=production
```

## Deployment strategies

```markdown
## Blue-Green deployment
- Two identical environments (blue = current, green = new)
- Deploy to green, run smoke tests, switch traffic
- Instant rollback by switching back to blue
- Best for: databases, stateful services

## Canary deployment
- Deploy to 5% of users first
- Monitor error rates and performance
- Gradually increase to 100%
- Best for: high-traffic services

## Rolling deployment
- Replace instances one at a time
- Monitor each replacement before proceeding
- Best for: Kubernetes, ECS

## Feature flags
- Deploy code to production, hide behind flag
- Enable for internal users first
- Gradually roll out to all users
- Best for: large features, A/B testing
```

## Rollback patterns

```typescript
// Automatic rollback on health check failure
async function deployWithHealthCheck(
  deployFn: () => Promise<void>,
  healthCheckFn: () => Promise<boolean>,
  rollbackFn: () => Promise<void>
): Promise<void> {
  await deployFn();

  // Wait for health check to stabilize
  for (let i = 0; i < 10; i++) {
    await sleep(5000);
    const healthy = await healthCheckFn();
    if (healthy) {
      console.log('Deployment healthy');
      return;
    }
  }

  // Health check failed — rollback
  console.error('Health check failed, rolling back');
  await rollbackFn();
}
```

## Matrix testing

```yaml
strategy:
  matrix:
    node-version: [18, 20, 22]
    os: [ubuntu-latest, windows-latest]
    exclude:
      - os: windows-latest
        node-version: 18
    include:
      - os: ubuntu-latest
        node-version: 22
        experimental: true
  fail-fast: false
```

## Secrets management

```yaml
# Use GitHub Actions secrets
steps:
  - name: Deploy
    env:
      AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
      AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
    run: aws s3 sync dist/ s3://my-bucket/

# Use OIDC for cloud providers (no long-lived secrets)
permissions:
  id-token: write
  contents: read
steps:
  - uses: aws-actions/configure-aws-credentials@v4
    with:
      role-to-assume: arn:aws:iam::123456789:role/deploy
      aws-region: us-east-1
```

## CI/CD checklist

```markdown
## Pipeline
- [ ] Lint on every push
- [ ] Typecheck on every push
- [ ] Unit tests on every push
- [ ] Integration tests on PR
- [ ] Build on main branch
- [ ] Deploy to staging on main
- [ ] Deploy to production with approval gate

## Quality gates
- [ ] No lint errors
- [ ] No type errors
- [ ] Test coverage > 80%
- [ ] Build succeeds
- [ ] No critical vulnerabilities (Trivy/Snyk)
- [ ] Lighthouse score > 90

## Security
- [ ] Secrets stored in GitHub Secrets
- [ ] No secrets in logs
- [ ] OIDC for cloud authentication
- [ ] Dependabot enabled
- [ ] CodeQL analysis enabled

## Monitoring
- [ ] Deployment notifications (Slack/Discord)
- [ ] Health check verification
- [ ] Error rate monitoring
- [ ] Performance regression detection
```

## Anti-patterns

- Don't skip tests in CI to "save time" — that's how bugs ship
- Don't use long-lived cloud credentials — use OIDC
- Don't deploy to production without a staging environment
- Don't skip rollback testing — practice failing gracefully
- Don't ignore flaky tests — fix them or quarantine them
