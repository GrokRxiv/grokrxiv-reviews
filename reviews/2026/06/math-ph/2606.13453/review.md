# Rapid mixing for Gibbs measures in Riemannian manifolds

GrokRxiv review of [arXiv:2606.13453](https://arxiv.org/abs/2606.13453) · `math-ph`

_Authors_: Ángela Capel, Marco Castrillón-López, Sofyan Iblisdir, Angelo Lucia, Pablo Páez-Velasco, David Pérez-García

## TL;DR

The paper makes a significant contribution by establishing sufficient conditions for rapid mixing of Langevin dynamics on compact Riemannian manifolds, extending prior results from product-of-spheres settings (Li & Erdogdu 2023) to a substantially broader class of manifolds including Lie group quotients via a Riemannian submersion lifting technique. The novelty specialist rates the work significant (score 0.75, confidence 0.90), and the technical correctness specialist finds the core analytical architecture mostly sound (confidence 0.62), with the principal results—the Poincaré inequality on the quotient manifold (C2), the local escape time bound (C3), the CD-to-LSI tightening (C4), and the Riemannian submersion lifting (C7)—all assessed as supported. The primary critical gap identified across two specialists is the complete absence of executable or formally verified proof artifacts: the reproducibility specialist flags a missing formal proof artifact at critical severity and missing executable benchmarks for the trace-ratio and Ising applications at major severity, and the technical correctness specialist independently flags the same absence as an unsupported major claim (C9). Since the paper's field (stat.ML / math.PR) lies within the code-amenable set and two specialists flagged proof-as-code artifacts missing at major or critical severity, the recommendation defaults to major_revision. Additional minor technical issues include a typographical error in Lemma 80 (R stated as 2ε/A_2 instead of √(2ε/A_2)), an imprecise mixing-time statement in Remark 16 that conflates the TV-decay rate with the actual mixing time to ε, and unverified polynomial scaling of 13+ geometric constants in any concrete manifold family. Citation quality is excellent overall, with two missing references (Hebey on Sobolev spaces, McClean et al. on barren plateaus) and one Mathematics Stack Exchange post used as the primary source for a technical CIR escape-time lemma.

_Recommendation_: **Major revision** · _Confidence_: 78%

## Strengths

- The generalization of rapid mixing analysis from products of spheres to compact Riemannian quotient manifolds via Riemannian submersions is technically non-trivial and substantially broadens the scope of provably-efficient Gibbs sampling on curved spaces.
- Explicit closed-form constants are tracked throughout the main results (LSI constants α_M and α_{M/G}, Poincaré constant λ_*/184), making the bounds concrete and actionable rather than merely existential.
- The modular proof architecture—Poincaré inequality on quotient, submersion lifting, CD-to-LSI tightening—is clean and internally consistent, with each module independently verified by the technical correctness specialist.
- The Riemannian submersion framework (Section 3) provides an elegant mechanism for handling symmetry-induced multiple global minima by reducing to the orbit space where the minimum is unique, and the lifting argument is correctly grounded in the classical Fubini-on-submersions decomposition.
- The bibliography (87 entries) is comprehensive and accurately cited, spanning classical Riemannian geometry, stochastic calculus, Bakry-Émery theory, and modern physics applications with only minor hygiene issues.

## Weaknesses

- No executable or formally verified proof artifact accompanies the paper; the polynomial-in-dimension mixing claim cannot be independently corroborated by simulation or machine-checked proof, despite the stat.ML / math.PR field being directly amenable to both Langevin discretization experiments and Lean/Coq formalization.
- The headline polynomial mixing time claim (Remark 16, Theorem 14) is not verified for any concrete manifold family: 13+ geometric constants are assumed to scale polynomially in dim(M) but are not established for the named applications (Stiefel quotients, mean-field Ising).
- Lemma 80 contains a typographical error, stating R = 2ε/A_2 while the proof body and Lemma 79 both require R = √(2ε/A_2); the proof is correct under the square-root reading but the misprint is potentially misleading.
- Remark 16 does not write the mixing-time-to-ε bound explicitly; the implicit scaling t_mix(ε) = poly(dim) · O(log dim) is understated and a less careful reader may conclude TV is small at t = O(1/poly(dim)).
- A Mathematics Stack Exchange post (preguntastack, 2025) is cited as the primary source for a technical CIR escape-time calculation used in Proposition 48; this non-peer-reviewed reference should be replaced or supplemented with a self-contained proof or peer-reviewed citation.

## Revision Targets

- [ ] **Manuscript: Section 1 (Theorem 14, Remark 16); Section 7 (sec:traceratio).**
  - Location: `Section 1 (Theorem 14, Remark 16); Section 7 (sec:traceratio).`
  - Evidence: The paper is a math.PR / stat.ML manuscript whose central operational claim — that mixing times are polynomial in dim(M) under stated assumptions — is exactly the kind of quantitative claim that benefits from empirical corroboration. The named applications (trace-ratio quotient minimization, 2D ferromagnetic Ising mean-field) are explicitly numerical/algorithmic: one can simulate Langevin dynamics on Stiefel quotients and on small Ising configurations, and verify the empirical TV-decay scaling vs. dim. The paper does not ship any such artifact, nor a Lean/Coq formalization of any of the headline inequalities (Theorem 34, Theorem 68, Theorem 78). Per the Proof-as-Code axiom for math.* / stat.ML papers, this counts as a notable weakness.
  - Required change: Ship a small companion code release. Concretely: (i) `experiments/trace_ratio/run.py` — discretized Langevin on St(n,m)/U(m) with empirical TV vs. iteration count for a family of dimensions, to test the dim-polynomial-mixing claim; (ii) `experiments/ising_2d/run.py` — mean-field Ising Gibbs sampling verifying β-scaling concentration of Theorem 78. Optionally: (iii) `proofs/CD_to_LSI.lean` (or Coq equivalent) formalizing Theorem 68 since it is a self-contained 3-step argument.
  - Verification: Re-review should confirm `Section 1 (Theorem 14, Remark 16); Section 7 (sec:traceratio).` is corrected or justified.
- [ ] **Manuscript: Section 1, Remark 16 (and Theorem 14 informal scaling).**
  - Location: `Section 1, Remark 16 (and Theorem 14 informal scaling).`
  - Evidence: The claim is a direct consequence of substituting polynomial-in-dim bounds into the explicit formulas for α_M, α_{M/G}. Algebraically this is straightforward. However, the claim is conditional on 13+ geometric quantities all scaling polynomially in dim(M); the paper does not verify this for any concrete sequence of manifolds beyond the brief Section 7 references (trace ratio and 2D Ising mean-field). For the trace quotient on Stiefel/Grassmann manifolds, several of these constants (injectivity radius, convexity radius, K) are known to scale non-trivially with dimension and merit explicit verification.
  - Required change: Add an explicit table or appendix giving polynomial scaling for each constant in at least one nontrivial family (e.g. complex Stiefel St(n,m) with n,m growing, or product of spheres). A numerical Langevin simulation `experiments/mixing_scaling/{stiefel,spheres}.py` recording empirical TV-decay vs. dim would directly corroborate the headline scaling claim, which is currently only an algebraic consequence of unverified per-family bounds.
  - Verification: Re-review should confirm `Section 1, Remark 16 (and Theorem 14 informal scaling).` is corrected or justified.
- [ ] **Manuscript: Section 6, Theorem 78 (thm:MainFormal2), proved via Lemmas 79–80**
  - Location: `Section 6, Theorem 78 (thm:MainFormal2), proved via Lemmas 79–80`
  - Evidence: Lemma 79 follows Li-Erdogdu C.1; Lemma 80 lower-bounds the partition-function denominator using Croke's geodesic-sphere volume comparison (valid for ρ ≤ i(M)/2). The exponentiation and Gamma-function inequalities (Batir 2008) are correctly applied. However, the statement of Lemma 80 prints 'R = 2ε/A_2', whereas the proof and Lemma 79 both use R = √(2ε/A_2) (and the proof's computation `1/(A_2 R²) = 1/(2ε)` is only consistent with R = √(2ε/A_2)). This is almost certainly a typographical error in the statement of Lemma 80, not a substantive one; the proof's final inequality is correct under R = √(2ε/A_2).
  - Required change: Correct the statement of Lemma 80 to 'R = √(2ε/A_2)' to match Lemma 79 and the proof body.
  - Verification: Re-review should confirm `Section 6, Theorem 78 (thm:MainFormal2), proved via Lemmas 79–80` is corrected or justified.
- [ ] **Manuscript: Section 1, Remark 16.**
  - Location: `Section 1, Remark 16.`
  - Evidence: Algebraically correct given the formal LSI constants. However, the TV bound ‖ν−ρ_t‖² ≤ β · max F · e^{−2α t} requires t to grow at least like (log(β · max F))/α to obtain ε accuracy. If β = poly(dim) and max F = poly(dim), then 'log' is logarithmic in dim, so mixing-to-ε scales as α^{-1} · O(log dim) = poly(dim) · O(log dim). The remark is consistent with this reading but does not state it explicitly; a less careful reader may conclude TV is small at t = O(1/poly(dim)), which is not what the bound shows.
  - Required change: In Remark 16, write out the mixing-time-to-ε bound explicitly: t_mix(ε) = α^{-1} · log(β · max F / ε²) = poly(dim) · log(poly(dim)/ε), rather than just naming the exponent rate.
  - Verification: Re-review should confirm `Section 1, Remark 16.` is corrected or justified.
- [ ] **Manuscript: Section 1, Remark 11; supporting Proposition prop:projectedHessian (referenced).**
  - Location: `Section 1, Remark 11; supporting Proposition prop:projectedHessian (referenced).`
  - Evidence: This is stated as a consequence of how the Hessian decomposes along horizontal and vertical directions for a Riemannian submersion with fiber-invariant F. The result is plausible and standard for Riemannian submersions with totally geodesic fibers (where the second fundamental form vanishes), but the full proof (Proposition 168) is in an appendix not shown here. The reduction of Assumption 9–10 on F̃ to a condition on F via Remark 11 depends critically on this projection lemma being correctly stated.
  - Required change: Ensure the proof of Proposition 168 (projected Hessian) explicitly treats the vertical/horizontal split using O'Neill's formulas and the totally-geodesic-fiber hypothesis; cross-reference here for the reader.
  - Verification: Re-review should confirm `Section 1, Remark 11; supporting Proposition prop:projectedHessian (referenced).` is corrected or justified.

## Open Questions

- Can the authors verify that each of the 13+ geometric constants (injectivity radius, convexity radius, sectional curvature bound K, etc.) scales polynomially in dim(M) for at least one non-trivial manifold family, such as complex Stiefel manifolds St(n,m) with n,m growing, and add an explicit table or appendix to the paper documenting these bounds?
- Would the authors release a companion code artifact—for example, a discretized Langevin simulation on Stiefel quotients and on the mean-field Ising model—to empirically corroborate the claimed polynomial mixing scaling and the β-scaling concentration of Theorem 78?
- For the Stack Exchange citation (preguntastack) used in the proof of Proposition 48, can the authors either include a self-contained proof of the CIR escape time bound in an appendix or cite a peer-reviewed equivalent, demoting the forum post to an acknowledgment?
- In the proof of Proposition 168 (projected Hessian), can the authors explicitly exhibit the vertical/horizontal decomposition using O'Neill's formulas and invoke the totally-geodesic-fiber hypothesis, so that the reduction of Assumptions 9–10 on F̃ to conditions on F via Remark 11 is self-contained for the reader?
- Would the authors add an explicit formula for t_mix(ε) to Remark 16—specifically t_mix(ε) = O(α^{-1} log(β · max F / ε²)) = poly(dim) · O(log dim)—to prevent readers from conflating the exponential TV-decay rate with the mixing time?

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
      "explanation": "Provides a foundational proof for Poincaré inequalities, used in the paper's convergence analysis.",
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
      "explanation": "Cited for motivation in high-energy physics applications (lattice gauge theory).",
      "notes": "Referencing the 2023 edition of this classic text.",
      "relevance": "high",
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
      "explanation": "Provides geometric isoperimetric inequalities used for volume estimates in Theorem 78.",
      "notes": "The arxiv_id provided (0465.53032) is actually a Zentralblatt MATH (ZBL) identifier, not an arXiv ID.",
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
        "venue": "Physical Review Letters",
        "year": 2004
      },
      "exists": null,
      "explanation": "Cited for applications in quantum information theory and tensor networks.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Albrecht Böttcher",
          "David Wenzel"
        ],
        "doi": "10.1016/j.laa.2008.05.020",
        "key": "FrobeniusNorm",
        "raw": "FrobeniusNorm: doi = 10.1016/j.laa.2008.05.020, year = 2008, month = oct, publisher = Elsevier BV, volume = 429, number = 8-9, pages = 1864--1885, author = Albrecht B\\\"ottcher and David Wenzel, title = The Frobenius norm and the commutator, journal = Linear Algebra and its Applications",
        "title": "The Frobenius norm and the commutator",
        "url": null,
        "venue": "Linear Algebra and its Applications",
        "year": 2008
      },
      "exists": null,
      "explanation": "Provides matrix norm inequalities used in the analysis of the trace ratio minimization problem.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "A. Gray",
          "L. Vanhecke"
        ],
        "doi": "10.1007/BF02395060",
        "key": "Gray1979",
        "raw": "Gray1979: author = A. Gray and L. Vanhecke, title = Riemannian geometry as determined by the volumes of small geodesic balls, volume = 142, journal = Acta Mathematica, publisher = Institut Mittag-Leffler, pages = 157 -- 198, year = 1979, doi = 10.1007/BF02395060, URL = https://doi.org/10.1007/BF02395060,",
        "title": "Riemannian geometry as determined by the volumes of small geodesic balls",
        "url": "https://doi.org/10.1007/BF02395060",
        "venue": "Acta Mathematica",
        "year": 1979
      },
      "exists": null,
      "explanation": "Used for estimates of volumes of spheres and geodesic balls on manifolds.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Alexander Grigor’yan"
        ],
        "doi": null,
        "key": "Grigoryan_2024",
        "raw": "Grigoryan_2024: title=Lecture notes on Analysis on Manifolds, author=Grigor’yan, Alexander, year=2024, publisher=Bielefeld University, url=https://www.math.uni-bielefeld.de/ grigor/anman2.pdf",
        "title": "Lecture notes on Analysis on Manifolds",
        "url": "https://www.math.uni-bielefeld.de/ grigor/anman2.pdf",
        "venue": "Bielefeld University",
        "year": 2024
      },
      "exists": null,
      "explanation": "Primary source for the construction and definitions of Sobolev spaces on manifolds.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Ching-Peng Huang",
          "Dominik Inauen",
          "Govind Menon"
        ],
        "doi": "10.1214/23-ECP540",
        "key": "HIM23",
        "raw": "HIM23: author = Ching-Peng Huang and Dominik Inauen and Govind Menon, title = Motion by mean curvature and Dyson Brownian Motion, volume = 28, journal = Electronic Communications in Probability, publisher = Institute of Mathematical Statistics and Bernoulli Society, pages = 1 -- 10, keywords = Dyson Brownian motion, mean curvature, Riemannian submersion, year = 2023, doi = 10.1214/23-ECP540, URL = https://doi.org/10.1214/23-ECP540",
        "title": "Motion by mean curvature and Dyson Brownian Motion",
        "url": "https://doi.org/10.1214/23-ECP540",
        "venue": "Electronic Communications in Probability",
        "year": 2023
      },
      "exists": null,
      "explanation": "Recent work using Riemannian submersions to relate stochastic processes, mirroring the paper's strategy.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "W. Klingenberg"
        ],
        "doi": null,
        "key": "Klingenberg",
        "raw": "Klingenberg: ISSN = 0003486X, 19398980, URL = http://www.jstor.org/stable/1970029, author = W. Klingenberg, journal = Annals of Mathematics, number = 3, pages = 654--666, publisher = [Annals of Mathematics, Trustees of Princeton University on Behalf of the Annals of Mathematics, Mathematics Department, Princeton University], title = Contributions to Riemannian Geometry in the Large, urldate = 2024-06-25, volume = 69, year = 1959",
        "title": "Contributions to Riemannian Geometry in the Large",
        "url": "http://www.jstor.org/stable/1970029",
        "venue": "Annals of Mathematics",
        "year": 1959
      },
      "exists": null,
      "explanation": "Classical reference for global Riemannian geometry, specifically for curvature and injectivity radius.",
      "notes": null,
      "relevance": "high",
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
      "explanation": "The most direct predecessor; the paper generalizes the results of Li & Erdogdu from spheres to broader manifolds.",
      "notes": "Mismatch between key (2022) and actual publication year (2023).",
      "relevance": "high",
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
        "doi": "10.3150/22-BEJ1576SUPP",
        "key": "LiErd2022Supp",
        "raw": "LiErd2022Supp: author = Mufan Li and Murat A. Erdogdu, title = Supplement to \"Riemannian Langevin algorithm for solving semidefinite programs\", year = 2023, doi = 10.3150/22-BEJ1576SUPP, URL = https://doi.org/10.3150/22-BEJ1576SUPP",
        "title": "Supplement to \"Riemannian Langevin algorithm for solving semidefinite programs\"",
        "url": "https://doi.org/10.3150/22-BEJ1576SUPP",
        "venue": "Bernoulli (Supplement)",
        "year": 2023
      },
      "exists": null,
      "explanation": "Supplementary material for LiErd2022, containing technical lemmas and appendices directly adapted in this work.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Zhongmin Qian"
        ],
        "doi": "10.1017/S0308210500023568",
        "key": "Qian1997",
        "raw": "Qian1997: title=A gradient estimate on a manifold with convex boundary, volume=127, DOI=10.1017/S0308210500023568, number=1, journal=Proceedings of the Royal Society of Edinburgh: Section A Mathematics, publisher=Royal Society of Edinburgh Scotland Foundation, author=Qian, Zhongmin, year=1997, pages=171–179,",
        "title": "A gradient estimate on a manifold with convex boundary",
        "url": null,
        "venue": "Proceedings of the Royal Society of Edinburgh: Section A Mathematics",
        "year": 1997
      },
      "exists": null,
      "explanation": "Cited for results on gradient estimates and convexity in the context of Bakry-Émery theory.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "J. Ignacio Cirac",
          "David Pérez-García",
          "Norbert Schuch",
          "Frank Verstraete"
        ],
        "doi": null,
        "key": "RevModPhys",
        "raw": "RevModPhys: title = Matrix product states and projected entangled pair states: Concepts, symmetries, theorems, author = Cirac, J. Ignacio and P\\'erez-Garc\\'\\ia, David and Schuch, Norbert and Verstraete, Frank, journal = Rev. Mod. Phys., volume = 93, issue = 4, pages = 045003, numpages = 65, year = 2021, publisher = American Physical Society,",
        "title": "Matrix product states and projected entangled pair states: Concepts, symmetries, theorems",
        "url": null,
        "venue": "Reviews of Modern Physics",
        "year": 2021
      },
      "exists": null,
      "explanation": "Foundational review for tensor networks, providing motivation for sampling and optimization on matrix manifolds.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Alexandre B. Tsybakov"
        ],
        "doi": null,
        "key": "Tsybakov2008",
        "raw": "Tsybakov2008: title=Introduction to Nonparametric Estimation, author=Tsybakov, Alexandre B., year=2008, publisher=Springer New York, NY",
        "title": "Introduction to Nonparametric Estimation",
        "url": null,
        "venue": "Springer",
        "year": 2008
      },
      "exists": null,
      "explanation": "Used for relative entropy and Chi-squared divergence bounds in Section 4.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Feng-Yu Wang"
        ],
        "doi": "10.1142/8737",
        "key": "WangAnalysisforDiffusion",
        "raw": "WangAnalysisforDiffusion: author = Wang, Feng-Yu, title = Analysis for Diffusion Processes on Riemannian Manifolds, publisher = World Scientific, year = 2013, doi = 10.1142/8737, address = , edition = ,",
        "title": "Analysis for Diffusion Processes on Riemannian Manifolds",
        "url": null,
        "venue": "World Scientific",
        "year": 2013
      },
      "exists": null,
      "explanation": "Primary foundational textbook for diffusion processes on Riemannian manifolds and functional inequalities.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "P-A Absil",
          "Robert Mahony",
          "Rodolphe Sepulchre"
        ],
        "doi": null,
        "key": "absil2008optimization",
        "raw": "absil2008optimization: title=Optimization algorithms on matrix manifolds, author=Absil, P-A and Mahony, Robert and Sepulchre, Rodolphe, year=2008, publisher=Princeton University Press",
        "title": "Optimization algorithms on matrix manifolds",
        "url": null,
        "venue": "Princeton University Press",
        "year": 2008
      },
      "exists": null,
      "explanation": "Standard reference for optimization on Riemannian manifolds, providing algorithmic context.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "P-A Absil",
          "Simon Mataigne"
        ],
        "doi": null,
        "key": "absil2025ultimate",
        "raw": "absil2025ultimate: title=The ultimate upper bound on the injectivity radius of the Stiefel manifold, author=Absil, P-A and Mataigne, Simon, journal=SIAM Journal on Matrix Analysis and Applications, volume=46, number=2, pages=1145--1167, year=2025, publisher=SIAM",
        "title": "The ultimate upper bound on the injectivity radius of the Stiefel manifold",
        "url": null,
        "venue": "SIAM Journal on Matrix Analysis and Applications",
        "year": 2025
      },
      "exists": null,
      "explanation": "Provides a recent sharp bound on the injectivity radius, crucial for the paper's manifold analysis.",
      "notes": null,
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
        "venue": "Springer",
        "year": 2013
      },
      "exists": null,
      "explanation": "The definitive textbook on Bakry-Émery theory, log-Sobolev inequalities, and Markov diffusion operators.",
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
      "explanation": "Primary introduction for optimization on manifolds, frequently cited for definitions and theorems.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "A. Bovier",
          "F. den Hollander"
        ],
        "doi": null,
        "key": "bovier2015metastability",
        "raw": "bovier2015metastability: title=Metastability: A Potential-Theoretic Approach, author=Bovier, A. and den Hollander, F., isbn=9783319247762, series=Die Grundlehren der mathematischen Wissenschaften, url=https://books.google.es/books?id=yzDlzQEACAAJ, year=2015, publisher=Springer International Publishing",
        "title": "Metastability: A Potential-Theoretic Approach",
        "url": "https://books.google.es/books?id=yzDlzQEACAAJ",
        "venue": "Springer",
        "year": 2015
      },
      "exists": null,
      "explanation": "Foundational text for metastability, used to bound transition times between local minima.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "mathusername"
        ],
        "doi": null,
        "key": "preguntastack",
        "raw": "preguntastack: title = Escaping time of a modified CIR process, author = mathusername, howpublished = Mathematics Stack Exchange, eprint = https://math.stackexchange.com/q/5117199, archivePrefix=stackexchange, year = 2025, URL = https://math.stackexchange.com/q/5117199",
        "title": "Escaping time of a modified CIR process",
        "url": "https://math.stackexchange.com/q/5117199",
        "venue": "Mathematics Stack Exchange",
        "year": 2025
      },
      "exists": null,
      "explanation": "Provides a specific calculation for the escaping time of a stochastic process, credited in the acknowledgements.",
      "notes": "Citation to a non-peer-reviewed social media/forum post (Stack Exchange).",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Daniel Revuz",
          "Marc Yor"
        ],
        "doi": null,
        "key": "revuz2013continuous",
        "raw": "revuz2013continuous: title=Continuous martingales and Brownian motion, author=Revuz, Daniel and Yor, Marc, volume=293, year=2013, publisher=Springer Science \\& Business Media",
        "title": "Continuous martingales and Brownian motion",
        "url": null,
        "venue": "Springer",
        "year": 2013
      },
      "exists": null,
      "explanation": "Standard reference for martingale theory and stochastic calculus, establishing the notation for the paper.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Elton P. Hsu"
        ],
        "doi": null,
        "key": "hsustochastic",
        "raw": "hsustochastic: title=Stochastic Analysis on Manifolds, author=Hsu, E.P., isbn=9780821883884, series=Contemporary Mathematics, url=https://books.google.es/books?id=2NM0Z7svRmEC, publisher=American Mathematical Soc., year = 2002",
        "title": "Stochastic Analysis on Manifolds",
        "url": "https://books.google.es/books?id=2NM0Z7svRmEC",
        "venue": "American Mathematical Society",
        "year": 2002
      },
      "exists": null,
      "explanation": "Primary reference for the existence and uniqueness of the Langevin diffusion process on manifolds.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "C. Villani"
        ],
        "doi": null,
        "key": "villani2008optimal",
        "raw": "villani2008optimal: title=Optimal Transport: Old and New, author=Villani, C., isbn=9783540710509, lccn=2008932183, series=Grundlehren der mathematischen Wissenschaften, url=https://books.google.es/books?id=hV8o5R7\\_5tkC, year=2008, publisher=Springer Berlin Heidelberg",
        "title": "Optimal Transport: Old and New",
        "url": "https://books.google.es/books?id=hV8o5R7_5tkC",
        "venue": "Springer",
        "year": 2008
      },
      "exists": null,
      "explanation": "Foundational text for optimal transport, cited for the HWI inequality and related functional inequalities.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    }
  ],
  "missing_references": [
    {
      "reason": "This is a standard reference for Sobolev spaces on Riemannian manifolds, providing much deeper geometric context for the constructions in Appendix B.",
      "title": "Hebey, E. (1996). Sobolev Spaces on Riemannian Manifolds. Springer."
    },
    {
      "reason": "Since the paper explicitly mentions 'barren plateaus' in the abstract and relates to quantum information, this seminal paper defining the phenomenon is a key missing reference.",
      "title": "McClean, J. R., Boixo, S., Smelyanskiy, V. N., Babbush, R., & Neven, H. (2018). Barren plateaus in quantum neural network training landscapes. Nature communications."
    }
  ],
  "summary": "The paper exhibits excellent citation hygiene with a comprehensive bibliography of 87 entries that spans classical geometry, stochastic analysis, and modern physics. The authors provide thorough context for both foundational results and recent related work, particularly the predecessor work by Li & Erdogdu. Minor issues include an incorrect label of a ZBL number as an arXiv ID and the use of a non-peer-reviewed forum post as a primary source for a technical lemma."
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.78,
  "questions": [
    "Can the authors verify that each of the 13+ geometric constants (injectivity radius, convexity radius, sectional curvature bound K, etc.) scales polynomially in dim(M) for at least one non-trivial manifold family, such as complex Stiefel manifolds St(n,m) with n,m growing, and add an explicit table or appendix to the paper documenting these bounds?",
    "Would the authors release a companion code artifact—for example, a discretized Langevin simulation on Stiefel quotients and on the mean-field Ising model—to empirically corroborate the claimed polynomial mixing scaling and the β-scaling concentration of Theorem 78?",
    "For the Stack Exchange citation (preguntastack) used in the proof of Proposition 48, can the authors either include a self-contained proof of the CIR escape time bound in an appendix or cite a peer-reviewed equivalent, demoting the forum post to an acknowledgment?",
    "In the proof of Proposition 168 (projected Hessian), can the authors explicitly exhibit the vertical/horizontal decomposition using O'Neill's formulas and invoke the totally-geodesic-fiber hypothesis, so that the reduction of Assumptions 9–10 on F̃ to conditions on F via Remark 11 is self-contained for the reader?",
    "Would the authors add an explicit formula for t_mix(ε) to Remark 16—specifically t_mix(ε) = O(α^{-1} log(β · max F / ε²)) = poly(dim) · O(log dim)—to prevent readers from conflating the exponential TV-decay rate with the mixing time?"
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "The paper is a math.PR / stat.ML manuscript whose central operational claim — that mixing times are polynomial in dim(M) under stated assumptions — is exactly the kind of quantitative claim that benefits from empirical corroboration. The named applications (trace-ratio quotient minimization, 2D ferromagnetic Ising mean-field) are explicitly numerical/algorithmic: one can simulate Langevin dynamics on Stiefel quotients and on small Ising configurations, and verify the empirical TV-decay scaling vs. dim. The paper does not ship any such artifact, nor a Lean/Coq formalization of any of the headline inequalities (Theorem 34, Theorem 68, Theorem 78). Per the Proof-as-Code axiom for math.* / stat.ML papers, this counts as a notable weakness.",
      "id": "weakness-1",
      "locator": "Section 1 (Theorem 14, Remark 16); Section 7 (sec:traceratio).",
      "required_update": "Ship a small companion code release. Concretely: (i) `experiments/trace_ratio/run.py` — discretized Langevin on St(n,m)/U(m) with empirical TV vs. iteration count for a family of dimensions, to test the dim-polynomial-mixing claim; (ii) `experiments/ising_2d/run.py` — mean-field Ising Gibbs sampling verifying β-scaling concentration of Theorem 78. Optionally: (iii) `proofs/CD_to_LSI.lean` (or Coq equivalent) formalizing Theorem 68 since it is a self-contained 3-step argument.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 1 (Theorem 14, Remark 16); Section 7 (sec:traceratio).` is corrected or justified.",
      "weakness_index": 0
    },
    {
      "evidence": "The claim is a direct consequence of substituting polynomial-in-dim bounds into the explicit formulas for α_M, α_{M/G}. Algebraically this is straightforward. However, the claim is conditional on 13+ geometric quantities all scaling polynomially in dim(M); the paper does not verify this for any concrete sequence of manifolds beyond the brief Section 7 references (trace ratio and 2D Ising mean-field). For the trace quotient on Stiefel/Grassmann manifolds, several of these constants (injectivity radius, convexity radius, K) are known to scale non-trivially with dimension and merit explicit verification.",
      "id": "weakness-2",
      "locator": "Section 1, Remark 16 (and Theorem 14 informal scaling).",
      "required_update": "Add an explicit table or appendix giving polynomial scaling for each constant in at least one nontrivial family (e.g. complex Stiefel St(n,m) with n,m growing, or product of spheres). A numerical Langevin simulation `experiments/mixing_scaling/{stiefel,spheres}.py` recording empirical TV-decay vs. dim would directly corroborate the headline scaling claim, which is currently only an algebraic consequence of unverified per-family bounds.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 1, Remark 16 (and Theorem 14 informal scaling).` is corrected or justified.",
      "weakness_index": 1
    },
    {
      "evidence": "Lemma 79 follows Li-Erdogdu C.1; Lemma 80 lower-bounds the partition-function denominator using Croke's geodesic-sphere volume comparison (valid for ρ ≤ i(M)/2). The exponentiation and Gamma-function inequalities (Batir 2008) are correctly applied. However, the statement of Lemma 80 prints 'R = 2ε/A_2', whereas the proof and Lemma 79 both use R = √(2ε/A_2) (and the proof's computation `1/(A_2 R²) = 1/(2ε)` is only consistent with R = √(2ε/A_2)). This is almost certainly a typographical error in the statement of Lemma 80, not a substantive one; the proof's final inequality is correct under R = √(2ε/A_2).",
      "id": "weakness-3",
      "locator": "Section 6, Theorem 78 (thm:MainFormal2), proved via Lemmas 79–80",
      "required_update": "Correct the statement of Lemma 80 to 'R = √(2ε/A_2)' to match Lemma 79 and the proof body.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 6, Theorem 78 (thm:MainFormal2), proved via Lemmas 79–80` is corrected or justified.",
      "weakness_index": 2
    },
    {
      "evidence": "Algebraically correct given the formal LSI constants. However, the TV bound ‖ν−ρ_t‖² ≤ β · max F · e^{−2α t} requires t to grow at least like (log(β · max F))/α to obtain ε accuracy. If β = poly(dim) and max F = poly(dim), then 'log' is logarithmic in dim, so mixing-to-ε scales as α^{-1} · O(log dim) = poly(dim) · O(log dim). The remark is consistent with this reading but does not state it explicitly; a less careful reader may conclude TV is small at t = O(1/poly(dim)), which is not what the bound shows.",
      "id": "weakness-4",
      "locator": "Section 1, Remark 16.",
      "required_update": "In Remark 16, write out the mixing-time-to-ε bound explicitly: t_mix(ε) = α^{-1} · log(β · max F / ε²) = poly(dim) · log(poly(dim)/ε), rather than just naming the exponent rate.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 1, Remark 16.` is corrected or justified.",
      "weakness_index": 3
    },
    {
      "evidence": "This is stated as a consequence of how the Hessian decomposes along horizontal and vertical directions for a Riemannian submersion with fiber-invariant F. The result is plausible and standard for Riemannian submersions with totally geodesic fibers (where the second fundamental form vanishes), but the full proof (Proposition 168) is in an appendix not shown here. The reduction of Assumption 9–10 on F̃ to a condition on F via Remark 11 depends critically on this projection lemma being correctly stated.",
      "id": "weakness-5",
      "locator": "Section 1, Remark 11; supporting Proposition prop:projectedHessian (referenced).",
      "required_update": "Ensure the proof of Proposition 168 (projected Hessian) explicitly treats the vertical/horizontal split using O'Neill's formulas and the totally-geodesic-fiber hypothesis; cross-reference here for the reader.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 1, Remark 11; supporting Proposition prop:projectedHessian (referenced).` is corrected or justified.",
      "weakness_index": 4
    }
  ],
  "strengths": [
    "The generalization of rapid mixing analysis from products of spheres to compact Riemannian quotient manifolds via Riemannian submersions is technically non-trivial and substantially broadens the scope of provably-efficient Gibbs sampling on curved spaces.",
    "Explicit closed-form constants are tracked throughout the main results (LSI constants α_M and α_{M/G}, Poincaré constant λ_*/184), making the bounds concrete and actionable rather than merely existential.",
    "The modular proof architecture—Poincaré inequality on quotient, submersion lifting, CD-to-LSI tightening—is clean and internally consistent, with each module independently verified by the technical correctness specialist.",
    "The Riemannian submersion framework (Section 3) provides an elegant mechanism for handling symmetry-induced multiple global minima by reducing to the orbit space where the minimum is unique, and the lifting argument is correctly grounded in the classical Fubini-on-submersions decomposition.",
    "The bibliography (87 entries) is comprehensive and accurately cited, spanning classical Riemannian geometry, stochastic calculus, Bakry-Émery theory, and modern physics applications with only minor hygiene issues."
  ],
  "summary": "The paper makes a significant contribution by establishing sufficient conditions for rapid mixing of Langevin dynamics on compact Riemannian manifolds, extending prior results from product-of-spheres settings (Li & Erdogdu 2023) to a substantially broader class of manifolds including Lie group quotients via a Riemannian submersion lifting technique. The novelty specialist rates the work significant (score 0.75, confidence 0.90), and the technical correctness specialist finds the core analytical architecture mostly sound (confidence 0.62), with the principal results—the Poincaré inequality on the quotient manifold (C2), the local escape time bound (C3), the CD-to-LSI tightening (C4), and the Riemannian submersion lifting (C7)—all assessed as supported. The primary critical gap identified across two specialists is the complete absence of executable or formally verified proof artifacts: the reproducibility specialist flags a missing formal proof artifact at critical severity and missing executable benchmarks for the trace-ratio and Ising applications at major severity, and the technical correctness specialist independently flags the same absence as an unsupported major claim (C9). Since the paper's field (stat.ML / math.PR) lies within the code-amenable set and two specialists flagged proof-as-code artifacts missing at major or critical severity, the recommendation defaults to major_revision. Additional minor technical issues include a typographical error in Lemma 80 (R stated as 2ε/A_2 instead of √(2ε/A_2)), an imprecise mixing-time statement in Remark 16 that conflates the TV-decay rate with the actual mixing time to ε, and unverified polynomial scaling of 13+ geometric constants in any concrete manifold family. Citation quality is excellent overall, with two missing references (Hebey on Sobolev spaces, McClean et al. on barren plateaus) and one Mathematics Stack Exchange post used as the primary source for a technical CIR escape-time lemma.",
  "weaknesses": [
    "No executable or formally verified proof artifact accompanies the paper; the polynomial-in-dimension mixing claim cannot be independently corroborated by simulation or machine-checked proof, despite the stat.ML / math.PR field being directly amenable to both Langevin discretization experiments and Lean/Coq formalization.",
    "The headline polynomial mixing time claim (Remark 16, Theorem 14) is not verified for any concrete manifold family: 13+ geometric constants are assumed to scale polynomially in dim(M) but are not established for the named applications (Stiefel quotients, mean-field Ising).",
    "Lemma 80 contains a typographical error, stating R = 2ε/A_2 while the proof body and Lemma 79 both require R = √(2ε/A_2); the proof is correct under the square-root reading but the misprint is potentially misleading.",
    "Remark 16 does not write the mixing-time-to-ε bound explicitly; the implicit scaling t_mix(ε) = poly(dim) · O(log dim) is understated and a less careful reader may conclude TV is small at t = O(1/poly(dim)).",
    "A Mathematics Stack Exchange post (preguntastack, 2025) is cited as the primary source for a technical CIR escape-time calculation used in Proposition 48; this non-peer-reviewed reference should be replaced or supplemented with a self-contained proof or peer-reviewed citation."
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
      "delta": "The authors generalize the rapid mixing analysis, previously established for products of spheres, to a significantly broader class of Riemannian manifolds (including quotient manifolds) by employing a Riemannian submersion framework to factor out symmetries.",
      "relation": "builds_on",
      "title": "Riemannian Langevin algorithm for solving semidefinite programs"
    },
    {
      "citation_key": "menz2014",
      "delta": "While this prior work handles multiple minima in Euclidean space via energy landscape decomposition, the current paper specifically addresses the multiplicity of minima arising from group symmetries in the Riemannian setting by analyzing the process on the orbit space.",
      "relation": "prior_art",
      "title": "Poincaré and logarithmic Sobolev inequalities by decomposition of the energy landscape"
    },
    {
      "citation_key": "bakry2013analysis",
      "delta": "This paper extends foundational Bakry-Émery theory to scenarios where the curvature-dimension condition may be negative (low-temperature regime), utilizing Lyapunov functions and submersion lifting techniques to recover tight log-Sobolev inequalities.",
      "relation": "prior_art",
      "title": "Analysis and Geometry of Markov Diffusion Operators"
    },
    {
      "citation_key": "HIM23",
      "delta": "The paper applies the geometric insights of Riemannian submersions—studied in HIM23 for Dyson Brownian motion—to the specific problem of obtaining polynomial mixing times for Langevin dynamics in high dimensions.",
      "relation": "prior_art",
      "title": "Motion by mean curvature and Dyson Brownian Motion"
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
      "description": "No code repository, notebooks, scripts, or machine-checkable proof artifacts are specified, so the main rapid-mixing and concentration claims cannot be reproduced or checked by an executable artifact.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "The headline theoretical results depend on a long chain of analytic lemmas and theorems, but no formal proof artifact such as proofs/main_results.lean or proofs/poincare_lsi.lean is provided to mechanically verify the proof dependencies.",
      "severity": "critical"
    },
    {
      "area": "evaluation",
      "description": "The trace-ratio and mean-field Ising scenarios are discussed analytically, but no executable examples or parameterized calculations are provided to reproduce the claimed polynomial scaling of constants in concrete instances.",
      "severity": "major"
    },
    {
      "area": "data",
      "description": "No dataset is required for the core theory, and no external benchmark or generated instance set is specified for reproducing the illustrative applications.",
      "severity": "info"
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
  "reproducibility_score": 0.32
}
```

### summary (`claude-haiku-4-5-20251001`) — status: `pass`

```json
{
  "audience": "Researchers in probability theory, stochastic processes, and differential geometry; mathematical physicists working on sampling and lattice gauge theory; machine learning theorists interested in optimization convergence guarantees on manifolds; mathematicians studying Markov chains and Bakry-Émery theory",
  "key_contributions": [
    "Establishes conditions (curvature, temperature, escape directions, gradient bounds) ensuring logarithmic Sobolev inequality and rapid mixing for Langevin dynamics on compact Riemannian manifolds",
    "Proves exponential convergence of Langevin diffusion to Gibbs measures with polynomial-in-dimension mixing time constants",
    "Develops technique for lifting Poincaré inequalities from quotient manifolds to total spaces via Riemannian submersions, handling symmetry-induced multiple minima",
    "Extends rapid mixing results from product of spheres (prior work) to general classes of Riemannian manifolds including quotient manifolds",
    "Provides explicit bounds on convergence rates in terms of geometric and functional properties (Ricci curvature, injectivity radius, critical point spacing, gradient lower bounds)"
  ],
  "plain_language_summary": "Sampling from complex probability distributions is a fundamental problem in physics and machine learning. The Gibbs distribution is a natural choice for many applications, but sampling it directly is usually impossible. Langevin dynamics—a continuous-time stochastic process that combines gradient descent with random noise—provides one way to approximate sampling. This paper studies how fast Langevin dynamics converge to the target Gibbs distribution when the underlying space is a Riemannian manifold (a curved geometric space) rather than ordinary flat Euclidean space.\n\nThe main contribution is identifying concrete conditions on the manifold's geometry and the objective function that guarantee rapid convergence. These conditions involve the manifold's curvature, the temperature parameter of the Gibbs distribution, the ability to escape saddle points, and the absence of flat regions (barren plateaus) where the gradient becomes too small. When these conditions hold, the paper proves the convergence happens exponentially fast, with mixing times that scale only polynomially with the dimension of the manifold.\n\nThe authors use a clever technique based on Riemannian submersions (projections of manifolds that preserve geometric structure) to handle cases where the objective function has multiple global minima due to symmetry. They factor out these symmetries via a Lie group action, reducing the problem to the quotient manifold where the minimum is unique. The results extend and generalize prior work limited to product spaces of spheres, and have applications to physics (lattice gauge theory), optimization on manifolds, and differential privacy.",
  "tldr": "This paper establishes conditions under which Langevin dynamics on Riemannian manifolds rapidly converge to Gibbs measures, achieving polynomial mixing times by controlling curvature, avoiding barren plateaus, and ensuring saddle points can be escaped."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `pass`

```json
{
  "claims": [
    {
      "assessment": "partially_supported",
      "claim": "Under Assumptions 1–12 and the stated polynomial lower bound on β, the Markov triples (M,ν,Γ) and (M/G,ν̃,Γ̃) satisfy logarithmic Sobolev inequalities with constants α_M = 1/(4β(A_2+R_M)diam(M)^2 · max(184/λ_*, diam(G)^2 β/π^2)) and α_{M/G} = λ_*/(736 β(A_2+R_{M/G})diam(M/G)^2), implying total-variation convergence ‖ν−ρ_t‖²_TV ≤ β e^{−2α_M t} max F (Theorem 14 / Theorem 76 / Corollary 77).",
      "evidence": "The proof is a clean composition of three steps each proved earlier in the paper: (i) PI(λ_*/184) on M/G via Theorem 34, (ii) lifting via the Riemannian submersion (Theorem 59), and (iii) tightening PI to LSI via the curvature-dimension condition (Theorem 68). Each step is internally derived. The Pinsker step (Prop. 66) and bound on H(ρ_0|ν) (Prop. 67) are standard. However, the final TV bound is stated with prefactor `β · max F` rather than the (1/2)·β·max F that Pinsker+Prop. 67 would give; this is a harmless absorption of constants but not flagged. No independent or empirical verification of the assembled constants is shown.",
      "id": "C1",
      "location": "Section 1 (Theorem 14), Section 5 (Theorem 76, Corollary 77), eqs. for 1/α_M, 1/α_{M/G}",
      "severity": "minor",
      "suggested_fix": "State explicitly that the leading 1/2 from Pinsker has been absorbed when writing β·max F, or carry the 1/2 through. Add a short numerical experiment (e.g. simulate Langevin dynamics on a small product of spheres) to corroborate the dependence of α on the listed parameters; an `experiments/mixing_scaling/run.py` would directly validate the headline scaling claim."
    },
    {
      "assessment": "supported",
      "claim": "Under Assumptions 25–33 (with κ ≥ 1, the curvature bound, gradient/Hessian Lipschitz constants, escape direction and 'no barren plateaus' conditions) and the explicit lower bounds on a^2 and β, the Markov triple (B,ν̃,Γ̃) satisfies PI(λ_*/184) (Theorem 34).",
      "evidence": "Two Lyapunov functions W_1 = exp(β F̃/2) and W_2 = E[exp(λ_* τ*/16)] are constructed (Prop. 39, Cor. 49). The local Poincaré inequality on the basin of the global minimum follows from the curvature-dimension condition under geodesic convexity (Lemma 50). The Lyapunov extension uses a smooth bump function (Lemma 52), Green's identity in the Neumann form (Lemma 53), and the standard product Gamma inequality, all chained algebraically; constants 184, 32, 64 are tracked explicitly. The argument closely mirrors and generalizes Li-Erdogdu (2022, Appendix D), with the simplifying assumption of a unique minimum of F̃ correctly exploited.",
      "id": "C2",
      "location": "Section 2, Theorem 34 (prop9.12); proof in Section 2.3",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "The first escape time τ* of X̃_t from U(a/√β, S̃) has exponentially decaying tails: P[τ* ≥ t | X̃_0 = x] ≤ C exp(−λ_* t/8) (Proposition 48, Local Escape Time Bound).",
      "evidence": "The proof uses Itô's formula on (1/2)r̃²(X̃_t) (eq. originalSDE), lower-bounds the drift to obtain D(x) ≥ λ_* r̃(x)² + 1/(4β) via three explicitly checked inequalities (auxbound1, auxbound2, AuxLemma3), then constructs a comparison process Y_t whose tail is bounded by the moment-generating function argument in Prop. 216. The choice β ≥ 72² dim(M)^5 A_2 A_3² K² a^6 is chosen exactly to dominate the two error terms in the drift bound (gives 1/8 + 1/8 = 1/4 margin), which is consistent with the algebra. The proof follows Li-Erdogdu Prop. D.6 in structure but is adapted for the projected Hessian via the auxiliary linearization H_y.",
      "id": "C3",
      "location": "Section 2.2, Proposition 48 (prop9.6) and its proof (Itô SDE for r̃²(X̃_t), SDE comparison giving Y_t).",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "If a Markov triple satisfies CD(−κ_1) with κ_1 > 0 (curvature-dimension condition with negative constant) and PI(κ_2) with κ_2 > 0, then it satisfies LSI(α) with 1/α = 4β κ_1 diam(M)² / κ_2 (Theorem 68).",
      "evidence": "The proof correctly invokes Villani's HWI inequality (Cor. 20.13 of Villani 2008), bounds W_2 ≤ 2 diam(M) (Remark 74 — uses ‖μ−η‖_TV ≤ 2, correct since both are probability measures), applies Young's inequality to extract a defective LSI(1/(εβ), A), and then tightens via the standard Bakry-Émery argument (Prop. 5.1.3 of Bakry-Gentil-Ledoux 2014). The choice ε = diam(M)/√(βκ_2) minimizes the resulting expression. The final algebra absorbs the WLOG normalizations β ≥ 1, κ_2 ≤ 1, diam(M) ≥ 1, κ_1 > 1 to reach the compact 4β κ_1 diam(M)²/κ_2 bound; this absorbs constants generously but is monotone in the right direction.",
      "id": "C4",
      "location": "Section 4, Theorem 68 (prop9.15) and its proof using HWI inequality (Prop. 72), Wasserstein bound (Remark 74), Young's inequality, and Bakry-Émery tightening (Prop. 75).",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Theorem 78 (formal Suboptimality of the Gibbs distribution): for ε ≤ ε_max = min(i(M)² A_2/8, 1) and β ≥ (2/ε)(1/2 + d² log(d³ A_2 Vol(M)√(2π)/(δε))), the Gibbs measure satisfies ν(F − min F ≥ ε) ≤ δ.",
      "evidence": "Lemma 79 follows Li-Erdogdu C.1; Lemma 80 lower-bounds the partition-function denominator using Croke's geodesic-sphere volume comparison (valid for ρ ≤ i(M)/2). The exponentiation and Gamma-function inequalities (Batir 2008) are correctly applied. However, the statement of Lemma 80 prints 'R = 2ε/A_2', whereas the proof and Lemma 79 both use R = √(2ε/A_2) (and the proof's computation `1/(A_2 R²) = 1/(2ε)` is only consistent with R = √(2ε/A_2)). This is almost certainly a typographical error in the statement of Lemma 80, not a substantive one; the proof's final inequality is correct under R = √(2ε/A_2).",
      "id": "C5",
      "location": "Section 6, Theorem 78 (thm:MainFormal2), proved via Lemmas 79–80",
      "severity": "minor",
      "suggested_fix": "Correct the statement of Lemma 80 to 'R = √(2ε/A_2)' to match Lemma 79 and the proof body."
    },
    {
      "assessment": "partially_supported",
      "claim": "Polynomial mixing time scaling (Remark 16 / informal): if diam(M), diam(M/G), diam(G), R_M, R_{M/G}, K, 1/i(M), 1/i(M/G), 1/conv(M/G), 1/λ_*, 1/D, 1/C_{F̃}, A_2, A_3 all scale polynomially in dim(M), and max F scales polynomially in dim(M), then the TV distance to ν decays at rate Ω(1/poly(dim(M))).",
      "evidence": "The claim is a direct consequence of substituting polynomial-in-dim bounds into the explicit formulas for α_M, α_{M/G}. Algebraically this is straightforward. However, the claim is conditional on 13+ geometric quantities all scaling polynomially in dim(M); the paper does not verify this for any concrete sequence of manifolds beyond the brief Section 7 references (trace ratio and 2D Ising mean-field). For the trace quotient on Stiefel/Grassmann manifolds, several of these constants (injectivity radius, convexity radius, K) are known to scale non-trivially with dimension and merit explicit verification.",
      "id": "C6",
      "location": "Section 1, Remark 16 (and Theorem 14 informal scaling).",
      "severity": "minor",
      "suggested_fix": "Add an explicit table or appendix giving polynomial scaling for each constant in at least one nontrivial family (e.g. complex Stiefel St(n,m) with n,m growing, or product of spheres). A numerical Langevin simulation `experiments/mixing_scaling/{stiefel,spheres}.py` recording empirical TV-decay vs. dim would directly corroborate the headline scaling claim, which is currently only an algebraic consequence of unverified per-family bounds."
    },
    {
      "assessment": "supported",
      "claim": "Riemannian submersion lifting (Theorem 59-equivalent, Section 3): a Poincaré inequality on (M/G, ν̃, Γ̃) lifts to a Poincaré inequality on (M, ν, Γ) with constant max(1/κ_{M/G}, diam(G)² β/π²), via Fubini-on-submersions (Theorem 54 / Corollary 55) and the fact that the compact-fiber group (G,ĝ) satisfies a Poincaré inequality.",
      "evidence": "The Fubini-style decomposition is a classical result (Sulanke-Wintgen, 1972, ch. III §2 Thm 1), correctly specialized to Riemannian submersions where dVol_g = dVol_ĝ ∧ π* dVol_h via the horizontal/vertical decomposition. Upgraded regularity (Prop. 56) is justified via local trivialization. The π²/diam(G)² factor is the standard Poincaré constant on a compact manifold with non-negative Ricci (consistent with Assumption 2 on fibers being totally geodesic with non-negative Ricci).",
      "id": "C7",
      "location": "Section 3 (SectionLift), Corollary 55 (LiftingSobolev), Proposition 56.",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Assumption 4 (F constant on fibers) plus Assumptions 9–10 (escape direction at saddles, attractor at minimum) imply that the only non-zero eigenvalues of ∇²F coincide with those of ∇²F̃ (Proposition 168, projected Hessian).",
      "evidence": "This is stated as a consequence of how the Hessian decomposes along horizontal and vertical directions for a Riemannian submersion with fiber-invariant F. The result is plausible and standard for Riemannian submersions with totally geodesic fibers (where the second fundamental form vanishes), but the full proof (Proposition 168) is in an appendix not shown here. The reduction of Assumption 9–10 on F̃ to a condition on F via Remark 11 depends critically on this projection lemma being correctly stated.",
      "id": "C8",
      "location": "Section 1, Remark 11; supporting Proposition prop:projectedHessian (referenced).",
      "severity": "minor",
      "suggested_fix": "Ensure the proof of Proposition 168 (projected Hessian) explicitly treats the vertical/horizontal split using O'Neill's formulas and the totally-geodesic-fiber hypothesis; cross-reference here for the reader."
    },
    {
      "assessment": "unsupported",
      "claim": "The polynomial-in-dimension mixing claim is supported by formal analytical proof; no numerical or symbolic verification artifact is provided despite the field being amenable to executable benchmarks for the trace-quotient and Ising examples named in Section 7.",
      "evidence": "The paper is a math.PR / stat.ML manuscript whose central operational claim — that mixing times are polynomial in dim(M) under stated assumptions — is exactly the kind of quantitative claim that benefits from empirical corroboration. The named applications (trace-ratio quotient minimization, 2D ferromagnetic Ising mean-field) are explicitly numerical/algorithmic: one can simulate Langevin dynamics on Stiefel quotients and on small Ising configurations, and verify the empirical TV-decay scaling vs. dim. The paper does not ship any such artifact, nor a Lean/Coq formalization of any of the headline inequalities (Theorem 34, Theorem 68, Theorem 78). Per the Proof-as-Code axiom for math.* / stat.ML papers, this counts as a notable weakness.",
      "id": "C9",
      "location": "Section 1 (Theorem 14, Remark 16); Section 7 (sec:traceratio).",
      "severity": "major",
      "suggested_fix": "Ship a small companion code release. Concretely: (i) `experiments/trace_ratio/run.py` — discretized Langevin on St(n,m)/U(m) with empirical TV vs. iteration count for a family of dimensions, to test the dim-polynomial-mixing claim; (ii) `experiments/ising_2d/run.py` — mean-field Ising Gibbs sampling verifying β-scaling concentration of Theorem 78. Optionally: (iii) `proofs/CD_to_LSI.lean` (or Coq equivalent) formalizing Theorem 68 since it is a self-contained 3-step argument."
    },
    {
      "assessment": "supported",
      "claim": "Existence and uniqueness of the Langevin diffusion solving the martingale problem (Definition 19), and the equivalence of the formal SDE dX_t = −grad F(X_t) dt + √(2/β) dW_t to the martingale problem, follow from Hsu, Theorems 1.3.4 and 1.3.6.",
      "evidence": "Standard reference; Hsu's 'Stochastic Analysis on Manifolds' (AMS GSM 38) is the canonical citation. Definitions of carré du champ and Markov triple are standard (Bakry-Gentil-Ledoux 2014).",
      "id": "C10",
      "location": "Section 2, Definition 19 (def:LangevinDiffusion).",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "The assertion in Remark 16 that whenever max F = poly(dim(M)) the prefactor β · max F still allows Ω(1/poly(dim(M))) effective TV-decay rate.",
      "evidence": "Algebraically correct given the formal LSI constants. However, the TV bound ‖ν−ρ_t‖² ≤ β · max F · e^{−2α t} requires t to grow at least like (log(β · max F))/α to obtain ε accuracy. If β = poly(dim) and max F = poly(dim), then 'log' is logarithmic in dim, so mixing-to-ε scales as α^{-1} · O(log dim) = poly(dim) · O(log dim). The remark is consistent with this reading but does not state it explicitly; a less careful reader may conclude TV is small at t = O(1/poly(dim)), which is not what the bound shows.",
      "id": "C11",
      "location": "Section 1, Remark 16.",
      "severity": "minor",
      "suggested_fix": "In Remark 16, write out the mixing-time-to-ε bound explicitly: t_mix(ε) = α^{-1} · log(β · max F / ε²) = poly(dim) · log(poly(dim)/ε), rather than just naming the exponent rate."
    }
  ],
  "confidence": 0.62,
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

