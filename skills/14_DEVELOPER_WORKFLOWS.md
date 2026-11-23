# 14 — Developer Workflows

**Purpose:** Give contributors safe, repeatable repository and specification workflows.

**Confidence note:** Verified against current workspace on 2026-11-23. The code wins (see 16).

## Inspect this workspace

1. Start at `C:\en-passant-ecosystem` and run `Get-ChildItem -Force` and `rg --files`.
2. Use `git -C <repo> status --short` and `git -C <repo> log --oneline` to inspect a repository. These current repositories have no commits.
3. If Git reports dubious ownership on this Windows checkout, use a command-scoped `git -c safe.directory=<absolute-path> -C <repo> ...` for read-only inspection. This avoids persistent global config changes.
4. Do not run app build/test commands: no manifests or source are present (see 11).

## Update engineering knowledge

1. Verify each path and behavior in the relevant repository.
2. Search for `because`, `never`, `must`, `HACK`, `TODO`, `FIXME`, `workaround`, and `legacy` to find rationale and constraints.
3. Compare available Git history before/after the document's confidence note; there is no history in this checkout yet.
4. Process `INBOX.md`: verify claims, merge with author credit, and remove only resolved entries. Preserve unverified notes as explicitly unverified.
5. Append new numbered principles and stories; never renumber. Mark superseded guidance with date and replacement.
6. Refresh the confidence note and add a newest-first entry to 00_INDEX.

## Add a feature (blocked on requirements)

First complete `../business-logic-v1.0.md` with real scope and acceptance criteria. Then define API/data/security contracts before implementing separate clients; inventory coupled changes in 04. This guards against client/server drift (see 04 #1–4).

add what surprised you to `INBOX.md`
