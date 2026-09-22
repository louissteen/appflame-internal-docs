---
description: >-
  The shape of a changelog entry, what it must link to, and why entries are never
  edited.
icon: pen-to-square
---

# How to write an entry

Most entries are drafted by the docs agent and auto-merged. This page is for the ones you
write yourself, and for reviewing the ones the agent writes.

## The shape

````markdown
{% update date="2026-09-04" tags="mailkeeper,experiment" %}
## Short, specific title in the past tense

One or two sentences saying what changed and what moved as a result.

Any configuration key that changed, with its new default.

[Link to the spec that changed](https://app.gitbook.com/s/<spaceId>/<path>)
{% endupdate %}
````

## Rules

| Rule | Why |
|---|---|
| One behaviour change per entry | Entries are scanned, not read |
| Title in the past tense, naming the surface | "Paywall moved to first message", not "Paywall improvements" |
| Always link the spec that changed | An entry with no spec link means the spec was not updated |
| Tag the product, and `experiment` if one concluded | Tags are the only filter readers have |
| Include the config key and its new value | The most common follow-up question |
| Never edit a published entry | Corrections are new entries — see below |

## Tags

Defined in `.gitbook/tags.yaml`:

`hily` · `taimi` · `adconnect` · `mailkeeper` · `experiment` · `analytics` · `docs` ·
`breaking`

Use `breaking` only for changes that require someone outside the owning team to act — a
retyped event property, a removed config key, a changed API contract.

## Why entries are append-only

{% hint style="warning" icon="lock" %}
**A changelog is a record of what we believed at a point in time.** Editing an old entry to
match current understanding destroys exactly the information a reader is looking for when
they read the changelog at all — namely, when something changed and what we thought then.

If an entry was wrong, write a new entry saying so and link back to it.
{% endhint %}

## What does not go in the changelog

- Copy and asset changes with no behaviour effect
- Internal refactors with no user-visible or measurable effect
- Experiment *results* — those go in the experiment readout; the changelog gets the
  **shipping** decision
- Knowledge base structure changes, unless they change where people should look
