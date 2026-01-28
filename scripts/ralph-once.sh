#!/bin/bash

# scripts/ralph-once.sh - Single iteration of the Ralph Loop (HITL)

# 1. Configuration
CONTEXT_FILES="@specs/ @tasks/backlog.md @tasks/progress.txt"

# 2. The Ralph Prompt (Incorporating AI Hero Tips)
PROMPT="You are operating in a Ralph Loop. Follow these instructions strictly:

1. DECIDE: Read 'tasks/backlog.md' (source of truth). Pick the next task with '[passes: false]'. Prioritize architectural decisions and integration points over polish.
2. CONTEXT: Refer to relevant specs in 'specs/' and '.pi/AGENTS.md' (LTS Laws, quality standards).
3. EXECUTE: Implement the task in a SINGLE small, logical step. Always use LTS/Stable versions of libraries.
4. QUALITY: Before committing, you MUST run 'scripts/gatekeeper.sh'. 
   - If it fails, you are in a 'Broken Build' state. 
   - Your ONLY priority is fixing the build. 
   - Do NOT commit broken code.
5. LOG: Append a concise summary to 'tasks/progress.txt' (Task completed, key decisions, notes for next run).
6. COMMIT: Make a git commit of your changes.
7. COMPLETE: If all work in the backlog is finished, output <promise>COMPLETE</promise> AND run 'touch .complete'.

ONLY WORK ON ONE FEATURE PER ITERATION. Quality over speed. Fight entropy."

# 3. Execution
# Note: Using 'pi' as the agent runner with a 15-minute timeout
# macOS compatible timeout using perl
perl -e 'alarm shift; exec @ARGV' 900 pi "Follow the instructions in the attached files to complete the next task. 
If you finish the entire backlog, you MUST create a file named '.complete' in the root directory.
$PROMPT" "specs/" "tasks/backlog.md" "tasks/progress.txt"
