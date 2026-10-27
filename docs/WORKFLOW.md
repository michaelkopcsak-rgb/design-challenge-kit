# The workflow, step by step

What you do, what Claude does, and what comes out at each step. Timings assume a 4-hour challenge that's agentic; a non-agentic one gives back ~45 minutes.

## Before the challenge (once)

- [ ] Open a Claude Code session in `~/Projects/design-challenge-kit`
- [ ] Edit `framework/HOW-I-THINK.md` into your own words
- [ ] Optional, for Lovable polish: have a Lovable account connected to GitHub

## Step 0 — Set up the prototype app (5 min)

| You | Claude |
|---|---|
| Choose Lovable-first or local-only. For Lovable-first, create a blank Lovable project, connect it to GitHub and paste the repo URL | Clones it into `app/` (or scaffolds locally), adds the shadcn components the component map needs, starts the preview |

**Output:** a running blank app in the browser pane.

## Step 1 — `/challenge-start <paste the prompt>` (~55 min)

| You | Claude |
|---|---|
| Paste the prompt; answer up to 4 questions | Fills the brief, researches the company |
| **Selection interview:** tick which thinking skills to run | Recommends Use / Maybe / Skip for framer, personas + jobs, principles, HEART, usability plan |
| Pick one of 2–3 directions | Frames the problem and checks the problem statement |
| Review the proto-personas and jobs | 1–2 proto-personas with needs, wants, objectives and 3 jobs each, labeled as assumptions |
| Review principles and bets | 3–5 principles that each state what they give up; 3–5 bets; riskiest assumption |

**Output:** `brief/BRIEF.md`, `output/framing.md`, `output/traceability.md` (jobs and principles columns), decision log.

## Step 2 — `/agentic-pack` (~45 min, agentic challenges only)

| You | Claude |
|---|---|
| Confirm the action inventory and risk tiers | Lists every action the agent takes, tiered T0–T3, tied to the personas |
| Tick which agentic skills to run; choose essentials or full visuals | Recommends with a reason per skill |
| Confirm the 1–2 scenario tasks | Runs the selected skills, then scenarios → guardrails → visuals |

**Output:** `output/artifacts/` and HTML visuals: state diagram, recovery map, autonomy heatmap, and others you chose.

## Step 3 — `/prototype` (~60 min)

| You | Claude |
|---|---|
| Approve or change ~10 numbered UI decisions | Proposes decisions from the component map, each citing a job or principle; builds and verifies |

**Output:** a working prototype in `app/`, with the autonomy toggle if agentic.

## Step 4 — `/iterate <change and why>` (~15 min, repeat)

| You | Claude |
|---|---|
| Describe one change and why | Checks it against guardrails, applies it, before/after screenshots, logs it with its job or principle |

**Optional:** polish in Lovable. Claude pushes, you polish, Lovable pushes back, Claude pulls. Don't edit in both at the same time.

## Step 4b — `/evaluate` (~25 min)

| You | Claude |
|---|---|
| Choose which findings to fix now (via `/iterate`) | **Inspection:** walks the prototype as each persona and checks it against the jobs and principles; fills "this, not that" examples |
| Review the test plan | **Usability test plan:** 3–5 tasks, success criteria, resonance questions, what would change your mind |
| Review the metrics | **Measurement:** 2–3 HEART dimensions, guardrails, plus trust metrics if agentic |

**Output:** `output/evaluation.md` and the completed traceability table.

## Step 5 — `/readout` (~30 min)

| You | Claude |
|---|---|
| Choose sections for this audience; answer the NDA question | Builds the readout pages and a GitHub-ready README |

**Output:** `output/readout/index.html` plus artifact pages, ready for GitHub Pages.

## What the employer sees

One link to the readout, about 15 minutes presented:

1. The problem as I framed it
2. Who it's for: personas, needs, wants, objectives, jobs
3. What the design stands for: principles and bets
4. The prototype: live link and demo, tagged to jobs and principles
5. The agentic system: risk map, autonomy heatmap, recovery map, guardrails (if agentic)
6. Does it hold up? Inspection against principles and jobs
7. How I'd validate it with users
8. How we'd measure it
9. The traceability table
10. Alignment asks and next steps

Plus the GitHub repo for anyone who wants the full specs and code.
