# Homotopy transfers of curved $L_\infty$ algebras

GrokRxiv review of [arXiv:2606.23965](https://arxiv.org/abs/2606.23965) · `math.DG`

_Authors_: Shuhan Jiang

## TL;DR

The paper contributes to derived geometry by proving that L∞ spaces over a dg manifold form a category of fibrant objects (CFO), with the proof organized via a Serre-Swan-type reduction to the algebraic category L∞Alg(R_M)_fgp. The technical correctness specialist rated the overall correctness as mostly_sound at confidence 0.55; the argument is internally coherent with several lemmas (Lemma 24, Lemma 41, Propositions 38 and 44) fully verified. However, the central load-bearing Lemma 16 (= Proposition 2.6 of [cattaneojiang26]) is imported from a companion paper dated 2026 that carries no arXiv ID, no DOI, and is not yet publicly accessible; this single gap propagates through Proposition 15, Proposition 18, and Theorem 1. The reproducibility specialist (confidence 0.86, score 0.25) flagged a critical absence of any formal proof artifact for the headline theorem and major absences for the homotopy transfer construction and the algebroid implication. The novelty specialist (confidence 0.68, score 0.65) judged the contribution incremental: the extension of HPT to curved L∞ algebras over filtered cdgas and the resulting CFO structure are genuine but build closely on Getzler 2025 and Berglund 2014. Citation practice is tight and technically engaged (citation confidence 0.80) aside from the unlocatable companion paper and the unpublished sardanashvily2001remark preprint. The recommendation gate applies: the paper is in math.* and both technical_correctness (C2, C13 at major severity) and reproducibility (critical and major concerns) flagged missing proof-as-code artifacts; recommendation defaults to major_revision. Resolution of Lemma 16 and provision of at least a minimal machine-checkable supplement would substantially strengthen the paper.

_Recommendation_: **Major revision** · _Confidence_: 72%

## Strengths

- The proof architecture is modular and clean: the geometric CFO problem is reduced to an algebraic one via Propositions 14-15-18, with Propositions 23 and 27 supplying the pullback and simplicial-frame axioms and Theorem 30 assembling the CFO structure.
- The appendix extension of homological perturbation theory to the curved L∞ setting over filtered cdgas (Propositions 38 and 44, Lemma 41) is detailed and self-contained, with Berglund's Green's operator formula and symmetrized tensor trick adapted carefully to preserve the curvature term l_0.
- Lemma 24 (every fibration is strict up to isomorphism), Proposition 38 (basic perturbation lemma for curved complexes), and Proposition 44 (HTT for curved L∞ algebras) are each fully verified by the technical correctness specialist with no open gaps.
- The choice of side condition [h, r] = 0 is explicitly motivated and contrasted with the Amorim-Tu approach in Remark 35, providing honest attribution of a technical design decision.
- The bibliography is tightly curated and technically engaged: all 16 references are used at the theorem or lemma level, and the filtration convention difference from Getzler 2025 is proactively flagged in a footnote.

## Weaknesses

- Lemma 16 (= Proposition 2.6 of [cattaneojiang26]), load-bearing for Proposition 15 and hence for Proposition 18 and Theorem 1, is imported from a companion paper that has no arXiv ID, no DOI, and is dated 2026; independent readers cannot verify this input and it remains the single most consequential open gap in the manuscript.
- No formal proof artifact, mechanized formalization, or symbolic-computation supplement is provided for the paper's load-bearing combinatorial identities (Lemma 41, Lemma 43) or the CFO axiom verification (Propositions 23, 27, 28), despite these being mechanizable statements whose trust value is heightened by the unverifiable companion-paper dependency.
- The local isomorphism step in Lemma 17's proof—asserting that the constructed map is locally an isomorphism and therefore globally an isomorphism by filtration completeness—is sketched rather than written out, leaving a gap in the structural theorem for locally free Ω_M-hat modules.
- The simplicial-object structure in Proposition 27 (face and degeneracy compatibility for varying n) is left implicit, with the paper relying on the claim without explicitly tracing it to the cosimplicial structure of Dupont's contraction.
- The paper does not situate its L∞ algebroids over dg manifolds relative to shifted or derived Lie algebroids studied in derived algebraic geometry (e.g., Nuiten; Calaque-Pantev-Toën-Vaquié-Vezzosi), leaving the relationship to that literature unaddressed.

## Revision Targets

- [ ] **Code release and entrypoints**
  - Location: code/reproducibility artifacts: `code release and execution entrypoints`
  - Evidence: The homotopy transfer construction for curved L_infinity algebras over filtered cdgas is load-bearing for the paper but is supplied only as manuscript proof text; a proof-checkable artifact such as formal/HomotopyTransferCurvedLInfinity.lean is not provided.
  - Required change: Release the source code, scripts, model configuration, and execution entrypoints needed to regenerate the reported tables, or document why those artifacts cannot be released.
  - Verification: Re-review should confirm runnable code or a documented non-release justification is present.
- [ ] **Manuscript: Throughout the paper (no Code Availability / Artifact statement)**
  - Location: `Throughout the paper (no Code Availability / Artifact statement)`
  - Evidence: The paper's load-bearing combinatorial identities (Lemma 41's Green's-operator formula, the (1/m) Σ_{ε_1=0} C(m-1,|ε|)^{-1} = 1 identity in the proof of Lemma 43, the conjugation algebra in Proposition 38, the explicit (solpsi)/l_1 formulas in the proof of Proposition 23) and the coderivation/coalgebra-morphism identities for HPT are exactly the kind of statements that can and have been mechanized in proof assistants (Coq, Lean, Agda) or verified symbolically (e.g., in Mathematica/SymPy with a Koszul-sign-aware library). The companion paper [cattaneojiang26] is also unavailable for cross-checking, increasing the value of a machine-checked artifact. No such artifact is shipped or referenced.
  - Required change: Provide a companion repository, e.g. src/proofs/HPT.lean formalizing Lemmas 41, 43 and Proposition 38, and src/proofs/CFO.lean formalizing the CFO axioms for L∞Alg(R)_fgp (Definitions 22, 29; Propositions 23, 27, 28). At minimum, a SymPy or Mathematica script src/checks/berglund_green.py numerically verifying the Green's operator identity for n ≤ 8 would substantiate Lemma 41 and the binomial identity in Lemma 43.
  - Verification: Re-review should confirm `Throughout the paper (no Code Availability / Artifact statement)` is corrected or justified.
- [ ] **Manuscript: Section 'Global sections functors', Lemma 17 and proof**
  - Location: `Section 'Global sections functors', Lemma 17 and proof`
  - Evidence: The proof picks E := Gr^0 g, uses fineness + local-freeness to split 0 → F^1 g → g → E → 0, then builds \tilde ι: \hat{Ω}_M ⊗ E → g and asserts it is 'locally an isomorphism, hence an isomorphism' by completeness of the filtration. The local isomorphism step is sketched rather than written out; one should check that on a local trivialization the induced map is the identity plus a filtration-raising correction and invoke completeness explicitly.
  - Required change: Expand the final paragraph: pick local frames of g and E, write out the comparison matrix in terms of the F^p decomposition, and apply the geometric series argument used elsewhere in the paper (cf. the (id + ṡ(ρ-ρ̃_0))^{-1} step in Proposition 15's proof).
  - Verification: Re-review should confirm `Section 'Global sections functors', Lemma 17 and proof` is corrected or justified.
- [ ] **Manuscript: Section 'Main results', Proposition 27 and proof**
  - Location: `Section 'Main results', Proposition 27 and proof`
  - Evidence: The factorization at the level of curved L∞ algebras over R is constructed from Dupont's contraction (Lemma 25) lifted via the homotopy transfer of Appendix 6. The unary component of the right-hand map is identified with W_n^♯ → R^{n+1} (vertex evaluations), which is surjective, giving a fibration. The commutativity of the diagram is verified using the identity (i_μ)_n∘(p_μ)_n = id - [D_n, (s_μ)_n] and the side conditions s_n∘ι_n = ev_n∘s_n = 0. The argument relies on Proposition 44 of the appendix; assuming that result, the proof is essentially correct, but the verification of the simplicial-object structure (face/degeneracy compatibility for varying n) is left implicit.
  - Required change: State explicitly that the functoriality in n (face/degeneracy operators) is inherited from Dupont's contraction being compatible with the cosimplicial structure on Ω_•, citing the relevant lemma in [getzler2009] or [getzler2025…].
  - Verification: Re-review should confirm `Section 'Main results', Proposition 27 and proof` is corrected or justified.
- [ ] **Bibliography: Works on dg-Lie algebroids and derived geometry (e.g., Nuiten or Calaque–Pantev–Toën–Vaquié–V...**
  - Location: bibliography entry: `Works on dg-Lie algebroids and derived geometry (e.g., Nuiten or Calaque–Pantev–Toën–Vaquié–Vezzosi)`
  - Evidence: The paper works with $L_\infty$ algebroids over dg manifolds, a notion that overlaps with shifted/derived Lie algebroids studied in derived algebraic geometry; relevant foundational work in that tradition is not cited, which would help readers place the results in the broader landscape of derived geometry.
  - Required change: Add or discuss missing prior art `Works on dg-Lie algebroids and derived geometry (e.g., Nuiten or Calaque–Pantev–Toën–Vaquié–Vezzosi)`. The paper works with $L_\infty$ algebroids over dg manifolds, a notion that overlaps with shifted/derived Lie algebroids studied in derived algebraic geometry; relevant foundational work in that tradition is not cited, which would help readers place the results in the broader landscape of derived geometry.
  - Verification: Re-review should confirm the related-work discussion addresses this prior art.

## Open Questions

- Can the authors either reproduce the proof of Lemma 16 inline (it is a graded Serre-Swan argument for the structure sheaf of a dg manifold) or supply a publicly accessible arXiv identifier or DOI for [cattaneojiang26] so that this load-bearing input can be independently verified before publication?
- Would the authors consider providing a minimal machine-checkable supplement—such as a SymPy or Mathematica script verifying Lemma 41's Green's operator identity for n ≤ 8 and the binomial identity in Lemma 43's proof—to partially address the reproducibility gap created by the absent companion paper?
- In Lemma 17, can the authors make explicit the local isomorphism argument: writing out the comparison matrix of the map ι-tilde in local frames of g and E in terms of the F^p decomposition, and applying the geometric-series invertibility argument used elsewhere in the paper?
- Does the simplicial-frame construction in Proposition 27 produce a genuine simplicial object in L∞Alg(R)_fgp for all n? If so, can the authors explicitly state that face and degeneracy compatibility follows from Dupont's contraction being compatible with the cosimplicial structure on Ω_•, with a citation to the relevant lemma in Getzler 2009 or Getzler 2025?
- How does the CFO structure for L∞ spaces over dg manifolds established here relate to the homotopy theory of shifted Lie algebroids in derived algebraic geometry? Is there a comparison functor or an embedding of one framework into the other?

## Per-Agent Reviews

### citation (`claude-sonnet-4-6`) — status: `warn`

```json
{
  "confidence": 0.8,
  "entries": [
    {
      "citation": {
        "arxiv_id": "2006.01376",
        "authors": [
          "Behrend, Kai",
          "Liao, Hsuan-Yi",
          "Xu, Ping"
        ],
        "doi": null,
        "key": "Behrend2020thx",
        "raw": "Behrend2020thx: author=Behrend, Kai, author=Liao, Hsuan-Yi, author=Xu, Ping, title=Derived Differentiable Manifolds, date=2020, eprint=2006.01376,",
        "title": "Derived Differentiable Manifolds",
        "url": null,
        "venue": null,
        "year": 2020
      },
      "exists": null,
      "explanation": "Cited alongside carchedi2023 to support the background claim that dg manifolds form a category of fibrant objects. Directly relevant as prior work establishing the CFO structure on the base category that this paper's total CFO question concerns.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Amorim, Lino",
          "Tu, Junwu"
        ],
        "doi": null,
        "key": "amorim2022inverse",
        "raw": "amorim2022inverse: title=The inverse function theorem for curved L-infinity spaces., author=Amorim, Lino, author=Tu, Junwu, journal=Journal of Noncommutative Geometry, volume=16, number=4, date=2022",
        "title": "The inverse function theorem for curved L-infinity spaces.",
        "url": null,
        "venue": "Journal of Noncommutative Geometry",
        "year": 2022
      },
      "exists": null,
      "explanation": "Cited in the appendix on homological perturbation of curved complexes because it introduces the same notion of strong deformation retract for curved L-infinity spaces over manifolds. Directly relevant as closely related prior work on homotopy transfers in the curved setting.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Berglund, Alexander"
        ],
        "doi": null,
        "key": "berglund2014homological",
        "raw": "berglund2014homological: title=Homological perturbation theory for algebras over operads, author=Berglund, Alexander, journal=Algebraic & Geometric Topology, volume=14, number=5, pages=2511--2548, date=2014, publisher=Mathematical Sciences Publishers",
        "title": "Homological perturbation theory for algebras over operads",
        "url": null,
        "venue": "Algebraic & Geometric Topology",
        "year": 2014
      },
      "exists": null,
      "explanation": "The primary reference for the homotopy transfer theorem (HTT) in the appendix. The paper credits Berglund with the explicit formula for the transferred structure and the symmetrized tensor trick, and the HTT proof follows Berglund's approach directly.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Brown, Kenneth S."
        ],
        "doi": null,
        "key": "brown1973abstract",
        "raw": "brown1973abstract: title=Abstract homotopy theory and generalized sheaf cohomology, author=Brown, Kenneth S., journal=Transactions of the American Mathematical Society, volume=186, pages=419--458, date=1973",
        "title": "Abstract homotopy theory and generalized sheaf cohomology",
        "url": null,
        "venue": "Transactions of the American Mathematical Society",
        "year": 1973
      },
      "exists": null,
      "explanation": "Foundational paper introducing categories of fibrant objects (CFO), the central structural notion of this paper. The citation is precise and appropriate.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2303.11140",
        "authors": [
          "Carchedi, David"
        ],
        "doi": null,
        "key": "carchedi2023derivedmanifoldsdifferentialgraded",
        "raw": "carchedi2023derivedmanifoldsdifferentialgraded: author=Carchedi, David, title=Derived Manifolds as Differential Graded Manifolds, date=2023, eprint=2303.11140,",
        "title": "Derived Manifolds as Differential Graded Manifolds",
        "url": null,
        "venue": null,
        "year": 2023
      },
      "exists": null,
      "explanation": "Cited alongside Behrend2020thx to establish that dg manifolds form a CFO, a key motivating context for the paper's main theorem. Directly relevant.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Cattaneo, Alberto S.",
          "Jiang, Shuhan"
        ],
        "doi": null,
        "key": "cattaneojiang26",
        "raw": "cattaneojiang26: author = Cattaneo, Alberto S., author = Jiang, Shuhan, title = From $L_\\infty$ algebroids to $L_\\infty$ spaces: Part I, date = 2026,",
        "title": "From $L_\\infty$ algebroids to $L_\\infty$ spaces: Part I",
        "url": null,
        "venue": null,
        "year": 2026
      },
      "exists": null,
      "explanation": "Essential companion paper establishing the equivalence between L-infinity algebroids and L-infinity spaces that underpins this paper's main result, and supplying Proposition 2.6 used directly in the proof of Proposition 15. Cited correctly and frequently throughout, but absence of an arXiv ID limits verifiability.",
      "notes": "No arXiv identifier or DOI is provided for this companion paper (date 2026). Specific results from it (in particular Proposition 2.6, cited as Lemma 16 in this paper) are used crucially in the proofs. As a concurrent companion preprint that may not yet be publicly available, independent readers cannot verify those results.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "1112.0816",
        "authors": [
          "Costello, Kevin"
        ],
        "doi": null,
        "key": "costello2011geometric",
        "raw": "costello2011geometric: author=Costello, Kevin, title=A geometric construction of the Witten genus, II, date=2011, eprint=1112.0816,",
        "title": "A geometric construction of the Witten genus, II",
        "url": null,
        "venue": null,
        "year": 2011
      },
      "exists": null,
      "explanation": "Source of the original notion of L-infinity spaces over smooth manifolds and their weak equivalences that the companion paper and this paper adapt to the dg manifold setting. The citation is accurate and foundational.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Dupont, Johan L"
        ],
        "doi": null,
        "key": "dupont1976simplicial",
        "raw": "dupont1976simplicial: title=Simplicial de Rham cohomology and characteristic classes of flat bundles, author=Dupont, Johan L, journal=Topology, volume=15, number=3, pages=233--245, date=1976, publisher=Pergamon",
        "title": "Simplicial de Rham cohomology and characteristic classes of flat bundles",
        "url": null,
        "venue": "Topology",
        "year": 1976
      },
      "exists": null,
      "explanation": "Cited for Dupont's contraction formula used to retract polynomial differential forms onto the Whitney complex, a key ingredient in the simplicial frame construction. The citation is precise and the attribution is standard.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Getzler, Ezra"
        ],
        "doi": null,
        "key": "getzler2009",
        "raw": "getzler2009: author=Getzler, Ezra, title=Lie theory for nilpotent $L_\\infty$-algebras, journal=Annals of Mathematics, volume=170, number=1, date=2009, pages=271--301,",
        "title": "Lie theory for nilpotent $L_\\infty$-algebras",
        "url": null,
        "venue": "Annals of Mathematics",
        "year": 2009
      },
      "exists": null,
      "explanation": "Cited for techniques from L-infinity algebra theory adapted in this paper, and specifically for Lemma 3.4 and Theorem 3.11 establishing the side conditions of the Dupont contraction. A foundational reference used correctly.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2408.11157",
        "authors": [
          "Getzler, Ezra"
        ],
        "doi": null,
        "key": "getzler2025higherholonomycurvedlinftyalgebras",
        "raw": "getzler2025higherholonomycurvedlinftyalgebras: author=Getzler, Ezra, title=Higher holonomy for curved $L_\\infty$-algebras 1: simplicial methods, date=2025, eprint=2408.11157,",
        "title": "Higher holonomy for curved $L_\\infty$-algebras 1: simplicial methods",
        "url": null,
        "venue": null,
        "year": 2025
      },
      "exists": null,
      "explanation": "Most closely related prior work on curved L-infinity algebras with simplicial methods. Cited for the pullback proof strategy, for Theorem 4.1 on HTT, and to contrast filtration conventions. Highly relevant and used with appropriate precision.",
      "notes": "A footnote explicitly flags that the filtration on CE(g) used in this paper differs from the pro-nilpotent setting of this reference. This is a helpful and honest attribution of a technical divergence.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Hovey, Mark"
        ],
        "doi": null,
        "key": "hovey2007model",
        "raw": "hovey2007model: title=Model Categories, author=Hovey, Mark, number=63, date=2007, publisher=American Mathematical Soc.,",
        "title": "Model Categories",
        "url": null,
        "venue": "American Mathematical Soc.",
        "year": 2007
      },
      "exists": null,
      "explanation": "Cited for Theorem 5.2.8, which states that every model category admits a framing, providing background context for the paper's construction of a framing on the CFO of L-infinity algebras. Standard textbook reference used appropriately.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Morye, Archana S"
        ],
        "doi": null,
        "key": "morye2013note",
        "raw": "morye2013note: title=Note on the Serre-Swan theorem, author=Morye, Archana S, journal=Mathematische Nachrichten, volume=286, number=2-3, pages=272--278, date=2013, publisher=Wiley Online Library",
        "title": "Note on the Serre-Swan theorem",
        "url": null,
        "venue": "Mathematische Nachrichten",
        "year": 2013
      },
      "exists": null,
      "explanation": "Cited as the primary reference for the global sections functor formalism in the setting of ringed spaces, with Lemma 2.3 and Proposition 2.5 used directly in the proof of Lemma 13. Highly relevant and precisely cited.",
      "notes": "A footnote clarifies that the exposition in Morye 2013 is for (locally) ringed spaces and that the extension to graded ringed spaces is straightforward. This is a responsible qualification.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Rogers, Christopher L"
        ],
        "doi": null,
        "key": "rogers2020explicit",
        "raw": "rogers2020explicit: title=An explicit model for the homotopy theory of finite-type Lie n--algebras, author=Rogers, Christopher L, journal=Algebraic & Geometric Topology, volume=20, number=3, pages=1371--1429, date=2020, publisher=Mathematical Sciences Publishers",
        "title": "An explicit model for the homotopy theory of finite-type Lie n--algebras",
        "url": null,
        "venue": "Algebraic & Geometric Topology",
        "year": 2020
      },
      "exists": null,
      "explanation": "Cited as a technique reference for L-infinity algebra homotopy theory in the introduction and as a secondary reference ('see also') for the pullback proof. Directly relevant to the paper's algebraic framework.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Rogers, Christopher L",
          "Zhu, Chenchang"
        ],
        "doi": null,
        "key": "rogers2020homotopy",
        "raw": "rogers2020homotopy: title=On the homotopy theory for Lie∞--groupoids, with an application to integrating L∞--algebras, author=Rogers, Christopher L, author=Zhu, Chenchang, journal=Algebraic & Geometric Topology, volume=20, number=3, pages=1127--1219, date=2020, publisher=Mathematical Sciences Publishers,",
        "title": "On the homotopy theory for Lie∞--groupoids, with an application to integrating L∞--algebras",
        "url": null,
        "venue": "Algebraic & Geometric Topology",
        "year": 2020
      },
      "exists": null,
      "explanation": "Cited in the introduction as motivating evidence that L-infinity groupoids in the Banach manifold setting form an incomplete CFO, supporting the expectation that the base and fiber CFO structures assemble into a total CFO. A relevant but peripheral motivating reference.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Rogers, Christopher L"
        ],
        "doi": null,
        "key": "rogers2023complete",
        "raw": "rogers2023complete: title=Complete $L_\\infty$-algebras and their homotopy theory, author=Rogers, Christopher L, journal=Journal of Pure and Applied Algebra, volume=227, number=10, pages=107403, date=2023, publisher=Elsevier,",
        "title": "Complete $L_\\infty$-algebras and their homotopy theory",
        "url": null,
        "venue": "Journal of Pure and Applied Algebra",
        "year": 2023
      },
      "exists": null,
      "explanation": "Cited alongside getzler2009 and rogers2020explicit as a key reference for techniques from the homotopy theory of (complete) L-infinity algebras over a field that are adapted to the filtered cdga setting. Directly relevant.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "math-ph/0102016",
        "authors": [
          "Sardanashvily, G"
        ],
        "doi": null,
        "key": "sardanashvily2001remark",
        "raw": "sardanashvily2001remark: title=Remark on the Serre-Swan theorem for non-compact manifolds, author=Sardanashvily, G, eprint=math-ph/0102016, date=2001",
        "title": "Remark on the Serre-Swan theorem for non-compact manifolds",
        "url": null,
        "venue": null,
        "year": 2001
      },
      "exists": null,
      "explanation": "Cited for the partition-of-unity refinement argument used in the proof of Lemma 13 (second condition). The attribution is specific and the argument is elementary; the citation is appropriate in context even if the source is an unpublished preprint.",
      "notes": "No journal venue is listed; this entry appears to be an arXiv preprint only (math-ph/0102016, 2001) with no known published version. As an unpublished preprint cited for a specific partition-of-unity argument, readers may have difficulty locating it through standard library access.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    }
  ],
  "missing_references": [
    {
      "reason": "The appendices develop homological perturbation theory for curved complexes and apply the basic perturbation lemma, but no source for the classical perturbation lemma itself (prior to Berglund 2014) is cited. A reference to the original perturbation lemma literature would strengthen provenance for readers unfamiliar with the technique.",
      "title": "Homological perturbation lemma (Gugenheim–Lambe–Stasheff or Brown 1967 original source)"
    }
  ],
  "summary": "The bibliography of 16 entries is well-curated and tightly aligned with the paper's content. All citations are used substantively: foundational references (Brown 1973, Getzler 2009, Dupont 1976) are cited at the precise lemma or theorem level, and closely related works (Berglund 2014, Getzler 2025, Rogers 2020/2023) are engaged with technically rather than decoratively. The main citation hygiene concern is the companion paper cattaneojiang26, which lacks an arXiv identifier and is dated 2026; several key results (including Proposition 2.6, used critically in Proposition 15) are attributed to it, making independent verification impossible at present. The sardanashvily2001remark entry is an unpublished arXiv preprint with no journal venue. One minor gap is the absence of a primary source for the classical basic perturbation lemma underlying the appendix constructions. Overall citation practice is accurate and appropriately specific."
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.72,
  "questions": [
    "Can the authors either reproduce the proof of Lemma 16 inline (it is a graded Serre-Swan argument for the structure sheaf of a dg manifold) or supply a publicly accessible arXiv identifier or DOI for [cattaneojiang26] so that this load-bearing input can be independently verified before publication?",
    "Would the authors consider providing a minimal machine-checkable supplement—such as a SymPy or Mathematica script verifying Lemma 41's Green's operator identity for n ≤ 8 and the binomial identity in Lemma 43's proof—to partially address the reproducibility gap created by the absent companion paper?",
    "In Lemma 17, can the authors make explicit the local isomorphism argument: writing out the comparison matrix of the map ι-tilde in local frames of g and E in terms of the F^p decomposition, and applying the geometric-series invertibility argument used elsewhere in the paper?",
    "Does the simplicial-frame construction in Proposition 27 produce a genuine simplicial object in L∞Alg(R)_fgp for all n? If so, can the authors explicitly state that face and degeneracy compatibility follows from Dupont's contraction being compatible with the cosimplicial structure on Ω_•, with a citation to the relevant lemma in Getzler 2009 or Getzler 2025?",
    "How does the CFO structure for L∞ spaces over dg manifolds established here relate to the homotopy theory of shifted Lie algebroids in derived algebraic geometry? Is there a comparison functor or an embedding of one framework into the other?"
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "The homotopy transfer construction for curved L_infinity algebras over filtered cdgas is load-bearing for the paper but is supplied only as manuscript proof text; a proof-checkable artifact such as formal/HomotopyTransferCurvedLInfinity.lean is not provided.",
      "id": "weakness-1",
      "locator": "code release and execution entrypoints",
      "required_update": "Release the source code, scripts, model configuration, and execution entrypoints needed to regenerate the reported tables, or document why those artifacts cannot be released.",
      "source_path": null,
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "code",
      "verification_check": "Re-review should confirm runnable code or a documented non-release justification is present.",
      "weakness_index": 0
    },
    {
      "evidence": "The paper's load-bearing combinatorial identities (Lemma 41's Green's-operator formula, the (1/m) Σ_{ε_1=0} C(m-1,|ε|)^{-1} = 1 identity in the proof of Lemma 43, the conjugation algebra in Proposition 38, the explicit (solpsi)/l_1 formulas in the proof of Proposition 23) and the coderivation/coalgebra-morphism identities for HPT are exactly the kind of statements that can and have been mechanized in proof assistants (Coq, Lean, Agda) or verified symbolically (e.g., in Mathematica/SymPy with a Koszul-sign-aware library). The companion paper [cattaneojiang26] is also unavailable for cross-checking, increasing the value of a machine-checked artifact. No such artifact is shipped or referenced.",
      "id": "weakness-2",
      "locator": "Throughout the paper (no Code Availability / Artifact statement)",
      "required_update": "Provide a companion repository, e.g. src/proofs/HPT.lean formalizing Lemmas 41, 43 and Proposition 38, and src/proofs/CFO.lean formalizing the CFO axioms for L∞Alg(R)_fgp (Definitions 22, 29; Propositions 23, 27, 28). At minimum, a SymPy or Mathematica script src/checks/berglund_green.py numerically verifying the Green's operator identity for n ≤ 8 would substantiate Lemma 41 and the binomial identity in Lemma 43.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Throughout the paper (no Code Availability / Artifact statement)` is corrected or justified.",
      "weakness_index": 1
    },
    {
      "evidence": "The proof picks E := Gr^0 g, uses fineness + local-freeness to split 0 → F^1 g → g → E → 0, then builds \\tilde ι: \\hat{Ω}_M ⊗ E → g and asserts it is 'locally an isomorphism, hence an isomorphism' by completeness of the filtration. The local isomorphism step is sketched rather than written out; one should check that on a local trivialization the induced map is the identity plus a filtration-raising correction and invoke completeness explicitly.",
      "id": "weakness-3",
      "locator": "Section 'Global sections functors', Lemma 17 and proof",
      "required_update": "Expand the final paragraph: pick local frames of g and E, write out the comparison matrix in terms of the F^p decomposition, and apply the geometric series argument used elsewhere in the paper (cf. the (id + ṡ(ρ-ρ̃_0))^{-1} step in Proposition 15's proof).",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 'Global sections functors', Lemma 17 and proof` is corrected or justified.",
      "weakness_index": 2
    },
    {
      "evidence": "The factorization at the level of curved L∞ algebras over R is constructed from Dupont's contraction (Lemma 25) lifted via the homotopy transfer of Appendix 6. The unary component of the right-hand map is identified with W_n^♯ → R^{n+1} (vertex evaluations), which is surjective, giving a fibration. The commutativity of the diagram is verified using the identity (i_μ)_n∘(p_μ)_n = id - [D_n, (s_μ)_n] and the side conditions s_n∘ι_n = ev_n∘s_n = 0. The argument relies on Proposition 44 of the appendix; assuming that result, the proof is essentially correct, but the verification of the simplicial-object structure (face/degeneracy compatibility for varying n) is left implicit.",
      "id": "weakness-4",
      "locator": "Section 'Main results', Proposition 27 and proof",
      "required_update": "State explicitly that the functoriality in n (face/degeneracy operators) is inherited from Dupont's contraction being compatible with the cosimplicial structure on Ω_•, citing the relevant lemma in [getzler2009] or [getzler2025…].",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 'Main results', Proposition 27 and proof` is corrected or justified.",
      "weakness_index": 3
    },
    {
      "evidence": "The paper works with $L_\\infty$ algebroids over dg manifolds, a notion that overlaps with shifted/derived Lie algebroids studied in derived algebraic geometry; relevant foundational work in that tradition is not cited, which would help readers place the results in the broader landscape of derived geometry.",
      "id": "weakness-5",
      "locator": "Works on dg-Lie algebroids and derived geometry (e.g., Nuiten or Calaque–Pantev–Toën–Vaquié–Vezzosi)",
      "required_update": "Add or discuss missing prior art `Works on dg-Lie algebroids and derived geometry (e.g., Nuiten or Calaque–Pantev–Toën–Vaquié–Vezzosi)`. The paper works with $L_\\infty$ algebroids over dg manifolds, a notion that overlaps with shifted/derived Lie algebroids studied in derived algebraic geometry; relevant foundational work in that tradition is not cited, which would help readers place the results in the broader landscape of derived geometry.",
      "source_path": null,
      "source_role": "novelty",
      "status": "open",
      "target_kind": "bibliography",
      "verification_check": "Re-review should confirm the related-work discussion addresses this prior art.",
      "weakness_index": 4
    }
  ],
  "strengths": [
    "The proof architecture is modular and clean: the geometric CFO problem is reduced to an algebraic one via Propositions 14-15-18, with Propositions 23 and 27 supplying the pullback and simplicial-frame axioms and Theorem 30 assembling the CFO structure.",
    "The appendix extension of homological perturbation theory to the curved L∞ setting over filtered cdgas (Propositions 38 and 44, Lemma 41) is detailed and self-contained, with Berglund's Green's operator formula and symmetrized tensor trick adapted carefully to preserve the curvature term l_0.",
    "Lemma 24 (every fibration is strict up to isomorphism), Proposition 38 (basic perturbation lemma for curved complexes), and Proposition 44 (HTT for curved L∞ algebras) are each fully verified by the technical correctness specialist with no open gaps.",
    "The choice of side condition [h, r] = 0 is explicitly motivated and contrasted with the Amorim-Tu approach in Remark 35, providing honest attribution of a technical design decision.",
    "The bibliography is tightly curated and technically engaged: all 16 references are used at the theorem or lemma level, and the filtration convention difference from Getzler 2025 is proactively flagged in a footnote."
  ],
  "summary": "The paper contributes to derived geometry by proving that L∞ spaces over a dg manifold form a category of fibrant objects (CFO), with the proof organized via a Serre-Swan-type reduction to the algebraic category L∞Alg(R_M)_fgp. The technical correctness specialist rated the overall correctness as mostly_sound at confidence 0.55; the argument is internally coherent with several lemmas (Lemma 24, Lemma 41, Propositions 38 and 44) fully verified. However, the central load-bearing Lemma 16 (= Proposition 2.6 of [cattaneojiang26]) is imported from a companion paper dated 2026 that carries no arXiv ID, no DOI, and is not yet publicly accessible; this single gap propagates through Proposition 15, Proposition 18, and Theorem 1. The reproducibility specialist (confidence 0.86, score 0.25) flagged a critical absence of any formal proof artifact for the headline theorem and major absences for the homotopy transfer construction and the algebroid implication. The novelty specialist (confidence 0.68, score 0.65) judged the contribution incremental: the extension of HPT to curved L∞ algebras over filtered cdgas and the resulting CFO structure are genuine but build closely on Getzler 2025 and Berglund 2014. Citation practice is tight and technically engaged (citation confidence 0.80) aside from the unlocatable companion paper and the unpublished sardanashvily2001remark preprint. The recommendation gate applies: the paper is in math.* and both technical_correctness (C2, C13 at major severity) and reproducibility (critical and major concerns) flagged missing proof-as-code artifacts; recommendation defaults to major_revision. Resolution of Lemma 16 and provision of at least a minimal machine-checkable supplement would substantially strengthen the paper.",
  "weaknesses": [
    "Lemma 16 (= Proposition 2.6 of [cattaneojiang26]), load-bearing for Proposition 15 and hence for Proposition 18 and Theorem 1, is imported from a companion paper that has no arXiv ID, no DOI, and is dated 2026; independent readers cannot verify this input and it remains the single most consequential open gap in the manuscript.",
    "No formal proof artifact, mechanized formalization, or symbolic-computation supplement is provided for the paper's load-bearing combinatorial identities (Lemma 41, Lemma 43) or the CFO axiom verification (Propositions 23, 27, 28), despite these being mechanizable statements whose trust value is heightened by the unverifiable companion-paper dependency.",
    "The local isomorphism step in Lemma 17's proof—asserting that the constructed map is locally an isomorphism and therefore globally an isomorphism by filtration completeness—is sketched rather than written out, leaving a gap in the structural theorem for locally free Ω_M-hat modules.",
    "The simplicial-object structure in Proposition 27 (face and degeneracy compatibility for varying n) is left implicit, with the paper relying on the claim without explicitly tracing it to the cosimplicial structure of Dupont's contraction.",
    "The paper does not situate its L∞ algebroids over dg manifolds relative to shifted or derived Lie algebroids studied in derived algebraic geometry (e.g., Nuiten; Calaque-Pantev-Toën-Vaquié-Vezzosi), leaving the relationship to that literature unaddressed."
  ]
}
```

### novelty (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.68,
  "missing_prior_art": [
    {
      "reason": "This standard monograph contains a comprehensive treatment of the homotopy transfer theorem for algebras over operads (including $L_\\infty$ algebras) and is the natural companion citation alongside Berglund 2014; its omission makes it harder to situate the appendix's HTT results in the broader operad-theoretic literature.",
      "title": "Algebraic Operads (Loday–Vallette)"
    },
    {
      "reason": "The paper works with $L_\\infty$ algebroids over dg manifolds, a notion that overlaps with shifted/derived Lie algebroids studied in derived algebraic geometry; relevant foundational work in that tradition is not cited, which would help readers place the results in the broader landscape of derived geometry.",
      "title": "Works on dg-Lie algebroids and derived geometry (e.g., Nuiten or Calaque–Pantev–Toën–Vaquié–Vezzosi)"
    }
  ],
  "novelty_score": 0.65,
  "related_work": [
    {
      "citation_key": "cattaneojiang26",
      "delta": "The companion paper (Part I) establishes the equivalence between fibered categories of transitive $L_\\infty$ algebroids and $L_\\infty$ spaces, and detects weak equivalences. The present paper (Part II) uses that equivalence as its starting point and proves the CFO structure, which then lifts to $L_\\infty$ algebroids via Part I.",
      "relation": "builds_on",
      "title": "From $L_\\infty$ algebroids to $L_\\infty$ spaces: Part I"
    },
    {
      "citation_key": "getzler2025higherholonomycurvedlinftyalgebras",
      "delta": "Getzler establishes key results on curved $L_\\infty$ algebras and their homotopy theory (pullback of trivial fibrations, Berglund's formula interpretation) in a pro-nilpotent filtered setting. The present paper adapts these techniques to finitely generated projective curved $L_\\infty$ algebras over filtered cdgas and applies them geometrically to dg manifolds; the proof of Proposition 23 is explicitly described as 'essentially the same' as Getzler's.",
      "relation": "builds_on",
      "title": "Higher holonomy for curved $L_\\infty$-algebras 1: simplicial methods"
    },
    {
      "citation_key": "berglund2014homological",
      "delta": "Berglund develops homological perturbation theory for algebras over operads and derives an explicit formula for the homotopy transfer of $L_\\infty$ algebras. The present paper extends this to the curved $L_\\infty$ setting over filtered cdgas, treating the curvature term $l_0$ carefully so that transfers preserve it; Berglund's Green's operator formula (Lemma 41 here) and symmetrized tensor trick homotopy are used directly.",
      "relation": "prior_art",
      "title": "Homological perturbation theory for algebras over operads"
    },
    {
      "citation_key": "getzler2009",
      "delta": "Foundational source for Dupont's contraction side conditions and the Whitney complex used to construct simplicial frames. The present paper imports these tools wholesale and adapts them to the curved filtered setting.",
      "relation": "prior_art",
      "title": "Lie theory for nilpotent $L_\\infty$-algebras"
    },
    {
      "citation_key": "costello2011geometric",
      "delta": "Costello introduced the notion of $L_\\infty$ spaces over smooth manifolds together with their weak equivalences. The present paper extends this notion to dg manifolds and supplies the homotopy-theoretic (CFO) structure that Costello's original setting lacked.",
      "relation": "prior_art",
      "title": "A geometric construction of the Witten genus, II"
    },
    {
      "citation_key": "rogers2020explicit",
      "delta": "Rogers constructs explicit homotopy-theoretic models for Lie n-algebras using the Whitney–Dupont approach; cited for the pullback existence proof technique. The present paper works in the curved and filtered setting and operates over dg manifolds rather than a field.",
      "relation": "builds_on",
      "title": "An explicit model for the homotopy theory of finite-type Lie n-algebras"
    },
    {
      "citation_key": "rogers2023complete",
      "delta": "Studies homotopy theory (path objects, fibrant objects) of complete $L_\\infty$-algebras over a field. The present paper works with curved $L_\\infty$ algebras over filtered cdgas with an underlying dg manifold geometry, which requires handling the curvature $l_0$ and the sheaf-theoretic structure.",
      "relation": "prior_art",
      "title": "Complete $L_\\infty$-algebras and their homotopy theory"
    },
    {
      "citation_key": "rogers2020homotopy",
      "delta": "Shows that $L_\\infty$ groupoids in the Banach manifold setting form an incomplete category of fibrant objects. The present paper proves a full CFO for $L_\\infty$ spaces, in the dg manifold setting, and provides evidence that the base and fiber CFO structures should assemble into a total one.",
      "relation": "prior_art",
      "title": "On the homotopy theory for Lie∞-groupoids"
    },
    {
      "citation_key": "brown1973abstract",
      "delta": "Brown introduced categories of fibrant objects as a flexible alternative to Quillen model categories; the present paper applies this foundational framework to $L_\\infty$ spaces over a dg manifold.",
      "relation": "prior_art",
      "title": "Abstract homotopy theory and generalized sheaf cohomology"
    },
    {
      "citation_key": "dupont1976simplicial",
      "delta": "Dupont's contraction and projection onto the Whitney complex are the core technical device for constructing the simplicial frame (Proposition 27) that produces path spaces and proves the CFO axioms.",
      "relation": "prior_art",
      "title": "Simplicial de Rham cohomology and characteristic classes of flat bundles"
    },
    {
      "citation_key": "amorim2022inverse",
      "delta": "Studies homotopy transfers of curved $L_\\infty$ spaces over manifolds with a relaxed notion of strong deformation retract (dropping $[h,r]=0$). The present paper imposes $[h,r]=0$, which keeps the curvature unchanged under transfer; the two approaches are contrasted in Remark 35.",
      "relation": "prior_art",
      "title": "The inverse function theorem for curved L-infinity spaces."
    },
    {
      "citation_key": "Behrend2020thx",
      "delta": "Establishes that dg manifolds form a CFO; cited as motivation for expecting the base CFO structure in the fibration $\\mathbf{L_\\infty Sp}(\\mathcal{M}) \\to \\mathbf{dg\\,Man}$.",
      "relation": "prior_art",
      "title": "Derived Differentiable Manifolds"
    }
  ],
  "verdict": "incremental"
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
      "description": "No code repository, formal proof artifact, or commit-pinned artifact is provided for reproducing the headline theorem that L_infinity spaces over a dg manifold form a category of fibrant objects; a suitable closing artifact would be a formalization such as formal/CategoryOfFibrantObjects.lean or an equivalent proof-checkable file.",
      "severity": "critical"
    },
    {
      "area": "code",
      "description": "The homotopy transfer construction for curved L_infinity algebras over filtered cdgas is load-bearing for the paper but is supplied only as manuscript proof text; a proof-checkable artifact such as formal/HomotopyTransferCurvedLInfinity.lean is not provided.",
      "severity": "major"
    },
    {
      "area": "code",
      "description": "The implication for transitive L_infinity algebroids depends on the companion paper equivalence and functorial detection of weak equivalences, but no machine-checkable integration artifact is provided to verify this dependency; a suitable artifact would be formal/TransitiveAlgebroidsCFO.lean or an equivalent formal dependency proof.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "No explicit license, versioned source bundle, or reproducibility instructions are stated for any auxiliary artifacts, so independent reproduction is limited to manual verification of the manuscript proofs.",
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
  "reproducibility_score": 0.25
}
```

### summary (`claude-haiku-4-5`) — status: `pass`

```json
{
  "audience": "Researchers in derived algebraic geometry, higher algebra, and differential homological algebra, particularly those studying L∞ structures, dg manifolds, and homotopy-theoretic category theory.",
  "key_contributions": [
    "Proves that L∞ spaces over a dg manifold form a category of fibrant objects",
    "Extends homotopy transfer theorem for curved L∞ algebras to the filtered cdga setting",
    "Establishes that the global sections functor is well-defined and fully faithful for curved L∞ algebras",
    "Interprets the fibration functor as a fibrant replacement functor in the homotopy theory of L∞ spaces"
  ],
  "plain_language_summary": "This paper establishes a fundamental categorical property for L∞ spaces over differential graded manifolds. L∞ algebras are higher generalizations of Lie algebras arising in derived geometry and rational homotopy theory. The authors prove that such spaces, when organized appropriately over dg manifolds, satisfy the axioms of a category of fibrant objects—a technical structure ensuring that certain homotopy-theoretic limits and colimits exist and behave well. The proof strategy translates classical homotopy transfer theorems from homological algebra into the setting of filtered commutative differential graded algebras (filtered cdgas), which naturally arise when working with differential forms on dg manifolds. The global sections functor, which connects sheaf-theoretic and algebraic perspectives, is shown to be fully faithful and preserve the relevant categorical structure. These results, combined with companion work on transitive L∞ algebroids, complete a program establishing equivalences between various categories of higher algebraic and geometric structures.",
  "tldr": "L∞ spaces over dg manifolds form a category of fibrant objects, proven through homotopy transfer techniques adapted to filtered cdgas."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `pass`

```json
{
  "claims": [
    {
      "assessment": "partially_supported",
      "claim": "Theorem 1: L∞ spaces over a dg manifold form a category of fibrant objects (CFO).",
      "evidence": "The proof reduces, via the global sections functor (Proposition 18), to showing that the algebraic category L∞Alg(R_M)_fgp is a CFO (Proposition 28), then transports the structure back. The reduction depends on Proposition 18 (fully faithful equivalence with the 'vec' subcategory), which in turn rests on Proposition 15 and Lemma 16 (the latter is imported as 'Proposition 2.6 of [cattaneojiang26]' and not proved here). The argument is internally coherent but cannot be fully verified without the companion paper.",
      "id": "C1",
      "location": "Introduction, Theorem 1; proved in Theorem 30 in Section 'Category of fibrant objects'",
      "severity": "minor",
      "suggested_fix": "Either include a self-contained proof of Lemma 16 in an appendix or explicitly state which results of [cattaneojiang26] are assumed, so the present paper is verifiable in isolation."
    },
    {
      "assessment": "unsupported",
      "claim": "Lemma 16 (=Proposition 2.6 in [cattaneojiang26]): The kernel of a surjection between locally free graded O_M-modules of finite total rank is again locally free of finite total rank.",
      "evidence": "This lemma is load-bearing for Proposition 15 (verification of assumption a2) and hence for Proposition 18 and Theorem 1, but no proof is supplied in this paper. The cited companion paper [cattaneojiang26] has date 2026 and is listed without journal or arXiv eprint in the bibliography, so the only available source for this key technical input is unverifiable from the present manuscript.",
      "id": "C2",
      "location": "Section 'Global sections functors', Lemma 16 (cited from [cattaneojiang26])",
      "severity": "major",
      "suggested_fix": "Reproduce the proof of Lemma 16 inline (it is essentially a graded Serre-Swan-style argument for the structure sheaf of a dg manifold) or add a precise citation (arXiv ID / DOI) so the dependency is checkable."
    },
    {
      "assessment": "partially_supported",
      "claim": "Proposition 15: The graded ringed space (M, \\hat{Ω}_M) satisfies assumptions a1 (manifold + fine sheaf) and a2 (kernels of surjections in Vec(X) remain in Vec(X)).",
      "evidence": "a1 is justified by the standard splitting of graded manifolds (\\hat{Ω}_M is a C^∞_M-module, hence fine). a2 is reduced via Lemma 17 to Lemma 16, the latter being an unverified external input (see C2). The reduction itself — representing ρ by a base-change of an O_M-morphism, splitting ρ_0, and using invertibility of id + ṡ∘(ρ-ρ̃_0) on a complete filtration — is sound modulo Lemma 16.",
      "id": "C3",
      "location": "Section 'Global sections functors', Proposition 15 and its proof",
      "severity": "minor",
      "suggested_fix": "After resolving C2, the proof becomes self-contained; otherwise mark the dependency more visibly in the statement."
    },
    {
      "assessment": "partially_supported",
      "claim": "Lemma 17: Every locally free graded \\hat{Ω}_M-module of finite total rank is isomorphic to \\hat{Ω}_M ⊗_{O_M} E for some locally free graded O_M-module E of finite total rank.",
      "evidence": "The proof picks E := Gr^0 g, uses fineness + local-freeness to split 0 → F^1 g → g → E → 0, then builds \\tilde ι: \\hat{Ω}_M ⊗ E → g and asserts it is 'locally an isomorphism, hence an isomorphism' by completeness of the filtration. The local isomorphism step is sketched rather than written out; one should check that on a local trivialization the induced map is the identity plus a filtration-raising correction and invoke completeness explicitly.",
      "id": "C4",
      "location": "Section 'Global sections functors', Lemma 17 and proof",
      "severity": "minor",
      "suggested_fix": "Expand the final paragraph: pick local frames of g and E, write out the comparison matrix in terms of the F^p decomposition, and apply the geometric series argument used elsewhere in the paper (cf. the (id + ṡ(ρ-ρ̃_0))^{-1} step in Proposition 15's proof)."
    },
    {
      "assessment": "partially_supported",
      "claim": "Proposition 18: Γ: L∞Sp(M) → L∞Alg(R_M)_fgp is well-defined and fully faithful; Γ and S are quasi-inverse equivalences between L∞Sp(M) and L∞Alg(R_M)_vec.",
      "evidence": "Full faithfulness follows by combining Proposition 14 (general Serre-Swan-type equivalence under a1, a2) with Proposition 15. The proof correctly notes that S(g_M) is the completed base change and uses the previous discussion that, for finitely generated projective g, ordinary and completed tensor products coincide. The argument is sound, conditional on C2-C4.",
      "id": "C5",
      "location": "Section 'Global sections functors', Proposition 18 and proof",
      "severity": "minor",
      "suggested_fix": "Once C2-C4 are fully justified, this proposition is reliable; otherwise, downgrade strength accordingly."
    },
    {
      "assessment": "supported",
      "claim": "Lemma 24: Every fibration in L∞Alg(R)_fgp is strict up to isomorphism.",
      "evidence": "The proof constructs a coalgebra automorphism Ψ of \\hat{Sym}(g[1]) with Taylor coefficients (id, s∘φ_2, s∘φ_3, …), shows it is invertible because s∘φ_n raises the filtration and the filtration is complete, and then computes (Φ∘Ψ)_n = φ_1∘s∘φ_n = φ_n for n≠1 (using φ_1∘s = id since s splits φ_1). The composition formula and the resulting strict-up-to-iso isomorphism are correctly derived.",
      "id": "C6",
      "location": "Section 'Category of fibrant objects, Main results', Lemma 24 and proof",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Proposition 23 (pullback): For a fibration φ: g → m and any morphism ψ: n → m, the fiber product g ×_m n exists in L∞Alg(R)_fgp, and if φ is a trivial fibration, so is \\tilde φ.",
      "evidence": "Existence is established by reducing to the strict case via Lemma 24, exhibiting the underlying module as k ⊕ n with k = ker φ_1, and giving explicit formulas (solpsi) for the multi-brackets and \\tilde ψ. The strong homotopy Jacobi identity for the constructed brackets is argued via 'D^2 lies in the kernels of both CE(\\tilde φ) and CE(\\tilde ψ), hence must vanish'; this kernel-intersection step deserves a sentence on why it is injective on the image of D^2 (e.g., because (CE(\\tilde φ), CE(\\tilde ψ)) is jointly faithful on the relevant cogenerators). The trivial-fibration preservation argument via the upper-triangular form of Gr l_1 and projection onto H^•(Gr n) is correct under standard spectral sequence reasoning.",
      "id": "C7",
      "location": "Section 'Category of fibrant objects, Main results', Proposition 23 and proof",
      "severity": "minor",
      "suggested_fix": "Add one or two lines justifying why the joint kernel of CE(\\tilde φ) and CE(\\tilde ψ) on coderivations vanishes (universal property of cofree cocommutative coalgebras), so the D^2 = 0 conclusion is explicit."
    },
    {
      "assessment": "partially_supported",
      "claim": "Proposition 27: g_n = W_n^♯ ⊗_R g, together with the canonical inclusion from g and the evaluation-at-vertices fibration to g^{⊕(n+1)}, provides a simplicial-frame factorization of the diagonal l_n g → r_n g, which is an isomorphism in degree 0.",
      "evidence": "The factorization at the level of curved L∞ algebras over R is constructed from Dupont's contraction (Lemma 25) lifted via the homotopy transfer of Appendix 6. The unary component of the right-hand map is identified with W_n^♯ → R^{n+1} (vertex evaluations), which is surjective, giving a fibration. The commutativity of the diagram is verified using the identity (i_μ)_n∘(p_μ)_n = id - [D_n, (s_μ)_n] and the side conditions s_n∘ι_n = ev_n∘s_n = 0. The argument relies on Proposition 44 of the appendix; assuming that result, the proof is essentially correct, but the verification of the simplicial-object structure (face/degeneracy compatibility for varying n) is left implicit.",
      "id": "C8",
      "location": "Section 'Main results', Proposition 27 and proof",
      "severity": "minor",
      "suggested_fix": "State explicitly that the functoriality in n (face/degeneracy operators) is inherited from Dupont's contraction being compatible with the cosimplicial structure on Ω_•, citing the relevant lemma in [getzler2009] or [getzler2025…]."
    },
    {
      "assessment": "partially_supported",
      "claim": "Theorem 30: L∞Sp(M) is a CFO with a framing, and Γ: L∞Sp(M) → L∞Alg(R_M)_fgp is a fully faithful exact functor.",
      "evidence": "Proof identifies L∞Sp(M) with L∞Alg(R_M)_vec via Γ (Proposition 18), then notes that both the simplicial-frame (Proposition 27) and pullback (Proposition 23) constructions preserve this subcategory by Proposition 15. The terminal-object and trivial-fibration axioms are not separately checked here; the proof relies on Proposition 28 (stated but not separately proved in the supplied excerpt) for the algebraic CFO structure. Conditional on Propositions 15, 18, 23, 27, 28 the conclusion follows.",
      "id": "C9",
      "location": "Section 'Main results', Theorem 30 and proof",
      "severity": "minor",
      "suggested_fix": "Make Proposition 28's proof explicit (assembling the lemmas) and explicitly state how exactness follows (preservation of fibrations from Definitions 22/29 is immediate; preservation of pullbacks along fibrations follows from Proposition 23 restricted to the 'vec' subcategory)."
    },
    {
      "assessment": "supported",
      "claim": "Lemma 41 (Berglund): For n>0, the Green's operator of [d, L_h] on Sym^n(g[1]) equals (1/n) Σ_{ε ∈ {0,1}^n} C(n-1, |ε|)^{-1} (ip)^{ε_1} ⊗ ⋯ ⊗ (ip)^{ε_n} (with C(n-1,n)^{-1} = 0).",
      "evidence": "Direct computation: the proof reduces the desired identity [d, L_h] G = id^{⊗n} - (ip)^{⊗n} to a combinatorial identity in c_ε; the simplification c_ε = (1/n)[ (n-|ε|)/C(n-1,|ε|) - |ε|/C(n-1,|ε|-1) ] and the verification c_{|ε|} = 0 for 0 < |ε| < n via the binomial identity |ε|!(n-|ε|)!/(n-1)! is correct. Boundary cases c_0 = 1 and c_n = -1 give exactly id^{⊗n} - (ip)^{⊗n}. Internally consistent and aligned with [berglund2014homological, Prop 5.1].",
      "id": "C10",
      "location": "Appendix 'Homotopy transfer of curved L∞ algebras', Lemma 41 and proof",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Proposition 38: The triple (p_μ, i_μ, h_μ) with p_μ = p(id+μh)^{-1}, i_μ = (id+hμ)^{-1} i, h_μ = (id+hμ)^{-1} h defines a strong deformation retract of curved complexes (V, d_μ) → (H, δ_μ) with δ_μ = δ + p_μ μ i, given that h is a contraction of (V,d), μ is a perturbation with [h, r_μ] = 0.",
      "evidence": "The proof verifies p_μ i_μ = id using pi = id together with side conditions hi = ph = 0, then i_μ p_μ + d_μ h_μ + h_μ d_μ = id by conjugating with (id+hμ) and (id+μh) and using r_μ - r = dμ + μd + μ^2 together with h(r_μ-r)h = [h, r_μ-r] h = 0. The differential identity δ_μ - p_μ d_μ i_μ = p_μ(μhd + dhμ + 2μhμ) i_μ is reduced via the [d,h] = id - ip rewriting and side conditions p_μ h = h i_μ = 0 to zero. Computations are explicit and correct.",
      "id": "C11",
      "location": "Section 'Homological perturbation of curved complexes', Proposition 38 and proof",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Proposition 44: A contraction h of g induces a curved L∞ structure on h = ker[l_1, h] with curvature p(l_0) and unary bracket p l_1 i, and p_μ, i_μ are weak equivalences of curved L∞ algebras.",
      "evidence": "Curved L∞ structure on h follows from Lemma 43 (coalgebra-morphism property of p_μ, i_μ and coderivation property of D_h = δ + p_μ μ i), itself proved by reducing (hμ)^k i p to (1/k!)(L_h μ)^k i p using the combinatorial identity (1/m)Σ_{ε:ε_1=0} C(m-1,|ε|)^{-1} = 1 (correctly verified). The weak-equivalence claim follows from the explicit strong deformation retract on the associated graded, which is a standard HPT consequence. The final remark that p i(l_0) = l_0 and i p(l_0) = l_0 (curvature preserved) uses h(l_0) = 0 from Definition 39 and l_1(l_0) = 0 from the L∞ identities, which is correctly applied.",
      "id": "C12",
      "location": "Appendix 'Homotopy transfer of curved L∞ algebras', Proposition 44 and proof",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "unsupported",
      "claim": "Proof-as-code: For a paper in math.CT / math.AT establishing CFO-style homotopical structures and explicit HPT formulas on curved L∞ algebras, no executable formalization (e.g., Coq/Lean/Agda mechanization) or symbolic-computation supplement is provided.",
      "evidence": "The paper's load-bearing combinatorial identities (Lemma 41's Green's-operator formula, the (1/m) Σ_{ε_1=0} C(m-1,|ε|)^{-1} = 1 identity in the proof of Lemma 43, the conjugation algebra in Proposition 38, the explicit (solpsi)/l_1 formulas in the proof of Proposition 23) and the coderivation/coalgebra-morphism identities for HPT are exactly the kind of statements that can and have been mechanized in proof assistants (Coq, Lean, Agda) or verified symbolically (e.g., in Mathematica/SymPy with a Koszul-sign-aware library). The companion paper [cattaneojiang26] is also unavailable for cross-checking, increasing the value of a machine-checked artifact. No such artifact is shipped or referenced.",
      "id": "C13",
      "location": "Throughout the paper (no Code Availability / Artifact statement)",
      "severity": "major",
      "suggested_fix": "Provide a companion repository, e.g. src/proofs/HPT.lean formalizing Lemmas 41, 43 and Proposition 38, and src/proofs/CFO.lean formalizing the CFO axioms for L∞Alg(R)_fgp (Definitions 22, 29; Propositions 23, 27, 28). At minimum, a SymPy or Mathematica script src/checks/berglund_green.py numerically verifying the Green's operator identity for n ≤ 8 would substantiate Lemma 41 and the binomial identity in Lemma 43."
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

1. Behrend2020thx: author=Behrend, Kai, author=Liao, Hsuan-Yi, author=Xu, Ping, title=Derived Differentiable Manifolds, date=2020, eprint=2006.01376, arXiv:[2006.01376](https://arxiv.org/abs/2006.01376)
2. amorim2022inverse: title=The inverse function theorem for curved L-infinity spaces., author=Amorim, Lino, author=Tu, Junwu, journal=Journal of Noncommutative Geometry, volume=16, number=4, date=2022
3. berglund2014homological: title=Homological perturbation theory for algebras over operads, author=Berglund, Alexander, journal=Algebraic \& Geometric Topology, volume=14, number=5, pages=2511--2548, date=2014, publisher=Mathematical Sciences Publishers
4. brown1973abstract: title=Abstract homotopy theory and generalized sheaf cohomology, author=Brown, Kenneth S., journal=Transactions of the American Mathematical Society, volume=186, pages=419--458, date=1973
5. carchedi2023derivedmanifoldsdifferentialgraded: author=Carchedi, David, title=Derived Manifolds as Differential Graded Manifolds, date=2023, eprint=2303.11140, arXiv:[2303.11140](https://arxiv.org/abs/2303.11140)
6. cattaneojiang26: author = Cattaneo, Alberto S., author = Jiang, Shuhan, title = From $L_\infty$ algebroids to $L_\infty$ spaces: Part I, date = 2026,
7. costello2011geometric: author=Costello, Kevin, title=A geometric construction of the Witten genus, II, date=2011, eprint=1112.0816, arXiv:[1112.0816](https://arxiv.org/abs/1112.0816)
8. dupont1976simplicial: title=Simplicial de Rham cohomology and characteristic classes of flat bundles, author=Dupont, Johan L, journal=Topology, volume=15, number=3, pages=233--245, date=1976, publisher=Pergamon
9. getzler2009: author=Getzler, Ezra, title=Lie theory for nilpotent $L_\infty$-algebras, journal=Annals of Mathematics, volume=170, number=1, date=2009, pages=271--301,
10. getzler2025higherholonomycurvedlinftyalgebras: author=Getzler, Ezra, title=Higher holonomy for curved $L_\infty$-algebras 1: simplicial methods, date=2025, eprint=2408.11157, arXiv:[2408.11157](https://arxiv.org/abs/2408.11157)
11. hovey2007model: title=Model Categories, author=Hovey, Mark, number=63, date=2007, publisher=American Mathematical Soc.,
12. morye2013note: title=Note on the Serre-Swan theorem, author=Morye, Archana S, journal=Mathematische Nachrichten, volume=286, number=2-3, pages=272--278, date=2013, publisher=Wiley Online Library
13. rogers2020explicit: title=An explicit model for the homotopy theory of finite-type Lie n--algebras, author=Rogers, Christopher L, journal=Algebraic \& Geometric Topology, volume=20, number=3, pages=1371--1429, date=2020, publisher=Mathematical Sciences Publishers
14. rogers2020homotopy: title=On the homotopy theory for Lie∞--groupoids, with an application to integrating L∞--algebras, author=Rogers, Christopher L, author=Zhu, Chenchang, journal=Algebraic \& Geometric Topology, volume=20, number=3, pages=1127--1219, date=2020, publisher=Mathematical Sciences Publishers,
15. rogers2023complete: title=Complete $L_\infty$-algebras and their homotopy theory, author=Rogers, Christopher L, journal=Journal of Pure and Applied Algebra, volume=227, number=10, pages=107403, date=2023, publisher=Elsevier,
16. sardanashvily2001remark: title=Remark on the Serre-Swan theorem for non-compact manifolds, author=Sardanashvily, G, eprint=math-ph/0102016, date=2001 arXiv:[math-ph/0102016](https://arxiv.org/abs/math-ph/0102016)

