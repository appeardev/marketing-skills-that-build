#!/bin/bash
# Marketing Skills That Build — Installer
# Copies all skills to ~/.claude/skills/ for immediate use

set -e

SKILLS_DIR="$HOME/.claude/skills"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Installing marketing-skills-that-build..."

for skill_dir in "$SCRIPT_DIR"/skills/*/; do
  skill_name=$(basename "$skill_dir")
  mkdir -p "$SKILLS_DIR/$skill_name"
  cp -r "$skill_dir"* "$SKILLS_DIR/$skill_name/"
  echo "  Installed: $skill_name"
done

echo ""
echo "Done! Skills installed to $SKILLS_DIR"
echo "Restart Claude Code to use them."
