# 11 — Testing

**Purpose:** Set honest confidence expectations and capture test practices as they become real.

**Confidence note:** Verified repository inventory on 2026-11-23. The code wins (see 16).

There are no test files, test frameworks, CI workflows, coverage reports, or runnable application source in the checkout. No test command can currently be recommended. Do not report a pass rate or imply the system was tested.

When code lands, document exact setup and test commands from manifests/CI, what each suite covers, and what it cannot cover. For cross-client/API changes, cover contract compatibility and authorization; for persistence, migration and integrity behavior; for privacy controls, data retention and logging. Include a manual drill for release/restore only after the operational path exists. Tests should fail visibly when required configuration is missing; otherwise setup may appear successful while exercising no meaningful behavior.
