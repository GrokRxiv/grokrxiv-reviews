# $P$-categories and functions with degenerate singular submanifolds

GrokRxiv review of [arXiv:2606.14809](https://arxiv.org/abs/2606.14809) · `math.GT`

_Authors_: Olha Bondar

## TL;DR

The paper introduces P-category and p-length as topological invariants generalizing the Lyusternik–Shnirelman (LS) category and manifold length to the setting of functions whose critical point sets are smooth submanifolds diffeomorphic to a fixed manifold P. All five specialists concur on the paper's scope and contribution. The novelty specialist rates the work 'significant' (score 0.70, confidence 0.90) and identifies no missing prior art. The citation specialist finds the bibliography well-curated and appropriately integrated (confidence 0.95). The technical-correctness specialist rates the paper 'mostly_sound' (confidence 0.72) but flags one factually incorrect claim (Proposition 1.18: S^l-cat(S^n) stated as 0 instead of ∞ when l > n, C8, minor), one unsupported claim about the absence of any formal proof artifact for the ten load-bearing theorems (C15, major), and eight partially-supported claims at minor severity covering a boundary-degree gap in Theorem 1.7 (C2), a potential circular dependency in Theorem 1.9 (C3), incomplete inductive proofs in Theorems 3.6 and 2.18 (C9, C10), a smoothing gap in Theorem 2.6 (C7), a coefficient-ring inconsistency in the p-length definition (C1), and proof-sketch reliance in Theorems 2.13, 3.4, and Proposition 2.2 (C6, C12, C14). The reproducibility specialist independently flags the absence of formal proof artifacts as a critical concern (score 0.24, confidence 0.86) and adds three major concerns: no executable construction for P-functions, no computational verification of p-length or P-category values, and informal 'it is not difficult to see' arguments. This is a math.* submission in a code-amenable field; under the recommendation gate, the concurrent major finding (C15, technical_correctness) and critical finding (reproducibility concern 1) about missing proof-as-code artifacts default the recommendation to major_revision. The two missing citation entries (James 1978; Lusternik–Schnirelmann 1934 French edition) are minor omissions. The mathematical substance is sound and the contribution is genuine; the required revisions are confined to proof completeness, one definitional error, and the addition of a minimal computational verification artifact.

_Recommendation_: **Major revision** · _Confidence_: 78%

## Strengths

- P-category provides a natural and coherent generalization of LS category parameterized by a fixed submanifold P, recovering the classical theory as the special case P = point and yielding exact closed-form computations for products of spheres (Theorem 1.14: P-cat(S^{k_1} × ... × S^{k_r}) = r − l + 1), which are independently verified by the technical-correctness specialist.
- The complete classification of two-dimensional manifolds admitting round functions (Theorem 3.3) is rigorous, covers all surface types, achieves exact critical-circle counts, and is confirmed correct by the technical-correctness specialist.
- The existence theorem for P-functions via filtrations (Theorem 2.6) provides a clean unifying construction that subsumes earlier ad hoc arguments for round and exact Morse functions under a single framework parameterized by the manifold P.
- Citation coverage is comprehensive and well-integrated (citation specialist confidence 0.95), balancing Soviet foundational sources (Lyusternik, Shnirelman, Fomenko, Sharko) with Western classics (Morse, Milnor, Smale, Bott, Thurston) and contemporary results, providing solid historical grounding throughout.
- The novelty specialist confirms 'significant' novelty (score 0.70, confidence 0.90) with no missing prior art, validating that the P-category framework opens a genuinely new direction in critical-point theory beyond the classical LS setting.

## Weaknesses

- No formal or computational proof artifact accompanies any of the ten load-bearing theorems (1.5, 1.7, 1.13, 1.14, 2.5, 2.12, 2.15, 2.17, 3.4, 3.6); as a math.* paper in a code-amenable field, the absence of executable verification for results that are largely combinatorial over cohomology rings of products of spheres constitutes a critical reproducibility deficit (technical_correctness C15 major; reproducibility score 0.24, concern 1 critical).
- Proposition 1.18 (Chapter I) incorrectly states S^l-cat(S^n) = 0 when l > n; since Definition 1.1 sets P-cat = ∞ when no admissible covering exists and S^l cannot embed in S^n for l > n, the correct value is ∞, not 0.
- The proof of Theorem 1.7 (the central P-cat ≥ long^p + 1 inequality) has a gap at the boundary degree: the claimed isomorphism H_l(M) ≅ H_l(M, A_i) for l > p requires i_* = 0 in two consecutive degrees (l and l−1), but the case l−1 = p, where H_p(P) can carry classes lifted to H_p(A_i), is not addressed.
- Theorem 3.6 (existence of a round S^1-function on S^n with at most ⌊n/2⌋ + 1 singularities) provides explicit constructions only for n = 3, 4, 5 and asserts the general case by analogy without a written inductive step; the introductory generalization to P = S^k for arbitrary k is not proved in the body.
- The smoothing step in Theorem 2.6 uses the distance function ρ(x, ∂M_i), which is only Lipschitz near the boundary; no bump-function or partition-of-unity interpolation is supplied to establish smoothness of the glued function F across ∂M_i.
- The coefficient ring for p-length is defined inconsistently: the Introduction allows A = Z or Z_p (prime p) while Chapter I Definition 1.4 allows A = Z or R; the discrepancy is load-bearing for 'product non-zero' conditions in subsequent p-length counts, particularly for non-orientable manifolds.

## Revision Targets

- [ ] **Manuscript: Whole paper; affects Theorems 1.5, 1.7, 1.13, 1.14, 2.5, 2.12, 2.15, 2.17, 3.4, 3.6.**
  - Location: `corrections/2606.14809/paper.tex` at `Whole paper; affects Theorems 1.5, 1.7, 1.13, 1.14, 2.5, 2.12, 2.15, 2.17, 3.4, 3.6.`
  - Evidence: This is a math.* paper (algebraic/differential topology, Morse-theoretic). The headline results are amenable to mechanical verification: the P-category framework consists of finite combinatorial inequalities over cohomology rings of products of spheres and tori, the L-S-type lower bound 1.5 reduces to a long-exact-sequence + intersection-product argument, and the inequality cat M = r+1 (Theorem 1.13) is already formalised in part in mathlib (Lyusternik–Schnirelmann category of products). The paper ships no Lean/Coq/Agda development, nor any computational verification (e.g., a Lean witness that long^p T^n = n − p for specific small n, or a sage/python script generating the explicit cycles in Theorem 1.7). Per the proof-as-code axiom for code-amenable fields, the absence of any executable artifact is a documented weakness even though the paper is a translation of a 1993 dissertation.
  - Required change: Ship at minimum a Lean 4 / mathlib4 file formalising the main inequality of Theorem 1.5 in the special case P = point (recovering the classical Lyusternik–Schnirelmann bound), and one for Theorem 1.14 in low dimensions (e.g., S^k × S^l). Candidate paths: src/proofs/PCategory/MainInequality.lean and src/proofs/PCategory/ProductOfSpheres.lean. Alternatively, ship a small Python/Sage notebook computing long^p, cat, and P-cat for the explicit manifolds discussed (T^n, S^{k_1}×…×S^{k_r}) and verifying the inequalities for n ≤ 5.
  - Verification: Re-review should confirm `Whole paper; affects Theorems 1.5, 1.7, 1.13, 1.14, 2.5, 2.12, 2.15, 2.17, 3.4, 3.6.` is corrected or justified.
- [ ] **Manuscript: Chapter I, Proposition 1.18 (1.16).**
  - Location: `corrections/2606.14809/paper.tex` at `Chapter I, Proposition 1.18 (1.16).`
  - Evidence: Definition 1.1 explicitly states 'If no such number k exists we set P-cat = ∞'. When l > n there is no embedding of P = S^l into M = S^n and no closed subset of S^n contracts inside S^n to a homeomorphic copy of S^l, so no admissible covering exists and the P-category must be ∞, not 0. The proof in the paper only treats the cases l < n and l = n; the l > n case is asserted without justification and contradicts the stated definition.
  - Required change: Replace '0' with '∞' in clause (3) and remove that clause from the proposition (or restrict the statement to l ≤ n), and note in a remark that the definition assigns ∞ when no admissible covering exists.
  - Verification: Re-review should confirm `Chapter I, Proposition 1.18 (1.16).` is corrected or justified.
- [ ] **Manuscript: Chapter I, Theorem 1.7 (1.5) and its proof.**
  - Location: `corrections/2606.14809/paper.tex` at `Chapter I, Theorem 1.7 (1.5) and its proof.`
  - Evidence: The proof uses the long exact homology sequence of the pair (M, A_i) and asserts that 'for l > p, i_* = 0, that is, j_* is a monomorphism, which is equivalent to H_l(M) = H_l(M, A_i) for l > p.' Monomorphism of j_* follows from i_* = 0 in degree l; the equality H_l(M) = H_l(M, A_i) is an isomorphism statement, which additionally requires i_* = 0 in degree l-1. The case l-1 = p (i.e., the boundary degree dim P = p) is not addressed and is precisely where H_p(P) can carry classes that lift to H_p(A_i). The 'moving off' argument therefore needs an extra step to handle classes in dimension p. The headline conclusion is widely believed and consistent with the classical Lyusternik–Shnirelman bound (recovered when P is a point), but the proof as written has a gap at the boundary degree.
  - Required change: Either (i) restrict to cycles of dimension strictly greater than p (already implied by condition 3' once q ≥ 2) and spell out why the relevant moving-off classes live in degrees > p where i_* = 0 in two consecutive ranks, or (ii) replace the isomorphism claim with the weaker monomorphism j_* and reformulate the displacement argument accordingly.
  - Verification: Re-review should confirm `Chapter I, Theorem 1.7 (1.5) and its proof.` is corrected or justified.
- [ ] **Manuscript: Chapter III, Theorem 3.6 (3.6) and its proof.**
  - Location: `corrections/2606.14809/paper.tex` at `Chapter III, Theorem 3.6 (3.6) and its proof.`
  - Evidence: The proof gives explicit constructions only for n = 3, 4, 5 (using decompositions D^4/S^3 and D^5/S^4 with S^4 = M_1 ∪ M_2, etc.) and then states 'It is not difficult to see that an analogous treatment of higher-dimensional spheres yields the statement of the theorem.' For general n the inductive construction is not written out, and the count ⌊n/2⌋ + 1 is not verified to match what the iterated decomposition produces. The cases n = 4, 5 yield 3 singularities, consistent with ⌊n/2⌋ + 1, but the pattern is asserted, not proved.
  - Required change: Provide an explicit inductive description (e.g., S^n = ∪ of subsets each almost-diffeomorphic to S^1 × D^{n−1}) with a count argument, or cite a specific result that the iteration yields exactly ⌊n/2⌋ + 1 pieces. Also reconcile the introductory statement (Theorem 24 / 3.6) which writes the bound as '[n/2]+1 with n ≥ 2k+1' for P = S^k — the body proves only the k=1 case, but the introduction promises the general S^k bound.
  - Verification: Re-review should confirm `Chapter III, Theorem 3.6 (3.6) and its proof.` is corrected or justified.
- [ ] **Manuscript: Chapter II, Theorem 2.6 (2.5).**
  - Location: `corrections/2606.14809/paper.tex` at `Chapter II, Theorem 2.6 (2.5).`
  - Evidence: The construction glues the per-layer functions F_i (from Proposition 2.4) and then smooths them across the boundaries ∂M_i via the auxiliary metric-based functions f_i. The smoothing argument writes f_i piecewise as 'i − ρ(x, ∂M_i)' near ∂M_i, which is only Lipschitz continuous (the distance function to a smooth hypersurface is smooth on a one-sided tubular neighbourhood but the piecewise definition needs an explicit smooth interpolation between the three cases). The paper asserts the resulting F is differentiable, but the standard fix (use a cutoff bump function rather than the distance function directly) is not spelled out.
  - Required change: Replace 'ρ(x, ∂M_i)' with a smooth function of the signed distance constructed via a partition of unity or bump function on a tubular neighbourhood, and verify smooth matching of F across boundaries with explicit computations of derivatives.
  - Verification: Re-review should confirm `Chapter II, Theorem 2.6 (2.5).` is corrected or justified.
- [ ] **Manuscript: Section 'P-length of a manifold', Definition 1.4 (1.3) vs introductory Definition 2 (1.3).**
  - Location: `corrections/2606.14809/paper.tex` at `Section 'P-length of a manifold', Definition 1.4 (1.3) vs introductory Definition 2 (1.3).`
  - Evidence: Definition 2 (in the Introduction) lists coefficients as 'A = Z or Z_p when M is orientable, and A = Z_2 when M is non-orientable' (clashing notation: the same letter p is used both for the length parameter and for the coefficient prime). Definition 1.4 in Chapter I instead lists 'A = Z or R when M is orientable, and A = Z_2 when M is non-orientable'. The two definitions disagree on the admissible coefficient ring, which is load-bearing for what 'product non-zero' means in subsequent theorems.
  - Required change: Unify the two definitions into a single statement, using a coefficient prime distinct from the length parameter p (e.g., Z_q) or restrict to field coefficients consistently. Add a remark on how the p-length depends on the chosen coefficient ring.
  - Verification: Re-review should confirm `Section 'P-length of a manifold', Definition 1.4 (1.3) vs introductory Definition 2 (1.3).` is corrected or justified.

## Open Questions

- Proposition 1.18, clause (3): is the intended value S^l-cat(S^n) = ∞ (per Definition 1.1) rather than 0 when l > n, and does any downstream result in Chapter II or III depend on the clause as currently stated?
- Theorem 1.7: can the boundary-degree case l−1 = p be addressed explicitly in the long exact sequence argument, specifically handling whether i_*(H_p(A_i)) = 0 when A_i deformation-retracts inside M to P with dim P = p?
- Theorem 3.6: is there an explicit inductive construction for all n ≥ 3 that verifies the count ⌊n/2⌋ + 1, and does the argument generalize to the bound stated in the Introduction for P = S^k with arbitrary k ≥ 1?
- Definitions 1 and 1.4: which coefficient ring is canonical for p-length — Z, R, or a prime field Z_q — and is the value of long^p sensitive to this choice for non-orientable surfaces or odd-dimensional manifolds?
- Could a Sage or Python notebook verifying the p-length and P-category formulas for small explicit cases (e.g., S^1 × S^2, T^3, RP^3) be added as a supplementary artifact, given the computational nature of the examples in Chapters I–III?

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
          "Арнольд, В. И.",
          "Варченко, А. Н.",
          "Гусейн-заде, С. М."
        ],
        "doi": null,
        "key": "arnold-varchenko-gusein-1982",
        "raw": "arnold-varchenko-gusein-1982: author = Арнольд, В. И. and Варченко, А. Н. and Гусейн-заде, С. М., title = Особенности дифференцируемых отображений: в 2 т., publisher = Наука, address = М., year = 1982, volume = 1, langid = russian,",
        "title": "Особенности дифференцируемых отображений: в 2 т.",
        "url": null,
        "venue": "Наука",
        "year": 1982
      },
      "exists": null,
      "explanation": "Provides general background on singularity theory for differentiable mappings.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Ganea, T."
        ],
        "doi": null,
        "key": "ganea-1961",
        "raw": "ganea-1961: author = Ganea, T., title = Оценка сверху для категории Люстерника--Шнирельмана, journal = Докл.\\ АН СССР, year = 1961, volume = 136, number = 6, pages = 1273--1276, langid = russian,",
        "title": "Оценка сверху для категории Люстерника--Шнирельмана",
        "url": null,
        "venue": "Докл. АН СССР",
        "year": 1961
      },
      "exists": null,
      "explanation": "Early research on upper bounds for the Lyusternik-Shnirelman category.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Голубицкий, М.",
          "Гийемин, В."
        ],
        "doi": null,
        "key": "golubitsky-guillemin-1977",
        "raw": "golubitsky-guillemin-1977: author = Голубицкий, М. and Гийемин, В., title = Устойчивые отображения и их особенности, publisher = Мир, address = М., year = 1977, pagetotal = 290, langid = russian,",
        "title": "Устойчивые отображения и их особенности",
        "url": null,
        "venue": "Мир",
        "year": 1977
      },
      "exists": null,
      "explanation": "Standard reference for stable mappings and their singularities.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Дубровин, Б. А.",
          "Новиков, С. П.",
          "Фоменко, А. Т."
        ],
        "doi": null,
        "key": "dubrovin-novikov-fomenko-1984",
        "raw": "dubrovin-novikov-fomenko-1984: author = Дубровин, Б. А. and Новиков, С. П. and Фоменко, А. Т., title = Современная геометрия. Методы теории гомологий, publisher = Наука, address = М., year = 1984, pagetotal = 344, langid = russian,",
        "title": "Современная геометрия. Методы теории гомологий",
        "url": null,
        "venue": "Наука",
        "year": 1984
      },
      "exists": null,
      "explanation": "Textbook on homology theory methods in modern geometry.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Люстерник, Л. А.",
          "Шнирельман, Л. Г."
        ],
        "doi": null,
        "key": "lyusternik-shnirelman-1935",
        "raw": "lyusternik-shnirelman-1935: author = Люстерник, Л. А. and Шнирельман, Л. Г., title = Применение топологии к экстремальным задачам, booktitle = Труды Второго Всес.\\ мат.\\ съезда, year = 1935, pages = 224--237, langid = russian,",
        "title": "Применение топологии к экстремальным задачам",
        "url": null,
        "venue": "Труды Второго Всес. мат. съезда",
        "year": 1935
      },
      "exists": null,
      "explanation": "Foundational work applying topology to extremal problems.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Люстерник, Л. А.",
          "Шнирельман, Л. Г."
        ],
        "doi": null,
        "key": "lyusternik-shnirelman-1930",
        "raw": "lyusternik-shnirelman-1930: author = Люстерник, Л. А. and Шнирельман, Л. Г., title = Топологические методы в вариационных задачах, address = М., year = 1930, langid = russian,",
        "title": "Топологические методы в вариационных задачах",
        "url": null,
        "venue": "М.",
        "year": 1930
      },
      "exists": null,
      "explanation": "The original monograph introducing topological methods in variational problems.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Матвеев, С. В.",
          "Фоменко, А. Т.",
          "Шарко, В. В."
        ],
        "doi": "10.1070/SM1989v063n02ABEH003276",
        "key": "matveev-fomenko-sharko-1988",
        "raw": "matveev-fomenko-sharko-1988: author = Матвеев, С. В. and Фоменко, А. Т. and Шарко, В. В., title = Круглые функции Морса и изоэнергетические поверхности интегрируемых гамильтоновых систем, journal = Мат.\\ сб., year = 1988, volume = 135, number = 3, pages = 325--345, langid = russian, doi = 10.1070/SM1989v063n02ABEH003276,",
        "title": "Круглые функции Морса и изоэнергетические поверхности интегрируемых гамильтоновых систем",
        "url": null,
        "venue": "Мат. сб.",
        "year": 1988
      },
      "exists": null,
      "explanation": "Cited as a key reference for round Morse functions and integrable systems.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Милнор, Д."
        ],
        "doi": null,
        "key": "milnor-morse-1965",
        "raw": "milnor-morse-1965: author = Милнор, Д., title = Теория Морса, publisher = Мир, address = М., year = 1965, pagetotal = 182, langid = russian,",
        "title": "Теория Морса",
        "url": null,
        "venue": "Мир",
        "year": 1965
      },
      "exists": null,
      "explanation": "Cited for generalized Morse inequalities in the context of submanifolds.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Фоменко, А. Т."
        ],
        "doi": null,
        "key": "fomenko-1983",
        "raw": "fomenko-1983: author = Фоменко, А. Т., title = Дифференциальная геометрия и топология. Дополнительные главы, publisher = Изд-во Моск.\\ ун-та, address = М., year = 1983, pagetotal = 217, langid = russian,",
        "title": "Дифференциальная геометрия и топология. Дополнительные главы",
        "url": null,
        "venue": "Изд-во Моск. ун-та",
        "year": 1983
      },
      "exists": null,
      "explanation": "Supplementary material on differential geometry and topology.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Фоменко, А. Т."
        ],
        "doi": null,
        "key": "fomenko-1988",
        "raw": "fomenko-1988: author = Фоменко, А. Т., title = Симплектическая геометрия. Методы и приложения, publisher = Изд-во Моск.\\ гос.\\ ун-та, address = М., year = 1988, pagetotal = 413, langid = russian,",
        "title": "Симплектическая геометрия. Методы и приложения",
        "url": null,
        "venue": "Изд-во Моск. гос. ун-та",
        "year": 1988
      },
      "exists": null,
      "explanation": "Monograph on symplectic geometry methods.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Фоменко, А. Т.",
          "Шарко, В. В."
        ],
        "doi": "10.1007/BF01060557",
        "key": "fomenko-sharko-1989",
        "raw": "fomenko-sharko-1989: author = Фоменко, А. Т. and Шарко, В. В., title = Точные круглые функции Морса, неравенства типа Морса и интегралы гамильтоновых систем, journal = Укр.\\ мат.\\ журн., year = 1989, volume = 41, number = 6, pages = 352--361, langid = ukrainian, doi = 10.1007/BF01060557,",
        "title": "Точные круглые функции Морса, неравенства типа Морса и интегралы гамильтоновых систем",
        "url": null,
        "venue": "Укр. мат. журн.",
        "year": 1989
      },
      "exists": null,
      "explanation": "Directly supports the discussion of exact round Morse functions.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Чогошвили, Г. С."
        ],
        "doi": null,
        "key": "chogoshvili-1939",
        "raw": "chogoshvili-1939: author = Чогошвили, Г. С., title = О поверхностях уровня и областях меньших значений функции, заданной на ограниченном многообразии, journal = Докл.\\ АН СССР, year = 1939, volume = 24, number = 3, pages = 635--639, langid = russian,",
        "title": "О поверхностях уровня и областях меньших значений функции, заданной на ограниченном многообразии",
        "url": null,
        "venue": "Докл. АН СССР",
        "year": 1939
      },
      "exists": null,
      "explanation": "Mentioned by name in Section 1 as a contributor to LS category theory.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Шарко, В. В."
        ],
        "doi": null,
        "key": "sharko-1990",
        "raw": "sharko-1990: author = Шарко, В. В., title = Функции на многообразиях (алгебраические и топологические аспекты), publisher = Наук.\\ думка, address = Київ, year = 1990, pagetotal = 196, langid = ukrainian,",
        "title": "Функции на многообразиях (алгебраические и топологические аспекты)",
        "url": null,
        "venue": "Наук. думка",
        "year": 1990
      },
      "exists": null,
      "explanation": "Fundamental reference for the author's scientific advisor, covering functions on manifolds.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Шарко, В. В."
        ],
        "doi": "10.1070/RM1981v036n05ABEH003053",
        "key": "sharko-1981",
        "raw": "sharko-1981: author = Шарко, В. В., title = Точные функции Морса на односвязных многообразиях с неодносвязным краем, journal = Успехи мат.\\ наук, year = 1981, volume = 36, number = 5, pages = 205--206, langid = russian, doi = 10.1070/RM1981v036n05ABEH003053,",
        "title": "Точные функции Морса на односвязных многообразиях с неодносвязным краем",
        "url": null,
        "venue": "Успехи мат. наук",
        "year": 1981
      },
      "exists": null,
      "explanation": "Early work by Sharko on exact Morse functions.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Asimov, D."
        ],
        "doi": "10.2307/1970972",
        "key": "asimov-1975",
        "raw": "asimov-1975: author = Asimov, D., title = Round handles and non-singular Morse--Smale flows, journal = Ann. Math., year = 1975, volume = 102, number = 1, pages = 41--54, doi = 10.2307/1970972,",
        "title": "Round handles and non-singular Morse--Smale flows",
        "url": null,
        "venue": "Ann. Math.",
        "year": 1975
      },
      "exists": null,
      "explanation": "Classic paper on round handles, highly relevant to the study of round functions.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Borsuk, K."
        ],
        "doi": null,
        "key": "borsuk-1936",
        "raw": "borsuk-1936: author = Borsuk, K., title = Über den Lusternik--Schnirelmannschen Begriff der Kategorie, journal = Fund. Math., year = 1936, volume = 26, pages = 123--136, langid = german, url = https://eudml.org/doc/212789,",
        "title": "Über den Lusternik--Schnirelmannschen Begriff der Kategorie",
        "url": "https://eudml.org/doc/212789",
        "venue": "Fund. Math.",
        "year": 1936
      },
      "exists": null,
      "explanation": "Cited for developments in the theory of LS category.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Bott, R."
        ],
        "doi": "10.1090/S0273-0979-1982-15038-8",
        "key": "bott-1982",
        "raw": "bott-1982: author = Bott, R., title = Lectures on Morse theory, old and new, journal = Bull. Amer. Math. Soc., year = 1982, volume = 7, number = 2, pages = 331--358, doi = 10.1090/S0273-0979-1982-15038-8,",
        "title": "Lectures on Morse theory, old and new",
        "url": null,
        "venue": "Bull. Amer. Math. Soc.",
        "year": 1982
      },
      "exists": null,
      "explanation": "Cited in the introduction for modern perspectives on Morse theory.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Fox, R."
        ],
        "doi": "10.2307/1969736",
        "key": "fox-1953",
        "raw": "fox-1953: author = Fox, R., title = Free differential calculus, I, journal = Ann. Math., year = 1953, volume = 57, number = 3, pages = 517--560, doi = 10.2307/1969736,",
        "title": "Free differential calculus, I",
        "url": null,
        "venue": "Ann. Math.",
        "year": 1953
      },
      "exists": null,
      "explanation": "Likely used for algebraic computations related to the fundamental group of manifolds.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Fox, R."
        ],
        "doi": "10.2307/1968905",
        "key": "fox-1941",
        "raw": "fox-1941: author = Fox, R., title = On the Lusternik--Schnirelmann category, journal = Annals of Math., year = 1941, volume = 42, number = 2, doi = 10.2307/1968905,",
        "title": "On the Lusternik--Schnirelmann category",
        "url": null,
        "venue": "Annals of Math.",
        "year": 1941
      },
      "exists": null,
      "explanation": "Cited for foundational contributions to LS category theory.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Frank, G."
        ],
        "doi": "10.1090/S0002-9947-1988-0951627-9",
        "key": "frank-1988",
        "raw": "frank-1988: author = Frank, G., title = Templates and train tracks, journal = Trans. Amer. Math. Soc., year = 1988, volume = 308, number = 2, pages = 765--784, doi = 10.1090/S0002-9947-1988-0951627-9,",
        "title": "Templates and train tracks",
        "url": null,
        "venue": "Trans. Amer. Math. Soc.",
        "year": 1988
      },
      "exists": null,
      "explanation": "Cited in Ch 3 for results related to round functions on 3-manifolds.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Franks, J."
        ],
        "doi": null,
        "key": "franks-1980",
        "raw": "franks-1980: author = Franks, J., title = Homology and dynamical systems, journal = Regional conference series in math., year = 1980, volume = 49, pages = 3--120,",
        "title": "Homology and dynamical systems",
        "url": null,
        "venue": "Regional conference series in math.",
        "year": 1980
      },
      "exists": null,
      "explanation": "Cited multiple times for the relationship between homology and dynamical systems.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Franks, J."
        ],
        "doi": "10.1007/BF02566078",
        "key": "franks-1978",
        "raw": "franks-1978: author = Franks, J., title = The periodic behevior of non-singular Morse--Smale flows, journal = Comment. math. helv., year = 1978, volume = 53, number = 2, pages = 279--294, doi = 10.1007/BF02566078,",
        "title": "The periodic behevior of non-singular Morse--Smale flows",
        "url": null,
        "venue": "Comment. math. helv.",
        "year": 1978
      },
      "exists": null,
      "explanation": "Cited for research on non-singular Morse-Smale flows.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Froloff, S.",
          "Elsholz, L."
        ],
        "doi": null,
        "key": "froloff-elsholz-1935",
        "raw": "froloff-elsholz-1935: author = Froloff, S. and Elsholz, L., title = Limite inférieure pour le nombre des valeurs critiques d'une fonction, donnée sur une variété, journal = Мат.\\ сб., year = 1935, volume = 42, number = 5, pages = 637--643, langid = french,",
        "title": "Limite inférieure pour le nombre des valeurs critiques d'une fonction, donnée sur une variété",
        "url": null,
        "venue": "Мат. сб.",
        "year": 1935
      },
      "exists": null,
      "explanation": "Background work on lower bounds for critical values by the same authors as the tagged 1939 work.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Ganea, T."
        ],
        "doi": "10.1215/ijm/1256054563",
        "key": "ganea-1967",
        "raw": "ganea-1967: author = Ganea, T., title = Lusternik--Schnirelmann category and strong category, journal = Illinois journal of Math., year = 1967, volume = 11, number = 2, pages = 417--427, doi = 10.1215/ijm/1256054563,",
        "title": "Lusternik--Schnirelmann category and strong category",
        "url": null,
        "venue": "Illinois journal of Math.",
        "year": 1967
      },
      "exists": null,
      "explanation": "Cited for distinguishing between standard and strong LS categories.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Miyoshi, S."
        ],
        "doi": null,
        "key": "miyoshi-1983",
        "raw": "miyoshi-1983: author = Miyoshi, S., title = Foliated round surgery of codimension-one foliated manifolds, journal = Topology, year = 1983, volume = 21, number = 3, pages = 245--262,",
        "title": "Foliated round surgery of codimension-one foliated manifolds",
        "url": null,
        "venue": "Topology",
        "year": 1983
      },
      "exists": null,
      "explanation": "Cited for work on foliated round surgery relevant to round Morse functions.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Morgan, J. W."
        ],
        "doi": "10.1016/0040-9383(79)90013-2",
        "key": "morgan-1979",
        "raw": "morgan-1979: author = Morgan, J. W., title = Non-singular Morse--Smale flows on 3-dimensional manifolds, journal = Topology, year = 1979, volume = 18, number = 1, pages = 41--53, doi = 10.1016/0040-9383(79)90013-2,",
        "title": "Non-singular Morse--Smale flows on 3-dimensional manifolds",
        "url": null,
        "venue": "Topology",
        "year": 1979
      },
      "exists": null,
      "explanation": "Related study on non-singular Morse-Smale flows in three dimensions.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Morse, M."
        ],
        "doi": "10.2307/1989110",
        "key": "morse-1925",
        "raw": "morse-1925: author = Morse, M., title = Relations between the critical points of a real function of $n$ variables, journal = Trans. Amer. Math. Soc., year = 1925, volume = 27, pages = 345--396, doi = 10.2307/1989110,",
        "title": "Relations between the critical points of a real function of $n$ variables",
        "url": null,
        "venue": "Trans. Amer. Math. Soc.",
        "year": 1925
      },
      "exists": null,
      "explanation": "Foundational paper laying the groundwork for Morse theory.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Morse, M."
        ],
        "doi": null,
        "key": "morse-1934",
        "raw": "morse-1934: author = Morse, M., title = The calculus of variations in the large, address = New York, year = 1934, pagetotal = 352,",
        "title": "The calculus of variations in the large",
        "url": null,
        "venue": "New York",
        "year": 1934
      },
      "exists": null,
      "explanation": "Foundational monograph on global analysis and Morse theory.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Reeb, G."
        ],
        "doi": null,
        "key": "reeb-1947",
        "raw": "reeb-1947: author = Reeb, G., title = Sur les variétés niveau d'une fonction numerique, journal = C. R. Acad. Sci. Paris, year = 1947, volume = 224, number = 46, pages = 1324--1325, langid = french,",
        "title": "Sur les variétés niveau d'une fonction numerique",
        "url": null,
        "venue": "C. R. Acad. Sci. Paris",
        "year": 1947
      },
      "exists": null,
      "explanation": "Classic result on level sets of numerical functions.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Sharko, V. V."
        ],
        "doi": "10.1007/BFb0099560",
        "key": "sharko-1984",
        "raw": "sharko-1984: author = Sharko, V. V., title = Minimal Morse functions, journal = Lect. Notes Math., year = 1984, number = 108, pages = 218--234, doi = 10.1007/BFb0099560,",
        "title": "Minimal Morse functions",
        "url": null,
        "venue": "Lect. Notes Math.",
        "year": 1984
      },
      "exists": null,
      "explanation": "Related research on the minimality of Morse functions.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Singhof, W."
        ],
        "doi": "10.1007/BF01303636",
        "key": "singhof-1979",
        "raw": "singhof-1979: author = Singhof, W., title = Minimal coverings of manifolds with balls, journal = Manuscr. Math., year = 1979, volume = 29, pages = 385--415, doi = 10.1007/BF01303636,",
        "title": "Minimal coverings of manifolds with balls",
        "url": null,
        "venue": "Manuscr. Math.",
        "year": 1979
      },
      "exists": null,
      "explanation": "Cited for work on minimal ball coverings, which is related to LS category.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Takens, F."
        ],
        "doi": null,
        "key": "takens-1970",
        "raw": "takens-1970: author = Takens, F., title = The Lusternik--Schnirelman categories of a product space, journal = Compositio Math., year = 1970, volume = 22, number = 2, pages = 175--180, note = Fasc. 2, url = https://www.numdam.org/item/CM_1970__22_2_175_0/,",
        "title": "The Lusternik--Schnirelmann categories of a product space",
        "url": "https://www.numdam.org/item/CM_1970__22_2_175_0/",
        "venue": "Compositio Math.",
        "year": 1970
      },
      "exists": null,
      "explanation": "Background reference on the LS category of product spaces.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Takens, F."
        ],
        "doi": "10.1007/BF01404825",
        "key": "takens-1968",
        "raw": "takens-1968: author = Takens, F., title = The minimal number of critical points of a function on a compact manifold and the Lusternik--Schnirelman category, journal = Inventiones math., year = 1968, volume = 6, pages = 197--244, doi = 10.1007/BF01404825,",
        "title": "The minimal number of critical points of a function on a compact manifold and the Lusternik--Schnirelman category",
        "url": null,
        "venue": "Inventiones math.",
        "year": 1968
      },
      "exists": null,
      "explanation": "Cited for relating the number of critical points to the LS category.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Thom, R."
        ],
        "doi": null,
        "key": "thom-1949",
        "raw": "thom-1949: author = Thom, R., title = Sur une partition en cellules associee a une функция sur une variete, journal = C. R. Acad. Sci. Paris, year = 1949, volume = 228, pages = 973--975, series = A, langid = french,",
        "title": "Sur une partition en cellules associee a une функция sur une variete",
        "url": null,
        "venue": "C. R. Acad. Sci. Paris",
        "year": 1949
      },
      "exists": null,
      "explanation": "Cited for the discovery of cell structures associated with critical points.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Thurston, W."
        ],
        "doi": "10.2307/1971047",
        "key": "thurston-1976",
        "raw": "thurston-1976: author = Thurston, W., title = Existence of codimension-one foliations, journal = Ann. Math., year = 1976, volume = 104, number = 2, pages = 249--268, doi = 10.2307/1971047,",
        "title": "Existence of codimension-one foliations",
        "url": null,
        "venue": "Ann. Math.",
        "year": 1976
      },
      "exists": null,
      "explanation": "Cited for existence results for codimension-one foliations and round functions.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Wilson, F."
        ],
        "doi": "10.2307/1970458",
        "key": "wilson-1966",
        "raw": "wilson-1966: author = Wilson, F., title = On the minimal sets of non-singular vector fields, journal = Ann. of Math., year = 1966, volume = 84, pages = 529--536, doi = 10.2307/1970458,",
        "title": "On the minimal sets of non-singular vector fields",
        "url": null,
        "venue": "Ann. of Math.",
        "year": 1966
      },
      "exists": null,
      "explanation": "Cited for work on minimal sets of vector fields, relevant to round functions on 3-manifolds.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Birkhoff, G."
        ],
        "doi": "10.1090/S0002-9947-1917-1501070-3",
        "key": "birkhoff-1917",
        "raw": "birkhoff-1917: author = Birkhoff, G., title = Dynamical systems with two degrees of freedom, journal = Trans. Amer. Math. Soc., year = 1917, volume = 18, number = 4, pages = 199--300, doi = 10.1090/S0002-9947-1917-1501070-3,",
        "title": "Dynamical systems with two degrees of freedom",
        "url": null,
        "venue": "Trans. Amer. Math. Soc.",
        "year": 1917
      },
      "exists": null,
      "explanation": "Cited as the original reference for the minimax principle in Morse theory.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Смейл, С."
        ],
        "doi": "10.2307/2372978",
        "key": "smale-1964",
        "raw": "smale-1964: author = Смейл, С., title = О строении многообразий, journal = Математика, year = 1964, volume = 8, number = 4, pages = 95--108, langid = russian, doi = 10.2307/2372978, note = Перевод с английского: Smale S. ``On the structure of manifolds'', Amer.\\ J.\\ Math.\\ 84 (1962), 387--399.,",
        "title": "О строении многообразий",
        "url": null,
        "venue": "Математика",
        "year": 1964
      },
      "exists": null,
      "explanation": "Cited for the foundational 'handle decomposition' result.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Милнор, Д."
        ],
        "doi": null,
        "key": "milnor-difftop",
        "raw": "milnor-difftop: author = Милнор, Д., title = Дифференциальная топология, journal = Успехи мат.\\ наук, volume = XX, number = 6(126), pages = 41--54, langid = russian,",
        "title": "Дифференциальная топология",
        "url": null,
        "venue": "Успехи мат. наук",
        "year": 1965
      },
      "exists": null,
      "explanation": "Standard reference on differential topology.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Фоменко, А. Т.",
          "Браилов, А. В."
        ],
        "doi": "10.1070/SM1989v062n02ABEH003244",
        "key": "fomenko-brailov-1987",
        "raw": "fomenko-brailov-1987: author = Фоменко, А. Т. and Браилов, А. В., title = Топология интегральных многообразий вполне интегрируемых гамильтоновых систем, journal = Мат.\\ сб., year = 1987, volume = 133, number = 3, pages = 375--385, langid = russian, doi = 10.1070/SM1989v062n02ABEH003244,",
        "title": "Топология интегральных многообразий вполне интегрируемых гамильтоновых систем",
        "url": null,
        "venue": "Мат. сб.",
        "year": 1987
      },
      "exists": null,
      "explanation": "Background reference for the topology of integrable systems.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Фоменко, А. Т.",
          "Цишанг, Х."
        ],
        "doi": null,
        "key": "fomenko-cishang-1987",
        "raw": "fomenko-cishang-1987: author = Фоменко, А. Т. and Цишанг, Х., title = О топологии трехмерных многообразий, возникающих в гамильтоновой механике, journal = Докл.\\ АН СССР, year = 1987, volume = 294, number = 2, pages = 283--287, langid = russian,",
        "title": "О топологии трехмерных многообразий, возникающих в гамильтоновой механике",
        "url": null,
        "venue": "Докл. АН СССР",
        "year": 1987
      },
      "exists": null,
      "explanation": "Background reference for the topology of three-dimensional Hamiltonian systems.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Фролов, С. В.",
          "Эльсгольц, Л. Э."
        ],
        "doi": null,
        "key": "frolov-elsgolts-1939",
        "raw": "frolov-elsgolts-1939: author = Фролов, С. В. and Эльсгольц, Л. Э., title = Длина многообразия и её свойства, journal = Мат.\\ сб., year = 1939, volume = 5(47), number = 3, pages = 565--570, langid = russian, url = https://eudml.org/doc/65079,",
        "title": "Длина многообразия и её свойства",
        "url": "https://eudml.org/doc/65079",
        "venue": "Мат. сб.",
        "year": 1939
      },
      "exists": null,
      "explanation": "Cited for relating the LS category of a manifold to its homological length.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    }
  ],
  "missing_references": [
    {
      "reason": "A highly influential survey and development of LS category theory that was central to the field in the years leading up to 1993.",
      "title": "James, I. M. (1978). On category, in the sense of Lusternik-Schnirelmann. Topology."
    },
    {
      "reason": "The standard French translation of the authors' foundational 1930 Russian work, which is the primary citation for the LS category in international literature.",
      "title": "Lusternik, L. A., Schnirelmann, L. G. (1934). Méthodes topologiques dans les problèmes variationnels. Hermann."
    }
  ],
  "summary": "The paper demonstrates excellent citation hygiene, drawing from a deep pool of foundational 20th-century topological literature. It effectively balances historical Russian/Soviet contributions (Lyusternik, Shnirelman, Ganea) with Western classics (Morse, Smale, Bott), while also citing contemporary 1980s research from the Fomenko and Sharko schools. Most bibliography entries are appropriately integrated into the text via citation tags, providing a solid theoretical grounding for the study of P-categories and round functions."
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.78,
  "questions": [
    "Proposition 1.18, clause (3): is the intended value S^l-cat(S^n) = ∞ (per Definition 1.1) rather than 0 when l > n, and does any downstream result in Chapter II or III depend on the clause as currently stated?",
    "Theorem 1.7: can the boundary-degree case l−1 = p be addressed explicitly in the long exact sequence argument, specifically handling whether i_*(H_p(A_i)) = 0 when A_i deformation-retracts inside M to P with dim P = p?",
    "Theorem 3.6: is there an explicit inductive construction for all n ≥ 3 that verifies the count ⌊n/2⌋ + 1, and does the argument generalize to the bound stated in the Introduction for P = S^k with arbitrary k ≥ 1?",
    "Definitions 1 and 1.4: which coefficient ring is canonical for p-length — Z, R, or a prime field Z_q — and is the value of long^p sensitive to this choice for non-orientable surfaces or odd-dimensional manifolds?",
    "Could a Sage or Python notebook verifying the p-length and P-category formulas for small explicit cases (e.g., S^1 × S^2, T^3, RP^3) be added as a supplementary artifact, given the computational nature of the examples in Chapters I–III?"
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "This is a math.* paper (algebraic/differential topology, Morse-theoretic). The headline results are amenable to mechanical verification: the P-category framework consists of finite combinatorial inequalities over cohomology rings of products of spheres and tori, the L-S-type lower bound 1.5 reduces to a long-exact-sequence + intersection-product argument, and the inequality cat M = r+1 (Theorem 1.13) is already formalised in part in mathlib (Lyusternik–Schnirelmann category of products). The paper ships no Lean/Coq/Agda development, nor any computational verification (e.g., a Lean witness that long^p T^n = n − p for specific small n, or a sage/python script generating the explicit cycles in Theorem 1.7). Per the proof-as-code axiom for code-amenable fields, the absence of any executable artifact is a documented weakness even though the paper is a translation of a 1993 dissertation.",
      "id": "weakness-1",
      "locator": "Whole paper; affects Theorems 1.5, 1.7, 1.13, 1.14, 2.5, 2.12, 2.15, 2.17, 3.4, 3.6.",
      "required_update": "Ship at minimum a Lean 4 / mathlib4 file formalising the main inequality of Theorem 1.5 in the special case P = point (recovering the classical Lyusternik–Schnirelmann bound), and one for Theorem 1.14 in low dimensions (e.g., S^k × S^l). Candidate paths: src/proofs/PCategory/MainInequality.lean and src/proofs/PCategory/ProductOfSpheres.lean. Alternatively, ship a small Python/Sage notebook computing long^p, cat, and P-cat for the explicit manifolds discussed (T^n, S^{k_1}×…×S^{k_r}) and verifying the inequalities for n ≤ 5.",
      "source_path": "corrections/2606.14809/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Whole paper; affects Theorems 1.5, 1.7, 1.13, 1.14, 2.5, 2.12, 2.15, 2.17, 3.4, 3.6.` is corrected or justified.",
      "weakness_index": 0
    },
    {
      "evidence": "Definition 1.1 explicitly states 'If no such number k exists we set P-cat = ∞'. When l > n there is no embedding of P = S^l into M = S^n and no closed subset of S^n contracts inside S^n to a homeomorphic copy of S^l, so no admissible covering exists and the P-category must be ∞, not 0. The proof in the paper only treats the cases l < n and l = n; the l > n case is asserted without justification and contradicts the stated definition.",
      "id": "weakness-2",
      "locator": "Chapter I, Proposition 1.18 (1.16).",
      "required_update": "Replace '0' with '∞' in clause (3) and remove that clause from the proposition (or restrict the statement to l ≤ n), and note in a remark that the definition assigns ∞ when no admissible covering exists.",
      "source_path": "corrections/2606.14809/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Chapter I, Proposition 1.18 (1.16).` is corrected or justified.",
      "weakness_index": 1
    },
    {
      "evidence": "The proof uses the long exact homology sequence of the pair (M, A_i) and asserts that 'for l > p, i_* = 0, that is, j_* is a monomorphism, which is equivalent to H_l(M) = H_l(M, A_i) for l > p.' Monomorphism of j_* follows from i_* = 0 in degree l; the equality H_l(M) = H_l(M, A_i) is an isomorphism statement, which additionally requires i_* = 0 in degree l-1. The case l-1 = p (i.e., the boundary degree dim P = p) is not addressed and is precisely where H_p(P) can carry classes that lift to H_p(A_i). The 'moving off' argument therefore needs an extra step to handle classes in dimension p. The headline conclusion is widely believed and consistent with the classical Lyusternik–Shnirelman bound (recovered when P is a point), but the proof as written has a gap at the boundary degree.",
      "id": "weakness-3",
      "locator": "Chapter I, Theorem 1.7 (1.5) and its proof.",
      "required_update": "Either (i) restrict to cycles of dimension strictly greater than p (already implied by condition 3' once q ≥ 2) and spell out why the relevant moving-off classes live in degrees > p where i_* = 0 in two consecutive ranks, or (ii) replace the isomorphism claim with the weaker monomorphism j_* and reformulate the displacement argument accordingly.",
      "source_path": "corrections/2606.14809/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Chapter I, Theorem 1.7 (1.5) and its proof.` is corrected or justified.",
      "weakness_index": 2
    },
    {
      "evidence": "The proof gives explicit constructions only for n = 3, 4, 5 (using decompositions D^4/S^3 and D^5/S^4 with S^4 = M_1 ∪ M_2, etc.) and then states 'It is not difficult to see that an analogous treatment of higher-dimensional spheres yields the statement of the theorem.' For general n the inductive construction is not written out, and the count ⌊n/2⌋ + 1 is not verified to match what the iterated decomposition produces. The cases n = 4, 5 yield 3 singularities, consistent with ⌊n/2⌋ + 1, but the pattern is asserted, not proved.",
      "id": "weakness-4",
      "locator": "Chapter III, Theorem 3.6 (3.6) and its proof.",
      "required_update": "Provide an explicit inductive description (e.g., S^n = ∪ of subsets each almost-diffeomorphic to S^1 × D^{n−1}) with a count argument, or cite a specific result that the iteration yields exactly ⌊n/2⌋ + 1 pieces. Also reconcile the introductory statement (Theorem 24 / 3.6) which writes the bound as '[n/2]+1 with n ≥ 2k+1' for P = S^k — the body proves only the k=1 case, but the introduction promises the general S^k bound.",
      "source_path": "corrections/2606.14809/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Chapter III, Theorem 3.6 (3.6) and its proof.` is corrected or justified.",
      "weakness_index": 3
    },
    {
      "evidence": "The construction glues the per-layer functions F_i (from Proposition 2.4) and then smooths them across the boundaries ∂M_i via the auxiliary metric-based functions f_i. The smoothing argument writes f_i piecewise as 'i − ρ(x, ∂M_i)' near ∂M_i, which is only Lipschitz continuous (the distance function to a smooth hypersurface is smooth on a one-sided tubular neighbourhood but the piecewise definition needs an explicit smooth interpolation between the three cases). The paper asserts the resulting F is differentiable, but the standard fix (use a cutoff bump function rather than the distance function directly) is not spelled out.",
      "id": "weakness-5",
      "locator": "Chapter II, Theorem 2.6 (2.5).",
      "required_update": "Replace 'ρ(x, ∂M_i)' with a smooth function of the signed distance constructed via a partition of unity or bump function on a tubular neighbourhood, and verify smooth matching of F across boundaries with explicit computations of derivatives.",
      "source_path": "corrections/2606.14809/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Chapter II, Theorem 2.6 (2.5).` is corrected or justified.",
      "weakness_index": 4
    },
    {
      "evidence": "Definition 2 (in the Introduction) lists coefficients as 'A = Z or Z_p when M is orientable, and A = Z_2 when M is non-orientable' (clashing notation: the same letter p is used both for the length parameter and for the coefficient prime). Definition 1.4 in Chapter I instead lists 'A = Z or R when M is orientable, and A = Z_2 when M is non-orientable'. The two definitions disagree on the admissible coefficient ring, which is load-bearing for what 'product non-zero' means in subsequent theorems.",
      "id": "weakness-6",
      "locator": "Section 'P-length of a manifold', Definition 1.4 (1.3) vs introductory Definition 2 (1.3).",
      "required_update": "Unify the two definitions into a single statement, using a coefficient prime distinct from the length parameter p (e.g., Z_q) or restrict to field coefficients consistently. Add a remark on how the p-length depends on the chosen coefficient ring.",
      "source_path": "corrections/2606.14809/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 'P-length of a manifold', Definition 1.4 (1.3) vs introductory Definition 2 (1.3).` is corrected or justified.",
      "weakness_index": 5
    }
  ],
  "strengths": [
    "P-category provides a natural and coherent generalization of LS category parameterized by a fixed submanifold P, recovering the classical theory as the special case P = point and yielding exact closed-form computations for products of spheres (Theorem 1.14: P-cat(S^{k_1} × ... × S^{k_r}) = r − l + 1), which are independently verified by the technical-correctness specialist.",
    "The complete classification of two-dimensional manifolds admitting round functions (Theorem 3.3) is rigorous, covers all surface types, achieves exact critical-circle counts, and is confirmed correct by the technical-correctness specialist.",
    "The existence theorem for P-functions via filtrations (Theorem 2.6) provides a clean unifying construction that subsumes earlier ad hoc arguments for round and exact Morse functions under a single framework parameterized by the manifold P.",
    "Citation coverage is comprehensive and well-integrated (citation specialist confidence 0.95), balancing Soviet foundational sources (Lyusternik, Shnirelman, Fomenko, Sharko) with Western classics (Morse, Milnor, Smale, Bott, Thurston) and contemporary results, providing solid historical grounding throughout.",
    "The novelty specialist confirms 'significant' novelty (score 0.70, confidence 0.90) with no missing prior art, validating that the P-category framework opens a genuinely new direction in critical-point theory beyond the classical LS setting."
  ],
  "summary": "The paper introduces P-category and p-length as topological invariants generalizing the Lyusternik–Shnirelman (LS) category and manifold length to the setting of functions whose critical point sets are smooth submanifolds diffeomorphic to a fixed manifold P. All five specialists concur on the paper's scope and contribution. The novelty specialist rates the work 'significant' (score 0.70, confidence 0.90) and identifies no missing prior art. The citation specialist finds the bibliography well-curated and appropriately integrated (confidence 0.95). The technical-correctness specialist rates the paper 'mostly_sound' (confidence 0.72) but flags one factually incorrect claim (Proposition 1.18: S^l-cat(S^n) stated as 0 instead of ∞ when l > n, C8, minor), one unsupported claim about the absence of any formal proof artifact for the ten load-bearing theorems (C15, major), and eight partially-supported claims at minor severity covering a boundary-degree gap in Theorem 1.7 (C2), a potential circular dependency in Theorem 1.9 (C3), incomplete inductive proofs in Theorems 3.6 and 2.18 (C9, C10), a smoothing gap in Theorem 2.6 (C7), a coefficient-ring inconsistency in the p-length definition (C1), and proof-sketch reliance in Theorems 2.13, 3.4, and Proposition 2.2 (C6, C12, C14). The reproducibility specialist independently flags the absence of formal proof artifacts as a critical concern (score 0.24, confidence 0.86) and adds three major concerns: no executable construction for P-functions, no computational verification of p-length or P-category values, and informal 'it is not difficult to see' arguments. This is a math.* submission in a code-amenable field; under the recommendation gate, the concurrent major finding (C15, technical_correctness) and critical finding (reproducibility concern 1) about missing proof-as-code artifacts default the recommendation to major_revision. The two missing citation entries (James 1978; Lusternik–Schnirelmann 1934 French edition) are minor omissions. The mathematical substance is sound and the contribution is genuine; the required revisions are confined to proof completeness, one definitional error, and the addition of a minimal computational verification artifact.",
  "weaknesses": [
    "No formal or computational proof artifact accompanies any of the ten load-bearing theorems (1.5, 1.7, 1.13, 1.14, 2.5, 2.12, 2.15, 2.17, 3.4, 3.6); as a math.* paper in a code-amenable field, the absence of executable verification for results that are largely combinatorial over cohomology rings of products of spheres constitutes a critical reproducibility deficit (technical_correctness C15 major; reproducibility score 0.24, concern 1 critical).",
    "Proposition 1.18 (Chapter I) incorrectly states S^l-cat(S^n) = 0 when l > n; since Definition 1.1 sets P-cat = ∞ when no admissible covering exists and S^l cannot embed in S^n for l > n, the correct value is ∞, not 0.",
    "The proof of Theorem 1.7 (the central P-cat ≥ long^p + 1 inequality) has a gap at the boundary degree: the claimed isomorphism H_l(M) ≅ H_l(M, A_i) for l > p requires i_* = 0 in two consecutive degrees (l and l−1), but the case l−1 = p, where H_p(P) can carry classes lifted to H_p(A_i), is not addressed.",
    "Theorem 3.6 (existence of a round S^1-function on S^n with at most ⌊n/2⌋ + 1 singularities) provides explicit constructions only for n = 3, 4, 5 and asserts the general case by analogy without a written inductive step; the introductory generalization to P = S^k for arbitrary k is not proved in the body.",
    "The smoothing step in Theorem 2.6 uses the distance function ρ(x, ∂M_i), which is only Lipschitz near the boundary; no bump-function or partition-of-unity interpolation is supplied to establish smoothness of the glued function F across ∂M_i.",
    "The coefficient ring for p-length is defined inconsistently: the Introduction allows A = Z or Z_p (prime p) while Chapter I Definition 1.4 allows A = Z or R; the discrepancy is load-bearing for 'product non-zero' conditions in subsequent p-length counts, particularly for non-orientable manifolds."
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
      "citation_key": "lyusternik-shnirelman-1935",
      "delta": "Generalizes the Lyusternik–Shnirelman category (where categorical sets are contractible to a point) to the P-category (where sets are contractible to a fixed submanifold P).",
      "relation": "builds_on",
      "title": "Применение топологии к экстремальным задачам"
    },
    {
      "citation_key": "frolov-elsgolts-1939",
      "delta": "Extends the concept of manifold length to 'p-length', which accounts for the dimension of the singular submanifold P, providing a sharper lower bound for the P-category.",
      "relation": "builds_on",
      "title": "Длина многообразия и её свойства"
    },
    {
      "citation_key": "bott-1982",
      "delta": "While Bott focused on non-degenerate critical submanifolds (Morse-Bott theory), this work handles degenerate singular submanifolds and relates their minimal number to the P-category.",
      "relation": "prior_art",
      "title": "Lectures on Morse theory, old and new"
    },
    {
      "citation_key": "takens-1968",
      "delta": "Builds on Takens' work on the minimal number of critical points by extending the existence theorems and category-theoretic bounds to functions with submanifolds as critical sets.",
      "relation": "builds_on",
      "title": "The minimal number of critical points of a function on a compact manifold and the Lusternik--Shnirelman category"
    },
    {
      "citation_key": "thurston-1976",
      "delta": "Positions 'round functions' (where critical sets are circles) as a special case of P-functions and provides a broader framework for their existence on 2D and 3D manifolds.",
      "relation": "prior_art",
      "title": "Existence of codimension-one foliations"
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
      "description": "No repository, license, commit, release, or formal proof artifact is provided for the headline results on P-category lower bounds and minimal numbers of critical submanifolds; a Lean/Coq/Isabelle development such as formal/P_category_main_theorems.lean covering Theorem 1.5 and Theorem 2.12 would be needed for independent proof-as-code reproduction.",
      "severity": "critical"
    },
    {
      "area": "code",
      "description": "The constructive existence results for exact P-functions on products of spheres, tori, odd-dimensional spheres, and round functions on two- and three-dimensional manifolds are given only as prose constructions; a reproducible artifact such as formal/P_function_constructions.lean or scripts/check_constructions.sage would be needed to validate the constructions mechanically.",
      "severity": "major"
    },
    {
      "area": "code",
      "description": "Worked computations of p-length and P-category for products of spheres, tori, surfaces, and selected 3-manifolds are not accompanied by executable algebraic-topology calculations; a checker such as scripts/recompute_p_length.py with encoded cohomology rings and expected outputs would help reproduce the stated examples.",
      "severity": "major"
    },
    {
      "area": "evaluation",
      "description": "Several proofs rely on informal phrases such as 'it is not difficult to see' and visual level-line or figure-based constructions, so independent reproduction depends on expert manual reconstruction rather than a complete formal or algorithmic derivation.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "No computational environment, dependency versions, theorem-prover version, random seeds, or hardware/software requirements are specified because no executable reproducibility artifact is supplied.",
      "severity": "minor"
    }
  ],
  "confidence": 0.86,
  "data_availability": "unspecified",
  "data_url": null,
  "environment": null,
  "reproducibility_score": 0.24
}
```

### summary (`claude-haiku-4-5-20251001`) — status: `pass`

```json
{
  "audience": "Mathematicians in differential topology, differential geometry, and Morse theory. Particularly relevant to researchers studying critical point theory, topological invariants of manifolds, and differential functions on manifolds.",
  "key_contributions": [
    "Definition of P-category as a generalization of Lyusternik-Shnirelman category to degenerate critical submanifolds",
    "Introduction of p-length of manifolds as a topological invariant and proof of lower bounds on P-category in terms of p-length",
    "Definition of P-functions and sufficient conditions for their existence via manifold filtrations",
    "Proof that the number of critical submanifolds of a P-function is bounded below by the P-category of the manifold",
    "Complete classification of two-dimensional manifolds admitting round functions",
    "Construction of round functions on three-dimensional manifolds, with explicit examples on spheres, projective spaces, lens spaces, and tori",
    "Explicit formulas for P-category and p-length on products of spheres and tori"
  ],
  "plain_language_summary": "This work extends classical Morse theory, which relates the critical points of smooth functions on manifolds to the topology of the underlying space. Rather than studying functions with isolated critical points, this dissertation develops the theory for functions whose critical point sets consist of smooth submanifolds all diffeomorphic to the same manifold P. The author introduces two key concepts: P-category, which generalizes the classical Lyusternik-Shnirelman category, and p-length, which extends the notion of manifold length. These invariants provide lower bounds on the minimum number of critical submanifolds a function on a given manifold must have.\n\nThe main theoretical results establish inequalities relating the number of critical submanifolds to the P-category and p-length of a manifold. The author then applies this framework to construct concrete examples of such functions on specific manifolds. A particularly important class consists of round functions whose critical submanifolds are circles. The dissertation provides a complete classification of which two-dimensional manifolds admit round functions and constructs explicit examples on three-dimensional manifolds. These results generalize and unify earlier work on functions with circular critical sets.",
  "tldr": "This dissertation generalizes Morse theory by studying smooth functions whose critical point sets consist of degenerate submanifolds rather than isolated points, introducing P-category and P-length as topological invariants to bound the minimal number of such critical submanifolds."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `pass`

```json
{
  "claims": [
    {
      "assessment": "partially_supported",
      "claim": "Definition 1.4 (cohomological p-length) is well-posed and consistent with Definition 1 in the introduction; in particular, the coefficient ring is well-specified for both orientable and non-orientable manifolds.",
      "evidence": "Definition 2 (in the Introduction) lists coefficients as 'A = Z or Z_p when M is orientable, and A = Z_2 when M is non-orientable' (clashing notation: the same letter p is used both for the length parameter and for the coefficient prime). Definition 1.4 in Chapter I instead lists 'A = Z or R when M is orientable, and A = Z_2 when M is non-orientable'. The two definitions disagree on the admissible coefficient ring, which is load-bearing for what 'product non-zero' means in subsequent theorems.",
      "id": "C1",
      "location": "Section 'P-length of a manifold', Definition 1.4 (1.3) vs introductory Definition 2 (1.3).",
      "severity": "minor",
      "suggested_fix": "Unify the two definitions into a single statement, using a coefficient prime distinct from the length parameter p (e.g., Z_q) or restrict to field coefficients consistently. Add a remark on how the p-length depends on the chosen coefficient ring."
    },
    {
      "assessment": "partially_supported",
      "claim": "Theorem 1.7 (1.5): P-cat M ≥ long^p M + 1 (no boundary) and ≥ long^p M (with boundary).",
      "evidence": "The proof uses the long exact homology sequence of the pair (M, A_i) and asserts that 'for l > p, i_* = 0, that is, j_* is a monomorphism, which is equivalent to H_l(M) = H_l(M, A_i) for l > p.' Monomorphism of j_* follows from i_* = 0 in degree l; the equality H_l(M) = H_l(M, A_i) is an isomorphism statement, which additionally requires i_* = 0 in degree l-1. The case l-1 = p (i.e., the boundary degree dim P = p) is not addressed and is precisely where H_p(P) can carry classes that lift to H_p(A_i). The 'moving off' argument therefore needs an extra step to handle classes in dimension p. The headline conclusion is widely believed and consistent with the classical Lyusternik–Shnirelman bound (recovered when P is a point), but the proof as written has a gap at the boundary degree.",
      "id": "C2",
      "location": "Chapter I, Theorem 1.7 (1.5) and its proof.",
      "severity": "minor",
      "suggested_fix": "Either (i) restrict to cycles of dimension strictly greater than p (already implied by condition 3' once q ≥ 2) and spell out why the relevant moving-off classes live in degrees > p where i_* = 0 in two consecutive ranks, or (ii) replace the isomorphism claim with the weaker monomorphism j_* and reformulate the displacement argument accordingly."
    },
    {
      "assessment": "partially_supported",
      "claim": "Theorem 1.9 (1.7): long^p (S^{k_1} × … × S^{k_r}) ≥ r − min l(p), with the minimum taken over subsets whose dimensions sum to at least p.",
      "evidence": "The proof constructs r − l explicit cycles (each S^{k_j} factor multiplied by Q) and verifies the three p-length conditions; this directly establishes the stated ≥ inequality. However, the closing sentence invokes 'Theorem 1.7 (1.5) together with the estimate from Theorem 1.16 (1.14) P-cat M ≤ r − l + 1', which is unnecessary for the stated inequality and risks a circular dependency since the proof of Theorem 1.16 (1.14) explicitly cites Theorem 1.9 (1.7). The cycles also need to be in general position so that their intersection is exactly Q and not homologous to zero; the wave-of-the-hand to 'general position' is acceptable but not fully justified for a product of spheres with mixed dimensions.",
      "id": "C3",
      "location": "Chapter I, Theorem 1.9 (1.7) and its proof.",
      "severity": "minor",
      "suggested_fix": "Remove the invocations of Theorems 1.5 and 1.14 from the proof (the explicit cycle construction is already sufficient for the ≥ direction), and add one sentence justifying that the constructed cycles are pairwise transverse with intersection Q (e.g., via the Künneth-style cup-product computation in H^*(M))."
    },
    {
      "assessment": "supported",
      "claim": "Theorem 1.16 (1.14): For M = S^{k_1} × … × S^{k_r} and P = S^{k_{i_1}} × … × S^{k_{i_l}} a sub-product, P-cat M = r − l + 1.",
      "evidence": "The lower bound P-cat M ≥ r − l + 1 follows by chaining Theorem 1.7 (1.5) with the long^p bound from Theorem 1.9 (1.7). The upper bound is constructed cleanly: writing M = P × L with L the complementary product of spheres, the L-S category of L equals (r − l) + 1 by Theorem 1.15 (1.13), giving a covering of L by (r − l + 1) point-contractible closed sets {A_i}, and {P × A_i} is a covering of M by sets contractible within M to P. The argument is standard and correct.",
      "id": "C4",
      "location": "Chapter I, Theorem 1.16 (1.14) and its proof.",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Theorem 1.15 (1.13): cat M = r + 1 for a product of r spheres.",
      "evidence": "The lower bound r + 1 follows from Corollary 1.10 (long M = r) plus Theorem 1.7. The upper bound is constructed explicitly via the height function f(x,y,…,z) = x_1 + y_1 + … + z_1 restricted to M, which on the product of spheres has 2^r critical points distributed among connected level surfaces {f = -r + 2k}; collapsing each level set to a single (degenerate) critical point yields r + 1. This is a standard exact-Morse argument and matches the long-established result.",
      "id": "C5",
      "location": "Chapter I, Theorem 1.15 (1.13) and its proof.",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Theorem 2.13 (2.12) (main theorem): For a P-function on a compact connected manifold M (with the stated boundary conditions), the number of critical submanifolds is ≥ P-cat M.",
      "evidence": "The proof proceeds by induction on the number of critical values, modelled on the classical L-S argument and using cylindrical neighbourhoods of critical submanifolds (constructed in Propositions 2.10–2.12). The base case (minimal value) is correctly handled. The inductive step rests on the assertion that the closure of M^{c+δ} minus the disjoint cylindrical neighbourhoods deformation-retracts onto M^{b+ε} 'along integral trajectories of grad f'; this requires (i) that grad f has no critical points in the layer f^{-1}[b+ε, c−δ], which follows from the choice of intervals, and (ii) that the trajectories from points outside the cylindrical neighbourhoods reach M^{b+ε} (handled in Proposition 2.8). The argument is essentially correct, but the deformation-retract step is sketched at the level of the introduction rather than spelled out for the non-Morse setting where critical submanifolds may be highly degenerate; the proof relies implicitly on the cylindrical-neighbourhood theory developed earlier in §2.2.",
      "id": "C6",
      "location": "Chapter II, Section 'Main theorem', Theorem 2.13 (2.12) and its proof.",
      "severity": "minor",
      "suggested_fix": "Add one paragraph that explicitly cites Propositions 2.10–2.12 to justify the deformation onto M^{b+ε} and notes that 'general position' in the moving-off step is not used here (unlike Theorem 1.5)."
    },
    {
      "assessment": "partially_supported",
      "claim": "Theorem 2.6 (2.5) (existence of P-function with k critical submanifolds via filtration): correctly produces a smooth P-function from a filtration M_1 ⊂ … ⊂ M_k satisfying the four hypotheses.",
      "evidence": "The construction glues the per-layer functions F_i (from Proposition 2.4) and then smooths them across the boundaries ∂M_i via the auxiliary metric-based functions f_i. The smoothing argument writes f_i piecewise as 'i − ρ(x, ∂M_i)' near ∂M_i, which is only Lipschitz continuous (the distance function to a smooth hypersurface is smooth on a one-sided tubular neighbourhood but the piecewise definition needs an explicit smooth interpolation between the three cases). The paper asserts the resulting F is differentiable, but the standard fix (use a cutoff bump function rather than the distance function directly) is not spelled out.",
      "id": "C7",
      "location": "Chapter II, Theorem 2.6 (2.5).",
      "severity": "minor",
      "suggested_fix": "Replace 'ρ(x, ∂M_i)' with a smooth function of the signed distance constructed via a partition of unity or bump function on a tubular neighbourhood, and verify smooth matching of F across boundaries with explicit computations of derivatives."
    },
    {
      "assessment": "incorrect",
      "claim": "Proposition 1.18 (1.16): The S^l-category of S^n equals zero when l > n.",
      "evidence": "Definition 1.1 explicitly states 'If no such number k exists we set P-cat = ∞'. When l > n there is no embedding of P = S^l into M = S^n and no closed subset of S^n contracts inside S^n to a homeomorphic copy of S^l, so no admissible covering exists and the P-category must be ∞, not 0. The proof in the paper only treats the cases l < n and l = n; the l > n case is asserted without justification and contradicts the stated definition.",
      "id": "C8",
      "location": "Chapter I, Proposition 1.18 (1.16).",
      "severity": "minor",
      "suggested_fix": "Replace '0' with '∞' in clause (3) and remove that clause from the proposition (or restrict the statement to l ≤ n), and note in a remark that the definition assigns ∞ when no admissible covering exists."
    },
    {
      "assessment": "partially_supported",
      "claim": "Theorem 3.6 (3.6): On S^n with P = S^1 there exists a P-function with at most ⌊n/2⌋ + 1 singularities.",
      "evidence": "The proof gives explicit constructions only for n = 3, 4, 5 (using decompositions D^4/S^3 and D^5/S^4 with S^4 = M_1 ∪ M_2, etc.) and then states 'It is not difficult to see that an analogous treatment of higher-dimensional spheres yields the statement of the theorem.' For general n the inductive construction is not written out, and the count ⌊n/2⌋ + 1 is not verified to match what the iterated decomposition produces. The cases n = 4, 5 yield 3 singularities, consistent with ⌊n/2⌋ + 1, but the pattern is asserted, not proved.",
      "id": "C9",
      "location": "Chapter III, Theorem 3.6 (3.6) and its proof.",
      "severity": "minor",
      "suggested_fix": "Provide an explicit inductive description (e.g., S^n = ∪ of subsets each almost-diffeomorphic to S^1 × D^{n−1}) with a count argument, or cite a specific result that the iteration yields exactly ⌊n/2⌋ + 1 pieces. Also reconcile the introductory statement (Theorem 24 / 3.6) which writes the bound as '[n/2]+1 with n ≥ 2k+1' for P = S^k — the body proves only the k=1 case, but the introduction promises the general S^k bound."
    },
    {
      "assessment": "partially_supported",
      "claim": "Theorem 2.18 (2.17): On S^{2n+1} (n ≥ 1) with P = S^n there exists an exact P-function with two singularities.",
      "evidence": "The decomposition D^{2n+1} = N_1 ∪ N_2 ∪ N_3 followed by the quotient S^{2n+1} = D^{2n+1}/S^{2n} is asserted to give two subsets M_1, M_2 ⊂ S^{2n+1} each almost diffeomorphic to S^n × D^{n+1}. The cell-decomposition counts work out (the symmetry between x_i (i ≤ n) and x_j (n+1 ≤ j ≤ 2n+1) reflects the Hopf-type splitting), but the verification that the quotient identifies the boundary strata to give exactly S^n × D^{n+1} is not carried out in detail. Exactness then requires the lower bound P-cat S^{2n+1} = 2 (from Proposition 1.18), which is correctly established for l < n.",
      "id": "C10",
      "location": "Chapter II, Theorem 2.18 (2.17) and its proof.",
      "severity": "minor",
      "suggested_fix": "Add a coordinate-level check that the quotient map identifies ∂(N_i) appropriately so that M_i is homeomorphic to S^n × D^{n+1}, and explicitly verify the hypotheses of Theorem 2.6 (2.5) for the two-piece filtration M_1 ⊂ M_1 ∪ M_2 = S^{2n+1}."
    },
    {
      "assessment": "supported",
      "claim": "Theorem 3.5 (3.5): On S^n there is no P-function with P = S^{n−1}.",
      "evidence": "The proof uses Jordan–Brouwer separation to argue that removing a cylindrical neighbourhood of a critical (n−1)-sphere disconnects S^n into two components, each of which must by induction contain further critical (n−1)-spheres, leading by finiteness to a component without critical points, which must then be a product ∂ × I — contradicting the single-boundary topology. The argument is clean and standard.",
      "id": "C11",
      "location": "Chapter III, Theorem 3.5 (3.5) and its proof.",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Theorem 3.4 (3.4) (round-function classification on 3-manifolds): every closed 3-manifold admits a round function; round category-2 exact functions exist on S^3, RP^3, S^1 × S^2, lens spaces; T^3 admits an exact round function with 3 critical circles; on all other closed 3-manifolds round functions exist with ≤ 4 singularities.",
      "evidence": "The genus-1 Heegaard cases are handled cleanly by gluing two solid tori with f, −f + const. The T^3 case is correctly tied to Corollary 2.17 (2.16). For higher-genus Heegaard splittings the proof cuts each handlebody into two solid tori (Fig. 1.8) and constructs f on M_1 with two critical circles by 'an appropriate filtration of M_1', then extends by 2a − f on M_2. The four-circle count is plausible but the proof relies on figure 1.8 (not present in extracted text) for the cutting and on Theorem 2.6 (2.5) implicitly — the verification that the filtration of M_1 satisfies hypothesis (4) of Theorem 2.6 (covering by three subsets as in Proposition 2.4) is not spelled out for arbitrary genus.",
      "id": "C12",
      "location": "Chapter III, Theorem 3.4 (3.4) and its proof.",
      "severity": "minor",
      "suggested_fix": "Spell out the filtration of M_1 (a handlebody of genus g ≥ 2) into two pieces such that each layer admits the three-piece covering required by Proposition 2.4, and explicitly compute that the total number of critical circles is ≤ 4."
    },
    {
      "assessment": "supported",
      "claim": "Theorem 3.3 (3.3) (round-function classification on 2-manifolds, with exact counts).",
      "evidence": "The torus and Klein bottle cases use the explicit function f = x_1 on the standard embedding, which clearly has two critical circles (max and min, both circles). The annulus and Möbius band case uses f = (x_3 − 0.5)^2 with a single critical circle. The remaining cases follow from Proposition 1.13 (1.11) (round category) plus Theorem 2.13 (2.12). Exactness matches the round-category lower bound. The argument is correct.",
      "id": "C13",
      "location": "Chapter III, Theorem 3.3 (3.3) and its proof.",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Proposition 2.2 (2.2) (auxiliary function-modification result used in the existence proofs): given f on P × R^{n−p} with P in a level surface and f critical-point-free outside a compact set, there exists F differing from f only on a compact set with P its unique critical submanifold.",
      "evidence": "The construction uses Takens' λ-function (cited verbatim) and an explicit H built from nested tubular neighbourhoods via the cutoff φ_{r_0 − r_i}. Properties (1)–(6) of λ and H are stated and the derivative ⟨dF, grad f⟩ is shown positive off P. The key gap is in the convergence of the series λ = Σ a_i λ_i and H = Σ b_i h_i to differentiable functions: the choice β_i = 2^{-i}/(γ_i + 1) with γ_i the sup of all partial derivatives up to order i is presented as a Takens-style bound, but the differentiability claim for the series sum requires uniform convergence of all partial-derivative series, which is not explicitly verified here. The argument is plausible and follows Takens 1968 closely.",
      "id": "C14",
      "location": "Chapter II, Proposition 2.2 (2.2) and its proof.",
      "severity": "minor",
      "suggested_fix": "Either provide an explicit reference to the precise lemma in Takens 1968 (page/section) justifying differentiability, or include a one-paragraph estimate showing uniform convergence of all derivative series by the chosen β_i."
    },
    {
      "assessment": "unsupported",
      "claim": "Proof-as-code axiom: the load-bearing theorems (Theorems 1.5, 1.7, 1.13, 1.14, 2.5, 2.12, 2.15, 2.17, 3.4, 3.6) are entirely natural-language; no formal-proof artifact (Lean/Coq/Agda/Isabelle) accompanies the paper.",
      "evidence": "This is a math.* paper (algebraic/differential topology, Morse-theoretic). The headline results are amenable to mechanical verification: the P-category framework consists of finite combinatorial inequalities over cohomology rings of products of spheres and tori, the L-S-type lower bound 1.5 reduces to a long-exact-sequence + intersection-product argument, and the inequality cat M = r+1 (Theorem 1.13) is already formalised in part in mathlib (Lyusternik–Schnirelmann category of products). The paper ships no Lean/Coq/Agda development, nor any computational verification (e.g., a Lean witness that long^p T^n = n − p for specific small n, or a sage/python script generating the explicit cycles in Theorem 1.7). Per the proof-as-code axiom for code-amenable fields, the absence of any executable artifact is a documented weakness even though the paper is a translation of a 1993 dissertation.",
      "id": "C15",
      "location": "Whole paper; affects Theorems 1.5, 1.7, 1.13, 1.14, 2.5, 2.12, 2.15, 2.17, 3.4, 3.6.",
      "severity": "major",
      "suggested_fix": "Ship at minimum a Lean 4 / mathlib4 file formalising the main inequality of Theorem 1.5 in the special case P = point (recovering the classical Lyusternik–Schnirelmann bound), and one for Theorem 1.14 in low dimensions (e.g., S^k × S^l). Candidate paths: src/proofs/PCategory/MainInequality.lean and src/proofs/PCategory/ProductOfSpheres.lean. Alternatively, ship a small Python/Sage notebook computing long^p, cat, and P-cat for the explicit manifolds discussed (T^n, S^{k_1}×…×S^{k_r}) and verifying the inequalities for n ≤ 5."
    }
  ],
  "confidence": 0.72,
  "overall_correctness": "mostly_sound"
}
```

## Corrections

<!-- corrections-section: rendered from corrections table; empty on first publish -->
_No corrections have been recorded._

## Bibliography

1. arnold-varchenko-gusein-1982: author = Арнольд, В. И. and Варченко, А. Н. and Гусейн-заде, С. М., title = Особенности дифференцируемых отображений: в 2 т., publisher = Наука, address = М., year = 1982, volume = 1, langid = russian,
2. ganea-1961: author = Ganea, T., title = Оценка сверху для категории Люстерника--Шнирельмана, journal = Докл.\ АН СССР, year = 1961, volume = 136, number = 6, pages = 1273--1276, langid = russian,
3. golubitsky-guillemin-1977: author = Голубицкий, М. and Гийемин, В., title = Устойчивые отображения и их особенности, publisher = Мир, address = М., year = 1977, pagetotal = 290, langid = russian,
4. dubrovin-novikov-fomenko-1984: author = Дубровин, Б. А. and Новиков, С. П. and Фоменко, А. Т., title = Современная геометрия. Методы теории гомологий, publisher = Наука, address = М., year = 1984, pagetotal = 344, langid = russian,
5. lyusternik-shnirelman-1935: author = Люстерник, Л. А. and Шнирельман, Л. Г., title = Применение топологии к экстремальным задачам, booktitle = Труды Второго Всес.\ мат.\ съезда, year = 1935, pages = 224--237, langid = russian,
6. lyusternik-shnirelman-1930: author = Люстерник, Л. А. and Шнирельман, Л. Г., title = Топологические методы в вариационных задачах, address = М., year = 1930, langid = russian,
7. matveev-fomenko-sharko-1988: author = Матвеев, С. В. and Фоменко, А. Т. and Шарко, В. В., title = Круглые функции Морса и изоэнергетические поверхности интегрируемых гамильтоновых систем, journal = Мат.\ сб., year = 1988, volume = 135, number = 3, pages = 325--345, langid = russian, doi = 10.1070/SM1989v063n02ABEH003276, doi:[10.1070/SM1989v063n02ABEH003276](https://doi.org/10.1070/SM1989v063n02ABEH003276)
8. milnor-morse-1965: author = Милнор, Д., title = Теория Морса, publisher = Мир, address = М., year = 1965, pagetotal = 182, langid = russian,
9. fomenko-1983: author = Фоменко, А. Т., title = Дифференциальная геометрия и топология. Дополнительные главы, publisher = Изд-во Моск.\ ун-та, address = М., year = 1983, pagetotal = 217, langid = russian,
10. fomenko-1988: author = Фоменко, А. Т., title = Симплектическая геометрия. Методы и приложения, publisher = Изд-во Моск.\ гос.\ ун-та, address = М., year = 1988, pagetotal = 413, langid = russian,
11. fomenko-sharko-1989: author = Фоменко, А. Т. and Шарко, В. В., title = Точные круглые функции Морса, неравенства типа Морса и интегралы гамильтоновых систем, journal = Укр.\ мат.\ журн., year = 1989, volume = 41, number = 6, pages = 352--361, langid = ukrainian, doi = 10.1007/BF01060557, doi:[10.1007/BF01060557](https://doi.org/10.1007/BF01060557)
12. chogoshvili-1939: author = Чогошвили, Г. С., title = О поверхностях уровня и областях меньших значений функции, заданной на ограниченном многообразии, journal = Докл.\ АН СССР, year = 1939, volume = 24, number = 3, pages = 635--639, langid = russian,
13. sharko-1990: author = Шарко, В. В., title = Функции на многообразиях (алгебраические и топологические аспекты), publisher = Наук.\ думка, address = Київ, year = 1990, pagetotal = 196, langid = ukrainian,
14. sharko-1981: author = Шарко, В. В., title = Точные функции Морса на односвязных многообразиях с неодносвязным краем, journal = Успехи мат.\ наук, year = 1981, volume = 36, number = 5, pages = 205--206, langid = russian, doi = 10.1070/RM1981v036n05ABEH003053, doi:[10.1070/RM1981v036n05ABEH003053](https://doi.org/10.1070/RM1981v036n05ABEH003053)
15. asimov-1975: author = Asimov, D., title = Round handles and non-singular Morse--Smale flows, journal = Ann. Math., year = 1975, volume = 102, number = 1, pages = 41--54, doi = 10.2307/1970972, doi:[10.2307/1970972](https://doi.org/10.2307/1970972)
16. borsuk-1936: author = Borsuk, K., title = Über den Lusternik--Schnirelmannschen Begriff der Kategorie, journal = Fund. Math., year = 1936, volume = 26, pages = 123--136, langid = german, url = https://eudml.org/doc/212789,
17. bott-1982: author = Bott, R., title = Lectures on Morse theory, old and new, journal = Bull. Amer. Math. Soc., year = 1982, volume = 7, number = 2, pages = 331--358, doi = 10.1090/S0273-0979-1982-15038-8, doi:[10.1090/S0273-0979-1982-15038-8](https://doi.org/10.1090/S0273-0979-1982-15038-8)
18. fox-1953: author = Fox, R., title = Free differential calculus, I, journal = Ann. Math., year = 1953, volume = 57, number = 3, pages = 517--560, doi = 10.2307/1969736, doi:[10.2307/1969736](https://doi.org/10.2307/1969736)
19. fox-1941: author = Fox, R., title = On the Lusternik--Schnirelmann category, journal = Annals of Math., year = 1941, volume = 42, number = 2, doi = 10.2307/1968905, doi:[10.2307/1968905](https://doi.org/10.2307/1968905)
20. frank-1988: author = Frank, G., title = Templates and train tracks, journal = Trans. Amer. Math. Soc., year = 1988, volume = 308, number = 2, pages = 765--784, doi = 10.1090/S0002-9947-1988-0951627-9, doi:[10.1090/S0002-9947-1988-0951627-9](https://doi.org/10.1090/S0002-9947-1988-0951627-9)
21. franks-1980: author = Franks, J., title = Homology and dynamical systems, journal = Regional conference series in math., year = 1980, volume = 49, pages = 3--120,
22. franks-1978: author = Franks, J., title = The periodic behevior of non-singular Morse--Smale flows, journal = Comment. math. helv., year = 1978, volume = 53, number = 2, pages = 279--294, doi = 10.1007/BF02566078, doi:[10.1007/BF02566078](https://doi.org/10.1007/BF02566078)
23. froloff-elsholz-1935: author = Froloff, S. and Elsholz, L., title = Limite inférieure pour le nombre des valeurs critiques d'une fonction, donnée sur une variété, journal = Мат.\ сб., year = 1935, volume = 42, number = 5, pages = 637--643, langid = french,
24. ganea-1967: author = Ganea, T., title = Lusternik--Schnirelmann category and strong category, journal = Illinois journal of Math., year = 1967, volume = 11, number = 2, pages = 417--427, doi = 10.1215/ijm/1256054563, doi:[10.1215/ijm/1256054563](https://doi.org/10.1215/ijm/1256054563)
25. miyoshi-1983: author = Miyoshi, S., title = Foliated round surgery of codimension-one foliated manifolds, journal = Topology, year = 1983, volume = 21, number = 3, pages = 245--262,
26. morgan-1979: author = Morgan, J. W., title = Non-singular Morse--Smale flows on 3-dimensional manifolds, journal = Topology, year = 1979, volume = 18, number = 1, pages = 41--53, doi = 10.1016/0040-9383(79)90013-2, doi:[10.1016/0040-9383(79)90013-2](https://doi.org/10.1016/0040-9383(79)90013-2)
27. morse-1925: author = Morse, M., title = Relations between the critical points of a real function of $n$ variables, journal = Trans. Amer. Math. Soc., year = 1925, volume = 27, pages = 345--396, doi = 10.2307/1989110, doi:[10.2307/1989110](https://doi.org/10.2307/1989110)
28. morse-1934: author = Morse, M., title = The calculus of variations in the large, address = New York, year = 1934, pagetotal = 352,
29. reeb-1947: author = Reeb, G., title = Sur les variétés niveau d'une fonction numerique, journal = C. R. Acad. Sci. Paris, year = 1947, volume = 224, number = 46, pages = 1324--1325, langid = french,
30. sharko-1984: author = Sharko, V. V., title = Minimal Morse functions, journal = Lect. Notes Math., year = 1984, number = 108, pages = 218--234, doi = 10.1007/BFb0099560, doi:[10.1007/BFb0099560](https://doi.org/10.1007/BFb0099560)
31. singhof-1979: author = Singhof, W., title = Minimal coverings of manifolds with balls, journal = Manuscr. Math., year = 1979, volume = 29, pages = 385--415, doi = 10.1007/BF01303636, doi:[10.1007/BF01303636](https://doi.org/10.1007/BF01303636)
32. takens-1970: author = Takens, F., title = The Lusternik--Schnirelman categories of a product space, journal = Compositio Math., year = 1970, volume = 22, number = 2, pages = 175--180, note = Fasc. 2, url = https://www.numdam.org/item/CM_1970__22_2_175_0/,
33. takens-1968: author = Takens, F., title = The minimal number of critical points of a function on a compact manifold and the Lusternik--Schnirelman category, journal = Inventiones math., year = 1968, volume = 6, pages = 197--244, doi = 10.1007/BF01404825, doi:[10.1007/BF01404825](https://doi.org/10.1007/BF01404825)
34. thom-1949: author = Thom, R., title = Sur une partition en cellules associee a une fonction sur une variete, journal = C. R. Acad. Sci. Paris, year = 1949, volume = 228, pages = 973--975, series = A, langid = french,
35. thurston-1976: author = Thurston, W., title = Existence of codimension-one foliations, journal = Ann. Math., year = 1976, volume = 104, number = 2, pages = 249--268, doi = 10.2307/1971047, doi:[10.2307/1971047](https://doi.org/10.2307/1971047)
36. wilson-1966: author = Wilson, F., title = On the minimal sets of non-singular vector fields, journal = Ann. of Math., year = 1966, volume = 84, pages = 529--536, doi = 10.2307/1970458, doi:[10.2307/1970458](https://doi.org/10.2307/1970458)
37. birkhoff-1917: author = Birkhoff, G., title = Dynamical systems with two degrees of freedom, journal = Trans. Amer. Math. Soc., year = 1917, volume = 18, number = 4, pages = 199--300, doi = 10.1090/S0002-9947-1917-1501070-3, doi:[10.1090/S0002-9947-1917-1501070-3](https://doi.org/10.1090/S0002-9947-1917-1501070-3)
38. smale-1964: author = Смейл, С., title = О строении многообразий, journal = Математика, year = 1964, volume = 8, number = 4, pages = 95--108, langid = russian, doi = 10.2307/2372978, note = Перевод с английского: Smale S. ``On the structure of manifolds'', Amer.\ J.\ Math.\ 84 (1962), 387--399., doi:[10.2307/2372978](https://doi.org/10.2307/2372978)
39. milnor-difftop: author = Милнор, Д., title = Дифференциальная топология, journal = Успехи мат.\ наук, volume = XX, number = 6(126), pages = 41--54, langid = russian,
40. fomenko-brailov-1987: author = Фоменко, А. Т. and Браилов, А. В., title = Топология интегральных многообразий вполне интегрируемых гамильтоновых систем, journal = Мат.\ сб., year = 1987, volume = 133, number = 3, pages = 375--385, langid = russian, doi = 10.1070/SM1989v062n02ABEH003244, doi:[10.1070/SM1989v062n02ABEH003244](https://doi.org/10.1070/SM1989v062n02ABEH003244)
41. fomenko-cishang-1987: author = Фоменко, А. Т. and Цишанг, Х., title = О топологии трехмерных многообразий, возникающих в гамильтоновой механике, journal = Докл.\ АН СССР, year = 1987, volume = 294, number = 2, pages = 283--287, langid = russian,
42. frolov-elsgolts-1939: author = Фролов, С. В. and Эльсгольц, Л. Э., title = Длина многообразия и её свойства, journal = Мат.\ сб., year = 1939, volume = 5(47), number = 3, pages = 565--570, langid = russian, url = https://eudml.org/doc/65079,

