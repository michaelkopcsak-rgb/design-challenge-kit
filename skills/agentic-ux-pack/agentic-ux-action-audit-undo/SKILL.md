---
name: agentic-ux-action-audit-undo
description: Design or audit Action Audit and Undo (receipts and rollbacks) for an AI agent, the persistent record of everything the agent did with per-action receipts, status, diffs, undo windows, compensation for irreversible steps, and recovery after mistakes. Use when specifying an agent activity log or timeline, action receipts, undo or rollback flows, stop and pause controls, error apology and repair messaging, or reviewing an agent whose changes users can't see or reverse.
---

# Action Audit & Undo

**What it is:** two linked surfaces. A **receipt** for every action the agent commits (what changed, where, why, how to reverse it), and a **timeline** that keeps every receipt in order. Plus the **recovery** paths — undo, rollback, compensation, repair — that make delegation feel safe.

**What it is not:** a developer log, a cheerful "Done!", or an undo button that only works sometimes without saying so.

Credible undo is the single strongest lever for getting users to grant autonomy. Design it before you need it.

## Mode

- **Design** → spec template at the end.
- **Audit** → findings template at the end.

## Shared risk scale

T0 read-only · T1 private & reversible · T2 visible to others or effortful to reverse · T3 irreversible, financial, external, or permission-changing.

## Requirements by tier

| Tier | Log | Receipt | Recovery |
|---|---|---|---|
| T0 | ✓ (optional to surface) | — | — |
| T1 | ✓ | Lightweight (toast + log) | One-click undo |
| T2 | ✓ | Full receipt | Undo, or a stated reversal path ("I'll post a correction") |
| T3 | ✓ | Full receipt, persistent | Undo window if possible; otherwise a **compensation** path, stated before the action |

## The receipt

| Field | Rule |
|---|---|
| **What happened** | Past tense, plain language, named objects: "Refunded $42.00 to Dana Lee's Visa ending 4417" |
| **Where** | System, record, channel, with a link to the changed thing |
| **Who / on whose authority** | Which agent (if several), acting under which setting or approval: "within your $50 refund limit" / "approved by you at 2:14pm" |
| **Why** | The same rationale string shown on the preview |
| **What changed** | A diff for edits (before → after); a list for bulk actions with counts |
| **Status** | Succeeded · In progress · Partially succeeded · Failed · Undone · Expired (undo window closed) |
| **Recovery** | Undo button with its window ("Undo — available for 15 min"), or the compensation path, or "This can't be undone" stated plainly |
| **Time** | Absolute timestamp in the user's timezone, plus relative ("4 min ago") |
| **Confidence at the time** | If it was medium or low, record that |

## The timeline

- **Chronological**, newest first, filterable by agent, action type, tier, status, and date.
- **Pinned "current step"** for long-running work, with a jump to the artifact produced at each stage.
- **Severity levels** collapsible: routine actions folded, T2+ visible by default.
- **Grouping**: one task that spawned twenty actions appears as one expandable row, not twenty.
- **Settings changes are actions**: raising or lowering autonomy shows up in the log.
- **Persistent and exportable** for audit and compliance contexts.

## Undo, rollback, compensation

These are different, and the UI must not blur them.

- **Undo** — exact reversal, within a window. Rename back, restore the record.
- **Rollback** — reverse a multi-step task to a checkpoint. Show which steps will be reversed and which can't be.
- **Compensation** — an irreversible action can't be undone, but its effect can be offset: a refund for a charge, a correction for a sent message, a revoke for a share. Name it as such: "This email can't be unsent. I can send a correction to all 14 recipients."

Rules:
1. **State the window before, and on, every receipt.** When it closes, the status changes to Expired. Honesty about when an action becomes permanent builds as much trust as undo itself.
2. **Undo is itself an action** with its own receipt.
3. **Undo of an undo** (redo) should exist for T1–T2.
4. **Partial reversals are explicit:** "Undid 3 of 4. The hotel was already notified — want me to send an update?"
5. **Downstream effects:** if undoing step 1 invalidates steps 2–3, say so before the user confirms.

## Stop, pause, resume

For any agent that runs asynchronously:
- **Stop** with stated consequences: "2 of 4 steps done. Stopping now leaves the hotel unnotified. Undo the first two too?"
- **Pause / Resume** with what happens to queued actions and in-flight tool calls.
- These controls live in a fixed, always-reachable place — not inside the chat transcript.

## Repair and redress (when the agent got it wrong)

The error message is the apology. Structure it in three parts (after Yocco, Smashing 2026):
1. **Acknowledge** — plainly, first person, no hedging: "I transferred $250 to the wrong account."
2. **State the correction** — what has already been done to fix it: "I reversed it; the $250 is back in your account."
3. **Path to more help** — a human, a report, and what happens next: "Flagged for review. Contact support."

A well-handled failure can leave users more trusting than no failure at all (the service recovery paradox). A defensive or vague one ends the relationship.

## Interactions with other patterns

- **Intent Preview** → on Proceed, the preview becomes the receipt. Same words, past tense.
- **Autonomy Dial** → no level 4 without credible undo or compensation. Receipts offer "Ask me first next time".
- **Explainable Rationale** → every receipt carries its because, as recorded at the time.
- **Confidence Signals** → log confidence at time of action.
- **Escalation Gates** → partial failures escalate with the receipt attached.
- **Generative UI** → receipts and undo controls are stable design-system components, never generated.

## Anti-patterns

| Scenario | Why it fails | Instead |
|---|---|---|
| "Done!" with no detail | Users can't tell what changed; support tickets follow | Full receipt with diff |
| Activity only in the chat transcript | Unscannable, unfilterable, scrolls away | Dedicated timeline |
| Undo that silently fails after a window | One failure breaks trust permanently | Show the window; mark Expired |
| Calling compensation "undo" | Users believe the email was unsent | Name compensation honestly |
| Twenty rows for one task | Noise hides the important action | Group by task |
| Defensive error copy ("An issue occurred") | Reads as evasion | Acknowledge, correct, offer help |
| Stop button that just hides the UI | Agent keeps working | Stop actually halts and reports state |

## Accessibility

- Timeline is a list or table with headings and status text, not icons alone.
- Undo is a real button, keyboard-reachable from the receipt and from the toast; toasts don't auto-dismiss before a keyboard user can reach Undo (provide the action in the timeline too).
- Announce new receipts politely; announce failures and expiring windows assertively.
- Diffs convey change with text markers ("removed", "added"), not color alone.

## Metrics (representative)

From Yocco, Smashing 2026:
- **Reversion rate** — undone actions / actions performed, per action type. Above 5% for a task type → disable automation for that task.
- **Safety-net conversion** — share of users who raise autonomy within 7 days of successfully using undo.

Add: **"what did it do?" ticket volume**, **undo success rate** (undos that worked / undos attempted), and **time-to-recovery** after an agent error.

## Output: Design mode

```md
# Action Audit & Undo spec — <feature>

## Actions and recovery type
| Action | Tier | Receipt? | Recovery: undo / rollback / compensation / none | Window |

## Receipt template (filled example)
## Timeline: filters, grouping, placement
## Stop / pause semantics
## Repair message templates (filled examples)
## Engineering requirements (logging, idempotency, reversal hooks)
## Accessibility
## Metrics
## Open questions
```

## Output: Audit mode

```md
# Action Audit & Undo audit — <product>

| ID | Severity | Action / surface | Finding | Evidence | Fix |
```

Severity: **Blocker** = T2+ actions leave no user-visible record; no way to stop a running agent; undo claimed but doesn't work. **Major** = no diffs, no windows stated, compensation mislabeled as undo, log only in chat. **Minor** = grouping, filtering, timestamps, copy, accessibility.

## Sources

- Yocco, Smashing Magazine (Feb 2026) — timeline, status indicators, time-limited undo, repair and redress structure, reversion and safety-net metrics. https://www.smashingmagazine.com/2026/02/designing-agentic-ai-practical-ux-patterns/
- HatchWorks (Mar 2026) — action receipts, activity timeline, start/stop/pause/resume semantics, taskboard. https://hatchworks.com/blog/ai-agents/agent-ux-patterns/
- Eleken (2026) — Salesforce Agentforce observability as a production audit example; "the invisible agent" failure. https://www.eleken.co/blog-posts/agentic-ux-examples
