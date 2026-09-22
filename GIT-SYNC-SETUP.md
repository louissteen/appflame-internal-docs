# Git Sync setup — site-level, one screen

This site uses **site-level Git Sync**: one connection for the whole site, with the
structure declared in `gitbook-docs.yaml` at the repo root. You do not wire up each space
individually.

> ⚠️ **Set this up on the site called `appflame knowledge base` (`site_5uzTT`), not on
> `Appflame Docs` (`site_qH8wf`).** `Appflame Docs` is the empty default site the org was
> created with — it has none of the branding, and its one space is called *Untitled*. If
> the Git Sync dialog shows *Appflame Docs* or a `./untitled → Untitled` row, you are on
> the wrong site: click **Remove Git Sync**, then start again from the dashboard below.

- **Site dashboard:** https://app.gitbook.com/o/438sDFbNAkntYXbecxsg/sites/site_5uzTT
- **Published site:** https://appflame.gitbook.io/appflame-knowledge-base/
- **Repo:** `louissteen/appflame-internal-docs` · branch `main`

## Finish the dialog you already have open

| Field | Value |
|---|---|
| Repository | `appflame-internal-docs` |
| Branch | `main` |
| Initial sync direction | **GitHub → GitBook** |
| Project directory | `./` |

`gitbook-docs.yaml` now exists at the repo root, so the red *"gitbook-docs.yaml does not
exist on this branch"* error clears as soon as the dialog re-checks. Then click **Sync**.

> ⚠️ **Direction matters.** `GitBook → GitHub` would push the empty site over the repo.
> The only way back from that is `git revert`.

## What happens on the first sync

The yaml declares six sections, each backed by one space:

| Section | Path | Directory |
|---|---|---|
| Home | `home` (serves at the site root) | `./home` |
| Product Specs | `product-specs` | `./product-specs` |
| Experiments | `experiments` | `./experiments` |
| Analytics | `analytics` | `./analytics` |
| AI & Agents | `ai-agents` | `./ai-agents` |
| Changelog | `changelog` | `./changelog` |

Two things to expect, both normal:

1. **The six empty spaces created earlier via the API get replaced.** `gitbook-docs.yaml`
   binds entries by `key`, and there is no way to point a key at an existing space id — so
   GitBook creates fresh spaces and leaves the originals detached in the org. They are
   empty, so nothing is lost; they just want deleting afterwards.

2. **Creating six spaces in one sync can eat files.** Each new space exports its empty
   initial revision back to the repo as a `GitBook: Export content from <title>` commit,
   which races the import. When the export wins, it overwrites that directory's
   `README.md` with `# Page` and truncates its `SUMMARY.md`.

   After the sync, check for it:

   ```bash
   git pull && git log --oneline -15 | grep "Export content from"
   git diff HEAD~5 --stat -- '*/README.md' '*/SUMMARY.md'
   ```

   If a `README.md` has become `# Page`, restore it and push again — the content is still
   in this repo's history.

## Why cross-space links use site URLs

Links between sections are full published URLs
(`https://appflame.gitbook.io/appflame-knowledge-base/analytics/...`) rather than
`app.gitbook.com/s/<spaceId>/` content refs.

Content refs are keyed on the space id, which changes whenever the yaml recreates a space.
Site URLs are keyed on the **section path**, which `gitbook-docs.yaml` controls — so they
keep working through structure changes. Changing a section's `path` in the yaml is the one
thing that would break them.

## Keys are permanent

`key:` in `gitbook-docs.yaml` is what binds an entry to a space. Change a `title`, a
`path`, or a `content.directory` freely — the existing space follows.

**Changing a `key` replaces the space**: GitBook creates a new one, imports into it, and
leaves the old one orphaned under its old id. Restoring the key does not undo it. Treat
keys as permanent and never tidy them up.

## Turning it into a real internal site

| Want | Where |
|---|---|
| SSO gating | Site → Settings → Audience → **Visitor authentication** (currently `unlisted`) |
| Light mode back on | Site → Customization → Themes — currently locked to dark to match appflame.com's black + lime; needs a dark-coloured logo file for light mode |
| Custom domain | Site → Settings → Domain |
| MCP connector | Already on — `https://appflame.gitbook.io/appflame-knowledge-base/~gitbook/mcp` |
