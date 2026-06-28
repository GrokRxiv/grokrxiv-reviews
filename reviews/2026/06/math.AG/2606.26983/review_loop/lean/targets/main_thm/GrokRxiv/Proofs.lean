import GrokRxiv.Paper.Notation
import GrokRxiv.Paper.Definitions
import GrokRxiv.Paper.Interfaces
import GrokRxiv.Paper.Statements
import GrokRxiv.Paper.Lemmas
open GrokRxiv.Paper

/-!
GrokRxiv theorem target workspace.

claim_id: main_thm
obligation_id: theorem_inventory::main_thm
seed_reason: inventory_packet_created

Source statement:
\begin{theorem}\label{main_thm}
Let $C$ be a geometrically connected, smooth projective curve over a field $k$, and $A/C$
a smooth commutative group scheme with connected fibres, whose generic fibre $A_\eta$ is an abelian
variety. Let $Z_0$ be the zero section. Then the following holds.
\begin{enumerate}
\item The map \begin{equation}
\psi\colon \MW(A/C) \to  N_{1,\gen}(A)
\end{equation}
$$Z \mapsto [Z]-[Z_0]$$
is a group homomorphism.
\item Assume that $A_\eta$ has no abelian subvarieties defined over $k$, then $\ker \psi = \MW(A/C)_{\tors}$.
\end{enumerate}
\end{theorem}

This file is the target proof file for exactly one selected theorem or claim. The paper-local library must compile before this target is authored. The proof author must replace this comment with a source-faithful Lean statement/proof that imports and reuses GrokRxiv.Paper declarations rather than redefining paper-local objects here.
-/
