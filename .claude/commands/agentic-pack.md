---
description: Step 2 — choose which agentic UX skills apply to this challenge, run only those, then add scenarios, guardrails and visuals
---

Step 2 of the design challenge workflow, for agentic challenges only. Stages: **Bet** and **Make** in `framework/HOW-I-THINK.md`.

Read `brief/BRIEF.md` and `output/framing.md` first. If framing is missing, stop and recommend `/challenge-start`.

## A. Inventory (always, ~10 min)

Run steps 1 and 2 of the `agentic-ux` router skill only: the action inventory (verbs with objects) and a risk tier for each action. Show it to Michael as a table and ask whether anything is missing or mis-tiered. Don't continue until it's confirmed.

## B. Select (Michael decides)

Recommend which skills to run, in three buckets, with one reason each tied to a specific action and tier:

- **Use**: required by the tier table in `agentic-ux` step 3, or central to the prompt
- **Maybe**: useful, but the challenge could go without it
- **Skip**: not relevant (say why, e.g. "no generated surfaces in this concept")

Pattern skills: `agentic-ux-intent-preview`, `agentic-ux-autonomy-dial`, `agentic-ux-explainable-rationale`, `agentic-ux-confidence-signals`, `agentic-ux-action-audit-undo`, `agentic-ux-escalation-gates`, `agentic-ux-generative-ui`.

Kit skills, recommended by default unless time is very short: `agentic-scenarios`, `agentic-guardrails-spec`, `agentic-ux-visuals`.

Ask with one multi-select AskUserQuestion, recommended items first. Also ask how many visuals Michael wants: **essentials** (state diagram, recovery map, autonomy heatmap) or **one per selected skill**.

## C. Run at challenge depth

For each selected pattern skill, in design mode, produce only: the per-action table, filled copy examples, the joints that touch other selected patterns, and open questions. Skip the full accessibility and metrics sections unless asked; note "full spec available on request". One file per skill: `output/artifacts/<skill>.md`.

Then, in this order, for the selected kit skills:
1. `agentic-scenarios` → `output/artifacts/scenarios.md` (confirm the chosen tasks with Michael first)
2. `agentic-guardrails-spec` → `output/artifacts/guardrails-spec.md`
3. `agentic-ux-visuals` → Markdown + Mermaid sources in `output/artifacts/`, HTML pages in `output/readout/`

## D. Check and hand off

- Run the `agentic-ux` step 4 joint check across everything produced. Report broken joints.
- List the prototype states the scenarios require and the components they need from `docs/component-map.md`.
- Log selections and key decisions in `output/decision-log.md`.
- Finish with: what was produced, time used, time left, recommended next step (`/prototype`).
