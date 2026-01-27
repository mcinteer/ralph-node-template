# Spec 002: Full Project Template

## Goal

Expand the minimal Ralph setup into a comprehensive project template that
follows best practices for AI-driven development. This template will include
boilerplate for project-specific agent instructions, a structured backlog, and
a pre-canned "Starter App" specification.

## Proposed Structure

```text
.
├── .pi/
│   └── AGENTS.md       # Project-specific agent instructions/overrides
├── scripts/
│   ├── ralph.sh
│   ├── ralph-once.sh
│   └── bootstrap.sh    # Script to setup local environment (venv, npm, etc)
├── specs/
│   ├── 001-identity-provider.md  # "Login with Google" spec
│   └── README.md                 # How to write specs for this project
├── tasks/
│   ├── backlog.md      # Structured TODO list (JSON or Markdown)
│   └── progress.txt
├── notes/              # Discovery, architecture, and scratchpad
└── README.md
```

## Implementation Details

### 1. `AGENTS.md` (Tip 8: Software Quality)

- Provide a standard boilerplate that sets the quality bar (e.g.,
  "Production code", "Maintainable", "Fight entropy").
- **Explicit Instruction**: "This codebase will outlive you. Fight entropy.
  Leave it better than you found it."

### 2. Ralph Prompt Refinement (Tips 3, 4, 5, 6, 7)

The `ralph-once.sh` prompt must be updated to bake in the AI Hero wisdom:

- **Prioritization (Tip 7)**: Guide the agent to prioritize Architectural
  decisions and integration points over polish.
- **Small Steps (Tip 6)**: "One logical change per commit. If a task is too
  large, break it down."
- **Scope (Tip 3)**: Use the structured `backlog.md` with `passes: false` as
  the source of truth.
- **Progress (Tip 4)**: Ensure `progress.txt` includes: Task completed, Key
  decisions, and Notes for the next iteration.
- **Feedback Loops (Tip 5)**: Explicitly require running `scripts/lint.sh` and
  any project-specific test commands before committing.

### 3. The "Login with Google" Starter Spec (`specs/001-identity-provider.md`)

- A pre-written PRD for a web application.
- Requirements:
  - Setup a basic web server (e.g., Next.js or FastAPI).
  - Implement OAuth2 flow for "Login with Google".
  - Basic profile page showing user info.
- This serves as both a test for the Ralph loop and a useful boilerplate.

### 4. `bootstrap.sh`

- A script to run once when a new project is created.
- Initializes git (if not already).
- Sets up basic folders if missing.
- Installs necessary base dependencies (e.g., `markdownlint-cli`).

### 5. Backlog Format (Tip 3)

- Adopt a structured format: Markdown with checkboxes and `[passes: false]`.
- Example: `- [ ] Implement Login Button [passes: false]`

## Acceptance Criteria

- [ ] `AGENTS.md` contains high-quality engineering standards.
- [ ] `ralph-once.sh` prompt incorporates Tips 3-8 from AI Hero.
- [ ] `specs/001-identity-provider.md` exists and is detailed enough for
  Ralph to execute.
- [ ] `bootstrap.sh` successfully prepares a new directory and installs
  linting tools.
- [ ] The structure matches the AI Hero "Golden Path".
