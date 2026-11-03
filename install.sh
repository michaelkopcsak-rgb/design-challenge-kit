#!/bin/bash
# Installs the design challenge kit's commands and skills into ~/.claude so they
# work in every Claude Code session. Re-run after pulling changes to update.
# Usage: ./install.sh            install or update
#        ./install.sh --remove   uninstall
set -euo pipefail

KIT="$(cd "$(dirname "$0")" && pwd)"
CMD_DIR="$HOME/.claude/commands"
SKILL_DIR="$HOME/.claude/skills"

if [ "${1:-}" = "--remove" ]; then
  for f in "$KIT"/commands/*.md; do rm -f "$CMD_DIR/$(basename "$f")"; done
  for d in "$KIT"/skills/design-challenge/*/; do rm -rf "$SKILL_DIR/$(basename "$d")"; done
  echo "Removed design challenge kit commands and skills."
  exit 0
fi

mkdir -p "$CMD_DIR" "$SKILL_DIR"

for f in "$KIT"/commands/*.md; do
  sed "s|{{KIT}}|$KIT|g" "$f" > "$CMD_DIR/$(basename "$f")"
  echo "command  /$(basename "$f" .md)"
done

for d in "$KIT"/skills/design-challenge/*/; do
  name="$(basename "$d")"
  rm -rf "$SKILL_DIR/$name"
  cp -R "$d" "$SKILL_DIR/$name"
  echo "skill    $name"
done

echo "Installed. Start a new Claude Code session (any folder) to use them."
