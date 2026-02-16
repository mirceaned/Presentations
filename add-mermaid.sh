#!/bin/bash
# Add mermaid support to the generated HTML file

HTML_FILE="ContinuousIntegration.html"

# Check if the HTML file exists
if [ ! -f "$HTML_FILE" ]; then
  echo "Error: $HTML_FILE not found"
  exit 1
fi

# Check if mermaid script is already added
if grep -q "mermaid.esm.min.mjs" "$HTML_FILE"; then
  echo "Mermaid script already exists in $HTML_FILE"
  exit 0
fi

# Add mermaid script before </body> tag
sed -i '' '/<\/body>/i\
<script type="module">\
  import mermaid from '\''https://cdn.jsdelivr.net/npm/mermaid@10/dist/mermaid.esm.min.mjs'\'';\
  mermaid.initialize({ startOnLoad: false, theme: '\''default'\'' });\
  document.querySelectorAll('\''code.language-mermaid'\'').forEach((block) => {\
    const pre = block.closest('\''pre'\'');\
    if (pre) {\
      const mermaidDiv = document.createElement('\''div'\'');\
      mermaidDiv.className = '\''mermaid'\'';\
      mermaidDiv.textContent = block.textContent;\
      pre.parentNode.replaceChild(mermaidDiv, pre);\
    }\
  });\
  mermaid.run();\
</script>
' "$HTML_FILE"

echo "Mermaid script added to $HTML_FILE"