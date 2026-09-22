---
description: >-
  The analytics layer — metric definitions, the event taxonomy behind them, and
  how experiment results are read.
icon: chart-line
---

# Analytics

This space answers one question authoritatively: **what does this number actually mean?**

Every metric referenced in a spec, an experiment or a dashboard is defined here, once. If
two teams disagree about a number, the disagreement is resolved by changing the definition
on this page — not by each team keeping its own.

{% hint style="info" icon="database" %}
Data lands in <code class="expression">space.vars.warehouse</code> with a freshness SLA of
<code class="expression">space.vars.freshness_sla</code>. Current event schema version is
<code class="expression">space.vars.event_schema_version</code>. Questions go to
<code class="expression">space.vars.analytics_owner</code>.
{% endhint %}

## Start here

<table data-view="cards"><thead><tr><th></th><th></th><th></th><th data-hidden data-card-target data-type="content-ref"></th></tr></thead><tbody>
<tr>
  <td><h3><i class="fa-ruler" style="color:$primary;">:ruler:</i></h3></td>
  <td><strong>Metric definitions</strong></td>
  <td>Every metric, its formula, and its known caveats.</td>
  <td><a href="foundations/metric-definitions.md">metric-definitions</a></td>
</tr>
<tr>
  <td><h3><i class="fa-sitemap" style="color:$primary;">:sitemap:</i></h3></td>
  <td><strong>Event taxonomy</strong></td>
  <td>Naming rules, required properties, and what we never send.</td>
  <td><a href="foundations/event-taxonomy.md">event-taxonomy</a></td>
</tr>
<tr>
  <td><h3><i class="fa-gauge" style="color:$primary;">:gauge:</i></h3></td>
  <td><strong>Dashboards</strong></td>
  <td>Which dashboard answers which question.</td>
  <td><a href="reporting/dashboards.md">dashboards</a></td>
</tr>
<tr>
  <td><h3><i class="fa-flask-vial" style="color:$primary;">:flask-vial:</i></h3></td>
  <td><strong>Experiment readouts</strong></td>
  <td>How we compute significance and what we refuse to conclude.</td>
  <td><a href="reporting/experiment-readouts.md">experiment-readouts</a></td>
</tr>
</tbody></table>

## The rule that keeps this space honest

{% hint style="danger" icon="triangle-exclamation" %}
**A metric that appears in a spec or an experiment must exist here first.** If you find
yourself writing "we measure engagement" in a spec, stop — either the metric is defined
here and you should link it, or it is not defined and the spec cannot claim it.
{% endhint %}
