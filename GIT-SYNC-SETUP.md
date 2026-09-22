# Git Sync setup — one step per space, in the GitBook UI

Everything else is done: the site exists, the six sections exist, branding is applied, and
this repo is pushed. Git Sync is the one thing GitBook's API cannot configure, so it has to
happen in the UI. About 30 seconds per space.

- **Site dashboard:** https://app.gitbook.com/o/438sDFbNAkntYXbecxsg/sites/site_5uzTT
- **Published site:** https://appflame.gitbook.io/appflame-knowledge-base/
- **Repo:** `louissteen/appflame-internal-docs` · branch `main`

> **Before you start:** the first space will prompt you to install the GitBook app on your
> GitHub account. Grant it access to `louissteen/appflame-internal-docs` (the repo is
> private, so GitBook needs explicit access to it).

> ⚠️ **Initial sync direction must be `GitHub → GitBook` every time.** Picking the other
> direction pushes the empty GitBook space over the repo folder, and the only way back is
> `git revert`.

## For each space, the same six fields

| # | Space | Open this | Project directory |
|---|---|---|---|
| 1 | Home | https://app.gitbook.com/o/438sDFbNAkntYXbecxsg/s/VGeLQpRSFRjUihwbJxNU/ | `home` |
| 2 | Product Specs | https://app.gitbook.com/o/438sDFbNAkntYXbecxsg/s/ObwCHTfcy9nm4oFjO3WU/ | `product-specs` |
| 3 | Experiments | https://app.gitbook.com/o/438sDFbNAkntYXbecxsg/s/w8Lmy2czsVcJjubyVtYO/ | `experiments` |
| 4 | Analytics | https://app.gitbook.com/o/438sDFbNAkntYXbecxsg/s/l8hK5Dikt1kTwBMi6PyB/ | `analytics` |
| 5 | AI & Agents | https://app.gitbook.com/o/438sDFbNAkntYXbecxsg/s/RYponOt1LWLo6aRsOoNT/ | `ai-agents` |
| 6 | Changelog | https://app.gitbook.com/o/438sDFbNAkntYXbecxsg/s/pEcKz5cFtkAMLkJL7WhD/ | `changelog` |

Steps, identical for each row:

1. Open the space link above.
2. Click **Set up Git Sync** (top right).
3. Choose **GitHub**, authorize if prompted.
4. Repository: **`louissteen/appflame-internal-docs`**
5. Branch: **`main`**
6. Click **Show advanced options** → **Project directory**: the value from the table.
7. Initial sync direction: **GitHub → GitBook**.
8. Click **Initialize** and wait for the import to finish.

## After all six

The site fills in immediately. Two things worth checking:

- Cross-space links (the cards on the homepage, the spec ↔ experiment links) resolve
  through real space IDs. GitBook's link resolver can take up to ~30 minutes to start
  resolving links into brand-new spaces, so if a card lands on a login page, wait and
  re-check before assuming it is broken.
- Pages rendered before the resolver caught up stay cached. If a link is still wrong after
  30 minutes, push a no-op commit touching that space's directory to force a re-render.

## Turning it into a real internal site

| Want | Where |
|---|---|
| SSO gating | Site → Settings → Audience → **Visitor authentication** (currently `unlisted`) |
| Light mode back on | Site → Customization → Themes — currently locked to dark to match appflame.com's black + lime; needs a dark-coloured logo file for light mode |
| Custom domain | Site → Settings → Domain |
| MCP connector | Already on — `https://appflame.gitbook.io/appflame-knowledge-base/~gitbook/mcp` |
