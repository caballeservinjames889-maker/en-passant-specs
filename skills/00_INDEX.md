# 00 — Index

**Purpose:** Route contributors to verified project knowledge and record refreshes.

**Confidence note:** Verified against the checked-out repositories on 2026-11-23. The code wins (see 16).

## Reading order

| Task | Read |
|---|---|
| Understand project status | 01, 02, 15 |
| Change specifications | 03, 04, 14, and `../git-guidelines.md` |
| Build an implementation | 01, 04–14; first establish what the requirements actually are |
| Debug a running system | 05, then 06; no runnable system or logs are present yet |

## Documents

All documents below were verified 2026-11-23. This workspace contains four separate Git repositories: `en-passant-android`, `en-passant-api`, `en-passant-web`, and `en-passant-specs`. Each currently has an unborn `main` branch; there is no commit to use as a baseline. The three application repositories contain no working files. `en-passant-specs` contains three untracked notes and no `INBOX.md` existed before this refresh.

| File | Use |
|---|---|
| 01_ARCHITECTURE.md | Current repository boundaries and missing product definition |
| 02_PROJECT_STRUCTURE.md | Where the four repositories stand and where future artifacts belong |
| 03_CODE_STYLE.md | Specification and future implementation style |
| 04_CHANGE_RULES.md | Current cross-repository contract inventory |
| 05_DEBUGGING_PLAYBOOK.md | How to diagnose the current empty-checkout state |
| 06_FAILURE_STORIES.md | Verified repository/setup failure; no runtime incidents evidenced |
| 07_DATABASE.md | Database decision status |
| 08_API.md | API contract status |
| 09_SECURITY.md | Security requirements and unresolved design |
| 10_DEPLOYMENT.md | Release process status |
| 11_TESTING.md | Test coverage status and confidence requirements |
| 12_PERFORMANCE.md | Performance evidence status |
| 13_DEPENDENCIES.md | Dependency inventory status |
| 14_DEVELOPER_WORKFLOWS.md | Setup and contribution recipes |
| 15_KNOWN_LIMITATIONS.md | Ordered gaps and redesign candidates |
| 16_ENGINEERING_PRINCIPLES.md | Evidence-based principles for this project |
| INBOX.md | Unverified and new contributor knowledge |

## Contribute

Add a rough entry to `INBOX.md` with the supplied template; rough is better than silent. Verify claims against committed code, executable behavior, requirements, or a dated incident record before promoting them. Keep author credit. Do not record secrets or values of environment variables.

## Changelog

- 2026-11-23: Created initial skills set after inspecting the workspace, existing spec notes, and each repository's Git metadata. Repository history and implementation are absent, so implementation-specific sections explicitly record unknowns.
