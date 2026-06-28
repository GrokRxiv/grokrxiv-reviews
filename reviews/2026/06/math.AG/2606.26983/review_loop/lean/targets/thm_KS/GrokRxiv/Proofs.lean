import GrokRxiv.Paper.Notation
import GrokRxiv.Paper.Definitions
import GrokRxiv.Paper.Interfaces
import GrokRxiv.Paper.Statements
import GrokRxiv.Paper.Lemmas
open GrokRxiv.Paper

/-!
GrokRxiv theorem target workspace.

claim_id: thm_KS
obligation_id: theorem_inventory::thm_KS
seed_reason: inventory_packet_created

Source statement:
\begin{theorem}\cite[Proposition~1]{KS25}\label{thm_KS}
Let $S$ be a smooth, projective surface over $\mathbb{C}$ such that $\Pic(S) = \Z[H]$, where $|H|$ is basepoint-free, and members of $|H|$ have at worst nodes in codimension
1 on $|H|$. Let $p \colon J(S, H) \to |H|$ be the universal compactified Jacobian,
$L \subset |H|$ a general line, $J_L := p^{-1}
(L)$, and $g$ the genus of the curves in $|H|$. Let $Z \subset J_L$ be a section whose cohomology class is contained in the image of
the restriction map 
$$H^{2g}(J(S, H), \Z) \to H^{2g}(J_L, \Z).$$
Then $Z$ is the zero section.
\end{theorem}

This file is the target proof file for exactly one selected theorem or claim. The paper-local library must compile before this target is authored. The proof author must replace this comment with a source-faithful Lean statement/proof that imports and reuses GrokRxiv.Paper declarations rather than redefining paper-local objects here.
-/
