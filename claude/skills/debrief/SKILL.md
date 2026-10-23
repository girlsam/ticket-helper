---
name: debrief
description: After a human reviews my PR, compare their comments to what the AI reviewers flagged and update review calibration. Makes future reviews less noisy.
argument-hint: "[ticket-id] [PR number or URL]"
disable-model-invocation: true
---

# Debrief a reviewed PR

Input: $ARGUMENTS

## Steps
1. Get the human review comments. Use `gh pr view <pr> --comments` and the PR review comments via `gh api`. If `gh` isn't available, ask me to paste them.
2. Read `~/work-notes/tickets/<ticket-id>/review-log.md`.
3. Sort into three groups:
   - **Hits**: AI flagged it, and a human raised it too (or it was fixed before review and nobody objected).
   - **Likely noise**: AI flagged it, I didn't fix it, and no human cared.
   - **Misses**: humans raised it, and the AI reviewers didn't.
4. Update `~/work-notes/review-calibration.md`:
   - "Humans here care about": patterns from Hits and Misses.
   - "Humans here usually don't care about": patterns from Likely noise.
   - "AI reviewers missed": patterns from Misses, written as a check a reviewer could run.
   Write patterns, not one-off details. Merge duplicates. Keep the file under about 80 lines. Don't name reviewers.
5. Mark glossary terms that got confirmed during review as confirmed.
6. Reply with a 3-line summary: hits, noise, misses.
