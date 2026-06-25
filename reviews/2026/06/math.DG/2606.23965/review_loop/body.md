## Introduction

In [@cattaneojiang26], we establish an equivalence between the fibered
category of transitive $L_\infty$ algebroids over dg manifolds and the
split fibered category of $L_\infty$ spaces over dg manifolds
$$\mathbf{L_\infty Algd}_{\mathrm{fib}} \cong \mathbf{L_\infty Sp},$$
which detects weak equivalences. We further construct a faithful functor
$$\mathbf{Fib}\colon \mathbf{L_\infty Algd} \longrightarrow \mathbf{L_\infty Algd}_{\mathrm{fib}} \cong \mathbf{L_\infty Sp},$$
which also detects weak equivalences.

In the present work, we study the homotopy theory for $L_\infty$ spaces
over a dg manifold. Our main result shows that $\mathbf{Fib}$ can be
interpreted as a fibrant replacement functor.

::: thm
**Theorem 1**. *$L_\infty$ spaces over a dg manifold form a category of
fibrant objects (CFO).*
:::

The proof proceeds by using the global sections functor to translate the
problem into an algebraic one, and then applying techniques from the
theory of $L_\infty$ algebras over a field
[@getzler2009; @rogers2020explicit; @rogers2023complete; @getzler2025higherholonomycurvedlinftyalgebras],
adapted to the setting of filtered commutative differential graded
algebras (filtered cdgas). In particular, we provide in the appendices a
version of the homotopy transfer theorem for curved $L_\infty$ algebras
over filtered cdgas.

It is known that dg manifolds also form a CFO
[@Behrend2020thx; @carchedi2023derivedmanifoldsdifferentialgraded]. It
is natural to ask whether the base and fiber CFO structures of
$\mathbf{L_\infty Sp}$ assemble into a total CFO structure. Further
evidence for this expectation comes from the fact that $L_\infty$
groupoids in the Banach manifold setting form an incomplete CFO
[@rogers2020homotopy].

### Acknowledgments {#acknowledgments .unnumbered}

The author is grateful to Ezra Getzler for a helpful discussion.

The author acknowledges partial support of the SNF Grant No. 200021
227719 and of the Simons Collaboration on Global Categorical Symmetries.
This research was (partly) supported by the NCCR SwissMAP, funded by the
Swiss National Science Foundation. This article is based upon work from
COST Action 21109 CaLISTA, supported by COST (European Cooperation in
Science and Technology) (www.cost.eu), MSCA-2021-SE-01-101086123
CaLIGOLA, and MSCA-DN CaLiForNIA-101119552.

## Curved $L_\infty$ spaces

Throughout this paper, all filtrations are assumed to be descending,
separated, exhaustive, and complete.

### Curved $L_\infty$ algebras

Let $R=({R^\sharp}, D_R)$ be a filtered commutative differential graded
algebra (filtered cdga) over $\mathbb{R}$, whose underlying filtration
is induced by a proper dg ideal $I$: $$F^p {R^\sharp}= 
    \begin{cases}
        I^p, & p \geq 1,\\
        {R^\sharp}, & p \leq 0.
    \end{cases}$$

::: defn
**Definition 2**. *A *curved $L_\infty$ algebra* over $R$ is a filtered
graded ${R^\sharp}$-module $\mathfrak{g}$ together with*

- *an element of degree $1$ $$l_0 \in F^1 \mathfrak{g}[1];$$*

- *a filtration-preserving $\mathbb{R}$-linear map of degree $1$
  $$l_1\colon \mathfrak{g}[1] \rightarrow \mathfrak{g}[1];$$*

- *a graded symmetric filtration-preserving multi-${R^\sharp}$-linear
  map of degree $1$
  $$l_n\colon \mathfrak{g}[1]^{\times n} \longrightarrow \mathfrak{g}[1]$$
  for each $n \ge 2$.*

*These multi-brackets satisfy the following identities:*

- *for every $r \in R^\sharp$ and $x \in \mathfrak{g}[1]$, $$l_1(r x)
              =
              D_R(r)\, x
              +
              (-1)^{|r|} r\, l_1(x);$$*

- *for every $n \ge 0$ and $x_1,\dots,x_n \in \mathfrak{g}[1]$,
  $$\sum_{p+q=n}
              \sum_{\sigma \in \Sigma_n}
              \frac{\epsilon(\sigma)}{p!\, q!}
              \,
              l_{q+1}\big(
              l_p(x_{\sigma(1)},\dots,x_{\sigma(p)}),
              x_{\sigma(p+1)},\dots,x_{\sigma(n)}
              \big)
              =
              0,$$ where $\epsilon(\sigma)$ is the Koszul sign of the
  permutation $\sigma$. In particular, one has
  $$l_1(l_0) = 0, \quad \text{and} \quad l_2(l_0, x) + l_1(l_1(x))=0.$$*
:::

Since $l_0 \in F^1\mathfrak{g}[1]$, the pair $(\mathfrak{g}[1], l_1)$
defines a curved complex with ${R^\sharp}$-linear curvature
$$r\coloneqq-l_2(l_0, \cdot);$$ see Appendix
[5](#sec:hpt){reference-type="ref" reference="sec:hpt"} for our notion
of curved complexes.

::: defn
**Definition 3**. *A *morphism*
$\phi\colon \mathfrak{g}_1 \rightarrow \mathfrak{g}_2$ between curved
$L_\infty$ algebras over $R$ consists of*

- *an element of degree $0$ $$\phi_0 \in F^1 \mathfrak{g}_2[1];$$*

- *a graded symmetric filtration-preserving multi-${R^\sharp}$-linear
  map of degree $0$
  $$\phi_n\colon \mathfrak{g}_1[1]^{\times n} \rightarrow \mathfrak{g}_2[1]$$
  for each $n \geq 1$.*

*These multi-linear maps intertwine the multi-brackets on
$\mathfrak{g}_1$ and $\mathfrak{g}_2$: $$\begin{align*}
            &\sum_{p+q=n} \sum_{\sigma \in \Sigma_n}\frac{\epsilon(\sigma)}{p!q!} \,
            \phi_{q+1}\big(
            l_p(x_{\sigma(1)},\dots),\dots,x_{\sigma(n)}
            \big) \\
            &= \sum_{k=0}^{\infty} \sum_{n_1+\cdots+n_k=n} \sum_{\sigma\in \Sigma_n} \frac{\epsilon(\sigma)}{k!n_1!\cdots n_k!}
            \, l_k \big(
            \phi_{n_1}(x_{\sigma(1)},\dots),
            \dots,
            \phi_{n_k}(\dots,x_{\sigma(n)})
            \big)
\end{align*}$$ for every $n \ge 0$ and
$x_1,\dots,x_n \in \mathfrak{g}_1[1]$. In particular, one has
$$\begin{align*}
            &\phi_1(l_0) =  l_0 + \sum_{k=1}^\infty \frac{1}{k!}l_k(\phi_0, \dots, \phi_0), \\
            &\phi_1(l_1(x)) - l_1(\phi_1(x))
            =
            -\phi_2(l_0,x) 
            + \sum_{k = 1}^\infty \frac{1}{k!}\, l_{k+1}(\phi_0,\dots, \phi_0, \phi_1(x)).
\end{align*}$$ Such $\phi$ is called *strict* if $\phi_n = 0$ for all
$n \neq 1$.*
:::

::: rmk
**Remark 4**. *The above notion of morphisms easily extends to morphisms
of curved $L_\infty$ algebras over different base filtered cdgas via
completed base change.*
:::

::: rmk
**Remark 5**. *The composition $\phi \circ \psi$ of two morphisms
$\psi \colon \mathfrak{h}\to \mathfrak{g}$ and
$\phi \colon \mathfrak{g}\to \mathfrak{m}$ is given by
$$(\phi \circ \psi)_n(x_1, \dots, x_n)
        =
        \sum_{k=0}^{\infty}
        \sum_{n_1 + \cdots + n_k = n}
        \sum_{\sigma \in \Sigma_n}
        \frac{\epsilon(\sigma)}{k!n_1! \cdots n_k!}
        \, \phi_k\!\Big(
        \psi_{n_1}(x_{\sigma(1)}, \dots), \dots, \psi_{n_k}(\dots, x_{\sigma(n)})
        \Big).$$*
:::

Since $l_0 \in F^1 \mathfrak{g}_1[1]$ and
$\phi_0 \in F^1 \mathfrak{g}_2[1]$, we have
$$\phi_1(l_1(x)) - l_1(\phi_1(x)) \in F^{p+1} \mathfrak{g}_2[1]$$ for
any $x \in F^p \mathfrak{g}_1[1]$. Thus,
$$\phi_1\colon (\mathfrak{g}_1[1],l_1) \rightarrow (\mathfrak{g}_2[1], l_1)$$
defines a morphism of curved complexes.

::: defn
**Definition 6**. *A morphism $\phi=\{\phi_n\}_{n=0}^\infty$ between
curved $L_\infty$ algebras $\mathfrak{g}_1$ and $\mathfrak{g}_2$ is
called a *weak equivalence* if
$$\mathrm{Gr}\, \phi_1 \colon (\mathrm{Gr}\, \mathfrak{g}_1[1], \mathrm{Gr}\, l_1) \longrightarrow(\mathrm{Gr}\, \mathfrak{g}_2[1], \mathrm{Gr}\, l_1)$$
is a quasi-isomorphism.*
:::

A *filtered cocommutative dg coalgebra* $C=({C^\sharp},D_C)$ over $R$ is
a filtered dg module $C$ over $R$ equipped with a compatible graded
cocommutative coalgebra structure on ${C^\sharp}$ over ${R^\sharp}$;
that is, a coproduct and a counit
$$\Delta \colon {C^\sharp}\longrightarrow {C^\sharp}\otimes_{R^\sharp}{C^\sharp},
    \qquad
    \epsilon \colon {C^\sharp}\longrightarrow {R^\sharp},$$ compatible
with both the differentials and the filtrations. Explicitly,
$$(D_C \otimes \mathrm{id}+ \mathrm{id}\otimes D_C)\circ \Delta
    =
    \Delta \circ D_C,
    \qquad
    D_R \circ \epsilon
    =
    \epsilon \circ D_C,$$ and
$$\Delta(F^p {C^\sharp}) \subset \sum_{i+j=p} F^i {C^\sharp}\otimes_{R^\sharp}F^j {C^\sharp},
    \qquad
    \epsilon(F^p {C^\sharp}) \subset F^p {R^\sharp}.$$

A *morphism* between filtered cocommutative dg coalgebras $C_1$ and
$C_2$ over $R$ is a morphism of graded cocommutative coalgebras over
${R^\sharp}$ $$\Phi\colon C_1^\sharp \rightarrow C_2^\sharp$$ compatible
with the differentials and filtrations; that is,
$$\Phi(F^p {C^\sharp}_1) \subset F^p {C^\sharp}_2, \qquad \Phi \circ D_{C_1} = D_{C_2} \circ \Phi.$$

Let $\mathfrak{g}$ be a curved $L_\infty$ algebra over $R$. We denote by
$$\widehat{\mathrm{Sym}}_{R^\sharp}(\mathfrak{g}[1])$$ the completion of
the graded commutative algebra
$\mathrm{Sym}_{R^\sharp}(\mathfrak{g}[1])$ with respect to the
convolution filtration
$$F^p \mathrm{Sym}_{R^\sharp}(\mathfrak{g}[1]) \coloneqq \sum_{r+s=p} F_\mathfrak{g}^r\, \mathrm{Sym}_{R^\sharp}(\mathfrak{g}[1]) \odot F_S^{s}\, \mathrm{Sym}_{R^\sharp}(\mathfrak{g}[1]),$$
where $\odot$ denotes the symmetric product, the filtration
$F_S^{s}\, \mathrm{Sym}_{R^\sharp}(\mathfrak{g}[1])$ is defined by
$$F^{s}_S\, \mathrm{Sym}_{R^\sharp}(\mathfrak{g}[1]) \coloneqq \bigoplus_{i=0}^{-s} \mathrm{Sym}_{R^\sharp}^i(\mathfrak{g}[1]),$$
and the filtration
$F_\mathfrak{g}^r\, \mathrm{Sym}_{R^\sharp}(\mathfrak{g}[1])$ is
determined by
$$F^r_\mathfrak{g}\, \mathrm{Sym}^0_{R^\sharp}(\mathfrak{g}[1]) \coloneqq F^r R, \qquad F^r_\mathfrak{g}\, \mathrm{Sym}^1_{R^\sharp}(\mathfrak{g}[1]) \coloneqq F^r \mathfrak{g}[1].$$

The coproduct and counit on
$\widehat{\mathrm{Sym}}_{R^\sharp}(\mathfrak{g}[1])$ are induced by the
standard graded cocommutative coalgebra structure on
$\mathrm{Sym}_{R^\sharp}(\mathfrak{g}[1])$, namely, for
$r \in {R^\sharp}$ and $x_1,\ldots,x_n \in \mathfrak{g}[1]$,
$$\Delta(x_1 \odot \cdots \odot x_n)
    =
    \sum_{p=0}^n
    \sum_{\sigma \in \Sigma_n}
    \frac{\epsilon(\sigma)}{p!(n-p)!}\,
    (x_{\sigma(1)} \odot \cdots \odot x_{\sigma(p)})
    \otimes
    (x_{\sigma(p+1)} \odot \cdots \odot x_{\sigma(n)}),$$ and
$$\epsilon(r)=r,
    \qquad
    \epsilon(x_1 \odot \cdots \odot x_n)=0.$$

The multi-brackets $\{l_n\}_{n=0}^\infty$ of $\mathfrak{g}$ induce a
differential $D_\mathfrak{g}$ on
$\widehat{\mathrm{Sym}}_{R^\sharp}(\mathfrak{g}[1])$ by
$$D_\mathfrak{g}(r) = D_R(r),$$ and
$$D_\mathfrak{g}(x_1 \odot \cdots \odot x_n) = \sum_{p=0}^n
    \sum_{\sigma \in \Sigma_n}
    \frac{\epsilon(\sigma)}{p!(n-p)!}
    \,
    l_p(x_{\sigma(1)}, \dots, x_{\sigma(p)}) \odot
    x_{\sigma(p+1)} \odot \cdots \odot x_{\sigma(n)}.$$ Since
$l_0 \in F^1 \mathfrak{g}[1]$, $D_\mathfrak{g}$ is compatible with the
filtration on $\widehat{\mathrm{Sym}}_{R^\sharp}(\mathfrak{g}[1])$. It
is also compatible with the coproduct and counit of
$\widehat{\mathrm{Sym}}_{R^\sharp}(\mathfrak{g}[1])$.

::: defn
**Definition 7**. *We call the filtered cocommutative dg coalgebra over
$R$
$$\mathrm{CE}(\mathfrak{g}) \coloneqq \bigl(\widehat{\mathrm{Sym}}_{R^\sharp}(\mathfrak{g}[1]), D_\mathfrak{g}\bigr)$$
the *Chevalley--Eilenberg coalgebra* of $\mathfrak{g}$.[^1] The
differential $D_\mathfrak{g}$ is called the *Chevalley--Eilenberg
differential* of $\mathfrak{g}$.*
:::

A morphism $\phi\colon \mathfrak{g}_1 \to \mathfrak{g}_2$ of curved
$L_\infty$ algebras over $R$ induces a morphism of filtered
cocommutative dg coalgebras over $R$
$$\mathrm{CE}(\phi)\colon \mathrm{CE}(\mathfrak{g}_1) \longrightarrow \mathrm{CE}(\mathfrak{g}_2)$$
via the formula $$\mathrm{CE}(\phi)(x_1 \odot \cdots \odot x_n)
    =
    \sum_{k=0}^{\infty}
    \sum_{n_1 + \cdots + n_k = n}
    \sum_{\sigma \in \Sigma_n}
    \frac{\epsilon(\sigma)}{k!n_1!\cdots n_k!}\,
    \phi_{n_1}(x_{\sigma(1)},\ldots) \odot \cdots \odot
    \phi_{n_k}(\ldots,x_{\sigma(n)}).$$ The functor $\mathrm{CE}$ embeds
the category of curved $L_\infty$ algebras over $R$ as a full
subcategory of the category of filtered cocommutative dg coalgebras over
$R$.

::: {#bc .defn}
**Definition 8**. *Let $\mathfrak{g}$ be a curved $L_\infty$ algebra
over $R$. Let $S=(S^\sharp,D_S)$ be a filtered cdga over $R$. The
*completed base change* of $\mathfrak{g}$ along $S$ is the curved
$L_\infty$ algebra over $S$ given by the completed tensor product of
filtered graded ${R^\sharp}$-modules $$\mathfrak{g}_S\coloneqq
        {S^\sharp}\,\widehat{\otimes}_{R^\sharp}\, \mathfrak{g},$$ whose
multi-brackets are defined on homogeneous tensors by
$$l_n(\alpha_1 \otimes x_1,\ldots,\alpha_n \otimes x_n)
        =
        \begin{cases}
            1 \otimes l_0,
            & n=0, \\[6pt]
            D_S(\alpha_1)\otimes x_1
            +
            (-1)^{|\alpha_1|}
            \alpha_1 \otimes l_1(x_1),
            & n=1, \\[6pt]
            (-1)^{\sum_{i<j}|x_i||\alpha_j|}
            \,\alpha_1\cdots\alpha_n
            \otimes
            l_n(x_1,\ldots,x_n),
            & n\ge2.
        \end{cases}$$*
:::

For our purposes, we consider a special class of curved $L_\infty$
algebras $\mathfrak{g}$ over $R$ satisfying the following condition:

- $\mathfrak{g}$ is *finitely generated projective* over ${R^\sharp}$;
  that is, $\mathfrak{g}$ is a direct summand of a free graded
  ${R^\sharp}$-module of finite total rank in the category of filtered
  graded ${R^\sharp}$-modules.

Note this condition implies that the filtration on $\mathfrak{g}$ is
*strict*, i.e. $$F^p \mathfrak{g}= F^p {R^\sharp}\cdot \mathfrak{g}.$$
It follows that the multi-${R^\sharp}$-linearity of the multi-brackets
$l_n$ on $\mathfrak{g}$ automatically implies compatibility with the
filtration. Moreover, the ordinary tensor product
${S^\sharp}\otimes_{R^\sharp}\mathfrak{g}$ appearing in Definition
[8](#bc){reference-type="ref" reference="bc"} is automatically complete,
so that $$\mathfrak{g}_S = {S^\sharp}\otimes_{R^\sharp}\mathfrak{g},$$
and is again finitely generated projective over ${S^\sharp}$.

We denote by $\mathbf{L_\infty Alg}(R)_{\mathrm{fgp}}$ the category of
finitely generated projective curved $L_\infty$ algebras over $R$.

### Curved $L_\infty$ spaces

In [@cattaneojiang26], we adapt Costello's notion of $L_\infty$ spaces
over smooth manifolds together with the notion of weak equivalences
between them [@costello2011geometric] to the setting of dg manifolds. We
briefly recall the setup.

Let $\mathcal{M}=(M, \mathcal{O}_\mathcal{M})$ be a dg manifold. Let
$\widehat{\Omega}_\mathcal{M}$ denote the sheaf of completed
differential forms of $\mathcal{M}$ on $M$.
$\widehat{\Omega}_\mathcal{M}$ carries an $\mathcal{I}$-adic filtration
induced by the ideal of completed differential forms whose projection to
functions vanishes
$$\mathcal{I}\coloneqq \widehat{\Omega}_\mathcal{M}^{>0}.$$ It also
carries a differential $D_\mathcal{M}$ preserving $\mathcal{I}$, defined
by $$D_\mathcal{M}= d_{dR} + L_{Q_\mathcal{M}},$$ where $d_{dR}$ is the
de Rham differential and $L_{Q_\mathcal{M}}$ is the Lie derivative along
the cohomological vector field $Q_\mathcal{M}$ of $\mathcal{M}$. For
simplicity, we write
$$\mathcal{R}_\mathcal{M}\coloneqq (\widehat{\Omega}_\mathcal{M}, D_\mathcal{M}), \qquad R_\mathcal{M}\coloneqq \mathcal{R}_\mathcal{M}(M).$$

::: defn
**Definition 9**. *A *curved $L_\infty$ space* over $\mathcal{M}$ is a
pair $B\mathfrak{g}=(\mathcal{M},\mathfrak{g})$, where $\mathfrak{g}$ is
a sheaf of graded $\mathcal{R}_\mathcal{M}^\sharp$-modules, locally free
of finite total rank, equipped with a curved $L_\infty$ algebra
structure over $\mathcal{R}_\mathcal{M}$.*
:::

Let $V \subset U$ be two open subsets of $M$. By definition, the
restriction map
$$\operatorname{res}^U_V \colon \mathfrak{g}(U) \longrightarrow \mathfrak{g}(V)$$
is required to be a strict morphism of curved $L_\infty$ algebras over
$\mathcal{R}_\mathcal{M}(U)$. That is, we have
$$l_n\bigl(\operatorname{res}^U_V(x_1), \dots, \operatorname{res}^U_V(x_n)\bigr)
    =
    \operatorname{res}^U_V\bigl(l_n(x_1, \dots, x_n)\bigr)$$ for all
$x_1, \dots, x_n \in \mathfrak{g}(U)[1]$ and all $n \ge 0$.

::: defn
**Definition 10**. *A *morphism*
$\phi\colon B\mathfrak{g}_1 \to B\mathfrak{g}_2$ of curved $L_\infty$
spaces is a pair $\phi=(f, \phi^\sharp)$, where*

- *$f\colon \mathcal{M}_1 \rightarrow \mathcal{M}_2$ is a dg manifold
  morphism;*

- *$\phi^\sharp\colon \mathfrak{g}_1 \rightarrow f^*\mathfrak{g}_2$ is a
  morphism of curved $L_\infty$ algebras over
  $\mathcal{R}_{\mathcal{M}_1}$, where
  $$f^*\mathfrak{g}_2 = \mathcal{R}_{\mathcal{M}_1} \otimes_{f^{-1} \mathcal{R}_{\mathcal{M}_2}} \mathfrak{g}_2.$$*

*Such $\phi$ is called *base-fixing* if $f=\mathrm{id}$. It is called
*strict* if $\phi^\sharp$ is strict. It is called a *weak equivalence*
if $f$ is a weak equivalence of dg manifolds and
$$\phi^\sharp_{M_1}\colon \mathfrak{g}_1(M_1) \rightarrow f^*\mathfrak{g}_2(M_1)$$
is a weak equivalence of curved $L_\infty$ algebras over
$R_{\mathcal{M}_1}$.*
:::

::: rmk
**Remark 11**. *In [@cattaneojiang26], we formulate morphisms of curved
$L_\infty$ spaces over dg manifolds using the language of
Chevalley--Eilenberg algebras. The two approaches are equivalent, since
one can show that $\mathfrak{g}$ is finitely generated and projective
over $\mathcal{R}_\mathcal{M}^\sharp$.*
:::

We denote by $\mathbf{L_\infty Sp}(\mathcal{M})$ the category of curved
$L_\infty$ spaces over $\mathcal{M}$ with base-fixing morphisms. In the
next section, we show that the global sections functor
$$\Gamma\colon \mathbf{L_\infty Sp}(\mathcal{M}) \longrightarrow \mathbf{L_\infty Alg}(R_\mathcal{M})_{\mathrm{fgp}}$$
is well-defined and fully faithful.

## Global sections functors

We begin by reviewing the global sections functor in the general setting
of graded ringed spaces, following [@morye2013note].[^2]

Let $(X, \mathcal{O}_X)$ be a graded ringed space. Let
$\mathcal{O}_X\text{-}\mathbf{mod}$ denote the category of graded (left)
$\mathcal{O}_X$-modules. Let $A$ denote the graded ring of global
sections $\mathcal{O}_X(X)$, and $A\text{-}\mathbf{mod}$ denote the
category of graded (left) $A$-modules. We have a left exact functor
$$\Gamma\colon \mathcal{O}_X\text{-}\mathbf{mod} \longrightarrow A\text{-}\mathbf{mod},$$
called the *global sections functor*, which sends each graded
$\mathcal{O}_X$-module $\mathcal{E}$ to its global sections
$\Gamma(\mathcal{E})\coloneqq\mathcal{E}(X)$. We also have a right exact
functor
$$\mathrm{S}\colon A\text{-}\mathbf{mod} \longrightarrow \mathcal{O}_X\text{-}\mathbf{mod},$$
which sends each graded $A$-module $E$ to the sheafification of the
presheaf $\mathrm{P}(E)$ given by
$$U \longmapsto \mathcal{O}_X(U) \otimes_A E.$$ One can show that
$\mathrm{S}$ is left adjoint of $\Gamma$. The natural isomorphism
$$\alpha_{E,\mathcal{F}}:
    \mathrm{Hom}(\mathrm{S}(E),\mathcal{F})
    \xlongrightarrow{\cong}
    \mathrm{Hom}(E,\Gamma(\mathcal{F}))$$ is given by
$$(\phi\colon \mathrm{S}(E) \rightarrow \mathcal{F})\longmapsto \bigl(E \rightarrow \mathrm{S}(E)(X) \xrightarrow{\phi_X} \Gamma(\mathcal{F})\bigr),$$
where $E = \mathrm{P}(E)(X) \rightarrow \mathrm{S}(E)(X)$ denotes the
canonical morphism induced by sheafification.

::: lem
**Lemma 12**. *The restriction of $\mathrm{S}$ to the subcategory of
finitely generated projective graded $A$-modules
$$\mathbf{Fgp}(A) \subset A\text{-}\mathbf{mod}$$ is fully faithful.*
:::

::: proof
*Proof.* Since tensoring with a finitely generated projective module
commutes with projective limits, we see that $\mathrm{P}(E)$ is already
a sheaf for $E \in \mathbf{Fgp}(A)$. Hence
$\mathrm{S}(E) = \mathrm{P}(E)$.

It follows that
$$\mathrm{Hom}(E, F) \cong \mathrm{Hom}(E, \Gamma(\mathrm{S}(F))) \cong \mathrm{Hom}(\mathrm{S}(E), \mathrm{S}(F))$$
for $E, F \in \mathbf{Fgp}(A)$. ◻
:::

We henceforth impose the following assumptions on the ringed space
$(X,\mathcal{O}_X)$:

1.  []{#a1 label="a1"} $X$ is a manifold and $\mathcal{O}_X$ is a fine
    sheaf on $X$;

2.  []{#a2 label="a2"} for every surjective morphism
    $$\rho:\mathcal{E}\longrightarrow \mathcal{F}$$ in the subcategory
    of locally free graded $\mathcal{O}_X$-modules of finite total rank
    $$\mathbf{Vec}(X) \subset  \mathcal{O}_X\text{-}\mathbf{mod},$$ the
    kernel $\ker(\rho)$ is again in $\mathbf{Vec}(X)$.

We will prove that the graded ringed space
$(M, \widehat{\Omega}_\mathcal{M})$ underlying a curved $L_\infty$ space
$B\mathfrak{g}= (\mathcal{M}, \mathfrak{g})$ satisfies assumptions
[\[a1\]](#a1){reference-type="ref" reference="a1"} and
[\[a2\]](#a2){reference-type="ref" reference="a2"}.

::: {#gff .lem}
**Lemma 13**. *$\Gamma$ is fully faithful. Moreover, it satisfies the
following conditions:*

- *$\mathrm{S}(\Gamma(\mathcal{E})) \cong \mathcal{E}$ for all
  $\mathcal{E}\in \mathcal{O}_X\text{-}\mathbf{mod}$;*

- *the restriction of $\Gamma$ to $\mathbf{Vec}(X)$ takes values in
  $\mathbf{Fgp}(A)$.*
:::

::: proof
*Proof.* The isomorphism
$\mathrm{S}(\Gamma(\mathcal{E})) \cong \mathcal{E}$ can be proved using
only assumption [\[a1\]](#a1){reference-type="ref" reference="a1"} on
$(X,\mathcal{O}_X)$. See Lemma 2.3 and Proposition 2.5 in
[@morye2013note]. It follows that
$$\mathrm{Hom}(\mathcal{E}, \mathcal{F}) \cong \mathrm{Hom}(\mathrm{S}(\Gamma(\mathcal{E})), \mathcal{F}) \cong \mathrm{Hom}(\Gamma(\mathcal{E}), \Gamma(\mathcal{F})).$$

We now prove the second condition using an argument due to Sardanashvily
[@sardanashvily2001remark]. Observe that any open covering
$\{U_\alpha\}$ of a manifold admits a refinement $\{U_{\beta i}\}$,
where $\beta$ runs over a finite set and $i$ runs over a countable set,
such that
$$U_{\beta i} \cap U_{\beta j} = \emptyset \quad \text{for } i \neq j.$$
Let $\mathcal{E}$ be a locally free graded $\mathcal{O}_X$-module of
finite total rank. Let $\{U_\alpha\}$ be an open cover of $X$ over which
$\mathcal{E}$ trivializes. The above refinement $\{U_{\beta i}\}$ then
induces a finite collection of open sets
$$U_\beta \coloneqq \bigcup_i U_{\beta i}$$ over which $\mathcal{E}$
still trivializes. It then follows from the partition of unity argument
that there exists a finite sequence of integers $\{d_1, \dots,d_N\}$ and
a surjective morphism
$$\rho\colon \bigoplus_{i=1}^N\mathcal{O}_X[d_i] \longrightarrow \mathcal{E}.$$
By assumption [\[a2\]](#a2){reference-type="ref" reference="a2"}, this
fits into a short exact sequence of locally free graded
$\mathcal{O}_X$-modules of finite rank
$$0 \longrightarrow \ker \rho \longrightarrow \bigoplus_{i=1}^N\mathcal{O}_X[d_i]  \longrightarrow \mathcal{E}\longrightarrow 0.$$
Since all terms are fine and locally free of finite total rank, this
short exact sequence splits. It follows that $\mathcal{E}$ is a direct
summand of a free graded $\mathcal{O}_X$-module of finite total rank.
Consequently, $\Gamma(\mathcal{E})$ is a finitely generated projective
graded $A$-module. ◻
:::

Let $\mathbf{Fgp}(A)_{\mathrm{vec}}$ denote the full subcategory of
$\mathbf{Fgp}(A)$ consisting of graded $A$-modules $E$ that are
isomorphic to $\Gamma(\mathcal{E})$ for some $\mathcal{E}$. The two
lemmas above combine to yield the following result.

::: {#gft .prop}
**Proposition 14**. *The functors
$$\Gamma\colon \mathbf{Vec}(X) \longrightarrow \mathbf{Fgp}(A)_{\mathrm{vec}},
        \qquad
        \mathrm{S}\colon \mathbf{Fgp}(A)_{\mathrm{vec}} \longrightarrow \mathbf{Vec}(X)$$
are well-defined and quasi-inverse equivalences.*
:::

If $(X,\mathcal{O}_X)$ is locally ringed, one can further show that the
restriction of $\mathrm{S}$ to $\mathbf{Fgp}(A)$ takes values in
$\mathbf{Vec}(X)$, since every projective module over a local ring is
free. In this case, $\Gamma$ and $\mathrm{S}$ define quasi-inverse
equivalences $$\Gamma:\mathbf{Vec}(X)\longrightarrow \mathbf{Fgp}(A),
    \qquad
    \mathrm{S}:\mathbf{Fgp}(A)\longrightarrow \mathbf{Vec}(X).$$ This is
a version of the Serre--Swan theorem. However, the graded ringed space
$(M, \widehat{\Omega}_\mathcal{M})$ underlying a curved $L_\infty$ space
$B\mathfrak{g}= (\mathcal{M}, \mathfrak{g})$ is not, in general, locally
ringed.

::: {#kerOmega .prop}
**Proposition 15**. *The graded ringed space
$(M, \widehat{\Omega}_\mathcal{M})$ satisfies the assumptions
[\[a1\]](#a1){reference-type="ref" reference="a1"} and
[\[a2\]](#a2){reference-type="ref" reference="a2"}.*
:::

To verify assumption [\[a2\]](#a2){reference-type="ref" reference="a2"},
we need the following lemma, which is proved in [@cattaneojiang26].

::: {#kerOM .lem}
**Lemma 16** (Proposition 2.6 in [@cattaneojiang26]). *Let
$\mathcal{E}_1$ and $\mathcal{E}_2$ be locally free graded
$\mathcal{O}_\mathcal{M}$-modules of finite total rank. Let
$\rho\colon \mathcal{E}_1 \to \mathcal{E}_2$ be a surjective morphism of
graded $\mathcal{O}_\mathcal{M}$-modules. Then $\ker \rho$ is again
locally free of finite total rank.*
:::

Recall that $\widehat{\Omega}_\mathcal{M}$ is defined as
$$\widehat{\Omega}_\mathcal{M}= \widehat{\mathrm{Sym}}_{\mathcal{O}_\mathcal{M}}(\mathcal{T}_\mathcal{M}[1]^\vee),$$
where $\mathcal{T}_\mathcal{M}$ is the tangent sheaf of $\mathcal{M}$
and $\widehat{\mathrm{Sym}}_{\mathcal{O}_\mathcal{M}}$ is the completed
symmetric power of graded $\mathcal{O}_\mathcal{M}$-modules. In
particular, every graded $\widehat{\Omega}_\mathcal{M}$-module is a
graded $\mathcal{O}_\mathcal{M}$-module.

::: {#lkerOmega .lem}
**Lemma 17**. *Let $\mathfrak{g}$ be a locally free graded
$\widehat{\Omega}_\mathcal{M}$-module of finite total rank. Then there
exists a locally free graded $\mathcal{O}_\mathcal{M}$-module
$\mathcal{E}$ of finite total rank such that
$$\mathfrak{g}\cong \widehat{\Omega}_\mathcal{M}\otimes_{\mathcal{O}_\mathcal{M}} \mathcal{E}.$$*
:::

::: proof
*Proof.* Consider the short exact sequence of graded
$\mathcal{O}_\mathcal{M}$-modules
$$0 \longrightarrow F^1 \mathfrak{g}\longrightarrow \mathfrak{g}\longrightarrow \mathcal{E}\coloneqq \mathrm{Gr}^0 \mathfrak{g}\longrightarrow 0.$$
Since both $F^1 \mathfrak{g}$ and $\mathcal{E}$ are (filtered) locally
free over $\mathcal{O}_\mathcal{M}$ and fine, this short exact sequence
admits a splitting $\iota\colon \mathcal{E}\to \mathfrak{g}$. We then
obtain a graded $\widehat{\Omega}_\mathcal{M}$-module morphism
$$\begin{align*}
            \widetilde{\iota}\colon \widehat{\Omega}_\mathcal{M}\otimes_{\mathcal{O}_\mathcal{M}} \mathcal{E}&\longrightarrow \mathfrak{g}\\
            \alpha \otimes e &\longmapsto \alpha \cdot \iota(e).
\end{align*}$$ Since the filtration on $\widehat{\Omega}_\mathcal{M}$ is
complete, it is straightforward to verify that $\widetilde{\iota}$ is
locally an isomorphism, hence an isomorphism. ◻
:::

::: proof
*Proof of Proposition [15](#kerOmega){reference-type="ref"
reference="kerOmega"}.* Since every graded manifold splits,
$\widehat{\Omega}_\mathcal{M}$ is a $C^\infty_M$-module and hence a fine
sheaf.

By Lemma [17](#lkerOmega){reference-type="ref" reference="lkerOmega"},
every morphism $\rho\colon \mathfrak{g}\to \mathfrak{h}$ of locally free
graded $\widehat{\Omega}_\mathcal{M}$-modules of finite total rank can
be represented in the form
$$\rho\colon \widehat{\Omega}_\mathcal{M}\otimes_{\mathcal{O}_\mathcal{M}} \mathcal{E}\longrightarrow \widehat{\Omega}_\mathcal{M}\otimes_{\mathcal{O}_\mathcal{M}} \mathcal{F},$$
where $\mathcal{E}$ and $\mathcal{F}$ are locally free graded
$\mathcal{O}_\mathcal{M}$-modules of finite total rank. Such a morphism
is uniquely determined by a family of morphisms of graded
$\mathcal{O}_\mathcal{M}$-modules
$$\rho_n\colon \mathcal{E}\longrightarrow \Omega^n_\mathcal{M}\otimes_{\mathcal{O}_\mathcal{M}} \mathcal{F}, \qquad n \ge 0.$$

If $\rho$ is surjective, then the component
$\rho_0\colon \mathcal{E}\rightarrow \mathcal{F}$ is also surjective. By
Lemma [16](#kerOM){reference-type="ref" reference="kerOM"}, we see that
$\rho_0$ admits a splitting
$s\colon \mathcal{F}\rightarrow \mathcal{E}$. We then obtain a
surjective morphism
$$\widetilde{\rho_0} \coloneqq \mathrm{id}\otimes \rho_0 \colon \widehat{\Omega}_\mathcal{M}\otimes_{\mathcal{O}_\mathcal{M}} \mathcal{E}\longrightarrow \widehat{\Omega}_\mathcal{M}\otimes_{\mathcal{O}_\mathcal{M}} \mathcal{F},$$
and a splitting of $\widetilde{\rho_0}$
$$\widetilde{s} \coloneqq \mathrm{id}\otimes s \colon \widehat{\Omega}_\mathcal{M}\otimes_{\mathcal{O}_\mathcal{M}} \mathcal{F}\longrightarrow \widehat{\Omega}_\mathcal{M}\otimes_{\mathcal{O}_\mathcal{M}} \mathcal{E}.$$
By construction, $\rho - \widetilde{\rho_0}$ increases the filtration.
Consequently,
$\mathrm{id}+ \widetilde{s} \circ (\rho - \widetilde{\rho_0})$ is
invertible, and we have
$$\widetilde{\rho_0} = \rho \circ \bigl(\mathrm{id}+ \widetilde{s} \circ (\rho - \widetilde{\rho_0})\bigr)^{-1}.$$
Therefore,
$$\ker \rho \cong \ker \widetilde{\rho_0} = \widehat{\Omega}_\mathcal{M}\otimes_{\mathcal{O}_\mathcal{M}} \ker \rho_0.$$
By Lemma [16](#kerOM){reference-type="ref" reference="kerOM"}, we see
that $\ker \rho$ is locally free over $\widehat{\Omega}_\mathcal{M}$ of
finite total rank. ◻
:::

::: {#gsf .prop}
**Proposition 18**. *The global sections functor
$$\Gamma\colon \mathbf{L_\infty Sp}(\mathcal{M}) \longrightarrow \mathbf{L_\infty Alg}(R_\mathcal{M})_{\mathrm{fgp}}$$
is well-defined and fully faithful. Moreover, let
$$\mathbf{L_\infty Alg}(R_\mathcal{M})_{\mathrm{vec}} \subset \mathbf{L_\infty Alg}(R_\mathcal{M})_{\mathrm{fgp}}$$
denote the full subcategory consisting of those $\mathfrak{g}_M$ such
that $\mathfrak{g}_M \cong \Gamma(B\mathfrak{g})$ for some
$B\mathfrak{g}=(\mathcal{M}, \mathfrak{g}) \in \mathbf{L_\infty Sp}(\mathcal{M})$.
Then the functors
$$\Gamma \colon \mathbf{L_\infty Sp}(\mathcal{M}) \longrightarrow \mathbf{L_\infty Alg}(R_\mathcal{M})_{\mathrm{vec}}, \qquad
        \mathrm{S}\colon \mathbf{L_\infty Alg}(R_\mathcal{M})_{\mathrm{vec}} \longrightarrow \mathbf{L_\infty Sp}(\mathcal{M})$$
are well-defined quasi-inverse equivalences.*
:::

::: proof
*Proof.* The well-definedness and fully faithfulness of $\Gamma$ follow
from Proposition [15](#kerOmega){reference-type="ref"
reference="kerOmega"} and Lemma [13](#gff){reference-type="ref"
reference="gff"}. To prove the second statement, let
$\mathfrak{g}_M \cong \Gamma(B\mathfrak{g})$ for some $B\mathfrak{g}$.
Recall that $\mathrm{S}(\mathfrak{g}_M)$ is defined by the assignment
$$U \longmapsto \mathcal{R}_\mathcal{M}(U) \otimes_{\mathcal{R}_\mathcal{M}(M)} \mathfrak{g}_M.$$
By our previous discussion, $\mathrm{S}(\mathfrak{g}_M)$ is the
completed base change of $\mathfrak{g}_M$ along the restriction map,
hence a sheaf of curved $L_\infty$ algebras over
$\mathcal{R}_\mathcal{M}$.

By Proposition [14](#gft){reference-type="ref" reference="gft"},
$\mathrm{S}$ is well-defined and we have isomorphisms of graded
$R_\mathcal{M}^\sharp$-modules
$$\Gamma(\mathrm{S}(\mathfrak{g}_M)) \cong \mathfrak{g}_M, \qquad \mathrm{S}(\Gamma(B\mathfrak{g})) \cong B\mathfrak{g},$$
which are clearly strict isomorphisms of curved $L_\infty$ algebras. ◻
:::

## Category of fibrant objects

A *category with weak equivalences* is a category $\mathbf{C}$ together
with a subcategory
$$\operatorname{core}(\mathbf{C}) \subseteq \mathbf{W}\subseteq \mathbf{C},$$
where $\operatorname{core}(\mathbf{C})$ denotes the maximal subgroupoid
of $\mathbf{C}$. Morphisms in $\mathbf{W}$ are called *weak
equivalences* and are denoted by $\xrightarrow{\sim}$. We require that
weak equivalences satisfy the 2-out-of-3 property: if $f$ and $g$ are
composable morphisms in $\mathbf{C}$, and two of $f$, $g$, and
$g \circ f$ are weak equivalences, then so is the third.

The notion of a category of fibrant objects was introduced by Brown as a
flexible alternative to Quillen's model categories for doing homotopy
theory [@brown1973abstract].

::: defn
**Definition 19**. *A *category of fibrant objects (CFO)* is a category
with weak equivalences $\mathbf{C}$ together with an additional
subcategory
$$\operatorname{core}(\mathbf{C}) \subseteq \mathbf{F}\subseteq \mathbf{C}.$$
Morphisms in $\mathbf{F}$ are called *fibrations* and are denoted by
$\twoheadrightarrow$. Morphisms in $\mathbf{F}\cap \mathbf{W}$ are
called *trivial fibrations* and are denoted by
$\xtwoheadrightarrow{\sim}$. These data satisfy the following axioms:*

- *$\mathbf{C}$ has a terminal object, and every terminal morphism is a
  fibration.*

- *Pullbacks of (trivial) fibrations exist and are again (trivial)
  fibrations.*

- *For every object $X \in \mathbf{C}$, there exists a factorization
  $$\begin{tikzcd}[row sep=10pt,column sep=40pt]
                  & PX \arrow[dr, two heads, "{(\mathrm{pr}_0,\mathrm{pr}_1)}"] & \\
                  X \arrow[ur, "\sim"] \arrow[rr] && X \times X
              \end{tikzcd}$$ of the diagonal morphism, where $PX$ is
  called the *path space* of $X$.*
:::

Let $\mathbf{C}$ be a category of fibrant objects. For an object
$X \in \mathbf{C}$, define simplicial objects
$$l_\bullet X,~ r_\bullet X \in \mathcal \mathbf{C}^{\Delta^{\mathrm{op}}}$$
by setting:

- $l_n X = X$, with all face and degeneracy maps equal to
  $\mathrm{id}_X$;

- $r_n X =$ the $(n+1)$-fold product of $X$, with face maps given by
  projections and degeneracy maps given by diagonal inclusions.

We adapt the notion of simplicial frames from model categories to CFOs.

::: defn
**Definition 20**. *A *simplicial frame* of an object $X \in \mathbf{C}$
is a simplicial object $X_\bullet \in \mathbf{C}^{\Delta^{\mathrm{op}}}$
together with a factorization $$\begin{equation}
\label{sf}
            \begin{tikzcd}[row sep=10pt,column sep=40pt]
                & X_\bullet \arrow[dr, two heads] & \\
                l_\bullet X  \arrow[ur, hook,"\sim"] \arrow[rr] && r_\bullet X
            \end{tikzcd}
\end{equation}$$ of the diagonal morphism, which is an isomorphism in
degree $0$.*
:::

The existence of simplicial frames implies the existence of path spaces:
the factorization [\[sf\]](#sf){reference-type="eqref" reference="sf"}
reduces to $X \xlongrightarrow{\sim} X_1 \twoheadrightarrow X \times X$
in degree $1$.

::: defn
**Definition 21**. *A *(right) framing* of $\mathbf{C}$ is a functor
$$(\cdot)_\bullet\colon \mathbf{C}\longrightarrow \mathbf{C}^{\Delta^{\mathrm{op}}}$$
together with natural transformations
$$l_\bullet X \longrightarrow X_\bullet  \quad\text{and}\quad X_\bullet \longrightarrow r_\bullet X,$$
which make $X_\bullet$ a simplicial frame of every $X \in \mathbf{C}$.*
:::

Every model category admits a framing; hence its subcategory of fibrant
objects inherits one. See, for instance, Theorem 5.2.8 in
[@hovey2007model].

### Main results

Let $R = ({R^\sharp}, D_R)$ be a cdga equipped with a complete $I$-adic
filtration, where $I$ is a proper dg ideal of $R$. The category
$\mathbf{L_\infty Alg}(R)_{\mathrm{fgp}}$ of finitely generated
projective curved $L_\infty$ algebras over $R$ has a terminal object:
the zero curved $L_\infty$ algebra over $R$.

::: defn
**Definition 22**. *A morphism
$\phi\colon \mathfrak{g}\rightarrow \mathfrak{m}$ in
$\mathbf{L_\infty Alg}(R)_{\mathrm{fgp}}$ is a *fibration* if its unary
component $\phi_1\colon \mathfrak{g}[1] \rightarrow \mathfrak{m}[1]$ is
surjective.*
:::

Clearly, every terminal morphism in
$\mathbf{L_\infty Alg}(R)_{\mathrm{fgp}}$ is a fibration.

::: {#pullback .prop}
**Proposition 23**. *Let
$\phi\colon \mathfrak{g}\rightarrow \mathfrak{m}$ and
$\psi\colon \mathfrak{n}\rightarrow \mathfrak{m}$ be morphisms of
$L_\infty$ algebras over $R$. If $\phi$ is a fibration, then the fiber
product of curved $L_\infty$ algebras $$\begin{tikzcd}
            \mathfrak{g}\times_\mathfrak{m}\mathfrak{n}\arrow[r,"\widetilde{\psi}"] \arrow[d,"\widetilde{\phi}"'] & \mathfrak{g}\arrow[d,"\phi"] \\
            \mathfrak{n}\arrow[r,"\psi"'] & \mathfrak{m}
        \end{tikzcd}$$ exists. Moreover, if $\phi$ is a trivial
fibration, then $\widetilde{\phi}$ is also a trivial fibration.*
:::

The proof is essentially the same as the one in
[@getzler2025higherholonomycurvedlinftyalgebras]; see also
[@rogers2020explicit]. We begin by proving the following standard lemma.

::: {#fibstr .lem}
**Lemma 24**. *Every fibration in
$\mathbf{L_\infty Alg}(R)_{\mathrm{fgp}}$ is strict up to isomorphism.*
:::

::: proof
*Proof.* Let $\phi \colon \mathfrak{g}\to \mathfrak{m}$ be a fibration.
By definition, the linear term
$$\phi_1 \colon \mathfrak{g}[1] \to \mathfrak{m}[1]$$ is surjective.
Since $\mathfrak{m}$ is projective, we can find a splitting
$$s \colon \mathfrak{m}[1] \to \mathfrak{g}[1]$$ of $\phi_1$, and let
$\mathfrak{k}= \ker(\phi_1)[-1]$. Then
$$\mathfrak{g}[1] \cong \mathfrak{k}[1] \oplus s(\mathfrak{m}[1]).$$

Consider the filtered graded cocommutative coalgebra morphism
$$\Psi \colon \widehat{\mathrm{Sym}}_{R^\sharp}(\mathfrak{g}[1]) \to \widehat{\mathrm{Sym}}_{R^\sharp}(\mathfrak{g}[1])$$
over ${R^\sharp}$, whose Taylor coefficients are given by
$$\Psi_n = \begin{cases}
            \mathrm{id}, & n=1, \\
            s \circ \phi_n, & n \neq 1.
        \end{cases}$$ Since the completion on
$\widehat{\mathrm{Sym}}_{R^\sharp}(\mathfrak{g}[1])$ is complete and
$s \circ \phi_n$ increases the filtration, it is easy to check that
$\Psi$ defines an automorphism. On the other hand, consider the filtered
graded cocommutative coalgebra morphism
$$\Phi\colon \widehat{\mathrm{Sym}}_{R^\sharp}(\mathfrak{g}[1]) \to \widehat{\mathrm{Sym}}_{R^\sharp}(\mathfrak{m}[1])$$
over ${R^\sharp}$, whose Taylor coefficients are given by
$$\Phi_n = \begin{cases}
            \phi_1, & n=1,\\
            0, & n \neq 1.
        \end{cases}$$ We claim that
$\mathrm{CE}(\phi) =  \Phi \circ \Psi$. Indeed, recall that the Taylor
coefficients $\{(\phi \circ \psi)_n\}_{n=0}^\infty$ of $\Phi \circ \Psi$
are given by the formula $$(\phi \circ \psi)_n(x_1, \dots, x_n)
        =
        \sum_{k=0}^{\infty}
        \sum_{n_1 + \cdots + n_k = n}
        \sum_{\sigma \in \Sigma_n}
        \frac{\epsilon(\sigma)}{k!n_1! \cdots n_k!}
        \, \phi_k\!\Big(
        \psi_{n_1}(x_{\sigma(1)}, \dots), \dots, \psi_{n_k}(\dots, x_{\sigma(n)})
        \Big).$$ In our case, this simplifies to $$(\phi \circ \psi)_n
        = \phi_1 \circ \psi_n
        = \begin{cases}
            \phi_1, & n=1\\
            \phi_1 \circ s \circ \phi_n, & n \neq 1
        \end{cases}
        = \phi_n.$$ Using $\Psi$ to conjugate the Chevalley--Eilenberg
differential on $\mathfrak{g}$, we obtain a strict morphism isomorphic
to $\phi$. ◻
:::

We now return to the proof of Proposition
[23](#pullback){reference-type="ref" reference="pullback"}. By Lemma
[24](#fibstr){reference-type="ref" reference="fibstr"}, we may assume
that $\phi$ is strict. Let
$$s\colon \mathfrak{m}[1] \rightarrow \mathfrak{g}[1] \quad \text{and} \quad \mathfrak{k}= \ker \phi_1$$
be as in the proof of Lemma [24](#fibstr){reference-type="ref"
reference="fibstr"}. Let
$p\colon \mathfrak{g}[1] \rightarrow \mathfrak{g}[1]$ denote the
idempotent operator $$\mathrm{id}- s \circ \phi_1$$ on
$\mathfrak{g}[1]$. The fiber product
$\mathfrak{g}\times_\mathfrak{m}\mathfrak{n}$ is realized on the
filtered graded ${R^\sharp}$-module $\mathfrak{k}\oplus \mathfrak{n}$.
We take the morphism
$$\widetilde{\phi} \colon \mathfrak{k}\oplus \mathfrak{n}\longrightarrow \mathfrak{n}$$
to be the strict fibration given by projection onto the second factor.
The morphism
$$\widetilde{\psi} \colon \mathfrak{k}\oplus \mathfrak{n}\longrightarrow \mathfrak{g}$$
is then required to satisfy $$\begin{aligned}
        \phi_1\left( \widetilde{\psi}_n(\zeta_1, \dots, \zeta_n) \right)
        =
        \psi_n\left( y_1, \dots, y_n \right)
    \end{aligned}$$ for
$\zeta_i = (x_i, y_i) \in \mathfrak{k}\oplus \mathfrak{n}$. These
equations admit a unique solution satisfying the conditions
$$\begin{align*}
        p \circ \widetilde{\psi}_{n}  = 
        \begin{cases}
            p, & n=1,\\
            0, & n\neq 1.
        \end{cases}
\end{align*}$$ given by $$\begin{equation}
\label{solpsi}
        \begin{aligned}
            \widetilde{\psi}_n(\zeta_1, \dots, \zeta_n) =
            \begin{cases}
                x_1 + s \circ \psi_1(y_1), & n=1,\\
                s \circ \psi_n(y_1, \dots, y_n) & n\neq 1.
            \end{cases}
        \end{aligned}
\end{equation}$$

The multi-brackets
$\{l_n = (\pi_1 \circ l_n, \pi_2 \circ l_n)\}_{n=0}^\infty$ on the fiber
product $\mathfrak{g} \times_{\mathfrak{m}} \mathfrak{n}$ are
characterized by their compatibility with $\widetilde{\phi}$ and
$\widetilde{\psi}$, where
$\pi_1\colon \mathfrak{k}\oplus \mathfrak{n}\rightarrow \mathfrak{k}\subset \mathfrak{g}$
and
$\pi_2\colon \mathfrak{k}\oplus \mathfrak{n}\rightarrow \mathfrak{n}$
are the canonical projections. Explicitly, compatibility with
$\widetilde{\phi}$ yields the characterization $$\begin{equation}
\label{compphi}
        \pi_2 \circ l_n(\zeta_1,\ldots,\zeta_n)
        =
        l_n(y_1, \dots, y_n).
\end{equation}$$ Compatibility with $\widetilde{\psi}$ means that
$$\begin{equation}
\label{pullback-morphism}
        \begin{aligned}
            &
            \widetilde{\psi}_1
            \bigl(
            l_n(\zeta_1,\ldots,\zeta_n)    
            \bigr)
            +
            \sum_{\sigma\in \Sigma_n}\sum_{k=0}^{n-1}
            \frac{\epsilon(\sigma)}{k!(n-k)!}
            \widetilde{\psi}_{n-k+1}
            \bigl(
            l_k(\zeta_{\sigma(1)},\ldots,\zeta_{\sigma(k)}),
            \zeta_{\sigma(k+1)},\ldots,\zeta_{\sigma(n)}
            \bigr)
            \\
            &=
            \sum_{k=0}^{\infty}
            \frac{1}{k!}
            \sum_{\sigma\in \Sigma_n}\sum_{n_1+\cdots+n_k=n}
            \frac{\epsilon(\sigma)}{n_1!\cdots n_k!}
            l_k
            \Bigl(
            \widetilde{\psi}_{n_1}(\zeta_{\sigma(1)},\ldots),
            \ldots,
            \widetilde{\psi}_{n_k}(\ldots,\zeta_{\sigma(n)})
            \Bigr).
        \end{aligned}
\end{equation}$$ Applying [\[solpsi\]](#solpsi){reference-type="eqref"
reference="solpsi"} and [\[compphi\]](#compphi){reference-type="eqref"
reference="compphi"} to
[\[pullback-morphism\]](#pullback-morphism){reference-type="eqref"
reference="pullback-morphism"} yields the characterization
$$\begin{aligned}
        \pi_1 \circ l_n(\zeta_1,\ldots,\zeta_n) &=
        \sum_{k=0}^{\infty}
        \frac{1}{k!}
        \sum_{\sigma\in \Sigma_n}\sum_{n_1+\cdots+n_k=n}
        \frac{\epsilon(\sigma)}{n_1!\cdots n_k!}
        l_k
        \Bigl(
        \widetilde{\psi}_{n_1}(\zeta_{\sigma(1)},\ldots),
        \ldots,
        \widetilde{\psi}_{n_k}(\ldots,\zeta_{\sigma(n)})
        \Bigr) \\
        &-\sum_{\sigma\in \Sigma_n}\sum_{k=0}^n
        \frac{\epsilon(\sigma)}{k!(n-k)!}
        s \circ \psi_{n-k+1}
        \bigl(
        l_k(y_{\sigma(1)},\ldots,y_{\sigma(k)}),
        y_{\sigma(k+1)},\ldots, y_{\sigma(n)}
        \bigr).
    \end{aligned}$$

We need to verify that the multi-brackets on
$\mathfrak{g}\times_\mathfrak{m}\mathfrak{n}$ are well defined. The
unary bracket $l_1$ is given by $$\begin{equation}
\label{l1}
        \begin{aligned}
            &\pi_1 \circ l_1(\zeta_1) =\sum_{k=0}^\infty\frac{1}{k!}l_{k+1}(s(\psi_0), \dots, s(\psi_0), x_1 + s (\psi_1(y_1)))- s\left( \psi_1(l_1(y_1)) + \psi_2(l_0,y_1)\right), \\
            &\pi_2 \circ l_1(\zeta_1) =l_1(y_1). 
        \end{aligned}
\end{equation}$$ It is easy to see that $l_1$ satisfies the Leibniz rule
over $R$, i.e.
$$l_1(r \zeta_1) - (-1)^{|r|} r l_1(\zeta_1) = D_R(r) \zeta_1.$$

Let $D$ denote the degree $1$ coderivation on
$\widehat{\mathrm{Sym}}_{R^\sharp}((\mathfrak{g}\times_\mathfrak{m}\mathfrak{n})[1])$
induced by the multi-brackets on
$\mathfrak{g}\times_\mathfrak{m}\mathfrak{n}$. By construction,
$$D^2\bigl(\widehat{\mathrm{Sym}}_{R^\sharp}((\mathfrak{g}\times_\mathfrak{m}\mathfrak{n})[1])\bigr)$$
lies in the kernels of both $\mathrm{CE}(\widetilde{\phi})$ and
$\mathrm{CE}(\widetilde{\psi})$, and hence must vanish. Therefore, the
multi-brackets on $\mathfrak{g}\times_\mathfrak{m}\mathfrak{n}$ satisfy
the strong homotopy Jacobi identities.

To see that $\mathfrak{g}\times_{\mathfrak{m}} \mathfrak{n}$ is a
pullback, consider a commutative diagram of the form
$$\begin{tikzcd}[column sep=30pt, row sep=30pt]
        \mathfrak{a}
        \arrow[bend right=25,ddr,"\nu"']
        \arrow[bend left=25,drr,"\lambda"]
        \arrow[dashed,dr,"\epsilon"']
        &&
        \\
        &
        \mathfrak{g}\times_{\mathfrak{m}} \mathfrak{n}
        \arrow[d,"\widetilde{\phi}"']
        \arrow[r,"\widetilde{\psi}"]
        &
        \mathfrak{g} \arrow[d,"\phi"]
        \\
        &
        \mathfrak{n} \arrow[r,"\psi"']
        &
        \mathfrak{m}
    \end{tikzcd}$$ The morphism $\epsilon$ is given by
$$\epsilon_n(z_1,\ldots,z_n)
    =
    (p \circ \lambda_n(z_1,\ldots,z_n), \nu_n(z_1,\ldots,z_n)).$$ This
proves the universal property.

We now turn to the proof of the second statement. Using
[\[l1\]](#l1){reference-type="eqref" reference="l1"}, we see that
$$\mathrm{Gr}\, l_1 =
    \begin{pmatrix}
        \mathrm{Gr}\, l_1 & \mathrm{Gr}\,[l_1, s \circ \psi_1] \\
        0 & \mathrm{Gr}\, l_1
    \end{pmatrix}$$ on $\mathfrak{k}\oplus \mathfrak{n}$. We can then
identify $$H^\bullet(\mathrm{Gr}\, \widetilde{\phi}_1)\colon
    H^\bullet(\mathrm{Gr}\, \mathfrak{g}\times_\mathfrak{m}\mathfrak{n})
    \cong
    H^\bullet(\mathrm{Gr}\, \mathfrak{k})\oplus H^\bullet(\mathrm{Gr}\, \mathfrak{n})
    \longrightarrow
    H^\bullet(\mathrm{Gr}\, \mathfrak{n})$$ with the projection onto the
second factor. Therefore, if $\phi$ is a weak equivalence, then
$$H^\bullet(\mathrm{Gr}\, \mathfrak{k})=0,$$ and hence
$H^\bullet(\mathrm{Gr}\, \widetilde{\phi}_1)$ is an isomorphism. This
completes the proof of Proposition [23](#pullback){reference-type="ref"
reference="pullback"}.

For each $n \ge 0$, consider the cdga $\Omega_n = (\Omega_n^\sharp, d)$,
where $$\Omega_n^\sharp =
    \mathbb{R}[t_0,\ldots,t_n,dt_0,\ldots,dt_n]/(t_0+\cdots+t_n-1,\; dt_0+\cdots+dt_n),$$
and the differential $d$ is determined by
$$d(t_i)=dt_i, \qquad d(dt_i)=0.$$ This cdga can be identified with the
algebra of polynomial forms on the geometric $n$-simplex $$|\Delta^n|
    =
    \left\{
    (t_0,\dots,t_n)\in \mathbb{R}^{n+1}
    \;\middle|\;
    t_0 \ge 0,\; \dots,\; t_n \ge 0,\;
    \sum_{i=0}^n t_i = 1
    \right\},$$ equipped with the de Rham differential.

Let $\mathfrak{g}\in \mathbf{L_\infty Alg}(R)_{\mathrm{fgp}}$. The
completed tensor product
$$\Omega_n^\sharp \,\widehat{\otimes}_\mathbb{R}\, \mathfrak{g}$$
inherits a natural structure of a curved $L_\infty$ algebra over $R$,
with the induced filtration
$$F^p(\Omega_n^\sharp\,\widehat{\otimes}_\mathbb{R}\, \mathfrak{g}) = \Omega_n^\sharp \,\widehat{\otimes}_\mathbb{R}\, F^p \mathfrak{g},$$
and the induced multi-brackets
$$l_n(\alpha_1 \otimes x_1,\ldots,\alpha_n \otimes x_n)
    =
    \begin{cases}
        1 \otimes l_0, & n=0, \\
        d\alpha_1 \otimes x_1 + (-1)^{|\alpha_1|}\alpha_1 \otimes l_1(x_1), & n=1, \\
        (-1)^{\sum_{i<j} |x_i||\alpha_j|}\, \alpha_1 \cdots \alpha_n \otimes l_n(x_1,\dots,x_n), & n>1.
    \end{cases}\footnote{This construction should not be confused with a completed base change of $\mathfrak{g}$.}$$

We would like
$\Omega_\bullet^\sharp \,\widehat{\otimes}_\mathbb{R}\, \mathfrak{g}$ to
define a simplicial frame for $\mathfrak{g}$. However, the component
$\Omega_n^\sharp \,\widehat{\otimes}_\mathbb{R}\, \mathfrak{g}$ is not
finitely generated for $n \geq 1$. To remedy this, one applies Dupont's
contraction to retract $\Omega_n$ onto the finite-dimensional Whitney
complex $W_n \subset \Omega_n$, which is spanned by the elementary forms
$$\omega_{i_0\cdots i_k}
    =
    k!
    \sum_{j=0}^k (-1)^j\, t_{i_j}\,
    dt_{i_0}\wedge \cdots \widehat{dt_{i_j}} \cdots \wedge dt_{i_k},
    \qquad
    0 \le i_0 < \cdots < i_k \le n.$$

Dupont's contraction takes the form [@dupont1976simplicial] $$s_n
    =
    \sum_{k=0}^{n-1}
    \sum_{0 \le i_0 < \cdots < i_k \le n}
    \omega_{i_0\cdots i_k}\,
    h_n^{i_k}\cdots h_n^{i_0},$$ where the operators $h_n^i$ are defined
by $$h_n^i(\omega)
    =
    \int_0^1 \frac{du}{u}\,
    (\varphi_i(u))^* \iota_{E_i}\omega.$$ Here $\iota_{E_i}$ denotes
contraction with the $i$-th Euler vector field on $|\Delta^n|$ $$E_i
    \coloneqq
    \sum_{j=0}^n (t_j - \delta_{ij})\frac{\partial}{\partial t_j},$$ and
$$\varphi_i \colon [0,1]\times |\Delta^n|
    \longrightarrow |\Delta^n|,
    \qquad
    (u,\mathbf{t})
    \longmapsto
    u\mathbf{t} + (1-u)e_i,$$ is the dilation flow generated by $E_i$,
where $e_i$ denotes the $i$-th vertex of the simplex.

Let $i_n\colon W_n \rightarrow \Omega_n$ denote the canonical inclusion
map. Dupont proved that $$\mathrm{id}- i_n p_n = [d, s_n],$$ where
$p_n \colon \Omega_n \to W_n$ denotes Whitney's projection. In terms of
the contractions $h_n^i$, it can be expressed as $$p_n
    =
    \sum_{k=0}^n (-1)^k
    \sum_{0 \le i_0 < \cdots < i_k \le n}
    \omega_{i_0\cdots i_k}\,
    \varepsilon_{i_k}^n\,
    h^{i_{k-1}}_n \cdots h^{i_0}_n,$$ where
$\varepsilon^n_i\colon \Omega_n \rightarrow \mathbb{R}$ is the
evaluation map at the vertex $e_i$.

::: lem
**Lemma 25**. *The triple $(p_n, i_n, s_n)$ defines a strong deformation
retract of (flat) complexes from $\Omega_\bullet$ to $W_\bullet$. That
is, we have $$\mathrm{id}- i_np_n = [d,s_n],
        \qquad
        \mathrm{id}- p_ni_n = 0,
        \qquad
        s_n^2 = p_ns_n = s_ni_n = 0.$$*
:::

The side conditions are proved in Lemma 3.4 and Theorem 3.11 of
[@getzler2009].

::: lem
**Lemma 26**. *$s_n \otimes \mathrm{id}$ defines a contraction of the
curved $L_\infty$ algebra
$\Omega_n^\sharp \,\widehat{\otimes}_\mathbb{R}\, \mathfrak{g}$ over
$R$.*
:::

See Appendix [6](#sec:htt){reference-type="ref" reference="sec:htt"} for
our notion of contractions of curved $L_\infty$ algebras over $R$.

::: proof
*Proof.* We have
$$(s_n \otimes \mathrm{id}) (d \otimes \mathrm{id}+ \mathrm{id}\otimes l_1) (s_n \otimes \mathrm{id}) = (s_n d s_n) \otimes \mathrm{id}+ s_n^2 \otimes l_1 = s_n \otimes \mathrm{id},$$
and
$$[s_n \otimes \mathrm{id}, (d \otimes \mathrm{id}+ \mathrm{id}\otimes l_1)^2]= [s_n \otimes \mathrm{id}, \mathrm{id}\otimes l_1^2] = 0.$$
Moreover, $s_n \otimes \mathrm{id}$ is ${R^\sharp}$-linear and
$(s_n \otimes \mathrm{id})(1 \otimes l_0) = 0$. ◻
:::

Let
$$\mathbf{i}_n\colon \widehat{\mathrm{Sym}}_{R^\sharp}(W_n^\sharp \otimes_\mathbb{R}\mathfrak{g}[1]) \longrightarrow \widehat{\mathrm{Sym}}_{R^\sharp}(\Omega_n^\sharp \,\widehat{\otimes}_\mathbb{R}\, \mathfrak{g}[1])$$
and
$$\mathbf{p}_n\colon \widehat{\mathrm{Sym}}_{R^\sharp}(\Omega_n^\sharp \,\widehat{\otimes}_\mathbb{R}\, \mathfrak{g}[1]) \longrightarrow \widehat{\mathrm{Sym}}_{R^\sharp}(W_n^\sharp \otimes_\mathbb{R}\mathfrak{g}[1])$$
denote the inclusion and projection of filtered graded cocommutative
coalgebras over ${R^\sharp}$ induced by $i_n \otimes \mathrm{id}$ and
$p_n \otimes \mathrm{id}$. Let
$$\mathbf{s}_n\colon  \widehat{\mathrm{Sym}}_{R^\sharp}(\Omega_n^\sharp \,\widehat{\otimes}_\mathbb{R}\, \mathfrak{g}[1])  \longrightarrow \widehat{\mathrm{Sym}}_{R^\sharp}(\Omega_n^\sharp \,\widehat{\otimes}_\mathbb{R}\, \mathfrak{g}[1])$$
denote the contraction induced by $s_n \otimes \mathrm{id}$, see
[\[bfh\]](#bfh){reference-type="eqref" reference="bfh"}.

Let $\mathbf{d}_n$ denote the curved differential on
$\widehat{\mathrm{Sym}}_{{R^\sharp}}(\Omega_n^\sharp \,\widehat{\otimes}_{\mathbb{R}}\, \mathfrak{g}[1])$
induced by the curvature and unary bracket of
$\Omega_n^\sharp \,\widehat{\otimes}_{\mathbb{R}}\, \mathfrak{g}[1]$.
Let $D_n$ denote the Chevalley--Eilenberg differential of
$\Omega_n^\sharp \,\widehat{\otimes}_{\mathbb{R}}\, \mathfrak{g}[1]$. As
shown in Appendix [6](#sec:htt){reference-type="ref"
reference="sec:htt"}, the perturbation
$$\mu_n \coloneqq D_n - \mathbf{d}_n$$ of the curved complex
$\left(\widehat{\mathrm{Sym}}_{{R^\sharp}}(\Omega_n^\sharp \,\widehat{\otimes}_{\mathbb{R}}\, \mathfrak{g}[1]), \mathbf{d}_n\right)$
induces a curved $L_\infty$ algebra structure on
$$\mathfrak{g}_n \coloneqq W_n^\sharp \otimes_\mathbb{R}\mathfrak{g},$$
with Chevalley--Eilenberg differential
$$D_{\mathfrak{g}_n} \coloneqq \bm{\delta}_n + (\mathbf{p}_\mu)_n \, \mu_n \, \mathbf{i}_n,$$
where $$\bm{\delta}_n = \mathbf{p}_n \, \mathbf{d}_n \, \mathbf{i}_n,
    \qquad
    (\mathbf{p}_\mu)_n = \mathbf{p}_n \, (\mathrm{id}+ \mu_n \mathbf{s}_n)^{-1}.$$
Moreover, we obtain morphisms of curved $L_\infty$ algebras over $R$
$$(\mathbf{i}_\mu)_n\colon \mathfrak{g}_n[1] \longrightarrow \Omega_n^\sharp \,\widehat{\otimes}_{\mathbb{R}}\, \mathfrak{g}[1],
    \qquad
    (\mathbf{p}_\mu)_n\colon \Omega_n^\sharp \,\widehat{\otimes}_{\mathbb{R}}\, \mathfrak{g}[1] \longrightarrow \mathfrak{g}_n[1],$$
which are both weak equivalences. Here,
$$(\mathbf{i}_\mu)_n \coloneqq (\mathrm{id}+ \mathbf{s}_n \mu_n)^{-1}\mathbf{i}_n.$$

::: {#simfr .prop}
**Proposition 27**. *We have a factorization
$$\begin{tikzcd}[row sep=10pt,column sep=40pt]
            & \mathfrak{g}_n \arrow[dr, two heads] & \\
            l_n \mathfrak{g}\arrow[ur, "\sim"] \arrow[rr] && r_n \mathfrak{g}
        \end{tikzcd}$$ of the diagonal morphism
$l_n \mathfrak{g}\rightarrow  r_n \mathfrak{g}$ in
$\mathbf{L_\infty Alg}(R)_{\mathrm{fgp}}$, which is an isomorphism in
degree $0$.*
:::

::: proof
*Proof.* We have the following commutative diagram
$$\begin{tikzcd}[row sep=20pt, column sep=60pt]
            & \mathfrak{g}_n = W_n^\sharp \otimes_\mathbb{R}\mathfrak{g}
            \arrow[dr, two heads]
            & \\
            l_n \mathfrak{g}=\mathfrak{g}
            \arrow[ur, "\sim"]
            \arrow[rr]
            &&
            r_n \mathfrak{g}=\mathfrak{g}^{\oplus (n+1)}
        \end{tikzcd}$$ of curved $L_\infty$-algebras over $R$. The weak
equivalence
$$\mathfrak{g}\longrightarrow W_n^\sharp \otimes_\mathbb{R}\mathfrak{g}$$
is given by the composition
$$\mathfrak{g}\xlongrightarrow{\iota_n} \Omega_n^\sharp \,\widehat{\otimes}_{\mathbb{R}}\, \mathfrak{g}
        \xlongrightarrow{(\mathbf{p}_\mu)_n}
        W_n^\sharp \otimes_\mathbb{R}\mathfrak{g},$$ where the first
morphism $\iota_n$ is the canonical inclusion of $\mathfrak{g}$, which
is a strict weak equivalence since $\Omega_n$ is acyclic. The morphism
$$W_n^\sharp \otimes_\mathbb{R}\mathfrak{g}\longrightarrow \mathfrak{g}^{\oplus (n+1)}$$
is given by the composition $$W_n^\sharp \otimes_\mathbb{R}\mathfrak{g}
        \xlongrightarrow{(\mathbf{i}_\mu)_n}
        \Omega_n^\sharp \,\widehat{\otimes}_{\mathbb{R}}\, \mathfrak{g}
        \xlongrightarrow{\mathrm{ev}_n}
        \mathfrak{g}^{\oplus (n+1)},$$ where the second morphism
$\mathrm{ev}_n$ is induced by the evaluation maps at the vertices of
$|\Delta^n|$ on $\Omega_n^\sharp$, hence a strict fibration. Recall that
the linear component of $(\mathbf{i}_\mu)_n$ is given by the canonical
inclusion $$i_n \otimes \mathrm{id}:
        W_n^\sharp \otimes_\mathbb{R}\mathfrak{g}
        \longrightarrow
        \Omega_n^\sharp \,\widehat{\otimes}_{\mathbb{R}}\, \mathfrak{g};$$
see Proposition [44](#thht){reference-type="ref" reference="thht"}. It
follows that the linear component of the composite
$W_n^\sharp \otimes_\mathbb{R}\mathfrak{g}\rightarrow \mathfrak{g}^{\oplus (n+1)}$
is precisely the map induced by the evaluation maps at the vertices of
$|\Delta^n|$ on $W_n^\sharp$, and is therefore surjective.

The diagram commutes since
$$(\mathbf{i}_\mu)_n \circ (\mathbf{p}_\mu)_n = \mathrm{id}-[D_n, (\mathbf{s}_\mu)_n]$$
where
$(\mathbf{s}_\mu)_n = (\mathrm{id}+ \mathbf{s}_n \mu)^{-1}\mathbf{s}_n = \mathbf{s}_n (\mathrm{id}+ \mu \mathbf{s}_n)^{-1}$,
and
$$\mathrm{ev}_n \circ [D_n, (\mathbf{s}_\mu)_n] \circ \iota_n  = 0,$$
where we use
$\mathbf{s}_n \circ \iota_n = \mathrm{ev}_n \circ \mathbf{s}_n = 0$.
Indeed, $\mathbf{s}_n \circ \iota_n = 0$ because $h^i_n(1)=0$, while
$\mathrm{ev}_n \circ \mathbf{s}_n = 0$ because
$\varepsilon_{i}^n h_n^i = 0$ and $h_n^i h_n^j + h_n^j h_n^i = 0$. ◻
:::

::: prop
**Proposition 28**. *The category
$\mathbf{L_\infty Alg}(R_\mathcal{M})_{\mathrm{fgp}}$ of finitely
generated projective curved $L_\infty$ algebras over
$R_\mathcal{M}=(\widehat{\Omega}_\mathcal{M}(M), D_\mathcal{M})$ is a
CFO with a framing.*
:::

::: defn
**Definition 29**. *A morphism
$\phi=(\mathrm{id}, \phi^\sharp)\colon B\mathfrak{g}=(\mathcal{M}, \mathfrak{g}) \rightarrow B\mathfrak{h}=(\mathcal{M}, \mathfrak{h})$
in $\mathbf{L_\infty Sp}(\mathcal{M})$ is a *fibration* if
$\phi^\sharp_M\colon \mathfrak{g}[1](M) \rightarrow \mathfrak{h}[1](M)$
is surjective.*
:::

A functor between CFOs is *exact* if it preserves fibrations, trivial
fibrations, the terminal object, and pullbacks along fibrations.

::: thm
**Theorem 30**. *The category $\mathbf{L_\infty Sp}(\mathcal{M})$ of
curved $L_\infty$ spaces over a dg manifold $\mathcal{M}$ is a CFO with
a framing. Moreover, the global sections functor
$$\Gamma\colon \mathbf{L_\infty Sp}(\mathcal{M}) \longrightarrow \mathbf{L_\infty Alg}(R_\mathcal{M})_{\mathrm{fgp}}$$
is a fully faithful exact functor.*
:::

::: proof
*Proof.* By Proposition [18](#gsf){reference-type="ref"
reference="gsf"}, we may use the global sections functor $\Gamma$ to
identify $\mathbf{L_\infty Sp}(\mathcal{M})$ with the full subcategory
$\mathbf{L_\infty Alg}(R_\mathcal{M})_{\mathrm{vec}}$ of
$\mathbf{L_\infty Alg}(R_\mathcal{M})_{\mathrm{fgp}}$. It is clear that
the simplicial frame construction of Proposition
[27](#simfr){reference-type="ref" reference="simfr"} preserves
$\mathbf{L_\infty Alg}(R_\mathcal{M})_{\mathrm{vec}}$. By Proposition
[15](#kerOmega){reference-type="ref" reference="kerOmega"}, the same is
true for the pullback construction of Proposition
[23](#pullback){reference-type="ref" reference="pullback"}. ◻
:::

## Homological perturbation of curved complexes

We begin by fixing our notion of curved complexes and their morphisms.

::: defn
**Definition 31**. *A *curved complex* is a filtered graded vector space
$V$ equipped with a degree $1$ linear map
$$d\colon V \longrightarrow V$$ that is compatible with the filtration
and satisfies $$d^2(x) \in F^{p+1}V \quad \text{for all } x \in F^pV.$$
We call the linear map $r \coloneqq d^2$ the *curvature* of $(V,d)$.*

*A *morphism* between curved complexes $(V_1, d_1)$ and $(V_2, d_2)$ is
a degree $0$ linear map $$f\colon V_1 \longrightarrow V_2$$ that is
compatible with the filtration and satisfies
$$(f d_1 - d_2f)(x)  \in F^{p+1}V_2 \quad \text{for all } x \in F^pV_1.$$*
:::

Let $(V,d)$ be a curved complex with curvature $r$.

::: defn
**Definition 32**. *A *gauge* of $(V,d)$ is a linear map of degree $-1$
$$g \colon V \longrightarrow V$$ compatible with the filtration, such
that $$g^2 = [g,r] = 0
        \quad \text{and} \quad
        [d,g] \text{~is~semisimple}.$$ A gauge $g$ is called
*idempotent* if $\operatorname{spec}([d,g])=\{0,1\}$.*
:::

The *Green's operator* $G \colon V \to V$ associated to a gauge $g$ is
defined by $$G(v) = \begin{cases}
        0 & v \in V_0, \\
        \lambda^{-1} v & v \in V_\lambda, \quad \lambda \neq 0,
    \end{cases}$$ where
$V_\lambda \coloneqq \{x \in V \colon [d,g](x) = \lambda x\}$. It
satisfies $$[d, G] = [g, G] = [r,G] = 0,$$ and
$$[d,g]G(v) = \begin{cases}
        0 & v \in V_0 ,\\
        v & v \in V_\lambda, \quad  \lambda \neq 0.
    \end{cases}$$ Consequently, the operator $$h(g)\coloneqq gG = Gg$$
defines an idempotent gauge, which we call the *harmonization* of $g$.
One has $$h(g) d h(g) = gGdgG = gG[d,g]G-gGgdG = gG - g^2 GdG = h(g),$$
where we use $g^2= 0$ and $[g,G]=0$.

::: defn
**Definition 33**. *A *(homotopy) contraction* of $(V,d)$ is a map of
degree $-1$ $$h \colon V \longrightarrow V$$ compatible with the
filtration, such that $$h^2 = [h,r] = 0
        \quad \text{and} \quad
        hdh = h.$$*
:::

A direct computation shows that $$[d,h]^2= [d,h].$$ Therefore, every
contraction defines an idempotent gauge, and every gauge gives rise to a
contraction after harmonization.

::: defn
**Definition 34**. *A *strong deformation retract* of curved complexes
from $(V,d)$ to $(H, \delta)$ consists of morphisms of curved complexes
$$p \colon (V,d) \longrightarrow (H, \delta),
        \qquad
        i \colon (H,\delta) \longrightarrow (V,d),$$ and a map of degree
$-1$ $$h \colon V \longrightarrow V$$ compatible with the filtration,
such that $$\begin{equation*}
            \mathrm{id}- ip = [d,h],
            \qquad
            \mathrm{id}- pi = 0,
            \qquad
            h^2 = ph = hi = 0.
\end{equation*}$$*
:::

Every strong deformation retract is determined by a contraction up to
isomorphism. Indeed, given a contraction $h$, the idempotent operator
$[d,h]$ defines a splitting of $V$ into
$$V = \ker([d,h]) \oplus \operatorname{im}([d,h]).$$ Setting
$H = \ker([d,h])$, we obtain canonical morphisms of curved complexes
$$i \colon (H, \delta) \longrightarrow (V,d), \qquad p \colon (V,d) \longrightarrow (H, \delta),$$
given respectively by the inclusion and projection, where
$\delta = pdi$.

By definition, $i$ and $p$ satisfy $$\mathrm{id}- ip = [d,h],\quad
    \mathrm{id}- pi = 0.$$ Composing with $h$ yields
$$h = hip + hdh = iph + hdh.$$ Since $hdh = h$ and $pi = \mathrm{id}$,
this is equivalent to the side conditions $$ph = hi = 0.$$

::: rmk
**Remark 35**. *It is possible to drop the axiom $[h,r]=0$ from the
definition of a contraction. In this case, the operator $$[d,h]-hrh$$ is
idempotent. Indeed, using the identity $hdh=h$, one computes
$$[d,h]^2 = [d,h] + hrh,$$ and $$([d,h]-hrh)^2
        = [d,h] + hrh - 2hrh
        = [d,h]-hrh.$$*

*Correspondingly, the first identity in the definition of a strong
deformation retract must be modified to
$$\mathrm{id}- ip = [d,h] - hrh.$$ This version of a strong deformation
retract is considered in [@amorim2022inverse] to study homotopy
transfers of curved $L_\infty$ spaces over manifolds.*
:::

::: defn
**Definition 36**. *A *perturbation* of $(V,d)$ is a map of degree $1$
$$\mu \colon F^\bullet V \longrightarrow F^{\bullet + 1} V$$ such that
$$[d, r_\mu]=0,$$ where $r_\mu\coloneqq(d+\mu)^2$.*
:::

Since the filtration on $V$ is complete, the operators
$\mathrm{id}+h\mu$ and $\mathrm{id}+\mu h$ are invertible, with inverses
given by the convergent formal series $$(\mathrm{id}+h\mu)^{-1}
    =
    \sum_{n=0}^{\infty}(-h\mu)^n,
    \qquad
    %=
    %\id-h\mu+h\mu h\mu-\cdots,
    %\]
    %and
    %\[
    (\mathrm{id}+\mu h)^{-1}
    =
    \sum_{n=0}^{\infty}(-\mu h)^n.
    %=
    %\id-\mu h+\mu h\mu h-\cdots.$$ In particular, one has
$$(\mathrm{id}+\mu h)^{-1}\mu
    =
    \mu(\mathrm{id}+h\mu)^{-1},
    \quad
    h(\mathrm{id}+\mu h)^{-1}
    =
    (\mathrm{id}+h\mu)^{-1}h,$$ and
$$(\mathrm{id}+\mu h)^{-1}(\mathrm{id}+ h \mu)^{-1} = (\mathrm{id}+\mu h)^{-1} + (\mathrm{id}+ h \mu)^{-1} - \mathrm{id}.$$

::: {#sdrh .lem}
**Lemma 37**. *Let $h$ be a contraction of $(V,d)$, and let $\mu$ be a
perturbation of $(V,d)$ satisfying $$[h,r_\mu]=0.$$ Set
$$d_\mu \coloneqq d+\mu,
        \qquad
        h_\mu \coloneqq (\mathrm{id}+h\mu)^{-1}h.$$ Then $h_\mu$ is a
contraction of the perturbed curved complex $(V,d_\mu)$.*
:::

::: proof
*Proof.* We have
$h_\mu^2 = (\mathrm{id}+ h\mu)^{-1} h^2 (\mathrm{id}+ \mu h)^{-1} = 0$,
and $$\begin{align*}
            h_\mu d_\mu h_\mu &= (\mathrm{id}+ h\mu)^{-1} h(d+\mu) (\mathrm{id}+ h\mu)^{-1} h \\
            &= (\mathrm{id}+ h\mu)^{-1}h (d+\mu) h(\mathrm{id}+ \mu h)^{-1} \\
            &= (\mathrm{id}+ h\mu)^{-1}(h+h\mu h)(\mathrm{id}+ \mu h)^{-1} \\
            &= (\mathrm{id}+ h\mu)^{-2}(h+h\mu h) \\
            %&=(\id+ h\mu)^{-1}h \\
            &= h_\mu,
\end{align*}$$ Finally, note that
$$[\mu, r_\mu] = [d_\mu, r_\mu] = [d_\mu, d_\mu^2]=0.$$ It then follows
from $[h, r_\mu]=0$ that $[h_\mu, r_\mu]=0$. ◻
:::

::: prop
**Proposition 38**. *Let $h$ and $\mu$ be as in Lemma
[37](#sdrh){reference-type="ref" reference="sdrh"}, and set
$$\begin{align*}
            i_\mu \coloneqq (\mathrm{id}+ h\mu)^{-1} i, 
            \qquad
            p_\mu \coloneqq p(\mathrm{id}+ \mu h)^{-1},
            \qquad 
            \delta_\mu \coloneqq \delta + p_\mu \mu i.
\end{align*}$$ Then the triple $(p_\mu,i_\mu,h_\mu)$ defines a strong
deformation retract of curved complexes from $(V,d_\mu)$ to
$(H,\delta_\mu)$.*
:::

::: proof
*Proof.* It suffices to show that $p_\mu$ and $i_\mu$ are the correct
projection and inclusion and $\delta_\mu$ is the correct differential
induced by them. We have $$\begin{align*}
            p_\mu i_\mu &= p(\mathrm{id}+\mu h)^{-1}(\mathrm{id}+ h \mu)^{-1} i \\
            & =p (\mathrm{id}+\mu h)^{-1}i + p(\mathrm{id}+ h \mu)^{-1}i  - pi\\
            &= \mathrm{id},
\end{align*}$$ where we use $pi = \mathrm{id}$ and the side conditions
$hi=ph=0$. On the other hand, $$\begin{align*}
            (\mathrm{id}+ h \mu)i_\mu p_\mu (\mathrm{id}+\mu h)= ip =\mathrm{id}- (dh+hd),
\end{align*}$$ and $$\begin{align*}
            (\mathrm{id}+ h \mu)(d_\mu h_\mu + h_\mu d_\mu) (\mathrm{id}+\mu h) &= (\mathrm{id}+ h \mu) d_\mu h + h d_\mu (\mathrm{id}+\mu h) \\
            &= (\mathrm{id}+ h \mu) (\mathrm{id}+\mu h) + dh+hd - \mathrm{id},
\end{align*}$$ where we use $d \mu + \mu d + \mu^2 = r_\mu -r$ and
$h (r_\mu-r) h = [h,r_\mu-r]h=0$. Since $\mathrm{id}+\mu h$ and
$\mathrm{id}+ h\mu$ are invertible, it follows that
$$i_\mu p_\mu + d_\mu h_\mu + h_\mu d_\mu = \mathrm{id}.$$

Finally, we compute that
$$(\mathrm{id}+\mu h)d(\mathrm{id}+h\mu) = d + \mu h d + d h \mu + \mu h \mu,$$
and $$\begin{align*}
            &(\mathrm{id}+\mu h)^{-1}d_\mu(\mathrm{id}+h\mu)^{-1} = d - (\mathrm{id}+\mu h)^{-1}(\mu h d + d h \mu + \mu h \mu -\mu)(\mathrm{id}+h\mu)^{-1} \\
            &= d - (\mathrm{id}+\mu h)^{-1}(\mu h d + d h \mu + 2 \mu h \mu)(\mathrm{id}+h\mu)^{-1} + (\mathrm{id}+\mu h)^{-1}\mu.
\end{align*}$$ Thus,
$$\delta_\mu  - p_\mu d_\mu i_\mu =p_\mu (\mu h d + d h \mu + 2 \mu h \mu)i_\mu.$$

Note that $$\begin{align*}
            \mu h d + d h \mu &= \mu [d,h] + [d, h]\mu - \mu d h - h d \mu \\
            &=2 \mu - \mu ip - ip \mu -\mu d h - h d \mu,
\end{align*}$$ where we use $\mathrm{id}-ip =[d,h]$, and
$$p_\mu h= 0, \qquad h i_\mu= 0, \qquad p_\mu i = p i_\mu  =  \mathrm{id},$$
where we use the side conditions $h^2 = ph = hi =0$. Therefore,
$$p_\mu (\mu h d + d h \mu + 2 \mu h \mu )i_\mu = 2 p_\mu \mu i_\mu - p \mu i_\mu - p_\mu \mu i + 2 p_\mu \mu h \mu i_\mu = 0,$$
where we use $p_\mu = p - p_\mu \mu h$ and $i_\mu = i - h \mu i_\mu$. ◻
:::

In particular, one may consider perturbations $\mu$ such that $r_\mu=0$,
that is, such that $d_\mu$ (and hence $\delta_\mu$) is a differential.
In this case, the conditions $[d,r_\mu]=[h,r_\mu]=0$ on $\mu$ are
trivially satisfied.

## Homotopy transfer of curved $L_\infty$ algebras

Let $\mathfrak{g}$ be a curved $L_\infty$ algebra over
$R=({R^\sharp}, D_R)$.

::: defn
**Definition 39**. *A *contraction* of $\mathfrak{g}$ is an
${R^\sharp}$-linear contraction $h$ of the curved complex
$(\mathfrak{g}[1], l_1)$ such that $$h(l_0)=0.$$*
:::

Let $h$ be a contraction of $\mathfrak{g}$. Let $L_h$ denote the degree
$-1$ ${R^\sharp}$-linear coderivation on
$\widehat{\mathrm{Sym}}_{R^\sharp}(\mathfrak{g}[1])$ extending
$h\colon \mathfrak{g}[1] \to \mathfrak{g}[1]$. Explicitly, $L_h$ is
given by $$L_h(x_1 \odot \cdots \odot x_n)
    =
    \sum_{k=1}^n (-1)^{\sum_{i=1}^{k-1}|x_i|}\,
    x_1 \odot \cdots \odot h(x_k)\odot \cdots \odot x_n.$$ Consider the
operator $\mathbf{d}$ on
$\widehat{\mathrm{Sym}}_{R^\sharp}(\mathfrak{g}[1])$ defined by
$$\begin{align*}
        &\mathbf{d}(r)= D_R(r) + (-1)^{|r|}rl_0, \\
        &\mathbf{d}(x_1 \odot \cdots \odot x_n)
        = l_0 \odot x_1 \odot \cdots \odot x_n + \sum_{k=1}^n (-1)^{\sum_{i=1}^{k-1}|x_i|}\,
        x_1 \odot \cdots \odot l_1(x_k)\odot \cdots \odot x_n.
\end{align*}$$ Equipped with $\mathbf{d}$,
$\widehat{\mathrm{Sym}}_{R^\sharp}(\mathfrak{g}[1])$ becomes a curved
complex with ${R^\sharp}$-linear curvature
$$\mathbf{r}\coloneqq L_{r},$$ where $r \coloneqq -l_2(l_0, \cdot)$ is
the ${R^\sharp}$-linear curvature of $(\mathfrak{g},l_1)$.

::: lem
**Lemma 40**. *$L_h$ is an ${R^\sharp}$-linear gauge of the curved
complex
$(\widehat{\mathrm{Sym}}_{R^\sharp}(\mathfrak{g}[1]), \mathbf{d})$.*
:::

::: proof
*Proof.* We have
$L_h^2 = \frac{1}{2}[L_h,L_h] = \frac{1}{2}L_{[h,h]} = 0$, and
$[L_h, \mathbf{r}]=L_{[h,r]}=0$. The semi-simplicity of
$[\mathbf{d}, L_h]$ follows from the semi-simplicity of $[l_1,h]$ and
the computation $$\begin{equation}
\label{ll1h}
        [\mathbf{d}, L_h] =  L_{[l_1,h]},
\end{equation}$$ where we use the assumption $h(l_0)=0$. ◻
:::

Let $\mathfrak{h}[1] \coloneqq \ker [l_1,h]$. Let
$p\colon \mathfrak{g}[1] \rightarrow \mathfrak{h}[1]$ and
$i\colon \mathfrak{h}[1] \rightarrow \mathfrak{g}[1]$ denote the
projection and inclusion, respectively. Let
$$\mathbf{p}\colon  \widehat{\mathrm{Sym}}_{R^\sharp}(\mathfrak{g}[1]) \rightarrow  \widehat{\mathrm{Sym}}_{R^\sharp}(\mathfrak{h}[1]), \qquad \mathbf{i}\colon \widehat{\mathrm{Sym}}_{R^\sharp}(\mathfrak{h}[1]) \rightarrow   \widehat{\mathrm{Sym}}_{R^\sharp}(\mathfrak{g}[1])$$
denote the projection and inclusion of filtered graded cocommutative
coalgebras over ${R^\sharp}$ induced by $p$ and $i$.

Let $G$ denote Green's operator of $[\mathbf{d}, L_h]$. Berglund derived
an explicit formula for $G$, which he formulated in terms of symmetric
thick maps [@berglund2014homological].

::: {#berg .lem}
**Lemma 41**. *For $n>0$,
$$G\big|_{\mathrm{Sym}_{R^\sharp}^n(\mathfrak{g}[1])} =\frac{1}{n} \sum_{\epsilon \in \{0,1\}^n} \binom{n-1}{|\epsilon|}^{-1} (ip)^{\epsilon_1} \otimes \cdots \otimes (ip)^{\epsilon_n},$$
with the convention $\binom{n-1}{n}^{-1}=0$.*
:::

::: proof
*Proof.* We need to show that
$$[\mathbf{d},L_h]G\big|_{\mathrm{Sym}_{R^\sharp}^n(\mathfrak{g}[1])} =\mathrm{id}^{\otimes n}-(ip)^{\otimes n}.$$
Using [\[ll1h\]](#ll1h){reference-type="eqref" reference="ll1h"} and the
identity $[l_1,h]=\mathrm{id}-ip$, this is equivalent to proving
$$\left(\sum_{i+1+j=n}
    \mathrm{id}^{\otimes i}\otimes(\mathrm{id}-ip)\otimes\mathrm{id}^{\otimes j}\right)
    \left(
    \frac{1}{n}
    \sum_{\epsilon\in\{0,1\}^n}
    \binom{n-1}{|\epsilon|}^{-1}
    (ip)^{\epsilon_1}\otimes\cdots\otimes(ip)^{\epsilon_n}
    \right)
    =
    \mathrm{id}^{\otimes n}-(ip)^{\otimes n}.$$

The left-hand side can be simplified as $$\begin{align*}
        \mathrm{LHS}
        &=
        \frac1n
        \sum_{j=1}^n
        \sum_{\substack{\epsilon\in\{0,1\}^n \\ \epsilon_j=0}}
        \binom{n-1}{|\epsilon|}^{-1}
        (ip)^{\epsilon_1}\otimes\cdots\otimes(\mathrm{id}-ip)\otimes\cdots\otimes(ip)^{\epsilon_n}\\
        &=
        \frac1n
        \sum_{j=1}^n
        \sum_{\epsilon\in\{0,1\}^n}
        (-1)^{\epsilon_j}
        \binom{n-1}{|\epsilon|-\epsilon_j}^{-1}
        (ip)^{\epsilon_1}\otimes\cdots\otimes(ip)^{\epsilon_n}\\
        &=
        \sum_{\epsilon\in\{0,1\}^n}
        c_\epsilon\,
        (ip)^{\epsilon_1}\otimes\cdots\otimes(ip)^{\epsilon_n},
\end{align*}$$ where $$c_\epsilon
    \coloneqq
    \frac1n
    \sum_{j=1}^n
    (-1)^{\epsilon_j}
    \binom{n-1}{|\epsilon|-\epsilon_j}^{-1}.$$ Since there are
$n-|\epsilon|$ indices with $\epsilon_j=0$ and $|\epsilon|$ indices with
$\epsilon_j=1$, $$c_\epsilon
    =
    \frac1n
    \left(
    \frac{n-|\epsilon|}{\binom{n-1}{|\epsilon|}}
    -
    \frac{|\epsilon|}{\binom{n-1}{|\epsilon|-1}}
    \right).$$ Thus $c_\epsilon$ depends only on $|\epsilon|$; we denote
it by $c_{|\epsilon|}$.

For $0<|\epsilon|<n$, $$\frac{n-|\epsilon|}{\binom{n-1}{|\epsilon|}}
    =
    \frac{|\epsilon|!(n-|\epsilon|)!}{(n-1)!}
    =
    \frac{|\epsilon|}{\binom{n-1}{|\epsilon|-1}},$$ and hence
$c_{|\epsilon|}=0$. For the remaining cases, we have
$$c_0=\binom{n-1}{0}^{-1}=1,
    \qquad
    c_n=-\binom{n-1}{n-1}^{-1}=-1,$$ which completes the proof. ◻
:::

Let $\mathbf{h}$ be the harmonization of $L_h$. That is,
$$\begin{equation}
\label{bfh}
        \mathbf{h}= L_h G = G L_h.
\end{equation}$$ Comparing with Proposition 5.1 of
[@berglund2014homological], one sees immediately that
[\[bfh\]](#bfh){reference-type="eqref" reference="bfh"} coincides with
the symmetrized tensor trick homotopy constructed by Berglund.[^3]

Now consider the operator $\bm{\delta}$ on
$\widehat{\mathrm{Sym}}_{R^\sharp}(\mathfrak{h}[1])$ defined by
$$\begin{align*}
        &\bm{\delta}(r)= D_R(r) + (-1)^{|r|}r p(l_0), \\
        &\bm{\delta}(x_1 \odot \cdots \odot x_n)
        = p(l_0) \odot x_1 \odot \cdots \odot x_n + \sum_{k=1}^n (-1)^{\sum_{i=1}^{k-1}|x_i|}\,
        x_1 \odot \cdots \odot pl_1i(x_k)\odot \cdots \odot x_n.
\end{align*}$$ Likewise, equipped with $\bm{\delta}$,
$\widehat{\mathrm{Sym}}_{R^\sharp}(\mathfrak{h}[1])$ becomes a curved
complex with curvature $\mathbf{p}\mathbf{r}\mathbf{i}$. Indeed, this
follows from the computation
$$pl_1 ip l_1 i = p l_1(\mathrm{id}- [l_1, h])l_1 i = pri - p(rhl_1+l_1hr)i = pri - pr(\mathrm{id}-ip)i = pri,$$
where we use $[l_1, r]=[h,r]=0$.

::: lem
**Lemma 42**. *The triple $(\mathbf{p}, \mathbf{i}, \mathbf{h})$ defines
a strong deformation retract of curved complexes from
$(\widehat{\mathrm{Sym}}_{R^\sharp}(\mathfrak{g}[1]), \mathbf{d})$ to
$(\widehat{\mathrm{Sym}}_{R^\sharp}(\mathfrak{h}[1]), \bm{\delta})$.*
:::

::: proof
*Proof.* It suffices to verify that $\mathbf{p}$ and $\mathbf{i}$ are
the correct projection and inclusion induced by $\mathbf{h}$, and that
$\bm{\delta}$ is the differential induced by the data. The identities
$\mathrm{id}- pi =0$ and $\delta = p d i$ immediately imply that
$\mathrm{id}- \mathbf{p}\mathbf{i}= 0$ and
$\bm{\delta}= \mathbf{p}\mathbf{d}\mathbf{i}$. The identity
$\mathrm{id}- \mathbf{i}\mathbf{p}= [\mathbf{d}, \mathbf{h}]$ follows
from Lemma [41](#berg){reference-type="ref" reference="berg"}. Indeed,
$$[\mathbf{d}, \mathbf{h}] = [\mathbf{d}, L_h] G = \mathrm{id}- \mathbf{i}\mathbf{p},$$
where we use $[\mathbf{d}, G]=0$ and $[\mathbf{h}, G]=0$. ◻
:::

Now define $$\mu \coloneqq D_\mathfrak{g}- \mathbf{d}.$$ $\mu$ is
explicitly given by $$\begin{align*}
        \mu(x_1 \odot \cdots \odot x_n)=
        \sum_{\sigma \in \Sigma_n} \sum_{k=2}^n 
        \frac{\epsilon(\sigma)}{k!(n-k)!}
        l_k(x_{\sigma(1)},\dots,x_{\sigma(k)})
        \odot x_{\sigma(k+1)} \odot \cdots \odot x_{\sigma(n)}.
\end{align*}$$ Note that $\mu$ increases the filtration degree. Thus, it
defines an ${R^\sharp}$-linear perturbation of $\mathbf{d}$. The
corresponding perturbed projection, inclusion, and contraction are given
by $$\begin{align*}
        \mathbf{p}_\mu \coloneqq \mathbf{p}\,(\mathrm{id}+ \mu \mathbf{h})^{-1}, \quad
        \mathbf{i}_\mu \coloneqq (\mathrm{id}+ \mathbf{h}\mu)^{-1}\mathbf{i}, \quad
        \mathbf{h}_\mu \coloneqq (\mathrm{id}+ \mathbf{h}\mu)^{-1}\mathbf{h}.
\end{align*}$$ By homological perturbation theory, the triple
$(\mathbf{p}_\mu, \mathbf{i}_\mu, \mathbf{h}_\mu)$ defines a strong
deformation retract of curved complexes from
$(\widehat{\mathrm{Sym}}_{R^\sharp}(\mathfrak{g}[1]), D_\mathfrak{g})$
to
$(\widehat{\mathrm{Sym}}_{R^\sharp}(\mathfrak{h}[1]), D_\mathfrak{h})$,
where
$$D_\mathfrak{h}\coloneqq \bm{\delta}+ \mathbf{p}_\mu \mu \mathbf{i}.$$

::: {#bergetz .lem}
**Lemma 43**. *The filtration-preserving ${R^\sharp}$-linear maps
$$\mathbf{p}_\mu\colon\widehat{\mathrm{Sym}}_{R^\sharp}(\mathfrak{g}[1]) \longrightarrow \widehat{\mathrm{Sym}}_{R^\sharp}(\mathfrak{h}[1])
        \qquad
        \mathbf{i}_\mu\colon\widehat{\mathrm{Sym}}_{R^\sharp}(\mathfrak{h}[1]) \longrightarrow \widehat{\mathrm{Sym}}_{R^\sharp}(\mathfrak{g}[1])$$
are morphisms of filtered graded cocommutative coalgebras over
${R^\sharp}$. Moreover, the differential $D_\mathfrak{h}$ is a
coderivation of $\widehat{\mathrm{Sym}}_{R^\sharp}(\mathfrak{h}[1])$
compatible with $D_R$.*
:::

The proof follows [@berglund2014homological]; see also Theorem 4.1 in
[@getzler2025higherholonomycurvedlinftyalgebras].

::: proof
*Proof.* Using the side conditions $h^2=ph = hi=0$, the fact that $L_h$
is a coderivation, and [\[bfh\]](#bfh){reference-type="eqref"
reference="bfh"}, one easily obtains
$$(\mathbf{h}\otimes \mathbf{h})\,\Delta \mathbf{h}= (\mathbf{p}\otimes \mathbf{h})\,\Delta \mathbf{h}= (\mathbf{h}\otimes \mathbf{p})\,\Delta \mathbf{h}= (\mathbf{p}\otimes \mathbf{p})\,\Delta \mathbf{h}= 0.$$
It follows that $$\begin{align*}
            (\mathbf{p}_\mu \otimes \mathbf{p}_\mu)\,\Delta \mathbf{h}= ((\mathbf{p}- \mathbf{p}_\mu \mu \mathbf{h}) \otimes (\mathbf{p}- \mathbf{p}_\mu \mu \mathbf{h}))\,\Delta \mathbf{h}= 0,
\end{align*}$$ and
$$(\mathbf{p}_\mu \otimes \mathbf{p}_\mu)\,\Delta [D_\mathfrak{g}, \mathbf{h}]=(\mathbf{p}_\mu \otimes \mathbf{p}_\mu)(\mathrm{id}\otimes D_\mathfrak{g}+ D_\mathfrak{g}\otimes \mathrm{id}) \Delta  \mathbf{h}= (\mathrm{id}\otimes D_\mathfrak{h}+ D_\mathfrak{h}\otimes \mathrm{id}) (\mathbf{p}_\mu \otimes \mathbf{p}_\mu) \Delta  \mathbf{h}= 0.$$
On the other hand,
$$[D_\mathfrak{g}, \mathbf{h}] = [\mathbf{d}+ \mu, \mathbf{h}] = \mathrm{id}- \mathbf{i}\mathbf{p}+ [\mu, \mathbf{h}].$$
We then have $$\begin{align*}
            (\mathbf{p}_\mu \otimes \mathbf{p}_\mu) \Delta &= (\mathbf{p}_\mu \otimes \mathbf{p}_\mu) \Delta \left([D_\mathfrak{g}, \mathbf{h}]  + \mathbf{i}\mathbf{p}- [\mu, \mathbf{h}]\right) \\
            &= (\mathbf{p}_\mu \mathbf{i}\otimes \mathbf{p}_\mu \mathbf{i}) \Delta \mathbf{p}- (\mathbf{p}_\mu \otimes \mathbf{p}_\mu) \Delta \mu \mathbf{h}\\
            &=\Delta \mathbf{p}- (\mathbf{p}_\mu \otimes \mathbf{p}_\mu) \Delta \mu \mathbf{h},
\end{align*}$$ where we use
$\mathbf{p}_\mu \mathbf{i}=  \mathbf{p}\mathbf{i}=\mathrm{id}$. Since
$\mathrm{id}+ \mu \mathbf{h}$ is invertible, we obtain
$$(\mathbf{p}_\mu \otimes \mathbf{p}_\mu)\,\Delta = \Delta \mathbf{p}_\mu.$$

Using Lemma [41](#berg){reference-type="ref" reference="berg"} and the
side conditions $ph = hi = 0$, one has $$\begin{align*}
            \mathbf{h}\mu \mathbf{i}\mathbf{p}(x_1 \odot \cdots \odot x_n) &= \sum_{\sigma \in \Sigma_n} \sum_{k=2}^n \frac{\epsilon(\sigma)}{k!(n-k)!}
            \frac{1}{n-k+1} \sum_{\substack{\epsilon \in \{0,1\}^{n-k+1}\\ \epsilon_1 =0}} \binom{n-k}{|\epsilon|}^{-1} \\
            &
            hl_k(ip(x_{\sigma(1)}),\dots,ip(x_{\sigma(k)}))
            \odot ip(x_{\sigma(k+1)}) \odot \cdots \odot ip(x_{\sigma(n)}).
\end{align*}$$ Note that $$\frac{1}{m}
        \sum_{\substack{\epsilon\in\{0,1\}^{m}\\ \epsilon_1=0}}
        \binom{m-1}{|\epsilon|}^{-1}
        =
        \frac{1}{m}
        \sum_{r=0}^{m-1}
        \binom{m-1}{r}\binom{m-1}{r}^{-1}
        =
        \frac{1}{m}\sum_{r=0}^{m-1}1
        =1.$$ Hence,
$\mathbf{h}\mu \mathbf{i}\mathbf{p}= L_h \mu \mathbf{i}\mathbf{p}$.

For $k > 1$, a similar computation yields
$$(\mathbf{h}\mu)^k \mathbf{i}\mathbf{p}= \frac{1}{k!} (L_h \mu)^k\mathbf{i}\mathbf{p}= \frac{1}{k!}  [L_h, \mu]^k\mathbf{i}\mathbf{p}.$$
Since $[L_h, \mu]$ is a coderivation, we have
$$\Delta (\mathbf{h}\mu)^k \mathbf{i}\mathbf{p}= \frac{1}{k!} \sum_{p=0}^k \binom{k}{p}\left((L_h \mu)^p \otimes (L_h \mu)^{k-p} \right) \Delta \mathbf{i}\mathbf{p}= \sum_{p+q=k}\left((\mathbf{h}\mu)^p \otimes (\mathbf{h}\mu)^q \right) \Delta \mathbf{i}\mathbf{p}.$$
Therefore, $$\begin{align*}
            \Delta\mathbf{i}_\mu
            &=\Delta(\mathrm{id}+\mathbf{h}\mu)^{-1} \mathbf{i}\mathbf{p}\mathbf{i}\\
            &= \left((\mathrm{id}+\mathbf{h}\mu)^{-1}\mathbf{i}\otimes (\mathrm{id}+\mathbf{h}\mu)^{-1}\mathbf{i}\right) \Delta  \mathbf{p}\mathbf{i}\\
            &= \left(\mathbf{i}_\mu \otimes \mathbf{i}_\mu \right) \Delta.
\end{align*}$$

$D_\mathfrak{h}= \bm{\delta}+ \mathbf{p}_\mu \mu \mathbf{i}$ is a
coderivation since both $\bm{\delta}$ and $\mu$ are coderivations, while
$\mathbf{p}_{\mu}$ and $\mathbf{i}$ are coalgebra morphisms. It is
compatible with $D_R$ because $\bm{\delta}$ is compatible with $D_R$,
and the term $\mathbf{p}_{\mu} \mu \mathbf{i}$ is ${R^\sharp}$-linear. ◻
:::

::: {#thht .prop}
**Proposition 44**. *A contraction $h$ of $\mathfrak{g}$ induces a
curved $L_\infty$ algebra structure on
$\mathfrak{h}\subset \mathfrak{g}$ with curvature and unary bracket
given by $$p(l_0), \qquad p l_1i,$$ respectively, and morphisms of
curved $L_\infty$ algebras
$$\mathbf{p}_\mu\colon \mathfrak{g}\to \mathfrak{h},
        \qquad
        \mathbf{i}_\mu\colon \mathfrak{h}\to \mathfrak{g},$$ satisfying
$$(\mathbf{p}_\mu)_0 = 0,
        \qquad
        (\mathbf{i}_\mu)_0 = 0,
        \qquad
        (\mathbf{p}_\mu)_1 = p,
        \qquad
        (\mathbf{i}_\mu)_1 = i.$$ In particular, $\mathbf{p}_\mu$ and
$\mathbf{i}_\mu$ are weak equivalences of curved $L_\infty$ algebras.*
:::

::: proof
*Proof.* By Lemma [43](#bergetz){reference-type="ref"
reference="bergetz"}, $\mathfrak{h}$ carries a curved $L_\infty$ algebra
structure with Chevalley--Eilenberg differential $D_\mathfrak{h}$, and
$\mathbf{p}_\mu$ and $\mathbf{i}_\mu$ are well defined morphisms of
curved $L_\infty$ algebras. The zeroth and first components of
$\mathbf{p}_\mu$, $\mathbf{i}_\mu$, and $D_\mathfrak{h}$ can be read off
from their action on
$\mathfrak{g}[1]\subset \widehat{\mathrm{Sym}}_{R^\sharp}(\mathfrak{g}[1])$
and
$\mathfrak{h}[1]\subset \widehat{\mathrm{Sym}}_{R^\sharp}(\mathfrak{h}[1])$,
respectively.

$\mathbf{p}_\mu$ and $\mathbf{i}_\mu$ are weak equivalences since the
triple $(\mathrm{Gr}\,p, \mathrm{Gr}\,i, \mathrm{Gr}\,h)$ defines a
strong deformation retract of complexes from
$(\mathrm{Gr}\,\mathfrak{g},\mathrm{Gr}\,l_1)$ to
$(\mathrm{Gr}\,\mathfrak{h},\mathrm{Gr}\,pl_1i)$. ◻
:::

We end this appendix by emphasizing that our homotopy transfer of curved
$L_\infty$ algebras keeps the curvature unchanged. Indeed, one has
$$pi(l_0) = l_0, \qquad
    ip(l_0)= l_0 - [l_1,h](l_0)
    = l_0 - h(l_1(l_0))
    = l_0.$$

:::: bibsection
::: biblist
:::
::::

[^1]: *Note that the filtration used here for
    $\mathrm{CE}(\mathfrak{g})$ differs from that in the pro-nilpotent
    setting [@getzler2025higherholonomycurvedlinftyalgebras].*

[^2]: The exposition in [@morye2013note] is formulated for (locally)
    ringed spaces; its extension to the graded ringed setting considered
    here is straightforward.

[^3]: In his notation, $\mathbf{h}^\Sigma$ corresponds to our
    $\mathbf{h}$, $\mathbf{q}$ corresponds to $G$, and
    $\mathbf{h}^{\mathrm{der}}$ corresponds to $L_h$.

