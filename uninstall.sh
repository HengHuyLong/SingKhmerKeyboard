#!/bin/bash

echo ""
echo "🗑️ Uninstalling SingKhmerKeyboard..."
echo ""

# 1. Stop Squirrel background process
echo "==> Stopping Squirrel..."
pkill -f Squirrel 2>/dev/null || true

# 2. Remove configuration files
echo "==> Removing SingKhmer configuration files..."
rm -rf "$HOME/Library/Rime"

# 3. Remove Squirrel application
echo "==> Removing Squirrel..."
if command -v brew >/dev/null 2>&1 && brew list --cask squirrel >/dev/null 2>&1; then
  echo "==> Uninstalling Squirrel via Homebrew..."
  brew uninstall --cask squirrel 2>/dev/null || true
fi

rm -rf "$HOME/Library/Input Methods/Squirrel.app" 2>/dev/null || true
if [ -d "/Library/Input Methods/Squirrel.app" ]; then
  echo "==> Removing /Library/Input Methods/Squirrel.app..."
  sudo rm -rf "/Library/Input Methods/Squirrel.app" 2>/dev/null || true
fi

echo ""
echo "✅ SingKhmer and Squirrel have been completely removed from your Mac!"
echo "==> Final step: Remove Squirrel from your settings:"
echo "==>   System Settings → Keyboard → Text Input → Input Sources"
echo "==>   Select 'Squirrel - Simplified' and click the [-] minus button."
echo ""
