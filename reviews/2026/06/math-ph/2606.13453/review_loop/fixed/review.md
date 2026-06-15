# Rapid mixing for Gibbs measures in Riemannian manifolds

GrokRxiv review of [arXiv:2606.13453](https://arxiv.org/abs/2606.13453) · `math-ph`

_Authors_: Ángela Capel, Marco Castrillón-López, Sofyan Iblisdir, Angelo Lucia, Pablo Páez-Velasco, David Pérez-García

## TL;DR

This paper establishes conditions under which continuous-time Langevin dynamics on Riemannian manifolds achieve polynomial mixing times, with a novel lifting technique for Poincaré and log-Sobolev inequalities through Riemannian submersions. The five specialist outputs converge on a broadly positive assessment of novelty and mathematical soundness, but diverge on reproducibility. The novelty reviewer (confidence 0.90) rates the contribution 'significant' (score 0.75): the generalization from products of spheres (Li–Erdogdu 2022) to general quotient manifolds via the submersion lifting is a non-trivial technical advance with no identified missing prior art. The technical-correctness reviewer (confidence 0.55, overall 'mostly_sound') finds no claim rated incorrect or unsupported; four claims are fully supported (C4, C7, C8, C9) and nine are partially supported with minor or major deficiencies. The single major-severity technical finding (C10) concerns the Section 7 application examples: the paper asserts that the trace-ratio and Ising instances satisfy the assumptions of Theorems 14 and 15 but provides no numerical verification. The reproducibility reviewer (score 0.28, confidence 0.83) flags a critical-severity gap—no machine-checkable proof artifact—and two major-severity gaps: no code repository and no executable scripts instantiating the geometric constants. The citation reviewer (confidence 0.95) finds excellent citation hygiene with two missing references (the original Bakry–Emery 1985 paper and Diaconis–Saloff-Coste 1994), neither affecting the validity of the mathematical arguments. Applying the recommendation gate: the paper's field (manifold sampling, stat/math) is code-amenable, reproducibility flagged a critical-severity missing proof-as-code artifact, and technical_correctness C10 is major severity. No missing artifact individually blocks a single headline claim in the sense that the proofs are present in the manuscript, so rejection is not warranted, but the combined reproducibility deficit and unverified application examples require more than minor revision. Recommendation: major_revision.

_Recommendation_: **Major revision** · _Confidence_: 72%

## Strengths

- The Riemannian submersion lifting of Poincaré inequalities from quotient to total space is a genuine methodological innovation: combining totally-geodesic-fiber conditions with Fubini decomposition of variance into horizontal and vertical components is technically non-trivial and closes a gap not covered by prior Euclidean or product-manifold analyses.
- Polynomial mixing-time guarantees for non-convex potentials on compact quotient manifolds (Theorem 14) avoid the exponential curse of dimensionality by explicitly excluding barren plateaus and isolating the unique global minimum via Lyapunov constructions modeled rigorously on Li–Erdogdu 2022 Appendix D.
- The paper correctly handles the full measure-theoretic setup—existence and uniqueness of the Langevin diffusion via Hsu (C9), the carré du champ identity (C8), and the Bakry–Émery curvature-dimension criterion (C7)—with precise theorem citations and no identified mathematical errors in the foundational machinery.
- Citation hygiene is excellent: authoritative textbooks (do Carmo, Bakry–Gentil–Ledoux, Boumal) and the primary algorithmic predecessor (Li–Erdogdu 2022) are correctly invoked, and lemmas are accurately mapped to their sources.
- The Gibbs-concentration result (Theorem 15) with dim(M)^2/epsilon scaling in beta provides a clean and practically interpretable boundary on the temperature regime needed to localize mass near the global minimum.

## Weaknesses

- No code repository, executable scripts, or symbolic-verification artifacts accompany the paper, leaving the reproducibility score at 0.28; neither the polynomial mixing-time constants nor the assumption-verification workflow for any example in Section 7 can be independently checked without re-deriving every intermediate proof step.
- No machine-checkable proof artifact (Lean, Coq, or Isabelle formalization) is provided for the main log-Sobolev and Poincaré inequality theorems, a critical-severity gap flagged by the reproducibility reviewer for a theoretical paper whose headline guarantees are expressed as formal inequalities.
- Section 7 asserts that the trace-ratio minimization and mean-field Ising examples satisfy the assumptions of Theorems 14 and 15 and inherit polynomial mixing-time guarantees, but no numerical simulation, worked constant computation, or even a formal per-assumption checklist is provided to substantiate these claims (C10, major severity).
- The informal statement of Theorem 14 uses abstract 'poly' notation without tracking explicit polynomial exponents through the Lyapunov-construction, submersion-lifting, and log-Sobolev-upgrade chain, making the dimensional dependence of the guarantee difficult to audit from the informal statement alone (C1, minor severity).
- Remark 5 and Proposition 176 claim that the Lipschitz constants of grad F and Hess F are preserved under the Riemannian submersion without imposing the totally-geodesic-fiber hypothesis; for non-totally-geodesic fibers the O'Neill tensor introduces correction terms that can inflate the Lipschitz constants of the descended functions (C5, minor severity).
- The original Bakry–Emery (1985) paper on diffusions hypercontractives, the foundational source for the curvature-dimension condition that underlies the entire log-Sobolev analysis, is not cited; the book-length Bakry–Gentil–Ledoux (2013) is present but does not substitute for attribution to the originating result.

## Revision Targets

- [ ] **Evaluation pipeline**
  - Location: `HAC/bootstrap` at `evaluation and statistical-testing pipeline`
  - Evidence: The paper states polynomial mixing-time conditions with many geometric constants, but does not provide executable examples or scripts that instantiate the constants and verify the assumptions on the trace-ratio or other motivating manifolds.
  - Required change: Publish evaluation scripts or executable pseudocode for walk-forward retraining, validation selection, HAC/bootstrap settings, benchmark construction, and table regeneration.
  - Verification: Re-review should confirm the evaluation pipeline can reproduce the reported statistical tests and benchmarks.
- [ ] **Manuscript: reproducibility appendix**
  - Location: `corrections/2606.13453/paper.tex` at `reproducibility appendix`
  - Evidence: The headline theoretical results are supported by manuscript proofs only; no machine-checkable proof artifact is supplied, e.g. a Lean/Coq/Isabelle development covering the main log-Sobolev and Poincare inequality theorems.
  - Required change: Add a reproducibility note that resolves this concern: The headline theoretical results are supported by manuscript proofs only; no machine-checkable proof artifact is supplied, e.g. a Lean/Coq/Isabelle development covering the main log-Sobolev and Poincare inequality theorems.
  - Verification: Re-review should confirm the reproducibility concern is addressed with a concrete artifact or manuscript update.
- [ ] **Manuscript: Section 7 (sec:traceratio)**
  - Location: `corrections/2606.13453/paper.tex` at `Section 7 (sec:traceratio)`
  - Evidence: Assumption verification for the trace-ratio quotient is plausible — the symmetry group is U(m), the action is free on the open dense set where rank(X) = m, the quotient is a Grassmannian-like manifold, and trace-ratio is known to have a unique minimum after quotienting. However, several non-trivial conditions are required: (i) freeness of the U(m) action requires excluding rank-deficient strata; (ii) verification of Assumptions 9–10 (eigenvalue bounds on nabla^2 tilde F at critical points) is delicate and depends on the matrices A, B; (iii) Assumption 12 (no barren plateaus / quantitative gradient lower bound) is not obviously satisfied for trace-ratio minimization in high dimensions, where the loss landscape is known empirically to flatten. Without numerical simulations demonstrating the predicted polynomial mixing time on representative instances, the practical relevance of the bound to these specific examples is asserted but not verified. For 'cs.*/stat.*' code-amenable claims of this form, executable verification is the standard.
  - Required change: Add a small numerical-experiments artifact (e.g., experiments/trace_ratio_mixing.py and experiments/ising_mixing.py) that empirically estimates mixing times of a discretized Langevin scheme on toy instances and compares against the polynomial-in-dim bound. If full empirical validation is out of scope, weaken the Section 7 claims to 'the assumptions of Theorem 14 are formally satisfied' without asserting practical mixing-time guarantees.
  - Verification: Re-review should confirm `Section 7 (sec:traceratio)` is corrected or justified.
- [ ] **Manuscript: Section 1.1 (Theorem 14, informal); formalized in Section 5**
  - Location: `corrections/2606.13453/paper.tex` at `Section 1.1 (Theorem 14, informal); formalized in Section 5`
  - Evidence: The theorem is the composition of (i) a Poincaré inequality on the base B (Theorem 34, Section 2), (ii) a lift to the total space via Riemannian submersion (Section 3), and (iii) a Poincaré-to-log-Sobolev upgrade via Bakry–Émery (Section 4). The roadmap and supporting standard results (Bakry-Ledoux, Bakry-Emery, Hsu's existence/uniqueness for Langevin SDE) are correctly cited, and the symmetric-space hypothesis is used to invoke totally geodesic fibers needed for the submersion machinery. However, the exact polynomial exponents are stated abstractly ('poly') without tight tracking through the proof chain, and the symmetric-space assumption is invoked in the informal statement but its precise role in unlocking polynomial scaling is only made explicit through long technical chains (Lyapunov constructions, escape-time bounds). The internal consistency of the dependencies (e.g., conv(M/G), i(M), i(M/G), K appearing in the beta bound but not in the alpha bound) cannot be fully audited from the informal statement.
  - Required change: In the formal version (Section 5), provide an explicit table that maps each constant entering the beta lower bound to the proof step that introduces it, and state the explicit polynomial exponents in dim(M). State explicitly whether the symmetric-space hypothesis is used only to ensure totally geodesic fibers and Ricci comparison, or also in the log-Sobolev upgrade.
  - Verification: Re-review should confirm `Section 1.1 (Theorem 14, informal); formalized in Section 5` is corrected or justified.
- [ ] **Manuscript: Section 1.1 (Remark 5); Proposition 176 (background)**
  - Location: `corrections/2606.13453/paper.tex` at `Section 1.1 (Remark 5); Proposition 176 (background)`
  - Evidence: Preservation of Lipschitz constants under a Riemannian submersion is plausible: at corresponding points, horizontal vectors are mapped isometrically, and any geodesic in M/G admits a horizontal lift of equal length. However, while the Lipschitz constant of F itself is straightforwardly preserved (paths in M/G lift to paths of equal length in M), preservation of the Lipschitz constants of grad and Hessian requires care because covariant derivatives in (M/G, h) and in (M, g) differ by O'Neill tensor terms; for general (non-totally-geodesic) submersions, the gradient/Hessian Lipschitz constants of tilde F are bounded by those of F plus correction terms involving the second fundamental form of the fibers. The paper restricts to totally geodesic fibers in some results, which makes these correction terms vanish, but Remark 5 is stated without that restriction.
  - Required change: State Remark 5 with the explicit hypothesis of totally geodesic fibers (already invoked elsewhere) or quantify the O'Neill correction so that A_2, A_3 are clearly admissible constants for tilde F on (M/G, h).
  - Verification: Re-review should confirm `Section 1.1 (Remark 5); Proposition 176 (background)` is corrected or justified.
- [ ] **Bibliography: Bakry, D., & Emery, M. (1985). Diffusions hypercontractives.**
  - Location: bibliography entry: `Bakry, D., & Emery, M. (1985). Diffusions hypercontractives.`
  - Evidence: The paper heavily uses Bakry-Emery theory (Gamma calculus) on manifolds but could benefit from citing the original papers by Bakry and Emery (1985) for the foundation of the curvature-dimension condition.
  - Required change: Add a bibliography entry for `Bakry, D., & Emery, M. (1985). Diffusions hypercontractives` and cite it where the affected method or claim is introduced, or explicitly justify its omission.
  - Verification: Re-review should confirm the bibliography and citation context address this reference.

## Open Questions

- In Theorem 14, what are the explicit polynomial exponents in dim(M) for 1/alpha and 1/tilde alpha after substituting beta at its polynomial lower bound, and does the symmetric-space hypothesis play any role beyond ensuring totally geodesic fibers and Ricci comparison, or is it also required in the Poincaré-to-log-Sobolev upgrade of Section 4?
- For the trace-ratio minimization example (Section 7), under what spectral conditions on matrices A and B is Assumption 12 (quantitative no-barren-plateau gradient lower bound) satisfied? Is there a known parameter regime where the loss landscape flattens in high dimension, invalidating the assumption?
- What is the precise polynomial exponent in the TV-distance decay rate claimed in Remark 16 when beta is set to its polynomial lower bound? Which families of quotient manifolds (beyond the two Section 7 examples) satisfy the polynomial-diameter hypothesis for diam(M), diam(M/G), and diam(G) simultaneously?
- Is there a companion discretization analysis that translates the continuous-time polynomial mixing guarantee of Theorem 14 into an explicit bound for a discretized Riemannian Langevin scheme (e.g., geodesic step or retraction-based), and if so, what step-size dependence would be required to maintain polynomial complexity?
- In the Poincaré-to-log-Sobolev upgrade (Section 4), what is the exact polynomial dependence of the log-Sobolev constant on beta and 1/lambda_*, and how does the 'defective log-Sobolev' intermediate step contribute to the final exponent that appears in Remark 16?

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
      "explanation": "Standard graduate-level textbook on Riemannian geometry, providing the foundational mathematical framework for the manifolds discussed.",
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
      "explanation": "A primary reference for the Riemannian Langevin algorithm, whose results and proof techniques (especially for Poincare inequalities) are directly extended in this work.",
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
      "explanation": "Fundamental reference for Bakry-Emery theory and the relationship between Markov operators, Poincare inequalities, and log-Sobolev inequalities.",
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
      "explanation": "Provides the modern context for optimization on manifolds, which motivates the sampling problems addressed by Langevin dynamics.",
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
        "venue": "MTNS 2010",
        "year": 2010
      },
      "exists": null,
      "explanation": "Crucial for the 'Trace ratio minimization' example, providing the geometric analysis of the critical points and minima for the projected version of the problem.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    }
  ],
  "missing_references": [
    {
      "reason": "The paper heavily uses Bakry-Emery theory (Gamma calculus) on manifolds but could benefit from citing the original papers by Bakry and Emery (1985) for the foundation of the curvature-dimension condition.",
      "title": "Bakry, D., & Emery, M. (1985). Diffusions hypercontractives."
    },
    {
      "reason": "The discussion on Riemannian submersions and their impact on sampling could include a reference to earlier work on quotient space sampling in the statistics literature.",
      "title": "Diaconis, P., & Saloff-Coste, L. (1994). Moderate growth and random walk on finite groups."
    }
  ],
  "summary": "The paper exhibits excellent citation hygiene, relying on authoritative textbooks for foundational geometry and stochastic analysis while citing contemporary research for its primary results. The bibliography is comprehensive, covering physics applications, optimization on manifolds, and specific algorithmic precedents. Key lemmas and theorems are accurately mapped to their sources in the literature."
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.72,
  "questions": [
    "In Theorem 14, what are the explicit polynomial exponents in dim(M) for 1/alpha and 1/tilde alpha after substituting beta at its polynomial lower bound, and does the symmetric-space hypothesis play any role beyond ensuring totally geodesic fibers and Ricci comparison, or is it also required in the Poincaré-to-log-Sobolev upgrade of Section 4?",
    "For the trace-ratio minimization example (Section 7), under what spectral conditions on matrices A and B is Assumption 12 (quantitative no-barren-plateau gradient lower bound) satisfied? Is there a known parameter regime where the loss landscape flattens in high dimension, invalidating the assumption?",
    "What is the precise polynomial exponent in the TV-distance decay rate claimed in Remark 16 when beta is set to its polynomial lower bound? Which families of quotient manifolds (beyond the two Section 7 examples) satisfy the polynomial-diameter hypothesis for diam(M), diam(M/G), and diam(G) simultaneously?",
    "Is there a companion discretization analysis that translates the continuous-time polynomial mixing guarantee of Theorem 14 into an explicit bound for a discretized Riemannian Langevin scheme (e.g., geodesic step or retraction-based), and if so, what step-size dependence would be required to maintain polynomial complexity?",
    "In the Poincaré-to-log-Sobolev upgrade (Section 4), what is the exact polynomial dependence of the log-Sobolev constant on beta and 1/lambda_*, and how does the 'defective log-Sobolev' intermediate step contribute to the final exponent that appears in Remark 16?"
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "The paper states polynomial mixing-time conditions with many geometric constants, but does not provide executable examples or scripts that instantiate the constants and verify the assumptions on the trace-ratio or other motivating manifolds.",
      "id": "weakness-1",
      "locator": "evaluation and statistical-testing pipeline",
      "required_update": "Publish evaluation scripts or executable pseudocode for walk-forward retraining, validation selection, HAC/bootstrap settings, benchmark construction, and table regeneration.",
      "source_path": "HAC/bootstrap",
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "code",
      "verification_check": "Re-review should confirm the evaluation pipeline can reproduce the reported statistical tests and benchmarks.",
      "weakness_index": 0
    },
    {
      "evidence": "The headline theoretical results are supported by manuscript proofs only; no machine-checkable proof artifact is supplied, e.g. a Lean/Coq/Isabelle development covering the main log-Sobolev and Poincare inequality theorems.",
      "id": "weakness-2",
      "locator": "reproducibility appendix",
      "required_update": "Add a reproducibility note that resolves this concern: The headline theoretical results are supported by manuscript proofs only; no machine-checkable proof artifact is supplied, e.g. a Lean/Coq/Isabelle development covering the main log-Sobolev and Poincare inequality theorems.",
      "source_path": "corrections/2606.13453/paper.tex",
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm the reproducibility concern is addressed with a concrete artifact or manuscript update.",
      "weakness_index": 1
    },
    {
      "evidence": "Assumption verification for the trace-ratio quotient is plausible — the symmetry group is U(m), the action is free on the open dense set where rank(X) = m, the quotient is a Grassmannian-like manifold, and trace-ratio is known to have a unique minimum after quotienting. However, several non-trivial conditions are required: (i) freeness of the U(m) action requires excluding rank-deficient strata; (ii) verification of Assumptions 9–10 (eigenvalue bounds on nabla^2 tilde F at critical points) is delicate and depends on the matrices A, B; (iii) Assumption 12 (no barren plateaus / quantitative gradient lower bound) is not obviously satisfied for trace-ratio minimization in high dimensions, where the loss landscape is known empirically to flatten. Without numerical simulations demonstrating the predicted polynomial mixing time on representative instances, the practical relevance of the bound to these specific examples is asserted but not verified. For 'cs.*/stat.*' code-amenable claims of this form, executable verification is the standard.",
      "id": "weakness-3",
      "locator": "Section 7 (sec:traceratio)",
      "required_update": "Add a small numerical-experiments artifact (e.g., experiments/trace_ratio_mixing.py and experiments/ising_mixing.py) that empirically estimates mixing times of a discretized Langevin scheme on toy instances and compares against the polynomial-in-dim bound. If full empirical validation is out of scope, weaken the Section 7 claims to 'the assumptions of Theorem 14 are formally satisfied' without asserting practical mixing-time guarantees.",
      "source_path": "corrections/2606.13453/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 7 (sec:traceratio)` is corrected or justified.",
      "weakness_index": 2
    },
    {
      "evidence": "The theorem is the composition of (i) a Poincaré inequality on the base B (Theorem 34, Section 2), (ii) a lift to the total space via Riemannian submersion (Section 3), and (iii) a Poincaré-to-log-Sobolev upgrade via Bakry–Émery (Section 4). The roadmap and supporting standard results (Bakry-Ledoux, Bakry-Emery, Hsu's existence/uniqueness for Langevin SDE) are correctly cited, and the symmetric-space hypothesis is used to invoke totally geodesic fibers needed for the submersion machinery. However, the exact polynomial exponents are stated abstractly ('poly') without tight tracking through the proof chain, and the symmetric-space assumption is invoked in the informal statement but its precise role in unlocking polynomial scaling is only made explicit through long technical chains (Lyapunov constructions, escape-time bounds). The internal consistency of the dependencies (e.g., conv(M/G), i(M), i(M/G), K appearing in the beta bound but not in the alpha bound) cannot be fully audited from the informal statement.",
      "id": "weakness-4",
      "locator": "Section 1.1 (Theorem 14, informal); formalized in Section 5",
      "required_update": "In the formal version (Section 5), provide an explicit table that maps each constant entering the beta lower bound to the proof step that introduces it, and state the explicit polynomial exponents in dim(M). State explicitly whether the symmetric-space hypothesis is used only to ensure totally geodesic fibers and Ricci comparison, or also in the log-Sobolev upgrade.",
      "source_path": "corrections/2606.13453/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 1.1 (Theorem 14, informal); formalized in Section 5` is corrected or justified.",
      "weakness_index": 3
    },
    {
      "evidence": "Preservation of Lipschitz constants under a Riemannian submersion is plausible: at corresponding points, horizontal vectors are mapped isometrically, and any geodesic in M/G admits a horizontal lift of equal length. However, while the Lipschitz constant of F itself is straightforwardly preserved (paths in M/G lift to paths of equal length in M), preservation of the Lipschitz constants of grad and Hessian requires care because covariant derivatives in (M/G, h) and in (M, g) differ by O'Neill tensor terms; for general (non-totally-geodesic) submersions, the gradient/Hessian Lipschitz constants of tilde F are bounded by those of F plus correction terms involving the second fundamental form of the fibers. The paper restricts to totally geodesic fibers in some results, which makes these correction terms vanish, but Remark 5 is stated without that restriction.",
      "id": "weakness-5",
      "locator": "Section 1.1 (Remark 5); Proposition 176 (background)",
      "required_update": "State Remark 5 with the explicit hypothesis of totally geodesic fibers (already invoked elsewhere) or quantify the O'Neill correction so that A_2, A_3 are clearly admissible constants for tilde F on (M/G, h).",
      "source_path": "corrections/2606.13453/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 1.1 (Remark 5); Proposition 176 (background)` is corrected or justified.",
      "weakness_index": 4
    },
    {
      "evidence": "The paper heavily uses Bakry-Emery theory (Gamma calculus) on manifolds but could benefit from citing the original papers by Bakry and Emery (1985) for the foundation of the curvature-dimension condition.",
      "id": "weakness-6",
      "locator": "Bakry, D., & Emery, M. (1985). Diffusions hypercontractives.",
      "required_update": "Add a bibliography entry for `Bakry, D., & Emery, M. (1985). Diffusions hypercontractives` and cite it where the affected method or claim is introduced, or explicitly justify its omission.",
      "source_path": null,
      "source_role": "citation",
      "status": "open",
      "target_kind": "bibliography",
      "verification_check": "Re-review should confirm the bibliography and citation context address this reference.",
      "weakness_index": 5
    }
  ],
  "strengths": [
    "The Riemannian submersion lifting of Poincaré inequalities from quotient to total space is a genuine methodological innovation: combining totally-geodesic-fiber conditions with Fubini decomposition of variance into horizontal and vertical components is technically non-trivial and closes a gap not covered by prior Euclidean or product-manifold analyses.",
    "Polynomial mixing-time guarantees for non-convex potentials on compact quotient manifolds (Theorem 14) avoid the exponential curse of dimensionality by explicitly excluding barren plateaus and isolating the unique global minimum via Lyapunov constructions modeled rigorously on Li–Erdogdu 2022 Appendix D.",
    "The paper correctly handles the full measure-theoretic setup—existence and uniqueness of the Langevin diffusion via Hsu (C9), the carré du champ identity (C8), and the Bakry–Émery curvature-dimension criterion (C7)—with precise theorem citations and no identified mathematical errors in the foundational machinery.",
    "Citation hygiene is excellent: authoritative textbooks (do Carmo, Bakry–Gentil–Ledoux, Boumal) and the primary algorithmic predecessor (Li–Erdogdu 2022) are correctly invoked, and lemmas are accurately mapped to their sources.",
    "The Gibbs-concentration result (Theorem 15) with dim(M)^2/epsilon scaling in beta provides a clean and practically interpretable boundary on the temperature regime needed to localize mass near the global minimum."
  ],
  "summary": "This paper establishes conditions under which continuous-time Langevin dynamics on Riemannian manifolds achieve polynomial mixing times, with a novel lifting technique for Poincaré and log-Sobolev inequalities through Riemannian submersions. The five specialist outputs converge on a broadly positive assessment of novelty and mathematical soundness, but diverge on reproducibility. The novelty reviewer (confidence 0.90) rates the contribution 'significant' (score 0.75): the generalization from products of spheres (Li–Erdogdu 2022) to general quotient manifolds via the submersion lifting is a non-trivial technical advance with no identified missing prior art. The technical-correctness reviewer (confidence 0.55, overall 'mostly_sound') finds no claim rated incorrect or unsupported; four claims are fully supported (C4, C7, C8, C9) and nine are partially supported with minor or major deficiencies. The single major-severity technical finding (C10) concerns the Section 7 application examples: the paper asserts that the trace-ratio and Ising instances satisfy the assumptions of Theorems 14 and 15 but provides no numerical verification. The reproducibility reviewer (score 0.28, confidence 0.83) flags a critical-severity gap—no machine-checkable proof artifact—and two major-severity gaps: no code repository and no executable scripts instantiating the geometric constants. The citation reviewer (confidence 0.95) finds excellent citation hygiene with two missing references (the original Bakry–Emery 1985 paper and Diaconis–Saloff-Coste 1994), neither affecting the validity of the mathematical arguments. Applying the recommendation gate: the paper's field (manifold sampling, stat/math) is code-amenable, reproducibility flagged a critical-severity missing proof-as-code artifact, and technical_correctness C10 is major severity. No missing artifact individually blocks a single headline claim in the sense that the proofs are present in the manuscript, so rejection is not warranted, but the combined reproducibility deficit and unverified application examples require more than minor revision. Recommendation: major_revision.",
  "weaknesses": [
    "No code repository, executable scripts, or symbolic-verification artifacts accompany the paper, leaving the reproducibility score at 0.28; neither the polynomial mixing-time constants nor the assumption-verification workflow for any example in Section 7 can be independently checked without re-deriving every intermediate proof step.",
    "No machine-checkable proof artifact (Lean, Coq, or Isabelle formalization) is provided for the main log-Sobolev and Poincaré inequality theorems, a critical-severity gap flagged by the reproducibility reviewer for a theoretical paper whose headline guarantees are expressed as formal inequalities.",
    "Section 7 asserts that the trace-ratio minimization and mean-field Ising examples satisfy the assumptions of Theorems 14 and 15 and inherit polynomial mixing-time guarantees, but no numerical simulation, worked constant computation, or even a formal per-assumption checklist is provided to substantiate these claims (C10, major severity).",
    "The informal statement of Theorem 14 uses abstract 'poly' notation without tracking explicit polynomial exponents through the Lyapunov-construction, submersion-lifting, and log-Sobolev-upgrade chain, making the dimensional dependence of the guarantee difficult to audit from the informal statement alone (C1, minor severity).",
    "Remark 5 and Proposition 176 claim that the Lipschitz constants of grad F and Hess F are preserved under the Riemannian submersion without imposing the totally-geodesic-fiber hypothesis; for non-totally-geodesic fibers the O'Neill tensor introduces correction terms that can inflate the Lipschitz constants of the descended functions (C5, minor severity).",
    "The original Bakry–Emery (1985) paper on diffusions hypercontractives, the foundational source for the curvature-dimension condition that underlies the entire log-Sobolev analysis, is not cited; the book-length Bakry–Gentil–Ledoux (2013) is present but does not substitute for attribution to the originating result."
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
      "delta": "This paper generalizes the sampling analysis from products of spheres to a much broader class of Riemannian manifolds, specifically focusing on quotient manifolds. It introduces a novel technique for 'lifting' Poincaré and log-Sobolev inequalities through Riemannian submersions to achieve polynomial mixing time bounds in terms of manifold dimension.",
      "relation": "builds_on",
      "title": "Riemannian Langevin algorithm for solving semidefinite programs"
    },
    {
      "citation_key": "menz2014",
      "delta": "While the reference establishes the use of Lyapunov functions for energy landscape decomposition in Euclidean space, this work adapts and extends these techniques to the Riemannian manifold setting to rigorously handle the escape from saddle points in the low-temperature regime.",
      "relation": "prior_art",
      "title": "Poincaré and logarithmic Sobolev inequalities by decomposition of the energy landscape"
    },
    {
      "citation_key": "bakry2013analysis",
      "delta": "Extends the classical Bakry-Émery framework by deriving explicit log-Sobolev constants for non-convex potentials on manifolds where the dimension-curvature condition is only satisfied locally, utilizing the geometric properties of submersions to bridge local and global estimates.",
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
      "description": "No code repository, release, commit, or license is provided for reproducing any symbolic checks, numerical experiments, or formal verification of the stated rapid-mixing claims.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "The headline theoretical results are supported by manuscript proofs only; no machine-checkable proof artifact is supplied, e.g. a Lean/Coq/Isabelle development covering the main log-Sobolev and Poincare inequality theorems.",
      "severity": "critical"
    },
    {
      "area": "evaluation",
      "description": "The paper states polynomial mixing-time conditions with many geometric constants, but does not provide executable examples or scripts that instantiate the constants and verify the assumptions on the trace-ratio or other motivating manifolds.",
      "severity": "major"
    },
    {
      "area": "data",
      "description": "No empirical dataset is needed for the core theoretical claims, but no reusable benchmark instance or synthetic configuration is provided for independently exercising the motivating sampling scenarios.",
      "severity": "minor"
    },
    {
      "area": "compute",
      "description": "No hardware or runtime requirements are specified because no executable reproduction workflow is provided.",
      "severity": "minor"
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
  "confidence": 0.83,
  "data_availability": "unspecified",
  "data_url": null,
  "environment": null,
  "reproducibility_score": 0.28
}
```

### summary (`claude-haiku-4-5-20251001`) — status: `pass`

```json
{
  "audience": "Applied mathematicians, statisticians, and researchers in optimization and machine learning interested in sampling algorithms on manifolds; researchers in statistical physics and lattice gauge theory; geometers studying Markov processes on curved spaces",
  "key_contributions": [
    "Identifies conditions on manifold curvature, temperature, and function landscape geometry that ensure Langevin dynamics satisfy logarithmic Sobolev inequalities and achieve rapid mixing",
    "Proves that mixing times scale polynomially in the manifold dimension when the identified conditions are met, avoiding exponential dependence",
    "Develops a lifting technique for Poincaré inequalities from quotient manifolds to total spaces of Riemannian submersions, enabling analysis of dynamical systems with group symmetries",
    "Shows how to relate Langevin dynamics on a manifold and its quotient space, with applications to symmetry-breaking minimization problems",
    "Establishes explicit conditions excluding barren plateaus and spurious local minima that would prevent rapid mixing",
    "Applies the theoretical framework to trace-ratio minimization and mean-field Ising model, demonstrating that key assumptions can be verified for practical problems"
  ],
  "plain_language_summary": "This paper analyzes how well a stochastic process called Langevin dynamics can sample from probability distributions defined on curved spaces (Riemannian manifolds). The main question is: how fast does the process converge to the target distribution? The authors identify specific geometric and analytical conditions—involving the curvature of the manifold, the properties of the energy function, and the ability to escape from saddle points—that guarantee rapid convergence. They show that when these conditions are met, the convergence time grows only polynomially with the dimension of the space, which is practically achievable.\n\nA key technical innovation is the use of Riemannian submersions: when a function has symmetries that can be captured by a group action, the authors show how to study the dynamics on the quotient (reduced) manifold and lift the convergence guarantees back to the original space. This approach avoids several known obstacles to fast mixing, such as barren plateaus (regions where the gradient is nearly zero) and multiple local minima that trap the dynamics.\n\nThe results apply to several practical problems, including trace-ratio minimization in principal component analysis and sampling in statistical physics models like the Ising model. The work combines tools from differential geometry, probability theory, and the theory of Markov chains to provide a unified framework for understanding when sampling on manifolds is computationally efficient.",
  "tldr": "The paper establishes conditions under which Langevin dynamics on Riemannian manifolds converge rapidly to their target distributions, with mixing times polynomial in the dimension."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `pass`

```json
{
  "claims": [
    {
      "assessment": "partially_supported",
      "claim": "Theorem 14 (Main Result 1): Under Assumptions 1–10, 12 and a symmetric-space hypothesis on (M,g), choosing beta polynomially large in the relevant geometric/functional constants yields a log-Sobolev inequality whose constants alpha, tilde alpha satisfy 1/alpha, 1/tilde alpha ∈ O(poly(beta, A_2, R_M, diam, 1/lambda_*)) and hence the TV-distance between rho_t (resp. tilde rho_t) and the Gibbs measure nu (resp. tilde nu) decays as beta·e^{-2 alpha t} max F.",
      "evidence": "The theorem is the composition of (i) a Poincaré inequality on the base B (Theorem 34, Section 2), (ii) a lift to the total space via Riemannian submersion (Section 3), and (iii) a Poincaré-to-log-Sobolev upgrade via Bakry–Émery (Section 4). The roadmap and supporting standard results (Bakry-Ledoux, Bakry-Emery, Hsu's existence/uniqueness for Langevin SDE) are correctly cited, and the symmetric-space hypothesis is used to invoke totally geodesic fibers needed for the submersion machinery. However, the exact polynomial exponents are stated abstractly ('poly') without tight tracking through the proof chain, and the symmetric-space assumption is invoked in the informal statement but its precise role in unlocking polynomial scaling is only made explicit through long technical chains (Lyapunov constructions, escape-time bounds). The internal consistency of the dependencies (e.g., conv(M/G), i(M), i(M/G), K appearing in the beta bound but not in the alpha bound) cannot be fully audited from the informal statement.",
      "id": "C1",
      "location": "Section 1.1 (Theorem 14, informal); formalized in Section 5",
      "severity": "minor",
      "suggested_fix": "In the formal version (Section 5), provide an explicit table that maps each constant entering the beta lower bound to the proof step that introduces it, and state the explicit polynomial exponents in dim(M). State explicitly whether the symmetric-space hypothesis is used only to ensure totally geodesic fibers and Ricci comparison, or also in the log-Sobolev upgrade."
    },
    {
      "assessment": "partially_supported",
      "claim": "Theorem 15 (Main Result 2): For any compact (M,g), twice-differentiable F with A_2-Lipschitz gradient, every epsilon ∈ (0, O(i(M)^2 A_2)] and delta ∈ (0,1), if beta ∈ Omega(dim(M)^2 · log(A_2, Vol(M), dim(M), 1/epsilon, 1/delta) / epsilon), then nu(F - min F ≥ epsilon) ≤ delta.",
      "evidence": "This is a standard concentration-of-Gibbs-measure result on a compact manifold, and the dim(M)^2/epsilon scaling matches the Euclidean intuition (e^{-beta epsilon} mass outside an epsilon-sublevel set, against a volume factor that is exponential in dim·log). The epsilon_max ∈ O(i(M)^2 A_2) restriction is natural because injectivity-radius-sized balls are needed to apply the Lipschitz bound on F via a normal-coordinate Taylor expansion. The 'log(A_2, Vol(M), dim(M), 1/epsilon, 1/delta)' notation is unusual: it appears to denote a polynomial in the logarithms of these quantities, but the informal statement does not make this explicit, leaving room for ambiguity about whether the bound is linear or polynomial in each log term.",
      "id": "C2",
      "location": "Section 1.1 (Theorem 15, informal); formalized in Section 6",
      "severity": "minor",
      "suggested_fix": "Replace the multi-argument 'log(...)' with an explicit expression such as log A_2 + log Vol(M) + log dim(M) + log(1/epsilon) + log(1/delta), and reconcile with the precise statement proved in Section 6."
    },
    {
      "assessment": "partially_supported",
      "claim": "Theorem 34 (Poincaré inequality on B): Under the assumptions of Section 2, the Markov triple (B, tilde nu, tilde Gamma) satisfies a Poincaré inequality with a constant whose inverse depends only polynomially on the constants from Assumptions 25, 26, and analogues of 7–10, 12.",
      "evidence": "The strategy — combine a local Poincaré inequality on a neighborhood of the minimum with two Lyapunov functions (W_1 controlling drift toward the minimum, W_2 a quasi-Lyapunov controlling escape from saddles) and invoke a Bakry–Barthe–Cattiaux–Guillin-type lifting (Bakry et al. 2008) — is a well-established template, and the paper correctly identifies the precedent (Li–Erdogdu 2022 Appendix D). The construction of W_2 via a Dirichlet problem on a punctured geodesic ball and the appeal to Proposition 40 (a variant of Bovier–den Hollander) is mathematically reasonable, but verifying that the dimensional dependence remains polynomial after composing all of these steps requires careful tracking that cannot be audited without reading the full proof of Theorem 34 in detail.",
      "id": "C3",
      "location": "Section 2 (Theorem 34)",
      "severity": "minor",
      "suggested_fix": "In the proof of Theorem 34, isolate a clean 'master inequality' that exhibits the dependence of the Poincaré constant on each of the input constants, so a reader can verify polynomial scaling without re-deriving every intermediate step."
    },
    {
      "assessment": "supported",
      "claim": "The norms of grad_g F and grad_h tilde F are equal at corresponding points, and distances between points do not increase under a Riemannian submersion; consequently the no-barren-plateau condition on tilde F is implied by the analogous condition on F (Remark 13, Proposition 165).",
      "evidence": "These are standard facts about Riemannian submersions: at any point x ∈ M, dπ|_x is an isometry from the horizontal subspace onto T_{π(x)}(M/G), so grad F is horizontal (by fiber-invariance) and pushed forward to grad tilde F with the same norm. Distance non-increase is a direct consequence: any path in M projects to a path in M/G of length ≤ that of the original. The result is correctly attributed to standard references (Boumal, do Carmo, Lee). The claim is reused only as a sufficient condition for Assumption 12 and so does not over-promise.",
      "id": "C4",
      "location": "Section 1.1 (Remark 13); Proposition 165 (background appendix)",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Remark 5 / Proposition 176: The Lipschitz constants A_1 of F, A_2 of grad_g F, and A_3 of nabla^2 F are also valid Lipschitz constants for tilde F, grad_h tilde F, and nabla^2 tilde F on (M/G, h).",
      "evidence": "Preservation of Lipschitz constants under a Riemannian submersion is plausible: at corresponding points, horizontal vectors are mapped isometrically, and any geodesic in M/G admits a horizontal lift of equal length. However, while the Lipschitz constant of F itself is straightforwardly preserved (paths in M/G lift to paths of equal length in M), preservation of the Lipschitz constants of grad and Hessian requires care because covariant derivatives in (M/G, h) and in (M, g) differ by O'Neill tensor terms; for general (non-totally-geodesic) submersions, the gradient/Hessian Lipschitz constants of tilde F are bounded by those of F plus correction terms involving the second fundamental form of the fibers. The paper restricts to totally geodesic fibers in some results, which makes these correction terms vanish, but Remark 5 is stated without that restriction.",
      "id": "C5",
      "location": "Section 1.1 (Remark 5); Proposition 176 (background)",
      "severity": "minor",
      "suggested_fix": "State Remark 5 with the explicit hypothesis of totally geodesic fibers (already invoked elsewhere) or quantify the O'Neill correction so that A_2, A_3 are clearly admissible constants for tilde F on (M/G, h)."
    },
    {
      "assessment": "partially_supported",
      "claim": "Remark 16: If the lower bound on beta scales as poly(dim(M)), and if diam(M), diam(M/G), diam(G), and R_M scale at most polynomially in dim(M), then 1/alpha and 1/tilde alpha scale as poly(dim(M)), and the TV distance to the Gibbs measure decays at rate Omega(1/poly(dim(M))) (assuming max F is poly(dim(M))).",
      "evidence": "Logically this follows from Theorem 14 by substitution. The remark assumes simultaneously polynomial scaling of the geometric constants of M, M/G, and G — a non-trivial collection of hypotheses that is reasonable for the trace-ratio and Ising examples discussed in Section 7 but is not automatic for general families of manifolds (e.g., diam can grow exponentially under naive constructions). The remark glosses over the fact that the polynomial in 1/alpha scales with beta (cf. Theorem 14), so saturating the beta bound at its lower limit is needed for the stated rate.",
      "id": "C6",
      "location": "Section 1.1 (Remark 16)",
      "severity": "minor",
      "suggested_fix": "Spell out the implication chain in Remark 16, including the substitution of beta at its polynomial lower bound, and explicitly list which application-class manifolds (e.g., products of spheres, Stiefel-type quotients) satisfy the polynomial-diameter hypothesis."
    },
    {
      "assessment": "supported",
      "claim": "Bakry–Émery curvature-dimension condition nabla^2 F + (1/beta) Ric_g ≥ kappa g implies a log-Sobolev inequality on M with constant kappa, and in the high-temperature regime with positive Ricci this gives a log-Sobolev whenever 1/beta ∈ Omega(lambda_min(nabla^2 F)/Ric_g).",
      "evidence": "This is the classical Bakry-Émery curvature-dimension criterion (CD(kappa, ∞)). The statement and its application here match Theorem 5.7.x of Bakry–Gentil–Ledoux exactly. The high-temperature special case is a direct algebraic rearrangement.",
      "id": "C7",
      "location": "Section 1 (Introduction; citing bakry2013analysis Section 5.7)",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Carré du champ identity: Gamma(f_1,f_2) = (1/beta) <grad_g f_1, grad_g f_2>_g, hence Gamma(f) = (1/beta) |grad_g f|^2_g (Remark 22).",
      "evidence": "The proof given (using the product rule for the Laplacian and for the gradient) is correct and standard. The identity is independent of F because the drift terms in L(f_1 f_2), f_1 L f_2, f_2 L f_1 cancel pairwise.",
      "id": "C8",
      "location": "Section 2 (Remark 22, Definition 20)",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Existence and uniqueness of the Langevin diffusion as the unique F-adapted semimartingale solving the martingale problem associated with L (Definition 19).",
      "evidence": "Hsu's 'Stochastic Analysis on Manifolds' establishes existence and uniqueness for the martingale problem associated with the Langevin generator on a smooth manifold (under standard regularity), and the paper invokes the correct theorems for this purpose.",
      "id": "C9",
      "location": "Section 2 (Definition 19; cites hsustochastic Theorems 1.3.4, 1.3.6)",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "The application examples in Section 7 (trace-ratio minimization on complex Stiefel manifolds with U(m) action, and the mean-field energy minimization for the 2D ferromagnetic Ising model) satisfy the assumptions of Theorems 14 and 15 and therefore inherit the polynomial-in-dimension mixing time guarantee.",
      "evidence": "Assumption verification for the trace-ratio quotient is plausible — the symmetry group is U(m), the action is free on the open dense set where rank(X) = m, the quotient is a Grassmannian-like manifold, and trace-ratio is known to have a unique minimum after quotienting. However, several non-trivial conditions are required: (i) freeness of the U(m) action requires excluding rank-deficient strata; (ii) verification of Assumptions 9–10 (eigenvalue bounds on nabla^2 tilde F at critical points) is delicate and depends on the matrices A, B; (iii) Assumption 12 (no barren plateaus / quantitative gradient lower bound) is not obviously satisfied for trace-ratio minimization in high dimensions, where the loss landscape is known empirically to flatten. Without numerical simulations demonstrating the predicted polynomial mixing time on representative instances, the practical relevance of the bound to these specific examples is asserted but not verified. For 'cs.*/stat.*' code-amenable claims of this form, executable verification is the standard.",
      "id": "C10",
      "location": "Section 7 (sec:traceratio)",
      "severity": "major",
      "suggested_fix": "Add a small numerical-experiments artifact (e.g., experiments/trace_ratio_mixing.py and experiments/ising_mixing.py) that empirically estimates mixing times of a discretized Langevin scheme on toy instances and compares against the polynomial-in-dim bound. If full empirical validation is out of scope, weaken the Section 7 claims to 'the assumptions of Theorem 14 are formally satisfied' without asserting practical mixing-time guarantees."
    },
    {
      "assessment": "partially_supported",
      "claim": "The discretization gap is not addressed: the paper analyzes the continuous-time Langevin SDE, but practical 'rapid mixing' for sampling typically requires bounding the bias and step-size dependence of a discretization (e.g., Riemannian LMC). Without such a result, the polynomial-mixing claim does not directly translate to a polynomial sampling algorithm.",
      "evidence": "The paper is explicit about studying the continuous SDE and does not claim a discrete algorithm bound. However, the abstract and introduction motivate the result by appealing to practical sampling problems (lattice gauge theory, principal-component analysis, differential privacy), which require discretization analysis. This is a scope clarity issue rather than a mathematical error.",
      "id": "C11",
      "location": "Section 1 (Introduction) and Section 5",
      "severity": "minor",
      "suggested_fix": "Add a short paragraph in the introduction or conclusion explicitly noting that the polynomial mixing-time guarantee is for the continuous-time SDE, and citing the standard tools (e.g., Erdogdu et al. for Euclidean Riemannian LMC) that would be required to lift it to a discretization."
    },
    {
      "assessment": "partially_supported",
      "claim": "Lyapunov function W_1 (defined in eq:defW1) is a Lyapunov function on the indicated geodesic ball (Proposition 39).",
      "evidence": "The structure of the construction follows Li–Erdogdu 2022 (Appendix D), and the use of a normal-coordinate quadratic-form Lyapunov function near the minimum is a standard Bakry–Cattiaux template. Without re-deriving the explicit drift inequality LW_1 ≤ -lambda W_1 + bounded term inside the ball, I cannot independently confirm the constants, but the structure is sound.",
      "id": "C12",
      "location": "Section 2 (Proposition 39)",
      "severity": "minor",
      "suggested_fix": "Where possible, present the key drift inequality in a single boxed line so that the reader can directly verify the Lyapunov condition without reconstructing the algebra."
    },
    {
      "assessment": "partially_supported",
      "claim": "The lifting of a Poincaré inequality from (B, tilde nu, tilde Gamma) to (M, nu, Gamma) preserves the Poincaré constant up to a factor depending on the Poincaré constant of the fibers (with Ricci curvature ≥ 0 on the fibers by Assumption 2).",
      "evidence": "The Fubini-type decomposition of variance into 'horizontal' and 'vertical' components, combined with non-negative Ricci on the fibers implying a Poincaré inequality on each fiber (Lichnerowicz-type), is standard. The paper invokes a Fubini's theorem for Gibbs measures (Proposition 57) tailored to principal bundles, which is the right object. The non-negative Ricci hypothesis on the fibers (Assumption 2) is precisely what is needed for the fiber Poincaré inequality. Detailed verification requires reading the proof in full.",
      "id": "C13",
      "location": "Section 3 (SectionLift)",
      "severity": "minor",
      "suggested_fix": "State the resulting Poincaré constant on M explicitly as a product/sum of the fiber and base Poincaré constants in the lift statement, so the reader can see the dependence on diam(G)."
    },
    {
      "assessment": "partially_supported",
      "claim": "The Poincaré-to-log-Sobolev upgrade in Section 4 yields a log-Sobolev inequality whose constant depends polynomially on beta, the gradient Lipschitz constant A_2, the lower Ricci bound R, and 1/lambda_*.",
      "evidence": "The standard route from Poincaré to log-Sobolev under a curvature-dimension condition uses a defective log-Sobolev inequality (e.g., via the Holley–Stroock perturbation or via the Bakry–Ledoux machinery) and then tightens it using the Poincaré inequality. The paper signals this route ('defective log-Sobolev inequality') and cites the Bakry–Émery framework. The specific dependence on beta in the final log-Sobolev constant (which makes alpha ~ 1/poly(beta)) is a consequence of how A_2 and beta enter the curvature-dimension condition via the Hessian of beta F; this is a known feature and not a defect, but the precise polynomial exponent should be verified in the formal proof.",
      "id": "C14",
      "location": "Section 4 (SectionPItoLSI)",
      "severity": "minor",
      "suggested_fix": "Track the precise polynomial exponent in beta through Section 4 so that Remark 16's claim of polynomial-in-dim decay of TV distance is unambiguous."
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

