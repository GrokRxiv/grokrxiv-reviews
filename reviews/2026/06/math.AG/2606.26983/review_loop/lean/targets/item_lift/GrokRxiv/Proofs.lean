import GrokRxiv.Paper.Notation
import GrokRxiv.Paper.Definitions
import GrokRxiv.Paper.Interfaces
import GrokRxiv.Paper.Statements
import GrokRxiv.Paper.Lemmas
open GrokRxiv.Paper

/-!
GrokRxiv theorem target workspace.

claim_id: item_lift
obligation_id: theorem_inventory::item_lift
seed_reason: inventory_packet_created

Source statement:
\begin{proposition}\label{prop_main}
Let $C$ be a smooth projective curve over $k$ and $A/C$ a smooth commutative group scheme with connected fibres. Assume that the generic fibre $A_\eta$ is an abelian variety. Then
\begin{enumerate}
    \item\label{item_lift} the restriction $$\Pic(A)_{\rig} \to \Pic(A_\eta)$$ is a group isomorphism.
\item\label{item_sum} For any $\L\in \Pic(A)_{\rig}$ the following holds:
$$\L_\eta\in \Pic^\circ(A_\eta) \iff [-1]^*\L \cong \L^\vee \text{(i.e.\ $\L$ is odd)}.$$
\item\label{item_square} Let $\L\in \Pic(A)$ be a line bundle such that $\L_\eta\in \Pic^\circ(A_\eta)$, and let $Z_1$ and $Z_2$ be two sections of $A/C$, and $Z_3:=Z_1\oplus Z_2$ in $\MW(A/C)$ with corresponding translation morphisms $\tau_i\colon A\to A$, for $i=1,2,3$.
Then
$$\tau_1^*\L \otimes \tau_2^*\L \cong \tau_3^*\L \otimes \L$$
in $\Pic(A)$.
\end{enumerate}
\end{proposition}

This file is the target proof file for exactly one selected theorem or claim. The paper-local library must compile before this target is authored. The proof author must replace this comment with a source-faithful Lean statement/proof that imports and reuses GrokRxiv.Paper declarations rather than redefining paper-local objects here.
-/
