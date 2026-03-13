#!/bin/sh
set -e

# Change to project root (parent of .cursor directory)
cd "$(dirname "$0")/../.."

# Run ruff import sorting
uv run ruff check app/ --select I --fix

# Run ruff formatting
uv run ruff format app/
