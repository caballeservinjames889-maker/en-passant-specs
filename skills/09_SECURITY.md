# 09 — Security

**Purpose:** Track security requirements and the evidence needed to review implementation.

**Confidence note:** The requirements template and repository inventory were checked on 2026-11-23. The code wins (see 16).

## Known requirements, not verified controls

`../business-logic-v1.0.md` names Google Sign-In and calls for privacy by design, Data Privacy Act compliance, location protection, retention limits, no per-user trails, aggregation thresholds, and consent for data resale. These are template-level statements; no threat model, consent flow, authentication code, authorization rules, secret handling, data inventory, or debug gate exists. Do not claim compliance or deployed controls.

## Required review when implementation begins

1. Map sensitive data, trust boundaries, and adversaries before collecting data.
2. Define authentication separately from authorization; validate identity tokens server-side and enforce access on the server.
3. Name secret-bearing environment variables and storage mechanisms without documenting values.
4. Review injection, file upload, redirect, logging, analytics, debug, and export surfaces that actually exist.
5. Set retention/deletion and consent behavior, including backup and third-party processors.
6. Add tests for denied access and privacy invariants; verify production builds disable debug-only paths.

Each control needs a path, test/evidence, and a description of the failure it prevents. Applicable law and compliance must be reviewed against the actual product and jurisdiction; the template alone is not proof.
