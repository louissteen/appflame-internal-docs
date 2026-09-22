---
description: >-
  How our agents read and write this knowledge base — MCP, pull requests, Slack —
  and the rules that keep them useful rather than noisy.
icon: robot
---

# AI & Agents

This knowledge base has two kinds of reader, and this space is about the second one.

Our development agents read documentation before they touch a feature. That only works if
the documentation is Markdown they can parse, structured predictably, and current. Those
three properties are the entire reason this knowledge base exists in the shape it does.

{% hint style="info" icon="file-lines" %}
**Everything here is Markdown in a Git repository.** The published site is a rendering of
`github.com/louissteen/appflame-internal-docs`. Agents can read the rendered site over MCP,
read `llms.txt` for a machine-readable index, or read the repository directly — whichever
fits the workflow.
{% endhint %}

## The three integration points

<table data-view="cards"><thead><tr><th></th><th></th><th></th><th data-hidden data-card-target data-type="content-ref"></th></tr></thead><tbody>
<tr>
  <td><h3><i class="fa-plug" style="color:$primary;">:plug:</i></h3></td>
  <td><strong>MCP connector</strong></td>
  <td>Claude and internal agents read the KB and open change requests.</td>
  <td><a href="workflows/mcp-connector.md">mcp-connector</a></td>
</tr>
<tr>
  <td><h3><i class="fa-code-pull-request" style="color:$primary;">:code-pull-request:</i></h3></td>
  <td><strong>Docs in pull requests</strong></td>
  <td>The agent reviews code PRs and proposes the matching doc change.</td>
  <td><a href="workflows/docs-in-pull-requests.md">docs-in-pull-requests</a></td>
</tr>
<tr>
  <td><h3><i class="fa-slack" style="color:$primary;">:slack:</i></h3></td>
  <td><strong>Slack agent</strong></td>
  <td>Turn an answer given in Slack into a change request.</td>
  <td><a href="workflows/slack-agent.md">slack-agent</a></td>
</tr>
</tbody></table>

## Conventions agents depend on

| Convention | Enforced where | Breaks what if ignored |
|---|---|---|
| Mandatory `description` frontmatter | Review | Retrieval ranking, assistant answers |
| `product` / `surface` / `status` frontmatter | Review | Automatic `under-test` marking |
| `affects:` on experiment pages | Review | The link between experiments and specs |
| One feature per page | Review | Every retrieval touching either feature |
| Behaviour as tables | Review | Condition extraction |
| Links instead of duplicated text | Review | Staleness detection, which trusts one copy |

Details in [conventions](conventions/markdown-conventions.md) and the
[frontmatter contract](conventions/frontmatter-contract.md).

## What agents are not allowed to do

{% hint style="danger" icon="hand" %}
No agent may merge outside `changelog/**`, edit `home/**` or `ai-agents/**`, delete a page,
or clear a staleness flag. These are permission-level restrictions, not prompt instructions
— a prompt is not a safeguard.
{% endhint %}

Full permission matrix in
[PRD to docs pipeline](https://app.gitbook.com/s/XSPACE_EXPERIMENTS/lifecycle/prd-to-docs-pipeline).
