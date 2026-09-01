import GrokRxiv.Paper.Notation
import GrokRxiv.Paper.Definitions
import GrokRxiv.Paper.Interfaces
import GrokRxiv.Paper.Statements
import GrokRxiv.Paper.Lemmas
open GrokRxiv.Paper

/-!
GrokRxiv theorem target workspace.

claim_id: arxiv_v1_tex:lemma:206513
obligation_id: theorem_inventory::arxiv_v1_tex:lemma:206513
seed_reason: inventory_packet_created

Source statement:
\begin{lemma}
    Let $\alpha\colon G\to G'$ be any homomorphism of compact Lie groups. Then $\alpha^*\colon\cat{$\bm{G'}$-$\cat{L}$-Top}\to\cat{$\bm G$-$\cat{L}$-Top}$ sends $G'$-global $\Ff$-weak equivalences to $G$-global $\Ff$-weak equivalences.
    \begin{proof}
        In light of Lemma~\ref{lemma:restr-right-Quillen}, it suffices to consider the case of $G'$-global $\Ff$-weak equivalences $f\colon X\to Y$ of \emph{closed} orthogonal $G'$-spaces. But indeed, if $H\in\Ff$ and $\Uu_H$ is any complete $H$-universe, then $\alpha^*f(\Uu_H)$ is a $\mathcal G_{H,G}$-weak equivalence by Example~\ref{ex:graph-restr-rQ}.
    \end{proof}
\end{lemma}

This file is the target proof file for exactly one selected theorem or claim. The paper-local library must compile before this target is authored. The proof author must replace this comment with a source-faithful Lean statement/proof that imports and reuses GrokRxiv.Paper declarations rather than redefining paper-local objects here.
-/
