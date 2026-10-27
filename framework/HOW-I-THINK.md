# How I think about design problems

> Draft for Michael to edit in his own words. Claude uses it to structure every step and the readout.

Six stages. In a timeboxed challenge they run fast and overlap, but I never skip **Frame** and I always end with **Tell**.

| Stage | The question | What I produce | Time in a 4h challenge |
|---|---|---|---|
| **1. Frame** | What problem is actually worth solving here, and for whom? | The prompt reframed, primary user, job to be done, what's out of scope | 20 min |
| **2. Understand** | What do I know, what am I assuming, and which assumption could sink this? | Research highlights, riskiest assumption | 15 min |
| **3. Bet** | What do I believe will work, and how would we know? | 3–5 bets with success signals. For agentic work: the action inventory and risk tiers | 20 min |
| **4. Make** | What's the smallest thing that makes the bet tangible? | Prototype, plus the system artifacts the bet needs | 2 h |
| **5. Test** | Where is it weak? | Self-critique, iterations, how I'd test with users and what I'd measure | 20 min |
| **6. Tell** | What does the team need to align on? | The readout: story, decisions, open questions for PM and engineering | 30 min |

## Principles I bring to every problem

1. **Reframe before solving.** The prompt is a starting point, not a spec.
2. **Design the system, not just the screen.** States, failures, recovery and data matter as much as layout.
3. **Make risk visible.** Name the riskiest assumption early and design to test it.
4. **Earned trust (agentic).** Autonomy is granted by the user, not taken by the system. Start low, let evidence raise it, and never ship autonomy without a credible undo.
5. **Artifacts serve alignment.** I make an artifact only if a partner (PM, engineering, research) needs it to decide or build.
6. **Show the decisions.** The readout shows what I chose, what I didn't, and why.
