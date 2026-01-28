# Project Agent Instructions

## Quality Standards
- **Fight Entropy**: Leave the codebase cleaner than you found it.
- **Production Grade**: No "todo" comments in code. No console.logs in production paths.
- **LTS Only**: 
  - Always use Long-Term Support (LTS) versions for Node.js (v20 or v22).
  - Use stable major versions for all dependencies. 
  - **PROHIBITED**: Alpha, Beta, RC, or Experimental releases are forbidden unless explicitly requested in a spec.

## Patterns
- Next.js 15 (LTS preferred patterns)
- Auth.js v5 (Stable)
- Prisma (Stable)
- Tailwind CSS (Stable)

## Operational Modes
- **Human-in-the-Loop (HITL)**: Use `ralph-once.sh`. Run one iteration, watch the output, and intervene manually if the agent goes off-track. Use this for early architecture and complex debugging.
- **Human-on-the-Loop (HOTL)**: Use `ralph.sh`. The agent runs autonomously for a set number of iterations. You monitor the commits and progress file periodically. Use this for bulk work once the "Golden Path" is established.

## Verification
- You must run `scripts/check.sh` before every commit. 
- A failure in the check script is a failure of the task.
