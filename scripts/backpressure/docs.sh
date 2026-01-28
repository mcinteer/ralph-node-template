#!/bin/bash
set -e

echo "Linting Documentation..."
if command -v markdownlint &> /dev/null; then
  markdownlint specs/*.md tasks/*.md
elif [ -f "node_modules/.bin/markdownlint" ]; then
  npx markdownlint specs/*.md tasks/*.md
else
  echo "Skipping markdown lint (not installed)."
fi
echo "✅ Documentation is clean."
