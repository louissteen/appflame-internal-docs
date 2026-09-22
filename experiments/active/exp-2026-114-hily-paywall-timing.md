---
description: >-
  Does showing the Hily paywall after the first sent message instead of the first
  match raise trial starts without hurting D7 retention?
icon: flask
status: running
affects:
  - product-specs/hily/subscriptions-and-paywalls.md
primary_metric: trial_start_rate_per_paywall_view
ends: 2026-10-05
---

# EXP-2026-114 — Hily paywall timing

## At a glance

| | |
|---|---|
| **Status** | 🟢 Running |
| **Surface** | Hily → paywall (iOS, Android) |
| **Owner** | Product — Monetisation |
| **Started** | 2026-09-14 |
| **Ends** | 2026-10-05 |
| **Allocation** | 50 / 50, new users only |
| **Flag** | `pw_first_match_enabled` |

## Hypothesis

Showing the paywall **after the user's first sent message** rather than **at the first
displayed match** will increase trial start rate, because the user has demonstrated intent
and experienced value before being asked to pay.

Falsified if trial start rate per paywall view does not increase, or if D7 retention drops
by more than 1.5pp.

## Variants

| Variant | Behaviour |
|---|---|
| **Control** | Paywall shown once, when the first match is displayed |
| **Treatment** | Paywall shown once, after the user sends their first message |

Users who never send a message in the treatment group see the paywall on their third
session of the week, as per the standard weekly trigger.

## Metrics

| Role | Metric | Direction |
|---|---|---|
| Primary | Trial start rate per paywall view | Increase |
| Guardrail | D7 retention | No drop > 1.5pp |
| Guardrail | Refund rate | No increase > 0.5pp |
| Guardrail | Messages sent per new user | No drop |
| Secondary | Trial-to-paid conversion | Watch |

## Stopping rule

Stop immediately if D7 retention drops more than 1.5pp with 95% confidence, or if refund
rate rises more than 0.5pp. Otherwise run to 2026-10-05.

## Affected documentation

{% hint style="warning" icon="link" %}
This experiment changes behaviour documented in
[Subscriptions and paywalls](https://app.gitbook.com/s/XSPACE_SPECS/hily/subscriptions-and-paywalls),
which is marked `under-test` for its duration. Read both pages together.
{% endhint %}

## Readout

_Not yet written. Due within 3 working days of 2026-10-05._

| Section | Owner |
|---|---|
| Results table | Analytics |
| Decision | Product — Monetisation |
| Spec update | Product — Monetisation |
| Changelog entry | Docs agent, auto |
