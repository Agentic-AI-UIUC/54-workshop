#!/usr/bin/env bash
# Re-export the deck to docs/index.html for GitHub Pages. Run after editing slides.md, then commit docs/.
cd "$(dirname "$0")"
presenterm -c config.yaml -x --image-protocol ascii-blocks --export-html -o ../docs/index.html slides.md </dev/null
echo "exported docs/index.html"
