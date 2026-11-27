# Agent Guidelines

Agent Guidelines provides rules for action limits, simple code, and Simplified Technical English (ASD-STE100).
The plugin includes [Chisle](plugins/agent-guidelines/skills/chisle/SKILL.md) for concise replies, simple implementations, and focused tool reads.

## Install for your user account

Choose a marketplace install or copy the skills into your home directory.

### Claude Code marketplace

Run these commands to install from GitHub. [ktaf/agent-guidelines](https://github.com/ktaf/agent-guidelines)

```sh
claude plugin marketplace add ktaf/agent-guidelines
claude plugin install agent-guidelines@ktaf-skills --scope user
```

For a local checkout, run `claude plugin marketplace add "$PWD"` from its root, then run the install command. [Claude Code plugin docs](https://code.claude.com/docs/en/plugins/install)

### Codex CLI marketplace

```sh
codex plugin marketplace add ktaf/agent-guidelines
codex plugin add agent-guidelines@ktaf-skills
```

For a local checkout, run `codex plugin marketplace add "$PWD"` from its root, then run the install command. [Codex marketplace docs](https://developers.openai.com/plugins/build/plugins#add-a-marketplace-from-the-cli)

### Copy the skills

Run these commands from the root of your checkout. Set `skills_dir` to the location for your agent.

| Agent | `skills_dir` |
| --- | --- |
| Claude Code | `"$HOME/.claude/skills"` |
| Codex CLI | `"$HOME/.agents/skills"` |

```sh
skills_dir="$HOME/.claude/skills"
mkdir -p "$skills_dir"
cp -R plugins/agent-guidelines/skills/agent-guidelines "$skills_dir/"
cp -R plugins/agent-guidelines/skills/chisle "$skills_dir/"
```

Start a new session to make the skills available. Repeat the copy step to update a copied install.
For a skill installed as a symlink, update the checkout and skip its copy command.

## Use Chisle

- **Claude Code.** Run `/agent-guidelines:chisle` for the plugin or `/chisle` for a copied skill.
- **Codex CLI.** Select `$agent-guidelines:chisle` for the plugin or `$chisle` for a copied skill.

Say `stop Chisle` to go back to the usual rules.
The Markdown skill gives guidance on focused tool reads and follows the active writing rules. [Chisle upstream](https://github.com/JayPokale/Chisle)

## Apply the rules in every session

To load Agent Guidelines in every session, add a reference to its installed [SKILL.md](plugins/agent-guidelines/skills/agent-guidelines/SKILL.md) in your startup instructions.

- **Claude Code.** Add `@skills/agent-guidelines/SKILL.md` to `~/.claude/CLAUDE.md`. For a marketplace install, use the absolute path to the plugin's `SKILL.md` after `@`. [Claude Code instructions](https://code.claude.com/docs/en/memory)
- **Codex CLI.** In `~/.codex/AGENTS.md`, tell Codex to read and apply the installed `SKILL.md` before starting work. Give the absolute path to the file. Use your configured `CODEX_HOME` or `AGENTS.override.md` if applicable. [Codex instructions](https://learn.chatgpt.com/docs/agent-configuration/agents-md)

## Change the rules

1. Edit the relevant `SKILL.md`. Keep it below 100 lines.
2. Increase the version in the marketplace and in both plugin manifests.
3. Add a section to [CHANGELOG.md](plugins/agent-guidelines/CHANGELOG.md).

A merge to `main` with a new version creates the tag and the release.
