import GrokRxiv.Paper.Notation
import GrokRxiv.Paper.Definitions
import GrokRxiv.Paper.Interfaces
import GrokRxiv.Paper.Statements
import GrokRxiv.Paper.Lemmas
open GrokRxiv.Paper

/-!
GrokRxiv theorem target workspace.

claim_id: thm:MN
obligation_id: theorem_inventory::thm:MN
seed_reason: inventory_packet_created

Source statement:
\begin{thm}
\label{thm:MN}
Let $n \ge 3$ be an integer such that $n = bq$, with $b \ge 2$, and assume that $n \equiv q \pmod{2}$.
Fix $x = \sigman \in S_{n}$. Then

\begin{align}
\f{N(b, q, n)}{T(b, q)} \ge \f{2}{n+2}.
\end{align}
In particular, the inequality becomes an equality when $b = 2$.
\end{thm}

This file is the target proof file for exactly one selected theorem or claim. The paper-local library must compile before this target is authored. The proof author must replace this comment with a source-faithful Lean statement/proof that imports and reuses GrokRxiv.Paper declarations rather than redefining paper-local objects here.
-/
