# Design challenge kit

A Claude Code workflow for timeboxed product design challenges: from prompt to framing, prototype, agentic system artifacts and readout in 3–4 hours.

## Install

```bash
git clone https://github.com/michaelkopcsak-rgb/design-challenge-kit.git
cd design-challenge-kit && ./install.sh
```

This copies the commands into `~/.claude/commands/` and the kit skills into `~/.claude/skills/`, so they work in any Claude Code session. Each challenge gets its own workspace in `~/Projects/challenges/<slug>/`. Re-run `./install.sh` after updating the kit; `./install.sh --remove` uninstalls.

## What's inside

- **Workflow:** [docs/WORKFLOW.md](docs/WORKFLOW.md)
- **How I think:** [framework/HOW-I-THINK.md](framework/HOW-I-THINK.md)
- **Agentic patterns → components:** [docs/component-map.md](docs/component-map.md)
- **Commands:** `/challenge-start`, `/agentic-pack`, `/prototype`, `/iterate`, `/evaluate`, `/readout` in [commands](commands)

The workflow starts with the user (proto-personas and jobs to be done), sets design principles that state what they give up, and ends with how the design would be tested with real users and measured (HEART, plus trust metrics for agentic products). A traceability table links each job to a principle, a design decision, a test task and a metric.
- **Kit skills:** `agentic-ux-visuals`, `agentic-guardrails-spec`, `agentic-scenarios` in [skills/design-challenge](skills/design-challenge)

The kit skills extend an eight-skill agentic UX pack in [skills/agentic-ux-pack](skills/agentic-ux-pack): the [`agentic-ux`](skills/agentic-ux-pack/agentic-ux/SKILL.md) router plus intent preview, autonomy dial, explainable rationale, confidence signals, action audit & undo, escalation gates and generative UI. All eight share one risk scale (T0 read → T3 irreversible) and route to each other. To use them in Claude, upload each folder as a skill, or copy them into `~/.claude/skills/`.

Stack for prototypes: React, Vite, TypeScript, Tailwind, shadcn/ui. Compatible with Lovable through GitHub sync.
