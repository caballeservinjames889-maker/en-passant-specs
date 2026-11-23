# 08 — API

**Purpose:** Explain the server contract and safe endpoint workflow when API code is available.

**Confidence note:** Verified repository inventory on 2026-11-23. The code wins (see 16).

No API routes, framework, response envelope, authentication middleware, validators, versioning policy, error codes, or API tests exist in the checkout. `en-passant-api` is an empty initialized repository. No endpoint behavior can be stated as fact.

When adding the first endpoint, record its method/path, auth and authorization rules, request and response schemas, validation source, stable error shape, pagination/idempotency behavior where relevant, compatibility policy, and tests. Update both client contracts and 04. Never infer that Google Sign-In is implemented from the placeholder requirement in `business-logic-v1.0.md`.
