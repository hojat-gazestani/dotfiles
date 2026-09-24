---
name: ai-agent-patterns
description: Use when building AI agent architectures. Covers tool use, planning loops, memory systems, and multi-agent coordination.
---

# AI Agent Patterns

## When to Use This Skill
- Building AI agents that need to use external tools and APIs
- Designing planning loops for multi-step reasoning
- Implementing memory systems for persistent context
- Coordinating multiple agents working together
- Adding error recovery or human-in-the-loop workflows

## Workflow
1. Identify the agent's core responsibility and available tools
2. Select the appropriate agent pattern (ReAct, Plan-and-Execute, Multi-Agent)
3. Define the tool interface and return schemas
4. Implement the planning loop with explicit state management
5. Add memory layers (working memory, long-term storage, episodic)
6. Build error handling with retries, fallbacks, and human escalation
7. Test with realistic task scenarios before production deployment

## Rules
- Keep agent state explicit and serializable for debugging
- Limit tool access to what the agent actually needs
- Log all tool calls and decisions for observability
- Design for graceful degradation when tools fail
- Prefer simple single-agent patterns unless multi-agent is required
- Validate LLM outputs before executing tool calls
