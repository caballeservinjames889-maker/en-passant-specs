# 02 — Project Structure

**Purpose:** Find current project artifacts and place future work in the right repository.

**Confidence note:** Verified against workspace files on 2026-11-23. The code wins (see 16).

## Current tree

```text
en-passant-ecosystem/
  handoff.md                    # instructions for maintaining this knowledge set
  en-passant-android/           # empty, unborn main branch
  en-passant-api/               # empty, unborn main branch
  en-passant-web/               # empty, unborn main branch
  en-passant-specs/             # three untracked notes; unborn main branch
    business-logic-v1.0.md
    git-guidelines.md
    sense-making.md
    skills/                     # this knowledge set
```

No implementation naming conventions can be inferred. Keep Android code and platform build files in `en-passant-android`; web code and frontend build files in `en-passant-web`; server code and API build files in `en-passant-api`; shared requirements, schemas, and engineering notes in `en-passant-specs`. Confirm this ownership with the team when actual modules are introduced.

The spec repository's current files are untracked. Check `git status` before editing or committing; do not assume they are already part of history. Avoid placing runtime code in the specs repository absent an explicit decision.

## Naming

`git-guidelines.md` calls for lower-case product/repository and feature scopes, but still contains `code-name` placeholders. No definitive product short code or feature registry is set. Resolve those placeholders before applying the convention to real commit messages.
