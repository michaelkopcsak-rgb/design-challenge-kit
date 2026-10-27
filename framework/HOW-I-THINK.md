# How I think about design problems

> Draft for Michael to edit in his own words. Claude uses it to structure every step and the readout.

It always starts with the user: who they are, and what they need, want, and are trying to get done. Everything after that traces back to them, and the traceability table at the end proves it.

## Seven stages

| Stage | The question | What I produce | Skill | Time in a 4h challenge |
|---|---|---|---|---|
| **1. Frame** | What problem is worth solving here, and for whom? | The prompt reframed as a problem statement that passes the six checks | `design-challenge-framer` | 15 min |
| **2. Users & jobs** | Who is the user, and what are their needs, wants, objectives and jobs to be done? | 1–2 proto-personas, each with 3 jobs to be done. Marked as assumptions until researched | `persona-designer` (proto mode), `jtbd-writer` | 15 min |
| **3. Principles & bets** | What will this design stand for, and what do I believe will work? | 3–5 principles, each stating what it gives up; 3–5 bets. For agentic work: action inventory and risk tiers | `pdes-design-principles`, `/agentic-pack` | 20 min (+45 if agentic) |
| **4. Make** | What's the smallest thing that makes the bets tangible? | Prototype; each UI decision cites a principle or job | `/prototype` | 75 min |
| **5. Evaluate** | Is it cogent, usable, and does it resonate? | Inspection against principles and jobs; usability test plan | `/evaluate`, `pdes-usability-test-plan` | 15 min |
| **6. Measure** | How would we know it's working once it ships? | 2–3 HEART dimensions plus agentic trust metrics | `pdes-heart-metrics-plan` | 10 min |
| **7. Tell** | What does the team need to align on? | Readout built around the traceability table | `/readout` | 30 min |

## The traceability table

The one artifact that shows how I think. Every row connects a user's job to how I'd know it was served:

| Job to be done | Principle | Design decision | Test task | Metric |
|---|---|---|---|---|

A design decision that traces to no job or principle gets questioned. A job with no decision behind it is a gap I name in the readout.

## Principles I bring to every problem

1. **Start with the user.** Needs, wants, objectives and jobs come before screens.
2. **Reframe before solving.** The prompt is a starting point, not a spec.
3. **Principles are stands, not platitudes.** Each says what it gives up, and becomes a criterion for judging the work.
4. **Design the system, not just the screen.** States, failures, recovery and data matter as much as layout.
5. **Earned trust (agentic).** Autonomy is granted by the user, not taken by the system. Start low, let evidence raise it, and never ship autonomy without a credible undo.
6. **Measure outcomes, not output.** Success is a change for users, counted the same way before and after.
7. **Artifacts serve alignment.** I make one only if a partner (PM, engineering, research) needs it to decide or build.
