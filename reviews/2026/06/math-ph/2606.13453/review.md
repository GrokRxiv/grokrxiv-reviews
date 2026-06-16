# Rapid mixing for Gibbs measures in Riemannian manifolds

GrokRxiv review of [arXiv:2606.13453](https://arxiv.org/abs/2606.13453) · `math-ph`

_Authors_: Ángela Capel, Marco Castrillón-López, Sofyan Iblisdir, Angelo Lucia, Pablo Páez-Velasco, David Pérez-García

## TL;DR

The paper establishes rapid-mixing guarantees for Langevin dynamics on Riemannian manifolds, proving Poincaré and logarithmic Sobolev inequalities via a Riemannian submersion framework that factors out Lie-group symmetries. The five specialist reviews are broadly consistent: technical correctness rates the core proofs mostly_sound (Theorems 76, 77, 59, 68 all verified; confidence 0.68), novelty is significant at score 0.7 (extends Li–Erdogdu 2022 from sphere products to general quotient manifolds; no missing prior art identified), and citation quality is excellent (confidence 0.95). The primary area of disagreement is between the technical and reproducibility specialists on severity: reproducibility flags a critical absence of any machine-checkable proof artifact and rates overall reproducibility at 0.38, while technical correctness treats the missing computational verification as major but not proof-invalidating. This review weights the verified reproducibility concerns as authoritative. The paper lies in the stat.*/math.PR domain (code-amenable under the recommendation gate), and both technical_correctness (C8, major) and reproducibility (code area, major; proof artifact, critical) flag missing executable artifacts. Accordingly the default recommendation is major_revision. The core mathematical architecture is sound and the contribution is significant, but the manuscript requires: (1) simulation evidence for the headline polynomial mixing-time claim, (2) resolution of the missing Sections 7–8, (3) a constant-budget table auditing the factor 184, and (4) correction of the Lemma 80 typo. Two missing references (Holley–Stroock 1987, Yau 1982) are additive gaps, not blocking issues.

_Recommendation_: **Major revision** · _Confidence_: 78%

## Strengths

- The Riemannian submersion framework for lifting Poincaré inequalities (Theorem 59) is technically elegant and handles the symmetry-orbit structure of energy functions in a principled, generalizable way.
- Theorems 76 and 77 provide explicit, self-contained LSI constants whose derivation chain (Theorem 34 → Theorem 59 → Theorem 68 → Corollary 77) is internally consistent and verifiable.
- The extension from products of spheres (Li–Erdogdu 2022) to general quotient manifolds with free isometric Lie-group actions represents a significant broadening of the class of tractable sampling problems.
- Citation hygiene is excellent: foundational works (do Carmo, O'Neill, Bakry–Gentil–Ledoux, Villani) are invoked at precise lemma and corollary level, and the bibliography accurately reflects the multidisciplinary scope.
- The polynomial-in-dimension mixing-time scaling (Remark 16, Corollary 77) is a direct algebraic consequence of the explicit LSI constants and not an additional assumption, which strengthens the main result.

## Weaknesses

- No code repository, simulation, or executable artifact is provided; the headline claim that polynomial mixing times are achievable on the named examples (trace-ratio on Stiefel/Grassmann, mean-field 2D Ising) is entirely empirically unchecked (technical_correctness C8, severity major).
- No machine-checkable proof artifact (e.g., Lean formalization covering the main theorem and lifting argument) is supplied, leaving the proof chain unverifiable by automated means (reproducibility concern area: other, severity critical).
- Sections 7 (trace-ratio and 2D Ising analysis) and 8 (Riemannian geometry background) are absent from the supplied manuscript, leaving all example-specific assumption verifications (free Lie-group action, λ* lower bound, no barren plateaus) unconfirmed (technical_correctness C9, severity minor).
- The numerical constant 184 in Theorem 34 is not fully auditable: the contributions of the local PI factor, bump-function gradient cost, Lyapunov drift constants, and CIR escape exponent are not tabulated, making independent verification of this bookkeeping impossible (technical_correctness C6, severity minor).
- A typo in the statement of Lemma 80 writes R = 2ε/A_2 where the proof requires R = √(2ε/A_2); as stated the lemma is dimensionally inconsistent with the constraint R ≤ i(M)/2 under ε ≤ ε_max (technical_correctness C3, severity minor).
- Two directly relevant references are absent: Holley–Stroock 1987 on log-Sobolev inequalities and simulated annealing (relevant to Section 4 tightening) and Yau 1982 on eigenvalues on Riemannian manifolds (relevant to Poincaré constant and spectral gap bounds).

## Revision Targets

- [ ] **Manuscript: Headline claims in the abstract and Introduction; the paper references Section 7 (sec:tracera...**
  - Location: `corrections/2606.13453/paper.tex` at `Headline claims in the abstract and Introduction; the paper references Section 7 (sec:traceratio) and the two-dimensional ferromagnetic Ising mean-field example, but no executable artifact (Langevin simulation, mixing-time empirical estimate, or numerical sanity check of the constants 184, 736, etc.) is shipped with the paper.`
  - Evidence: For a paper in math.PR/stat.* whose load-bearing claim is 'polynomial in dim mixing times are achievable', the standard proof-as-code artifact would be a small simulation showing empirical mixing-time scaling on the trace-ratio example (dim m × n complex matrices, varying n, with the explicit Riemannian submersion to a Grassmannian/Stiefel quotient) and/or the 2D Ising mean-field example, validating that the predicted β-threshold and the predicted exponential decay rate are not vacuous. The text mentions the trace-ratio problem (Eq. F(X) = Tr(X†AX)/Tr(X†BX)) but ships no code, and the present prompt excerpt does not contain Section 7's analysis. Absence of an executable artifact does not invalidate the theorems but leaves the headline claim 'mixing times polynomial in dimension are achievable' empirically unchecked.
  - Required change: Ship simulation code for the trace-ratio example (e.g., experiments/trace_ratio/langevin.py performing the Langevin SDE on the Stiefel manifold and reporting TV distance to the Gibbs measure as a function of t and dimension) and for the 2D mean-field Ising example (experiments/ising_meanfield/run.py). At minimum, include a benchmark that computes the explicit constants A_2, A_3, λ*, D, conv(M/G), i(M/G) for the example and compares the predicted mixing time against an empirical estimator.
  - Verification: Re-review should confirm `Headline claims in the abstract and Introduction; the paper references Section 7 (sec:traceratio) and the two-dimensional ferromagnetic Ising mean-field example, but no executable artifact (Langevin simulation, mixing-time empirical estimate, or numerical sanity check of the constants 184, 736, etc.) is shipped with the paper.` is corrected or justified.
- [ ] **Manuscript: reproducibility appendix**
  - Location: `corrections/2606.13453/paper.tex` at `reproducibility appendix`
  - Evidence: The headline rapid-mixing and log-Sobolev results are supported only by prose mathematical proofs; no machine-checkable proof artifact is provided. A formalization such as proofs/main_results.lean covering the main theorem and lifting argument would close this gap.
  - Required change: Add a reproducibility note that resolves this concern: The headline rapid-mixing and log-Sobolev results are supported only by prose mathematical proofs; no machine-checkable proof artifact is provided. A formalization such as proofs/main_results.lean covering the main theorem and lifting argument would close this gap.
  - Verification: Re-review should confirm the reproducibility concern is addressed with a concrete artifact or manuscript update.
- [ ] **Manuscript: Forward references in Introduction (lines 153, 199, 322, 493–500) and in Theorem 76's proof; ...**
  - Location: `corrections/2606.13453/paper.tex` at `Forward references in Introduction (lines 153, 199, 322, 493–500) and in Theorem 76's proof; back-references to Section 8 throughout (e.g., 'cf. existenceRiemannianSubmersionMetrics', 'cf. CurvaturaSubmersion', 'cf. prop:projectedHessian').`
  - Evidence: The body of the paper jumps from Section 6 (Suboptimality, ending line 3105) directly to Acknowledgements (line 3107) and then to appendices on Sobolev spaces, Bakry-Émery theory, and SDEs. The named Section 7 (sec:traceratio) and Section 8 (SectionExamples) are not present in the supplied review_input. Verification of Remark 11 (kernel-of-Hessian condition) and of the example-specific assumptions (free isometric Lie-group action, λ* lower bound, no barren plateaus) depends on those missing sections. If they are present in the full submitted PDF this is a packaging issue; if not, the paper has a gap between informal claims about applicability and formal verification.
  - Required change: Either (i) include the full Sections 7 and 8 in the canonical submission and confirm the cross-reference numbering, or (ii) if those sections are deferred to a companion paper [@ourwork], state this explicitly at first mention and rephrase the abstract / Introduction so they do not promise an example analysis the paper does not contain.
  - Verification: Re-review should confirm `Forward references in Introduction (lines 153, 199, 322, 493–500) and in Theorem 76's proof; back-references to Section 8 throughout (e.g., 'cf. existenceRiemannianSubmersionMetrics', 'cf. CurvaturaSubmersion', 'cf. prop:projectedHessian').` is corrected or justified.
- [ ] **Manuscript: Section 2 'Poincaré inequality under unique minimum', Theorem 34 (referenced throughout Secti...**
  - Location: `corrections/2606.13453/paper.tex` at `Section 2 'Poincaré inequality under unique minimum', Theorem 34 (referenced throughout Section 2; proof spanning lines ~1499–1844).`
  - Evidence: The strategy follows LiErd2022 Appendix D: build a local PI(λ*/8) on G_3 := B(a/√β, x*) via Bakry–Émery on a geodesically convex set under CD(λ*/4) (Lemma 50, sound given the stated β bounds), then extend to all of B using two Lyapunov functions W_1 = exp(βF̃/2) (escape from G_3^c) and W_2 = E[exp(λ*τ*/16)|X̃_0=x] (local escape time from saddles via a CIR-process comparison in Section 11). The numerical constant 184 is a specific bookkeeping outcome from chained bounds (bump function gradient bound, Lyapunov drift inequalities, restriction-to-extension PI loss); the global structure is in line with the Bakry–Barthe–Cattiaux–Guillin Lyapunov-PI program, but the specific numeric factor depends on auxiliary results (escaping-time bound of a generalized CIR process, bump-function gradient bound, local PI factor) whose intermediate calculations were not all reproducible from the text alone.
  - Required change: Add an explicit table or summary of the constants contributed by each step (local PI factor 1/8, bump-function gradient cost, Lyapunov drift constants, CIR escape exponent λ*/16) so the reader can audit the 184 numerical factor end-to-end.
  - Verification: Re-review should confirm `Section 2 'Poincaré inequality under unique minimum', Theorem 34 (referenced throughout Section 2; proof spanning lines ~1499–1844).` is corrected or justified.
- [ ] **Manuscript: Section 6 'Suboptimality of the Gibbs distribution', Theorem 78 (lines ~2915–2928); proof lin...**
  - Location: `corrections/2606.13453/paper.tex` at `Section 6 'Suboptimality of the Gibbs distribution', Theorem 78 (lines ~2915–2928); proof lines ~3037–3094.`
  - Evidence: The proof structure is sound and mirrors LiErd2022 Appendix C. Lemma 79 gives ν(F≥ε) ≤ e^{−βε}·Vol(M)/∫_{B(R,x*)} e^{−βA_2 d(x*,x)²/2}dVol with R := √(2ε/A_2); Lemma 80 lower-bounds this integral via Croke's volume lower bound for geodesic spheres (Croke 1980 Prop 14), valid for ρ ≤ i(M)/2, combined with a Gaussian tail integration. The final logarithmic-Gamma bound uses Batir 2008 Thm 1.5. However, the statement of Lemma 80 writes 'R = 2ε/A_2' which is dimensionally and numerically inconsistent with its own proof (e.g., the proof uses A_2·R² = 2ε and √(βA_2)·R ≥ 1 iff β ≥ 1/(2ε), and the bound R ≤ i(M)/2 follows from ε ≤ ε_max only if R = √(2ε/A_2)). This is a typo in the lemma statement, not in the proof, but it propagates if a reader applies Lemma 80 verbatim.
  - Required change: Correct the statement of Lemma 80 to set R := √(2ε/A_2) (matching Lemma 79); add a one-line check that R ≤ i(M)/2 under ε ≤ ε_max = i(M)²A_2/8.
  - Verification: Re-review should confirm `Section 6 'Suboptimality of the Gibbs distribution', Theorem 78 (lines ~2915–2928); proof lines ~3037–3094.` is corrected or justified.
- [ ] **Bibliography: Holley, R., & Stroock, D. (1987). Logarithmic Sobolev inequalities and simulated annealing.**
  - Location: bibliography entry: `Holley, R., & Stroock, D. (1987). Logarithmic Sobolev inequalities and simulated annealing.`
  - Evidence: Crucial for the discussion of logarithmic Sobolev inequalities on manifolds, especially for the 'tightening' of inequalities mentioned in Section 4 which relates back to simulated annealing principles.
  - Required change: Add a bibliography entry for `Holley, R., & Stroock, D. (1987). Logarithmic Sobolev inequalities and simulated annealing` and cite it where the affected method or claim is introduced, or explicitly justify its omission.
  - Verification: Re-review should confirm the bibliography and citation context address this reference.

## Open Questions

- Can the authors supply a constant-budget table for Theorem 34 that shows explicitly how the factor 184 accumulates from each auxiliary result (local PI factor 1/8, bump-function gradient bound, Lyapunov drift constants, CIR escape exponent λ*/16)?
- Are Sections 7 and 8 present in the submitted PDF? If so, why do they not appear in the review input, and do the forward references (sec:traceratio, SectionExamples, prop:projectedHessian, existenceRiemannianSubmersionMetrics, CurvaturaSubmersion) resolve correctly in the canonical submission?
- Can the authors provide a minimal simulation—e.g., Langevin SDE on the Stiefel manifold for a concrete trace-ratio instance with varying dimension—reporting empirical TV-distance decay consistent with the predicted exponential rate and polynomial dimension scaling?
- Lemma 80 states R = 2ε/A_2 but the proof uses A_2·R² = 2ε throughout; can the authors confirm this is a typographic error and supply the corrected statement?
- Why are Holley–Stroock 1987 and Yau 1982 not cited given their direct relevance to the log-Sobolev tightening in Section 4 and to the spectral-gap / Poincaré-constant analysis?
- The inverse-temperature threshold is stated asymptotically as β ∈ Ω(poly(geometric constants)) without an explicit threshold calculator; for the trace-ratio application, can the authors supply a worked numerical example computing A_2, A_3, λ*, diam(M), i(M) and deriving a concrete β lower bound?

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
          "Do Carmo, Manfredo Perdigao",
          "Flaherty Francis, J"
        ],
        "doi": null,
        "key": "doCarmoriemannian",
        "raw": "doCarmoriemannian: title=Riemannian geometry, author=Do Carmo, Manfredo Perdigao and Flaherty Francis, J, volume=6, year=1992, publisher=Springer",
        "title": "Riemannian geometry",
        "url": null,
        "venue": "Springer",
        "year": 1992
      },
      "exists": null,
      "explanation": "Standard textbook for Riemannian geometry foundations, used to support manifold definitions and basic geometric properties throughout the paper.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Li, Mufan",
          "Erdogdu, Murat A"
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
      "explanation": "Primary technical reference for the Poincaré inequality proof strategy and analysis of Langevin diffusion on product manifolds; much of the current work generalizes these results.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Bakry, D.",
          "Gentil, I.",
          "Ledoux, M."
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
      "explanation": "Foundational text for Bakry-Émery theory and the relationship between Poincaré/log-Sobolev inequalities and Markov diffusion operators, cited extensively for theoretical grounding.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Villani, C."
        ],
        "doi": null,
        "key": "villani2008optimal",
        "raw": "villani2008optimal: title=Optimal Transport: Old and New, author=Villani, C., isbn=9783540710509, lccn=2008932183, series=Grundlehren der mathematischen Wissenschaften, url=https://books.google.es/books?id=hV8o5R7\\_5tkC, year=2008, publisher=Springer Berlin Heidelberg",
        "title": "Optimal Transport: Old and New",
        "url": "https://books.google.es/books?id=hV8o5R7\\_5tkC",
        "venue": "Springer Berlin Heidelberg",
        "year": 2008
      },
      "exists": null,
      "explanation": "Cited for the HWI inequality and connections between entropy, Fisher information, and Wasserstein distance, essential for the log-Sobolev derivation.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Boumal, Nicolas"
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
      "explanation": "Used to link manifold sampling to constrained optimization and for specific results on smooth functions and Hessian properties on manifolds.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Shen, Hao",
          "Diepold, Klaus",
          "Hüper, Knut"
        ],
        "doi": null,
        "key": "shen2010tracequotient",
        "raw": "shen2010tracequotient: title=A geometric revisit to the trace quotient problem, author=Shen, Hao and Diepold, Klaus and H\\\"uper, Knut, booktitle=Proceedings of the 19th International Symposium of Mathematical Theory of Networks and Systems (MTNS 2010), pages=1, year=2010",
        "title": "A geometric revisit to the trace quotient problem",
        "url": null,
        "venue": "Proceedings of the 19th International Symposium of Mathematical Theory of Networks and Systems (MTNS 2010)",
        "year": 2010
      },
      "exists": null,
      "explanation": "Key reference for the trace quotient problem and its projected version on Grassmann manifolds, which serves as a major application example.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "O'Neill, Barrett"
        ],
        "doi": null,
        "key": "oneill1966fundamental",
        "raw": "oneill1966fundamental: title=The fundamental equations of a submersion., author=O'Neill, Barrett, journal=Michigan Mathematical Journal, volume=13, number=4, pages=459--469, year=1966, publisher=University of Michigan, Department of Mathematics",
        "title": "The fundamental equations of a submersion.",
        "url": null,
        "venue": "Michigan Mathematical Journal",
        "year": 1966
      },
      "exists": null,
      "explanation": "Provides the mathematical foundation for Riemannian submersions, which are central to the paper's argument for lifting inequalities between spaces.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2411.09004",
        "authors": [
          "Govind Menon"
        ],
        "doi": null,
        "key": "menon2024geometrydeeplinearnetwork",
        "raw": "menon2024geometrydeeplinearnetwork: title=The geometry of the deep linear network, author=Govind Menon, year=2024, eprint=2411.09004, archivePrefix=arXiv, url=https://arxiv.org/abs/2411.09004,",
        "title": "The geometry of the deep linear network",
        "url": "https://arxiv.org/abs/2411.09004",
        "venue": "arXiv",
        "year": 2024
      },
      "exists": null,
      "explanation": "Recent work cited in the context of lifting processes and the geometry of neural networks, showing the relevance of the paper's techniques to modern ML problems.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    }
  ],
  "missing_references": [
    {
      "reason": "Crucial for the discussion of logarithmic Sobolev inequalities on manifolds, especially for the 'tightening' of inequalities mentioned in Section 4 which relates back to simulated annealing principles.",
      "title": "Holley, R., & Stroock, D. (1987). Logarithmic Sobolev inequalities and simulated annealing."
    },
    {
      "reason": "Foundational for the study of eigenvalues on Riemannian manifolds, particularly the first eigenvalue bounds which directly relate to the Poincaré constant and spectral gap analysis used in the paper.",
      "title": "Yau, S. T. (1982). Seminar on Differential Geometry."
    }
  ],
  "summary": "The paper exhibits excellent citation hygiene, drawing appropriately from foundational Riemannian geometry (do Carmo, O'Neill), classical diffusion theory (Bakry-Émery, Villani), and very recent literature on manifold sampling (Li & Erdogdu 2023). The bibliography is comprehensive and accurately reflects the multidisciplinary nature of the work, spanning geometry, statistics, and machine learning. The use of specific lemmas and theorems from the cited works is precise and well-documented."
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.78,
  "questions": [
    "Can the authors supply a constant-budget table for Theorem 34 that shows explicitly how the factor 184 accumulates from each auxiliary result (local PI factor 1/8, bump-function gradient bound, Lyapunov drift constants, CIR escape exponent λ*/16)?",
    "Are Sections 7 and 8 present in the submitted PDF? If so, why do they not appear in the review input, and do the forward references (sec:traceratio, SectionExamples, prop:projectedHessian, existenceRiemannianSubmersionMetrics, CurvaturaSubmersion) resolve correctly in the canonical submission?",
    "Can the authors provide a minimal simulation—e.g., Langevin SDE on the Stiefel manifold for a concrete trace-ratio instance with varying dimension—reporting empirical TV-distance decay consistent with the predicted exponential rate and polynomial dimension scaling?",
    "Lemma 80 states R = 2ε/A_2 but the proof uses A_2·R² = 2ε throughout; can the authors confirm this is a typographic error and supply the corrected statement?",
    "Why are Holley–Stroock 1987 and Yau 1982 not cited given their direct relevance to the log-Sobolev tightening in Section 4 and to the spectral-gap / Poincaré-constant analysis?",
    "The inverse-temperature threshold is stated asymptotically as β ∈ Ω(poly(geometric constants)) without an explicit threshold calculator; for the trace-ratio application, can the authors supply a worked numerical example computing A_2, A_3, λ*, diam(M), i(M) and deriving a concrete β lower bound?"
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "For a paper in math.PR/stat.* whose load-bearing claim is 'polynomial in dim mixing times are achievable', the standard proof-as-code artifact would be a small simulation showing empirical mixing-time scaling on the trace-ratio example (dim m × n complex matrices, varying n, with the explicit Riemannian submersion to a Grassmannian/Stiefel quotient) and/or the 2D Ising mean-field example, validating that the predicted β-threshold and the predicted exponential decay rate are not vacuous. The text mentions the trace-ratio problem (Eq. F(X) = Tr(X†AX)/Tr(X†BX)) but ships no code, and the present prompt excerpt does not contain Section 7's analysis. Absence of an executable artifact does not invalidate the theorems but leaves the headline claim 'mixing times polynomial in dimension are achievable' empirically unchecked.",
      "id": "weakness-1",
      "locator": "Headline claims in the abstract and Introduction; the paper references Section 7 (sec:traceratio) and the two-dimensional ferromagnetic Ising mean-field example, but no executable artifact (Langevin simulation, mixing-time empirical estimate, or numerical sanity check of the constants 184, 736, etc.) is shipped with the paper.",
      "required_update": "Ship simulation code for the trace-ratio example (e.g., experiments/trace_ratio/langevin.py performing the Langevin SDE on the Stiefel manifold and reporting TV distance to the Gibbs measure as a function of t and dimension) and for the 2D mean-field Ising example (experiments/ising_meanfield/run.py). At minimum, include a benchmark that computes the explicit constants A_2, A_3, λ*, D, conv(M/G), i(M/G) for the example and compares the predicted mixing time against an empirical estimator.",
      "source_path": "corrections/2606.13453/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Headline claims in the abstract and Introduction; the paper references Section 7 (sec:traceratio) and the two-dimensional ferromagnetic Ising mean-field example, but no executable artifact (Langevin simulation, mixing-time empirical estimate, or numerical sanity check of the constants 184, 736, etc.) is shipped with the paper.` is corrected or justified.",
      "weakness_index": 0
    },
    {
      "evidence": "The headline rapid-mixing and log-Sobolev results are supported only by prose mathematical proofs; no machine-checkable proof artifact is provided. A formalization such as proofs/main_results.lean covering the main theorem and lifting argument would close this gap.",
      "id": "weakness-2",
      "locator": "reproducibility appendix",
      "required_update": "Add a reproducibility note that resolves this concern: The headline rapid-mixing and log-Sobolev results are supported only by prose mathematical proofs; no machine-checkable proof artifact is provided. A formalization such as proofs/main_results.lean covering the main theorem and lifting argument would close this gap.",
      "source_path": "corrections/2606.13453/paper.tex",
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm the reproducibility concern is addressed with a concrete artifact or manuscript update.",
      "weakness_index": 1
    },
    {
      "evidence": "The body of the paper jumps from Section 6 (Suboptimality, ending line 3105) directly to Acknowledgements (line 3107) and then to appendices on Sobolev spaces, Bakry-Émery theory, and SDEs. The named Section 7 (sec:traceratio) and Section 8 (SectionExamples) are not present in the supplied review_input. Verification of Remark 11 (kernel-of-Hessian condition) and of the example-specific assumptions (free isometric Lie-group action, λ* lower bound, no barren plateaus) depends on those missing sections. If they are present in the full submitted PDF this is a packaging issue; if not, the paper has a gap between informal claims about applicability and formal verification.",
      "id": "weakness-3",
      "locator": "Forward references in Introduction (lines 153, 199, 322, 493–500) and in Theorem 76's proof; back-references to Section 8 throughout (e.g., 'cf. existenceRiemannianSubmersionMetrics', 'cf. CurvaturaSubmersion', 'cf. prop:projectedHessian').",
      "required_update": "Either (i) include the full Sections 7 and 8 in the canonical submission and confirm the cross-reference numbering, or (ii) if those sections are deferred to a companion paper [@ourwork], state this explicitly at first mention and rephrase the abstract / Introduction so they do not promise an example analysis the paper does not contain.",
      "source_path": "corrections/2606.13453/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Forward references in Introduction (lines 153, 199, 322, 493–500) and in Theorem 76's proof; back-references to Section 8 throughout (e.g., 'cf. existenceRiemannianSubmersionMetrics', 'cf. CurvaturaSubmersion', 'cf. prop:projectedHessian').` is corrected or justified.",
      "weakness_index": 2
    },
    {
      "evidence": "The strategy follows LiErd2022 Appendix D: build a local PI(λ*/8) on G_3 := B(a/√β, x*) via Bakry–Émery on a geodesically convex set under CD(λ*/4) (Lemma 50, sound given the stated β bounds), then extend to all of B using two Lyapunov functions W_1 = exp(βF̃/2) (escape from G_3^c) and W_2 = E[exp(λ*τ*/16)|X̃_0=x] (local escape time from saddles via a CIR-process comparison in Section 11). The numerical constant 184 is a specific bookkeeping outcome from chained bounds (bump function gradient bound, Lyapunov drift inequalities, restriction-to-extension PI loss); the global structure is in line with the Bakry–Barthe–Cattiaux–Guillin Lyapunov-PI program, but the specific numeric factor depends on auxiliary results (escaping-time bound of a generalized CIR process, bump-function gradient bound, local PI factor) whose intermediate calculations were not all reproducible from the text alone.",
      "id": "weakness-4",
      "locator": "Section 2 'Poincaré inequality under unique minimum', Theorem 34 (referenced throughout Section 2; proof spanning lines ~1499–1844).",
      "required_update": "Add an explicit table or summary of the constants contributed by each step (local PI factor 1/8, bump-function gradient cost, Lyapunov drift constants, CIR escape exponent λ*/16) so the reader can audit the 184 numerical factor end-to-end.",
      "source_path": "corrections/2606.13453/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 2 'Poincaré inequality under unique minimum', Theorem 34 (referenced throughout Section 2; proof spanning lines ~1499–1844).` is corrected or justified.",
      "weakness_index": 3
    },
    {
      "evidence": "The proof structure is sound and mirrors LiErd2022 Appendix C. Lemma 79 gives ν(F≥ε) ≤ e^{−βε}·Vol(M)/∫_{B(R,x*)} e^{−βA_2 d(x*,x)²/2}dVol with R := √(2ε/A_2); Lemma 80 lower-bounds this integral via Croke's volume lower bound for geodesic spheres (Croke 1980 Prop 14), valid for ρ ≤ i(M)/2, combined with a Gaussian tail integration. The final logarithmic-Gamma bound uses Batir 2008 Thm 1.5. However, the statement of Lemma 80 writes 'R = 2ε/A_2' which is dimensionally and numerically inconsistent with its own proof (e.g., the proof uses A_2·R² = 2ε and √(βA_2)·R ≥ 1 iff β ≥ 1/(2ε), and the bound R ≤ i(M)/2 follows from ε ≤ ε_max only if R = √(2ε/A_2)). This is a typo in the lemma statement, not in the proof, but it propagates if a reader applies Lemma 80 verbatim.",
      "id": "weakness-5",
      "locator": "Section 6 'Suboptimality of the Gibbs distribution', Theorem 78 (lines ~2915–2928); proof lines ~3037–3094.",
      "required_update": "Correct the statement of Lemma 80 to set R := √(2ε/A_2) (matching Lemma 79); add a one-line check that R ≤ i(M)/2 under ε ≤ ε_max = i(M)²A_2/8.",
      "source_path": "corrections/2606.13453/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 6 'Suboptimality of the Gibbs distribution', Theorem 78 (lines ~2915–2928); proof lines ~3037–3094.` is corrected or justified.",
      "weakness_index": 4
    },
    {
      "evidence": "Crucial for the discussion of logarithmic Sobolev inequalities on manifolds, especially for the 'tightening' of inequalities mentioned in Section 4 which relates back to simulated annealing principles.",
      "id": "weakness-6",
      "locator": "Holley, R., & Stroock, D. (1987). Logarithmic Sobolev inequalities and simulated annealing.",
      "required_update": "Add a bibliography entry for `Holley, R., & Stroock, D. (1987). Logarithmic Sobolev inequalities and simulated annealing` and cite it where the affected method or claim is introduced, or explicitly justify its omission.",
      "source_path": null,
      "source_role": "citation",
      "status": "open",
      "target_kind": "bibliography",
      "verification_check": "Re-review should confirm the bibliography and citation context address this reference.",
      "weakness_index": 5
    }
  ],
  "strengths": [
    "The Riemannian submersion framework for lifting Poincaré inequalities (Theorem 59) is technically elegant and handles the symmetry-orbit structure of energy functions in a principled, generalizable way.",
    "Theorems 76 and 77 provide explicit, self-contained LSI constants whose derivation chain (Theorem 34 → Theorem 59 → Theorem 68 → Corollary 77) is internally consistent and verifiable.",
    "The extension from products of spheres (Li–Erdogdu 2022) to general quotient manifolds with free isometric Lie-group actions represents a significant broadening of the class of tractable sampling problems.",
    "Citation hygiene is excellent: foundational works (do Carmo, O'Neill, Bakry–Gentil–Ledoux, Villani) are invoked at precise lemma and corollary level, and the bibliography accurately reflects the multidisciplinary scope.",
    "The polynomial-in-dimension mixing-time scaling (Remark 16, Corollary 77) is a direct algebraic consequence of the explicit LSI constants and not an additional assumption, which strengthens the main result."
  ],
  "summary": "The paper establishes rapid-mixing guarantees for Langevin dynamics on Riemannian manifolds, proving Poincaré and logarithmic Sobolev inequalities via a Riemannian submersion framework that factors out Lie-group symmetries. The five specialist reviews are broadly consistent: technical correctness rates the core proofs mostly_sound (Theorems 76, 77, 59, 68 all verified; confidence 0.68), novelty is significant at score 0.7 (extends Li–Erdogdu 2022 from sphere products to general quotient manifolds; no missing prior art identified), and citation quality is excellent (confidence 0.95). The primary area of disagreement is between the technical and reproducibility specialists on severity: reproducibility flags a critical absence of any machine-checkable proof artifact and rates overall reproducibility at 0.38, while technical correctness treats the missing computational verification as major but not proof-invalidating. This review weights the verified reproducibility concerns as authoritative. The paper lies in the stat.*/math.PR domain (code-amenable under the recommendation gate), and both technical_correctness (C8, major) and reproducibility (code area, major; proof artifact, critical) flag missing executable artifacts. Accordingly the default recommendation is major_revision. The core mathematical architecture is sound and the contribution is significant, but the manuscript requires: (1) simulation evidence for the headline polynomial mixing-time claim, (2) resolution of the missing Sections 7–8, (3) a constant-budget table auditing the factor 184, and (4) correction of the Lemma 80 typo. Two missing references (Holley–Stroock 1987, Yau 1982) are additive gaps, not blocking issues.",
  "weaknesses": [
    "No code repository, simulation, or executable artifact is provided; the headline claim that polynomial mixing times are achievable on the named examples (trace-ratio on Stiefel/Grassmann, mean-field 2D Ising) is entirely empirically unchecked (technical_correctness C8, severity major).",
    "No machine-checkable proof artifact (e.g., Lean formalization covering the main theorem and lifting argument) is supplied, leaving the proof chain unverifiable by automated means (reproducibility concern area: other, severity critical).",
    "Sections 7 (trace-ratio and 2D Ising analysis) and 8 (Riemannian geometry background) are absent from the supplied manuscript, leaving all example-specific assumption verifications (free Lie-group action, λ* lower bound, no barren plateaus) unconfirmed (technical_correctness C9, severity minor).",
    "The numerical constant 184 in Theorem 34 is not fully auditable: the contributions of the local PI factor, bump-function gradient cost, Lyapunov drift constants, and CIR escape exponent are not tabulated, making independent verification of this bookkeeping impossible (technical_correctness C6, severity minor).",
    "A typo in the statement of Lemma 80 writes R = 2ε/A_2 where the proof requires R = √(2ε/A_2); as stated the lemma is dimensionally inconsistent with the constraint R ≤ i(M)/2 under ε ≤ ε_max (technical_correctness C3, severity minor).",
    "Two directly relevant references are absent: Holley–Stroock 1987 on log-Sobolev inequalities and simulated annealing (relevant to Section 4 tightening) and Yau 1982 on eigenvalues on Riemannian manifolds (relevant to Poincaré constant and spectral gap bounds)."
  ]
}
```

### novelty (`gemini-3-flash-preview`) — status: `pass`

```json
{
  "confidence": 0.9,
  "missing_prior_art": [],
  "novelty_score": 0.7,
  "related_work": [
    {
      "citation_key": "LiErd2022",
      "delta": "Extends the analysis of Langevin diffusion from products of spheres to a much broader class of Riemannian manifolds, specifically focusing on quotient manifolds and utilizing the structure of Riemannian submersions to factor out symmetries.",
      "relation": "builds_on",
      "title": "Riemannian Langevin algorithm for solving semidefinite programs"
    },
    {
      "citation_key": "bakry2013analysis",
      "delta": "Applies Bakry-Émery theory and the curvature-dimension condition to obtain log-Sobolev inequalities and polynomial mixing times on general Riemannian manifolds by lifting properties from a base space to the total space of a submersion.",
      "relation": "builds_on",
      "title": "Analysis and Geometry of Markov Diffusion Operators"
    },
    {
      "citation_key": "menz2014",
      "delta": "While Menz and Schlichting focused on Euclidean space and the effects of multiple minima, this work identifies conditions (symmetry and unique minimum in the quotient space) to ensure rapid mixing on manifolds where local minima might otherwise be a bottleneck.",
      "relation": "prior_art",
      "title": "Poincaré and logarithmic Sobolev inequalities by decomposition of the energy landscape"
    },
    {
      "citation_key": "oneill1966fundamental",
      "delta": "Uses O'Neill's fundamental equations for Riemannian submersions as a geometric foundation to relate the curvature and Langevin dynamics between the domain and the image (quotient) manifold.",
      "relation": "orthogonal",
      "title": "The fundamental equations of a submersion."
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
      "area": "other",
      "description": "The headline rapid-mixing and log-Sobolev results are supported only by prose mathematical proofs; no machine-checkable proof artifact is provided. A formalization such as proofs/main_results.lean covering the main theorem and lifting argument would close this gap.",
      "severity": "critical"
    },
    {
      "area": "hyperparameters",
      "description": "The inverse-temperature requirement is stated asymptotically as beta in Omega(poly(...)) over many geometric constants, without an executable derivation or explicit threshold calculator for reproducing concrete mixing-time bounds.",
      "severity": "major"
    },
    {
      "area": "evaluation",
      "description": "Assumptions such as curvature bounds, injectivity and convexity radii, saddle escape directions, and no barren plateaus are not accompanied by checkable certificates for the trace-ratio or other intended applications.",
      "severity": "major"
    },
    {
      "area": "code",
      "description": "No repository, scripts, notebooks, or pinned release are provided for numerical sanity checks, example instantiations, or automated verification of the theorem dependencies.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://books.google.es/books?id=hV8o5R7` (status=404)",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://books.google.es/books?id=Xnu0o` (status=404)",
      "severity": "minor"
    }
  ],
  "confidence": 0.86,
  "data_availability": "unspecified",
  "data_url": null,
  "environment": {
    "dependencies": [],
    "hardware": null,
    "software": null
  },
  "reproducibility_score": 0.38
}
```

### summary (`claude-haiku-4-5-20251001`) — status: `pass`

```json
{
  "audience": "Mathematicians and computational scientists working in probability theory, differential geometry, statistical mechanics, optimization on manifolds, and machine learning; particularly those interested in MCMC methods, sampling algorithms, and theoretical guarantees for convergence rates.",
  "key_contributions": [
    "Identifies necessary and sufficient conditions on Riemannian manifolds for rapid mixing of Langevin dynamics to Gibbs measures",
    "Proves Poincaré inequalities for Langevin processes on quotient manifolds with unique minima",
    "Establishes logarithmic Sobolev inequalities through curvature-dimension conditions, yielding exponentially fast convergence bounds",
    "Demonstrates that mixing times scale polynomially with manifold dimension under appropriate geometric conditions",
    "Develops a theory of lifting Poincaré inequalities from quotient manifolds to total spaces of Riemannian submersions",
    "Handles symmetric energy functions by factoring symmetries through Lie group actions and analyzing the quotient manifold",
    "Characterizes the interplay between manifold curvature, inverse temperature, critical point structure, and convergence rates",
    "Shows that saddle point escape directions and absence of barren plateaus are necessary for rapid mixing",
    "Applies the theory to concrete problems in lattice gauge theory, tensor networks, and constrained optimization"
  ],
  "plain_language_summary": "This paper studies how quickly a random process called Langevin dynamics can sample from probability distributions defined on curved geometric spaces (Riemannian manifolds). The authors establish conditions under which this process mixes rapidly—that is, converges quickly to the target distribution. These conditions involve the geometric properties of the manifold (its curvature), the temperature-like parameter of the distribution (inverse temperature), and the structure of critical points of the energy function. The work extends previous results from Euclidean spaces to much more general curved geometries.\n\nThe key technical contribution uses an elegant geometric tool: Riemannian submersions, which relate processes on a manifold to processes on a quotient manifold. This allows the authors to handle symmetric energy functions where multiple global minima exist but are related by symmetry. They prove both Poincaré and logarithmic Sobolev inequalities—classical tools for understanding convergence rates—under conditions that exclude pathological situations like barren plateaus (flat regions with no gradient signal) and ensure critical points are well-separated.\n\nThe results show that when these conditions are met, the convergence time scales polynomially with the dimension of the manifold, making the sampling practical for high-dimensional problems. The authors demonstrate applications to important problems in physics and optimization, including lattice gauge theory, tensor networks, and trace-ratio minimization.",
  "tldr": "The paper proves that Langevin dynamics on Riemannian manifolds converges rapidly to the Gibbs distribution under conditions on manifold curvature, critical point structure, and temperature, with mixing times polynomial in dimension."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `pass`

```json
{
  "claims": [
    {
      "assessment": "supported",
      "claim": "Theorem 76 (formal Main Result 1): Under the stated assumptions on (M,g), the Lie group G, the Riemannian submersion π:(M,g)→(M/G,h), curvature bounds, and F (Lipschitz gradient/Hessian, saddle escape constant λ*, no barren plateaus, isolated critical points), the Markov triples (M,ν,Γ) and (M/G,ν̃,Γ̃) satisfy explicit LSI(α_M) and LSI(α_{M/G}) with the constants displayed in equations (eq:constantalphaM) and (eq:constantalphaMG).",
      "evidence": "The proof composes three pieces: (i) PI(λ*/184) on (M/G,ν̃,Γ̃) from Theorem 34 / Lemma 50 (Bakry–Émery on geodesically convex G_3 + Lyapunov-function extension), (ii) lifting of the PI to M via Theorem 59 (using Zhong's PI for compact manifolds with non-negative Ricci, Theorem 58, on each fiber), and (iii) tightening to LSI via Theorem 68 using the curvature-dimension bound ∇²F+β⁻¹Ric≥−(A_2+R_M)g, which follows from F being A_2-Lipschitz-gradient. The arithmetic chain matches the stated 1/α_M = 4β(A_2+R_M)diam(M)²·max{184/λ*, β·diam(G)²/π²} and 1/α_{M/G} = 736β(A_2+R_{M/G})diam(M/G)²/λ*.",
      "id": "C1",
      "location": "Section 5 'Rapid mixing for Gibbs measures in Riemannian manifolds', Theorem 76 (lines ~2733–2777), proof lines ~2809–2847.",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Corollary 77 (rapid mixing): With initial uniform distribution, ||ν−ρ_t||²_TV ≤ β·e^{−2α_M t}·max_M F and analogously for the quotient, giving exponential convergence at rate Ω(1/poly(dim M)) under polynomial scaling assumptions.",
      "evidence": "Immediate from Proposition 66 (Pinsker–Csizsár–Kullback + entropy decay e^{−2αt} from LSI, citing Bakry–Gentil–Ledoux Thm 5.2.1) and Proposition 67 (uniform-vs-Gibbs entropy bound H(ρ_0|ν) ≤ β·max F). The constants flow correctly and the polynomial-in-dim corollary in Remark 16 is a direct algebraic consequence of Theorem 76's poly bound on β.",
      "id": "C2",
      "location": "Section 5, Corollary 77 (lines ~2855–2897); informal version Theorem 14; scaling discussion in Remark 16.",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Theorem 78 (suboptimality): For ε∈(0,ε_max] with ε_max:=min{i(M)²A_2/8,1} and δ∈(0,1), the choice β ≥ (2/ε)(1/2 + d²·log(d³A_2·Vol(M)·√(2π)/(δε))) gives ν(F − min F ≥ ε) ≤ δ.",
      "evidence": "The proof structure is sound and mirrors LiErd2022 Appendix C. Lemma 79 gives ν(F≥ε) ≤ e^{−βε}·Vol(M)/∫_{B(R,x*)} e^{−βA_2 d(x*,x)²/2}dVol with R := √(2ε/A_2); Lemma 80 lower-bounds this integral via Croke's volume lower bound for geodesic spheres (Croke 1980 Prop 14), valid for ρ ≤ i(M)/2, combined with a Gaussian tail integration. The final logarithmic-Gamma bound uses Batir 2008 Thm 1.5. However, the statement of Lemma 80 writes 'R = 2ε/A_2' which is dimensionally and numerically inconsistent with its own proof (e.g., the proof uses A_2·R² = 2ε and √(βA_2)·R ≥ 1 iff β ≥ 1/(2ε), and the bound R ≤ i(M)/2 follows from ε ≤ ε_max only if R = √(2ε/A_2)). This is a typo in the lemma statement, not in the proof, but it propagates if a reader applies Lemma 80 verbatim.",
      "id": "C3",
      "location": "Section 6 'Suboptimality of the Gibbs distribution', Theorem 78 (lines ~2915–2928); proof lines ~3037–3094.",
      "severity": "minor",
      "suggested_fix": "Correct the statement of Lemma 80 to set R := √(2ε/A_2) (matching Lemma 79); add a one-line check that R ≤ i(M)/2 under ε ≤ ε_max = i(M)²A_2/8."
    },
    {
      "assessment": "supported",
      "claim": "Theorem 68: A curvature-dimension condition CD(−κ_1) (with κ_1>0) plus a Poincaré inequality PI(κ_2) on (M,ν,Γ) imply a tight log-Sobolev inequality LSI(α) with 1/α = 4β·κ_1·diam(M)²/κ_2.",
      "evidence": "The derivation applies the HWI inequality (Villani 2008 Corollary 20.13) to V = βF + log Z so that ∇²V + Ric ≥ −βκ_1 g; uses Young's inequality to obtain a defective LSI(1/(εβ), 2 diam²(M)(1/(2ε)+βκ_1/2) ); and then applies Bakry–Gentil–Ledoux Proposition 5.1.3 to tighten. The pointwise-in-ε infimum yields 1/α̃ = 2 diam(M)√(β/κ_2) + (β·κ_1·diam(M)²+1)/κ_2, and the final simplification to 4β·κ_1·diam(M)²/κ_2 uses the stated normalizations β ≥ 1, 0<κ_2≤1, diam(M) ≥ 1, κ_1 > 1 (Remark 69), each of which holds in the application of Theorem 76. The looser final constant is acknowledged as a 'more readable' upper bound.",
      "id": "C4",
      "location": "Section 4.2 'From Poincaré to log-Sobolev', Theorem 68 (lines 2524–2543); proof lines 2660–2718.",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Theorem 59 (lifting Poincaré): If (M/G,ν̃,Γ̃) satisfies PI(κ̃) and the fibers of π are isometric to a compact Lie group with non-negative Ricci curvature, then (M,ν,Γ) satisfies PI(κ) with 1/κ = max{1/κ̃, β·diam(G)²/π²}.",
      "evidence": "The proof decomposes the gradient into horizontal and vertical components (Lemmas 61, 62) and applies (a) the assumed PI on the base for the horizontal part — valid because F is fiber-constant so ν integrates to ν̃ when pushed by π — and (b) Zhong's PI(π²/diam(G)²) for compact non-negatively curved fibers (Theorem 58) applied to each fiber's vertical Dirichlet form. The β factor in the second term arises from the dν normalization being independent of fiber coordinates because F is fiber-constant. The Fubini argument is justified via Lemma 63's regularity of the fiber-integrated function.",
      "id": "C5",
      "location": "Section 3.2 'Lifting and lowering a Poincaré inequality', Theorem 59 (lines 2078–2096).",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Theorem 34 (Poincaré inequality on the quotient): Under the assumptions of Section 2, (M/G,ν̃,Γ̃) satisfies PI(λ*/184).",
      "evidence": "The strategy follows LiErd2022 Appendix D: build a local PI(λ*/8) on G_3 := B(a/√β, x*) via Bakry–Émery on a geodesically convex set under CD(λ*/4) (Lemma 50, sound given the stated β bounds), then extend to all of B using two Lyapunov functions W_1 = exp(βF̃/2) (escape from G_3^c) and W_2 = E[exp(λ*τ*/16)|X̃_0=x] (local escape time from saddles via a CIR-process comparison in Section 11). The numerical constant 184 is a specific bookkeeping outcome from chained bounds (bump function gradient bound, Lyapunov drift inequalities, restriction-to-extension PI loss); the global structure is in line with the Bakry–Barthe–Cattiaux–Guillin Lyapunov-PI program, but the specific numeric factor depends on auxiliary results (escaping-time bound of a generalized CIR process, bump-function gradient bound, local PI factor) whose intermediate calculations were not all reproducible from the text alone.",
      "id": "C6",
      "location": "Section 2 'Poincaré inequality under unique minimum', Theorem 34 (referenced throughout Section 2; proof spanning lines ~1499–1844).",
      "severity": "minor",
      "suggested_fix": "Add an explicit table or summary of the constants contributed by each step (local PI factor 1/8, bump-function gradient cost, Lyapunov drift constants, CIR escape exponent λ*/16) so the reader can audit the 184 numerical factor end-to-end."
    },
    {
      "assessment": "supported",
      "claim": "Polynomial-dimension scaling (Remark 16 / informal Theorem 14): If β ∈ Ω(poly(dim M)) and diam(M), diam(M/G), diam(G), R_M, R_{M/G} grow polynomially in dim(M), then 1/α and 1/α̃ ∈ O(poly(dim M)), so mixing times are polynomial in dim(M).",
      "evidence": "Direct algebraic consequence of the explicit LSI formulas in Theorem 76: each multiplicative factor (β, A_2 + R_M, diam(M)², 184/λ*, β·diam(G)²/π²) is poly(dim) under the stated growth hypotheses on β, diam, and Ric lower bounds. The 'rate Ω(1/poly(dim))' for the TV bound then follows from Corollary 77.",
      "id": "C7",
      "location": "Section 1.1 'Main results', Remark 16; combined with Theorem 76.",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "unsupported",
      "claim": "Concrete computational verification of the polynomial-dimension mixing-time claim on the named examples (trace-ratio minimization on Stiefel/Grassmann and the mean-field 2D Ising model).",
      "evidence": "For a paper in math.PR/stat.* whose load-bearing claim is 'polynomial in dim mixing times are achievable', the standard proof-as-code artifact would be a small simulation showing empirical mixing-time scaling on the trace-ratio example (dim m × n complex matrices, varying n, with the explicit Riemannian submersion to a Grassmannian/Stiefel quotient) and/or the 2D Ising mean-field example, validating that the predicted β-threshold and the predicted exponential decay rate are not vacuous. The text mentions the trace-ratio problem (Eq. F(X) = Tr(X†AX)/Tr(X†BX)) but ships no code, and the present prompt excerpt does not contain Section 7's analysis. Absence of an executable artifact does not invalidate the theorems but leaves the headline claim 'mixing times polynomial in dimension are achievable' empirically unchecked.",
      "id": "C8",
      "location": "Headline claims in the abstract and Introduction; the paper references Section 7 (sec:traceratio) and the two-dimensional ferromagnetic Ising mean-field example, but no executable artifact (Langevin simulation, mixing-time empirical estimate, or numerical sanity check of the constants 184, 736, etc.) is shipped with the paper.",
      "severity": "major",
      "suggested_fix": "Ship simulation code for the trace-ratio example (e.g., experiments/trace_ratio/langevin.py performing the Langevin SDE on the Stiefel manifold and reporting TV distance to the Gibbs measure as a function of t and dimension) and for the 2D mean-field Ising example (experiments/ising_meanfield/run.py). At minimum, include a benchmark that computes the explicit constants A_2, A_3, λ*, D, conv(M/G), i(M/G) for the example and compares the predicted mixing time against an empirical estimator."
    },
    {
      "assessment": "partially_supported",
      "claim": "Section 7 (trace-ratio minimization and 2D Ising mean-field analysis) and Section 8 (Riemannian-geometry background) are referenced throughout the paper to justify the applicability of the assumptions on the named examples and to supply background results (e.g., O'Neill curvature formulas, existence of Riemannian-submersion metrics, Proposition 168 about projected Hessians).",
      "evidence": "The body of the paper jumps from Section 6 (Suboptimality, ending line 3105) directly to Acknowledgements (line 3107) and then to appendices on Sobolev spaces, Bakry-Émery theory, and SDEs. The named Section 7 (sec:traceratio) and Section 8 (SectionExamples) are not present in the supplied review_input. Verification of Remark 11 (kernel-of-Hessian condition) and of the example-specific assumptions (free isometric Lie-group action, λ* lower bound, no barren plateaus) depends on those missing sections. If they are present in the full submitted PDF this is a packaging issue; if not, the paper has a gap between informal claims about applicability and formal verification.",
      "id": "C9",
      "location": "Forward references in Introduction (lines 153, 199, 322, 493–500) and in Theorem 76's proof; back-references to Section 8 throughout (e.g., 'cf. existenceRiemannianSubmersionMetrics', 'cf. CurvaturaSubmersion', 'cf. prop:projectedHessian').",
      "severity": "minor",
      "suggested_fix": "Either (i) include the full Sections 7 and 8 in the canonical submission and confirm the cross-reference numbering, or (ii) if those sections are deferred to a companion paper [@ourwork], state this explicitly at first mention and rephrase the abstract / Introduction so they do not promise an example analysis the paper does not contain."
    },
    {
      "assessment": "supported",
      "claim": "Existence and uniqueness of the Langevin diffusion as the unique F-adapted semimartingale solving the martingale problem for L on a compact Riemannian manifold (Definition 19), and the equivalence to the formal SDE dX_t = −grad_g F(X_t) dt + √(2/β) dW_t.",
      "evidence": "This is a standard result for compact Riemannian manifolds with smooth drift and constant diffusion coefficient, with the correct citation to Hsu, 'Stochastic Analysis on Manifolds', Theorems 1.3.4 and 1.3.6.",
      "id": "C10",
      "location": "Section 2, Definitions 17–19 (lines 527–566).",
      "severity": "info",
      "suggested_fix": null
    }
  ],
  "confidence": 0.68,
  "overall_correctness": "mostly_sound"
}
```

## Corrections

<!-- corrections-section: rendered from corrections table; empty on first publish -->
_No corrections have been recorded._

## Bibliography

1. doCarmoriemannian: title=Riemannian geometry, author=Do Carmo, Manfredo Perdigao and Flaherty Francis, J, volume=6, year=1992, publisher=Springer
2. besse2007einstein: title=Einstein Manifolds, author=Besse, A.L., isbn=9783540741206, lccn=2007938035, series=Classics in Mathematics, url=https://books.google.es/books?id=aVUjiBNCyogC, year=2007, publisher=Springer Berlin Heidelberg
3. LiErd2022: title=Riemannian Langevin algorithm for solving semidefinite programs, author=Li, Mufan and Erdogdu, Murat A, journal=Bernoulli, volume=29, number=4, pages=3093--3113, year=2023, publisher=Bernoulli Society for Mathematical Statistics and Probability
4. LiErd2022Supp: author = Mufan Li and Murat A. Erdogdu, title = Supplement to "Riemannian Langevin algorithm for solving semidefinite programs", year = 2023, doi = 10.3150/22-BEJ1576SUPP, URL = https://doi.org/10.3150/22-BEJ1576SUPP doi:[10.3150/22-BEJ1576SUPP](https://doi.org/10.3150/22-BEJ1576SUPP)
5. Gray1979: author = A. Gray and L. Vanhecke, title = Riemannian geometry as determined by the volumes of small geodesic balls, volume = 142, journal = Acta Mathematica, publisher = Institut Mittag-Leffler, pages = 157 -- 198, year = 1979, doi = 10.1007/BF02395060, URL = https://doi.org/10.1007/BF02395060, doi:[10.1007/BF02395060](https://doi.org/10.1007/BF02395060)
6. Croke1980: author = Croke, Christopher B., title = Some isoperimetric inequalities and eigenvalue estimates, journal = Annales scientifiques de l'\'Ecole Normale Sup\'erieure, pages = 419--435, publisher = Elsevier, volume = Ser. 4, 13, number = 4, year = 1980, doi = 10.24033/asens.1390, zbl = 0465.53032, url = http://www.numdam.org/articles/10.24033/asens.1390/ doi:[10.24033/asens.1390](https://doi.org/10.24033/asens.1390) arXiv:[0465.53032](https://arxiv.org/abs/0465.53032)
7. villani2008optimal: title=Optimal Transport: Old and New, author=Villani, C., isbn=9783540710509, lccn=2008932183, series=Grundlehren der mathematischen Wissenschaften, url=https://books.google.es/books?id=hV8o5R7\_5tkC, year=2008, publisher=Springer Berlin Heidelberg
8. bakry2013analysis: title=Analysis and Geometry of Markov Diffusion Operators, author=Bakry, D. and Gentil, I. and Ledoux, M., isbn=9783319002279, lccn=2013952461, series=Grundlehren der mathematischen Wissenschaften, url=https://books.google.es/books?id=gU3ABAAAQBAJ, year=2013, publisher=Springer International Publishing
9. Bakry2008: author = Dominique Bakry and Franck Barthe and Patrick Cattiaux and Arnaud Guillin, title = A simple proof of the Poincaré inequality for a large class of probability measures, volume = 13, journal = Electronic Communications in Probability, publisher = Institute of Mathematical Statistics and Bernoulli Society, pages = 60 -- 66, keywords = log-concave measure, Lyapunov functions, Poincaré inequality, year = 2008, doi = 10.1214/ECP.v13-1352, URL = https://doi.org/10.1214/ECP.v13-1352 doi:[10.1214/ECP.v13-1352](https://doi.org/10.1214/ECP.v13-1352)
10. steele2012stochastic: title=Stochastic Calculus and Financial Applications, author=Steele, J.M., isbn=9781468493054, series=Stochastic Modelling and Applied Probability, url=https://books.google.es/books?id=fsgkBAAAQBAJ, year=2012, publisher=Springer New York
11. Qian1997: title=A gradient estimate on a manifold with convex boundary, volume=127, DOI=10.1017/S0308210500023568, number=1, journal=Proceedings of the Royal Society of Edinburgh: Section A Mathematics, publisher=Royal Society of Edinburgh Scotland Foundation, author=Qian, Zhongmin, year=1997, pages=171–179, doi:[10.1017/S0308210500023568](https://doi.org/10.1017/S0308210500023568)
12. bovier2015metastability: title=Metastability: A Potential-Theoretic Approach, author=Bovier, A. and den Hollander, F., isbn=9783319247762, series=Die Grundlehren der mathematischen Wissenschaften, url=https://books.google.es/books?id=yzDlzQEACAAJ, year=2015, publisher=Springer International Publishing
13. wainwright2019high: title=High-Dimensional Statistics: A Non-Asymptotic Viewpoint, author=Wainwright, M.J., isbn=9781108498029, lccn=2018043475, series=Cambridge Series in Statistical and Probabilistic Mathematics, url=https://books.google.es/books?id=8C8nuQEACAAJ, year=2019, publisher=Cambridge University Press
14. evans2010partial: title=Partial Differential Equations, author=Evans, L.C., isbn=9780821849743, lccn=2009044716, series=Graduate studies in mathematics, url=https://books.google.es/books?id=Xnu0o\_EJrCQC, year=2010, publisher=American Mathematical Society
15. boumal2022intromanifolds: title = An introduction to optimization on smooth manifolds, author = Boumal, Nicolas, howpublished = To appear with Cambridge University Press, year = 2022, url = https://www.nicolasboumal.net/book,
16. pardoux2014stochastic: title=Stochastic Differential Equations, Backward SDEs, Partial Differential Equations, author=Pardoux, E. and R\ua\cscanu, A., isbn=9783319057149, series=Stochastic Modelling and Applied Probability, url=https://books.google.es/books?id=j4nkAwAAQBAJ, year=2014, publisher=Springer International Publishing
17. hsustochastic: title=Stochastic Analysis on Manifolds, author=Hsu, E.P., isbn=9780821883884, series=Contemporary Mathematics, url=https://books.google.es/books?id=2NM0Z7svRmEC, publisher=American Mathematical Soc., year = 2002
18. lee2018introductionRiemannian: title=Introduction to Riemannian manifolds, author=Lee, John M, volume=2, year=2018, publisher=Springer
19. WangAnalysisforDiffusion: author = Wang, Feng-Yu, title = Analysis for Diffusion Processes on Riemannian Manifolds, publisher = World Scientific, year = 2013, doi = 10.1142/8737, address = , edition = , doi:[10.1142/8737](https://doi.org/10.1142/8737)
20. FrobeniusNorm: doi = 10.1016/j.laa.2008.05.020, year = 2008, month = oct, publisher = Elsevier BV, volume = 429, number = 8-9, pages = 1864--1885, author = Albrecht B\"ottcher and David Wenzel, title = The Frobenius norm and the commutator, journal = Linear Algebra and its Applications doi:[10.1016/j.laa.2008.05.020](https://doi.org/10.1016/j.laa.2008.05.020)
21. oneill1966fundamental: title=The fundamental equations of a submersion., author=O'Neill, Barrett, journal=Michigan Mathematical Journal, volume=13, number=4, pages=459--469, year=1966, publisher=University of Michigan, Department of Mathematics
22. berger2007panoramic: title=A Panoramic View of Riemannian Geometry, author=Berger, M., isbn=9783540653172, lccn=2007925272, url=https://books.google.es/books?id=d_SsagQckaQC, year=2007, publisher=Springer Berlin Heidelberg
23. gilbarg1977elliptic: title=Elliptic partial differential equations of second order, author=Gilbarg, David and Trudinger, Neil S, year=1977, publisher=Springer
24. Grigoryan_2024: title=Lecture notes on Analysis on Manifolds, author=Grigor’yan, Alexander, year=2024, publisher=Bielefeld University, url=https://www.math.uni-bielefeld.de/ grigor/anman2.pdf
25. lando2013graphs: title=Graphs on surfaces and their applications, author=Lando, Sergei K and Zvonkin, Alexander K, volume=141, year=2013, publisher=Springer Science \& Business Media
26. wang2009log: title=Log-Sobolev inequality on non-convex Riemannian manifolds, author=Wang, Feng-Yu, journal=Advances in Mathematics, volume=222, number=5, pages=1503--1520, year=2009, publisher=Elsevier
27. oneil1967submersions: title=Submersions and geodesics, author=O’Neill, Barrett, journal=Duke Math. J., volume=34, number=1, pages=363--373, year=1967
28. milnor1997topology: title=Topology from the differentiable viewpoint, author=Milnor, John Willard and Weaver, David W, volume=21, year=1997, publisher=Princeton university press
29. Klingenberg: ISSN = 0003486X, 19398980, URL = http://www.jstor.org/stable/1970029, author = W. Klingenberg, journal = Annals of Mathematics, number = 3, pages = 654--666, publisher = [Annals of Mathematics, Trustees of Princeton University on Behalf of the Annals of Mathematics, Mathematics Department, Princeton University], title = Contributions to Riemannian Geometry in the Large, urldate = 2024-06-25, volume = 69, year = 1959
30. petersen2006riemannian: title=Riemannian Geometry, author=Petersen, P., isbn=9780387294032, lccn=97005786, series=Graduate Texts in Mathematics, url=https://books.google.es/books?id=9cekXdo52hEC, year=2006, publisher=Springer New York
31. autenried2014sub: title=Sub-Riemannian geometry of Stiefel manifolds, author=Autenried, Christian and Markina, Irina, journal=SIAM Journal on Control and Optimization, volume=52, number=2, pages=939--959, year=2014, publisher=SIAM
32. sulanke1972differentialgeometrie: title=Differentialgeometrie und Faserb\"undel, author=Sulanke, Rolf and Wintgen, Peter, volume=48, year=1972, publisher=Springer
33. wang2006functional: title=Functional inequalities Markov semigroups and spectral theory, author=Wang, Fengyu, year=2006, publisher=Elsevier
34. hsu2008brownian: title=A brief introduction to Brownian motion on a Riemannian manifold, author=Hsu, Elton P, journal=lecture notes, year=2008
35. revuz2013continuous: title=Continuous martingales and Brownian motion, author=Revuz, Daniel and Yor, Marc, volume=293, year=2013, publisher=Springer Science \& Business Media
36. cox1985theory: title=A theory of the term structure of interest rates, author=Cox, John C and Ingersoll, Jonathan E and Ross, Stephen A and others, journal=Econometrica, volume=53, number=2, pages=385--407, year=1985, publisher=World Scientific
37. andrews2010ricci: title=The Ricci flow in Riemannian geometry: a complete proof of the differentiable 1/4-pinching sphere theorem, author=Andrews, Ben and Hopper, Christopher, year=2010, publisher=Springer
38. stewart1998matrix: title=Matrix algorithms: volume 1: basic decompositions, author=Stewart, Gilbert W, year=1998, publisher=SIAM
39. shen2010tracequotient: title=A geometric revisit to the trace quotient problem, author=Shen, Hao and Diepold, Klaus and H\"uper, Knut, booktitle=Proceedings of the 19th International Symposium of Mathematical Theory of Networks and Systems (MTNS 2010), pages=1, year=2010
40. horn2012matrix: title=Matrix analysis, author=Horn, Roger A and Johnson, Charles R, year=2012, publisher=Cambridge university press
41. batir2008inequalities: title=Inequalities for the gamma function, author=Batir, Necdet, journal=Archiv der Mathematik, volume=91, number=6, pages=554--563, year=2008, publisher=Birkh user-Verlag, Basel
42. escobales1975riemannian: title=Riemannian submersions with totally geodesic fibers, author=Escobales Jr, Richard H, journal=Journal of Differential Geometry, volume=10, number=2, pages=253--276, year=1975, publisher=Lehigh University
43. cohen1998topology: title=The topology of fiber bundles lecture notes, author=Cohen, Ralph L, journal=Standford University, year=1998
44. oksendal2013stochastic: title=Stochastic differential equations: an introduction with applications, author=Oksendal, Bernt, year=2013, publisher=Springer Science \& Business Media
45. akhtari2024cox: title=The Cox-Ingersoll-Ross process under volatility uncertainty, author=Akhtari, Bahar and Li, Hanwu, journal=Journal of Mathematical Analysis and Applications, volume=531, number=1, pages=127867, year=2024, publisher=Elsevier
46. bendokat2024grassmann: title=A Grassmann manifold handbook: Basic geometry and computational aspects, author=Bendokat, Thomas and Zimmermann, Ralf and Absil, P-A, journal=Advances in Computational Mathematics, volume=50, number=1, pages=6, year=2024, publisher=Springer
47. rentmeesters2013algorithms: title=Algorithms for data fitting on some common homogeneous spaces, author=Rentmeesters, Quentin and others, year=2013, school=Ph. D. thesis, Universit\'e Catholique de Louvain, Louvain, Belgium
48. absil2025ultimate: title=The ultimate upper bound on the injectivity radius of the Stiefel manifold, author=Absil, P-A and Mataigne, Simon, journal=SIAM Journal on Matrix Analysis and Applications, volume=46, number=2, pages=1145--1167, year=2025, publisher=SIAM
49. jolliffe2011principal: title=Principal component analysis, author=Jolliffe, Ian, booktitle=International encyclopedia of statistical science, pages=1094--1096, year=2011, publisher=Springer
50. yan2005graph: title=Graph embedding: A general framework for dimensionality reduction, author=Yan, Shuicheng and Xu, Dong and Zhang, Benyu and Zhang, Hong-Jiang, booktitle=2005 IEEE Computer Society Conference on Computer Vision and Pattern Recognition (CVPR'05), volume=2, pages=830--837, year=2005, organization=IEEE
51. yanguez2025efficient: title=Efficient Quantum Measurements: Computational Max- and Measured R\'enyi Divergences and Applications, author=Álvaro Yángüez and Thomas A. Hahn and Jan Kochanowski, year=2025, eprint=2509.21308, archivePrefix=arXiv, url=https://arxiv.org/abs/2509.21308, arXiv:[2509.21308](https://arxiv.org/abs/2509.21308)
52. cheng2022efficient: title=Efficient sampling on Riemannian manifolds via Langevin MCMC, author=Cheng, Xiang and Zhang, Jingzhao and Sra, Suvrit, journal=Advances in Neural Information Processing Systems, volume=35, pages=5995--6006, year=2022
53. gallier2020differential: title=Differential geometry and lie groups, author=Gallier, JEAN QUAINTANCE and Quaintance, Jocelyn, volume=12, year=2020, publisher=Springer
54. schutz1980geometrical: title=Geometrical methods of mathematical physics, author=Schutz, Bernard F, year=1980, publisher=Cambridge university press
55. ourwork: author = "Páez Velasco, Pablo", title = "Tensor network manifolds and Riemannian fundamental theorem for tensor networks", note = "unpublished"
56. preguntastack: title = Escaping time of a modified CIR process, author = mathusername, howpublished = Mathematics Stack Exchange, eprint = https://math.stackexchange.com/q/5117199, archivePrefix=stackexchange, year = 2025, URL = https://math.stackexchange.com/q/5117199
57. fulton2013representation: title=Representation theory: a first course, author=Fulton, William and Harris, Joe, year=2013, publisher=Springer Science \& Business Media
58. diffpriv1: title=Differential privacy dynamics of langevin diffusion and noisy gradient descent, author=Chourasia, Rishav and Ye, Jiayuan and Shokri, Reza, journal=Advances in Neural Information Processing Systems, volume=34, pages=14771--14781, year=2021
59. diffpriv2: title=Can stochastic gradient Langevin dynamics provide differential privacy for deep learning?, author=Heller, Guy and Fetaya, Ethan, booktitle=2023 IEEE Conference on Secure and Trustworthy Machine Learning (SaTML), pages=68--106, year=2023, organization=IEEE
60. diffpriv3: title=Differential Privacy Guarantees for Stochastic Gradient Langevin Dynamics, author=Théo Ryffel and Francis Bach and David Pointcheval, year=2022, eprint=2201.11980, archivePrefix=arXiv, url=https://arxiv.org/abs/2201.11980, arXiv:[2201.11980](https://arxiv.org/abs/2201.11980)
61. cao2025dynamicalapproacharealaw: title=Dynamical approach to area law for lattice Yang-Mills, author=Sky Cao and Ron Nissim and Scott Sheffield, year=2025, eprint=2509.04688, archivePrefix=arXiv, url=https://arxiv.org/abs/2509.04688, arXiv:[2509.04688](https://arxiv.org/abs/2509.04688)
62. menz2014: author = Georg Menz and Andr\'e Schlichting, title = Poincaré and logarithmic Sobolev inequalities by decomposition of the energy landscape, volume = 42, journal = The Annals of Probability, number = 5, publisher = Institute of Mathematical Statistics, pages = 1809 -- 1884, keywords = diffusion process, Eyring–Kramers formula, Kramers law, Logarithmic Sobolev inequality, metastability, Poincaré inequality, spectral gap, weighted transport distance, year = 2014, doi = 10.1214/14-AOP908, URL = https://doi.org/10.1214/14-AOP908 doi:[10.1214/14-AOP908](https://doi.org/10.1214/14-AOP908)
63. cheeger1975comparison: title=Comparison theorems in Riemannian geometry, author=Cheeger, Jeff and Ebin, David G and Ebin, David Gregory, volume=9, year=1975, publisher=North-Holland Amsterdam
64. hirsch2012differential: title=Differential topology, author=Hirsch, Morris W, year=2012, publisher=Springer Science \& Business Media
65. xuquotient: title=Quotient-Space Diffusion Model, author=Xu, Yixian and Wang, Yusong and Luo, Shengjie and Gao, Kaiyuan and He, Tianyu and Liu, Chang and He, Di, note=Submitted to The Fourteenth International Conference on Learning Representations. Under review, year = 2026
66. menon2024geometrydeeplinearnetwork: title=The geometry of the deep linear network, author=Govind Menon, year=2024, eprint=2411.09004, archivePrefix=arXiv, url=https://arxiv.org/abs/2411.09004, arXiv:[2411.09004](https://arxiv.org/abs/2411.09004)
67. HIM23: author = Ching-Peng Huang and Dominik Inauen and Govind Menon, title = Motion by mean curvature and Dyson Brownian Motion, volume = 28, journal = Electronic Communications in Probability, publisher = Institute of Mathematical Statistics and Bernoulli Society, pages = 1 -- 10, keywords = Dyson Brownian motion, mean curvature, Riemannian submersion, year = 2023, doi = 10.1214/23-ECP540, URL = https://doi.org/10.1214/23-ECP540 doi:[10.1214/23-ECP540](https://doi.org/10.1214/23-ECP540)
68. menon2026implicitregularizationlangevindynamics: title=On the implicit regularization of Langevin dynamics with projected noise, author=Govind Menon and Austin J. Stromme and Adrien Vacher, year=2026, eprint=2602.12257, archivePrefix=arXiv, url=https://arxiv.org/abs/2602.12257, arXiv:[2602.12257](https://arxiv.org/abs/2602.12257)
69. safran2021effects: title=The effects of mild over-parameterization on the optimization landscape of shallow relu neural networks, author=Safran, Itay M and Yehudai, Gilad and Shamir, Ohad, booktitle=Conference on Learning Theory, pages=3889--3934, year=2021, organization=PMLR
70. fukumizu2019semi: title=Semi-flat minima and saddle points by embedding neural networks to overparameterization, author=Fukumizu, Kenji and Yamaguchi, Shoichiro and Mototake, Yoh-ichi and Tanaka, Mirai, journal=Advances in neural information processing systems, volume=32, year=2019
71. zhong1984estimate: title=On the estimate of first eigenvalue of a compact Riemannian manifold, author=Zhong, Jia Qing, journal=Sci. Sinica Ser. A, volume=27, pages=1265--1273, year=1984
72. chewi2025analysis: title=Analysis of langevin monte carlo from poincare to log-sobolev, author=Chewi, Sinho and Erdogdu, Murat A and Li, Mufan and Shen, Ruoqi and Zhang, Matthew S, journal=Foundations of Computational Mathematics, volume=25, number=4, pages=1345--1395, year=2025, publisher=Springer
73. vempala2019rapid: title=Rapid convergence of the unadjusted langevin algorithm: Isoperimetry suffices, author=Vempala, Santosh and Wibisono, Andre, journal=Advances in neural information processing systems, volume=32, year=2019
74. wibisono2019proximal: title=Proximal Langevin Algorithm: Rapid Convergence Under Isoperimetry, author=Andre Wibisono, year=2019, eprint=1911.01469, archivePrefix=arXiv, url=https://arxiv.org/abs/1911.01469, arXiv:[1911.01469](https://arxiv.org/abs/1911.01469)
75. brooks2011handbook: title=Handbook of markov chain monte carlo, author=Brooks, Steve and Gelman, Andrew and Jones, Galin and Meng, Xiao-Li, year=2011, publisher=CRC press
76. gelman1995bayesian: title=Bayesian data analysis, author=Gelman, Andrew and Carlin, John B and Stern, Hal S and Rubin, Donald B, year=1995, publisher=Chapman and Hall/CRC
77. mackay2003information: title=Information theory, inference and learning algorithms, author=MacKay, David JC, year=2003, publisher=Cambridge university press
78. robert2004monte: title=Monte Carlo statistical methods, author=Robert, Christian P and Casella, George and Casella, George, volume=2, year=2004, publisher=Springer
79. Creutz_2023: place=Cambridge, series=Cambridge Monographs on Mathematical Physics, title=Quarks, Gluons and Lattices, publisher=Cambridge University Press, author=Creutz, Michael, year=2023, collection=Cambridge Monographs on Mathematical Physics
80. absil2008optimization: title=Optimization algorithms on matrix manifolds, author=Absil, P-A and Mahony, Robert and Sepulchre, Rodolphe, year=2008, publisher=Princeton University Press
81. RevModPhys: title = Matrix product states and projected entangled pair states: Concepts, symmetries, theorems, author = Cirac, J. Ignacio and P\'erez-Garc\'\ia, David and Schuch, Norbert and Verstraete, Frank, journal = Rev. Mod. Phys., volume = 93, issue = 4, pages = 045003, numpages = 65, year = 2021, publisher = American Physical Society,
82. montvay1994quantum: title=Quantum fields on a lattice, author=Montvay, Istv\'an and M\"unster, Gernot, year=1994, publisher=Cambridge University Press
83. DMRGFrank: title = Density Matrix Renormalization Group and Periodic Boundary Conditions: A Quantum Information Perspective, author = Verstraete, F. and Porras, D. and Cirac, J. I., journal = Phys. Rev. Lett., volume = 93, issue = 22, pages = 227205, numpages = 4, year = 2004, publisher = American Physical Society, doi = 10.1103/PhysRevLett.93.227205, url = https://link.aps.org/doi/10.1103/PhysRevLett.93.227205 doi:[10.1103/PhysRevLett.93.227205](https://doi.org/10.1103/PhysRevLett.93.227205)
84. jerrum1993polynomial: title=Polynomial-time approximation algorithms for the Ising model, author=Jerrum, Mark and Sinclair, Alistair, journal=SIAM Journal on computing, volume=22, number=5, pages=1087--1116, year=1993, publisher=SIAM
85. Tsybakov2008: title=Introduction to Nonparametric Estimation, author=Tsybakov, Alexandre B., year=2008, publisher=Springer New York, NY
86. carlen2004logarithmic: title=Logarithmic Sobolev inequalities and spectral gaps, author=Carlen, Eric and Loss, Michael, journal=Contemporary Mathematics, volume=353, pages=53--60, year=2004, publisher=Providence, RI; American Mathematical Society; 1999
87. cattiaux2007weak: title=Weak logarithmic Sobolev inequalities and entropic convergence, author=Cattiaux, Patrick and Gentil, Ivan and Guillin, Arnaud, journal=Probability theory and related fields, volume=139, number=3, pages=563--603, year=2007, publisher=Springer

