# 03 — Code Style

**Purpose:** Keep specifications and future implementation changes reviewable.

**Confidence note:** Process guidance verified in `../git-guidelines.md` and `../business-logic-v1.0.md` on 2026-11-23. The code wins (see 16).

## Verified guidance

- `git-guidelines.md` requires a commit subject in `scope: Imperative summary` form, imperative sentence case, no final period, and a summary of at most 50 characters. The scope examples still use `code-name-*` placeholders; replace them only after the project code name is decided.
- For non-trivial changes, explain why in the commit body (wrap at 72 columns); reference issues with a human-readable description. Breaking changes use `!` and a `BREAKING CHANGE:` trailer.
- Keep commits focused; split independent scopes.
- `handoff.md` requires every rule to explain what breaks without it, concrete file/function/config references, confidence labels, and no secret values.

## Not yet established

No language, formatter, linter, error-handling pattern, logging framework, test framework, or code conventions are present. Do not invent commands or claim a style tool is enforced. When code lands, document its actual config and the reason for any non-obvious constraints here.

## Comments

Put rationale beside the constraint it explains. Record a workaround's trigger and failure mode; a bare TODO or “must” does not preserve why the code needs it. Never put credentials or secret values in comments, logs, docs, or examples.
