#!/bin/bash

# scripts/ralph-once.sh - Single iteration of the Ralph Loop (HITL)

# 1. Configuration
CONTEXT_FILES="@specs/ @tasks/backlog.md @tasks/progress.txt"

# 2. The Ralph Prompt (Incorporating AI Hero Tips)
PROMPT="You are operating in a Ralph Loop. Follow these instructions strictly:

1. DECIDE: Read 'tasks/backlog.md' (source of truth). Pick the next task with '[passes: false]'. Prioritize architectural decisions and integration points over polish.
2. CONTEXT: Refer to relevant specs in 'specs/' and '.pi/AGENTS.md' to ensure implementation matches requirements and quality standards.
3. EXECUTE: Implement the task in a SINGLE small, logical step. One logical change per commit. If a task is too large, break it down.
4. QUALITY: Before committing, run 'scripts/lint.sh' and any available tests. If they fail, fix the issues.
5. LOG: Append a concise summary to 'tasks/progress.txt' (Task completed, key decisions, notes for next run).
6. COMMIT: Make a git commit of your changes.
7. COMPLETE: If all work in the backlog is finished, output <promise>COMPLETE</promise>.

ONLY WORK ON ONE FEATURE PER ITERATION. Quality over speed. Fight entropy."

# 3. Execution
# Note: Using 'pi' as the agent runner
# We pass the prompt as the first argument, and file paths are handled by the agent's context loading
pi "Follow the instructions in the attached files to complete the next task.
$PROMPT" "specs/" "tasks/backlog.md" "tasks/progress.txt"
