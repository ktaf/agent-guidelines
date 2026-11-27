# Agent Guidelines

Agent Guidelines provides rules for action limits, simple code, and Simplified Technical English (ASD-STE100).

## Install for your user account

Install the [skill directory](plugins/agent-guidelines/skills/agent-guidelines/) in your home directory to use it across projects.
Run these commands from the root of your checkout. Set `skills_dir` to the location for your agent.

| Agent | `skills_dir` |
| --- | --- |
| Claude Code | `"$HOME/.claude/skills"` |
| Copilot CLI | `"${COPILOT_HOME:-$HOME/.copilot}/skills"` |
| Codex CLI | `"$HOME/.agents/skills"` |

```sh
skills_dir="$HOME/.claude/skills"
mkdir -p "$skills_dir" && cp -R plugins/agent-guidelines/skills/agent-guidelines "$skills_dir/"
```

Start a new session to make the skill available. Repeat the copy step to update a copied install.
If your skill directory is already a symlink to the checkout, update the checkout.

### Claude Code marketplace

Install from the [GitHub repository](https://github.com/ktaf/agent-guidelines).

```sh
claude plugin marketplace add ktaf/agent-guidelines
claude plugin install agent-guidelines@ktaf-skills --scope user
```

For a local checkout, run `claude plugin marketplace add "$PWD"` from its root, then run the same install command.
Choose one install method for Claude Code. [Claude Code plugin docs](https://code.claude.com/docs/en/plugins/install)

## Apply the rules in every session

Skills load when selected. For every session, add a reference to the installed [SKILL.md](plugins/agent-guidelines/skills/agent-guidelines/SKILL.md) in your startup instructions.

- **Claude Code.** Add `@skills/agent-guidelines/SKILL.md` to `~/.claude/CLAUDE.md`. For a marketplace install, use the absolute path to the plugin's `SKILL.md` after `@`. [Claude Code instructions](https://code.claude.com/docs/en/memory)
- **Copilot CLI.** Add `@skills/agent-guidelines/SKILL.md` to `~/.copilot/copilot-instructions.md`. If you set `COPILOT_HOME`, use `copilot-instructions.md` there. [Copilot CLI instructions](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/add-custom-instructions)
- **Codex CLI.** In `~/.codex/AGENTS.md`, tell Codex to read and apply the installed `SKILL.md` before starting work. Give the absolute path to the file. Use your configured `CODEX_HOME` or `AGENTS.override.md` if applicable. [Codex instructions](https://learn.chatgpt.com/docs/agent-configuration/agents-md)

## Change the rules

1. Edit `SKILL.md`. Keep it below 100 lines.
2. Increase the version in the marketplace and in both plugin manifests.
3. Add a section to [CHANGELOG.md](plugins/agent-guidelines/CHANGELOG.md).

A merge to `main` with a new version creates the tag and the release.
