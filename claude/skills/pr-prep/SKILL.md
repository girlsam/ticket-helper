---
name: pr-prep
description: Final checks and a plain-language PR description for a ticket branch. Does not push or open the PR without asking.
argument-hint: "[ticket-id]"
disable-model-invocation: true
---

# Prepare the PR

Ticket: $ARGUMENTS

## Steps
1. Run the full checks from `learn.md` (typecheck, lint, tests). Report the real results.
2. Show `git diff --stat` against the base. Flag any file that isn't in `plan.md`.
3. Check every "What done looks like" item in `sketch.md`. Mark each met, not met, or not verified.
4. Use the repo's PR template if one exists (`.github/pull_request_template.md` or similar). Otherwise write:
   ```
   ## What and why
   Plain words. Link the ticket.
   ## How to test
   Steps a reviewer can follow.
   ## Screenshots
   (placeholder if UI changed)
   ## Risk
   What could break. Flags. Rollback.
   ## Notes for reviewers
   Decisions made, open questions, anything I want eyes on.
   ```
   Save it to `~/work-notes/tickets/<ticket-id>/pr.md`.
5. Give me the push and PR commands. Ask before running them.

## Rules
- No hype in the description. Describe what changed, not how great it is.
- Don't claim anything you didn't verify.
