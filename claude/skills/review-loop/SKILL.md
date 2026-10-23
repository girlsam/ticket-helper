---
name: review-loop
description: Run multiple independent reviewers on my branch, triage findings into signal and noise, fix the signal, and repeat. Logs every round.
argument-hint: "[ticket-id] [rounds, default 2]"
disable-model-invocation: true
---

# Review loop

Input: $ARGUMENTS

Goal: catch real problems before a human reviewer does, and learn which critiques matter here. Many AI review comments are noise. The point of this loop is to separate them with evidence.

## Each round
1. Find the base: merge-base of HEAD with the default branch. Diff range is `<base>...HEAD`.
2. Launch these four subagents in parallel. Each starts fresh and reviews cold:
   - `review-requirements`
   - `review-conventions`
   - `review-frontend`
   - `review-risk`
   Give each one: the diff range, the path to `~/work-notes/tickets/<ticket-id>/sketch.md`, and the path to `~/work-notes/review-calibration.md`. Don't give them the plan or my reasoning.
   For a tiny change (under ~30 changed lines), skip `review-frontend` unless UI changed.
3. Send every finding to the `review-triage` subagent. It checks each one against the code and labels it SIGNAL-fix, SIGNAL-discuss, or NOISE with evidence.
4. Append the round to `~/work-notes/tickets/<ticket-id>/review-log.md`:
   ```
   ## Round N (<date>)
   | ID | Reviewer(s) | file:line | Claim | Label | Why |
   ```
5. Show me the SIGNAL items. Give only a count for NOISE, but keep the full list in the log.
6. Fixes:
   - Interactive: ask which SIGNAL-fix items to fix.
   - From /autopilot: fix all SIGNAL-fix items. Leave SIGNAL-discuss items for me.
   Fix each in its own small commit. Rerun the checks from `learn.md`.

## Between rounds
- A finding that two or more reviewers raised independently, or that comes back in a later round, gets higher confidence.
- A new round-2 finding on code you didn't change in round 1 is usually noise. Triage still decides.

## Stop when
- A round produces no SIGNAL-fix items, or
- The round limit is reached (default 2, max 3).

## Final report
- Rounds run. Counts of SIGNAL-fix, SIGNAL-discuss, NOISE per round.
- What changed because of review, with commit hashes.
- SIGNAL-discuss items I need to decide or ask a teammate about.
