#!/bin/bash
set -e

if [ -f "package.json" ]; then
  if grep "\"build\":" package.json > /dev/null; then
    echo "Running Production Build..."
    npm run build
    echo "✅ Build successful."
  else
    echo "No build script found. Skipping."
  fi
else
  echo "No package.json found. Skipping."
fi
