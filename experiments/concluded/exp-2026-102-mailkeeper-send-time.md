---
description: >-
  Per-user send-time prediction for Mailkeeper lifecycle campaigns. Shipped —
  incremental returning sessions up 9.1%.
icon: circle-check
status: shipped
affects:
  - product-specs/mailkeeper/lifecycle-campaigns.md
primary_metric: incremental_returning_sessions
ends: 2026-09-01
---

# EXP-2026-102 — Mailkeeper send-time optimisation

## At a glance

| | |
|---|---|
| **Status** | ✅ Shipped |
| **Surface** | Mailkeeper → lifecycle campaigns (win-back 7d, win-back 30d) |
| **Owner** | Product — Retention |
| **Ran** | 2026-08-04 → 2026-09-01 |
| **Allocation** | 50 / 50, eligible users only, against the permanent 2% holdout |
| **Flag** | `mk_sendtime_model_enabled` — **kept as an operational flag** |

## Hypothesis

Predicting each user's most likely active hour and sending win-back messages at that hour
will increase incremental returning sessions, compared with sending at a fixed local 18:00.

## Variants

| Variant | Send time |
|---|---|
| Control | Fixed 18:00 in the user's local timezone |
| Treatment | Predicted per-user active hour, model refreshed weekly |

## Results

| Metric | Control | Treatment | Δ | Significance |
|---|---|---|---|---|
| Incremental returning sessions / 1k eligible | 47.2 | 51.5 | **+9.1% rel.** | p < 0.01 |
| Email open rate | 18.3% | 21.0% | +2.7pp | p < 0.01 |
| Unsubscribe rate | 0.22% | 0.21% | −0.01pp | n.s. |
| Push opt-out rate | 0.09% | 0.09% | 0 | n.s. |
| Suppressed sends (global cap) | 3.1% | 4.4% | **+1.3pp** | p < 0.05 |

## Decision

**Shipped at 100% on 2026-09-04**, with the flag retained as an operational kill switch.

The rise in cap-suppressed sends was the one surprise: concentrating sends into predicted
active hours pushed more users against the global 3-per-24h push cap. The cap was left
unchanged — suppression is working as designed — but suppression is now surfaced as its own
dashboard tile rather than being buried in delivery failures.

{% hint style="warning" icon="toggle-on" %}
**The flag stayed.** `mk_sendtime_model_enabled` is now an *operational* flag, not an
experiment flag: it is the kill switch if the model degrades. It is therefore documented in
the [Lifecycle campaigns](https://appflame.gitbook.io/appflame-knowledge-base/product-specs/mailkeeper/lifecycle-campaigns)
Configuration table — see
[rollout and cleanup](../lifecycle/rollout-and-cleanup.md) for why this distinction matters.
{% endhint %}

## Cleanup

- [x] Spec updated — [Lifecycle campaigns](https://appflame.gitbook.io/appflame-knowledge-base/product-specs/mailkeeper/lifecycle-campaigns)
- [x] `under-test` removed
- [x] Changelog entry written
- [x] Flag reclassified as operational and documented in the spec
- [x] Page moved to `concluded/`
