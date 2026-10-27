# Agentic patterns → shadcn/ui components

Defaults Claude uses when building the prototype. Michael adjusts at the UI-decisions checkpoint in `/prototype`. Rule from `agentic-ux`: approval, undo and stop controls always live on stable components in fixed positions, never on generated surfaces.

| Pattern | Moment | Default build | Notes |
|---|---|---|---|
| Intent preview | Before a T2/T3 action | `Card` with an ordered step list, each step a plain-language line with its target; footer `Button`s: **Proceed** (primary), **Edit plan**, **Do it myself** | Edit opens steps inline as editable rows, not a new screen |
| Autonomy dial | Standing setting | `Sheet` or settings page with a `RadioGroup` per action type (Observe · Propose · Confirm · Autonomous), bound inputs (`Input` + unit) beside "Autonomous" | Per action type, never one global switch. Disabled levels show why in a `Tooltip` |
| Autonomy demo toggle | Prototype only | `ToggleGroup` in the header: **Human in the loop** / **Autonomous** | Drives the scenarios side by side |
| Explainable rationale | On preview, receipt, escalation | Muted "Because…" line under the item; `Collapsible` "See evidence" listing sources | Same sentence in all three places |
| Confidence signals | Where output quality varies | `Badge` with text label (High / Medium / Low) + one-line reason; low confidence also shows the gate | Never a bare percentage; never color only |
| Action audit | After actions | `Sheet` from the right: activity timeline, each entry a receipt (what, when, why, status, Undo) | Receipt links to rationale and confidence at the time |
| Undo | Right after a reversible action | `Sonner` toast with **Undo** and countdown, plus the same Undo on the receipt | Irreversible actions show the compensation path instead |
| Stop / pause | Long-running work | Fixed `Button` (variant outline) in the run header: **Pause** / **Stop**; `AlertDialog` explains what stop does to in-flight steps | Always visible while running |
| Escalation: sync | T3, high risk | `AlertDialog` led by "Why I stopped", options as buttons with consequences, recommended one labeled | Focus moves to the question |
| Escalation: async | T2, medium risk | Approval queue: `Card` list or `Table` with SLA and deadline; `Badge` count in nav | Agent keeps working on other tasks |
| Clarify / choose | Ambiguity, several valid paths | Inline `Card` in the conversation with option chips (`Button` variant secondary) + "Something else…" | One question at a time |
| Generative UI | Task-shaped views | Agent-composed `Table`, `Card` grids, `Tabs` for comparisons, charts | Stable shell around it; generated area clearly bounded |
| Thinking / working | During agent work | `Skeleton` + step progress list (done · current · pending) | Shows what's done, not a spinner |
| Handoff to human | Escalated to a person | `Card` summary: request, what's done, why it stopped, who has it, expected response time | User never repeats themselves |
