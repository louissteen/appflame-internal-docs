---
description: >-
  Event naming rules, the properties every event carries, and the data we
  deliberately never collect.
icon: sitemap
---

# Event taxonomy

## Naming rule

```
<object>_<past_tense_verb>
```

Lower snake case, object first, verb in the past tense. The event is a record of something
that happened, so `paywall_viewed`, never `view_paywall` or `PaywallView`.

| Good | Bad | Why |
|---|---|---|
| `match_created` | `new_match` | No verb; sorts away from other `match_*` events |
| `paywall_viewed` | `paywall_impression` | Inconsistent verb form |
| `onboarding_step_completed` | `onb_step_done` | Abbreviations do not survive six months |
| `campaign_suppressed` | `campaign_fail` | Suppression is not a failure |

## Properties on every event

| Property | Type | Notes |
|---|---|---|
| `event_name` | string | As above |
| `event_ts` | timestamp | Client time, UTC |
| `ingest_ts` | timestamp | Server receipt time, UTC |
| `account_id` | string | Pseudonymous, stable across reinstall |
| `product` | enum | `hily` \| `taimi` \| `adconnect` \| `mailkeeper` |
| `platform` | enum | `ios` \| `android` \| `web` |
| `app_version` | string | Semver |
| `schema_version` | string | Currently <code class="expression">space.vars.event_schema_version</code> |
| `experiment_assignments` | map | Experiment ID → variant, for every active assignment |

{% hint style="info" icon="flask" %}
**`experiment_assignments` is what makes experiment readouts possible without joins.** Every
event carries the full assignment map at the moment it fired, so a readout never has to
reconstruct who was in which variant at which time.
{% endhint %}

## Core event families

{% tabs %}
{% tab title="Onboarding" %}
| Event | Key properties |
|---|---|
| `onboarding_started` | `entry_point` |
| `onboarding_step_completed` | `step_index`, `step_name` |
| `onboarding_step_skipped` | `step_index`, `step_name` |
| `onboarding_completed` | `duration_seconds`, `steps_skipped` |
| `onboarding_abandoned` | `last_step_index` |
{% endtab %}

{% tab title="Discovery" %}
| Event | Key properties |
|---|---|
| `discovery_session_started` | `queue_size`, `radius_km` |
| `profile_shown` | `position_in_queue` |
| `profile_actioned` | `action` (`like` \| `pass` \| `rewind`) |
| `match_created` | `mutual_within_seconds` |
| `queue_exhausted` | `profiles_shown`, `radius_km` |
{% endtab %}

{% tab title="Monetisation" %}
| Event | Key properties |
|---|---|
| `paywall_viewed` | `trigger` (`first_match` \| `first_message` \| `weekly` \| `gate` \| `limit`), `variant` |
| `paywall_dismissed` | `seconds_visible` |
| `trial_started` | `plan_id`, `trial_days` |
| `subscription_state_changed` | `from_state`, `to_state`, `reason` |
{% endtab %}

{% tab title="Messaging" %}
| Event | Key properties |
|---|---|
| `campaign_eligible` | `campaign_id` |
| `campaign_sent` | `campaign_id`, `channel`, `predicted_hour` |
| `campaign_suppressed` | `campaign_id`, `reason` (`global_cap` \| `no_consent` \| `in_app` \| `dedup`) |
| `campaign_opened` | `campaign_id`, `channel` |
| `session_started` | `attributed_campaign_id` (nullable) |
{% endtab %}
{% endtabs %}

## What we never collect

{% hint style="danger" icon="ban" %}
The following are **not** sent to analytics, from any product, under any circumstance:

- Message content, or any derivative of it (length is allowed; content is not)
- Photo content, or classifier outputs derived from photos
- Taimi gender, orientation or pronoun **values** — only the count of fields set
- Precise location — only a coarse geohash at city granularity
- Contact book, device contacts or any address-book derived identifier
- Anything that would let an identity term be inferred from behaviour

An event proposing to carry any of the above is rejected at schema review. This is a
product and legal boundary, not an engineering preference.
{% endhint %}

## Adding an event

{% stepper %}
{% step %}
### Propose the schema

Open a change request on this page adding the event to the relevant family table. Name,
properties, types, and which spec it supports.
{% endstep %}

{% step %}
### Get schema review

<code class="expression">space.vars.analytics_owner</code> reviews for naming, redundancy
and the "never collect" list. Most rejections are redundancy — the event already exists
under a different name.
{% endstep %}

{% step %}
### Bump `schema_version` if it is breaking

Adding an event or an optional property is additive. Removing or retyping a property is
breaking and requires a version bump plus a migration note.
{% endstep %}

{% step %}
### Link it from the spec

The spec's Measurement section references the events it relies on. An event with no spec
referencing it will be deprecated at the next audit.
{% endstep %}
{% endstepper %}
