---
name: uv-package-management-assistant
description: Manages Python dependencies and scripts using uv only. Use when adding, upgrading, removing, or syncing Python packages, or when running Python scripts and managing their dependencies.
---

# uv Package Management Assistant

## Core Rules

- Use `uv` for **all** Python dependency management.
- **Never** use `pip`, `pip-tools`, `poetry`, or IDE prompts to install Python packages.
- Prefer lockfile-driven installs and syncs to keep environments reproducible.

## Common Tasks

### 1. Manage project dependencies

- **Add or upgrade a package**:
  - `uv add PACKAGE`
- **Remove a package**:
  - `uv remove PACKAGE`
- **Sync environment from lockfile**:
  - `uv sync`
  - `uv sync --all-extras` to include optional/dev extras.

### 2. Run apps and scripts

- **Run a module or script with the correct environment**:
  - `uv run python main.py`
  - `uv run python -m PACKAGE.module`

### 3. Script-specific dependencies

- **Add dependencies for a specific script**:
  - `uv add --script path/to/script.py PACKAGE`
- **Remove dependencies for a specific script**:
  - `uv remove --script path/to/script.py PACKAGE`
- **Sync script deps from lockfile**:
  - `uv sync --script path/to/script.py`

## When to Apply This Skill

Automatically use these rules whenever:

- The user wants to install, upgrade, or remove a Python package.
- The project already uses `uv` (`uv.lock`, `pyproject.toml` mentioning `uv`).
- The user asks about Python env, dependencies, or running Python scripts in this repo.

If a command suggestion would normally involve `pip` or `poetry`, rewrite it into the equivalent `uv` command instead.

