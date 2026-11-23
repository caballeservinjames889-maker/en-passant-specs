# 07 — Database

**Purpose:** Record persistence decisions and integrity rules once a schema exists.

**Confidence note:** Verified repository inventory on 2026-11-23. The code wins (see 16).

No database engine, schema, migration, ORM, identity key, delete behavior, index, or backup procedure is present. The business logic document is a placeholder and does not select persistence. Do not run migration or destructive-data advice based on this document.

Before first persistent feature, document: system of record; table/entity map; primary and foreign keys; uniqueness and nullability; deletion and retention behavior; migration order and rollback limits; indexes and expected access patterns; backup and restore owner; integrity checks; privacy classifications. State the concrete damage caused if each invariant is missed.
