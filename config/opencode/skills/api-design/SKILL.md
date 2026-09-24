---
name: api-design
description: Design REST APIs that are consistent, versioned, and developer-friendly.
---

# API Design

## When to Use This Skill
Use when designing new REST endpoints, reviewing existing API contracts, or standardizing API conventions across a codebase. Applies to new APIs, major version bumps, or when inconsistency has crept into resource naming, error formats, or pagination.

## Workflow
1. Identify the resources and their relationships from the domain model or feature requirements.
2. Define resource URIs using plural nouns and hierarchical nesting (e.g., `/users/{id}/orders`).
3. Choose HTTP methods and status codes for each operation (GET, POST, PUT, PATCH, DELETE).
4. Define a consistent error response envelope with error code, message, and optional details array.
5. Add pagination (cursor or offset) for list endpoints using a standard shape (`data`, `next_cursor`, `has_more`).
6. Document filtering, sorting, and field selection query parameters.
7. Apply rate limiting headers (`X-RateLimit-Limit`, `X-RateLimit-Remaining`, `X-RateLimit-Reset`).
8. Version the API via URL path prefix (`/v1/`) or `Accept` header when breaking changes are needed.

## Rules
- Use plural nouns for resource names (`/users`, not `/getUser`).
- Return appropriate HTTP status codes: 200 success, 201 created, 204 no content, 400 client error, 404 not found, 422 validation error, 429 rate limited.
- Keep error responses uniform across all endpoints: `{ "error": { "code": "...", "message": "...", "details": [] } }`.
- Never expose internal database IDs or stack traces in responses.
- Support `Accept` header for content negotiation when serving multiple formats.
- Document every endpoint with request/response examples before merging.
