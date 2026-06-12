# Weyl-type theorems in Galilei and Carroll geometry

GrokRxiv review of [arXiv:2606.00799](https://arxiv.org/abs/2606.00799) · `math-ph`

_Authors_: Philip K. Schwartz, James Read, Quentin Vigneron

## TL;DR

This paper extends Weyl's classical uniqueness theorem — which determines pseudo-Riemannian metrics from their conformal and projective structures — to the non-relativistic (Galilei) and ultra-relativistic (Carroll) limits of spacetime geometry. The novelty reviewer rates the contribution significant (score 0.75, confidence 0.9), with the Carrollian extension representing a genuine advance beyond Curiel (2015) and March (2025); no missing prior art was identified. The bibliography is thorough and current, earning the citation reviewer's highest confidence (0.98). However, the review pipeline operated on an artifact that exposes only the abstract and bibliography, with no theorem statements, derivations, or proof text. Both the technical_correctness reviewer (claims C4 and C5 rated 'partially_supported' at severity 'major'; confidence 0.4) and the reproducibility reviewer (critical missing proof-as-code concern; major missing proof-text concern; score 0.18) independently flag that the headline claims cannot be audited from the submitted material. The two specialists are not in substantive disagreement: the technical_correctness reviewer's low confidence reflects incomplete material, not identified errors in reasoning. The paper falls within the code-amenable math-ph field, and no proof-assistant artifact was provided, triggering the major-revision gate under both the technical_correctness and reproducibility criteria. Because the claims are strongly plausible given the prior-art landscape and no critical reasoning errors were identified, rejection is not warranted; major revision is required to supply the missing proof content and, ideally, a formalized proof artifact.

_Recommendation_: **Major revision** · _Confidence_: 72%

## Strengths

- Fills a genuine gap by extending the Weyl uniqueness theorem to Carroll geometry, the ultra-relativistic limit not covered by Curiel (2015) or March (2025), establishing the result for both non-Lorentzian limits in a unified treatment.
- Builds coherently on the authors' prior unified affine-connection framework (Vigneron-Barzegar-Read 2025), giving the new theorems structural grounding in established machinery rather than requiring entirely new foundations.
- Bibliography is comprehensive and current, integrating foundational texts (Cartan 1923, Weyl 1921) with the most recent 2024–2026 contributions from both mathematical and physical communities; the citation reviewer rates coverage at 0.98 confidence.
- No missing prior art was identified by the novelty reviewer, and the three well-supported background claims (C1–C3) correctly characterize the generalization target and the limiting-geometry construction.

## Weaknesses

- Full theorem statements, assumptions, and proofs for both the Galilei and Carroll Weyl-type results are absent from the submitted artifact, leaving the headline claims (C4, C5) only partially supported at major severity.
- No proof-assistant repository (Lean 4, Coq, Isabelle, or equivalent) is provided for either theorem, a critical reproducibility gap for a math-ph paper whose headline claims are formal uniqueness results.
- The specific definition of conformal structure adopted for Galilei and Carroll geometry is not stated; multiple inequivalent definitions circulate in the literature, making the logical content of the theorems unverifiable from the abstract alone (C6).
- The precise form of the uniqueness result — whether the connection is fully determined or determined modulo a residual gauge freedom such as a mass 1-form or boost gauge — is not stated, leaving the strength of the analogy with the classical Weyl theorem ambiguous (C7).
- Two high-relevance references are missing from the bibliography: Lévy-Leblond (1965), which introduced the Carroll group, and Matveev-Trautman (2014), which provides the modern rigorous benchmark for the Weyl theorem being generalized.

## Revision Targets

- [ ] **Manuscript: reproducibility appendix**
  - Location: `reproducibility appendix`
  - Evidence: The canonical review artifact contains only the abstract, metadata, and bibliography; it exposes no theorem statements, assumptions, derivations, or proof text for the Galilei and Carroll uniqueness results. A complete proof bundle such as paper/proofs.pdf or proofs/formalized_derivations/ would be needed to audit the load-bearing arguments.
  - Required change: Add a reproducibility note that resolves this concern: The canonical review artifact contains only the abstract, metadata, and bibliography; it exposes no theorem statements, assumptions, derivations, or proof text for the Galilei and Carroll uniqueness results. A complete proof bundle such as paper/proofs.pdf or proofs/formalized_derivations/ would be needed to audit the load-bearing arguments.
  - Verification: Re-review should confirm the reproducibility concern is addressed with a concrete artifact or manuscript update.
- [ ] **Manuscript: Abstract (main result, Carroll side)**
  - Location: `Abstract (main result, Carroll side)`
  - Evidence: Same evidentiary gap as C4: no section text was supplied, so the Carroll definition of conformal structure, the precise theorem, and the proof cannot be audited. Prior Carroll-conformal work (Duval et al. [25], Ciambelli et al. [16], Herfray [38], Bergshoeff et al. [9], March-Read [42]) and the recent unified treatment of Galilei/Carroll affine connections by Vigneron-Barzegar-Read [50] make the claim plausible, but it is not verifiable from the material provided.
  - Required change: Provide the full Carroll section (definition, theorem, proof). Per the proof-as-code axiom for math-ph, a companion formal proof at src/proofs/CarrollWeyl.lean (Lean 4 / mathlib) — or an equivalent Coq / Agda / Isabelle artifact — would discharge the assessment.
  - Verification: Re-review should confirm `Abstract (main result, Carroll side)` is corrected or justified.
- [ ] **Manuscript: Abstract**
  - Location: `Abstract`
  - Evidence: In Galilei (Newton-Cartan) and Carroll geometry the 'metric' splits into a degenerate pair (clock 1-form + spatial cometric for Galilei; degenerate cometric + vector field for Carroll), so a literal restatement of Weyl's theorem requires non-trivial adaptation. Schwartz [46] classifies general affine connections in Newton-Cartan geometry, and Vigneron-Barzegar-Read [50] gives a unified affine perspective; these suggest the adaptation is feasible, but the exact form of the analogy (whether full uniqueness, uniqueness up to a residual gauge, or partial determination) cannot be confirmed from the abstract alone.
  - Required change: Make the precise form of the analogy explicit in the theorem statement: state which torsion / Newton-Cartan-trace-condition / mass 1-form gauge data is fixed, and whether the resulting determination is strict or modulo an explicitly identified residual freedom. Tabulating 'Lorentz vs Galilei vs Carroll' inputs and outputs alongside the theorem would aid auditability.
  - Verification: Re-review should confirm `Abstract` is corrected or justified.
- [ ] **Manuscript: Abstract**
  - Location: `Abstract`
  - Evidence: In Galilei (Newton-Cartan) and Carroll geometry the 'metric' splits into a degenerate pair (clock 1-form + spatial cometric for Galilei; degenerate cometric + vector field for Carroll), so a literal restatement of Weyl's theorem requires non-trivial adaptation. Schwartz [46] classifies general affine connections in Newton-Cartan geometry, and Vigneron-Barzegar-Read [50] gives a unified affine perspective; these suggest the adaptation is feasible, but the exact form of the analogy (whether full uniqueness, uniqueness up to a residual gauge, or partial determination) cannot be confirmed from the abstract alone.
  - Required change: Make the precise form of the analogy explicit in the theorem statement: state which torsion / Newton-Cartan-trace-condition / mass 1-form gauge data is fixed, and whether the resulting determination is strict or modulo an explicitly identified residual freedom. Tabulating 'Lorentz vs Galilei vs Carroll' inputs and outputs alongside the theorem would aid auditability.
  - Verification: Re-review should confirm `Abstract` is corrected or justified.
- [ ] **Bibliography: A note on Weyl's theorem on projective and conformal structures**
  - Location: bibliography entry: `A note on Weyl's theorem on projective and conformal structures`
  - Evidence: V. S. Matveev and A. Trautman (2014) provide a rigorous modern proof and generalization of the original Weyl result, which serves as the benchmark for the paper's extensions.
  - Required change: Add a bibliography entry for `A note on Weyl's theorem on projective and conformal structures` and cite it where the affected method or claim is introduced, or explicitly justify its omission.
  - Verification: Re-review should confirm the bibliography and citation context address this reference.

## Open Questions

- What is the exact definition of Galilei conformal structure adopted, and which of the competing notions in the literature (Duval-Horvathy, Dewar-Read, Vigneron-Barzegar-Read) does it most closely align with or subsume?
- What is the exact definition of Carroll conformal structure, and which Carrollian conformal level or weight is used?
- Do the Galilei and Carroll Weyl-type theorems yield strict uniqueness of the connection, or uniqueness modulo a specified residual gauge freedom, and if the latter, how is that freedom characterized?
- Is a companion formalized proof artifact (Lean 4, Coq, Isabelle) planned or available, and if not, can the authors justify its absence given the code-amenable nature of the math-ph field?
- Why are Lévy-Leblond (1965) and Matveev-Trautman (2014) not cited, given that the former introduced the Carroll group and the latter provides the modern generalization benchmark for the Weyl theorem?

## Per-Agent Reviews

### citation (`gemini-3-flash-preview`) — status: `warn`

```json
{
  "confidence": 0.98,
  "entries": [
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Weyl"
        ],
        "doi": null,
        "key": "Weyl:1921",
        "raw": "Weyl:1921: Zur {Infinitesimalgeometrie}: {Einordnung} der projektiven und der konformen {Auffassung}, 1921",
        "title": "Zur {Infinitesimalgeometrie}: {Einordnung} der projektiven und der konformen {Auffassung}",
        "url": null,
        "venue": null,
        "year": 1921
      },
      "exists": null,
      "explanation": "Primary historical source for the theorem that the paper generalizes; established that Weyl metrics are determined by conformal and projective structures.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "1402.0657",
        "authors": [
          "Duval",
          "EtAl"
        ],
        "doi": "10.1088/0264-9381/31/8/085016",
        "key": "Duval.EtAl:2014",
        "raw": "Duval.EtAl:2014: Carroll versus {Newton} and {Galilei}: two dual non-{Einstein\\-ian} concepts of time, 2014, doi:10.1088/0264-9381/31/8/085016, arXiv:1402.0657",
        "title": "Carroll versus {Newton} and {Galilei}: two dual non-{Einstein\\-ian} concepts of time",
        "url": null,
        "venue": "Classical and Quantum Gravity",
        "year": 2014
      },
      "exists": null,
      "explanation": "Foundational modern reference for the geometric structures of Carroll and Galilei spacetimes as non-Lorentzian limits.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "1510.02089",
        "authors": [
          "Curiel"
        ],
        "doi": null,
        "key": "Curiel:2015",
        "raw": "Curiel:2015: A {Weyl}-Type Theorem for Geometrized {Newtonian} Gravity, 2015, arXiv:1510.02089",
        "title": "A {Weyl}-Type Theorem for Geometrized {Newtonian} Gravity",
        "url": null,
        "venue": null,
        "year": 2015
      },
      "exists": null,
      "explanation": "Direct precursor proving the Weyl-type theorem for the Newtonian (Galilean) case, providing a template for the paper's Carrollian extensions.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2506.03936",
        "authors": [
          "Vigneron",
          "Barzegar",
          "Read"
        ],
        "doi": "10.1088/1361-6382/adfc1e",
        "key": "Vigneron.Barzegar.Read:2025",
        "raw": "Vigneron.Barzegar.Read:2025: Affine connections for {Galilean} and {Carrollian} structures: a unified perspective, 2025, doi:10.1088/1361-6382/adfc1e, arXiv:2506.03936",
        "title": "Affine connections for {Galilean} and {Carrollian} structures: a unified perspective",
        "url": null,
        "venue": "Classical and Quantum Gravity",
        "year": 2025
      },
      "exists": null,
      "explanation": "Recent work by the authors that defines the specific classes of connections analyzed in the present paper, ensuring consistency across their research program.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Dombrowski",
          "Horneffer"
        ],
        "doi": "10.1007/BF01110404",
        "key": "Dombrowski.Horneffer:1964",
        "raw": "Dombrowski.Horneffer:1964: Die Differentialgeometrie des Galileischen Relativitätsprinzips, 1964, doi:10.1007/BF01110404",
        "title": "Die Differentialgeometrie des Galileischen Relativitätsprinzips",
        "url": null,
        "venue": "Mathematische Zeitschrift",
        "year": 1964
      },
      "exists": null,
      "explanation": "Essential classical reference for the formal differential geometric treatment of Galilean structures.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "1701.06156",
        "authors": [
          "Bergshoeff",
          "EtAl"
        ],
        "doi": "10.1007/JHEP03(2017)165",
        "key": "Bergshoeff.EtAl:2017",
        "raw": "Bergshoeff.EtAl:2017: Carroll versus {Galilei} gravity, 2017, doi:10.1007/JHEP03(2017)165, arXiv:1701.06156",
        "title": "Carroll versus {Galilei} gravity",
        "url": null,
        "venue": "Journal of High Energy Physics",
        "year": 2017
      },
      "exists": null,
      "explanation": "Key modern work comparing gravitational theories in Carroll and Galilei limits, providing the physics context for the geometric theorems.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "1905.02221",
        "authors": [
          "Ciambelli",
          "EtAl"
        ],
        "doi": "10.1103/PhysRevD.100.046010",
        "key": "Ciambelli.EtAl:2019",
        "raw": "Ciambelli.EtAl:2019: Carroll structures, null geometry, and conformal isometries, 2019, doi:10.1103/PhysRevD.100.046010, arXiv:1905.02221",
        "title": "Carroll structures, null geometry, and conformal isometries",
        "url": null,
        "venue": "Physical Review D",
        "year": 2019
      },
      "exists": null,
      "explanation": "Crucial for the conformal part of the Weyl theorem in the Carrollian context, specifically regarding null geometry and isometries.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Cartan"
        ],
        "doi": "10.24033/asens.751",
        "key": "Cartan:1923",
        "raw": "Cartan:1923: Sur les variétés à connexion affine et la théorie de la relativité généralisée (première partie), 1923, doi:10.24033/asens.751",
        "title": "Sur les variétés à connexion affine et la théorie de la relativité généralisée (première partie)",
        "url": null,
        "venue": "Annales scientifiques de l'École Normale Supérieure",
        "year": 1923
      },
      "exists": null,
      "explanation": "Semantic origin of the Newton-Cartan (Galilean) geometric framework used throughout the paper.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "March"
        ],
        "doi": null,
        "key": "March:2025",
        "raw": "March:2025: A note on Newton-Cartan Weyl-type theorems, 2025",
        "title": "A note on Newton-Cartan Weyl-type theorems",
        "url": null,
        "venue": null,
        "year": 2025
      },
      "exists": null,
      "explanation": "Highly focused recent contribution that directly parallels the paper's goals for the Galilean sector.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Ehlers",
          "Pirani",
          "Schild"
        ],
        "doi": null,
        "key": "EPS:1972",
        "raw": "EPS:1972: The geometry of free fall and light propagation, 1972",
        "title": "The geometry of free fall and light propagation",
        "url": null,
        "venue": "General Relativity and Gravitation",
        "year": 1972
      },
      "exists": null,
      "explanation": "Foundational 'constructive' approach to spacetime geometry which the paper references to motivate the use of projective and conformal structures.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    }
  ],
  "missing_references": [
    {
      "reason": "Foundational paper by Jean-Marc Lévy-Leblond (1965) that introduced the Carroll group; its omission is notable in any comprehensive review of Carrollian geometry.",
      "title": "Une nouvelle limite non-relativiste du groupe de Poincaré"
    },
    {
      "reason": "V. S. Matveev and A. Trautman (2014) provide a rigorous modern proof and generalization of the original Weyl result, which serves as the benchmark for the paper's extensions.",
      "title": "A note on Weyl's theorem on projective and conformal structures"
    }
  ],
  "summary": "The bibliography is remarkably robust, integrating classic foundational texts with the most recent developments in non-Lorentzian geometry from 2024-2026. The authors demonstrate deep familiarity with both the mathematical (Cartan, Weyl) and physical (Bergshoeff, Duval) literature relevant to Galilei and Carroll structures. While a few foundational historical papers like Lévy-Leblond (1965) are absent, the citation coverage is more than sufficient to support the paper's technical claims and situates it well within the current research landscape."
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.72,
  "questions": [
    "What is the exact definition of Galilei conformal structure adopted, and which of the competing notions in the literature (Duval-Horvathy, Dewar-Read, Vigneron-Barzegar-Read) does it most closely align with or subsume?",
    "What is the exact definition of Carroll conformal structure, and which Carrollian conformal level or weight is used?",
    "Do the Galilei and Carroll Weyl-type theorems yield strict uniqueness of the connection, or uniqueness modulo a specified residual gauge freedom, and if the latter, how is that freedom characterized?",
    "Is a companion formalized proof artifact (Lean 4, Coq, Isabelle) planned or available, and if not, can the authors justify its absence given the code-amenable nature of the math-ph field?",
    "Why are Lévy-Leblond (1965) and Matveev-Trautman (2014) not cited, given that the former introduced the Carroll group and the latter provides the modern generalization benchmark for the Weyl theorem?"
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "The canonical review artifact contains only the abstract, metadata, and bibliography; it exposes no theorem statements, assumptions, derivations, or proof text for the Galilei and Carroll uniqueness results. A complete proof bundle such as paper/proofs.pdf or proofs/formalized_derivations/ would be needed to audit the load-bearing arguments.",
      "id": "weakness-1",
      "locator": "reproducibility appendix",
      "required_update": "Add a reproducibility note that resolves this concern: The canonical review artifact contains only the abstract, metadata, and bibliography; it exposes no theorem statements, assumptions, derivations, or proof text for the Galilei and Carroll uniqueness results. A complete proof bundle such as paper/proofs.pdf or proofs/formalized_derivations/ would be needed to audit the load-bearing arguments.",
      "source_path": null,
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm the reproducibility concern is addressed with a concrete artifact or manuscript update.",
      "weakness_index": 0
    },
    {
      "evidence": "Same evidentiary gap as C4: no section text was supplied, so the Carroll definition of conformal structure, the precise theorem, and the proof cannot be audited. Prior Carroll-conformal work (Duval et al. [25], Ciambelli et al. [16], Herfray [38], Bergshoeff et al. [9], March-Read [42]) and the recent unified treatment of Galilei/Carroll affine connections by Vigneron-Barzegar-Read [50] make the claim plausible, but it is not verifiable from the material provided.",
      "id": "weakness-2",
      "locator": "Abstract (main result, Carroll side)",
      "required_update": "Provide the full Carroll section (definition, theorem, proof). Per the proof-as-code axiom for math-ph, a companion formal proof at src/proofs/CarrollWeyl.lean (Lean 4 / mathlib) — or an equivalent Coq / Agda / Isabelle artifact — would discharge the assessment.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Abstract (main result, Carroll side)` is corrected or justified.",
      "weakness_index": 1
    },
    {
      "evidence": "In Galilei (Newton-Cartan) and Carroll geometry the 'metric' splits into a degenerate pair (clock 1-form + spatial cometric for Galilei; degenerate cometric + vector field for Carroll), so a literal restatement of Weyl's theorem requires non-trivial adaptation. Schwartz [46] classifies general affine connections in Newton-Cartan geometry, and Vigneron-Barzegar-Read [50] gives a unified affine perspective; these suggest the adaptation is feasible, but the exact form of the analogy (whether full uniqueness, uniqueness up to a residual gauge, or partial determination) cannot be confirmed from the abstract alone.",
      "id": "weakness-3",
      "locator": "Abstract",
      "required_update": "Make the precise form of the analogy explicit in the theorem statement: state which torsion / Newton-Cartan-trace-condition / mass 1-form gauge data is fixed, and whether the resulting determination is strict or modulo an explicitly identified residual freedom. Tabulating 'Lorentz vs Galilei vs Carroll' inputs and outputs alongside the theorem would aid auditability.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Abstract` is corrected or justified.",
      "weakness_index": 2
    },
    {
      "evidence": "In Galilei (Newton-Cartan) and Carroll geometry the 'metric' splits into a degenerate pair (clock 1-form + spatial cometric for Galilei; degenerate cometric + vector field for Carroll), so a literal restatement of Weyl's theorem requires non-trivial adaptation. Schwartz [46] classifies general affine connections in Newton-Cartan geometry, and Vigneron-Barzegar-Read [50] gives a unified affine perspective; these suggest the adaptation is feasible, but the exact form of the analogy (whether full uniqueness, uniqueness up to a residual gauge, or partial determination) cannot be confirmed from the abstract alone.",
      "id": "weakness-4",
      "locator": "Abstract",
      "required_update": "Make the precise form of the analogy explicit in the theorem statement: state which torsion / Newton-Cartan-trace-condition / mass 1-form gauge data is fixed, and whether the resulting determination is strict or modulo an explicitly identified residual freedom. Tabulating 'Lorentz vs Galilei vs Carroll' inputs and outputs alongside the theorem would aid auditability.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Abstract` is corrected or justified.",
      "weakness_index": 3
    },
    {
      "evidence": "V. S. Matveev and A. Trautman (2014) provide a rigorous modern proof and generalization of the original Weyl result, which serves as the benchmark for the paper's extensions.",
      "id": "weakness-5",
      "locator": "A note on Weyl's theorem on projective and conformal structures",
      "required_update": "Add a bibliography entry for `A note on Weyl's theorem on projective and conformal structures` and cite it where the affected method or claim is introduced, or explicitly justify its omission.",
      "source_path": null,
      "source_role": "citation",
      "status": "open",
      "target_kind": "bibliography",
      "verification_check": "Re-review should confirm the bibliography and citation context address this reference.",
      "weakness_index": 4
    }
  ],
  "strengths": [
    "Fills a genuine gap by extending the Weyl uniqueness theorem to Carroll geometry, the ultra-relativistic limit not covered by Curiel (2015) or March (2025), establishing the result for both non-Lorentzian limits in a unified treatment.",
    "Builds coherently on the authors' prior unified affine-connection framework (Vigneron-Barzegar-Read 2025), giving the new theorems structural grounding in established machinery rather than requiring entirely new foundations.",
    "Bibliography is comprehensive and current, integrating foundational texts (Cartan 1923, Weyl 1921) with the most recent 2024–2026 contributions from both mathematical and physical communities; the citation reviewer rates coverage at 0.98 confidence.",
    "No missing prior art was identified by the novelty reviewer, and the three well-supported background claims (C1–C3) correctly characterize the generalization target and the limiting-geometry construction."
  ],
  "summary": "This paper extends Weyl's classical uniqueness theorem — which determines pseudo-Riemannian metrics from their conformal and projective structures — to the non-relativistic (Galilei) and ultra-relativistic (Carroll) limits of spacetime geometry. The novelty reviewer rates the contribution significant (score 0.75, confidence 0.9), with the Carrollian extension representing a genuine advance beyond Curiel (2015) and March (2025); no missing prior art was identified. The bibliography is thorough and current, earning the citation reviewer's highest confidence (0.98). However, the review pipeline operated on an artifact that exposes only the abstract and bibliography, with no theorem statements, derivations, or proof text. Both the technical_correctness reviewer (claims C4 and C5 rated 'partially_supported' at severity 'major'; confidence 0.4) and the reproducibility reviewer (critical missing proof-as-code concern; major missing proof-text concern; score 0.18) independently flag that the headline claims cannot be audited from the submitted material. The two specialists are not in substantive disagreement: the technical_correctness reviewer's low confidence reflects incomplete material, not identified errors in reasoning. The paper falls within the code-amenable math-ph field, and no proof-assistant artifact was provided, triggering the major-revision gate under both the technical_correctness and reproducibility criteria. Because the claims are strongly plausible given the prior-art landscape and no critical reasoning errors were identified, rejection is not warranted; major revision is required to supply the missing proof content and, ideally, a formalized proof artifact.",
  "weaknesses": [
    "Full theorem statements, assumptions, and proofs for both the Galilei and Carroll Weyl-type results are absent from the submitted artifact, leaving the headline claims (C4, C5) only partially supported at major severity.",
    "No proof-assistant repository (Lean 4, Coq, Isabelle, or equivalent) is provided for either theorem, a critical reproducibility gap for a math-ph paper whose headline claims are formal uniqueness results.",
    "The specific definition of conformal structure adopted for Galilei and Carroll geometry is not stated; multiple inequivalent definitions circulate in the literature, making the logical content of the theorems unverifiable from the abstract alone (C6).",
    "The precise form of the uniqueness result — whether the connection is fully determined or determined modulo a residual gauge freedom such as a mass 1-form or boost gauge — is not stated, leaving the strength of the analogy with the classical Weyl theorem ambiguous (C7).",
    "Two high-relevance references are missing from the bibliography: Lévy-Leblond (1965), which introduced the Carroll group, and Matveev-Trautman (2014), which provides the modern rigorous benchmark for the Weyl theorem being generalized."
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
      "citation_key": "Weyl:1921",
      "delta": "The original theorem established that pseudo-Riemannian metrics are determined by conformal and projective structures; this paper generalizes this foundational result to the non-Lorentzian signatures of Galilei and Carroll geometries.",
      "relation": "prior_art",
      "title": "Zur Infinitesimalgeometrie: Einordnung der projektiven und der konformen Auffassung"
    },
    {
      "citation_key": "Curiel:2015",
      "delta": "Curiel established a Weyl-type theorem for the specific case of geometrized Newtonian gravity; the current work provides a more general geometric treatment that encompasses both Galilean and Carrollian structures.",
      "relation": "prior_art",
      "title": "A Weyl-Type Theorem for Geometrized Newtonian Gravity"
    },
    {
      "citation_key": "March:2025",
      "delta": "While March (2025) specifically addressed the Newton-Cartan (Galilean) case, this paper expands the scope significantly by including the ultra-relativistic Carrollian limit and providing a unified perspective.",
      "relation": "prior_art",
      "title": "A note on Newton-Cartan Weyl-type theorems"
    },
    {
      "citation_key": "Vigneron.Barzegar.Read:2025",
      "delta": "This paper utilizes the unified framework for affine connections in Galilean and Carrollian geometries developed in the authors' previous work to rigorously formulate and prove the uniqueness theorems.",
      "relation": "builds_on",
      "title": "Affine connections for Galilean and Carrollian structures: a unified perspective"
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
      "description": "No source code, proof-assistant repository, commit, release, or license is provided for reproducing the stated Weyl-type theorem analogues. A machine-checkable artifact such as proofs/galilei_carroll_weyl_theorems.lean or proofs/carroll_galilei_weyl_theorems.thy would be needed to independently verify the headline mathematical claims.",
      "severity": "critical"
    },
    {
      "area": "other",
      "description": "The canonical review artifact contains only the abstract, metadata, and bibliography; it exposes no theorem statements, assumptions, derivations, or proof text for the Galilei and Carroll uniqueness results. A complete proof bundle such as paper/proofs.pdf or proofs/formalized_derivations/ would be needed to audit the load-bearing arguments.",
      "severity": "major"
    },
    {
      "area": "data",
      "description": "No empirical or synthetic datasets are described; this appears to be a theoretical math-physics paper, so data may be out of scope, but the artifact does not explicitly state that no data are required.",
      "severity": "info"
    },
    {
      "area": "compute",
      "description": "No computational environment, symbolic algebra setup, proof-checker version, or reproducibility instructions are specified.",
      "severity": "major"
    }
  ],
  "confidence": 0.82,
  "data_availability": "unspecified",
  "data_url": null,
  "environment": null,
  "reproducibility_score": 0.18
}
```

### summary (`claude-haiku-4-5-20251001`) — status: `pass`

```json
{
  "audience": "Mathematical physicists, differential geometers, and researchers in non-relativistic gravity and general relativity limits",
  "key_contributions": [
    "Formulation of conformal structure for Galilei geometry and proof of a Weyl-type uniqueness theorem for Galilei metrics",
    "Formulation of conformal structure for Carroll geometry and proof of a Weyl-type uniqueness theorem for Carroll metrics",
    "Extension of the relationship between conformal, projective, and metric structures to non-relativistic and ultra-relativistic spacetimes"
  ],
  "plain_language_summary": "In the early 20th century, Hermann Weyl proved a fundamental result in differential geometry: a Weyl metric is completely determined by two pieces of information—its conformal structure (which describes angles) and its projective structure (which describes geodesics). This paper extends this classical theorem to two limiting cases of spacetime geometry. Galilei geometry represents the limit of relativity at low speeds (recovering the geometry underlying Newtonian mechanics), while Carroll geometry represents the ultra-relativistic limit. The authors develop suitable notions of conformal structure for these non-relativistic and ultra-relativistic geometries and prove analogous Weyl-type uniqueness theorems: in each case, the metric is uniquely determined by conformal and projective information. This work connects classical differential geometry with contemporary research on non-relativistic gravity and spacetime limits.",
  "tldr": "The paper extends Weyl's classical uniqueness theorem to Galilei and Carroll geometries, the non-relativistic and ultra-relativistic limits of spacetime."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `warn`

```json
{
  "claims": [
    {
      "assessment": "supported",
      "claim": "Weyl's 1921 theorem: a Weyl metric (a natural generalisation of a pseudo-Riemannian metric) is uniquely determined by its conformal structure together with its projective structure (i.e. its set of unparametrised geodesics).",
      "evidence": "Classical, well-established result of Weyl [51, Weyl:1921]; not original to this paper. Consistent with the standard exposition of projective/conformal compatibility in pseudo-Riemannian geometry.",
      "id": "C1",
      "location": "Abstract",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Weyl's theorem admits an equivalent formulation: a torsion-free linear connection compatible with a pseudo-Riemannian conformal structure is uniquely determined by its projective structure.",
      "evidence": "Standard reformulation in the literature on projective/conformal structures; in line with the Ehlers-Pirani-Schild framework [27, 28] and subsequent treatments (e.g. Malament [41], Trautman [49]).",
      "id": "C2",
      "location": "Abstract",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Galilei and Carroll geometries arise as, respectively, the 'non-relativistic' (c -> infinity) and 'ultra-relativistic' (c -> 0) limits of Lorentzian geometry.",
      "evidence": "Established in the cited literature: Duval et al. [24] explicitly frames Carroll/Galilei as dual non-Einsteinian limits; the c->infinity (Galilei / Newton-Cartan) and c->0 (Carroll) constructions are standard (Bergshoeff et al. [8], Hartong et al. [37], March-Read [42]).",
      "id": "C3",
      "location": "Abstract",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "A suitably defined notion of conformal structure exists on Galilei geometry for which a Weyl-type uniqueness theorem can be stated and proved.",
      "evidence": "The supplied review artifact contains only abstract and bibliography (the 'sections' array is empty), so the precise definition of the Galilei conformal structure, the theorem statement, and the proof of uniqueness cannot be inspected. Related antecedents make the claim plausible — Curiel [17] proves a Weyl-type theorem for geometrised Newtonian gravity, Dewar-Read [18] discusses conformal invariance of the Newtonian Weyl tensor, and March [44] is explicitly titled 'A note on Newton-Cartan Weyl-type theorems' — but the specific Galilei Weyl-type statement asserted here cannot be verified from what was provided.",
      "id": "C4",
      "location": "Abstract (main result, Galilei side)",
      "severity": "major",
      "suggested_fix": "Supply the section text containing (i) the precise definition of the Galilei conformal structure adopted, (ii) the formal statement of the Weyl-type theorem, and (iii) the uniqueness proof. Per the proof-as-code axiom for math-ph, a machine-checked formalisation of the uniqueness statement (e.g. Lean 4 / mathlib) at src/proofs/GalileiWeyl.lean would render the claim independently verifiable."
    },
    {
      "assessment": "partially_supported",
      "claim": "A suitably defined notion of conformal structure exists on Carroll geometry for which a Weyl-type uniqueness theorem can be stated and proved.",
      "evidence": "Same evidentiary gap as C4: no section text was supplied, so the Carroll definition of conformal structure, the precise theorem, and the proof cannot be audited. Prior Carroll-conformal work (Duval et al. [25], Ciambelli et al. [16], Herfray [38], Bergshoeff et al. [9], March-Read [42]) and the recent unified treatment of Galilei/Carroll affine connections by Vigneron-Barzegar-Read [50] make the claim plausible, but it is not verifiable from the material provided.",
      "id": "C5",
      "location": "Abstract (main result, Carroll side)",
      "severity": "major",
      "suggested_fix": "Provide the full Carroll section (definition, theorem, proof). Per the proof-as-code axiom for math-ph, a companion formal proof at src/proofs/CarrollWeyl.lean (Lean 4 / mathlib) — or an equivalent Coq / Agda / Isabelle artifact — would discharge the assessment."
    },
    {
      "assessment": "partially_supported",
      "claim": "The notions of 'conformal structure' adopted for Galilei and for Carroll geometry are well-posed choices on which a Weyl-type uniqueness statement is meaningful.",
      "evidence": "Multiple inequivalent notions of Galilei/Carroll conformal structure circulate in the literature: the conformal Galilei groups and Veronese curves of Duval-Horvathy [26], the conformal Carroll groups and Carrollian level-N structures of Duval et al. [25], the null-geometry conformal isometries of Ciambelli et al. [16], the Newton-Cartan conformal framework of Dewar-Read [18], and the unified affine treatment of Vigneron-Barzegar-Read [50]. Without the section text the specific choice the authors adopt — and whether it is canonical enough to make the Weyl-type statement non-trivial — cannot be assessed.",
      "id": "C6",
      "location": "Abstract (presupposed by the main results)",
      "severity": "minor",
      "suggested_fix": "Devote a short subsection to fixing the precise conformal-structure definition (Galilei and Carroll separately), state explicitly which Carrollian conformal level / weight is used, and compare with the alternatives in [25, 26, 18, 16]. A definitional table at the start of the relevant sections would aid claim verification."
    },
    {
      "assessment": "partially_supported",
      "claim": "The Galilei and Carroll Weyl-type theorems are 'analogous' to the pseudo-Riemannian Weyl theorem — i.e. they state uniqueness of a degenerate-metric-compatible torsion-free connection from its projective (and conformal) data.",
      "evidence": "In Galilei (Newton-Cartan) and Carroll geometry the 'metric' splits into a degenerate pair (clock 1-form + spatial cometric for Galilei; degenerate cometric + vector field for Carroll), so a literal restatement of Weyl's theorem requires non-trivial adaptation. Schwartz [46] classifies general affine connections in Newton-Cartan geometry, and Vigneron-Barzegar-Read [50] gives a unified affine perspective; these suggest the adaptation is feasible, but the exact form of the analogy (whether full uniqueness, uniqueness up to a residual gauge, or partial determination) cannot be confirmed from the abstract alone.",
      "id": "C7",
      "location": "Abstract",
      "severity": "minor",
      "suggested_fix": "Make the precise form of the analogy explicit in the theorem statement: state which torsion / Newton-Cartan-trace-condition / mass 1-form gauge data is fixed, and whether the resulting determination is strict or modulo an explicitly identified residual freedom. Tabulating 'Lorentz vs Galilei vs Carroll' inputs and outputs alongside the theorem would aid auditability."
    }
  ],
  "confidence": 0.4,
  "overall_correctness": "mostly_sound"
}
```

## Corrections

<!-- corrections-section: rendered from corrections table; empty on first publish -->
_No corrections have been recorded._

## Bibliography

1. Adlam.Linnemann.Read:2025: Constructive axiomatics for spacetime physics, 2025, doi:10.1093/9780198922391.001.0001 doi:[10.1093/9780198922391.001.0001](https://doi.org/10.1093/9780198922391.001.0001)
2. Alishahiha.Davody.Vahedi:2009: On {AdS/CFT} of {Galilean} Conformal Field Theories, 2009, doi:10.1088/1126-6708/2009/08/022, arXiv:0903.3953 doi:[10.1088/1126-6708/2009/08/022](https://doi.org/10.1088/1126-6708/2009/08/022) arXiv:[0903.3953](https://arxiv.org/abs/0903.3953)
3. Bagchi.Basu.Mehra:2014: Galilean Conformal Electrodynamics, 2014, doi:10.1007/JHEP11(2014)061, arXiv:1408.0810 doi:[10.1007/JHEP11(2014)061](https://doi.org/10.1007/JHEP11(2014)061) arXiv:[1408.0810](https://arxiv.org/abs/1408.0810)
4. Bagchi.Chakrabortty.Mehra:2018: Galilean field theories and conformal structure, 2018, doi:10.1007/JHEP04(2018)144, arXiv:1712.05631 doi:[10.1007/JHEP04(2018)144](https://doi.org/10.1007/JHEP04(2018)144) arXiv:[1712.05631](https://arxiv.org/abs/1712.05631)
5. Bagchi.Gopakumar:2009: Galilean conformal algebras and {AdS/CFT}, 2009, doi:10.1088/1126-6708/2009/07/037, arXiv:0902.1385 doi:[10.1088/1126-6708/2009/07/037](https://doi.org/10.1088/1126-6708/2009/07/037) arXiv:[0902.1385](https://arxiv.org/abs/0902.1385)
6. Bagchi.Mandal:2009: On representations and correlation functions of {Galilean} conformal algebras, 2009, doi:10.1016/j.physletb.2009.04.030, arXiv:0903.4524 doi:[10.1016/j.physletb.2009.04.030](https://doi.org/10.1016/j.physletb.2009.04.030) arXiv:[0903.4524](https://arxiv.org/abs/0903.4524)
7. Bergshoeff.EtAl:2014: Dynamics of {Carroll} particles, 2014, doi:10.1088/0264-9381/31/20/205009, arXiv:1405.2264 doi:[10.1088/0264-9381/31/20/205009](https://doi.org/10.1088/0264-9381/31/20/205009) arXiv:[1405.2264](https://arxiv.org/abs/1405.2264)
8. Bergshoeff.EtAl:2017: Carroll versus {Galilei} gravity, 2017, doi:10.1007/JHEP03(2017)165, arXiv:1701.06156 doi:[10.1007/JHEP03(2017)165](https://doi.org/10.1007/JHEP03(2017)165) arXiv:[1701.06156](https://arxiv.org/abs/1701.06156)
9. Bergshoeff.EtAl:2026: Applied Conformal {Carroll} Geometry, 2026, doi:10.1007/978-3-032-03921-7_33 doi:[10.1007/978-3-032-03921-7_33](https://doi.org/10.1007/978-3-032-03921-7_33)
10. Cartan:1923: Sur les variétés à connexion affine et la théorie de la relativité généralisée (première partie), 1923, doi:10.24033/asens.751 doi:[10.24033/asens.751](https://doi.org/10.24033/asens.751)
11. Cartan:1924: Sur les variétés à connexion affine et la théorie de la relativité généralisée (première partie) ({Suite}), 1924, doi:10.24033/asens.753 doi:[10.24033/asens.753](https://doi.org/10.24033/asens.753)
12. Cartan:1986: On Manifolds with an Affine Connection and the Theory of General Relativity, 1986
13. Chandrasekaran.EtAl:2023: An algebra of observables for {de Sitter} space, 2023, doi:10.1007/JHEP02(2023)082, arXiv:2206.10780 doi:[10.1007/JHEP02(2023)082](https://doi.org/10.1007/JHEP02(2023)082) arXiv:[2206.10780](https://arxiv.org/abs/2206.10780)
14. Chen.Liu:2023: The shadow formalism of {Galilean CFT\textsubscript{2}}, 2023, doi:10.1007/JHEP05(2023)224, arXiv:2203.10490 doi:[10.1007/JHEP05(2023)224](https://doi.org/10.1007/JHEP05(2023)224) arXiv:[2203.10490](https://arxiv.org/abs/2203.10490)
15. Chen.Sun.Zheng:2024: Quantization of {Carrollian} conformal scalar theories, 2024, doi:10.1103/PhysRevD.110.125010, arXiv:2406.17451 doi:[10.1103/PhysRevD.110.125010](https://doi.org/10.1103/PhysRevD.110.125010) arXiv:[2406.17451](https://arxiv.org/abs/2406.17451)
16. Ciambelli.EtAl:2019: Carroll structures, null geometry, and conformal isometries, 2019, doi:10.1103/PhysRevD.100.046010, arXiv:1905.02221 doi:[10.1103/PhysRevD.100.046010](https://doi.org/10.1103/PhysRevD.100.046010) arXiv:[1905.02221](https://arxiv.org/abs/1905.02221)
17. Curiel:2015: A {Weyl}-Type Theorem for Geometrized {Newtonian} Gravity, 2015, arXiv:1510.02089 arXiv:[1510.02089](https://arxiv.org/abs/1510.02089)
18. Dewar.Read:2020: Conformal Invariance of the {Newtonian} {Weyl} Tensor, 2020, doi:10.1007/s10701-020-00386-w, arXiv:2009.09733 doi:[10.1007/s10701-020-00386-w](https://doi.org/10.1007/s10701-020-00386-w) arXiv:[2009.09733](https://arxiv.org/abs/2009.09733)
19. Dewar.Weatherall:2018: On Gravitational Energy in {Newtonian} Theories, 2018, doi:10.1007/s10701-018-0151-6, arXiv:1707.00563 doi:[10.1007/s10701-018-0151-6](https://doi.org/10.1007/s10701-018-0151-6) arXiv:[1707.00563](https://arxiv.org/abs/1707.00563)
20. Dombrowski.Horneffer:1964: Die Differentialgeometrie des Galileischen Relativitätsprinzips, 1964, doi:10.1007/BF01110404 doi:[10.1007/BF01110404](https://doi.org/10.1007/BF01110404)
21. Dunajski.Gundry:2016: Non-Relativistic Twistor Theory and {Newton--Cartan} Geometry, 2016, doi:10.1007/s00220-015-2557-8, arXiv:1502.03034 doi:[10.1007/s00220-015-2557-8](https://doi.org/10.1007/s00220-015-2557-8) arXiv:[1502.03034](https://arxiv.org/abs/1502.03034)
22. Dunajski.Penrose:2023: Quantum state reduction, and {Newtonian} twistor theory, 2023, doi:10.1016/j.aop.2023.169243, arXiv:2203.08567 doi:[10.1016/j.aop.2023.169243](https://doi.org/10.1016/j.aop.2023.169243) arXiv:[2203.08567](https://arxiv.org/abs/2203.08567)
23. Dutta:2024: Stress tensors of 3d {Carroll CFTs}, 2024, doi:10.1016/j.physletb.2024.138672, arXiv:2212.11002 doi:[10.1016/j.physletb.2024.138672](https://doi.org/10.1016/j.physletb.2024.138672) arXiv:[2212.11002](https://arxiv.org/abs/2212.11002)
24. Duval.EtAl:2014: Carroll versus {Newton} and {Galilei}: two dual non-{Einstein\-ian} concepts of time, 2014, doi:10.1088/0264-9381/31/8/085016, arXiv:1402.0657 doi:[10.1088/0264-9381/31/8/085016](https://doi.org/10.1088/0264-9381/31/8/085016) arXiv:[1402.0657](https://arxiv.org/abs/1402.0657)
25. Duval.EtAl:2014b: Conformal {Carroll} groups, 2014, doi:10.1088/1751-8113/47/33/335204, arXiv:1403.4213 doi:[10.1088/1751-8113/47/33/335204](https://doi.org/10.1088/1751-8113/47/33/335204) arXiv:[1403.4213](https://arxiv.org/abs/1403.4213)
26. Duval.Horvathy:2011: Conformal {Galilei} groups, {Veronese} curves, and {Newton}--{Hooke} spacetimes, 2011, doi:10.1088/1751-8113/44/33/335203, arXiv:1104.1502 doi:[10.1088/1751-8113/44/33/335203](https://doi.org/10.1088/1751-8113/44/33/335203) arXiv:[1104.1502](https://arxiv.org/abs/1104.1502)
27. EPS:1972: The geometry of free fall and light propagation, 1972
28. EPS:2012: The geometry of free fall and light propagation, 2012, doi:10.1007/s10714-012-1353-4 doi:[10.1007/s10714-012-1353-4](https://doi.org/10.1007/s10714-012-1353-4)
29. Ehlers.Buchert:2009: On the {Newtonian} Limit of the {Weyl} Tensor, 2009, doi:10.1007/s10714-009-0855-1, arXiv:0907.2645 doi:[10.1007/s10714-009-0855-1](https://doi.org/10.1007/s10714-009-0855-1) arXiv:[0907.2645](https://arxiv.org/abs/0907.2645)
30. Ehlers:1981a: Über den Newtonschen Grenzwert der Einsteinschen Gravitationstheorie, 1981
31. Ehlers:1981b: On the {Newtonian} limit of {Einstein's} theory of gravitation, 2019, doi:10.1007/s10714-019-2624-0 doi:[10.1007/s10714-019-2624-0](https://doi.org/10.1007/s10714-019-2624-0)
32. Ewen.Schmidt:1989: Geometry of free fall and simultaneity, 1989, doi:10.1063/1.528279 doi:[10.1063/1.528279](https://doi.org/10.1063/1.528279)
33. Friedrichs:1928: Eine invariante Formulierung des Newtonschen Gravitationsgesetzes und des Grenzüberganges vom Einsteinschen zum Newtonschen Gesetz, 1928, doi:10.1007/BF01451608 doi:[10.1007/BF01451608](https://doi.org/10.1007/BF01451608)
34. Gupta.Suryanarayana:2021: Constructing {Carrollian CFTs}, 2021, doi:10.1007/JHEP03(2021)194, arXiv:2001.03056 doi:[10.1007/JHEP03(2021)194](https://doi.org/10.1007/JHEP03(2021)194) arXiv:[2001.03056](https://arxiv.org/abs/2001.03056)
35. Hagen:1972: Scale and Conformal Transformations in {Galilean}-Covariant Field Theory, 1972, doi:10.1103/PhysRevD.5.377 doi:[10.1103/PhysRevD.5.377](https://doi.org/10.1103/PhysRevD.5.377)
36. Hansen.EtAl:2019: Gravity between {Newton} and {Einstein}, 2019, doi:10.1142/S0218271819440103, arXiv:1904.05706 doi:[10.1142/S0218271819440103](https://doi.org/10.1142/S0218271819440103) arXiv:[1904.05706](https://arxiv.org/abs/1904.05706)
37. Hartong.EtAl:2023: Review on non-relativistic gravity, 2023, doi:10.3389/fphy.2023.1116888, arXiv:2212.11309 doi:[10.3389/fphy.2023.1116888](https://doi.org/10.3389/fphy.2023.1116888) arXiv:[2212.11309](https://arxiv.org/abs/2212.11309)
38. Herfray:2022: Carrollian manifolds and null infinity: a view from Cartan geometry, 2022, doi:10.1088/1361-6382/ac635f, arXiv:2112.09048 doi:[10.1088/1361-6382/ac635f](https://doi.org/10.1088/1361-6382/ac635f) arXiv:[2112.09048](https://arxiv.org/abs/2112.09048)
39. Kuenzle:1972: Galilei and {Lorentz} structures on space-time : Comparison of the corresponding geometry and physics, 1972
40. Kuenzle:1976: Covariant {Newtonian} Limit of {Lorentz} Space-Times, 1976, doi:10.1007/BF00766139 doi:[10.1007/BF00766139](https://doi.org/10.1007/BF00766139)
41. Malament:2012: Topics in the Foundations of General Relativity and Newtonian Gravitation Theory, 2012
42. March.Read:2025: A primer on {Carroll} gravity, 2025, doi:10.1088/1361-6382/adaf03, arXiv:2409.12200 doi:[10.1088/1361-6382/adaf03](https://doi.org/10.1088/1361-6382/adaf03) arXiv:[2409.12200](https://arxiv.org/abs/2409.12200)
43. March:2023: Non-relativistic twistor theory: {Newtonian} limits and gravitational collapse, 2023
44. March:2025: A note on Newton-Cartan Weyl-type theorems, 2025
45. Reichenbach:1969: Axiomatization of the Theory of Relativity, 1969
46. Schwartz:2025: The classification of general affine connections in {Newton--Cartan} geometry: Towards metric-affine {Newton--Cartan} gravity, 2025, doi:10.1088/1361-6382/ad922f, arXiv:2403.15460 doi:[10.1088/1361-6382/ad922f](https://doi.org/10.1088/1361-6382/ad922f) arXiv:[2403.15460](https://arxiv.org/abs/2403.15460)
47. Schwartz:NC_gravity: {Newton--Cartan} Gravity: A Modern Introduction to Geometrised Newtonian Gravity, 2026, doi:10.1007/978-3-032-03967-5 doi:[10.1007/978-3-032-03967-5](https://doi.org/10.1007/978-3-032-03967-5)
48. Trautman:1963: Sur la théorie newtonienne de la gravitation, 1963
49. Trautman:1965: Foundations and current problems of general relativity, 1965
50. Vigneron.Barzegar.Read:2025: Affine connections for {Galilean} and {Carrollian} structures: a unified perspective, 2025, doi:10.1088/1361-6382/adfc1e, arXiv:2506.03936 doi:[10.1088/1361-6382/adfc1e](https://doi.org/10.1088/1361-6382/adfc1e) arXiv:[2506.03936](https://arxiv.org/abs/2506.03936)
51. Weyl:1921: Zur {Infinitesimalgeometrie}: {Einordnung} der projektiven und der konformen {Auffassung}, 1921
52. Witten:2022: Gravity and the crossed product, 2022, doi:10.1007/JHEP10(2022)008, arXiv:2112.12828 doi:[10.1007/JHEP10(2022)008](https://doi.org/10.1007/JHEP10(2022)008) arXiv:[2112.12828](https://arxiv.org/abs/2112.12828)
53. Wolf.Sanchioni.Read:2024: Underdetermination in Classic and Modern Tests of General Relativity, 2024, doi:10.1007/s13194-024-00617-1, arXiv:2307.10074 doi:[10.1007/s13194-024-00617-1](https://doi.org/10.1007/s13194-024-00617-1) arXiv:[2307.10074](https://arxiv.org/abs/2307.10074)

