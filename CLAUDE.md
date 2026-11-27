# Contributor instructions

This repository distributes the agent-guidelines plugin.

## Changes

- Work on the current branch. Do not create branches, commit, or push without an explicit request.
- Keep the version equal in `.claude-plugin/marketplace.json` and in both plugin manifests.
- Use a patch version for corrections, a minor version for new rules, and a major version for breaking changes.
- Add one changelog section for each version, newest first: `## vX.Y.Z - YYYY-MM-DD`.
- Use `Added`, `Changed`, and `Fixed` subsections as necessary, with one short statement for each change.

## Skill

- Keep `name` equal to the directory name. Keep a non-empty `description`.
- Keep `SKILL.md` below 100 lines. Put detail in `references/` with relative links.
- Write in Simplified Technical English. Do not use em dashes.
- Keep the rules in one file. Do not copy them into other files.

## Checks

Run these before handover:

```
jq empty .claude-plugin/marketplace.json plugins/agent-guidelines/.claude-plugin/plugin.json plugins/agent-guidelines/.codex-plugin/plugin.json plugins/agent-guidelines/hooks/hooks.json
./.github/scripts/check-skill-frontmatter.sh
./.github/scripts/changelog-section.sh "$(jq -r .version plugins/agent-guidelines/.claude-plugin/plugin.json)"
```
