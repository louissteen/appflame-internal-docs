# appflame-internal-docs

Source of truth for the **appflame internal knowledge base**, published with GitBook and
gated behind SSO.

Each top-level folder is a separate GitBook space, synced two-way via Git Sync:

| Folder | Space | What lives here |
|---|---|---|
| `home/` | Home | Entry point, documentation model, conventions |
| `product-specs/` | Product Specs | The spec layer — one spec per feature, per product |
| `experiments/` | Experiments | Active and concluded experiments, and how results land in specs |
| `analytics/` | Analytics | Metric definitions, event taxonomy, readouts |
| `ai-agents/` | AI & Agents | How our agents read and write this knowledge base |
| `changelog/` | Changelog | What shipped, when, and where it is documented |

`gitbook-docs.yaml` at the repo root declares the site's sections and maps each one to its
directory. GitBook reconciles it on every sync and rewrites it itself if anyone changes the
content mapping in the UI — so pull before editing it, and never change a `key`.

## Working in this repo

- Everything is plain Markdown. Write it here, or in the GitBook editor — both directions sync.
- Edits made in the GitBook UI arrive here as `GITBOOK-<n>:` commits. **Always pull `main`
  before pushing** from a branch or an agent, or you will overwrite someone's UI edit.
- `SUMMARY.md` in each folder is that space's navigation. Adding a file without adding it to
  `SUMMARY.md` means it will not appear in the sidebar.
- Frontmatter (`description`, `icon`, `layout`) is part of the contract our agents rely on —
  see `ai-agents/conventions/frontmatter-contract.md`.

## Ownership

| Surface | Owned by | Agents may write? |
|---|---|---|
| `product-specs/**` | Product | Yes, via PR — human review required |
| `experiments/**` | Product + Analytics | Yes, via PR |
| `analytics/**` | Analytics | Yes, via PR |
| `changelog/**` | Product | Yes, auto-merged for entries only |
| `home/**`, `ai-agents/**` | Docs owners | No — hand-maintained |
