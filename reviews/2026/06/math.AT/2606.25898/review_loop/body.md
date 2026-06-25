## Introduction

Quotients in higher algebra are much more delicate than their
counterparts in classical algebra, e.g. the Moore spectrum $\mathbb S/2$
famously does not even admit a unital multiplication. Nonetheless, there
are nowadays many techniques for constructing multiplicative structures
on quotients in higher algebra
[@robinson1989obstruction; @ekmm1997stablehomotopy; @stricklandMU; @lazarev2001homotopy; @bakerJeanneret2002brave; @duggerShipley2006postnikov; @Angeltveit_2008; @hopkinslurieambi; @Basu_2017; @hahn2018quotientsrings; @hahnWilson2022redshift; @burklund2022multiplicativestructuresmoorespectra; @rognes2025localizationsequenceslogarithmictopological; @willumsgaard2026obstructionsassociativitystablehomotopy].
However, the same cannot be said for equivariant higher algebra.
Developing such a theory is the main goal of this article, particularly
for quotients of the Araki--Landweber Real bordism theory
${\operatorname{MU}_{\mathbb{R}}}$.

#### Structured quotients of Real bordism {#structured-quotients-of-real-bordism .unnumbered}

Many $C_2$-spectra of interest can be constructed as quotients from
${\operatorname{MU}_{\mathbb{R}}}$ -- most notably, these include the
Real Brown--Peterson theory ${\operatorname{BP}_{\mathbb{R}}}$ as well
as its truncated variants
${\operatorname{BP}_{\mathbb{R}}\langle n\rangle}$, see
[1](#example: BPRJ){reference-type="ref+label"
reference="example: BPRJ"}. These examples generalize familiar
$C_2$-spectra of low chromatic heights: for $n = 1$ it specializes to
Atiyah's $K$-theory with Reality
$\operatorname{ku}_{\mathbb R(2)} \simeq {\operatorname{BP}_{\mathbb{R}}}\langle 1 \rangle$
and for $n = 2$ to
$\operatorname{tmf}_1(3)_{(2)} \simeq {\operatorname{BP}_{\mathbb{R}}}\langle 2 \rangle$
by [@hillmeier2017].[^3] Moreover, one obtains higher variants
${\operatorname{BP}^{(\!(G)\!)}}$ and
${\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle$ for a finite group
$G \geq C_2$ through certain norm constructions
([2](#example: BPGJ){reference-type="ref+label"
reference="example: BPGJ"}). While already intrinsically interesting
objects, these can be used to construct various useful non-equivariant
spectra such as connective models of higher real $K$-theories
[@beaudryHillShiZeng2021modelsLubinTate; @carrick2025higherrealktheoriesfinite],
an insight from Hill--Hopkins--Ravenel's resolution of the Kervaire
invariant one problem [@HHR16].

Our first main result concerns the structure on such objects and
produces the structure of a $C_2$-ring spectrum with involution on all
of these quotients, modelled by $\mathbb E_{\sigma}$-algebras for the
$C_2$-sign representation $\sigma$. This is particularly relevant in the
study of Real algebraic $K$-theory, which can be approached through Real
trace methods. Indeed, Real topological Hochschild homology
[@hesselholtMadsen2015Realalgebra; @dottoMoiPatchkoriaReeh2021THR] is
precisely defined for $\mathbb E_{\sigma}$-algebras. As such,
Angelini-Knoll--Kong--Quigley compute the Real syntomic cohomology of
${\operatorname{BP}_{\mathbb{R}}\langle n\rangle}$ for $-1\leq n\leq 2$,
using that $C_2$-commutative models of these are available, see
[@gabe2025realsyntomiccohomology Theorem D]. They state that the only
obstruction to an extension to all $n$ is the lack of
$\mathbb E_\sigma$-algebra structures on
${\operatorname{BP}_{\mathbb{R}}\langle n\rangle}$ for $n>2$, see
[@gabe2025realsyntomiccohomology p. 4]. Our theorem produces this
structure, therefore enabling a study of
$\mathrm{THR}({\operatorname{BP}_{\mathbb{R}}\langle n\rangle})$ and
$\mathrm{THR}({\operatorname{BP}_{\mathbb{R}}\langle n\rangle}/{\operatorname{MU}_{\mathbb{R}}})$
as well as Angelini-Knoll--Kong--Quigley's program for
${\operatorname{BP}_{\mathbb{R}}\langle n\rangle}$.

Let us now state a precise version of our first main result. Throughout,
let $G = C_{2^n}$ for some $n$ and let $\rho$ be the regular
$C_2$-representation. For every $G$-representation $V$ there exists an
equivariant little disk operad $\mathbb E_V$ controlling equivariant
multiplicative structures
[@blumberghill2015operadic; @horev2019genuineequivariantfactorizationhomology; @Hill22disks].
Moreover, when norming up an $\mathbb E_V$-algebra $R$ along
$G \leq G'$, then $N_G^{G'} R$ naturally inherits the structure of a
so-called $\operatorname{Coind}_{G}^{G'} \mathbb E_V$-algebra, where
$\operatorname{Coind}_G^{G'} \colon \mathrm{Op}_{G, \infty} \to \mathrm{Op}_{G', \infty}$
is the right adjoint to the restriction functor
[@quinnZhu2026multiplicativeequivariantthomspectra Construction 2.2.5].
This applies in particular to examples like
${\operatorname{MU}^{(\!(G)\!)}}\coloneqq N_{C_2}^G {\operatorname{MU}_{\mathbb{R}}}$
and
${\operatorname{BP}^{(\!(G)\!)}}\coloneqq N_{C_2}^G {\operatorname{BP}_{\mathbb{R}}}$.

::: {#main:MUR_quotients .mainthm}
**Theorem 1** ([1](#thm:MUR_quotients){reference-type="ref+label"
reference="thm:MUR_quotients"},
[2](#thm:MUG_quotients){reference-type="ref+label"
reference="thm:MUG_quotients"}). Let $I \subseteq \mathbb{Z}_{\geq 1}$
be an indexing set.

(i) Let $\{\overline{x}_{i}\}_{i\in I}$ be a collection of elements with
    $\overline{x}_i\in \pi^{C_2}_{i\rho}{\operatorname{MU}_{\mathbb{R}}}$.
    Then ${\operatorname{MU}_{\mathbb{R}}}/(\overline{x}_i:i\in I)$
    admits an
    $\mathbb E_\sigma$-${\operatorname{MU}_{\mathbb{R}}}$-algebra
    structure.

(ii) Let $\{\overline{x}_{i}\}_{i\in I}$ be a collection of elements
     with
     $\overline{x}_i\in \pi^{C_2}_{i\rho}{\operatorname{MU}^{(\!(G)\!)}}$.
     Then
     ${\operatorname{MU}^{(\!(G)\!)}}/(G\cdot \overline{x}_i:i\in I)$
     admits a
     $\operatorname{Coind}^G_{C_2}\mathbb E_\sigma$-${\operatorname{MU}^{(\!(G)\!)}}$-algebra
     structure.
:::

::: {#main: remark generic .mainrem}
**Remark 1**. In general, an $\mathbb E_{\sigma}$-algebra structure on a
$C_2$-spectrum $R$ provides an $\mathbb E_1$-algebra structure on
$\operatorname{Res}_e^{C_2} R$ as well as an
$N_e^{C_2} \operatorname{Res}_e^{C_2} R$-$N_e^{C_2} \operatorname{Res}_e^{C_2}R$-bimodule
structure on $R$, see
[@horev2019genuineequivariantfactorizationhomology; @Hill22disks]. On
the other hand, it does not provide a unital equivariant multiplication
on $R$: there is no underlying $\mathbb E_1$-algebra structure in
$C_2$-spectra coming from an $\mathbb E_{\sigma}$-algebra structure.

So [1](#main:MUR_quotients){reference-type="ref+label"
reference="main:MUR_quotients"} enhances the associative multiplications
on quotients of $\operatorname{MU}$ that were established by Angeltveit,
Basu--Sagave--Schlichtkrull and Hahn--Wilson
[@Angeltveit_2008; @Basu_2017; @hahnWilson2022redshift]. However, it
does not enhance the multiplications to unital equivariant
multiplications on quotients of ${\operatorname{MU}_{\mathbb{R}}}$.
Indeed, this is provably impossible, since $\mathbb E_{\sigma}$ is
generically the best possible structure on such quotients. An argument
by Shi, recorded by Bachmann--Hahn, shows that
${\operatorname{BP}_{\mathbb{R}}}/\overline{v}_i$ does not admit the
structure of a homotopy associative $C_2$-ring spectrum
([3](#remark: MUR quotient theorem){reference-type="ref+label"
reference="remark: MUR quotient theorem"}). This rules out any
$\mathbb E_1$-version of
[1](#main:MUR_quotients){reference-type="ref+label"
reference="main:MUR_quotients"}. Moreover, there are many quotients
whose underlying spectra do not admit $\mathbb E_2$-algebra structures,
so also $\mathbb E_{2\sigma}$ cannot be achieved generically, making
$\mathbb E_{\sigma}$ the best possible $C_2$-little disk operad one can
hope for. Instead, our result equips those quotients with bimodule
structures over the norm of their underlying. That is precisely the
structure needed to construct
$\mathrm{THR}(R) \coloneqq R \otimes_{N_e^{C_2} \operatorname{Res}_e^{C_2} R} R$,
whence our interest in $\mathbb E_{\sigma}$-algebra structures.
:::

While Hahn--Shi [@hahnRealOrientationsLubin2020] have constructed an
$\mathbb E_{\sigma}$-algebra structure on quotients of the periodic Real
bordism spectrum ${\operatorname{MUP}_{\mathbb{R}}}$, their approach
does not seem feasible for the non-periodic version. Suppose we want to
quotient out certain homogeneous elements in
$\pi_{*\rho} {\operatorname{MUP}_{\mathbb{R}}}$. Then, Hahn--Shi
crucially use the periodicity generator to move every such element to
the same degree. This degree can then be accessed through the geometry
of $\mathbb{HP}^{\infty}$, see [@hahnRealOrientationsLubin2020
Proposition 4.2]. Instead, we are inspired by
Basu--Sagave--Schlichtkrull's work on writing quotients of
$\operatorname{MU}$ as $\mathbb E_1$-Thom spectra over
$\operatorname{SU}$, see [@Basu_2017]. In fact, we prove a
$C_2$-equivariant version of their result, although our methods are
completely different and involve certain lifting techniques from
[@quinnZhu2026multiplicativeequivariantthomspectra].

One could try to naively equivariantize Basu--Sagave--Schlichtkrull's
argument, and the first hurdle is already realizing that the appropriate
$C_2$-refinement for $\operatorname{SU}$ is not
$\operatorname{SU}_{\mathbb R}$, i.e. $\operatorname{SU}$ with the
complex conjugation action, but rather
$\mathrm B\Omega^{\sigma} \operatorname{SU}_{\mathbb R}$. It turns out
that this non-trivial twist complicates attempts of a naive
generalization, see [2](#remark: BSS hard){reference-type="ref+label"
reference="remark: BSS hard"}. Nonetheless, using our methods we manage
to prove that quotients of ${\operatorname{MU}_{\mathbb{R}}}$ can be
obtained as $C_2$-Thom spectra over
$\mathrm B\Omega^{\sigma} \operatorname{SU}_{\mathbb R}$ through an
$\mathbb E_{\sigma}$-algebra map
([3](#corollary: Real BSS){reference-type="ref+label"
reference="corollary: Real BSS"}).

As the main examples for our
[1](#main:MUR_quotients){reference-type="ref+label"
reference="main:MUR_quotients"}, we immediately obtain structured
versions of the Real truncated Brown--Peterson spectra, recalled in
[1](#example: BPRJ){reference-type="ref+label"
reference="example: BPRJ"} and
[2](#example: BPGJ){reference-type="ref+label"
reference="example: BPGJ"}, answering a question of
Angelini-Knoll--Kong--Quigley [@gabe2025realsyntomiccohomology Remark
5.7]:

::: {#main:BPRnkRn .maincor}
**Corollary 1**. The truncated Real Brown--Peterson spectra
${\operatorname{BP}_{\mathbb{R}}\langle n\rangle}$ admit
$\mathbb E_\sigma$-${\operatorname{MU}_{\mathbb{R}}}$-algebra structures
and higher truncated Brown--Peterson spectra
${\operatorname{BP}^{(\!(G)\!)}}\langle m \rangle$ admit
$\operatorname{Coind}^{G}_{C_2}\mathbb E_\sigma$-${\operatorname{MU}^{(\!(G)\!)}}$-algebra
structures for all $n \geq 1$.
:::

The theorem also immediately applies to certain generalized higher
truncated Brown--Peterson spectra, giving them a
$\operatorname{Coind}_{C_2}^G \mathbb E_{\sigma}$-algebra structure, and
thereby answering a question by Hahn--Wilson [@AimPL_equivstable_5
Problem 5.5]. We will recall the construction of these objects in
[2](#example: BPGJ){reference-type="ref+label"
reference="example: BPGJ"}.

While an $\mathbb E_{\sigma}$-algebra structure on quotients of
${\operatorname{MU}_{\mathbb{R}}}$ is optimal generically
([1](#main: remark generic){reference-type="ref+label"
reference="main: remark generic"}), an enhancement to an
$\mathbb E_{1+2\sigma}$-algebra structure is expected in this specific
case of truncated Real Brown--Peterson spectra [@hahnWilson2022redshift
Remark 1.0.14]. This would in particular equip
${\operatorname{BP}_{\mathbb{R}}\langle n\rangle}$ and
${\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle$ with an equivariant
associative multiplication. In upcoming joint work with
Carrick--Hill--Stewart, we set up an equivariant version of
$\mathrm{TAQ}$ and compute equivariant centers to establish this result.

#### Orientations by twisted monoid quotients {#orientations-by-twisted-monoid-quotients .unnumbered}

Combining the interest of quotients of Real bordism and orientation
theory leads to the study of orientations by the twisted monoid
quotients ${\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle$. Building on
work of Hahn--Shi [@hahnRealOrientationsLubin2020],
Beaudry--Hill--Shi--Zeng [@beaudryHillShiZeng2021modelsLubinTate]
produced certain explicit $G$-equivariant homotopy ring maps
$${\operatorname{BP}^{(\!(G)\!)}}= N_{C_2}^G {\operatorname{BP}_{\mathbb{R}}}\longrightarrow E(k, \Gamma_h)$$
to Lubin--Tate theory associated to a perfect field $k$ and a formal
group law $\Gamma_h$ of height $h$, where the $G$-action on
$E(k, \Gamma_h)$ comes from the Morava stabilizer group action. This
allows us to transport known features about
${\operatorname{BP}^{(\!(G)\!)}}$ over to $E(k,\Gamma_h)$ and is in
particular a technique to understand the inexplicit group action on
$E$-theory obtained through obstruction theory.

We produce a factorization of this map through the higher truncated
Brown--Peterson spectra
${\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle$, whose definition we
recall in [2](#example: BPGJ){reference-type="ref+label"
reference="example: BPGJ"}.

::: {#mainthm: BHSZ .mainthm}
**Theorem 2** ([3](#thm:BHSZ_refinement){reference-type="ref+label"
reference="thm:BHSZ_refinement"}). The Beaudry--Hill--Shi--Zeng
orientation ${\operatorname{BP}^{(\!(G)\!)}}\to E(k,\Gamma_h)$ refines
to a $\operatorname{Coind}^G_{C_2}\mathbb E_\rho$-ring map. Furthermore,
there are $G$-equivariant factorizations $$\begin{tikzcd}
        {\operatorname{BP}^{(\!(G)\!)}}\ar[r]\ar[d] & E(k,\Gamma_h)
        &
        \raisebox{-0.9em}{\text{and}}
        &
        D^{-1}{\operatorname{BP}^{(\!(G)\!)}}\ar[r]\ar[d] & E(k,\Gamma_h) \\
        {\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle\ar[ru, dashed]
        &&
        &
        D^{-1}{\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle\ar[ru, dashed]
    \end{tikzcd}$$ of ${\operatorname{BP}^{(\!(G)\!)}}$-modules. Here,
$D\in \pi^{G}_{*\rho_G} \left({\operatorname{MU}^{(\!(G)\!)}}\right)$ is
a certain explicit class considered by Beaudry--Hill--Shi--Zeng
[@beaudryHillShiZeng2021modelsLubinTate Section 6].
:::

In fact, the existence of this factorization
([2](#mainthm: BHSZ){reference-type="ref+label"
reference="mainthm: BHSZ"}) was long expected by experts in the field,
although a rigorous derivation relies on further equivariant
multiplicative structures that were not available. Our previous work on
structured Real orientations
[@quinnZhu2026multiplicativeequivariantthomspectra] gives us just enough
structure to perform this, allowing us to apply a general factorization
result ([3](#prop: factorization){reference-type="ref+label"
reference="prop: factorization"}).

To our knowledge, [2](#mainthm: BHSZ){reference-type="ref+label"
reference="mainthm: BHSZ"} gives the first construction of the maps
$${\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle\longrightarrow E(k, \Gamma_h).$$
Nonetheless, they have already been used to great effect in the
literature, particularly in relation to identifying periodicities of
$E(k, \Gamma_h)$. Indeed, these orientations feature in the
transchromatic isomorphism theorem from Meier--Shi--Zeng
[@meier2024transchromaticphenomenaequivariantslice], which then
Duan--Hill--Li--Liu--Shi--Wang--Xu use to determine and recover a myriad
of $\operatorname{RO}(G)$-graded periodicities of $E(k,\Gamma_h)$, see
[@duan2025periodicityfinitecomplexityhigher]. We give an overview of
these applications in the concluding
[3.3](#subsection: periodicity lubin tate){reference-type="ref+label"
reference="subsection: periodicity lubin tate"}.

Moreover, these orientations are one of the main sources of interest for
the higher truncated Brown--Peterson theories: they allow us to access
the higher real $K$-theories, as e.g. shown to great effect in
[@carrick2025higherrealktheoriesfinite]. For instance, the existence of
the maps in [2](#mainthm: BHSZ){reference-type="ref+label"
reference="mainthm: BHSZ"} along with results from
[@beaudryHillShiZeng2021modelsLubinTate] allows us to give a new
equivariant model for higher real $K$-theory.

Let us denote by $%
  
    % draw a slightly shorter underline
    \uline{\hphantom{\operatorname{map}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\operatorname{map}}}%
  
_G$ the mapping $G$-spectrum.

::: {#maincor: equivariant equivalence .maincor}
**Corollary 2** ([7](#cor:BPGmEh_equivalence){reference-type="ref+label"
reference="cor:BPGmEh_equivalence"}). Let $G = C_{2^n}$ and
$h = 2^{n-1}m$. Suppose that $k^{\times}$ contains all
$q = (2^m-1)$-roots of unity. There is an equivalence $$%
  
    % draw a slightly shorter underline
    \uline{\hphantom{\operatorname{map}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\operatorname{map}}}%
  
_G \left(\Sigma_+^{\infty} \mathrm{EG}, L_{\operatorname{Infl}_e^G K(h)} D^{-1}{\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle\right) \xrightarrow{\ \simeq \ } E(k,\Gamma_h)^{hC(k,m)}$$
of ${\operatorname{BP}^{(\!(G)\!)}}$-modules, where $C(k,m)$ is a
subgroup of the extended Morava stabilizer group recalled in
[1](#recollection: bhsz){reference-type="ref+label"
reference="recollection: bhsz"}.
:::

In fact, it was expected by experts that this equivalence already holds
true before inverting $D$, inspired by Baker--Würgler's non-equivariant
equivalence
$L_{K(h)} \operatorname{BP}\langle h \rangle \simeq \widehat{E}(h)$ to
completed Johnson--Wilson theory [@bakerWuergler1989liftings Theorem
4.1]. As such, we show that $E(k,\Gamma_h)^{hC(k,m)}$ is an equivariant
refinement of completed Johnson--Wilson theory
([11](#remark: Baker wuergler){reference-type="ref+label"
reference="remark: Baker wuergler"}).

While we have managed to verify that the map in
[2](#maincor: equivariant equivalence){reference-type="ref+label"
reference="maincor: equivariant equivalence"} remains an equivalence for
$n = 1$ as well as for $(m,n) = (1,2)$ before inverting $D$, we were
surprised to find that it is not an equivalence in general. We give a
full characterization of when $$%
  
    % draw a slightly shorter underline
    \uline{\hphantom{\operatorname{map}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\operatorname{map}}}%
  
_G \left(\Sigma_+^{\infty} \mathrm{EG}, L_{\operatorname{Infl}_e^G K(h)} {\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle\right) \longrightarrow E(k,\Gamma_h)^{hC(k,m)}$$
is an equivalence of ${\operatorname{BP}^{(\!(G)\!)}}$-modules.

::: {#mainthm: characterization .mainthm}
**Theorem 3**
([4](#prop: positive examples lubin tate){reference-type="ref+label"
reference="prop: positive examples lubin tate"},
[5](#theorem: not higher real k theory){reference-type="ref+label"
reference="theorem: not higher real k theory"}). Let $G = C_{2^n}$ and
$h = 2^{n-1}m$. Suppose that $k^{\times}$ contains all
$q = (2^m-1)$-roots of unity. The map $$%
  
    % draw a slightly shorter underline
    \uline{\hphantom{\operatorname{map}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\operatorname{map}}}%
  
_G \left(\Sigma_+^{\infty} \mathrm{EG}, L_{\operatorname{Infl}_e^G K(h)} {\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle\right) \longrightarrow E(k,\Gamma_h)^{hC(k,m)}$$
is an equivalence of ${\operatorname{BP}^{(\!(G)\!)}}$-modules if and
only if $n = 1$ or $(m,n) = (1,2)$.
:::

We prove this through a $\pi_*(L_{K(h)}-)/(2,v_1,\cdots, v_{h-1})$
computation. Here, Beaudry--Hill--Shi--Zeng computed
$$\pi_*^e \left(E(k,\Gamma_h)^{hC(k,m)} \right)/(2,v_1, \cdots, v_{h-1}) \cong \mathbb F_2[t^{\pm 1}]$$
in [@beaudryHillShiZeng2021modelsLubinTate Proposition 7.1], but the
complexity for the analogous computation on the left-hand side of
[3](#mainthm: characterization){reference-type="ref+label"
reference="mainthm: characterization"} increases rapidly, so we
ultimately distinguish
$$\pi_* \left(L_{K(h)} \operatorname{Res}_e^G {\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle\right)/(2,v_1,\cdots, v_{h-1}) \qquad \text{from} \qquad \pi_*^e \left(E(k,\Gamma_h)^{hC(k,m)} \right)/(2,v_1,\cdots, v_{h-1})$$
by counting the $\mathbb F_4$-points on their associated affine schemes
([5](#prop: F4 points computation){reference-type="ref+label"
reference="prop: F4 points computation"}).

### Outline {#outline .unnumbered}

The remainder of the article is organized as follows:

In
[2](#section: structured quotients of Real bordism){reference-type="ref+label"
reference="section: structured quotients of Real bordism"} we produce an
$\mathbb E_{\sigma}$-${\operatorname{MU}_{\mathbb{R}}}$-algebra
structure on quotients of ${\operatorname{MU}_{\mathbb{R}}}$ through
designer spectra and lifting methods. We furthermore discuss higher
group versions and produce a
$\operatorname{Coind}_{C_2}^G \mathbb E_{\sigma}$-${\operatorname{MU}^{(\!(G)\!)}}$-algebra
structure on twisted monoid quotients of
${\operatorname{MU}^{(\!(G)\!)}}$.

In
[3](#section: orientations by twisted monoid quotients){reference-type="ref+label"
reference="section: orientations by twisted monoid quotients"} we factor
the Beaudry--Hill--Shi--Zeng orientations
${\operatorname{BP}^{(\!(G)\!)}}\to E(k, \Gamma_h)$ through the higher
truncated Brown--Peterson theory
${\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle$, which we use to study
the $K(h)$-localization of
${\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle$ and its relation to
higher real $K$-theory. We end by discussing known applications of the
factorization, namely periodicities of Lubin--Tate theory.

In
[4](#section: twisted monoid quotients via parametrized colimits){reference-type="ref+label"
reference="section: twisted monoid quotients via parametrized colimits"}
we record a definition of twisted monoid quotients as a total cofiber of
an equivariant cube. This is made precise using parametrized colimits.

### Notations & Conventions {#notations-conventions .unnumbered}

Our terminology will be compatible with
[@quinnZhu2026multiplicativeequivariantthomspectra], and in particular
we will freely be using the language of parametrized higher algebra.
Nonetheless, we will recall relevant notions in the body of the article,
so this paper can be read independently from
[@quinnZhu2026multiplicativeequivariantthomspectra]. We collect some
notational conventions here that we will use throughout the whole
article.

(1) Throughout, $G$ will always be a finite group.

(2) We denote by $\rho$ and $\sigma$ the regular and sign
    representations of $C_2$ respectively.

(3) Underlined categories are $G$-$\infty$-categories, e.g. $%
      
        % draw a slightly shorter underline
        \uline{\hphantom{\mathrm{Sp}}\kern-0pt}%
        % restore overall width so following text lines up
        \kern 0pt%
        % overlay the actual content, with proper math style
        \mathllap{\mathpalette\my@cont@{\mathrm{Sp}}}%
      
    _G$ is the $G$-$\infty$-category which on level $H \leq G$ is
    $\mathrm{Sp}_H$.

(4) Let $X,Y \in \mathrm{Sp}_G$. We denote by $%
      
        % draw a slightly shorter underline
        \uline{\hphantom{\operatorname{map}}\kern-0pt}%
        % restore overall width so following text lines up
        \kern 0pt%
        % overlay the actual content, with proper math style
        \mathllap{\mathpalette\my@cont@{\operatorname{map}}}%
      
    _G(X, Y)$ the mapping $G$-spectrum refining the mapping $G$-space $%
      
        % draw a slightly shorter underline
        \uline{\hphantom{\operatorname{Map}}\kern-0pt}%
        % restore overall width so following text lines up
        \kern 0pt%
        % overlay the actual content, with proper math style
        \mathllap{\mathpalette\my@cont@{\operatorname{Map}}}%
      
    _G(X, Y)$. We also write $%
      
        % draw a slightly shorter underline
        \uline{\hphantom{\operatorname{map}}\kern-0pt}%
        % restore overall width so following text lines up
        \kern 0pt%
        % overlay the actual content, with proper math style
        \mathllap{\mathpalette\my@cont@{\operatorname{map}}}%
      
    _{%
      
        % draw a slightly shorter underline
        \uline{\hphantom{\mathrm{Sp}}\kern-0pt}%
        % restore overall width so following text lines up
        \kern 0pt%
        % overlay the actual content, with proper math style
        \mathllap{\mathpalette\my@cont@{\mathrm{Sp}}}%
      
    _G}(X, Y)$ and $%
      
        % draw a slightly shorter underline
        \uline{\hphantom{\operatorname{Map}}\kern-0pt}%
        % restore overall width so following text lines up
        \kern 0pt%
        % overlay the actual content, with proper math style
        \mathllap{\mathpalette\my@cont@{\operatorname{Map}}}%
      
    _{%
      
        % draw a slightly shorter underline
        \uline{\hphantom{\mathrm{Sp}}\kern-0pt}%
        % restore overall width so following text lines up
        \kern 0pt%
        % overlay the actual content, with proper math style
        \mathllap{\mathpalette\my@cont@{\mathrm{Sp}}}%
      
    _G}(X, Y)$.

(5) The $G$-$\infty$-operad $\mathbb E_{\infty}^G$ is the terminal
    $G$-$\infty$-operad. So $\mathbb E_{\infty}^G$-algebras admit all
    norms -- they are also known as normed algebras, ultracommutative
    algebras, or $G$-$\mathbb E_\infty$-algebras.

(6) There is a restriction functor of equivariant $\infty$-operads
    $\operatorname{Res}_H^G \colon \mathrm{Op}_{G, \infty} \to \mathrm{Op}_{H, \infty}$
    which admits a right adjoint
    $\operatorname{Coind}_H^G \colon \mathrm{Op}_{H, \infty} \to \mathrm{Op}_{G, \infty}$,
    the coinduction functor. See
    [@stewart2025tensorproductsequivariantcommutative Section 1.3.1] and
    [@quinnZhu2026multiplicativeequivariantthomspectra Remark 2.2.5] for
    a discussion in the language of parametrized higher categories.

### Acknowledgements {#acknowledgements .unnumbered}

We thank Christian Carrick, Markus Hausmann, Kaif Hilman, Ishan Levy,
Guchuan Li, Lennart Meier and XiaoLin Danny Shi for helpful and
encouraging discussions. RQ is funded by the NUI Travelling Studentship.
QZ is supported by the Max Planck Institute for Mathematics (MPIM) in
Bonn and is thankful for its financial support and for providing
conducive working environments. QZ furthermore thanks Utrecht University
for its hospitality, where a portion of this article was written.

## Structured quotients of Real bordism

### Equivariant designer polynomial algebras {#sec:designer}

The main construction we need is an
${\operatorname{MU}_{\mathbb{R}}}$-version of Hahn--Wilson's designer
polynomial $\operatorname{MU}$-algebras [@hahnWilson2022redshift
Construction 2.6.1].

::: {#construction:designer_MUR_poly .proposition}
**Proposition 1**. The free
$\mathbb E_1$-${\operatorname{MU}_{\mathbb{R}}}$-algebra on a class in
degree $i\rho$, denoted by
$\textcolor{chillired}{{\operatorname{MU}_{\mathbb{R}}}[\overline{x}_i]}$,
admits an
$\mathbb E^{C_2}_\infty$-${\operatorname{MU}_{\mathbb{R}}}$-algebra
structure.
:::

:::: proof
*Proof.* Recall that the Real $J$-homomorphism $%
  
    % draw a slightly shorter underline
    \uline{\hphantom{\mathbb{Z}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\mathbb{Z}}}%
  
\times{\operatorname{BU}_{\mathbb{R}}}\to %
  
    % draw a slightly shorter underline
    \uline{\hphantom{\operatorname{Pic}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\operatorname{Pic}}}%
  
_{C_2}(%
  
    % draw a slightly shorter underline
    \uline{\hphantom{\mathrm{Sp}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\mathrm{Sp}}}%
  
^{C_2})$ is an $\mathbb E^{C_2}_\infty$-map of $C_2$-spaces
[@quinnZhu2026multiplicativeequivariantthomspectra Appendix A.2].
Postcomposing this by $%
  
    % draw a slightly shorter underline
    \uline{\hphantom{\operatorname{Pic}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\operatorname{Pic}}}%
  
_{C_2}(%
  
    % draw a slightly shorter underline
    \uline{\hphantom{\mathrm{Sp}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\mathrm{Sp}}}%
  
^{C_2}) \to %
  
    % draw a slightly shorter underline
    \uline{\hphantom{\mathrm{Sp}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\mathrm{Sp}}}%
  
^{C_2}$ yields a map $%
  
    % draw a slightly shorter underline
    \uline{\hphantom{\mathbb{Z}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\mathbb{Z}}}%
  
 \times {\operatorname{BU}_{\mathbb{R}}}\to %
  
    % draw a slightly shorter underline
    \uline{\hphantom{\mathrm{Sp}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\mathrm{Sp}}}%
  
^{C_2}$. Parametrized operadically left Kan extending
[@nardinshah2022equivarianttopos] along the
$\mathbb E_{\infty}^{C_2}$-map $%
  
    % draw a slightly shorter underline
    \uline{\hphantom{\mathbb{Z}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\mathbb{Z}}}%
  
\times{\operatorname{BU}_{\mathbb{R}}}\to %
  
    % draw a slightly shorter underline
    \uline{\hphantom{\mathbb{Z}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\mathbb{Z}}}%$ gives a lax
$C_2$-symmetric monoidal functor $%
  
    % draw a slightly shorter underline
    \uline{\hphantom{\mathbb{Z}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\mathbb{Z}}}%
  
\to %
  
    % draw a slightly shorter underline
    \uline{\hphantom{\mathrm{Sp}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\mathrm{Sp}}}%
  
^{C_2}$. Precomposing with $-\cdot i \colon %
  
    % draw a slightly shorter underline
    \uline{\hphantom{\mathbb{Z}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\mathbb{Z}}}%
  
 \to %
  
    % draw a slightly shorter underline
    \uline{\hphantom{\mathbb{Z}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\mathbb{Z}}}%$, restricting and left
Kan extending along $%
  
    % draw a slightly shorter underline
    \uline{\hphantom{\mathbb{Z}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\mathbb{Z}}}%
  
_{\geq 0}\hookrightarrow %
  
    % draw a slightly shorter underline
    \uline{\hphantom{\mathbb{Z}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\mathbb{Z}}}%$ yields a lax
$C_2$-symmetric monoidal functor $%
  
    % draw a slightly shorter underline
    \uline{\hphantom{\mathbb{Z}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\mathbb{Z}}}%
  
 \to %
  
    % draw a slightly shorter underline
    \uline{\hphantom{\mathrm{Sp}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\mathrm{Sp}}}%
  
^{C_2}$, which we will suggestively call
${\operatorname{MU}_{\mathbb{R}}}[\overline{x}_i]$.

::: center
:::

Forgetting the grading yields an
$\mathbb E^{C_2}_\infty$-${\operatorname{MU}_{\mathbb{R}}}$-algebra,
where the ${\operatorname{MU}_{\mathbb{R}}}$-algebra structure is
induced by the $\mathbb E_\infty^{C_2}$-map
${\operatorname{BU}_{\mathbb{R}}}\to %
  
    % draw a slightly shorter underline
    \uline{\hphantom{\mathbb{Z}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\mathbb{Z}}}%
  
 \times {\operatorname{BU}_{\mathbb{R}}}$ that includes into the
$0$-component. Let us now argue that this construction is indeed a
refinement of the free
$\mathbb E_1$-${\operatorname{MU}_{\mathbb{R}}}$-algebra on a generator
of degree $i\rho$, thus justifying the notation.

The underlying $C_2$-spectrum is
$\bigoplus_{k \geq 0} \Sigma^{ki\rho} {\operatorname{MU}_{\mathbb{R}}}$
by the left Kan extension formula, which is in particular strongly even.
Moreover, the choice of a generator $\overline{x}_i$ in
$\pi_{i\rho}({\operatorname{MU}_{\mathbb{R}}}[\overline{x}_i])$
determines an $\mathbb E_1$-map from the free
$\mathbb E_1$-${\operatorname{MU}_{\mathbb{R}}}$-algebra on a generator
of degree $i\rho$. This is a map between strongly even $C_2$-spectra,
which is an equivalence on underlying, checked on homotopy groups.[^4]
On the other hand, any map between strongly even $C_2$-spectra, which is
an equivalence on underlying, is itself an equivalence [@hillmeier2017
Lemma 3.4]. ◻
::::

::: {#lemma:MURI .corollary}
**Corollary 1**. Let $I\subseteq \mathbb{Z}_{\geq 1}$ and let
$\{\overline{x}_i\}_{i\in I}$ denote a collection of classes in degrees
$i\rho$. Then,
${\operatorname{MU}_{\mathbb{R}}}[\overline{x}_i : i\in I]$ admits an
$\mathbb E^{C_2}_\infty$-${\operatorname{MU}_{\mathbb{R}}}$-algebra
structure.
:::

::: proof
*Proof.* By taking filtered colimits, we may assume that $I$ is finite.
By definition,
${\operatorname{MU}_{\mathbb{R}}}[\overline{x}_i : i\in I]$ is the
tensor product over all $i\in I$ of
${\operatorname{MU}_{\mathbb{R}}}[\overline{x}_i]$ in $%
  
    % draw a slightly shorter underline
    \uline{\hphantom{\mathrm{LMod}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\mathrm{LMod}}}%
  
_{{\operatorname{MU}_{\mathbb{R}}}}$. On the other hand, each copy of
these ${\operatorname{MU}_{\mathbb{R}}}[\overline{x}_i]$ admits an
$\mathbb E^{C_2}_\infty$-${\operatorname{MU}_{\mathbb{R}}}$-algebra
structure by
[1](#construction:designer_MUR_poly){reference-type="ref+label"
reference="construction:designer_MUR_poly"}. ◻
:::

Inspired by a result of Hahn--Yuan [@HahnYuan Theorem 7.1] we formulate
a lifting result using techniques from
[@quinnZhu2026multiplicativeequivariantthomspectra]. The main
application we have in mind involves the polynomial
${\operatorname{MU}_{\mathbb{R}}}$-algebra that we have obtained above.

::: {#prop:lift .proposition}
**Proposition 2**. Let $E$ be a strongly even
$\mathbb E_{\infty}^{C_2}$-spectrum and suppose that
$\pi^{C_2}_{i\rho}(E)$ is finitely generated for each $i\in \mathbb{Z}$.
Any $\mathbb E_2$-map $\Sigma_+^{\infty} \operatorname{BU}\to E^e$ lifts
uniquely to an $\mathbb E_{\rho}$-map
$\Sigma_+^{\infty}{\operatorname{BU}_{\mathbb{R}}}\to E$.
:::

::: proof
*Proof.* Consider the following sequence of equivalences of
$C_2$-mapping spaces: $$\begin{align*}
        %
  
    % draw a slightly shorter underline
    \uline{\hphantom{\operatorname{Map}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\operatorname{Map}}}%
  
_{%
  
    % draw a slightly shorter underline
    \uline{\hphantom{\mathrm{Alg}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\mathrm{Alg}}}%
  
_{\mathbb E_{\rho}}(%
  
    % draw a slightly shorter underline
    \uline{\hphantom{\mathrm{Sp}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\mathrm{Sp}}}%
  
^{C_2})}(\Sigma_+^{\infty}{\operatorname{BU}_{\mathbb{R}}}, E) &\simeq %
  
    % draw a slightly shorter underline
    \uline{\hphantom{\operatorname{Map}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\operatorname{Map}}}%
  
_{%
  
    % draw a slightly shorter underline
    \uline{\hphantom{\mathrm{Alg}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\mathrm{Alg}}}%
  
_{\mathbb E_{\rho}}(%
  
    % draw a slightly shorter underline
    \uline{\hphantom{\mathcal S}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\mathcal S}}%
  
^{C_2})}({\operatorname{BU}_{\mathbb{R}}}, \Omega^{\infty}E)
        \\ &\simeq %
  
    % draw a slightly shorter underline
    \uline{\hphantom{\operatorname{Map}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\operatorname{Map}}}%
  
_{%
  
    % draw a slightly shorter underline
    \uline{\hphantom{\mathrm{Alg}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\mathrm{Alg}}}%
  
_{\mathbb E_{\rho}}^{\mathrm{gp}}(%
  
    % draw a slightly shorter underline
    \uline{\hphantom{\mathcal S}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\mathcal S}}%
  
^{C_2})}({\operatorname{BU}_{\mathbb{R}}}, \operatorname{GL}_1 E)
        \\ &\simeq %
  
    % draw a slightly shorter underline
    \uline{\hphantom{\operatorname{Map}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\operatorname{Map}}}%
  
_{%
  
    % draw a slightly shorter underline
    \uline{\hphantom{\mathcal S}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\mathcal S}}%
  
^{C_2}_*}(\operatorname{BSU}_{\mathbb R}, \mathrm{B}^{\rho}\operatorname{GL}_1 E)
        \\ &\simeq %
  
    % draw a slightly shorter underline
    \uline{\hphantom{\operatorname{Map}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\operatorname{Map}}}%
  
_{%
  
    % draw a slightly shorter underline
    \uline{\hphantom{\mathrm{Sp}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\mathrm{Sp}}}%
  
^{C_2}}(\Sigma^{\infty}\operatorname{BSU}_{\mathbb R}, \Sigma^{\rho}\mathrm{gl}_1 E).
\end{align*}$$ The third and fourth equivalences use the equivariant
recognition theorems, see
[@Guillou2012EquivariantIL; @cnossen2024normedequivariantringspectra; @juran2025genuineequivariantrecognitionprinciple].
Roytman's verification that the Bredon cohomology of
${\operatorname{BSU}_{\mathbb{R}}}$ with coefficients in $%
  
    % draw a slightly shorter underline
    \uline{\hphantom{\mathbb{Z}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\mathbb{Z}}}%$ is strongly even
[@Roytman2023 Theorem 6.1], along with the assumptions we imposed,
allows us to apply our cohomological slice tower techniques
[@quinnZhu2026multiplicativeequivariantthomspectra Remark 5.3.9] to
obtain the desired liftings. ◻
:::

::: {#prop: lift .corollary}
**Corollary 2**. Let $I\subseteq \mathbb{Z}_{\geq 1}$ and let
$\{\overline{x}_i\}_{i\in I}$ denote a collection of classes in degrees
$i\rho$. Then any $\mathbb E_2$-map
$\Sigma^\infty_+\operatorname{BU}\to \operatorname{MU}[{x}_i : i\in I]$
lifts uniquely to an $\mathbb E_\rho$-ring map
$\Sigma^\infty_+\operatorname{BU}_{\mathbb R}\to {\operatorname{MU}_{\mathbb{R}}}[\overline{x}_i : i\in I]$.
:::

::: proof
*Proof.* By construction,
${\operatorname{MU}_{\mathbb{R}}}[\overline{x}_i:i\in I]$ is strongly
even and satisfies the finiteness condition in
[2](#prop:lift){reference-type="ref+label" reference="prop:lift"}.
Moreover, ${\operatorname{MU}_{\mathbb{R}}}[\overline{x}_i:i\in I]$
admits an
$\mathbb E^{C_2}_\infty$-${\operatorname{MU}_{\mathbb{R}}}$-algebra
structure by [1](#lemma:MURI){reference-type="ref+label"
reference="lemma:MURI"}. The result follows from
[2](#prop:lift){reference-type="ref+label" reference="prop:lift"}. ◻
:::

### Multiplication on quotients of Real bordism {#sec:MUR_quotients}

In this section, we prove
[1](#main:MUR_quotients){reference-type="ref+label"
reference="main:MUR_quotients"}. The main goal of this section is to
endow quotients with a multiplicative structure. Let us begin by
recalling the notion of *quotients* in (equivariant) higher algebra.

::: {#definition: quotient .definition}
**Definition 1**. Let $A$ be an $\mathbb E_{\infty}^G$-algebra and $I$
be an indexing set. Consider classes $x_i \in \pi_{V_i}^G A$ for
$G$-representations $V_i$. Then, we define the
[quotient]{style="color: chillired"} of $A$ by $(x_i)_{i \in I}$ by
$$\textcolor{chillired}{A/(x_i)_{i \in I}} \coloneqq A \otimes_{A[x_i : i \in I]} A,$$
with the following relevant maps:

(i) The augmentation map $A[x_i: i \in I] \to A$ is the
    $\mathbb E_1$-algebra map determined by $x_i \mapsto 0$.[^5] This
    endows $A$ with a left $A[x_i : i \in I]$-module structure.

(ii) The classes $(x_i)_{i \in I}$ determine an
     $\mathbb E_1$-$A$-algebra map $A[x_i : i \in I] \to A$ by sending
     $x_i$ to $x_i$. In particular, the base change functor
     $A \otimes_{A[x_i: i \in I]} -$ is defined.

This definition agrees with taking a filtered colimit along iterated
cofibers, as demonstrated in [@HHR16 Section 2.4.3]. The augmentation
map $A[x_i : i \in I] \to A$ in particular induces the projection map
$A \to A/(x_i)_{i \in I}$.
:::

Many important $C_2$-spectra are quotients of
${\operatorname{MU}_{\mathbb{R}}}$, hence the importance of this
definition. This relative tensor product description is better suited to
discuss multiplicative structure, which is the reason we chose this
definition. To study equivariant multiplicative structures with this
construction, we will naturally need a robust theory of parametrized
left module categories. We developed such a theory in
[@quinnZhu2026multiplicativeequivariantthomspectra].

We single out a class of examples that we are particularly interested
in, namely the Real Brown--Peterson spectra.

::: {#example: BPRJ .example}
**Example 1**. Fix a choice of indecomposable polynomial generators
$\pi_* \operatorname{MU}_{(2)} \cong \mathbb{Z}_{(2)}[x_1, x_2, x_3, \cdots]$
with $|x_i| = 2i$ and write $v_i = x_{2^i-1}$. Since
$\operatorname{MU}_{\mathbb R(2)}$ is a strongly even ring spectrum, we
obtain a lift
$$\pi_{*\rho}^{C_2} \operatorname{MU}_{\mathbb R(2)} \cong \mathbb{Z}_{(2)}[\overline{x}_1, \overline{x}_2, \overline{x}_3, \cdots]$$
with $|\overline{x}_i| = i \rho$ and we write
$\overline{v}_i = \overline{x}_{2^i -1}$. In particular, one obtains
${\operatorname{BP}_{\mathbb{R}}}\simeq {\operatorname{MU}_{\mathbb{R}}}/(\overline{x}_i : i \neq 2^j -1 \text{ for some j})$
and we have
$\pi_{*\rho}^{C_2} {\operatorname{BP}_{\mathbb{R}}}\cong \mathbb{Z}_{(2)}[\overline{v}_1, \overline{v}_2, \overline{v}_3, \cdots]$.

Now fix a subset $J \subseteq \mathbb{Z}_{\geq 1}$. Then, we define
$$\textcolor{chillired}{{\operatorname{BP}_{\mathbb{R}}}\langle J \rangle} \coloneqq {\operatorname{BP}_{\mathbb{R}}}/(\overline{v}_j : j \not \in J) \simeq {\operatorname{MU}_{\mathbb{R}}}/(\overline{x}_i, \overline{v}_j : i \neq 2^k - 1, j \not \in J).$$
This recovers classical examples. Let $n \geq 1$.

(i) We obtain a form of the Real truncated Brown--Peterson spectra
    ${\operatorname{BP}_{\mathbb{R}}\langle n\rangle}\simeq {\operatorname{BP}_{\mathbb{R}}}\langle \{1,2,\cdots,n \} \rangle$,
    in the sense of [@hillmeier2017 Definition 3.15].[^6]

(ii) Let $n \geq 1$. Then,
     ${\operatorname{BP}_{\mathbb{R}}}\langle i \geq n \rangle$ is a
     Real version of the classical $P(n)$ spectra.

(iii) Fix two positive integers $k \leq m$. Then,
      ${\operatorname{BP}_{\mathbb{R}}}\langle k,m \rangle \coloneqq {\operatorname{BP}_{\mathbb{R}}}\langle i \geq 1 : k \leq i \leq m \rangle$.
      For example,
      ${\operatorname{BP}_{\mathbb{R}}}\langle n, n \rangle$ is the
      integral connective $n$-th Real Morava $K$-theory.

These are important examples of quotients, which were e.g. studied in
[@beaudryhilllawsonshizeng2025slicequotientsnorms], particularly in the
higher group case. We will recall those in
[2](#example: BPGJ){reference-type="ref+label"
reference="example: BPGJ"}.
:::

::: {#lemma: enhance structure of quotients .lemma}
**Lemma 1**. Let $A$ be an $\mathbb E_{\infty}^G$-algebra and $I$ be an
indexing set. Consider classes $x_i \in \pi_{V_i}^G A$ for
$G$-representations $V_i$. Let $V$ be another $G$-representation.
Suppose that $A[x_i : i \in I]$ refines to an
$\mathbb E_{\mathbb R\oplus V}$-algebra and that the structure maps
$A[x_i : i \in I] \to A$ from
[1](#definition: quotient){reference-type="ref+label"
reference="definition: quotient"} refine to
$\mathbb E_{\mathbb R\oplus V}$-algebra maps. Then, $A/(x_i)_{i \in I}$
refines to an $\mathbb E_V$-algebra.
:::

:::: proof
*Proof.* By restricting along the Dunn map
$\mathbb E_1 \otimes \mathbb E_V \to \mathbb E_{\mathbb R\oplus V}$, we
obtain maps of $\mathbb E_1 \otimes \mathbb E_V$-algebras [@StewartDunn
Theorem III.2.2]. Now, by
[@quinnZhu2026multiplicativeequivariantthomspectra Corollary 3.3.9] the
base change functors are $\mathbb E_V$-monoidal. So first, consider the
composition

::: center
:::

Plugging in $A[x_i:i \in I]$ endows $A$ with an
$\mathbb E_V$-$A[x_i:i \in I]$-algebra structure. Since the base change
functor is also $\mathbb E_V$-monoidal, the resulting quotient is then
an $\mathbb E_V$-algebra. ◻
::::

The main candidate for $A$ is one of the designer polynomial algebras
from the previous section, which will be the setting for the following
result.

::: {#thm:MUR_quotients .theorem}
**Theorem 1**. Let $I\subseteq \mathbb{Z}_{\geq 1}$ and let
$\{\overline{x}_{i}\}_{i\in I}$ be a collection of classes with
$\overline{x}_i\in \pi^{C_2}_{i\rho}{\operatorname{MU}_{\mathbb{R}}}$.
Then ${\operatorname{MU}_{\mathbb{R}}}/(\overline{x}_i:i\in I)$ admits
an $\mathbb E_\sigma$-${\operatorname{MU}_{\mathbb{R}}}$-algebra
structure.
:::

::: proof
*Proof.* Let
$R \coloneqq {\operatorname{MU}_{\mathbb{R}}}[y_j\vert j\in \mathbb{Z}_{\geq 1}\setminus I]$
with $|y_j| = j\rho$. Then $R$ is a strongly even
$\mathbb E^{C_2}_\infty$-${\operatorname{MU}_{\mathbb{R}}}$-algebra by
[1](#lemma:MURI){reference-type="ref+label" reference="lemma:MURI"}.
Moreover,
$$R/(\overline{x}_i,y_j: i\in I, j\in\mathbb{Z}_{\geq 1}\setminus I) \simeq {\operatorname{MU}_{\mathbb{R}}}/(\overline{x}_i :i\in I).$$
So, it suffices to construct
$R/(\overline{x}_i,y_j: i\in I, j\in\mathbb{Z}_{\geq 1}\setminus I)$ as
an $\mathbb E_\sigma$-$R$-algebra. Then we can forget down to an
$\mathbb E_\sigma$-${\operatorname{MU}_{\mathbb{R}}}$-algebra structure.

In constructing this $\mathbb E_\sigma$-$R$-algebra structure, the
difference between $\overline{x}_i$ and $y_j$ is unimportant. So we
write $R/(\overline{z}_1,\overline{z}_2,\overline{z}_3,\ldots)$ instead
of $R/(x_i,y_j: i\in I, j\in\mathbb{Z}_{\geq 1}\setminus I)$. By
[1](#definition: quotient){reference-type="ref+label"
reference="definition: quotient"} this is described as a relative tensor
product
$$R/(\overline{z}_1, \overline{z}_2, \overline{z}_3, \cdots) = R \otimes_{R[\overline{z}_1, \overline{z}_2, \overline{z}_3, \cdots]} R.$$
By
[1](#lemma: enhance structure of quotients){reference-type="ref+label"
reference="lemma: enhance structure of quotients"} we wish to enhance
the relevant maps
$R[\overline{z}_1, \overline{z}_2, \overline{z}_3, \cdots] \to R$ to
$\mathbb E_{\rho}$-algebra maps.

Since $R$ is Real orientable, $R[{\operatorname{BU}_{\mathbb{R}}}]$ is
equivalent to $R[z_1,z_2,z_3,\ldots]$ with $|z_{i}| = i\rho$ as
$\mathbb E_1$-$R$-algebras. This gives two $\mathbb E_1$-$R$-algebra
maps
$R[{\operatorname{BU}_{\mathbb{R}}}]\simeq R[z_1,z_2,z_3,\ldots] \to R$,
such that $R\otimes_{R[{\operatorname{BU}_{\mathbb{R}}}]}R$ is
equivalent to $R/(z_1,z_2,z_3,\ldots)$. It remains to refine these maps
to $\mathbb E_\rho$-$R$-algebra maps, which we do using
[2](#prop: lift){reference-type="ref+label" reference="prop: lift"} now.

By adjunction, an $\mathbb E_1$-$R$-algebra map
$R[{\operatorname{BU}_{\mathbb{R}}}]\to R$ is equivalent to an
$\mathbb E_1$-algebra map
$\Sigma^\infty_+{\operatorname{BU}_{\mathbb{R}}}\to R$. This forgets to
a non-equivariant $\mathbb E_1$-algebra map
$\Sigma^\infty_+\operatorname{BU}\to R^e$. By [@HahnYuan Theorem 7.1]
this lifts to an $\mathbb E_2$-map
$\Sigma^\infty_+\operatorname{BU}\to R^e$. By
[2](#prop: lift){reference-type="ref+label" reference="prop: lift"}, it
further refines to an $\mathbb E_\rho$-algebra map
$\Sigma^\infty_+{\operatorname{BU}_{\mathbb{R}}}\to R$. By adjunction,
this defines an $\mathbb E_\rho$-$R$-algebra map
$R[{\operatorname{BU}_{\mathbb{R}}}] \to R$, thus refining the map we
started with. ◻
:::

::: remark
**Remark 1**. This proof recovers a version of the classical
non-equivariant result that quotients of $\operatorname{MU}$ obtain an
$\mathbb E_1$-algebra structure, see [@hahn2018quotientsrings].
:::

In particular, we recover a $C_2$-equivariant version of
Basu--Sagave--Schlichtkrull's result [@Basu_2017 Theorem 5.6], which
writes quotients of $\operatorname{MU}$ as Thom spectra over
$\operatorname{SU}(n)$ resp. $\operatorname{SU}$.

::: {#corollary: Real BSS .corollary}
**Corollary 3**. Let $I\subseteq \mathbb{Z}_{\geq 1}$ and let
$\{\overline{x}_i\}_{i\in I}$ be a collection of elements with
$\overline{x}_i \in \pi^{C_2}_{i\rho}{\operatorname{MU}_{\mathbb{R}}}$.
Then, there exists an $\mathbb E_{\sigma}$-algebra map
$\mathrm{B}^2 \mathrm{U}_{\mathbb R} \to \operatorname{BGL}_1 R$ such
that
$$\operatorname{MU}_{\mathbb R}/(\overline{x}_i : i \in I) \simeq \operatorname{Th}_{C_2}(\mathrm{B}^2 \mathrm{U}_{\mathbb R} \to \operatorname{BGL}_1 R).$$
Here,
$R = {\operatorname{MU}_{\mathbb{R}}}[y_j\vert j\in \mathbb{Z}_{\geq 1}\setminus I]$
with $|y_j| = j\rho$ is the algebra from
[1](#thm:MUR_quotients){reference-type="ref+label"
reference="thm:MUR_quotients"}.
:::

::: proof
*Proof.* In [1](#thm:MUR_quotients){reference-type="ref+label"
reference="thm:MUR_quotients"} we showed
$$\operatorname{MU}_{\mathbb R}/(x_i : i \in I) \simeq R\otimes_{R[\operatorname{BU}_{\mathbb R}]} R$$
and in particular obtained an $\mathbb E_{\rho}$-$R$-algebra map
$R[\operatorname{BU}_{\mathbb R}] \to R$ to define this base change. By
adjunction, it corresponds to an $\mathbb E_{\sigma}$-algebra map
$\mathrm B^2 U_{\mathbb R} \to \operatorname{BGL}_1 R$. Since
$\operatorname{Th}_{C_2}$ is symmetric monoidal and colimit-preserving,
we can massage the Thom spectrum of a bar construction into the desired
relative tensor product:
$\operatorname{Th}_{C_2}(\mathrm{B}^2 \mathrm{U}_{\mathbb R} \to \operatorname{BGL}_1 R) \simeq R\otimes_{R[\operatorname{BU}_{\mathbb R}]} R$. ◻
:::

::: {#remark: BSS hard .remark}
**Remark 2**. Note that
$\mathrm{B^2} \mathrm{U}_{\mathbb R} \simeq \mathrm{B} \Omega^{\sigma} \operatorname{SU}_{\mathbb R}$.
This restricts to $\operatorname{SU}$ on underlying, and explains the
difficulty of generalizing [@Basu_2017 Theorem 5.6] to the Real setting.
In doing so, one needs to take
$\mathrm{B}\Omega^{\sigma} \operatorname{SU}_{\mathbb R}$ as a
$C_2$-equivariant lift of $\operatorname{SU}$, not
$\operatorname{SU}_{\mathbb R}$. However, even with this realization, it
seems hard to naively mimic Basu--Sagave--Schlichtkrull's arguments to
the $C_2$-equivariant setting without lifting techniques such as the
ones we employ here.

The main result [@Basu_2017 Theorem 5.6] builds on the classical map
$\mathbb{CP}^{n-1} \to \Omega \operatorname{SU}(n)$, which is
e.g. defined in [@HahnYuan Introduction]. We checked that this enhances
to a $C_2$-map
$\mathbb{CP}_{\mathbb{R}}^{n-1} \to \Omega^{\sigma} \operatorname{SU}_{\mathbb R}(n)$.
However, several complications still show up in trying to naively mimic
the strategy in [@Basu_2017].

Nonetheless, we expect that this $C_2$-enhancement along with
[2](#prop: lift){reference-type="ref+label" reference="prop: lift"} is a
first step towards a Real equivariant version of Hahn--Yuan's result,
and thereby gives a direction towards [@HahnYuan Question 4].
:::

::: {#remark: MUR quotient theorem .remark}
**Remark 3**.

(i) More generally, we can base change along any $\mathbb E_{\rho}$-map
    ${\operatorname{MU}_{\mathbb{R}}}\to E$. By
    [@quinnZhu2026multiplicativeequivariantthomspectra Corollary 6.2.2]
    we are thus able to give an $\mathbb E_{\sigma}$-structure on
    quotients of strongly even $\mathbb E_{\infty}^{C_2}$-rings by
    homogeneous elements coming from ${\operatorname{MU}_{\mathbb{R}}}$.

(ii) So far we have worked integrally. All constructions and results
     used have obvious $(2)$-local analogues. Moreover, the proofs in
     the $(2)$-local setting follow mutatis mutandis from the integral
     ones. This gives a $(2)$-local version of
     [1](#thm:MUR_quotients){reference-type="ref+label"
     reference="thm:MUR_quotients"}.

(iii) Let $i > 0$, then ${\operatorname{BP}_{\mathbb{R}}}/v_i$ does not
      admit the structure of a homotopy associative ring
      [@bachmannHahn2022nilpotencenormedmglmodules Example 3.15], so in
      particular there is no $\mathbb E_1$-analog of
      [1](#thm:MUR_quotients){reference-type="ref+label"
      reference="thm:MUR_quotients"}.
:::

As an immediate application, we obtain an
$\mathbb E_{\sigma}$-${\operatorname{MU}_{\mathbb{R}}}$-algebra
structure on $C_2$-spectra of interest.

::: {#cor:BPRnkRn .corollary}
**Corollary 4**. Let $J \subseteq \mathbb{Z}_{\geq 1}$. Then,
${\operatorname{BP}_{\mathbb{R}}}\langle J \rangle$ admits an
$\mathbb E_{\sigma}$-${\operatorname{MU}_{\mathbb{R}}}$-algebra
structure.
:::

By [1](#example: BPRJ){reference-type="ref+label"
reference="example: BPRJ"} this in particular includes the truncated
Real Brown--Peterson spectra
${\operatorname{BP}_{\mathbb{R}}\langle n\rangle}$ and the integral
connective Real Morava $K$-theories.

One of the main interests in $\mathbb E_\sigma$-algebra structures is
their connection to Real trace methods. An $\mathbb E_\sigma$-algebra
structure allows one to define Real topological Hochschild homology. As
an immediate corollary of
[1](#thm:MUR_quotients){reference-type="ref+label"
reference="thm:MUR_quotients"}, we will be able to apply
$\mathrm{THR}(-)$ to such quotients of
${\operatorname{MU}_{\mathbb{R}}}$.

::: remark
**Remark 4**. Both
$\mathrm{THR}({\operatorname{BP}_{\mathbb{R}}\langle n\rangle})$ and
$\mathrm{THR}({\operatorname{BP}_{\mathbb{R}}\langle n\rangle}/{\operatorname{MU}_{\mathbb{R}}})$
are defined for all $n$.
:::

This should be the starting point of running the story of
[@gabe2025realsyntomiccohomology] for
${\operatorname{BP}_{\mathbb{R}}\langle n\rangle}$ with $n \geq 3$.

### Multiplication on twisted monoid quotients of normed bordism {#sec:MUG_quotients}

Let us recall Hill--Hopkins--Ravenel's method of *twisted monoid rings*
from [@HHR16 Section 2.4.2], which yields a normed variant of the
classical quotient notion
([1](#definition: quotient){reference-type="ref+label"
reference="definition: quotient"}). We will work in less generality. We
specialize their construction to the case where the spectrum we want to
form twisted monoid ring quotients of is the Hill--Hopkins--Ravenel norm
of a $\mathbb E^{C_2}_\infty$-ring spectrum.

Due to the similarity of the definitions, the arguments will also be
almost identical. Nonetheless, we will need to spell these out again,
since twisted monoid ring quotients are not a special case of quotients.

::: {#construction:TMR2 .construction}
**Construction 1** ([@HHR16 Section 2.4]). Fix a finite group
$G \geq C_2$. Let $R$ be an $\mathbb E^{C_2}_\infty$-ring spectrum.
Moreover, let $I\subseteq \mathbb{Z}_{\geq 1}$ and let
$\{\overline{x}_i\}_{i\in I}$ be a collection of elements with
$\overline{x}_i\in \pi^{C_2}_{i\rho} {R^{(\!(G)\!)}}$.

(i) We write
    $\textcolor{chillired}{{R^{(\!(G)\!)}}} \coloneqq N^G_{C_2}R$ and
    $\textcolor{chillired}{R^{( \! ( G ) \! )}[G \cdot \overline{x}_i : i \in I]} \coloneqq N_{C_2}^G(R[\overline{x}_i : i \in I])$.

(ii) We define the [twisted monoid ring
     quotient]{style="color: chillired"} as the relative tensor product
     $$\textcolor{chillired}{{R^{(\!(G)\!)}}/(G\cdot \overline{x}_i:i\in I)} \coloneqq {R^{(\!(G)\!)}}\otimes_{{R^{(\!(G)\!)}}[G\cdot \overline{x}_i:i\in I]}{R^{(\!(G)\!)}},$$
     consisting of the following structure:

     First, sending $\overline{x}_i$ to $0$ determines augmentation maps
     $R[\overline{x}_i : i \in I] \to \operatorname{Res}_{C_2}^G R^{( \! ( G ) \! )}$
     as $\mathbb E_1$-$R$-algebra maps. The composite
     $${R^{(\!(G)\!)}}[G\cdot \overline{x}_i:i\in I] = N^G_{C_2}(R[\overline{x}_i:i\in I])\longrightarrow N^{G}_{C_2}\mathrm{Res}^G_{C_2}{R^{(\!(G)\!)}}\longrightarrow {R^{(\!(G)\!)}}$$
     is an $\mathbb E_1$-algebra map. This gives $R^{( \! ( G ) \! )}$
     the structure of a left
     ${R^{(\!(G)\!)}}[G\cdot \overline{x}_i:i\in I]$-module.

     On the other hand, the elements
     $\overline{x}_i \in \pi_{i\rho}^{C_2} R^{( \! ( G ) \! )}$ define a
     $\operatorname{Coind}_{C_2}^G \mathbb E_1$-$R^{( \! ( G ) \! )}$-algebra
     map
     $${R^{(\!(G)\!)}}[G\cdot \overline{x}_i:i\in I] = N^G_{C_2}(R[\overline{x}_i:i\in I])\longrightarrow N^{G}_{C_2}\mathrm{Res}^G_{C_2}{R^{(\!(G)\!)}}\longrightarrow {R^{(\!(G)\!)}}$$
     in the same fashion, so we can base change along this.

The augmentation map
${R^{(\!(G)\!)}}[G\cdot \overline{x}_i:i\in I] \to {R^{(\!(G)\!)}}$,
i.e. the first of these composites, induces the projection map
${R^{(\!(G)\!)}}\to {R^{(\!(G)\!)}}/(G \cdot \overline{x}_i : i \in I)$.
:::

In principle, we could have phrased
[2.2](#sec:MUR_quotients){reference-type="ref+label"
reference="sec:MUR_quotients"} in this generality and recovered the
results there as a special case for $G = C_2$. For readability we
decided to split it into two parts.

In
[4](#section: twisted monoid quotients via parametrized colimits){reference-type="ref+label"
reference="section: twisted monoid quotients via parametrized colimits"}
we give an alternative viewpoint of twisted monoid quotients through
parametrized colimits. Working with that definition could have been a
different entry point to the theory, but we have decided to keep close
to the classical language.

This subsection concerns multiplicative structures on normed equivariant
ring spectra, which are naturally given by coinduced equivariant
operads, see e.g. [@quinnZhu2026multiplicativeequivariantthomspectra
Construction 2.2.5]. We will essentially only need
[@quinnZhu2026multiplicativeequivariantthomspectra Construction 2.2.5,
Corollary 6.1.6] about this construction.

::: {#lemma: enhance structure of twisted monoid quotients .lemma}
**Lemma 2**. Let $A$ be an $\mathbb E_{\infty}^{C_2}$-algebra and $I$ be
an indexing set. Consider classes
$\overline{x}_i \in \pi_{V_i}^{C_2} A^{( \! ( G ) \! )}$ for
$C_2$-representations $V_i$. Let $V$ be another $C_2$-representation.
Suppose that $A[\overline{x}_i : i \in I]$ refines to an
$\mathbb E_{\mathbb R\oplus V}$-algebra and that the structure maps
$$A[\overline{x}_i : i \in I] \longrightarrow \operatorname{Res}_{C_2}^G A^{( \! ( G ) \! )}$$
from [1](#construction:TMR2){reference-type="ref+label"
reference="construction:TMR2"} refine to
$\mathbb E_{\mathbb R\oplus V}$-algebra maps. Then,
$A^{( \! ( G ) \! )}/(G \cdot x_i)_{i \in I}$ refines to a
$\operatorname{Coind}_{C_2}^G\mathbb E_V$-algebra.
:::

::: proof
*Proof.* Restricting $\mathbb E_{\mathbb R\oplus V}$ along the Dunn map
yields $\mathbb E_1 \otimes \mathbb E_V$-structures [@StewartDunn
Theorem III.2.2]. By [@quinnZhu2026multiplicativeequivariantthomspectra
Construction 2.2.5] the $G$-spectrum
$A^{( \! ( G ) \! )}[G \cdot \overline{x}_i]$ obtains a
$\operatorname{Coind}_{C_2}^G(\mathbb E_1 \otimes \mathbb E_V)$-algebra
structure and the composite maps
$$A^{( \! ( G ) \! )}[G\cdot \overline{x}_i:i\in I] = N^G_{C_2}(A[\overline{x}_i:i\in I])\longrightarrow N^{G}_{C_2}\mathrm{Res}^G_{C_2}A^{( \! ( G ) \! )} \longrightarrow A^{( \! ( G ) \! )}$$
refine to
$\operatorname{Coind}_{C_2}^G(\mathbb E_1 \otimes \mathbb E_V)$-algebra
maps. We now check that there is a map
$$\mathbb E_1 \otimes \operatorname{Coind}_{C_2}^G \mathbb E_V \longrightarrow \operatorname{Coind}_{C_2}^G(\mathbb E_1 \otimes \mathbb E_V)$$
of $G$-$\infty$-operads. Afterwards, we obtain the desired algebra
structures by base changing as in
[1](#lemma: enhance structure of quotients){reference-type="ref+label"
reference="lemma: enhance structure of quotients"}.

By adjunction, such a map is equivalent to a map
$$\operatorname{Res}_{C_2}^G (\mathbb E_1 \otimes \operatorname{Coind}_{C_2}^G \mathbb E_{V}) \longrightarrow \mathbb E_1 \otimes \mathbb E_{V}.$$
Stewart proved that $%
  
    % draw a slightly shorter underline
    \uline{\hphantom{\mathrm{Op}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\mathrm{Op}}}%
  
_{G, \infty}$ has a $G$-symmetric monoidal enhancement
[@stewart2025tensorproductsequivariantcommutative Corollary E']. So the
associated restriction maps are symmetric monoidal
[@quinnZhu2026multiplicativeequivariantthomspectra Lemma A.1.1]. Thus,
we may take the map
$$\operatorname{Res}_{C_2}^G (\mathbb E_1 \otimes \operatorname{Coind}_{C_2}^G \mathbb E_{V}) \simeq \mathbb E_1 \otimes \operatorname{Res}_{C_2} \operatorname{Coind}_{C_2}^G \mathbb E_{V} \xrightarrow{\mathbb E_1 \otimes \varepsilon_{\mathbb E_{V}}} \mathbb E_1 \otimes \mathbb E_{V}$$
induced by the counit. ◻
:::

::: remark
**Remark 5**. One can set up twisted monoid quotients in more generality
for arbitrary $\mathbb E_{\infty}^G$-ring spectra and subgroups
$H \leq G$ following Hill--Hopkins--Ravenel [@HHR16]. We chose to
restrict to examples $R^{( \! ( G ) \! )}$ to be able to phrase
[2](#lemma: enhance structure of twisted monoid quotients){reference-type="ref+label"
reference="lemma: enhance structure of twisted monoid quotients"} in its
current form.
:::

::: {#thm:MUG_quotients .theorem}
**Theorem 2**. Let $I\subseteq \mathbb{Z}_{\geq 1}$ and let
$\{\overline{x}_{i}\}_{i\in I}$ be a collection of elements with
$\overline{x}_i\in \pi^{C_2}_{i\rho}{\operatorname{MU}^{(\!(G)\!)}}$.
Then, ${\operatorname{MU}^{(\!(G)\!)}}/(G\cdot \overline{x}_i:i\in I)$
admits a
$\operatorname{Coind}^G_{C_2}\mathbb E_\sigma$-${\operatorname{MU}^{(\!(G)\!)}}$-algebra
structure.
:::

::: proof
*Proof.* Let
$R \coloneqq {\operatorname{MU}_{\mathbb{R}}}[\overline{y}_j:j\in \mathbb{Z}_{\geq 1}\setminus I]$.
It is an
$\mathbb E^{C_2}_\infty$-${\operatorname{MU}_{\mathbb{R}}}$-algebra by
[1](#lemma:MURI){reference-type="ref+label" reference="lemma:MURI"}.
Then,
$${R^{(\!(G)\!)}}\simeq {\operatorname{MU}^{(\!(G)\!)}}[G\cdot\overline{y}_j:j\in \mathbb{Z}_{\geq 1}\setminus I].$$
Hence, $$\begin{align*}
        {\operatorname{MU}^{(\!(G)\!)}}/(G\cdot\overline{x}_i :i\in I) &\simeq {R^{(\!(G)\!)}}/(G\cdot\overline{x}_i, G\cdot \overline{y}_j :i\in I, j\in \mathbb{Z}_{\geq 1}\setminus I)
        \\ &= {R^{(\!(G)\!)}}\otimes_{{R^{(\!(G)\!)}}[G \cdot \overline{x}_i, G \cdot \overline{y}_j : i \in I, j \in \mathbb{Z}_{\geq 1} \setminus I]} {R^{(\!(G)\!)}}.
\end{align*}$$ The difference between $\overline{x}_i$ and
$\overline{y}_j$ is not important for the purpose of constructing
multiplicative structures. So instead of
${R^{(\!(G)\!)}}/(G\cdot\overline{x}_i, G\cdot \overline{y}_j :i\in I, j\in \mathbb{Z}_{\geq 1}\setminus I)$
we write
${R^{(\!(G)\!)}}/(G\cdot\overline{z}_1,G\cdot\overline{z}_2,\ldots)$.

By
[2](#lemma: enhance structure of twisted monoid quotients){reference-type="ref+label"
reference="lemma: enhance structure of twisted monoid quotients"} we
need to enhance the relevant map
$R[\overline{z}_1,\overline{z}_2,\ldots ]\to \mathrm{Res}^G_{C_2}{R^{(\!(G)\!)}}$
to an $\mathbb E_\rho$-$R$-algebra map. As in the proof of
[1](#thm:MUR_quotients){reference-type="ref+label"
reference="thm:MUR_quotients"}, the source is equivalent to
$R[{\operatorname{BU}_{\mathbb{R}}}]$, so this follows from
[2](#prop:lift){reference-type="ref+label" reference="prop:lift"}. ◻
:::

::: remark
**Remark 6**. As in the previous subsection,
[2](#thm:MUG_quotients){reference-type="ref+label"
reference="thm:MUG_quotients"} has an obvious $(2)$-local version.
:::

The main interest in the twisted monoid ring construction lies in the
case $G = C_{2^n}$, where it has been used to construct the higher
truncated Brown--Peterson spectra. To discuss its multiplicative
structure, we will introduce another base change.

::: {#definition: module twisted monoid quotient .definition}
**Definition 2** ([@HHR16 Section 2.4.3]). Let $R$ be an
$\mathbb E^G_\infty$-ring and let $R \to A$ be an $\mathbb E_1$-algebra
map. Let $I$ be an indexing set and let $\{\overline{x}_{i}\}_{i\in I}$
be a collection of elements with $\overline{x}_i\in \pi^{C_2}_{i\rho}R$.
Then, we define
$$\textcolor{chillired}{A/(G\cdot \overline{x}_{i} : i\in I)}\coloneqq A \otimes_R R/(G\cdot \overline{x}_{i} : i\in I).$$
:::

::: {#example: BPGJ .example}
**Example 2** ([@beaudryhilllawsonshizeng2025slicequotientsnorms Section
2]). Let $G = C_{2^n}$. By [@HHR16 Section 5] we can fix a choice of
generators such that
$$\pi^{C_2}_{*\rho}{\operatorname{BP}^{(\!(G)\!)}}\cong\mathbb{Z}_{(2)}[G\cdot \overline{t}_1,G\cdot \overline{t}_2,\ldots].$$
Since ${\operatorname{BP}^{(\!(G)\!)}}$ is a summand of
${\operatorname{MU}_{(2)}^{(\!(G)\!)}}$, we may view these elements as
elements in $\pi^{C_2}_{*\rho}{\operatorname{MU}_{(2)}^{(\!(G)\!)}}$.
Now let $J \subseteq \mathbb{Z}_{\geq 1}$. Then,
$$\textcolor{chillired}{{\operatorname{BP}^{(\!(G)\!)}}\langle J \rangle} \coloneqq {\operatorname{BP}^{(\!(G)\!)}}/(G \cdot \overline{t}_j : j \not \in J) \simeq {\operatorname{BP}^{(\!(G)\!)}}\otimes_{\operatorname{MU}^{( \! ( G ) \! )}_{(2)}} \operatorname{MU}^{( \! ( G ) \! )}_{(2)}/(G \cdot \overline{t}_j : j \not \in J)$$
In particular, this recovers [(forms of) higher truncated
Brown--Peterson spectra]{style="color: chillired"} as
$$\textcolor{chillired}{{\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle} \coloneqq {\operatorname{BP}^{(\!(G)\!)}}\langle \{1, \cdots, m \} \rangle \simeq {\operatorname{BP}^{(\!(G)\!)}}/(G \cdot \overline{t}_{m+1}, G \cdot \overline{t}_{m+2}, \cdots).$$
:::

::: {#lem:basechange .lemma}
**Lemma 3**. Let $R$ be a $\mathbb E^{G}_\infty$-ring and let
$\mathscr{O}^{\otimes}$ be a $G$-$\infty$-operad. Suppose that $M$ is an
$R$-module through an $\mathbb E_1 \otimes \mathscr{O}$-algebra map
$R\to M$. If $R/(G\cdot \overline{x}_{i} : i\in I)$ admits an
$\mathscr{O}$-$R$-algebra structure, then
$M/(G\cdot \overline{x}_{i} : i\in I)$ admits an
$\mathscr{O}$-$M$-algebra structure.
:::

::: proof
*Proof.* The base change along $R \to M$ is $\mathscr{O}$-monoidal by
[@quinnZhu2026multiplicativeequivariantthomspectra Corollary 3.3.9]. ◻
:::

Our techniques now yield:

::: corollary
**Corollary 5**. Let $G=C_{2^n}$ and $J \subseteq \mathbb{Z}_{\geq 1}$.
Then, ${\operatorname{BP}^{(\!(G)\!)}}\langle J \rangle$ admits a
$\operatorname{Coind}_{C_2}^G \mathbb E_{\sigma}$-${\operatorname{BP}^{(\!(G)\!)}}$-algebra
structure.
:::

This in particular provides a first multiplicative structure on the
higher truncated Brown--Peterson spectra
${\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle$.

## Orientations by twisted monoid quotients

### Factorization through twisted monoid quotients

Having just studied the structure on twisted monoid quotients, we are
motivated to study maps out of these objects. Our main objective is to
orient Lubin--Tate theory by higher truncated Brown--Peterson spectra.
Let us begin in a general setting, although we will quickly specialize
to the examples of interest.

:::: {#prop: factorization .proposition}
**Proposition 3**. Let $A$ and $B$ be $\mathbb E^G_\infty$-ring spectra
and $f\colon A\to B$ be a
$\operatorname{Coind}_H^G \mathbb{E}_{1}$-algebra map. Fix $H\leq G$,
and let $\{x_i\}_{i\in I}$ be a collection of elements in
$\pi^H_\star(A)$, i.e., maps
$x_i\colon \mathbb{S}^{V_i}\to \mathrm{Res}^G_H A$. Suppose that
$f(x_i)=0$ in $\pi^H_\star(B)$ for all $i\in I$. Then, there is a
factorization

::: center
:::

of $A$-modules, where $A \to A/(G\cdot x_i : i\in I)$ is the projection
map and $B$ is an $A$-module through $f$.
::::

:::::: proof
*Proof.* Composing the augmentation with $f$ yields a map

::: center
:::

of $\mathbb E_1$-algebras. Functoriality of the bar construction yields
a commutative diagram

::: center
:::

By definition ([1](#construction:TMR2){reference-type="ref+label"
reference="construction:TMR2"},
[2](#definition: module twisted monoid quotient){reference-type="ref+label"
reference="definition: module twisted monoid quotient"}) we have
$$A/(G\cdot x_i : i\in I) = A\otimes_{A [G\cdot x_i:i \in I]} A \quad \text{and} \quad B/(G\cdot f(x_i):i\in I) = B\otimes_{A [G\cdot x_i:i \in I]} A \simeq B \otimes_{\mathbb S[G \cdot x_i: i \in I]} \mathbb S.$$
To finish the proof, it remains to show that there is a map
$B/(G\cdot f(x_i):i\in I)\to B$ that is a retract of the projection map
$B \to B/(G\cdot f(x_i):i\in I)$.

By assumption, $f(x_i)=0$ in $\pi^H_\star(B)$ for all $i\in I$. First,
we consider the diagram

::: center
:::

where the top left map is determined by $x_i \in \pi_{\star}^H(A)$. It
commutes since $f$ is a $\operatorname{Coind}_H^G \mathbb E_{1}$-algebra
map.[^7] So
$$B/(G\cdot f(x_i) : i\in I) \simeq B \otimes_{\mathbb S[G\cdot x_i : i\in I]}\mathbb S\simeq B \otimes_{N^G_H \mathrm{Res}^G_H B} {N^G_H \mathrm{Res}^G_H B}\otimes_{\mathbb S[G\cdot x_i : i\in I]}\mathbb S.$$
Using that $N_H^G$ is symmetric monoidal and sifted colimit-preserving,
we furthermore obtain $$\begin{align*}
        B/(G\cdot f(x_i) : i\in I) &\simeq B \otimes_{N^G_H \mathrm{Res}^G_H B} {N^G_H \mathrm{Res}^G_H B}\otimes_{\mathbb S[G\cdot x_i : i\in I]}\mathbb S
        \\ &\simeq B \otimes_{N^G_H \mathrm{Res}^G_H B} N^G_H\left(\mathrm{Res}^G_H B/( f(x_i) : i\in I)\right).
\end{align*}$$ We now use the equivalent description of quotients
through iterated cofibers, see
[1](#definition: quotient){reference-type="ref+label"
reference="definition: quotient"}. Since $f(x_i) = 0$, these cofibers
split as left $\operatorname{Res}_H^G B$-modules, and we find
$$\operatorname{Res}_H^G B/(f(x_i) : i \in I) \simeq \operatorname{Res}_H^G B \oplus \bigoplus_{W} \Sigma^{W} \operatorname{Res}_H^G B.$$
as $\operatorname{Res}_H^G B$-modules for certain $H$-representations
$W$. Projecting to the first summand, we have constructed a map
$$B/(G\cdot f(x_i) : i\in I) \longrightarrow B \otimes_{N_H^G \operatorname{Res}_H^G B} N_H^G \operatorname{Res}_H^G B \simeq B.$$
of $B$-modules. By construction, this is a retract of the projection
$B \to B/(G \cdot f(x_i) : i \in I)$. ◻
::::::

:::: {#corollary: factoring BPG to E .corollary}
**Corollary 6**. Let $E$ be an $\mathbb E_{\infty}^G$-ring spectrum and
$f \colon {\operatorname{BP}^{(\!(G)\!)}}\to E$ be a
$\operatorname{Coind}_{C_2}^G \mathbb E_{1}$-algebra map. Let
$J \subseteq \mathbb{Z}_{\geq 1}$ and suppose that
$\overline{t}_j \in \pi_{*\rho}^{C_2} {\operatorname{BP}^{(\!(G)\!)}}$
is sent to $0$ along $f$ for $j \not \in J$. Then, there is a
factorization

::: center
:::

of ${\operatorname{BP}^{(\!(G)\!)}}$-modules, where $E$ is a
${\operatorname{BP}^{(\!(G)\!)}}$-module through $f$.
::::

:::: proof
*Proof.* Fix a $\operatorname{Coind}_{C_2}^G \mathbb E_1$-retract
$r \colon {\operatorname{MU}^{(\!(G)\!)}}\to {\operatorname{BP}^{(\!(G)\!)}}$;
such maps exist by [@quinnZhu2026multiplicativeequivariantthomspectra
Theorem 6.3.1]. Consider the commutative diagram

::: center
:::

induced by the base change/restriction adjunction. The top arrow is
surjective on $\pi_0$ by the previous proposition
([3](#prop: factorization){reference-type="ref+label"
reference="prop: factorization"}). Thus, so is the bottom arrow. It
yields precisely a factorization as indicated. ◻
::::

One of the main interests in the twisted monoid construction is the
relation to Lubin--Tate theories and higher real $K$-theories.

Building on work of Hahn--Shi [@hahnRealOrientationsLubin2020],
Beaudry--Hill--Shi--Zeng construct $G$-equivariant homotopy ring maps
from ${\operatorname{BP}^{(\!(G)\!)}}$ to certain explicit forms of
Lubin--Tate theories $E(k,\Gamma_h)$, see
[@beaudryHillShiZeng2021modelsLubinTate]. In this section, we refine
this to produce $G$-equivariant maps
${\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle\to E(k,\Gamma_h)$.
Since our work relies heavily on that of Beaudry--Hill--Shi--Zeng, first
we will recall some essential parts of their work.

::: {#recollection: bhsz .recollection}
**Recollection 1** ([@beaudryHillShiZeng2021modelsLubinTate]). Let
$G=C_{2^n}$ and fix a height $h=2^{n-1}m$. Let $E(k,\Gamma_h)$ be any of
the forms of Lubin--Tate theory constructed in
[@beaudryHillShiZeng2021modelsLubinTate Theorem 1.5].
Beaudry--Hill--Shi--Zeng construct $G$-equivariant maps
$${\operatorname{BP}^{(\!(G)\!)}}\longrightarrow E(k,\Gamma_h)\longrightarrow E(k,\Gamma_h)^{hC(k,m)} \quad \text{with} \quad C(k,m) \coloneqq \operatorname{Gal}(k/\mathbb F_2) \ltimes k^\times [q] \subseteq \mathbb{G}(k, \Gamma_h),$$
where $k^{\times}[q] \subseteq k^{\times}$ is the subgroup of
$q = (2^m-1)$-torsion elements, see
[@beaudryHillShiZeng2021modelsLubinTate Remark 6.1]. They construct a
class $D\in \pi^{G}_{*\rho_G}({\operatorname{MU}^{(\!(G)\!)}})$,[^8] and
show that there is a $G$-equivariant factorization $$\begin{tikzcd}
        {\operatorname{BP}^{(\!(G)\!)}}\ar[r]\ar[d] & E(k,\Gamma_h) \ar[r] & E(k,\Gamma_h)^{hC(k,m)} \\
        D^{-1}{\operatorname{BP}^{(\!(G)\!)}}\ar[ru, dashed]
    \end{tikzcd}$$ see [@beaudryHillShiZeng2021modelsLubinTate Theorem
1.8], where $E(k,\Gamma_h) \to E(k,\Gamma_h)^{hC(k,m)}$ is a
$G$-equivariant map splitting the natural map
$E(k, \Gamma_h)^{hC(k,m)} \to E(k,\Gamma_h)$, see
[@beaudryHillShiZeng2021modelsLubinTate Theorem 5.3]. Furthermore, they
show that there are non-equivariant factorizations $$\begin{tikzcd}
        \operatorname{Res}^G_{e}{\operatorname{BP}^{(\!(G)\!)}}\ar[r]\ar[d] & \operatorname{Res}^G_{e}E(k,\Gamma_h) \ar[r] & \operatorname{Res}^G_{e}E(k,\Gamma_h)^{hC(k,m)} \\
        \operatorname{Res}^G_{e}{\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle\ar[ru, dashed]
    \end{tikzcd}$$ and similarly $$\begin{tikzcd}
        \operatorname{Res}^G_{e}D^{-1}{\operatorname{BP}^{(\!(G)\!)}}\ar[r]\ar[d] & \operatorname{Res}^G_{e}E(k,\Gamma_h) \ar[r] & \operatorname{Res}^G_{e}E(k,\Gamma_h)^{hC(k,m)} \\
        \operatorname{Res}^G_{e}D^{-1}{\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle\ar[ru, dashed]
    \end{tikzcd}$$ see [@beaudryHillShiZeng2021modelsLubinTate
Proposition 7.6]. Additionally, they show that there is a
non-equivariant $K(h)$-local equivalence
$$L_{K(h)}\operatorname{Res}^G_{e}D^{-1}{\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle\xrightarrow{\ \simeq \ } \operatorname{Res}^G_{e}E(k,\Gamma_h)^{hC(k,m)}$$
see [@beaudryHillShiZeng2021modelsLubinTate Proposition 7.6].
:::

Using the orientations produced in
[@quinnZhu2026multiplicativeequivariantthomspectra], we upgrade
Beaudry--Hill--Shi--Zeng's factorizations to an equivariant
factorization. Furthermore, we use this to obtain a model of higher real
$K$-theories.

::: {#thm:BHSZ_refinement .theorem}
**Theorem 3**. The Beaudry--Hill--Shi--Zeng orientation
${\operatorname{BP}^{(\!(G)\!)}}\to E(k,\Gamma_h)$ refines to a
$\operatorname{Coind}^G_{C_2}\mathbb E_\rho$-ring map. Furthermore,
there are $G$-equivariant factorizations $$\begin{tikzcd}
        {\operatorname{BP}^{(\!(G)\!)}}\ar[r]\ar[d] & E(k,\Gamma_h)
        &
        \raisebox{-0.9em}{\text{and}}
        &
        D^{-1}{\operatorname{BP}^{(\!(G)\!)}}\ar[r]\ar[d] & E(k,\Gamma_h) \\
        {\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle\ar[ru, dashed]
        &&
        &
        D^{-1}{\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle\ar[ru, dashed]
    \end{tikzcd}$$ of ${\operatorname{BP}^{(\!(G)\!)}}$-modules.
:::

::: proof
*Proof.* The refinement of the Beaudry--Hill--Shi--Zeng orientation
${\operatorname{BP}^{(\!(G)\!)}}\to E(k,\Gamma_h)$ to a
$\operatorname{Coind}^G_{C_2}\mathbb E_\rho$-ring map follows from the
lifting theorem [@quinnZhu2026multiplicativeequivariantthomspectra
Corollary 6.1.6] combined with the structured retraction of
${\operatorname{BP}_{\mathbb{R}}}$ constructed in
[@quinnZhu2026multiplicativeequivariantthomspectra Theorem 6.3.3]. The
Beaudry--Hill--Shi--Zeng orientation is constructed so that the elements
$\overline{t}_{m+1},\overline{t}_{m+2},\overline{t}_{m+3},\ldots\in \pi^{C_2}_*({\operatorname{BP}^{(\!(G)\!)}})$,
that are used in [2](#example: BPGJ){reference-type="ref+label"
reference="example: BPGJ"} to define
${\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle$, all map to zero in
$E(k,\Gamma_h)$.

Therefore,
[6](#corollary: factoring BPG to E){reference-type="ref+label"
reference="corollary: factoring BPG to E"} yields the factorization on
the left. Since $D$ is sent to an invertible element in $E(k,\Gamma_h)$,
applying $D^{-1}$ yields the factorization on the right. ◻
:::

::: remark
**Remark 7**. Under the more restrictive assumption that the
Beaudry--Hill--Shi--Zeng orientation can be constructed starting from an
$\mathbb E_2$-ring map
${\operatorname{MU}_{\mathbb{R}}}\to \operatorname{Res}^{G}_{C_2}E(k,\Gamma_h)$,
an alternative approach for producing such factorizations was given in
[@delangel2024dualshigherrealktheories Proposition 3.2.6] suggested to
Del Angel by Hahn. Even though we can produce some
$\mathbb E_{2\rho}$-algebra maps
${\operatorname{MU}_{\mathbb{R}}}\to \operatorname{Res}_{C_2}^G E(k, \Gamma_h)$
as in [@quinnZhu20206realsnaith Example 2.21], we emphasize that it is a
non-trivial task to lift the specific orientations considered by
Beaudry--Hill--Shi--Zeng. In particular, we are not able to produce
$\mathbb E_{2\rho}$-lifts of these orientations. These difficulties are
related to lifting the Quillen idempotent to an $\mathbb E_4$-algebra
map, which still stands as an open problem.
:::

### Models of higher real $K$-theories

Recall that we are considering certain examples $E(k, \Gamma_h)$ of
Lubin--Tate theories considered by Beaudry--Hill--Shi--Zeng. Our
equivariant map ([3](#thm:BHSZ_refinement){reference-type="ref+label"
reference="thm:BHSZ_refinement"}) allows us to refine
Beaudry--Hill--Shi--Zeng's underlying equivalence to a $G$-equivariant
equivalence. Let us denote by $%
  
    % draw a slightly shorter underline
    \uline{\hphantom{\operatorname{map}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\operatorname{map}}}%
  
_G(-,-)$ the mapping $G$-spectrum.

::: {#cor:BPGmEh_equivalence .corollary}
**Corollary 7**. Let $G = C_{2^n}$ and $h = 2^{n-1}m$. Suppose that
$k^{\times}$ contains all $q = (2^m-1)$-roots of unity. Then, there is
an equivalence $$%
  
    % draw a slightly shorter underline
    \uline{\hphantom{\operatorname{map}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\operatorname{map}}}%
  
_G \left(\Sigma_+^{\infty} \mathrm{EG}, L_{\operatorname{Infl}_e^G K(h)} D^{-1}{\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle\right) \xrightarrow{\ \simeq \ } E(k,\Gamma_h)^{hC(k,m)}$$
of ${\operatorname{BP}^{(\!(G)\!)}}$-modules.
:::

::: proof
*Proof.* Note that $E(k,\Gamma_h)^{hC(k,m)}$ is Borel, and the
underlying non-equivariant spectrum is $K(h)$-local. We write $%
  
    % draw a slightly shorter underline
    \uline{\hphantom{\operatorname{map}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\operatorname{map}}}%
  
_G(-,-)$ for the mapping $G$-spectrum. Applying $%
  
    % draw a slightly shorter underline
    \uline{\hphantom{\operatorname{map}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\operatorname{map}}}%
  
_G \left(\Sigma_+^{\infty} \mathrm{EG}, L_{\operatorname{Infl}_e^G K(h)}- \right)$
to the map from [3](#thm:BHSZ_refinement){reference-type="ref+label"
reference="thm:BHSZ_refinement"} thus yields a map $$%
  
    % draw a slightly shorter underline
    \uline{\hphantom{\operatorname{map}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\operatorname{map}}}%
  
_G \left(\Sigma_+^{\infty} \mathrm{EG}, L_{\operatorname{Infl}_e^G K(h)} D^{-1}{\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle\right) \longrightarrow E(k,\Gamma_h)^{hC(k,m)}.$$
of $G$-spectra. By construction, this is a map between Borel spectra. In
particular, it is an equivalence if and only if it is an equivalence on
underlying non-equivariant spectra. The underlying non-equivariant
equivalence is [@beaudryHillShiZeng2021modelsLubinTate Proposition 7.6].
Here, we use [@carrickSmashingLocalizationsEquivariant2022 Proposition
3.2(2)] to see that $L_{\operatorname{Infl}_e^G K(h)}$ becomes
$L_{K(h)}$ on underlying. ◻
:::

::: remark
**Remark 8**. An alternative viewpoint on the functor we applied to
$D^{-1} {\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle$ above is
through an equivariant chromatic localization, namely
$$L_{G_+\otimes K(h)}D^{-1}{\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle\simeq %
  
    % draw a slightly shorter underline
    \uline{\hphantom{\operatorname{map}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\operatorname{map}}}%
  
_G \left(\Sigma_+^{\infty} \mathrm{EG}, L_{\operatorname{Infl}_e^G K(h)} D^{-1}{\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle\right)$$
according to [@carrickSmashingLocalizationsEquivariant2022 Proposition
3.21].
:::

Using the previous result, we can now deduce a model for higher real
$K$-theories.

::: {#cor:fixed_points_EOn_equivalence .corollary}
**Corollary 8**. Let $G = C_{2^n}$ and $h = 2^{n-1}m$. Suppose that
$k^{\times}$ contains all $q = (2^m-1)$-roots of unity. For any
$H\leq G$, there is an equivalence
$$\mathrm{EO}_h(C(k,m) \times H) \coloneqq \left(E(k,\Gamma_h)^{hC(k,m)}\right)^{hH} \simeq
    \left(L_{K(h)}D^{-1}{\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle\right)^{hH}$$
of spectra.
:::

::: proof
*Proof.* This follows directly from applying $(-)^{hH}$ to the
equivalence of [7](#cor:BPGmEh_equivalence){reference-type="ref+label"
reference="cor:BPGmEh_equivalence"}. ◻
:::

We give the following application:

::: corollary
**Corollary 9**. Let $G = C_{2^n}$ and $h = 2^{n-1}m$. Suppose that
$k^{\times}$ contains all $q = (2^m-1)$-roots of unity. Then,
$L_{K(h)}\left(D^{-1}{\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle^{H}\right)\neq 0$
for all $H \leq G$.
:::

::::: proof
*Proof.* Since $D^{-1} {\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle$
is an ${\operatorname{MU}^{(\!(G)\!)}}$-module, it follows from
[@carrick2025higherrealktheoriesfinite Theorem 2.14] that we have
$$L_{K(h)}\left(D^{-1}{\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle^{H}\right) \simeq L_{K(h)}\left(D^{-1}{\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle^{hH}\right),$$
which we need to show to be non-zero. The map
$\Sigma_+^{\infty} \mathrm{EH} \to \mathbb S$ induces a map
$$D^{-1} {\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle\longrightarrow %
  
    % draw a slightly shorter underline
    \uline{\hphantom{\operatorname{map}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\operatorname{map}}}%
  
_H \left(\Sigma_+^{\infty} \mathrm{EH}, D^{-1}{\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle\right),$$
where $%
  
    % draw a slightly shorter underline
    \uline{\hphantom{\operatorname{map}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\operatorname{map}}}%
  
_H$ denotes the mapping $H$-spectrum. The naturality of the norm map
$(-)_{hH} \Rightarrow (-)^{hH}$ yields a commutative diagram

::: center
:::

of spectra. Since $K(h)$-local spectra are closed under limits, the
bottom right corner is $K(h)$-local. Applying $L_{K(h)}$ to the square
thus yields a commutative square

::: center
:::

The left map is an equivalence since $L_{K(h)}$ commutes with colimits.
The bottom map is an equivalence by $K(h)$-local Tate vanishing
[@greenleesSadofsky1996tate; @hoveySadofsky1996tate]. Moreover,
$\left(L_{K(h)} D^{-1} {\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle\right)^{hH}$
is non-zero by
[8](#cor:fixed_points_EOn_equivalence){reference-type="ref+label"
reference="cor:fixed_points_EOn_equivalence"}. So the top right corner
of the square cannot be $0$. ◻
:::::

When we set out on this project, one of our original motivations was to
improve [7](#cor:BPGmEh_equivalence){reference-type="ref+label"
reference="cor:BPGmEh_equivalence"} by constructing an equivariant
equivalence $$%
  
    % draw a slightly shorter underline
    \uline{\hphantom{\operatorname{map}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\operatorname{map}}}%
  
_G \left(\Sigma_+^{\infty} \mathrm{EG}, L_{\operatorname{Infl}_e^G K(h)} {\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle\right) \xrightarrow{\ \simeq \ } E(k,\Gamma_h)^{hC(k,m)}$$
via the Beaudry--Hill--Shi--Zeng orientation
([3](#thm:BHSZ_refinement){reference-type="ref+label"
reference="thm:BHSZ_refinement"}). It would generalize the
non-equivariant Baker--Würgler equivalence
$L_{K(h)} \operatorname{BP}\langle h \rangle \simeq \widehat{E}(h)$, see
[11](#remark: Baker wuergler){reference-type="ref+label"
reference="remark: Baker wuergler"}, and was expected by experts to be
true.

We were surprised to find that it is actually not an equivalence in
general. In fact, the failure can already be seen on the underlying
non-equivariant level. Let us recall and set up some notation first.

::: {#recollection: BHSZ computations .recollection}
**Recollection 2**.

(i) There exist certain elements
    $\textcolor{chillired}{t_i^{C_{2^n}}} \in \pi_{2(2^i-1)}^e \operatorname{BP}^{( \! ( C_{2^n} ) \! )}$
    for $i \geq 1$ determining the group action on a specified formal
    group law. See [@beaudryHillShiZeng2021modelsLubinTate (1.3)] for a
    precise definition. With these,
    $$\pi_*^e \operatorname{BP}^{( \! ( C_{2^n} ) \! )} \cong \mathbb{Z}_{(2)}[C_{2^n} \cdot t_1^{C_{2^n}}, C_{2^n} \cdot t_2^{C_{2^n}}, \cdots]$$
    where
    $C_{2^n} \cdot x = \{x, \gamma_n x, \gamma_n^2 x, \cdots, \gamma_n^{2^{n-1}-1}x \}$
    with $\gamma_n$ denoting a generator of $C_{2^n}$.

(ii) We will write
     $\textcolor{chillired}{I_k} \coloneqq (2,v_1, \cdots, v_{k-1}) \subseteq \pi_* \operatorname{BP}^{( \! ( C_{2^n}) \! )}$
     where
     $v_i \in \pi_* \operatorname{BP}\to \pi_* \operatorname{BP}^{( \! ( C_{2^n}) \! )}$
     are the Araki generators.

(iii) There is a recursive formula
      $$t_k^{C_{2^{n-1}}} \equiv t_k^{C_{2^n}} + \gamma_n t_k^{C_{2^n}} + \sum_{j=1}^{k-1} \gamma_n t_j^{C_{2^n}} (t_{k-j}^{C_{2^n}})^{2^j} \pmod{I_k}$$
      by [@beaudryHillShiZeng2021modelsLubinTate Theorem 1.1]. Here,
      $t_k^{C_2} \equiv v_k \pmod{I_k}$, see
      [@beaudryHillShiZeng2021modelsLubinTate Proposition 3.5]. We will
      later relate $v_k$ to $t_k^{C_{2^n}}$ for $n > 1$, see
      [4](#theorem: vk is Vk){reference-type="ref+label"
      reference="theorem: vk is Vk"}.
:::

::: {#remark: coefficients composition .remark}
**Remark 9**. At this point, we want to give a remark in pure algebra.
Let $R$ be a ring of characteristic $2$. If
$A(T) = T + \sum_{k \geq 1} a_k T^{2^k} \in R \llbracket T \rrbracket$
and
$B(T) = T + \sum_{k \geq 1} b_k T^{2^k} \in R \llbracket T \rrbracket$,
then the coefficients of the composition
$B(A(T)) = T + \sum_{k \geq 1} c_k T^{2^k}$ are given by
$$c_k = a_k + b_k + \sum_{j=1}^{k-1} b_{j}a_{k-j}^{2^j}.$$ This is
precisely the sort of formula appearing in Beaudry--Hill--Shi--Zeng's
recursive formula. We will use this observation later in
[4](#theorem: vk is Vk){reference-type="ref+label"
reference="theorem: vk is Vk"}.
:::

Let us furthermore recall and record the following formula for
$K(h)$-localization, since it will be important for our computations.

::: {#remark: Kh localization .remark}
**Remark 10**. Let $E$ be a complex oriented spectrum such that the
image of $(2,v_1, \cdots, v_{h-1})$ under $\operatorname{MU}\to E$ forms
a regular sequence in $\pi_*E$. Then,
$$\pi_*(L_{K(h)}E) \cong v_h^{-1}\pi_*(E)_{(2,v_1,\cdots,v_{h-1})}^{\wedge},$$
see e.g. [@beaudryHillShiZeng2021modelsLubinTate Proposition 7.4].
Examples are
$\operatorname{Res}_e^G D^{-1} {\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle$
by [@beaudryHillShiZeng2021modelsLubinTate Proposition 7.4] and
$\operatorname{Res}_e^G {\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle$
by [@carrick2025higherrealktheoriesfinite Corollary 3.3].
:::

Let us begin by collecting all positive examples.

::: {#prop: positive examples lubin tate .proposition}
**Proposition 4**.

(i) Let $h \geq -1$. The natural map $$%
      
        % draw a slightly shorter underline
        \uline{\hphantom{\operatorname{map}}\kern-0pt}%
        % restore overall width so following text lines up
        \kern 0pt%
        % overlay the actual content, with proper math style
        \mathllap{\mathpalette\my@cont@{\operatorname{map}}}%
      
    _{C_2}\left(\Sigma_+^{\infty} \mathrm{E}C_2, L_{\operatorname{Infl}_e^{C_2}K(h)} {\operatorname{BP}_{\mathbb{R}}}\langle h \rangle \right) \longrightarrow %
      
        % draw a slightly shorter underline
        \uline{\hphantom{\operatorname{map}}\kern-0pt}%
        % restore overall width so following text lines up
        \kern 0pt%
        % overlay the actual content, with proper math style
        \mathllap{\mathpalette\my@cont@{\operatorname{map}}}%
      
    _{C_2}\left(\Sigma_+^{\infty} \mathrm{E}C_2, L_{\operatorname{Infl}_e^{C_2}K(h)} D^{-1} {\operatorname{BP}_{\mathbb{R}}}\langle h \rangle \right)$$
    is an equivalence of $C_2$-spectra.

(ii) The natural map $$%
       
         % draw a slightly shorter underline
         \uline{\hphantom{\operatorname{map}}\kern-0pt}%
         % restore overall width so following text lines up
         \kern 0pt%
         % overlay the actual content, with proper math style
         \mathllap{\mathpalette\my@cont@{\operatorname{map}}}%
       
     _{C_4}\left(\Sigma_+^{\infty} \mathrm{E}C_4, L_{\operatorname{Infl}_e^{C_4} K(2)} \operatorname{BP}^{( \! ( C_4 ) \! )} \langle 1 \rangle \right) \longrightarrow %
       
         % draw a slightly shorter underline
         \uline{\hphantom{\operatorname{map}}\kern-0pt}%
         % restore overall width so following text lines up
         \kern 0pt%
         % overlay the actual content, with proper math style
         \mathllap{\mathpalette\my@cont@{\operatorname{map}}}%
       
     _{C_4}\left(\Sigma_+^{\infty} \mathrm{E}C_4, L_{\operatorname{Infl}_e^{C_4} K(2)} D^{-1}\operatorname{BP}^{( \! ( C_4 ) \! )} \langle 1 \rangle \right)$$
     is an equivalence of $C_4$-spectra.
:::

::: proof
*Proof.* Equivalences of Borel spectra can be checked on underlying. We
will use the $L_{K(h)}$ formula from
[10](#remark: Kh localization){reference-type="ref+label"
reference="remark: Kh localization"}.

(i) We fully understand $\pi_*^{C_2} E(k,\Gamma_h)$ since
    $E(k, \Gamma_h)$ is strongly even [@hahnRealOrientationsLubin2020
    Theorem 1.9]. With this, we can deduce $D = \overline{v}_h$ using
    [@beaudryHillShiZeng2021modelsLubinTate Proposition 6.3], so the
    desired follows immediately.

(ii) First postcompose by the equivalence $$%
       
         % draw a slightly shorter underline
         \uline{\hphantom{\operatorname{map}}\kern-0pt}%
         % restore overall width so following text lines up
         \kern 0pt%
         % overlay the actual content, with proper math style
         \mathllap{\mathpalette\my@cont@{\operatorname{map}}}%
       
     _{C_4}\left(\Sigma_+^{\infty} \mathrm{E}C_4, L_{\operatorname{Infl}_e^{C_4} K(2)} D^{-1}\operatorname{BP}^{( \! ( C_4 ) \! )} \langle 1 \rangle \right) \xrightarrow{\ \simeq \ } E(k,\Gamma_2)^{hC(k,1)},$$
     so it suffices to show that the composite
     $$L_{K(2)} \operatorname{Res}_e^{C_4} \operatorname{BP}^{( \! ( C_4 ) \! )} \langle 1 \rangle \longrightarrow E(k,\Gamma_2)^{hC(k,1)}$$
     is an equivalence. By [@beaudryHillShiZeng2021modelsLubinTate
     Proposition 5.4] this amounts to the inclusion map
     $$\mathbb{Z}_{(2)} \left[t_1^{C_4}, \gamma t_1^{C_4} \right][v_2^{-1}]_{(2,v_1)}^{\wedge} \longrightarrow \mathbb{Z}_{2} \left[t_1^{C_4}, \gamma t_1^{C_4}, (t_1^{C_4})^{-1}, (\gamma t_1^{C_4})^{-1} \right]_{(t_1^{C_4} - \gamma t_1^{C_4}, t_1^{C_4} + \gamma t_1^{C_4})}^{\wedge}.$$
     On the other hand,
     $(t_1^{C_4} - \gamma t_1^{C_4}, t_1^{C_4} + \gamma t_1^{C_4}) = (2, t_1^{C_4}+\gamma t_1^{C_4})$.
     Using
     [2](#recollection: BHSZ computations){reference-type="ref+label"
     reference="recollection: BHSZ computations"} we get
     $$\begin{align*}
                 v_1 &\equiv t_1^{C_4} + \gamma t_1^{C_4} \pmod 2,
                 \\ v_2 &\equiv (\gamma t_1^{C_4})(t_1^{C_4})^{2} \pmod{(2,v_1)},
     \end{align*}$$ so we see that the map is an isomorphism.

 ◻
:::

Certainly,
[4](#prop: positive examples lubin tate){reference-type="ref+label"
reference="prop: positive examples lubin tate"}(i) was already known by
Beaudry--Hill--Shi--Zeng, although it was not explicitly spelled out.
Applying [7](#cor:BPGmEh_equivalence){reference-type="ref+label"
reference="cor:BPGmEh_equivalence"} we deduce:

::: corollary
**Corollary 10**.

(i) Suppose that $k^{\times}$ contains all $(2^h-1)$-roots of unity.
    There is an equivalence $$E(k,\Gamma_h)^{hC(k,h)} \simeq %
      
        % draw a slightly shorter underline
        \uline{\hphantom{\operatorname{map}}\kern-0pt}%
        % restore overall width so following text lines up
        \kern 0pt%
        % overlay the actual content, with proper math style
        \mathllap{\mathpalette\my@cont@{\operatorname{map}}}%
      
    _{C_2}\left(\Sigma_+^{\infty} \mathrm{E}C_2, L_{\operatorname{Infl}_e^{C_2}K(h)} {\operatorname{BP}_{\mathbb{R}}}\langle h \rangle \right)$$
    of $C_2$-spectra.

(ii) There is an equivalence $E(k, \Gamma_2)^{hC(k,1)} \simeq %
       
         % draw a slightly shorter underline
         \uline{\hphantom{\operatorname{map}}\kern-0pt}%
         % restore overall width so following text lines up
         \kern 0pt%
         % overlay the actual content, with proper math style
         \mathllap{\mathpalette\my@cont@{\operatorname{map}}}%
       
     _{C_4}\left(\Sigma_+^{\infty} \mathrm{E}C_4, L_{\operatorname{Infl}_e^{C_4} K(2)} \operatorname{BP}^{( \! ( C_4 ) \! )} \langle 1 \rangle \right)$
     of $C_4$-spectra.
:::

::: {#remark: Baker wuergler .remark}
**Remark 11**. In particular, $E(k, \Gamma_h)^{hC(k,h)}$ is a
$C_2$-equivariant refinement of completed Johnson--Wilson theory
$L_{K(h)}\operatorname{BP}\langle h \rangle \simeq \widehat{E}(h)$ by a
theorem of Baker--Würgler [@bakerWuergler1989liftings].
:::

::: remark
**Remark 12**. In forthcoming work [@Qtmf15], the first-named author
produces a $C_4$-equivariant equivalence
$\operatorname{tmf}_1(5)\simeq \operatorname{BP}^{(\!(C_4)\!)}\langle 1\rangle$
that holds before applying $K(h)$-localization. This constructs a
$\mathbb E^{C_4}_\infty$-ring structure on
$\operatorname{BP}^{(\!(C_4)\!)}\langle 1\rangle$, and hence an
$\mathbb E_\infty$-ring structure on
$\operatorname{BP}^{(\!(C_4)\!)}\langle 1\rangle^{C_4}$. This shows that
$\operatorname{tmf}_1(5)$ is a $C_4$-analogue of
$\operatorname{ku}_{\mathbb R}$ [@HillHopkinsRavenel2017C4RealKTheory].
:::

Next, we will embark on proving that all other examples are negative
examples. Let us begin with
$L_{K(4)} \operatorname{BP}^{( \! ( C_4 ) \! )} \langle 2 \rangle$,
where we are able to provide an explicit computation.

::: {#lemma: BP C4 2 mod I computation .lemma}
**Lemma 4**. There is an isomorphism
$$\pi_*^e\left(L_{K(4)}\operatorname{BP}^{( \! ( C_4 ) \! )}\langle 2 \rangle \right)/(2,v_1, v_2, v_3) \cong \mathbb F_4 \left[(t_1^{C_4})^{\pm 1} \right] \times \mathbb F_2 \left[(t_2^{C_4})^{\pm 1} \right]$$
of $\operatorname{BP}_*$-modules.
:::

::: proof
*Proof.* We use
[10](#remark: Kh localization){reference-type="ref+label"
reference="remark: Kh localization"} to see
$$\pi_*\left(L_{K(4)}\operatorname{Res}_e^{C_4}\operatorname{BP}^{( \! ( C_4 ) \! )}\langle 2 \rangle \right)\cong \left(v_4^{-1}\pi_*(\operatorname{Res}_e^{C_4}\operatorname{BP}^{( \! ( C_4 ) \! )}\langle 2 \rangle)\right)^{\wedge}_{I_4}.$$
Using [@beaudryHillShiZeng2021modelsLubinTate Theorem 1.1] and
[@beaudryHillShiZeng2021modelsLubinTate Proposition 3.5], we have the
following explicit formulae for the $v_i$'s in terms of the
$t_i^{C_4}$'s: $$\begin{align*}
        v_1 &\equiv t_1^{C_4}+\gamma_2 t_1^{C_4} &&\operatorname{mod} \,\, (2)\\
        v_2 &\equiv t_2^{C_4}+\gamma_2 t_2^{C_4}+\gamma_2 t_1^{C_4}\left(t_{1}^{C_4}\right)^{2} &&\operatorname{mod} \,\,  (2,v_1)\\
        v_3 &\equiv \gamma_2 t_1^{C_4}\left(t_{2}^{C_4}\right)^{2} +\gamma_2 t_2^{C_4}\left(t_{1}^{C_4}\right)^{4}    && \operatorname{mod} \,\, (2,v_1,v_2)\\
        v_4 &\equiv \gamma_2t_2^{C_4}\left(t_{2}^{C_4}\right)^{4}   &&\operatorname{mod}\,\,  (2,v_1,v_2,v_3).
\end{align*}$$ Therefore, $$I_4 =  \left(
    2,
    \,\,
    t_1^{C_4}+\gamma_2 t_1^{C_4},
    t_2^{C_4}+\gamma_2 t_2^{C_4}+\gamma_2 t_1^{C_4}\left(t_{1}^{C_4}\right)^{2},
    \,\,
    \gamma_2 t_1^{C_4}\left(t_{2}^{C_4}\right)^{2} +\gamma_2 t_2^{C_4}\left(t_{1}^{C_4}\right)^{4}
    \right)$$ Using
$\pi_*^e(\operatorname{BP}^{( \! ( C_4 ) \! )}\langle 2 \rangle)\cong \mathbb{Z}_{(2)}[t_1^{C_4},\gamma_2 t_1^{C_4},t_2^{C_4},\gamma t_2^{C_4}]$,
we can write down an isomorphism
$$\pi_*^e \left(\operatorname{BP}^{( \! ( C_4 ) \! )}\langle 2 \rangle \right)/I_4 \xrightarrow{\ \sim \ } 
    \mathbb F_2[t_1^{C_4},t_2^{C_4}]/
    \left(
    t_1^{C_4}\left(
    (t_2^{C_4})^2 
    +
    t_2^{C_4}(t_1^{C_4})^3
    +
    (t_1^{C_4})^6
    \right)
    \right)$$ induced by $$t_1^{C_4} \mapsto t_1^{C_4}, \quad 
    \gamma_2 t_1^{C_4} \mapsto t_1^{C_4},\quad 
    t_2^{C_4} \mapsto t_2^{C_4},\quad 
    \gamma_2 t_2^{C_4}\mapsto t_2^{C_4} + (t_1^{C_4})^3.$$ Furthermore,
since $v_4 \equiv \gamma_2t_2^{C_4}\left(t_{2}^{C_4}\right)^{4}$ modulo
$I_4$, we learn that
$$\left(v_4^{-1}\pi_*^e(\operatorname{BP}^{( \! ( C_4 ) \! )}\langle 2 \rangle)\right)^{\wedge}_{I_4}/I_4 \cong
    \mathbb F_2 \left[t_1^{C_4},t_2^{C_4},
    (t_2^{C_4})^{-1},
    \left((t_1^{C_4})^3+t_2^{C_4} \right)^{-1}
    \right]/
    \left(
    t_1^{C_4}\left(
    (t_2^{C_4})^2 
    +
    t_2^{C_4}(t_1^{C_4})^3
    +
    (t_1^{C_4})^6
    \right)
    \right)$$ By the Chinese remainder theorem this splits into
$$\mathbb F_2 \left[(t_2^{C_4})^{\pm 1} \right] \times \mathbb F_2\left[(t_1^{C_4})^{\pm 1}, T \right]/(T^2 + T + 1) \cong \mathbb F_2 \left[(t_2^{C_4})^{\pm 1} \right] \times \mathbb F_4 \left[(t_1^{C_4})^{\pm 1} \right],$$
where $T=t_2^{C_4}/(t_1^{C_4})^3$. ◻
:::

::: corollary
**Corollary 11**. There is no equivalence between
$L_{K(4)} \operatorname{Res}^{C_4}_e\operatorname{BP}^{(\!(C_4)\!)}\langle 2\rangle$
and
$L_{K(4)} \operatorname{Res}^{C_4}_e D^{-1}\operatorname{BP}^{(\!(C_4)\!)}\langle 2\rangle$
as $\operatorname{BP}$-modules.
:::

::: proof
*Proof.* For brevity, write
$X=\operatorname{Res}^{C_4}_e\operatorname{BP}^{(\!(C_4)\!)}\langle 2\rangle$,
and
$Y=\operatorname{Res}^{C_4}_e D^{-1}\operatorname{BP}^{(\!(C_4)\!)}\langle 2\rangle$.
By [@beaudryHillShiZeng2021modelsLubinTate Proposition 7.1] we have
$$\pi_* \left(L_{K(4)}\operatorname{Res}^{C_4}_e D^{-1}\operatorname{BP}^{(\!(C_4)\!)}\langle 2 \rangle \right)/(2,v_1,v_2,v_3)\cong \mathbb F_2[(t^{C_4}_2)^{\pm 1}].$$
On the other hand,
$$\pi_*\left(L_{K(4)}\operatorname{Res}_e^{C_4}\operatorname{BP}^{( \! ( C_4 ) \! )}\langle 2 \rangle \right)/(2,v_1, v_2, v_3) \cong \mathbb F_4 \left[(t_1^{C_4})^{\pm 1} \right] \times \mathbb F_2 \left[(t_2^{C_4})^{\pm 1} \right]$$
by [4](#lemma: BP C4 2 mod I computation){reference-type="ref+label"
reference="lemma: BP C4 2 mod I computation"}. ◻
:::

One of the many ways to distinguish $\mathbb F_2[(t_2^{C_4})^{\pm 1}]$
from
$\mathbb F_4 \left[(t_1^{C_4})^{\pm 1} \right] \times \mathbb F_2 \left[(t_2^{C_4})^{\pm 1} \right]$
is by counting the $\mathbb F_4$-points on the corresponding affine
schemes, i.e. by counting the number of ring homomorphisms to
$\mathbb F_4$. While there are three ring homomorphisms
$$\mathbb F_2 \left[(t_2^{C_4})^{\pm 1} \right] \longrightarrow \mathbb F_4,$$
the ring
$\mathbb F_4 \left[(t_1^{C_4})^{\pm 1} \right] \times \mathbb F_2 \left[(t_2^{C_4})^{\pm 1} \right]$
has nine $\mathbb F_4$-points.

We will now greatly generalize this observation to deal with all other
possibilities for
$L_{K(h)} \operatorname{Res}_e^{G} {\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle$.
The first step is to generalize Beaudry--Hill--Shi--Zeng's recursive
formula
([2](#recollection: BHSZ computations){reference-type="ref+label"
reference="recollection: BHSZ computations"}) for inductively describing
the generators of $\pi_*^e({\operatorname{BP}^{(\!(G)\!)}})$.

::: notation
**Notation 1**. Let $n \geq 1$.

(i) Let $r \geq 0$. Then, we write
    $\textcolor{chillired}{P_r(T)} \coloneqq T + \sum_{i \geq 1} \gamma_n^r t_i^{C_{2^n}} T^{2^i} \in \pi_*^e(\operatorname{BP}^{( \! ( C_{2^n} ) \! )}) \llbracket T \rrbracket$.

(ii) Let
     $\textcolor{chillired}{P(T)} \coloneqq P_{2^{n-1}-1} \circ P_{2^{n-1}-2} \circ \cdots \circ P_0(T) \in \pi_*^e(\operatorname{BP}^{( \! ( C_{2^n}) \! )}) \llbracket T \rrbracket$.
     It is then of the form $$P(T) = T + \sum_{k \geq 1} V_k T^{2^k}$$
     for some
     $\textcolor{chillired}{V_k} \in \pi_*^e(\operatorname{BP}^{( \! ( C_{2^n}) \! )})$.
:::

We suggestively write $V_k$ due to the following result.

::: {#theorem: vk is Vk .theorem}
**Theorem 4**. Let $n \geq 1$. In the above notation, we have
$v_k\equiv V_k \pmod{I_k}$.
:::

::: proof
*Proof.* For $0\leq s\leq n-1$, and $0\leq b\leq 2^{n-1-s}-1$ consider
the power series
$$Q_{s,b}(T)\coloneqq P_{(b+1)2^s-1}\circ P_{(b+1)2^s-2}\circ \cdots   \circ P_{b2^s}(T)= T+\sum_{k\geq 1}Q_{s,b,k}T^{2^k} \in \pi_*^e(\operatorname{BP}^{( \! ( C_{2^n}) \! )}) \llbracket T \rrbracket.$$
for some
$Q_{s,b,k} \in \pi_*^e(\operatorname{BP}^{( \! ( C_{2^n} ) \! )})$. We
prove the following statement by induction on $s$: For every $k\geq 1$,
we have $$Q_{s,b,k}\equiv \gamma_n^{b2^s}t_k^{C_{2^{n-s}}} \pmod{I_k}.$$
Let us first explain that the theorem follows from this claim: By
definition, $P(T)=Q_{n-1,0}(T)$. So the claim gives
$V_k\equiv t_k^{C_2} \pmod{I_k}$. Moreover,
$v_k\equiv t_k^{C_2} \pmod{I_k}$ by
[2](#recollection: BHSZ computations){reference-type="ref+label"
reference="recollection: BHSZ computations"}. Hence, we deduce
$v_k\equiv V_k \pmod{I_k}$.

For $s = 0$ we have $Q_{0,b}(T) = P_b(T)$ which is already of this form.
Suppose that the claim holds for some $s$ and fix $b$ such that
$0\leq b \leq 2^{n-2-s}-1$. By construction, we have
$Q_{s+1,b}(T)=Q_{s,2b+1}\circ Q_{s,2b}(T)$. Looking at the coefficient
of $T^{2^k}$ in $Q_{s+1,b}(T)$ with
[9](#remark: coefficients composition){reference-type="ref+label"
reference="remark: coefficients composition"}, we learn that
$$Q_{s+1,b,k}
    \equiv
    Q_{s,2b,k}
    +
    Q_{s,2b+1,k}
    +
    \sum_{j=1}^{k-1}
    Q_{s,2b+1,j}
    \left(Q_{s,2b,k-j}\right)^{2^j} \pmod{2}.$$ Using the formula for
$Q_{s,2b,k}$ and $Q_{s,2b+1,k}$ from the inductive hypothesis and using
$\gamma_{n-s} = \gamma_n^{2^s}$, we learn that $$\begin{align*}
        Q_{s+1,b,k} &\equiv
    \gamma_n^{b2^{s+1}}t_k^{C_{2^{n-s}}}
    +
    \gamma_n^{b2^{s+1}}\gamma_{n-s}t_k^{C_{2^{n-s}}}
    +
    \sum_{j=1}^{k-1}
    \left(\gamma_n^{b2^{s+1}}\gamma_{n-s}t_j^{C_{2^{n-s}}}\right)
    \left(\gamma_n^{b2^{s+1}}t_{k-j}^{C_{2^{n-s}}}\right)^{2^j}
    \pmod{I_k}.
    \\ &\equiv \gamma_n^{b2^{s+1}} \left( t_k^{C_{2^n-s}} + \gamma_{n-s} t_k^{C_{2^{n-s}}} + \sum_{j=1}^{k-1}
    \left(\gamma_{n-s}t_j^{C_{2^{n-s}}}\right)
    \left(t_{k-j}^{C_{2^{n-s}}}\right)^{2^j} \right) \pmod{I_k}
\end{align*}$$ Inside the brackets, we can now apply
Beaudry--Hill--Shi--Zeng's formula
([2](#recollection: BHSZ computations){reference-type="ref+label"
reference="recollection: BHSZ computations"}). Together with the
invariance of $I_k$ under the action
[@beaudryHillShiZeng2021modelsLubinTate Proposition 3.7], we conclude
$$Q_{s+1,b,k}\equiv
    \gamma_n^{b2^{s+1}}t_k^{C_{2^{n-(s+1)}}} \pmod{I_k}.$$ This
completes the proof. ◻
:::

Now we use this to count $\mathbb{F}_4$-points. By
[@beaudryHillShiZeng2021modelsLubinTate Proposition 7.1]
$$\pi_*^e \left(L_{K(h)}D^{-1}\operatorname{BP}^{(\!(G)\!)\langle m \rangle} \right)/I_h \cong \mathbb F_2[(t^{G}_m)^{\pm 1}].$$
and it only has three $\mathbb F_4$-points. We want to prove that
$\pi^e_*(L_{K(h)}{\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle)/I_h$
has more $\mathbb F_4$-points. Let us first set up some notation.

::: observation
**Observation 1**. For $i \geq 1$ and $r \geq 0$ let us write
$\textcolor{chillired}{a_{r,i}} \coloneqq \gamma_{n}^rt_{i}^{G} \in \pi_*^e(\operatorname{BP}^{( \! ( C_{2^n} ) \! )})$,
so that we have $P_r(T) = T + \sum_{i \geq 1} a_{r,i} T^{2^i}$. By
[10](#remark: Kh localization){reference-type="ref+label"
reference="remark: Kh localization"} and
[4](#theorem: vk is Vk){reference-type="ref+label"
reference="theorem: vk is Vk"} we infer
$$\pi^e_* \left(L_{K(h)}{\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle\right)/I_h
        \cong
    \mathbb F_2[a_{r,i}:0\leq r\leq 2^{n-1}-1, 1\leq i\leq m][V_h^{-1}]/(V_1,\ldots,V_{h-1})$$
and we are interested in its $\mathbb F_4$-points, i.e. its ring
homomorphisms to $\mathbb F_4$. In the language of classical algebra we
have polynomials $V_1, \cdots, V_h \in \mathbb F_2[a_{r,i}]_{r,i}$ and
we wish to choose an $\alpha_{r,i} \in \mathbb F_4$ for each $a_{r,i}$
such that
$$V_1((\alpha_{r,i})_{r,i}) = V_2((\alpha_{r,i})_{r,i}) = \cdots = V_{h-1}((\alpha_{r,i})_{r,i}) = 0 \quad \text{and} \quad V_h((\alpha_{r,i})_{r,i}) \neq 0$$
in $\mathbb F_4$.
:::

::: notation
**Notation 2**. Consider a collection of elements
$\alpha=\{\alpha_{r,i}\in \mathbb F_4:0\leq r\leq 2^{n-1}-1, \ 1\leq i\leq m\}$.

(i) Let $r \geq 0$. We write
    $\textcolor{chillired}{P^\alpha_{r}(T)} \coloneqq T+\sum_{i = 1}^m\alpha_{r,i} T^{2^{i}} \in \mathbb F_4 [T ]$.

(ii) Let
     $\textcolor{chillired}{P^{\alpha}(T)} \coloneqq  P^\alpha_{2^{n-1}-1}\circ P_{2^{n-1}-2}^{\alpha} \circ\cdots\circ P^\alpha_0(T) \in \mathbb F_4 [T]$.
     So $$P^\alpha(T)=T+\sum_{k}V^\alpha_k T^{2^{k}}.$$ for certain
     $V_k^{\alpha} \in \mathbb F_4$ described by polynomials in
     $\alpha_{r,i}$.

So an $\mathbb F_4$-point of
$\pi^e_*(L_{K(h)}{\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle)/I_h$
is a choice of elements $\alpha$ such that
$V^\alpha_1=V^\alpha_2=\cdots =V^\alpha_{h-1}=0$ and $V^\alpha_h\neq 0$.
In other words, an $\mathbb F_4$-point is an $\alpha$ such that
$P^{\alpha}(T) = T + V_h^{\alpha} T^{2^h}$ with $V_h^{\alpha} \neq 0$.
:::

::: {#prop: F4 points computation .proposition}
**Proposition 5**. Let $G = C_{2^n}$ and $h = 2^{n-1}m$.

(i) Let $n \geq 3$ and $m = 1$. Then, the number of $\mathbb F_4$-points
    of
    $\pi_*^e(L_{K(h)}{\operatorname{BP}^{(\!(G)\!)}}\langle 1\rangle)/I_h$
    is at least $3^{2^{n-2}}$.

(ii) Let $n \geq 2$ and $m \geq 2$. Then,
     $\pi^e_*(L_{K(h)}{\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle)/I_h$
     has at least four $\mathbb F_4$-points.
:::

::: proof
*Proof.* This is a pure algebra problem. Namely, we will look for
$\mathbb F_4$-points $\alpha$, i.e. choices of elements such that
$P^{\alpha}(T) = T + V_h^{\alpha} T^{2^h}$ with $V_h^{\alpha} \neq 0$.

(i) Let $(c_0, c_1, \cdots, c_{2^{n-2}-1})$ be a tuple in
    $\mathbb F_4^{\times}$, so in particular $c_q^3 = 1$. We then pick
    $$(\alpha_{0,1}, \alpha_{1,1}, \cdots, \alpha_{2^{n-1}-1,1}) = (c_0, c_0, c_1, c_1, \cdots, c_{2^{n-2}-1}, c_{2^{n-2}-1}).$$
    In this case,
    $P_{2q}^{\alpha}(T) = P_{2q+1}^{\alpha}(T) = T + c_q T^2$ for
    $q \geq 0$, so
    $$P_{2q+1}^{\alpha} \circ P_{2q}^{\alpha}(T) = T + c_q T^2 + c_q T^2 + c_q^3 T^4 = T + T^4.$$
    Iterating this procedure yields
    $$T+V^\alpha_1T^2+\cdots+V^\alpha_hT^{2^h} = P^\alpha_{2^{n-1}-1}\circ\cdots\circ P^\alpha_0(T) =T+T^{2^h}.$$
    Thus, we have constructed $3^{2^{n-2}}$ examples of
    $\mathbb F_4$-points.

(ii) We will construct polynomials
     $$A_m(T) = T + \sum_{k=1}^{m} p_k T^{2^k} \in \mathbb F_4[T] \quad \text{and} \quad B_m(T) = T + \sum_{k = 1}^m q_k T^{2^k} \in \mathbb F_4[T]$$
     such that $B_m(A_m(T)) = T + T^{2^{2m}}$. Then, choosing
     $$P_0^{\alpha} = A_m, \ P_1^{\alpha} = B_m, \ P_{q}^{\alpha} = T + T^{2^m}$$
     for $q \geq 2$ yields
     $$P^{\alpha}(T) = P_{2^{n-1}-1}^{\alpha} \circ P_{2^{n-1}-2}^{\alpha} \circ \cdots \circ P_0^{\alpha}(T) = (T + T^{2^{2m}})^{\circ 2^{n-2}} = T + T^{2^h}.$$
     The choices of $p_k$ and $q_k$ are thus in particular
     $\mathbb F_4$-points of the desired form. Three such points are
     obtained by setting $p_k = q_k = 0$ for $k \leq m-1$ and
     $p_m = q_m \in \mathbb F_4^{\times}$. This is by the same
     computation as in (i). We need to construct one more. Let
     $\omega \in \mathbb F_4$ be such that $\omega^2 + \omega + 1 = 0$.
     We put
     $$A_m(T) = T + \omega^2 \sum_{k=1}^{m-1} T^{2^k} + \omega T^{2^m} \quad \text{and} \quad B_m(T) = T + \sum_{k=1}^{m-1} q_k T^{2^k} + q_m T^{2^m}$$
     with $$q_k = \begin{cases}
                 \omega^2 \quad & k<m \text{ odd},
                 \\ \omega & k<m \text{ even}
             \end{cases} \qquad \text{and} \qquad q_m = \begin{cases}
                 \omega \quad & m \text{ odd},
                 \\ \omega^2 & m \text{ even}.
             \end{cases}$$ Let us now outline that these fulfill the
     desired properties.
     $$S_m(T) = \sum_{k=0}^{m-1} T^{2^k} \quad \text{and} \quad R(T) = T + \omega T^2.$$
     One may compute $A_m(T) = R(S_m(T))$ and $B_m(T) = S_m(R(T))$. It
     is then an algebra exercise to verify that
     $$B_m(A_m(T)) = S_m(R(R(S_m(T)))) = T + T^{2^{2m}}.$$

 ◻
:::

By [@beaudryHillShiZeng2021modelsLubinTate Proposition 7.1]
$$\pi_*^e \left(L_{K(h)} D^{-1}\operatorname{BP}^{(\!(G)\!) \langle m \rangle} \right)/I_h \cong \mathbb F_2[(t^{G}_m)^{\pm 1}].$$
and it only has three $\mathbb F_4$-points, so using
[5](#prop: F4 points computation){reference-type="ref+label"
reference="prop: F4 points computation"} we deduce:

::: {#theorem: not higher real k theory .theorem}
**Theorem 5**. Let $G=C_{2^n}$, and $h=2^{n-1}m$. Suppose
$n\geq 3, m\geq 1$ or $n\geq 2,m\geq 2$. Then, there is no equivalence
between
$L_{K(h)}\operatorname{Res}^G_e{\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle$
and
$L_{K(h)}\operatorname{Res}^G_e D^{-1} {\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle$
of $\operatorname{BP}$-modules.
:::

### Periodicity for Lubin--Tate theories {#subsection: periodicity lubin tate}

To the best of the authors' knowledge,
[3](#thm:BHSZ_refinement){reference-type="ref+label"
reference="thm:BHSZ_refinement"} gives the first construction of
$G$-equivariant maps
$${\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle\longrightarrow E(k,\Gamma_h)$$
factoring the Beaudry--Hill--Shi--Zeng
${\operatorname{BP}^{(\!(G)\!)}}$-orientation of $E(k,\Gamma_h)$ for all
$G=C_{2^n}$ and $h=2^{n-1}m$. The existence of these maps has already
been used to great effect in the literature, see
[@meier2024transchromaticphenomenaequivariantslice; @duan2025periodicityfinitecomplexityhigher].

In this section, we briefly summarize various applications of these maps
in the literature, particularly to determine periodicities for
$E(k,\Gamma_h)$. We aim to be brief and will implicitly adopt the
notation and terminology from
[@meier2024transchromaticphenomenaequivariantslice; @duan2025periodicityfinitecomplexityhigher],
which the interested reader may look into. The goal of this section is
only to highlight instances where these maps have been used. We thank
Lennart Meier and XiaoLin Danny Shi for helpful conversations.

Hill--Hopkins--Ravenel conjectured[^9] that the slice spectral sequences
computing $E(k,\Gamma_h)^{hG}$ relate to each other for varying heights
$h$ and groups $G$. Inspired by this, work of Meier--Shi--Zeng showed
that the slice spectral sequences for
${\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle$ exhibit such
transchromatic phenomena.

::: theorem
**Theorem 6** (Transchromatic Isomorphism for
${\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle$,
[@meier2024transchromaticphenomenaequivariantslice Theorem A]). Let
$G=C_{2^{n+1}}$ and $m\geq 1$. There is a shearing isomorphism
$d_{2r-1} \leftrightsquigarrow d_r$ between the following regions of
spectral sequences:

(i) The $G$-slice spectral sequence of
    ${\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle$ on or above the
    line of slope $1$; and

(ii) The $(G/C_2)$-slice spectral sequence of
     $\operatorname{BP}^{(\!(G/C_2)\!)} \langle m \rangle$.
:::

Using the maps
${\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle\to E(k,\Gamma_h)$
supplied by [3](#thm:BHSZ_refinement){reference-type="ref+label"
reference="thm:BHSZ_refinement"}, naturality of the slice spectral
sequence then gives an explicit correspondence between the differentials
in the $C_{2^{n+1}}$-slice spectral sequence of $E(k,\Gamma_h)$ in a
region with the differentials in the $C_{2^{n}}$-slice spectral sequence
of $E(k,\Gamma_{h/2})$. In particular, Meier--Shi--Zeng deduce a
transchromatic isomorphism and periodicity theorem for Lubin--Tate
theories.

::: theorem
**Theorem 7** (Transchromatic Isomorphism for $E(k,\Gamma_h)$,
[@meier2024transchromaticphenomenaequivariantslice Theorem 8.3]). Let
$V\in \operatorname{RO}(G/C_2)$. The class $u_V$ is a permanent cycle in
the slice spectral sequence of $E(k,\Gamma_h)$ if and only if the class
$u_V$ is a permanent cycle in the slice spectral sequence of
$E(k,\Gamma_{h/2})$.
:::

Using work by Hu--Kriz [@HuKrizReal], Hill--Hopkins--Ravenel
[@HillHopkinsRavenel2017C4RealKTheory], and Hill--Shi--Wang--Xu
[@hill2023slice] compute periodicities for
${\operatorname{BP}_{\mathbb{R}}\langle n\rangle}$,
$\operatorname{BP}^{(\!(C_4)\!)}\langle 1\rangle$, and
$\operatorname{BP}^{(\!(C_4)\!)}\langle 2\rangle$ respectively.
Meier--Shi--Zeng use the Transchromatic Isomorphism to deduce a number
of periodicities, and import them via the maps
${\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle\to E(k,\Gamma_h)$ to
deduce periodicities for the Lubin--Tate theories.

::: theorem
**Theorem 8** (Periodicity for $E(k,\Gamma_h)$,
[@meier2024transchromaticphenomenaequivariantslice Theorem B]). Let
$G=C_{2^{n+1}}$, $m\geq 1$, and $h=2^nm$ and
$V\in \operatorname{RO}(G/C_2)$. Then, $(\vert V\vert -V)$ is an
$\operatorname{RO}(G)$-graded periodicity for $E(k,\Gamma_h)$ if and
only if $(\vert V\vert -V)$ is an $\operatorname{RO}(G/C_2)$-graded
periodicity for $E(k,\Gamma_{h/2})$.
:::

More recently, Duan--Hill--Li--Liu--Shi--Wang--Xu determine a large
class of $\operatorname{RO}(G)$-graded periodicities for
$E(k,\Gamma_h)$. In particular, Meier--Shi--Zeng's Transchromatic
Isomorphism theorem for $E(k,\Gamma_h)$ plays a key role in part of
[@duan2025periodicityfinitecomplexityhigher Part (1) of Theorem B].

::: theorem
**Theorem 9** (Periodicity for $E(k,\Gamma_h)$,
[@duan2025periodicityfinitecomplexityhigher Part (1) of Theorem B]). Let
$G=C_{2^n}$, and $h=2^{n-1}m$. Let $\rho_G$ denote the regular
representation of $G$. Let $\lambda_i$ denote the $2$-dimensional
$G$-representation corresponding to rotation by $\frac{\pi}{2^i}$ for
$0 \leq i \leq n-1$. The $G$-spectrum $E(k,\Gamma_h)$ has the following
$\operatorname{RO}(G)$-graded periodicities:

(i) $\rho_{G}$, the regular representation of $G$;

(ii) $2^{2^{n-i}m+n-i+1}-2^{2^{n-i}m+n-i}\lambda_{n-i}$,
     $1\leq i\leq n$.
:::

These are by no means all known applications of the orientation
${\operatorname{BP}^{(\!(G)\!)}}\langle m\rangle\to E(k,\Gamma_h)$, but
we hope to have demonstrated the relevance of the map and in particular
the strength of our structured orientations to be able to produce it.

## Twisted monoid quotients via equivariant cubes

Our discussion of twisted monoid quotients was fully in the language of
Hill--Hopkins--Ravenel [@HHR16], but we have also used the language of
parametrized higher category theory. In the spirit of this, we record a
universal property of twisted monoid quotients in terms of equivariant
cubes.

Non-equivariantly, quotients by multiple elements can be encoded as
certain total cofibers of cubes. Twisted monoid quotients
([1](#construction:TMR2){reference-type="ref+label"
reference="construction:TMR2"}) modify this construction by putting
suitable actions on the cube. We make it precise in this appendix. Let
us first define the relevant equivariant cubes.

::: construction
**Construction 2**
([@hilman2024parametrisednoncommutativemotivesequivariant Construction
3.2.3, Notation 3.2.7]). Let $H \leq G$ be a subgroup.

(i) Let $%
      
        % draw a slightly shorter underline
        \uline{\hphantom{\Delta}\kern-0pt}%
        % restore overall width so following text lines up
        \kern 0pt%
        % overlay the actual content, with proper math style
        \mathllap{\mathpalette\my@cont@{\Delta}}%
      
    ^1$ denote the constant $H$-category with value $\Delta^1$. Then,
    the $G$-$\infty$-category $\operatorname{Coind}_H^G %
      
        % draw a slightly shorter underline
        \uline{\hphantom{\Delta}\kern-0pt}%
        % restore overall width so following text lines up
        \kern 0pt%
        % overlay the actual content, with proper math style
        \mathllap{\mathpalette\my@cont@{\Delta}}%
      
    ^1$ is a cube in each level, and vertices are given by strings of
    $0$'s and $1$'s of a suitable length. We denote by
    $\textcolor{chillired}{%
      
        % draw a slightly shorter underline
        \uline{\hphantom{J}\kern-0pt}%
        % restore overall width so following text lines up
        \kern 0pt%
        % overlay the actual content, with proper math style
        \mathllap{\mathpalette\my@cont@{J}}%
      
    _H^G} \subseteq \operatorname{Coind}_H^G %
      
        % draw a slightly shorter underline
        \uline{\hphantom{\Delta}\kern-0pt}%
        % restore overall width so following text lines up
        \kern 0pt%
        % overlay the actual content, with proper math style
        \mathllap{\mathpalette\my@cont@{\Delta}}%
      
    ^1$ the $G$-full subcategory, which on each level removes the vertex
    $1\cdots1$.

(ii) Let $%
       
         % draw a slightly shorter underline
         \uline{\hphantom{\mathscr C}\kern-0pt}%
         % restore overall width so following text lines up
         \kern 0pt%
         % overlay the actual content, with proper math style
         \mathllap{\mathpalette\my@cont@{\mathscr C}}%
       
     ^{\otimes}$ be a $G$-symmetric monoidal $\infty$-category and
     $(A \to B) = \varphi\colon %
       
         % draw a slightly shorter underline
         \uline{\hphantom{\Delta}\kern-0pt}%
         % restore overall width so following text lines up
         \kern 0pt%
         % overlay the actual content, with proper math style
         \mathllap{\mathpalette\my@cont@{\Delta}}%
       
     ^1 \to \operatorname{Res}_H^G %
       
         % draw a slightly shorter underline
         \uline{\hphantom{\mathscr C}\kern-0pt}%
         % restore overall width so following text lines up
         \kern 0pt%
         % overlay the actual content, with proper math style
         \mathllap{\mathpalette\my@cont@{\mathscr C}}%$ be a map in
     $\operatorname{Res}_H^G %
       
         % draw a slightly shorter underline
         \uline{\hphantom{\mathscr C}\kern-0pt}%
         % restore overall width so following text lines up
         \kern 0pt%
         % overlay the actual content, with proper math style
         \mathllap{\mathpalette\my@cont@{\mathscr C}}%$. Then, we write
     $$\textcolor{chillired}{\underset{\underline{J}_H^G}{%
       
         % draw a slightly shorter underline
         \uline{\hphantom{\mathop{\mathrm{colim}}}\kern-0pt}%
         % restore overall width so following text lines up
         \kern 0pt%
         % overlay the actual content, with proper math style
         \mathllap{\mathpalette\my@cont@{\mathop{\mathrm{colim}}}}%
       
     } \ N_H^G (A \to B)} \coloneqq %
       
         % draw a slightly shorter underline
         \uline{\hphantom{\mathop{\mathrm{colim}}}\kern-0pt}%
         % restore overall width so following text lines up
         \kern 0pt%
         % overlay the actual content, with proper math style
         \mathllap{\mathpalette\my@cont@{\mathop{\mathrm{colim}}}}%
       
      \left( %
       
         % draw a slightly shorter underline
         \uline{\hphantom{J}\kern-0pt}%
         % restore overall width so following text lines up
         \kern 0pt%
         % overlay the actual content, with proper math style
         \mathllap{\mathpalette\my@cont@{J}}%
       
     _H^G \subseteq \operatorname{Coind}_H^G %
       
         % draw a slightly shorter underline
         \uline{\hphantom{\Delta}\kern-0pt}%
         % restore overall width so following text lines up
         \kern 0pt%
         % overlay the actual content, with proper math style
         \mathllap{\mathpalette\my@cont@{\Delta}}%
       
     ^1 \xrightarrow{\operatorname{Coind}_H^G \varphi} \operatorname{Coind}_H^G \operatorname{Res}_H^G %
       
         % draw a slightly shorter underline
         \uline{\hphantom{\mathscr C}\kern-0pt}%
         % restore overall width so following text lines up
         \kern 0pt%
         % overlay the actual content, with proper math style
         \mathllap{\mathpalette\my@cont@{\mathscr C}}%
       
      \xrightarrow{N_H^G} %
       
         % draw a slightly shorter underline
         \uline{\hphantom{\mathscr C}\kern-0pt}%
         % restore overall width so following text lines up
         \kern 0pt%
         % overlay the actual content, with proper math style
         \mathllap{\mathpalette\my@cont@{\mathscr C}}%
       
      \right).$$
:::

Let $H \leq G$ and let $R$ be an $\mathbb E_{\infty}^G$-ring spectrum.
Recall that the norm in $%
  
    % draw a slightly shorter underline
    \uline{\hphantom{\mathrm{LMod}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\mathrm{LMod}}}%
  
_R(%
  
    % draw a slightly shorter underline
    \uline{\hphantom{\mathrm{Sp}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\mathrm{Sp}}}%
  
^G)^{\otimes}$ is given by
$N_R^{H \to G} M \simeq R \otimes_{N_H^G R} N_H^G M$, see
e.g. [@quinnZhu2026multiplicativeequivariantthomspectra Example 3.3.14].

:::: proposition
**Proposition 6**. Let $H \leq G$ and let $R$ be an
$\mathbb E^G_\infty$-ring spectrum, $A$ be an $\mathbb E_1$-$R$-algebra
with a norm map $N_R^{H \to G} \operatorname{Res}_H^G A \to A$.[^10] Let
$x\in \pi^H_V(R)$, then there is a cofiber sequence

::: center
:::

in $\mathrm{LMod}_R(\mathrm{Sp}^G)$.
::::

:::: proof
*Proof.* Consider the cofiber sequence
$\Sigma^{V} \operatorname{Res}_H^GR[x]\to \operatorname{Res}_H^G R[x]\to \operatorname{Res}_H^G R$
in $\mathrm{LMod}_R(\mathrm{Sp}^H)$. Since $%
  
    % draw a slightly shorter underline
    \uline{\hphantom{\mathrm{LMod}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\mathrm{LMod}}}%
  
_R(%
  
    % draw a slightly shorter underline
    \uline{\hphantom{\mathrm{Sp}}\kern-0pt}%
    % restore overall width so following text lines up
    \kern 0pt%
    % overlay the actual content, with proper math style
    \mathllap{\mathpalette\my@cont@{\mathrm{Sp}}}%
  
^G)^{\otimes}$ is a distributive symmetric monoidal
$G$-$\infty$-category [@quinnZhu2026multiplicativeequivariantthomspectra
Theorem A], we can apply Hilman's result
[@hilman2024parametrisednoncommutativemotivesequivariant Proposition
3.2.8]. According to it, applying $N_R^{H \to G}$ induces a cofiber
sequence

::: center
:::

Since base change preserves parametrized colimits
[@quinnZhu2026multiplicativeequivariantthomspectra Proposition 3.3.11],
by base change along the map $R[G\cdot x]\to N_R^{H \to G} A \to A$ we
obtain the desired cofiber sequence. ◻
::::

:::: example
**Example 3**. For $R = \mathbb S$ we obtain the cofiber sequence

::: center
:::

in $\mathrm{Sp}^G$.
::::

::: remark
**Remark 13**. The proof relies on Hilman's
[@hilman2024parametrisednoncommutativemotivesequivariant Proposition
3.2.8] which is written for $G$-symmetric monoidal categories. Examining
Hilman's proof, it is enough to know that only the specific norm functor
$N^{H\to G}_{R}$ from [@quinnZhu2026multiplicativeequivariantthomspectra
Theorem A] is distributive. In particular, the assumption that $R$ is an
$\mathbb E^G_\infty$-ring spectrum can be significantly weakened.
:::

R. Quinn, [Utrecht Geometry Center, Universiteit Utrecht, The
Netherlands]{.smallcaps}\
*E-mail address*: `r.quinn@uu.nl`

Q. Zhu, [Max Planck Institute for Mathematics, Bonn,
Germany]{.smallcaps}\
*E-mail address*: `qzhu@mpim-bonn.mpg.de`

[^1]: Gezicht op de Oudegracht te Utrecht -- 1895.

[^2]: *Date*: 2026-06-25

[^3]: A $C_2$-action on $\operatorname{tmf}_1(3)$ is inherited through
    an algebro-geometrically defined action on the compactified moduli
    stack $\overline{\mathcal{M}}_1(3)$ of elliptic curves with a chosen
    point of order $3$, see [@hillmeier2017].

[^4]: On underlying it precisely reduces to Hahn--Wilson's construction
    [@hahnWilson2022redshift Construction 2.6.1].

[^5]: This is done by writing
    $A[x_i : i \in I] \simeq \bigotimes_{i \in I}^{\mathrm{LMod}_A} A[x_i]$.
    Since $A[x_i]$ is the free $\mathbb E_1$-algebra, a map
    $A[x_i] \to A$ is determined by where $x_i$ is sent to. Tensoring
    these together and multiplying yields the desired map.

[^6]: In fact all such objects can be recovered as quotients of
    ${\operatorname{MU}_{\mathbb{R}}}$ by suitable choices of polynomial
    generators. This follows from the same argument as
    [@hahnWilson2022redshift Lemma 2.0.5].

[^7]: []{#footnote: Coind label="footnote: Coind"}Using
    [@stewart2025tensorproductsequivariantcommutative Corollary 1.39]
    one can compute the structure spaces of a coinduced operad in terms
    of a limit along structure spaces of the original operad. In
    particular, the structure space
    $(\operatorname{Coind}_H^G \mathbb E_1)(G/H)$ is the one giving rise
    to an $H \to G$ norm multiplication. See
    [@stewart2025equivariantoperadssymmetricsequences Introduction] for
    more information. The limit is indexed over a diagram with an
    initial object, so one manages to compute
    $(\operatorname{Coind}_{H}^G \mathbb E_1)(G/H) \simeq \mathbb E_1(\operatorname{Res}_H^G G/H)$.
    This is non-empty. Thus, the
    $\operatorname{Coind}_H^G \mathbb E_1$-algebra structure yields
    compatibility with norm multiplications.

[^8]: The precise definition won't be relevant to us, the desiderata for
    it are explained in [@beaudryHillShiZeng2021modelsLubinTate Section
    6]. Nonetheless, let us briefly recall the construction. Consider
    those elements
    $x \in \pi_{*\rho}^{C_2} {\operatorname{BP}^{(\!(G)\!)}}$ that
    become invertible under
    $\pi_{*\rho}^{C_2}{\operatorname{BP}^{(\!(G)\!)}}\to \pi_{*\rho}^{C_2} E_h$.
    These can be viewed as elements in
    $\pi_{*\rho}^{C_2} {\operatorname{MU}^{(\!(G)\!)}}$ under the
    inclusion
    ${\operatorname{BP}^{(\!(G)\!)}}\to {\operatorname{MU}^{(\!(G)\!)}}$
    induced by the Real Quillen idempotent. Then, we define
    $D \coloneqq \prod_x N_{C_2}^G x \in \pi_{*\rho_G}^G {\operatorname{MU}^{(\!(G)\!)}}$.

[^9]: See [@meier2024transchromaticphenomenaequivariantslice Conjecture
    1.1] and the surrounding discussion for a written account of this
    conjecture.

[^10]: This is for example provided by a
    $\operatorname{Coind}_H^G \mathbb E_1$-$R$-algebra structure, see
    [7](#footnote: Coind){reference-type="ref+label"
    reference="footnote: Coind"}.

