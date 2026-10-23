---
name: autopilot
description: Hands-off run of the full ticket workflow (sketch, learn, plan, implement, review loop, PR prep) with only the gates that need me.
argument-hint: "[ticket-id] [optional pasted ticket text] [go]"
disable-model-invocation: true
---

# Autopilot a ticket

Input: $ARGUMENTS

Run the workflow end to end. Stop only at the gates below. Follow each step's skill instructions as written.

## Sequence
1. **/sketch** the ticket.
   - GATE A: if there are blocking questions, stop and ask them. This gate can't be skipped. Exception: I said "assume" in the input. Then proceed and record assumptions.
2. **/learn** in no-quiz mode. Record the working check commands.
3. **/plan-ticket**.
   - GATE B: show me the approach and tasks and wait for "go."
   - Skip this gate only if the input includes the word `go` and the sketch size is S.
4. **/implement** the plan. Respect its stop rules. If it stops, stop here and report.
5. **/review-loop** with up to 3 rounds. Auto-fix SIGNAL-fix items.
6. **/pr-prep**. Don't push or open the PR.

## Final report
Keep it short:
- What was built, in plain words.
- Checks run and their real results.
- Review: signal and noise counts per round, and what changed because of review.
- SIGNAL-discuss items and open questions for me.
- What I should check by hand before pushing (for example: run it locally and look at the UI).

## Rules
- Never push, open PRs, or touch shared environments.
- If anything is unclear enough that a wrong guess would waste real work, stop and ask instead.
