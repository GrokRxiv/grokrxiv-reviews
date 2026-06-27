## Introduction

Let $F$ be a field. The classifying spaces of the general linear groups
${\mathrm{GL}}_n(F)$ assemble to an $E_{\infty}$-algebra with
multiplication given by block sum
$${\mathbf{BGL}}(F)\simeq \bigsqcup_{n > 0} {\mathrm{BGL}}_n(F).$$ The
algebraic $K$-theory spectrum $K(F)$ is obtained from
${\mathbf{BGL}}(F)$ by group completion, relating the groups
$$K_n(F)\coloneq \pi_n({\mathbf{BGL}}(F)^{\mathrm{gc}}) \quad \text{for} \quad  n\geq 0$$
to the stable homology of general linear groups. Its relationship to the
unstable homology of general linear groups is mediated by the
$E_\infty$-homology groups
$\smash{H_{n,d}^{E_{\infty}}({\mathbf{BGL}}(F))}$, defined as the
homology groups of its derived indecomposables (see
[1.2](#sec:intro-einfty){reference-type="ref+label"
reference="sec:intro-einfty"}). Working rationally, we combine vanishing
results for these groups with Koszul duality to construct the following:

::: definition*
**Definition 1**. The *Goncharov Lie coalgebra* of the field $F$ is
given by
$$\mathscr{G}(F) \coloneq \bigoplus_{n\geq 1} \mathscr{G}_n(F) \qquad \text{with} \qquad \mathscr{G}_n(F) \coloneq H_{n,2n-1}^{E_{\infty}}({\mathbf{BGL}}(F)_{\mathds{Q}}).$$
:::

Here the cobracket is a map taking ${\mathscr{G}}_n(F)$ to
$\bigoplus_{n=n'+n''} {\mathscr{G}}_{n'}(F) \otimes {\mathscr{G}}_{n''}(F)$,
satisfying antisymmetry and co-Jacobi properties (without any additional
Koszul signs). This Lie coalgebra is the central object of our series of
papers.

### The Goncharov Lie coalgebra and mixed Tate motives

Before giving a more detailed introduction to the results that appear in
this paper, we outline the conjecture that informs them: through mixed
Tate motives, the Goncharov Lie coalgebra should be connected to
multiple polylogarithms and algebraic $K$-theory.

#### Multiple polylogarithms

Classically, *multiple polylogarithms* are multivalued functions
depending on integers $n_1,\dots,n_k \in {\mathds{N}}$ defined as
$$\begin{equation}
\label{FormulaPolylogarithm}
{\mathrm{Li}}_{n_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}, n_k}(a_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},a_k)= \sum_{0<m_1<m_2<\dots<m_k}\frac{a_1^{m_1} a_2^{m_2}\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}a_k^{m_k}}{m_1^{n_1}m_2^{n_2}\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}m_k^{n_k}}\,
\end{equation}$$ for complex arguments $|a_i|<1$ and then analytically
continued. These have been studied for centuries, see
[@HainClassical; @Zagier; @Gon01] and their references, for their
special values, functional equations, and applications in other parts of
mathematics. For example, Zagier's conjecture uses them to connect
special values of $L$-functions to algebraic $K$-theory, and the works
of Goncharov on this conjecture inform our papers
[@Cathelineau; @Gon95; @Dup20].

We give a polylogarithmic interpretation of the Goncharov Lie coalgebra
by constructing explicit elements
$$\mathrm{Li}^\mathscr{G}_{n_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}, n_k}(a_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},a_k) \in \mathscr{G}_n(F), \quad \text{for $n_i\in {\mathds{N}}$ so that $n_1+\dots+n_k=n$ and $a_i \in F$,}$$
proving that these generate ${\mathscr{G}}(F)$ as a
${\mathds{Q}}$-vector space and giving a complete set of relations
corresponding to a certain family of functional equations satisfied by
multivalued functions
[\[FormulaPolylogarithm\]](#FormulaPolylogarithm){reference-type="eqref"
reference="FormulaPolylogarithm"} (see
[1.7](#sec:functional equations){reference-type="ref+label"
reference="sec:functional equations"}). A precise statement appears in
[\[thm:polyl-presentation-additive\]](#thm:polyl-presentation-additive){reference-type="ref+label"
reference="thm:polyl-presentation-additive"}, which uses a more
convenient alternative generating set of *correlators* (see the
discussion following
[\[thm:polyl-presentation-cobracket\]](#thm:polyl-presentation-cobracket){reference-type="ref+label"
reference="thm:polyl-presentation-cobracket"}). For $n\leq 3$, we
identify in
[\[thm:polyl-identification\]](#thm:polyl-identification){reference-type="ref+label"
reference="thm:polyl-identification"} the spaces $\mathscr{G}_n(F)$ with
objects that have appeared previously in works of Bloch, Suslin, and
Goncharov and admit a similar polylogarithmic interpretation.

#### Mixed Tate motives over a number field {#sec:intro-mtm-number-field}

For a number field $F$, these two instances of multiple polylogarithms
can be related through the theory of *mixed Tate motives*, see
[@BD94; @Levine; @DG05; @Dup20]. The central object of this theory is a
category ${\mathrm{MTM}}_{\mathds{Q}}(F)$ of rational mixed Tate
motives, which the reader can informally think as follows: consider the
universal cohomology theory for varieties and take in its target
category those objects that are iterated extensions of simple pieces
obtained from the cohomology projective spaces. This is a Tannakian
tensor category and can be shown to be equivalent to the category
$\smash{{\mathrm{Comod}}^{\mathrm{fd}}_{{\mathscr{L}}^{\mathrm{MTM}}(F)}({\mathrm{GrMod}}_{\mathds{Q}})}$
of finite-dimensional graded comodules over a Lie coalgebra
${\mathscr{L}}^{\mathrm{MTM}}(F)$. Goncharov constructed a family of
elements [@Gon19 (10.20)]
$${\mathrm{Li}}^{\mathrm{MTM}}_{n_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},n_k}(a_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},a_k) \in {\mathscr{L}}^{\mathrm{MTM}}(F)$$
called *motivic multiple polylogarithms*. Their periods are closely
related to the functions
[\[FormulaPolylogarithm\]](#FormulaPolylogarithm){reference-type="eqref"
reference="FormulaPolylogarithm"}: for example, multiple polylogarithms
appear in the monodromy matrix comparing de Rham and Betti realisations
[@Ramakrishnan], and real-valued single-valued variants of multiple
polylogarithms appear when applying Goncharov's real period construction
(combine [@Gon19 Corollary 1.15] with §11.1.3 loc.cit.). In this paper
we show these can be obtained from the corresponding elements in
${\mathscr{G}}_n(F)$: in
[\[thm:motivic-realisation\]](#thm:motivic-realisation){reference-type="ref+label"
reference="thm:motivic-realisation"} we will construct a functor of
Tannakian categories
$$R^{\mathrm{MTM}} \colon {\mathrm{Comod}}^{\mathrm{fd}}_{\mathscr{G}(F)}({\mathrm{GrMod}}_{\mathds{Q}}) \longrightarrow{\mathrm{MTM}}_{\mathds{Q}}(F)$$
such that the induced morphism $r^{\mathrm{MTM}}$ of graded Lie
coalgebras satisfies
$$r^{\mathrm{MTM}}\left(\mathrm{Li}^\mathscr{G}_{n_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},n_k}(a_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},a_k)\right)={\mathrm{Li}}^{\mathrm{MTM}}_{n_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},n_k}(a_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},a_k).$$
In the sequel [@KRS2] we will prove that $R^{\mathrm{MTM}}$ is an
equivalence, which yields an isomorphism
${\mathscr{G}}(F) \cong {\mathscr{L}}^{\mathrm{MTM}}(F)$. This has many
concrete consequences: it implies all periods of mixed Tate motives over
the number field $F$ can be expressed as rational linear combinations of
periods of motivic multiple polylogarithms, implying the universality
conjecture of Goncharov [@Gon95 Conjecture 17a], cf. [@Bro12] for a
similar result for mixed Tate motives over the integers ${\mathds{Z}}$.

#### Mixed Tate motives over a general field {#sec:motives-general}

In view of this, we propose the category
$\smash{{\mathrm{Comod}}^{\mathrm{fd}}_{{\mathscr{G}}(F)}({\mathrm{GrMod}}_{\mathds{Q}})}$
of finite-dimensional graded comodules over $\mathscr{G}(F)$ as a
candidate for the abelian category of mixed Tate motives over a general
field $F$, whose existence was conjectured by Beilinson and Deligne
[@BD94] and is closely related to the Beilinson--Soulé vanishing
conjecture [@Levine]:

[]{#conjecture main motivic label="conjecture main motivic"} Let $F$ be
an arbitrary field. The category of finite-dimensional graded comodules
over the Goncharov Lie coalgebra $\mathscr{G}(F)$ is equivalent to the
conjectural category of mixed Tate motives over $F$.

::: remark*
*Remark 1*. There are other candidates for the Lie coalgebra of mixed
Tate motives (or, equivalently, for its universal coenveloping Hopf
algebra) [@Gon95b §1.16]. The first is the *Hopf algebra
$\mathcal{A}(F)$ of Aomoto polylogarithms*, which was constructed by
Beilinson, Goncharov, Shekhtman, and Varchenko in [@BGSV90]. The second,
in the special case $F={\mathds{C}}$, is the *scissors congruence Hopf
algebra* $\mathbb{S}_\bullet$ constructed by Goncharov in [@Gon99]. The
third is the *1-minimal model* ${\mathcal{M}}_{{\mathcal{N}}}$ due to
Bloch--Kritz [@BlochKriz]. We intend to investigate the relationship
between $\mathscr{G}(F)$ and these candidates in future work.
:::

This conjecture predicts a relationship between $\mathscr{G}(F)$ and the
algebraic $K$-groups of $F$ that can be stated---and possibly
(dis)proven---without referring to the (conjectural) motivic formalism.
To state it, we use the Adams eigenspaces
$\smash{K^{(r)}_i(F)_{\mathds{Q}} \subseteq K_i(F)_{\mathds{Q}}}$, given
by those elements on which the Adams operation $\psi^p$ acts by $p^r$
[@Weibel IV.5]; we refer to $r$ as *weight*. These agree with the
associated graded ${\mathrm{gr}}^r_\gamma\,K_i(F)_{\mathds{Q}}$ of the
$\gamma$-filtration [@Soule p. 500], the motivic cohomology group
$H^{2r-i,r}({\mathrm{Spec}}(F);{\mathds{Q}})$ [@MVW Lecture 19], and the
higher Chow group ${\mathrm{CH}}^r({\mathrm{Spec}}(F),i)_{\mathds{Q}}$
[@LevineBloch Theorem 3.1]. Beilinson gave a conjectural formula for the
algebraic $K$-theory groups in terms of Ext-groups in the category of
mixed Tate motives [@BD94]:
$$K^{(n)}_{2n-i}(F)_{{\mathds{Q}}} \cong {\mathrm{Ext}}^i_{{\mathrm{MTM}}_{\mathds{Q}}(F)}({\mathds{Q}}(-n),{\mathds{Q}}(0)).$$
The Tannakian formalism allows one to compute these Ext-groups in terms
of the Chevalley--Eilenberg complex of the corresponding Lie coalgebra.
We let $H^i(\mathscr{G}(F))_n$ denote the $i$th homology group of the
weight $n$ part of this complex, explicitly given by $$\begin{equation}
\label{eqn:polyl-ce}
0 \longrightarrow\mathscr{G}_n(F) \longrightarrow (\Lambda^2 \mathscr{G}(F))_n \longrightarrow \cdots \longrightarrow (\Lambda^{n-1} \mathscr{G}(F))_n \longrightarrow \Lambda^n F^{\times}_{\mathds{Q}}\longrightarrow 0.
\end{equation}$$ where by convention ${\mathscr{G}}_n(F)$ lies in degree
$i=1$, $\smash{\Lambda^n F^\times_{\mathds{Q}}}$ lies in degree $n$, and
the differential is induced by the cobracket.

[]{#conjecture main gamma label="conjecture main gamma"} Let $F$ be an
arbitrary field. For $1\leq i \leq n$, there is an isomorphism
$$K^{(n)}_{2n-i}(F)_{{\mathds{Q}}} \overset{\cong}\longrightarrow H^i(\mathscr{G}(F))_n.$$

If true then the right side provides a symbolic description for
rationalised algebraic $K$-theory of fields, generalising those for
Milnor $K$-theory due to Matsumoto and Milnor and for the Bloch group
due to Bloch and Suslin. In the sequel [@KRS2] we provide a candidate
for such an isomorphism that does not rely on the motivic formalism and
prove that it is an isomorphism for $F$ a number field. More precisely,
recall the rank conjecture says that the associated graded
${\mathrm{gr}}^{\mathrm{prim}}_r\,K_d(F)_{\mathds{Q}}$ of the primitive
rank filtration is isomorphic to $\smash{K_d^{(r)}(F)_{\mathds{Q}}}$
[@Cathelineau §2.3] [@Gon95b Conjecture 1.17] [@deJeu]. We will
construct maps
$${\mathrm{gr}}^{\mathrm{prim}}_n\,K_{2n-i}(F)_{\mathds{Q}} \longrightarrow H^i(\mathscr{G}(F))_n$$
and show these induce isomorphisms in cases where we understand the left
side well.

#### The Goncharov Lie coalgebra and algebraic $K$-theory in low weights

[\[conjecture main gamma\]](#conjecture main gamma){reference-type="ref+label"
reference="conjecture main gamma"} is known to be true in several cases:
(i) the case $i=n$ is a consequence of Suslin's identification of
$\smash{K_n^{(n)}(F)_{{\mathds{Q}}}}$ with the rationalised Milnor
$K$-group $K_n^M(F)_{\mathds{Q}}$ [@Sus84 §2.7], (ii) for $i=1, n=2$ it
is equivalent to the exactness of the complex
$$0\longrightarrow K^{(2)}_{3}(F)_{{\mathds{Q}}}\longrightarrow B_2(F)_{\mathds{Q}}\longrightarrow\Lambda^2 F^{\times}_{\mathds{Q}}\longrightarrow K^{(2)}_{2}(F)_{{\mathds{Q}}}\longrightarrow 0$$
proved by Suslin [@Sus90 §5], and (iii) for any $i=n-1,n \geq 1$ a proof
was given in [@Bol24]. In further support of
[\[conjecture main gamma\]](#conjecture main gamma){reference-type="ref+label"
reference="conjecture main gamma"}, we study the case $n=3$. We do so by
combining our description of ${\mathscr{G}}(F)$ with a *rank spectral
sequence* related to that of Rognes [@Rognes], resulting in a symbolic
description of $\smash{K_4^{(3)}(F)_{{\mathds{Q}}}}$ (note
[1](#theorem weight 3){reference-type="ref+label"
reference="theorem weight 3"}
[\[enum:FormulaGoncharovConjecture2\]](#enum:FormulaGoncharovConjecture2){reference-type="eqref"
reference="enum:FormulaGoncharovConjecture2"} is an instance of [@Bol24]
but his proof is quite different) and the *indecomposable part* of
$\smash{K_5^{(3)}(F)_{\mathds{Q}}}$:

::: {#theorem weight 3 .atheorem}
**Theorem 1**. *Let $F$ be an arbitrary field.*

1.  *[]{#enum:FormulaGoncharovConjecture2
    label="enum:FormulaGoncharovConjecture2"} There is an isomorphism
    $$K^{(3)}_{4}(F)_{{\mathds{Q}}} \cong H^{2}(\mathscr{G}(F))_3.$$*

2.  *[]{#enum:FormulaGoncharovConjecture3
    label="enum:FormulaGoncharovConjecture3"} There is an exact sequence
    $$K^{(2)}_{4}(F)_{{\mathds{Q}}}\otimes F^{\times}_{{\mathds{Q}}}
    \longrightarrow
    K^{(3)}_{5}(F)_{{\mathds{Q}}}
    \longrightarrow
    H^{1}(\mathscr{G}(F))_3\longrightarrow 0.$$*
:::

In the case $n=3$,
[\[conjecture main gamma\]](#conjecture main gamma){reference-type="ref+label"
reference="conjecture main gamma"} is equivalent to a conjecture of
Goncharov [@Gon95b Conjecture 1.15] concerning his weight $3$
polylogarithmic complex $\Gamma_3(F;{\mathds{Q}})$, given by
$$B_3(F)_{{\mathds{Q}}}\longrightarrow B_2(F)_{{\mathds{Q}}}\otimes F^{\times}_{{\mathds{Q}}} \longrightarrow\Lambda^3 F^{\times}_{{\mathds{Q}}}.$$
It says that homology groups of this complex are given by
$K_5^{(3)}(F)_{\mathds{Q}}$, $K_4^{(3)}(F)_{\mathds{Q}}$, and
$K^M_3(F)_{\mathds{Q}}$ respectively.
[1](#theorem weight 3){reference-type="ref+label"
reference="theorem weight 3"} affirms a variant of this conjecture,
using that under the identifications of
[\[thm:polyl-identification\]](#thm:polyl-identification){reference-type="ref+label"
reference="thm:polyl-identification"}, this agrees with
[\[eqn:polyl-ce\]](#eqn:polyl-ce){reference-type="eqref"
reference="eqn:polyl-ce"} in weight $n=3$, given by
$${\mathscr{G}}_3(F) \longrightarrow{\mathscr{G}}_2(F) \otimes {\mathscr{G}}_1(F) \longrightarrow\Lambda^3 {\mathscr{G}}_1(F).$$

We now turn to a more detailed introduction to the results contained in
this paper, in particular
[1](#theorem weight 3){reference-type="ref+label"
reference="theorem weight 3"}.

### $E_\infty$-homology of general linear groups {#sec:intro-einfty}

We start by recalling the approach to studying the homology of general
linear groups introduced by Galatius, Kupers, and Randal-Williams
[@GKRW18; @GKRW19; @GKRW20] and how it leads to the Goncharov Lie
coalgebra. This takes place in a homotopy-theoretic context, so we work
in $\infty$-categories or, if the reader prefers, suitable model
categories.

#### The $E_\infty$-algebra ${\mathbf{BGL}}(F)_{\mathds{Q}}$

The block sum of matrices induces a product on chains
$$C_*({\mathrm{GL}}_n(F);{\mathds{Q}})\otimes C_*({\mathrm{GL}}_m(F);{\mathds{Q}}) \longrightarrow C_*({\mathrm{GL}}_{n+m}(F);{\mathds{Q}})$$
which is associative and commutative up to chain homotopy. It is
convenient to keep track of the dimension (or *rank*) $n$ by defining a
functor $$\begin{align*}
{\mathbf{BGL}}(F)_{\mathds{Q}} \colon {\mathds{N}} &\longrightarrow{{\mathscr{D}}_{\mathds{Q}}}\\
n &\longmapsto C_*({\mathrm{BGL}}_n(F);{\mathds{Q}}),
\end{align*}$$ where ${{\mathscr{D}}_{\mathds{Q}}}$ is the derived
category of ${\mathds{Q}}$ obtained by inverting the quasi-isomorphisms
in the category of rational chain complexes. That the above product
admits coherent associativity or commutativity chain homotopies means
that this functor lifts to a nonunital $E_\infty$-algebra
${\mathbf{BGL}}(F)_{\mathds{Q}} \in {\mathrm{Alg}}_{E_\infty^{\mathrm{nu}}}({\mathrm{Fun}}({\mathds{N}},{{\mathscr{D}}_{\mathds{Q}}}))$,
where ${\mathrm{Fun}}({\mathds{N}},{{\mathscr{D}}_{\mathds{Q}}})$ is
endowed with the Day convolution symmetric monoidal structure.

There is a well-developed theory of derived indecomposables of nonunital
$E_\infty$-algebras such as ${\mathbf{BGL}}(F)_{\mathds{Q}}$,
e.g. [@GKRW18]. Informally this recovers its generators and relations,
as homotopy-theoretically there is no distinction between these. More
precisely, the functor making an object into a nonunital
$E_\infty$-algebra with trivial multiplication has a left adjoint
$${\mathrm{cot}}_{E_\infty^{\mathrm{nu}}} \colon {\mathrm{Alg}}_{E_\infty^{\mathrm{nu}}}({\mathrm{Fun}}({\mathds{N}},{{\mathscr{D}}_{\mathds{Q}}})) \longrightarrow{\mathrm{Fun}}({\mathds{N}},{{\mathscr{D}}_{\mathds{Q}}})$$
known as the *cotangent complex* or *$E_\infty$-indecomposables*; we
will use the latter terminology. In our rational setting, it may be
computed by strictifying to a commutative dg-algebra and taking Harrison
homology; for example, for a minimal commutative dg-algebra this yields
its indecomposables in an underived sense, which are canonically
isomorphic to its generators.

The *$E_\infty$-homology groups* of ${\mathbf{BGL}}(F)_{\mathds{Q}}$ are
then defined as
$$H^{E_\infty}_{n,d}({\mathbf{BGL}}(F)_{\mathds{Q}}) \coloneq H_d({\mathrm{cot}}_{E_\infty^{\mathrm{nu}}}({\mathbf{BGL}}(F)_{\mathds{Q}})(n))$$
and one of the main results of [@GKRW20] is a determination of some of
these groups, see [1](#fig:gltable1){reference-type="ref+label"
reference="fig:gltable1"}: in particular, they vanish for $d \leq 2n-2$
with the exception of $(n,d) = (1,0)$. The Goncharov Lie coalgebra is
defined as those entries on the critical line above where this vanishing
result applies:
$$\mathscr{G}(F) = \bigoplus_{n\geq 1} H_{n,2n-1}^{E_{\infty}}({\mathbf{BGL}}(F)_{\mathds{Q}}).$$
Its name is justified by Koszul duality between the nonunital
commutative operad and the suspended Lie cooperad, which implies that
$E_\infty$-indecomposables admit the structure of a shifted Lie
coalgebra: for a minimal commutative dg-algebra this is the quadratic
part of the differential on generators. This endows the
$E_\infty$-homology groups
$\smash{H^{E_\infty}_{n,d}({\mathbf{BGL}}(F)_{\mathds{Q}})}$ with a
cobracket of degree $-1$, restricting to a Lie coalgebra structure on
$\mathscr{G}(F)$; the gradings work out to make so that Lie cobracket
does not involve additional Koszul signs. It is a construction for
$E_\infty$-algebras with a slope 2 vanishing line that is analogous to
the "stability Hopf algebra" of [@RWchromatic] for $E_2$-algebras with a
slope 1 vanishing line, and encodes the attaching maps for
$E_\infty$-cells in the sense of [@GKRW18].

<figure id="fig:gltable1" data-latex-placement="h">

<figcaption>The <span class="math inline">\(E_\infty\)</span>-homology
of <span class="math inline">\({\mathbf{BGL}}(F)_{\mathds{Q}}\)</span>,
which vanishes for <span class="math inline">\(d \leq 2n-2\)</span> as
long as <span class="math inline">\(n \geq 2\)</span>. In this grading
convention the Lie cobracket has degree <span
class="math inline">\(-1\)</span>, so the entries on the dashed line
assemble to a Lie coalgebra.</figcaption>
</figure>

#### The presentation of the Goncharov Lie coalgebra

Once one defines the Goncharov Lie coalgebra ${\mathscr{G}}(F)$, one
should ask what it is. The first main result of this paper attempts to
answer this question by giving a presentation of it.

[]{#thm:polyl-presentation-additive
label="thm:polyl-presentation-additive"} The Lie coalgebra
$\mathscr{G}(F)$ is generated as a ${\mathds{Q}}$-vector space by
*correlators*
$$\mathrm{Cor}^{\mathscr{G}}(x_0,x_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n) \in {\mathscr{G}}_n(F) \qquad \text{for $x_0,\ldots,x_n \in F$ not all equal }$$
subject to the following relations:

1.  []{#enum:rel-goncharov-1 label="enum:rel-goncharov-1"} Homogeneity:
    $\mathrm{Cor}^{\mathscr{G}}(x_0,x_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n)=\mathrm{Cor}^{\mathscr{G}}(x_0+b,x_1+b,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n+b)$
    for $b\in F$.

2.  []{#enum:rel-goncharov-2 label="enum:rel-goncharov-2"} Cyclic
    symmetry:
    $\mathrm{Cor}^{\mathscr{G}}(x_0,x_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n)=\mathrm{Cor}^{\mathscr{G}}(x_1,x_2,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_0)$.

3.  []{#enum:rel-goncharov-3 label="enum:rel-goncharov-3"} Shuffle
    relations:
    $$\sum_{\sigma \in {\mathrm{Sh}}(n_1,n_2)} \mathrm{Cor}^{\mathscr{G}}(x_0,x_{\sigma(1)},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_{\sigma(n_1+n_2)}) =0 \quad 
    \text{for $n=n_1+n_2$, $n_1,n_2>0$.}$$

4.  []{#enum:rel-goncharov-4 label="enum:rel-goncharov-4"} Decomposition
    relations: $$\begin{align*}
        &\mathrm{Cor}^\mathscr{G}(x_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n)-\mathrm{Cor}^\mathscr{G}(y_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},y_n)\\
         &=\sum_{\iota=((i_1,j_1),\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},(i_{n},j_n))\in T(n)}{\mathrm{sign}}(\iota)\,
         \mathrm{Cor}^\mathscr{G}\left(0,\frac{x_{i_1}-x_{j_1}}{y_{i_1}-y_{j_1}},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},\frac{x_{i_n}-x_{j_n}}{y_{i_n}-y_{j_n}}\right),
    \end{align*}$$ where we omit terms with $y_{i_k}=y_{j_k}$ for some
    k, and the set $T(n)$ of pairs of indices as well as the sign
    ${\mathrm{sign}}(\iota)$ are given by
    [26](#prop:universal-symbol-combinatorics){reference-type="ref+label"
    reference="prop:universal-symbol-combinatorics"}.

::: remark*
*Remark 2*. The expression in the decomposition relation
[\[enum:rel-goncharov-4\]](#enum:rel-goncharov-4){reference-type="eqref"
reference="enum:rel-goncharov-4"} can be inductively determined, takes
the same form as the symbol for formal correlators, and admits a formula
as a sum over trees. In practice, it is sufficient to merely know its
form, rather than the details of $T(n)$ or ${\mathrm{sign}}(\iota)$.
:::

The decomposition relations imply that
$\mathrm{Cor}^\mathscr{G}(x_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n)$
with all $x_0,\ldots,x_n$ distinct generate $\mathscr{G}_n(F)$
([116](#proposition: generic correlators){reference-type="ref+label"
reference="proposition: generic correlators"}), so the following
completely determines the Lie cobracket:

[]{#thm:polyl-presentation-cobracket
label="thm:polyl-presentation-cobracket"} With respect to the
presentation of
[\[thm:polyl-presentation-additive\]](#thm:polyl-presentation-additive){reference-type="ref+label"
reference="thm:polyl-presentation-additive"}, the Lie cobracket is given
by
$$\delta(\mathrm{Cor}^\mathscr{G}(x_0,x_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n)) = \sum_{j=0}^n \sum_{i=1}^{n-1} \mathrm{Cor}^\mathscr{G}(x_j,x_{j+1},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_{j+i}) \wedge \mathrm{Cor}^\mathscr{G}(x_j,x_{j+i+1},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_{j+n})$$
as long as $x_0,\ldots,x_n$ are distinct.

There are other generating sets, e.g. the analogues
$\mathrm{Li}^\mathscr{G}_{n_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},n_k}(a_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},a_k)$
of multiple polylogarithms. One has for example
$$\mathrm{Li}^\mathscr{G}_n(a)=-\mathrm{Cor}^\mathscr{G}(1,\underbrace{0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},0}_{n-1},a),$$
and a general formula expressing multiple polylogarithms in terms of
correlators (and vice versa) can be deduced from
[7.2.3](#sec:iterated-integrals-and-multiple-polylogarithms){reference-type="ref+label"
reference="sec:iterated-integrals-and-multiple-polylogarithms"}.

It can be difficult to make use of a presentation, but
[\[thm:polyl-presentation-additive\]](#thm:polyl-presentation-additive){reference-type="ref+label"
reference="thm:polyl-presentation-additive"} is such that one can
perform calculations in ${\mathscr{G}}(F)$: through it one can
understand the action of the duality involution (it is by $(-1)^n$, see
[145](#theorem: duality){reference-type="ref+label"
reference="theorem: duality"}) and, in characteristic $p$, the action of
Frobenius endomorphism (see [@KRS2]). In fact, for $n \leq 3$ we can
find identifications with more classical groups:

[]{#thm:polyl-identification label="thm:polyl-identification"} There are
isomorphisms
$$\begin{aligned}F^\times_{\mathds{Q}} &\overset{\cong}\longrightarrow{\mathscr{G}}_1(F) \\
a &\longmapsto \mathrm{Cor}^\mathscr{G}(0,a),\end{aligned} \qquad \begin{aligned}B_2(F)_{\mathds{Q}} &\overset{\cong}\longrightarrow{\mathscr{G}}_2(F) \\
\{a\}_2 &\longmapsto -\mathrm{Cor}^\mathscr{G}(1,0,a),\end{aligned} \qquad\begin{aligned}B_3(F)_{\mathds{Q}} &\overset{\cong}\longrightarrow{\mathscr{G}}_3(F) \\
\{a\}_3 &\longmapsto -\mathrm{Cor}^\mathscr{G}(1,0,0,a),\end{aligned}$$
where $B_2(F)$ is the Bloch group studied by Bloch and Suslin
[@Bloch; @Sus90] (who call it the pre-Bloch group), and $B_3(F)$ was
introduced by Goncharov [@Gon95b].

### Steinberg modules

The presentation of
[\[thm:polyl-presentation-additive\]](#thm:polyl-presentation-additive){reference-type="ref+label"
reference="thm:polyl-presentation-additive"} is obtained by relating the
$E_\infty$-homology groups of ${\mathbf{BGL}}(F)_{\mathds{Q}}$ to
Steinberg modules. We will first recall the Steinberg modules and their
double and infinite variants, giving a particularly nice generating set
for the latter, and explain how these are related to the
$E_\infty$-homology groups discussed in the previous subsection.

#### Steinberg modules, double Steinberg modules, and infinite Steinberg modules

The *Tits building* $T(F^n)$ is defined as the geometric realisation of
the nerve of the poset of proper nonzero subspaces of $F^n$. By the
Solomon--Tits theorem it is equivalent to a wedge of $(n-2)$-spheres,
and its top reduced rational homology is a ${\mathrm{GL}}_n(F)$-module
known as the *Steinberg module*
$${\mathrm{St}}_n(F) \coloneq \widetilde{H}_{n-2}(T(F^n);{\mathds{Q}}).$$
This has a well-known presentation with generators given by apartment
classes $[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n]$
indexed by ordered bases
$v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n$; we suggest
representing these by simplices in projective space
${\mathds{P}}^{n-1}(F)$ as on the left of
[2](#fig:generators-st-sth){reference-type="ref+label"
reference="fig:generators-st-sth"}.

<figure id="fig:generators-st-sth" data-latex-placement="h">

<figcaption>A generator of <span
class="math inline">\({\mathrm{St}}_3(F)\)</span> (on the left) and a
generator of <span class="math inline">\({\mathrm{St}}^{2}_3(F)\)</span>
(on the right).</figcaption>
</figure>

To explain further structure, we organise all Steinberg modules into a
single object. Let ${\mathrm{Vect}}_F$ denote the groupoid of
finite-dimensional vector spaces over $F$ and linear isomorphisms, then
we can think of the Steinberg modules as a functor (with
${\mathrm{St}}(V)$ in degree $\dim(V)$) $$\begin{align*}
{{\mathscr{S}}{\mathrm{t}}}\colon {\mathrm{Vect}}_F &\longrightarrow{\mathrm{GrMod}}_{\mathds{Q}} \\
V &\longmapsto {\mathrm{St}}(V).
\end{align*}$$ The category ${\mathrm{Vect}}_F$ admits not only a
symmetric monoidal structure given by direct sum but also a promonoidal
structure given by "flag sum", which assemble to a produoidal category.
By Day convolution, these induce on functors
${\mathrm{Vect}}_F \to {\mathrm{GrMod}}_{\mathds{Q}}$ a symmetric
monoidal structure whose tensor product $\boxplus$ we call the *Levi
tensor product* and a monoidal structure whose tensor product
$\boxbackslash$ we call the *parabolic tensor product*, which assemble
to a duoidal category. The Steinberg modules
${{\mathscr{S}}{\mathrm{t}}}$ form a bialgebra, with product and
coproduct
$$\parbox{4cm}{\centering $({{\mathscr{S}}{\mathrm{t}}}\boxplus{{\mathscr{S}}{\mathrm{t}}})(V) \cong$ \\
$\bigoplus_{V_1 \oplus V_2 = V} {\mathrm{St}}(V_1) \otimes {\mathrm{St}}(V_2)$} \longrightarrow{\mathrm{St}}(V) \quad \text{and} \quad {\mathrm{St}}(V) \longrightarrow\parbox{4cm}{\centering $({{\mathscr{S}}{\mathrm{t}}}\boxbackslash{{\mathscr{S}}{\mathrm{t}}})(V) \cong $ \\ 
$\bigoplus_{U \subseteq V} {\mathrm{St}}(U) \otimes {\mathrm{St}}(V/U)$}$$
given by concatenation and splitting of apartments (see
[9](#prop:st-explicit-pres){reference-type="ref+label"
reference="prop:st-explicit-pres"} for explicit formulas).

To see this, one considers the functor
${\underline{{\mathds{Q}}}}{}_{>0} \colon {\mathrm{Vect}}\to {{\mathscr{D}}_{\mathds{Q}}}$,
which takes the value ${\mathds{Q}}$ on nonzero vector spaces and $0$
otherwise, which admits the structure of a commutative algebra with
respect to $\boxplus$ and an associative algebra with respect to
$\boxbackslash$. Then computing its $E_1$-indecomposables with respect
to $\boxbackslash$ via a bar construction, one finds these are given by
the (rationalised) Steinberg modules, but now it has a coassociative
coproduct with respect to $\boxbackslash$ and a remaining commutative
product with respect to $\boxplus$. Similar algebraic structures were
used in [@AMP; @BCGP].

A crucial property of ${{\mathscr{S}}{\mathrm{t}}}$ as a commutative
algebra is that it is Koszul [@MNP; @MPW23; @CharltonRadchenkoRudenko].
Its Koszul dual as an associative algebra is given by the *double
Steinberg modules* ${{{\mathscr{S}}{\mathrm{t}}}^2}$
$${\mathrm{St}}^{2}_n(F) \cong {\mathrm{St}}_n(F) \otimes {\mathrm{St}}_n(F),$$
which merely means that the associative bar complex
$$0 \to {\mathrm{St}}^{2}_n(F) \to ({{\mathscr{S}}{\mathrm{t}}}^{\boxplus n})(F^n) \to ({{\mathscr{S}}{\mathrm{t}}}^{\boxplus n-1})(F^n) \to \cdots \to ({{\mathscr{S}}{\mathrm{t}}}^{\boxplus 2})(F^n) \to {\mathrm{St}}_n(F) \to 0$$
is exact. We suggest representing elements of ${\mathrm{St}}^{2}_n(F)$
by pairs of simplices in projective space ${\mathds{P}}^{n-1}(F)$ as on
the right of [2](#fig:generators-st-sth){reference-type="ref+label"
reference="fig:generators-st-sth"}. It has a product by concatenating
apartments termwise and the Koszul dual of ${{\mathscr{S}}{\mathrm{t}}}$
as a commutative algebra is given by the *infinite Steinberg modules*
${{{\mathscr{S}}{\mathrm{t}}}^\infty}$, which can be defined as the
indecomposables with respect to the algebra structure on the double
Steinberg modules:
$${\mathrm{St}}^{\infty}(V) \cong {\mathrm{coker}}\left[\bigoplus_{\substack{V_1 \oplus V_2 = V \\ V_1,V_2 \neq 0}} {\mathrm{St}}^{2}(V_1)\otimes {\mathrm{St}}^{2}(V_2) \longrightarrow{\mathrm{St}}^{2}(V)\right].$$
We believe that the infinite Steinberg module is a remarkable object
worth studying independently. It can also be obtained from the common
basis complex [@Rognes] or the partial decomposition poset [@HHS; @BPW].

By Koszul duality, ${{{\mathscr{S}}{\mathrm{t}}}^\infty}$ admits the
structure of a Lie coalgebra with respect to $\boxplus$. Charlton,
Radchenko, and Rudenko gave a presentation of the infinite Steinberg
modules in which the cobracket takes a simple form
[@CharltonRadchenkoRudenko Section 2]: ${\mathrm{St}}^{\infty}_n(F)$ is
generated by Steinberg correlators
${\mathrm{C}}[u_0: \mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}u_n]$
indexed by affine bases $u_0,\ldots,u_n$ (this means that
$u_1-u_0,\ldots,u_n-u_0$ are a basis) defined as (see
[3](#fig:generator-stl){reference-type="ref+label"
reference="fig:generator-stl"})
$${\mathrm{C}}[u_0: \mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}: u_n] \coloneq \pi\big[[u_n-u_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},u_1-u_0] \otimes [u_n-u_0,u_{n-1}-u_n,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},u_1-u_2]\big]$$
with $\pi \colon {\mathrm{St}}^{2}_n(F) \to {\mathrm{St}}^{\infty}_n(F)$
the projection onto indecomposables. These satisfy homogeneity, cyclic
symmetry, and shuffle relations. In terms of these the cobracket is
given by
$$\delta\big({\mathrm{C}}[u_0:\cdots:u_n]\big) = \sum_{j=0}^n \sum_{i=1}^{n-1} {\mathrm{C}}[u_j:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_{j+i}] \wedge {\mathrm{C}}[u_j:u_{j+i+1}:u_{j+i+2}:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_{j+n}].$$

<figure id="fig:generator-stl">

<figcaption>A generator of <span
class="math inline">\({\mathrm{St}}^{\infty}_3(F)\)</span>.</figcaption>
</figure>

::: remark*
*Remark 3*. In [3.4](#sec:higher-apts){reference-type="ref+label"
reference="sec:higher-apts"} we will explain how to obtain both the
correlators and their cobracket by a formal procedure given only the
description of Steinberg modules in terms of apartments, as what we call
*higher apartments*.
:::

#### Relationship to $E_\infty$-homology

We can relate ${\mathbf{BGL}}(F)_{\mathds{Q}}$ to Steinberg modules by
constructing this nonunital $E_\infty$-algebra in a different manner.
Taking the dimension gives a symmetric monoidal functor
$\dim \colon {\mathrm{Vect}}_F \to {\mathds{N}}$. The nonunital
$E_\infty$-algebra ${\mathbf{BGL}}(F)_{\mathds{Q}}$ can be obtained as
$\dim_!({\underline{{\mathds{Q}}}}{}_{>0})$, the left Kan extension
along $\dim$ of the nonunital $E_\infty$-algebra ${\mathds{Q}}_{>0}$.
The advantage of this perspective is that constructions such as
indecomposables commute with $\dim_!$. This can be used to prove that
there are isomorphisms [@GKRW20 Section 6] $$\begin{equation}
\label{eqn:he1-st-heinfty-stl} \begin{aligned} H^{E_1}_{n,d}({\mathbf{BGL}}(F)_{\mathds{Q}}) & \overset{\cong}\longrightarrow H_{d-n+1}({\mathrm{GL}}_n(F);{\mathrm{St}}_n(F)), \\
H^{E_2}_{n,d}({\mathbf{BGL}}(F)_{\mathds{Q}}) & \overset{\cong}\longrightarrow H_{d-2n+2}({\mathrm{GL}}_n(F);{\mathrm{St}}^{2}_n(F)), \\
H^{E_\infty}_{n,d}({\mathbf{BGL}}(F)_{\mathds{Q}}) & \overset{\cong}\longrightarrow H_{d-2n+2}({\mathrm{GL}}_n(F);{\mathrm{St}}^{\infty}_n(F)),\end{aligned}
\end{equation}$$ for $n \geq 1$, where $H^{E_1}_{*,*}(-)$ and
$H^{E_2}_{*,*}(-)$ are obtained as the indecomposables with respect to
the nonunital $E_1$- or $E_2$-algebra structures obtained by forgetting
commutativity. In particular, there is an isomorphism
$$\mathscr{G}_n(F) = H^{E_\infty}_{n,2n-1}({\mathbf{BGL}}(F)_{\mathds{Q}}) \cong H_1({\mathrm{GL}}_n(F);{\mathrm{St}}^{\infty}_n(F)).$$
The top isomorphism of
[\[eqn:he1-st-heinfty-stl\]](#eqn:he1-st-heinfty-stl){reference-type="eqref"
reference="eqn:he1-st-heinfty-stl"} is induced by taking
$E_1$-indecomposables of ${\underline{{\mathds{Q}}}}{}_{>0}$ with
respect to $\boxbackslash$ and uses that applying $\dim_!$ to the
comparison map from $\boxplus$ to $\boxbackslash$ yields an isomorphism,
an observation due to Nesterenko and Suslin [@NesterenkoSuslin §1]. The
bottom isomorphism of
[\[eqn:he1-st-heinfty-stl\]](#eqn:he1-st-heinfty-stl){reference-type="eqref"
reference="eqn:he1-st-heinfty-stl"} can similarly be obtained by first
taking $E_1$-indecomposables of ${\underline{{\mathds{Q}}}}{}_{>0}$ with
respect to $\boxbackslash$ and then $E_\infty$-indecomposables with
respect to $\boxplus$.

This reveals that ${{{\mathscr{S}}{\mathrm{t}}}^\infty}$ has additional
structure: in addition to the cobracket with respect to $\boxplus$ it
has a compatible coproduct with respect to $\boxbackslash$, though by an
Eckmann--Hilton argument the cobracket determines the coproduct. The
cobracket on $E_\infty$-homology is *not* induced by the cobracket on
${{{\mathscr{S}}{\mathrm{t}}}^\infty}$ (it would have degree $0$ rather
than degree $-1$) but rather is a secondary cobracket arising from the
compatibility of cobracket and coproduct with respect to tensor products
that are made equal upon applying $\dim_!$. This should call to mind the
Dunn--Lurie additivity theorem [@LurieHA 5.1.2.2].

### From infinite Steinberg modules to a presentation for $\mathscr{G}(F)$. {#sec:intro-presentation}

We next explain how we obtain a presentation of $\mathscr{G}_n(F)$ from
that for ${\mathrm{St}}^{\infty}_n(F)$, leading to
[\[thm:polyl-presentation-additive,thm:polyl-presentation-cobracket\]](#thm:polyl-presentation-additive,thm:polyl-presentation-cobracket){reference-type="ref+label"
reference="thm:polyl-presentation-additive,thm:polyl-presentation-cobracket"}.
This is an outline of the arguments that comprise the first half of this
paper.

#### A projective resolution of the infinite Steinberg module {#sec:intro-presentation-resolution}

The presentation of $\mathscr{G}_n(F)$ is obtained by constructing a
novel projective resolution of ${\mathrm{St}}^{\infty}_n(F)$ and using
the identification of ${\mathscr{G}}_n(F)$ as
$H_1({\mathrm{GL}}_n(F);{\mathrm{St}}^{\infty}_n(F))$.

We start by constructing a generating set. The ${\mathrm{GL}}(V)$-module
$\mathrm{FC}(V)$ is the ${\mathds{Q}}$-vector space generated by symbols
$\mathrm{FC}[u_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n]$
for affine bases $u_0,\ldots, u_n$ of $V$, which we call *formal
correlators*, subject to the following relations:

- Homogeneity:
  ${\mathrm{FC}}[u_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n] = {\mathrm{FC}}[u_0-u:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n-u]$
  for any $u \in V$.

- Cyclic symmetry:
  ${\mathrm{FC}}[u_0:u_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n] = {\mathrm{FC}}[u_1:u_2:\cdots:u_0]$.

- Shuffle relations:
  $$\sum_{\sigma \in {\mathrm{Sh}}(n_1,n_2)} {\mathrm{FC}}[u_0:u_{\sigma(1)}:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_{\sigma(n_1+n_2)}] =0 \quad \text{for $n=n_1+n_2$ with $n_1,n_2>0$.}$$

As a ${\mathrm{GL}}(V)$-module $\mathrm{FC}(V)$ is projective, and there
is an evident surjection $$\begin{align*}
{\mathrm{pr}}^\mathrm{FC}\colon \mathrm{FC}(V)&\longrightarrow{\mathrm{St}}^{\infty}(V)\\
\mathrm{FC}[u_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n] &\longmapsto {\mathrm{C}}[u_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n]
\end{align*}$$ which is the start of a projective resolution
$$\begin{equation}
\label{eqn:dec-resolution}\cdots \overset{d}\longrightarrow{\mathds{Q}}[{{\mathrm{Dec}}}_{V}]^{\otimes 2} \otimes \mathrm{FC}(V) \overset{d}\longrightarrow{\mathds{Q}}[{{\mathrm{Dec}}}_{V}] \otimes \mathrm{FC}(V) \overset{d}\longrightarrow\mathrm{FC}(V) \overset{{\mathrm{pr}}^\mathrm{FC}}\longrightarrow{\mathrm{St}}^{\infty}(V)\longrightarrow 0.
\end{equation}$$ The further terms use the key observation, based on
[@CharltonRadchenkoRudenko Section 3.9], that the vector space
${\mathrm{St}}^{\infty}(V)$ has a collection of "almost bases" labelled
by nonzero linear functionals $h\in V^{\vee}$. Namely, for every such
functional, the Steinberg correlators
${\mathrm{C}}[0:v_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_n]$
with $h(v_i) = 1$ span ${\mathrm{St}}^{\infty}(V)$ as a
${\mathds{Q}}$-vector space; they are almost a basis in the sense that
all the relations between such elements for the same $h$ follow from the
shuffle relations. This allows us to introduce *decomposition operators*
$$D^\mathrm{FC}_{h} \colon \mathrm{FC}(V) \longrightarrow\mathrm{FC}(V)$$
which are obtained by projecting $\mathrm{FC}(V)$ to
${\mathrm{St}}^{\infty}(V)$, expanding the obtained element as a linear
combination of Steinberg correlators
${\mathrm{C}}[0:v_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_n]$
with $h(v_i) = 1$, and then lifting these to $\mathrm{FC}(V)$. This is
well-defined because, for fixed $h$, the only relations among the
normalized correlators are the shuffle relations, which are imposed in
$\mathrm{FC}(V)$.

::: example*
*Example 1*. For $V = F^2$ the decomposition operator is given by the
following formula: $$\begin{align*}
D^\mathrm{FC}_h(\mathrm{FC}[u_0:u_1:u_2])
&=\,\mathrm{FC}\left[0:\frac{u_{1}-u_{0}}{h(u_{1}-u_0)}:\frac{u_{2}-u_{0}}{h(u_{2}-u_0)}\right]\\
&-\mathrm{FC}\left[0:\frac{u_{1}-u_{0}}{h(u_{1}-u_0)}:\frac{u_{2}-u_{1}}{h(u_{2}-u_1)}\right]\\
&+\mathrm{FC}\left[0:\frac{u_{2}-u_{0}}{h(u_{2}-u_0)}:\frac{u_{2}-u_{1}}{h(u_{2}-u_1)}\right],
\end{align*}$$ where if a denominator is zero that term must be dropped.
:::

In general, the formula for the decomposition operator is equally
explicit but more intricate, see
[2.6](#sec:symbol-maps){reference-type="ref+label"
reference="sec:symbol-maps"}. It has the same form as the decomposition
relation of
[\[thm:polyl-presentation-additive\]](#thm:polyl-presentation-additive){reference-type="ref+label"
reference="thm:polyl-presentation-additive"}
[\[enum:rel-goncharov-4\]](#enum:rel-goncharov-4){reference-type="eqref"
reference="enum:rel-goncharov-4"}: $$\begin{align*}
    &D^\mathrm{FC}_h(\mathrm{FC}[u_0:\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}:u_n])\\
     &=\sum_{\iota=((i_1,j_1),\ldots,(i_{n},j_n))\in T(n)}{\mathrm{sign}}(\iota)\,
     \mathrm{FC}\left[0:\frac{u_{i_1}-u_{j_1}}{h(u_{i_1}-u_{j_1})},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},\frac{u_{i_n}-u_{j_n}}{h(u_{i_n}-u_{j_n})}\right],
\end{align*}$$ for the set $T(n)$ of pairs of indices and signs
${\mathrm{sign}}(\iota)=\pm 1$ of
[26](#prop:universal-symbol-combinatorics){reference-type="ref+label"
reference="prop:universal-symbol-combinatorics"}.

Let ${{\mathrm{Dec}}}_{V}$ denote the set of nonzero linear functionals
on $V$, and define
[\[eqn:dec-resolution\]](#eqn:dec-resolution){reference-type="eqref"
reference="eqn:dec-resolution"} as
$$\cdots \overset{d}\longrightarrow{\mathds{Q}}[{{\mathrm{Dec}}}_{V}]^{\otimes 2} \otimes \mathrm{FC}(V) \overset{d}\longrightarrow{\mathds{Q}}[{{\mathrm{Dec}}}_{V}] \otimes \mathrm{FC}(V) \overset{d}\longrightarrow\mathrm{FC}(V) \overset{{\mathrm{pr}}^\mathrm{FC}}\longrightarrow{\mathrm{St}}^{\infty}(V)\longrightarrow 0$$
with differential is akin to that in the bar construction, given by an
alternating sum of forgetting functionals and applying a decomposition
operator: for example,
$d([h_1|h_2] \otimes \mathrm{FC}[u_0 : \mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}: u_n])$
is given by
$[h_2] \otimes \mathrm{FC}[u_0 : \mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}: u_n]-[h_1] \otimes \mathrm{FC}[u_0 : \mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}: u_n]+[h_1] \otimes D_{h_2}^\mathrm{FC}(\mathrm{FC}[u_0 : \mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}: u_n])$.

#### Presentation of $\mathscr{G}_n(F)$ as a ${\mathds{Q}}$-vector space

We now use this projective resolution to give a presentation for
$\mathscr{G}_n(F)$. The natural map
$H_0({\mathrm{GL}}(V);\mathrm{FC}(V)) \to H_0({\mathrm{GL}}(V);{\mathrm{St}}^{\infty}(V))$
is an isomorphism: both sides vanish for $\dim V>1$, and for $\dim V=1$
both are canonically isomorphic to ${\mathds{Q}}$. By taking
coinvariants we obtain from
[\[eqn:dec-resolution\]](#eqn:dec-resolution){reference-type="eqref"
reference="eqn:dec-resolution"} an exact sequence
$$\bigl({\mathds{Q}}[{{\mathrm{Dec}}}_{V}]^{\otimes 2}\otimes \mathrm{FC}(V)\bigr)_{{\mathrm{GL}}(V)} \longrightarrow\bigl({\mathds{Q}}[{{\mathrm{Dec}}}_{V}]\otimes \mathrm{FC}(V)\bigr)_{{\mathrm{GL}}(V)}  \longrightarrow\mathscr{G}_n(F)\longrightarrow 0.$$
The projection of the element
$[h]\otimes \mathrm{FC}[u_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n]$
to the coinvariants $\mathscr{G}_n(F)$ depends only on the elements
$h(u_0), \ldots, h(u_n)\in F$ and its image is by definition the
correlator
$$\mathrm{Cor}^\mathscr{G}(h(u_0),\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},h(u_n)) \in \mathscr{G}_n(F)$$
that appears in
[\[thm:polyl-presentation-additive\]](#thm:polyl-presentation-additive){reference-type="ref+label"
reference="thm:polyl-presentation-additive"}. The remainder of that
theorem is now a consequence of the above exact sequence and the formula
for the decomposition operator.

::: {#ex:decomposition weigh 2 .example*}
*Example 2*. For $V =F^2$, the element
$[h_1|h_2]\otimes \mathrm{FC}[u_0:u_1:u_2]$ yields the relation
$$\begin{align*}
    &\mathrm{Cor}^\mathscr{G}(x_0,x_1,x_2)-\mathrm{Cor}^\mathscr{G}(y_0, y_1,y_2)\\
     &=\mathrm{Cor}^\mathscr{G}\Bigl(0,\frac{x_1-x_0}{y_1-y_0},\frac{x_2-x_0}{y_2-y_0}\Bigr)-\mathrm{Cor}^\mathscr{G}\Bigl(0,\frac{x_1-x_0}{y_1-y_0},\frac{x_2-x_1}{y_2-y_1}\Bigr)+\mathrm{Cor}^\mathscr{G}\Bigl(0,\frac{x_2-x_0}{y_2-y_0},\frac{x_2-x_1}{y_2-y_1}\Bigr),
\end{align*}$$ where $x_i=h_1(u_i)$ and $y_i=h_2(u_i)$. Under the
isomorphism of
[\[thm:polyl-identification\]](#thm:polyl-identification){reference-type="ref+label"
reference="thm:polyl-identification"} between ${\mathscr{G}}_2(F)$ and
the classical Bloch group $B_2(F)_{\mathds{Q}}$, this is equivalent to
the 5-term relation.
:::

#### Presentation of ${\mathscr{G}}(F)$ as a Lie coalgebra

Now that we have the presentation of
[\[thm:polyl-presentation-additive\]](#thm:polyl-presentation-additive){reference-type="ref+label"
reference="thm:polyl-presentation-additive"}, we give a formula for the
aforementioned secondary cobracket in terms of correlators. The result
is
[\[thm:polyl-presentation-cobracket\]](#thm:polyl-presentation-cobracket){reference-type="ref+label"
reference="thm:polyl-presentation-cobracket"}, and it is obtained by
similarly reducing the computation to one on coinvariants.

The starting point is the bigraded Hopf algebra
${\mathrm{H}}^+ \coloneq \bigoplus_{n \geq 0} H_*({\mathrm{GL}}_n(F);{\mathrm{St}}_n(F))$,
where we place ${\mathrm{St}}_n(F)$ in homological degree $n$. This
vanishes for $d<2n-2$
([56](#thm:steinberg-homology-improved-vanishing){reference-type="ref+label"
reference="thm:steinberg-homology-improved-vanishing"}) and one can
obtain the Lie coalgebra
$\bigoplus_{n \geq 0} H_*({\mathrm{GL}}_n(F);{\mathrm{St}}^{\infty}_n(F))$,
where we place ${\mathrm{St}}^{\infty}_n(F)$ in homological degree $2n$,
as its indecomposables ${\mathrm{H}}/{\mathrm{H}}^2$ and the cobracket
as induced by the antisymmetrisation of its reduced coproduct. We then
model the zigzag
$${\mathrm{H}}/{\mathrm{H}}^2 \overset{\pi}\longleftarrow {\mathrm{H}}/{\mathrm{H}}^3 \xrightarrow{{\overline{\Delta}}-\sigma \circ {\overline{\Delta}}} {\mathrm{H}}/{\mathrm{H}}^2 \otimes {\mathrm{H}}/{\mathrm{H}}^2$$
with leftwards map surjective, by applying $\dim_!$ to a zigzag of chain
complexes
$$[{\mathrm{St}}^\infty \to 0] \longleftarrow [{\mathrm{St}}^\infty \to \Lambda^2 {\mathrm{St}}^\infty] \longrightarrow[0 \to {\mathrm{St}}^\infty \boxbackslash{\mathrm{St}}^\infty].$$
This zigzag is then resolved in a similar manner as above by formal
correlators and decomposition operators. When computing the cobracket in
the generic case with these resolutions, one gets to make choices of
lifts and the subtlety lies in making a good choice there. We defer to
[5.3.1](#sec:cobracket-outline){reference-type="ref+label"
reference="sec:cobracket-outline"} for a more detailed outline.

### Realisations {#sec:intro-realisations}

In his works on conjectures relating multiple polylogarithms to mixed
Tate motives and algebraic $K$-theory, Goncharov defines several
${\mathds{Q}}$-vector spaces of formal polylogarithms subject to an
inductively defined collections of relations. A closely related and
detailed construction appears in work of Charlton, Matveiakin,
Radchenko, and Rudenko [@CMRR24], who construct a Lie coalgebra
${\mathscr{L}}^{\mathrm{f}}(F)$ of *formal multiple polylogarithms*.
This is generated by formal correlators
${\mathrm{Cor}}^{\mathrm{f}}(x_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n)$
and there is a well-defined map of Lie coalgebras $$\begin{align*}
 r^{\mathrm{f}} \colon {\mathscr{G}}(F) &\longrightarrow{\mathscr{L}}^{\mathrm{f}}(F) \\
\mathrm{Cor}^\mathscr{G}(x_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n) &\longmapsto {\mathrm{Cor}}^{\mathrm{f}}(x_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n)
\end{align*}$$ because the formal correlators satisfy the relations in
[\[thm:polyl-presentation-additive\]](#thm:polyl-presentation-additive){reference-type="ref+label"
reference="thm:polyl-presentation-additive"}, though possibly many more,
and cobrackets are given by the same formulas. This is the *formal
realisation*.

Depending on the field $F$, there are realisation maps from
${\mathscr{L}}^f(F)$ to other Lie coalgebras. Firstly, for a number
field $F$ there is a *formal-to-motivic realisation*
${\mathscr{L}}^{\mathrm{f}}(F) \to {\mathscr{L}}^{\mathrm{MTM}}(F)$ with
target the motivic Lie coalgebra as in
[1.1.2](#sec:intro-mtm-number-field){reference-type="ref+label"
reference="sec:intro-mtm-number-field"}. It is uniquely determined by
sending the formal correlators
$\mathrm{Cor}^\mathrm{f}(x_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n)$
to the *motivic correlators*
${\mathrm{Cor}}^{\mathrm{MTM}}(x_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n) \in {\mathscr{L}}^{\mathrm{MTM}}_n(F)$
[@Gon19 §10.4.1]. Precomposing with formal realisation we obtain a
*motivic* realisation.

[]{#thm:motivic-realisation label="thm:motivic-realisation"} For a
number field $F$, there exists a unique functor of Tannakian categories
$$R^{\mathrm{MTM}} \colon {\mathrm{Comod}}^{\mathrm{fd}}_{\mathscr{G}(F)}({\mathrm{GrMod}}_{\mathds{Q}}) \longrightarrow{\mathrm{MTM}}_{\mathds{Q}}(F)$$
such that the induced morphism $r^{\mathrm{MTM}}$ of graded Lie
coalgebras satisfies
$$r^{\mathrm{MTM}}(\mathrm{Cor}^\mathscr{G}(x_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n))=\mathrm{Cor}^{\mathrm{MTM}}(x_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n).$$

Since multiple polylogarithms admit the same expression in terms of
correlators in the Goncharov Lie coalgebra and formal Lie coalgebra, it
follows that
$$r^{\mathrm{MTM}}\left(\mathrm{Li}^\mathscr{G}_{n_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},n_k}(a_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},a_k)\right)={\mathrm{Li}}^{\mathrm{MTM}}_{n_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},n_k}(a_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},a_k).$$

Secondly, given an embedding $\sigma \colon F \to {\mathds{C}}$ there is
a *formal-to-Hodge realisation*
${\mathscr{L}}^{f}(F) \to {\mathscr{L}}^{\mathrm{Hod}}$. Consider the
Tannakian category of rational mixed Hodge structures, constructed by
Deligne [@Del71b] and let ${\mathrm{MHTS}}_{\mathds{Q}}$ be its
Tannakian subcategory of mixed Hodge--Tate structures; this is
equivalent to the category of finite-dimensional graded comodules over
the Lie coalgebra ${\mathscr{L}}^{\mathrm{Hod}}$ of framed Hodge-Tate
structures. The formal-to-Hodge realisation is uniquely determined by
sending the formal correlators
$\mathrm{Cor}^\mathrm{f}(x_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n)$
to the *Hodge correlators*
${\mathrm{Cor}}^{\mathrm{Hod}}(\sigma(x_0),\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},\sigma(x_n)) \in {\mathscr{L}}_n^{\mathrm{Hod}}$
[@Gon19 §3.2]. Precomposing with formal realisation we obtain a Hodge
realisation:

[]{#thm:hodge-realisation label="thm:hodge-realisation"} For an
embedding $\sigma\colon F\hookrightarrow {\mathds{C}}$, there exists a
unique functor of Tannakian categories
$$R^{{\mathrm{Hod}}}_{\sigma}\colon {\mathrm{Comod}}^{\mathrm{fd}}_{{\mathscr{G}}(F)}({\mathrm{GrMod}}_{\mathds{Q}}) \longrightarrow{\mathrm{MHTS}}_{\mathds{Q}}$$
such that the induced morphism $r^{{\mathrm{Hod}}}_{\sigma}$ of graded
Lie coalgebras satisfies
$$r^{{\mathrm{Hod}}}_{\sigma}(\mathrm{Cor}^\mathscr{G}(x_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n))=\mathrm{Cor}^{\mathrm{Hod}}(\sigma(x_0),\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},\sigma(x_n)).$$

As for motivic realisation, it follows that
$$r^{{\mathrm{Hod}}}_{\sigma}\left(\mathrm{Li}^\mathscr{G}_{n_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},n_k}(a_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},a_k)\right)=\mathrm{Li}^{{\mathrm{Hod}}}_{n_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},n_k}(\sigma(a_1),\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},\sigma(a_k))$$
with right-hand side the *Hodge multiple polylogarithms* [@Gon01 §6]
[@Gon19 §11.1.4].

More concretely, the real period construction of Goncharov yields maps
[@Gon19 §1.11]
$$p_{\mathds{R}} \colon {\mathscr{L}}^{\mathrm{Hod}}_n \longrightarrow{\mathds{R}} \qquad \text{for $n \geq 1$},$$
that extract real numbers from Hodge correlators or Hodge multiple
polylogarithms; in the latter case, it yields the values of
generalisations of the Bloch--Wigner dilogarithm, a single-valued
real-valued variant of the dilogarithm [@Gon19 §11.1.3] [@Mal20
Appendix]. One can use these real period maps to show, for example, that
${\mathscr{G}}_n({\mathds{C}})$ is uncountable for $n \geq 1$. In the
sequel [@KRS2] we will use this to give a novel cocycle representing the
Borel regulator class.

### The Rognes rank spectral sequence

Rognes constructed a filtration of the algebraic $K$-theory spectrum
$K(F)$ by rank (that is, dimension) [@Rognes]. An equivalent spectral
sequence was constructed by Galatius, Kupers, and Randal-Williams by
filtering the group completion of ${\mathbf{BGL}}(F)$ [@GKRW18 Section
13.8]. Rationally it takes the form
$$E^1_{n,d} \cong H^{E_\infty}_{n,d}({\mathbf{BGL}}(F)_{\mathds{Q}}) \Longrightarrow K_d(F)_{\mathds{Q}}$$
with $d^r$-differential of bidegree $(-r,-1)$; we call this the *Rognes
rank spectral sequence*. The $E^1$-page looks as in
[1](#fig:gltable1){reference-type="ref+label" reference="fig:gltable1"}
but to use it for computations we use more information (see
[150](#thm:rank-ss-omnibus){reference-type="ref+label"
reference="thm:rank-ss-omnibus"}) obtained from our understanding of the
Goncharov Lie coalgebra:

(i) It is compatible with the splitting induced by a scaling action.

(ii) It is compatible with the duality involution (which gives the Adams
     operation $\psi^{-1}$ on the target $K_*(F)_{\mathds{Q}}$).

(iii) The $d^1$-differential is determined by the part of the Lie
      cobracket on $E_\infty$-homology given by the "$\sigma$-component"
      $$\delta_\sigma \colon H^{E_\infty}_{n,d}({\mathbf{BGL}}(F)_{\mathds{Q}}) \longrightarrow H^{E_\infty}_{n-1,d-1}({\mathbf{BGL}}(F)_{\mathds{Q}}) \otimes {\mathds{Q}}\{\sigma\},$$
      where $\sigma$ denotes the generator of
      $H^{E_\infty}_{1,0}({\mathbf{BGL}}(F)_{\mathds{Q}})$.

(iv) For elements of the $E_\infty$-homology lying on the critical line
     $\mathscr{G}(F)$, (part of) the $\sigma$-component
     $$\delta_\sigma \colon \mathscr{G}(F) \longrightarrow H_2({\mathrm{GL}}_{n-1}(F),{\mathrm{St}}^{\infty}_{n-1}(F)) \otimes {\mathds{Q}}\{\sigma\}$$
     may be expressed in terms of the cobracket
     $\delta: \mathscr{G}(F) \to \Lambda^2 \mathscr{G}(F)$, see
     [6](#sec:sigma-component){reference-type="ref+label"
     reference="sec:sigma-component"}, and hence can be computed using
     our presentation.

The resulting $E^1$- and $E^2$-pages are displayed in
[5](#fig:e1page){reference-type="ref+label" reference="fig:e1page"} and
[6](#fig:e2page){reference-type="ref+label" reference="fig:e2page"} (to
explain the notation in those figures, in the displayed range there is
an isomorphism $H^*({\mathscr{G}}(F))_n \cong H^*(\Gamma_n(F))$ with the
right-hand side the Goncharov's polylogarithmic complex of weight $n$).
Before discussing this spectral sequence more generally, let us first
deduce some concrete consequences. These are limited to low weights, as
this spectral sequence is inconclusive in higher weights because we lack
a good understanding of
$H_*({\mathrm{GL}}_n(F);{\mathrm{St}}^{\infty}_n(F))$ for $* > 1$.

Combining the $E^2$-page and known bounds on the weights, one may prove
[1](#theorem weight 3){reference-type="ref+label"
reference="theorem weight 3"} as follows. Looking at the
$(-1)$-eigenspaces of the duality involution on the $E^2$-page and
discarding the Milnor $K$-theory contribution, the row $d=4$ yields an
isomorphism $$K_4^{(3)}(F)_{{\mathds{Q}}} \cong H^2(\mathscr{G}(F))_3,$$
which is precisely [1](#theorem weight 3){reference-type="ref+label"
reference="theorem weight 3"}
[\[enum:FormulaGoncharovConjecture2\]](#enum:FormulaGoncharovConjecture2){reference-type="eqref"
reference="enum:FormulaGoncharovConjecture2"}. Similarly, the row $d=5$
yields an exact sequence
$$K^{(2)}_{4}(F)_{{\mathds{Q}}}\otimes F^{\times}_{{\mathds{Q}}}
\longrightarrow
K^{(3)}_{5}(F)_{{\mathds{Q}}}
\longrightarrow
H^{1}(\mathscr{G}(F))_3\longrightarrow 0,$$ which is precisely
[1](#theorem weight 3){reference-type="ref+label"
reference="theorem weight 3"}
[\[enum:FormulaGoncharovConjecture3\]](#enum:FormulaGoncharovConjecture3){reference-type="eqref"
reference="enum:FormulaGoncharovConjecture3"}. As we observed in
[1.1.3](#sec:motives-general){reference-type="ref+label"
reference="sec:motives-general"}, the weight $3$ part of the
Chevalley--Eilenberg complex for ${\mathscr{G}}(F)$ agrees with the
weight 3 polylogarithmic complex under the isomorphisms of
[\[thm:polyl-identification\]](#thm:polyl-identification){reference-type="ref+label"
reference="thm:polyl-identification"}, so one may rephrase these results
in terms of the latter.

Observe that if $F$ satisfies $\smash{K^{(2)}_4(F)_{\mathds{Q}}}=0$ as
predicted by the Beilinson--Soulé vanishing conjecture, it follows from
[1](#theorem weight 3){reference-type="ref+label"
reference="theorem weight 3"}
[\[enum:FormulaGoncharovConjecture3\]](#enum:FormulaGoncharovConjecture3){reference-type="eqref"
reference="enum:FormulaGoncharovConjecture3"} that there is an
isomorphism
$\smash{K^{(3)}_{5}(F)_{{\mathds{Q}}} \cong H^{1}(\mathscr{G}(F))_3}$ as
predicted by
[\[conjecture main gamma\]](#conjecture main gamma){reference-type="ref+label"
reference="conjecture main gamma"}. Using localisation sequences, we
prove in
[169](#cor: weight 3 goncharov iff beilinson soule){reference-type="ref+label"
reference="cor: weight 3 goncharov iff beilinson soule"} that the
converse holds as well: if $\smash{K^{(3)}_{5}(F)_{{\mathds{Q}}} \cong
H^{1}(\mathscr{G}(F))_3}$ holds for all fields $F$ then the instance
$\smash{K^{(2)}_4(E)_{\mathds{Q}}}=0$ of the Beilinson--Soulé vanishing
conjecture holds for all fields $E$ too (in fact, this statement holds
characteristic-wise). We further prove that these statements are
equivalent to certain conjectures regarding "homotopy-invariance" for
$B_3(F)_{\mathds{Q}}$.

We return to rank spectral sequences in general. Their use goes back to
Quillen's work on the algebraic $K$-theory groups of rings of integers
[@QuillenFiniteGeneration], but it was Rognes who recognised their
potential for studying algebraic $K$-theory more generally
[@Rognes; @RognesMotivic; @RognesWeight]. Rognes made several
conjectures about his rank spectral sequence for a field. The first is
that there is a relationship between the entry $E^1_{3,5}$ and
trilogarithms, which is provided by our identification of $E^1_{3,5}$ as
${\mathscr{G}}_3(F) \cong B_3(F)_{\mathds{Q}}$ in
[\[thm:polyl-identification\]](#thm:polyl-identification){reference-type="ref+label"
reference="thm:polyl-identification"}. The second is that there is a
slope 2 vanishing line, which was proven by Galatius, Kupers, and
Randal-Williams [@GKRW20] and is a crucial input to the results stated
above. The third is that it collapses at the $E^2$-page---or may even
coincide with the motivic spectral sequence---but in future work we will
use our understanding of this spectral sequence to disprove this.

### Functional equations for multiple polylogarithms {#sec:functional equations}

We next explain how our work sheds light on functional equations for
multiple polylogarithms and their variants.

#### The decomposition relation as universal functional equation

[\[thm:polyl-presentation-additive\]](#thm:polyl-presentation-additive){reference-type="ref+label"
reference="thm:polyl-presentation-additive"} suggests that the
decomposition relation $$\begin{align*}
    &\mathrm{Cor}^\mathscr{G}(x_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n)-\mathrm{Cor}^\mathscr{G}(y_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},y_n)\\
     &=\sum_{\iota=((i_1,j_1),\dots,(i_{n},j_n))\in T(n)}{\mathrm{sign}}(\iota)\,
     \mathrm{Cor}^\mathscr{G}\left(0,\frac{x_{i_1}-x_{j_1}}{y_{i_1}-y_{j_1}},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},\frac{x_{i_n}-x_{j_n}}{y_{i_n}-y_{j_n}}\right),
\end{align*}$$ together with its degenerations is a natural candidate
for the *universal* functional equation for correlators, and hence for
multiple polylogarithms. As discussed in an example above, the case
$n=2$ yields the 5-term relation. For the convenience of the reader, we
spell the decomposition relation in the case $n=3$:

$$\begin{align*}
\mathrm{Cor}^\mathscr{G}&\bigl(x_0,x_1,x_2,x_3\bigr)
-\mathrm{Cor}^\mathscr{G}\bigl(y_0,y_1,y_2,y_3\bigr)\\
&=\mathrm{Cor}^\mathscr{G}\Bigl(
0,
\frac{x_1-x_0}{y_1-y_0},
\frac{x_2-x_0}{y_2-y_0},
\frac{x_3-x_0}{y_3-y_0}
\Bigr)
-\mathrm{Cor}^\mathscr{G}\Bigl(
0,
\frac{x_1-x_0}{y_1-y_0},
\frac{x_2-x_1}{y_2-y_1},
\frac{x_3-x_0}{y_3-y_0}
\Bigr)\\
&+\mathrm{Cor}^\mathscr{G}\Bigl(
0,
\frac{x_2-x_0}{y_2-y_0},
\frac{x_2-x_1}{y_2-y_1},
\frac{x_3-x_0}{y_3-y_0}
\Bigr)
-\mathrm{Cor}^\mathscr{G}\Bigl(
0,
\frac{x_1-x_0}{y_1-y_0},
\frac{x_3-x_0}{y_3-y_0},
\frac{x_2-x_1}{y_2-y_1}
\Bigr)\\
&
+\mathrm{Cor}^\mathscr{G}\Bigl(
0,
\frac{x_1-x_0}{y_1-y_0},
\frac{x_3-x_1}{y_3-y_1},
\frac{x_2-x_1}{y_2-y_1}
\Bigr)
-\mathrm{Cor}^\mathscr{G}\Bigl(
0,
\frac{x_3-x_0}{y_3-y_0},
\frac{x_3-x_1}{y_3-y_1},
\frac{x_2-x_1}{y_2-y_1}
\Bigr)\\
&
-\mathrm{Cor}^\mathscr{G}\Bigl(
0,
\frac{x_1-x_0}{y_1-y_0},
\frac{x_2-x_0}{y_2-y_0},
\frac{x_3-x_2}{y_3-y_2}
\Bigr)
+\mathrm{Cor}^\mathscr{G}\Bigl(
0,
\frac{x_1-x_0}{y_1-y_0},
\frac{x_2-x_1}{y_2-y_1},
\frac{x_3-x_2}{y_3-y_2}
\Bigr)\\
&-\mathrm{Cor}^\mathscr{G}\Bigl(0,\frac{x_2-x_0}{y_2-y_0},
\frac{x_2-x_1}{y_2-y_1},
\frac{x_3-x_2}{y_3-y_2}
\Bigr)
+\mathrm{Cor}^\mathscr{G}\Bigl(0,
\frac{x_2-x_0}{y_2-y_0},
\frac{x_3-x_0}{y_3-y_0},
\frac{x_2-x_1}{y_2-y_1}
\Bigr)\\
&-\mathrm{Cor}^\mathscr{G}\Bigl(0,\frac{x_2-x_0}{y_2-y_0},\frac{x_3-x_2}{y_3-y_2},
\frac{x_2-x_1}{y_2-y_1}\Bigr)
+\mathrm{Cor}^\mathscr{G}\Bigl(0,\frac{x_3-x_0}{y_3-y_0},
\frac{x_3-x_2}{y_3-y_2},
\frac{x_2-x_1}{y_2-y_1}\Bigr)\\
&+\mathrm{Cor}^\mathscr{G}\Bigl(0,
\frac{x_1-x_0}{y_1-y_0},
\frac{x_3-x_0}{y_3-y_0},
\frac{x_3-x_2}{y_3-y_2}
\Bigr)
-\mathrm{Cor}^\mathscr{G}\Bigl(0,
\frac{x_1-x_0}{y_1-y_0},
\frac{x_3-x_1}{y_3-y_1},
\frac{x_3-x_2}{y_3-y_2}
\Bigr)\\
&+\mathrm{Cor}^\mathscr{G}\Bigl(0,
\frac{x_3-x_0}{y_3-y_0},
\frac{x_3-x_1}{y_3-y_1},
\frac{x_3-x_2}{y_3-y_2}
\Bigr).
\end{align*}$$

The decomposition relation is not entirely new: from the viewpoint of
iterated integrals, it is a natural instance of the classical
change-of-variable formalism for iterated integrals. In some sense, it
is the simplest general functional equation for multiple
polylogarithms/iterated integrals/correlators one can write down. To
explain the idea behind it, we work with iterated integrals as
multivalued functions, defined by
$$I_\gamma(a_0;a_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},a_n;a_{n+1})
=
\int_{0\le t_1\le \cdots \le t_n\le 1}
\frac{\gamma'(t_1)\,dt_1}{\gamma(t_1)-a_1}
\cdots
\frac{\gamma'(t_n)\,dt_n}{\gamma(t_n)-a_n}$$ for a path
$\gamma \colon [0,1]\to \mathbb C\setminus\{a_1,\ldots,a_n\}$ with start
point $\gamma(0)=a_0$, end point $\gamma(1)=a_{n+1}$. It is well-known,
e.g. [@Gon01 Theorem 2.1], that the iterated integral
$$I(f_0(t);f_1(t),\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},f_n(t);f_{n+1}(t)) \qquad \text{for rational functions $f_i(t)\in {\mathds{C}}(t)$}$$
can be rewritten, after choosing branches and possibly enlarging the set
of singularities, as a linear combination of hyperlogarithms in the
variable $t$, i.e. of iterated integrals of the form
$$I(a_0;a_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},a_n;t) \qquad \text{for constants $a_0, \ldots,a_{n}$.}$$
This idea has appeared in the literature before, for instance, in the
work of Wojtkowiak [@Wojtkowiak]. The same heuristic applies to
analytic, Hodge, motivic, or formal iterated integrals and correlators.
In ${\mathscr{G}}(F)$, the resulting expansion for
$$\mathrm{Cor}^\mathscr{G}(x_0+y_0t,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n+y_nt)$$
is precisely the decomposition relation upon evaluation at $t=0,1$. For
the formal, Hodge, and motivic realisations, this argument is made
precise in [139](#prop: formal realization){reference-type="ref+label"
reference="prop: formal realization"}.

#### Functional equations for polylogarithms from relations in infinite Steinberg modules

The identification
$$\mathscr{G}_n(F)\cong H_1({\mathrm{GL}}_n(F);{\mathrm{St}}^{\infty}_n(F))$$
gives a new source of functional equations for polylogarithms: every
linear relation among Steinberg correlators gives, after evaluation by a
linear functional, an identity among polylogarithmic correlators. More
precisely, one has the following statement:

::: {#thm:polyl-relations-from-stl-relations .atheorem}
**Theorem 2**. *Let $V$ be an $n$-dimensional vector space over $F$ and
suppose that $$\sum_i a_i\, \mathrm C
   \Bigl[u^{(i)}_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u^{(i)}_n\Bigr]=0
   \qquad\text{in } {\mathrm{St}}^{\infty}(V),$$ where
$a_i\in {\mathds{Q}}$, and where each $u^{(i)}_0,\ldots,u^{(i)}_n$ is an
affine basis of $V$. Then the element $$\sum_i a_i\,
   \mathrm{Cor}^\mathscr{G}\bigl(
      h\bigl(u^{(i)}_0\bigr),\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp},h\bigl(u^{(i)}_n\bigr)
   \bigr)
   \in \mathscr{G}_n(F)$$ is independent of the choice of nonzero linear
functional $h\in V^\vee$. Equivalently, for any two nonzero linear
functionals $h_1,h_2\in V^\vee$, one has the functional equation
$$\sum_i a_i\,
   \mathrm{Cor}^\mathscr{G}\Bigl(
      h_1\bigl(u^{(i)}_0\bigr),\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp},h_1\bigl(u^{(i)}_n\bigr)
   \Bigr)
   =
   \sum_i a_i\,
   \mathrm{Cor}^\mathscr{G}\Bigl(
      h_2\bigl(u^{(i)}_0\bigr),\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp},h_2\bigl(u^{(i)}_n\bigr)
   \Bigr)
   \qquad\text{in } \mathscr{G}_n(F).$$*
:::

The decomposition relation is a special case of
[2](#thm:polyl-relations-from-stl-relations){reference-type="ref+label"
reference="thm:polyl-relations-from-stl-relations"}.

### Acknowledgments {#acknowledgments .unnumbered}

We would like to thank Steven Charlton for helping us to establish the
results of [7.3.3](#section: trilog){reference-type="ref+label"
reference="section: trilog"} with computer-assisted methods. AK would
like to thank Søren Galatius and Oscar Randal-Williams for many helpful
discussions, Max Blans, Thomas Blom, and Gijs Heuts for answering
questions about Koszul duality, Peter Scholze for some conversations
regarding Goncharov's programme, and Elden Elmanto and Nick Rozenblyum
for answering questions about algebraic $K$-theory and higher category
theory. DR would like to thank Danylo Radchenko for numerous helpful
discussions; in particular, regarding the results in
[8.2](#section: duality computation){reference-type="ref+label"
reference="section: duality computation"}. DR would also like to thank
Alexander Beilinson, Clément Dupont, Søren Galatius, Alexander
Goncharov, Richard Hain, David Kazhdan, Jeremy Miller, and Peter Patzt
for many helpful discussions. IS would like to thank Oscar
Randal-Williams for many helpful conversations.

AK acknowledges the support of the Natural Sciences and Engineering
Research Council of Canada (NSERC) \[funding reference number 512156 and
512250\]. DR was supported by NSF grant DMS-2502729.

## Steinberg modules

In this section we will define the Steinberg modules as well as the
double and infinite variants that appeared in
[@GKRW20; @CharltonRadchenkoRudenko]. Our definitions will be in terms
of Koszul duality, clarifying the algebraic structures present on these
objects, followed by descriptions in terms of presentations. We next
discuss the "almost bases" for ${\mathrm{St}}^{\infty}(V)$ mentioned in
the introduction and the corresponding decomposition operators. Finally,
with an eye towards the computation of the cobracket on the Goncharov
Lie coalgebra, we give (a) consequences of a duoidal Eckmann--Hilton
argument for the coproduct on double Steinberg modules
([13](#lem:sth-coproduct-symmetry){reference-type="ref+label"
reference="lem:sth-coproduct-symmetry"}) and the cobracket on infinite
Steinberg modules
([20](#lem:stl-cobracket-vanishing){reference-type="ref+label"
reference="lem:stl-cobracket-vanishing"}), and (b) a lift of the
coproduct on Steinberg modules to the coLie cobar complex of
${{{\mathscr{S}}{\mathrm{t}}}^\infty}$
([2.7](#sec:lift-coproduct){reference-type="ref+label"
reference="sec:lift-coproduct"}).

::: {#conv:shorter-notation .convention}
**Convention 1**. We fix a field $F$ and suppress it from the notation
unless there is a risk of confusion, e.g. write ${\mathrm{GL}}_n$ for
${\mathrm{GL}}_n(F)$. We work with rational coefficients and suppress
this from the notation unless there is a risk of confusion, e.g. write
$H_*(-)$ for $H_*(-;{\mathds{Q}})$.
:::

### The Levi and parabolic tensor products

Before we can state the definitions of the Steinberg modules and their
variants, we need to define several categories with additional
structure.

Let ${\mathrm{Vect}}$ be the 1-category whose objects are
finite-dimensional vector spaces over $F$ and whose morphisms are
isomorphisms. It admits a symmetric monoidal structure by direct sum. It
also admits a second "flag sum" promonoidal structure (a notion going
back to [@Day Section 3], where it was called a "premonoidal" structure)
given as follows: the $k$-fold iterated tensor product for $k \geq 0$ is
given by a profunctor (recall a profunctor
$A \mathrel{\mathpalette\superimpose{{\to}{\shortmid}}}B$ is a functor
$A \times B^{\mathrm{op}}\to {\mathrm{Set}}$) $$\begin{align*}
 \obackslash_k \colon {\mathrm{Vect}}^k  &\mathrel{\mathpalette\superimpose{{\longrightarrow}{\shortmid}}}{\mathrm{Vect}}\\
(V_1,\ldots,V_k,W) &\longmapsto \left\{\text{\parbox[c]{8cm}{\centering flags of subspaces $0 = W_0 \subseteq W_1 \subseteq \cdots \subseteq W_k = W$ with identifications $W_i/W_{i-1} \cong V_i$}}\right\},
\end{align*}$$ where by convention $V_0 = 0$. Note for $k=2$ this is the
same as the set of short exact sequences $0 \to V_1 \to W \to V_2 \to 0$
and for $k=0$ this assigns to $W \in {\mathrm{Vect}}$ the empty set
unless $W \cong 0$ in which case it assigns a singleton.

For comparison, "direct sum" considered as a promonoidal structure has
$k$-fold iterated tensor product for $k \geq 0$ given by a profunctor
$$\begin{align*}
 \oplus_k \colon {\mathrm{Vect}}^k &\mathrel{\mathpalette\superimpose{{\longrightarrow}{\shortmid}}}{\mathrm{Vect}}\\
(V_1,\ldots,V_k,W) &\longmapsto \left\{\text{\parbox[c]{6cm}{\centering injections $V_i \to W$ so that the map $V_1 \oplus \cdots \oplus V_k \to W$ is an isomorphism}}\right\}.
\end{align*}$$ Note that this has the same monoidal unit as "flag sum":
for $k=0$ this assigns $W \in {\mathrm{Vect}}$ the empty set unless
$W \cong 0$ in which case it assigns a singleton.

The identity lifts to a unital lax promonoidal functor from direct sum
to flag sum. The natural transformations of this lax promonoidality are
given by sending an ordered collection of summands
$V_1,\ldots,V_k \subseteq W$ to the flag
$0\subseteq {\mathrm{im}}(V_1) \subseteq \cdots \subset {\mathrm{im}}(V_1 \oplus \cdots \oplus V_{k-1}) \subseteq {\mathrm{im}}(V_1 \oplus \cdots \oplus V_k) = W$
with standard identifications.

Moreover, we can assemble both to the structure of a normal
$(E_\infty,E_1)$-produoidal category
$({\mathrm{Vect}},\oplus,\obackslash)$ (see
[172](#def:duoidal){reference-type="ref+label"
reference="def:duoidal"}); it has a promonoidal structure $\obackslash$
and a symmetric promonoidal structure $\oplus$ sharing the same units,
related by a pronatural interchange natural transformation (see
[\[eqn:duoidal-zeta\]](#eqn:duoidal-zeta){reference-type="eqref"
reference="eqn:duoidal-zeta"}). The latter has components
$$(U_1 \obackslash U_2) \oplus (V_1 \obackslash V_2) \longrightarrow(U_1 \oplus V_1) \obackslash (U_2 \oplus V_2)$$
that are given, upon mapping into $W$, by the map sending a sum of short
exact sequences
$(0 \to U_1 \to W_1 \to U_2 \to 0) \oplus (0 \to V_1 \to W_2 \to V_2 \to 0)$
with $W_1 \oplus W_2 = W$ to the short exact sequence
$0 \to (U_1 \oplus V_1) \to W \to (U_2 \oplus V_2) \to 0$. By taking
$U_2 = 0 = V_1$ one recovers the aforementioned binary natural
transformation of lax promonoidality on the identity functor: the
identity is a lax functor of produoidal $(E_\infty,E_1)$-categories
$({\mathrm{Vect}},\oplus,\oplus) \to ({\mathrm{Vect}},\oplus,\obackslash)$
in the sense of [@BataninMarkl Definition 2.10].

The category of functors from a symmetric (pro)monoidal category to a
presentable symmetric monoidal category admits a Day convolution tensor
product and this generalises to the produoidal setting (see
[11.2](#sec:day){reference-type="ref+label" reference="sec:day"}). Thus
we can make the following definition:

::: definition
**Definition 2**. Let ${\mathscr{C}}$ be a presentable symmetric
monoidal category.

1.  Direct sum induces through Day convolution a *Levi tensor product*
    $$\boxplus\colon {\mathrm{Fun}}({\mathrm{Vect}},{\mathscr{C}}) \times {\mathrm{Fun}}({\mathrm{Vect}},{\mathscr{C}}) \longrightarrow{\mathrm{Fun}}({\mathrm{Vect}},{\mathscr{C}}).$$

2.  Flag sum induces through Day convolution a *parabolic tensor
    product*
    $$\boxbackslash\colon {\mathrm{Fun}}({\mathrm{Vect}},{\mathscr{C}}) \times {\mathrm{Fun}}({\mathrm{Vect}},{\mathscr{C}}) \longrightarrow{\mathrm{Fun}}({\mathrm{Vect}},{\mathscr{C}}).$$
:::

These assemble to an $(E_\infty,E_1)$-duoidal category
$({\mathrm{Fun}}({\mathrm{Vect}},{\mathscr{C}}),\boxplus,\boxbackslash)$
and the identity lifts to a lax monoidal functor
${\mathrm{id}}\colon ({\mathrm{Fun}}({\mathrm{Vect}},{\mathscr{C}}),\boxplus) \to ({\mathrm{Fun}}({\mathrm{Vect}},{\mathscr{C}}),\boxbackslash)$
with associated natural transformation
${\overline{\zeta}} \colon X \boxplus Y \to X \boxbackslash Y$: here we
have used that in this case the map ${\overline{\zeta}}$ (see
[\[eqn:duoidal-ol-ul-zeta\]](#eqn:duoidal-ol-ul-zeta){reference-type="eqref"
reference="eqn:duoidal-ol-ul-zeta"}) obtained from the interchange
transformation is part of a lax monoidality on the identity.

::: {#exam:levi-para-explicit-formulas .example}
*Example 3*. Explicit formulas are given by $$\begin{align*}
(X \boxplus Y)(F^n) &\simeq \bigsqcup_{k=0}^n {\mathrm{Ind}}^{{\mathrm{GL}}_n(F)}_{{\mathrm{GL}}_k(F) \times {\mathrm{GL}}_{n-k}(F)} \left(X(F^k) \otimes_{\mathscr{C}} Y(F^{n-k})\right) \\
(X \boxbackslash Y)(F^n) &\simeq \bigsqcup_{k=0}^n {\mathrm{Ind}}^{{\mathrm{GL}}_n(F)}_{{\mathrm{P}}_{n,k}(F)} \left(X(F^k) \otimes_{\mathscr{C}} Y(F^{n-k})\right)
\end{align*}$$ where ${\mathrm{P}}_{n,k}(F) \subset {\mathrm{GL}}_n(F)$
is the parabolic subgroup that preserves the flag $F^k \subset F^n$ and
${\mathrm{GL}}_k(F) \times {\mathrm{GL}}_{n-k}(F) \subset {\mathrm{GL}}_n(F)$
is the Levi subgroup that preserves the splitting
$F^k \oplus F^{n-k} = F^n$. The map ${\overline{\zeta}}$ is induced in
terms of the above formulas by the inclusion
${\mathrm{GL}}_k(F) \times {\mathrm{GL}}_{n-k}(F) \subset {\mathrm{P}}_{n,k}(F)$.
:::

Recall that $E_\infty^{\mathrm{u}}$ denotes the unital $E_\infty$-operad
(see [204](#def:einfty){reference-type="ref+label"
reference="def:einfty"}), whose algebras are unital $E_\infty$-algebras.
In the duoidal category
$({\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{S}}{\mathrm{pc}}}),\boxplus,\boxbackslash)$,
one may use the interchange natural transformation $\zeta$ to endow the
category of $E^{\mathrm{u}}_\infty$-algebras with respect to the Levi
tensor product $\boxplus$ with a parabolic tensor product that we will
also denote $\boxbackslash$. Informally, for a presentable category
${\mathscr{C}}$ and
${\mathbf{A}},{\mathbf{B}} \in {\mathrm{Alg}}_{E^{\mathrm{u}}_\infty,\boxplus}({\mathrm{Fun}}({\mathrm{Vect}}),{\mathscr{C}})$,
we have that ${\mathbf{A}} \boxbackslash{\mathbf{B}}$ is again an
$E^{\mathrm{u}}_\infty$-algebra whose product is given by
$$({\mathbf{A}} \boxbackslash{\mathbf{B}}) \boxplus({\mathbf{A}} \boxbackslash{\mathbf{B}}) \overset{\zeta}\longrightarrow({\mathbf{A}} \boxplus{\mathbf{A}}) \boxbackslash({\mathbf{B}} \boxplus{\mathbf{B}}) \longrightarrow{\mathbf{A}} \boxbackslash{\mathbf{B}}.$$
Precisely, there is a monoidal structure on
${\mathrm{Alg}}_{E^{\mathrm{u}}_\infty,\boxplus}({\mathrm{Fun}}({\mathrm{Vect}},{\mathscr{C}}))$
so that the forgetful functor is symmetric monoidal [@ToriiMult
Definition 3.7]. We can thus define the category of
*$(E_\infty,E_1)$-algebras* as
${\mathrm{Alg}}_{E_1^u,\boxbackslash}({\mathrm{Alg}}_{E_\infty^{\mathrm{u}},\boxplus}({\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{S}}{\mathrm{pc}}})))$;
this is a mild generalisation of [@ToriiDuoidal Section 6.3] in the
setting of [@ToriiHigher] (see [@ToriiMult Section 3] for a summary).

### Steinberg modules and higher variants {#sec:steinberg-modules-defs}

We now define the Steinberg modules and their variants, through Koszul
duality. For our purposes it is sufficient to specialise the previous
discussion to rational chain complexes by taking
${\mathscr{C}} = {{\mathscr{D}}_{\mathds{Q}}}$, the derived category of
${\mathds{Q}}$ obtained by inverting the quasi-isomorphisms on the
1-category ${\mathrm{Ch}}_{\mathds{Q}}$ of chain complexes over
${\mathds{Q}}$. Note that it contains the category
${\mathrm{GrMod}}_{\mathds{Q}}$ of graded vector spaces over
${\mathds{Q}}$ as a full subcategory. The category
${{\mathscr{D}}_{\mathds{Q}}}$ has a symmetric monoidal structure given
by tensor product, and using the Day convolution construction we obtain
a $(E_\infty,E_1)$-duoidal category
${\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{D}}_{\mathds{Q}}})$.

The constant functor ${\underline{{\mathds{Q}}}}$ admits the structure
of an $(E^{\mathrm{u}}_\infty,E^{\mathrm{u}}_1)$-algebra in
${\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{D}}_{\mathds{Q}}})$. To see
this, recall that
$C_*(-;{\mathds{Q}}) \colon {{\mathscr{S}}{\mathrm{pc}}}\to {{\mathscr{D}}_{\mathds{Q}}}$
is symmetric monoidal, and construct ${\mathds{Q}}$ as the image under
the induced functor $$\begin{align*}
 C_*(-;{\mathds{Q}})^{\mathrm{Alg}}\colon {\mathrm{Alg}}_{E^{\mathrm{u}}_1,\boxbackslash}({\mathrm{Alg}}_{E^{\mathrm{u}}_\infty,\boxplus}({\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{S}}{\mathrm{pc}}}))) &\longrightarrow{\mathrm{Alg}}_{E^{\mathrm{u}}_1,\boxbackslash}({\mathrm{Alg}}_{E^{\mathrm{u}}_\infty,\boxplus}({\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{D}}_{\mathds{Q}}}))) \\
{\mathbf{A}} &\longmapsto C_*({\mathbf{A}};{\mathds{Q}})
\end{align*}$$ of ${\underline{\ast}}$, which as a terminal object has a
unique lift to an $(E^{\mathrm{u}}_\infty,E^{\mathrm{u}}_1)$-algebra. As
${\underline{\ast}}$ is given by the terminal object on the zero vector
space, it admits a unique augmentation, inducing an augmentation on
${\mathds{Q}}$.

We will first phrase Koszulity properties in terms of iterated bar
constructions (see
[13.2.2](#sec:iterated-bar-constructions){reference-type="ref+label"
reference="sec:iterated-bar-constructions"}), though at the end of this
subsection we will rephrase them in terms of indecomposables (see
[12.2.3](#sec:bar-cobar-operads-algebras){reference-type="ref+label"
reference="sec:bar-cobar-operads-algebras"}). Our first Koszulity
property is the following: as an augmented $E^{\mathrm{u}}_1$-algebra
with respect to $\boxbackslash$, ${\underline{{\mathds{Q}}}}$ is Koszul
in the sense that $$\begin{equation}
\label{hyp:ast-koszul}H_*({\mathrm{Bar}}_{\boxbackslash}({\underline{{\mathds{Q}}}})(V)) = 0 \qquad \text{unless $* = \dim(V)$.}
\end{equation}$$ This is equivalent to the Solomon--Tits theorem: the
bar construction in
[\[hyp:ast-koszul\]](#hyp:ast-koszul){reference-type="eqref"
reference="hyp:ast-koszul"} is *isomorphic* to the reduced simplicial
chains of the double simplicial suspension of the Tits building
$T(F^n)$, see [60](#cor:koszul-st){reference-type="ref+label"
reference="cor:koszul-st"}. Recalling that ${\underline{{\mathds{Q}}}}$
is an augmented $(E^{\mathrm{u}}_\infty,E^{\mathrm{u}}_1)$-algebra, by
[207](#lem:bar-underlying){reference-type="ref+label"
reference="lem:bar-underlying"} there is a preferred lift of its bar
construction to
$${\mathrm{Bar}}_{\boxbackslash}({\underline{{\mathds{Q}}}}) \in {\mathrm{coAlg}}^{\mathrm{aug}}_{E_1^{\mathrm{u}},\boxbackslash}({\mathrm{Alg}}^{\mathrm{aug}}_{E_\infty^{\mathrm{u}},\boxplus}({\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{D}}_{\mathds{Q}}}))).$$
For now, we forget the $E^{\mathrm{u}}_1$-coalgebra structure, retaining
only the $E^{\mathrm{u}}_\infty$-algebra structure. Our second Koszulity
property is the following: as an augmented $E_1^{\mathrm{u}}$-algebra
with respect to $\boxplus$,
${\mathrm{Bar}}_{\boxbackslash}({\underline{{\mathds{Q}}}})$ is Koszul
as an $E_1^{\mathrm{u}}$-algebra: $$\begin{equation}
\label{hyp:st-koszul} H_*({\mathrm{Bar}}_\boxplus({\mathrm{Bar}}_{\boxbackslash}({\underline{{\mathds{Q}}}}))(V)) = 0 \text{ unless $* = 2\,\dim(V)$}.
\end{equation}$$ This was proven in [@MNP], [@MPW23], and
[@CharltonRadchenkoRudenko], see
[60](#cor:koszul-st){reference-type="ref+label"
reference="cor:koszul-st"} for the middle proof though we will use the
latter in [@KRS2]: by the proof of [@CharltonRadchenkoRudenko Theorem
18] there is an isomorphism of chain complexes
$B^{\mathrm{As}}({{\mathscr{S}}{\mathrm{t}}}) \cong C_*(T(F^n);{\mathds{Q}}) \otimes {\mathrm{St}}_n(F)$
up to a grading shift, with left side as in
[211](#def:bar-as){reference-type="ref+label" reference="def:bar-as"},
and the result follows from the Solomon--Tits theorem.

Over ${\mathds{Q}}$, the commutative bar complex
$B^{\mathrm{Com}}({{\mathscr{S}}{\mathrm{t}}})$ is a summand of the
associative bar complex $B^{\mathrm{As}}({{\mathscr{S}}{\mathrm{t}}})$
by [218](#prop:barr-splitting){reference-type="ref+label"
reference="prop:barr-splitting"} and it follows that
${\mathrm{Bar}}_{\boxbackslash}({\underline{{\mathds{Q}}}})$ is also
Koszul as an $E_\infty^{\mathrm{u}}$-algebra:
$$\mathop{\mathrm{colim}}_{k \to \infty} H_*(\Sigma^{-k+1} {\mathrm{Bar}}^k_\boxplus({{\mathscr{S}}{\mathrm{t}}})(V)) = 0 \text{ unless $* = 2\dim(V)$}.$$
In fact, the left side is given by the indecomposables of
$H_*({\mathrm{Bar}}_\boxplus({\mathrm{Bar}}_{\boxbackslash}({\underline{{\mathds{Q}}}}))(V))$
with respect to the remaining product structure.

::: definition
**Definition 4**. The *Steinberg modules* are defined as
$$\begin{align*}
{{\mathscr{S}}{\mathrm{t}}}&\coloneq H_*({\mathrm{Bar}}_{\boxbackslash}({\underline{{\mathds{Q}}}})) \in {\mathrm{Fun}}({\mathrm{Vect}},{\mathrm{GrMod}}_{\mathds{Q}}).\\
\intertext{The \emph{double Steinberg modules} are defined as}
        {{{\mathscr{S}}{\mathrm{t}}}^2}&\coloneq H_*({\mathrm{Bar}}_\boxplus({{\mathscr{S}}{\mathrm{t}}})) \in {\mathrm{Fun}}({\mathrm{Vect}},{\mathrm{GrMod}}_{\mathds{Q}}).\\
\intertext{The \emph{infinite Steinberg modules} are defined as}
        {{{\mathscr{S}}{\mathrm{t}}}^\infty}&\coloneq \mathop{\mathrm{colim}}_{k \to \infty} H_{*-k+1}({\mathrm{Bar}}^k_\boxplus({{\mathscr{S}}{\mathrm{t}}}))\in {\mathrm{Fun}}({\mathrm{Vect}},{\mathrm{GrMod}}_{\mathds{Q}}).
\end{align*}$$
:::

::: remark
*Remark 5*. It would have been equivalent to define
${{\mathscr{S}}{\mathrm{t}}}$, ${{{\mathscr{S}}{\mathrm{t}}}^2}$, and
${{{\mathscr{S}}{\mathrm{t}}}^\infty}$ as objects in the
${\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{D}}_{\mathds{Q}}})$ instead,
as lying in
${\mathrm{Fun}}({\mathrm{Vect}},{\mathrm{GrMod}}_{\mathds{Q}})$ is a
property. We have opted for the latter to stress that we are in a case
where the Koszulity hypotheses
[\[hyp:ast-koszul\]](#hyp:ast-koszul){reference-type="eqref"
reference="hyp:ast-koszul"} and
[\[hyp:st-koszul\]](#hyp:st-koszul){reference-type="eqref"
reference="hyp:st-koszul"} hold.
:::

::: notation
**Notation 6**. For $V \in {\mathrm{Vect}}$ we define
${\mathrm{GL}}(V)$-representations over ${\mathds{Q}}$ $$\begin{align*}
{\mathrm{St}}(V) &\coloneq H_{\dim(V)}({\mathrm{Bar}}_{\boxbackslash}({\underline{{\mathds{Q}}}})(V))\\
{\mathrm{St}}^{2}(V) &\coloneq H_{2\dim(V)}({\mathrm{Bar}}_\boxplus({{\mathscr{S}}{\mathrm{t}}})(V)) \\
{\mathrm{St}}^{\infty}(V) &\coloneq \mathop{\mathrm{colim}}_{k \to \infty} H_{2\dim(V)-k+1}({\mathrm{Bar}}^k_\boxplus({{\mathscr{S}}{\mathrm{t}}})(V)).
\end{align*}$$ Note that these are *not* graded, and if we do want to
consider them as graded, ${\mathrm{St}}(V)$ must be placed in grading
$\dim(V)$, and ${\mathrm{St}}^{2}(V)$ and ${\mathrm{St}}^{\infty}(V)$ in
grading $2\,\dim(V)$. We will also use the abbreviation
$${\mathrm{St}}_n(F) \coloneq {\mathrm{St}}(F^n), \quad {\mathrm{St}}^{2}_n(F) \coloneq {\mathrm{St}}^{2}(F^n), \quad \text{and} \quad {\mathrm{St}}^{\infty}_n(F) \coloneq {\mathrm{St}}^{\infty}(F^n).$$
:::

::: remark
*Remark 7*. Let us spell out the case $V = 0$. There are preferred
identifications ${\mathrm{St}}(0) \cong {\mathds{Q}}$ and
${\mathrm{St}}^{2}(0) \cong {\mathds{Q}}$, and
${\mathrm{St}}^{\infty}(0) = 0$. Occasionally we will need to pass to
the subobjects
$${{\mathscr{S}}{\mathrm{t}}}_{>0} \subset {{\mathscr{S}}{\mathrm{t}}}\quad \text{and} \quad {{\mathscr{S}}{\mathrm{t}}}^2_{>0}  \subset {{{\mathscr{S}}{\mathrm{t}}}^2}$$
which differ only in that their value on $V=0$ is now equal to $0$;
these are the augmentation ideals for augmentations to be discussed
later.
:::

Using [206](#thm:indec-is-bar){reference-type="ref+label"
reference="thm:indec-is-bar"} these can also be described in terms of
indecomposables $$\begin{align*}
{{\mathscr{S}}{\mathrm{t}}}&\simeq (\Sigma\, {\mathrm{indec}}_{E_1^{\mathrm{nu}}}({\underline{{\mathds{Q}}}}_{>0}))^+ \\
{{{\mathscr{S}}{\mathrm{t}}}^2}&\simeq (\Sigma\, {\mathrm{indec}}_{E_1^{\mathrm{nu}}}({{\mathscr{S}}{\mathrm{t}}}_{>0}))^+ \\
{{{\mathscr{S}}{\mathrm{t}}}^\infty}&\simeq (\Sigma\, {\mathrm{indec}}_{E_\infty^{\mathrm{nu}}}({{\mathscr{S}}{\mathrm{t}}}_{>0})),
\end{align*}$$ where $(-)^+$ denotes unitalisation (see
[12.1.3](#sec:augmentation-ideals){reference-type="ref+label"
reference="sec:augmentation-ideals"}). To see this, recall that a
$t$-structure allows one to talk about the connectivity of objects and
that functor categories inherit $t$-structures from the standard
$t$-structure on ${{\mathscr{D}}_{\mathds{Q}}}$, once we fix a function
specifying how connected the value of a functor should be at each object
of ${\mathrm{Vect}}$; in [@GKRW18] such a function was called an
*abstract connectivity*. In our case it will be convenient to consider
the $t$-structure specified by the function
$c_0 \colon {\mathrm{ob}}({\mathrm{Vect}}) \to [-\infty,\infty]$ given
by $c_0(0) = 0$ and $c_0(V) = -\infty$ for $V \neq 0$. This is
left-compatible with respect to either (symmetric) monoidal structure,
i.e. a Levi or parabolic tensor product of $c_0$-connective functors is
$c_0$-connective; consequently, $c_0$-connected objects have a
well-behaved theory of Koszul duality. This allows us to apply Koszul
duality results [199](#thm:kd-connected){reference-type="ref+label"
reference="thm:kd-connected"} and
[206](#thm:indec-is-bar){reference-type="ref+label"
reference="thm:indec-is-bar"} to identify, up to suspensions, bar
constructions with the unitalisations of indecomposables, in case of the
$c_0$-connected nonunital algebras ${\underline{{\mathds{Q}}}}_{>0}$ and
${{\mathscr{S}}{\mathrm{t}}}_{>0}$.

### Steinberg modules

We now discuss in more detail the Steinberg modules, namely algebraic
structures present on them and explicit presentations.

#### Algebraic structures on Steinberg modules

By definition we have
$${{\mathscr{S}}{\mathrm{t}}}= H_*({\mathrm{Bar}}_{\boxbackslash}({\underline{{\mathds{Q}}}})) \qquad \text{with} \qquad {\mathrm{Bar}}_{\boxbackslash}({\underline{{\mathds{Q}}}}) \in {\mathrm{coAlg}}_{E_1^{\mathrm{u}}}({\mathrm{Alg}}_{E_\infty^{\mathrm{u}}}({\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{D}}_{\mathds{Q}}}))).$$
Noting that because we work with rational coefficients there are no
${\mathrm{Tor}}$-terms when we apply the Künneth theorem, we get from a
mild generalization of
[210](#lem:bialgebra-structure){reference-type="ref+label"
reference="lem:bialgebra-structure"} to the duoidal setting:

::: proposition
**Proposition 8**. *The Steinberg modules ${{\mathscr{S}}{\mathrm{t}}}$
come equipped with the structure of a commutative bialgebra in the
normal $(E_\infty,E_1)$-duoidal category
$({\mathrm{Fun}}({\mathrm{Vect}},{\mathrm{GrMod}}_{\mathds{Q}}),\boxplus,\boxbackslash)$.*
:::

Explicitly, this means it has a commutative (in the graded sense,
i.e. using the symmetry in ${\mathrm{GrMod}}_{\mathds{Q}}$ with Koszul
sign) unital associative product and counital coassociative coproduct
$$\mu \colon {{\mathscr{S}}{\mathrm{t}}}\boxplus{{\mathscr{S}}{\mathrm{t}}}\longrightarrow{{\mathscr{S}}{\mathrm{t}}}\qquad \text{and} \qquad \Delta \colon {{\mathscr{S}}{\mathrm{t}}}\longrightarrow{{\mathscr{S}}{\mathrm{t}}}\boxbackslash{{\mathscr{S}}{\mathrm{t}}}$$
so that $\mu$ is a map of coalgebras. This means that the following
diagram commutes
$$\begin{tikzcd} {{\mathscr{S}}{\mathrm{t}}}\boxplus{{\mathscr{S}}{\mathrm{t}}}\rar{\mu} \dar[swap]{\Delta \boxplus\Delta} & {{\mathscr{S}}{\mathrm{t}}}\arrow{dd}{\Delta} \\[-3pt] 
    ({{\mathscr{S}}{\mathrm{t}}}\boxbackslash{{\mathscr{S}}{\mathrm{t}}}) \boxplus({{\mathscr{S}}{\mathrm{t}}}\boxbackslash{{\mathscr{S}}{\mathrm{t}}}) \dar[swap]{\zeta} &  \\[-3pt]
    ({{\mathscr{S}}{\mathrm{t}}}\boxplus{{\mathscr{S}}{\mathrm{t}}}) \boxbackslash({{\mathscr{S}}{\mathrm{t}}}\boxplus{{\mathscr{S}}{\mathrm{t}}}) \rar{\mu \boxbackslash\mu} & {{\mathscr{S}}{\mathrm{t}}}\boxbackslash{{\mathscr{S}}{\mathrm{t}}}.\end{tikzcd}$$
It is worth pointing out a different perspective on this. Recall that we
have an equivalence
$${\mathrm{Bar}}_{\boxbackslash}({\underline{{\mathds{Q}}}}) \simeq \big(\Sigma\,{\mathrm{indec}}_{E_1^{\mathrm{nu}}}({\underline{{\mathds{Q}}}}_{>0})\big)^+ \quad \text{with} \quad {\mathrm{indec}}_{E_1^{\mathrm{nu}}}({\underline{{\mathds{Q}}}}) \in {\mathrm{coAlg}}^{{\mathrm{nil}}}_{BE_1^{\mathrm{nu}}}({\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{D}}_{\mathds{Q}}})))$$
and the latter admits, after suspension, a conilpotent
$E^{\mathrm{nu}}_1$-coalgebra structure as $BE_1^{\mathrm{nu}}$ is
equivalent to the operadic suspension of the linear dual cooperad
$DE_1^{\mathrm{nu}}$.

#### Presentations and formulas for Steinberg modules

We now give a well-known presentation of the Steinberg modules, see
e.g. [@KahnSun Section 1] [@CharltonRadchenkoRudenko Section 3.1].
Recall that an ordered basis $v_1,\ldots,v_n$ of a vector space $V$ of
dimension $n$ gives an *apartment class*
$$[v_1,\ldots,v_n] \in {\mathrm{St}}(V),$$ though it is more convenient
to allow *any* ordered collection $v_1,\ldots,v_n$ of vectors in $V$ and
then set $[v_1,\ldots,v_n]$ to be zero if $v_1,\ldots,v_n$ do not span.
The elements $[v_1,\ldots,v_n] \in {\mathrm{St}}(V)$ satisfy the
following relations

(0) $[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n] = 0$
    if $v_1,\ldots,v_n$ are linearly dependent,

(1) $[v_{\sigma(1)},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_{\sigma(n)}] = (-1)^\sigma[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n]$
    for $\sigma \in {\mathfrak{S}}_n$,

(2) $[\lambda v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n] = [v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n]$
    for $\lambda \in F^\times$,

(3) $\sum_{i=0}^n (-1)^i [v_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},\widehat{v}_i,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n] = 0$
    for an ordered collection of vectors $v_0,\ldots,v_n$ in $V$.

These give a presentation of the Steinberg modules:

::: {#prop:st-explicit-pres .proposition}
**Proposition 9**. *The following map of
${\mathds{Q}}[{\mathrm{GL}}(V)]$-modules is an isomorphism
$$\frac{{\mathds{Q}}[[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n] \text{ for ordered collections $v_1,\ldots,v_n$}]}{\text{(0)--(3)}}\overset{\cong}\longrightarrow{\mathrm{St}}(V).$$*
:::

We can now ask for a description of the product (with respect to
$\boxplus$) and coproduct (with respect to $\boxbackslash$) in terms of
this presentation: this was done in [@AMP; @CharltonRadchenkoRudenko].
To do so, it is convenient to include $V$ in the notation of the
apartment and write
$[V|v_1,\ldots,v_n] \coloneq [v_1,\ldots,v_n] \in {\mathrm{St}}(V)$.

::: {#prop:st-explicit-prod-coprod .proposition}
**Proposition 10**. *With respect to the presentation of
[9](#prop:st-explicit-pres){reference-type="ref+label"
reference="prop:st-explicit-pres"}, the product and coproduct on
${{\mathscr{S}}{\mathrm{t}}}$ are given by $$\begin{equation}
\label{eqn:st-product}\begin{aligned} \mu \colon {\mathrm{St}}(V) \otimes {\mathrm{St}}(W) &\longrightarrow{\mathrm{St}}(V \oplus W) \\
[V|v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n] \otimes [W|w_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},w_{n'}] &\longmapsto [V\oplus W|v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n,w_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},w_{n'}]\end{aligned}
\end{equation}$$ and $$\begin{equation}
\label{eqn:st-coproduct}\begin{aligned} \Delta \colon {\mathrm{St}}(V) &\longrightarrow\bigoplus_{W \subseteq V} {\mathrm{St}}(W) \otimes {\mathrm{St}}(V/W) \\
[V|v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n] &\longmapsto \sum_{I \subseteq {\underline{n}}} (-1)^{\sigma_I} [V_I|v_{i_1},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_{i_k}] \otimes [V/V_I|\overline{v}_{j_1},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},\overline{v}_{j_{n-k}}]\end{aligned}
\end{equation}$$*
:::

Here in the formula
[\[eqn:st-product\]](#eqn:st-product){reference-type="eqref"
reference="eqn:st-product"} for the product, the right vectors in $V$ or
$W$ are to be considered as vectors in $V \oplus W$ through the
inclusion. It follows from relation (1) that
[\[eqn:st-product\]](#eqn:st-product){reference-type="eqref"
reference="eqn:st-product"} is graded-commutative, as we put
${\mathrm{St}}(V)$ in grading $\dim(V)$. The formula
[\[eqn:st-coproduct\]](#eqn:st-coproduct){reference-type="eqref"
reference="eqn:st-coproduct"} for the coproduct should be interpreted as
follows: there are only nonzero terms for $W$ of the form
$V_I \coloneq {\mathrm{span}}(v_{i_1},\ldots,v_{i_k})$ for a subset
$I = \{i_1,\ldots,i_k\}$ (with induced order) and $\overline{v}_j$ for
$j \in I^c$ in its complement (with induced order) denote the projection
of $v_j$ to $V/V_I$. Finally, $\sigma_I$ is the shuffle permutation that
shuffles $I$ to the front of $I^c$ preserving the induced ordering.

::: proof
*Proof of [10](#prop:st-explicit-prod-coprod){reference-type="ref+label"
reference="prop:st-explicit-prod-coprod"}.* We will give two proofs, as
we believe this is clarifying. In the first proof, for the product we
cite [@GKRW20 Lemma 6.8]. For the coproduct, we use that the induced
coproduct and the formula
[\[eqn:st-coproduct\]](#eqn:st-coproduct){reference-type="eqref"
reference="eqn:st-coproduct"} both have the property that they make
${\mathrm{St}}$ into a bialgebra in the normal duoidal category
$({\mathrm{Fun}}({\mathrm{Vect}},{\mathrm{GrMod}}_{\mathds{Q}}),\boxplus,\boxbackslash)$.
As ${{\mathscr{S}}{\mathrm{t}}}$ is generated under products by
${\mathrm{St}}(F) \cong {\mathds{Q}}$ placed in degree 1, and the
product is a homomorphism for the coproduct, it suffices to verify that
the coproducts agree on ${\mathrm{St}}(F)$, which follows from
counitality.

In the second proof, we pass to the 1-category of rational chain
complexes and use [13.3](#sec:ass-algebras){reference-type="ref+label"
reference="sec:ass-algebras"} to obtain an identification
$${{\mathscr{S}}{\mathrm{t}}}\cong H_*({\mathrm{Bar}}_{\boxbackslash}({\underline{{\mathds{Q}}}})) \cong H_*(B^{\mathrm{As}}({\underline{{\mathds{Q}}}}))$$
as a commutative bialgebra in
${\mathrm{Fun}}({\mathrm{Vect}},{\mathrm{GrMod}}_{\mathds{Q}})$.
Unwinding the construction, we recognise that the underlying object of
$B^{\mathrm{As}}({\underline{{\mathds{Q}}}})$ is given by
$V \mapsto \smash{\widetilde{C}_*(D^1(V))}$. By the proof of
[@CharltonRadchenkoRudenko Proposition 25] the shuffle product on this
yields [\[eqn:st-product\]](#eqn:st-product){reference-type="eqref"
reference="eqn:st-product"} in terms of apartments, and similarly by the
discussion following [@CharltonRadchenkoRudenko Proposition 21] the
deconcatenation coproduct on this yields
[\[eqn:st-coproduct\]](#eqn:st-coproduct){reference-type="eqref"
reference="eqn:st-coproduct"} in terms of apartments. ◻
:::

::: remark
*Remark 11*. Koszul duality yields several useful resolutions. Firstly,
the equivalence
${\underline{{\mathds{Q}}}} \simeq \Omega^{\mathrm{As}}_{\boxbackslash}({{\mathscr{S}}{\mathrm{t}}})$,
with right side the cobar construction of
[212](#def:cobar-as){reference-type="ref+label"
reference="def:cobar-as"}, yields upon evaluation at $V$ the following
resolution of ${\mathds{Q}}$ by Steinberg modules: there is a chain
complex
$${\mathrm{St}}(V) \to \bigoplus_{0 \subsetneq V_1 \subsetneq V} {\mathrm{St}}(V_1) \otimes {\mathrm{St}}(V/V_1) \to \cdots \to \bigoplus_{0 \subsetneq V_1 \subsetneq \cdots \subseteq V_{n-1} \subsetneq V} {\mathrm{St}}(V_1) \otimes \cdots \otimes {\mathrm{St}}(V/V_{n-1})$$
with differentials induced by the coproduct, and augmentation to
${\mathds{Q}}$ that is a quasi-isomorphism. (The dual equivalence
${{\mathscr{S}}{\mathrm{t}}}\simeq B^{\mathrm{As}}_{\boxbackslash}({\mathds{Q}})$
is merely the definition of the Steinberg module.) Secondly, one can use
the acyclicity of the twisted tensor products as in [@LodayVallette
Proposition 2.2.13].
:::

### Double Steinberg modules

We now do the same for the double Steinberg modules.

#### Algebraic structure on double Steinberg modules

By definition we have
$${{{\mathscr{S}}{\mathrm{t}}}^2}= H_*({\mathrm{Bar}}_\boxplus({{\mathscr{S}}{\mathrm{t}}})) \qquad \text{and} \qquad {\mathrm{Bar}}_{\boxplus}({{\mathscr{S}}{\mathrm{t}}}) \in {\mathrm{Alg}}^{\mathrm{aug}}_{E_\infty^{\mathrm{u}}}({\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{D}}_{\mathds{Q}}})).$$

::: proposition
**Proposition 12**. *The double Steinberg modules
${{{\mathscr{S}}{\mathrm{t}}}^2}$ comes equipped with the structure of a
commutative bialgebra in the symmetric monoidal category
$({\mathrm{Fun}}({\mathrm{Vect}},{\mathrm{GrMod}}_{\mathds{Q}}),\boxplus)$.*
:::

Explicitly, this means it has a graded-commutative unital associative
product and counital coassociative coproduct
$$\mu^{(2)} \colon {{{\mathscr{S}}{\mathrm{t}}}^2}\boxplus{{{\mathscr{S}}{\mathrm{t}}}^2}\longrightarrow{{{\mathscr{S}}{\mathrm{t}}}^2}\qquad \text{and} \qquad \Delta^{(2)} \colon {{{\mathscr{S}}{\mathrm{t}}}^2}\longrightarrow{{{\mathscr{S}}{\mathrm{t}}}^2}\boxplus{{{\mathscr{S}}{\mathrm{t}}}^2}$$
so that $\mu^{(2)}$ is a map of coalgebras. This means that the
following diagram commutes
$$\begin{tikzcd} {{{\mathscr{S}}{\mathrm{t}}}^2}\boxplus{{{\mathscr{S}}{\mathrm{t}}}^2}\rar{\mu^{(2)}} \dar{\Delta^{(2)} \boxplus\Delta^{(2)}} &[10pt] {{{\mathscr{S}}{\mathrm{t}}}^2}\arrow{dd}{\Delta^{(2)}} \\[-3pt] 
    ({{{\mathscr{S}}{\mathrm{t}}}^2}\boxplus{{{\mathscr{S}}{\mathrm{t}}}^2}) \boxplus({{{\mathscr{S}}{\mathrm{t}}}^2}\boxplus{{{\mathscr{S}}{\mathrm{t}}}^2}) \dar{{\mathrm{id}}\boxplus\sigma \boxplus{\mathrm{id}}} &  \\[-3pt]
    ({{{\mathscr{S}}{\mathrm{t}}}^2}\boxplus{{{\mathscr{S}}{\mathrm{t}}}^2}) \boxplus({{{\mathscr{S}}{\mathrm{t}}}^2}\boxplus{{{\mathscr{S}}{\mathrm{t}}}^2}) \rar{\mu^{(2)} \boxplus\mu^{(2)}} & {{{\mathscr{S}}{\mathrm{t}}}^2}\boxplus{{{\mathscr{S}}{\mathrm{t}}}^2}.\end{tikzcd}$$
As in the previous case, the coalgebra structure also arises through the
equivalence
$${\mathrm{Bar}}_\boxplus({{\mathscr{S}}{\mathrm{t}}}) \simeq \big(\Sigma\,{\mathrm{indec}}_{E_1^{\mathrm{nu}}}({{\mathscr{S}}{\mathrm{t}}}_{>0})\big)^+$$
where
${\mathrm{indec}}_{E_1^{\mathrm{nu}}}({{\mathscr{S}}{\mathrm{t}}}_{>0})$
admits, after a suspension, a conilpotent $E^{\mathrm{nu}}_1$-coalgebra
structure.

In fact, ${{{\mathscr{S}}{\mathrm{t}}}^2}$ admits what at first seems
like additional structure, though we will see momentarily this is
determined by the previous data: a coproduct with respect to
$\boxbackslash$, which is compatible with $\Delta^{(2)}$. As
${{\mathscr{S}}{\mathrm{t}}}$ is an augmented bialgebra, informally its
coproduct
$\Delta \colon {{\mathscr{S}}{\mathrm{t}}}\to {{\mathscr{S}}{\mathrm{t}}}\boxbackslash{{\mathscr{S}}{\mathrm{t}}}$
is a map of augmented commutative algebras and hence induces the left
map in map
$${\mathrm{Bar}}_\boxplus({{\mathscr{S}}{\mathrm{t}}}) \longrightarrow{\mathrm{Bar}}_\boxplus({{\mathscr{S}}{\mathrm{t}}}\boxbackslash{{\mathscr{S}}{\mathrm{t}}}) \longrightarrow{\mathrm{Bar}}_\boxplus({{\mathscr{S}}{\mathrm{t}}}) \boxbackslash{\mathrm{Bar}}_\boxplus({{\mathscr{S}}{\mathrm{t}}})$$
while the right map is induced by $\zeta$ using that $\boxbackslash$
preserves sifted colimits in each entry.

To make this precise, we use a generalisation of
[207](#lem:bar-underlying){reference-type="ref+label"
reference="lem:bar-underlying"} to the duoidal setting: the category
${\mathrm{coAlg}}^{\mathrm{aug}}_{E_1^{\mathrm{u}},\boxbackslash}({\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{D}}_{\mathds{Q}}}))$
admits a symmetric monoidal structure so that the forgetful functor
${\mathrm{fgt}}_{E_1} \colon {\mathrm{coAlg}}_{E_1^{\mathrm{u}}}({\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{D}}_{\mathds{Q}}})) \to {\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{D}}_{\mathds{Q}}})$
is symmetric monoidal [@ToriiMult Proposition 3.10]. As
${\mathrm{fgt}}_{E_1}$ admits a right adjoint given by
${\mathrm{cofree}}_{E_1}$, it preserves colimits and
${\mathrm{Bar}}_\boxplus({{\mathscr{S}}{\mathrm{t}}})$ has a preferred
lift to an object
$${\mathrm{Bar}}_\boxplus({{\mathscr{S}}{\mathrm{t}}}) \in {\mathrm{coAlg}}^{\mathrm{aug}}_{E_1^{\mathrm{u}},\boxplus}({\mathrm{Alg}}^{\mathrm{aug}}_{E_\infty^{\mathrm{u}}}({\mathrm{coAlg}}^{\mathrm{aug}}_{E_1^{\mathrm{u}},\boxbackslash}({\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{D}}_{\mathds{Q}}})))).$$
Forgetting the algebra structure and passing to homology, we get on
${{{\mathscr{S}}{\mathrm{t}}}^2}$ a counital coassociative coproduct,
which we will also denote $\Delta$, compatible with $\Delta^{(2)}$ in
the sense that the following diagram commutes:
$$\begin{tikzcd} {{{\mathscr{S}}{\mathrm{t}}}^2}\rar{\Delta^{(2)}} \arrow{dd}{\Delta} &[20pt] {{{\mathscr{S}}{\mathrm{t}}}^2}\boxplus{{{\mathscr{S}}{\mathrm{t}}}^2}\dar{\Delta \boxplus\Delta} \\[-3pt]
& ({{{\mathscr{S}}{\mathrm{t}}}^2}\boxbackslash{{{\mathscr{S}}{\mathrm{t}}}^2}) \boxplus({{{\mathscr{S}}{\mathrm{t}}}^2}\boxbackslash{{{\mathscr{S}}{\mathrm{t}}}^2}) \dar{\zeta} \\[-3pt]
{{{\mathscr{S}}{\mathrm{t}}}^2}\boxbackslash{{{\mathscr{S}}{\mathrm{t}}}^2}\rar{\Delta^{(2)} \boxbackslash\Delta^{(2)}} & ({{{\mathscr{S}}{\mathrm{t}}}^2}\boxplus{{{\mathscr{S}}{\mathrm{t}}}^2}) \boxbackslash({{{\mathscr{S}}{\mathrm{t}}}^2}\boxplus{{{\mathscr{S}}{\mathrm{t}}}^2}).\end{tikzcd}$$
This provides the input for the duoidal Eckmann--Hilton argument of
[175](#cor:duoidal-eh-sym){reference-type="ref+label"
reference="cor:duoidal-eh-sym"} and we conclude that this additional
structure is determined by $\Delta^{(2)}$ as
$\overline{\zeta} \circ \Delta^{(2)} = \Delta = \overline{\zeta} \circ \sigma \circ \Delta^{(2)}$.
Let us record the consequence for $\Delta^{(2)}$:

::: {#lem:sth-coproduct-symmetry .lemma}
**Lemma 13**. *The coproduct
[\[eqn:sth-coproduct\]](#eqn:sth-coproduct){reference-type="eqref"
reference="eqn:sth-coproduct"} on ${{{\mathscr{S}}{\mathrm{t}}}^2}$ has
the following symmetry property:
$$\overline{\zeta} \circ \Delta^{(2)} = \overline{\zeta} \circ \sigma \circ \Delta^{(2)}.$$*
:::

#### Presentations and formulas for double Steinberg modules

We will next give a presentation of ${{{\mathscr{S}}{\mathrm{t}}}^2}$,
and describe the product and coproduct in terms of this presentation.
The outlined proof of Koszulity for Steinberg modules induces an
isomorphism
$${{{\mathscr{S}}{\mathrm{t}}}^2}\overset{\cong}\longrightarrow{{\mathscr{S}}{\mathrm{t}}}\odot {{\mathscr{S}}{\mathrm{t}}}$$
where $\odot$ denotes the pointwise tensor product (also known as the
Hadamard tensor product). We hence obtain from the presentation for
${{\mathscr{S}}{\mathrm{t}}}$ in
[9](#prop:st-explicit-pres){reference-type="ref+label"
reference="prop:st-explicit-pres"} a presentation for
${{{\mathscr{S}}{\mathrm{t}}}^2}$, simply by taking a tensor product.
For example, for $n=3$, it is generated by pairs of triangles in the
projective space $\mathbb{P}^2(F)$: $$\begin{tikzpicture}
\draw (0,0) -- (-1,4) -- (3,2) -- cycle;
\node at (0,0) [left] {$v_3$};
\node at (-1,4) [left] {$v_2$};
\node at (3,2) [right] {$v_1$};
\node at (1,0) [right] {$w_1$};
\node at (-1.5,2) [left] {$w_2$};
\node at (1.5,3.5) [right] {$w_3$};
\draw (1,0) -- (-1.5,2) -- (1.5,3.5) --cycle;
\end{tikzpicture}$$ With respect to this, the explicit formulas for the
product and coproduct were determined in [@CharltonRadchenkoRudenko
Section 3.3] in terms of those in
[10](#prop:st-explicit-prod-coprod){reference-type="ref+label"
reference="prop:st-explicit-prod-coprod"}:

::: {#prop:sth-explicit-prod-coprod .proposition}
**Proposition 14**. *With respect to the presentation induced by
[9](#prop:st-explicit-pres){reference-type="ref+label"
reference="prop:st-explicit-pres"}, the product and coproduct on
${{{\mathscr{S}}{\mathrm{t}}}^2}$ are given by $$\begin{equation}
\label{eqn:sth-product}\begin{aligned} \mu^{(2)} \colon {\mathrm{St}}^{2}(V) \otimes {\mathrm{St}}^{2}(W) &\longrightarrow{\mathrm{St}}^{2}(V \oplus W) \\
(a \otimes a') \otimes (b \otimes b') &\longmapsto \mu(a\otimes b) \otimes \mu(a' \otimes b') \end{aligned}
\end{equation}$$ and $$\begin{equation}
\label{eqn:sth-coproduct}\begin{aligned} \Delta^{(2)} \colon {\mathrm{St}}^{2}(V) &\longrightarrow\bigoplus_{V = V_1 \oplus V_2} {\mathrm{St}}^{2}(V_1) \otimes {\mathrm{St}}^{2}(V_2) \\
a \otimes a' &\longmapsto \Psi(\Delta(a) \otimes \tau\Delta(a')).\end{aligned}
\end{equation}$$*
:::

::: remark
*Remark 15*. Observe that
[\[eqn:sth-product\]](#eqn:sth-product){reference-type="eqref"
reference="eqn:sth-product"} from [@CharltonRadchenkoRudenko Proposition
20] involves no Koszul sign, in contrast with the proof of [@GKRW20
Theorem 6.9]: this is due to how exactly
${{{\mathscr{S}}{\mathrm{t}}}^2}$ is identified with
${{\mathscr{S}}{\mathrm{t}}}\odot {{\mathscr{S}}{\mathrm{t}}}$, and
these references differ by multiplication with $(-1)^{n(n-1)/2}$ in
degree $2n$.
:::

Here, first, $\Psi$ is the transformation
$$(A \boxbackslash B) \odot (C \boxbackslash D) \longrightarrow(A \odot C) \boxplus(B \odot D)$$
given on subspaces $V_1,V_2 \subseteq V$ by the zero map unless
$V = V_1 \oplus V_2$, where it is given by $$\begin{align*}
A(V_1) \otimes B(V/V_1) \otimes C(V_2) \otimes D(V/V_2) &\longrightarrow A(V_1) \otimes D(V_1) \otimes B(V_2) \otimes C(V_2) \\
a \otimes b \otimes c \otimes d &\longmapsto a \otimes \pi^{-1}_2(d) \otimes \pi^{-1}_1(c) \otimes d,
\end{align*}$$ where $\pi_1 \colon V_1 \to V \to V/V_2$ and
$\pi_2 \colon V_2 \to V \to V/V_1$ are the induced isomorphisms. Second,
$\tau \colon {{\mathscr{S}}{\mathrm{t}}}\boxplus{{\mathscr{S}}{\mathrm{t}}}\to {{\mathscr{S}}{\mathrm{t}}}\boxplus{{\mathscr{S}}{\mathrm{t}}}$
is a sign, given by
$[V|a] \otimes [W|b] \mapsto (-1)^{\dim(V)\dim(W)} [V|a] \otimes [W|b]$.

::: remark
*Remark 16*. This may be part of a "trioidal" structure on
${\mathrm{Fun}}({\mathrm{Vect}},{\mathrm{GrVect}}_{\mathds{Q}})$ but we
will not pursue this further in this paper.
:::

::: proof
*Proof of
[14](#prop:sth-explicit-prod-coprod){reference-type="ref+label"
reference="prop:sth-explicit-prod-coprod"}.* For the coproduct, we
observe that we can compute the bar construction as a *coalgebra* using
the bar complex $B^{\mathrm{As}}({{\mathscr{S}}{\mathrm{t}}})$ (see
[211](#def:bar-as){reference-type="ref+label" reference="def:bar-as"}),
which means that the injection of chain complexes known as the
associative symbol map (see
[2.6](#sec:symbol-maps){reference-type="ref+label"
reference="sec:symbol-maps"})
$$s^{\mathrm{As}} \colon {{{\mathscr{S}}{\mathrm{t}}}^2}\longrightarrow B^{\mathrm{As}}({{\mathscr{S}}{\mathrm{t}}})$$
is one of coalgebras, where the target has the deconcatenation product.
This criterion uniquely determines the formula in
[@CharltonRadchenkoRudenko Proposition 21].

We will give three proofs for the product. For the first proof, we cite
[@GKRW20 Section 6.3]. For the second proof, we use that the product on
$B^{\mathrm{As}}({{\mathscr{S}}{\mathrm{t}}})$ is given by the shuffle
product and this criterion determines the product of
[@CharltonRadchenkoRudenko Proposition 20]. For the third proof, to
determine the product we use that the induced product and the formula
both have the property that, together with the above coproduct, they
make ${{{\mathscr{S}}{\mathrm{t}}}^2}$ into a bialgebra. As the $n$-fold
iterated reduced coproduct
${\mathrm{St}}^{2}(F^n) \to {\mathrm{St}}^{2}(F)^{\boxplus n}$ is
injective and the product is a homomorphism for the coproduct, it
suffices to verify that the products agree on
${\mathrm{St}}^{2}(0) \otimes {\mathrm{St}}^{2}(F)$, which follows from
unitarity. ◻
:::

Note that
[\[eqn:sth-coproduct\]](#eqn:sth-coproduct){reference-type="eqref"
reference="eqn:sth-coproduct"} does not obviously have the symmetry
property of [13](#lem:sth-coproduct-symmetry){reference-type="ref+label"
reference="lem:sth-coproduct-symmetry"}, and this in fact involves a
surprising amount of cancellation. We illustrate that with two examples.

::: {#ex:symmetry-para-decon_1 .example}
*Example 17*. Consider a generic pair of simplexes, i.e., an element
$$x= [v_1, \mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}, v_n] \otimes [w_1, \mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}, w_n] \in {\mathrm{St}}^{2}(V) \cong {\mathrm{St}}(V) \otimes {\mathrm{St}}(V)$$
such that subspaces $V_I = {\mathrm{span}}(v_i \mid i \in I)$ and
$W_J = {\mathrm{span}}(w_j \mid j \in J)$ for
$I, J \subseteq {\underline{n}}$ intersect transversally. In this case,
$\overline{\zeta} \circ \Delta^{(2)}(x)$ is supported in summands
${\mathrm{St}}^{2}(V_I) \otimes {\mathrm{St}}^{2}(V/V_I)$ of
$({{{\mathscr{S}}{\mathrm{t}}}^2}\boxbackslash{{{\mathscr{S}}{\mathrm{t}}}^2})(V)$
while $\overline{\zeta} \circ \sigma \circ \Delta^{(2)}(x)$ is supported
in summands ${\mathrm{St}}^{2}(W_J) \otimes {\mathrm{St}}^{2}(V/W_J)$,
and these summands cannot agree by the genericity hypothesis.
Nonetheless [13](#lem:sth-coproduct-symmetry){reference-type="ref+label"
reference="lem:sth-coproduct-symmetry"} is true: both terms
$\overline{\zeta} \circ \Delta^{(2)}(x)$ and
$\overline{\zeta} \circ \sigma \circ \Delta^{(2)}(x)$ vanish identically
simply because
$\Delta([v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n])$
will be supported in direct summands of the form
${\mathrm{St}}(V_I) \otimes {\mathrm{St}}(V_{I^c})$ while
$\Delta([w_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},w_n])$
will be supported in direct summands of the form
${\mathrm{St}}(W_J) \otimes {\mathrm{St}}(W_{J^c})$, and these cannot
agree by the genericity hypothesis so $\Psi$ takes
$\Delta([v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n]) \otimes \tau \Delta([w_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},w_n])$
to zero.
:::

::: {#ex:symmetry-para-decon_2 .example}
*Example 18*. Consider next a pair of simplexes
$$x= [v_1, v_2, v_3] \otimes [w_1, w_2, w_3] \in {\mathrm{St}}^{2}(V)$$
which is not generic because they have a common vertex $v_1=w_1$ (but
otherwise are generic). The projection of the term
$\overline{\zeta} \circ \Delta^{(2)}(x)$ to the summand
${\mathrm{St}}^{2}(V_1)\otimes {\mathrm{St}}^{2}(V/V_1) \subseteq ({{{\mathscr{S}}{\mathrm{t}}}^2}\boxbackslash{{{\mathscr{S}}{\mathrm{t}}}^2})(V)$
is equal to $$\begin{equation}
\label{eqn: component v1 part 1}
\Bigl([v_1]\otimes [v_1]\Bigr) \otimes \Bigl([\overline{V_{12}\cap W_{23}},  \overline{V_{13}\cap W_{23}}]\otimes [\overline{w_2},\overline{w_3}] \Bigr).
\end{equation}$$ The projection of the term
$\overline{\zeta} \circ \sigma \circ \Delta^{(2)}(x)$ to the same
summand is equal to $$\begin{equation}
\label{eqn: component v1 part 2}
\Bigl([w_1]\otimes [w_1]\Bigr) \otimes \Bigl([\overline{v_2}, \overline{v_3}] \otimes [ \overline{W_{12}\cap V_{23}}, \overline{W_{13}\cap V_{23}}] \Bigr).
\end{equation}$$ Terms $\overline{\zeta} \circ \Delta^{(2)}(x)$ and
$\overline{\zeta} \circ \sigma \circ \Delta^{(2)}(x)$ give the same
contribution to the aforementioned component as
[\[eqn: component v1 part 1\]](#eqn: component v1 part 1){reference-type="eqref"
reference="eqn: component v1 part 1"} and
[\[eqn: component v1 part 2\]](#eqn: component v1 part 2){reference-type="eqref"
reference="eqn: component v1 part 2"} coincide.
:::

### Infinite Steinberg modules

Finally, we do the same for infinite Steinberg modules.

#### Algebraic structure on infinite Steinberg modules {#sec:alg-str-sstl}

As the nonunital commutative algebra
${\mathrm{St}}_{>0} \in {\mathrm{Fun}}({\mathrm{Vect}},{\mathrm{GrMod}}_{{\mathds{Q}}})$
is Koszul as a nonunital associative algebra with Koszul dual given by
${{\mathscr{S}}{\mathrm{t}}}^2_{>0}$, it is also Koszul as a nonunital
commutative algebra with Koszul dual given by the quotient
${{{\mathscr{S}}{\mathrm{t}}}^\infty}$ of
${{\mathscr{S}}{\mathrm{t}}}^2_{>0}$ given by the indecomposables
(cf. the notation of [@CharltonRadchenkoRudenko Section 3.1]) with
cobracket given as follows
$$\begin{tikzcd} {{\mathscr{S}}{\mathrm{t}}}^2_{>0} \rar{\Delta^{(2)}-\sigma \circ \Delta^{(2)}} \dar[two heads] &[30pt] {{\mathscr{S}}{\mathrm{t}}}^2_{>0} \boxplus{{\mathscr{S}}{\mathrm{t}}}^2_{>0} \dar[two heads] \\[-5pt]
{{{\mathscr{S}}{\mathrm{t}}}^\infty}\rar[dashed]{\delta} & {{{\mathscr{S}}{\mathrm{t}}}^\infty}\boxplus{{{\mathscr{S}}{\mathrm{t}}}^\infty},\end{tikzcd}$$
where by construction $\delta$ takes values in the summand
$\Lambda^2 {{{\mathscr{S}}{\mathrm{t}}}^\infty}$, including $a \wedge b$
as $\frac{1}{2}(a \otimes b - b \otimes a)$. The latter is by definition
${\mathds{Q}}_{\mathrm{sign}} \otimes_{{\mathfrak{S}}_2} ({{{\mathscr{S}}{\mathrm{t}}}^\infty}\boxplus{{{\mathscr{S}}{\mathrm{t}}}^\infty})$
and we may suppress $\boxplus$ from the notation since it is not
possible to perform this construction with respect to the monoidal
structure $\boxbackslash$ as it lacks a symmetry.

::: proposition
**Proposition 19**. *The infinite Steinberg modules
${{{\mathscr{S}}{\mathrm{t}}}^\infty}$ come equipped with the structure
of a graded Lie coalgebra in the symmetric monoidal category
$({\mathrm{Fun}}({\mathrm{Vect}},{\mathrm{GrMod}}_{\mathds{Q}}),\boxplus)$.*
:::

In this case the perspective using indecomposables is arguably better:
iterating the bar construction on a $c_0$-connected augmented
$E^{\mathrm{u}}_\infty$-algebra is up to a suspension the same as taking
$E^{\mathrm{nu}}_\infty$-indecomposables of its augmentation ideal by
[206](#thm:indec-is-bar){reference-type="ref+label"
reference="thm:indec-is-bar"}, so we have
$${{{\mathscr{S}}{\mathrm{t}}}^\infty}= H_*(\Sigma \, {\mathrm{indec}}_{E^{\mathrm{nu}}_\infty}({{\mathscr{S}}{\mathrm{t}}}_{>0})) \quad \text{where} \quad {\mathrm{indec}}_{E^{\mathrm{nu}}_\infty}({{\mathscr{S}}{\mathrm{t}}}_{>0}) \in {\mathrm{coAlg}}^{\mathrm{nil}}_{BE_\infty^{\mathrm{nu}}}({\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{D}}_{\mathds{Q}}})))$$
with $BE_\infty^{\mathrm{nu}} \simeq s \,{\mathrm{coLie}}$, so
${\mathrm{indec}}_{E^{\mathrm{nu}}_\infty}({{\mathscr{S}}{\mathrm{t}}}_{>0})$
admits up to a suspension a conilpotent Lie coalgebra structure by
Koszul duality.

The following is a direct consequence of
[13](#lem:sth-coproduct-symmetry){reference-type="ref+label"
reference="lem:sth-coproduct-symmetry"}, as it tells us that after
composing with $\overline{\zeta}$ the cobracket is not just
skew-commutative but also commutative. We give a different proof using
an explicit formula for the cobracket in
[76](#lem:fc-cobracket-symmetry){reference-type="ref+label"
reference="lem:fc-cobracket-symmetry"}. There is a map
$$\begin{equation}
\label{eqn:zeta-alt}\begin{aligned}\zeta^{\mathrm{alt}}= {\overline{\zeta}}-{\underline{\zeta}} \colon \Lambda^2 X &\longrightarrow X \boxbackslash X \\
x \wedge y &\longmapsto \frac{1}{2}(x \boxbackslash\overline{y} - y \boxbackslash\overline{x}),\end{aligned}
\end{equation}$$ where the overlines indicate that we use the naturality
of $X$ with respect to the isomorphism
$V_2 \overset{\cong}\longrightarrow V/V_1$ arising from a splitting
$V_1 \oplus V_2 \overset{\cong}\longrightarrow V$. It can also be
thought of as the inclusion
${\mathrm{inc}}\colon \Lambda^2 X \to X \boxplus X$ followed by
${\overline{\zeta}} \colon X \boxplus X \to X \boxbackslash X$.

::: {#lem:stl-cobracket-vanishing .lemma}
**Lemma 20**. *The cobracket on ${{{\mathscr{S}}{\mathrm{t}}}^\infty}$
has the following vanishing property:
$$\zeta^{\mathrm{alt}}\circ \delta = 0.$$*
:::

#### Presentations and formulas for infinite Steinberg modules {#sec:pres-form-stl}

We continue with a presentation for the infinite Steinberg modules and a
formula for the cobracket, which by
[2.5.1](#sec:alg-str-sstl){reference-type="ref+label"
reference="sec:alg-str-sstl"} are obtained by passing to the
indecomposables in ${{{\mathscr{S}}{\mathrm{t}}}^2}$ and
antisymmetrising the (reduced) cobracket. If the dimension of $V$ is $n$
then a pair of apartments
$[v_1,\ldots,v_n],[w_1,\ldots,w_n] \in {\mathrm{St}}(V)$ gives rise to
an element
$$[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n] \otimes [w_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},w_n] \in {\mathrm{St}}^{2}(V) \cong {\mathrm{St}}(V) \otimes {\mathrm{St}}(V).$$
The following elements will play an important role
[@CharltonRadchenkoRudenko Definition 28]:

::: {#def:steinberg-iterated-integral .definition}
**Definition 21**. Let $v_1,\ldots,v_n$ be a basis of $V$, then the
*Steinberg iterated integral* is the element
$${\mathrm{I}}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n] \coloneq (-1)^n [v_n,v_{n-1},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_1] \otimes [v_n,v_{n-1}-v_n,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_1-v_2] \in {\mathrm{St}}^{2}(V).$$
:::

It is convenient to think of these geometrically as a pair of simplexes
in projective spaces that are *not* in general position. For example,
for $n=3$, we have two triangles in the projective space
$\mathbb{P}^2(F)$ intersecting in the following pattern:
$$\begin{tikzpicture}
\draw (0,0) -- (-1,4) -- (3,2) -- cycle;
\node at (0,0) [left] {$v_3$};
\node at (-1,4) [left] {$v_2$};
\node at (3,2) [right] {$v_1$};
\node at (-.5,2) [left] {$v_2-v_3$};
\node at (1,3) [right] {$\,v_1-v_2$};
\draw (0,0) -- (-.5,2) -- (1,3) --cycle;
\end{tikzpicture}$$

Taking the quotient by the decomposables yields a projection map
$\pi \colon {{{\mathscr{S}}{\mathrm{t}}}^2}\to {{{\mathscr{S}}{\mathrm{t}}}^\infty}$
and we will combine this with the Steinberg iterated integrals to
construct elements of ${\mathrm{St}}^{\infty}(V)$ that depend on a
so-called *affine basis*: if $V$ is $n$-dimensional then this is a
collection of $n+1$ vectors $u_0,\ldots,u_n$ in $V$ so that
$u_1-u_0,\ldots,u_n-u_0$ are linearly independent. The following are
defined in [@CharltonRadchenkoRudenko Section 3.8]:

::: {#def:steinberg-correlator .definition}
**Definition 22**. Let $u_0,\ldots,u_n$ be an affine basis, then the
*Steinberg correlator* is the element
$${\mathrm{C}}[u_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n] \coloneq \pi\big[(-1)^n {\mathrm{I}}[u_1-u_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},u_n-u_0]\big] \in {\mathrm{St}}^{\infty}(V).$$
:::

In [@CharltonRadchenkoRudenko Section 3.8] it is shown these have the
following properties:

(1) []{#enum:stl-relations-i label="enum:stl-relations-i"} They are
    homogeneous
    ${\mathrm{C}}[u_0:\cdots:u_n] = {\mathrm{C}}[u_0-u:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n-u]$
    for any $u \in V$.

(2) []{#enum:stl-relations-ii label="enum:stl-relations-ii"} They are
    cyclically symmetric:
    ${\mathrm{C}}[u_0:u_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n] = {\mathrm{C}}[u_1:u_2:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_0]$.

(3) []{#enum:stl-relations-iii label="enum:stl-relations-iii"} They
    satisfy the shuffle relations:
    $$\sum_{\sigma \in {\mathrm{Sh}}(n_1,n_2)} {\mathrm{C}}[u_0:u_{\sigma(1)}:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_{\sigma(n_1+n_2)}] =0 \quad \text{for $n=n_1+n_2$.}$$

We will see momentarily, in
[\[eqn:decomposition-operator\]](#eqn:decomposition-operator){reference-type="eqref"
reference="eqn:decomposition-operator"}, that there is a linear map
$D^{\mathrm{St}}_h \colon {\mathrm{St}}^{\infty}(V) \to {\mathrm{St}}^{\infty}(V)$
for each nonzero functional $h \colon V \to F$, and the only remaining
required relations can be written in terms of these:

(4) []{#enum:stl-relations-iv label="enum:stl-relations-iv"} The
    Steinberg correlators satisfy
    $${\mathrm{C}}[u_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n] = D^{\mathrm{St}}_h\big({\mathrm{C}}[u_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n]) \quad \text{for $h \in V^\vee \setminus \{0\}$.}$$

::: {#prop:stl-explicit-pres .proposition}
**Proposition 23**. *The following map of
${\mathds{Q}}[{\mathrm{GL}}(V)]$-modules is an isomorphism
$$\frac{{\mathds{Q}}[{\mathrm{C}}[u_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n] \text{ for affine bases $u_0,\ldots,u_n$}]}{\text{\eqref{enum:stl-relations-i}-\eqref{enum:stl-relations-iv}}} \overset{\cong}\longrightarrow{\mathrm{St}}^{\infty}(V).$$*
:::

::: proof
*Proof.* Referring forward to
[84](#prop:stl-resolution){reference-type="ref+label"
reference="prop:stl-resolution"} for details, there is an exact sequence
$${\mathds{Q}}[{{\mathrm{Dec}}}_V] \otimes \mathrm{FC}(V) \overset{d}{\longrightarrow} \mathrm{FC}(V) \overset{{\mathrm{pr}}^\mathrm{FC}} \longrightarrow{\mathrm{St}}^{\infty}(V) \longrightarrow 0$$
where $\mathrm{FC}(V)$ is generated by "formal correlators" satisfying
[\[enum:stl-relations-i\]](#enum:stl-relations-i){reference-type="eqref"
reference="enum:stl-relations-i"}--[\[enum:stl-relations-iii\]](#enum:stl-relations-iii){reference-type="eqref"
reference="enum:stl-relations-iii"} and
[\[enum:stl-relations-iv\]](#enum:stl-relations-iv){reference-type="eqref"
reference="enum:stl-relations-iv"} is imposed by the differential $d$. ◻
:::

We can now ask for a description of the Lie coalgebra structure with
respect to this presentation: this was done in
[@CharltonRadchenkoRudenko Section 3.8].

::: {#prop:stl-explicit-cobracket .proposition}
**Proposition 24**. *With respect to this presentation, the cobracket on
${{{\mathscr{S}}{\mathrm{t}}}^\infty}$ is given by $$\begin{equation}
\label{eqn:stinfty-cobracket}
\delta\big({\mathrm{C}}[u_0:\cdots:u_n]\big) = \sum_{j=0}^n \sum_{i=1}^{n-1} {\mathrm{C}}[u_j:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_{j+i}] \wedge {\mathrm{C}}[u_j:u_{j+i+1}:u_{j+i+2}:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_{j+n}]
\end{equation}$$ where indices are to be interpreted cyclically.*
:::

For $I \subseteq \{0,\ldots,n\}$ we write
$V_I \coloneq {\mathrm{span}}(u_i-u_j \mid i,j \in I)$, and see that the
cobracket of
${\mathrm{C}}[u_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n]$
is concentrated on summands
${\mathrm{St}}^{\infty}(V_I) \otimes {\mathrm{St}}^{\infty}(V_J) \subseteq ({{{\mathscr{S}}{\mathrm{t}}}^\infty}\boxplus{{{\mathscr{S}}{\mathrm{t}}}^\infty})(V)$
for direct sum decomposition
$V_I \oplus V_J \smash{\overset{\cong}\longrightarrow} V$ where both
subspaces are of this form.

It is convenient to represent these formulas pictorially. A Steinberg
correlator ${\mathrm{C}}[u_0:\cdots:u_n]$ can be represented by a
$(n+1)$-sided polygon whose vertices are decorated cyclically in
clockwise order by $u_0,\ldots,u_n$. For each choice of vertex $j$ and
nonadjacent edge $(j+i,j+i+1)$ (that is, $j \neq j+i,j+i+1$), we draw a
cut from the vertex to the edge. We then interpret both sides as
$(i+1)$- and $(n-i+1)$-sided polygons with vertices labelled cyclically
by a subset of $u_0,\ldots,u_n$ (the vertex through which we cut will be
duplicated, appearing once in both polygons) and take the corresponding
Steinberg correlator, where the one clockwise from the cut vertex
appears first in the wedge product: for example,
$$\begin{tikzpicture}[baseline={([yshift=-.5ex]current bounding box.center)}]
   \draw (0:1) \foreach \x in {60,120,...,360} {  -- (\x:1) };
   \foreach \x/\l/\p in
     { 60/{$u_2$}/above,
      120/{$u_1$}/above,
      180/{$u_0$}/left,
      240/{$u_5$}/below,
      300/{$u_4$}/below,
      360/{$u_3$}/right
     }
     \node[inner sep=1pt,circle,draw,fill,label={\p:\l}] at (\x:1) {};
     \draw (360:1) -- (90:1);
\end{tikzpicture} \quad \leadsto \quad \text{${\mathrm{C}}[u_3,u_4,u_5,u_0,u_1] \wedge {\mathrm{C}}[u_3,u_2]$}$$
corresponds to the term $j=3$ and $i=4$ in the formula for
$\delta({\mathrm{C}}[u_0:\cdots:u_5])$.

We can apply the map $\zeta^{\mathrm{alt}}$ from
[\[eqn:zeta-alt\]](#eqn:zeta-alt){reference-type="eqref"
reference="eqn:zeta-alt"} to $\delta$: then, in
$\zeta^{\mathrm{alt}}\circ \delta$ we will have twice the number of
terms: $$\begin{align*}
(\zeta^{\mathrm{alt}}\circ \delta)\big({\mathrm{C}}[u_0:\cdots:u_n]\big) &= \sum_{j=0}^n \sum_{i=1}^{n-1} \tfrac{1}{2} {\mathrm{C}}[u_j:\cdots:u_{j+i}] \boxbackslash\overline{{\mathrm{C}}[u_j:u_{j+i+1}:v_{j+i+2}:\cdots:u_{j+n}]} \\
&\quad - \sum_{j=0}^n \sum_{i=1}^{n-1} \tfrac{1}{2} {\mathrm{C}}[u_j:u_{j+i+1}:v_{j+i+2}:\cdots:u_{j+n}] \boxbackslash\overline{{\mathrm{C}}[u_j:\cdots:u_{j+i}]}.
\end{align*}$$ In terms of the pictorial description, we mark one of the
two polygons to be "projected", and add a required negative sign when
this marked polygon appears clockwise from the cut vertex. We proved in
[20](#lem:stl-cobracket-vanishing){reference-type="ref+label"
reference="lem:stl-cobracket-vanishing"} using an abstract argument that
$\zeta^{\mathrm{alt}}\circ \delta$ vanishes and in
[76](#lem:fc-cobracket-symmetry){reference-type="ref+label"
reference="lem:fc-cobracket-symmetry"} will give a computational proof.

### Symbol maps and decomposition operators {#sec:symbol-maps}

We next recall from [@CharltonRadchenkoRudenko Section 3.9] how to give
bases for ${\mathrm{St}}^{2}(V)$ and ${\mathrm{St}}^{\infty}(V)$ and how
to pass between different bases. This uses the symbol and to explain its
combinatorial structure it is useful to first define a "universal
symbol".

#### Universal symbol

Consider a set $S$ and letters $\omega_{ij}$ for $i\neq j \in S$ subject
to the relations $\omega_{ij}=\omega_{ji}$.

::: definition
**Definition 25**. *Universal symbols* are the elements
$$\mathbf{S}(s_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},s_n)\in {\mathrm{free}}_{{\mathrm{As}}^{\mathrm{u}}}({\mathds{Q}}\{\omega_{ij} \mid i,j\in S\}) \qquad  \text{for $n\geq 1$ and $s_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},s_n \in S$,}$$
defined inductively by the formulas $S(s_0,s_1) = \omega_{s_0s_1}$, and
$$\begin{equation}
\label{eqn:symbol-combinatorics}
\begin{aligned}\mathbf{S}(s_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},s_n) &=\mathbf{S}(s_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},s_{n-1})\otimes \omega_{s_0s_n} \\
&\quad -\sum_{i=1}^{n-1} \mathbf{S}(s_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},\widehat{s}_{i+1},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},s_n)\otimes \omega_{s_is_{i+1}} \\
&\quad+\sum_{i=1}^{n-1} \mathbf{S}(s_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},\widehat{s}_i,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},s_n)\otimes \omega_{s_is_{i+1}}.\end{aligned}
\end{equation}$$
:::

It is sometimes convenient to have an expanded formula for the universal
symbol, rather than an inductive one. The inductive definition of the
universal symbol implies that ${\mathbf{S}}(s_0,\ldots,s_n)$ is a sum of
symbols of the form
$$\pm \omega_{i_1j_1}\otimes \dots \otimes \omega_{i_{n},j_n}$$ where
pairs $\{i_1j_1\} ,\dots \{i_{n},j_n\}$ can be identified with the set
of edges of a spanning tree of the complete graph with vertices
$s_0,\dots,s_n$. It is easy to see from
[\[eqn:symbol-combinatorics\]](#eqn:symbol-combinatorics){reference-type="eqref"
reference="eqn:symbol-combinatorics"} that each set of edges appears at
most once. We conclude that:

::: {#prop:universal-symbol-combinatorics .proposition}
**Proposition 26**. *There exists a unique subset $T(n)$ of the set of
ordered tuples of edges of the complete graph with vertex set
${\underline{n}} = \{0,1,\ldots,n\}$ and a unique sign function
${\mathrm{sign}}\colon T(n) \to \{\pm 1\}$ such that
$$\mathbf{S}(s_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},s_n)=\sum_{\iota=(\{i_1,j_1\},\dots,\{i_{n},j_n\})\in T(n)}{\mathrm{sign}}(\iota)\ \omega_{i_1j_1}\otimes \dots \otimes  \omega_{i_nj_n}.$$*
:::

::: {#exam:universal-symbol .example}
*Example 27*. We have
$$\mathbf{S}(s_0,s_1,s_2) = \omega_{s_0s_1}\otimes \omega_{s_0s_2} - \omega_{s_0s_1}\otimes \omega_{s_1s_2} + \omega_{s_0s_2}\otimes \omega_{s_1s_2}.$$
That is, $T(2)$ consists of tuples
$(\{0,1\},\{0,2\}), (\{0,1\},\{1,2\}),$ and $(\{0,2\},\{1,2\})$ with the
signs
$${\mathrm{sign}}\bigl((\{0,1\},\{0,2\})\bigr)=1, \quad {\mathrm{sign}}\bigl((\{0,1\},\{1,2\})\bigr)=-1, \quad {\mathrm{sign}}\bigl((\{0,2\},\{1,2\})\bigr)=1.$$
:::

#### A property of the universal symbol related to partitions

We continue with a discussion that will allow us to prove cancellation
of certain terms in the symbol; it suffices to do this for the universal
symbol.

Consider an equivalence relation $\sim$ on the set $S$ and a collection
of letters $a_{ij}$ for $i, j\in S$ together with an additional letter
$a$. Define a map of associative algebras $$\begin{align*}
\rho_{\sim}\colon {\mathrm{free}}_{{\mathrm{As}}^{\mathrm{u}}}({\mathds{Q}}\{\omega_{ij}| i,j\in S\}) &\longrightarrow{\mathrm{free}}_{{\mathrm{As}}^{\mathrm{u}}}({\mathds{Q}}\{a_{ij} \mid i,j\in S\}\oplus {\mathds{Q}}\{a\}) \\
\omega_{ij} &\longmapsto
\begin{cases}
 a_{ij} & \text{ if } i\sim j, \\
 a  & \text{ if } i \not \sim j. 
\end{cases}
\end{align*}$$

::: {#lem:symbol and equivalence relation .lemma}
**Lemma 28**. *Assume that $s_0 \not \sim s_n$. We have
$$\rho_{\sim}\bigl({\mathbf{S}}(s_0,\dots,s_n)\bigr)=a^{\otimes n}.$$*
:::

::: proof
*Proof.* We argue by induction on $n$. The base case $n=1$ is trivial as
we assume $s_0 \not \sim s_1$. By the induction assumption, we have
$$\begin{align*}
\rho_{\sim}\left (\sum_{i=1}^{n-1} {\mathbf{S}}(s_0,\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp},\widehat{s}_i,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},s_n)\otimes \omega_{s_is_{i+1}}\right) &= a^{\otimes n-1}\otimes \sum_{i=1}^{n-1} \rho_{\sim}(\omega_{s_is_{i+1}}) \\
\rho_{\sim}\left(\sum_{i=1}^{n-2} {\mathbf{S}}(s_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},\widehat{s}_{i+1},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},s_n)\otimes \omega_{s_is_{i+1}} \right) &=a^{\otimes n-1}\otimes \sum_{i=1}^{n-2} \rho_{\sim}(\omega_{s_is_{i+1}}),
\end{align*}$$ so using
[\[eqn:symbol-combinatorics\]](#eqn:symbol-combinatorics){reference-type="eqref"
reference="eqn:symbol-combinatorics"} we have $$\begin{align*}
\rho_{\sim}\bigl({\mathbf{S}}(s_0,\dots,s_n)\bigr)&=
\rho_{\sim}\bigl({\mathbf{S}}(s_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},s_{n-1})\bigr)\otimes a
\\
&-\rho_{\sim}\bigl({\mathbf{S}}(s_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},s_{n-1})\big)\otimes \rho_{\sim}(\omega_{s_{n-1}s_n})\\
&+a^{\otimes (n-1)}\otimes \rho_{\sim}(\omega_{s_{n-1}s_n}).
\end{align*}$$ If $s_{n-1} \sim s_{n}$, then $s_{n-1} \not \sim s_0$ and
we have
$$\rho_{\sim}({\mathbf{S}}(s_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},s_{n-1}))=a^{\otimes (n-1)}$$
by the induction hypothesis. In this case, the above formula simplifies
to $$\rho_{\sim}\bigl({\mathbf{S}}(s_0,\dots,s_n)\bigr)=
a^{\otimes (n-1)}\otimes a
-a^{\otimes (n-1)}\otimes a_{s_{n-1}s_n}
+a^{\otimes (n-1)}\otimes a_{s_{n-1}s_n}=a^{\otimes n}.$$ If on the
other hand $s_{n-1} \not \sim s_{n}$, the above formula simplifies to
$$\rho_{\sim}\bigl({\mathbf{S}}(s_0,\dots,s_n)\bigr)=
\rho_{\sim}({\mathbf{S}}(s_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},s_{n-1}))\otimes a
-\rho_{\sim}({\mathbf{S}}(s_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},s_{n-1}))\otimes a
+a^{\otimes (n-1)}\otimes a= a^{\otimes n}.$$ This completes the proof
of the induction step. ◻
:::

::: example
*Example 29*. For the discrete equivalence relation this says that the
number of terms in the universal symbol counted with sign is 1. For
other equivalence relations it gives similar but more refined
information: for example, if $1 \sim 2$ but no other elements are
identified it tells us that the number of terms in the universal symbol
containing $\omega_{12}$ counted with sign is $0$.
:::

#### Symbol maps

As a consequence of the Koszulity of Steinberg modules from
[\[hyp:st-koszul\]](#hyp:st-koszul){reference-type="eqref"
reference="hyp:st-koszul"}, the description
${{{\mathscr{S}}{\mathrm{t}}}^2}$ and
${{{\mathscr{S}}{\mathrm{t}}}^\infty}$ as the associative and
commutative Koszul duals of ${{\mathscr{S}}{\mathrm{t}}}$ yields
injections in the bar constructions of
[\[def:bar-as,def:bar-comm\]](#def:bar-as,def:bar-comm){reference-type="ref+label"
reference="def:bar-as,def:bar-comm"} $$\begin{align*}
s^{\mathrm{As}} \colon {\mathrm{St}}^{2}(V) &\longrightarrow({\mathrm{B}}^{\mathrm{As}}{{\mathscr{S}}{\mathrm{t}}})_n(V) \\
s^{\mathrm{Com}} \colon {\mathrm{St}}^{\infty}(V) &\longrightarrow({\mathrm{B}}^{\mathrm{Com}}{{\mathscr{S}}{\mathrm{t}}})_n(V)
\end{align*}$$ for $V$ of dimension $n$, that we will refer to as the
*associative symbol map* and *commutative symbol map* respectively. The
former induces the latter, in that the following diagram commutes
$$\begin{tikzcd} {\mathrm{St}}^{2}(V) \dar[two heads] \rar[hook]{s^{\mathrm{As}}} &[20pt]  ({\mathrm{B}}^{\mathrm{As}}{{\mathscr{S}}{\mathrm{t}}})_n(V) \dar[two heads]\\[-5pt]
{\mathrm{St}}^{\infty}(V)  \rar[hook]{s^{\mathrm{Com}}}  & ({\mathrm{B}}^{\mathrm{Com}}{{\mathscr{S}}{\mathrm{t}}})_n(V)\end{tikzcd}$$
where the vertical maps are the natural maps that take the quotient by
decomposables.

::: notation
**Notation 30**. Unless there is a risk of confusion, we abbreviate both
symbol maps to $s$.
:::

To perform computations, we use the inductive formula for the
associative symbol of a Steinberg iterated integral
[@CharltonRadchenkoRudenko Lemma 30]: we have
$$s({\mathrm{I}}[v]) = -[v]$$ by definition, and then set
$$\begin{equation}
\label{eqn:symbol-iterated-integral}\begin{aligned}s({\mathrm{I}}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n]) &=- s({\mathrm{I}}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_{n-1}])\otimes [v_n] \\
&\quad +\sum_{i=1}^{n-1} \big(s({\mathrm{I}}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},\widehat{v}_{i+1},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n]-s({\mathrm{I}}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},\widehat{v}_i,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n]\big)\otimes [v_{i+1}-v_i].\end{aligned}
\end{equation}$$ Since the Steinberg correlators are up to sign given by
projecting Steinberg iterated integrals, the formula for their symbol is
essentially the same: $s({\mathrm{C}}[u_0:u_1]) = [u_1-u_0]$, and
$$\begin{equation}
\label{eqn:symbol-correlator}\begin{aligned}s({\mathrm{C}}[u_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n]) &=s({\mathrm{C}}[u_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_{n-1}])\otimes [u_n-u_0] \\
&\quad -\sum_{i=1}^{n-1} s({\mathrm{C}}[u_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:\widehat{u}_{i+1}:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n])\otimes [u_{i+1}-u_i] \\
&\quad+\sum_{i=1}^{n-1} s({\mathrm{C}}[u_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:\widehat{u}_i,\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n])\otimes [u_{i+1}-u_i]\end{aligned}
\end{equation}$$ where we implicitly project the right side to
$(B^{\mathrm{Com}}{{\mathscr{S}}{\mathrm{t}}})_n(V)$. Comparing the
inductive formula
[\[eqn:symbol-correlator\]](#eqn:symbol-correlator){reference-type="eqref"
reference="eqn:symbol-correlator"} to the inductive formula
[\[eqn:symbol-combinatorics\]](#eqn:symbol-combinatorics){reference-type="eqref"
reference="eqn:symbol-combinatorics"} for the universal symbol, we see
that
$$s({\mathrm{C}}[u_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}: u_n]) = \pi\left(\sum_{\iota=(\{i_1,j_1\},\dots,\{i_{n},j_n\})\in T(n)}{\mathrm{sign}}(\iota)\ [u_{j_1}-u_{i_1}] \otimes \dots \otimes  [u_{j_n}-u_{i_n}]\right)$$
with $T(n)$ and ${\mathrm{sign}}(\iota)$ as in
[26](#prop:universal-symbol-combinatorics){reference-type="ref+label"
reference="prop:universal-symbol-combinatorics"}.

::: example
*Example 31*. For $n=2$, we have [@CharltonRadchenkoRudenko Example 31]
(compare to [27](#exam:universal-symbol){reference-type="ref+label"
reference="exam:universal-symbol"}) $$\begin{align*}
s({\mathrm{I}}[v_1,v_2]) &= [v_1|v_2]-[v_1|v_2-v_1]+[v_2|v_2-v_1],\\
s({\mathrm{C}}[u_0:u_1:u_2]) &= \pi\big([u_1-u_0|u_2-u_0]-[u_1-u_0|u_2-u_1]+[u_2-u_0 \mid u_2-u_1]\big).
\end{align*}$$ For $n=3$, see
[7.3.2](#sec:decomp-rels-wt-3){reference-type="ref+label"
reference="sec:decomp-rels-wt-3"}.
:::

#### Decomposition operators

Unwinding the definitions, the target of the commutative symbol map is
given by $$\begin{align*}
({\mathrm{B}}^{\mathrm{Com}}{{\mathscr{S}}{\mathrm{t}}})_n(V) &\cong ({\mathrm{B}}^{\mathrm{Ass}}{{\mathscr{S}}{\mathrm{t}}})_n(V) \otimes_{{\mathfrak{S}}_n} {\mathrm{coLie}}_n \\
&\cong \left(\bigoplus_{V = P_1 \oplus \cdots \oplus P_n} {\mathrm{St}}(P_1) \otimes \cdots \otimes {\mathrm{St}}(P_n)\right) \otimes_{{\mathfrak{S}}_n} {\mathrm{coLie}}_n.
\end{align*}$$ Given a hyperplane $H \subset V$ we can project onto
those summands where none of the lines $P_i$ is contained in $H$,
yielding a map
$$\pi_H \colon ({\mathrm{B}}^{\mathrm{Com}}{{\mathscr{S}}{\mathrm{t}}})_n(V) \longrightarrow({\mathrm{B}}^{\mathrm{Com}}{{\mathscr{S}}{\mathrm{t}}})^H_n(V) \coloneq \left(\bigoplus_{\substack{V = P_1 \oplus \cdots \oplus P_n \\ P_1,\ldots,P_n \not \subseteq H}} {\mathrm{St}}(P_1) \otimes \cdots \otimes {\mathrm{St}}(P_n)\right) \otimes_{{\mathfrak{S}}_n} {\mathrm{coLie}}_n.$$
This can be used to construct a basis for ${\mathrm{St}}^{\infty}(V)$
[@CharltonRadchenkoRudenko Proposition 44]:

::: proposition
**Proposition 32**. *For every hyperplane $H \subset V$ the following is
an isomorphism
$$s_H \coloneq (\pi_H \circ s) \colon {\mathrm{St}}^{\infty}(V) \longrightarrow({\mathrm{B}}^{\mathrm{Com}}{{\mathscr{S}}{\mathrm{t}}})^H_n(V).$$*
:::

If we pick a (necessarily nonzero) linear functional $h \colon V \to F$
so that $H = \ker(h)$, we can construct an inverse by $$\begin{align*}
{\mathrm{C}}^{\mathrm{St}}_h \colon ({\mathrm{B}}^{\mathrm{Com}}{{\mathscr{S}}{\mathrm{t}}})^H_n(V) &\longrightarrow{\mathrm{St}}^{\infty}(V)\\
[P_1|\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}|P_n] &\longmapsto {\mathrm{C}}[0:v_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_n]
\end{align*}$$ where $v_i$ is the unique vector in $P_i$ so that
$h(v_i) = 1$. This is well-defined because the Steinberg correlators
satisfy the shuffle relations. Given that $s_H$ is an isomorphism, to
see that its inverse is given by $\smash{{\mathrm{C}}^{\mathrm{St}}_h}$
it suffices to verify:

::: {#lem:ch-inverse-of-symbol .lemma}
**Lemma 33**. *We have
$s_H \circ {\mathrm{C}}^{\mathrm{St}}_h = {\mathrm{id}}$.*
:::

::: proof
*Proof.* Given a Steinberg correlator
${\mathrm{C}}[0:v_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_n]$
in the image of ${\mathrm{C}}^{\mathrm{St}}_h$, in the inductive formula
[\[eqn:symbol-iterated-integral\]](#eqn:symbol-iterated-integral){reference-type="eqref"
reference="eqn:symbol-iterated-integral"} each term in the second sum
has ${\mathrm{span}}(v_{i+1}-v_i) \subseteq H$. Thus only the term
$[v_1|\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}|v_n]$ of the
symbol survives. ◻
:::

Consequently if we define a *decomposition operator* as
$$\begin{equation}
\label{eqn:decomposition-operator} D^{\mathrm{St}}_h \coloneq ({\mathrm{C}}^{\mathrm{St}}_h \circ s_H) \colon {\mathrm{St}}^{\infty}(V) \longrightarrow{\mathrm{St}}^{\infty}(V)
\end{equation}$$ it satisfies $D^{\mathrm{St}}_h = {\mathrm{id}}$. This
explains and justifies relation
[\[enum:stl-relations-iv\]](#enum:stl-relations-iv){reference-type="eqref"
reference="enum:stl-relations-iv"}. Note that replacing $h$ with
$\lambda h$ for $\lambda \neq 0$ replaces $v_i$ by $\lambda^{-1} v_i$,
so $D_h^{\mathrm{St}}$ only depends on $H$; we will not use this.

### A lift of the coproduct to cobar complexes {#sec:lift-coproduct}

In this subsection we will work in the 1-category
${\mathrm{Ch}}_{\mathds{Q}}$ of chain complexes over ${\mathds{Q}}$;
this yields the category ${{\mathscr{D}}_{\mathds{Q}}}$ upon inverting
the quasi-isomorphisms, see
[12.4](#sec:rect-dg){reference-type="ref+label"
reference="sec:rect-dg"}. Koszul duality yields equivalences in terms of
the cobar constructions of
[\[def:cobar-as,def:cobar-colie\]](#def:cobar-as,def:cobar-colie){reference-type="ref+label"
reference="def:cobar-as,def:cobar-colie"}
$$\Sigma^{-1}\Omega^{\mathrm{coAs}} {{{\mathscr{S}}{\mathrm{t}}}^2}\simeq {{\mathscr{S}}{\mathrm{t}}}\qquad \text{and} \qquad \Sigma^{-1}\Omega^{\mathrm{coLie}} {{{\mathscr{S}}{\mathrm{t}}}^\infty}\simeq {{\mathscr{S}}{\mathrm{t}}},$$
where the cobar constructions are constructed using the tensor product
$\boxplus$, and the gradings are so that
${{{\mathscr{S}}{\mathrm{t}}}^2}(V)$ and
${{{\mathscr{S}}{\mathrm{t}}}^\infty}(V)$ are in degree $2\,\dim(V)$ and
${{\mathscr{S}}{\mathrm{t}}}(V)$ is in degree $\dim(V)$. In this section
we will *explicitly* lift to these resolutions the coproduct
$$\Delta \colon {{\mathscr{S}}{\mathrm{t}}}\longrightarrow{{\mathscr{S}}{\mathrm{t}}}\boxbackslash{{\mathscr{S}}{\mathrm{t}}}.$$
This will eventually be used to give a formula for the cobracket on
$H_1({\mathrm{GL}};{{{\mathscr{S}}{\mathrm{t}}}^\infty})$.

::: {#prop:coproduct-on-cobar .proposition}
**Proposition 34**. *There exist coassociative counital coproducts
$$\begin{align*}
\Delta &\colon \Sigma^{-1}\Omega^{\mathrm{coAs}}({{{\mathscr{S}}{\mathrm{t}}}^2}) \longrightarrow\Sigma^{-1}\Omega^{\mathrm{coAs}}({{{\mathscr{S}}{\mathrm{t}}}^2}) \boxbackslash\Sigma^{-1}\Omega^{\mathrm{coAs}}({{{\mathscr{S}}{\mathrm{t}}}^2}) \\
\Delta &\colon \Sigma^{-1}\Omega^{\mathrm{coLie}}({{{\mathscr{S}}{\mathrm{t}}}^\infty}) \longrightarrow\Sigma^{-1}\Omega^{\mathrm{coLie}}({{{\mathscr{S}}{\mathrm{t}}}^\infty}) \boxbackslash\Sigma^{-1}\Omega^{\mathrm{coLie}}({{{\mathscr{S}}{\mathrm{t}}}^\infty})
\end{align*}$$ so that the augmentation maps to
${{\mathscr{S}}{\mathrm{t}}}$ are maps of coassociative counital
coalgebras.*
:::

For $X \in {\mathrm{Fun}}({\mathrm{Vect}},{\mathrm{Ch}}_{{\mathds{Q}}})$
we define the free unital associative and commutative algebras
$$T^\bullet X \coloneq {\mathrm{As}}^{\mathrm{u}} \circ X \qquad \text{and} \qquad S^\bullet X \coloneq {\mathrm{Com}}^{\mathrm{u}} \circ X,$$
whose underlying objects decompose as sums $$\begin{align*}
T^\bullet X &= \bigoplus_{p \geq 0} T^p X \qquad \text{where } T^p X = X^{\boxplus p},\\
S^\bullet X &= \bigoplus_{p \geq 0} S^p X \qquad \text{where } S^p X = {\mathds{Q}}_{\mathrm{triv}} \otimes_{{\mathfrak{S}}_p} X^{\boxplus p}.
\end{align*}$$ Recall that now $\boxbackslash$ induces a monoidal
structure on the categories of unital associative and unital commutative
algebras with respect to $\boxplus$, so we get unital associative and
unital commutative algebras $T^\bullet X \boxbackslash T^\bullet X$ and
$S^\bullet X \boxbackslash S^\bullet X$, with product in both cases
given by
$(x \boxbackslash y)(x' \boxbackslash y') = (-1)^{|x'||y|} (x \boxplus x') \boxbackslash(y \boxplus y')$.
We can then extend the assignment
$x \mapsto x \boxbackslash 1 + 1 \boxbackslash x$ uniquely to
homomorphisms
$$\xi^{\mathrm{As}} \colon T^\bullet X \longrightarrow T^\bullet X \boxbackslash T^\bullet X \qquad \text{and} \qquad \xi^{\mathrm{Com}} \colon S^\bullet X \longrightarrow S^\bullet X \boxbackslash S^\bullet X.$$
For example, we have $$\begin{equation}
\label{eqn:xi-computation}\xi^{\mathrm{As}}(x\boxplus y) = \xi^{\mathrm{Com}}(x \boxplus y) = (x \boxplus y) \boxbackslash 1 + x \boxbackslash y + (-1)^{|x||y|} y \boxbackslash x + 1 \boxbackslash(x \boxplus y).
\end{equation}$$ Note that these maps are counital and coassociative,
because the identities that one needs to verify are between maps of
unital associative or unital commutative algebras whose domain is free
and they are easily verified on generators.

::: lemma
**Lemma 35**. * *

(i) *Let ${\mathbf{C}}$ be a nonunital dg-coassociative coalgebra in
    ${\mathrm{Fun}}({\mathrm{Vect}},{\mathrm{GrMod}}_{{\mathds{Q}}})$
    with respect to $\boxplus$ concentrated in even degrees. Then
    $$\xi^{\mathrm{As}} \colon \Sigma^{-1}\Omega^{\mathrm{coAs}} {\mathbf{C}} \longrightarrow\Sigma^{-1}\Omega^{\mathrm{coAs}} {\mathbf{C}} \boxbackslash\Sigma^{-1}\Omega^{\mathrm{coAs}} {\mathbf{C}}$$
    is a map of chain complexes if and only if
    ${\overline{\zeta}} \circ \Delta_{\mathbf{C}}  = {\overline{\zeta}} \circ \sigma \circ \Delta_{\mathbf{C}}$.*

(ii) *Let ${\mathbf{L}}$ be a dg-coLie coalgebra in
     ${\mathrm{Fun}}({\mathrm{Vect}},{\mathrm{GrMod}}_{{\mathds{Q}}})$
     with respect to $\boxplus$ concentrated in even degrees. Then
     $$\xi^{\mathrm{Com}} \colon \Sigma^{-1}\Omega^{\mathrm{coLie}} {\mathbf{L}} \longrightarrow\Sigma^{-1}\Omega^{\mathrm{coLie}} {\mathbf{L}} \boxbackslash\Sigma^{-1}\Omega^{\mathrm{coLie}} {\mathbf{L}}$$
     is a map of chain complexes if and only if
     $\zeta^{\mathrm{alt}}\circ \delta_{\mathbf{L}} =0$.*
:::

::: proof
*Proof.* We give the details in the second case, as it is most relevant
to this paper and the first case is entirely analogous. Recall from
[216](#def:cobar-colie){reference-type="ref+label"
reference="def:cobar-colie"} that the Lie coalgebra cobar complex
$\Sigma^{-1}\Omega^{\mathrm{coLie}} {\mathbf{L}}$ is given by
$S^\bullet \Sigma^{-1} {\mathbf{L}}$ with differential $d = d_\Omega$ is
determined as the unique derivation extending a map on
$\Sigma^{-1} {\mathbf{L}}$ (there is no nonzero internal differential
$d_{\mathbf{L}}$ since ${\mathbf{L}}$ has none). We need to verify that
$$\xi^{\mathrm{Com}} \circ d = (d \boxbackslash{\mathrm{id}}+\epsilon\, {\mathrm{id}}\boxbackslash d) \circ \xi^{\mathrm{Com}}$$
where $\epsilon$ is an appropriate sign coming from the tensor product
of chain complexes, acting in bidegree $(p,q)$ by $(-1)^p$. Note that
both sides are derivations, so it suffices to verify they agree on the
generators $\Sigma^{-1}{\mathbf{L}}$. Fixing
${\underline{x}} \in \Sigma^{-1} {\mathbf{L}}$ the desuspension of
$x \in {\mathbf{L}}$, if
$\delta_{\mathbf{L}}(x) = \sum_i x_i \boxplus x'_i$ we have
$d{\underline{x}} = \sum_i {\underline{x}}_i \boxplus{\underline{x}}'_i$.

Writing the middle two terms in
[\[eqn:xi-computation\]](#eqn:xi-computation){reference-type="eqref"
reference="eqn:xi-computation"} as
$({\overline{\zeta}}+{\overline{\zeta}}\circ \sigma)(x \boxplus y)$, we
compute $$\begin{align*}
 \xi^{\mathrm{Com}} \circ d({\underline{x}}) &= d({\underline{x}}) \boxbackslash 1+({\overline{\zeta}}+{\overline{\zeta}}\circ \sigma) \circ \delta_{\mathbf{L}}({\underline{x}})+1 \boxbackslash d({\underline{x}}), \\
(d \boxbackslash{\mathrm{id}}+\epsilon\, {\mathrm{id}}\boxbackslash d) \circ \xi^{\mathrm{Com}}({\underline{x}}) &= d({\underline{x}}) \boxbackslash 1+1 \boxbackslash d({\underline{x}}),
\end{align*}$$ where there is no sign $\epsilon$ because $1$ is in even
degree. This establishes the result after incorporating a minus sign
from the desuspension;
$\sigma \circ \delta_{\mathbf{L}}({\underline{x}}) = - {\underline{\sigma \circ \delta_{\mathbf{L}}(x)}}$
when ${\mathbf{L}}$ is concentrated in even degree so
$({\overline{\zeta}}+{\overline{\zeta}} \circ \delta) \circ \delta_{\mathbf{L}}({\underline{x}})$
vanishes if and only if $\zeta^{\mathrm{alt}}\circ \delta(x)$ does. ◻
:::

::: proof
*Proof of [34](#prop:coproduct-on-cobar){reference-type="ref+label"
reference="prop:coproduct-on-cobar"}.* Using
[13](#lem:sth-coproduct-symmetry){reference-type="ref+label"
reference="lem:sth-coproduct-symmetry"} for
${{{\mathscr{S}}{\mathrm{t}}}^2}$ with coproduct $\Delta^{(2)}$ or
[20](#lem:stl-cobracket-vanishing){reference-type="ref+label"
reference="lem:stl-cobracket-vanishing"} for
${{{\mathscr{S}}{\mathrm{t}}}^\infty}$ with cobracket $\delta$, the
previous lemma provides the maps $\Delta$ as soon as we verify these
induce the correct coproduct on ${{\mathscr{S}}{\mathrm{t}}}$. We give
the details in the second case, as it is most relevant to this paper and
the first case is entirely analogous. We will use the description from
[10](#prop:st-explicit-prod-coprod){reference-type="ref+label"
reference="prop:st-explicit-prod-coprod"} of the coproduct on
${{\mathscr{S}}{\mathrm{t}}}$ in terms of a shuffle coproduct on
apartment classes, whose proof does not rely on this proposition.

In these terms, the augmentation map for the Lie coalgebra cobar complex
is the unique multiplicative extension
$$S^\bullet 1_! {\mathds{k}}[1] \longrightarrow{{\mathscr{S}}{\mathrm{t}}}$$
of the identification
${\mathds{k}}[1] \cong {\mathrm{St}}^{\infty}_1(F)$. When evaluated on
$F^n$, the left side is spanned by symbols
$[L_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},L_n]$ indexed
by decompositions $L_1 \oplus \cdots \oplus L_n = F^n$ into lines, up to
the relation
$[L_{\sigma(1)},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},L_{\sigma(n)}] = (-1)^\sigma [L_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},L_n]$,
and the map is given by sending this to the corresponding apartment
class. We now observe that the shuffle coproduct of
[\[eqn:st-coproduct\]](#eqn:st-coproduct){reference-type="eqref"
reference="eqn:st-coproduct"} is the unique map
${{\mathscr{S}}{\mathrm{t}}}\to {{\mathscr{S}}{\mathrm{t}}}\boxbackslash{{\mathscr{S}}{\mathrm{t}}}$
of commutative algebras extending
$[v] \mapsto [v] \boxbackslash 1+ 1\boxbackslash[v]$ and hence is
compatible with the maps $\xi^{\mathrm{Com}}$. ◻
:::

## Higher apartments

The purpose of this section is to give a conceptual explanation of the
origin of the Steinberg correlators that generate
${\mathrm{St}}^{\infty}_n$. It may be skipped on a first reading; it is
used later only to justify some formulas, but that can also be done by
hand. Given an affine basis of $F^n$, we construct an "apartment class"
map
${\mathrm{apt}} \colon  {\mathrm{Lie}}^\vee_{n+1} \otimes {\mathds{Q}}_{\mathrm{sign}} \to {\mathrm{St}}_n$
and then extract from this by Koszul duality a "higher apartment class"
map
${\mathrm{apt}}_{{\mathrm{{\mathrm{coLie}}}}} \colon {\mathrm{cycLie}}^\vee_n \otimes {\mathds{Q}} \to {\mathrm{St}}^{\infty}_n$
whose image contains Steinberg correlator
${\mathrm{C}}[u_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n]$.
This construction may be used to justify the formula for the cobracket
of Steinberg correlators of
[24](#prop:stl-explicit-cobracket){reference-type="ref+label"
reference="prop:stl-explicit-cobracket"}, as presaged in [@Goncharov01
§5.1] (it is related to the genus zero case of [@Gon19 §6, §8]). We
follow [1](#conv:shorter-notation){reference-type="ref+label"
reference="conv:shorter-notation"}.

### Restriction to subspaces of a fixed module

For a vector space $V$, we let ${\mathrm{Sub}}(V)$ be the discrete
category of subspaces of $V$. This admits a symmetric promonoidal
structure with $k$-fold iterated tensor products, for $k \geq 0$, given
by the "internal sum if disjoint" functor $$\begin{align*}
\oplus_k \colon {\mathrm{Sub}}(V)^k &\mathrel{\mathpalette\superimpose{{\longrightarrow}{\shortmid}}}{\mathrm{Sub}}(V) \\
(V_1,\ldots,V_k,W) &\longmapsto \begin{cases} \ast & \text{if $V_1 \oplus \cdots \oplus V_k \overset{\cong}\longrightarrow W$,} \\
\varnothing & \text{otherwise.}\end{cases}
\end{align*}$$ There is a lax symmetric promonoidality on the functor
$$\begin{align*}
j_V \colon {\mathrm{Sub}}(V) & \longrightarrow{\mathrm{Vect}}\\
(W \subseteq V) &\longmapsto W
\end{align*}$$ which induces a lax symmetric monoidality, with respect
to the Day convolution symmetric monoidal structures, on the restriction
functor
$$j_V^* \colon {\mathrm{Fun}}({\mathrm{Vect}},{\mathscr{C}}) \longrightarrow{\mathrm{Fun}}({\mathrm{Sub}}(V),{\mathscr{C}}).$$

::: lemma
**Lemma 36**. *$j_V^*$ is symmetric monoidal.*
:::

::: proof
*Proof.* It is clear that $j^*_V$ preserves the unit, and unwinding the
definitions the lax monoidality is given on the subspace $W \subseteq V$
by the map
$$\bigsqcup_{\substack{V_1,V_2 \subseteq W,\\V_1 \oplus V_2 \xrightarrow{\cong} W}} F(V_1) \otimes G(V_2) \longrightarrow\mathop{\mathrm{colim}}_{\substack{V_1,V_2 \to W,\\V_1 \oplus V_2 \xrightarrow{\cong} W}} F(V_1) \otimes G(V_2)$$
which is an isomorphism by a cofinality argument. ◻
:::

As a symmetric monoidal left adjoint, $j^*_V$ induces an equivalence
$$j^*_V({{{\mathscr{S}}{\mathrm{t}}}^\infty}) \simeq {\mathrm{indec}}^{\mathrm{nil}}_{E^{\mathrm{nu}}_\infty}(j^*_V({{\mathscr{S}}{\mathrm{t}}}))$$
in
${\mathrm{coAlg}}^{{\mathrm{nil}}}_{\mathrm{{\mathrm{coLie}}}}({\mathrm{Fun}}({\mathrm{Sub}}(V),{{\mathscr{D}}_{\mathds{Q}}}))$.
It is thus possible to understand the cobracket on
${{{\mathscr{S}}{\mathrm{t}}}^\infty}$ in terms of that on
$j^*_V({{{\mathscr{S}}{\mathrm{t}}}^\infty})$. The advantage of passing
to this restricted setting is that we may choose $V$ to come equipped
with additional structure, in this case an affine basis.

### Lie algebras of trees and derivations {#sec:lie-alg-trees-derivations}

In this section we describe some algebraic constructions that are used
below to understand better the Drinfeld--Kohno Lie algebra.

::: remark
*Remark 37*. Some of the references used below take completions of the
free associative and free Lie algebras, but the algebraic structures
preserve the free associative and free Lie algebras sitting inside their
completions, restricting to these.
:::

#### Associative variant {#sec:trees-as}

For the associative variant, we mostly follow [@AKKN]. We fix a finite
set $S$ and consider the free nonunital associative algebra on the
finite-dimensional vector space
$V_S \coloneq {\mathds{Q}}\{X_s \mid s \in S\}$ of symbols $X_s$ for
$s \in S$:
$${\mathsf{as}}_S \coloneqq {\mathrm{free}}^{{\mathrm{As}}^{\mathrm{nu}}}(V_S).$$
This admits an equivalent description in terms of trees: let
${\mathsf{rtree}}_S$ be the vector space spanned by isomorphism classes
of rooted finite trivalent planar trees whose leaves are labelled by
elements from the set of symbols $\{X_s \mid s \in S\}$, modulo the $IH$
(associativity) relation: for a subtree
($\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {0}}},\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {1}}},\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {2}}},\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {3}}}$
denote the remainder of the rooted tree, with root in
$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {0}}}$) we have
$$\begin{tikzpicture}[scale=.6,baseline]
    \node at (0,0) {$\bullet$};
    \node at (-1,1) [above] {$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {1}}}$};
    \node at (1,1) {$\bullet$};
    \node at (0,2) [above] {$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {2}}}$};
    \node at (2,2) [above] {$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {3}}}$};
    \node at (0,-1) [below] {$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {0}}}$};
    \draw (0,-1) --(0,0) -- (-1,1);
    \draw (0,0) -- (1,1) -- (0,2);
    \draw (1,1) -- (2,2);
\end{tikzpicture} \, = \, \begin{tikzpicture}[scale=.6,baseline]
    \node at (0,0) {$\bullet$};
    \node at (1,1) [above] {$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {3}}}$};
    \node at (-1,1) {$\bullet$};
    \node at (-2,2) [above] {$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {1}}}$};
    \node at (0,2) [above] {$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {2}}}$};
    \node at (0,-1) [below] {$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {0}}}$};
    \draw (0,-1) --(0,0) -- (1,1);
    \draw (0,0) -- (-1,1) -- (0,2);
    \draw (-1,1) -- (-2,2);
\end{tikzpicture}$$ Equivalence classes of such trees are rooted planar
corollas and these correspond to words in the alphabet
$\{X_s \mid s \in S\}$, in the sense that multiplication in the order
described by the tree induces an isomorphism of vector spaces
$${\mathsf{rtree}}_S \overset{\cong}\longrightarrow{\mathsf{as}}_S.$$
Under this isomorphism, the multiplication is given on the left side by
taking the disjoint union of trees and joining their roots into a
trivalent vertex: $$\begin{tikzpicture}[scale=.6, baseline]
    \node at (0,.5) [above] {$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {1}}}$};
    \draw (0,-.5) -- (0,.5);
\end{tikzpicture} \, \cdot \, \begin{tikzpicture}[scale=.6,baseline]
    \node at (0,.5) [above] {$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {2}}}$};
    \draw (0,-.5) -- (0,.5);
\end{tikzpicture} =  \begin{tikzpicture}[scale=.6,baseline]
    \node at (0,0) {$\bullet$};
    \node at (-1,1) [above] {$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {1}}}$};
    \node at (1,1)  [above] {$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {2}}}$};
    \draw (0,-1) --(0,0) -- (-1,1);
    \draw (0,0) -- (1,1);
\end{tikzpicture}$$ There is a Lie algebra of derivations
${\mathsf{der}}_S$ of ${\mathsf{as}}_S$ with two distinguished Lie
subalgebras. Firstly, the *tangential derivations* are given by
$${\mathsf{tder}}_S \coloneq \{D \mid \text{for all $s \in S$ we have $D(X_s) = [a_s,X_s]$ for some $a_s \in {\mathsf{as}}_S$}\} \subseteq {\mathsf{der}}_S,$$
and secondly the *special derivations* are given by
$${\mathsf{sder}}_S \coloneq \{D \mid D({\textstyle \sum_{s \in S} X_s}) = 0\} \subseteq {\mathsf{tder}}_S.$$
A tangential derivation $D$ is uniquely determined by the elements $a_s$
such that $D(X_s) = [a_s,X_s]$, which yields a split short exact
sequence [@AKKN Remark 2.1]
$$0 \longrightarrow{\textstyle \prod_{s \in S} {\mathsf{as}}_s} \longrightarrow{\textstyle \prod_{s \in S} {\mathsf{as}}_S} \longrightarrow{\mathsf{tder}}_S \longrightarrow 0$$
with left map induced by the inclusions
${\mathsf{as}}_s \to {\mathsf{as}}_S$ for $s \in S$, inducing an
isomorphism $\rho$ between ${\mathsf{tder}}_S$ and tuples
$(a_s)_{s \in S}$ so that $a_s$ is the kernel of the map sending all
$X_{s'}$ for $s' \neq s$ to zero. Doing so, for
$D = \rho((a_s)_{s \in S})$ and $D' = \rho((a'_s)_{s \in S})$ we have
$[D,D'] = \rho((D(a'_s)-D'(a_s)-[a_s,a'_s])_{s \in S})$; the difference
in sign with the reference is due to them rather defining $a_s$ by
$D(X_S) = [X_S,a_s]$, cf. [@AKKN p. 7].

The Lie subalgebra ${\mathsf{sder}}_S$ of special derivations can be
identified with the summand of the space of cyclic words in the alphabet
$\{X_s \mid s \in S\}$, given by
$|{\mathsf{as}}_S| \coloneq {\mathsf{as}}_S/[{\mathsf{as}}_S,{\mathsf{as}}_S]$,
of those words in which at least two distinct letters occur. Additively,
$|{\mathsf{as}}_S|$ can be described using that the nonunital
associative operad ${\mathrm{As}}^{\mathrm{nu}}$ extends to a cyclic
operad ${\mathrm{cycAs}}^{\mathrm{nu}}$ and taking
$$|{\mathsf{as}}_S| \coloneq \bigoplus_{n \geq 1} {\mathrm{cycAs}}^{\mathrm{nu}}_n \otimes_{{\mathfrak{S}}_{n+1}} V_S^{\otimes (n+1)}.$$
That is, there is an isomorphism [@AKKN Lemma 8.3] (using Remark 2.1
loc.cit.) $$\begin{align*}
 |{\mathsf{as}}_S|/{\textstyle \prod_{s \in S} |{\mathsf{as}}_s|} &\overset{\cong}\longrightarrow{\mathsf{sder}}_S \\
|a| & \longmapsto (a_s)_{s \in S}
\end{align*}$$ where the tuple $(a_s)_{s \in S}$ is determined by
$N(|a|) = \sum_{s \in S} X_s a_s$, where
$N \colon |{\mathsf{as}}_S| \to {\mathsf{as}}_S$ is the symmetrisation
map sending a cyclic word $|z| = z_1\cdots z_k$ to
$\sum_{1 \leq j \leq k} z_j \cdots z_k z_1\cdots z_{j-1}$. Under this
isomorphism, the bracket of derivations is given by the (negative of
the) Kirillov--Kostant--Souriau Lie bracket with explicit formula as in
[@AKKN p. 25]; if $|z| = z_0\cdots z_k$ and $|w| = w_0\cdots w_\ell$
then $$\begin{equation}
\label{eqn:kks-bracket} [|z|,|w|] = -\sum_{i=0}^k\sum_{j=0}^\ell \delta_{z_i,w_j} \left(\parbox{6.5cm}{\centering $w_1\cdots w_{j-1} z_{i+1}\cdots z_k z_1 \cdots z_i w_{j+1} \cdots w_\ell$ \\
$- w_1\cdots w_{j-1} z_{i}\cdots z_k z_1 \cdots z_{i-1} w_{j+1} \cdots w_\ell$}\right).
\end{equation}$$ This in turn admits an equivalent description in terms
of cyclic trees: let ${\mathsf{tree}}_S$ be the vector space spanned by
isomorphism classes of finite trivalent planar trees whose leaves are
labelled by elements from the set of symbols $\{X_s \mid s \in S\}$,
modulo the $IH$ relation (now without root). Equivalence classes of such
cyclic trees are in bijection with planar corollas corresponding to
cyclic words in the alphabet $\{X_s \mid s \in S\}$, and multiplication
in cyclic order induces an isomorphism
$${\mathsf{tree}}_S \overset{\cong}\longrightarrow|{\mathsf{as}}_S| \qquad \qquad \begin{tikzpicture}[scale=.6,baseline]
    \node at (0,0) {$\bullet$};
    \foreach \i in {0,...,5} 
    {
    \draw (0,0) -- (360/6*\i:1);
    \node at (-360/6*\i:1.5) {$X_{z_\i}$};
    }
\end{tikzpicture}  \longmapsto X_{z_0}X_{z_1}\cdots X_{z_5}.$$ The Lie
bracket on cyclic words is given in terms of cyclic trees as follows:
for two cyclic trees $T_1,T_2$,
$[T_1,T_2] = T_1 \circ T_2 - T_2 \circ T_1$ where $T_1 \circ T_2$ is
given by the sum over $s \in S$, all leaves of $T_1$ labelled by $X_s$,
and all leaves of $T_2$ labelled by $X_s$, of $T_1$ and $T_2$ joined at
these leaves to a trivalent vertex labelled by $X_s$. The following is
an example: $$\begin{tikzpicture}[scale=.6,baseline]
    \node at (0,0) {$\bullet$};
    \foreach \i in {0,...,5} 
    {
    \draw (0,0) -- (360/6*\i:1);
    \node at (-360/6*\i:1.5) {$X_{z_\i}$};
    }
\end{tikzpicture} \circ \begin{tikzpicture}[scale=.6,baseline]
    \node at (0,0) {$\bullet$};
    \foreach \i in {0,...,3} 
    {
    \draw (0,0) -- (360/4*\i:1);
    \node at (-360/4*\i:1.5) {$X_{w_\i}$};
    }
\end{tikzpicture} = \sum_{i=0}^5 \sum_{j=0}^3 \delta_{z_i,w_j}  
\begin{tikzpicture}[scale=.6,baseline]
    \node at (0,0) {$\bullet$};
    \foreach \i in {0,...,5} 
    {
    \draw (0,0) -- (360/6*\i:1);
    }
    \foreach \i in {1,...,5} 
    {
    \node at (-360/6*\i:1.5) {$X_{z_{i+\i}}$};
    }
    \begin{scope}[xshift=4cm]
    \node at (0,0) {$\bullet$};
    \foreach \i in {0,...,3} 
    {
    \draw (0,0) -- (360/4*\i:1);
    }
    \node at (-360/4*-1:1.5) {$X_{w_{j-1}}$};
    \node at (-360/4*0:1.5) {$X_{w_{j}}$};
    \node at (-360/4:1.5) {$X_{w_{j+1}}$};
    \end{scope}
    \draw (0,0) -- (4,0);
    \node at (2,0) {$\bullet$};
    \draw (2,0) -- (2,-2);
    \node at (2,-2) [below] {$X_{z_i} = X_{w_j}$};
\end{tikzpicture}$$ where we remark that the right picture can be
collapsed to a 9-valent corolla.

Moreover, ${\mathsf{sder}}_S$ acts on ${\mathsf{as}}_S$ and the
description in terms of trees is as follows: for a cyclic tree $T$ and
rooted tree $R$, $D_T(R)$ is given by the sum over $s \in S$, all leaves
of $T$ labelled by $X_s$, and all leaves $R$ labelled by $X_s$, of these
leaves joined into a single edge.

#### The Lie representation and its dual {#sec:lie-rep}

Before moving on the Lie variant, we recall some representations that
will appear in that setting. First, let us construct a pair of
${\mathds{Z}}[{\mathfrak{S}}_n]$-modules:

::: definition
**Definition 38**.  

(i) Let ${\mathrm{Lie}}_n$ be the span of those Lie words containing
    each generator exactly once in the free Lie algebra on generators
    $X_1,\ldots,X_n$.

(ii) Let ${\mathrm{Lie}}_n^\vee$ denote its linear dual
     ${\mathrm{Hom}}_{\mathds{Z}}({\mathrm{Lie}}_n,{\mathds{Z}})$.
:::

The former can be identified with the
${\mathds{Z}}[{\mathfrak{S}}_n]$-module of rooted trivalent trees with a
cyclic order at each vertex whose leaves are in bijection with
${\underline{n}}$, modulo the AS (anti-symmetry) and IHX (Jacobi)
relations; we call these *Lie trees*. These relations apply to a subtree
($\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {0}}},\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {1}}},\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {2}}},\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {3}}}$
denote the remainder of the rooted tree, with root in
$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {0}}}$) and are given
respectively by: $$\begin{tikzpicture}[scale=.6,baseline]
    \node at (0,0) {\rotatebox{-45}{$\circlearrowright$}};
    \node at (-1,1) [above] {$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {1}}}$};
    \node at (1,1) [above] {$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {2}}}$};
    \node at (0,-1) [below] {$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {0}}}$};
    \draw (0,-1) --(0,0) -- (-1,1);
    \draw (0,0) -- (1,1);
\end{tikzpicture} \, = -\, \begin{tikzpicture}[scale=.6,baseline]
    \node at (-1,1) [above] {$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {2}}}$};
    \node at (1,1) [above] {$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {1}}}$};
    \node at (0,-1) [below] {$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {0}}}$};
    \draw (0,-1) --(0,0) -- (-1,1);
    \draw (0,0) -- (1,1);
    \node at (0,0) {\rotatebox{45}{$\circlearrowleft$}};
\end{tikzpicture}$$ $$\begin{tikzpicture}[scale=.6,baseline]
    \draw (-1,-1) -- (0,-.4) -- (1,-1);
    \draw (1,1) -- (0,.4) -- (-1,1);
    \draw (0,-.4) -- (0,.4);
    \node at (0,-.4) {\rotatebox{45}{$\circlearrowleft$}};
    \node at (0,.4) {\rotatebox{45}{$\circlearrowleft$}};
    \node at (1,1) [above right] {$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {2}}}$};
    \node at (-1,1) [above left] {$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {1}}}$}; 
    \node at (1,-1) [below right] {$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {3}}}$};
    \node at (-1,-1) [below left] {$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {0}}}$};
\end{tikzpicture}=
\begin{tikzpicture}[scale=.6,baseline]
    \draw (-1,-1) -- (-.4,0) -- (-1,1);
    \draw (1,-1) -- (.4,0) -- (1,1);
    \draw (-.4,0) -- (.4,0);
    \node at (-.4,0) {\rotatebox{45}{$\circlearrowleft$}};
    \node at (.4,0) {\rotatebox{45}{$\circlearrowleft$}};
    \node at (1,1) [above right] {$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {2}}}$};
    \node at (-1,1) [above left] {$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {1}}}$}; 
    \node at (1,-1) [below right] {$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {3}}}$};
    \node at (-1,-1) [below left] {$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {0}}}$};
\end{tikzpicture}
\,-\,\begin{tikzpicture}[scale=.6,baseline]
    \draw (-1,-1) -- (1,1);
    \draw [line width=1ex,white] (1,-1) -- (-1,1);
    \draw (1,-1) -- (-1,1);
    \draw (-.5,-.5) -- (.5,-.5);
    \node at (-.5,-.5) {\rotatebox{45}{$\circlearrowleft$}};
    \node at (.5,-.5) {\rotatebox{45}{$\circlearrowleft$}};
    \node at (1,1) [above right] {$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {2}}}$};
    \node at (-1,1) [above left] {$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {1}}}$}; 
    \node at (1,-1) [below right] {$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {3}}}$};
    \node at (-1,-1) [below left] {$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {0}}}$};
\end{tikzpicture}$$ If
$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {0}}}$ is the root,
$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {1}}} = X,\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {2}}} = Y,\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {3}}}=Z$,
these say $[X,Y] = -[Y,X]$ and $[[X,Y],Z]= [X,[Y,Z]] -[Y,[X,Z]]$. Its
linear dual can be identified with the quotient of the free
${\mathds{Z}}[{\mathfrak{S}}_n]$-module on a single generator by
$(i,n-i)$-shuffles for $1 \leq i \leq n-1$ [@Whitehouse Theorem 2.6].
(Over a field ${\mathds{k}}$ of characteristic zero, there is a
noncanonical isomorphism ${\mathrm{Lie}}_n \cong {\mathrm{Lie}}_n^\vee$
but this is not the case over the integers, and we find it illuminating
to distinguish them.)

By construction, we may identify ${\mathrm{Lie}}_n$ with the space of
$n$-ary operations of the operad ${\mathrm{Lie}}$. Since the operad
${\mathrm{Lie}}$ extends to a cyclic operad ${\mathrm{cycLie}}$
[@GetzlerKapranov 3.9(c)], ${\mathrm{Lie}}_n$ must be the restriction of
a ${\mathds{Z}}[{\mathfrak{S}}_{n+1}]$-module ${\mathrm{cycLie}}_n$ and
dually ${\mathrm{Lie}}^\vee_n$ must be the restriction of a
${\mathds{Z}}[{\mathfrak{S}}_{n+1}]$-module ${\mathrm{cycLie}}^\vee_n$.
The former can be described as
${\mathds{Z}}[{\mathfrak{S}}_{n+1}]$-module of trivalent trees with a
cyclic order at each vertex whose leaves are in bijection with the set
$[n] = \{0,1,\ldots,n\}$, modulo AS and IHX relations; we call these
*cyclic Lie trees*. The latter was described by Whitehouse:
${\mathrm{cycLie}}^\vee_n$ is the quotient of the free
${\mathds{Z}}[{\mathfrak{S}}_{n+1}]$-module on a single generator by
$(i,n-i)$-shuffles for $1 \leq i \leq n-1$ and cyclic symmetry
[@Whitehouse p. 317, 319].

#### Lie variant {#sec:trees-lie}

There is a closely related Lie variant of the associative construction
in [3.2.1](#sec:trees-as){reference-type="ref+label"
reference="sec:trees-as"}, and in explaining it we mostly follow
[@AlekseevTorossian]. We again fix a finite set $S$ and consider the
free Lie algebra on the vector space
$V_S = {\mathds{Q}}\{X_s \mid s \in S\}$ of symbols $X_s$ for $s \in S$:
$${\mathfrak{lie}}_S \coloneq {\mathrm{free}}_{{\mathrm{Lie}}}(V_S).$$
This admits a description in terms of Lie trees: let
${\mathfrak{rtree}}_S$ be the vector space spanned by isomorphism
classes of rooted finite trivalent trees with a cyclic order at each
vertex whose leaves are labelled by elements from the set of symbols
$\{X_s \mid s \in S\}$, modulo the AS and IHX relations. Equivalence
classes of Lie trees correspond to Lie words in the alphabet
$\{X_s \mid s \in S\}$, in the sense that sending a trivalent vertex
with positive cyclic order to the Lie bracket induces an isomorphism of
vector spaces
$${\mathfrak{rtree}}_S \overset{\cong}\longrightarrow{\mathfrak{lie}}_S.$$
Under this isomorphism, the Lie bracket is given on the left side by
taking the disjoint union of trees and joining their roots into a
trivalent vertex with positive cyclic order:
$$\left[\begin{tikzpicture}[scale=.6, baseline]
    \node at (0,.5) [above] {$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {1}}}$};
    \draw (0,-.5) -- (0,.5);
\end{tikzpicture} \, , \, \begin{tikzpicture}[scale=.6,baseline]
    \node at (0,.5) [above] {$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {2}}}$};
    \draw (0,-.5) -- (0,.5);
\end{tikzpicture}\right] =  \begin{tikzpicture}[scale=.6,baseline]
    \node at (0,0) {\rotatebox{45}{$\circlearrowleft$}};
    \node at (-1,1) [above] {$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {1}}}$};
    \node at (1,1)  [above] {$\raisebox{.5pt}{\textcircled{\raisebox{-.9pt} {2}}}$};
    \draw (0,-1) --(0,0) -- (-1,1);
    \draw (0,0) -- (1,1);
\end{tikzpicture}$$

There is a Lie algebra ${\mathfrak{der}}_S$ of derivations of
${\mathfrak{lie}}_S$ with two distinguished Lie subalgebras. Firstly,
the *tangential derivations* are given by
$${\mathfrak{tder}}_S \coloneq \{D \mid \text{for all $s \in S$ we have $D(X_s) = [a_s,X_s]$ for some $a_s \in {\mathfrak{lie}}_S$}\}\subseteq {\mathfrak{der}}_S,$$
and secondly the *special derivations* are given by
$${\mathfrak{sder}}_S \coloneq \{D \mid D(\textstyle{\sum_{s \in S} X_s})=0\} \subseteq {\mathfrak{tder}}_S.$$
A tangential derivation $D$ is uniquely determined by the elements $a_s$
such that $D(X_s) = [a_s,X_s]$, which yields a split short exact
sequence [@AlekseevTorossian Remark 3.3]
$$0 \longrightarrow{\textstyle \prod_{s \in S} {\mathfrak{lie}}_s} \longrightarrow{\textstyle \prod_{s \in S} {\mathfrak{lie}}_S} \longrightarrow{\mathfrak{tder}}_S \longrightarrow 0$$
inducing an isomorphism $\rho$ between ${\mathfrak{tder}}_S$ and tuples
$(a_s)_{s \in S}$ so that $a_s$ is in the kernel of the map sending all
$X_{s'}$ for $s' \neq s$ to zero. Doing so, for
$D= \rho((a_s)_{s \in S})$ and $D' = \rho((a'_s)_{s \in S})$ we have
$[D,D'] = \rho((D(a'_s)-D'(a_s)-[a_s,a_{s'}])_{s \in S})$
[@AlekseevTorossian p. 423]; the sign difference has the same origin as
in the associative variant.

The Lie subalgebra ${\mathfrak{sder}}_S$ of special derivations can be
identified with the summand of the space of cyclic Lie words in the
alphabet $\{X_s \mid s \in S\}$ of those words in which at least two
distinct letters occur (this only rules out the case where no
bracketings are present). Additively, this space is given by first
recalling that the Lie operad ${\mathrm{Lie}}$ extends to a cyclic
operad ${\mathrm{cycLie}}$ and then taking
$$|{\mathfrak{lie}}_S| \coloneq \bigoplus_{n \geq 1} {\mathrm{cycLie}}_n \otimes_{{\mathfrak{S}}_{n+1}} V_S^{\otimes (n+1)}.$$
That is, there is an isomorphism $$\begin{align*}
 |{\mathfrak{lie}}_S|/{\textstyle \prod_{s \in S} |{\mathfrak{lie}}_s|} &\overset{\cong}\longrightarrow{\mathfrak{sder}}_S \\
    |a| &\longmapsto (a_s)_{s \in S}.
\end{align*}$$ This admits a description in terms of cyclic Lie trees:
let ${\mathfrak{tree}}_S$ be the vector space spanned by isomorphism
classes of finite trivalent trees with a cyclic order at each vertex
whose leaves are labelled by elements from $\{X_s \mid s \in S\}$,
modulo the AS and IHX relations. Equivalence classes of cyclic Lie trees
correspond to cyclic Lie words in the alphabet $\{X_s \mid s \in S\}$,
in the sense that there is an isomorphism of vector spaces
$${\mathfrak{tree}}_S \overset{\cong}\longrightarrow|{\mathfrak{lie}}_S|.$$
There is an isomorphism $$\begin{align*}
{\mathfrak{tree}}_S/{\textstyle \prod_{s \in S} {\mathfrak{tree}}_s} & \overset{\cong}\longrightarrow{\mathfrak{sder}}_S \\
\Gamma &\longmapsto (a_s)_{s \in S}
\end{align*}$$ given on a tree $\Gamma$ by letting $a_s$ be given by a
sum over all leaves of $\Gamma$ with label $s$, of the Lie tree obtained
by interpreting that leaf as a root [@AlekseevTorossian Section 2.2.1]
(see also [@Felder Appendix A]). Under this isomorphism, the Lie bracket
on ${\mathfrak{sder}}_S$ is given as follows: for two cyclic Lie trees
$T_1,T_2$, the bracket $[T_1,T_2]$ is given by the sum over all
$s \in S$, all leaves of $T_1$ labelled by $X_s$, and all leaves of
$T_2$ labelled by $X_s$, of $T_1$ and $T_2$ joined at these leaves to a
trivalent vertex with positive orientation and remaining leaf labelled
by $X_s$. Similarly, the action of ${\mathfrak{sder}}_S$ on
${\mathfrak{lie}}_S$ is given as follows: for a cyclic Lie tree $T$ and
a rooted Lie tree $R$, $D_T(R)$ is given by the sum over $s \in S$, all
leaves of $T$ labelled by $X_s$, and all leaves of $R$ labelled by
$X_s$, of those leaves joined into a single edge.

#### Comparison of the associative and Lie variant {#sec:trees-comp}

As the similarity of the descriptions of the associative and Lie
variants suggests, there are inclusions
$${\mathfrak{lie}}_S \longrightarrow{\mathsf{as}}_S \qquad \text{and} \qquad {\mathfrak{sder}}_S \longrightarrow{\mathsf{sder}}_S$$
given by including a free Lie algebra into its universal enveloping
algebra and uniquely extending a special derivation of a free Lie
algebra to the one of its universal enveloping algebra. It is clear from
the constructions that these maps are compatible with the Lie brackets
on the free algebras and special derivations, and the actions of special
derivations on the corresponding free algebras [@AKKN p. 7].

#### Relationship to universal traces

The above discussion is related to universal invariant bilinear forms,
due to Drinfeld [@Drinfeld p. 856]: for a Lie algebra ${\mathfrak{g}}$
define a vector space
$$\mathscr{F}({\mathfrak{g}}) \coloneqq \frac{{\mathfrak{g}} \otimes {\mathfrak{g}}}{[X,Y] \otimes Z - X \otimes [Y,Z] \text{ and } X\otimes Y-Y \otimes X}.$$
In [@AlekseevTorossianNote Section 2.2] it is proven that there is an
isomorphism of vector spaces
$$\mathscr{F}({\mathfrak{lie}}_S) \overset{\cong}\longrightarrow{\mathfrak{tree}}_S$$
given on a pair $X \otimes Y$ of Lie words in the $X_s$ by interpreting
them as rooted trees and connecting their roots. In [@Drinfeld p. 857],
Drinfeld described the composite homomorphism
$$\mathscr{F}({\mathfrak{lie}}_S) \overset{\cong}\longrightarrow{\mathfrak{tree}}_S \longrightarrow{\mathfrak{sder}}_S$$
which is a surjection of Lie algebras (the only elements in the kernel
are of the form $X_s \otimes X_s$) if the domain is given the Kirillov
bracket, see also [@KontsevichFormal Section 6]. This gives another
construction of the Lie bracket of special derivations.

::: remark
*Remark 39*. Additively, the construction of Drinfeld is a special
instance of one for cyclic operads due to Getzler--Kapranov: inspecting
[@GetzlerKapranov Definition 4.7] we note there is an equality
$\mathscr{F}({\mathfrak{g}}) = \lambda({\mathrm{cycLie}},{\mathfrak{g}})$.
The left side is defined for any cyclic operad ${\mathscr{P}}$ and
${\mathscr{P}}$-algebra $A$. If the latter is a free
${\mathscr{P}}$-algebra one gets an isomorphism [@GetzlerKapranov
Proposition 4.9], originally outlined in the cases
$\mathscr{P} = {\mathrm{Lie}},{\mathrm{Comm}},{\mathrm{Ass}}$ by
Kontsevich [@KontsevichFormal Section 4, 5]:
$$\bigoplus_{n \geq 0} {\mathscr{P}}(n) \otimes_{{\mathfrak{S}}_{n+1}} V^{\otimes (n+1)} \overset{\cong}\longrightarrow\lambda({\mathscr{P}},{\mathrm{free}}_{\mathscr{P}}(V))$$
induced by thinking of ${\mathscr{P}}(n) \otimes V^{\otimes (n+1)}$ as
$V \otimes ({\mathscr{P}}(n) \otimes V^{\otimes n})$ and mapping this to
${\mathrm{free}}_{\mathscr{P}}(V) \otimes {\mathrm{free}}_{\mathscr{P}}(V)$
in the evident manner.
:::

#### Dual Lie coalgebras {#sec:sder-dual}

Linearly dualising the discussions in
[\[sec:trees-as,sec:trees-lie\]](#sec:trees-as,sec:trees-lie){reference-type="ref+label"
reference="sec:trees-as,sec:trees-lie"}, degreewise by putting the
generators in degree $1$, we obtain from
[3.2.4](#sec:trees-comp){reference-type="ref+label"
reference="sec:trees-comp"} a pair of surjective maps of Lie coalgebras
$${\mathsf{as}}_S^\vee \longrightarrow{\mathfrak{lie}}_S^\vee \qquad \text{and} \qquad {\mathsf{sder}}_S^\vee \longrightarrow{\mathfrak{sder}}_S^\vee$$
which are compatible with coactions of the duals of special derivations
of the duals of the corresponding free algebras. Let us use this to
deduce formulas for the cobracket and coaction.

<figure>
<p><span class="math display">\[\begin{align*}
X_{s_0}X_{s_1}\cdots X_{s_5} &amp;\leftrightsquigarrow
\begin{tikzpicture}[scale=.6,baseline]
    \node at (0,0) {$\bullet$};
    \foreach \i in {0,...,5}
    {
    \draw (0,0) -- (360/6*\i:1);
    \node at (-360/6*\i:1.5) {$X_{s_\i}$};
    }
\end{tikzpicture} \\
{\mathrm{AC}}[X_{s_0}:X_{s_1}:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:X_{s_5}]
&amp;\leftrightsquigarrow \begin{tikzpicture}[scale=.6,baseline]
    \foreach \i in {0,...,5}
    {
    \node at (-360/6*\i:1) {$\bullet$};
    \draw (360/6*\i+360/6:1) -- (360/6*\i:1);
    \node at (-360/6*\i:1.7) {$X_{s_\i}$};
    }
\end{tikzpicture}
\end{align*}\]</span></p>
<figcaption>A pictorial interpretation of duals to cyclic words,
compatible with our discussion of infinite Steinberg modules, is as
polygons.</figcaption>
</figure>

Firstly, ${\mathsf{as}}_S^\vee$ is additively generated by symbols dual
to nonempty words in the $\{X_s \mid s \in S\}$ or equivalently planar
rooted corollas with leaves labelled by these symbols. That is, a
nonempty word
$X_{s_1}\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}X_{s_n}$ for
$n \geq 1$ has a dual symbol
${\mathrm{AI}}[X_{s_1},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},X_{s_n}]$
and in terms of these the dual cobracket, which we will denote
$\delta_{\mathrm{dec}}$, is simply deconcatenation:
$$\delta_{\mathrm{dec}}({\mathrm{AI}}[X_{s_1},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},X_{s_n}]) = \sum_{i=1}^{n-1} {\mathrm{AI}}[X_{s_1},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},X_{s_i}] \wedge {\mathrm{AI}}[X_{s_{i+1}},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},X_{s_n}].$$
Secondly, ${\mathsf{sder}}_S^\vee$ is additively generated by symbols
dual to the cyclic words in the symbols $\{X_s \mid s \in S\}$ or
equivalently planar corollas with leaves labelled by these symbols. That
is, a cyclic word
$X_{s_0}\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}X_{s_n}$ for
$n \geq 0$ has a dual symbol
${\mathrm{AC}}[X_{s_0}: \mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}: X_{s_n}]$
and these are by definition cyclically symmetric:
$${\mathrm{AC}}[X_{s_0}: X_{s_1}:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}: X_{s_n}] = {\mathrm{AC}}[X_{s_1}:X_{s_2}: \mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}: X_{s_0}].$$
The formula for the cobracket, which we will denote
$\delta_{\mathrm{cyc}}$, is dual to the formula
[\[eqn:kks-bracket\]](#eqn:kks-bracket){reference-type="eqref"
reference="eqn:kks-bracket"} for the KKS bracket and is given by
$$\delta_{\mathrm{cyc}}({\mathrm{AC}}[X_{s_0}: \mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}: X_{s_n}]) = \sum_{j=0}^n \sum_{i=1}^{n-1} {\mathrm{AC}}[X_{s_j}:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}: X_{s_{j+i}}] \wedge {\mathrm{AC}}[X_{s_j}:X_{s_{j+i+1}}:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}: X_{s_{j+n}}].$$

The surjective maps ${\mathsf{as}}_S^\vee \to {\mathfrak{lie}}_S^\vee$
and ${\mathsf{sder}}_S^\vee \to {\mathfrak{sder}}_S^\vee$ show that the
target is additively generated by similar symbols
${\mathrm{LI}}[X_{s_1},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},X_{s_n}]$
and
${\mathrm{LC}}[X_{s_0}:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}: X_{s_n}]$
that are the images of the above symbols. These additionally satisfy the
shuffle relations: $$\begin{align*}
\sum_{\sigma \in {\mathrm{Sh}}(n_1,n_2)} {\mathrm{LI}}[X_{s_{\sigma(1)}},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},X_{s_{\sigma(n_1+n_2)}}] &= 0 \quad \text{for $n=n_1+n_2$ with $n_1,n_2>0$,} \\
\sum_{\sigma \in {\mathrm{Sh}}(n_1,n_2)} {\mathrm{LC}}[X_{s_0}:X_{s_{\sigma(1)}}:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:X_{s_{\sigma(n_1+n_2)}}] &= 0 \quad \text{for $n=n_1+n_2$ with $n_1,n_2>0$}.
\end{align*}$$ Since the aforementioned surjective maps are maps of Lie
coalgebras, the cobrackets are given by the same formulas; the
additional information that we gain is that they are compatible with the
shuffle relations.

### The Arnold algebra and Drinfeld--Kohno Lie coalgebra

Before defining our higher apartment classes we recall the *Arnold
algebra*, and its Koszul dual Lie coalgebra, the *Drinfeld--Kohno Lie
coalgebra*. We then relate the latter to special derivations.

#### Definitions of the Arnold algebra and Drinfeld--Kohno Lie coalgebra

::: definition
**Definition 40**. For a finite set $S$ we define the *Arnold algebra*
to be the commutative algebra
$${\mathrm{Ar}}_S \coloneq \frac{{\mathrm{free}}_{\mathrm{Com}}({\mathds{Q}}\{\omega_{ij} \mid i,j \in S,\,i \neq j\})}{(1){-}(2)} \in {\mathrm{Alg}}_{\mathrm{Com}}({\mathrm{GrMod}}_{\mathds{Q}}).$$
where the generators $\omega_{ij}$ have degree $1$ and the relations are
given by

1.  $\omega_{ij} = \omega_{ji}$,

2.  $\omega_{ij}\omega_{jk}+\omega_{jk}\omega_{ki}+\omega_{ki}\omega_{ij} = 0$.
:::

For $S = {\underline{n}} \coloneq \{1,2,\ldots,n\}$,
${\mathrm{Ar}}_{\underline{n}}$ admits an action of the symmetric group
${\mathfrak{S}}_n$. For subsets $S_1,S_2 \subseteq S$ there is a
multiplication map
$m \colon {\mathrm{Ar}}_{S_1} \otimes {\mathrm{Ar}}_{S_2} \to {\mathrm{Ar}}_S$.
Define a graded vector space of (underived) indecomposables
$${\mathrm{Ar}}^{\mathrm{indec}}_{\underline{n}} \coloneqq {\mathrm{coker}}\left(\bigoplus_{\substack{S = S_1 \sqcup S_2 \\ S_1,S_2 \neq \varnothing}} {\mathrm{Ar}}_{S_1} \otimes {\mathrm{Ar}}_{S_2} \overset{m}\longrightarrow{\mathrm{Ar}}_{\underline{n}}\right)$$
as the summand that cannot be written as product of elements from
smaller subsets; this includes in particular all products of generators
where not all $i \in {\underline{n}}$ appear as an index. It is
concentrated in degree $n-1$ and in this degree the quotient
${\mathrm{Ar}}_{\underline{n}} \to {\mathrm{Ar}}^{\mathrm{indec}}_{{\underline{n}}}$
is an isomorphism. In fact, the degree $i$ part of
${\mathrm{Ar}}_{\underline{n}}$ can be expressed in terms of these as a
sum over partitions of ${\underline{n}}$ into disjoint subsets
$S_1,\ldots,S_r$ with $(|S_1|-1)+\cdots+(|S_r|-1)=i$ of terms
${\mathrm{Ar}}^{\mathrm{indec}}_{{\underline{S}}_1} \otimes \cdots \otimes {\mathrm{Ar}}^{\mathrm{indec}}_{{\underline{S}}_r}$
[@Cohen Section 6].

It is well-known that the Arnold algebra is a Koszul algebra, as we
explain now. For $S = {\underline{n}}$ the Arnold algebra in degree $r$
has a basis given by $\omega_{i_1j_1} \cdots \omega_{i_rj_r}$ where
$i_1<j_1, \dots i_r<j_r$, and $j_1<j_2<\dots<j_r$ [@Arnold Corollary 3].
Secondly, with this order we get a PBW basis in the sense of [@Priddy
Section 5.1], cf. [@Bezrukavnikov Corollary 2.2], and deduce Koszulity
as in [@Priddy Theorem 5.3]. Its Koszul Lie coalgebra is thus given by
its quadratic dual Lie coalgebra; this will be degreewise
finite-dimensional and may be more familiarly described through its
linear dual Lie algebra:

::: definition
**Definition 41**. For the finite set $S$ we define the *Drinfeld--Kohno
Lie algebra* to be
$${\mathrm{DK}}_S \coloneq \frac{{\mathrm{free}}_{\mathrm{Lie}}({\mathds{Q}}\{t_{ij} \mid i,j \in S,\,i \neq j\})}{(1){-}(3)}$$
where the generators $t_{ij}$ have degree $2$ and the relations are
given by

1.  $t_{ij} = t_{ji}$,

2.  $[t_{ij},t_{kl}] = 0$ if $\{i,j\} \cap \{k,l\} = \varnothing$,

3.  $[t_{ij},t_{ik}+t_{jk}] = 0$.
:::

::: remark
*Remark 42*. We deviate slightly from the usual discussion: often the
Arnold algebra is cohomologically graded with generators in degree 1 and
thus the generators of the quadratic Drinfeld--Kohno Lie algebra are in
degree 0. Here homological grading is more appropriate and the latter
appear in degree 2 instead. This has no consequences apart from some
degree shifts.
:::

There are inclusions
${\mathrm{DK}}_{{\underline{n}}\setminus \{i\}} \to {\mathrm{DK}}_{{\underline{n}}}$
split by maps setting all generators with $i$ among their indices to
zero. We define a graded vector space
$${\mathrm{tDK}}_{\underline{n}} \coloneq {\mathrm{coker}}\left(\bigoplus_{i \in {\underline{n}}} {\mathrm{DK}}_{{\underline{n}}\setminus \{i\}} \overset{{\mathrm{inc}}}\longrightarrow{\mathrm{DK}}_{\underline{n}}\right) \overset{\cong}\longleftarrow \bigcap_{i \in {\underline{n}}} \ker\left({\mathrm{DK}}_{{\underline{n}}} \to {\mathrm{DK}}_{{\underline{n}}\setminus \{i\}}\right)$$
with right isomorphism induced by the inclusion. It is the summand
spanned by those bracketings of generators where each
$i \in {\underline{n}}$ appears as an index. This is nonzero only in
degree $\geq 2n-2$.

::: remark
*Remark 43*. Taking $S = {\underline{n}}$, assigning to $\omega_{ij}$
the form
$\smash{\frac{1}{2\pi i}\frac{d(z_i-z_j)}{z_i-z_j}} \in \Omega^1_{\mathrm{dR}}({\mathrm{Conf}}_n({\mathds{C}});{\mathds{C}})$
induces an isomorphism [@Arnold]
$${\mathrm{Ar}}_{{\underline{n}}} \otimes {\mathds{C}} \overset{\cong}\longrightarrow H^*({\mathrm{Conf}}_n({\mathds{C}});{\mathds{C}}).$$
From this perspective, the degree completion of the Drinfeld--Kohno Lie
algebra ${\mathrm{DK}}_{\underline{n}}$ agrees with the Malcev
completion of the fundamental group of
${\mathrm{Conf}}_n({\mathds{C}})$. Alternatively, forgoing completion at
the cost of degree shifts and sign representations, one can replace
${\mathds{C}} = {\mathds{R}}^2$ by ${\mathds{R}}^d$ for $d>2$ and Malcev
completion with the homotopy Lie algebra, cf. [@BerglundKoszul Example
5.5].
:::

#### The Drinfeld--Kohno Lie algebra and special derivations {#sec:recol-dk-sder}

To better understand the Drinfeld--Kohno Lie algebra ${\mathrm{DK}}_S$,
one can think of it in terms of trees and special derivations. This is
summarised by the following diagram of Lie algebras
$$\begin{tikzcd} & {\mathrm{DK}}_S \dar[hook] & \\[-5pt]
{|{\mathfrak{lie}}_S|/{\textstyle \prod_{s \in S} |{\mathfrak{lie}}_S|}} \rar{\cong} & {\mathfrak{tree}}_S/{\textstyle \prod_{s \in S} {\mathfrak{tree}}_s} \rar{\cong} & {\mathfrak{sder}}_S,\end{tikzcd}$$
with definitions of the objects on the bottom row given in
[3.2](#sec:lie-alg-trees-derivations){reference-type="ref+label"
reference="sec:lie-alg-trees-derivations"}. Roughly, the vertical map
has target a quotient of a Lie algebra of trees with external vertices
labelled by $S$ and is determined as a map of Lie algebras by sending
the generator $t_{ij}$ to an edge connecting the vertices $i$ and $j$.
We will now provide details.

We first recall the description of the Drinfeld--Kohno Lie algebra in
terms of graphs. For a finite set $S$, a *graph with external vertices
$S$* will be an unoriented finite graph $\Gamma$ with a linear order on
its edges, a specified set $S$ of external vertices and possibly further
internal vertices, satisfying

1.  it has no double edges,

2.  it has no simple loops,

3.  all internal vertices are at least trivalent,

4.  all internal vertices are connected by a path to an external vertex,

5.  the (open) graph obtained by deleting the external vertices is
    connected ("internally connected"),

We let ${\mathsf{CG}}(S)$ [@SeveraWillwacher Section 2, 3] be the graded
vector space spanned by graph with external vertices $S$, modulo the
anti-symmetry relation $\Gamma^\sigma = (-1)^{\sigma} \Gamma$ where
$\Gamma^\sigma$ is obtained from $\Gamma$ by permuting the edges by
$\sigma$, and the grading of $\Gamma$ is
$1-\# \text{edges}+2 \# \text{internal vertices}$.

This admits the structure of an $L_\infty$-algebra whose differential
(increasing degree) is given by splitting each of the vertices in all
possible ways with new edge last in the order, and retaining only those
terms that are internally connected. Its binary bracket
$[\Gamma_1,\Gamma_2]$ is given by gluing $\Gamma_1$ and $\Gamma_2$ at
$S$, concatenating the order of orders, and applying the differential;
effectively, we sum over all $s \in S$ and all ways of gluing to a
tripod both an edge in $\Gamma_1$ attached to $s$ and an edge in
$\Gamma_2$ also attached to $s$:
$$\left[\begin{tikzpicture}[scale=.6,baseline]
   \foreach \i in {1,...,3} 
    {
    \node at (-360/3*\i:1.5) {$\i$};
    \node at (-360/3*\i:1) {$\bullet$};
    }
    \draw (-360/3*1:1) -- (-360/3*2:1);
\end{tikzpicture},
\begin{tikzpicture}[scale=.6,baseline]
   \foreach \i in {1,...,3} 
    {
    \node at (-360/3*\i:1.5) {$\i$};
    \node at (-360/3*\i:1) {$\bullet$};
    }
    \draw (-360/3*1:1) -- (-360/3*3:1);
\end{tikzpicture}\right] = \begin{tikzpicture}[scale=.6,baseline]
   \foreach \i in {1,...,3} 
    {
    \node at (-360/3*\i:1.5) {$\i$};
    \node at (-360/3*\i:1) {$\bullet$};
    \draw (-360/3*\i:1) -- (0,0);
    }
\end{tikzpicture}$$

The map sending $t_{ij}$ to the graph with a unique edge connecting the
external vertices $i$ and $j$ induces an isomorphism [@SeveraWillwacher
Proposition 2] (to deal with different conventions for encoding
orientations, see [@ConantVogtmann Section 2.3.1])
$${\mathrm{DK}}_S \overset{\cong}\longrightarrow H^0(\mathsf{CG}(S)).$$

We next define $\mathsf{CG}_\mathrm{tree}(S)$ as the quotient
$\mathsf{CG}(S)/F^1 \mathsf{CG}(S)$ by the first step of the filtration
by number of internal loops. The induced map of Lie algebras
[@SeveraWillwacher p. 185]
$$H^0(\mathsf{CG}(S)) \longrightarrow{\mathfrak{tree}}_S \cong H^0(\mathsf{CG}_\mathrm{tree}(S))$$
is injective. Here, as the notation suggests, the target can be
identified as the Lie algebra of internally connected trivalent internal
trees modulo the IHX relation. By construction, this map is uniquely
determined by sending $t_{ij}$ to the tree with a unique edge connecting
the external vertices $i$ and $j$, and bracket as described above.

We use this to better understand the Drinfeld--Kohno Lie algebra. Recall
from [3.2.2](#sec:lie-rep){reference-type="ref+label"
reference="sec:lie-rep"} that from the Lie operad we can extract
${\mathds{Z}}[{\mathfrak{S}}_n]$-modules ${\mathrm{Lie}}_n$ and
${\mathrm{Lie}}_n^\vee$, as well as a
${\mathds{Z}}[{\mathfrak{S}}_{n+1}]$-module ${\mathrm{cycLie}}_n$. They
admit the following topological interpretation, whose statement uses the
following objects: (i) the poset ${\mathscr{P}}({\underline{n}})$ of
proper nonempty partitions of the set ${\underline{n}}$ ordered by
inclusion, which admits an ${\mathfrak{S}}_n$-action by permuting the
elements of ${\underline{n}}$ and whose geometric realisation is
equivalent to a wedge of $(n-2)$-spheres, and (ii) the configuration
space ${\mathrm{Conf}}_n({\mathds{R}}^k)$ of $n$ ordered points in
${\mathds{R}}^k$ for $k \geq 2$.

::: {#lem:reps-top-interpretation .lemma}
**Lemma 44**. * *

(i) *[]{#enum:reps-top-interpretation-i
    label="enum:reps-top-interpretation-i"}
    ${\mathrm{Lie}}_n^\vee \otimes {\mathds{Z}}_{\mathrm{sign}} \overset{\cong}\longrightarrow\widetilde{H}_{n-2}({\mathscr{P}}({\underline{n}});{\mathds{Z}})$.*

(ii) *[]{#enum:reps-top-interpretation-ii
     label="enum:reps-top-interpretation-ii"}
     ${\mathrm{Lie}}_n \otimes {\mathds{Z}}_{\mathrm{sign}}^{\otimes (k-1)} \smash{\overset{\cong}\longrightarrow} \widetilde{H}_{(k-1)(n-1)}({\mathrm{Conf}}_n({\mathds{R}}^k);{\mathds{Z}})$.*

(iii) *[]{#enum:reps-top-interpretation-iii
      label="enum:reps-top-interpretation-iii"}
      ${\mathrm{Lie}}_{n}^\vee \otimes {\mathds{Q}}_{\mathrm{sign}} \smash{\overset{\cong}\longrightarrow} (\text{degree $n-1$ part of ${\mathrm{Ar}}^{\mathrm{indec}}_{\underline{n}}$})$.*

(iv) *[]{#enum:reps-top-interpretation-iv
     label="enum:reps-top-interpretation-iv"}
     ${\mathrm{cycLie}}_n \otimes {\mathds{Q}} \smash{\overset{\cong}\longrightarrow} (\text{degree $2n$ part of ${\mathrm{tDK}}_{[n]}$})$.*
:::

::: proof
*Proof.* Part
[\[enum:reps-top-interpretation-i\]](#enum:reps-top-interpretation-i){reference-type="eqref"
reference="enum:reps-top-interpretation-i"} is [@Robinson Theorem 4.1].
Part
[\[enum:reps-top-interpretation-ii\]](#enum:reps-top-interpretation-ii){reference-type="eqref"
reference="enum:reps-top-interpretation-ii"} uses that
${\mathrm{Conf}}_n({\mathds{R}}^k)$ is equivalent to the space of
$n$-ary operations in the $E_k$-operad. Using the identification of the
homology of this operad in terms of a shifted Poisson operad [@Sinha],
the result then follows from [@Cohen Theorem 6.1]. Part
[\[enum:reps-top-interpretation-iii\]](#enum:reps-top-interpretation-iii){reference-type="eqref"
reference="enum:reps-top-interpretation-iii"} is obtained from this by
taking $k=2$, linearly dualising, and recalling that the degree $n-1$
part of ${\mathrm{Ar}}_{\underline{n}}$ agrees with
${\mathrm{Ar}}^{\mathrm{indec}}_{{\underline{n}}}$.

For part
[\[enum:reps-top-interpretation-iv\]](#enum:reps-top-interpretation-iv){reference-type="eqref"
reference="enum:reps-top-interpretation-iv"} one needs to trace through
the isomorphisms of the previous subsection. We need to consider
internally connected trees with $n$ internal edges, which must be
spanning trees containing all $n+1$ external vertices; these in turn
correspond to the summand of
${\mathrm{cycLie}}_n \otimes_{{\mathfrak{S}}_{n+1}} ({\mathds{Q}}\{X_0,\ldots,X_n\})^{\otimes (n+1)}$
where each $X_i$ appears exactly once, which is in turn isomorphic to
${\mathrm{cycLie}}_n \otimes {\mathds{Q}}$. ◻
:::

### Higher apartment classes {#sec:higher-apts}

We now give the precise definition of the higher apartment classes. We
first recall a nonstandard construction of the apartment classes in the
Steinberg module ${\mathrm{St}}(V)$. Fix an affine basis
$\vec{v} = (v_0,\ldots,v_n)$ on $V$ (consequently $V$ is
$n$-dimensional) and write
$V_S \coloneq {\mathrm{span}}(v_i-v_j \mid i,j \in S)$ for a subset
$S \subseteq [n] = \{0,1,\ldots,n\}$. Now consider the functor
$$\begin{align*}
\Omega^{\vec{v}} \colon {\mathrm{Sub}}(V) &\longrightarrow{\mathrm{GrMod}}_{\mathds{Q}} \\
W &\longmapsto \begin{cases}{\mathds{Q}}\{\omega_{ij}\} & \text{if $W = V_{\{ij\}}$ with $i \neq j$,}\\
0 & \text{otherwise,}\end{cases}
\end{align*}$$ where $\omega_{ij}$ has degree $1$ and by definition
satisfies $\omega_{ij} = \omega_{ji}$. The free graded-commutative
algebra ${\mathrm{free}}_{\mathrm{Com}}(\Omega^{\vec{v}})$ on this
functor takes value
${\mathds{k}}\{\omega_{ij}\omega_{jk},\omega_{jk}\omega_{ki},\omega_{ki}\omega_{ij}\}$
on $V_{\{ijk\}}$. Letting $R_{\Omega^{\vec{v}}}$ be the ideal generated
by the elements
$\omega_{ij}\omega_{jk}+\omega_{jk}\omega_{ki}+\omega_{ki}\omega_{ij}$,
we then define
$${\mathrm{Ar}}_{\vec{v}} \coloneq \frac{{\mathrm{free}}_{\mathrm{Com}}(\Omega^{\vec{v}})}{R_{\Omega^{\vec{v}}}} \in {\mathrm{Alg}}_{\mathrm{Com}}({\mathrm{Fun}}({\mathrm{Sub}}(V),{\mathrm{GrMod}}_{\mathds{Q}})).$$
As the notation suggests, this is a lift of the Arnold algebra
${\mathrm{Ar}}_{[n]}$. Let us make this precise: as the unique functor
$t \colon {\mathrm{Sub}}(V) \to \ast$ is lax symmetric promonoidal, it
induces an oplax symmetric monoidal functor
$t_! \colon {\mathrm{Fun}}({\mathrm{Sub}}(V),{\mathrm{GrMod}}_{\mathds{Q}}) \to {\mathrm{GrMod}}_{\mathds{Q}}$
simply given by $F \mapsto \bigoplus_{W \subseteq V} F(W)$. Even though
$t_!$ is *not* strong symmetric monoidal, using that the $\omega_{ij}$
are in odd degree one may compute that sending generators to the image
of generators under $t_!$ induces an isomorphism of graded vector spaces
$${\mathrm{Ar}}_{[n]} \overset{\cong}\longrightarrow t_! {\mathrm{Ar}}_{\vec{v}}.$$
In fact, ${\mathrm{Ar}}_{\vec{v}}$ vanishes except when evaluated on
$V_{S_1}+\cdots+V_{S_r}$ with $V_{S_i} \cap V_{S_j} = 0$ for a partition
of $[n]$, in which case it is concentrated in degree
$(|S_1|-1) + \cdots (|S_r|-1)$ and in that degree is isomorphic to
${\mathrm{Ar}}^{\mathrm{indec}}_{S_1} \otimes \cdots \otimes {\mathrm{Ar}}^{\mathrm{indec}}_{S_r}$.

There is a map of functors
$\Omega_{\vec{v}} \to j_V^* {{\mathscr{S}}{\mathrm{t}}}$ given at
$V_{\{ij\}}$ by sending $\omega_{ij}$ to the preferred generator of
${\mathrm{St}}(V_{\{ij\}}) \cong {\mathds{Q}}$. The Bykovskii relations
in ${\mathrm{St}}(V_{\{ijk\}})$ imply that the relations in
$R_{\Omega^{\vec{v}}}$ go to zero, so there is an induced map of
commutative algebras
$$\varpi_{\vec{v}} \colon {\mathrm{Ar}}_{\vec{v}} \longrightarrow j_V^* {{\mathscr{S}}{\mathrm{t}}}.$$
If we evaluate this on $V$ itself, we get a map
${\mathrm{Ar}}_{\vec{v}}(V) \to j_V^* {{\mathscr{S}}{\mathrm{t}}}(V)$
which in degree $n$, in terms of the isomorphism from
[44](#lem:reps-top-interpretation){reference-type="ref+label"
reference="lem:reps-top-interpretation"}
[\[enum:reps-top-interpretation-iii\]](#enum:reps-top-interpretation-iii){reference-type="eqref"
reference="enum:reps-top-interpretation-iii"}, is given by
$$\begin{align*}
(\text{degree $n$ part of ${\mathrm{Ar}}^{\mathrm{indec}}_{[n]}$}) \cong {\mathrm{Lie}}^\vee_{n+1} \otimes {\mathds{Q}}_{\mathrm{sign}} &\longrightarrow{\mathrm{St}}(V) \\
\omega_{i_1j_1}  \cdots  \omega_{i_nj_n} &\longmapsto [V_{\{ i_1j_1\}}|\cdots |V_{\{i_nj_n\}}].
\end{align*}$$ Thus we not only obtain the apartment classes, but also
reveal some of their symmetries.

::: remark
*Remark 45*. A topological interpretation of this map, using
[44](#lem:reps-top-interpretation){reference-type="ref+label"
reference="lem:reps-top-interpretation"}
[\[enum:reps-top-interpretation-i\]](#enum:reps-top-interpretation-i){reference-type="eqref"
reference="enum:reps-top-interpretation-i"}, is as follows. There is a
map of posets ${\mathscr{P}}({\underline{n}}) \to T(V)$ from the
partition poset to the Tits building of $V$, sending a partition
$\{S_1,\ldots,S_r\}$ of $[n]$ to the subspace
$V_{S_1}+\cdots+V_{S_r} \subseteq V$. The induced map
$${\mathrm{Lie}}^\vee_{n+1} \otimes {\mathds{Z}}_{\mathrm{sign}} \cong \widetilde{H}_{n-2}({\mathscr{P}}({\underline{n}});{\mathds{Z}}) \longrightarrow\widetilde{H}_{n-2}(T(V);{\mathds{Z}}) \eqcolon {\mathrm{St}}(V)_{{\mathds{Z}}}$$
agrees, after tensoring with ${\mathds{Q}}$, with the one above.
:::

We next apply ${\mathrm{indec}}_{E_\infty^{\mathrm{nu}}}$, which can for
example be computed by performing the Harrison complex construction in
the category
${\mathrm{Fun}}({\mathrm{Sub}}(V),{\mathrm{Ch}}_{\mathds{Q}})$. The same
proof as for the usual Arnold algebra---which constructs a
Poincaré--Birkhoff--Witt basis and apply Priddy's criterion for
Koszulity---yields the following Koszul duality result as it only
involves symbolic manipulation of the generators and relations:

::: lemma
**Lemma 46**. *${\mathrm{Ar}}_{\vec{v}}$ is Koszul.*
:::

The quadratic dual ${}^\vee {\overline{{\mathrm{DK}}}}_{\vec{v}}$ of
${\mathrm{Ar}}_{\vec{v}}$ is then a reduced variant of the predual of
the Drinfeld--Kohno Lie algebra. Namely, its linear dual is the object
of
${\mathrm{Alg}}_{\mathrm{Lie}}({\mathrm{Fun}}({\mathrm{Sub}}(V),{\mathrm{GrMod}}_{\mathds{Q}}))$
given by
$${\overline{{\mathrm{DK}}}}_{\vec{v}} \coloneq \frac{{\mathrm{free}}_{{\mathrm{Lie}}}(T^{\vec{v}})}{R_{T^{\vec{v}}}}$$
whose generators are given by $$\begin{align*}
T^{\vec{v}} \colon {\mathrm{Sub}}(V) &\longrightarrow{\mathrm{GrMod}}_{\mathds{Q}} \\
W &\longmapsto \begin{cases}{\mathds{Q}}\{t_{ij}\} & \text{if $W = V_{\{ij\}}$ with $i \neq j$,}\\
0 & \text{otherwise,}\end{cases}
\end{align*}$$ where $t_{ij}$ has homological degree 2 and satisfies
$t_{ij} = t_{ji}$, and $R_{T^{\vec{v}}}$ is the ideal generated by the
elements $[t_{ij},t_{kl}]$ for $\{i,j\} \cap \{k,l\} = \varnothing$ as
well as $[t_{ij},t_{ik}+t_{jk}]$.

The oplax monoidality on $t_!$ induces an inclusion
$$t_! {}^\vee\overline{{\mathrm{DK}}}_{\vec{v}} \subseteq {}^\vee{\mathrm{DK}}_{[n]},$$
but this is generally *not* an isomorphism. This is due to the tensor
product on subspaces of $V$ being non-trivial only if they intersect in
$0$. To describe its image observe that with notation as in
[3.2.6](#sec:sder-dual){reference-type="ref+label"
reference="sec:sder-dual"}, there is a Lie sub-coalgebra
$${\overline{{\mathfrak{sder}}}}^\vee_{[n]} \subseteq {\mathfrak{sder}}^\vee_{[n]}$$
where each symbol from $\{X_0,X_1,\ldots,X_n\}$ appears at most once.
The linear dual of the inclusion
${\mathrm{DK}}_{[n]} \to {\mathfrak{sder}}_{[n]}$ of
[3.3.2](#sec:recol-dk-sder){reference-type="ref+label"
reference="sec:recol-dk-sder"} yields a map of Lie coalgebras
${\overline{{\mathfrak{sder}}}}^\vee_{[n]} \to {}^\vee {\mathrm{DK}}_{[n]}$
(identifying the target with its double dual) and this induces an
isomorphism
$$t_! {}^\vee{\overline{{\mathrm{DK}}}}_{\vec{v}} \cong {\mathrm{im}}\big[{\overline{{\mathfrak{sder}}}}^\vee_{[n]} \to {}^\vee {\mathrm{DK}}_{[n]}\big].$$

Using that ${\mathrm{indec}}_{\mathrm{Com}}^{\mathrm{nil}}$ commutes
with $j_V^*$, we thus obtain a map of Lie coalgebras
$$\tau_{\vec{v}} \colon {}^\vee {\overline{{\mathrm{DK}}}}_{\vec{v}} \longrightarrow j^*_V {{{\mathscr{S}}{\mathrm{t}}}^\infty}$$
which in degree $2n$, using
[44](#lem:reps-top-interpretation){reference-type="ref+label"
reference="lem:reps-top-interpretation"}
[\[enum:reps-top-interpretation-iv\]](#enum:reps-top-interpretation-iv){reference-type="eqref"
reference="enum:reps-top-interpretation-iv"}, yields the *higher
apartment class* map in the following proposition. Here we use
[3.2.6](#sec:sder-dual){reference-type="ref+label"
reference="sec:sder-dual"} to give generators for the domain.

::: {#prop:apt-colie .proposition}
**Proposition 47**. *There is a map $$\begin{align*}
{\mathrm{apt}}_{{\mathrm{{\mathrm{coLie}}}}} \colon {\mathrm{cycLie}}_n^\vee \otimes {\mathds{Q}} &\longrightarrow{\mathrm{St}}^{\infty}(V) \\
    {\mathrm{LC}}[X_0:X_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:X_n] &\longmapsto {\mathrm{C}}[v_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_n],
\end{align*}$$ where the right side is as in
[22](#def:steinberg-correlator){reference-type="ref+label"
reference="def:steinberg-correlator"}.*
:::

::: proof
*Proof.* It remains to justify the formula of
${\mathrm{apt}}_{{\mathrm{{\mathrm{coLie}}}}}$. To do this, we use that
$\tau_{\vec{v}}$ is a map of Lie coalgebras and both $n$-fold iterated
cobrackets are injective by Koszul duality, we reduce to the case $n=1$.
In this case it is true by construction. ◻
:::

::: {#rem:c-sder-cobracket .remark}
*Remark 48*. Arguably [47](#prop:apt-colie){reference-type="ref+label"
reference="prop:apt-colie"} should have been used to *define*
${\mathrm{C}}[v_0: \mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}: v_n]$.
Let us explain how to deduce formula
[\[eqn:stinfty-cobracket\]](#eqn:stinfty-cobracket){reference-type="eqref"
reference="eqn:stinfty-cobracket"} if one were to define
${\mathrm{C}}[v_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_n]$
as
${\mathrm{apt}}_{{\mathrm{{\mathrm{coLie}}}}}({\mathrm{LC}}[X_0:X_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:X_n]) \in (j^*_V {\mathrm{St}}^{\infty})(V) \cong {\mathrm{St}}^{\infty}(V)$.
Recalling that $j_V^*$ is symmetric monoidal, it suffices to compute its
cobracket in $j^*_V {\mathrm{St}}^{\infty}$ and since $\tau_{\vec{v}}$
is a map of Lie coalgebras, it is the image under $\tau_{\vec{v}}$ of
the cobracket in ${}^\vee {\overline{{\mathrm{DK}}}}_{{\underline{v}}}$.
This is in turn determined by the cobracket of special derivations,
using that $t_!$ sends no element to zero. The upshot is that the
formula for the cobracket of
${\mathrm{C}}[v_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_n]$
has the same formula as that for
${\mathrm{LC}}[X_0:X_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:X_n]$.
:::

## $E_\infty$-algebras of general linear groups and the definition of ${\mathscr{G}}(F)$

In this section we follow [@GKRW20] in defining a graded nonunital
$E_\infty$-algebra ${\mathbf{BGL}}(F)$ in terms of the general linear
groups ${\mathrm{GL}}_n(F)$. We relate its indecomposables to Steinberg
modules and define the Goncharov Lie coalgebra as in the introduction as
$${\mathscr{G}}(F) \coloneq \bigoplus_{n \geq 1} {\mathscr{G}}_n(F) \qquad \text{with} \qquad {\mathscr{G}}_n(F) \coloneq H^{E_\infty}_{n,2n-1}({\mathbf{BGL}}(F)_{\mathds{Q}}).$$
As [1](#fig:gltable1){reference-type="ref+label"
reference="fig:gltable1"} indicates, these are those groups in each rank
$n$ of lowest degree that can possibly be nonzero, except for $n=1$
(cf. [@GKRW20 Figure 1]). We explain these admit a Lie cobracket as well
as an additional "$\sigma$-component" map, and we explain how to compute
these in terms of infinite Steinberg modules. We follow
[1](#conv:shorter-notation){reference-type="ref+label"
reference="conv:shorter-notation"}.

### The $E_\infty$-algebras ${\mathbf{BGL}}^+$ and ${\mathbf{BGL}}$ {#sec:bgl}

We start by constructing the $E_\infty$-algebras ${\mathbf{BGL}}^+$ and
${\mathbf{BGL}}$, the former unital and the latter nonunital, as we will
have use for both. We then use their $E_\infty$-homology to define the
Goncharov Lie coalgebra.

Recall that Day convolution yields a symmetric monoidal structure on the
category ${\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{S}}{\mathrm{pc}}})$
of functors from the symmetric monoidal groupoid of finite-dimensional
vector spaces over $F$ with direct sum to the category of spaces with
cartesian product, whose tensor product we denote by $\boxplus$.
Similarly, there is a symmetric monoidal structure on
${\mathrm{Fun}}({\mathds{N}},{{\mathscr{S}}{\mathrm{pc}}})$ that we will
also denote $\boxplus$. There is a symmetric monoidal functor
$\dim \colon {\mathrm{Vect}}\to {\mathds{N}}$ that assigns to a vector
space its dimension, and it induces a symmetric monoidal functor
$\dim_! \colon {\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{S}}{\mathrm{pc}}}) \to {\mathrm{Fun}}({\mathds{N}},{{\mathscr{S}}{\mathrm{pc}}})$.
This in turn induces functors on categories of algebras over operads in
the domain and target. Let ${\underline{\ast}}$ denote the terminal
object in
${\mathrm{Alg}}_{E^{\mathrm{u}}_\infty}({\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{S}}{\mathrm{pc}}}))$,
and
${\underline{\ast}}_{>0} \in {\mathrm{Alg}}_{E^{\mathrm{nu}}_\infty}({\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{S}}{\mathrm{pc}}}))$
denote the nonunital $E_\infty$-algebra obtained by replacing the value
on 0-dimensional vector spaces with $\varnothing$.

::: definition
**Definition 49**. We define $$\begin{align*}
&{\mathbf{BGL}}^+ \coloneq \dim_!({\underline{\ast}}) \in {\mathrm{Alg}}_{E^{\mathrm{u}}_\infty}({\mathrm{Fun}}({\mathds{N}},{{\mathscr{S}}{\mathrm{pc}}})), \\
&{\mathbf{BGL}}\coloneq \dim_!({\underline{\ast}}_{>0}) \in {\mathrm{Alg}}_{E^{\mathrm{nu}}_\infty}({\mathrm{Fun}}({\mathds{N}},{{\mathscr{S}}{\mathrm{pc}}})).
\end{align*}$$
:::

::: example
*Example 50*. The underlying objects have values at nonnegative numbers
$n \in {\mathds{N}}$ given by $$\begin{align*}
{\mathbf{BGL}}^+(n) &\coloneqq n^* {\mathrm{fgt}}_{E_\infty^{\mathrm{u}}}\, {\mathbf{BGL}}^+ \simeq {\mathrm{BGL}}_n \quad \text{for $n \geq 0$, } \\
{\mathbf{BGL}}(n) &\coloneqq n^* {\mathrm{fgt}}_{E_\infty^{\mathrm{nu}}}\, {\mathbf{BGL}}\simeq \begin{cases} {\mathrm{BGL}}_n & \text{for $n \geq 1$}, \\
\varnothing & \text{for $n=0$}.\end{cases}
\end{align*}$$ Under these equivalences, the multiplication
${\mathrm{BGL}}_n \times {\mathrm{BGL}}_m \to {\mathrm{BGL}}_{n+m}$ of
the $E_\infty$-algebra structures is induced by block sum of matrices.
:::

Post-composing with the map induced by the symmetric monoidal functor
$C_*(-;{\mathds{Q}}) \colon {{\mathscr{S}}{\mathrm{pc}}}\to {{\mathscr{D}}_{\mathds{Q}}}$
we obtain
$${\mathbf{BGL}}^+_{\mathds{Q}} \in {\mathrm{Alg}}_{E_\infty^{\mathrm{u}}}({\mathrm{Fun}}({\mathds{N}},{{\mathscr{D}}_{\mathds{Q}}})) \quad \text{and} \quad {\mathbf{BGL}}_{\mathds{Q}} \in {\mathrm{Alg}}_{E_\infty^{\mathrm{nu}}}({\mathrm{Fun}}({\mathds{N}},{{\mathscr{D}}_{\mathds{Q}}})).$$
These are related as follows: the unique map
${\underline{\ast}}_{>0} \to {\underline{\ast}}$ in
${\mathrm{Alg}}_{E_\infty^{\mathrm{nu}}}({\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{S}}{\mathrm{pc}}}))$
induces a map in
${\mathrm{Alg}}_{E_\infty^{\mathrm{nu}}}({\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{D}}_{\mathds{Q}}}))$
$${\underline{{\mathds{Q}}}}_{>0} \coloneq C_*({\underline{\ast}}_{>0};{\mathds{Q}}) \longrightarrow C_*({\underline{\ast}};{\mathds{Q}}) \eqcolon {\underline{{\mathds{Q}}}},$$
whose target is reduced, so admits a canonical augmentation, and this
map exhibits the domain as the augmentation ideal of the target.
Applying $\dim_!$ we obtain from this a map
${\mathbf{BGL}}_{{\mathds{Q}}} \to {\mathbf{BGL}}^+_{{\mathds{Q}}}$ and
this exhibits the domain as the augmentation ideal of the target (see
[12.1.3](#sec:augmentation-ideals){reference-type="ref+label"
reference="sec:augmentation-ideals"}).

### $E_\infty$-homology and the Goncharov Lie coalgebra {#sec:ek-homology}

We can consider ${\mathbf{BGL}}_{\mathds{Q}}$ as a nonunital
$E_k$-algebra by restriction along the map of operads
$E^{\mathrm{nu}}_k \to E^{\mathrm{nu}}_\infty$ and define
*$E_k$-homology* in terms of its cotangent complex from
[12.1.1](#sec:operads-algebras){reference-type="ref+label"
reference="sec:operads-algebras"}, (see also [@GKRW18 Section 10.1.6],
called $E_k$-indecomposables there)
$$H^{E_k}_{n,d}({\mathbf{BGL}}_{\mathds{Q}}) \coloneq H_d({\mathrm{cot}}_{E_k^{\mathrm{nu}}}({\mathbf{BGL}}_{\mathds{Q}})(n)).$$
The following describes these groups in terms of Steinberg
modules---implicitly with rational coefficients---and their variants
[@GKRW20 Section 6].

::: {#thm:ekhomology-steinberg .theorem}
**Theorem 51** (Galatius-Kupers--Randal-Williams). *We have isomorphisms
$$H^{E_k}_{*,*}({\mathbf{BGL}}_{\mathds{Q}}) \cong \begin{cases} H_{*,*}({\mathrm{GL}};\Sigma^{-1} {{\mathscr{S}}{\mathrm{t}}_{>0}}) & \text{if $k=1$,} \\
    H_{*,*}({\mathrm{GL}};\Sigma^{-2} {{{\mathscr{S}}{\mathrm{t}}}^2_{>0}}) & \text{if $k=2$,} \\
    H_{*,*}({\mathrm{GL}};\Sigma^{-2} {{{\mathscr{S}}{\mathrm{t}}}^\infty}) & \text{if $k=\infty$.}\end{cases}$$*
:::

::: {#exam:ekhomology-steinberg-gradings .example}
*Example 52*. Recall that our grading convention places
${\mathrm{St}}(V)$ in degree $\dim(V)$, and ${\mathrm{St}}^{2}(V)$ and
${\mathrm{St}}^{\infty}(V)$ in degree $2\dim(V)$. Thus we have [@GKRW20
Theorems 6.2, 6.5] $$\begin{align*}
H_{n,d}({\mathrm{GL}};\Sigma^{-1} {{\mathscr{S}}{\mathrm{t}}_{>0}}) &\cong H_{d-n+1}({\mathrm{GL}}_n;{\mathrm{St}}_n) \\
H_{n,d}({\mathrm{GL}};\Sigma^{-2} {{{\mathscr{S}}{\mathrm{t}}}^2_{>0}}) &\cong H_{d-2n+2}({\mathrm{GL}}_n;{\mathrm{St}}^{2}_n) \\
H_{n,d}({\mathrm{GL}};\Sigma^{-2} {{{\mathscr{S}}{\mathrm{t}}}^\infty}) &\cong H_{d-2n+2}({\mathrm{GL}}_n;{\mathrm{St}}^{\infty}_n).
\end{align*}$$
:::

Koszul duality in the guise of
[210](#lem:bialgebra-structure){reference-type="ref+label"
reference="lem:bialgebra-structure"} endows these objects with
additional structure, each in the category
${\mathrm{Fun}}({\mathds{N}},{\mathrm{GrVect}}_{\mathds{Q}})$ with
symmetric monoidal structure given by Day convolution with respect to
addition on ${\mathds{N}}$ and the graded tensor product (with Koszul
sign rule) on ${\mathrm{GrVect}}_{\mathds{Q}}$:

::: {#thm:gl-st-structure .theorem}
**Theorem 53**. *We have that $$\begin{align*}
 &H_{*,*}({\mathrm{GL}};{{\mathscr{S}}{\mathrm{t}}}) \text{ is a commutative bialgebra,} \\
    &H_{*,*}({\mathrm{GL}};{{{\mathscr{S}}{\mathrm{t}}}^2}) \text{ is a commutative cocommutative bialgebra,} \\
    & H_{*,*}({\mathrm{GL}};\Sigma^{-1} {{{\mathscr{S}}{\mathrm{t}}}^\infty}) \text{ is a Lie coalgebra}.
\end{align*}$$*
:::

::: remark
*Remark 54*. This may be a bit surprising, as the coproduct on
${{{\mathscr{S}}{\mathrm{t}}}^2}$ is *not* cocommutative. However, the
Nesterenko--Suslin property as in
[4.4.2](#sec:nesterenko-suslin){reference-type="ref+label"
reference="sec:nesterenko-suslin"} gives an isomorphism between
$H_{*,*}({\mathrm{GL}};{{{\mathscr{S}}{\mathrm{t}}}^2})$ and homology of
general linear groups with a "split" variant of
${{{\mathscr{S}}{\mathrm{t}}}^2}$, which does have cocommutative
coproduct.
:::

The last statement of
[53](#thm:gl-st-structure){reference-type="ref+label"
reference="thm:gl-st-structure"} concretely says
$H_{*,*}({\mathrm{GL}};{{{\mathscr{S}}{\mathrm{t}}}^\infty})$ is a
shifted Lie coalgebra: it has a cobracket of degree 1, i.e. with
components
$$\delta_{k,n-k} \colon H_d({\mathrm{GL}}_n;{\mathrm{St}}^{\infty}_n) \longrightarrow\bigoplus_{d'+d''=d+1} H_{d'}({\mathrm{GL}}_k; {\mathrm{St}}^{\infty}_k) \otimes H_{d''}({\mathrm{GL}}_{n-k}; {\mathrm{St}}^{\infty}_{n-k}).$$

We now recall some vanishing results for the $E_\infty$-homology groups
of ${\mathbf{BGL}}_{\mathds{Q}}$. We start with the observation that
since ${{{\mathscr{S}}{\mathrm{t}}}^\infty}$ are concentrated in
bidegrees of the form $(n,2n)$, we must have that
$\smash{H^{E_\infty}_{n,d}({\mathbf{BGL}}_{\mathds{Q}})} = 0$ for
$d<2n-2$. The following was established in [@GKRW20 Theorem B] and
reproved in [@CharltonRadchenkoRudenko Corollary 38]: by computing
coinvariants we see that
$H_0({\mathrm{GL}}_n;{\mathrm{St}}^\infty(F^n)) = 0$ for $n \geq 2$ and
$H_0({\mathrm{GL}}_1;{\mathrm{St}}^\infty(F^1)) \cong {\mathds{Q}}$ and
obtain one additional degree of vanishing.

::: {#thm:bgl-critical-line-vanishing .theorem}
**Theorem 55**. *We have
$$H^{E_\infty}_{n,2n-2}({\mathbf{BGL}}_{\mathds{Q}}) \cong \begin{cases} 0 & \text{for $n \geq 2$,} \\
{\mathds{Q}} & \text{for $n=1$.}\end{cases}$$*
:::

Using [51](#thm:ekhomology-steinberg){reference-type="ref+label"
reference="thm:ekhomology-steinberg"} we can rephrase these observations
as a vanishing result for the Lie coalgebra
$H_{*,*}({\mathrm{GL}};\Sigma^{-1}{{{\mathscr{S}}{\mathrm{t}}}^\infty})$
(see [1](#fig:gltable1){reference-type="ref+label"
reference="fig:gltable1"}).

For $n=1$ we have ${\mathrm{GL}}_1 \cong F^\times$ and
${\mathrm{St}}^{\infty}\cong {\mathds{Q}}$, which should be thought of
as being in degree $2$, so we get an isomorphism
$\smash{H_{1,d}({\mathrm{GL}};\Sigma^{-1}{{{\mathscr{S}}{\mathrm{t}}}^\infty}) \cong \Lambda^{d-1} F^\times_{\mathds{Q}}}$
[@GKRW20 Section 9.1.2]. We will occasionally write
$H_{1,1}({\mathrm{GL}};\Sigma^{-1} {{{\mathscr{S}}{\mathrm{t}}}^\infty}) \cong {\mathds{Q}}\{\sigma\}$.
This may conflict with our notation for permutations and symmetry
isomorphisms, but we believe there is no risk of confusion.

For $n \geq 2$ we can use the vanishing result
[55](#thm:bgl-critical-line-vanishing){reference-type="ref+label"
reference="thm:bgl-critical-line-vanishing"} to get
$$H_{n,d}({\mathrm{GL}};\Sigma^{-1} {{{\mathscr{S}}{\mathrm{t}}}^\infty}) \cong \begin{cases} {\mathscr{G}}_n & \text{if $d=2n$,} \\
0 & \text{if $d<2n$,}\end{cases} \qquad \text{with }
{\mathscr{G}}_n \coloneq H^{E_\infty}_{n,2n-1}({\mathbf{BGL}}_{\mathds{Q}}) \cong H_1({\mathrm{GL}}_n;{\mathrm{St}}^{\infty}_n).$$
It follows that the cobracket on
$H_{*,*}({\mathrm{GL}};\Sigma^{-1} {{{\mathscr{S}}{\mathrm{t}}}^\infty})$
induces on ${\mathscr{G}} = \bigoplus_{n=1} {\mathscr{G}}_n$ not one but
two structures:

(i) a *cobracket*
    $\delta \colon {\mathscr{G}} \to \Lambda^2{\mathscr{G}}$,

(ii) a *$\sigma$-component*
     $\delta_\sigma \colon {\mathscr{G}}_n\to H_2({\mathrm{GL}}_{n-1};{\mathrm{St}}^{\infty}_{n-1})$.

### Vanishing results for $E_1$-homology

We will now explain how to bootstrap this to a vanishing result for
$E_1$-homology, improving rationally on [@GKRW20 Theorem 10.2] and
[@MPPII Theorem A, B], and independently observed by Randal-Williams and
Galatius:

::: {#thm:steinberg-homology-improved-vanishing .theorem}
**Theorem 56**.
*$H_{n,d}({\mathrm{GL}};{{\mathscr{S}}{\mathrm{t}}}) = 0$ when
$d < 2n-2$.*
:::

::: example
*Example 57*. Making grading conventions concrete, this says that
$H_d({\mathrm{GL}}_n;{\mathrm{St}}_n) = 0$ for $d<n-2$.
:::

[56](#thm:steinberg-homology-improved-vanishing){reference-type="ref+label"
reference="thm:steinberg-homology-improved-vanishing"} will be a
consequence of a more general result, phrased in terms of the augmented
$E_\infty^{\mathrm{u}}$-algebra
${\mathrm{Bar}}({\mathbf{BGL}}^+_{\mathds{Q}})$, as the proof of
[51](#thm:ekhomology-steinberg){reference-type="ref+label"
reference="thm:ekhomology-steinberg"} provides an isomorphism
$$\begin{equation}
\label{eqn:bar-bgl-st} H_{*,*}({\mathrm{Bar}}({\mathbf{BGL}}_{\mathds{Q}}^+)) \overset{\cong}\longrightarrow H_{*,*}({\mathrm{GL}};{{\mathscr{S}}{\mathrm{t}}}).
\end{equation}$$ It will be useful to consider the more general case of
an augmented $E_\infty^{\mathrm{u}}$-algebra ${\mathbf{R}}^+$ in
${\mathrm{Fun}}({\mathds{N}},{{\mathscr{D}}_{\mathds{Q}}})$ and the
associated sequence of augmented $E_\infty^{\mathrm{u}}$-algebras
${\mathrm{Bar}}^k({\mathbf{R}}^+)$.

In the following, $S^*$ denotes the free commutative algebra, with
Koszul sign with respect to the second "homological" grading but no
Koszul sign with respect to the first "rank" grading, and $c_0$ is the
abstract connectivity given by $c_0(0) = 0$ and $c_0(n) = -\infty$ for
$n \geq 1$.

::: {#prop:homology-of-bar-rat .proposition}
**Proposition 58**. *For an augmented $E_\infty^{\mathrm{u}}$-algebra
${\mathbf{R}}^+$ in
${\mathrm{Fun}}({\mathds{N}},{{\mathscr{D}}_{\mathds{Q}}})$ with
$c_0$-connected augmentation ideal and $k \geq 1$, there is an
isomorphism
$$S^*(\Sigma^k H_{*,*}^{E_\infty}({\mathbf{R}})) \overset{\cong}\longrightarrow H_{*,*}({\mathrm{Bar}}^k({\mathbf{R}}^+)).$$*
:::

::: proof
*Proof.* We first observe that
$H_{*,*}({\mathrm{Bar}}^k({\mathbf{R}}^+))$ is free as a
graded-commutative algebra. As it is a $c_0$-connected commutative
graded bialgebra by
[210](#lem:bialgebra-structure){reference-type="ref+label"
reference="lem:bialgebra-structure"}, this follows from [@Cartier
Theorem 3.8.3, Remark 3.8.2] (observing that $c_0$-connected is
sufficient in the bigraded setting).

We next claim that if ${\mathbf{S}}^+$ is an augmented
$E_\infty^{\mathrm{u}}$-algebra in
${\mathrm{Fun}}({\mathds{N}},{{\mathscr{D}}_{\mathds{Q}}})$ so that
$H_{*,*}({\mathbf{S}}^+)$ is a free graded-commutative algebra, then we
have an isomorphism
$$S^*(H^{E_\infty}_{*,*}({\mathbf{S}})) \overset{\cong}\longrightarrow H_{*,*}({\mathbf{S}}^+).$$
To see this, pick lifts of generators $\{x_i\}_{i \in I}$ of the
graded-commutative algebra $H_{*,*}({\mathbf{S}}^+)$ to cycles and use
these to construct a map
$${\mathrm{free}}_{E^{\mathrm{u}}_\infty}({\mathds{Q}}\{x_i\}_{i \in I}) \longrightarrow{\mathbf{S}}^+$$
of $E^{\mathrm{u}}_\infty$-algebras. This is an equivalence, because by
construction it induces an equivalence on homology, using that we are
working with rational coefficients. Taking augmentation ideals and
considering the induced map on $E_\infty$-homology
$${\mathds{Q}}\{x_i\}_{i \in I} \cong H_{*,*}^{E_\infty}({\mathrm{free}}_{E^{\mathrm{nu}}_\infty}({\mathds{Q}}\{x_i\}_{i \in I}))  \longrightarrow H_{*,*}^{E_\infty}({\mathbf{S}})$$
must then also be an isomorphism, implying the claim.

We finally observe that if ${\mathbf{S}}^+$ is an augmented
$E_\infty^{\mathrm{u}}$-algebra in
${\mathrm{Fun}}({\mathds{N}},{{\mathscr{D}}_{\mathds{Q}}})$ with
$c_0$-connected augmentation ideal, then the $E_\infty$-homology of
${\mathrm{Bar}}^k({\mathbf{S}}^+)$ is isomorphic to
$\Sigma^k H^{E_\infty}_{*,*}({\mathbf{S}})$ by the description of the
$E_\infty$-homology in terms of iterated bar constructions [@GKRW18
Section 13.7]. ◻
:::

::: proof
*Proof of
[56](#thm:steinberg-homology-improved-vanishing){reference-type="ref+label"
reference="thm:steinberg-homology-improved-vanishing"}.* Returning to
the $E_\infty^{\mathrm{u}}$-algebra
${\mathrm{Bar}}({\mathbf{BGL}}^+_{\mathds{Q}})$,
[58](#prop:homology-of-bar-rat){reference-type="ref+label"
reference="prop:homology-of-bar-rat"} yields an isomorphism
$$S^*(\Sigma H^{E_\infty}_{*,*}({\mathbf{BGL}}_{\mathds{Q}})) \overset{\cong}\longrightarrow H_{*,*}({\mathrm{Bar}}({\mathbf{BGL}}^+_{\mathds{Q}}))$$
and combining this with
[55](#thm:bgl-critical-line-vanishing){reference-type="ref+label"
reference="thm:bgl-critical-line-vanishing"} and the isomorphism
[\[eqn:bar-bgl-st\]](#eqn:bar-bgl-st){reference-type="eqref"
reference="eqn:bar-bgl-st"} we get that
$H_{*,*}({\mathrm{GL}};{{\mathscr{S}}{\mathrm{t}}})$ is isomorphic to a
free graded-commutative algebra with a single generator $\sigma$ in
bidegree $(1,1)$ and all remaining generators in bidegrees $(n,d)$ with
$d \geq 2n$. Thus it is concentrated in bidegrees $(n,d)$ with
$d \geq 2n-1$, and using
[51](#thm:ekhomology-steinberg){reference-type="ref+label"
reference="thm:ekhomology-steinberg"} involves a degree shift by $-1$,
$H^{E_1}_{n,d}({\mathbf{BGL}}_{\mathds{Q}})$ is concentrated in degrees
$(n,d)$ with $d \geq 2n-2$. (see
[4](#fig:gltable1e1){reference-type="ref+label"
reference="fig:gltable1e1"}). ◻
:::

<figure id="fig:gltable1e1" data-latex-placement="ht">

<figcaption>The <span class="math inline">\(E_1\)</span>-homology of
<span class="math inline">\({\mathbf{BGL}}(F)_{\mathds{Q}}\)</span> is,
up to a shift by <span class="math inline">\(-1\)</span>, the free
graded-commutative algebra on the <span
class="math inline">\(E_\infty\)</span>-homology, and thus vanishes for
<span class="math inline">\(d &lt; 2n-2\)</span> as indicated by the
dashed line. We use the abbreviations <span
class="math inline">\(\Lambda^k \coloneqq \Lambda^k
F^\times_{\mathds{Q}}\)</span> and <span class="math inline">\(\sigma
\coloneqq {\mathds{Q}}\{\sigma\}\)</span>.</figcaption>
</figure>

### Recollections from proof of [51](#thm:ekhomology-steinberg){reference-type="ref+label" reference="thm:ekhomology-steinberg"} {#recollections-from-proof-of-thmekhomology-steinberg}

We will need some ingredients of the proof of
[51](#thm:ekhomology-steinberg){reference-type="ref+label"
reference="thm:ekhomology-steinberg"} from [@GKRW20]. We recall those
here.

#### Steinberg modules and buildings {#sec:buildings}

We first recall the connection between Steinberg modules and buildings
and justify the Koszulity hypotheses
[\[hyp:ast-koszul\]](#hyp:ast-koszul){reference-type="eqref"
reference="hyp:ast-koszul"} and
[\[hyp:st-koszul\]](#hyp:st-koszul){reference-type="eqref"
reference="hyp:st-koszul"} for fields.

For each $k \geq 1$, [@GKRW20 Section 5.1] defines a *$k$-fold building*
$D^k(V)$. This is a pointed space with ${\mathrm{GL}}(V)$-action,
arising as the geometric realisation of a $k$-fold pointed simplicial
set of "lattices" of flags in $V$. We can assemble these to
$D^k \in {\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{S}}{\mathrm{pc}}}_*)$,
which satisfy the following property, implicit in [@MPW23 Lemma 1.3]:

::: {#prop:bar-is-building .proposition}
**Proposition 59**. *There are equivalences in
${\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{S}}{\mathrm{pc}}}_*)$
$${\mathrm{Bar}}^k_\boxplus({\mathrm{Bar}}_{\boxbackslash}({\underline{\ast}}_+)) \simeq D^{k+1} \qquad \text{for all $k \geq 0$}.$$*
:::

::: {#cor:koszul-st .corollary}
**Corollary 60**. *Hypotheses
[\[hyp:ast-koszul\]](#hyp:ast-koszul){reference-type="eqref"
reference="hyp:ast-koszul"} and
[\[hyp:st-koszul\]](#hyp:st-koszul){reference-type="eqref"
reference="hyp:st-koszul"} hold.*
:::

::: proof
*Proof.* By applying $\widetilde{C}_*(-;{\mathds{Q}})$, we reduce
hypotheses [\[hyp:ast-koszul\]](#hyp:ast-koszul){reference-type="eqref"
reference="hyp:ast-koszul"} and
[\[hyp:st-koszul\]](#hyp:st-koszul){reference-type="eqref"
reference="hyp:st-koszul"} to verifying connectivity results for $D^1$
and $D^2$. Firstly, $D^1(V)$ is isomorphic to a two-fold simplicial
suspension of the Tits building $T(V)$ [@GKRW20 Lemma 6.1], the nerve of
the poset of proper nonempty subspaces of $V$ ordered by inclusion. The
Solomon--Tits theorem says that $T(V)$ is equivalent to a wedge of
$(\dim(V)-2)$-spheres, see [@GKRW20 Theorem 2.2] and the references
there. Hence $D^1(V)$ is equivalent to a wedge of $\dim(V)$-spheres and
we get
$${{\mathscr{S}}{\mathrm{t}}}= H_*({\mathrm{Bar}}_{\boxbackslash}({\underline{{\mathds{Q}}}})(V)) \cong \widetilde{H}_*(D^1(V);{\mathds{Q}}) = 0 \text{ unless $* = \dim(V)$.}$$
Secondly, there are ${\mathrm{GL}}(V)$-equivariant pointed *sum maps*
$$D^k(V) \longrightarrow\underbrace{D^1(V) \wedge \cdots \wedge D^1(V)}_k$$
which for $k=2$ yields an equivalence [@GKRW20 Proposition 6.3]
$$\begin{equation}
\label{eqn:d2-is-d1-wedge-d1} D^2(V) \xrightarrow{\simeq} D^1(V) \wedge D^1(V).
\end{equation}$$ As the latter is equivalent to a wedge of
$2\dim(V)$-spheres, we get
$${{{\mathscr{S}}{\mathrm{t}}}^2}= H_*({\mathrm{Bar}}_\boxplus({{\mathscr{S}}{\mathrm{t}}})(V)) \cong \widetilde{H}_*(D^2(V);{\mathds{Q}}) = 0 \text{ unless $* = 2\dim(V)$.}\qedhere$$ ◻
:::

::: remark
*Remark 61*. It is also possible to give an interpretation of the
infinite Steinberg modules in terms of buildings. The $k$-fold buildings
come with ${\mathrm{GL}}(V)$-equivariant pointed *suspension maps*
[@GKRW20 Section 5.1] $$S^1 \wedge D^k \longrightarrow D^{k+1}$$ using
which we can define a *stable building*
$D^\infty \coloneq \{D^k\}_{k \geq 1} \in {\mathrm{Fun}}({\mathrm{Vect}},{\mathscr{S}}{\mathrm{p}})$
and we have
$${{{\mathscr{S}}{\mathrm{t}}}^\infty}= \mathop{\mathrm{colim}}_{k \to \infty} H_{*-k+1}({\mathrm{Bar}}^k_{\boxplus}({\mathrm{Bar}}_{\boxbackslash}({\underline{\ast}}_+));{\mathds{Q}}) \cong H_*(D^\infty;{\mathds{Q}}).$$
By [@MPW23 Proposition 5.3] the spectrum $D^\infty(V)$ is in fact
equivalent to the suspension spectrum of Rognes' common basis complex
[@Rognes Definition 14.5] and this is in turn equivalent to
Brück--Piterman--Welker's partial decomposition poset [@BPW Section 1]
by Corollary 1.1 loc.cit..
:::

::: proof
*Proof of [59](#prop:bar-is-building){reference-type="ref+label"
reference="prop:bar-is-building"}.* The proof requires a generalisation
of the $k$-fold buildings due to Miller--Patzt--Wilson [@MPW23
Definition 3.5]: for each $k,\ell \geq 0$ they define for a
finite-dimensional vector space $V$ a pointed space $D^{k,\ell}(V)$ with
${\mathrm{GL}}(V)$-action, arising as the thick geometric realisation of
a $(k+\ell)$-fold pointed semisimplicial set with $k$ directions of
flags and $\ell$ directions of splittings, all satisfying the common
basis property. For $k=0=\ell$ this is simply the constant functor
${\underline{\ast}}_+ \in {\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{S}}{\mathrm{pc}}}_*)$.

The latter is an $E_1^{\mathrm{u}}$-algebra with respect to
$\boxbackslash$, and admits a "canonical" augmentation by the map that
is the identity in dimension $0$ and the map to the basepoint otherwise,
and we can form ${\mathrm{Bar}}_{\boxbackslash}({\underline{\ast}}_+)$
with respect to this augmentation. We claim that there is an equivalence
in ${\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{S}}{\mathrm{pc}}}_*)$
$${\mathrm{Bar}}_{\boxbackslash}({\underline{\ast}}_+) \simeq D^1.$$
Using the standard simplicial model for the bar construction, we see
that ${\mathrm{Bar}}_{\boxbackslash}({\underline{\ast}}_+)$ is given by
the geometric realisation of
$$[p] \longmapsto 1 \boxbackslash({\underline{\ast}}_+)^{\boxbackslash p} \boxbackslash 1$$
where $1$ is the monoidal unit of
${\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{S}}{\mathrm{pc}}}_*)$. The
inner face maps are induced by the multiplication of
${\underline{\ast}}$ and outer face maps are induced by the canonical
augmentation. Using the formula for Day convolution and the description
of the profunctor $\obackslash_k$, this is given
$$(1 \boxbackslash({\underline{\ast}}_+)^{\boxbackslash p} \boxbackslash 1)(V) \simeq \frac{\left\{\parbox[c]{6cm}{\centering flags $0 = V_0 \subseteq V_1 \subseteq \cdots \subseteq V_{p+1} = V$}\right\}}{\left\{\parbox[c]{6cm}{\centering flags $0 = V_0 \subseteq V_1 \subseteq \cdots \subseteq V_{p+1} = V$ with $V_1/V_0 \neq 0$ or $V_{p+1}/V_p \neq 0$}\right\}}$$
where now all face maps forget a term in a flag. Comparing to [@GKRW20
Definition 5.4] we recognise this as $D^1(V)$, and this equivalence is
evidently ${\mathrm{GL}}$-equivariant.

There is a remaining $E_\infty$-algebra structure on the bar
construction and its product *is* simplicial for the standard simplicial
model for the bar construction we used above, given by levelwise direct
sum. That is, it corresponds to the product given by the case $k=1$ of
the pointed ${\mathrm{GL}}(V)\times {\mathrm{GL}}(V')$-equivariant *sum
maps* [@GKRW20 Section 6.3]
$$D^1(V) \wedge D^1(V') \longrightarrow D^1(V \oplus V').$$ Arguing as
above using the tensor product $\boxplus$ instead of $\boxbackslash$,
one proves
$${\mathrm{Bar}}_\boxplus({\mathrm{Bar}}_{\boxbackslash}({\underline{\ast}}_+)) \simeq {\mathrm{Bar}}_\boxplus(D^1) \simeq D^{1,1}.$$
There are pointed ${\mathrm{GL}}(V)$-equivariant forgetful maps
$D^{1,1}(V) \longrightarrow D^{2,0}(V)$ turning a direct sum
decomposition direction into a flag one and the corresponding map
$$D^{1,1} \longrightarrow D^{2,0}$$ is an equivalence by [@MPW23 Theorem
3.15]. Iterating this argument, one proves that
$${\mathrm{Bar}}^k_\boxplus({\mathrm{Bar}}_{\boxbackslash}({\underline{\ast}}_+)) \simeq {\mathrm{Bar}}_\boxplus(D^{k,0}) \simeq D^{k,1} \simeq D^{k+1,0}.\qedhere$$ ◻
:::

::: remark
*Remark 62*. Bar--cobar duality also yields an $E_1$-coalgebra structure
on $D^1$, which is more difficult to determine than the $E_1$-algebra
structure as it does *not* arise from simplicial maps; see
[68](#rem:coprod-ad-hoc){reference-type="ref+label"
reference="rem:coprod-ad-hoc"}.
:::

#### The Nesterenko--Suslin property {#sec:nesterenko-suslin}

We next recall a result comparing the homology of general linear groups
preserving a splitting with that of groups preserving a flag, going back
to Nesterenko and Suslin [@NesterenkoSuslin Section 1].

For $V = U_1 \oplus U_2$, let
${\mathrm{P}}_{U_1}(V) \subseteq {\mathrm{GL}}(V)$ denote the parabolic
subgroup preserving the flag $U_1 \subseteq V$. The restriction map
${\mathrm{P}}_{U_1}(V) \to {\mathrm{GL}}(U_1) \times {\mathrm{GL}}(U_2)$
admits a section and we have [@NesterenkoSuslin Theorem 1.1] [@GKRW20
Definition 5.12]:

::: {#lem:nesterenko-suslin .lemma}
**Lemma 63** (Nesterenko--Suslin). *For all nonzero $U_1,U_2$ both of
the maps
$${\mathrm{GL}}(U_1) \times {\mathrm{GL}}(U_2) \to G_{U_1,U_2} \to {\mathrm{GL}}(U_1) \times {\mathrm{GL}}(U_2)$$
induce an isomorphism on $H_*(-;{\mathds{Q}})$.*
:::

This allows us to identify the tensor products $\boxplus$ and
$\boxbackslash$ after applying $\dim_!$. Recall that the projective
general linear groups ${\mathrm{PGL}}(V)$ are defined as the quotient of
${\mathrm{GL}}(V)$ by the subgroup $F^\times$ of linear automorphisms
given by scaling, so in particular we can consider a
${\mathds{Q}}[{\mathrm{PGL}}(V)]$-module as a
${\mathds{Q}}[{\mathrm{GL}}(V)]$-module by restriction along the
quotient homomorphism ${\mathrm{GL}}(V) \to {\mathrm{PGL}}(V)$. The
image of ${\mathrm{P}}_{U_1}(V)$ in the projective group is denoted
${\mathrm{P}}({\mathrm{P}}_{U_1}(V)) \subseteq {\mathrm{PGL}}(V)$. The
following is deduced from
[63](#lem:nesterenko-suslin){reference-type="ref+label"
reference="lem:nesterenko-suslin"} using Hochschild--Serre spectral
sequences (cf. the proof of [@NesterenkoSuslin Theorem 1.1]:

::: {#lem:para-levi-comparison-pgl .lemma}
**Lemma 64**. *If $M_1$ is a ${\mathds{Q}}[{\mathrm{PGL}}(U_1)]$-module
and $M_2$ is a ${\mathds{Q}}[{\mathrm{PGL}}(U_2)]$-module, the following
maps are isomorphisms $$\begin{align*}
H_*({\mathrm{GL}}(U_1) \times {\mathrm{GL}}(U_2);M_1 \otimes M_2) &\overset{\cong}\longrightarrow H_*({\mathrm{P}}_{U_1}(V);M_1 \otimes M_2) \\
H_*({\mathrm{P}}({\mathrm{GL}}(U_1) \times {\mathrm{GL}}(U_2));M_1 \otimes M_2) &\overset{\cong}\longrightarrow H_*({\mathrm{P}}({\mathrm{P}}_{U_1}(V));M_1 \otimes M_2).
\end{align*}$$*
:::

Combining this with the formulas from
[3](#exam:levi-para-explicit-formulas){reference-type="ref+label"
reference="exam:levi-para-explicit-formulas"} and Shapiro's lemma, we
deduce:

::: {#lem:dim-levi-para .lemma}
**Lemma 65**. *If
$M,N \in {\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{D}}_{\mathds{Q}}})$
are objectwise pulled back from the projective general linear groups,
then the following induces an isomorphism on homology
$$\dim_!(M \boxplus N) \longrightarrow\dim_!(M \boxbackslash N).$$*
:::

#### $E_k$-homology and split buildings

In [4.4.1](#sec:buildings){reference-type="ref+label"
reference="sec:buildings"} we saw that Steinberg modules and their
variants arise from the homology of buildings. These are obtained from
collections of flags, and in this section we will consider versions
obtained from splittings, i.e. direct sum decompositions.

The *split buildings*
$\widetilde{D}^k(V) \in {\mathrm{Fun}}(B{\mathrm{GL}}(V);{{\mathscr{S}}{\mathrm{pc}}}_*)$
were defined in [@GKRW20 Section 5.2] as the thick geometric realisation
of a $k$-fold pointed semisimplicial set
$\tilde{D}^k_{\bullet,\ldots,\bullet}(V)$ of $k$-dimensional grids of
direct sum decompositions of $V$; in the proof of
[59](#prop:bar-is-building){reference-type="ref+label"
reference="prop:bar-is-building"} these were denoted $D^{0,k}(V)$. We
can assemble these to
$\widetilde{D}^k \in {\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{S}}{\mathrm{pc}}}_*)$
and this object arises in a similar manner as the nonsplit buildings
[@GKRW20 Theorem 5.20]:

::: {#lem:bar-is-split-building .lemma}
**Lemma 66**. *There are equivalences in
${\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{S}}{\mathrm{pc}}}_*)$
$${\mathrm{Bar}}_\boxplus^k({\underline{\ast}}_+) \simeq \widetilde{D}^k \qquad \text{for all $k \geq 1$.}$$*
:::

In particular, it has a preferred lift to an object of
${\mathrm{coAlg}}_{E_k^{\mathrm{u}}}({\mathrm{Alg}}_{E_\infty^{\mathrm{u}}}({\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{S}}{\mathrm{pc}}}_*)))$,
where both the coalgebra and algebra structures are with respect to
$\boxplus$. Sending direct sum decompositions to flags induces
*forgetful maps* [@GKRW20 (5.6)] in
${\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{S}}{\mathrm{pc}}}_*)$
$$\widetilde{D}^k \longrightarrow D^k.$$ These are not equivalences, but
do induce isomorphisms on homology after applying $\dim_!$ using
[63](#lem:nesterenko-suslin){reference-type="ref+label"
reference="lem:nesterenko-suslin"}, see [@GKRW20 Theorem 5.18]. We now
use this to recall why $E_k$-homology is computed by homology with
coefficients in Steinberg modules:

::: proof
*Proof of [51](#thm:ekhomology-steinberg){reference-type="ref+label"
reference="thm:ekhomology-steinberg"}.* We will establish isomorphisms
$$H_{*,*}(\Sigma^k {\mathrm{indec}}_{E_k}({\mathbf{BGL}}_{\mathds{Q}})^+) \overset{\cong}\longrightarrow H_{*,*}({\mathrm{Bar}}^k({\mathbf{BGL}}^+_{\mathds{Q}})) \overset{\cong}{\longrightarrow} \widetilde{H}_{*,*}(\dim_! D^{k+1};{\mathds{Q}})$$
Unwinding the definition of the right side gives the result for $k=1,2$,
and for $k=\infty$ one uses iterated bar spectral sequences to identify
it with the quotient of the case $k=2$ by the decomposables, as in the
proof of [@GKRW20 Corollary 6.12]. The left map is an instance of
[206](#thm:indec-is-bar){reference-type="ref+label"
reference="thm:indec-is-bar"}, so it remains to establish that the right
map is. This follows by considering
$${\mathrm{Bar}}^k(\dim_!({\underline{\ast}}_+)) \simeq \dim_!({\mathrm{Bar}}^k_\boxplus({\underline{\ast}}_+)) \simeq \dim_! \widetilde{D}^k \longrightarrow\dim_! D^k$$
and applying $\widetilde{C}_*(-;{\mathds{Q}})$. Here the left-most map
is an equivalence as $\dim_!$ is a symmetric monoidal left adjoint, the
middle map is an equivalence by
[66](#lem:bar-is-split-building){reference-type="ref+label"
reference="lem:bar-is-split-building"}, and the right map becomes an
isomorphism as a consequence of
[63](#lem:nesterenko-suslin){reference-type="ref+label"
reference="lem:nesterenko-suslin"}. ◻
:::

We need to understand how the previous proof interacts with coalgebraic
structures.

::: {#lem:gl-st-coproduct .lemma}
**Lemma 67**. *The isomorphism
$$H_{*,*}({\mathrm{Bar}}({\mathbf{BGL}}^+_{\mathds{Q}})) \cong H_{*,*}({\mathrm{GL}};{{\mathscr{S}}{\mathrm{t}}})$$
is one of coalgebras, where the coproduct on the left is induced by the
bar construction and the one on the right is induced by that on
${{\mathscr{S}}{\mathrm{t}}}$.*
:::

::: proof
*Proof.* Consider the commutative diagram of promonoidal categories
$$\begin{tikzcd} ({\mathrm{Vect}},\oplus) \arrow{rr}{{\mathrm{id}}} \arrow{rd}[swap]{\dim} & & ({\mathrm{Vect}},\obackslash) \arrow{ld}{\dim} \\[-5pt]
& ({\mathds{N}},+) & \end{tikzcd}$$ where the diagonal maps are monoidal
and the horizontal map is lax monoidal. Applying the Day convolution
construction, we obtain a commutative diagram of monoidal categories
$$\begin{tikzcd} ({\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{S}}{\mathrm{pc}}}_*),\boxplus) \arrow{rr}{{\mathrm{id}}_! = {\mathrm{id}}} \arrow{rd}[swap]{\dim_!} & & ({\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{S}}{\mathrm{pc}}}_*),\obackslash) \arrow{ld}{\dim_!} \\[-5pt]
& ({\mathrm{Fun}}({\mathds{N}},{{\mathscr{S}}{\mathrm{pc}}}_*),\boxplus) & \end{tikzcd}$$
where the left diagonal map is monoidal and the other maps are oplax
monoidal. It thus suffices to show that there is a map
$${\mathrm{Bar}}_{\boxplus}({\underline{\ast}}_+) \longrightarrow{\mathrm{Bar}}_{\boxbackslash}({\underline{\ast}}_+).$$
of $E^u_1$-coalgebras and identify it on underlying objects with the map
$\widetilde{D}^1 \to D^1$.

Given an adjunction $L \dashv R$ where
$R \colon {\mathscr{D}} \to {\mathscr{C}}$ is lax monoidal,
$L \colon {\mathscr{C}} \to {\mathscr{D}}$ is oplax monoidal using the
mate correspondence, and ${\mathscr{C}}$ and ${\mathscr{D}}$ are
sufficiently nice,
[12.2.2](#sec:bar-cobar-naturality-general){reference-type="ref+label"
reference="sec:bar-cobar-naturality-general"} provides a natural
transformation of functors
$L^{\mathrm{coAlg}}{\mathrm{Bar}}_{\mathscr{D}} R^{\mathrm{Alg}}\Rightarrow {\mathrm{Bar}}_{\mathscr{C}}$.
On underlying objects, for an augmented algebra ${\mathbf{A}}$ this is
the map induced by the maps
$L(R({\mathbf{A}})^{\otimes p}) \to {\mathbf{A}}^{\otimes p}$ of
$p$-simplices given by the oplax monoidality of $L$ and the counit. When
we apply this result to $L = {\mathrm{id}}_! = R$, we get the desired
map: levelwise it is simply the oplax monoidality of ${\mathrm{id}}_!$
and recalling equivalences between bar constructions and building from
[59](#prop:bar-is-building){reference-type="ref+label"
reference="prop:bar-is-building"} and
[66](#lem:bar-is-split-building){reference-type="ref+label"
reference="lem:bar-is-split-building"}, we recognise this as the desired
map. ◻
:::

::: {#rem:coprod-ad-hoc .remark}
*Remark 68*. Let us outline a more direct argument for
[67](#lem:gl-st-coproduct){reference-type="ref+label"
reference="lem:gl-st-coproduct"} avoiding [@BlansBlomKupers].
[205](#exam:e1-coproduct){reference-type="ref+label"
reference="exam:e1-coproduct"} describes the homotopy class of the
coproduct on the bar construction in terms of relative tensor products
as
$$1 \otimes_{\mathbf{A}} 1 \overset{\simeq}\longleftarrow 1 \otimes_{\mathbf{A}} {\mathbf{A}} \otimes_{\mathbf{A}} 1 \longrightarrow 1 \otimes_{\mathbf{A}} 1 \otimes_{\mathbf{A}} 1.$$
In functor categories with values in pointed spaces the left equivalence
is modelled by the pointed homeomorphism
$|{\mathrm{Bar}}_\bullet(1,{\mathbf{A}},1)| \cong |{\mathrm{esd}}\,{\mathrm{Bar}}_\bullet(1,{\mathbf{A}},1)|$
(here geometric realisations are taken in pointed spaces) using
Bökstedt--Hsiang--Madsen's variant [@BHM Section 1] of the edgewise
subdivision construction of Segal [@SegalConfiguration Appendix 1] and
the right map by the map on $p$-simplices
$$1 \otimes {\mathbf{A}}^{\otimes p} \otimes {\mathbf{A}} \otimes {\mathbf{A}}^{\otimes p} \otimes 1 \longrightarrow 1 \otimes {\mathbf{A}}^{\otimes p} \otimes 1 \otimes {\mathbf{A}}^{\otimes p} \otimes 1$$
given by the augmentation on the middle term and identity elsewhere.
Passing to the case of interest, we need to prove that the following
square of pointed sets commutes for each $p$
$$\begin{tikzcd}\frac{\left\{\parbox[c]{5.5cm}{\centering splittings $U_0 \oplus \cdots \oplus U_{2p+1} = V$}\right\}}{\left\{\parbox[c]{5.5cm}{\centering splittings $U_0 \oplus \cdots \oplus U_{2p+1} = V$ with $U_0 \neq 0$ or $U_{2p+1} \neq 0$}\right\}} \rar \dar & 
\frac{\left\{\parbox[c]{5.5cm}{\centering splittings $U_0 \oplus \cdots \oplus U_{2p+1} = V$}\right\}}{\left\{\parbox[c]{5.5cm}{\centering splittings $U_0 \oplus \cdots \oplus U_{2p+1} = V$ with $U_0 \neq 0$, $U_p \neq 0$, or $U_{2p+1} \neq 0$}\right\}} \dar \\
\frac{\left\{\parbox[c]{5.8cm}{\centering flags $0 = V_{-1} \subseteq V_0 \subseteq \cdots \subseteq V_{2p+1} = V$}\right\}}{\left\{\parbox[c]{5.8cm}{\centering flags $0 = V_{-1} \subseteq V_1 \subseteq \cdots \subseteq V_{2p+1} = V$ with $V_0/V_{-1} \neq 0$ or $V_{2p+1}/V_{2p} \neq 0$}\right\}} \rar & 
\frac{\left\{\parbox[c]{5.8cm}{\centering flags $0 = V_{-1} \subseteq V_1 \subseteq \cdots \subseteq V_{2p+1} = V$}\right\}}{\left\{\parbox[c]{5.8cm}{\centering flags $0 = V_{-1} \subseteq V_1 \subseteq \cdots \subseteq V_{2p+1} = V$ with $V_0/V_{-1} \neq 0$, $V_p/V_{p-1} \neq 0$, or $V_{2p+1}/V_{2p} \neq 0$}\right\}}\end{tikzcd}$$
where the vertical maps sum up splittings to flags and the horizontal
maps are projections; it visibly does. This should agree up to a
suspension with the coproduct of Campbell--Zakharevich
[@CampbellZakharevich Section 2.2] (see also [@KKMMW Section 4.2]) and,
after passing to homology, that of Brown--Chan--Galatius--Payne [@BCGP
Section 3.1].
:::

### The cobracket on the $E_\infty$-homology of ${\mathbf{BGL}}_{\mathds{Q}}$

As we have discussed, by Koszul duality, the indecomposables
$\Sigma \,{\mathrm{cot}}_{E^{\mathrm{nu}}_\infty}({\mathbf{BGL}}_{\mathds{Q}})$
admit the structure of a Lie coalgebra in
${\mathrm{Fun}}({\mathds{N}},{{\mathscr{D}}_{\mathds{Q}}})$. It is a
crucial point that this structure is *not* induced by the corresponding
structure on ${{{\mathscr{S}}{\mathrm{t}}}^\infty}$ under the
isomorphism of
[51](#thm:ekhomology-steinberg){reference-type="ref+label"
reference="thm:ekhomology-steinberg"}. This can be seen by a simple
comparison of degrees: the Lie coalgebra structure on
${{{\mathscr{S}}{\mathrm{t}}}^\infty}$ translates to a Lie coalgebra
structure whose *wrong* cobracket on
$H_{*,*}({\mathrm{GL}};{{{\mathscr{S}}{\mathrm{t}}}^\infty})$ has degree
$0$, but the *correct* cobracket has degree $1$.

The explanation is that ${{{\mathscr{S}}{\mathrm{t}}}^\infty}$ is not
only a Lie coalgebra with respect to $\boxplus$, but also has a
remaining coproduct with respect to $\boxbackslash$ which is compatible
with the cobracket. The two tensor products $\boxplus$ and
$\boxbackslash$ become identified upon applying $\dim_!$ by
[65](#lem:dim-levi-para){reference-type="ref+label"
reference="lem:dim-levi-para"} and via the same phenomenon as the
additivity theorem or the Eckmann--Hilton argument, this leads to a
vanishing result for the induced cobracket and a secondary cobracket of
one degree higher. Our goal in this section is to give a strategy for
the computation of this correct secondary cobracket using the lift of
the original coproduct to the cobar complexes in
[34](#prop:coproduct-on-cobar){reference-type="ref+label"
reference="prop:coproduct-on-cobar"}, which will be implemented in
[5](#sec:cobracket){reference-type="ref+label"
reference="sec:cobracket"}.

Our starting point is to recall that since
$${\mathrm{H}}^+ \coloneq H_{*,*}({\mathrm{GL}};{{\mathscr{S}}{\mathrm{t}}})$$
arises as the homology of the bar construction
${\mathrm{Bar}}({\mathbf{BGL}}_{\mathds{Q}}^+)$, it comes with the
structure of an augmented commutative bialgebra; the coproduct here
arises from that on the bar construction but agrees with that induced by
the coproduct on Steinberg modules by
[67](#lem:gl-st-coproduct){reference-type="ref+label"
reference="lem:gl-st-coproduct"}. The bialgebra ${\mathrm{H}}^+$ is
concentrated in bidegrees $(n,d)$ for $d \geq 2n-2$ by
[56](#thm:steinberg-homology-improved-vanishing){reference-type="ref+label"
reference="thm:steinberg-homology-improved-vanishing"} and it is related
to the Lie coalgebra
$H_{*,*}({\mathrm{GL}};\Sigma^{-1} {{{\mathscr{S}}{\mathrm{t}}}^\infty})$
as follows:

::: {#prop:cobracket-via-coproduct .proposition}
**Proposition 69**. *There is an isomorphism
$$H_{*,*}({\mathrm{GL}};\Sigma^{-1} {{{\mathscr{S}}{\mathrm{t}}}^\infty}) \cong {\mathrm{H}}/{\mathrm{H}}^2$$
where ${\mathrm{H}} \coloneq I({\mathrm{H}}^+) \subset {\mathrm{H}}^+$
is the augmentation ideal. Under this isomorphism, the cobracket is
induced by the antisymmetrisation
${\overline{\Delta}}-\sigma \circ {\overline{\Delta}}$ of the reduced
coproduct.*
:::

::: proof
*Proof.* The statement about the isomorphism follows from
[58](#prop:homology-of-bar-rat){reference-type="ref+label"
reference="prop:homology-of-bar-rat"}. For the statement about the
cobracket, we first observe that the inclusion
${\mathds{R}} \to {\mathds{R}}^\infty$ induces a map
$i \colon E_1^{\mathrm{nu}} \to E_\infty^{\mathrm{nu}}$ of operads, with
Koszul dual map
$Bi \colon BE_1^{\mathrm{nu}} \to BE_\infty^{\mathrm{nu}}$ of cooperads.
There is then a Beck--Chevalley transformation
$$(Bi)_* {\mathrm{indec}}^{\mathrm{nil}}_{E_1^{\mathrm{nu}}} i^* \longrightarrow{\mathrm{indec}}^{\mathrm{nil}}_{E_\infty^{\mathrm{nu}}}.$$
Working rationally, the map $i$ is equivalent to the map
${\mathrm{As}}^{\mathrm{nu}} \to {\mathrm{Com}}^{\mathrm{nu}}$
forgetting the product is commutative, and its Koszul dual is equivalent
to the operadic suspension of the map
${\mathrm{coAs}}^{\mathrm{nu}} \to {\mathrm{{\mathrm{coLie}}}}$ which
considers a coassociative coalgebra with (necessarily reduced) coproduct
${\overline{\Delta}}$ as a Lie coalgebra with cobracket
$\delta = {\overline{\Delta}}-\sigma \circ {\overline{\Delta}}$ given by
the antisymmetrisation of the coproduct. Passing to homology, we see
that the (shifted) cobracket on $E_\infty$-homology is induced by
antisymmetrisation of the (shifted) coproduct on $E_1$-homology. ◻
:::

::: remark
*Remark 70*. Since we have
${\overline{\Delta}}-\sigma \circ {\overline{\Delta}} = \Delta-\sigma \circ \Delta$
on ${\mathrm{H}}^+$, one can also use the antisymmetrisation of the
coproduct itself.
:::

More precisely,
[69](#prop:cobracket-via-coproduct){reference-type="ref+label"
reference="prop:cobracket-via-coproduct"} says that the cobracket is
given by the dashed map in
$$\begin{tikzcd} {\mathrm{H}} \dar[swap]{\overline{\Delta}-\sigma \circ \overline{\Delta}} \rar[two heads] & {\mathrm{H}}/{\mathrm{H}}^2 \dar[dashed]{\delta} \\[-5pt]
{\mathrm{H}} \otimes {\mathrm{H}} \rar[two heads] & {\mathrm{H}}/{\mathrm{H}}^2 \otimes {\mathrm{H}}/{\mathrm{H}}^2 & \end{tikzcd}$$
obtained by lifting along the top surjective map and applying the
left-bottom composition; the result is independent of the choice of lift
using
$${\overline{\Delta}}(xy) \equiv x \otimes y+(-1)^{|x||y|} y \otimes x \pmod{ {\mathrm{H}} \otimes {\mathrm{H}}^2+{\mathrm{H}}^2 \otimes {\mathrm{H}}}.$$
Thus our first task is to understand how to compute this coproduct. By
[67](#lem:gl-st-coproduct){reference-type="ref+label"
reference="lem:gl-st-coproduct"} it is induced by the coproduct $\Delta$
on ${{\mathscr{S}}{\mathrm{t}}}$ with respect to the tensor product
$\boxbackslash$.
[34](#prop:coproduct-on-cobar){reference-type="ref+label"
reference="prop:coproduct-on-cobar"} provides a lift of the Koszul
duality equivalence
$$\Sigma^{-1}\Omega^{\mathrm{{\mathrm{coLie}}}}({{{\mathscr{S}}{\mathrm{t}}}^\infty}) \overset{\simeq}\longrightarrow{{\mathscr{S}}{\mathrm{t}}}_{>0}$$
to one of counital coassociative coalgebras with respect to the tensor
product $\boxbackslash$. We will explain how to obtain the quotients
${\mathrm{H}}/{\mathrm{H}}^2$ from this perspective.

Our starting point is a concrete instance of the canonical
multiplicative filtration from [@GKRW18 Section 5.4], obtained as the
functor $(-1)^{\mathrm{alg}}_!$ on algebras obtained from
$(-1)_! \colon {\mathscr{C}} \to {\mathrm{Fun}}({\mathds{Z}}_\leq,{\mathscr{C}})$
by the construction of
[12.1.6](#sec:alg-nat-left-adjoint){reference-type="ref+label"
reference="sec:alg-nat-left-adjoint"}. Rectifying using
[12.4](#sec:rect-dg){reference-type="ref+label" reference="sec:rect-dg"}
we work in the category
${\mathrm{Fun}}({\mathrm{A}},{\mathrm{Ch}}_{\mathds{Q}})$ for a
symmetric monoidal $1$-category ${\mathrm{C}}$.

Recall from [216](#def:cobar-colie){reference-type="ref+label"
reference="def:cobar-colie"} that the cobar construction of a Lie
dg-coalgebra ${\mathbf{L}}$ in
${\mathrm{Fun}}({\mathrm{A}},{\mathrm{Ch}}_{\mathds{Q}})$ has underlying
object given by
$\Sigma({\mathrm{Com}}^{\mathrm{nu}} \circ \Sigma^{-1} {\mathbf{L}})$,
where $\circ$ denotes the composition product of symmetric sequences.
This can be lifted to a filtered object
$${\mathrm{fil}}_{\mathrm{can}} \Omega^{\mathrm{{\mathrm{coLie}}}}({\underline{L}}) \coloneq \Sigma({\mathrm{Com}}^{\mathrm{nu}} \circ \Sigma^{-1} (-1)_! {\mathbf{L}})$$
by putting ${\mathbf{L}}$ in filtration degree $-1$; when
${\mathbf{L}}= B^{\mathrm{Com}}({\mathbf{R}})$ for a nonunital
dg-commutative algebra ${\mathbf{R}}$ this recovers the canonical
multiplicative filtration on ${\mathbf{R}}$. Moreover, in the pointed
setting the functor $a_!$ for $a \in {\mathds{Z}}$ admits a further left
adjoint $a^\dagger$ [@GKRW18 Section 5.2.2] (called $a^!$ there), given
by sending a filtered object $X$ to $\mathop{\mathrm{colim}}(X)/X(a-1)$.
The natural transformation $(n+1)_! \to n_!$ induces natural
transformations $n^\dagger \to (n+1)^\dagger$ and this allows to extract
from the canonical filtration a second filtered object
$${\mathrm{fil}}_{\mathrm{pow}} \Omega^{\mathrm{{\mathrm{coLie}}}}({\mathbf{L}}) \coloneq \big(a \mapsto (-a)^\dagger({\mathrm{fil}}_{\mathrm{can}} \Omega^{\mathrm{{\mathrm{coLie}}}}({\mathbf{)}})\big).$$
We call this the *power filtration*, justified by the following result
in the special case ${\mathrm{C}} = {\mathds{N}}$:

::: {#lem:fil-pow-free .lemma}
**Lemma 71**. *Suppose that ${\mathbf{R}}^+$ is an
$E^{\mathrm{u}}_\infty$-algebra in
${\mathrm{Fun}}({\mathds{N}},{{\mathscr{D}}_{\mathds{Q}}})$ so that
${\mathrm{H}}^+ \coloneq H_{*,*}({\mathbf{R}}^+)$ is free as a
graded-commutative algebra and has a $c_0$-connected augmentation ideal
$H$. Then there is an isomorphism
$$H_*({\mathrm{fil}}_{\mathrm{pow}}(\Omega^{{\mathrm{{\mathrm{coLie}}}}}(B^{\mathrm{Com}} {\mathbf{R}}))) \cong {\mathrm{H}}/{\mathrm{H}}^{\bullet},$$
where the right side is the filtered object obtained from ${\mathbf{H}}$
by taking quotients by powers.*
:::

::: proof
*Proof.* By the proof of
[58](#prop:homology-of-bar-rat){reference-type="ref+label"
reference="prop:homology-of-bar-rat"} there is an equivalence
$$S^*(H^{E_\infty}_{*,*}({\mathbf{R}})) \overset{\simeq}\longrightarrow{\mathbf{R}}^+,$$
so without loss of generality we may replace ${\mathbf{R}}^+$ with the
left side. Since this is free,
$B^{\mathrm{Com}}(S^*(H^{E_\infty}_{*,*}({\mathbf{R}})))$ is equivalent
to the trivial Lie coalgebra
${\mathrm{cotriv}}_{\mathrm{coLie}}(H^{E_\infty}_{*,*}({\mathbf{R}}))$,
and the canonical filtration on its cobar construction is split,
isomorphic to the free nonunital graded-commutative algebra on
$H^{E_\infty}_{*,*}({\mathbf{R}})$ with filtration degree corresponding
to the number of products. ◻
:::

Returning to the case at hand, we take
$L = {{{\mathscr{S}}{\mathrm{t}}}^\infty}$ in
${\mathrm{Fun}}({\mathrm{Vect}},{\mathrm{GrMod}}_{\mathds{Q}}) \subset {\mathrm{Fun}}({\mathrm{Vect}},{\mathrm{Ch}}_{\mathds{Q}})$.
Then the coLie cobar construction
$\Omega^{\mathrm{{\mathrm{coLie}}}}({{{\mathscr{S}}{\mathrm{t}}}^\infty})$
takes the form
$${{{\mathscr{S}}{\mathrm{t}}}^\infty}\to \Lambda^2 {{{\mathscr{S}}{\mathrm{t}}}^\infty}\to \Lambda^3 {{{\mathscr{S}}{\mathrm{t}}}^\infty}\to \cdots,$$
where on $F^n \in {\mathrm{Vect}}$ the left-most term is given by
${\mathrm{St}}^{\infty}_n$ in degree $2n$. The power filtration on this
is given in filtration degree $-r$ for $r \geq 0$ by having only the
first $r$ terms starting from the left. Applying the construction of
[34](#prop:coproduct-on-cobar){reference-type="ref+label"
reference="prop:coproduct-on-cobar"} in filtered chain complexes lifts
it to a filtered map
$${\mathrm{fil}}_{\mathrm{can}} \overline{\Delta} \colon {\mathrm{fil}}_{\mathrm{can}}(\Sigma^{-1}\Omega^{\mathrm{{\mathrm{coLie}}}}({{{\mathscr{S}}{\mathrm{t}}}^\infty})) \longrightarrow{\mathrm{fil}}_{\mathrm{can}}(\Sigma^{-1}\Omega^{\mathrm{{\mathrm{coLie}}}}({{{\mathscr{S}}{\mathrm{t}}}^\infty})) \boxbackslash{\mathrm{fil}}_{\mathrm{can}}(\Sigma^{-1}\Omega^{\mathrm{{\mathrm{coLie}}}}({{{\mathscr{S}}{\mathrm{t}}}^\infty})).$$
Plotting the power filtration horizontally, we get maps of chain
complexes
$$\begin{tikzcd}\big[\Sigma^{-1}\Omega^{\mathrm{{\mathrm{coLie}}}}({{{\mathscr{S}}{\mathrm{t}}}^\infty})\big] \dar \rar &[-10pt] \cdots \rar &[-10pt] \big[{{{\mathscr{S}}{\mathrm{t}}}^\infty}\to \Lambda^2 {{{\mathscr{S}}{\mathrm{t}}}^\infty}\big] \rar\dar &[-10pt]{{{\mathscr{S}}{\mathrm{t}}}^\infty}\dar \\[-5pt]
\big[\Sigma^{-1}\Omega^{\mathrm{{\mathrm{coLie}}}}({{{\mathscr{S}}{\mathrm{t}}}^\infty}) \boxbackslash\Sigma^{-1}\Omega^{\mathrm{{\mathrm{coLie}}}}({{{\mathscr{S}}{\mathrm{t}}}^\infty})\big] \rar & \cdots \rar & \big[0 \to {{{\mathscr{S}}{\mathrm{t}}}^\infty}\boxbackslash{{{\mathscr{S}}{\mathrm{t}}}^\infty}] \rar & 0 \end{tikzcd}$$
where the left-most vertical map is equivalent to the reduced coproduct
${{\mathscr{S}}{\mathrm{t}}}_{>0} \to {{\mathscr{S}}{\mathrm{t}}}_{>0} \boxbackslash{{\mathscr{S}}{\mathrm{t}}}_{>0}$.
Applying $\dim_!$, which as symmetric monoidal left adjoint commutes
with the constructions, and taking homology, we obtain from this by
[71](#lem:fil-pow-free){reference-type="ref+label"
reference="lem:fil-pow-free"} a commutative diagram
$$\begin{tikzcd} {\mathrm{H}} \rar[two heads] \dar{{\overline{\Delta}}} & \cdots \rar[two heads] \dar & {\mathrm{H}}/{\mathrm{H}}^3 \rar[two heads] \dar & {\mathrm{H}}/{\mathrm{H}}^2 \dar \\[-5pt]
{\mathrm{H}} \otimes {\mathrm{H}} \rar & \cdots \rar & {\mathrm{H}}/{\mathrm{H}}^2 \otimes {\mathrm{H}}/{\mathrm{H}}^2 \rar & 0.\end{tikzcd}$$
This conclusion is the following procedure, the computational
implementation of which appears in
[5](#sec:cobracket){reference-type="ref+label"
reference="sec:cobracket"}.

::: {#prop:construction-of-cobracket .proposition}
**Proposition 72**. *The cobracket is obtained by*

(1) *applying $\dim_!$ to the zigzag of chain complexes
    $${{{\mathscr{S}}{\mathrm{t}}}^\infty}\longleftarrow [{{{\mathscr{S}}{\mathrm{t}}}^\infty}\to \Lambda^2 {{{\mathscr{S}}{\mathrm{t}}}^\infty}] \longrightarrow [0 \to {{{\mathscr{S}}{\mathrm{t}}}^\infty}\boxbackslash{{{\mathscr{S}}{\mathrm{t}}}^\infty}]$$
    where the left map is projection to
    ${{{\mathscr{S}}{\mathrm{t}}}^\infty}$ and the right map is
    projection to $\Lambda^2 {{{\mathscr{S}}{\mathrm{t}}}^\infty}$
    followed by an instance of $\zeta^{\mathrm{alt}}$ from
    [\[eqn:zeta-alt\]](#eqn:zeta-alt){reference-type="eqref"
    reference="eqn:zeta-alt"}, and*

(2) *antisymmetrising.*
:::

## The cobracket of ${\mathscr{G}}(F)$

In this section we describe how to obtain a presentation of
${\mathscr{G}}_n(F)$ close to that in
[\[thm:polyl-presentation-additive\]](#thm:polyl-presentation-additive){reference-type="ref+label"
reference="thm:polyl-presentation-additive"} (it has the same generators
but the relations are phrased differently) and compute the cobracket
$$\delta \colon {\mathscr{G}}(F) \longrightarrow\Lambda^2 {\mathscr{G}}(F) \qquad \text{where ${\mathscr{G}}_n(F) = H_1({\mathrm{GL}}_n(F);{\mathrm{St}}^{\infty}_n)$}$$
to obtain
[\[thm:polyl-presentation-cobracket\]](#thm:polyl-presentation-cobracket){reference-type="ref+label"
reference="thm:polyl-presentation-cobracket"}. We follow
[1](#conv:shorter-notation){reference-type="ref+label"
reference="conv:shorter-notation"}.

### Resolving infinite Steinberg modules by formal correlators

We will use formal analogues of the generators and relations in
[2.5.2](#sec:pres-form-stl){reference-type="ref+label"
reference="sec:pres-form-stl"} and decomposition operators
[\[eqn:decomposition-operator\]](#eqn:decomposition-operator){reference-type="eqref"
reference="eqn:decomposition-operator"} to construct resolutions of the
infinite Steinberg modules ${\mathrm{St}}^{\infty}(V)$ as in
[1.4.1](#sec:intro-presentation-resolution){reference-type="ref+label"
reference="sec:intro-presentation-resolution"}.

#### Formal correlators

Our starting point is a Lie coalgebra
$\mathrm{FC}\in {\mathrm{Fun}}({\mathrm{Vect}},{\mathrm{GrMod}}) \subset {\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{D}}_{\mathds{Q}}})$
of "formal" analogues of the Steinberg correlators. Its value on a
vector space $V$ of positive dimension $n$ will be generated by symbols
$\mathrm{FC}[u_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n]$
that we call *formal correlators* for affine bases $u_0,\ldots,u_n$,
satisfying the analogues of
[\[enum:stl-relations-i\]](#enum:stl-relations-i){reference-type="eqref"
reference="enum:stl-relations-i"}--[\[enum:stl-relations-iii\]](#enum:stl-relations-iii){reference-type="eqref"
reference="enum:stl-relations-iii"}:

(1) []{#enum:fc-relations-i label="enum:fc-relations-i"} They are
    homogeneous:
    ${\mathrm{FC}}[u_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n] = {\mathrm{FC}}[u_0-u:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n-u]$
    for any $u \in V$.

(2) []{#enum:fc-relations-ii label="enum:fc-relations-ii"} They are
    cyclically symmetric:
    ${\mathrm{FC}}[u_0:u_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n] = {\mathrm{FC}}[u_1:u_2:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_0]$.

(3) []{#enum:fc-relations-iii label="enum:fc-relations-iii"} They
    satisfy the shuffle relations:
    $$\sum_{\sigma \in {\mathrm{Sh}}(n_1,n_2)} {\mathrm{FC}}[u_0:u_{\sigma(1)}:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_{\sigma(n_1+n_2)}] =0 \quad \text{for $n=n_1+n_2$ with $n_1,n_2>0$.}$$

::: definition
**Definition 73**. If $V$ is of dimension $n$, then we define
$$\mathrm{FC}(V) \coloneq \begin{cases} \displaystyle \frac{{\mathds{Q}}\{\mathrm{FC}[u_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n] \text{ for affine bases $u_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},u_n$}\}}{\text{\eqref{enum:fc-relations-i}--\eqref{enum:fc-relations-iii}}} & \text{if $n>0$}, \\
0 & \text{if $n=0$}.\end{cases}$$
:::

The action of ${\mathrm{GL}}(V)$ on affine bases induces a
${\mathrm{GL}}(V)$-action on $\mathrm{FC}(V)$, and we can assemble all
to an object
$\mathrm{FC}\in {\mathrm{Fun}}({\mathrm{Vect}},{\mathrm{GrMod}}_{\mathds{Q}}) \subset {\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{D}}_{\mathds{Q}}})$.
We will endow this with a Lie coalgebra structure by repeating the
formula
[\[eqn:stinfty-cobracket\]](#eqn:stinfty-cobracket){reference-type="eqref"
reference="eqn:stinfty-cobracket"} of
[24](#prop:stl-explicit-cobracket){reference-type="ref+label"
reference="prop:stl-explicit-cobracket"}, cf. [@Goncharov01 p. 436] and
[@CMRR24 Lemma 2, Proposition 15].

::: definition
**Definition 74**. The *cyclic cobracket*
$\delta_{\mathrm{cyc}} \colon {\mathrm{FC}} \to \Lambda^2 {\mathrm{FC}}$
is given by the formula
$$\delta_{\mathrm{cyc}}(\mathrm{FC}[u_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n]) = \sum_{j=0}^n \sum_{i=1}^{n-1} \mathrm{FC}[u_j:u_{j+1}:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_{j+i}] \wedge \mathrm{FC}[u_j:u_{j+i+1}:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_{j+n}]$$
where the indices are to be interpreted cyclically.
:::

::: {#rem:delta-cyc-from-sder .remark}
*Remark 75*. One can use
[3.2](#sec:lie-alg-trees-derivations){reference-type="ref+label"
reference="sec:lie-alg-trees-derivations"} to justify that
$\delta_{\mathrm{cyc}}$ is a well-defined Lie cobracket (compare to
[48](#rem:c-sder-cobracket){reference-type="ref+label"
reference="rem:c-sder-cobracket"}): that is, $\delta_{\mathrm{cyc}}$ is
compatible with the relations
[\[enum:fc-relations-i\]](#enum:fc-relations-i){reference-type="eqref"
reference="enum:fc-relations-i"}--[\[enum:fc-relations-iii\]](#enum:fc-relations-iii){reference-type="eqref"
reference="enum:fc-relations-iii"}, and satisfies the anti-symmetry and
co-Jacobi relations. It suffices to verify these properties on a
generator
$\mathrm{FC}[u_0 : \mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}: u_n]$.
On such a generator it agrees---after applying the functor $t_!$ induced
by $t \colon {\mathrm{Vect}}\to \ast$, which sums up all values on all
vector spaces and hence sends no elements to zero---with the same-named
Lie cobracket from [3.2.6](#sec:sder-dual){reference-type="ref+label"
reference="sec:sder-dual"} on the generator
${\mathrm{LC}}[X_0: \mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}: X_n] \in {\mathfrak{sder}}_S^\vee$
where $S = [n] = \{0,1,\ldots,n\}$ and this has the aforementioned
properties.
:::

The vanishing result of
[20](#lem:stl-cobracket-vanishing){reference-type="ref+label"
reference="lem:stl-cobracket-vanishing"} holds also for this cobracket.
Note that it implies the corresponding result in
${{{\mathscr{S}}{\mathrm{t}}}^\infty}$, since the map
$\mathrm{FC}\to {{{\mathscr{S}}{\mathrm{t}}}^\infty}$ is a morphism of
Lie coalgebras, where $\zeta^{\mathrm{alt}}$ is
$x \wedge y \mapsto \frac{1}{2}(x \boxbackslash{\overline{y}}-y \boxbackslash{\overline{x}})$
as in [\[eqn:zeta-alt\]](#eqn:zeta-alt){reference-type="eqref"
reference="eqn:zeta-alt"}:

::: {#lem:fc-cobracket-symmetry .lemma}
**Lemma 76**. *The cobracket on $\mathrm{FC}$ has the following
vanishing property:
$$\zeta^{\mathrm{alt}}\circ \delta_{\mathrm{cyc}} = 0.$$*
:::

::: proof
*Proof.* The terms cancel pairwise: given a marked cut $i,(j+i,j+i+1)$
where the marked polygon is counterclockwise from the cut vertex, we can
construct another marked cut $j+i,(i-1,i)$ where the marked polygon is
clockwise from the cut vertex, giving a pairing between the two sets.
For example, the following marked cuts are paired where the first is
$j=2$, $i=2$ (markings are indicated by shading):
$$\begin{tikzpicture}[baseline={([yshift=-.5ex]current bounding box.center)}]
   \begin{scope}
       \clip (60:1)--(120:1)--(180:1)--(240:1)--(300:1)--(360:1)--cycle;
       \draw[pattern={Lines[angle=-45,distance=4pt]},pattern color=Mahogany] (60:1)--(270:1)--(240:1) -- (180:1) -- (120:1) -- cycle;
   \end{scope}
   \draw (0:1) \foreach \x in {60,120,...,360} {  -- (\x:1) };
   \foreach \x/\l/\p in
     { 60/{$u_2$}/above,
      120/{$u_1$}/above,
      180/{$u_0$}/left,
      240/{$u_5$}/below,
      300/{$u_4$}/below,
      360/{$u_3$}/right
     }
     \node[inner sep=1pt,circle,draw,fill,label={\p:\l}] at (\x:1) {};
     \draw (60:1) -- (270:1);
\end{tikzpicture}
\quad \leftrightarrow \quad
\begin{tikzpicture}[baseline={([yshift=-.5ex]current bounding box.center)}]
    \begin{scope}
       \clip (60:1)--(120:1)--(180:1)--(240:1)--(300:1)--(360:1)--cycle;
       \draw[pattern={Lines[angle=-45,distance=4pt]},pattern color=Mahogany] (90:1)--(300:1) -- (240:1) -- (180:1) -- (120:1) -- cycle;
   \end{scope}
   \draw (0:1) \foreach \x in {60,120,...,360} {  -- (\x:1) };
   \foreach \x/\l/\p in
     { 60/{$u_2$}/above,
      120/{$u_1$}/above,
      180/{$u_0$}/left,
      240/{$u_5$}/below,
      300/{$u_4$}/below,
      360/{$u_3$}/right
     }
     \node[inner sep=1pt,circle,draw,fill,label={\p:\l}] at (\x:1) {};
     \draw (300:1) -- (90:1);
\end{tikzpicture}$$ By construction, these contribute (up to a factor of
$\frac{1}{2}$) $$\begin{align*}
&{\mathrm{FC}}[u_i:u_{i+1}:\cdots:u_{i+j}] \boxbackslash\overline{{\mathrm{FC}}[u_j:u_{j+i+1}:\cdots:u_{j+n}]}\\
&\qquad -{\mathrm{FC}}[u_{i+j}:u_i:\cdots:u_{i+j-1}] \boxbackslash\overline{{\mathrm{FC}}[u_{i+j}:u_{i+j+1}:\cdots:u_{j+n}]}.
\end{align*}$$ We now observe that using the cyclic symmetry of formal
correlators the first parts of the two terms agree, and that upon
applying naturality in taking the quotient by
${\mathrm{span}}(u_i-u_{i+j},\ldots,u_{i+j-1}-u_{i+j})$ in particular
$u_i$ and $u_{i+j}$ get identified and also the second parts of the two
agree; thus they cancel. ◻
:::

::: {#exam:zeta-alt-d-cyc .example}
*Example 77*. For $V = F^2$ with affine basis $e_1+e_2,e_1,e_2$, the
composition $\zeta^{\mathrm{alt}}\circ \delta_{\mathrm{cyc}}$ has six
terms (up to a factor of $\tfrac{1}{2})$:
$$\, \quad \begin{tikzpicture}[baseline={([yshift=-.5ex]current bounding box.center)}]
   \begin{scope}
       \clip (180:1) -- (300:1) -- (60:1) -- cycle;
       \draw[pattern={Lines[angle=-45,distance=4pt]},pattern color=Mahogany] (180:1) -- (0:1) -- (-60:1) -- cycle;
   \end{scope}
   \draw (180:1) -- (300:1) -- (60:1) -- cycle;
   \node[inner sep=1pt,circle,draw,fill,label={left:$e_1+e_2$}] at (180:1) {};
   \node[inner sep=1pt,circle,draw,fill,label={above:$e_1$}] at (60:1) {};
   \node[inner sep=1pt,circle,draw,fill,label={below:$e_2$}] at (300:1) {};
   \draw (180:1) -- (0:1);
\end{tikzpicture}
\quad + \quad
\begin{tikzpicture}[baseline={([yshift=-.5ex]current bounding box.center)}]
   \begin{scope}
       \clip (180:1) -- (300:1) -- (60:1) -- cycle;
       \draw[pattern={Lines[angle=-45,distance=4pt]},pattern color=Mahogany] (60:1) -- (180:1) -- (-120:1) -- cycle;
   \end{scope}
   \draw (180:1) -- (300:1) -- (60:1) -- cycle;
   \node[inner sep=1pt,circle,draw,fill,label={left:$e_1+e_2$}] at (180:1) {};
   \node[inner sep=1pt,circle,draw,fill,label={above:$e_1$}] at (60:1) {};
   \node[inner sep=1pt,circle,draw,fill,label={below:$e_2$}] at (300:1) {};
   \draw (60:1) -- (-120:1);
\end{tikzpicture}
\quad + \quad
\begin{tikzpicture}[baseline={([yshift=-.5ex]current bounding box.center)}]
   \begin{scope}
       \clip (180:1) -- (300:1) -- (60:1) -- cycle;
       \draw[pattern={Lines[angle=-45,distance=4pt]},pattern color=Mahogany] (120:1) -- (60:1) -- (-60:1) -- cycle;
   \end{scope}
   \draw (180:1) -- (300:1) -- (60:1) -- cycle;
   \node[inner sep=1pt,circle,draw,fill,label={left:$e_1+e_2$}] at (180:1) {};
   \node[inner sep=1pt,circle,draw,fill,label={above:$e_1$}] at (60:1) {};
   \node[inner sep=1pt,circle,draw,fill,label={below:$e_2$}] at (300:1) {};
   \draw (120:1) -- (-60:1);
\end{tikzpicture}$$
$$-\quad \begin{tikzpicture}[baseline={([yshift=-.5ex]current bounding box.center)}]
   \begin{scope}
       \clip (180:1) -- (300:1) -- (60:1) -- cycle;
       \draw[pattern={Lines[angle=-45,distance=4pt]},pattern color=Mahogany] (60:1) -- (-60:1) -- (-120:1) -- cycle;
   \end{scope}
   \draw (180:1) -- (300:1) -- (60:1) -- cycle;
   \node[inner sep=1pt,circle,draw,fill,label={left:$e_1+e_2$}] at (180:1) {};
   \node[inner sep=1pt,circle,draw,fill,label={above:$e_1$}] at (60:1) {};
   \node[inner sep=1pt,circle,draw,fill,label={below:$e_2$}] at (300:1) {};
   \draw (60:1) -- (-120:1);
\end{tikzpicture}
\quad - \quad
\begin{tikzpicture}[baseline={([yshift=-.5ex]current bounding box.center)}]
   \begin{scope}
       \clip (180:1) -- (300:1) -- (60:1) -- cycle;
       \draw[pattern={Lines[angle=-45,distance=4pt]},pattern color=Mahogany] (120:1) -- (180:1) -- (-60:1) -- cycle;
   \end{scope}
   \draw (-180:1) -- (300:1) -- (60:1) -- cycle;
   \node[inner sep=1pt,circle,draw,fill,label={left:$e_1+e_2$}] at (180:1) {};
   \node[inner sep=1pt,circle,draw,fill,label={above:$e_1$}] at (60:1) {};
   \node[inner sep=1pt,circle,draw,fill,label={below:$e_2$}] at (300:1) {};
   \draw (120:1) -- (-60:1);
\end{tikzpicture}
\quad - \quad
\begin{tikzpicture}[baseline={([yshift=-.5ex]current bounding box.center)}]
   \begin{scope}
       \clip (180:1) -- (300:1) -- (60:1) -- cycle;
       \draw[pattern={Lines[angle=-45,distance=4pt]},pattern color=Mahogany] (180:1) -- (0:1) -- (60:1) -- cycle;
   \end{scope}
   \draw (180:1) -- (300:1) -- (60:1) -- cycle;
   \node[inner sep=1pt,circle,draw,fill,label={left:$e_1+e_2$}] at (180:1) {};
   \node[inner sep=1pt,circle,draw,fill,label={above:$e_1$}] at (60:1) {};
   \node[inner sep=1pt,circle,draw,fill,label={below:$e_2$}] at (300:1) {};
   \draw (180:1) -- (0:1);
\end{tikzpicture}$$ Each term on top cancels against the one below it,
as the reader should verify from $$\begin{align*}
&{\mathrm{FC}}[e_1{+}e_2{:}e_1] \wedge {\overline{{\mathrm{FC}}[e_1{+}e_2{:}e_2]}}+{\mathrm{FC}}[e_1{:}e_2] \wedge {\overline{{\mathrm{FC}}[e_1{:}e_1{+}e_2]}}+{\mathrm{FC}}[e_2{:}e_1{+}e_2] \wedge {\overline{{\mathrm{FC}}[e_2{:}e_1]}} \\
&-{\mathrm{FC}}[e_1{:}e_1{+}e_2] \wedge {\overline{{\mathrm{FC}}[e_1{:}e_2]}}-{\mathrm{FC}}[e_2{:}e_1] \wedge {\overline{{\mathrm{FC}}[e_2{:}e_1{+}e_2]}}-{\mathrm{FC}}[e_1{+}e_2{:}e_2] \wedge {\overline{{\mathrm{FC}}[e_1{+}e_2{:}e_1]}}
\end{align*}$$ using cyclic symmetry and identifying vectors in the
quotient.
:::

Since the relations
[\[enum:fc-relations-i\]](#enum:fc-relations-i){reference-type="eqref"
reference="enum:fc-relations-i"}--[\[enum:fc-relations-iii\]](#enum:fc-relations-iii){reference-type="eqref"
reference="enum:fc-relations-iii"} hold for the Steinberg correlators in
the infinite Steinberg module and its cobracket is given by the
analogous formula, there is a map $$\begin{align*}
{\mathrm{pr}}^{\mathrm{St}}\colon \mathrm{FC}&\longrightarrow{{{\mathscr{S}}{\mathrm{t}}}^\infty}\\
\mathrm{FC}[u_0 : \mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}: u_n] &\longmapsto {\mathrm{C}}[u_0: \mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}: u_n]
\end{align*}$$ of Lie coalgebras. It is clear from its construction that
the map ${\mathrm{C}}^{\mathrm{St}}_h$ admits a lift to a map
${\mathrm{C}}^\mathrm{FC}_h \colon ({\mathrm{B}}^{\mathrm{Com}} {{\mathscr{S}}{\mathrm{t}}})^H_n(V) \to \mathrm{FC}(V)$,
allowing us to define a decomposition operator $$\begin{equation}
\label{eqn:dec-fc} D^\mathrm{FC}_h \coloneq ({\mathrm{C}}^\mathrm{FC}_h \circ s_H \circ {\mathrm{pr}}^{\mathrm{St}}) \colon \mathrm{FC}(V) \longrightarrow\mathrm{FC}(V).
\end{equation}$$ Unlike for ${\mathrm{St}}^{\infty}$, this is generally
*not* the identity. However, it does satisfy
$$D^\mathrm{FC}_{h_1} D^\mathrm{FC}_{h_2} = D^\mathrm{FC}_{h_1}$$ since
${\mathrm{pr}}^{\mathrm{St}}$ annihilates the image of
${\mathrm{id}}- D^\mathrm{FC}_{h_2}$ as
${\mathrm{pr}}^{\mathrm{St}}D^\mathrm{FC}_{h_2} = D^{\mathrm{St}}_{h_2}$
and this is the identity by the discussion following
[\[eqn:decomposition-operator\]](#eqn:decomposition-operator){reference-type="eqref"
reference="eqn:decomposition-operator"}.

#### Formal iterated integrals

It is convenient to next introduce a formal analogue of the Steinberg
iterated integrals [@CMRR Definition 28], or rather their images under
the projection
${{{\mathscr{S}}{\mathrm{t}}}^2}\to {{{\mathscr{S}}{\mathrm{t}}}^\infty}$.
Its value on a vector space $V$ of positive dimension $n$ will be
generated by symbols
$\mathrm{FI}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n]$
that we call *formal iterated integrals* for bases $v_1,\ldots,v_n$,
satisfying only the analogue of
[\[enum:stl-relations-iii\]](#enum:stl-relations-iii){reference-type="eqref"
reference="enum:stl-relations-iii"}:

(3) []{#enum:fi-relations-iii label="enum:fi-relations-iii"} They
    satisfy the shuffle relations:
    $$\sum_{\sigma \in {\mathrm{Sh}}(n_1,n_2)} {\mathrm{FI}}[v_{\sigma(1)},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_{\sigma(n_1+n_2)}] =0 \quad \text{for $n=n_1+n_2$ with $n_1,n_2>0$.}$$

::: definition
**Definition 78**. If $V$ is of dimension $n$, then we define
$$\mathrm{FI}(V) \coloneq \begin{cases} \displaystyle \frac{{\mathds{Q}}\{\mathrm{FI}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n] \text{ for bases $v_1,\ldots,v_n$}\}}{\text{\eqref{enum:fi-relations-iii}}} & \text{if $n>0$,} \\
0 & \text{if $n=0$.}\end{cases}$$
:::

The action of ${\mathrm{GL}}(V)$ on bases induces a
${\mathrm{GL}}(V)$-action on $\mathrm{FI}(V)$, and we can assemble all
to an object
$\mathrm{FI}\in {\mathrm{Fun}}({\mathrm{Vect}},{\mathrm{GrMod}}_{\mathds{Q}}) \subset {\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{D}}_{\mathds{Q}}})$.
We endow this with a Lie coalgebra structure using the deconcatenation
cobracket:

::: definition
**Definition 79**. The *deconcatenation cobracket*
$\delta_{\mathrm{dec}} \colon {\mathrm{FI}} \to \Lambda^2 {\mathrm{FI}}$
is given by the formula
$$\delta_{\mathrm{dec}}({\mathrm{FI}}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n]) = \sum_{i=1}^{n-1} {\mathrm{FI}}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_i] \wedge {\mathrm{FI}}[v_{i+1},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n].$$
:::

There is a more economical construction of this Lie coalgebra: it is
isomorphic to the cofree Lie coalgebra on the functor
$X \colon {\mathrm{Vect}}\to {\mathrm{GrMod}}_{\mathds{Q}} \subset {{\mathscr{D}}_{\mathds{Q}}}$
given by
$$V \longmapsto \begin{cases} {\mathds{Q}}\{\text{nonzero $v \in V$}\} & \text{if $\dim(V)=1$} \\
0 & \text{otherwise.}\end{cases}$$ Indeed, there is an obvious map from
underlying object of $\mathrm{FI}$ to $X$ and the adjoint map
$\mathrm{FI}\to {\mathrm{cofree}}_{{\mathrm{{\mathrm{coLie}}}}}(X)$ is
an isomorphism, once we recall from
[3.2.2](#sec:lie-rep){reference-type="ref+label"
reference="sec:lie-rep"} that the
${\mathrm{{\mathrm{coLie}}}}$-representations are obtained by taking the
quotient of the permutation representations by shuffles. This justifies
that the deconcatenation cobracket is well-defined.

::: {#rem:delta-dec-from-sder .remark}
*Remark 80*. One can also use
[3.2](#sec:lie-alg-trees-derivations){reference-type="ref+label"
reference="sec:lie-alg-trees-derivations"} to justify that
$\delta_{\mathrm{dec}}$ is a well-defined Lie cobracket. Indeed, by the
analogous procedure to
[75](#rem:delta-cyc-from-sder){reference-type="ref+label"
reference="rem:delta-cyc-from-sder"}, it corresponds to the Lie
cobracket on ${\mathfrak{lie}}_{{\underline{n}}}^\vee$.
:::

There is a map in
${\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{D}}_{\mathds{Q}}})$
$$\begin{equation}
\label{eqn:qfi-to-fc} \begin{aligned} {\mathrm{pr}}^\mathrm{FC}\colon {\mathrm{FI}} &\longrightarrow{\mathrm{FC}} \\
\mathrm{FI}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n] &\longmapsto (-1)^n\mathrm{FC}[0:v_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_n]\end{aligned}
\end{equation}$$ which is *not* a map of Lie coalgebras, as the
deconcatenation cobracket on the cofree Lie coalgebra only involves
those terms in the cyclic cobracket that "cut through the zeroth
vertex". We will return to the relationship between these in
[5.3.2](#sec:cyclic-coaction){reference-type="ref+label"
reference="sec:cyclic-coaction"}.

It is clear from the construction that the map
${\mathrm{C}}^\mathrm{FC}_h$ admits a further lift to a map
${\mathrm{C}}^\mathrm{FI}_h \colon ({\mathrm{B}}^{\mathrm{Com}} {{\mathscr{S}}{\mathrm{t}}})^H_n(V) \to \mathrm{FI}(V)$,
with associated decomposition operator
$$D^\mathrm{FI}_h \coloneq ({\mathrm{C}}^\mathrm{FI}_h \circ s_H \circ {\mathrm{pr}}^{\mathrm{St}}\circ {\mathrm{pr}}^\mathrm{FC}) \colon \mathrm{FI}(V) \longrightarrow\mathrm{FI}(V),$$
which satisfies
${\mathrm{pr}}^\mathrm{FC}\circ D^\mathrm{FI}_h = D^\mathrm{FC}_h$ and
$D^\mathrm{FI}_{h_2} D^\mathrm{FI}_{h_1} = D^\mathrm{FI}_{h_2}$.

#### A resolution of infinite Steinberg modules {#sec: reso;ution inf st}

We now construct a resolution of ${\mathrm{St}}^{\infty}(V)$ by
projective ${\mathds{Q}}[{\mathrm{GL}}(V)]$-modules. The starting point
is the bar construction for a semigroup (i.e. nonunital monoid) $S$ with
a left action on a module $M$ in a category left tensored over
${{\mathscr{D}}_{\mathds{Q}}}$; this is simply the bar construction of
$M$ as a left ${\mathds{Q}}[S]$-module and explicitly given by
$$B_k(S,M) \coloneq {\mathds{Q}}[S]^{\otimes k} \otimes M$$ with
differential $$\begin{align*}
d([s_1|\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}|s_k] \otimes m) &= [s_2|\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}|s_k] \otimes m + \sum_{i=1}^{k-1} (-1)^i [s_1|\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}|s_is_{i+1}|\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}|s_k] \otimes m \\
&\qquad + (-1)^k [s_1|\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}|s_{k-1}] \otimes s_km.
\end{align*}$$ We will apply this in the category of
${\mathds{Q}}[{\mathrm{GL}}(V)]$-modules and to the following semigroup:

::: definition
**Definition 81**. ${{\mathrm{Dec}}}_V$ is the semigroup whose elements
are nonzero linear functionals $h \in V^\vee$ with multiplication given
by $h_1h_2 = h_1$.
:::

It has been constructed so that letting $h$ act on $\mathrm{FC}(V)$ or
$\mathrm{FI}(V)$ by decomposition operators gives an action of
${{\mathrm{Dec}}}_V$ on these ${\mathds{Q}}[{\mathrm{GL}}(V)]$-modules.
There is also an action of ${{\mathrm{Dec}}}_V$ on ${\mathds{Q}}$ by
*zero maps*, and we denote the associated
${\mathds{Q}}[{{\mathrm{Dec}}}_V]$-module by ${\mathds{Q}}_0$:

::: {#lem:decv-q0-acyclic .lemma}
**Lemma 82**. *$H_*({{\mathrm{Dec}}}_V;{\mathds{Q}}_0)=0$ for all
$* \in {\mathds{Z}}$.*
:::

::: proof
*Proof.* This is the chain complex given by
$$B_k({{\mathrm{Dec}}}_V;{\mathds{Q}}_0) = {\mathds{Q}}\{[h_1|\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}|h_k] \mid h_1,\ldots,h_k \in V^\vee \setminus \{0\}\}$$
with differential given by
$d([h_1|\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}|h_k]) = \sum_{i=1}^{k} (-1)^{i+1} [h_1|\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}|\widehat{h}_i|\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}|h_k]$
and fixing some $h \in V^\vee \setminus \{0\}$ we can give a chain
null-homotopy of the identity by
$H([h_1|\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}|h_k]) = [h|h_1|\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}|h_k]$,
verified by the computation $$\begin{align*}
(dH+Hd)([h_1|\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}|h_k]) &= \sum_{i=0}^{k} (-1)^i [h|h_1|\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}|\widehat{h}_i|\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}|h_k] -\sum_{i=1}^k (-1)^i[h|h_1|\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}|\widehat{h}_i|\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}|h_k] \\
&= [h_1|\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}|h_k]
\end{align*}$$ where in the first sum in the term $i=0$ we delete $h$. ◻
:::

::: {#lem:stl-fi-resolution .lemma}
**Lemma 83**. *We have
$$H_k({{\mathrm{Dec}}}_V;\mathrm{FI}(V)) \cong \begin{cases} {\mathrm{St}}^{\infty}(V) & \text{if $k=0$,} \\
0 & \text{otherwise,}\end{cases}$$ with isomorphism induced by the map
${\mathrm{pr}}^{\mathrm{St}}\circ {\mathrm{pr}}^\mathrm{FC}\colon \mathrm{FI}(V) \to {\mathrm{St}}^{\infty}(V)$.*
:::

::: proof
*Proof.* We claim that the evidently well-defined map $$\begin{align*}
\alpha \colon {\mathds{Q}}[{{\mathrm{Dec}}}_V] \otimes {\mathrm{St}}^{\infty}(V) &\longrightarrow\mathrm{FI}(V) \\
[h] \otimes {\mathrm{C}}[0:v_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_n] &\longmapsto ({\mathrm{C}}^\mathrm{FI}_h \circ s_H)({\mathrm{C}}[0:v_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_n])
\end{align*}$$ is an isomorphism. Its inverse is given by taking
$\mathrm{FI}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n]$
to
$(-1)^n [h] \otimes {\mathrm{C}}[0:v_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_n]$
where $h$ is the unique linear functional so that
$h(v_1) = \cdots = h(v_n)=1$, which is well-defined because $h$ does not
depend on the order of the $v_i$ and the Steinberg correlators satisfy
the shuffle relations. Then analogous to the proof of
[33](#lem:ch-inverse-of-symbol){reference-type="ref+label"
reference="lem:ch-inverse-of-symbol"}, when computing
$\alpha([h] \otimes {\mathrm{C}}[0:v_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_n])$
taking the projection of the symbol onto the summands where none of the
lines is contained in $H = \ker(h)$ will annihilate all terms in the
symbol of
${\mathrm{C}}[0:v_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_n]$
except $[P_1|\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}|P_n]$
with $P_i = {\mathrm{span}}(v_i)$, which $C^\mathrm{FI}_h$ maps to the
formal iterated integral
$(-1)^n \mathrm{FI}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n]$;
since formal iterated integrals satisfy the shuffle relations this is
well-defined. More generally, we have an isomorphism $$\begin{align*}
 \alpha_k \colon B_{k+1}({{\mathrm{Dec}}}_V;{\mathrm{St}}^{\infty}(V)) &\overset{\cong}\longrightarrow B_k({{\mathrm{Dec}}}_V;\mathrm{FI}(V)) \\
[h_1|\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}|h_{k+1}] \otimes {\mathrm{C}}[0:v_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_n] &\longmapsto [h_1|\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}|h_k] \otimes \alpha([h_{k+1}] \otimes {\mathrm{C}}[0:v_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_n]).
\end{align*}$$ Augmenting $B_*({{\mathrm{Dec}}}_V;\mathrm{FI}(V))$ by
$B_{-1}({{\mathrm{Dec}}}_V;\mathrm{FI}(V)) \coloneq {\mathrm{St}}^{\infty}(V)$
using the map
${\mathrm{pr}}^{\mathrm{St}}\circ {\mathrm{pr}}^\mathrm{FC}$, and
letting ${{\mathrm{Dec}}}_V$ act on ${\mathrm{St}}^{\infty}(V)$ by zero
maps, the $\alpha_k$ assemble to an isomorphism of chain complexes as we
have
$$\alpha([h_k] \otimes {\mathrm{C}}[0:v_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_n]) = D^\mathrm{FI}_{h_k}(\alpha([h_{k+1}] \otimes {\mathrm{C}}[0:v_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_n]))$$
as a consequence of the equation
${\mathrm{C}}^\mathrm{FI}_{h_k} = D^\mathrm{FI}_{h_k} {\mathrm{C}}^{\mathrm{FI}}_{h_{k+1}}$
of maps ${\mathrm{St}}^{\infty}(V) \to \mathrm{FI}(V)$. We conclude that
$B_*({{\mathrm{Dec}}}_V;\mathrm{FI}(V))$ augmented by
${\mathrm{St}}^{\infty}(V)$ is acyclic, and the result follows. ◻
:::

The following result in particular implies
[23](#prop:stl-explicit-pres){reference-type="ref+label"
reference="prop:stl-explicit-pres"}:

::: {#prop:stl-resolution .proposition}
**Proposition 84**. *We have
$$H_p({{\mathrm{Dec}}}_V;\mathrm{FC}(V)) \cong \begin{cases} {\mathrm{St}}^{\infty}(V) & \text{if $p =0$,} \\
0 & \text{otherwise,}\end{cases}$$ with isomorphism induced by the map
${\mathrm{pr}}^{\mathrm{St}}\colon \mathrm{FC}(V) \to {\mathrm{St}}^{\infty}(V)$.*
:::

::: proof
*Proof.* As
${\mathrm{pr}}^\mathrm{FC}\colon \mathrm{FI}(V) \to \mathrm{FC}(V)$ is
compatible with the ${{\mathrm{Dec}}}_V$-action, we may define $K(V)$ as
${\mathds{Q}}[{\mathrm{GL}}(V)]$-module with ${{\mathrm{Dec}}}_V$-action
through the short exact sequence
$$0 \longrightarrow K(V) \longrightarrow\mathrm{FI}(V) \overset{{\mathrm{pr}}^\mathrm{FC}}\longrightarrow\mathrm{FC}(V) \longrightarrow 0.$$
Note that each $D^\mathrm{FI}_h$ annihilates $K(V)$, and thus there is
an isomorphism of chain complexes
$B_*({{\mathrm{Dec}}}_V;K(V)) \cong B_*({{\mathrm{Dec}}}_V;{\mathds{Q}}_0) \otimes K(V)$
and the latter is acyclic by
[82](#lem:decv-q0-acyclic){reference-type="ref+label"
reference="lem:decv-q0-acyclic"}. Using the long exact sequence we
conclude that ${\mathrm{pr}}^\mathrm{FC}$ induces an isomorphism
$$H_*({{\mathrm{Dec}}}_V;\mathrm{FI}(V)) \overset{\cong}\longrightarrow H_*({{\mathrm{Dec}}}_V;\mathrm{FC}(V))$$
which is compatible with the map to ${\mathrm{St}}^{\infty}(V)$. ◻
:::

It remains to establish the quality of the terms in our resolutions of
${\mathrm{St}}^{\infty}(V)$. We will repeatedly make use of the
following fact: if $R$ is a ${\mathds{Q}}$-algebra, $M$ is a projective
$R$-module with ${\mathfrak{S}}_k$-action, and $S$ is a
finite-dimensional ${\mathds{Q}}[{\mathfrak{S}}_k]$-module, then
$M \otimes_{{\mathds{Q}}[{\mathfrak{S}}_k]} S$ is also a projective
$R$-module. To see this, use that a summand of a projective module is
projective and every ${\mathds{Q}}[{\mathfrak{S}}_k]$-module $S$ is a
summand of a free ${\mathds{Q}}[{\mathfrak{S}}_k]$-module so
$M \otimes_{{\mathds{Q}}[{\mathfrak{S}}_k]} S$ is also a summand of a
free $R$-module.

::: {#lemma: resolution is projective .lemma}
**Lemma 85**. *Each term in $B_*({{\mathrm{Dec}}}_V;\mathrm{FI}(V))$ and
$B_*({{\mathrm{Dec}}}_V;\mathrm{FC}(V))$ is a projective
${\mathds{Q}}[{\mathrm{GL}}(V)]$-module.*
:::

::: proof
*Proof.* If $V$ is of dimension $n$,
${\mathds{Q}}[{{\mathrm{Dec}}}_V]^{\otimes k} \otimes \mathrm{FI}(V)$ is
isomorphic to
$F \otimes_{{\mathds{Q}}[{\mathfrak{S}}_n]} {\mathrm{coLie}}_n$ for the
free module with basis as a ${\mathds{Q}}[{\mathrm{GL}}(V)]$-module
given by
$[h_1|\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}|h_k] \otimes [e_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},e_n]$
for nonzero functionals $h_i$ on $V$ and a fixed basis $e_1,\ldots,e_n$
of $V$, and hence is projective. Similarly,
${\mathds{Q}}[{{\mathrm{Dec}}}_V]^{\otimes k} \otimes \mathrm{FC}(V)$ is
isomorphic to
$F' \otimes_{{\mathds{Q}}[{\mathfrak{S}}_{n+1}]} {\mathrm{cycLie}}_n^{\vee}$
for the free module $F'$ with basis as a
${\mathds{Q}}[{\mathrm{GL}}(V)]$-module given by
$[h_1|\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}|h_p] \otimes [0:e_1:\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}:e_n]$
for nonzero functionals $h_i$ on $V$ and a fixed affine basis
$0,e_1,\ldots,e_n$ of $V$. ◻
:::

This tells us that the higher homology groups of ${\mathrm{GL}}(V)$
acting on the terms vanish. We will also need the following computations
of coinvariants:

::: {#lem:fi-fc-coinvariants .lemma}
**Lemma 86**. *We have that
$$\mathrm{FI}(V)_{{\mathrm{GL}}(V)} \cong \begin{cases} {\mathds{Q}} & \text{if $\dim(V) = 1$,} \\
0 & \text{else,}\end{cases} \quad \text{and} \quad \mathrm{FC}(V)_{{\mathrm{GL}}(V)} \cong \begin{cases} {\mathds{Q}} & \text{if $\dim(V) = 1$,} \\
0 & \text{else,}\end{cases}$$ and the map
$\mathrm{FI}(V)_{{\mathrm{GL}}(V)} \to \mathrm{FC}(V)_{{\mathrm{GL}}(V)}$
induced by ${\mathrm{pr}}^\mathrm{FC}$ is an isomorphism.*
:::

::: proof
*Proof.* In the case $\dim(V)=1$, it follows from the definitions that
the surjective map $\mathrm{FI}(V) \to \mathrm{FC}(V)$ is an
isomorphism, as upon picking an identification $V \cong F$,
$\mathrm{FI}(V)$ is isomorphic to ${\mathds{Q}}[F^\times]$ with standard
${\mathds{Q}}[F^\times]$-action while $\mathrm{FC}(V)$ is isomorphic to
its quotient ${\mathds{Q}}[F^\times/\{\pm 1\}]$. In the case
$\dim(V)>1$, it suffices to prove that
$\mathrm{FI}(V)_{{\mathrm{GL}}(V)} = 0$. This follows because
${\mathrm{GL}}(V)$ acts transitively on bases, implying the coinvariants
are generated by the class of
$\mathrm{FI}[e_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},e_n]$
for a fixed basis
$e_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},e_n$, and then
the shuffle relations imply that
$${n_1+n_2 \choose n_1} \mathrm{FI}[e_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},e_n] = 0 \qquad \text{for $n=n_1+n_2$ with $n_1,n_2>0$}$$
in the coinvariants, so that
$\mathrm{FI}[e_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},e_n] = 0$
since we are working over the rationals. ◻
:::

### A presentation for ${\mathscr{G}}$ {#sec:generators of G}

We use the results of the previous subsection to give a presentation for
${\mathscr{G}}$ and then make concrete how to obtain elements in it.

#### The presentation

Our starting point is the short exact sequence
$$0 \longrightarrow\mathrm{FCR}(V) \longrightarrow\mathrm{FC}(V) \overset{{\mathrm{pr}}^{\mathrm{St}}}\longrightarrow{\mathrm{St}}^{\infty}(V) \longrightarrow 0$$
defining the left term as the kernel of the map
${\mathrm{pr}}^{\mathrm{St}}$: it is simply given by elements of
$\mathrm{FC}(V)$ that represent *relations* in
${\mathrm{St}}^{\infty}(V)$. From
[85](#lemma: resolution is projective){reference-type="ref+label"
reference="lemma: resolution is projective"} we know $\mathrm{FC}(V)$ is
projective, and from
[55](#thm:bgl-critical-line-vanishing){reference-type="ref+label"
reference="thm:bgl-critical-line-vanishing"} and
[86](#lem:fi-fc-coinvariants){reference-type="ref+label"
reference="lem:fi-fc-coinvariants"} that the coinvariants of
${\mathrm{St}}^{\infty}(V)$ and $\mathrm{FC}(V)$ vanish if
$\dim(V) \neq 1$ and are isomorphic to ${\mathds{Q}}$ otherwise. Thus
the connecting homomorphism yields an isomorphism
$${\mathscr{G}}(V) \coloneq H_1({\mathrm{GL}}(V);{\mathrm{St}}^{\infty}(V)) \overset{\cong}\longrightarrow H_0({\mathrm{GL}}(V);\mathrm{FCR}(V)).$$
To understand the right side, we use that
[84](#prop:stl-resolution){reference-type="ref+label"
reference="prop:stl-resolution"} provides a resolution by projective
${\mathrm{GL}}(V)$-modules by
[85](#lemma: resolution is projective){reference-type="ref+label"
reference="lemma: resolution is projective"}
$$B_2({{\mathrm{Dec}}}_V;\mathrm{FC}(V)) \longrightarrow B_1({{\mathrm{Dec}}}_V;\mathrm{FC}(V)) \longrightarrow\mathrm{FCR}(V),$$
inducing an exact sequence
$$H_0({\mathrm{GL}}(V);B_2({{\mathrm{Dec}}}_V;\mathrm{FC}(V))) \longrightarrow H_0({\mathrm{GL}}(V);B_1({{\mathrm{Dec}}}_V;\mathrm{FC}(V))) \longrightarrow{\mathscr{G}}(V) \longrightarrow 0.$$
Spelling out the definitions, this gives a presentation for
${\mathscr{G}}(V)$: if $V$ is of dimension $n$ then it has generators
$[h] \otimes \mathrm{FC}[u_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n]$
for affine bases $u_0,\ldots,u_n$ and nonzero linear functionals $h$.
These satisfy in addition to the relations of formal correlators
[\[enum:fc-relations-i\]](#enum:fc-relations-i){reference-type="eqref"
reference="enum:fc-relations-i"}--[\[enum:fc-relations-iii\]](#enum:fc-relations-iii){reference-type="eqref"
reference="enum:fc-relations-iii"} the following two relations:

4.  []{#enum:gd-relation-iv label="enum:gd-relation-iv"} They satisfy
    the coinvariant relations
    $$[h] \otimes \mathrm{FC}[u_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n] = [g^*h] \otimes \mathrm{FC}[gu_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:gu_n] \qquad \text{for $g \in {\mathrm{GL}}(V)$}.$$

5.  []{#enum:gd-relation-v label="enum:gd-relation-v"} They satisfy the
    decomposition relations
    $$\qquad [h_2] \otimes \mathrm{FC}[u_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n]-[h_1] \otimes \mathrm{FC}[u_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n]+[h_1] \otimes D^\mathrm{FC}_{h_2}(\mathrm{FC}[u_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n])=0.$$

Let us record this:

::: {#prop:presentation for G(F) .proposition}
**Proposition 87**. *Suppose that $V$ is of dimension $n$, then there is
an isomorphism
$$\frac{{\mathds{Q}}\{[h] \otimes \mathrm{FC}[u_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n] \text{ for nonzero functionals $h$ and affine bases $u_0,\ldots,u_n$}\}}{\text{\eqref{enum:fc-relations-i}--\eqref{enum:gd-relation-v}}} \overset{\cong}\longrightarrow{\mathscr{G}}(V).$$*
:::

If $h(u_i) = x_i \in F$, we denote the image of
$[h] \otimes \mathrm{FC}[u_0:u_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}: u_n]$
by
$$\mathrm{Cor}^{\mathscr{G}}(x_0,x_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n) \in {\mathscr{G}}(V),$$
justified using
[\[enum:fc-relations-i\]](#enum:fc-relations-i){reference-type="eqref"
reference="enum:fc-relations-i"} and
[\[enum:gd-relation-iv\]](#enum:gd-relation-iv){reference-type="eqref"
reference="enum:gd-relation-iv"}, which imply that the image only
depends on the elements $x_i$.

::: remark
*Remark 88*. Using
[83](#lem:stl-fi-resolution){reference-type="ref+label"
reference="lem:stl-fi-resolution"} instead of
[84](#prop:stl-resolution){reference-type="ref+label"
reference="prop:stl-resolution"} we could have equally well given a
presentation using
$[h] \otimes \mathrm{FI}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n]$
instead.
:::

#### Projection from $\mathrm{FCR}(V)$ to $\mathscr{G}$ {#section: projection from FC to G}

We explain an explicit formula for the projection
$\mathrm{FCR}(V)\to H_0({\mathrm{GL}}(V);\mathrm{FCR}(V))$. Given $V$ of
dimension $n$ and nonzero functional $h\in V^{\vee}$, consider the map
$$\begin{align*}
 E_h\colon \mathrm{FC}(V) &\longrightarrow\mathscr{G}(V) \\
\mathrm{FC}[u_0:u_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n] &\longmapsto \mathrm{Cor}^\mathscr{G}(h(u_0),h(u_1),\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},h(u_n)).
\end{align*}$$

::: {#prop: formula for projection to coinvariants .proposition}
**Proposition 89**. *The projection
$\mathrm{FCR}(V)\longrightarrow H_0({\mathrm{GL}}(V);\mathrm{FCR}(V))\cong \mathscr{G}(V)$
coincides with the composition
$$\mathrm{FCR}(V) \overset{{\mathrm{inc}}}\longrightarrow\mathrm{FC}(V) \overset{E_h}{\longrightarrow} \mathscr{G}(V).$$*
:::

::: proof
*Proof.* Consider an element
$x= \sum_i a_i \mathrm{FC}[u_0^{(i)}:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n^{(i)}]\in  \mathrm{FCR}(V)$.
Since the decomposition operator
$D_h^{\mathrm{FC}}\colon \mathrm{FC}(V)\to \mathrm{FC}(V)$ factors
through ${\mathrm{St}}^{\infty}(V)$, it has to vanish on
$\mathrm{FCR}(V)$, so we have
$$\sum a_i D_h^{\mathrm{FC}}\left( \mathrm{FC}[u_0^{(i)}:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n^{(i)}]\right)=0.$$
Thus we can write
$$x= \sum a_i \left(\mathrm{FC}[u_0^{(i)}:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n^{(i)}]-D_h^{\mathrm{FC}}\mathrm{FC}[u_0^{(i)}:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n^{(i)}]\right).$$
As the element
$\mathrm{FC}[u_0^{(i)}:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n^{(i)}]-D_h^{\mathrm{FC}}(\mathrm{FC}[u_0^{(i)}:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n^{(i)}])\in \mathrm{FCR}(V)$
projects to
$\mathrm{Cor}^\mathscr{G}(h(u_0^{(i)}),\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}, h(u_n^{(i)}))$,
the projection of $x$ to $\mathscr{G}(V)$ equals $E_h(x)$. ◻
:::

[89](#prop: formula for projection to coinvariants){reference-type="ref+label"
reference="prop: formula for projection to coinvariants"} implies that
the value of the map $E_h$ on an element in $\mathrm{FCR}(V)$ is
independent of a nonzero linear functional $h$. This statement can be
interpreted as a functional equation in $\mathscr{G}(V)$, yielding
[2](#thm:polyl-relations-from-stl-relations){reference-type="ref+label"
reference="thm:polyl-relations-from-stl-relations"}:

Suppose that an identity
$$\sum a_i {\mathrm{C}}\bigl[u_0^{(i)}:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n^{(i)}\bigr]=0$$
for $a_i\in {\mathds{Q}}$ and affine bases $u_0^{(i)},\dots,u_n^{(i)}$
of $V$ holds in ${\mathrm{St}}^{\infty}(V)$. Then the element
$$\sum a_i \mathrm{Cor}^\mathscr{G}\Bigl(h\bigl(u_0^{(i)}\bigr),\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}, h\bigl(u_n^{(i)}\bigr)\Bigr)\in \mathscr{G}_n(V)$$
is independent of a nonzero linear functional $h$ on $V$.

### Computing the cobracket on ${\mathscr{G}}$

::: notation
**Notation 90**. For the sake of readability, we will write the direct
sum $\oplus$ as $+$ in this subsection.
:::

We will now explicitly compute the cobracket on ${\mathscr{G}}$ in terms
of the presentation from
[87](#prop:presentation for G(F)){reference-type="ref+label"
reference="prop:presentation for G(F)"}.

#### Computing the cobracket on ${\mathscr{G}}$: outline {#sec:cobracket-outline}

As we have explained in
[4.2](#sec:ek-homology){reference-type="ref+label"
reference="sec:ek-homology"}, the shifted Lie coalgebra structure on
$E_\infty$-indecomposables yields in particular a Lie coalgebra
structure on ${\mathscr{G}}$ with cobracket
$\delta \colon {\mathscr{G}} = H_1({\mathrm{GL}};{{{\mathscr{S}}{\mathrm{t}}}^\infty}) \to \Lambda^2 {\mathscr{G}}= \Lambda^2 H_1({\mathrm{GL}};{{{\mathscr{S}}{\mathrm{t}}}^\infty})$.
Recall the following is
[\[thm:polyl-presentation-cobracket\]](#thm:polyl-presentation-cobracket){reference-type="ref+label"
reference="thm:polyl-presentation-cobracket"}:

The cobracket $\delta \colon {\mathscr{G}} \to \Lambda^2 {\mathscr{G}}$
is given by the formula
$$\delta(\mathrm{Cor}^\mathscr{G}(x_0,x_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n)) = \sum_{j=0}^n \sum_{i=1}^{n-1} \mathrm{Cor}^\mathscr{G}(x_j,x_{j+1},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_{j+i}) \wedge \mathrm{Cor}^\mathscr{G}(x_j,x_{j+i+1},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_{j+n})$$
as long as $x_0,\ldots,x_n$ are all distinct.

::: remark
*Remark 91*. This is *not* the entirety of the structure induced on
${\mathscr{G}}$, as the nonvanishing of the coinvariants
$H_0({\mathrm{GL}}_1,{{{\mathscr{S}}{\mathrm{t}}}^\infty}(F^1)) \cong {\mathds{Q}}$
also yields a "$\sigma$-component"
$$\delta_\sigma \colon {\mathscr{G}}_n =  H_1({\mathrm{GL}}_n;{\mathrm{St}}^{\infty}_n) \longrightarrow H_2({\mathrm{GL}}_{n-1},{\mathrm{St}}^{\infty}_{n-1}).$$
This will be discussed in more detail in
[6](#sec:sigma-component){reference-type="ref+label"
reference="sec:sigma-component"}.
:::

Before outlining the proof, we recall that
[116](#proposition: generic correlators){reference-type="ref+label"
reference="proposition: generic correlators"} justifies that
${\mathscr{G}}_n(F)$ is generated by generic correlators, i.e. those
with $x_0,\ldots,x_n$ all distinct, so the above formula determines the
cobracket completely. We expect the same formula holds in general,
though, with the caveat that any term of the form
$\mathrm{Cor}^\mathscr{G}(x,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x)$
must be set to zero; we intend to return to this in future work. We will
explicitly state below when we use the genericity property.

To prove
[\[thm:polyl-presentation-cobracket\]](#thm:polyl-presentation-cobracket){reference-type="ref+label"
reference="thm:polyl-presentation-cobracket"}, we recall from
[69](#prop:cobracket-via-coproduct){reference-type="ref+label"
reference="prop:cobracket-via-coproduct"} the recipe for computing the
cobracket on ${\mathscr{G}}$. We start applying $\dim_!$ to the zigzag
in ${\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{D}}_{\mathds{Q}}})$
$$[{\mathrm{St}}^\infty \to 0] \longleftarrow [{\mathrm{St}}^\infty \to \Lambda^2 {\mathrm{St}}^\infty] \longrightarrow[0 \to {\mathrm{St}}^\infty \boxbackslash{\mathrm{St}}^\infty].$$
Evaluating on the vector space $F^n$, we take homology in degree $2n$:
on the left this yields $H_1({\mathrm{GL}}_n;{\mathrm{St}}^{\infty}_n)$
and on the right---after applying the Künneth theorem and discarding
terms corresponding to $\sigma$-component $\delta_\sigma$---this yields
terms
$\bigoplus_{d=0}^n H_1({\mathrm{GL}}_d;{\mathrm{St}}^{\infty}_d) \otimes H_1({\mathrm{GL}}_{n-d},{\mathrm{St}}^{\infty}_{n-d})$.
The left map is surjective, so we pick a lift and apply the right map;
after antisymmetrising we get the cobracket, which is independent of the
choice of lift.

We will perform this computation in the 1-category
${\mathrm{Ch}}_{\mathds{Q}}$ of rational chain complexes, by resolving
the zigzag by maps of chain complexes of
${\mathds{Q}}[{\mathrm{GL}}(V)]$-modules which have sufficient vanishing
properties to reduce a computation on $H_1$ to a computation on $H_0$.
More precisely, we will construct chain complexes $A_*$
[\[eqn:res-cobracket-i\]](#eqn:res-cobracket-i){reference-type="eqref"
reference="eqn:res-cobracket-i"}, $B_*$
[\[eqn:res-cobracket-ii\]](#eqn:res-cobracket-ii){reference-type="eqref"
reference="eqn:res-cobracket-ii"}, $C_*$
[\[eqn:res-cobracket-iii\]](#eqn:res-cobracket-iii){reference-type="eqref"
reference="eqn:res-cobracket-iii"}, and maps of chain complexes fitting
in a commutative diagram
$$\begin{tikzcd} A_* \rar{\simeq} & {[{\mathrm{St}}^{\infty}(V) \to 0]} \\[-5pt]
B_* \rar{\simeq} \uar \dar & {[{\mathrm{St}}^{\infty}(V) \to (\Lambda^2 {\mathrm{St}}^{\infty})(V)]} \uar \dar \\[-5pt]
C_* \rar{\simeq} \dar & {[0 \to ({\mathrm{St}}^{\infty}\boxbackslash{\mathrm{St}}^{\infty})(V)]} \\[-5pt]
(\mathrm{FCR}\boxbackslash\mathrm{FCR})(V), \end{tikzcd}$$ whose
horizontal maps are quasi-isomorphisms so induce an isomorphism on
$H_*({\mathrm{GL}}(V);-)$ for all $* \geq 0$. We also understand the
effect of the left-bottom zig-zag on $H_*({\mathrm{GL}}(V);-)$.

The main work will lie in the following:

(a) []{#enum:technical-cobracket-i label="enum:technical-cobracket-i"}
    The construction of $B_*$ will amount to prescribing relations that
    give a reason that $B_1({{\mathrm{Dec}}}_V;\mathrm{FI}(V))$ maps to
    zero in $(\Lambda^2 {\mathrm{St}}^{\infty})(V)$.

(b) []{#enum:technical-cobracket-ii label="enum:technical-cobracket-ii"}
    The explicit evaluation of the map $B_* \to C_*$ will amount to a
    vanishing result along the lines of
    [76](#lem:fc-cobracket-symmetry){reference-type="ref+label"
    reference="lem:fc-cobracket-symmetry"}.

#### The cyclic coaction {#sec:cyclic-coaction}

We start by writing the cyclic cobracket as a sum of the deconcatenation
cobracket and a correction term that captures the remaining terms; the
*cyclic coaction*. The latter is given by letting the first index start
at $j=1$ rather than $j=0$ in
[24](#prop:stl-explicit-cobracket){reference-type="ref+label"
reference="prop:stl-explicit-cobracket"}, and interpreting the unique
term containing the entry $u_0 = 0$ as a formal iterated integral,
moving it to the front with an appropriate sign if necessary:

::: definition
**Definition 92**. The *cyclic coaction*
$\delta_{\mathrm{coact}} \colon {\mathrm{FI}} \to {\mathrm{FI}} \otimes {\mathrm{FC}}$
is given by the formula $$\begin{align*}
\delta_{\mathrm{coact}}&(\mathrm{FI}[v_1,\ldots,v_n])
\\
=&
\sum_{j=1}^{n}\ \ \: \sum_{i=1}^{n-j}
(-1)^{i+1}
\mathrm{FI}[v_1,\ldots,v_j,v_{j+i+1},\ldots,v_n]
\otimes
\mathrm{FC}[v_j:\cdots:v_{j+i}]\\
+&
\sum_{j=1}^{n}\sum_{i=n+1-j}^{n-1}
(-1)^{n-i}
\mathrm{FI}[v_1,\ldots,v_{j+i-n-1},v_j,\ldots,v_n]
\otimes
\mathrm{FC}[v_j:v_{j+i+1}:\cdots:v_{j+n}].
\end{align*}$$ where $v_0$ is put to be $0$ and the indices are to be
interpreted cyclically.
:::

We need to justify the well-definedness of $\delta_{\mathrm{coact}}$,
and though we will not need it, will also make precise some of its
properties; this can be done by direct computation but we opt to take an
approach along the lines of
[\[rem:delta-cyc-from-sder,rem:delta-dec-from-sder\]](#rem:delta-cyc-from-sder,rem:delta-dec-from-sder){reference-type="ref+label"
reference="rem:delta-cyc-from-sder,rem:delta-dec-from-sder"}. In the
following, we consider exterior powers as subsets of tensor powers via
$x \wedge y \mapsto \frac{1}{2}(x \otimes y - y \otimes x)$.

::: lemma
**Lemma 93**. *The map $\delta_{\mathrm{coact}}$ is well-defined and has
the property that the following diagrams commute
$$\begin{tikzcd} \mathrm{FI}\rar{\delta_{\mathrm{dec}}} \dar{\delta_{\mathrm{coact}}} &[20pt] \mathrm{FI}\otimes \mathrm{FI}\dar{({\mathrm{id}}\otimes \sigma) \circ (\delta_{\mathrm{coact}} \otimes {\mathrm{id}}) + {\mathrm{id}}\otimes \delta_{\mathrm{coact}}}\\[-5pt]
\mathrm{FI}\otimes \mathrm{FC}\rar{\delta_{\mathrm{dec}} \otimes {\mathrm{id}}} & \mathrm{FI}\otimes \mathrm{FI}\otimes \mathrm{FC}, \\[-5pt]
\mathrm{FI}\rar{\delta_{\mathrm{coact}}} \dar{\delta_{\mathrm{coact}}} &[20pt] \mathrm{FI}\otimes \mathrm{FC}\dar{({\mathrm{id}}-\sigma \otimes {\mathrm{id}}) \circ (\delta_{\mathrm{coact}} \otimes {\mathrm{id}})} \\[-5pt]
\mathrm{FI}\otimes \mathrm{FC}\rar{{\mathrm{id}}\otimes \delta_{\mathrm{cyc}}} & \mathrm{FI}\otimes \mathrm{FC}\otimes \mathrm{FC}.
\end{tikzcd}$$*
:::

::: proof
*Proof.* It suffices to verify this on a generator
$\mathrm{FI}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n]$.
As we need to prove certain equations hold, it suffices to do this after
applying the functor that sums up the values at all vector spaces. We
now refer to
[3.2](#sec:lie-alg-trees-derivations){reference-type="ref+label"
reference="sec:lie-alg-trees-derivations"} for the Lie coalgebras
${\mathfrak{sder}}_S^\vee$ and ${\mathfrak{lie}}_S^\vee$ for $S = [n]$.
Upon identifying
$\mathrm{FI}[v_{i_1},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_{i_j}]$
for $\{i_1,\ldots,i_j\} \subseteq {\underline{n}}$ with the element
${\mathrm{LI}}[X_{i_1},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},X_{i_j}]$
of ${\mathfrak{lie}}_S^\vee$ and
$\mathrm{FC}[0:v_{j_1}:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_{j_k}]$
with the element
${\mathrm{LC}}[X_0:X_{j_1}:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:X_{j_k}]$,
we see that $\delta_{\mathrm{cyc}}$ and $\delta_{\mathrm{dec}}$ are
given by the same formulas. Moreover, in this setting
$\delta_{\mathrm{coact}}$ admits an interpretation as the coaction of
${\mathfrak{sder}}_S^\vee$ on ${\mathfrak{lie}}_S^\vee$ that is dual to
the action of the special derivations ${\mathfrak{sder}}_S$ on the free
Lie algebra ${\mathfrak{lie}}_S$. This implies the statement, as this
action is well-defined and the diagrams in the statement of the lemma
are dual to those saying it is an action. ◻
:::

The following is a direct consequence of the definitions, where we
recall that
$\smash{{\mathrm{pr}}^\mathrm{FC}} \colon \mathrm{FI}\to \mathrm{FC}$
was defined in
[\[eqn:qfi-to-fc\]](#eqn:qfi-to-fc){reference-type="eqref"
reference="eqn:qfi-to-fc"} and
${\mathrm{alt}}\colon \mathrm{FC}\otimes \mathrm{FC}\to \Lambda^2 \mathrm{FC}$
is given by $x \otimes y \mapsto x \wedge y$.

::: {#lem:coact-correction .lemma}
**Lemma 94**. *There is an equation of maps
$\mathrm{FI}\to \Lambda^2 \mathrm{FC}$
$$\delta_{\mathrm{cyc}} \circ {\mathrm{pr}}^\mathrm{FC}- \Lambda^2 {\mathrm{pr}}^\mathrm{FC}\circ \delta_{\mathrm{dec}} = {\mathrm{alt}}\circ ({\mathrm{pr}}^\mathrm{FC}\otimes {\mathrm{id}}) \circ \delta_{\mathrm{coact}}.$$*
:::

Recall that the map ${\mathrm{C}}^\mathrm{FC}_h$ admits a further lift
to a map
${\mathrm{C}}^\mathrm{FI}_h \colon ({\mathrm{B}}^{\mathrm{Com}} {{\mathscr{S}}{\mathrm{t}}})^H_n(V) \to \mathrm{FI}(V)$,
with associated decomposition operator
$D^\mathrm{FI}_h = ({\mathrm{C}}^\mathrm{FI}_h \circ s_H \circ {\mathrm{pr}}^{\mathrm{St}}\circ {\mathrm{pr}}^\mathrm{FC}) \colon \mathrm{FI}(V) \to \mathrm{FI}(V)$,
which satisfies
$$D^\mathrm{FI}_{h_1} \circ D^\mathrm{FI}_{h_2} = D^\mathrm{FI}_{h_1} \quad \text{and} \quad {\mathrm{pr}}^\mathrm{FC}\circ D^\mathrm{FI}_h = D^\mathrm{FC}_h \circ {\mathrm{pr}}^\mathrm{FC}.$$
There is a more subtle compatibility between the decomposition operators
and cobrackets:

::: {#lem:cyc-dec-h .lemma}
**Lemma 95**. *Given nonzero linear functional $h \in V^\vee$, there is
an equation of maps $\mathrm{FI}(V) \to \Lambda^2 \mathrm{FC}(V)$
$$\Lambda^2 {\mathrm{pr}}^\mathrm{FC}\circ \delta_{\mathrm{dec}} \circ D_h^{\mathrm{FI}} = \Lambda^2 D_h^\mathrm{FC}\circ \delta_{\mathrm{cyc}} \circ {\mathrm{pr}}^\mathrm{FC}$$
where $D_h^{\mathrm{FC}} \colon \mathrm{FC}(U) \to \mathrm{FC}(U)$ for
$U \subseteq V$ is defined to be $0$ if $U \subseteq \ker(h)$ and
$D_{h|_U}^{\mathrm{FC}}$ otherwise.*
:::

::: proof
*Proof.* Writing $H = \ker(h)$, consider the following diagram
$$\hspace{-.15cm}\begin{tikzcd} \mathrm{FC}(V) \rar{{\mathrm{pr}}^{\mathrm{St}}} \dar{\delta_{\mathrm{cyc}}} &[-7pt] {\mathrm{St}}^{\infty}(V) \rar{s} \dar{\delta} &[-6pt] ({\mathrm{B}}^{{\mathrm{Com}}} {{\mathscr{S}}{\mathrm{t}}})_n(V) \rar{\pi_H} &[-5pt] ({\mathrm{B}}^{{\mathrm{Com}}} {{\mathscr{S}}{\mathrm{t}}})^H_n(V) \rar{C_h^{\mathrm{FI}}} &[-5pt] \mathrm{FI}(V) \dar{\delta_{\mathrm{dec}}} \\
(\Lambda^2 \mathrm{FC})(V) \rar{\Lambda^2 {\mathrm{pr}}^{\mathrm{St}}} & (\Lambda^2 {\mathrm{St}}^{\infty})(V) \rar{\Lambda^2 s} & (\Lambda^2 {\mathrm{B}}^{{\mathrm{Com}}} {{\mathscr{S}}{\mathrm{t}}})_n(V) \rar{\Lambda^2 \pi_H} & (\Lambda^2 {\mathrm{B}}^{{\mathrm{Com}}} {{\mathscr{S}}{\mathrm{t}}})^H_n(V) \rar{\Lambda^2 {\mathrm{C}}^\mathrm{FI}_h} & (\Lambda^2 \mathrm{FI})(V),\end{tikzcd}$$
where the map $\Lambda^2 \pi_H$ on the bottom-right needs some further
explanation as $H$ may not be a subspace of a summand of $V$: its domain
$(\Lambda^2 {\mathrm{B}}^{{\mathrm{Com}}} {{\mathscr{S}}{\mathrm{t}}})_n(V)$
is a direct sum indexed by an (unordered) pair of sets
$\{P_1,\ldots,P_i\}$ and $\{P_{i+1},\ldots,P_n\}$ of lines
$P_1,\ldots,P_n \subseteq V$ and we define $\Lambda^2 \pi_H$ as
projection onto the summand
$(\Lambda^2 {\mathrm{B}}^{{\mathrm{Com}}} {{\mathscr{S}}{\mathrm{t}}})^H_n(V)$
of those terms where none of these lines are contained in $H$.

Given this definition, the maps in the statement of this lemma are
obtained by taking the top-right and bottom-left composites in the
diagram, precomposing with ${\mathrm{pr}}^\mathrm{FC}$, and
postcomposing with $\Lambda^2 {\mathrm{pr}}^\mathrm{FC}$. It hence
suffices to prove that this diagram commutes.

The left square commutes because
${\mathrm{pr}}^{\mathrm{St}}\colon \mathrm{FC}\to {{{\mathscr{S}}{\mathrm{t}}}^\infty}$
is a map of Lie coalgebras. For the right square, we use that
${\mathrm{St}}^\infty(V)$ is generated by
${\mathrm{C}}[0:v_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_n]$
where $h(v_1) = \cdots = h(v_n) = 1$. We first compute the value of
top-right composition on such a
${\mathrm{C}}[0:v_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_n]$.
As in the proof of
[33](#lem:ch-inverse-of-symbol){reference-type="ref+label"
reference="lem:ch-inverse-of-symbol"} the latter condition implies that
$\smash{{\mathrm{C}}^\mathrm{FI}_h} \circ \pi_H \circ s$ sends this to
$(-1)^n\mathrm{FI}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n]$
and in turn $\delta_{\mathrm{dec}}$ sends this to
$(-1)^n\smash{\sum_{i=1}^{n-1}}\mathrm{FI}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_i] \wedge \mathrm{FI}[v_{i+1},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n]$.

To see the right square commutes, we next compute the value of the
left-bottom composition on
${\mathrm{C}}[0:v_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_n]$
and start with the terms in the formula for $\delta$ where $j > 0$. All
of these terms are concentrated on pairs of subspaces $\{V_I,V_J\}$
where at least one $V_J$ is contained in $H$ and hence are annihilated
by $\Lambda^2 \pi_H$. It remains to consider the terms in the formula
$\delta$ where $j = 0$, given by
$\sum_{i=1}^{n-1} {\mathrm{C}}[0:v_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_i] \wedge {\mathrm{C}}[0:v_{i+1}:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_n]$
concentrated at pairs of subspaces $\{V_I,V_J\}$ both not contained in
$H$ and arguing as above
$\Lambda^2 {\mathrm{C}}^\mathrm{FI}_h \circ \Lambda^2 \pi_H \circ \Lambda^2 s$
sends this to
$\smash{\sum_{i=1}^{n-1}} (-1)^i \mathrm{FI}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_i] \wedge (-1)^{n-i} \mathrm{FI}[v_{i+1},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n]$.
We conclude the square commutes. ◻
:::

#### Choosing relations {#sec:cobracket-choosing-relations}

We now make precise the first of the technical inputs,
[\[enum:technical-cobracket-i\]](#enum:technical-cobracket-i){reference-type="eqref"
reference="enum:technical-cobracket-i"}, by constructing a dashed map
$$\begin{equation}
\label{eqn:choosing-relations-diag}\begin{tikzcd} B_1({{\mathrm{Dec}}}_V;{\mathrm{FI}}(V)) \rar \dar[dashed]{\rho} & \mathrm{FI}(V)  \dar{\delta_{\mathrm{cyc}} \circ {\mathrm{pr}}^\mathrm{FC}} \\
(\mathrm{FCR}\otimes \mathrm{FC}+\mathrm{FC}\otimes \mathrm{FCR})(V) \rar & (\Lambda^2\mathrm{FC})(V)  \end{tikzcd}
\end{equation}$$ making the diagram commute, where the top map is part
of the resolution in
[83](#lem:stl-fi-resolution){reference-type="ref+label"
reference="lem:stl-fi-resolution"} and the bottom map is induced by the
inclusion $\mathrm{FCR}(V) \to {\mathrm{FC}}(V)$ followed by
anti-symmetrising. When restricted to generic pairs
$[h] \otimes \mathrm{FI}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n]$,
i.e. those where $h(v_1),\ldots,h(v_n)$ are all distinct and nonzero, it
will have the following two properties:

(i) $\rho$ is a difference of two terms $\rho^{\mathrm{cyc}}$ and
    $\rho^{\mathrm{coact}}$,

(ii) one of the components of $\rho^{\mathrm{coact}}$ under the map
     $$\zeta^{\mathrm{alt}}\circ {\mathrm{alt}}\colon (\mathrm{FCR}\otimes \mathrm{FC}+\mathrm{FC}\otimes \mathrm{FCR})(V) \longrightarrow(\mathrm{FCR}\boxbackslash\mathrm{FC}+\mathrm{FC}\boxbackslash\mathrm{FCR})(V)$$
     defined in [5.3.7](#sec:map-b-to-c){reference-type="ref+label"
     reference="sec:map-b-to-c"}, vanishes.

We will not attempt to specify the value of $\rho$ on nongeneric pairs
$[h] \otimes \mathrm{FI}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n]$:
there is a direct sum decomposition
$$B_1({{\mathrm{Dec}}}_V;{\mathrm{FI}}(V)) \cong  B_1({{\mathrm{Dec}}}_V;{\mathrm{FI}}(V))^{\mathrm{gen}}+B_1({{\mathrm{Dec}}}_V;{\mathrm{FI}}(V))^{\mathrm{nongen}}$$
into the subspace spanned by generic pairs and the subspace spanned by
nongeneric pairs. We will define $\rho$ explicitly on the first term. On
the second term we merely prove $\rho$ exists making
[\[eqn:choosing-relations-diag\]](#eqn:choosing-relations-diag){reference-type="eqref"
reference="eqn:choosing-relations-diag"} commute, using that (a) by the
proof of
[85](#lemma: resolution is projective){reference-type="ref+label"
reference="lemma: resolution is projective"},
$B_1({{\mathrm{Dec}}}_V;{\mathrm{FI}}(V))^{\mathrm{nongen}}$ spanned by
nongeneric pairs is projective, and (b) we know that the composition
$B_1({{\mathrm{Dec}}}_V;{\mathrm{FI}}(V)) \to \mathrm{FI}(V) \to (\Lambda^2 \mathrm{FC})(V) \to (\Lambda^2 {\mathrm{St}}^{\infty})(V)$
vanishes.

The top-left corner of
[\[eqn:choosing-relations-diag\]](#eqn:choosing-relations-diag){reference-type="eqref"
reference="eqn:choosing-relations-diag"} is spanned by pairs
$[h] \otimes \mathrm{FI}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n]$,
which get sent by the top horizontal map to
$({\mathrm{id}}-D_h^{\mathrm{FI}})(\mathrm{FI}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n]) \in \mathrm{FI}(V)$.
When we apply the right vertical map
$\delta_{\mathrm{cyc}} \circ {\mathrm{pr}}^\mathrm{FC}$ to this, by
[\[lem:coact-correction,lem:cyc-dec-h\]](#lem:coact-correction,lem:cyc-dec-h){reference-type="ref+label"
reference="lem:coact-correction,lem:cyc-dec-h"} we get a sum of two
terms
$$\delta_{\mathrm{cyc}} \circ {\mathrm{pr}}^\mathrm{FC}\circ ({\mathrm{id}}-D_h^{\mathrm{FI}}) = \delta^{\mathrm{cyc}}_h-\delta^{\mathrm{coact}}_h, \qquad \text{with} \qquad
\begin{aligned}&\delta^{\mathrm{cyc}}_h \coloneq ({\mathrm{id}}-\Lambda^2 D_h) \circ \delta_{\mathrm{cyc}} \circ {\mathrm{pr}}^\mathrm{FC}\\
&\delta^{\mathrm{coact}}_h \coloneq \overline{\delta}_{\mathrm{coact}} \circ D^{\mathrm{FI}}_h\end{aligned}$$
where we abbreviate
$${\overline{\delta}}_{\mathrm{coact}} \coloneq {\mathrm{alt}}\circ ({\mathrm{pr}}^\mathrm{FC}\otimes {\mathrm{id}}) \circ \delta_{\mathrm{coact}} \qquad \text{and} \qquad D_h \coloneqq D^\mathrm{FC}_h.$$
We will find an explicit lift of
$\delta^{\mathrm{cyc}}_h(\mathrm{FI}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n])$
to the bottom-left term, and then use this to prove the existence of a
nonexplicit lift of
$\delta^{\mathrm{coact}}_h(\mathrm{FI}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n])$
with certain properties.

#### Choosing relations for the "cyclic cobracket" term

Assume that
$[h] \otimes \mathrm{FI}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n]$
is generic. We start with the construction of the explicit lift of
$\delta^{\mathrm{cyc}}_h(\mathrm{FI}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n])$,
viewing $\Lambda^2 \mathrm{FC}$ as a summand of
$\mathrm{FC}\otimes \mathrm{FC}$ so that ${\mathrm{id}}- \Lambda^2 D_h$
is the restriction of
${\mathrm{id}}\otimes {\mathrm{id}}-D_h \otimes D_h$. Here the meaning
of $D_h$ is as in [95](#lem:cyc-dec-h){reference-type="ref+label"
reference="lem:cyc-dec-h"}:
$D_h \colon \mathrm{FC}(U) \to \mathrm{FC}(U)$ for $U \subseteq V$ is
defined to be $0$ if $U \subseteq \ker(h)$ and $D_{h|_U}^{\mathrm{FC}}$
otherwise; in the generic case one only encounters the latter.

We can write this as
$${\mathrm{id}}\otimes {\mathrm{id}}- D_h \otimes D_h =  {\mathrm{id}}\otimes ({\mathrm{id}}- D_h) + ({\mathrm{id}}- D_h) \otimes {\mathrm{id}}-(D_h - {\mathrm{id}}) \otimes (D_h -{\mathrm{id}}).$$
When restricting to generic pairs, there are then lifts of the right
terms to $\mathrm{FC}\otimes \mathrm{FCR}$,
$\mathrm{FCR}\otimes \mathrm{FC}$, and $\mathrm{FCR}\otimes \mathrm{FC}$
respectively (note that we have made a choice in the last term):

::: {#def:rho-cyc .definition}
**Definition 96**. The element
$\rho^{\mathrm{cyc}}([h] \otimes \mathrm{FI}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n]) \in (\mathrm{FCR}\otimes \mathrm{FC}+\mathrm{FC}\otimes \mathrm{FCR})(V)$
is defined as follows. Write
$x = (\delta_{\mathrm{cyc}} \circ {\mathrm{pr}}^\mathrm{FC})(\mathrm{FI}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n])$,
and take the sum of terms
$$({\mathrm{id}}\otimes [{\mathrm{id}}- D_h])(x)+([{\mathrm{id}}- D_h] \otimes {\mathrm{id}})(x)-([D_h - {\mathrm{id}}] \otimes (D_h -{\mathrm{id}}))(x),$$
where the square brackets indicate an element is to be considered as a
relation.
:::

Note we crucially use that
$[h] \otimes \mathrm{FI}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n]$
is generic: if not, on some terms ${\mathrm{id}}-D_h$ (or
$D_h - {\mathrm{id}}$) could equal ${\mathrm{id}}$ (or $-{\mathrm{id}}$)
and would not give a relation.

#### Choosing relations for the "coaction" term

Assume still that
$[h] \otimes \mathrm{FI}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n]$
is generic. For the nonexplicit lift of
$\delta^{\mathrm{coact}}_h(\mathrm{FI}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n])$,
we start by recalling that the map
${\mathrm{pr}}^{\mathrm{St}}\colon \mathrm{FC}\to {{{\mathscr{S}}{\mathrm{t}}}^\infty}$
is one of Lie coalgebras, and hence
$\delta_{\mathrm{cyc}} \circ {\mathrm{pr}}^\mathrm{FC}\circ ({\mathrm{id}}- D_h^{\mathrm{FI}})$
maps
$\mathrm{FI}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n]$
to zero in $(\Lambda^2 {{{\mathscr{S}}{\mathrm{t}}}^\infty})(V)$. The
element
$\delta^{\mathrm{cyc}}_h(\mathrm{FI}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n])$
also maps to zero in
$(\Lambda^2 {{{\mathscr{S}}{\mathrm{t}}}^\infty})(V)$ since it admits a
lift to
$(\mathrm{FCR}\otimes \mathrm{FC}+\mathrm{FC}\otimes \mathrm{FCR})(V)$,
namely as in [96](#def:rho-cyc){reference-type="ref+label"
reference="def:rho-cyc"}.

Thus we must have that the same is true for the remaining terms:
$$\begin{equation}
\label{eqn:coact-lift-1} \text{$\delta^{\mathrm{coact}}_h(\mathrm{FI}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n]) \in (\Lambda^2 \mathrm{FC})(V)$ maps to zero in $(\Lambda^2 {{{\mathscr{S}}{\mathrm{t}}}^\infty})(V)$.}
\end{equation}$$ We next separate the different components of
$\delta^{\mathrm{coact}}_h(\mathrm{FI}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n])$.
To do so, recall a nonzero linear functional $h$ is fixed and write
$v_0 \coloneq 0$, $H = \ker(h) \subset V$.

::: lemma
**Lemma 97**. *The element
$$(\overline{\delta}_{\mathrm{coact}} \circ D_h^{\mathrm{FI}})(\mathrm{FI}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n])$$
is supported in the summands of $(\Lambda^2 \mathrm{FC})(V)$ indexed by
$\{V_1,V_2\}$ where $V_1 \not \subseteq H$ and $V_2 \subseteq H$.*
:::

::: proof
*Proof.* By the iterative formula
[\[eqn:symbol-iterated-integral\]](#eqn:symbol-iterated-integral){reference-type="eqref"
reference="eqn:symbol-iterated-integral"} for the symbol,
$D^{\mathrm{FI}}_h(\mathrm{FI}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n])$
is a sum of terms
$\mathrm{FI}[w_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},w_n]$
for bases $w_1,\ldots,w_n$ where each $w_i$ is of the form
$\frac{v_i-v_j}{h_i-h_j}$ for $v_i-v_j \not \in \ker(h)$. The coaction
is given by taking only certain terms of
$\delta_{\mathrm{cyc}}(\mathrm{FC}[0:w_1:\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}:w_n])$,
e.g. in $$\begin{tikzpicture}
   \draw (0:1) \foreach \x in {60,120,...,360} {  -- (\x:1) };
   \foreach \x/\l/\p in
     { 60/{$w_2$}/above,
      120/{$w_1$}/above,
      180/{$0$}/left,
      240/{$w_5$}/below,
      300/{$w_4$}/below,
      360/{$w_3$}/right
     }
     \node[inner sep=1pt,circle,draw,fill,label={\p:\l}] at (\x:1) {};
\end{tikzpicture}$$ we cut along lines that do *not* pass through zero.
The component containing the $0$th vertex will lie in a term $V_1$
spanned by $w_i$ and since each of these is not contained in $H$, we
have $V_1 \not \subseteq H$. The component not containing the $0$th
vertex lies in a term $V_2$ spanned by $w_i-w_j$ and since each of these
lies in $H$ as $h(w_i) = 1 = h(w_j)$, we have $V_2 \subseteq H$. ◻
:::

We now recall that if a subspace $V_1 \not \subseteq H$ of $V$ is of
dimension $d \leq n$ then the map
${\mathrm{St}}^{\infty}(V_1) \to (B^{\mathrm{Com}} {{\mathscr{S}}{\mathrm{t}}})_d^H(V_1)$
(the target is as in the proof of
[95](#lem:cyc-dec-h){reference-type="ref+label"
reference="lem:cyc-dec-h"}) is an isomorphism with inverse
${\mathrm{C}}^{\mathrm{St}}_h$ given by sending
$[P_1|\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}|P_d]$ to the
Steinberg correlator
${\mathrm{C}}[0:v_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_d]$
where $v_i \in P_i$ is the unique vector so that $h(v_i) = 1$. In
particular, such
${\mathrm{C}}[0:v_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_d]$
almost form a basis of ${\mathrm{St}}^{\infty}(V_1)$; the only relations
between them are the shuffle relations. We will refer to these as well
as the formal correlators
${\mathrm{FC}}[0:v_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_d]$
that map to them, as *basic*. The crucial observation---a direct
consequence of this discussion---is $$\begin{equation}
\label{eqn:coact-lift-2}\text{independent basic formal correlators in $\mathrm{FC}(V_1)$ remain independent in ${\mathrm{St}}^{\infty}(V_1)$.}
\end{equation}$$

In the previous lemma, the terms supported at $\{V_1,V_2\}$ where
$V_1 \not \subseteq H$ and $V_2 \subseteq H$ are linear combinations of
elements of the form
${\mathrm{FC}}[0:v_1,\ldots,v_d] \otimes {\mathrm{FC}}[v'_1:\ldots:v'_{n-d}]$
where the first term is basic. Using facts
[\[eqn:coact-lift-1\]](#eqn:coact-lift-1){reference-type="eqref"
reference="eqn:coact-lift-1"} and
[\[eqn:coact-lift-2\]](#eqn:coact-lift-2){reference-type="eqref"
reference="eqn:coact-lift-2"}, we can thus express the component of
$\delta^{\mathrm{coact}}_h(\mathrm{FI}[v_1,\ldots,v_d])$ in the term
indexed by $\{U,W\}$, where we must have $U \not \subseteq H$ and
$W \subseteq H$ by the above lemma, as
$\sum_\alpha r_\alpha^{U,W} \otimes x_\alpha^U$ where the
$r_\alpha^{U,W}$ are in $\mathrm{FCR}(W)$ and the
$x_\alpha^U \in \mathrm{FC}(U)$ are basic. Doing this for all components
we obtain the desired choice of lift:

::: {#def:rho-coact .definition}
**Definition 98**. The element
$\rho^{\mathrm{coact}}([h] \otimes \mathrm{FI}[v_1,\ldots,v_n]) \in (\mathrm{FCR}\otimes \mathrm{FC})(V) \subset (\mathrm{FCR}\otimes \mathrm{FC}+\mathrm{FC}\otimes \mathrm{FCR})(V)$
is defined as follows. Write
$x = \delta^{\mathrm{coact}}_h(\mathrm{FI}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n])$
and express it as
$$\sum_{W,U} \sum_\alpha [r_\alpha^{U,W}] \otimes x_\alpha^U,$$ where
the square brackets indicate an element is to be considered as a
relation.
:::

Finally, we define $\rho$ as $$\begin{align*}
\rho \colon B_1({{\mathrm{Dec}}}_V;{\mathrm{St}}^{\infty}(V)) &\longrightarrow(\mathrm{FCR}\otimes \mathrm{FC}+\mathrm{FC}\otimes \mathrm{FCR})(V)\\
[h] \otimes \mathrm{FI}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n] &\longmapsto \begin{cases} (\rho^{\mathrm{cyc}} - \rho^{\mathrm{coact}})([h] \otimes \mathrm{FI}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n]) & \text{if the pair is generic,} \\
\text{some unspecified choice} & \text{else,}\end{cases}
\end{align*}$$ where the second case is justified in
[5.3.3](#sec:cobracket-choosing-relations){reference-type="ref+label"
reference="sec:cobracket-choosing-relations"}.

::: {#exam:rho-coact .example}
*Example 99*. Let us compute $\rho^{\mathrm{coact}}$ on
$\mathrm{FI}[v_1,v_2]$ with $v_1,v_2 \notin H = \ker(h)$. By the proof
of [123](#prop: G_2=B_2){reference-type="ref+label"
reference="prop: G_2=B_2"} we have that
$D^\mathrm{FI}_h(\mathrm{FI}[v_1,v_2])$ is given by
$$\mathrm{FI}[\tfrac{v_1}{h_1},\tfrac{v_2}{h_2}]-\mathrm{FI}[\tfrac{v_1}{h_1},\tfrac{v_{2}-v_1}{h_2-h_1}]+\mathrm{FI}[\tfrac{v_2}{h_2},\tfrac{v_{2}-v_{1}}{h_2-h_1}].$$
The map ${\overline{\delta}}_{\mathrm{coact}}$ sends this to
$$\begin{align*}
&-\mathrm{FC}[0:\tfrac{v_1}{h_1}]\wedge \mathrm{FC}[\tfrac{v_1}{h_1}:\tfrac{v_2}{h_2}]+\mathrm{FC}[0:\tfrac{v_2}{h_2}]\wedge \mathrm{FC}[\tfrac{v_1}{h_1}:\tfrac{v_2}{h_2}]\\
&+\mathrm{FC}[0:\tfrac{v_1}{h_1}]\wedge \mathrm{FC}[\tfrac{v_1}{h_1}:\tfrac{v_{2}-v_1}{h_2-h_1}]-\mathrm{FC}[0:\tfrac{v_{2}-v_1}{h_2-h_1}]\wedge \mathrm{FC}[\tfrac{v_1}{h_1}:\tfrac{v_{2}-v_1}{h_2-h_1}]\\
&-\mathrm{FC}[0:\tfrac{v_2}{h_2}] \wedge \mathrm{FC}[\tfrac{v_2}{h_2}:\tfrac{v_{2}-v_{1}}{h_2-h_1}]+\mathrm{FC}[0:\tfrac{v_{2}-v_{1}}{h_2-h_1}] \wedge \mathrm{FC}[\tfrac{v_2}{h_2}:\tfrac{v_{2}-v_{1}}{h_2-h_1}]
\end{align*}$$ where all of the first terms in the wedge products are
supported at a $U \not \subseteq H$ and the second terms at $H$. We can
collect the second terms as relations, in this case rather easily
because ${\mathrm{St}}^{\infty}(V) \cong {\mathds{Q}}$ if $V$ is
1-dimensional. Denoting these first in square brackets and then
tensoring them with basic elements second, we get that
$\rho^{\mathrm{coact}}(\mathrm{FI}[v_1,v_2]) \in (\mathrm{FCR}\otimes \mathrm{FC})(V)$
is given by $$\begin{align*}
&\big[\mathrm{FC}[\tfrac{v_1}{h_1},\tfrac{v_2}{h_2}]-\mathrm{FC}[\tfrac{v_1}{h_1}:\tfrac{v_{2}-v_1}{h_2-h_1}]\big] \otimes \mathrm{FC}[0:\tfrac{v_1}{h_1}] \\
&+\big[\mathrm{FC}[\tfrac{v_2}{h_2}:\tfrac{v_{2}-v_{1}}{h_2-h_1}]-\mathrm{FC}[\tfrac{v_1}{h_1}:\tfrac{v_2}{h_2}]\big] \otimes \mathrm{FC}[0:\tfrac{v_2}{h_2}] \\
&+\big[\mathrm{FC}[\tfrac{v_1}{h_1}:\tfrac{v_{2}-v_1}{h_2-h_1}]-\mathrm{FC}[\tfrac{v_2}{h_2}:\tfrac{v_{2}-v_{1}}{h_2-h_1}]\big] \otimes \mathrm{FC}[0:\tfrac{v_{2}-v_1}{h_2-h_1}].
\end{align*}$$
:::

#### The map $B_* \to A_*$

In this subsection we define the chain complexes that are partial
resolutions of the first two chain complexes that appear in the
computation of the cobracket
$$A_* \longrightarrow[{\mathrm{St}}^{\infty}(V) \to 0] \qquad \text{and} \qquad B_* \longrightarrow[{\mathrm{St}}^{\infty}(V) \to (\Lambda^2 {{{\mathscr{S}}{\mathrm{t}}}^\infty})(V)]$$
and construct a map from the latter to the former.

We first construct $A_*$. Recall we have the exact sequence
$$\cdots \longrightarrow B_2({{\mathrm{Dec}}}_V;\mathrm{FI}(V)) \longrightarrow B_1({{\mathrm{Dec}}}_V;\mathrm{FI}(V)) \longrightarrow\mathrm{FI}(V) \longrightarrow{\mathrm{St}}^{\infty}(V) \longrightarrow 0,$$
and think of this as a resolution of ${\mathrm{St}}^{\infty}(V)$ by a
chain complex $$\begin{equation}
\label{eqn:res-cobracket-i} A_* \coloneq [\cdots \to B_2({{\mathrm{Dec}}}_V;\mathrm{FI}(V)) \to B_1({{\mathrm{Dec}}}_V;\mathrm{FI}(V)) \to \mathrm{FI}(V)],
\end{equation}$$ where we place the entry $\mathrm{FI}(V)$ in degree
$0$. As a consequence the map
$$A_* \overset{\simeq}\longrightarrow[{\mathrm{St}}^{\infty}(V) \to 0]$$
whose target is thought of as a chain complex with entry
${\mathrm{St}}^{\infty}(V)$ placed in degree $0$, is a
quasi-isomorphism.

We next construct $B_*$. This will arise from a double complex obtained
from a first row $A_*$ by adding a second row given by the second
exterior power of the resolution
$0 \to \mathrm{FCR}(V) \to \mathrm{FC}(V) \to {\mathrm{St}}^{\infty}(V) \to 0$.
For this we recall that more generally if
$$0 \longrightarrow A \overset{f}\longrightarrow B \overset{g}\longrightarrow C \longrightarrow 0$$
is exact then so is
$$0 \longrightarrow{\mathrm{Sym}}^2 A \longrightarrow\tfrac{A \otimes B+B \otimes A}{\{a \otimes b+b \otimes a\}} \longrightarrow\Lambda^2 B \longrightarrow\Lambda^2 C \longrightarrow 0$$
with maps given respectively by
$aa' \mapsto a \otimes f(a')-f(a) \otimes a'$, by
$a \otimes b+b'\otimes a' \mapsto f(a) \wedge b+b' \wedge f(a')$, and by
$b \wedge b' \mapsto g(b) \wedge g(b')$. Thus both rows in the following
double complex are exact:
$$\begin{tikzcd}[column sep=.5cm] \cdots \rar & B_2({{\mathrm{Dec}}}_V;\mathrm{FI}(V)) \rar \dar{\rho'} & B_1({{\mathrm{Dec}}}_V;\mathrm{FI}(V)) \rar \dar{{\mathrm{alt}}\circ \rho} & \mathrm{FI}(V) \rar \dar{\delta_{\mathrm{cyc}} \circ {\mathrm{pr}}^\mathrm{FC}} & {\mathrm{St}}^{\infty}(V) \dar{\delta}\\[-5pt]
0 \rar & ({\mathrm{Sym}}^2 \mathrm{FCR})(V) \rar & \frac{(\mathrm{FCR}\otimes \mathrm{FC}+\mathrm{FC}\otimes \mathrm{FCR})}{\{a \otimes b + b \otimes a\}}(V) \rar & (\Lambda^2 \mathrm{FC})(V) \rar & (\Lambda^2 {\mathrm{St}}^{\infty})(V)
\end{tikzcd}$$ where the quotient on the bottom identifies
$a \otimes b \in \mathrm{FCR}(U) \otimes \mathrm{FC}(W)$ for
$U \oplus W = V$ with
$b \otimes a \in \mathrm{FC}(W) \otimes \mathrm{FCR}(U)$ for a direct
sum decomposition $U \oplus W = V$. The right square commutes because
${\mathrm{pr}}^{\mathrm{St}}$ is a map of Lie coalgebras, that the
middle square commutes follows from
[\[eqn:choosing-relations-diag\]](#eqn:choosing-relations-diag){reference-type="eqref"
reference="eqn:choosing-relations-diag"} as its bottom map factors over
the antisymmetrisation of the domain, and there exists a map $\rho'$
making the right square commute since its domain is part of a projective
resolution. Taking total complexes we define $$\begin{equation}
\label{eqn:res-cobracket-ii} B_* \coloneq \left[\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}\to \parbox{2.8cm}{\centering$({\mathrm{Sym}}^2 \mathrm{FCR})(V)$ \\[-2pt]
$+B_1({{\mathrm{Dec}}}_V;\mathrm{FI}(V))$} \to \tfrac{(\mathrm{FCR}\otimes \mathrm{FC}{+}\mathrm{FC}\otimes \mathrm{FCR})}{\{a \otimes b {+} b \otimes a\}}(V){+}\mathrm{FI}(V) \to (\Lambda^2 \mathrm{FC})(V)\right]
\end{equation}$$ with a quasi-isomorphism
$B_* \overset{\simeq}\longrightarrow[{\mathrm{St}}^{\infty}(V) \to (\Lambda^2{\mathrm{St}}^{\infty})(V)]$.

We finally construct the map $B_* \to A_*$ of chain complexes of
${\mathds{Q}}[{\mathrm{GL}}(V)]$-modules as that induced by projection
onto the first row of the double complex.

#### The map $B_* \to C_*$ {#sec:map-b-to-c}

We now define $C_*$. By taking $\boxbackslash$-tensor products of two
copies of the resolution
$0 \to \mathrm{FCR}\to {\mathrm{FC}} \to {{{\mathscr{S}}{\mathrm{t}}}^\infty}\to 0$
and evaluating at $V$, we get a chain complex $$\begin{equation}
\label{eqn:res-cobracket-iii}C_* = \big[(\mathrm{FCR}\boxbackslash\mathrm{FCR})(V) \to (\mathrm{FCR}\boxbackslash\mathrm{FC}+\mathrm{FC}\boxbackslash\mathrm{FCR})(V) \to (\mathrm{FC}\boxbackslash\mathrm{FC})(V)\big]
\end{equation}$$ with a quasi-isomorphism
$C_* \overset{\simeq}\longrightarrow[0 \to ({\mathrm{St}}^{\infty}\boxbackslash{\mathrm{St}}^{\infty})(V)]$.
For this we observe that if
$$0 \longrightarrow A \overset{f}\longrightarrow B \overset{g}\longrightarrow C \longrightarrow 0$$
is exact then so is
$$0 \longrightarrow A \boxbackslash A \longrightarrow A \boxbackslash B + B \boxbackslash A \longrightarrow B \boxbackslash B \longrightarrow C \boxbackslash C \longrightarrow 0$$
with maps given respectively by
$a \boxbackslash a' \mapsto a \otimes f(a')-f(a) \boxbackslash a'$, by
$a \boxbackslash b+b'\boxbackslash a' \mapsto f(a) \boxbackslash b+b' \boxbackslash f(a')$,
and by $b \boxbackslash b' \mapsto g(b) \boxbackslash g(b')$.

To construct the map $B_* \to C_*$, we recall that there are maps to the
parabolic tensor product:
$$\mathrm{FCR}\otimes \mathrm{FC}+\mathrm{FC}\otimes \mathrm{FCR}\overset{{\mathrm{alt}}}\longrightarrow\frac{\mathrm{FCR}\otimes \mathrm{FC}+\mathrm{FC}\otimes \mathrm{FCR}}{\{a \otimes b + b\otimes a\}} \xrightarrow{\zeta^{\mathrm{alt}}} \mathrm{FCR}\boxbackslash\mathrm{FC}+\mathrm{FC}\boxbackslash\mathrm{FCR},$$
where ${\mathrm{alt}}$ is the projection and we have $$\begin{align*}
\zeta^{\mathrm{alt}}\coloneq \tfrac{1}{2}({\overline{\zeta}}-{\underline{\zeta}}) \colon \frac{X \otimes Y+Y \otimes X}{\{x \otimes y+y \otimes x\}}&\longrightarrow X \boxbackslash Y + Y \boxbackslash X \\
x \otimes y + y' \otimes x' &\longmapsto \tfrac{1}{2}(x \boxbackslash y-x' \boxbackslash y' +y'\boxbackslash x'-y \boxbackslash x).
\end{align*}$$

Observe that the inclusion $\mathrm{FCR}\to {\mathrm{FC}}$ induces a
canonical map
$\mathrm{FCR}\boxbackslash\mathrm{FC}+\mathrm{FC}\boxbackslash\mathrm{FCR}\to \mathrm{FC}\boxbackslash\mathrm{FC}$,
which fits into a commutative diagram
$$\begin{tikzcd} \mathrm{FCR}\otimes \mathrm{FC}+\mathrm{FC}\otimes \mathrm{FCR}\dar[swap]{\zeta^{\mathrm{alt}}\circ {\mathrm{alt}}} \rar & \Lambda^2 \mathrm{FC}\dar{\zeta^{\mathrm{alt}}} \\[-5pt]
\mathrm{FCR}\boxbackslash\mathrm{FC}+\mathrm{FC}\boxbackslash\mathrm{FCR}\rar & \mathrm{FC}\boxbackslash\mathrm{FC}.\end{tikzcd}$$

::: lemma
**Lemma 100**. *The image of
$(\zeta^{\mathrm{alt}}\circ {\mathrm{alt}}\circ \rho)(h \otimes \mathrm{FI}[v_1,\ldots,v_n]) \in (\mathrm{FCR}\boxbackslash\mathrm{FC}+\mathrm{FC}\boxbackslash\mathrm{FCR})(V)$
in $\mathrm{FC}\boxbackslash\mathrm{FC}$ vanishes.*
:::

::: proof
*Proof.* This follows from the commutative diagram
$$\begin{tikzcd} B_1({{\mathrm{Dec}}}_V,{\mathrm{FI}}(V)) \rar \dar[swap]{\rho} & \mathrm{FI}(V)  \dar{\delta_{\mathrm{cyc}} \circ {\mathrm{pr}}^\mathrm{FC}} \\[-5pt]
(\mathrm{FCR}\otimes \mathrm{FC}+\mathrm{FC}\otimes \mathrm{FCR})(V) \rar \dar[swap]{\zeta^{\mathrm{alt}}\circ {\mathrm{alt}}} & (\Lambda^2\mathrm{FC})(V)  \dar{\zeta^{\mathrm{alt}}} \\[-5pt]
(\mathrm{FCR}\boxbackslash\mathrm{FC}+\mathrm{FC}\boxbackslash\mathrm{FCR})(V) \rar & (\mathrm{FC}\boxbackslash\mathrm{FC})(V)\end{tikzcd}$$
obtained from
[\[eqn:choosing-relations-diag\]](#eqn:choosing-relations-diag){reference-type="eqref"
reference="eqn:choosing-relations-diag"} and the commutative square
preceding the statement, and the fact that
$\zeta^{\mathrm{alt}}\circ \delta_{\mathrm{cyc}} = 0$ by
[76](#lem:fc-cobracket-symmetry){reference-type="ref+label"
reference="lem:fc-cobracket-symmetry"}. ◻
:::

We now define the map $B_* \to C_*$ on terms coming from each row of the
double complex defining $B_*$ separately. For the bottom row it is
$$\begin{tikzcd}0 \rar & ({\mathrm{Sym}}^2 \mathrm{FCR})(V) \rar \dar{\zeta^{{\mathrm{sym}}}} & \frac{(\mathrm{FCR}\otimes \mathrm{FC}+\mathrm{FC}\otimes \mathrm{FCR})}{\{a \otimes b + b \otimes a\}}(V) \rar \dar{\zeta^{\mathrm{alt}}} & (\Lambda^2 \mathrm{FC})(V) \dar{\zeta^{\mathrm{alt}}} \\[-5pt]
0 \rar & (\mathrm{FCR}\boxbackslash\mathrm{FCR})(V) \rar  & (\mathrm{FCR}\boxbackslash\mathrm{FC}+\mathrm{FC}\boxbackslash\mathrm{FCR})(V) \rar & (\mathrm{FC}\boxbackslash\mathrm{FC})(V) 
\end{tikzcd}$$ where we have $$\begin{align*}
 \zeta^{{\mathrm{sym}}}\coloneq \tfrac{1}{2}({\overline{\zeta}}+{\underline{\zeta}}) \colon {\mathrm{Sym}}^2 X &\longrightarrow X \boxbackslash X \\[-5pt]
xy &\longmapsto \tfrac{1}{2}(x \boxbackslash y + y \boxbackslash x).
\end{align*}$$ For the top row it is
$$\begin{tikzcd}\cdots \rar & B_1({{\mathrm{Dec}}}_V;\mathrm{FI}(V)) \rar \dar{\zeta^{\mathrm{alt}}\circ {\mathrm{alt}}\circ \rho} & \mathrm{FI}(V)  \dar{0} \rar & 0 \dar{0} \\[-5pt]
0 \rar & (\mathrm{FCR}\boxbackslash\mathrm{FCR})(V) \rar  & (\mathrm{FCR}\boxbackslash\mathrm{FC}+\mathrm{FC}\boxbackslash\mathrm{FCR})(V) \rar & (\mathrm{FC}\boxbackslash\mathrm{FC})(V) 
\end{tikzcd}$$ using that
$\zeta^{\mathrm{alt}}\circ {\mathrm{alt}}\circ \rho$ has a unique lift
into $(\mathrm{FCR}\boxbackslash\mathrm{FCR})(V)$ using the previous
lemma. We need to check this induces a map of chain complexes:
compatibility with differentials starting at
$B_1({{\mathrm{Dec}}}_V;\mathrm{FI}(V))$ is evident, and compatibility
with differentials starting at $B_2({{\mathrm{Dec}}}_V;\mathrm{FI}(V))$
is a consequence of the definition of $\rho'$.

#### Projecting away the $\sigma$-component {#sec:map-c-to-fcr}

By construction of $C_*$ as in
[\[eqn:res-cobracket-iii\]](#eqn:res-cobracket-iii){reference-type="eqref"
reference="eqn:res-cobracket-iii"}, there is a map of chain complexes
projecting onto the term $(\mathrm{FCR}\boxbackslash\mathrm{FCR})(V)$.
The short exact sequence
$0 \to \mathrm{FCR}(V) \to \mathrm{FC}(V) \to {\mathrm{St}}^{\infty}(V) \to 0$
induces a connecting homomorphism
$$H_*({\mathrm{GL}}(V);{\mathrm{St}}^{\infty}(V)) \overset{\partial}\longrightarrow H_{*-1}({\mathrm{GL}}(V);\mathrm{FCR}(V)),$$
which for $\dim(V) \neq 0$ is an isomorphism and for $\dim(V) = 1$
exactly projects to zero the term ${\mathds{Q}}\{\sigma\}$ in degree
$*=0$. The equivalence
$[0 \to {\mathrm{St}}^{\infty}(V)] \simeq [\mathrm{FCR}(V) \to \mathrm{FC}(V)]$
induces an isomorphism on homology and, tracing through the definitions,
following this by projection onto $\mathrm{FCR}(V)$ exactly implements
the construction of the connecting homomorphism. Thus, using the Künneth
theorem and Shapiro's lemma, the maps
$$\bigoplus_{d'+d''=2} H_{d'}({\mathrm{GL}}_k;{\mathrm{St}}^{\infty}_k) \otimes H_{d''}({\mathrm{GL}}_{n-k};{\mathrm{St}}^{\infty}_{n-k}) \longrightarrow{\mathscr{G}}_k \otimes {\mathscr{G}}_{n-k}.$$
induced by $C_* \to (\mathrm{FCR}\boxbackslash\mathrm{FCR})(V)$, are
also given by projecting terms ${\mathds{Q}}\{\sigma\}$ to zero.

#### A vanishing result and computation

Assume that $[h] \otimes \mathrm{FI}[v_1,\ldots,v_n]$ is generic. We
start with making precise the second technical input
[\[enum:technical-cobracket-ii\]](#enum:technical-cobracket-ii){reference-type="eqref"
reference="enum:technical-cobracket-ii"}, by understanding the unique
lift of the element
$(\zeta^{\mathrm{alt}}\circ {\mathrm{alt}}\circ \rho)([h] \otimes \mathrm{FI}[v_1,\ldots,v_n])$
to $(\mathrm{FCR}\boxbackslash\mathrm{FCR})(V)$. This is done by
combining the injectivity of the map
$\mathrm{FCR}\boxbackslash\mathrm{FCR}\to \mathrm{FCR}\boxbackslash\mathrm{FC}$
with the following vanishing result:

::: {#lem:xi-rhoact-cancellation .lemma}
**Lemma 101**. *The image of
$(\zeta^{\mathrm{alt}}\circ {\mathrm{alt}}\circ \rho^{\mathrm{coact}})([h] \otimes \mathrm{FI}[v_1,\ldots,v_n])$
in the component $(\mathrm{FCR}\boxbackslash\mathrm{FC})(V)$ vanishes.*
:::

::: proof
*Proof.* It suffices to verify this after composition with the injection
$(\mathrm{FCR}\boxbackslash\mathrm{FC})(V) \to (\mathrm{FC}\boxbackslash\mathrm{FC})(V)$.
Looking at [98](#def:rho-coact){reference-type="ref+label"
reference="def:rho-coact"} and the definition of
$\zeta^{\mathrm{alt}}\circ {\mathrm{alt}}$, the image will be supported
at flags $0 \subseteq W \subseteq V$ with $W \subseteq H$ so there
exists $U \not\subseteq H$ with
$U \smash{\overset{\cong}\longrightarrow} V/W$. Moreover, up to a factor
of $\tfrac{1}{2}$, there it is given by image in
$\mathrm{FC}(W) \otimes \mathrm{FC}(V/W)$ under ${\overline{\zeta}}$ of
the contributions to
$\delta^{\mathrm{coact}}_h(\mathrm{FI}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n])$
at $W$ and such $U$. In particular, it suffices to prove that
contributions to
$\delta^{\mathrm{coact}}_h(\mathrm{FI}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n])$
at a given $\{U,W\}$ cancel pairwise when mapped to
$\mathrm{FC}(W) \otimes \mathrm{FC}(V/W)$.

To see this, observe the contributions are of two types: "vertex first"
ones go through a vertex $v$ ($1 \leq v \leq n$) and an edge $(e,e+1)$
($v+1 \leq e \leq n)$ and "vertex last" ones go through a vertex $v'$
($1 \leq v' \leq n$) and edge $(e',e'+1)$ ($0 \leq e' \leq v'-2$). We
pair the "vertex first" contribution $\{v,(e,e+1)\}$ to the "vertex
last" contribution $\{v',(e',e'+1)\} = \{e,(v-1,v)\}$; indeed,
$v+1 \leq e$ in the former is equivalent to $e' = v-1 \leq e-2 = v'-2$
in the latter; see the following examples of pairs:
$$\begin{tikzpicture}
   \draw (0:1) \foreach \x in {60,120,...,360} {  -- (\x:1) };
   \foreach \x/\l/\p in
     { 60/{$w_2$}/above,
      120/{$w_1$}/above,
      180/{$0$}/left,
      240/{$w_5$}/below,
      300/{$w_4$}/below,
      360/{$w_3$}/right
     }
     \node[inner sep=1pt,circle,draw,fill,label={\p:\l}] at (\x:1) {};
    \draw (120:1) -- (210:1);
    \draw (150:1) -- (240:1);
\end{tikzpicture} \qquad 
\begin{tikzpicture}
   \draw (0:1) \foreach \x in {60,120,...,360} {  -- (\x:1) };
   \foreach \x/\l/\p in
     { 60/{$w_2$}/above,
      120/{$w_1$}/above,
      180/{$0$}/left,
      240/{$w_5$}/below,
      300/{$w_4$}/below,
      360/{$w_3$}/right
     }
     \node[inner sep=1pt,circle,draw,fill,label={\p:\l}] at (\x:1) {};
    \draw (60:1) -- (330:1);
    \draw (360:1) -- (90:1);
\end{tikzpicture}
\qquad 
\begin{tikzpicture}
   \draw (0:1) \foreach \x in {60,120,...,360} {  -- (\x:1) };
   \foreach \x/\l/\p in
     { 60/{$w_2$}/above,
      120/{$w_1$}/above,
      180/{$0$}/left,
      240/{$w_5$}/below,
      300/{$w_4$}/below,
      360/{$w_3$}/right
     }
     \node[inner sep=1pt,circle,draw,fill,label={\p:\l}] at (\x:1) {};
    \draw (60:1) -- (270:1);
    \draw (300:1) -- (90:1);
\end{tikzpicture}$$ So let $\{v,(e,e+1)\}$ and $\{e,(v-1,v)\}$ be a
paired vertex-first and vertex-last contribution. Both have the same
associated $W \subseteq H$ and the associated $U,U' \not \subseteq H$
have the same image in $V/W$, as $w_v \equiv w_e$ there. Moreover, the
formal correlators from the term not containing $0$ are literally the
same and those from the term containing $0$ become the same after
projection to $V/W$ up to a single sign (this uses that putting first
the element clockwise from the vertex has a positive sign, and putting
it second has a negative sign). ◻
:::

::: example
*Example 102*. We work out the right-most example: we have
$W = {\mathrm{span}}(w_2-w_3,w_3-w_4)$,
$U = {\mathrm{span}}(w_1,w_2,w_5)$, $U' = {\mathrm{span}}(w_1,w_4,w_5)$,
and the contributions to the cobracket at $\{W,U\}$ and $\{W,U'\}$ are
respectively
$$\mathrm{FC}[w_2:w_3:w_4] \wedge \mathrm{FC}[w_2:w_5:0:w_1] \qquad \mathrm{FC}[w_4:w_5:0:w_1] \wedge \mathrm{FC}[w_4:w_2:w_3].$$
As $w_2$ and $w_4$ map to the same vector in $U/W$ and formal
correlators are cyclically invariant, these cancel.
:::

It will not in general be the case that the image of
$(\zeta^{\mathrm{alt}}\circ {\mathrm{alt}}\circ \rho^{\mathrm{coact}})([h] \otimes \mathrm{FI}[v_1,\ldots,v_n])$
in the component $(\mathrm{FC}\boxbackslash\mathrm{FCR})(V)$ vanishes:

::: example
*Example 103*. We continue
[99](#exam:rho-coact){reference-type="ref+label"
reference="exam:rho-coact"}. Applying
$\zeta^{\mathrm{alt}}\circ {\mathrm{alt}}$ to
$\rho^{\mathrm{coact}}(\mathrm{FI}[v_1,v_2])$, we obtain (up to sign and
a factor of $\tfrac{1}{2}$) terms in both
$(\mathrm{FCR}\boxbackslash\mathrm{FC})(V)$ and
$(\mathrm{FC}\boxbackslash\mathrm{FCR})(V)$. The former are given by
$$\begin{align*}
&\big[\mathrm{FC}[\tfrac{v_1}{h_1}:\tfrac{v_2}{h_2}]-\mathrm{FC}[\tfrac{v_1}{h_1}:\tfrac{v_{2}-v_1}{h_2-h_1}]\big] \otimes \mathrm{FC}[0:{\overline{\tfrac{v_1}{h_1}}}] \\
&+\big[\mathrm{FC}[\tfrac{v_2}{h_2}:\tfrac{v_{2}-v_{1}}{h_2-h_1}]-\mathrm{FC}[\tfrac{v_1}{h_1}:\tfrac{v_2}{h_2}]\big] \otimes \mathrm{FC}[0:{\overline{\tfrac{v_2}{h_2}}}] \\
&+\big[\mathrm{FC}[\tfrac{v_1}{h_1}:\tfrac{v_{2}-v_1}{h_2-h_1}]-\mathrm{FC}[\tfrac{v_2}{h_2}:\tfrac{v_{2}-v_{1}}{h_2-h_1}]\big] \otimes \mathrm{FC}[0:{\overline{\tfrac{v_{2}-v_1}{h_2-h_1}}}]
\end{align*}$$ where the overlines mean we apply the map to the
quotient; as
${\overline{\tfrac{v_1}{h_1}}} = {\overline{\tfrac{v_2}{h_2}}} = {\overline{\tfrac{v_{2}-v_1}{h_2-h_1}}}$
we can collect the terms of the left and cancel them pairwise. This is
the cancellation used in
[101](#lem:xi-rhoact-cancellation){reference-type="ref+label"
reference="lem:xi-rhoact-cancellation"}.

The latter are given (up to sign and a factor of $\tfrac{1}{2}$) by
$$\begin{align*}
& \mathrm{FC}[0:\tfrac{v_1}{h_1}] \otimes \big[\mathrm{FC}[{\overline{\tfrac{v_1}{h_1}}}:{\overline{\tfrac{v_2}{h_2}}}]-\mathrm{FC}[{\overline{\tfrac{v_1}{h_1}}}:{\overline{\tfrac{v_{2}-v_1}{h_2-h_1}}}]\big]\\
&+\mathrm{FC}[0:\tfrac{v_2}{h_2}] \otimes \big[\mathrm{FC}[{\overline{\tfrac{v_2}{h_2}}}:{\overline{\tfrac{v_{2}-v_{1}}{h_2-h_1}}}]-\mathrm{FC}[{\overline{\tfrac{v_1}{h_1}}}:{\overline{\tfrac{v_2}{h_2}}}]\big] \\
&+\mathrm{FC}[0:\tfrac{v_{2}-v_1}{h_2-h_1}] \otimes \big[\mathrm{FC}[{\overline{\tfrac{v_1}{h_1}}}:{\overline{\tfrac{v_{2}-v_1}{h_2-h_1}}}]-\mathrm{FC}[{\overline{\tfrac{v_2}{h_2}}}:{\overline{\tfrac{v_{2}-v_{1}}{h_2-h_1}}}]\big]
\end{align*}$$ and these do *not* cancel, e.g. the top-right term is
equal to
$\mathrm{FC}[0:{\overline{\tfrac{v_2}{h_2}}}-{\overline{\tfrac{v_1}{h_1}}}]-\mathrm{FC}[0:{\overline{\tfrac{v_{2}}{h_2-h_1}}}-{\overline{\tfrac{v_1}{h_1}}}]$.
:::

To understand
$(\zeta^{\mathrm{alt}}\circ {\mathrm{alt}}\circ \rho)([h] \otimes \mathrm{FI}[v_1,\ldots,v_n])$
we may look at its image in the
$(\mathrm{FCR}\boxbackslash\mathrm{FC})(V)$-component. By
[101](#lem:xi-rhoact-cancellation){reference-type="ref+label"
reference="lem:xi-rhoact-cancellation"} this agrees with the image of
$(\zeta^{\mathrm{alt}}\circ {\mathrm{alt}}\circ \rho^{\mathrm{cyc}})([h] \otimes \mathrm{FI}[v_1,\ldots,v_n])$
in that component. Looking at
[96](#def:rho-cyc){reference-type="ref+label" reference="def:rho-cyc"}
and the definition of $\zeta^{\mathrm{alt}}\circ {\mathrm{alt}}$, it is
given by a sum of four terms (writing $v_0 \coloneq 0$):
$$\begin{equation}
\label{eqn:xi-rho-cyc} \begin{aligned}&\tfrac{1}{2}\sum_{j=0}^n \sum_{i=1}^{n-1} \big[({\mathrm{id}}-D_h)(\mathrm{FC}[v_j:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_{j+i}])\big] \boxbackslash\mathrm{FC}[{\overline{v}}_j:{\overline{v}}_{j+i+1}:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:{\overline{v}}_{j+n}] \\
&\quad -\tfrac{1}{2}\sum_{j=0}^n \sum_{i=1}^{n-1} \big[({\mathrm{id}}-D_h)(\mathrm{FC}[v_j:v_{j+i+1}:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_{j+n}])\big] \boxbackslash\mathrm{FC}[{\overline{v}}_j:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:{\overline{v}}_{j+i}] \\
&\quad +\tfrac{1}{2}\sum_{j=0}^n \sum_{i=1}^{n-1} \big[({\mathrm{id}}-D_h)(\mathrm{FC}[v_j\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_{j+i}])\big] \boxbackslash{\overline{({\mathrm{id}}-D_h)(\mathrm{FC}[v_j:v_{j+i+1}:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_{j+n}])}}\\
&\quad -\tfrac{1}{2}\sum_{j=0}^n \sum_{i=1}^{n-1} \big[({\mathrm{id}}-D_h)(\mathrm{FC}[v_j:v_{j+i+1}:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_{j+n}])\big] \boxbackslash{\overline{({\mathrm{id}}-D_h)(\mathrm{FC}[v_j:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_{j+i}])}}\end{aligned}
\end{equation}$$ where the terms in square brackets are interpret as
relations, and the overlines indicate we apply naturality in the
isomorphism $W \to V \to V/U$ for a splitting
$U \oplus W \overset{\cong}\longrightarrow V$. Including
[\[eqn:xi-rho-cyc\]](#eqn:xi-rho-cyc){reference-type="eqref"
reference="eqn:xi-rho-cyc"} further in
$(\mathrm{FC}\boxbackslash\mathrm{FC})(V)$, we note that first two terms
in [\[eqn:xi-rho-cyc\]](#eqn:xi-rho-cyc){reference-type="eqref"
reference="eqn:xi-rho-cyc"} are
$(({\mathrm{id}}-D_h) \otimes {\mathrm{id}}) \circ \overline{\zeta} \circ \delta_{\mathrm{cyc}}$
and we already know $\overline{\zeta} \circ \delta_{\mathrm{cyc}} = 0$
by [76](#lem:fc-cobracket-symmetry){reference-type="ref+label"
reference="lem:fc-cobracket-symmetry"}. The result is:

::: {#prop:para-after-rho-computation .proposition}
**Proposition 104**. *The image of
$[h] \otimes \mathrm{FI}[v_1:\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}:v_n]$
in $(\mathrm{FCR}\boxbackslash\mathrm{FCR})(V)$ is given by
$$\begin{align*}
 &\tfrac{1}{2} \sum_{j=0}^n \sum_{i=1}^{n-1} \big[({\mathrm{id}}-D_h)(\mathrm{FC}[v_j:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_{j+i}])\big] \otimes \big[{\overline{({\mathrm{id}}-D_h)(\mathrm{FC}[v_j:v_{j+i+1}:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_{j+n}])}}\big] \\
&-\tfrac{1}{2} \sum_{j=0}^n \sum_{i=1}^{n-1} \big[({\mathrm{id}}-D_h)(\mathrm{FC}[v_j:v_{j+i+1}:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_{j+n}])\big] \boxbackslash\big[{\overline{({\mathrm{id}}-D_h)(\mathrm{FC}[v_j:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_{j+i}])}}\big].
\end{align*}$$*
:::

#### Finishing the computation

This allows us to finish the proof of
[\[thm:polyl-presentation-cobracket\]](#thm:polyl-presentation-cobracket){reference-type="ref+label"
reference="thm:polyl-presentation-cobracket"}. At this point we know
that the cobracket is induced by the zigzag
$$H_1({\mathrm{GL}}(V);A_*) \longleftarrow H_1({\mathrm{GL}}(V);B_*) \longrightarrow H_1({\mathrm{GL}}(V);C_*),$$
which we know is isomorphic to the restriction of the zigzag
$${\mathrm{H}}/{\mathrm{H}}^2 \longleftarrow {\mathrm{H}}/{\mathrm{H}}^3 \longrightarrow{\mathrm{H}}/{\mathrm{H}}^2 \otimes {\mathrm{H}}/{\mathrm{H}}^2$$
to rank $n = \dim(V)$ and degree $2n+1$, followed by discarding terms
corresponding to $\sigma$. In particular, the left map is surjective and
upon passing to the quotient $\Lambda^2({\mathrm{H}}/{\mathrm{H}}^2)$ of
the right term by antisymmetrising, the result is independent of a
choice of lift. It remains to explicitly perform the following four
steps in explicit models for group homology:

(A) []{#enum:cobracket-a label="enum:cobracket-a"} find representatives
    in the left term,

(B) []{#enum:cobracket-b label="enum:cobracket-b"} lift them to the
    middle term,

(C) []{#enum:cobracket-c label="enum:cobracket-c"} apply the map to the
    right term,

(D) []{#enum:cobracket-d label="enum:cobracket-d"} discard the
    components corresponding to $\sigma$.

::: proof
*Proof of
[\[thm:polyl-presentation-cobracket\]](#thm:polyl-presentation-cobracket){reference-type="ref+label"
reference="thm:polyl-presentation-cobracket"}.* Denote the canonical bar
resolution ${\mathds{Q}}[{\mathrm{GL}}(V)]^{\otimes \bullet}$ of
${\mathds{Q}}$ by $P_*$, then we choose our explicit model to be total
chain complexes of the zigzag of double complexes
$$A_* \otimes_{{\mathds{Q}}[{\mathrm{GL}}(V)]} P_* \longleftarrow B_* \otimes_{{\mathds{Q}}[{\mathrm{GL}}(V)]} P_* \longrightarrow C_* \otimes_{{\mathds{Q}}[{\mathrm{GL}}(V)]} P_*.$$
We will denote the differential in the first term by $d$ and that in the
second term by $\partial$.

For step
[\[enum:cobracket-a\]](#enum:cobracket-a){reference-type="eqref"
reference="enum:cobracket-a"}, recall that our goal is to compute the
cobracket of a correlator
$\mathrm{Cor}^\mathscr{G}(x_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n) \in {\mathscr{G}}(V)$
with all arguments $x_0,\ldots,x_n$ all distinct, and by homogeneity we
may assume $x_0 = 0$. To do so, we must represent it by an 1-cycle in
$A_* \otimes_{{\mathds{Q}}[{\mathrm{GL}}(V)]} P_*$, the relevant part of
which is
$$\begin{tikzcd}[column sep=.2cm, row sep=.25cm] & \mathrm{FI}(V) \otimes {\mathds{Q}}[{\mathrm{GL}}(V)] \arrow{rd} & \\
B_1({{\mathrm{Dec}}}_V;\mathrm{FI}(V)) \arrow{rr} & & \mathrm{FI}(V). \end{tikzcd}$$
We choose to the pair of the necessarily generic element
$x=[h] \otimes \mathrm{FI}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n] \in B_1({{\mathrm{Dec}}}_V;\mathrm{FI}(V))$
satisfying $h(v_i) = x_i$ and an
$z \in \mathrm{FI}(V) \otimes {\mathds{Q}}[{\mathrm{GL}}(V)]$ satisfying
$d(x) + \partial(z) = 0 \in \mathrm{FI}(V)$, which must exist because
the coinvariants of $\mathrm{FI}(V)$ vanish.

For step
[\[enum:cobracket-b\]](#enum:cobracket-b){reference-type="eqref"
reference="enum:cobracket-b"}, we must extend this to a 1-cycle in
$B_* \otimes_{{\mathds{Q}}[{\mathrm{GL}}(V)]} P_*$, the relevant part of
which is
$$\begin{tikzcd}[column sep=-1cm, row sep=.25cm] & & & \mathrm{FI}(V) \otimes {\mathds{Q}}[{\mathrm{GL}}(V)] \arrow{rd} & \\
& & B_1({{\mathrm{Dec}}}_V;\mathrm{FI}(V)) \arrow{rr} \arrow{dd} & & \mathrm{FI}(V) \\ 
& \frac{(\mathrm{FCR}\otimes \mathrm{FC}+\mathrm{FC}\otimes \mathrm{FCR})}{\{a \otimes b + b \otimes a\}}(V) \otimes {\mathds{Q}}[{\mathrm{GL}}(V)] \arrow{rd} & & & \\
({\mathrm{Sym}}^2 \mathrm{FCR})(V) \arrow{rr} & & \frac{(\mathrm{FCR}\otimes \mathrm{FC}+\mathrm{FC}\otimes \mathrm{FCR})}{\{a \otimes b + b \otimes a\}}(V). & & \end{tikzcd}$$
This means finding elements $y \in ({\mathrm{Sym}}^2 \mathrm{FCR})(V)$
and
$w \in (\tfrac{\mathrm{FCR}\otimes \mathrm{FC}+ \mathrm{FC}\otimes \mathrm{FCR}}{a \otimes b + b \otimes a})(V) \otimes {\mathds{Q}}[{\mathrm{GL}}(V)]$
so that $d(x,y)-\partial(w) = 0$, which is always possible by
surjectivity of the map
${\mathrm{H}}/{\mathrm{H}}^3 \to {\mathrm{H}}/{\mathrm{H}}^2$.

For step
[\[enum:cobracket-c\]](#enum:cobracket-c){reference-type="eqref"
reference="enum:cobracket-c"}, we apply the map $B_* \to C_*$ to get a
1-cycle in $C_* \otimes_{{\mathds{Q}}[{\mathrm{GL}}(V)]} P_*$, the
relevant part of which is
$$\begin{tikzcd}[column sep=-.5cm, row sep=.25cm] & (\mathrm{FCR}\boxbackslash\mathrm{FC}+\mathrm{FC}\boxbackslash\mathrm{FCR})(V) \otimes {\mathds{Q}}[{\mathrm{GL}}(V)] \arrow{rd} & \\
(\mathrm{FCR}\boxbackslash\mathrm{FCR})(V) \arrow{rr} & & (\mathrm{FCR}\boxbackslash\mathrm{FC}+\mathrm{FC}\boxbackslash\mathrm{FCR})(V). \end{tikzcd}$$
The result is an element
$(\zeta^{\mathrm{alt}}\circ {\mathrm{alt}}\circ \rho)(x)+\zeta^{{\mathrm{sym}}}(y) \in (\mathrm{FCR}\boxbackslash\mathrm{FCR})(V)$
where this first term was computed in
[104](#prop:para-after-rho-computation){reference-type="ref+label"
reference="prop:para-after-rho-computation"}, as well as the image
$\zeta^{\mathrm{alt}}(w) \in (\mathrm{FCR}\boxbackslash\mathrm{FC}+ \mathrm{FC}\boxbackslash\mathrm{FCR})(V) \otimes {\mathds{Q}}[{\mathrm{GL}}(V)]$.

For step
[\[enum:cobracket-d\]](#enum:cobracket-d){reference-type="eqref"
reference="enum:cobracket-d"}, to discard the components corresponding
to $\sigma$ we simply project to the term
$(\mathrm{FCR}\boxbackslash\mathrm{FCR})(V)$, according to the
discussion in [5.3.8](#sec:map-c-to-fcr){reference-type="ref+label"
reference="sec:map-c-to-fcr"}. (The element $\zeta^{\mathrm{alt}}(w)$ in
fact yields the $\sigma$-component $\delta_\sigma$).

Passing to homology, we can make an identification
$$H_0({\mathrm{GL}}(V);(\mathrm{FCR}\boxbackslash\mathrm{FCR})(V)) \cong ({\mathscr{G}} \otimes {\mathscr{G}})(V) \cong ({\mathrm{Sym}}^2 {\mathscr{G}})(V)+(\Lambda^2 {\mathscr{G}})(V)$$
by splitting the coefficients
$(\mathrm{FCR}\boxbackslash\mathrm{FCR})(V)$ into a symmetric and
antisymmetric part. The element $\zeta^{{\mathrm{sym}}}(y)$ contributes
only to the former, while
$(\zeta^{\mathrm{alt}}\circ {\mathrm{alt}}\circ \rho)(x)$ contributes
only to the latter. Upon antisymmetrising only the latter will remain
and is exactly given by the element in the formula of
[\[thm:polyl-presentation-cobracket\]](#thm:polyl-presentation-cobracket){reference-type="ref+label"
reference="thm:polyl-presentation-cobracket"}. This completes the
computation. ◻
:::

## The $\sigma$-component of the cobracket

In this section we compute the $\sigma$-component
$$\delta_\sigma \colon {\mathscr{G}}(F) \longrightarrow H_{2}({\mathrm{GL}}_{n-1}(F);{\mathrm{St}}^{\infty}_{n-1}(F))$$
in terms of the cobracket, or at least a part of it. More precisely, we
will prove using a scaling action that the target splits into two
summands and describe the projection of the $\sigma$-component to the
easier summand. We follow
[1](#conv:shorter-notation){reference-type="ref+label"
reference="conv:shorter-notation"}.

### The scaling action {#sec:action-by-scaling}

If we let ${\mathrm{CMon}}({\mathrm{Cat}}_1)$ denote the
$(2,1)$-category whose objects are symmetric monoidal 1-categories,
whose morphisms are symmetric monoidal functors, and whose (invertible)
2-morphisms are symmetric monoidal natural isomorphisms, then the nerve
construction identifies this as a full subcategory of the category of
symmetric monoidal categories [@GepnerHaugsengNikolaus Section 8]. The
restriction to the symmetric monoidal 1-groupoids lands in
${\mathrm{CMon}}({{\mathscr{S}}{\mathrm{pc}}}) \subset {\mathrm{CMon}}({\mathrm{Cat}})$
and if we can identify the latter with
${\mathrm{Alg}}_{E_\infty^{\mathrm{u}}}({{\mathscr{S}}{\mathrm{pc}}})$,
the nerve is given by classifying space construction
$$B \colon {\mathrm{CMon}}({\mathrm{Gpd}}_1) \overset{\subset}\longrightarrow{\mathrm{Alg}}_{E_\infty^{\mathrm{u}}}({{\mathscr{S}}{\mathrm{pc}}}).$$
To add gradings, one uses that the commutative monoid ${\mathds{N}}$ of
natural numbers under addition can be thought of as a symmetric monoidal
1-groupoid where all morphisms are the identity with associated
$E_\infty^{\mathrm{u}}$-algebra in spaces denoted ${\mathbf{N}}$, and
use that
$${\mathrm{CMon}}({\mathrm{Gpd}}_1)_{/{\mathds{N}}} \overset{B}{\longrightarrow} {\mathrm{Alg}}_{E_\infty^{\mathrm{u}}}({{\mathscr{S}}{\mathrm{pc}}})_{/{\mathbf{N}}} \simeq {\mathrm{Alg}}_{E_\infty^{\mathrm{u}}}({\mathrm{Fun}}({\mathds{N}},{{\mathscr{S}}{\mathrm{pc}}})).$$

From this perspective, ${\mathbf{BGL}}(F)^+$ arises as the classifying
space of the symmetric monoidal groupoid ${\mathrm{Vect}}$ of
finite-dimensional vector spaces over $F$ under direct sum, with the
symmetric monoidal functor to ${\mathds{N}}$ given by $\dim$. Every
$\lambda \in F^\times$ gives rise to a symmetric monoidal natural
isomorphism
$\phi_\lambda \colon {\mathrm{id}}_{\mathrm{Vect}} \to {\mathrm{id}}_{\mathrm{Vect}}$
with components at an object $V \in {\mathrm{Vect}}$ given by
$\lambda \cdot {\mathrm{id}}_V \colon V \to V$. These satisfy
$\phi_{\lambda} \phi_\mu = \phi_{\lambda \mu}$, and hence lift
${\mathrm{Vect}}$ to a functor
$${\mathrm{Vect}} \colon {\mathrm{B}}^2 F^\times \longrightarrow{\mathrm{CMon}}({\mathrm{Cat}}_1)_{/{\mathds{N}}}.$$
whose domain has a unique object $\ast$ and 1-morphism
${\mathrm{id}}_\ast$, with 2-endomorphisms of ${\mathrm{id}}_\ast$ given
by $F^\times$ with composition given by multiplication. Taking
classifying spaces we thus lift ${\mathbf{BGL}}(F)^+$ to a functor
$${\mathbf{BGL}}(F)^+ \colon {\mathrm{B}}^2 F^\times \longrightarrow{\mathrm{Alg}}_{E_\infty^{\mathrm{u}}}({\mathrm{Fun}}({\mathds{N}},{{\mathscr{S}}{\mathrm{pc}}})).$$
Unwinding the definitions, in rank $n$ this is the following map: for an
$n$-dimensional vector space $V$, the inclusion of the orbit groupoid
$*{\sslash}{\mathrm{GL}}(V) \to {\mathrm{Vect}}$ induces an equivalence
${\mathrm{BGL}}(V) \to {\mathbf{BGL}}(F)^+(n)$. On mapping spaces, the
above functor then induces a map
${\mathrm{B}}F^\times \to {\mathrm{Map}}_{{{\mathscr{S}}{\mathrm{pc}}}}({\mathrm{BGL}}(V),{\mathrm{BGL}}(V))$
with adjoint map
$${\mathrm{B}}F^\times \times {\mathrm{BGL}}(V) \to {\mathrm{BGL}}(V)$$
that is induced by the group homomorphism $$\begin{align*}
\alpha \colon F^\times \times {\mathrm{GL}}(V) &\longrightarrow{\mathrm{GL}}(V) \\
(\lambda,A) &\longmapsto \lambda \, A.
\end{align*}$$

Given the construction of this action on ${\mathbf{BGL}}^+$, it is
inherited by any object obtained naturally from it. In particular,
postcomposing with the functor induced on
$E_\infty^{\mathrm{u}}$-algebras in
${\mathrm{Fun}}({\mathds{N}},{{\mathscr{S}}{\mathrm{pc}}})$ by
rationalisation
${{\mathscr{S}}{\mathrm{pc}}}\to {{\mathscr{D}}_{\mathds{Q}}}$, passing
to the augmentation ideal of the canonical augmentation, and taking
$E_\infty^{\mathrm{nu}}$-indecomposables, we obtain a functor
$${\mathrm{cot}}_{E_\infty^{\mathrm{nu}}}({\mathbf{BGL}}) \colon {\mathrm{B}}^2 F^\times \longrightarrow{\mathrm{Fun}}({\mathds{N}},{{\mathscr{D}}_{\mathds{Q}}})$$
that induces a $\Lambda^* F^\times$-action on the $E_\infty$-homology.

To understand this more explicitly, we take a slightly different
perspective. The symmetric monoidal ${\mathrm{B}}F^\times$-action on
${\mathrm{Vect}}$ induces one on
${\mathrm{Fun}}({\mathrm{Vect}},{\mathscr{C}})$ for any presentable
symmetric monoidal category ${\mathscr{C}}$, and hence induces an action
on
${\mathrm{Alg}}_{E_\infty^{\mathrm{u}}}({\mathrm{Fun}}({\mathrm{Vect}},{\mathscr{C}}))$.
Taking ${\mathscr{C}} = {{\mathscr{S}}{\mathrm{pc}}}$, the terminal
$E_\infty^{\mathrm{u}}$-algebra ${\underline{\ast}}$ is necessarily a
fixed point of this action, and since the action is by symmetric
monoidal equivalences so are the iterated bar construction of
${\underline{\ast}}_+$. By naturality of the identification
$$H_{n,d}^{E_\infty}({\mathbf{BGL}}(F)) \cong H_{n,d-2n+2}({\mathrm{GL}}_n;{\mathrm{St}}^{\infty}_n),$$
we see that the action on the right side is given by that induced by
$\alpha$, using the canonical identification
$\alpha^* {\mathrm{St}}^{\infty}_n \cong {\mathrm{pr}}_2^* {\mathrm{St}}^{\infty}_n$.

### Splittings

A useful feature of Steinberg modules and their variants is that the
action of general linear groups on them factors over the projective
general linear groups. Though it is easy to see it is a consequence of
the fact that ${\underline{*}}$ and its iterated bar constructions are
fixed points for the $BF^\times$-action. We take advantage of this to
produce splittings, compatible with the scaling action, that in
particular hold with trivial coefficients and coefficients in infinite
Steinberg modules.

Recall the projective general linear groups over a field $F$ are defined
as follows: there is an injective homomorphism as diagonal matrices
$$\begin{align*}
 F^\times &\longrightarrow{\mathrm{GL}}_n \\
\lambda & \longmapsto \lambda\,{\mathrm{id}}
\end{align*}$$ taking values in the centre, and we identify $F^\times$
with its image. Then we set
$${\mathrm{PGL}}_n \coloneq {\mathrm{GL}}_n/F^\times.$$ Thus there is a
canonical central extension
$$1 \longrightarrow F^\times \longrightarrow{\mathrm{GL}}_n \overset{{\mathrm{pr}}}\longrightarrow{\mathrm{PGL}}_n \longrightarrow 1.$$
Though the determinant $\det \colon {\mathrm{GL}}_n \to F^\times$ does
*not* split this, it does include a splitting on rational homology:

::: lemma
**Lemma 105**. *The homomorphism
$({\mathrm{pr}},\det) \colon {\mathrm{GL}}_n \to {\mathrm{PGL}}_n(F) \times F^\times$
induces for all ${\mathds{Q}}[{\mathrm{PGL}}_n]$-modules $M$ an
isomorphism. $$\begin{equation}
\label{eqn:splitting} \varpi_n \colon H_*({\mathrm{GL}}_n;{\mathrm{pr}}^* M) \overset{\cong}\longrightarrow H_*({\mathrm{PGL}}_n;M) \otimes \Lambda^* F^\times.
\end{equation}$$*
:::

::: proof
*Proof.* There is a map of short exact sequences of groups
$$\begin{tikzcd} 1 \rar & F^\times \dar{(-)^n} \rar{{\mathrm{inc}}} & {\mathrm{GL}}_n \dar{({\mathrm{pr}},\det)} \rar{{\mathrm{pr}}} & {\mathrm{PGL}}_n \dar{{\mathrm{id}}} \rar & 1 \\
1 \rar & F^\times \rar{i_2} & {\mathrm{PGL}}_n \times F^\times \rar{\pi_1} & {\mathrm{PGL}}_n \rar & 1 \end{tikzcd}$$
and the induced map on Hochschild--Lyndon--Serre spectral sequences for
homology with coefficients in $M$, is an isomorphism on the $E^2$-page,
giving the result as the second spectral sequence collapses. To see
this, we observe (a) that the top sequence is central, so the Künneth
theorem provides an isomorphism
$H_*(F^\times,{\mathrm{incl}}^* {\mathrm{pr}}^* M) \cong H_*(F^\times;{\mathds{Q}}) \otimes M$
as ${\mathds{Q}}[{\mathrm{PGL}}_n]$-modules, where the first factor has
trivial action, and (b) that the maps
$H_*(F^\times;{\mathds{Q}}) \to H_*(F^\times;{\mathds{Q}})$ induced by
$\lambda \mapsto \lambda^n$, are isomorphisms as they act by
multiplication with $n^k$ in degree $k$.

To see the latter, recall that if $A$ is any abelian group then
$H_1(A;{\mathds{Q}}) \cong A \otimes {\mathds{Q}}$ and
$H_*(A;{\mathds{Q}})$ is a graded-commutative algebra with product
induced by the $E_\infty$-structure on $BA$ (induced by the
multiplication on $A$ viewed as a group homomorphism
$A \times A \to A$). Thus, there is a canonical algebra map
$\Lambda^*_{\mathds{Q}}(A \otimes {\mathds{Q}}) \to H_*(A;{\mathds{Q}})$
as the domain is free. This is an isomorphism for any finitely generated
abelian group $A$ by direct computation, and as both functors
$\Lambda_{\mathds{Q}}^*(- \otimes {\mathds{Q}})$ and
$H_*(-;{\mathds{Q}})$ commute with filtered colimits of abelian groups,
and any abelian group is the filtered colimit of its finitely generated
subgroups, it is an isomorphism for all abelian groups. As $F$ is
commutative this discussion applies to $A=F^\times$, giving
$H_*(F^\times;{\mathds{Q}}) \cong \Lambda^* F^\times_{\mathds{Q}}$, so
the map induced by $\lambda \mapsto \lambda^n$ acts by multiplication by
$n^k$ in degree $k$. ◻
:::

The following describes the scaling action by
$\Lambda^* F^\times_{\mathds{Q}}$ under this splitting; this in
particular applies to $M = {\mathrm{St}}^{\infty}_n$.

::: lemma
**Lemma 106**. *Under the isomorphism
$\varpi_n \colon H_*({\mathrm{GL}}_n(F);{\mathrm{pr}}^* M) \xrightarrow{\cong} H_*({\mathrm{PGL}}_n(F);M) \otimes \Lambda^* F^\times$
for a ${\mathds{Q}}[{\mathrm{PGL}}_n]$-module $M$, the action of
$\Lambda^* F^\times$ on $H_*({\mathrm{GL}}_n(F);{\mathrm{pr}}^* M)$ is
given by
$$x \cdot (y \otimes z) = (-1)^{|x||y|} n^{|x|} y \otimes (x \cdot z)$$
where $\cdot$ denotes the multiplication on $\Lambda^* F^\times$.*
:::

::: proof
*Proof.* The diagram
$$\begin{tikzcd} F^\times \times {\mathrm{GL}}_n \rar{\alpha} \dar[swap]{{\mathrm{id}}\times ({\mathrm{pr}},\det)} & {\mathrm{GL}}_n \dar{({\mathrm{pr}},\det)} \\[-5pt]
F^\times \times {\mathrm{PGL}}_n \times F^\times \rar & {\mathrm{PGL}}_n \times F^\times \end{tikzcd}$$
commutes if the bottom group homomorphism is given by
$(\lambda,[A],\mu) \longmapsto ([A],\lambda^n \mu)$. The result follows
upon passing to homology. ◻
:::

### Components of the cobracket

These splittings allow us to decompose the operations---products,
coproducts, cobrackets---on the homology groups in
[51](#thm:ekhomology-steinberg){reference-type="ref+label"
reference="thm:ekhomology-steinberg"} into different components. In
particular, recall from
[4.2](#sec:ek-homology){reference-type="ref+label"
reference="sec:ek-homology"} that on ${\mathscr{G}}$ there are a
cobracket and a $\sigma$-component
$$\delta \colon {\mathscr{G}} \longrightarrow\Lambda^2 {\mathscr{G}}, \quad  \text{and} \quad \delta_\sigma \colon {\mathscr{G}} \longrightarrow H_2({\mathrm{GL}}_{n-1};{\mathrm{St}}^{\infty}_{n-1}).$$
The target of the $\sigma$-component can be described more explicitly:

(1) For $n=2$, we know the target is given by $\Lambda^2 F^\times$.

(2) For $n \geq 3$,
    [55](#thm:bgl-critical-line-vanishing){reference-type="ref+label"
    reference="thm:bgl-critical-line-vanishing"} implies there is an
    isomorphism
    $$\quad H_2({\mathrm{GL}}_n;{\mathrm{St}}^{\infty}_n) \underset{\varpi_n}{\overset{\cong}\longrightarrow}H_1({\mathrm{PGL}}_n;{\mathrm{St}}^{\infty}_n) \otimes F^\times \oplus H_2({\mathrm{PGL}}_n;{\mathrm{St}}^{\infty}_n)$$
    which we may further simplify using
    $H_1({\mathrm{PGL}}_n;{\mathrm{St}}^{\infty}_n) \cong H_1({\mathrm{GL}}_n;{\mathrm{St}}^{\infty}_n) = {\mathscr{G}}_n$.

Our goal for the remainder of this section is to explain how to compute
$\delta_\sigma$ in case (1) and the first component
${\mathrm{pr}}_1 \delta_\sigma$ in case (2).

::: {#prop:cobr-vs-sigma-component .proposition}
**Proposition 107**. * *

(i) *For $n=2$, the cobracket and $\sigma$-component (both maps
    ${\mathscr{G}}_2 \to \Lambda^2 F^\times$) agree up to a sign:
    $$\delta = -\delta_\sigma.$$*

(ii) *For $n \geq 3$, the $(n-1,1)$-component of cobracket and the first
     term of the $\sigma$-component (both maps
     ${\mathscr{G}}_n \longrightarrow{\mathscr{G}}_{n-1}\otimes F^\times$)
     agree up to a sign:
     $$\delta_{1,n-1} = -{\mathrm{pr}}_1 \delta_\sigma.$$*
:::

#### A projective cobracket

Up to an application of the Künneth isomorphism, the cobracket on
$H_{*,*}({\mathrm{GL}};{\mathrm{St}}^{\infty})$ has components given by
the dashed maps
$$\begin{tikzcd} H_*({\mathrm{GL}}_n;{\mathrm{St}}^{\infty}_n) \rar[dashed]{\Delta_{k,n-k}-\sigma \circ \Delta_{n-k,k}} &[5pt] H_{*+1}({\mathrm{GL}}_k \times {\mathrm{GL}}_{n-k};{\mathrm{St}}^{\infty}_k \otimes {\mathrm{St}}^{\infty}_{n-k}) \arrow{dd}{\cong}\\[-5pt] 
H_*({\mathrm{GL}}_n;[{\mathrm{St}}^{\infty}_n \to ({{{\mathscr{S}}{\mathrm{t}}}^\infty}\boxbackslash{{{\mathscr{S}}{\mathrm{t}}}^\infty})(F^n)]) \dar \uar[two heads]& \\[-5pt] 
H_{*+1}({\mathrm{GL}}_n;({{{\mathscr{S}}{\mathrm{t}}}^\infty}\boxbackslash{{{\mathscr{S}}{\mathrm{t}}}^\infty})(F^n))  \rar & H_{*+1}({\mathrm{P}}_{n,n-k};{\mathrm{St}}^{\infty}_k \otimes {\mathrm{St}}^{\infty}_{n-k})\end{tikzcd}$$
obtained using zigzag from
[72](#prop:construction-of-cobracket){reference-type="ref+label"
reference="prop:construction-of-cobracket"}, Shapiro's lemma followed by
projection onto the $(k,n-k)$-term, the Nesterenko--Suslin property in
the guise of
[64](#lem:para-levi-comparison-pgl){reference-type="ref+label"
reference="lem:para-levi-comparison-pgl"}, and antisymmetrising. As the
action of ${\mathrm{GL}}_n$ on ${\mathrm{St}}^{\infty}_n$ factors over
${\mathrm{PGL}}_n$, we can construct a projective version, though this
is *not* a cobracket given the form of its domain and target:
$$\begin{tikzcd} H_*({\mathrm{PGL}}_n;{\mathrm{St}}^{\infty}_n) \rar[dashed]{P\Delta_{k,n-k}-\sigma \circ P\Delta_{n-k,k}} &[5pt] H_{*+1}({\mathrm{P}}({\mathrm{GL}}_k \times {\mathrm{GL}}_{n-k});{\mathrm{St}}^{\infty}_k \otimes {\mathrm{St}}^{\infty}_{n-k}) \arrow{dd}{\cong} \\[-5pt]
H_{*}({\mathrm{PGL}}_n;[{\mathrm{St}}^{\infty}_n \to ({{{\mathscr{S}}{\mathrm{t}}}^\infty}\boxbackslash{{{\mathscr{S}}{\mathrm{t}}}^\infty})(F^n)]) \uar[two heads] \dar& \\[-5pt]
H_{*+1}({\mathrm{PGL}}_n;({{{\mathscr{S}}{\mathrm{t}}}^\infty}\boxbackslash{{{\mathscr{S}}{\mathrm{t}}}^\infty})(R^n))  \rar & H_{*+1}({\mathrm{P}}({\mathrm{P}}_{n,n-k});{\mathrm{St}}^{\infty}_k \otimes {\mathrm{St}}^{\infty}_{n-k}).\end{tikzcd}$$
By construction of the splitting the following diagram commutes
$$\begin{equation}
\label{eqn:splitting-compatibility-1} \begin{tikzcd} H_*({\mathrm{GL}}_n;{\mathrm{St}}^{\infty}_n) \rar{\Delta_{k,n-k}-\sigma \circ \Delta_{n-k,k}} \dar{\cong}[swap]{\varpi_n} & H_{*+1}({\mathrm{GL}}_k \times {\mathrm{GL}}_{n-k};{\mathrm{St}}^{\infty}_k \otimes {\mathrm{St}}^{\infty}_{n-k}) \dar{({\mathrm{pr}},\det)_*} \\[-5pt]
H_*({\mathrm{PGL}}_n;{\mathrm{St}}^{\infty}_n) \otimes \Lambda^* F^\times \rar & H_{*+1}({\mathrm{P}}({\mathrm{GL}}_k \times {\mathrm{GL}}_{n-k});{\mathrm{St}}^{\infty}_k \otimes {\mathrm{St}}^{\infty}_{n-k}) \otimes \Lambda^* F^\times \end{tikzcd}
\end{equation}$$ where the bottom map is
$(P\Delta_{k,n-k}-\sigma \circ P\Delta_{n-k,k}) \otimes {\mathrm{id}}$.
We may apply the Künneth theorem in the top-right term of this square
and apply the splittings to each term, resulting in the top map of the
zigzag $$\begin{equation}
\label{eqn:splitting-compatibility-2}\begin{tikzcd} H_*({\mathrm{GL}}_k \times {\mathrm{GL}}_{n-k};{\mathrm{St}}^{\infty}_k \otimes {\mathrm{St}}^{\infty}_{n-k}) \dar{({\mathrm{pr}},\det)_*} \rar{\varpi_{k} \otimes \varpi_{n-k}} &[-10pt] \parbox{4.8cm} {\centering $H_*({\mathrm{PGL}}_k;{\mathrm{St}}^{\infty}_k) \otimes \Lambda^* F^\times$ \\ $\otimes H_*({\mathrm{PGL}}_{n-k};{\mathrm{St}}^{\infty}_{n-k}) \otimes \Lambda^* F^ \times$} \\[-5pt]
H_*({\mathrm{P}}({\mathrm{GL}}_k \times {\mathrm{GL}}_{n-k}),{\mathrm{St}}^{\infty}_k \otimes {\mathrm{St}}^{\infty}_{n-k}) \otimes \Lambda^* F^\times.\end{tikzcd}
\end{equation}$$ In the case $k=n-1$, there is an isomorphism from the
bottom-left to top-right term of
[\[eqn:splitting-compatibility-2\]](#eqn:splitting-compatibility-2){reference-type="eqref"
reference="eqn:splitting-compatibility-2"} making the diagram obtained
pasting
[\[eqn:splitting-compatibility-1\]](#eqn:splitting-compatibility-1){reference-type="eqref"
reference="eqn:splitting-compatibility-1"} and
[\[eqn:splitting-compatibility-2\]](#eqn:splitting-compatibility-2){reference-type="eqref"
reference="eqn:splitting-compatibility-2"} side-by-side commute:

::: {#lem:delta-vs-pdelta .lemma}
**Lemma 108**. *For $n \geq 2$ the following diagram commutes
$$\begin{tikzcd} H_{*}({\mathrm{GL}}_n;{\mathrm{St}}^{\infty}_n) \dar{\cong}[swap]{\varpi_n} \rar{\Delta_{n-1,1}-\sigma \circ \Delta_{1,n-1}} &[40pt] H_{*+1}({\mathrm{GL}}_{n-1};{\mathrm{St}}^{\infty}_{n-1}) \otimes \Lambda^* F^\times \dar{\cong}[swap]{\varpi_{n-1} \otimes \varpi_1} \\[-5pt]
H_*({\mathrm{PGL}}_n;{\mathrm{St}}^{\infty}_n) \otimes \Lambda^* F^\times \rar & H_{*+1}({\mathrm{PGL}}_{n-1},{\mathrm{St}}^{\infty}_{n-1}) \otimes \Lambda^* F^\times \otimes \Lambda^* F^\times\end{tikzcd}$$
where the bottom map is
$({\mathrm{id}}\otimes {\mathrm{sh}}_*)^{-1} \circ (({\mathrm{P}}\Delta_{n-1,1}-\sigma \circ P\Delta_{1,n-1}) \otimes {\mathrm{id}})$
and
${\mathrm{sh}} \colon F^\times \times F^\times \to F^\times \times F^\times$
is the "shear" homomorphism given by
$(\mu,\lambda) \mapsto (\mu\lambda^{-(n-1)},\mu \lambda)$.*
:::

::: proof
*Proof.* As explained above, it suffices to construct an isomorphism in
the zigzag
[\[eqn:splitting-compatibility-2\]](#eqn:splitting-compatibility-2){reference-type="eqref"
reference="eqn:splitting-compatibility-2"}, and to do so we consider the
zigzag of groups
$$\begin{tikzcd} & \arrow{ld}[swap]{({\mathrm{pr}},\det)} {\mathrm{GL}}_k \times {\mathrm{GL}}_{n-k} \arrow{rd}{(({\mathrm{pr}},\det),({\mathrm{pr}},\det))} & \\[-7pt]
{\mathrm{P}}({\mathrm{GL}}_k \times {\mathrm{GL}}_{n-k})\times F^\times  & &  {\mathrm{PGL}}_k \times F^\times \times {\mathrm{PGL}}_{n-k} \times F^\times\end{tikzcd}$$
in the case $k=n-1$. The composition
${\mathrm{pr}}\circ {\mathrm{inc}}\colon {\mathrm{GL}}_{n-1} \to {\mathrm{GL}}_{n-1} \times {\mathrm{GL}}_1 \to {\mathrm{P}}({\mathrm{GL}}_{n-1} \times {\mathrm{GL}}_1)$
is an isomorphism, so there is a map
$\phi \colon {\mathrm{P}}({\mathrm{GL}}_{n-1} \times {\mathrm{GL}}_1) \cong {\mathrm{GL}}_{n-1} \to {\mathrm{PGL}}_{n-1} \times F^\times$
where the second map is $({\mathrm{pr}},\det)$. We use this to produce a
diagram
$$\begin{tikzcd} & \arrow{ld}[swap]{({\mathrm{pr}},\det)} {\mathrm{GL}}_{n-1} \times {\mathrm{GL}}_1 \arrow{rd}{(({\mathrm{pr}},\det),({\mathrm{pr}},\det))} & \\[-7pt]
{\mathrm{P}}({\mathrm{GL}}_{n-1} \times {\mathrm{GL}}_1) \times F^\times \dar{\phi \times {\mathrm{id}}} & &  {\mathrm{PGL}}_{n-1} \times F^\times \times {\mathrm{PGL}}_1 \times F^\times \dar{\cong} \\[-2pt]
{\mathrm{PGL}}_{n-1} \times F^\times \times F^\times & & {\mathrm{PGL}}_{n-1} \times F^\times \times F^\times \arrow[dashed]{ll}[swap]{{\mathrm{id}}\times {\mathrm{sh}}}
\end{tikzcd}$$ where the left composition is given by
$(A,\lambda) \mapsto ([A],\lambda^{-(n-1)}\det(A),\lambda\det(A))$ and
the right composition is given by
$(A,\lambda) \mapsto ([A],\det(A),\lambda)$. Thus we can make it commute
by setting the dashed map to be
$([A],\mu,\lambda) \mapsto ([A],\lambda^{-(n-1)}\mu,\lambda\mu)$. ◻
:::

We will now use this to establish
[107](#prop:cobr-vs-sigma-component){reference-type="ref+label"
reference="prop:cobr-vs-sigma-component"} comparing the cobracket to the
$\sigma$-component.

::: proof
*Proof of
[107](#prop:cobr-vs-sigma-component){reference-type="ref+label"
reference="prop:cobr-vs-sigma-component"}.* We start by recalling from
[69](#prop:cobracket-via-coproduct){reference-type="ref+label"
reference="prop:cobracket-via-coproduct"} that the cobracket is induced
by the antisymmetrisation of the reduced coproduct as
$\delta = {\overline{\Delta}}-\sigma \circ {\overline{\Delta}}$; here
$\delta_{n-1,1} = \Delta_{n-1,1} - \sigma \circ \Delta_{1,n-1}$. We
specialise the commutative square of
[108](#lem:delta-vs-pdelta){reference-type="ref+label"
reference="lem:delta-vs-pdelta"} to $*=1$:
$$\begin{tikzcd} H_1({\mathrm{GL}}_n;{\mathrm{St}}^{\infty}_n) \dar{\cong}[swap]{\varpi_n} \rar{\Delta_{n-1,1} - \sigma \circ \Delta_{1,n-1}} &[20pt] \big(H_{*+1}({\mathrm{GL}}_{n-1};{\mathrm{St}}^{\infty}_{n-1}) \otimes \Lambda^* F^\times\big)_1 \dar{\cong}[swap]{\varpi_{n-1} \otimes {\mathrm{id}}} \\[-5pt]
H_1({\mathrm{PGL}}_n;{\mathrm{St}}^{\infty}_n) \otimes \Lambda^0 F^\times \rar{} & \big(H_{*+1}({\mathrm{PGL}}_{n-1};{\mathrm{St}}^{\infty}_{n-1}) \otimes \Lambda^* F^\times \otimes \Lambda^* F^\times\big)_1\end{tikzcd}$$
where the bottom horizontal map is
$$({\mathrm{id}}\otimes {\mathrm{sh}}_*)^{-1} \circ (({\mathrm{P}}\Delta_{n-1,1}-\sigma \circ {\mathrm{P}}\Delta_{1,n-1}) \otimes {\mathrm{id}}).$$
Here we have used the assumption that $n\geq 2$ and hence the
coinvariants of ${\mathrm{St}}^{\infty}_n$ vanish, to see that the left
vertical map reduces to an isomorphism
$\varpi_n \colon H_1({\mathrm{GL}}_n;{\mathrm{St}}^{\infty}_n) \smash{\overset{\cong}\longrightarrow} H_1({\mathrm{PGL}}_n;{\mathrm{St}}^{\infty}_n)$.

For $n=2$, ${\mathrm{PGL}}_1$ is trivial and applying
${\mathrm{P}}\Delta_{1,1}-\sigma \circ {\mathrm{P}}\Delta_{1,1}$ we land
in the summand
${\mathds{Q}} \otimes \Lambda^2 F^\times \otimes \Lambda^0 F^\times$ of
${\mathds{Q}} \otimes (\Lambda^* F \otimes \Lambda^* F)_2$. The map
$({\mathrm{id}}\otimes {\mathrm{sh}}_*)^{-1}$ sends this into the
subspace spanned by elements of the form
$1 \otimes (x \wedge y) \otimes 1 + 1 \otimes 1 \otimes (x \wedge y)-1 \otimes x \wedge y$,
where we consider $\Lambda^2 F^\times$ as summand of
$F^\times \otimes F^\times$. Here we have used that if we write
$F^\times$ additively, we can identify the homomorphisms $A$ and
$A^{-1}$ with the matrices
$$A = \begin{bmatrix} 1 & -(n-1) \\ 1 & 1 \end{bmatrix} \qquad \text{and} \qquad A^{-1} = \frac{1}{n} \begin{bmatrix} 1 & n-1 \\ -1 & 1 \end{bmatrix}.$$
Moreover, ${\mathrm{GL}}_1 = F^\times$,
${\mathrm{St}}^{\infty}_1 = {\mathds{Q}}$, and $\varpi_1$ is the usual
identification. By definition, the projection of
$\Delta_{1,1}-\sigma \circ \Delta_{1,1}$ onto
${\mathds{Q}} \otimes \Lambda^2 F^\times \cong \Lambda^2 F^\times \otimes {\mathds{Q}}$
yields the $\sigma$-component $\delta_\sigma$ and projection to
${\mathds{Q}} \otimes \Lambda^2 F^\times$ yields the cobracket
$\delta_{1,1}$. The restrictions we found above on the image thus imply
$\delta_\sigma = -\delta_{1,1}$.

For $n \geq 3$ we argue similarly, but now applying
${\mathrm{P}}\Delta_{n-1,1}-\sigma \circ {\mathrm{P}}\Delta_{1,n-1}$ we
land in the summands
$H_1({\mathrm{PGL}}_{n-1};{\mathrm{St}}_{n-1}) \otimes \Lambda^1 F^\times \otimes \Lambda^0 F^\times$
and
$H_2({\mathrm{PGL}}_{n-1};{\mathrm{St}}_{n-1}) \otimes \Lambda^0 F^\times \otimes \Lambda^0 F^\times$.
The map $({\mathrm{id}}\otimes {\mathrm{sh}}_*)^{-1}$ fixes the latter
pointwise, but sends the former into the subspace spanned by
$x \otimes y \otimes 1-x \otimes 1 \otimes y$. By definition the
projection of
$(\varpi_{n-1} \otimes \varpi_1) \circ (\Delta_{n-1,1}-\sigma \circ \Delta_{n-1,1})$
to
$H_1({\mathrm{PGL}}_{n-1};{\mathrm{St}}_{n-1}) \otimes \Lambda^1 F^\times \otimes \Lambda^0 F^\times$
is the first part of the $\sigma$-component
${\mathrm{pr}}_1 \delta_\sigma$ and its projection to
$H_1({\mathrm{PGL}}_{n-1};{\mathrm{St}}_{n-1}) \otimes \Lambda^0 F^\times \otimes \Lambda^1 F^\times$
is the cobracket $\delta_{n-1,1}$. The restriction found above on the
image thus implies ${\mathrm{pr}}_1 \delta_\sigma = -\delta_{n-1,1}$. ◻
:::

### The rank $2$ case.

In this subsection we describe a more elementary approach to think of
the cobracket in rank $2$,
$$\delta \colon H_{2,d}^{E_\infty}({\mathrm{BGL}}(F)_{\mathds{Q}}) \longrightarrow(\Lambda^2 H_{1,*}^{E_\infty}({\mathrm{BGL}}(F)_{\mathds{Q}}))_{d+1}$$
and connect it to previous computations in the literature. This is not
used in the remainder of this paper.

Recall that the counit
${\mathrm{fgt}}_{E^{\mathrm{nu}}_\infty} {\mathrm{triv}}_{E^{\mathrm{nu}}_\infty} \simeq {\mathrm{id}}$
is an equivalence of endofunctors of
${\mathrm{Fun}}({\mathds{N}},{{\mathscr{D}}_{\mathds{Q}}})$.
Precomposing it with ${\mathrm{cot}}_{E^{\mathrm{nu}}_\infty}$ and using
the unit of the adjunction
${\mathrm{cot}}_{E^{\mathrm{nu}}_\infty} \dashv {\mathrm{triv}}_{E^{\mathrm{nu}}_\infty}$
yields a natural transformation of functors
${\mathrm{Alg}}_{E_\infty^{\mathrm{nu}}}({\mathrm{Fun}}({\mathds{N}},{{\mathscr{D}}_{\mathds{Q}}})) \to {\mathrm{Fun}}({\mathds{N}},{{\mathscr{D}}_{\mathds{Q}}})$
$${\mathrm{pr}}_{E^{\mathrm{nu}}_\infty} \colon {\mathrm{fgt}}_{E^{\mathrm{nu}}_\infty} \longrightarrow{\mathrm{cot}}_{E^{\mathrm{nu}}_\infty}.$$
We use this to define the *decomposables* functor $$\begin{align*}
{\mathrm{dec}}_{E^{\mathrm{nu}}_\infty} \colon  {\mathrm{Alg}}_{E_\infty^{\mathrm{nu}}}({\mathrm{Fun}}({\mathds{N}},{{\mathscr{D}}_{\mathds{Q}}})) &\longrightarrow{\mathrm{Fun}}({\mathds{N}},{{\mathscr{D}}_{\mathds{Q}}}) \\
{\mathbf{R}} &\longmapsto {\mathrm{fib}}\big[{\mathrm{pr}}_{E^{\mathrm{nu}}_\infty} \colon {\mathrm{fgt}}_{E_\infty^{\mathrm{nu}}}({\mathbf{R}}) \to {\mathrm{cot}}_{E_\infty^{\mathrm{nu}}}({\mathbf{R}})\big].
\end{align*}$$

To compute with this, we use the rectification results of
[12.4](#sec:rect-dg){reference-type="ref+label" reference="sec:rect-dg"}
to assume that
${\mathbf{R}} \in {\mathrm{Alg}}_{E^{\mathrm{nu}}_\infty}({\mathrm{Fun}}({\mathds{N}},{{\mathscr{D}}_{\mathds{Q}}}))_{\geq 1}$
is modelled by a dg-commutative algebra with additional rank grading. In
this case, the decomposables admit a description in terms of the
commutative bar construction of
[215](#def:bar-comm){reference-type="ref+label"
reference="def:bar-comm"}.

::: lemma
**Lemma 109**. *If
${\mathbf{R}} \in {\mathrm{Alg}}_{{\mathrm{Com}}^{\mathrm{nu}}}({\mathrm{Fun}}({\mathds{N}},{\mathrm{Ch}}_{\mathds{Q}}))_{\geq 1}$
then there is a natural equivalence
$${\mathrm{dec}}_{E^{\mathrm{nu}}_\infty}({\mathbf{R}}) \simeq  \Sigma^{-1} B^{\mathrm{Com}}({\mathbf{R}})_{\ge 2} = \Sigma^{-2} ({\mathrm{coLie}}_{\ge 2} \circ \Sigma {\mathbf{R}}, d_{\mathbf{R}}+d_B)$$
so that the canonical map
${\mathrm{dec}}_{E^{\mathrm{nu}}_\infty}({\mathbf{R}}) \to {\mathrm{fgt}}_{E^{\mathrm{nu}}_\infty}{\mathbf{R}}$
is induced by the multiplication on $R$. In particular, there is a
natural map
$${\mathrm{inc}}\colon S^2({\mathbf{R}}) \simeq  \Sigma^{-2} {\mathrm{coLie}}(2) \otimes_{{\mathfrak{S}}_2} (\Sigma {\mathbf{R}})^{\otimes 2} \overset{\subset}\longrightarrow\Sigma^{-1} B^{\mathrm{Com}}({\mathbf{R}})_{\ge 2} \overset{\simeq}\longrightarrow{\mathrm{dec}}_{E^{\mathrm{nu}}_\infty}({\mathbf{R}}).$$*
:::

::: proof
*Proof.* The equivalence
$B^{\mathrm{Com}}({\mathbf{R}}) \simeq {\mathrm{cot}}_{E^{\mathrm{nu}}_\infty}({\mathbf{R}})$
is such that the canonical map ${\mathrm{pr}}_{E^{\mathrm{nu}}_\infty}$
can be identified with the inclusion
${\mathbf{R}} \cong B^{\mathrm{Com}}({\mathbf{R}})_{\le 1} \hookrightarrow B^{\mathrm{Com}}({\mathbf{R}})$.
The result then follows by taking the mapping cone. ◻
:::

The next lemma will be the key to computing the cobracket in rank $2$
and requires us to introduce one further construction. For
${\mathbf{R}} \in {\mathrm{Alg}}_{{\mathrm{Com}}^{\mathrm{nu}}}({\mathrm{Fun}}({\mathds{N}},{\mathrm{Ch}}_{\mathds{Q}}))_{\geq 1}$
we introduce the following cofibre in
${\mathrm{Fun}}({\mathds{N}},{\mathrm{Ch}}_{\mathds{Q}})$
$$Q({\mathbf{R}}) \coloneq {\mathrm{cofib}}\big[S^2({\mathbf{R}}) \xrightarrow{m}  {\mathrm{fgt}}_{E^{\mathrm{nu}}_\infty}{\mathbf{R}}\big]$$
where $m$ denotes the multiplication. There is a map of cofibre
sequences in ${\mathrm{Fun}}({\mathds{N}},{\mathrm{Ch}}_{\mathds{Q}})$
$$\begin{tikzcd} S^2({\mathbf{R}}) \rar{m} \dar{{\mathrm{inc}}} & {\mathrm{fgt}}_{E^{\mathrm{nu}}_\infty} {\mathbf{R}} \dar[equal] \rar & Q({\mathbf{R}}) \dar[dashed] \\[-5pt]
{\mathrm{dec}}_{E_\infty^{\mathrm{nu}}}({\mathbf{R}}) \rar & {\mathrm{fgt}}_{E_\infty^{\mathrm{nu}}}({\mathbf{R}}) \rar{{\mathrm{pr}}_{E_\infty^{\mathrm{nu}}}} & {\mathrm{cot}}_{E_\infty^{\mathrm{nu}}}({\mathbf{R}})\end{tikzcd}$$
where the dashed map is induced.

::: lemma
**Lemma 110**. *Let
${\mathbf{R}} \in {\mathrm{Alg}}_{{\mathrm{Com}}^{\mathrm{nu}}}({\mathrm{Fun}}({\mathds{N}},{\mathrm{Ch}}_{\mathds{Q}}))$,
then the following diagram commutes after taking homology
$$\begin{tikzcd}
Q({\mathbf{R}})
  \rar
  \dar{\partial}
&[20pt]
{\mathrm{cot}}_{E_\infty}({\mathbf{R}})
  \dar{\Sigma^{-1}\delta}
\\[-5pt]
\Sigma S^2 {\mathbf{R}}
  \rar[swap]{\Sigma S^2 {\mathrm{pr}}_{E_\infty}}  &
  \Sigma S^2 {\mathrm{cot}}_{E_\infty}({\mathbf{R}})
\end{tikzcd}$$ where $\delta$ is obtained from the Lie cobracket
$$\Sigma {\mathrm{cot}}_{E_\infty}({\mathbf{R}}) \overset{\delta}\longrightarrow{\mathrm{coLie}}(2) \otimes_{S_2}(\Sigma {\mathrm{cot}}_{E_\infty}({\mathbf{R}}))^{\otimes 2} \simeq \Sigma^2 S^2 {\mathrm{cot}}_{E_\infty}({\mathbf{R}})$$
and $\partial$ the connecting homomorphism of the cofibre sequence
$S^2 {\mathbf{R}} \to {\mathrm{fgt}}_{E_\infty} {\mathbf{R}} \to Q({\mathbf{R}})$.*
:::

::: proof
*Proof.* First we prove this for
${\mathbf{R}}={\mathrm{triv}}_{{\mathrm{E_\infty}}}(A)$ for some
$A \in {\mathrm{Fun}}({\mathds{N}},{{\mathscr{D}}_{\mathds{Q}}})$. In
this case we have (1)
$m \colon S^2{\mathbf{R}} \to {\mathrm{fgt}}_{E_\infty}{\mathbf{R}}$ is
the zero map $S^2 A \to A$ and hence
$Q({\mathbf{R}}) \simeq A \oplus \Sigma S^2 A$, (2)
${\mathrm{cot}}_{E_\infty}({\mathbf{R}}) \simeq B^{\mathrm{Com}}({\mathbf{R}}) \simeq \Sigma^{-1}{\mathrm{{\mathrm{coLie}}}}(\Sigma A)$
and the map
$Q({\mathbf{R}}) \to {\mathrm{cot}}_{E_\infty}({\mathbf{R}})$ is just
the inclusion of the first two summands, (3)
${\mathrm{pr}}_{E_\infty} \colon{\mathrm{fgt}}_{E_\infty}({\mathbf{R}}) \simeq A \to {\mathrm{cot}}_{E_\infty}({\mathbf{R}}) \simeq  \Sigma^{-1}{\mathrm{{\mathrm{coLie}}}}(\Sigma A)$
is the inclusion of the first term, and (4) the cobracket is that of the
cofree Lie coalgebra under the equivalence
${\mathrm{cot}}_{E_\infty}({\mathbf{R}}) \simeq  \Sigma^{-1}{\mathrm{{\mathrm{coLie}}}}(\Sigma A)$.
Then the result follows since the following diagram commutes
$$\begin{tikzcd}
A \oplus \Sigma S^2 A
  \rar{{\mathrm{inc}}}
  \dar{{\mathrm{pr}}_2}
&[20pt] 
\Sigma^{-1}{\mathrm{{\mathrm{coLie}}}}(\Sigma A)
  \dar{\Sigma^{-1}\delta_{\mathrm{cofree}}}
\\[-5pt]
\Sigma S^2 A
  \rar{\Sigma S^2\mathrm{incl}} & \Sigma S^2(\Sigma^{-1}{\mathrm{{\mathrm{coLie}}}}(\Sigma A)).
\end{tikzcd}$$

In the general case, for
${\mathbf{R}} \in {\mathrm{Alg}}_{{\mathrm{Com}}^{\mathrm{nu}}}({\mathrm{Fun}}({\mathds{N}},{{\mathscr{D}}_{\mathds{Q}}}))$
there is a canonical algebra map
$$\nu \colon {\mathbf{R}} \longrightarrow{\mathrm{triv}}_{{\mathrm{E_\infty}}} {\mathrm{cot}}_{E_\infty} {\mathbf{R}}.$$
Let us denote $A \coloneq {\mathrm{cot}}_{E_\infty}({\mathbf{R}})$ and
observe ${\mathrm{cot}}_{E_\infty} \nu$ is the inclusion
$A \hookrightarrow \Sigma^{-1} {\mathrm{{\mathrm{coLie}}}}(\Sigma A)$.
Thus the map
$$\Sigma S^2 {\mathrm{cot}}_{E_\infty} {\mathbf{R}} \xrightarrow{ \Sigma S^2 {\mathrm{cot}}_{E_\infty} \nu} \Sigma S^2 (\Sigma^{-1} {\mathrm{{\mathrm{coLie}}}}(\Sigma A))$$
is injective in homology. To prove the result it suffices to prove it
after post-composing with the map
$\Sigma S^2 {\mathrm{cot}}_{E_\infty} \nu$ and taking homology, reducing
it to the previous case by naturality. ◻
:::

Recall that if ${\mathbf{R}}(0) \simeq 0$ we say it is *reduced*. In
this case the canonical maps
$S^2 ({\mathbf{R}}(1)) \to (S^2 {\mathbf{R}})(2) \to {\mathrm{dec}}_{E_\infty}({\mathbf{R}})(2)$
are both equivalences. Thus, both of the following maps are also
equivalences
$$\frac{{\mathbf{R}}(2)}{S^2 ({\mathbf{R}}(1))} \xrightarrow{\simeq }Q({\mathbf{R}})(2) \xrightarrow{\simeq} {\mathrm{cot}}_{E_\infty}({\mathbf{R}})(2).$$
Moreover, it also follows from the formula for $B^{\mathrm{Com}}$ that
${\mathrm{fgt}}_{E_\infty}{\mathbf{R}}(1) \xrightarrow{{\mathrm{pr}}_{E_\infty}} {\mathrm{cot}}_{E_\infty}({\mathbf{R}})(1)$
is an equivalence. Thus, we have a commutative diagram $$\begin{tikzcd}
H_d({\mathbf{R}}(2),S^2({\mathbf{R}}(1)))
  \rar{\simeq}
  \dar{\partial}
&
H_{2,d}^{E_\infty}({\mathbf{R}})
  \dar{\delta}
\\[-5pt]
(S^2 H_{1,*}({\mathbf{R}}))_{d-1}
  \rar{\simeq} & (S^2 H_{1,*}^{E_\infty}({\mathbf{R}}))_{d-1}
\end{tikzcd}$$

::: corollary
**Corollary 111**. *If
${\mathbf{R}} \in {\mathrm{Alg}}_{{\mathrm{Com}}^{\mathrm{nu}}}({\mathrm{Fun}}({\mathds{N}},{\mathrm{Ch}}_{\mathds{Q}}))_{\geq 1}$
is reduced then the cobracket on the $E_\infty$-homology groups in rank
$n=2$ is computed by
$$\partial \colon H_d({\mathbf{R}}(2),S^2({\mathbf{R}}(1))) \longrightarrow H_{2,d-1}(S^2 {\mathbf{R}}) \simeq (S^2 H_{1,*}({\mathbf{R}}))_{d-1}$$
under the canonical equivalences
$H_d({\mathbf{R}}(2),S^2({\mathbf{R}}(1))) \simeq H_{2,d}^{E_\infty}({\mathbf{R}})$
and
$(S^2 H_{1,*}({\mathbf{R}}))_{d-1} \simeq (S^2 H_{1,*}^{E_\infty}({\mathbf{R}}))_{d-1}$*
:::

Let us apply this to ${\mathbf{R}}={\mathbf{BGL}}_{\mathds{Q}}$,
implicitly fixing a field $F$, and $d=3$. First, one can use the proof
of [@GKRW20 Theorem 9.1] to build an explicit inverse map
$$B_2(F) \cong H_{2,3}^{E_\infty}({\mathbf{BGL}}_{\mathds{Q}}) \overset{\cong}\longrightarrow H_3({\mathbf{BGL}}_{\mathds{Q}}(2), S^2 {\mathbf{BGL}}_{\mathds{Q}}(1)) \cong  H_3({\mathrm{GL}}_2,{\mathrm{GM}}_2;{\mathds{Q}})$$
and then [@GKRW20 (9.3)] identifies $\partial$ as follows: as
$H_{1,*}({\mathrm{BGL}}(F)_{\mathds{Q}}) \cong \Lambda^* F^\times_{\mathds{Q}}$
canonically, we have a preferred isomorphism $$\begin{align*}
(S^2 H_{1,*}({\mathrm{BGL}}(F)_{\mathds{Q}})_2 &\cong \Lambda^2 H_{1,1}({\mathrm{BGL}}(F)_{\mathds{Q}}) \oplus H_{1,0}({\mathrm{BGL}}(F)_{\mathds{Q}}\otimes H_{1,2}({\mathrm{BGL}}(F)_{\mathds{Q}}) \\
&\cong \Lambda^2 F^\times_{\mathds{Q}}\oplus {\mathds{Q}}\{\sigma\} \otimes (\Lambda^2 F^\times_{\mathds{Q}})
\end{align*}$$ and then the map $\partial$ is given by (using work of
Suslin [@Sus90] and Mirzaii [@Mirzaii; @MirzaiiErratum])
$$\begin{align*}
\partial \colon B_2(F) &\longrightarrow\Lambda^2 F^\times_{\mathds{Q}}\oplus {\mathds{Q}}\{\sigma\} \otimes (\Lambda^2 F^\times_{\mathds{Q}}) \\
{x}_2 &\longmapsto ((x) \wedge (1-x), \sigma \otimes (- (x) \wedge (1-x))),
\end{align*}$$ which both recovers our computation of the cobracket
$B_2(F) \cong \mathcal{G}_2(F) \to \Lambda^2 \mathcal{G}_1(F)) \cong \Lambda^2 F^\times_{\mathds{Q}}$
and shows in this case explicitly the relationship
$\delta_\sigma=-\delta$ between the $\sigma$-component and the
cobracket.

## The relationship of $\mathscr{G}(F)$ to polylogarithms

In this section we discuss the Lie coalgebra $\mathscr{G}(F)$ in more
details. We start by spelling out how the results of
[5](#sec:cobracket){reference-type="ref+label"
reference="sec:cobracket"} yield
[\[thm:polyl-presentation-additive\]](#thm:polyl-presentation-additive){reference-type="ref+label"
reference="thm:polyl-presentation-additive"}. We next identify
$\mathscr{G}_n(F)$ for $n \leq 3$ in terms of more classical definitions
proving
[\[thm:polyl-identification\]](#thm:polyl-identification){reference-type="ref+label"
reference="thm:polyl-identification"}. This requires the construction of
several families of relations in $\mathscr{G}_n(F)$ that may be of
independent interest. We finally explain how
[\[thm:polyl-presentation-additive\]](#thm:polyl-presentation-additive){reference-type="ref+label"
reference="thm:polyl-presentation-additive"} implies the existence of a
map to the Lie coalgebra of formal polylogarithms of Charlton,
Matveiakin, Radchenko, and Rudenko [@CMRR24], yielding Hodge and motivic
realisations and thus proving Theorems
[\[thm:motivic-realisation\]](#thm:motivic-realisation){reference-type="ref"
reference="thm:motivic-realisation"} and
[\[thm:hodge-realisation\]](#thm:hodge-realisation){reference-type="ref"
reference="thm:hodge-realisation"}.

::: {#conv:less-short .convention}
**Convention 112**. We fix a field $F$ but do not suppress it from the
notation. We work rationally and suppress this from the notation unless
there is a risk of confusion, e.g. write $F^\times$ for
$F^\times_{\mathds{Q}}$.
:::

### Generators and relations

We now prove
[\[thm:polyl-presentation-additive\]](#thm:polyl-presentation-additive){reference-type="ref+label"
reference="thm:polyl-presentation-additive"}:

The Lie coalgebra $\mathscr{G}(F)$ is generated by correlators
$$\mathrm{Cor}^{\mathscr{G}}(x_0,x_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n) \in {\mathscr{G}}_n(F) \qquad \text{for $x_0,\ldots,x_n \in F$ not all equal}$$
subject to the following relations:

1.  Homogeneity:
    $\mathrm{Cor}^{\mathscr{G}}(x_0,x_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n)=\mathrm{Cor}^{\mathscr{G}}(x_0+b,x_1+b,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n+b)$
    for $b\in F$.

2.  Cyclic symmetry:
    $\mathrm{Cor}^{\mathscr{G}}(x_0,x_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n)=\mathrm{Cor}^{\mathscr{G}}(x_1,x_2,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_0)$.

3.  Shuffle relations:
    $$\sum_{\sigma \in {\mathrm{Sh}}(n_1,n_2)} \mathrm{Cor}^{\mathscr{G}}(x_0,x_{\sigma(1)},\cdots,x_{\sigma(n_1+n_2)}) =0 \quad 
    \text{for $n=n_1+n_2$, $n_1,n_2>0$.}$$

4.  Decomposition relations: $$\begin{align*}
        &\mathrm{Cor}^\mathscr{G}(x_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n)-\mathrm{Cor}^\mathscr{G}(y_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},y_n)\\
         &=\sum_{\iota=((i_1,j_1),\dots,(i_{n},j_n))\in T(n)}{\mathrm{sign}}(\iota)\,
         \mathrm{Cor}^\mathscr{G}\left(0,\frac{x_{i_1}-x_{j_1}}{y_{i_1}-y_{j_1}},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},\frac{x_{i_n}-x_{j_n}}{y_{i_n}-y_{j_n}}\right),
    \end{align*}$$ where we omit terms with $y_{i_k}=y_{j_k}$ for some
    k, and the set $T(n)$ as well as the sign ${\mathrm{sign}}(\iota)$
    are as in
    [26](#prop:universal-symbol-combinatorics){reference-type="ref+label"
    reference="prop:universal-symbol-combinatorics"}.

::: remark
*Remark 113*. These relations are redundant, e.g. homogeneity follows
from the decomposition relations. We believe cyclic symmetry also
follows from the decomposition relations, but this is left an exercise
to the interested reader.
:::

::: proof
*Proof of
[\[thm:polyl-presentation-additive\]](#thm:polyl-presentation-additive){reference-type="ref+label"
reference="thm:polyl-presentation-additive"}.* Recall the presentation
of the Lie coalgebra $\mathscr{G}(F)$ from
[87](#prop:presentation for G(F)){reference-type="ref+label"
reference="prop:presentation for G(F)"}: for a vector space $V$ of
dimension $n \geq 1$ over $F$ we have
$${\mathscr{G}}(V)\overset{\cong}{\longrightarrow} \frac{{\mathds{Q}}\{[h] \otimes \mathrm{FC}[u_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n] \text{ for nonzero functionals $h$ and affine bases $u_0,\ldots,u_n$}\}}{\text{\eqref{enum:fc-relations-i}--\eqref{enum:gd-relation-v}}},$$
with the following relations:

1.  Homogeneity:
    ${\mathrm{FC}}[u_0:\cdots:u_n] = {\mathrm{FC}}[u_0-u:\cdots:u_n-u]$
    for any $u \in V$.

2.  Cyclic symmetry:
    ${\mathrm{FC}}[u_0:u_1:\cdots:u_n] = {\mathrm{FC}}[u_1:u_2:\cdots:u_0]$.

3.  Shuffle relations:
    $$\sum_{\sigma \in {\mathrm{Sh}}(n_1,n_2)} {\mathrm{FC}}[u_0:u_{\sigma(1)}:\cdots:u_{\sigma(n_1+n_2)}] =0 \quad \text{for $n=n_1+n_2$ with $n_1,n_2>0$.}$$

4.  Coinvariant relations:
    $$[h] \otimes \mathrm{FC}[u_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n] = [g^*h] \otimes \mathrm{FC}[gu_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:gv_n] \qquad \text{for $g \in {\mathrm{GL}}(V)$}.$$

5.  Decomposition relations:
    $$\qquad [h_2] \otimes \mathrm{FC}[u_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n]-[h_1] \otimes \mathrm{FC}[u_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n]+[h_1] \otimes D^\mathrm{FC}_{h_2}(\mathrm{FC}[u_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n])=0.$$

To get the generating set of correlators, we define
$$\mathrm{Cor}^{\mathscr{G}}(x_0,x_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n) \in {\mathscr{G}}(V)$$
as the image of an element
$[h] \otimes \mathrm{FC}[u_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}: u_n]$
for $h(u_i) = x_i \in F$.

To get the relations, we reformulate
[87](#prop:presentation for G(F)){reference-type="ref+label"
reference="prop:presentation for G(F)"} more explicitly. To do so, we
first make the decomposition operator more explicit. Recall from
[\[eqn:dec-fc\]](#eqn:dec-fc){reference-type="eqref"
reference="eqn:dec-fc"} the definition of the decomposition operator as
$D^\mathrm{FC}_h = {\mathrm{C}}^\mathrm{FC}_h \circ s_H \circ {\mathrm{pr}}^{\mathrm{St}}$
in terms of four steps: it is given by

(i) []{#eqn:decomposition-steps-i label="eqn:decomposition-steps-i"} we
    map a formal correlator to a Steinberg correlator,

(ii) []{#eqn:decomposition-steps-ii label="eqn:decomposition-steps-ii"}
     take its symbol,

(iii) []{#eqn:decomposition-steps-iii
      label="eqn:decomposition-steps-iii"} project onto those terms
      where no line in contained in $H = \ker(h)$, and

(iv) []{#eqn:decomposition-steps-iv label="eqn:decomposition-steps-iv"}
     take formal correlators with entries the unique vectors in the
     lines on which the functional $h$ takes the value $1$.

This yields that the decomposition operator has the following explicit
form: using the universal formula for the symbol from
[26](#prop:universal-symbol-combinatorics){reference-type="ref+label"
reference="prop:universal-symbol-combinatorics"} to implement step
[\[eqn:decomposition-steps-ii\]](#eqn:decomposition-steps-ii){reference-type="ref+label"
reference="eqn:decomposition-steps-ii"}, there exists unique set $T(n)$
of pairs of indices and a unique sign function sending $\iota \in T(n)$
to ${\mathrm{sign}}(\iota)\in\{\pm 1\}$ such that $$\begin{equation}
\label{eqn:dec-explicit}\begin{aligned}
&D^\mathrm{FC}_h(\mathrm{FC}[u_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n])\\
&=\sum_{\iota=((i_1,j_1),\dots,(i_{n},j_n))\in T(n)}{\mathrm{sign}}(\iota)
\mathrm{FC}\left[0:\frac{u_{i_1}-u_{j_1}}{h(u_{i_1})-h(u_{j_1})}:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:\frac{u_{i_n}-u_{j_n}}{h(u_{i_n})-h(u_{j_n})}\right],
\end{aligned}
\end{equation}$$ where we omit the terms $\iota$ with
$h(u_{i_k})=h(u_{j_k})$ for some $k$. Here the omission of certain term
occurs in the step
[\[eqn:decomposition-steps-iii\]](#eqn:decomposition-steps-iii){reference-type="eqref"
reference="eqn:decomposition-steps-iii"} when projecting.

Then, relations (1), (2) and (3) above give the respective homogeneity
[\[enum:rel-goncharov-1\]](#enum:rel-goncharov-1){reference-type="eqref"
reference="enum:rel-goncharov-1"}, cyclic symmetry
[\[enum:rel-goncharov-2\]](#enum:rel-goncharov-2){reference-type="eqref"
reference="enum:rel-goncharov-2"}, and shuffle relations
[\[enum:rel-goncharov-3\]](#enum:rel-goncharov-3){reference-type="eqref"
reference="enum:rel-goncharov-3"} for correlators in
[\[thm:polyl-presentation-additive\]](#thm:polyl-presentation-additive){reference-type="ref+label"
reference="thm:polyl-presentation-additive"}. The coinvariant relations
(4) above show that the elements
$\mathrm{Cor}^\mathscr{G}(x_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n) \in \mathscr{G}(F)$
are well-defined. Finally, the decomposition relations (5) above give
the decomposition relations for correlators
[\[enum:rel-goncharov-4\]](#enum:rel-goncharov-4){reference-type="eqref"
reference="enum:rel-goncharov-4"} by evaluating
[\[eqn:dec-explicit\]](#eqn:dec-explicit){reference-type="eqref"
reference="eqn:dec-explicit"} for $h_1, h_2$ such that $h_1(u_i)=x_i$
and $h_2(u_i)=y_i$. ◻
:::

We next note consequences of these relations. The shuffle relation
[\[enum:rel-goncharov-3\]](#enum:rel-goncharov-3){reference-type="eqref"
reference="enum:rel-goncharov-3"} implies that for any presentation
$n=n_1+n_2$ we have
$${\textstyle{n_1+n_2 \choose n_1}}\,\mathrm{Cor}^\mathscr{G}(x_0,\underbrace{x_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_1}_n)=0 \quad \text{for } n\geq 2,$$
and since $\mathscr{G}(F)$ is a ${\mathds{Q}}$-vector space, it follows
that $$\begin{equation}
\label{eqn:cor vanishing}
\mathrm{Cor}^\mathscr{G}(x_0,\underbrace{x_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_1}_n)=0 \quad \text{for } n\geq 2.
\end{equation}$$

::: {#lemma: multiplicative homogenity relation for correlators .lemma}
**Lemma 114**. *The following identity holds for $n \geq 2$:
$$\mathrm{Cor}^\mathscr{G}(ax_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},ax_n)=\mathrm{Cor}^\mathscr{G}(x_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}, x_n) \qquad \text{ for $a \in F^{\times}$}.$$*
:::

::: proof
*Proof.* We apply the decomposition relation
[\[enum:rel-goncharov-4\]](#enum:rel-goncharov-4){reference-type="eqref"
reference="enum:rel-goncharov-4"} with $y_i=a x_i$. For any
$\iota \in T(n)$ we have
$$\mathrm{Cor}^\mathscr{G}\left(0,\frac{x_{i_1}-x_{j_1}}{y_{i_1}-y_{j_1}},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},\frac{x_{i_n}-x_{j_n}}{y_{i_n}-y_{j_n}}\right)=\mathrm{Cor}^\mathscr{G}\Bigl(0,\underbrace{\frac{1}{a},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},\frac{1}{a}}_n\Bigr)=0,$$
with right equality by
[\[eqn:cor vanishing\]](#eqn:cor vanishing){reference-type="eqref"
reference="eqn:cor vanishing"}, which yields the result. ◻
:::

::: {#lemma: reversal relation for correlators .lemma}
**Lemma 115**. *The following identity holds for $n\geq 1$:
$$\mathrm{Cor}^\mathscr{G}(x_0,x_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n)=(-1)^{n-1}\mathrm{Cor}^\mathscr{G}(x_0,x_n,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_1).$$*
:::

::: proof
*Proof.* This is a consequence of the shuffle relations
[\[enum:rel-goncharov-3\]](#enum:rel-goncharov-3){reference-type="eqref"
reference="enum:rel-goncharov-3"}. To see that, recall that the cofree
Lie coalgebra is the Lie coalgebra of indecomposable elements of the
Hopf algebra $\bigoplus_{n\geq 0} V^{\otimes n}$ with shuffle product
and deconcatenation coproduct. The antipode is given by the formula
[@GrinbergReiner Example 1.6.3]
$$S(v_1\otimes \dots \otimes v_n)=(-1)^n v_n\otimes \dots\otimes v_1$$
and thus acts by $(-1)$ on the Lie coalgebra of indecomposable elements.
It follows that in the cofree Lie coalgebra the projections of elements
$v_1\otimes \dots \otimes v_n$ and
$(-1)^{n-1} v_n\otimes \dots\otimes v_1$ coincide and from here the
statement follows. ◻
:::

::: {#proposition: generic correlators .proposition}
**Proposition 116**. *The vector space $\mathscr{G}_n(F)$ is spanned by
elements
$\mathrm{Cor}^\mathscr{G}(x_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n)$
such that $x_i\neq x_j$ for $i\neq j$.*
:::

::: proof
*Proof.* If the field $F$ is finite, $\mathscr{G}_n(F)=0$ and there is
nothing to prove, so we may assume that $F$ is infinite. Consider a
correlator
$\mathrm{Cor}^\mathscr{G}(y_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},y_n)$
where some of the arguments may coincide. Since $F$ is infinite, we can
choose a tuple of distinct elements $x_0,\dots,x_n \in F$ such that
$$\frac{x_i-x_j}{y_i-y_j} \neq \frac{x_k-x_l}{y_k-y_l}$$ for all
$i,j,k,l$ with $y_i\neq y_j$ and $y_k\neq y_l$. The decomposition
relation
[\[enum:rel-goncharov-4\]](#enum:rel-goncharov-4){reference-type="eqref"
reference="enum:rel-goncharov-4"} gives a presentation of the correlator
$\mathrm{Cor}^\mathscr{G}(y_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},y_n)$
as a linear combination of correlators with distinct arguments. ◻
:::

::: {#prop: injectivity Goncharov complex transcendental extensions .proposition}
**Proposition 117**. *The maps induced by the inclusion $F \to F(t)$
$$\mathscr{G}_n(F) \longrightarrow\mathscr{G}_n(F(t))$$ are injective
for any field $F$ and $n \ge 1$.*
:::

::: proof
*Proof.* The statement is trivial for finite $F$ since
$\mathscr{G}(F)=0$, so let us assume that $F$ is infinite. It suffices
to show that if element $\alpha \in \mathscr{G}_n(F)$ vanishes
$\mathscr{G}(F(t))$ then $\alpha$ must be zero. First, write $\alpha$ as
a rational linear combination of correlators with entries in $F$. Define
$\mathcal{R}_n(F(t)) \subseteq {\mathds{Q}}\{ \mathrm{Cor}^\mathscr{G}(x_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n) \mid x_0,\dots,x_n \in F(t)\}$
to be the subspace spanned by relations
[\[enum:rel-goncharov-1\]](#enum:rel-goncharov-1){reference-type="eqref"
reference="enum:rel-goncharov-1"}--[\[enum:rel-goncharov-4\]](#enum:rel-goncharov-4){reference-type="eqref"
reference="enum:rel-goncharov-4"} in
[\[thm:polyl-presentation-additive\]](#thm:polyl-presentation-additive){reference-type="ref+label"
reference="thm:polyl-presentation-additive"} for the field $F(t)$. That
$\alpha$ vanishes in $\mathscr{G}_n(F(t))$ means that
$\alpha \in \mathcal{R}(F(t))$ so we can find some $N \in {\mathds{N}}$,
rational functions $f_i^j \in F(t)$ for $0 \le i \le n$ and
$1 \le j \le N$, and rational numbers $\lambda_j$ for $1 \le j \le N$
such that
$$\alpha = \sum_{j=1}^N  \lambda_j \mathrm{Cor}^\mathscr{G}(f_0^j,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},f_n^j) \in \mathcal{R}_n(F(t)).$$
Now use that $F$ is infinite to pick $t_0 \in F$ such that all the
$f_i^j(t_0)$ are distinct and nonzero. By construction of the relations,
evaluating at $t_0$ sends relations in $\mathcal{R}_n(F(t))$ to
relations in $\mathcal{R}(F)$, so we get
$$\alpha = \sum_{j=1}^N  \lambda_j \mathrm{Cor}^\mathscr{G}(f_0^j(t_0),\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},f_n^j(t_0)) \in \mathcal{R}_n(F),$$
showing that the original class vanishes. ◻
:::

::: remark
*Remark 118*. Similar arguments as in
[117](#prop: injectivity Goncharov complex transcendental extensions){reference-type="ref+label"
reference="prop: injectivity Goncharov complex transcendental extensions"}
can be used to show that the maps
$$H_{n,d}^{E_\infty}({\mathbf{BGL}}(F)_{\mathds{Q}}) \longrightarrow H_{n,d}^{E_\infty}({\mathbf{BGL}}(F(t))_{\mathds{Q}}) \quad \text{and} \quad H^*(\mathscr{G}(F)) \longrightarrow H^*(\mathscr{G}(F(t)))$$
on $E_\infty$-homology, resp. Chevalley--Eilenberg homology, are always
injective.
:::

### Explicit description of $\mathscr{G}_1$ and $\mathscr{G}_2$ {#sec: G1 and G_2}

We now identify $\mathscr{G}_1(F)$ and $\mathscr{G}_2(F)$ in classical
terms, proving two-thirds of
[\[thm:polyl-identification\]](#thm:polyl-identification){reference-type="ref+label"
reference="thm:polyl-identification"}.

#### Explicit description of $\mathscr{G}_1$

First we show that the weight one component of the Lie coalgebra
$\mathscr{G}(F)$ is isomorphic to the rationalisation of the group of
units $F^\times$. From the preferred isomorphism
${\mathrm{St}}^{\infty}_1(F) \cong {\mathds{Q}}$, we obtain a preferred
isomorphism $$\begin{equation}
\label{eqn:isomorphism in weight 1}
    \mathscr{G}_1(F) = H_1({\mathrm{GL}}_1(F);{\mathrm{St}}^{\infty}_1(F))\cong H_1({\mathrm{GL}}_1(F);{\mathds{Q}}) \underset{\cong}{\overset{{\mathrm{ab}}}\longrightarrow} F^{\times}_{{\mathds{Q}}}.
\end{equation}$$

::: {#LemmaCorrelatorWeightOne .lemma}
**Lemma 119**. *Under the isomorphism
[\[eqn:isomorphism in weight 1\]](#eqn:isomorphism in weight 1){reference-type="eqref"
reference="eqn:isomorphism in weight 1"} an element
$(x_1-x_0)\in F^{\times}_{{\mathds{Q}}}$ corresponds to
$\mathrm{Cor}^\mathscr{G}(x_0, x_1)\in \mathscr{G}_1(F)$.*
:::

::: proof
*Proof.* Using homogeneity
[\[enum:rel-goncharov-1\]](#enum:rel-goncharov-1){reference-type="eqref"
reference="enum:rel-goncharov-1"}, it is sufficient to prove the
statement for $x_0=0$ and $x_1=a\in F^{\times}$. We analyse the exact
sequence
$$0 \longrightarrow\mathrm{FCR}(V) \longrightarrow\mathrm{FC}(V) \overset{p}\longrightarrow{\mathrm{St}}^{\infty}(V) \longrightarrow 0$$
for a one-dimensional vector space $V$. Choose a nonzero vector $e\in V$
and a functional $h\in V^{\vee}$ such that $h(e)=1$. We have an
isomorphism
$\mathrm{FC}(V)\smash{\stackrel{\cong}{\longrightarrow}} {\mathds{Q}}[F^{\times}/\{\pm 1\}]$
induced by the map sending $\mathrm{FC}[x_1e,x_2e]$ to
$[x_1-x_2]\in {\mathds{Q}}[F^{\times}/\{\pm 1\}]$.

The tautological exact sequence
$0\to I\to {\mathds{Q}}[F^{\times}]\to {\mathds{Q}}\to 0$ defining the
augmentation ideal induces an isomorphism
$H_1({\mathrm{GL}}_1(F);{\mathds{Q}}) \cong I_{{\mathrm{GL}}_1(F)}$, so
an element in $H_1({\mathrm{GL}}_1(F);{\mathds{Q}})$ corresponding to
$a\in F^{\times}$ is represented by $([a]-[1])\in I$. The natural chain
map
$$\begin{tikzcd} 0 \rar & I \rar \dar{}& {\mathds{Q}}[F^{\times}] \rar\dar{} & {\mathds{Q}}\rar\dar{\text{id}} & 0 \\[-5pt]
0 \rar & \mathrm{FCR}(V)  \rar & {\mathds{Q}}[F^{\times}/\{\pm 1\}] \rar &  {\mathds{Q}}\rar & 0 \end{tikzcd}$$
induces an isomorphism
$I_{{\mathrm{GL}}_1(F)} \cong \mathrm{FCR}(V)_{{\mathrm{GL}}_1(F)}$. The
map $I \to \mathrm{FCR}(V)$ sends $[a]-[1]\in I$ to
$\mathrm{FC}[0,ae]-\mathrm{FC}[0,e]$. The image of
$\mathrm{FC}[0,ae]-\mathrm{FC}[0,e]$ in coinvariants coincides with
$[h] \otimes \mathrm{FC}[0,ae]$ and thus equals
$\mathrm{Cor}^\mathscr{G}(0,a)$. ◻
:::

In other words, we have that there is an isomorphism $$\begin{align*}
 F^\times_{\mathds{Q}} &\overset{\cong}\longrightarrow{\mathscr{G}}_1(F) \\
a &\longmapsto \mathrm{Cor}^\mathscr{G}(0,a).
\end{align*}$$

::: remark
*Remark 120*. Alternatively, one may set $\{a\}_1 \coloneqq (1-a)^{-1}$
and then this isomorphism takes the form
$\{a\}_1 \mapsto -\mathrm{Cor}^\mathscr{G}(1,a)$ (the elements
$(1-a)^{-1}$ and $(a-1)^{-1}$ agree in $F^\times_{\mathds{Q}}$), which
is more in line with the other formulas in
[\[thm:polyl-identification\]](#thm:polyl-identification){reference-type="ref+label"
reference="thm:polyl-identification"} and is supposed to call to mind
that ${\mathrm{Li}}_1(z) = -\log(1-z)$.
:::

#### Explicit description of $\mathscr{G}_2$

Next we show that the weight two component of the Lie coalgebra
$\mathscr{G}(F)$ is isomorphic to the Bloch group.

::: definition
**Definition 121**. The *Bloch group* $B_2(F)$ is defined as a quotient
of the group ${\mathds{Z}}[F^{\times}\setminus \{1\}]$ by the subgroup
spanned by elements $$\begin{equation}
\label{Equation5term}
R_2(a,b)=[a]-[b]+\left [ \frac{b}{a}\right ] - \left [ \frac{1-a^{-1}}{1-b^{-1}}\right ] + \left [ \frac{1-a}{1-b}\right ]
\end{equation}$$ for $a\neq b \in F^{\times}\setminus \{1\}$. We denote
the projection of $[a]$ to $B_2(F)$ by $\{a\}_2$.
:::

::: remark
*Remark 122*. Suslin called this the *pre-Bloch group* in [@Sus90], and
denoted it ${\mathfrak{p}}(F)$. He also showed for any
$a\in F^{\times}\setminus \{1\}$ elements $\{a\}_2+\{a^{-1}\}_2$ and
$\{a\}_2+\{1-a\}_2$ are $6$-torsion.
:::

::: {#prop: G_2=B_2 .proposition}
**Proposition 123**. *There is a well-defined isomorphism
$$\begin{align*}
B_2(F)_{{\mathds{Q}}} &\stackrel{\cong}{\longrightarrow} \mathscr{G}_2(F) \\
\{a\}_2 &\longmapsto -\mathrm{Cor}^\mathscr{G}(1,0,a) = \mathrm{Cor}^\mathscr{G}(0,1,a).
\end{align*}$$*
:::

::: proof
*Proof.* The decomposition operator is given by $$\begin{align*}
D^\mathrm{FC}_h(\mathrm{FC}[u_0:u_1:u_2])
=&\,\mathrm{FC}\left[0:\frac{u_{1}-u_{0}}{h(u_{1})-h(u_0)}:\frac{u_{2}-u_{0}}{h(u_{2})-h(u_0)}\right]\\
&-\mathrm{FC}\left[0:\frac{u_{1}-u_{0}}{h(u_{1})-h(u_0)}:\frac{u_{2}-u_{1}}{h(u_{2})-h(u_1)}\right]\\
&+\mathrm{FC}\left[0:\frac{u_{2}-u_{0}}{h(u_{2})-h(u_0)}:\frac{u_{2}-u_{1}}{h(u_{2})-h(u_1)}\right],
\end{align*}$$ leading to the following identity for correlators:
$$\begin{align*}
    &\mathrm{Cor}^\mathscr{G}(x_0,x_1,x_2)-\mathrm{Cor}^\mathscr{G}(y_0, y_1,y_2)\\
     &=\mathrm{Cor}^\mathscr{G}\Bigl(0,\frac{x_1-x_0}{y_1-y_0},\frac{x_2-x_0}{y_2-y_0}\Bigr)-\mathrm{Cor}^\mathscr{G}\bigl(0,\frac{x_1-x_0}{y_1-y_0},\frac{x_2-x_1}{y_2-y_1}\Bigr)+\mathrm{Cor}^\mathscr{G}\Bigl(0,\frac{x_2-x_0}{y_2-y_0},\frac{x_2-x_1}{y_2-y_1}\Bigr).
\end{align*}$$ Specializing to $(x_0,x_1,x_2)=(0,1,a)$ and
$(y_0,y_1,y_2)=(0,1,b)$ we obtain an identity $$\begin{align*}
    &\mathrm{Cor}^\mathscr{G}(0,1,a)-\mathrm{Cor}^\mathscr{G}(0, 1,b)=\mathrm{Cor}^\mathscr{G}\Bigl(0,1,\frac{a}{b}\Bigr)-\mathrm{Cor}^\mathscr{G}\bigl(0,1,\frac{a-1}{b-1}\Bigr)+\mathrm{Cor}^\mathscr{G}\Bigl(0,\frac{a}{b},\frac{a-1}{b-1}\Bigr).
\end{align*}$$ We have
$$\mathrm{Cor}^\mathscr{G}\Bigl(0,1,\frac{a}{b}\Bigr)=\mathrm{Cor}^\mathscr{G}\Bigl(0,b,a\Bigr)=-\mathrm{Cor}^\mathscr{G}\Bigl(0,1,\frac{b}{a}\Bigr) \qquad \text{and}$$
$$\mathrm{Cor}^\mathscr{G}\Bigl(0,\frac{a}{b},\frac{a-1}{b-1}\Bigr)=\mathrm{Cor}^\mathscr{G}\Bigl(0,1,\frac{1-a^{-1}}{1-b^{-1}}\Bigr).$$
Thus we obtain that $$\begin{align*}
    &\mathrm{Cor}^\mathscr{G}(0,1,a)-\mathrm{Cor}^\mathscr{G}(0, 1,b)+\mathrm{Cor}^\mathscr{G}\Bigl(0,1,\frac{b}{a}\Bigr)+\mathrm{Cor}^\mathscr{G}\bigl(0,1,\frac{a-1}{b-1}\Bigr)-\mathrm{Cor}^\mathscr{G}\Bigl(0,1,\frac{1-a^{-1}}{1-b^{-1}}\Bigr)=0.
\end{align*}$$ This shows that the map from $B_2(F)$ to
$\mathscr{G}_2(F)$ is well-defined. To show it is an isomorphism, we use
that the formula $$\mathrm{Cor}^\mathscr{G}(x_0, x_1,x_2) \longmapsto
\begin{cases}
\left\{\dfrac{x_2-x_0}{x_1-x_0}\right\}_2 & \text{ if } x_0,x_1,x_2 \text{ are distinct},\\
0& \text{ otherwise,}
 \end{cases}$$ defines an inverse. To see it is well-defined, the only
nontrivial observation needed is one made above: the decomposition
relation corresponds to the 5-term relation. ◻
:::

::: example
*Example 124*. As mentioned in the introduction, let us spell out that
under this isomorphism the weight 2 component of the
Chevalley--Eilenberg complex computing the homology of the Lie coalgebra
$\mathscr{G}(F)$ is the rationalisation of the two-term Bloch complex
[@Sus90] $$B_2(F)\longrightarrow\Lambda^2 F^{\times}$$ with the
differential given by $\{a\}_2$ to $a\wedge (1-a)$. This was stated in
the introduction and follows from the computation of the cobracket
$\delta(\mathrm{Cor}^\mathscr{G}(x_0, x_1,x_2))$ as
$$\mathrm{Cor}^\mathscr{G}(x_0, x_1)\wedge \mathrm{Cor}^\mathscr{G}(x_0, x_2)+\mathrm{Cor}^\mathscr{G}(x_1, x_2)\wedge \mathrm{Cor}^\mathscr{G}(x_1, x_0)+\mathrm{Cor}^\mathscr{G}(x_2, x_0)\wedge \mathrm{Cor}^\mathscr{G}(x_2, x_1),$$
which leads to $\delta(\mathrm{Cor}^\mathscr{G}(0,1,a))=a\wedge (1-a)$.
:::

#### Iterated integrals and multiple polylogarithms {#sec:iterated-integrals-and-multiple-polylogarithms}

We start by giving an analogue of the definition [@CMRR24 Definition 16]
in the setting of formal polylogarithms.

::: definition
**Definition 125**. For $x_0,\dots,x_{n+1} \in F$ and $n\geq 1$ we
define the *iterated integral* by the formula:
$$\mathrm{I}^\mathscr{G}(x_0; x_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n; x_{n+1}) \coloneq  \mathrm{Cor}^\mathscr{G}(x_1,x_2,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_{n+1}) - \mathrm{Cor}^\mathscr{G}(x_0, x_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}, x_n) \in \mathscr{G}_n(F).$$
By convention, $\mathrm{I}^\mathscr{G}(x_0; x_1) = 0$.
:::

[119](#LemmaCorrelatorWeightOne){reference-type="ref+label"
reference="LemmaCorrelatorWeightOne"} implies that under the isomorphism
[\[eqn:isomorphism in weight 1\]](#eqn:isomorphism in weight 1){reference-type="eqref"
reference="eqn:isomorphism in weight 1"} the iterated integral
$\mathrm{I}^\mathscr{G}(x_0; x_1; x_{2})$ corresponds to
$\tfrac{x_2-x_1}{x_0-x_1}\in F^{\times}$. The properties of correlators
immediately imply the shuffle relations for iterated integrals:
$$\sum_{\sigma \in {\mathrm{Sh}}(n_1,n_2)} \mathrm{I}^\mathscr{G}(x_0;x_{\sigma(1)},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_{\sigma(n_1+n_2)},x_{n+1}) =0.$$
Furthermore, we have the following formula for the cobracket of iterated
integrals: $$\begin{align*}
\delta & \mathrm{I}^\mathscr{G}(x_0; x_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n; x_{n+1}) \\
&=\sum_{0 \leq i < j \leq n+1} \!\!\! \mathrm{I}^\mathscr{G}(x_0; x_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_i, x_j,\ldots, x_n; x_{n+1}) \wedge \mathrm{I}^\mathscr{G}(x_i; x_{i+1}, \mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}, x_{j-1}; x_j)  \,.
\end{align*}$$ The proof is identical to that of [@CMRR24 Proposition
19].

We next give an analogue of the definition [@CMRR24 (23)].

::: definition
**Definition 126**. For an integer $n_0\geq 0$, $k\ge1$, positive
integers $n_1,\dots,n_k$, and elements $a_1,\dots,a_k\in F^\times$ we
define the *multiple polylogarithm* $$\begin{align*}
&\mathrm{Li}^\mathscr{G}_{n_0; n_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},n_k}(a_1,a_2,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},a_k)\\
& \coloneq (-1)^{k}\mathrm{I}^\mathscr{G}(0;\underbrace{0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},0,1}_{n_0+1},\underbrace{0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},0,a_1}_{n_1},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},\underbrace{0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},0,a_1a_2\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}a_{k-1}}_{n_{k-1}},\underbrace{0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},0;a_1a_2\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}a_{k}}_{n_k})\,.
\end{align*}$$ This is an element of $\mathscr{G}_n(F)$ for
$n=n_0+n_1+n_2+\dots+n_k$.
:::

If $n_0=0$, we omit it from the notation:
$$\mathrm{Li}^\mathscr{G}_{n_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},n_k}(a_1,a_2,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},a_k) \coloneq \mathrm{Li}^\mathscr{G}_{0;n_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},n_k}(a_1,a_2,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},a_k)\,.$$
We call elements $\mathrm{Li}^\mathscr{G}_{n}(a)$ *classical
polylogarithms*, and more specifically, call
$\mathrm{Li}^\mathscr{G}_2(a)$ the *dilogarithm* and
$\mathrm{Li}^\mathscr{G}_3(a)$ the *trilogarithm*. We will need that
they satisfy the following property:

::: {#lemma: inversion for classical polylogs .lemma}
**Lemma 127** (Inversion relation for classical polylogarithms). *For
$n\geq 2$ we have
$$\mathrm{Li}^\mathscr{G}_n\left(\frac{1}{a}\right)=(-1)^{n-1}\mathrm{Li}^\mathscr{G}_n(a) \quad \text{for $a\in F^{\times}$.}$$*
:::

::: proof
*Proof.* By definition, we have
$$\mathrm{Li}^\mathscr{G}_n(a)=-\mathrm{I}^\mathscr{G}(0;1,\underbrace{0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},0}_{n-1};a)=-\mathrm{Cor}^\mathscr{G}(1,\underbrace{0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},0}_{n-1},a)+\mathrm{Cor}^\mathscr{G}(0,1,\underbrace{0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},0}_{n-1}).$$
By [\[eqn:cor vanishing\]](#eqn:cor vanishing){reference-type="eqref"
reference="eqn:cor vanishing"} and the cyclic symmetry
[\[enum:rel-goncharov-2\]](#enum:rel-goncharov-2){reference-type="eqref"
reference="enum:rel-goncharov-2"} we have
$$\mathrm{Li}^\mathscr{G}_n(a)=-\mathrm{Cor}^\mathscr{G}(\underbrace{0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},0}_{n-1},a,1).$$
By
[114](#lemma: multiplicative homogenity relation for correlators){reference-type="ref+label"
reference="lemma: multiplicative homogenity relation for correlators"},
[115](#lemma: reversal relation for correlators){reference-type="ref+label"
reference="lemma: reversal relation for correlators"}, and the cyclic
symmetry
[\[enum:rel-goncharov-2\]](#enum:rel-goncharov-2){reference-type="eqref"
reference="enum:rel-goncharov-2"} we have $$\begin{align*}
\mathrm{Li}^\mathscr{G}_n\left(\frac{1}{a}\right)&=-\mathrm{Cor}^\mathscr{G}(\underbrace{0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},0}_{n-1},\frac{1}{a},1)=-\mathrm{Cor}^\mathscr{G}(\underbrace{0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},0}_{n-1},1,a)=-\mathrm{Cor}^\mathscr{G}(a,\underbrace{0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},0}_{n-1},1)\\
&=(-1)^{n}\mathrm{Cor}^\mathscr{G}(a,1,\underbrace{0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},0}_{n-1})=(-1)^{n}\mathrm{Cor}^\mathscr{G}(\underbrace{0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},0}_{n-1},a,1)=(-1)^{n-1}\mathrm{Li}^\mathscr{G}_n(a).
\end{align*}$$ ◻
:::

#### The depth filtration {#sec:depth-filtration}

Like multiple polylogarithms, the Goncharov Lie coalgebra admits an
increasing *depth filtration*. We start by observing
$B_1({{\mathrm{Dec}}}_V;\mathrm{FC}(V))$ admits an increasing
$$\mathcal{D}_\bullet B_1({{\mathrm{Dec}}}_V;\mathrm{FC}(V))$$ defined
as follows: the subspace
$\mathcal{D}_k B_1({{\mathrm{Dec}}}_V;\mathrm{FC}(V))$ is spanned by
those elements
$[h] \otimes \mathrm{FC}[u_0:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:u_n]$
with at most $k+1$ indices $i$ satisfying $h(u_i)\neq h(u_{0})$. Note
that we have
$\mathcal{D}_{n-1} B_1({{\mathrm{Dec}}}_V;\mathrm{FC}(V))=B_1({{\mathrm{Dec}}}_V;\mathrm{FC}(V))$.

::: definition
**Definition 128**. The *depth filtration* on $\mathscr{G}_n(F)$ is
defined as
$$\mathcal{D}_\bullet\mathscr{G}_n(F) \coloneq {\mathrm{im}}\big[\mathcal{D}_\bullet B_1({{\mathrm{Dec}}}_V;\mathrm{FC}(V)) \to \mathscr{G}_n(F)\big].$$
:::

By definition, the space $\mathcal{D}_k \mathscr{G}_n(F)$ is spanned by
those elements
$\mathrm{Cor}^\mathscr{G}(x_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n)$
with at most $k+1$ indices $i$ satisfying $x_{i}\neq x_0$. The multiple
polylogarithm
$\smash{\mathrm{Li}^\mathscr{G}_{n_0; n_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},n_k}(a_1,a_2,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},a_k)}$
lies in $\mathcal{D}_k\mathscr{G}_n(F)$. The following statement can be
deduced from shuffle relations similarly to [@CMRR24 Corollary 30].

::: {#lemma: polylogs span .lemma}
**Lemma 129**. *The space $\mathcal{D}_k\mathscr{G}_n(F)$ is spanned by
multiple polylogarithms
$$\mathrm{Li}^\mathscr{G}_{n_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},n_d}(a_1,a_2,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},a_d)$$
for $d\leq k$ and $a_1,\dots,a_d\in F^{\times}$.*
:::

Inspired by [@Gon95], we introduce the following definition:

::: definition
**Definition 130**. The *Bloch group $B_n^{\mathscr{G}}(F)$ of weight
$n$* is the depth one subspace $\mathcal{D}_1\mathscr{G}_n(F)$.
:::

[129](#lemma: polylogs span){reference-type="ref+label"
reference="lemma: polylogs span"} implies that $B_n^{\mathscr{G}}(F)$ is
spanned by classical polylogarithms. Note that
$B_n^\mathscr{G}(F) = \mathscr{G}_n(F)$ for $n=1,2,3$, but in general
this is no longer the case for $n \geq 4$.

### Explicit description of $\mathscr{G}_3$ {#sec: bloch group weight 3}

In this section we show $\mathscr{G}_3(F)$ is spanned by trilogarithms
and that the classical trilogarithmic identities hold---the $3$-term
relation, Kummer's relation, and Goncharov's $22$-term relation. We
prove that all relations in $\mathscr{G}_3(F)$ follow from Goncharov's
$22$-term relation and use this to construct an isomorphism between
$\mathscr{G}_3(F)$ and Goncharov's $B_3(F)$. Together with the results
of [7.2](#sec: G1 and G_2){reference-type="ref+label"
reference="sec: G1 and G_2"}, this finishes the identification of
$\mathscr{G}_n(F)$ for $n \leq 3$ in more classical terms.

#### The Bloch group $B_3$ and equations for trilogarithm

Goncharov defined the Bloch group $B_3(F)$ as a conjectural symbolic
description of the weight $3$ component of the motivic Lie coalgebra,
whose existence is itself conjectural. In this section we will prove it
agrees with ${\mathscr{G}}_3(F)$, proving the remaining one-third of
[\[thm:polyl-identification\]](#thm:polyl-identification){reference-type="ref+label"
reference="thm:polyl-identification"}. There are slight variations in
the definition of $B_3(F)$ in the literature and to avoid potential
subtleties related to torsion, we work with the rationalized Bloch group
$B_3(F)_{{\mathds{Q}}}$ defined as follows:

::: definition
**Definition 131**. The group $B_3(F)_{{\mathds{Q}}}$ is a quotient of
${\mathds{Q}}[F^{\times}]$ by the subspace spanned by elements
$$\begin{equation}
 \label{eqn: 2 term in B3}
[a]-\left[a^{-1}\right] \text{ for }a\in F^{\times},
\end{equation}$$ the *$3$-term relation* $$\begin{equation}
\label{eqn: 3 term in B3}
T_3(a)= [a]+[1-a]+\left[1 - a^{-1}\right]-[1]  \text{ for }a\in F^{\times}\setminus \{1\}
\end{equation}$$ and the *Goncharov 22-term relation* $$\begin{equation}
\label{eqn: 22 term in B3}
\begin{aligned}
R_3(a,b,c) = {} & [ca-a+1]+[ab-b+1]+[bc-c+1]\\
&+ \left[\frac{ca-a+1}{ca}\right]+\left[\frac{ab-b+1}{ab}\right]+\left[\frac{bc-c+1}{bc}\right]\\
&+ \left[\frac{bc-c+1}{(ca-a+1)b}\right]+\left[\frac{ca-a+1}{(ab-b+1)c}\right]+\left[\frac{ab-b+1}{(bc-c+1)a}\right]\\
&- \left[\frac{ca-a+1}{c}\right]-\left[\frac{ab-b+1}{a}\right]-\left[\frac{bc-c+1}{b}\right]\\
&+ \left[-\frac{(bc-c+1)a}{(ca-a+1)}\right]+\left[-\frac{(ca-a+1)b}{(ab-b+1)}\right]+\left[-\frac{(ab-b+1)c}{(bc-c+1)}\right]\\
&-\left[\frac{(bc-c+1)}{(ca-a+1)bc}\right]-\left[\frac{(ca-a+1)}{(ab-b+1)ca}\right]-\left[\frac{(ab-b+1)}{(bc-c+1)ab}\right]\\
& + [a]+[b]+[c]+[-abc]-3 \, [1]
\end{aligned}
\end{equation}$$ for $a, b, c \in F^{\times}$ such that
$ca-a+1,\: ab-b+1,\: bc-c+1\neq 0$. We denote the image of an element
$[a]$ in $B_3(F)_{{\mathds{Q}}}$ by $\{a\}_3$.
:::

::: remark
*Remark 132*. The above definition is a slight variation of the
definition [@Gon95b p.30], in which only elements $[a]$ with $a\neq 1$
are allowed. After rationalising, this definition yields the same group,
as is shown in [@Gon95b §5.3].
:::

::: remark
*Remark 133*. The restriction of Goncharov's 22-term relation to $a=1$
gives *Kummer's 9-term relation*: $$\begin{equation}
\label{eqn: 9 term in B3}
\begin{aligned}
 0&=-\left\{\frac{bc-c+1}{b}\right\}_3-\left\{\frac{(bc-c+1)}{bc^2}\right\}_3-\left\{(bc-c+1)b\right\}_3+ 2\left\{-\frac{(bc-c+1)}{c}\right\}_3 \\ 
 &+2\{bc-c+1\}_3+2\left\{\frac{bc-c+1}{bc}\right\}_3
+2\{b\}_3+2\{c\}_3+2\{-bc\}_3-2\{1\}_3.
\end{aligned}
\end{equation}$$
:::

#### Explicit form of the decomposition relations in weight $3$ {#sec:decomp-rels-wt-3}

We begin by writing the equations defining $\mathscr{G}_3(F)$
explicitly. To this end, recall that we have the following formula for
the symbol of a Steinberg iterated integral: $$\begin{align*}
s({\mathrm{I}}[e_1,e_2,e_3]) = {} & 
 -s({\mathrm{I}}[e_1,e_2])\otimes[e_3]
+\big(s({\mathrm{I}}[e_1,e_3])
-s({\mathrm{I}}[e_2,e_3])\big)\otimes[e_2{-}e_1] \\
& 
{} +\big(s({\mathrm{I}}[e_1,e_2])-s({\mathrm{I}}[e_1,e_3])\big)\otimes[e_3{-}e_2]\\[1ex]
= {} & - [e_1 \mkern 1mu|\mkern 1mue_2 \mkern 1mu|\mkern 1mue_3]+[e_1 \mkern 1mu|\mkern 1mue_2{-}e_1 \mkern 1mu|\mkern 1mue_3]-[e_2 \mkern 1mu|\mkern 1mue_2{-}e_1 \mkern 1mu|\mkern 1mue_3]
\\
 &+[e_1 \mkern 1mu|\mkern 1mue_3 \mkern 1mu|\mkern 1mue_2{-}e_1]-[e_1 \mkern 1mu|\mkern 1mue_3{-}e_1 \mkern 1mu|\mkern 1mue_2{-}e_1]+[e_3 \mkern 1mu|\mkern 1mue_3{-}e_1 \mkern 1mu|\mkern 1mue_2{-}e_1]\\
 &-[e_2 \mkern 1mu|\mkern 1mue_3 \mkern 1mu|\mkern 1mue_2{-}e_1]+[e_2 \mkern 1mu|\mkern 1mue_3{-}e_2 \mkern 1mu|\mkern 1mue_2{-}e_1]-[e_3 \mkern 1mu|\mkern 1mue_3{-}e_2 \mkern 1mu|\mkern 1mue_2{-}e_1]\\
 &+[e_1 \mkern 1mu|\mkern 1mue_2 \mkern 1mu|\mkern 1mue_3{-}e_2]-[e_1 \mkern 1mu|\mkern 1mue_2{-}e_1 \mkern 1mu|\mkern 1mue_3{-}e_2]+[e_2 \mkern 1mu|\mkern 1mue_2{-}e_1 \mkern 1mu|\mkern 1mue_3{-}e_2]\\
 &-[e_1 \mkern 1mu|\mkern 1mue_3 \mkern 1mu|\mkern 1mue_3{-}e_2]+[e_1 \mkern 1mu|\mkern 1mue_3{-}e_1 \mkern 1mu|\mkern 1mue_3{-}e_2]-[e_3 \mkern 1mu|\mkern 1mue_3{-}e_1 \mkern 1mu|\mkern 1mue_3{-}e_2]\,.
\end{align*}$$ The following shuffle relations hold in
$\mathrm{BSt}_3(V)\otimes_{\mathfrak{S}_3}{\mathrm{coLie}}(3)$:
$$\begin{align*}
&[e_1 \mkern 1mu|\mkern 1mue_2{-}e_1 \mkern 1mu|\mkern 1mue_3]+[e_1 \mkern 1mu|\mkern 1mue_3 \mkern 1mu|\mkern 1mue_2{-}e_1]=-[e_3\mkern 1mu|\mkern 1mue_1\mkern 1mu|\mkern 1mue_2-e_1],\\
&[e_2 \mkern 1mu|\mkern 1mue_2{-}e_1 \mkern 1mu|\mkern 1mue_3]+[e_2 \mkern 1mu|\mkern 1mue_3 \mkern 1mu|\mkern 1mue_2{-}e_1]=-[e_3\mkern 1mu|\mkern 1mue_2 \mkern 1mu|\mkern 1mue_2-e_1],\\
&[e_2 \mkern 1mu|\mkern 1mue_2{-}e_1 \mkern 1mu|\mkern 1mue_3{-}e_2]+[e_2 \mkern 1mu|\mkern 1mue_3{-}e_2 \mkern 1mu|\mkern 1mue_2{-}e_1]=-
[e_3{-}e_2 \mkern 1mu|\mkern 1mue_2 \mkern 1mu|\mkern 1mue_2{-}e_1].
\end{align*}$$ Using them, we get $$\begin{align*}
s({\mathrm{I}}[e_1,e_2,e_3]) = 
 {} & - [e_1 \mkern 1mu|\mkern 1mue_2 \mkern 1mu|\mkern 1mue_3]-[e_3\mkern 1mu|\mkern 1mue_1\mkern 1mu|\mkern 1mue_2-e_1]+[e_3\mkern 1mu|\mkern 1mue_2 \mkern 1mu|\mkern 1mue_2-e_1]
\\
 &-[e_1 \mkern 1mu|\mkern 1mue_3{-}e_1 \mkern 1mu|\mkern 1mue_2{-}e_1]+[e_3 \mkern 1mu|\mkern 1mue_3{-}e_1 \mkern 1mu|\mkern 1mue_2{-}e_1]\\
 &-[e_3{-}e_2 \mkern 1mu|\mkern 1mue_2 \mkern 1mu|\mkern 1mue_2{-}e_1]-[e_3 \mkern 1mu|\mkern 1mue_3{-}e_2 \mkern 1mu|\mkern 1mue_2{-}e_1]\\
 &+[e_1 \mkern 1mu|\mkern 1mue_2 \mkern 1mu|\mkern 1mue_3{-}e_2]-[e_1 \mkern 1mu|\mkern 1mue_2{-}e_1 \mkern 1mu|\mkern 1mue_3{-}e_2]\\
 &-[e_1 \mkern 1mu|\mkern 1mue_3 \mkern 1mu|\mkern 1mue_3{-}e_2]+[e_1 \mkern 1mu|\mkern 1mue_3{-}e_1 \mkern 1mu|\mkern 1mue_3{-}e_2]-[e_3 \mkern 1mu|\mkern 1mue_3{-}e_1 \mkern 1mu|\mkern 1mue_3{-}e_2]\,.
\end{align*}$$

Next, consider an affine basis $u_0, u_1, u_2, u_3$ and a nonzero
functional $h\in V^{\times}$ with $h_i \coloneq h(u_i)$. If
$h_0,\ h_1,\ h_2,\ h_3$ are pairwise distinct, we deduce that
$$\begin{align*}
D^\mathrm{FC}_h  &(\mathrm{FC}[u_0:u_1:u_2:u_3]) \\  
&=\mathrm{FC}\Bigl[0:\frac{u_1-u_0}{h_1-h_0} :\frac{u_2-u_0}{h_2-h_0} : \frac{u_3-u_0}{h_3-h_0}\Bigr]
+\mathrm{FC}\Bigl[0:\frac{u_3-u_0}{h_3-h_0}: \frac{u_1-u_0}{h_1-h_0}:\frac{u_2-u_1}{h_2-h_1}\Bigr]\\
&-\mathrm{FC}\Bigl[0:\frac{u_3-u_0}{h_3-h_0}: \frac{u_2-u_0}{h_2-h_0} : \frac{u_2-u_1}{h_2-h_1}\Bigr]
+\mathrm{FC}\Bigl[0:\frac{u_1-u_0}{h_1-h_0} : \frac{u_3-u_1}{h_3-h_1} : \frac{u_2-u_1}{h_2-h_1}\Bigr]\\
 &-\mathrm{FC}\Bigl[0:\frac{u_3-u_0}{h_3-h_0} : \frac{u_3-u_1}{h_3-h_1} : \frac{u_2-u_1}{h_2-h_1}\Bigr]
 +\mathrm{FC}\Bigl[0:\frac{u_3-u_2}{h_3-h_2} : \frac{u_2-u_0}{h_2-h_0} : \frac{u_2-u_1}{h_2-h_1}\Bigl]\\
& +\mathrm{FC}\Bigl[0:\frac{u_3-u_0}{h_3-h_0} : \frac{u_3-u_2}{h_3-h_2} : \frac{u_2-u_1}{h_2-h_1}\Bigr]
 -\mathrm{FC}\Bigl[0:\frac{u_1-u_0}{h_1-h_0} :\frac{u_2-u_0}{h_2-h_0} : \frac{u_3-u_2}{h_3-h_2}\Bigr]\\
 &+\mathrm{FC}\Bigl[0:\frac{u_1-u_0}{h_1-h_0} : \frac{u_2-u_1}{h_2-h_1} : \frac{u_3-u_2}{h_3-h_2}\Bigr]
 +\mathrm{FC}\Bigl[0:\frac{u_1-u_0}{h_1-h_0} : \frac{u_3-u_0}{h_3-h_0} : \frac{u_3-u_2}{h_3-h_2}\Bigr]\\
 &-\mathrm{FC}\Bigl[0:\frac{u_1-u_0}{h_1-h_0} : \frac{u_3-u_1}{h_3-h_1} : \frac{u_3-u_2}{h_3-h_2}\Bigr]
+\mathrm{FC}\Bigl[0:\frac{u_3-u_0}{h_3-h_0} : \frac{u_3-u_1}{h_3-h_1} : \frac{u_3-u_2}{h_3-h_2}\Bigr]\,.
\end{align*}$$ If some of the elements $h_0, h_1, h_2, h_3$ coincide,
the above expression simplifies; all terms in which one of the
denominators appearing in the entries vanishes are omitted.

Next, we consider a pair of nonzero functionals $h_1, h_2$ and denote
$h_1(e_i):=x_i, h_2(e_i)=y_i$. If $y_0, y_1, y_2, y_3$ are distinct, we
get the decomposition relation $$\begin{align*}
\mathrm{Cor}^\mathscr{G}&\bigl(x_0,x_1 ,x_2 , x_3\bigr)-\mathrm{Cor}^\mathscr{G}\bigl(y_0, y_1, y_2, y_3\bigr)\\
&=\mathrm{Cor}^\mathscr{G}\Bigl(0,\frac{x_1-x_0}{y_1-y_0} ,\frac{x_2-x_0}{y_2-y_0} , \frac{x_3-x_0}{y_3-y_0}\Bigr)
+\mathrm{Cor}^\mathscr{G}\Bigl(0,\frac{x_3-x_0}{y_3-y_0}, \frac{x_1-x_0}{y_1-y_0},\frac{x_2-x_1}{y_2-y_1}\Bigr)\\
&-\mathrm{Cor}^\mathscr{G}\Bigl(0,\frac{x_3-x_0}{y_3-y_0}, \frac{x_2-x_0}{y_2-y_0}, \frac{x_2-x_1}{y_2-y_1}\Bigr)
+\mathrm{Cor}^\mathscr{G}\Bigl(0,\frac{x_1-x_0}{y_1-y_0} , \frac{x_3-x_1}{y_3-y_1} , \frac{x_2-x_1}{y_2-y_1}\Bigr)\\
&-\mathrm{Cor}^\mathscr{G}\Bigl(0,\frac{x_3-x_0}{y_3-y_0} , \frac{x_3-x_1}{y_3-y_1} , \frac{x_2-x_1}{y_2-y_1}\Bigr)
+\mathrm{Cor}^\mathscr{G}\Bigl(0,\frac{x_3-x_2}{y_3-y_2},\frac{x_2-x_0}{y_2-y_0}, \frac{x_2-x_1}{y_2-y_1}\Bigr)\\
&+\mathrm{Cor}^\mathscr{G}\Bigl(0,\frac{x_3-x_0}{y_3-y_0} , \frac{x_3-x_2}{y_3-y_2} , \frac{x_2-x_1}{y_2-y_1}\Bigr)
-\mathrm{Cor}^\mathscr{G}\Bigl(0,\frac{x_1-x_0}{y_1-y_0} ,\frac{x_2-x_0}{y_2-y_0} , \frac{x_3-x_2}{y_3-y_2}\Bigr)\\
&+\mathrm{Cor}^\mathscr{G}\Bigl(0,\frac{x_1-x_0}{y_1-y_0} , \frac{x_2-x_1}{y_2-y_1} , \frac{x_3-x_2}{y_3-y_2}\Bigr)
 +\mathrm{Cor}^\mathscr{G}\Bigl(0,\frac{x_1-x_0}{y_1-y_0} , \frac{x_3-x_0}{y_3-y_0} , \frac{x_3-x_2}{y_3-y_2}\Bigr)\\
&-\mathrm{Cor}^\mathscr{G}\Bigl(0,\frac{x_1-x_0}{y_1-y_0} , \frac{x_3-x_1}{y_3-y_1} , \frac{x_3-x_2}{y_3-y_2}\Bigr)
 +\mathrm{Cor}^\mathscr{G}\Bigl(0,\frac{x_3-x_0}{y_3-y_0} , \frac{x_3-x_1}{y_3-y_1} , \frac{x_3-x_2}{y_3-y_2}\Bigr)\,.
\end{align*}$$ If some of the elements $y_0, y_1, y_2, y_3$ coincide, we
omit all correlators containing a fraction with a vanishing denominator.

#### Classical trilogarithms {#section: trilog}

Recall that the trilogarithm is defined by the formula
$$\mathrm{Li}^\mathscr{G}_3(a)=-\mathrm{Cor}^\mathscr{G}(0,0,a,1) = -\mathrm{Cor}^\mathscr{G}(1,0,0,a)$$
for $a\in F$. By
[127](#lemma: inversion for classical polylogs){reference-type="ref+label"
reference="lemma: inversion for classical polylogs"},
$\mathrm{Li}^\mathscr{G}_3(\frac{1}{a})=\mathrm{Li}^\mathscr{G}_3(a)$.
We start with the following statement:

::: {#lem 3-term relation .lemma}
**Lemma 134** (3-term relation). *For any $a\in F^{\times}$ we have
$$\begin{equation}
    \mathrm{Li}^\mathscr{G}_3\left(a\right)+\mathrm{Li}^\mathscr{G}_3(1-a)+\mathrm{Li}^\mathscr{G}_3\left(1-\frac{1}{a}\right)=\mathrm{Li}^\mathscr{G}_3(1)\label{EqTrilog2}.
\end{equation}$$*
:::

::: proof
*Proof.* We consider a degenerate version of the decomposition relation
with $y_0=y_3$: $$\begin{align*}
\mathrm{Cor}^\mathscr{G}&\bigl(x_0,x_1 ,x_2 , x_3\bigr)-\mathrm{Cor}^\mathscr{G}\bigl(y_0, y_1, y_2, y_3\bigr)\\
&=\mathrm{Cor}^\mathscr{G}\Bigl(0,\frac{x_1-x_0}{y_1-y_0} , \frac{x_3-x_1}{y_3-y_1} , \frac{x_2-x_1}{y_2-y_1}\Bigr)\\
&+\mathrm{Cor}^\mathscr{G}\Bigl(0,\frac{x_3-x_2}{y_3-y_2},\frac{x_2-x_0}{y_2-y_0}, \frac{x_2-x_1}{y_2-y_1}\Bigr)\\
&-\mathrm{Cor}^\mathscr{G}\Bigl(0,\frac{x_1-x_0}{y_1-y_0} ,\frac{x_2-x_0}{y_2-y_0} , \frac{x_3-x_2}{y_3-y_2}\Bigr)\\
&+\mathrm{Cor}^\mathscr{G}\Bigl(0,\frac{x_1-x_0}{y_1-y_0} , \frac{x_2-x_1}{y_2-y_1} , \frac{x_3-x_2}{y_3-y_2}\Bigr)\\
&-\mathrm{Cor}^\mathscr{G}\Bigl(0,\frac{x_1-x_0}{y_1-y_0} , \frac{x_3-x_1}{y_3-y_1} , \frac{x_3-x_2}{y_3-y_2}\Bigr).
\end{align*}$$ Evaluating it at
$x_0=x_2=x_3=y_0=y_3=0,\: x_1=y_1=1,\: y_2=a$ we get $$\begin{align*}
\mathrm{Cor}^\mathscr{G}\bigl(0,1 ,0 ,0 \bigr)&-\mathrm{Cor}^\mathscr{G}\bigl(0, 1,a, 0\bigr)=\mathrm{Cor}^\mathscr{G}\Bigl(0,1, 1, \frac{-1}{a-1}\Bigr)+\mathrm{Cor}^\mathscr{G}\Bigl(0,0,0, \frac{-1}{a-1}\Bigr)\\
&-\mathrm{Cor}^\mathscr{G}\Bigl(0,1 ,0 , 0\Bigr)+\mathrm{Cor}^\mathscr{G}\Bigl(0,1 , \frac{-1}{a-1} ,0\Bigr)-\mathrm{Cor}^\mathscr{G}\Bigl(0,1 , 1 , 0\Bigr).
\end{align*}$$ Using
[\[eqn:cor vanishing\]](#eqn:cor vanishing){reference-type="eqref"
reference="eqn:cor vanishing"}, we can simplify this to
$$\begin{equation}
\label{eqn:3-term relatio proof}
-\mathrm{Cor}^\mathscr{G}\bigl(0, 1,a, 0\bigr)=\mathrm{Cor}^\mathscr{G}\Bigl(0,1, 1, \frac{-1}{a-1}\Bigr)+\mathrm{Cor}^\mathscr{G}\Bigl(0,1 , \frac{-1}{a-1} ,0\Bigr)-\mathrm{Cor}^\mathscr{G}\Bigl(0,1 , 1 , 0\Bigr).
\end{equation}$$ Notice that by homogeneity, cyclic symmetry,
[114](#lemma: multiplicative homogenity relation for correlators){reference-type="ref+label"
reference="lemma: multiplicative homogenity relation for correlators"},
and
[127](#lemma: inversion for classical polylogs){reference-type="ref+label"
reference="lemma: inversion for classical polylogs"} we have
$$\begin{align*}
&\mathrm{Cor}^\mathscr{G}\Bigl(0,1, 1, \frac{-1}{a-1}\Bigr)=\mathrm{Cor}^\mathscr{G}\Bigl(-1,0,0, \frac{a}{1-a}\Bigr)=\mathrm{Cor}^\mathscr{G}\Bigl(0,0, \frac{a}{1-a},-1\Bigr)\\
&=
\mathrm{Cor}^\mathscr{G}\Bigl(0,0, \frac{a}{a-1},1\Bigr)=-\mathrm{Li}^\mathscr{G}\left(\frac{a}{a-1}\right)=-\mathrm{Li}^\mathscr{G}\left(1-\frac{1}{a}\right).
\end{align*}$$ Similarly, $$\begin{align*}
    &\mathrm{Cor}^\mathscr{G}\bigl(0, 1,a, 0\bigr)=-\mathrm{Li}^\mathscr{G}_3(a), \\
    &\mathrm{Cor}^\mathscr{G}\Bigl(0,1 , \frac{-1}{a-1} ,0\Bigr)=-\mathrm{Li}^\mathscr{G}_3(1-a)\\
    &\mathrm{Cor}^\mathscr{G}\Bigl(0,1 , 1 , 0\Bigr)=-\mathrm{Li}^\mathscr{G}_3(1).
\end{align*}$$ Thus
[\[eqn:3-term relatio proof\]](#eqn:3-term relatio proof){reference-type="eqref"
reference="eqn:3-term relatio proof"} is equivalent to the $3$-term
relation. ◻
:::

::: {#prop: G3 spanned by trilogs .proposition}
**Proposition 135**. *The space $\mathscr{G}_3(F)$ is spanned by
classical trilogarithms: we have
$\mathscr{G}_3(F)=B_3^{\mathscr{G}}(F)$.*
:::

::: proof
*Proof.* We consider the degenerate version of the decomposition
relation with $y_0=y_3$ and specialize to
$x_0=y_0=y_3=0,\: x_1=y_1=1 \: x_2=x_3=a, \: y_2=b$: $$\begin{align*}
\mathrm{Cor}^\mathscr{G}&\bigl(0,1 ,a ,a\bigr)-\mathrm{Cor}^\mathscr{G}\bigl(0, 1, b, 0\bigr)\\
&=\mathrm{Cor}^\mathscr{G}\Bigl(0,1 , \frac{a-1}{-1} , \frac{a-1}{b-1}\Bigr)+\mathrm{Cor}^\mathscr{G}\Bigl(0,0,\frac{a}{b}, \frac{a-1}{b-1}\Bigr)\\
&-\mathrm{Cor}^\mathscr{G}\Bigl(0,1 ,\frac{a}{b} , 0\Bigr)+\mathrm{Cor}^\mathscr{G}\Bigl(0,1 , \frac{a-1}{b-1} , 0\Bigr)-\mathrm{Cor}^\mathscr{G}\Bigl(0,1, \frac{a-1}{-1} , 0\Bigr).
\end{align*}$$ This identity can be rewritten as follows:
$$\begin{align*}
\mathrm{Cor}^\mathscr{G}&\Bigl(0,1, 1-a , \frac{a-1}{b-1}\Bigr)\\
&=-\mathrm{Li}^\mathscr{G}_3\left(1-\frac{1}{a}\right)
+\mathrm{Li}^\mathscr{G}_3(b)
+\mathrm{Li}^\mathscr{G}_3\left(\frac{b(a-1)}{a(b-1)}\right)
-\mathrm{Li}^\mathscr{G}_3\left(\frac{a}{b}\right)
+\mathrm{Li}^\mathscr{G}_3\left(\frac{a-1}{b-1}\right)
-\mathrm{Li}^\mathscr{G}_3\Bigl(1-a \Bigr).
\end{align*}$$ Using the properties of the correlator and the $3$-term
relation, we obtain the following identity: $$\begin{equation}
\label{eqn: correlator via trilogs}
\begin{aligned}
&\mathrm{Cor}^\mathscr{G}(x_0,x_1, x_2, x_3) =+\mathrm{Li}^\mathscr{G}_3\left(\frac{x_3 - x_2}{x_3 - x_0}\right)+\mathrm{Li}^\mathscr{G}_3\left(\frac{x_3 - x_2}{x_1 - x_2}\right) \\
&-\mathrm{Li}^\mathscr{G}_3\left(\frac{(x_1 - x_2)(x_3 - x_0)}{(x_1 - x_0)(x_3 - x_2)}\right) + 
   \mathrm{Li}^\mathscr{G}_3\left(\frac{x_3 - x_0}{x_1 - x_0}\right)+\mathrm{Li}^\mathscr{G}_3\left(\frac{x_2 - x_1}{x_0 - x_1}\right)- \mathrm{Li}^\mathscr{G}_3(1).
\end{aligned}
\end{equation}$$ ◻
:::

#### The isomorphism $\mathscr{G}_3\cong B_3$

Consider the map $$\begin{equation}
 \label{eqn: map from B_3 to G_3}
\begin{aligned}
  \tilde{L} \colon{\mathds{Q}}[F^{\times}] &\longrightarrow\mathscr{G}_3(F) \\
  [a] &\longmapsto \mathrm{Li}^\mathscr{G}_3(a).\end{aligned}
\end{equation}$$

::: lemma
**Lemma 136**. *The map $\tilde{L}$ vanishes on relations
[\[eqn: 2 term in B3\]](#eqn: 2 term in B3){reference-type="eqref"
reference="eqn: 2 term in B3"},
[\[eqn: 3 term in B3\]](#eqn: 3 term in B3){reference-type="eqref"
reference="eqn: 3 term in B3"},
[\[eqn: 22 term in B3\]](#eqn: 22 term in B3){reference-type="eqref"
reference="eqn: 22 term in B3"} and thus defines a map $L$ from $B_3(F)$
to $\mathscr{G}_3(F)$. In particular, the Goncharov $22$-term relation
holds in $\mathscr{G}_3(F)$.*
:::

::: proof
*Proof.* By
[127](#lemma: inversion for classical polylogs){reference-type="ref+label"
reference="lemma: inversion for classical polylogs"} the map $\tilde{L}$
vanishes on relation
[\[eqn: 2 term in B3\]](#eqn: 2 term in B3){reference-type="eqref"
reference="eqn: 2 term in B3"}. By
[134](#lem 3-term relation){reference-type="ref+label"
reference="lem 3-term relation"} the map $\tilde{L}$ vanishes on
relation
[\[eqn: 3 term in B3\]](#eqn: 3 term in B3){reference-type="eqref"
reference="eqn: 3 term in B3"}. It remains to show that $\tilde{L}$
vanishes on the 22-term relation.

We start with a degenerate version of the decomposition relation with
$y_0=y_3$. We put $x_0=y_0=y_3=0, \: x_1=y_1=1, \: x_2=a, x_3=b, y_2=c$:
$$\begin{align*}
&\mathrm{Cor}^\mathscr{G}(0,1,a,b) - \mathrm{Cor}^\mathscr{G}(0,1,c,0) = 
\mathrm{Cor}^\mathscr{G}\left(0,\,1,\,1{-}b,\,\frac{a{-}1}{c{-}1}\right)  + \mathrm{Cor}^\mathscr{G}\left(0,\,\frac{a{-}b}{c},\,\frac{a}{c},\,\frac{a{-}1}{c{-}1}\right) \\
&- \mathrm{Cor}^\mathscr{G}\left(0,\,1,\,\frac{a}{c},\,\frac{a{-}b}{c}\right)  + \mathrm{Cor}^\mathscr{G}\left(0,\,1,\,\frac{a{-}1}{c{-}1},\,\frac{a{-}b}{c}\right) - \mathrm{Cor}^\mathscr{G}\left(0,\,1,\,1{-}b,\,\frac{a{-}b}{c}\right).
\end{align*}$$ We rewrite each term in terms of trilogarithms, and,
after applying the $3$-term relation several times, obtain the following
identity: $$\begin{align*}
0=&\mathrm{Li}^\mathscr{G}_3\!\left(\frac{b-a}{b}\right)
+ \mathrm{Li}^\mathscr{G}_3\!\left(\frac{b-a}{1-a}\right)
- \mathrm{Li}^\mathscr{G}_3\!\left(\frac{(1-a)b}{b-a}\right)
+ \mathrm{Li}^\mathscr{G}_3(1-a)
+ \mathrm{Li}^\mathscr{G}_3(c)
+ \mathrm{Li}^\mathscr{G}_3(b)\\
&\quad
+ \mathrm{Li}^\mathscr{G}_3\!\left(\frac{a-b}{c}\right)
+ \mathrm{Li}^\mathscr{G}_3\!\left(\frac{c-a}{c}\right)
+ \mathrm{Li}^\mathscr{G}_3\!\left(\frac{c-a}{1-a}\right)
- \mathrm{Li}^\mathscr{G}_3\!\left(\frac{a-b-c+bc}{-1+a}\right) \\
&\quad
+ \mathrm{Li}^\mathscr{G}_3\!\left(\frac{(-1+a)b}{a-b-c+bc}\right)
- \mathrm{Li}^\mathscr{G}_3\!\left(\frac{a-c}{(-1+a)c}\right)
+ \mathrm{Li}^\mathscr{G}_3\!\left(-\frac{(-1+a) b c}{(a-b)(a-c)}\right)
+ \mathrm{Li}^\mathscr{G}_3\!\left(-\frac{b}{c-a}\right) \\
&\quad
- \mathrm{Li}^\mathscr{G}_3\!\left(\frac{(a-b)(a-c)}{b c}\right)
- \mathrm{Li}^\mathscr{G}_3\!\left(\frac{a-b-c+bc}{(a-c)c}\right)
+ \mathrm{Li}^\mathscr{G}_3\!\left(\frac{(a-b)(a-c)}{a-b-c+bc}\right) \\
&\quad
+ \mathrm{Li}^\mathscr{G}_3\!\left(-\frac{a-b-c+bc}{-a+b}\right)
+ \mathrm{Li}^\mathscr{G}_3\!\left(\frac{a-b-c+bc}{b c}\right)
- \mathrm{Li}^\mathscr{G}_3\!\left(\frac{(a-b)b}{a-b-c+bc}\right) \\
&\quad
+ \mathrm{Li}^\mathscr{G}_3\!\left(\frac{(-1+a)c}{a-b-c+bc}\right)
+ \mathrm{Li}^\mathscr{G}_3\!\left(-\frac{-a+c}{a-b-c+bc}\right)- 3\,\mathrm{Li}^\mathscr{G}_3(1) .
\end{align*}$$ This identity can be rewritten in the form
$$\tilde{L}\left(R_3\Bigl(\frac{1}{1-a},-\frac{1-a}{a-b},c\Bigr)\right)=0.$$
Thus the map $\tilde{L}$ vanishes on the $22$-term relation. ◻
:::

We obtain a map
$$L\colon B_3(F)_{\mathds{Q}}\longrightarrow\mathscr{G}_3(F),$$ which is
surjective by
[135](#prop: G3 spanned by trilogs){reference-type="ref+label"
reference="prop: G3 spanned by trilogs"}. To show injectivity, we
construct a map $M$ in the opposite direction. We define it on
generators $\mathrm{Cor}^\mathscr{G}(x_0,x_1, x_2, x_3)$ as follows. If
the arguments $x_i$ are pairwise distinct, we put $$\begin{align*}
&M(\mathrm{Cor}^\mathscr{G}(x_0,x_1, x_2, x_3)\} =\left\{\frac{x_3 - x_2}{x_3 - x_0}\right\}_3+\left\{\frac{x_3 - x_2}{x_1 - x_2}\right\}_3 \\
&-\left\{\frac{(x_1 - x_2)(x_3 - x_0)}{(x_1 - x_0)(x_3 - x_2)}\right\}_3 + 
   \left\{\frac{x_3 - x_0}{x_1 - x_0}\right\}_3+\left\{\frac{x_2 - x_1}{x_0 - x_1}\right\}_3- \{1\}_3.
\end{align*}$$ If a certain pair of arguments coincide, we use the same
formula omitting the terms which are not in $F^{\times}$. If there exist
three arguments equal to each other, the corresponding element of
$\mathscr{G}_3(F)$ vanishes. Finally, in the case when there are two
pairs of equal arguments, we put
$$M(\mathrm{Cor}^\mathscr{G}(x_0,x_1, x_2, x_3))=
    \begin{cases}
 -\{1\}_3 & \text{ if } x_0=x_1,\: x_2=x_3,\\
  2\{1\}_3 & \text{ if } x_0=x_2,\: x_1=x_3,\\
   -\{1\}_3 & \text{ if } x_0=x_3,\: x_1=x_2.
    \end{cases}$$ The check that $M$ is well defined is rather tedious
and we omit it. The key observation is that the decomposition relation
follows from the $22$-term relation. The corresponding substitution was
found by Steven Charlton via a computer-assisted search. It is easy to
see that $L$ and $M$ are mutually inverse. For instance, for the
distinct arguments $x_i$, we have
$$L(M(\mathrm{Cor}^\mathscr{G}(x_0,x_1, x_2, x_3)))=\mathrm{Cor}^\mathscr{G}(x_0,x_1, x_2, x_3)$$
by
[\[eqn: correlator via trilogs\]](#eqn: correlator via trilogs){reference-type="eqref"
reference="eqn: correlator via trilogs"}. This finishes the proof of the
following result of
[\[thm:polyl-identification\]](#thm:polyl-identification){reference-type="ref+label"
reference="thm:polyl-identification"}:

::: theorem
**Theorem 137**. *There is a well-defined isomorphism $$\begin{align*}
 B_3(F)_{\mathds{Q}} &\overset{\cong}\longrightarrow\mathscr{G}_3(F)\\
\{a\}_3 &\longmapsto \mathrm{Li}^\mathscr{G}_3(a) = -\mathrm{Cor}^\mathscr{G}(1,0,0,a).
\end{align*}$$*
:::

### Realisations {#realisations}

The Lie coalgebra of formal multiple polylogarithms
${\mathscr{L}}^{\mathrm{f}}(F)$ was constructed in [@CMRR24]. The goal
of this section is to construct a map of Lie coalgebras from
$\mathscr{G}(F)$ to ${\mathscr{L}}^{\mathrm{f}}(F)$. Using the results
of [@CMRR24 §5], we then construct Hodge and motivic realisations of
$\mathscr{G}(F)$.

#### Lie coalgebra of formal polylogarithms {#sec:formal-polylogarithms}

We recall the main properties of the Lie coalgebra
${\mathscr{L}}^{\mathrm{f}}(F)$ of formal polylogarithms from [@CMRR24
§2]. For any field $F$, there exists a graded Lie coalgebra
${\mathscr{L}}^{\mathrm{f}}(F)$, which is generated, as a
${\mathds{Q}}$-vector space, by *formal correlators*:
$$\mathrm{Cor}^\mathrm{f}(x_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n)\in {\mathscr{L}}^{\mathrm{f}}_n(F)\quad  \text{for}\quad x_0,\dots,x_n\in F.$$
The cobracket of formal correlators is given by the following formula:
$$\begin{equation}
 \label{eqn:form-cor-cobracket}
\delta\mathrm{Cor}^\mathrm{f}(x_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}, x_n )=\sum_{j=0}^n\sum_{i=1}^{n-1}\mathrm{Cor}^\mathrm{f}( x_{j}, x_{j+1}, \mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}, x_{j+i}) \wedge \mathrm{Cor}^\mathrm{f}( x_{j},  x_{j+i+1}, \mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}, x_{j+n})\,.
\end{equation}$$ For $n=1$, we have an isomorphism
$u\colon {\mathscr{L}}^{\mathrm{f}}_1(F)\cong F^{\times}_{{\mathds{Q}}}$
given by sending $\mathrm{Cor}^\mathrm{f}(x_0,x_1)$ to
$(x_1-x_0)\in F^{\times}_{{\mathds{Q}}}$. The formal correlators satisfy
the following identities, amongst others: $$\begin{align}
&\mathrm{Cor}^\mathrm{f}(x_0+b,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n+b)=\mathrm{Cor}^\mathrm{f}(x_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n),\label{eqn:form-cor-add}\\
&\mathrm{Cor}^\mathrm{f}(x_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_{n-1},x_n)=\mathrm{Cor}^\mathrm{f}(x_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n,x_0), \label{eqn:form-cor-cyc-sym}\\
&\mathrm{Cor}^\mathrm{f}(m x_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},m x_n)=\mathrm{Cor}^\mathrm{f}(x_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n) \text{ for } m\in F^{\times} \text{ and } n\geq 2, \label{eqn:form-cor-homog}\\
& \mathrm{Cor}^\mathrm{f}(x_0,\underbrace{x_1, \mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}, x_1}_{n-1})=0 \text{ for } n\geq 2\label{eqn:form-cor-norm}\\
&\sum_{\sigma \in {\mathrm{Sh}}(n_1,n_2)} \mathrm{Cor}^\mathrm{f}(x_0,x_{\sigma(1)},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_{\sigma(n_1+n_2)})=0\,,
\end{align}$$

The inclusion $F\hookrightarrow F(t)$ induces an injective map
$i\colon {\mathscr{L}}^{\mathrm{f}}(F)\longrightarrow{\mathscr{L}}^{\mathrm{f}}(F(t))$.
For any $t_0 \in F$, there is a specialisation homomorphism
$${\mathrm{Sp}}_{t\to t_0} \colon {\mathscr{L}}^{\mathrm{f}}(F(t))\longrightarrow{\mathscr{L}}^{\mathrm{f}}(F)$$
defined as follows. For a tuple of functions
$f_1(t),\dots,f_n(t)\in F(t)$ consider the smallest integer $d$ such
that functions $u_i(t)=(t-t_0)^d f_i(t)$ are regular at $t=t_0$. We put
$${\mathrm{Sp}}_{t\to t_0}\mathrm{Cor}^\mathrm{f}(0,f_1(t),\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},f_n(t))=\mathrm{Cor}^\mathrm{f}(0, u_1(t_0),\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},u_n(t_0)).$$
For any point $t_0\in F$ we have
${\mathrm{Sp}}_{t\to t_0}\circ i={\mathrm{id}}$. The following lemma
allows one to prove identities in ${\mathscr{L}}^{\mathrm{f}}(F)$ by
induction.

::: {#lem:specialisation in formal polylogs .lemma}
**Lemma 138**. *Consider $R\in {\mathscr{L}}^{\mathrm{f}}_n(F(t))$ such
that $\delta(R)=0$ and $n\geq 2$. Then for any $t_0, t_1\in F$ we have
$${\mathscr{S}}{\mathrm{p}}_{t\to t_0}R={\mathscr{S}}{\mathrm{p}}_{t\to t_1}R.$$*
:::

::: proof
*Proof.* By [@CMRR24 Corollary 11], the inclusion
$i\colon {\mathscr{L}}^{\mathrm{f}}(F)\to {\mathscr{L}}^{\mathrm{f}}(F(t))$
induces an isomorphism
$H^1({\mathscr{L}}^{\mathrm{f}}(F))\cong H^1({\mathscr{L}}^{\mathrm{f}}(F(t)))$
on Chevalley--Eilenberg homology. Since
$H^1({\mathscr{L}}^{\mathrm{f}}(F(t)))$ can be identified with the
kernel of the cobracket, the element $R$ lies in the image of $i$.
Moreover,
$${\mathrm{Sp}}_{t\to t_0}\circ i={\mathrm{Sp}}_{t\to t_1}\circ i={\mathrm{id}},$$
so
${\mathscr{S}}{\mathrm{p}}_{t\to t_0}R={\mathscr{S}}{\mathrm{p}}_{t\to t_1}R.$ ◻
:::

#### Formal, motivic, and Hodge realisations

The goal of this section is to construct a morphism from
$\mathscr{G}(F)$ to ${\mathscr{L}}^{\mathrm{f}}(F)$ sending correlators
to formal correlators. The key step is to prove that decomposition
relations
[\[enum:rel-goncharov-4\]](#enum:rel-goncharov-4){reference-type="eqref"
reference="enum:rel-goncharov-4"} hold in
${\mathscr{L}}^{\mathrm{f}}(F)$. We prove this by induction on weight,
using the fact that the cobracket on $\mathscr{G}(F)$ is well-defined,
as we believe this statement is difficult to verify by a direct
computation.

::: {#prop: formal realization .theorem}
**Theorem 139**. *There exists a unique morphism of graded Lie
coalgebras $$\begin{align*}
r^{{\mathrm{f}}}\colon \mathscr{G}(F) &\longrightarrow{\mathscr{L}}^{\mathrm{f}}(F) \\ \mathrm{Cor}^\mathscr{G}(x_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n) &\longmapsto \mathrm{Cor}^\mathrm{f}(x_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n).
\end{align*}$$*
:::

::: proof
*Proof.* We will show that the map $r^{{\mathrm{f}}}$ is well-defined by
induction on the weight. We start with the base case $n=1$. By
[119](#LemmaCorrelatorWeightOne){reference-type="ref+label"
reference="LemmaCorrelatorWeightOne"}, there is an isomorphism
$\mathscr{G}_1(F)\cong F^{\times}$ sending
$\smash{\mathrm{Cor}^\mathscr{G}(x_0,x_1)}$ to
$(x_0-x_1)\in  F^{\times}$. Moreover, by [@CMRR24 Lemma 1], we have an
isomorphism ${\mathscr{L}}^{\mathrm{f}}_1(F)\cong F^{\times}$ sending
$\smash{\mathrm{Cor}^\mathrm{f}(x_0,x_1)}$ to
$(x_0-x_1)\in  F^{\times}$. This proves the base case.

Assume that the map $r^{\mathrm{f}}$ is well defined for any field in
weights less than $n$. The properties
[\[eqn:form-cor-add\]](#eqn:form-cor-add){reference-type="eqref"
reference="eqn:form-cor-add"},
[\[eqn:form-cor-cyc-sym\]](#eqn:form-cor-cyc-sym){reference-type="eqref"
reference="eqn:form-cor-cyc-sym"}, and
[\[eqn:form-cor-norm\]](#eqn:form-cor-norm){reference-type="eqref"
reference="eqn:form-cor-norm"} imply that the map $r^{\mathrm{f}}_n$
vanishes on the homogeneity relation
[\[enum:rel-goncharov-1\]](#enum:rel-goncharov-1){reference-type="eqref"
reference="enum:rel-goncharov-1"}, the cyclic symmetry relation
[\[enum:rel-goncharov-2\]](#enum:rel-goncharov-2){reference-type="eqref"
reference="enum:rel-goncharov-2"}, and the shuffle relations
[\[enum:rel-goncharov-3\]](#enum:rel-goncharov-3){reference-type="eqref"
reference="enum:rel-goncharov-3"}. It remains to show that
$r^{\mathrm{f}}$ kills the decomposition relation
[\[enum:rel-goncharov-4\]](#enum:rel-goncharov-4){reference-type="eqref"
reference="enum:rel-goncharov-4"} in weight $n$.

First consider a field $L=F(X_0,\dots,X_n,Y_0,\dots,Y_n)$. The
decomposition relation for the tuples
$tX_0+(1-t)Y_0,\dots, tX_n+(1-t)Y_n$ and $Y_0,\dots, Y_n$ yields the
following identity in $\mathscr{G}_n(L(t))$: $$\begin{align*}
  &\mathrm{Cor}^\mathscr{G}(tX_0+(1-t)Y_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},tX_n+(1-t)Y_n)-\mathrm{Cor}^\mathscr{G}(Y_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},Y_n)\\
     &=\sum_{\iota=((i_1,j_1),\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},(i_{n},j_n))\in T(n)}{\mathrm{sign}}(\iota)
     \mathrm{Cor}^\mathscr{G}\left(0,(1-t)+t\frac{X_{i_1}-X_{j_1}}{Y_{i_1}-Y_{j_1}},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},(1-t)+t\frac{X_{i_n}-X_{j_n}}{Y_{i_n}-Y_{j_n}}\right).
\end{align*}$$ Applying the cobracket, we obtain the identity
$$\begin{align*}
  &\delta\mathrm{Cor}^\mathscr{G}(tX_0+(1-t)Y_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},tX_n+(1-t)Y_n)-\delta\mathrm{Cor}^\mathscr{G}(Y_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},Y_n)\\
     &=\sum_{\iota=((i_1,j_1),\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},(i_{n},j_n))\in T(n)}{\mathrm{sign}}(\iota)
     \delta\mathrm{Cor}^\mathscr{G}\left(0,(1-t)+t\frac{X_{i_1}-X_{j_1}}{Y_{i_1}-Y_{j_1}},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},(1-t)+t\frac{X_{i_n}-X_{j_n}}{Y_{i_n}-Y_{j_n}}\right)
\end{align*}$$ which holds in the weight $n$ component of
$\Lambda^2 \mathscr{G}(L(t))$. By the induction hypothesis, the map
$\Lambda^2r^{\mathrm{f}}\colon \Lambda^2 \mathscr{G}(L(t)) \longrightarrow\Lambda^2 {\mathscr{L}}^{\mathrm{f}}(L(t))$
is well-defined on the weight $n$ component. All terms of the relation
above have distinct arguments, so the cobracket of each term can be
computed using
[\[thm:polyl-presentation-cobracket\]](#thm:polyl-presentation-cobracket){reference-type="ref+label"
reference="thm:polyl-presentation-cobracket"}. Since the cobracket in
${\mathscr{L}}^{\mathrm{f}}(L(t))$ is given by the analogous formula
[\[eqn:form-cor-cobracket\]](#eqn:form-cor-cobracket){reference-type="eqref"
reference="eqn:form-cor-cobracket"}, the element $$\begin{align*}
R=&\mathrm{Cor}^\mathrm{f}(tX_0+(1-t)Y_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},tX_n+(1-t)Y_n)-\mathrm{Cor}^\mathrm{f}(Y_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},Y_n)\\
     &-\sum_{\iota=((i_1,j_1),\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},(i_{n},j_n))\in T(n)}{\mathrm{sign}}(\iota)
   \mathrm{Cor}^\mathrm{f}\left(0,(1-t)+t\frac{X_{i_1}-X_{j_1}}{Y_{i_1}-Y_{j_1}},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},(1-t)+t\frac{X_{i_n}-X_{j_n}}{Y_{i_n}-Y_{j_n}}\right)
\end{align*}$$ satisfies the identity $\delta(R)=0$. Recall the
specialisation homomorphisms from
[7.4.1](#sec:formal-polylogarithms){reference-type="ref+label"
reference="sec:formal-polylogarithms"}. Using
[\[eqn:form-cor-norm\]](#eqn:form-cor-norm){reference-type="eqref"
reference="eqn:form-cor-norm"}, we obtain on the one hand an equation
$$\begin{align*}
{\mathscr{S}}{\mathrm{p}}_{t\to 0}(R)= &\mathrm{Cor}^\mathrm{f}(Y_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},Y_n)-\mathrm{Cor}^\mathrm{f}(Y_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},Y_n)-\sum_{\iota\in T(n)}{\mathrm{sign}}(\iota)
   \mathrm{Cor}^\mathrm{f}\left(0,1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},1\right)=0.
\end{align*}$$ On the other hand,
[138](#lem:specialisation in formal polylogs){reference-type="ref+label"
reference="lem:specialisation in formal polylogs"} yields that
$$\begin{align*}
 0={\mathscr{S}}{\mathrm{p}}_{t\to 1}(R)= &\mathrm{Cor}^\mathrm{f}(X_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},X_n)-\mathrm{Cor}^\mathrm{f}(Y_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},Y_n)\\
     &-\sum_{\iota=((i_1,j_1),\dots,(i_{n},j_n))\in T(n)}{\mathrm{sign}}(\iota)
     \mathrm{Cor}^\mathrm{f}\left(0,\frac{X_{i_1}-X_{j_1}}{Y_{i_1}-Y_{j_1}},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},\frac{X_{i_n}-X_{j_n}}{Y_{i_n}-Y_{j_n}}\right).
\end{align*}$$ This establishes the decomposition relation for tuples
$(x_0,\dots,x_n)$ and $(y_0,\dots,y_n)$ such that points $y_0,\dots,y_n$
are distinct after specialisation of $X_i$ to $x_i$ and $Y_j$ to $y_j$.
We call this relation the *generic decomposition relation*.

It remains to prove the decomposition relation for an arbitrary tuple
$y_0,\dots,y_n$. Points $y_1,\dots,y_n$ are not all the equal, and we
may assume $y_0\neq y_n$, by cyclic symmetry. Consider variables
$C_0,C_1,\ldots,C_n$ and $t$. The generic decomposition relation implies
that $$\begin{align*}
 0= &\mathrm{Cor}^\mathrm{f}(x_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n)-\mathrm{Cor}^\mathrm{f}(y_0+C_0 T,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},y_n+C_n T)\\
     &-\sum_{\iota\in T(n)}{\mathrm{sign}}(\iota)
     \mathrm{Cor}^\mathrm{f}\left(0,\frac{X_{i_1}-X_{j_1}}{(y_{i_1}-y_{j_1})+(C_{i_1}-C_{j_1})t},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},\frac{X_{i_n}-X_{j_n}}{(y_{i_n}-y_{j_n})+(C_{i_n}-C_{j_n})t}\right).
\end{align*}$$

Consider an equivalence relation $\sim$ on the set $\{0,\dots,n\}$
defined by $i\sim j$ when $y_i=y_j$; note that $0 \not \sim n$. We call
a term
$$\mathrm{Cor}^\mathrm{f}\left(0,\frac{X_{i_1}-X_{j_1}}{(y_{i_1}-y_{j_1})+(C_{i_1}-C_{j_1})t},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},\frac{X_{i_n}-X_{j_n}}{(y_{i_n}-y_{j_n})+(C_{i_n}-C_{j_n})t}\right)$$
*regular* if $i_1 \not \sim j_1$, ..., $i_n \not \sim j_n$; the other
terms are called *singular*. We claim that the sum of singular terms
vanishes under the specialisation map
$${\mathscr{S}}{\mathrm{p}}_{t\to 0}\colon  {\mathscr{L}}^{\mathrm{f}}(F(t,X_1,\dots,X_n,C_0,C_1,\dots,C_n))\longrightarrow{\mathscr{L}}^{\mathrm{f}}(F(X_1,\dots,X_n,C_0,C_1,\dots,C_n)).$$
This would imply the statement of this proposition, after applying
further specialisations sending $C_i$ to $0$ and $X_i$ to $x_i$. To
prove the claim note that specialisation of a singular term can be
described by making following substitutions:
$$\frac{X_{i}-X_{j}}{(y_{i}-y_{j})+(C_{i}-C_{j})t} \longmapsto \begin{cases} 0 & \text{if $i \not \sim j$,} \\
\frac{X_{i}-X_{j}}{C_{i}-C_{j}} & \text{if $i \sim j$.}\end{cases}$$ For
example, specialisation of the term
$$\mathrm{Cor}^\mathrm{f}\left(0,\frac{X_{0}-X_{1}}{y_{0}-y_{1}+(C_{0}-C_{1})t},\frac{X_{1}-X_{2}}{(y_{1}-y_{2})+(C_{1}-C_{2})t},\frac{X_{2}-X_{3}}{(y_{2}-y_{3})+(C_{2}-C_{3})t}\right)$$
for $y_0\neq y_1=y_2=y_3$ equals
$$\mathrm{Cor}^\mathrm{f}\left(0,0,\frac{X_{1}-X_{2}}{(C_{1}-C_{2})},\frac{X_{2}-X_{3}}{(C_{2}-C_{3})}\right).$$
[28](#lem:symbol and equivalence relation){reference-type="ref+label"
reference="lem:symbol and equivalence relation"} applied to the set
$S=\{0, \dots,n\}$ and equivalence relation $\sim$ implies that the
specialisations of singular terms cancel out. ◻
:::

The first part of the following result is
[\[thm:motivic-realisation\]](#thm:motivic-realisation){reference-type="ref+label"
reference="thm:motivic-realisation"} and the second part is
[\[thm:hodge-realisation\]](#thm:hodge-realisation){reference-type="ref+label"
reference="thm:hodge-realisation"}.

::: theorem
**Theorem 140**. * *

1.  *If $F$ is a number field there is a unique *motivic realisation*
    map of Lie coalgebras $$\begin{align*}
     r^{{\mathrm{MTM}}}\colon \mathscr{G}(F) &\longrightarrow{\mathscr{L}}^{\mathrm{MTM}}(F) \\
        \mathrm{Cor}^\mathscr{G}(x_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n) &\longmapsto \mathrm{Cor}^{\mathrm{MTM}}(x_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n).
    \end{align*}$$*

2.  *For an embedding $\sigma \colon F \to {\mathds{C}}$ there is a
    unique *Hodge realisation* map of Lie coalgebras $$\begin{align*}
     r^{\mathrm{Hod}}_\sigma \colon \mathscr{G}(F) &\longrightarrow{\mathcal{L}}^{\mathrm{Hod}}(F) \\
        \mathrm{Cor}^\mathscr{G}(x_0,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n) &\longmapsto \mathrm{Cor}^{\mathrm{Hod}}(\sigma(x_0),\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},\sigma(x_n)).
    \end{align*}$$*
:::

::: proof
*Proof.* The first part is a consequence of
[139](#prop: formal realization){reference-type="ref+label"
reference="prop: formal realization"} and [@CMRR24 Proposition 50], and
the second is a consequence of
[139](#prop: formal realization){reference-type="ref+label"
reference="prop: formal realization"} and [@CMRR24 Proposition 48]. The
uniqueness follows since the correlators generate $\mathscr{G}_n(F)$. ◻
:::

::: remark
*Remark 141*. The formal realisation
$r^{\mathrm{f}} \colon {\mathscr{G}}_n(F) \to {\mathscr{L}}^{\mathrm{f}}_n(F)$
is an isomorphism for $n \leq 2$ by [@CMRR24 §4.4]. One might wonder
whether it is an isomorphism for $n \geq 3$ as well.
:::

As an application, we use formal realisation to give a noncomputational
proof of the cobracket of classical trilogarithm, though a computational
proof is also possible albeit lengthy:

::: lemma
**Lemma 142**. *The cobracket of the classical trilogarithm is given by
the formula $$\begin{equation}
\label{eqn:cobracket of classical polylog}
    \delta \bigl( \mathrm{Li}^\mathscr{G}_3(a)\bigr)=\mathrm{Li}^\mathscr{G}_2(a)\otimes a.
\end{equation}$$*
:::

::: proof
*Proof.* By [@CMRR24 Proposition 45] the map
$\mathscr{G}_2(F)\to {\mathscr{L}}^{\mathrm{f}}_2(F)$ is an isomorphism,
so the cobracket of $\mathrm{Li}^\mathscr{G}_3(a)$ agrees with the
cobracket of $\mathrm{Li}^{\mathrm{f}}_3(a)$ which is given by
[\[eqn:cobracket of classical polylog\]](#eqn:cobracket of classical polylog){reference-type="eqref"
reference="eqn:cobracket of classical polylog"}. ◻
:::

## The duality involution on ${\mathscr{G}}(F)$

In this section we investigate the duality involution on the Goncharov
Lie coalgebra. More precisely, taking duals is an involution of the
category ${\mathrm{Vect}}$ of finite-dimensional vector spaces over $F$.
This induces an involution on ${\mathscr{G}}(F)$ and we determine in
this section that it acts by $(-1)^n$ in rank $n$. We follow
[1](#conv:shorter-notation){reference-type="ref+label"
reference="conv:shorter-notation"}.

### The duality involution

The symmetric monoidal groupoid ${\mathrm{Vect}}$ of finite-dimensional
vector spaces over $F$ admits a symmetric monoidal automorphism
$$\vee \colon {\mathrm{Vect}}\longrightarrow{\mathrm{Vect}}$$ that takes
an object $V$ to its linear dual $V^\vee$ and a linear isomorphism
$A \colon V \to W$ to the inverse of its linear dual
$(A^\vee)^{-1} \colon V^\vee \to W^\vee$, in terms of matrices given by
taking the transpose inverse. This is an involution up to the natural
equivalence ${\mathrm{ev}} \colon V \to (V^\vee)^\vee$ given by sending
$v$ to the functional that evaluates linear functionals at $v$. This
fits in a commutative diagram with
$\dim \colon {\mathrm{Vect}}\to {\mathds{N}}$ and the identity
automorphism of ${\mathds{N}}$. Taking classifying spaces as in
[6.1](#sec:action-by-scaling){reference-type="ref+label"
reference="sec:action-by-scaling"}, this lifts ${\mathbf{BGL}}^+$ to a
functor
$${\mathbf{BGL}}^+ \colon {\mathrm{B}}C_2 \longrightarrow{\mathrm{Alg}}_{E_\infty^{\mathrm{u}}}({\mathrm{Fun}}({\mathds{N}},{{\mathscr{S}}{\mathrm{pc}}})).$$
Unwinding the definitions, in rank $n$ this is the following map. For
each $n$-dimensional vector space $V$, the inclusion the orbit groupoid
$*{\sslash} {\mathrm{GL}}(V) \to {\mathrm{Vect}}$ induces an equivalence
${\mathrm{BGL}}(V) \to {\mathbf{BGL}}^+(n)$ and the duality involution
restricts to the map
$${\mathrm{B}}{\vee} \colon {\mathrm{BGL}}(V) \longrightarrow{\mathrm{BGL}}(V^\vee)$$
induced by the isomorphism of groups given by $A \mapsto (A^\vee)^{-1}$.
Upon picking an isomorphism $V^\vee \cong V$, we can identify the domain
and target; any two isomorphisms induce homotopic identifications on
classifying spaces. In the special case that $V = F^n$, the canonical
basis allows us to identify
${\mathrm{GL}}(V) = {\mathrm{GL}}_n = {\mathrm{GL}}(V^\vee)$ and
${\mathrm{B}}{\vee}$ is induced by the automorphism of the group
${\mathrm{GL}}_n$ given by $A \mapsto (A^t)^{-1}$.

Any object obtained naturally from ${\mathbf{BGL}}^+$ as a unital
$E_\infty$-algebra in spaces inherits an involution. In particular,
postcomposing with the rationalisation
${{\mathscr{S}}{\mathrm{pc}}}\to {{\mathscr{D}}_{\mathds{Q}}}$, passing
to the augmentation ideal of the canonical augmentation, and taking
$E_\infty^{\mathrm{nu}}$-indecomposables, we get a functor
$${\mathrm{cot}}_{E_\infty^{\mathrm{nu}}}({\mathbf{BGL}}_{\mathds{Q}}) \colon {\mathrm{B}}C_2 \longrightarrow{\mathrm{Fun}}({\mathds{N}},{{\mathscr{D}}_{\mathds{Q}}})$$
that induces an involution on the $E_\infty$-homology.

#### Description in terms of buildings

Our next goal is describe this involution more concretely in terms of
the homotopy orbits of buildings. To do so, we take a slightly different
perspective. First, note that $\vee$ induces a symmetric monoidal
automorphism $\vee_!$ of ${\mathrm{Fun}}({\mathrm{Vect}},{\mathscr{C}})$
for any presentable symmetric monoidal category ${\mathscr{C}}$, and by
naturality of the Day convolution an automorphism of
${\mathrm{Alg}}_{E_\infty^{\mathrm{u}}}({\mathrm{Fun}}({\mathrm{Vect}},{\mathscr{C}}))$.
Taking ${\mathscr{C}} = {{\mathscr{S}}{\mathrm{pc}}}$, for the terminal
$E_\infty^{\mathrm{u}}$-algebra ${\underline{\ast}}$ there is an
essentially unique equivalence
$\tau \colon  {\underline{\ast}} \simeq \vee_!({\underline{\ast}})$.
Using the natural equivalence $\psi \colon \dim_! \vee_! \simeq \dim_!$,
we obtain the above automorphism as the composition
$${\mathbf{BGL}}^+ = \dim_!({\underline{\ast}}) \underset{\simeq}{\xrightarrow{\dim_! \tau_!}} \dim_! \vee_!({\underline{\ast}}) \underset{\simeq}{\xrightarrow{\psi}} \dim_!({\underline{\ast}}) = {\mathbf{BGL}}^+.$$

Since $\vee_!$ is a symmetric monoidal equivalence, on iterated bar
constructions we obtain a natural equivalence
${\mathrm{Bar}}^k_\boxplus\vee_! \simeq \vee_! {\mathrm{Bar}}^k_\boxplus$
of functors
${\mathrm{Alg}}^{\mathrm{aug}}_{E_k^{\mathrm{u}}}({\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{S}}{\mathrm{pc}}}_*)) \to {\mathrm{Fun}}({\mathrm{Vect}},{{\mathscr{S}}{\mathrm{pc}}}_*)$
and from this we obtain induced equivalences
$$\tau^k_! \colon {\mathrm{Bar}}^k_\boxplus({\underline{\ast}}_+) \simeq {\mathrm{Bar}}^k_\boxplus(\vee_! {\underline{\ast}}_+) \simeq \vee_! {\mathrm{Bar}}^k_\boxplus({\underline{\ast}}_+)$$
for $k \geq 1$. This can be understood more concretely using the
identification [@GKRW20 Section 5.4] explained in
[4.4.1](#sec:buildings){reference-type="ref+label"
reference="sec:buildings"}
$${\mathrm{Bar}}^k_\boxplus({\underline{\ast}}_+)(V) \simeq \widetilde{D}^k(V)$$
of the bar construction with the split buildings of [@GKRW20 Definition
5.9]. Recall the split building is a $k$-fold pointed simplicial set of
direct sum decompositions of $V$ encoded by $k$-dimensional grids of
summands (see loc.cit. for details) and under the aforementioned
identification, the involution is given by the map
$\smash{\widetilde{D}^k(V)} \to \smash{\widetilde{D}^k(V^\vee)}$ taking
a direct sum decomposition of $V$ to the dual one of $V^\vee$.

Applying $\dim_!$ we get an equivalence
$$\dim_! {\mathrm{Bar}}^k_\boxplus({\underline{\ast}}_+) \underset{\simeq}{\xrightarrow{\dim_! \tau^k_!}} \dim_! \vee_! {\mathrm{Bar}}^k_\boxplus({\underline{\ast}}_+) \underset{\simeq}{\xrightarrow{\psi_!}}  \dim_! {\mathrm{Bar}}^k_\boxplus({\underline{\ast}}_+)$$
that in rank $n$ is as follows. For each $n$-dimensional vector space
$V$, the inclusion induces an equivalence
$\smash{\widetilde{D}^k(V)}_{{\mathrm{GL}}(V)} \to (\dim_! {\mathrm{Bar}}^k_\boxplus({\underline{\ast}}_+))(n)$
on orbits and the dualisation involution restricts along these to the
map
$$\smash{\widetilde{D}^k(V)}_{{\mathrm{GL}}(V)} \longrightarrow\smash{\widetilde{D}^k(V^\vee)}_{{\mathrm{GL}}(V^\vee)}$$
induced on orbits by the dualisation map.

To relate this to the nonsplit buildings that appear in
[4.4.1](#sec:buildings){reference-type="ref+label"
reference="sec:buildings"}, recall the map
$\widetilde{D}^k(V) \to D^k(V)$ forgetting from splitting to flags
[@GKRW20 (5.6)] induces a homology isomorphism [@GKRW20 Theorem 5.18]
$$\dim_! \widetilde{D}^k(V) \longrightarrow\dim_! D^k(V)$$ and there is
an evidently commutative square
$$\begin{tikzcd} \widetilde{D}^k(V) \rar{\vee} \dar & \widetilde{D}^k(V^\vee) \dar \\[-5pt]
D^k(V) \rar{\vee} & D^k(V^\vee) \end{tikzcd}$$ where the bottom map
taking flags of $V$ to the dual flags of $V^\vee$. The nonsplit
buildings are related to $E_k$-homology (and hence $E_\infty$-homology,
by taking infinite bar spectra) by passing to rational chains and
applying the natural equivalence
${\mathrm{Bar}}^k \simeq (\Sigma^k {\mathrm{indec}}_{E_k^{\mathrm{nu}}})^+$
of [206](#thm:indec-is-bar){reference-type="ref+label"
reference="thm:indec-is-bar"}, so we can understand the duality
involution on $E_\infty$-homology by computing the isomorphisms
${\mathrm{St}}^{\infty}(V) \to {\mathrm{St}}^{\infty}(V^\vee)$ via the
action on buildings and taking the induced maps on homology
$$H_*({\mathrm{GL}}(V);{\mathrm{St}}^{\infty}(V)) \longrightarrow H_*({\mathrm{GL}}(V^\vee);{\mathrm{St}}^{\infty}(V^\vee)).$$
The same holds for $E_1$- and $E_2$-homology, in terms of the Steinberg
modules ${\mathrm{St}}(-)$ and double Steinberg modules
${\mathrm{St}}^{2}(-)$. Upon picking an isomorphism $V \cong V^\vee$, we
can identify the domain and target; this identification is independent
of our choice of isomorphism, since the map induced by any other choice
differs by an inner automorphism and acts as the identity on group
homology [@Brown III.8.1].

#### The duality involution on Steinberg modules

We now implement this. We read off from the induced action on buildings
that the involution on ${\mathrm{Vect}}$ induces an isomorphism of
Steinberg modules $$\begin{align*}
 \vee_* \colon {\mathrm{St}}(V) &\longrightarrow{\mathrm{St}}(V^\vee) \\
[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n] &\longmapsto [v_1^\vee,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n^\vee],
\end{align*}$$ sending the apartment corresponding to a basis to the
apartment corresponding to a dual basis. Similarly, we read off from the
induced action on double buildings that the involution on
${\mathrm{Vect}}$ induces an isomorphism of double Steinberg modules
$$\begin{equation}
\label{eqn:sth-duality-vee}\begin{aligned}\vee_* \colon {\mathrm{St}}^{2}(V) &\longrightarrow{\mathrm{St}}^{2}(V^\vee) \\
[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n] \otimes [w_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},w_n] &\longmapsto [v_1^\vee,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n^\vee] \otimes [w_1^\vee,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},w_n^\vee],\end{aligned}
\end{equation}$$ sending the apartment corresponding to a basis to the
apartment corresponding to a dual basis. This is *not* the duality
isomorphism $D$ considered in [@CharltonRadchenkoRudenko (30)], which is
rather given by $$\begin{equation}
\label{eqn:sth-duality-d} \begin{aligned} D \colon {\mathrm{St}}^{2}(V) &\longrightarrow{\mathrm{St}}^{2}(V^\vee) \\
[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n] \otimes [w_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},w_n] &\longmapsto [w_1^\vee,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},w_n^\vee] \otimes [v_1^\vee,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n^\vee].\end{aligned}
\end{equation}$$ Finally, the map
$\vee_* \colon {\mathrm{St}}^{\infty}(V) \to {\mathrm{St}}^{\infty}(V^\vee)$
is induced by map on ${{{\mathscr{S}}{\mathrm{t}}}^2}$. The duality
isomorphism $D$ of
[\[eqn:sth-duality-d\]](#eqn:sth-duality-d){reference-type="eqref"
reference="eqn:sth-duality-d"} also is compatible with the algebra
structure and also induces a map
$D \colon {\mathrm{St}}^{\infty}(V) \to {\mathrm{St}}^{\infty}(V^\vee)$.
They are related as follows:

::: {#lem:duality-on-stl-sign .lemma}
**Lemma 143**. *As maps
${\mathrm{St}}^{\infty}(V) \to {\mathrm{St}}^{\infty}(V^\vee)$ we have
$$\vee_* = (-1)^{\dim(V)-1} D.$$ In particular, on
$H_*({\mathrm{GL}}_n;{\mathrm{St}}^{\infty}_n)$ we have
$\vee_* = (-1)^{n-1} D$.*
:::

::: proof
*Proof.* Comparing the formulas
[\[eqn:sth-duality-d\]](#eqn:sth-duality-d){reference-type="eqref"
reference="eqn:sth-duality-d"} and
[\[eqn:sth-duality-vee\]](#eqn:sth-duality-vee){reference-type="eqref"
reference="eqn:sth-duality-vee"}, we see that they differ by composition
with an instance of the swap map $$\begin{align*}
{\mathrm{rev}} \colon {\mathrm{St}}^{2}(W) & \longrightarrow{\mathrm{St}}^{2}(W) \\
[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n] \otimes [w_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},w_n] &\longmapsto [w_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},w_n] \otimes [v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n].
\end{align*}$$ (One may be tempted to call it the Poincaré or Verdier
duality involution, following [@BGSV90 2.1.6].) Recall that the symbol
maps fit into a commutative diagram
$$\begin{tikzcd} {\mathrm{St}}^{2}(V) \dar[two heads] \rar[hook]{s^{\mathrm{As}}} &[20pt]  ({\mathrm{B}}^{\mathrm{As}}{{\mathscr{S}}{\mathrm{t}}})_n(V) \dar[two heads]\\[-5pt]
{\mathrm{St}}^{\infty}(V)  \rar[hook]{s^{\mathrm{Com}}}  & ({\mathrm{B}}^{\mathrm{Com}}{{\mathscr{S}}{\mathrm{t}}})_n(V)\end{tikzcd}$$
with horizontal maps injective, surjective left vertical map the
canonical projection, and surjective right vertical map the quotient by
shuffles (see [2.6](#sec:symbol-maps){reference-type="ref+label"
reference="sec:symbol-maps"}). We now use the formula of
[@CharltonRadchenkoRudenko Lemma 19]:
$$s([v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n] \otimes [w_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},w_n]) = \sum_{\sigma,\tau \in {\mathfrak{S}}_n} (-1)^\sigma (-1)^\tau [F^\sigma_1 \cap G^\tau_n|F^\sigma_2 \cap G^\tau_{n-1}|\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}|F^\sigma_n \cap G^\tau_1]$$
where $F^\sigma_i = {\mathrm{span}}(v_{\sigma(1)},\ldots,v_{\sigma(i)})$
and $G^\tau_j = {\mathrm{span}}(w_{\tau(n-j+1)},\ldots,w_{\tau(n)})$,
and a term in the sum is zero if the two flags are not in general
position. Letting $\rho \in {\mathfrak{S}}_n$ denote the involution with
$\rho(i) = n-i+1$, we see that
$s([w_1,\ldots,w_n] \otimes [v_1,\ldots,v_n])$ is given instead by
$$\sum_{\sigma,\tau \in {\mathfrak{S}}_n} (-1)^{\rho \sigma \rho^{-1}} (-1)^{\rho \tau \rho^{-1}} [G_1^{\rho \tau \rho^{-1}} \cap F_n^{\rho \sigma \rho^{-1}}|G_2^{\rho \tau \rho^{-1}} \cap F_{n-1}^{\rho \sigma \rho^{-1}}|\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}|G_n^{\rho \tau \rho^{-1}} \cap F_1^{\rho \sigma \rho^{-1}}].$$
Up to shuffles we have that
$[v_1|\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}|v_n] = (-1)^{n-1} [v_n|\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}|v_1]$
so this is equal to
$$(-1)^{n-1} \sum_{\sigma,\tau \in {\mathfrak{S}}_n} (-1)^{\rho \sigma \rho^{-1}} (-1)^{\rho \tau \rho^{-1}} [G_n^{\rho \tau \rho^{-1}} \cap F_1^{\rho \sigma \rho^{-1}}|G_{n-1}^{\rho \tau \rho^{-1}} \cap F_{2}^{\rho \sigma \rho^{-1}}|\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}|G_1^{\rho \tau \rho^{-1}} \cap F_n^{\rho \sigma \rho^{-1}}]$$
and reindexing the sum, we get the desired equality. ◻
:::

#### Compatibility between the duality involution and the scaling action

Finally, we comment on the compatibility between the duality involution
and the scaling action. This can be seen by combining both the scaling
action and duality involution into a functor
$${\mathbf{BGL}}^+ \colon B(C_2 \ltimes BF^\times) \longrightarrow{\mathrm{Alg}}_{E_\infty^{\mathrm{u}}}({\mathrm{Fun}}({\mathds{N}},{{\mathscr{S}}{\mathrm{pc}}}))$$
where the domain is obtained from the $2$-category with unique object
$\ast$, $1$-morphisms given by ${\mathrm{id}}$ and $\vee$ with
$\vee^2 = {\mathrm{id}}$, and $2$-morphisms given by $F^\times$, where
the "whiskering" of $\vee$ with $\lambda$ is given by $\lambda^{-1}$.

::: lemma
**Lemma 144**. *Under the splittings of
[\[eqn:splitting\]](#eqn:splitting){reference-type="eqref"
reference="eqn:splitting"}
$$H_{*}({\mathrm{GL}}_n,{\mathrm{St}}^{\infty}_n) \cong H_*({\mathrm{PGL}}_n,{\mathrm{St}}^{\infty}_n) \otimes \Lambda^*F^\times$$
the $C_2$-action splits and acts by $(-1)^*$ on the second factor.*
:::

### Duality involution {#section: duality computation}

In this section, we compute the action of the duality automorphism
$\vee_*$ on $\mathscr{G}_n$ using our presentation:

::: {#theorem: duality .theorem}
**Theorem 145**. *The map $\vee_*$ acts by $(-1)^n$ on $\mathscr{G}_n$.*
:::

By [143](#lem:duality-on-stl-sign){reference-type="ref+label"
reference="lem:duality-on-stl-sign"}, it suffices to show that the map
$D_*$ acts by $(-1)$ on $H_1({\mathrm{GL}}_n;{\mathrm{St}}^{\infty}_n)$.

#### An explicit description of the map $D_*$

Recall from
[21](#def:steinberg-iterated-integral){reference-type="ref+label"
reference="def:steinberg-iterated-integral"} that for an ordered basis
$v_1,\dots,v_n$ the corresponding Steinberg iterated integral is given
by
$${\mathrm{I}}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n]=(-1)^n [v_n,v_{n-1},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_1]\otimes [v_n,v_{n-1}-v_n,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_1-v_2]\in {\mathrm{St}}^{2}(V).$$
Denote by $v^1,\dots,v^n$ the dual basis, so that
[\[eqn:sth-duality-d\]](#eqn:sth-duality-d){reference-type="eqref"
reference="eqn:sth-duality-d"} implies that we have $$\begin{align*}
    D({\mathrm{I}}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n])&=(-1)^n [v^1+\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}+v^n,v^1+\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}+v^{n-1},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v^1]\otimes [v^n,v^{n-1},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v^1]\\
    &=(-1)^n [v^1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v^1+\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}+v^{n-1}, v^1+\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}+v^n]\otimes [v^1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v^{n-1},v^n]\\
    &={\mathrm{I}}[v^1+\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}+v^n,v^1+\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}+v^{n-1},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v^1].
\end{align*}$$ The Steinberg correlator
${\mathrm{C}}[0:v_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_n]$
is the projection of the element
$(-1)^n{\mathrm{I}}[v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n]$
from ${\mathrm{St}}^{2}(V)$ to ${\mathrm{St}}^{\infty}(V)$, so
$$\begin{equation}
\label{eqn: duality for correlators}
    D({\mathrm{C}}[0:v_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_n])= {\mathrm{C}}[0:v^1+\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}+v^n:v^1+\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}+v^{n-1}:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_1]
\end{equation}$$ as in [@CMRR24 Proposition 32]. Recall from
[5.2](#sec:generators of G){reference-type="ref+label"
reference="sec:generators of G"} that we have an exact sequence
$$0  \longrightarrow\mathrm{FCR}(V) \longrightarrow\mathrm{FC}(V) \longrightarrow{\mathrm{St}}^{\infty}(V) \longrightarrow 0$$
and $\mathscr{G}_n(F)$ is isomorphic to
$H_0({\mathrm{GL}}(V);\mathrm{FCR}(V))$. The map $D$ does not admit a
natural extension to the projective module $\mathrm{FC}(V)$, so we will
use a different resolution instead.

Let ${\mathrm{Bas}}_V$ be the set of bases of $V$ and define
$$\begin{align*}
{\mathrm{Bas}} \colon {\mathrm{Vect}}&\longrightarrow{\mathrm{GrMod}}_{{\mathds{Q}}} \\
V &\longmapsto {\mathds{Q}}[{\mathrm{Bas}}_V]
\end{align*}$$ with the free ${\mathds{Q}}$-vector space on ordered
bases of $V$, a free ${\mathrm{GL}}(V)$-module concentrated in degree
$0$. Concatenation of bases lifts
${\mathrm{Bas}} \in {\mathrm{Fun}}({\mathrm{Vect}},{\mathrm{GrMod}}_{{\mathds{Q}}})$
to a $E_1$-algebra with respect to the tensor product $\boxplus$.

There is a surjective morphism $$\begin{align*}
{\mathrm{Bas}}(V) &\longrightarrow{\mathrm{St}}^{\infty}(V) \\
[(v_1,\dots,v_n)] &\longmapsto {\mathrm{C}}[0:v_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_n],
\end{align*}$$ and we denote its kernel by
$\widetilde{\mathrm{FCR}}(V)$. Since ${\mathrm{Bas}}(V)$ is a free
${\mathrm{GL}}(V)$-module with coinvariants ${\mathds{Q}}$, the exact
sequence
$0 \to \widetilde{\mathrm{FCR}}(V) \to {\mathrm{Bas}}(V) \to {\mathrm{St}}^{\infty}(V) \to 0$
induces an exact sequence of group homology: $$\begin{equation}
 \label{eqn: exact sequence for tilde FR}
    0 \longrightarrow\mathscr{G}_n(F)\longrightarrow H_0({\mathrm{GL}}(V);\widetilde{\mathrm{FCR}}(V)) \longrightarrow{\mathds{Q}}\longrightarrow 0.
\end{equation}$$

Consider now the surjective map $$\begin{align*}
 {\mathrm{pr}}\colon {\mathrm{Bas}}(V) &\longrightarrow\mathrm{FC}(V) \\
[(v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n)] &\longmapsto \mathrm{FC}[0:v_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_n],
\end{align*}$$ fitting in a morphism of exact sequences
$$\begin{tikzcd}0\rar & \widetilde{\mathrm{FCR}}(V)\rar \dar & {\mathrm{Bas}}(V) \rar \dar{{\mathrm{pr}}} & {\mathrm{St}}^{\infty}(V) \dar{\cong} \rar & 0\\[-5pt]
0 \rar & \mathrm{FCR}(V) \rar &  \mathrm{FC}(V) \rar & {\mathrm{St}}^{\infty}(V) \rar & 0.
\end{tikzcd}$$ The induced map
$H_0({\mathrm{GL}}(V);\widetilde{\mathrm{FCR}}(V))\to H_0({\mathrm{GL}}(V);\mathrm{FCR}(V))\cong \mathscr{G}(V)$
on coinvariants gives a splitting of the exact sequence
[\[eqn: exact sequence for tilde FR\]](#eqn: exact sequence for tilde FR){reference-type="eqref"
reference="eqn: exact sequence for tilde FR"}.

The formula
[\[eqn: duality for correlators\]](#eqn: duality for correlators){reference-type="eqref"
reference="eqn: duality for correlators"} for the action of $D$ on
Steinberg correlators implies that the map
$D\colon {\mathrm{St}}^{\infty}(V)\to  {\mathrm{St}}^{\infty}(V)$
extends to a map of short exact sequences
$$\begin{tikzcd}0\rar &  \widetilde{\mathrm{FCR}}(V)\rar \dar{D} & {\mathrm{Bas}}(V)\rar \dar{D} & {\mathrm{St}}^{\infty}(V) \dar{D} \rar & 0\\[-5pt]
0 \rar & \widetilde{\mathrm{FCR}}(V^{\vee}) \rar &  {\mathrm{Bas}}(V^{\vee})\rar & {\mathrm{St}}^{\infty}(V) \rar & 0
\end{tikzcd}$$ where $D$ acts on ${\mathrm{Bas}}(V)$ by the formula
$$D([(v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n)])=[(v^1+\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}+v^n,v^1+\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}+v^{n-1},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v^1)].$$
The map of short exact sequences induces the map
$$\begin{tikzcd}0\rar &  \mathscr{G}_n \rar \dar{D_*} & H_0({\mathrm{GL}}(V);{\mathrm{Bas}}(V))\rar \dar{D_*} & {\mathds{Q}}\dar{D_*} \rar & 0\\[-5pt]
0 \rar & \mathscr{G}_n \rar &  H_0({\mathrm{GL}}(V);{\mathrm{Bas}}(V^{\vee}))\rar & {\mathds{Q}}\rar & 0
\end{tikzcd}$$ which we will use to compute the action of $D$ on
$\mathscr{G}_n$. Here we have used that since ${\mathscr{G}}_n$ is
defined as the coinvariants $\mathrm{FCR}(V)_{{\mathrm{GL}}(V)}$, the
isomorphism
$$\mathrm{FCR}(V)_{{\mathrm{GL}}(V)} \overset{\cong}\longrightarrow\mathrm{FCR}(F^n)_{{\mathrm{GL}}_n} = {\mathscr{G}}_n$$
induced by a linear isomorphism $V \cong F^n$ is in fact independent of
the choice of this linear isomorphism.

::: example
*Example 146*. To illustrate the discussion above, we take $V = F^2$ and
compute the action of $D_*$ on $\mathrm{Cor}^\mathscr{G}(0,x_1,x_2)$. We
can assume that $x_1,x_2,x_2-x_1\neq 0$ by
[116](#proposition: generic correlators){reference-type="ref+label"
reference="proposition: generic correlators"}. The element
$\mathrm{Cor}^\mathscr{G}(0,x_1,x_2)$ equals the projection of the
element
$$x=\mathrm{FC}[0:e_1:e_2]-D^\mathrm{FC}_h(\mathrm{FC}[0:e_1:e_2])\in \mathrm{FCR}(V)$$
with $h(e_1)=x_1$ and $h(e_2)=x_2$, where $$\begin{align*}
&D^\mathrm{FC}_h(\mathrm{FC}[0:e_1:e_2])=\mathrm{FC}\left[0:\frac{e_{1}}{x_1}:\frac{e_{2}}{x_2}\right]-\mathrm{FC}\left[0:\frac{e_{1}}{x_1}:\frac{e_{2}-e_{1}}{x_2-x_1}\right]+\mathrm{FC}\left[0:\frac{e_{2}}{x_2}:\frac{e_{2}-e_{1}}{x_2-x_1}\right].
\end{align*}$$ Consider an element $$\tilde{x}=[(e_1,e_2)]-
\left[\Bigl ( \frac{e_{1}}{x_1},\frac{e_{2}}{x_2}\Bigr)\right]+\left[\Bigl ( \frac{e_{1}}{x_1},\frac{e_{2}-e_{1}}{x_2-x_1}\Bigr)\right]
-\left[\Bigl ( \frac{e_{2}}{x_2},\frac{e_{2}-e_{1}}{x_2-x_1}\Bigr)\right]\in {\mathrm{Bas}}(V)$$
which maps to $x$ by the projection
${\mathrm{pr}}\colon {\mathrm{Bas}}(V)\to \mathrm{FC}(V)$. We have
$$\begin{align*}
D(\tilde{x})&=[(e^1+e^2,e^2)]-
\left[(x_1e^{1}+x_2 e^{2},x_1 e^{1})\right]\\
&+\left[(x_1e^{1}+x_2 e^{2},x_1e^{1}+x_1e^2)\right]
-\left[(x_1e^{1}+x_2 e^{2}, x_2 e^{1}+x_2 e^{2})\right].
\end{align*}$$ The projection $\mathrm{FC}(V^{\vee})$ to
$H_0({\mathrm{GL}}(V^{\vee}),\mathrm{FC}(V^{\vee}))$ can be computed
using
[89](#prop: formula for projection to coinvariants){reference-type="ref+label"
reference="prop: formula for projection to coinvariants"}. Any vector
$v\in V$ can be viewed as a functional on $V^{\vee}$; the composition
$${\mathrm{Bas}}(V^\vee)\stackrel{{\mathrm{pr}}}{\longrightarrow} \mathrm{FC}(V^{\vee})\stackrel{E_{v}}\longrightarrow\mathscr{G}_2$$
sends $[(f_1,f_2)]$ to $\mathrm{Cor}^\mathscr{G}(0, f_1(v),f_2(v))$.
Using $v=e_1$, we obtain $$\begin{align*}
D_*(\mathrm{Cor}^\mathscr{G}(0,x_1,x_2))&=\mathrm{Cor}^\mathscr{G}(0,1,0)-\mathrm{Cor}^\mathscr{G}(0,x_1,x_1)+\mathrm{Cor}^\mathscr{G}(0,x_1,x_1)-\mathrm{Cor}^\mathscr{G}(0,x_1,x_2)\\ 
&=-\mathrm{Cor}^\mathscr{G}(0,x_1,x_2).
\end{align*}$$ This shows that $D_*$ acts by $-1$ on $\mathscr{G}_2$.
:::

#### Proof of [145](#theorem: duality){reference-type="ref+label" reference="theorem: duality"} {#proof-of-theorem-duality}

By [116](#proposition: generic correlators){reference-type="ref+label"
reference="proposition: generic correlators"}, it is sufficient to prove
that
$$D_*(\mathrm{Cor}^\mathscr{G}(0,x_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n))=-\mathrm{Cor}^\mathscr{G}(0,x_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n)$$
for distinct arguments $x_i\in F^{\times}$. The element
$\mathrm{Cor}^\mathscr{G}(0,x_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n)\in \mathscr{G}_n$
is represented by the element
$$x=\mathrm{FC}[0:e_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:e_n]-D^\mathrm{FC}_h(\mathrm{FC}[0:e_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:e_n])\in \mathrm{FCR}_n(F)$$
for a basis $e_1,\dots,e_n$ of $V$ and a functional $h\in V^*$ such that
$h(v_i)=x_i$.

Consider a basis $v_1,\dots,v_n$ of $V$ and a functional $h$ such that
$0, h(v_1),\dots,h(v_n)\in F$ are distinct and write
$h_i \coloneq h(v_i)$. We then define inductively define elements
$$f_h(v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n)\in {\mathrm{Bas}}(V)$$
as follows: For $n=1$, we put $f_h(v_1)=[(\tfrac{v_1}{h_1})]$ and for
$n\geq 2$, we define $$\begin{equation*}
\begin{aligned}
f_h(v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n) &= f_h(v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_{n-1})\otimes \left[\Bigl(\frac{v_n}{h_n}\Bigr)\right] \\
&\quad +\sum_{i=1}^{n-1} \big(f_h(v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},\widehat{v}_i,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n)-f_h(v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},\widehat{v}_{i+1},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n)\big)\boxplus\left[\Bigl(\frac{v_{i+1}-v_i}{h_{i+1}-h_i}\Bigr)\right].
\end{aligned}
\end{equation*}$$

::: {#lemma: lift of x .lemma}
**Lemma 147**. *The element
$f_h(v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n)\in {\mathrm{Bas}}(V)$
maps to
$D^\mathrm{FC}_h[0:v_1:\mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}:v_n]$
under the projection ${\mathrm{Bas}}(V) \to \mathrm{FC}(V)$.*
:::

::: proof
*Proof.* Comparing the formula for $f_h$ with the inductive definition
[\[eqn:symbol-correlator\]](#eqn:symbol-correlator){reference-type="eqref"
reference="eqn:symbol-correlator"} for the symbol of Steinberg
correlator used in the formula for the decomposition operator. ◻
:::

By [147](#lemma: lift of x){reference-type="ref+label"
reference="lemma: lift of x"}, the element
$$\tilde{x}=[(e_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},e_n)]-f_h(e_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},e_n)\in {\mathrm{Bas}}(V)$$
gives a lift of $x\in \mathrm{FC}(V)$. Our next goal is to compute the
image of $\tilde{x}$ under the composition
$${\mathrm{Bas}}(V) \stackrel{D}{\longrightarrow} {\mathrm{Bas}}(V^{\vee})\stackrel{{\mathrm{pr}}}{\longrightarrow} \mathrm{FC}(V^{\vee}) \stackrel{E_u}{\longrightarrow} \mathscr{G}_n(F),$$
where $u$ is a nonzero vector in $V$ and $E_u$ is the map defined in
[5.2.2](#section: projection from FC to G){reference-type="ref+label"
reference="section: projection from FC to G"}. This composition can be
computed in a different way: if we define maps $$\begin{align*}
\Psi_u\colon {\mathrm{Bas}}(V) &\longrightarrow{\mathds{Q}}[F]^{\otimes n} \\
\Psi_u([(v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n)])&\longmapsto [(v^1+\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}+ v^n)(u)]\otimes [(v^1+\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp}+ v^{n-1})(u)]\otimes \mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}\otimes [v^1(u)] \\
\mathrm{Cor}^\mathscr{G}\colon  {\mathds{Q}}[F]^{\otimes n} &\longrightarrow\mathscr{G}_n \\
[x_1]\otimes  \mathinner{\cdotp\mkern-2mu\cdotp\mkern-2mu\cdotp}\otimes [x_n] &\longmapsto \mathrm{Cor}^\mathscr{G}(0,x_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n),
\end{align*}$$ then we have an equation
$E_u\circ {\mathrm{pr}} \circ D = \mathrm{Cor}^\mathscr{G}\circ \Psi_u$,
and thus
$$D_*(\mathrm{Cor}^\mathscr{G}(0,x_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n))=E_u({\mathrm{pr}}(D(\tilde{x})))= \mathrm{Cor}^\mathscr{G}(\Psi_u(\tilde{x})).$$
To evaluate the right side of this equation, we will use the following
properties of $\Psi_u$:

::: {#lemma: decomposition .lemma}
**Lemma 148**. *Suppose we have a direct sum decomposition
$V=V_1\oplus V_2$ and bases $v_1,\dots, v_{n_1}$ of $V_1$ and
$v_{n_1+1},\dots, v_{n_1+n_2}$ of $V_2$. For a vector $u\in V_1$ we have
$$\Psi_u([(v_1,\dots,v_n)])=[(v^1+\dots+v^n)(u)]^{\otimes n_2} \otimes \Psi_u([(v_{1},\dots,v_{n_1})]).$$*
:::

::: proof
*Proof.* Since $u\in V_1$, we have $v^{n_1+1}(u)=\dots=v^{n_1+n_2}(u)=0$
and so for any $m\geq n_1$ we have
$(v^1+\dots+v^m)(u)=(v^1+\dots+v^n)(u)$, from which the statement
follows. ◻
:::

::: lemma
**Lemma 149**. *Suppose we have a basis $v_1,\dots,v_n$ of $V$ and a
nonzero functional $h$ such that $0,h(v_1),\dots,h(v_n)$ are distinct.
Then we have
$$\Psi_{v_1}(f_h(v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n))=[h(v_1)]\otimes \dots \otimes \bigl[h(v_n)\bigr].$$*
:::

::: proof
*Proof.* We prove the statement by induction on $n$, using the
abbreviation $h_i \coloneq h(v_i)$. For $n=1$, we have
$f_h(v_1)=\big[(\tfrac{v_1}{h_1})\big]$ and so
$$\Psi_{v_1}(f_h(v_1))=[h_1v^1(v_1)]=[h_1].$$ Assume now that the
statement holds in dimensions less than $n$. Using the inductive
definition of $f$ one may verify that every term $\pm[w_1,\dots,w_n]$ in
$f_h(v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n)$ we
have $w^1+\dots+w^n=h$, so in particular we have
$(w^1+\dots+w^n)(v_1)=h_1$. By
[148](#lemma: decomposition){reference-type="ref+label"
reference="lemma: decomposition"} applied to
$V_1={\mathrm{span}}(v_1,\dots, v_{n-1})$ and
$V_2={\mathrm{span}}(\tfrac{v_n}{h_n})$ and the induction hypothesis, we
then see that $$\begin{align*}
\Psi_{v_1}\Bigl(f_h(v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_{n-1})\otimes \Bigl[\frac{v_n}{h_n}\Bigr] \Bigr)&=[h_1]\otimes \Psi_{v_1}(f_h(v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_{n-1})) \\
&=[h_1]\otimes ([h_1] \otimes \dots \otimes [h_{n-1}]).
\end{align*}$$ By the same argument, for $2\leq i \leq n-1$ we have
$$\Psi_{v_1}\Bigl(f_h(v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},\widehat{v}_{i},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n)\otimes \Bigl[\Bigl(\frac{v_{i+1}-v_i}{h_{i+1}-h_i}\Bigr)\Bigr]\Bigr)=[h_1] \otimes \bigl([h_1]\otimes \dots \otimes [\widehat{h_{i}}] \otimes \dots \otimes [h_n]\bigr).$$
Similarly, for $1\leq i \leq n-1$ we have
$$\Psi_{v_1}\Bigl(f_h(v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},\widehat{v}_{i+1},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n)\otimes \Bigl[\Bigl(\frac{v_{i+1}-v_i}{h_{i+1}-h_i}\Bigr)\Bigr]\Bigr)=[h_1] \otimes \bigl([h_1]\otimes \dots \otimes \widehat{[h_{i+1}]} \otimes \dots \otimes [h_n]\bigr).$$

The remaining term
$\Psi_{v_1}\big(f_h(v_2,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n)\otimes \left[(\tfrac{v_{2}-v_1}{h_{2}-h_1})\right]\big)$
has a different structure, as $v_1$ does not lie in the span of the
vectors $v_2,\dots,v_n$. For each term $[(w_1,\dots,w_{n-1})]$ of
$f_h(v_2,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n)$
consider the dual basis $u^1,\dots,u^{n}$ to the basis
$$w_1,\dots,w_{n-1}, \frac{v_2-v_1}{h_{2}-h_1}$$ of $V$ (this is a basis
because $w_1,\ldots,w_{n-1}$ is a basis of
${\mathrm{span}}(v_2,\ldots,v_n)$). Then $u^k(v_1)=u^k(v_2)$ for
$k \leq n-1$ by choice $\tfrac{v_2-v_1}{h_{2}-h_1}$ of the last basis
vector, and we see
$$(u^1+\dots+u^k)(v_1)=(u^1+\dots+u^k)(v_2) \qquad \text{for $k \leq n-1$.}$$
Since $(u^1+\dots+u^n)(v_1)=h_1$ and functionals $u^1,\dots, u^{n-1}$
restrict to the dual basis to $w_1,\dots,w_{n-1}$, we obtain
$$\Psi_{v_1}\Bigl(f_h(v_2,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n)\otimes \Bigl[\Bigl(\frac{v_{2}-v_1}{h_{2}-h_1}\Bigr)\Bigr]\Bigr)=[h_1] \otimes \Psi_{v_2}(f_h(v_2,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n))=[h_1] \otimes \dots \otimes [h_n].$$
To prove the result we now perform the following computation
$$\begin{equation*}
\begin{aligned}
\Psi_{v_1}&\Bigl(f_h(v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n)\Bigr)\\
&=\Psi_{v_1}\Bigl ( f_h(v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_{n-1})\otimes \Bigl[\Bigl(\frac{v_n}{h_n}\Bigr)\Bigr]\Bigr) +\Psi_{v_1}\Bigl (f_h(v_2,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n)\otimes \Bigl[\Bigl(\frac{v_{2}-v_1}{h_{2}-h_1}\Bigr)\Bigr]\Bigr)\\
&\quad +\sum_{i=2}^{n-1} \Psi_{v_1}\Bigl(f_h(v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},\widehat{v}_i,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n)\otimes \Bigl[\Bigl(\frac{v_{i+1}-v_i}{h_{i+1}-h_i}\Bigr)\Bigr]\Bigr)\\
&\quad - \sum_{i=1}^{n-1}\Psi_{v_1}\Bigl(f_h(v_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},\widehat{v}_{i+1},\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},v_n)\otimes \left[\Bigl(\frac{v_{i+1}-v_i}{h_{i+1}-h_i}\Bigr)\right]\Bigr)\\
&= [h_1]\otimes ( [h_1] \otimes \dots \otimes [h_{n-1}])+[h_1] \otimes [h_2]\otimes \dots \otimes [h_n]\\
&\quad +\sum_{i=2}^{n-1} [h_1] \otimes \bigl([h_1]\otimes \dots \otimes [\widehat{h_{i}}] \otimes \dots \otimes [h_n]\bigr)\\
&\quad - \sum_{i=1}^{n-1}[h_1] \otimes \bigl([h_1]\otimes \dots \otimes \widehat{[h_{i+1}]} \otimes \dots \otimes [h_n]\bigr)\\
&=[h_1] \otimes [h_2]\otimes \dots \otimes [h_n].
\end{aligned}
\end{equation*}$$ ◻
:::

We are ready to finish the proof of
[145](#theorem: duality){reference-type="ref+label"
reference="theorem: duality"}. At this point we have shown that
$$D_*(\mathrm{Cor}^\mathscr{G}(0,x_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n) = \mathrm{Cor}^\mathscr{G}(\Psi_u([(e_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},e_n)-f_h(e_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},e_n)]))$$
and the key observation is that the choice $u=e_1$ makes the computation
particularly simple: we have
$$\mathrm{Cor}^\mathscr{G}\Bigl(\Psi_{e_1}([(e_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},e_n)])\Bigr)=\mathrm{Cor}^\mathscr{G}([(e^1+\dots+e^n)(e_1)]\otimes \dots \otimes [e^1(e_1)])=\mathrm{Cor}^\mathscr{G}(0,1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},1)=0$$
and thus
$$D_*(\mathrm{Cor}^\mathscr{G}(0,x_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n))=-\mathrm{Cor}^\mathscr{G}\Bigl( \Psi_{e_1}(f_h(e_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},e_n)\Bigr)= -\mathrm{Cor}^\mathscr{G}(0,x_1,\mathinner{\ldotp\mkern-2mu\ldotp\mkern-2mu\ldotp},x_n).$$

## The Rognes rank spectral sequence relating $K(F)$ and ${\mathscr{G}}(F)$

In this section we describe a rank spectral sequence, which is inspired
by the one obtained from Rognes' spectrum-level rank filtration
[@Rognes] and is an instance of the group completion spectral sequence
of Galatius, Kupers, and Randal-Williams [@GKRW18]. It plays a major
role in the next section and in particular yields an edge homomorphism
mapping the rationalised algebraic $K$-theory groups to the Goncharov
Lie coalgebra. Here we develop only what is needed for those
applications, postponing a more extensive discussion to [@KRS2].

### The rank spectral sequence

The following is the main result of this section. We suggest a reader
interested in applications skip its proof and move to the next section.

::: {#thm:rank-ss-omnibus .theorem}
**Theorem 150**. *There exists a strongly convergent *rank spectral
sequence*
$$E^1_{n,d} \cong H^{E_\infty}_{n,d}({\mathbf{BGL}}(F)_{\mathds{Q}}) \Longrightarrow \pi_d(K(F))_{\mathds{Q}}$$
with $d^r$-differentials have bidegree $(-r,-1)$ and the following
properties:*

1.  *The $d^1$-differential $d^1 \colon E^1_{n,2n-1} \to E^1_{n-1,2n-2}$
    agrees with the $\sigma$-component $\delta_\sigma$.*

2.  *It is a spectral sequence of
    $\Lambda^* F^\times_{\mathds{Q}}$-modules, compatible with the
    actions on the $E^1$-page on abutment (see
    [9.5](#sec:rank-ss-action){reference-type="ref+label"
    reference="sec:rank-ss-action"} for details).*

3.  *It is a spectral sequence with involution, compatible with the
    duality involutions on the $E^1$-page and abutment (see
    [9.6](#sec:rank-ss-involution){reference-type="ref+label"
    reference="sec:rank-ss-involution"} for details).*
:::

Given this theorem, we may define:

::: definition
**Definition 151**. The maps
$${\mathrm{edge}}_n \colon K_{2n-1}(F)_{\mathds{Q}} \longrightarrow{\mathscr{G}}_n(F)$$
are defined to be the edge homomorphisms of this rank spectral sequence.
:::

### Constructing the rank spectral sequence

The rank spectral sequence will be that associated to a filtered object
in ${{\mathscr{D}}_{\mathds{Q}}}$, constructed in several steps.

Suppose we are given an $E_\infty^{\mathrm{u}}$-algebra ${\mathbf{R}}^+$
in spaces with $\pi_0({\mathbf{R}}^+) \cong {\mathds{N}}$, the
commutative monoid of (nonnegative) natural numbers under addition.
Sending each path component to a point induces a map of
$E_\infty^{\mathrm{u}}$-algebras ${\mathbf{R}}^+ \to {\mathbf{N}}$,
where ${\mathbf{N}}$ is simply the commutative monoid ${\mathds{N}}$
considered as an $E_\infty^{\mathrm{u}}$-algebra in spaces. Letting
$t \colon {\mathds{N}} \to \ast$ be the unique symmetric monoidal
functor from the discrete symmetric monoidal category ${\mathds{N}}$ to
the terminal one, we get induced functors
$t_! \colon {\mathrm{Fun}}({\mathds{N}},{{\mathscr{S}}{\mathrm{pc}}}) \to {{\mathscr{S}}{\mathrm{pc}}}$
and
$t_!^{\mathrm{alg}}\colon {\mathrm{Alg}}_{E_\infty^{\mathrm{u}}}({\mathrm{Fun}}({\mathds{N}},{{\mathscr{S}}{\mathrm{pc}}})) \to {\mathrm{Alg}}_{E_\infty^{\mathrm{u}}}({{\mathscr{S}}{\mathrm{pc}}})$.
The latter takes the terminal algebras
${\underline{\ast}} \in {\mathrm{Alg}}_{E_\infty^{\mathrm{u}}}({\mathrm{Fun}}({\mathds{N}},{{\mathscr{S}}{\mathrm{pc}}}))$
to
${\mathbf{N}} \in {\mathrm{Alg}}_{E_\infty^{\mathrm{u}}}({{\mathscr{S}}{\mathrm{pc}}})$,
and the induced functor
$$t_! \colon {\mathrm{Alg}}_{E_\infty^{\mathrm{u}}}({\mathrm{Fun}}({\mathds{N}},{{\mathscr{S}}{\mathrm{pc}}})) \longrightarrow{\mathrm{Alg}}_{E_\infty^{\mathrm{u}}}({{\mathscr{S}}{\mathrm{pc}}})_{/{\mathbf{N}}}$$
is an equivalence. Through this, we obtain the input in (I) below:

1.  *Providing input.* Our input will be an
    $E_\infty^{\mathrm{u}}$-algebra
    ${\mathbf{R}}^+ \in {\mathrm{Fun}}({\mathds{N}},{{\mathscr{S}}{\mathrm{pc}}})$,
    which comes with a unique map
    $\epsilon \colon {\mathbf{R}}^+ \to {\mathbf{N}}$.

2.  *Rationalising.* Upon rationalisation and writing
    ${\mathds{Q}}[t] \coloneq {\mathbf{N}}_{\mathds{Q}} \simeq {\mathrm{free}}_{E_\infty^{\mathrm{u}}}(1_! {\mathds{Q}})$,
    we obtain a map of $E_\infty^{\mathrm{u}}$-algebras in
    ${\mathrm{Fun}}({\mathds{N}},{{\mathscr{D}}_{\mathds{Q}}})$
    $$\epsilon \colon {\mathbf{R}}^+_{\mathds{Q}} \longrightarrow{\mathds{Q}}[t].$$

3.  *Rank filtering.* Let
    $\iota \colon {\mathds{N}} \to {\mathds{N}}_\leq$ by the inclusion
    of the discrete category of nonnegative natural numbers into the
    poset of nonnegative natural numbers with their usual order. This is
    symmetric monoidal so induces a symmetric monoidal functor
    $\iota_! \colon {\mathrm{Fun}}({\mathds{N}},{{\mathscr{D}}_{\mathds{Q}}}) \to {\mathrm{Fun}}({\mathds{N}}_\leq,{{\mathscr{D}}_{\mathds{Q}}})$
    which in turn induces a functor $\smash{\iota_!^{\mathrm{alg}}}$ on
    categories of $E_\infty^{\mathrm{u}}$-algebras. Applying this and
    writing
    $\smash{{\mathds{Q}}^{\mathrm{fil}}[t] \coloneq \iota_!^{\mathrm{alg}}{\mathds{Q}}[t] \simeq {\mathrm{free}}_{E_\infty^{\mathrm{u}}}(1_! {\mathds{Q}})}$
    (where now the free $E_\infty^{\mathrm{u}}$-algebra is taken in
    ${\mathrm{Fun}}({\mathds{N}}_\leq,{{\mathscr{D}}_{\mathds{Q}}})$),
    we get
    $$\iota_!^{\mathrm{alg}}\epsilon \colon \iota_!^{\mathrm{alg}}{\mathbf{R}}^+_{\mathds{Q}} \longrightarrow{\mathds{Q}}^{\mathrm{fil}}[t].$$

4.  *Filtered augmentation.* There is a *filtered group completion
    augmentation*
    $$\epsilon^{\mathrm{fil}}_{\mathrm{gc}}\colon {\mathds{Q}}^{\mathrm{fil}}[t] \longrightarrow 1_{{\mathrm{Fun}}({\mathds{N}}_\leq,{{\mathscr{D}}_{\mathds{Q}}})}$$
    adjoint to the map
    $1_! {\mathds{Q}} \to {\mathrm{fgt}}_{E_\infty^{\mathrm{u}}}(1_{{\mathrm{Fun}}({\mathds{N}}_{\leq},{{\mathscr{D}}_{\mathds{Q}}}})) \simeq 0_! {\mathds{Q}}$
    that is in turn adjoint to
    ${\mathrm{id}}\colon {\mathds{Q}} \to 1^* 0_! {\mathds{Q}} = {\mathds{Q}}$.
    We use this to consider
    $\smash{\iota_!^{\mathrm{alg}}{\mathds{R}}^+_{\mathds{Q}}}$ as an
    *augmented* $E_\infty^{\mathrm{u}}$-algebra in
    ${\mathrm{Fun}}({\mathds{N}}_{\leq},{{\mathscr{D}}_{\mathds{Q}}})$.

5.  *Indecomposables*. We now pass to the augmentation ideal and apply
    the functor ${\mathrm{cot}}_{E_\infty^{\mathrm{nu}}}$ of
    $E_\infty^{\mathrm{nu}}$-indecomposables to get a filtered object
    that we will denote
    $${\mathrm{cot}}_{E_\infty^{\mathrm{nu}}}(\iota_!^{\mathrm{alg}}{\mathbf{R}}^{\mathrm{gc}}_{\mathds{Q}}) \in {\mathrm{Fun}}({\mathds{N}}_\leq,{{\mathscr{D}}_{\mathds{Q}}}).$$

Since this filtered object is concentrated in nonnegative filtration
degrees, we have an associated half-plane spectral sequence with exiting
differentials and hence this spectral sequence is always strongly
convergent [@BoardmanSS Theorem 6.1]. The rank spectral sequence of
[150](#thm:rank-ss-omnibus){reference-type="ref+label"
reference="thm:rank-ss-omnibus"} is the one associated to this filtered
object in the case ${\mathbf{R}}^+ = {\mathbf{BGL}}(F)^+$, which indeed
has $\pi_0({\mathbf{BGL}}(F)^+) \cong {\mathds{N}}$. It remains to
verify its properties.

### The abutment, $E^1$-page, and bidegrees of differentials

This spectral sequence can be interpreted as an instance of one
constructed by the Galatius, Kupers, and Randal-Williams in [@GKRW18].
To see this, note that since rationalisation is a symmetric monoidal
left adjoint, it commutes with the constructions in steps (III)--(V). In
particular, we could instead have passed to the rank filtration and
taken a filtered group completion augmentation in spaces. At this point,
we may compute the $E_\infty^{\mathrm{u}}$-indecomposables of the
augmentation ideal by instead taking the iterated bar spectrum and
taking the quotient by a copy of the sphere spectrum [@GKRW18 Lemma
13.26]. Thus we see that the rank spectral sequence of
[150](#thm:rank-ss-omnibus){reference-type="ref+label"
reference="thm:rank-ss-omnibus"} agrees with the rationalisation of the
*group completion spectral sequence* of [@GKRW18 Remark 13.30], given by
$$E^1_{n,d} = H^{E_\infty}_{n,d}({\mathbf{R}}) \Longrightarrow H_n({\mathbf{R}}^{\mathrm{sp}}),$$
where ${\mathbf{R}}^{\mathrm{sp}}$ is the connective spectrum whose
infinite loop space $\Omega^\infty {\mathbf{R}}^{\mathrm{sp}}$ is the
group completion $({\mathbf{R}}^+)^{\mathrm{gc}}$ of ${\mathbf{R}}^+$
and whose differentials in this indexing have bidegree $(-r,-1)$.

In the case ${\mathbf{R}}^+ = {\mathbf{BGL}}(F)^+$, this is one of the
constructions of the $K$-theory spectrum $K(F)$, so we have essentially
by definition that
$$({\mathbf{BGL}}(F)^+)^{\mathrm{gc}}\simeq \Omega^\infty K(F),$$ and
the identification of the abutment follows by recalling that the
Hurewicz map from rational homotopy to rational homology is an
isomorphism for spectra.

### The $d^1$-differential

For the computation of the $d^1$-differential we will use Koszul
duality. Recall that if the augmentation ideal
${\mathbf{R}}_{\mathds{Q}} \in {\mathrm{Alg}}_{E_\infty^{\mathrm{nu}}}({\mathrm{Fun}}({\mathds{N}},{{\mathscr{D}}_{\mathds{Q}}}))$
is *reduced*, i.e. ${\mathbf{R}}_{\mathds{Q}}(0) \simeq 0$, then Koszul
duality yields an equivalence
$${\mathbf{R}}_{\mathds{Q}} \overset{\simeq}\longrightarrow{\mathrm{prim}}_{s\,{\mathrm{{\mathrm{coLie}}}}} ({\mathrm{indec}}_{E_\infty^{\mathrm{nu}}}({\mathbf{R}}_{\mathds{Q}})).$$
We may thus assume that ${\mathbf{R}}_{\mathds{Q}}$ is of the form
${\mathrm{prim}}_{s\,{\mathrm{{\mathrm{coLie}}}}}({\mathbf{L}})$ for
some
${\mathbf{L}} \in {\mathrm{Alg}}_{s\,{\mathrm{{\mathrm{coLie}}}}}^{\mathrm{red}}({\mathrm{Fun}}({\mathds{N}},{{\mathscr{D}}_{\mathds{Q}}}))$.
Here we suppress the superscript $(-)^{\mathrm{dpw}}$ from (shifted) Lie
coalgebras because we are working rationally, and we replace the
superscript $(-)^{\mathrm{nil}}$ by $(-)^{\mathrm{red}}$ because we are
working with reduced (shifted) Lie coalgebras which are in particular
conilpotent. In this situation
${\mathrm{indec}}_{E^{\mathrm{nu}}_\infty}$ is an adjoint inverse to
${\mathrm{prim}}_{s\,{\mathrm{{\mathrm{coLie}}}}}$ so the counit induces
an isomorphism
$$H^{E_\infty}_{n,d}({\mathbf{R}}_{\mathds{Q}}) \overset{\cong}\longrightarrow H_{n,d}({\mathbf{L}}),$$
allowing us to rewrite the $E^1$-page of the rank spectral sequence in
terms of ${\mathbf{L}}$. We will for simplicity assume that
$\smash{H^{E_\infty}_{2,1}({\mathbf{R}}_{\mathds{Q}})} = 0$, as is the
case for ${\mathbf{R}} = {\mathbf{BGL}}(F)$ (this avoids a discussion of
what it means to extract a $\sigma$-component out of the cobracket
$H_{2,1}({\mathbf{L}}) \to \Lambda^2 H_{1,0}({\mathbf{L}})$).

Since our $E_\infty^{\mathrm{u}}$-algebra ${\mathbf{R}}^+_{\mathds{Q}}$
arose by rationalising
${\mathbf{R}}^+ \in {\mathrm{Alg}}_{E_\infty^{\mathrm{u}}}({\mathrm{Fun}}({\mathds{N}},{{\mathscr{S}}{\mathrm{pc}}}))$
that is path-connected in each rank, picking a point in rank 1 gives the
left map in
$${\mathrm{free}}_{E_\infty^{\mathrm{u}}}(1_! \ast) \overset{\sigma}\longrightarrow{\mathbf{R}}^+ \overset{\epsilon}\longrightarrow{\mathds{N}}.$$
Rationalising the composition becomes an equivalence and we get a
factorisation
$${\mathds{Q}}[t] \overset{\sigma}\longrightarrow{\mathbf{R}}^+_{\mathds{Q}} \overset{\epsilon}\longrightarrow{\mathds{Q}}[t]$$
of ${\mathrm{id}}_{{\mathds{Q}}[t]}$. Moreover, as
$\smash{{\mathbf{R}}^+_{\mathds{Q}}}$ is connective and $\sigma$ as well
as $\epsilon$ induce an isomorphism on $H_{*,0}(-)$, taking
indecomposables we obtain a factorisation
${\mathds{Q}}\{\sigma\} \to {\mathbf{L}} \to {\mathds{Q}}\{\sigma\}$
inducing an identification
${\mathds{Q}}\{\sigma\} \cong H_{1,0}({\mathbf{L}})$. Thus in particular
the (shifted) cobracket on $H_{*,*}({\mathbf{L}})$ has a
*$\sigma$-component*
$$\delta_\sigma \colon H_{n,d}({\mathbf{L}}) \longrightarrow H_{n-1,d-1}({\mathbf{L}})$$
obtained from (shifted) cobracket $\delta$ by projection to the term
involving $H_{1,0}({\mathbf{L}})$.

::: lemma
**Lemma 152**. *Let ${\mathbf{L}}$ be as above. Then the
$d^1$-differential
$$d^1 \colon E^1_{n,d} \longrightarrow E^1_{n-1,d-1}$$ of the rank
spectral sequence for
${\mathbf{R}}^+_{\mathds{Q}} = {\mathrm{prim}}_{s\,{\mathrm{{\mathrm{coLie}}}}}({\mathbf{L}})^+$
is given by $\delta_\sigma$ under the identification
$E^1_{n,d} \cong H_{n,d}({\mathbf{L}})$.*
:::

::: proof
*Proof.* We will permit ourselves to use the rectification results from
[12.4](#sec:rect-dg){reference-type="ref+label" reference="sec:rect-dg"}
and use explicit chain complexes for the constructions: that is, we work
in ${\mathrm{Fun}}({\mathds{N}},{\mathrm{Ch}}_{\mathds{Q}})$, use the
equivalence $E_\infty^{\mathrm{u}} \simeq_{\mathds{Q}} {\mathrm{Com}}$,
model ${\mathrm{prim}}_{s\,{\mathrm{{\mathrm{coLie}}}}}$ by the shifted
variant
$\Omega^{s\,{\mathrm{{\mathrm{coLie}}}}} \coloneq \Sigma^{-1} \circ \Omega^{\mathrm{coLie}} \circ \Sigma$
of the cobar construction from
[216](#def:cobar-colie){reference-type="ref+label"
reference="def:cobar-colie"}, and model
${\mathrm{indec}}_{E_\infty^{\mathrm{u}}}$ by the bar construction
$B^{\mathrm{Com}}$ from [215](#def:bar-comm){reference-type="ref+label"
reference="def:bar-comm"}.

The input to the rank spectral sequence may thus be taken to be a
dg-commutative algebra of the form
$\Omega^{\mathrm{scoLie}}({\mathbf{L}}) \in {\mathrm{Alg}}_{{\mathrm{Com}}^{\mathrm{nu}}}({\mathrm{Fun}}({\mathds{N}},{\mathrm{Ch}}_{\mathds{Q}}))$.
We may further assume, e.g. using a variant of CW approximation as in
[@GKRW18 Section 11], that
${\mathbf{L}} \in {\mathrm{coAlg}}_{s\,{\mathrm{{\mathrm{coLie}}}}}({\mathrm{Fun}}({\mathds{N}},{\mathrm{Ch}}_{\mathds{Q}}))$
splits additively (though not necessarily as shifted dg-Lie coalgebras)
as ${\mathds{Q}}\{\sigma\} \oplus {\mathbf{L}}'$ where
$|\sigma| = (1,0)$ and ${\mathbf{L}}'$ is rankwise connected. The
unitalisation of shifted variant of the cobar construction is then given
by
$$\Omega^{s{\mathrm{{\mathrm{coLie}}}}}({\mathbf{L}})^+ \coloneq ({\mathrm{Com}} \circ {\mathbf{L}},d_{\mathbf{L}}+d_\Omega) \cong (S^*({\mathds{Q}}\{\sigma\}\oplus {\mathbf{L}}'),d_{\mathbf{L}}+d_\Omega)$$
where $d_{\mathbf{L}}$ denotes the internal differential of
${\mathbf{L}}$ and $d_\Omega$ denotes the cobar differential from
[216](#def:cobar-colie){reference-type="ref+label"
reference="def:cobar-colie"}. Applying $\smash{\iota_!^{\mathrm{alg}}}$
makes this graded dg-commutative algebra filtered by declaring that
elements in rank $n$ lie in filtration degree $n$; for brevity we will
replace $\smash{\iota^{\mathrm{alg}}_!}$ by an underline in our
notation, so that
$$\iota^{\mathrm{alg}}_! \Omega^{s\,{\mathrm{{\mathrm{coLie}}}}}({\mathbf{L}})^+ \cong (S^*({\mathds{Q}}\{{\underline{\sigma}}\} \oplus {\underline{{\mathbf{L}}}}'),d_{\mathbf{L}}+d_\Omega).$$
The filtered group completion augmentation
$\epsilon^{\mathrm{fil}}_{\mathrm{gc}}$ on this is then determined
uniquely by sending ${\underline{\sigma}}$ to $1$ and
${\underline{{\mathbf{L}}}}'$ to $0$.

We next pass to the augmentation ideal $I^{\mathrm{gc}}$ and apply the
bar construction $B^{\mathrm{Com}}$ to this nonunital commutative
algebra to obtain an explicit model for the filtered object that gives
rise to the rank spectral sequence
$$B^{\mathrm{Com}}I^{\mathrm{gc}}(\Omega^{s{\mathrm{{\mathrm{coLie}}}}}({\mathds{Q}}\{{\underline{\sigma}}\} \oplus {\underline{{\mathbf{L}}}}')) \coloneq \Sigma^{-1}\Big({\mathrm{{\mathrm{coLie}}}}\circ \Sigma I^{\mathrm{gc}}(S^*({\mathds{Q}}\{{\underline{\sigma}}\} \oplus {\underline{{\mathbf{L}}}}')),d_{\mathbf{L}}+d_\Omega+d_B\Big)$$
where $d_B$ denotes the bar differential from
[215](#def:bar-comm){reference-type="ref+label"
reference="def:bar-comm"}.

The $d^1$-differential is extracted as follows: writing
$F_r \coloneq F_r B^{\mathrm{Com}}I^{\mathrm{gc}}(\Omega^{s\,{\mathrm{{\mathrm{coLie}}}}}({\mathds{Q}}\{{\underline{\sigma}}\} \oplus {\underline{{\mathbf{L}}}}'))$
for the $r$th filtration step, it is given by the connecting
homomorphism in the short exact sequence
$$0 \longrightarrow F_{r-1}/F_{r-2} \longrightarrow F_r/F_{r-2} \longrightarrow F_r/F_{r-1} \longrightarrow 0.$$
We will now make this more explicit. When we pass to the associated
graded, identifying the image of ${\underline{\sigma-1}}$ with $\sigma$
and the image of ${\underline{{\mathbf{L}}}}'$ with ${\mathbf{L}}'$, the
filtered group completion augmentation yields the canonical
augmentation, which cancels against unitalisation, and Koszul duality
provides an equivalence
$$\eta \colon {\mathds{Q}}\{\sigma\} \oplus {\mathbf{L}}' \overset{\simeq}\longrightarrow B^{\mathrm{Com}} \Omega^{s\,{\mathrm{{\mathrm{coLie}}}}}({\mathds{Q}}\{\sigma\} \oplus {\mathbf{L}}') \cong {\mathrm{gr}}\,B^{\mathrm{Com}}I^{\mathrm{gc}}(\Omega^{s\,{\mathrm{{\mathrm{coLie}}}}}({\mathds{Q}}\{{\underline{\sigma}}\} \oplus {\underline{{\mathbf{L}}}}')).$$
Let us first describe $\eta$ and its inverse up to homotopy $\varpi$.
The latter is easier: in terms of
$$B^{\mathrm{Com}}\Omega^{s\,{\mathrm{{\mathrm{coLie}}}}}({\mathds{Q}}\{\sigma\} \oplus {\mathbf{L}}') \coloneq \Sigma^{-1}\Big({\mathrm{{\mathrm{coLie}}}}\circ \Sigma (S^{*>0}({\mathds{Q}}\{\sigma\} \oplus {\mathbf{L}}')),d_{\mathbf{L}}+d_\Omega+d_B\Big)$$
the map $\varpi$ is the projection onto the generators
$\Sigma^{-1} {\mathrm{coLie}}(1) \otimes_{{\mathfrak{S}}_1} \Sigma ({\mathds{Q}}\{\sigma\} \oplus {\mathbf{L}}') \cong {\mathds{Q}}\{\sigma\} \oplus {\mathbf{L}}'$.
The map $\eta$ is given by the formula in [@Souderes Lemma 2.21], up to
an unfortunate difference in sign conventions and normalisation of the
cobracket: before the outer desuspension $\Sigma^{-1}$,
$x \in {\mathds{Q}}\{\sigma\} \oplus {\mathbf{L}}'$ is mapped to an
element of the form
$$(\delta_1(x),\delta_2(x),\ldots) \qquad \text{with} \qquad \delta_k(x) \in  {\mathrm{coLie}}(k) \otimes_{{\mathfrak{S}}_k} (\Sigma({\mathds{Q}}\{\sigma\} \oplus L'))^{\otimes k},$$
where we set
$\delta_k = p_{{\mathrm{I\!I\!I}}} \circ \widetilde{\delta}_k$, using
that $p_{{\mathrm{I\!I\!I}}}$ as on [@Souderes p. 105] (called $\gamma$
in [@HainIndec]) serves to project
$(\Sigma({\mathds{Q}}\{\sigma\} \oplus {\mathbf{L}}'))^{\otimes k}$ into
${\mathrm{coLie}}(k) \otimes_{{\mathfrak{S}}_k} (\Sigma({\mathds{Q}}\{\sigma\} \oplus {\mathbf{L}}'))^{\otimes k}$,
and think of the latter as a subspace of
${\mathrm{coLie}}(k) \otimes_{{\mathfrak{S}}_k} (\Sigma(S^{*>0} ({\mathds{Q}}\{\sigma\} \oplus {\mathbf{L}}')))^{\otimes k}$.
Explicitly, we have that
$$\delta_1(x) = {\overline{x}} \quad \text{and} \quad \delta_2(x) = -{\overline{\delta(x)}}$$
where ${\overline{a}} \coloneq \Sigma a$, and the signs and scalars
differ from [@Souderes] due to the aforementioned difference in
conventions.

We next explain a lift from the associated graded to the filtered
object:
$I^{\mathrm{gc}}(S^*({\mathds{Q}}\{{\underline{\sigma}}\} \oplus {\underline{{\mathbf{L}}}}'))$
is given by the nonunital subalgebra
$S^{*>0}({\mathds{Q}}\{{\underline{\sigma-1}}\} \oplus {\underline{{\mathbf{L}}}}')$
where ${\underline{\sigma-1}}$ lies in filtration degree $1$. The
projection to the associated graded then admits a section induced by
mapping $\sigma$ to ${\underline{\sigma-1}}$ and $x \in {\mathbf{L}}'$
to ${\underline{x}} \in {\underline{{\mathbf{L}}}}'$.

Given this, we may compute the $d^1$-differential on a class
$[x] \in H_*(F_r/F_{r-1})$ for $r \geq 3$. Using the additive splitting
we can write
$$\delta_k(x) = \sum_{0 \leq j \leq k} c_j \otimes_{{\mathfrak{S}}_k} \left({\overline{\sigma}}^{\otimes j} \otimes \delta^{(j)}_k(x)\right) \in {\mathrm{coLie}}(k) \otimes_{{\mathfrak{S}}_k} (\Sigma(S^{*>0} ({\mathds{Q}}\{\sigma\} \oplus {\mathbf{L}}')))^{\otimes k}$$
for $c_j \in {\mathrm{coLie}}(k)$ and
$\delta^{(j)}_j(x) \in (\Sigma(S^{*>0} ({\mathbf{L}}')))^{\otimes k-j}$,
and following the prescription for lifting $\eta(x)$ to $F_r$, each of
the terms $\delta_k(x)$ is lifted to
$${\underline{\delta_k(x)}} \coloneq \sum_{0 \leq j \leq k} c_j \otimes_{{\mathfrak{S}}_k} \left( {\underline{{\overline{\sigma}}}}^{\otimes j} \otimes {\underline{\delta^{(j)}_k(x)}}\right)-c_j \otimes_{{\mathfrak{S}}_j} \left({\underline{{\overline{1}}}}^{\otimes j} \otimes {\underline{\delta^{(j)}_k(x)}}\right).$$
Taking the quotient by $F_{r-2}$, only the terms $j=0,1$ remain. In
particular, the first two terms of the lift to $F_r/F_{r-2}$ are given
by
$$({\underline{{\overline{x}}}},- {\underline{{\overline{\delta(x)}}}}+{\underline{{\overline{1}}}} \wedge {\underline{{\overline{\delta_\sigma(x)}}}},\ldots),$$
where $\delta_\sigma(x)$ is the $\sigma$-component, and we remind the
reader that the underline denotes that we lift elements in
${\mathbf{L}}'$ in rank $r$ to filtration degree $r$ and the overline
denotes a suspension that is part of the bar construction. Taking the
differential, there are three contributions:

1.  the internal differential $d_{\mathbf{L}}$ vanishes since $x$ was a
    cycle,

2.  the cobar differential $d_\Omega$ maps into higher tensor powers of
    $S^*$ and since we will project these away momentarily when we apply
    $\varpi$ we may ignore them, and

3.  the bar differential $d_B$ maps terms with index $k$ into terms with
    index $k-1$ and since we will project those with $k \geq 2$ away
    momentarily when we apply $\varpi$ we may ignore all but from
    $k=1,2$.

Keeping this in mind and using that $\eta(x)$ is a cycle so all terms
not involving ${\underline{{\overline{1}}}}$ cancel, we compute that
$$\varpi(d(\text{lift of $\eta(x)$})) = \delta_\sigma(x) \in {\mathds{Q}}\{\sigma\} \oplus {\mathbf{L}}'$$
proving the result. ◻
:::

::: remark
*Remark 153*. This should be compared to the description in [@Sun] of
the $d^1$-differential in the Quillen rank spectral sequence from
[@QuillenFiniteGeneration] in terms of the coproduct on
$H_*({\mathrm{GL}}_n;{\mathrm{St}}_n)$. We believe this formula can be
computed by similar methods.
:::

### Actions and splittings {#sec:rank-ss-action}

Let us recall from
[6.1](#sec:action-by-scaling){reference-type="ref+label"
reference="sec:action-by-scaling"} that the units in $F$ act "by
scaling" on the symmetric monoidal groupoid ${\mathrm{Vect}}$ of
finite-dimensional vector spaces over $F$: for $\lambda \in F^\times$
this action is by a symmetric monoidal natural isomorphism
$\varphi_\lambda$ of ${\mathrm{id}}_{\mathrm{Vect}}$, with components
$\lambda \cdot {\mathrm{id}}_V \colon V \to V$. These cover the identity
on ${\mathds{N}}$, so taking classifying spaces we obtain a lift of
${\mathbf{BGL}}(F)^+$ to a functor
$${\mathbf{BGL}}(F)^+ \colon {\mathrm{B^2}}F^\times \longrightarrow{\mathrm{Alg}}_{E_\infty^{\mathrm{nu}}}({\mathrm{Fun}}({\mathds{N}},{{\mathscr{S}}{\mathrm{pc}}})).$$
The naturality of the construction of the rank spectral sequence yields
a functor
$${\mathrm{cot}}_{E_\infty^{\mathrm{nu}}}(\iota_!^{\mathrm{alg}}{\mathbf{R}}^{\mathrm{gc}}_{\mathds{Q}}) \colon {\mathrm{B}}^2F^\times \to {\mathrm{Fun}}({\mathds{N}}_{\le},{{\mathscr{D}}_{\mathds{Q}}})$$
with adjoint action map in
${\mathrm{Fun}}({\mathds{N}}_{\leq},{{\mathscr{D}}_{\mathds{Q}}})$ given
by (recall $0_!$ denotes we place an object in filtration $0$)
$$0_! {\mathrm{B}} F_{\mathds{Q}} \otimes {\mathrm{cot}}_{E_\infty^{\mathrm{nu}}}(\iota_!^{\mathrm{alg}}{\mathbf{R}}^{\mathrm{gc}}_{\mathds{Q}}) \longrightarrow{\mathrm{cot}}_{E_\infty^{\mathrm{nu}}}(\iota_!^{\mathrm{alg}}{\mathbf{R}}^{\mathrm{gc}}_{\mathds{Q}}).$$
This map of filtered objects induces an $\Lambda^* F^\times$-action on
the rank spectral sequence.

#### Action on abutment

On the abutment this is induced by the action of ${\mathrm{B}}F^\times$
on the spectrum $K(F)$ arising from the functoriality of group
completion, with adjoint action map
$$\Sigma^\infty_+ {\mathrm{B}}F^\times \otimes K(F) \longrightarrow K(F)$$
in the category of spectra. Interpreting the action as tensoring with
the $1$-dimensional vector space $F$ and its automorphisms, combining
[@Weibel Theorem IV.1.10, Theorem IV.4.6, Corollary IV.4.6.1] we see
that this is a part of the ring spectrum structure on $K(F)$ induced by
tensor products of vector spaces. In particular, restricting to rational
homotopy groups this is the map
$\Lambda^* F^\times_{\mathds{Q}} \otimes K_*(F)_{\mathds{Q}} \to K_*(F)_{\mathds{Q}}$
induced by iterated products with elements of
$K_1(F)_{\mathds{Q}} \cong F^\times_{\mathds{Q}}$, and thus factors over
the Milnor $K$-theory in the first entry to yield the multiplication map
$$K^M_*(F)_{\mathds{Q}} \otimes K_*(F)_{\mathds{Q}} \longrightarrow K_*(F)_{\mathds{Q}}.$$

#### Action on $E^1$-page

On the $E^1$-page this is by construction the action induced on the
$E_\infty$-homology of ${\mathbf{BGL}}(F)^+$. As this action is trivial
on the level of infinite Steinberg modules since the
${\mathrm{GL}}_n$-action on ${\mathrm{St}}^{\infty}_n$ factors over
${\mathrm{PGL}}_n$, with respect to the splitting
$$H^{E_\infty}_{n,d}({\mathbf{BGL}}(F)_{\mathds{Q}}) \cong H_{d-2n+2}({\mathrm{GL}}_n;{\mathrm{St}}^{\infty}_n) \underset{\cong}{\overset{\varpi_n}{\longrightarrow}} H_{d-2n+2}({\mathrm{PGL}}_n;{\mathrm{St}}^{\infty}_n) \otimes \Lambda^* F^\times,$$
it simply acts on the second term, by
$x \star (a \otimes y) = n^{|x|} a \otimes (x \cdot y)$.

Since the $d^1$-differential is compatible with the
$\Lambda^* F^\times$-action, this gives that up to a nonzero scalar the
$d^1$-differential is also compatible with the splittings of the
$E^1$-page.

### The duality involution {#sec:rank-ss-involution}

#### The duality involution on rational algebraic $K$-theory

The group completion functor
$${\mathrm{Alg}}_{E_\infty^{\mathrm{u}}}({\mathrm{Fun}}({\mathds{N}},{{\mathscr{S}}{\mathrm{pc}}})) \longrightarrow{\mathscr{S}}{\mathrm{p}}_{\ge 0}$$
applied to this ${\mathbf{BGL}}(F)^+$ endows the spectrum $K(F)$ with a
$C_2$-action. By construction this is the standard duality involution,
which agrees on homotopy with the Adams operation $\psi^{-1}$
[@FengGalatiusVenkatesh Section 2.3.1]. It includes a direct sum
decomposition into $\pm 1$-eigenspaces
$$K_*(F)_{\mathds{Q}} \cong K^+_*(F)_{\mathds{Q}} \oplus K^-_*(F)_{\mathds{Q}}.$$

To understand its effect rational algebraic $K$-theory, recall that for
any $d \ge 1$ there are natural splittings [@Weibel Remark 5.10.1,
Theorem IV.5.11]
$$K_d(F)_{\mathds{Q}} \cong \bigoplus_{i=1}^d K_d^{(i)}(F)_{\mathds{Q}}$$
where $\smash{K_d^{(i)}}(F)_{\mathds{Q}}$ is the *weight $i$ part*,
determined by the property that the $k$th Adams operation $\psi^k$ acts
by multiplication by $k^i$ for any $k \in {\mathds{Z}}$. It is known
that in degree $d$ the the weight $d$ part agrees with
$K^M_d(F)_{\mathds{Q}}$, and the weight $1$ part vanishes as long as
$d \ge 2$ [@Soule Corollaire 1]. We conclude that:

::: {#lem:involution-vs-weight .lemma}
**Lemma 154**. *The splitting
$K_d(F)_{\mathds{Q}}= K_d^+(F)_{\mathds{Q}} \oplus K_d^-(F)_{\mathds{Q}}$
induced by the duality involution is given by
$$K_d^+(F)_{\mathds{Q}}= \bigoplus_{i \; \text{even}} K^{(i)}_d(F)_{\mathds{Q}} \qquad \text{and} \qquad K_d^-(F)_{\mathds{Q}}= \bigoplus_{i \; \text{odd}} K^{(i)}_d(F)_{\mathds{Q}}.$$*
:::

#### The duality involution on the $E^1$-page

On the $E^1$-page, the duality involution is given by that
${\mathrm{cot}}_{E_\infty}({\mathbf{BGL}}(F))$ and we investigated this
in [8](#section duality involution){reference-type="ref+label"
reference="section duality involution"}. There we found the following:
it acts on the entries $E^1_{n,2n-1} \cong {\mathscr{G}}_n(F)$ by
$(-1)^n$ by [145](#theorem: duality){reference-type="ref+label"
reference="theorem: duality"}, and on the entries
$\smash{E^1_{1,d}} \cong \smash{\Lambda^d F^\times}$ for $d \ge 1$ by
$(-1)^d$. We add this to the following result, which helps us understand
the action on the second column of the spectral sequence:

::: lemma
**Lemma 155**. *The duality involution acts by $+1$ on
$H_*({\mathrm{PGL}}_2(F),{\mathrm{St}}^{\infty}_2(F))$.*
:::

::: proof
*Proof.* This is a consequence of the duality involution being inner. On
the one hand, this involution is given by $$\begin{bmatrix}
        a & b \\ c & d
    \end{bmatrix} \longmapsto \frac{1}{ad-bc}\begin{bmatrix} d & -c \\ -b & a
    \end{bmatrix}.$$ On the other hand, we compute $$\begin{bmatrix}
        0 & 1 \\ -1 & 0
    \end{bmatrix}^{-1} \begin{bmatrix}
        a & b \\ c & d
    \end{bmatrix} \begin{bmatrix}
        0 & 1 \\ -1 & 0
    \end{bmatrix} = \begin{bmatrix} d & -c \\ -b & a
    \end{bmatrix},$$ which means that on ${\mathrm{PGL}}_2(F)$
involution acts by conjugation with the matrix $\begin{bsmallmatrix}
        0 & 1 \\ -1 & 0
    \end{bsmallmatrix}$. ◻
:::

## The Goncharov conjectures in weight 3

In this section we prove
[1](#theorem weight 3){reference-type="ref+label"
reference="theorem weight 3"}. Our main tool will be the Rognes rank
spectral sequence of
[150](#thm:rank-ss-omnibus){reference-type="ref+label"
reference="thm:rank-ss-omnibus"} and the information about it obtained
there; this approach to rational algebraic $K$-theory of fields was
suggested by Rognes in [@RognesMotivic].

### The $E^1$-page

We start with a discussion of the $E^1$-page of the Rognes rank spectral
sequence. [5](#fig:e1page){reference-type="ref+label"
reference="fig:e1page"} records the following data about its $E^1$-page,
obtained in the previous section:

(i) The first column is given by $$E^1_{1,q} \cong \Lambda^q F^\times,$$
    and the involution acts on this by $(-1)^q$.

(ii) The critical line is given by
     $$E^1_{n,2n-1} \cong {\mathscr{G}}_n(F),$$ and the involution acts
     on this by $(-1)^n$. Moreover, we have identifications
     $$F^\times \overset{\cong}\longrightarrow{\mathscr{G}}_1(F), \quad B_2(F) \overset{\cong}\longrightarrow{\mathscr{G}}_2(F), \quad \text{and} \quad B_3(F) \overset{\cong}\longrightarrow{\mathscr{G}}_3(F),$$
     with subgroups generated by "classical" polylogarithms.

(iii) The second column is given by
      $$E^1_{2,*} \cong H_{*+2}({\mathrm{PGL}}_2(F);{\mathrm{St}}^{\infty}_2(F)) \otimes \Lambda^* F^\times$$
      and the involution on the term
      $H_{*+2}({\mathrm{PGL}}_2(F);{\mathrm{St}}^{\infty}_2(F))$ is by
      $+1$ and on the term $\Lambda^* F^\times$ is by $(-1)^*$.

In particular, in order to compute rational algebraic $K$-theory of $F$
up to degree $5$, we only need to understand the $d^1$-differentials and
potentially a $d^2$-differential from bidegree $(3,6)$ to $(1,5)$.

<figure id="fig:e1page" data-latex-placement="ht">

<figcaption>The <span class="math inline">\(E^1\)</span>-page <span
class="math inline">\(E^1_{p,q}\)</span> of the Rognes rank spectral
sequence, converging to <span class="math inline">\(K_q(F)\)</span>. The
colours and dashed lines denote the <span
style="color: Periwinkle!50!black"><span
class="math inline">\(+1\)</span>-eigenspaces</span> and . The <span
class="math inline">\(d^1\)</span>-differential has bidegree <span
class="math inline">\((-1,-1)\)</span> and necessarily sends <span
class="math inline">\(\pm 1\)</span>-eigenspaces to <span
class="math inline">\(\pm 1\)</span>-eigenspaces.</figcaption>
</figure>

### Computing the $d^1$ differentials in terms of the cobracket

We shall explain how to obtain most of the $d^1$-differentials. Recall
that the $d^1$-differential is given by $\sigma$-component, which for
$n=2$ agrees up to a sign with the cobracket and for $n \geq 3$ has the
property that its projection of $\sigma$-component onto the first
summand
$${\mathrm{pr}}_1 \delta_\sigma \colon {\mathscr{G}}_n(F) \longrightarrow{\mathscr{G}}_{n-1}(F) \otimes F^\times \subseteq {\mathscr{G}}_{n-1}(F) \otimes F^\times \oplus H_2({\mathrm{PGL}}_{n-1}(F),{\mathrm{St}}^{\infty}_{n-1}(F))$$
agrees up to a sign with the component $\delta_{n-1,1}$ of the
cobracket. We have also seen that the $d^1$-differential is, up to a
nonzero scalar, compatible with the splitting.

::: {#cor computation of d^1 .corollary}
**Corollary 156**. * *

(i) *$d^1 \colon B_2(F) \to \Lambda^2 F^\times_{\mathds{Q}}$ is given by
    $\mathrm{Li}^\mathscr{G}_2(x) \mapsto -(x) \wedge (1-x)$.*

(ii) *$d^1 \colon B_2(F) \otimes F^\times_{\mathds{Q}} \to \Lambda^3 F^\times_{\mathds{Q}}$
     is given by
     $\mathrm{Li}^\mathscr{G}_2(x) \otimes (y) \mapsto -(x) \wedge (1-x) \wedge (y)$.*

(iii) *$d^1 \colon B_3(F) \to B_2(F) \otimes F^\times_{\mathds{Q}}$ is
      given by
      $\mathrm{Li}^\mathscr{G}_3(x) \mapsto -\mathrm{Li}^\mathscr{G}_2(x) \otimes (x)$.*
:::

::: remark
*Remark 157*. Let us comment on the notation: when we write
$-(x) \wedge (1-x)$ the minus sign thinks of
$\Lambda^2 F^\times_{\mathds{Q}}$ as being additive, so this is the
additive inverse of the element $(x) \wedge (1-x)$ and is *not* equal to
$(-x) \wedge (1-x)$ (which in fact is equal to $(x) \wedge (1-x)$ since
we work rationally).
:::

As mentioned in the introduction, the complexes
$$B_2(F) \longrightarrow\Lambda^2 F^\times \quad \text{and} \quad B_3(F) \longrightarrow B_2(F) \otimes F^\times \longrightarrow\Lambda^3 F^\times$$
that appear on the $E^1$-page are isomorphic to the polylogarithmic
complexes $\Gamma_2(F)$ and $\Gamma_3(F)$ studied previously by
Goncharov [@Gon95b] (by convention, we drop ${\mathds{Q}}$ from the
notation). By convention, $B_n(F)$ is in degree $1$ and the differential
increases degree.

::: remark
*Remark 158*. The relationship between polylogarithmic complexes of
Goncharov and the Rognes rank spectral sequence is not entirely clear.
The latter should be the $E^1$-page of an analogue of a
Lyndon--Hochschild--Serre spectral sequence for the Lie coalgebra
homology of cofibre sequences of Lie coalgebras, applied to
$F^\times \to {\mathscr{G}}_n(F) \to {\overline{{\mathscr{G}}}}_n(F)$,
together with the conjecture that ${\overline{{\mathscr{G}}}}_n(F)$ is
cofree with cogenerators $B_n(F)$. The first term in which these
complexes differ from the Lie coalgebra homology of ${\mathscr{G}}_n(F)$
is in weight $4$, in whether a term $\Lambda^2 {\mathscr{G}}_2(F)$
appears or not. Based on computations for number fields, it seems more
plausible to the authors that one should relate the total differential
in the Rognes rank spectral sequence (rather than just the
$d^1$-differential) to the cobracket on ${\mathscr{G}}(F)$.
:::

### The first column and Milnor $K$-theory

We now study the first column through the maps $$\begin{equation}
\label{eqn:first-column}\Lambda^d F^\times \cong E^1_{1,d} \longrightarrow E^2_{1,d} \overset{{\mathrm{pr}}}\longrightarrow E^\infty_{1,d} \longrightarrow K_d(F).
\end{equation}$$ Here the left and middle map are the surjections
arising from the spectral sequence, and the right map is an edge
homomorphism. A similar result appears as [@RognesMotivic Theorem
7.2.1].

::: {#lem:first-column .lemma}
**Lemma 159**. * *

(i) *[]{#enum:first-column-i label="enum:first-column-i"} The
    composition
    [\[eqn:first-column\]](#eqn:first-column){reference-type="eqref"
    reference="eqn:first-column"} is given by
    $\Lambda^* F^\times \twoheadrightarrow K_*^M(F) \hookrightarrow K_*(F)$.*

(ii) *[]{#enum:first-column-ii label="enum:first-column-ii"} The
     projection ${\mathrm{pr}}\colon E^2_{1,d} \to E^\infty_{1,d}$ in
     [\[eqn:first-column\]](#eqn:first-column){reference-type="eqref"
     reference="eqn:first-column"} is an isomorphism, or equivalently,
     there are no nonzero $d^r$-differentials for $r>1$ into the first
     column.*
:::

::: proof
*Proof.* By compatibility of the rank spectral sequence with the scaling
action, the maps in
[\[eqn:first-column\]](#eqn:first-column){reference-type="eqref"
reference="eqn:first-column"} assemble to a map of
$\Lambda^* F$-modules. For degree reasons, the maps
$E^1_{1,0} \to K_0(F)$ is an isomorphism. Since $K_0(F)$ generates under
the $\Lambda^* F$-action the Milnor $K$-theory
$K^M_*(F) \subseteq K_*(F)$, the composition
[\[eqn:first-column\]](#eqn:first-column){reference-type="eqref"
reference="eqn:first-column"} must be the quotient map onto the summand
$K^M_d(F)_{\mathds{Q}}$, proving the part
[\[enum:first-column-i\]](#enum:first-column-i){reference-type="eqref"
reference="enum:first-column-i"}.

For part
[\[enum:first-column-ii\]](#enum:first-column-ii){reference-type="eqref"
reference="enum:first-column-ii"}, we recall that the $d^1$-differential
$$E^1_{2,3} \cong B_2(F) \longrightarrow E^1_{1,2} \cong \Lambda^2 F^\times$$
is given by $\mathrm{Li}^\mathscr{G}_2(x) \mapsto -(x) \wedge (1-x)$,
and since the $d^1$-differential is compatible with the
$\Lambda^* F^\times$-action up to nonzero scalars, we see that
$d^1(E^1_{2,d+3}) \subseteq E^1_{1,d+2}$ contains the span of
$(x) \wedge (1-x) \wedge (y_1) \wedge \cdots \wedge (y_d)$ so that there
is a factorisation
$E^1_{1,d} \twoheadrightarrow K^M_d(F) \twoheadrightarrow E^2_{1,d}$.
Using part
[\[enum:first-column-i\]](#enum:first-column-i){reference-type="eqref"
reference="enum:first-column-i"} the second map must be isomorphism,
implying the part
[\[enum:first-column-ii\]](#enum:first-column-ii){reference-type="eqref"
reference="enum:first-column-ii"}. ◻
:::

### $K$-theory groups in low degrees

[6](#fig:e2page){reference-type="ref+label" reference="fig:e2page"}
records the results about the $E^2$-page that result from the discussion
in the previous subsections. From the $E^2$-page onwards, there are no
possibly nonzero differentials affecting bidegrees $q \le 5$. Thus the
three columns displayed describe the associated graded of a filtration
$K_q(F)$ for $q \leq 5$, where we already know that the Milnor
$K$-theory is a summand.

<figure id="fig:e2page" data-latex-placement="ht">

<figcaption>The <span class="math inline">\(E^2\)</span>-page <span
class="math inline">\(E^2_{p,q}\)</span> of the rank spectral sequence,
converging to <span class="math inline">\(K_q(F)\)</span>. As before,
the colours denote the <span style="color: Periwinkle!50!black"><span
class="math inline">\(+1\)</span>-eigenspaces</span> and . The <span
class="math inline">\(d^r\)</span>-differential has bidegree <span
class="math inline">\((-r,-1)\)</span> and necessarily sends <span
class="math inline">\(\pm 1\)</span>-eigenspaces to <span
class="math inline">\(\pm 1\)</span>-eigenspaces, so there can be only a
few nonzero differentials in this range.</figcaption>
</figure>

From the rows $q \leq 4$, we obtain the following by inspection (by
convention in this section all groups are rationalised):

::: {#prop:Kleq4 .proposition}
**Proposition 160**. *There are isomorphisms*

(i) *$F^\times \overset{\cong}\longrightarrow K_1(F)$.*

(ii) *$K_2^M(F) \overset{\cong}\longrightarrow K_2(F)$.*

(iii) *$K_3^{(2)}(F) \overset{\cong}\longrightarrow H^1(\Gamma_2(F))$.*

(iv) *$K_4^{(3)}(F) \overset{\cong}\longrightarrow H^2(\Gamma_3(F))$.*

(v) *$K_4^{(2)}(F) \overset{\cong}\longrightarrow(E^1_{2,4})^+ \cong H_2({\mathrm{PGL}}_2(F),{\mathrm{St}}^{\infty}_2(F))$.*
:::

From the rows $q=5$, we obtain the following (by convention in this
section all groups are rationalised), recalling that we have
$$H^1(\Gamma_3(F))  = \ker\big[\delta \colon B_3(F) \to B_2(F) \otimes F^\times\big].$$

::: {#thm:K5 .theorem}
**Theorem 161**. *There is an exact sequence
$$K_4^{(2)}(F) \otimes F^\times \overset{m_F}\longrightarrow K_5^{(3)}(F) \overset{p_F}\longrightarrow H^1(\Gamma_3(F)) \longrightarrow 0,$$
where the first map is induced by the multiplication in $K$-theory and
the second one is induced by the edge homomorphism.*
:::

::: proof
*Proof.* We know from
[154](#lem:involution-vs-weight){reference-type="ref+label"
reference="lem:involution-vs-weight"} that
$$K_5^-(F) = K_5^M(F) \oplus K_5^{(3)}(F)$$ and hence the
$-1$-eigenspaces in the second and third column give a filtration for
$\smash{K_5^{(3)}(F)}$. Thus, using the identification
$(E^1_{2,4})^+ = K_4^{(2)}(F)$ from
[160](#prop:Kleq4){reference-type="ref+label" reference="prop:Kleq4"},
there is a short exact sequence
$$0 \longrightarrow(K_4^{(2)}(F) \otimes F^\times)/{\mathrm{im}}(d^1) \longrightarrow K_5^{(3)}(F) \longrightarrow H^1(\Gamma_3(F)) \longrightarrow 0,$$
where the maps are as described. ◻
:::

::: {#cor:weight-3-beilinson-soule .corollary}
**Corollary 162**. *If $K_4^{(2)}(F) = 0$, then the edge homomorphism
induces an isomorphism
$$K_5^{(3)}(F) \overset{\cong}\longrightarrow H^1(\Gamma_3(F)).$$*
:::

::: {#ex:beilinson-soule-vanishing .example}
*Example 163*. The hypothesis for
[162](#cor:weight-3-beilinson-soule){reference-type="ref+label"
reference="cor:weight-3-beilinson-soule"} holds for number fields and
fields of transcendence degree $1$ over a finite field
[@BorelStable; @Harder]. It is also closed under iterated transcendental
extensions. To see this, we use the localisation theorem for algebraic
$K$-theory [@Weibel V.6.7.1], which gives split short exact sequences
$$0 \longrightarrow K_n(F) \overset{i}\longrightarrow K_n(F(t)) \overset{\partial}\longrightarrow\bigoplus_{{\mathfrak{p}}} K_{n-1}(F[t]/{\mathfrak{p}}) \longrightarrow 0$$
where $i$ is induced by the inclusion $F \to F(t)$ and $\partial$ is a
connecting homomorphism. Each of these decompose in short exact
sequences for fixed weights as [@Soule Théoréme 4]
$$0 \longrightarrow K^{(r)}_n(F) \overset{i}\longrightarrow K^{(r)}_n(F(t)) \overset{\partial}\longrightarrow\bigoplus_{{\mathfrak{p}}} K^{(r-1)}_{n-1}(F[t]/{\mathfrak{p}}) \longrightarrow 0.$$
Taking $n=4$ and using that $\smash{K_3^{(1)}(E)}$ vanishes for all
fields $E$ [@Soule Corollaire 1], the inclusion $F \to F(t)$ induces an
isomorphism $\smash{K^{(2)}_4(F) \cong K^{(2)}_4(F(t))}$.
:::

### The Beilinson--Soulé vanishing conjecture and the Goncharov conjectures in low weight

In light of
[162](#cor:weight-3-beilinson-soule){reference-type="ref+label"
reference="cor:weight-3-beilinson-soule"}, one might ask whether
validity of the Goncharov conjectures in weight 3 is equivalent to the
validity of the Beilinson--Soulé vanishing conjecture in weight 2. In
order to answer this, we first analyse how the exact sequence of
[161](#thm:K5){reference-type="ref+label" reference="thm:K5"}
$$0 \longrightarrow\ker(m_F) \longrightarrow K_4^{(2)}(F) \otimes F^\times \overset{m_F}\longrightarrow K_5^{(3)}(F) \overset{p_F}\longrightarrow H^1(\Gamma_3(F)) \longrightarrow 0$$
behaves under pure transcendental extensions.

::: {#thm:gamma-53 .theorem}
**Theorem 164**. * *

(i) *There is a short exact sequence
    $$0 \longrightarrow H^1(\Gamma_3(F)) \longrightarrow H^1(\Gamma_3(F(t))) \longrightarrow\bigoplus_{\mathfrak{p}}{K_4^{(2)}(F[t]/{\mathfrak{p}})/K_4^{(2)}(F)} \longrightarrow 0$$
    where the sum is over all nonzero prime ideals ${\mathfrak{p}}$ of
    $F[t]$.*

(ii) *The map $\ker(m_F) \to \ker(m_{F(t)})$ is always an isomorphism.*
:::

::: proof
*Proof.* We claim there is a map of short exact sequences
$$\begin{tikzcd} 0 \rar & K_4^{(2)}(F) \otimes F^\times \rar \dar{m_F} & K_4^{(2)}(F) \otimes F(t)^\times \rar \dar{m_{F(t)}} & \bigoplus_{\mathfrak{p}} K_4^{(2)}(F) \rar \dar & 0 \\
0 \rar & K_5^{(3)}(F) \rar{i} & K_5^{(3)}(F(t)) \rar{\partial} &  \bigoplus_{\mathfrak{p}} K_4^{(2)}(F[t]/{\mathfrak{p}}) \rar & 0\end{tikzcd}$$
where the direct sums run over all nonzero prime ideals ${\mathfrak{p}}$
of $F[t]$. The bottom short exact sequence is obtained from localisation
exact sequence as in
[163](#ex:beilinson-soule-vanishing){reference-type="ref+label"
reference="ex:beilinson-soule-vanishing"} for $F(t)$. To obtain the top
short exact sequence, we tensor the short exact sequence
$$0 \longrightarrow F^\times \longrightarrow F(t)^\times \longrightarrow{\textstyle \bigoplus_{\mathfrak{p}}} {\mathds{Q}} \longrightarrow 0$$
with $K_4^{(2)}(F)$. The left vertical map is the multiplication in
algebraic $K$-theory and the middle vertical map is the isomorphism
$$K_4^{(2)}(F) \otimes F(t)^\times \overset{\cong}\longrightarrow K_4^{(2)}(F(t)) \otimes F(t)^\times$$
followed by multiplication; that the left square commutes is then the
naturality of the multiplicative structure on algebraic $K$-theory
groups. The right vertical map is given on the term ${\mathfrak{p}}$ by
the map induced by the inclusion $F \to F[t]/{\mathfrak{p}}$. To see the
right square commutes, note that the vector space
$\smash{K_4^{(2)}(F(t)) \otimes F(t)^\times}$ is spanned by
$$\alpha \otimes p(t) \qquad \text{where $\alpha \in K_4^{(2)}(F)$ and $p(t) \in F[t]$ is irreducible}.$$
The top-right composition sends this to the element that is the image of
$\alpha$ in the term ${\mathfrak{p}}$ where ${\mathfrak{p}}$ is the
ideal generated by $p(t)$. The left-bottom composition sends this to
(denoting by $\cdot$ the multiplication in algebraic $K$-theory)
$$\partial(\alpha \cdot p(t)) = \alpha \cdot \partial(p(t)),$$ using the
localisation sequence is a sequence of $K_*(F)$-modules [@Weibel V.6.1],
so that in particular $\partial$ is a $K_*(F)$-module map. It is
standard that in the localisation sequence $\partial(p(t))$ is given by
$1$ in the term ${\mathfrak{p}}$ where ${\mathfrak{p}}$ is the ideal
generated by $p(t)$.

Now we use that the right vertical map is injective by the existence of
transfer maps [@Weibel V.3.3.2] and the identification of the left and
middle vertical maps as those appearing in
[161](#thm:K5){reference-type="ref+label" reference="thm:K5"}, using
that $\smash{K_4^{(2)}(F)} \xrightarrow{\cong} \smash{K_4^{(2)}(F(t))}$,
and apply the snake lemma to get an exact sequence
$$\begin{tikzcd} 0 \rar & \ker(m_F) \rar & \ker(m_{F(t)}) \rar & 0 \arrow[dll,snake left] \\
& H^1(\Gamma_3(F)) \rar & H^1(\Gamma_3(F(t)) \rar & {\textstyle \bigoplus_{\mathfrak{p}}} K_4^{(2)}(F[t]/{\mathfrak{p}})/K_4^{(2)}(F) \rar & 0\end{tikzcd}$$
which gives the results. ◻
:::

::: remark
*Remark 165*. We can obtain slightly stronger results under the
hypothesis of the existence of a specialisation-at-zero map: the precise
claim is that $$\begin{align*}
{\mathscr{G}}_3(F(t)) &\longrightarrow{\mathscr{G}}_3(F) \\
\mathrm{Li}^\mathscr{G}_3(f(t)) &\longmapsto \begin{cases} \mathrm{Li}^\mathscr{G}_3(f(0)) & \text{if $f(0) \neq 0,\infty$,} \\
0 & \text{else,}\end{cases}
\end{align*}$$ is well-defined. The existence of such specialisation
maps is known on Milnor $K$-theory [@Weibel Theorem III.7.3] as well as
the Bloch groups [@GoncharovEuler Section 3.2], and amounts to verifying
that the 22-term relation is sent to zero by this map; in principle a
sufficiently determined reader could do so (possibly computer-aided). We
strongly believe such maps exist and rather than addressing this in
ad-hoc fashion here, we intend to do so in a systemic fashion in future
work. In that case $\Gamma_5^3(F) \to \Gamma_5^3(F(t))$ naturally split
by the specialisation-at-zero map.
:::

We obtain from this some conditions under which $H^1(\Gamma_3(F))$ is
unchanged by transcendental extensions, that is, is homotopy-invariant.

::: {#cor:gamma-53-iso .corollary}
**Corollary 166**. *The map $H^1(\Gamma_3(F)) \to H^1(\Gamma_3(F(t)))$
is an isomorphism if one of the following conditions is satisfied:*

(i) *[]{#enum:gamma-53-iso-i label="enum:gamma-53-iso-i"} $F$ is
    algebraically closed, or*

(ii) *[]{#enum:gamma-53-iso-ii label="enum:gamma-53-iso-ii"}
     $K_4^{(2)}(E) = 0$ for every finite extension $E$ of $F$.*
:::

::: proof
*Proof.* We apply the short exact sequence of
[164](#thm:gamma-53){reference-type="ref+label"
reference="thm:gamma-53"}. In case
[\[enum:gamma-53-iso-i\]](#enum:gamma-53-iso-i){reference-type="eqref"
reference="enum:gamma-53-iso-i"}, since $F$ is algebraically closed then
all the summands of the last term are trivial. In case
[\[enum:gamma-53-iso-ii\]](#enum:gamma-53-iso-ii){reference-type="eqref"
reference="enum:gamma-53-iso-ii"}, since $F[t]/{\mathfrak{p}}$ is a
finite extension of $F$ for all ${\mathfrak{p}}$, each summand
vanishes. ◻
:::

::: example
*Example 167*. Part
[\[enum:gamma-53-iso-ii\]](#enum:gamma-53-iso-ii){reference-type="eqref"
reference="enum:gamma-53-iso-ii"} applies when $F$ is a number field or
has transcendence degree $1$ over a finite field by
[163](#ex:beilinson-soule-vanishing){reference-type="ref+label"
reference="ex:beilinson-soule-vanishing"}.
:::

In fact, in some sense the converse of
[166](#cor:gamma-53-iso){reference-type="ref+label"
reference="cor:gamma-53-iso"}
[\[enum:gamma-53-iso-ii\]](#enum:gamma-53-iso-ii){reference-type="eqref"
reference="enum:gamma-53-iso-ii"} is also true: Goncharov's
homotopy-invariance conjecture in weight 3 is equivalent to the
Beilinson--Soulé vanishing conjecture in weight 2.

::: corollary
**Corollary 168**. *The map $H^1(\Gamma_3(F)) \to H^1(\Gamma_3(F(t)))$
is an isomorphism for every field $F$ if and only if
$\smash{K_4^{(2)}(E) = 0}$ for every field $E$.*
:::

::: proof
*Proof.* The direction $\Leftarrow$ is a direct consequence of
[166](#cor:gamma-53-iso){reference-type="ref+label"
reference="cor:gamma-53-iso"}
[\[enum:gamma-53-iso-ii\]](#enum:gamma-53-iso-ii){reference-type="eqref"
reference="enum:gamma-53-iso-ii"}. For the direction $\Rightarrow$, we
use that we have already seen that the vanishing of
$\smash{K_4^{(2)}(F)}$ is closed under pure transcendental extensions in
[163](#ex:beilinson-soule-vanishing){reference-type="ref+label"
reference="ex:beilinson-soule-vanishing"}. It is also true for
$F = {\mathds{Q}}$ or ${\mathds{F}}_q$, and so it is true for all fields
if we can also show it is closed under finite extensions. It suffices to
do so for simple extensions, and if
$H^1(\Gamma_3(F)) \to H^1(\Gamma_3(F(t)))$ is an isomorphism for every
field $F$ then from [164](#thm:gamma-53){reference-type="ref+label"
reference="thm:gamma-53"} we deduce that
$$K_4^{(2)}(F) \longrightarrow K_4^{(2)}(F[t]/{\mathfrak{p}})$$ is
surjective for every field $F$ and nonzero prime ideal
${\mathfrak{p}}$. ◻
:::

We also obtain the following corollary saying that the Goncharov
conjecture in weight 3 imply the Beilinson--Soulé vanishing conjecture
in weight $2$.

::: {#cor: weight 3 goncharov iff beilinson soule .corollary}
**Corollary 169**. *The map
$p_F \colon K_5^{(3)}(F) \to H^1(\Gamma_3(F))$ is an isomorphism for
every field $F$ if and only if $K_4^{(2)}(E)=0$ for every field $E$.*
:::

::: proof
*Proof.* The direction $\Leftarrow$ is already done in
[162](#cor:weight-3-beilinson-soule){reference-type="ref+label"
reference="cor:weight-3-beilinson-soule"}. For the direction
$\Rightarrow$ suppose that $F$ is a field such that
$K_4^{(2)}(F) \neq 0$, then
$$K_4^{(2)}(F) \otimes F^\times \subsetneq K_4^{(2)}(F) \otimes F(t)^\times \cong K_4^{(2)}(F(t)) \otimes F(t)^\times.$$
By [164](#thm:gamma-53){reference-type="ref+label"
reference="thm:gamma-53"} we know that $\ker(m_F) \cong \ker(m_{F(t)})$
and thus $\ker(m_{F(t)}) \subsetneq K_4^{(2)}(F(t)) \otimes F(t)^\times$
so $m_{F(t)} \neq 0$ otherwise we would not have a strict inclusion.
Hence $\ker(p_{F(t)}) \neq 0$ and $p_{F(t)}$ cannot be an isomorphism. ◻
:::

We end with a result relating the Beilinson--Soulé vanishing conjecture
in weight $2$ to the multiplicative structure in algebraic $K$-theory;
this does not rely on our results above, but is of course related.

::: {#prop:beilinson-soule-multiplication .proposition}
**Proposition 170**. *If there is a field $F$ so that
$K_4^{(2)}(F) \neq 0$, then there exists a field $E$ of the same
characteristic such that the following product map is not injective and
not zero
$$m_E \colon K_4^{(2)}(E) \otimes E^\times \longrightarrow K_5^{(3)}(E).$$*
:::

::: proof
*Proof.* We first prove we can find $E$ so that it is not injective. If
$K_4^{(2)}(F) \neq 0$ for some $F$ then, as algebraic $K$-theory
commutes with filtered colimits, we can in fact find such an $F$ which
is generated by finitely many elements over $k$, for $k=\mathbb{F}_p$ if
${\mathrm{char}}(F)=p$ and $k={\mathds{Q}}$ if ${\mathrm{char}}(F)=0$.
In particular, we may assume $F$ has finite transcendence degree over
$k$.

Let us pick $n \in {\mathds{N}}$ smallest so that there is a field $E_0$
with $K_4^{(2)}(E_0) \neq 0$ and ${\mathrm{trdeg}}_k(E_0)=n$. By the
work of Borel, $K_4(F)$ vanishes for any number field $F$, and by the
work of Quillen it vanishes (rationally) for any finite field too, so we
must have $n \ge 1$. Let $F_n \coloneq k(t_1,\dots,t_n)$ be the field
extension of $k$ obtained by adding $n$ pure transcendental variables,
so that we can view $E_0$ as a finite degree field extension of $F_n$.

In the positive characteristic $p$ case we factor the finite extension
$F_n \subset E_0$ as $F_n \subset E_1 \subset E_0$ where
$F_n \subset E_1$ is finite and separable and $E_1 \subset E_0$ is
finite and purely inseparable. We claim that
$\smash{K_4^{(2)}(E_1)} \neq 0$ and then we can without loss of
generality replace $E_0$ by $E_1$ and assume that $F_n \subset E_0$ is
separable. To prove the claim, if we let $p^N = [E_0: E_1]$ be the
degree then ${\mathrm{Frob}}^N(E_0) \subset E_1$ (as the extension is
purely inseparable) we can consider the composition
$$K_4^{(2)}(E_0) \xrightarrow{{\mathrm{Frob}}^N_*} K_4^{(2)}(E_1) \longrightarrow K_4^{(2)}(E_0),$$
where the second map is induced by the inclusion $E_1 \subset E_0$. This
composition agrees with the action of an $N$-fold composition of the
Frobenius, which acts by multiplication by $p^2$ in weight 2, and hence
the composition is multiplication by $p^{2N}$, showing that the second
map is surjective, and hence the claim.

Let $E$ denote the Galois closure of $E_0$ over $F_n$, which is defined
by separability, then $E_0 \subseteq E$ is a finite degree extension and
hence the map induced by the inclusion
$$K_4^{(2)}(E_0) \longrightarrow K_4^{(2)}(E)$$ is injective by the
existence of transfer maps. In particular, we have
$K_4^{(2)}(E) \neq 0$. For the rest of the proof,
$G \coloneq {\mathrm{Gal}}(E/F_n)$, a finite group. We next consider the
following commutative diagram
$$\begin{tikzcd}  & K_5^{(3)}(F_n) \dar{i_1} \rar{p_F}[swap]{\simeq} & H^1(\Gamma_3(F_n))\dar{i_2}\\[-5pt]  K_4^{(2)}(E) \otimes E^\times \rar{m_E} & K_5^{(3)}(E) \rar{p_E} & H^1(\Gamma_3(E)) \rar & 0\end{tikzcd}$$
where the bottom short exact sequence is as in
[164](#thm:gamma-53){reference-type="ref+label"
reference="thm:gamma-53"}, the top map is an isomorphism by
[163](#ex:beilinson-soule-vanishing){reference-type="ref+label"
reference="ex:beilinson-soule-vanishing"}, and the vertical maps are
induced by the inclusion. Moreover, we claim that $i_2$ is injective.
This is trivial in positive characteristic since
$\smash{K_5^{(3)}(F_n)} \cong \smash{K_5^{(3)}(\mathbb{F}_p)}=0$ by
minimality of $n$ and the localization sequence, so we just need to
verify the characteristic zero case. To do so, we fix an embedding
$E \subset {\mathds{C}}$ and observe that the Borel regulator
$\smash{K_5^{(3)}({\mathds{C}})} \to {\mathds{C}}$ factors over
$\Gamma_5^3({\mathds{C}})$ because the Borel regulators agree with
Beilinson regulators up to a nonzero constant and the latter satisfy a
product formula as theory of Chern classes [@Weibel V.11]. Thus the
composition
$${\mathds{Q}} \cong K_5^{(3)}({\mathds{Q}}) \overset{\cong}\longrightarrow\Gamma_5^3({\mathds{Q}}) \overset{\cong}\longrightarrow H^1(\Gamma_3(F_n)) \overset{i_2}\longrightarrow H^1(\Gamma_3(E)) \longrightarrow H^1(\Gamma_3({\mathds{C}})) \longrightarrow{\mathds{C}}$$
with right-most map the Borel regulator, must be injective.

We use this to deduce that
$$(K_4^{(2)}(E) \otimes E^\times)^G \subseteq \ker(m_E).$$ Given
$\alpha \in (K_4^{(2)}(E) \otimes E^\times)^G$, since the multiplication
on algebraic $K$-theory groups is compatible with the Galois action
(because tensor product of vector spaces is), we deduce that
$m_E(\alpha) \in \smash{K_5^{(3)}(E)^G}$. By the existence of transfer
maps, there is a unique $\beta \in \smash{K_5^{(3)}(F_n)}$ such that
$i_1(\beta)=m_E(\alpha)$. Exactness of the bottom row implies that
$p_E(i_1(\alpha))=0$ so commutativity of the diagram says that
$i_2(p_F(\beta))=0$. Since $i_2$ is injective and $p_F$ is an
isomorphism, $\beta=0$ so $m_E(\alpha)=i_1(\beta)=0$ and thus
$\alpha \in \ker(m_E)$ as required.

Finally, we prove that $(K_4^{(2)}(E) \otimes E^\times)^G \neq 0$. Since
$G$ is a finite group and $K_4^{(2)}(E) \neq 0$, the latter contains a
finite irreducible $G$-representation. Since its dual occurs in the
regular representation ${\mathds{Q}}[G]$, it suffices to prove that
$E^\times$ contains the regular representation; this is a consequence of
[@BDEPS Proposition 19] using that $n \geq 1$.

To get field $E$ so that the product map is not injective and not zero,
take $E'$ so that $m_{E'}$ is not injective and let $E=E'(t)$. By
definition the map $m_{E'}$ is not injective and hence
$\ker(m_{E'}) \neq 0$ and $\smash{K_4^{(2)}(E)}\neq 0$. From
[164](#thm:gamma-53){reference-type="ref+label"
reference="thm:gamma-53"}, we know $\ker(m_{E'}) \cong \ker(m_E) \neq 0$
so $m_{E}$ is not injective. But also,
$$\ker(m_{E}) \subseteq K_4^{(2)}(E') \otimes (E')^\times \subsetneq K_4^{(2)}(E) \otimes E^\times,$$
where the second inequality uses that $K_4^{(2)}(E) \neq 0$. Therefore
the map $m_{E}$ is not zero. ◻
:::

## Categorical foundations

To keep this appendix---and the next two---of manageable length, we opt
only to include results that either are not well-known or of crucial
importance to our paper. In this appendix we discuss three foundations
of categeorical nature: duoidal categories (and their variants), Day
convolution, and filtered/graded objects.

::: convention
**Convention 171**. We refer to $\infty$-categories as *categories* and
ordinary categories as *1-categories*. We denote the former by a
calligraphic font ${\mathscr{C}}$ and the latter by a roman font
${\mathrm{C}}$.
:::

### Duoidal categories and their variants

Firstly, we will have use for categories with two compatible tensor
products, one monoidal and the other symmetric monoidal and oplax
monoidal for the other.

#### Duoidal categories {#sec:duoidal}

Let ${\mathrm{Mon}}^{\mathrm{oplax}}({{\mathscr{C}}{\mathrm{at}}})$
denote the category of monoidal categories and oplax monoidal functors.
This has finite products, allowing us to make the next definition,
following the work of Torii [@ToriiDuoidal; @ToriiHigher; @ToriiMult]:

::: {#def:duoidal .definition}
**Definition 172**.  

(i) An *($E_1,E_1)$-duoidal category* is a monoid object
    $({\mathscr{C}},\boxplus,\boxbackslash)$ in
    ${\mathrm{Mon}}^{\mathrm{oplax}}({{\mathscr{C}}{\mathrm{at}}})$.

(ii) An *($E_\infty,E_1)$-duoidal category* is a commutative monoid
     object $({\mathscr{C}},\boxplus,\boxbackslash)$ in
     ${\mathrm{Mon}}^{\mathrm{oplax}}({{\mathscr{C}}{\mathrm{at}}})$.
:::

Unwinding the definition, the structure of an $(E_1,E_1)$-duoidal
category on ${\mathscr{C}}$ gives (a) a monoidal category structure with
tensor product $\boxbackslash$ and unit $1_{\boxbackslash}$, and (b) a
monoidal category structure with tensor product $\boxplus$ and unit
$1_\boxplus$ so that all its structure is oplax monoidal for
$\boxbackslash$. In particular, the oplax monoidalities of the functors
$1_\boxplus\colon \ast \to {\mathscr{C}}$ and
$\boxplus\colon {\mathscr{C}} \times {\mathscr{C}} \to {\mathscr{C}}$
yield maps
$$1_\boxplus\longrightarrow 1_{\boxbackslash} \qquad \text{and} \qquad 1_{\boxbackslash} \longrightarrow 1_{\boxbackslash} \boxplus 1_{\boxbackslash},$$
and we say a duoidal category is *normal* if these are equivalences,
i.e. if those two functors are unital. If so, we identify $1_\boxplus$
and $1_{\boxbackslash}$ and write $1$ for them.

More generally, the oplax monoidality on the functor $\boxplus$ yields
an "interchange" natural transformation $$\begin{equation}
\label{eqn:duoidal-zeta}\zeta \colon (A \boxbackslash B) \boxplus(C \boxbackslash D) \longrightarrow(A \boxplus C) \boxbackslash(B \boxplus D),
\end{equation}$$ and from this we can extract a pair of natural
transformations $$\begin{equation}
\label{eqn:duoidal-ol-ul-zeta} \begin{aligned}\bar{\zeta} &\colon A \boxplus B \overset{\simeq}\longleftarrow (A \boxbackslash 1) \boxplus(1 \boxbackslash B) \overset{\zeta}\longrightarrow(A \boxplus 1) \boxbackslash(1 \boxplus B) \overset{\simeq}\longrightarrow A \boxbackslash B, \\
{\underline{\zeta}} &\colon A \boxplus B \overset{\simeq}\longleftarrow (1 \boxbackslash A) \boxplus(B \boxbackslash 1) \overset{\zeta}\longrightarrow(1 \boxplus B) \boxbackslash(A \boxplus 1) \overset{\simeq}\longrightarrow B \boxbackslash A.\end{aligned}
\end{equation}$$

For an $(E_\infty,E_1)$-duoidal category, the second tensor product
$\boxplus$ is symmetric monoidal; that its symmetry is oplax monoidal
means that the following commutes $$\begin{tikzcd}
    (A \boxbackslash B) \boxplus(C \boxbackslash D) \rar{\zeta} \dar{\sigma} & (A \boxplus C) \boxbackslash(B \boxplus D) \dar{\sigma \boxbackslash\sigma} \\[-5pt]
    (C \boxbackslash D) \boxplus(A \boxbackslash B) \rar{\zeta} & (C \boxbackslash A) \boxplus(D \boxbackslash B).\end{tikzcd}$$
This implies that $\bar{\zeta} \circ \sigma = {\underline{\zeta}}$.

::: remark
*Remark 173*. An $(E_1,E_1)$-duoidal structure on a 1-category is the
same as a duoidal category in the sense of [@GarnerLopezFranco Sections
2.1, 2.2], also known as 2-monoidal category [@AguiarMahajan Chapter 6].
See [@BataninMarkl] for a detailed descriptions of the axioms. An
$(E_\infty,E_1)$-duoidal structure on a 1-category is the same as a
$\boxplus$-symmetric one.
:::

#### A duoidal Eckmann--Hilton argument

We will give a proof of an Eckmann--Hilton argument in
$(E_1,E_1)$-duoidal 1-categories. This is a slightly stronger variant of
the dual of [@GarnerLopezFranco Proposition 30]:

::: {#prop:duoidal-eh .proposition}
**Proposition 174**. *Let $({\mathrm{C}},\boxplus,\boxbackslash)$ be a
normal $(E_1,E_1)$-duoidal 1-category. Suppose that the object
$C \in {\mathrm{C}}$ carries two counital operations
$\delta \colon C \to C \boxplus C$ and
$\Delta \colon C \to C \boxbackslash C$ so that the following commutes
$$\begin{tikzcd} C \rar{\delta} \arrow{dd}{\Delta} & C \boxplus C \dar{\Delta \boxplus\Delta} \\[-5pt]
    & (C \boxbackslash C) \boxplus(C \boxbackslash C) \dar{\zeta} \\[-5pt]
    C \boxbackslash C \rar{\delta \boxbackslash\delta} & (C \boxplus C) \boxbackslash(C \boxplus C).\end{tikzcd}$$
Then
$\overline{\zeta} \circ \delta = \Delta = {\underline{\zeta}} \circ \delta$.*
:::

::: proof
*Proof.* We first verify that the counits $\epsilon \colon C \to 1$ and
$E \colon C \to 1$ for $\delta$ and $\Delta$ agree. Recall that
counitality implies that for any morphism $f \colon C \to D$ the
following compositions
$$C \xrightarrow{\Delta} C \boxbackslash C \xrightarrow{f \boxbackslash E} D \boxbackslash 1 \xrightarrow{\cong} D \qquad C \xrightarrow{\Delta} C \boxbackslash C \xrightarrow{E \boxbackslash f} 1 \boxbackslash D \xrightarrow{\cong} D$$
$$C \xrightarrow{\delta} C \boxplus C \xrightarrow{f \boxplus\epsilon} D \boxplus 1 \xrightarrow{\cong} D \qquad C \xrightarrow{\delta} C \boxplus C \xrightarrow{\epsilon \boxplus f} 1 \boxplus D \xrightarrow{\cong} D$$
are equal to $f$. We claim that $\epsilon = E$ and to do so, consider
next the diagram
$$\begin{tikzcd} C \arrow{dd}{\Delta} \rar{\delta} & C \boxplus C \dar{\Delta \boxplus\Delta} \rar{\epsilon \boxplus\epsilon} &[30pt] 1 \boxplus 1 \\[-5pt]
    & (C \boxplus C) \boxbackslash(C \boxplus C) \dar{\zeta} \rar{(\epsilon \boxplus E) \boxbackslash(E \boxplus\epsilon)} & (1 \boxbackslash 1) \boxplus(1 \boxbackslash 1) \arrow[bend left=25]{ldd}{\cong}[swap]{\zeta} \uar{\cong} \\[-5pt]
     C \boxbackslash C \dar{E \boxbackslash E} \rar{\delta \boxbackslash\delta} & (C \boxplus C) \boxbackslash(C \boxplus C) \dar{(\epsilon \boxplus E) \boxbackslash(E \boxplus\epsilon)}\\[-5pt] 1 \boxbackslash 1 & (1 \boxplus 1) \boxbackslash(1 \boxplus 1) \lar{\cong} \end{tikzcd}$$
where the top-left commutes by hypothesis, the bottom-left by
counitality of $\delta$, the top-right by counitality of $\Delta$, and
bottom-right by naturality of $\zeta$. Then by counitality of $\delta$
the top composition agrees with $\epsilon$, and by counitality of
$\Delta$ the left composition agrees with $E$.

We use this to prove that $\overline{\zeta} \circ \delta = \Delta$:
$$\begin{tikzcd} C \rar{\delta} \arrow{dd}{\Delta} & C \boxplus C \dar{\Delta \boxplus\Delta} &[30pt] \\[-5pt] 
    & (C \boxbackslash C) \boxplus(C \boxbackslash C) \dar{\zeta} \rar{({\mathrm{id}} \boxbackslash E) \boxplus(E \boxbackslash{\mathrm{id}})} & (C \boxbackslash 1) \boxplus(1 \boxbackslash C) \arrow[bend right=10]{lu}[swap]{\cong} \dar{\zeta} \\[-5pt]
    C \boxbackslash C \rar{\delta \boxbackslash\delta} \arrow[bend right=10]{rrd}[swap]{{\mathrm{id}}} & (C \boxplus C) \boxbackslash(C \boxplus C) \rar{({\mathrm{id}} \boxplus\epsilon) \boxbackslash(\epsilon \boxplus{\mathrm{id}})} & (C \boxplus 1) \boxbackslash(1 \boxplus C) \dar{\cong} \\[-5pt]
    & & C \boxbackslash C
    \end{tikzcd}$$ where the left commutes by hypothesis, the top
triangle by counitality of $\Delta$, the bottom-right square by
naturality of $\zeta$ and the fact that $\epsilon = E$, and the bottom
triangle by counitality of $\delta$. The top-right composition is
$\overline{\zeta} \circ \delta$ and the left-bottom composition is
$\Delta$.

Similarly, that ${\underline{\zeta}} \circ \delta = \Delta$ is proven by
$$\begin{tikzcd} C \rar{\delta} \arrow{dd}{\Delta} & C \boxplus C \dar{\Delta \boxplus\Delta} &[30pt] \\[-5pt]
    & (C \boxbackslash C) \boxplus(C \boxbackslash C) \dar{\zeta} \rar{(E \boxbackslash{\mathrm{id}}) \boxplus({\mathrm{id}} \boxbackslash E)} & (1 \boxbackslash C) \boxplus(C \boxbackslash 1) \arrow[bend right=10]{lu}[swap]{\cong} \dar{\zeta} \\[-5pt]
    C \boxbackslash C \rar{\delta \boxbackslash\delta} \arrow[bend right=10]{rrd}[swap]{{\mathrm{id}}} & (C \boxplus C) \boxbackslash(C \boxplus C) \rar{(\epsilon \boxplus{\mathrm{id}}) \boxbackslash({\mathrm{id}} \boxplus\epsilon)} & (1 \boxplus C) \boxbackslash(C \boxplus 1) \dar{\cong} \\[-5pt]
    & & C \boxbackslash C
    \end{tikzcd}$$ ◻
:::

::: {#cor:duoidal-eh-sym .corollary}
**Corollary 175**. *Suppose that $({\mathrm{C}},\boxplus,\boxbackslash)$
is an $(E_\infty,E_1)$-duoidal 1-category, and $C,\delta,\Delta$ are as
in [174](#prop:duoidal-eh){reference-type="ref+label"
reference="prop:duoidal-eh"}. Then
$\overline{\zeta} \circ \delta = \overline{\zeta} \circ \sigma \circ \delta$.*
:::

### Day convolution and its variants {#sec:day}

We will secondly need Day convolution monoidal structures on functor
categories.

#### Day convolution

We start recalling some well-known results, true in both the monoidal
and symmetric settings, and in the unital and nonunital settings. If
${\mathscr{C}}$ has small colimits, then the construction of the functor
category ${\mathrm{Fun}}({\mathscr{A}},{\mathscr{C}})$ lifts to a
functor
$${\mathrm{Fun}}(-,{\mathscr{C}}) \colon {{\mathscr{C}}{\mathrm{at}}}\longrightarrow{{\mathscr{C}}{\mathrm{at}}}$$
sending a functor $f \colon {\mathscr{A}} \to {\mathscr{B}}$ to its left
Kan extension
$f_! \colon {\mathrm{Fun}}({\mathscr{A}},{\mathscr{C}}) \to {\mathrm{Fun}}({\mathscr{B}},{\mathscr{C}})$,
the left adjoint to the restriction functor
$f^* \colon {\mathrm{Fun}}({\mathscr{B}},{\mathscr{C}}) \to {\mathrm{Fun}}({\mathscr{A}},{\mathscr{C}})$.

If ${\mathscr{C}}$ is moreover (symmetric) monoidal with tensor product
preserving small colimits in each entry, for any (nonunital) (symmetric)
monoidal category ${\mathscr{A}}$ there is a Day convolution (nonunital)
(symmetric) monoidal structure on the functor category
${\mathrm{Fun}}({\mathscr{A}},{\mathscr{C}})$ (cf. [@BenMosheSchlank
Theorem 3.1]), with tensor product and monoidal unit given by the left
Kan extensions
$$\begin{tikzcd} {\mathscr{A}} \times {\mathscr{A}} \rar{F \times G} \dar[swap]{\otimes} & {\mathscr{C}} \\
 {\mathscr{A}} \arrow[dashed]{ru}[swap]{F \otimes G} & \end{tikzcd} \qquad \text{and} \qquad \begin{tikzcd} \ast \rar{1_{\mathscr{C}}} \dar[swap]{1_{\mathscr{A}}} & {\mathscr{C}} \\
 {\mathscr{A}}. \arrow[dashed]{ru}[swap]{1_{{\mathrm{Fun}}({\mathscr{A}},{\mathscr{C}})}} & \end{tikzcd}$$
It is natural in the domain and target. For the domain we have
(cf. [@BenMosheSchlank Proposition 3.3]):

::: {#lem:day-naturality-source .lemma}
**Lemma 176**. *Let ${\mathscr{A}}$, ${\mathscr{B}}$ be (symmetric)
monoidal categories and ${\mathscr{C}}$ be a symmetric monoidal category
with small colimits such that the tensor product preserve small colimits
in each entry.*

1.  *If $f \colon {\mathscr{A}} \to {\mathscr{B}}$ is (nonunital) lax
    monoidal, then
    $f_! \colon {\mathrm{Fun}}({\mathscr{A}},{\mathscr{C}}) \to {\mathrm{Fun}}({\mathscr{B}},{\mathscr{C}})$
    is (nonunital) oplax monoidal and its right adjoint
    $f^* \colon {\mathrm{Fun}}({\mathscr{B}},{\mathscr{C}}) \to {\mathrm{Fun}}({\mathscr{A}},{\mathscr{C}})$
    is (nonunital) lax monoidal.*

2.  *If $f \colon {\mathscr{A}} \to {\mathscr{B}}$ is (nonunital) strong
    monoidal, then so is $f_!$.*
:::

For the target we have [@BenMosheSchlank Remark 3.9 and Proposition
3.6].

::: {#lem:day-naturality-target .lemma}
**Lemma 177**. *Let ${\mathscr{A}}$ be a symmetric monoidal category and
${\mathscr{C}}$, ${\mathscr{D}}$ be (symmetric) monoidal categories with
small colimits such that the tensor products preserve small colimits in
each entry.*

1.  *If $f \colon {\mathscr{C}} \to {\mathscr{D}}$ is lax monoidal, then
    so is
    $f_* \colon {\mathrm{Fun}}({\mathscr{A}},{\mathscr{C}}) \to  {\mathrm{Fun}}({\mathscr{A}},{\mathscr{D}})$.*

2.  *If $f \colon {\mathscr{C}} \to {\mathscr{D}}$ is strong monoidal
    and preserves colimits, then
    $f_* \colon {\mathrm{Fun}}({\mathscr{A}},{\mathscr{C}}) \to  {\mathrm{Fun}}({\mathscr{A}},{\mathscr{D}})$
    is strong monoidal.*
:::

#### Promonoidal categories and Day convolution {#sec:promonoidal-day}

It is well-known that the construction of a Day convolution (symmetric)
monoidal structure requires weaker input is than a (symmetric) monoidal
category [@BGSII Section 1]. We will now focus on the promonoidal case,
as it is more relevant to this paper and the symmetric promonoidal case
is entirely analogous:

::: definition
**Definition 178**. A *nonsymmetric promonoidal category* is an operad
${\mathscr{C}}^\otimes \to \Delta^{\mathrm{op}}$ whose restriction
${\mathscr{C}}^\otimes_{\mathrm{act}} \to \Delta^{\mathrm{act}}$ to
active morphisms is flat in the sense of [@LurieHA B.3.8].
:::

::: remark
*Remark 179*. It may be helpful to note that a promonoidal structure on
${\mathscr{C}}$ is the same as a monoidal structure on
${\mathrm{Fun}}({\mathscr{C}},{{\mathscr{S}}{\mathrm{pc}}})$ whose
tensor product preserves colimits in each entry [@LinskensNardinPol
Theorem 3.37].
:::

We let
${\mathrm{ProMon}}^{\mathrm{lax}}({{\mathscr{C}}{\mathrm{at}}}) \subset {\mathrm{Op}}^{\mathrm{ns}}$
denote the full subcategory on the promonoidal categories. Promonoidal
categories are closed under products as a consequence of [@LurieHA
B.3.12, B.3.16], so there is a functor $$\begin{equation}
\label{eqn:promon-prod}\begin{aligned}{\mathrm{ProMon}}^{\mathrm{lax}}({{\mathscr{C}}{\mathrm{at}}}) \times {\mathrm{ProMon}}^{\mathrm{lax}}({{\mathscr{C}}{\mathrm{at}}}) &\longrightarrow{\mathrm{ProMon}}^{\mathrm{lax}}({{\mathscr{C}}{\mathrm{at}}}) \\
({\mathscr{A}}^\otimes,{\mathscr{C}}^\otimes) &\longmapsto {\mathscr{A}}^\otimes \times_{\Delta^{\mathrm{op}}} {\mathscr{C}}^\otimes.\end{aligned}
\end{equation}$$ By [@Hinich 2.8.3], if ${\mathscr{A}}$ is a promonoidal
category then
${\mathscr{A}}^\otimes \times_{\Delta^{\mathrm{op}}}(-) \colon {{\mathscr{O}}{\mathrm{p}}}^{\mathrm{ns}} \to {{\mathscr{O}}{\mathrm{p}}}^{\mathrm{ns}}$
admits a right adjoint
${\mathrm{Fun}}({\mathscr{A}},-)^\otimes \colon {{\mathscr{O}}{\mathrm{p}}}^{\mathrm{ns}} \to {{\mathscr{O}}{\mathrm{p}}}^{\mathrm{ns}}$,
and when evaluated on a monoidal category which has small colimits and
whose tensor product preserves small colimits in each entry, the result
is again a monoidal category by [@NardinShah Theorem 3.2.6] (by
Proposition 3.1.7 loc.cit. their Day convolution agrees with the one
used by Hinich, as it satisfies the same universal property). Let
${\mathrm{Mon}}^{\mathrm{lax,colim}}({{\mathscr{C}}{\mathrm{at}}}) \subset {\mathrm{Mon}}^{\mathrm{lax}}({{\mathscr{C}}{\mathrm{at}}})$
denote the full subcategory on those monoidal categories which have
small colimits and whose tensor product preserves small colimits in each
entry. Extracting these right adjoints yields a functor
$$\begin{equation}
\label{eqn:promon-day}\begin{aligned}{\mathrm{ProMon}}^{\mathrm{lax}}({{\mathscr{C}}{\mathrm{at}}})^{\mathrm{op}}\times {\mathrm{Mon}}^{\mathrm{lax,colim}}({{\mathscr{C}}{\mathrm{at}}}) &\longrightarrow{\mathrm{Mon}}^{\mathrm{lax}}({{\mathscr{C}}{\mathrm{at}}}) \\
({\mathscr{A}}^\otimes,{\mathscr{C}}^\otimes) &\longmapsto {\mathrm{Fun}}({\mathscr{A}},{\mathscr{C}})^\otimes.\end{aligned}
\end{equation}$$ Fixing
${\mathscr{C}}^\otimes \in {\mathrm{Mon}}^{\mathrm{lax,colim}}({{\mathscr{C}}{\mathrm{at}}})$,
this yields a functor
$${\mathrm{Fun}}(-,{\mathscr{C}})^{\otimes} \colon {\mathrm{ProMon}}^{\mathrm{lax}}({{\mathscr{C}}{\mathrm{at}}})^{\mathrm{op}}\longrightarrow{\mathrm{Mon}}^{\mathrm{lax}}({{\mathscr{C}}{\mathrm{at}}})$$
whose naturality is given by restriction. Since ${\mathscr{D}}$ has
small colimits, each restriction functor admits a left adjoint and we
can compose with the mate correspondence
${\mathrm{Mon}}^{\mathrm{R,lax}}({{\mathscr{C}}{\mathrm{at}}})^{\mathrm{op}}\simeq {\mathrm{Mon}}^{\mathrm{L,oplax}}({{\mathscr{C}}{\mathrm{at}}})$
of [@HHLN] to extract a functor
$${\mathrm{Fun}}(-,{\mathscr{C}})^{\otimes} \colon {\mathrm{ProMon}}^{\mathrm{lax}}({{\mathscr{C}}{\mathrm{at}}}) \to {\mathrm{Mon}}^{\mathrm{oplax}}({{\mathscr{C}}{\mathrm{at}}})$$
whose naturality is given by left Kan extension.

::: remark
*Remark 180*. To deal with oplax morphisms we need to work in the
anti-operadic setting. Recall, e.g. as a variant of [@BGSII Definition
1.2], the category ${\mathrm{aOp}}^{\mathrm{ns}}$ of nonsymmetric
monoidal antioperads, whose objects are maps
${\mathscr{C}}_\otimes \to \Delta$ whose opposite is an operad and whose
morphisms are maps over $\Delta$ whose opposite is a map of operads.
Then
${\mathrm{Mon}}^{\mathrm{oplax}}({{\mathscr{C}}{\mathrm{at}}}) \subset {\mathrm{aOp}}^{\mathrm{ns}}$
is the full subcategory of cartesian fibrations, and taking opposites
gives equivalences
$$({\mathrm{Mon}}^{\mathrm{oplax}}({{\mathscr{C}}{\mathrm{at}}}) \simeq {\mathrm{Mon}}^{\mathrm{lax}}({{\mathscr{C}}{\mathrm{at}}})) \subset ({\mathrm{aOp}}^{\mathrm{ns}} \simeq {\mathrm{Op}}^{\mathrm{ns}}).$$
We define
${\mathrm{ProMon}}^{\mathrm{oplax}}({{\mathscr{C}}{\mathrm{at}}}) \subset {\mathrm{aOp}}^{\mathrm{ns}}$
as the full subcategory of those antioperads whose restriction to the
active morphisms is flat, and taking opposites induces an equivalence
${\mathrm{ProMon}}^{\mathrm{oplax}}({{\mathscr{C}}{\mathrm{at}}}) \simeq {\mathrm{ProMon}}^{\mathrm{lax}}({{\mathscr{C}}{\mathrm{at}}})$
generalising that for monoidal categories.
:::

#### Duoidal categories and Day convolution {#sec:duoidal-day}

The functor $$\begin{align*}
 {\mathrm{Mon}}^{\mathrm{lax}}({{\mathscr{C}}{\mathrm{at}}})^{\mathrm{op}}\times {\mathrm{Mon}}^{\mathrm{lax,colim}}({{\mathscr{C}}{\mathrm{at}}}) &\longrightarrow{\mathrm{Mon}}^{\mathrm{lax}}({{\mathscr{C}}{\mathrm{at}}}) \\
({\mathscr{A}}^\otimes,{\mathscr{C}}^\otimes) &\longmapsto {\mathrm{Fun}}({\mathscr{A}},{\mathscr{C}})^\otimes
\end{align*}$$ is lax symmetric monoidal with respect to the cartesian
monoidal structures on domain and target. We will justify this in more
generality momentarily, but see also [@PortaTeyssier Section 4.2] or,
for ${\mathscr{C}} = {{\mathscr{S}}{\mathrm{pc}}}$, [@LurieHA 4.8.1.10].
After fixing a symmetric monoidal category ${\mathscr{C}}$ with small
colimits such that the tensor products preserve small colimits in each
entry, applying the mate correspondence, and evaluating on monoid
objects, we obtain a functor
$${\mathrm{Fun}}(-,{\mathscr{C}})^\otimes \colon {\mathrm{Mon}}({\mathrm{Mon}}^{\mathrm{lax}}({{\mathscr{C}}{\mathrm{at}}})) \longrightarrow{\mathrm{Mon}}({\mathrm{Mon}}^{\mathrm{oplax}}({{\mathscr{C}}{\mathrm{at}}})).$$
This is a lift of Day convolution to the duoidal setting.

#### Produoidal categories and Day convolution

Recalling that
${\mathrm{ProMon}}^{\mathrm{oplax}}({{\mathscr{C}}{\mathrm{at}}})$ has
finite products, we can define a variant of a duoidal category where the
second monoidal structure is only promonoidal as a monoid object in
${\mathrm{ProMon}}^{\mathrm{oplax}}({{\mathscr{C}}{\mathrm{at}}})$.

We have phrased
[\[sec:promonoidal-day,sec:duoidal-day\]](#sec:promonoidal-day,sec:duoidal-day){reference-type="ref+label"
reference="sec:promonoidal-day,sec:duoidal-day"} to apply essentially
verbatim for this variant, as soon as we explain why
$${\mathrm{Fun}}(-,{\mathscr{C}})^\otimes \colon {\mathrm{Mon}}({\mathrm{ProMon}}^{\mathrm{lax}}({{\mathscr{C}}{\mathrm{at}}})) \longrightarrow{\mathrm{Mon}}({\mathrm{Mon}}^{\mathrm{oplax}}({{\mathscr{C}}{\mathrm{at}}}))$$
is lax symmetric monoidal with respect to the cartesian symmetric
monoidal structures on domain and target. The starting point is that
[\[eqn:promon-prod\]](#eqn:promon-prod){reference-type="eqref"
reference="eqn:promon-prod"} is canonically symmetric monoidal with
respect to this, so
[\[eqn:promon-day\]](#eqn:promon-day){reference-type="eqref"
reference="eqn:promon-day"} is lax symmetric monoidal as a consequence
of [@HinichRectification Corollary A.5.1]. As a symmetric monoidal
category ${\mathscr{C}}$ is a commutative monoid, it yields a monoid
object in monoid objects by the additivity theorem, and hence fixing it
we obtain that
$${\mathrm{Fun}}(-,{\mathscr{C}})^\otimes \colon {\mathrm{Mon}}({\mathrm{ProMon}}^{\mathrm{lax}}({{\mathscr{C}}{\mathrm{at}}}))^{\mathrm{op}}\longrightarrow{\mathrm{Mon}}({\mathrm{Mon}}^{\mathrm{lax}}({{\mathscr{C}}{\mathrm{at}}}))$$
with naturality in restriction, is lax monoidal. Finally, we apply the
equivalence from the mate correspondence [@HHLN].

### Filtered and graded objects {#sec:filtered-and-graded}

We finally spell out how we think of graded and filtered objects. Let
${\mathds{Z}}$ be the category whose objects are the integers and whose
only morphisms are identities. Let ${\mathds{Z}}_{\leq}$ be the category
whose objects are the integers and there is a morphism $n \to m$ when
$n \leq m$. That is, the category is given by
$\cdots \to -1 \to 0 \to 1 \to 2 \to \cdots$.

::: definition
**Definition 181**. Let ${\mathscr{C}}$ be a category.

- The category of *graded objects* in ${\mathscr{C}}$ is
  ${\mathrm{Fun}}({\mathds{Z}},{\mathscr{C}})$.

- The category of *filtered objects* in ${\mathscr{C}}$ is
  ${\mathrm{Fun}}({\mathds{Z}}_{\leq},{\mathscr{C}})$.
:::

Addition makes ${\mathds{Z}}$ and ${\mathds{Z}}_{\leq}$ into symmetric
monoidal categories, inducing Day convolution symmetric monoidal
structures on the categories of graded and filtered objects. Letting
${\mathds{N}} \subset {\mathds{Z}}$ denote the nonnegative integers,
there are variants ${\mathrm{Fun}}({\mathds{N}},{\mathscr{C}})$ and
${\mathrm{Fun}}({\mathds{N}}_{\leq},{\mathscr{C}})$, which can be
considered as full subcategories of
${\mathrm{Fun}}({\mathds{Z}},{\mathscr{C}})$ and
${\mathrm{Fun}}({\mathds{Z}}_{\leq},{\mathscr{C}})$, by left Kan
extension along the inclusion. Because ${\mathds{N}} \to {\mathds{Z}}$
and ${\mathds{N}}_\leq \to {\mathds{Z}}_\leq$ are symmetric monoidal, so
are these inclusions. In the following we focus on the ${\mathds{Z}}$-
and ${\mathds{Z}}_{\leq}$-indexed graded and filtered objects,
commenting only on when the ${\mathds{N}}$- and
${\mathds{N}}_{\leq}$-indexed graded and filtered objects behave
differently.

Every $n \in {\mathds{Z}}$ gives rise to functors
$n \colon \ast \to {\mathds{Z}}$ and
$n \colon \ast \to {\mathds{Z}}_{\leq}$. Pulling back along these gives
functors
$n^* \colon {\mathrm{Fun}}({\mathds{Z}},{\mathscr{C}}) \to {\mathscr{C}}$
and
$n^* \colon {\mathrm{Fun}}({\mathds{Z}}_{\leq},{\mathscr{C}}) \to {\mathscr{C}}$
which admit left and right adjoints denoted $n_!$ and $n_*$ as long as
${\mathscr{C}}$ has an initial object ${\mathrm{i}}$ and terminal object
${\mathrm{t}}$. These are given by $$\begin{align*}
n_!(X) &\simeq (\cdots \to {\mathrm{i}} \to {\mathrm{i}} \to X \xrightarrow{{\mathrm{id}}} X \xrightarrow{{\mathrm{id}}} \cdots ) \\
n_*(X) &\simeq (\cdots \xrightarrow{{\mathrm{id}}} X \xrightarrow{{\mathrm{id}}} X \to {\mathrm{t}} \to {\mathrm{t}} \to \cdots)
\end{align*}$$ where the first, or last, $X$ appears in filtration
degree $n$. If ${\mathscr{C}}$ is pointed the functor $n_!$ admits a
further left adjoint $n^\dagger$ given by
$$n^\dagger(X) \simeq {\mathrm{cofib}}(X(n-1) \to \mathop{\mathrm{colim}}X).$$

::: {#lem:eval-lkan-sym-mon .lemma}
**Lemma 182**.

1.  *$n^* \colon {\mathrm{Fun}}({\mathds{Z}}_{\leq},{\mathscr{C}}) \to {\mathscr{C}}$
    is a left and right adjoint, lax symmetric monoidal if $n=0$ and
    nonunital lax symmetric monoidal if $n < 0$.*

2.  *$n_! \colon {\mathscr{C}} \to {\mathrm{Fun}}({\mathds{Z}}_{\leq },{\mathscr{C}})$
    is a left adjoint, symmetric monoidal if $n=0$ and nonunital oplax
    monoidal if $n < 0$.*
:::

::: proof
*Proof.* The functor $n$ is symmetric monoidal if and only if $n=0$, and
the first parts of (1) and (2) follow from
[176](#lem:day-naturality-source){reference-type="ref+label"
reference="lem:day-naturality-source"}. It is nonunital oplax monoidal
(there is a morphism $n \leq n+n$ but no morphism $n \leq 0$) if $n>0$
and nonunital lax monoidal (there is a morphism $n+n \leq n$ but no
morphisms $0 \leq n$) if $n<0$. ◻
:::

## Operadic foundations

In this appendix we discuss (co)operads and (co)algebras, as well as
Koszul duality, in the general setting.

### Operads, cooperads, algebras, and coalgebras

We start with a recollection of operads and algebras, and the dual
notions of cooperads and coalgebras. Details can be found in
[@BCN; @Wu; @HeineMM; @HeutsKoszul].

#### Operads and algebras {#sec:operads-algebras}

We fix a presentable symmetric monoidal category ${\mathscr{C}}$.
Letting ${\mathrm{Fin}}^\simeq$ denote the groupoid of nonempty finite
sets and bijections, the category of *symmetric sequences* is defined as
the functor category
$${\mathrm{SSeq}}({\mathscr{C}}) \coloneq {\mathrm{Fun}}({\mathrm{Fin}}^\simeq,{\mathscr{C}}).$$
This admits two tensor products:

1.  A *Day convolution* symmetric monoidal structure induced by disjoint
    union of finite sets, with tensor product denoted $\otimes$. The
    underlying object of $X \otimes Y$ is given by
    $$(X \otimes Y)({\underline{n}}) \simeq \bigsqcup_{n = n_1+n_2} {\mathfrak{S}}_{n} \times_{{\mathfrak{S}}_{n_1} \times {\mathfrak{S}}_{n_2}} X({\underline{n}}_1) \otimes_{\mathscr{C}} Y({\underline{n}}_2)$$
    and monoidal unit given by $1_{\mathscr{D}}$ concentrated in arity
    $0$.

2.  A *composition* monoidal structure, with tensor product denoted
    $\circ$. The underlying object is given in terms of the Day
    convolution tensor product by
    $$X \circ Y \simeq \bigsqcup_{r \geq 0} X(r) \otimes_{{\mathfrak{S}}_r} Y^{\otimes r},$$
    and the monoidal unit is given by $1_{\mathscr{D}}$ concentrated in
    arity $1$. See [@Wu p. 45] for a formal definition.

::: definition
**Definition 183**. The category ${\mathrm{Op}}({\mathscr{C}})$ of
*operads* is the category
${\mathrm{Alg}}({\mathrm{SSeq}}({\mathscr{C}}))$ of unital associative
algebras in symmetric sequences in ${\mathscr{C}}$ under the composition
product.
:::

The left Kan extension $i_{0,!}$ along the inclusion of the empty set
into ${\mathrm{Fin}}^\simeq$ gives an identification of ${\mathscr{C}}$
with the full subcategory of ${\mathrm{SSeq}}({\mathscr{C}})$ consisting
of those symmetric sequences concentrated in arity zero. This
subcategory is preserved by $X \circ -$, which induces a left action
$${\mathrm{SSeq}}({\mathscr{C}}) \times {\mathscr{C}} \longrightarrow{\mathscr{C}},$$
or in other words, ${\mathscr{C}}$ is a left module over
${\mathrm{SSeq}}({\mathscr{C}})$.

::: definition
**Definition 184**. For an operad
${\mathscr{O}} \in {\mathrm{Op}}({\mathscr{C}})$, the category
${\mathrm{Alg}}_{\mathscr{O}}({\mathscr{C}})$ of
*${\mathscr{O}}$-algebras* is the category of left modules over
${\mathscr{O}}$ in ${\mathscr{C}}$ under the above left action.
:::

This construction is natural in ${\mathscr{O}}$: any map of operads
$f \colon {\mathscr{O}} \to {\mathscr{O}}'$ induces a restriction
functor
$f^* \colon {\mathrm{Alg}}_{{\mathscr{O}}'}({\mathscr{C}}) \to {\mathrm{Alg}}_{\mathscr{O}}({\mathscr{C}})$
which is the identity on underlying objects. This admits both a left and
right adjoint
$f_!,f_* \colon {\mathrm{Alg}}_{{\mathscr{O}}}({\mathscr{C}}) \to {\mathrm{Alg}}_{{\mathscr{O}}'}({\mathscr{C}})$
[@LurieHA 4.2.3.8].

By definition an operad has a unit map
$\eta \colon 1_{\mathscr{C}} \to {\mathscr{O}}$, with domain the
monoidal unit of the composition tensor product. The forgetful functor
${\mathrm{fgt}}_{\mathscr{O}} \coloneq \eta^* \colon {\mathrm{Alg}}_{\mathscr{O}}({\mathscr{C}}) \to {\mathscr{C}}$
admits a left adjoint ${\mathrm{free}}_{\mathscr{O}} \coloneq \eta_!$:
using that
${\mathrm{fgt}}_{1_{\mathscr{C}}} \colon {\mathrm{Alg}}_{1_{\mathscr{C}}}({\mathscr{C}}) \to {\mathscr{C}}$
is an equivalence we get
$$\begin{tikzcd} {\mathscr{C}} \rar[shift left=.5ex]{{\mathrm{free}}_{\mathscr{O}} \simeq \eta_!} &[20pt] {\mathrm{Alg}}_{\mathscr{O}}({\mathscr{C}}). \lar[shift left=.5ex]{{\mathrm{fgt}}_{\mathscr{O}} \simeq \eta^*}\end{tikzcd}$$
This adjunction exhibits ${\mathrm{Alg}}_{\mathscr{O}}({\mathscr{C}})$
as the category of algebras in ${\mathscr{C}}$ over the monad
${\mathrm{Sym}}_{\mathscr{O}} \coloneq {\mathrm{fgt}}_{\mathscr{O}} \circ {\mathrm{free}}_{\mathscr{O}} \colon {\mathscr{C}} \to {\mathscr{C}}$.
It is given on underlying objects by
$${\mathrm{Sym}}_{\mathscr{O}}(X) \simeq \bigsqcup_{r \geq 0} {\mathscr{O}}(r) \otimes_{{\mathfrak{S}}_r} X^{\otimes r}.$$

This completes the discussion of the free-forgetful adjunction, but for
the cotangent-trivial adjunction we need additional data. Note that the
monoidal unit $1_{\mathscr{C}}$ of ${\mathrm{SSeq}}({\mathscr{C}})$ for
the composition tensor product is canonically an operad, so we can
define:

::: definition
**Definition 185**. The category of *augmented operads* is
$${\mathrm{Op}}^{\mathrm{aug}}({\mathscr{C}}) \coloneq {\mathrm{Op}}({\mathscr{C}})_{/1_{\mathscr{C}}}.$$
:::

Thus an augmentation of an operad ${\mathscr{O}}$ is a map of operads
$\epsilon \colon {\mathscr{O}} \to 1_{\mathscr{C}}$, which necessarily
satisfies $\epsilon \circ \eta \simeq {\mathrm{id}}_{1_{\mathscr{C}}}$.
We obtain a pair of adjunctions
$$\begin{tikzcd} {\mathscr{C}} \rar[shift left=.5ex]{{\mathrm{free}}_{\mathscr{O}} \simeq \eta_!} &[20pt] {\mathrm{Alg}}_{\mathscr{O}}({\mathscr{C}}) \rar[shift left=.5ex]{{\mathrm{cot}}_{\mathscr{O}} \coloneq \epsilon_!} \lar[shift left=.5ex]{{\mathrm{fgt}}_{\mathscr{O}} \simeq \eta^*} &[20pt] {\mathscr{C}} \lar[shift left=.5ex]{{\mathrm{triv}}_{\mathscr{O}} \coloneq \epsilon^*} \end{tikzcd}$$
which satisfy
$${\mathrm{cot}}_{\mathscr{O}} \circ {\mathrm{free}}_{\mathscr{O}} \simeq {\mathrm{id}}_{\mathscr{C}} \quad \text{and} \quad {\mathrm{fgt}}_{\mathscr{O}} \circ {\mathrm{triv}}_{\mathscr{O}} \simeq {\mathrm{id}}_{\mathscr{C}}.$$

#### Cooperads and coalgebras {#sec:cooperads-coalgebras}

There is a dual story for coalgebras. It uses that the opposite of a
monoidal category is itself a monoidal category by the monoidal analogue
of [@LurieHA 2.4.2.7].

::: definition
**Definition 186**. The category ${\mathrm{Coop}}({\mathscr{C}})$ of
*cooperads* is the category
${\mathrm{Alg}}({\mathrm{SSeq}}({\mathscr{C}})^{\mathrm{op}})^{\mathrm{op}}$
of counital associative coalgebras in symmetric sequences in
${\mathscr{C}}$ under composition product.
:::

::: definition
**Definition 187**. For a cooperad
${\mathscr{Q}} \in {\mathrm{Op}}({\mathscr{C}})$, the category
${\mathrm{coAlg}}^{{{\mathrm{dpw}},{\mathrm{nil}}}}_{\mathscr{O}}({\mathscr{C}})$
of *conilpotent ${\mathscr{Q}}$-coalgebras with divided powers* is the
category of left comodules over ${\mathscr{Q}}$ in ${\mathscr{C}}$ under
the above left action.
:::

The latter construction is natural by restriction in maps of cooperads,
which admit both a left and right adjoint. Using the counit map
$\epsilon \colon {\mathscr{Q}} \to 1_{\mathscr{C}}$ of a cooperad, we
obtain a forgetful-cofree adjunction
$$\begin{tikzcd} {\mathrm{coAlg}}^{{\mathrm{dpw}},{\mathrm{nil}}}_{\mathscr{Q}}({\mathscr{C}}) \rar[shift left=.5ex]{{\mathrm{fgt}}_{\mathscr{Q}} \coloneq \epsilon^*} &[20pt] {\mathscr{C}} \lar[shift left=.5ex]{{\mathrm{cofree}}_{\mathscr{Q}} \coloneq \epsilon_*}\end{tikzcd}$$
and this exhibits
${\mathrm{coAlg}}^{{{\mathrm{dpw}},{\mathrm{nil}}}}_{\mathscr{O}}({\mathscr{C}})$
as the category of coalgebras for the comonad
${\mathrm{fgt}}_{\mathscr{Q}} \circ {\mathrm{cofree}}_{\mathscr{Q}} \simeq {\mathrm{Sym}}_{\mathscr{Q}}$.

::: definition
**Definition 188**. The category of *augmented cooperads* is
$${\mathrm{Coop}}^{\mathrm{aug}}({\mathscr{C}}) \coloneq {\mathrm{Coop}}({\mathscr{C}})_{1_{\mathscr{C}}/}.$$
:::

Thus an augmentation of a cooperad ${\mathscr{Q}}$ is a map of cooperads
$\eta \colon 1_{\mathscr{C}} \to {\mathscr{Q}}$, from which we obtain a
pair of adjunctions
$$\begin{tikzcd} {\mathscr{C}} \rar[shift left=.5ex]{{\mathrm{cotriv}}_{\mathscr{Q}} \coloneq \eta^*}  &[20pt] {\mathrm{coAlg}}^{{\mathrm{dpw}},{\mathrm{nil}}}_{\mathscr{Q}}({\mathscr{C}}) \lar[shift left=.5ex]{\eta_*} \rar[shift left=.5ex]{{\mathrm{fgt}}_{\mathscr{Q}} \simeq \epsilon^*} &[20pt] {\mathscr{C}}. \lar[shift left=.5ex]{{\mathrm{cofree}}_{\mathscr{Q}} \simeq \epsilon_*} \end{tikzcd}$$
which satisfy
$$\eta_* \circ {\mathrm{cofree}}_{\mathscr{Q}} \simeq {\mathrm{id}}_{\mathscr{C}} \quad \text{and} \quad {\mathrm{fgt}}_{\mathscr{Q}} \circ {\mathrm{cotriv}}_{\mathscr{Q}} \simeq {\mathrm{id}}_{\mathscr{C}}.$$

#### Unitalisation and augmentation ideals {#sec:augmentation-ideals}

We start with the following definition, terminology for a (co)operad
concentrated in strictly positive arities:

::: definition
**Definition 189**.  

(i) The category
    ${\mathrm{Op}}^{\mathrm{nu}}({\mathscr{C}}) \subset {\mathrm{Op}}({\mathscr{C}})$
    of *nonunitary operads* is the full subcategory of those operads
    ${\mathscr{O}}$ so that ${\mathscr{O}}(0)$ is initial.

(ii) The category
     ${\mathrm{Coop}}^{\mathrm{nu}}({\mathscr{C}}) \subset {\mathrm{Coop}}({\mathscr{C}})$
     of *nonunitary cooperads* is the full subcategory of those operads
     ${\mathscr{Q}}$ so that ${\mathscr{Q}}(0)$ is initial.
:::

For the remainder of this subsection we will work with operads but there
is a dual story for cooperads.

We can alternatively define nonunitary operads in terms of nonunitary
symmetric sequences. To do so, let
${\mathrm{Fin}}^{\simeq}_{\neq \varnothing} \subset {\mathrm{Fin}}$
denote the full subcategory of nonempty finite sets, and let
${\mathrm{SSeq}}^{\mathrm{nu}}({\mathscr{C}}) \coloneq {\mathrm{Fun}}({\mathrm{Fin}}^{\simeq}_{\neq \varnothing},{\mathscr{C}})$.
The inclusion
$\iota \colon {\mathrm{Fin}}^{\simeq}_{\neq \varnothing} \hookrightarrow {\mathrm{Fin}}^{\simeq}$
induces a functor $\iota_!$ identifying
${\mathrm{SSeq}}^{\mathrm{nu}}({\mathscr{C}})$ with the full subcategory
of nonunitary operads. The condition that $X(0)$ is initial is preserved
by Day convolution and convolution tensor products, so these restrict to
(symmetric) monoidal structures on $\iota_!$ making $\iota_!$
(symmetric) monoidal and its right adjoint $\iota^*$ lax (symmetric)
monoidal. We get an induced functor
$\iota_! \colon {{\mathscr{O}}{\mathrm{p}}}^{\mathrm{nu}}({\mathscr{C}}) \to {{\mathscr{O}}{\mathrm{p}}}({\mathscr{C}})$
with right adjoint $\iota^*$.

::: definition
**Definition 190**. Given an operad ${\mathscr{O}}$, we define
${\mathscr{O}}^{\mathrm{nu}} \coloneq \iota_! \iota^* {\mathscr{O}}$.
:::

Note that the counit of the adjunction provides with a canonical map
$\upsilon \colon {\mathscr{O}}^{\mathrm{nu}} \to {\mathscr{O}}$ which is
an equivalence if and only if ${\mathscr{O}}$ is nonunitary. This
induces an adjunction
$$\begin{tikzcd} {\mathrm{Alg}}_{{\mathscr{O}}^{\mathrm{nu}}}({\mathscr{C}}) \rar[shift left=.5ex]{(-)^+ \coloneq \upsilon_!} &[20pt] {\mathrm{Alg}}_{\mathscr{O}}({\mathscr{C}}) \lar[shift left=.5ex]{\upsilon^*}.\end{tikzcd}$$
If we suppose that ${\mathscr{O}}$ is *unital*,
i.e. ${\mathscr{O}}(0) \simeq 1_{\mathscr{C}}$, then for
${\mathbf{A}} \in {\mathrm{Alg}}_{{\mathscr{O}}^{\mathrm{nu}}}({\mathscr{C}})$
the *unitalisation* ${\mathbf{A}}^+$ has underlying object
$1_{\mathscr{C}} \sqcup {\mathbf{A}}$ and its ${\mathscr{O}}$-algebra
structure is informally given by the
${\mathscr{O}}^{\mathrm{nu}}$-algebra structure and 0-ary operation
acting by the inclusion
$1_{\mathscr{C}} \to {\mathbf{A}}^+ \simeq 1_{\mathscr{C}} \sqcup {\mathbf{A}}$.

We can do better when working in a stable setting and adding
augmentations. Note that if ${\mathscr{O}}$ is an augmented operad then
the augmentation endows $1_{\mathscr{D}}$ with an
${\mathscr{O}}$-algebra structure, and we can make the following
definition:

::: definition
**Definition 191**. For an augmented operad ${\mathscr{O}}$, the
category of *augmented ${\mathscr{O}}$-algebras* is
$${\mathrm{Alg}}^{\mathrm{aug}}_{\mathscr{O}}({\mathscr{C}}) \coloneq {\mathrm{Alg}}_{\mathscr{O}}({\mathscr{C}})_{/1_{{\mathscr{C}}}}.$$
:::

The following is [@LurieHA 5.4.4.10]:

::: {#prop:augmentation-ideal-and-unitalisation .proposition}
**Proposition 192**. *If ${\mathscr{C}}$ is stable and ${\mathscr{O}}$
is unital, then taking the fibres of the augmentation induces an
equivalence
$${\mathrm{Alg}}^{\mathrm{aug}}_{{\mathscr{O}}}({\mathscr{C}}) \overset{\simeq}\longrightarrow{\mathrm{Alg}}_{{\mathscr{O}}^{\mathrm{nu}}}({\mathscr{C}})$$
with inverse given by the unitalisation $(-)^+$.*
:::

#### Suspension and linear duals {#sec:operadic-suspension-linear-duals}

We now recall two constructions that can be performed on (co)operads in
a presentable stable symmetric monoidal category ${\mathscr{C}}$, both
using the levelwise tensor product of symmetric sequences [@BCN Section
3.2].

The first is *operadic suspension*, given by taking the levelwise tensor
product with the endomorphism operad of the desuspended monoidal unit
$1_{\mathscr{C}}$. An $s{\mathscr{O}}$-algebra structure on $X$ is the
same as an ${\mathscr{O}}$-algebra structure on $\Sigma X$, and
similarly for cooperads. That is, there are commutative squares
[@HeutsLandFormality Section 3.1]
$$\begin{tikzcd} {\mathrm{Alg}}_{{\mathscr{O}}}({\mathscr{C}}) \rar{\simeq} \dar[swap]{{\mathrm{fgt}}_{\mathscr{O}}} & {\mathrm{Alg}}_{s^k{\mathscr{O}}}({\mathscr{C}}) \dar{{\mathrm{fgt}}_{s^k{\mathscr{O}}}} \\[-5pt]
{\mathscr{C}} \rar{\Sigma^k}[swap]{\simeq} & {\mathscr{C}},\end{tikzcd} \qquad \text{and} \qquad \begin{tikzcd} {\mathrm{coAlg}}_{{\mathscr{Q}}}({\mathscr{C}}) \rar{\simeq} \dar[swap]{{\mathrm{fgt}}_{\mathscr{Q}}} & {\mathrm{coAlg}}_{s^k{\mathscr{Q}}}({\mathscr{C}}) \dar{{\mathrm{fgt}}_{s^k{\mathscr{Q}}}} \\[-5pt]
{\mathscr{C}} \rar{\Sigma^{-k}}[swap]{\simeq} & {\mathscr{C}}.\end{tikzcd}$$

The second is *taking duals*, which provides a way to construct
cooperads from operads by taking duals, and vice versa. Taking adjoints
to the levelwise tensor product of symmetric sequences [@BCN Proposition
3.9, Proposition 3.47] we can define a lax monoidal linear duality
functor
${\mathrm{SSeq}}({\mathscr{C}})^{\mathrm{op}}\to {\mathrm{SSeq}}({\mathscr{C}})$
which is symmetric monoidal on levelwise dualisable objects. Thus from a
cooperad ${\mathscr{Q}}$ we obtain a dual operad $D{\mathscr{Q}}$, and
for any operad ${\mathscr{O}}$ with ${\mathscr{O}}(n)$ dualisable for
$n \geq 0$ we obtain a dual cooperad $D{\mathscr{O}}$.

#### Naturality in category

Any functor induces by postcomposition a functor
$$f^{\mathrm{SSeq}} \colon {\mathrm{SSeq}}({\mathscr{C}}) \longrightarrow{\mathrm{SSeq}}({\mathscr{D}}),$$
which lifts to a lax monoidal functor if $f$ is a lax symmetric monoidal
functor. If $f$ is colimit-preserving, then so is $f^{\mathrm{SSeq}}$
and this further lifts to a strong or oplax symmetric monoidal functor
if $f$ is a strong or oplax symmetric monoidal functor.

Passing to category of associative (co)algebras, these in turn induce
functors between categories of (co)operads $$\begin{align*}
f^{\mathrm{Op}} \colon {\mathrm{Op}}({\mathscr{C}}) &\longrightarrow{{\mathscr{O}}{\mathrm{p}}}({\mathscr{D}}), && \text{if $f$ is lax symmetric monoidal,}\\ 
f^{\mathrm{Coop}} \colon {\mathrm{Coop}}({\mathscr{C}}) &\longrightarrow{\mathrm{Coop}}({\mathscr{D}}), && \text{\parbox[t]{5cm}{\centering if $f$ is oplax symmetric monoidal and colimit-preserving.}}
\end{align*}$$

Passing to category of (co)modules, we similarly get functors between
categories of (co)algebras $$\begin{align*}
f^{\mathrm{Alg}} \colon {\mathrm{Alg}}_{{\mathscr{O}}}({\mathscr{C}}) &\longrightarrow{\mathrm{Alg}}_{f^{\mathrm{Op}}({\mathscr{O}})}({\mathscr{D}}), && \text{if $f$ is lax symmetric monoidal,}\\
f^{\mathrm{coAlg}} \colon {\mathrm{coAlg}}^{{\mathrm{dpw}},{\mathrm{nil}}}_{\mathscr{Q}}({\mathscr{C}}) &\longrightarrow{\mathrm{coAlg}}^{{\mathrm{dpw}},{\mathrm{nil}}}_{f^{\mathrm{Coop}}({\mathscr{Q}})}({\mathscr{D}}), && \text{\parbox[t]{5cm}{\centering if $f$ is oplax symmetric monoidal and colimit-preserving.}}
\end{align*}$$ In the nonunitary setting these constructions only
require that $f$ is nonunital strong, nonunital lax, or nonunital oplax
symmetric monoidal.

#### Naturality in category, continued {#sec:alg-nat-left-adjoint}

Of particular interest is the case of an adjunction $L \dashv R$ with
$R \colon {\mathscr{D}} \to {\mathscr{C}}$ lax symmetric monoidal and
$L \colon {\mathscr{C}} \to {\mathscr{D}}$ given the corresponding oplax
symmetric monoidality from the mate correspondence [@HHLN]. Then
$R^{\mathrm{SSeq}}$ preserves small limits and is accessible, since
limits and filtered colimits are computed in the underlying category.
Using [@LurieHA 4.2.3.7] and similar reasoning, the induced functor
$$R^{\mathrm{Alg}} \colon {\mathrm{Alg}}_{\mathscr{O}}({\mathscr{C}}) \to {\mathrm{Alg}}_{R^{\mathrm{Op}}({\mathscr{O}})}({\mathscr{D}})$$
is a functor between presentable categories that preserves limits and is
accessible. Using the adjoint functor theorem [@LurieHTT 5.5.2.9], it
hence admits a left adjoint
$$L^{\mathrm{Alg}} \colon  {\mathrm{Alg}}_{R^{\mathrm{Op}}({\mathscr{O}})}({\mathscr{D}}) \longrightarrow{\mathrm{Alg}}_{{\mathscr{O}}}({\mathscr{C}}).$$

If $R$ is unital, i.e. $1_{{\mathscr{D}}} \to R(1_{\mathscr{C}})$ is an
equivalence, then by using naturality in ${\mathscr{O}}$ and the monadic
resolution, we see this is uniquely characterised by preserving sifted
colimits and
$L^{\mathrm{Alg}} {\mathrm{free}}_{R^{\mathrm{Op}}({\mathscr{O}})} \simeq {\mathrm{free}}_{{\mathscr{O}}} L$.
Indeed, one computes
$$L^{\mathrm{Alg}}({\mathbf{A}}) \simeq |[p] \mapsto {\mathrm{free}}_{\mathscr{O}} L({\mathrm{Sym}}_{R^{\mathrm{Op}}({\mathscr{O}})}^p({\mathbf{A}}))|,$$
which also makes clear that
${\mathrm{fgt}}_{\mathscr{O}}L^{\mathrm{Alg}}({\mathbf{A}})$ rarely
agrees with $L({\mathrm{fgt}}_{R^{\mathrm{Op}}({\mathscr{O}})}A)$. We
shall give some more details on how to construct the above simplicial
object. Our starting point is the natural equivalence
$${\mathrm{Map}}_{{\mathrm{Alg}}_{R^{{\mathscr{O}}{\mathrm{p}}}({\mathscr{O}})}({\mathscr{D}})}({\mathrm{free}}_{R^{{\mathscr{O}}{\mathrm{p}}}({\mathscr{O}})}(X),R^{\mathrm{Alg}}{\mathbf{B}}) \simeq {\mathrm{Map}}_{{\mathrm{Alg}}_{\mathscr{O}}({\mathscr{C}})}({\mathrm{free}}_{\mathscr{O}}(LX),{\mathbf{B}}).$$
By Yoneda, we obtain a functor
${\mathrm{Alg}}_{R^{{\mathscr{O}}{\mathrm{p}}}({\mathscr{O}})}({\mathscr{D}})^{\mathrm{free}}\to {\mathrm{Alg}}_{{\mathscr{O}}}({\mathscr{C}})$,
where the domain is the full subcategory on the free
$R^{{\mathscr{O}}{\mathrm{p}}}({\mathscr{O}})$-algebras, which sends the
object
${\mathrm{free}}_{R^{{\mathscr{O}}{\mathrm{p}}}({\mathscr{O}})}(X)$ to
${\mathrm{free}}_{\mathscr{O}}L(X)$. Now apply this to the simplicial
object
$[p] \mapsto {\mathrm{free}}_{R^{{\mathscr{O}}{\mathrm{p}}}({\mathscr{O}})}({\mathrm{Sym}}^p_{R^{{\mathscr{O}}{\mathrm{p}}}({\mathscr{O}})}({\mathbf{A}}))$.

::: remark
*Remark 193*. This can be connected to [@GKRW18 Section 3.2.2]. The
following should yield alternative construction of $L^{\mathrm{Alg}}$,
corresponding to the construction there after passing from model
categories to $\infty$-categories: there is an equivalence
$${\mathrm{RMod}}_T({\mathrm{Fun}}({\mathscr{C}},{\mathscr{D}})) \overset{\simeq}\longrightarrow{\mathrm{Fun}}^{\mathrm{sifted}}({\mathrm{Alg}}_T({\mathscr{C}}),{\mathscr{D}})$$
for a monad $T$ preserving sifted colimits (combine [@Heine Corollary
5.29] with the fact that for such monads the restriction
${\mathrm{Fun}}^{\mathrm{sifted}}({\mathrm{Alg}}_T({\mathscr{C}}),{\mathscr{D}}) \to {\mathrm{Fun}}({\mathrm{Alg}}'_T({\mathscr{C}}),{\mathscr{D}})$
to the essential image
${\mathrm{Alg}}'_T({\mathscr{C}}) \subset {\mathrm{Alg}}_T({\mathscr{C}})$
of the free $T$-algebra functor is an equivalence), which sends a right
$T$-module functor $F$ to the sifted colimit
$${\mathbf{A}} \longmapsto F^{\mathrm{Alg}}({\mathbf{A}}) \coloneq |[p] \mapsto F(T^p({\mathbf{A}}))|.$$
To get $L^{\mathrm{Alg}}$, we apply this to
$F = {\mathrm{free}}_{{\mathscr{O}}} \circ L$ with right
${\mathrm{Sym}}_{R({\mathscr{O}})}$-module structure arising from the
natural transformation
$L {\mathrm{Sym}}_{R({\mathscr{O}})} \to {\mathrm{Sym}}_{{\mathscr{O}}} L$
induced by the oplax monoidality of $L$ and the counit of the adjunction
$L \dashv R$, and the canonical right
${\mathrm{Sym}}_{\mathscr{O}}$-module structure of
${\mathrm{free}}_{\mathscr{O}}$ (which corresponds to the identity
functor under the above equivalence).
:::

Dually, there is an induced functor
$$L^{\mathrm{coAlg}} \colon {\mathrm{coAlg}}^{{\mathrm{dpw}},{\mathrm{nil}}}_{\mathscr{P}}({\mathscr{D}}) \to {\mathrm{coAlg}}^{{\mathrm{dpw}},{\mathrm{nil}}}_{L^{\mathrm{coOp}}({\mathscr{Q}})}({\mathscr{C}})$$
which admits a right adjoint
$$R^{\mathrm{coAlg}} \colon {\mathrm{coAlg}}^{{\mathrm{dpw}},{\mathrm{nil}}}_{L^{\mathrm{coOp}}({\mathscr{Q}})}({\mathscr{C}}) \longrightarrow{\mathrm{coAlg}}^{{\mathrm{dpw}},{\mathrm{nil}}}_{\mathscr{P}}({\mathscr{D}}).$$

### Bar-cobar duality

We first recall bar-cobar duality as formulated by Lurie [@LurieHA 5.2]
and then apply this to (co)operads and (co)algebras. Further references
include [@BCN Section 3.4], [@BlansBlom Sections 4.1, 4.2], and [@PRY]
(comparing Lurie's bar-cobar duality to the more classical one in
e.g. [@LodayVallette]).

#### Bar-cobar duality in general

Let ${\mathscr{C}}$ be a presentable monoidal category so that
$1_{\mathscr{C}}$ is both initial and terminal; this may be arranged by
slicing over and under the monoidal unit, which amounts to passing to
(co)augmented (co)algebras. Bar-cobar duality is then the existence of a
commutative diagram of adjunctions [@BCN Theorem 3.26]
$$\begin{equation}
\label{eqn:bar-cobar-general} \begin{tikzcd} {\mathrm{LMod}}({\mathscr{C}})  \arrow[shift left=.5ex]{r}{{\mathrm{Bar}}}  \dar &[5ex] \arrow[shift left=.5ex]{l}{{\mathrm{Cobar}}} \dar {\mathrm{LComod}}({\mathscr{C}}) \eqqcolon {\mathrm{LMod}}({\mathscr{C}}^{\mathrm{op}})^{\mathrm{op}}\\[-5pt]
     \arrow[shift left=.5ex]{r}{{\mathrm{Bar}}} {\mathrm{Alg}}({\mathscr{C}}) &[5ex] {\mathrm{coAlg}}({\mathscr{C}}) \eqqcolon {\mathrm{Alg}}({\mathscr{C}}^{\mathrm{op}})^{\mathrm{op}}\arrow[shift left=.5ex]{l}{{\mathrm{Cobar}}}
     \end{tikzcd}
\end{equation}$$ where the vertical arrows are cocartesian fibrations
encoding categories of left (co)modules over (co)associative
(co)algebras, the bottom horizontal arrows are (co)bar constructions
with respect to the tensor product, and the top horizontal arrows are
relative (co)bar constructions.

#### Naturality in category {#sec:bar-cobar-naturality-general}

If $R \colon {\mathscr{C}} \to {\mathscr{D}}$ is a lax monoidal functor
between categories satisfying the above hypotheses and admitting a
necessarily oplax monoidal left adjoint $L$, then there are functors
$R^{\mathrm{Alg}} \colon {\mathrm{Alg}}({\mathscr{C}}) \to {\mathrm{Alg}}({\mathscr{D}})$
and
$L^{\mathrm{coAlg}} \colon {\mathrm{Alg}}({\mathscr{D}}) \to {\mathrm{Alg}}({\mathscr{C}})$,
and similarly for (co)modules. These are related to bar-cobar duality
through the existence of a natural transformation of functors
${\mathrm{Alg}}({\mathscr{C}}) \to {\mathrm{coAlg}}({\mathscr{C}})$
which will appear in [@BlansBlomKupers]:
$$L^{\mathrm{coAlg}}\, {\mathrm{Bar}}_{\mathscr{D}}\, R^{\mathrm{Alg}} \longrightarrow{\mathrm{Bar}}_{\mathscr{C}}.$$
The weaker case that $R$ is symmetric monoidal and preserves geometric
realisations, does already appear in the literature, e.g. [@BlansBlom
Proposition 4.1.18].

#### Bar-cobar duality for (co)operads and (co)algebras {#sec:bar-cobar-operads-algebras}

Bar-cobar duality can specialised to symmetric sequences, and there
gives a commutative diagram $$\begin{equation}
\label{eqn:bar-cobar-operads-algebras} \begin{tikzcd} {\mathrm{LMod}}^{\mathrm{aug}}({\mathscr{C}})  \arrow[shift left=.5ex]{r}{{\mathrm{Bar}}}  \dar &[5ex] \arrow[shift left=.5ex]{l}{{\mathrm{Cobar}}} \dar {\mathrm{LComod}}^{\mathrm{aug}}({\mathscr{C}}) \\[-5pt]
     \arrow[shift left=.5ex]{r}{{\mathrm{Bar}}} {\mathrm{Op}}^{\mathrm{aug}}({\mathscr{C}}) &[5ex] {\mathrm{Coop}}^{\mathrm{aug}}({\mathscr{C}}) \arrow[shift left=.5ex]{l}{{\mathrm{Cobar}}}
     \end{tikzcd}
\end{equation}$$ where the vertical arrows are cocartesian fibrations
encoding categories of left (co-)modules over augmented (co-)operads,
the horizontal arrows are (co-)bar constructions. Let
${\mathrm{Op}}^{\mathrm{nu}}({\mathscr{C}}) \subset {\mathrm{Op}}({\mathscr{C}})$
and
${\mathrm{Coop}}^{\mathrm{nu}}({\mathscr{C}}) \subset {\mathrm{Coop}}({\mathscr{C}})$
be the full subcategories of *nonunitary* (co-)operads; alternatively,
one can work with nonunitary symmetric sequences defined using nonempty
finite sets in place of finite sets. The following is [@HeutsKoszul
Theorem 3.4]:

::: theorem
**Theorem 194**. *Bar-cobar duality restricts to an adjoint equivalence
$$\begin{tikzcd} {\mathrm{Op}}^{\mathrm{nu,aug}}({\mathscr{C}}) \arrow[shift left=.5ex]{r}{{\mathrm{Bar}}} &[5ex] {\mathrm{Coop}}^{\mathrm{nu,aug}}({\mathscr{C}}) \arrow[shift left=.5ex]{l}{{\mathrm{Cobar}}}. \end{tikzcd}$$*
:::

::: notation
**Notation 195**. We will abbreviate ${\mathrm{Bar}}({\mathscr{O}})$ to
$B{\mathscr{O}}$ and ${\mathrm{Cobar}}({\mathscr{Q}})$ to
$\Omega {\mathscr{Q}}$.
:::

The adjunction on the vertical fibres of
[\[eqn:bar-cobar-operads-algebras\]](#eqn:bar-cobar-operads-algebras){reference-type="eqref"
reference="eqn:bar-cobar-operads-algebras"} over an augmented operad
${\mathscr{O}}$ and its image $B{\mathscr{O}}$, is related to the
cotangent complex as in the following proposition [@BCN Corollary 3.30],
where one uses [@HaugsengMonads] to extract a map of monads from a
commutative square whose horizontal morphisms are left adjoints:

::: proposition
**Proposition 196**. *There is a commutative diagram of left adjoints
$$\begin{tikzcd} {\mathrm{Alg}}_{\mathscr{O}}({\mathscr{C}}) \arrow{rr}{{\mathrm{Bar}}} \arrow{rd}[swap]{{\mathrm{cot}}_{\mathscr{O}}} & & {\mathrm{coAlg}}^{{{\mathrm{dpw}},{\mathrm{nil}}}}_{B{\mathscr{O}}}({\mathscr{C}}) \arrow{ld}{{\mathrm{fgt}}_{B{\mathscr{O}}}} \\[-5pt]
        & {\mathscr{C}} & \end{tikzcd}$$ inducing an equivalence of
comonads
${\mathrm{cot}}_{\mathscr{O}} \circ {\mathrm{triv}}_{\mathscr{O}} \simeq {\mathrm{Sym}}_{B{\mathscr{O}}}$.*
:::

In particular, this exhibits the adjunction
${\mathrm{Bar}}\dashv {\mathrm{Cobar}}$ as a lift of the adjunction
${\mathrm{cot}}_{\mathscr{O}} \dashv {\mathrm{triv}}_{\mathscr{O}}$, and
we will use the more suggestive notation
$$\begin{tikzcd} {\mathrm{Alg}}_{\mathscr{O}}({\mathscr{C}}) \rar[shift left=.5ex]{{\mathrm{indec}}^{\mathrm{nil}}_{\mathscr{O}}} &[20pt] {\mathrm{coAlg}}_{B{\mathscr{O}}}^{{{\mathrm{dpw}},{\mathrm{nil}}}}({\mathscr{C}}) \lar[shift left=.5ex]{{\mathrm{prim}}^{\mathrm{nil}}_{B{\mathscr{O}}}}.\end{tikzcd}$$

::: remark
*Remark 197*. In the context of homological stability, Randal-Williams
first introduced the idea that additional coalgebraic structures on
indecomposables should play an important role [@RWchromatic].
:::

The construction of bar-cobar duality using (co)endomorphism objects
gives a different description of
${\mathrm{indec}}^{\mathrm{nil}}_{\mathscr{O}}$ [@BCN Proposition 3.34]:

::: {#lem:bar-via-endomorphism-objects .lemma}
**Lemma 198**. *There is a *Koszul complex*
$$K({\mathscr{O}}) \in {\mathrm{RMod}}_{\mathscr{O}}({\mathrm{LComod}}_{B{\mathscr{O}}}({\mathrm{SSeq}}({\mathscr{C}})) \simeq  {\mathrm{LComod}}_{B{\mathscr{O}}}({\mathrm{RMod}}_{\mathscr{O}}({\mathrm{SSeq}}({\mathscr{C}}))$$
which exhibits $B{\mathscr{O}}$ as a coendomorphism object of
$1_{\mathscr{C}} \in {\mathrm{RMod}}_{\mathscr{O}}({\mathrm{SSeq}}({\mathscr{C}}))$,
and we have an equivalence of functors where $\circ$ denotes the
composition product
$${\mathrm{indec}}^{\mathrm{nil}}_{B{\mathscr{O}}} \simeq K({\mathscr{O}}) \circ_{\mathscr{O}} (-) \colon {\mathrm{Alg}}_{\mathscr{O}}({\mathscr{C}}) \longrightarrow{\mathrm{coAlg}}_{B{\mathscr{O}}}^{{\mathrm{dpw}},{\mathrm{nil}}}({\mathscr{C}}).$$*
:::

### Koszul duality

Koszul duality concerns the question when the relative bar construction
induces an equivalence. We discuss this now, assuming that
${\mathscr{C}}$ is a presentable stable symmetric monoidal category. The
general case is addressed in [@HeutsKoszul Theorem 2.1], where Heuts
constructs a category
${\mathrm{coAlg}}^{{\mathrm{dpw}}}_{\mathscr{Q}}({\mathscr{C}})$ of
coalgebras with divided powers [@HeutsKoszul Appendix A] and a
commutative diagram of left adjoints $$\begin{equation}
\label{eqn:kd-diag} \begin{tikzcd} {\mathrm{Alg}}_{\mathscr{O}}({\mathscr{C}}) \arrow{rr}{{\mathrm{indec}}_{\mathscr{O}}} \arrow{rd}[swap]{{\mathrm{indec}}^{\mathrm{nil}}_{\mathscr{O}}} & & {\mathrm{coAlg}}^{{{\mathrm{dpw}}}}_{B{\mathscr{O}}}({\mathscr{C}}) \arrow{ld} \\[-5pt]
    & {\mathrm{coAlg}}^{{{\mathrm{dpw}},{\mathrm{nil}}}}_{B{\mathscr{O}}}({\mathscr{C}}). & \end{tikzcd}
\end{equation}$$ Moreover, the top adjunction
${\mathrm{indec}}_{\mathscr{O}} \dashv {\mathrm{prim}}_{B{\mathscr{O}}}$
yields an adjoint equivalence when restricted to nilcomplete algebras on
the left and conilcomplete coalgebras on the right.

We will mainly work in the "connected" setting, however, where the
situation simplifies significantly. Suppose that ${\mathscr{C}}$ comes
with a left-compatible $t$-structure ($\otimes$ maps
${\mathscr{C}}_{\geq 0} \otimes {\mathscr{C}}_{\geq 0}$ into
${\mathscr{C}}_{\geq 0}$), then we say a nonunitary operad
${\mathscr{O}}$ is *connective* if
${\mathscr{O}}(n) \in {\mathscr{C}}_{\geq 0}$ for all $n \geq 1$ and a
(co)algebra is *connected* if its underlying object lies in
${\mathscr{C}}_{\geq 1}$. Then [@HeutsKoszul Theorem 14.1, 14.6] says
that:

::: {#thm:kd-connected .theorem}
**Theorem 199** (Heuts). *If ${\mathscr{O}}$ is a connective nonunitary
operad, then all adjunctions in
[\[eqn:kd-diag\]](#eqn:kd-diag){reference-type="eqref"
reference="eqn:kd-diag"} yield adjoint equivalences when we restrict to
connected (co)algebras.*
:::

We will need a comparison result between coalgebras with divided powers
and the definition of coalgebras used in [@LurieHA], to be proven in
[@HeutsLand]:

::: {#prop:lurie-dp-comparison .proposition}
**Proposition 200** (Heuts--Land). *If ${\mathscr{O}}$ is a nonunitary
operad in spaces so that each ${\mathscr{O}}(n)$ a finite
${\mathfrak{S}}_n$-space, then there is an equivalence
$${\mathrm{Alg}}_{{\mathscr{O}}}({\mathscr{C}}^{\mathrm{op}})^{\mathrm{op}}\simeq {\mathrm{coAlg}}^{{\mathrm{dpw}}}_{D{\mathscr{O}}}({\mathscr{C}})$$
with target as in [\[eqn:kd-diag\]](#eqn:kd-diag){reference-type="eqref"
reference="eqn:kd-diag"}, which is the identity on underlying objects.*
:::

### Rectification in the dg-setting {#sec:rect-dg}

We will need to perform several explicit computations and for this it is
helpful to be able to use strict (co)algebras over (co)operads and
explicit methods to compute the indecomposables. We restrict our
attention to 1-category ${\mathrm{Ch}}_{\mathds{Q}}$ of (unbounded)
rational chain complexes with tensor product. By [@LurieHA 1.3.5.15]
inverting the class $W_{\mathrm{qiso}}$ of quasi-isomorphisms yield the
(unbounded) derived category [@LurieHA 1.3.5.8]
$${{\mathscr{D}}_{\mathds{Q}}}\coloneq {\mathrm{Ch}}_{\mathds{Q}}[W_{{\mathrm{qiso}}}^{-1}],$$
which is also equivalent to the category
${\mathrm{Mod}}_{H{\mathds{Q}}}({\mathscr{S}}{\mathrm{p}})$ of
$H{\mathds{Q}}$-module spectra [@LurieHA 7.1.1.16].

We will later also need the case of functor categories
${\mathrm{Fun}}({\mathrm{C}},{\mathrm{Ch}}_{\mathds{Q}})$ for a
symmetric monoidal 1-category ${\mathrm{C}}$, or
monoidal/promonoidal/duoidal/produoidal variants, with Day convolution
tensor product; there are no issues in doing so, and we will not comment
on this further for the sake of brevity.

The projective model structure on the 1-category
${\mathrm{SSeq}}({\mathrm{Ch}}_{\mathds{Q}})$ presents
${\mathrm{SSeq}}({{\mathscr{D}}_{\mathds{Q}}})$, and the composition
product on the former yields the composition product on the latter [@BCN
Corollary 4.23, Corollary 4.32]. We can transfer this to model
structures on the 1-category ${\mathrm{Op}}({\mathrm{Ch}}_{\mathds{Q}})$
of 1-operads presenting ${\mathrm{Op}}({{\mathscr{D}}_{\mathds{Q}}})$
[@HaugsengSS Corollary 4.11] and on the 1-category
${\mathrm{Alg}}_{{\mathrm{O}}}({\mathrm{Ch}}_{\mathds{Q}})$ of
1-algebras over a 1-operad presenting
${\mathrm{Alg}}_{\mathscr{O}}({{\mathscr{D}}_{\mathds{Q}}})$ (where
${\mathscr{O}}$ is the operad associated to the 1-operad ${\mathrm{O}}$)
[@GetzlerJones Theorem 4.4] [@HaugsengSS Theorem 4.10]. That is, we have
equivalences
$${\mathrm{Op}}({\mathrm{Ch}}_{\mathds{Q}})[W^{-1}] \overset{\simeq}\longrightarrow{\mathrm{Op}}({{\mathscr{D}}_{\mathds{Q}}}) \qquad \text{and} \qquad {\mathrm{Alg}}_{\mathrm{O}}({\mathrm{Ch}}_{\mathds{Q}})[W^{-1}] \overset{\simeq}\longrightarrow{\mathrm{Alg}}_{\mathscr{O}}({{\mathscr{D}}_{\mathds{Q}}}),$$
where we have used that in the setting of rational chain complexes any
operad is $\Sigma$-cofibrant. There is a similar model structure on
${\mathrm{Coop}}({\mathrm{Ch}}_{\mathds{Q}})$ [@AubryChataur Theorem
2.4.1] (take $i=1$) and the chain-level operadic bar construction
[@GetzlerJones Section 2.1] [@LodayVallette Section 6.5] is the left
adjoint in a Quillen equivalence [@AubryChataur p. 3]
$$B \colon {\mathrm{Op}}({\mathrm{Ch}}_{\mathds{Q}}) \longrightarrow{\mathrm{Coop}}({\mathrm{Ch}}_{\mathds{Q}}).$$
Finally, while the 1-category
${\mathrm{coAlg}}^{{\mathrm{dpw}},{\mathrm{nil}}}_{\mathrm{Q}}({{\mathscr{D}}_{\mathds{Q}}})$
of 1-coalgebras over a 1-cooperad ${\mathrm{Q}}$ has a class of "weak
equivalences" given by those maps that are quasi-isomorphisms on
underlying objects; these are known to be the weak equivalence of a
model structure only when we restrict to 1-coalgebras over a *connected*
1-cooperad [@GetzlerJones Theorem 4.7] [@AubryChataur Theorem 3.2.3];
see [@PRY] for more general results without connectivity hypotheses. We
highlight one feature of the rational setting: the norm maps
$(X^{\otimes n})_{\mathfrak{S}_n} \to (X^{\otimes n})^{\mathfrak{S}_n}$
are equivalences, so a divided power structure on a coalgebra is no
additional data:

::: notation
**Notation 201**. When working in a rational setting, we drop the
superscript ${\mathrm{dpw}}$, unless there is a chance for confusion.
:::

The chain-level operadic bar construction for operads not only yields
the aforementioned cooperad
$B{\mathrm{O}} \in {\mathrm{Coop}}({\mathrm{Ch}}_{\mathds{Q}})$ but also
a $B{\mathrm{O}}$-coalgebra $B^{\mathrm{O}} {\mathbf{A}}$ for each
${\mathrm{O}}$-algebra ${\mathbf{A}}$ [@GetzlerJones Section 2.3]
[@LodayVallette Section 11.2]. The proof of [@BCN Theorem 4.42], in the
easier standard setting rather than pro-coherent one, yields a
commutative diagram
$$\begin{tikzcd} {\mathrm{Alg}}_{{\mathrm{O}}}({\mathrm{Ch}}_{\mathds{Q}})[W^{-1}] \rar{B^{\mathrm{O}}} \dar{\simeq} & {\mathrm{coAlg}}^{{\mathrm{nil}}}_{B{\mathrm{O}}}({\mathrm{Ch}}_{\mathds{Q}})[W^{-1}] \dar \\[-5pt]
{\mathrm{Alg}}_{\mathscr{O}}({{\mathscr{D}}_{\mathds{Q}}}) \rar{{\mathrm{indec}}^{\mathrm{nil}}_{\mathscr{O}}} & {\mathrm{coAlg}}_{B{\mathscr{O}}}^{{\mathrm{nil}}}({{\mathscr{D}}_{\mathds{Q}}}) \end{tikzcd}$$
by using $B^{\mathrm{O}} {\mathds{Q}}$ to exhibit $B{\mathrm{O}}$ as the
coendomorphism object of the monoidal unit ${\mathds{Q}}$ as in
[198](#lem:bar-via-endomorphism-objects){reference-type="ref+label"
reference="lem:bar-via-endomorphism-objects"}; this implies that
$B{\mathscr{O}}$ is the operad associated to $B{\mathrm{O}}$ and that
the chain-level operadic bar construction models nil-indecomposables.
Restricting to connected (co)algebras, we obtain:

::: proposition
**Proposition 202**. *There is a commutative square of equivalences
$$\begin{tikzcd} {\mathrm{Alg}}_{{\mathrm{O}}}({\mathrm{Ch}}_{\mathds{Q}})[W^{-1}]_{\geq 1} \rar{B^{\mathrm{O}}}[swap]{\simeq} \dar{\simeq} & {\mathrm{coAlg}}^{{\mathrm{nil}}}_{B{\mathrm{O}}}({\mathrm{Ch}}_{\mathds{Q}})[W^{-1}]_{\geq 1} \dar{\simeq} \\[-5pt]
        {\mathrm{Alg}}_{\mathscr{O}}({{\mathscr{D}}_{\mathds{Q}}})_{\geq 1} \rar{{\mathrm{indec}}^{\mathrm{nil}}_{\mathscr{O}}}[swap]{\simeq} & {\mathrm{coAlg}}_{B{\mathscr{O}}}^{{\mathrm{nil}}}({{\mathscr{D}}_{\mathds{Q}}})_{\geq 1} \end{tikzcd}$$
where the subscripts $(-)_{\geq 1}$ indicate we restrict to the full
subcategory where the underlying objects are connected.*
:::

Since the operadic cobar complex $\Omega^{B{\mathrm{O}}}$ is the right
Quillen adjoint to $B^{\mathrm{O}}$, it follows that on connected
coalgebras ${\mathrm{prim}}^{\mathrm{nil}}_{B{\mathscr{O}}}$ can be
computed using $\Omega^{B{\mathrm{O}}}$.

## $E_k$-algebraic foundations

In this last appendix we specialise the theory of (co)operads,
(co)algebras, and Koszul duality to the case of the $E_k$-operads. This
has some special features, most importantly using the Dunn--Lurie
additivity theorem.

### The $E_k$-operads

There are two variants of the $E_k$-operads for
$k = 1, 2,\ldots,\infty$, cf. [@GKRW18 Definition 12.1, 12.2]. Their
definition uses the notion of a rectilinear embedding between cubes,
which is a map $I^k \to I^k$ of the form
$$(x_1,\ldots,x_k) \longmapsto ((b_1-a_1)x_1+a_1,\ldots,(b_k-a_k)x_k+a_k)$$
for $0 \leq a_k < b_k \leq 1$.

::: {#def:ek .definition}
**Definition 203**. Let $1 \leq k < \infty$.

- The *unitary $E_k$-operad* $E_k^{\mathrm{u}}$ is obtained as the
  operadic nerve of the operad whose space of $r$-ary operations is
  given by the space
  $$E_k^{\mathrm{u}}(r) \coloneq {\mathrm{Emb}}^{\mathrm{rect}}(\sqcup_r I^k,I^k)$$
  of $r$-tuples of rectilinear embeddings whose images have disjoint
  interior and where operadic composition is induced by composition of
  rectilinear embeddings.

- The *nonunitary $E_k$-operad* $E_k^{\mathrm{nu}}$ is obtained by
  replacing the $0$-ary operations in $E_k^{\mathrm{u}}$, given by a
  single point, with the empty set.
:::

Note that $(-) \times {\mathrm{id}}_I$ induces maps of operads
$E_k^{\mathrm{u}} \to E_{k+1}^{\mathrm{u}}$ and
$E_k^{\mathrm{nu}} \to E_{k+1}^{\mathrm{nu}}$.

::: {#def:einfty .definition}
**Definition 204**. We define the *unitary $E_\infty$-operad* and
*nonunitary $E_\infty$-operad* as
$$E_\infty^{\mathrm{u}} \coloneq \underset{k \to \infty}{{\mathrm{colim}}}\,E_k^{\mathrm{u}} \qquad \text{and} \qquad E_\infty^{\mathrm{nu}} \coloneq \underset{k \to \infty}{{\mathrm{colim}}}\,E_k^{\mathrm{nu}}.$$
:::

### The case $k<\infty$

Passing to the category spectra by implicitly taking suspension spectra,
there are for $1 \leq k < \infty$ equivalences
$$\gamma_k \colon BE^{\mathrm{nu}}_k \overset{\simeq}\longrightarrow s^k DE^{\mathrm{nu}}_k,$$
in ${\mathrm{Coop}}({\mathscr{S}}{\mathrm{p}})$, where $s(-)$ is
(co)operadic suspension and $D(-)$ is objectwise Spanier--Whitehead
dual, see
[12.1.4](#sec:operadic-suspension-linear-duals){reference-type="ref+label"
reference="sec:operadic-suspension-linear-duals"}.

#### Koszul duality and bar-cobar duality {#subsection koszul bar cobar}

Combining additivity with bar-cobar duality for associative
(co)algebras, Lurie established bar-cobar duality for
$E_k$-(co)algebras. Suppose that ${\mathscr{C}}$ is a symmetric monoidal
category and define
$${\mathrm{Alg}}^{\mathrm{aug}}_{E_k^u}({\mathscr{C}}) \coloneq {\mathrm{Alg}}_{E_k^u}({\mathscr{C}})_{/1_{\mathscr{C}}} \quad \text{and} \quad {\mathrm{coAlg}}^{\mathrm{aug}}_{E_k^u}({\mathscr{C}}) \coloneq \left({\mathrm{Alg}}_{E_k^u}({\mathscr{C}}^{\mathrm{op}})_{/1_{\mathscr{C}}}\right)^{\mathrm{op}}.$$
Assuming ${\mathscr{C}}$ has geometric realisations and totalisations,
iterating bar-cobar duality as in [@LurieHA 5.2.3] yields an adjunction
$$\begin{tikzcd} {\mathrm{Alg}}^{\mathrm{aug}}_{E_k^u}({\mathscr{C}}) \arrow[shift left=2pt]{r}{{\mathrm{Bar}}^k} &[20pt] {\mathrm{coAlg}}^{\mathrm{aug}}_{E_k^u}({\mathscr{C}}) \arrow[shift left=2pt]{l}{{\mathrm{Cobar}}^k}.\end{tikzcd}$$
We remark that the existence of the functor ${\mathrm{Bar}}^k$ only
requires ${\mathscr{C}}$ has geometric realisations, and the existence
of the functor ${\mathrm{Cobar}}^k$ only requires it has totalisations.

::: {#exam:e1-coproduct .example}
*Example 205*. For $k=1$, for an augmented $E^{\mathrm{u}}_1$-algebra
$\epsilon \colon {\mathbf{A}} \to 1 = 1_{\mathscr{C}}$, we have
${\mathrm{Bar}}({\mathbf{A}}) \simeq 1 \otimes_{\mathbf{A}} 1$ [@LurieHA
5.2.2.3]. By [@LurieHA p. 826] the coproduct is given by
$$1 \otimes_{\mathbf{A}} 1 \simeq 1 \otimes_{\mathbf{A}}  {\mathbf{A}} \otimes_{\mathbf{A}} 1 \longrightarrow 1 \otimes_{\mathbf{A}} 1 \otimes_{\mathbf{A}} 1 \simeq (1 \otimes_{\mathbf{A}} 1) \otimes (1 \otimes_{\mathbf{A}} 1)$$
with map induced by $\epsilon$ on the middle term. Let us explain why
this is the case using
[198](#lem:bar-via-endomorphism-objects){reference-type="ref+label"
reference="lem:bar-via-endomorphism-objects"}. By [@BCN Proposition
3.34] the bar construction is the coendomorphism object of $1$,
considered as a right ${\mathbf{A}}$-module through $\epsilon$:
Recalling that
$\epsilon^* \colon {\mathscr{C}} \to {\mathrm{RMod}}_{\mathbf{A}}({\mathscr{C}})$
has a left adjoint $\epsilon_! \simeq (-) \otimes_{\mathbf{A}} 1$, the
unit map $\eta \colon {\mathrm{id}} \to \epsilon^* \epsilon_!$ induces a
map
$\rho \coloneq \eta \epsilon^* \colon \epsilon^* 1 \to \epsilon^*\epsilon_! \epsilon^* 1$
of right ${\mathbf{A}}$-modules and this has the property that the map
$${\mathrm{Map}}_{\mathscr{C}}({\mathrm{Bar}}({\mathbf{A}}),Y) \longrightarrow{\mathrm{Map}}_{{\mathrm{RMod}}_{\mathbf{A}}({\mathscr{C}})}(\epsilon^* {\mathrm{Bar}}({\mathbf{A}}),\epsilon^* Y) \longrightarrow{\mathrm{Map}}_{{\mathrm{RMod}}_{\mathbf{A}}({\mathscr{C}})}(\epsilon^* 1,\epsilon^* Y)$$
given by applying $\epsilon^*$ and precomposing with $\rho$, is an
equivalence. To get the coproduct from this universal property, consider
$Y = \epsilon_! \epsilon^* \epsilon_! \epsilon^* 1$ with the map of
right ${\mathbf{A}}$-modules
$$\epsilon^* 1 \xrightarrow{\rho} \epsilon^* \epsilon_! \epsilon^* 1 \xrightarrow{\epsilon^* \epsilon_! \rho} \epsilon^* \epsilon_! \epsilon^* \epsilon_! \epsilon^* 1$$
and recognise it arises under the above equivalence from the map
$\epsilon_! \eta \epsilon^* \colon \epsilon_! \epsilon^* 1 \to \epsilon_! \epsilon^* \epsilon_! \epsilon^* 1$.
Unwinding the definitions, this gives the desired coproduct.
:::

The relationship between these constructions and Koszul duality is due
to Heuts--Land [@HeutsLand]. Firstly, if ${\mathscr{C}}$ is a stable
presentable symmetric monoidal category ${\mathscr{C}}$,
[200](#prop:lurie-dp-comparison){reference-type="ref+label"
reference="prop:lurie-dp-comparison"} provides an identification
$${\mathrm{coAlg}}^{\mathrm{aug}}_{E_k^u}({\mathscr{C}}) \simeq {\mathrm{coAlg}}^{{\mathrm{dpw}},{\mathrm{aug}}}_{E_k^{\mathrm{u}}}({\mathscr{C}}).$$
In terms of this identification, the following improves on [@GKRW18
Theorem 13.7], which shows the diagram commutes after composing with the
forgetful functor
${\mathrm{coAlg}}_{s^{k} DE^{\mathrm{nu}}_k}({\mathscr{C}}) \to {\mathscr{C}}$:

::: {#thm:indec-is-bar .theorem}
**Theorem 206** (Heuts--Land). *If ${\mathscr{C}}$ is a stable
presentable symmetric monoidal category, then there is a commutative
square $$\begin{tikzcd}
    {\mathrm{Alg}}^{\mathrm{aug}}_{E^{\mathrm{u}}_k}({\mathscr{C}}) \rar{{\mathrm{indec}}_{E_k}(I(-))} \dar[swap]{\mathrm{Bar}^k(-)} &[20pt] {\mathrm{coAlg}}^{{\mathrm{dpw}}}_{BE^{\mathrm{nu}}_k}({\mathscr{C}}) \dar{\gamma^\vee_!}[swap]{\simeq} \\[-5pt]
    {\mathrm{coAlg}}^{\mathrm{aug}}_{E^{\mathrm{u}}_k}({\mathscr{C}}) \rar{\Sigma^{-k}I(-)}[swap]{\simeq} & {\mathrm{coAlg}}^{\mathrm{dpw}}_{s^{k} DE^{\mathrm{nu}}_k}({\mathscr{C}})\end{tikzcd}$$
where $I$ denotes the augmentatio ideal and $s$ the (co)operadic
suspension.*
:::

#### Iterating bar constructions {#sec:iterated-bar-constructions}

We will want to iterate bar constructions but to do so, we will need to
perform these constructions in categories of (co)algebras.

::: {#lem:bar-underlying .lemma}
**Lemma 207**. *Let ${\mathscr{C}}$ be a symmetric monoidal category
whose tensor product preserves sifted colimits in each entry and
${\mathscr{O}}$ be an operad in spaces.*

(i) *${\mathrm{Alg}}_{\mathscr{O}}({\mathscr{C}})$ admits the structure
    of symmetric monoidal category so that the forgetful functor
    ${\mathrm{fgt}}_{\mathscr{O}} \colon {\mathrm{Alg}}_{\mathscr{O}}({\mathscr{C}}) \to {\mathscr{C}}$
    is symmetric monoidal and creates sifted colimits.*

(ii) *${\mathrm{coAlg}}_{\mathscr{O}}({\mathscr{C}})$ admits the
     structure of symmetric monoidal category so that the forgetful
     functor
     ${\mathrm{fgt}}_{\mathscr{O}} \colon {\mathrm{coAlg}}_{\mathscr{O}}({\mathscr{C}}) \to {\mathscr{C}}$
     is symmetric monoidal and creates colimits.*
:::

::: proof
*Proof.* The first part uses [@LurieHA 3.2.4.4] and [@LurieHA 3.2.3.2],
using that sifted colimits are created by the forgetful functor. For the
second part, write
${\mathrm{coAlg}}_{\mathscr{O}}({\mathscr{C}})^{\mathrm{op}}= {\mathrm{Alg}}_{{\mathscr{O}}}({\mathscr{C}}^{\mathrm{op}})$,
and use [@LurieHA 3.2.4.4] and [@LurieHA 3.2.2.5]. ◻
:::

::: remark
*Remark 208*. The underlying category of
${\mathrm{Alg}}_{\mathscr{O}}({\mathscr{C}})$ is in fact presentable if
${\mathscr{C}}$ is presentable symmetric monoidal [@LurieHA 3.2.3.5].
:::

We want to combine bar-cobar duality with the additivity theorem
$$E^u_{k+k'} \simeq E^u_k \otimes_{{\mathrm{BV}}} E^u_{k'}$$ writing the
left side as a tensor product of operads [@LurieHA 5.1.2.2]. Using the
adjunction $-\otimes E^u_k \dashv {\mathrm{Alg}}_{E^u_k}(-)$ that is the
defining property of this tensor product, we get equivalences
$$\begin{equation}
\label{eqn:additivity-algebras}{\mathrm{Alg}}_{E^u_{k+k'}}({\mathscr{C}}) \simeq {\mathrm{Alg}}_{E^u_k \otimes_{\mathrm{BV}} E^u_{k'}}({\mathscr{C}}) \simeq {\mathrm{Alg}}_{E^u_k}({\mathrm{Alg}}_{E^u_{k'}}({\mathscr{C}})).
\end{equation}$$

::: {#prop:hopf-algebra-ek-indecomposables .proposition}
**Proposition 209**. *Suppose ${\mathscr{C}}$ is a presentable stable
symmetric monoidal category. If ${\mathbf{R}}^+$ is an augmented
$E^{\mathrm{u}}_{k+k'}$-algebra in ${\mathscr{C}}$ with augmentation
ideal ${\mathbf{R}}$, then*

(i) *$(\Sigma^k {\mathrm{indec}}_{E^{\mathrm{nu}}_k}({\mathbf{R}}))^+$
    lifts to an augmented $E^{\mathrm{u}}_k$-coalgebra in augmented
    $E^{\mathrm{u}}_{k'}$-algebras, and*

(ii) *the same is true for
     $\Sigma^k {\mathrm{indec}}^{\mathrm{nil}}_{E^{\mathrm{nu}}_k}({\mathbf{R}})^+$
     as long as ${\mathbf{R}}$ is connected.*
:::

::: proof
*Proof.* For now it suffices that ${\mathscr{C}}$ is a presentable
symmetric monoidal category. Slicing over and under $1_{\mathscr{C}}$ in
[\[eqn:additivity-algebras\]](#eqn:additivity-algebras){reference-type="eqref"
reference="eqn:additivity-algebras"} gives
$${\mathrm{Alg}}^{\mathrm{aug}}_{E^u_{k+k'}}({\mathscr{C}}) \simeq {\mathrm{Alg}}^{\mathrm{aug}}_{E^u_k}({\mathrm{Alg}}^{\mathrm{aug}}_{E^u_{k'}}({\mathscr{C}})),$$
where the outer $(-)^{\mathrm{aug}}$ on the right side is tautological
since the monoidal unit is terminal. Now we apply iterated bar
construction to get the top map in the commutative diagram [@LurieHA
5.2.3.12]
$$\begin{tikzcd}  {\mathrm{Alg}}^{\mathrm{aug}}_{E^u_k}({\mathrm{Alg}}^{\mathrm{aug}}_{E^u_{k'}}({\mathscr{D}})) \dar[swap]{({\mathrm{fgt}}_{E^u_{k'}})_!} \rar{\mathrm{Bar}^k} &  {\mathrm{coAlg}}^{\mathrm{aug}}_{E^u_k}({\mathrm{Alg}}^{\mathrm{aug}}_{E^u_{k'}}({\mathscr{D}})) \dar{({\mathrm{fgt}}_{E^u_{k'}})_!} \\[-5pt]
{\mathrm{Alg}}^{\mathrm{aug}}_{E^u_k}({\mathscr{D}}) \rar{\mathrm{Bar}^k} &  {\mathrm{coAlg}}^{\mathrm{aug}}_{E^u_k}({\mathscr{D}}) \end{tikzcd}$$
where the vertical maps are induced by the forgetful functor, which is
symmetric monoidal and creates sifted colimits.

Specialising a stable presentable symmetric monoidal category
${\mathscr{C}}$ then we apply
[206](#thm:indec-is-bar){reference-type="ref+label"
reference="thm:indec-is-bar"} to identify the $E_k$-coalgebra
$\Sigma^k {\mathrm{indec}}_{E_k} {\mathbf{R}}$ with
${\mathrm{Bar}}^k {\mathbf{R}}$, and the fact that it is in the image of
the right vertical map provides the desired lift. ◻
:::

::: {#lem:bialgebra-structure .lemma}
**Lemma 210**. *Suppose that ${\mathbf{R}}^+$ is an augmented
$E^{\mathrm{u}}_{k+k'}$-algebra in
${\mathrm{Fun}}({\mathscr{C}},{{\mathscr{D}}_{\mathds{Q}}})$ for
$k,k' \geq 1$ with augmentation ideal ${\mathbf{R}}$. Then
$H_{*,*}((\Sigma^k {\mathrm{indec}}_{E^{\mathrm{nu}}_k} {\mathbf{R}})^+)$
admits the structure of a bigraded bialgebra which is:*

(i) *cocommutative if $k \geq 2$,*

(ii) *commutative if $k' \geq 2$,*

(iii) *has connected augmentation ideal if ${\mathbf{R}}$ is connected.*
:::

::: proof
*Proof.* Applying
[209](#prop:hopf-algebra-ek-indecomposables){reference-type="ref+label"
reference="prop:hopf-algebra-ek-indecomposables"} to
${\mathscr{C}} = {\mathrm{Fun}}({\mathds{N}},{{\mathscr{D}}_{\mathds{Q}}})$
we get a lift of
$(\Sigma^k {\mathrm{indec}}_{E_k^{\mathrm{nu}}}({\mathbf{R}}))^+$ to an
object of
$${\mathrm{coAlg}}^{\mathrm{aug}}_{E_k^{\mathrm{u}}}({\mathrm{Alg}}^{\mathrm{aug}}_{{\mathrm{E}}_{k'}^{\mathrm{u}}}({\mathrm{Fun}}({\mathds{N}},{{\mathscr{D}}_{\mathds{Q}}}))).$$
First supposing $k=1=k'$, we use that taking homology with rational
coefficients is symmetric monoidal and
$H_*(E_1^{\mathrm{u}}) \cong {\mathrm{As}}^{\mathrm{u}}$ to obtain a
functor
$${\mathrm{coAlg}}^{\mathrm{aug}}_{E_k^{\mathrm{u}}}({\mathrm{Alg}}^{\mathrm{aug}}_{{\mathrm{E}}_{k'}^{\mathrm{u}}}({\mathrm{Fun}}({\mathds{N}},{{\mathscr{D}}_{\mathds{Q}}}))) \longrightarrow{\mathrm{coAlg}}^{\mathrm{aug}}_{{\mathrm{coAssoc}}}({\mathrm{Alg}}^{\mathrm{aug}}_{{\mathrm{Assoc}}}({\mathrm{Fun}}({\mathds{N}},{\mathrm{GrMod}}_{\mathds{Q}}))),$$
and the target is the category of bigraded bialgebras. To prove (i) we
rather restrict along the map
${\mathrm{Com}} \to H_*(E_k^{\mathrm{u}}) \cong {\mathrm{Pois}}_{k-1}$,
and similarly for (ii). Part (iii) follows by iterated bar spectral
sequences. ◻
:::

### The case $k=1$, rationally {#sec:ass-algebras}

There is an equivalence of cooperads
$$\gamma_1 \colon BE_1^{\mathrm{nu}} \overset{\simeq}\longrightarrow s DE_1^{\mathrm{nu}}.$$
Upon passing to rational chains, we get that the $E_1$-operad is
equivalent to the classical associative operad: there are equivalences
$${\mathrm{As}}^{\mathrm{u}} \overset{\simeq}\longrightarrow E_1^{\mathrm{u}} \qquad \text{and} \qquad {\mathrm{As}}^{\mathrm{nu}} \overset{\simeq}\longrightarrow E_1^{\mathrm{nu}}.$$
Moreover, $\gamma_1$ has an inverse given by the Koszul duality
equivalence
$$s\,{\mathrm{coAs}}^{\mathrm{nu}} \overset{\simeq}\longrightarrow B{\mathrm{As}}^{\mathrm{nu}} \simeq BE_1^{\mathrm{nu}}$$
of [@LodayVallette Section 9.3], where ${\mathrm{coAs}}^{\mathrm{nu}}$
is the linear dual of ${\mathrm{As}}^{\mathrm{nu}}$.

We will now explain how, through the rectification results of
[12.4](#sec:rect-dg){reference-type="ref+label"
reference="sec:rect-dg"}, we can perform Koszul duality computations for
associative algebras using explicit chain complexes. More precisely, we
work in the model category
${\mathrm{C}} = {\mathrm{Fun}}({\mathrm{A}},{\mathrm{Ch}}_{\mathds{Q}})$
of functors from a symmetric monoidal 1-category ${\mathrm{A}}$ to
rational chain complexes, with associated $\infty$-category
${\mathscr{C}}$ equivalent to
${\mathrm{Fun}}({\mathrm{A}},{{\mathscr{D}}_{\mathds{Q}}})$.

We start with an explicit implementation of the indecomposables functor
via bar complexes when we restrict to connected algebras:
[12.4](#sec:rect-dg){reference-type="ref+label" reference="sec:rect-dg"}
then provides a commutative diagram of equivalences (recall our
convention to drop the superscript ${\mathrm{dpw}}$ in rational
settings)
$$\begin{tikzcd} {\mathrm{Alg}}_{{\mathrm{As}}^{\mathrm{nu}}}({\mathrm{C}})[W^{-1}]_{\geq 1} \rar{B^{\mathrm{As}}}[swap]{\simeq} \dar{\simeq} & {\mathrm{coAlg}}^{{\mathrm{nil}}}_{B{\mathrm{As}}^{\mathrm{nu}}}({\mathrm{C}})[W^{-1}]_{\geq 1} \dar{\simeq} & {\mathrm{coAlg}}^{{\mathrm{nil}}}_{s{\mathrm{coAs}}^{\mathrm{nu}}}({\mathrm{C}})[W^{-1}]_{\geq 1} \lar[swap]{\simeq} \dar{\simeq}\\
        {\mathrm{Alg}}_{E^{\mathrm{nu}}_1}({\mathscr{C}})_{\geq 1} \rar{{\mathrm{indec}}^{\mathrm{nil}}_{E^{\mathrm{nu}}_1}}[swap]{\simeq} & {\mathrm{coAlg}}_{BE^{\mathrm{nu}}_1}^{{\mathrm{nil}}}({\mathscr{C}})_{\geq 1} \rar & \lar[swap]{\simeq} {\mathrm{coAlg}}_{sDE^{\mathrm{nu}}_1}^{{\mathrm{nil}}}({\mathscr{C}})_{\geq 1}. \end{tikzcd}$$
By the identification of the operadic bar construction for a Koszul
operad in terms of a twisting morphism [@LodayVallette Section 11.2],
under the top-right equivalence the map $B^{\mathrm{As}}$ corresponds to
the following classical bar construction [@LodayVallette Section 2.2.1],
which we will denote the same:

::: {#def:bar-as .definition}
**Definition 211**. For a nonunital dg-algebra
${\mathbf{A}} \in {\mathrm{Alg}}_{\mathrm{As^{nu}}}({\mathrm{Fun}}({\mathrm{A}},{\mathrm{Ch}}_{\mathds{Q}}))$
we define a shifted dg-coalgebra
$$B^{\mathrm{As}}({\mathbf{A}}) \coloneq \Sigma^{-1}({\mathrm{coAs}}^{\mathrm{nu}} \circ \Sigma,d_{\mathbf{A}}+d_B) \in {\mathrm{coAlg}}^{\mathrm{nil}}_{s\,{\mathrm{coAs}}^{\mathrm{nu}}}{\mathrm{Fun}}({\mathrm{A}},{\mathrm{Ch}}_{\mathds{Q}})$$
where $d_{\mathbf{A}}$ is the unique graded coderivation induced by the
differential $d \colon {\mathbf{A}} \to \Sigma {\mathbf{A}}$ of
${\mathbf{A}}$ and $d_B$ is the unique graded coderivation induced by
the shifted multiplication map
$$\Sigma {\mathbf{A}} \otimes \Sigma {\mathbf{A}} \cong \Sigma^2({\mathbf{A}}^{\otimes 2}) \xrightarrow{\Sigma^2 m} \Sigma^2 {\mathbf{A}}.$$
:::

We refer to $d_{\mathbf{A}}$ as the *internal differential* and $d_B$ as
the *bar differential*. Observe that $B^{\mathrm{As}}({\mathbf{A}})$ is,
up to a suspension, the graded conilpotent tensor coalgebra
$T^c(\Sigma {\mathbf{A}}) \cong \bigoplus_{n \geq 1} (\Sigma {\mathbf{A}})^{\otimes n}$
with differentials for
${\overline{a}}_0,\ldots,{\overline{a}}_p \in \Sigma {\mathbf{A}}$
(where we abbreviate ${\overline{a}} \coloneq sa$) given by
$$d_{\mathbf{A}}({\overline{a}}_0 \otimes \cdots \otimes {\overline{a}}_p) = \sum_{i=0}^p (-1)^{|{\overline{a}}_0|+\cdots+|{\overline{a}}_{i-1}|} {\overline{a}}_0 \otimes \cdots \otimes {\overline{d(a_i)}} \otimes \cdots {\overline{a}}_p,$$
$$d_B({\overline{a}}_0 \otimes \cdots \otimes {\overline{a}}_p) = \sum_{i=0}^{p-1} (-1)^{|{\overline{a}}_0|+\cdots+|{\overline{a}}_{i-1}|}{\overline{a}}_0 \otimes \cdots \otimes {\overline{a_ia_{i+1}}} \otimes \cdots \otimes {\overline{a}}_p$$
and coproduct given by *deconcatenation coproduct*, whose reduced
version is
$$\overline{\Delta}({\overline{a}}_0 \otimes \cdots \otimes {\overline{a}}_p) = \sum_{i=1}^{p} ({\overline{a}}_0 \otimes \cdots \otimes {\overline{a}}_{i-1}) \otimes ({\overline{a}}_i \otimes \cdots \otimes {\overline{a}}_p).$$

If ${\mathbf{A}}$ is commutative there is a graded-commutative product
$$B^{\mathrm{As}}({\mathbf{A}}) \otimes B^{\mathrm{As}}({\mathbf{A}}) \xrightarrow{{\mathrm{EZ}}} B^{\mathrm{As}}({\mathbf{A}} \otimes {\mathbf{A}}) \longrightarrow B^{\mathrm{As}}({\mathbf{A}})$$
where the left map is the Eilenberg--Zilber equivalence and the right
map is induced by the multiplication
$m \colon {\mathbf{A}} \otimes {\mathbf{A}} \to {\mathbf{A}}$, which is
a map of associative algebras [@LodayCyclic 4.2.6]. This yields the
*shuffle product* formula $$\begin{align*}
&\mu\big(({\overline{a}}_1 \otimes \cdots \otimes {\overline{a}}_p) \otimes ({\overline{a}}_{p+1} \otimes \cdots \otimes {\overline{a}}_{p+q}))\big) \\
&\qquad = \sum_{\sigma \in {\mathrm{sh}}_{p,q}} (-1)^{\sigma(a)} sa_{\sigma(1)} \otimes \cdots \otimes {\overline{a}}_{\sigma(p)} \otimes {\overline{a}}_{\sigma(p+1)} \otimes \cdots \otimes {\overline{a}}_{\sigma(p+q)}
\end{align*}$$ where the sign $(-1)^{\sigma(a)}$ the product of
$(-1)^{|{\overline{a}}_{i}||{\overline{a}}_{j}|}$ for all
$1 \leq i \leq p$ and $p+1 \leq j \leq p+q$ so that
$\sigma(q)<\sigma(p)$.

If ${\mathbf{A}}$ is connected in addition to being commutative, then by
[209](#prop:hopf-algebra-ek-indecomposables){reference-type="ref+label"
reference="prop:hopf-algebra-ek-indecomposables"} the counital
$E_1$-coalgebra
$$B^{\mathrm{As}}({\mathbf{A}})^+ \simeq (\Sigma\, {\mathrm{indec}}^{\mathrm{nil}}_{E^{\mathrm{nu}}_1}({\mathbf{A}}))^+ \simeq {\mathrm{Bar}}({\mathbf{A}})$$
lifts to
$\smash{{\mathrm{coAlg}}_{E_1^{\mathrm{u}}}({\mathrm{Alg}}_{E_\infty^{\mathrm{u}}}({\mathscr{C}}))}$.
By the construction of the pairing underlying the additivity theorem in
[@LurieHA 5.1.2.1], the underlying multiplication on the bar
construction is given by
$${\mathrm{Bar}}({\mathbf{A}}) \otimes {\mathrm{Bar}}({\mathbf{A}}) \overset{\simeq}\longrightarrow{\mathrm{Bar}}({\mathbf{A}} \otimes {\mathbf{A}}) \longrightarrow{\mathrm{Bar}}({\mathbf{A}})$$
where the left map uses that geometric realisations are sifted colimits
and that the tensor product commutes with colimits in each entry and the
right map is induced by the multiplication map
$m \colon {\mathbf{A}} \otimes {\mathbf{A}} \to {\mathbf{A}}$. To see it
agrees with the shuffle product, recall that the Eilenberg--Zilber map
intertwines the diagonal of the tensor product of simplicial vector
spaces and the tensor product of chain complexes.

The right adjoint of the bar construction is $B^{\mathrm{As}}$ is the
cobar construction $\Omega^{\mathrm{coAs}}$ [@LodayVallette Section
2.2.5].

::: {#def:cobar-as .definition}
**Definition 212**. For a nonunital coassociative dg-coalgebra
${\mathbf{C}} \in {\mathrm{Alg}}_{{\mathrm{coAs}}^{\mathrm{nu}}}({\mathrm{Fun}}({\mathrm{A}},{\mathrm{Ch}}_{\mathds{Q}}))$
we define the *coassociative cobar construction* as the shifted
nonunital associative dg-algebra
$$\Omega^{\mathrm{coAs}}({\mathbf{C}}) \coloneq \Sigma({\mathrm{As}}^{\mathrm{nu}} \circ \Sigma^{-1} {\mathbf{C}},d_{\mathbf{C}}+d_\Omega)$$
where $d_{\mathbf{C}}$ is the unique graded derivation induced by the
differential ${\mathbf{C}} \to \Sigma {\mathbf{C}}$ of $L$ and
$d_\Omega$ is the unique graded derivation induced by the shifted
coproduct
$$\Sigma^{-1} {\mathbf{C}} \xrightarrow{\Sigma^{-1} \Delta} \Sigma^{-1} ({\mathbf{C}} \otimes {\mathbf{C}}) \cong \Sigma({\mathrm{As}}(2) \otimes_{\mathfrak{S}_2} (\Sigma^{-1} {\mathbf{C}})^{\otimes 2}).$$
:::

We refer to $d_{\mathbf{C}}$ as the *internal differential* and
$d_\Omega$ as the *cobar differential*.

::: remark
*Remark 213*. It is occasionally more convenient to use a variant that
is an augmented unital dg-associative algebra, by using
${\mathrm{As}}^{u}$ instead of ${\mathrm{As}}^{\mathrm{nu}}$ and with
augmentation induced by the one of ${\mathrm{As}}^{\mathrm{u}}$.
:::

That is, $\Omega^{\mathrm{coAs}}({\mathbf{C}})$ is, up to a
desuspension, given by the graded tensor product
$T({\mathbf{C}}) = \bigoplus_{n \geq 1} (\Sigma^{-1} {\mathbf{C}})^{\otimes n}$
with differentials for
${\underline{c}}_0,\ldots,{\underline{c}}_p \in \Sigma^{-1} {\mathbf{C}}$
(where we abbreviate ${\underline{c}} = s^{-1}c$)
$$d_{\mathbf{C}}({\underline{c}}_0 \otimes \cdots \otimes {\underline{c}}_p) = \sum_{i=0}^p (-1)^{|{\underline{c}}_0|+\cdots+|{\underline{c}}_{i-1}|} {\underline{c}}_0 \otimes \cdots \otimes {\underline{d(c_i)}} \otimes \cdots \otimes {\underline{c}}_p,$$
$$d_\Omega({\underline{c}}_0 \otimes \cdots \otimes {\underline{c}}_p) = \sum_{i=0}^p (-1)^{|{\underline{c}}_0|+\cdots+|{\underline{c}}_{i-1}|} {\underline{c}}_0 \otimes \cdots \otimes {\underline{\Delta(c_i)}} \otimes \cdots \otimes {\underline{c}}_p.$$

Koszul duality takes the following concrete form, in terms of the unit
and counit of the classical adjunctions between the bar and cobar
constructions [@LodayVallette Corollary 2.3.4]: given a connected
dg-associative algebra ${\mathbf{A}}$ and connected dg-associative
coalgebras there are quasi-isomorphisms
$$\epsilon \colon \Omega^{\mathrm{coAs}} B^{\mathrm{As}} {\mathbf{A}} \overset{\simeq}\longrightarrow{\mathbf{A}} \qquad \text{and} \qquad \eta \colon {\mathbf{C}} \overset{\simeq}\longrightarrow B^{\mathrm{As}} \Omega^{\mathrm{coAs}} {\mathbf{C}}.$$
These have inverses on the level of chain complexes, *not* compatible
with (co)algebra structures, given by the inclusion of or projection
onto certain terms.

### The case $k=\infty$, rationally {#sec:comm-colie-algebras}

For $k=\infty$, we rather have
$$\gamma_\infty \colon BE^{\mathrm{nu}}_\infty \overset{\simeq}\longrightarrow D{\mathrm{Lie}}_{\mathrm{Sp}} \coloneq \mathop{\mathrm{colim}}_{k \to \infty} s^k DE^{\mathrm{nu}}_k,$$
where the map
$s^k DE^{\mathrm{nu}}_k \to s^{k+1} DE^{\mathrm{nu}}_{k+1}$ arises a
priori through Koszul duality, but is explicitly described in
[@ChingSalvatore Section 7]. Its target is the Spanier--Whitehead dual
of the spectral Lie operad, by definition of the latter. This is named
such because, upon passing to rational chains, $\gamma_\infty$ has an
inverse given by the classical Koszul duality equivalence
$s\, {\mathrm{coLie}} \smash{\overset{\simeq}\longrightarrow} B {\mathrm{Com}}^{\mathrm{nu}}$
of [@LodayVallette Section 13.1.5].

We will now explain how, as in the associative case, the rectification
results of [12.4](#sec:rect-dg){reference-type="ref+label"
reference="sec:rect-dg"} allow us to perform Koszul duality computations
using explicit chain complexes. Once more, we work in the model category
${\mathrm{C}} = {\mathrm{Fun}}(A,{\mathrm{Ch}}_{\mathds{Q}})$ of
functors from a symmetric monoidal $1$-category ${\mathrm{A}}$ to
rational chain complexes, with associated $\infty$-category
${\mathscr{C}}$. Then there are explicit implementations of the
indecomposables functor
${\mathrm{indec}}^{\mathrm{nil}}_{E^{\mathrm{nu}}_\infty}$ via (co)bar
complexes when we restrict to connected (co)algebras: we get a
commutative diagram of equivalences
$$\begin{tikzcd} {\mathrm{Alg}}_{{\mathrm{Com}}^{\mathrm{nu}}}({\mathrm{C}})[W^{-1}]_{\geq 1} \rar{B^{\mathrm{Com}}}[swap]{\simeq} \dar{\simeq} & {\mathrm{coAlg}}^{{\mathrm{nil}}}_{B{\mathrm{Com}}^{\mathrm{nu}}}({\mathrm{C}})[W^{-1}]_{\geq 1} \dar{\simeq} & {\mathrm{coAlg}}^{{\mathrm{nil}}}_{s{\mathrm{coLie}}}({\mathrm{C}})[W^{-1}]_{\geq 1} \lar[swap]{\simeq} \dar{\simeq}\\
        {\mathrm{Alg}}_{E_\infty^{\mathrm{nu}}}({\mathscr{C}})_{\geq 1} \rar{{\mathrm{indec}}^{\mathrm{nil}}_{\mathscr{O}}}[swap]{\simeq} & {\mathrm{coAlg}}_{BE^{\mathrm{nu}}_\infty}^{{\mathrm{nil}}}({\mathscr{C}})_{\geq 1} \rar & \lar[swap]{\simeq} {\mathrm{coAlg}}_{sDE^{\mathrm{nu}}_\infty}^{{\mathrm{nil}}}({\mathscr{C}})_{\geq 1}.\end{tikzcd}$$
The top-right corner is given by objects that are, up to a suspension,
given by conilpotent dg-Lie coalgebras ${\mathbf{L}}$: explicitly, this
is an object ${\mathbf{L}} \in {\mathrm{C}}$ with a map
$${\mathbf{L}} \longrightarrow{\mathrm{{\mathrm{coLie}}}}\circ {\mathbf{L}} = \bigoplus_{n \geq 1} ({\mathrm{{\mathrm{coLie}}}}(n) \otimes {\mathbf{L}}^{\otimes n})_{\mathfrak{S}_n},$$
satisfying counitality and coassociativity axioms.

::: remark
*Remark 214*. A conilpotent dg-Lie coalgebra is an instance of a more
classical notion of dg-Lie coalgebra used in
[@Michaelis; @LodayVallette; @CharltonRadchenkoRudenko]. In these
references, it is given rather by an object
${\mathbf{L}}' \in {\mathrm{C}}$ with a map
$$\delta \colon {\mathbf{L}}' \longrightarrow{\mathbf{L}}' \otimes {\mathbf{L}}'$$
satisfying $\tau \circ \delta = - \delta$ and
$(1+\eta+\eta^2) \circ (1 \otimes \delta) \circ \delta$ where
$\tau \colon {\mathbf{L}}' \otimes {\mathbf{L}}' \to {\mathbf{L}}' \otimes {\mathbf{L}}'$
is induced by the transposition $(1\,2)$ and
$\eta \colon {\mathbf{L}}' \otimes {\mathbf{L}}' \otimes {\mathbf{L}}' \to {\mathbf{L}} \otimes {\mathbf{L}}' \otimes {\mathbf{L}}'$
is induced by the 3-cycle $(2\,3\,1)$. Using norm map isomorphism
$({\mathrm{{\mathrm{coLie}}}}(n) \otimes ({\mathbf{L}}')^{\otimes n})_{\mathfrak{S}_n} \to ({\mathrm{{\mathrm{coLie}}}}(n) \otimes ({\mathbf{L}}')^{\otimes n})^{\mathfrak{S}_n}$
identifying quotients with subobjects, conilpotent dg-Lie coalgebras can
be identified the subcategory of those classical dg-Lie coalgebra so
that $\delta$ is conilpotent.
:::

By the identification of the operadic bar construction for a Koszul
operad in terms of a twisting morphism, under the top-right equivalence
the map $B^{\mathrm{Com}}$ corresponds up to a shift to the classical
*Harrison homology complex* [@LodayVallette Section 13.1.10]:

::: {#def:bar-comm .definition}
**Definition 215**. For a nonunital dg-commutative algebra we define the
*commutative bar construction* as the shifted conilpotent dg-Lie
coalgebra
$$B^{\mathrm{Com}}({\mathbf{A}}) \coloneq \Sigma^{-1}({\mathrm{{\mathrm{coLie}}}}\circ \Sigma {\mathbf{A}},d_{\mathbf{A}}+d_B)$$
where $d_{\mathbf{A}}$ is the unique graded coderivation induced by the
differential $d \colon {\mathbf{A}} \to \Sigma {\mathbf{A}}$ of
${\mathbf{A}}$ and $d_B$ is the unique graded coderivation induced by
the shifted product
$${\mathrm{{\mathrm{coLie}}}}(2) \otimes_{S_2} (\Sigma {\mathbf{A}}) \cong \Sigma^2 S^2({\mathbf{A}}) \xrightarrow{\Sigma^2 m} \Sigma^2 {\mathbf{A}}.$$
:::

We refer to $d_{\mathbf{A}}$ as the *internal differential* and $d_B$ as
the *bar differential*. Its right adjoint
$\Omega^{\mathrm{{\mathrm{coLie}}}}$ models on connected Lie coalgebras
the functor
${\mathrm{prim}}_{sB{\mathrm{Com}}^{\mathrm{nu}}}^{\mathrm{nil}}$ and
corresponds to the classical *Chevalley--Eilenberg complex*, dual to the
one for Lie algebras [@LodayVallette 13.2.8]:

::: {#def:cobar-colie .definition}
**Definition 216**. For a dg-Lie coalgebra ${\mathbf{L}}$ we define the
*coLie cobar construction* as the shifted nonunital dg-commutative
algebra
$$\Omega^{\mathrm{{\mathrm{coLie}}}}({\mathbf{L}}) \coloneq \Sigma({\mathrm{Com}}^{\mathrm{nu}} \circ \Sigma^{-1} {\mathbf{L}},d_{\mathbf{L}}+d_\Omega)$$
where $d_{\mathbf{L}}$ is the unique graded derivation induced by the
differential $d \colon {\mathbf{L}} \to \Sigma {\mathbf{L}}$ of
${\mathbf{L}}$, and $d_\Omega$ is the unique graded derivation induced
by the shifted cobracket
$$\Sigma^{-1}{\mathbf{L}} \xrightarrow{\Sigma^{-1}\delta} \Sigma^{-1} \Lambda^2 {\mathbf{L}} \cong \Sigma {\mathrm{Com}}(2) \otimes_{S_2} (\Sigma^{-1} {\mathbf{L}})^{\otimes 2}.$$
:::

We refer to $d_{\mathbf{L}}$ as the *internal differential* and
$d_\Omega$ as the *cobar differential*. Explicitly, we have for
${\underline{x}}_0,\ldots,{\underline{x}}_p \in \Sigma^{-1} {\mathbf{L}}$
(where we abbreviate ${\underline{x}} = s^{-1} x$) that
$$d_{\mathbf{L}}({\underline{x}}_0 \wedge \ldots \wedge {\underline{x}}_p) = \sum_{i=0}^p (-1)^{|{\underline{x}}_0|+\cdots+|{\underline{x}}_{i-1}|} {\underline{x}}_0 \wedge \cdots \wedge {\underline{d(x_i)}} \wedge \cdots \wedge {\underline{x}}_p,$$
$$d_\Omega({\underline{x}}_0 \wedge \ldots \wedge {\underline{x}}_p) = \sum_{i=0}^p (-1)^{|{\underline{x}}_0|+\cdots+|{\underline{x}}_{i-1}|} {\underline{x}}_0 \wedge \cdots \wedge {\underline{\delta(x_i)}} \wedge \cdots \wedge {\underline{x}}_p.$$

::: remark
*Remark 217*. Again it is occasionally more convenient to use a variant
that is an augmented unital dg-commutative algebra by using
${\mathrm{Com}}^{u}$ instead of ${\mathrm{Com}}^{\mathrm{nu}}$ and with
augmentation induced by the one of ${\mathrm{Com}}^{\mathrm{u}}$.
:::

Koszul duality once more takes a concrete form, in terms of the unit and
counit of the classical adjunctions between the bar and cobar
constructions [@LodayVallette Theorems 11.3.6, 11.3.7]: given a
connected dg-commutative algebra ${\mathbf{A}}$ and connected dg-Lie
coalgebra ${\mathbf{L}}$ there are quasi-isomorphisms
$$\epsilon \colon \Omega^{\mathrm{coLie}} B^{\mathrm{Com}} {\mathbf{A}} \overset{\simeq}\longrightarrow{\mathbf{A}} \qquad \text{and} \qquad \eta \colon {\mathbf{L}} \overset{\simeq}\longrightarrow B^{\mathrm{Com}} \Omega^{\mathrm{coLie}} {\mathbf{L}},$$
and we will use for an explicit formula for $\eta$ from [@Souderes
Section 2.4]. These have inverses on the level of chain complexes, *not*
compatible with (co)algebra structures, given by the inclusion of or
projection onto certain terms.

#### Barr's splitting

One particularly useful feature of these concrete models is that they
yield a splitting result, originally due to Barr [@Barr1968HarrisonHH].
For an $E_\infty^{\mathrm{nu}}$-algebra ${\mathbf{A}}$, we let
$$\begin{align*}
p_1 \colon  {\mathrm{fgt}}_{E^{\mathrm{nu}}_1}({\mathbf{A}}) &\longrightarrow{\mathrm{cot}}_{E^{\mathrm{nu}}_1}({\mathbf{A}}) \\
p_\infty \colon {\mathrm{fgt}}_{E^{\mathrm{nu}}_\infty}({\mathbf{A}}) &\longrightarrow{\mathrm{cot}}_{E^{\mathrm{nu}}_\infty}({\mathbf{A}}) \\
\pi_{\mathbf{A}} \colon {\mathrm{cot}}_{E^{\mathrm{nu}}_1}({\mathbf{A}}) &\longrightarrow{\mathrm{cot}}_{E^{\mathrm{nu}}_\infty}({\mathbf{A}})
\end{align*}$$ denote the canonical maps, induced by the maps of operads
$E^{\mathrm{nu}}_0 \to E^{\mathrm{nu}}_1$,
$E^{\mathrm{nu}}_0 \to E^{\mathrm{nu}}_\infty$, and
$E^{\mathrm{nu}}_1 \to E^{\mathrm{nu}}_\infty$. We will once more assume
that ${\mathscr{C}}$ is obtained from the model category
${\mathrm{C}} = {\mathrm{Fun}}({\mathrm{A}},{\mathrm{Ch}}_{\mathds{Q}})$
by inverting weak equivalences.

::: {#prop:barr-splitting .proposition}
**Proposition 218** (Barr). *Let
${\mathbf{A}} \in {\mathrm{Alg}}_{E^{\mathrm{nu}}_\infty}({\mathscr{C}})_{\geq 1}$,
then the map
$\pi_{\mathbf{A}} \colon {\mathrm{cot}}_{E^{\mathrm{nu}}_1}({\mathbf{A}}) \to {\mathrm{cot}}_{E^{\mathrm{nu}}_\infty}({\mathbf{A}})$
admits a natural splitting
$s_{\mathbf{A}} \colon {\mathrm{cot}}_{E^{\mathrm{nu}}_\infty}({\mathbf{A}}) \to {\mathrm{cot}}_{E^{\mathrm{nu}}_1}({\mathbf{A}})$
fitting in a commutative diagram
$$\begin{tikzcd} {\mathrm{fgt}}_{E_\infty}({\mathbf{A}}) \dar[swap]{p_\infty} \arrow{rd}{p_1} & \\
    {\mathrm{cot}}_{E^{\mathrm{nu}}_\infty}({\mathbf{A}}) \rar[swap]{s_{\mathbf{A}}} & {\mathrm{cot}}_{E^{\mathrm{nu}}_1}({\mathbf{A}}).\end{tikzcd}$$*
:::

::: proof
*Proof.* By the rectification results of
[12.4](#sec:rect-dg){reference-type="ref+label"
reference="sec:rect-dg"}, we can assume that
${\mathbf{A}} \in {\mathrm{Alg}}_{\mathrm{Com}}({\mathscr{C}})$ is a
graded dg-commutative algebra in ${\mathrm{C}}$ whose underlying object
is connected. By the above,
${\mathrm{cot}}_{E^{\mathrm{nu}}_1}({\mathbf{A}})$ and
${\mathrm{cot}}_{E^{\mathrm{nu}}_\infty}({\mathbf{A}})$ may be computed
as $$\begin{align*}
B^{\mathrm{As}}({\mathbf{A}}) &\coloneq \Sigma^{-1} ({\mathrm{coAs}}^{\mathrm{nu}} \circ \Sigma, d_{\mathbf{A}}+ d_B) \\ 
    B^{\mathrm{Com}}({\mathbf{A}}) &\coloneq \Sigma^{-1} ({\mathrm{coLie}} \circ \Sigma, d_{\mathbf{A}}+ d'_B).
\end{align*}$$ Since the map $\pi_{\mathbf{A}}$ is induced by the map of
operads ${\mathrm{Lie}} \to {\mathrm{Ass}}$, it is given in this model
by the map
$B^{\mathrm{As}}({\mathbf{A}}) \to B^{\mathrm{Com}}({\mathbf{A}})$
induces by the Koszul dual map
${\mathrm{coAs}}^{\mathrm{nu}} \to {\mathrm{coLie}}$. Similarly, we have
${\mathrm{fgt}}_{{\mathrm{Com}}^{\mathrm{nu}}}{\mathbf{A}} \simeq \Sigma^{-1}(E^{\mathrm{nu}}_0 \circ \Sigma ({\mathbf{A}}), d_{\mathbf{A}}+0)$
so that the canonical map $p_1$ is induced by the canonical map
$DE^{\mathrm{nu}}_0 \to {\mathrm{coAs}}^{\mathrm{nu}}$ and similarly
$p_\infty$ is induced by
$(DE^{\mathrm{nu}}_0)^\vee \to {\mathrm{coLie}}$. Thus, it suffices to
produce a natural splitting
$j_{\mathbf{A}} \colon B^{\mathrm{Com}}({\mathbf{A}}) \to B^{\mathrm{As}}({\mathbf{A}})$
under ${\mathrm{fgt}}_{E^{\mathrm{nu}}_\infty}({\mathbf{A}})$. The
existence of such a splitting follows from the more general result
[@Barr1968HarrisonHH Theorem 1.1] by taking coefficients to be
${\mathds{Q}}$ viewed as a trivial
${\mathbf{A}},{\mathbf{A}}$-bimodule. ◻
:::

