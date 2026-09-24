---
name: llm-prompting
description: Use when designing prompts for LLMs — system prompts, few-shot examples, chain-of-thought, structured output, or tool use patterns.
---

# LLM Prompting

## When to Use This Skill
- Writing system prompts that constrain model behavior
- Designing few-shot examples for consistent output
- Implementing chain-of-thought for complex reasoning
- Structuring output as JSON or other machine-readable formats
- Defining tool-use prompts for function calling

## Workflow
1. Define the task clearly — what input the model receives and what output is expected
2. Write a system prompt that sets role, constraints, and output format
3. Add few-shot examples (2-5) that demonstrate the desired pattern
4. For reasoning tasks, include chain-of-thought instructions: "Think step by step"
5. For structured output, provide a schema or example in the prompt
6. Test with edge cases: empty inputs, malformed data, ambiguous requests
7. Iterate on prompt based on failure modes — adjust phrasing, add constraints, or restructure examples

## Rules
- Be explicit about what the model should NOT do
- Use delimiters (XML tags, triple backticks) to separate instructions from content
- Keep prompts under the model's context window with room for the response
- Version control prompts alongside code
- Evaluate prompts with a test set, not just manual spot checks
