# 15 — Known Limitations

**Purpose:** Make gaps visible in order of their likelihood to mislead contributors.

**Confidence note:** Verified against workspace and repository metadata on 2026-11-23. The code wins (see 16).

1. **Critical — implementation absent:** Android, web, and API repositories have no tracked files or commits. All runtime architecture and behavior remain unknown.
2. **Critical — requirements are placeholders:** `../business-logic-v1.0.md` leaves project identity, description, and most requirements as template text. Google Sign-In and privacy statements are not implementation evidence.
3. **High — Git guide has placeholders:** `../git-guidelines.md` uses `code-name` in scope examples and blank tag tables. Confirm naming and release policy before use.
4. **High — no test or deploy evidence:** no tests, CI, build manifests, environments, or deployment records exist.
5. **High — no data/API/security design:** schema, routes, authz, retention mechanics, and threat model are absent.
6. **Medium — repositories have no shared history:** each repo's `main` is unborn. Cross-repo chronology, blame, and incident reconstruction cannot be performed.
7. **Medium — specs notes are untracked:** current notes are local working files, not committed repository history.

## Redesign candidates (ranked)

1. Establish product scope and requirements with acceptance criteria.
2. Agree shared identity, API, and data contracts before parallel client work.
3. Define a minimal supported build, test, deployment, and observability path.

These are recommended next decisions, not existing implementation tasks or approved architecture.
