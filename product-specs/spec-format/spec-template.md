---
description: Copy this page as the starting point for any new spec.
icon: file-lines
---

# Spec template

Copy everything below the line into a new file under the relevant product folder, then add
it to `SUMMARY.md`.

***

````markdown
---
description: One sentence describing what this feature does and for whom.
icon: puzzle-piece
product: hily
surface: onboarding
status: current
reviewed: 2026-09-22
---

# Feature name

## Summary

One paragraph. What the feature does, who sees it, and why it exists. A reader who stops
here should not be wrong about anything.

## Surfaces

| Platform | Surface | Entry point |
|---|---|---|
| iOS | | |
| Android | | |
| Web | | |

## Behaviour

| Condition | Outcome |
|---|---|
| | |

## Edge cases

| Situation | Behaviour |
|---|---|
| Data missing | |
| Network failure | |
| User in restricted region | |

## Configuration

| Key | Type | Default | Tunable without release |
|---|---|---|---|
| | | | |

## Measurement

Primary metric: **<name>**.
Analytics entry: [link](https://appflame.gitbook.io/appflame-knowledge-base/analytics/foundations/metric-definitions)

## Related

- Active experiments: EXP-YYYY-NNN
- Adjacent specs:
- Last behaviour change:
````
