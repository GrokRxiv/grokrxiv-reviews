# Weyl-type theorems in Galilei and Carroll geometry

GrokRxiv review of [arXiv:2606.00799](https://arxiv.org/abs/2606.00799) · `math-ph`

_Authors_: Philip K. Schwartz, James Read, Quentin Vigneron

## TL;DR

The five specialist outputs describe a paper that extends Weyl's classical uniqueness theorem — previously established for pseudo-Riemannian manifolds — to both Galilei (non-relativistic) and Carroll (ultra-relativistic) geometry. The novelty specialist rates the contribution as significant (score 0.75, confidence 0.9), identifying clear predecessor work that the paper explicitly generalises. However, two structural problems dominate the review. First, the pipeline received only the abstract and bibliography: the entire paper body, including theorem statements, definitions of Galilei and Carroll conformal and projective structures, lemmas, and proofs, is absent from the review artifact (technical_correctness C8, severity critical). This limits all correctness assessment to abstract-level plausibility checks, holding the technical-correctness specialist's confidence to 0.35. Second, reproducibility flagged the absence of any machine-checkable proof artifact for the headline Galilei and Carroll Weyl-type theorems at critical severity; no code or data repository of any kind is provided (reproducibility_score 0.12). The citation specialist timed out and produced no usable output; no external verifier data on citation existence or DOI resolution is available from this run. The technical-correctness specialist separately flagged at major severity that the abstract's phrasing — 'We discuss analogous results' — does not distinguish new proofs from survey or synthesis of Curiel:2015, Dewar.Read:2020, and March:2025. Per the recommendation gate, the combination of critical reproducibility findings and major or critical technical-correctness findings in a math-amenable field (math-ph / gr-qc) defaults the recommendation to major_revision.

_Recommendation_: **Major revision** · _Confidence_: 65%

## Strengths

- The paper addresses a clearly motivated and underexplored gap: while Weyl's theorem has been extended to Newtonian and Newton-Cartan geometry individually (Curiel:2015, March:2025), no prior work provides a unified and systematic treatment covering both Galilei and Carroll geometry simultaneously.
- The novelty specialist (confidence 0.9, score 0.75) finds the contribution significant, with well-identified prior art that the paper builds on and extends rather than duplicates.
- Abstract-level attribution is accurate: the founding theorem is correctly credited to Weyl:1921, the physical motivation to EPS:1972, and the limiting-case picture to the dual c-to-infinity and c-to-zero contractions established in Duval et al.:2014.
- The paper situates itself within a coherent and active research area, directly building on the unified connection framework of Vigneron.Barzegar.Read:2025, giving readers a clear entry point into the technical setting.

## Weaknesses

- The entire paper body — theorem statements, definitions of Galilei and Carroll conformal and projective structures, lemmas, and proofs — is absent from the review artifact (sections[] is empty), making independent technical verification of the headline uniqueness claims impossible (technical_correctness C8, severity critical).
- No machine-checkable proof artifact is provided for either the Galilei or Carroll Weyl-type theorem in a proof assistant such as Lean 4, Coq, Agda, or Isabelle, leaving the load-bearing uniqueness claims unverifiable by automated means in a math-amenable field; reproducibility flagged both gaps at critical severity, with suggested locators proofs/galilei_weyl_type_theorem.lean and proofs/carroll_weyl_type_theorem.lean.
- The abstract's phrasing 'We discuss analogous results' does not distinguish original theorems from restatements of Curiel:2015, Dewar.Read:2020, or March:2025, all of which establish Newton-Cartan or Galilean Weyl-type results; without the body, the paper's independent contribution cannot be assessed (technical_correctness C7, severity major).
- The definition of 'suitably defined conformal structure' for Galilei and Carroll spacetimes — the central object of both theorems — is not fixed or justified in any available material, leaving the theorem hypotheses ambiguous and the choice of conformal structure unmotivated relative to alternatives in Duval-Horvathy:2011 and Duval et al.:2014b (technical_correctness C6, C3, C4, severity minor to major).
- No code or data repository of any kind is provided and code availability is unspecified; the reproducibility specialist assigned a score of 0.12.

## Revision Targets

- [ ] **Manuscript: Sections (entire body of paper, not provided)**
  - Location: `Sections (entire body of paper, not provided)`
  - Evidence: review_input.json contains an empty 'sections' array and an empty 'figures' array. Only the abstract, bibliography, and metadata are available. No theorem statements, no definitions of Galilei/Carroll conformal structure as used in this paper, no projective-structure compatibility conditions, no proofs, and no equations have been provided to the reviewer. As a consequence, no claim beyond the abstract-level summary can be independently checked, and the headline analogues-of-Weyl claims (C3, C4, C7) cannot be technically verified.
  - Required change: Re-extract the paper so that sections (definitions, lemmas, theorems, proofs) are populated in review_input.json. For math-ph load-bearing theorems, additionally ship the formal proofs in a proof assistant (Lean 4 / Coq / Agda / Isabelle) at a repository location such as proofs/GalileiCarrollWeyl/ so that the central uniqueness claims become machine-verifiable rather than reviewer-attested.
  - Verification: Re-review should confirm `Sections (entire body of paper, not provided)` is corrected or justified.
- [ ] **Manuscript: Sections (entire body of paper, not provided)**
  - Location: `Sections (entire body of paper, not provided)`
  - Evidence: review_input.json contains an empty 'sections' array and an empty 'figures' array. Only the abstract, bibliography, and metadata are available. No theorem statements, no definitions of Galilei/Carroll conformal structure as used in this paper, no projective-structure compatibility conditions, no proofs, and no equations have been provided to the reviewer. As a consequence, no claim beyond the abstract-level summary can be independently checked, and the headline analogues-of-Weyl claims (C3, C4, C7) cannot be technically verified.
  - Required change: Re-extract the paper so that sections (definitions, lemmas, theorems, proofs) are populated in review_input.json. For math-ph load-bearing theorems, additionally ship the formal proofs in a proof assistant (Lean 4 / Coq / Agda / Isabelle) at a repository location such as proofs/GalileiCarrollWeyl/ so that the central uniqueness claims become machine-verifiable rather than reviewer-attested.
  - Verification: Re-review should confirm `Sections (entire body of paper, not provided)` is corrected or justified.
- [ ] **Manuscript: Abstract (overall framing 'We discuss analogous results...')**
  - Location: `Abstract (overall framing 'We discuss analogous results...')`
  - Evidence: The verb 'discuss' is ambiguous between proving and surveying. Existing Newton-Cartan Weyl-type theorems are already in the literature (Curiel:2015 [17], Dewar.Read:2020 [18], March:2025 [44]), and one co-author has a recent 'note on Newton-Cartan Weyl-type theorems' ([44]) and another wrote on Galilean/Carrollian affine connections ([50]). With the section text absent from review_input.json, it cannot be determined what is novel here versus a synthesis. As a math-ph paper in a code-amenable field with no executable artifact, the novelty/load-bearing portion cannot be verified by code either.
  - Required change: Clearly delineate in the introduction which theorems are original to this paper and which are restatements of Curiel:2015, Dewar.Read:2020, March:2025, or Vigneron.Barzegar.Read:2025. Where possible, supply a formal proof artifact (Lean/Coq under e.g. src/proofs/CarrollWeyl.lean) for the new theorems, since the field is amenable to such verification.
  - Verification: Re-review should confirm `Abstract (overall framing 'We discuss analogous results...')` is corrected or justified.
- [ ] **Manuscript: Abstract, sentence 3 (qualifier 'suitably defined')**
  - Location: `Abstract, sentence 3 (qualifier 'suitably defined')`
  - Evidence: Conformal Galilei and conformal Carroll structures have been defined in the literature (Duval.Horvathy:2011 [26], Duval.EtAl:2014b [25]). However, the abstract concedes by the word 'suitably' that the definition adopted in this paper is a choice, and the review materials do not include the section in which that choice is fixed or justified. Without the definition, the load-bearing object of the theorem is ambiguous.
  - Required change: In the body, give an explicit definition of the Galilei (resp. Carroll) conformal structure being used, compare to the alternatives in Duval.Horvathy:2011 / Duval.EtAl:2014b / Ciambelli.EtAl:2019, and motivate why this is the 'correct' analogue of pseudo-Riemannian conformal structure for a Weyl-type theorem.
  - Verification: Re-review should confirm `Abstract, sentence 3 (qualifier 'suitably defined')` is corrected or justified.
- [ ] **Code release and entrypoints**
  - Location: code/reproducibility artifacts: `code release and execution entrypoints`
  - Evidence: No code repository, release, license, or machine-checkable artifact is provided for reproducing the paper's Weyl-type theorem derivations.
  - Required change: Release the source code, scripts, model configuration, and execution entrypoints needed to regenerate the reported tables, or document why those artifacts cannot be released.
  - Verification: Re-review should confirm runnable code or a documented non-release justification is present.

## Open Questions

- Which theorems are original to this paper, and which are restatements or mild generalisations of Curiel:2015, Dewar.Read:2020, or March:2025? Can the introduction explicitly tabulate the new contributions and distinguish them from prior results?
- What precise definition of Galilei conformal structure is adopted, and how does it relate to the alternatives studied in Duval-Horvathy:2011 and Duval et al.:2014b? Is the same definitional choice made for the Carroll case, and if so, what justifies it as the canonical analogue for a Weyl-type argument?
- Do the sections of the paper contain complete, self-contained proofs of the Galilei and Carroll Weyl-type theorems, or are proofs deferred to a companion paper? If proofs are present, what caused the review pipeline to extract an empty sections array?
- Would the authors consider providing machine-checkable proof files in Lean 4 or Coq for the headline uniqueness theorems in a public repository, given that the math-ph community increasingly expects formal verification for foundational geometric results?
- The citation specialist timed out and left no verifiable evidence regarding reference existence or DOI resolution; are there unusual citation formats or very recent preprints without stable DOIs in the bibliography that may have caused this failure?

## Per-Agent Reviews

### citation (`gemini-3-flash-preview`) — status: `warn`

```json
{
  "confidence": 0.0,
  "entries": [
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": "10.1093/9780198922391.001.0001",
        "key": "Adlam.Linnemann.Read",
        "raw": "Adlam.Linnemann.Read:2025: Constructive axiomatics for spacetime physics, 2025, doi:10.1093/9780198922391.001.0001",
        "title": "Constructive axiomatics for spacetime physics",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1093/9780198922391.001.0001",
      "resolved_url": "https://doi.org/10.1093/9780198922391.001.0001"
    },
    {
      "citation": {
        "arxiv_id": "0903.3953",
        "authors": [],
        "doi": "10.1088/1126-6708/2009/08/022",
        "key": "Alishahiha.Davody.Vahedi",
        "raw": "Alishahiha.Davody.Vahedi:2009: On {AdS/CFT} of {Galilean} Conformal Field Theories, 2009, doi:10.1088/1126-6708/2009/08/022, arXiv:0903.3953",
        "title": "On {AdS/CFT} of {Galilean} Conformal Field Theories",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1088/1126-6708/2009/08/022",
      "resolved_url": "https://doi.org/10.1088/1126-6708/2009/08/022"
    },
    {
      "citation": {
        "arxiv_id": "1408.0810",
        "authors": [],
        "doi": "10.1007/JHEP11(2014)061",
        "key": "Bagchi.Basu.Mehra",
        "raw": "Bagchi.Basu.Mehra:2014: Galilean Conformal Electrodynamics, 2014, doi:10.1007/JHEP11(2014)061, arXiv:1408.0810",
        "title": "Galilean Conformal Electrodynamics",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1007/JHEP11(2014)061",
      "resolved_url": "https://doi.org/10.1007/JHEP11(2014)061"
    },
    {
      "citation": {
        "arxiv_id": "1712.05631",
        "authors": [],
        "doi": "10.1007/JHEP04(2018)144",
        "key": "Bagchi.Chakrabortty.Mehra",
        "raw": "Bagchi.Chakrabortty.Mehra:2018: Galilean field theories and conformal structure, 2018, doi:10.1007/JHEP04(2018)144, arXiv:1712.05631",
        "title": "Galilean field theories and conformal structure",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1007/JHEP04(2018)144",
      "resolved_url": "https://doi.org/10.1007/JHEP04(2018)144"
    },
    {
      "citation": {
        "arxiv_id": "0902.1385",
        "authors": [],
        "doi": "10.1088/1126-6708/2009/07/037",
        "key": "Bagchi.Gopakumar",
        "raw": "Bagchi.Gopakumar:2009: Galilean conformal algebras and {AdS/CFT}, 2009, doi:10.1088/1126-6708/2009/07/037, arXiv:0902.1385",
        "title": "Galilean conformal algebras and {AdS/CFT}",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1088/1126-6708/2009/07/037",
      "resolved_url": "https://doi.org/10.1088/1126-6708/2009/07/037"
    },
    {
      "citation": {
        "arxiv_id": "0903.4524",
        "authors": [],
        "doi": "10.1016/j.physletb.2009.04.030",
        "key": "Bagchi.Mandal",
        "raw": "Bagchi.Mandal:2009: On representations and correlation functions of {Galilean} conformal algebras, 2009, doi:10.1016/j.physletb.2009.04.030, arXiv:0903.4524",
        "title": "On representations and correlation functions of {Galilean} conformal algebras",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1016/j.physletb.2009.04.030",
      "resolved_url": "https://doi.org/10.1016/j.physletb.2009.04.030"
    },
    {
      "citation": {
        "arxiv_id": "1405.2264",
        "authors": [],
        "doi": "10.1088/0264-9381/31/20/205009",
        "key": "Bergshoeff.EtAl",
        "raw": "Bergshoeff.EtAl:2014: Dynamics of {Carroll} particles, 2014, doi:10.1088/0264-9381/31/20/205009, arXiv:1405.2264",
        "title": "Dynamics of {Carroll} particles",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1088/0264-9381/31/20/205009",
      "resolved_url": "https://doi.org/10.1088/0264-9381/31/20/205009"
    },
    {
      "citation": {
        "arxiv_id": "1701.06156",
        "authors": [],
        "doi": "10.1007/JHEP03(2017)165",
        "key": "Bergshoeff.EtAl",
        "raw": "Bergshoeff.EtAl:2017: Carroll versus {Galilei} gravity, 2017, doi:10.1007/JHEP03(2017)165, arXiv:1701.06156",
        "title": "Carroll versus {Galilei} gravity",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1007/JHEP03(2017)165",
      "resolved_url": "https://doi.org/10.1007/JHEP03(2017)165"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": "10.1007/978-3-032-03921-7_33",
        "key": "Bergshoeff.EtAl",
        "raw": "Bergshoeff.EtAl:2026: Applied Conformal {Carroll} Geometry, 2026, doi:10.1007/978-3-032-03921-7_33",
        "title": "Applied Conformal {Carroll} Geometry",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1007/978-3-032-03921-7_33",
      "resolved_url": "https://doi.org/10.1007/978-3-032-03921-7_33"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": "10.24033/asens.751",
        "key": "Cartan",
        "raw": "Cartan:1923: Sur les variétés à connexion affine et la théorie de la relativité généralisée (première partie), 1923, doi:10.24033/asens.751",
        "title": "Sur les variétés à connexion affine et la théorie de la relativité généralisée (première partie)",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.24033/asens.751",
      "resolved_url": "https://doi.org/10.24033/asens.751"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": "10.24033/asens.753",
        "key": "Cartan",
        "raw": "Cartan:1924: Sur les variétés à connexion affine et la théorie de la relativité généralisée (première partie) ({Suite}), 1924, doi:10.24033/asens.753",
        "title": "Sur les variétés à connexion affine et la théorie de la relativité généralisée (première partie) ({Suite})",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.24033/asens.753",
      "resolved_url": "https://doi.org/10.24033/asens.753"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "Cartan",
        "raw": "Cartan:1986: On Manifolds with an Affine Connection and the Theory of General Relativity, 1986",
        "title": "On Manifolds with an Affine Connection and the Theory of General Relativity",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "unverified via crossref_bibliographic: not verified by Crossref bibliographic search; no match above score threshold",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2206.10780",
        "authors": [],
        "doi": "10.1007/JHEP02(2023)082",
        "key": "Chandrasekaran.EtAl",
        "raw": "Chandrasekaran.EtAl:2023: An algebra of observables for {de Sitter} space, 2023, doi:10.1007/JHEP02(2023)082, arXiv:2206.10780",
        "title": "An algebra of observables for {de Sitter} space",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1007/JHEP02(2023)082",
      "resolved_url": "https://doi.org/10.1007/JHEP02(2023)082"
    },
    {
      "citation": {
        "arxiv_id": "2203.10490",
        "authors": [],
        "doi": "10.1007/JHEP05(2023)224",
        "key": "Chen.Liu",
        "raw": "Chen.Liu:2023: The shadow formalism of {Galilean CFT\\textsubscript{2}}, 2023, doi:10.1007/JHEP05(2023)224, arXiv:2203.10490",
        "title": "The shadow formalism of {Galilean CFT\\textsubscript{2}}",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1007/JHEP05(2023)224",
      "resolved_url": "https://doi.org/10.1007/JHEP05(2023)224"
    },
    {
      "citation": {
        "arxiv_id": "2406.17451",
        "authors": [],
        "doi": "10.1103/PhysRevD.110.125010",
        "key": "Chen.Sun.Zheng",
        "raw": "Chen.Sun.Zheng:2024: Quantization of {Carrollian} conformal scalar theories, 2024, doi:10.1103/PhysRevD.110.125010, arXiv:2406.17451",
        "title": "Quantization of {Carrollian} conformal scalar theories",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1103/PhysRevD.110.125010",
      "resolved_url": "https://doi.org/10.1103/PhysRevD.110.125010"
    },
    {
      "citation": {
        "arxiv_id": "1905.02221",
        "authors": [],
        "doi": "10.1103/PhysRevD.100.046010",
        "key": "Ciambelli.EtAl",
        "raw": "Ciambelli.EtAl:2019: Carroll structures, null geometry, and conformal isometries, 2019, doi:10.1103/PhysRevD.100.046010, arXiv:1905.02221",
        "title": "Carroll structures, null geometry, and conformal isometries",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1103/PhysRevD.100.046010",
      "resolved_url": "https://doi.org/10.1103/PhysRevD.100.046010"
    },
    {
      "citation": {
        "arxiv_id": "1510.02089",
        "authors": [],
        "doi": null,
        "key": "Curiel",
        "raw": "Curiel:2015: A {Weyl}-Type Theorem for Geometrized {Newtonian} Gravity, 2015, arXiv:1510.02089",
        "title": "A {Weyl}-Type Theorem for Geometrized {Newtonian} Gravity",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via arxiv",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": "https://arxiv.org/abs/1510.02089"
    },
    {
      "citation": {
        "arxiv_id": "2009.09733",
        "authors": [],
        "doi": "10.1007/s10701-020-00386-w",
        "key": "Dewar.Read",
        "raw": "Dewar.Read:2020: Conformal Invariance of the {Newtonian} {Weyl} Tensor, 2020, doi:10.1007/s10701-020-00386-w, arXiv:2009.09733",
        "title": "Conformal Invariance of the {Newtonian} {Weyl} Tensor",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1007/s10701-020-00386-w",
      "resolved_url": "https://doi.org/10.1007/s10701-020-00386-w"
    },
    {
      "citation": {
        "arxiv_id": "1707.00563",
        "authors": [],
        "doi": "10.1007/s10701-018-0151-6",
        "key": "Dewar.Weatherall",
        "raw": "Dewar.Weatherall:2018: On Gravitational Energy in {Newtonian} Theories, 2018, doi:10.1007/s10701-018-0151-6, arXiv:1707.00563",
        "title": "On Gravitational Energy in {Newtonian} Theories",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1007/s10701-018-0151-6",
      "resolved_url": "https://doi.org/10.1007/s10701-018-0151-6"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": "10.1007/BF01110404",
        "key": "Dombrowski.Horneffer",
        "raw": "Dombrowski.Horneffer:1964: Die Differentialgeometrie des Galileischen Relativitätsprinzips, 1964, doi:10.1007/BF01110404",
        "title": "Die Differentialgeometrie des Galileischen Relativitätsprinzips",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1007/BF01110404",
      "resolved_url": "https://doi.org/10.1007/BF01110404"
    },
    {
      "citation": {
        "arxiv_id": "1502.03034",
        "authors": [],
        "doi": "10.1007/s00220-015-2557-8",
        "key": "Dunajski.Gundry",
        "raw": "Dunajski.Gundry:2016: Non-Relativistic Twistor Theory and {Newton--Cartan} Geometry, 2016, doi:10.1007/s00220-015-2557-8, arXiv:1502.03034",
        "title": "Non-Relativistic Twistor Theory and {Newton--Cartan} Geometry",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1007/s00220-015-2557-8",
      "resolved_url": "https://doi.org/10.1007/s00220-015-2557-8"
    },
    {
      "citation": {
        "arxiv_id": "2203.08567",
        "authors": [],
        "doi": "10.1016/j.aop.2023.169243",
        "key": "Dunajski.Penrose",
        "raw": "Dunajski.Penrose:2023: Quantum state reduction, and {Newtonian} twistor theory, 2023, doi:10.1016/j.aop.2023.169243, arXiv:2203.08567",
        "title": "Quantum state reduction, and {Newtonian} twistor theory",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1016/j.aop.2023.169243",
      "resolved_url": "https://doi.org/10.1016/j.aop.2023.169243"
    },
    {
      "citation": {
        "arxiv_id": "2212.11002",
        "authors": [],
        "doi": "10.1016/j.physletb.2024.138672",
        "key": "Dutta",
        "raw": "Dutta:2024: Stress tensors of 3d {Carroll CFTs}, 2024, doi:10.1016/j.physletb.2024.138672, arXiv:2212.11002",
        "title": "Stress tensors of 3d {Carroll CFTs}",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1016/j.physletb.2024.138672",
      "resolved_url": "https://doi.org/10.1016/j.physletb.2024.138672"
    },
    {
      "citation": {
        "arxiv_id": "1402.0657",
        "authors": [],
        "doi": "10.1088/0264-9381/31/8/085016",
        "key": "Duval.EtAl",
        "raw": "Duval.EtAl:2014: Carroll versus {Newton} and {Galilei}: two dual non-{Einstein\\-ian} concepts of time, 2014, doi:10.1088/0264-9381/31/8/085016, arXiv:1402.0657",
        "title": "Carroll versus {Newton} and {Galilei}: two dual non-{Einstein\\-ian} concepts of time",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1088/0264-9381/31/8/085016",
      "resolved_url": "https://doi.org/10.1088/0264-9381/31/8/085016"
    },
    {
      "citation": {
        "arxiv_id": "1403.4213",
        "authors": [],
        "doi": "10.1088/1751-8113/47/33/335204",
        "key": "Duval.EtAl",
        "raw": "Duval.EtAl:2014b: Conformal {Carroll} groups, 2014, doi:10.1088/1751-8113/47/33/335204, arXiv:1403.4213",
        "title": "Conformal {Carroll} groups",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1088/1751-8113/47/33/335204",
      "resolved_url": "https://doi.org/10.1088/1751-8113/47/33/335204"
    },
    {
      "citation": {
        "arxiv_id": "1104.1502",
        "authors": [],
        "doi": "10.1088/1751-8113/44/33/335203",
        "key": "Duval.Horvathy",
        "raw": "Duval.Horvathy:2011: Conformal {Galilei} groups, {Veronese} curves, and {Newton}--{Hooke} spacetimes, 2011, doi:10.1088/1751-8113/44/33/335203, arXiv:1104.1502",
        "title": "Conformal {Galilei} groups, {Veronese} curves, and {Newton}--{Hooke} spacetimes",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1088/1751-8113/44/33/335203",
      "resolved_url": "https://doi.org/10.1088/1751-8113/44/33/335203"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "EPS",
        "raw": "EPS:1972: The geometry of free fall and light propagation, 1972",
        "title": "The geometry of free fall and light propagation",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "unverified via crossref_bibliographic: not verified by Crossref bibliographic search; no match above score threshold",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": "10.1007/s10714-012-1353-4",
        "key": "EPS",
        "raw": "EPS:2012: The geometry of free fall and light propagation, 2012, doi:10.1007/s10714-012-1353-4",
        "title": "The geometry of free fall and light propagation",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1007/s10714-012-1353-4",
      "resolved_url": "https://doi.org/10.1007/s10714-012-1353-4"
    },
    {
      "citation": {
        "arxiv_id": "0907.2645",
        "authors": [],
        "doi": "10.1007/s10714-009-0855-1",
        "key": "Ehlers.Buchert",
        "raw": "Ehlers.Buchert:2009: On the {Newtonian} Limit of the {Weyl} Tensor, 2009, doi:10.1007/s10714-009-0855-1, arXiv:0907.2645",
        "title": "On the {Newtonian} Limit of the {Weyl} Tensor",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1007/s10714-009-0855-1",
      "resolved_url": "https://doi.org/10.1007/s10714-009-0855-1"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "Ehlers",
        "raw": "Ehlers:1981a: Über den Newtonschen Grenzwert der Einsteinschen Gravitationstheorie, 1981",
        "title": "Über den Newtonschen Grenzwert der Einsteinschen Gravitationstheorie",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "unverified via crossref_bibliographic: not verified by Crossref bibliographic search; no match above score threshold",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": "10.1007/s10714-019-2624-0",
        "key": "Ehlers",
        "raw": "Ehlers:1981b: On the {Newtonian} limit of {Einstein's} theory of gravitation, 2019, doi:10.1007/s10714-019-2624-0",
        "title": "On the {Newtonian} limit of {Einstein's} theory of gravitation",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1007/s10714-019-2624-0",
      "resolved_url": "https://doi.org/10.1007/s10714-019-2624-0"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": "10.1063/1.528279",
        "key": "Ewen.Schmidt",
        "raw": "Ewen.Schmidt:1989: Geometry of free fall and simultaneity, 1989, doi:10.1063/1.528279",
        "title": "Geometry of free fall and simultaneity",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1063/1.528279",
      "resolved_url": "https://doi.org/10.1063/1.528279"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": "10.1007/BF01451608",
        "key": "Friedrichs",
        "raw": "Friedrichs:1928: Eine invariante Formulierung des Newtonschen Gravitationsgesetzes und des Grenzüberganges vom Einsteinschen zum Newtonschen Gesetz, 1928, doi:10.1007/BF01451608",
        "title": "Eine invariante Formulierung des Newtonschen Gravitationsgesetzes und des Grenzüberganges vom Einsteinschen zum Newtonschen Gesetz",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1007/BF01451608",
      "resolved_url": "https://doi.org/10.1007/BF01451608"
    },
    {
      "citation": {
        "arxiv_id": "2001.03056",
        "authors": [],
        "doi": "10.1007/JHEP03(2021)194",
        "key": "Gupta.Suryanarayana",
        "raw": "Gupta.Suryanarayana:2021: Constructing {Carrollian CFTs}, 2021, doi:10.1007/JHEP03(2021)194, arXiv:2001.03056",
        "title": "Constructing {Carrollian CFTs}",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1007/JHEP03(2021)194",
      "resolved_url": "https://doi.org/10.1007/JHEP03(2021)194"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": "10.1103/PhysRevD.5.377",
        "key": "Hagen",
        "raw": "Hagen:1972: Scale and Conformal Transformations in {Galilean}-Covariant Field Theory, 1972, doi:10.1103/PhysRevD.5.377",
        "title": "Scale and Conformal Transformations in {Galilean}-Covariant Field Theory",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1103/PhysRevD.5.377",
      "resolved_url": "https://doi.org/10.1103/PhysRevD.5.377"
    },
    {
      "citation": {
        "arxiv_id": "1904.05706",
        "authors": [],
        "doi": "10.1142/S0218271819440103",
        "key": "Hansen.EtAl",
        "raw": "Hansen.EtAl:2019: Gravity between {Newton} and {Einstein}, 2019, doi:10.1142/S0218271819440103, arXiv:1904.05706",
        "title": "Gravity between {Newton} and {Einstein}",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1142/S0218271819440103",
      "resolved_url": "https://doi.org/10.1142/S0218271819440103"
    },
    {
      "citation": {
        "arxiv_id": "2212.11309",
        "authors": [],
        "doi": "10.3389/fphy.2023.1116888",
        "key": "Hartong.EtAl",
        "raw": "Hartong.EtAl:2023: Review on non-relativistic gravity, 2023, doi:10.3389/fphy.2023.1116888, arXiv:2212.11309",
        "title": "Review on non-relativistic gravity",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.3389/fphy.2023.1116888",
      "resolved_url": "https://doi.org/10.3389/fphy.2023.1116888"
    },
    {
      "citation": {
        "arxiv_id": "2112.09048",
        "authors": [],
        "doi": "10.1088/1361-6382/ac635f",
        "key": "Herfray",
        "raw": "Herfray:2022: Carrollian manifolds and null infinity: a view from Cartan geometry, 2022, doi:10.1088/1361-6382/ac635f, arXiv:2112.09048",
        "title": "Carrollian manifolds and null infinity: a view from Cartan geometry",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1088/1361-6382/ac635f",
      "resolved_url": "https://doi.org/10.1088/1361-6382/ac635f"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "Kuenzle",
        "raw": "Kuenzle:1972: Galilei and {Lorentz} structures on space-time : Comparison of the corresponding geometry and physics, 1972",
        "title": "Galilei and {Lorentz} structures on space-time : Comparison of the corresponding geometry and physics",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "unverified via crossref_bibliographic: not verified by Crossref bibliographic search; no match above score threshold",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": "10.1007/BF00766139",
        "key": "Kuenzle",
        "raw": "Kuenzle:1976: Covariant {Newtonian} Limit of {Lorentz} Space-Times, 1976, doi:10.1007/BF00766139",
        "title": "Covariant {Newtonian} Limit of {Lorentz} Space-Times",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1007/BF00766139",
      "resolved_url": "https://doi.org/10.1007/BF00766139"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "Malament",
        "raw": "Malament:2012: Topics in the Foundations of General Relativity and Newtonian Gravitation Theory, 2012",
        "title": "Topics in the Foundations of General Relativity and Newtonian Gravitation Theory",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.7208/chicago/9780226502472.001.0001",
      "resolved_url": "https://doi.org/10.7208/chicago/9780226502472.001.0001"
    },
    {
      "citation": {
        "arxiv_id": "2409.12200",
        "authors": [],
        "doi": "10.1088/1361-6382/adaf03",
        "key": "March.Read",
        "raw": "March.Read:2025: A primer on {Carroll} gravity, 2025, doi:10.1088/1361-6382/adaf03, arXiv:2409.12200",
        "title": "A primer on {Carroll} gravity",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1088/1361-6382/adaf03",
      "resolved_url": "https://doi.org/10.1088/1361-6382/adaf03"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "March",
        "raw": "March:2023: Non-relativistic twistor theory: {Newtonian} limits and gravitational collapse, 2023",
        "title": "Non-relativistic twistor theory: {Newtonian} limits and gravitational collapse",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "unverified via crossref_bibliographic: not verified by Crossref bibliographic search; no match above score threshold",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "March",
        "raw": "March:2025: A note on Newton-Cartan Weyl-type theorems, 2025",
        "title": "A note on Newton-Cartan Weyl-type theorems",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "unverified via crossref_bibliographic: not verified by Crossref bibliographic search; no match above score threshold",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "Reichenbach",
        "raw": "Reichenbach:1969: Axiomatization of the Theory of Relativity, 1969",
        "title": "Axiomatization of the Theory of Relativity",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "unverified via crossref_bibliographic: not verified by Crossref bibliographic search; no match above score threshold",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2403.15460",
        "authors": [],
        "doi": "10.1088/1361-6382/ad922f",
        "key": "Schwartz",
        "raw": "Schwartz:2025: The classification of general affine connections in {Newton--Cartan} geometry: Towards metric-affine {Newton--Cartan} gravity, 2025, doi:10.1088/1361-6382/ad922f, arXiv:2403.15460",
        "title": "The classification of general affine connections in {Newton--Cartan} geometry: Towards metric-affine {Newton--Cartan} gravity",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1088/1361-6382/ad922f",
      "resolved_url": "https://doi.org/10.1088/1361-6382/ad922f"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": "10.1007/978-3-032-03967-5",
        "key": "Schwartz",
        "raw": "Schwartz:NC_gravity: {Newton--Cartan} Gravity: A Modern Introduction to Geometrised Newtonian Gravity, 2026, doi:10.1007/978-3-032-03967-5",
        "title": "{Newton--Cartan} Gravity: A Modern Introduction to Geometrised Newtonian Gravity",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1007/978-3-032-03967-5",
      "resolved_url": "https://doi.org/10.1007/978-3-032-03967-5"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "Trautman",
        "raw": "Trautman:1963: Sur la théorie newtonienne de la gravitation, 1963",
        "title": "Sur la théorie newtonienne de la gravitation",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1051/978-2-7598-0272-2.c010",
      "resolved_url": "https://doi.org/10.1051/978-2-7598-0272-2.c010"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "Trautman",
        "raw": "Trautman:1965: Foundations and current problems of general relativity, 1965",
        "title": "Foundations and current problems of general relativity",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "unverified via crossref_bibliographic: not verified by Crossref bibliographic search; no match above score threshold",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2506.03936",
        "authors": [],
        "doi": "10.1088/1361-6382/adfc1e",
        "key": "Vigneron.Barzegar.Read",
        "raw": "Vigneron.Barzegar.Read:2025: Affine connections for {Galilean} and {Carrollian} structures: a unified perspective, 2025, doi:10.1088/1361-6382/adfc1e, arXiv:2506.03936",
        "title": "Affine connections for {Galilean} and {Carrollian} structures: a unified perspective",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1088/1361-6382/adfc1e",
      "resolved_url": "https://doi.org/10.1088/1361-6382/adfc1e"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "Weyl",
        "raw": "Weyl:1921: Zur {Infinitesimalgeometrie}: {Einordnung} der projektiven und der konformen {Auffassung}, 1921",
        "title": "Zur {Infinitesimalgeometrie}: {Einordnung} der projektiven und der konformen {Auffassung}",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1007/978-3-663-05500-6_2",
      "resolved_url": "https://doi.org/10.1007/978-3-663-05500-6_2"
    },
    {
      "citation": {
        "arxiv_id": "2112.12828",
        "authors": [],
        "doi": "10.1007/JHEP10(2022)008",
        "key": "Witten",
        "raw": "Witten:2022: Gravity and the crossed product, 2022, doi:10.1007/JHEP10(2022)008, arXiv:2112.12828",
        "title": "Gravity and the crossed product",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1007/JHEP10(2022)008",
      "resolved_url": "https://doi.org/10.1007/JHEP10(2022)008"
    },
    {
      "citation": {
        "arxiv_id": "2307.10074",
        "authors": [],
        "doi": "10.1007/s13194-024-00617-1",
        "key": "Wolf.Sanchioni.Read",
        "raw": "Wolf.Sanchioni.Read:2024: Underdetermination in Classic and Modern Tests of General Relativity, 2024, doi:10.1007/s13194-024-00617-1, arXiv:2307.10074",
        "title": "Underdetermination in Classic and Modern Tests of General Relativity",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref",
      "relevance": "medium",
      "resolved_doi": "10.1007/s13194-024-00617-1",
      "resolved_url": "https://doi.org/10.1007/s13194-024-00617-1"
    }
  ],
  "missing_references": [],
  "summary": "Citation-use agent failed before producing a normal citation relevance review. Deterministic citation verification still runs separately; see external citation checks and verifier provenance for existence, DOI, URL, and resolver evidence. Failure: CliRunner timed out after 360s for role citation Deterministic citation verifier checked 53 bibliography entries."
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.65,
  "questions": [
    "Which theorems are original to this paper, and which are restatements or mild generalisations of Curiel:2015, Dewar.Read:2020, or March:2025? Can the introduction explicitly tabulate the new contributions and distinguish them from prior results?",
    "What precise definition of Galilei conformal structure is adopted, and how does it relate to the alternatives studied in Duval-Horvathy:2011 and Duval et al.:2014b? Is the same definitional choice made for the Carroll case, and if so, what justifies it as the canonical analogue for a Weyl-type argument?",
    "Do the sections of the paper contain complete, self-contained proofs of the Galilei and Carroll Weyl-type theorems, or are proofs deferred to a companion paper? If proofs are present, what caused the review pipeline to extract an empty sections array?",
    "Would the authors consider providing machine-checkable proof files in Lean 4 or Coq for the headline uniqueness theorems in a public repository, given that the math-ph community increasingly expects formal verification for foundational geometric results?",
    "The citation specialist timed out and left no verifiable evidence regarding reference existence or DOI resolution; are there unusual citation formats or very recent preprints without stable DOIs in the bibliography that may have caused this failure?"
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "review_input.json contains an empty 'sections' array and an empty 'figures' array. Only the abstract, bibliography, and metadata are available. No theorem statements, no definitions of Galilei/Carroll conformal structure as used in this paper, no projective-structure compatibility conditions, no proofs, and no equations have been provided to the reviewer. As a consequence, no claim beyond the abstract-level summary can be independently checked, and the headline analogues-of-Weyl claims (C3, C4, C7) cannot be technically verified.",
      "id": "weakness-1",
      "locator": "Sections (entire body of paper, not provided)",
      "required_update": "Re-extract the paper so that sections (definitions, lemmas, theorems, proofs) are populated in review_input.json. For math-ph load-bearing theorems, additionally ship the formal proofs in a proof assistant (Lean 4 / Coq / Agda / Isabelle) at a repository location such as proofs/GalileiCarrollWeyl/ so that the central uniqueness claims become machine-verifiable rather than reviewer-attested.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Sections (entire body of paper, not provided)` is corrected or justified.",
      "weakness_index": 0
    },
    {
      "evidence": "review_input.json contains an empty 'sections' array and an empty 'figures' array. Only the abstract, bibliography, and metadata are available. No theorem statements, no definitions of Galilei/Carroll conformal structure as used in this paper, no projective-structure compatibility conditions, no proofs, and no equations have been provided to the reviewer. As a consequence, no claim beyond the abstract-level summary can be independently checked, and the headline analogues-of-Weyl claims (C3, C4, C7) cannot be technically verified.",
      "id": "weakness-2",
      "locator": "Sections (entire body of paper, not provided)",
      "required_update": "Re-extract the paper so that sections (definitions, lemmas, theorems, proofs) are populated in review_input.json. For math-ph load-bearing theorems, additionally ship the formal proofs in a proof assistant (Lean 4 / Coq / Agda / Isabelle) at a repository location such as proofs/GalileiCarrollWeyl/ so that the central uniqueness claims become machine-verifiable rather than reviewer-attested.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Sections (entire body of paper, not provided)` is corrected or justified.",
      "weakness_index": 1
    },
    {
      "evidence": "The verb 'discuss' is ambiguous between proving and surveying. Existing Newton-Cartan Weyl-type theorems are already in the literature (Curiel:2015 [17], Dewar.Read:2020 [18], March:2025 [44]), and one co-author has a recent 'note on Newton-Cartan Weyl-type theorems' ([44]) and another wrote on Galilean/Carrollian affine connections ([50]). With the section text absent from review_input.json, it cannot be determined what is novel here versus a synthesis. As a math-ph paper in a code-amenable field with no executable artifact, the novelty/load-bearing portion cannot be verified by code either.",
      "id": "weakness-3",
      "locator": "Abstract (overall framing 'We discuss analogous results...')",
      "required_update": "Clearly delineate in the introduction which theorems are original to this paper and which are restatements of Curiel:2015, Dewar.Read:2020, March:2025, or Vigneron.Barzegar.Read:2025. Where possible, supply a formal proof artifact (Lean/Coq under e.g. src/proofs/CarrollWeyl.lean) for the new theorems, since the field is amenable to such verification.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Abstract (overall framing 'We discuss analogous results...')` is corrected or justified.",
      "weakness_index": 2
    },
    {
      "evidence": "Conformal Galilei and conformal Carroll structures have been defined in the literature (Duval.Horvathy:2011 [26], Duval.EtAl:2014b [25]). However, the abstract concedes by the word 'suitably' that the definition adopted in this paper is a choice, and the review materials do not include the section in which that choice is fixed or justified. Without the definition, the load-bearing object of the theorem is ambiguous.",
      "id": "weakness-4",
      "locator": "Abstract, sentence 3 (qualifier 'suitably defined')",
      "required_update": "In the body, give an explicit definition of the Galilei (resp. Carroll) conformal structure being used, compare to the alternatives in Duval.Horvathy:2011 / Duval.EtAl:2014b / Ciambelli.EtAl:2019, and motivate why this is the 'correct' analogue of pseudo-Riemannian conformal structure for a Weyl-type theorem.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Abstract, sentence 3 (qualifier 'suitably defined')` is corrected or justified.",
      "weakness_index": 3
    },
    {
      "evidence": "No code repository, release, license, or machine-checkable artifact is provided for reproducing the paper's Weyl-type theorem derivations.",
      "id": "weakness-5",
      "locator": "code release and execution entrypoints",
      "required_update": "Release the source code, scripts, model configuration, and execution entrypoints needed to regenerate the reported tables, or document why those artifacts cannot be released.",
      "source_path": null,
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "code",
      "verification_check": "Re-review should confirm runnable code or a documented non-release justification is present.",
      "weakness_index": 4
    }
  ],
  "strengths": [
    "The paper addresses a clearly motivated and underexplored gap: while Weyl's theorem has been extended to Newtonian and Newton-Cartan geometry individually (Curiel:2015, March:2025), no prior work provides a unified and systematic treatment covering both Galilei and Carroll geometry simultaneously.",
    "The novelty specialist (confidence 0.9, score 0.75) finds the contribution significant, with well-identified prior art that the paper builds on and extends rather than duplicates.",
    "Abstract-level attribution is accurate: the founding theorem is correctly credited to Weyl:1921, the physical motivation to EPS:1972, and the limiting-case picture to the dual c-to-infinity and c-to-zero contractions established in Duval et al.:2014.",
    "The paper situates itself within a coherent and active research area, directly building on the unified connection framework of Vigneron.Barzegar.Read:2025, giving readers a clear entry point into the technical setting."
  ],
  "summary": "The five specialist outputs describe a paper that extends Weyl's classical uniqueness theorem — previously established for pseudo-Riemannian manifolds — to both Galilei (non-relativistic) and Carroll (ultra-relativistic) geometry. The novelty specialist rates the contribution as significant (score 0.75, confidence 0.9), identifying clear predecessor work that the paper explicitly generalises. However, two structural problems dominate the review. First, the pipeline received only the abstract and bibliography: the entire paper body, including theorem statements, definitions of Galilei and Carroll conformal and projective structures, lemmas, and proofs, is absent from the review artifact (technical_correctness C8, severity critical). This limits all correctness assessment to abstract-level plausibility checks, holding the technical-correctness specialist's confidence to 0.35. Second, reproducibility flagged the absence of any machine-checkable proof artifact for the headline Galilei and Carroll Weyl-type theorems at critical severity; no code or data repository of any kind is provided (reproducibility_score 0.12). The citation specialist timed out and produced no usable output; no external verifier data on citation existence or DOI resolution is available from this run. The technical-correctness specialist separately flagged at major severity that the abstract's phrasing — 'We discuss analogous results' — does not distinguish new proofs from survey or synthesis of Curiel:2015, Dewar.Read:2020, and March:2025. Per the recommendation gate, the combination of critical reproducibility findings and major or critical technical-correctness findings in a math-amenable field (math-ph / gr-qc) defaults the recommendation to major_revision.",
  "weaknesses": [
    "The entire paper body — theorem statements, definitions of Galilei and Carroll conformal and projective structures, lemmas, and proofs — is absent from the review artifact (sections[] is empty), making independent technical verification of the headline uniqueness claims impossible (technical_correctness C8, severity critical).",
    "No machine-checkable proof artifact is provided for either the Galilei or Carroll Weyl-type theorem in a proof assistant such as Lean 4, Coq, Agda, or Isabelle, leaving the load-bearing uniqueness claims unverifiable by automated means in a math-amenable field; reproducibility flagged both gaps at critical severity, with suggested locators proofs/galilei_weyl_type_theorem.lean and proofs/carroll_weyl_type_theorem.lean.",
    "The abstract's phrasing 'We discuss analogous results' does not distinguish original theorems from restatements of Curiel:2015, Dewar.Read:2020, or March:2025, all of which establish Newton-Cartan or Galilean Weyl-type results; without the body, the paper's independent contribution cannot be assessed (technical_correctness C7, severity major).",
    "The definition of 'suitably defined conformal structure' for Galilei and Carroll spacetimes — the central object of both theorems — is not fixed or justified in any available material, leaving the theorem hypotheses ambiguous and the choice of conformal structure unmotivated relative to alternatives in Duval-Horvathy:2011 and Duval et al.:2014b (technical_correctness C6, C3, C4, severity minor to major).",
    "No code or data repository of any kind is provided and code availability is unspecified; the reproducibility specialist assigned a score of 0.12."
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
      "delta": "Establishes the foundational theorem for pseudo-Riemannian manifolds; the current work generalizes this to the degenerate metric cases of Galilean and Carrollian geometry.",
      "relation": "prior_art",
      "title": "Zur Infinitesimalgeometrie: Einordnung der projektiven und der konformen Auffassung"
    },
    {
      "citation_key": "EPS:1972",
      "delta": "Provides the physical and geometric motivation for determining the metric via projective and conformal structures in the Lorentzian case; this paper performs the analogous derivation for the non-relativistic and ultra-relativistic limits.",
      "relation": "prior_art",
      "title": "The geometry of free fall and light propagation"
    },
    {
      "citation_key": "Curiel:2015",
      "delta": "Previously extended the theorem to the specific context of Newtonian gravity; the current work provides a more general and systematic treatment covering both Galilean and Carrollian structures.",
      "relation": "prior_art",
      "title": "A Weyl-Type Theorem for Geometrized Newtonian Gravity"
    },
    {
      "citation_key": "March:2025",
      "delta": "Recent work focusing on the Newton-Cartan case; the current paper expands upon these insights to include a comprehensive analysis of Carrollian geometry.",
      "relation": "builds_on",
      "title": "A note on Newton-Cartan Weyl-type theorems"
    },
    {
      "citation_key": "Vigneron.Barzegar.Read:2025",
      "delta": "Provides the unified geometric framework for connections in these limits which the authors utilize here to state and prove their results.",
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
      "description": "No code repository, release, license, or machine-checkable artifact is provided for reproducing the paper's Weyl-type theorem derivations.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "The Galilei Weyl-type theorem is a load-bearing theoretical claim, but the provided artifacts include no formal proof artifact; a proof file such as proofs/galilei_weyl_type_theorem.lean would close this gap.",
      "severity": "critical"
    },
    {
      "area": "other",
      "description": "The Carroll Weyl-type theorem is a load-bearing theoretical claim, but the provided artifacts include no formal proof artifact; a proof file such as proofs/carroll_weyl_type_theorem.lean would close this gap.",
      "severity": "critical"
    },
    {
      "area": "other",
      "description": "The review input contains only abstract, bibliography, and metadata with no paper sections, derivations, theorem statements, or proof appendices, limiting independent verification from the provided artifact.",
      "severity": "major"
    }
  ],
  "confidence": 0.82,
  "data_availability": "unspecified",
  "data_url": null,
  "environment": null,
  "reproducibility_score": 0.12
}
```

### summary (`claude-haiku-4-5-20251001`) — status: `pass`

```json
{
  "audience": "Mathematicians and physicists interested in differential geometry, mathematical relativity, and the foundations of classical and relativistic physics",
  "key_contributions": [
    "Extends Weyl's uniqueness theorem to Galilei (non-relativistic) geometry",
    "Extends Weyl's uniqueness theorem to Carroll (ultra-relativistic) geometry",
    "Defines conformal and projective structures for non-relativistic spacetime geometries",
    "Proves that torsion-free connections compatible with conformal structures are uniquely determined by projective structure in Galilei and Carroll settings"
  ],
  "plain_language_summary": "In modern physics, spacetime geometry is often described using mathematical structures called metrics. A classical theorem by Hermann Weyl showed that a particular type of metric can be uniquely reconstructed if you know two pieces of information: its conformal structure (which angles are preserved) and its projective structure (which paths are straightest lines). This is a powerful result because it says that these two pieces of geometric information completely determine the metric.\n\nThis paper extends Weyl's famous theorem to two important limiting cases of Einstein's relativity. The first is the non-relativistic limit, called Galilei geometry, which describes the geometry of spacetime when objects move much slower than light—essentially the geometry underlying Newtonian mechanics. The second is the ultra-relativistic limit, called Carroll geometry, which applies when everything moves at or near the speed of light. In both cases, the authors define what \"conformal\" and \"projective\" structures mean and show that Weyl-type uniqueness results still hold.\n\nThe significance of these results lies in showing that the deep geometric principles governing relativistic spacetime extend naturally to its limiting cases. This unifies our understanding of how geometric structures relate to physics across different velocity regimes and provides a geometric foundation for non-relativistic and ultra-relativistic physics analogous to what relativity provides for ordinary speeds.",
  "tldr": "A classical theorem about spacetime geometry is proven to hold in both the non-relativistic (Newtonian) and ultra-relativistic (speed-of-light) limits of Einstein's relativity."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `warn`

```json
{
  "claims": [
    {
      "assessment": "supported",
      "claim": "Weyl's classical theorem: a Weyl metric (a natural generalisation of a pseudo-Riemannian metric) is uniquely determined by its conformal structure together with its projective structure (set of unparametrised geodesics).",
      "evidence": "This is the well-known Weyl (1921) result on the interplay between conformal and projective structures in pseudo-Riemannian geometry, and is standard textbook material. The paper attributes it correctly to Weyl:1921 in the bibliography (entry [51]).",
      "id": "C1",
      "location": "Abstract, sentence 1; attributed to Weyl:1921",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Equivalent formulation: a torsion-free linear connection compatible with a pseudo-Riemannian conformal structure is uniquely determined by its projective structure.",
      "evidence": "This restatement is the standard reformulation found in the projective/conformal-geometry literature (cf. Ehlers-Pirani-Schild and subsequent work cited as EPS:1972/2012, Ewen.Schmidt:1989, Malament:2012). The equivalence with C1 is folklore in this community.",
      "id": "C2",
      "location": "Abstract, sentence 2",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "There exist analogous Weyl-type uniqueness results for suitably defined notions of conformal structure on Galilei geometry (non-relativistic limit).",
      "evidence": "The abstract asserts the existence of analogues for Galilei geometry but the supplied review_input.json contains no section body, no statement of the theorem, no definition of 'suitably defined conformal structure' for Galilei spacetimes, and no proof. Curiel:2015 (entry [17]) and March:2025 (entry [44]) in the bibliography give prior Newton-Cartan Weyl-type theorems, so the claim is plausible and consistent with the surrounding literature, but it cannot be verified from the materials provided.",
      "id": "C3",
      "location": "Abstract, sentence 3",
      "severity": "major",
      "suggested_fix": "Include the precise statement of the Galilei Weyl-type theorem (hypotheses, definition of Galilei conformal structure, projective structure on a Galilei manifold) and a full proof. For a math-ph paper in a code-amenable field, supplying a machine-checked formalisation (e.g. Lean/Coq under src/proofs/GalileiWeyl.lean) would convert this from 'plausible' to 'verified'."
    },
    {
      "assessment": "partially_supported",
      "claim": "There exist analogous Weyl-type uniqueness results for suitably defined notions of conformal structure on Carroll geometry (ultra-relativistic limit).",
      "evidence": "As with C3, no section text, definition, or proof for the Carroll case is included in review_input.json (sections array is empty). The Carroll conformal structure has been studied in Duval.EtAl:2014b ([25]), Ciambelli.EtAl:2019 ([16]), Herfray:2022 ([38]), and a primer in March.Read:2025 ([42]), so the claim is plausible, but its truth and precise form cannot be assessed from the abstract alone.",
      "id": "C4",
      "location": "Abstract, sentence 3",
      "severity": "major",
      "suggested_fix": "State the Carroll Weyl-type theorem precisely (specifying the Carrollian conformal class, the admissible projective data, and the equivalence class of connections that are uniquely identified) and supply the proof. A formalisation in a proof assistant would strengthen verifiability."
    },
    {
      "assessment": "supported",
      "claim": "Galilei and Carroll geometries arise as the 'non-relativistic' and 'ultra-relativistic' limits of Lorentzian geometry, respectively.",
      "evidence": "This is the standard contraction picture going back at least to Duval.EtAl:2014 (entry [24], 'Carroll versus Newton and Galilei') and to Bergshoeff.EtAl:2017 ([8]). The dual c->infinity / c->0 limits are widely accepted in the literature cited.",
      "id": "C5",
      "location": "Abstract, parenthetical at end of sentence 3",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Implicit claim that 'suitably defined notions of conformal structure' for Galilei and Carroll geometries exist and are the right objects to which to apply a Weyl-type uniqueness theorem.",
      "evidence": "Conformal Galilei and conformal Carroll structures have been defined in the literature (Duval.Horvathy:2011 [26], Duval.EtAl:2014b [25]). However, the abstract concedes by the word 'suitably' that the definition adopted in this paper is a choice, and the review materials do not include the section in which that choice is fixed or justified. Without the definition, the load-bearing object of the theorem is ambiguous.",
      "id": "C6",
      "location": "Abstract, sentence 3 (qualifier 'suitably defined')",
      "severity": "minor",
      "suggested_fix": "In the body, give an explicit definition of the Galilei (resp. Carroll) conformal structure being used, compare to the alternatives in Duval.Horvathy:2011 / Duval.EtAl:2014b / Ciambelli.EtAl:2019, and motivate why this is the 'correct' analogue of pseudo-Riemannian conformal structure for a Weyl-type theorem."
    },
    {
      "assessment": "unsupported",
      "claim": "The paper proves new results (as opposed to merely surveying existing Galilei/Carroll Weyl-type theorems).",
      "evidence": "The verb 'discuss' is ambiguous between proving and surveying. Existing Newton-Cartan Weyl-type theorems are already in the literature (Curiel:2015 [17], Dewar.Read:2020 [18], March:2025 [44]), and one co-author has a recent 'note on Newton-Cartan Weyl-type theorems' ([44]) and another wrote on Galilean/Carrollian affine connections ([50]). With the section text absent from review_input.json, it cannot be determined what is novel here versus a synthesis. As a math-ph paper in a code-amenable field with no executable artifact, the novelty/load-bearing portion cannot be verified by code either.",
      "id": "C7",
      "location": "Abstract (overall framing 'We discuss analogous results...')",
      "severity": "major",
      "suggested_fix": "Clearly delineate in the introduction which theorems are original to this paper and which are restatements of Curiel:2015, Dewar.Read:2020, March:2025, or Vigneron.Barzegar.Read:2025. Where possible, supply a formal proof artifact (Lean/Coq under e.g. src/proofs/CarrollWeyl.lean) for the new theorems, since the field is amenable to such verification."
    },
    {
      "assessment": "unsupported",
      "claim": "All technical content of the paper (theorem statements, definitions, derivations, lemmas).",
      "evidence": "review_input.json contains an empty 'sections' array and an empty 'figures' array. Only the abstract, bibliography, and metadata are available. No theorem statements, no definitions of Galilei/Carroll conformal structure as used in this paper, no projective-structure compatibility conditions, no proofs, and no equations have been provided to the reviewer. As a consequence, no claim beyond the abstract-level summary can be independently checked, and the headline analogues-of-Weyl claims (C3, C4, C7) cannot be technically verified.",
      "id": "C8",
      "location": "Sections (entire body of paper, not provided)",
      "severity": "critical",
      "suggested_fix": "Re-extract the paper so that sections (definitions, lemmas, theorems, proofs) are populated in review_input.json. For math-ph load-bearing theorems, additionally ship the formal proofs in a proof assistant (Lean 4 / Coq / Agda / Isabelle) at a repository location such as proofs/GalileiCarrollWeyl/ so that the central uniqueness claims become machine-verifiable rather than reviewer-attested."
    }
  ],
  "confidence": 0.35,
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

