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

# Remove old mermaid script if any
perl -i -0pe 's/<script type="module">.*?console\.log.*?Mermaid script loading.*?<\/script>//s' "$HTML_FILE"

# Add CSS and mermaid script before </body> tag
perl -i -pe 'BEGIN{undef $/;} s@</body>@<style>
  .mermaid {
    display: flex !important;
    justify-content: center !important;
    align-items: center !important;
    width: 100% !important;
    max-width: 100% !important;
    height: auto !important;
    margin: 1em 0 !important;
  }

  .mermaid svg {
    max-width: 100% !important;
    height: auto !important;
  }
</style>
<script type="module">
  console.log('\''Mermaid script loading...'\'');

  import mermaid from '\''https://cdn.jsdelivr.net/npm/mermaid\@10/dist/mermaid.esm.min.mjs'\'';

  console.log('\''Mermaid module loaded'\'');

  async function initMermaid() {
    console.log('\''Initializing mermaid...'\'');

    mermaid.initialize({
      startOnLoad: false,
      theme: '\''default'\'',
      securityLevel: '\''loose'\'',
      flowchart: {
        useMaxWidth: true,
        htmlLabels: true,
        curve: '\''basis'\''
      }
    });

    // Find all code blocks with language-mermaid class
    const mermaidBlocks = document.querySelectorAll('\''code.language-mermaid'\'');
    console.log('\''Found'\'', mermaidBlocks.length, '\''mermaid code blocks'\'');

    for (let i = 0; i < mermaidBlocks.length; i++) {
      const block = mermaidBlocks[i];
      const parent = block.parentElement;

      console.log('\''Processing block'\'', i, '\''- parent:'\'', parent?.tagName);

      // Handle both regular PRE and MARP-PRE elements
      if (parent && (parent.tagName === '\''PRE'\'' || parent.tagName === '\''MARP-PRE'\'')) {
        // Create a div for mermaid to render into
        const mermaidDiv = document.createElement('\''div'\'');
        mermaidDiv.className = '\''mermaid'\'';

        // Get the text content
        const code = block.textContent;
        console.log('\''  - Code length:'\'', code.length);

        mermaidDiv.textContent = code;

        // Replace the parent element with the mermaid div
        const grandParent = parent.parentElement;
        if (grandParent) {
          grandParent.replaceChild(mermaidDiv, parent);
          console.log('\''  - ✓ Replaced'\'', parent.tagName, '\''with mermaid div'\'');
        }
      } else {
        console.warn('\''  - ✗ Parent is not a PRE/MARP-PRE element!'\'');
      }
    }

    // Render all mermaid diagrams
    const diagramDivs = document.querySelectorAll('\''.mermaid'\'');
    console.log('\''Found'\'', diagramDivs.length, '\''mermaid divs to render'\'');

    if (diagramDivs.length > 0) {
      try {
        await mermaid.run({
          querySelector: '\''.mermaid'\''
        });
        console.log('\''✓ Mermaid rendering complete!'\'');
      } catch (error) {
        console.error('\''✗ Mermaid rendering error:'\'', error);
      }
    }
  }

  // Wait for page to fully load
  if (document.readyState !== '\''complete'\'') {
    window.addEventListener('\''load'\'', initMermaid);
  } else {
    initMermaid();
  }
</script>
</body>@' "$HTML_FILE"

echo "Mermaid script added to $HTML_FILE"

# Remove fragment attributes so all slide content appears at once
# instead of requiring a keypress for each bullet point
perl -i -pe 's/ data-marpit-fragment="\d+"//g; s/ data-marpit-fragments="\d+"//g' "$HTML_FILE"
echo "Fragment attributes removed from $HTML_FILE"
