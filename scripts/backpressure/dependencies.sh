#!/bin/bash
set -e

ALLOWED_UNSTABLE_FILE=".pi/allowed-unstable.txt"
EXCLUDE_PATTERN="z-z-z-z-z"

if [ -f "$ALLOWED_UNSTABLE_FILE" ]; then
  EXCLUDE_PATTERN=$(grep -v '^#' "$ALLOWED_UNSTABLE_FILE" | grep -v '^$' | paste -sd "|" -)
fi

if [ -z "$EXCLUDE_PATTERN" ]; then
  EXCLUDE_PATTERN="z-z-z-z-z"
fi

echo "Checking for unstable dependencies (excluding $EXCLUDE_PATTERN)..."
UNSTABLE_DEPS=$(grep -Ei "alpha|beta|rc|canary|experimental" package.json | grep -Ev "$EXCLUDE_PATTERN" || true)

if [ -n "$UNSTABLE_DEPS" ]; then
  echo "❌ BACKPRESSURE: Unstable dependency versions detected in package.json!"
  echo "$UNSTABLE_DEPS"
  exit 1
fi

echo "Checking for major version updates..."
npm outdated || true
echo "✅ Dependencies are stable."
