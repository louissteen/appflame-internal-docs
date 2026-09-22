---
description: >-
  Every metric used across specs, experiments and dashboards — with its formula,
  its window, and its caveats.
icon: ruler
---

# Metric definitions

One definition per metric. If a number is quoted anywhere in the knowledge base, it is
defined in this table.

## Acquisition and onboarding

<table><thead><tr><th width="250">Metric</th><th>Definition</th><th width="140">Window</th></tr></thead><tbody>
<tr>
  <td><code>onboarding_completion_rate_24h</code></td>
  <td>Installs that reach the end of the photo step, divided by installs that reach step 1.</td>
  <td>24h from install</td>
</tr>
<tr>
  <td><code>profile_completion_rate_d7</code></td>
  <td>Accounts with at least one photo and at least one optional field set, divided by accounts created.</td>
  <td>7 days</td>
</tr>
<tr>
  <td><code>push_optin_rate_d7</code></td>
  <td>Accounts granting OS push permission, divided by accounts shown the prompt.</td>
  <td>7 days</td>
</tr>
</tbody></table>

## Engagement

<table><thead><tr><th width="250">Metric</th><th>Definition</th><th width="140">Window</th></tr></thead><tbody>
<tr>
  <td><code>match_rate_per_session</code></td>
  <td>Matches created, divided by discovery sessions with at least one profile shown.</td>
  <td>Per session</td>
</tr>
<tr>
  <td><code>messages_sent_per_match</code></td>
  <td>Messages sent, divided by matches created, counted on the match cohort.</td>
  <td>7 days from match</td>
</tr>
<tr>
  <td><code>d1_retention</code> / <code>d7_retention</code> / <code>d30_retention</code></td>
  <td>Accounts with a session on the Nth day after install, divided by accounts created. Day boundaries in the user's local timezone.</td>
  <td>N days</td>
</tr>
</tbody></table>

## Monetisation

<table><thead><tr><th width="250">Metric</th><th>Definition</th><th width="140">Window</th></tr></thead><tbody>
<tr>
  <td><code>trial_start_rate_per_paywall_view</code></td>
  <td>Trials started, divided by distinct paywall views. A user seeing the paywall twice counts twice.</td>
  <td>Per view, 1h attribution</td>
</tr>
<tr>
  <td><code>trial_to_paid_conversion</code></td>
  <td>Trials converting to a first paid renewal, divided by trials started.</td>
  <td>Trial length + 3 days</td>
</tr>
<tr>
  <td><code>refund_rate</code></td>
  <td>Store-issued refunds, divided by paid transactions, on the transaction cohort.</td>
  <td>30 days</td>
</tr>
</tbody></table>

## Retention messaging

<table><thead><tr><th width="250">Metric</th><th>Definition</th><th width="140">Window</th></tr></thead><tbody>
<tr>
  <td><code>incremental_returning_sessions</code></td>
  <td>Returning sessions per 1,000 eligible users, minus the same figure for the permanent 2% holdout.</td>
  <td>7 days from send</td>
</tr>
<tr>
  <td><code>campaign_suppression_rate</code></td>
  <td>Sends dropped by a frequency cap, divided by sends attempted.</td>
  <td>Per campaign, daily</td>
</tr>
</tbody></table>

## Caveats that bite

{% expandable title="Retention day boundaries are local, not UTC" %}
D1 retention uses the user's local calendar day. A user installing at 23:50 local time has
ten minutes of "day 0". This is deliberate — it matches how users experience the product —
but it means retention is not directly comparable with warehouse queries that bucket by
UTC. Always use the published retention tables rather than rolling your own.
{% endexpandable %}

{% expandable title="Paywall views are per view, not per user" %}
`trial_start_rate_per_paywall_view` has views in the denominator, so a change that shows
the paywall *less often* can raise the rate while lowering absolute trial starts. Any
experiment moving paywall frequency must report absolute trial starts alongside the rate.
This is exactly what EXP-2026-114 does.
{% endexpandable %}

{% expandable title="Identity fields are never in analytics" %}
Taimi gender, orientation and pronoun *values* are not sent to analytics. Only counts of
fields set are available. No metric here can be segmented by identity term, and no
dashboard offers it. See
[event taxonomy](event-taxonomy.md).
{% endexpandable %}

{% expandable title="Holdout is permanent and shared" %}
The 2% Mailkeeper holdout is a single global population, not per-campaign. Two campaigns
cannot each claim incremental effect against it without accounting for overlap; the
readout template handles this.
{% endexpandable %}
