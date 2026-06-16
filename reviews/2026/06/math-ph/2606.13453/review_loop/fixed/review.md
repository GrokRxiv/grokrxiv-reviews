# Rapid mixing for Gibbs measures in Riemannian manifolds

GrokRxiv review of [arXiv:2606.13453](https://arxiv.org/abs/2606.13453) · `math-ph`

_Authors_: Ángela Capel, Marco Castrillón-López, Sofyan Iblisdir, Angelo Lucia, Pablo Páez-Velasco, David Pérez-García

## TL;DR

The five specialist reviews converge on a picture of a mathematically ambitious paper with a sound theoretical core but several structural completeness gaps that prevent acceptance in the current form. Novelty confidence is high (0.95, score 0.8): the Riemannian-submersion lifting technique for Poincaré inequalities and the generalization from product spheres to arbitrary quotient manifolds and symmetric spaces are genuine advances over Li-Erdogdu (2022). The main theorems (Theorem 14/76 and Theorem 15/78) are assessed as supported by the technical reviewer, and the central intermediate results (Theorems 34, 59, 68) are corroborated. No missing prior art was identified. Citation quality is high (confidence 0.95), with two notable omissions: Girolami-Calderhead (2011) for the origins of Riemannian Langevin dynamics and McClean et al. (2018) for barren plateaus, both of which the paper explicitly invokes as motivation. The reproducibility specialist (confidence 0.82) raised a critical concern: no machine-checkable proof artifact is provided for either headline theorem in a field where proof complexity is substantial. Two further major reproducibility concerns—no code repository and no numerical experiments—compound this. The technical reviewer (confidence 0.55, overall 'mostly_sound') identified three major unsupported claims: Proposition 48's CIR-process argument is deferred to an unverified appendix with the uniformity of the constant C undemonstrated; Section 7 is absent despite being promised in the introduction; and the polynomial mixing-time claims are unsupported by any executable simulation. A minor transcription error in Lemma 80 (R = 2ε/A_2 vs. the correct R = √(2ε/A_2)) is straightforward to fix. The lower technical-reviewer confidence (0.55) reflects incomplete access to the appendix rather than substantive disagreement with the main proof strategy. Under the code-amenable field gate (math.PR/cs.LG/cs.NA), the combination of a critical reproducibility concern for Theorem 76 and multiple major-severity technical gaps mandates major_revision. The paper's theoretical contributions are strong enough to reach acceptance once Section 7 is written, the Proposition 48 proof is completed in the main text, and numerical experiments are added.

_Recommendation_: **Major revision** · _Confidence_: 78%

## Strengths

- The Riemannian submersion lifting technique (Theorem 59) provides a principled and apparently novel mechanism for transferring Poincaré inequalities from quotient base spaces to total spaces, enabling mixing-time analysis on a class of quotient manifolds not covered by prior work.
- The explicit, computable LSI constants in Theorem 76 are expressed as closed-form polynomial functions of curvature bounds, diameter, escape eigenvalue, and inverse temperature, making the results directly applicable to concrete geometric settings.
- The paper enforces verifiable algebraic conditions (Hessian eigenvalue bound λ_*, no-barren-plateaus assumption, unique minimum on M/G) that cleanly exclude the pathological regimes that obstruct rapid mixing, giving the result a precise rather than asymptotic character.
- The novelty specialist (confidence 0.95) found no missing prior art and rated novelty 0.8, confirming that the generalization from product spheres to arbitrary symmetric spaces and the PI-lifting technique constitute a significant advance.
- Citation practice is rigorous: foundational sources (Bakry-Émery, Villani, Hsu) are invoked precisely where their results enter, and the relationship to Li-Erdogdu (2022) is clearly articulated rather than glossed.

## Weaknesses

- Section 7—explicitly promised in the introduction as worked verification of assumptions for trace-quotient minimization and the 2D Ising mean-field model—is entirely absent from the manuscript, leaving the headline applicability claims unsubstantiated.
- The escape-time bound in Proposition 48 (P[τ^* ≥ t] ≤ C·exp(−λ_* t/8)) defers the core CIR-process comparison to Appendix B.2 without demonstrating uniformity of C over B(y, a/√β) in the main text, and the dim(M)^5·a^6 scaling in the β hypothesis is not explained.
- No machine-checkable proof artifact is provided for either Theorem 76 or Theorem 78; for a paper whose conclusions depend on multi-step constant-tracking across six intermediate theorems, this omission leaves the headline results without a verifiable audit trail.
- The polynomial-in-dimension mixing claim is supported only by an abstract inequality chain; no simulation of X_t or X̃_t on any example is provided, so the constants in the poly(dim) bound have no empirical calibration.
- Lemma 80 contains a transcription error: the statement defines R = 2ε/A_2, but the proof and the application in Theorem 78 use R = √(2ε/A_2); readers applying the lemma directly will obtain incorrect bounds.
- The two missing citations—Girolami and Calderhead (2011) for Riemannian Langevin dynamics in statistics/ML and McClean et al. (2018) for barren plateaus—are conspicuous given that both concepts are invoked by name as motivation.

## Revision Targets

- [ ] **Manuscript: Introduction, ‘Structure of the text’ (line referring to Section 7)**
  - Location: `Introduction, ‘Structure of the text’ (line referring to Section 7)`
  - Evidence: The provided manuscript text proceeds directly from Section 6 (Suboptimality of the Gibbs distribution) to Acknowledgements and then the appendices on Sobolev spaces and Bakry-Émery theory. There is no section verifying assumptions for the trace-quotient minimization problem or the 2D ferromagnetic Ising mean-field energy. Since the introduction repeatedly motivates the paper via applicability to lattice gauge theory, tensor networks, and trace-ratio minimization, the absence of any worked instance leaves the headline accessibility/applicability claims unverified within this manuscript.
  - Required change: Include the promised Section 7 verifying, for the trace-quotient and 2D Ising mean-field examples, the specific values (or scaling) of λ_*, C_{F̃}, D, K, R_{M/G}, A_2, A_3, diam(G), and conv(M/G), and report the resulting β and LSI constants. Without this, downgrade the 'wide applicability' framing of the introduction.
  - Verification: Re-review should confirm `Introduction, ‘Structure of the text’ (line referring to Section 7)` is corrected or justified.
- [ ] **Manuscript: Section 2.2, Proposition 48 (Proposition 9.6)**
  - Location: `Section 2.2, Proposition 48 (Proposition 9.6)`
  - Evidence: The proof sketch reduces escape to studying an auxiliary scalar process Y_t lower-bounding (1/2)·r̃_{y,v}(X̃_t)^2 via an SDE comparison, where v is the bottom-Hessian eigenvector at saddle y (Assumption 9 gives ∇^2 F̃(y)[v,v] ≤ −λ_*). The proof of the resulting CIR-type process having exponentially decaying escape-time tails is deferred to Section 13 / Appendix B (Section 'Escaping time of a generalized CIR process'), which I have not been able to read in full from the provided text. The choice of the constant '8' in λ_*/8 (vs. λ_*/2 from the Hessian alone) depends on absorbing the curvature/Itô-correction and second-order remainder terms; the dependence of C on x is asserted but its uniformity is not explicitly demonstrated in the main-text outline. The hypothesis β ≥ 72^2·dim(M)^5·A_2·A_3^2·K^2·a^6 is used to suppress the second-order Lipschitz-Hessian remainder A_3·d_h(x,y)^2/2 — this dim(M)^5·a^6 scaling is severe and should be made explicit in the proof.
  - Required change: Move the CIR-process comparison argument (Appendix B.2) to the main proof of Proposition 48, or add a roadmap subsection linking each hypothesis on β to the inequality it suppresses. Verify the rate λ_*/8 with an explicit calculation, and confirm that the constant C in the tail bound is uniform over the connected component B(y, a/√β).
  - Verification: Re-review should confirm `Section 2.2, Proposition 48 (Proposition 9.6)` is corrected or justified.
- [ ] **Manuscript: reproducibility appendix**
  - Location: `reproducibility appendix`
  - Evidence: The headline rapid-mixing/log-Sobolev result (Theorem 76 formalizing Theorem 14) is supported by paper proofs but no machine-checkable proof or reproducible proof artifact is provided; a formal artifact such as proofs/main_formal_rapid_mixing.lean would close this gap.
  - Required change: Add a reproducibility note that resolves this concern: The headline rapid-mixing/log-Sobolev result (Theorem 76 formalizing Theorem 14) is supported by paper proofs but no machine-checkable proof or reproducible proof artifact is provided; a formal artifact such as proofs/main_formal_rapid_mixing.lean would close this gap.
  - Verification: Re-review should confirm the reproducibility concern is addressed with a concrete artifact or manuscript update.
- [ ] **Manuscript: Introduction (lines 100-155, 487-500); Section 7 (promised but absent)**
  - Location: `Introduction (lines 100-155, 487-500); Section 7 (promised but absent)`
  - Evidence: Per the proof-as-code axiom for math.PR / cs.LG / cs.NA papers: mixing-time claims of the form β ≥ poly(dim), 1/α ≤ poly(dim) are concretely testable via numerical Langevin-simulation benchmarks on the very examples the paper highlights (trace-quotient minimization; 2D Ising mean-field). The manuscript ships no accompanying repository or scripts that simulate X_t/X̃_t on either example and report empirical mixing times vs. dimension, so the polynomial scaling is asserted only at the level of the abstract inequality chain, with no executable verification of the constants on a representative problem.
  - Required change: Provide an experiments/ directory (e.g., experiments/trace_quotient/run.py and experiments/ising_meanfield/run.jl or .py) that (i) implements the projected Langevin update on each example, (ii) measures TV/χ^2 distance to the Gibbs measure as a function of t for a range of dim(M), and (iii) plots the empirical mixing time vs. dim alongside the theoretical poly(dim) prediction. Even a single-page numerical study would substantiate the headline 'polynomial in dimension' claim that motivates the paper.
  - Verification: Re-review should confirm `Introduction (lines 100-155, 487-500); Section 7 (promised but absent)` is corrected or justified.
- [ ] **Manuscript: Section 6, Lemma 80**
  - Location: `Section 6, Lemma 80`
  - Evidence: The proof of Lemma 80 (just below the statement) computes ∫_0^R e^{−βA_2 ρ^2/2}·ρ^{d−1} dρ and substitutes r = √(βA_2)·ρ to obtain bounds in terms of √(βA_2)·R. To match the proof and the application in the proof of Theorem 78 (which uses R = √(2ε/A_2) inherited from Lemma 79), the statement of Lemma 80 should read R = √(2ε/A_2), not R = 2ε/A_2. The proof itself is correct under the corrected definition; this is a transcription error in the lemma statement.
  - Required change: Replace 'R = 2ε/A_2' in the statement of Lemma 80 with 'R = √(2ε/A_2)', matching the value used in Lemma 79 and in the substitution within the proof.
  - Verification: Re-review should confirm `Section 6, Lemma 80` is corrected or justified.
- [ ] **Bibliography: Riemann manifold Langevin and Hamiltonian Monte Carlo methods**
  - Location: bibliography entry: `Riemann manifold Langevin and Hamiltonian Monte Carlo methods`
  - Evidence: Seminal paper by Girolami and Calderhead (2011) that introduced Riemannian Langevin dynamics to the broader statistics and machine learning community.
  - Required change: Add a bibliography entry for `Riemann manifold Langevin and Hamiltonian Monte Carlo methods` and cite it where the affected method or claim is introduced, or explicitly justify its omission.
  - Verification: Re-review should confirm the bibliography and citation context address this reference.

## Open Questions

- Can the authors supply the promised Section 7 with explicit numerical values or polynomial scalings for λ_*, C_{F̃}, D, K, R_{M/G}, A_2, A_3, diam(G), and conv(M/G) for the trace-quotient problem on the complex Stiefel manifold modulo U(m), and for the 2D ferromagnetic Ising mean-field energy?
- In the proof of Proposition 48, what explicit calculation from the CIR-process comparison (Appendix B.2) establishes that the constant C in the tail bound P[τ^* ≥ t] ≤ C·exp(−λ_* t/8) is uniform over x ∈ B(y, a/√β), and is the dim(M)^5·a^6 scaling in the β hypothesis tight?
- In Theorem 60 (lowering PI), what ensures that the identity |grad_g(f∘π)|^2_g = |grad_h f|^2_h holds with equality rather than inequality when f is pulled back via π, so that the Poincaré constant passes from M to M/G without degradation?
- What is the intended definition of R in Lemma 80—is it 2ε/A_2 as stated or √(2ε/A_2) as used in the proof and in Theorem 78—and can the authors confirm which value is correct and correct the statement accordingly?
- Are the authors planning a companion repository with numerical Langevin simulations on the trace-quotient and Ising examples, and if so, would these be included in a revision or released separately?

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
      "explanation": "Foundational textbook for the analysis of Markov diffusion operators and Bakry-Émery theory, which is central to the paper's proof of log-Sobolev inequalities.",
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
      "explanation": "The most directly related recent work, analyzing Langevin diffusion on product spheres. The current paper generalizes these results to broader Riemannian manifolds.",
      "notes": "The citation key indicates 2022, while the bibliography metadata lists the publication year as 2023 (Bernoulli).",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Creutz, Michael"
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
      "explanation": "Provides physical motivation for sampling Gibbs distributions in the context of lattice gauge theory.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Hsu, E.P."
        ],
        "doi": null,
        "key": "hsustochastic",
        "raw": "hsustochastic: title=Stochastic Analysis on Manifolds, author=Hsu, E.P., isbn=9780821883884, series=Contemporary Mathematics, url=https://books.google.es/books?id=2NM0Z7svRmEC, publisher=American Mathematical Soc., year = 2002",
        "title": "Stochastic Analysis on Manifolds",
        "url": "https://books.google.es/books?id=2NM0Z7svRmEC",
        "venue": "American Mathematical Soc.",
        "year": 2002
      },
      "exists": null,
      "explanation": "Primary reference for the existence and uniqueness of stochastic processes on Riemannian manifolds.",
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
        "url": "https://books.google.es/books?id=hV8o5R7_5tkC",
        "venue": "Springer Berlin Heidelberg",
        "year": 2008
      },
      "exists": null,
      "explanation": "Authoritative source for the HWI inequality and optimal transport results used to connect Poincaré and log-Sobolev inequalities.",
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
      "explanation": "Modern comprehensive reference for optimization on smooth manifolds, used to link sampling with constrained minimization.",
      "notes": "The bibliography notes this as 'To appear', which is consistent with its 2022/2023 publication timeline.",
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
      "explanation": "Provides the specific analysis of the trace quotient problem used in the paper's main application example.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "1911.01469",
        "authors": [
          "Andre Wibisono"
        ],
        "doi": null,
        "key": "wibisono2019proximal",
        "raw": "wibisono2019proximal: title=Proximal Langevin Algorithm: Rapid Convergence Under Isoperimetry, author=Andre Wibisono, year=2019, eprint=1911.01469, archivePrefix=arXiv, url=https://arxiv.org/abs/1911.01469,",
        "title": "Proximal Langevin Algorithm: Rapid Convergence Under Isoperimetry",
        "url": "https://arxiv.org/abs/1911.01469",
        "venue": "arXiv",
        "year": 2019
      },
      "exists": null,
      "explanation": "Relevant prior work on rapid convergence of Langevin algorithms under isoperimetric conditions.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    }
  ],
  "missing_references": [
    {
      "reason": "Seminal paper by Girolami and Calderhead (2011) that introduced Riemannian Langevin dynamics to the broader statistics and machine learning community.",
      "title": "Riemann manifold Langevin and Hamiltonian Monte Carlo methods"
    },
    {
      "reason": "Primary source (McClean et al., 2018) for the concept of \"barren plateaus\" which the paper explicitly claims to address and exclude in its conditions.",
      "title": "Barren plateaus in quantum neural network landscapes"
    }
  ],
  "summary": "The paper demonstrates high citation hygiene, referencing foundational works in Riemannian geometry and stochastic analysis alongside very recent developments in Langevin dynamics (2025-2026). Citations are used accurately to support both technical lemmas and broader motivational contexts in physics and machine learning. A few minor discrepancies in publication years for recent works are noted, but these do not detract from the overall quality of the bibliography."
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.78,
  "questions": [
    "Can the authors supply the promised Section 7 with explicit numerical values or polynomial scalings for λ_*, C_{F̃}, D, K, R_{M/G}, A_2, A_3, diam(G), and conv(M/G) for the trace-quotient problem on the complex Stiefel manifold modulo U(m), and for the 2D ferromagnetic Ising mean-field energy?",
    "In the proof of Proposition 48, what explicit calculation from the CIR-process comparison (Appendix B.2) establishes that the constant C in the tail bound P[τ^* ≥ t] ≤ C·exp(−λ_* t/8) is uniform over x ∈ B(y, a/√β), and is the dim(M)^5·a^6 scaling in the β hypothesis tight?",
    "In Theorem 60 (lowering PI), what ensures that the identity |grad_g(f∘π)|^2_g = |grad_h f|^2_h holds with equality rather than inequality when f is pulled back via π, so that the Poincaré constant passes from M to M/G without degradation?",
    "What is the intended definition of R in Lemma 80—is it 2ε/A_2 as stated or √(2ε/A_2) as used in the proof and in Theorem 78—and can the authors confirm which value is correct and correct the statement accordingly?",
    "Are the authors planning a companion repository with numerical Langevin simulations on the trace-quotient and Ising examples, and if so, would these be included in a revision or released separately?"
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "The provided manuscript text proceeds directly from Section 6 (Suboptimality of the Gibbs distribution) to Acknowledgements and then the appendices on Sobolev spaces and Bakry-Émery theory. There is no section verifying assumptions for the trace-quotient minimization problem or the 2D ferromagnetic Ising mean-field energy. Since the introduction repeatedly motivates the paper via applicability to lattice gauge theory, tensor networks, and trace-ratio minimization, the absence of any worked instance leaves the headline accessibility/applicability claims unverified within this manuscript.",
      "id": "weakness-1",
      "locator": "Introduction, ‘Structure of the text’ (line referring to Section 7)",
      "required_update": "Include the promised Section 7 verifying, for the trace-quotient and 2D Ising mean-field examples, the specific values (or scaling) of λ_*, C_{F̃}, D, K, R_{M/G}, A_2, A_3, diam(G), and conv(M/G), and report the resulting β and LSI constants. Without this, downgrade the 'wide applicability' framing of the introduction.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Introduction, ‘Structure of the text’ (line referring to Section 7)` is corrected or justified.",
      "weakness_index": 0
    },
    {
      "evidence": "The proof sketch reduces escape to studying an auxiliary scalar process Y_t lower-bounding (1/2)·r̃_{y,v}(X̃_t)^2 via an SDE comparison, where v is the bottom-Hessian eigenvector at saddle y (Assumption 9 gives ∇^2 F̃(y)[v,v] ≤ −λ_*). The proof of the resulting CIR-type process having exponentially decaying escape-time tails is deferred to Section 13 / Appendix B (Section 'Escaping time of a generalized CIR process'), which I have not been able to read in full from the provided text. The choice of the constant '8' in λ_*/8 (vs. λ_*/2 from the Hessian alone) depends on absorbing the curvature/Itô-correction and second-order remainder terms; the dependence of C on x is asserted but its uniformity is not explicitly demonstrated in the main-text outline. The hypothesis β ≥ 72^2·dim(M)^5·A_2·A_3^2·K^2·a^6 is used to suppress the second-order Lipschitz-Hessian remainder A_3·d_h(x,y)^2/2 — this dim(M)^5·a^6 scaling is severe and should be made explicit in the proof.",
      "id": "weakness-2",
      "locator": "Section 2.2, Proposition 48 (Proposition 9.6)",
      "required_update": "Move the CIR-process comparison argument (Appendix B.2) to the main proof of Proposition 48, or add a roadmap subsection linking each hypothesis on β to the inequality it suppresses. Verify the rate λ_*/8 with an explicit calculation, and confirm that the constant C in the tail bound is uniform over the connected component B(y, a/√β).",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 2.2, Proposition 48 (Proposition 9.6)` is corrected or justified.",
      "weakness_index": 1
    },
    {
      "evidence": "The headline rapid-mixing/log-Sobolev result (Theorem 76 formalizing Theorem 14) is supported by paper proofs but no machine-checkable proof or reproducible proof artifact is provided; a formal artifact such as proofs/main_formal_rapid_mixing.lean would close this gap.",
      "id": "weakness-3",
      "locator": "reproducibility appendix",
      "required_update": "Add a reproducibility note that resolves this concern: The headline rapid-mixing/log-Sobolev result (Theorem 76 formalizing Theorem 14) is supported by paper proofs but no machine-checkable proof or reproducible proof artifact is provided; a formal artifact such as proofs/main_formal_rapid_mixing.lean would close this gap.",
      "source_path": null,
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm the reproducibility concern is addressed with a concrete artifact or manuscript update.",
      "weakness_index": 2
    },
    {
      "evidence": "Per the proof-as-code axiom for math.PR / cs.LG / cs.NA papers: mixing-time claims of the form β ≥ poly(dim), 1/α ≤ poly(dim) are concretely testable via numerical Langevin-simulation benchmarks on the very examples the paper highlights (trace-quotient minimization; 2D Ising mean-field). The manuscript ships no accompanying repository or scripts that simulate X_t/X̃_t on either example and report empirical mixing times vs. dimension, so the polynomial scaling is asserted only at the level of the abstract inequality chain, with no executable verification of the constants on a representative problem.",
      "id": "weakness-4",
      "locator": "Introduction (lines 100-155, 487-500); Section 7 (promised but absent)",
      "required_update": "Provide an experiments/ directory (e.g., experiments/trace_quotient/run.py and experiments/ising_meanfield/run.jl or .py) that (i) implements the projected Langevin update on each example, (ii) measures TV/χ^2 distance to the Gibbs measure as a function of t for a range of dim(M), and (iii) plots the empirical mixing time vs. dim alongside the theoretical poly(dim) prediction. Even a single-page numerical study would substantiate the headline 'polynomial in dimension' claim that motivates the paper.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Introduction (lines 100-155, 487-500); Section 7 (promised but absent)` is corrected or justified.",
      "weakness_index": 3
    },
    {
      "evidence": "The proof of Lemma 80 (just below the statement) computes ∫_0^R e^{−βA_2 ρ^2/2}·ρ^{d−1} dρ and substitutes r = √(βA_2)·ρ to obtain bounds in terms of √(βA_2)·R. To match the proof and the application in the proof of Theorem 78 (which uses R = √(2ε/A_2) inherited from Lemma 79), the statement of Lemma 80 should read R = √(2ε/A_2), not R = 2ε/A_2. The proof itself is correct under the corrected definition; this is a transcription error in the lemma statement.",
      "id": "weakness-5",
      "locator": "Section 6, Lemma 80",
      "required_update": "Replace 'R = 2ε/A_2' in the statement of Lemma 80 with 'R = √(2ε/A_2)', matching the value used in Lemma 79 and in the substitution within the proof.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 6, Lemma 80` is corrected or justified.",
      "weakness_index": 4
    },
    {
      "evidence": "Seminal paper by Girolami and Calderhead (2011) that introduced Riemannian Langevin dynamics to the broader statistics and machine learning community.",
      "id": "weakness-6",
      "locator": "Riemann manifold Langevin and Hamiltonian Monte Carlo methods",
      "required_update": "Add a bibliography entry for `Riemann manifold Langevin and Hamiltonian Monte Carlo methods` and cite it where the affected method or claim is introduced, or explicitly justify its omission.",
      "source_path": null,
      "source_role": "citation",
      "status": "open",
      "target_kind": "bibliography",
      "verification_check": "Re-review should confirm the bibliography and citation context address this reference.",
      "weakness_index": 5
    }
  ],
  "strengths": [
    "The Riemannian submersion lifting technique (Theorem 59) provides a principled and apparently novel mechanism for transferring Poincaré inequalities from quotient base spaces to total spaces, enabling mixing-time analysis on a class of quotient manifolds not covered by prior work.",
    "The explicit, computable LSI constants in Theorem 76 are expressed as closed-form polynomial functions of curvature bounds, diameter, escape eigenvalue, and inverse temperature, making the results directly applicable to concrete geometric settings.",
    "The paper enforces verifiable algebraic conditions (Hessian eigenvalue bound λ_*, no-barren-plateaus assumption, unique minimum on M/G) that cleanly exclude the pathological regimes that obstruct rapid mixing, giving the result a precise rather than asymptotic character.",
    "The novelty specialist (confidence 0.95) found no missing prior art and rated novelty 0.8, confirming that the generalization from product spheres to arbitrary symmetric spaces and the PI-lifting technique constitute a significant advance.",
    "Citation practice is rigorous: foundational sources (Bakry-Émery, Villani, Hsu) are invoked precisely where their results enter, and the relationship to Li-Erdogdu (2022) is clearly articulated rather than glossed."
  ],
  "summary": "The five specialist reviews converge on a picture of a mathematically ambitious paper with a sound theoretical core but several structural completeness gaps that prevent acceptance in the current form. Novelty confidence is high (0.95, score 0.8): the Riemannian-submersion lifting technique for Poincaré inequalities and the generalization from product spheres to arbitrary quotient manifolds and symmetric spaces are genuine advances over Li-Erdogdu (2022). The main theorems (Theorem 14/76 and Theorem 15/78) are assessed as supported by the technical reviewer, and the central intermediate results (Theorems 34, 59, 68) are corroborated. No missing prior art was identified. Citation quality is high (confidence 0.95), with two notable omissions: Girolami-Calderhead (2011) for the origins of Riemannian Langevin dynamics and McClean et al. (2018) for barren plateaus, both of which the paper explicitly invokes as motivation. The reproducibility specialist (confidence 0.82) raised a critical concern: no machine-checkable proof artifact is provided for either headline theorem in a field where proof complexity is substantial. Two further major reproducibility concerns—no code repository and no numerical experiments—compound this. The technical reviewer (confidence 0.55, overall 'mostly_sound') identified three major unsupported claims: Proposition 48's CIR-process argument is deferred to an unverified appendix with the uniformity of the constant C undemonstrated; Section 7 is absent despite being promised in the introduction; and the polynomial mixing-time claims are unsupported by any executable simulation. A minor transcription error in Lemma 80 (R = 2ε/A_2 vs. the correct R = √(2ε/A_2)) is straightforward to fix. The lower technical-reviewer confidence (0.55) reflects incomplete access to the appendix rather than substantive disagreement with the main proof strategy. Under the code-amenable field gate (math.PR/cs.LG/cs.NA), the combination of a critical reproducibility concern for Theorem 76 and multiple major-severity technical gaps mandates major_revision. The paper's theoretical contributions are strong enough to reach acceptance once Section 7 is written, the Proposition 48 proof is completed in the main text, and numerical experiments are added.",
  "weaknesses": [
    "Section 7—explicitly promised in the introduction as worked verification of assumptions for trace-quotient minimization and the 2D Ising mean-field model—is entirely absent from the manuscript, leaving the headline applicability claims unsubstantiated.",
    "The escape-time bound in Proposition 48 (P[τ^* ≥ t] ≤ C·exp(−λ_* t/8)) defers the core CIR-process comparison to Appendix B.2 without demonstrating uniformity of C over B(y, a/√β) in the main text, and the dim(M)^5·a^6 scaling in the β hypothesis is not explained.",
    "No machine-checkable proof artifact is provided for either Theorem 76 or Theorem 78; for a paper whose conclusions depend on multi-step constant-tracking across six intermediate theorems, this omission leaves the headline results without a verifiable audit trail.",
    "The polynomial-in-dimension mixing claim is supported only by an abstract inequality chain; no simulation of X_t or X̃_t on any example is provided, so the constants in the poly(dim) bound have no empirical calibration.",
    "Lemma 80 contains a transcription error: the statement defines R = 2ε/A_2, but the proof and the application in Theorem 78 use R = √(2ε/A_2); readers applying the lemma directly will obtain incorrect bounds.",
    "The two missing citations—Girolami and Calderhead (2011) for Riemannian Langevin dynamics in statistics/ML and McClean et al. (2018) for barren plateaus—are conspicuous given that both concepts are invoked by name as motivation."
  ]
}
```

### novelty (`gemini-3-flash-preview`) — status: `pass`

```json
{
  "confidence": 0.95,
  "missing_prior_art": [],
  "novelty_score": 0.8,
  "related_work": [
    {
      "citation_key": "LiErd2022",
      "delta": "While Li and Erdogdu (2022) focused on products of spheres and semidefinite programs, this work generalizes the analysis to a much broader class of Riemannian manifolds, specifically including quotient manifolds and symmetric spaces. It introduces the 'lifting' technique for Poincaré and log-Sobolev inequalities via Riemannian submersions, which was not present in the original work.",
      "relation": "builds_on",
      "title": "Riemannian Langevin algorithm for solving semidefinite programs"
    },
    {
      "citation_key": "menz2014",
      "delta": "Menz and Schlichting (2014) analyzed the decomposition of the energy landscape in Euclidean space. This paper extends similar logic to Riemannian manifolds, specifically addressing how to handle symmetries and quotient structures to overcome the multiplicity of minima, whereas Menz (2014) focuses on Euclidean mixture measures.",
      "relation": "prior_art",
      "title": "Poincaré and logarithmic Sobolev inequalities by decomposition of the energy landscape"
    },
    {
      "citation_key": "bakry2013analysis",
      "delta": "This paper applies the classical Bakry-Émery theory and Markov diffusion operator analysis to the specific setting of Riemannian submersions and Langevin dynamics on quotient manifolds, identifying new explicit conditions for rapid mixing that involve manifold curvature and submersion geometry.",
      "relation": "builds_on",
      "title": "Analysis and Geometry of Markov Diffusion Operators"
    },
    {
      "citation_key": "xuquotient",
      "delta": "Both works deal with quotient-space processes, but this paper provides a rigorous mathematical analysis of mixing times and log-Sobolev constants specifically for Langevin dynamics, whereas Xu et al. (2026) focus on diffusion models in a machine learning context.",
      "relation": "prior_art",
      "title": "Quotient-Space Diffusion Model"
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
      "description": "The headline rapid-mixing/log-Sobolev result (Theorem 76 formalizing Theorem 14) is supported by paper proofs but no machine-checkable proof or reproducible proof artifact is provided; a formal artifact such as proofs/main_formal_rapid_mixing.lean would close this gap.",
      "severity": "critical"
    },
    {
      "area": "other",
      "description": "The Gibbs-measure suboptimality/concentration result (Theorem 78 formalizing Theorem 15) lacks a machine-checkable proof artifact; a formal artifact such as proofs/main_formal_suboptimality.lean would close this gap.",
      "severity": "major"
    },
    {
      "area": "code",
      "description": "No repository, license, pinned commit, or executable scripts are provided for checking constants, assumptions, or example applications such as trace-ratio minimization and the two-dimensional Ising model; scripts such as scripts/verify_trace_ratio.py and scripts/verify_ising2d.py would make these checks reproducible.",
      "severity": "major"
    },
    {
      "area": "compute",
      "description": "No software environment, dependency versions, theorem-prover versions, or numerical stack are specified because no reproducibility artifact is supplied.",
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
  "confidence": 0.82,
  "data_availability": "unspecified",
  "data_url": null,
  "environment": null,
  "reproducibility_score": 0.35
}
```

### summary (`claude-haiku-4-5-20251001`) — status: `pass`

```json
{
  "audience": "Mathematical statisticians and probabilists studying functional inequalities and convergence rates; differential geometers interested in Riemannian geometry and submersions; machine learning researchers developing optimization algorithms on manifolds; mathematical physicists working in lattice gauge theory, tensor networks, and sampling-based statistical mechanics; applied mathematicians solving constrained optimization problems on curved spaces",
  "key_contributions": [
    "Derives logarithmic Sobolev inequality conditions for Langevin dynamics on Riemannian manifolds, guaranteeing exponentially fast convergence to Gibbs measures in the low-temperature regime",
    "Identifies concrete conditions combining manifold curvature bounds, inverse temperature scaling, critical point separation, and non-degenerate escape directions at saddle points",
    "Proves polynomial-in-dimension mixing times when geometric, curvature, and function-dependent conditions are satisfied",
    "Develops Riemannian submersion theory relating Langevin processes on total and base spaces to lift Poincaré inequalities and derive log-Sobolev inequalities across geometric settings",
    "Establishes conditions ensuring absence of barren plateaus and spurious local minima that obstruct rapid mixing",
    "Demonstrates applicability through worked examples including trace quotient minimization and mean-field Ising models"
  ],
  "plain_language_summary": "This paper studies how to efficiently sample from probability distributions on curved geometric spaces (Riemannian manifolds) using Langevin dynamics—an algorithm that combines gradient descent with random noise. Since these distributions often arise in physics (lattice gauge theory, phase transitions), optimization on manifolds, and machine learning, understanding convergence rates is practically important. The paper identifies precise conditions ensuring rapid convergence: properties of the manifold's geometry (Ricci curvature), a temperature-like parameter controlling the balance between gradient-driven motion and randomness, and structural properties of critical points (saddle points and their escape directions). The authors prove that under these conditions, convergence time grows polynomially rather than exponentially with dimension. They use an elegant approach leveraging Riemannian submersions—mathematical structures that relate sampling on a curved space to sampling on a lower-dimensional projected space—allowing different geometric properties to be exploited efficiently. The results exclude problematic scenarios like barren plateaus (regions with vanishing gradients) and spurious local minima that would prevent efficient sampling, and are demonstrated on practical problems like trace quotient minimization and the two-dimensional Ising model.",
  "tldr": "The paper establishes conditions on Riemannian manifolds ensuring rapid convergence of Langevin dynamics to equilibrium distributions, with mixing times polynomial in dimension."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `pass`

```json
{
  "claims": [
    {
      "assessment": "supported",
      "claim": "Main Result 1 (Theorem 14 / Theorem 76): under the listed assumptions on the symmetric-space structure, curvature bounds, escape direction at saddles (λ_*), critical-point spacing, no-barren-plateaus, and unique minimum on M/G, for β scaling as a polynomial in the listed parameters the Langevin diffusions on (M,g) and (M/G,h) converge exponentially in TV to their Gibbs measures with log-Sobolev constants 1/α_M = 4β(A_2+R_M)diam(M)^2·max{184/λ_*, diam(G)^2 β/π^2} and 1/α_{M/G} = 736β(A_2+R_{M/G})diam(M/G)^2/λ_*.",
      "evidence": "The formal proof of Theorem 76 composes three already-checked ingredients: (i) the Poincaré inequality on M/G with constant λ_*/184 (Theorem 34); (ii) the lifting result that promotes a PI on M/G to one on M (Theorem 59); (iii) the PI+CD→LSI tightening (Theorem 68). The constants combine cleanly under the side conditions β,κ_1≥1, κ_2,diam≥1 used in those intermediate results. The TV bound in Corollary 77 follows from the standard LSI⇒hypercontractivity-⇒TV-decay chain (Theorem 66) plus an entropy bound for the uniform initial condition (Theorem 67). The simplification 2β·diam + βκ_1·diam^2 + 1 ≤ 4β κ_1 diam^2 used to derive the LSI constant is verifiable arithmetically under the stated normalizations.",
      "id": "C1",
      "location": "Section 1.1, Theorem 14 (informal); Section 5, Theorem 76 (formal), Corollary 77",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Main Result 2 (Theorem 15 / Theorem 78): for a compact d-dimensional Riemannian manifold and an A_2-Lipschitz-gradient function F, if β ≥ (2/ε)(1/2 + d^2·log(d^3·A_2·Vol(M)·√(2π)/(δε))), then the Gibbs measure ν = (1/Z)e^{-βF} satisfies ν(F − min F ≥ ε) ≤ δ.",
      "evidence": "The proof uses (a) Lemma 79's exponential ratio bound (cited from LiErd2022 supplement), (b) Lemma 80's Gauss-lemma + Croke's spherical-volume comparison to lower-bound the partition-function denominator by 2^{d−1}π^{1/2}·Γ((d+1)/2)^{d−1}/[Γ(d/2)^d·d^{d−1}]·(βA_2)^{−d/2}·e^{−1/2}, and (c) the elementary inequality solving βε − (d/2)logβ ≥ log(1/δ) + log B_d. The Gamma-function upper bound of Batir 2008 is applied correctly for d>2 and verified separately for d=2. The constraint R ≤ i(M)/2 is enforced by ε_max ≤ i(M)^2·A_2/8.",
      "id": "C2",
      "location": "Section 1.1, Theorem 15 (informal); Section 6, Theorem 78 (formal)",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Theorem 34: under the listed assumptions, the Markov triple (B,ν̃,Γ̃) on the base of the Riemannian submersion satisfies a Poincaré inequality with constant κ = λ_*/184.",
      "evidence": "The proof constructs two (quasi-)Lyapunov functions W_1 (Proposition 39) and W_2 (Corollary 41/49), decomposes ∫f^2 dν̃ using a bump-function partition (Lemma 52), and applies the Neumann-boundary integration trick (Lemma 53) on each piece. The final arithmetic step requires 8/(A_2·dim(B)) + 176/λ_* ≤ 184/λ_*, which holds because A_2·dim(B) ≥ 1 ≥ λ_*. The bound 1 − 4‖Γ̃(χ)‖_∞·17/λ_* ≥ 1/2 is enforced by a^2 ≥ 544/λ_*. The chain of inequalities reproduces the construction of LiErd2022 Appendix D adapted to general totally-geodesic submersions.",
      "id": "C3",
      "location": "Section 2, Theorem 34 (Proposition 2.12); proof in §2.3",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Theorem 59 (Lifting PI): if π: (M,g) → (M/G,h) is a principal G-bundle Riemannian submersion with fibers of non-negative Ricci curvature, and (M/G,ν̃,Γ̃) satisfies PI(κ̃), then (M,ν,Γ) satisfies PI(κ) with 1/κ = max{1/κ̃, diam(G)^2·β/π^2}.",
      "evidence": "The argument splits Var_ν(f) = Var_ν(f̄) + ν[(f−f̄)^2] using the fiber average f̄, applies the PI on M/G to f̄ (a fiber-constant function), and the Bakry-Émery PI(π^2/diam(G)^2) on each fiber (justified by non-negative Ricci curvature via Theorem 58 / Zhong-Yang). The β factor in diam(G)^2·β/π^2 arises from Γ(f) = (1/β)|grad f|^2 in the Langevin Markov triple, so the fiber inequality |grad f|^2 ≥ (π^2/diam(G)^2)·Var enters as κ_fiber = π^2/(β·diam(G)^2). The Fubini-on-submersions decomposition (Corollary 55, Proposition 57) makes the variance split rigorous.",
      "id": "C4",
      "location": "Section 3.2, Theorem 59",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Theorem 60 (Lowering PI): under the same conditions, if (M,ν,Γ) satisfies PI(κ), then (M/G,ν̃,Γ̃) satisfies PI(κ) with the same constant.",
      "evidence": "The full lowering proof relies on the Fubini-style identity (Proposition 57) and the relation between horizontal-gradient norms on M and gradient norms on M/G via Lemma 61. The statement is plausible and consistent with the standard fact that PI is monotone under projection of a Markov triple, but I did not verify the explicit chain showing that the constant is preserved exactly (not merely bounded) when the gradient on M is decomposed into horizontal and vertical components.",
      "id": "C5",
      "location": "Section 3.2, Theorem 60",
      "severity": "minor",
      "suggested_fix": "In the published proof, make explicit the step where the horizontal-vertical decomposition |grad_g(f∘π)|^2_g = |grad_h f|^2_h gives equality (rather than ≤), and verify there is no slack between the M-side and M/G-side Dirichlet forms when f is pulled back."
    },
    {
      "assessment": "supported",
      "claim": "Theorem 68: a Markov triple satisfying CD(−κ_1) (κ_1 > 0) and PI(κ_2) also satisfies an LSI with constant 1/α = 4β κ_1 diam(M)^2/κ_2.",
      "evidence": "The proof applies the HWI inequality (Proposition 72 / Villani Corollary 20.13), the Wasserstein bound W_2^2 ≤ 4·diam(M)^2 (Remark 74), and Young's inequality with the optimal choice ε = diam(M)/√(βκ_2). The optimized defective LSI constant is 2·diam(M)·√(β/κ_2) + (β κ_1 diam(M)^2 + 1)/κ_2, which after applying β ≥ 1, κ_2 ≤ 1, diam ≥ 1, κ_1 > 1 indeed simplifies to ≤ 4β κ_1 diam(M)^2/κ_2 by adding three terms each bounded by β κ_1 diam(M)^2. The Bakry tightening lemma (Proposition 75) is invoked correctly with the defective LSI(α,A) form.",
      "id": "C6",
      "location": "Section 4.1, Theorem 68 (Proposition 9.15); proof in §4.1",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Proposition 48 (Local Escape Time Bound): the first exit time τ^* of X̃_t from U(a/√β, S̃) satisfies P[τ^* ≥ t | X̃_0 = x] ≤ C·exp(−λ_* t/8) for all t ≥ 0, with C independent of t and x.",
      "evidence": "The proof sketch reduces escape to studying an auxiliary scalar process Y_t lower-bounding (1/2)·r̃_{y,v}(X̃_t)^2 via an SDE comparison, where v is the bottom-Hessian eigenvector at saddle y (Assumption 9 gives ∇^2 F̃(y)[v,v] ≤ −λ_*). The proof of the resulting CIR-type process having exponentially decaying escape-time tails is deferred to Section 13 / Appendix B (Section 'Escaping time of a generalized CIR process'), which I have not been able to read in full from the provided text. The choice of the constant '8' in λ_*/8 (vs. λ_*/2 from the Hessian alone) depends on absorbing the curvature/Itô-correction and second-order remainder terms; the dependence of C on x is asserted but its uniformity is not explicitly demonstrated in the main-text outline. The hypothesis β ≥ 72^2·dim(M)^5·A_2·A_3^2·K^2·a^6 is used to suppress the second-order Lipschitz-Hessian remainder A_3·d_h(x,y)^2/2 — this dim(M)^5·a^6 scaling is severe and should be made explicit in the proof.",
      "id": "C7",
      "location": "Section 2.2, Proposition 48 (Proposition 9.6)",
      "severity": "major",
      "suggested_fix": "Move the CIR-process comparison argument (Appendix B.2) to the main proof of Proposition 48, or add a roadmap subsection linking each hypothesis on β to the inequality it suppresses. Verify the rate λ_*/8 with an explicit calculation, and confirm that the constant C in the tail bound is uniform over the connected component B(y, a/√β)."
    },
    {
      "assessment": "incorrect",
      "claim": "Lemma 80 statement defines R = 2ε/A_2.",
      "evidence": "The proof of Lemma 80 (just below the statement) computes ∫_0^R e^{−βA_2 ρ^2/2}·ρ^{d−1} dρ and substitutes r = √(βA_2)·ρ to obtain bounds in terms of √(βA_2)·R. To match the proof and the application in the proof of Theorem 78 (which uses R = √(2ε/A_2) inherited from Lemma 79), the statement of Lemma 80 should read R = √(2ε/A_2), not R = 2ε/A_2. The proof itself is correct under the corrected definition; this is a transcription error in the lemma statement.",
      "id": "C8",
      "location": "Section 6, Lemma 80",
      "severity": "minor",
      "suggested_fix": "Replace 'R = 2ε/A_2' in the statement of Lemma 80 with 'R = √(2ε/A_2)', matching the value used in Lemma 79 and in the substitution within the proof."
    },
    {
      "assessment": "unsupported",
      "claim": "Section 7 contains 'an analysis of two scenarios in which most of the assumptions of Theorems 14 and 15 can be easily verified, namely the trace quotient minimization problem, and the mean-field energy minimization problem associated with the two-dimensional ferromagnetic Ising model.'",
      "evidence": "The provided manuscript text proceeds directly from Section 6 (Suboptimality of the Gibbs distribution) to Acknowledgements and then the appendices on Sobolev spaces and Bakry-Émery theory. There is no section verifying assumptions for the trace-quotient minimization problem or the 2D ferromagnetic Ising mean-field energy. Since the introduction repeatedly motivates the paper via applicability to lattice gauge theory, tensor networks, and trace-ratio minimization, the absence of any worked instance leaves the headline accessibility/applicability claims unverified within this manuscript.",
      "id": "C9",
      "location": "Introduction, ‘Structure of the text’ (line referring to Section 7)",
      "severity": "major",
      "suggested_fix": "Include the promised Section 7 verifying, for the trace-quotient and 2D Ising mean-field examples, the specific values (or scaling) of λ_*, C_{F̃}, D, K, R_{M/G}, A_2, A_3, diam(G), and conv(M/G), and report the resulting β and LSI constants. Without this, downgrade the 'wide applicability' framing of the introduction."
    },
    {
      "assessment": "unsupported",
      "claim": "The Langevin/Riemannian-submersion framework yields polynomial-in-dimension mixing for concrete cases such as trace-quotient minimization on the complex Stiefel manifold modulo U(m) and the mean-field 2D ferromagnetic Ising model.",
      "evidence": "Per the proof-as-code axiom for math.PR / cs.LG / cs.NA papers: mixing-time claims of the form β ≥ poly(dim), 1/α ≤ poly(dim) are concretely testable via numerical Langevin-simulation benchmarks on the very examples the paper highlights (trace-quotient minimization; 2D Ising mean-field). The manuscript ships no accompanying repository or scripts that simulate X_t/X̃_t on either example and report empirical mixing times vs. dimension, so the polynomial scaling is asserted only at the level of the abstract inequality chain, with no executable verification of the constants on a representative problem.",
      "id": "C10",
      "location": "Introduction (lines 100-155, 487-500); Section 7 (promised but absent)",
      "severity": "major",
      "suggested_fix": "Provide an experiments/ directory (e.g., experiments/trace_quotient/run.py and experiments/ising_meanfield/run.jl or .py) that (i) implements the projected Langevin update on each example, (ii) measures TV/χ^2 distance to the Gibbs measure as a function of t for a range of dim(M), and (iii) plots the empirical mixing time vs. dim alongside the theoretical poly(dim) prediction. Even a single-page numerical study would substantiate the headline 'polynomial in dimension' claim that motivates the paper."
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

