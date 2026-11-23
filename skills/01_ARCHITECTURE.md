# 01 — Architecture

**Purpose:** Read first to understand what exists and what must be decided before implementation.

**Confidence note:** Verified against the checked-out workspace on 2026-11-23. The code wins (see 16).

## Current model

En Passant is a proposed ecosystem with separate repository directories for Android (`en-passant-android`), web (`en-passant-web`), backend API (`en-passant-api`), and specifications (`en-passant-specs`). The product concept, users, requirements, and technology choices are not filled in. No application source, manifests, routes, schema, CI, tests, commits, or release tags exist in the three application repositories. The only product-level document, `business-logic-v1.0.md`, is a template with `<Platform>`, `<Team Name>`, and unfinished requirement placeholders. Therefore no runtime data flow or component ownership beyond repository labels can be verified.

## Boundaries and flow

| Area | Verified ownership | Runtime flow |
|---|---|---|
| Android | Intended Android client by repository name | Unknown; no source |
| Web | Intended web client by repository name | Unknown; no source |
| API | Intended backend by repository name | Unknown; no source |
| Specs | Planning and process notes | No executable integration |

Do not treat intended ownership as evidence of a deployed architecture. There are no verified hard boundaries, persistence choices, identity provider integrations, deployment environments, or supported clients.

## Decisions

No accepted technical decision records exist. The spec template mentions Google Sign-In and privacy-by-design controls, but it does not establish an implementation decision. Record decisions in this document using the format in `../handoff.md` only after stakeholders approve them.

## Ranked debt / blockers

1. **Critical — product definition:** replace placeholders in `../business-logic-v1.0.md`; otherwise implementation cannot be validated against user needs.
2. **Critical — repository baselines:** commit application code and manifests; without them setup, security, testing, deployment, and incident guidance cannot be verified.
3. **High — shared contracts:** define API, identity, and data contracts before clients drift independently (see 04).
4. **High — operational ownership:** select hosting, release gates, observability, and incident response before production use.

These are observed gaps, not claims of existing incidents.
