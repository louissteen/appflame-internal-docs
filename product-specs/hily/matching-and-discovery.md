---
description: >-
  How Hily builds the discovery queue, what ranking signals it uses, and the
  limits that apply per tier.
icon: shuffle
product: hily
surface: discovery
status: current
reviewed: 2026-09-10
---

# Matching and discovery

## Summary

Discovery shows a ranked queue of candidate profiles one at a time. A match occurs when
two users independently express interest. The queue is rebuilt per session and never
reshows a profile the user has already acted on, except through an explicit rewind.

## Surfaces

| Platform | Surface | Entry point |
|---|---|---|
| iOS | Discovery tab | Default tab after onboarding |
| Android | Discovery tab | Default tab after onboarding |
| Web | Profile view only, no queue | Direct link from chat |

## Behaviour

| Condition | Outcome |
|---|---|
| Session start | Queue of up to 80 candidates built server-side |
| Queue exhausted, free tier | Radius-expansion prompt, then daily limit message |
| Queue exhausted, premium | Radius auto-expands by 25 km, up to 3 times |
| Mutual interest | Match created, both users notified, chat unlocked |
| User blocked or reported | Removed from both queues permanently |

### Ranking signals

Candidates are ordered by a server-side score. Signals, in descending weight:

| Signal | Notes |
|---|---|
| Reciprocal-interest likelihood | Model score, refreshed daily |
| Distance | Sharp decay beyond the user's stated radius |
| Recency of activity | Users active in the last 72 hours are strongly favoured |
| Profile completeness | Photo count and bio presence |
| Intent match | Stated relationship intent alignment |

{% hint style="info" icon="circle-info" %}
The ranking model itself is not documented here — it lives with the recommendations service
and its ADRs. This spec documents the *contract*: which signals are used and in what
priority. Model internals are the technical layer we deliberately do not duplicate.
{% endhint %}

## Edge cases

| Situation | Behaviour |
|---|---|
| Fewer than 10 candidates in radius | Radius auto-expands regardless of tier |
| User has no photo | Not shown to others; own queue still populates |
| Candidate deletes account mid-session | Skipped silently, queue backfills |
| Rewind on a passed profile | Premium only, one rewind per session |

## Configuration

| Key | Type | Default | Tunable without release |
|---|---|---|---|
| `disc_queue_size` | int | `80` | Yes |
| `disc_free_daily_limit` | int | `120` | Yes |
| `disc_radius_expand_km` | int | `25` | Yes |
| `disc_inactive_cutoff_hours` | int | `72` | Yes |

## Measurement

Primary metric: **match rate per session**.

See [metric definitions](https://app.gitbook.com/s/l8hK5Dikt1kTwBMi6PyB/foundations/metric-definitions).

## Related

- Concluded experiment: EXP-2026-098 (match queue ranking) — shipped, see
  [readout](https://app.gitbook.com/s/w8Lmy2czsVcJjubyVtYO/concluded/exp-2026-098-hily-match-queue-ranking)
- Adjacent specs: [Onboarding flow](onboarding-flow.md),
  [Subscriptions and paywalls](subscriptions-and-paywalls.md)
