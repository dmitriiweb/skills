---
name: subagent-creator
description: Create, configure, and document custom Claude Code subagents, including choosing scope, defining YAML frontmatter, selecting tools, model, permission mode, hooks, and usage examples.
---

# Subagent Creator

## Gather requirements

- Identify the subagent's purpose and delegation trigger.
- Decide whether the subagent should be read-only or allowed to edit/write files.
- Choose a model (`auto`, `sonnet`, `opus`, `haiku`, or `inherit`).
- Decide whether hooks are needed for validation or cleanup.

## Choose scope and location

- Use the `--agents` CLI flag for session-only subagents.
- Use `.claude/agents/` for project subagents and commit them.
- Use `~/.claude/agents/` for user subagents.

## Create the subagent

### Option A: Interactive UI

- Run `/agents`.
- Create a new agent and pick the scope.
- Provide a clear description for when to delegate.
- Select tools, model, and color.
- Save and reload if prompted.

### Option B: Manual file creation

- Create `<agent-name>.md` in the chosen scope directory.
- Add YAML frontmatter with required fields and optional config fields.
- Write a focused system prompt in the body.
- Restart the session or run `/agents` to load the new file.

Example:

```markdown
---
name: code-reviewer
description: Expert code review specialist. Use after code changes to review quality, security, and maintainability.
tools: Read, Grep, Glob, Bash
model: auto
permissionMode: default
---

Review recent changes. Focus on correctness, security, and readability. Provide prioritized findings.
```

## Configure capabilities

- Use `tools` to allowlist specific tools; omit `tools` to inherit all.
- Use `disallowedTools` to deny specific tools.
- Set `permissionMode` to control approvals (`default`, `acceptEdits`, `dontAsk`, `bypassPermissions`, or `plan`).
- Define `hooks` in frontmatter with `PreToolUse`, `PostToolUse`, or `Stop`.

## Validate and test

- Ensure `name` is lowercase with hyphens and unique per scope.
- Ensure the description clearly matches the intended delegation trigger.
- Invoke the subagent explicitly and confirm behavior.
- Refine tools, prompt, and hooks based on results.

## Provide usage examples

- Include 1-2 short prompts that should trigger the subagent.
- Keep examples aligned with the description.
