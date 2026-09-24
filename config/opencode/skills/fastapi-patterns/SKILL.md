---
name: fastapi-patterns
description: Use when building FastAPI applications with Pydantic models, async endpoints, dependency injection, or background tasks.
---

# FastAPI Patterns

## When to Use This Skill
- Building async REST APIs with FastAPI
- Defining request/response models with Pydantic
- Using dependency injection for shared logic
- Adding background tasks, WebSockets, or middleware
- Generating OpenAPI documentation

## Workflow
1. Create the app: `app = FastAPI()`
2. Define Pydantic models for request and response schemas
3. Add endpoints: `@app.get("/items/{id}")` with typed parameters
4. Use dependencies: `def get_db() -> Generator` injected with `Depends()`
5. Add background tasks: `BackgroundTasks.add_task(send_email, ...)`
6. For WebSockets: `@app.websocket("/ws")` with async handler
7. Run: `uvicorn app:app --reload`
8. Test with the auto-generated docs at `/docs`

## Rules
- Always use Pydantic models for request validation, never manual checks
- Keep endpoints async when they do I/O — avoid blocking the event loop
- Use dependency injection for database sessions and auth checks
- Return proper HTTP status codes: 201 for creation, 404 for not found
- Document non-200 responses with `response_model` and status codes
- Use `Depends` for reusable logic, not helper functions in endpoints
