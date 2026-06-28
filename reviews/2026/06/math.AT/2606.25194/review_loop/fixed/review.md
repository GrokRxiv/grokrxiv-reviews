# Hodge Spectral Surrogates for Topology-Constrained Optimization

GrokRxiv review of [arXiv:2606.25194](https://arxiv.org/abs/2606.25194) · `math.AT`

_Authors_: Satoshi Kanno, Yoshi-aki Shimada

## TL;DR

The five specialist reviews converge on a paper with a sound theoretical core but critically inadequate empirical support. The theoretical framework—Propositions 1–3 and Lemma 4—is mostly correct (overall_correctness: mostly_sound): the ambient Hodge-spectral relaxation, hard-limit consistency, soft-weight convergence, and trace-type Betti surrogate are all mathematically coherent. Two minor gaps remain: Proposition 1 lacks a machine-checked proof artifact, and the polynomial-moment Betti bound (TC4) assumes α < 2/λ_max without verifying this precondition for the soft/ambient operators actually used. However, all six load-bearing empirical claims in this code-amenable field (math.AT) are rated unsupported or partially supported at major severity by the technical correctness specialist, uniformly because no executable artifacts accompany the paper (code is 'available from the corresponding author upon reasonable request' only). The reproducibility specialist assigns a score of 0.25 and identifies five independent major concerns covering absent code, absent data generation scripts, underspecified hyperparameters, absent evaluation scripts, and absent machine-checkable proof artifacts. The pairing-instability smoothness advantage (Section 5.5) is presented misleadingly: the raw maximum derivative jump is larger for the Hodge loss (15.8489) than for PH (1.1773); the favorable conclusion holds only under a self-chosen per-loss normalization that is not independently justified. The novelty specialist rates the contribution as incremental (0.52) and identifies unacknowledged connections to graph signal processing prior art (ChebNet, Hammond wavelets, topological signal processing on simplicial complexes) that overlap directly with the paper's computational methodology. The citation specialist flags two missing foundational references (Hodge Laplacians on graphs; stochastic trace estimation) and a potential citation-key mismatch for the Gyurik et al. quantum reference. No specialist identified critical mathematical errors. Per the recommendation gate for code-amenable fields: both the technical correctness and reproducibility specialists flagged absent proof-as-code and experiment artifacts at major severity across multiple headline claims, mandating major_revision.

_Recommendation_: **Major revision** · _Confidence_: 82%

## Strengths

- The Hodge-spectral relaxation framework is theoretically principled: the ambient operator decomposes correctly in the hard limit (Proposition 1), converges in operator norm as soft weights approach hard indicators (Proposition 2), and the trace-type Betti surrogate error is bounded explicitly in terms of the spectral filter's suppression of positive eigenvalues (Proposition 3).
- The paper explicitly acknowledges in Remark 1 that soft boundary operators do not satisfy B²=0, correctly scoping all soft-regime results as spectral surrogates rather than exact homological quantities—a significant mathematical-honesty contribution that prevents overclaiming.
- The prescriptive framing—topology as an optimization objective rather than a post-hoc descriptor—is clearly articulated and the gradient-localization and pairing-instability motivations for spectral surrogates are well-stated and address a genuine limitation of barcode-based losses.
- The connection to quantum trace estimation (Lloyd 2016, Akhalwaya) is correctly identified and positions a computationally viable scaling path via stochastic trace estimation, which is a concrete future direction rather than a vague claim.

## Weaknesses

- All six load-bearing empirical claims—gradient localization (TC7), pairing instability (TC8), shape synthesis (TC9), path-integral estimator convergence (TC10), Betti-loss optimization (TC11), and joint objective control (TC12)—are unsupported at major severity because no executable code or data artifacts are provided; the paper's favorable empirical conclusions cannot be independently verified.
- The pairing-instability smoothness advantage (Section 5.5, Figure 5) is presented misleadingly: the raw maximum derivative jump is larger for the Hodge loss (15.8489) than for PH (1.1773), and the favorable conclusion holds only after dividing each loss by its own value range—a loss-specific normalization chosen by the authors that is not independently justified and whose effect on the conclusion is not analyzed.
- Critical connections to graph signal processing prior art are absent: the Chebyshev polynomial filter and recursive matrix-vector evaluation (Section 4) are the same computational structure as ChebNet (Defferrard et al. 2016), and the spectral-filter toolkit on Hodge Laplacians is developed in topological signal processing works (Schaub et al.; Barbarossa and Sardellitti) that directly precede the paper's filter formalism.
- The polynomial-moment Betti bound (Section 4, TC4) requires α < 2/λ_max for all positive eigenvalues of the ambient operator, but no spectral bound on λ_max is provided or checked for the soft/ambient Hodge Laplacians used in experiments, leaving the bound's precondition unverified in practice.
- The bibliography omits two foundational references directly implied by the paper's technical content: a Hodge Laplacian on graphs reference (e.g., Lim, SIAM Review 2020) and a stochastic trace estimation reference (e.g., Hutchinson 1989/1990 or Avron and Toledo 2011), despite both being standard citations for the techniques the paper builds on.
- The runtime cost of the spectral approach (17.5× slower than PH at n=100 with dense matrix operations) is a substantial practical limitation; no scalable implementation via sparse operations or stochastic trace estimation is demonstrated, making the computational route to larger problems currently speculative.

## Revision Targets

- [ ] **Manuscript: Section 6.5 (Combination with Graph Feature Loss), Table 5, Figure 13**
  - Location: `corrections/2606.25194/paper.tex` at `Section 6.5 (Combination with Graph Feature Loss), Table 5, Figure 13`
  - Evidence: Comparative empirical claim, code-amenable field, no shipped artifact. Although five seeds are used (a strength relative to other experiments), the result depends on the same averaged-hard-sampling evaluation and an unspecified relative weighting of the two losses; neither the weighting nor the sampling can be verified without the code.
  - Required change: Ship experiments/joint_objective/run.py including the loss-weighting (lambda_topo), seed handling, and the variance/Betti evaluation, reproducing Table 5.
  - Verification: Re-review should confirm `Section 6.5 (Combination with Graph Feature Loss), Table 5, Figure 13` is corrected or justified.
- [ ] **Manuscript: Section 5.5 (Pairing Instability Stress Test), Figure 5**
  - Location: `corrections/2606.25194/paper.tex` at `Section 5.5 (Pairing Instability Stress Test), Figure 5`
  - Evidence: The paper's own numbers show the RAW maximum derivative jump is LARGER for the Hodge loss (15.8489) than for PH (1.1773); the 'smoother' conclusion holds only after dividing each loss by its own range (PH 11.2194 vs Hodge 1.6137). The favorable conclusion is therefore an artifact of a self-chosen, loss-specific normalization rather than an intrinsic smoothness advantage; the result is sensitive to the normalization choice and is presented from a single configuration with no shipped code.
  - Required change: Report a normalization-invariant smoothness measure (e.g. relative Lipschitz constant or curvature of the optimization trajectory), justify the normalization, and ship experiments/figure5/pairing_stress.py reproducing both raw and normalized derivative jumps.
  - Verification: Re-review should confirm `Section 5.5 (Pairing Instability Stress Test), Figure 5` is corrected or justified.
- [ ] **Bibliography: Convolutional Neural Networks on Graphs with Fast Localized Spectral Filtering (ChebNet, Deff...**
  - Location: bibliography entry: `Convolutional Neural Networks on Graphs with Fast Localized Spectral Filtering (ChebNet, Defferrard et al. 2016)`
  - Evidence: The paper's Chebyshev polynomial filter and its recursive evaluation via matrix-vector products is a direct and well-known technique from graph signal processing (ChebNet). The connection to this line of work is not cited, even though the computational route is essentially the same and the motivation (avoiding full eigendecomposition) is identical.
  - Required change: Add or discuss missing prior art `Convolutional Neural Networks on Graphs with Fast Localized Spectral Filtering (ChebNet, Defferrard et al. 2016)`. The paper's Chebyshev polynomial filter and its recursive evaluation via matrix-vector products is a direct and well-known technique from graph signal processing (ChebNet). The connection to this line of work is not cited, even though the computational route is essentially the same and the motivation (avoiding full eigendecomposition) is identical.
  - Verification: Re-review should confirm the related-work discussion addresses this prior art.
- [ ] **Manuscript: Section 4 (Trace-Type loss) and Section 6.2 (Laplacian Moments and Normalized Betti Numbers)**
  - Location: `corrections/2606.25194/paper.tex` at `Section 4 (Trace-Type loss) and Section 6.2 (Laplacian Moments and Normalized Betti Numbers)`
  - Evidence: The algebra is correct given the stated hypothesis. The hypothesis rho<1 is non-trivial: it requires 0 < alpha lambda_i < 2 for every positive eigenvalue, i.e. alpha < 2/lambda_max; otherwise (1-alpha lambda)^d can grow in magnitude. The paper acknowledges that alpha and d must be coordinated with the spectral scaling, but provides no a priori bound on lambda_max for the soft/ambient operators actually used, so the precondition is assumed rather than guaranteed in the experiments.
  - Required change: State and verify a spectral bound (e.g. Gershgorin/largest-eigenvalue estimate) ensuring alpha < 2/lambda_max for the operators used, and provide a script that checks rho<1 per run, e.g. experiments/spectral_scaling_check.py.
  - Verification: Re-review should confirm `Section 4 (Trace-Type loss) and Section 6.2 (Laplacian Moments and Normalized Betti Numbers)` is corrected or justified.
- [ ] **Bibliography: Stochastic trace estimation (e.g., Hutchinson 1989/1990 or a modern survey)**
  - Location: bibliography entry: `Stochastic trace estimation (e.g., Hutchinson 1989/1990 or a modern survey)`
  - Evidence: The paper explicitly discusses trace-type Betti surrogates such as Tr(I - αL)^d and identifies connections to stochastic trace estimation. No foundational trace estimator reference (e.g., Hutchinson 1990 or Avron & Toledo 2011) is visible in the bibliography, despite the paper positioning trace estimation as a key computational route.
  - Required change: Add a bibliography entry for `Stochastic trace estimation (e.g., Hutchinson 1989/1990 or a modern survey)` and cite it where the affected method or claim is introduced, or explicitly justify its omission.
  - Verification: Re-review should confirm the bibliography and citation context address this reference.
- [ ] **Bibliography: Stochastic trace estimation (e.g., Hutchinson 1989/1990 or a modern survey)**
  - Location: bibliography entry: `Stochastic trace estimation (e.g., Hutchinson 1989/1990 or a modern survey)`
  - Evidence: The paper explicitly discusses trace-type Betti surrogates such as Tr(I - αL)^d and identifies connections to stochastic trace estimation. No foundational trace estimator reference (e.g., Hutchinson 1990 or Avron & Toledo 2011) is visible in the bibliography, despite the paper positioning trace estimation as a key computational route.
  - Required change: Add a bibliography entry for `Stochastic trace estimation (e.g., Hutchinson 1989/1990 or a modern survey)` and cite it where the affected method or claim is introduced, or explicitly justify its omission.
  - Verification: Re-review should confirm the bibliography and citation context address this reference.

## Open Questions

- Can the authors release a public repository with executable scripts reproducing all figures and tables—including fixed random seeds, data generation code, optimizer settings, filter hyperparameters (α, d, temperature/epsilon), and evaluation protocols—so that the headline empirical claims (gradient localization, shape synthesis, Betti loss optimization) can be independently verified?
- For the pairing-instability comparison (Section 5.5, Figure 5): why is per-loss normalization by loss-range the appropriate smoothness measure when the raw Hodge jump (15.8489) exceeds the raw PH jump (1.1773)? Would a normalization-invariant measure such as a relative Lipschitz constant or curvature of the optimization trajectory over the same parameter interval change the conclusion?
- How does the proposed Chebyshev/polynomial filter formalism (Section 4) differ technically from ChebNet (Defferrard et al. 2016) and from topological signal processing on simplicial complexes (Schaub et al.; Barbarossa and Sardellitti)? If the computational route is the same, the paper should characterize its novelty as the application to topology optimization rather than the filter formalism itself.
- For the polynomial-moment Betti bound: how is α chosen to satisfy α < 2/λ_max for the soft/ambient operators in experiments, and how sensitive are the Betti-control results (Tables 3–4) to the choice of α and polynomial degree d near this boundary?
- The Gyurik et al. quantum reference has a citation-key mismatch: the in-text key @gyurik2022towards differs in year and key from the bibliography entry gyurik2024quantum; are these two distinct works by overlapping authors, and if so, are both present in the full bibliography with distinct keys?
- What is the per-target soft-target s̄₁* selection rule in Section 6.5? The paper acknowledges there is no analytic conversion from a desired hard β₁ to a soft surrogate target, but the experimental results in Tables 3–4 depend on a manual choice that is not described reproducibly.

## Per-Agent Reviews

### citation (`sonnet[1m]`) — status: `warn`

```json
{
  "confidence": 0.62,
  "entries": [
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Edelsbrunner",
          "Letscher",
          "Zomorodian"
        ],
        "doi": null,
        "key": "edelsbrunner2002topological",
        "raw": "title=Topological persistence and simplification, author=Edelsbrunner and Letscher and Zomorodian, journal=Discrete \\& computational geometry, volume=28, number=4, pages=511--533, year=2002, publisher=Springer",
        "title": "Topological persistence and simplification",
        "url": null,
        "venue": "Discrete & Computational Geometry",
        "year": 2002
      },
      "exists": null,
      "explanation": "Seminal paper introducing topological persistence; cited repeatedly as the foundational reference for persistent homology, which the paper's spectral-surrogate framework is designed to complement.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Zomorodian, Afra",
          "Carlsson, Gunnar"
        ],
        "doi": null,
        "key": "zomorodian2004computing",
        "raw": "title=Computing persistent homology, author=Zomorodian, Afra and Carlsson, Gunnar, booktitle=Proceedings of the twentieth annual symposium on Computational geometry, pages=347--356, year=2004",
        "title": "Computing persistent homology",
        "url": null,
        "venue": "Proceedings of the Annual Symposium on Computational Geometry",
        "year": 2004
      },
      "exists": null,
      "explanation": "Foundational algorithm for computing persistent homology via boundary-matrix reduction; correctly cited alongside the other core PH papers as background for the methods the paper builds upon.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Cohen-Steiner, David",
          "Edelsbrunner, Herbert",
          "Harer, John"
        ],
        "doi": null,
        "key": "cohen2005stability",
        "raw": "title=Stability of persistence diagrams, author=Cohen-Steiner, David and Edelsbrunner, Herbert and Harer, John, booktitle=Proceedings of the twenty-first annual symposium on Computational geometry, pages=263--271, year=2005",
        "title": "Stability of persistence diagrams",
        "url": null,
        "venue": "Proceedings of the Annual Symposium on Computational Geometry",
        "year": 2005
      },
      "exists": null,
      "explanation": "Establishes the bottleneck stability of persistence diagrams under perturbations; its context is directly relevant when the paper distinguishes descriptor uses (where stability matters) from optimization uses.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Edelsbrunner, Herbert",
          "Harer, John"
        ],
        "doi": null,
        "key": "edelsbrunner2008persistent",
        "raw": "title=Persistent homology-a survey, author=Edelsbrunner, Herbert and Harer, John and others, journal=Contemporary mathematics, volume=453, number=26, pages=257--282, year=2008, publisher=Providence, RI: American Mathematical Society",
        "title": "Persistent homology-a survey",
        "url": null,
        "venue": "Contemporary Mathematics",
        "year": 2008
      },
      "exists": null,
      "explanation": "Survey of persistent homology cited as standard background; appropriate and high-relevance reference for the PH fundamentals described in the Preliminaries section.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Otter, Nina",
          "Porter, Mason A",
          "Tillmann, Ulrike",
          "Grindrod, Peter",
          "Harrington, Heather A"
        ],
        "doi": null,
        "key": "otter2017roadmap",
        "raw": "title=A roadmap for the computation of persistent homology, author=Otter, Nina and Porter, Mason A and Tillmann, Ulrike and Grindrod, Peter and Harrington, Heather A, journal=EPJ data science, volume=6, number=1, pages=17, year=2017, publisher=Springer",
        "title": "A roadmap for the computation of persistent homology",
        "url": null,
        "venue": "EPJ Data Science",
        "year": 2017
      },
      "exists": null,
      "explanation": "Comprehensive survey of algorithms and software for persistent homology; cited appropriately to orient readers unfamiliar with the computational side of TDA.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Obayashi, Ippei",
          "Nakamura, Takenobu",
          "Hiraoka, Yasuaki"
        ],
        "doi": null,
        "key": "obayashi2022persistent",
        "raw": "title=Persistent homology analysis for materials research and persistent homology software: HomCloud, author=Obayashi, Ippei and Nakamura, Takenobu and Hiraoka, Yasuaki, journal=journal of the physical society of japan, volume=91, number=9, pages=091013, year=2022, publisher=The Physical Society of Japan",
        "title": "Persistent homology analysis for materials research and persistent homology software: HomCloud",
        "url": null,
        "venue": "Journal of the Physical Society of Japan",
        "year": 2022
      },
      "exists": null,
      "explanation": "Materials-science-focused PH software paper; if cited in truncated sections it would serve as a domain-application example, but its connection to the paper's spectral optimization framework is tenuous.",
      "notes": "Not cited in visible citation contexts; appears only in the bibliography. Its relevance is peripheral—it describes a materials-science TDA software tool rather than addressing optimization or spectral methods.",
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Nakamura, Takenobu",
          "Hiraoka, Yasuaki",
          "Hirata, Akihiko",
          "Escolar, Emerson G",
          "Nishiura, Yasumasa"
        ],
        "doi": null,
        "key": "nakamura2015persistent",
        "raw": "title=Persistent homology and many-body atomic structure for medium-range order in the glass, author=Nakamura, Takenobu and Hiraoka, Yasuaki and Hirata, Akihiko and Escolar, Emerson G and Nishiura, Yasumasa, journal=Nanotechnology, volume=26, number=30, pages=304001, year=2015, publisher=IOP Publishing",
        "title": "Persistent homology and many-body atomic structure for medium-range order in the glass",
        "url": null,
        "venue": "Nanotechnology",
        "year": 2015
      },
      "exists": null,
      "explanation": "Application of persistent homology to atomic glass structure; only marginally connected to the optimization and spectral surrogate framework developed in this paper.",
      "notes": "Materials science application of PH not cited in visible text; appears peripheral to the paper's mathematical optimization focus.",
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Hiraoka, Yasuaki",
          "Nakamura, Takenobu",
          "Hirata, Akihiko",
          "Escolar, Emerson G",
          "Matsue, Kaname",
          "Nishiura, Yasumasa"
        ],
        "doi": null,
        "key": "hiraoka2016hierarchical",
        "raw": "title=Hierarchical structures of amorphous solids characterized by persistent homology, author=Hiraoka, Yasuaki and Nakamura, Takenobu and Hirata, Akihiko and Escolar, Emerson G and Matsue, Kaname and Nishiura, Yasumasa, journal=Proceedings of the National Academy of Sciences, volume=113, number=26, pages=7035--7040, year=2016, publisher=National Academy of Sciences",
        "title": "Hierarchical structures of amorphous solids characterized by persistent homology",
        "url": null,
        "venue": "Proceedings of the National Academy of Sciences",
        "year": 2016
      },
      "exists": null,
      "explanation": "PNAS study using PH to characterize amorphous solids; while it demonstrates PH utility, it is not directly connected to the spectral optimization contributions of this paper.",
      "notes": "Materials science application not cited in visible text; possibly included to motivate real-world TDA applications.",
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Moor, Michael",
          "Horn, Max",
          "Rieck, Bastian",
          "Borgwardt, Karsten"
        ],
        "doi": null,
        "key": "moor2020topological",
        "raw": "title=Topological autoencoders, author=Moor, Michael and Horn, Max and Rieck, Bastian and Borgwardt, Karsten, booktitle=International conference on machine learning, pages=7045--7054, year=2020, organization=PMLR",
        "title": "Topological autoencoders",
        "url": null,
        "venue": "ICML (PMLR)",
        "year": 2020
      },
      "exists": null,
      "explanation": "Introduces topology-regularized autoencoders using persistent homology as a loss; directly cited as a representative example of topology used prescriptively (controlled rather than only observed) in deep learning.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2110.09193",
        "authors": [
          "Vandaele, Robin",
          "Kang, Bo",
          "Lijffijt, Jefrey",
          "De Bie, Tijl",
          "Saeys, Yvan"
        ],
        "doi": null,
        "key": "vandaele2021topologically",
        "raw": "title=Topologically regularized data embeddings, author=Vandaele, Robin and Kang, Bo and Lijffijt, Jefrey and De Bie, Tijl and Saeys, Yvan, journal=arXiv preprint arXiv:2110.09193, year=2021",
        "title": "Topologically regularized data embeddings",
        "url": null,
        "venue": "arXiv preprint",
        "year": 2021
      },
      "exists": null,
      "explanation": "Uses topological regularization for embedding quality; cited as an example of prescriptive topology in optimization, supporting the paper's motivating context.",
      "notes": "Cited as arXiv preprint; may remain unpublished in a peer-reviewed venue as of the paper's writing.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Gabrielsson, Rickard Brüel",
          "Nelson, Bradley J",
          "Dwaraknath, Anjan",
          "Skraba, Primoz"
        ],
        "doi": null,
        "key": "gabrielsson2020topology",
        "raw": "title=A topology layer for machine learning, author=Gabrielsson, Rickard Br\\\"uel and Nelson, Bradley J and Dwaraknath, Anjan and Skraba, Primoz, booktitle=International Conference on Artificial Intelligence and Statistics, pages=1553--1563, year=2020, organization=PMLR",
        "title": "A topology layer for machine learning",
        "url": null,
        "venue": "AISTATS (PMLR)",
        "year": 2020
      },
      "exists": null,
      "explanation": "Introduces a differentiable topology layer based on persistent homology for integration into ML pipelines; directly in scope as a prior approach to topology-as-loss-function that the present paper's spectral surrogates are designed to complement.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Hofer, Christoph",
          "Graf, Florian",
          "Rieck, Bastian",
          "Niethammer, Marc",
          "Kwitt, Roland"
        ],
        "doi": null,
        "key": "hofer2020graph",
        "raw": "title=Graph filtration learning, author=Hofer, Christoph and Graf, Florian and Rieck, Bastian and Niethammer, Marc and Kwitt, Roland, booktitle=International Conference on Machine Learning, pages=4314--4323, year=2020, organization=PMLR",
        "title": "Graph filtration learning",
        "url": null,
        "venue": "ICML (PMLR)",
        "year": 2020
      },
      "exists": null,
      "explanation": "Learns filtration functions on graphs for topological ML tasks; related to the paper's graph clique complex setting but not cited in the visible portions of text.",
      "notes": "Not cited in visible citation contexts; may appear in truncated sections on graph learning.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Adams, Henry",
          "Emerson, Tegan",
          "Kirby, Michael",
          "Neville, Rachel",
          "Peterson, Chris",
          "Shipman, Patrick",
          "Chepushtanova, Sofya",
          "Hanson, Eric",
          "Motta, Francis",
          "Ziegelmeier, Lori"
        ],
        "doi": null,
        "key": "adams2017persistence",
        "raw": "title=Persistence images: A stable vector representation of persistent homology, author=Adams, Henry and Emerson, Tegan and Kirby, Michael and Neville, Rachel and Peterson, Chris and Shipman, Patrick and Chepushtanova, Sofya and Hanson, Eric and Motta, Francis and Ziegelmeier, Lori, journal=Journal of Machine Learning Research, volume=18, number=8, pages=1--35, year=2017",
        "title": "Persistence images: A stable vector representation of persistent homology",
        "url": null,
        "venue": "Journal of Machine Learning Research",
        "year": 2017
      },
      "exists": null,
      "explanation": "Persistence images provide a stable, vectorized representation of PH for ML; cited as a canonical topological descriptor feature, contextualizing the descriptive (vs. prescriptive) use of topology.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Hofer, Christoph",
          "Kwitt, Roland",
          "Niethammer, Marc",
          "Uhl, Andreas"
        ],
        "doi": null,
        "key": "hofer2017deep",
        "raw": "title=Deep learning with topological signatures, author=Hofer, Christoph and Kwitt, Roland and Niethammer, Marc and Uhl, Andreas, journal=Advances in neural information processing systems, volume=30, year=2017",
        "title": "Deep learning with topological signatures",
        "url": null,
        "venue": "Advances in Neural Information Processing Systems",
        "year": 2017
      },
      "exists": null,
      "explanation": "Pioneers the use of topological signatures as differentiable inputs to deep networks; cited appropriately as a representative ML pipeline using topological features.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Bubenik, Peter"
        ],
        "doi": null,
        "key": "bubenik2020persistence",
        "raw": "title=The persistence landscape and some of its properties, author=Bubenik, Peter, booktitle=Topological Data Analysis: The Abel Symposium 2018, pages=97--117, year=2020, organization=Springer",
        "title": "The persistence landscape and some of its properties",
        "url": null,
        "venue": "Topological Data Analysis: The Abel Symposium 2018 (Springer)",
        "year": 2020
      },
      "exists": null,
      "explanation": "Defines the persistence landscape, a functional representation of barcodes amenable to statistical analysis; cited as a topological feature for ML pipelines, supporting the descriptive background context.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Chazal, Frédéric",
          "Fasy, Brittany Terese",
          "Lecci, Fabrizio",
          "Rinaldo, Alessandro",
          "Wasserman, Larry"
        ],
        "doi": null,
        "key": "chazal2014stochastic",
        "raw": "title=Stochastic convergence of persistence landscapes and silhouettes, author=Chazal, Fr\\'ed\\'eric and Fasy, Brittany Terese and Lecci, Fabrizio and Rinaldo, Alessandro and Wasserman, Larry, booktitle=Proceedings of the thirtieth annual symposium on Computational geometry, pages=474--483, year=2014",
        "title": "Stochastic convergence of persistence landscapes and silhouettes",
        "url": null,
        "venue": "Proceedings of the Annual Symposium on Computational Geometry",
        "year": 2014
      },
      "exists": null,
      "explanation": "Establishes statistical convergence of persistence landscapes; cited as a background reference for statistical TDA descriptors in ML, contextually appropriate but not directly tied to spectral optimization.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Kališnik, Sara"
        ],
        "doi": null,
        "key": "kalivsnik2019tropical",
        "raw": "title=Tropical coordinates on the space of persistence barcodes, author=Kali\\vsnik, Sara, journal=Foundations of Computational Mathematics, volume=19, number=1, pages=101--129, year=2019, publisher=Springer",
        "title": "Tropical coordinates on the space of persistence barcodes",
        "url": null,
        "venue": "Foundations of Computational Mathematics",
        "year": 2019
      },
      "exists": null,
      "explanation": "Introduces tropical polynomial coordinates on barcode space; cited as a topological descriptor in the ML-feature survey context, but only peripherally related to spectral optimization.",
      "notes": null,
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Cohen-Steiner, David",
          "Edelsbrunner, Herbert",
          "Morozov, Dmitriy"
        ],
        "doi": null,
        "key": "cohen2006vines",
        "raw": "title=Vines and vineyards by updating persistence in linear time, author=Cohen-Steiner, David and Edelsbrunner, Herbert and Morozov, Dmitriy, booktitle=Proceedings of the twenty-second annual symposium on Computational geometry, pages=119--126, year=2006",
        "title": "Vines and vineyards by updating persistence in linear time",
        "url": null,
        "venue": "Proceedings of the Annual Symposium on Computational Geometry",
        "year": 2006
      },
      "exists": null,
      "explanation": "Introduces vineyards for tracking persistence pairings under 1-parameter families; relevant to the paper's discussion of pairing changes causing gradient discontinuities.",
      "notes": "Not cited in visible text; likely cited in truncated sections discussing parameter-dependent persistence.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Chambers, Erin W",
          "Fillmore, Christopher",
          "Stephenson, Elizabeth",
          "Wintraecken, Mathijs"
        ],
        "doi": null,
        "key": "chambers2026braiding",
        "raw": "title=Braiding vineyards, author=Chambers, Erin W and Fillmore, Christopher and Stephenson, Elizabeth and Wintraecken, Mathijs, booktitle=Proceedings of the 2026 Annual ACM-SIAM Symposium on Discrete Algorithms (SODA), pages=6240--6263, year=2026, organization=SIAM",
        "title": "Braiding vineyards",
        "url": null,
        "venue": "SODA 2026 (SIAM)",
        "year": 2026
      },
      "exists": null,
      "explanation": "Extension of vineyards to braided tracking of persistence pairings; peripheral to the paper's spectral surrogate contributions but may appear in truncated sections on parametric persistence.",
      "notes": "Publication year 2026 is contemporary with the paper's preparation; verify final publication details are correct, as SODA 2026 proceedings may have been in press during manuscript submission. Not cited in visible citation contexts.",
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2210.05124",
        "authors": [
          "Hickok, Abigail"
        ],
        "doi": null,
        "key": "hickok2022persistence",
        "raw": "title=Persistence diagram bundles: A multidimensional generalization of vineyards, author=Hickok, Abigail, journal=arXiv preprint arXiv:2210.05124, year=2022",
        "title": "Persistence diagram bundles: A multidimensional generalization of vineyards",
        "url": null,
        "venue": "arXiv preprint",
        "year": 2022
      },
      "exists": null,
      "explanation": "Multidimensional generalization of vineyards; loosely related to parameter-varying persistence, but not directly connected to the paper's Hodge-spectral optimization framework.",
      "notes": "arXiv preprint; peer-review status unknown. Not cited in visible text.",
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2210.06424",
        "authors": [
          "Hickok, Abigail"
        ],
        "doi": null,
        "key": "hickok2022computing",
        "raw": "title=Computing persistence diagram bundles, author=Hickok, Abigail, journal=arXiv preprint arXiv:2210.06424, year=2022",
        "title": "Computing persistence diagram bundles",
        "url": null,
        "venue": "arXiv preprint",
        "year": 2022
      },
      "exists": null,
      "explanation": "Algorithmic companion to persistence diagram bundles; peripheral to the paper's main spectral optimization contributions.",
      "notes": "arXiv preprint; peer-review status unknown. Not cited in visible text.",
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Mémoli, Facundo",
          "Wan, Zhengchao",
          "Wang, Yusu"
        ],
        "doi": null,
        "key": "memoli2022persistent",
        "raw": "title=Persistent Laplacians: Properties, algorithms and implications, author=M\\'emoli, Facundo and Wan, Zhengchao and Wang, Yusu, journal=SIAM Journal on Mathematics of Data Science, volume=4, number=2, pages=858--884, year=2022, publisher=SIAM",
        "title": "Persistent Laplacians: Properties, algorithms and implications",
        "url": null,
        "venue": "SIAM Journal on Mathematics of Data Science",
        "year": 2022
      },
      "exists": null,
      "explanation": "Introduces persistent Laplacians and studies their spectral properties; directly related to the paper's ambient Hodge-Laplacian relaxation and Betti-number-via-null-space approach.",
      "notes": "Not cited in visible text contexts; almost certainly cited in the technical construction sections that are truncated. This is a key predecessor for Laplacian-based topological methods.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Wei, Xiaoqi",
          "Wei, Guo-Wei"
        ],
        "doi": null,
        "key": "wei2025persistent",
        "raw": "title=Persistent topological laplacians—a survey, author=Wei, Xiaoqi and Wei, Guo-Wei, journal=Mathematics, volume=13, number=2, pages=208, year=2025, publisher=MDPI",
        "title": "Persistent topological Laplacians—a survey",
        "url": null,
        "venue": "Mathematics (MDPI)",
        "year": 2025
      },
      "exists": null,
      "explanation": "Survey of persistent topological Laplacians; directly covers the intersection of Hodge Laplacians and persistent topology that the paper builds on. Appropriate and relevant citation.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Ameneyro, Bernardo",
          "Maroulas, Vasileios",
          "Siopsis, George"
        ],
        "doi": null,
        "key": "ameneyro2024quantum",
        "raw": "title=Quantum persistent homology, author=Ameneyro, Bernardo and Maroulas, Vasileios and Siopsis, George, journal=Journal of Applied and Computational Topology, volume=8, number=7, pages=1961--1980, year=2024, publisher=Springer",
        "title": "Quantum persistent homology",
        "url": null,
        "venue": "Journal of Applied and Computational Topology",
        "year": 2024
      },
      "exists": null,
      "explanation": "Develops quantum algorithms for computing persistent homology; related to the paper's discussion of quantum trace estimation as a possible future direction for Betti number computation.",
      "notes": "Not cited in visible contexts; likely in truncated quantum-connection discussion.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Hayakawa, Ryu"
        ],
        "doi": null,
        "key": "hayakawa2022quantum",
        "raw": "title=Quantum algorithm for persistent Betti numbers and topological data analysis, author=Hayakawa, Ryu, journal=Quantum, volume=6, pages=873, year=2022, publisher=Verein zur F\\\"orderung des Open Access Publizierens in den Quantenwissenschaften",
        "title": "Quantum algorithm for persistent Betti numbers and topological data analysis",
        "url": null,
        "venue": "Quantum",
        "year": 2022
      },
      "exists": null,
      "explanation": "Quantum algorithm for computing persistent Betti numbers; relevant to the paper's mention of quantum trace estimation connections for Betti numbers.",
      "notes": "Not cited in visible text; likely in truncated quantum section.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2410.21258",
        "authors": [
          "Gyurik, Casper",
          "Schmidhuber, Alexander",
          "King, Robbie",
          "Dunjko, Vedran",
          "Hayakawa, Ryu"
        ],
        "doi": null,
        "key": "gyurik2024quantum",
        "raw": "title=Quantum computing and persistence in topological data analysis, author=Gyurik, Casper and Schmidhuber, Alexander and King, Robbie and Dunjko, Vedran and Hayakawa, Ryu, journal=arXiv preprint arXiv:2410.21258, year=2024",
        "title": "Quantum computing and persistence in topological data analysis",
        "url": null,
        "venue": "arXiv preprint",
        "year": 2024
      },
      "exists": null,
      "explanation": "Quantum computing approaches to persistence in TDA; directly in scope of the paper's quantum trace estimation discussion, though the in-text citation key mismatch with the bibliography entry warrants verification.",
      "notes": "The visible text cites '@gyurik2022towards', which appears to be a different key (and different year) from this 'gyurik2024quantum' entry. The cited key '@gyurik2022towards' is likely among the 11 omitted bibliography entries, suggesting this is a distinct companion or predecessor work. Authors partially overlap; verify both keys are present and correctly distinct.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Vipond, Oliver"
        ],
        "doi": null,
        "key": "vipond2020multiparameter",
        "raw": "title=Multiparameter persistence landscapes, author=Vipond, Oliver, journal=Journal of Machine Learning Research, volume=21, number=61, pages=1--38, year=2020",
        "title": "Multiparameter persistence landscapes",
        "url": null,
        "venue": "Journal of Machine Learning Research",
        "year": 2020
      },
      "exists": null,
      "explanation": "Extends persistence landscapes to multiparameter persistence; the paper does not treat multiparameter persistence as a primary topic, making this citation peripheral.",
      "notes": "Not cited in visible text; relevance is peripheral since the paper focuses on single-parameter settings.",
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Oudot, Steve",
          "Scoccola, Luis"
        ],
        "doi": null,
        "key": "oudot2024stability",
        "raw": "title=On the stability of multigraded Betti numbers and Hilbert functions, author=Oudot, Steve and Scoccola, Luis, journal=SIAM Journal on Applied Algebra and Geometry, volume=8, number=1, pages=54--88, year=2024, publisher=SIAM",
        "title": "On the stability of multigraded Betti numbers and Hilbert functions",
        "url": null,
        "venue": "SIAM Journal on Applied Algebra and Geometry",
        "year": 2024
      },
      "exists": null,
      "explanation": "Stability theory for multigraded Betti numbers; only tangentially connected to the single-parameter Hodge spectral optimization framework presented.",
      "notes": "Not cited in visible text; multigraded Betti numbers are not the paper's focus.",
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "1512.00180",
        "authors": [
          "Lesnick, Michael",
          "Wright, Matthew"
        ],
        "doi": null,
        "key": "lesnick2015interactive",
        "raw": "title=Interactive visualization of 2-d persistence modules, author=Lesnick, Michael and Wright, Matthew, journal=arXiv preprint arXiv:1512.00180, year=2015",
        "title": "Interactive visualization of 2-d persistence modules",
        "url": null,
        "venue": "arXiv preprint",
        "year": 2015
      },
      "exists": null,
      "explanation": "Interactive tool for visualizing 2D persistence modules; not directly relevant to the spectral surrogate framework, likely included as a multiparameter persistence background reference.",
      "notes": "arXiv preprint; not cited in visible text. Visualization tool for 2D persistence, peripheral to spectral optimization.",
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Carlsson, Gunnar",
          "Zomorodian, Afra"
        ],
        "doi": null,
        "key": "carlsson2007theory",
        "raw": "title=The theory of multidimensional persistence, author=Carlsson, Gunnar and Zomorodian, Afra, booktitle=Proceedings of the twenty-third annual symposium on Computational geometry, pages=184--193, year=2007",
        "title": "The theory of multidimensional persistence",
        "url": null,
        "venue": "Proceedings of the Annual Symposium on Computational Geometry",
        "year": 2007
      },
      "exists": null,
      "explanation": "Foundational theory for multiparameter persistence; not a primary focus of this paper and not cited in visible contexts.",
      "notes": "Not cited in visible text; the paper does not develop multiparameter persistence theory.",
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Carlsson, Gunnar",
          "De Silva, Vin"
        ],
        "doi": null,
        "key": "carlsson2010zigzag",
        "raw": "title=Zigzag persistence, author=Carlsson, Gunnar and De Silva, Vin, journal=Foundations of computational mathematics, volume=10, number=4, pages=367--405, year=2010, publisher=Springer",
        "title": "Zigzag persistence",
        "url": null,
        "venue": "Foundations of Computational Mathematics",
        "year": 2010
      },
      "exists": null,
      "explanation": "Extends persistence to non-monotone filtrations; not directly used or cited in the visible portions of this paper, likely background context for the TDA literature survey.",
      "notes": "Not cited in visible text; zigzag persistence is not used in this paper.",
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Lloyd, Seth",
          "Garnerone, Silvano",
          "Zanardi, Paolo"
        ],
        "doi": null,
        "key": "lloyd2016quantum",
        "raw": "title=Quantum algorithms for topological and geometric analysis of data, author=Lloyd, Seth and Garnerone, Silvano and Zanardi, Paolo, journal=Nature communications, volume=7, number=1, pages=10138, year=2016, publisher=Nature Publishing Group UK London",
        "title": "Quantum algorithms for topological and geometric analysis of data",
        "url": null,
        "venue": "Nature Communications",
        "year": 2016
      },
      "exists": null,
      "explanation": "Proposes quantum algorithms for Betti number estimation via Laplacian null-space computation; explicitly cited in both the Introduction and the graph clique complex section as the primary reference for quantum trace-based Betti estimation, which the paper's polynomial Laplacian moments connect to.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    }
  ],
  "missing_references": [
    {
      "reason": "The paper extensively constructs Hodge-Laplacian-type operators on graphs and clique complexes, but the foundational reference for Hodge Laplacians on graphs (Lim, SIAM Review 2020) does not appear in the shown bibliography. This work defines the combinatorial Hodge Laplacian framework that underpins the paper's technical development and would be a standard citation in this context.",
      "title": "Hodge Laplacians on graphs"
    },
    {
      "reason": "The paper explicitly discusses trace-type Betti surrogates such as Tr(I - αL)^d and identifies connections to stochastic trace estimation. No foundational trace estimator reference (e.g., Hutchinson 1990 or Avron & Toledo 2011) is visible in the bibliography, despite the paper positioning trace estimation as a key computational route.",
      "title": "Stochastic trace estimation (e.g., Hutchinson 1989/1990 or a modern survey)"
    }
  ],
  "summary": "The paper's citation hygiene is generally sound: the core persistent homology literature is cited consistently and appropriately throughout the text, and the references to topology-in-ML works correctly contextualize the prescriptive optimization setting. A potential key-mismatch concern arises for the Gyurik et al. quantum reference: the in-text key '@gyurik2022towards' differs from the bibliography entry 'gyurik2024quantum', suggesting two distinct works by overlapping authors that should be verified for correctness. The bibliography includes several peripheral entries (materials-science PH applications, multiparameter persistence tools) that do not appear in the visible text and inflate the reference list without direct payoff; if they are absent from the truncated sections as well, a cleanup would improve focus. Two notable gaps are the absence of a foundational Hodge-Laplacian-on-graphs reference and a stochastic trace estimation reference, both of which are strongly implied by the paper's technical content."
}
```

### meta_reviewer (`sonnet[1m]`) — status: `pass`

```json
{
  "confidence": 0.82,
  "questions": [
    "Can the authors release a public repository with executable scripts reproducing all figures and tables—including fixed random seeds, data generation code, optimizer settings, filter hyperparameters (α, d, temperature/epsilon), and evaluation protocols—so that the headline empirical claims (gradient localization, shape synthesis, Betti loss optimization) can be independently verified?",
    "For the pairing-instability comparison (Section 5.5, Figure 5): why is per-loss normalization by loss-range the appropriate smoothness measure when the raw Hodge jump (15.8489) exceeds the raw PH jump (1.1773)? Would a normalization-invariant measure such as a relative Lipschitz constant or curvature of the optimization trajectory over the same parameter interval change the conclusion?",
    "How does the proposed Chebyshev/polynomial filter formalism (Section 4) differ technically from ChebNet (Defferrard et al. 2016) and from topological signal processing on simplicial complexes (Schaub et al.; Barbarossa and Sardellitti)? If the computational route is the same, the paper should characterize its novelty as the application to topology optimization rather than the filter formalism itself.",
    "For the polynomial-moment Betti bound: how is α chosen to satisfy α < 2/λ_max for the soft/ambient operators in experiments, and how sensitive are the Betti-control results (Tables 3–4) to the choice of α and polynomial degree d near this boundary?",
    "The Gyurik et al. quantum reference has a citation-key mismatch: the in-text key @gyurik2022towards differs in year and key from the bibliography entry gyurik2024quantum; are these two distinct works by overlapping authors, and if so, are both present in the full bibliography with distinct keys?",
    "What is the per-target soft-target s̄₁* selection rule in Section 6.5? The paper acknowledges there is no analytic conversion from a desired hard β₁ to a soft surrogate target, but the experimental results in Tables 3–4 depend on a manual choice that is not described reproducibly."
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "Comparative empirical claim, code-amenable field, no shipped artifact. Although five seeds are used (a strength relative to other experiments), the result depends on the same averaged-hard-sampling evaluation and an unspecified relative weighting of the two losses; neither the weighting nor the sampling can be verified without the code.",
      "id": "weakness-1",
      "locator": "Section 6.5 (Combination with Graph Feature Loss), Table 5, Figure 13",
      "required_update": "Ship experiments/joint_objective/run.py including the loss-weighting (lambda_topo), seed handling, and the variance/Betti evaluation, reproducing Table 5.",
      "source_path": "corrections/2606.25194/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 6.5 (Combination with Graph Feature Loss), Table 5, Figure 13` is corrected or justified.",
      "weakness_index": 0
    },
    {
      "evidence": "The paper's own numbers show the RAW maximum derivative jump is LARGER for the Hodge loss (15.8489) than for PH (1.1773); the 'smoother' conclusion holds only after dividing each loss by its own range (PH 11.2194 vs Hodge 1.6137). The favorable conclusion is therefore an artifact of a self-chosen, loss-specific normalization rather than an intrinsic smoothness advantage; the result is sensitive to the normalization choice and is presented from a single configuration with no shipped code.",
      "id": "weakness-2",
      "locator": "Section 5.5 (Pairing Instability Stress Test), Figure 5",
      "required_update": "Report a normalization-invariant smoothness measure (e.g. relative Lipschitz constant or curvature of the optimization trajectory), justify the normalization, and ship experiments/figure5/pairing_stress.py reproducing both raw and normalized derivative jumps.",
      "source_path": "corrections/2606.25194/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 5.5 (Pairing Instability Stress Test), Figure 5` is corrected or justified.",
      "weakness_index": 1
    },
    {
      "evidence": "The paper's Chebyshev polynomial filter and its recursive evaluation via matrix-vector products is a direct and well-known technique from graph signal processing (ChebNet). The connection to this line of work is not cited, even though the computational route is essentially the same and the motivation (avoiding full eigendecomposition) is identical.",
      "id": "weakness-3",
      "locator": "Convolutional Neural Networks on Graphs with Fast Localized Spectral Filtering (ChebNet, Defferrard et al. 2016)",
      "required_update": "Add or discuss missing prior art `Convolutional Neural Networks on Graphs with Fast Localized Spectral Filtering (ChebNet, Defferrard et al. 2016)`. The paper's Chebyshev polynomial filter and its recursive evaluation via matrix-vector products is a direct and well-known technique from graph signal processing (ChebNet). The connection to this line of work is not cited, even though the computational route is essentially the same and the motivation (avoiding full eigendecomposition) is identical.",
      "source_path": null,
      "source_role": "novelty",
      "status": "open",
      "target_kind": "bibliography",
      "verification_check": "Re-review should confirm the related-work discussion addresses this prior art.",
      "weakness_index": 2
    },
    {
      "evidence": "The algebra is correct given the stated hypothesis. The hypothesis rho<1 is non-trivial: it requires 0 < alpha lambda_i < 2 for every positive eigenvalue, i.e. alpha < 2/lambda_max; otherwise (1-alpha lambda)^d can grow in magnitude. The paper acknowledges that alpha and d must be coordinated with the spectral scaling, but provides no a priori bound on lambda_max for the soft/ambient operators actually used, so the precondition is assumed rather than guaranteed in the experiments.",
      "id": "weakness-4",
      "locator": "Section 4 (Trace-Type loss) and Section 6.2 (Laplacian Moments and Normalized Betti Numbers)",
      "required_update": "State and verify a spectral bound (e.g. Gershgorin/largest-eigenvalue estimate) ensuring alpha < 2/lambda_max for the operators used, and provide a script that checks rho<1 per run, e.g. experiments/spectral_scaling_check.py.",
      "source_path": "corrections/2606.25194/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 4 (Trace-Type loss) and Section 6.2 (Laplacian Moments and Normalized Betti Numbers)` is corrected or justified.",
      "weakness_index": 3
    },
    {
      "evidence": "The paper explicitly discusses trace-type Betti surrogates such as Tr(I - αL)^d and identifies connections to stochastic trace estimation. No foundational trace estimator reference (e.g., Hutchinson 1990 or Avron & Toledo 2011) is visible in the bibliography, despite the paper positioning trace estimation as a key computational route.",
      "id": "weakness-5",
      "locator": "Stochastic trace estimation (e.g., Hutchinson 1989/1990 or a modern survey)",
      "required_update": "Add a bibliography entry for `Stochastic trace estimation (e.g., Hutchinson 1989/1990 or a modern survey)` and cite it where the affected method or claim is introduced, or explicitly justify its omission.",
      "source_path": null,
      "source_role": "citation",
      "status": "open",
      "target_kind": "bibliography",
      "verification_check": "Re-review should confirm the bibliography and citation context address this reference.",
      "weakness_index": 4
    },
    {
      "evidence": "The paper explicitly discusses trace-type Betti surrogates such as Tr(I - αL)^d and identifies connections to stochastic trace estimation. No foundational trace estimator reference (e.g., Hutchinson 1990 or Avron & Toledo 2011) is visible in the bibliography, despite the paper positioning trace estimation as a key computational route.",
      "id": "weakness-6",
      "locator": "Stochastic trace estimation (e.g., Hutchinson 1989/1990 or a modern survey)",
      "required_update": "Add a bibliography entry for `Stochastic trace estimation (e.g., Hutchinson 1989/1990 or a modern survey)` and cite it where the affected method or claim is introduced, or explicitly justify its omission.",
      "source_path": null,
      "source_role": "citation",
      "status": "open",
      "target_kind": "bibliography",
      "verification_check": "Re-review should confirm the bibliography and citation context address this reference.",
      "weakness_index": 5
    }
  ],
  "strengths": [
    "The Hodge-spectral relaxation framework is theoretically principled: the ambient operator decomposes correctly in the hard limit (Proposition 1), converges in operator norm as soft weights approach hard indicators (Proposition 2), and the trace-type Betti surrogate error is bounded explicitly in terms of the spectral filter's suppression of positive eigenvalues (Proposition 3).",
    "The paper explicitly acknowledges in Remark 1 that soft boundary operators do not satisfy B²=0, correctly scoping all soft-regime results as spectral surrogates rather than exact homological quantities—a significant mathematical-honesty contribution that prevents overclaiming.",
    "The prescriptive framing—topology as an optimization objective rather than a post-hoc descriptor—is clearly articulated and the gradient-localization and pairing-instability motivations for spectral surrogates are well-stated and address a genuine limitation of barcode-based losses.",
    "The connection to quantum trace estimation (Lloyd 2016, Akhalwaya) is correctly identified and positions a computationally viable scaling path via stochastic trace estimation, which is a concrete future direction rather than a vague claim."
  ],
  "summary": "The five specialist reviews converge on a paper with a sound theoretical core but critically inadequate empirical support. The theoretical framework—Propositions 1–3 and Lemma 4—is mostly correct (overall_correctness: mostly_sound): the ambient Hodge-spectral relaxation, hard-limit consistency, soft-weight convergence, and trace-type Betti surrogate are all mathematically coherent. Two minor gaps remain: Proposition 1 lacks a machine-checked proof artifact, and the polynomial-moment Betti bound (TC4) assumes α < 2/λ_max without verifying this precondition for the soft/ambient operators actually used. However, all six load-bearing empirical claims in this code-amenable field (math.AT) are rated unsupported or partially supported at major severity by the technical correctness specialist, uniformly because no executable artifacts accompany the paper (code is 'available from the corresponding author upon reasonable request' only). The reproducibility specialist assigns a score of 0.25 and identifies five independent major concerns covering absent code, absent data generation scripts, underspecified hyperparameters, absent evaluation scripts, and absent machine-checkable proof artifacts. The pairing-instability smoothness advantage (Section 5.5) is presented misleadingly: the raw maximum derivative jump is larger for the Hodge loss (15.8489) than for PH (1.1773); the favorable conclusion holds only under a self-chosen per-loss normalization that is not independently justified. The novelty specialist rates the contribution as incremental (0.52) and identifies unacknowledged connections to graph signal processing prior art (ChebNet, Hammond wavelets, topological signal processing on simplicial complexes) that overlap directly with the paper's computational methodology. The citation specialist flags two missing foundational references (Hodge Laplacians on graphs; stochastic trace estimation) and a potential citation-key mismatch for the Gyurik et al. quantum reference. No specialist identified critical mathematical errors. Per the recommendation gate for code-amenable fields: both the technical correctness and reproducibility specialists flagged absent proof-as-code and experiment artifacts at major severity across multiple headline claims, mandating major_revision.",
  "weaknesses": [
    "All six load-bearing empirical claims—gradient localization (TC7), pairing instability (TC8), shape synthesis (TC9), path-integral estimator convergence (TC10), Betti-loss optimization (TC11), and joint objective control (TC12)—are unsupported at major severity because no executable code or data artifacts are provided; the paper's favorable empirical conclusions cannot be independently verified.",
    "The pairing-instability smoothness advantage (Section 5.5, Figure 5) is presented misleadingly: the raw maximum derivative jump is larger for the Hodge loss (15.8489) than for PH (1.1773), and the favorable conclusion holds only after dividing each loss by its own value range—a loss-specific normalization chosen by the authors that is not independently justified and whose effect on the conclusion is not analyzed.",
    "Critical connections to graph signal processing prior art are absent: the Chebyshev polynomial filter and recursive matrix-vector evaluation (Section 4) are the same computational structure as ChebNet (Defferrard et al. 2016), and the spectral-filter toolkit on Hodge Laplacians is developed in topological signal processing works (Schaub et al.; Barbarossa and Sardellitti) that directly precede the paper's filter formalism.",
    "The polynomial-moment Betti bound (Section 4, TC4) requires α < 2/λ_max for all positive eigenvalues of the ambient operator, but no spectral bound on λ_max is provided or checked for the soft/ambient Hodge Laplacians used in experiments, leaving the bound's precondition unverified in practice.",
    "The bibliography omits two foundational references directly implied by the paper's technical content: a Hodge Laplacian on graphs reference (e.g., Lim, SIAM Review 2020) and a stochastic trace estimation reference (e.g., Hutchinson 1989/1990 or Avron and Toledo 2011), despite both being standard citations for the techniques the paper builds on.",
    "The runtime cost of the spectral approach (17.5× slower than PH at n=100 with dense matrix operations) is a substantial practical limitation; no scalable implementation via sparse operations or stochastic trace estimation is demonstrated, making the computational route to larger problems currently speculative."
  ]
}
```

### novelty (`sonnet[1m]`) — status: `pass`

```json
{
  "confidence": 0.62,
  "missing_prior_art": [
    {
      "reason": "The paper's Chebyshev polynomial filter and its recursive evaluation via matrix-vector products is a direct and well-known technique from graph signal processing (ChebNet). The connection to this line of work is not cited, even though the computational route is essentially the same and the motivation (avoiding full eigendecomposition) is identical.",
      "title": "Convolutional Neural Networks on Graphs with Fast Localized Spectral Filtering (ChebNet, Defferrard et al. 2016)"
    },
    {
      "reason": "The framework of applying spectral filters (heat, polynomial) to graph Laplacians to extract low-frequency structure is foundational in graph signal processing. The present paper applies the same machinery to Hodge Laplacians on simplicial complexes without citing this precedent, leaving a gap in the attribution of spectral-filter methodology.",
      "title": "Wavelets on Graphs via Spectral Graph Theory (Hammond, Vandergheynst, Gribonval 2011)"
    },
    {
      "reason": "Several groups have studied signal processing on simplicial complexes using Hodge Laplacians, including low-pass filtering and spectral representations of edge flows and higher-order signals. These works develop the spectral-filter toolkit on Hodge Laplacians in settings very close to the current paper's and should be acknowledged as prior art for the filter formalism.",
      "title": "Topological Signal Processing over Simplicial Complexes (Barbarossa and Sardellitti / Schaub et al.)"
    },
    {
      "reason": "Practical libraries (Gudhi's TensorFlow/PyTorch bindings, Giotto-TDA) already implement differentiable persistent homology and are actively used for topology-constrained optimization in deep learning. The paper's characterization of barcode-based losses as having limited gradient support should engage with the state of these implementations more concretely.",
      "title": "Differentiable Topology via Gudhi / Giotto-TDA gradient implementations"
    }
  ],
  "novelty_score": 0.52,
  "related_work": [
    {
      "citation_key": "memoli2022persistent",
      "delta": "This paper introduces persistent Laplacians as a family of operators whose spectra encode homological information across filtrations. The present work constructs a soft, differentiable version of the Hodge Laplacian on a fixed ambient chain space—essentially a weighted generalization of this prior framework—and repurposes the spectral structure as a differentiable optimization loss rather than a topological descriptor.",
      "relation": "prior_art",
      "title": "Persistent Laplacians: Properties, algorithms and implications"
    },
    {
      "citation_key": "davies2023persistent",
      "delta": "Davies et al. evaluate persistent Laplacian spectra as features for data science tasks at ICML 2023. The present work overlaps in using Hodge-spectral structure derived from filtrations but focuses on the prescriptive (optimization) setting rather than the descriptive (feature extraction) setting, and introduces soft edge activations to make the construction fully differentiable.",
      "relation": "competing",
      "title": "The persistent Laplacian for data science: Evaluating higher-order persistent spectral representations of data"
    },
    {
      "citation_key": "nigmetov2024topological",
      "delta": "Nigmetov and Morozov directly address gradient localization in persistence-based topology optimization, proposing a method that uses larger optimization steps. The present paper addresses the same limitation (localized, discontinuous gradients) via a fundamentally different mechanism—spectral surrogate losses—rather than modified step-size or pairing strategies.",
      "relation": "competing",
      "title": "Topological optimization with big steps"
    },
    {
      "citation_key": "nigmetov2024topological_2",
      "delta": "Also targets gradient discontinuities and localization in PH-based optimization via persistence-sensitive methods. The present work provides an alternative route using Hodge spectral filters rather than modifying the persistence-based gradient computation, claiming more spatially distributed update directions.",
      "relation": "competing",
      "title": "Topological regularization via persistence-sensitive optimization"
    },
    {
      "citation_key": "moor2020topological",
      "delta": "Introduces differentiable topology control in deep learning via barcode-based losses for autoencoders. The present work takes the same prescriptive goal but replaces barcode losses with Hodge-spectral surrogates to address gradient localization and pairing instability.",
      "relation": "builds_on",
      "title": "Topological autoencoders"
    },
    {
      "citation_key": "gabrielsson2020topology",
      "delta": "Proposes a differentiable topology layer using persistence diagrams embedded in an ML pipeline. The present work addresses identified limitations of such barcode-based layers (gradient localization, pairing discontinuities) by substituting a spectral approach.",
      "relation": "builds_on",
      "title": "A topology layer for machine learning"
    },
    {
      "citation_key": "hofer2020graph",
      "delta": "Introduces learnable filtrations on graphs to make topology differentiable. The present work takes a complementary approach by constructing soft clique complexes from edge logits and using Hodge Laplacian spectra rather than optimizing filtration functions.",
      "relation": "builds_on",
      "title": "Graph filtration learning"
    },
    {
      "citation_key": "akhalwaya2024comparing",
      "delta": "Uses polynomial trace estimation to approximate normalized Betti numbers, the same mathematical form as the paper's Laplacian moment Tr(I−αL)^d. The present paper adapts this trace form as a differentiable loss inside a gradient-based optimization loop rather than as a one-shot estimation procedure.",
      "relation": "prior_art",
      "title": "Comparing quantum and classical Monte Carlo algorithms for estimating Betti numbers of clique complexes"
    },
    {
      "citation_key": "lloyd2016quantum",
      "delta": "Formulates Betti numbers via null-space projection operators on combinatorial Laplacians, establishing the mathematical connection this paper exploits. The present work uses the same spectral-projection viewpoint but in a classical, differentiable optimization context.",
      "relation": "prior_art",
      "title": "Quantum algorithms for topological and geometric analysis of data"
    },
    {
      "citation_key": "hu2019topology",
      "delta": "An early influential application of PH-based topology losses to image segmentation. The present work targets the same class of prescriptive topology control problems but proposes spectral surrogates as an alternative to the barcode losses used here.",
      "relation": "prior_art",
      "title": "Topology-preserving deep image segmentation"
    },
    {
      "citation_key": "clough2020topological",
      "delta": "Establishes barcode-based topological losses for segmentation, a prime motivating application. The present framework offers an alternative loss mechanism that, it is argued, provides more distributed gradients for the same class of tasks.",
      "relation": "prior_art",
      "title": "A topological loss function for deep-learning based image segmentation using persistent homology"
    }
  ],
  "verdict": "incremental"
}
```

### reproducibility (`gpt-5.5`) — status: `pass`

```json
{
  "code_availability": "available_on_request",
  "code_url": null,
  "concerns": [
    {
      "area": "code",
      "description": "The numerical experiment code is only available from the corresponding author upon reasonable request, with no public repository, license, commit, release, scripts, or run instructions. This blocks independent reproduction of the VR point-cloud, graph clique-complex, gradient, and runtime figures without reimplementation.",
      "severity": "major"
    },
    {
      "area": "data",
      "description": "The generated/analyzed datasets are only available on request and no generation scripts, saved random initializations, graph samples, or figure source data are provided publicly.",
      "severity": "major"
    },
    {
      "area": "hyperparameters",
      "description": "Several experiment-critical settings are underspecified, including optimizer, learning rates, number of trials for reported means, random seeds, regularization weights, filter temperatures/epsilons, polynomial moment alpha and degree for graph experiments, scale weights, and graph sampling details.",
      "severity": "major"
    },
    {
      "area": "evaluation",
      "description": "The paper reports numerical values for Betti-profile sums, gradient entropy/top-10% mass, derivative jumps, RMSE, cosine similarity, and runtime, but does not provide executable evaluation scripts or raw result tables needed to verify the calculations exactly.",
      "severity": "major"
    },
    {
      "area": "compute",
      "description": "Runtime comparisons depend on implementation and machine characteristics, but hardware, BLAS/GPU/CPU setup, software versions, and parallelism settings are not specified.",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "The main theoretical claims are supported by paper proofs, but no machine-checkable proof artifacts or symbolic/numerical verification files are provided for the hard-limit consistency, convergence, and trace-approximation propositions.",
      "severity": "major"
    }
  ],
  "confidence": 0.84,
  "data_availability": "synthetic",
  "data_url": null,
  "environment": {
    "dependencies": [],
    "hardware": null,
    "software": null
  },
  "reproducibility_score": 0.25
}
```

### summary (`claude-haiku-4-5`) — status: `pass`

```json
{
  "audience": "Researchers and practitioners in computational topology, topological data analysis, machine learning with geometric constraints, network design, and differential geometry—particularly those seeking to incorporate topology as an optimization objective rather than solely as a post-hoc descriptor.",
  "key_contributions": [
    "Construction of an ambient Hodge-spectral relaxation that recovers the ordinary Hodge Laplacian on active subcomplexes in the hard limit and provides differentiable spectral surrogates in the soft regime.",
    "Definition of differentiable topological loss functions using heat filters, resolvent filters, and polynomial Laplacian moments to control homological structure.",
    "Empirical demonstration that Hodge spectral-filter losses provide more distributed gradients, smoother behavior under pairing changes, and geometry-aware updates compared to persistent-homology-based losses on Vietoris–Rips point-cloud complexes.",
    "Application of Laplacian moments to control normalized first-Betti-type quantities in graph clique complexes, showing integration with ordinary graph-feature objectives.",
    "Discussion of computational trade-offs and identification of polynomial filtering and trace-estimation methods as routes toward scaling to larger problems."
  ],
  "plain_language_summary": "Topological properties—the global shape and connectivity of data—are important for many applications but difficult to control during optimization because they are discrete and combinatorial. This paper proposes a new approach: instead of directly counting topological features like Betti numbers or tracking homology births and deaths, the authors use the spectrum (eigenvalues and eigenmodes) of a Hodge Laplacian operator to create smooth, differentiable approximations of topological information.\n\nThe key innovation is constructing what they call a \"Hodge-spectral relaxation\" that embeds changing simplicial complexes (the mathematical structures representing topology) into a fixed ambient space. In the hard limit, this recovers the exact Hodge Laplacian; in the soft regime, it provides smooth gradients suitable for optimization. They apply this framework to two settings: point clouds via Vietoris–Rips complexes and graphs via clique complexes. The authors show experimentally that their spectral-filter losses produce more spatially distributed gradients and smoother optimization behavior compared to existing persistent-homology-based losses, especially when topology is being optimized rather than merely analyzed.",
  "tldr": "The paper introduces a differentiable framework for optimizing topology by using Hodge-Laplacian spectral filters as smooth surrogates for discrete topological constraints like Betti numbers and persistent homology."
}
```

### technical_correctness (`opus[1m]`) — status: `pass`

```json
{
  "claims": [
    {
      "assessment": "partially_supported",
      "claim": "Proposition 1 (hard-limit consistency): the penalty-regularized hard ambient operator decomposes as L_q^hard(theta) = L_q(K(theta)) ⊕ mu I on the inactive complement, so ker L_q^hard ≅ H_q(K(theta)) and dim ker = beta_q(K(theta)).",
      "evidence": "A complete textual proof is given and is mathematically standard: since K(theta) is closed under faces, B_q Im(Pi_q) ⊆ Im(Pi_{q-1}), the projected boundaries equal the subcomplex boundaries on the active block, the penalty acts as mu I on the inactive block, and the result follows from the finite-dimensional Hodge decomposition. No counterexample is apparent. However, the argument is asserted in prose only and not machine-checked.",
      "id": "TC1",
      "location": "Section 3, Proposition 1 and its proof (Penalty-Regularized Hard Ambient Hodge Laplacian)",
      "severity": "minor",
      "suggested_fix": "Ship a formal proof of the orthogonal decomposition and kernel isomorphism, e.g. src/proofs/Prop1_hard_limit.lean (Lean/mathlib) or an Isabelle theory, verifying B_q Pi_q = Pi_{q-1} B_q Pi_q and the block-diagonal form."
    },
    {
      "assessment": "supported",
      "claim": "Proposition 2: as soft simplex weights w^(m) converge entrywise to hard indicators chi, the relaxation Ĥat_q(w^(m)) converges to L_q^hard(K) in operator norm.",
      "evidence": "The proof is correct: B_q is a fixed finite matrix; W_q(w^(m)) -> Pi_q entrywise and R_q = W_q^{1/2} -> Pi_q entrywise because sqrt is continuous with sqrt(0)=0, sqrt(1)=1; in finite dimension entrywise convergence implies operator-norm convergence, and products/sums of convergent matrices converge. The conclusion follows.",
      "id": "TC2",
      "location": "Section 3, Proposition 2 and proof (Soft Graphs and Hodge-Laplacian-type spectral relaxation)",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Proposition 3: for the ordinary Hodge Laplacian with f(0)=1, |Tr f(L_q(K)) - beta_q(K)| <= (N - beta_q) eps_f where eps_f = max_{i>beta_q} |f(lambda_i)|.",
      "evidence": "Trivially correct: f(L_q) has eigenvalues f(lambda_i); the beta_q zero modes each contribute f(0)=1, and bounding the remaining N-beta_q terms by eps_f via the triangle inequality yields the stated inequality.",
      "id": "TC3",
      "location": "Section 4, Proposition 3 and proof (Trace-Type Spectral-Mass Betti Surrogate Loss)",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Polynomial-moment Betti bound: if rho = max_{lambda_i>0} |1 - alpha lambda_i| < 1 then |Tr(I - alpha L_q)^d - beta_q| <= (N - beta_q) rho^d, hence the normalized moment approximates beta_q/N_q.",
      "evidence": "The algebra is correct given the stated hypothesis. The hypothesis rho<1 is non-trivial: it requires 0 < alpha lambda_i < 2 for every positive eigenvalue, i.e. alpha < 2/lambda_max; otherwise (1-alpha lambda)^d can grow in magnitude. The paper acknowledges that alpha and d must be coordinated with the spectral scaling, but provides no a priori bound on lambda_max for the soft/ambient operators actually used, so the precondition is assumed rather than guaranteed in the experiments.",
      "id": "TC4",
      "location": "Section 4 (Trace-Type loss) and Section 6.2 (Laplacian Moments and Normalized Betti Numbers)",
      "severity": "minor",
      "suggested_fix": "State and verify a spectral bound (e.g. Gershgorin/largest-eigenvalue estimate) ensuring alpha < 2/lambda_max for the operators used, and provide a script that checks rho<1 per run, e.g. experiments/spectral_scaling_check.py."
    },
    {
      "assessment": "supported",
      "claim": "Lemma 4 (ambient-to-ordinary reduction): Tr f_d(Ĥat_q) = Tr f_d(L_q(K)) + N_q^inactive (1-alpha mu)^d, and when |1-alpha mu| is small both the forward moment and the inactive-block filter derivative are negligible (alpha mu ≈ 1).",
      "evidence": "Given the assumed hard-limit block decomposition Ĥat_q = L_q(K) ⊕ mu I_inactive, the trace is additive over blocks and each inactive eigenvalue mu contributes (1-alpha mu)^d; the derivative f_d'(mu) = -alpha d (1-alpha mu)^{d-1} is correct. The conclusion is an immediate consequence and is internally consistent.",
      "id": "TC5",
      "location": "Section 6.3, Lemma 4 (Relation to the Ambient Formulation)",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Remark 1: in the soft regime the weighted operators Btilde_q = R_{q-1} B_q R_q do not generally satisfy Btilde_{q-1} Btilde_q = 0, so they are not boundary maps of an exact chain complex and the homological interpretation holds only in the hard limit.",
      "evidence": "This is a correct and important honesty caveat: the diagonal reweighting breaks the B^2=0 identity in general, so the 'surrogate' framing is mathematically appropriate. This correctly scopes all soft-regime claims as spectral surrogates rather than exact Betti representations.",
      "id": "TC6",
      "location": "Section 3, Remark 1 (Soft weighted boundaries)",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "unsupported",
      "claim": "Headline empirical claim: Hodge spectral-filter losses yield more spatially distributed gradients than PH losses (PH gradient entropy 1.3863 and top-10% mass 0.5000 vs Hodge heat 2.4623/0.2049 and Hodge resolvent 2.4740/0.2018).",
      "evidence": "math.AT is a code-amenable field and this is a load-bearing comparative claim, but no executable artifact is shipped (Code Availability states code is only 'available from the corresponding author upon reasonable request'). The metrics are single-point-estimates with no seeds/error bars or dataset specification, and PH top-10% mass = 0.5000 with entropy 1.3863 = ln(4) suggests a tiny or special configuration that is not described reproducibly.",
      "id": "TC7",
      "location": "Section 5.3 (Gradient Localization), Figures 2-3",
      "severity": "major",
      "suggested_fix": "Ship the experiment, e.g. experiments/figure3/gradient_localization.py with fixed seeds, the point-cloud generator, and a script reproducing the entropy/top-10%-mass numbers across multiple seeds with error bars."
    },
    {
      "assessment": "partially_supported",
      "claim": "Pairing-instability claim: the Hodge interval loss is smoother than the PH loss under persistence-pairing switches.",
      "evidence": "The paper's own numbers show the RAW maximum derivative jump is LARGER for the Hodge loss (15.8489) than for PH (1.1773); the 'smoother' conclusion holds only after dividing each loss by its own range (PH 11.2194 vs Hodge 1.6137). The favorable conclusion is therefore an artifact of a self-chosen, loss-specific normalization rather than an intrinsic smoothness advantage; the result is sensitive to the normalization choice and is presented from a single configuration with no shipped code.",
      "id": "TC8",
      "location": "Section 5.5 (Pairing Instability Stress Test), Figure 5",
      "severity": "major",
      "suggested_fix": "Report a normalization-invariant smoothness measure (e.g. relative Lipschitz constant or curvature of the optimization trajectory), justify the normalization, and ship experiments/figure5/pairing_stress.py reproducing both raw and normalized derivative jumps."
    },
    {
      "assessment": "unsupported",
      "claim": "Shape-synthesis claim: Hodge gradients recover the target wavy-ring shape better than PH (final RMSE PH 0.1504±0.0172, Hodge heat 0.0324±0.0092, resolvent 0.0224±0.0054; first-update cosine similarity PH -0.2156, heat 0.2143, resolvent 0.8311).",
      "evidence": "Load-bearing empirical comparison in a code-amenable field with no shipped artifact (code 'upon request'). The PH cosine similarity being negative (-0.2156) is a strong claim that the PH gradient points away from the target deformation; without the code, the target-direction definition, the PH loss variant, and the radial parameterization cannot be verified, and the comparison may be sensitive to these undisclosed choices.",
      "id": "TC9",
      "location": "Section 5.6 (Shape Synthesis by Analytic Gradients), Figures 6-7",
      "severity": "major",
      "suggested_fix": "Ship experiments/figure6/shape_synthesis.py including the target wavy-ring specification, the PH baseline loss definition, seeds, and the RMSE/cosine-similarity computation."
    },
    {
      "assessment": "unsupported",
      "claim": "Path-integral (stochastic) estimator converges to the exact trace-gradient Tr(M^{d-1} C_u) as N_MC increases (mean absolute error 1.2014, 0.4782, 0.6399, 0.2626, 0.1518 for N_MC = 100, 300, 1000, 3000, 10000).",
      "evidence": "Code-amenable field, no shipped artifact. The reported error sequence is non-monotonic (it increases from 0.4782 at N_MC=300 to 0.6399 at N_MC=1000), which the paper attributes to Monte Carlo variance but supports with only a single small example (n=8, d=6) and no variance bars or repeated trials at each N_MC, so the claimed O(1/sqrt(N)) convergence trend is asserted rather than demonstrated.",
      "id": "TC10",
      "location": "Section 6.5 (Convergence of the Path-Integral Estimator), Figure 9, Table 2",
      "severity": "major",
      "suggested_fix": "Ship src/estimators/path_integral.py plus a convergence harness that averages the MAE over many independent repetitions per N_MC and overlays the expected 1/sqrt(N_MC) rate."
    },
    {
      "assessment": "unsupported",
      "claim": "Soft spectral-moment Betti loss controls the sampled hard normalized Betti number toward prescribed hard targets (e.g. single target 0.10 -> sampled mean 0.1014; multi-target table errors 0.0132/0.0053/0.0173/0.0001 for targets 0.02/0.05/0.10/0.20).",
      "evidence": "Central empirical claim of Section 6 with no shipped code in a code-amenable field. The methodology relies on evaluating an AVERAGE over sampled hard graphs while a single thresholded graph gives hard beta_1 = 0.0 (acknowledged in text), so the favorable agreement depends on the sampling-and-averaging evaluation choice and on per-target hand-tuned soft targets s-bar_1* for which the paper explicitly provides no conversion rule. Without code, the sampling procedure, number of samples, and target selection cannot be reproduced or audited.",
      "id": "TC11",
      "location": "Section 6.5 (Convergence of Betti Loss Optimization; Topology-Controlled Graph Generation), Tables 3-4, Figures 10-12",
      "severity": "major",
      "suggested_fix": "Ship experiments/graph_betti/run.py covering the soft optimization, the hard-graph sampling/evaluation (with sample count and seeds), and the per-target s-bar_1* selection procedure, so the target->soft-target mapping and averaged hard beta_1 can be reproduced."
    },
    {
      "assessment": "unsupported",
      "claim": "Joint optimization claim: adding the Betti loss to a degree-variance objective preserves hard beta_1 near 0.10 (joint ~0.1088-0.1125) while a variance-only baseline drifts to ~0.16, without degrading degree-variance control.",
      "evidence": "Comparative empirical claim, code-amenable field, no shipped artifact. Although five seeds are used (a strength relative to other experiments), the result depends on the same averaged-hard-sampling evaluation and an unspecified relative weighting of the two losses; neither the weighting nor the sampling can be verified without the code.",
      "id": "TC12",
      "location": "Section 6.5 (Combination with Graph Feature Loss), Table 5, Figure 13",
      "severity": "major",
      "suggested_fix": "Ship experiments/joint_objective/run.py including the loss-weighting (lambda_topo), seed handling, and the variance/Betti evaluation, reproducing Table 5."
    },
    {
      "assessment": "partially_supported",
      "claim": "Runtime/scaling claim: at n=100 one gradient step costs PH 3.4515 s, Hodge heat 60.4083 s (≈17.5x), Hodge resolvent 43.5290 s (≈12.6x) using dense matrix operations.",
      "evidence": "This is an honestly reported limitation rather than a positive claim, and the stated slowdown factors are internally arithmetic-consistent (60.4083/3.4515 ≈ 17.5, 43.5290/3.4515 ≈ 12.6). It remains hardware- and implementation-dependent and unreproducible without code, but it weakens rather than inflates the paper's case, so the severity is low.",
      "id": "TC13",
      "location": "Section 5.7 (Runtime Comparison), Figure 8",
      "severity": "minor",
      "suggested_fix": "Ship benchmarks/runtime_scaling.py reporting hardware, timing methodology (warmup/repeats), and the per-n measurements."
    }
  ],
  "confidence": 0.7,
  "overall_correctness": "mostly_sound"
}
```

## Corrections

<!-- corrections-section: rendered from corrections table; empty on first publish -->
_No corrections have been recorded._

## Bibliography

1. edelsbrunner2002topological: title=Topological persistence and simplification, author=Edelsbrunner and Letscher and Zomorodian, journal=Discrete \& computational geometry, volume=28, number=4, pages=511--533, year=2002, publisher=Springer
2. zomorodian2004computing: title=Computing persistent homology, author=Zomorodian, Afra and Carlsson, Gunnar, booktitle=Proceedings of the twentieth annual symposium on Computational geometry, pages=347--356, year=2004
3. cohen2005stability: title=Stability of persistence diagrams, author=Cohen-Steiner, David and Edelsbrunner, Herbert and Harer, John, booktitle=Proceedings of the twenty-first annual symposium on Computational geometry, pages=263--271, year=2005
4. edelsbrunner2008persistent: title=Persistent homology-a survey, author=Edelsbrunner, Herbert and Harer, John and others, journal=Contemporary mathematics, volume=453, number=26, pages=257--282, year=2008, publisher=Providence, RI: American Mathematical Society
5. otter2017roadmap: title=A roadmap for the computation of persistent homology, author=Otter, Nina and Porter, Mason A and Tillmann, Ulrike and Grindrod, Peter and Harrington, Heather A, journal=EPJ data science, volume=6, number=1, pages=17, year=2017, publisher=Springer
6. obayashi2022persistent: title=Persistent homology analysis for materials research and persistent homology software: HomCloud, author=Obayashi, Ippei and Nakamura, Takenobu and Hiraoka, Yasuaki, journal=journal of the physical society of japan, volume=91, number=9, pages=091013, year=2022, publisher=The Physical Society of Japan
7. nakamura2015persistent: title=Persistent homology and many-body atomic structure for medium-range order in the glass, author=Nakamura, Takenobu and Hiraoka, Yasuaki and Hirata, Akihiko and Escolar, Emerson G and Nishiura, Yasumasa, journal=Nanotechnology, volume=26, number=30, pages=304001, year=2015, publisher=IOP Publishing
8. hiraoka2016hierarchical: title=Hierarchical structures of amorphous solids characterized by persistent homology, author=Hiraoka, Yasuaki and Nakamura, Takenobu and Hirata, Akihiko and Escolar, Emerson G and Matsue, Kaname and Nishiura, Yasumasa, journal=Proceedings of the National Academy of Sciences, volume=113, number=26, pages=7035--7040, year=2016, publisher=National Academy of Sciences
9. moor2020topological: title=Topological autoencoders, author=Moor, Michael and Horn, Max and Rieck, Bastian and Borgwardt, Karsten, booktitle=International conference on machine learning, pages=7045--7054, year=2020, organization=PMLR
10. vandaele2021topologically: title=Topologically regularized data embeddings, author=Vandaele, Robin and Kang, Bo and Lijffijt, Jefrey and De Bie, Tijl and Saeys, Yvan, journal=arXiv preprint arXiv:2110.09193, year=2021 arXiv:[2110.09193](https://arxiv.org/abs/2110.09193)
11. gabrielsson2020topology: title=A topology layer for machine learning, author=Gabrielsson, Rickard Br\"uel and Nelson, Bradley J and Dwaraknath, Anjan and Skraba, Primoz, booktitle=International Conference on Artificial Intelligence and Statistics, pages=1553--1563, year=2020, organization=PMLR
12. hofer2020graph: title=Graph filtration learning, author=Hofer, Christoph and Graf, Florian and Rieck, Bastian and Niethammer, Marc and Kwitt, Roland, booktitle=International Conference on Machine Learning, pages=4314--4323, year=2020, organization=PMLR
13. adams2017persistence: title=Persistence images: A stable vector representation of persistent homology, author=Adams, Henry and Emerson, Tegan and Kirby, Michael and Neville, Rachel and Peterson, Chris and Shipman, Patrick and Chepushtanova, Sofya and Hanson, Eric and Motta, Francis and Ziegelmeier, Lori, journal=Journal of Machine Learning Research, volume=18, number=8, pages=1--35, year=2017
14. hofer2017deep: title=Deep learning with topological signatures, author=Hofer, Christoph and Kwitt, Roland and Niethammer, Marc and Uhl, Andreas, journal=Advances in neural information processing systems, volume=30, year=2017
15. bubenik2020persistence: title=The persistence landscape and some of its properties, author=Bubenik, Peter, booktitle=Topological Data Analysis: The Abel Symposium 2018, pages=97--117, year=2020, organization=Springer
16. chazal2014stochastic: title=Stochastic convergence of persistence landscapes and silhouettes, author=Chazal, Fr\'ed\'eric and Fasy, Brittany Terese and Lecci, Fabrizio and Rinaldo, Alessandro and Wasserman, Larry, booktitle=Proceedings of the thirtieth annual symposium on Computational geometry, pages=474--483, year=2014
17. kalivsnik2019tropical: title=Tropical coordinates on the space of persistence barcodes, author=Kali\vsnik, Sara, journal=Foundations of Computational Mathematics, volume=19, number=1, pages=101--129, year=2019, publisher=Springer
18. cohen2006vines: title=Vines and vineyards by updating persistence in linear time, author=Cohen-Steiner, David and Edelsbrunner, Herbert and Morozov, Dmitriy, booktitle=Proceedings of the twenty-second annual symposium on Computational geometry, pages=119--126, year=2006
19. chambers2026braiding: title=Braiding vineyards, author=Chambers, Erin W and Fillmore, Christopher and Stephenson, Elizabeth and Wintraecken, Mathijs, booktitle=Proceedings of the 2026 Annual ACM-SIAM Symposium on Discrete Algorithms (SODA), pages=6240--6263, year=2026, organization=SIAM
20. hickok2022persistence: title=Persistence diagram bundles: A multidimensional generalization of vineyards, author=Hickok, Abigail, journal=arXiv preprint arXiv:2210.05124, year=2022 arXiv:[2210.05124](https://arxiv.org/abs/2210.05124)
21. hickok2022computing: title=Computing persistence diagram bundles, author=Hickok, Abigail, journal=arXiv preprint arXiv:2210.06424, year=2022 arXiv:[2210.06424](https://arxiv.org/abs/2210.06424)
22. memoli2022persistent: title=Persistent Laplacians: Properties, algorithms and implications, author=M\'emoli, Facundo and Wan, Zhengchao and Wang, Yusu, journal=SIAM Journal on Mathematics of Data Science, volume=4, number=2, pages=858--884, year=2022, publisher=SIAM
23. wei2025persistent: title=Persistent topological laplacians—a survey, author=Wei, Xiaoqi and Wei, Guo-Wei, journal=Mathematics, volume=13, number=2, pages=208, year=2025, publisher=MDPI
24. ameneyro2024quantum: title=Quantum persistent homology, author=Ameneyro, Bernardo and Maroulas, Vasileios and Siopsis, George, journal=Journal of Applied and Computational Topology, volume=8, number=7, pages=1961--1980, year=2024, publisher=Springer
25. hayakawa2022quantum: title=Quantum algorithm for persistent Betti numbers and topological data analysis, author=Hayakawa, Ryu, journal=Quantum, volume=6, pages=873, year=2022, publisher=Verein zur F\"orderung des Open Access Publizierens in den Quantenwissenschaften
26. gyurik2024quantum: title=Quantum computing and persistence in topological data analysis, author=Gyurik, Casper and Schmidhuber, Alexander and King, Robbie and Dunjko, Vedran and Hayakawa, Ryu, journal=arXiv preprint arXiv:2410.21258, year=2024 arXiv:[2410.21258](https://arxiv.org/abs/2410.21258)
27. vipond2020multiparameter: title=Multiparameter persistence landscapes, author=Vipond, Oliver, journal=Journal of Machine Learning Research, volume=21, number=61, pages=1--38, year=2020
28. oudot2024stability: title=On the stability of multigraded Betti numbers and Hilbert functions, author=Oudot, Steve and Scoccola, Luis, journal=SIAM Journal on Applied Algebra and Geometry, volume=8, number=1, pages=54--88, year=2024, publisher=SIAM
29. lesnick2015interactive: title=Interactive visualization of 2-d persistence modules, author=Lesnick, Michael and Wright, Matthew, journal=arXiv preprint arXiv:1512.00180, year=2015 arXiv:[1512.00180](https://arxiv.org/abs/1512.00180)
30. carlsson2007theory: title=The theory of multidimensional persistence, author=Carlsson, Gunnar and Zomorodian, Afra, booktitle=Proceedings of the twenty-third annual symposium on Computational geometry, pages=184--193, year=2007
31. carlsson2010zigzag: title=Zigzag persistence, author=Carlsson, Gunnar and De Silva, Vin, journal=Foundations of computational mathematics, volume=10, number=4, pages=367--405, year=2010, publisher=Springer
32. lloyd2016quantum: title=Quantum algorithms for topological and geometric analysis of data, author=Lloyd, Seth and Garnerone, Silvano and Zanardi, Paolo, journal=Nature communications, volume=7, number=1, pages=10138, year=2016, publisher=Nature Publishing Group UK London
33. hayakawa2025computational: title=Computational complexity of Berry phase estimation in topological phases of matter, author=Hayakawa, Ryu and Sakamoto, Kazuki and Kiumi, Chusei, journal=arXiv preprint arXiv:2509.13423, year=2025 arXiv:[2509.13423](https://arxiv.org/abs/2509.13423)
34. mootz2026efficient: title=Efficient Berry phase calculation via adaptive variational quantum computing approach, author=Mootz, Martin and Yao, Yong-Xin, journal=APL Quantum, volume=3, number=1, year=2026, publisher=AIP Publishing
35. akhalwaya2024comparing: title=Comparing quantum and classical Monte Carlo algorithms for estimating Betti numbers of clique complexes, author=Akhalwaya, Ismail Yunus and Bhayat, Ahmed and Connolly, Adam and Herbert, Steven and Horesh, Lior and Sorci, Julien and Ubaru, Shashanka, journal=arXiv preprint arXiv:2408.16934, year=2024 arXiv:[2408.16934](https://arxiv.org/abs/2408.16934)
36. gyurik2022towards: title=Towards quantum advantage via topological data analysis, author=Gyurik, Casper and Cade, Chris and Dunjko, Vedran, journal=Quantum, volume=6, pages=855, year=2022, publisher=Verein zur F\"orderung des Open Access Publizierens in den Quantenwissenschaften
37. yamauchi2025quantum: title=Quantum spectroscopy of topological dynamics via a supersymmetric Hamiltonian, author=Yamauchi, Hiroshi and Kanno, Satoshi and Sato, Yuki and Tezuka, Hiroyuki and Shimada, Yoshi-aki and Kaminishi, Eriko and Yamamoto, Naoki, journal=arXiv preprint arXiv:2511.23169, year=2025 arXiv:[2511.23169](https://arxiv.org/abs/2511.23169)
38. nigmetov2024topological: title=Topological optimization with big steps, author=Nigmetov, Arnur and Morozov, Dmitriy, journal=Discrete \& computational geometry, volume=72, number=1, pages=310--344, year=2024, publisher=Springer
39. nigmetov2024topological_2: title=Topological regularization via persistence-sensitive optimization, author=Nigmetov, Arnur and Krishnapriyan, Aditi and Sanderson, Nicole and Morozov, Dmitriy, journal=Computational Geometry, volume=120, pages=102086, year=2024, publisher=Elsevier
40. davies2023persistent: title=The persistent Laplacian for data science: Evaluating higher-order persistent spectral representations of data, author=Davies, Thomas and Wan, Zhengchao and Sanchez-Garcia, Ruben J, booktitle=International Conference on Machine Learning, pages=7249--7263, year=2023, organization=PMLR
41. charlier2019phom: title=PHom-GeM: Persistent homology for generative models, author=Charlier, Jeremy and State, Radu and Hilger, Jean, booktitle=2019 6th Swiss Conference on Data Science (SDS), pages=87--92, year=2019, organization=IEEE
42. hu2019topology: title=Topology-preserving deep image segmentation, author=Hu, Xiaoling and Li, Fuxin and Samaras, Dimitris and Chen, Chao, journal=Advances in neural information processing systems, volume=32, year=2019
43. clough2020topological: title=A topological loss function for deep-learning based image segmentation using persistent homology, author=Clough, James R and Byrne, Nicholas and Oksuz, Ilkay and Zimmer, Veronika A and Schnabel, Julia A and King, Andrew P, journal=IEEE transactions on pattern analysis and machine intelligence, volume=44, number=12, pages=8766--8778, year=2020, publisher=IEEE

