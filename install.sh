#!/bin/bash
set -e

echo ""
echo "🇰🇭 Installing SingKhmerKeyboard v1.0"
echo ""

# 1. Check or install Squirrel (supports both Brew and direct download)
SQUIRREL_INSTALLED=false

if [ -d "/Library/Input Methods/Squirrel.app" ] || [ -d "$HOME/Library/Input Methods/Squirrel.app" ] || [ -d "/Applications/Squirrel.app" ]; then
  SQUIRREL_INSTALLED=true
fi

if [ "$SQUIRREL_INSTALLED" = false ]; then
  echo "==> Squirrel keyboard engine not found."
  if command -v brew >/dev/null 2>&1; then
    echo "==> Installing Squirrel via Homebrew..."
    brew install --cask squirrel
  else
    echo "==> Downloading Squirrel directly..."
    mkdir -p "$HOME/Library/Input Methods"
    curl -fsSL "https://github.com/rime/squirrel/releases/download/0.16.2/Squirrel-0.16.2.zip" -o /tmp/squirrel.zip
    unzip -q -o /tmp/squirrel.zip -d /tmp/squirrel_extracted
    if [ -d "/tmp/squirrel_extracted/Squirrel.app" ]; then
      cp -R "/tmp/squirrel_extracted/Squirrel.app" "$HOME/Library/Input Methods/"
    fi
    rm -rf /tmp/squirrel.zip /tmp/squirrel_extracted
  fi
  echo "==> Squirrel installed!"
else
  echo "==> Squirrel is already installed! Continuing..."
fi

# 2. Setup Rime directory in user space
RIME_DIR="$HOME/Library/Rime"
mkdir -p "$RIME_DIR"
echo "==> Target folder: $RIME_DIR"

# 3. Download latest files directly from your GitHub
BASE_URL="https://raw.githubusercontent.com/HengHuyLong/SingKhmerKeyboard/main"

echo "==> Downloading SingKhmer schema..."
curl -fsSL "$BASE_URL/xingkhmer.schema.yaml" -o "$RIME_DIR/xingkhmer.schema.yaml"

echo "==> Downloading SingKhmer dictionary (40k+ entries)..."
curl -fsSL "$BASE_URL/xingkhmer.dict.yaml" -o "$RIME_DIR/xingkhmer.dict.yaml"

echo "==> Configuring default keyboard..."
curl -fsSL "$BASE_URL/default.custom.yaml" -o "$RIME_DIR/default.custom.yaml"

echo "==> Applying Squirrel theme..."
curl -fsSL "$BASE_URL/squirrel.custom.yaml" -o "$RIME_DIR/squirrel.custom.yaml"

# 4. Start Squirrel and trigger reload
if [ -d "/Library/Input Methods/Squirrel.app" ]; then
  open "/Library/Input Methods/Squirrel.app" 2>/dev/null || true
  "/Library/Input Methods/Squirrel.app/Contents/MacOS/Squirrel" --reload 2>/dev/null || true
elif [ -d "$HOME/Library/Input Methods/Squirrel.app" ]; then
  open "$HOME/Library/Input Methods/Squirrel.app" 2>/dev/null || true
  "$HOME/Library/Input Methods/Squirrel.app/Contents/MacOS/Squirrel" --reload 2>/dev/null || true
fi

echo ""
echo "==> SingKhmer installed successfully! 🇰🇭"
echo "==> To activate: Log out and log back in ( → Log Out)."
echo "==> Then switch keyboard (Ctrl + Space) and type 'nhom' → ខ្ញុំ"
# echo ""
# echo "╔══════════════════════════════════╗"
# echo "║                                  ║"
# echo "║   Made by henghuylong            ║"
# echo "║   Donate me ABA: 000 917 479     ║"
# echo "║                                  ║"
# echo "╚══════════════════════════════════╝"
# echo ""
