#!/bin/bash

# scripts/ralph.sh - Automated Ralph Loop (AFK)

if [ -z "$1" ]; then
  echo "Usage: ./scripts/ralph.sh <iterations>"
  exit 1
fi

ITERATIONS=$1

for ((i=1; i<=$ITERATIONS; i++)); do
  echo "--- Ralph Iteration $i of $ITERATIONS ---"
  
  # Run a single iteration and capture output
  # We check the output for the COMPLETE token
  RESULT=$(./scripts/ralph-once.sh)
  
  echo "$RESULT"

  if [[ "$RESULT" == *"<promise>COMPLETE</promise>"* ]]; then
    echo "Backlog complete. Exiting."
    exit 0
  fi
done

echo "Reached max iterations ($ITERATIONS)."
