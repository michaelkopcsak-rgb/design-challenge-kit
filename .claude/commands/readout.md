---
description: Step 5 — assemble the readout Michael presents and shares with the employer
---

Step 5 of the design challenge workflow. Stage 7, **Tell**, in `framework/HOW-I-THINK.md`.

Read `brief/BRIEF.md`, `output/framing.md`, `output/traceability.md`, `output/evaluation.md`, `output/decision-log.md`, everything in `output/artifacts/`, and screenshots of the prototype.

## Structure (the story, ~15 minutes presented)

Each section is one page or slide. The point is to show how Michael thinks, not to show volume.

1. **The problem as I framed it**: the prompt, the reframe, why. (Frame)
2. **Who it's for**: proto-personas with needs, wants, objectives and jobs to be done, labeled as assumptions, plus what research would confirm them. (Users & jobs)
3. **What the design stands for**: principles, each with what it gives up, and the bets. (Principles & bets)
4. **The prototype**: walk the demo script, each key moment tagged with the job and principle it serves. Live link. (Make)
5. **The agentic system** (if agentic): risk map, autonomy heatmap, recovery map, guardrails summary. One visual each, one sentence on what to notice. (Make)
6. **Does it hold up?**: inspection findings against principles and jobs, with "this, not that" examples from the prototype, and what was fixed. (Evaluate)
7. **How I'd validate it with users**: test tasks, resonance questions, what would change my mind. (Evaluate)
8. **How we'd measure it**: HEART dimensions chosen and dropped, metrics, guardrails, plus the trust metrics if agentic. (Measure)
9. **The traceability table**: job → principle → decision → test task → metric, with gaps named. This is the closing slide on how I think.
10. **Alignment asks and next steps**: open decisions for PM and engineering, what I'd do with more time. (Tell)

Ask Michael which sections to keep for this audience before building. Sections whose skill wasn't selected are dropped or merged, not padded.

## Build

- `output/readout/index.html` as the story, linking each artifact page in `output/readout/`. Shared `style.css`. Static files only, so it can be hosted on GitHub Pages.
- The traceability table is a real HTML table, readable at phone width.
- A `README.md` at the challenge root that reads well on GitHub on its own: summary, links to the readout, prototype and artifacts.
- Optionally a slide version: ask first.

## Share check

Before anything goes public, ask Michael: is the prompt under NDA or marked confidential? Does it include company data? If yes, recommend a private repo shared with specific people, or a public repo with the prompt paraphrased.
