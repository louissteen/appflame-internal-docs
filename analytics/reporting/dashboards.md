---
description: Which dashboard answers which question, and which ones not to trust for what.
icon: gauge
---

# Dashboards

Dashboards are entry points, not sources of truth. The definitions in
[metric definitions](../foundations/metric-definitions.md) are the source of truth; a
dashboard is one view over them.

## The standing dashboards

| Dashboard | Answers | Refresh | Owner |
|---|---|---|---|
| **Product health** | Are the core metrics stable this week? | Hourly | Analytics |
| **Onboarding funnel** | Where are new users dropping out, per product and platform? | Hourly | Product — Growth |
| **Monetisation** | Trial starts, conversion, refunds, by paywall trigger | Hourly | Product — Monetisation |
| **Experiment monitor** | Are any running experiments breaching a guardrail? | 15 min | Analytics |
| **Messaging delivery** | Sends, suppressions, opens, per campaign and channel | Hourly | Product — Retention |
| **Data freshness** | Is anything late or missing? | 5 min | Platform |

## Known traps

{% hint style="warning" icon="triangle-exclamation" %}
**Read this before quoting a dashboard number in a document.**
{% endhint %}

| Dashboard | Trap |
|---|---|
| Product health | Rolls up all four products; a Hily move can mask a Taimi regression. Always drill down before concluding. |
| Onboarding funnel | Counts *steps shown*, so an experiment that removes a step makes the funnel look shorter rather than better. Compare completion rate, not step counts. |
| Monetisation | Trial start *rate* is per paywall view. Check absolute trial starts alongside it. |
| Experiment monitor | Guardrail alerts use a 95% threshold and will produce false positives across many simultaneous experiments. An alert is a prompt to look, not a stopping decision. |
| Messaging delivery | Suppressions were historically bucketed with delivery failures. Since 2026-09 they are a separate tile — older screenshots mislead. |

## Queue exhaustion, reclassified

Until EXP-2026-098, rising queue exhaustion on Hily discovery was shown in red on the
product-health dashboard as a churn risk. The experiment showed it is a **leading indicator
of radius expansion**, and expansion correlates with more matches, not fewer.

It is now a neutral tile with radius-expansion rate beside it.

{% hint style="info" icon="lightbulb" %}
This is the kind of thing that only ever gets written down if experiment readouts are
documented somewhere a person will read them. It came out of
[EXP-2026-098](https://appflame.gitbook.io/appflame-knowledge-base/experiments/concluded/exp-2026-098-hily-match-queue-ranking),
not out of a dashboard review.
{% endhint %}

## Requesting a new dashboard

Before requesting one, check whether the question is really a **metric definition gap**.
Most new-dashboard requests are actually "nobody agrees what this number means" — which a
dashboard will not fix.
