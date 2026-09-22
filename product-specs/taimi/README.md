---
description: >-
  Taimi — an inclusive LGBTQ+ dating app. Spec index, and the principles that
  make its specs differ from Hily's.
icon: rainbow
product: taimi
status: current
reviewed: 2026-09-12
---

# Taimi overview

Taimi is an inclusive LGBTQ+ dating app, thoughtfully designed to let users explore their
diverse romantic and sexual preferences. It shares infrastructure with Hily but **does not
share product decisions** — and specs must never assume it does.

## Where Taimi deliberately differs

| Area | Hily | Taimi |
|---|---|---|
| Gender and orientation | Two-field model | Open identity model, multi-select |
| Visibility | Public by default | Granular, per-audience controls |
| Safety | Standard report/block | Additional identity-protection tooling |
| Region handling | Store availability | Region-aware discoverability defaults |

{% hint style="danger" icon="shield-halved" %}
**Safety-relevant behaviour is never simplified in a spec.** If a condition affects who can
see a user, spell out every case in the Behaviour table. "Roughly the same as Hily" is not
an acceptable description on any Taimi safety surface.
{% endhint %}

## Surfaces

| Surface | Spec | Owner |
|---|---|---|
| Profile & identity | [Profile and identity](profile-and-identity.md) | Product — Taimi |
| Onboarding | Under test — see [EXP-2026-121](https://app.gitbook.com/s/w8Lmy2czsVcJjubyVtYO/active/exp-2026-121-taimi-onboarding-length) | Product — Growth |
| Discovery | Shares the Hily ranking contract with region-aware defaults | Product — Core |
