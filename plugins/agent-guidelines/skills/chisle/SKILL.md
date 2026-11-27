---
name: chisle
description: >-
  Reduce extra wording, code, and tool output when the user requests Chisle mode.
  Use when the user asks to activate Chisle or selects the Chisle skill.
---

# Chisle

Apply these rules for the current conversation. Return to the usual rules when the user says `stop Chisle` or `normal mode`.
Keep that choice if the conversation is summarized.
Follow the writing and approval rules in effect for the conversation.

## Replies

- Give the answer first. Remove filler and use only the structure that helps the reader.
- Preserve complete sentences, technical terms, numbers, exact errors, and any necessary explanation.
- Give full details when requirements, risks, or the order of steps affect the result.

## Code

- Confirm the task needs the change, then check whether the repository already does it.
- Prefer existing code, standard libraries, built-in platform features, or installed dependencies before adding code.
- Use the smallest change that completes the request. Fix the cause of a defect.
- Keep necessary checks, error handling, accessibility, and security controls.

## Tool output

- Search for the relevant symbol or error first, then read enough context to understand it.
- Read the full section you plan to edit. Follow its callers when they affect the change.
- Keep build and test output focused on results and failures. Preserve exit status and enough detail to diagnose failures.
- Reuse unchanged information already in context. Read it again when it may have changed or you need more detail.

Adapted from Jay Pokale's [Chisle](https://github.com/JayPokale/Chisle). See [license and notices](LICENSE).
