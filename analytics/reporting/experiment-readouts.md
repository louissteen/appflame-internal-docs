---
description: >-
  How we compute significance, how results are written up, and the conclusions we
  refuse to draw.
icon: flask-vial
---

# Experiment readouts

## The readout template

Every readout has the same four parts, in this order:

{% stepper %}
{% step %}
### Results table

Every declared metric — primary, guardrails, secondary — with control, treatment, relative
delta and significance. Metrics that were not declared up front do not appear.
{% endstep %}

{% step %}
### Decision

Ship, revert, or extend. One paragraph of reasoning. The decision is stated even when it is
obvious.
{% endstep %}

{% step %}
### What we learned beyond the result

Optional but strongly encouraged. This is where the durable knowledge lives — the
reclassification of queue exhaustion came from here, not from the results table.
{% endstep %}

{% step %}
### Cleanup checklist

The five boxes from
[rollout and cleanup](https://appflame.gitbook.io/appflame-knowledge-base/experiments/lifecycle/rollout-and-cleanup),
ticked or explicitly deferred.
{% endstep %}
{% endstepper %}

## Statistics, briefly

| Question | Our answer |
|---|---|
| Test | Two-sided, 95% confidence |
| Minimum runtime | 14 days, always — weekly seasonality is real |
| Minimum sample | Powered for the declared MDE at 80% |
| Peeking | Monitoring for guardrail breaches is allowed; calling the primary metric early is not |
| Multiple comparisons | Guardrails are not corrected; secondary metrics are treated as directional only |
| Novelty effects | New-user-only experiments are preferred where the surface allows it |

## Conclusions we refuse to draw

{% hint style="danger" icon="ban" %}
These are rejected at readout review, regardless of how the numbers look:

- **A non-significant result reported as a small win.** "Directionally positive" is not a
  result. Write "no detectable effect".
- **A primary metric swapped after the fact** because a secondary one looked better.
- **A subgroup win reported as the headline** when the overall result was flat. Subgroups
  are hypotheses for the next experiment, not conclusions from this one.
- **A guardrail breach explained away.** The stopping rule already fired; the discussion is
  about what to do next, not whether it counted.
- **A win claimed from the same holdout by two campaigns** without accounting for overlap.
{% endhint %}

## Who writes what

| Part | Written by | Reviewed by |
|---|---|---|
| Results table | Analytics | Experiment owner |
| Decision | Experiment owner | Product council for monetisation and safety surfaces |
| Learnings | Experiment owner | — |
| Spec update | Experiment owner | Feature PM + one engineer |
| Changelog entry | Docs agent | Auto-merged |
