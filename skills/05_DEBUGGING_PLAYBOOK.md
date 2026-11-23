# 05 — Debugging Playbook

**Purpose:** Diagnose repository/setup issues and build a useful symptom guide as runtime code arrives.

**Confidence note:** Commands and repository state checked on 2026-11-23. The code wins (see 16).

## Current symptoms

| Symptom | Likely cause | Shortcut |
|---|---|---|
| `fatal: your current branch 'main' does not have any commits yet` | The repository is initialized but has no commit (observed in all four repositories). | `git -C <repo> status --short` and `git -C <repo> log --oneline` |
| `fatal: detected dubious ownership in repository` | Windows checkout owner differs from the sandbox identity (observed during inspection). | Read-only command may use `git -c safe.directory=<absolute-repo-path> -C <repo> ...`; do not change global Git config just to inspect. |
| No files appear in `rg --files` | Current application directories have no working files; hidden `.git` metadata is not application source. | `Get-ChildItem <repo> -Force` |

There are no application logs, error messages, telemetry locations, or runtime processes to inspect. Do not infer a runtime cause from repository metadata alone.

## Useful read-only commands (PowerShell)

```powershell
Get-ChildItem -Force
rg --files
Get-ChildItem -Recurse -File
git -C en-passant-api status --short
git -C en-passant-api log --oneline
```

A safe-directory override may be needed when the current Windows identity differs from the checkout owner. Avoid commands that mutate global Git configuration.
