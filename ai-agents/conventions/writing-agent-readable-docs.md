---
description: >-
  Concrete patterns that make a page retrievable, and the Confluence habits we
  had to unlearn.
icon: brain-circuit
---

# Writing agent-readable docs

The short version: an agent retrieves **whole pages** and reads them without context. Every
habit that assumes the reader already knows something hurts.

## The four properties that matter

{% stepper %}
{% step %}
### Self-contained

A page must make sense with no other page loaded. Restate the product and surface in the
first paragraph even though they are in the title and the frontmatter — retrieval often
delivers the body without them.
{% endstep %}

{% step %}
### Unambiguous nouns

"The screen", "this flow", "the new version" all resolve to nothing outside the author's
head. Name things exactly, every time, even when it reads repetitively.
{% endstep %}

{% step %}
### Exhaustive conditions

Agents do not infer the unstated case. If a table has rows for premium and free users but
not for users in a grace period, the agent will invent an answer for grace period. Add the
row, even if the answer is "same as free".
{% endstep %}

{% step %}
### One canonical home per fact

Duplicated facts drift. When two pages disagree, retrieval returns whichever ranks higher —
which is not necessarily the correct one. Link instead of copying.
{% endstep %}
{% endstepper %}

## Confluence habits to unlearn

| Habit | Why it broke retrieval | Replacement |
|---|---|---|
| Long "everything about X" pages | One retrieval returns 8,000 words, most irrelevant | One feature per page |
| Nested page trees mirroring team structure | Teams reorganise; surfaces do not | Structure by surface |
| Status macros and rendered widgets | The status is not in the text | Status in frontmatter and in a table |
| Screenshots of config screens | Values are unreadable | Configuration tables |
| "See the ticket for details" | The details never come back | Details in the page, ticket as a link |
| Comments carrying the real answer | Comments are not part of the page | Fold the answer into the body |
| Draft pages left published | Retrieval cannot tell draft from current | Delete drafts, or keep them out of `SUMMARY.md` |

## A test you can run in ten seconds

Copy the page into a fresh chat with no other context and ask the model the question the
page is meant to answer. If it hedges, guesses, or asks which product you mean, the page is
not self-contained yet.

{% hint style="info" icon="flask" %}
This is genuinely how we review new spec formats. It is faster than arguing about style, and
it produces the same verdict a human skim-reader would give — because the failure modes are
the same ones.
{% endhint %}

## Anti-patterns with fixes

{% expandable title="The implied default" %}
> "Premium users get expanded radius."

What about free users? The page never says. **Fix:** every table gets a row per case,
including the boring ones.
{% endexpandable %}

{% expandable title="The historical narrative" %}
> "We used to show this at step 3, then we moved it to step 5 during the Q2 test, and now
> it's at step 7."

Three behaviours, one of which is current. **Fix:** state the current behaviour; put the
history in the changelog.
{% endexpandable %}

{% expandable title="The cross-page pronoun" %}
> "As described above, this applies here too."

"Above" does not survive chunking. **Fix:** restate the rule or link to it explicitly.
{% endexpandable %}

{% expandable title="The silent platform divergence" %}
> "Tapping the card opens the profile."

True on iOS, not on web. **Fix:** the Surfaces table lists every platform, and "not
available" is a valid row.
{% endexpandable %}
