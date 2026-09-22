---
description: >-
  Search, the AI assistant, and the MCP connector — three ways into a knowledge
  base that is too big to browse.
icon: compass
---

# Find anything

Our knowledge base is large and heavily interconnected — that was the original problem.
Browsing a tree is not a strategy at this size. These are the three ways in, in the order
you should reach for them.

## 1. Search

Semantic search across every space, from the bar at the top of any page.

| You want | Type this |
|---|---|
| A specific feature | `hily paywall placement` |
| Everything about one surface | `taimi onboarding` |
| A metric definition | `d7 retention definition` |
| An experiment by ID | `EXP-2026-114` |

Search covers page titles, descriptions and body text across all six spaces — including
spaces you might not think to browse.

## 2. The AI assistant

The assistant answers in prose with links to the pages it used. Use it for questions that
span several pages, which is exactly where browsing fails.

Good questions to ask it:

- *"What is currently being tested on the Hily paywall?"*
- *"Which metrics does the Mailkeeper send-time experiment move?"*
- *"How is D7 retention defined, and does it differ between Hily and Taimi?"*
- *"Which specs changed in the last two weeks?"*

{% hint style="info" icon="lightbulb" %}
**Always check the citations.** The assistant links every claim to a page. If a claim has
no link, treat it as a guess — and if the linked page is wrong, fix the page rather than
re-asking the question.
{% endhint %}

## 3. MCP, for agents and for Claude

The knowledge base is exposed over MCP, so Claude and our internal agents can read it
directly — and, with the right permissions, open change requests against it.

```json
{
  "mcpServers": {
    "appflame-kb": {
      "url": "https://appflame.gitbook.io/kb/~gitbook/mcp"
    }
  }
}
```

Setup, permissions and the write path are documented in
[the MCP connector page](https://appflame.gitbook.io/appflame-knowledge-base/ai-agents/workflows/mcp-connector).

## When you cannot find something

In order:

1. Search for the **surface name**, not the feature name — surfaces are more stable.
2. Check the [Changelog](https://appflame.gitbook.io/appflame-knowledge-base/changelog/) — it may have shipped
   under a different name.
3. Check [Experiments](https://appflame.gitbook.io/appflame-knowledge-base/experiments/) — it may still be
   behind a flag and not in a spec yet.
4. Ask in <code class="expression">space.vars.docs_owner</code>. If the answer is useful,
   the person answering opens a change request for it. A question answered only in Slack is
   a documentation bug.
