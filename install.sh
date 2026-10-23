#!/usr/bin/env bash
# Installs the ticket kit into ~/.claude and ~/work-notes.
# Backs up anything it would replace. Never touches settings.json.
set -euo pipefail

KIT_DIR="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_DIR="$HOME/.claude"
NOTES_DIR="$HOME/work-notes"
STAMP="$(date +%Y%m%d-%H%M%S)"

backup_if_exists() {
  if [ -e "$1" ]; then
    mv "$1" "$1.bak-$STAMP"
    echo "Backed up $1 -> $1.bak-$STAMP"
  fi
}

mkdir -p "$CLAUDE_DIR/skills" "$CLAUDE_DIR/agents" "$NOTES_DIR/tickets"

# CLAUDE.md
backup_if_exists "$CLAUDE_DIR/CLAUDE.md"
cp "$KIT_DIR/claude/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"
echo "Installed CLAUDE.md"

# Skills
for skill in "$KIT_DIR"/claude/skills/*/; do
  name="$(basename "$skill")"
  backup_if_exists "$CLAUDE_DIR/skills/$name"
  cp -R "$skill" "$CLAUDE_DIR/skills/$name"
  echo "Installed skill /$name"
done

# Agents
for agent in "$KIT_DIR"/claude/agents/*.md; do
  name="$(basename "$agent")"
  backup_if_exists "$CLAUDE_DIR/agents/$name"
  cp "$agent" "$CLAUDE_DIR/agents/$name"
  echo "Installed agent ${name%.md}"
done

# Notes (only seed files that don't exist yet)
for f in glossary.md review-calibration.md; do
  if [ ! -e "$NOTES_DIR/$f" ]; then
    cp "$KIT_DIR/work-notes/$f" "$NOTES_DIR/$f"
    echo "Created $NOTES_DIR/$f"
  else
    echo "Kept existing $NOTES_DIR/$f"
  fi
done

echo
echo "Done. Next:"
echo "  1. Merge settings.example.json into ~/.claude/settings.json by hand (this script doesn't touch it)."
echo "  2. Start Claude Code in a repo and type / to confirm the skills show up."
