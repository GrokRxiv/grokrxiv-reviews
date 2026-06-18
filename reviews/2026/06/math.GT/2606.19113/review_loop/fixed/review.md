# Maximal universal invariants from quantum traces on finite quotients of Verma modules

GrokRxiv review of [arXiv:2606.19113](https://arxiv.org/abs/2606.19113) · `math.GT`

_Authors_: Cristina Ana-Maria Anghel, Jun Murakami

## TL;DR

This paper introduces level N universal quantum knot invariants constructed via quantum traces on finite quotients of Verma modules over a two-variable ring, with the headline results being: (i) for prime N the invariant is the unique maximal knot invariant arising from the N-dimensional Verma quotient (Theorem 8/Corollary 9); (ii) an explicit interpolation formula (Theorem 10) recovers both the colored Jones and ADO polynomials as specialisations; and (iii) for composite N the invariant may encode information beyond the union of Jones and ADO sequences at divisors. The novelty specialist rates the contribution as significant (0.80) with high confidence, and the citation specialist confirms comprehensive bibliographic coverage. However, the technical correctness specialist (confidence 0.62, overall_correctness mostly_sound) identifies four major gaps: the maximality direction of Corollary 9/35 is asserted but never proved (C1); the proof of the interpolation formula in Theorem 39 contains transcription errors that prevent algebraic type-checking (C2); the non-prime 'extra information' claim in Theorem 8/Remark 11 is presented as a theorem but is in fact an unsubstantiated conjecture (C5); and the ideal-coincidence proof in Proposition 20 and its appendix lemmas contains an unresolved gap in the cyclotomic substitution argument (C4). The reproducibility specialist (score 0.34, confidence 0.86) flags a critical concern: the headline maximal-universal-invariant claim in Theorem 8 lacks any machine-checkable proof artifact. Because the paper lies in math.GT/math.QA (a code-amenable field) and a critical proof-as-code artifact is absent for a headline claim, the recommendation gate defaults to major_revision. The interpolation-formula typos (C2) and the missing necessity argument for maximality (C1) are the most urgent issues. If C5 cannot be converted into a proved theorem with a computational witness, the abstract must be corrected to describe it as a conjecture. All specialists agree the core algebraic machinery is well-motivated and correctly set up; the deficiencies are correctable revisions, not fundamental flaws in the framework.

_Recommendation_: **Major revision** · _Confidence_: 78%

## Strengths

- The construction of a two-variable universal invariant that interpolates between colored Jones and ADO polynomials within a single algebraic object is a genuinely novel unification, advancing a programme that previously required separate algebraic treatments for each family.
- The proof that the level N invariant is maximal for prime N (Corollary 9/35) establishes algebraic optimality in a precise sense, providing a strong foundational justification for the construction.
- The R-matrix descent argument (Proposition 26) is fully verified, correctly identifying the generators of the ideal C_N as exactly the obstructions to descending the Verma-module R-matrix action to the quotient module.
- The bibliography is comprehensive and appropriately prioritises foundational sources (Reshetikhin-Turaev, Witten, Kashaev) alongside the first author's directly relevant prior programme, with no significant missing prior art identified.
- The explicit interpolation formula in Theorem 10 provides a concrete CRT-style decomposition of the universal invariant into its two specialisations, which, once the proof is corrected, constitutes a directly usable computational recipe.

## Weaknesses

- The necessity direction of the maximality claim in Corollary 9/35 — that any quotient ring in which Ω_N is a knot invariant must factor through L_N — is stated but not proved; the appendix establishes only ideal coincidences C_N = J_N = I_N, not the required converse implication from invariance to ideal containment.
- The proof of the interpolation formula in Theorem 39 contains multiple transcription errors (φ_N(q) in place of φ_N(q^2), the factor '(s − 1^{1-N})' instead of '(s − q^{1-N})', and a silently absorbed φ_N(q^2) factor on Ω_N^J) that prevent the displayed chain of equalities from type-checking in L_N.
- The claim that Ω̃_N carries strictly more information than the sequence {J_d, Φ_d : d|N} for composite N (Theorem 8/Remark 11) is not supported by any theorem, example, or computation; the hedged language in the text signals it is conjectural, but the abstract presents it as a result.
- The ideal-coincidence proof (Proposition 20 and Appendix Lemmas 40–45) contains a gap at Step II where the φ_N(q^2) factor in J̃_N is not recovered from the cyclotomic substitution, and Lemma 42's product identity is justified only by informal coefficient-matching without the required q^{2d} ≡ 1 substitution carried through each factor.
- No computational verification artifacts are provided for any of the load-bearing identities; the paper is in math.GT/math.QA and the identities are mechanically checkable at small N on standard test knots, making the absence a substantive gap rather than a stylistic choice — the noted typos in C2, C3, and C8 are exactly the kind of errors a CAS check would have caught.
- The headline maximal-universal-invariant result (Theorem 8) lacks any machine-checkable proof artifact — no formal proof file, no executable computation — constituting a critical reproducibility gap for a code-amenable field.

## Revision Targets

- [ ] **Manuscript: Corollary 9 (sec. introduction), Corollary 35 (sec. 'Level N unified invariant')**
  - Location: `Corollary 9 (sec. introduction), Corollary 35 (sec. 'Level N unified invariant')`
  - Evidence: The body proves the 'invariance' direction by showing the R-matrix preserves <v_0,...,v_{N-1}>^{⊗2} modulo C_N (Proposition 26). However the maximality direction — that any quotient L' in which Ω_N is a knot invariant factors through L_N — is asserted but never proved explicitly: the appendix only proves the ideal coincidences C_N = J_N = I_N, not that *any other* quotient destroying these relations would also destroy invariance. The argument that smaller ideals are insufficient is left implicit.
  - Required change: Add an explicit lemma showing necessity: assume Ω_N is a knot invariant over L/I' for some ideal I' ⊊ I_N (resp. ⊊ Ĩ_N), and derive that I' must contain the generators of C_N by examining Markov/Reidemeister-II-type relations on the v_i⊗v_j → v_j⊗v_i terms with i+j ≥ N, or by exhibiting an explicit braid pair whose invariance forces each generator.
  - Verification: Re-review should confirm `Corollary 9 (sec. introduction), Corollary 35 (sec. 'Level N unified invariant')` is corrected or justified.
- [ ] **Manuscript: Theorem 10 (introduction), Theorem 39 (sec. 'Interpolation formula')**
  - Location: `Theorem 10 (introduction), Theorem 39 (sec. 'Interpolation formula')`
  - Evidence: The CRT-style derivation in the proof of Theorem 39 contains transcription errors that obscure the algebra: (i) the displayed equation 'Ω_N^Φ(s,q)·φ_N(q^2) = Ω_N^Φ(q^{1-N},q)·φ_N(q) + Ω_N^J(s,q)' uses φ_N(q) on the RHS where φ_N(q^2) is required for the equation to balance; (ii) the factor '(s − 1^{1-N})' is plainly a typo for (s − q^{1-N}); (iii) the missing multiplication by φ_N(q^2) on Ω_N^J is then silently absorbed. The underlying CRT idea is correct (L_N is by definition Q[q^{±2},s^{±2}]/(φ_N(q^2)) × (s^2 q^{-2(N-1)}-1) factor) but as written the chain of equalities does not type-check.
  - Required change: Rewrite the proof carefully: define Ω_N^Φ via Ω_N − Φ_N = Ω_N^Φ · φ_N(q^2), define Ω_N^J via Ω_N^Φ(s,q) − Ω_N^Φ(q^{1-N},q) = Ω_N^J · (s² q^{-2(N-1)} − 1)/φ_N(q^2)-related factor, and write the final relation as Ω_N = J_N + Φ_N − Φ_N|_{s=q^{1-N}} mod (φ_N(q^2)(s²q^{-2(N-1)}-1)). Also ship a sage/Mathematica notebook computing J_N, Φ_N, Ω_N for the trefoil and figure-eight at N=2,3,4 — see C9.
  - Verification: Re-review should confirm `Theorem 10 (introduction), Theorem 39 (sec. 'Interpolation formula')` is corrected or justified.
- [ ] **Manuscript: Theorem 8 statement; Remark 11 in introduction**
  - Location: `Theorem 8 statement; Remark 11 in introduction`
  - Evidence: The text asserts 'this d-part of the ideal ... has a rich structure which in turn suggests that the invariant itself could encode deeper information than the sequence of coloured Jones and ADO invariants at levels that divide N' (Remark 11). No example, computation, or theorem actually exhibits a knot pair distinguished by Ω̃_N but not by {J_d, Φ_d : d|N}. The hedged language ('suggests', 'could encode') signals the claim is conjectural; the abstract's stronger phrasing 'it could contain more information which is not seen in the sequence' is therefore overstated relative to what is proved.
  - Required change: Either soften the abstract to mark this as a conjecture, or compute Ω̃_4, Ω̃_6 explicitly on representative knots (e.g. (2,5)-torus, 8_19) and exhibit a numerical witness. A companion Mathematica/Sage script (experiments/extra_info_N4.nb) computing Ω̃_4 and comparing against {J_2, Φ_2, J_4, Φ_4} would substantiate the claim.
  - Verification: Re-review should confirm `Theorem 8 statement; Remark 11 in introduction` is corrected or justified.
- [ ] **Manuscript: Lemma 31 and its proof, appendix-like passage following Theorem 29**
  - Location: `Lemma 31 and its proof, appendix-like passage following Theorem 29`
  - Evidence: The proof explicitly verifies M = 0, 1, 2, 3 with carefully written algebraic manipulations and then asserts 'Following an inductive argument, we deduce this property for any natural number M, M ≤ N−2.' No inductive step is written. The four explicit cases each use a non-obvious telescoping with q-binomial coefficients; an inductive formulation is plausible but not given.
  - Required change: Replace the four explicit base cases by a single inductive proof: assume the partial sum at index M equals s^{-M-r-1} q^{f(M,r)} {M choose r}_q ∏_{k=0}^{M-r-1}(sq^{-k-1}-s^{-1}q^{k+1}) and verify the recursion using the q-Pascal rule {M+1 choose r+1}_q = q^{M-r}{M choose r+1}_q + q^{-r-1}{M choose r}_q. Alternatively provide a CAS verification at N ≤ 8.
  - Verification: Re-review should confirm `Lemma 31 and its proof, appendix-like passage following Theorem 29` is corrected or justified.
- [ ] **Manuscript: Whole paper**
  - Location: `Whole paper`
  - Evidence: The paper is in math.GT/math.QA, a code-amenable field under the Proof-as-Code axiom. Every load-bearing identity above can be verified symbolically at small N (N ∈ {2,3,4,5,6}) on a handful of test knots (unknot, trefoil 3_1, figure-eight 4_1, (2,5)-torus, 8_19) using a standard CAS workflow: build the R-matrix in Q[q^{±2},s^{±2}]/Ĩ_N, compute the braid action, take the quantum partial trace, and compare against tabulated J_N and Φ_N. No such artifact is shipped with the paper. Given multiple algebraic typos in the proofs (see C2, C3, C8) and the implicit nature of the maximality argument (C1), the absence of an executable check is a genuine weakness, not a stylistic complaint.
  - Required change: Ship a companion repository, e.g. github.com/anghel-murakami/level-N-universal-invariant, containing: (1) experiments/omega_N.sage computing Ω̃_N(β) for braid β over Q[q^{±2},s^{±2}]/Ĩ_N for N ≤ 6; (2) experiments/test_interpolation.py asserting Ω_N(K) = J_N(K) + Φ_N(K,s) − Φ_N(K,q^{1-N}) on at least the trefoil and figure-eight; (3) experiments/test_R_descent.py verifying coefficient vanishing modulo C_N; (4) proofs/prop20.singular verifying ideal equality. Cite specific failures, if any, would have caught the typos in C2, C3.
  - Verification: Re-review should confirm `Whole paper` is corrected or justified.
- [ ] **Code release and entrypoints**
  - Location: code/reproducibility artifacts: `code release and execution entrypoints`
  - Evidence: The headline maximal universal invariant claim in Theorem 8 lacks a machine-checkable proof artifact. A formal proof file such as formal/Theorem8_maximal_universal_invariant.lean covering the quotient-ring universal property and Markov-move invariance would close this gap.
  - Required change: Release the source code, scripts, model configuration, and execution entrypoints needed to regenerate the reported tables, or document why those artifacts cannot be released.
  - Verification: Re-review should confirm runnable code or a documented non-release justification is present.

## Open Questions

- Can the authors supply an explicit Markov-move or Reidemeister-II argument showing that if Ω_N is a knot invariant over L/I' then I' must contain the generators of C_N, thereby completing the necessity direction of Corollary 9/35?
- What is the correct statement of each displayed equation in the proof of Theorem 39: specifically, which cyclotomic polynomial factor appears on each side, and how does the expression '(s − 1^{1-N})' read once corrected?
- Is the claim in Theorem 8 and Remark 11 that Ω̃_N encodes strictly more information than {J_d, Φ_d : d|N} for composite N a proved theorem or a conjecture? If a theorem, can the authors exhibit a pair of knots distinguished by Ω̃_4 but not by {J_2, Φ_2, J_4, Φ_4}?
- Does the normalisation scalar g_0 = s^{-(N-1)} q^{N(N-1)} specialise to the conventional quantum-trace weights for both Jones (s = q^{1-N}) and ADO (q = ξ_N), and can this be verified against published tables for the trefoil and figure-eight knot at N = 2 and N = 3?
- Can the authors provide a CAS script verifying Lemma 42's product identity by explicit polynomial division in Q[s^2][q^2]/φ_d(q^2) for d ≤ 12, and checking the ideal coincidence C_N = J̃_N via Gröbner basis for N ≤ 12?

## Per-Agent Reviews

### citation (`gemini-3-flash-preview`) — status: `pass`

```json
{
  "confidence": 0.95,
  "entries": [
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Y. Akustu",
          "T. Deguchi",
          "T. Ohtsuki"
        ],
        "doi": null,
        "key": "ADO",
        "raw": "ADO: Y. Akustu, T. Deguchi, T. Ohtsuki, {\\em Invariants of colored knots}, J. Knot Theory Ramifications 1, 161-184, (1992).",
        "title": "Invariants of colored knots",
        "url": null,
        "venue": "J. Knot Theory Ramifications 1",
        "year": 1992
      },
      "exists": null,
      "explanation": "Primary source for ADO invariants, which the paper aims to unify with colored Jones polynomials.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "C. Blanchet",
          "F. Costantino",
          "N. Geer",
          "B. Patureau-Mirand"
        ],
        "doi": null,
        "key": "BCGP",
        "raw": "BCGP: C. Blanchet, F. Costantino, N. Geer, B. Patureau-Mirand, {\\em Non-Semisimple TQFTs, Reidemeister Torsion and Kashaev's Invariants}, Advances in Mathematics, Volume 301, Pages 1-78 (2016).",
        "title": "Non-Semisimple TQFTs, Reidemeister Torsion and Kashaev's Invariants",
        "url": null,
        "venue": "Advances in Mathematics",
        "year": 2016
      },
      "exists": null,
      "explanation": "Provides context for the non-semisimple invariants (CGP invariants) mentioned in the introduction.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "C. Anghel"
        ],
        "doi": null,
        "key": "Cr1",
        "raw": "Cr1: C. Anghel, {\\em A topological model for the coloured Jones polynomials}, 50 pages, {Selecta Mathematica New Series} 28:63, (2022).",
        "title": "A topological model for the coloured Jones polynomials",
        "url": null,
        "venue": "Selecta Mathematica New Series",
        "year": 2022
      },
      "exists": null,
      "explanation": "A foundational work by the first author that establishes the topological framework for unifying Jones and ADO polynomials.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "C. Anghel"
        ],
        "doi": null,
        "key": "Cr2",
        "raw": "Cr2: C. Anghel, { \\em Coloured Jones and Alexander polynomials as topological intersections of cycles in configuration spaces}, 71 pages, {Advances in Mathematics} 459 109993, (2024). %",
        "title": "Coloured Jones and Alexander polynomials as topological intersections of cycles in configuration spaces",
        "url": null,
        "venue": "Advances in Mathematics",
        "year": 2024
      },
      "exists": null,
      "explanation": "Key prior work by the first author providing the configuration space constructions that are generalized in this paper.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "C. Anghel"
        ],
        "doi": null,
        "key": "CrG",
        "raw": "CrG: C. Anghel, {\\em A globalisation of Jones and Alexander polynomials constructed from a graded intersection of two Lagrangians in a configuration space}, Annales de l’Institut Fourier 75, no. 6 p. 2609-2656, (2025).",
        "title": "A globalisation of Jones and Alexander polynomials constructed from a graded intersection of two Lagrangians in a configuration space",
        "url": null,
        "venue": "Annales de l’Institut Fourier",
        "year": 2025
      },
      "exists": null,
      "explanation": "Discusses a globalization of the invariants which motivates the current paper's approach.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2401.17245",
        "authors": [
          "C. Anghel"
        ],
        "doi": null,
        "key": "Cru1",
        "raw": "Cru1: C. Anghel, {\\em Geometric universal Jones invariant from configurations on ovals in the disc}, math.GT arxiv: 2401.17245v3, 58 pages, (2025). | arxiv: 2401.17245",
        "title": "Geometric universal Jones invariant from configurations on ovals in the disc",
        "url": null,
        "venue": "math.GT",
        "year": 2025
      },
      "exists": null,
      "explanation": "Recent work developing universal geometric invariants that the current paper expands upon.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2505.18108",
        "authors": [
          "C. Anghel"
        ],
        "doi": null,
        "key": "Cru2",
        "raw": "Cru2: C. Anghel, {\\em Geometric universal link invariants}, math.GT arxiv.org/abs/2505.18108, 54 pages, (2025). | arxiv: 2505.18108",
        "title": "Geometric universal link invariants",
        "url": null,
        "venue": "math.GT",
        "year": 2025
      },
      "exists": null,
      "explanation": "Complementary work on universal link invariants.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "S. Gukov",
          "C. Manolescu"
        ],
        "doi": null,
        "key": "GM",
        "raw": "GM: S. Gukov, C. Manolescu, {\\em A two-variable series for knot complements}, Quantum Topology 12, 1-109, (2021).",
        "title": "A two-variable series for knot complements",
        "url": null,
        "venue": "Quantum Topology",
        "year": 2021
      },
      "exists": null,
      "explanation": "Relevant for the discussion of two-variable series and the conjectured geometry in knot invariants.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "C. Jackson",
          "T. Kerler"
        ],
        "doi": null,
        "key": "JK",
        "raw": "JK: C. Jackson, T. Kerler, {\\em The Lawrence-Krammer-Bigelow representations of the braid groups via $U_q(sl_2)$}, Adv. Math. 228, 1689-1717, (2011).",
        "title": "The Lawrence-Krammer-Bigelow representations of the braid groups via $U_q(sl_2)$",
        "url": null,
        "venue": "Adv. Math.",
        "year": 2011
      },
      "exists": null,
      "explanation": "The primary source for the algebraic structure of the quantum group and Verma modules used in the paper.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "R. Kashaev"
        ],
        "doi": null,
        "key": "K",
        "raw": "K: R. Kashaev, {\\em The hyperbolic volume of knots from the quantum dilogarithm}, Lett. Math. Phys. 39, 269-275, (1997).",
        "title": "The hyperbolic volume of knots from the quantum dilogarithm",
        "url": null,
        "venue": "Lett. Math. Phys.",
        "year": 1997
      },
      "exists": null,
      "explanation": "Foundational for the Volume Conjecture, cited to provide motivation for the study of these invariants.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "H. Murakami",
          "J. Murakami"
        ],
        "doi": null,
        "key": "M2",
        "raw": "M2: H. Murakami, J. Murakami, {\\em The colored Jones polynomials and the simplicial volume of a knot}, Acta Math. 186, 85-104, (2001).",
        "title": "The colored Jones polynomials and the simplicial volume of a knot",
        "url": null,
        "venue": "Acta Math.",
        "year": 2001
      },
      "exists": null,
      "explanation": "Further work on the Volume Conjecture and colored Jones polynomials.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "J. Murakami"
        ],
        "doi": null,
        "key": "Mur",
        "raw": "Mur: J. Murakami {\\em Colored Alexander invariants and cone-manifolds}, Osaka J. Math. 45, 541-564, (2008).",
        "title": "Colored Alexander invariants and cone-manifolds",
        "url": null,
        "venue": "Osaka J. Math.",
        "year": 2008
      },
      "exists": null,
      "explanation": "Work on colored Alexander invariants by the second author.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "N. Reshetikhin",
          "V. Turaev"
        ],
        "doi": null,
        "key": "RT",
        "raw": "RT: N. Reshetikhin, V. Turaev, {\\em Invariants of 3-manifolds via link polynomials and quantum groups}, Invent. Math. 103, 547-597, (1991).",
        "title": "Invariants of 3-manifolds via link polynomials and quantum groups",
        "url": null,
        "venue": "Invent. Math.",
        "year": 1991
      },
      "exists": null,
      "explanation": "Foundational for quantum group invariants and WRT invariants.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "T. M. Apostol"
        ],
        "doi": null,
        "key": "TA",
        "raw": "TA: T. M. Apostol, {\\em Resultants of cyclotomic polynomials}, Proc. Amer. Math. Soc. {\\bf 24}, 457--462, (1970).",
        "title": "Resultants of cyclotomic polynomials",
        "url": null,
        "venue": "Proc. Amer. Math. Soc.",
        "year": 1970
      },
      "exists": null,
      "explanation": "Used for technical details regarding cyclotomic polynomials in the context of rings of integers.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "C. Anghel"
        ],
        "doi": null,
        "key": "WRT",
        "raw": "WRT: C. Anghel - {\\em Witten-Reshetikhin-Turaev invariants for 3-manifolds from Lagrangian intersections in configuration spaces}, 39 pages, {Quantum topology} - 14, no. 4, pp. 693--731, (2023).",
        "title": "Witten-Reshetikhin-Turaev invariants for 3-manifolds from Lagrangian intersections in configuration spaces",
        "url": null,
        "venue": "Quantum topology",
        "year": 2023
      },
      "exists": null,
      "explanation": "Author's prior work extending the configuration space approach to 3-manifold invariants.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "E. Witten"
        ],
        "doi": null,
        "key": "Witt",
        "raw": "Witt: E. Witten, {\\em Quantum field theory and the Jones polynomial}, Comm. Math. Phys. 121, 351-399, (1989).",
        "title": "Quantum field theory and the Jones polynomial",
        "url": null,
        "venue": "Comm. Math. Phys.",
        "year": 1989
      },
      "exists": null,
      "explanation": "The original physical foundation for the Jones polynomial and WRT invariants.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    }
  ],
  "missing_references": [
    {
      "reason": "This is the standard comprehensive text for the Reshetikhin-Turaev approach to quantum invariants, which is central to the paper's context.",
      "title": "V. Turaev, Quantum Invariants of Knots and 3-Manifolds"
    }
  ],
  "summary": "The paper exhibits high citation hygiene, with a bibliography that thoroughly covers both the foundational results (Reshetikhin-Turaev, Witten, Kashaev) and the recent developments in the field, particularly the first author's own topological constructions. The use of Jackson and Kerler's work as a primary algebraic reference is appropriate and well-integrated into the technical sections. A few more standard references for quantum group representations could have been included for completeness, but the current list is sufficient."
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.78,
  "questions": [
    "Can the authors supply an explicit Markov-move or Reidemeister-II argument showing that if Ω_N is a knot invariant over L/I' then I' must contain the generators of C_N, thereby completing the necessity direction of Corollary 9/35?",
    "What is the correct statement of each displayed equation in the proof of Theorem 39: specifically, which cyclotomic polynomial factor appears on each side, and how does the expression '(s − 1^{1-N})' read once corrected?",
    "Is the claim in Theorem 8 and Remark 11 that Ω̃_N encodes strictly more information than {J_d, Φ_d : d|N} for composite N a proved theorem or a conjecture? If a theorem, can the authors exhibit a pair of knots distinguished by Ω̃_4 but not by {J_2, Φ_2, J_4, Φ_4}?",
    "Does the normalisation scalar g_0 = s^{-(N-1)} q^{N(N-1)} specialise to the conventional quantum-trace weights for both Jones (s = q^{1-N}) and ADO (q = ξ_N), and can this be verified against published tables for the trefoil and figure-eight knot at N = 2 and N = 3?",
    "Can the authors provide a CAS script verifying Lemma 42's product identity by explicit polynomial division in Q[s^2][q^2]/φ_d(q^2) for d ≤ 12, and checking the ideal coincidence C_N = J̃_N via Gröbner basis for N ≤ 12?"
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "The body proves the 'invariance' direction by showing the R-matrix preserves <v_0,...,v_{N-1}>^{⊗2} modulo C_N (Proposition 26). However the maximality direction — that any quotient L' in which Ω_N is a knot invariant factors through L_N — is asserted but never proved explicitly: the appendix only proves the ideal coincidences C_N = J_N = I_N, not that *any other* quotient destroying these relations would also destroy invariance. The argument that smaller ideals are insufficient is left implicit.",
      "id": "weakness-1",
      "locator": "Corollary 9 (sec. introduction), Corollary 35 (sec. 'Level N unified invariant')",
      "required_update": "Add an explicit lemma showing necessity: assume Ω_N is a knot invariant over L/I' for some ideal I' ⊊ I_N (resp. ⊊ Ĩ_N), and derive that I' must contain the generators of C_N by examining Markov/Reidemeister-II-type relations on the v_i⊗v_j → v_j⊗v_i terms with i+j ≥ N, or by exhibiting an explicit braid pair whose invariance forces each generator.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Corollary 9 (sec. introduction), Corollary 35 (sec. 'Level N unified invariant')` is corrected or justified.",
      "weakness_index": 0
    },
    {
      "evidence": "The CRT-style derivation in the proof of Theorem 39 contains transcription errors that obscure the algebra: (i) the displayed equation 'Ω_N^Φ(s,q)·φ_N(q^2) = Ω_N^Φ(q^{1-N},q)·φ_N(q) + Ω_N^J(s,q)' uses φ_N(q) on the RHS where φ_N(q^2) is required for the equation to balance; (ii) the factor '(s − 1^{1-N})' is plainly a typo for (s − q^{1-N}); (iii) the missing multiplication by φ_N(q^2) on Ω_N^J is then silently absorbed. The underlying CRT idea is correct (L_N is by definition Q[q^{±2},s^{±2}]/(φ_N(q^2)) × (s^2 q^{-2(N-1)}-1) factor) but as written the chain of equalities does not type-check.",
      "id": "weakness-2",
      "locator": "Theorem 10 (introduction), Theorem 39 (sec. 'Interpolation formula')",
      "required_update": "Rewrite the proof carefully: define Ω_N^Φ via Ω_N − Φ_N = Ω_N^Φ · φ_N(q^2), define Ω_N^J via Ω_N^Φ(s,q) − Ω_N^Φ(q^{1-N},q) = Ω_N^J · (s² q^{-2(N-1)} − 1)/φ_N(q^2)-related factor, and write the final relation as Ω_N = J_N + Φ_N − Φ_N|_{s=q^{1-N}} mod (φ_N(q^2)(s²q^{-2(N-1)}-1)). Also ship a sage/Mathematica notebook computing J_N, Φ_N, Ω_N for the trefoil and figure-eight at N=2,3,4 — see C9.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Theorem 10 (introduction), Theorem 39 (sec. 'Interpolation formula')` is corrected or justified.",
      "weakness_index": 1
    },
    {
      "evidence": "The text asserts 'this d-part of the ideal ... has a rich structure which in turn suggests that the invariant itself could encode deeper information than the sequence of coloured Jones and ADO invariants at levels that divide N' (Remark 11). No example, computation, or theorem actually exhibits a knot pair distinguished by Ω̃_N but not by {J_d, Φ_d : d|N}. The hedged language ('suggests', 'could encode') signals the claim is conjectural; the abstract's stronger phrasing 'it could contain more information which is not seen in the sequence' is therefore overstated relative to what is proved.",
      "id": "weakness-3",
      "locator": "Theorem 8 statement; Remark 11 in introduction",
      "required_update": "Either soften the abstract to mark this as a conjecture, or compute Ω̃_4, Ω̃_6 explicitly on representative knots (e.g. (2,5)-torus, 8_19) and exhibit a numerical witness. A companion Mathematica/Sage script (experiments/extra_info_N4.nb) computing Ω̃_4 and comparing against {J_2, Φ_2, J_4, Φ_4} would substantiate the claim.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Theorem 8 statement; Remark 11 in introduction` is corrected or justified.",
      "weakness_index": 2
    },
    {
      "evidence": "The proof explicitly verifies M = 0, 1, 2, 3 with carefully written algebraic manipulations and then asserts 'Following an inductive argument, we deduce this property for any natural number M, M ≤ N−2.' No inductive step is written. The four explicit cases each use a non-obvious telescoping with q-binomial coefficients; an inductive formulation is plausible but not given.",
      "id": "weakness-4",
      "locator": "Lemma 31 and its proof, appendix-like passage following Theorem 29",
      "required_update": "Replace the four explicit base cases by a single inductive proof: assume the partial sum at index M equals s^{-M-r-1} q^{f(M,r)} {M choose r}_q ∏_{k=0}^{M-r-1}(sq^{-k-1}-s^{-1}q^{k+1}) and verify the recursion using the q-Pascal rule {M+1 choose r+1}_q = q^{M-r}{M choose r+1}_q + q^{-r-1}{M choose r}_q. Alternatively provide a CAS verification at N ≤ 8.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Lemma 31 and its proof, appendix-like passage following Theorem 29` is corrected or justified.",
      "weakness_index": 3
    },
    {
      "evidence": "The paper is in math.GT/math.QA, a code-amenable field under the Proof-as-Code axiom. Every load-bearing identity above can be verified symbolically at small N (N ∈ {2,3,4,5,6}) on a handful of test knots (unknot, trefoil 3_1, figure-eight 4_1, (2,5)-torus, 8_19) using a standard CAS workflow: build the R-matrix in Q[q^{±2},s^{±2}]/Ĩ_N, compute the braid action, take the quantum partial trace, and compare against tabulated J_N and Φ_N. No such artifact is shipped with the paper. Given multiple algebraic typos in the proofs (see C2, C3, C8) and the implicit nature of the maximality argument (C1), the absence of an executable check is a genuine weakness, not a stylistic complaint.",
      "id": "weakness-5",
      "locator": "Whole paper",
      "required_update": "Ship a companion repository, e.g. github.com/anghel-murakami/level-N-universal-invariant, containing: (1) experiments/omega_N.sage computing Ω̃_N(β) for braid β over Q[q^{±2},s^{±2}]/Ĩ_N for N ≤ 6; (2) experiments/test_interpolation.py asserting Ω_N(K) = J_N(K) + Φ_N(K,s) − Φ_N(K,q^{1-N}) on at least the trefoil and figure-eight; (3) experiments/test_R_descent.py verifying coefficient vanishing modulo C_N; (4) proofs/prop20.singular verifying ideal equality. Cite specific failures, if any, would have caught the typos in C2, C3.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Whole paper` is corrected or justified.",
      "weakness_index": 4
    },
    {
      "evidence": "The headline maximal universal invariant claim in Theorem 8 lacks a machine-checkable proof artifact. A formal proof file such as formal/Theorem8_maximal_universal_invariant.lean covering the quotient-ring universal property and Markov-move invariance would close this gap.",
      "id": "weakness-6",
      "locator": "code release and execution entrypoints",
      "required_update": "Release the source code, scripts, model configuration, and execution entrypoints needed to regenerate the reported tables, or document why those artifacts cannot be released.",
      "source_path": null,
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "code",
      "verification_check": "Re-review should confirm runnable code or a documented non-release justification is present.",
      "weakness_index": 5
    }
  ],
  "strengths": [
    "The construction of a two-variable universal invariant that interpolates between colored Jones and ADO polynomials within a single algebraic object is a genuinely novel unification, advancing a programme that previously required separate algebraic treatments for each family.",
    "The proof that the level N invariant is maximal for prime N (Corollary 9/35) establishes algebraic optimality in a precise sense, providing a strong foundational justification for the construction.",
    "The R-matrix descent argument (Proposition 26) is fully verified, correctly identifying the generators of the ideal C_N as exactly the obstructions to descending the Verma-module R-matrix action to the quotient module.",
    "The bibliography is comprehensive and appropriately prioritises foundational sources (Reshetikhin-Turaev, Witten, Kashaev) alongside the first author's directly relevant prior programme, with no significant missing prior art identified.",
    "The explicit interpolation formula in Theorem 10 provides a concrete CRT-style decomposition of the universal invariant into its two specialisations, which, once the proof is corrected, constitutes a directly usable computational recipe."
  ],
  "summary": "This paper introduces level N universal quantum knot invariants constructed via quantum traces on finite quotients of Verma modules over a two-variable ring, with the headline results being: (i) for prime N the invariant is the unique maximal knot invariant arising from the N-dimensional Verma quotient (Theorem 8/Corollary 9); (ii) an explicit interpolation formula (Theorem 10) recovers both the colored Jones and ADO polynomials as specialisations; and (iii) for composite N the invariant may encode information beyond the union of Jones and ADO sequences at divisors. The novelty specialist rates the contribution as significant (0.80) with high confidence, and the citation specialist confirms comprehensive bibliographic coverage. However, the technical correctness specialist (confidence 0.62, overall_correctness mostly_sound) identifies four major gaps: the maximality direction of Corollary 9/35 is asserted but never proved (C1); the proof of the interpolation formula in Theorem 39 contains transcription errors that prevent algebraic type-checking (C2); the non-prime 'extra information' claim in Theorem 8/Remark 11 is presented as a theorem but is in fact an unsubstantiated conjecture (C5); and the ideal-coincidence proof in Proposition 20 and its appendix lemmas contains an unresolved gap in the cyclotomic substitution argument (C4). The reproducibility specialist (score 0.34, confidence 0.86) flags a critical concern: the headline maximal-universal-invariant claim in Theorem 8 lacks any machine-checkable proof artifact. Because the paper lies in math.GT/math.QA (a code-amenable field) and a critical proof-as-code artifact is absent for a headline claim, the recommendation gate defaults to major_revision. The interpolation-formula typos (C2) and the missing necessity argument for maximality (C1) are the most urgent issues. If C5 cannot be converted into a proved theorem with a computational witness, the abstract must be corrected to describe it as a conjecture. All specialists agree the core algebraic machinery is well-motivated and correctly set up; the deficiencies are correctable revisions, not fundamental flaws in the framework.",
  "weaknesses": [
    "The necessity direction of the maximality claim in Corollary 9/35 — that any quotient ring in which Ω_N is a knot invariant must factor through L_N — is stated but not proved; the appendix establishes only ideal coincidences C_N = J_N = I_N, not the required converse implication from invariance to ideal containment.",
    "The proof of the interpolation formula in Theorem 39 contains multiple transcription errors (φ_N(q) in place of φ_N(q^2), the factor '(s − 1^{1-N})' instead of '(s − q^{1-N})', and a silently absorbed φ_N(q^2) factor on Ω_N^J) that prevent the displayed chain of equalities from type-checking in L_N.",
    "The claim that Ω̃_N carries strictly more information than the sequence {J_d, Φ_d : d|N} for composite N (Theorem 8/Remark 11) is not supported by any theorem, example, or computation; the hedged language in the text signals it is conjectural, but the abstract presents it as a result.",
    "The ideal-coincidence proof (Proposition 20 and Appendix Lemmas 40–45) contains a gap at Step II where the φ_N(q^2) factor in J̃_N is not recovered from the cyclotomic substitution, and Lemma 42's product identity is justified only by informal coefficient-matching without the required q^{2d} ≡ 1 substitution carried through each factor.",
    "No computational verification artifacts are provided for any of the load-bearing identities; the paper is in math.GT/math.QA and the identities are mechanically checkable at small N on standard test knots, making the absence a substantive gap rather than a stylistic choice — the noted typos in C2, C3, and C8 are exactly the kind of errors a CAS check would have caught.",
    "The headline maximal-universal-invariant result (Theorem 8) lacks any machine-checkable proof artifact — no formal proof file, no executable computation — constituting a critical reproducibility gap for a code-amenable field."
  ]
}
```

### novelty (`gemini-3-flash-preview`) — status: `pass`

```json
{
  "confidence": 0.9,
  "missing_prior_art": [],
  "novelty_score": 0.8,
  "related_work": [
    {
      "citation_key": "ADO",
      "delta": "Lifts the ADO invariants (defined at roots of unity) into a two-variable universal invariant that also incorporates semi-simple invariants.",
      "relation": "prior_art",
      "title": "Invariants of colored knots"
    },
    {
      "citation_key": "Cr1",
      "delta": "Extends the previous topological unification of Jones and Alexander invariants at bounded colors to a full algebraic framework using quantum traces on finite quotients of Verma modules for any level N.",
      "relation": "builds_on",
      "title": "A topological model for the coloured Jones polynomials"
    },
    {
      "citation_key": "JK",
      "delta": "Uses the U_q(sl_2) braid group action on Verma modules as a foundation, but constructs new knot invariants through unique quantum traces on finite-dimensional quotients.",
      "relation": "prior_art",
      "title": "The Lawrence-Krammer-Bigelow representations of the braid groups via U_q(sl_2)"
    },
    {
      "citation_key": "M2",
      "delta": "Unifies the coloured Jones polynomials into a broader framework that simultaneously captures non-semi-simple information through a two-variable invariant.",
      "relation": "prior_art",
      "title": "The colored Jones polynomials and the simplicial volume of a knot"
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
      "description": "No source code, license, release, or commit is provided. A reference implementation for computing the level-N invariants, for example src/omega_level.sage, would be needed to independently reproduce sample computations from the definitions.",
      "severity": "major"
    },
    {
      "area": "code",
      "description": "The headline maximal universal invariant claim in Theorem 8 lacks a machine-checkable proof artifact. A formal proof file such as formal/Theorem8_maximal_universal_invariant.lean covering the quotient-ring universal property and Markov-move invariance would close this gap.",
      "severity": "critical"
    },
    {
      "area": "code",
      "description": "The quotient-module braid action and unique quantum trace construction underlying the invariant lack proof-as-code artifacts. A formalization such as formal/quotient_trace_construction.lean for Theorems 4 and 6 and their referenced internal results would be needed for reproducible verification.",
      "severity": "major"
    },
    {
      "area": "code",
      "description": "The interpolation formula in Theorem 10 is not accompanied by formal verification or executable checks against colored Jones and ADO computations. A file such as formal/Theorem10_interpolation.lean or notebooks/interpolation_checks.sage would make this result reproducible.",
      "severity": "major"
    },
    {
      "area": "evaluation",
      "description": "No worked computational examples, test knots, expected outputs, or regression tests are provided for the proposed invariants at prime and non-prime levels. A reproducibility suite such as examples/levelN_knot_tests.json with expected values would help verify independent implementations.",
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
  "reproducibility_score": 0.34
}
```

### summary (`claude-haiku-4-5-20251001`) — status: `pass`

```json
{
  "audience": "Specialists in knot theory, quantum topology, and low-dimensional topology; researchers studying quantum group representations and their invariant applications",
  "key_contributions": [
    "Construction of level N universal invariants from quantum traces on finite quotients of Verma modules over quotient rings in two variables",
    "Proof that for prime levels N, the level N universal invariant is the maximal invariant arising from the N-dimensional part of the Verma module",
    "Proof that the level N unified invariant provides an explicit interpolation formula between the N-th colored Jones polynomial and the N-th ADO polynomial when N is prime",
    "For non-prime levels, the level N universal invariant recovers both colored Jones and ADO polynomials and lies in a richer quotient ring that may encode additional information not visible in these standard polynomial sequences"
  ],
  "plain_language_summary": "Knot invariants are mathematical objects that can distinguish different knots. This paper constructs a new family of universal quantum knot invariants using representation theory of the quantum group U_q(sl_2). These invariants are built from Verma modules—infinite-dimensional representations—and are defined over quotient rings in two variables q and s.\n\nThe key contribution is unifying two previously separate families of invariants: the colored Jones polynomials and the ADO polynomials. For each positive integer level N, the authors define a level N universal invariant. When N is prime, this invariant exactly recovers both the colored Jones and ADO invariants at that level through a specific interpolation formula. For non-prime levels, the invariant lives in a larger quotient ring and potentially contains information beyond what the colored Jones or ADO sequences alone can capture.\n\nThe authors prove that when N is prime, their invariant is maximal—meaning it is the largest invariant that can be obtained from the N-dimensional part of the Verma module while still yielding a knot invariant. This establishes that their construction is optimal in a precise algebraic sense.",
  "tldr": "The paper constructs a unified family of universal quantum knot invariants from Verma modules that interpolate between the colored Jones and ADO polynomials."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `pass`

```json
{
  "claims": [
    {
      "assessment": "partially_supported",
      "claim": "For prime N, the interpolation quotient ring L_N = Q[q^{±2},s^{±2}]/(φ_N(q^2)·(s^2 q^{-2(N-1)}-1)) is the maximal quotient of L in which the quantum trace yields a knot invariant (Corollary 9/35).",
      "evidence": "The body proves the 'invariance' direction by showing the R-matrix preserves <v_0,...,v_{N-1}>^{⊗2} modulo C_N (Proposition 26). However the maximality direction — that any quotient L' in which Ω_N is a knot invariant factors through L_N — is asserted but never proved explicitly: the appendix only proves the ideal coincidences C_N = J_N = I_N, not that *any other* quotient destroying these relations would also destroy invariance. The argument that smaller ideals are insufficient is left implicit.",
      "id": "C1",
      "location": "Corollary 9 (sec. introduction), Corollary 35 (sec. 'Level N unified invariant')",
      "severity": "major",
      "suggested_fix": "Add an explicit lemma showing necessity: assume Ω_N is a knot invariant over L/I' for some ideal I' ⊊ I_N (resp. ⊊ Ĩ_N), and derive that I' must contain the generators of C_N by examining Markov/Reidemeister-II-type relations on the v_i⊗v_j → v_j⊗v_i terms with i+j ≥ N, or by exhibiting an explicit braid pair whose invariance forces each generator."
    },
    {
      "assessment": "partially_supported",
      "claim": "Ω_N(L)(q,s) = J_N(L,q) + Φ_N(L,s) − Φ_N(L, q^{1-N}) as elements of L_N (Theorem 10/39, interpolation formula).",
      "evidence": "The CRT-style derivation in the proof of Theorem 39 contains transcription errors that obscure the algebra: (i) the displayed equation 'Ω_N^Φ(s,q)·φ_N(q^2) = Ω_N^Φ(q^{1-N},q)·φ_N(q) + Ω_N^J(s,q)' uses φ_N(q) on the RHS where φ_N(q^2) is required for the equation to balance; (ii) the factor '(s − 1^{1-N})' is plainly a typo for (s − q^{1-N}); (iii) the missing multiplication by φ_N(q^2) on Ω_N^J is then silently absorbed. The underlying CRT idea is correct (L_N is by definition Q[q^{±2},s^{±2}]/(φ_N(q^2)) × (s^2 q^{-2(N-1)}-1) factor) but as written the chain of equalities does not type-check.",
      "id": "C2",
      "location": "Theorem 10 (introduction), Theorem 39 (sec. 'Interpolation formula')",
      "severity": "major",
      "suggested_fix": "Rewrite the proof carefully: define Ω_N^Φ via Ω_N − Φ_N = Ω_N^Φ · φ_N(q^2), define Ω_N^J via Ω_N^Φ(s,q) − Ω_N^Φ(q^{1-N},q) = Ω_N^J · (s² q^{-2(N-1)} − 1)/φ_N(q^2)-related factor, and write the final relation as Ω_N = J_N + Φ_N − Φ_N|_{s=q^{1-N}} mod (φ_N(q^2)(s²q^{-2(N-1)}-1)). Also ship a sage/Mathematica notebook computing J_N, Φ_N, Ω_N for the trefoil and figure-eight at N=2,3,4 — see C9."
    },
    {
      "assessment": "partially_supported",
      "claim": "There exists a unique (up to scalar) quantum partial trace on tensor powers of Ṽ_N, with g_j(q,s) = g_0(q,s) q^{-2j} (Theorem 6/29).",
      "evidence": "The induction is correct in outline but contains errors that affect a reader's ability to verify: the base case derives 'g_1(q,s) = q^{-2}' instead of g_0(q,s) q^{-2}; the inductive step writes 'g_{M+1}(q,s) = q_0(q,s) q^{-2(M+2)}' where the variable 'q_0' should be 'g_0' and the exponent should be q^{-2(M+1)} to match P(M+1) as stated. The theorem statement itself writes 'g_0(q,s) q^{-2i}' in a sum indexed by j — an i/j index typo. Lemma 31 is invoked as eq (sum1) and the inductive identity it proves is the load-bearing step, but Lemma 31's proof only displays cases M=0,1,2,3 and concludes 'Following an inductive argument…' without writing the inductive step.",
      "id": "C3",
      "location": "Theorem 6 (introduction), Theorem 29 (sec. 'Unique quantum trace')",
      "severity": "minor",
      "suggested_fix": "Correct the typos g_0 vs q_0, q^{-2(M+2)} → q^{-2(M+1)}, and i/j index in Thm 29's display. In Lemma 31, replace the four explicit cases by a single inductive computation that gives the (M+1)-st partial telescoping sum in closed form, identifying the binomial coefficient appearing in the residue."
    },
    {
      "assessment": "partially_supported",
      "claim": "The three ideals C_N, J̃_N, Ĩ_N of L = Q[q^{±2},s^{±2}] coincide (Proposition 20 / Lemma 40 / Lemma 43).",
      "evidence": "The four-step proof of C_N = J̃_N is detailed but the rewrite 'I_N' = ... = (s² q^{-2N+2} − 1) · ⋂_{d|N, d≠1} ((φ_d(q^2)) + (∏(s²q^{-2i}-1)))' is asserted via the cyclotomic substitution q^{2d} ≡ 1 mod φ_d(q^2), but the displayed equation at Step II then concludes I_N' ⊇ J̃_N citing only the relation ' (s²q^{-2N+2}-1)·⋂_d (φ_d(q^2)) + (∏(s²q^{-2i}-1))' — there is no argument that the leading (φ_N(q^2)) factor in J̃_N is recovered. Lemma 42's claim ∏_{i=1}^{d-1}(s²q^{-2i}-1) ≡ (s^{2d}-1)/(s²-1) mod φ_d(q^2) is justified by an informal coefficient-matching that elides the q^{2d}≡1 substitution required at each i; the precise identity should be verified term-by-term.",
      "id": "C4",
      "location": "Proposition 20 (sec. 'Coincidence of defining ideals'); proofs in Appendix Lemmas 40, 42, 43, 44, 45",
      "severity": "major",
      "suggested_fix": "Verify Lemma 42 by explicit polynomial division in Q[s²][q²]/φ_d(q^2) for d = 2,3,4,5,6,12 using a CAS (e.g. SageMath: provide a script proofs/lemma42_check.sage). Similarly verify Proposition 20 by checking ⟨C_N⟩ = ⟨J̃_N⟩ via Gröbner basis in Singular for N ≤ 12 (proofs/prop20_check.singular)."
    },
    {
      "assessment": "unsupported",
      "claim": "For N non-prime, Ĩ_N strictly contains I_N, and Ω̃_N(L) ∈ L̃_N carries strictly more information than Ω_N(L) ∈ L_N (Remark 11 / Theorem 8).",
      "evidence": "The text asserts 'this d-part of the ideal ... has a rich structure which in turn suggests that the invariant itself could encode deeper information than the sequence of coloured Jones and ADO invariants at levels that divide N' (Remark 11). No example, computation, or theorem actually exhibits a knot pair distinguished by Ω̃_N but not by {J_d, Φ_d : d|N}. The hedged language ('suggests', 'could encode') signals the claim is conjectural; the abstract's stronger phrasing 'it could contain more information which is not seen in the sequence' is therefore overstated relative to what is proved.",
      "id": "C5",
      "location": "Theorem 8 statement; Remark 11 in introduction",
      "severity": "major",
      "suggested_fix": "Either soften the abstract to mark this as a conjecture, or compute Ω̃_4, Ω̃_6 explicitly on representative knots (e.g. (2,5)-torus, 8_19) and exhibit a numerical witness. A companion Mathematica/Sage script (experiments/extra_info_N4.nb) computing Ω̃_4 and comparing against {J_2, Φ_2, J_4, Φ_4} would substantiate the claim."
    },
    {
      "assessment": "partially_supported",
      "claim": "Ω_N(L)|_{s=q^{1-N}} = J_N(L,q) and Ω_N(L)|_{q=ξ_N} = Φ_N(L,s) (Theorem 37, recovery of coloured Jones and ADO).",
      "evidence": "The proof reduces to the assertion that V_N|_{s=q^{1-N}} is the usual N-dimensional U_q(sl_2)-representation and V_N|_{q=ξ_N} is the N-dimensional ADO representation. Both reductions are standard, but the proof gives no computation; in particular it does not address whether the quantum-trace normalisation scalar g_0 = s^{-(N-1)} q^{N(N-1)} chosen in Definition 7 specialises correctly to the conventional Jones/ADO normalisations. The final display has an arrow typo 'q − ξ_N' (should be 'q = ξ_N').",
      "id": "C6",
      "location": "Theorem 37 (sec. 'Recovering coloured Jones and ADO')",
      "severity": "minor",
      "suggested_fix": "Add a half-page lemma matching the normalisation: show g_0|_{s=q^{1-N}} = q^{(N-1)(N-1)} agrees with the standard Jones quantum-trace weight, and g_0|_{q=ξ_N} matches the modified ADO trace. Cross-check numerically against published J_N and Φ_N tables for the trefoil and figure-eight at N=2,3."
    },
    {
      "assessment": "supported",
      "claim": "The R-matrix action on V̂ ⊗ V̂ given in (eq:Rpositive)/(eq:Rnegative) descends to a well-defined action on Ṽ_N^{⊗2} over L̃_N (Proposition 26).",
      "evidence": "The proof identifies precisely the generators of C_N as the coefficients that need to vanish for R(v_i⊗v_j) to remain in Ṽ_N^{⊗2}, namely the [n+j; j]_q · ∏(sq^{-k-j} − s^{-1} q^{k+j}) appearing when j+n ≥ N. This is a direct calculation from the R-matrix formula and the definition of C_N, and matches the standard descent argument.",
      "id": "C7",
      "location": "Proposition 26 (sec. 'Braid action over the quotient ring')",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "The R^{-1} computation (eq:Rnegative) yields ∑_{j=0}^{N-1} g_0 q^{-2j} (R^{-1})_{v_{N-1,j}}^{v_{N-1,j}} = s^{2N-2} q^{-2N(N-1)} (used to fix g_0 in Theorem 29 proof).",
      "evidence": "The computation is presented as a single displayed equation without intermediate steps. The factor q^{-2ij} (independent of n) in (eq:Rnegative) combined with j-th diagonal terms is non-trivial; the reader is asked to accept the closed-form s^{2N-2} q^{-2N(N-1)} without a derivation. Crucially this scalar fixes a = s^{-N+1} q^{N(N-1)} and thereby the writhe normalisation in Definition 7, so an error here propagates into the main definition.",
      "id": "C8",
      "location": "End of Theorem 29 proof, page following Lemma 31",
      "severity": "minor",
      "suggested_fix": "Insert a one-paragraph computation deriving R^{-1}(v_{N-1}⊗v_j)'s diagonal coefficient, evaluating the geometric sum ∑_{j=0}^{N-1} q^{-2j}·(diagonal), and obtaining the closed form. Optionally provide a small Sage/Python verification script (experiments/Rinv_diagonal_check.py) printing both sides for N ∈ {2,3,4,5}."
    },
    {
      "assessment": "unsupported",
      "claim": "All load-bearing identities (interpolation formula Thm 10, ideal coincidence Prop 20, R-matrix descent Prop 26, unique-trace formula Thm 29, recovery Thm 37) hold as written.",
      "evidence": "The paper is in math.GT/math.QA, a code-amenable field under the Proof-as-Code axiom. Every load-bearing identity above can be verified symbolically at small N (N ∈ {2,3,4,5,6}) on a handful of test knots (unknot, trefoil 3_1, figure-eight 4_1, (2,5)-torus, 8_19) using a standard CAS workflow: build the R-matrix in Q[q^{±2},s^{±2}]/Ĩ_N, compute the braid action, take the quantum partial trace, and compare against tabulated J_N and Φ_N. No such artifact is shipped with the paper. Given multiple algebraic typos in the proofs (see C2, C3, C8) and the implicit nature of the maximality argument (C1), the absence of an executable check is a genuine weakness, not a stylistic complaint.",
      "id": "C9",
      "location": "Whole paper",
      "severity": "major",
      "suggested_fix": "Ship a companion repository, e.g. github.com/anghel-murakami/level-N-universal-invariant, containing: (1) experiments/omega_N.sage computing Ω̃_N(β) for braid β over Q[q^{±2},s^{±2}]/Ĩ_N for N ≤ 6; (2) experiments/test_interpolation.py asserting Ω_N(K) = J_N(K) + Φ_N(K,s) − Φ_N(K,q^{1-N}) on at least the trefoil and figure-eight; (3) experiments/test_R_descent.py verifying coefficient vanishing modulo C_N; (4) proofs/prop20.singular verifying ideal equality. Cite specific failures, if any, would have caught the typos in C2, C3."
    },
    {
      "assessment": "partially_supported",
      "claim": "Lemma 31 (the telescoping identity ∑_{j=0}^{M} q^{-2j}(R_{v_{M,j}}^{v_{M,j}} − R_{v_{M+1,j}}^{v_{M+1,j}}) = q^{-2(M+1)} R_{v_{M+1,M+1}}^{v_{M+1,M+1}}) holds for all M ≤ N−2.",
      "evidence": "The proof explicitly verifies M = 0, 1, 2, 3 with carefully written algebraic manipulations and then asserts 'Following an inductive argument, we deduce this property for any natural number M, M ≤ N−2.' No inductive step is written. The four explicit cases each use a non-obvious telescoping with q-binomial coefficients; an inductive formulation is plausible but not given.",
      "id": "C10",
      "location": "Lemma 31 and its proof, appendix-like passage following Theorem 29",
      "severity": "minor",
      "suggested_fix": "Replace the four explicit base cases by a single inductive proof: assume the partial sum at index M equals s^{-M-r-1} q^{f(M,r)} {M choose r}_q ∏_{k=0}^{M-r-1}(sq^{-k-1}-s^{-1}q^{k+1}) and verify the recursion using the q-Pascal rule {M+1 choose r+1}_q = q^{M-r}{M choose r+1}_q + q^{-r-1}{M choose r}_q. Alternatively provide a CAS verification at N ≤ 8."
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

1. ADO: Y. Akustu, T. Deguchi, T. Ohtsuki, {\em Invariants of colored knots}, J. Knot Theory Ramifications 1, 161-184, (1992).
2. BCGP: C. Blanchet, F. Costantino, N. Geer, B. Patureau-Mirand, {\em Non-Semisimple TQFTs, Reidemeister Torsion and Kashaev's Invariants}, Advances in Mathematics, Volume 301, Pages 1-78 (2016).
3. Cr1: C. Anghel, {\em A topological model for the coloured Jones polynomials}, 50 pages, {Selecta Mathematica New Series} 28:63, (2022).
4. Cr2: C. Anghel, { \em Coloured Jones and Alexander polynomials as topological intersections of cycles in configuration spaces}, 71 pages, {Advances in Mathematics} 459 109993, (2024). %
5. CrG: C. Anghel, {\em A globalisation of Jones and Alexander polynomials constructed from a graded intersection of two Lagrangians in a configuration space}, Annales de l’Institut Fourier 75, no. 6 p. 2609-2656, (2025).
6. Cru1: C. Anghel, {\em Geometric universal Jones invariant from configurations on ovals in the disc}, math.GT arxiv: 2401.17245v3, 58 pages, (2025). arXiv:[2401.17245](https://arxiv.org/abs/2401.17245)
7. Cru2: C. Anghel, {\em Geometric universal link invariants}, math.GT arxiv.org/abs/2505.18108, 54 pages, (2025). arXiv:[2505.18108](https://arxiv.org/abs/2505.18108)
8. GM: S. Gukov, C. Manolescu, {\em A two-variable series for knot complements}, Quantum Topology 12, 1-109, (2021).
9. JK: C. Jackson, T. Kerler, {\em The Lawrence-Krammer-Bigelow representations of the braid groups via $U_q(sl_2)$}, Adv. Math. 228, 1689-1717, (2011).
10. K: R. Kashaev, {\em The hyperbolic volume of knots from the quantum dilogarithm}, Lett. Math. Phys. 39, 269-275, (1997).
11. M2: H. Murakami, J. Murakami, {\em The colored Jones polynomials and the simplicial volume of a knot}, Acta Math. 186, 85-104, (2001).
12. Mur: J. Murakami {\em Colored Alexander invariants and cone-manifolds}, Osaka J. Math. 45, 541-564, (2008).
13. RT: N. Reshetikhin, V. Turaev, {\em Invariants of 3-manifolds via link polynomials and quantum groups}, Invent. Math. 103, 547-597, (1991).
14. TA: T. M. Apostol, {\em Resultants of cyclotomic polynomials}, Proc. Amer. Math. Soc. {\bf 24}, 457--462, (1970).
15. WRT: C. Anghel - {\em Witten-Reshetikhin-Turaev invariants for 3-manifolds from Lagrangian intersections in configuration spaces}, 39 pages, {Quantum topology} - 14, no. 4, pp. 693\UTF{2013}731, (2023).
16. Witt: E. Witten, {\em Quantum field theory and the Jones polynomial}, Comm. Math. Phys. 121, 351-399, (1989).

