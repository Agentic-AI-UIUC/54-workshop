#!/usr/bin/env bash
# Re-export the deck to docs/index.html for GitHub Pages. Run after editing slides.md, then commit docs/.
cd "$(dirname "$0")"
presenterm -c config.yaml -x --image-protocol ascii-blocks --export-html -o ../docs/index.html slides.md </dev/null
# presenterm cannot emit links from the footer; make the site name clickable in the web copy.
sed -i '' 's|AGENTICAIUIUC.COM|<a href="https://agenticaiuiuc.com" target="_blank" style="color:inherit;text-decoration:none">AGENTICAIUIUC.COM</a>|g' ../docs/index.html
# Small progress bar left of the page number. presenterm's footer is text or a full-width bar, never both.
cat >> ../docs/index.html <<'HTML'
<script>
(function(){
  var bar=document.createElement('div');
  bar.style.cssText='position:fixed;right:31vw;bottom:5.4vh;width:6vw;height:0.5vh;background:#2e2e2e;pointer-events:none';
  var fill=document.createElement('div');
  fill.style.cssText='height:100%;width:0;background:#f25c14;transition:width .15s';
  bar.appendChild(fill);
  document.documentElement.appendChild(bar);
  var pages=Array.prototype.slice.call(document.querySelectorAll('body > div'));
  setInterval(function(){
    var i=pages.findIndex(function(p){return !p.classList.contains('hidden');});
    if(i>=0){fill.style.width=((i+1)/pages.length*100)+'%';}
  },100);
})();
</script>
HTML
echo "exported docs/index.html"
