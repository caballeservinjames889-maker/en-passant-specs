# 04 — Change Rules

**Purpose:** Identify contracts that must change together and prevent client/server drift.

**Confidence note:** Verified against repository contents on 2026-11-23. The code wins (see 16).

## Lockstep inventory

No implemented constants, enums, registries, schemas, route definitions, error codes, or mirrored types were found. There is no verified lockstep set yet. The separate Android, web, API, and specs repositories make cross-repository contracts a likely future risk, not a confirmed current one.

Before adding a shared concept, identify its source of truth and every consumer. Record numbered paths and the consequence of a missed update here. Candidate contracts to inventory once they exist:

1. API request/response shapes ↔ API validators ↔ Android and web models. **Miss →** clients may reject valid responses or send data the server silently drops.
2. Authentication claims/scopes ↔ server authorization ↔ client login/session handling. **Miss →** users may be denied or gain unintended access.
3. Persistent schema ↔ migrations ↔ API serialization. **Miss →** deploys may fail or lose compatibility with stored records.
4. Shared enums/error identifiers ↔ server producers ↔ client display/retry logic. **Miss →** clients may mislabel errors or retry permanent failures.

These are risk descriptions, not evidence that such artifacts exist. Convert candidates into verified rules only when actual paths and behavior can be cited.

## Retest on future changes

For a contract change, test server validation and serialization, both client consumers, backward compatibility for deployed clients, and migration behavior where applicable. No test commands are currently available; see 11.
