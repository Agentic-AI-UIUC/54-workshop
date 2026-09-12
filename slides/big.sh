#!/usr/bin/env bash
# Open a new Alacritty window at projector font size and present.
#   slides/big.sh        # 28pt
#   slides/big.sh 34     # any size
# Deck is validated down to 72x20, so go as large as the screen allows.
cd "$(dirname "$0")"
SIZE="${1:-28}"
ALACRITTY="$(command -v alacritty || echo /Applications/Alacritty.app/Contents/MacOS/alacritty)"
exec "$ALACRITTY" -o "font.size=$SIZE" -o "window.startup_mode=Maximized" -o "window.padding.x=24" -o "window.padding.y=16" \
  --working-directory "$PWD" -e bash -c 'presenterm -c config.yaml -x slides.md'
