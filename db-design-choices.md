# Database design choices: En Passant Atlas MVP

This document records the database choices for the responsive web MVP described in `business-logic-v1.1.md`, implemented on Supabase PostgreSQL with a future-compatible UUID identity model. The MVP is online-first; offline synchronization is not a product requirement, although schema conventions preserve compatibility with local UUID-native stores.

## Identity and relationships

- Every table has `uuid` as the globally meaningful row identity, generated with `gen_random_uuid()` when not supplied by an offline-capable client.
- Every server table also has `id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY`. This is server-only, for physical indexing and joins; never expose it in APIs, local databases, or sync payloads.
- Relationships are represented by `<parent>_uuid` values. Local and server clients use these UUID foreign-key values, never another database's integer `id`.
- UUID references are intentionally not declared as PostgreSQL `REFERENCES` constraints in v1.0.0. Partial client datasets and out-of-order sync can otherwise reject valid rows. Validate relationships in application logic and index the lookup columns. Revisit a hard FK only for online-only relationships with guaranteed write order.
- `auth.uid()` supplies the learner's identity. `journal_entries.learner_uuid` is the owner key; RLS limits each learner to their own entries. Trusted content roles are held in `platform_roles` and must be bootstrapped only by a controlled administrator process.

## MVP tables

| Table | Purpose |
|---|---|
| `platform_roles` | Grants editor or administrator capability to an authenticated Supabase user. |
| `lessons` | Curated lesson objective, text, publication status, and attribution. |
| `lesson_positions` | Ordered FEN position, solution move line, and optional explanation for a lesson. |
| `journal_entries` | Learner's saved lesson and private note. One live entry per learner/lesson. |

All tables include server-only `id`, public `uuid`, timestamps, and `archived_at` soft-delete where appropriate. `created_by` is stamped from the authenticated actor by trusted server code; never accept it from untrusted clients. No account profile table, analytics, classroom roster, or chat is needed for the MVP.

## Security and lifecycle

`db-schema/v1.0.0.sql` enables RLS. Published non-archived lessons and their positions are readable by visitors; drafts require an editor/admin role. Journal rows are private to their learner. The initial admin must be provisioned out-of-band by a trusted operator because no self-service role escalation is allowed. Service-role credentials must never be shipped to the browser.

Deletion uses `archived_at` so a future sync client can propagate tombstones. Normal reads filter archived rows; partial unique indexes apply only to live rows. Since the MVP is online-first, API behavior may hard-delete journal data when fulfilling an account-erasure request, after retention and backup policy is defined.

## Snapshot and migration versioning

- **Full SQL snapshots** are exports of the complete database schema from Supabase to the local specs repository. Increment the minor version: `v1.0.0` → `v1.1.0` → `v1.2.0`. Save as `db-schema/vX.Y.0.sql`. A snapshot is a complete reference/rebuild artifact, not the incremental production migration history.
- **Forward migrations** are developer/agent-authored scripts that add or alter tables on an existing database. Increment the patch version: `v1.0.0` → `v1.0.1` → `v1.0.2`. Store each migration separately (for example, `db-migrations/v1.0.1.sql`) and never edit a migration after it has been applied.
- A forward migration must be idempotent and additive where possible: use `IF NOT EXISTS`, safe backfills, and indexes; apply before deploying code that requires it. Destructive changes require a later, separately reviewed migration after dependent clients are compatible.
- A new full snapshot reflects the exported current schema and advances the minor version, even if one or more patch migrations preceded it. Do not rename a migration as a snapshot or treat a snapshot version as proof it was applied to production.

## Costs and limits

UUID indexes cost storage and random inserts; the server-only bigint primary key provides compact physical indexing. Without hard foreign keys, orphan UUIDs are possible and must be handled by API validation and integrity checks. RLS policies and helper functions must be reviewed whenever roles or ownership rules change. `updated_at` should be maintained by trusted server logic for each edit; conflict resolution/LWW is not implemented by this online-first schema.
