#!/usr/bin/env bash
set -euo pipefail

version="${1:?usage: changelog-section.sh <version> [changelog-path]}"
changelog="${2:-plugins/agent-guidelines/CHANGELOG.md}"

[ -f "$changelog" ] || { echo "no such file: $changelog" >&2; exit 1; }

section=$(awk -v head="## v$version" '
  !inside {
    if (substr($0, 1, length(head)) == head) {
      rest = substr($0, length(head) + 1)
      if (rest == "" || rest ~ /^[[:space:]]/) { inside = 1 }
    }
    next
  }
  /^## / { exit }
  {
    if (!started && $0 ~ /^[[:space:]]*$/) next
    started = 1
    lines[++count] = $0
    if ($0 !~ /^[[:space:]]*$/) last = count
  }
  END { for (i = 1; i <= last; i++) print lines[i] }
' "$changelog")

if [ -z "$section" ]; then
  echo "FAIL: no CHANGELOG section for v$version in $changelog" >&2
  echo "Add one as '## v$version - YYYY-MM-DD' with its changes." >&2
  exit 1
fi

printf '%s\n' "$section"
