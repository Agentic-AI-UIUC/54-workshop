#!/usr/bin/env bash
# Build slides.pdf, one page per slide, with the footer site name as a clickable link.
# presenterm's own --export-pdf can't carry links, so export HTML, patch in the anchor, print with Chrome.
cd "$(dirname "$0")"
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
H=/tmp/54-slides.html
presenterm -c config.yaml -x --image-protocol ascii-blocks --export-html -o "$H" slides.md </dev/null >/dev/null 2>&1
sed -i '' 's|AGENTICAIUIUC.COM|<a href="https://agenticaiuiuc.com" style="color:inherit;text-decoration:none">AGENTICAIUIUC.COM</a>|g' "$H"
# Every page visible, one per sheet, no viewport scaling.
sed -i '' 's|display: none;|display: block; page-break-after: always;|' "$H"
sed -i '' 's|scaler();|/* scaler off for print */|' "$H"
sed -i '' 's|</head>|<style>@page{size:545px 312px;margin:0}html,body{margin:0;padding:0;background:#0d0d0d}body{width:545px!important;height:auto!important;transform:none!important}.container{width:545px;height:312px;overflow:hidden;page-break-after:always;break-inside:avoid}.container:last-child{page-break-after:auto}</style></head>|' "$H"
"$CHROME" --headless=new --disable-gpu --no-pdf-header-footer --print-to-pdf="$PWD/slides.pdf" "file://$H" >/dev/null 2>&1
echo "wrote slides/slides.pdf"
