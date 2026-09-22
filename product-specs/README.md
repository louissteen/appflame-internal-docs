---
description: >-
  The spec layer — what every feature does in production today, across Hily,
  Taimi, AdConnect and Mailkeeper.
icon: layer-group
---

# Product Specs

This space is the **spec layer** of the knowledge base: one page per feature, describing
what it does in production **today**. Not what was planned, not what is being tested — what
is live.

{% hint style="info" icon="circle-info" %}
Looking for intent and rationale before build? That is the PRD, in Jira. Looking for what is
being tested right now? That is
[Experiments](https://app.gitbook.com/s/w8Lmy2czsVcJjubyVtYO/). This space describes the
current production contract.
{% endhint %}

## Products

<table data-view="cards"><thead><tr><th></th><th></th><th></th><th data-hidden data-card-target data-type="content-ref"></th></tr></thead><tbody>
<tr>
  <td><h3><i class="fa-heart" style="color:$primary;">:heart:</i></h3></td>
  <td><strong>Hily</strong></td>
  <td>Dating app. Onboarding, matching, subscriptions.</td>
  <td><a href="hily/README.md">Hily</a></td>
</tr>
<tr>
  <td><h3><i class="fa-rainbow" style="color:$primary;">:rainbow:</i></h3></td>
  <td><strong>Taimi</strong></td>
  <td>Inclusive LGBTQ+ dating app. Profile, identity, safety.</td>
  <td><a href="taimi/README.md">Taimi</a></td>
</tr>
<tr>
  <td><h3><i class="fa-bullhorn" style="color:$primary;">:bullhorn:</i></h3></td>
  <td><strong>AdConnect</strong></td>
  <td>Performance marketing and digital product development.</td>
  <td><a href="adconnect/README.md">AdConnect</a></td>
</tr>
<tr>
  <td><h3><i class="fa-envelope" style="color:$primary;">:envelope:</i></h3></td>
  <td><strong>Mailkeeper</strong></td>
  <td>Retention SaaS — email, push and PWA channels.</td>
  <td><a href="mailkeeper/README.md">Mailkeeper</a></td>
</tr>
</tbody></table>

## Before you write a spec

{% stepper %}
{% step %}
### Check it does not already exist

Search the surface name first. Two half-specs for one feature is the single most common
failure mode in a knowledge base this size.
{% endstep %}

{% step %}
### Copy the template

Start from [the spec template](spec-format/spec-template.md). The section order is not
decorative — our agents rely on it.
{% endstep %}

{% step %}
### Write current behaviour, not history

If behaviour changed, describe the new behaviour and record the change in the
[Changelog](https://app.gitbook.com/s/pEcKz5cFtkAMLkJL7WhD/). Do not leave the old behaviour on
the page "for context".
{% endstep %}

{% step %}
### Link down and across

Every spec ends with links to its analytics entry and to any experiment touching it. A spec
with no outgoing links is a dead end for both readers.
{% endstep %}
{% endstepper %}

## Spec health

| State | Meaning | Action |
|---|---|---|
| ✅ Current | Reviewed within 90 days, matches production | None |
| ⚠️ Under test | An active experiment changes this behaviour | Read the linked experiment too |
| 🔴 Stale | Flagged by the docs agent as diverging from production | Owner has <code class="expression">space.vars.review_sla</code> to fix or confirm |
