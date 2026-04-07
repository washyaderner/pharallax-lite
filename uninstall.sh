#!/bin/bash
set -e

CLAUDE_DIR="${HOME}/.claude"

echo "Uninstalling Pharallax Lite..."

# Remove skill
rm -f "$CLAUDE_DIR/skills/pharallax-lite/SKILL.md"
rmdir "$CLAUDE_DIR/skills/pharallax-lite" 2>/dev/null || true

# Remove agent prompts
rm -f "$CLAUDE_DIR/agents/structural-read.md"
rm -f "$CLAUDE_DIR/agents/positioning-audit.md"
rm -f "$CLAUDE_DIR/agents/competitive-surface.md"

echo "Pharallax Lite uninstalled."
