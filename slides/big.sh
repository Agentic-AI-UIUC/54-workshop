#!/usr/bin/env bash
# Open a new Ghostty window at projector font size and present.
#   slides/big.sh        # 28pt
#   slides/big.sh 34     # any size
# Deck is validated down to 72x20, so go as large as the screen allows.
# Ghostty supports presenterm's font-size protocol, so slide titles render at double size.
cd "$(dirname "$0")"
SIZE="${1:-28}"
GHOSTTY="$(command -v ghostty || echo /Applications/Ghostty.app/Contents/MacOS/ghostty)"
[ -x "$GHOSTTY" ] || { echo "Ghostty not found. brew install --cask ghostty" >&2; exit 1; }
exec "$GHOSTTY" --font-size="$SIZE" --window-padding-x=24 --window-padding-y=16 --fullscreen=true \
  --working-directory="$PWD" -e presenterm -c config.yaml -x slides.md
