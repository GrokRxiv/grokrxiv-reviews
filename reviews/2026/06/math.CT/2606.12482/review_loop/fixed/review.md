# Categorical Hopf map

GrokRxiv review of [arXiv:2606.12482](https://arxiv.org/abs/2606.12482) · `math.CT`

_Authors_: Ali Khalili Samani

## TL;DR

Automated meta-review synthesis failed before producing a normal recommendation.

_Recommendation_: **Major revision** · _Confidence_: 100%

## Strengths


## Weaknesses

- Meta-reviewer failed: `claude` exited with Some(1) for role meta_reviewer: stdout={"type":"result","subtype":"success","is_error":true,"api_error_status":500,"duration_ms":29067,"duration_api_ms":0,"num_turns":1,"result":"API Error: 500 Internal server error. This is a server-side issue, usually temporary — try again in a moment. If it persists, check https://status.claude.com.","stop_reason":"stop_sequence","session_id":"088d5be8-c2fa-4556-9f4b-a4e4053e1af6","total_cost_usd":0,"usage":{"input_tokens":0,"cache_creation_input_tokens":0,"cache_read_input_tokens":0,"output_tokens":0,"server_tool_use":{"web_search_requests":0,"web_fetch_requests":0},"service_tier":"standard","c

## Revision Targets

- [ ] **Manuscript: Rerun automated review after the configured CLI/model provider recovers.**
  - Location: `corrections/2606.12482/paper.tex`
  - Evidence: Failure: `claude` exited with Some(1) for role technical_correctness: stdout={"type":"result","subtype":"success","is_error":true,"api_error_status":500,"duration_ms":43409,"duration_api_ms":16119,"num_turns":4,"result":"API Error: 500 Internal serv...
  - Required change: Rerun automated review after the configured CLI/model provider recovers.
  - Verification: Re-review should confirm the affected claim is corrected or justified.

## Open Questions

- Please inspect the specialist outputs and rerun automated review after the CLI provider recovers.

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
          "Wockel, Christoph"
        ],
        "doi": null,
        "key": "MR2805195",
        "raw": "MR2805195: AUTHOR = Wockel, Christoph, TITLE = Principal 2-bundles and their gauge 2-groups, JOURNAL = Forum Mathematicum, VOLUME = 23, YEAR = 2011, NUMBER = 3, PAGES = 565--610, ISSN = 0933-7741,1435-5337, MRCLASS = 55R65 (18D05 22A22), MRNUMBER = 2805195,",
        "title": "Principal 2-bundles and their gauge 2-groups",
        "url": null,
        "venue": "Forum Mathematicum",
        "year": 2011
      },
      "exists": null,
      "explanation": "This is a foundational reference for the formalism of principal 2-bundles (categorical principal bundles) used extensively throughout the paper to construct the categorical Hopf map.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Ganter, Nora"
        ],
        "doi": null,
        "key": "MR3764535",
        "raw": "MR3764535: AUTHOR = Ganter, Nora, TITLE = Categorical tori, JOURNAL = SIGMA Symmetry Integrability Geom. Methods Appl., FJOURNAL = SIGMA. Symmetry, Integrability and Geometry. Methods and Applications, VOLUME = 14, YEAR = 2018, PAGES = Paper No. 014, 18, ISSN = 1815-0659, MRCLASS = 22E40 (18D99), MRNUMBER = 3764535,",
        "title": "Categorical tori",
        "url": null,
        "venue": "SIGMA Symmetry Integrability Geom. Methods Appl.",
        "year": 2018
      },
      "exists": null,
      "explanation": "Defines the categorical circle U(1), which serves as the fiber for the categorical Hopf map introduced in the paper.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Hopf, Heinz"
        ],
        "doi": null,
        "key": "MR1512691",
        "raw": "MR1512691: AUTHOR = Hopf, Heinz, TITLE = \\\"Uber die Abbildungen der dreidimensionalen Sph\\\"are auf die Kugelfl\\\"ache, JOURNAL = Math. Ann., FJOURNAL = Mathematische Annalen, VOLUME = 104, YEAR = 1931, NUMBER = 1, PAGES = 637--665, ISSN = 0025-5831,1432-1807, MRCLASS = 99-04, MRNUMBER = 1512691,",
        "title": "\\\"Uber die Abbildungen der dreidimensionalen Sph\\\"are auf die Kugelfl\\\"ache",
        "url": null,
        "venue": "Math. Ann.",
        "year": 1931
      },
      "exists": null,
      "explanation": "The original paper introducing the Hopf map, which the author categorifies.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Murray, Michael K."
        ],
        "doi": "10.1112/jlms/54.2.403",
        "key": "MR1669206",
        "raw": "MR1669206: AUTHOR = Murray, Michael K., TITLE = Bundle gerbes, JOURNAL = J. London Math. Soc. (2), VOLUME = 54, YEAR = 1996, NUMBER = 2, PAGES = 403--416, DOI = 10.1112/jlms/54.2.403, URL = https://doi.org/10.1112/jlms/54.2.403",
        "title": "Bundle gerbes",
        "url": "https://doi.org/10.1112/jlms/54.2.403",
        "venue": "J. London Math. Soc. (2)",
        "year": 1996
      },
      "exists": null,
      "explanation": "Introduces bundle gerbes, which are essential for the paper's discussion on higher categorical structures and the factorization of the categorical Hopf map.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": "10.1112/jlms/54.2.403",
      "resolved_url": "https://doi.org/10.1112/jlms/54.2.403"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Stolz, Stephan"
        ],
        "doi": null,
        "key": "MR1380455",
        "raw": "MR1380455: AUTHOR = Stolz, Stephan, TITLE = A conjecture concerning positive Ricci curvature and the Witten genus, JOURNAL = Mathematische Annalen, VOLUME = 304, YEAR = 1996, NUMBER = 4, PAGES = 785--800, ISSN = 0025-5831,1432-1807, MRCLASS = 58G10 (53C21 57R20 57R65), MRNUMBER = 1380455,",
        "title": "A conjecture concerning positive Ricci curvature and the Witten genus",
        "url": null,
        "venue": "Mathematische Annalen",
        "year": 1996
      },
      "exists": null,
      "explanation": "Introduces the String group, which is central to the author's final conjecture regarding symmetries of the categorical Hopf map.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Schommer-Pries, Christopher J."
        ],
        "doi": null,
        "key": "MR2800361",
        "raw": "MR2800361: AUTHOR = Schommer-Pries, Christopher J., TITLE = Central extensions of smooth 2-groups and a finite-dimensional string 2-group, JOURNAL = Geom. Topol., FJOURNAL = Geometry \\& Topology, VOLUME = 15, YEAR = 2011, NUMBER = 2, PAGES = 609--676, ISSN = 1465-3060,1364-0380, MRCLASS = 53C08 (18D10 22A22 57T10), MRNUMBER = 2800361,",
        "title": "Central extensions of smooth 2-groups and a finite-dimensional string 2-group",
        "url": null,
        "venue": "Geom. Topol.",
        "year": 2011
      },
      "exists": null,
      "explanation": "Provides a finite-dimensional categorical model for the String group, used in the classification of the categorical Hopf map's fiber and for cohomology calculations.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Nikolaus, Thomas",
          "Waldorf, Konrad"
        ],
        "doi": null,
        "key": "MR3089401",
        "raw": "MR3089401: AUTHOR = Nikolaus, Thomas and Waldorf, Konrad, TITLE = Four equivalent versions of nonabelian gerbes, JOURNAL = Pacific Journal of Mathematics, VOLUME = 264, YEAR = 2013, NUMBER = 2, PAGES = 355--419, ISSN = 0030-8730,1945-5844, MRCLASS = 55R65 (53C08 55N05 58H05), MRNUMBER = 3089401,",
        "title": "Four equivalent versions of nonabelian gerbes",
        "url": null,
        "venue": "Pacific Journal of Mathematics",
        "year": 2013
      },
      "exists": null,
      "explanation": "Used as a comparative framework for Waldorf's approach to gerbes and principal 2-bundles versus Wockel's.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Waldorf, Konrad"
        ],
        "doi": null,
        "key": "MR3894086",
        "raw": "MR3894086: AUTHOR = Waldorf, Konrad, TITLE = A global perspective to connections on principal 2-bundles, JOURNAL = Forum Math., FJOURNAL = Forum Mathematicum, VOLUME = 30, YEAR = 2018, NUMBER = 4, PAGES = 809--843, ISSN = 0933-7741,1435-5337, MRCLASS = 53C08 (22A22 55R65), MRNUMBER = 3894086,",
        "title": "A global perspective to connections on principal 2-bundles",
        "url": null,
        "venue": "Forum Math.",
        "year": 2018
      },
      "exists": null,
      "explanation": "A key reference for the connection formalism on principal 2-bundles, specifically used in the context of the categorical Hopf map's connection.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Pressley, Andrew",
          "Segal, Graeme"
        ],
        "doi": null,
        "key": "MR900587",
        "raw": "MR900587: AUTHOR = Pressley, Andrew and Segal, Graeme, TITLE = Loop groups, SERIES = Oxford Mathematical Monographs, NOTE = Oxford Science Publications, PUBLISHER = The Clarendon Press, Oxford University Press, New York, YEAR = 1986, PAGES = viii+318, ISBN = 0-19-853535-X, MRCLASS = 22E65 (58D15 81D15), MRNUMBER = 900587,",
        "title": "Loop groups",
        "url": null,
        "venue": "Oxford Mathematical Monographs",
        "year": 1986
      },
      "exists": null,
      "explanation": "Used for background on central extensions and loop groups, specifically in relating these to the String group symmetries.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    }
  ],
  "missing_references": [
    {
      "reason": "The paper relies heavily on Wockel's 2011 paper but misses some of the earlier development in categorical bundles on groupoids which would ground the Čech groupoid constructions better.",
      "title": "Principal 2-bundles onto a 2-groupoid"
    }
  ],
  "summary": "The thesis exhibits excellent citation hygiene, drawing correctly on foundational works by Murray, Brylinski, and Wockel. Key modern developments by Waldorf and Ganter are well-integrated into the construction of the categorical Hopf map. The bibliography is comprehensive and accurately reflects the intersection of higher category theory and differential geometry required for this research."
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 1.0,
  "questions": [
    "Please inspect the specialist outputs and rerun automated review after the CLI provider recovers."
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "Failure: `claude` exited with Some(1) for role technical_correctness: stdout={\"type\":\"result\",\"subtype\":\"success\",\"is_error\":true,\"api_error_status\":500,\"duration_ms\":43409,\"duration_api_ms\":16119,\"num_turns\":4,\"result\":\"API Error: 500 Internal serv...",
      "id": "weakness-1",
      "locator": null,
      "required_update": "Rerun automated review after the configured CLI/model provider recovers.",
      "source_path": "corrections/2606.12482/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm the affected claim is corrected or justified.",
      "weakness_index": 0
    }
  ],
  "strengths": [],
  "summary": "Automated meta-review synthesis failed before producing a normal recommendation.",
  "weaknesses": [
    "Meta-reviewer failed: `claude` exited with Some(1) for role meta_reviewer: stdout={\"type\":\"result\",\"subtype\":\"success\",\"is_error\":true,\"api_error_status\":500,\"duration_ms\":29067,\"duration_api_ms\":0,\"num_turns\":1,\"result\":\"API Error: 500 Internal server error. This is a server-side issue, usually temporary — try again in a moment. If it persists, check https://status.claude.com.\",\"stop_reason\":\"stop_sequence\",\"session_id\":\"088d5be8-c2fa-4556-9f4b-a4e4053e1af6\",\"total_cost_usd\":0,\"usage\":{\"input_tokens\":0,\"cache_creation_input_tokens\":0,\"cache_read_input_tokens\":0,\"output_tokens\":0,\"server_tool_use\":{\"web_search_requests\":0,\"web_fetch_requests\":0},\"service_tier\":\"standard\",\"c"
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
      "citation_key": "MR2709030",
      "delta": "Provides the 2-categorical framework for principal 2-bundles; this paper applies and specializes this theory to construct the specific 'categorical Hopf map' object.",
      "relation": "builds_on",
      "title": "Higher gauge theory: 2-bundles"
    },
    {
      "citation_key": "MR3764535",
      "delta": "Introduces the categorical circle U(1); this paper uses it as the fibre in the categorification of the Hopf bundle.",
      "relation": "builds_on",
      "title": "Categorical tori"
    },
    {
      "citation_key": "MR2805195",
      "delta": "Establishes the formalism for constructing total spaces of principal 2-bundles from cocycle data, which the author implements for the six-open cover of S^2.",
      "relation": "builds_on",
      "title": "Principal 2-bundles and their gauge 2-groups"
    },
    {
      "citation_key": "MR1512691",
      "delta": "The classical Hopf map being categorified; the paper proves a factorization theorem relating the categorical version to this classical precedent.",
      "relation": "prior_art",
      "title": "Über die Abbildungen der dreidimensionalen Sphäre auf die Kugelfläche"
    },
    {
      "citation_key": "MR2800361",
      "delta": "Develops a finite-dimensional model for the String(n) group; this paper conjectures an alternative, more explicit realization of String(3) as the symmetry group of the categorical Hopf map.",
      "relation": "prior_art",
      "title": "Central extensions of smooth 2-groups and a finite-dimensional string 2-group"
    },
    {
      "citation_key": "MR1669206",
      "delta": "Introduces bundle gerbes; this paper demonstrates how the categorical Hopf map relates to the basic bundle gerbe over S^3 through factorization.",
      "relation": "prior_art",
      "title": "Bundle gerbes"
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
      "description": "No repository, license, commit, release, or executable proof/checking artifact is provided for the central construction of the categorical Hopf map; a formal artifact such as proofs/categorical_hopf_map.lean, proofs/categorical_hopf_map.agda, or equivalent source files would be needed for independent machine-checked reproduction.",
      "severity": "critical"
    },
    {
      "area": "code",
      "description": "The factorisation through the classical Hopf map and the basic bundle gerbe over S^3 is presented textually, but no formal proof artifact or reproducible symbolic notebook accompanies the construction; an artifact such as proofs/hopf_factorization.lean or notebooks/hopf_factorization.ipynb would close this gap.",
      "severity": "major"
    },
    {
      "area": "code",
      "description": "The appendix contains explicit differential-form calculations, but the algebra is not backed by a reproducible computer algebra script; a file such as scripts/verify_hopf_pullback.sage or scripts/verify_hopf_pullback.sympy would allow independent checking of the computations.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "The String(3) symmetry interpretation is explicitly conjectural and relies on future assembly of anafunctors via parallel 2-transport, so the headline symmetry claim is not fully reproducible from completed proofs or artifacts in the submitted material.",
      "severity": "major"
    },
    {
      "area": "data",
      "description": "There is no empirical dataset, benchmark, or generated data package; this is mostly appropriate for a mathematical theory paper, but it means reproduction is limited to manual or formal verification of the written constructions.",
      "severity": "info"
    },
    {
      "area": "compute",
      "description": "No software environment, proof-assistant version, dependency list, or hardware requirements are specified because no computational artifact is supplied.",
      "severity": "minor"
    }
  ],
  "confidence": 0.86,
  "data_availability": "unspecified",
  "data_url": null,
  "environment": null,
  "reproducibility_score": 0.32
}
```

### summary (`claude-haiku-4-5-20251001`) — status: `pass`

```json
{
  "audience": "Researchers in higher category theory, categorical geometry, and higher gauge theory; mathematicians and physicists investigating categorical generalizations of classical topology and higher structures in quantum field theory.",
  "key_contributions": [
    "Construction of the categorical Hopf map as a categorical principal U(1)-bundle over the 2-sphere with detailed local trivializations",
    "Development of techniques for categorifying the transition functions of classical principal bundles using groupoid homomorphisms",
    "Three explicitly worked equivalent constructions of the basic bundle gerbe over the 3-sphere",
    "Factorization of the categorical Hopf map through the classical Hopf map and the basic bundle gerbe over S³",
    "Conjecture that the categorical group String(3) is equivalent to the categorical group of symmetries of the categorical Hopf map",
    "Unified treatment connecting Waldorf's and Wockel's frameworks for constructing principal 2-bundles"
  ],
  "plain_language_summary": "The Hopf map is a celebrated construction in topology that shows how to map a 3-sphere continuously to a 2-sphere in a non-trivial way, forming a principal bundle with circle symmetry. This thesis extends this classical object into categorical geometry—a higher-dimensional algebraic setting where geometric structures are enriched with categorical data. The author constructs a categorical Hopf map, which is a principal bundle over the 2-sphere whose symmetry group is a categorical circle rather than an ordinary one, and develops techniques to lift classical transition functions into the categorical setting.\n\nA significant contribution is presenting three equivalent constructions of the basic bundle gerbe over the 3-sphere, providing multiple perspectives on this important structure. The work bridges two major frameworks in higher bundle theory (Waldorf's and Wockel's formalisms), showing how to move between them while preserving the essential geometry. The central conjecture—that String(3), an infinite-dimensional topological group crucial in physics and representation theory, can be realized as the group of all symmetries of the categorical Hopf map—offers a promising new way to understand this fundamental structure.",
  "tldr": "The author constructs a categorical lift of the classical Hopf map and conjectures it characterizes String(3), a fundamental higher structure in categorical representation theory and quantum topology."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `fail`

```json
{
  "claims": [
    {
      "assessment": "partially_supported",
      "claim": "Technical correctness reviewer failed before producing a normal review.",
      "evidence": "Failure: `claude` exited with Some(1) for role technical_correctness: stdout={\"type\":\"result\",\"subtype\":\"success\",\"is_error\":true,\"api_error_status\":500,\"duration_ms\":43409,\"duration_api_ms\":16119,\"num_turns\":4,\"result\":\"API Error: 500 Internal serv...",
      "id": "technical_correctness_agent_failure",
      "location": null,
      "severity": "major",
      "suggested_fix": "Rerun automated review after the configured CLI/model provider recovers."
    }
  ],
  "confidence": 0.0,
  "overall_correctness": "questionable"
}
```

## Corrections

<!-- corrections-section: rendered from corrections table; empty on first publish -->
_No corrections have been recorded._

## Bibliography

1. MR2805195: AUTHOR = Wockel, Christoph, TITLE = Principal 2-bundles and their gauge 2-groups, JOURNAL = Forum Mathematicum, VOLUME = 23, YEAR = 2011, NUMBER = 3, PAGES = 565--610, ISSN = 0933-7741,1435-5337, MRCLASS = 55R65 (18D05 22A22), MRNUMBER = 2805195,
2. MR1950948: AUTHOR = Moerdijk, Ieke, TITLE = Orbifolds as groupoids: an introduction, BOOKTITLE = Orbifolds in mathematics and physics, SERIES = Contemporary Mathematics, VOLUME = 310, PAGES = 205--222, PUBLISHER = American Mathematical Society, YEAR = 2002, ISBN = 0-8218-2990-4, MRCLASS = 22A22 (55N30 55P15 58H05), MRNUMBER = 1950948,
3. MR3764535: AUTHOR = Ganter, Nora, TITLE = Categorical tori, JOURNAL = SIGMA Symmetry Integrability Geom. Methods Appl., FJOURNAL = SIGMA. Symmetry, Integrability and Geometry. Methods and Applications, VOLUME = 14, YEAR = 2018, PAGES = Paper No. 014, 18, ISSN = 1815-0659, MRCLASS = 22E40 (18D99), MRNUMBER = 3764535,
4. MR2068521: AUTHOR = Baez, John C. and Lauda, Aaron D., TITLE = Higher-dimensional algebra. V. 2-groups, JOURNAL = Theory and Applications of Categories, VOLUME = 12, YEAR = 2004, PAGES = 423--491, ISSN = 1201-561X, MRCLASS = 18D05 (18D10 20J06), MRNUMBER = 2068521,
5. MR2681698: AUTHOR = Murray, Michael K., TITLE = An introduction to bundle gerbes, BOOKTITLE = The many facets of geometry, PAGES = 237--260, PUBLISHER = Oxford University Press, YEAR = 2010, ISBN = 978-0-19-953492-0, MRCLASS = 53C08 (53C29 55R65), MRNUMBER = 2681698,
6. MR1197353: AUTHOR = Brylinski, Jean-Luc, TITLE = Loop spaces, characteristic classes and geometric quantization, SERIES = Progress in Mathematics, VOLUME = 107, PUBLISHER = Birkh\"auser Boston, Inc., Boston, MA, YEAR = 1993, PAGES = xvi+300, ISBN = 0-8176-3644-7, MRCLASS = 57Rxx (18G50 55P35 58F06), MRNUMBER = 1197353,
7. Wal2007phd: title=Algebraic structures for bundle gerbes and the Wess-Zumino term in conformal field theory, author=Waldorf, Konrad, year=2007, school=Staats-und Universit\"atsbibliothek Hamburg Carl von Ossietzky
8. MR2709030: AUTHOR = Bartels, Tobias Keith, TITLE = Higher gauge theory: 2-bundles, NOTE = Thesis (Ph.D.)--University of California, Riverside, PUBLISHER = ProQuest LLC, Ann Arbor, MI, YEAR = 2006, PAGES = 142, ISBN = 978-0542-80050-4, MRCLASS = 99-05, MRNUMBER = 2709030,
9. MR2800361: AUTHOR = Schommer-Pries, Christopher J., TITLE = Central extensions of smooth 2-groups and a finite-dimensional string 2-group, JOURNAL = Geom. Topol., FJOURNAL = Geometry \& Topology, VOLUME = 15, YEAR = 2011, NUMBER = 2, PAGES = 609--676, ISSN = 1465-3060,1364-0380, MRCLASS = 53C08 (18D10 22A22 57T10), MRNUMBER = 2800361,
10. MR658304: AUTHOR = Bott, Raoul and Tu, Loring W., TITLE = Differential forms in algebraic topology, SERIES = Graduate Texts in Mathematics, VOLUME = 82, PUBLISHER = Springer-Verlag, New York-Berlin, YEAR = 1982, PAGES = xiv+331, ISBN = 0-387-90613-4, MRCLASS = 57R19 (55-02 58-01 58A12), MRNUMBER = 658304,
11. MR900587: AUTHOR = Pressley, Andrew and Segal, Graeme, TITLE = Loop groups, SERIES = Oxford Mathematical Monographs, NOTE = Oxford Science Publications, PUBLISHER = The Clarendon Press, Oxford University Press, New York, YEAR = 1986, PAGES = viii+318, ISBN = 0-19-853535-X, MRCLASS = 22E65 (58D15 81D15), MRNUMBER = 900587,
12. MR3894086: AUTHOR = Waldorf, Konrad, TITLE = A global perspective to connections on principal 2-bundles, JOURNAL = Forum Math., FJOURNAL = Forum Mathematicum, VOLUME = 30, YEAR = 2018, NUMBER = 4, PAGES = 809--843, ISSN = 0933-7741,1435-5337, MRCLASS = 53C08 (22A22 55R65), MRNUMBER = 3894086,
13. MR1698234: AUTHOR = Isham, Chris J., TITLE = Modern differential geometry for physicists, SERIES = World Scientific Lecture Notes in Physics, VOLUME = 61, EDITION = Second, PUBLISHER = World Scientific Publishing Co., Inc., River Edge, NJ, YEAR = 1999, PAGES = xiv+289, ISBN = 981-02-3555-0, MRCLASS = 53-01 (53C80), MRNUMBER = 1698234,
14. MR2318847: AUTHOR = Schreiber, Urs and Schweigert, Christoph and Waldorf, Konrad, TITLE = Unoriented WZW models and holonomy of bundle gerbes, JOURNAL = Comm. Math. Phys., FJOURNAL = Communications in Mathematical Physics, VOLUME = 274, YEAR = 2007, NUMBER = 1, PAGES = 31--64, ISSN = 0010-3616,1432-0916, MRCLASS = 53C29 (53C80 55R65 81T40 81T45), MRNUMBER = 2318847,
15. MR1269324: AUTHOR = Weibel, Charles A., TITLE = An introduction to homological algebra, SERIES = Cambridge Studies in Advanced Mathematics, VOLUME = 38, PUBLISHER = Cambridge University Press, Cambridge, YEAR = 1994, PAGES = xiv+450, ISBN = 0-521-43500-5; 0-521-55987-1, MRCLASS = 18-01 (16-01 17-01 20-01 55Uxx), MRNUMBER = 1269324,
16. MR672956: AUTHOR = Brown, Kenneth S., TITLE = Cohomology of groups, SERIES = Graduate Texts in Mathematics, VOLUME = 87, PUBLISHER = Springer-Verlag, New York-Berlin, YEAR = 1982, PAGES = x+306, ISBN = 0-387-90688-6, MRCLASS = 20-02 (18-01 20F32 20J05 55-01), MRNUMBER = 672956,
17. MR198828: AUTHOR = Tinkham, Michael, TITLE = Group theory and quantum mechanics, PUBLISHER = McGraw-Hill Book Co., New York-Toronto-London, YEAR = 1964, PAGES = xii+340, MRCLASS = 81.22, MRNUMBER = 198828,
18. MR2588823: AUTHOR = Sati, Hisham and Schreiber, Urs and Stasheff, Jim, TITLE = Fivebrane structures, JOURNAL = Rev. Math. Phys., FJOURNAL = Reviews in Mathematical Physics. A Journal for Both Review and Original Research Papers in the Field of Mathematical Physics, VOLUME = 21, YEAR = 2009, NUMBER = 10, PAGES = 1197--1240, ISSN = 0129-055X,1793-6659, MRCLASS = 53C08 (55R40 55R65 55S35 81T30 81T50), MRNUMBER = 2588823,
19. MR1380455: AUTHOR = Stolz, Stephan, TITLE = A conjecture concerning positive Ricci curvature and the Witten genus, JOURNAL = Mathematische Annalen, VOLUME = 304, YEAR = 1996, NUMBER = 4, PAGES = 785--800, ISSN = 0025-5831,1432-1807, MRCLASS = 58G10 (53C21 57R20 57R65), MRNUMBER = 1380455,
20. MR2597732: AUTHOR = Baez, John C. and Stevenson, Danny, TITLE = The classifying space of a topological 2-group, BOOKTITLE = Algebraic topology, SERIES = Abel Symposium, VOLUME = 4, PAGES = 1--31, PUBLISHER = Springer, Berlin, YEAR = 2009, ISBN = 978-3-642-01199-3, MRCLASS = 55R35 (18G50), MRNUMBER = 2597732,
21. MR3089401: AUTHOR = Nikolaus, Thomas and Waldorf, Konrad, TITLE = Four equivalent versions of nonabelian gerbes, JOURNAL = Pacific Journal of Mathematics, VOLUME = 264, YEAR = 2013, NUMBER = 2, PAGES = 355--419, ISSN = 0030-8730,1945-5844, MRCLASS = 55R65 (53C08 55N05 58H05), MRNUMBER = 3089401,
22. MR1481706: AUTHOR = Bredon, Glen E., TITLE = Sheaf theory, SERIES = Graduate Texts in Mathematics, VOLUME = 170, EDITION = Second, PUBLISHER = Springer-Verlag, New York, YEAR = 1997, PAGES = xii+502, ISBN = 0-387-94905-4, MRCLASS = 55N30 (18F20 54B40 55-02), MRNUMBER = 1481706,
23. MR3012377: AUTHOR = Naber, Gregory L., TITLE = Topology, geometry and gauge fields, SERIES = Applied Mathematical Sciences, VOLUME = 141, EDITION = Second, PUBLISHER = Springer, New York, YEAR = 2011, PAGES = xii+419, ISBN = 978-1-4419-7894-3; 978-1-4419-7895-0, MRCLASS = 53-01 (53C05 53C07 57-02 58-02 70S15 81-02), MRNUMBER = 3012377,
24. MR209411: AUTHOR = Spivak, Michael, TITLE = Calculus on manifolds. A modern approach to classical theorems of advanced calculus, PUBLISHER = W. A. Benjamin, Inc., New York-Amsterdam, YEAR = 1965, PAGES = xii+144, MRCLASS = 26.20 (57.00), MRNUMBER = 209411,
25. MR1512691: AUTHOR = Hopf, Heinz, TITLE = \"Uber die Abbildungen der dreidimensionalen Sph\"are auf die Kugelfl\"ache, JOURNAL = Math. Ann., FJOURNAL = Mathematische Annalen, VOLUME = 104, YEAR = 1931, NUMBER = 1, PAGES = 637--665, ISSN = 0025-5831,1432-1807, MRCLASS = 99-04, MRNUMBER = 1512691,
26. MR1669206: AUTHOR = Murray, Michael K., TITLE = Bundle gerbes, JOURNAL = J. London Math. Soc. (2), VOLUME = 54, YEAR = 1996, NUMBER = 2, PAGES = 403--416, DOI = 10.1112/jlms/54.2.403, URL = https://doi.org/10.1112/jlms/54.2.403 doi:[10.1112/jlms/54.2.403](https://doi.org/10.1112/jlms/54.2.403)
27. MR3535115: AUTHOR = Fiorenza, Domenico and Rogers, Christopher L. and Schreiber, Urs, TITLE = Higher $U(1)$-gerbe connections in geometric prequantization, JOURNAL = Rev. Math. Phys., FJOURNAL = Reviews in Mathematical Physics. A Journal for Both Review and Original Research Papers in the Field of Mathematical Physics, VOLUME = 28, YEAR = 2016, NUMBER = 6, PAGES = 1650012, 72, ISSN = 0129-055X,1793-6659, MRCLASS = 53D50 (18G55 53C08), MRNUMBER = 3535115,
28. MR1863996: AUTHOR = Toth, Gabor, TITLE = Finite M\"obius groups, minimal immersions of spheres, and moduli, SERIES = Universitext, PUBLISHER = Springer-Verlag, New York, YEAR = 2002, PAGES = xvi+317, ISBN = 0-387-95323-X, MRCLASS = 53C42 (53C43 58E20), MRNUMBER = 1863996,
29. MR3912053: AUTHOR = Epa, Narthana and Ganter, Nora, TITLE = Platonic and alternating 2-groups, JOURNAL = High. Struct., FJOURNAL = Higher Structures, VOLUME = 1, YEAR = 2017, NUMBER = 1, PAGES = 122--146, ISSN = 2209-0606, MRCLASS = 20J06 (18N10 20D99 20J15), MRNUMBER = 3912053,
30. MR2610397: AUTHOR = Waldorf, Konrad, TITLE = Multiplicative bundle gerbes with connection, JOURNAL = Differential Geom. Appl., FJOURNAL = Differential Geometry and its Applications, VOLUME = 28, YEAR = 2010, NUMBER = 3, PAGES = 313--340, ISSN = 0926-2245,1872-6984, MRCLASS = 53C08 (22E67 57R56), MRNUMBER = 2610397,
31. MR2174418: AUTHOR = Carey, Alan L. and Johnson, Stuart and Murray, Michael K. and Stevenson, Danny and Wang, Bai-Ling, TITLE = Bundle gerbes for Chern-Simons and Wess-Zumino-Witten theories, JOURNAL = Comm. Math. Phys., FJOURNAL = Communications in Mathematical Physics, VOLUME = 259, YEAR = 2005, NUMBER = 3, PAGES = 577--613, ISSN = 0010-3616,1432-0916, MRCLASS = 58J28 (53C07 55R65 58J90 81T13), MRNUMBER = 2174418,
32. MR3013040: AUTHOR = Waldorf, Konrad, TITLE = A construction of string 2-group models using a transgression-regression technique, BOOKTITLE = Analysis, geometry and quantum field theory, SERIES = Contemp. Math., VOLUME = 584, PAGES = 99--115, PUBLISHER = Amer. Math. Soc., Providence, RI, YEAR = 2012, ISBN = 978-0-8218-9144-5, MRCLASS = 53C08 (58H05 81T30), MRNUMBER = 3013040,
33. MR2318389: AUTHOR = Waldorf, Konrad, TITLE = More morphisms between bundle gerbes, JOURNAL = Theory Appl. Categ., FJOURNAL = Theory and Applications of Categories, VOLUME = 18, YEAR = 2007, PAGES = No. 9, 240--273, ISSN = 1201-561X, MRCLASS = 53C29 (18B40 18D05 55R65), MRNUMBER = 2318389,
34. MR3917427: AUTHOR = Waldorf, Konrad, TITLE = Parallel transport in principal 2-bundles, JOURNAL = High. Struct., FJOURNAL = Higher Structures, VOLUME = 2, YEAR = 2018, NUMBER = 1, PAGES = 57--115, ISSN = 2209-0606, MRCLASS = 53C08 (22A22 55R65 58H05), MRNUMBER = 3917427,
35. MR2366945: AUTHOR = Baez, John C. and Stevenson, Danny and Crans, Alissa S. and Schreiber, Urs, TITLE = From loop groups to 2-groups, JOURNAL = Homology Homotopy Appl., FJOURNAL = Homology, Homotopy and Applications, VOLUME = 9, YEAR = 2007, NUMBER = 2, PAGES = 101--135, ISSN = 1532-0073,1532-0081, MRCLASS = 22E67 (17B99 18D05), MRNUMBER = 2366945,
36. MR3084724: AUTHOR = Schreiber, Urs and Waldorf, Konrad, TITLE = Connections on non-abelian gerbes and their holonomy, JOURNAL = Theory Appl. Categ., FJOURNAL = Theory and Applications of Categories, VOLUME = 28, YEAR = 2013, PAGES = 476--540, ISSN = 1201-561X, MRCLASS = 53C08 (18D05 55R65), MRNUMBER = 3084724,
37. MR42768: AUTHOR = Ehresmann, Charles, TITLE = Les connexions infinit\'esimales dans un espace fibr\'e diff\'erentiable, BOOKTITLE = Colloque de topologie (espaces fibr\'es), Bruxelles, 1950, PAGES = 29--55, PUBLISHER = Georges Thone, Li\`ege, YEAR = 1951, MRCLASS = 53.0X, MRNUMBER = 42768,
38. MR116360: AUTHOR = Ehresmann, Charles, TITLE = Cat\'egories topologiques et cat\'egories diff\'erentiables, BOOKTITLE = Colloque G\'eom. Diff. Globale (Bruxelles, 1958), PAGES = 137--150, PUBLISHER = Librairie Universitaire, Louvain, YEAR = 1959, MRCLASS = 57.00, MRNUMBER = 116360,
39. MR217087: AUTHOR = Grothendieck, Alexander, TITLE = Rev\^etements \'etales et groupe fondamental. Fasc. I: Expos\'es 1 \`a 5, NOTE = Troisi\`eme \'edition, corrig\'ee, S\'eminaire de G\'eom\'etrie Alg\'ebrique, 1960/61, PUBLISHER = Institut des Hautes \'Etudes Scientifiques, Paris, YEAR = 1963, PAGES = iv+143 pp. (not consecutively paged) (loose errata), MRCLASS = 14.55, MRNUMBER = 217087,
40. MR30760: AUTHOR = Whitehead, J. H. C., TITLE = Combinatorial homotopy. II, JOURNAL = Bull. Amer. Math. Soc., FJOURNAL = Bulletin of the American Mathematical Society, VOLUME = 55, YEAR = 1949, PAGES = 453--496, ISSN = 0002-9904, MRCLASS = 56.0X, MRNUMBER = 30760,
41. MR419643: AUTHOR = Brown, Ronald and Spencer, Christopher B., TITLE = $G$-groupoids, crossed modules and the fundamental groupoid of a topological group, NOTE = Nederl. Akad. Wetensch. Proc. Ser. A \bf 79, JOURNAL = Indag. Math., FJOURNAL = , VOLUME = 38, YEAR = 1976, NUMBER = 4, PAGES = 296--302, MRCLASS = 20L10 (22A05), MRNUMBER = 419643,
42. MR2342821: AUTHOR = Baez, John C. and Schreiber, Urs, TITLE = Higher gauge theory, BOOKTITLE = Categories in algebra, geometry and mathematical physics, SERIES = Contemp. Math., VOLUME = 431, PAGES = 7--30, PUBLISHER = Amer. Math. Soc., Providence, RI, YEAR = 2007, ISBN = 978-0-8218-3970-6; 0-8218-3970-5, MRCLASS = 53C29 (18D99 22A22 53C07 55R65), MRNUMBER = 2342821,
43. MR4268834: AUTHOR = Bunk, Severin and M\"uller, Lukas and Szabo, Richard J., TITLE = Smooth 2-group extensions and symmetries of bundle gerbes, JOURNAL = Comm. Math. Phys., FJOURNAL = Communications in Mathematical Physics, VOLUME = 384, YEAR = 2021, NUMBER = 3, PAGES = 1829--1911, ISSN = 0010-3616,1432-0916, MRCLASS = 53C08 (22E30), MRNUMBER = 4268834,

