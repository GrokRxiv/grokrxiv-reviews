# Rapid mixing for Gibbs measures in Riemannian manifolds

GrokRxiv review of [arXiv:2606.13453](https://arxiv.org/abs/2606.13453) · `math-ph`

_Authors_: Ángela Capel, Marco Castrillón-López, Sofyan Iblisdir, Angelo Lucia, Pablo Páez-Velasco, David Pérez-García

## TL;DR

The paper establishes polynomial-in-dimension mixing-time guarantees for Langevin dynamics on Riemannian manifolds under conditions on curvature, energy landscape geometry, and symmetry, with a central technical innovation using Riemannian submersions to factor out Lie group symmetries and lift Poincaré inequalities from quotient base spaces to total spaces. The novelty specialist rates the contribution significant (0.75/1.0) with high confidence (0.90), and the citation specialist finds strong hygiene (0.95). The technical correctness specialist rates the paper mostly_sound but with low confidence (0.55), identifying three major gaps: C1 (headline poly-dim mixing claim supported structurally but unverified computationally), C10 (computational reproducibility of §7 examples entirely unsupported), and implicitly through the unsupported assessment on claim C10 that no executable or formal artifact exists. The reproducibility specialist corroborates these gaps with three independent major concerns — no public repository, no machine-checkable proof artifact, and asymptotic-only instantiation of constants — yielding a reproducibility score of 0.46. No disagreement exists among specialists about the theoretical framing; the split is between the strong novelty and citation assessments and the weak reproducibility and (conditional) technical correctness assessments. The paper's field (math.PR/math.DG/math-ph) is code-amenable; because both technical_correctness (C1, C10 at major severity) and reproducibility (three major concerns) flag missing proof-as-code artifacts for the headline quantitative claims, the recommendation gate defaults to major_revision. Two missing foundational citations (Holley-Stroock 1986; O'Neill 1966) are noted by the citation specialist but do not affect the recommendation.

_Recommendation_: **Major revision** · _Confidence_: 78%

## Strengths

- The Riemannian-submersion lifting strategy elegantly reduces the hard problem of multiple global minima to a quotient manifold with a unique minimum, then lifts Poincaré inequalities back — a conceptually clean and reusable technique.
- The multi-step proof architecture (Lyapunov-function Poincaré on the base following Li-Erdogdu 2023, submersion lifting, Bakry-Émery upgrade to LSI, TV-distance decay via Pinsker) is internally consistent and cites well-established classical inputs correctly.
- The novelty specialist finds no missing prior art and assigns a significant verdict (0.75) with high confidence, confirming the contribution meaningfully extends beyond Li-Erdogdu 2023 to a general class of symmetric Riemannian manifolds.
- Citation hygiene is high (confidence 0.95): authoritative monographs are used for geometric and stochastic background, the primary methodological predecessor is correctly identified, and application-specific references demonstrate genuine interdisciplinary reach.
- The self-contained treatment of Riemannian geometry, Sobolev spaces, and SDEs, together with concrete worked examples (trace-ratio on Stiefel/Grassmann, mean-field Ising), makes the theoretical results accessible and verifiable in principle.

## Weaknesses

- No simulation code, numerical experiment, or formal proof artifact is provided to empirically confirm that mixing times and log-Sobolev constants scale polynomially in dim(M) on the §7 examples; both technical_correctness (C1, C10 at major severity) and reproducibility (concerns 1–3 at major severity) flag this as the primary gap, making the headline quantitative claim (Theorem 14) only structurally plausible rather than computationally verified.
- Reproducibility is critically low (score 0.46): no public repository, no license, no machine-checkable proof artifact (e.g., proofs/main_results.lean), and the key constants β and mixing-time exponents are given only as asymptotic polynomial dependencies on geometric parameters rather than concrete values for any reproducible instance.
- The polynomial-in-dimension scaling of β (Remark 16) is explicitly conditional on all auxiliary geometric parameters (injectivity radius, convexity radius, curvature bounds, etc.) scaling polynomially in dim(M), but this is not verified for the §7 worked examples; the degradation of 1/i(M) and 1/conv(M) on some natural families could break the conclusion.
- The Hessian kernel regularity condition implicit in Assumption 9-10 — that ker(∇²F(x)) coincides with the vertical subspace ker(dπ|_x) at the minimum fiber — is presented as a consequence of submersion calculus but is a non-trivial additional hypothesis on F that need not hold for generic G-invariant smooth functions and should be stated explicitly.
- Two foundational citations are absent: Holley and Stroock (1986), which provides the original perturbation lemma underpinning the defective-to-tight LSI argument, and O'Neill (1966), the seminal source for the fundamental submersion equations used throughout Sections 3 and 5.

## Revision Targets

- [ ] **Manuscript: reproducibility appendix**
  - Location: `reproducibility appendix`
  - Evidence: The headline log-Sobolev rapid-mixing theorem and Gibbs concentration theorem are supported by conventional paper proofs but no machine-checkable proof artifact such as proofs/main_results.lean or proofs/submersion_lifting.lean is provided.
  - Required change: Add a reproducibility note that resolves this concern: The headline log-Sobolev rapid-mixing theorem and Gibbs concentration theorem are supported by conventional paper proofs but no machine-checkable proof artifact such as proofs/main_results.lean or proofs/submersion_lifting.lean is provided.
  - Verification: Re-review should confirm the reproducibility concern is addressed with a concrete artifact or manuscript update.
- [ ] **Experiment configuration**
  - Location: `boundaries/calendars` at `experiment configuration`
  - Evidence: The quantitative reproduction target is not fully instantiated: beta and the mixing constants are specified through asymptotic polynomial dependencies on geometric constants rather than concrete values for a reproducible instance.
  - Required change: Publish the exact experiment configuration: random seeds, candidate grids, fold boundaries/calendars, initialization policy, package versions, top-k choices, and penalty settings.
  - Verification: Re-review should confirm exact seeds, grids, folds, package versions, and configuration choices are specified.
- [ ] **Manuscript: Section 1.1, Remark 16**
  - Location: `Section 1.1, Remark 16`
  - Evidence: The remark is conditional: it explicitly assumes polynomial scaling of all auxiliary constants. The conclusion then follows immediately from Theorem 14. The substantive question — whether these geometric parameters actually scale polynomially in dim for naturally arising families (e.g., products of spheres, Stiefel/Grassmann manifolds, the trace-ratio example) — is left to the §7 case studies and is not verified in general. Notably, 1/i(M) and 1/conv(M) can degrade with dimension on some natural families, which would break the conclusion.
  - Required change: Add a table in §7 enumerating, for each worked example, the asymptotic scaling of i(M), conv(M), R_M, diam(M), K, λ*, D, C_{F̃} in dim(M), and verify the resulting polynomial β bound; or run a numerical sweep experiments/parameter_scaling.py reporting empirical scalings.
  - Verification: Re-review should confirm `Section 1.1, Remark 16` is corrected or justified.
- [ ] **Manuscript: Section 1.1, Remark 11 and cited Proposition 168**
  - Location: `Section 1.1, Remark 11 and cited Proposition 168`
  - Evidence: The identification of non-zero eigenvalues of ∇²F̃ with eigenvalues of ∇²F restricted to the horizontal space follows from the submersion calculus when F is constant on fibers, and is consistent with O'Neill's tensors. However, condition (ii) implicitly requires that ker(∇²F(x)) coincides with the vertical subspace at minima of F̃; this is a non-trivial regularity assumption that should be stated as a hypothesis on F rather than a consequence, since generic G-invariant smooth F need not satisfy it.
  - Required change: State Remark 11 as a sufficient condition that itself requires checking ker(∇²F(x)) = ker(dπ|_x) at minima, and discuss whether this is automatic for G-invariant Morse–Bott functions on principal G-bundles; provide a small worked example (e.g., the trace ratio §7) where this equality is verified explicitly.
  - Verification: Re-review should confirm `Section 1.1, Remark 11 and cited Proposition 168` is corrected or justified.
- [ ] **Bibliography: Holley, R., & Stroock, D. W. (1986). Logarithmic Sobolev inequalities and simulated annealing.**
  - Location: bibliography entry: `Holley, R., & Stroock, D. W. (1986). Logarithmic Sobolev inequalities and simulated annealing.`
  - Evidence: Holley and Stroock (1986) provided the original perturbation lemma for log-Sobolev inequalities, which is the foundational basis for the 'defective LSI to tight LSI' arguments mentioned in the paper.
  - Required change: Add a bibliography entry for `Holley, R., & Stroock, D. W. (1986). Logarithmic Sobolev inequalities and simulated annealing` and cite it where the affected method or claim is introduced, or explicitly justify its omission.
  - Verification: Re-review should confirm the bibliography and citation context address this reference.

## Open Questions

- For the trace-ratio example on the complex Stiefel manifold (§7), what are the closed-form or asymptotic scalings in (n,m) of i(M), conv(M), R_M, diam(M), K, A_2, and λ*, and do these confirm that the resulting β threshold from Theorem 14 is genuinely polynomial in dim(M) = 2m(n-m)?
- Can the authors provide at minimum a small-scale numerical experiment — e.g., running the discretized Langevin diffusion on the trace-ratio problem for m=2 and n=3..10 — reporting empirical TV distance to the Gibbs measure and fitting an empirical mixing time, to check whether the polynomial prediction is consistent with simulation?
- Is the condition ker(∇²F(x)) = ker(dπ|_x) at fibers above the minimum x* automatically satisfied for G-invariant Morse-Bott functions on principal G-bundles, or does it require a separate structural assumption; can the authors verify it explicitly for the trace-ratio example?
- For the mean-field 2D ferromagnetic Ising example, what is the precise compact Riemannian manifold M and Lie group G, and does F on M satisfy all of Assumptions 1-10, particularly the escape-direction condition (Assumption 9) and the injectivity-radius lower bound needed for ε_max in Theorem 15?

## Per-Agent Reviews

### citation (`gemini-3-flash-preview`) — status: `warn`

```json
{
  "confidence": 0.95,
  "entries": [
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Dominique Bakry",
          "Franck Barthe",
          "Patrick Cattiaux",
          "Arnaud Guillin"
        ],
        "doi": "10.1214/ECP.v13-1352",
        "key": "Bakry2008",
        "raw": "Bakry2008: author = Dominique Bakry and Franck Barthe and Patrick Cattiaux and Arnaud Guillin, title = A simple proof of the Poincaré inequality for a large class of probability measures, volume = 13, journal = Electronic Communications in Probability, publisher = Institute of Mathematical Statistics and Bernoulli Society, pages = 60 -- 66, keywords = log-concave measure, Lyapunov functions, Poincaré inequality, year = 2008, doi = 10.1214/ECP.v13-1352, URL = https://doi.org/10.1214/ECP.v13-1352",
        "title": "A simple proof of the Poincaré inequality for a large class of probability measures",
        "url": "https://doi.org/10.1214/ECP.v13-1352",
        "venue": "Electronic Communications in Probability",
        "year": 2008
      },
      "exists": null,
      "explanation": "Standard reference for Poincaré inequalities using Lyapunov functions, cited to support the claim that LSI implies Poincaré.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Michael Creutz"
        ],
        "doi": null,
        "key": "Creutz_2023",
        "raw": "Creutz_2023: place=Cambridge, series=Cambridge Monographs on Mathematical Physics, title=Quarks, Gluons and Lattices, publisher=Cambridge University Press, author=Creutz, Michael, year=2023, collection=Cambridge Monographs on Mathematical Physics",
        "title": "Quarks, Gluons and Lattices",
        "url": null,
        "venue": "Cambridge University Press",
        "year": 2023
      },
      "exists": null,
      "explanation": "Motivation for Gibbs sampling in high-energy physics and lattice gauge theory.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "0465.53032",
        "authors": [
          "Christopher B. Croke"
        ],
        "doi": "10.24033/asens.1390",
        "key": "Croke1980",
        "raw": "Croke1980: author = Croke, Christopher B., title = Some isoperimetric inequalities and eigenvalue estimates, journal = Annales scientifiques de l'\\'Ecole Normale Sup\\'erieure, pages = 419--435, publisher = Elsevier, volume = Ser. 4, 13, number = 4, year = 1980, doi = 10.24033/asens.1390, zbl = 0465.53032, url = http://www.numdam.org/articles/10.24033/asens.1390/",
        "title": "Some isoperimetric inequalities and eigenvalue estimates",
        "url": "http://www.numdam.org/articles/10.24033/asens.1390/",
        "venue": "Annales scientifiques de l'École Normale Supérieure",
        "year": 1980
      },
      "exists": null,
      "explanation": "Used for lower bounds on volumes of geodesic balls in compact manifolds, supporting the suboptimality analysis.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "F. Verstraete",
          "D. Porras",
          "J. I. Cirac"
        ],
        "doi": "10.1103/PhysRevLett.93.227205",
        "key": "DMRGFrank",
        "raw": "DMRGFrank: title = Density Matrix Renormalization Group and Periodic Boundary Conditions: A Quantum Information Perspective, author = Verstraete, F. and Porras, D. and Cirac, J. I., journal = Phys. Rev. Lett., volume = 93, issue = 22, pages = 227205, numpages = 4, year = 2004, publisher = American Physical Society, doi = 10.1103/PhysRevLett.93.227205, url = https://link.aps.org/doi/10.1103/PhysRevLett.93.227205",
        "title": "Density Matrix Renormalization Group and Periodic Boundary Conditions: A Quantum Information Perspective",
        "url": "https://link.aps.org/doi/10.1103/PhysRevLett.93.227205",
        "venue": "Phys. Rev. Lett.",
        "year": 2004
      },
      "exists": null,
      "explanation": "Cited as an application of sampling problems in quantum information theory.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Mufan Li",
          "Murat A. Erdogdu"
        ],
        "doi": null,
        "key": "LiErd2022",
        "raw": "LiErd2022: title=Riemannian Langevin algorithm for solving semidefinite programs, author=Li, Mufan and Erdogdu, Murat A, journal=Bernoulli, volume=29, number=4, pages=3093--3113, year=2023, publisher=Bernoulli Society for Mathematical Statistics and Probability",
        "title": "Riemannian Langevin algorithm for solving semidefinite programs",
        "url": null,
        "venue": "Bernoulli",
        "year": 2023
      },
      "exists": null,
      "explanation": "Primary predecessor paper; provides the proof strategy for Poincaré inequalities and rapid mixing that this work generalizes to broader manifold classes.",
      "notes": "The paper uses the citation key 'LiErd2022' for the 2023 Bernoulli publication.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "D. Bakry",
          "I. Gentil",
          "M. Ledoux"
        ],
        "doi": null,
        "key": "bakry2013analysis",
        "raw": "bakry2013analysis: title=Analysis and Geometry of Markov Diffusion Operators, author=Bakry, D. and Gentil, I. and Ledoux, M., isbn=9783319002279, lccn=2013952461, series=Grundlehren der mathematischen Wissenschaften, url=https://books.google.es/books?id=gU3ABAAAQBAJ, year=2013, publisher=Springer International Publishing",
        "title": "Analysis and Geometry of Markov Diffusion Operators",
        "url": "https://books.google.es/books?id=gU3ABAAAQBAJ",
        "venue": "Springer International Publishing",
        "year": 2013
      },
      "exists": null,
      "explanation": "The fundamental reference for Bakry-Émery theory and diffusion operators used throughout the paper for LSI and Poincaré derivations.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Nicolas Boumal"
        ],
        "doi": null,
        "key": "boumal2022intromanifolds",
        "raw": "boumal2022intromanifolds: title = An introduction to optimization on smooth manifolds, author = Boumal, Nicolas, howpublished = To appear with Cambridge University Press, year = 2022, url = https://www.nicolasboumal.net/book,",
        "title": "An introduction to optimization on smooth manifolds",
        "url": "https://www.nicolasboumal.net/book",
        "venue": "Cambridge University Press",
        "year": 2022
      },
      "exists": null,
      "explanation": "Standard reference for optimization on manifolds, cited for the connection between sampling and constrained optimization.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Hao Shen",
          "Klaus Diepold",
          "Knut Hüper"
        ],
        "doi": null,
        "key": "shen2010tracequotient",
        "raw": "shen2010tracequotient: title=A geometric revisit to the trace quotient problem, author=Shen, Hao and Diepold, Klaus and Hüper, Knut, booktitle=Proceedings of the 19th International Symposium of Mathematical Theory of Networks and Systems (MTNS 2010), pages=1, year=2010",
        "title": "A geometric revisit to the trace quotient problem",
        "url": null,
        "venue": "Proceedings of the 19th International Symposium of Mathematical Theory of Networks and Systems",
        "year": 2010
      },
      "exists": null,
      "explanation": "Key reference for the trace quotient problem used in the examples section to demonstrate the application of the main results.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    }
  ],
  "missing_references": [
    {
      "reason": "Holley and Stroock (1986) provided the original perturbation lemma for log-Sobolev inequalities, which is the foundational basis for the 'defective LSI to tight LSI' arguments mentioned in the paper.",
      "title": "Holley, R., & Stroock, D. W. (1986). Logarithmic Sobolev inequalities and simulated annealing."
    },
    {
      "reason": "The paper extensively uses Riemannian submersions. O'Neill's 1966 paper is the seminal work defining the fundamental equations used to relate the curvature of the total space and base space.",
      "title": "O'Neill, B. (1966). The fundamental equations of a submersion."
    }
  ],
  "summary": "The paper maintains high citation hygiene, relying on authoritative textbooks for geometric and stochastic background and correctly identifying its primary methodological predecessor (Li & Erdogdu 2023). All technical claims regarding log-Sobolev and Poincaré inequalities are supported by relevant literature. The inclusion of application-specific citations for trace ratio minimization and quantum information demonstrates a good grasp of the interdisciplinary context."
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.78,
  "questions": [
    "For the trace-ratio example on the complex Stiefel manifold (§7), what are the closed-form or asymptotic scalings in (n,m) of i(M), conv(M), R_M, diam(M), K, A_2, and λ*, and do these confirm that the resulting β threshold from Theorem 14 is genuinely polynomial in dim(M) = 2m(n-m)?",
    "Can the authors provide at minimum a small-scale numerical experiment — e.g., running the discretized Langevin diffusion on the trace-ratio problem for m=2 and n=3..10 — reporting empirical TV distance to the Gibbs measure and fitting an empirical mixing time, to check whether the polynomial prediction is consistent with simulation?",
    "Is the condition ker(∇²F(x)) = ker(dπ|_x) at fibers above the minimum x* automatically satisfied for G-invariant Morse-Bott functions on principal G-bundles, or does it require a separate structural assumption; can the authors verify it explicitly for the trace-ratio example?",
    "For the mean-field 2D ferromagnetic Ising example, what is the precise compact Riemannian manifold M and Lie group G, and does F on M satisfy all of Assumptions 1-10, particularly the escape-direction condition (Assumption 9) and the injectivity-radius lower bound needed for ε_max in Theorem 15?"
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "The headline log-Sobolev rapid-mixing theorem and Gibbs concentration theorem are supported by conventional paper proofs but no machine-checkable proof artifact such as proofs/main_results.lean or proofs/submersion_lifting.lean is provided.",
      "id": "weakness-1",
      "locator": "reproducibility appendix",
      "required_update": "Add a reproducibility note that resolves this concern: The headline log-Sobolev rapid-mixing theorem and Gibbs concentration theorem are supported by conventional paper proofs but no machine-checkable proof artifact such as proofs/main_results.lean or proofs/submersion_lifting.lean is provided.",
      "source_path": null,
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm the reproducibility concern is addressed with a concrete artifact or manuscript update.",
      "weakness_index": 0
    },
    {
      "evidence": "The quantitative reproduction target is not fully instantiated: beta and the mixing constants are specified through asymptotic polynomial dependencies on geometric constants rather than concrete values for a reproducible instance.",
      "id": "weakness-2",
      "locator": "experiment configuration",
      "required_update": "Publish the exact experiment configuration: random seeds, candidate grids, fold boundaries/calendars, initialization policy, package versions, top-k choices, and penalty settings.",
      "source_path": "boundaries/calendars",
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "code",
      "verification_check": "Re-review should confirm exact seeds, grids, folds, package versions, and configuration choices are specified.",
      "weakness_index": 1
    },
    {
      "evidence": "The remark is conditional: it explicitly assumes polynomial scaling of all auxiliary constants. The conclusion then follows immediately from Theorem 14. The substantive question — whether these geometric parameters actually scale polynomially in dim for naturally arising families (e.g., products of spheres, Stiefel/Grassmann manifolds, the trace-ratio example) — is left to the §7 case studies and is not verified in general. Notably, 1/i(M) and 1/conv(M) can degrade with dimension on some natural families, which would break the conclusion.",
      "id": "weakness-3",
      "locator": "Section 1.1, Remark 16",
      "required_update": "Add a table in §7 enumerating, for each worked example, the asymptotic scaling of i(M), conv(M), R_M, diam(M), K, λ*, D, C_{F̃} in dim(M), and verify the resulting polynomial β bound; or run a numerical sweep experiments/parameter_scaling.py reporting empirical scalings.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 1.1, Remark 16` is corrected or justified.",
      "weakness_index": 2
    },
    {
      "evidence": "The identification of non-zero eigenvalues of ∇²F̃ with eigenvalues of ∇²F restricted to the horizontal space follows from the submersion calculus when F is constant on fibers, and is consistent with O'Neill's tensors. However, condition (ii) implicitly requires that ker(∇²F(x)) coincides with the vertical subspace at minima of F̃; this is a non-trivial regularity assumption that should be stated as a hypothesis on F rather than a consequence, since generic G-invariant smooth F need not satisfy it.",
      "id": "weakness-4",
      "locator": "Section 1.1, Remark 11 and cited Proposition 168",
      "required_update": "State Remark 11 as a sufficient condition that itself requires checking ker(∇²F(x)) = ker(dπ|_x) at minima, and discuss whether this is automatic for G-invariant Morse–Bott functions on principal G-bundles; provide a small worked example (e.g., the trace ratio §7) where this equality is verified explicitly.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 1.1, Remark 11 and cited Proposition 168` is corrected or justified.",
      "weakness_index": 3
    },
    {
      "evidence": "Holley and Stroock (1986) provided the original perturbation lemma for log-Sobolev inequalities, which is the foundational basis for the 'defective LSI to tight LSI' arguments mentioned in the paper.",
      "id": "weakness-5",
      "locator": "Holley, R., & Stroock, D. W. (1986). Logarithmic Sobolev inequalities and simulated annealing.",
      "required_update": "Add a bibliography entry for `Holley, R., & Stroock, D. W. (1986). Logarithmic Sobolev inequalities and simulated annealing` and cite it where the affected method or claim is introduced, or explicitly justify its omission.",
      "source_path": null,
      "source_role": "citation",
      "status": "open",
      "target_kind": "bibliography",
      "verification_check": "Re-review should confirm the bibliography and citation context address this reference.",
      "weakness_index": 4
    }
  ],
  "strengths": [
    "The Riemannian-submersion lifting strategy elegantly reduces the hard problem of multiple global minima to a quotient manifold with a unique minimum, then lifts Poincaré inequalities back — a conceptually clean and reusable technique.",
    "The multi-step proof architecture (Lyapunov-function Poincaré on the base following Li-Erdogdu 2023, submersion lifting, Bakry-Émery upgrade to LSI, TV-distance decay via Pinsker) is internally consistent and cites well-established classical inputs correctly.",
    "The novelty specialist finds no missing prior art and assigns a significant verdict (0.75) with high confidence, confirming the contribution meaningfully extends beyond Li-Erdogdu 2023 to a general class of symmetric Riemannian manifolds.",
    "Citation hygiene is high (confidence 0.95): authoritative monographs are used for geometric and stochastic background, the primary methodological predecessor is correctly identified, and application-specific references demonstrate genuine interdisciplinary reach.",
    "The self-contained treatment of Riemannian geometry, Sobolev spaces, and SDEs, together with concrete worked examples (trace-ratio on Stiefel/Grassmann, mean-field Ising), makes the theoretical results accessible and verifiable in principle."
  ],
  "summary": "The paper establishes polynomial-in-dimension mixing-time guarantees for Langevin dynamics on Riemannian manifolds under conditions on curvature, energy landscape geometry, and symmetry, with a central technical innovation using Riemannian submersions to factor out Lie group symmetries and lift Poincaré inequalities from quotient base spaces to total spaces. The novelty specialist rates the contribution significant (0.75/1.0) with high confidence (0.90), and the citation specialist finds strong hygiene (0.95). The technical correctness specialist rates the paper mostly_sound but with low confidence (0.55), identifying three major gaps: C1 (headline poly-dim mixing claim supported structurally but unverified computationally), C10 (computational reproducibility of §7 examples entirely unsupported), and implicitly through the unsupported assessment on claim C10 that no executable or formal artifact exists. The reproducibility specialist corroborates these gaps with three independent major concerns — no public repository, no machine-checkable proof artifact, and asymptotic-only instantiation of constants — yielding a reproducibility score of 0.46. No disagreement exists among specialists about the theoretical framing; the split is between the strong novelty and citation assessments and the weak reproducibility and (conditional) technical correctness assessments. The paper's field (math.PR/math.DG/math-ph) is code-amenable; because both technical_correctness (C1, C10 at major severity) and reproducibility (three major concerns) flag missing proof-as-code artifacts for the headline quantitative claims, the recommendation gate defaults to major_revision. Two missing foundational citations (Holley-Stroock 1986; O'Neill 1966) are noted by the citation specialist but do not affect the recommendation.",
  "weaknesses": [
    "No simulation code, numerical experiment, or formal proof artifact is provided to empirically confirm that mixing times and log-Sobolev constants scale polynomially in dim(M) on the §7 examples; both technical_correctness (C1, C10 at major severity) and reproducibility (concerns 1–3 at major severity) flag this as the primary gap, making the headline quantitative claim (Theorem 14) only structurally plausible rather than computationally verified.",
    "Reproducibility is critically low (score 0.46): no public repository, no license, no machine-checkable proof artifact (e.g., proofs/main_results.lean), and the key constants β and mixing-time exponents are given only as asymptotic polynomial dependencies on geometric parameters rather than concrete values for any reproducible instance.",
    "The polynomial-in-dimension scaling of β (Remark 16) is explicitly conditional on all auxiliary geometric parameters (injectivity radius, convexity radius, curvature bounds, etc.) scaling polynomially in dim(M), but this is not verified for the §7 worked examples; the degradation of 1/i(M) and 1/conv(M) on some natural families could break the conclusion.",
    "The Hessian kernel regularity condition implicit in Assumption 9-10 — that ker(∇²F(x)) coincides with the vertical subspace ker(dπ|_x) at the minimum fiber — is presented as a consequence of submersion calculus but is a non-trivial additional hypothesis on F that need not hold for generic G-invariant smooth functions and should be stated explicitly.",
    "Two foundational citations are absent: Holley and Stroock (1986), which provides the original perturbation lemma underpinning the defective-to-tight LSI argument, and O'Neill (1966), the seminal source for the fundamental submersion equations used throughout Sections 3 and 5."
  ]
}
```

### novelty (`gemini-3-flash-preview`) — status: `pass`

```json
{
  "confidence": 0.9,
  "missing_prior_art": [],
  "novelty_score": 0.75,
  "related_work": [
    {
      "citation_key": "LiErd2022",
      "delta": "Extends the convergence analysis of Langevin dynamics beyond products of spheres to a general class of Riemannian manifolds (symmetric spaces and quotient manifolds) by employing the geometric framework of Riemannian submersions to factor out symmetries and lift Poincaré inequalities.",
      "relation": "builds_on",
      "title": "Riemannian Langevin algorithm for solving semidefinite programs"
    },
    {
      "citation_key": "menz2014",
      "delta": "Generalizes the treatment of multiple minima from the Euclidean setting of Menz and Schlichting to a Riemannian manifold setting, specifically using Lie group actions and quotient manifolds to reduce the complexity of the energy landscape to a unique minimum.",
      "relation": "prior_art",
      "title": "Poincaré and logarithmic Sobolev inequalities by decomposition of the energy landscape"
    },
    {
      "citation_key": "bakry2013analysis",
      "delta": "Adapts foundational Bakry-Émery theory to the specific context of Riemannian submersions and Langevin processes in the low-temperature regime, providing explicit polynomial mixing bounds with respect to manifold dimension.",
      "relation": "prior_art",
      "title": "Analysis and Geometry of Markov Diffusion Operators"
    }
  ],
  "verdict": "significant"
}
```

### reproducibility (`gpt-5.5`) — status: `pass`

```json
{
  "code_availability": "unspecified",
  "code_url": null,
  "concerns": [
    {
      "area": "code",
      "description": "No public repository, release, license, or commit is provided for executable simulations, symbolic checks, or formal proof artifacts supporting the rapid-mixing claims.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "The headline log-Sobolev rapid-mixing theorem and Gibbs concentration theorem are supported by conventional paper proofs but no machine-checkable proof artifact such as proofs/main_results.lean or proofs/submersion_lifting.lean is provided.",
      "severity": "major"
    },
    {
      "area": "hyperparameters",
      "description": "The quantitative reproduction target is not fully instantiated: beta and the mixing constants are specified through asymptotic polynomial dependencies on geometric constants rather than concrete values for a reproducible instance.",
      "severity": "major"
    },
    {
      "area": "evaluation",
      "description": "The trace-ratio and mean-field Ising examples do not include scripts or notebooks such as examples/trace_ratio_verify.py or examples/ising_mean_field_verify.py to verify assumptions and constants numerically for representative cases.",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://books.google.es/books?id=Xnu0o` (status=404)",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://books.google.es/books?id=hV8o5R7` (status=404)",
      "severity": "minor"
    }
  ],
  "confidence": 0.84,
  "data_availability": "unspecified",
  "data_url": null,
  "environment": {
    "dependencies": [],
    "hardware": null,
    "software": null
  },
  "reproducibility_score": 0.46
}
```

### summary (`claude-haiku-4-5-20251001`) — status: `pass`

```json
{
  "audience": "Researchers in probability theory, differential geometry, and machine learning who work with sampling algorithms, MCMC methods, optimization on manifolds, and diffusion processes; also physicists interested in lattice gauge theory and statistical mechanics applications.",
  "key_contributions": [
    "Identifies conditions combining manifold curvature, inverse temperature, and energy landscape structure ensuring logarithmic Sobolev inequalities for Langevin dynamics on Riemannian manifolds",
    "Proves polynomial-in-dimension mixing times for convergence to Gibbs measures under these conditions",
    "Develops lifting techniques for Poincaré inequalities from quotient manifolds to total spaces via Riemannian submersions",
    "Establishes that isolated critical points with adequate spacing, non-degenerate global minima, and absence of barren plateaus permit rapid mixing",
    "Handles multiple global minima by factoring out symmetries: reduces to quotient manifolds with unique minima via group actions",
    "Provides explicit verification of assumptions for trace ratio minimization and two-dimensional ferromagnetic Ising model on manifolds"
  ],
  "plain_language_summary": "This paper addresses how to efficiently sample from Gibbs distributions on curved spaces (Riemannian manifolds). Sampling from complex distributions is fundamental to physics and machine learning, but direct sampling is usually impossible. Langevin dynamics—a stochastic process combining random noise and gradient descent—naturally approaches the target distribution over time. The central question is how fast this convergence occurs, which the paper calls 'rapid mixing.' Classical results exist for flat Euclidean spaces, but this work extends to general curved manifolds like spheres and rotation matrices.\n\nThe authors establish precise conditions ensuring rapid convergence: the manifold's curvature must be controlled, the energy landscape must allow the process to escape saddle points, and the gradient cannot vanish too often (avoiding 'barren plateaus'). Under these conditions, mixing occurs exponentially fast with polynomial polynomial mixing times in the dimension. The key technical innovation uses Riemannian submersions: when the energy function has symmetries, the authors factor them out to get a simpler quotient manifold, solve the problem there, and lift results back. This elegantly handles multiple global minima that differ only by symmetry transformations.\n\nApplications include lattice gauge theory in high-energy physics (predicting elementary particle masses) and optimization over tensor networks. The paper also provides a self-contained treatment of Riemannian geometry, Sobolev spaces, and stochastic differential equations to make the work accessible.",
  "tldr": "Langevin dynamics on Riemannian manifolds converge rapidly to Gibbs measures under conditions on curvature and energy landscape geometry, with mixing times polynomial in dimension."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `pass`

```json
{
  "claims": [
    {
      "assessment": "partially_supported",
      "claim": "Main Result 1 (Theorem 14, informal): under the stated symmetry, curvature, escape-direction, critical-point-spacing, and no-barren-plateau assumptions, the Langevin diffusions X_t and X̃_t on (M,g) and (M/G,h) converge exponentially fast to their Gibbs measures with log-Sobolev constants 1/α, 1/α̃ ∈ O(poly(dim M)), provided β ∈ Ω(poly(dim M, R_{M/G}, A_2, A_3, K, 1/i(M/G), 1/i(M), 1/conv(M/G), 1/λ*, 1/D, 1/C_{F̃})). In particular, polynomial-in-dimension mixing times are achievable.",
      "evidence": "The headline claim is supported in the text by a multi-step argument (Poincaré on the base via Lyapunov functions following Li–Erdoğdu 2022, lifting through a Riemannian submersion, then upgrading to log-Sobolev via a curvature-dimension condition à la Bakry–Émery). The structure is plausible and the cited classical inputs are correct, but the informal statement bundles a long chain of constants whose polynomial dependence on dim(M) cannot be verified from the introduction alone, and the paper ships no executable artifact (numerical simulation of the trace-ratio or Ising example, or formal proof in Lean/Coq) that empirically confirms the predicted poly(dim) scaling of mixing times or the log-Sobolev constant. Proof-as-code axiom applies (field math.PR / math.DG / math-ph): a load-bearing quantitative claim of this kind should be backed by a simulation showing the empirical mixing time on the §7 examples grows at most polynomially in dim(M).",
      "id": "C1",
      "location": "Section 1.1 (Main results), Theorem 14, and Remark 16",
      "severity": "major",
      "suggested_fix": "Ship experiments/mixing_time_scaling.py (Python or Julia) that runs the discretized Langevin diffusion on the trace-ratio problem of §7 for n=2..N and on the mean-field Ising model, measures TV or KL distance to the empirical Gibbs distribution, and plots empirical mixing time and Poincaré/log-Sobolev constants against dim(M); confirm the predicted polynomial scaling and report the actual exponent. Optionally formalize the curvature-dimension → log-Sobolev upgrade in src/proofs/BakryEmeryUpgrade.lean."
    },
    {
      "assessment": "supported",
      "claim": "Main Result 2 (Theorem 15): for β ∈ Ω(dim(M)² log(A_2, Vol(M), dim(M), ε⁻¹, δ⁻¹) / ε) and ε ∈ (0, ε_max] with ε_max ∈ O(i(M)² A_2), the Gibbs distribution ν = e^{−βF}/Z satisfies ν(F − min F ≥ ε) ≤ δ.",
      "evidence": "This is a standard low-temperature concentration estimate for Gibbs measures on compact Riemannian manifolds. The β scaling (linear in dim²·log(1/δ)/ε) is consistent with classical Laplace-method / volume-comparison arguments controlled by the injectivity radius and a Lipschitz gradient. The dependence on i(M) appearing through ε_max ∈ O(i(M)² A_2) is the expected control needed to localize to a normal-coordinate ball.",
      "id": "C2",
      "location": "Section 1.1, Theorem 15",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Lifting lemma (Section 3): a Poincaré inequality on the base (M/G, h) of a Riemannian submersion π with totally geodesic, non-negatively Ricci-curved fibers can be lifted to a Poincaré inequality on the total space (M, g) when F is constant on the fibers, and similarly the Markov triple on M induces a Markov triple on M/G with the same constants up to controlled factors.",
      "evidence": "The strategy — factoring out the symmetry via the quotient, working on the base where F̃ has a unique minimum, then lifting — is mathematically standard and consistent with O'Neill's submersion formulas (cited proposition 154) and existing work by Li–Erdoğdu 2022. Assumption 2 (non-negative Ricci curvature of the fibers) is precisely the natural hypothesis for the lift to preserve constants. However, the lifting inequality itself is asserted but its full proof is in a later section that is not visible in the introduction; the dependence of the lifted Poincaré constant on diam(G) and the fiber geometry needs verification.",
      "id": "C3",
      "location": "Section 3 (SectionLift), and Section 1.1 informal description",
      "severity": "minor",
      "suggested_fix": "Make the explicit lifting bound (constant on M in terms of constant on M/G, diam(G), and curvature) a numbered standalone proposition with a self-contained proof, and add a unit test src/proofs/PoincareLift.lean or experiments/lift_constant_check.py comparing the analytical lifted constant against an empirically estimated Poincaré constant on a small concrete submersion (e.g. S^{2n−1} → ℂP^{n−1})."
    },
    {
      "assessment": "supported",
      "claim": "The Poincaré inequality on (M/G, h) can be upgraded to a logarithmic Sobolev inequality using a curvature-dimension condition (Bakry–Émery theory), giving exponential decay of total-variation distance ‖ν − ρ_t‖²_TV ≤ β · e^{−2αt} · max F.",
      "evidence": "This is exactly Bakry–Émery 5.7 applied after establishing a Poincaré inequality plus a uniform CD(κ, ∞) bound, and the conversion from log-Sobolev to TV via Pinsker plus the bound on KL divergence by the Dirichlet form is classical. The presence of the β factor in front of the exponential matches the standard low-temperature dependence (initial-distribution KL bounded by β·max F when starting from the uniform measure).",
      "id": "C4",
      "location": "Section 1.1, Theorem 14 and Section 4 (SectionPItoLSI)",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Under Assumption 1 (compact connected Lie group G acting freely, isometrically and smoothly on (M,g)), the quotient M/G admits a smooth manifold structure and a unique Riemannian metric h such that π: (M,g) → (M/G,h) is a Riemannian submersion with totally geodesic fibers.",
      "evidence": "This is a standard result in Riemannian geometry (e.g., O'Neill 1966; Besse 1987). The combination of compactness, freeness, isometry, and smoothness of the action gives both the principal bundle structure and the submersion metric. The fibers are isometric copies of G with the bi-invariant metric, hence totally geodesic.",
      "id": "C5",
      "location": "Section 1.1, paragraph following Assumption 1, and cited Proposition 147",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "For a Riemannian submersion π: (M,g) → (M/G,h) and F = F̃ ∘ π, the gradient norms agree: |grad_g F(x)|_g = |grad_h F̃(π(x))|_h, and consequently the no-barren-plateau condition on M/G follows from the same condition on M (Remark 13).",
      "evidence": "Standard horizontal-lift identity: grad_g F at x is the horizontal lift of grad_h F̃ at π(x), and dπ_x restricted to the horizontal subspace is a linear isometry. Distances also do not increase under Riemannian submersions, justifying the inequality reduction.",
      "id": "C6",
      "location": "Section 1.1, Remark 13 and cited Proposition 165",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "The trace-ratio function F(X) = Tr(X†AX)/Tr(X†BX) on the complex Stiefel manifold {X : X†X = I_m}, factored by the right action of U(m), admits a projected version on the Grassmannian with a unique global minimum.",
      "evidence": "Cited via [shen2010tracequotient]; the right U(m) invariance is immediate from the cyclicity of trace, and the projected problem on the Grassmannian under standard non-degeneracy of (A,B) reduces to a generalized eigenvalue problem with a unique minimizing subspace.",
      "id": "C7",
      "location": "Section 1.1 motivating example, and Section 7 (sec:traceratio)",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Assumption 9–10 (escape direction at saddles and non-degenerate Hessian at the unique minimum on M/G) hold whenever (i) λ_min(∇²F(y)) ≤ −λ* at every saddle of F on M, and (ii) for every x ∈ π⁻¹(x*) and every v ∈ ker(∇²F(x)), v ∈ ker(dπ|_x), with ∇²F(x)[v] ≥ λ* v on the orthogonal complement — i.e., the non-zero eigenvalues of ∇²F̃ coincide with those of ∇²F on the horizontal subspace.",
      "evidence": "The identification of non-zero eigenvalues of ∇²F̃ with eigenvalues of ∇²F restricted to the horizontal space follows from the submersion calculus when F is constant on fibers, and is consistent with O'Neill's tensors. However, condition (ii) implicitly requires that ker(∇²F(x)) coincides with the vertical subspace at minima of F̃; this is a non-trivial regularity assumption that should be stated as a hypothesis on F rather than a consequence, since generic G-invariant smooth F need not satisfy it.",
      "id": "C8",
      "location": "Section 1.1, Remark 11 and cited Proposition 168",
      "severity": "minor",
      "suggested_fix": "State Remark 11 as a sufficient condition that itself requires checking ker(∇²F(x)) = ker(dπ|_x) at minima, and discuss whether this is automatic for G-invariant Morse–Bott functions on principal G-bundles; provide a small worked example (e.g., the trace ratio §7) where this equality is verified explicitly."
    },
    {
      "assessment": "partially_supported",
      "claim": "The lower bound β ∈ Ω(poly(dim M, ..., 1/λ*, 1/D, 1/C_{F̃}, ...)) is genuinely polynomial in dim(M) when the geometric parameters R_M, R_{M/G}, diam(M), diam(M/G), diam(G), 1/i(M), 1/i(M/G), 1/conv(M/G), K, A_2, A_3, λ*, D, C_{F̃} grow at most polynomially in dim(M) (Remark 16).",
      "evidence": "The remark is conditional: it explicitly assumes polynomial scaling of all auxiliary constants. The conclusion then follows immediately from Theorem 14. The substantive question — whether these geometric parameters actually scale polynomially in dim for naturally arising families (e.g., products of spheres, Stiefel/Grassmann manifolds, the trace-ratio example) — is left to the §7 case studies and is not verified in general. Notably, 1/i(M) and 1/conv(M) can degrade with dimension on some natural families, which would break the conclusion.",
      "id": "C9",
      "location": "Section 1.1, Remark 16",
      "severity": "minor",
      "suggested_fix": "Add a table in §7 enumerating, for each worked example, the asymptotic scaling of i(M), conv(M), R_M, diam(M), K, λ*, D, C_{F̃} in dim(M), and verify the resulting polynomial β bound; or run a numerical sweep experiments/parameter_scaling.py reporting empirical scalings."
    },
    {
      "assessment": "unsupported",
      "claim": "Computational reproducibility of the polynomial mixing-time / log-Sobolev constant scaling on the worked examples (trace-ratio, mean-field 2D ferromagnetic Ising) is established.",
      "evidence": "For a paper whose headline contribution is a quantitative mixing-time bound on concrete classes of manifolds (Stiefel/Grassmann, Ising mean field), the proof-as-code axiom for math.PR / math.DG / math-ph papers calls for executable artifacts confirming the predicted scalings. No simulation code, no formal mechanization, and no numerical tables verifying that empirical mixing times on the §7 examples scale as the bounds predict are shipped with the paper. The absence is itself evidence of weakness for an asymptotic-rate claim.",
      "id": "C10",
      "location": "Section 7 (sec:traceratio) and §1.1 motivation",
      "severity": "major",
      "suggested_fix": "Add an artifact directory: experiments/figure_traceratio/run.py simulating discretized Langevin on the trace-ratio problem for a range of (n,m), reporting empirical Poincaré and log-Sobolev constants; experiments/ising_meanfield/run.py for the 2D Ising case; benchmarks/mixing_time_vs_dim.py producing a log-log plot of mixing time vs dim(M) and fitting a polynomial. Optionally a Lean/Coq formalization src/proofs/PoincareToLogSobolev.lean of the Bakry–Émery upgrade lemma."
    }
  ],
  "confidence": 0.55,
  "overall_correctness": "mostly_sound"
}
```

## Corrections

<!-- corrections-section: rendered from corrections table; empty on first publish -->
_No corrections have been recorded._

## Bibliography

1. Bakry2008: author = Dominique Bakry and Franck Barthe and Patrick Cattiaux and Arnaud Guillin, title = A simple proof of the Poincaré inequality for a large class of probability measures, volume = 13, journal = Electronic Communications in Probability, publisher = Institute of Mathematical Statistics and Bernoulli Society, pages = 60 -- 66, keywords = log-concave measure, Lyapunov functions, Poincaré inequality, year = 2008, doi = 10.1214/ECP.v13-1352, URL = https://doi.org/10.1214/ECP.v13-1352 doi:[10.1214/ECP.v13-1352](https://doi.org/10.1214/ECP.v13-1352)
2. Creutz_2023: place=Cambridge, series=Cambridge Monographs on Mathematical Physics, title=Quarks, Gluons and Lattices, publisher=Cambridge University Press, author=Creutz, Michael, year=2023, collection=Cambridge Monographs on Mathematical Physics
3. Croke1980: author = Croke, Christopher B., title = Some isoperimetric inequalities and eigenvalue estimates, journal = Annales scientifiques de l'\'Ecole Normale Sup\'erieure, pages = 419--435, publisher = Elsevier, volume = Ser. 4, 13, number = 4, year = 1980, doi = 10.24033/asens.1390, zbl = 0465.53032, url = http://www.numdam.org/articles/10.24033/asens.1390/ doi:[10.24033/asens.1390](https://doi.org/10.24033/asens.1390) arXiv:[0465.53032](https://arxiv.org/abs/0465.53032)
4. DMRGFrank: title = Density Matrix Renormalization Group and Periodic Boundary Conditions: A Quantum Information Perspective, author = Verstraete, F. and Porras, D. and Cirac, J. I., journal = Phys. Rev. Lett., volume = 93, issue = 22, pages = 227205, numpages = 4, year = 2004, publisher = American Physical Society, doi = 10.1103/PhysRevLett.93.227205, url = https://link.aps.org/doi/10.1103/PhysRevLett.93.227205 doi:[10.1103/PhysRevLett.93.227205](https://doi.org/10.1103/PhysRevLett.93.227205)
5. FrobeniusNorm: doi = 10.1016/j.laa.2008.05.020, year = 2008, month = oct, publisher = Elsevier BV, volume = 429, number = 8-9, pages = 1864--1885, author = Albrecht B\"ottcher and David Wenzel, title = The Frobenius norm and the commutator, journal = Linear Algebra and its Applications doi:[10.1016/j.laa.2008.05.020](https://doi.org/10.1016/j.laa.2008.05.020)
6. Gray1979: author = A. Gray and L. Vanhecke, title = Riemannian geometry as determined by the volumes of small geodesic balls, volume = 142, journal = Acta Mathematica, publisher = Institut Mittag-Leffler, pages = 157 -- 198, year = 1979, doi = 10.1007/BF02395060, URL = https://doi.org/10.1007/BF02395060, doi:[10.1007/BF02395060](https://doi.org/10.1007/BF02395060)
7. Grigoryan_2024: title=Lecture notes on Analysis on Manifolds, author=Grigor’yan, Alexander, year=2024, publisher=Bielefeld University, url=https://www.math.uni-bielefeld.de/ grigor/anman2.pdf
8. HIM23: author = Ching-Peng Huang and Dominik Inauen and Govind Menon, title = Motion by mean curvature and Dyson Brownian Motion, volume = 28, journal = Electronic Communications in Probability, publisher = Institute of Mathematical Statistics and Bernoulli Society, pages = 1 -- 10, keywords = Dyson Brownian motion, mean curvature, Riemannian submersion, year = 2023, doi = 10.1214/23-ECP540, URL = https://doi.org/10.1214/23-ECP540 doi:[10.1214/23-ECP540](https://doi.org/10.1214/23-ECP540)
9. Klingenberg: ISSN = 0003486X, 19398980, URL = http://www.jstor.org/stable/1970029, author = W. Klingenberg, journal = Annals of Mathematics, number = 3, pages = 654--666, publisher = [Annals of Mathematics, Trustees of Princeton University on Behalf of the Annals of Mathematics, Mathematics Department, Princeton University], title = Contributions to Riemannian Geometry in the Large, urldate = 2024-06-25, volume = 69, year = 1959
10. LiErd2022: title=Riemannian Langevin algorithm for solving semidefinite programs, author=Li, Mufan and Erdogdu, Murat A, journal=Bernoulli, volume=29, number=4, pages=3093--3113, year=2023, publisher=Bernoulli Society for Mathematical Statistics and Probability
11. LiErd2022Supp: author = Mufan Li and Murat A. Erdogdu, title = Supplement to "Riemannian Langevin algorithm for solving semidefinite programs", year = 2023, doi = 10.3150/22-BEJ1576SUPP, URL = https://doi.org/10.3150/22-BEJ1576SUPP doi:[10.3150/22-BEJ1576SUPP](https://doi.org/10.3150/22-BEJ1576SUPP)
12. Qian1997: title=A gradient estimate on a manifold with convex boundary, volume=127, DOI=10.1017/S0308210500023568, number=1, journal=Proceedings of the Royal Society of Edinburgh: Section A Mathematics, publisher=Royal Society of Edinburgh Scotland Foundation, author=Qian, Zhongmin, year=1997, pages=171–179, doi:[10.1017/S0308210500023568](https://doi.org/10.1017/S0308210500023568)
13. RevModPhys: title = Matrix product states and projected entangled pair states: Concepts, symmetries, theorems, author = Cirac, J. Ignacio and P\'erez-Garc\'\ia, David and Schuch, Norbert and Verstraete, Frank, journal = Rev. Mod. Phys., volume = 93, issue = 4, pages = 045003, numpages = 65, year = 2021, publisher = American Physical Society,
14. Tsybakov2008: title=Introduction to Nonparametric Estimation, author=Tsybakov, Alexandre B., year=2008, publisher=Springer New York, NY
15. WangAnalysisforDiffusion: author = Wang, Feng-Yu, title = Analysis for Diffusion Processes on Riemannian Manifolds, publisher = World Scientific, year = 2013, doi = 10.1142/8737, address = , edition = , doi:[10.1142/8737](https://doi.org/10.1142/8737)
16. absil2008optimization: title=Optimization algorithms on matrix manifolds, author=Absil, P-A and Mahony, Robert and Sepulchre, Rodolphe, year=2008, publisher=Princeton University Press
17. absil2025ultimate: title=The ultimate upper bound on the injectivity radius of the Stiefel manifold, author=Absil, P-A and Mataigne, Simon, journal=SIAM Journal on Matrix Analysis and Applications, volume=46, number=2, pages=1145--1167, year=2025, publisher=SIAM
18. akhtari2024cox: title=The Cox-Ingersoll-Ross process under volatility uncertainty, author=Akhtari, Bahar and Li, Hanwu, journal=Journal of Mathematical Analysis and Applications, volume=531, number=1, pages=127867, year=2024, publisher=Elsevier
19. andrews2010ricci: title=The Ricci flow in Riemannian geometry: a complete proof of the differentiable 1/4-pinching sphere theorem, author=Andrews, Ben and Hopper, Christopher, year=2010, publisher=Springer
20. autenried2014sub: title=Sub-Riemannian geometry of Stiefel manifolds, author=Autenried, Christian and Markina, Irina, journal=SIAM Journal on Control and Optimization, volume=52, number=2, pages=939--959, year=2014, publisher=SIAM
21. bakry2013analysis: title=Analysis and Geometry of Markov Diffusion Operators, author=Bakry, D. and Gentil, I. and Ledoux, M., isbn=9783319002279, lccn=2013952461, series=Grundlehren der mathematischen Wissenschaften, url=https://books.google.es/books?id=gU3ABAAAQBAJ, year=2013, publisher=Springer International Publishing
22. batir2008inequalities: title=Inequalities for the gamma function, author=Batir, Necdet, journal=Archiv der Mathematik, volume=91, number=6, pages=554--563, year=2008, publisher=Birkh user-Verlag, Basel
23. bendokat2024grassmann: title=A Grassmann manifold handbook: Basic geometry and computational aspects, author=Bendokat, Thomas and Zimmermann, Ralf and Absil, P-A, journal=Advances in Computational Mathematics, volume=50, number=1, pages=6, year=2024, publisher=Springer
24. berger2007panoramic: title=A Panoramic View of Riemannian Geometry, author=Berger, M., isbn=9783540653172, lccn=2007925272, url=https://books.google.es/books?id=d_SsagQckaQC, year=2007, publisher=Springer Berlin Heidelberg
25. besse2007einstein: title=Einstein Manifolds, author=Besse, A.L., isbn=9783540741206, lccn=2007938035, series=Classics in Mathematics, url=https://books.google.es/books?id=aVUjiBNCyogC, year=2007, publisher=Springer Berlin Heidelberg
26. boumal2022intromanifolds: title = An introduction to optimization on smooth manifolds, author = Boumal, Nicolas, howpublished = To appear with Cambridge University Press, year = 2022, url = https://www.nicolasboumal.net/book,
27. bovier2015metastability: title=Metastability: A Potential-Theoretic Approach, author=Bovier, A. and den Hollander, F., isbn=9783319247762, series=Die Grundlehren der mathematischen Wissenschaften, url=https://books.google.es/books?id=yzDlzQEACAAJ, year=2015, publisher=Springer International Publishing
28. brooks2011handbook: title=Handbook of markov chain monte carlo, author=Brooks, Steve and Gelman, Andrew and Jones, Galin and Meng, Xiao-Li, year=2011, publisher=CRC press
29. cao2025dynamicalapproacharealaw: title=Dynamical approach to area law for lattice Yang-Mills, author=Sky Cao and Ron Nissim and Scott Sheffield, year=2025, eprint=2509.04688, archivePrefix=arXiv, url=https://arxiv.org/abs/2509.04688, arXiv:[2509.04688](https://arxiv.org/abs/2509.04688)
30. carlen2004logarithmic: title=Logarithmic Sobolev inequalities and spectral gaps, author=Carlen, Eric and Loss, Michael, journal=Contemporary Mathematics, volume=353, pages=53--60, year=2004, publisher=Providence, RI; American Mathematical Society; 1999
31. cattiaux2007weak: title=Weak logarithmic Sobolev inequalities and entropic convergence, author=Cattiaux, Patrick and Gentil, Ivan and Guillin, Arnaud, journal=Probability theory and related fields, volume=139, number=3, pages=563--603, year=2007, publisher=Springer
32. cheeger1975comparison: title=Comparison theorems in Riemannian geometry, author=Cheeger, Jeff and Ebin, David G and Ebin, David Gregory, volume=9, year=1975, publisher=North-Holland Amsterdam
33. cheng2022efficient: title=Efficient sampling on Riemannian manifolds via Langevin MCMC, author=Cheng, Xiang and Zhang, Jingzhao and Sra, Suvrit, journal=Advances in Neural Information Processing Systems, volume=35, pages=5995--6006, year=2022
34. chewi2025analysis: title=Analysis of langevin monte carlo from poincare to log-sobolev, author=Chewi, Sinho and Erdogdu, Murat A and Li, Mufan and Shen, Ruoqi and Zhang, Matthew S, journal=Foundations of Computational Mathematics, volume=25, number=4, pages=1345--1395, year=2025, publisher=Springer
35. cohen1998topology: title=The topology of fiber bundles lecture notes, author=Cohen, Ralph L, journal=Standford University, year=1998
36. cox1985theory: title=A theory of the term structure of interest rates, author=Cox, John C and Ingersoll, Jonathan E and Ross, Stephen A and others, journal=Econometrica, volume=53, number=2, pages=385--407, year=1985, publisher=World Scientific
37. diffpriv1: title=Differential privacy dynamics of langevin diffusion and noisy gradient descent, author=Chourasia, Rishav and Ye, Jiayuan and Shokri, Reza, journal=Advances in Neural Information Processing Systems, volume=34, pages=14771--14781, year=2021
38. diffpriv2: title=Can stochastic gradient Langevin dynamics provide differential privacy for deep learning?, author=Heller, Guy and Fetaya, Ethan, booktitle=2023 IEEE Conference on Secure and Trustworthy Machine Learning (SaTML), pages=68--106, year=2023, organization=IEEE
39. diffpriv3: title=Differential Privacy Guarantees for Stochastic Gradient Langevin Dynamics, author=Théo Ryffel and Francis Bach and David Pointcheval, year=2022, eprint=2201.11980, archivePrefix=arXiv, url=https://arxiv.org/abs/2201.11980, arXiv:[2201.11980](https://arxiv.org/abs/2201.11980)
40. doCarmoriemannian: title=Riemannian geometry, author=Do Carmo, Manfredo Perdigao and Flaherty Francis, J, volume=6, year=1992, publisher=Springer
41. escobales1975riemannian: title=Riemannian submersions with totally geodesic fibers, author=Escobales Jr, Richard H, journal=Journal of Differential Geometry, volume=10, number=2, pages=253--276, year=1975, publisher=Lehigh University
42. evans2010partial: title=Partial Differential Equations, author=Evans, L.C., isbn=9780821849743, lccn=2009044716, series=Graduate studies in mathematics, url=https://books.google.es/books?id=Xnu0o\_EJrCQC, year=2010, publisher=American Mathematical Society
43. fukumizu2019semi: title=Semi-flat minima and saddle points by embedding neural networks to overparameterization, author=Fukumizu, Kenji and Yamaguchi, Shoichiro and Mototake, Yoh-ichi and Tanaka, Mirai, journal=Advances in neural information processing systems, volume=32, year=2019
44. fulton2013representation: title=Representation theory: a first course, author=Fulton, William and Harris, Joe, year=2013, publisher=Springer Science \& Business Media
45. gallier2020differential: title=Differential geometry and lie groups, author=Gallier, JEAN QUAINTANCE and Quaintance, Jocelyn, volume=12, year=2020, publisher=Springer
46. gelman1995bayesian: title=Bayesian data analysis, author=Gelman, Andrew and Carlin, John B and Stern, Hal S and Rubin, Donald B, year=1995, publisher=Chapman and Hall/CRC
47. gilbarg1977elliptic: title=Elliptic partial differential equations of second order, author=Gilbarg, David and Trudinger, Neil S, year=1977, publisher=Springer
48. hirsch2012differential: title=Differential topology, author=Hirsch, Morris W, year=2012, publisher=Springer Science \& Business Media
49. horn2012matrix: title=Matrix analysis, author=Horn, Roger A and Johnson, Charles R, year=2012, publisher=Cambridge university press
50. hsu2008brownian: title=A brief introduction to Brownian motion on a Riemannian manifold, author=Hsu, Elton P, journal=lecture notes, year=2008
51. hsustochastic: title=Stochastic Analysis on Manifolds, author=Hsu, E.P., isbn=9780821883884, series=Contemporary Mathematics, url=https://books.google.es/books?id=2NM0Z7svRmEC, publisher=American Mathematical Soc., year = 2002
52. jerrum1993polynomial: title=Polynomial-time approximation algorithms for the Ising model, author=Jerrum, Mark and Sinclair, Alistair, journal=SIAM Journal on computing, volume=22, number=5, pages=1087--1116, year=1993, publisher=SIAM
53. jolliffe2011principal: title=Principal component analysis, author=Jolliffe, Ian, booktitle=International encyclopedia of statistical science, pages=1094--1096, year=2011, publisher=Springer
54. lando2013graphs: title=Graphs on surfaces and their applications, author=Lando, Sergei K and Zvonkin, Alexander K, volume=141, year=2013, publisher=Springer Science \& Business Media
55. lee2018introductionRiemannian: title=Introduction to Riemannian manifolds, author=Lee, John M, volume=2, year=2018, publisher=Springer
56. mackay2003information: title=Information theory, inference and learning algorithms, author=MacKay, David JC, year=2003, publisher=Cambridge university press
57. menon2024geometrydeeplinearnetwork: title=The geometry of the deep linear network, author=Govind Menon, year=2024, eprint=2411.09004, archivePrefix=arXiv, url=https://arxiv.org/abs/2411.09004, arXiv:[2411.09004](https://arxiv.org/abs/2411.09004)
58. menon2026implicitregularizationlangevindynamics: title=On the implicit regularization of Langevin dynamics with projected noise, author=Govind Menon and Austin J. Stromme and Adrien Vacher, year=2026, eprint=2602.12257, archivePrefix=arXiv, url=https://arxiv.org/abs/2602.12257, arXiv:[2602.12257](https://arxiv.org/abs/2602.12257)
59. menz2014: author = Georg Menz and Andr\'e Schlichting, title = Poincaré and logarithmic Sobolev inequalities by decomposition of the energy landscape, volume = 42, journal = The Annals of Probability, number = 5, publisher = Institute of Mathematical Statistics, pages = 1809 -- 1884, keywords = diffusion process, Eyring–Kramers formula, Kramers law, Logarithmic Sobolev inequality, metastability, Poincaré inequality, spectral gap, weighted transport distance, year = 2014, doi = 10.1214/14-AOP908, URL = https://doi.org/10.1214/14-AOP908 doi:[10.1214/14-AOP908](https://doi.org/10.1214/14-AOP908)
60. milnor1997topology: title=Topology from the differentiable viewpoint, author=Milnor, John Willard and Weaver, David W, volume=21, year=1997, publisher=Princeton university press
61. montvay1994quantum: title=Quantum fields on a lattice, author=Montvay, Istv\'an and M\"unster, Gernot, year=1994, publisher=Cambridge University Press
62. oksendal2013stochastic: title=Stochastic differential equations: an introduction with applications, author=Oksendal, Bernt, year=2013, publisher=Springer Science \& Business Media
63. oneil1967submersions: title=Submersions and geodesics, author=O’Neill, Barrett, journal=Duke Math. J., volume=34, number=1, pages=363--373, year=1967
64. oneill1966fundamental: title=The fundamental equations of a submersion., author=O'Neill, Barrett, journal=Michigan Mathematical Journal, volume=13, number=4, pages=459--469, year=1966, publisher=University of Michigan, Department of Mathematics
65. ourwork: author = "Páez Velasco, Pablo", title = "Tensor network manifolds and Riemannian fundamental theorem for tensor networks", note = "unpublished"
66. pardoux2014stochastic: title=Stochastic Differential Equations, Backward SDEs, Partial Differential Equations, author=Pardoux, E. and R\ua\cscanu, A., isbn=9783319057149, series=Stochastic Modelling and Applied Probability, url=https://books.google.es/books?id=j4nkAwAAQBAJ, year=2014, publisher=Springer International Publishing
67. petersen2006riemannian: title=Riemannian Geometry, author=Petersen, P., isbn=9780387294032, lccn=97005786, series=Graduate Texts in Mathematics, url=https://books.google.es/books?id=9cekXdo52hEC, year=2006, publisher=Springer New York
68. preguntastack: title = Escaping time of a modified CIR process, author = mathusername, howpublished = Mathematics Stack Exchange, eprint = https://math.stackexchange.com/q/5117199, archivePrefix=stackexchange, year = 2025, URL = https://math.stackexchange.com/q/5117199
69. rentmeesters2013algorithms: title=Algorithms for data fitting on some common homogeneous spaces, author=Rentmeesters, Quentin and others, year=2013, school=Ph. D. thesis, Universit\'e Catholique de Louvain, Louvain, Belgium
70. revuz2013continuous: title=Continuous martingales and Brownian motion, author=Revuz, Daniel and Yor, Marc, volume=293, year=2013, publisher=Springer Science \& Business Media
71. robert2004monte: title=Monte Carlo statistical methods, author=Robert, Christian P and Casella, George and Casella, George, volume=2, year=2004, publisher=Springer
72. safran2021effects: title=The effects of mild over-parameterization on the optimization landscape of shallow relu neural networks, author=Safran, Itay M and Yehudai, Gilad and Shamir, Ohad, booktitle=Conference on Learning Theory, pages=3889--3934, year=2021, organization=PMLR
73. schutz1980geometrical: title=Geometrical methods of mathematical physics, author=Schutz, Bernard F, year=1980, publisher=Cambridge university press
74. shen2010tracequotient: title=A geometric revisit to the trace quotient problem, author=Shen, Hao and Diepold, Klaus and H\"uper, Knut, booktitle=Proceedings of the 19th International Symposium of Mathematical Theory of Networks and Systems (MTNS 2010), pages=1, year=2010
75. steele2012stochastic: title=Stochastic Calculus and Financial Applications, author=Steele, J.M., isbn=9781468493054, series=Stochastic Modelling and Applied Probability, url=https://books.google.es/books?id=fsgkBAAAQBAJ, year=2012, publisher=Springer New York
76. stewart1998matrix: title=Matrix algorithms: volume 1: basic decompositions, author=Stewart, Gilbert W, year=1998, publisher=SIAM
77. sulanke1972differentialgeometrie: title=Differentialgeometrie und Faserb\"undel, author=Sulanke, Rolf and Wintgen, Peter, volume=48, year=1972, publisher=Springer
78. vempala2019rapid: title=Rapid convergence of the unadjusted langevin algorithm: Isoperimetry suffices, author=Vempala, Santosh and Wibisono, Andre, journal=Advances in neural information processing systems, volume=32, year=2019
79. villani2008optimal: title=Optimal Transport: Old and New, author=Villani, C., isbn=9783540710509, lccn=2008932183, series=Grundlehren der mathematischen Wissenschaften, url=https://books.google.es/books?id=hV8o5R7\_5tkC, year=2008, publisher=Springer Berlin Heidelberg
80. wainwright2019high: title=High-Dimensional Statistics: A Non-Asymptotic Viewpoint, author=Wainwright, M.J., isbn=9781108498029, lccn=2018043475, series=Cambridge Series in Statistical and Probabilistic Mathematics, url=https://books.google.es/books?id=8C8nuQEACAAJ, year=2019, publisher=Cambridge University Press
81. wang2006functional: title=Functional inequalities Markov semigroups and spectral theory, author=Wang, Fengyu, year=2006, publisher=Elsevier
82. wang2009log: title=Log-Sobolev inequality on non-convex Riemannian manifolds, author=Wang, Feng-Yu, journal=Advances in Mathematics, volume=222, number=5, pages=1503--1520, year=2009, publisher=Elsevier
83. wibisono2019proximal: title=Proximal Langevin Algorithm: Rapid Convergence Under Isoperimetry, author=Andre Wibisono, year=2019, eprint=1911.01469, archivePrefix=arXiv, url=https://arxiv.org/abs/1911.01469, arXiv:[1911.01469](https://arxiv.org/abs/1911.01469)
84. xuquotient: title=Quotient-Space Diffusion Model, author=Xu, Yixian and Wang, Yusong and Luo, Shengjie and Gao, Kaiyuan and He, Tianyu and Liu, Chang and He, Di, note=Submitted to The Fourteenth International Conference on Learning Representations. Under review, year = 2026
85. yan2005graph: title=Graph embedding: A general framework for dimensionality reduction, author=Yan, Shuicheng and Xu, Dong and Zhang, Benyu and Zhang, Hong-Jiang, booktitle=2005 IEEE Computer Society Conference on Computer Vision and Pattern Recognition (CVPR'05), volume=2, pages=830--837, year=2005, organization=IEEE
86. yanguez2025efficient: title=Efficient Quantum Measurements: Computational Max- and Measured R\'enyi Divergences and Applications, author=Álvaro Yángüez and Thomas A. Hahn and Jan Kochanowski, year=2025, eprint=2509.21308, archivePrefix=arXiv, url=https://arxiv.org/abs/2509.21308, arXiv:[2509.21308](https://arxiv.org/abs/2509.21308)
87. zhong1984estimate: title=On the estimate of first eigenvalue of a compact Riemannian manifold, author=Zhong, Jia Qing, journal=Sci. Sinica Ser. A, volume=27, pages=1265--1273, year=1984

