# The (R)evolution of Scientific Workflows in the Agentic AI Era: Towards Autonomous Science

GrokRxiv review of [arXiv:2509.09915](https://arxiv.org/abs/2509.09915) · `cs.AI`

_Authors_: Woong Shin, Renan Souza, Daniel Rosendo, Frédéric Suter, Feiyi Wang, Prasanna Balaprakash, Rafael Ferreira da Silva

## TL;DR

The paper proposes a two-dimensional evolutionary framework for scientific workflows—intelligence (static → intelligent) and composition (single → swarm)—organized as a 5×5 matrix, accompanied by an architectural blueprint for autonomous scientific laboratories. The four specialist reviews converge on a broadly positive but conditional assessment. Novelty (score 0.7, verdict 'significant', confidence 0.9) and citation quality (confidence 0.95) are strong, with the framework building coherently on a series of prior works from the same community. Technical correctness (confidence 0.7, overall 'mostly_sound') found 14 claims, of which two carry major severity: the 10–100× discovery acceleration promise attributed solely to a community roadmap position piece [autonomousscience] (C3) and the 'drug-discovery years → weeks' speed-up asserted without citation or baseline (C12); additional minor issues include the systematic misspelling of ChemCrow as 'ChemChow', ambiguous per-node vs. aggregate complexity counts, and unvalidated 5×5 matrix cell placements. Reproducibility (score 0.12/1.0, confidence 0.9) is the most serious concern: two critical-severity gaps were identified—no machine-checkable proof or formal model artifact for the state-machine taxonomy, and no reproducible evaluation protocol—plus three major-severity gaps covering absence of a paper-specific repository, data, and runnable environment. Per the code-amenable-field recommendation gate (cs.* domain, reproducibility flagged missing proof-as-code artifact at critical severity), the recommendation defaults to major_revision. Specialists do not disagree on the paper's conceptual contribution or relevance; the path to acceptance requires addressing the unsupported quantitative claims and providing at minimum a formal artifact and an evaluation protocol.

_Recommendation_: **Major revision** · _Confidence_: 78%

## Strengths

- The 5×5 intelligence-by-composition matrix provides a concrete, navigable taxonomy that maps established workflow systems to a shared conceptual space and supports incremental migration planning without requiring replacement of existing infrastructure.
- The architectural blueprint grounds abstract principles in specific infrastructure components (Globus Auth, AMQP message fabric, AI Hub extension), making the roadmap actionable for facility and infrastructure planners.
- The bibliography is exceptionally current, incorporating multiple 2025 publications on workflow terminology, federated agents, and distributed orchestration, demonstrating command of a rapidly evolving literature.
- The unification of classical DAG-based workflow execution and LLM-based agent behavior under a shared state-machine vocabulary bridges two communities that rarely cite each other and offers a common analytical lens.
- The challenge taxonomy—physical-digital divide, adaptive provenance, multi-institutional governance—is grounded in cited real deployments (A-lab, Ada self-driving laboratory, cross-facility case studies) and identifies specific, actionable research directions for both the AI and workflow communities.

## Weaknesses

- The 10–100× discovery acceleration claim, repeated in the Abstract and Sections 1 and 5.2, is attributed solely to a community roadmap position piece [autonomousscience] with no quantitative model, simulation, or case-study calculation substantiating the multiplier (technical_correctness C3, major severity).
- The drug-discovery 'years → weeks' speed-up in Section 5.2 is asserted without citation, baseline, or acknowledgment that biological-validation steps remain rate-limiting, implying an unscoped ~50× acceleration with no primary evidence (technical_correctness C12, major severity).
- No machine-checkable proof or formal model artifact is provided for the load-bearing state-machine formalism, intelligence/composition taxonomy, or 5×5 evolution matrix; the reproducibility specialist (critical severity) identified this as preventing independent verification of the theoretical claims.
- No reproducible evaluation protocol, simulation, benchmark, or validation experiment is defined for any aspect of the proposed architecture or roadmap, leaving all empirical claims unverifiable by an independent party (reproducibility, critical severity).
- The FSM abstraction M = (S, Σ, δ, s₀, F) does not account for the stochastic, infinite-state, and self-modifying character of LLM-based agents, and several 5×5 matrix cell placements (e.g., Federated at [Mesh × Learning], PSO at [Swarm × Learning]) are inconsistent with the paper's own definitions (technical_correctness C1, C10, C11, minor severity).
- The taxonomy is unvalidated against an independent corpus of workflow systems, and key complexity claims (e.g., O(k) swarm communication without specifying per-node vs. aggregate, hierarchical 'O(n) channels per level') contain ambiguities that weaken the formal argumentation (technical_correctness C2, C13, minor severity).

## Revision Targets

- [ ] **Manuscript: Abstract; Section 1; Section 5.2 (Accelerated Time to Discovery); Section 7**
  - Location: `corrections/2509.09915/paper.tex` at `Abstract; Section 1; Section 5.2 (Accelerated Time to Discovery); Section 7`
  - Evidence: The 100× figure appears multiple times but is attributed only to [autonomousscience] (a community roadmap/position piece). No quantitative model, benchmark, simulation, or case-study calculation is presented to justify the multiplier. The drug-discovery 'years → weeks' specific instance is given without a baseline, methodology, or citation.
  - Required change: Either (a) downgrade the language to 'community-projected' / 'aspirational' and clearly attribute the figure, or (b) ship a quantitative back-of-the-envelope model — e.g., experiments/acceleration_model/discovery_speedup.py that decomposes the speedup into iteration-time, parallelism, and exploration-efficiency factors with citable per-factor numbers from szymanski2023autonomous, macleod2020self, etc.
  - Verification: Re-review should confirm `Abstract; Section 1; Section 5.2 (Accelerated Time to Discovery); Section 7` is corrected or justified.
- [ ] **Manuscript: Section 5.2 (Accelerated Time to Discovery)**
  - Location: `corrections/2509.09915/paper.tex` at `Section 5.2 (Accelerated Time to Discovery)`
  - Evidence: This is a strong quantitative speed-up claim (years → weeks, i.e., ~50×) presented without a citation, baseline, or accounting for biological-validation steps that remain rate-limiting (animal models, clinical trials). The neighbouring references (autonomousscience, balaprakash2025swarm) do not provide a per-stage drug-discovery timeline analysis.
  - Required change: Cite a concrete example from the closed-loop drug-discovery literature (e.g., Insilico Medicine's INS018_055 timeline, or Sanofi-Exscientia partnerships) with verifiable timelines, or scope the claim to lead-identification / hit-to-lead specifically rather than 'drug discovery' broadly.
  - Verification: Re-review should confirm `Section 5.2 (Accelerated Time to Discovery)` is corrected or justified.
- [ ] **Code release and entrypoints**
  - Location: `intelligence/composition` at `code release and execution entrypoints`
  - Evidence: The load-bearing state-machine formalism, intelligence/composition taxonomy, and 5x5 evolution matrix are not supplied as a machine-checkable model or proof artifact; an artifact such as artifacts/formal/state_machine_taxonomy.lean or artifacts/model/evolution_matrix.tla would be needed to reproduce the theoretical claims.
  - Required change: Release the source code, scripts, model configuration, and execution entrypoints needed to regenerate the reported tables, or document why those artifacts cannot be released.
  - Verification: Re-review should confirm runnable code or a documented non-release justification is present.
- [ ] **Evaluation pipeline**
  - Location: `HAC/bootstrap` at `evaluation and statistical-testing pipeline`
  - Evidence: The paper does not define reproducible evaluation metrics, experiments, simulations, baselines, or validation protocols for the proposed architecture, roadmap, or acceleration claims.
  - Required change: Publish evaluation scripts or executable pseudocode for walk-forward retraining, validation selection, HAC/bootstrap settings, benchmark construction, and table regeneration.
  - Verification: Re-review should confirm the evaluation pipeline can reproduce the reported statistical tests and benchmarks.
- [ ] **Manuscript: Section 3.1**
  - Location: `corrections/2509.09915/paper.tex` at `Section 3.1`
  - Evidence: This is a conceptual claim, not an empirical one. The reduction is intuitive for reactive agents but glosses over essential differences: LLM-based agents are stochastic (δ becomes a conditional distribution P(s'|s,a)), have unbounded continuous state (token contexts), and frequently rewrite their own goal/state space at runtime — which is not captured by a fixed (S, Σ, δ, s₀, F) tuple. The paper introduces M' = Ω(M, C, G) to handle this but does not formalize Ω or show that it lies within any standard automata-theoretic class.
  - Required change: Either (a) generalize the abstraction explicitly to probabilistic / infinite-state / self-modifying transition systems (POMDPs, higher-order automata, reflection in process calculi) and cite the relevant formalisms, or (b) acknowledge the abstraction is a metaphor rather than a unifying formal model.
  - Verification: Re-review should confirm `Section 3.1` is corrected or justified.
- [ ] **Manuscript: Section 3.4, Table 3**
  - Location: `corrections/2509.09915/paper.tex` at `Section 3.4, Table 3`
  - Evidence: The matrix is a useful descriptive device, but several cells are populated by examples whose classification is debatable: 'Federated' learning is placed at [Mesh × Learning], yet federated learning is commonly described as hierarchical (central aggregator + clients). 'Particle Swarm Optimization' appears at [Swarm × Learning], yet PSO is typically a derivative-free optimization method (Optimizing) rather than a Learning system per the paper's own definition (δ_{t+1} = L(δ_t, H)). The matrix is not validated against an external corpus of workflow systems.
  - Required change: Provide explicit classification criteria, reclassify ambiguous cells (Federated → Hierarchical or split), and validate the taxonomy by classifying ≥20 real WMSs from suter2025fgcs into the matrix with rationale (e.g., a CSV at data/wms_classification.csv).
  - Verification: Re-review should confirm `Section 3.4, Table 3` is corrected or justified.

## Open Questions

- Can the authors provide a quantitative decomposition of the 10–100× acceleration figure, specifying what fraction derives from reduced iteration latency, increased parallelism, and improved exploration efficiency, with per-factor citable numbers from primary experimental results?
- What is the intended formal class of the meta-optimization operator Ω—Turing-complete rewriter, restricted higher-order function, or POMDP policy—and what does that imply for the decidability and verifiability claims in Section 3.2?
- Federated learning is placed at [Mesh × Learning] despite its standard characterization as hierarchical (central aggregator + clients), and PSO appears at [Swarm × Learning] rather than [Swarm × Optimizing]; can the authors justify or revise these placements with explicit classification criteria?
- The paper discusses multi-institutional governance but does not address concrete failure modes such as a malfunctioning autonomous agent triggering irreversible physical experiments across facilities; what safety, rollback, and human-override mechanisms are envisioned at the [Intelligent × Swarm] level?
- Key deployed agentic systems such as Coscientist (Boiko et al., Nature 2023) are absent from the bibliography; how does the proposed framework position itself relative to such systems, and would their inclusion alter any cell placements in the 5×5 matrix?

## Per-Agent Reviews

### citation (`gemini-3-flash-preview`) — status: `warn`

```json
{
  "confidence": 0.95,
  "entries": [
    {
      "citation": {
        "arxiv_id": "2024.34015",
        "authors": [
          "Ferreira da Silva, Rafael",
          "Badia, Rosa M.",
          "Bard, Deborah",
          "Foster, Ian T.",
          "Jha, Shantenu",
          "Suter, Frédéric"
        ],
        "doi": "10.1109/MC.2024.3401542",
        "key": "ferreiradasilva2024computer",
        "raw": "ferreiradasilva2024computer: title = Frontiers in Scientific Workflows: Pervasive Integration with HPC, author = Ferreira da Silva, Rafael and Badia, Rosa M. and Bard, Deborah and Foster, Ian T. and Jha, Shantenu and Suter, Frédéric, journal = IEEE Computer, volume = 57, number = 8, pages = , year = 2024, doi = 10.1109/MC.2024.3401542",
        "title": "Frontiers in Scientific Workflows: Pervasive Integration with HPC",
        "url": null,
        "venue": "IEEE Computer",
        "year": 2024
      },
      "exists": null,
      "explanation": "Discusses frontiers in scientific workflows and their integration with HPC, which is a core theme of the paper.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2025.10797",
        "authors": [
          "Suter, Frédéric",
          "Coleman, Tainã",
          "Altintas, Ílkay",
          "Badia, Rosa M.",
          "Balis, Bartosz",
          "Chard, Kyle",
          "Colonnelli, Iacopo",
          "Deelman, Ewa",
          "Tommaso, Paolo Di",
          "Fahringer, Thomas",
          "Goble, Carole",
          "Jha, Shantenu",
          "Katz, Daniel S.",
          "Köster, Johannes",
          "Leser, Ulf",
          "Mehta, Kshitij",
          "Oliver, Hilary",
          "Peterson, J.-Luc",
          "Pizzi, Giovanni",
          "Pottier, Loïc",
          "Sirvent, Raül",
          "Suchyta, Eric",
          "Thain, Douglas",
          "Wilkinson, Sean R.",
          "Wozniak, Justin M.",
          "Ferreira da Silva, Rafael"
        ],
        "doi": "10.1016/j.future.2025.107974",
        "key": "suter2025fgcs",
        "raw": "suter2025fgcs: title = A Terminology for Scientific Workflow Systems, author = Suter, Frédéric and Coleman, Tainã and Altintas, Ílkay and Badia, Rosa M. and Balis, Bartosz and Chard, Kyle and Colonnelli, Iacopo and Deelman, Ewa and Tommaso, Paolo Di and Fahringer, Thomas and Goble, Carole and Jha, Shantenu and Katz, Daniel S. and Köster, Johannes and Leser, Ulf and Mehta, Kshitij and Oliver, Hilary and Peterson, J.-Luc and Pizzi, Giovanni and Pottier, Loïc and Sirvent, Raül and Suchyta, Eric and Thain, Douglas and Wilkinson, Sean R. and Wozniak, Justin M. and Ferreira da Silva, Rafael, journal = Future Generation Computer Systems, volume = 174, number = , pages = , doi = 10.1016/j.future.2025.107974, year = 2025",
        "title": "A Terminology for Scientific Workflow Systems",
        "url": null,
        "venue": "Future Generation Computer Systems",
        "year": 2025
      },
      "exists": null,
      "explanation": "Provides foundational terminology for scientific workflow systems, essential for defining the scope of the framework.",
      "notes": "Forthcoming work (2025), relevant for defining scientific workflow terminology.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Ferreira da Silva, Rafael",
          "Abolhasani, Milad",
          "Antonopoulos, Dionysios A",
          "Biven, Laura",
          "Coffee, Ryan",
          "Foster, Ian T",
          "Hamilton, Leslie",
          "Jha, Shantenu",
          "Mayer, Theresa",
          "Mintz, Benjamin",
          "Moore, Robert",
          "Nimer, Salahudin",
          "Paulson, Noah",
          "Shin, Woong",
          "Suter, Frédéric",
          "Taheri, Mitra",
          "Taufer, Michela",
          "Washburn, Newell R."
        ],
        "doi": "10.1145/3750720.3757292",
        "key": "autonomousscience",
        "raw": "autonomousscience: title = A Grassroots Network and Community Roadmap for Interconnected Autonomous Science Laboratories for Accelerated Discovery, author = Ferreira da Silva, Rafael and Abolhasani, Milad and Antonopoulos, Dionysios A and Biven, Laura and Coffee, Ryan and Foster, Ian T and Hamilton, Leslie and Jha, Shantenu and Mayer, Theresa and Mintz, Benjamin and Moore, Robert and Nimer, Salahudin and Paulson, Noah and Shin, Woong and Suter, Frédéric and Taheri, Mitra and Taufer, Michela and Washburn, Newell R., booktitle = 54th International Conference on Parallel Processing Companion (ICPP Companion '25), year = 2025, doi = 10.1145/3750720.3757292",
        "title": "A Grassroots Network and Community Roadmap for Interconnected Autonomous Science Laboratories for Accelerated Discovery",
        "url": null,
        "venue": "54th International Conference on Parallel Processing Companion (ICPP Companion '25)",
        "year": 2025
      },
      "exists": null,
      "explanation": "Outlines a community roadmap for interconnected autonomous science laboratories, directly related to the paper's vision.",
      "notes": "Self-citation by multiple authors representing the community roadmap.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2505.05428",
        "authors": [
          "Pauloski, J Gregory",
          "Babuji, Yadu",
          "Chard, Ryan",
          "Sakarvadia, Mansi",
          "Chard, Kyle",
          "Foster, Ian"
        ],
        "doi": null,
        "key": "pauloski2025empowering",
        "raw": "pauloski2025empowering: title=Empowering Scientific Workflows with Federated Agents, author=Pauloski, J Gregory and Babuji, Yadu and Chard, Ryan and Sakarvadia, Mansi and Chard, Kyle and Foster, Ian, journal=arXiv preprint arXiv:2505.05428, year=2025",
        "title": "Empowering Scientific Workflows with Federated Agents",
        "url": null,
        "venue": "arXiv preprint arXiv:2505.05428",
        "year": 2025
      },
      "exists": null,
      "explanation": "Focuses on empowering scientific workflows with federated agents, a key aspect of the proposed agentic framework.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Antypas, Katerina B",
          "Bard, DJ",
          "Blaschke, Johannes P",
          "Canon, R Shane",
          "Enders, Bjoern",
          "Shankar, Mallikarjun Arjun",
          "Somnath, Suhas",
          "Stansberry, Dale",
          "Uram, Thomas D",
          "Wilkinson, Sean R"
        ],
        "doi": null,
        "key": "antypas2021enabling",
        "raw": "antypas2021enabling: title=Enabling discovery data science through cross-facility workflows, author=Antypas, Katerina B and Bard, DJ and Blaschke, Johannes P and Canon, R Shane and Enders, Bjoern and Shankar, Mallikarjun Arjun and Somnath, Suhas and Stansberry, Dale and Uram, Thomas D and Wilkinson, Sean R, booktitle=2021 IEEE International Conference on Big Data (Big Data), pages=3671--3680, year=2021, organization=IEEE",
        "title": "Enabling discovery data science through cross-facility workflows",
        "url": null,
        "venue": "2021 IEEE International Conference on Big Data (Big Data)",
        "year": 2021
      },
      "exists": null,
      "explanation": "Discusses cross-facility workflows for discovery data science, addressing distributed facility coordination.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Abolhasani, Milad",
          "Kumacheva, Eugenia"
        ],
        "doi": null,
        "key": "abolhasani2023rise",
        "raw": "abolhasani2023rise: title=The rise of self-driving labs in chemical and materials sciences, author=Abolhasani, Milad and Kumacheva, Eugenia, journal=Nature Synthesis, volume=2, number=6, pages=483--492, year=2023, publisher=Nature Publishing Group UK London",
        "title": "The rise of self-driving labs in chemical and materials sciences",
        "url": null,
        "venue": "Nature Synthesis",
        "year": 2023
      },
      "exists": null,
      "explanation": "Key paper on self-driving labs in chemical and materials sciences, serving as a representative example.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Peter Amstutz",
          "Maxim Mikheev",
          "Michael R. Crusoe",
          "Nebojša Tijanić",
          "Samuel Lampa",
          "others"
        ],
        "doi": null,
        "key": "workflow-systems",
        "raw": "workflow-systems: author=Peter Amstutz and Maxim Mikheev and Michael R. Crusoe and Nebojša Tijanić and Samuel Lampa and others, title=Existing Workflow systems, howpublished=\\urlhttps://s.apache.org/existing-workflow-systems, year=2024",
        "title": "Existing Workflow systems",
        "url": "https://s.apache.org/existing-workflow-systems",
        "venue": "Online",
        "year": 2024
      },
      "exists": null,
      "explanation": "A listing-style reference for existing workflow systems used to show the breadth of the field.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2023.10254",
        "authors": [
          "Suter, Frédéric",
          "Ferreira da Silva, Rafael",
          "Gainaru, Ana",
          "Klasky, Scott"
        ],
        "doi": "10.1109/e-Science58273.2023.10254849",
        "key": "suter2023escience",
        "raw": "suter2023escience: title = Driving Next-Generation Workflows from the Data Plane, author = Suter, Frédéric and Ferreira da Silva, Rafael and Gainaru, Ana and Klasky, Scott, booktitle = 19th IEEE Conference on eScience, pages = , year = 2023, doi = 10.1109/e-Science58273.2023.10254849",
        "title": "Driving Next-Generation Workflows from the Data Plane",
        "url": null,
        "venue": "19th IEEE Conference on eScience",
        "year": 2023
      },
      "exists": null,
      "explanation": "Discusses driving workflows from the data plane, representing the evolution to data-driven pipelines.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2110.13999",
        "authors": [
          "Nouri, Azita",
          "Davis, Philip E",
          "Subedi, Pradeep",
          "Parashar, Manish"
        ],
        "doi": null,
        "key": "nouri2021exploring",
        "raw": "nouri2021exploring: title=Exploring the role of machine learning in scientific workflows: Opportunities and challenges, author=Nouri, Azita and Davis, Philip E and Subedi, Pradeep and Parashar, Manish, journal=arXiv preprint arXiv:2110.13999, year=2021",
        "title": "Exploring the role of machine learning in scientific workflows: Opportunities and challenges",
        "url": null,
        "venue": "arXiv preprint arXiv:2110.13999",
        "year": 2021
      },
      "exists": null,
      "explanation": "Explores machine learning in scientific workflows, highlighting opportunities and challenges.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Badia, Rosa M",
          "Berti-Equille, Laure",
          "Ferreira da Silva, Rafael",
          "Ulf Leser"
        ],
        "doi": null,
        "key": "badia2024integrating",
        "raw": "badia2024integrating: title=Integrating HPC, AI, and Workflows for Scientific Data Analysis (Dagstuhl Seminar 23352), author=Badia, Rosa M and Berti-Equille, Laure and Ferreira da Silva, Rafael and Leser, Ulf, journal=Dagstuhl Reports, volume=13, number=8, pages=129--164, year=2024, publisher=Schloss Dagstuhl--Leibniz-Zentrum f\\\"ur Informatik",
        "title": "Integrating HPC, AI, and Workflows for Scientific Data Analysis (Dagstuhl Seminar 23352)",
        "url": null,
        "venue": "Dagstuhl Reports",
        "year": 2024
      },
      "exists": null,
      "explanation": "Reports on integrating HPC, AI, and workflows, a critical integration challenge discussed in the paper.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Deelman, Ewa"
        ],
        "doi": null,
        "key": "deelman2023artificial",
        "raw": "deelman2023artificial: title=How is artificial intelligence changing science?, author=Deelman, Ewa, booktitle=2023 IEEE 19th International Conference on e-Science (e-Science), pages=1--4, year=2023, organization=IEEE",
        "title": "How is artificial intelligence changing science?",
        "url": null,
        "venue": "2023 IEEE 19th International Conference on e-Science (e-Science)",
        "year": 2023
      },
      "exists": null,
      "explanation": "Analyzes how AI is changing science, emphasizing the need for understanding causality.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2406.14315",
        "authors": [
          "Wes Brewer",
          "Ana Gainaru",
          "Frédéric Suter",
          "Feiyi Wang",
          "Murali Emani",
          "Shantenu Jha"
        ],
        "doi": null,
        "key": "brewer2025",
        "raw": "brewer2025: title=AI-coupled HPC Workflow Applications, Middleware and Performance, author=Wes Brewer and Ana Gainaru and Frédéric Suter and Feiyi Wang and Murali Emani and Shantenu Jha, year=2025, eprint=2406.14315, archivePrefix=arXiv, primaryClass=cs.DC, howpublished= \\urlhttps://arxiv.org/abs/2406.14315",
        "title": "AI-coupled HPC Workflow Applications, Middleware and Performance",
        "url": "https://arxiv.org/abs/2406.14315",
        "venue": "arXiv preprint arXiv:2406.14315",
        "year": 2025
      },
      "exists": null,
      "explanation": "Discusses AI-coupled HPC workflow applications, addressing the fragmented integration challenge.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Tuecke, Steven",
          "Ananthakrishnan, Rachana",
          "Chard, Kyle",
          "Lidman, Mattias",
          "McCollam, Brendan",
          "Rosen, Stephen",
          "Foster, Ian"
        ],
        "doi": null,
        "key": "tuecke2016globus",
        "raw": "tuecke2016globus: title=Globus Auth: A research identity and access management platform, author=Tuecke, Steven and Ananthakrishnan, Rachana and Chard, Kyle and Lidman, Mattias and McCollam, Brendan and Rosen, Stephen and Foster, Ian, booktitle=2016 IEEE 12th International Conference on e-Science (e-Science), pages=203--212, year=2016, organization=IEEE",
        "title": "Globus Auth: A research identity and access management platform",
        "url": null,
        "venue": "2016 IEEE 12th International Conference on e-Science (e-Science)",
        "year": 2016
      },
      "exists": null,
      "explanation": "Describes Globus Auth, a foundational research identity and access management platform used in the architectural blueprint.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Allen, Bryce",
          "Bresnahan, John",
          "Childers, Lisa",
          "Foster, Ian",
          "Kandaswamy, Gopi",
          "Kettimuthu, Raj",
          "Kordas, Jack",
          "Link, Mike",
          "Martin, Stuart",
          "Pickett, Karl",
          "others"
        ],
        "doi": null,
        "key": "allen2012software",
        "raw": "allen2012software: title=Software as a service for data scientists, author=Allen, Bryce and Bresnahan, John and Childers, Lisa and Foster, Ian and Kandaswamy, Gopi and Kettimuthu, Raj and Kordas, Jack and Link, Mike and Martin, Stuart and Pickett, Karl and others, journal=Communications of the ACM, volume=55, number=2, pages=81--88, year=2012, publisher=ACM New York, NY, USA",
        "title": "Software as a service for data scientists",
        "url": null,
        "venue": "Communications of the ACM",
        "year": 2012
      },
      "exists": null,
      "explanation": "Discusses software as a service for data scientists, specifically Globus Transfer for data fabrics.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Foster, Ian",
          "Czajkowski, Karl",
          "Ferguson, DE",
          "Frey, Jeffrey",
          "Graham, Steve",
          "Maguire, Tom",
          "Snelling, David",
          "Tuecke, Steven"
        ],
        "doi": null,
        "key": "foster2005modeling",
        "raw": "foster2005modeling: title=Modeling and managing state in distributed systems: The role of OGSI and WSRF, author=Foster, Ian and Czajkowski, Karl and Ferguson, DE and Frey, Jeffrey and Graham, Steve and Maguire, Tom and Snelling, David and Tuecke, Steven, journal=Proceedings of the IEEE, volume=93, number=3, pages=604--612, year=2005, publisher=IEEE",
        "title": "Modeling and managing state in distributed systems: The role of OGSI and WSRF",
        "url": null,
        "venue": "Proceedings of the IEEE",
        "year": 2005
      },
      "exists": null,
      "explanation": "Foundational work on WSRF for managing state in distributed systems, relevant to managing distributed learning states.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Talia, Domenico"
        ],
        "doi": null,
        "key": "talia2002open",
        "raw": "talia2002open: title=The open grid services architecture: Where the grid meets the web, author=Talia, Domenico, journal=IEEE Internet Computing, volume=6, number=6, pages=67--71, year=2002, publisher=IEEE",
        "title": "The open grid services architecture: Where the grid meets the web",
        "url": null,
        "venue": "IEEE Internet Computing",
        "year": 2002
      },
      "exists": null,
      "explanation": "Introduces Open Grid Services Architecture (OGSA) for cross-facility interoperability.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Standard, OASIS"
        ],
        "doi": null,
        "key": "standard2012oasis",
        "raw": "standard2012oasis: title=Oasis advanced message queuing protocol (amqp) version 1.0, author=Standard, OASIS, journal=International Journal of Aerospace Engineering Hindawi www. hindawi. com, volume=2018, year=2012",
        "title": "Oasis advanced message queuing protocol (amqp) version 1.0",
        "url": null,
        "venue": "International Journal of Aerospace Engineering",
        "year": 2012
      },
      "exists": null,
      "explanation": "Reference for AMQP standard used in federated event-driven workflows.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Hysmith, Holland",
          "Foadian, Elham",
          "Padhy, Shakti P",
          "Kalinin, Sergei V",
          "Moore, Rob G",
          "Ovchinnikova, Olga S",
          "Ahmadi, Mahshid"
        ],
        "doi": null,
        "key": "hysmith2024future",
        "raw": "hysmith2024future: title=The future of self-driving laboratories: from human in the loop interactive AI to gamification, author=Hysmith, Holland and Foadian, Elham and Padhy, Shakti P and Kalinin, Sergei V and Moore, Rob G and Ovchinnikova, Olga S and Ahmadi, Mahshid, journal=Digital Discovery, volume=3, number=4, pages=621--636, year=2024, publisher=Royal Society of Chemistry",
        "title": "The future of self-driving laboratories: from human in the loop interactive AI to gamification",
        "url": null,
        "venue": "Digital Discovery",
        "year": 2024
      },
      "exists": null,
      "explanation": "Discusses the future of self-driving laboratories and human-in-the-loop interactive AI.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Lordan, Francesc",
          "Casas-Moreno, Xavier",
          "Cummins, Philip",
          "Conejero, Javier",
          "Badia, Rosa M",
          "Sirvent, Ra\"ul"
        ],
        "doi": null,
        "key": "lordan2024taming",
        "raw": "lordan2024taming: title=Taming the Swarm: A Role-Based Approach for Autonomous Agents, author=Lordan, Francesc and Casas-Moreno, Xavier and Cummins, Philip and Conejero, Javier and Badia, Rosa M and Sirvent, Ra\\\"ul, booktitle=European Conference on Parallel Processing, pages=15--25, year=2024, organization=Springer",
        "title": "Taming the Swarm: A Role-Based Approach for Autonomous Agents",
        "url": null,
        "venue": "European Conference on Parallel Processing",
        "year": 2024
      },
      "exists": null,
      "explanation": "Proposes a role-based approach for autonomous agents, supporting the formation of discovery loops.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Balaprakash, Prasanna",
          "Raghavan, Krishnan",
          "Cappello, Franck",
          "Deelman, Ewa",
          "Mandal, Anirban",
          "Jin, Hongwei",
          "Mahmud, Imtiaz",
          "Thareja, Komal",
          "Wu, Shixun",
          "Zuk, Pawel",
          "others"
        ],
        "doi": null,
        "key": "balaprakash2025swarm",
        "raw": "balaprakash2025swarm: title=SWARM: Reimagining scientific workflow management systems in a distributed world, author=Balaprakash, Prasanna and Raghavan, Krishnan and Cappello, Franck and Deelman, Ewa and Mandal, Anirban and Jin, Hongwei and Mahmud, Imtiaz and Thareja, Komal and Wu, Shixun and Zuk, Pawel and others, journal=The International Journal of High Performance Computing Applications, pages=10943420251339317, year=2025, publisher=SAGE Publications Sage UK: London, England",
        "title": "SWARM: Reimagining scientific workflow management systems in a distributed world",
        "url": null,
        "venue": "The International Journal of High Performance Computing Applications",
        "year": 2025
      },
      "exists": null,
      "explanation": "Reimagines scientific workflows in a distributed world using swarm intelligence.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Wilkinson, Mark D",
          "Dumontier, Michel",
          "Aalbersberg, IJsbrand Jan",
          "Appleton, Gabrielle",
          "Axton, Myles",
          "Baak, Arie",
          "Blomberg, Niklas",
          "Boiten, Jan-Willem",
          "da Silva Santos, Luiz Bonino",
          "Bourne, Philip E",
          "others"
        ],
        "doi": null,
        "key": "wilkinson2016fair",
        "raw": "wilkinson2016fair: title=The FAIR Guiding Principles for scientific data management and stewardship, author=Wilkinson, Mark D and Dumontier, Michel and Aalbersberg, IJsbrand Jan and Appleton, Gabrielle and Axton, Myles and Baak, Arie and Blomberg, Niklas and Boiten, Jan-Willem and da Silva Santos, Luiz Bonino and Bourne, Philip E and others, journal=Scientific data, volume=3, number=1, pages=1--9, year=2016, publisher=Nature Publishing Group",
        "title": "The FAIR Guiding Principles for scientific data management and stewardship",
        "url": null,
        "venue": "Scientific data",
        "year": 2016
      },
      "exists": null,
      "explanation": "Introduces FAIR Guiding Principles, critical for data management in autonomous science.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Wilkinson, Sean R",
          "Aloqalaa, Meznah",
          "Belhajjame, Khalid",
          "Crusoe, Michael R",
          "de Paula Kinoshita, Bruno",
          "Gadelha, Luiz",
          "Garijo, Daniel",
          "Gustafsson, Ove Johan Ragnar",
          "Juty, Nick",
          "Kanwal, Sehrish",
          "others"
        ],
        "doi": null,
        "key": "wilkinson2025applying",
        "raw": "wilkinson2025applying: title=Applying the FAIR principles to computational workflows, author=Wilkinson, Sean R and Aloqalaa, Meznah and Belhajjame, Khalid and Crusoe, Michael R and de Paula Kinoshita, Bruno and Gadelha, Luiz and Garijo, Daniel and Gustafsson, Ove Johan Ragnar and Juty, Nick and Kanwal, Sehrish and others, journal=Scientific Data, volume=12, number=1, pages=328, year=2025, publisher=Nature Publishing Group UK London",
        "title": "Applying the FAIR principles to computational workflows",
        "url": null,
        "venue": "Scientific Data",
        "year": 2025
      },
      "exists": null,
      "explanation": "Applies FAIR principles specifically to computational workflows.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Renan Souza",
          "Amal Gueroudji",
          "Stephen DeWitt",
          "Daniel Rosendo",
          "Tirthankar Ghosal",
          "Robert Ross",
          "Prasanna Balaprakash",
          "Ferreira da Silva, Rafael"
        ],
        "doi": null,
        "key": "prov-agent",
        "raw": "prov-agent: author = Renan Souza and Amal Gueroudji and Stephen DeWitt and Daniel Rosendo and Tirthankar Ghosal and Robert Ross and Prasanna Balaprakash and Ferreira da Silva, Rafael, title = PROV-AGENT: Unified Provenance for TrackingAI Agent Interactions in Agentic Workflows, booktitle = 5th Workshop on Reproducible Workflows, Data Management, and Security, year = 2025",
        "title": "PROV-AGENT: Unified Provenance for TrackingAI Agent Interactions in Agentic Workflows",
        "url": null,
        "venue": "5th Workshop on Reproducible Workflows, Data Management, and Security",
        "year": 2025
      },
      "exists": null,
      "explanation": "Introduces PROV-AGENT for tracking AI agent interactions, addressing provenance challenges.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Tyler, Nicholas",
          "Knop, Robert",
          "Bard, Deborah",
          "Nugent, Peter"
        ],
        "doi": null,
        "key": "tyler2022cross",
        "raw": "tyler2022cross: title=Cross-facility workflows: Case studies with active experiments, author=Tyler, Nicholas and Knop, Robert and Bard, Deborah and Nugent, Peter, booktitle=2022 IEEE/ACM Workshop on Workflows in Support of Large-Scale Science (WORKS), pages=68--75, year=2022, organization=IEEE",
        "title": "Cross-facility workflows: Case studies with active experiments",
        "url": null,
        "venue": "2022 IEEE/ACM Workshop on Workflows in Support of Large-Scale Science (WORKS)",
        "year": 2022
      },
      "exists": null,
      "explanation": "Case studies on cross-facility workflows with active experiments.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Skluzacek, Tyler J",
          "Souza, Renan",
          "Coletti, Mark",
          "Suter, Frederic",
          "Ferreira da Silva, Rafael"
        ],
        "doi": null,
        "key": "skluzacek2024towards",
        "raw": "skluzacek2024towards: title=Towards cross-facility workflows orchestration through distributed automation, author=Skluzacek, Tyler J and Souza, Renan and Coletti, Mark and Suter, Frederic and Ferreira da Silva, Rafael, booktitle=Practice and Experience in Advanced Research Computing 2024: Human Powered Computing, pages=1--4, year=2024",
        "title": "Towards cross-facility workflows orchestration through distributed automation",
        "url": null,
        "venue": "Practice and Experience in Advanced Research Computing 2024",
        "year": 2024
      },
      "exists": null,
      "explanation": "Discusses cross-facility workflow orchestration through distributed automation.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Marketing AI Institute"
        ],
        "doi": null,
        "key": "bbva2024chatgpt",
        "raw": "bbva2024chatgpt: title=Enterprise Adoption of ChatGPT: How It's Actually Going, author=Marketing AI Institute, year=2024, month=December, url=https://www.marketingaiinstitute.com/blog/enterprise-adoption-chatgpt-ai",
        "title": "Enterprise Adoption of ChatGPT: How It's Actually Going",
        "url": "https://www.marketingaiinstitute.com/blog/enterprise-adoption-chatgpt-ai",
        "venue": "Marketing AI Institute Blog",
        "year": 2024
      },
      "exists": null,
      "explanation": "Industry report on enterprise adoption of ChatGPT, used for context on AI excitement.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Bran, Andres M",
          "Cox, Sam",
          "Schilter, Oliver",
          "Baldassari, Carlo",
          "White, Andrew D",
          "Schwaller, Philippe"
        ],
        "doi": null,
        "key": "bran2024augmenting",
        "raw": "bran2024augmenting: title=Augmenting large language models with chemistry tools, author=Bran, Andres M and Cox, Sam and Schilter, Oliver and Baldassari, Carlo and White, Andrew D and Schwaller, Philippe, journal=Nature Machine Intelligence, volume=6, number=5, pages=525--535, year=2024, publisher=Nature Publishing Group",
        "title": "Augmenting large language models with chemistry tools",
        "url": null,
        "venue": "Nature Machine Intelligence",
        "year": 2024
      },
      "exists": null,
      "explanation": "Demonstrates augmenting LLMs with chemistry tools (ChemChow), a key agentic workflow example.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "TechCrunch"
        ],
        "doi": null,
        "key": "chatgpt2025",
        "raw": "chatgpt2025: title=ChatGPT: Everything you need to know about the AI chatbot, author=TechCrunch, year=2025, month=February, url=https://techcrunch.com/2025/07/18/chatgpt-everything-to-know-about-the-ai-chatbot/",
        "title": "ChatGPT: Everything you need to know about the AI chatbot",
        "url": "https://techcrunch.com/2025/07/18/chatgpt-everything-to-know-about-the-ai-chatbot/",
        "venue": "TechCrunch",
        "year": 2025
      },
      "exists": null,
      "explanation": "News article providing general background on ChatGPT adoption.",
      "notes": "Non-academic source used for general industry context.",
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Deloitte Insights"
        ],
        "doi": null,
        "key": "deloitte2025",
        "raw": "deloitte2025: title=Autonomous generative AI agents, author=Deloitte Insights, year=2025, organization=Deloitte, url=https://www.deloitte.com/us/en/insights/industry/technology/technology-media-and-telecom-predictions/2025/autonomous-generative-ai-agents-still-under-development.html",
        "title": "Autonomous generative AI agents",
        "url": "https://www.deloitte.com/us/en/insights/industry/technology/technology-media-and-telecom-predictions/2025/autonomous-generative-ai-agents-still-under-development.html",
        "venue": "Deloitte Insights",
        "year": 2025
      },
      "exists": null,
      "explanation": "Industry report on autonomous generative AI agents.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "IBM"
        ],
        "doi": null,
        "key": "ibm2025ai",
        "raw": "ibm2025ai: title=AI Agents in 2025: Expectations vs. Reality, author=IBM, year=2025, month=June, organization=IBM, url=https://www.ibm.com/think/insights/ai-agents-2025-expectations-vs-reality",
        "title": "AI Agents in 2025: Expectations vs. Reality",
        "url": "https://www.ibm.com/think/insights/ai-agents-2025-expectations-vs-reality",
        "venue": "IBM Think Insights",
        "year": 2025
      },
      "exists": null,
      "explanation": "Industry report on AI agent expectations versus reality.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "MacLeod, Benjamin P",
          "Parlane, Fraser GL",
          "Morrissey, Thomas D",
          "Häse, Florian",
          "Roch, Loïc M",
          "Dettelbach, Kevan E",
          "Moreira, Roberto",
          "Yunker, Lars PE",
          "Rooney, Michael B",
          "Deeth, Joseph R",
          "others"
        ],
        "doi": null,
        "key": "macleod2020self",
        "raw": "macleod2020self: title=Self-driving laboratory for accelerated discovery of thin-film materials, author=MacLeod, Benjamin P and Parlane, Fraser GL and Morrissey, Thomas D and Häse, Florian and Roch, Loïc M and Dettelbach, Kevan E and Moreira, Roberto and Yunker, Lars PE and Rooney, Michael B and Deeth, Joseph R and others, journal=Science Advances, volume=6, number=20, pages=eaaz8867, year=2020, publisher=American Association for the Advancement of Science",
        "title": "Self-driving laboratory for accelerated discovery of thin-film materials",
        "url": null,
        "venue": "Science Advances",
        "year": 2020
      },
      "exists": null,
      "explanation": "Describes a self-driving laboratory for thin-film materials discovery (Ada).",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "OpenAI"
        ],
        "doi": null,
        "key": "openai2023enterprise",
        "raw": "openai2023enterprise: title=Introducing ChatGPT Enterprise, author=OpenAI, year=2023, month=August, organization=OpenAI, url=https://openai.com/index/introducing-chatgpt-enterprise/",
        "title": "Introducing ChatGPT Enterprise",
        "url": "https://openai.com/index/introducing-chatgpt-enterprise/",
        "venue": "OpenAI Blog",
        "year": 2023
      },
      "exists": null,
      "explanation": "Announcement of ChatGPT Enterprise, used for context on industry adoption.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    }
  ],
  "missing_references": [
    {
      "reason": "Seminal work (Boiko et al., Nature 2023) on using LLMs for autonomous chemistry (Coscientist), which is highly relevant to the agentic workflows discussed in the paper's framework.",
      "title": "Autonomous chemical research with large language models"
    },
    {
      "reason": "Foundational text (Hey et al., 2009) that established the vision for data-intensive science, providing important historical context for the proposed evolutionary framework.",
      "title": "The Fourth Paradigm: Data-Intensive Scientific Discovery"
    }
  ],
  "summary": "The paper demonstrates exceptional citation hygiene, effectively bridging foundational grid computing standards with cutting-edge AI agent research. The bibliography is remarkably current, incorporating multiple 2025 references that represent the state-of-the-art in autonomous science. Citations are used strategically to support the proposed evolutionary framework and architectural vision, providing robust technical and empirical context for the shift towards agentic workflows."
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.78,
  "questions": [
    "Can the authors provide a quantitative decomposition of the 10–100× acceleration figure, specifying what fraction derives from reduced iteration latency, increased parallelism, and improved exploration efficiency, with per-factor citable numbers from primary experimental results?",
    "What is the intended formal class of the meta-optimization operator Ω—Turing-complete rewriter, restricted higher-order function, or POMDP policy—and what does that imply for the decidability and verifiability claims in Section 3.2?",
    "Federated learning is placed at [Mesh × Learning] despite its standard characterization as hierarchical (central aggregator + clients), and PSO appears at [Swarm × Learning] rather than [Swarm × Optimizing]; can the authors justify or revise these placements with explicit classification criteria?",
    "The paper discusses multi-institutional governance but does not address concrete failure modes such as a malfunctioning autonomous agent triggering irreversible physical experiments across facilities; what safety, rollback, and human-override mechanisms are envisioned at the [Intelligent × Swarm] level?",
    "Key deployed agentic systems such as Coscientist (Boiko et al., Nature 2023) are absent from the bibliography; how does the proposed framework position itself relative to such systems, and would their inclusion alter any cell placements in the 5×5 matrix?"
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "The 100× figure appears multiple times but is attributed only to [autonomousscience] (a community roadmap/position piece). No quantitative model, benchmark, simulation, or case-study calculation is presented to justify the multiplier. The drug-discovery 'years → weeks' specific instance is given without a baseline, methodology, or citation.",
      "id": "weakness-1",
      "locator": "Abstract; Section 1; Section 5.2 (Accelerated Time to Discovery); Section 7",
      "required_update": "Either (a) downgrade the language to 'community-projected' / 'aspirational' and clearly attribute the figure, or (b) ship a quantitative back-of-the-envelope model — e.g., experiments/acceleration_model/discovery_speedup.py that decomposes the speedup into iteration-time, parallelism, and exploration-efficiency factors with citable per-factor numbers from szymanski2023autonomous, macleod2020self, etc.",
      "source_path": "corrections/2509.09915/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Abstract; Section 1; Section 5.2 (Accelerated Time to Discovery); Section 7` is corrected or justified.",
      "weakness_index": 0
    },
    {
      "evidence": "This is a strong quantitative speed-up claim (years → weeks, i.e., ~50×) presented without a citation, baseline, or accounting for biological-validation steps that remain rate-limiting (animal models, clinical trials). The neighbouring references (autonomousscience, balaprakash2025swarm) do not provide a per-stage drug-discovery timeline analysis.",
      "id": "weakness-2",
      "locator": "Section 5.2 (Accelerated Time to Discovery)",
      "required_update": "Cite a concrete example from the closed-loop drug-discovery literature (e.g., Insilico Medicine's INS018_055 timeline, or Sanofi-Exscientia partnerships) with verifiable timelines, or scope the claim to lead-identification / hit-to-lead specifically rather than 'drug discovery' broadly.",
      "source_path": "corrections/2509.09915/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 5.2 (Accelerated Time to Discovery)` is corrected or justified.",
      "weakness_index": 1
    },
    {
      "evidence": "The load-bearing state-machine formalism, intelligence/composition taxonomy, and 5x5 evolution matrix are not supplied as a machine-checkable model or proof artifact; an artifact such as artifacts/formal/state_machine_taxonomy.lean or artifacts/model/evolution_matrix.tla would be needed to reproduce the theoretical claims.",
      "id": "weakness-3",
      "locator": "code release and execution entrypoints",
      "required_update": "Release the source code, scripts, model configuration, and execution entrypoints needed to regenerate the reported tables, or document why those artifacts cannot be released.",
      "source_path": "intelligence/composition",
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "code",
      "verification_check": "Re-review should confirm runnable code or a documented non-release justification is present.",
      "weakness_index": 2
    },
    {
      "evidence": "The paper does not define reproducible evaluation metrics, experiments, simulations, baselines, or validation protocols for the proposed architecture, roadmap, or acceleration claims.",
      "id": "weakness-4",
      "locator": "evaluation and statistical-testing pipeline",
      "required_update": "Publish evaluation scripts or executable pseudocode for walk-forward retraining, validation selection, HAC/bootstrap settings, benchmark construction, and table regeneration.",
      "source_path": "HAC/bootstrap",
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "code",
      "verification_check": "Re-review should confirm the evaluation pipeline can reproduce the reported statistical tests and benchmarks.",
      "weakness_index": 3
    },
    {
      "evidence": "This is a conceptual claim, not an empirical one. The reduction is intuitive for reactive agents but glosses over essential differences: LLM-based agents are stochastic (δ becomes a conditional distribution P(s'|s,a)), have unbounded continuous state (token contexts), and frequently rewrite their own goal/state space at runtime — which is not captured by a fixed (S, Σ, δ, s₀, F) tuple. The paper introduces M' = Ω(M, C, G) to handle this but does not formalize Ω or show that it lies within any standard automata-theoretic class.",
      "id": "weakness-5",
      "locator": "Section 3.1",
      "required_update": "Either (a) generalize the abstraction explicitly to probabilistic / infinite-state / self-modifying transition systems (POMDPs, higher-order automata, reflection in process calculi) and cite the relevant formalisms, or (b) acknowledge the abstraction is a metaphor rather than a unifying formal model.",
      "source_path": "corrections/2509.09915/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 3.1` is corrected or justified.",
      "weakness_index": 4
    },
    {
      "evidence": "The matrix is a useful descriptive device, but several cells are populated by examples whose classification is debatable: 'Federated' learning is placed at [Mesh × Learning], yet federated learning is commonly described as hierarchical (central aggregator + clients). 'Particle Swarm Optimization' appears at [Swarm × Learning], yet PSO is typically a derivative-free optimization method (Optimizing) rather than a Learning system per the paper's own definition (δ_{t+1} = L(δ_t, H)). The matrix is not validated against an external corpus of workflow systems.",
      "id": "weakness-6",
      "locator": "Section 3.4, Table 3",
      "required_update": "Provide explicit classification criteria, reclassify ambiguous cells (Federated → Hierarchical or split), and validate the taxonomy by classifying ≥20 real WMSs from suter2025fgcs into the matrix with rationale (e.g., a CSV at data/wms_classification.csv).",
      "source_path": "corrections/2509.09915/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 3.4, Table 3` is corrected or justified.",
      "weakness_index": 5
    }
  ],
  "strengths": [
    "The 5×5 intelligence-by-composition matrix provides a concrete, navigable taxonomy that maps established workflow systems to a shared conceptual space and supports incremental migration planning without requiring replacement of existing infrastructure.",
    "The architectural blueprint grounds abstract principles in specific infrastructure components (Globus Auth, AMQP message fabric, AI Hub extension), making the roadmap actionable for facility and infrastructure planners.",
    "The bibliography is exceptionally current, incorporating multiple 2025 publications on workflow terminology, federated agents, and distributed orchestration, demonstrating command of a rapidly evolving literature.",
    "The unification of classical DAG-based workflow execution and LLM-based agent behavior under a shared state-machine vocabulary bridges two communities that rarely cite each other and offers a common analytical lens.",
    "The challenge taxonomy—physical-digital divide, adaptive provenance, multi-institutional governance—is grounded in cited real deployments (A-lab, Ada self-driving laboratory, cross-facility case studies) and identifies specific, actionable research directions for both the AI and workflow communities."
  ],
  "summary": "The paper proposes a two-dimensional evolutionary framework for scientific workflows—intelligence (static → intelligent) and composition (single → swarm)—organized as a 5×5 matrix, accompanied by an architectural blueprint for autonomous scientific laboratories. The four specialist reviews converge on a broadly positive but conditional assessment. Novelty (score 0.7, verdict 'significant', confidence 0.9) and citation quality (confidence 0.95) are strong, with the framework building coherently on a series of prior works from the same community. Technical correctness (confidence 0.7, overall 'mostly_sound') found 14 claims, of which two carry major severity: the 10–100× discovery acceleration promise attributed solely to a community roadmap position piece [autonomousscience] (C3) and the 'drug-discovery years → weeks' speed-up asserted without citation or baseline (C12); additional minor issues include the systematic misspelling of ChemCrow as 'ChemChow', ambiguous per-node vs. aggregate complexity counts, and unvalidated 5×5 matrix cell placements. Reproducibility (score 0.12/1.0, confidence 0.9) is the most serious concern: two critical-severity gaps were identified—no machine-checkable proof or formal model artifact for the state-machine taxonomy, and no reproducible evaluation protocol—plus three major-severity gaps covering absence of a paper-specific repository, data, and runnable environment. Per the code-amenable-field recommendation gate (cs.* domain, reproducibility flagged missing proof-as-code artifact at critical severity), the recommendation defaults to major_revision. Specialists do not disagree on the paper's conceptual contribution or relevance; the path to acceptance requires addressing the unsupported quantitative claims and providing at minimum a formal artifact and an evaluation protocol.",
  "weaknesses": [
    "The 10–100× discovery acceleration claim, repeated in the Abstract and Sections 1 and 5.2, is attributed solely to a community roadmap position piece [autonomousscience] with no quantitative model, simulation, or case-study calculation substantiating the multiplier (technical_correctness C3, major severity).",
    "The drug-discovery 'years → weeks' speed-up in Section 5.2 is asserted without citation, baseline, or acknowledgment that biological-validation steps remain rate-limiting, implying an unscoped ~50× acceleration with no primary evidence (technical_correctness C12, major severity).",
    "No machine-checkable proof or formal model artifact is provided for the load-bearing state-machine formalism, intelligence/composition taxonomy, or 5×5 evolution matrix; the reproducibility specialist (critical severity) identified this as preventing independent verification of the theoretical claims.",
    "No reproducible evaluation protocol, simulation, benchmark, or validation experiment is defined for any aspect of the proposed architecture or roadmap, leaving all empirical claims unverifiable by an independent party (reproducibility, critical severity).",
    "The FSM abstraction M = (S, Σ, δ, s₀, F) does not account for the stochastic, infinite-state, and self-modifying character of LLM-based agents, and several 5×5 matrix cell placements (e.g., Federated at [Mesh × Learning], PSO at [Swarm × Learning]) are inconsistent with the paper's own definitions (technical_correctness C1, C10, C11, minor severity).",
    "The taxonomy is unvalidated against an independent corpus of workflow systems, and key complexity claims (e.g., O(k) swarm communication without specifying per-node vs. aggregate, hierarchical 'O(n) channels per level') contain ambiguities that weaken the formal argumentation (technical_correctness C2, C13, minor severity)."
  ]
}
```

### novelty (`gemini-3-flash-preview`) — status: `pass`

```json
{
  "confidence": 0.9,
  "missing_prior_art": [
    {
      "reason": "The paper heavily focuses on LLM-based agents and 'swarms', yet misses foundational work on Agent-Based Modeling (ABM) and multi-agent coordination frameworks (e.g., JADE, AgentSpeak) that have addressed decentralized coordination in non-LLM contexts for decades.",
      "title": "Agent-Based Coordination Frameworks"
    }
  ],
  "novelty_score": 0.7,
  "related_work": [
    {
      "citation_key": "ferreiradasilva2024computer",
      "delta": "While the 2024 paper identified 'Frontiers' in pervasive integration with HPC, this manuscript provides a formal state-machine-based unifying framework and a two-dimensional taxonomy (Intelligence vs. Composition) to map that evolution.",
      "relation": "builds_on",
      "title": "Frontiers in Scientific Workflows: Pervasive Integration with HPC"
    },
    {
      "citation_key": "suter2025fgcs",
      "delta": "The 2025 FGCS paper established a vocabulary and terminology; this work leverages that terminology to propose a prescriptive architectural blueprint and a specific $5 \\times 5$ evolution matrix.",
      "relation": "builds_on",
      "title": "A Terminology for Scientific Workflow Systems"
    },
    {
      "citation_key": "balaprakash2025swarm",
      "delta": "SWARM reimaged workflows in a distributed world; this paper abstracts 'swarm' as one level of a broader composition dimension and integrates it with an intelligence hierarchy.",
      "relation": "builds_on",
      "title": "SWARM: Reimagining scientific workflow management systems in a distributed world"
    },
    {
      "citation_key": "autonomousscience",
      "delta": "This manuscript acts as the technical and architectural follow-up to the grassroots roadmap, providing the 'how' via the state machine abstraction and layered architecture.",
      "relation": "builds_on",
      "title": "A Grassroots Network and Community Roadmap for Interconnected Autonomous Science Laboratories for Accelerated Discovery"
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
      "description": "No paper-specific repository, release, license, commit, reference implementation, or executable artifact is provided for the proposed evolution framework or architectural blueprint; the reachable GitHub repositories in the input are cited related work rather than this paper's implementation.",
      "severity": "major"
    },
    {
      "area": "code",
      "description": "The load-bearing state-machine formalism, intelligence/composition taxonomy, and 5x5 evolution matrix are not supplied as a machine-checkable model or proof artifact; an artifact such as artifacts/formal/state_machine_taxonomy.lean or artifacts/model/evolution_matrix.tla would be needed to reproduce the theoretical claims.",
      "severity": "critical"
    },
    {
      "area": "data",
      "description": "No public dataset, workflow traces, benchmark suite, facility logs, or case-study inputs are provided to substantiate or reproduce claims about multi-facility coordination overhead, autonomous lab behavior, or 10-100x discovery acceleration.",
      "severity": "major"
    },
    {
      "area": "evaluation",
      "description": "The paper does not define reproducible evaluation metrics, experiments, simulations, baselines, or validation protocols for the proposed architecture, roadmap, or acceleration claims.",
      "severity": "critical"
    },
    {
      "area": "compute",
      "description": "No runnable environment is specified for any reference system or simulation: hardware topology, software versions, agent models, seeds, network assumptions, and deployment configuration are absent.",
      "severity": "major"
    }
  ],
  "confidence": 0.9,
  "data_availability": "unspecified",
  "data_url": null,
  "environment": null,
  "reproducibility_score": 0.12
}
```

### summary (`claude-haiku-4-5-20251001`) — status: `pass`

```json
{
  "audience": "Researchers in scientific computing, computational science facilities, and workflow management; AI and agent system developers; scientific domain experts in materials science, chemistry, and physics; facility managers and infrastructure planners; and policymakers designing scientific research infrastructure",
  "key_contributions": [
    "A conceptual framework that unifies traditional scientific workflows and AI agents through the state machine abstraction, revealing two evolutionary dimensions—intelligence (static to intelligent) and composition (single to swarm)—that provide a roadmap from current systems to autonomous science",
    "An architectural blueprint for autonomous scientific laboratories that demonstrates how scientific discovery would evolve with increasing autonomy across the intelligence and composition dimensions",
    "A comprehensive identification of challenges and strategic bets required from both the AI community (for developing physical-digital reasoning, multimodal understanding, and governance) and the scientific workflows community (for distributed orchestration, adaptive provenance, and multi-institutional interoperability)"
  ],
  "plain_language_summary": "Modern scientific discovery requires coordinating many distributed facilities and instruments, forcing researchers to spend time managing workflows rather than conducting science. This paper proposes an evolutionary framework to guide how scientific workflows can incorporate artificial intelligence and autonomous agents. The framework uses two key dimensions: intelligence (how much the system can learn and adapt, from static to fully intelligent) and composition (how multiple systems coordinate, from single machines to swarm-like collective behavior). By treating both traditional workflows and AI agents as state machines with varying sophistication, the authors show practical pathways for incremental improvement rather than disruptive replacement.\n\nThe paper presents an architectural blueprint that embodies this evolution and identifies concrete challenges and opportunities. Key obstacles include the physical-digital divide (AI systems must handle irreversible experiments and causal reasoning), the need for reproducibility and provenance in intelligent workflows, and governance challenges in multi-institutional settings where AI agents operate autonomously. The authors argue that realizing autonomous science requires coordinated advancement across both dimensions, with strategic investments in learning infrastructure, optimization frameworks, and reasoning engines. The framework aims to preserve existing workflow infrastructure investments while enabling new autonomous capabilities.",
  "tldr": "A conceptual framework positioning scientific workflows on two evolutionary dimensions—intelligence and composition—to guide the transition from current systems to fully autonomous distributed scientific laboratories."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `warn`

```json
{
  "claims": [
    {
      "assessment": "partially_supported",
      "claim": "The execution model of scientific workflows can be expressed as finite state machines M = (S, Σ, δ, s₀, F), and DAG workflows directly map to this model with nodes as states and edges as transitions.",
      "evidence": "The mapping is plausible for simple DAGs but the paper itself acknowledges later that modern workflows include cycles, conditional branches, and human-in-the-loop components (Section 2.1). A DAG with shared data dependencies is more naturally a labeled transition system / Petri net than a classical finite-state automaton, and the paper does not address how parallel branches, asynchronous events, or partial-state observability are folded into Σ and δ. The bibliography (Russell & Norvig) is cited for the agent definition, not for the FSM reduction.",
      "id": "C1",
      "location": "Section 3.1 (Autonomy: State Machine Abstraction)",
      "severity": "minor",
      "suggested_fix": "Clarify whether M is intended as a labeled transition system, a Mealy/Moore machine, or a Markov decision process; address how concurrent task execution is represented (e.g., product automaton over independent branches) and cite the workflow-formal-semantics literature (Petri nets, CSP, π-calculus) that has formalized DAG execution."
    },
    {
      "assessment": "partially_supported",
      "claim": "Mesh composition with ∀i,j: M_i ↔ M_j demands O(n²) connections for all-to-all connectivity, while a swarm using emergence operator Φ uses only O(k) local communications, where k is the neighborhood size.",
      "evidence": "O(n²) for all-to-all and O(k) per node for local-neighborhood are textbook complexities and consistent with the verified_facts block (O(1), O(n), O(n²), O(k)). However the paper states swarm 'would use only O(k) local communications' without specifying per-node vs total: total communications in a k-regular interaction graph are O(nk), not O(k). Similarly the hierarchical 'O(n) channels per level' is ambiguous (total channels in an n-ary tree of depth d are Θ(n), not Θ(n) per level).",
      "id": "C2",
      "location": "Section 3.3 (Composition Dimension)",
      "severity": "minor",
      "suggested_fix": "State per-node vs aggregate channel counts explicitly (e.g., 'O(k) per agent, O(nk) total') and either give a short derivation or cite a standard reference (e.g., Kennedy & Eberhart 1995 for PSO topology, or distributed-systems texts) for each row of the composition table."
    },
    {
      "assessment": "unsupported",
      "claim": "The framework promises 10× to 100× acceleration in scientific discovery through intelligent coordination across distributed facilities.",
      "evidence": "The 100× figure appears multiple times but is attributed only to [autonomousscience] (a community roadmap/position piece). No quantitative model, benchmark, simulation, or case-study calculation is presented to justify the multiplier. The drug-discovery 'years → weeks' specific instance is given without a baseline, methodology, or citation.",
      "id": "C3",
      "location": "Abstract; Section 1; Section 5.2 (Accelerated Time to Discovery); Section 7",
      "severity": "major",
      "suggested_fix": "Either (a) downgrade the language to 'community-projected' / 'aspirational' and clearly attribute the figure, or (b) ship a quantitative back-of-the-envelope model — e.g., experiments/acceleration_model/discovery_speedup.py that decomposes the speedup into iteration-time, parallelism, and exploration-efficiency factors with citable per-factor numbers from szymanski2023autonomous, macleod2020self, etc."
    },
    {
      "assessment": "partially_supported",
      "claim": "Verification complexity increases from tractable for static δ to undecidable for meta-optimization Ω.",
      "evidence": "Reachability for general finite-state machines is PSPACE-complete (decidable but not tractable in the polynomial sense); reachability for general Turing-complete transition systems is undecidable. The paper conflates 'tractable' (polynomial-time) with 'decidable' and asserts undecidability of Ω without justifying that Ω is Turing-complete. No formal argument or citation accompanies the claim.",
      "id": "C4",
      "location": "Section 3.2 (Intelligence Dimension), penultimate paragraph",
      "severity": "minor",
      "suggested_fix": "Cite standard results (e.g., Rice's theorem, undecidability of LTL model checking for infinite-state systems) and tighten phrasing: 'static δ admits polynomial-time model checking; meta-optimization Ω in its general form is Turing-complete and hence verification is undecidable.' A short Coq/Lean sketch or pointer to a verification artifact (src/proofs/VerificationHierarchy.lean) would strengthen this."
    },
    {
      "assessment": "supported",
      "claim": "Berkeley A-lab processes 50–100 times more samples than humans daily, synthesizing 41 novel materials in 17 days.",
      "evidence": "The 41 novel materials / 17 days figure matches the headline of szymanski2023autonomous (Nature 624, 86–91, 2023). The '50–100×' sample throughput claim is paraphrased from the same reference. This is a reasonable use of a primary citation.",
      "id": "C5",
      "location": "Section 2.3 (AI Advances and Opportunities)",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "ChemChow integrates GPT-4 with 18 chemistry tools to autonomously plan synthesis.",
      "evidence": "The cited reference bran2024augmenting describes 'ChemCrow' (not 'ChemChow') as an LLM-based chemistry agent. The '18 tools' figure is consistent with the published system. The name spelling is incorrect throughout the paper.",
      "id": "C6",
      "location": "Section 2.3 (AI Advances and Opportunities)",
      "severity": "minor",
      "suggested_fix": "Rename 'ChemChow' to 'ChemCrow' to match bran2024augmenting (Nature Machine Intelligence 6, 525–535, 2024)."
    },
    {
      "assessment": "unsupported",
      "claim": "Autonomous materials discovery campaigns have evaluated over one million candidate compounds.",
      "evidence": "No citation supports this specific 'one million' figure. The neighbouring references (abolhasani2023rise, hysmith2024future) discuss self-driving labs at a high level but do not, in the form cited, anchor the one-million number.",
      "id": "C7",
      "location": "Section 5.1 (Autonomous Discovery)",
      "severity": "minor",
      "suggested_fix": "Cite a specific campaign (e.g., Merchant et al., GNoME 2023 evaluated ~2.2M stable crystals; or Szymanski 2023's candidate set) and quote the exact number from the source, or remove the claim."
    },
    {
      "assessment": "partially_supported",
      "claim": "By 2025, 99% of enterprise developers are exploring AI agents.",
      "evidence": "Cited to [ibm2025ai] (IBM Think Insights blog post). The figure is sourced but the original survey methodology and sample frame are not described, and a single industry blog post is thin evidence for a specific percentage claim in an academic paper.",
      "id": "C8",
      "location": "Section 2.3 (AI Advances and Opportunities)",
      "severity": "minor",
      "suggested_fix": "Quote the IBM source verbatim and characterise the sample (e.g., 'in a 2025 IBM developer survey, 99% of respondents…'), or supplement with a peer-reviewed industry-adoption reference."
    },
    {
      "assessment": "unsupported",
      "claim": "AI inference clusters require >400 Gbps interconnects for real-time consensus, with >100 Gbps networks for distributed-facility agent coordination.",
      "evidence": "Specific bandwidth thresholds are asserted without citation, without a model of message volume vs agent count, and without referencing existing AI-cluster designs (NVLink/NVSwitch, InfiniBand HDR/NDR, ESnet6). Whether 400 Gbps is needed for 'thousands of agents' is highly workload-dependent.",
      "id": "C9",
      "location": "Section 4.3 (Physical Infrastructure — The AI Hub Extension)",
      "severity": "minor",
      "suggested_fix": "Cite concrete deployments (e.g., NVIDIA DGX SuperPOD, Frontier/Aurora interconnects) and/or include a simple back-of-the-envelope bandwidth model (experiments/ai_hub_bandwidth/model.py) that ties the threshold to agent count, message size, and consensus round-trip budget."
    },
    {
      "assessment": "partially_supported",
      "claim": "The 5×5 evolution matrix forms a comprehensive taxonomy capturing the transition from current workflow systems to autonomous science, with cells populated by representative examples (Script, DAG, ML Pipeline, Hierarchical Multi-Agent, Particle Swarm Optimization, etc.).",
      "evidence": "The matrix is a useful descriptive device, but several cells are populated by examples whose classification is debatable: 'Federated' learning is placed at [Mesh × Learning], yet federated learning is commonly described as hierarchical (central aggregator + clients). 'Particle Swarm Optimization' appears at [Swarm × Learning], yet PSO is typically a derivative-free optimization method (Optimizing) rather than a Learning system per the paper's own definition (δ_{t+1} = L(δ_t, H)). The matrix is not validated against an external corpus of workflow systems.",
      "id": "C10",
      "location": "Section 3.4, Table 3",
      "severity": "minor",
      "suggested_fix": "Provide explicit classification criteria, reclassify ambiguous cells (Federated → Hierarchical or split), and validate the taxonomy by classifying ≥20 real WMSs from suter2025fgcs into the matrix with rationale (e.g., a CSV at data/wms_classification.csv)."
    },
    {
      "assessment": "partially_supported",
      "claim": "Both traditional workflows and modern AI agents share the state machine abstraction as a common foundation; AI agents 'operate on the same state machine principles but with enhanced transition functions.'",
      "evidence": "This is a conceptual claim, not an empirical one. The reduction is intuitive for reactive agents but glosses over essential differences: LLM-based agents are stochastic (δ becomes a conditional distribution P(s'|s,a)), have unbounded continuous state (token contexts), and frequently rewrite their own goal/state space at runtime — which is not captured by a fixed (S, Σ, δ, s₀, F) tuple. The paper introduces M' = Ω(M, C, G) to handle this but does not formalize Ω or show that it lies within any standard automata-theoretic class.",
      "id": "C11",
      "location": "Section 3.1",
      "severity": "minor",
      "suggested_fix": "Either (a) generalize the abstraction explicitly to probabilistic / infinite-state / self-modifying transition systems (POMDPs, higher-order automata, reflection in process calculi) and cite the relevant formalisms, or (b) acknowledge the abstraction is a metaphor rather than a unifying formal model."
    },
    {
      "assessment": "unsupported",
      "claim": "Drug-discovery pipelines requiring years of manual iteration could be compressed to weeks when AI agents continuously analyze results, adjust molecular structures, queue synthesis reactions, and perform experiments with robots.",
      "evidence": "This is a strong quantitative speed-up claim (years → weeks, i.e., ~50×) presented without a citation, baseline, or accounting for biological-validation steps that remain rate-limiting (animal models, clinical trials). The neighbouring references (autonomousscience, balaprakash2025swarm) do not provide a per-stage drug-discovery timeline analysis.",
      "id": "C12",
      "location": "Section 5.2 (Accelerated Time to Discovery)",
      "severity": "major",
      "suggested_fix": "Cite a concrete example from the closed-loop drug-discovery literature (e.g., Insilico Medicine's INS018_055 timeline, or Sanofi-Exscientia partnerships) with verifiable timelines, or scope the claim to lead-identification / hit-to-lead specifically rather than 'drug discovery' broadly."
    },
    {
      "assessment": "partially_supported",
      "claim": "The intelligence dimension forms five strictly accumulative evolutionary levels (Static → Adaptive → Learning → Optimizing → Intelligent), with each level a 'step increase' that subsumes prior capabilities.",
      "evidence": "The accumulation/ordering is asserted but not demonstrated. It is not obvious that 'Optimizing' (arg min J) strictly contains 'Learning' (δ_{t+1} = L(δ_t, H)) — these are orthogonal in much of the ML literature (an optimizer need not learn from history; a learner need not optimize a single scalar objective). Similarly 'Intelligent' (Ω) is presented as subsuming arg min J without justification.",
      "id": "C13",
      "location": "Section 3.2",
      "severity": "minor",
      "suggested_fix": "Either weaken to a partial order ('roughly increasing sophistication, not strictly nested') or define explicit subsumption relations (e.g., 'Optimizing extends Learning by introducing an explicit objective J that L implicitly approximates') and demonstrate via a small worked example for each transition."
    },
    {
      "assessment": "partially_supported",
      "claim": "Existing WMSs cluster at the top-left of the matrix at [Static × Pipeline] and [Adaptive × Pipeline], while [Intelligent × Swarm] represents autonomous science.",
      "evidence": "The placement is plausible and consistent with the cited workflow systems (Pegasus, FireWorks, Parsl). However, no systematic survey or classification exercise is presented; the claim relies on the authors' qualitative assessment.",
      "id": "C14",
      "location": "Section 3.4",
      "severity": "info",
      "suggested_fix": "Add a brief appendix or supplementary table that classifies the ~20 systems referenced in workflow-systems and suter2025fgcs into specific cells with citations and rationale."
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

1. ferreiradasilva2024computer: title = Frontiers in Scientific Workflows: Pervasive Integration with HPC, author = Ferreira da Silva, Rafael and Badia, Rosa M. and Bard, Deborah and Foster, Ian T. and Jha, Shantenu and Suter, Frédéric, journal = IEEE Computer, volume = 57, number = 8, pages = , year = 2024, doi = 10.1109/MC.2024.3401542 doi:[10.1109/MC.2024.3401542](https://doi.org/10.1109/MC.2024.3401542) arXiv:[2024.34015](https://arxiv.org/abs/2024.34015)
2. suter2025fgcs: title = A Terminology for Scientific Workflow Systems, author = Suter, Frédéric and Coleman, Tainã and Altintas, Ílkay and Badia, Rosa M. and Balis, Bartosz and Chard, Kyle and Colonnelli, Iacopo and Deelman, Ewa and Tommaso, Paolo Di and Fahringer, Thomas and Goble, Carole and Jha, Shantenu and Katz, Daniel S. and Köster, Johannes and Leser, Ulf and Mehta, Kshitij and Oliver, Hilary and Peterson, J.-Luc and Pizzi, Giovanni and Pottier, Loïc and Sirvent, Raül and Suchyta, Eric and Thain, Douglas and Wilkinson, Sean R. and Wozniak, Justin M. and Ferreira da Silva, Rafael, journal = Future Generation Computer Systems, volume = 174, number = , pages = , doi = 10.1016/j.future.2025.107974, year = 2025 doi:[10.1016/j.future.2025.107974](https://doi.org/10.1016/j.future.2025.107974) arXiv:[2025.10797](https://arxiv.org/abs/2025.10797)
3. autonomousscience: title = A Grassroots Network and Community Roadmap for Interconnected Autonomous Science Laboratories for Accelerated Discovery, author = Ferreira da Silva, Rafael and Abolhasani, Milad and Antonopoulos, Dionysios A and Biven, Laura and Coffee, Ryan and Foster, Ian T and Hamilton, Leslie and Jha, Shantenu and Mayer, Theresa and Mintz, Benjamin and Moore, Robert and Nimer, Salahudin and Paulson, Noah and Shin, Woong and Suter, Frédéric and Taheri, Mitra and Taufer, Michela and Washburn, Newell R., booktitle = 54th International Conference on Parallel Processing Companion (ICPP Companion '25), year = 2025, doi = 10.1145/3750720.3757292 doi:[10.1145/3750720.3757292](https://doi.org/10.1145/3750720.3757292)
4. pauloski2025empowering: title=Empowering Scientific Workflows with Federated Agents, author=Pauloski, J Gregory and Babuji, Yadu and Chard, Ryan and Sakarvadia, Mansi and Chard, Kyle and Foster, Ian, journal=arXiv preprint arXiv:2505.05428, year=2025 arXiv:[2505.05428](https://arxiv.org/abs/2505.05428)
5. antypas2021enabling: title=Enabling discovery data science through cross-facility workflows, author=Antypas, Katerina B and Bard, DJ and Blaschke, Johannes P and Canon, R Shane and Enders, Bjoern and Shankar, Mallikarjun Arjun and Somnath, Suhas and Stansberry, Dale and Uram, Thomas D and Wilkinson, Sean R, booktitle=2021 IEEE International Conference on Big Data (Big Data), pages=3671--3680, year=2021, organization=IEEE
6. abolhasani2023rise: title=The rise of self-driving labs in chemical and materials sciences, author=Abolhasani, Milad and Kumacheva, Eugenia, journal=Nature Synthesis, volume=2, number=6, pages=483--492, year=2023, publisher=Nature Publishing Group UK London
7. workflow-systems: author=Peter Amstutz and Maxim Mikheev and Michael R. Crusoe and Nebojša Tijanić and Samuel Lampa and others, title=Existing Workflow systems, howpublished=\urlhttps://s.apache.org/existing-workflow-systems, year=2024
8. suter2023escience: title = Driving Next-Generation Workflows from the Data Plane, author = Suter, Frédéric and Ferreira da Silva, Rafael and Gainaru, Ana and Klasky, Scott, booktitle = 19th IEEE Conference on eScience, pages = , year = 2023, doi = 10.1109/e-Science58273.2023.10254849 doi:[10.1109/e-Science58273.2023.10254849](https://doi.org/10.1109/e-Science58273.2023.10254849) arXiv:[2023.10254](https://arxiv.org/abs/2023.10254)
9. nouri2021exploring: title=Exploring the role of machine learning in scientific workflows: Opportunities and challenges, author=Nouri, Azita and Davis, Philip E and Subedi, Pradeep and Parashar, Manish, journal=arXiv preprint arXiv:2110.13999, year=2021 arXiv:[2110.13999](https://arxiv.org/abs/2110.13999)
10. badia2024integrating: title=Integrating HPC, AI, and Workflows for Scientific Data Analysis (Dagstuhl Seminar 23352), author=Badia, Rosa M and Berti-Equille, Laure and Ferreira da Silva, Rafael and Leser, Ulf, journal=Dagstuhl Reports, volume=13, number=8, pages=129--164, year=2024, publisher=Schloss Dagstuhl--Leibniz-Zentrum f\"ur Informatik
11. deelman2023artificial: title=How is artificial intelligence changing science?, author=Deelman, Ewa, booktitle=2023 IEEE 19th International Conference on e-Science (e-Science), pages=1--4, year=2023, organization=IEEE
12. brewer2025: title=AI-coupled HPC Workflow Applications, Middleware and Performance, author=Wes Brewer and Ana Gainaru and Frédéric Suter and Feiyi Wang and Murali Emani and Shantenu Jha, year=2025, eprint=2406.14315, archivePrefix=arXiv, primaryClass=cs.DC, howpublished= \urlhttps://arxiv.org/abs/2406.14315 arXiv:[2406.14315](https://arxiv.org/abs/2406.14315)
13. tuecke2016globus: title=Globus Auth: A research identity and access management platform, author=Tuecke, Steven and Ananthakrishnan, Rachana and Chard, Kyle and Lidman, Mattias and McCollam, Brendan and Rosen, Stephen and Foster, Ian, booktitle=2016 IEEE 12th International Conference on e-Science (e-Science), pages=203--212, year=2016, organization=IEEE
14. allen2012software: title=Software as a service for data scientists, author=Allen, Bryce and Bresnahan, John and Childers, Lisa and Foster, Ian and Kandaswamy, Gopi and Kettimuthu, Raj and Kordas, Jack and Link, Mike and Martin, Stuart and Pickett, Karl and others, journal=Communications of the ACM, volume=55, number=2, pages=81--88, year=2012, publisher=ACM New York, NY, USA
15. foster2005modeling: title=Modeling and managing state in distributed systems: The role of OGSI and WSRF, author=Foster, Ian and Czajkowski, Karl and Ferguson, DE and Frey, Jeffrey and Graham, Steve and Maguire, Tom and Snelling, David and Tuecke, Steven, journal=Proceedings of the IEEE, volume=93, number=3, pages=604--612, year=2005, publisher=IEEE
16. talia2002open: title=The open grid services architecture: Where the grid meets the web, author=Talia, Domenico, journal=IEEE Internet Computing, volume=6, number=6, pages=67--71, year=2002, publisher=IEEE
17. standard2012oasis: title=Oasis advanced message queuing protocol (amqp) version 1.0, author=Standard, OASIS, journal=International Journal of Aerospace Engineering Hindawi www. hindawi. com, volume=2018, year=2012
18. hysmith2024future: title=The future of self-driving laboratories: from human in the loop interactive AI to gamification, author=Hysmith, Holland and Foadian, Elham and Padhy, Shakti P and Kalinin, Sergei V and Moore, Rob G and Ovchinnikova, Olga S and Ahmadi, Mahshid, journal=Digital Discovery, volume=3, number=4, pages=621--636, year=2024, publisher=Royal Society of Chemistry
19. lordan2024taming: title=Taming the Swarm: A Role-Based Approach for Autonomous Agents, author=Lordan, Francesc and Casas-Moreno, Xavier and Cummins, Philip and Conejero, Javier and Badia, Rosa M and Sirvent, Ra\"ul, booktitle=European Conference on Parallel Processing, pages=15--25, year=2024, organization=Springer
20. balaprakash2025swarm: title=SWARM: Reimagining scientific workflow management systems in a distributed world, author=Balaprakash, Prasanna and Raghavan, Krishnan and Cappello, Franck and Deelman, Ewa and Mandal, Anirban and Jin, Hongwei and Mahmud, Imtiaz and Thareja, Komal and Wu, Shixun and Zuk, Pawel and others, journal=The International Journal of High Performance Computing Applications, pages=10943420251339317, year=2025, publisher=SAGE Publications Sage UK: London, England
21. wilkinson2016fair: title=The FAIR Guiding Principles for scientific data management and stewardship, author=Wilkinson, Mark D and Dumontier, Michel and Aalbersberg, IJsbrand Jan and Appleton, Gabrielle and Axton, Myles and Baak, Arie and Blomberg, Niklas and Boiten, Jan-Willem and da Silva Santos, Luiz Bonino and Bourne, Philip E and others, journal=Scientific data, volume=3, number=1, pages=1--9, year=2016, publisher=Nature Publishing Group
22. wilkinson2025applying: title=Applying the FAIR principles to computational workflows, author=Wilkinson, Sean R and Aloqalaa, Meznah and Belhajjame, Khalid and Crusoe, Michael R and de Paula Kinoshita, Bruno and Gadelha, Luiz and Garijo, Daniel and Gustafsson, Ove Johan Ragnar and Juty, Nick and Kanwal, Sehrish and others, journal=Scientific Data, volume=12, number=1, pages=328, year=2025, publisher=Nature Publishing Group UK London
23. prov-agent: author = Renan Souza and Amal Gueroudji and Stephen DeWitt and Daniel Rosendo and Tirthankar Ghosal and Robert Ross and Prasanna Balaprakash and Ferreira da Silva, Rafael, title = PROV-AGENT: Unified Provenance for TrackingAI Agent Interactions in Agentic Workflows, booktitle = 5th Workshop on Reproducible Workflows, Data Management, and Security, year = 2025
24. tyler2022cross: title=Cross-facility workflows: Case studies with active experiments, author=Tyler, Nicholas and Knop, Robert and Bard, Deborah and Nugent, Peter, booktitle=2022 IEEE/ACM Workshop on Workflows in Support of Large-Scale Science (WORKS), pages=68--75, year=2022, organization=IEEE
25. skluzacek2024towards: title=Towards cross-facility workflows orchestration through distributed automation, author=Skluzacek, Tyler J and Souza, Renan and Coletti, Mark and Suter, Frederic and Ferreira da Silva, Rafael, booktitle=Practice and Experience in Advanced Research Computing 2024: Human Powered Computing, pages=1--4, year=2024
26. bbva2024chatgpt: title=Enterprise Adoption of ChatGPT: How It's Actually Going, author=Marketing AI Institute, year=2024, month=December, url=https://www.marketingaiinstitute.com/blog/enterprise-adoption-chatgpt-ai
27. bran2024augmenting: title=Augmenting large language models with chemistry tools, author=Bran, Andres M and Cox, Sam and Schilter, Oliver and Baldassari, Carlo and White, Andrew D and Schwaller, Philippe, journal=Nature Machine Intelligence, volume=6, number=5, pages=525--535, year=2024, publisher=Nature Publishing Group
28. chatgpt2025: title=ChatGPT: Everything you need to know about the AI chatbot, author=TechCrunch, year=2025, month=February, url=https://techcrunch.com/2025/07/18/chatgpt-everything-to-know-about-the-ai-chatbot/
29. deloitte2025: title=Autonomous generative AI agents, author=Deloitte Insights, year=2025, organization=Deloitte, url=https://www.deloitte.com/us/en/insights/industry/technology/technology-media-and-telecom-predictions/2025/autonomous-generative-ai-agents-still-under-development.html
30. ibm2025ai: title=AI Agents in 2025: Expectations vs. Reality, author=IBM, year=2025, month=June, organization=IBM, url=https://www.ibm.com/think/insights/ai-agents-2025-expectations-vs-reality
31. macleod2020self: title=Self-driving laboratory for accelerated discovery of thin-film materials, author=MacLeod, Benjamin P and Parlane, Fraser GL and Morrissey, Thomas D and Häse, Florian and Roch, Loïc M and Dettelbach, Kevan E and Moreira, Roberto and Yunker, Lars PE and Rooney, Michael B and Deeth, Joseph R and others, journal=Science Advances, volume=6, number=20, pages=eaaz8867, year=2020, publisher=American Association for the Advancement of Science
32. openai2023enterprise: title=Introducing ChatGPT Enterprise, author=OpenAI, year=2023, month=August, organization=OpenAI, url=https://openai.com/index/introducing-chatgpt-enterprise/
33. roch2020chemos: title=ChemOS: An orchestration software to democratize autonomous discovery, author=Roch, Loïc M and Häse, Florian and Kreisbeck, Christoph and Tamayo-Mendoza, Teresa and Yunker, Lars PE and Hein, Jason E and Aspuru-Guzik, Alán, journal=PLoS ONE, volume=15, number=4, pages=e0229862, year=2020, publisher=Public Library of Science
34. scienceagentbench2024: title=ScienceAgentBench: Toward Rigorous Assessment of Language Agents for Data-Driven Scientific Discovery, author=OSU-NLP-Group, journal=arXiv preprint arXiv:2410.05080, year=2024 arXiv:[2410.05080](https://arxiv.org/abs/2410.05080)
35. szymanski2023autonomous: title=An autonomous laboratory for the accelerated synthesis of novel materials, author=Szymanski, Nathan J and Rendy, Bernardus and Fei, Yuxing and Kumar, Rishi E and He, Tanjin and Milsted, David and McDermott, Matthew J and Gallant, Max and Cubuk, Ekin Dogus and Merchant, Amil and others, journal=Nature, volume=624, number=7990, pages=86--91, year=2023, publisher=Nature Publishing Group
36. tesla2024wiki: title=Tesla Autopilot, author=Wikipedia, year=2024, url=https://en.wikipedia.org/wiki/Tesla_Autopilot
37. tom2024selfdrivinglabs: title=Self-Driving Laboratories for Chemistry and Materials Science, author=Tom, Gary and Schmid, Stefan P and Baird, Sterling G and Cao, Yang and Darvish, Kourosh and Hao, Han and Lo, Stanley and Pablo-García, Sergio and Rajaonson, Ella M and Skreta, Marta and others, journal=Chemical Reviews, volume=124, number=16, pages=9633--9732, year=2024, publisher=American Chemical Society
38. uw2024tiktok: title=Q\&A: How TikTok's 'black box' algorithm and design shape user behavior, author=UW News, year=2024, month=April, organization=University of Washington, url=https://www.washington.edu/news/2024/04/24/tiktok-black-box-algorithm-and-design-user-behavior-recommendation/
39. waymo2024cnbc: title=Waymo dominated U.S. robotaxi market in 2024, but Tesla and Amazon's Zoox loom, author=CNBC, year=2024, month=December, organization=CNBC, url=https://www.cnbc.com/2024/12/26/waymo-dominated-us-robotaxi-market-in-2024-but-tesla-zoox-loom.html
40. wozniak2018candle: title=CANDLE/Supervisor: a workflow framework for machine learning applied to cancer research, author=Wozniak, Justin M and Jain, Rajeev and Balaprakash, Prasanna and Ozik, Jonathan and Collier, Nicholson T and Bauer, John and Xia, Fangfang and Brettin, Thomas and Stevens, Rick and Mohd-Yusof, Jamaludin and others, journal=BMC Bioinformatics, volume=19, number=18, pages=1--11, year=2018, publisher=BioMed Central
41. 8638041: author=Balaprakash, Prasanna and Salim, Michael and Uram, Thomas D. and Vishwanath, Venkat and Wild, Stefan M., booktitle=2018 IEEE 25th International Conference on High Performance Computing (HiPC), title=DeepHyper: Asynchronous Hyperparameter Search for Deep Neural Networks, year=2018, volume=, number=, pages=42-51, keywords=Search problems;Benchmark testing;Load modeling;Computational modeling;Training;Data models;Hyperparameter search;deep learning;model-based search;Bayesian optimization, doi=10.1109/HiPC.2018.00014 doi:[10.1109/HiPC.2018.00014](https://doi.org/10.1109/HiPC.2018.00014) arXiv:[2018.00014](https://arxiv.org/abs/2018.00014)
42. ribeiro2021robotic: title=Robotic process automation and artificial intelligence in industry 4.0--a literature review, author=Ribeiro, Jorge and Lima, Rui and Eckhardt, Tiago and Paiva, Sara, journal=Procedia Computer Science, volume=181, pages=51--58, year=2021, publisher=Elsevier
43. Jain2015: author = Jain, Anubhav and Ong, Shyue Ping and Chen, Wei and Medasani, Bharat and Qu, Xiaohui and Kocher, Michael and Brafman, Miriam and Petretto, Guido and Rignanese, Gian-Marco and Hautier, Geoffroy and Gunter, Daniel and Persson, Kristin A., title = FireWorks: a dynamic workflow system designed for high-throughput applications, journal = Concurrency and Computation: Practice and Experience, volume = 27, number = 17, pages = 5037--5059, year = 2015, doi = 10.1002/cpe.3505 doi:[10.1002/cpe.3505](https://doi.org/10.1002/cpe.3505)
44. deelman2019: author = Deelman, Ewa and Vahi, Karan and Rynge, Mats and Mayani, Rajiv and Ferreira da Silva, Rafael and Papadimitriou, George and Livny, Miron, title = The Evolution of the Pegasus Workflow Management Software, journal = Computing in Science \& Engineering, volume = 21, number = 4, pages = 22--36, year = 2019, doi = 10.1109/MCSE.2019.2919690 doi:[10.1109/MCSE.2019.2919690](https://doi.org/10.1109/MCSE.2019.2919690) arXiv:[2019.29196](https://arxiv.org/abs/2019.29196)
45. babuji2019: author = Babuji, Yadu and Woodard, Anna and Li, Zhuozhao and Katz, Daniel S. and Clifford, Ben and Kumar, Rohan and Lacinski, Lukasz and Chard, Ryan and Wozniak, Justin M. and Foster, Ian and Wilde, Michael and Chard, Kyle, title = Parsl: Pervasive Parallel Programming in Python, booktitle = Proceedings of the 28th International Symposium on High-Performance Parallel and Distributed Computing, series = HPDC '19, year = 2019, pages = 25--36, publisher = ACM, doi = 10.1145/3307681.3325400 doi:[10.1145/3307681.3325400](https://doi.org/10.1145/3307681.3325400)
46. prov_ech_continuum: author=Souza, Renan and Caino-Lores, Silvina and Coletti, Mark and Skluzacek, Tyler J. and Costan, Alexandru and Suter, Frédéric and Mattoso, Marta and Da Silva, Rafael Ferreira, booktitle=International Conference on e-Science (e-Science), title=Workflow Provenance in the Computing Continuum for Responsible, Trustworthy, and Energy-Efficient AI, year=2024,
47. russell2021artificial: author = Russell, Stuart J. and Norvig, Peter, title = Artificial Intelligence: A Modern Approach, edition = 4th, year = 2021, publisher = Pearson, address = Hoboken, NJ, pages = 1166, isbn = 978-0134610993, series = Pearson Series in Artificial Intelligence, note = Global Edition ISBN: 978-1292401133
48. altschul1990blast: title=Basic local alignment search tool, author=Altschul, Stephen F and Gish, Warren and Miller, Webb and Myers, Eugene W and Lipman, David J, journal=Journal of molecular biology, volume=215, number=3, pages=403--410, year=1990, publisher=Elsevier
49. yoo2003slurm: title=SLURM: Simple linux utility for resource management, author=Yoo, Andy B and Jette, Morris A and Grondona, Mark, booktitle=Workshop on job scheduling strategies for parallel processing, pages=44--60, year=2003, organization=Springer
50. deelman2015pegasus: title=Pegasus, a workflow management system for science automation, author=Deelman, Ewa and Vahi, Karan and Juve, Gideon and Rynge, Mats and Callaghan, Scott and Maechling, Philip J and Mayani, Rajiv and Chen, Weiwei and Da Silva, Rafael Ferreira and Livny, Miron and others, journal=Future Generation Computer Systems, volume=46, pages=17--35, year=2015, publisher=Elsevier
51. koster2012snakemake: title=Snakemake—a scalable bioinformatics workflow engine, author=K\"oster, Johannes and Rahmann, Sven, journal=Bioinformatics, volume=28, number=19, pages=2520--2522, year=2012, publisher=Oxford University Press
52. thain2005condor: title=Distributed computing in practice: the Condor experience, author=Thain, Douglas and Tannenbaum, Todd and Livny, Miron, booktitle=Concurrency and computation: practice and experience, volume=17, number=2-4, pages=323--356, year=2005, publisher=Wiley Online Library
53. henderson1995pbs: title=The portable batch system, author=Henderson, Robert L, booktitle=Workshop on Job Scheduling Strategies for Parallel Processing, pages=279--294, year=1995, organization=Springer
54. gropp1999mpi: title=Using MPI: portable parallel programming with the message-passing interface, author=Gropp, William and Lusk, Ewing and Skjellum, Anthony, volume=1, year=1999, publisher=MIT press
55. berger1984amr: title=Adaptive mesh refinement for hyperbolic partial differential equations, author=Berger, Marsha J and Oliger, Joseph, journal=Journal of computational Physics, volume=53, number=3, pages=484--512, year=1984, publisher=Elsevier
56. mckay1979lhs: title=Comparison of three methods for selecting values of input variables in the analysis of output from a computer code, author=McKay, M D and Beckman, R J and Conover, W J, journal=Technometrics, volume=21, number=2, pages=239--245, year=1979, publisher=Taylor \& Francis
57. nygard2007release: title=Release it!: design and deploy production-ready software, author=Nygard, Michael, year=2007, publisher=Pragmatic Bookshelf
58. richardson2018microservices: title=Microservices patterns: With examples in Java, author=Richardson, Chris, year=2018, publisher=Manning Publications
59. amstutz2016cwl: title=Common workflow language, v1.0, author=Amstutz, Peter and Crusoe, Michael R and Tijani\'c, Neboj\vsa and Chapman, Brad and Chilton, John and Heuer, Michael and Kartashov, Andrey and Leehr, Dan and M\'enager, Herv\'e and Nedeljkovich, Maya and others, year=2016, publisher=Figshare
60. zaharia2016spark: title=Apache spark: a unified engine for big data processing, author=Zaharia, Matei and Xin, Reynold S and Wendell, Patrick and Das, Tathagata and Armbrust, Michael and Dave, Ankur and Meng, Xiangrui and Rosen, Josh and Venkataraman, Shivaram and Franklin, Michael J and others, journal=Communications of the ACM, volume=59, number=11, pages=56--65, year=2016, publisher=ACM New York, NY, USA
61. vavilapalli2013yarn: title=Apache hadoop yarn: Yet another resource negotiator, author=Vavilapalli, Vinod Kumar and Murthy, Arun C and Douglas, Chris and Agarwal, Sharad and Konar, Mahadev and Evans, Robert and Graves, Thomas and Lowe, Jason and Shah, Hitesh and Seth, Siddharth and others, booktitle=Proceedings of the 4th annual Symposium on Cloud Computing, pages=1--16, year=2013
62. hindman2011mesos: title=Mesos: A platform for fine-grained resource sharing in the data center, author=Hindman, Benjamin and Konwinski, Andy and Zaharia, Matei and Ghodsi, Ali and Joseph, Anthony D and Katz, Randy and Shenker, Scott and Stoica, Ion, booktitle=NSDI, volume=11, pages=295--308, year=2011
63. stoica2001chord: title=Chord: A scalable peer-to-peer lookup service for internet applications, author=Stoica, Ion and Morris, Robert and Karger, David and Kaashoek, M Frans and Balakrishnan, Hari, booktitle=ACM SIGCOMM computer communication review, volume=31, number=4, pages=149--160, year=2001, organization=ACM
64. devine2002zoltan: title=Zoltan data management services for parallel dynamic applications, author=Devine, Karen and Boman, Erik and Heaphy, Robert and Hendrickson, Bruce and Vaughan, Courtenay, journal=Computing in Science \& Engineering, volume=4, number=2, pages=90--96, year=2002, publisher=IEEE
65. russo2018thompson: title=A tutorial on Thompson sampling, author=Russo, Daniel J and Van Roy, Benjamin and Kazerouni, Abbas and Osband, Ian and Wen, Zheng, journal=Foundations and Trends in Machine Learning, volume=11, number=1, pages=1--96, year=2018, publisher=Now Publishers, Inc.
66. cappe2004adaptive: title=Population monte carlo, author=Capp\'e, Olivier and Guillin, Arnaud and Marin, Jean-Michel and Robert, Christian P, journal=Journal of Computational and Graphical Statistics, volume=13, number=4, pages=907--929, year=2004, publisher=Taylor \& Francis
67. pedregosa2011sklearn: title=Scikit-learn: Machine learning in Python, author=Pedregosa, Fabian and Varoquaux, Ga\"el and Gramfort, Alexandre and Michel, Vincent and Thirion, Bertrand and Grisel, Olivier and Blondel, Mathieu and Prettenhofer, Peter and Weiss, Ron and Dubourg, Vincent and others, journal=Journal of machine learning research, volume=12, number=Oct, pages=2825--2830, year=2011
68. abadi2016tensorflow: title=Tensorflow: A system for large-scale machine learning, author=Abadi, Mart\'\in and Barham, Paul and Chen, Jianmin and Chen, Zhifeng and Davis, Andy and Dean, Jeffrey and Devin, Matthieu and Ghemawat, Sanjay and Irving, Geoffrey and Isard, Michael and others, booktitle=12th $\$USENIX$\$ symposium on operating systems design and implementation ($\$OSDI$\$ 16), pages=265--283, year=2016
69. kubeflow2018: title=Kubeflow: The machine learning toolkit for Kubernetes, author=Google, year=2018, howpublished=\urlhttps://www.kubeflow.org/
70. databricks2018mlflow: title=MLflow: A platform for the machine learning lifecycle, author=Databricks, year=2018, howpublished=\urlhttps://mlflow.org/
71. breiman2001random: title=Random forests, author=Breiman, Leo, journal=Machine learning, volume=45, number=1, pages=5--32, year=2001, publisher=Springer
72. chen2016xgboost: title=Xgboost: A scalable tree boosting system, author=Chen, Tianqi and Guestrin, Carlos, booktitle=Proceedings of the 22nd acm sigkdd international conference on knowledge discovery and data mining, pages=785--794, year=2016
73. mcmahan2017federated: title=Communication-efficient learning of deep networks from decentralized data, author=McMahan, Brendan and Moore, Eider and Ramage, Daniel and Hampson, Seth and y Arcas, Blaise Aguera, booktitle=Artificial intelligence and statistics, pages=1273--1282, year=2017, organization=PMLR
74. gupta2018split: title=Distributed learning of deep neural network over multiple agents, author=Gupta, Otkrist and Raskar, Ramesh, journal=Journal of Network and Computer Applications, volume=116, pages=1--8, year=2018, publisher=Elsevier
75. kennedy1995pso: title=Particle swarm optimization, author=Kennedy, James and Eberhart, Russell, booktitle=Proceedings of ICNN'95-international conference on neural networks, volume=4, pages=1942--1948, year=1995, organization=IEEE
76. zhan2009adaptive: title=Adaptive particle swarm optimization, author=Zhan, Zhi-Hui and Zhang, Jun and Li, Yun and Chung, Henry Shu-Hung, journal=IEEE Transactions on Systems, Man, and Cybernetics, Part B (Cybernetics), volume=39, number=6, pages=1362--1381, year=2009, publisher=IEEE
77. liu1989lbfgs: title=On the limited memory BFGS method for large scale optimization, author=Liu, Dong C and Nocedal, Jorge, journal=Mathematical programming, volume=45, number=1, pages=503--528, year=1989, publisher=Springer
78. hansen2001cmaes: title=Completely derandomized self-adaptation in evolution strategies, author=Hansen, Nikolaus and Ostermeier, Andreas, journal=Evolutionary computation, volume=9, number=2, pages=159--195, year=2001, publisher=MIT Press
79. feurer2015autosklearn: title=Efficient and robust automated machine learning, author=Feurer, Matthias and Klein, Aaron and Eggensperger, Katharina and Springenberg, Jost and Blum, Manuel and Hutter, Frank, booktitle=Advances in neural information processing systems, volume=28, year=2015
80. olson2016tpot: title=TPOT: A tree-based pipeline optimization tool for automating machine learning, author=Olson, Randal S and Bartley, Nathan and Urbanowicz, Ryan J and Moore, Jason H, booktitle=Workshop on automatic machine learning, pages=66--74, year=2016, organization=PMLR
81. akiba2019optuna: title=Optuna: A next-generation hyperparameter optimization framework, author=Akiba, Takuya and Sano, Shotaro and Yanase, Toshihiko and Ohta, Takeru and Koyama, Masanori, booktitle=Proceedings of the 25th ACM SIGKDD international conference on knowledge discovery \& data mining, pages=2623--2631, year=2019
82. zoph2017nas: title=Neural architecture search with reinforcement learning, author=Zoph, Barret and Le, Quoc V, booktitle=International Conference on Learning Representations, year=2017
83. boyd2011admm: title=Distributed optimization and statistical learning via the alternating direction method of multipliers, author=Boyd, Stephen and Parikh, Neal and Chu, Eric and Peleato, Borja and Eckstein, Jonathan, journal=Foundations and Trends in Machine learning, volume=3, number=1, pages=1--122, year=2011, publisher=Now Publishers, Inc.
84. reddi2021fedopt: title=Adaptive federated optimization, author=Reddi, Sashank and Charles, Zachary and Zaheer, Manzil and Garrett, Zachary and Rush, Keith and Kone\vcn\'y, Jakub and Kumar, Sanjiv and McMahan, H Brendan, booktitle=International Conference on Learning Representations, year=2021
85. dorigo1996aco: title=Ant system: optimization by a colony of cooperating agents, author=Dorigo, Marco and Maniezzo, Vittorio and Colorni, Alberto, journal=IEEE transactions on systems, man, and cybernetics, part b (cybernetics), volume=26, number=1, pages=29--41, year=1996, publisher=IEEE
86. karaboga2005bee: title=An idea based on honey bee swarm for numerical optimization, author=Karaboga, Dervis, journal=Technical report-tr06, Erciyes university, engineering faculty, computer engineering department, volume=200, pages=1--10, year=2005
87. significant2023autogpt: title=AutoGPT: An autonomous GPT-4 experiment, author=Significant Gravitas, year=2023, howpublished=\urlhttps://github.com/Significant-Gravitas/AutoGPT
88. nakajima2023babyagi: title=BabyAGI: An AI-powered task management system, author=Nakajima, Yohei, year=2023, howpublished=\urlhttps://github.com/yoheinakajima/babyagi
89. chase2022langchain: title=LangChain: Building applications with LLMs through composability, author=Chase, Harrison, year=2022, howpublished=\urlhttps://github.com/langchain-ai/langchain
90. wu2023autogen: title=AutoGen: Enabling Next-Gen LLM Applications via Multi-Agent Conversation, author=Wu, Qingyun and Bansal, Gagan and Zhang, Jieyu and Wu, Yiran and Li, Beibin and Zhu, Erkang and Jiang, Li and Zhang, Xiaoyun and Zhang, Shaokun and Liu, Jiale and others, year=2023, howpublished=\urlhttps://github.com/microsoft/autogen
91. dai2020himap: title=Towards a unified multi-agent reinforcement learning framework for multi-agent coordination, author=Dai, Yan and Wang, Rui and Wang, Shuang and Chen, Xinyu, journal=arXiv preprint arXiv:2011.09533, year=2020 arXiv:[2011.09533](https://arxiv.org/abs/2011.09533)
92. rashid2018qmix: title=QMIX: Monotonic value function factorisation for deep multi-agent reinforcement learning, author=Rashid, Tabish and Samvelyan, Mikayel and Schroeder, Christian and Farquhar, Gregory and Foerster, Jakob and Whiteson, Shimon, booktitle=International conference on machine learning, pages=4295--4304, year=2018, organization=PMLR
93. zhang2021marl: title=Multi-agent reinforcement learning: A selective overview of theories and algorithms, author=Zhang, Kaiqing and Yang, Zhuoran and Ba\csar, Tamer, journal=Handbook of reinforcement learning and control, pages=321--384, year=2021, publisher=Springer
94. irving2018debate: title=AI safety via debate, author=Irving, Geoffrey and Christiano, Paul and Amodei, Dario, journal=arXiv preprint arXiv:1805.00899, year=2018 arXiv:[1805.00899](https://arxiv.org/abs/1805.00899)
95. warnat2021swarm: title=Swarm Learning for decentralized and confidential clinical machine learning, author=Warnat-Herresthal, Stefanie and Schultze, Hartmut and Shastry, Krishnaprasad Lingadahalli and Manamohan, Sathyanarayanan and Mukherjee, Saikat and Garg, Vishesh and Sarveswara, Ravi and H\"andler, Kristian and Pickkers, Peter and Aziz, N Ahmad and others, journal=Nature, volume=594, number=7862, pages=265--270, year=2021, publisher=Nature Publishing Group

