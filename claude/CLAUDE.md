# How I work

Personal instructions. Company policy and each repo's own CLAUDE.md take priority over this file.

## About me
- Senior frontend-leaning full-stack engineer: TypeScript, React, Redux, GraphQL, some Rails.
- New to this codebase and to health insurance terms. Explain unfamiliar domain terms and codebase-specific patterns once, briefly. Don't explain general React or TypeScript.

## How to talk to me
- Plain language. Short sentences. Lead with the answer.
- No em dashes. No filler, hype, or praise. No "Great question."
- Say how sure you are. Keep what you verified separate from what you assume.
- If you don't know, say so. Never guess at business rules (eligibility, coverage, plan types, pricing). Ask.
- Cite `file:line` when you describe code.

## Ticket workflow
- Default flow: /sketch, /learn, /plan-ticket, /implement, /review-loop, /pr-prep, /debrief. /autopilot chains them with gates.
- No code before I approve a plan, unless I say the change is trivial.
- Ticket notes live in `~/work-notes/tickets/<ticket-id>/`. Shared glossary: `~/work-notes/glossary.md`. Review calibration: `~/work-notes/review-calibration.md`. Read these when they're relevant.
- When you learn a new domain or codebase term, add it to the glossary as `unconfirmed`.

## Writing code
- Follow the patterns already in this repo. Before writing something new, find one or two existing examples and match them. Name the file you followed.
- Search for existing utilities, hooks, and design system components before writing new ones.
- Smallest diff that meets the requirement. No drive-by refactors. No unrelated formatting changes.
- No new dependencies without asking.
- TypeScript: no `any`. No `@ts-ignore` or `as` casts to silence errors. Fix the type. 
- React: match the repo's approach to state, data fetching, and styling. Handle loading, empty, and error states.
- Accessible by default: semantic HTML, labels, keyboard support, visible focus. Use ARIA only when HTML can't do the job.
- New behavior gets a test. Test behavior, not implementation details. Match the repo's test style.
- Never delete, skip, or weaken a test to make it pass. If a test looks wrong, tell me.

## Before you say "done"
- Run typecheck, lint, and the relevant tests. Report the real result. If you couldn't run something, say so.
- "Done" means checks pass and the acceptance criteria in the ticket's `sketch.md` are met. List anything you did not verify.
- If the same approach fails twice, stop. Tell me what you tried and what you think is wrong.

## Safety
- Never put real member data, PHI, PII, tokens, or secrets in code, tests, fixtures, logs, notes, commit messages, or prompts. Use obviously fake data.
- Don't log or send to analytics anything that could identify a member.
- Don't read `.env` files or credential files.
- Never push, force-push, open or merge PRs, or touch shared environments without asking me first.

## Git
- One branch per ticket. Small, focused commits.
- Match the repo's branch and commit message style. Check `git log` and remote branch names first.
