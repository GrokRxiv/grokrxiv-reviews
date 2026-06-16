# Angles, orthogonality, and Pythagorean theorem in Banach spaces with two related applications

GrokRxiv review of [arXiv:2605.00009](https://arxiv.org/abs/2605.00009) · `math.GM`

_Authors_: Antonio Cicone, Stefano Serra-Capizzano, Giacomo Tento, Haomin Zhou

## TL;DR

The paper develops a dual-space weak inner product for general Banach spaces, recovering the classical L^2 inner product as a special case, and applies the resulting generalized Pythagorean theorem to two domains: L^1 orthogonality of FIF intrinsic mode functions (IMFs) and l^p-norm circulant preconditioning of Toeplitz linear systems. The novelty is genuine (novelty specialist verdict: significant, score 0.65) and the dual-track application structure is distinctive relative to the prior semi-inner product literature (Lumer 1961). However, three major correctness gaps and a reproducibility score of 0.38 preclude acceptance without revision. The most critical gap, flagged independently by technical_correctness (C5, major, unsupported) and reproducibility (area 'other', major), concerns Theorem 4: the claim that FIF IMFs are pairwise orthogonal in the L^1 sense is unjustified because Theorem 3 is a Fourier-domain L^1 energy-conservation result whereas Theorem 2 is a time-domain pairwise statement; bridging them requires an N-term extension of the pairwise iff and a Fourier-versus-time domain reconciliation, neither of which is provided. Theorem 1 in generic Banach spaces leaves the duality selection implicit (C1, major), rendering the formulation ill-posed when the duality map is multivalued. The empirical PCG iteration counts in Tables 1-2 (C10, major) are unreproducible: no code, tolerance, initialization, or right-hand side is supplied and the conclusion rests on only two parameter triples. The field (math.*) falls within the code-amenable set; absent proof artifacts and experiment scripts constitute load-bearing gaps under the recommendation gate, defaulting the recommendation to major_revision.

_Recommendation_: **Major revision** · _Confidence_: 78%

## Strengths

- The weak inner product framework reduces correctly to the classical L^2 inner product (C2, supported), providing validated theoretical foundations for the generalization.
- The L^1 Pythagorean theorem (Theorem 2, C3, supported) is an algebraically rigorous result that cleanly characterizes L^1 orthogonality and directly motivates the signal processing application.
- The closed-form l^p circulant minimizer (C6, supported) and its eigenvalue formula (C7, supported) are explicit, verifiable contributions to the Toeplitz preconditioning literature.
- The paper bridges non-stationary signal decomposition and structured linear algebra under a single geometric framework, a combination absent from the cited prior art.
- Citation hygiene is strong for the iterative filtering (Cicone 2021, 2024), GLT (GLT-bookI/IV), and classical preconditioning (CN-Sirev, Ng 2004) literature, and the distinction from Lumer's semi-inner product is explicitly acknowledged.

## Weaknesses

- Theorem 4 (IMF pairwise L^1 orthogonality) is unsupported: the proof conflates Fourier-domain L^1 energy conservation (Theorem 3) with time-domain L^1 pairwise orthogonality (Theorem 2), without providing the N-term extension of the pairwise iff or the domain reconciliation required to bridge them (C5, major, unsupported).
- Theorem 1 (Generalized Pythagorean Theorem) does not specify the duality selection convention in generic Banach spaces, leaving the result ill-posed when the normalized duality map J: X → 2^{X*} is multivalued at non-smooth points of the norm (C1, major, partially_supported).
- The empirical PCG iteration counts in Tables 1-2 are unreproducible: no experiment code, stopping tolerance, initial guess, right-hand side, or handling of singular cases is provided, and the 'lower p is better' conclusion rests on only two (α,β,γ) parameter triples (C10, major, unsupported).
- No proof artifacts (Lean/Coq/Agda for Theorems 1-4) or paper-specific experiment scripts are deposited, yielding a reproducibility score of 0.38 and leaving all headline claims unverifiable by code (reproducibility specialist, four major concerns).
- The abstract's claim of an 'L^p Pythagorean theorem' is misleading: the result is a dual-pairing identity, not the norm-power equality ||f+g||_p^p = ||f||_p^p + ||g||_p^p that the phrase connotes, and the framing requires correction (C4, minor).
- The bibliography omits canonical Banach-space orthogonality references (Birkhoff 1935, James 1947, Dragomir 2004), making it impossible to assess whether the proposed orthogonality coincides with or strictly extends Birkhoff-James orthogonality.

## Revision Targets

- [ ] **Manuscript: Examples / Signal Processing, Theorem 4**
  - Location: `Examples / Signal Processing, Theorem 4`
  - Evidence: Theorem 2 is a pairwise statement: ||f+g||_1 = ||f||_1 + ||g||_1 iff f ⊥_{L^1} g. The FIF decomposition involves m + 1 components (s = Σ IMF_k + r), and Theorem 3 gives E_1(s) = Σ E_1(IMF_k) + E_1(r), i.e. ||\hat s||_1 = Σ ||\widehat{IMF}_k||_1. To deduce pairwise orthogonality from a multi-term L^1 additivity one must (a) bootstrap the pairwise iff to N terms (which requires nonnegativity-style arguments, since ||·||_1 only satisfies a triangle inequality), and (b) cope with the fact that energy conservation is stated on the Fourier-side L^1 norm (||\hat s||_1) while the orthogonality definition (Def. 4 / Theorem 2) is in the time-domain L^1. The paper does not address the Fourier-vs-time discrepancy nor the N-term extension; the one-line 'direct consequence' justification is incomplete.
  - Required change: Either (i) restate Theorem 4 explicitly as Fourier-domain L^1 orthogonality of the \widehat{IMF}_k (using Theorem 2 applied to the transforms), and provide the N-term induction relying on the no-unwanted-oscillation Theorem 3 condition Σ_k |\widehat{φ}_k(ξ)| = |\hat s(ξ)| pointwise; or (ii) provide a separate result establishing time-domain L^1 orthogonality. Ship a formal proof at src/proofs/IMFOrthogonalityL1.lean and a numerical sanity check at experiments/imf_l1_orthogonality.py exercising both pairwise and aggregate orthogonality.
  - Verification: Re-review should confirm `Examples / Signal Processing, Theorem 4` is corrected or justified.
- [ ] **Manuscript: Main results, Theorem 1, eq:pytha_X**
  - Location: `Main results, Theorem 1, eq:pytha_X`
  - Evidence: Algebraically, expanding 0 = (1/2) ∫ [f((f+g)* - f*) + g((f+g)* - g*)] dx and rearranging directly yields ∫(f+g)(f+g)* = ∫ f f* + ∫ g g*, so the equivalence is essentially a tautology of the chosen 'weak inner product' definition. However, in a generic Banach space the duality mapping is in general multivalued (e.g. at points where the norm is not Gateaux differentiable), so f*, g*, (f+g)* are not canonically determined, and the theorem's statement does not specify which dual elements must be used or whether orthogonality should hold for all admissible selections or some. No formal proof is provided, and the dependence on the choice of duality map is not analyzed.
  - Required change: State the duality selection convention explicitly (e.g. via the normalized duality mapping J: X → 2^{X*}), formalize Theorem 1 as a one-line algebraic identity, and discuss the multivalued case. Provide a machine-checkable proof of the iff in src/proofs/PythagoreanBanach.lean (or .v / .agda).
  - Verification: Re-review should confirm `Main results, Theorem 1, eq:pytha_X` is corrected or justified.
- [ ] **Evaluation pipeline**
  - Location: `HAC/bootstrap` at `evaluation and statistical-testing pipeline`
  - Evidence: The preconditioning tables specify n, p, and selected alpha/beta/gamma cases, but omit the right-hand side, initialization, PCG stopping tolerance, precision, implementation details, and handling of singular or indefinite preconditioners, making exact iteration counts hard to reproduce.
  - Required change: Publish evaluation scripts or executable pseudocode for walk-forward retraining, validation selection, HAC/bootstrap settings, benchmark construction, and table regeneration.
  - Verification: Re-review should confirm the evaluation pipeline can reproduce the reported statistical tests and benchmarks.
- [ ] **Code release and entrypoints**
  - Location: `Lean/Coq/Agda` at `code release and execution entrypoints`
  - Evidence: The paper gives only a general FIF algorithm URL and does not provide paper-specific scripts, a repository, license, commit, or release for regenerating the figures, energy checks, or preconditioning tables.
  - Required change: Release the source code, scripts, model configuration, and execution entrypoints needed to regenerate the reported tables, or document why those artifacts cannot be released.
  - Verification: Re-review should confirm runnable code or a documented non-release justification is present.
- [ ] **Manuscript: Main results / Special cases / L^p spaces, eq:InnerProd**
  - Location: `Main results / Special cases / L^p spaces, eq:InnerProd`
  - Evidence: The text restates Definition 3 with the canonical L^p–L^q duality. The duality mapping in L^p is single-valued and equals J(f)(x) = |f(x)|^{p-1} sign(f(x)) · ||f||_p^{2-p}; with that choice the statement is a special case of Theorem 1. However, the paper neither specifies the choice of f*, g*, (f+g)* (e.g. via J or unnormalized as |f|^{p-1} sign f) nor verifies a Pythagorean identity analogous to ||f+g||_p^p = ||f||_p^p + ||g||_p^p; in fact such a p-power identity does not generally hold for p ≠ 1, 2, so the 'L^p Pythagorean theorem' advertised in the abstract is only the implicit equality ∫(f+g)(f+g)* = ∫ f f* + ∫ g g*, which is not the standard L^p Pythagorean statement and may be misleading.
  - Required change: Make the duality selection explicit, exhibit the closed-form equality the orthogonality implies in L^p (it is NOT ||f+g||_p^p = ||f||_p^p + ||g||_p^p), and tone down the abstract to reflect that the L^p version is only the dual-pairing identity.
  - Verification: Re-review should confirm `Main results / Special cases / L^p spaces, eq:InnerProd` is corrected or justified.
- [ ] **Bibliography: Birkhoff, G. (1935). Orthogonality in normed linear spaces. Transactions of the American Math...**
  - Location: bibliography entry: `Birkhoff, G. (1935). Orthogonality in normed linear spaces. Transactions of the American Mathematical Society.`
  - Evidence: The paper proposes a new definition for orthogonality in Banach spaces but does not mention the most standard existing definition in this field, Birkhoff-James orthogonality, which is fundamental to any discussion of non-Hilbert orthogonality.
  - Required change: Add a bibliography entry for `Birkhoff, G. (1935). Orthogonality in normed linear spaces. Transactions of the American Mathematical Society` and cite it where the affected method or claim is introduced, or explicitly justify its omission.
  - Verification: Re-review should confirm the bibliography and citation context address this reference.

## Open Questions

- In Theorem 4, does 'pairwise L^1 orthogonality' refer to time-domain or Fourier-domain L^1? If Fourier-domain, apply Theorem 2 to the transforms and state this explicitly; if time-domain, provide the proof step that bootstraps Theorem 3 (a Fourier-domain sum over N components) to time-domain pairwise orthogonality for each pair.
- For Theorem 1 in a generic Banach space, which selection of the normalized duality map J: X → 2^{X*} must be used for the iff to hold—all admissible selections, or a specific one—and how does the result behave at points where the norm is not Gateaux differentiable?
- What stopping tolerance, initial vector, and right-hand side were used for the PCG experiments in Tables 1-2, and how were the singular or indefinite cases (marked '#') detected and handled?
- How does the 'weak inner product' orthogonality of Definition 1 relate to Birkhoff-James orthogonality in the same Banach space—are they equivalent, and if not, which is strictly coarser?
- Is the 'optimal p' heuristic of Remark 5 stable across a broader (α,β,γ) sweep beyond the two parameter triples in Tables 1-2, and are there regimes where smaller p does not minimize PCG iterations?

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
          "Rajendra Bhatia"
        ],
        "doi": null,
        "key": "Bhatia",
        "raw": "Bhatia",
        "title": "Matrix Analysis",
        "url": null,
        "venue": "Springer",
        "year": 1997
      },
      "exists": null,
      "explanation": "Cited for foundational results on Schatten p-norms and eigenvalue interlacing theorems, which are used to justify the matrix-theoretic extensions in the paper.",
      "notes": "Likely refers to the seminal textbook 'Matrix Analysis' by R. Bhatia.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Raymond H. Chan",
          "Michael K. Ng"
        ],
        "doi": null,
        "key": "CN-Sirev",
        "raw": "CN-Sirev",
        "title": "Conjugate Gradient Methods for Toeplitz Systems",
        "url": null,
        "venue": "SIAM Review",
        "year": 1996
      },
      "exists": null,
      "explanation": "A core reference for circulant preconditioning and the use of Strang-type corrections in the solution of Toeplitz systems.",
      "notes": "Standard survey paper for the preconditioning techniques discussed.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Carlo Gilli",
          "M. Lazzaro",
          "Stefano Serra-Capizzano"
        ],
        "doi": null,
        "key": "GLT-bookI",
        "raw": "GLT-bookI",
        "title": "Generalized Locally Toeplitz Sequences: Theory and Applications (Volume I)",
        "url": null,
        "venue": "Springer",
        "year": null
      },
      "exists": null,
      "explanation": "Foundational theoretical reference for Generalized Locally Toeplitz (GLT) sequences, which provide the framework for the preconditioning analysis.",
      "notes": "Primary reference for the GLT theory used throughout the numerical section.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "GLT-bookIV",
        "raw": "GLT-bookIV",
        "title": "Generalized Locally Toeplitz Sequences: Theory and Applications (Volume IV)",
        "url": null,
        "venue": "Springer",
        "year": null
      },
      "exists": null,
      "explanation": "References the extension of GLT theory to multilevel and block structures, mentioned as a direction for generalization.",
      "notes": "Volume IV of the GLT series.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "Koro1",
        "raw": "Koro1",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Cited for classical preconditioning results; likely refers to Korovkin-type theorems applied to Toeplitz preconditioning.",
      "notes": "Context: 'classical results on preconditioning [CN-Sirev; Koro1]'. Likely refers to work by Serra-Capizzano or Korovkin.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "F. Longo"
        ],
        "doi": null,
        "key": "Longo2025AdaptiveSL",
        "raw": "Longo2025AdaptiveSL",
        "title": "Adaptive signal processing for gravitational wave signals",
        "url": null,
        "venue": null,
        "year": 2025
      },
      "exists": null,
      "explanation": "Used as a primary application example for non-stationary signal decomposition (gravitational waves) where L1 energy conservation is relevant.",
      "notes": "Recent work providing the physical motivation for the signal processing part.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Michael K. Ng"
        ],
        "doi": null,
        "key": "Ng_book",
        "raw": "Ng_book",
        "title": "Iterative Methods for Toeplitz Systems",
        "url": null,
        "venue": "SIAM",
        "year": 2004
      },
      "exists": null,
      "explanation": "Key textbook for iterative methods and preconditioning of Toeplitz systems, cited for the arithmetic cost and spectral properties of circulants.",
      "notes": "Central reference for the numerical linear algebra section.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Gene H. Golub",
          "Charles F. Van Loan"
        ],
        "doi": null,
        "key": "Van_Loan",
        "raw": "Van_Loan",
        "title": "Matrix Computations",
        "url": null,
        "venue": "Johns Hopkins University Press",
        "year": 2013
      },
      "exists": null,
      "explanation": "Standard reference for the arithmetic cost of the Fast Fourier Transform (FFT).",
      "notes": "Classic textbook for numerical linear algebra costs.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Sheldon Axler"
        ],
        "doi": null,
        "key": "axler1997numerical",
        "raw": "axler1997numerical",
        "title": "Linear Algebra Done Right",
        "url": null,
        "venue": "Springer",
        "year": 1997
      },
      "exists": null,
      "explanation": "Cited for the extension of the concept of angles to operators.",
      "notes": "Provides mathematical context for operator angles.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "beyond",
        "raw": "beyond",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Cited for numerical experimentation results showing that lower p values can improve clustering and convergence speed in preconditioning.",
      "notes": "Likely refers to a paper titled 'Beyond circulant preconditioners...' or similar.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Antonio Cicone"
        ],
        "doi": null,
        "key": "cicone2021numerical",
        "raw": "cicone2021numerical",
        "title": "Numerical Analysis of the Fast Iterative Filtering Algorithm",
        "url": null,
        "venue": null,
        "year": 2021
      },
      "exists": null,
      "explanation": "Core reference for the Fast Iterative Filtering (FIF) algorithm, which is the main signal processing method analyzed.",
      "notes": "Primary algorithm reference.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Antonio Cicone"
        ],
        "doi": null,
        "key": "cicone2022multivariate",
        "raw": "cicone2022multivariate",
        "title": null,
        "url": null,
        "venue": null,
        "year": 2022
      },
      "exists": null,
      "explanation": "Cited to support the observation that Intrinsic Mode Functions (IMFs) are generally not orthogonal in the L2 sense.",
      "notes": "Supports the motivation for seeking a new orthogonality definition.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Antonio Cicone"
        ],
        "doi": null,
        "key": "cicone2024new",
        "raw": "cicone2024new",
        "title": "A new definition of energy and its conservation",
        "url": null,
        "venue": null,
        "year": 2024
      },
      "exists": null,
      "explanation": "Foundational paper that proved L1 energy conservation in FIF, directly motivating the generalization of the Pythagorean theorem.",
      "notes": "Direct precursor to the current work.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "extreme1",
        "raw": "extreme1",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Cited for spectral approximation results and the behavior of the condition number for Toeplitz matrices.",
      "notes": "Context: 'Euclidean condition number... converges to a constant... see [extreme1]'.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "extreme2",
        "raw": "extreme2",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Companion reference to extreme1 for spectral results.",
      "notes": "Related to extreme eigenvalues of Toeplitz matrices.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Karl Gustafson"
        ],
        "doi": null,
        "key": "gustafson1968angle",
        "raw": "gustafson1968angle",
        "title": "The angle of an operator",
        "url": null,
        "venue": "Proceedings of the American Mathematical Society",
        "year": 1968
      },
      "exists": null,
      "explanation": "Seminal reference for the concept of the angle of an operator, providing historical mathematical context.",
      "notes": "Key reference for previous attempts to generalize angles.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Norden E. Huang"
        ],
        "doi": null,
        "key": "huang1998empirical",
        "raw": "huang1998empirical",
        "title": "The empirical mode decomposition and the Hilbert spectrum for nonlinear and non-stationary time series analysis",
        "url": null,
        "venue": "Proceedings of the Royal Society of London",
        "year": 1998
      },
      "exists": null,
      "explanation": "Seminal paper for Empirical Mode Decomposition (EMD), the precursor to the Iterative Filtering methods discussed.",
      "notes": "Historical context for the signal processing methods.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "imag1",
        "raw": "imag1",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Cited for the use of non-convex functional minimization in imaging as a justification for the proposed L1/Lp approaches.",
      "notes": "Application-based precedent.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "imag2",
        "raw": "imag2",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Companion reference to imag1 for imaging applications.",
      "notes": "Relates to sparse approximation in imaging.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "L. Lin"
        ],
        "doi": null,
        "key": "lin2009iterative",
        "raw": "lin2009iterative",
        "title": "Iterative filtering as an alternative to empirical mode decomposition",
        "url": null,
        "venue": "Advances in Adaptive Data Analysis",
        "year": 2009
      },
      "exists": null,
      "explanation": "Foundational reference for the Iterative Filtering (IF) algorithm.",
      "notes": "Key method reference for non-stationary signal analysis.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Gunter Lumer"
        ],
        "doi": null,
        "key": "lumer1961semi",
        "raw": "lumer1961semi",
        "title": "Semi-inner-product spaces",
        "url": null,
        "venue": "Transactions of the American Mathematical Society",
        "year": 1961
      },
      "exists": null,
      "explanation": "Primary mathematical reference for semi-inner product spaces, used to differentiate the paper's 'weak inner product' from existing theory.",
      "notes": "Essential context for the functional analysis part of the paper.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "sparse_appr1",
        "raw": "sparse_appr1",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Cited for applications of band structures in approximation of PDEs or graph problems.",
      "notes": "Relates to the structured linear systems section.",
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "sparse_appr2",
        "raw": "sparse_appr2",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Companion reference to sparse_appr1.",
      "notes": "Peripheral application reference.",
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Luca Spogli"
        ],
        "doi": null,
        "key": "spogli2025investigating",
        "raw": "spogli2025investigating",
        "title": "Investigating geophysical signals related to the upper atmosphere",
        "url": null,
        "venue": null,
        "year": 2025
      },
      "exists": null,
      "explanation": "Used as an application example in geophysics to demonstrate the need for decomposing signals into quasi-stationary bands.",
      "notes": "Recent application case.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    }
  ],
  "missing_references": [
    {
      "reason": "The paper proposes a new definition for orthogonality in Banach spaces but does not mention the most standard existing definition in this field, Birkhoff-James orthogonality, which is fundamental to any discussion of non-Hilbert orthogonality.",
      "title": "Birkhoff, G. (1935). Orthogonality in normed linear spaces. Transactions of the American Mathematical Society."
    },
    {
      "reason": "Given the focus on generalizations of inner products to Banach spaces, the work of Dragomir on semi-inner products and related inequalities is a significant omission.",
      "title": "Dragomir, S. S. (2004). Semi-Inner Products and Applications. CRC Press."
    },
    {
      "reason": "Since the paper discusses the Pythagorean theorem in L1 and Banach spaces, the classic work of James on orthogonality and its relationship to the Pythagorean theorem should be acknowledged.",
      "title": "James, R. C. (1947). Orthogonality in normed linear spaces. Duke Mathematical Journal."
    }
  ],
  "summary": "The paper exhibits high citation hygiene, particularly in its thorough referencing of the authors' previous work on Iterative Filtering and the Generalized Locally Toeplitz (GLT) framework. It successfully bridges signal processing and numerical linear algebra by drawing from established literature in both fields. However, the theoretical grounding in Banach space geometry could be improved by citing standard concepts like Birkhoff-James orthogonality to better distinguish the proposed 'weak inner product' from classical functional analysis definitions."
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.78,
  "questions": [
    "In Theorem 4, does 'pairwise L^1 orthogonality' refer to time-domain or Fourier-domain L^1? If Fourier-domain, apply Theorem 2 to the transforms and state this explicitly; if time-domain, provide the proof step that bootstraps Theorem 3 (a Fourier-domain sum over N components) to time-domain pairwise orthogonality for each pair.",
    "For Theorem 1 in a generic Banach space, which selection of the normalized duality map J: X → 2^{X*} must be used for the iff to hold—all admissible selections, or a specific one—and how does the result behave at points where the norm is not Gateaux differentiable?",
    "What stopping tolerance, initial vector, and right-hand side were used for the PCG experiments in Tables 1-2, and how were the singular or indefinite cases (marked '#') detected and handled?",
    "How does the 'weak inner product' orthogonality of Definition 1 relate to Birkhoff-James orthogonality in the same Banach space—are they equivalent, and if not, which is strictly coarser?",
    "Is the 'optimal p' heuristic of Remark 5 stable across a broader (α,β,γ) sweep beyond the two parameter triples in Tables 1-2, and are there regimes where smaller p does not minimize PCG iterations?"
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "Theorem 2 is a pairwise statement: ||f+g||_1 = ||f||_1 + ||g||_1 iff f ⊥_{L^1} g. The FIF decomposition involves m + 1 components (s = Σ IMF_k + r), and Theorem 3 gives E_1(s) = Σ E_1(IMF_k) + E_1(r), i.e. ||\\hat s||_1 = Σ ||\\widehat{IMF}_k||_1. To deduce pairwise orthogonality from a multi-term L^1 additivity one must (a) bootstrap the pairwise iff to N terms (which requires nonnegativity-style arguments, since ||·||_1 only satisfies a triangle inequality), and (b) cope with the fact that energy conservation is stated on the Fourier-side L^1 norm (||\\hat s||_1) while the orthogonality definition (Def. 4 / Theorem 2) is in the time-domain L^1. The paper does not address the Fourier-vs-time discrepancy nor the N-term extension; the one-line 'direct consequence' justification is incomplete.",
      "id": "weakness-1",
      "locator": "Examples / Signal Processing, Theorem 4",
      "required_update": "Either (i) restate Theorem 4 explicitly as Fourier-domain L^1 orthogonality of the \\widehat{IMF}_k (using Theorem 2 applied to the transforms), and provide the N-term induction relying on the no-unwanted-oscillation Theorem 3 condition Σ_k |\\widehat{φ}_k(ξ)| = |\\hat s(ξ)| pointwise; or (ii) provide a separate result establishing time-domain L^1 orthogonality. Ship a formal proof at src/proofs/IMFOrthogonalityL1.lean and a numerical sanity check at experiments/imf_l1_orthogonality.py exercising both pairwise and aggregate orthogonality.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Examples / Signal Processing, Theorem 4` is corrected or justified.",
      "weakness_index": 0
    },
    {
      "evidence": "Algebraically, expanding 0 = (1/2) ∫ [f((f+g)* - f*) + g((f+g)* - g*)] dx and rearranging directly yields ∫(f+g)(f+g)* = ∫ f f* + ∫ g g*, so the equivalence is essentially a tautology of the chosen 'weak inner product' definition. However, in a generic Banach space the duality mapping is in general multivalued (e.g. at points where the norm is not Gateaux differentiable), so f*, g*, (f+g)* are not canonically determined, and the theorem's statement does not specify which dual elements must be used or whether orthogonality should hold for all admissible selections or some. No formal proof is provided, and the dependence on the choice of duality map is not analyzed.",
      "id": "weakness-2",
      "locator": "Main results, Theorem 1, eq:pytha_X",
      "required_update": "State the duality selection convention explicitly (e.g. via the normalized duality mapping J: X → 2^{X*}), formalize Theorem 1 as a one-line algebraic identity, and discuss the multivalued case. Provide a machine-checkable proof of the iff in src/proofs/PythagoreanBanach.lean (or .v / .agda).",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Main results, Theorem 1, eq:pytha_X` is corrected or justified.",
      "weakness_index": 1
    },
    {
      "evidence": "The preconditioning tables specify n, p, and selected alpha/beta/gamma cases, but omit the right-hand side, initialization, PCG stopping tolerance, precision, implementation details, and handling of singular or indefinite preconditioners, making exact iteration counts hard to reproduce.",
      "id": "weakness-3",
      "locator": "evaluation and statistical-testing pipeline",
      "required_update": "Publish evaluation scripts or executable pseudocode for walk-forward retraining, validation selection, HAC/bootstrap settings, benchmark construction, and table regeneration.",
      "source_path": "HAC/bootstrap",
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "code",
      "verification_check": "Re-review should confirm the evaluation pipeline can reproduce the reported statistical tests and benchmarks.",
      "weakness_index": 2
    },
    {
      "evidence": "The paper gives only a general FIF algorithm URL and does not provide paper-specific scripts, a repository, license, commit, or release for regenerating the figures, energy checks, or preconditioning tables.",
      "id": "weakness-4",
      "locator": "code release and execution entrypoints",
      "required_update": "Release the source code, scripts, model configuration, and execution entrypoints needed to regenerate the reported tables, or document why those artifacts cannot be released.",
      "source_path": "Lean/Coq/Agda",
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "code",
      "verification_check": "Re-review should confirm runnable code or a documented non-release justification is present.",
      "weakness_index": 3
    },
    {
      "evidence": "The text restates Definition 3 with the canonical L^p–L^q duality. The duality mapping in L^p is single-valued and equals J(f)(x) = |f(x)|^{p-1} sign(f(x)) · ||f||_p^{2-p}; with that choice the statement is a special case of Theorem 1. However, the paper neither specifies the choice of f*, g*, (f+g)* (e.g. via J or unnormalized as |f|^{p-1} sign f) nor verifies a Pythagorean identity analogous to ||f+g||_p^p = ||f||_p^p + ||g||_p^p; in fact such a p-power identity does not generally hold for p ≠ 1, 2, so the 'L^p Pythagorean theorem' advertised in the abstract is only the implicit equality ∫(f+g)(f+g)* = ∫ f f* + ∫ g g*, which is not the standard L^p Pythagorean statement and may be misleading.",
      "id": "weakness-5",
      "locator": "Main results / Special cases / L^p spaces, eq:InnerProd",
      "required_update": "Make the duality selection explicit, exhibit the closed-form equality the orthogonality implies in L^p (it is NOT ||f+g||_p^p = ||f||_p^p + ||g||_p^p), and tone down the abstract to reflect that the L^p version is only the dual-pairing identity.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Main results / Special cases / L^p spaces, eq:InnerProd` is corrected or justified.",
      "weakness_index": 4
    },
    {
      "evidence": "The paper proposes a new definition for orthogonality in Banach spaces but does not mention the most standard existing definition in this field, Birkhoff-James orthogonality, which is fundamental to any discussion of non-Hilbert orthogonality.",
      "id": "weakness-6",
      "locator": "Birkhoff, G. (1935). Orthogonality in normed linear spaces. Transactions of the American Mathematical Society.",
      "required_update": "Add a bibliography entry for `Birkhoff, G. (1935). Orthogonality in normed linear spaces. Transactions of the American Mathematical Society` and cite it where the affected method or claim is introduced, or explicitly justify its omission.",
      "source_path": null,
      "source_role": "citation",
      "status": "open",
      "target_kind": "bibliography",
      "verification_check": "Re-review should confirm the bibliography and citation context address this reference.",
      "weakness_index": 5
    }
  ],
  "strengths": [
    "The weak inner product framework reduces correctly to the classical L^2 inner product (C2, supported), providing validated theoretical foundations for the generalization.",
    "The L^1 Pythagorean theorem (Theorem 2, C3, supported) is an algebraically rigorous result that cleanly characterizes L^1 orthogonality and directly motivates the signal processing application.",
    "The closed-form l^p circulant minimizer (C6, supported) and its eigenvalue formula (C7, supported) are explicit, verifiable contributions to the Toeplitz preconditioning literature.",
    "The paper bridges non-stationary signal decomposition and structured linear algebra under a single geometric framework, a combination absent from the cited prior art.",
    "Citation hygiene is strong for the iterative filtering (Cicone 2021, 2024), GLT (GLT-bookI/IV), and classical preconditioning (CN-Sirev, Ng 2004) literature, and the distinction from Lumer's semi-inner product is explicitly acknowledged."
  ],
  "summary": "The paper develops a dual-space weak inner product for general Banach spaces, recovering the classical L^2 inner product as a special case, and applies the resulting generalized Pythagorean theorem to two domains: L^1 orthogonality of FIF intrinsic mode functions (IMFs) and l^p-norm circulant preconditioning of Toeplitz linear systems. The novelty is genuine (novelty specialist verdict: significant, score 0.65) and the dual-track application structure is distinctive relative to the prior semi-inner product literature (Lumer 1961). However, three major correctness gaps and a reproducibility score of 0.38 preclude acceptance without revision. The most critical gap, flagged independently by technical_correctness (C5, major, unsupported) and reproducibility (area 'other', major), concerns Theorem 4: the claim that FIF IMFs are pairwise orthogonal in the L^1 sense is unjustified because Theorem 3 is a Fourier-domain L^1 energy-conservation result whereas Theorem 2 is a time-domain pairwise statement; bridging them requires an N-term extension of the pairwise iff and a Fourier-versus-time domain reconciliation, neither of which is provided. Theorem 1 in generic Banach spaces leaves the duality selection implicit (C1, major), rendering the formulation ill-posed when the duality map is multivalued. The empirical PCG iteration counts in Tables 1-2 (C10, major) are unreproducible: no code, tolerance, initialization, or right-hand side is supplied and the conclusion rests on only two parameter triples. The field (math.*) falls within the code-amenable set; absent proof artifacts and experiment scripts constitute load-bearing gaps under the recommendation gate, defaulting the recommendation to major_revision.",
  "weaknesses": [
    "Theorem 4 (IMF pairwise L^1 orthogonality) is unsupported: the proof conflates Fourier-domain L^1 energy conservation (Theorem 3) with time-domain L^1 pairwise orthogonality (Theorem 2), without providing the N-term extension of the pairwise iff or the domain reconciliation required to bridge them (C5, major, unsupported).",
    "Theorem 1 (Generalized Pythagorean Theorem) does not specify the duality selection convention in generic Banach spaces, leaving the result ill-posed when the normalized duality map J: X → 2^{X*} is multivalued at non-smooth points of the norm (C1, major, partially_supported).",
    "The empirical PCG iteration counts in Tables 1-2 are unreproducible: no experiment code, stopping tolerance, initial guess, right-hand side, or handling of singular cases is provided, and the 'lower p is better' conclusion rests on only two (α,β,γ) parameter triples (C10, major, unsupported).",
    "No proof artifacts (Lean/Coq/Agda for Theorems 1-4) or paper-specific experiment scripts are deposited, yielding a reproducibility score of 0.38 and leaving all headline claims unverifiable by code (reproducibility specialist, four major concerns).",
    "The abstract's claim of an 'L^p Pythagorean theorem' is misleading: the result is a dual-pairing identity, not the norm-power equality ||f+g||_p^p = ||f||_p^p + ||g||_p^p that the phrase connotes, and the framing requires correction (C4, minor).",
    "The bibliography omits canonical Banach-space orthogonality references (Birkhoff 1935, James 1947, Dragomir 2004), making it impossible to assess whether the proposed orthogonality coincides with or strictly extends Birkhoff-James orthogonality."
  ]
}
```

### novelty (`gemini-3-flash-preview`) — status: `pass`

```json
{
  "confidence": 0.85,
  "missing_prior_art": [],
  "novelty_score": 0.65,
  "related_work": [
    {
      "citation_key": "cicone2021numerical",
      "delta": "This paper uses the FIF algorithm as a primary application case to demonstrate L1 energy conservation and uses it to justify the new definition of Banach space orthogonality.",
      "relation": "builds_on",
      "title": "Numerical analysis of the Fast Iterative Filtering algorithm"
    },
    {
      "citation_key": "cicone2024new",
      "delta": "While the previous work defined L1 Fourier energy conservation, this paper provides the theoretical grounding by defining a weak inner product and a generalized Pythagorean theorem in Banach spaces to explain that conservation as a form of orthogonality.",
      "relation": "builds_on",
      "title": "A new definition of energy for non-stationary signals"
    },
    {
      "citation_key": "lumer1961semi",
      "delta": "The authors distinguish their 'weak inner product' from Lumer's semi-inner product, noting that theirs does not necessarily induce the norm but allows for a Pythagorean theorem that matches the L1 norm's behavior.",
      "relation": "prior_art",
      "title": "Semi-inner-product spaces"
    },
    {
      "citation_key": "Ng_book",
      "delta": "Extends the classical Frobenius (L2) optimal circulant preconditioning to a general Lp framework, showing that p-norm minimizers can outperform the standard L2 approach.",
      "relation": "builds_on",
      "title": "Iterative Methods for Toeplitz Systems"
    },
    {
      "citation_key": "axler1997numerical",
      "delta": "Contrasts the operator-based angle definitions with the element-wise weak inner product proposed for general Banach spaces.",
      "relation": "prior_art",
      "title": "The numerical range of an operator"
    }
  ],
  "verdict": "significant"
}
```

### reproducibility (`gpt-5.5`) — status: `pass`

```json
{
  "code_availability": "unspecified",
  "code_url": "www.cicone.com",
  "concerns": [
    {
      "area": "code",
      "description": "The paper gives only a general FIF algorithm URL and does not provide paper-specific scripts, a repository, license, commit, or release for regenerating the figures, energy checks, or preconditioning tables.",
      "severity": "major"
    },
    {
      "area": "hyperparameters",
      "description": "The signal-processing example specifies the test signal and two FIF parameter pairs, but omits the sampling size, filter construction, delta/stopping criteria, numerical tolerances, and exact settings needed to reproduce the plotted decompositions and machine-precision energy conservation.",
      "severity": "major"
    },
    {
      "area": "evaluation",
      "description": "The preconditioning tables specify n, p, and selected alpha/beta/gamma cases, but omit the right-hand side, initialization, PCG stopping tolerance, precision, implementation details, and handling of singular or indefinite preconditioners, making exact iteration counts hard to reproduce.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "The load-bearing mathematical claims are not accompanied by formal proof artifacts; files such as proofs/generalized_pythagorean.lean and proofs/fif_l1_orthogonality.lean would close this proof-as-code gap for the generalized Pythagorean theorem and FIF L1 orthogonality result.",
      "severity": "major"
    },
    {
      "area": "data",
      "description": "The experiments appear to use synthetic signals and generated Toeplitz systems, but no generated arrays, IMF outputs, or figure/table source data are deposited for exact comparison.",
      "severity": "minor"
    }
  ],
  "confidence": 0.82,
  "data_availability": "synthetic",
  "data_url": null,
  "environment": {
    "dependencies": [
      "FIF algorithm"
    ],
    "hardware": null,
    "software": "Matlab, Python, and C implementations of the FIF algorithm are mentioned; no versions or numerical linear algebra stack are specified."
  },
  "reproducibility_score": 0.38
}
```

### summary (`claude-haiku-4-5-20251001`) — status: `pass`

```json
{
  "audience": "Mathematicians in functional analysis and Banach space theory; signal processing researchers using intrinsic mode decomposition; numerical linear algebra specialists working on matrix approximation and preconditioning; applied mathematicians bridging theoretical analysis and computational methods.",
  "key_contributions": [
    "Generalization of angles, orthogonality, and the Pythagorean theorem from L^2 spaces to generic Banach spaces via a weak inner product formulation",
    "Definition of weak inner product for Banach spaces using dual spaces to enable angle and orthogonality definitions",
    "Theoretical analysis showing that intrinsic mode functions from Fast Iterative Filtering are orthogonal in the L^1 sense",
    "Design of new classes of l^p-norm circulant preconditioners for Toeplitz linear systems inspired by the generalized Pythagorean theorem",
    "Numerical experiments demonstrating the effectiveness of l^p preconditioners for ill-conditioned Toeplitz matrices"
  ],
  "plain_language_summary": "In standard mathematics, concepts like angles, orthogonality (perpendicularity), and the Pythagorean theorem are well-defined in Hilbert spaces, the natural setting for much of physics and engineering. This paper extends these intuitive geometric concepts to more general Banach spaces, which arise naturally in signal processing and numerical analysis. The motivation comes from observing that when certain signal decomposition algorithms (FIF) process non-stationary signals, they conserve energy in the L^1 norm rather than the familiar L^2 norm. The authors develop a framework based on a \"weak inner product\" defined using dual spaces, which allows them to define angles and orthogonality in any Banach space. They then show that intrinsic mode functions from signal processing are orthogonal with respect to this new L^1 definition. Additionally, they apply these ideas to design new preconditioners for efficiently solving large, structured linear systems that arise in scientific computing.",
  "tldr": "The paper generalizes classical notions of angles, orthogonality, and the Pythagorean theorem from Hilbert spaces to arbitrary Banach spaces, with applications to signal decomposition and preconditioning of structured linear systems."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `pass`

```json
{
  "claims": [
    {
      "assessment": "partially_supported",
      "claim": "Generalized Pythagorean Theorem (Theorem 1): For f,g in a Banach space X with chosen duality elements f*, g*, (f+g)* in X*, f and g are orthogonal in the X-sense (weak inner product equals zero) if and only if ∫(f+g)(f+g)* dx = ∫ f f* dx + ∫ g g* dx.",
      "evidence": "Algebraically, expanding 0 = (1/2) ∫ [f((f+g)* - f*) + g((f+g)* - g*)] dx and rearranging directly yields ∫(f+g)(f+g)* = ∫ f f* + ∫ g g*, so the equivalence is essentially a tautology of the chosen 'weak inner product' definition. However, in a generic Banach space the duality mapping is in general multivalued (e.g. at points where the norm is not Gateaux differentiable), so f*, g*, (f+g)* are not canonically determined, and the theorem's statement does not specify which dual elements must be used or whether orthogonality should hold for all admissible selections or some. No formal proof is provided, and the dependence on the choice of duality map is not analyzed.",
      "id": "C1",
      "location": "Main results, Theorem 1, eq:pytha_X",
      "severity": "major",
      "suggested_fix": "State the duality selection convention explicitly (e.g. via the normalized duality mapping J: X → 2^{X*}), formalize Theorem 1 as a one-line algebraic identity, and discuss the multivalued case. Provide a machine-checkable proof of the iff in src/proofs/PythagoreanBanach.lean (or .v / .agda)."
    },
    {
      "assessment": "supported",
      "claim": "Hilbert special case: when X = L^2, the weak inner product of Definition 1 coincides with the classical L^2 inner product (and induces the 2-norm), justified by the factor 1/2.",
      "evidence": "In L^2 the Riesz representation gives f* = f, g* = g, (f+g)* = f+g. Substituting into eq:Inner_X yields (1/2) ∫ [f((f+g) - f) + g((f+g) - g)] dx = (1/2) ∫ [fg + gf] dx = ∫ fg dx, exactly the standard L^2 inner product. The induced norm is therefore the L^2 norm.",
      "id": "C2",
      "location": "Main results / Special cases / Hilbert space",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "L^1 Pythagorean theorem (Theorem 2): f, g ∈ L^1 are orthogonal in the L^1 sense (Def. 4 / Cor. 1) iff ||f+g||_1 = ||f||_1 + ||g||_1.",
      "evidence": "The L^1 weak inner product (eq:Inner_L1) expands to (1/2)[∫(f+g) sign(f+g) dx − ∫ f sign(f) dx − ∫ g sign(g) dx] = (1/2)(||f+g||_1 − ||f||_1 − ||g||_1) (using x·sign(x) = |x| a.e. and sign(0) being arbitrary on a measure-zero set when f or g vanishes). Setting this to zero recovers exactly the equality ||f+g||_1 = ||f||_1 + ||g||_1. The iff is algebraic.",
      "id": "C3",
      "location": "Main results / Special cases / L^1 space, Theorem 2, eq:pytha_L1",
      "severity": "info",
      "suggested_fix": "For completeness, briefly address the measure-zero ambiguity of sign(0) when f or g vanishes on a positive-measure set (any consistent selection of sign(0) ∈ [-1,1] preserves x·sign(x) = |x|)."
    },
    {
      "assessment": "partially_supported",
      "claim": "L^p special case (1 < p < ∞): With duality partners in L^q (1/p + 1/q = 1), the weak inner product (eq:InnerProd) vanishing characterizes 'L^p-orthogonality' between f and g.",
      "evidence": "The text restates Definition 3 with the canonical L^p–L^q duality. The duality mapping in L^p is single-valued and equals J(f)(x) = |f(x)|^{p-1} sign(f(x)) · ||f||_p^{2-p}; with that choice the statement is a special case of Theorem 1. However, the paper neither specifies the choice of f*, g*, (f+g)* (e.g. via J or unnormalized as |f|^{p-1} sign f) nor verifies a Pythagorean identity analogous to ||f+g||_p^p = ||f||_p^p + ||g||_p^p; in fact such a p-power identity does not generally hold for p ≠ 1, 2, so the 'L^p Pythagorean theorem' advertised in the abstract is only the implicit equality ∫(f+g)(f+g)* = ∫ f f* + ∫ g g*, which is not the standard L^p Pythagorean statement and may be misleading.",
      "id": "C4",
      "location": "Main results / Special cases / L^p spaces, eq:InnerProd",
      "severity": "minor",
      "suggested_fix": "Make the duality selection explicit, exhibit the closed-form equality the orthogonality implies in L^p (it is NOT ||f+g||_p^p = ||f||_p^p + ||g||_p^p), and tone down the abstract to reflect that the L^p version is only the dual-pairing identity."
    },
    {
      "assessment": "unsupported",
      "claim": "Theorem 4 (IMF orthogonality): IMFs produced by FIF with a double convolution filter are pairwise orthogonal in the L^1 sense, as a direct consequence of Theorem 3 (L^1 Fourier energy conservation) and Theorem 2 (L^1 Pythagorean theorem).",
      "evidence": "Theorem 2 is a pairwise statement: ||f+g||_1 = ||f||_1 + ||g||_1 iff f ⊥_{L^1} g. The FIF decomposition involves m + 1 components (s = Σ IMF_k + r), and Theorem 3 gives E_1(s) = Σ E_1(IMF_k) + E_1(r), i.e. ||\\hat s||_1 = Σ ||\\widehat{IMF}_k||_1. To deduce pairwise orthogonality from a multi-term L^1 additivity one must (a) bootstrap the pairwise iff to N terms (which requires nonnegativity-style arguments, since ||·||_1 only satisfies a triangle inequality), and (b) cope with the fact that energy conservation is stated on the Fourier-side L^1 norm (||\\hat s||_1) while the orthogonality definition (Def. 4 / Theorem 2) is in the time-domain L^1. The paper does not address the Fourier-vs-time discrepancy nor the N-term extension; the one-line 'direct consequence' justification is incomplete.",
      "id": "C5",
      "location": "Examples / Signal Processing, Theorem 4",
      "severity": "major",
      "suggested_fix": "Either (i) restate Theorem 4 explicitly as Fourier-domain L^1 orthogonality of the \\widehat{IMF}_k (using Theorem 2 applied to the transforms), and provide the N-term induction relying on the no-unwanted-oscillation Theorem 3 condition Σ_k |\\widehat{φ}_k(ξ)| = |\\hat s(ξ)| pointwise; or (ii) provide a separate result establishing time-domain L^1 orthogonality. Ship a formal proof at src/proofs/IMFOrthogonalityL1.lean and a numerical sanity check at experiments/imf_l1_orthogonality.py exercising both pairwise and aggregate orthogonality."
    },
    {
      "assessment": "supported",
      "claim": "Closed-form l^p circulant minimizer: For T_n(f_{α,β,γ}) the entries of the first column c^{(p)} of the optimal circulant in l^p norm satisfy c_0 = φ, c_1 = c_{n-1} = ψ(n-1)^{1/(p-1)} / (1 + (n-1)^{1/(p-1)}), c_2 = c_{n-2} = γ / (1 + (2/(n-2))^{1/(p-1)}) for p > 1, and the obvious limits at p = 1.",
      "evidence": "Each row of the residual T_n(f) − C_n has a fixed structure with (n − 1) copies of (ψ − c_1) and 1 copy of c_1 (etc.), so the l^p minimization decouples per diagonal into scalar problems min_c (n−k)|coeff − c|^p + k|c|^p, with k = 1 for c_1 and k = 2 for c_2. Differentiating yields (n−k)(coeff − c)^{p−1} = k c^{p−1} for the relevant sign regime, which solves to the stated rational expression. The p = 1 limit (c_1 = ψ, c_2 = γ) follows from convexity of |·|, the optimum sitting at the larger-mass endpoint.",
      "id": "C6",
      "location": "Examples / Numerical Linear Algebra / l^p circulant minimizers for Toeplitz matrices",
      "severity": "info",
      "suggested_fix": "Add one explicit derivation line showing the per-diagonal decoupling, and explicitly note the regime check (coeff and c same sign; (n−k) > 0) so readers can verify the algebra without rediscovering it. A short reproducible numerical check at experiments/circulant_minimizer_closed_form.py would make the closed form trivially verifiable."
    },
    {
      "assessment": "supported",
      "claim": "Eigenvalue formula for C_n^{(p)}(f) (eq:spett_C): λ_j(C_n^{(p)}(f)) = f_{α,β,γ}(θ_j) + 2(c_1^{(p)} − ψ) cos(θ_j) + 2(c_2^{(p)} − γ) cos(2 θ_j) with θ_j^{(n)} = 2π(j − 1)/n.",
      "evidence": "Using f_{α,β,γ}(θ) = φ + ψ(e^{iθ} + e^{-iθ}) + γ(e^{2iθ} + e^{-2iθ}) = φ + 2ψ cos(θ) + 2γ cos(2θ), and the standard circulant eigenvalue formula λ_j = c_0 + 2 c_1 cos(θ_j) + 2 c_2 cos(2 θ_j) (real symmetric circulant with only positions 0, 1, 2, n-2, n-1 nonzero), one immediately gets f(θ_j) + 2(c_1 − ψ) cos(θ_j) + 2(c_2 − γ) cos(2 θ_j) = c_0 + 2 c_1 cos(θ_j) + 2 c_2 cos(2 θ_j), which matches.",
      "id": "C7",
      "location": "Examples / Numerical Linear Algebra / Preconditioner section, eq:spett_C",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Clustering to 1: under the standing assumption that C_n^{(p)}(f) is positive definite (up to a small/low-norm correction), the spectrum {λ_j(C_n^{(p),-1}(f) T_n(f))} clusters to 1 as n → ∞, yielding fast PCG convergence.",
      "evidence": "The argument leans on (i) standard Korovkin/Strang/Chan-style clustering results invoked by reference (CN-Sirev, Koro1, GLT-bookI) and (ii) the observation that c_1^{(p)} → ψ and c_2^{(p)} → γ as n → ∞, so C_n^{(p)} approaches the natural circulant interpolant whose spectrum approximates f(θ_j). The rate at which c_1^{(p)}, c_2^{(p)} converge is O(n^{-1/(p-1)}) and is not analyzed; the small-rank-plus-low-norm decomposition is stated without explicit bounds or constants, and the dependence on p (acknowledged as 'cannot be easily studied') is left to numerics. The conclusion is consistent with the cited theory but is not derived rigorously in this paper.",
      "id": "C8",
      "location": "Examples / Numerical Linear Algebra / Preconditioner section (paragraph following eq:spett_C)",
      "severity": "minor",
      "suggested_fix": "Quantify ||C_n^{(p)} − C_n^{(natural)}||_2 (or its operator-norm proxy) as O(n^{-1/(p-1)}) and feed that into the standard clustering theorem to obtain an explicit p-dependent clustering statement. Provide a reproducible spectrum plot at experiments/preconditioned_spectrum.py confirming clustering for representative (p, n, α, β, γ)."
    },
    {
      "assessment": "partially_supported",
      "claim": "Heuristic remark (Remark 5): the most effective p-norm circulant preconditioner is C_n^{(\\tilde p)} where \\tilde p is the smallest p ≥ 1 such that |Im(λ_j(C_n^{(p),-1} T_n))| < ε for all j; equivalently, positive definiteness of C_n^{(p)} implies a purely real positive spectrum of the preconditioned matrix.",
      "evidence": "For T_n real symmetric and C_n^{(p)} real symmetric positive definite, the products C_n^{(p),-1} T_n is similar to the symmetric matrix C_n^{(p),-1/2} T_n C_n^{(p),-1/2} and therefore has a real spectrum; that part follows from standard linear algebra. The 'minimal p with all-real-positive spectrum is optimal' statement, however, is labelled 'heuristic' and is supported only by Tables 1–2 with limited (α, β, γ, n) combinations and no theoretical justification. Whether \\tilde p minimizes PCG iterations across the parameter space is unproven.",
      "id": "C9",
      "location": "Examples / Numerical Linear Algebra / Remark 5",
      "severity": "minor",
      "suggested_fix": "Reclassify Remark 5 as a conjecture, add a broader experimental sweep over (α, β, γ, p, n) with reproducible code at experiments/optimal_p_sweep.py, and report failure cases. If possible, prove monotonicity of iteration count in |Im(λ_j)| under PCG."
    },
    {
      "assessment": "unsupported",
      "claim": "Empirical iteration counts (Tables 1 and 2) demonstrate that smaller p yields better PCG convergence on the well-conditioned (α,β,γ) = (1,2,3) case (best at p = 1, 3 iterations) and on the ill-conditioned (0,2,8) case (best at p = 1.6).",
      "evidence": "The paper reports iteration counts for a single function family f_{α,β,γ} on two parameter triples and several n, but does not ship the code, the PCG stopping tolerance, the initial guess, the right-hand side, or how singular cases ('#') were detected. The claim that 'lower p is better' is drawn from a small grid (p ∈ {1, 1.4, 1.6, 1.8, 3, 5, 10}). The deeper experimentation is deferred to reference [@beyond], which the reader cannot inspect here. Field math.GM falls under the proof-as-code amenable list, so the absence of an executable artifact is itself a weakness for an empirical claim.",
      "id": "C10",
      "location": "Examples / Numerical Linear Algebra / Tables 1–2",
      "severity": "major",
      "suggested_fix": "Publish a reproducible script at experiments/pcg_iterations/run.py (with seeds, tolerance 1e-8 or stated value, MATLAB/Python code, requirements.txt) that regenerates Tables 1 and 2, and link it explicitly from the paper. Expand the (α, β, γ) sweep so the 'lower p is better' claim is supported beyond two anecdotal points."
    },
    {
      "assessment": "partially_supported",
      "claim": "For p ∈ (0, 1) the functional in eq:lp-norm is not a norm (the unit ball is not convex), but the minimization can still be considered and may yield computationally effective preconditioners.",
      "evidence": "It is correct that for 0 < p < 1 the functional fails the triangle inequality and the level sets are non-convex; this is standard. The hopeful tone about effectiveness is speculative — the per-diagonal scalar problem min_c (n − k) |coeff − c|^p + k |c|^p is non-convex for p < 1 and may have multiple local minima, which the paper does not address.",
      "id": "C11",
      "location": "Examples / Numerical Linear Algebra / Remark 5 (final paragraph)",
      "severity": "info",
      "suggested_fix": "Acknowledge the non-convexity of the per-diagonal problem for p < 1 and either provide a global-minimum closed form (it exists in the scalar case via comparison of endpoints and a single interior critical point) or flag the algorithmic challenge. A numerical experiment at experiments/lp_subunit_minimizer.py would substantiate the conjecture."
    },
    {
      "assessment": "supported",
      "claim": "Conditioning behavior of T_n(f_{α,β,γ}): for α > 0 the Euclidean condition number converges to (α + 4β + 16γ)/α; for α = 0, β > 0 it grows like Θ(n^2); for α = β = 0, γ > 0 it grows like Θ(n^4).",
      "evidence": "f_{α,β,γ}(θ) = α + β(2 − 2 cos θ) + γ(2 − 2 cos θ)^2 ≥ 0, vanishes only at θ = 0, and near θ = 0 satisfies f(θ) ~ β θ^2 + γ θ^4 / 4 (the order of the zero is 2 if β > 0, 4 if β = 0 < γ). Standard spectral extremal results for Toeplitz matrices generated by nonnegative even trigonometric polynomials [@extreme1, @extreme2, GLT-bookI] then give λ_min(T_n(f)) → min f = α with rate Θ(n^{-2}) when the zero is order 2 and Θ(n^{-4}) when the zero is order 4, and λ_max → max f = α + 4β + 16γ. Dividing yields the claimed rates.",
      "id": "C12",
      "location": "Examples / Numerical Linear Algebra / Preconditioner section (paragraph after eq:def_f_1)",
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

1. Bhatia
2. CN-Sirev
3. GLT-bookI
4. GLT-bookIV
5. Koro1
6. Longo2025AdaptiveSL
7. Ng_book
8. Van_Loan
9. axler1997numerical
10. beyond
11. cicone2021numerical
12. cicone2022multivariate
13. cicone2024new
14. extreme1
15. extreme2
16. gustafson1968angle
17. huang1998empirical
18. imag1
19. imag2
20. lin2009iterative
21. lumer1961semi
22. sparse_appr1
23. sparse_appr2
24. spogli2025investigating

