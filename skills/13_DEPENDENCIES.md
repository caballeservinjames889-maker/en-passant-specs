# 13 — Dependencies

**Purpose:** Explain why each external dependency exists and what upgrades can break.

**Confidence note:** Verified repository inventory on 2026-11-23. The code wins (see 16).

No package manifests, lockfiles, Gradle files, SDK declarations, or CI dependency setup are present. The dependency inventory is empty because the applications have no source baseline, not because the eventual product needs no dependencies.

When manifests land, list each direct dependency, purpose, owner, version source, update policy, security advisories/permissions, and known upgrade traps. Keep lockfiles synchronized with manifests; a missed lockfile update can make local and CI builds resolve different code. Record deliberate rejections only when there is evidence of an evaluated alternative and its cost.
