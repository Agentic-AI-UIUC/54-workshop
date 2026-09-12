#!/usr/bin/env bash
# Overflow check at export size (90x26) and at a projector with the font turned way up (72x20).
cd "$(dirname "$0")"
for cfg in config.yaml config-tight.yaml; do
  echo "── validate ($cfg)"
  presenterm -c "$cfg" -x --image-protocol ascii-blocks --validate-overflows \
    --export-html -o /dev/null slides.md </dev/null >/dev/null || { echo "   FAILED"; exit 1; }
done
echo "deck ok"
