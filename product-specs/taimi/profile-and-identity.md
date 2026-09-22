---
description: >-
  Taimi's open identity model, per-audience visibility controls, and what is
  never inferred from a profile.
icon: id-card
product: taimi
surface: profile
status: current
reviewed: 2026-09-12
---

# Profile and identity

## Summary

Taimi profiles use an open identity model: users select any number of gender and
orientation terms from a curated, extensible list, and control who can see each part of
their profile independently. Nothing about identity is inferred, and nothing is required
beyond age verification.

## Surfaces

| Platform | Surface | Entry point |
|---|---|---|
| iOS | Profile editor | Profile tab → Edit |
| Android | Profile editor | Profile tab → Edit |
| Web | Profile editor, read + write | Account settings |

## Behaviour

### Identity fields

| Field | Type | Required | Visible to |
|---|---|---|---|
| Display name | Text | Yes | Everyone |
| Age | Derived from DOB | Yes | Everyone |
| Gender terms | Multi-select, 0..n | No | Per user's choice |
| Orientation terms | Multi-select, 0..n | No | Per user's choice |
| Pronouns | Free text, max 24 chars | No | Everyone if set |
| Relationship intent | Single select | No | Everyone if set |

### Visibility controls

| Audience | Default | User-changeable |
|---|---|---|
| People I have matched with | Full profile | No |
| People in my discovery queue | Full profile minus hidden fields | Yes |
| Anyone with a profile link | Name and photo only | Yes |
| Search engines | Nothing | No — hard off |

## Edge cases

| Situation | Behaviour |
|---|---|
| User clears all identity fields | Profile remains valid and discoverable |
| User hides pronouns after matching | Hidden immediately, including in existing chats |
| Term removed from the curated list | Existing selections retained, shown as-is |
| Account reported for identity abuse | Fields frozen pending review, profile stays visible |
| User in a region with restricted discoverability | Defaults to link-only visibility on account creation |

{% hint style="warning" icon="lock" %}
**Never inferred.** Gender, orientation and pronouns are never derived from photos, names,
behaviour or matches — not for ranking, not for targeting, not for analytics segmentation.
Any proposal that would do so is a product-council decision, not a spec change.
{% endhint %}

## Configuration

| Key | Type | Default | Tunable without release |
|---|---|---|---|
| `profile_terms_list_version` | string | `2026-07` | Yes |
| `profile_pronoun_max_len` | int | `24` | Yes |
| `profile_region_linkonly_default` | list | region set | Yes |

## Measurement

Primary metric: **profile completion rate** (share of accounts with photo + at least one
identity field within 7 days).

Identity field *values* are not sent to analytics — only counts. See
[event taxonomy](https://app.gitbook.com/s/XSPACE_ANALYTICS/foundations/event-taxonomy).

## Related

- Adjacent specs: [Taimi overview](README.md)
- Active experiments: [EXP-2026-121](https://app.gitbook.com/s/XSPACE_EXPERIMENTS/active/exp-2026-121-taimi-onboarding-length)
