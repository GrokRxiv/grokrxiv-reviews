import GrokRxiv.Paper.Notation
import GrokRxiv.Paper.Definitions
import GrokRxiv.Paper.Interfaces
import GrokRxiv.Paper.Statements
import GrokRxiv.Paper.Lemmas
open GrokRxiv.Paper

/-!
GrokRxiv theorem target workspace.

claim_id: lemma:quotient-map-is-fib
obligation_id: theorem_inventory::lemma:quotient-map-is-fib
seed_reason: inventory_packet_created

Source statement:
\begin{lemma}[See \cite{koerschgen}*{Theorem~A.9}]\label{lemma:quotient-map-is-fib}
    Let $X$ be a Hausdorff space with a free action of a compact Lie group $G$. Then the quotient map $X\to X/G$ is a (non-equivariant) Serre fibration.\qed
\end{lemma}

This file is the target proof file for exactly one selected theorem or claim. The paper-local library must compile before this target is authored. The proof author must replace this comment with a source-faithful Lean statement/proof that imports and reuses GrokRxiv.Paper declarations rather than redefining paper-local objects here.
-/
