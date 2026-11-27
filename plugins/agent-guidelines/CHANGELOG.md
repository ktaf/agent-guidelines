# Changelog

All notable changes to agent-guidelines are in this file. The newest version is first.

## v0.1.1 - 2026-11-27

### Changed

- Document install and startup setup across projects for Claude Code, Copilot CLI, and Codex CLI.
- Use wording that applies to everyone who installs the skill.

## v0.1.0 - 2026-11-24

### Added

- The skill is a standalone plugin with manifests for Claude Code, Copilot CLI, and Codex CLI.
- The `Load` section tells how to keep the rules in context at startup and after context reduction.
- The `Ask` section tells when to ask the user.

### Changed

- Simplified Technical English is a rule for all English text, with an explicit scope.
- The language rule tells the agent to reply in the language of the user, and in Simplified Technical English for English.
- The description tells the agent to load the skill for every task.

### Fixed

- The rules tell the agent not to copy rules into memory, so one source stays.
