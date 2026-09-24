---
name: sre-practices
description: Use when defining SLOs, building runbooks, conducting postmortems, or reducing toil in production systems.
---

# SRE Practices

## When to Use This Skill
- Defining SLOs and error budgets for a service
- Writing runbooks for common failure scenarios
- Conducting blameless postmortems after incidents
- Identifying and reducing toil in operations

## Workflow
1. Define SLIs: what you measure (latency, error rate, throughput)
2. Set SLOs: the target for each SLI (99.9% availability, p99 < 500ms)
3. Calculate the error budget: 100% - SLO = allowed failures
4. Write runbooks for the top 5 failure scenarios
5. After an incident: conduct a blameless postmortem within 48 hours
6. Identify toil: repetitive, manual, automatable tasks
7. Automate toil: write scripts or tools to eliminate manual steps
8. Review error budget consumption monthly — adjust SLOs if needed

## Rules
- Focus on user-facing SLIs, not internal metrics
- Make SLOs achievable — don't set 100% as the target
- Postmortems should blame systems, not people
- Every runbook should have: symptoms, diagnosis, mitigation, and resolution
- Track toil volume — if it's growing, something is wrong
- Use error budget to decide between reliability work and feature work
