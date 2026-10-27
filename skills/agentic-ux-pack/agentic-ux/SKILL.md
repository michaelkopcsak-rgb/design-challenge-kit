---
name: agentic-ux
description: Start here when designing or reviewing any product feature where an AI agent plans or takes actions for a user. Inventories the agent's actions, scores each by risk, decides which of the seven agentic UX patterns each one needs (intent preview, autonomy dial, explainable rationale, confidence signals, action audit and undo, escalation gates, generative UI), and routes to the pattern skills. Use for "design the UX for our agent", "review this agentic flow", "what controls does this AI feature need", or any agent feature spec, prototype or audit.
---

# Agentic UX: the router

Seven patterns, one job: make an agent's autonomy feel **granted by the user, not taken by the system**. This skill decides which patterns a flow needs and how they fit together. The pattern skills do the detailed work.

| Pattern | Skill | Lifecycle slot | The question it answers |
|---|---|---|---|
| Intent Preview | `agentic-ux-intent-preview` | Before action | "What are you about to do?" |
| Autonomy Dial | `agentic-ux-autonomy-dial` | Before action (standing) | "What are you allowed to do without me?" |
| Explainable Rationale | `agentic-ux-explainable-rationale` | During / after | "Why did you do that?" |
| Confidence Signals | `agentic-ux-confidence-signals` | During | "How sure are you?" |
| Action Audit & Undo | `agentic-ux-action-audit-undo` | After action | "What changed, and can I take it back?" |
| Escalation Gates | `agentic-ux-escalation-gates` | During (interrupt) | "When will you stop and ask me?" |
| Generative UI | `agentic-ux-generative-ui` | Any | "What's the right surface for this moment?" |

## Pick a mode

- **Design mode** — there's a feature idea, PRD, or flow to be designed. Output: a pattern plan (below), then a spec per pattern from the pattern skills.
- **Audit mode** — there's an existing product, prototype, screenshots, or code. Output: a coverage report (below) with findings by severity.

If unclear, ask one question: *"Are we designing this or reviewing something that exists?"*

## Step 1 — Inventory the agent's actions

List every distinct thing the agent can do that has an effect. Not features — **verbs with objects**: "send email to customer", "issue refund", "reschedule meeting", "edit record", "summarize thread". Reads with no side effects count too, because they still need rationale and confidence.

For each action capture: trigger (user-asked or agent-initiated), target (whose data / which system), audience (who else sees the result), reversibility, and frequency.

If you can't build this list, the feature isn't defined well enough to design controls for. Say so and help define it.

## Step 2 — Score each action's risk tier

All seven skills share this scale. Use the highest tier any property pushes it to.

| Tier | Definition | Examples |
|---|---|---|
| **T0 — Read** | No side effects. | Search, summarize, analyze, draft not yet saved |
| **T1 — Private & reversible** | Changes only the user's own space; trivially undone. | Save a draft, tag an item, reorder a list |
| **T2 — Visible or effortful to reverse** | Others can see it, or undo takes real effort, or it touches shared records. | Post internally, update a CRM field, accept a meeting |
| **T3 — Irreversible, financial, external, or permission-changing** | Can't be undone, moves money (any amount), leaves the organization, or changes who can access what. | Send external email, pay, delete, share a file, grant access, deploy |

Bump a tier when: the agent initiated it rather than the user, it runs in bulk, it acts on someone else's behalf, or the domain is regulated (health, finance, legal, employment).

## Step 3 — Map actions to patterns

Default requirements by tier. Treat "required" as the minimum, not the design.

| Pattern | T0 | T1 | T2 | T3 |
|---|---|---|---|---|
| Intent Preview | — | Optional | Required unless pre-approved via dial | **Always**, even when autonomous is allowed* |
| Autonomy Dial | — | Optional | Required if users vary in tolerance | Required; autonomous only for narrow, bounded subclasses |
| Explainable Rationale | When non-obvious | When agent-initiated | Required | Required |
| Confidence Signals | When output quality varies | When output quality varies | Required where the agent chose between options | Required |
| Action Audit & Undo | Log only | Log + undo | Log + undo + receipt | Log + receipt; undo window or compensation path stated up front |
| Escalation Gates | Clarify on ambiguity | Clarify on ambiguity | Gate on low confidence or anomaly | Gate on low confidence, anomaly, or any irreversibility |
| Generative UI | Any | Any | Generated views may present; actions stay on stable components | Never generate the approval surface itself |

\* A T3 action can be autonomous only inside a user-set bound (e.g. "refunds under $50") with an after-the-fact receipt. Outside the bound, it's a preview.

## Step 4 — Check the joints between patterns

Most failures happen between patterns, not inside one. Verify each:

1. **Dial → Preview.** The autonomy level decides *which* actions show a preview. Document that mapping per action; never leave it implicit.
2. **Confidence → Escalation.** Low confidence must route somewhere. A confidence badge with no gate behind it is decoration.
3. **Undo → Dial.** Users only grant more autonomy when undo is credible. Don't offer "Act autonomously" for an action with no undo or compensation path.
4. **Rationale everywhere.** The same "because…" appears on the preview, the receipt, and the escalation prompt. One source of truth, three placements.
5. **Audit log ↔ Rationale.** Every logged action links to the rationale and the confidence it had at the time.
6. **Generative UI ↔ Controls.** Generated surfaces can show anything; approval, undo and stop controls live on stable, design-system components with fixed positions.
7. **Escalation ↔ Dial.** Repeated escalations on one action type are a signal to suggest lowering autonomy for it; zero escalations over a long run with low undo rates is a signal to offer raising it.

## Step 5 — Sequence the rollout

Ship in this order (adapted from Yocco, Smashing Magazine 2026; and HatchWorks' maturity model):

1. **Foundational safety** — Intent Preview for every T2+ action; Audit & Undo infrastructure even before anything is autonomous; stop/pause controls for long-running work.
2. **Calibrated autonomy** — Autonomy Dial limited to "act with confirmation"; Explainable Rationale on every prepared action; Confidence Signals where outputs vary.
3. **Proactive delegation** — "Act autonomously" for specific low-risk, reversible action types, chosen using evidence from phase 2 (high accept-without-edit, low undo).

Don't skip levels. High-stakes domains move slower.

## Output: Design mode — the pattern plan

```md
# Agentic UX pattern plan — <feature>

## Action inventory
| # | Action | Trigger | Target / audience | Reversible? | Tier |
|---|---|---|---|---|---|

## Pattern assignments
| # | Action | Preview | Dial default | Rationale | Confidence | Audit/Undo | Gate triggers | Surface |
|---|---|---|---|---|---|---|---|---|

## Joints checked
- Dial → Preview: <mapping>
- Confidence → Escalation: <thresholds and routes>
- (…all seven…)

## Open decisions for the team
- <decisions that need product, legal, or engineering input>

## Next: run each pattern skill for detailed specs
```

## Output: Audit mode — the coverage report

```md
# Agentic UX audit — <product / flow>

## Summary
<3–5 sentences: overall maturity (chat-first / guided / trusted autonomy), biggest risk, top fix>

## Coverage matrix
| Action | Tier | Preview | Dial | Rationale | Confidence | Audit/Undo | Gates | Surface |
|---|---|---|---|---|---|---|---|---|
(✓ present and adequate · ◐ present but weak · ✗ missing where required · — not required)

## Findings
| ID | Severity | Pattern | Where | What's wrong | Why it matters | Recommended fix |
|---|---|---|---|---|---|---|
```

Severity:
- **Blocker** — a T3 action can happen without consent, without a record, or without a way to stop it.
- **Major** — a required pattern is missing or misleading for T2+, or a joint is broken (e.g. confidence shown but never gates).
- **Minor** — the pattern exists but copy, placement, accessibility or metrics are weak.

Audit only what you can see. When evidence is missing (no screenshot of the undo flow), list it under "Not verified" rather than guessing.

## Principles that apply to every pattern

- **Plain language over system primitives.** "Cancel flight AA123" not `cancel_booking(id: 4A7B)`.
- **Earned autonomy.** Start low; let evidence raise it.
- **Nudge, don't nag.** Friction belongs where risk is; everywhere else it trains people to click through.
- **Adapt content, not structure.** Users keep their bearings when the frame is stable.
- **Accessible by default.** Every status, confidence level and gate must work without color, without a mouse, and with a screen reader announcing changes.
- **Don't claim agency you don't have.** If the "agent" is a fixed workflow, design it as one.

## Sources

- Yocco, V. *Designing For Agentic AI: Practical UX Patterns For Control, Consent, And Accountability.* Smashing Magazine, Feb 2026. https://www.smashingmagazine.com/2026/02/designing-agentic-ai-practical-ux-patterns/
- Chervynskyi, M. & Mayka, K. *Real-World Agentic UX Examples and the 6 Patterns That Make Them Work.* Eleken, 2026. https://www.eleken.co/blog-posts/agentic-ux-examples
- Smith, A. *Agent UX Patterns: Chat-First UX Fails.* HatchWorks, Mar 2026. https://hatchworks.com/blog/ai-agents/agent-ux-patterns/
- UX.raspberry. *The agentic interface.* Medium, Feb 2026. https://medium.com/@uxraspberry/the-agentic-interface-principles-and-patterns-for-autonomous-user-experiences-b0c1ecb8544f
- Agentic Design pattern catalog. https://agentic-design.ai/patterns/ui-ux-patterns
- Google Cloud. *Choose a design pattern for your agentic AI system.* https://docs.cloud.google.com/architecture/choose-design-pattern-agentic-ai-system
