import GrokRxiv.Paper.Notation
import GrokRxiv.Paper.Definitions
import GrokRxiv.Paper.Interfaces
import GrokRxiv.Paper.Statements
import GrokRxiv.Paper.Lemmas
open GrokRxiv.Paper

/-!
GrokRxiv theorem target workspace.

claim_id: lem:Nbqblower
obligation_id: theorem_inventory::lem:Nbqblower
seed_reason: inventory_packet_created

Source statement:
\begin{lemma}
\label{lem:Nbqblower}
Let $[n,b^{q},b^{q}]$ be a passport with $n=qb$, and suppose that it has genus at least~$1$.
Fix an $n$-cycle $x \in S_n$, and let $N(b,q,b)$
denote the set of permutations $y \in S_n$ of cycle type $(b^{q})$ such that $(xy)^{-1}$ also has cycle type $(b^{q})$.
Then
\begin{align}
\vt{N(b, q, b)} \ge \f{(n-q)!}{2^{q(b-2)}\left(\f{q+1}{2}\right)!\left(\f{q-1}{2}\right)!}\left(\f{b-1}{2b}\right)^{\f{q-1}{2}}.
\end{align}
\end{lemma}

This file is the target proof file for exactly one selected theorem or claim. The paper-local library must compile before this target is authored. The proof author must replace this comment with a source-faithful Lean statement/proof that imports and reuses GrokRxiv.Paper declarations rather than redefining paper-local objects here.
-/
