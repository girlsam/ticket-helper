---
name: sketch
description: Decode a new ticket into plain language before any code is written. First step for every ticket.
argument-hint: "[ticket-id] [optional pasted ticket text]"
disable-model-invocation: true
---

# Sketch a ticket

Goal: I understand what this ticket asks, in plain words, before anything gets built. Make no code changes in this step.

Input: $ARGUMENTS

## Steps
1. Get the ticket. If a ticket tool (Jira or similar) is connected, fetch the ticket by ID. Otherwise use the text I pasted. If you have neither, ask me to paste it and stop.
2. Drop anything that looks like real member data. Never copy it into notes.
3. Create `~/work-notes/tickets/<ticket-id>/` if it doesn't exist.
4. Find where the work lives. Use the Explore subagent to locate the code this ticket likely touches: file paths, components, routes, Redux slices, GraphQL queries, and one or two similar features already in the repo.
5. Write `sketch.md` using the template below.
6. Add new domain and codebase terms to `~/work-notes/glossary.md` as `unconfirmed`. Don't duplicate terms already there.
7. Reply with: the plain-language summary, the blocking questions, and how confident you are. Then stop.

## sketch.md template
```
# <ticket-id>: <short title>

## In plain words
3 to 5 sentences. No jargon. What changes for the user, and why.

## Terms
| Term | Plain meaning | Where it shows up in code | Confirmed? |

## What done looks like
Acceptance criteria restated as checkable statements. Mark any you inferred.

## Where it lives
File paths, each with one line on why it matters.

## Similar code to follow
Existing features or components this change should copy patterns from.

## Open questions
Blocking (must answer before planning):
Non-blocking (state the assumption you'd use):

## Risks
What could break. What else uses this code. Feature flags, analytics, other microfrontends.

## Size
S, M, or L, and why.
```

## Rules
- Keep what the ticket says separate from what you infer. Label inferences.
- Don't guess business rules. Put them in Open questions.
- Industry definitions of insurance terms may not match how this company uses them. Flag when that matters.
