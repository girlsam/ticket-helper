---
name: learn
description: Walk me through the code path for a ticket so I can own the change and explain it in review. Run after /sketch.
argument-hint: "[ticket-id]"
disable-model-invocation: true
---

# Learn the code behind a ticket

Goal: I can explain how this part of the app works and why my change goes where it goes. No code changes in this step.

Ticket: $ARGUMENTS

## Steps
1. Read `~/work-notes/tickets/<ticket-id>/sketch.md` and `~/work-notes/glossary.md`.
2. Trace the path end to end with `file:line` for each hop. For example: user action, component, hooks, Redux action/reducer/selector or data fetch, GraphQL or API call, render.
3. Explain patterns specific to this codebase that I may not know: microfrontend boundaries, shared libraries, design system, feature flags, analytics, i18n, error handling. Assume I know React, Redux, and TypeScript well.
4. Find how to verify this area. Locate the tests, then actually run the typecheck, lint, and test commands for this package once. Record the exact commands that worked.
5. Write `learn.md` (template below).
6. Quiz me with 3 short questions that check whether I understand enough to implement. Wait for my answers. Correct me briefly. Add what I got wrong to `learn.md` under "Things I had wrong."

If I invoked this with "no quiz" or from /autopilot, skip step 6.

## learn.md template
```
# Learn: <ticket-id>

## Path
1. <step> (file:line)
...

## Patterns here
## Gotchas
## Tests and checks
Commands that worked, and what they cover.
## Things I had wrong
```
