---
name: kubernetes
description: Use when writing Kubernetes manifests, managing deployments, or debugging pod issues in a cluster.
---

# Kubernetes

## When to Use This Skill
- Writing Deployment, Service, and Ingress manifests
- Managing rolling updates and rollbacks
- Configuring HPA for autoscaling
- Debugging pod crashes, OOMKills, or scheduling issues

## Workflow
1. Write the Deployment manifest with container image, replicas, and resource requests
2. Create a Service to expose the deployment (ClusterIP, NodePort, or LoadBalancer)
3. Add an Ingress for external access with routing rules
4. Set up HPA: `kubectl autoscale deployment <name> --min=2 --max=10 --cpu-percent=80`
5. Deploy: `kubectl apply -f manifests/`
6. Verify: `kubectl get pods`, `kubectl describe deployment <name>`
7. For updates: set a new image and apply — Kubernetes rolls out incrementally
8. Debug: `kubectl logs <pod>`, `kubectl describe pod <pod>`, `kubectl exec -it <pod> -- sh`

## Rules
- Always set resource requests and limits — pods without them can starve the node
- Use liveness and readiness probes — don't route traffic to unready pods
- Use namespaces to separate environments and teams
- Don't use `latest` tag — pin specific image versions
- Keep manifests in Git, not manual kubectl commands
- Set PodDisruptionBudgets for critical services
