---
description: >-
  Turning an answer given in Slack into a change request, so the same question
  is not asked again next month.
icon: slack
---

# Slack agent

## The problem it solves

The most reliable way to find out how something works at appflame used to be to ask in
Slack. Someone who knew would answer, the answer was correct, and it was unfindable three
weeks later. Every such exchange is a documentation bug that has already been fixed and
then thrown away.

## How it works

The GitBook agent lives in <code class="expression">space.vars.agent_channel</code> and can
be mentioned in any channel.

{% stepper %}
{% step %}
### Someone asks, someone answers

Normal Slack. No special format required.
{% endstep %}

{% step %}
### Mention the agent in the thread

> @GitBook capture this — Hily paywall grace period behaviour

The agent reads the thread, not just the mention.
{% endstep %}

{% step %}
### The agent finds the right page

It searches the knowledge base for the surface and proposes a target page. If no page
matches, it proposes creating one from the spec template and says so explicitly.
{% endstep %}

{% step %}
### It drafts a change request

Written as documentation, not as a transcript — the thread is the source, the page is the
output. It posts the change request link back in the thread.
{% endstep %}

{% step %}
### The person who knew the answer reviews it

Not the person who asked. The reviewer is whoever gave the answer, because they are the one
who can tell whether the agent understood it.
{% endstep %}
{% endstepper %}

## Asking the agent a question instead

The agent also answers directly from the knowledge base:

> @GitBook what happens when a Hily subscription payment fails?

It answers with links to the pages it used. If it cannot answer, it says so and offers to
open a content-gap issue — which is more useful than a confident guess.

{% hint style="info" icon="link" %}
**Always check the links.** An answer with no citation is a guess. An answer citing a page
that turns out to be wrong is a prompt to fix the page — reply in the thread and the agent
will draft the correction.
{% endhint %}

## What it will not do

| Request | Response |
|---|---|
| "Merge it for me" | Refuses outside `changelog/**` |
| "Delete that page" | Refuses; agents never delete |
| "Just update the doc directly" | Opens a change request instead |
| "Mark this spec as current" | Refuses; only a human can clear a staleness flag |
| Anything in a DM about a private channel it is not in | Cannot read it; says so |

## Etiquette

- **Capture the answer, not the debate.** Mention the agent once the thread has converged.
- **Do not capture speculation.** If the thread ends with "I think so?", it is not
  documentation yet.
- **Name the surface in your mention.** It dramatically improves which page the agent picks.
