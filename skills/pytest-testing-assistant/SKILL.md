---
name: pytest-testing-assistant
description: Help write and review focused pytest tests as standalone functions (one behavior per test), avoiding test classes. Use when the user mentions pytest, tests, coverage, or wants help improving or generating tests.
---

# Pytest Testing Assistant

## Quick start

- **Style**: Write tests as plain functions; do not use test classes. Aim for one focused behavior per test function.
- **Naming**: Use `test_<unit>_<behavior>_<expected>()` style names that read like specs.
- **Structure**: Keep AAA (Arrange / Act / Assert) obvious in the test body.
- **Assertions**: Prefer one primary assertion; add secondary checks only when they clarify the outcome.
- **Setup**: Use inline setup when simple; introduce fixtures only when they clearly reduce duplication without hiding important behavior.
- **Running**: Assume tests are run with `pytest` (optionally with paths or `-k` expressions); you never need to show the full CLI unless requested.

## When to apply this skill

Use these rules whenever:

- The user asks to **create, extend, or refactor pytest tests**.
- The user asks to **increase coverage** or **add regression tests** around a bug.
- The user shares Python code and explicitly mentions **pytest** or `test_*.py` files.

If the user does not specify a framework but already has pytest in the project, assume pytest and follow this skill.

## Core principles

- **One behavior per test**: Each test should validate a single, well-defined behavior or scenario.
- **Readable over clever**: Prefer explicit setup and assertions over magic helpers or over-abstracted fixtures.
- **Isolated tests**: Tests should not depend on execution order or shared mutable state.
- **Minimal mocking**: Mock only external boundaries (network, filesystem, time, random, external services). Prefer real collaborators for simple in-memory logic.
- **Fast feedback**: Prefer unit-level tests that run quickly over slow end-to-end flows, unless the user explicitly wants integration tests.

## Test writing workflow

Follow this workflow when generating or editing pytest tests:

1. **Identify behavior**
   - Read the target function/method and infer:
     - Normal path behavior.
     - Important branches (conditionals, error handling).
     - Edge cases (empty inputs, `None`, boundary values).
   - Decide which single behavior this particular test will cover.

2. **Design the test**
   - Choose a clear name: `test_<function>_<scenario>_<expected>()`.
   - Decide whether this scenario fits into:
     - A single test with straightforward inputs, or
     - A parametrized test if you have a small matrix of input/output pairs.

3. **Write the test body**
   - Use a plain function:
     ```python
     def test_<function>_<scenario>_<expected>():
         # arrange
         ...
         # act
         result = ...
         # assert
         assert result == ...
     ```
   - Keep arrange/act/assert visually separated (blank lines and comments are fine).
   - Inline simple setup; only introduce fixtures if multiple tests obviously share the same setup.

4. **Assertions**
   - Use direct, explicit assertions:
     - `assert value == expected`
     - `assert "error" in str(exc.value)`
     - `assert len(items) == 3`
   - For exceptions, use `pytest.raises` as a context manager:
     ```python
     import pytest

     def test_<function>_raises_on_invalid_input():
         with pytest.raises(ValueError):
             ...
     ```
   - Avoid asserting many unrelated things in one test; split into separate tests when in doubt.

5. **Parametrization**
   - When several inputs share the same structure and expectation shape, use `@pytest.mark.parametrize`:
     ```python
     import pytest

     @pytest.mark.parametrize(
         "input_value, expected",
         [
             ("a", 1),
             ("bbb", 3),
         ],
     )
     def test_length(input_value, expected):
         assert len(input_value) == expected
     ```
   - Keep parametrized data small and readable. If many cases are needed, group them logically or split into multiple parametrized tests.

6. **Fixtures**
   - Introduce fixtures only when:
     - The same setup is repeated across multiple tests, and
     - Inlining that setup makes tests noisy or hard to read.
   - Keep fixtures simple and explicit:
     ```python
     import pytest

     @pytest.fixture
     def user():
         return User(id=1, name="Alice")
     ```
   - Do not hide important behavior inside fixtures; tests must stay understandable when read top-to-bottom.

7. **Running and iterating**
   - Assume the user runs `pytest` or a subset (`pytest path/to/test_file.py`, `pytest -k "pattern"`).
   - If a test fails in your generated code, adjust names, setup, or expectations to match the implementation and clarified behavior.

## Review checklist for generated tests

When you generate or modify tests, verify:

- **Focus**
  - Each test covers one behavior or scenario.
  - Test names clearly state the scenario and expected outcome.

- **Readability**
  - AAA structure is obvious.
  - No unnecessary indirection (fixtures or helpers) obscuring the behavior.

- **Correctness**
  - Assertions match the actual behavior described or implied by the code.
  - Edge cases and error paths are covered when they matter (boundary values, invalid inputs).

- **Pytest idioms**
  - Use `pytest.raises` for exceptions.
  - Use parametrization instead of manual loops inside tests.
  - Prefer functions over test classes, unless the existing codebase clearly uses classes and the user wants consistency.

## Examples

### Simple behavior test

```python
def test_increment_returns_value_plus_one():
    # arrange
    value = 3

    # act
    result = increment(value)

    # assert
    assert result == 4
```

### Exception behavior

```python
import pytest


def test_divide_raises_on_zero_divisor():
    with pytest.raises(ZeroDivisionError):
        divide(1, 0)
```

### Parametrized behavior

```python
import pytest


@pytest.mark.parametrize(
    "text, expected_length",
    [
        ("", 0),
        ("a", 1),
        ("hello", 5),
    ],
)
def test_length_matches_expected(text, expected_length):
    assert len(text) == expected_length
```

