---
description: Step 1 — take the challenge prompt, choose which thinking skills apply, then frame the problem, the users and their jobs, and the principles
argument-hint: [paste the challenge prompt, or leave empty to use brief/BRIEF.md]
---

Step 1 of the design challenge workflow. Stages 1–3 in `framework/HOW-I-THINK.md`: **Frame**, **Users & jobs**, **Principles & bets**.

Prompt from Michael (may be empty): $ARGUMENTS

## A. Brief (~5 min)

If a prompt was given, write it word for word into `brief/BRIEF.md` under "The prompt". Ask Michael (one AskUserQuestion call, up to 4 questions) for whatever the brief is still missing: company, role, timebox, audience, NDA. Note the start time.

## B. Research (~10 min)

Company: product, customers, business model, current AI or agentic features, public design language. Role: what the posting emphasizes. Bullets with sources.

## C. Selection interview (Michael decides)

Recommend which thinking skills to run for this prompt, as **Use / Maybe / Skip**, each with a one-line reason tied to the prompt and the time left. Defaults:

| Skill | Default | Produces | Used in |
|---|---|---|---|
| `design-thinking-pack:design-challenge-framer` | **Always** | Problem statement | Here |
| `design-thinking-pack:persona-designer` (proto mode) + `design-thinking-pack:jtbd-writer` | **Always** | 1–2 proto-personas, 3 jobs each | Here |
| `product-designers-pack:pdes-design-principles` | Use | 3–5 principles | Here, then `/prototype` and `/evaluate` |
| `product-designers-pack:pdes-heart-metrics-plan` | Use | Measurement plan | `/evaluate` |
| `product-designers-pack:pdes-usability-test-plan` | Maybe (Use if 4h+) | Test plan | `/evaluate` |

Ask with one multi-select AskUserQuestion, recommended first. Record the selections in `brief/BRIEF.md` under "Skills selected" so later steps know what to run. Michael can change them later.

## D. Frame (~10 min)

Run `design-challenge-framer` at challenge depth: skip the sponsor interview (the prompt stands in). Produce the problem as given, the problem statement, and the six-check result (constrained, one short question, actionable, about people, no solution baked in, no technical requirements). Scope in and out, constraints, success criteria.

Offer 2–3 directions with the trade-off of each, recommended first. Michael picks.

## E. Users & jobs (~15 min)

There is no research during a challenge, so run `persona-designer` in **proto-persona mode**: every persona is labeled *assumption, untested*. 1–2 personas, each under half a page:
- Who they are, in one line, and their context
- **Needs** (must have to succeed), **wants** (would value), **objectives** (what they're measured on or care about)
- 3 jobs to be done from `jtbd-writer`: "When [situation], I want to [motivation], so I can [outcome]"
- What they'd fire their current solution for
- Which research would confirm or kill this persona (one line)

## F. Principles & bets (~15 min, if selected)

Run `pdes-design-principles` at challenge depth: 3–5 principles, each written as a stand ("[value] even when it costs [what we give up]") that passes the opposite test. Derive them from the jobs, the company, and (for agentic work) earned trust. Leave "this, not that" examples as `[from prototype]`; `/evaluate` fills them. Include the conflict check and a critique question per principle.

Then 3–5 bets: "We believe [design move] will help [persona] [job], we'll know because [signal]." Name the riskiest assumption.

## G. Start the traceability table

Create `output/traceability.md` with one row per job: the job, and the principle(s) that serve it. The other columns (design decision, test task, metric) are filled by later steps.

| Job to be done | Principle | Design decision | Test task | Metric |
|---|---|---|---|---|

## H. Hand off

If the solution has an AI acting or deciding for the user, say so and recommend `/agentic-pack`; otherwise `/prototype`.

Write framing, personas, jobs, principles and bets to `output/framing.md`. Log the chosen direction and selections in `output/decision-log.md`. Finish with: time used, time left, next step.
