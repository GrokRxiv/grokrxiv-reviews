# Harness Engineering as Categorical Architecture\\ \large Structural Guarantees Are Harness-Level Properties\\[0.5em] \normalsize Preprint -- Feedback Welcome

GrokRxiv review of [arXiv:2605.12239](https://arxiv.org/abs/2605.12239) · `cs.PL`

## TL;DR

This paper proposes category theory—specifically the ArchAgents Architecture triple (G, Know, Phi)—as the formal foundation for agent harness engineering, mapping the four pillars of agent externalization (Memory, Skills, Protocols, Harness Engineering) to categorical roles (coalgebras, operads, wiring diagrams, triple composition). The central contributions are: (1) a claimed formal correspondence between the two frameworks, (2) compiler functors that compile Operon harnesses to five orchestration targets (Swarms, DeerFlow, Ralph, Scion, LangGraph) with asserted certificate preservation, (3) a runtime certificate-replay mechanism, (4) a single-task model-escalation experiment, and (5) honest negative SWE-bench results. The novelty specialist scores this 0.88 with a 'significant' verdict. However, the review is materially constrained by two cross-cutting problems. First, the reproducibility specialist (confidence 0.78) flags a CRITICAL proof-as-code gap: the headline correspondence is stated entirely in prose with no mechanized artifact (e.g., formal/ExternalizationArchitectureCorrespondence.lean), and the operad/coalgebra/wiring claims lack checked axiom files—this directly blocks the headline claim per the recommendation gate. Second, the citation verifier reports exists=false and no resolved DOI or URL for all nine primary citations, including the three foundational preprints (delosriscos2026categorical, zhou2026externalization, ma2026atomic) on which the entire theoretical scaffolding depends; if these are unverifiable at publication, the framework's grounding is unauditable. Technical correctness (confidence 0.70, overall mostly_sound) adds five major deficiencies: the formal correspondence reduces to a conceptual mapping (C1), compiler functors are self-tested inside one codebase with no independent category-law verification (C3, C8), the escalation experiment is n=1 task and n=2 models (C5), and the operad framing for atomic skills lacks signature, axioms, or closure proofs (C6). The cumulative weight of the critical proof-as-code gap blocking the headline claim, five major correctness deficiencies, unverifiable foundational citations, and a reproducibility score of 0.58 warrants major revision before this paper can be accepted.

_Recommendation_: **Major revision** · _Confidence_: 79%

## Strengths

- High novelty score (0.88, 'significant' verdict): the operationalization of the abstract (G, Know, Phi) triple for concrete harness engineering and the definition of structure-preserving compiler morphisms are substantive conceptual contributions that advance the field.
- Working open-source reference implementation (github.com/coredipper/operon, MIT license, operon-ai on PyPI) with five compiler adapters and a runtime certificate-replay mechanism—code exists and is acknowledged by all specialists.
- Empirical honesty: negative SWE-bench results are reported without spin, model limitations are attributed correctly to 8B-class format-discipline ceilings, and immutable model digests (gemma4 c6eb396dbd59, deepseek-r1:8b 6995872bfe4c) are provided for reproducibility of the null result.
- Useful engineering taxonomy: the four-pillar-to-categorical-role mapping (Memory→coalgebra, Skills→operad, Protocols→wiring, Harness→triple) provides a precise shared vocabulary for a field currently lacking formal terminology, regardless of whether the correspondence is formally proved.
- Certificate preservation runtime verification across five orchestration frameworks (Swarms, DeerFlow, Ralph, Scion, LangGraph) for three certificate types demonstrates that the replay invariant is operationally sound for topology-independent certificate classes.
- Honest scoping of the escalation experiment: Section 6.2 acknowledges the single-task, two-model setup, and the independent Phi-3/Gemma validation (0.72 vs 1.00) correctly establishes task discriminativity before the watcher experiment.

## Weaknesses

- [GATE — CRITICAL, blocks headline claim] The headline correspondence '(G, Know, Phi) exactly formalizes Memory, Skills, Protocols, and Harness Engineering' is stated entirely in prose without any mechanized mapping or proof artifact. No formal/ExternalizationArchitectureCorrespondence.lean (or Agda/Coq/Isabelle equivalent) exists in the codebase. In a cs.PL submission claiming 'formal correspondence,' this is a critical gap that prevents independent verification of the paper's central thesis.
- [GATE — MAJOR] The operad, coalgebra, and wiring-diagram claims are likewise unaccompanied by formal definitions or checked closure proofs. No operad signature (objects, arities, equivariance), no polynomial functor specification for the coalgebraic memory model, and no operad-axiom tests exist. A mechanized artifact such as formal/HarnessOperadAndCertificates.lean is required before the categorical framing can be evaluated as more than decorative.
- [CITATION VERIFIER — ALL 9 UNVERIFIABLE] The citation verifier reports exists=false and no resolved DOI or URL for every one of the nine primary citations, including the three foundational preprints (delosriscos2026categorical, zhou2026externalization, ma2026atomic) on which the theoretical scaffolding directly rests. If these sources cannot be verified at the time of publication, the external theoretical grounding of the paper is unauditable and reviewers cannot assess whether the ArchAgents framework or the four-pillars taxonomy are established, peer-reviewed contributions.
- [TECHNICAL CORRECTNESS — MAJOR, C8] 'Compiler functors verify the functor laws' is asserted but never discharged: the source and target categories (objects, morphisms, identity, composition) are never formally defined, and neither a Lean proof nor a property-based test of identity-law and composition-law preservation across composable compiler pairs is provided. The CompilerFunctor wrapper constitutes a self-test, not functor-law verification.
- [TECHNICAL CORRECTNESS — MAJOR, C3] The 100% certificate-preservation table is a self-test inside one codebase against three certificate types that are, by construction, topology-independent (local hook-and-parameter assertions). No negative-control certificate (one that depends on graph topology and should fail under reshape) is tested. Without such a control, the table demonstrates operational sanity, not categorical preservation.
- [TECHNICAL CORRECTNESS — MAJOR, C5] The escalation experiment uses one task (hard_par_08) and two models (Phi-3 Mini, Gemma 4), yielding one data point. Abstract and conclusion language ('confirms that the quality-based escalation control path is model-parametric') is unwarranted; with n=1 there is no way to distinguish correct routing from a seed that happened to fall below the 0.6 threshold. The language must be downgraded to match the Section 6.2 disclaimer already present in the body.
- [TECHNICAL CORRECTNESS — MAJOR, C6] The claim that Ma et al.'s non-interference finding is 'precisely' the operad closure condition conflates an empirical RL-training result with a categorical structural claim. The paper names no operad signature, specifies no property class, and does not show that Ma et al.'s composition operations match the serial/parallel/trace wiring used here. This is reinterpretation, not derivation.
- [REPRODUCIBILITY — MAJOR] Reproducibility score 0.58. No reproduction script (scripts/reproduce_paper_results.sh), no machine-readable certificate-preservation artifact (eval/results/certificate_preservation.json), no SWE-bench manifest (eval/results/swebench_phase2_manifest.json), no escalation trace artifact (eval/results/escalation_hard_par_08.json), and no pinned LLM configuration (temperature, top-p, seed, retry template) are provided. Independent reproduction of any quantitative claim in the paper is not currently feasible.
- [TECHNICAL CORRECTNESS — MINOR, C1/C2/C17] The paper repeatedly uses 'exactly,' 'precisely,' and 'the formal theory' in the abstract and conclusion to describe what are, in the body, acknowledged to be conceptual correspondences with viable alternatives (Liu's lambda_A, Meng et al.'s six-tuple). This overstatement undermines the positioning and should be replaced with 'a formal theory' and 'a formal correspondence' throughout.
- [MISSING PRIOR ART] Neither the foundational applied category theory literature (Fong & Spivak, Seven Sketches in Compositionality, 2019) nor the coalgebraic AI semantics literature is cited, despite being directly relevant to the paper's core mathematical machinery (operads/wiring diagrams for open systems; coalgebraic agent-environment modeling). These omissions leave the categorical claims without established mathematical grounding.

## Open Questions

- Can the authors provide verified arXiv IDs or DOIs for all nine primary citations, and specifically for delosriscos2026categorical, zhou2026externalization, and ma2026atomic? If any of these are not publicly accessible preprints at submission time, how does the paper's theoretical framework stand without them?
- Will the authors supply a mechanized proof artifact (Lean 4, Agda, or Coq) for the headline correspondence—or, alternatively, explicitly demote 'formal correspondence' to 'conceptual correspondence' throughout and reposition the paper as an applied/engineering contribution rather than a formal-methods result?
- What are the precise definitions of the source and target categories for the claimed compiler functors (objects, morphisms, identity maps, composition law), and which specific functor laws does the CompilerFunctor.verify_functor_laws() method check at runtime? Can the authors include a tests/test_functor_laws.py demonstrating identity and composition preservation for at least one composable compiler pair?
- Can the escalation experiment be expanded to at least a 4×4 grid (multiple fast models × multiple strong models × ≥10 tasks) so that the 'model-parametric' claim can be evaluated quantitatively as the fraction of cases where the watcher fires iff the verifier score falls below threshold?
- Will the authors include a negative-control certificate in the preservation evaluation—one that is topology-dependent (e.g., 'every Verifier output is read by exactly one downstream Watcher') and should fail under hub-and-spoke reshape—to demonstrate that the runtime verifier can distinguish preservation from non-preservation, rather than always returning pass for the tested certificate class?

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
          "De los Riscos",
          "Corbacho",
          "Arbib"
        ],
        "doi": null,
        "key": "delosriscos2026categorical",
        "raw": "De los Riscos, Corbacho, and Arbib. Categorical Architecture for Agents. 2026.",
        "title": "Categorical Architecture for Agents",
        "url": null,
        "venue": "Preprint",
        "year": 2026
      },
      "exists": false,
      "explanation": "Introduces the ArchAgents category and the (G, Know, Phi) architecture triple which forms the formal basis for this paper's mapping of agent harnesses.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Zhou"
        ],
        "doi": null,
        "key": "zhou2026externalization",
        "raw": "Zhou et al. The Four Pillars of Agent Externalization. 2026.",
        "title": "The Four Pillars of Agent Externalization",
        "url": null,
        "venue": "Preprint",
        "year": 2026
      },
      "exists": false,
      "explanation": "Identifies the four pillars of agent externalization (Memory, Skills, Protocols, Harness Engineering) that the paper maps onto the categorical framework.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Liu"
        ],
        "doi": null,
        "key": "liu2026lambda",
        "raw": "Liu. A Typed Lambda Calculus for Agent Composition. 2026.",
        "title": "A Typed Lambda Calculus for Agent Composition",
        "url": null,
        "venue": "Preprint",
        "year": 2026
      },
      "exists": false,
      "explanation": "Provides an alternative formalization using a typed lambda calculus (lambda_A) for agent composition, serving as a point of comparison for the categorical approach.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Willstro"
        ],
        "doi": null,
        "key": "willstro2026nlah",
        "raw": "Willstro. Natural-Language Agent Harnesses. 2026.",
        "title": "Natural-Language Agent Harnesses",
        "url": null,
        "venue": "Preprint",
        "year": 2026
      },
      "exists": false,
      "explanation": "Discusses externalizing harness behavior as portable, editable natural-language artifacts, which is relevant to the paper's focus on harness-centric design.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Chen"
        ],
        "doi": null,
        "key": "chen2026skilltester",
        "raw": "Chen et al. SkillTester: A Comparative QA Harness for Agent Skills. 2026.",
        "title": "SkillTester: A Comparative QA Harness for Agent Skills",
        "url": null,
        "venue": "Preprint",
        "year": 2026
      },
      "exists": false,
      "explanation": "Introduces SkillTester, a comparative quality-assurance harness, which provides context for the systematic evaluation of agent skills.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Marom"
        ],
        "doi": null,
        "key": "marom2026category",
        "raw": "Marom. Compositional Verification in Engineered Systems. 2026.",
        "title": "Compositional Verification in Engineered Systems",
        "url": null,
        "venue": "Preprint",
        "year": 2026
      },
      "exists": false,
      "explanation": "Presents a structurally identical compositional-verification framework in a different domain (hygromorphic biological mechanisms), highlighting the generality of the approach.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Meng"
        ],
        "doi": null,
        "key": "meng2026agentharness",
        "raw": "Meng et al. A Taxonomy for Agent Harness Engineering. 2026.",
        "title": "A Taxonomy for Agent Harness Engineering",
        "url": null,
        "venue": "Preprint",
        "year": 2026
      },
      "exists": false,
      "explanation": "Provides a contemporaneous engineering taxonomy for agent harnesses, formalizing the harness as a six-component tuple and surveying the field.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Snodgrass"
        ],
        "doi": null,
        "key": "snodgrass2000temporal",
        "raw": "Snodgrass. Developing Time-Oriented Database Applications in SQL. 2000.",
        "title": "Developing Time-Oriented Database Applications in SQL",
        "url": null,
        "venue": "Morgan Kaufmann",
        "year": 2000
      },
      "exists": false,
      "explanation": "The source for bi-temporal memory concepts used in the paper's implementation of agent memory as coalgebraic state.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Ma"
        ],
        "doi": null,
        "key": "ma2026atomic",
        "raw": "Ma et al. Atomic Coding Skills as Basis Vectors. 2026.",
        "title": "Atomic Coding Skills as Basis Vectors",
        "url": null,
        "venue": "Preprint",
        "year": 2026
      },
      "exists": false,
      "explanation": "Identifies the five atomic coding skills (localize, edit, test, reproduce, review) that the paper uses as the basis for operad-based composition.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    }
  ],
  "missing_references": [
    {
      "reason": "Foundational work on applied category theory and compositionality in systems engineering, which provides the theoretical underpinnings for the categorical architecture approach.",
      "title": "Fong and Spivak. Seven Sketches in Compositionality: An Invitation to Applied Category Theory. 2019."
    },
    {
      "reason": "The paper uses operads to model skill composition but lacks a citation for the foundational mathematical work on operads in the context of computer science or systems.",
      "title": "Leinster. Higher Operads, Higher Categories. 2004."
    },
    {
      "reason": "Since the paper specifically targets LangGraph in its implementation and experiments, citing the foundational design or documentation of LangGraph would provide necessary context for the harness abstraction.",
      "title": "LangChain. LangGraph: Building State-of-the-Art Agents with Graph-Based Orchestration. 2024."
    }
  ],
  "summary": "The paper provides a formal mapping between categorical architecture and agent harness engineering. It correctly identifies and utilizes core references for its theoretical framework (De los Riscos et al., Zhou et al.) and its implementation components (Ma et al.). However, it lacks foundational citations for the category-theoretic and operadic concepts it employs, as well as specific documentation for the target orchestration frameworks like LangGraph."
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.79,
  "questions": [
    "Can the authors provide verified arXiv IDs or DOIs for all nine primary citations, and specifically for delosriscos2026categorical, zhou2026externalization, and ma2026atomic? If any of these are not publicly accessible preprints at submission time, how does the paper's theoretical framework stand without them?",
    "Will the authors supply a mechanized proof artifact (Lean 4, Agda, or Coq) for the headline correspondence—or, alternatively, explicitly demote 'formal correspondence' to 'conceptual correspondence' throughout and reposition the paper as an applied/engineering contribution rather than a formal-methods result?",
    "What are the precise definitions of the source and target categories for the claimed compiler functors (objects, morphisms, identity maps, composition law), and which specific functor laws does the CompilerFunctor.verify_functor_laws() method check at runtime? Can the authors include a tests/test_functor_laws.py demonstrating identity and composition preservation for at least one composable compiler pair?",
    "Can the escalation experiment be expanded to at least a 4×4 grid (multiple fast models × multiple strong models × ≥10 tasks) so that the 'model-parametric' claim can be evaluated quantitatively as the fraction of cases where the watcher fires iff the verifier score falls below threshold?",
    "Will the authors include a negative-control certificate in the preservation evaluation—one that is topology-dependent (e.g., 'every Verifier output is read by exactly one downstream Watcher') and should fail under hub-and-spoke reshape—to demonstrate that the runtime verifier can distinguish preservation from non-preservation, rather than always returning pass for the tested certificate class?"
  ],
  "recommendation": "major_revision",
  "strengths": [
    "High novelty score (0.88, 'significant' verdict): the operationalization of the abstract (G, Know, Phi) triple for concrete harness engineering and the definition of structure-preserving compiler morphisms are substantive conceptual contributions that advance the field.",
    "Working open-source reference implementation (github.com/coredipper/operon, MIT license, operon-ai on PyPI) with five compiler adapters and a runtime certificate-replay mechanism—code exists and is acknowledged by all specialists.",
    "Empirical honesty: negative SWE-bench results are reported without spin, model limitations are attributed correctly to 8B-class format-discipline ceilings, and immutable model digests (gemma4 c6eb396dbd59, deepseek-r1:8b 6995872bfe4c) are provided for reproducibility of the null result.",
    "Useful engineering taxonomy: the four-pillar-to-categorical-role mapping (Memory→coalgebra, Skills→operad, Protocols→wiring, Harness→triple) provides a precise shared vocabulary for a field currently lacking formal terminology, regardless of whether the correspondence is formally proved.",
    "Certificate preservation runtime verification across five orchestration frameworks (Swarms, DeerFlow, Ralph, Scion, LangGraph) for three certificate types demonstrates that the replay invariant is operationally sound for topology-independent certificate classes.",
    "Honest scoping of the escalation experiment: Section 6.2 acknowledges the single-task, two-model setup, and the independent Phi-3/Gemma validation (0.72 vs 1.00) correctly establishes task discriminativity before the watcher experiment."
  ],
  "summary": "This paper proposes category theory—specifically the ArchAgents Architecture triple (G, Know, Phi)—as the formal foundation for agent harness engineering, mapping the four pillars of agent externalization (Memory, Skills, Protocols, Harness Engineering) to categorical roles (coalgebras, operads, wiring diagrams, triple composition). The central contributions are: (1) a claimed formal correspondence between the two frameworks, (2) compiler functors that compile Operon harnesses to five orchestration targets (Swarms, DeerFlow, Ralph, Scion, LangGraph) with asserted certificate preservation, (3) a runtime certificate-replay mechanism, (4) a single-task model-escalation experiment, and (5) honest negative SWE-bench results. The novelty specialist scores this 0.88 with a 'significant' verdict. However, the review is materially constrained by two cross-cutting problems. First, the reproducibility specialist (confidence 0.78) flags a CRITICAL proof-as-code gap: the headline correspondence is stated entirely in prose with no mechanized artifact (e.g., formal/ExternalizationArchitectureCorrespondence.lean), and the operad/coalgebra/wiring claims lack checked axiom files—this directly blocks the headline claim per the recommendation gate. Second, the citation verifier reports exists=false and no resolved DOI or URL for all nine primary citations, including the three foundational preprints (delosriscos2026categorical, zhou2026externalization, ma2026atomic) on which the entire theoretical scaffolding depends; if these are unverifiable at publication, the framework's grounding is unauditable. Technical correctness (confidence 0.70, overall mostly_sound) adds five major deficiencies: the formal correspondence reduces to a conceptual mapping (C1), compiler functors are self-tested inside one codebase with no independent category-law verification (C3, C8), the escalation experiment is n=1 task and n=2 models (C5), and the operad framing for atomic skills lacks signature, axioms, or closure proofs (C6). The cumulative weight of the critical proof-as-code gap blocking the headline claim, five major correctness deficiencies, unverifiable foundational citations, and a reproducibility score of 0.58 warrants major revision before this paper can be accepted.",
  "weaknesses": [
    "[GATE — CRITICAL, blocks headline claim] The headline correspondence '(G, Know, Phi) exactly formalizes Memory, Skills, Protocols, and Harness Engineering' is stated entirely in prose without any mechanized mapping or proof artifact. No formal/ExternalizationArchitectureCorrespondence.lean (or Agda/Coq/Isabelle equivalent) exists in the codebase. In a cs.PL submission claiming 'formal correspondence,' this is a critical gap that prevents independent verification of the paper's central thesis.",
    "[GATE — MAJOR] The operad, coalgebra, and wiring-diagram claims are likewise unaccompanied by formal definitions or checked closure proofs. No operad signature (objects, arities, equivariance), no polynomial functor specification for the coalgebraic memory model, and no operad-axiom tests exist. A mechanized artifact such as formal/HarnessOperadAndCertificates.lean is required before the categorical framing can be evaluated as more than decorative.",
    "[CITATION VERIFIER — ALL 9 UNVERIFIABLE] The citation verifier reports exists=false and no resolved DOI or URL for every one of the nine primary citations, including the three foundational preprints (delosriscos2026categorical, zhou2026externalization, ma2026atomic) on which the theoretical scaffolding directly rests. If these sources cannot be verified at the time of publication, the external theoretical grounding of the paper is unauditable and reviewers cannot assess whether the ArchAgents framework or the four-pillars taxonomy are established, peer-reviewed contributions.",
    "[TECHNICAL CORRECTNESS — MAJOR, C8] 'Compiler functors verify the functor laws' is asserted but never discharged: the source and target categories (objects, morphisms, identity, composition) are never formally defined, and neither a Lean proof nor a property-based test of identity-law and composition-law preservation across composable compiler pairs is provided. The CompilerFunctor wrapper constitutes a self-test, not functor-law verification.",
    "[TECHNICAL CORRECTNESS — MAJOR, C3] The 100% certificate-preservation table is a self-test inside one codebase against three certificate types that are, by construction, topology-independent (local hook-and-parameter assertions). No negative-control certificate (one that depends on graph topology and should fail under reshape) is tested. Without such a control, the table demonstrates operational sanity, not categorical preservation.",
    "[TECHNICAL CORRECTNESS — MAJOR, C5] The escalation experiment uses one task (hard_par_08) and two models (Phi-3 Mini, Gemma 4), yielding one data point. Abstract and conclusion language ('confirms that the quality-based escalation control path is model-parametric') is unwarranted; with n=1 there is no way to distinguish correct routing from a seed that happened to fall below the 0.6 threshold. The language must be downgraded to match the Section 6.2 disclaimer already present in the body.",
    "[TECHNICAL CORRECTNESS — MAJOR, C6] The claim that Ma et al.'s non-interference finding is 'precisely' the operad closure condition conflates an empirical RL-training result with a categorical structural claim. The paper names no operad signature, specifies no property class, and does not show that Ma et al.'s composition operations match the serial/parallel/trace wiring used here. This is reinterpretation, not derivation.",
    "[REPRODUCIBILITY — MAJOR] Reproducibility score 0.58. No reproduction script (scripts/reproduce_paper_results.sh), no machine-readable certificate-preservation artifact (eval/results/certificate_preservation.json), no SWE-bench manifest (eval/results/swebench_phase2_manifest.json), no escalation trace artifact (eval/results/escalation_hard_par_08.json), and no pinned LLM configuration (temperature, top-p, seed, retry template) are provided. Independent reproduction of any quantitative claim in the paper is not currently feasible.",
    "[TECHNICAL CORRECTNESS — MINOR, C1/C2/C17] The paper repeatedly uses 'exactly,' 'precisely,' and 'the formal theory' in the abstract and conclusion to describe what are, in the body, acknowledged to be conceptual correspondences with viable alternatives (Liu's lambda_A, Meng et al.'s six-tuple). This overstatement undermines the positioning and should be replaced with 'a formal theory' and 'a formal correspondence' throughout.",
    "[MISSING PRIOR ART] Neither the foundational applied category theory literature (Fong & Spivak, Seven Sketches in Compositionality, 2019) nor the coalgebraic AI semantics literature is cited, despite being directly relevant to the paper's core mathematical machinery (operads/wiring diagrams for open systems; coalgebraic agent-environment modeling). These omissions leave the categorical claims without established mathematical grounding."
  ]
}
```

### novelty (`gemini-3-flash-preview`) — status: `pass`

```json
{
  "confidence": 0.8,
  "missing_prior_art": [
    {
      "reason": "The paper uses operads and wiring diagrams (G) to formalize skill composition but omits foundational references to the categorical theory of open systems and networked composition (e.g., Baez & Fong) which provide the mathematical basis for such diagrams.",
      "title": "An Invitation to Applied Category Theory: Seven Sketches in Compositionality"
    },
    {
      "reason": "While identifying memory as coalgebraic state, the paper lacks citations for the established literature on coalgebraic modeling of agent-environment loops and bisimulation in concurrent systems.",
      "title": "Coalgebraic Semantics for Artificial Intelligence"
    }
  ],
  "novelty_score": 0.88,
  "related_work": [
    {
      "citation_key": "delosriscos2026categorical",
      "delta": "Operationalizes the abstract (G, Know, Phi) triple for agent harnesses and defines structure-preserving morphisms as cross-framework compilers.",
      "relation": "builds_on",
      "title": "Categorical Architecture for Agents"
    },
    {
      "citation_key": "zhou2026externalization",
      "delta": "Maps the empirical pillars of externalization (Memory, Skills, Protocols) to formal categorical roles (Coalgebras, Operads, Wiring Diagrams).",
      "relation": "builds_on",
      "title": "The Four Pillars of Agent Externalization"
    },
    {
      "citation_key": "meng2026agentharness",
      "delta": "Solves the open challenge of compositional reasoning and certificate preservation identified in the Harness Completeness Matrix.",
      "relation": "prior_art",
      "title": "The Harness Completeness Matrix: A Survey"
    },
    {
      "citation_key": "liu2026lambda",
      "delta": "Complements the type-theoretic safety of Lambda-A with categorical property preservation across heterogeneous orchestration frameworks.",
      "relation": "orthogonal",
      "title": "Lambda-A: A Typed Calculus for Agentic Composition"
    }
  ],
  "verdict": "significant"
}
```

### reproducibility (`gpt-5.5`) — status: `pass`

```json
{
  "code_availability": "open_source",
  "code_url": "https://github.com/coredipper/operon",
  "concerns": [
    {
      "area": "other",
      "description": "Proof-as-code gap: the headline correspondence that the Architecture triple (G, Know, Phi) exactly formalizes Memory, Skills, Protocols, and Harness Engineering is stated in prose but no mechanized mapping/proof artifact is provided. A formal artifact such as formal/ExternalizationArchitectureCorrespondence.lean would close this gap.",
      "severity": "critical"
    },
    {
      "area": "other",
      "description": "Proof-as-code gap: the operad, coalgebra, wiring, and certificate-preserving composition claims are not accompanied by formal definitions and checked closure proofs. A mechanized artifact such as formal/HarnessOperadAndCertificates.lean would be needed for independent proof reproduction.",
      "severity": "major"
    },
    {
      "area": "code",
      "description": "The code repository is reachable and open source, but the paper does not give exact reproduction commands for architecture extraction, the five compiler-functor preservation checks, LangGraph per-stage execution, or the atomic skills catalog. A script such as scripts/reproduce_paper_results.sh would materially improve reproducibility.",
      "severity": "major"
    },
    {
      "area": "evaluation",
      "description": "The certificate preservation tables report 100% preservation, but only high-level functions and result summaries are given. A machine-readable artifact at eval/results/certificate_preservation.json with theorem identity, parameters, evidence hashes, and verifier results would close this gap.",
      "severity": "major"
    },
    {
      "area": "evaluation",
      "description": "The escalation experiment uses one custom task hard_par_08 and two local models, but the paper does not identify raw prompts, model outputs, judge rubric, and verifier scores. Public artifacts at eval/results/escalation_hard_par_08.json and eval/tasks/hard_par_08.json would close this gap.",
      "severity": "major"
    },
    {
      "area": "hyperparameters",
      "description": "LLM generation settings are under-specified for the escalation and SWE-bench runs: temperature, top-p/top-k, max tokens, seed or deterministic settings, timeout policy, judge prompt, and retry prompt templates are not fully pinned. A config file such as eval/configs/paper_v035.yaml would close this gap.",
      "severity": "major"
    },
    {
      "area": "data",
      "description": "The SWE-bench results cite eval/results/swebench_phase2.json and eval/results/swebench_phase2_deepseek_retry.json, but the paper does not include a complete manifest of the 10 instance IDs, raw model outputs, sanitizer decisions, retry prompts, and applied patches. A public eval/results/swebench_phase2_manifest.json and eval/results/raw/ directory would make the empirical reproduction auditable.",
      "severity": "major"
    },
    {
      "area": "compute",
      "description": "The local compute environment is not specified beyond model quantization and latency. Hardware, Ollama version, Docker/SWE-bench image digests, operating system, and resource limits can affect timeouts and local-model behavior; an environment lock artifact such as eval/environment/paper_v035.lock would close this gap.",
      "severity": "minor"
    }
  ],
  "confidence": 0.78,
  "data_availability": "public",
  "data_url": null,
  "environment": {
    "dependencies": [
      "operon-ai",
      "Ollama",
      "gemma4:latest digest c6eb396dbd59, blob sha256:4c27e0f5, Q4_K_M",
      "deepseek-r1:8b digest 6995872bfe4c, blob sha256:e6a7edc1, Q4_K_M",
      "Phi-3 Mini via Ollama",
      "Gemma 4 via Ollama for judging/escalation",
      "Docker",
      "official SWE-bench Docker harness",
      "LangGraph",
      "Swarms",
      "DeerFlow",
      "Ralph",
      "Scion"
    ],
    "hardware": "Local hardware not specified; requires enough CPU/GPU/RAM to run Ollama 8B Q4_K_M models and the SWE-bench Docker harness, with reported calls up to about 18-19 minutes.",
    "software": "Operon/operon-ai Python stack with Ollama, Docker, official SWE-bench harness, LangGraph, and compiler adapters for Swarms, DeerFlow, Ralph, and Scion; exact Python/package versions and lockfile are not specified in the paper."
  },
  "reproducibility_score": 0.58
}
```

### summary (`claude-haiku-4-5-20251001`) — status: `pass`

```json
{
  "audience": "Researchers in programming language design, formal methods, and AI systems; software architects building production LLM-based agents; framework developers (LangGraph, CrewAI, etc.); anyone designing or maintaining agent harnesses who wants principled composition and portability guarantees",
  "key_contributions": [
    "Establishes a formal correspondence between the four pillars of agent externalization (Memory, Skills, Protocols, Harness Engineering) and the categorical Architecture triple (G, Know, Phi), bridging engineering practice with mathematical formalization",
    "Defines 'structural certificates' as replayable properties of harness architecture that are independent of model choice or specific framework, providing a language for stating what harnesses guarantee",
    "Implements five compiler functors demonstrating that structural certificates survive compilation across diverse orchestration frameworks (Swarms, DeerFlow, Ralph, Scion, LangGraph) with 100% preservation and verification",
    "Proves through experiment that quality-based model escalation is harness-level, model-parametric behavior: the same harness can route between models (Phi-3 Mini to Gemma 4) while preserving control structure",
    "Provides reference implementation (Operon framework, MIT license) with architecture extraction, certificate verification, and atomic skills composition following operad algebra"
  ],
  "plain_language_summary": "Modern LLM-based agent systems rely on a \"harness\"—prompts, tools, memory management, and orchestration logic—to turn a language model into a reliable, functional system. Yet engineers build harnesses through trial and error, with no formal theory to govern how they're designed, composed, or migrated between frameworks. This paper proposes that an existing mathematical framework called category theory (specifically, a structure called the Architecture triple) already formalizes exactly what a harness is. The key insight: the four components that make up an agent system (Memory, Skills, communication Protocols, and Harness Engineering itself) map directly onto the mathematical triple's components. More importantly, structural guarantees like \"the system will escalate to a stronger model when quality drops below a threshold\" are properties of the harness architecture itself, not tied to any specific language model. When you change models or recompile the harness for a different framework (e.g., from LangGraph to another orchestrator), these guarantees can be preserved and verified mathematically, rather than being lost or reimplemented from scratch.",
  "tldr": "A paper proposing category theory as the formal foundation for agent harness engineering, showing that structural guarantees survive compilation across different orchestration frameworks."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `pass`

```json
{
  "claims": [
    {
      "assessment": "partially_supported",
      "claim": "The four pillars of agent externalization (Memory, Skills, Protocols, Harness) map onto the Architecture triple (G, Know, Phi) as a formal correspondence.",
      "evidence": "The mapping is presented as a tabular correspondence and a series of textual identifications ('Memory as coalgebraic state', 'Skills as operad-composed objects'). It is described as a 'formal correspondence with executable implementation' (Discussion), but no theorem, isomorphism, or proof is given that the pillars and the triple are categorically equivalent. The 'coalgebraic' framing for memory introduces (S, phi: S -> P(S)) but never actually uses the coalgebra structure (no bisimulation, no final coalgebra reasoning); the operad framing for skills names the composition operations but never specifies the underlying operad, its objects, or its axioms. The correspondence is therefore a useful conceptual mapping rather than a proved categorical statement.",
      "id": "C1",
      "location": "Introduction; Section 3 (The Correspondence)",
      "severity": "major",
      "suggested_fix": "Either (a) demote 'formal correspondence' to 'conceptual correspondence' throughout, or (b) state and prove the correspondence as a definition + lemma: name the operad (objects, arities, equivariance), name the polynomial functor whose coalgebra is the memory, and prove the four-component decomposition is well-defined. A short Lean/Agda formalization of the triple-and-functor data at src/proofs/Architecture.lean would convert this from claim to artifact."
    },
    {
      "assessment": "partially_supported",
      "claim": "The categorical Architecture triple from ArchAgents provides 'exactly' the formalization that harness design requires.",
      "evidence": "The paper uses ArchAgents (delosriscos2026categorical) as a given external framework and cites its Proposition 5.1 ('certificate preservation') operationally rather than proving it. The 'exactly' framing overstates what is shown: the paper exhibits a plausible mapping plus an implementation, not a uniqueness or universality result that rules out alternative formalizations (e.g., Liu's lambda_A is acknowledged as 'complementary', and Meng et al.'s six-tuple is acknowledged as a refinement, undermining the 'exactly' wording).",
      "id": "C2",
      "location": "Abstract; Introduction",
      "severity": "minor",
      "suggested_fix": "Replace 'exactly this formalization' with 'one suitable formalization' and add an explicit comparison subsection enumerating what categorical, type-theoretic, and tuple-based formalizations each capture and miss."
    },
    {
      "assessment": "partially_supported",
      "claim": "Compiler functors preserve three named certificate types by identity or replay across five targets (Swarms, DeerFlow, Ralph, Scion, LangGraph).",
      "evidence": "The empirical preservation table reports 3/3 (100%) for four non-LangGraph compilers, and the LangGraph compiler is asserted to preserve via per-stage execution of run_single_stage(). The 'verification' is a runtime check inside the same codebase that produces the certificates, against a fixed set of three certificate types from a single reference implementation. This is a self-test, not an independent functor-law proof: there is no Lean/Coq/Agda artifact verifying that the source-to-target mapping is a functor, no statement of the source or target category formally (objects, morphisms, identity, composition), and no adversarial certificate (one designed to break under reshape) is tested. DeerFlow and Ralph 'reshape' the graph yet certificates still pass, which is consistent with the operational claim (replay depends on hooks and parameters, not topology) but also means the test does not stress the preservation invariant.",
      "id": "C3",
      "location": "Section 4 (Certificate Preservation); Section 6.3 table",
      "severity": "major",
      "suggested_fix": "Add at least one negative-control certificate that depends on graph topology (e.g., 'no stage downstream of X executes before Y') and show it correctly fails preservation under hub-and-spoke reshape. Provide functor-law verification (left/right unit, associativity) as a Lean or Hypothesis-based test artifact at tests/proofs/test_functor_laws.py and surface its result. Without one of these, the table reports test pass rates, not preservation in the categorical sense."
    },
    {
      "assessment": "supported",
      "claim": "The LangGraph compiler reuses the same per-stage code path (run_single_stage) as the native runtime, achieving 'zero reimplementation' and identical certificate behavior.",
      "evidence": "This is a design claim about code structure that is consistent with the description and with the reported preservation result. The argument is internally coherent: if both the native run loop and the LangGraph node call the same per-stage method with the same hooks, then certificate replay outcomes will agree by construction. The claim is contingent on the implementation actually being structured this way, which is testable in the cited repository (operon-ai).",
      "id": "C4",
      "location": "Section 4 (The LangGraph Compiler)",
      "severity": "info",
      "suggested_fix": "Include a short integration test (tests/test_langgraph_parity.py) that runs the same organism through organism.run() and through the LangGraph-compiled graph on identical inputs and asserts equal certificate verdicts and equal per-stage intervention sequences. Cite this test by path in the paper."
    },
    {
      "assessment": "partially_supported",
      "claim": "The quality-based escalation control path is model-parametric, demonstrated by a Phi-3 Mini -> Gemma 4 escalation on task hard_par_08.",
      "evidence": "The reported single trace (Phi-3 Mini scores 0.50, watcher fires, Gemma 4 re-executes) is consistent with the claim that the escalation path is driven by harness structure rather than the specific model. But n=1 task and n=2 models is reported as a single instance, not a statistical demonstration. The paper itself flags this ('In this two-model, one-task experiment, ...'), but the abstract and conclusion still phrase the result as 'confirms that the quality-based escalation control path is model-parametric' without that qualifier. With one task, two models, and one trial there is no way to distinguish 'the harness routed correctly' from 'this seed happened to fall below 0.6'. The independent validation (Phi-3=0.72, Gemma=1.00) speaks to task discriminativity, not to escalation-path model-parametricity.",
      "id": "C5",
      "location": "Section 6.2 (Escalation Experiment)",
      "severity": "major",
      "suggested_fix": "Either (a) downgrade language in the abstract and conclusion to match Section 6 ('demonstrates the escalation path on one task with two local models'), or (b) run a 4x4 or larger grid (multiple fast models x multiple deep models x at least 10 tasks) and report the fraction of cases where the watcher fires iff the verifier score is below threshold, plus the fraction where deep-model output clears threshold. The current data does not establish parametricity in any quantitative sense."
    },
    {
      "assessment": "unsupported",
      "claim": "Ma et al.'s finding that five atomic coding skills compose without negative interference is 'precisely' the claim that operad composition supports property-preserving composition under closure conditions.",
      "evidence": "The paper asserts a strong identification ('precisely the claim') without giving the operad's signature, naming the property class, or stating the closure condition. Ma et al.'s empirical finding is about joint RL training of skills not degrading individual performance; the paper restates this as a categorical closure property but does not show the property in question is the one Ma et al. measured, nor that the composition operations (serial / parallel / trace) are the same operations under which Ma et al.'s non-interference was tested (Ma et al. do not, in general, train under serial/parallel/trace harness wiring). Without that bridge, the operadic framing is a reinterpretation rather than a derivation. Per the proof-as-code axiom for cs.PL: there is no formal operad object in the codebase (no operad axiom checks, no composition associativity tests) that would back the 'precisely' wording.",
      "id": "C6",
      "location": "Section 5 (Atomic Skills as Operad Composition)",
      "severity": "major",
      "suggested_fix": "Reduce 'precisely the claim that' to 'consistent with the structural condition that', and add a short formal section: define the operad (Sets of typed ports, n-ary composition law, equivariance), state the closure condition explicitly ('certificate type X is preserved under serial composition if ...'), and either prove closure for one concrete certificate or empirically demonstrate closure under all three composition modes by composing two atomic skills (e.g., localize o edit) and showing certificates of each component survive composition. Code artifact: tests/test_operad_closure.py."
    },
    {
      "assessment": "unsupported",
      "claim": "Marom et al.'s biological-to-engineered translation framework is structurally identical to the certificate-preservation framework of this paper and provides 'independent, non-LLM, physically-fabricated evidence for the same compositional claim'.",
      "evidence": "The paper itself disclaims equivalence ('We make no equivalence claim'). What remains is a thematic resonance: both works use functors between categories and a closure-under-composition property. But 'structurally identical' is not demonstrated -- the categories (Nat, Art, Spec, Comp vs ArchAgents) are not aligned object-by-object, the functor data is not shown to be the same, and 'evidence for the same compositional claim' conflates 'a compositional principle works in two domains' with 'this paper's specific preservation invariant is corroborated'. The 4D-printing closure-under-composition theorem corroborates Marom et al.'s own framework, not ArchAgents'.",
      "id": "C7",
      "location": "Section 2.4 (Cross-Domain Corroboration)",
      "severity": "minor",
      "suggested_fix": "Soften 'structurally identical' to 'thematically aligned' and remove the 'evidence for the same compositional claim' phrasing, or alternatively give an explicit functor F : ArchAgents -> Marom-Dyn with the laws checked and the certificate-preservation property pulled back. Without the functor, this section is motivation, not corroboration."
    },
    {
      "assessment": "partially_supported",
      "claim": "Compilers are 'functors' that 'verify the functor laws' automatically.",
      "evidence": "The text repeatedly invokes 'functor' terminology and says the CompilerFunctor wrapper 'verifies the functor laws', but the paper never specifies the source category, the target category, or how identity and composition are realized in code -- nor what the laws being verified are (identity preservation? composition preservation across two chained compilers?). Without those definitions, 'functor laws' is undischarged. Per the proof-as-code axiom: a paper in cs.PL claiming functoriality should ship either a formal proof (Lean/Coq/Agda) or, at minimum, runtime tests that exercise both laws across composable compilers.",
      "id": "C8",
      "location": "Section 6.1 (Reference Implementation); Section 4.1 (Compiler Functors)",
      "severity": "major",
      "suggested_fix": "Add a subsection defining the categories Arch(Source) and Arch(Target) (objects, morphisms, identities, composition) and state precisely which functor laws are checked at runtime. Include tests/test_functor_laws.py demonstrating identity (F(id_A) = id_{F(A)}) and composition (F(g . f) = F(g) . F(f)) for at least one composable pair of compilers, and report the result in the empirical table. As written, the 'functor' label is suggestive but not earned."
    },
    {
      "assessment": "supported",
      "claim": "The 8B-class format-discipline ceiling generalizes across training regimes, evidenced by both Gemma 4 and DeepSeek-R1:8B producing 0 resolved instances on SWE-bench-lite with reason-coded retry.",
      "evidence": "The data shown (Gemma 4: 1 evaluated unresolved out of 30; DeepSeek-R1:8B: 0/30 evaluated with reason-coded retry; reason distribution 26/30 empty_extraction, 4/30 hunk-format) is consistent with the stated conclusion that retry-with-guidance helps only models that occasionally misformat, not models that fail to produce diff-shaped output at all. The paper appropriately disclaims that this does not show the organism architecture is intrinsically worse and notes the result is under-powered for that comparison. The negative result is honestly reported with immutable model digests.",
      "id": "C9",
      "location": "Section 6.5 (Phase C: Cross-Model Check)",
      "severity": "info",
      "suggested_fix": "None required for correctness. Optionally, run one cloud-GPU 70B-class baseline (the paper already names this as the natural next wedge) to convert the 'ceiling generalizes across two 8B Q4_K_M models' claim into the stronger 'ceiling is specifically the 8B-class capability boundary'. With only two local 8B models, both Q4_K_M, training-regime generalization is suggestive, not established."
    },
    {
      "assessment": "partially_supported",
      "claim": "Structural guarantees are Know-level certificates that survive compilation because their hooks and parameters are preserved, independent of graph topology.",
      "evidence": "This is internally consistent given the certificate definitions used in the paper (priority gating, quorum no-false-activation, mTOR no-oscillation) -- all three are statements about local component parameters and steady-state dynamics, none mention multi-stage topology. So preservation under graph reshape is essentially built into the choice of certificate. The claim is true for the tested certificate class but the paper sometimes phrases it as a general property of Know-level certificates ('the supported certificates remain replayable when their hooks and parameters are preserved'), which is tautological for hook-replay certificates and would fail for topology-dependent ones (e.g., 'every Verifier output is read by exactly one downstream Watcher').",
      "id": "C10",
      "location": "Section 4.3 (Empirical Verification); Conclusion",
      "severity": "minor",
      "suggested_fix": "Add a one-paragraph caveat distinguishing topology-independent certificates (the class actually tested) from topology-dependent certificates (e.g., causal-order or data-flow invariants), and state explicitly that the preservation invariant in Section 4 is established only for the former. Provide an example of a topology-dependent certificate and discuss whether the LangGraph fork/join compiler preserves it -- this is testable in the existing codebase."
    },
    {
      "assessment": "unsupported",
      "claim": "Memory is modeled as a coalgebra (S, phi: S -> P(S)) for a polynomial functor, providing the categorical foundation for bi-temporal memory.",
      "evidence": "The coalgebra is named but never used. No polynomial functor is specified (powerset P is mentioned but powerset is a functor, not a polynomial functor in the precise sense), no transition function for bi-temporal memory is given as a coalgebra map, and no coalgebraic reasoning (e.g., bisimulation between memory states, finality, observational equivalence) is invoked. The 'coalgebraic' framing therefore decorates rather than supports the bi-temporal memory design.",
      "id": "C11",
      "location": "Section 3.1 (Memory as Coalgebraic State)",
      "severity": "minor",
      "suggested_fix": "Either remove the coalgebra claim (bi-temporal memory stands on its own as a database technique with the Snodgrass citation) or instantiate it: define the polynomial functor F such that bi-temporal records form an F-coalgebra, and use the structure to derive something non-trivial (e.g., 'belief-state reconstruction at time t is the unique morphism from the initial F-coalgebra')."
    },
    {
      "assessment": "unsupported",
      "claim": "'Wire-level optics' (lenses, prisms, traversals) formalize the Protocols pillar's interaction structure.",
      "evidence": "Lenses, prisms, and traversals are named but not defined in the paper, their laws are not stated, and no example is given of a wire-level optic in the codebase. The Protocols-as-G claim itself (syntactic wiring graph with typed ports) is well-supported; the optical-types layer on top is asserted without grounding.",
      "id": "C12",
      "location": "Section 3.3 (Protocols as Syntactic Wiring G)",
      "severity": "minor",
      "suggested_fix": "Either drop the optics paragraph or add a short formal block defining the three optic types in this setting (target/source pairs, laws), and give one concrete example with code: e.g., 'this constitutional access port is a lens because get_then_set = id'. Code artifact: src/optics/wire_optics.py with property-based tests for lens/prism/traversal laws."
    },
    {
      "assessment": "supported",
      "claim": "Bi-temporal memory enables belief-state reconstruction ('what did the agent know at decision point t').",
      "evidence": "Bi-temporal storage (valid time + transaction/record time) is a well-established database pattern (Snodgrass) and as-of queries trivially recover historical record states. The claim is standard and uncontroversial.",
      "id": "C13",
      "location": "Section 3.1",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "94.1% of 835 real-world GitHub agent configurations are structurally incomplete under lambda_A (Liu).",
      "evidence": "This is a restated empirical result from the cited liu2026lambda preprint, not an original claim of this paper. Its accuracy depends on the cited source, which this review cannot verify, but the way it is cited (as background, with a specific number) is appropriate.",
      "id": "C14",
      "location": "Section 2.3 (Alternative Formalizations)",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "The reference implementation is available at github.com/coredipper/operon (operon-ai on PyPI, MIT license) and contains the compiler functors, atomic skills catalog, and certificate framework.",
      "evidence": "The paper claims open-source availability and names specific module entry points (extract_architecture, organism_to_langgraph, seed_library_from_atomic_skills, etc.). This review cannot fetch the repository or PyPI page to confirm the artifacts named in the paper match what is published, the version pinned to v0.35.0 (mentioned in Section 6.5) is tagged, or whether the certificate-preservation tests are runnable. Per the proof-as-code axiom for cs.PL: the artifact existing is necessary but not sufficient -- the named claims (5 compilers, 3 certificate types preserved, functor laws verified) should be re-runnable from a frozen tag.",
      "id": "C15",
      "location": "Section 7 (Availability)",
      "severity": "minor",
      "suggested_fix": "Pin a release tag (e.g., v0.35.0-paper) and include in the paper a single command that reproduces the Section 6.3 preservation table and the Section 6.2 escalation trace, with expected outputs. Add an eval/results/ directory containing the JSON artifacts already cited in the paper (swebench_phase2.json, swebench_phase2_deepseek_retry.json) so reviewers can diff actual vs claimed numbers."
    },
    {
      "assessment": "partially_supported",
      "claim": "Across the five compiler targets tested, the three supported certificate types preserve identity and verify (100% preservation in the table).",
      "evidence": "The two preservation tables in Sections 4.3 and 6.3 report Swarms/DeerFlow/Ralph/Scion at 100% (3/3 each). The 6.3 table omits LangGraph (footnoted as preserved via per-stage execution), while the 4.3 table includes LangGraph as preserved. Both are internally consistent given the paper's stated invariant, but the result is a self-test inside one codebase against three certificate types that, by construction, depend only on local hooks and parameters (see C10). 100% pass rate under those conditions is closer to a sanity check than an empirical demonstration of preservation.",
      "id": "C16",
      "location": "Section 4.3 table; Section 6.3 table",
      "severity": "minor",
      "suggested_fix": "Expand the certificate suite to at least 5-7 types, including at least one negative control (a certificate known to fail under topology reshape), and report the per-(compiler, certificate) pass/fail matrix rather than aggregated 3/3 rows. Add ablation: what happens if you intentionally rename a hook or perturb a parameter in the target -- does verifier replay catch it?"
    },
    {
      "assessment": "partially_supported",
      "claim": "The result positions categorical architecture as the formal theory behind harness engineering.",
      "evidence": "What is shown: (a) a useful conceptual correspondence between an existing categorical framework and an existing engineering taxonomy, (b) a working reference implementation, (c) runtime certificate-replay checks across five compiler targets for three certificate types, (d) one escalation trace, (e) honest negative SWE-bench results. What is not shown: a formal proof that ArchAgents is *the* theory (uniqueness/universality), or that it captures properties other formalizations (Liu's lambda_A, Meng et al.'s six-tuple) miss. The phrase 'the formal theory' overclaims relative to the evidence; 'a formal theory' would be defensible.",
      "id": "C17",
      "location": "Abstract; Conclusion",
      "severity": "minor",
      "suggested_fix": "Replace 'the formal theory behind harness engineering' with 'a formal theory for harness engineering' in the abstract and conclusion. Optionally, add a short subsection comparing what each candidate formalization (categorical, type-theoretic, tuple-based) is uniquely good for, to make the positioning concrete rather than supremacist."
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

_No bibliography extracted._

