---
description: >-
  Shipping a winner, removing the flag, and the cleanup step that is skipped most
  often.
icon: broom
---

# Rollout and cleanup

## Rollout stages

| Stage | Population | Minimum duration | Gate to next stage |
|---|---|---|---|
| Internal | appflame employees | 2 days | No crash or guardrail regression |
| Canary | 5% of eligible users | 3 days | Primary metric not negative |
| Ramp | 25% → 50% | 3 days each | Guardrails stable |
| Full | 100% minus holdout | — | — |
| Holdout release | Holdout folded in | After 30 days | Long-run effect measured |

{% hint style="info" icon="users" %}
**Keep the 2% holdout for 30 days after full rollout.** Short-run wins that decay are
common on monetisation surfaces in particular — a paywall change that lifts trial starts in
week one and depresses D30 retention looks like a win until the holdout says otherwise.
{% endhint %}

## Cleanup checklist

This is the step that gets skipped, and every skipped cleanup leaves a permanent piece of
undocumented behaviour behind.

{% stepper %}
{% step %}
### Update the spec

Rewrite the Behaviour table to describe the new production behaviour. Delete the old rows —
do not annotate them as "previously".
{% endstep %}

{% step %}
### Remove the `under-test` marker

Set the spec's frontmatter `status` back to `current` and update `reviewed` to today.
{% endstep %}

{% step %}
### Write the changelog entry

Link it to the spec that changed and to the experiment readout. A changelog entry with no
spec link means the spec was not updated.
{% endstep %}

{% step %}
### Delete the flag

Remove the remote-config key and the branching code. A flag left at 100% is behaviour that
is not in the spec and not in the codebase's control flow in any obvious way.
{% endstep %}

{% step %}
### Move the experiment page

From `active/` to `concluded/`, with the readout complete. Update `SUMMARY.md`.
{% endstep %}
{% endstepper %}

## Flags that outlive their experiment

Some flags are meant to survive — kill switches, region gates, load shedding. These are
**operational flags**, not experiment flags, and they must be documented in the owning
spec's Configuration table with `Tunable without release: Yes`.

| Flag type | Lifetime | Documented in |
|---|---|---|
| Experiment flag | Until rollout completes | Experiment page only |
| Operational flag | Indefinite | Spec Configuration table |
| Region gate | Indefinite | Spec Behaviour table |
| Kill switch | Indefinite | Spec Configuration table |

{% hint style="danger" icon="ghost" %}
**An undeleted experiment flag is the worst of both worlds.** It is not in the spec, so
nobody documents it; it is not in the experiment page, because that experiment concluded;
and it is still branching production traffic. The quarterly flag audit exists entirely
because of this.
{% endhint %}
