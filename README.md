# Design challenge kit

A Claude Code workflow for timeboxed product design challenges: from prompt to framing, prototype, agentic system artifacts and readout in 3–4 hours.

- **Workflow:** [docs/WORKFLOW.md](docs/WORKFLOW.md)
- **How I think:** [framework/HOW-I-THINK.md](framework/HOW-I-THINK.md)
- **Agentic patterns → components:** [docs/component-map.md](docs/component-map.md)
- **Commands:** `/challenge-start`, `/agentic-pack`, `/prototype`, `/iterate`, `/readout` in [.claude/commands](.claude/commands)
- **Kit skills:** `agentic-ux-visuals`, `agentic-guardrails-spec`, `agentic-scenarios` in [.claude/skills](.claude/skills)

The kit skills extend an eight-skill agentic UX pack (`agentic-ux` router plus intent preview, autonomy dial, explainable rationale, confidence signals, action audit & undo, escalation gates, generative UI).

Stack for prototypes: React, Vite, TypeScript, Tailwind, shadcn/ui. Compatible with Lovable through GitHub sync.
