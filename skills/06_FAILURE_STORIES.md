# 06 — Failure Stories

**Purpose:** Preserve evidence-based lessons from failures so the same breakage is not repeated.

**Confidence note:** Repository metadata checked on 2026-11-23. The code wins (see 16).

## 1. Empty initialized repositories block inspection

- **What happened:** Git commands for status/history reported that `main` has no commits; recursive file inspection found only `.git` metadata in Android, API, and web.
- **Why:** The repositories are initialized but have no committed baseline or working source files.
- **How found:** `git status`, `git log`, `git ls-tree HEAD`, and recursive file listing. Git additionally refused normal access because the checkout owner differs from the sandbox identity; a command-scoped `safe.directory` override enabled read-only inspection.
- **Fix:** None applied. This handoff records the limitation. A project maintainer must establish the intended source baseline before implementation documentation can be grounded.
- **Lesson:** Empty repository structure is not evidence of application architecture. Keep unknowns explicit.
- **Confidence:** Verified for this checkout on 2026-11-23. No historical cause can be reconstructed because there are no commits.

No production or runtime incidents can be reconstructed from the available repositories. Add a numbered story only with a verifiable timeline, cause, detection path, and fix; link it from 04, 05, or 16 as relevant.
