# 16 — Engineering Principles

**Purpose:** State project rules that are supported by current evidence and prevent false confidence.

**Confidence note:** Verified against `handoff.md`, the existing spec notes, and repository state on 2026-11-23. The code wins (see 16).

## Principles

1. **Document observed behavior, not intended architecture.** The three application repositories have no source or commits; repository names only suggest intended roles. Claiming a runtime flow would teach fiction. Evidence: repository inventory; see 01 and 06 #1.
2. **Treat template requirements as unresolved until completed.** `business-logic-v1.0.md` contains placeholders and unfinished requirements. Implementations built on them can satisfy no testable product contract. Evidence: the file itself; see 15 #2.
3. **Make cross-repository contracts explicit before clients diverge.** Android, web, and API are separate repositories, and no shared type source exists. Undocumented duplicated contracts can drift. Evidence: repository boundaries; candidate safeguards in 04.
4. **Preserve rationale and confidence.** Handoff instructions require reasons, concrete references, and confidence labels. Without them, future maintainers cannot distinguish a proven guard from guesswork. Evidence: `handoff.md`.
5. **Do not claim a release, test, or control without evidence.** There are no tags, test suites, CI, deploy files, or implemented security controls in this checkout. False claims can cause unsafe releases or misplaced trust. Evidence: repository inspection; see 09–11.

trust the code over any document, including this one
