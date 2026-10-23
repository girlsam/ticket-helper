# Ticket kit for Claude Code

A personal CLAUDE.md plus a small set of skills and review agents for working tickets in a new codebase. Inspired by obra/superpowers. The flow is: understand the ticket, learn the code, plan, build, review until the critique is mostly noise, then learn from real human reviews.

## What's in it

```
claude/CLAUDE.md                 -> ~/.claude/CLAUDE.md   (always loaded)
claude/skills/<name>/SKILL.md    -> ~/.claude/skills/     (slash commands)
claude/agents/*.md               -> ~/.claude/agents/     (review subagents)
work-notes/                      -> ~/work-notes/         (your notes, outside any repo)
settings.example.json            merge into ~/.claude/settings.json by hand
install.sh                       copies everything, backs up what it replaces
```

## Before you install
1. **Check your company's rules.** Managed settings can block personal skills, agents, or hooks, or restrict which tools run. Run `/status` in Claude Code to see what's enforced. If personal skills are blocked, ask the team how shared skills are distributed.
2. **Check what the team already has.** A repo's own CLAUDE.md and project skills win. This kit is meant to sit on top of them, not replace them.

## Install
```
unzip ticket-kit.zip && cd ticket-kit
bash install.sh
```
Then merge `settings.example.json` into `~/.claude/settings.json`. Adjust the test and lint commands to match the repo (npm vs yarn vs pnpm). If `~/work-notes` isn't picked up in `additionalDirectories`, use the full absolute path instead.

## The commands

| Command | What it does | Changes code? |
|---|---|---|
| `/sketch <id> [ticket text]` | Plain-language summary, terms, acceptance criteria, where it lives, blocking questions | No |
| `/learn <id>` | Traces the code path with file:line, finds real check commands, quizzes you | No |
| `/plan-ticket <id>` | Small ordered tasks, each tied to an existing pattern and a test | No |
| `/implement <id>` | Test first, smallest change, checks, local commit, per task | Yes, local only |
| `/review-loop <id> [rounds]` | 4 cold reviewers, then triage into signal vs noise, fix, repeat | Fixes only |
| `/pr-prep <id>` | Full checks, scope check, PR description | No push |
| `/debrief <id> <pr>` | Compares human review to AI review, updates calibration | Notes only |
| `/autopilot <id>` | Runs all of the above with gates | Yes, local only |

Each ticket gets a folder: `~/work-notes/tickets/<id>/` with `sketch.md`, `learn.md`, `plan.md`, `review-log.md`, `pr.md`.

## How signal vs noise works
1. Four reviewers read the diff with no knowledge of your plan: requirements, conventions, frontend, and risk (PHI, security, tests).
2. Each must cite code evidence. The conventions reviewer must show 2+ repo examples for any convention claim. "No findings" is allowed and encouraged.
3. A separate triage agent checks every finding against the code and labels it SIGNAL-fix, SIGNAL-discuss, or NOISE, with the reason.
4. Agreement between reviewers, or a finding that survives a second round, counts as stronger signal.
5. After a real human review, `/debrief` records what humans actually cared about, what they ignored, and what the AI missed. Reviewers and triage read that file next time. This is the part that gets better with use.

Expect the first few rounds to be noisy. The calibration file is empty at first. It starts paying off after several debriefs.

## Suggested ramp
- **Week 1:** Run each step by hand. Read every sketch and plan closely. Do the `/learn` quiz. Use `/review-loop` with 1 round. Debrief every PR, even small ones.
- **Weeks 2 to 4:** Same steps, faster. Start trusting the sketch for small tickets. Use 2 review rounds.
- **After that:** Try `/autopilot` on small, well-understood tickets. Consider running it in its own git worktree so your main checkout stays free. Keep the plan gate on until the calibration file has real content.

## Hands-off, safely
- `/autopilot` stops for blocking questions and for plan approval. It never pushes or opens PRs.
- To skip the plan gate on a small ticket: `/autopilot <id> go`. It only skips when the sketch sizes the ticket as S.
- If your org allows auto mode, it cuts permission prompts a lot. Check before turning it on.

## Cost
`/review-loop` runs 5 subagents per round. That uses real usage. Use 1 round for small changes and save 3 rounds for risky ones.

## Tuning
- Too much noise? Add patterns under "usually don't care about" in `~/work-notes/review-calibration.md`, or tighten a reviewer's checklist.
- Missing things? Add them as checks under "AI reviewers missed."
- Edit any SKILL.md or agent file directly. Claude Code picks up changes without a restart.
