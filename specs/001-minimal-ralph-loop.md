# Spec 001: Minimal Ralph Loop

## Goal

Implement a minimal environment that allows the Pi agent to run in a
"Ralph Loop" (autonomous iterations) on a project. This spec focuses on the
core scripts and directory structure required for the loop to function.

## Proposed Structure

```text
.
├── scripts/
│   ├── ralph.sh        # The looping script
│   └── ralph-once.sh   # Single iteration script (HITL)
├── specs/              # Requirement definitions (PRDs)
│   └── 000-starter.md
├── tasks/              # Progress tracking and backlog
│   ├── backlog.md      
│   └── progress.txt    # Current session progress
└── README.md
```

## Implementation Details

### 1. Scripts

- **`scripts/lint.sh`**:
  - Runs a Markdown linter (e.g., `markdownlint` or `mdl`) on the `specs/` and
    `tasks/` directories.
  - This provides "backpressure" to ensure the agent maintains high-quality
    documentation.
- **`scripts/ralph-once.sh`**:
  - Triggers `pi` (or the underlying agent) with a specific "Ralph Prompt".
  - The prompt should instruct the agent to:
    1. Read `specs/` and `tasks/backlog.md`.
    2. Pick the next task.
    3. Implement it in a small step.
    4. **Run feedback loops (`scripts/lint.sh`).**
    5. Update `tasks/progress.txt`.
    6. Commit the changes.
- **`scripts/ralph.sh`**:
  - A bash loop that calls `scripts/ralph-once.sh` for N iterations or until a
    "COMPLETE" token is found.

### 2. Ralph Prompt (Draft)

The prompt included in `ralph-once.sh` will follow the AI Hero pattern:

- Context: `@specs/ @tasks/backlog.md @tasks/progress.txt`
- Instructions:
  - "Decide which task to work on next (highest priority)."
  - "**Before committing, run `scripts/lint.sh`. If it fails, fix the issues
    before proceeding.**"
  - "Append progress to `tasks/progress.txt`."
  - "Make a git commit."
  - "ONLY WORK ON A SINGLE FEATURE."
  - "Output `COMPLETE` when finished."

## Acceptance Criteria

- [ ] `scripts/` directory exists with `ralph.sh`, `ralph-once.sh`, and
  `lint.sh`.
- [ ] Scripts are executable.
- [ ] `tasks/progress.txt` is initialized.
- [ ] Running `./scripts/ralph-once.sh` successfully triggers a `pi` session
  that attempts to read the backlog and runs the lint check.
