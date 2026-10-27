# The workflow, step by step

What you do, what Claude does, and what comes out at each step. Timings assume a 4-hour challenge.

## Before the challenge (once)

- [ ] Open a Claude Code session in `~/Projects/design-challenge-kit`
- [ ] Edit `framework/HOW-I-THINK.md` into your own words
- [ ] Optional, for Lovable polish: have a Lovable account connected to GitHub

## Step 0 — Set up the prototype app (5 min, at the start of the challenge)

| You | Claude |
|---|---|
| Choose: Lovable-first or local-only. For Lovable-first, create a blank Lovable project, connect it to GitHub and paste the repo URL | Clones it into `app/` (or scaffolds locally), adds the shadcn components the component map needs, starts the preview |

**Output:** a running blank app in the browser pane.

## Step 1 — `/challenge-start <paste the prompt>` (~35 min)

| You | Claude |
|---|---|
| Paste the prompt. Answer up to 4 questions (company, timebox, audience, NDA). Pick one of 2–3 framings | Fills the brief, researches the company, reframes the problem, writes bets and success criteria, detects whether it's agentic |

**Output:** `brief/BRIEF.md`, `output/framing.md`, first entries in `output/decision-log.md`.

## Step 2 — `/agentic-pack` (~45 min, agentic challenges only)

| You | Claude |
|---|---|
| A. Confirm the action inventory and risk tiers | Lists every action the agent takes, tiered T0–T3 |
| B. Tick which skills to run (Use / Maybe / Skip), choose essentials or full visuals | Recommends with a reason per skill |
| C. Confirm the 1–2 scenario tasks | Runs selected pattern skills at challenge depth, then scenarios → guardrails → visuals |
| D. Read the joint check | Flags broken joints, lists the prototype states needed |

**Output:** `output/artifacts/` (selected specs, `scenarios.md`, `guardrails-spec.md`, visual sources) and HTML visuals in `output/readout/`: state diagram, recovery map, autonomy heatmap, and others you chose.

## Step 3 — `/prototype` (~60 min)

| You | Claude |
|---|---|
| Approve or change ~10 numbered UI decisions | Plans screens from framing and scenarios, proposes UI decisions from the component map, builds, verifies in the browser |

**Output:** a working prototype in `app/`, with the autonomy toggle and failure branches if the challenge is agentic.

## Step 4 — `/iterate <change and why>` (~40 min, repeat)

| You | Claude |
|---|---|
| Describe one change and why | Checks it against the guardrails, applies it, before/after screenshots, logs it |

**Optional:** visual polish in Lovable. Claude pushes to GitHub, you polish in Lovable, Lovable pushes back, Claude pulls. Don't edit in both at the same time.

## Step 5 — `/readout` (~30 min)

| You | Claude |
|---|---|
| Choose which sections to keep for this audience. Answer the NDA question | Builds the readout pages and a GitHub-ready README |

**Output:** `output/readout/index.html` plus artifact pages, ready for GitHub Pages.

## What the employer sees

A link to the readout (GitHub Pages) that tells the story in eight parts:

1. The problem as I framed it
2. What I learned and the riskiest assumption
3. My bets
4. The prototype: live link and demo script
5. The agentic system: risk map, autonomy heatmap, recovery map, guardrails summary
6. How I'd test it and what I'd measure
7. Alignment asks for PM and engineering
8. Decisions made and what I'd do with more time

Plus the GitHub repo for anyone who wants the full specs and code.
