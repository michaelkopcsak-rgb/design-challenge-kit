---
name: agentic-ux-confidence-signals
description: Design or audit Confidence Signals and uncertainty visualization for an AI agent, showing how sure the agent is about a plan, answer, extraction or action so users scrutinize the right things and avoid automation bias. Use when deciding whether to show confidence scores, designing confidence badges, bands, ranges, alternatives or scope statements, setting thresholds that trigger review, or auditing an agent that sounds equally certain about everything.
---

# Confidence Signals

**What it is:** a legible signal of how much the agent's output deserves trust *right now*, placed where the user decides, and wired to behavior (review, escalation, autonomy downgrade).

**What it is not:** a decorative percentage, a substitute for a gate, or a number nobody has checked against real accuracy.

The goal is **calibrated reliance**: users scrutinize low-confidence work and stop anxiously re-checking high-confidence work.

## Mode

- **Design** → spec template at the end.
- **Audit** → findings template at the end.

## Shared risk scale

T0 read-only · T1 private & reversible · T2 visible to others or effortful to reverse · T3 irreversible, financial, external, or permission-changing.

## A correction worth carrying

The 5–15% figure that circulates with this pattern is a **healthy escalation frequency** — the share of tasks where the agent asks for help (Yocco, Smashing 2026; Eleken 2026). It is not a confidence threshold. Confidence thresholds must be set per action type from your own calibration data, then tuned so the resulting escalation rate lands in a sensible band. See `agentic-ux-escalation-gates`.

## Gate zero: is the signal real?

Before designing any visual, answer with engineering:

1. **Where does the number come from?** Model log-probabilities, a verifier, retrieval coverage, agreement across samples, rule checks, input completeness? Each means something different.
2. **Is it calibrated?** When the system says "high", is it right at a correspondingly high rate on your data? If nobody has checked, the signal can mislead more than it helps.
3. **Is it per-item?** A plan's confidence is usually the confidence of its weakest step. Signal at the step or field level.

If the signal isn't calibrated, show **reasons for uncertainty** ("two sources disagree", "the date is ambiguous") instead of a score. Reasons are honest even when numbers aren't.

## When to show confidence

Use when:
- Output quality varies with input quality or ambiguity.
- The user must critically evaluate before acting (expert tools: medical, legal, code, finance).
- The agent chose between competing interpretations.
- It's a T2+ action the agent prepared.

Avoid when:
- The output is deterministic (a rule-based result is right or wrong, not "82% likely").
- The task is low-stakes and casual.
- Every item would show "high" — a constant signal carries no information.

## Visual vocabulary

Pick the lightest form that carries the meaning.

| Form | Best for | Notes |
|---|---|---|
| **Bands** (High / Medium / Low) | Most consumer and business UI | Default choice. Avoids false precision. Each band has a defined behavior. |
| **Inline flag on the uncertain part** | Plans, extractions, forms | "Check this" on the one field, not a score on the whole thing |
| **Alternatives (n-best)** | Classification, interpretation, search | "I read this as *Tuesday the 7th*; could also be *the 30th*" |
| **Range / interval** | Numeric estimates, forecasts | "$4,200–$4,900" beats "$4,550 (78%)" |
| **Scope declaration** | Agent boundaries | "I handle travel bookings only" — prevents out-of-scope requests |
| **Percentage** | Expert audiences who understand calibration | Round it; never show 99.73% |

Each band must **change behavior**, not just color:

| Band | Default behavior |
|---|---|
| High | Proceed per autonomy level; show signal quietly or not at all |
| Medium | Highlight the uncertain part; preview even at level 4 for T2+ |
| Low | Don't act; escalate with options or a clarifying question |

## Writing rules

- Say *what* is uncertain and *why*: "I'm unsure which account — you have two named 'Ops'."
- Point to the action that resolves it: "Pick one", "Confirm the date".
- Don't make normal uncertainty alarming. Medium confidence is orange text, not a red siren.
- Never imply certainty you don't have through tone. Fluent prose reads as confident; add the flag in the prose itself where needed.

## Interactions with other patterns

- **Escalation Gates** — low confidence is the most common gate trigger. A signal with no gate behind it is decoration.
- **Autonomy Dial** — low confidence downgrades a level-4 action to confirm-first for that instance.
- **Intent Preview** — flags sit on the uncertain step.
- **Explainable Rationale** — the "why" behind the confidence: missing data, conflicting sources, unfamiliar task.
- **Action Audit** — log the confidence at the time of action, so post-incident review can see whether the agent knew it was unsure.

## Anti-patterns

| Scenario | Why it fails | Instead |
|---|---|---|
| Uncalibrated score shown as fact | Users anchor on it; a confident wrong answer damages trust more than an uncertain one | Calibrate first, or show reasons not numbers |
| False precision (87.3%) | Implies measurement that doesn't exist | Bands or rounded values |
| One score for a whole multi-step plan | Hides which step is weak | Per-step or per-field flags |
| Signal with no behavior change | Users learn to ignore it | Each band maps to an action |
| Hiding uncertainty to look capable | Automation bias; users accept hallucinations | Surface it where decisions happen |
| Color-only badges | Fails for color-blind users and screen readers | Text label + icon + color |
| Red alarm for normal medium confidence | Trains users to fear the agent or ignore the alarm | Proportional styling |

## Accessibility

- Every signal has a text label ("Low confidence: date unclear"), not color or icon alone.
- Meet contrast requirements on badge text and icons.
- Expose bands as text to assistive tech; a percentage alone is not enough context.
- Inline flags on fields are programmatically associated with the field.

## Metrics (representative)

From Yocco, Smashing 2026:
- **Calibration score** — correlation between model confidence and user acceptance. Target above 0.8.
- **Scrutiny delta** — review time on low-confidence vs high-confidence items. Should be positive.

Add, and treat as the primary engineering check: **reliability by band** — actual correctness rate for items shown High, Medium, Low. If Medium and High have similar accuracy, the bands are meaningless.

## Output: Design mode

```md
# Confidence Signals spec — <feature>

## Signal source (engineering)
- Method: <…>
- Calibration status: <checked on what data, result>
- Granularity: <plan / step / field>

## Where it appears
| Surface | Form | Audience |

## Bands and behavior
| Band | Threshold (per action type) | UI treatment | Behavior |

## Copy patterns (filled examples)
## Scope declaration
## Accessibility
## Metrics and calibration review cadence
## Open questions
```

## Output: Audit mode

```md
# Confidence Signals audit — <product>

| ID | Severity | Surface | Finding | Evidence | Fix |
```

Severity: **Blocker** = agent executes T3 actions while the system knows confidence is low, with no signal or gate. **Major** = uncalibrated scores presented as fact; signals with no behavior change; one score hiding weak steps. **Minor** = false precision, styling, copy, accessibility.

## Sources

- Yocco, Smashing Magazine (Feb 2026) — confidence score, scope declaration, visual cues, calibration and scrutiny-delta metrics; escalation frequency 5–15%. https://www.smashingmagazine.com/2026/02/designing-agentic-ai-practical-ux-patterns/
- Agentic Design, Confidence Visualization UI Patterns — bands, ranges, n-best, do's and don'ts, calibration with historical accuracy. https://agentic-design.ai/patterns/ui-ux-patterns/confidence-visualization-patterns
- Eleken (2026) — "the confident wrong answer" failure mode; escalation 5–15%. https://www.eleken.co/blog-posts/agentic-ux-examples
- Lee, J. & See, K. (2004). Trust in automation: designing for appropriate reliance. *Human Factors* 46(1). https://journals.sagepub.com/doi/10.1518/hfes.46.1.50.30392
