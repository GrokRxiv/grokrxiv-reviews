## Introduction

The goal of this note is prove the following statement for smooth
commutative group schemes over smooth curves, conjectured by Kollár and
Saccà in [@KS25].

::: theorem*
(=[\[cor_main\]](#cor_main){reference-type="ref+label"
reference="cor_main"}) Let $C$ be a geometrically connected, smooth
projective curve over a field $k$, and $A/C$ a smooth commutative group
scheme with connected fibres, whose generic fibre $A_\eta$ is an abelian
variety which has no abelian subvarieties defined over $k$.\
Let $Z_0$ be the zero section and $MW(A/C)$ the Mordell-Weil group. Then
the following set map $$\MW(A/C)/{\tors} \to  N_{1}(A)$$
$$Z \mapsto [Z]-[Z_0]$$ is injective.
:::

We remark that the previous natural map is *not* a group homomorphism
and to prove the injectivity-modulo-torsion we introduce a weakened
version of numerical equivalence on 1-cycles (see
[\[def_N1gen\]](#def_N1gen){reference-type="ref+label"
reference="def_N1gen"} and
[\[main_thm\]](#main_thm){reference-type="ref+label"
reference="main_thm"}).

The key inputs of our approach are

- extension results for cubist $\mathbb{G}_{m}$-torsors on connected
  group schemes (see [1](#sec_cubist){reference-type="ref+label"
  reference="sec_cubist"}); and

- the theory of heights developed for the proof of the Lang-Néron
  theorem (see [@L83 Chapter 6]).

### Acknowledgements {#acknowledgements .unnumbered}

The authors would like to thank János Kollár and Giulia Saccà for their
comments on the first version of this note. AF is supported by the ANR
project "FRACASSO" ANR- 22-CE40-0009-01.

## Extensions of cubist invertible sheaves

Let $k$ be a field and $S$ an irreducible normal scheme over $k$. In
this note we denote by $A$ a smooth commutative group scheme over $S$.
If we assume that the generic fibre $A_\eta$ is an abelian variety, all
line bundles on $A_\eta$ verify the Theorem of the Cube [@M70
Corollary 2, page 58]. In particular, it is natural to ask under which
conditions on $A$ (and $S$), a line bundle $\L_\eta$ on $A_\eta$ can be
extended to $\L$ on $A$ still verifying the Theorem of the Cube. It
turns out, after the work of Breen [@B83] (see also [@M85]), that when
$S$ is a curve and $A/S$ has connected fibres, a (unique) *cubist*
extension exists for any line bundle on $A_\eta$.

The notion of $G$-torsor endowed with a cubist structure (or cubist
$G$-torsor), where $G$ is a commutative group scheme, is rather general
and we will introduce here only what is relevant for our work (see [@M85
Ch. I, Definition 2.4.5]).

::: definition
Let $S$ be a scheme, $\mathbb{G}_{m,S}$ the multiplicative group scheme
over $S$ and $X$ a commutative $S$-group scheme. A *cubist structure* on
an invertible sheaf $\L$ of $X$ (or $\mathbb{G}_{m,S}$-torsor on $X/S$)
is the data of a section $\tau$ of the torsor
$$\theta(\L):= m_{1,2,3}^*\L \otimes m_{1,2}^*\L^\vee \otimes m_{1,3}^*\L^\vee \otimes m_{2,3}^*\L^\vee \otimes m_{1}^*\L \otimes m_{2}^*\L \otimes m_{3}^*\L$$
on $X^3$, where $m_I\colon X^3 \to X$ is the sum of projections
corresponding to $I\subseteq \{1,2,3\}$. The category of cubist
$\mathbb{G}_{m,S}$-torsors on $X$ is denoted by
$\CUB(X,\mathbb{G}_{m,S})$.
:::

We recall the classical notion of rigidification for line bundles.

::: definition
Let $k$ be a field, $S$ an irreducible normal scheme over $k$ and $A/S$
a smooth commutative group scheme, with connected fibres. Let $Z_0$ be
the zero section. An invertible sheaf $\L$ on $A$ is *rigidified* if
$\L|_{Z_0}\cong \O_{Z_0}$. The group of rigidified invertible sheaves on
$A$ modulo isomorphism is denoted by $\Pic(A)_{\rig}$.
:::

::: proposition
[]{#prop_main label="prop_main"} Let $C$ be a smooth projective curve
over $k$ and $A/C$ a smooth commutative group scheme with connected
fibres. Assume that the generic fibre $A_\eta$ is an abelian variety.
Then

1.  []{#item_lift label="item_lift"} the restriction
    $$\Pic(A)_{\rig} \to \Pic(A_\eta)$$ is a group isomorphism.

2.  []{#item_sum label="item_sum"} For any $\L\in \Pic(A)_{\rig}$ the
    following holds:
    $$\L_\eta\in \Pic^\circ(A_\eta) \iff [-1]^*\L \cong \L^\vee \text{(i.e.\ $\L$ is odd)}.$$

3.  []{#item_square label="item_square"} Let $\L\in \Pic(A)$ be a line
    bundle such that $\L_\eta\in \Pic^\circ(A_\eta)$, and let $Z_1$ and
    $Z_2$ be two sections of $A/C$, and $Z_3:=Z_1\oplus Z_2$ in
    $\MW(A/C)$ with corresponding translation morphisms
    $\tau_i\colon A\to A$, for $i=1,2,3$. Then
    $$\tau_1^*\L \otimes \tau_2^*\L \cong \tau_3^*\L \otimes \L$$ in
    $\Pic(A)$.
:::

::: proof
*Proof.* Our hypothesis on the base $C$ guarantee the existence and
unicity of cubist extensions, i.e. the restriction functor
$$\begin{equation}
\label{eq_cub}
    \CUB(A,\mathbb{G}_{m,C}) \to \CUB(A_\eta,\mathbb{G}_{m,\eta})
\end{equation}$$ is an equivalence of categories (see [@M85 Ch. 2,
Theorem 1.1]). Composing with the forgetful functor
$$\CUB(A,\mathbb{G}_{m,C}) \to \TORSRIG(A,\mathbb{G}_{m,C}),$$ where
$\TORSRIG(A,\mathbb{G}_{m,C})$ is the category of rigidified
(i.e. trivialised at the zero section) $\mathbb{G}_{m,C}$-torsors, we
obtain [\[item_lift\]](#item_lift){reference-type="ref+label"
reference="item_lift"}.\
The theory of abelian varieties gives: $\L_\eta\in \Pic^\circ(A_\eta)$
if and only if $[-1]^*\L_\eta \cong \L_\eta^\vee$ (see [@L83 Ch. 5,
Proposition 2.3]). So
[\[item_lift\]](#item_lift){reference-type="ref+label"
reference="item_lift"} implies
[\[item_sum\]](#item_sum){reference-type="ref+label"
reference="item_sum"}.\
Let $\L\in \Pic(A)$. Let $p_1$ and $p_2$ the two projections from
$A\times A$. Restricting to the generic fibre,
$\L_\eta\in \Pic^\circ(A_\eta)$ implies that
$(p_1+p_2)^*\L_\eta \cong p_1^*\L_\eta \otimes p_2^*\L_\eta$ on
$A_\eta\times A_\eta$, so, again by
[\[eq_cub\]](#eq_cub){reference-type="ref+label" reference="eq_cub"},
$p_1^*\L \otimes p_2^*\L \cong (p_1+p_2)^*\L \otimes 0^*\L.$
Pulling-back the previous equation via $(f,g)$, where
$f,g\colon A \to A$ are morphisms, we get
$$f^*\L \otimes g^*\L \cong (f+g)^*\L \otimes 0^*\L.$$ This implies
[\[item_square\]](#item_square){reference-type="ref+label"
reference="item_square"}. ◻
:::

## The conjecture

In [@KS25], the authors prove the following rigidity result, motivated
by the work [@BFK25].

::: theorem
[@KS25 Proposition 1][]{#thm_KS label="thm_KS"} Let $S$ be a smooth,
projective surface over $\mathbb{C}$ such that $\Pic(S) = \Z[H]$, where
$|H|$ is basepoint-free, and members of $|H|$ have at worst nodes in
codimension 1 on $|H|$. Let $p \colon J(S, H) \to |H|$ be the universal
compactified Jacobian, $L \subset |H|$ a general line, $J_L := p^{-1}
(L)$, and $g$ the genus of the curves in $|H|$. Let $Z \subset J_L$ be a
section whose cohomology class is contained in the image of the
restriction map $$H^{2g}(J(S, H), \Z) \to H^{2g}(J_L, \Z).$$ Then $Z$ is
the zero section.
:::

The proof reduces to a monodromy argument combined with an injectivity
statement for the map $$\begin{equation}
\label{eq_1}
\MW(J_L/L)\cong \Z^{r-1} \to N_1(J_L)
\end{equation}$$ $$Z\mapsto [Z]-[Z_0]$$ where $N_1$ denotes the group of
complete $1$-cycles modulo numerical equivalence.

One is induced to consider the previous map in a generalised setting
(see [@KS25 Conjecture 7]). First, we remark that the map
[\[eq_1\]](#eq_1){reference-type="ref+label" reference="eq_1"} is *not*
a group homomorphism.

::: example
Keep the same hypothesis as in
[\[thm_KS\]](#thm_KS){reference-type="ref+label" reference="thm_KS"}.
Choose any non-zero $Z\in \MW(J_L/L)$ (the $K/\mathbb{C}$-trace of $J_L$
is automatically trivial and $\MW(J_L/L)$ is torsion-free, see [@S99
Theorem 3]) and any $\L\in \Pic(J_L)$ relatively ample over $L$,
rigidified and even (i.e. such that $[-1]^*\L\cong\L$). We know that
$[2]^*\L=\L^{\otimes 4}$. Moreover, we remark that
$(\L\cdot Z)= h_\L(Z_\eta)$, where $h_\L$ is the canonical Néron-Tate
height (see [@L83 Ch. 12, Proposition 3.5]), so $(\L\cdot Z)>0$. By the
projection formula, $([2]^*\L\cdot Z)=(\L\cdot [2]_* Z)$ and we deduce
that $$(\L\cdot [2]_* Z)=4(\L\cdot Z).$$ Since
$(\L\cdot 2Z)=2(\L\cdot Z)<4(\L\cdot Z)$, we have proved that
$$2[Z]\neq [[2]_*Z]+[Z_0] \ \text{ in } N_1(J_L).$$ In particular, the
map [\[eq_1\]](#eq_1){reference-type="ref+label" reference="eq_1"} is
not a group homomorphism.
:::

It turns out that the previous example explains the only obstruction for
[\[eq_1\]](#eq_1){reference-type="ref+label" reference="eq_1"} to be a
homomorphism.

### The natural map

Let $p \colon A \to C$ be a smooth commutative group scheme over a
smooth projective curve $C$ with connected fibres. Consider the natural
set map [\[eq_1\]](#eq_1){reference-type="ref+label" reference="eq_1"}
in this general setting: $$\begin{equation}
\label{eq_2}
\phi\colon \MW(A/C) \to N_1(A)
\end{equation}$$ $$Z\mapsto [Z]-[Z_0]$$ This map is quadratic in the
following sense: if we define
$$b\colon \MW(A/C)\times \MW(A/C) \to N_1(A)$$
$$(W,Z) \mapsto [W\oplus Z] + [Z_0] -[W] -[Z]$$ the Theorem of the Cube
implies that $b$ is bilinear. Moreover the map
$$\ell\colon \MW(A/C)\to N_1(A)$$
$$Z \mapsto 4[Z] - [Z \oplus Z] - 3[Z_0]$$ is linear, applying
[\[prop_main\]](#prop_main){reference-type="ref+label"
reference="prop_main"}(3) to the line bundle
$\L^{\otimes 4}\otimes [2]^*\L^\vee$. By construction,
$$2\phi(Z)=b(Z,Z)+\ell(Z),$$ for all $Z\in\MW(A/C)$.

In order to obtain a linear map from
[\[eq_2\]](#eq_2){reference-type="ref+label" reference="eq_2"}, we
define a weakened version of numerical equivalence.

::: definition
[]{#def_N1gen label="def_N1gen"} Let $p \colon A \to C$ be a smooth
commutative group scheme with connected fibres. The *generic numerical
equivalence* on (complete) $1$-cycles is defined as
$$Z\equiv_{\gen}0 \text{ if } \ (\L\cdot Z)=0 \ \text{for all } \L \in \Pic(A) \text{ such that\ } \L_{\eta} \in \Pic^\circ(A_{\eta}).$$
The group of complete $1$-cycles modulo generic numerical equivalence is
denoted by $N_{1,\gen}(A)$.
:::

Our main result is the following.

::: theorem
[]{#main_thm label="main_thm"} Let $C$ be a geometrically connected,
smooth projective curve over a field $k$, and $A/C$ a smooth commutative
group scheme with connected fibres, whose generic fibre $A_\eta$ is an
abelian variety. Let $Z_0$ be the zero section. Then the following
holds.

1.  The map $$\begin{equation}
    \psi\colon \MW(A/C) \to  N_{1,\gen}(A)
    \end{equation}$$ $$Z \mapsto [Z]-[Z_0]$$ is a group homomorphism.

2.  Assume that $A_\eta$ has no abelian subvarieties defined over $k$,
    then $\ker \psi = \MW(A/C)_{\tors}$.
:::

::: proof
*Proof.* To prove that $\psi$ is a group homomorphism, we follow the
first part of the argument from [@KS25 §8]. Let
$Z_3=Z_1\oplus Z_2\in \MW(A/C)$, we want to show that
$\psi(Z_1)+\psi(Z_2) \equiv_{\gen}\psi(Z_3)$, i.e. $$\begin{equation}
\label{eq_num}
    (\L\cdot Z_1)+(\L\cdot Z_2)=(\L\cdot Z_3)+(\L\cdot Z_0),
\end{equation}$$ for any $\L \in \Pic(A)$ such that
$\L_{\eta} \in \Pic^\circ(A_{\eta})$.\
Let us denote by $\tau_i\colon A\to A$ the translation by $Z_i$, then
the projection formula implies that
[\[eq_num\]](#eq_num){reference-type="ref+label" reference="eq_num"} is
equivalent to
$$(\tau_1^*\L \otimes \tau_2^*\L\otimes \tau_3^*\L^\vee\otimes \L^\vee\cdot Z_0)=0,$$
which holds true by
[\[prop_main\]](#prop_main){reference-type="ref+label"
reference="prop_main"}[\[item_square\]](#item_square){reference-type="ref+label"
reference="item_square"}.\
To describe the kernel of $\psi$, we recall once again that
$(\L\cdot Z)= h_\L(Z_\eta)$, for all $\L\in\Pic(A)_{\rig}$, where $h_\L$
is the canonical Néron-Tate height (see [@L83 Ch. 12, Proposition 3.5]).
Let $Z\in \MW(A/C)$ verifying $(\L\cdot Z)=0$ for all
$\L\in\Pic(A)_{\rig}$ such that $\L_\eta\in\Pic^\circ(A_\eta)$; then
[@L83 Ch. 6, Theorem 5.4.2)] implies that $Z\in \MW(A/C)_{\tors}$, since
the $K/k$-trace vanishes by the hypothesis (we assumed that $A_\eta$ has
no abelian subvarieties defined over $k$). ◻
:::

::: corollary
[]{#cor_main label="cor_main"} Let $A/C$ be as in
[\[main_thm\]](#main_thm){reference-type="ref+label"
reference="main_thm"} and assume that $A_\eta$ has no abelian
subvarieties defined over $k$. Then the set map
$$\MW(A/C)/{\tors} \to  N_{1}(A)$$ $$Z \mapsto [Z]-[Z_0]$$ is injective.
:::

::: proof
*Proof.* [\[main_thm\]](#main_thm){reference-type="ref+label"
reference="main_thm"} implies that, for any $Z_1,Z_2\in \MW(A/C)$,
$$[Z_1]=[Z_2] \text{ in } N_1(A) \iff Z_1\ominus Z_2\in \MW(A/C)_{\tors}.$$
The statement follows. ◻
:::

::: remark
The previous corollary is precisely the injectivity-modulo-torsion
statement from [@KS25 Conjecture 7].
:::

