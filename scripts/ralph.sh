#!/bin/bash

# scripts/ralph.sh - Automated Ralph Loop (Visible & Simple)

if [ -z "$1" ]; then
  echo "Usage: ./scripts/ralph.sh <iterations>"
  exit 1
fi

ITERATIONS=$1
SCRIPT_DIR=$(dirname "$0")

for ((i=1; i<=$ITERATIONS; i++)); do
  echo "--- Ralph Iteration $i of $ITERATIONS ---"
  
  # Run once visibly in the current terminal
  "$SCRIPT_DIR/ralph-once.sh"
  
  # Check for the completion signal file
  if [ -f ".complete" ]; then
    echo "🌟 Backlog complete. Removing signal file and exiting."
    rm ".complete"
    exit 0
  fi
done

echo "Reached max iterations ($ITERATIONS)."
