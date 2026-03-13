# commit

Generate a conventional commit message and commit staged files after approval. Arguments can control what gets staged (e.g. staged, file list, or `add .`).

---

Input: $ARGUMENTS

---

## Determining What to Stage

Based on the input provided, determine what to stage before committing:

1. **No arguments (default)** or **`staged`**: Do not run `git add`. Proceed with the currently staged files only.

2. **List of paths** (e.g. `foo.md`, `src/a.txt`, `list.md of.ext files.txt`): Treat each space-separated token as a path. Run `git add <path1> <path2> ...`, then proceed with staged changes.

3. **Git add-style** (e.g. `add .`, `add -A`, `add -u`): If the input is literally `add` or starts with `add `, treat it as a git add command. Run that exact command (e.g. `git add .`), then proceed with staged changes.

If both paths and something like `add .` appear, treat the whole input as the git add command when `add` is present with options; otherwise treat tokens as paths.

After staging (or when no staging was requested), if nothing is staged, inform the user and do not attempt a commit.

---

## Workflow

Once staging is settled:

1. **Inspect staged changes**
   - Run `git status` and `git diff --cached`
   - If changes mix concerns or are mostly formatting noise, ask the user to split or adjust staging
   - If nothing is staged, say so and stop

2. **Choose type and scope**
   - Infer type from the diff (feat, fix, refactor, docs, test, chore, build, ci, perf, style); scope optional (e.g. api, auth, deps)

3. **Draft the commit message**
   - Use Conventional Commits: `type(optional-scope): summary`
   - Summary: imperative, 50–72 chars, no trailing period; optional body and footers as needed
   - Ensure the message matches the diff; no vague summaries (update, fix stuff, wip, changes)
   - Put the message in a fenced code block and ask the user to accept

4. **Confirm and commit**
   - **On approval only**: Run `git commit -m "<summary>"` and, if needed, extra `-m "<body>"` / `-m "<footer>"`
   - Use **only** `-m`; never use `-a` or commit unstaged/untracked files
   - If the user declines, revise the message or wait for input
   - If the commit fails, report the error and stop

---

use ~/.cursor/agents/git-commit.md
use ~/.cursor/skills/git-commit-assistant/SKILL.md
