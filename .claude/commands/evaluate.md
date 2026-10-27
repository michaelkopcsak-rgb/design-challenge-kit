---
description: Step 4b — check the prototype against principles and jobs, plan how to test it with real users, and plan how to measure it
---

Runs after `/prototype` and some `/iterate` rounds. Stages 5 and 6 in `framework/HOW-I-THINK.md`: **Evaluate** and **Measure**. About 25 minutes.

Read `brief/BRIEF.md` (including "Skills selected"), `output/framing.md`, `output/traceability.md`, `output/decision-log.md`, and the guardrails spec if it exists. Screenshot the prototype's main flow.

## A. Inspection: does it align? (~10 min, always)

Walk the prototype in the browser pane as each proto-persona. This is an **inspection by Claude, not a user test**: label it that way everywhere.

- **Jobs:** for each job, can the persona get it done? Where does the design serve it, where does it get in the way, where is it silent?
- **Principles:** for each principle, find one screen or decision that follows it (the "this") and one place it's broken or at risk (the "not that"). Fill the `[from prototype]` examples in `output/framing.md`.
- **Cogency:** would the persona understand what this is and why it's for them within the first screen?

Fill the **Design decision** column of `output/traceability.md` (each decision from the decision log that serves a job). Flag jobs with no decision behind them, and decisions that trace to no job or principle.

Report findings as a short table: issue · job or principle affected · severity · fix now or later. Ask Michael which to fix now with `/iterate`.

## B. Usability test plan (~10 min, if selected)

Run `pdes-usability-test-plan` at challenge depth:
- 3–5 tasks written as goals the persona believes, with no hint at the path and no on-screen words
- Success criteria per task, set now: completed · completed with help · not completed
- 2–3 **resonance questions** after the tasks, open and neutral, about the persona's job: "Tell me about the last time you had to [job]. How does this compare?" Never "do you like it" or "would you use it".
- One line: **what result would change my mind**, per bet
- Sample: 5 per persona per round; what this round cannot show

Fill the **Test task** column of `output/traceability.md`.

## C. Measurement plan (~5 min, if selected)

Run `pdes-heart-metrics-plan` at challenge depth: choose 2–3 HEART dimensions and say which were dropped and why. Goal → success signal → failure signal → metric. Every baseline is `[baseline needed]`; never estimate one. Add 1–2 guardrail metrics.

**If the challenge is agentic**, add a trust layer from the agentic skills:

| Metric | What it tells you | Starting target |
|---|---|---|
| Escalation rate | Agent asks for help as often as it should | 5–15% of tasks |
| Recovery success | Escalated tasks still get done | > 90% |
| Accept-without-edit rate | Plans and previews are right | Rising over time |
| Undo rate | How often the agent's work is reversed | Falling over time |
| Reflexive approval rate | Approvals faster than the request could be read: a sign of gate fatigue | Near zero |

Fill the **Metric** column of `output/traceability.md`.

## Output

- `output/evaluation.md`: inspection findings, test plan, measurement plan (only the selected parts)
- `output/traceability.md` complete, with gaps marked
- Decisions logged. Finish with time used, time left, and next step (`/iterate` fixes or `/readout`).
