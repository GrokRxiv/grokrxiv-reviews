# Holistic Evaluation and Failure Diagnosis of AI Agents

GrokRxiv review of [arXiv:2605.14865](https://arxiv.org/abs/2605.14865) · `cs.AI`

## TL;DR

This paper proposes a holistic evaluation framework for AI agents that combines top-down agent-level diagnosis with bottom-up span-level evaluation of execution traces. The core contribution is a decomposition strategy that breaks long agent traces into independently assessable units ('spans'), enabling scalable, interpretable failure localization and categorization. Evaluated on the TRAIL benchmark (covering GAIA and SWE-Bench tasks), the framework reports substantial improvements over prior methods: up to 38% on error category F1, 3.5× on localization accuracy, and 12.5× on joint localization-categorization accuracy. The authors also argue that evaluation methodology—not model capability—is the primary bottleneck, supported by a held-model comparison showing the same frontier LLM performs far better within their structured framework than as a monolithic judge. The work addresses a genuine and important problem in AI agent evaluation. However, several weaknesses limit confidence in the reported results: reproducibility is severely hampered by absent code, data, and methodological details (prompts, span definitions, aggregation logic, model versions); key quantitative claims rest on relative gains that may obscure low absolute baselines; the strong claim that methodology is 'the' bottleneck is overgeneralized from limited evidence; and the citation audit found no bibliography to verify. These issues collectively warrant major revisions before acceptance.

_Recommendation_: **Major revision** · _Confidence_: 72%

## Strengths

- Addresses a timely and significant problem: diagnosing where and why AI agents fail in complex multi-step tasks is a critical open challenge with practical importance.
- The decomposed span-level evaluation framework is a principled and well-motivated design that naturally addresses context-length limitations of monolithic LLM judges.
- Strong empirical performance reported on the TRAIL benchmark, with large improvements across multiple evaluation metrics and across two challenging real-world subsets (GAIA and SWE-Bench).
- The held-model comparison (same LLM as monolithic judge vs. within the proposed framework) provides a compelling argument for the value of evaluation methodology, independent of model capability.
- Span-level rationales add interpretability, making the framework practically useful for debugging agent systems beyond just benchmark scoring.
- Novelty is assessed as significant: the holistic combination of top-down and bottom-up evaluation with precise failure localization represents a meaningful advance over prior monolithic or coarse process-level approaches.

## Weaknesses

- Severe reproducibility concerns: no code repository, no dataset/annotation release URL, and no specification of prompts, span definitions, aggregation rules, model versions, or API settings are provided, making independent replication essentially impossible.
- The large multiplicative gains (e.g., 12.5×) likely reflect very low absolute baseline values; absolute scores are not reported alongside relative gains, potentially overstating practical improvement.
- The claim that evaluation methodology is 'the' bottleneck rather than model capability is overgeneralized—it is demonstrated for one benchmark and a limited set of models, and capability and methodology interact in ways not fully disentangled.
- No bibliography or in-text citations are present in the reviewed material, making it impossible to verify grounding in prior work or assess completeness of related work coverage.
- The scalability claim ('arbitrary length traces') is qualified by potential cross-span context dependencies and the cost of the top-down diagnostic pass, which are not fully addressed.
- Per-metric and per-category results tables appear to be missing from the main text, making it impossible to verify whether SOTA is achieved uniformly across all metrics or only selectively.
- The framework's generalization beyond the TRAIL benchmark is asserted but not empirically demonstrated across diverse agent architectures, task types, or evaluation models.

## Open Questions

- Can the authors provide a public code repository and release the evaluation framework, prompts, span definitions, and aggregation logic to enable reproducibility?
- Will the annotated traces, labels, and dataset splits used for evaluation be released, along with the exact baseline implementations and evaluation scripts?
- Can a complete per-metric and per-category results table be included in the main text, with absolute scores reported alongside relative gains, and the baseline absolute values clarified for metrics showing large multiplicative improvements?
- How does the framework handle cross-span dependencies, and what is the practical cost (latency, API calls, financial cost) of running the full top-down plus bottom-up evaluation pipeline on typical agent traces?
- Can the bottleneck claim be substantiated across multiple frontier models and across benchmarks beyond TRAIL to support the generalization that methodology rather than capability is 'the' primary limiting factor?
- Which specific frontier model versions were used as evaluators, and how sensitive are the results to model choice?
- How is span boundary defined, and what happens when a failure spans multiple segments or involves implicit dependencies between non-adjacent steps in the trace?

## Per-Agent Reviews

### citation (`gemini-2.5-flash`) — status: `pass`

```json
{
  "confidence": 1.0,
  "entries": [],
  "missing_references": [],
  "summary": "No bibliography or in-text citations were provided in the abstract or section headings. Therefore, no references could be audited."
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.72,
  "questions": [
    "Can the authors provide a public code repository and release the evaluation framework, prompts, span definitions, and aggregation logic to enable reproducibility?",
    "Will the annotated traces, labels, and dataset splits used for evaluation be released, along with the exact baseline implementations and evaluation scripts?",
    "Can a complete per-metric and per-category results table be included in the main text, with absolute scores reported alongside relative gains, and the baseline absolute values clarified for metrics showing large multiplicative improvements?",
    "How does the framework handle cross-span dependencies, and what is the practical cost (latency, API calls, financial cost) of running the full top-down plus bottom-up evaluation pipeline on typical agent traces?",
    "Can the bottleneck claim be substantiated across multiple frontier models and across benchmarks beyond TRAIL to support the generalization that methodology rather than capability is 'the' primary limiting factor?",
    "Which specific frontier model versions were used as evaluators, and how sensitive are the results to model choice?",
    "How is span boundary defined, and what happens when a failure spans multiple segments or involves implicit dependencies between non-adjacent steps in the trace?"
  ],
  "recommendation": "major_revision",
  "strengths": [
    "Addresses a timely and significant problem: diagnosing where and why AI agents fail in complex multi-step tasks is a critical open challenge with practical importance.",
    "The decomposed span-level evaluation framework is a principled and well-motivated design that naturally addresses context-length limitations of monolithic LLM judges.",
    "Strong empirical performance reported on the TRAIL benchmark, with large improvements across multiple evaluation metrics and across two challenging real-world subsets (GAIA and SWE-Bench).",
    "The held-model comparison (same LLM as monolithic judge vs. within the proposed framework) provides a compelling argument for the value of evaluation methodology, independent of model capability.",
    "Span-level rationales add interpretability, making the framework practically useful for debugging agent systems beyond just benchmark scoring.",
    "Novelty is assessed as significant: the holistic combination of top-down and bottom-up evaluation with precise failure localization represents a meaningful advance over prior monolithic or coarse process-level approaches."
  ],
  "summary": "This paper proposes a holistic evaluation framework for AI agents that combines top-down agent-level diagnosis with bottom-up span-level evaluation of execution traces. The core contribution is a decomposition strategy that breaks long agent traces into independently assessable units ('spans'), enabling scalable, interpretable failure localization and categorization. Evaluated on the TRAIL benchmark (covering GAIA and SWE-Bench tasks), the framework reports substantial improvements over prior methods: up to 38% on error category F1, 3.5× on localization accuracy, and 12.5× on joint localization-categorization accuracy. The authors also argue that evaluation methodology—not model capability—is the primary bottleneck, supported by a held-model comparison showing the same frontier LLM performs far better within their structured framework than as a monolithic judge. The work addresses a genuine and important problem in AI agent evaluation. However, several weaknesses limit confidence in the reported results: reproducibility is severely hampered by absent code, data, and methodological details (prompts, span definitions, aggregation logic, model versions); key quantitative claims rest on relative gains that may obscure low absolute baselines; the strong claim that methodology is 'the' bottleneck is overgeneralized from limited evidence; and the citation audit found no bibliography to verify. These issues collectively warrant major revisions before acceptance.",
  "weaknesses": [
    "Severe reproducibility concerns: no code repository, no dataset/annotation release URL, and no specification of prompts, span definitions, aggregation rules, model versions, or API settings are provided, making independent replication essentially impossible.",
    "The large multiplicative gains (e.g., 12.5×) likely reflect very low absolute baseline values; absolute scores are not reported alongside relative gains, potentially overstating practical improvement.",
    "The claim that evaluation methodology is 'the' bottleneck rather than model capability is overgeneralized—it is demonstrated for one benchmark and a limited set of models, and capability and methodology interact in ways not fully disentangled.",
    "No bibliography or in-text citations are present in the reviewed material, making it impossible to verify grounding in prior work or assess completeness of related work coverage.",
    "The scalability claim ('arbitrary length traces') is qualified by potential cross-span context dependencies and the cost of the top-down diagnostic pass, which are not fully addressed.",
    "Per-metric and per-category results tables appear to be missing from the main text, making it impossible to verify whether SOTA is achieved uniformly across all metrics or only selectively.",
    "The framework's generalization beyond the TRAIL benchmark is asserted but not empirically demonstrated across diverse agent architectures, task types, or evaluation models."
  ]
}
```

### novelty (`gemini-2.5-flash`) — status: `pass`

```json
{
  "confidence": 4,
  "missing_prior_art": [],
  "novelty_score": 0.85,
  "related_work": [
    {
      "citation_key": null,
      "delta": "The paper introduces a holistic evaluation framework that achieves state-of-the-art results on the TRAIL benchmark, significantly improving localization and categorization accuracy compared to prior evaluation methods applied to it.",
      "relation": "prior_art",
      "title": "TRAIL Benchmark"
    },
    {
      "citation_key": null,
      "delta": "The proposed framework achieves state-of-the-art evaluation results on these benchmarks, demonstrating superior performance in diagnosing agent failures compared to existing methods.",
      "relation": "prior_art",
      "title": "GAIA and SWE-Bench Benchmarks"
    },
    {
      "citation_key": null,
      "delta": "The paper demonstrates that its decomposed, span-level evaluation framework significantly outperforms monolithic LLM judges, achieving several times higher localization accuracy even with the same underlying frontier model, by addressing the methodological bottleneck in evaluation.",
      "relation": "competing",
      "title": "Monolithic LLM-as-a-Judge Evaluation"
    },
    {
      "citation_key": null,
      "delta": "The paper's framework overcomes the limitations of prior process-level approaches by providing a scalable, decomposed, and precise method to connect failure types to their exact locations within long traces, along with span-level rationales, which these prior methods struggled with.",
      "relation": "prior_art",
      "title": "Prior Process-Level Agent Evaluation Approaches"
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
      "description": "No code repository or implementation availability is indicated, making it unclear whether the holistic evaluation framework, span decomposition, aggregation logic, and baselines can be rerun exactly.",
      "severity": "major"
    },
    {
      "area": "data",
      "description": "The paper references the TRAIL benchmark and evaluations on GAIA and SWE-Bench, but no dataset or annotation release URL is provided in the supplied information; availability of the exact traces, labels, and splits is unclear.",
      "severity": "major"
    },
    {
      "area": "hyperparameters",
      "description": "Reproduction likely depends on exact prompts, span definitions, aggregation rules, model settings, and judge configurations, none of which are specified in the supplied information.",
      "severity": "major"
    },
    {
      "area": "compute",
      "description": "The framework appears to use frontier models as evaluators, but the specific model versions, API settings, costs, and hardware or service dependencies are not specified.",
      "severity": "minor"
    },
    {
      "area": "evaluation",
      "description": "Claims of state-of-the-art gains require exact baseline implementations, metrics, and evaluation scripts; these are not shown as available from the supplied information.",
      "severity": "major"
    }
  ],
  "confidence": 0.62,
  "data_availability": "unspecified",
  "data_url": null,
  "environment": null,
  "reproducibility_score": 2.0
}
```

### summary (`claude-haiku-4-5-20251001`) — status: `pass`

```json
{
  "audience": "Researchers and practitioners working on AI agent evaluation, benchmarking, and interpretability; developers building multi-step AI systems who need diagnostic tools; machine learning engineers focused on understanding failure modes in complex agent behaviors.",
  "key_contributions": [
    "A holistic agent evaluation framework combining top-down agent-level diagnosis with bottom-up span-level evaluation",
    "A decomposition approach that breaks execution traces into independent assessable units, enabling scalability to arbitrary trace lengths",
    "Demonstration that span-level rationales provide interpretable explanations for evaluation verdicts",
    "State-of-the-art results on TRAIL benchmark with significant improvements: up to 38% on error category F1, 3.5× on localization accuracy, and 12.5× on joint localization-categorization",
    "Empirical evidence that evaluation methodology is a bottleneck rather than model capability, with the same model achieving multiple times higher accuracy when using the proposed framework"
  ],
  "plain_language_summary": "When AI agents perform complex tasks involving multiple steps—like writing code or answering questions—we need better ways to understand not just whether they succeeded or failed, but exactly where things went wrong. Current evaluation methods either give a simple pass/fail verdict without explanation, or struggle to pinpoint failures in long sequences of actions. This paper introduces a holistic evaluation framework that combines two complementary approaches: a top-down analysis that examines the agent's overall performance, and a bottom-up analysis that breaks the execution trace into small, independent units (called \"spans\") and evaluates each one separately. This decomposition makes it possible to scale to arbitrarily long traces while providing clear explanations for each verdict. The framework is tested on TRAIL, a benchmark that includes challenging real-world tasks from GAIA and SWE-Bench. Results show substantial improvements over previous methods—up to 38% better at categorizing error types, 3.5 times better at locating where failures occur, and 12.5 times better at both locating and categorizing failures simultaneously. Interestingly, the same AI model used as a judge performs dramatically better when structured through this framework than when asked to evaluate an entire trace at once, suggesting that how we organize the evaluation process matters more than raw model capability.",
  "tldr": "A new framework for evaluating AI agents breaks down complex multi-step execution traces into smaller, independently assessable units to better diagnose where and why agents fail."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `pass`

```json
{
  "claims": [
    {
      "assessment": "partially_supported",
      "claim": "The framework achieves state-of-the-art results on the TRAIL benchmark across all metrics on both GAIA and SWE-Bench subsets.",
      "evidence": "Abstract asserts SOTA across all metrics with specific relative gains, but without access to full results tables we cannot independently verify uniformity across every metric. Claim is plausible and consistent with reported numbers but needs per-metric tables for full verification.",
      "id": "C1",
      "location": "Abstract; TRAIL Benchmark Evaluation",
      "severity": "minor",
      "suggested_fix": "Provide a complete per-metric comparison table in the main text and explicitly note any metric where the framework does not lead."
    },
    {
      "assessment": "partially_supported",
      "claim": "Relative gains over the strongest prior baselines reach up to 38% on category F1, 3.5x on localization accuracy, and 12.5x on joint localization-categorization accuracy.",
      "evidence": "The very large multiplicative gains (12.5x) often reflect low absolute baseline values; framing as 'up to' is technically correct but can overstate practical improvement.",
      "id": "C2",
      "location": "Abstract",
      "severity": "minor",
      "suggested_fix": "Report absolute scores alongside relative gains and clarify the baseline magnitudes that produce the largest multipliers."
    },
    {
      "assessment": "partially_supported",
      "claim": "Decomposing evaluation into independent per-span assessments scales to traces of arbitrary length.",
      "evidence": "Per-span independence yields linear scaling in spans, but 'arbitrary length' ignores potential context dependencies between spans and the cost of agent-level top-down diagnosis. The Aggregation Limitations appendix likely acknowledges trade-offs.",
      "id": "C3",
      "location": "Holistic Agent Evaluation",
      "severity": "minor",
      "suggested_fix": "Qualify the scalability claim (e.g., 'linear in number of spans, modulo top-down pass') and discuss handling of cross-span dependencies."
    },
    {
      "assessment": "partially_supported",
      "claim": "The same frontier model attains several times higher localization accuracy inside the framework than as a monolithic judge over the full trace, showing methodology, not model capability, is the bottleneck.",
      "evidence": "A controlled model-held-constant comparison supports a methodology effect, but concluding methodology is 'the' bottleneck overgeneralizes from one benchmark and one or few models. Capability and methodology interact.",
      "id": "C4",
      "location": "Abstract; Discussion",
      "severity": "major",
      "suggested_fix": "Soften to 'a major bottleneck' and report results across multiple models and benchmarks to substantiate the generalization."
    },
    {
      "assessment": "supported",
      "claim": "Pairing top-down agent-level diagnosis with bottom-up span-level evaluation produces span-level rationales for each verdict.",
      "evidence": "This is a design property of the proposed method and consistent with the described decomposition.",
      "id": "C5",
      "location": "Holistic Agent Evaluation",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "The framework leads in more error categories than any other evaluator on per-category analysis.",
      "evidence": "Plausible given overall SOTA claim, but 'leading in more categories' depends on tie-breaking and number of categories; needs the per-category table to verify.",
      "id": "C6",
      "location": "TRAIL Benchmark Evaluation",
      "severity": "minor",
      "suggested_fix": "Include the full per-category leaderboard and define tie-handling."
    },
    {
      "assessment": "supported",
      "claim": "Current outcome metrics do not explain why agents fail and process-level approaches struggle to localize failure types in long traces.",
      "evidence": "Consistent with prior literature on agent evaluation (e.g., TRAIL motivation).",
      "id": "C7",
      "location": "Introduction",
      "severity": "info",
      "suggested_fix": null
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

_No bibliography extracted._

