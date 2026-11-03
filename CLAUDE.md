# Design challenge kit

A timeboxed workflow (3–4 hours) for taking a design-challenge prompt from brief to prototype to readout. Michael is the designer; Claude is the working partner. Michael makes the calls. Claude recommends, builds and documents.

The commands and kit skills are installed globally by `install.sh`, so they work in any Claude Code session. This file is the rulebook every command reads first. `{{KIT}}` below means the folder this file is in.

## Kit vs. workspace

- **Kit** (this repo, `{{KIT}}`): rules, framework, templates, component map, skill sources. Never write challenge work here.
- **Workspace**: one folder per challenge, e.g. `~/Projects/challenges/<slug>/`. Holds that challenge's brief, outputs and prototype, and can become its own repo.

```
<workspace>/
  brief/BRIEF.md       from templates/BRIEF.md
  output/
    framing.md          step 1
    traceability.md     started in step 1, completed in /evaluate
    evaluation.md       /evaluate
    decision-log.md     running, from templates/decision-log.md
    artifacts/          /agentic-pack specs and visual sources
    readout/            /readout HTML pages
  app/                  prototype (or the brief's "Prototype location" points elsewhere)
  .claude/launch.json   from templates/launch.json
```

## Every command starts by finding the workspace

1. If the current folder has `brief/BRIEF.md`, that's the workspace.
2. Otherwise read `~/.claude/design-challenge-active` (one line: the active workspace path). If it exists, confirm in one line ("Working in ~/Projects/challenges/second-chair") and use it.
3. Otherwise: `/challenge-start` creates one (see that command). Any other command asks Michael which challenge, listing folders under `~/Projects/challenges/` that contain `brief/BRIEF.md`.

Use absolute paths for all workspace files. Whenever a workspace is created or chosen, write its path to `~/.claude/design-challenge-active`.

## Every command ends by offering the next step

Close with one AskUserQuestion: "What next?" with the recommended next command first, one realistic alternative, and "Stop here". If Michael picks a command, read `{{KIT}}/commands/<name>.md` and follow it directly in this same session. Don't make him retype anything.

The usual order: `/challenge-start` → `/agentic-pack` (if agentic) → `/prototype` → `/iterate` (repeat) → `/evaluate` → `/iterate` (fixes) → `/readout`.

## Always

- **Read the workspace `brief/BRIEF.md` first.** If it's still the template, run `/challenge-start`.
- **Think with `{{KIT}}/framework/HOW-I-THINK.md`.** Every artifact maps to one of its stages. Name the stage when you produce something.
- **Ask before generating.** Recommend what's worth making and why, then let Michael choose. Never produce an artifact just because a template exists. Use AskUserQuestion with the recommended option first.
- **Respect the clock.** The brief has a timebox. When a step runs long, say so and propose a cut.
- **Log decisions** in `output/decision-log.md`: decision · alternatives · why · job or principle served · stage. The readout is built from this log.
- **Mark assumptions.** Anything not in the brief or researched is labeled *assumption*. Proto-personas and jobs are labeled *assumption, untested* everywhere. Never present invented users as research.

## Traceability

`output/traceability.md` is the spine: job to be done → principle → design decision → test task → metric. Every step that creates one of those adds it. A decision with no job or principle behind it gets questioned; a job with no decision is a named gap.

## Existing prototypes

A prototype may already exist (built earlier, in Lovable, or as a single HTML file). The brief's "Prototype location" field records where: a path, a URL, or `app/`. Commands work from that location; `/prototype` is skipped or used only to extend it.

## Prototype stack (when building new)

- React + Vite + TypeScript + Tailwind + **shadcn/ui** in `app/`, the same stack Lovable uses, so it can round-trip with Lovable through GitHub.
- shadcn components and theme tokens only. Realistic content and real UI copy.
- Agentic patterns map to components per `{{KIT}}/docs/component-map.md`. Claude proposes; Michael adjusts at the UI-decisions checkpoint.
- Verify in the browser pane after every change.

## Skills

**Thinking skills**, selected per challenge in `/challenge-start` and recorded in the brief under "Skills selected": `design-challenge-framer`, `persona-designer` (proto mode) + `jtbd-writer`, `pdes-design-principles`, `pdes-heart-metrics-plan`, `pdes-usability-test-plan`. Run them at challenge depth: the core table and filled examples, not the full template.

**Agentic skills**: `agentic-ux` (router) and the seven `agentic-ux-*` pattern skills (synced from claude.ai; published copy in `{{KIT}}/skills/agentic-ux-pack/`), plus the kit's `agentic-ux-visuals`, `agentic-guardrails-spec` and `agentic-scenarios`. `/agentic-pack` decides which run.
