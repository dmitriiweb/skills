---
name: git-commit-assistant
description: Generates and reviews conventional git commit messages. Use when drafting or refining commit messages for staged changes, or checking commit quality.
---

# Git Commit Assistant

## Core Rules

- Prefer **Conventional Commits** style: `type(optional-scope): summary`.
- Keep each commit focused on a **single concern**; avoid kitchen-sink commits.
- Do **not** auto-run git commands unless the user explicitly asks for them.

## Commit Message Structure

- **type**: one of `feat`, `fix`, `refactor`, `docs`, `test`, `chore`, `build`, `ci`, `perf`, `style`.
- **scope** (optional): short area label, e.g. `auth`, `api`, `deps`.
- **summary**:
  - Imperative, no trailing period.
  - ~50 characters, hard-wrap body at ~72 if present.
  - Describe what changed and why at a high level; avoid implementation noise.
- **body** (optional but encouraged when non-trivial):
  - Explain motivation, decisions, and trade-offs.
  - Call out important side effects, migrations, or constraints.
- **footers** (when relevant):
  - Breaking changes (`BREAKING CHANGE: ...`).
  - Issue references (`Closes #123`), migration notes, etc.

## Workflow for This Skill

1. **Inspect changes**
   - Assume staged changes represent what will be committed.
   - If the described changes mix unrelated concerns (features + formatting), suggest splitting.

2. **Choose type and scope**
   - Infer `type` from the nature of the change (feature, bugfix, refactor, etc.).
   - Pick a concise `scope` only if it adds clarity.

3. **Draft the commit message**
   - Produce a complete Conventional Commit header and, where helpful, body and footers.
   - Ensure the message intent matches the described diff.
   - Avoid vague summaries like `update`, `misc changes`, `fix stuff`, `wip`.

4. **Present the result**
   - Return the commit message in a fenced code block for easy copy-paste.
   - Optionally offer 1–2 alternative summaries if the intent is ambiguous.

Use this skill whenever the user is about to commit or asks for a better commit message; focus on clarity, intent, and a clean history over verbosity.

