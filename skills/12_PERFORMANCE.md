# 12 — Performance

**Purpose:** Preserve measured performance limits and profiling guidance.

**Confidence note:** Verified repository inventory on 2026-11-23. The code wins (see 16).

No runtime, workload, service-level target, dataset, hot path, profiling tool, or benchmark exists in this checkout. There are no hard limits or known deliberate inefficiencies to document. Do not invent latency or scale claims.

Once measurable code exists, record workload shape, device/server assumptions, percentile and resource targets, measurement command, and a reproducible baseline. Tie each optimization to a measured bottleneck; premature changes can obscure correctness without improving user experience.
