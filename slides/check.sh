#!/usr/bin/env bash
# Overflow check at export size (120x34) and at a projector with the font turned up (90x26). Body text is 2x.
cd "$(dirname "$0")"
for cfg in config.yaml config-tight.yaml; do
  echo "── validate ($cfg)"
  presenterm -c "$cfg" -x --image-protocol ascii-blocks --validate-overflows \
    --export-html -o /dev/null slides.md </dev/null >/dev/null || { echo "   FAILED"; exit 1; }
done
echo "deck ok"
