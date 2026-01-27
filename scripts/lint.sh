#!/bin/bash

# scripts/lint.sh - Backpressure for documentation quality
# Currently checks all markdown files in specs/ and tasks/

LINTER=""

if [ -f "./node_modules/.bin/markdownlint" ]; then
  LINTER="./node_modules/.bin/markdownlint"
elif command -v markdownlint &> /dev/null; then
  LINTER="markdownlint"
elif command -v mdl &> /dev/null; then
  LINTER="mdl"
fi

if [ -z "$LINTER" ]; then
  echo "Error: No markdown linter found. Please install 'mdl' or 'markdownlint-cli'."
  exit 1
fi

echo "Running $LINTER on documentation..."
$LINTER specs/*.md tasks/*.md
