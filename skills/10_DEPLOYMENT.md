# 10 — Deployment

**Purpose:** Describe release order and gates when deployable artifacts exist.

**Confidence note:** Verified against current repository contents and `../git-guidelines.md` on 2026-11-23. The code wins (see 16).

No build files, CI workflows, hosting configuration, signing setup, release bundles, environments, or deployment scripts are present. Thus there is no verified deployable artifact or release order.

`../git-guidelines.md` proposes version format `<prefix>.0X.Y.00Z`, weekly build tags, and alpha/beta/RC stages, with approval gates. Its product prefixes include `WCN`, `BCN`, `ACN`, and `SCN`; repository history has no commits, and its tag tables are blank. Treat this as proposed process guidance, not evidence of releases or automation. Confirm applicability and replace any code-name placeholders before issuing tags.

Before first release, define build provenance, signing, environment/config ownership, migration sequencing, rollback criteria, approvers, monitoring, and client/API compatibility. Never publish a release tag for a week with no commit history or use tag numbers as proof of deployment.
