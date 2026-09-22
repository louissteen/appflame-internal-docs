---
description: >-
  What shipped, when, and which spec it changed. One entry per behaviour change,
  across all four products.
icon: clock-rotate-left
layout:
  width: wide
---

# Changelog

Every behaviour change across Hily, Taimi, AdConnect and Mailkeeper, newest first. Each
entry links to the spec it changed — an entry with no spec link means the spec was not
updated, which is a review failure.

Entries are drafted by the docs agent from merged PRs and concluded experiments, and
auto-merged. They are append-only: corrections are new entries, not edits.

{% updates format="full" %}

{% update date="2026-09-21" tags="taimi,experiment" %}
## EXP-2026-121 started — Taimi onboarding length

Taimi onboarding is now split 50/50 between the seven-step flow and a five-step flow that
defers interests and notification permission to the first session.

[Profile and identity](https://app.gitbook.com/s/XSPACE_SPECS/taimi/profile-and-identity) is
marked `under-test` until 2026-10-12.

Guardrail note: the share of users setting a visibility control is a hard stopping rule on
this experiment — see the
[experiment page](https://app.gitbook.com/s/XSPACE_EXPERIMENTS/active/exp-2026-121-taimi-onboarding-length).
{% endupdate %}

{% update date="2026-09-18" tags="docs" %}
## Knowledge base moved from Confluence to GitBook

The spec, analytics and changelog layers now live in Git-synced Markdown, gated behind SSO.
The technical layer has been retired — technical detail lives with the code it describes.

What changed for you:

| Before | Now |
|---|---|
| Confluence pages and macros | Markdown in `louissteen/appflame-internal-docs` |
| Confluence AI assistant | GitBook assistant + MCP connector |
| Edits published immediately | Edits reviewed as change requests |
| Experiments only in Jira | [Experiments](https://app.gitbook.com/s/XSPACE_EXPERIMENTS/) space |

Migration of AdConnect and Mailkeeper segmentation specs is still in progress.
{% endupdate %}

{% update date="2026-09-14" tags="hily,experiment" %}
## EXP-2026-114 started — Hily paywall timing

New Hily users are split 50/50 between seeing the paywall at their first displayed match
and seeing it after their first sent message.

[Subscriptions and paywalls](https://app.gitbook.com/s/XSPACE_SPECS/hily/subscriptions-and-paywalls)
is marked `under-test` until 2026-10-05.
{% endupdate %}

{% update date="2026-09-04" tags="mailkeeper,experiment" %}
## Per-user send-time model shipped

Mailkeeper win-back campaigns now send at each user's predicted active hour instead of a
fixed local 18:00. Incremental returning sessions rose 9.1% against the permanent holdout.

`mk_sendtime_model_enabled` is retained as an **operational** kill switch and is documented
in the [Lifecycle campaigns](https://app.gitbook.com/s/XSPACE_SPECS/mailkeeper/lifecycle-campaigns)
configuration table.

Side effect: cap-suppressed sends rose 1.3pp as sends concentrated into predicted hours.
Suppression is now its own dashboard tile rather than being counted with delivery failures.

[Readout](https://app.gitbook.com/s/XSPACE_EXPERIMENTS/concluded/exp-2026-102-mailkeeper-send-time)
{% endupdate %}

{% update date="2026-09-02" tags="hily,analytics" %}
## Queue exhaustion reclassified on the product-health dashboard

Rising discovery queue exhaustion is no longer shown as a churn risk. EXP-2026-098 showed it
is a leading indicator of radius expansion, which correlates with more matches rather than
fewer.

The tile is now neutral and sits beside radius-expansion rate. See
[dashboards](https://app.gitbook.com/s/XSPACE_ANALYTICS/reporting/dashboards).
{% endupdate %}

{% update date="2026-08-28" tags="hily,experiment" %}
## Discovery recency weighting increased

The inactivity cutoff in the Hily discovery queue moved from 7 days to 72 hours, and recent
activity is weighted more strongly. Match rate per session rose 6.4%.

`disc_inactive_cutoff_hours` now defaults to `72` — see
[Matching and discovery](https://app.gitbook.com/s/XSPACE_SPECS/hily/matching-and-discovery).

[Readout](https://app.gitbook.com/s/XSPACE_EXPERIMENTS/concluded/exp-2026-098-hily-match-queue-ranking)
{% endupdate %}

{% update date="2026-08-19" tags="hily" %}
## Notification permission prompt moved to the end of onboarding

The Hily notification prompt moved from step 5 to step 7, after the photo step. Push opt-in
rate was unchanged; onboarding completion rose slightly.

[Onboarding flow](https://app.gitbook.com/s/XSPACE_SPECS/hily/onboarding-flow)
{% endupdate %}

{% update date="2026-08-06" tags="analytics,breaking" %}
## Event schema 2026-07 is now required

`schema_version` `2026-07` is mandatory on all events. Two properties were retyped, which is
a breaking change for any consumer reading them directly.

| Property | Was | Now |
|---|---|---|
| `experiment_assignments` | string (JSON) | map |
| `position_in_queue` | string | int |

Dashboards and the published retention tables were migrated on the same day. Ad-hoc queries
reading the old types need updating — see
[event taxonomy](https://app.gitbook.com/s/XSPACE_ANALYTICS/foundations/event-taxonomy).
{% endupdate %}

{% update date="2026-07-29" tags="taimi" %}
## Region-aware discoverability defaults

Accounts created in a defined set of regions now default to link-only visibility rather than
queue visibility. Existing accounts were not changed.

`profile_region_linkonly_default` is tunable without a release. See
[Profile and identity](https://app.gitbook.com/s/XSPACE_SPECS/taimi/profile-and-identity).
{% endupdate %}

{% endupdates %}
