---
name: agentic-ux-explainable-rationale
description: Design or audit the Explainable Rationale pattern, a short human-readable "why" attached to an AI agent's plan, action, recommendation or escalation, grounded in the user's own rules, preferences, prior actions, or the sources it retrieved. Use when writing "why did it do that" copy, evidence or sources panels, citations for agent answers, or reviewing agent behavior that users report as random or buggy.
---

# Explainable Rationale

**What it is:** a brief, plain-language justification for what the agent did or proposes, tied to something the user recognizes: their rule, their preference, their earlier action, or a named source.

**What it is not:** a chain-of-thought dump, a technical log, or a generic disclaimer. Curated evidence, not raw reasoning.

## Mode

- **Design** → spec template at the end.
- **Audit** → findings template at the end.

## Shared risk scale

T0 read-only · T1 private & reversible · T2 visible to others or effortful to reverse · T3 irreversible, financial, external, or permission-changing.

## When it's required

- Every agent-initiated action, at any tier. Background actions triggered by an external event are where users most often read valid behavior as a bug.
- Every T2+ preview and receipt.
- Every escalation ("I stopped because…").
- Any choice among options the user didn't see ("I picked DL789 because it's the next non-stop with a confirmed seat").
- Optional for direct T0/T1 actions the user explicitly asked for — the request is the reason.

## The rationale ladder

Ground the explanation in the strongest available reason. Prefer higher rungs.

| Rung | Grounding | Example |
|---|---|---|
| 1 | **User's explicit rule or setting** | "You pre-approved same-day non-stop rebookings." |
| 2 | **User's stated preference** | "You said you prefer aisle seats." |
| 3 | **User's prior action (precedent)** | "Last three times, you moved these to Friday." |
| 4 | **Team / org policy** | "Your support guidance routes billing disputes to a human." |
| 5 | **Retrieved evidence** | "The contract (section 4.2) sets a 30-day notice period." |
| 6 | **General heuristic** | "It's the shortest total travel time." |

If the best reason is rung 6, the agent is making a judgment the user hasn't delegated. That's a signal to preview rather than act, or to ask.

## Anatomy

1. **The claim** — what was done or proposed. One line.
2. **The because** — one to three reasons, each a single sentence, each tied to a rung. Structure: *Because X, I did Y.*
3. **The trigger** (agent-initiated only) — what external event started it.
4. **Evidence link** — the rule, the setting, the source document, the prior action. Clickable.
5. **Challenge affordance** — "That's not right" → lets the user correct the reason, not just the outcome: edit the rule, swap the source, or say the preference no longer holds.
6. **Separate facts from assumptions** — if a reason is an inference, say so: "I assumed you meant the Tuesday meeting, since it's the only one this week."

## Progressive disclosure

- **Level 1, inline:** one sentence next to the action.
- **Level 2, expanded:** all reasons, the trigger, evidence links.
- **Level 3, expert/audit:** sources retrieved, tools called, the exact rule version — linked from the audit log.

Default to level 1. Never require opening a panel to learn *that* there is a reason.

## Writing rules

- Plain language; no system primitives or internal policy IDs on level 1.
- Reference the user's words when the reason is their preference. Quoting their own instruction back is the strongest trust signal there is.
- Don't apologize, hedge, or pad. "Because your flight was canceled" beats "I noticed that it appears your flight may have been canceled, so I thought it might be helpful to…".
- Don't invent reasons after the fact. The rationale must be the one the system actually used; if it isn't available, say "No specific rule applied" rather than generating a plausible story.
- One source of truth: the same rationale string appears on the preview, the receipt, and the log entry.

## Teach-back

When the user corrects the agent, reflect what changed: "Got it — I'll stop rebooking on red-eyes, even if they're the next available." Show where that rule now lives and how to edit it. This turns correction into a visible, reversible change instead of silent internal drift.

## Interactions with other patterns

- **Intent Preview** — each non-obvious step carries its because.
- **Autonomy Dial** — level-4 receipts name the bound: "within your $50 refund limit".
- **Confidence Signals** — the rationale explains *what drives* the confidence: missing data, conflicting sources, unfamiliar request.
- **Escalation Gates** — escalations lead with the reason for stopping.
- **Action Audit** — every log entry links to its rationale as recorded at the time, not regenerated later.

## Anti-patterns

| Scenario | Why it fails | Instead |
|---|---|---|
| Dumping chain-of-thought | Long, unvetted, can contradict the action; users skim or lose trust | Curated reasons tied to rungs |
| Post-hoc rationalization | A fluent story that isn't what drove the decision; discovered = trust destroyed | Log the actual decision basis; show that |
| Generic "Based on your preferences" | Unfalsifiable; tells the user nothing | Name the preference |
| Reason only in a hidden panel | Users never learn reasons exist | One line inline, always |
| No way to dispute the reason | User fixes the outcome; the agent repeats the mistake | Challenge affordance that edits the rule |
| Sources listed without scope | Users can't tell whether it used their data, org data, or the web | Label source scope |

## Accessibility

- The inline rationale is real text adjacent to the action and associated with it (e.g. `aria-describedby`), so it's read with the action.
- Expand/collapse uses a button with `aria-expanded`.
- Evidence links have descriptive text, not "here".
- Don't rely on hover tooltips for the because; they're unreachable on touch and for many assistive tech users.

## Metrics (representative)

From Yocco, Smashing 2026:
- **"Why?" ticket volume** — support tickets tagged "agent behavior unclear" per 1,000 active users.
- **Rationale validation** — share of users rating the explanation helpful in microsurveys.

Add: **challenge rate by rung** (if rung-1 rationales get challenged, the rule store is wrong) and **repeat-correction rate** (the same correction made twice means teach-back isn't persisting).

## Output: Design mode

```md
# Explainable Rationale spec — <feature>

## Where rationale appears
| Surface | Level shown | Content |

## Reason sources by action
| Action | Primary rung | Data needed to produce it | Fallback |

## Copy patterns (with filled examples)
- Inline: <…>
- Expanded: <…>
- Escalation lead: <…>

## Challenge flow
## Teach-back behavior
## Engineering requirements (decision basis logging)
## Accessibility
## Metrics
```

## Output: Audit mode

```md
# Explainable Rationale audit — <product>

| ID | Severity | Surface | Finding | Evidence | Fix |
```

Severity: **Blocker** = agent-initiated T3 actions with no reason given, or reasons that are demonstrably invented. **Major** = rationale hidden by default, generic, or not available on receipts/escalations; no challenge path. **Minor** = verbosity, jargon, accessibility, inconsistency across surfaces.

## Sources

- Yocco, Smashing Magazine (Feb 2026) — grounding in precedent, "because you said X, I did Y", metrics. https://www.smashingmagazine.com/2026/02/designing-agentic-ai-practical-ux-patterns/
- Eleken (2026) — Intercom Fin showing applied guidance and sources per conversation. https://www.eleken.co/blog-posts/agentic-ux-examples
- HatchWorks (Mar 2026) — evidence panel: sources and rationale, not chain-of-thought; challenge affordance. https://hatchworks.com/blog/ai-agents/agent-ux-patterns/
- UX.raspberry, Medium (Feb 2026) — teach-back; RAG as an information contract. https://medium.com/@uxraspberry/the-agentic-interface-principles-and-patterns-for-autonomous-user-experiences-b0c1ecb8544f
