---
name: agentic-ux-escalation-gates
description: Design or audit Escalation Pathways and human-in-the-loop (HITL) gates, the moments an AI agent pauses autonomous work to ask for clarification, choose between options, request approval, or hand off to a human expert because of ambiguity, risk, low confidence or anomaly. Use when defining approval checkpoints, clarifying-question behavior, approval queues and escalation chains, handoff to human support, or reviewing an agent that guesses too often or asks too often.
---

# Escalation Gates

**What it is:** a designed interruption. The agent stops at a defined trigger, says why, and asks for exactly the decision it needs — from the user or from a higher-authority human — then resumes from where it paused.

**What it is not:** a generic error, a dead end, or a confirmation dialog on every step.

A well-designed agent doesn't guess at consequential ambiguity; it asks. And it doesn't ask about things it should handle.

## Mode

- **Design** → spec template at the end.
- **Audit** → findings template at the end.

## Shared risk scale

T0 read-only · T1 private & reversible · T2 visible to others or effortful to reverse · T3 irreversible, financial, external, or permission-changing.

## Three kinds of escalation

| Kind | When | Shape | Example |
|---|---|---|---|
| **Clarify** | Intent is ambiguous | One specific question, with the likely answers as choices | "'Next Tuesday' — the 30th or the 7th?" |
| **Choose** | Several valid paths, the choice is the user's taste or priority | 2–4 options with the trade-off of each | "Three flights match. Fastest, cheapest, or the one with lounge access?" |
| **Approve / hand off** | High risk, anomaly, policy, or low confidence on a consequential action | The prepared action + why it stopped + who can decide | "This transfer is unusual for this account. Send to a human reviewer?" |

## Triggers

Define these per action type. Each is a rule, not a vibe.

1. **Confidence below threshold** — set per action type from calibration data (see `agentic-ux-confidence-signals`).
2. **Irreversibility** — any T3 action outside a pre-approved bound.
3. **Bound exceeded** — a level-4 action falls outside its user-set limit.
4. **Anomaly** — out of pattern for this user/account (amount, recipient, time, volume).
5. **Conflict** — sources disagree, or instructions conflict with policy or a prior user rule.
6. **Missing input** — a required parameter isn't known and can't be safely inferred.
7. **Suspected manipulation** — instructions arrived via content (a web page, an email) rather than from the user. Always escalate; never act on them silently.
8. **Budget or time limit** — approaching max spend, max runtime, or max retries.
9. **Policy** — a domain rule requires a human (compliance, safety, legal).

## Calibrating frequency

Escalation is a dial, not a switch. Too frequent and users stop reading and approve reflexively — the gate has failed quietly. Too rare and the agent eventually makes a confident, catastrophic guess.

- **Healthy band: roughly 5–15% of tasks** escalated (Yocco, Smashing 2026; Eleken 2026). Treat as a starting benchmark; high-stakes domains run higher, mature low-risk workflows lower.
- Track it per action type. One type escalating 40% of the time is a planning problem; one at 0% for months with high undo rates is a missing trigger.

## Synchronous vs asynchronous

Not every gate should block the user's screen (after Agentic Design's approval-queue pattern):

| Risk | Gate style | Agent behavior while waiting |
|---|---|---|
| Reversible / low | Auto-approve, receipt after | Continues |
| Medium | **Async review** — queued for approval | Persists state, continues other work, resumes when decided |
| Irreversible / high | **Sync approval** before execution | Waits; shows what's held |

Async gates need: a queue the approver can find, notifications, an SLA, what happens if nobody answers (expire, remind, or route up — never auto-approve a T3 by timeout), and state rehydration so the agent resumes with full context.

## Anatomy of an escalation prompt

1. **What I was doing** — one line of context.
2. **Why I stopped** — the trigger, in plain language. Lead with this.
3. **What I need** — one decision, phrased as a question.
4. **Options** — prepared choices, each with its consequence; the agent's recommendation marked if it has one, with its reason.
5. **Free-form path** — "Something else…" for answers the options miss.
6. **Who else can decide** — for hand-offs, the human or team and expected response time.
7. **What happens if I don't answer** — the agent's waiting behavior and any deadline.

## Hand-off to a human

- Transfer the full context: the request, the plan, what's done, the receipts, why it stopped. The human should never have to ask the user to repeat themselves.
- Tell the user who has it and when to expect a response.
- When the human resolves it, the resolution and its reason land in the audit log and, where appropriate, become a rule (teach-back).

## Interactions with other patterns

- **Confidence Signals** feed the first trigger. A confidence display with no gate behind it is decoration.
- **Autonomy Dial** — gates fire at every level. Level 4 never means "never ask". Repeated escalations on one type → suggest lowering its level.
- **Intent Preview** — if the agent can't form a confident plan, it escalates with options rather than previewing a guess.
- **Explainable Rationale** — the "why I stopped" is a rationale.
- **Action Audit** — every escalation, answer, and timeout is logged.
- **Generative UI** — the options can be presented in a generated view (a comparison), but the decision controls are stable components.

## Anti-patterns

| Scenario | Why it fails | Instead |
|---|---|---|
| Confirm every step | Approval fatigue; users click through and the gate is meaningless | Gate on defined triggers only |
| Never asking | Confident, catastrophic guesses | Defined triggers per action type |
| Vague prompt ("I need more information") | User doesn't know what to answer | One specific question with choices |
| Open question with no options | Puts the full burden back on the user | Offer likely answers + "something else" |
| Hand-off loses context | User repeats everything; feels like a reset | Transfer full state |
| Auto-approve on timeout for T3 | Silence becomes consent | Expire, remind, or route up |
| Acting on instructions found in content | Injection risk | Escalate with the quoted instruction and its source |
| Gate appears mid-execution with no state | User can't tell what's done | Show completed / held / pending steps |

## Accessibility

- Escalations are announced (assertive for sync gates, polite for async queue arrivals).
- Options are real radio buttons or buttons with labels; the recommended one is marked in text.
- Focus moves to the question, not to an option; Escape never selects the riskiest path.
- Async queue items are reachable and actionable by keyboard; deadlines stated in text with absolute times.

## Metrics (representative)

From Yocco, Smashing 2026:
- **Escalation frequency** — agent requests for help / total tasks. Healthy range 5–15%.
- **Recovery success rate** — tasks completed after escalation / total escalations. Target above 90%.

Add: **time-to-decision** for sync and async gates, **reflexive-approval rate** (approvals faster than the content can be read — a sign of fatigue), and **post-escalation undo rate** (if humans approve then undo, the prompt isn't conveying enough).

## Output: Design mode

```md
# Escalation Gates spec — <feature>

## Triggers by action type
| Action | Tier | Triggers (rules) | Kind (clarify / choose / approve) | Sync or async | Approver |

## Prompt templates (filled examples, one per kind)
## Async queue: location, notifications, SLA, timeout behavior
## Human hand-off: who, context transferred, user messaging
## Frequency target and review cadence
## Accessibility
## Metrics
## Open questions
```

## Output: Audit mode

```md
# Escalation Gates audit — <product>

| ID | Severity | Action / moment | Finding | Evidence | Fix |
```

Severity: **Blocker** = T3 actions proceed on low confidence or anomaly with no gate; content-borne instructions executed; T3 auto-approved on timeout. **Major** = gates on everything (fatigue) or nothing; vague prompts; hand-offs lose context; no async path for long work. **Minor** = copy, option design, deadlines, accessibility.

## Sources

- Yocco, Smashing Magazine (Feb 2026) — clarify / present options / human intervention; escalation frequency 5–15%; recovery success above 90%. https://www.smashingmagazine.com/2026/02/designing-agentic-ai-practical-ux-patterns/
- Eleken (2026) — Google Jules plan approval and mid-task conversation; "too much escalation" failure mode. https://www.eleken.co/blog-posts/agentic-ux-examples
- Agentic Design — Human-in-the-Loop and Approval Queues & Escalation Chains (risk tiering, async review with state rehydration, adjudicator routing). https://agentic-design.ai/patterns/ui-ux-patterns
- Google Cloud Architecture Center — human-in-the-loop as predefined checkpoints that pause execution for review. https://docs.cloud.google.com/architecture/choose-design-pattern-agentic-ai-system
- HatchWorks (Mar 2026) — human checkpoint gate types; safe-mode and "I'm stuck" states; budget and time boxes. https://hatchworks.com/blog/ai-agents/agent-ux-patterns/
