#!/bin/bash
set -e

echo "--- Layer 0: LTS & Stability Check ---"
# Check for alpha/beta/rc/experimental in package.json (excluding next-auth)
if grep -v "next-auth" package.json | grep -E "alpha|beta|rc|experimental"; then
  echo "Error: Unstable dependency versions detected in package.json!"
  exit 1
fi

echo "--- Layer 1: Markdown Linting ---"
if command -v markdownlint &> /dev/null; then
  markdownlint specs/*.md tasks/*.md
else
  echo "Skipping markdown lint (not installed)."
fi

echo "--- Layer 2: Prisma Check ---"
if [ -f "prisma/schema.prisma" ]; then
  npx prisma validate
  npx prisma generate
  # Backpressure: Ensure the database tables actually exist
  npx prisma db push --accept-data-loss
fi

echo "--- Layer 3: Type Check & Build ---"
if [ -f "package.json" ]; then
  npm run build
fi
