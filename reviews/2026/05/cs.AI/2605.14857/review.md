# A Deterministic Agentic Workflow for HS Tariff Classification: Multi-Dimensional Rule Reasoning with Interpretable Decisions

GrokRxiv review of [arXiv:2605.14857](https://arxiv.org/abs/2605.14857) · `cs.AI`

## TL;DR

This paper proposes a deterministic agentic workflow for Harmonized System (HS) tariff classification, decomposing the task into six fixed stages with narrowly-scoped LLM calls rather than relying on end-to-end prompting. The system combines offline knowledge-engineering of the Chinese HS tariff schedule with an online multi-stage pipeline, achieving claimed top-1 accuracy of 75% at four digits and 64.2% at six digits on HSCodeComp. The paper additionally questions the quality of benchmark ground-truth labels through a manual audit. Across the five specialist reviews, the work is regarded as addressing a practically important and technically interesting problem with a reasonable approach, but significant concerns remain around model naming accuracy, reproducibility, citation coverage, empirical substantiation of key claims, and benchmark integrity.

_Recommendation_: **Major revision** · _Confidence_: 72%

## Strengths

- Addresses a practically significant and underexplored problem—multi-dimensional rule reasoning for HS tariff classification—with a well-motivated architectural design rooted in the General Interpretive Rules of the Harmonized System.
- The deterministic workflow concept (fixed control flow, narrow LLM calls, local reflection/verification) is a principled and differentiating design choice relative to autonomous self-planning agents, offering interpretability by construction through stage-wise structured outputs with verbatim rule citations.
- Empirical results appear competitive, and the finding that a smaller open-weight model achieves performance close to a frontier model suggests the approach is model-agnostic and practically deployable.
- The benchmark audit raising questions about HSCodeComp ground-truth label quality is a valuable contribution to the community, potentially prompting dataset curation efforts.
- Novelty is judged significant: the paper introduces a domain-specific deterministic agentic architecture for a high-stakes regulatory classification task, with clear differentiation from prior end-to-end and self-planning approaches.

## Weaknesses

- Model identifiers appear incorrect or at least undocumented: 'Qwen3.6-plus' and 'Qwen3.6-27B-FP8' do not correspond to known public model releases, undermining reproducibility and the credibility of reported numbers.
- Reproducibility is severely limited: no code repository, no dataset or knowledge-base URL, no prompt templates, no decoding hyperparameters, no retrieval/indexing parameters, and no compute environment details are provided.
- Key empirical claims are insufficiently substantiated: the performance numbers cannot be independently verified, the distinction between inter-model agreement and ground-truth accuracy is blurred for the open-weight model results, and the benchmark audit lacks inter-annotator reliability statistics and auditor credential disclosure.
- The claim that end-to-end prompting 'characteristically fails' at multi-dimensional rule reasoning is presented without a systematic error taxonomy or ablation study comparing the proposed workflow directly against the baseline.
- The interpretability-by-construction claim is overstated without faithfulness evaluations (e.g., citation-grounding checks or counterfactual analysis) demonstrating that structured outputs faithfully reflect actual model decisions.
- No bibliography was provided for audit, and the related work section appears to lack discussion of relevant prior art including PAL-style structured reasoning frameworks, classical expert systems for regulatory classification, and non-LLM ML approaches to HS coding.
- Evaluation protocol details—HSCodeComp split, preprocessing, label normalization, top-k computation, and handling of audited disagreements—are not specified.

## Open Questions

- Can the authors confirm and correct the model names used (Qwen3.6-plus and Qwen3.6-27B-FP8)? Please provide exact HuggingFace identifiers or API version strings to enable reproducibility.
- Will code, prompts, decoding configurations, retrieval/indexing parameters, and the offline Chinese HS tariff knowledge base be released? If so, on what timeline and under what license?
- For the open-weight model results, does the reported 77.4% figure represent top-1 accuracy against HSCodeComp ground truth or inter-model agreement with the frontier model? Please clarify and report both metrics.
- Can the authors provide an ablation study or error taxonomy comparing end-to-end prompting directly against the proposed deterministic workflow to substantiate the characterization of LLM failure modes?
- For the benchmark audit, what are the inter-annotator agreement statistics (e.g., Cohen's kappa), auditor qualifications, and adjudication methodology? What fraction of the 226 audited labels were judged incorrect, and with what confidence?
- How does the proposed approach relate to structured reasoning frameworks such as PAL, and to classical expert systems or rule-based systems for legal/regulatory classification? A related work section addressing these connections is expected.
- What are the exact HSCodeComp dataset split details, label normalization procedures, and top-k evaluation criteria used?

## Per-Agent Reviews

### citation (`gemini-2.5-flash`) — status: `pass`

```json
{
  "confidence": 0,
  "entries": [],
  "missing_references": [
    {
      "reason": "The user prompt did not include any bibliographic references to audit. Please provide the list of citations from the paper.",
      "title": "Bibliography not provided"
    }
  ],
  "summary": "No bibliography was provided in the prompt, so no references could be audited. To perform this task, please include the full list of citations from the paper."
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.72,
  "questions": [
    "Can the authors confirm and correct the model names used (Qwen3.6-plus and Qwen3.6-27B-FP8)? Please provide exact HuggingFace identifiers or API version strings to enable reproducibility.",
    "Will code, prompts, decoding configurations, retrieval/indexing parameters, and the offline Chinese HS tariff knowledge base be released? If so, on what timeline and under what license?",
    "For the open-weight model results, does the reported 77.4% figure represent top-1 accuracy against HSCodeComp ground truth or inter-model agreement with the frontier model? Please clarify and report both metrics.",
    "Can the authors provide an ablation study or error taxonomy comparing end-to-end prompting directly against the proposed deterministic workflow to substantiate the characterization of LLM failure modes?",
    "For the benchmark audit, what are the inter-annotator agreement statistics (e.g., Cohen's kappa), auditor qualifications, and adjudication methodology? What fraction of the 226 audited labels were judged incorrect, and with what confidence?",
    "How does the proposed approach relate to structured reasoning frameworks such as PAL, and to classical expert systems or rule-based systems for legal/regulatory classification? A related work section addressing these connections is expected.",
    "What are the exact HSCodeComp dataset split details, label normalization procedures, and top-k evaluation criteria used?"
  ],
  "recommendation": "major_revision",
  "strengths": [
    "Addresses a practically significant and underexplored problem—multi-dimensional rule reasoning for HS tariff classification—with a well-motivated architectural design rooted in the General Interpretive Rules of the Harmonized System.",
    "The deterministic workflow concept (fixed control flow, narrow LLM calls, local reflection/verification) is a principled and differentiating design choice relative to autonomous self-planning agents, offering interpretability by construction through stage-wise structured outputs with verbatim rule citations.",
    "Empirical results appear competitive, and the finding that a smaller open-weight model achieves performance close to a frontier model suggests the approach is model-agnostic and practically deployable.",
    "The benchmark audit raising questions about HSCodeComp ground-truth label quality is a valuable contribution to the community, potentially prompting dataset curation efforts.",
    "Novelty is judged significant: the paper introduces a domain-specific deterministic agentic architecture for a high-stakes regulatory classification task, with clear differentiation from prior end-to-end and self-planning approaches."
  ],
  "summary": "This paper proposes a deterministic agentic workflow for Harmonized System (HS) tariff classification, decomposing the task into six fixed stages with narrowly-scoped LLM calls rather than relying on end-to-end prompting. The system combines offline knowledge-engineering of the Chinese HS tariff schedule with an online multi-stage pipeline, achieving claimed top-1 accuracy of 75% at four digits and 64.2% at six digits on HSCodeComp. The paper additionally questions the quality of benchmark ground-truth labels through a manual audit. Across the five specialist reviews, the work is regarded as addressing a practically important and technically interesting problem with a reasonable approach, but significant concerns remain around model naming accuracy, reproducibility, citation coverage, empirical substantiation of key claims, and benchmark integrity.",
  "weaknesses": [
    "Model identifiers appear incorrect or at least undocumented: 'Qwen3.6-plus' and 'Qwen3.6-27B-FP8' do not correspond to known public model releases, undermining reproducibility and the credibility of reported numbers.",
    "Reproducibility is severely limited: no code repository, no dataset or knowledge-base URL, no prompt templates, no decoding hyperparameters, no retrieval/indexing parameters, and no compute environment details are provided.",
    "Key empirical claims are insufficiently substantiated: the performance numbers cannot be independently verified, the distinction between inter-model agreement and ground-truth accuracy is blurred for the open-weight model results, and the benchmark audit lacks inter-annotator reliability statistics and auditor credential disclosure.",
    "The claim that end-to-end prompting 'characteristically fails' at multi-dimensional rule reasoning is presented without a systematic error taxonomy or ablation study comparing the proposed workflow directly against the baseline.",
    "The interpretability-by-construction claim is overstated without faithfulness evaluations (e.g., citation-grounding checks or counterfactual analysis) demonstrating that structured outputs faithfully reflect actual model decisions.",
    "No bibliography was provided for audit, and the related work section appears to lack discussion of relevant prior art including PAL-style structured reasoning frameworks, classical expert systems for regulatory classification, and non-LLM ML approaches to HS coding.",
    "Evaluation protocol details—HSCodeComp split, preprocessing, label normalization, top-k computation, and handling of audited disagreements—are not specified."
  ]
}
```

### novelty (`gemini-2.5-flash`) — status: `pass`

```json
{
  "confidence": 4,
  "missing_prior_art": [
    {
      "reason": "The concept of confining LLM calls to narrow stages and generating structured outputs for reasoning is related to PAL or similar approaches where LLMs interact with external tools or generate structured code/queries. A discussion of how this 'deterministic agentic workflow' differs or builds upon these structured reasoning paradigms would be beneficial.",
      "title": "Program-aided Language Models (PAL) or other structured tool-use frameworks for LLM reasoning"
    },
    {
      "reason": "Given the emphasis on 'multi-dimensional rule reasoning' and 'offline knowledge-engineering' for a high-stakes, rule-bound task, a comparison or contrast with classical expert systems or rule-based AI approaches for legal/regulatory classification would provide valuable context on the evolution of solutions to such problems.",
      "title": "Expert systems or traditional rule-based AI for legal/regulatory classification"
    },
    {
      "reason": "While the paper focuses on LLM limitations, a comprehensive related work section should contextualize the problem within the broader history of AI/ML attempts at HS classification, including traditional machine learning models or hybrid systems that might have combined rule-based logic with statistical methods.",
      "title": "Prior machine learning or hybrid approaches for HS tariff classification (non-LLM based)"
    }
  ],
  "novelty_score": 0.75,
  "related_work": [
    {
      "citation_key": null,
      "delta": "This paper proposes a deterministic agentic workflow with a fixed control flow, narrow LLM calls, and local reflection/verification to overcome the characteristic failures of end-to-end prompting in multi-dimensional rule reasoning for HS classification, achieving interpretability by construction.",
      "relation": "prior_art",
      "title": "End-to-end prompting of large language models for HS tariff classification"
    },
    {
      "citation_key": null,
      "delta": "In contrast to self-planning agents, this paper introduces a deterministic agentic workflow where control flow is fixed, LLM calls are confined to narrow stages, and reflection/verification are local. This design prioritizes interpretability and adherence to complex multi-dimensional rules, which is crucial for high-stakes tasks like HS classification.",
      "relation": "competing",
      "title": "General self-planning agentic frameworks for large language models"
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
      "description": "No code repository or implementation release is specified. The deterministic workflow depends on fixed control flow, structured outputs, local reflection/verification, and offline knowledge-engineering, but the provided material does not indicate that these components are available.",
      "severity": "major"
    },
    {
      "area": "data",
      "description": "The evaluation uses HSCodeComp and an offline Chinese HS tariff knowledge base; no dataset or knowledge-base URL is provided in the supplied information. The appendix audit records are said to be released, but no access details are given.",
      "severity": "major"
    },
    {
      "area": "hyperparameters",
      "description": "The abstract identifies model backbones but does not specify prompts, decoding settings, retrieval/indexing parameters, stage schemas, or verification thresholds needed to reproduce the reported deterministic pipeline.",
      "severity": "major"
    },
    {
      "area": "compute",
      "description": "Hardware and serving details for Qwen3.6-27B-FP8 are not specified, and Qwen3.6-plus may be accessible only through a hosted/proprietary API with potential version drift.",
      "severity": "minor"
    },
    {
      "area": "evaluation",
      "description": "Reported metrics are clear at a high level, but the exact HSCodeComp split, preprocessing, label normalization, top-k computation, and treatment of audited ground-truth disagreements are not specified in the supplied material.",
      "severity": "major"
    }
  ],
  "confidence": 0.72,
  "data_availability": "unspecified",
  "data_url": null,
  "environment": {
    "dependencies": [
      "Qwen3.6-plus",
      "Qwen3.6-27B-FP8"
    ],
    "hardware": null,
    "software": null
  },
  "reproducibility_score": 3.0
}
```

### summary (`claude-haiku-4-5-20251001`) — status: `pass`

```json
{
  "audience": "Trade compliance professionals, customs officials, e-commerce platforms handling international shipping, researchers in legal/regulatory AI, and practitioners building systems for high-stakes rule-based classification tasks.",
  "key_contributions": [
    "A deterministic agentic workflow architecture that decomposes HS tariff classification into six fixed stages with narrow, interpretable language model calls rather than end-to-end prompting",
    "Demonstration that multi-dimensional rule reasoning can be systematically addressed by decomposing competing priority constraints across material, form, function, and other axes",
    "Interpretability by construction through stage-wise structured outputs with verbatim citations of applicable HS rules and notes",
    "Strong empirical results (75% top-1 accuracy at six digits, 91.5% top-3 at four digits) with reproducibility across different model sizes",
    "Evidence that ground-truth labels in the HSCodeComp benchmark may contain errors, with preliminary audit findings released for community review"
  ],
  "plain_language_summary": "Harmonized System (HS) tariff classification is the process of assigning standardized codes to products for international trade purposes. This task is challenging because it requires applying multiple competing rules simultaneously—considering a product's material, form, function, essential character, and how to handle parts versus whole items. Traditional approaches using large language models fail because they tend to focus on one rule while ignoring others.\n\nThis paper presents a deterministic workflow that breaks the classification problem into six fixed stages rather than letting the language model plan its own approach. Each stage has a narrow, specific purpose and produces structured outputs that cite the relevant rules from the HS guidelines. This design makes the decision-making process transparent and auditable—you can see exactly which rules were applied and why. The system combines pre-engineered knowledge about Chinese HS tariffs with an online pipeline that processes product descriptions step-by-step.\n\nWhen tested on a benchmark dataset, the system achieved 75% accuracy for exact six-digit codes and 91.5% accuracy when allowing for close matches at the four-digit level. Notably, even a smaller open-source model (27 billion parameters) achieved 77.4% accuracy, suggesting the approach is robust. The authors also audited disagreements and found evidence that some benchmark labels may not actually follow the official HS rules, raising questions about ground-truth quality.",
  "tldr": "A deterministic multi-stage workflow using language models achieves 75% accuracy on HS tariff classification by decomposing complex multi-dimensional rule reasoning into interpretable, verifiable decision stages."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `pass`

```json
{
  "claims": [
    {
      "assessment": "supported",
      "claim": "HS tariff classification difficulty lies in multi-dimensional rule reasoning rather than knowledge volume, with competing priority rules across axes such as material, form, function, essential character, part-vs-whole, and specific-vs-residual.",
      "evidence": "This characterization is consistent with the General Interpretive Rules (GIR 1-6) of the Harmonized System, which explicitly establish priority rules across these dimensions (e.g., GIR 3a specific over general, GIR 3b essential character).",
      "id": "C1",
      "location": "Abstract; Introduction",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "End-to-end prompting of LLMs characteristically fails by resolving one axis while ignoring priority constraints on others.",
      "evidence": "Plausible and consistent with reported LLM behavior on multi-constraint tasks, but the abstract presents it as a general characterization without citing systematic error-typology evidence in the snippet provided.",
      "id": "C2",
      "location": "Abstract",
      "severity": "minor",
      "suggested_fix": "Provide an empirical error taxonomy or ablation comparing end-to-end prompting against the proposed workflow to substantiate the failure mode claim."
    },
    {
      "assessment": "partially_supported",
      "claim": "A deterministic agentic workflow with fixed control flow and narrowly-scoped LM calls yields interpretability by construction via stage-wise structured outputs with verbatim citation of notes.",
      "evidence": "Determinism of control flow and structured outputs can support interpretability, but 'by construction' is a strong claim; interpretability also depends on faithfulness of stage outputs to the actual decision, which is not guaranteed by structure alone.",
      "id": "C3",
      "location": "Abstract; Method",
      "severity": "minor",
      "suggested_fix": "Qualify the interpretability claim and provide faithfulness checks (e.g., counterfactual or citation-grounding evaluations)."
    },
    {
      "assessment": "unsupported",
      "claim": "On HSCodeComp, the workflow achieves 75.0% top-1 and 91.5% top-3 at four digits, and 64.2% top-1 and 78.3% top-3 at six digits with Qwen3.6-plus.",
      "evidence": "Cannot verify numbers from the provided abstract/section heads alone; also 'Qwen3.6-plus' is not a publicly documented model name (Qwen2.5/Qwen3 families exist), raising a possible naming inconsistency.",
      "id": "C4",
      "location": "Abstract; Experiments",
      "severity": "major",
      "suggested_fix": "Clarify model identity/version, provide full evaluation protocol, dataset split, and per-metric standard errors; verify model name."
    },
    {
      "assessment": "unsupported",
      "claim": "An open-weight Qwen3.6-27B-FP8 backbone in non-thinking mode achieves 84.2% four-digit and 77.4% six-digit top-1 agreement with the frontier model.",
      "evidence": "Qwen3.6-27B-FP8 is not a recognized public model (Qwen3 has 32B, not 27B; 27B is Gemma's size). Agreement-with-frontier-model is also a weaker metric than ground-truth accuracy and should be clearly distinguished.",
      "id": "C5",
      "location": "Abstract; Experiments",
      "severity": "major",
      "suggested_fix": "Verify the model name/checkpoint, release weights or HF identifier, and clarify that 'agreement' is inter-model concordance, not accuracy."
    },
    {
      "assessment": "partially_supported",
      "claim": "A two-stage manual audit of 226 six-digit disagreements suggests a non-trivial fraction of HSCodeComp ground-truth labels may deviate from HS general rules.",
      "evidence": "This is a strong claim against a benchmark's ground truth; without inter-annotator agreement statistics, auditor credentials, and adjudication methodology, the finding is preliminary as the authors themselves note.",
      "id": "C6",
      "location": "Abstract; Experiments",
      "severity": "major",
      "suggested_fix": "Report inter-rater reliability (e.g., Cohen's kappa), auditor qualifications, and provide the percentage of labels judged incorrect with confidence intervals; treat as preliminary."
    },
    {
      "assessment": "supported",
      "claim": "The architecture combines offline knowledge-engineering of the Chinese HS tariff with an online six-stage pipeline.",
      "evidence": "Architectural description; verifiable from method section but not assessable for correctness as a factual claim.",
      "id": "C7",
      "location": "Abstract; Method",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Reflection and verification are retained as local mechanisms within stages rather than as global self-planning.",
      "evidence": "Design choice; consistent with the deterministic workflow paradigm contrasted with autonomous agents.",
      "id": "C8",
      "location": "Abstract; Method",
      "severity": "info",
      "suggested_fix": null
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

_No bibliography extracted._

