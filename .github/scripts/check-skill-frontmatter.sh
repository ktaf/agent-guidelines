#!/usr/bin/env bash
set -euo pipefail

fail=0
count=0
while IFS= read -r -d '' skill_md; do
  count=$((count + 1))
  skill_fail=0
  if ! head -1 "$skill_md" | grep -q '^---$'; then
    echo "FAIL: $skill_md does not start with '---' frontmatter delimiter"
    fail=1
    continue
  fi
  if ! awk '/^---$/{count++; if(count==2) exit} END{exit(count<2)}' "$skill_md"; then
    echo "FAIL: $skill_md frontmatter has no closing delimiter"
    fail=1
    continue
  fi
  frontmatter=$(awk '/^---$/{count++; if(count==2) exit; next} count==1' "$skill_md")
  name=$(printf '%s\n' "$frontmatter" | sed -n 's/^name:[[:space:]]*//p' | tr -d "\"'")
  folder=$(basename "$(dirname "$skill_md")")
  if [ "$name" != "$folder" ] || [ "${#name}" -gt 64 ] || \
      ! printf '%s\n' "$name" | LC_ALL=C grep -Eq '^[a-z0-9]+(-[a-z0-9]+)*$'; then
    echo "FAIL: $skill_md name must be valid and match its directory"
    skill_fail=1
  fi
  if ! printf '%s\n' "$frontmatter" | grep -Eq '^description:[[:space:]]*[^[:space:]]'; then
    echo "FAIL: $skill_md frontmatter missing a non-empty description"
    skill_fail=1
  fi
  if [ "$skill_fail" -eq 0 ]; then
    echo "OK: $skill_md"
  else
    fail=1
  fi
done < <(find plugins/agent-guidelines/skills -mindepth 2 -maxdepth 2 -name SKILL.md -print0)
if [ "$count" -eq 0 ]; then
  echo "FAIL: no skill manifests found under plugins/agent-guidelines/skills/*/SKILL.md"
  fail=1
fi
exit "$fail"
