# The (R)evolution of Scientific Workflows in the Agentic AI Era: Towards Autonomous Science

GrokRxiv review of [arXiv:2509.09915](https://arxiv.org/abs/2509.09915) · `cs.AI`

_Authors_: Woong Shin, Renan Souza, Daniel Rosendo, Frédéric Suter, Feiyi Wang, Prasanna Balaprakash, Rafael Ferreira da Silva

## TL;DR

This paper proposes a conceptual evolutionary framework that unifies traditional scientific workflow management systems and AI agents under a common state-machine abstraction, organizes them in a 5×5 intelligence-composition matrix, and charts an incremental path toward fully autonomous multi-facility scientific laboratories (AISLE). The novelty specialist rates the contribution incremental (score 0.65, confidence 0.90): the 5×5 matrix and multi-layer architectural blueprint genuinely extend prior community roadmap work, but the core ideas build closely on existing literature. The technical correctness specialist (confidence 0.68, overall: mostly_sound) identifies four major unsupported claims: the headline 10–100x discovery acceleration (C-001), the formal verification decidability gradient (C-003), the no-manually-defined-DAG federated endpoint (C-013), and the overall absence of verifiable artifacts for a framework paper (C-014). The reproducibility specialist (confidence 0.86, score 0.22) independently confirms that zero code, data, or formal proof artifacts accompany the submission, flagging four major concerns. The citation specialist timed out and its findings are unavailable. Because the paper is in the cs.DC field (code-amenable) and both the technical correctness and reproducibility specialists flag missing proof-as-code artifacts at major severity — with the 10–100x acceleration headline claim entirely unsupported — the recommendation gate activates. The recommendation is major_revision. The paper would benefit substantially from: (a) downgrading aspirational quantitative claims to clearly labeled speculation or backing them empirically, (b) releasing a companion artifact package with at minimum a reference framework implementation and classification benchmark, and (c) supplying or citing formal proofs for the decidability and complexity assertions in Section 3.2.

_Recommendation_: **Major revision** · _Confidence_: 78%

## Strengths

- The state-machine unification of DAG-based workflow systems and AI agents provides a coherent conceptual vocabulary that makes incremental evolutionary transitions explicit and operationally tractable for practitioners.
- The 5×5 intelligence-composition matrix positions existing deployed systems (Parsl, A-lab, LLM-based agents) relative to one another and to future autonomous science targets, offering a concrete taxonomy for community-wide coordination.
- The multi-layer AISLE architectural blueprint (data/provenance, coordination, orchestration, cross-facility federation) provides a structured decomposition that system builders can adopt as an implementation starting point.
- The A-lab productivity figures (50–100× sample throughput, 41 novel materials in 17 days) are correctly sourced to the canonical Nature 2023 paper and supply a well-grounded empirical anchor amid otherwise aspirational claims.
- The roadmap covers a broad and balanced range of challenges — formal verification complexity, provenance in adaptive systems, inter-institutional interoperability, trust, and accountability — providing honest scope for the community.

## Weaknesses

- The headline 10–100x discovery acceleration claim appears in the Introduction and Conclusion as a key contribution but is supported only by a single roadmap citation and an unquantified drug-discovery anecdote, with no benchmark, derivation, or measured baseline (C-001, major).
- The verification decidability gradient — from tractable for static δ to undecidable for meta-optimization Ω — is stated as a formal result in Section 3.2 without any proof, complexity reduction, or citation to a known undecidability theorem (C-003, major).
- No companion repository, reference implementation, formal proof artifact, classification benchmark, or dataset accompanies the submission despite multiple load-bearing formal claims in a cs.DC paper; the reproducibility score is 0.22 with four independent major concerns flagged (C-014, major; reproducibility specialist).
- The meta-optimization operator M′ = Ω(M, C, G), which redefines states, transitions, and goals, is asserted to remain a finite state machine without justification; in the general case such an operator is not FSM-expressible, undermining the core unification claim (C-002, minor).
- The 5×5 matrix's claim of comprehensiveness is undefended: no empirical classification of a representative sample of existing workflow systems into the 25 cells is provided, and the orthogonality of the two dimensions is not established (C-010, minor).
- Section 2.3 misspells the ChemCrow system as 'ChemChow' and cites an IBM vendor blog for a 99% enterprise-developer adoption statistic, neither of which meets basic evidentiary standards for a research paper (C-008, C-009, minor).
- Coscientist (Boiko et al., autonomous LLM-driven chemical research) is absent from related work despite mapping directly to the Intelligent×Single cell of the proposed matrix and representing a highly relevant real-world instantiation (novelty specialist, missing prior art).

## Revision Targets

- [ ] **Evaluation pipeline**
  - Location: `HAC/bootstrap` at `evaluation and statistical-testing pipeline`
  - Evidence: The paper claims potential 10-100x discovery acceleration and transformational workflows, but provides no benchmark, testbed, case-study measurements, or evaluation script; an artifact such as evaluations/autonomous_science_speedup_benchmark.md with data and analysis code would be needed.
  - Required change: Publish evaluation scripts or executable pseudocode for walk-forward retraining, validation selection, HAC/bootstrap settings, benchmark construction, and table regeneration.
  - Verification: Re-review should confirm the evaluation pipeline can reproduce the reported statistical tests and benchmarks.
- [ ] **Manuscript: Section 3.2 (The Intelligence Dimension), paragraph after Table 1**
  - Location: `corrections/2509.09915/paper.tex` at `Section 3.2 (The Intelligence Dimension), paragraph after Table 1`
  - Evidence: This is a precise formal claim (decidability gradient across five levels) but the paper provides no proof, no reduction to a known undecidable problem (e.g., halting), and no citation. Even the 'tractable' end is asserted without qualification — reachability in finite-state δ is decidable but not necessarily polynomial-time. The middle tiers (Learning L, Optimizing argmin J) are left completely uncharacterized in terms of complexity class.
  - Required change: Either (a) downgrade to informal language ('verification becomes substantially harder'), or (b) supply a formal argument and accompanying mechanized proof, e.g., src/proofs/verification_complexity.lean showing reductions from the halting problem for the Ω tier and a PSPACE/EXPTIME placement for intermediate tiers.
  - Verification: Re-review should confirm `Section 3.2 (The Intelligence Dimension), paragraph after Table 1` is corrected or justified.
- [ ] **Manuscript: reproducibility appendix**
  - Location: `corrections/2509.09915/paper.tex` at `reproducibility appendix`
  - Evidence: The load-bearing state-machine unification and 5x5 intelligence/composition matrix are presented conceptually, but no formal proof/specification artifact is supplied; a checkable file such as proofs/state_machine_mapping.lean or specs/intelligence_composition_matrix.tla would be needed to verify the theoretical mapping.
  - Required change: Add a reproducibility note that resolves this concern: The load-bearing state-machine unification and 5x5 intelligence/composition matrix are presented conceptually, but no formal proof/specification artifact is supplied; a checkable file such as proofs/state_machine_mapping.lean or specs/intelligence_composition_matrix.tla would be needed to verify the theoretical mapping.
  - Verification: Re-review should confirm the reproducibility concern is addressed with a concrete artifact or manuscript update.
- [ ] **Manuscript: Section 3.1 (Autonomy: State Machine Abstraction); Figure 1**
  - Location: `corrections/2509.09915/paper.tex` at `Section 3.1 (Autonomy: State Machine Abstraction); Figure 1`
  - Evidence: The mapping from a DAG workflow to a finite state machine is informally plausible (nodes ↔ states, task-completion events ↔ transitions), and the progressively enriched δ formulations are syntactically well-formed. However, the paper provides no proof of expressive equivalence (e.g., that all DAG-WMS executions are recognized by some M, or that LLM-agent loops with unbounded reasoning are captured by a finite Σ and S). The 'meta-optimization' form M' = Ω(M, C, G) is asserted as still being a state machine without justification — in fact a meta-operator that 'redefines states, transitions, and goals' is, in the general case, no longer finite-state.
  - Required change: Provide an explicit semantic mapping theorem (workflow execution trace → accepted string in L(M)) and clarify whether the 'Intelligent' tier is being modeled as an FSM, a labeled transition system, or something strictly more expressive. A formal artifact such as src/proofs/state_machine_mapping.lean (or Coq/Agda equivalent) would substantiate the unification claim. Alternatively, weaken the statement from 'state machine' to 'transition system' to avoid the finite-state misnomer.
  - Verification: Re-review should confirm `Section 3.1 (Autonomy: State Machine Abstraction); Figure 1` is corrected or justified.
- [ ] **Manuscript: Section 3.4 (The Evolution Matrix and Classification); Table 3**
  - Location: `corrections/2509.09915/paper.tex` at `Section 3.4 (The Evolution Matrix and Classification); Table 3`
  - Evidence: The matrix is internally consistent and the example assignments (DAG → Static×Pipeline; LLM-Agent → Intelligent×Single) are reasonable. However, the claim of comprehensiveness is not defended: there is no argument that the two dimensions are orthogonal (a learning agent that also performs meta-optimization seems to occupy multiple intelligence rows), and no empirical classification study placing a sample of N real workflow systems in the matrix.
  - Required change: Provide a classification of, e.g., the 20+ workflow systems referenced in [workflow-systems] and [suter2025fgcs] into the 25 cells, ideally as a reproducible table/CSV (e.g., data/matrix_classification.csv) with a justification column per system. Discuss inter-row dependencies (does Optimizing strictly subsume Learning?) explicitly.
  - Verification: Re-review should confirm `Section 3.4 (The Evolution Matrix and Classification); Table 3` is corrected or justified.
- [ ] **Manuscript: Section 2.3 (AI Advances and Opportunities)**
  - Location: `corrections/2509.09915/paper.tex` at `Section 2.3 (AI Advances and Opportunities)`
  - Evidence: The system in [bran2024augmenting] is named 'ChemCrow' (not 'ChemChow'). The paper additionally states '18 chemistry tools', which is a specific quantitative claim that should be verified against the cited Nature Machine Intelligence paper — the published ChemCrow paper describes the tool count in its methods, and the count should be checked exactly.
  - Required change: Correct the system name to 'ChemCrow' throughout and verify the '18 tools' figure against [bran2024augmenting]; if the published count differs (e.g., 17 or 'over a dozen'), adjust the text.
  - Verification: Re-review should confirm `Section 2.3 (AI Advances and Opportunities)` is corrected or justified.
- [ ] **Bibliography: Autonomous chemical research with large language models**
  - Location: bibliography entry: `Autonomous chemical research with large language models`
  - Evidence: This work describes Coscientist, a multi-agent system that autonomously designs, plans, and executes complex chemical reactions. It represents a key real-world implementation of an intelligent agent orchestrating workflows and hardware, which directly maps to the upper-right region of the proposed evolutionary matrix.
  - Required change: Add or discuss missing prior art `Autonomous chemical research with large language models`. This work describes Coscientist, a multi-agent system that autonomously designs, plans, and executes complex chemical reactions. It represents a key real-world implementation of an intelligent agent orchestrating workflows and hardware, which directly maps to the upper-right region of the proposed evolutionary matrix.
  - Verification: Re-review should confirm the related-work discussion addresses this prior art.

## Open Questions

- Is the state-machine abstraction intended as a formal equivalence with provable expressiveness bounds, or as a conceptual analogy? If the former, can the authors supply a semantic mapping theorem showing that any DAG-WMS execution trace is accepted by some FSM M, and clarify whether the Intelligent tier requires a formalism strictly more expressive than a finite-state machine?
- What is the basis for the 10–100x acceleration figure — aspirational projection, first-principles derivation, or measured observation in specific systems? If aspirational, should it be removed from the contributions list and placed in clearly labeled speculation within the discussion?
- For the verification decidability gradient, can the authors provide a formal reduction from the halting problem for the Ω tier, and cite or derive complexity-class bounds (e.g., PSPACE, EXPTIME) for the Adaptive, Learning, and Optimizing intermediate tiers?
- How does the framework handle systems that simultaneously exhibit capabilities from multiple intelligence levels — for example, a system that both maintains a learning history H and performs meta-optimization Ω? Does such a system occupy multiple rows in the matrix, and if so, how should practitioners classify and evolve it?
- Given that Coscientist demonstrates an LLM autonomously orchestrating chemical synthesis including hardware control, how does the proposed framework position and differentiate from that existing implementation, and does its absence from related work reflect a deliberate scope decision?
- The acknowledgments reference OLCF computational resources at ORNL. What computation was actually performed on those systems, and can the authors supply a minimal environment specification — machine type, software stack, workload description, and commands — sufficient for independent reproduction?

## Per-Agent Reviews

### citation (`gemini-3-flash-preview`) — status: `fail`

```json
{
  "error": "CliRunner timed out after 360s for role citation",
  "role": "citation",
  "status": "agent_failed"
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.78,
  "questions": [
    "Is the state-machine abstraction intended as a formal equivalence with provable expressiveness bounds, or as a conceptual analogy? If the former, can the authors supply a semantic mapping theorem showing that any DAG-WMS execution trace is accepted by some FSM M, and clarify whether the Intelligent tier requires a formalism strictly more expressive than a finite-state machine?",
    "What is the basis for the 10–100x acceleration figure — aspirational projection, first-principles derivation, or measured observation in specific systems? If aspirational, should it be removed from the contributions list and placed in clearly labeled speculation within the discussion?",
    "For the verification decidability gradient, can the authors provide a formal reduction from the halting problem for the Ω tier, and cite or derive complexity-class bounds (e.g., PSPACE, EXPTIME) for the Adaptive, Learning, and Optimizing intermediate tiers?",
    "How does the framework handle systems that simultaneously exhibit capabilities from multiple intelligence levels — for example, a system that both maintains a learning history H and performs meta-optimization Ω? Does such a system occupy multiple rows in the matrix, and if so, how should practitioners classify and evolve it?",
    "Given that Coscientist demonstrates an LLM autonomously orchestrating chemical synthesis including hardware control, how does the proposed framework position and differentiate from that existing implementation, and does its absence from related work reflect a deliberate scope decision?",
    "The acknowledgments reference OLCF computational resources at ORNL. What computation was actually performed on those systems, and can the authors supply a minimal environment specification — machine type, software stack, workload description, and commands — sufficient for independent reproduction?"
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "The paper claims potential 10-100x discovery acceleration and transformational workflows, but provides no benchmark, testbed, case-study measurements, or evaluation script; an artifact such as evaluations/autonomous_science_speedup_benchmark.md with data and analysis code would be needed.",
      "id": "weakness-1",
      "locator": "evaluation and statistical-testing pipeline",
      "required_update": "Publish evaluation scripts or executable pseudocode for walk-forward retraining, validation selection, HAC/bootstrap settings, benchmark construction, and table regeneration.",
      "source_path": "HAC/bootstrap",
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "code",
      "verification_check": "Re-review should confirm the evaluation pipeline can reproduce the reported statistical tests and benchmarks.",
      "weakness_index": 0
    },
    {
      "evidence": "This is a precise formal claim (decidability gradient across five levels) but the paper provides no proof, no reduction to a known undecidable problem (e.g., halting), and no citation. Even the 'tractable' end is asserted without qualification — reachability in finite-state δ is decidable but not necessarily polynomial-time. The middle tiers (Learning L, Optimizing argmin J) are left completely uncharacterized in terms of complexity class.",
      "id": "weakness-2",
      "locator": "Section 3.2 (The Intelligence Dimension), paragraph after Table 1",
      "required_update": "Either (a) downgrade to informal language ('verification becomes substantially harder'), or (b) supply a formal argument and accompanying mechanized proof, e.g., src/proofs/verification_complexity.lean showing reductions from the halting problem for the Ω tier and a PSPACE/EXPTIME placement for intermediate tiers.",
      "source_path": "corrections/2509.09915/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 3.2 (The Intelligence Dimension), paragraph after Table 1` is corrected or justified.",
      "weakness_index": 1
    },
    {
      "evidence": "The load-bearing state-machine unification and 5x5 intelligence/composition matrix are presented conceptually, but no formal proof/specification artifact is supplied; a checkable file such as proofs/state_machine_mapping.lean or specs/intelligence_composition_matrix.tla would be needed to verify the theoretical mapping.",
      "id": "weakness-3",
      "locator": "reproducibility appendix",
      "required_update": "Add a reproducibility note that resolves this concern: The load-bearing state-machine unification and 5x5 intelligence/composition matrix are presented conceptually, but no formal proof/specification artifact is supplied; a checkable file such as proofs/state_machine_mapping.lean or specs/intelligence_composition_matrix.tla would be needed to verify the theoretical mapping.",
      "source_path": "corrections/2509.09915/paper.tex",
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm the reproducibility concern is addressed with a concrete artifact or manuscript update.",
      "weakness_index": 2
    },
    {
      "evidence": "The mapping from a DAG workflow to a finite state machine is informally plausible (nodes ↔ states, task-completion events ↔ transitions), and the progressively enriched δ formulations are syntactically well-formed. However, the paper provides no proof of expressive equivalence (e.g., that all DAG-WMS executions are recognized by some M, or that LLM-agent loops with unbounded reasoning are captured by a finite Σ and S). The 'meta-optimization' form M' = Ω(M, C, G) is asserted as still being a state machine without justification — in fact a meta-operator that 'redefines states, transitions, and goals' is, in the general case, no longer finite-state.",
      "id": "weakness-4",
      "locator": "Section 3.1 (Autonomy: State Machine Abstraction); Figure 1",
      "required_update": "Provide an explicit semantic mapping theorem (workflow execution trace → accepted string in L(M)) and clarify whether the 'Intelligent' tier is being modeled as an FSM, a labeled transition system, or something strictly more expressive. A formal artifact such as src/proofs/state_machine_mapping.lean (or Coq/Agda equivalent) would substantiate the unification claim. Alternatively, weaken the statement from 'state machine' to 'transition system' to avoid the finite-state misnomer.",
      "source_path": "corrections/2509.09915/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 3.1 (Autonomy: State Machine Abstraction); Figure 1` is corrected or justified.",
      "weakness_index": 3
    },
    {
      "evidence": "The matrix is internally consistent and the example assignments (DAG → Static×Pipeline; LLM-Agent → Intelligent×Single) are reasonable. However, the claim of comprehensiveness is not defended: there is no argument that the two dimensions are orthogonal (a learning agent that also performs meta-optimization seems to occupy multiple intelligence rows), and no empirical classification study placing a sample of N real workflow systems in the matrix.",
      "id": "weakness-5",
      "locator": "Section 3.4 (The Evolution Matrix and Classification); Table 3",
      "required_update": "Provide a classification of, e.g., the 20+ workflow systems referenced in [workflow-systems] and [suter2025fgcs] into the 25 cells, ideally as a reproducible table/CSV (e.g., data/matrix_classification.csv) with a justification column per system. Discuss inter-row dependencies (does Optimizing strictly subsume Learning?) explicitly.",
      "source_path": "corrections/2509.09915/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 3.4 (The Evolution Matrix and Classification); Table 3` is corrected or justified.",
      "weakness_index": 4
    },
    {
      "evidence": "The system in [bran2024augmenting] is named 'ChemCrow' (not 'ChemChow'). The paper additionally states '18 chemistry tools', which is a specific quantitative claim that should be verified against the cited Nature Machine Intelligence paper — the published ChemCrow paper describes the tool count in its methods, and the count should be checked exactly.",
      "id": "weakness-6",
      "locator": "Section 2.3 (AI Advances and Opportunities)",
      "required_update": "Correct the system name to 'ChemCrow' throughout and verify the '18 tools' figure against [bran2024augmenting]; if the published count differs (e.g., 17 or 'over a dozen'), adjust the text.",
      "source_path": "corrections/2509.09915/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 2.3 (AI Advances and Opportunities)` is corrected or justified.",
      "weakness_index": 5
    },
    {
      "evidence": "This work describes Coscientist, a multi-agent system that autonomously designs, plans, and executes complex chemical reactions. It represents a key real-world implementation of an intelligent agent orchestrating workflows and hardware, which directly maps to the upper-right region of the proposed evolutionary matrix.",
      "id": "weakness-7",
      "locator": "Autonomous chemical research with large language models",
      "required_update": "Add or discuss missing prior art `Autonomous chemical research with large language models`. This work describes Coscientist, a multi-agent system that autonomously designs, plans, and executes complex chemical reactions. It represents a key real-world implementation of an intelligent agent orchestrating workflows and hardware, which directly maps to the upper-right region of the proposed evolutionary matrix.",
      "source_path": null,
      "source_role": "novelty",
      "status": "open",
      "target_kind": "bibliography",
      "verification_check": "Re-review should confirm the related-work discussion addresses this prior art.",
      "weakness_index": 6
    }
  ],
  "strengths": [
    "The state-machine unification of DAG-based workflow systems and AI agents provides a coherent conceptual vocabulary that makes incremental evolutionary transitions explicit and operationally tractable for practitioners.",
    "The 5×5 intelligence-composition matrix positions existing deployed systems (Parsl, A-lab, LLM-based agents) relative to one another and to future autonomous science targets, offering a concrete taxonomy for community-wide coordination.",
    "The multi-layer AISLE architectural blueprint (data/provenance, coordination, orchestration, cross-facility federation) provides a structured decomposition that system builders can adopt as an implementation starting point.",
    "The A-lab productivity figures (50–100× sample throughput, 41 novel materials in 17 days) are correctly sourced to the canonical Nature 2023 paper and supply a well-grounded empirical anchor amid otherwise aspirational claims.",
    "The roadmap covers a broad and balanced range of challenges — formal verification complexity, provenance in adaptive systems, inter-institutional interoperability, trust, and accountability — providing honest scope for the community."
  ],
  "summary": "This paper proposes a conceptual evolutionary framework that unifies traditional scientific workflow management systems and AI agents under a common state-machine abstraction, organizes them in a 5×5 intelligence-composition matrix, and charts an incremental path toward fully autonomous multi-facility scientific laboratories (AISLE). The novelty specialist rates the contribution incremental (score 0.65, confidence 0.90): the 5×5 matrix and multi-layer architectural blueprint genuinely extend prior community roadmap work, but the core ideas build closely on existing literature. The technical correctness specialist (confidence 0.68, overall: mostly_sound) identifies four major unsupported claims: the headline 10–100x discovery acceleration (C-001), the formal verification decidability gradient (C-003), the no-manually-defined-DAG federated endpoint (C-013), and the overall absence of verifiable artifacts for a framework paper (C-014). The reproducibility specialist (confidence 0.86, score 0.22) independently confirms that zero code, data, or formal proof artifacts accompany the submission, flagging four major concerns. The citation specialist timed out and its findings are unavailable. Because the paper is in the cs.DC field (code-amenable) and both the technical correctness and reproducibility specialists flag missing proof-as-code artifacts at major severity — with the 10–100x acceleration headline claim entirely unsupported — the recommendation gate activates. The recommendation is major_revision. The paper would benefit substantially from: (a) downgrading aspirational quantitative claims to clearly labeled speculation or backing them empirically, (b) releasing a companion artifact package with at minimum a reference framework implementation and classification benchmark, and (c) supplying or citing formal proofs for the decidability and complexity assertions in Section 3.2.",
  "weaknesses": [
    "The headline 10–100x discovery acceleration claim appears in the Introduction and Conclusion as a key contribution but is supported only by a single roadmap citation and an unquantified drug-discovery anecdote, with no benchmark, derivation, or measured baseline (C-001, major).",
    "The verification decidability gradient — from tractable for static δ to undecidable for meta-optimization Ω — is stated as a formal result in Section 3.2 without any proof, complexity reduction, or citation to a known undecidability theorem (C-003, major).",
    "No companion repository, reference implementation, formal proof artifact, classification benchmark, or dataset accompanies the submission despite multiple load-bearing formal claims in a cs.DC paper; the reproducibility score is 0.22 with four independent major concerns flagged (C-014, major; reproducibility specialist).",
    "The meta-optimization operator M′ = Ω(M, C, G), which redefines states, transitions, and goals, is asserted to remain a finite state machine without justification; in the general case such an operator is not FSM-expressible, undermining the core unification claim (C-002, minor).",
    "The 5×5 matrix's claim of comprehensiveness is undefended: no empirical classification of a representative sample of existing workflow systems into the 25 cells is provided, and the orthogonality of the two dimensions is not established (C-010, minor).",
    "Section 2.3 misspells the ChemCrow system as 'ChemChow' and cites an IBM vendor blog for a 99% enterprise-developer adoption statistic, neither of which meets basic evidentiary standards for a research paper (C-008, C-009, minor).",
    "Coscientist (Boiko et al., autonomous LLM-driven chemical research) is absent from related work despite mapping directly to the Intelligent×Single cell of the proposed matrix and representing a highly relevant real-world instantiation (novelty specialist, missing prior art)."
  ]
}
```

### novelty (`gemini-3-flash-preview`) — status: `pass`

```json
{
  "confidence": 0.9,
  "missing_prior_art": [
    {
      "reason": "This work describes Coscientist, a multi-agent system that autonomously designs, plans, and executes complex chemical reactions. It represents a key real-world implementation of an intelligent agent orchestrating workflows and hardware, which directly maps to the upper-right region of the proposed evolutionary matrix.",
      "title": "Autonomous chemical research with large language models"
    }
  ],
  "novelty_score": 0.65,
  "related_work": [
    {
      "citation_key": "autonomousscience",
      "delta": "This paper expands the community roadmap vision into a structured 5x5 evolutionary matrix that formally separates intelligence and composition dimensions, providing a concrete taxonomy and multi-layer architectural blueprint.",
      "relation": "builds_on",
      "title": "A Grassroots Network and Community Roadmap for Interconnected Autonomous Science Laboratories for Accelerated Discovery"
    },
    {
      "citation_key": "pauloski2025empowering",
      "delta": "While Pauloski et al. focus on the infrastructure and execution of federated agents in workflows, this paper abstracts these systems into a unified intelligence dimension and integrates them into a larger multi-facility architectural blueprint.",
      "relation": "builds_on",
      "title": "Empowering Scientific Workflows with Federated Agents"
    },
    {
      "citation_key": "balaprakash2025swarm",
      "delta": "Structures the transition of workflows from single systems to swarms as part of a broader taxonomy of intelligence and composition, whereas SWARM focuses on distributed system execution and coordination.",
      "relation": "builds_on",
      "title": "SWARM: Reimagining scientific workflow management systems in a distributed world"
    },
    {
      "citation_key": "prov-agent",
      "delta": "Integrates agent-specific provenance tracking frameworks into the data and provenance service layer of the proposed multi-facility AISLE architectural blueprint.",
      "relation": "builds_on",
      "title": "PROV-AGENT: Unified Provenance for TrackingAI Agent Interactions in Agentic Workflows"
    },
    {
      "citation_key": "abolhasani2023rise",
      "delta": "Focuses on physical laboratory automation and materials synthesis platforms, whereas this paper targets the software and workflow abstractions for multi-facility orchestration.",
      "relation": "prior_art",
      "title": "The rise of self-driving labs in chemical and materials sciences"
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
      "description": "No accompanying repository or pinned release is provided for the paper's proposed framework, architectural blueprint, or any reference implementation; a reproducible artifact such as artifacts/agentic_workflow_blueprint/README.md with executable examples would be needed to independently reproduce the system design claims.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "The load-bearing state-machine unification and 5x5 intelligence/composition matrix are presented conceptually, but no formal proof/specification artifact is supplied; a checkable file such as proofs/state_machine_mapping.lean or specs/intelligence_composition_matrix.tla would be needed to verify the theoretical mapping.",
      "severity": "major"
    },
    {
      "area": "evaluation",
      "description": "The paper claims potential 10-100x discovery acceleration and transformational workflows, but provides no benchmark, testbed, case-study measurements, or evaluation script; an artifact such as evaluations/autonomous_science_speedup_benchmark.md with data and analysis code would be needed.",
      "severity": "major"
    },
    {
      "area": "data",
      "description": "No dataset, benchmark suite, workflow traces, or case-study inputs are released for validating the taxonomy, roadmap, or architectural claims.",
      "severity": "major"
    },
    {
      "area": "compute",
      "description": "The acknowledgment states that OLCF resources at ORNL were used, but the paper does not specify the machine, node configuration, software stack, workload, or commands needed to reproduce any computation.",
      "severity": "minor"
    }
  ],
  "confidence": 0.86,
  "data_availability": "unspecified",
  "data_url": null,
  "environment": {
    "dependencies": [],
    "hardware": "OLCF at ORNL resources are acknowledged, but no specific system, node type, accelerator, or allocation details are given.",
    "software": null
  },
  "reproducibility_score": 0.22
}
```

### summary (`claude-haiku-4-5-20251001`) — status: `pass`

```json
{
  "audience": "Researchers and system architects designing scientific workflow systems; the AI and machine learning community developing autonomous agents for scientific applications; domain scientists and facility operators managing multi-facility discovery campaigns; science policymakers and funding agencies planning infrastructure investments for accelerated discovery",
  "key_contributions": [
    "A conceptual framework that unifies traditional workflows and AI agents through the state machine abstraction, revealing evolutionary paths and concrete step transitions from current workflow management systems to autonomous science",
    "An architectural blueprint that envisions autonomous scientific laboratories materializing this evolution and demonstrates how scientific discovery would transform with increasing levels of autonomy and coordination",
    "A roadmap identifying concrete challenges, opportunities, and strategic bets required in both the AI and scientific workflows communities to realize autonomous scientific discovery"
  ],
  "plain_language_summary": "Modern scientific discovery increasingly demands coordination across multiple distributed facilities and instruments, forcing researchers to spend time managing workflows rather than conducting science. This paper addresses that challenge by proposing a conceptual framework that unifies traditional scientific workflow systems and emerging AI agents through a common foundation: the state machine abstraction. Rather than advocating a revolutionary replacement of existing systems, the authors chart an evolutionary path that gradually enhances workflows along two dimensions—intelligence (from static, predetermined execution to systems that learn, optimize, and reason about their own goals) and composition (from isolated systems to pipelines, hierarchies, meshes, and finally emergent swarms of agents).\n\nThe framework maps current systems (traditional DAG-based workflows, ML pipelines, autonomous labs) to specific positions in a 5×5 matrix defined by these two dimensions. The authors describe how workflows can transition incrementally: adding feedback mechanisms and learning capabilities, then optimization, then meta-reasoning with AI agents. Similarly, composition evolves from single systems to sequential pipelines to hierarchical management to peer-to-peer meshes to emergent swarm behaviors. This systematic view reveals that moving toward autonomous science is not a disruptive leap but a series of achievable, incremental steps that preserve investments in existing infrastructure while enabling new capabilities.\n\nThe paper identifies significant challenges in this evolution, ranging from fundamental AI limitations (causal reasoning, physical constraints, multimodal understanding) to workflow engineering issues (provenance tracking in adaptive systems, interoperability across institutions) to cultural and ethical considerations (trust, bias, accountability). It argues that the scientific community is uniquely positioned to lead specialized AI development that prioritizes reproducibility, causality, and human oversight—capabilities distinct from commercial AI systems—and projects potential 100-fold acceleration in discovery through fully autonomous, coordinated scientific operations.",
  "tldr": "The paper proposes an evolutionary framework where scientific workflows progress along two dimensions—intelligence (static to intelligent) and composition (single to swarm)—to transition from current systems to fully autonomous distributed laboratories."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `warn`

```json
{
  "claims": [
    {
      "assessment": "unsupported",
      "claim": "Embedding reasoning and adaptation into workflows can accelerate scientific discovery by factors of 10 to 100.",
      "evidence": "The 10–100x acceleration figure is stated repeatedly (Introduction, Sec. 6.2 Accelerated Time to Discovery, Conclusion) but is sourced only to a single grassroots roadmap citation [autonomousscience] and an unquantified drug-discovery anecdote. No quantitative model, derivation, benchmark, dataset, or case study with measured speedup is given. The paper presents no methodology for measuring 'discovery acceleration' and no comparison baselines.",
      "id": "C-001",
      "location": "Introduction (paragraph 1); Discussion and Conclusion",
      "severity": "major",
      "suggested_fix": "Either (a) explicitly mark the figure as aspirational and remove load-bearing references in the abstract/contributions, or (b) ship a reproducible benchmark (e.g., experiments/acceleration/case_studies.py) that measures end-to-end discovery latency in at least 2–3 existing autonomous labs vs. manual baselines, with confidence intervals."
    },
    {
      "assessment": "partially_supported",
      "claim": "Both traditional scientific workflows and modern AI agents reduce to a common finite state machine abstraction M = (S, Σ, δ, s0, F), with AI capabilities captured by progressively richer transition functions (δ+O, L, argmin J, Ω).",
      "evidence": "The mapping from a DAG workflow to a finite state machine is informally plausible (nodes ↔ states, task-completion events ↔ transitions), and the progressively enriched δ formulations are syntactically well-formed. However, the paper provides no proof of expressive equivalence (e.g., that all DAG-WMS executions are recognized by some M, or that LLM-agent loops with unbounded reasoning are captured by a finite Σ and S). The 'meta-optimization' form M' = Ω(M, C, G) is asserted as still being a state machine without justification — in fact a meta-operator that 'redefines states, transitions, and goals' is, in the general case, no longer finite-state.",
      "id": "C-002",
      "location": "Section 3.1 (Autonomy: State Machine Abstraction); Figure 1",
      "severity": "minor",
      "suggested_fix": "Provide an explicit semantic mapping theorem (workflow execution trace → accepted string in L(M)) and clarify whether the 'Intelligent' tier is being modeled as an FSM, a labeled transition system, or something strictly more expressive. A formal artifact such as src/proofs/state_machine_mapping.lean (or Coq/Agda equivalent) would substantiate the unification claim. Alternatively, weaken the statement from 'state machine' to 'transition system' to avoid the finite-state misnomer."
    },
    {
      "assessment": "unsupported",
      "claim": "Verification complexity increases from tractable for static δ to undecidable for meta-optimization Ω.",
      "evidence": "This is a precise formal claim (decidability gradient across five levels) but the paper provides no proof, no reduction to a known undecidable problem (e.g., halting), and no citation. Even the 'tractable' end is asserted without qualification — reachability in finite-state δ is decidable but not necessarily polynomial-time. The middle tiers (Learning L, Optimizing argmin J) are left completely uncharacterized in terms of complexity class.",
      "id": "C-003",
      "location": "Section 3.2 (The Intelligence Dimension), paragraph after Table 1",
      "severity": "major",
      "suggested_fix": "Either (a) downgrade to informal language ('verification becomes substantially harder'), or (b) supply a formal argument and accompanying mechanized proof, e.g., src/proofs/verification_complexity.lean showing reductions from the halting problem for the Ω tier and a PSPACE/EXPTIME placement for intermediate tiers."
    },
    {
      "assessment": "partially_supported",
      "claim": "Pipeline composition requires O(n) channels, hierarchical needs O(n) per level, mesh demands O(n^2) connections, and swarm uses only O(k) local communications.",
      "evidence": "The combinatorial bounds are stated correctly for the stylized topologies (chain = n−1 edges, complete graph = n(n−1)/2, k-regular neighborhood = nk/2). However, the claims conflate channel count with communication cost and ignore message volume, frequency, and aggregation effects — a swarm with O(k) channels per node still has O(nk) total channels and potentially O(n) gossip rounds. No benchmarks, simulation, or analytical model is given to validate that real federated science workflows exhibit the stated scaling.",
      "id": "C-004",
      "location": "Section 3.3 (The Composition Dimension), paragraph after Table 2",
      "severity": "minor",
      "suggested_fix": "Ship a small simulation benchmark, e.g., experiments/composition_scaling/scaling.py, that instantiates the five composition patterns over n ∈ {10, 100, 1000} agents and measures both channel count and total messages/round, so the asymptotic claims are empirically grounded. Clarify in the text whether O(·) refers to channels, messages per step, or aggregate traffic."
    },
    {
      "assessment": "supported",
      "claim": "Berkeley A-lab processes 50–100 times more samples than humans daily and synthesized 41 novel materials in 17 days.",
      "evidence": "Sourced to [szymanski2023autonomous] (Nature 2023), which is the canonical primary report of the A-lab and contains the quantitative figures cited.",
      "id": "C-005",
      "location": "Section 2.3 (AI Advances and Opportunities)",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Autonomous materials discovery campaigns have evaluated over one million candidate compounds.",
      "evidence": "The figure is presented without a specific citation in this sentence; the surrounding paragraph cites [abolhasani2023rise; hysmith2024future] but those are broad surveys/perspectives, and the precise '> one million compounds' figure is not directly traceable to either reference in the form stated.",
      "id": "C-006",
      "location": "Section 6.1 (Autonomous Discovery)",
      "severity": "minor",
      "suggested_fix": "Cite the specific campaign(s) reaching the 10^6 candidate threshold (e.g., the GNoME / DeepMind materials work, Materials Project, or a specific A-lab campaign report) with an inline reference, or rephrase to 'on the order of millions' if the figure aggregates multiple campaigns."
    },
    {
      "assessment": "partially_supported",
      "claim": "ChatGPT has 400 million weekly active users by 2025 and is adopted by 80% of Fortune 500 companies.",
      "evidence": "Cited to [chatgpt2025] (TechCrunch news piece) and [openai2023enterprise] (an OpenAI blog post from 2023, predating the 80% figure). The 2025 WAU figure depends entirely on a tech-news outlet, and the 80% Fortune 500 figure cannot have come from the 2023 enterprise launch announcement. Numbers are plausible but the evidentiary chain is weak.",
      "id": "C-007",
      "location": "Section 2.3 (AI Advances and Opportunities)",
      "severity": "minor",
      "suggested_fix": "Replace with an OpenAI investor letter or audited industry tracker (e.g., Sensor Tower, Statista) that timestamps the 400M WAU and 80% F500 figures, and qualify the Fortune 500 number ('have at least one paid seat' vs. 'company-wide deployment')."
    },
    {
      "assessment": "partially_supported",
      "claim": "By 2025, 99% of enterprise developers are exploring AI agents.",
      "evidence": "Sourced only to an IBM vendor blog post [ibm2025ai], not an independent survey. The figure (99%) is suspiciously high and presented without survey methodology, sample size, or definition of 'exploring'.",
      "id": "C-008",
      "location": "Section 2.3 (AI Advances and Opportunities)",
      "severity": "minor",
      "suggested_fix": "Replace with a peer-reviewed or independent survey (e.g., Stack Overflow Developer Survey, JetBrains State of Developer Ecosystem) or soften to 'a large majority' with appropriate caveats."
    },
    {
      "assessment": "incorrect",
      "claim": "ChemChow integrates GPT-4 with 18 chemistry tools to autonomously plan synthesis.",
      "evidence": "The system in [bran2024augmenting] is named 'ChemCrow' (not 'ChemChow'). The paper additionally states '18 chemistry tools', which is a specific quantitative claim that should be verified against the cited Nature Machine Intelligence paper — the published ChemCrow paper describes the tool count in its methods, and the count should be checked exactly.",
      "id": "C-009",
      "location": "Section 2.3 (AI Advances and Opportunities)",
      "severity": "minor",
      "suggested_fix": "Correct the system name to 'ChemCrow' throughout and verify the '18 tools' figure against [bran2024augmenting]; if the published count differs (e.g., 17 or 'over a dozen'), adjust the text."
    },
    {
      "assessment": "partially_supported",
      "claim": "The 5×5 evolution matrix provides a comprehensive taxonomy of scientific workflow systems, with current systems clustering at the top-left and autonomous science occupying the bottom-right.",
      "evidence": "The matrix is internally consistent and the example assignments (DAG → Static×Pipeline; LLM-Agent → Intelligent×Single) are reasonable. However, the claim of comprehensiveness is not defended: there is no argument that the two dimensions are orthogonal (a learning agent that also performs meta-optimization seems to occupy multiple intelligence rows), and no empirical classification study placing a sample of N real workflow systems in the matrix.",
      "id": "C-010",
      "location": "Section 3.4 (The Evolution Matrix and Classification); Table 3",
      "severity": "minor",
      "suggested_fix": "Provide a classification of, e.g., the 20+ workflow systems referenced in [workflow-systems] and [suter2025fgcs] into the 25 cells, ideally as a reproducible table/CSV (e.g., data/matrix_classification.csv) with a justification column per system. Discuss inter-row dependencies (does Optimizing strictly subsume Learning?) explicitly."
    },
    {
      "assessment": "partially_supported",
      "claim": "Each intelligence level represents a step increase of dynamic capabilities, potentially accumulative (i.e., the levels are hierarchical: Static ⊆ Adaptive ⊆ Learning ⊆ Optimizing ⊆ Intelligent).",
      "evidence": "The 'accumulative' nature is asserted but not proved. Optimizing systems (argmin J) need not be Learning systems (no history H required for many optimizers, e.g., gradient-free black-box). Adaptive (δ+O) is not a strict generalization of Static since the signature of δ changes. The containment relation across levels is informal at best.",
      "id": "C-011",
      "location": "Section 3.2 (The Intelligence Dimension), paragraph after Table 1",
      "severity": "minor",
      "suggested_fix": "Either (a) prove containment by giving a canonical embedding of each tier into the next (e.g., show that any static δ is a degenerate adaptive δ that ignores O), or (b) replace the lattice/containment language with 'progression of typical capabilities' to avoid the formal claim."
    },
    {
      "assessment": "partially_supported",
      "claim": "Resource requirements scale from O(1) lookups for static δ to potentially unbounded computation for intelligent reasoning.",
      "evidence": "The O(1) lookup claim assumes a precomputed transition table, which is not how real DAG WMSs implement δ (scheduling, data-dependency resolution, and provenance recording are not O(1)). 'Unbounded' for Ω is informally true but uninformative — without complexity classification or measured wall-clock data the claim conveys little.",
      "id": "C-012",
      "location": "Section 3.2 (The Intelligence Dimension), paragraph after Table 1",
      "severity": "minor",
      "suggested_fix": "Replace with a more careful complexity table covering δ evaluation cost as a function of |S|, |Σ|, |H|, model size, and inference depth. Where possible, attach empirical numbers (e.g., median ms-per-transition for representative systems)."
    },
    {
      "assessment": "unsupported",
      "claim": "In its ultimate autonomous form, federated scientific discovery operates with no manually defined DAGs in place; meta-optimization redefines state machines dynamically.",
      "evidence": "This is presented as the endpoint of the proposed evolution but no existence proof, prototype, or even sketch implementation is provided showing that an LLM/LRM-based Ω operator can (a) preserve reproducibility, provenance, and FAIR compliance the paper itself identifies as required, while (b) eliminating the static DAG entirely. The example in Fig. 4 is illustrative only; the closed-loop coordination, knowledge-graph synchronization, and meta-optimizer described are not instantiated in code or experiment.",
      "id": "C-013",
      "location": "Section 4.4 (Federated Autonomous Scientific Discovery); Section 3.2",
      "severity": "major",
      "suggested_fix": "Either downgrade the language ('we envision') and remove the contribution-level claim, or ship a minimal reference implementation (e.g., examples/federated_autonomous_demo/) that shows a meta-optimizer rewriting a workflow graph at runtime in a controlled experimental scenario, even if scaled-down."
    },
    {
      "assessment": "unsupported",
      "claim": "The state-machine formalism, the 5×5 evolution matrix taxonomy, the complexity scaling bounds, and the verification-decidability gradient together constitute a verifiable conceptual framework.",
      "evidence": "Per the proof-as-code axiom (cs.DC field): the paper makes multiple load-bearing formal claims — state-machine equivalence (C-002), verification decidability gradient (C-003), composition-channel scaling (C-004), accumulative intelligence hierarchy (C-011), resource-complexity scaling (C-012) — and ships zero executable artifacts. No simulation, no formal proof file, no classification benchmark, no reference implementation, no replication of any cited 'autonomous lab' case study. For a paper proposing itself as a framework that the community can build on, the absence of any companion code, schema, or formalization is a substantive weakness.",
      "id": "C-014",
      "location": "Section 3 (The Evolution Framework, throughout)",
      "severity": "major",
      "suggested_fix": "Ship, at minimum: (1) src/proofs/state_machine_mapping.lean (or Coq/Agda) formalizing the DAG ↔ FSM mapping and the containment of intelligence tiers; (2) experiments/composition_scaling/scaling.py producing empirical channel/message counts vs. n for the five composition patterns; (3) data/matrix_classification.csv placing a representative set of WMSs into the 5×5 matrix with justifications; (4) a reference Python package, e.g., grokrxiv/evolution_framework/, exposing the M = (S, Σ, δ, s0, F) and Ω(M, C, G) abstractions so other authors can instantiate and compare them. Without these the framework remains a vocabulary rather than a verifiable contribution."
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

