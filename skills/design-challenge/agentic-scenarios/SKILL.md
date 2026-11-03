---
name: agentic-scenarios
description: Write side-by-side scenarios showing the same task handled with a human in the loop and fully autonomously, including how each version fails and recovers. Produces frame-by-frame storyboards, the divergence point, failure branches, and a demo script that drives the prototype's autonomy toggle. Use for any agentic design challenge, or when asked to "compare HITL and autonomous", "show both modes", "storyboard the agent", or "what happens when it goes wrong".
---

# Agentic scenarios: human in the loop vs autonomous

A panel judging an agentic design wants to see that you understand **what changes when the agent is trusted more**, and what stays the same. This skill takes the one or two most important tasks and runs each one twice.

## Pick the tasks

From the action inventory, choose 1–2 tasks that:
- contain at least one T2 or T3 action (otherwise autonomy is uninteresting), and
- happen often enough that autonomy would actually be valuable, and
- are central to the challenge prompt.

State why you picked them in one sentence each. Ask the user to confirm before writing.

## Define the two modes

| | Human in the loop | Autonomous within bounds |
|---|---|---|
| Autonomy level | Propose or act with confirmation | Act autonomously inside a stated bound |
| User's job | Review and approve | Set the bound, read receipts, intervene by exception |
| Primary surface | Intent preview | Receipt and activity timeline |
| Gates | Every T2+ action | Only triggers: low confidence, anomaly, bound exceeded, injection, policy |

Name the bound concretely ("refunds under $50 on orders from the last 30 days"), never "low-risk actions".

## Write each scenario

For each task, a table of frames. Same task, same starting conditions, two columns:

| Frame | Human in the loop | Autonomous |
|---|---|---|
| 1. Trigger | … | … |
| 2. Agent plans | … | … |
| 3. User sees | (real UI copy) | (real UI copy) |
| 4. Decision | … | … |
| 5. Outcome | … | … |
| 6. Record | receipt / log | receipt / log |

Mark the **divergence point**: the first frame where the modes differ. Usually frame 3.

Then add **two failure branches** per task, run in both modes:
- **Agent wrong**: it acted or proposed something incorrect. How is it caught, and how is it undone or compensated in each mode?
- **Agent unsure or blocked**: confidence low, anomaly, or policy. Show the escalation prompt in each mode (it should look the same in both: gates fire at every autonomy level).

End each scenario with **what the user learns** and **what the agent learns** (teach-back, autonomy promotion or demotion).

## Demo script

Write a 2-minute demo script for the readout that drives the prototype:
1. Run the task in human-in-the-loop mode (30s)
2. Flip the autonomy toggle and run it again (30s)
3. Trigger one failure branch and show recovery (45s)
4. Close on the receipt and what got logged (15s)

List the prototype states the script needs, so the prototype step builds exactly those.

## Output

Write to `output/artifacts/scenarios.md`:

```md
# Scenarios — <feature>

## Tasks chosen and why
## Modes and bound
## Scenario 1: <task>
### Happy path (side by side)
### Failure: agent wrong
### Failure: agent unsure / blocked
### What each side learns
## Scenario 2 (optional)
## Demo script
## Prototype states required
```

Hand off to `agentic-ux-visuals` for the side-by-side storyboard, and to the prototype step for the autonomy toggle.

## Quality bar

- The autonomous version is not just "the same with fewer clicks". It changes the primary surface from preview to receipt.
- Gates still fire in autonomous mode.
- Every failure has a way out, and nothing is a dead end.
- UI copy is real copy.
