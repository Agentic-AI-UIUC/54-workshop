#!/usr/bin/env bash
# Re-export the deck to docs/index.html for GitHub Pages. Run after editing slides.md, then commit docs/.
cd "$(dirname "$0")"
presenterm -c config.yaml -x --image-protocol ascii-blocks --export-html -o ../docs/index.html slides.md </dev/null
# presenterm cannot emit links from the footer; make the site name clickable in the web copy.
sed -i '' 's|AGENTICAIUIUC.COM|<a href="https://agenticaiuiuc.com" target="_blank" style="color:inherit;text-decoration:none">AGENTICAIUIUC.COM</a>|g' ../docs/index.html
echo "exported docs/index.html"
