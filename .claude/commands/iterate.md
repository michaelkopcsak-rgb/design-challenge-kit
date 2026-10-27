---
description: Step 4 — make one structured change to the prototype and log the decision
argument-hint: <what to change and why>
---

Step 4 of the design challenge workflow. Stage: **Test** in `framework/HOW-I-THINK.md`.

Change requested: $ARGUMENTS

1. **Restate** in one line: what changes, why (the user problem it fixes, or the feedback it answers), and what must stay the same. If the "why" is missing, ask for it in one short question. It goes into the readout.
2. **Check impact.** If the change touches an agentic pattern (preview, gate, undo, confidence, autonomy), check it against `output/artifacts/guardrails-spec.md`. Flag it if it breaks a guardrail or a joint, and update the spec if Michael confirms.
3. **Apply** the change with shadcn components and tokens.
4. **Verify** in the browser pane and take a before/after screenshot pair.
5. **Log** in `output/decision-log.md`: change · why · alternatives · stage = Test.

Keep changes small. If the request is really three changes, do them one at a time.
