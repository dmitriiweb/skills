---
name: google-docstring-assistant
description: Writes and reviews Python docstrings in Google style. Use when creating or updating docstrings for Python functions, methods, classes, or modules.
---

# Google Docstring Assistant

## Core Rules

- Use the **Google Python Style Guide** for all Python docstrings.
- Structure docstrings with clear sections such as: `Args:`, `Returns:`, `Raises:`, `Attributes:`, `Examples:`, `Todo:`.
- When type hints exist in code, **do not repeat types** in docstrings unless it significantly improves clarity.

## How to Format Docstrings

- **General layout**:
  - Summary line on the first line.
  - Optional blank line, then detailed description.
  - Section headers (`Args:`, `Returns:`, etc.) start at the left margin.
  - Section contents are indented under the header.
- **Args**:
  - One line per parameter: `name: description...`
  - Mention important semantics, defaults, and expectations; skip types if code is annotated.
- **Returns / Yields**:
  - Use `Returns:` for regular functions, `Yields:` for generators.
  - Describe what is returned, not how.
- **Raises**:
  - List each exception and the condition: `ValueError: If ...`
- **Attributes** (for classes/modules):
  - Document important attributes in a single `Attributes:` section when used.
- **Examples**:
  - Start with `Examples:`.
  - Use indented code blocks; keep them minimal and realistic.

## When to Apply This Skill

- The user asks to add or fix Python docstrings.
- You generate or refactor Python functions/classes and need docstrings.
- You review existing docstrings for consistency and quality.

Always prefer concise, precise language and consistent Google-style formatting across the file or project.

