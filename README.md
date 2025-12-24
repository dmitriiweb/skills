# My Skills

Collection of skill definitions used by this workspace. Each skill lives in its own directory with an `SKILL.md` manifest and supporting reference material.

## Available skills
- `git-commit-assistant/`: Generate high-quality conventional git commit messages and, with approval, run commits. See `git-commit-assistant/SKILL.md` for the workflow and `git-commit-assistant/references/commit_rules.md` for the full commit rules.
- `debug-logging-assistant/`: Add meaningful debug logs without changing behavior. See `debug-logging-assistant/SKILL.md` and `debug-logging-assistant/references/logging_rules.md` for logging guidelines.
- `format-lint-assistant/`: Run the formatter and lint/mypy checks via `make format` and `make lint`, fixing issues in the required order. See `format-lint-assistant/SKILL.md` and `format-lint-assistant/references/linting_rules.md` for the workflow.
- `uv-package-management-assistant/`: Manage Python dependencies and scripts exclusively with `uv`. See `uv-package-management-assistant/SKILL.md` and `uv-package-management-assistant/references/uv_rules.md` for commands and script metadata examples.
- `pytest-testing-assistant/`: Write pytest tests as standalone functions (no test classes). See `pytest-testing-assistant/SKILL.md` and `pytest-testing-assistant/references/pytest_rules.md` for structure and naming rules.
- `google-docstring-assistant/`: Write Python docstrings in Google style, covering sections, examples, and TODOs. See `google-docstring-assistant/SKILL.md` and `google-docstring-assistant/references/google_docstring_rules.md` for guidance and examples.
- `code-review-assistant/`: Perform structured Python code reviews. See `code-review-assistant/SKILL.md` and `code-review-assistant/references/code_review_rules.md` for the review checklist and output format.

## Layout
- `SKILL.md`: Name, description, and quick-start guidance for the skill.
- `references/`: Extra docs the skill relies on. (Optional)
- `assets/`: Contains static resources (Optional)
- `scripts/`: Contains executable code that agents can run. Scripts should: python, bash, js (Optional)
- `LICENSE`: Repository license.
