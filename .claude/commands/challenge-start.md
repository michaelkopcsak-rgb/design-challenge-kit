---
description: Step 1 — take the challenge prompt, research the company, and frame the problem before designing anything
argument-hint: [paste the challenge prompt, or leave empty to use brief/BRIEF.md]
---

Step 1 of the design challenge workflow. Stages: **Frame** and **Understand** in `framework/HOW-I-THINK.md`.

Prompt from Michael (may be empty): $ARGUMENTS

1. **Fill the brief.** If a prompt was given, write it word for word into `brief/BRIEF.md` under "The prompt". Ask Michael (one AskUserQuestion call, up to 4 questions) for whatever the brief is still missing: company, role, timebox, deliverable format, audience. Note the start time in the brief.
2. **Research, short.** 15 minutes of effort at most. Company: product, customers, business model, current AI or agentic features, public design language. Role: what the job posting emphasizes. Write findings as bullets with sources.
3. **Reframe the problem.** Use `design-thinking-pack:design-challenge-framer` and `design-thinking-pack:hmw-generator`. Produce: the problem as given, the problem as I'd frame it, who it's for (primary user and their job to be done), constraints, what's out of scope.
4. **Recommend, don't decide.** Offer 2–3 framings or directions with the trade-off of each, recommended one first. Michael picks.
5. **Write the bets.** For the chosen direction: 3–5 design bets ("We believe X will cause Y; we'll know because Z"), success criteria, riskiest assumption.
6. **Detect if it's agentic.** If the solution involves an AI acting or deciding for the user, say so and recommend `/agentic-pack` next. Otherwise recommend `/prototype`.

Write everything to `output/framing.md` and log the chosen direction in `output/decision-log.md`. Finish with: time used, time left, recommended next step.
