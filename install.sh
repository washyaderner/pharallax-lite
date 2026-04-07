#!/bin/bash
set -e

CLAUDE_DIR="${HOME}/.claude"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Installing Pharallax Lite..."
echo ""

# Create target directories
mkdir -p "$CLAUDE_DIR/skills/pharallax-lite"
mkdir -p "$CLAUDE_DIR/agents"

# Copy skill
cp "$SCRIPT_DIR/skills/pharallax-lite/SKILL.md" "$CLAUDE_DIR/skills/pharallax-lite/SKILL.md"

# Copy agent prompts
cp "$SCRIPT_DIR/agents/structural-read.md" "$CLAUDE_DIR/agents/structural-read.md"
cp "$SCRIPT_DIR/agents/positioning-audit.md" "$CLAUDE_DIR/agents/positioning-audit.md"
cp "$SCRIPT_DIR/agents/competitive-surface.md" "$CLAUDE_DIR/agents/competitive-surface.md"

echo "Pharallax Lite installed."
echo ""
echo "Usage: type /pharallax-lite <url> in Claude Code"
echo "Example: /pharallax-lite https://example.com"
echo ""
echo "To uninstall: bash uninstall.sh"
