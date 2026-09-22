#!/usr/bin/env bash
# Replace XSPACE_<KEY> sentinels in markdown with real GitBook space IDs,
# read from cross-space-links.yaml. Idempotent: running it twice is a no-op.
set -euo pipefail
cd "$(dirname "$0")/.."
while read -r key id; do
  [ -z "${key:-}" ] && continue
  find . -name '*.md' -not -path './.git/*' -print0 | xargs -0 sed -i '' "s|${key}|${id}|g"
done < <(awk '/^  XSPACE_/ {gsub(":","",$1); print $1, $2}' cross-space-links.yaml)
echo "Resolved. Remaining sentinels:"
grep -rho 'XSPACE_[A-Z]*' --include='*.md' . | sort | uniq -c || echo "  none"
