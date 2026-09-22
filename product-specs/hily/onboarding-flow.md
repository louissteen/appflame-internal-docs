---
description: >-
  The seven-step Hily onboarding, from install to first match, and the drop-off
  points we actively test.
icon: door-open
product: hily
surface: onboarding
status: under-test
reviewed: 2026-09-18
---

# Onboarding flow

## Summary

Hily onboarding takes a new user from install to their first shown match in seven steps.
It collects the minimum viable profile — age, gender, intent, location, one photo — and
defers everything else to post-match profile editing. Completion rate is the primary
growth metric for the product.

## Surfaces

| Platform | Surface | Entry point |
|---|---|---|
| iOS | `Onboarding.*` screens | First launch after install |
| Android | `onboarding/` fragment stack | First launch after install |
| Web | Not available | — |

## Behaviour

| Step | Screen | Required | Skippable |
|---|---|---|---|
| 1 | Phone or Apple/Google sign-in | Yes | No |
| 2 | Date of birth | Yes | No |
| 3 | Gender and intent | Yes | No |
| 4 | Location permission | Yes | Falls back to manual city entry |
| 5 | First photo | Yes | No — blocks discovery |
| 6 | Interests (up to 5) | No | Yes |
| 7 | Notification permission | No | Yes |

After step 5 the user enters discovery. Steps 6 and 7 are shown but dismissible.

## Edge cases

| Situation | Behaviour |
|---|---|
| User denies location permission | Manual city selector; discovery radius defaults to 50 km |
| User abandons at step 5 (no photo) | Account exists but is not discoverable; re-entry resumes at step 5 |
| Photo fails moderation | User is told, onboarding resumes at step 5; two failures route to manual review |
| Under-18 date of birth | Account creation blocked, device soft-flagged |
| Reinstall within 30 days | Existing account restored, onboarding skipped |

## Configuration

| Key | Type | Default | Tunable without release |
|---|---|---|---|
| `onb_photo_required` | bool | `true` | Yes |
| `onb_interests_max` | int | `5` | Yes |
| `onb_discovery_radius_default_km` | int | `50` | Yes |
| `onb_notif_prompt_step` | int | `7` | Yes |

## Measurement

Primary metric: **onboarding completion rate** — installs reaching step 5 within 24 hours.

Full definitions and the event list are in the
[analytics entry](https://app.gitbook.com/s/XSPACE_ANALYTICS/foundations/event-taxonomy).

## Related

{% hint style="warning" icon="flask" %}
**Under test.** [EXP-2026-121](https://app.gitbook.com/s/XSPACE_EXPERIMENTS/active/exp-2026-121-taimi-onboarding-length)
runs the equivalent shortened flow on Taimi; if it wins, the same reduction is planned here.
{% endhint %}

- Adjacent specs: [Matching and discovery](matching-and-discovery.md),
  [Subscriptions and paywalls](subscriptions-and-paywalls.md)
- Last behaviour change: notification prompt moved from step 5 to step 7 —
  see the [Changelog](https://app.gitbook.com/s/XSPACE_CHANGELOG/)
