# Homotopy transfers of curved $L_\infty$ algebras

GrokRxiv review of [arXiv:2606.23965](https://arxiv.org/abs/2606.23965) · `math.DG`

_Authors_: Shuhan Jiang

## TL;DR

The paper establishes that L∞ spaces over a dg manifold form a category of fibrant objects (CFO), with the stated corollary that transitive L∞ algebroids inherit this structure via the companion paper equivalence. The technical_correctness specialist (confidence 0.70, overall: mostly_sound) found the supporting scaffolding — Lemmas 24, 43; Propositions 23, 44; Lemma 17; Lemma 41 — fully supported on detailed inspection. The headline Theorem 1/30 was assessed as partially_supported at major severity not because the mathematical reasoning is defective but because no machine-checkable proof artifact accompanies it. The reproducibility specialist (confidence 0.87, score 0.24) independently flags the same gap at critical severity. These two specialist findings trigger the recommendation gate: the field is math.* (code-amenable), and both technical_correctness and reproducibility flag a missing proof-as-code for the headline claim at major or critical severity, so the default recommendation is major_revision. Two additional cross-cutting concerns compound this: (a) Theorem 1's abstract corollary and the intermediate Lemma 16 both depend on the companion paper cattaneojiang26, which carries a 2026 date and no arXiv identifier and was therefore unavailable for any reviewer; (b) the novelty specialist (confidence 0.62, score 0.45, verdict: incremental) identified three bodies of closely related prior art absent from the bibliography. The citation specialist timed out entirely before producing output; this is a pipeline failure and not evidence of a paper-level bibliography deficiency. Specialists are not in disagreement on substantive points — technical_correctness and reproducibility align on the proof-as-code gap, and novelty's incremental verdict is consistent with technical_correctness finding a sound but not transformative extension of existing frameworks.

_Recommendation_: **Major revision** · _Confidence_: 72%

## Strengths

- The geometric-to-algebraic reduction via the global sections functor Γ is clean and rigorously supported: Proposition 18's proof correctly chains Proposition 15 and Lemma 13 to establish full faithfulness and the quasi-inverse equivalence, with the finite-rank projectivity condition doing essential work throughout.
- The homotopy transfer theorem for curved L∞ algebras over filtered cdgas (Proposition 44) is developed with explicit algebraic detail — the Berglund symmetrized tensor homotopy identity (Lemma 41) and the perturbation coalgebra-morphism argument (Lemma 43) are both independently verified correct by the technical_correctness specialist.
- Lemma 24's proof that every fibration in L∞ Alg(R)_fgp is strict up to isomorphism is a technically precise application of the fgp condition and filtration completeness, and correctly underpins Proposition 23's fiber-product construction.
- The paper clearly situates its main result as extending the Behrend–Liao–Xu and Carchedi base CFO results to the fibered category of L∞ spaces, and explicitly distinguishes its stricter contraction notion from the Amorim–Tu relaxed approach.

## Weaknesses

- The headline theorem (Theorem 1/30) ships no machine-checkable formal proof artifact; the technical_correctness specialist rated it partially_supported at major severity and the reproducibility specialist flagged it at critical severity — together triggering the math.* recommendation gate for proof-as-code.
- The abstract's corollary that transitive L∞ algebroids form a CFO is contingent on an unpublished companion paper (cattaneojiang26, 2026, no arXiv ID) that was unavailable for review; the dependency is not marked conditional in the abstract or theorem statement.
- Proposition 15's proof delegates Lemma 16 (kernel of a surjection of locally free O_M-modules is locally free) to the same unavailable companion paper (Proposition 2.6 of cattaneojiang26), leaving a gap in the verification of the [a2] fibrancy assumption.
- Three bodies of directly relevant prior art are absent from the bibliography: Q-algebroids and dg Lie algebroids (Mehta, Vaintrob, Kontsevich school), Abad–Crainic representations up to homotopy, and Nuiten's Koszul duality for Lie algebroids; their omission obscures the paper's positioning within the derived geometry literature.
- The Serre–Swan generalization to graded ringed spaces (Lemmas 12–13) applies Morye's Lemma 2.3 and Proposition 2.5 — stated for ungraded ringed spaces — to the graded setting with only a footnote asserting the extension is straightforward, without verification or a graded-setting citation.

## Revision Targets

- [ ] **Manuscript: Section 1 (Theorem 1) and Section 3 (Theorem 30).**
  - Location: `Section 1 (Theorem 1) and Section 3 (Theorem 30).`
  - Evidence: The proof reduces the claim to Proposition 28 (CFO structure on L_infty Alg(R_M)_fgp) via the equivalence in Proposition 18, then transports the simplicial-frame and pullback constructions back along Gamma. The argument is internally coherent and rests on Propositions 15, 23, 27, which are all proved in the paper, but the result is a load-bearing, code-amenable categorical statement that ships no executable formal proof.
  - Required change: Per the proof-as-code axiom for math.*: provide a formal verification of the CFO axioms (terminal object, pullback of fibrations, path-space factorization) and of the framing functor, e.g. in src/proofs/CFO_LinftySp.lean (Lean 4 / mathlib4), so a machine-checkable artifact certifies Theorem 1/30.
  - Verification: Re-review should confirm `Section 1 (Theorem 1) and Section 3 (Theorem 30).` is corrected or justified.
- [ ] **Manuscript: Abstract; introduction.**
  - Location: `Abstract; introduction.`
  - Evidence: This is presented as an immediate consequence of Theorem 1 together with the first main result of the companion paper cattaneojiang26, which is not yet available for verification here (cited with date=2026 and no arXiv id). The transport of the CFO structure along an equivalence is formally trivial, but the substantive content — the equivalence L_infty Algd_fib ~= L_infty Sp — is in the companion.
  - Required change: Make the dependency on cattaneojiang26 explicit in the abstract and theorem statement, and either include the relevant equivalence statement as an assumption or wait for the companion to be publicly available before quoting the corollary.
  - Verification: Re-review should confirm `Abstract; introduction.` is corrected or justified.
- [ ] **Manuscript: Section 2 (Proposition 15), proof using Lemma 17 and Lemma 16.**
  - Location: `Section 2 (Proposition 15), proof using Lemma 17 and Lemma 16.`
  - Evidence: Fineness follows from the splitting of graded manifolds (hatOmega_M is a C^infty_M-module, hence fine). The [a2] argument tensors a surjection rho : hatOmega tensor E -> hatOmega tensor F up from its zeroth component rho_0, splits rho_0 via Lemma 16, then inverts id + ~s o (rho - ~rho_0). The invertibility step uses completeness of the filtration on hatOmega_M, which is given. The crucial input Lemma 16 (kernel of a surjection of locally free O_M-modules is locally free) is attributed to Proposition 2.6 of the companion paper cattaneojiang26 and not reproved here.
  - Required change: Either include a self-contained proof of Lemma 16 or, since cattaneojiang26 is cited as the dependency, gate this paper on the companion's availability and explicitly state the assumption (e.g. parity of grading or characteristic) under which Lemma 16 is proved.
  - Verification: Re-review should confirm `Section 2 (Proposition 15), proof using Lemma 17 and Lemma 16.` is corrected or justified.
- [ ] **Bibliography: Work on Q-algebroids / dg Lie algebroids (e.g., Mehta, Vaintrob, or Kontsevich-school)**
  - Location: bibliography entry: `Work on Q-algebroids / dg Lie algebroids (e.g., Mehta, Vaintrob, or Kontsevich-school)`
  - Evidence: The paper's ultimate goal is a homotopy theory for L_∞ algebroids over dg manifolds, yet it cites no prior literature on dg Lie algebroids or Q-algebroids. References to Mehta's thesis/papers or related work on infinitesimal symmetries in derived geometry would situate the motivation more precisely.
  - Required change: Add or discuss missing prior art `Work on Q-algebroids / dg Lie algebroids (e.g., Mehta, Vaintrob, or Kontsevich-school)`. The paper's ultimate goal is a homotopy theory for L_∞ algebroids over dg manifolds, yet it cites no prior literature on dg Lie algebroids or Q-algebroids. References to Mehta's thesis/papers or related work on infinitesimal symmetries in derived geometry would situate the motivation more precisely.
  - Verification: Re-review should confirm the related-work discussion addresses this prior art.
- [ ] **Manuscript: Section 2 (Lemmas 12, 13, Proposition 14).**
  - Location: `Section 2 (Lemmas 12, 13, Proposition 14).`
  - Evidence: Lemma 12 (S fully faithful on Fgp(A)) is a clean tensor-with-finitely-generated-projective-commutes-with-limits argument. Lemma 13 relies on Lemma 2.3 and Proposition 2.5 of morye2013note for the iso S(Gamma(E)) ~= E, which the authors note works in the graded setting because the extension is 'straightforward' (footnote 2). The Sardanashvily refinement-of-cover argument is sketched but correct.
  - Required change: Briefly verify (or cite a precise reference for) the graded-ringed-space generalization of Morye's Lemma 2.3 / Proposition 2.5, since the cited paper is stated for the ungraded setting.
  - Verification: Re-review should confirm `Section 2 (Lemmas 12, 13, Proposition 14).` is corrected or justified.

## Open Questions

- Can the CFO axioms for Theorem 1/30 be formalized in Lean 4 / mathlib4, or can the authors supply a detailed proof-gap analysis identifying every non-obvious step and the precise lemma in Getzler or Rogers from which it follows?
- What is the expected public availability of cattaneojiang26, and would it be feasible to include Lemma 16 (kernel freeness) and a statement of the algebroid–space equivalence as a self-contained appendix so that this paper stands independently?
- How does the homotopy theory developed here relate to Q-algebroids and dg Lie algebroids in the sense of Mehta and Vaintrob — are transitive L∞ algebroids over a dg manifold a special case, or does the relationship require additional structure?
- Does the graded-ringed-space generalization of Morye's Lemma 2.3 / Proposition 2.5 involve any sign, parity, or completeness subtleties beyond the ungraded case, or is there a reference in the literature where this exact generalization is established?
- Can the Dupont contraction anticommutation identities h_n^i h_n^j + h_n^j h_n^i = 0 and epsilon_i^n h_n^i = 0 used in Proposition 27 be verified explicitly within this paper rather than imported from Getzler 2009 Lemma 3.4 / Theorem 3.11 without reproof?

## Per-Agent Reviews

### citation (`claude-sonnet-4-6`) — status: `fail`

```json
{
  "confidence": 0.0,
  "entries": [],
  "missing_references": [],
  "summary": "Citation-use agent failed before producing a normal citation relevance review. Deterministic citation verification still runs separately; see external citation checks and verifier provenance for existence, DOI, URL, and resolver evidence. Failure: agent \"citation\" timed out after 180s at supervisor level"
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.72,
  "questions": [
    "Can the CFO axioms for Theorem 1/30 be formalized in Lean 4 / mathlib4, or can the authors supply a detailed proof-gap analysis identifying every non-obvious step and the precise lemma in Getzler or Rogers from which it follows?",
    "What is the expected public availability of cattaneojiang26, and would it be feasible to include Lemma 16 (kernel freeness) and a statement of the algebroid–space equivalence as a self-contained appendix so that this paper stands independently?",
    "How does the homotopy theory developed here relate to Q-algebroids and dg Lie algebroids in the sense of Mehta and Vaintrob — are transitive L∞ algebroids over a dg manifold a special case, or does the relationship require additional structure?",
    "Does the graded-ringed-space generalization of Morye's Lemma 2.3 / Proposition 2.5 involve any sign, parity, or completeness subtleties beyond the ungraded case, or is there a reference in the literature where this exact generalization is established?",
    "Can the Dupont contraction anticommutation identities h_n^i h_n^j + h_n^j h_n^i = 0 and epsilon_i^n h_n^i = 0 used in Proposition 27 be verified explicitly within this paper rather than imported from Getzler 2009 Lemma 3.4 / Theorem 3.11 without reproof?"
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "The proof reduces the claim to Proposition 28 (CFO structure on L_infty Alg(R_M)_fgp) via the equivalence in Proposition 18, then transports the simplicial-frame and pullback constructions back along Gamma. The argument is internally coherent and rests on Propositions 15, 23, 27, which are all proved in the paper, but the result is a load-bearing, code-amenable categorical statement that ships no executable formal proof.",
      "id": "weakness-1",
      "locator": "Section 1 (Theorem 1) and Section 3 (Theorem 30).",
      "required_update": "Per the proof-as-code axiom for math.*: provide a formal verification of the CFO axioms (terminal object, pullback of fibrations, path-space factorization) and of the framing functor, e.g. in src/proofs/CFO_LinftySp.lean (Lean 4 / mathlib4), so a machine-checkable artifact certifies Theorem 1/30.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 1 (Theorem 1) and Section 3 (Theorem 30).` is corrected or justified.",
      "weakness_index": 0
    },
    {
      "evidence": "This is presented as an immediate consequence of Theorem 1 together with the first main result of the companion paper cattaneojiang26, which is not yet available for verification here (cited with date=2026 and no arXiv id). The transport of the CFO structure along an equivalence is formally trivial, but the substantive content — the equivalence L_infty Algd_fib ~= L_infty Sp — is in the companion.",
      "id": "weakness-2",
      "locator": "Abstract; introduction.",
      "required_update": "Make the dependency on cattaneojiang26 explicit in the abstract and theorem statement, and either include the relevant equivalence statement as an assumption or wait for the companion to be publicly available before quoting the corollary.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Abstract; introduction.` is corrected or justified.",
      "weakness_index": 1
    },
    {
      "evidence": "Fineness follows from the splitting of graded manifolds (hatOmega_M is a C^infty_M-module, hence fine). The [a2] argument tensors a surjection rho : hatOmega tensor E -> hatOmega tensor F up from its zeroth component rho_0, splits rho_0 via Lemma 16, then inverts id + ~s o (rho - ~rho_0). The invertibility step uses completeness of the filtration on hatOmega_M, which is given. The crucial input Lemma 16 (kernel of a surjection of locally free O_M-modules is locally free) is attributed to Proposition 2.6 of the companion paper cattaneojiang26 and not reproved here.",
      "id": "weakness-3",
      "locator": "Section 2 (Proposition 15), proof using Lemma 17 and Lemma 16.",
      "required_update": "Either include a self-contained proof of Lemma 16 or, since cattaneojiang26 is cited as the dependency, gate this paper on the companion's availability and explicitly state the assumption (e.g. parity of grading or characteristic) under which Lemma 16 is proved.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 2 (Proposition 15), proof using Lemma 17 and Lemma 16.` is corrected or justified.",
      "weakness_index": 2
    },
    {
      "evidence": "The paper's ultimate goal is a homotopy theory for L_∞ algebroids over dg manifolds, yet it cites no prior literature on dg Lie algebroids or Q-algebroids. References to Mehta's thesis/papers or related work on infinitesimal symmetries in derived geometry would situate the motivation more precisely.",
      "id": "weakness-4",
      "locator": "Work on Q-algebroids / dg Lie algebroids (e.g., Mehta, Vaintrob, or Kontsevich-school)",
      "required_update": "Add or discuss missing prior art `Work on Q-algebroids / dg Lie algebroids (e.g., Mehta, Vaintrob, or Kontsevich-school)`. The paper's ultimate goal is a homotopy theory for L_∞ algebroids over dg manifolds, yet it cites no prior literature on dg Lie algebroids or Q-algebroids. References to Mehta's thesis/papers or related work on infinitesimal symmetries in derived geometry would situate the motivation more precisely.",
      "source_path": null,
      "source_role": "novelty",
      "status": "open",
      "target_kind": "bibliography",
      "verification_check": "Re-review should confirm the related-work discussion addresses this prior art.",
      "weakness_index": 3
    },
    {
      "evidence": "Lemma 12 (S fully faithful on Fgp(A)) is a clean tensor-with-finitely-generated-projective-commutes-with-limits argument. Lemma 13 relies on Lemma 2.3 and Proposition 2.5 of morye2013note for the iso S(Gamma(E)) ~= E, which the authors note works in the graded setting because the extension is 'straightforward' (footnote 2). The Sardanashvily refinement-of-cover argument is sketched but correct.",
      "id": "weakness-5",
      "locator": "Section 2 (Lemmas 12, 13, Proposition 14).",
      "required_update": "Briefly verify (or cite a precise reference for) the graded-ringed-space generalization of Morye's Lemma 2.3 / Proposition 2.5, since the cited paper is stated for the ungraded setting.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 2 (Lemmas 12, 13, Proposition 14).` is corrected or justified.",
      "weakness_index": 4
    }
  ],
  "strengths": [
    "The geometric-to-algebraic reduction via the global sections functor Γ is clean and rigorously supported: Proposition 18's proof correctly chains Proposition 15 and Lemma 13 to establish full faithfulness and the quasi-inverse equivalence, with the finite-rank projectivity condition doing essential work throughout.",
    "The homotopy transfer theorem for curved L∞ algebras over filtered cdgas (Proposition 44) is developed with explicit algebraic detail — the Berglund symmetrized tensor homotopy identity (Lemma 41) and the perturbation coalgebra-morphism argument (Lemma 43) are both independently verified correct by the technical_correctness specialist.",
    "Lemma 24's proof that every fibration in L∞ Alg(R)_fgp is strict up to isomorphism is a technically precise application of the fgp condition and filtration completeness, and correctly underpins Proposition 23's fiber-product construction.",
    "The paper clearly situates its main result as extending the Behrend–Liao–Xu and Carchedi base CFO results to the fibered category of L∞ spaces, and explicitly distinguishes its stricter contraction notion from the Amorim–Tu relaxed approach."
  ],
  "summary": "The paper establishes that L∞ spaces over a dg manifold form a category of fibrant objects (CFO), with the stated corollary that transitive L∞ algebroids inherit this structure via the companion paper equivalence. The technical_correctness specialist (confidence 0.70, overall: mostly_sound) found the supporting scaffolding — Lemmas 24, 43; Propositions 23, 44; Lemma 17; Lemma 41 — fully supported on detailed inspection. The headline Theorem 1/30 was assessed as partially_supported at major severity not because the mathematical reasoning is defective but because no machine-checkable proof artifact accompanies it. The reproducibility specialist (confidence 0.87, score 0.24) independently flags the same gap at critical severity. These two specialist findings trigger the recommendation gate: the field is math.* (code-amenable), and both technical_correctness and reproducibility flag a missing proof-as-code for the headline claim at major or critical severity, so the default recommendation is major_revision. Two additional cross-cutting concerns compound this: (a) Theorem 1's abstract corollary and the intermediate Lemma 16 both depend on the companion paper cattaneojiang26, which carries a 2026 date and no arXiv identifier and was therefore unavailable for any reviewer; (b) the novelty specialist (confidence 0.62, score 0.45, verdict: incremental) identified three bodies of closely related prior art absent from the bibliography. The citation specialist timed out entirely before producing output; this is a pipeline failure and not evidence of a paper-level bibliography deficiency. Specialists are not in disagreement on substantive points — technical_correctness and reproducibility align on the proof-as-code gap, and novelty's incremental verdict is consistent with technical_correctness finding a sound but not transformative extension of existing frameworks.",
  "weaknesses": [
    "The headline theorem (Theorem 1/30) ships no machine-checkable formal proof artifact; the technical_correctness specialist rated it partially_supported at major severity and the reproducibility specialist flagged it at critical severity — together triggering the math.* recommendation gate for proof-as-code.",
    "The abstract's corollary that transitive L∞ algebroids form a CFO is contingent on an unpublished companion paper (cattaneojiang26, 2026, no arXiv ID) that was unavailable for review; the dependency is not marked conditional in the abstract or theorem statement.",
    "Proposition 15's proof delegates Lemma 16 (kernel of a surjection of locally free O_M-modules is locally free) to the same unavailable companion paper (Proposition 2.6 of cattaneojiang26), leaving a gap in the verification of the [a2] fibrancy assumption.",
    "Three bodies of directly relevant prior art are absent from the bibliography: Q-algebroids and dg Lie algebroids (Mehta, Vaintrob, Kontsevich school), Abad–Crainic representations up to homotopy, and Nuiten's Koszul duality for Lie algebroids; their omission obscures the paper's positioning within the derived geometry literature.",
    "The Serre–Swan generalization to graded ringed spaces (Lemmas 12–13) applies Morye's Lemma 2.3 and Proposition 2.5 — stated for ungraded ringed spaces — to the graded setting with only a footnote asserting the extension is straightforward, without verification or a graded-setting citation."
  ]
}
```

### novelty (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.62,
  "missing_prior_art": [
    {
      "reason": "The paper's ultimate goal is a homotopy theory for L_∞ algebroids over dg manifolds, yet it cites no prior literature on dg Lie algebroids or Q-algebroids. References to Mehta's thesis/papers or related work on infinitesimal symmetries in derived geometry would situate the motivation more precisely.",
      "title": "Work on Q-algebroids / dg Lie algebroids (e.g., Mehta, Vaintrob, or Kontsevich-school)"
    },
    {
      "reason": "Representations up to homotopy and the adjoint representation of a Lie algebroid are closely related to transitive L_∞ algebroids; a citation would clarify how the objects studied here relate to classical Lie algebroid homotopy theory.",
      "title": "Abad–Crainic: Representations up to homotopy"
    },
    {
      "reason": "Nuiten's work on formal moduli problems and Koszul duality for Lie algebroids over derived bases overlaps conceptually with L_∞ algebroids over dg manifolds; its omission may obscure the relationship between the present results and the formal moduli perspective.",
      "title": "Nuiten: Koszul duality for Lie algebroids"
    }
  ],
  "novelty_score": 0.45,
  "related_work": [
    {
      "citation_key": "costello2011geometric",
      "delta": "Costello introduced L_∞ spaces over smooth manifolds and their weak equivalences; this paper adapts that notion and the associated homotopy theory to the strictly more general setting of dg manifolds.",
      "relation": "prior_art",
      "title": "A geometric construction of the Witten genus, II"
    },
    {
      "citation_key": "getzler2025higherholonomycurvedlinftyalgebras",
      "delta": "This paper directly adapts Getzler's constructions—pullbacks of fibrations, simplicial frames via Dupont contraction, and the filtration-compatible treatment of curved L_∞ algebras—from the field/pro-nilpotent setting to finitely generated projective modules over filtered cdgas, which is the algebraic core needed for the dg-manifold geometry.",
      "relation": "builds_on",
      "title": "Higher holonomy for curved L_∞-algebras 1: simplicial methods"
    },
    {
      "citation_key": "getzler2009",
      "delta": "Getzler's foundational Lie theory for L_∞ algebras (polynomial de Rham forms, Dupont contraction side conditions) is the template that the current paper adapts to the curved, filtered-cdga setting; Lemma 25 and the Whitney-complex retract are taken directly from this source.",
      "relation": "prior_art",
      "title": "Lie theory for nilpotent L_∞-algebras"
    },
    {
      "citation_key": "berglund2014homological",
      "delta": "The symmetrized tensor homotopy (Berglund's 'h^Σ') used in the appendix HPT is cited directly; this paper re-derives it for curved L_∞ algebras over filtered cdgas and identifies it as the harmonization of L_h.",
      "relation": "builds_on",
      "title": "Homological perturbation theory for algebras over operads"
    },
    {
      "citation_key": "rogers2020explicit",
      "delta": "Rogers' explicit construction of path objects and pullbacks for L_∞ algebras over a field is adapted; the paper cites Rogers for the proof structure of Proposition 23 (pullbacks of fibrations).",
      "relation": "builds_on",
      "title": "An explicit model for the homotopy theory of finite-type Lie n-algebras"
    },
    {
      "citation_key": "rogers2023complete",
      "delta": "Rogers' homotopy theory for complete L_∞ algebras over a field supplies the foundational CFO framework that is extended here to the filtered cdga / dg-manifold setting.",
      "relation": "prior_art",
      "title": "Complete L_∞-algebras and their homotopy theory"
    },
    {
      "citation_key": "rogers2020homotopy",
      "delta": "Rogers-Zhu show that L_∞ groupoids in the Banach manifold setting form an *incomplete* CFO; the current paper obtains a full CFO for L_∞ spaces over a dg manifold, filling this gap.",
      "relation": "prior_art",
      "title": "On the homotopy theory for Lie∞-groupoids, with an application to integrating L∞-algebras"
    },
    {
      "citation_key": "brown1973abstract",
      "delta": "Brown's original definition of a category of fibrant objects is the central structure this paper establishes for L_∞ spaces over dg manifolds; no modification to the axioms is made.",
      "relation": "prior_art",
      "title": "Abstract homotopy theory and generalized sheaf cohomology"
    },
    {
      "citation_key": "Behrend2020thx",
      "delta": "Behrend-Liao-Xu proved dg manifolds form a CFO; the paper situates its main theorem as extending this base-CFO result to the fibered category of L_∞ spaces over dg manifolds.",
      "relation": "prior_art",
      "title": "Derived Differentiable Manifolds"
    },
    {
      "citation_key": "carchedi2023derivedmanifoldsdifferentialgraded",
      "delta": "Carchedi independently proved dg manifolds form a CFO; cited alongside Behrend et al. as justification for the expectation that a total CFO structure exists.",
      "relation": "prior_art",
      "title": "Derived Manifolds as Differential Graded Manifolds"
    },
    {
      "citation_key": "amorim2022inverse",
      "delta": "Amorim-Tu study homotopy transfers and strong deformation retracts for curved L_∞ spaces over smooth manifolds using a relaxed side condition (dropping [h,r]=0); the current paper opts for a stricter contraction notion and works over dg manifolds, giving a complementary result.",
      "relation": "prior_art",
      "title": "The inverse function theorem for curved L-infinity spaces."
    },
    {
      "citation_key": "cattaneojiang26",
      "delta": "This is the companion paper (Part I of the same program) establishing the equivalence between transitive L_∞ algebroids and L_∞ spaces over dg manifolds; together the two papers imply the CFO result for L_∞ algebroids.",
      "relation": "orthogonal",
      "title": "From L_∞ algebroids to L_∞ spaces: Part I"
    },
    {
      "citation_key": "dupont1976simplicial",
      "delta": "Dupont's contraction (and the Whitney complex) is the key analytic input for constructing simplicial frames in L_∞ Alg(R)_fgp; Lemma 25 records the side conditions needed for the HPT.",
      "relation": "builds_on",
      "title": "Simplicial de Rham cohomology and characteristic classes of flat bundles"
    },
    {
      "citation_key": "morye2013note",
      "delta": "Morye's Lemma 2.3 and Proposition 2.5 are invoked to prove that the global sections functor Γ is fully faithful for the graded ringed space (M, Ω̂_M), a technical step that underpins the reduction from geometric to algebraic homotopy theory.",
      "relation": "builds_on",
      "title": "Note on the Serre-Swan theorem"
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
      "description": "No public code repository, formal proof artifact, license, or pinned release is provided for reproducing the headline theorem that L_infinity spaces over a dg manifold form a category of fibrant objects; a formal artifact such as formalization/Theorem1_CFO.lean would close this proof-as-code gap.",
      "severity": "critical"
    },
    {
      "area": "code",
      "description": "The homotopy transfer result for curved L_infinity algebras over filtered cdgas is load-bearing for the paper but is only supplied as mathematical prose; a machine-checkable proof such as formalization/HomotopyTransfer.lean is not provided.",
      "severity": "major"
    },
    {
      "area": "code",
      "description": "The abstract's implication for transitive L_infinity algebroids depends on the companion paper result, but no bundled formalization or reproducible proof artifact links that dependency to this paper; an artifact such as formalization/CompanionEquivalence.lean would be needed for end-to-end reproduction.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "No computational environment, proof-assistant version, dependency lockfile, or build instructions are specified because the paper is presented as a pure mathematical proof rather than a reproducible formal or numerical artifact.",
      "severity": "major"
    }
  ],
  "confidence": 0.87,
  "data_availability": "unspecified",
  "data_url": null,
  "environment": {
    "dependencies": [
      "Mathematical setting: filtered commutative differential graded algebras over R with descending, separated, exhaustive, complete filtrations",
      "Curved L_infinity algebras and curved L_infinity spaces over dg manifolds",
      "Homological perturbation theory and category-of-fibrant-objects axioms"
    ],
    "hardware": null,
    "software": null
  },
  "reproducibility_score": 0.24
}
```

### summary (`claude-haiku-4-5`) — status: `pass`

```json
{
  "audience": "Researchers in differential geometry, algebraic topology, and higher algebra, particularly those working with derived geometry, dg manifolds, L∞ structures, and homotopical algebra.",
  "key_contributions": [
    "Proves that L∞ spaces over dg manifolds form a category of fibrant objects (Theorem 1)",
    "Establishes that the fibrancy functor from algebroids to spaces can be interpreted as a fibrant replacement",
    "Develops a homotopy transfer theorem for curved L∞ algebras over filtered cdgas",
    "Shows that the global sections functor from L∞ spaces to curved L∞ algebras is fully faithful and establishes an equivalence with a suitable subcategory",
    "Provides technical machinery for comparing homotopy theories of geometric and algebraic structures via homological perturbation of curved complexes"
  ],
  "plain_language_summary": "This paper studies the homotopy theory of L∞ spaces—geometric structures that generalize Lie algebras to allow higher-order bracket operations—over differential graded (dg) manifolds. The main result establishes that these spaces form a category of fibrant objects, meaning they have the right structure for homotopy-theoretic computations. This extends classical homotopy transfer theorems, which describe how algebraic structures can be transferred along deformation retracts, to the curved setting where the underlying differential has non-zero square. The authors develop this theory by translating geometric questions about L∞ spaces into algebraic problems about curved L∞ algebras over filtered commutative differential graded algebras, then applying adapted versions of existing homotopy transfer techniques.",
  "tldr": "The paper proves that L∞ spaces over dg manifolds form a category of fibrant objects, extending homotopy transfer theorems for curved L∞ algebras to the filtered setting."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `pass`

```json
{
  "claims": [
    {
      "assessment": "partially_supported",
      "claim": "Theorem 1 (= Theorem 30): The category L_infty Sp(M) of curved L_infty spaces over a dg manifold M forms a category of fibrant objects (CFO).",
      "evidence": "The proof reduces the claim to Proposition 28 (CFO structure on L_infty Alg(R_M)_fgp) via the equivalence in Proposition 18, then transports the simplicial-frame and pullback constructions back along Gamma. The argument is internally coherent and rests on Propositions 15, 23, 27, which are all proved in the paper, but the result is a load-bearing, code-amenable categorical statement that ships no executable formal proof.",
      "id": "C1",
      "location": "Section 1 (Theorem 1) and Section 3 (Theorem 30).",
      "severity": "major",
      "suggested_fix": "Per the proof-as-code axiom for math.*: provide a formal verification of the CFO axioms (terminal object, pullback of fibrations, path-space factorization) and of the framing functor, e.g. in src/proofs/CFO_LinftySp.lean (Lean 4 / mathlib4), so a machine-checkable artifact certifies Theorem 1/30."
    },
    {
      "assessment": "supported",
      "claim": "Proposition 18: The global sections functor Gamma : L_infty Sp(M) -> L_infty Alg(R_M)_fgp is well-defined and fully faithful, and restricts to a quasi-inverse equivalence with S on L_infty Alg(R_M)_vec.",
      "evidence": "The proof combines Proposition 15 (verifying assumptions [a1] and [a2] for (M, hatOmega_M)) with Lemma 13 (general Serre--Swan-style equivalence under [a1], [a2]). The argument that S(g_M) coincides with the completed base change along restriction maps and is therefore a sheaf of curved L_infty algebras is correct given finite-rank projectivity. The Sardanashvily refinement-of-cover argument is standard.",
      "id": "C2",
      "location": "Section 2 (Proposition 18), proof immediately after.",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Proposition 23: For a fibration phi : g -> m and arbitrary psi : n -> m in L_infty Alg(R)_fgp, the fiber product g x_m n exists, and if phi is a trivial fibration then so is the projection ~phi : g x_m n -> n.",
      "evidence": "After reducing to the strict case via Lemma 24, the explicit construction on k oplus n (where k = ker phi_1) with the brackets characterized by eqs. (compphi)/(pullback-morphism) is consistent. The unique-solution claim for ~psi was spot-checked: with p = id - s phi_1, one has p s = 0, so p (x_1 + s psi_1(y_1)) = x_1 and p (s psi_n) = 0, matching the stated side conditions. The D^2 = 0 argument via injectivity of (CE(~phi), CE(~psi)) is the standard Getzler/Rogers argument cited.",
      "id": "C3",
      "location": "Section 3 (Proposition 23); proof spans pages following Lemma 24.",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Lemma 24: Every fibration in L_infty Alg(R)_fgp is strict up to isomorphism.",
      "evidence": "The splitting s : m[1] -> g[1] of phi_1 exists because m is projective over R^sharp (this is the substantive use of the fgp condition). The conjugating automorphism Psi has Psi_n = s o phi_n for n != 1, and the computed Taylor coefficients of Phi o Psi reduce to phi_n by phi_1 o s = id. The check that Psi is invertible uses completeness of the filtration on hatSym(g[1]), which holds.",
      "id": "C4",
      "location": "Section 3 (Lemma 24).",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Proposition 27: For each n, the diagram l_n g -> g_n = W_n^sharp tensor g ->> r_n g = g^{oplus(n+1)} is a factorization of the diagonal in L_infty Alg(R)_fgp, with the left leg a weak equivalence and the right leg a fibration.",
      "evidence": "The weak-equivalence leg uses acyclicity of Omega_n and the homotopy transfer along Dupont's contraction (Lemmas 25, 26 + Proposition 44). The right-leg surjectivity reduces to surjectivity of vertex evaluation on W_n^sharp, which is standard. Commutativity of the diagram is reduced to s_n o iota_n = 0 and ev_n o s_n = 0, both consequences of h_n^i(1) = 0 and epsilon_i^n h_n^i = 0 plus anticommutation h_n^i h_n^j + h_n^j h_n^i = 0; these identities are quoted from Getzler 2009 (Lemma 3.4, Theorem 3.11) rather than reproved.",
      "id": "C5",
      "location": "Section 3 (Proposition 27).",
      "severity": "minor",
      "suggested_fix": "Either include the explicit verification of the Dupont side conditions (h_n^i h_n^j + h_n^j h_n^i = 0 and epsilon_i^n h_n^i = 0) or, per the proof-as-code axiom, ship a checked computation (e.g. experiments/dupont/contraction_identities.py) for the Whitney/Dupont identities used in this proof."
    },
    {
      "assessment": "supported",
      "claim": "Lemma 41 (Berglund): For n > 0, G restricted to Sym^n_{R^sharp}(g[1]) equals (1/n) sum_{epsilon in {0,1}^n} C(n-1, |epsilon|)^{-1} (ip)^{epsilon_1} tensor ... tensor (ip)^{epsilon_n}, with the convention C(n-1, n)^{-1} = 0.",
      "evidence": "Spot-checked the combinatorial identity c_{|epsilon|} = (1/n) [(n-|epsilon|)/C(n-1,|epsilon|) - |epsilon|/C(n-1,|epsilon|-1)]. For 0 < |epsilon| < n one has (n-|epsilon|) (n-1-|epsilon|)! = (n-|epsilon|)!, so both terms equal |epsilon|!(n-|epsilon|)!/(n-1)!, giving c_{|epsilon|} = 0. The boundary values c_0 = 1, c_n = -1 are immediate. The result agrees with Berglund's symmetrized tensor trick.",
      "id": "C6",
      "location": "Appendix (Lemma 41) and proof.",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Lemma 43: After perturbation by mu = D_g - d, the maps p_mu and i_mu are morphisms of filtered graded cocommutative coalgebras and D_h = delta + p_mu mu i is a coderivation compatible with D_R.",
      "evidence": "The coalgebra-morphism identity (p_mu tensor p_mu) Delta = Delta p_mu is derived using (h tensor h) Delta h = 0 and related vanishings, plus invertibility of id + mu h on the complete filtered coalgebra. The combinatorial step (h mu)^k ip = (1/k!)(L_h mu)^k ip is justified using Lemma 41 and the (1/m) sum_{epsilon} C(m-1,|epsilon|)^{-1} = 1 identity, which checks: sum_{r=0}^{m-1} C(m-1,r) C(m-1,r)^{-1} = m. The coderivation/D_R compatibility of D_h follows from the listed pieces being coderivations / coalgebra morphisms / R^sharp-linear, as claimed.",
      "id": "C7",
      "location": "Appendix (Lemma 43) and proof.",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Proposition 44 (Homotopy Transfer Theorem): A contraction h of a curved L_infty algebra g induces a curved L_infty algebra structure on h = ker[l_1, h] with curvature p(l_0) and unary bracket p l_1 i, and the perturbed maps p_mu, i_mu are weak equivalences with (p_mu)_0 = (i_mu)_0 = 0, (p_mu)_1 = p, (i_mu)_1 = i.",
      "evidence": "Follows formally from Lemma 43 plus the linear-component readoff. The weak-equivalence claim uses that (Gr p, Gr i, Gr h) is a strong deformation retract of complexes from (Gr g, Gr l_1) to (Gr h, Gr p l_1 i), which is immediate from the definitions and the contraction axioms. The closing computation pi(l_0) = l_0 and ip(l_0) = l_0 (using h(l_0) = 0) confirms curvature is preserved.",
      "id": "C8",
      "location": "Appendix (Proposition 44).",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Proposition 15: The graded ringed space (M, hatOmega_M) underlying a curved L_infty space is fine ([a1]) and kernels of surjective morphisms between locally free finite-rank hatOmega_M-modules are again locally free ([a2]).",
      "evidence": "Fineness follows from the splitting of graded manifolds (hatOmega_M is a C^infty_M-module, hence fine). The [a2] argument tensors a surjection rho : hatOmega tensor E -> hatOmega tensor F up from its zeroth component rho_0, splits rho_0 via Lemma 16, then inverts id + ~s o (rho - ~rho_0). The invertibility step uses completeness of the filtration on hatOmega_M, which is given. The crucial input Lemma 16 (kernel of a surjection of locally free O_M-modules is locally free) is attributed to Proposition 2.6 of the companion paper cattaneojiang26 and not reproved here.",
      "id": "C9",
      "location": "Section 2 (Proposition 15), proof using Lemma 17 and Lemma 16.",
      "severity": "minor",
      "suggested_fix": "Either include a self-contained proof of Lemma 16 or, since cattaneojiang26 is cited as the dependency, gate this paper on the companion's availability and explicitly state the assumption (e.g. parity of grading or characteristic) under which Lemma 16 is proved."
    },
    {
      "assessment": "supported",
      "claim": "Lemma 17: Every locally free graded hatOmega_M-module g of finite total rank is of the form hatOmega_M tensor_{O_M} E for some locally free graded O_M-module E of finite total rank.",
      "evidence": "The proof exhibits a splitting iota : E = Gr^0 g -> g of the short exact sequence 0 -> F^1 g -> g -> E -> 0 (using fineness and local freeness), then shows the induced ~iota : hatOmega tensor E -> g is locally an isomorphism. Completeness of the filtration on hatOmega_M is invoked correctly to upgrade 'locally iso' to 'iso'.",
      "id": "C10",
      "location": "Section 2 (Lemma 17).",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Lemma 12 / Lemma 13 (Serre--Swan-style): For (X, O_X) satisfying [a1] and [a2], Gamma is fully faithful, S Gamma = id on O_X-mod, and Gamma : Vec(X) -> Fgp(A)_vec is a quasi-inverse equivalence to S.",
      "evidence": "Lemma 12 (S fully faithful on Fgp(A)) is a clean tensor-with-finitely-generated-projective-commutes-with-limits argument. Lemma 13 relies on Lemma 2.3 and Proposition 2.5 of morye2013note for the iso S(Gamma(E)) ~= E, which the authors note works in the graded setting because the extension is 'straightforward' (footnote 2). The Sardanashvily refinement-of-cover argument is sketched but correct.",
      "id": "C11",
      "location": "Section 2 (Lemmas 12, 13, Proposition 14).",
      "severity": "minor",
      "suggested_fix": "Briefly verify (or cite a precise reference for) the graded-ringed-space generalization of Morye's Lemma 2.3 / Proposition 2.5, since the cited paper is stated for the ungraded setting."
    },
    {
      "assessment": "partially_supported",
      "claim": "Theorem 1's corollary in the abstract: Transitive L_infty algebroids over a dg manifold also form a category of fibrant objects.",
      "evidence": "This is presented as an immediate consequence of Theorem 1 together with the first main result of the companion paper cattaneojiang26, which is not yet available for verification here (cited with date=2026 and no arXiv id). The transport of the CFO structure along an equivalence is formally trivial, but the substantive content — the equivalence L_infty Algd_fib ~= L_infty Sp — is in the companion.",
      "id": "C12",
      "location": "Abstract; introduction.",
      "severity": "minor",
      "suggested_fix": "Make the dependency on cattaneojiang26 explicit in the abstract and theorem statement, and either include the relevant equivalence statement as an assumption or wait for the companion to be publicly available before quoting the corollary."
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

