---
name: agentic-ux-autonomy-dial
description: Design or audit the Autonomy Dial (progressive autonomy) pattern, where users set how independently an AI agent may act, per task type, from observe-and-suggest through plan-and-propose and act-with-confirmation to act-autonomously within bounds. Use when specifying agent permission settings, autopilot or copilot modes, delegation controls, onboarding for agent trust, or reviewing whether an agent's independence is one global switch.
---

# Autonomy Dial

**What it is:** a standing setting, chosen by the user, that defines what the agent may do without asking. Set per action type, bounded by explicit limits, and changeable at any time.

**What it is not:** a single on/off toggle, a model setting, or a one-time onboarding question that can't be revisited.

> Agency is the system's capacity to form intent and act. Autonomy is how much of that we allow without the user. Every agent has agency; **autonomy is a design choice.** (After UX.raspberry, 2026.)

## Mode

- **Design** → spec template at the end.
- **Audit** → findings template at the end.

## Shared risk scale

T0 read-only · T1 private & reversible · T2 visible to others or effortful to reverse · T3 irreversible, financial, external, or permission-changing.

## The levels

Use four levels. Name them in the product's own words, but keep the semantics.

| Level | Agent does | User does | Common name |
|---|---|---|---|
| **1 · Observe & suggest** | Notices issues and opportunities; never proposes a plan | Decides and acts | Operator |
| **2 · Plan & propose** | Builds plans; executes nothing | Reviews every plan | Copilot |
| **3 · Act with confirmation** | Prepares actions ready to go | Gives final go / no-go | Collaborator |
| **4 · Act autonomously, within bounds** | Executes and reports after | Monitors; can undo | Autopilot |

(Levels from Yocco, Smashing 2026; role names after UX.raspberry, 2026.)

A fifth state, **Paused**, must always be available: the agent stops initiating anything until resumed.

## Rules

1. **Per action type, not global.** "Schedule internal meetings" and "send email to customers" get separate dials. One global switch forces users to set everything to the level their riskiest action needs.
2. **Bounds make level 4 safe.** Autonomous only within explicit limits: amount ("under $50"), audience ("internal only"), scope ("same-day, non-stop flights"), time ("business hours"). Outside the bound, drop to level 3 automatically.
3. **Ceilings by tier.** The product, not the user, sets the maximum level per tier. Default ceilings: T0–T1 up to 4; T2 up to 4 with bounds; T3 up to 3, with 4 allowed only for narrow bounded subclasses and only if a credible undo or compensation exists.
4. **Start low.** New users and new action types default to level 2. Let users raise it — and let the product suggest raising it when evidence supports it.
5. **Earn it with evidence.** Offer a raise when an action type has a high accept-without-edit rate and a low undo rate over a meaningful sample. Offer a lowering after repeated undos or escalations. Never change the level silently.
6. **Admins can cap; users can lower.** In organizations, an admin ceiling overrides user settings upward, never downward.
7. **Show the current level where the agent acts.** Not only in settings. A small, persistent indicator near the agent's activity: "Booking: acts within your limits."

## Where the dial lives

- **Settings page** — the full matrix of action types × levels × bounds.
- **Inline, at the moment of decision** — on a preview or receipt: "Always do this for same-day rebookings?" (raise) or "Ask me first next time" (lower). This is where most real adjustments happen.
- **Onboarding** — introduce two or three common action types with a recommended default, not the whole matrix.

## States and edge cases

| Situation | Behavior |
|---|---|
| Action falls outside a level-4 bound | Downgrade to level 3 for this instance; say why ("This refund is $72, above your $50 limit") |
| Admin ceiling lower than user's choice | Show the user's choice as capped, with who set the cap |
| Agent paused | All agent-initiated work stops; in-flight actions finish or roll back — say which |
| New action type the agent learns | Arrives at level 2, never inherits a higher level from a "similar" type |
| User raises a T3 action to level 4 | Confirm with the bound, the undo/compensation path, and an example of what will now happen unasked |
| Setting changed | Log it in the audit trail like any other action |

## Interactions with other patterns

- **Intent Preview** — the dial determines which actions preview. Make that mapping explicit in the spec.
- **Action Audit & Undo** — credible undo is what makes users willing to raise the dial. No undo, no level 4.
- **Escalation Gates** — gates fire regardless of dial level. Level 4 never means "never ask".
- **Explainable Rationale** — level-4 receipts must say the bound they ran under: "because you pre-approved same-day non-stop rebooking".
- **Confidence Signals** — low confidence downgrades a level-4 action to level 3 for that instance.

## Anti-patterns

| Scenario | Why it fails | Instead |
|---|---|---|
| One global on/off | Users pick the level their scariest action needs, or abandon the feature after one failure | Per-action-type dials |
| Autonomy granted at signup | Trust hasn't been earned; first mistake ends the relationship | Start at level 2; offer raises with evidence |
| Level 4 without bounds | Unlimited authority for a fallible system | Every level-4 setting carries explicit limits |
| Silent self-promotion ("I've started handling these for you") | Autonomy taken, not granted | Suggest; require the user to accept |
| Settings buried three menus deep | Users can't dial back after a failure, so they turn the agent off | Inline "ask me first next time" on receipts |
| Levels named by technology ("LLM mode") | Means nothing to users | Name by what the user experiences |

## Accessibility

- Implement as a labeled radio group or segmented control, not a continuous slider; the levels are discrete. If a slider is used visually, expose it as discrete steps with text values.
- Each level carries a one-line description of what the agent will and won't do.
- Bounds are form fields with labels and units, validated with text errors.
- The current-level indicator near the agent's activity is text, not just an icon.

## Metrics (representative)

From Yocco, Smashing 2026:
- **Trust density** — distribution of users across levels, per action type.
- **Setting churn** — level changes per active user per month. High churn signals trust volatility.

Add: **raise-offer acceptance rate**, **downgrade-after-failure rate** (healthy: users lower one action type rather than disabling the agent), and **bound-exceedance rate** (how often level-4 actions fall outside their bound — if high, the bounds don't match reality).

## Output: Design mode

```md
# Autonomy Dial spec — <feature>

## Levels (product names)
| Level | Name | One-line promise to the user |

## Matrix
| Action type | Tier | Default | Ceiling | Bound fields (for level 4) | Admin cap? |

## Placement
- Settings: <…>
- Inline raise/lower prompts: <where, wording>
- Onboarding: <which 2–3 action types, defaults>
- Current-level indicator: <where, wording>

## Promotion / demotion rules
- Offer raise when: <evidence threshold>
- Offer lower when: <signal>

## Edge cases
## Accessibility
## Metrics
## Open questions
```

## Output: Audit mode

```md
# Autonomy Dial audit — <product>

| ID | Severity | Finding | Evidence | Fix |
```

Severity: **Blocker** = T3 actions run autonomously without bounds or without user opt-in. **Major** = single global toggle; no inline way to lower; autonomy changed by the system silently; no pause. **Minor** = naming, discoverability, indicator, accessibility.

## Sources

- Yocco, Smashing Magazine (Feb 2026) — four-level taxonomy, per-task granularity, phased rollout, metrics. https://www.smashingmagazine.com/2026/02/designing-agentic-ai-practical-ux-patterns/
- UX.raspberry, Medium (Feb 2026) — operator → collaborator → autopilot spectrum; agency vs autonomy. https://medium.com/@uxraspberry/the-agentic-interface-principles-and-patterns-for-autonomous-user-experiences-b0c1ecb8544f
- Eleken (2026) — Booking.com partner messaging modes as a production example. https://www.eleken.co/blog-posts/agentic-ux-examples
- HatchWorks (Mar 2026) — suggest → draft → execute; default low for first-time workflows. https://hatchworks.com/blog/ai-agents/agent-ux-patterns/
