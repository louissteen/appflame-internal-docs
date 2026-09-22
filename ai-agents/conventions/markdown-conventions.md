---
description: >-
  The Markdown subset we use, the GitBook blocks we allow, and the ones we avoid
  because agents parse them badly.
icon: markdown
---

# Markdown conventions

Everything here is GitBook-flavoured Markdown stored in Git. Both the rendered site and the
raw files are read by agents, so the source has to carry the meaning — nothing load-bearing
may exist only in the rendering.

## Blocks we use, and why

| Block | Use for | Agent-readable |
|---|---|---|
| Tables | Conditions, configuration, metrics | ✅ Excellent |
| `{% hint %}` | Warnings and caveats | ✅ Text is in source |
| `{% stepper %}` | Ordered procedures | ✅ Text is in source |
| `{% tabs %}` | Platform or language variants | ✅ Text is in source |
| ` ```mermaid ` | Flows and state machines | ✅ Source is the diagram |
| `{% expandable %}` | Optional detail | ⚠️ Fine, but never hide the answer |
| Card tables | Navigation only | ⚠️ Carries little meaning — never content |
| `{% include %}` | Repeated boilerplate | ✅ Resolved before retrieval |
| Images | Illustration only | ❌ Never load-bearing |

## Rules

{% stepper %}
{% step %}
### One `#` heading per page, matching the title

Heading structure is how pages are chunked for retrieval. Two `#` headings produce two
competing titles for one page.
{% endstep %}

{% step %}
### Never put a fact only inside a diagram or an image

Mermaid source is readable, so diagrams are fine — but a threshold, a state name or a copy
string must also exist in prose or in a table.
{% endstep %}

{% step %}
### Use relative links inside a space, GitBook URLs across spaces

`../hily/onboarding-flow.md` within Product Specs;
`https://app.gitbook.com/s/<spaceId>/...` when pointing at Analytics or Experiments. Both
resolve; mixing them up produces a broken link that renders as plain text.
{% endstep %}

{% step %}
### Fence every code block with a language

Untagged fences are treated as prose by some parsers and lose their structure. Use `json`,
`bash`, `yaml`, `swift`, `kotlin`, `sql`.
{% endstep %}

{% step %}
### Keep lines under ~100 characters

Not for rendering — for reviewable diffs. A reflowed paragraph produces a one-line diff
nobody can read, which is how review quality quietly collapses.
{% endstep %}
{% endstepper %}

## Variables and includes

Repeated literals go in `.gitbook/vars.yaml` per space and are referenced inline:

```markdown
Freshness SLA is <code class="expression">space.vars.freshness_sla</code>.
```

Repeated paragraphs — the three-layer explanation, boilerplate warnings — go in
`.gitbook/includes/` and are pulled in:

```markdown
{% include ".gitbook/includes/doc-layers.md" %}
```

{% hint style="info" icon="copy" %}
**Why this matters for staleness detection.** The staleness job assumes each fact has one
home. Duplicated text means one copy gets updated and the other silently becomes wrong —
and the agent has no way to know which copy is canonical.
{% endhint %}

## What we deliberately do not use

- **HTML beyond card tables.** It renders, but it parses inconsistently.
- **Nested expandables.** Content two levels deep is content nobody reads.
- **Footnotes.** They separate a caveat from the claim it qualifies.
- **Emoji as status indicators without text.** ✅ alone is not a status; "✅ Current" is.
