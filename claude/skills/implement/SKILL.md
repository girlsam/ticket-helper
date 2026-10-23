---
name: implement
description: Execute an approved plan.md task by task, with a test first, checks after each task, and local commits. Never pushes.
argument-hint: "[ticket-id]"
disable-model-invocation: true
---

# Implement an approved plan

Ticket: $ARGUMENTS

## Setup
1. Read `plan.md`, `sketch.md`, and `learn.md` in `~/work-notes/tickets/<ticket-id>/`. If `plan.md` is missing or unapproved, stop.
2. Check the repo's branch naming (remote branches) and commit style (`git log`). Create or switch to the ticket branch.

## For each unchecked task, in order
1. If the task has testable behavior, write the test first. Run it. Confirm it fails for the right reason.
2. Make the smallest change that passes. Follow the pattern file the plan names.
3. Run the task's verify command, plus typecheck and lint on touched files.
4. Commit locally using the repo's message style.
5. Tick the task in `plan.md` and add the short commit hash.

## Stop rules
- If a check fails twice for the same reason, stop. Report what you tried and your best guess at the cause.
- If the plan turns out to be wrong, stop and propose a plan change. Don't improvise past the plan.
- Don't touch files outside the plan without asking.
- Never push.

## At the end
Run the full test suite for the package. Report the actual result, the commits made, and anything not verified.
