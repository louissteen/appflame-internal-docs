---
description: >-
  The same page has to work for a PM skimming it in two minutes and for an agent
  retrieving it as context. Here is how to satisfy both.
icon: pen-nib
---

# Writing for humans and agents

Almost every page here is read twice: once by a person who wants a quick answer, and once
by an agent assembling context before it writes code or updates a spec. These two readers
want surprisingly similar things.

## What both readers need

| Both want | Because a human… | Because an agent… |
|---|---|---|
| A one-sentence description at the top | skims before committing to read | uses it for retrieval ranking |
| Explicit nouns instead of "it" and "this" | loses the thread on long pages | resolves pronouns badly across chunks |
| Tables over prose for parallel facts | scans a table faster | parses a table unambiguously |
| Stated conditions, not implied ones | misreads implication | cannot infer what you left out |
| Links instead of repetition | wants the canonical answer | follows the link rather than guessing |

## Rules that are actually enforced in review

{% stepper %}
{% step %}
### Lead with the answer

The first paragraph states what the feature does. Background, history and rationale come
after. If a reader stops after paragraph one, they should still be correct.
{% endstep %}

{% step %}
### One feature per page

Do not document the paywall and the subscription renewal flow on the same page because
they are "related". Agents retrieve whole pages; a page covering two things pollutes every
retrieval for both.
{% endstep %}

{% step %}
### Name the surface precisely

"The onboarding screen" is ambiguous across four products. Write **Hily → onboarding →
step 3 (photo upload)**. Precision here is what makes cross-product search usable.
{% endstep %}

{% step %}
### Put conditions in tables, not sentences

A sentence like "premium users on iOS see the new paywall unless they are in the EU" is
three conditions hiding in one clause. Make it a table with one row per case.
{% endstep %}

{% step %}
### Never make a screenshot load-bearing

Screenshots are welcome as illustration. If the only place a threshold, copy string or
state name appears is inside an image, an agent cannot read it — and neither can search.
{% endstep %}
{% endstepper %}

## Things that break agent retrieval

{% hint style="danger" icon="bug" %}
These are the patterns we migrated away from Confluence specifically to avoid:

- **Rendered macros and embedded widgets** whose content is not in the source text.
- **Expand/collapse used to hide the actual answer** — the answer should be in the page body.
- **Tables of links with no text**, which carry no meaning once flattened.
- **Page titles like "Notes" or "WIP"**, which match nothing and rank badly.
- **Duplicated content across several pages**, so retrieval returns whichever copy is stalest.
{% endhint %}

## A worked before-and-after

{% tabs %}
{% tab title="Before" %}
```markdown
## Paywall

We show the paywall at a good moment in onboarding. It was moved recently after
testing and seems to work better now. See the Jira ticket for details.
```

Nothing here is retrievable: no surface, no condition, no metric, no link.
{% endtab %}

{% tab title="After" %}
```markdown
## Paywall placement (Hily, iOS and Android)

The subscription paywall is shown after onboarding step 5 (first match shown),
not during onboarding.

| Condition | Paywall shown |
|---|---|
| New user, completed onboarding | After first match is displayed |
| New user, abandoned onboarding | Not shown |
| Returning free user | On third session of the week |

Measured by `paywall_view` → `subscription_started`; see the analytics entry.
Changed by EXP-2026-114.
```
{% endtab %}
{% endtabs %}

## Length

Aim for pages that a person can read in three to five minutes. When a spec grows past that,
it is usually two features wearing a trench coat — split it and link the halves.
