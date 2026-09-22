---
description: >-
  The standing lifecycle campaigns, their triggers, frequency caps and the rules
  that stop users being over-messaged.
icon: paper-plane
product: mailkeeper
surface: campaigns
status: current
reviewed: 2026-09-16
---

# Lifecycle campaigns

## Summary

Lifecycle campaigns are always-on, event-triggered messages that run without a marketer
scheduling them. Each has a trigger, an eligibility rule, a channel preference order and a
frequency cap. Global caps override campaign caps in every case.

## Surfaces

| Surface | Where it runs | Owner |
|---|---|---|
| Campaign definitions | Mailkeeper console → Lifecycle | Product — Retention |
| Trigger evaluation | Streaming job, evaluated per event | Platform |
| Send scheduling | Per-user send-time model | Platform |

## Behaviour

| Campaign | Trigger | Eligibility | Channel order |
|---|---|---|---|
| Welcome | Onboarding completed | New account, < 24h | Push → Email |
| Photo nudge | Onboarding abandoned at photo step | No photo, 6h elapsed | Push → Email |
| New match | Match created | Not in-app within 15 min | Push only |
| Unread message | Message unread 2h | Not in-app | Push → Email |
| Win-back 7d | No session for 7 days | Has completed onboarding | Email → PWA |
| Win-back 30d | No session for 30 days | Any account | Email only |
| Trial ending | Trial ends in 48h | Active trial | Push → Email |

### Frequency caps

| Scope | Cap | Overridable |
|---|---|---|
| Global, push | 3 per 24h | No |
| Global, email (marketing) | 4 per 7 days | No |
| Global, email (transactional) | Uncapped | — |
| Per campaign | 1 per trigger occurrence | Yes, per campaign |

{% hint style="danger" icon="ban" %}
**Global caps are hard.** A campaign that would exceed a global cap is dropped, not queued.
Dropped sends are recorded as `campaign_suppressed` with a reason so suppression is visible
in reporting rather than looking like a delivery failure.
{% endhint %}

## Edge cases

| Situation | Behaviour |
|---|---|
| User revokes push consent mid-campaign | Falls through to the next channel in order |
| User has no consent on any channel | Campaign skipped, `campaign_suppressed` recorded |
| Trigger fires while the user is in-app | Suppressed for 15 minutes, then re-evaluated |
| Duplicate trigger within the same minute | De-duplicated on trigger key |
| Send-time model unavailable | Falls back to immediate send |

## Configuration

| Key | Type | Default | Tunable without release |
|---|---|---|---|
| `mk_global_push_cap_24h` | int | `3` | Yes |
| `mk_global_email_cap_7d` | int | `4` | Yes |
| `mk_inapp_suppression_minutes` | int | `15` | Yes |
| `mk_sendtime_model_enabled` | bool | `true` | Yes |

## Measurement

Primary metric: **incremental returning sessions per 1,000 eligible users**, measured
against a permanent 2% holdout.

## Related

- Concluded experiment: EXP-2026-102 (send-time optimisation) —
  [readout](https://app.gitbook.com/s/XSPACE_EXPERIMENTS/concluded/exp-2026-102-mailkeeper-send-time)
- Adjacent specs: [Mailkeeper overview](README.md),
  [Hily onboarding flow](../hily/onboarding-flow.md)
