# The Goncharov Lie coalgebra of a field

GrokRxiv review of [arXiv:2606.23863](https://arxiv.org/abs/2606.23863) · `math.KT`

_Authors_: Alexander Kupers, Daniil Rudenko, Ismael Sierra

## TL;DR

The paper introduces the Goncharov Lie coalgebra G(F) via E∞-homology of $BGL(F)_Q$, provides an explicit correlator presentation with cobracket formula, identifies $G_n(F)$ with classical groups in weights 1–3, and applies the Rognes rank spectral sequence to give symbolic descriptions of K⁽³⁾₄(F)_Q and the indecomposable part of K⁽³⁾₅(F)_Q for arbitrary fields. The technical_correctness specialist (overall_correctness: mostly_sound, confidence 0.55) found the core results partially_supported rather than incorrect: the combinatorial details of the decomposition relation and co-Jacobi verification are deferred to body sections not visible in the introduction extract, and six claims carry major severity due to absence of executable companions. The reproducibility specialist (confidence 0.82, reproducibility_score 0.18) flagged two critical-severity concerns — no proof-as-code for the headline Theorem 1 and no formal artifact for the Lie coalgebra presentation and cobracket — plus four major-severity concerns covering motivic/Hodge realizations, Theorem 2, computer-assisted work in §7.3.3, and the absent environment specification. The novelty specialist (confidence 0.72, novelty_score 0.75, verdict: significant) situates the work as building directly on GKRW20 and Charlton–Radchenko–Rudenko, competing with CMRR24 and Bol24, and notes two missing prior-art citations (Gangl 2002; Dupont–Sah). The citation agent timed out entirely (confidence 0.0, zero entries), leaving citation accuracy unverified; bibliography metadata for entries [9], [31], [48], [69], [96] carries dates that require cross-checking. Recommendation gate applied: the paper is in the code-amenable field math.KT/math.AT; reproducibility flagged missing proof-as-code at critical severity for the headline claim (Theorem 1, Theorem thm:polyl-presentation-additive); no code repository or proof assistant artifact accompanies the paper. Default recommendation is therefore major_revision. The mathematical content appears mostly sound, and the work is clearly significant; the blocking issues are verifiability and documentation, not demonstrated incorrectness.

_Recommendation_: **Major revision** · _Confidence_: 63%

## Strengths

- The construction of G(F) via E∞-homology of $BGL(F)_Q$ is homotopy-theoretically rigorous, grounding a previously conjectural Lie coalgebra in a framework whose slope-2 vanishing line was established by the peer-reviewed [GKRW20].
- The explicit correlator presentation — four families of relations (homogeneity, cyclic symmetry, shuffle, decomposition) and a closed cobracket formula — provides a concrete computational handle that recovers and unifies the classical Bloch group and Bloch–Suslin group as special cases in weights 2 and 3.
- The identification of $G_n(F)$ with F^×_Q, $B_2(F)_Q$, and $B_3(F)_Q$ in weights 1–3 recovers Suslin's K₃ result and Goncharov's weight-3 complex within a single framework, and is cross-validated by the independently established result of Bol24 for the i=n-1 case.
- Using the Rognes rank spectral sequence to obtain symbolic K-theory descriptions at weight 3 for arbitrary fields is a genuinely new application of the GKRW20 programme and extends the reach of polylogarithmic methods beyond number fields.
- The construction of motivic and Hodge realization functors connecting G(F) to $MTM_Q(F)$ and to mixed Hodge structures closes a gap in the programme initiated by Goncharov [Gon95b, Gon19] and provides a universal target for comparison with existing regulators.

## Weaknesses

- No executable proof-as-code artifact is provided for the headline weight-3 K-theory result in Theorem 1, leaving the claimed isomorphism K⁽³⁾₄(F)_Q ≅ H²($G(F))_3$ and exact sequence unverifiable by an independent reader; reproducibility specialist flagged this at critical severity.
- No formal proof artifact is provided for the Goncharov Lie coalgebra presentation and cobracket formula, despite the decomposition relation and co-Jacobi identity being directly amenable to symbolic computer-algebra verification at low weight; reproducibility specialist flagged this at critical severity.
- The combinatorial details of the decomposition relation — the tree enumeration T(n) and sign rule sign(ι) — are deferred to Proposition 26, which is not exhibited in the extract reviewed; technical correctness flagged claims C2 and C12 at major severity on this basis.
- The co-Jacobi identity and antisymmetry of the cobracket formula are asserted in the introduction without an explicit self-contained verification in the visible text; technical correctness flagged claim C3 at major severity.
- The motivic and Hodge realization functors are described without a machine-checkable construction artifact; no comparison of the cobracket with Goncharov's coproduct on a generating set is exhibited in the reviewed extract (technical correctness C6, reproducibility concern 3, both major).
- Computer-assisted methods acknowledged in §7.3.3 are fully undocumented: no scripts, inputs, library versions, random seeds, or outputs are supplied; reproducibility flagged this at major severity.
- Two directly relevant prior works are not cited: Gangl (2002) on functional equations for weight-3 and higher polylogarithms, and Dupont–Sah on scissors congruences and the Bloch–Wigner function, both of which are immediate predecessors of weight-3 results recovered in the paper.
- The citation agent timed out with zero entries (confidence 0.0), leaving citation accuracy entirely unverified; bibliography entries [9], [31], [48], [69], [96] carry dates (2025–2026) and an arXiv prefix (2603) that require cross-checking against MathSciNet/zbMATH.

## Revision Targets

- [ ] **Code release and entrypoints**
  - Location: code/reproducibility artifacts: `code release and execution entrypoints`
  - Evidence: No formal proof-as-code artifact is provided for the headline weight-3 K-theory result in Theorem 1; a reproducing artifact such as formalization/TheoremWeight3.lean would be needed to independently check the claimed isomorphism and exact sequence.
  - Required change: Release the source code, scripts, model configuration, and execution entrypoints needed to regenerate the reported tables, or document why those artifacts cannot be released.
  - Verification: Re-review should confirm runnable code or a documented non-release justification is present.
- [ ] **Manuscript: Whole paper (no code artifact accompanies the introduction or stated results)**
  - Location: `Whole paper (no code artifact accompanies the introduction or stated results)`
  - Evidence: The supplied prompt material (Title, Abstract, Introduction, Bibliography, verified-fact blocks) shows no link to a code repository, no Lean/Coq/Agda formalisation, and no Sage/Python companion. PROOF-AS-CODE AXIOM applies: this is a math.KT / math.AT paper whose load-bearing results include explicit combinatorial relations (decomposition relation, cobracket formula, presentation of St^∞ in low n, Chevalley–Eilenberg complex Λ^* G(F) in weight 3) that are directly verifiable by computer algebra at low n.
  - Required change: Ship a companion code repository providing at minimum: (i) src/correlators/relations.py — symbolic enforcement and consistency checks of homogeneity, cyclic, shuffle, and decomposition relations for n ≤ 5 over Q and over $F_p$; (ii) src/cobracket/cojacobi.py — verification of antisymmetry and co-Jacobi for the cobracket on $Cor^G$ generators up to n = 5; (iii) src/identifications/B2_B3.py — verification of the five-term and 22-term relations for the explicit maps F^× → $G_1$, $B_2$ → $G_2$, $B_3$ → $G_3$; (iv) experiments/weight3/k_theory_check.py — for F = Q (or a small number field), numerically check $K^{(3)}_4(F)_Q$ ≅ $H^2(G(F))_3$ in low rank; and ideally (v) a Lean 4 / Mathlib formalisation src/Proofs/G_Lie_Coalgebra.lean of the Lie coalgebra structure and cobracket on G(F).
  - Verification: Re-review should confirm `Whole paper (no code artifact accompanies the introduction or stated results)` is corrected or justified.
- [ ] **Manuscript: Remark 2 and Theorem thm:polyl-presentation-additive item (iv); detail in Proposition 26**
  - Location: `Remark 2 and Theorem thm:polyl-presentation-additive item (iv); detail in Proposition 26`
  - Evidence: The exact combinatorial data T(n) and sign(ι) are deferred to Proposition 26, which is not in the supplied excerpt. The relation drives the entire presentation of G(F) and hence the headline weight-3 theorem; its combinatorial well-definedness (independence of the auxiliary tree choice, equivariance under the cyclic and shuffle relations, internal consistency on overlapping ($x_i$, $y_i$) substitutions) must be verified. The PROOF-AS-CODE axiom applies: the relation is purely combinatorial and ideally suited to symbolic computer verification.
  - Required change: Add an executable artifact (e.g. src/correlators/symbol_combinatorics.py or experiments/symbols/check_T_n.sage) that (a) implements the tree enumeration defining T(n) and the sign rule sign(ι) for n ≤ 6, (b) verifies independence of the auxiliary choices, and (c) checks that the resulting relation is consistent with homogeneity, cyclic symmetry, and shuffle on random affine bases over a small field. Optionally formalise in src/Symbols/Combinatorics.lean.
  - Verification: Re-review should confirm `Remark 2 and Theorem thm:polyl-presentation-additive item (iv); detail in Proposition 26` is corrected or justified.
- [ ] **Manuscript: Whole paper (no code artifact accompanies the introduction or stated results)**
  - Location: `Whole paper (no code artifact accompanies the introduction or stated results)`
  - Evidence: The supplied prompt material (Title, Abstract, Introduction, Bibliography, verified-fact blocks) shows no link to a code repository, no Lean/Coq/Agda formalisation, and no Sage/Python companion. PROOF-AS-CODE AXIOM applies: this is a math.KT / math.AT paper whose load-bearing results include explicit combinatorial relations (decomposition relation, cobracket formula, presentation of St^∞ in low n, Chevalley–Eilenberg complex Λ^* G(F) in weight 3) that are directly verifiable by computer algebra at low n.
  - Required change: Ship a companion code repository providing at minimum: (i) src/correlators/relations.py — symbolic enforcement and consistency checks of homogeneity, cyclic, shuffle, and decomposition relations for n ≤ 5 over Q and over $F_p$; (ii) src/cobracket/cojacobi.py — verification of antisymmetry and co-Jacobi for the cobracket on $Cor^G$ generators up to n = 5; (iii) src/identifications/B2_B3.py — verification of the five-term and 22-term relations for the explicit maps F^× → $G_1$, $B_2$ → $G_2$, $B_3$ → $G_3$; (iv) experiments/weight3/k_theory_check.py — for F = Q (or a small number field), numerically check $K^{(3)}_4(F)_Q$ ≅ $H^2(G(F))_3$ in low rank; and ideally (v) a Lean 4 / Mathlib formalisation src/Proofs/G_Lie_Coalgebra.lean of the Lie coalgebra structure and cobracket on G(F).
  - Verification: Re-review should confirm `Whole paper (no code artifact accompanies the introduction or stated results)` is corrected or justified.
- [ ] **Code release and entrypoints**
  - Location: code/reproducibility artifacts: `code release and execution entrypoints`
  - Evidence: The paper claims motivic and Hodge realisation functors but provides no machine-checkable construction artifact; a file such as formalization/Realisations.lean would be needed to reproduce these categorical constructions.
  - Required change: Release the source code, scripts, model configuration, and execution entrypoints needed to regenerate the reported tables, or document why those artifacts cannot be released.
  - Verification: Re-review should confirm runnable code or a documented non-release justification is present.
- [ ] **Code release and entrypoints**
  - Location: code/reproducibility artifacts: `code release and execution entrypoints`
  - Evidence: The acknowledgments mention computer-assisted methods for Section 7.3.3 and discussions around the duality computation, but no scripts, inputs, versions, or outputs are supplied; artifacts such as code/trilog_computation/README.md and code/duality_computation/README.md would be needed to rerun those checks.
  - Required change: Release the source code, scripts, model configuration, and execution entrypoints needed to regenerate the reported tables, or document why those artifacts cannot be released.
  - Verification: Re-review should confirm runnable code or a documented non-release justification is present.
- [ ] **Bibliography: Dupont–Sah – Scissors congruences and Bloch–Wigner function**
  - Location: bibliography entry: `Dupont–Sah – Scissors congruences and Bloch–Wigner function`
  - Evidence: The paper discusses connections between G3(F) and trilogarithms/scissors congruences through Goncharov's scissors Hopf algebra, but work of Dupont–Sah directly relating the Bloch–Wigner function to K-theory and hyperbolic geometry is not explicitly cited, despite being a direct predecessor of the weight-2/weight-3 story.
  - Required change: Add or discuss missing prior art `Dupont–Sah – Scissors congruences and Bloch–Wigner function`. The paper discusses connections between G3(F) and trilogarithms/scissors congruences through Goncharov's scissors Hopf algebra, but work of Dupont–Sah directly relating the Bloch–Wigner function to K-theory and hyperbolic geometry is not explicitly cited, despite being a direct predecessor of the weight-2/weight-3 story.
  - Verification: Re-review should confirm the related-work discussion addresses this prior art.
- [ ] **Manuscript: Bibliography (entries [9], [31], [48], [69], [96])**
  - Location: `Bibliography (entries [9], [31], [48], [69], [96])`
  - Evidence: Several references list publication years (2025, 2026) and an arXiv identifier 'arXiv:2603.29910' (entry [96] PRY) that are forward-dated or use an arXiv ID prefix that does not correspond to standard yymm.NNNNN format (the YYMM '2603' would imply March 2026, beyond the assistant's knowledge cutoff). The 'Duke Math. J. 174 (2025), no. 14' citation for [GKRW20] has an unusually high issue number for Duke Math. J. and warrants confirmation. These are not technical-correctness issues per se but are factual claims that affect external verifiability.
  - Required change: Cross-check publication metadata against MathSciNet/zbMATH at compile time, and (if a date discrepancy is intentional because of forward-dated journal volumes) add a comment to the .bib file. Replace any genuinely fictitious or forward-dated references with their current arXiv identifiers.
  - Verification: Re-review should confirm `Bibliography (entries [9], [31], [48], [69], [96])` is corrected or justified.

## Open Questions

- Can the authors provide a companion code repository with at minimum: symbolic enforcement of the four presentation relations for n ≤ 5 over Q and $F_p$; verification of antisymmetry and co-Jacobi for the cobracket on correlators up to n = 5; and checks of the five-term and Goncharov 22-term relations for the maps $B_2$ → $G_2$ and $B_3$ → $G_3$?
- What software, proof assistant, library versions, and computational parameters were used for the computer-assisted work in §7.3.3? Can the scripts and raw outputs be deposited alongside the paper?
- Which parts of the proof of Theorem 1 require F to be infinite or of characteristic zero, and what (if any) restrictions apply to fields of positive characteristic?
- What is the precise relationship between G(F) constructed here and the Lie coalgebra Lf(F) of formal multiple polylogarithms in CMRR24 for a general field F, not only number fields?
- How does the proof of Theorem 1(i) compare mechanistically with Bolbachan's [Bol24] independent proof of the i=n-1 case, and do the two approaches provide mutual cross-validation for the weight-3 result?
- Can the authors confirm or correct the bibliographic metadata for entries [9] BCN (Mem. Amer. Math. Soc. 315 (2025), no. 1597), [31] CMRR24 (IMRN 2026 no. 2), [48] GKRW20 (Duke Math. J. 174 (2025), no. 14), [69] HeineMM (Selecta Math. 2026), and [96] PRY (arXiv:2603.29910)?

## Per-Agent Reviews

### citation (`claude-sonnet-4-6`) — status: `fail`

```json
{
  "confidence": 0.0,
  "entries": [],
  "missing_references": [],
  "summary": "Citation-use agent failed before producing a normal citation relevance review. Deterministic citation verification still runs separately; see external citation checks and verifier provenance for existence, DOI, URL, and resolver evidence. Failure: CliRunner timed out after 900s for role citation (subprocess killed)"
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.63,
  "questions": [
    "Can the authors provide a companion code repository with at minimum: symbolic enforcement of the four presentation relations for n ≤ 5 over Q and F_p; verification of antisymmetry and co-Jacobi for the cobracket on correlators up to n = 5; and checks of the five-term and Goncharov 22-term relations for the maps B_2 → G_2 and B_3 → G_3?",
    "What software, proof assistant, library versions, and computational parameters were used for the computer-assisted work in §7.3.3? Can the scripts and raw outputs be deposited alongside the paper?",
    "Which parts of the proof of Theorem 1 require F to be infinite or of characteristic zero, and what (if any) restrictions apply to fields of positive characteristic?",
    "What is the precise relationship between G(F) constructed here and the Lie coalgebra Lf(F) of formal multiple polylogarithms in CMRR24 for a general field F, not only number fields?",
    "How does the proof of Theorem 1(i) compare mechanistically with Bolbachan's [Bol24] independent proof of the i=n-1 case, and do the two approaches provide mutual cross-validation for the weight-3 result?",
    "Can the authors confirm or correct the bibliographic metadata for entries [9] BCN (Mem. Amer. Math. Soc. 315 (2025), no. 1597), [31] CMRR24 (IMRN 2026 no. 2), [48] GKRW20 (Duke Math. J. 174 (2025), no. 14), [69] HeineMM (Selecta Math. 2026), and [96] PRY (arXiv:2603.29910)?"
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "No formal proof-as-code artifact is provided for the headline weight-3 K-theory result in Theorem 1; a reproducing artifact such as formalization/TheoremWeight3.lean would be needed to independently check the claimed isomorphism and exact sequence.",
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
      "evidence": "The supplied prompt material (Title, Abstract, Introduction, Bibliography, verified-fact blocks) shows no link to a code repository, no Lean/Coq/Agda formalisation, and no Sage/Python companion. PROOF-AS-CODE AXIOM applies: this is a math.KT / math.AT paper whose load-bearing results include explicit combinatorial relations (decomposition relation, cobracket formula, presentation of St^∞ in low n, Chevalley–Eilenberg complex Λ^* G(F) in weight 3) that are directly verifiable by computer algebra at low n.",
      "id": "weakness-2",
      "locator": "Whole paper (no code artifact accompanies the introduction or stated results)",
      "required_update": "Ship a companion code repository providing at minimum: (i) src/correlators/relations.py — symbolic enforcement and consistency checks of homogeneity, cyclic, shuffle, and decomposition relations for n ≤ 5 over Q and over F_p; (ii) src/cobracket/cojacobi.py — verification of antisymmetry and co-Jacobi for the cobracket on Cor^G generators up to n = 5; (iii) src/identifications/B2_B3.py — verification of the five-term and 22-term relations for the explicit maps F^× → G_1, B_2 → G_2, B_3 → G_3; (iv) experiments/weight3/k_theory_check.py — for F = Q (or a small number field), numerically check K^{(3)}_4(F)_Q ≅ H^2(G(F))_3 in low rank; and ideally (v) a Lean 4 / Mathlib formalisation src/Proofs/G_Lie_Coalgebra.lean of the Lie coalgebra structure and cobracket on G(F).",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Whole paper (no code artifact accompanies the introduction or stated results)` is corrected or justified.",
      "weakness_index": 1
    },
    {
      "evidence": "The exact combinatorial data T(n) and sign(ι) are deferred to Proposition 26, which is not in the supplied excerpt. The relation drives the entire presentation of G(F) and hence the headline weight-3 theorem; its combinatorial well-definedness (independence of the auxiliary tree choice, equivariance under the cyclic and shuffle relations, internal consistency on overlapping (x_i, y_i) substitutions) must be verified. The PROOF-AS-CODE axiom applies: the relation is purely combinatorial and ideally suited to symbolic computer verification.",
      "id": "weakness-3",
      "locator": "Remark 2 and Theorem thm:polyl-presentation-additive item (iv); detail in Proposition 26",
      "required_update": "Add an executable artifact (e.g. src/correlators/symbol_combinatorics.py or experiments/symbols/check_T_n.sage) that (a) implements the tree enumeration defining T(n) and the sign rule sign(ι) for n ≤ 6, (b) verifies independence of the auxiliary choices, and (c) checks that the resulting relation is consistent with homogeneity, cyclic symmetry, and shuffle on random affine bases over a small field. Optionally formalise in src/Symbols/Combinatorics.lean.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Remark 2 and Theorem thm:polyl-presentation-additive item (iv); detail in Proposition 26` is corrected or justified.",
      "weakness_index": 2
    },
    {
      "evidence": "The supplied prompt material (Title, Abstract, Introduction, Bibliography, verified-fact blocks) shows no link to a code repository, no Lean/Coq/Agda formalisation, and no Sage/Python companion. PROOF-AS-CODE AXIOM applies: this is a math.KT / math.AT paper whose load-bearing results include explicit combinatorial relations (decomposition relation, cobracket formula, presentation of St^∞ in low n, Chevalley–Eilenberg complex Λ^* G(F) in weight 3) that are directly verifiable by computer algebra at low n.",
      "id": "weakness-4",
      "locator": "Whole paper (no code artifact accompanies the introduction or stated results)",
      "required_update": "Ship a companion code repository providing at minimum: (i) src/correlators/relations.py — symbolic enforcement and consistency checks of homogeneity, cyclic, shuffle, and decomposition relations for n ≤ 5 over Q and over F_p; (ii) src/cobracket/cojacobi.py — verification of antisymmetry and co-Jacobi for the cobracket on Cor^G generators up to n = 5; (iii) src/identifications/B2_B3.py — verification of the five-term and 22-term relations for the explicit maps F^× → G_1, B_2 → G_2, B_3 → G_3; (iv) experiments/weight3/k_theory_check.py — for F = Q (or a small number field), numerically check K^{(3)}_4(F)_Q ≅ H^2(G(F))_3 in low rank; and ideally (v) a Lean 4 / Mathlib formalisation src/Proofs/G_Lie_Coalgebra.lean of the Lie coalgebra structure and cobracket on G(F).",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Whole paper (no code artifact accompanies the introduction or stated results)` is corrected or justified.",
      "weakness_index": 3
    },
    {
      "evidence": "The paper claims motivic and Hodge realisation functors but provides no machine-checkable construction artifact; a file such as formalization/Realisations.lean would be needed to reproduce these categorical constructions.",
      "id": "weakness-5",
      "locator": "code release and execution entrypoints",
      "required_update": "Release the source code, scripts, model configuration, and execution entrypoints needed to regenerate the reported tables, or document why those artifacts cannot be released.",
      "source_path": null,
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "code",
      "verification_check": "Re-review should confirm runnable code or a documented non-release justification is present.",
      "weakness_index": 4
    },
    {
      "evidence": "The acknowledgments mention computer-assisted methods for Section 7.3.3 and discussions around the duality computation, but no scripts, inputs, versions, or outputs are supplied; artifacts such as code/trilog_computation/README.md and code/duality_computation/README.md would be needed to rerun those checks.",
      "id": "weakness-6",
      "locator": "code release and execution entrypoints",
      "required_update": "Release the source code, scripts, model configuration, and execution entrypoints needed to regenerate the reported tables, or document why those artifacts cannot be released.",
      "source_path": null,
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "code",
      "verification_check": "Re-review should confirm runnable code or a documented non-release justification is present.",
      "weakness_index": 5
    },
    {
      "evidence": "The paper discusses connections between G3(F) and trilogarithms/scissors congruences through Goncharov's scissors Hopf algebra, but work of Dupont–Sah directly relating the Bloch–Wigner function to K-theory and hyperbolic geometry is not explicitly cited, despite being a direct predecessor of the weight-2/weight-3 story.",
      "id": "weakness-7",
      "locator": "Dupont–Sah – Scissors congruences and Bloch–Wigner function",
      "required_update": "Add or discuss missing prior art `Dupont–Sah – Scissors congruences and Bloch–Wigner function`. The paper discusses connections between G3(F) and trilogarithms/scissors congruences through Goncharov's scissors Hopf algebra, but work of Dupont–Sah directly relating the Bloch–Wigner function to K-theory and hyperbolic geometry is not explicitly cited, despite being a direct predecessor of the weight-2/weight-3 story.",
      "source_path": null,
      "source_role": "novelty",
      "status": "open",
      "target_kind": "bibliography",
      "verification_check": "Re-review should confirm the related-work discussion addresses this prior art.",
      "weakness_index": 6
    },
    {
      "evidence": "Several references list publication years (2025, 2026) and an arXiv identifier 'arXiv:2603.29910' (entry [96] PRY) that are forward-dated or use an arXiv ID prefix that does not correspond to standard yymm.NNNNN format (the YYMM '2603' would imply March 2026, beyond the assistant's knowledge cutoff). The 'Duke Math. J. 174 (2025), no. 14' citation for [GKRW20] has an unusually high issue number for Duke Math. J. and warrants confirmation. These are not technical-correctness issues per se but are factual claims that affect external verifiability.",
      "id": "weakness-8",
      "locator": "Bibliography (entries [9], [31], [48], [69], [96])",
      "required_update": "Cross-check publication metadata against MathSciNet/zbMATH at compile time, and (if a date discrepancy is intentional because of forward-dated journal volumes) add a comment to the .bib file. Replace any genuinely fictitious or forward-dated references with their current arXiv identifiers.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Bibliography (entries [9], [31], [48], [69], [96])` is corrected or justified.",
      "weakness_index": 7
    }
  ],
  "strengths": [
    "The construction of G(F) via E∞-homology of BGL(F)_Q is homotopy-theoretically rigorous, grounding a previously conjectural Lie coalgebra in a framework whose slope-2 vanishing line was established by the peer-reviewed [GKRW20].",
    "The explicit correlator presentation — four families of relations (homogeneity, cyclic symmetry, shuffle, decomposition) and a closed cobracket formula — provides a concrete computational handle that recovers and unifies the classical Bloch group and Bloch–Suslin group as special cases in weights 2 and 3.",
    "The identification of G_n(F) with F^×_Q, B_2(F)_Q, and B_3(F)_Q in weights 1–3 recovers Suslin's K₃ result and Goncharov's weight-3 complex within a single framework, and is cross-validated by the independently established result of Bol24 for the i=n-1 case.",
    "Using the Rognes rank spectral sequence to obtain symbolic K-theory descriptions at weight 3 for arbitrary fields is a genuinely new application of the GKRW20 programme and extends the reach of polylogarithmic methods beyond number fields.",
    "The construction of motivic and Hodge realization functors connecting G(F) to MTM_Q(F) and to mixed Hodge structures closes a gap in the programme initiated by Goncharov [Gon95b, Gon19] and provides a universal target for comparison with existing regulators."
  ],
  "summary": "The paper introduces the Goncharov Lie coalgebra G(F) via E∞-homology of BGL(F)_Q, provides an explicit correlator presentation with cobracket formula, identifies G_n(F) with classical groups in weights 1–3, and applies the Rognes rank spectral sequence to give symbolic descriptions of K⁽³⁾₄(F)_Q and the indecomposable part of K⁽³⁾₅(F)_Q for arbitrary fields. The technical_correctness specialist (overall_correctness: mostly_sound, confidence 0.55) found the core results partially_supported rather than incorrect: the combinatorial details of the decomposition relation and co-Jacobi verification are deferred to body sections not visible in the introduction extract, and six claims carry major severity due to absence of executable companions. The reproducibility specialist (confidence 0.82, reproducibility_score 0.18) flagged two critical-severity concerns — no proof-as-code for the headline Theorem 1 and no formal artifact for the Lie coalgebra presentation and cobracket — plus four major-severity concerns covering motivic/Hodge realizations, Theorem 2, computer-assisted work in §7.3.3, and the absent environment specification. The novelty specialist (confidence 0.72, novelty_score 0.75, verdict: significant) situates the work as building directly on GKRW20 and Charlton–Radchenko–Rudenko, competing with CMRR24 and Bol24, and notes two missing prior-art citations (Gangl 2002; Dupont–Sah). The citation agent timed out entirely (confidence 0.0, zero entries), leaving citation accuracy unverified; bibliography metadata for entries [9], [31], [48], [69], [96] carries dates that require cross-checking. Recommendation gate applied: the paper is in the code-amenable field math.KT/math.AT; reproducibility flagged missing proof-as-code at critical severity for the headline claim (Theorem 1, Theorem thm:polyl-presentation-additive); no code repository or proof assistant artifact accompanies the paper. Default recommendation is therefore major_revision. The mathematical content appears mostly sound, and the work is clearly significant; the blocking issues are verifiability and documentation, not demonstrated incorrectness.",
  "weaknesses": [
    "No executable proof-as-code artifact is provided for the headline weight-3 K-theory result in Theorem 1, leaving the claimed isomorphism K⁽³⁾₄(F)_Q ≅ H²(G(F))_3 and exact sequence unverifiable by an independent reader; reproducibility specialist flagged this at critical severity.",
    "No formal proof artifact is provided for the Goncharov Lie coalgebra presentation and cobracket formula, despite the decomposition relation and co-Jacobi identity being directly amenable to symbolic computer-algebra verification at low weight; reproducibility specialist flagged this at critical severity.",
    "The combinatorial details of the decomposition relation — the tree enumeration T(n) and sign rule sign(ι) — are deferred to Proposition 26, which is not exhibited in the extract reviewed; technical correctness flagged claims C2 and C12 at major severity on this basis.",
    "The co-Jacobi identity and antisymmetry of the cobracket formula are asserted in the introduction without an explicit self-contained verification in the visible text; technical correctness flagged claim C3 at major severity.",
    "The motivic and Hodge realization functors are described without a machine-checkable construction artifact; no comparison of the cobracket with Goncharov's coproduct on a generating set is exhibited in the reviewed extract (technical correctness C6, reproducibility concern 3, both major).",
    "Computer-assisted methods acknowledged in §7.3.3 are fully undocumented: no scripts, inputs, library versions, random seeds, or outputs are supplied; reproducibility flagged this at major severity.",
    "Two directly relevant prior works are not cited: Gangl (2002) on functional equations for weight-3 and higher polylogarithms, and Dupont–Sah on scissors congruences and the Bloch–Wigner function, both of which are immediate predecessors of weight-3 results recovered in the paper.",
    "The citation agent timed out with zero entries (confidence 0.0), leaving citation accuracy entirely unverified; bibliography entries [9], [31], [48], [69], [96] carry dates (2025–2026) and an arXiv prefix (2603) that require cross-checking against MathSciNet/zbMATH."
  ]
}
```

### novelty (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.72,
  "missing_prior_art": [
    {
      "reason": "The paper develops a theory of universal functional equations for multiple polylogarithms via the decomposition relation, but does not cite Gangl's explicit work on functional equations for weight-3 and higher polylogarithms, which established many of the specific relations recovered here in the weight-3 case.",
      "title": "Gangl – Functional equations for higher logarithms (2002)"
    },
    {
      "reason": "The paper discusses connections between G3(F) and trilogarithms/scissors congruences through Goncharov's scissors Hopf algebra, but work of Dupont–Sah directly relating the Bloch–Wigner function to K-theory and hyperbolic geometry is not explicitly cited, despite being a direct predecessor of the weight-2/weight-3 story.",
      "title": "Dupont–Sah – Scissors congruences and Bloch–Wigner function"
    }
  ],
  "novelty_score": 0.75,
  "related_work": [
    {
      "citation_key": "GKRW20",
      "delta": "Galatius–Kupers–Randal-Williams prove the slope-2 vanishing line for E∞-homology of BGL and identify it with homology of GL with infinite Steinberg module coefficients. The present paper defines the Goncharov Lie coalgebra as the critical-line entries of that E∞-homology and inherits the entire technical framework.",
      "relation": "builds_on",
      "title": "E∞-cells and general linear groups of infinite fields"
    },
    {
      "citation_key": "CharltonRadchenkoRudenko",
      "delta": "Charlton–Radchenko–Rudenko supply the presentation of the infinite Steinberg module via Steinberg correlators with explicit cobracket. The present paper uses this as the direct input to derive its own correlator presentation of G(F) and cobracket formula by passing to GL-coinvariants.",
      "relation": "builds_on",
      "title": "Multiple polylogarithms and the Steinberg module"
    },
    {
      "citation_key": "Gon95b",
      "delta": "Goncharov introduced B3(F), the weight-3 polylogarithmic complex Γ3(F), and stated the conjecture that K-groups are computed by its homology. The present paper proves cases of this conjecture (n=3, i=1,2) and identifies G3(F) with B3(F)_Q.",
      "relation": "prior_art",
      "title": "Geometry of configurations, polylogarithms, and motivic cohomology"
    },
    {
      "citation_key": "Gon19",
      "delta": "Goncharov's Hodge and motivic correlators are the targets of the realisations constructed in this paper. The formal-to-motivic and formal-to-Hodge realisation maps are uniquely determined by matching the paper's correlators to Goncharov's.",
      "relation": "builds_on",
      "title": "Hodge correlators"
    },
    {
      "citation_key": "Rognes",
      "delta": "Rognes constructed the rank filtration spectral sequence converging to K*(F). The present paper identifies the E1-page entries using G(F), determines the d1-differential via the cobracket, and deduces the theorems on K4(3)(F) and K5(3)(F) from the E2-page.",
      "relation": "builds_on",
      "title": "A spectrum level rank filtration in algebraic K-theory"
    },
    {
      "citation_key": "CMRR24",
      "delta": "Charlton–Matveiakin–Radchenko–Rudenko independently construct the Lie coalgebra Lf(F) of formal multiple polylogarithms with the same generator–relation structure. The present paper constructs G(F) by a homotopy-theoretic route and maps it to Lf(F) via formal realisation; the sequel promises that this map is an isomorphism for number fields.",
      "relation": "competing",
      "title": "The Hopf algebra of formal multiple polylogarithms"
    },
    {
      "citation_key": "Sus90",
      "delta": "Suslin's identification of K3(2)(F) via the Bloch group B2(F) is the weight-2 case of the conjecture the present paper addresses. The identification G2(F) ≅ B2(F)_Q recovers and reframes Suslin's result in the new framework.",
      "relation": "prior_art",
      "title": "K3 of a field, and the Bloch group"
    },
    {
      "citation_key": "BD94",
      "delta": "Beilinson–Deligne conjectured the existence of the category of mixed Tate motives and gave Beilinson's formula Kn(2n-i)(F) ≅ Ext^i in MTM. This paper proposes G(F) as the Lie coalgebra of mixed Tate motives and proves instances of Beilinson's formula.",
      "relation": "prior_art",
      "title": "Interprétation motivique de la conjecture de Zagier reliant polylogarithmes et régulateurs"
    },
    {
      "citation_key": "Bol24",
      "delta": "Bolbachan independently proves the case i=n-1 of Goncharov's conjecture for any weight. The present paper proves cases i=1,2 at weight n=3 by a different method (rank spectral sequence), and notes that case (1b) of its Theorem 1 is an instance of Bolbachan's result proved differently.",
      "relation": "competing",
      "title": "On the Goncharov's conjecture in degree m-1 and weight m"
    },
    {
      "citation_key": "MPW23",
      "delta": "Miller–Patzt–Wilson prove Koszulity of Steinberg modules and identify the infinite Steinberg module with the suspension spectrum of the common basis complex. The present paper uses these results to establish the duoidal structure on Steinberg modules and the Koszul duality underlying the cobracket construction.",
      "relation": "builds_on",
      "title": "On rank filtrations of algebraic K-theory and Steinberg modules"
    },
    {
      "citation_key": "NesterenkoSuslin",
      "delta": "The Nesterenko–Suslin comparison theorem (that the Levi and parabolic tensor products become isomorphic after applying dim!) is used crucially to identify the E∞-homology with homology of GL with Steinberg module coefficients and to justify the cobracket computation.",
      "relation": "builds_on",
      "title": "Homology of the general linear group over a local ring, and Milnor's K-theory"
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
      "description": "No formal proof-as-code artifact is provided for the headline weight-3 K-theory result in Theorem 1; a reproducing artifact such as formalization/TheoremWeight3.lean would be needed to independently check the claimed isomorphism and exact sequence.",
      "severity": "critical"
    },
    {
      "area": "code",
      "description": "No formal proof-as-code artifact is provided for the presentation of the Goncharov Lie coalgebra and its cobracket; artifacts such as formalization/PolylPresentation.lean and formalization/CobracketFormula.lean would be needed to reproduce the algebraic derivation.",
      "severity": "critical"
    },
    {
      "area": "code",
      "description": "The paper claims motivic and Hodge realisation functors but provides no machine-checkable construction artifact; a file such as formalization/Realisations.lean would be needed to reproduce these categorical constructions.",
      "severity": "major"
    },
    {
      "area": "code",
      "description": "Theorem 2 and the decomposition-relation machinery are load-bearing for the presentation but have no formal proof artifact; a file such as formalization/SteinbergRelations.lean would be needed to check the dependence on Steinberg-module relations.",
      "severity": "major"
    },
    {
      "area": "code",
      "description": "The acknowledgments mention computer-assisted methods for Section 7.3.3 and discussions around the duality computation, but no scripts, inputs, versions, or outputs are supplied; artifacts such as code/trilog_computation/README.md and code/duality_computation/README.md would be needed to rerun those checks.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "No reproducibility environment is specified for formal verification or the mentioned computer-assisted work, including proof assistant, library versions, random seeds, or hardware/software stack.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://web.archive.org/web/20211028202354/https://webusers.imj-prg.fr/` (status=network_error)",
      "severity": "minor"
    }
  ],
  "confidence": 0.82,
  "data_availability": "unspecified",
  "data_url": null,
  "environment": null,
  "reproducibility_score": 0.18
}
```

### summary (`claude-haiku-4-5`) — status: `pass`

```json
{
  "audience": "Algebraic topologists and number theorists interested in K-theory, polylogarithms, and motivic structures; also of interest to researchers in algebraic geometry and homotopy theory working with general linear groups and homological algebra.",
  "key_contributions": [
    "Definition and explicit presentation of the Goncharov Lie coalgebra in terms of correlators and four families of relations (homogeneity, cyclic symmetry, shuffle relations, decomposition relations)",
    "Complete computation of the Lie cobracket with explicit formulas showing how correlators decompose under the coproduct",
    "Identifications of the coalgebra pieces for weight ≤ 3 with classical objects: multiplicative group, Bloch group, and the Bloch group of weight 3",
    "Construction of motivic and Hodge realisations connecting the Goncharov Lie coalgebra to mixed Tate motives and mixed Hodge structures",
    "Using the Rognes rank spectral sequence to give symbolic descriptions of K⁽³⁾₄(F) and the indecomposable part of K⁽³⁾₅(F) in terms of Goncharov's weight 3 polylogarithmic complex for arbitrary fields"
  ],
  "plain_language_summary": "This paper studies the algebraic K-theory of fields—a central object in algebra that encodes important information about fields—by connecting it to polylogarithms, which are analytic functions with applications in number theory and physics. The authors introduce the Goncharov Lie coalgebra, a new algebraic structure defined using the homology of general linear groups. By presenting this coalgebra explicitly in terms of generators (called correlators) and relations, and computing its algebraic structure (the Lie cobracket), they can express parts of the K-theory of a field in terms of polylogarithmic complexes. Notably, they use the Rognes rank spectral sequence to show that certain K-theory groups for weight 3, previously understood only in special cases by Matsumoto, Milnor, Bloch, and Suslin, can now be described symbolically in terms of Goncharov's polylogarithmic complex. The results also construct motivic and Hodge realisations, connecting the abstract algebraic structure to more geometric and analytic objects.",
  "tldr": "The paper introduces the Goncharov Lie coalgebra, a structure built from the homology of general linear groups, and uses it to express algebraic K-theory of fields in terms of polylogarithms."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `pass`

```json
{
  "claims": [
    {
      "assessment": "partially_supported",
      "claim": "The Goncharov Lie coalgebra G(F) := ⊕ H_{n,2n-1}^{E_∞}(BGL(F)_Q) carries a well-defined Lie cobracket without additional Koszul signs, arising from Koszul duality between the nonunital commutative operad and the suspended Lie cooperad applied to an E_∞-algebra with slope-2 vanishing line.",
      "evidence": "The paper appeals to standard Koszul duality between Com and the shifted Lie cooperad and to the slope-2 vanishing result of [GKRW20]. The introduction asserts that 'the gradings work out to make so that Lie cobracket does not involve additional Koszul signs' but defers the verification to later sections (the Lie-coalgebra structure is presented as a consequence of an Eckmann–Hilton-type compatibility, cf. Dunn–Lurie additivity). The introduction-level material visible here does not contain a self-contained derivation of the sign convention.",
      "id": "C1",
      "location": "Definition 1; §1.3 (Introduction, 'The E_∞-algebra BGL(F)_Q')",
      "severity": "minor",
      "suggested_fix": "In the body of the paper (likely §4–§5 / 'The cobracket of G(F)') give an explicit, self-contained sign-tracking computation, and provide an executable verification (e.g. Sage/Python script symbolic-coboundary check on a small generating set, or a formalisation in Lean/Agda of the Koszul-dual cooperad structure) at e.g. src/lie-coalgebra/sign_check.py or proofs/LieCobracket.lean."
    },
    {
      "assessment": "partially_supported",
      "claim": "G(F) is generated as a Q-vector space by correlators Cor^G(x_0,…,x_n) subject to (i) homogeneity, (ii) cyclic symmetry, (iii) shuffle relations, and (iv) decomposition relations of the form Cor^G(x)−Cor^G(y) = Σ_{ι∈T(n)} sign(ι) Cor^G(0, (x_{i_k}−x_{j_k})/(y_{i_k}−y_{j_k}), …).",
      "evidence": "The result is asserted in the introduction and is the first main theorem; the introduction outlines that it is proved by constructing a novel projective resolution of St^∞_n(F) and using G_n(F) ≅ H_1(GL_n(F); St^∞_n(F)). The combinatorial set T(n) and the sign sign(ι) are deferred to Proposition 26 (prop:universal-symbol-combinatorics) which is not exhibited in the supplied excerpt, so the relations cannot be verified line-by-line from the text provided. The PROOF-AS-CODE axiom applies: the decomposition relation is purely combinatorial (sum over trees with explicit signs) and is therefore directly amenable to symbolic verification, but no executable artifact accompanies the paper.",
      "id": "C2",
      "location": "Theorem thm:polyl-presentation-additive (§1.4, Introduction)",
      "severity": "major",
      "suggested_fix": "Add an executable companion (e.g. src/correlators/decomposition_relations.py using SageMath or src/Correlators/Decomposition.lean) that (a) enumerates T(n) and sign(ι) for n ≤ 5, (b) symbolically verifies the decomposition relation modulo the other three relations on randomly generated affine bases, and (c) cross-checks consistency between the correlator presentation and the multiple-polylogarithm presentation Li^G_{n_1,…,n_k}."
    },
    {
      "assessment": "partially_supported",
      "claim": "The Lie cobracket of G(F) is given on generic correlators by δ(Cor^G(x_0,…,x_n)) = Σ_{j=0}^n Σ_{i=1}^{n-1} Cor^G(x_j,…,x_{j+i}) ∧ Cor^G(x_j, x_{j+i+1},…,x_{j+n}) whenever x_0,…,x_n are distinct.",
      "evidence": "The formula mirrors the cobracket formula stated for the infinite Steinberg correlators C[u_0:⋯:u_n] (paper §1.5), and the introduction sketches that it is inherited via H_1(GL_n(F); St^∞_n(F)). Co-Jacobi and antisymmetry under this formula are nontrivial combinatorial identities; the excerpt does not show their verification, and no executable check is shipped. The PROOF-AS-CODE axiom applies: co-Jacobi/(co)antisymmetry on the explicit formula are testable by direct symbolic expansion.",
      "id": "C3",
      "location": "Theorem thm:polyl-presentation-cobracket (§1.4, Introduction)",
      "severity": "major",
      "suggested_fix": "Provide a script (e.g. experiments/cobracket/cojacobi_check.py) that (i) symbolically expands δ on Cor^G(x_0,…,x_n) for n = 2,3,4,5, (ii) verifies antisymmetry δ∘δ̃ = 0 modulo the four relations of C2, and (iii) verifies the co-Jacobi identity. Alternatively formalise in src/proofs/Cobracket.lean."
    },
    {
      "assessment": "partially_supported",
      "claim": "For n = 1,2,3 there are explicit isomorphisms F^×_Q ≅ G_1(F), B_2(F)_Q ≅ G_2(F), and B_3(F)_Q ≅ G_3(F) given by a ↦ Cor^G(0,a), {a}_2 ↦ −Cor^G(1,0,a), and {a}_3 ↦ −Cor^G(1,0,0,a) respectively, where B_2(F) is the Bloch–Suslin (pre-Bloch) group and B_3(F) is Goncharov's group.",
      "evidence": "The introduction states the isomorphisms but defers proof to later sections. The identifications are plausible and align with Suslin's K_3 / Bloch group results [Sus90], Goncharov [Gon95b], and prior calculations of H_1(GL_n(F); St^∞_n(F)) by Charlton–Radchenko–Rudenko. The excerpt does not exhibit the verification that the asserted relations of B_2(F)/B_3(F) (e.g. the five-term and Goncharov 22-term relations) are satisfied by the proposed images.",
      "id": "C4",
      "location": "Theorem thm:polyl-identification (§1.4, Introduction)",
      "severity": "minor",
      "suggested_fix": "In the body, exhibit the verification that the five-term relation in B_2(F) and Goncharov's defining relations in B_3(F) hold for the explicit correlator images. As a code artifact, add experiments/identifications/check_B2_B3.py that symbolically checks the five-term and 22-term relations for the proposed map on random field samples (e.g. F = Q, F = F_p)."
    },
    {
      "assessment": "partially_supported",
      "claim": "For an arbitrary field F there is an isomorphism K^{(3)}_4(F)_Q ≅ H^2(G(F))_3, and an exact sequence K^{(2)}_4(F)_Q ⊗ F^×_Q → K^{(3)}_5(F)_Q → H^1(G(F))_3 → 0.",
      "evidence": "This is the paper's headline weight-3 result. It is asserted in the introduction and the strategy (combine the presentation of G(F) with a rank spectral sequence related to [Rognes]) is sketched, but the supplied excerpt does not contain the complete proof. Part (i) is also stated to be an instance of [Bol24] (with the authors noting their proof is different). Verification depends on (a) the correctness of C2/C3 above, (b) the convergence and identification of E^∞ terms of the rank spectral sequence with K^{(3)}_*(F)_Q, and (c) the Adams-eigenspace decomposition. Steps (b)–(c) are not visible in the excerpt and rely on heavy machinery from [GKRW20], [Rognes], [Sus84], [Sus90], [Soule], [Weibel].",
      "id": "C5",
      "location": "Theorem 1 (theorem weight 3), parts (i)–(ii); §1.2 (Introduction)",
      "severity": "major",
      "suggested_fix": "In the dedicated section ('The Goncharov conjectures in weight 3') give an explicit identification of the E^∞-page with the Adams-graded K-groups, and a careful tracking of weight via ψ^k. As supporting executable evidence, add benchmarks/rank-ss/weight3_check.py computing both sides for F = a small number field (e.g. F = Q or a real quadratic field) at low weight using existing K-theory packages, or formalise the differentials in src/proofs/RankSS.lean."
    },
    {
      "assessment": "partially_supported",
      "claim": "There is a functor of Tannakian categories R^MTM : Comod^fd_{G(F)}(GrMod_Q) → MTM_Q(F) whose induced morphism r^MTM of graded Lie coalgebras sends Li^G_{n_1,…,n_k}(a_1,…,a_k) to Goncharov's motivic Li^MTM_{n_1,…,n_k}(a_1,…,a_k).",
      "evidence": "Asserted in the introduction with reference to the body of the paper. The construction depends on a comparison between the abstract Lie coalgebra structure on G(F) and Goncharov's explicit motivic-correlator construction [Gon19, (10.20)], and the proof that the resulting morphism preserves the cobracket and sends the named generators to the named targets is nontrivial. The supplied excerpt does not contain the full construction or verification.",
      "id": "C6",
      "location": "Theorem thm:motivic-realisation (§1.1, Introduction)",
      "severity": "major",
      "suggested_fix": "In the dedicated section, show explicitly that r^MTM intertwines the cobracket on G(F) with Goncharov's coproduct on motivic correlators on a generating set, and clearly delimit which parts depend on the (deferred) results of the sequel [KRS2]. State which currently-known instances (e.g. number fields, n ≤ 3) can be cross-checked against [Gon19] / [DG05]."
    },
    {
      "assessment": "supported",
      "claim": "The Steinberg-module functor St is Koszul (as a commutative algebra in (Fun(Vect_F, GrMod_Q), ⊞)), and its Koszul dual as an associative algebra is the double Steinberg modules St^2_n(F) ≅ St_n(F) ⊗ St_n(F), as exhibited by the exactness of the associative bar complex 0 → St^2_n(F) → (St^{⊞ n})(F^n) → ⋯ → St_n(F) → 0.",
      "evidence": "Koszulness of St and the double/infinite Steinberg construction are attributed to existing literature ([MNP] Miller–Nagpal–Patzt, [MPW23] Miller–Patzt–Wilson, [CharltonRadchenkoRudenko]). The paper restates these as background. Within the bounds of this audit (the cited papers are not verified independently), the assertion is consistent with standard recent work.",
      "id": "C7",
      "location": "§1.5 (Steinberg modules), citing [MNP; MPW23; CharltonRadchenkoRudenko]",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "H^{E_∞}_{n,d}(BGL(F)_Q) vanishes for d ≤ 2n-2 with the sole exception (n,d) = (1,0), so the 'critical line' d = 2n-1 carries a Lie coalgebra structure G(F).",
      "evidence": "The vanishing result is explicitly attributed to [GKRW20] (Galatius–Kupers–Randal-Williams, Duke Math. J. 174 (2025)). The paper itself does not reprove it; the cited reference is a published peer-reviewed work that is the basis of the entire programme.",
      "id": "C8",
      "location": "§1.3 (Introduction, 'The E_∞-algebra'), with reference to [GKRW20]",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "The isomorphisms H^{E_k}_{n,d}(BGL(F)_Q) ≅ H_{d−kn+k}(GL_n(F); St^{(k)}_n(F)) hold for k = 1, 2, ∞ (with St^{(1)} = St, St^{(2)} = St^2, St^{(∞)} = St^∞), obtained by passing through dim_!(Q_{>0}) and computing E_k-indecomposables.",
      "evidence": "The bottom (E_∞) isomorphism is the load-bearing one for this paper; both this and the top (E_1) isomorphism are explicitly attributed to [GKRW20, §6] and to Nesterenko–Suslin [NesterenkoSuslin §1] for the dim_! comparison. The introduction faithfully restates these as background.",
      "id": "C9",
      "location": "Equation eqn:he1-st-heinfty-stl (§1.5, Introduction)",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "The duality involution on K_d(F)_Q decomposes as K^+_d = ⊕_{i even} K^{(i)}_d(F)_Q and K^−_d = ⊕_{i odd} K^{(i)}_d(F)_Q.",
      "evidence": "The lemma is derived from (a) the identification of the C_2-action with the Adams operation ψ^{-1} [FengGalatiusVenkatesh §2.3.1], and (b) the standard fact that ψ^{-1} acts on K_d^{(i)}(F)_Q by (-1)^i [Weibel IV.5; Soule Corollaire 1]. The reasoning is short, classical, and explicit in the text.",
      "id": "C10",
      "location": "Lemma 154 (lem:involution-vs-weight)",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "The duality involution acts by +1 on H_*(PGL_2(F); St^∞_2(F)).",
      "evidence": "The included proof exhibits a 2×2 matrix whose conjugation realises the involution on PGL_2(F) (z ↦ -1/z form), making the involution inner on PGL_2(F) and hence trivial on group homology with any PGL_2(F)-module coefficients. The argument is correct as stated.",
      "id": "C11",
      "location": "Lemma 155",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "The decomposition relation (Theorem thm:polyl-presentation-additive, item 4) is determined by an inductively computable set T(n) and signs sign(ι), takes the form of a 'symbol for formal correlators', and 'admits a formula as a sum over trees' (Proposition prop:universal-symbol-combinatorics).",
      "evidence": "The exact combinatorial data T(n) and sign(ι) are deferred to Proposition 26, which is not in the supplied excerpt. The relation drives the entire presentation of G(F) and hence the headline weight-3 theorem; its combinatorial well-definedness (independence of the auxiliary tree choice, equivariance under the cyclic and shuffle relations, internal consistency on overlapping (x_i, y_i) substitutions) must be verified. The PROOF-AS-CODE axiom applies: the relation is purely combinatorial and ideally suited to symbolic computer verification.",
      "id": "C12",
      "location": "Remark 2 and Theorem thm:polyl-presentation-additive item (iv); detail in Proposition 26",
      "severity": "major",
      "suggested_fix": "Add an executable artifact (e.g. src/correlators/symbol_combinatorics.py or experiments/symbols/check_T_n.sage) that (a) implements the tree enumeration defining T(n) and the sign rule sign(ι) for n ≤ 6, (b) verifies independence of the auxiliary choices, and (c) checks that the resulting relation is consistent with homogeneity, cyclic symmetry, and shuffle on random affine bases over a small field. Optionally formalise in src/Symbols/Combinatorics.lean."
    },
    {
      "assessment": "supported",
      "claim": "The infinite Steinberg modules St^∞ are presented by Steinberg correlators C[u_0:⋯:u_n] (indexed by affine bases) modulo homogeneity, cyclic symmetry, and shuffle relations, with cobracket δ(C[u_0:⋯:u_n]) = Σ_{j,i} C[u_j:⋯:u_{j+i}] ∧ C[u_j:u_{j+i+1}:⋯:u_{j+n}].",
      "evidence": "The presentation and cobracket formula for St^∞ are explicitly attributed to Charlton–Radchenko–Rudenko [CharltonRadchenkoRudenko, §2], a 2025 reference cited in the bibliography (entry 35). The paper restates the result faithfully and uses it as input, without claiming originality here.",
      "id": "C13",
      "location": "§1.5 (Steinberg modules) / [CharltonRadchenkoRudenko, §2]",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "The bibliography contains entries whose metadata (year/MR number) are inconsistent with the stated 2026 cutoff and ought to be sanity-checked: [9] BCN 'Mem. Amer. Math. Soc. 315 (2025), no. 1597' (volume number unusual), [31] CMRR24 'Int. Math. Res. Not. IMRN (2026), no. 2, Paper No. rnaf361', [48] GKRW20 'Duke Math. J. 174 (2025), no. 14', [69] HeineMM 'Selecta Math. (N.S.) 32 (2026)', [96] PRY 'arXiv:2603.29910', [115]/[116] Torii 2021/2025.",
      "evidence": "Several references list publication years (2025, 2026) and an arXiv identifier 'arXiv:2603.29910' (entry [96] PRY) that are forward-dated or use an arXiv ID prefix that does not correspond to standard yymm.NNNNN format (the YYMM '2603' would imply March 2026, beyond the assistant's knowledge cutoff). The 'Duke Math. J. 174 (2025), no. 14' citation for [GKRW20] has an unusually high issue number for Duke Math. J. and warrants confirmation. These are not technical-correctness issues per se but are factual claims that affect external verifiability.",
      "id": "C14",
      "location": "Bibliography (entries [9], [31], [48], [69], [96])",
      "severity": "minor",
      "suggested_fix": "Cross-check publication metadata against MathSciNet/zbMATH at compile time, and (if a date discrepancy is intentional because of forward-dated journal volumes) add a comment to the .bib file. Replace any genuinely fictitious or forward-dated references with their current arXiv identifiers."
    },
    {
      "assessment": "unsupported",
      "claim": "The first main theorem (presentation of G(F) and the cobracket formula) and the weight-3 headline theorem are proven without shipping any executable companion (computer-algebra script, formalisation in Lean/Coq/Agda, or numerical verification) despite the underlying combinatorics being highly amenable to such verification (tree enumerations, shuffle/cyclic relations, Chevalley–Eilenberg complex differentials in low weight).",
      "evidence": "The supplied prompt material (Title, Abstract, Introduction, Bibliography, verified-fact blocks) shows no link to a code repository, no Lean/Coq/Agda formalisation, and no Sage/Python companion. PROOF-AS-CODE AXIOM applies: this is a math.KT / math.AT paper whose load-bearing results include explicit combinatorial relations (decomposition relation, cobracket formula, presentation of St^∞ in low n, Chevalley–Eilenberg complex Λ^* G(F) in weight 3) that are directly verifiable by computer algebra at low n.",
      "id": "C15",
      "location": "Whole paper (no code artifact accompanies the introduction or stated results)",
      "severity": "major",
      "suggested_fix": "Ship a companion code repository providing at minimum: (i) src/correlators/relations.py — symbolic enforcement and consistency checks of homogeneity, cyclic, shuffle, and decomposition relations for n ≤ 5 over Q and over F_p; (ii) src/cobracket/cojacobi.py — verification of antisymmetry and co-Jacobi for the cobracket on Cor^G generators up to n = 5; (iii) src/identifications/B2_B3.py — verification of the five-term and 22-term relations for the explicit maps F^× → G_1, B_2 → G_2, B_3 → G_3; (iv) experiments/weight3/k_theory_check.py — for F = Q (or a small number field), numerically check K^{(3)}_4(F)_Q ≅ H^2(G(F))_3 in low rank; and ideally (v) a Lean 4 / Mathlib formalisation src/Proofs/G_Lie_Coalgebra.lean of the Lie coalgebra structure and cobracket on G(F)."
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

1. AKKN: A. Alekseev, N. Kawazumi, Y. Kuno, and F. Naef, \emph{The {G}oldman-{T}uraev {L}ie bialgebra in genus zero and the {K}ashiwara-{V}ergne problem}, Adv. Math. 326 (2018), 1--53. \MR{3758425}
2. AMP: A. Ash, J. Miller, and P. Patzt, \emph{Hopf algebras, {S}teinberg modules, and the unstable cohomology of ${SL}_n(\mathbb {Z})$ and ${GL}_n(\mathbb {Z})$}, 2024, arXiv:2404.13776. arXiv:[2404.13776](https://arxiv.org/abs/2404.13776)
3. AguiarMahajan: M. Aguiar and S. Mahajan, \emph{Monoidal functors, species and {H}opf algebras}, CRM Monograph Series, vol. 29, American Mathematical Society, Providence, RI, 2010, With forewords by Kenneth Brown and Stephen Chase and Andr\'{e} Joyal. \MR{2724388}
4. AlekseevTorossian: \bysame, \emph{The {K}ashiwara-{V}ergne conjecture and {D}rinfeld's associators}, Ann. of Math. (2) 175 (2012), no. 2, 415--463. \MR{2877064}
5. AlekseevTorossianNote: A. Alekseev and C. Torossian, Flat connections and trivalent graphs, \url{https://web.archive.org/web/20211028202354/https://webusers.imj-prg.fr/ charles.torossian/publication/trivalent.pdf}, 2009.
6. Arnold: V. I. Arnold, The cohomology ring of the group of dyed braids, Mat. Zametki 5 (1969), 227--231. \MR{242196}
7. AubryChataur: M. Aubry and D. Chataur, Cooperads and coalgebras as closed model categories, J. Pure Appl. Algebra 180 (2003), no. 1-2, 1--23. \MR{1966520}
8. BCGP: F. Brown, M. Chan, S. Galatius, and S. Payne, \emph{Hopf algebras in the cohomology of $A_g$, $GL_n(\mathbb{Z})$, and $SL_n(\mathbb{Z})$}, 2024, arXiv:2405.11528. arXiv:[2405.11528](https://arxiv.org/abs/2405.11528)
9. BCN: D. L. B. Brantner, R. Campos, and J. Nuiten, \emph{P{D} operads and explicit partition {L}ie algebras}, Mem. Amer. Math. Soc. 315 (2025), no. 1597, v+125. \MR{5003477}
10. BD94: A. Beilinson and P. Deligne, \emph{Interpr\'{e}tation motivique de la conjecture de {Z}agier reliant polylogarithmes et r\'{e}gulateurs}, Motives ({S}eattle, {WA}, 1991), Proc. Sympos. Pure Math., vol. 55, Amer. Math. Soc., Providence, RI, 1994, pp. 97--121. \MR{1265552}
11. BDEPS: N. Berry, A. Dubickas, N. D. Elkies, B. Poonen, and C. Smyth, The conjugate dimension of algebraic numbers, Q. J. Math. 55 (2004), no. 3, 237--252. \MR{2082091}
12. BGSII: C. Barwick, S. Glasman, and J. Shah, \emph{Spectral {M}ackey functors and equivariant algebraic {$K$}-theory, {II}}, Tunis. J. Math. 2 (2020), no. 1, 97--146. \MR{3933393}
13. BGSV90: A. Beilinson, A. Varchenko, A. Goncharov, and V. Shekhtman, \emph{Projective geometry and {$K$}-theory}, Algebra i Analiz 2 (1990), no. 3, 78--130. \MR{1073210}
14. BHM: M. B\"{o}kstedt, W. C. Hsiang, and I. Madsen, \emph{The cyclotomic trace and algebraic {$K$}-theory of spaces}, Invent. Math. 111 (1993), no. 3, 465--539. \MR{1202133}
15. BPW: B. Br\"{u}ck, K. I. Piterman, and V. Welker, The common basis complex and the partial decomposition poset, Int. Math. Res. Not. IMRN (2024), no. 18, 12746--12760. \MR{4798648}
16. Barr1968HarrisonHH: M. Barr, Harrison homology, hochschild homology and triples, Journal of Algebra 8 (1968), 314--323.
17. BataninMarkl: M. Batanin and M. Markl, Centers and homotopy centers in enriched monoidal categories, Adv. Math. 230 (2012), no. 4-6, 1811--1858. \MR{2927355}
18. BenMosheSchlank: S. Ben-Moshe and T. M. Schlank, \emph{Higher semiadditive algebraic {K}-theory and redshift}, Compos. Math. 160 (2024), no. 2, 237--287. \MR{4679205}
19. BerglundKoszul: A. Berglund, Koszul spaces, Trans. Amer. Math. Soc. 366 (2014), no. 9, 4551--4569. \MR{3217692}
20. Bezrukavnikov: R. Bezrukavnikov, \emph{Koszul {DG}-algebras arising from configuration spaces}, Geom. Funct. Anal. 4 (1994), no. 2, 119--135. \MR{1262702}
21. BlansBlom: M. Blans and T. Blom, \emph{On the chain rule in {G}oodwillie calculus}, 2024, arXiv:2410.20504. arXiv:[2410.20504](https://arxiv.org/abs/2410.20504)
22. BlansBlomKupers: M. Blans, T. Blom, and A. Kupers, Naturality of $\infty$-categorical bar-cobar duality, in preparation.
23. Bloch: S. J. Bloch, \emph{Higher regulators, algebraic {$K$}-theory, and zeta functions of elliptic curves}, CRM Monograph Series, vol. 11, American Mathematical Society, Providence, RI, 2000. \MR{1760901}
24. BlochKriz: S. Bloch and I. K\v{r}\'{\i}\v{z}, \emph{Mixed {T}ate motives}, Ann. of Math. (2) 140 (1994), no. 3, 557--605. \MR{1307897}
25. BoardmanSS: J. M. Boardman, Conditionally convergent spectral sequences, Homotopy invariant algebraic structures ({B}altimore, {MD}, 1998), Contemp. Math., vol. 239, Amer. Math. Soc., Providence, RI, 1999, pp. 49--84. \MR{1718076}
26. Bol24: V. Bolbachan, \emph{On the {G}oncharov's conjecture in degree $m{-}1$ and weight $m$}, 2024, arXiv:2404.06271. arXiv:[2404.06271](https://arxiv.org/abs/2404.06271)
27. BorelStable: A. Borel, Stable real cohomology of arithmetic groups, Ann. Sci. \'{E}cole Norm. Sup. (4) 7 (1974), 235--272 (1975). \MR{387496}
28. Bro12: F. Brown, \emph{Mixed {T}ate motives over {$\Bbb Z$}}, Ann. of Math. (2) 175 (2012), no. 2, 949--976. \MR{2993755}
29. Brown: K. S. Brown, Cohomology of groups, Graduate Texts in Mathematics, vol. 87, Springer-Verlag, New York, 1994, Corrected reprint of the 1982 original. \MR{1324339}
30. CMRR: S. Charlton, A. Matveiakin, D. Radchenko, and D. Rudenko, \emph{The {H}opf algebra of formal multiple polylogarithms}, 2024.
31. CMRR24: \bysame, \emph{The {H}opf algebra of formal multiple polylogarithms}, Int. Math. Res. Not. IMRN (2026), no. 2, Paper No. rnaf361, 29. \MR{5013247}
32. CampbellZakharevich: J. A. Campbell and I. Zakharevich, \emph{Hilbert's third problem and a conjecture of {G}oncharov}, Adv. Math. 451 (2024), Paper No. 109757, 57. \MR{4759410}
33. Cartier: P. Cartier, \emph{A primer of {H}opf algebras}, Frontiers in number theory, physics, and geometry. {II}, Springer, Berlin, 2007, pp. 537--615. \MR{2290769}
34. Cathelineau: J.-L. Cathelineau, \emph{Homologie du groupe lin\'{e}aire et polylogarithmes (d'apr\`es {A}. {B}. {G}oncharov et d'autres)}, Ast\'{e}risque (1993), no. 216, Exp. No. 772, 5, 311--341, S\'{e}minaire Bourbaki, Vol. 1992/93. \MR{1246402}
35. CharltonRadchenkoRudenko: S. Charlton, D. Radchenko, and D. Rudenko, \emph{Multiple polylogarithms and the {S}teinberg module}, 2025.
36. ChingSalvatore: M. Ching and P. Salvatore, \emph{Koszul duality for topological {$E_n$}-operads}, Proc. Lond. Math. Soc. (3) 125 (2022), no. 1, 1--60. \MR{4456966}
37. Cohen: F. R. Cohen, \emph{On configuration spaces, their homology, and {L}ie algebras}, J. Pure Appl. Algebra 100 (1995), no. 1-3, 19--42. \MR{1344842}
38. ConantVogtmann: J. Conant and K. Vogtmann, \emph{On a theorem of {K}ontsevich}, Algebr. Geom. Topol. 3 (2003), 1167--1224. \MR{2026331}
39. DG05: P. Deligne and A. B. Goncharov, \emph{Groupes fondamentaux motiviques de {T}ate mixte}, Ann. Sci. \'{E}cole Norm. Sup. (4) 38 (2005), no. 1, 1--56. \MR{2136480}
40. Day: B. Day, On closed categories of functors, Reports of the {M}idwest {C}ategory {S}eminar, {IV}, Lecture Notes in Math., Vol. 137, Springer, Berlin-New York, 1970, pp. 1--38. \MR{272852}
41. Del71b: P. Deligne, \emph{Th\'{e}orie de {H}odge. {II}}, Inst. Hautes \'{E}tudes Sci. Publ. Math. (1971), no. 40, 5--57. \MR{498551}
42. Drinfeld: V. G. {Drinfeld}, \emph{On quasitriangular quasi-{H}opf algebras and on a group that is closely connected with {${\rm Gal}(\overline{\bf Q}/{\bf Q})$}}, Algebra i Analiz 2 (1990), no. 4, 149--181, translated in Leningrad Math. J. 2 (1991), no. 4, 829--860. \MR{1080203}
43. Dup20: C. Dupont, \emph{Progr{\`e}s rec{\'e}nts sur la conjecture de {Z}agier et le programme de {G}oncharov [d'apr{\`e}s {G}oncharov, {R}udenko, {G}angl, ...]}, S{\'e}minaire Bourbaki \textbf{73{\`e}me ann{\'e}e} (2021), no. 1176.
44. Felder: M. Felder, \emph{Internally connected graphs and the {K}ashiwara-{V}ergne {L}ie algebra}, Lett. Math. Phys. 108 (2018), no. 6, 1407--1441. \MR{3797752}
45. FengGalatiusVenkatesh: T. Feng, S. Galatius, and A. Venkatesh, \emph{The {G}alois action on symplectic {K}-theory}, Invent. Math. 230 (2022), no. 1, 225--319. \MR{4480148}
46. GKRW18: \bysame, \emph{Cellular {$E_k$}-algebras}, Ast\'{e}risque (2025), no. 460, x+299. \MR{4987221}
47. GKRW19: S. Galatius, A. Kupers, and O. Randal-Williams, \emph{{$E_\infty$}-cells and general linear groups of finite fields}, Ann. Sci. \'{E}c. Norm. Sup\'{e}r. (4) 57 (2024), no. 6, 1845--1882. \MR{4862505}
48. GKRW20: \bysame, \emph{{$E_\infty$}-cells and general linear groups of infinite fields}, Duke Math. J. 174 (2025), no. 14, 2927--3046. \MR{4974473}
49. GarnerLopezFranco: R. Garner and I. L\'{o}pez Franco, Commutativity, J. Pure Appl. Algebra 220 (2016), no. 5, 1707--1751. \MR{3437265}
50. GepnerHaugsengNikolaus: D. Gepner, R. Haugseng, and T. Nikolaus, \emph{Lax colimits and free fibrations in {$\infty$}-categories}, Doc. Math. 22 (2017), 1225--1266. \MR{3690268}
51. GetzlerJones: E. Getzler and J. D. S. Jones, Operads, homotopy algebra and iterated integrals for double loop spaces, 1994, arXiv:hep-th/9403055.
52. GetzlerKapranov: E. Getzler and M. M. Kapranov, Cyclic operads and cyclic homology, Geometry, topology, \& physics, Conf. Proc. Lecture Notes Geom. Topology, IV, Int. Press, Cambridge, MA, 1995, pp. 167--201. \MR{1358617}
53. Gon01: A. Goncharov, \emph{Multiple polylogarithms and mixed {T}ate motives}, arXiv:math/0103059 [math.AG], 2001.
54. Gon19: A. Goncharov, Hodge correlators, J. Reine Angew. Math. 748 (2019), 1--138. \MR{3918430}
55. Gon95: \bysame, Polylogarithms in arithmetic and geometry, Proceedings of the {I}nternational {C}ongress of {M}athematicians, {V}ol. 1, 2 ({Z}\"{u}rich, 1994), Birkh\"{a}user, Basel, 1995, pp. 374--387. \MR{1403938}
56. Gon95b: A. Goncharov, Geometry of configurations, polylogarithms, and motivic cohomology, Adv. Math. 114 (1995), no. 2, 197--318. \MR{1348706}
57. Gon99: Alexander Goncharov, \emph{Volumes of hyperbolic manifolds and mixed {T}ate motives}, J. Amer. Math. Soc. 12 (1999), no. 2, 569--618. \MR{1649192}
58. Goncharov01: A. B. Goncharov, \emph{The dihedral {L}ie algebras and {G}alois symmetries of {$\pi_1^{(l)}(\Bbb P^1-(\{0,\infty\}\cup\mu_N))$}}, Duke Math. J. 110 (2001), no. 3, 397--487. \MR{1869113}
59. GoncharovEuler: \bysame, Euler complexes and geometry of modular varieties, Geom. Funct. Anal. 17 (2008), no. 6, 1872--1914. \MR{2399086}
60. GrinbergReiner: D. Grinberg and V. Reiner, Hopf algebras in combinatorics, 2014, arXiv:1409.8356. arXiv:[1409.8356](https://arxiv.org/abs/1409.8356)
61. HHLN: R. Haugseng, F. Hebestreit, S. Linskens, and J. Nuiten, Lax monoidal adjunctions, two-variable fibrations and the calculus of mates, Proc. Lond. Math. Soc. (3) 127 (2023), no. 4, 889--957. \MR{4655344}
62. HHS: P. Hanlon, P. Hersh, and J. Shareshian, \emph{A ${G}l_n(q)$ analogue of the partition lattice}, arXiv:2505.02202, 2025. arXiv:[2505.02202](https://arxiv.org/abs/2505.02202)
63. HainClassical: \bysame, Classical polylogarithms, Motives ({S}eattle, {WA}, 1991), Proc. Sympos. Pure Math., vol. 55, Amer. Math. Soc., Providence, RI, 1994, pp. 3--42. \MR{1265550}
64. HainIndec: R. M. Hain, On the indecomposable elements of the bar construction, Proc. Amer. Math. Soc. 98 (1986), no. 2, 312--316. \MR{854039}
65. Harder: G. Harder, \emph{Die {K}ohomologie {$S$}-arithmetischer {G}ruppen \"{u}ber {F}unktionenk\"{o}rpern}, Invent. Math. 42 (1977), 135--175. \MR{473102}
66. HaugsengMonads: R. Haugseng, \emph{On lax transformations, adjunctions, and monads in {$(\infty,2)$}-categories}, High. Struct. 5 (2021), no. 1, 244--281. \MR{4367222}
67. HaugsengSS: \bysame, \emph{{$\infty$}-operads via symmetric sequences}, Math. Z. 301 (2022), no. 1, 115--171. \MR{4405646}
68. Heine: H. Heine, A monadicity theorem for higher algebraic structures, 2017, arXiv:1712.00555. arXiv:[1712.00555](https://arxiv.org/abs/1712.00555)
69. HeineMM: \bysame, \emph{A derived {M}ilnor-{M}oore theorem}, Selecta Math. (N.S.) 32 (2026), no. 2, Paper No. 39. \MR{5060174}
70. HeutsKoszul: G. Heuts, \emph{Koszul duality and a conjecture of {F}rancis--{G}aitsgory}, 2024, arXiv:2408.06173. arXiv:[2408.06173](https://arxiv.org/abs/2408.06173)
71. HeutsLand: G. S. K. S. Heuts and M. Land, \emph{Koszul duality of ${E}_n$-algebras and ${E}_n$-operads}, in preparation.
72. HeutsLandFormality: \bysame, \emph{Formality of $\mathbb{E}_n$-algebras and cochains on spheres}, 2024, arXiv:2407.00790. arXiv:[2407.00790](https://arxiv.org/abs/2407.00790)
73. Hinich: \bysame, \emph{Yoneda lemma for enriched {$\infty$}-categories}, Adv. Math. 367 (2020), 107129, 119. \MR{4080581}
74. HinichRectification: V. Hinich, Rectification of algebras and modules, Doc. Math. 20 (2015), 879--926. \MR{3404213}
75. KKMMW: I. Klang, J. Kuijper, C. Malkiewich, D. Mehrle, and T. Wittich, \emph{Higher spherical scissors congruence {I}: {H}opf algebra}, arxiv:2509.18009. arXiv:[2509.18009](https://arxiv.org/abs/2509.18009)
76. KRS2: A. Kupers, D. Rudenko, and I. Sierra, Mixed tate motives over number fields, 2026, in preparation.
77. KahnSun: B. Kahn and F. Sun, On universal modular symbols, 2014, arXiv:1407.0475. arXiv:[1407.0475](https://arxiv.org/abs/1407.0475)
78. KontsevichFormal: M. Kontsevich, Formal (non)commutative symplectic geometry, The {G}elfand {M}athematical {S}eminars, 1990--1992, Birkh\"{a}user Boston, Boston, MA, 1993, pp. 173--187. \MR{1247289}
79. Levine: M. Levine, \emph{Tate motives and the vanishing conjectures for algebraic {$K$}-theory}, Algebraic {$K$}-theory and algebraic topology ({L}ake {L}ouise, {AB}, 1991), NATO Adv. Sci. Inst. Ser. C: Math. Phys. Sci., vol. 407, Kluwer Acad. Publ., Dordrecht, 1993, pp. 167--188. \MR{1367296}
80. LevineBloch: \bysame, \emph{Bloch's higher {C}how groups revisited}, no. 226, 1994, $K$-theory (Strasbourg, 1992), pp. 10, 235--320. \MR{1317122}
81. LinskensNardinPol: S. Linskens, D. Nardin, and L. Pol, Global homotopy theory via partially lax limits, Geom. Topol. 29 (2025), no. 3, 1345--1440. \MR{4918109}
82. LodayCyclic: J.-L. Loday, Cyclic homology, second ed., Grundlehren der mathematischen Wissenschaften [Fundamental Principles of Mathematical Sciences], vol. 301, Springer-Verlag, Berlin, 1998, Appendix E by Mar\'{\i}a O. Ronco, Chapter 13 by the author in collaboration with Teimuraz Pirashvili. \MR{1600246}
83. LodayVallette: J.-L. Loday and B. Vallette, Algebraic operads, Grundlehren der mathematischen Wissenschaften [Fundamental Principles of Mathematical Sciences], vol. 346, Springer, Heidelberg, 2012. \MR{2954392}
84. LurieHA: \bysame, \emph{{Higher algebra}}, September 2017 version (2017).
85. LurieHTT: J. Lurie, Higher topos theory, Annals of Mathematics Studies, vol. 170, Princeton University Press, 2009. \MR{2522659}
86. MNP: J. Miller, R. Nagpal, and P. Patzt, Stability in the high-dimensional cohomology of congruence subgroups, Compos. Math. 156 (2020), no. 4, 822--861. \MR{4079629}
87. MPPII: J. Miller, P. Patzt, and A. Putman, \emph{Homological vanishing for the {S}teinberg representation {II}: reductive groups and integral conjectures}, 2025, arXiv:2509.01559. arXiv:[2509.01559](https://arxiv.org/abs/2509.01559)
88. MPW23: J. Miller, P. Patzt, and J. C. H. Wilson, \emph{On rank filtrations of algebraic {K}-theory and {S}teinberg modules}, 2023, arXiv:2303.00245. arXiv:[2303.00245](https://arxiv.org/abs/2303.00245)
89. MVW: C. Mazza, V. Voevodsky, and C. Weibel, Lecture notes on motivic cohomology, Clay Mathematics Monographs, vol. 2, American Mathematical Society, Providence, RI; Clay Mathematics Institute, Cambridge, MA, 2006. \MR{2242284}
90. Mal20: N. Malkin, \emph{Shuffle relations for {H}odge and motivic correlators}, arXiv:2003.06521 [math.AG], 2020. arXiv:[2003.06521](https://arxiv.org/abs/2003.06521)
91. Michaelis: W. Michaelis, Lie coalgebras, Adv. in Math. 38 (1980), no. 1, 1--54. \MR{594993}
92. Mirzaii: B. Mirzaii, \emph{Bloch-{W}igner theorem over rings with many units}, Math. Z. 268 (2011), no. 1-2, 329--346. \MR{2805438}
93. MirzaiiErratum: \bysame, \emph{Erratum to: {B}loch-{W}igner theorem over rings with many units [mr2805438]}, Math. Z. 275 (2013), no. 1-2, 653--655. \MR{3101826}
94. NardinShah: D. Nardin and J. Shah, Parametrized and equivariant higher algebra, 2022, arXiv:2203.00072. arXiv:[2203.00072](https://arxiv.org/abs/2203.00072)
95. NesterenkoSuslin: Yu. P. Nesterenko and A. A. Suslin, \emph{Homology of the general linear group over a local ring, and {M}ilnor's {$K$}-theory}, Izv. Akad. Nauk SSSR Ser. Mat. 53 (1989), no. 1, 121--146. \MR{992981}
96. PRY: D. Petersen, V. Roca i Lucio, and S. Yalin, \emph{Unifying {K}oszul dualities via point-set models}, 2026, arXiv:2603.29910. arXiv:[2603.29910](https://arxiv.org/abs/2603.29910)
97. PortaTeyssier: M. Porta and J.-B. Teyssier, Day's convolution for pro-$\infty$-categories, \url{http://jbteyssier.com/papers/jbteyssier_day.pdf}.
98. Priddy: S. B. Priddy, Koszul resolutions, Trans. Amer. Math. Soc. 152 (1970), 39--60. \MR{265437}
99. QuillenFiniteGeneration: D. Quillen, \emph{Finite generation of the groups {$K\sb{i}$} of rings of algebraic integers}, Algebraic {$K$}-theory, {I}: {H}igher {$K$}-theories ({P}roc. {C}onf., {B}attelle {M}emorial {I}nst., {S}eattle, {W}ash., 1972), Lecture Notes in Math., Vol. 341, Springer, Berlin-New York, 1973, pp. 179--198. \MR{349812}
100. RWchromatic: O. Randal-Williams, A chromatic approach to homological stability, 2025, arXiv:2508.20629. arXiv:[2508.20629](https://arxiv.org/abs/2508.20629)
101. Ramakrishnan: D. Ramakrishnan, On the monodromy of higher logarithms, Proc. Amer. Math. Soc. 85 (1982), no. 4, 596--599. \MR{660611}
102. Robinson: A. Robinson, Partition complexes, duality and integral tree representations, Algebr. Geom. Topol. 4 (2004), 943--960. \MR{2100687}
103. Rognes: J. Rognes, \emph{A spectrum level rank filtration in algebraic {$K$}-theory}, Topology 31 (1992), no. 4, 813--845. \MR{1191383}
104. RognesMotivic: \bysame, Motivic complexes from the stable rank filtration, 2010, \url{https://www.mn.uio.no/math/personer/vit/rognes/papers/bergen10.pdf}.
105. RognesWeight: \bysame, The weight and rank filtrations, 2021, arXiv:2110.12264. arXiv:[2110.12264](https://arxiv.org/abs/2110.12264)
106. SegalConfiguration: G. Segal, Configuration-spaces and iterated loop-spaces, Invent. Math. 21 (1973), 213--221. \MR{331377}
107. SeveraWillwacher: P. {\v{S}}evera and T. Willwacher, Equivalence of formalities of the little discs operad, Duke Math. J. 160 (2011), no. 1, 175--206. \MR{2838354}
108. Sinha: D. P. Sinha, The (non-equivariant) homology of the little disks operad, O{PERADS} 2009, S\'{e}min. Congr., vol. 26, Soc. Math. France, Paris, 2013, pp. 253--279. \MR{3203375}
109. Souderes: I. Soud\`eres, \emph{A relative basis for mixed {T}ate motives over the projective line minus three points}, Commun. Number Theory Phys. 10 (2016), no. 1, 87--131. \MR{3521910}
110. Soule: Christophe Soul\'e, \emph{Op\'erations en {$K$}-th\'eorie alg\'ebrique}, Canad. J. Math. 37 (1985), no. 3, 488--550. \MR{787114}
111. Sun: F. Sun, \emph{Algebraic {K}-theory and modular symbols}, 2016, arXiv:1604.04700. arXiv:[1604.04700](https://arxiv.org/abs/1604.04700)
112. Sus84: A. Suslin, \emph{Homology of {${\rm GL}_{n}$}, characteristic classes and {M}ilnor {$K$}-theory}, vol. 165, 1984, Algebraic geometry and its applications, pp. 188--204. \MR{752941}
113. Sus90: \bysame, \emph{{$K_3$} of a field, and the {B}loch group}, vol. 183, 1990, Translated in Proc. Steklov Inst. Math. {1991}, no. 4, 217--239, Galois theory, rings, algebraic groups and their applications (Russian), pp. 180--199, 229. \MR{1092031}
114. ToriiDuoidal: \bysame, \emph{On duoidal {$\infty$}-categories}, J. Homotopy Relat. Struct. 20 (2025), no. 1, 125--162. \MR{4868047}
115. ToriiHigher: T. Torii, On higher monoidal $\infty$-categories, 2021, arXiv:2111.00158. arXiv:[2111.00158](https://arxiv.org/abs/2111.00158)
116. ToriiMult: \bysame, Multiplicative structures on comodules in higher categories, 2025.
117. Weibel: C.A. Weibel, \emph{The {$K$}-book}, Graduate Studies in Mathematics, vol. 145, American Mathematical Society, Providence, RI, 2013, An introduction to algebraic $K$-theory. \MR{3076731}
118. Whitehouse: S. Whitehouse, The integral tree representation of the symmetric group, J. Algebraic Combin. 13 (2001), no. 3, 317--326. \MR{1836907}
119. Wojtkowiak: Z. Wojtkowiak, The basic structure of polylogarithmic functional equations, Structural properties of polylogarithms, Math. Surveys Monogr., vol. 37, Amer. Math. Soc., Providence, RI, 1991, pp. 205--231. \MR{1148381}
120. Wu: H. Wu, \emph{A {H}opf algebra model for {D}wyer's tame spaces}, Ph.D. thesis, EFPL, 2023, \url{https://infoscience.epfl.ch/entities/publication/89700c3d-c155-4cd1-8ac6-0973ca4ee813}.
121. Zagier: D. Zagier, The dilogarithm function, Frontiers in number theory, physics, and geometry. {II}, Springer, Berlin, 2007, pp. 3--65. \MR{2290758}
122. deJeu: R. De Jeu, A remark on the rank conjecture, $K$-Theory 25 (2002), no. 3, 215--231. \MR{1909867}

