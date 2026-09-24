---
name: gitops
description: Use when implementing GitOps workflows with ArgoCD or Flux for continuous deployment to Kubernetes.
---

# GitOps

## When to Use This Skill
- Deploying to Kubernetes from Git commits
- Setting up ArgoCD or Flux for continuous delivery
- Managing Kubernetes manifests with Git as the source of truth
- Implementing drift detection and reconciliation

## Workflow
1. Store Kubernetes manifests or Helm charts in a Git repository
2. Install ArgoCD or Flux in the target cluster
3. Create an Application resource pointing to the Git repo and target namespace
4. Configure sync policy: automated or manual, with pruning and self-heal
5. Set up image update automation for continuous delivery
6. Monitor sync status in the ArgoCD dashboard or Flux CLI
7. Test by making a manifest change and verifying automatic deployment
8. Implement rollback by reverting the Git commit

## Rules
- Never kubectl apply directly in production — Git is the source of truth
- Use sealed secrets or external secret managers for sensitive values
- Enable pruning to remove resources deleted from Git
- Use branch protection rules to prevent unauthorized manifest changes
- Test manifest changes in a staging environment before merging
- Monitor sync status and alert on drift
