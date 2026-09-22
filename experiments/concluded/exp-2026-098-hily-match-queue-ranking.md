---
description: >-
  Increasing the weight of recent activity in the Hily discovery queue. Shipped —
  match rate per session up 6.4%.
icon: circle-check
status: shipped
affects:
  - product-specs/hily/matching-and-discovery.md
primary_metric: match_rate_per_session
ends: 2026-08-24
---

# EXP-2026-098 — Hily match queue ranking

## At a glance

| | |
|---|---|
| **Status** | ✅ Shipped |
| **Surface** | Hily → discovery |
| **Owner** | Product — Core |
| **Ran** | 2026-08-03 → 2026-08-24 |
| **Allocation** | 50 / 50, all users |
| **Flag** | `disc_recency_weight_v2` — **removed 2026-09-02** |

## Hypothesis

Raising the weight of recent activity in the discovery ranking will increase match rate per
session, because profiles that are active are far more likely to reciprocate.

## Variants

| Variant | Ranking |
|---|---|
| Control | Recency cutoff 7 days, moderate weight |
| Treatment | Recency cutoff 72 hours, strongly favoured |

## Results

| Metric | Control | Treatment | Δ | Significance |
|---|---|---|---|---|
| Match rate per session | 11.2% | 11.9% | **+6.4% rel.** | p < 0.01 |
| Messages sent per match | 3.4 | 3.6 | +5.9% rel. | p < 0.05 |
| D7 retention | 41.1% | 41.4% | +0.3pp | n.s. |
| Report rate | 0.41% | 0.40% | −0.01pp | n.s. |
| Queue exhaustion rate | 8.1% | 10.7% | **+2.6pp** | p < 0.01 |

## Decision

**Shipped at 100% on 2026-08-28.**

The primary metric won clearly and no guardrail regressed. Queue exhaustion rose, as
expected — a tighter recency cutoff means a smaller eligible pool. This was accepted because
the auto-expansion behaviour already handles it, and because exhausted-queue users converted
to radius expansion at a higher rate in treatment than control.

{% hint style="info" icon="lightbulb" %}
**What we learned beyond the result.** Queue exhaustion turned out to be a *leading*
indicator of radius expansion, not of churn. We had been treating it as a negative signal in
dashboards; it has since been reclassified. See
[dashboards](https://app.gitbook.com/s/l8hK5Dikt1kTwBMi6PyB/reporting/dashboards).
{% endhint %}

## Cleanup

- [x] Spec updated — [Matching and discovery](https://app.gitbook.com/s/ObwCHTfcy9nm4oFjO3WU/hily/matching-and-discovery), `disc_inactive_cutoff_hours` now `72`
- [x] `under-test` removed
- [x] Changelog entry written
- [x] Flag `disc_recency_weight_v2` deleted 2026-09-02
- [x] Page moved to `concluded/`
