#!/usr/bin/env bash
# Render the guide to PDF.
#
# Chrome headless is used rather than a PDF library because the layout depends
# on CSS multi-column and @page sizing, which Chrome implements correctly and
# most alternatives do not.
#
#   ./build.sh
#
# Output: dist/proof-of-control-guide.pdf

set -euo pipefail
cd "$(dirname "$0")"
mkdir -p dist

CHROME="${CHROME:-/Applications/Google Chrome.app/Contents/MacOS/Google Chrome}"
[[ -x "$CHROME" ]] || CHROME="$(command -v google-chrome || command -v chromium || true)"
[[ -n "$CHROME" ]] || { echo "Chrome not found; set CHROME=/path/to/chrome" >&2; exit 1; }

"$CHROME" --headless --disable-gpu --no-pdf-header-footer \
  --print-to-pdf="$PWD/dist/proof-of-control-guide.pdf" \
  --virtual-time-budget=20000 \
  "file://$PWD/src/guide.html" 2>/dev/null

echo "wrote dist/proof-of-control-guide.pdf"
