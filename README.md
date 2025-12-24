# My Skills

Collection of skill definitions used by this workspace. Each skill lives in its own directory with an `SKILL.md` manifest and supporting reference material.

## Available skills
- `git-commit-assistant/`: Generate high-quality conventional git commit messages and, with approval, run commits. See `git-commit-assistant/SKILL.md` for the workflow and `git-commit-assistant/references/commit_rules.md` for the full commit rules.
- `debug-logging-assistant/`: Add meaningful debug logs without changing behavior. See `debug-logging-assistant/SKILL.md` and `debug-logging-assistant/references/logging_rules.md` for logging guidelines.
- `format-lint-assistant/`: Run the formatter and lint/mypy checks via `make format` and `make lint`, fixing issues in the required order. See `format-lint-assistant/SKILL.md` and `format-lint-assistant/references/linting_rules.md` for the workflow.
- `code-review-assistant/`: Perform structured Python code reviews. See `code-review-assistant/SKILL.md` and `code-review-assistant/references/code_review_rules.md` for the review checklist and output format.

## Layout
- `SKILL.md`: Name, description, and quick-start guidance for the skill.
- `references/`: Extra docs the skill relies on.
- `LICENSE`: Repository license.

## Adding a new skill
Create a new directory, add `SKILL.md` to describe the skill, and include any supporting docs under a `references/` subdirectory.
