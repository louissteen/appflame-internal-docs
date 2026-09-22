---
description: >-
  The frontmatter fields agents rely on, which are mandatory where, and what
  breaks when one is missing.
icon: file-code
---

# Frontmatter contract

Frontmatter is not metadata decoration. Three automations read it, and each one fails
quietly when a field is missing.

## Fields by space

<table><thead><tr><th width="180">Field</th><th width="120">Spaces</th><th width="110">Required</th><th>Purpose</th></tr></thead><tbody>
<tr><td><code>description</code></td><td>All</td><td>Yes</td><td>Search ranking, assistant answers, sidebar previews</td></tr>
<tr><td><code>icon</code></td><td>All</td><td>Recommended</td><td>Navigation legibility</td></tr>
<tr><td><code>product</code></td><td>Product Specs</td><td>Yes</td><td>Scoping a query to one product</td></tr>
<tr><td><code>surface</code></td><td>Product Specs</td><td>Yes</td><td>Mapping a code change to a spec</td></tr>
<tr><td><code>status</code></td><td>Product Specs</td><td>Yes</td><td><code>current</code> / <code>under-test</code> / <code>stale</code></td></tr>
<tr><td><code>reviewed</code></td><td>Product Specs</td><td>Yes</td><td>Staleness clock (90 days)</td></tr>
<tr><td><code>affects</code></td><td>Experiments</td><td>Yes</td><td>Marks the listed specs <code>under-test</code></td></tr>
<tr><td><code>primary_metric</code></td><td>Experiments</td><td>Yes</td><td>Prevents post-hoc metric swapping</td></tr>
<tr><td><code>ends</code></td><td>Experiments</td><td>Yes</td><td>Readout due date</td></tr>
</tbody></table>

## What breaks when a field is missing

| Missing field | Symptom |
|---|---|
| `description` | Page ranks poorly; the assistant summarises the first paragraph instead, often badly |
| `product` | Cross-product queries return the wrong product's spec with no way to tell |
| `surface` | The PR agent cannot find the spec matching a code change, so no doc update is proposed |
| `status` | Spec is treated as current even while an experiment is changing it |
| `reviewed` | Staleness job skips the page — it never gets flagged, ever |
| `affects` | Experiment is invisible from the spec side; readers see stale behaviour as fact |
| `ends` | Experiment runs indefinitely and becomes untracked permanent behaviour |

{% hint style="danger" icon="eye-slash" %}
**A missing `reviewed` date is the worst failure**, because the page simply drops out of
the staleness system rather than erroring. It looks maintained forever. Any spec added
without `reviewed` is rejected at review.
{% endhint %}

## Worked examples

{% tabs %}
{% tab title="Spec page" %}
```yaml
---
description: >-
  Subscription tiers, paywall placement, and the subscription state machine
  across stores.
icon: circle-dollar-to-slot
product: hily
surface: monetisation
status: under-test
reviewed: 2026-09-19
---
```
{% endtab %}

{% tab title="Experiment page" %}
```yaml
---
description: >-
  Does showing the Hily paywall after the first sent message instead of the
  first match raise trial starts without hurting D7 retention?
icon: flask
status: running
affects:
  - product-specs/hily/subscriptions-and-paywalls.md
primary_metric: trial_start_rate_per_paywall_view
ends: 2026-10-05
---
```
{% endtab %}

{% tab title="Analytics page" %}
```yaml
---
description: >-
  Event naming rules, the properties every event carries, and the data we
  deliberately never collect.
icon: sitemap
---
```
{% endtab %}
{% endtabs %}

## Writing a good `description`

It is the single highest-leverage line on the page — it is what search matches, what the
assistant quotes, and what a reader sees before deciding to open it.

| Do | Don't |
|---|---|
| Name the product and surface | "Documentation for the paywall" |
| State what the page answers | "This page covers various aspects…" |
| One or two sentences | A paragraph |
| Present tense, concrete nouns | Aspirational or future tense |

{% hint style="warning" icon="robot" %}
**Do not paste the page title into the description.** A description that repeats the title
adds nothing to retrieval and wastes the one line the assistant will read first.
{% endhint %}
