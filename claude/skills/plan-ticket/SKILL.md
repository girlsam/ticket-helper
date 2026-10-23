---
name: plan-ticket
description: Turn a sketched ticket into a small, ordered implementation plan that follows existing repo patterns. Waits for my approval.
argument-hint: "[ticket-id]"
disable-model-invocation: true
---

# Plan a ticket

Ticket: $ARGUMENTS

## Steps
1. Read `sketch.md` and `learn.md` in `~/work-notes/tickets/<ticket-id>/`.
2. If blocking questions in `sketch.md` are unanswered, list them and stop. Exception: I told you to proceed with stated assumptions. Then write those assumptions at the top of the plan.
3. Write `plan.md` (template below).
4. Show me the approach and the task list. Wait for my approval before any code.

## plan.md template
```
# Plan: <ticket-id>

## Approach
3 sentences max.

## Assumptions
## Alternatives considered
1 or 2, and why not.

## Tasks
- [ ] 1. <what changes>
  - Files:
  - Pattern to follow: <existing file>
  - Test first: <behavior to assert>
  - Verify: <exact command>
- [ ] 2. ...

## Out of scope
## Risk and rollback
Feature flag? What to watch after release?
```

## Rules
- Each task is one commit-sized change.
- Every new piece names the existing file it copies its pattern from.
- No new dependencies. No refactors that the ticket doesn't need.
- Use real commands from `learn.md`, not guesses.
