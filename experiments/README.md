---
description: >-
  Every active and concluded experiment, what surface it touches, and where its
  result lands. The layer that used to live only in Jira.
icon: flask
---

# Experiments

This space exists because of a specific failure: **a large share of what is actually true
about our products lives in active experiments, and that knowledge used to sit in Jira
tickets and code changes where neither people nor agents could find it.**

An experiment page is the bridge. It names the surfaces it changes, so a reader looking at
a spec can see what is currently being tested on it, and an agent reading a spec can be
told "this behaviour is under test" instead of asserting it confidently.

{% hint style="warning" icon="triangle-exclamation" %}
**A spec describes production. An experiment describes a deviation from it.** If you only
read the spec for a surface with an active experiment, you will be right for the control
group and wrong for everyone else.
{% endhint %}

## Currently running

| ID | Surface | Hypothesis | Ends |
|---|---|---|---|
| [EXP-2026-114](active/exp-2026-114-hily-paywall-timing.md) | Hily → paywall | Later paywall raises trial starts without hurting D7 | 2026-10-05 |
| [EXP-2026-121](active/exp-2026-121-taimi-onboarding-length.md) | Taimi → onboarding | Cutting two steps raises completion without lowering profile quality | 2026-10-12 |

## Recently concluded

| ID | Surface | Outcome |
|---|---|---|
| [EXP-2026-098](concluded/exp-2026-098-hily-match-queue-ranking.md) | Hily → discovery | **Shipped** — recency weighting increased |
| [EXP-2026-102](concluded/exp-2026-102-mailkeeper-send-time.md) | Mailkeeper → campaigns | **Shipped** — per-user send-time model |

## How to use this space

<table data-view="cards"><thead><tr><th></th><th></th><th></th><th data-hidden data-card-target data-type="content-ref"></th></tr></thead><tbody>
<tr>
  <td><h3><i class="fa-timeline" style="color:$primary;">:timeline:</i></h3></td>
  <td><strong>Experiment lifecycle</strong></td>
  <td>From hypothesis to readout to spec update.</td>
  <td><a href="lifecycle/experiment-lifecycle.md">experiment-lifecycle</a></td>
</tr>
<tr>
  <td><h3><i class="fa-robot" style="color:$primary;">:robot:</i></h3></td>
  <td><strong>PRD to docs</strong></td>
  <td>How the agent turns a closed PRD into documentation.</td>
  <td><a href="lifecycle/prd-to-docs-pipeline.md">prd-to-docs-pipeline</a></td>
</tr>
<tr>
  <td><h3><i class="fa-broom" style="color:$primary;">:broom:</i></h3></td>
  <td><strong>Rollout and cleanup</strong></td>
  <td>Shipping the winner and deleting the flag.</td>
  <td><a href="lifecycle/rollout-and-cleanup.md">rollout-and-cleanup</a></td>
</tr>
</tbody></table>
