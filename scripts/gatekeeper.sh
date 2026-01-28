#!/bin/bash
# scripts/gatekeeper.sh - The Backpressure Runner
set -e

./scripts/backpressure/docs.sh
./scripts/backpressure/dependencies.sh

if [ -f "package.json" ]; then
  # Ralph should add his new backpressure scripts here
  # e.g., ./scripts/backpressure/database.sh
  ./scripts/backpressure/build.sh
fi

echo ""
echo "🌟 ALL BACKPRESSURE LAYERS PASSED 🌟"
