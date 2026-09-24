---
name: mcp-development
description: Use when building MCP servers that expose tools, resources, or prompts for AI agents via the Model Context Protocol.
---

# MCP Development

## When to Use This Skill
- Building an MCP server to expose external APIs to AI agents
- Implementing tools that agents can call
- Providing resources (files, data) that agents can read
- Defining prompt templates for agent workflows

## Workflow
1. Install the MCP SDK: `pip install mcp` or `npm install @modelcontextprotocol/sdk`
2. Create a server instance with a name and version
3. Define tools with `@server.tool()` — specify name, description, and input schema
4. Define resources with `@server.resource()` — specify URI template and content type
5. Implement tool handlers that perform the actual work and return results
6. Add error handling: return structured error responses, never throw raw exceptions
7. Test with the MCP Inspector or a compatible client
8. Deploy as a stdio process or HTTP endpoint depending on the client

## Rules
- Keep tool descriptions clear and specific — agents use them to decide when to call
- Validate all inputs before processing — don't trust agent-provided parameters
- Return structured output (JSON) when possible, plain text otherwise
- Implement timeouts for long-running operations
- Log tool invocations for debugging and auditing
- Don't expose destructive operations without confirmation mechanisms
