---
name: debug-logging-assistant
description: Adds purposeful debug logging for observability without changing behavior. Use when adding or improving logs around flow, branching, external calls, or error context.
---

# Debug Logging Assistant

## Core Rules

- **Add logs only**; do not change control flow, data, or logic.
- Place logs where they clarify flow, inputs, branching, retries, or error context—not on every step.
- Keep messages small and descriptive: what is happening, key identifiers (IDs, counts), and outcomes.
- Do not log sensitive data; use safe identifiers or summaries only.

## Where to Log

- Entry points and exit conditions.
- Before/after external calls (APIs, DB, I/O).
- Branching and decisions that affect downstream behavior.
- Retries and error-handling paths.

## Message Style

- Match existing log levels and prefixes in the codebase (e.g. `debug`, `trace`).
- One concise log per logical block; avoid low-value or redundant messages.
- Capture intent: action, relevant inputs, outcome (success/failure, counts).
- Do not narrate trivial steps or restate obvious code.

## Validation

- Confirm no functional changes: no refactors, reordered logic, or new branching.
- Keep volume reasonable; avoid spamming hot paths.
- Re-run tests if available; otherwise check for typos and correct levels.

## When to Apply

Use this skill when the user asks to add debug logging, improve observability for a bug, or make a failure path easier to diagnose.
