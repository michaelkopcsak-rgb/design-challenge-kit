---
name: agentic-ux-generative-ui
description: Design or audit Generative and Adaptive Interfaces, where an AI agent assembles a temporary UI (tables, comparisons, forms, charts, summaries, multi-step widgets) tailored to the task instead of answering only in chat or sending users to fixed pages. Use when deciding chat versus structured views, defining the component grammar an agent may compose from, specifying agent-rendered widgets, or reviewing an agent UI that is chat-only or that reshuffles its layout unpredictably.
---

# Generative / Adaptive Interfaces

**What it is:** the agent chooses *how to present* a result — a comparison table for options, a form for an action with several inputs, a timeline for history, a chart for a trend — and assembles it at response time from a governed set of components.

**What it is not:** freehand UI invented by a model, a reshuffling of the product's navigation, or a chat transcript with markdown tables.

Two related ideas, kept distinct:
- **Generative UI** — the agent materializes a new, often temporary, surface for this task.
- **Adaptive UI** — the product adjusts an *existing* interface to context.

Both follow one rule: **adapt the content, not the structure.** Keep the frame, navigation and controls stable; let what's inside be intelligent.

## Mode

- **Design** → spec template at the end.
- **Audit** → findings template at the end.

## Shared risk scale

T0 read-only · T1 private & reversible · T2 visible to others or effortful to reverse · T3 irreversible, financial, external, or permission-changing.

## Choosing the surface

Chat-first doesn't mean chat-only. Match the surface to the task:

| The user needs to… | Surface |
|---|---|
| Express open-ended or ambiguous intent | Conversation |
| Make a simple choice | Buttons / chips |
| Compare options on shared attributes | Comparison table or cards |
| Provide several specific inputs | Generated form, prefilled |
| Review structured output and judge it | Structured review view, with inline feedback |
| See change over time | Chart or timeline |
| Track multi-step work | Taskboard / progress view |
| Understand location or relationships | Map or diagram |

The test: *what serves the user best in this moment?* — not "conversational or traditional?"

## The component grammar

Generated UI is only as good as what it's allowed to be built from. Define the grammar before letting an agent compose:

1. **A closed catalog.** The agent composes only from approved design-system components, exposed in machine-readable form (a component registry, metadata with usage rules and anti-patterns). No raw HTML, no invented components, no arbitrary styles.
2. **Semantic tokens only.** Generated views inherit theming, dark mode and density automatically.
3. **Layout templates.** A small set of approved layouts per surface (sidebar panel, inline card, full canvas) with slot rules.
4. **Content limits.** Max rows before pagination, max options before grouping, max chart series.
5. **Interaction rules.** Which components may post actions back to the agent, and what those actions are allowed to do.
6. **A fallback.** If generation fails or the content doesn't fit a template, fall back to well-structured text — never a broken widget.

If the design system isn't machine-readable yet, that's the prerequisite. Generated UI without a grammar is how a product's visual language erodes.

## Stability rules (where users keep their bearings)

- **Controls never move.** Approve, Edit, Undo, Stop and the autonomy indicator sit in fixed positions on stable components. They are **never generated**.
- **The approval surface is not generated.** For T2+ actions, the content of a preview can be a generated view; the consent controls and the irreversibility markers are fixed.
- **Same task, same shape.** The same kind of request should produce the same kind of view. Variation in form costs learning; spend it only when the content truly differs.
- **Navigation is not personalized away.** Don't reorder menus or hide features based on inferred behavior. Suggest; don't rearrange.

## Lifecycle of a generated view

| Stage | Rule |
|---|---|
| Generate | Show a skeleton in the final layout; stream content in |
| Interact | User actions on the view post back to the agent as structured input, logged like any action |
| Refresh | If underlying data changes, mark the view stale; offer refresh rather than silently rerendering |
| Persist | Let users pin or save a useful view (it becomes a durable object with a name) or let it expire with the conversation — say which |
| Share | A shared view shows when it was generated and from what data |

## Security and trust

- Render agent-generated UI in a sandbox; it must not read or act on the host page.
- Agent-rendered views must be visually distinguishable from the product's own UI where it matters (e.g. a generated form asking for payment details looks like the product's own trusted surface only if it *is* one).
- Never let generated UI collect credentials or payment data unless it's a vetted, stable component.
- Content that originated from external sources (web, email) is labeled as such inside the view.

(Implementation context: protocols such as MCP Apps and Google's A2UI were moving agent-rendered UI into production in 2026, per Agentic Design's catalog. Check current specs before committing to one.)

## Interactions with other patterns

- **Intent Preview** — a plan with complex content (several options, a diff) can render as a generated view; the three decision buttons stay stable.
- **Explainable Rationale** — each generated view states what it's built from ("Based on Q3 bookings, 1,204 rows").
- **Confidence Signals** — flags appear on the specific cells or fields that are uncertain.
- **Action Audit** — actions taken through a generated view produce normal receipts; the view itself is referenced in the log.
- **Escalation Gates** — "choose" escalations often render best as a comparison view.

## Anti-patterns

| Scenario | Why it fails | Instead |
|---|---|---|
| Everything in a chat thread | Users reconstruct structure from a wall of text; review is error-prone | Structured views for structured tasks |
| Model writes arbitrary HTML/CSS | Off-brand, inaccessible, insecure, unpredictable | Compose from a closed component catalog |
| Approval buttons inside a generated widget | Position and wording vary; consent becomes unreliable | Stable, fixed decision controls |
| Layout reshuffles per user | Breaks familiarity; users can't find things | Adapt content, keep structure |
| Silent rerender when data changes | User loses their place; trust in the numbers drops | Mark stale, offer refresh |
| Generated view with no fallback | Broken widget on failure | Fall back to structured text |
| Hardcoded colors in generated output | Breaks dark mode and theming | Semantic tokens only |

## Accessibility

Generated UI must meet the same standard as hand-built UI — and it's easier to fail because nobody reviewed the specific instance.
- Every generated component comes from a catalog component that already passes WCAG 2.2 AA; the grammar enforces headings, labels and landmarks.
- Announce when a generated view appears and move focus to its heading if it replaces the user's current task.
- Tables have header cells; charts have a text summary and a data table alternative.
- Respect reduced-motion settings for streaming and transitions.
- Run automated accessibility checks on generated output in testing, sampled across many prompts.

## Metrics

- **Surface fit** — for a sample of tasks, did the chosen surface match what users needed? (Review panel or usability testing.)
- **Fallback rate** — generations that fell back to text. High = grammar too narrow or generation unreliable.
- **Grammar violations** — generated output that used non-catalog components or raw values (should be zero; enforce in CI).
- **Pin rate** — how often users save a generated view; high pin rates signal a missing permanent feature.
- **Task time and error rate** vs the chat-only baseline for the same tasks.

## Output: Design mode

```md
# Generative UI spec — <feature>

## Surface decisions
| Task / moment | Surface | Why |

## Component grammar
- Catalog source: <registry / design system package>
- Allowed components: <…>
- Layout templates: <…>
- Content limits: <…>
- Actions components may post: <…>
- Fallback: <…>

## Stable (never generated) elements
## View lifecycle: stale / pin / share rules
## Security: sandboxing, trusted-surface rules
## Accessibility requirements and test plan
## Metrics
## Open questions
```

## Output: Audit mode

```md
# Generative UI audit — <product>

| ID | Severity | Surface | Finding | Evidence | Fix |
```

Severity: **Blocker** = consent or undo controls generated or relocated per response; generated UI can collect credentials or act outside its sandbox. **Major** = chat-only for structured review tasks; arbitrary markup outside the design system; layout reshuffles across sessions; no fallback. **Minor** = consistency, stale handling, pinning, accessibility gaps in specific views.

## Sources

- Eleken (2026) — adaptive interface pattern; Siena test automation (chat in, structured review out); "adapt the content, not the structure". https://www.eleken.co/blog-posts/agentic-ux-examples
- UX.raspberry, Medium (Feb 2026) — generative UI as component grammars; temporary artefacts instead of permanent pages. https://medium.com/@uxraspberry/the-agentic-interface-principles-and-patterns-for-autonomous-user-experiences-b0c1ecb8544f
- Agentic Design — Generative UI (agent-rendered interfaces) and Adaptive Interface Patterns; MCP Apps and A2UI context. https://agentic-design.ai/patterns/ui-ux-patterns/generative-ui
- HatchWorks (Mar 2026) — infinite chat transcript failure; taskboard as primary workspace. https://hatchworks.com/blog/ai-agents/agent-ux-patterns/
- Vercel — grounding generation in predictable design-system primitives. https://vercel.com/blog/ai-powered-prototyping-with-design-systems
