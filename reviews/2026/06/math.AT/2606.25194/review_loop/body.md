## Introduction

Understanding the shape of data is a fundamental problem in applied
mathematics, data analysis, network science, and machine learning. In
particular, the interaction between topology and artificial intelligence
has become an important theme in applied and computational topology.
Data such as point clouds, images, graphs, and time series often contain
not only local metric information but also global structural
information, including connected components, holes, loops, and
higher-order relations. Homological invariants, such as Betti numbers
and persistent homology
([@edelsbrunner2002topological; @zomorodian2004computing; @cohen2005stability; @edelsbrunner2008persistent; @otter2017roadmap]),
provide mathematical tools for describing such global structures and
have been widely used as topological descriptors and features in
artificial-intelligence and machine-learning pipelines (see
[@adams2017persistence; @hofer2017deep; @bubenik2020persistence; @chazal2014stochastic; @kalivsnik2019tropical]).
Such topological features can improve representations or regularization
when the underlying data distribution has nontrivial geometric or
topological structure.

Topology is also important not only as a descriptor but also as a
quantity to be controlled in optimization through loss functions or
regularizers (see
[@moor2020topological; @vandaele2021topologically; @gabrielsson2020topology]).
In many applications, one would like the output of a model or an
optimization procedure to satisfy prescribed topological constraints.
For example, in image segmentation, controlling the topology of
predicted regions can reduce spurious connected components or undesired
holes(see [@clough2020topological; @hu2019topology]). In graph and
network design, the Betti numbers of clique complexes describe
higher-order connectivity, redundancy, and cyclic structure, which are
related to robustness and alternative pathways in networks. Thus,
differentiable control of persistent homology and Betti numbers is
relevant to topology-constrained optimization in a broad
applied-mathematical sense. In this prescriptive setting, topology is
optimized rather than only observed: the aim is to deform, generate, or
regularize an object so that its homological structure satisfies a
desired condition.

Persistent homology provides a natural mechanism for such topological
control. Since a persistence diagram or barcode records the birth and
death of homology classes across a filtration, one can define losses
that penalize undesired bars, preserve selected bars, or match a target
barcode. These barcode-based losses make it possible to incorporate
persistent homology directly into optimization and learning procedures.
However, directly controlling topological quantities is difficult
because they are inherently discrete and combinatorial. Betti numbers of
clique complexes depend on simplex inclusion and ranks of boundary
operators. Even when graph edges are relaxed into continuous weights or
probabilities, the resulting clique complex and its Betti numbers remain
governed by combinatorial conditions.

For persistent homology, differentiable losses based on barcode or
persistence-diagram representations have been studied, and such losses
are useful when the desired constraint is naturally expressed in terms
of persistent features. However, when topology is used as an
optimization signal, such losses have several limitations: gradients may
tend to be localized on a small number of critical simplices (see
[@nigmetov2024topological; @nigmetov2024topological_2]),
persistence-pairing changes may cause abrupt changes in gradient
directions, and barcode representations may compress away geometric and
spectral information that could provide smoother and more spatially
distributed update directions.

We emphasize that our goal is not to replace persistent homology as a
descriptor. Persistent homology remains the appropriate object when one
wants stable barcode-level summaries of multiscale topology. Our focus
is different: we study topology as a differentiable loss or constraint
inside an optimization loop. In this setting, a smooth Hodge-spectral
surrogate can be useful because it provides gradients through
low-frequency spectral structure rather than only through selected
birth--death simplices.

In this work, we address these difficulties by representing homology
through the zero modes of Hodge Laplacians. For a simplicial complex,
the $k$-th Betti number is equal to the dimension of the kernel of the
$k$-th Hodge Laplacian. Instead of directly counting zero eigenvalues,
we introduce smooth low-pass spectral filters that emphasize zero and
near-zero eigenmodes. These filters provide differentiable spectral
surrogates for topological information and allow homological information
to be used as a continuous optimization signal.

More specifically, we construct Hodge-Laplacian-type spectral
relaxations from soft graphs and soft clique complexes. This gives a
unified formulation for two standard sources of finite simplicial
complexes: graph data and Vietoris--Rips filtrations of point clouds. In
the point-cloud setting, soft edge activations are defined from pairwise
distances and scale parameters. In the graph setting, edge probabilities
induce soft simplex weights and hence soft clique complexes. In both
cases, topological losses are defined by applying low-pass spectral
filters, such as heat filters, resolvent filters, and polynomial moment
filters, to the corresponding Hodge-Laplacian-type spectral relaxations.
In the hard limit, the proposed ambient operator recovers the ordinary
Hodge Laplacian on the active subcomplex and hence retains the standard
homological interpretation. In the soft regime, the same construction
should be interpreted as a differentiable low-frequency spectral
surrogate for homological structure.

The Laplacian-based formulation also connects naturally with polynomial
spectral methods and trace estimation. In particular, trace-type
quantities such as $$\operatorname{Tr}(I-\alpha L_q)^d$$ can be
interpreted as low-frequency spectral masses and, in the hard
ordinary-complex setting, as smooth surrogates for normalized Betti
numbers, since zero modes contribute one to the trace while nonzero
modes are suppressed by the polynomial filter. This structure is closely
related to stochastic trace estimation and polynomial approximations of
spectral projectors. It also has a structural connection to quantum
trace-estimation approaches for normalized Betti numbers, which often
formulate Betti numbers through the null space of combinatorial
Laplacians. However, this paper does not implement a quantum algorithm
and does not claim quantum advantage. We therefore treat the quantum
connection as a possible computational direction rather than as a main
contribution (see
[@lloyd2016quantum; @akhalwaya2024comparing; @gyurik2022towards; @yamauchi2025quantum]).

The contributions of this work are summarized as follows.

1.  We construct an ambient Hodge-spectral relaxation for finite
    simplicial complexes. In the hard limit, the penalty-regularized
    ambient operator recovers the ordinary Hodge Laplacian on the active
    subcomplex and hence the corresponding Betti number.

2.  We define differentiable topological losses using heat filters,
    resolvent filters, and polynomial Laplacian moments. These
    objectives include spectral-filter matching losses and trace-type
    Betti surrogates.

3.  For Vietoris--Rips filtrations of point clouds, we numerically
    compare the proposed Hodge spectral-filter losses with
    persistent-homology-based losses and show that they provide more
    spatially distributed gradients, smoother scale-normalized behavior
    under persistence-pairing changes, and update directions that better
    reflect surrounding geometry.

4.  For graph clique complexes, we use Laplacian moments to control
    normalized first-Betti-type quantities and show that the proposed
    topological loss can be combined with ordinary graph-feature
    objectives.

5.  We discuss computational trade-offs and identify polynomial
    filtering, Chebyshev approximation, and trace-estimation-based
    implementations as possible routes toward larger-scale applications.

In summary, this work presents a Hodge-spectral framework for
controlling homological constraints in point clouds and graphs. By
replacing discrete topological quantities with smooth low-pass spectral
surrogates, the proposed method enables topology to be treated not only
as a descriptor of data, but also as a controllable object in
optimization, network design, machine learning, and future
quantum-assisted topological computation.

## Preliminaries and Problem Setting

In this section, we summarize the topological quantities considered in
this work and the difficulties that arise when using them as loss
functions. We first introduce the Betti numbers of clique complexes
constructed from graphs, and describe why it is difficult to directly
use them as loss functions. We then introduce persistent homology for
point-cloud data and loss functions based on barcode diagrams. Finally,
we discuss three issues of barcode-based loss functions: gradient
localization, discontinuity caused by changes in persistence pairings,
and loss of geometric and spectral information.

### Clique Complexes and Betti Numbers

We first introduce the Betti numbers of clique complexes as topological
quantities for graph data. Let $G=(V,E)$ be a graph, where $V$ is the
set of vertices and $E$ is the set of edges. The clique complex $X(G)$
of $G$ is a simplicial complex obtained by regarding each clique in the
graph as a simplex. That is, a subset of vertices
$$\sigma=\{v_0,\ldots,v_k\}\subset V$$ is a $k$-simplex if, for any
distinct $i,j$, $$(v_i,v_j)\in E$$ holds. Equivalently, $\sigma$ must
form a $(k+1)$-clique. Therefore, the clique complex is defined as
$$X(G)=\{\sigma\subset V:\sigma \text{ is a clique in }G\}.$$ Let
$C_k(X(G))$ be the $k$-th chain group of $X(G)$, and let
$$\partial_k:C_k(X(G))\to C_{k-1}(X(G))$$ be the boundary operator. The
$k$-th homology group is defined by
$$H_k(X(G))=\ker \partial_k / \operatorname{im}\partial_{k+1}.$$ The
dimension of this homology group, $\beta_k(X(G))=\dim H_k(X(G))$ is
called the $k$-th Betti number. In particular, $\beta_0$ represents the
number of connected components, while $\beta_1$ represents the number of
independent one-dimensional cycles, namely loops that are not filled by
triangles or higher-dimensional simplices.

The Betti numbers of clique complexes capture higher-order connectivity
and cyclic structures of graphs. Therefore, controlling the Betti
numbers of clique complexes in graph generation or network design is
meaningful for controlling redundancy and robustness of graph
structures.

### Difficulties in Using Betti Numbers as Loss Functions

Suppose that we want to optimize a graph so that the Betti number of its
clique complex approaches a target value. For example, for a target
Betti number $\beta_k^{\mathrm{tar}}$, one may consider the loss
function

$$L_{\beta}(G)
=
\left(
\beta_k(X(G))-\beta_k^{\mathrm{tar}}
\right)^2.$$

This formulation is natural from an intuitive viewpoint. However, it is
difficult to optimize this loss function using standard gradient-based
methods.

The reason is that the map

$$G \longmapsto X(G) \longmapsto \beta_k(X(G))$$

is combinatorial and discrete. A small change in the presence or absence
of edges can discontinuously change the set of simplices contained in
the clique complex. As a result, the ranks of boundary operators and the
dimensions of homology groups can also change discontinuously.

### Persistent Homology

Next, we introduce persistent
homology[@edelsbrunner2002topological; @zomorodian2004computing; @cohen2005stability; @edelsbrunner2008persistent; @otter2017roadmap]
as a topological quantity for point-cloud data and related data types.
Suppose that, from data $X$, we construct a sequence of simplicial
complexes $$K_0 \subset K_1 \subset \cdots \subset K_m$$ according to a
scale parameter. Such a nested sequence of simplicial complexes is
called a filtration. For example, for point-cloud data, one can
construct a filtration using Vietoris--Rips complexes indexed by a
distance scale $r$.

At each scale $r$, the $k$-th homology group is $$H_k(K_r)
=
\ker \partial_k / \operatorname{im}\partial_{k+1}.$$ Persistent homology
tracks when homology classes are born and when they die along the
filtration. For a homology class $\gamma$, let its birth time be
$b_{\gamma}$ and its death time be $d_{\gamma}$. Then the $k$-th
persistence diagram is represented as $$\operatorname{Dgm}_k(X)
=
\{(b_{\gamma},d_{\gamma})\}_{\gamma}
\subset \mathbb{R}^2.$$ The persistence of $\gamma$ is defined by
$\operatorname{pers}(\gamma)=d_{\gamma}-b_{\gamma}$.

Persistence diagrams and barcode diagrams provide compact summaries of
the multiscale topological structure of data. Homology classes with long
persistence are often interpreted as reflecting essential structures of
the data rather than noise. For this reason, persistent homology is
widely used for shape analysis of point clouds, images, time-series
data, and related objects.

### Loss Functions Based on Barcode Diagrams

One way to incorporate persistent homology into machine learning is to
construct loss functions from barcode diagrams or persistence diagrams.
In general, given a target persistence diagram $D^{\mathrm{tar}}$, one
may define a loss function for input data $X$ as $$L_{\mathrm{PD}}(X)
=
\ell
\left(
\operatorname{Dgm}_k(X),
D^{\mathrm{tar}}
\right).$$ For example, if the goal is to remove undesired homology
classes, let $U$ be the set of undesired classes. Then one can use a
loss of the form $$L_{\mathrm{PD}}(X)
=
\sum_{\gamma\in U}
(d_{\gamma}-b_{\gamma})^2.$$ This loss acts to shorten the lifetimes of
undesired homology classes.

On the other hand, if the goal is to preserve specific homology classes,
let $T$ be the set of classes to be preserved, and let $\tau_{\gamma}$
be the target persistence. Then one can consider the loss function
$$L_{\mathrm{PD}}(X)
=
\sum_{\gamma\in T}
\left(
(d_{\gamma}-b_{\gamma})-\tau_{\gamma}
\right)^2.$$ Such barcode-based loss functions can be differentiated
through birth and death values. The birth and death of each homology
class $\gamma$ are determined by certain critical simplices. That is,
one can write $$b_{\gamma}=f(\sigma_b),
\qquad
d_{\gamma}=f(\sigma_d),$$ where $\sigma_b$ is the simplex that
determines the birth, $\sigma_d$ is the simplex that determines the
death, and $f$ is the function assigning filtration values to simplices.

Then the gradient of the loss function can formally be written as
$$\nabla_X L_{\mathrm{PD}}
=
\frac{\partial L_{\mathrm{PD}}}{\partial b_{\gamma}}
\nabla_X f(\sigma_b)
+
\frac{\partial L_{\mathrm{PD}}}{\partial d_{\gamma}}
\nabla_X f(\sigma_d).$$ Thus, in barcode-based loss functions, gradients
can be computed through the critical simplices that determine birth and
death values.

### Issues of Barcode-Based Loss Functions

This property makes it possible to use persistent homology as a loss
function. However, this formulation has the following three important
issues.

#### Gradient Localization

The first issue is that gradients tend to be localized on a small number
of critical simplices(see
[@nigmetov2024topological; @nigmetov2024topological_2]).

As described above, in barcode-based loss functions, the birth and death
of each homology class are determined by critical simplices $\sigma_b$
and $\sigma_d$. Therefore, the gradient of the loss mainly flows through
$$\nabla_X f(\sigma_b),
\qquad
\nabla_X f(\sigma_d).$$ In other words, the actual updates tend to be
concentrated on the vertices contained in these critical simplices and
their neighborhoods.

However, topological structures are inherently determined by the global
configuration of the data. For example, when a point cloud forms a large
loop, the birth or death of the loop may be represented by a small
number of critical simplices, but geometrically the shape of the entire
loop is important. Nevertheless, barcode-based losses concentrate
gradients on a small number of simplices and may fail to provide smooth
update directions for the entire data set.

Such gradient localization can make optimization unstable and may
prevent geometrically natural deformations.

#### Discontinuity of Gradients Caused by Pairing Changes

The second issue is that gradients can change discontinuously when
persistence pairings change due to small perturbations of filtration
values.

In persistent homology, each homology class $\gamma$ is associated with
a birth--death pair of simplices $$(\sigma_b,\sigma_d).$$ However, when
a small perturbation is added to the input data $X$, the ordering of
filtration values of simplices may change. As a result, the persistence
pairing may change as $$(\sigma_b,\sigma_d)
\longrightarrow
(\sigma'_b,\sigma'_d).$$ In this case, even if the persistence diagram
itself remains stable, the simplices through which gradients flow switch
from $$\nabla_X f(\sigma_b),
~
\nabla_X f(\sigma_d)\quad
\longrightarrow\quad
\nabla_X f(\sigma'_b),
~
\nabla_X f(\sigma'_d).$$ Consequently, even if the value of the loss
function does not change significantly, the gradient direction may
change discontinuously.

This issue is important from the viewpoint of optimization.
Gradient-based methods update parameters using local changes of the loss
function. If the gradient direction changes discontinuously under small
perturbations, stable optimization becomes difficult.

#### Loss of Geometric and Spectral Information

The third issue is that barcode diagrams are representations specialized
for birth--death information of homology classes, and they do not
sufficiently preserve surrounding geometric and spectral information.

A persistence diagram is obtained from input data $X$ through the map
$$X
\longmapsto
\operatorname{Dgm}_k(X)
=
\{(b_{\gamma},d_{\gamma})\}_{\gamma}.$$ This representation compactly
summarizes the scales at which each homology class is born and dies.
However, in this process, much information is compressed, including the
geometric locations supporting the homology classes, the surrounding
neighborhood structure, and spectral information such as eigenvectors
and low-frequency modes of Laplacians.

For example, two homology classes may have the same persistence, but
they may be arranged differently in the data space, may have different
degrees of geometric smoothness as cycles, or may contain different
near-closed structures. Barcode diagrams do not sufficiently distinguish
such differences.

Therefore, while barcode-based loss functions are effective for
controlling topological summary quantities, they may be insufficient for
providing geometrically natural and smooth update directions for the
entire data.

### Problem Addressed in This Work

The preceding subsections identify two related but distinct uses of
topology in data analysis and optimization. The first is descriptive:
one computes Betti numbers, persistent homology, or barcode diagrams of
a fixed data set in order to describe its global structure. The second
is prescriptive: one seeks to optimize a point cloud, graph, or model
output so that its topology satisfies a desired condition. This paper
focuses on the second use.

The difficulty is that the topological quantities considered above do
not directly provide smooth optimization signals. For clique complexes
of graphs, the map $$G
\longmapsto
X(G)
\longmapsto
\beta_k(X(G))$$ is combinatorial, because the set of simplices and the
ranks of the boundary operators can change discontinuously when edges
are added or removed. For Vietoris--Rips filtrations, barcode-based
losses make persistent homology differentiable through birth and death
values, but the resulting gradients may be localized on critical
simplices, may change abruptly when persistence pairings switch, and may
discard geometric and spectral information that could be useful for
optimization.

Our goal is therefore not merely to compute topological summaries, but
to construct differentiable objectives that retain a clear relationship
with homology while providing smoother and more spatially distributed
optimization signals. We use the Hodge-theoretic identity between
homology and zero modes of the combinatorial Laplacian as the starting
point. For a fixed finite simplicial complex $K$, the kernel of the
$q$-th Hodge Laplacian $L_q(K)$ is naturally isomorphic to $H_q(K)$, and
hence $\dim\ker L_q(K)=\beta_q(K)$.

The main question is how to use this identity when the simplicial
complex itself changes with continuous parameters. In the next section,
we address this question by embedding changing complexes into a fixed
ambient chain space, separating inactive simplex directions by a penalty
term, and then replacing hard simplex indicators with soft simplex
weights. This leads to a Hodge-Laplacian-type spectral relaxation that
recovers the ordinary Hodge-theoretic interpretation in the hard limit
and provides differentiable low-frequency spectral quantities in the
soft regime.

## Construction of Hodge-Laplacian-type spectral relaxation

In this section, we introduce ambient Hodge-spectral relaxations as the
basic objects for constructing differentiable topological losses for
both point-cloud data and graph data. The construction is exact in the
hard simplicial-complex limit and is used as a smooth spectral surrogate
in the soft regime.

The basic idea of this work is to represent both point-cloud data and
graph data as soft graphs and then construct soft clique complexes from
them. In graph generation, edge logits are used as optimization
variables. In Vietoris--Rips filtrations, edge logits are defined from
pairwise distances and a scale parameter. Therefore, both settings can
be described by the common sequence $$\theta
\longmapsto
a_e(\theta)
\longmapsto
p_e(\theta)
\longmapsto
w_\sigma(\theta)
\longmapsto
\widehat{L}_q(\theta).$$ Here, $a_e$ denotes an edge logit, $p_e$
denotes a soft edge activation, $w_\sigma$ denotes a simplex activation,
and $\widehat{L}_q$ denotes a penalty-regularized Hodge-Laplacian-type
spectral relaxation.

The terminology is important: for hard simplex indicators, the
construction recovers an ordinary Hodge Laplacian on the active
subcomplex. For soft simplex weights, the same formula should be
interpreted as a differentiable Hodge-spectral surrogate rather than as
the Hodge Laplacian of an exact chain complex.

For the ordinary Hodge Laplacian, zero modes correspond to homology
classes, and the dimension of the kernel of the $q$-th Hodge Laplacian
is equal to the $q$-th Betti number. However, when the simplicial
complex changes according to input data or model parameters, the
dimension and basis of the corresponding chain space may also change.
Therefore, it is difficult to directly treat the ordinary Hodge
Laplacian as a differentiable object on a fixed vector space.

To address this issue, we introduce a fixed ambient chain space
containing all candidate simplices. On this space, we construct a hard
Hodge Laplacian using projections and a penalty term so that the number
of zero modes agrees with the Betti number of the active subcomplex. We
then relax the projections using simplex activations obtained from a
soft graph, yielding a Hodge-Laplacian-type spectral relaxation that
depends smoothly on the parameters and recovers the ordinary
Hodge-theoretic interpretation in the hard limit.

### Ambient Chain Spaces and Boundary Operators

Let $K_{\max}$ be a finite fixed ambient simplicial complex containing
all candidate simplices that may appear during optimization. For
example, given a candidate edge set $E_{\max}$, one may define the
maximum candidate graph $$G_{\max}=(V,E_{\max})$$ and use its clique
complex $K_{\max}=X(G_{\max})$ as the ambient complex.

For each dimension $q$, define the ambient $q$-chain space by
$$C_q^{\mathrm{amb}}=C_q(K_{\max}).$$ This is a finite-dimensional real
vector space generated by all oriented $q$-simplices in $K_{\max}$.
After fixing orientations and equipping it with the standard inner
product, $C_q^{\mathrm{amb}}$ can be regarded as a finite-dimensional
Hilbert space.

Let $B_q:C_q^{\mathrm{amb}}\to C_{q-1}^{\mathrm{amb}}$ be the ambient
boundary operator of the fixed complex $K_{\max}$. For an oriented
simplex $\sigma=[v_0,\ldots,v_q]$, $$\partial_q\sigma
=
\sum_{i=0}^{q}
(-1)^i
[v_0,\ldots,\widehat{v_i},\ldots,v_q],$$ and the matrix representation
of this operator is $B_q$. Since the boundary of a boundary is zero, we
have $B_qB_{q+1}=0$.

Suppose that a hard subcomplex $K(\theta)\subset K_{\max}$ is determined
by a parameter $\theta$. For each $q$-simplex
$\sigma\in K_{\max}^{(q)}$, define the activity indicator by
$$\chi_\sigma(\theta)
=
\begin{cases}
1, & \sigma\in K(\theta),\\
0, & \sigma\notin K(\theta).
\end{cases}$$ The orthogonal projection onto the active $q$-simplex
directions is defined by $$\Pi_q(\theta)
=
\operatorname{diag}
\left(
\chi_\sigma(\theta)
\right)_{\sigma\in K_{\max}^{(q)}}.$$ Then the $q$-chain space of
$K(\theta)$ is embedded as
$$C_q(K(\theta))=\operatorname{Im}\Pi_q(\theta)
\subset C_q^{\mathrm{amb}}.$$

Since $K(\theta)$ is a simplicial complex, every face of an active
simplex is also active. Hence, $$B_q\operatorname{Im}\Pi_q(\theta)
\subset
\operatorname{Im}\Pi_{q-1}(\theta),$$ or equivalently,
$$\Pi_{q-1}(\theta)B_q\Pi_q(\theta)
=
B_q\Pi_q(\theta).$$ We define the hard restricted boundary operator on
the ambient space by $$B_q^{\mathrm{hard}}(\theta)
=
\Pi_{q-1}(\theta)B_q\Pi_q(\theta).$$ On the active subspace
$C_q(K(\theta))=\operatorname{Im}\Pi_q(\theta)$, this agrees with the
ordinary boundary map of the subcomplex $K(\theta)$.

### Penalty-Regularized Hard Ambient Hodge Laplacian

A naive Hodge operator on the fixed ambient space $C_q^{\mathrm{amb}}$
would be $$\left(
B_q^{\mathrm{hard}}(\theta)
\right)^\top
B_q^{\mathrm{hard}}(\theta)
+
B_{q+1}^{\mathrm{hard}}(\theta)
\left(
B_{q+1}^{\mathrm{hard}}(\theta)
\right)^\top.$$ However, since this operator acts on the entire ambient
space, inactive simplex directions may remain as spurious zero modes
that do not correspond to homology classes of the active subcomplex. To
remove them, we add an inactive-direction penalty. For $\mu>0$, define
$$L_q^{\mathrm{hard}}(\theta)
=
\left(
B_q^{\mathrm{hard}}(\theta)
\right)^\top
B_q^{\mathrm{hard}}(\theta)
+
B_{q+1}^{\mathrm{hard}}(\theta)
\left(
B_{q+1}^{\mathrm{hard}}(\theta)
\right)^\top
+
\mu
\left(
I-\Pi_q(\theta)
\right).$$ The last term assigns energy $\mu$ to inactive $q$-simplex
directions and removes them from the low-eigenvalue region.

With respect to the orthogonal decomposition $$C_q^{\mathrm{amb}}
=
\operatorname{Im}\Pi_q(\theta)
\oplus
\ker\Pi_q(\theta),$$ we have $$L_q^{\mathrm{hard}}(\theta)
=
L_q(K(\theta))
\oplus
\mu I_{\ker\Pi_q(\theta)}.$$ Therefore,
$$\ker L_q^{\mathrm{hard}}(\theta)
=
\ker L_q(K(\theta))
\simeq
H_q(K(\theta)).$$ Hence, $$\dim\ker L_q^{\mathrm{hard}}(\theta)
=
\beta_q(K(\theta)).$$ Thus, the number of zero modes of the
penalty-regularized hard ambient Hodge Laplacian agrees with the $q$-th
Betti number of the active subcomplex.

::: proposition
**Proposition 1** (Hard-limit consistency of the ambient Hodge
Laplacian). *Let $K(\theta)\subset K_{\max}$ be an active subcomplex and
let $L_q^{\mathrm{hard}}(\theta)$ be the penalty-regularized hard
ambient Hodge Laplacian defined above. Then, with respect to the
orthogonal decomposition $$C_q^{\mathrm{amb}}
=
C_q(K(\theta))\oplus C_q(K(\theta))^\perp,$$ one has
$$L_q^{\mathrm{hard}}(\theta)
=
L_q(K(\theta))\oplus \mu I_{C_q(K(\theta))^\perp}.$$ Consequently,
$$\ker L_q^{\mathrm{hard}}(\theta)
\simeq
H_q(K(\theta)),
\qquad
\dim\ker L_q^{\mathrm{hard}}(\theta)
=
\beta_q(K(\theta)).$$*
:::

::: proof
*Proof.* On the active subspace
$C_q(K(\theta))=\operatorname{Im}\Pi_q(\theta)$, the projected boundary
operators coincide with the ordinary boundary operators of the
subcomplex $K(\theta)$, because $K(\theta)$ is closed under taking
faces. On the inactive orthogonal complement, the projected boundary
terms vanish and the penalty term acts as multiplication by $\mu$. Thus
the operator decomposes as
$$L_q(K(\theta))\oplus \mu I_{C_q(K(\theta))^\perp}.$$ The statement
follows from the finite-dimensional Hodge decomposition, which
identifies $\ker L_q(K(\theta))$ with $H_q(K(\theta))$. ◻
:::

### Soft Graphs and Hodge-Laplacian-type spectral relaxation

We now relax the hard projection $\Pi_q(\theta)$ using a soft graph and
construct a differentiable spectral relaxation of the hard ambient
operator. Let $V=\{1,\ldots,n\}$ be the vertex set, and let
$E_{\max}\subset \binom{V}{2}$ be the set of candidate edges. For each
candidate edge $e\in E_{\max}$, define an edge logit
$a_e(\theta)\in\mathbb{R}$, and define the corresponding soft edge
activation by $$p_e(\theta)
=
\sigma(a_e(\theta))
=
\frac{1}{1+\exp(-a_e(\theta)/\varepsilon_e)}.$$ We call
$G_\theta=(V,E_{\max},p_\theta)$ a soft graph.

The activation or soft weight of a simplex $\sigma$ is defined as the
product of the activations of its constituent edges: $$w_\sigma(\theta)
=
\prod_{e\subset\sigma}p_e(\theta).$$ Vertices are assumed to always
exist, so $w_v(\theta)=1$. In particular, for an edge $e$, $w_e=p_e$,
and for a triangle $t=\{i,j,k\}$, $$w_t=p_{ij}p_{ik}p_{jk}.$$ In the
hard limit $p_e\to \mathbf{1}_{e\in E}$, we have
$$w_\sigma(\theta)\to \mathbf{1}_{\sigma\in X(G)}.$$ Thus, this
construction is a continuous relaxation of the ordinary clique complex
at the level of simplex indicators.

For each dimension $q$, define $$W_q(\theta)
=
\operatorname{diag}
\left(
w_\sigma(\theta)
\right)_{\sigma\in K_{\max}^{(q)}},
\qquad
R_q(\theta)=W_q(\theta)^{1/2}.$$ Using these matrices, define the
weighted boundary-type operator by $$\widetilde{B}_q(\theta)
=
R_{q-1}(\theta)B_qR_q(\theta).$$ In components, $$\left(
\widetilde{B}_q(\theta)
\right)_{\tau,\sigma}
=
\sqrt{w_\tau(\theta)}
(B_q)_{\tau,\sigma}
\sqrt{w_\sigma(\theta)}.$$ Thus, the boundary relation between a simplex
and its face is smoothly weighted by their activations.

::: remark
**Remark 1** (Soft weighted boundaries). *For hard simplex indicators,
the projected boundary operators recover the ordinary boundary maps of
the active subcomplex. For soft weights, however, the matrices
$$\widetilde{B}_q(\theta)
=
R_{q-1}(\theta)B_qR_q(\theta)$$ do not generally satisfy
$$\widetilde{B}_{q-1}(\theta)\widetilde{B}_q(\theta)=0.$$ Thus, in the
soft regime, these matrices should not be interpreted as boundary maps
of an exact chain complex. They are instead boundary-inspired weighted
operators used to define a smooth Hodge-Laplacian-type spectral
relaxation. The exact homological interpretation is recovered in the
hard limit.*
:::

We define the $q$-th penalty-regularized Hodge-Laplacian-type spectral
relaxation by $$\widehat{L}_q(\theta)
=
\widetilde{B}_q(\theta)^\top
\widetilde{B}_q(\theta)
+
\widetilde{B}_{q+1}(\theta)
\widetilde{B}_{q+1}(\theta)^\top
+
\mu
\left(
I-W_q(\theta)
\right).$$ The first term is the lower Laplacian-type term, the second
term is the upper Laplacian-type term, and the third term is the
inactive-direction penalty.

If $w_\sigma(\theta)\approx 1$, the penalty has almost no effect on the
corresponding direction. If $w_\sigma(\theta)\approx 0$, the direction
receives approximately energy $\mu$. In the hard limit
$w_\sigma(\theta)\to \chi_\sigma(\theta)$, we have
$$W_q(\theta)\to \Pi_q(\theta),
\qquad
R_q(\theta)\to \Pi_q(\theta),
\qquad
\widehat{L}_q(\theta)\to L_q^{\mathrm{hard}}(\theta).$$ Therefore,
$\widehat{L}_q(\theta)$ is a differentiable Hodge-spectral relaxation of
the hard Hodge Laplacian that recovers the Betti-number interpretation
in the hard limit. Away from the hard limit, its low-frequency spectrum
should be interpreted as a spectral surrogate for homological structure
rather than as an exact Betti-number representation.

::: proposition
**Proposition 2** (Convergence to the hard ambient operator). *Let
$w_\sigma^{(m)}\in[0,1]$ be a sequence of simplex weights converging to
hard activity indicators $\chi_\sigma\in\{0,1\}$ for all simplices of
$K_{\max}$. Let $\widehat{L}_q(w^{(m)})$ be the corresponding
penalty-regularized Hodge-Laplacian-type spectral relaxation. Then
$$\widehat{L}_q(w^{(m)})
\longrightarrow
L_q^{\mathrm{hard}}(K)$$ in operator norm, where
$$K=\{\sigma\in K_{\max}:\chi_\sigma=1\}.$$*
:::

::: proof
*Proof.* The ambient boundary matrices $B_q$ are fixed finite matrices.
The diagonal matrices $W_q(w^{(m)})$ converge entrywise to $\Pi_q$, and
the square-root matrices $R_q(w^{(m)})=W_q(w^{(m)})^{1/2}$ converge
entrywise to $\Pi_q$. Since all matrices are finite-dimensional,
entrywise convergence implies convergence in operator norm. Therefore,
$$R_{q-1}(w^{(m)})B_qR_q(w^{(m)})
\longrightarrow
\Pi_{q-1}B_q\Pi_q,$$ and the corresponding lower, upper, and penalty
terms converge to those of $L_q^{\mathrm{hard}}(K)$. ◻
:::

### Logit Parameterization for Graph Clique Complexes

In graph generation or graph-structured optimization, the optimization
variables are the edge logits $$\theta=a=\{a_e\}_{e\in E_{\max}}.$$ Then
$p_e(a)=\sigma(a_e)$ and $$w_\sigma(a)=\prod_{e\subset\sigma}p_e(a).$$
Thus, the Hodge-Laplacian-type spectral relaxation is obtained through
$$a
\longmapsto
p_e(a)
\longmapsto
w_\sigma(a)
\longmapsto
\widehat{L}_q(a).$$

For controlling one-dimensional cyclic structure, which is measured by
the first Betti number in the hard clique-complex limit, we use $q=1$
and define $$\widehat{L}_1(a)
=
\widetilde{B}_1(a)^\top
\widetilde{B}_1(a)
+
\widetilde{B}_2(a)
\widetilde{B}_2(a)^\top
+
\mu(I-W_1(a)).$$ This operator acts on the fixed ambient edge space
$C_1^{\mathrm{amb}}$. Hence, graph optimization or graph-structured
topology control can be performed in a fixed-dimensional Hilbert space,
even though the underlying hard clique complex changes combinatorially.

### Soft-Graph Representation of Vietoris--Rips Filtrations

We next represent Vietoris--Rips filtrations of point-cloud data within
the same soft-graph and Hodge-spectral framework. Let
$$X=\{x_1,\ldots,x_n\}\subset\mathbb{R}^d$$ be a point cloud. In the
ordinary Vietoris--Rips complex at scale $r>0$, an edge $(i,j)$ is
present when $\|x_i-x_j\|\le r$.

To relax this condition smoothly, define the stabilized distance with a
small numerical parameter $\delta>0$ $$d_{ij}(X)
=
\sqrt{
\|x_i-x_j\|^2+\delta
},$$ and define the Vietoris--Rips edge logit by $$a_{ij}^{(r)}(X)
=
\frac{r-d_{ij}(X)}{\varepsilon}.$$ Here, $\varepsilon>0$ controls the
softness of the threshold. The corresponding soft edge activation is
$$p_{ij}^{(r)}(X)
=
\sigma\left(a_{ij}^{(r)}(X)\right)
=
\frac{1}{1+\exp\left(-\frac{r-d_{ij}(X)}{\varepsilon}\right)}.$$ This
value is close to one when $d_{ij}(X)<r$, and close to zero when
$d_{ij}(X)>r$. In the hard-threshold limit $\varepsilon\to 0$,
$$p_{ij}^{(r)}(X)
\to
\mathbf{1}_{d_{ij}(X)\le r}.$$

The activation of a simplex $\sigma$ is defined by $$w_\sigma^{(r)}(X)
=
\prod_{e\subset\sigma}
p_e^{(r)}(X).$$ In the hard limit, $$w_\sigma^{(r)}(X)
\to
\mathbf{1}_{\sigma\in \mathrm{VR}_r(X)},$$ because the Vietoris--Rips
condition is equivalent to requiring all edges in $\sigma$ to have
length at most $r$, namely $\max_{e\subset\sigma}d_e(X)\le r$. Thus, the
soft clique construction recovers the ordinary Vietoris--Rips complex at
each fixed scale in the hard-threshold limit.

Thus, the Vietoris--Rips filtration can be represented as the soft
clique complex of a soft graph whose edge logits are $$a_{ij}^{(r)}(X)
=
\frac{r-d_{ij}(X)}{\varepsilon}.$$ For each scale $r$, we obtain the
sequence $$X
\longmapsto
a^{(r)}(X)
\longmapsto
p^{(r)}(X)
\longmapsto
w^{(r)}(X)
\longmapsto
\widehat{L}_q^{(r)}(X).$$

More explicitly, define $$W_q^{(r)}(X)
=
\operatorname{diag}
\left(
w_\sigma^{(r)}(X)
\right)_{\sigma\in K_{\max}^{(q)}},
\qquad
R_q^{(r)}(X)=\left(W_q^{(r)}(X)\right)^{1/2},$$ and
$$\widetilde{B}_q^{(r)}(X)
=
R_{q-1}^{(r)}(X)
B_q
R_q^{(r)}(X).$$ Then $$\widehat{L}_q^{(r)}(X)
=
\left(
\widetilde{B}_q^{(r)}(X)
\right)^\top
\widetilde{B}_q^{(r)}(X)
+
\widetilde{B}_{q+1}^{(r)}(X)
\left(
\widetilde{B}_{q+1}^{(r)}(X)
\right)^\top
+
\mu
\left(
I-W_q^{(r)}(X)
\right).$$ This is the Vietoris--Rips instance of the
Hodge-Laplacian-type spectral relaxation defined above. For controlling
one-dimensional homology, we use $q=1$.

### Multi-Scale Vietoris--Rips Construction

Persistent homology describes the birth and death of homology classes
across scales. Therefore, instead of using a single scale, we consider a
sequence $$r_1<r_2<\cdots<r_M.$$ For each scale $r_m$, define
$$p_{ij}^{(r_m)}(X)
=
\sigma\left(
\frac{r_m-d_{ij}(X)}{\varepsilon}
\right).$$ This yields a Hodge-Laplacian-type spectral relaxation
$$\widehat{L}_q^{(r_m)}(X)$$ at each scale. The family $$\left\{
\widehat{L}_q^{(r_m)}(X)
\right\}_{m=1}^M$$ can be regarded as a Hodge-spectral smooth relaxation
of the Vietoris--Rips filtration. In the next section, we apply low-pass
spectral filters to these operators and define differentiable
topological objectives for controlling Betti-type and
persistent-homological structures.

## Topological Objectives via Low-Pass Hodge Spectral Filters

In this section, we define differentiable topological objectives using
the penalty-regularized Hodge-Laplacian-type spectral relaxation
$\widehat{L}_q(\theta)$ constructed in the previous section.

The basic idea is to regard homology as the zero modes of the Hodge
Laplacian and to extract zero and near-zero modes using smooth low-pass
spectral filters. For an ordinary simplicial complex $K$, the $q$-th
Betti number satisfies $$\beta_q(K)=\dim\ker L_q(K).$$ However, directly
counting zero eigenvalues, namely the map $L_q\mapsto \dim\ker L_q$, is
discontinuous and is not suitable for gradient-based optimization.
Therefore, we use a smooth function $f:\mathbb{R}_{\ge0}\to\mathbb{R}$
that emphasizes the low-eigenvalue region and use
$$f(\widehat{L}_q(\theta))
\quad\text{or}\quad
\operatorname{Tr}f(\widehat{L}_q(\theta))$$ as differentiable spectral
surrogates for topological information. In the hard ordinary-complex
case, these quantities approximate information about the kernel of the
Hodge Laplacian. In the soft regime, they should be interpreted as
low-frequency spectral quantities associated with the
Hodge-Laplacian-type relaxation, rather than as exact Betti numbers.

We first introduce low-pass spectral filters and define two types of
losses: spectral-filter matching losses and trace-type spectral-mass
Betti surrogate losses. We then formulate normalized first-Betti-type
control for graph clique complexes and topology control for
Vietoris--Rips filtrations of point clouds within the same framework.
All losses introduced in this section are differentiable with respect to
$\widehat{L}_q(\theta)$. Since $\widehat{L}_q(\theta)$ is constructed
from soft-graph edge logits, gradients can be propagated analytically to
the edge logits. In the Vietoris--Rips setting, the edge logits are
functions of point coordinates through pairwise distances, and hence
gradients can also be propagated to the point-cloud coordinates. In this
section, we focus on the definitions and roles of the objectives; the
detailed backward computation and gradient formulas are given in the
Appendix.

### Low-Pass Spectral Filters

Let $$L(\theta)=\widehat{L}_q(\theta)$$ be the Hodge-Laplacian-type
spectral relaxation, and let $$L(\theta)=U\Lambda U^\top,
\qquad
\Lambda=\operatorname{diag}(\lambda_1,\ldots,\lambda_N)$$ be its
eigendecomposition. In the hard ordinary-complex case, homological modes
correspond to zero eigenvalues. In addition, near-zero modes with small
positive eigenvalues may reflect geometrically meaningful structures
such as almost-closed cycles, weakly filled holes, or unstable
higher-order structures. Thus, it is useful to treat not only exact zero
modes but also the low-eigenvalue region smoothly.

We call a smooth function $f:\mathbb{R}_{\ge0}\to\mathbb{R}$ a low-pass
spectral filter if it emphasizes low eigenvalues and suppresses high
eigenvalues. The corresponding matrix function is defined by
$$f(L)=Uf(\Lambda)U^\top,
\qquad
f(\Lambda)=\operatorname{diag}(f(\lambda_1),\ldots,f(\lambda_N)).$$ In
this work, we use the following representative filters.

The heat filter is defined by
$$f_{\mathrm{heat}}(\lambda)=\exp\left(-\frac{\lambda}{\tau}\right),
\qquad
F_{\mathrm{heat}}(L)=\exp\left(-\frac{L}{\tau}\right),$$ where $\tau>0$
is a temperature parameter. It preserves zero modes and exponentially
suppresses high-eigenvalue modes.

The resolvent filter is defined by
$$f_{\mathrm{res}}(\lambda)=\frac{\alpha}{\lambda+\alpha},
\qquad
F_{\mathrm{res}}(L)=\alpha(L+\alpha I)^{-1},$$ where $\alpha>0$. It also
emphasizes low-eigenvalue modes, but its decay is rational rather than
exponential.

The polynomial moment filter is defined by
$$f_{\mathrm{mom}}(\lambda)=(1-\alpha\lambda)^d,
\qquad
F_{\mathrm{mom}}(L)=(I-\alpha L)^d,$$ where $\alpha>0$ and
$d\in\mathbb{N}$. A zero mode contributes one, while high-eigenvalue
modes are suppressed under suitable choices of $\alpha$ and $d$. More
precisely, this polynomial behaves as a low-pass filter only when the
positive spectrum is mapped inside the unit disk; this condition is made
explicit below. Since this filter is expressed as a polynomial of the
Laplacian, it does not require eigendecomposition and is compatible with
matrix-vector products, stochastic trace estimation, and structural
connections to possible quantum or quantum--classical hybrid
computation.

As a more stable polynomial approximation, one may also use a Chebyshev
polynomial filter. After normalizing the Laplacian by an upper bound or
estimate of its largest eigenvalue, for example
$$\widetilde{L}=\frac{2L-\lambda_{\max}I}{\lambda_{\max}},$$ so that its
spectrum is approximately contained in $[-1,1]$, define
$$f_{\mathrm{cheb}}(L)=\sum_{\ell=0}^{D}c_\ell T_\ell(\widetilde{L}),$$
where $T_\ell$ is the $\ell$-th Chebyshev polynomial, $c_\ell$ are
coefficients approximating a desired low-pass function, and $D$ is the
polynomial degree. This filter can be computed recursively without
eigendecomposition and is useful for approximating low-frequency
spectral quantities in large-scale problems.

### Spectral-Filter Matching Loss

One way to use a low-pass filter is to compare low-energy subspaces
themselves. Let $\theta_{\mathrm{tar}}$ be a target parameter and define
$$L_{\mathrm{tar}}=\widehat{L}_q(\theta_{\mathrm{tar}}).$$ For a
low-pass filter $f$, we define the spectral-filter matching loss by
$$\mathcal{L}_{\mathrm{sf}}(\theta)
=
\frac{1}{2}
\left\|
f(\widehat{L}_q(\theta))-f(L_{\mathrm{tar}})
\right\|_F^2.$$ This loss compares not only the number of zero modes but
also the orientation and distribution of the low-eigenvalue subspace.
Therefore, compared with barcode-based losses, it can use richer
geometric and spectral information.

For the heat and resolvent filters, this gives
$$\mathcal{L}_{\mathrm{heat}}(\theta)
=
\frac{1}{2}
\left\|
\exp\left(-\frac{\widehat{L}_q(\theta)}{\tau}\right)
-
\exp\left(-\frac{L_{\mathrm{tar}}}{\tau}\right)
\right\|_F^2$$ and $$\mathcal{L}_{\mathrm{res}}(\theta)
=
\frac{1}{2}
\left\|
\alpha(\widehat{L}_q(\theta)+\alpha I)^{-1}
-
\alpha(L_{\mathrm{tar}}+\alpha I)^{-1}
\right\|_F^2.$$ These losses act to move the current structure toward
the low-energy subspace of the target structure. Although the heat and
resolvent filters approximate the spectral projector onto the kernel in
suitable parameter limits, they are not idempotent projectors for finite
parameter values. For this reason, we refer to these objectives as
spectral-filter matching losses rather than projector losses.

### Trace-Type Spectral-Mass Betti Surrogate Loss

Another way to use a low-pass filter is to construct a smooth
low-frequency spectral-mass surrogate for Betti-type information from
its trace. For a low-pass filter $f$, define
$$S_f(\theta)=\operatorname{Tr}f(\widehat{L}_q(\theta))
=
\sum_{i=1}^{N}f(\lambda_i(\theta)).$$ If $f(0)=1$ and
$f(\lambda)\approx0$ for high eigenvalues, then $S_f(\theta)$
approximates the number of zero and low-eigenvalue modes and can be
regarded as a smooth surrogate for $\beta_q$ in the hard
ordinary-complex setting, and as a low-frequency spectral mass in the
soft setting.

::: proposition
**Proposition 3** (Trace approximation of Betti numbers). *Let $K$ be a
finite simplicial complex and let the eigenvalues of the ordinary Hodge
Laplacian $L_q(K)$ be $$0=\lambda_1=\cdots=\lambda_{\beta_q}
<
\lambda_{\beta_q+1}
\le \cdots \le
\lambda_N.$$ Let $f:\mathbb{R}_{\ge0}\to\mathbb{R}$ satisfy $f(0)=1$,
and define $$\varepsilon_f
=
\max_{i>\beta_q}|f(\lambda_i)|.$$ Then $$\left|
\operatorname{Tr}f(L_q(K))-\beta_q(K)
\right|
\le
(N-\beta_q)\varepsilon_f.$$*
:::

::: proof
*Proof.* Since $f(L_q(K))$ has eigenvalues $f(\lambda_i)$, we have
$$\operatorname{Tr}f(L_q(K))
=
\sum_{i=1}^{N}f(\lambda_i)
=
\beta_q(K)
+
\sum_{i=\beta_q+1}^{N}f(\lambda_i).$$ Taking absolute values gives the
stated bound. ◻
:::

Given a target spectral-mass value $\tau_q$, define
$$\mathcal{L}_{\mathrm{trace}}(\theta)
=
\frac{1}{2}
\left(
S_f(\theta)-\tau_q
\right)^2.$$ In particular, for the polynomial moment filter, set
$$S_{q,d}(\theta)
=
\operatorname{Tr}
\left(
I-\alpha\widehat{L}_q(\theta)
\right)^d$$ and define $$\mathcal{L}_{\mathrm{mom}}(\theta)
=
\frac{1}{2}
\left(
S_{q,d}(\theta)-\tau_q
\right)^2.$$ For an ordinary hard complex, if $$\rho
=
\max_{\lambda_i>0}|1-\alpha\lambda_i|<1,$$ then $$\left|
\operatorname{Tr}(I-\alpha L_q(K))^d-\beta_q(K)
\right|
\le
(N-\beta_q)\rho^d.$$ Thus, the parameters $\alpha$ and $d$ should be
chosen together with an appropriate spectral scaling of the Laplacian.
This loss moves the low-frequency spectral mass toward the target value
without explicitly counting Betti numbers.

### Normalized Spectral-Moment Betti Surrogate

When graph sizes or ambient chain-space dimensions differ, directly
comparing trace values introduces scale dependence due to the number of
simplices. Therefore, let $$N_q=\dim C_q^{\mathrm{amb}}$$ and define the
normalized moment $$\overline{S}_{q,d}(\theta)
=
\frac{1}{N_q}
\operatorname{Tr}
\left(
I-\alpha\widehat{L}_q(\theta)
\right)^d.$$ In the hard ordinary-complex setting, this normalization
corresponds to comparing a Betti-type quantity per $q$-simplex. In the
soft ambient setting, it should be interpreted as normalized
low-frequency spectral mass. Given a target normalized value
$\bar{\tau}_q$, define $$\mathcal{L}_{\mathrm{norm}}(\theta)
=
\frac{1}{2}
\left(
\overline{S}_{q,d}(\theta)-\bar{\tau}_q
\right)^2.$$ This normalization yields topological losses that are more
comparable across graphs or ambient complexes of different sizes.

### Normalized First-Betti-Type Control in Graph Clique Complexes

In graph generation or graph-structured topology control, the
optimization variables are the edge logits
$$a=\{a_e\}_{e\in E_{\max}}.$$ The edge activations $p_e(a)=\sigma(a_e)$
define a soft clique complex and hence a Hodge-Laplacian-type spectral
relaxation $\widehat{L}_q(a)$. To control one-dimensional cyclic
structures in the hard clique-complex limit, we take $q=1$ and use
$$\widehat{L}_1(a)
=
\widetilde{B}_1(a)^\top
\widetilde{B}_1(a)
+
\widetilde{B}_2(a)
\widetilde{B}_2(a)^\top
+
\mu(I-W_1(a)).$$

Define the Laplacian moment and its normalized version by $$S_{1,d}(a)
=
\operatorname{Tr}
\left(
I-\alpha\widehat{L}_1(a)
\right)^d,
\qquad
\overline{S}_{1,d}(a)
=
\frac{1}{N_1}
\operatorname{Tr}
\left(
I-\alpha\widehat{L}_1(a)
\right)^d,$$ where $N_1=\dim C_1^{\mathrm{amb}}$. The quantity
$\overline{S}_{1,d}(a)$ can be regarded as a normalized $\beta_1$-type
surrogate in the hard-limit sense, and as a normalized low-frequency
$H_1$-type spectral mass in the soft setting. Given a target normalized
spectral-mass value $\bar{\tau}_1$, define the graph topological loss by
$$\mathcal{L}_{\mathrm{graph}}^{\mathrm{topo}}(a)
=
\frac{1}{2}
\left(
\overline{S}_{1,d}(a)-\bar{\tau}_1
\right)^2.$$

In practical graph-generation tasks, one may combine this topological
loss with ordinary graph objectives such as edge density, degree
distribution, clustering coefficient, or task-dependent losses. If such
a base loss is denoted by $\mathcal{L}_{\mathrm{base}}(a)$, the total
loss is $$\mathcal{L}_{\mathrm{total}}(a)
=
\mathcal{L}_{\mathrm{base}}(a)
+
\lambda_{\mathrm{topo}}
\mathcal{L}_{\mathrm{graph}}^{\mathrm{topo}}(a),$$ where
$\lambda_{\mathrm{topo}}>0$ controls the strength of topological
regularization. This formulation allows one to optimize ordinary
graph-structural objectives while controlling cyclic structures
corresponding to $\beta_1$ of the clique complex. The ambient
normalization above is the abstract formulation used in this section. In
the numerical graph experiments below, we use an ordinary-complex or
weighted-current-complex implementation and normalize by an effective
edge count; the relation between these choices is discussed in
Section [6](#sec:graph_experiments){reference-type="ref"
reference="sec:graph_experiments"}.

### Topology Control for Vietoris--Rips Filtrations

Let $$X=\{x_1,\ldots,x_n\}\subset\mathbb{R}^d$$ be a point cloud, and
let $$r_1<r_2<\cdots<r_M$$ be a sequence of scales. For each scale
$r_m$, define the edge logits by $$a_{ij}^{(r_m)}(X)
=
\frac{r_m-d_{ij}(X)}{\varepsilon},
\qquad
d_{ij}(X)=\sqrt{\|x_i-x_j\|^2+\delta}.$$ These logits define a soft
graph, a soft clique complex, and a Hodge-Laplacian-type spectral
relaxation $$\widehat{L}_q^{(r_m)}(X)$$ at each scale. Since persistent
homology describes the birth and death of homology classes across
scales, the corresponding Laplacian-based losses are defined as sums
over scales.

#### Trace-Type Vietoris--Rips Loss

Barcode-based losses often reduce undesired homology by penalizing
persistence, for example $$\mathcal{L}_{\mathrm{PD}}(X)
=
\sum_{\gamma\in U}
(d_\gamma-b_\gamma)^2.$$ In the Laplacian-based formulation, we instead
use the low-frequency spectral mass at each scale, $$S_q^{(r_m)}(X)
=
\operatorname{Tr}
f
\left(
\widehat{L}_q^{(r_m)}(X)
\right).$$ To suppress $q$-dimensional homology, one can minimize
$$\mathcal{L}_{\mathrm{VR}}^{\mathrm{sup}}(X)
=
\sum_{m=1}^{M}
\omega_m
\operatorname{Tr}
f
\left(
\widehat{L}_q^{(r_m)}(X)
\right),$$ where $\omega_m\ge0$ are scale weights.

Conversely, to preserve or generate a prescribed topological structure,
one can specify target low-frequency spectral masses $\tau_q^{(r_m)}$
and define $$\mathcal{L}_{\mathrm{VR}}^{\mathrm{trace}}(X)
=
\frac{1}{2}
\sum_{m=1}^{M}
\omega_m
\left(
\operatorname{Tr}
f
\left(
\widehat{L}_q^{(r_m)}(X)
\right)
-
\tau_q^{(r_m)}
\right)^2.$$ This loss can be interpreted as a smooth Laplacian-based
approximation of the low-frequency $H_q$-type spectral mass present at
each scale. In the hard limit and with sufficiently sharp filters, this
quantity is related to the Betti profile across scales, but it is not
itself a persistence-diagram loss.

#### Spectral-Filter Matching Vietoris--Rips Loss

When a target point cloud $X_{\mathrm{tar}}$ is given, we can match
low-energy subspaces at each scale. Define
$$L_m(X)=\widehat{L}_q^{(r_m)}(X),
\qquad
L_m^{\mathrm{tar}}=\widehat{L}_q^{(r_m)}(X_{\mathrm{tar}}).$$ Then
$$\mathcal{L}_{\mathrm{VR}}^{\mathrm{sf}}(X)
=
\frac{1}{2}
\sum_{m=1}^{M}
\omega_m
\left\|
f(L_m(X))-f(L_m^{\mathrm{tar}})
\right\|_F^2.$$

For the heat and resolvent filters, this gives
$$\mathcal{L}_{\mathrm{VR}}^{\mathrm{heat}}(X)
=
\frac{1}{2}
\sum_{m=1}^{M}
\omega_m
\left\|
\exp\left(
-\frac{\widehat{L}_q^{(r_m)}(X)}{\tau}
\right)
-
\exp\left(
-\frac{\widehat{L}_q^{(r_m)}(X_{\mathrm{tar}})}{\tau}
\right)
\right\|_F^2$$ and $$\mathcal{L}_{\mathrm{VR}}^{\mathrm{res}}(X)
=
\frac{1}{2}
\sum_{m=1}^{M}
\omega_m
\left\|
\alpha
\left(
\widehat{L}_q^{(r_m)}(X)+\alpha I
\right)^{-1}
-
\alpha
\left(
\widehat{L}_q^{(r_m)}(X_{\mathrm{tar}})+\alpha I
\right)^{-1}
\right\|_F^2.$$ Unlike barcode-based losses, which compare birth--death
pairs, this loss compares low-energy subspaces at each scale. Therefore,
it is designed to reduce gradient localization on critical simplices and
to provide update directions that retain more geometric and spectral
information. Since the Vietoris--Rips edge logits are functions of the
point-cloud coordinates, these losses are differentiable with respect to
the point coordinates.

### Practical Choice of Objectives

The objectives above are intended for different uses. Spectral-filter
matching losses are appropriate when a target point cloud, graph, or
simplicial complex is available and one wants to align low-frequency
Hodge spectral structure with that target. Trace-type spectral-mass
losses are appropriate when the goal is to control the amount of
$q$-dimensional topological structure without specifying a target
low-eigenvalue subspace. Normalized moment losses are useful when
comparing complexes with different numbers of simplices or when
controlling graph clique complexes.

  ---------------------------------------------------------------------
  Goal                Suggested objective      Interpretation
  ------------------- ------------------------ ------------------------
  Match a target      Spectral-filter matching Aligns low-frequency
  point cloud or      loss                     Hodge spectral structure
  target complex                               with that of a target
                                               object.

  Control the amount  Trace-type spectral-mass Moves the low-frequency
  of $q$-dimensional  loss                     spectral mass toward a
  topology                                     prescribed value.

  Control a           Scale-wise               Controls low-frequency
  Betti-type profile  Vietoris--Rips spectral  $H_q$-type structure
  across scales       loss                     over selected scales.

  Control cyclic      Normalized polynomial    Controls a normalized
  structure in graph  moment loss              $\beta_1$-type spectral
  clique complexes                             quantity.

  Scale to larger     Polynomial, Chebyshev,   Avoids full
  complexes           or                       eigendecomposition and
                      trace-estimation-based   uses matrix-vector or
                      filters                  trace-estimation
                                               routines.
  ---------------------------------------------------------------------

  : Practical interpretation of the proposed Hodge-spectral objectives.
  {#tab:objective_usage}

This table also clarifies the numerical experiments below. The
Vietoris--Rips experiments examine whether spectral-filter losses
provide useful gradients for point-cloud topology control, while the
graph experiments examine whether normalized polynomial moments can
control first-Betti-type quantities of clique complexes.

## Numerical Experiments on Vietoris--Rips Topology Control

In this section, we compare topology control based on persistent
homology with the proposed Hodge spectral-filter losses on
Vietoris--Rips filtrations. The purpose of these experiments is to
examine whether the proposed Hodge-spectral losses can control
$H_1$-type structures without explicitly optimizing barcode diagrams,
and whether they alleviate some of the characteristic difficulties of
persistence-diagram losses, such as gradient localization and
sensitivity to persistence-pairing changes. These experiments are
intended to study the behavior of the optimization signals rather than
to replace persistent homology as a topological descriptor.

### Experimental Setup

Let $$X=\{x_1,\ldots,x_n\}\subset \mathbb{R}^2$$ be a point cloud. For
each scale $r$, we consider the Vietoris--Rips complex
$$\mathrm{VR}_r(X).$$ In the persistent-homology baseline, the loss is
defined directly from the $H_1$ barcode. For example, to suppress or
control one-dimensional homological features, we use losses based on the
persistence values $$d_\gamma-b_\gamma$$ of $H_1$ bars.

For the proposed Hodge-based losses, we construct a Hodge-Laplacian-type
spectral relaxation $$\widehat{L}_1^{(r)}(X)$$ for each scale $r$, and
then apply a low-pass spectral filter. We mainly use the heat filter
$$F_{\tau}^{\mathrm{heat},(r)}(X)
=
\exp\left(
-\frac{\widehat{L}_1^{(r)}(X)}{\tau}
\right)$$ and the resolvent filter $$F_{\epsilon}^{\mathrm{res},(r)}(X)
=
\epsilon
\left(
\widehat{L}_1^{(r)}(X)+\epsilon I
\right)^{-1}.$$ For multi-scale objectives, we sum these quantities over
a finite set of scales $$I=\{r_1,\ldots,r_m\}.$$ The Hodge
spectral-filter losses are combined with mild geometric regularization
terms to avoid degenerate point configurations such as excessive
collapse or excessive spreading. These regularization terms are used
only to keep the point-cloud geometry numerically well behaved; the
topological signal itself is provided by the Hodge spectral filters.

### Multi-Scale Topology Control from Random Point Clouds

We first test whether the Hodge spectral-filter losses can induce
low-frequency $H_1$-type structures across multiple Vietoris--Rips
scales. We initialize $n=36$ points in the square $[-1,1]^2$, and use
the scale interval $$I=\{0.42,0.46,0.50,0.54,0.58,0.62\}.$$ We compare a
persistent-homology baseline, the Hodge heat objective, and the Hodge
resolvent objective.

Figure [1](#fig:vr_exp1){reference-type="ref" reference="fig:vr_exp1"}
shows the initial point cloud and the optimized point clouds after 10
epochs. The Hodge objectives, especially the resolvent objective,
produce point clouds with more pronounced loop-like structures than the
PH baseline in this example.

<figure id="fig:vr_exp1" data-latex-placement="t">
<img src="VR_exp1_data.png" />
<figcaption>Multi-scale topology control from a random point cloud. The
exact Betti-profile sum is used only as a diagnostic of the optimized
point clouds.</figcaption>
</figure>

We evaluate the exact Betti number over the scale interval by
$$\sum_{r\in I}\beta_1(\mathrm{VR}_r(X)).$$ This quantity is used as an
exact Betti-profile diagnostic of the optimized point cloud; it is not
the differentiable objective optimized by the Hodge spectral-filter
losses. The initial point cloud has value $1$, the PH baseline reaches
$2$, the Hodge heat objective reaches $10$, and the Hodge resolvent
objective reaches $28$. Thus, the Hodge spectral-filter losses increase
low-frequency $H_1$-type spectral structure across the selected scale
range without directly optimizing persistence diagrams. This result
should be interpreted as a scale-wise Hodge-spectral effect rather than
as direct optimization of a persistence diagram.

### Gradient Localization

Next, we compare the localization of gradients for PH losses and Hodge
spectral-filter losses. The PH loss is based on the squared sum of
finite $H_1$ persistence values, while the Hodge losses are based on
heat and resolvent trace sums over the selected scales.

Figure [2](#fig:vr_exp2_direction){reference-type="ref"
reference="fig:vr_exp2_direction"} visualizes the gradient directions
for an input point cloud. The PH squared-sum gradient is concentrated on
a small number of points, whereas the Hodge heat and Hodge resolvent
gradients are distributed more globally around the point cloud for this
input.

<figure id="fig:vr_exp2_direction" data-latex-placement="t">
<img src="VR_exp2_data.png" />
<p>losses. <span id="fig:vr_exp2_direction"
data-label="fig:vr_exp2_direction"></span></p>
<figcaption>Gradient directions for PH and Hodge
spectral-filter</figcaption>
</figure>

To quantify this behavior, we compute the entropy of the gradient norm
distribution and the mass carried by the top $10\%$ of points with
largest gradient norms. The results are shown in
Figure [3](#fig:vr_exp2_entropy){reference-type="ref"
reference="fig:vr_exp2_entropy"}. The PH squared-sum loss has gradient
entropy $1.3863$ and top-$10\%$ mass $0.5000$. The Hodge heat trace-sum
loss has entropy $2.4623$ and top-$10\%$ mass $0.2049$. The Hodge
resolvent trace-sum loss has entropy $2.4740$ and top-$10\%$ mass
$0.2018$.

<figure id="fig:vr_exp2_entropy" data-latex-placement="t">
<img src="VR_exp2_entro.png" style="width:70.0%" />
<figcaption>Gradient localization metrics. Higher entropy and lower
top-<span class="math inline">\(10\%\)</span> mass indicate a more
spatially distributed gradient norm profile.</figcaption>
</figure>

These results are consistent with the interpretation that PH losses tend
to concentrate gradients around critical simplices, while Hodge
spectral-filter losses provide more spatially distributed update
directions. The comparison concerns the spatial distribution of gradient
norms in these experiments, not a general dominance statement for all
PH-based objectives.

### Pairing Instability Stress Test

We next examine sensitivity to persistence-pairing changes. We construct
a point cloud with two similar loop-like structures and vary a parameter
$\alpha$, which changes the relative sizes of the two loops.
Representative point clouds for $\alpha=-0.14$, $\alpha=0$, and
$\alpha=0.14$ are shown in
Figure [4](#fig:vr_exp3_data){reference-type="ref"
reference="fig:vr_exp3_data"}.

<figure id="fig:vr_exp3_data" data-latex-placement="t">
<img src="VR_exp3_data.png" />
<figcaption>Point clouds used for the pairing-instability
test.</figcaption>
</figure>

For the PH baseline, we use a loss based on the largest $H_1$
persistence value. Around $\alpha=0$, the two dominant $H_1$ bars can
exchange their order, causing a sharp change in which bar is selected by
the loss. For the Hodge method, we use an interval Hodge spectral-filter
loss over the scale interval $[0.98,1.12]$.

Figure [5](#fig:vr_exp3_loss){reference-type="ref"
reference="fig:vr_exp3_loss"} shows the normalized losses and their
derivatives with respect to $\alpha$. The PH loss has a sharp derivative
jump near the pairing switch, whereas the interval Hodge spectral-filter
loss changes more smoothly after normalization by the loss range.

<figure id="fig:vr_exp3_loss" data-latex-placement="t">
<img src="VR_exp3_loss.png" />
<figcaption>Loss and derivative under pairing stress. The comparison of
derivative jumps is interpreted in a scale-normalized
sense.</figcaption>
</figure>

Quantitatively, the maximum raw derivative jump is $1.1773$ for the PH
loss and $15.8489$ for the interval Hodge spectral-filter loss. Thus,
the Hodge loss is not uniformly smoother in raw scale. However, the
absolute magnitudes and dynamic ranges of the two losses are different.
After normalization by the loss range, the maximum derivative jump is
$11.2194$ for the PH loss and $1.6137$ for the Hodge loss. Therefore, in
this experiment, the Hodge interval loss exhibits a substantially
smaller derivative jump relative to its own scale. This supports the
interpretation that the Hodge-spectral objective provides a smoother
optimization signal in a scale-normalized sense.

### Shape Synthesis by Analytic Gradients

We next test whether the analytic gradients of the losses can guide
point-cloud shape synthesis. We parameterize a radial point cloud by
$$x_i(r_i)
=
(r_i\cos\theta_i,r_i\sin\theta_i),$$ where the angles $\theta_i$ are
fixed and the radii $r_i$ are optimized. The target shape is a wavy
ring. We compare PH gradient updates, Hodge heat filter gradient
updates, and Hodge resolvent filter gradient updates.

Figure [6](#fig:vr_exp4_profile){reference-type="ref"
reference="fig:vr_exp4_profile"} shows the recovered radial profiles and
the mean RMSE with respect to the target radial profile. The PH gradient
update gives final RMSE $$0.1504\pm 0.0172,$$ whereas the Hodge heat
projector gives $$0.0324\pm 0.0092,$$ and the Hodge resolvent projector
gives $$0.0224\pm 0.0054.$$ Thus, the Hodge spectral-filter gradients
recover the target shape more accurately in this controlled radial-shape
experiment.

<figure id="fig:vr_exp4_profile" data-latex-placement="t">
<img src="VR_exp4_accu.png" />
<p>. <span id="fig:vr_exp4_profile"
data-label="fig:vr_exp4_profile"></span></p>
<figcaption>Recovered radial profiles and RMSE in the controlled
radial-shape synthesis experiment</figcaption>
</figure>

Figure [7](#fig:vr_exp4_data){reference-type="ref"
reference="fig:vr_exp4_data"} visualizes the initial circle, target wavy
shape, and the results obtained by the three update rules. The Hodge
heat and resolvent filter updates follow the target deformation more
closely than the PH update.

<figure id="fig:vr_exp4_data" data-latex-placement="t">
<img src="VR_exp4_data.png" />
<figcaption>Shape synthesis by analytic gradients.</figcaption>
</figure>

We also compute the cosine similarity between the first update direction
and the desired target deformation direction. The PH gradient has mean
cosine similarity $-0.2156$, the Hodge heat filter has $0.2143$, and the
Hodge resolvent filter has $0.8311$. This indicates that the resolvent
filter provides an initial update direction strongly aligned with the
desired geometric deformation in this experiment.

The first-gradient entropy is $1.2627$ for PH, $2.5367$ for Hodge heat,
and $2.5274$ for Hodge resolvent. Again, the Hodge spectral-filter
gradients are less localized and more globally distributed according to
this entropy metric.

### Runtime Comparison

Finally, we compare the cost of one loss-gradient evaluation. We vary
the number of points as
$$n=12,16,20,24,28,32,36,40,48,56,64,70,80,90,100.$$ For each $n$, we
measure the runtime of one gradient step for PH, Hodge heat, and Hodge
resolvent losses. The results are shown in
Figure [8](#fig:vr_exp5_runtime){reference-type="ref"
reference="fig:vr_exp5_runtime"}.

<figure id="fig:vr_exp5_runtime" data-latex-placement="t">
<img src="VR_exp5_scale.png" />
<figcaption>Complex size and one-step gradient runtime. The Hodge
spectral-filter losses are evaluated using dense matrix operations in
this implementation.</figcaption>
</figure>

At $n=100$, the PH gradient evaluation takes $$3.4515\ \mathrm{s},$$ the
Hodge heat gradient evaluation takes $$60.4083\ \mathrm{s},$$ and the
Hodge resolvent gradient evaluation takes $$43.5290\ \mathrm{s}.$$ Thus,
at this scale, Hodge heat is about $17.5$ times slower than PH, and
Hodge resolvent is about $12.6$ times slower.

This increased cost is expected because the Hodge spectral-filter losses
use richer spectral information. In the current implementation, dense
matrix operations are used, and the number of ambient edges and
triangles grows rapidly with $n$. Therefore, applying the Hodge
spectral-filter losses to larger problems will require more scalable
implementations, such as sparse linear algebra, Chebyshev polynomial
approximation, and stochastic trace estimation. Possible quantum or
quantum--classical trace-estimation approaches are a separate future
direction and are not used in the present experiments.

## Normalized First-Betti-Type Control on Graph Clique Complexes via Laplacian Moments

In this section, we apply the Laplacian-moment topological loss
introduced in Section 4 to normalized first-Betti-type control in graph
clique complexes. In particular, we focus on the first homology of the
clique complex of a graph and control a quantity corresponding to the
normalized Betti number $$\frac{\beta_1}{|K_1|},$$ where $K_1$ denotes
the set of $1$-simplices, namely the set of edges, in the clique
complex. In the soft optimization problem below, this hard normalized
Betti number is used as an evaluation quantity, while the differentiable
loss is applied to a calibrated soft spectral moment.

In the theoretical formulation developed in the previous sections, we
constructed a Hodge-Laplacian-type spectral relaxation on a fixed
ambient chain space and introduced a penalty term to remove inactive
directions. However, in the numerical experiments in this section, we do
not use the full ambient penalty-regularized operator. Instead, we use a
weighted-current-complex implementation: the edge and triangle spaces
are represented by the current soft graph weights, weighted boundary
matrices are assembled from these weights, and the moment is computed
without adding an inactive ambient block. For sampled hard graphs, this
construction reduces to the ordinary Hodge Laplacian on the sampled
clique complex. In this case, the chain space itself corresponds to the
current weighted or sampled clique complex, and inactive simplex
directions do not exist as a separate ambient block. Therefore, no
penalty term is required to push inactive directions away from the
low-energy region.

We first explain why the Laplacian moment based on the ordinary Hodge
Laplacian can be theoretically justified as a surrogate for the
normalized Betti number in the hard-complex setting. We then discuss the
relation between the ordinary-complex computation, the ambient
formulation, and polynomial trace estimation. Finally, we present the
results of our numerical experiments.

### Normalized Betti Surrogate Based on the Ordinary Hodge Laplacian for Hard Clique Complexes

Let $G=(V,E)$ be a graph, and let its clique complex be $K=X(G)$. Let
$C_q(K)$ be the $q$-th chain space, and let $B_q:C_q(K)\to C_{q-1}(K)$
be the boundary operator. The ordinary $q$-th Hodge Laplacian is defined
by $$L_q(K)
=
B_q^\top B_q
+
B_{q+1}B_{q+1}^\top.$$

By the Hodge decomposition, $$\ker L_q(K)
\simeq
H_q(K).$$ Therefore, $\dim\ker L_q(K)
=
\dim H_q(K)
=
\beta_q(K)$. In particular, for $q=1$, $\dim\ker L_1(K)
=
\beta_1(K)$.

The important point is that $L_q(K)$ is defined not on an ambient space
but on the actual chain space $C_q(K)$ of the clique complex $K$. Hence,
the inactive simplex directions that appear in the ambient formulation
do not exist in this space. Therefore, when using the ordinary Hodge
Laplacian, zero modes directly correspond to homology classes, and the
penalty term $$\mu(I-W_q)$$ for removing inactive directions is
unnecessary.

This subsection serves as the hard-complex reference. In the soft
optimization experiments below, the differentiable objective is
evaluated using weighted boundary matrices. The final topological
evaluation is then performed by sampling hard graphs from the optimized
edge probabilities and computing the ordinary Betti number of the
sampled clique complexes.

### Laplacian Moments and Normalized Betti Numbers

To treat normalized Betti numbers as differentiable objectives in the
hard ordinary-complex setting, we use the polynomial moment filter
$$f_d(\lambda)
=
(1-\alpha\lambda)^d,$$ where $\alpha>0$ and $d\in\mathbb{N}$.

For the ordinary Hodge Laplacian $L_q(K)$, define the Laplacian moment
by $$S_{q,d}(K)
=
\operatorname{Tr}
\left(
I-\alpha L_q(K)
\right)^d.$$ We then normalize this quantity by the number of
$q$-simplices, $$N_q
=
\dim C_q(K)
=
|K_q|,$$ and define $$\overline{S}_{q,d}(K)
=
\frac{
\operatorname{Tr}
\left(
I-\alpha L_q(K)
\right)^d
}{
N_q
}.$$

Let the eigenvalues of $L_q(K)$ be
$$0=\lambda_1=\cdots=\lambda_{\beta_q}
<
\lambda_{\beta_q+1}
\le
\cdots
\le
\lambda_{N_q}.$$ Then $$S_{q,d}(K)
=
\sum_{i=1}^{N_q}
(1-\alpha\lambda_i)^d.$$ The contribution from each zero eigenvalue is
equal to one. Therefore, $$S_{q,d}(K)
=
\beta_q(K)
+
\sum_{i=\beta_q+1}^{N_q}
(1-\alpha\lambda_i)^d.$$

If $\alpha$ is chosen so that $$\rho
=
\max_{\lambda_i>0}
|1-\alpha\lambda_i|
<
1,$$ then $$\left|
S_{q,d}(K)-\beta_q(K)
\right|
\le
(N_q-\beta_q)\rho^d.$$ Therefore, for the normalized quantity, $$\left|
\overline{S}_{q,d}(K)
-
\frac{\beta_q(K)}{N_q}
\right|
\le
\frac{N_q-\beta_q}{N_q}\rho^d
\le
\rho^d.$$

Thus, when $\rho^d$ is sufficiently small, $$\overline{S}_{q,d}(K)
\approx
\frac{\beta_q(K)}{N_q}.$$ In particular, for $q=1$,
$$\overline{S}_{1,d}(K)
=
\frac{
\operatorname{Tr}
\left(
I-\alpha L_1(K)
\right)^d
}{
|K_1|
}
\approx
\frac{\beta_1(K)}{|K_1|}.$$

In this sense, the Laplacian moment based on the ordinary Hodge
Laplacian is a theoretically justified surrogate for the normalized
Betti number when the spectrum is scaled so that the positive
eigenvalues are suppressed by the polynomial filter.

### Relation to the Ambient Formulation

In the theoretical formulation of the previous sections, the
Hodge-Laplacian-type spectral relaxation was defined on an ambient chain
space containing all candidate simplices. In that setting, inactive
simplex directions remain as ambient basis directions, and a penalty
term is needed to exclude them from the low-energy region.

In the hard limit, the penalty-regularized ambient Hodge Laplacian
decomposes as $$\widehat{L}_q
\to
L_q(K)
\oplus
\mu I_{\mathrm{inactive}}.$$ Here, $L_q(K)$ is the ordinary Hodge
Laplacian on the active complex, and $\mu I_{\mathrm{inactive}}$ is the
block acting on inactive directions.

For the Laplacian moment, we obtain $$\operatorname{Tr}
\left(
I-\alpha \widehat{L}_q
\right)^d
\to
\operatorname{Tr}
\left(
I-\alpha L_q(K)
\right)^d
+
N_q^{\mathrm{inactive}}
(1-\alpha\mu)^d.$$ Therefore, if $\alpha$ and $\mu$ are chosen so that
$$|1-\alpha\mu|^d\ll 1,$$ then the forward contribution from the
inactive block is negligible.

Moreover, the derivative of the moment filter is $$f_d'(\lambda)
=
-\alpha d(1-\alpha\lambda)^{d-1}.$$ Thus, the backward contribution from
inactive directions is controlled by $$\alpha d |1-\alpha\mu|^{d-1}.$$
Therefore, if $$|1-\alpha\mu|^{d-1}\ll 1,$$ then inactive directions
also have negligible influence on the gradient.

In particular, when $$\alpha\mu\simeq 1,$$ the inactive block
contributes almost nothing to either the forward or backward computation
of the Laplacian moment. In this sense, the numerical computation in
this section using the ordinary Hodge Laplacian can be viewed as the
limit of the ambient formulation in which inactive directions are
completely removed, or as the regime in which their contribution is
negligible.

::: lemma
**Lemma 4** (Ambient-to-ordinary reduction for polynomial moments).
*Suppose that, in the hard limit, the ambient operator decomposes as
$$\widehat{L}_q
=
L_q(K)\oplus \mu I_{\mathrm{inactive}}.$$ Let
$f_d(\lambda)=(1-\alpha\lambda)^d$. Then
$$\operatorname{Tr}f_d(\widehat{L}_q)
=
\operatorname{Tr}f_d(L_q(K))
+
N_q^{\mathrm{inactive}}(1-\alpha\mu)^d.$$ Moreover, $$f_d'(\mu)
=
-\alpha d(1-\alpha\mu)^{d-1}.$$ Thus, if $|1-\alpha\mu|^d$ and
$|1-\alpha\mu|^{d-1}$ are small, both the forward moment contribution
and the local filter derivative associated with the inactive block are
negligible. In this regime, the polynomial moment of the ambient
operator reduces to the ordinary-complex moment up to a negligible
inactive-block contribution.*
:::

### Relation to Polynomial Trace Estimation

The Laplacian moment $$\operatorname{Tr}(I-\alpha L_q)^d$$ has the same
general form as polynomial trace quantities used in normalized
Betti-number estimation. Since zero modes contribute one and suitably
filtered nonzero modes are suppressed, such traces can approximate
normalized kernel dimensions when the spectrum is properly scaled. This
connection is useful computationally because polynomial filters can be
evaluated by matrix-vector products and can be combined with stochastic
trace estimation.

This viewpoint is closely related to recent trace-estimation approaches
for estimating normalized Betti numbers of clique complexes
[@lloyd2016quantum; @akhalwaya2024comparing; @gyurik2022towards]. In
such approaches, Betti numbers are represented through the null space of
a combinatorial Laplacian or a related reflected operator, and
polynomial traces are used to approximate the normalized dimension of
this null space. The polynomial moment used in this paper has the same
mathematical form, but here it is used as a differentiable objective
inside a graph optimization loop.

The same polynomial-trace structure is also compatible with quantum
trace-estimation viewpoints. However, this paper does not implement a
quantum algorithm and does not claim quantum advantage. We therefore
treat the quantum connection only as a structural observation and a
possible future direction. The main contribution of this section is the
use of Laplacian moments as differentiable first-Betti-type objectives
for graph clique complexes.

### Numerical Results

In the numerical experiments, each candidate edge $e=(i,j)$ is assigned
an edge logit $a_e$. The edge probability is defined by
$$p_e=\sigma(a_e)
=
\frac{1}{1+\exp(-a_e)}.$$ For a triangle $\sigma=(i,j,k)$, the weight is
defined by $$w_\sigma
=
\prod_{e\subset\sigma}p_e.$$ This gives a weighted clique complex from a
soft graph. We then compute the weighted-current-complex version of the
first Hodge Laplacian.

Let $$R_1=\operatorname{diag}(\sqrt{p_e})_{e\in E_{\max}},
\qquad
R_2=\operatorname{diag}(\sqrt{w_\sigma})_{\sigma\in K_{\max}^{(2)}}.$$
Since vertex weights are fixed to one, we use $$\widetilde{B}_1=B_1R_1,
\qquad
\widetilde{B}_2=R_1B_2R_2.$$ The soft weighted first Hodge-Laplian-type
operator used in the experiments is $$L_1^{\mathrm{soft}}
=
\widetilde{B}_1^\top \widetilde{B}_1
+
\widetilde{B}_2\widetilde{B}_2^\top.$$ Unlike the ambient operator in
Section 3, this implementation does not include the inactive-direction
penalty term.

We define $M
=
I-\alpha L_1^{\mathrm{soft}}$ and compute the Laplacian moment $$S_{1,d}
=
\operatorname{Tr}(M^d).$$ For normalization, we use the effective edge
count $N_1^{\mathrm{eff}}
=
\sum_e p_e$, and define $$\overline{S}_{1,d}
=
\frac{
S_{1,d}
}{
N_1^{\mathrm{eff}}+\delta
}.$$ Here $N_1^{\mathrm{eff}}$ is the soft analogue of the number of
active edges $|K_1|$, and $\delta>0$ is a small numerical stabilizer.
Given a fixed soft moment target $\bar{s}_1^\star$, the soft
spectral-moment Betti loss is $$\mathcal{L}_{\mathrm{Betti}}
=
\frac{1}{2}
\left(
\overline{S}_{1,d}
-
\bar{s}_1^\star
\right)^2.$$ Here, $\bar{s}_1^\star$ is the target used in the
differentiable soft optimization. It should be distinguished from the
hard normalized Betti target $\bar{\beta}_1^\star$, which is used to
evaluate sampled hard graphs after optimization.

##### Soft and hard targets.

The soft moment target $\bar{s}_1^\star$ and the hard normalized Betti
target $\bar{\beta}_1^\star$ are conceptually different quantities. The
loss above optimizes the differentiable soft moment $\overline{S}_{1,d}$
toward $\bar{s}_1^\star$. After optimization, we sample hard graphs from
the final edge probabilities and compute the ordinary normalized Betti
number $\beta_1/|K_1|$ of their clique complexes. This sampled hard
value is then compared with the hard target $\bar{\beta}_1^\star$.

In the present proof-of-concept experiments, the soft target values are
specified before optimization and kept fixed during each run. We do not
claim an analytic or universal conversion rule from
$\bar{\beta}_1^\star$ to $\bar{s}_1^\star$. Instead, the experiments
test whether optimizing the prescribed soft spectral moment induces
sampled hard graphs whose normalized first Betti numbers move toward the
desired hard target. The soft targets used in each experiment are
reported explicitly in the tables.

In the experiments, we used $\alpha=0.15$ as the basic setting, and
mainly used $d=8$.

The edge logits were optimized using an Adam-type update, and both
forward and backward computations were performed using the ordinary
Hodge Laplacian.

#### Convergence of the Path-Integral Estimator

We first compare the path-integral estimator with the exact value of the
trace-gradient $$\operatorname{Tr}(M^{d-1} C_u)$$ for a fixed soft graph
and a fixed direction $u$. In this experiment, the number of nodes is
set to $n=8$, and the moment order is set to $d=6$. The number of Monte
Carlo samples is varied over
$$N_{\mathrm{MC}} \in \{100,300,1000,3000,10000\},$$ and the estimator
is evaluated multiple times for each sample size.

Figure [9](#fig:pi_estimate_exact){reference-type="ref"
reference="fig:pi_estimate_exact"} compares the mean and standard
deviation of the path-integral estimator with the exact trace-gradient.
The dashed line represents the exact value, the blue curve represents
the mean of the path-integral estimator, and the error bars represent
the standard deviation. When the number of samples is small, the
variance is large and the estimator deviates significantly from the
exact value. As $N_{\mathrm{MC}}$ increases, the estimator approaches
the exact value, and in particular, at $N_{\mathrm{MC}}=10000$, it
reaches the neighborhood of the exact value.

<figure id="fig:pi_estimate_exact" data-latex-placement="tbp">
<p><img src="exp1_con.png" style="width:60mm" alt="image" /> <img
src="exp1_err.png" style="width:60mm" alt="image" /></p>
<figcaption> (left) Path-integral estimate compared with the exact
trace-gradient. (right) Mean absolute error of the path-integral
estimator. </figcaption>
</figure>

Figure [9](#fig:pi_estimate_exact){reference-type="ref"
reference="fig:pi_estimate_exact"} shows the mean absolute error with
respect to the exact value. The mean absolute errors are $1.2014$ for
$N_{\mathrm{MC}}=100$, $0.4782$ for $N_{\mathrm{MC}}=300$, $0.6399$ for
$N_{\mathrm{MC}}=1000$, $0.2626$ for $N_{\mathrm{MC}}=3000$, and
$0.1518$ for $N_{\mathrm{MC}}=10000$.

   $N_{\mathrm{MC}}$   Mean absolute error
  ------------------- ---------------------
          100                1.2014
          300                0.4782
         1000                0.6399
         3000                0.2626
         10000               0.1518

  : Mean absolute error of the path-integral trace-gradient estimator.
  {#tab:pi_mae}

At $N_{\mathrm{MC}}=1000$, the error temporarily increases. This is due
to the variance caused by a finite number of Monte Carlo trials. For
larger sample sizes, the error decreases again, confirming the tendency
of the path-integral estimator to approach the exact trace-gradient.
These results show that the proposed path-integral backward estimator
functions as a Monte Carlo estimator of the trace-gradient.

#### Convergence of Betti Loss Optimization

Next, we verify whether the proposed Betti loss can actually be
minimized. In this experiment, the number of nodes is set to $n=10$, the
hard normalized Betti target is set to $\bar{\beta}_1^\star=0.10$, and
the soft moment target used in the differentiable loss is fixed to
$\bar{s}_1^\star=3.0717$. The optimization is performed using the exact
coordinate gradient and is terminated when the improvement of the loss
reaches a plateau.

Figure [10](#fig:loss_convergence){reference-type="ref"
reference="fig:loss_convergence"} shows the evolution of the Betti loss
over optimization steps. The loss rapidly decreases in the early stage
and then converges near zero with small oscillations. This result shows
that the proposed soft projector Betti loss provides an effective
learning signal for the edge logits.

<figure id="fig:loss_convergence" data-latex-placement="t">
<p><img src="exp2_conv.png" style="width:60mm" alt="image" /> <img
src="exp2_moment.png" style="width:60mm" alt="image" /></p>
<figcaption> (left)Convergence of the Betti loss during optimization.
(right) Convergence of the soft Betti moment toward the target.
</figcaption>
</figure>

Figure [10](#fig:loss_convergence){reference-type="ref"
reference="fig:loss_convergence"} shows the corresponding trajectory of
the soft Betti moment. The dotted line represents the fixed soft moment
target $\bar{s}_1^\star$. The soft moment initially decreases below the
target, then oscillates and returns toward the target, eventually
stabilizing in its neighborhood. This behavior demonstrates that the
Betti loss directly controls the soft moment toward the prescribed soft
target.

In this experiment, the optimization reaches a plateau after 45 steps.
The final loss is $1.09 \times 10^{-5}$, the final soft spectral moment
is $3.0763$, and the fixed soft target is $\bar{s}_1^\star=3.0717$.
Thus, the absolute error with respect to the soft target is reduced to
$0.0047$.

  Quantity                                          Value
  ---------------------------------------- -----------------------
  Number of steps                                    45
  Final loss                                $1.09 \times 10^{-5}$
  Final soft spectral moment                       3.0763
  Fixed soft target $\bar{s}_1^\star$              3.0717
  Soft target error                                0.0047
  Sampled hard normalized $\beta_1$ mean           0.1014
  Sampled hard normalized $\beta_1$ std            0.0904
  Hard target $\bar{\beta}_1^\star$                0.1000
  Hard target error                                0.0014
  Sampled edge density mean                        0.2564

  : Final result of Betti loss optimization for hard normalized Betti
  target $0.10$. The loss is optimized against the fixed soft moment
  target $\bar{s}_1^\star=3.0717$. The hard target is used for
  evaluation after sampling hard graphs from the optimized edge
  probabilities. {#tab:betti_optimization}

These results confirm that minimizing the soft spectral-moment Betti
loss drives the soft moment very close to the fixed soft target.
Moreover, when hard graphs are sampled from the final soft graph, the
mean ordinary hard normalized $\beta_1$ of the sampled clique complexes
is $0.1014$, yielding an error of only $0.0014$ with respect to the hard
target $0.10$. Therefore, in this example, the minimization of the soft
Betti loss is reflected in the topology of the sampled hard graphs.

On the other hand, the hard $\beta_1$ of a single thresholded graph is
$0.0$. This is because converting a soft graph into a hard graph by a
single threshold is a discrete operation and is sensitive to the
threshold value. Therefore, in these experiments, we evaluate the final
hard topology by sampling multiple hard graphs from the edge
probabilities and computing the mean normalized Betti number. This
evaluation better reflects the probabilistic output of the soft
generative model.

#### Topology-Controlled Graph Generation

We next examine whether the generated graph topology follows different
hard target normalized Betti values. In this experiment, the number of
nodes is set to $n=15$, and the hard target values are chosen as
$$\bar{\beta}_1^\star \in \{0.02,0.05,0.10,0.20\}.$$ For each hard
target, we specify a fixed soft moment target $\bar{s}_1^\star$ used in
the differentiable loss. These soft targets are reported in
Table [4](#tab:topology_control){reference-type="ref"
reference="tab:topology_control"}. For all targets, optimization is
initialized from the same soft graph.

Figure [11](#fig:initial_final_betti){reference-type="ref"
reference="fig:initial_final_betti"} shows the relationship between the
target normalized Betti value and the sampled hard normalized $\beta_1$
after optimization. The black dashed line indicates $y=x$, the orange
dotted line indicates the mean $\beta_1$ of the shared initial graph,
and the green points with error bars indicate the mean and standard
deviation of the sampled hard $\beta_1$ after optimization.

<figure id="fig:initial_final_betti" data-latex-placement="t">
<img src="exp3_control.png" style="width:72.0%" />
<figcaption>Initial and final sampled hard normalized Betti values for
different targets. The dashed black line indicates <span
class="math inline">\(y=x\)</span>, the orange dotted line indicates the
mean Betti value of the shared initial graph, and the green curve shows
the optimized results with standard deviation error bars. The final hard
Betti values follow the target values after optimization.</figcaption>
</figure>

The mean sampled hard normalized $\beta_1$ of the initial graph is
$0.1604$, with standard deviation $0.0769$. Therefore, for targets
$0.02$ and $0.05$, the optimization must decrease $\beta_1$, while for
target $0.20$, it must increase $\beta_1$. As shown in
Figure [11](#fig:initial_final_betti){reference-type="ref"
reference="fig:initial_final_betti"}, the optimized sampled hard
$\beta_1$ increases monotonically with the target and moves from the
initial graph value toward each target.

The final results are shown in
Table [4](#tab:topology_control){reference-type="ref"
reference="tab:topology_control"}.

   Target $\beta_1$   Steps   Soft mom.   Soft target   Soft err.   Hard $\beta_1$ mean   Hard $\beta_1$ std   Hard err.   Density
  ------------------ ------- ----------- ------------- ----------- --------------------- -------------------- ----------- ---------
         0.02          176     0.2562       0.2492       0.0070           0.0068                0.0135          0.0132     0.5671
         0.05          43      0.8180       0.8878       0.0699           0.0447                0.0457          0.0053     0.4713
         0.10          50      1.3477       1.3480       0.0002           0.1173                0.0744          0.0173     0.3978
         0.20          59      2.4705       2.4937       0.0231           0.1999                0.0831          0.0001     0.2997

  : Topology-controlled graph generation. "Soft mom." denotes the
  optimized soft spectral moment $\overline{S}_{1,d}$, and "Soft target"
  denotes the fixed soft moment target $\bar{s}_1^\star$ used in the
  differentiable loss. Hard $\beta_1$ values are computed from sampled
  hard clique complexes and compared with the hard target
  $\bar{\beta}_1^\star$. {#tab:topology_control}

Figure [12](#fig:final_errors){reference-type="ref"
reference="fig:final_errors"} compares the soft target error and the
hard target error for each target. The soft error is relatively large
for target $0.05$, but the hard error remains small overall. In
particular, for target $0.20$, the hard error is almost zero. This
indicates that the proposed method can generate graphs close to the
desired target not only in terms of the prescribed soft moment but also
in terms of the hard topology after sampling.

<figure id="fig:final_errors" data-latex-placement="t">
<img src="exp3_final.png" style="width:72.0%" />
<figcaption>Final soft and hard target errors for topology-controlled
graph generation. The soft target error is computed from the optimized
soft moment, while the hard target error is computed from sampled hard
graphs. The hard topology follows the target values with small
errors.</figcaption>
</figure>

These results confirm that the final sampled hard normalized $\beta_1$
generally increases as the target increases. In particular, for targets
$0.05$ and $0.20$, the hard target errors are $0.0053$ and $0.0001$,
respectively, indicating that graphs very close to the target topology
are generated. For target $0.10$, the mean hard $\beta_1$ is $0.1173$,
with an error of $0.0173$, but it still moves from the initial value
$0.1604$ toward the target. For target $0.02$, the final mean is
$0.0068$, which slightly underestimates the target, but the optimization
successfully reduces $\beta_1$ significantly from the initial value.

The sampled edge density decreases as the target $\beta_1$ increases,
taking values $0.5671$, $0.4713$, $0.3978$, and $0.2997$. This is
because, when the edge density is too high, loops are more likely to be
filled by triangles, reducing the first Betti number. Therefore, the
proposed method does not merely increase or decrease edges. Rather, it
controls $\beta_1$ through the balance between loops and filling
triangles in the clique complex.

These results show that topology-controlled graph generation with
different hard target normalized Betti values can be achieved using the
soft spectral-moment Betti loss together with fixed soft moment targets.

#### Combination with Graph Feature Loss

Finally, we examine whether the soft spectral-moment Betti loss can be
combined with another graph feature loss. As an independent graph
feature, we use the soft degree variance. The objective function is
defined as the sum of the soft spectral-moment Betti loss and the degree
variance loss. The target hard normalized $\beta_1$ is fixed to $0.10$,
while the degree variance target is varied over $0.41$, $0.45$, and
$0.49$. For each condition, we run experiments with five random seeds.

As a baseline, we use a variance-only optimization method, which
optimizes only the degree variance. This baseline approaches the degree
variance target but does not use the Betti loss. Therefore, it serves as
a control experiment to check whether the Betti topology is preserved.

Figure [13](#fig:joint_betti){reference-type="ref"
reference="fig:joint_betti"} shows the sampled hard normalized $\beta_1$
for the variance-only baseline and the joint optimization. The dashed
horizontal line indicates the Betti target $0.10$. In the variance-only
baseline, the hard $\beta_1$ remains around $0.16$ for all variance
targets, deviating significantly from the Betti target. In contrast, the
joint optimization keeps the hard $\beta_1$ around $0.11$, close to the
target $0.10$.

<figure id="fig:joint_betti" data-latex-placement="t">
<p><img src="exp4_join_betti.png" style="width:60mm" alt="image" /> <img
src="exp4_join_var.png" style="width:60mm" alt="image" /></p>
<figcaption> (left) Hard Betti preservation under joint optimization.
(right) Achieved degree variance under joint optimization. </figcaption>
</figure>

Figure [13](#fig:joint_betti){reference-type="ref"
reference="fig:joint_betti"} shows the achieved soft degree variance.
The dashed line indicates the degree variance target. Both the
variance-only baseline and the joint optimization follow the degree
variance target well. In particular, the joint optimization does not
significantly degrade the control of degree variance.

The numerical results are shown in
Table [5](#tab:joint_objective){reference-type="ref"
reference="tab:joint_objective"}.

   Var. target      Method       Var. mean   Var. std   Hard $\beta_1$ mean   Hard $\beta_1$ std   Hard $\beta_1$ err.
  ------------- --------------- ----------- ---------- --------------------- -------------------- ---------------------
      0.41       Variance-only    0.4036      0.0079          0.1692                0.0121               0.0692
      0.41           Joint        0.4112      0.0030          0.1100                0.0076               0.0108
      0.45       Variance-only    0.4556      0.0158          0.1627                0.0106               0.0627
      0.45           Joint        0.4504      0.0034          0.1125                0.0067               0.0125
      0.49       Variance-only    0.4987      0.0172          0.1596                0.0089               0.0596
      0.49           Joint        0.4892      0.0043          0.1088                0.0090               0.0102

  : Variance-only and joint optimization. {#tab:joint_objective}

The variance-only baseline achieves values close to the degree variance
target, but the sampled hard $\beta_1$ remains around $0.16$, far from
the target $0.10$. The hard $\beta_1$ error ranges from approximately
$0.0596$ to $0.0692$.

In contrast, the joint optimization achieves values close to the degree
variance target while keeping the sampled hard $\beta_1$ in the range
from $0.1088$ to $0.1125$. The hard $\beta_1$ error is approximately
between $0.0102$ and $0.0125$, which is much smaller than that of the
variance-only baseline.

These results show that the Betti loss is not merely a special
regularization term that conflicts with other graph feature objectives.
Rather, it functions as a topology-aware objective that can be combined
with ordinary graph statistics. In other words, the proposed method can
control a standard graph feature such as degree variance while
simultaneously keeping the first-order topology of the clique complex
near the target value.

## Summary and Discussion

In this work, we proposed a framework for differentiably controlling
homological constraints on finite simplicial complexes using the
low-frequency spectrum of Hodge-Laplacian-type spectral relaxations. The
central idea is not to treat Betti numbers or persistent homology
directly as discrete quantities, but instead to extract zero and
near-zero modes, which correspond to homological structures in the hard
ordinary-complex limit, using smooth spectral filters. In the soft
regime, these quantities should be interpreted as low-frequency
Hodge-spectral surrogates rather than as exact homological invariants.

The main contributions of this work can be summarized as follows. First,
we introduced an ambient Hodge-spectral relaxation on a fixed chain
space and showed that, in the hard limit, the penalty-regularized
operator recovers the ordinary Hodge Laplacian on the active subcomplex
and hence the corresponding Betti number. Second, using low-pass
spectral filters such as heat filters, resolvent filters, and polynomial
moment filters, we defined spectral-filter matching losses and
trace-type spectral-mass losses. Third, we applied these objectives to
Vietoris--Rips complexes of point clouds and compared their optimization
signals with persistence-diagram-based losses. Fourth, we used
polynomial Laplacian moments to control normalized first-Betti-type
quantities of graph clique complexes and showed that this topological
objective can be combined with ordinary graph-feature objectives.

It is important to distinguish this contribution from the use of
persistent homology as a descriptor. Persistent homology remains the
appropriate object when the goal is to compute stable barcode-level
summaries of multiscale topology. The proposed Hodge-spectral objectives
are complementary: they are designed for optimization settings in which
topology must provide a differentiable signal. In such settings, exact
barcode information is not always the most convenient optimization
object, and low-frequency spectral quantities can provide more
distributed and geometry-aware gradients.

In the experiments on Vietoris--Rips filtrations, we observed that Hodge
spectral-filter losses have properties different from
persistent-homology-based losses. Hodge spectral-filter losses do not
act only on birth--death pairs, but instead provide gradients through
low-energy subspaces at each scale. As a result, compared with PH
losses, the gradients were less localized around a small number of
critical simplices and were more broadly distributed over the point
cloud in the gradient-localization experiments. In the
pairing-instability stress test, PH losses showed sharp changes when the
maximal persistence bar switched, whereas the Hodge interval loss
exhibited relatively smoother behavior after normalization by the loss
range. In the shape synthesis experiment, Hodge spectral-filter
gradients provided update directions more aligned with the target
geometry and achieved lower reconstruction error than PH gradients in
the controlled radial-shape setting.

In the graph clique-complex experiments, we used the Laplacian moment
$$\operatorname{Tr}
\left(
I-\alpha L_1
\right)^d$$ to control a normalized first-Betti-type spectral quantity.
When the ordinary Hodge Laplacian is used on a hard clique complex, the
chain space consists only of active simplices. Therefore, unlike the
ambient formulation, no inactive-direction penalty is required. In the
soft numerical implementation, the moment is computed using a
weighted-current-complex operator, and the normalized soft spectral
moment is evaluated against a fixed soft target. The resulting sampled
hard graphs are then evaluated using the ordinary normalized Betti
number $$\frac{\beta_1}{|K_1|}.$$ The numerical experiments showed that,
for both a single target and multiple targets, optimizing edge logits
with the soft spectral-moment Betti loss moves the sampled hard
normalized Betti number toward the prescribed hard target value. We also
confirmed that the soft spectral-moment Betti loss can be combined with
ordinary graph-feature losses such as degree variance, enabling
simultaneous control of graph statistics and topological quantities.

These results suggest that the low-frequency spectrum of
Hodge-Laplacian-type operators provides an effective continuous
representation for topology-constrained optimization. In particular,
unlike barcode representations, the proposed Hodge-based losses are
sensitive not only to the existence of homology classes but also to the
surrounding spectral and geometric structure. Therefore, they can induce
more geometrically natural deformations and updates, rather than merely
matching topological summary statistics in the settings studied here.
This should not be interpreted as a general dominance statement over
barcode-based objectives; rather, the two approaches emphasize different
information and are useful for different purposes.

At the same time, the proposed method has clear computational
limitations. Hodge spectral-filter losses use richer spectral
information than PH losses, but this also increases the computational
cost. As the size of a point cloud or graph grows, the number of
simplices can increase rapidly, and constructing the
Hodge-Laplacian-type operator and evaluating spectral filters become
expensive. In our experiments, dense matrix computations were used, and
the runtime per gradient step for Hodge losses was larger than that for
PH losses. Applying the method to larger datasets will require scalable
implementations based on sparse linear algebra, low-rank approximation,
Chebyshev approximation, stochastic trace estimation, and related
techniques. Thus, the present experiments should be viewed as
proof-of-concept demonstrations of the optimization behavior rather than
as optimized large-scale implementations.

Another important point is that trace-type losses should be interpreted
as low-frequency spectral masses rather than exact Betti numbers in the
soft regime. This is both a limitation and an advantage. By including
near-zero modes, the loss can respond not only to exact homology classes
but also to weakly closed cycles, unstable holes, and approximate
topological structures. This yields smoother and more geometry-aware
update directions. On the other hand, hyperparameters such as filter
temperature, moment degree, scale set, spectral scaling, and
regularization strength affect the resulting optimization behavior. For
polynomial moment filters, in particular, the choice of $\alpha$ and $d$
must be coordinated with the spectrum of the Laplacian so that positive
eigenvalues are actually suppressed. A more systematic theoretical and
empirical understanding of these parameters remains an important topic
for future work.

The polynomial trace form of the moment loss also suggests possible
connections with scalable trace-estimation methods. Classical stochastic
trace estimation and polynomial filtering can reduce the need for full
eigendecomposition, and they are natural candidates for scaling
Hodge-spectral objectives to larger complexes. Quantum trace-estimation
methods for normalized Betti numbers have a related mathematical
structure, because they also represent Betti information through traces
of polynomial functions of Laplacian-related operators. However, this
work does not implement a quantum algorithm and does not claim quantum
advantage. A careful study of block encodings, state preparation costs,
sampling error, and gradient estimation would be required before making
algorithmic claims in that direction.

On the application side, the proposed framework can be extended to many
problems where topological constraints are important. Hodge
spectral-filter losses for point clouds and images may be useful for
medical image segmentation, shape interpolation, and geometric
generative modeling. Normalized spectral-moment Betti losses for graphs
may be useful for communication networks, molecular graphs, material
structures, and social networks, where higher-order loops and redundancy
affect functionality. In particular, Betti numbers of clique complexes
describe higher-order graph structures that cannot be fully captured by
degree distributions or clustering coefficients, and therefore may serve
as useful objectives for controlling network robustness and higher-order
connectivity. Developing such applications will require task-specific
choices of filtrations, spectral filters, target quantities, and
geometric or structural regularization terms.

In summary, this work presented a framework for treating topology not
merely as an external descriptor computed after the fact, but as an
object that can be directly optimized as a loss function. By using the
low-frequency spectrum of Hodge-Laplacian-type spectral relaxations,
discrete homological information can be embedded into smooth
optimization problems, yielding a common mathematical structure across
Vietoris--Rips complexes of point clouds and clique complexes of graphs.
Further development of scalable spectral approximations and
trace-estimation methods may enable the control of larger and more
complex topological structures.

## Statements and Declarations

### Funding {#funding .unnumbered}

The authors declare that no funds, grants, or other support were
received during the preparation of this manuscript.

### Competing interests {#competing-interests .unnumbered}

The authors have no relevant financial or non-financial interests to
disclose.

### Author contributions {#author-contributions .unnumbered}

S.K. conceived the study, developed the theoretical framework, and
carried out the numerical computations. Y.S. made significant
contributions through extensive discussions with S.K. and provided
important guidance for refining the direction of the study. All authors
reviewed and approved the final manuscript.

### Data availability {#data-availability .unnumbered}

The datasets generated and analyzed during the current study are
available from the corresponding author upon reasonable request.

### Code availability {#code-availability .unnumbered}

The code used for the numerical experiments is available from the
corresponding author upon reasonable request.

### Ethics approval {#ethics-approval .unnumbered}

Not applicable.

### Consent to participate {#consent-to-participate .unnumbered}

Not applicable.

### Consent for publication {#consent-for-publication .unnumbered}

Not applicable.

::: appendices

## Details of Backward Computation

In this appendix, we derive the backward computation for the low-pass
spectral losses defined in the main text. The basic flow is as follows.
First, from a loss function $$\mathcal{J}
=
\mathcal{J}(\widehat{L}_q),$$ we compute the gradient with respect to
the Hodge-Laplacian-type spectral relaxation: $$G_L
=
\frac{\partial \mathcal{J}}{\partial \widehat{L}_q}.$$ Then, using the
structure of $\widehat{L}_q$, we propagate the gradient to the weighted
boundary operators, simplex weights, edge probabilities, and edge
logits. In the Vietoris--Rips setting, since the edge logits are defined
as functions of point-cloud coordinates, the gradients are further
propagated to the point coordinates.

Throughout this appendix, for a variable $z$, we denote the gradient of
$\mathcal{J}$ with respect to $z$ by $$g_z
=
\frac{\partial \mathcal{J}}{\partial z}.$$ For example,
$$g_{\rho_\sigma}
=
\frac{\partial \mathcal{J}}{\partial \rho_\sigma},
\qquad
g_{w_\sigma}
=
\frac{\partial \mathcal{J}}{\partial w_\sigma},
\qquad
g_{p_e}
=
\frac{\partial \mathcal{J}}{\partial p_e},
\qquad
g_{a_e}
=
\frac{\partial \mathcal{J}}{\partial a_e}.$$ Here, $\rho_\sigma$ denotes
the square root of the simplex weight $w_\sigma$:
$$\rho_\sigma=\sqrt{w_\sigma}.$$

### Notation and Overall Computational Path

For a fixed degree $q$, we write the Hodge-Laplacian-type spectral
relaxation as $$L
=
\widehat{L}_q.$$ Let the loss function be $$\mathcal{J}
=
\mathcal{J}(L).$$ The matrix gradient obtained from the spectral loss is
denoted by $$G_L
=
\frac{\partial \mathcal{J}}{\partial L}.$$ Since $L$ is symmetric, in
numerical implementations one may symmetrize this gradient as $$G_L
\leftarrow
\frac{1}{2}
\left(
G_L+G_L^\top
\right).$$ The Hodge-Laplacian-type spectral relaxation is defined by
$$L
=
\widetilde{B}_q^\top \widetilde{B}_q
+
\widetilde{B}_{q+1}\widetilde{B}_{q+1}^\top
+
\mu(I-W_q).$$ For simplicity, we write $$A=\widetilde{B}_q,
\qquad
C=\widetilde{B}_{q+1}.$$ Then $$L
=
A^\top A
+
CC^\top
+
\mu(I-W_q).$$ Each weighted boundary operator is defined by
$$\widetilde{B}_p
=
R_{p-1}B_pR_p,$$ where $$R_p
=
\operatorname{diag}(\rho_\sigma)_{\sigma\in K_{\max}^{(p)}},
\qquad
\rho_\sigma
=
\sqrt{w_\sigma}.$$ In the soft clique complex, the simplex weights are
given by $$w_\sigma
=
\prod_{e\subset\sigma}p_e,$$ and each edge probability is defined by
$$p_e=\sigma(a_e)
=
\frac{1}{1+\exp(-a_e)}.$$ Therefore, the backward computational path is
$$\mathcal{J}
\longrightarrow
L
\longrightarrow
\widetilde{B}_q,\widetilde{B}_{q+1},W_q
\longrightarrow
\rho_\sigma
\longrightarrow
w_\sigma
\longrightarrow
p_e
\longrightarrow
a_e.$$

In the Vietoris--Rips setting, we further have $$a_{ij}^{(r)}(X)
=
\frac{r-d_{ij}(X)}{\varepsilon},
\qquad
d_{ij}(X)
=
\sqrt{
\|x_i-x_j\|^2+\delta
}.$$ Thus, gradients are further propagated through $$a_{ij}^{(r)}
\longrightarrow
d_{ij}
\longrightarrow
x_i.$$

### From Spectral Losses to $G_L$

We first compute $$G_L
=
\frac{\partial\mathcal{J}}{\partial L}$$ for representative low-pass
spectral losses used in the main text.

#### Heat Projector Matching Loss

Let the heat projector be $$F(L)
=
\exp\left(-\frac{L}{\tau}\right).$$ Let the target projector be
$$F_{\mathrm{tar}}
=
\exp\left(-\frac{L_{\mathrm{tar}}}{\tau}\right).$$ The loss function is
$$\mathcal{J}_{\mathrm{heat}}
=
\frac{1}{2}
\left\|
F(L)-F_{\mathrm{tar}}
\right\|_F^2.$$ Define $$D
=
F(L)-F_{\mathrm{tar}}.$$ Then $$d\mathcal{J}_{\mathrm{heat}}
=
\langle D,dF\rangle_F.$$ Let the eigendecomposition of $L$ be $$L
=
U\Lambda U^\top,
\qquad
\Lambda
=
\operatorname{diag}(\lambda_1,\ldots,\lambda_N).$$ Define $$f(\lambda)
=
\exp\left(-\frac{\lambda}{\tau}\right).$$ Then $$F(L)
=
Uf(\Lambda)U^\top.$$ By the Fréchet derivative of a matrix function,
$$U^\top(dF)U
=
K
\odot
\left(
U^\top(dL)U
\right),$$ where $\odot$ denotes the Hadamard product, and the Loewner
matrix $K$ is given by $$K_{ij}
=
\begin{cases}
\dfrac{f(\lambda_i)-f(\lambda_j)}{\lambda_i-\lambda_j},
& i\ne j,\\[3mm]
f'(\lambda_i),
& i=j.
\end{cases}$$ For the heat filter, $$f'(\lambda_i)
=
-\frac{1}{\tau}
\exp\left(-\frac{\lambda_i}{\tau}\right).$$ Therefore,
$$d\mathcal{J}_{\mathrm{heat}}
=
\left\langle
U^\top D U,
K\odot
\left(
U^\top(dL)U
\right)
\right\rangle_F.$$ Using the inner-product property of the Hadamard
product, $$d\mathcal{J}_{\mathrm{heat}}
=
\left\langle
K\odot
\left(
U^\top D U
\right),
U^\top(dL)U
\right\rangle_F.$$ Furthermore, using $$\left\langle
M,
U^\top(dL)U
\right\rangle_F
=
\left\langle
UMU^\top,
dL
\right\rangle_F,$$ we obtain $$G_L
=
U
\left[
K\odot
\left(
U^\top D U
\right)
\right]
U^\top.$$ Thus, for the heat projector matching loss, $$G_L
=
\frac{\partial\mathcal{J}_{\mathrm{heat}}}{\partial L}
=
U
\left[
K\odot
\left(
U^\top
\left(
F(L)-F_{\mathrm{tar}}
\right)
U
\right)
\right]
U^\top.$$

#### Resolvent Projector Matching Loss

Let the resolvent projector be $$F(L)
=
\alpha(L+\alpha I)^{-1}.$$ Let the target projector be
$$F_{\mathrm{tar}}
=
\alpha(L_{\mathrm{tar}}+\alpha I)^{-1}.$$ The loss function is
$$\mathcal{J}_{\mathrm{res}}
=
\frac{1}{2}
\left\|
F(L)-F_{\mathrm{tar}}
\right\|_F^2.$$ Define $$D
=
F(L)-F_{\mathrm{tar}}.$$ Also define $$M
=
L+\alpha I.$$ Then $$F(L)
=
\alpha M^{-1}.$$ Using the differential formula for the inverse matrix,
$$dM^{-1}
=
-M^{-1}(dM)M^{-1}.$$ Since $$dM=dL,$$ we have $$dF
=
-\alpha M^{-1}(dL)M^{-1}.$$ The differential of the loss is
$$d\mathcal{J}_{\mathrm{res}}
=
\langle D,dF\rangle_F.$$ Therefore, $$d\mathcal{J}_{\mathrm{res}}
=
-\alpha
\operatorname{Tr}
\left[
D^\top
M^{-1}(dL)M^{-1}
\right].$$ By cyclicity of the trace, $$d\mathcal{J}_{\mathrm{res}}
=
-\alpha
\operatorname{Tr}
\left[
M^{-1}D^\top M^{-1}
dL
\right].$$ When $L$, $M$, and $D$ are symmetric, $$D^\top=D.$$ Thus,
$$G_L
=
-\alpha
M^{-1}DM^{-1}.$$ Equivalently, $$G_L
=
\frac{\partial\mathcal{J}_{\mathrm{res}}}{\partial L}
=
-\alpha
(L+\alpha I)^{-1}
\left(
F(L)-F_{\mathrm{tar}}
\right)
(L+\alpha I)^{-1}.$$

#### Moment Trace Loss

Let the moment surrogate be $$S_{q,d}(L)
=
\operatorname{Tr}
\left(
I-\alpha L
\right)^d.$$ Define $$M
=
I-\alpha L.$$ Then $$S_{q,d}(L)
=
\operatorname{Tr}(M^d).$$

We first compute $$dS_{q,d}
=
d\,\operatorname{Tr}(M^d).$$ By the product rule, $$d(M^d)
=
\sum_{\ell=0}^{d-1}
M^\ell(dM)M^{d-1-\ell}.$$ Therefore, $$dS_{q,d}
=
\sum_{\ell=0}^{d-1}
\operatorname{Tr}
\left[
M^\ell(dM)M^{d-1-\ell}
\right].$$

By cyclicity of the trace, $$\operatorname{Tr}
\left[
M^\ell(dM)M^{d-1-\ell}
\right]
=
\operatorname{Tr}
\left[
M^{d-1}dM
\right].$$ Hence, $$dS_{q,d}
=
d\,
\operatorname{Tr}
\left[
M^{d-1}dM
\right].$$

Since $$M=I-\alpha L,$$ we have $$dM=-\alpha dL.$$ Therefore, $$dS_{q,d}
=
-\alpha d\,
\operatorname{Tr}
\left[
M^{d-1}dL
\right].$$

Thus, $$\frac{\partial S_{q,d}}{\partial L}
=
-\alpha d
\left(
M^{d-1}
\right)^\top.$$ If $L$ is symmetric, then $M$ is also symmetric, and
hence $$\frac{\partial S_{q,d}}{\partial L}
=
-\alpha d
M^{d-1}.$$

For the loss function $$\mathcal{J}_{\mathrm{mom}}
=
\frac{1}{2}
\left(
S_{q,d}(L)-\tau_q
\right)^2,$$ the chain rule gives $$G_L
=
\frac{\partial\mathcal{J}_{\mathrm{mom}}}{\partial L}
=
\left(
S_{q,d}(L)-\tau_q
\right)
\frac{\partial S_{q,d}}{\partial L}.$$ Therefore, $$G_L
=
\left(
S_{q,d}(L)-\tau_q
\right)
\left(
-\alpha d M^{d-1}
\right).$$

When using the normalized moment surrogate $$\overline{S}_{q,d}(L)
=
\frac{1}{N_q}S_{q,d}(L),$$ the loss function is
$$\mathcal{J}_{\mathrm{norm}}
=
\frac{1}{2}
\left(
\overline{S}_{q,d}(L)-\bar{\tau}_q
\right)^2.$$ In this case, $$G_L
=
\left(
\overline{S}_{q,d}(L)-\bar{\tau}_q
\right)
\frac{1}{N_q}
\left(
-\alpha d M^{d-1}
\right).$$

### From the Hodge-Laplacian-type spectral relaxation to Weighted Boundaries

We now assume that $$G_L
=
\frac{\partial\mathcal{J}}{\partial L}$$ has already been computed, and
propagate it to the weighted boundary operators.

Recall that $$L
=
A^\top A
+
CC^\top
+
\mu(I-W_q),$$ where $$A=\widetilde{B}_q,
\qquad
C=\widetilde{B}_{q+1}.$$

Taking the differential, we obtain $$dL
=
d(A^\top A)
+
d(CC^\top)
-
\mu dW_q.$$ The first two terms are $$d(A^\top A)
=
(dA)^\top A
+
A^\top(dA)$$ and $$d(CC^\top)
=
(dC)C^\top
+
C(dC)^\top.$$ Thus, $$dL
=
(dA)^\top A
+
A^\top(dA)
+
(dC)C^\top
+
C(dC)^\top
-
\mu dW_q.$$

The differential of the loss is $$d\mathcal{J}
=
\langle G_L,dL\rangle_F.$$

First, consider the terms involving $A$: $$d\mathcal{J}_A
=
\left\langle
G_L,
(dA)^\top A
+
A^\top(dA)
\right\rangle_F.$$ Using properties of the Frobenius inner product,
$$\left\langle
G_L,
(dA)^\top A
\right\rangle_F
=
\left\langle
AG_L^\top,
dA
\right\rangle_F$$ and $$\left\langle
G_L,
A^\top(dA)
\right\rangle_F
=
\left\langle
AG_L,
dA
\right\rangle_F.$$ Since $G_L$ is symmetrized, $$G_L^\top=G_L.$$
Therefore, $$d\mathcal{J}_A
=
\left\langle
2AG_L,
dA
\right\rangle_F.$$ Hence, $$G_A
=
\frac{\partial\mathcal{J}}{\partial A}
=
2AG_L.$$

Next, consider the terms involving $C$: $$d\mathcal{J}_C
=
\left\langle
G_L,
(dC)C^\top
+
C(dC)^\top
\right\rangle_F.$$ Similarly, $$\left\langle
G_L,
(dC)C^\top
\right\rangle_F
=
\left\langle
G_LC,
dC
\right\rangle_F$$ and $$\left\langle
G_L,
C(dC)^\top
\right\rangle_F
=
\left\langle
G_L^\top C,
dC
\right\rangle_F.$$ Since $G_L^\top=G_L$, $$d\mathcal{J}_C
=
\left\langle
2G_LC,
dC
\right\rangle_F.$$ Thus, $$G_C
=
\frac{\partial\mathcal{J}}{\partial C}
=
2G_LC.$$

We also compute the contribution from the penalty term $$\mu(I-W_q).$$
The differential of this term is $$-\mu dW_q.$$ Therefore,
$$d\mathcal{J}_{\mathrm{pen}}
=
-\mu
\langle G_L,dW_q\rangle_F.$$

Since $W_q$ is diagonal, $$W_q
=
\operatorname{diag}(w_\sigma)_{\sigma\in K_{\max}^{(q)}},$$ we have
$$dW_q
=
\operatorname{diag}(dw_\sigma)_{\sigma\in K_{\max}^{(q)}}.$$ Thus,
$$\langle G_L,dW_q\rangle_F
=
\sum_{\sigma\in K_{\max}^{(q)}}
(G_L)_{\sigma\sigma}dw_\sigma.$$ Hence, the direct gradient contribution
from the penalty term to a $q$-simplex weight is
$$g_{w_\sigma}^{\mathrm{pen}}
=
-\mu(G_L)_{\sigma\sigma},
\qquad
\sigma\in K_{\max}^{(q)}.$$

### From Weighted Boundaries to Square-Root Weights

We next propagate the gradient through the weighted boundary
$$\widetilde{B}_p
=
R_{p-1}B_pR_p$$ to the square-root weights $\rho_\sigma$.

Recall that $$R_p
=
\operatorname{diag}(\rho_\sigma)_{\sigma\in K_{\max}^{(p)}},
\qquad
\rho_\sigma=\sqrt{w_\sigma}.$$

Let $$G_{\widetilde{B}_p}
=
\frac{\partial\mathcal{J}}{\partial \widetilde{B}_p}.$$

In components, $$(\widetilde{B}_p)_{\tau\sigma}
=
\rho_\tau
(B_p)_{\tau\sigma}
\rho_\sigma,$$ where $$\tau\in K_{\max}^{(p-1)},
\qquad
\sigma\in K_{\max}^{(p)}.$$

First, consider the contribution to $\rho_\tau$ for a $(p-1)$-simplex
$\tau$. We have $$\frac{\partial(\widetilde{B}_p)_{\tau\sigma}}
{\partial \rho_\tau}
=
(B_p)_{\tau\sigma}\rho_\sigma.$$ Therefore,
$$\frac{\partial\mathcal{J}}{\partial \rho_\tau}
=
\sum_{\sigma\in K_{\max}^{(p)}}
(G_{\widetilde{B}_p})_{\tau\sigma}
(B_p)_{\tau\sigma}
\rho_\sigma.$$ In vector form, the contribution from $\widetilde{B}_p$
to $\rho_{p-1}$ is $$g_{\rho_{p-1}}^{(p,\mathrm{lower})}
=
\left(
G_{\widetilde{B}_p}
\odot
B_p
\right)
\rho_p.$$

Next, consider the contribution to $\rho_\sigma$ for a $p$-simplex
$\sigma$. We have $$\frac{\partial(\widetilde{B}_p)_{\tau\sigma}}
{\partial \rho_\sigma}
=
\rho_\tau
(B_p)_{\tau\sigma}.$$ Therefore,
$$\frac{\partial\mathcal{J}}{\partial \rho_\sigma}
=
\sum_{\tau\in K_{\max}^{(p-1)}}
(G_{\widetilde{B}_p})_{\tau\sigma}
(B_p)_{\tau\sigma}
\rho_\tau.$$ In vector form, the contribution from $\widetilde{B}_p$ to
$\rho_p$ is $$g_{\rho_p}^{(p,\mathrm{upper})}
=
\left(
G_{\widetilde{B}_p}
\odot
B_p
\right)^\top
\rho_{p-1}.$$

A key point is that the same $\rho_p$ appears in two weighted
boundaries. It appears on the right side of $$\widetilde{B}_p
=
R_{p-1}B_pR_p$$ and on the left side of $$\widetilde{B}_{p+1}
=
R_pB_{p+1}R_{p+1}.$$ Therefore, the total gradient with respect to
$\rho_p$ is the sum of the two contributions.

Thus, for a general degree $p$, the full gradient with respect to
$\rho_p$ is $$g_{\rho_p}
=
\left(
G_{\widetilde{B}_p}
\odot
B_p
\right)^\top
\rho_{p-1}
+
\left(
G_{\widetilde{B}_{p+1}}
\odot
B_{p+1}
\right)
\rho_{p+1},$$ where terms corresponding to non-existent boundary
operators at the ends of the complex are omitted.

For the most important case $q=1$, we have $$L
=
\widehat{L}_1
=
\widetilde{B}_1^\top\widetilde{B}_1
+
\widetilde{B}_2\widetilde{B}_2^\top
+
\mu(I-W_1).$$ Then $$G_{\widetilde{B}_1}
=
2\widetilde{B}_1G_L,
\qquad
G_{\widetilde{B}_2}
=
2G_L\widetilde{B}_2.$$

The gradient with respect to the square-root weights of edges, $\rho_1$,
is $$g_{\rho_1}
=
\left(
G_{\widetilde{B}_1}
\odot
B_1
\right)^\top
\rho_0
+
\left(
G_{\widetilde{B}_2}
\odot
B_2
\right)
\rho_2.$$ The gradient with respect to the square-root weights of
triangles, $\rho_2$, is $$g_{\rho_2}
=
\left(
G_{\widetilde{B}_2}
\odot
B_2
\right)^\top
\rho_1.$$ The vertex weights are usually fixed, and hence gradients with
respect to $\rho_0$ are not used for optimization.

### From Square-Root Weights to Simplex Weights

We now compute the derivative from $$\rho_\sigma
=
\sqrt{w_\sigma}$$ to $$w_\sigma.$$

Since $$\rho_\sigma
=
w_\sigma^{1/2},$$ we have
$$\frac{\partial \rho_\sigma}{\partial w_\sigma}
=
\frac{1}{2}
w_\sigma^{-1/2}
=
\frac{1}{2\rho_\sigma}.$$

Therefore, the gradient contribution from the weighted boundaries to the
simplex weight is $$g_{w_\sigma}^{\mathrm{bdry}}
=
g_{\rho_\sigma}
\frac{\partial \rho_\sigma}{\partial w_\sigma}
=
\frac{g_{\rho_\sigma}}{2\rho_\sigma}.$$

If $\sigma\in K_{\max}^{(q)}$, then the penalty contribution
$$g_{w_\sigma}^{\mathrm{pen}}
=
-\mu(G_L)_{\sigma\sigma}$$ must be added. Therefore, $$g_{w_\sigma}
=
\frac{g_{\rho_\sigma}}{2\rho_\sigma}
-
\mu(G_L)_{\sigma\sigma},
\qquad
\sigma\in K_{\max}^{(q)}.$$

For a $p$-simplex $\sigma\in K_{\max}^{(p)}$ with $p\ne q$, there is no
direct penalty contribution, and hence $$g_{w_\sigma}
=
\frac{g_{\rho_\sigma}}{2\rho_\sigma}.$$

Numerically, when $w_\sigma$ is very small, $\rho_\sigma$ also becomes
very small and instability may occur. In such cases, one may use
$$\rho_\sigma
=
\sqrt{w_\sigma+\epsilon_{\mathrm{num}}}.$$ Then
$$g_{w_\sigma}^{\mathrm{bdry}}
=
\frac{g_{\rho_\sigma}}{2\sqrt{w_\sigma+\epsilon_{\mathrm{num}}}}.$$

### From Simplex Weights to Edge Probabilities

In the soft clique complex, simplex weights are defined by $$w_\sigma
=
\prod_{e\subset\sigma}p_e.$$

If an edge $e$ is contained in $\sigma$, then
$$\frac{\partial w_\sigma}{\partial p_e}
=
\prod_{\substack{e'\subset\sigma\\e'\ne e}}
p_{e'}.$$ Equivalently, $$\frac{\partial w_\sigma}{\partial p_e}
=
\frac{w_\sigma}{p_e}.$$

If $$e\not\subset\sigma,$$ then $$\frac{\partial w_\sigma}{\partial p_e}
=
0.$$

Therefore, the gradient with respect to the edge probability $p_e$ is
the sum of the contributions from all simplices containing $e$:
$$g_{p_e}
=
\frac{\partial\mathcal{J}}{\partial p_e}
=
\sum_{\sigma\supset e}
g_{w_\sigma}
\frac{\partial w_\sigma}{\partial p_e}.$$ Thus, $$g_{p_e}
=
\sum_{\sigma\supset e}
g_{w_\sigma}
\frac{w_\sigma}{p_e}.$$

For numerical stability when $p_e$ is very small, one may use $$g_{p_e}
=
\sum_{\sigma\supset e}
g_{w_\sigma}
\frac{w_\sigma}{p_e+\epsilon_{\mathrm{num}}}.$$

### From Edge Probabilities to Edge Logits

The edge probability is defined from the edge logit $a_e$ by $$p_e
=
\sigma(a_e)
=
\frac{1}{1+\exp(-a_e)}.$$

The derivative of the logistic function is
$$\frac{\partial p_e}{\partial a_e}
=
p_e(1-p_e).$$ Therefore, $$g_{a_e}
=
\frac{\partial\mathcal{J}}{\partial a_e}
=
g_{p_e}
p_e(1-p_e).$$

Substituting the result from the previous subsection gives $$g_{a_e}
=
p_e(1-p_e)
\sum_{\sigma\supset e}
g_{w_\sigma}
\frac{w_\sigma}{p_e}.$$

When $p_e>0$, this can be simplified as $$g_{a_e}
=
(1-p_e)
\sum_{\sigma\supset e}
g_{w_\sigma}
w_\sigma.$$ However, for numerical stability, it is safer to use
$$g_{a_e}
=
p_e(1-p_e)
\sum_{\sigma\supset e}
g_{w_\sigma}
\frac{w_\sigma}{p_e+\epsilon_{\mathrm{num}}}.$$

Thus, gradients of arbitrary low-pass spectral losses can be propagated
analytically to the edge logits $$a_e.$$

### Backward Computation for Graph Generation

In graph generation, the optimization variables are the edge logits
$$a=\{a_e\}_{e\in E_{\max}}.$$ Thus, the final output of the backward
computation is $$\nabla_a\mathcal{J}
=
\left(
g_{a_e}
\right)_{e\in E_{\max}}.$$

The computation proceeds as follows.

First, compute edge probabilities from edge logits: $$p_e=\sigma(a_e).$$
Next, compute simplex weights: $$w_\sigma
=
\prod_{e\subset\sigma}p_e.$$ Then construct $$W_q,
\qquad
R_q,
\qquad
\widetilde{B}_q,
\qquad
\widehat{L}_q.$$

Next, compute $$G_L
=
\frac{\partial\mathcal{J}}{\partial \widehat{L}_q}$$ from the loss
function. For example, for the normalized Laplacian moment loss
$$\mathcal{J}_{\mathrm{norm}}
=
\frac{1}{2}
\left(
\overline{S}_{q,d}
-
\bar{\tau}_q
\right)^2,$$ where $$\overline{S}_{q,d}
=
\frac{1}{N_q}
\operatorname{Tr}
\left(
I-\alpha\widehat{L}_q
\right)^d,$$ define $$M=
I-\alpha\widehat{L}_q.$$ Then $$G_L
=
\left(
\overline{S}_{q,d}
-
\bar{\tau}_q
\right)
\frac{1}{N_q}
\left(
-\alpha d M^{d-1}
\right).$$

Using this $G_L$, compute $$G_{\widetilde{B}_q}
=
2\widetilde{B}_qG_L$$ and $$G_{\widetilde{B}_{q+1}}
=
2G_L\widetilde{B}_{q+1}.$$

Then compute $$g_{\rho_p}$$ using the formula in the previous
subsection. In particular, for $q=1$, $$g_{\rho_1}
=
\left(
G_{\widetilde{B}_1}
\odot
B_1
\right)^\top
\rho_0
+
\left(
G_{\widetilde{B}_2}
\odot
B_2
\right)
\rho_2.$$

Then compute $$g_{w_\sigma}.$$ Next compute $$g_{p_e}
=
\sum_{\sigma\supset e}
g_{w_\sigma}
\frac{w_\sigma}{p_e}.$$ Finally compute $$g_{a_e}
=
g_{p_e}p_e(1-p_e).$$

This gives $$\frac{\partial\mathcal{J}}{\partial a_e}
=
g_{a_e}.$$ Therefore, the edge logits can be updated by gradient-based
optimization.

### From Vietoris--Rips Edge Logits to Distances

In the Vietoris--Rips setting, edge logits are defined from point-cloud
coordinates. At scale $r$, $$a_{ij}^{(r)}(X)
=
\frac{r-d_{ij}(X)}{\varepsilon},$$ where $$d_{ij}(X)
=
\sqrt{
\|x_i-x_j\|^2+\delta
}.$$

Assume that the gradient with respect to each edge logit has already
been computed: $$g_{a_{ij}^{(r)}}
=
\frac{\partial\mathcal{J}}{\partial a_{ij}^{(r)}}.$$ We now propagate
this gradient to the distance $d_{ij}$.

Since $$a_{ij}^{(r)}
=
\frac{r-d_{ij}}{\varepsilon},$$ we have
$$\frac{\partial a_{ij}^{(r)}}{\partial d_{ij}}
=
-\frac{1}{\varepsilon}.$$ Therefore, $$g_{d_{ij}}^{(r)}
=
\frac{\partial\mathcal{J}}{\partial d_{ij}}
=
g_{a_{ij}^{(r)}}
\frac{\partial a_{ij}^{(r)}}{\partial d_{ij}}
=
-\frac{1}{\varepsilon}
g_{a_{ij}^{(r)}}.$$

### From Distances to Point-Cloud Coordinates

We next differentiate the stabilized distance $$d_{ij}(X)
=
\sqrt{
\|x_i-x_j\|^2+\delta
}$$ with respect to the point-cloud coordinates.

Since $$d_{ij}(X)^2
=
\|x_i-x_j\|^2+\delta,$$ we have $$\nabla_{x_i}d_{ij}
=
\frac{x_i-x_j}{d_{ij}}$$ and $$\nabla_{x_j}d_{ij}
=
\frac{x_j-x_i}{d_{ij}}.$$

At a single scale $r$, the gradient with respect to a point $x_i$ is the
sum of the contributions from all candidate edges incident to $x_i$:
$$\nabla_{x_i}\mathcal{J}^{(r)}
=
\sum_{j:(i,j)\in E_{\max}}
g_{d_{ij}}^{(r)}
\frac{x_i-x_j}{d_{ij}}.$$ Substituting $$g_{d_{ij}}^{(r)}
=
-\frac{1}{\varepsilon}
g_{a_{ij}^{(r)}},$$ we obtain $$\nabla_{x_i}\mathcal{J}^{(r)}
=
-\frac{1}{\varepsilon}
\sum_{j:(i,j)\in E_{\max}}
g_{a_{ij}^{(r)}}
\frac{x_i-x_j}{d_{ij}}.$$

Furthermore, using $$g_{a_{ij}^{(r)}}
=
p_{ij}^{(r)}
\left(
1-p_{ij}^{(r)}
\right)
\sum_{\sigma\supset(i,j)}
g_{w_\sigma}^{(r)}
\frac{
w_\sigma^{(r)}
}{
p_{ij}^{(r)}
},$$ we obtain $$\nabla_{x_i}\mathcal{J}^{(r)}
=
-\frac{1}{\varepsilon}
\sum_{j:(i,j)\in E_{\max}}
\left[
p_{ij}^{(r)}
\left(
1-p_{ij}^{(r)}
\right)
\sum_{\sigma\supset(i,j)}
g_{w_\sigma}^{(r)}
\frac{
w_\sigma^{(r)}
}{
p_{ij}^{(r)}
}
\right]
\frac{x_i-x_j}{d_{ij}}.$$

For numerical stability, one may replace $$\frac{
w_\sigma^{(r)}
}{
p_{ij}^{(r)}
}$$ by $$\frac{
w_\sigma^{(r)}
}{
p_{ij}^{(r)}+\epsilon_{\mathrm{num}}
}.$$

### Multi-Scale Vietoris--Rips Backward Computation

In a Vietoris--Rips filtration, we use multiple scales
$$r_1<r_2<\cdots<r_M.$$ Suppose that the loss function is
$$\mathcal{J}(X)
=
\sum_{m=1}^{M}
\omega_m
\mathcal{J}_m
\left(
\widehat{L}_q^{(r_m)}(X)
\right).$$

For each scale $r_m$, first compute $$G_L^{(m)}
=
\frac{\partial\mathcal{J}_m}
{\partial \widehat{L}_q^{(r_m)}}.$$ Then, following the procedure above,
compute $$g_{a_{ij}^{(r_m)}}
=
\frac{\partial\mathcal{J}_m}
{\partial a_{ij}^{(r_m)}}.$$

The edge logit at scale $r_m$ is $$a_{ij}^{(r_m)}(X)
=
\frac{r_m-d_{ij}(X)}{\varepsilon}.$$ The distance $d_{ij}(X)$ does not
depend on the scale, whereas the edge-logit gradient
$$g_{a_{ij}^{(r_m)}}$$ does depend on the scale.

The gradient of the total loss with respect to $x_i$ is the weighted sum
of the contributions from all scales: $$\nabla_{x_i}\mathcal{J}
=
\sum_{m=1}^{M}
\omega_m
\nabla_{x_i}\mathcal{J}_m.$$ Therefore, $$\nabla_{x_i}\mathcal{J}
=
-\frac{1}{\varepsilon}
\sum_{m=1}^{M}
\omega_m
\sum_{j:(i,j)\in E_{\max}}
g_{a_{ij}^{(r_m)}}
\frac{x_i-x_j}{d_{ij}}.$$

Writing $g_{a_{ij}^{(r_m)}}$ explicitly, we have
$$\nabla_{x_i}\mathcal{J}
=
-\frac{1}{\varepsilon}
\sum_{m=1}^{M}
\omega_m
\sum_{j:(i,j)\in E_{\max}}
\left[
p_{ij}^{(r_m)}
\left(
1-p_{ij}^{(r_m)}
\right)
\sum_{\sigma\supset(i,j)}
g_{w_\sigma}^{(m)}
\frac{
w_\sigma^{(r_m)}
}{
p_{ij}^{(r_m)}
}
\right]
\frac{x_i-x_j}{d_{ij}}.$$

This shows that the multi-scale Vietoris--Rips loss is analytically
differentiable with respect to the point-cloud coordinates $X$.

### Summary of Backward Computation

The backward computation derived in this appendix can be summarized as
follows.

First, compute $$G_L
=
\frac{\partial\mathcal{J}}{\partial \widehat{L}_q}$$ from the spectral
loss.

Next, using $$\widehat{L}_q
=
\widetilde{B}_q^\top\widetilde{B}_q
+
\widetilde{B}_{q+1}\widetilde{B}_{q+1}^\top
+
\mu(I-W_q),$$ compute $$G_{\widetilde{B}_q}
=
2\widetilde{B}_qG_L$$ and $$G_{\widetilde{B}_{q+1}}
=
2G_L\widetilde{B}_{q+1}.$$

For a general degree $p$, the gradient with respect to $\rho_p$ is
$$g_{\rho_p}
=
\left(
G_{\widetilde{B}_p}
\odot
B_p
\right)^\top
\rho_{p-1}
+
\left(
G_{\widetilde{B}_{p+1}}
\odot
B_{p+1}
\right)
\rho_{p+1},$$ where non-existent boundary terms are omitted.

Then, since $$\rho_\sigma=\sqrt{w_\sigma},$$ compute
$$g_{w_\sigma}^{\mathrm{bdry}}
=
\frac{g_{\rho_\sigma}}{2\rho_\sigma}.$$ For $\sigma\in K_{\max}^{(q)}$,
add the penalty contribution: $$g_{w_\sigma}
=
\frac{g_{\rho_\sigma}}{2\rho_\sigma}
-
\mu(G_L)_{\sigma\sigma}.$$

Next, using the soft clique relation $$w_\sigma
=
\prod_{e\subset\sigma}p_e,$$ compute $$g_{p_e}
=
\sum_{\sigma\supset e}
g_{w_\sigma}
\frac{w_\sigma}{p_e}.$$

Finally, since $$p_e=\sigma(a_e),$$ compute $$g_{a_e}
=
g_{p_e}p_e(1-p_e).$$

In graph generation, this $$g_{a_e}$$ is the gradient with respect to
the optimization variable.

In the Vietoris--Rips setting, using $$a_{ij}^{(r)}(X)
=
\frac{r-d_{ij}(X)}{\varepsilon}$$ and $$d_{ij}(X)
=
\sqrt{
\|x_i-x_j\|^2+\delta
},$$ we obtain the point-coordinate gradient $$\nabla_{x_i}\mathcal{J}
=
-\frac{1}{\varepsilon}
\sum_{m=1}^{M}
\omega_m
\sum_{j:(i,j)\in E_{\max}}
g_{a_{ij}^{(r_m)}}
\frac{x_i-x_j}{d_{ij}}.$$

Thus, all low-pass spectral losses introduced in the main text are
analytically differentiable through the Hodge-Laplacian-type spectral
relaxation, soft simplex weights, edge probabilities, edge logits, and,
in the Vietoris--Rips setting, point-cloud coordinates.
:::

