# Design challenge kit

A timeboxed workflow (3–4 hours) for taking a design-challenge prompt from brief to prototype to readout. Michael is the designer; Claude is the working partner. Michael makes the calls. Claude recommends, builds and documents.

## Always

- **Read `brief/BRIEF.md` first.** If it's empty or still the template, stop and run `/challenge-start`.
- **Think with `framework/HOW-I-THINK.md`.** Every artifact maps to one of its stages. Name the stage when you produce something.
- **Ask before generating.** At each step, recommend what's worth making and why, then let Michael choose. Never produce an artifact just because a template exists. Use AskUserQuestion with a recommended option first.
- **Respect the clock.** The brief has a timebox. When a step is running long, say so and propose a cut.
- **Log decisions.** Every meaningful design decision goes in `output/decision-log.md` as: decision · alternatives considered · why · stage. The readout is built from this log.
- **Mark assumptions.** Anything not in the brief or researched is labeled *assumption* wherever it appears.

## The sequence

| Step | Command | Produces |
|---|---|---|
| 1 | `/challenge-start` | Skill selection, then `output/framing.md` (problem, proto-personas, jobs, principles, bets) and `output/traceability.md` |
| 2 | `/agentic-pack` | Only if the challenge is agentic. Selected specs in `output/artifacts/`, plus visuals |
| 3 | `/prototype` | Working prototype in `app/`; every UI decision cites a job or principle |
| 4 | `/iterate <change>` | Repeat as needed. Each change logged |
| 4b | `/evaluate` | `output/evaluation.md`: inspection against principles and jobs, test plan, measurement plan; traceability table completed |
| 5 | `/readout` | `output/readout/`: the page set Michael presents and shares |

Steps 2 and 3 can overlap: the scenarios from step 2 define the prototype states for step 3.

## Traceability

`output/traceability.md` is the spine of the work: job to be done → principle → design decision → test task → metric. Every step that creates one of those adds it to the table. A decision with no job or principle behind it gets questioned; a job with no decision is a named gap.

## Users are assumptions until researched

Proto-personas and jobs written during a challenge are labeled *assumption, untested* everywhere they appear. Never present invented users as research.

## Prototype stack

- React + Vite + TypeScript + Tailwind + **shadcn/ui** in `app/`. The same stack Lovable uses, so the repo can round-trip with Lovable through GitHub.
- Use shadcn components and theme tokens (CSS variables). No hard-coded colors, no one-off components when a shadcn one fits.
- Agentic patterns map to components per `docs/component-map.md`. Claude picks the defaults; Michael adjusts at the UI-decisions checkpoint.
- Realistic content: real names, plausible data, real UI copy. No lorem ipsum.
- Verify in the browser pane after every change.

## Agentic skills

## Thinking skills

Selected per challenge in `/challenge-start` and recorded in the brief under "Skills selected": `design-challenge-framer`, `persona-designer` (proto mode) + `jtbd-writer`, `pdes-design-principles`, `pdes-heart-metrics-plan`, `pdes-usability-test-plan`. Run them at challenge depth: the core table and filled examples, not the full template.

## Agentic skills

Global (synced from claude.ai, do not edit here): `agentic-ux` (router) and the seven `agentic-ux-*` pattern skills. A copy is published in `skills/agentic-ux-pack/`.
Local to this kit (`.claude/skills/`): `agentic-ux-visuals`, `agentic-guardrails-spec`, `agentic-scenarios`.
`/agentic-pack` decides which of these run.

## Output layout

```
output/
  framing.md          step 1
  traceability.md     started in step 1, completed in /evaluate
  evaluation.md       /evaluate
  decision-log.md     running
  artifacts/          step 2 specs and visual sources (Markdown + Mermaid)
  readout/            step 5 presentable HTML pages
```
