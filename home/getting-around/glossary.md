---
description: Terms that mean something specific at appflame, in the order you will meet them.
icon: book-a
---

# Glossary

| Term | Means here |
|---|---|
| **Surface** | A specific, addressable place in a product — e.g. *Hily → onboarding → step 3*. The unit we name things by. |
| **Spec** | The page describing what a feature does in production today. Not a PRD. |
| **PRD** | The product requirement document in Jira. Describes intent *before* build; the spec describes behaviour *after*. |
| **Layer** | One of spec / analytics / changelog. See [the documentation model](../how-we-document/documentation-model.md). |
| **Experiment** | A controlled test with a variant, a hypothesis, a primary metric and an end date. Has an `EXP-YYYY-NNN` ID. |
| **Readout** | The written conclusion of an experiment, including the decision taken. |
| **Flag** | A remote-config toggle. Flags outlive experiments and must be cleaned up explicitly. |
| **Holdout** | A population deliberately excluded from a rollout to measure long-run effect. |
| **Docs agent** | The agent that drafts documentation from PRDs, merged PRs and experiment readouts. |
| **Change request** | GitBook's reviewable unit of change. Everything merges through one. |
| **Half-documented** | A feature missing one of its three layers. Treated as a bug. |
| **Stale** | A page whose described behaviour no longer matches production. |
| **Content gap** | A question people or agents ask that no page answers. |
