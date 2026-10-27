---
name: agentic-ux-intent-preview
description: Design or audit the Intent Preview pattern, where an AI agent shows its plan, steps, tool calls or target outputs before executing and offers Proceed, Edit, or Handle it myself. Use when specifying a plan-approval screen, a confirm-before-acting step, a "review before send" moment, or when reviewing whether an agent acts without warning. Covers when a preview is required, anatomy, states, copy, edit flows, anti-patterns, accessibility and metrics.
---

# Intent Preview

**What it is:** a decision point before the agent acts. It translates the agent's plan into plain language, shows the consequences, and asks for consent with three ways forward.

**What it is not:** a notification, a spinner, or a log of what the agent already did (that's Action Audit).

## Mode

- **Design** → produce the spec template at the end.
- **Audit** → produce the findings template at the end.

## Shared risk scale (same across the pack)

T0 read-only · T1 private & reversible · T2 visible to others or effortful to reverse · T3 irreversible, financial, external, or permission-changing. Bump a tier for agent-initiated, bulk, or regulated-domain actions.

## When a preview is required

- **Always** for T3: irreversible actions, any financial transaction of any amount, anything that shares information outside the user's control, permission changes.
- **Default on** for T2 unless the user has pre-approved that action type through the Autonomy Dial — then it becomes a receipt after the fact.
- **Optional** for T1; usually skip it and rely on undo.
- **Never** for T0. A preview before a read is friction with no benefit.

If a T3 action is allowed to run autonomously inside a user-set bound, the preview moves to the moment the bound is configured, and every execution produces a receipt. Outside the bound it falls back to a preview.

## Anatomy

| Element | Required | Rule |
|---|---|---|
| **Headline** | ✓ | States the outcome in one line. "Rebook your canceled flight", not "Proposed plan". |
| **Trigger / context** | ✓ for agent-initiated | Why this is happening now. "Your 10:05 flight was canceled by the airline." |
| **Steps** | ✓ for multi-step | Numbered, ordered as executed, each a verb + object + key detail. Typically 2–7; group if more. |
| **Consequences** | ✓ for T2+ | Who is affected, what it costs, what becomes permanent. Mark each irreversible step explicitly. |
| **Rationale** | ✓ for T2+ | One "because" per non-obvious choice. Pull from the same source as the receipt (see `agentic-ux-explainable-rationale`). |
| **Confidence** | When it varies | Flag low-confidence steps inline, not in a footer (see `agentic-ux-confidence-signals`). |
| **Primary action** | ✓ | Verb-specific: "Rebook and notify hotel", not "OK" or "Confirm". |
| **Edit** | ✓ | Edit the plan, not just cancel it. |
| **Handle it myself** | ✓ | Full override that hands the user everything the agent prepared. |
| **Undo promise** | ✓ if one exists | "You can undo this for 15 minutes." Never imply an undo that doesn't exist. |

Three choices, not two. Proceed / Cancel forces a binary that doesn't match how people feel about a plan that's mostly right.

## States

| State | What the user sees | Notes |
|---|---|---|
| Drafting | Plan building progressively, steps appear as formed | Don't show a Proceed button until the plan is complete |
| Ready | Full plan, all three actions enabled | Focus lands on the headline, not the Proceed button |
| Editing | Steps become editable inline; removed steps show struck through | Recompute consequences live; changes to step 1 may invalidate step 3 |
| Revalidating | Agent re-checks the edited plan | Show what changed between versions |
| Stale | Inputs changed since the plan was made (price, availability, time passed) | Block Proceed, offer "Refresh plan" |
| Executing | Steps tick through with per-step status | Offer Stop with stated consequences ("2 of 4 done; stopping now leaves the hotel unnotified") |
| Partial failure | Which steps succeeded, which failed, what's left | Hand off to Audit & Undo and Escalation |
| Done | Becomes a receipt | Same content, past tense, with undo |

## Writing the steps

- Plain language, no system primitives. "Cancel flight UA456" — not `cancel_booking(id: 4A7B)`.
- Name the real things: the person, the amount, the file, the channel.
- Use domain terms the user uses. In DevOps, "Drain traffic from us-east-1" is clearer than a generic paraphrase.
- Put the irreversible step's marker on that step, not in a disclaimer below.
- Offer the technical detail (the actual tool call, the diff) behind a disclosure for expert users. Hidden by default, one click away.

## The Edit flow (where most previews are weak)

- Edit should let the user change parameters, remove steps, reorder where order is free, and add a constraint in words ("not after 6pm").
- After an edit, show a **diff of the plan**, not just the new plan.
- If an edit makes the plan invalid, say which step broke and why, and suggest the nearest valid plan.
- "Handle it myself" should hand over the prepared work — drafts filled in, options found — not drop the user at an empty screen.

## Interactions with other patterns

- **Autonomy Dial** decides whether this preview appears for a given action type. Document the mapping.
- **Confidence Signals** mark which steps deserve scrutiny. A plan with one uncertain step should say which.
- **Escalation Gates**: if the agent can't form a confident plan, it escalates with options instead of previewing a guess.
- **Action Audit**: on Proceed, the preview becomes the receipt. Same words, past tense.
- **Generative UI**: the plan's *content* can be generated (a comparison table, a map). The three action buttons cannot — they stay on stable components in a fixed place.

## Anti-patterns

| Scenario | Why it fails | Instead |
|---|---|---|
| Preview on every action | Users stop reading and click through; the safety mechanism fails silently | Preview T2+ only; use the dial and undo for the rest |
| "Confirm" / "OK" as the primary label | Doesn't say what will happen | Name the action: "Send to 14 customers" |
| Raw tool calls as the plan | Unreadable; users approve what they can't parse | Plain language with technical detail disclosed on demand |
| Proceed pre-focused, Enter to confirm | Habitual keypress approves a T3 action | Focus on the headline; require a deliberate action for T3 |
| Plan appears after execution started | It's a notification, not consent | Block execution until a decision is made |
| Edit = start over | Users abandon rather than restate the whole task | Inline edits with a plan diff |
| Undo promised but conditional | Breaks trust the first time it fails | State the exact window and exceptions |
| Consequences buried in a footer | Irreversibility missed | Mark the irreversible step itself |

## Accessibility

- The preview is a dialog or a landmark region with a heading; announce it when it appears.
- Steps are an ordered list (`<ol>`), not visually numbered divs.
- Irreversible markers and confidence flags have text, not color or icon alone.
- All three choices reachable by keyboard in a logical order; Escape maps to the least destructive option, never Proceed.
- Live-update step status during execution with a polite live region; announce failures assertively.
- Don't time out a preview without warning and a way to extend.

## Metrics (representative, adjust for domain risk)

From Yocco, Smashing Magazine 2026:
- **Acceptance ratio** — plans accepted without edit / plans shown. Target above 85%.
- **Override frequency** — "Handle it myself" / plans shown. Above 10% should trigger a model or planning review.
- **Recall accuracy** — in testing, can participants list the plan's steps shortly after it's hidden?

Add: **edit rate by step** (which step gets edited most is where the planner is weakest) and **time-to-decision split by tier** (T3 should be slower than T2; if it isn't, people aren't reading).

## Output: Design mode

```md
# Intent Preview spec — <feature>

## Actions covered
| Action | Tier | Preview? | Reason |

## Content
- Headline pattern: <…>
- Trigger line (agent-initiated only): <…>
- Step format: <verb + object + detail> — example plan below
- Irreversible markers: <which steps>
- Rationale sources: <user preference / rule / prior action>
- Confidence display: <where, when>

## Example (realistic, filled in)
<render the full preview in text>

## Actions
- Primary label pattern: <…>
- Edit capabilities: <params / remove / reorder / add constraint>
- Handle it myself hands over: <…>
- Undo promise: <window and exceptions, or "none">

## States
<table from above, filled in for this feature>

## Accessibility notes
## Metrics and targets
## Open questions
```

## Output: Audit mode

```md
# Intent Preview audit — <product / flow>

| ID | Severity | Action | Finding | Evidence | Fix |
|---|---|---|---|---|---|
```

Severity: **Blocker** = a T3 action executes without a preview or with an unlabeled primary action. **Major** = no Edit path, consequences hidden, preview appears after execution starts, or stale plans can be approved. **Minor** = copy, ordering, disclosure, or accessibility gaps.

## Sources

- Yocco, Smashing Magazine (Feb 2026) — anatomy, three-choice model, when to prioritize, metrics. https://www.smashingmagazine.com/2026/02/designing-agentic-ai-practical-ux-patterns/
- Eleken (2026) — "three options, not two"; Microsoft Recall as the cost of skipping consent. https://www.eleken.co/blog-posts/agentic-ux-examples
- HatchWorks (Mar 2026) — two-phase actions (plan → validate → execute) and stop semantics. https://hatchworks.com/blog/ai-agents/agent-ux-patterns/
