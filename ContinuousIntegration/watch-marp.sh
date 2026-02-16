#!/bin/bash

HTML_FILE="ContinuousIntegration.html"
MD_FILE="ContinuousIntegration.md"

# Initial build
echo "Running initial build..."
npm run build
echo ""

# Get initial timestamp
LAST_MOD=$(stat -f %m "$HTML_FILE" 2>/dev/null || echo 0)

# Start marp in background
echo "Starting Marp in watch mode..."
npx marp "$MD_FILE" -w --html --allow-local-files --theme-set ./theme.css &
MARP_PID=$!

echo "Watching for HTML changes (Press Ctrl+C to stop)..."
echo ""

# Watch loop
while true; do
  sleep 1

  # Check if HTML file was modified
  CURRENT_MOD=$(stat -f %m "$HTML_FILE" 2>/dev/null || echo 0)

  if [ "$CURRENT_MOD" != "$LAST_MOD" ]; then
    LAST_MOD=$CURRENT_MOD
    # Wait a bit to ensure marp finished writing
    sleep 0.5
    echo "📄 HTML updated, processing mermaid..."
    ./add-mermaid.sh
    echo "✓ Done"
    echo ""
  fi
done

# Cleanup on exit
trap "echo 'Stopping...'; kill $MARP_PID 2>/dev/null; exit" INT TERM