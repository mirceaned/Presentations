#!/bin/bash

HTML_FILE="ContinuousIntegration.html"
MD_FILE="ContinuousIntegration.md"

echo "Starting Marp watch mode with automatic mermaid processing..."

# Function to process the HTML file
process_html() {
  if [ -f "$HTML_FILE" ]; then
    echo "HTML file updated, running add-mermaid.sh..."
    ./add-mermaid.sh
  fi
}

# Initial build
npm run build

# Watch for changes to the HTML file in the background
fswatch -o "$HTML_FILE" | while read; do
  process_html
done &

FSWATCH_PID=$!

# Run marp in watch mode
npx marp "$MD_FILE" -w --html --allow-local-files

# Cleanup when marp exits
kill $FSWATCH_PID 2>/dev/null