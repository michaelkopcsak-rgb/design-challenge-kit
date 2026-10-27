---
description: Step 3 — confirm UI decisions, then build the first-draft prototype in app/ with shadcn/ui
argument-hint: [optional notes on what the prototype must show]
---

Step 3 of the design challenge workflow. Stage: **Make** in `framework/HOW-I-THINK.md`.

Notes from Michael (may be empty): $ARGUMENTS

Read `brief/BRIEF.md`, `output/framing.md`, and (if present) `output/artifacts/scenarios.md` and `output/artifacts/guardrails-spec.md`.

## 1. Make sure the app exists

If `app/` has no `package.json`, ask Michael which path:
- **Lovable-first (recommended if he wants to polish in Lovable later):** he creates a blank project in Lovable and connects it to GitHub, then gives the repo URL. Clone it into `app/`.
- **Local only:** scaffold Vite + React + TypeScript, add Tailwind and shadcn/ui (`npx shadcn@latest init`), add the components the component map needs.

Make sure `.claude/launch.json` (in this kit) has an `app` entry running `npm run dev` in `app/`, and start the preview.

## 2. Plan the screens

From the framing and scenarios: the 3–6 screens or states the prototype needs, the one flow it must demo end to end, and the states the demo script requires. Skip anything the readout won't show.

## 3. UI decisions checkpoint (Michael adjusts)

Before building, list about 10 decisions as a numbered list, each with a one-line reason. Use `docs/component-map.md` defaults for agentic patterns. Example: "4. Approvals go in a side queue, not a modal, because the agent keeps working on T2 tasks while it waits." Ask Michael to approve or change by number. Log the final decisions.

## 4. Build

- shadcn components and theme tokens only. Realistic data and real copy.
- If scenarios exist, build an **autonomy toggle** that runs the same flow in human-in-the-loop and autonomous mode, plus the failure branches in the demo script. Mock the agent with scripted state, not a live model, so the demo is reliable.
- Verify each screen in the browser pane; fix console errors.

## 5. Hand off

Screenshot the main flow. Log decisions. Finish with time used, time left, and suggested `/iterate` targets.
