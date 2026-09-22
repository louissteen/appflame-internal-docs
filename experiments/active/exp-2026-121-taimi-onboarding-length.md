---
description: >-
  Does removing two onboarding steps on Taimi raise completion without lowering
  profile quality or safety-control adoption?
icon: flask
status: running
affects:
  - product-specs/taimi/profile-and-identity.md
primary_metric: onboarding_completion_rate_24h
ends: 2026-10-12
---

# EXP-2026-121 — Taimi onboarding length

## At a glance

| | |
|---|---|
| **Status** | 🟢 Running |
| **Surface** | Taimi → onboarding (iOS, Android) |
| **Owner** | Product — Growth |
| **Started** | 2026-09-21 |
| **Ends** | 2026-10-12 |
| **Allocation** | 50 / 50, new users only |
| **Flag** | `onb_taimi_short_flow` |

## Hypothesis

Deferring the **interests** and **notification permission** steps out of onboarding and into
first session will raise 24-hour onboarding completion rate, without reducing profile
completeness or the share of users who set visibility controls.

Falsified if completion does not rise, or if either guardrail regresses.

## Variants

| Variant | Steps in onboarding |
|---|---|
| **Control** | 7 steps — sign-in, DOB, identity, location, photo, interests, notifications |
| **Treatment** | 5 steps — sign-in, DOB, identity, location, photo |

In treatment, interests and notification permission are prompted contextually during the
first discovery session instead.

## Metrics

| Role | Metric | Direction |
|---|---|---|
| Primary | Onboarding completion rate within 24h | Increase |
| Guardrail | Profile completion rate at D7 | No drop > 2pp |
| Guardrail | Share of users setting a visibility control at D7 | No drop |
| Guardrail | Push opt-in rate at D7 | No drop > 3pp |
| Secondary | D1 retention | Watch |

{% hint style="danger" icon="shield-halved" %}
**The visibility-control guardrail is non-negotiable.** Taimi's visibility settings are a
safety feature, not an engagement feature. A completion win that reduces adoption of
visibility controls is a loss, and the stopping rule treats it as one.
{% endhint %}

## Stopping rule

Stop immediately if the share of users setting a visibility control drops at all with 95%
confidence. Otherwise run to 2026-10-12.

## Affected documentation

- [Profile and identity](https://appflame.gitbook.io/appflame-knowledge-base/product-specs/taimi/profile-and-identity) — marked `under-test`
- If it wins, the equivalent change is planned for
  [Hily onboarding](https://appflame.gitbook.io/appflame-knowledge-base/product-specs/hily/onboarding-flow) as a
  separate experiment, not as a direct rollout.

## Readout

_Not yet written. Due within 3 working days of 2026-10-12._
