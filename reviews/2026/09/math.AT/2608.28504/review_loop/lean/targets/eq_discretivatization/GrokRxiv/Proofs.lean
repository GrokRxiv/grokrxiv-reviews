import GrokRxiv.Paper.Notation
import GrokRxiv.Paper.Definitions
import GrokRxiv.Paper.Interfaces
import GrokRxiv.Paper.Statements
import GrokRxiv.Paper.Lemmas
open GrokRxiv.Paper

/-!
GrokRxiv theorem target workspace.

claim_id: eq:discretivatization
obligation_id: theorem_inventory::eq:discretivatization
seed_reason: inventory_packet_created

Source statement:
\begin{prop}\label{prop:comparing-Aut}
    The maps
    \begin{equation}\label{eq:discretivatization}
        \Aut(\ul\Vect^\oplus)\to\hom(\ul\Vect^\amalg_\delta,\ul\Vect^\oplus)\gets
        \Aut(\ul\Vect^\amalg_\delta)
    \end{equation}
    induced by $|{\cdot}|$ are monomorphisms, and they have the same image.
    \begin{proof}
        View both $\ul\Vect^\oplus$ and $\ul\Vect^\amalg_\delta$ as functors $\text{Fin}_*\to\mathbb\Spc_{\Glo}$ satisfying the Segal condition. Throughout the proof, we will make use of the usual formula \cite{GHN17}*{Proposition~5.1} for mapping spaces in a functor category as the end
        \begin{multline*}
            \hom(F,G)\simeq\int_{\langle r\rangle\in\text{Fin}_*}\hom(F(\langle r\rangle),G(\langle r\rangle))\\{}\coloneqq
            \lim\big({\Tw(\text{Fin}_*)\xrightarrow{\;\ev\;} \text{Fin}_*\!\!\!{}^\op\times\text{Fin}_*\xrightarrow{\hom(F(-),G(-))\;}\Spc}\big),
        \end{multline*}
        where $\Tw$ denotes the twisted arrow category.

        Consider the subfunctor $F_\oplus\colon\Tw(\text{Fin}_*)\to\Spc$ of $\hom(\ul\Vect^\oplus(-),\ul\Vect^\oplus(-))$ given at $\alpha\colon\langle r\rangle \to\langle s\rangle$ by the component of $\ul\Vect^\oplus(\alpha)\colon\ul\Vect^\oplus(\langle r\rangle)\to\ul\Vect^\oplus(\langle s\rangle)$. Then the map $\lim F_\oplus\to\lim\hom\big(\Vect^\oplus(-),\Vect^\oplus(-)\big)\simeq\End(\ul\Vect^\oplus)$ induced by the inclusion is a monomorphism (as a limit of monomorphisms), and its image consists precisely of those natural transformations whose underlying functor is the identity. By Proposition~\ref{prop:Aut-h-Vect}, this image agrees with $\Aut(\ul\Vect^\oplus)$. In the same way, Proposition~\ref{prop:Aut-Vect-delta} identifies $\Aut(\ul\Vect^\amalg_\delta)$ with the limit of the analogously defined subfunctor $F_\delta\subset\hom(\ul\Vect^\amalg_\delta(-),\ul\Vect^\amalg_\delta(-))$, reducing us to proving that the maps
        \[
            \lim_{\alpha\colon\langle r\rangle\to\langle s\rangle}\hskip0pt minus 15ptF_\oplus(\alpha)\to
            \lim_{\alpha\colon\langle r\rangle\to\langle s\rangle}\hskip0pt minus 15pt\hom(\ul\Vect^\amalg_\delta(\langle r\rangle),\ul\Vect^\oplus(\langle s\rangle))\gets
            \lim_{\alpha\colon\langle r\rangle\to\langle s\rangle}\hskip0pt minus 15pt F_\delta(\alpha)
        \]
        induced by $|{\cdot}|$ are monomorphisms with the same image. Using once more that limits preserve monomorphisms, it will then suffice to show that for each $\alpha$ the maps
        \begin{equation}\label{eq:monos-without-ends}
            F_\oplus(\alpha)\to
            \hom\big(\ul\Vect^\amalg_\delta(\langle r\rangle),
            \ul\Vect^\oplus(\langle s\rangle)\big)\gets
            F_\delta(\alpha)
        \end{equation}
        are monomorphisms with the same image. 

        By construction, the image of the first map is the component of $\ul\Vect^\oplus(\alpha)\circ|{\cdot}|$, while the image of the second one is the component of $|{\cdot}|\circ\ul\Vect^\amalg_\delta(\alpha)$, and these maps are indeed homotopic. To prove that the maps $(\ref{eq:monos-without-ends})$ are monomorphisms, we first note that the Segal conditions for $\ul\Vect^\amalg_\delta$ and $\ul\Vect^\oplus$ imply that we have equivalences
        \begin{align*}
            F_\oplus(\alpha)&\iso\prod_{i=1}^s F_\oplus(\chi_i\circ\alpha)\\
            F_\delta(\alpha)&\iso\prod_{i=1}^s F_\delta(\chi_i\circ\alpha)\\
            \hom\big(\ul\Vect^\amalg_\delta(\langle r\rangle), \ul\Vect^\amalg_\delta(\langle s\rangle)\big)&\iso
            \prod_{i=1}^s\hom\big(\ul\Vect^\amalg_\delta(\langle r\rangle), \ul\Vect^\amalg_\delta(\langle 1\rangle)\big)
        \end{align*}
        induced by the maps $\chi_i\colon\langle s\rangle\to\langle1\rangle$ with $\chi_i^{-1}(1)=\{i\}$. As monomorphisms are closed under products, we may therefore assume that $s=1$. Using moreover that the class of all $\alpha\colon\langle r\rangle\to\langle1\rangle$ for which the above maps are monomorphisms is closed under equivalences in $\Tw(\text{Fin}_*)$, we may then further assume for (notational) simplicity that $\alpha$ is order preserving. We set $a\coloneqq\min(\alpha^{-1}(1)\cup\{r+1\})$.
        
        Now it is time to plug in the definitions. We may identify $\ul\Vect^\oplus(\alpha)$ with the map $\coprod_{m_1,\dots,m_r}\BGcat{\O(m_1|\cdots|m_r)}\to\coprod_{n}\BGcat{\O(n)}$ given on the summand $(m_1,\dots,m_r)$ by the composite 
        \[
            \BGcat{\O(m_1|\cdots|m_r)}\xrightarrow{\;\pr\;}
            \BGcat{\O(m_a|\cdots|m_r)}\lhook\joinrel\longrightarrow
            \BGcat{\O(m_a+\cdots+m_r)}.
        \]
        Writing $\hom^*\big(\BGcat{\O(m_1|\dots|m_r)},\BGcat{\O(m_a+\cdots+m_r)}\big)$ for the component of this map, we therefore have
        \[
            F_\oplus(\alpha)\simeq\prod_{m_1,\dots,m_r}\hom^*\big(\BGcat{\O(m_1|\dots|m_r)},\BGcat{\O(m_a+\cdots+m_r)}\big).
        \]
        Analogously, $F_\delta(\alpha)\simeq\prod_{m_1,\dots,m_r}\hom^*\big(\BGcat{\Sig(m_1|\cdots|m_r)},\BGcat{\Sig(m_a+\cdots+m_r)}\big)$, while we may identify the relevant path component of $\hom\big(\ul\Vect^\amalg_\delta(\langle r\rangle),\ul\Vect^\oplus(\langle 1\rangle)\big)$ with $\prod_{m_1,\dots,m_r}\hom^*\big(\BGcat{\Sig(m_1|\cdots|m_r)},\BGcat{\O(m_a+\cdots+m_r)}\big)$, where $\hom^*$ in each case denotes the component of the composite of the projection to $\BGcat{\Sig(m_a|\cdots|m_r)}$ followed by the evident embedding. In this description, the maps from $(\ref{eq:monos-without-ends})$ are given by postcomposition with the usual embedding $\BGcat{\Sig(m_a+\cdots+m_r)}\to\BGcat{\O(m_a+\cdots+m_r)}$ and precomposition with $\BGcat{\Sig(m_1|\cdots|m_r)}\to\BGcat{\O(m_1|\cdots|m_r)}$, respectively. Plugging in the explicit description of mapping spaces in $\Glo$, we have therefore altogether reduced to showing that the maps
        \begin{align*}
            B\big(C_{\Sig(m_a+\cdots+m_r)}\Sig(m_a|\cdots|m_r)\big)&\to
            B\big(C_{\O(m_a+\cdots+m_r)}\Sig(m_a|\cdots|m_r)\big)\\
            B\big(C_{\O(m_a+\cdots+m_r)}\O(m_a|\cdots|m_r)\big)&\to
            B\big(C_{\O(m_a+\cdots+m_r)}\Sig(m_a|\cdots|m_r)\big)
        \end{align*}
        of classifying spaces of centralizers induced by pre- and postcomposition are equivalences. This is precisely the content of Corollary~\ref{cor:so-many-centralizers}.
    \end{proof}
\end{prop}

This file is the target proof file for exactly one selected theorem or claim. The paper-local library must compile before this target is authored. The proof author must replace this comment with a source-faithful Lean statement/proof that imports and reuses GrokRxiv.Paper declarations rather than redefining paper-local objects here.
-/
