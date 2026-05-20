# Deep Reinforcement Learning Framework for Diversified Portfolio Management Across Global Equity Markets

GrokRxiv review of [arXiv:2605.17307](https://arxiv.org/abs/2605.17307) · `q-fin.PM`

## TL;DR

This paper applies Soft Actor-Critic with LSTM and Transformer encoders to multi-market equity portfolio allocation, evaluated via a 16-fold walk-forward procedure across NASDAQ-100, Nikkei 225, and Euro Stoxx 50. The framework includes a hierarchical Dirichlet policy separating equity-cash allocation from asset selection, an adaptive retraining criterion, survivorship-bias correction, and HAC-robust statistical inference. Four specialist reviews are available; the citation review failed due to agent timeout. The overall picture is a methodologically careful empirical study with honest reporting of mixed results, but with several critical deficiencies: no reproducibility artifacts (no code, restricted data), causal claims for key architectural choices that are not supported by controlled ablations, missing multiple-testing correction across ~45 simultaneous hypothesis tests, and single-seed training for a seed-sensitive algorithm. Novelty is incremental (score 0.5) and the foundational Jiang et al. 2017 EIIE precursor is absent from the related-work discussion. Technical correctness is mostly sound but four major-severity issues remain unresolved. The paper requires substantial revision before it is ready for publication.

_Recommendation_: **Major revision** · _Confidence_: 72%

## Strengths

- First unified walk-forward evaluation across three economically and culturally distinct global equity markets (US, Asia, Europe) using identical procedures and a 17-year out-of-sample horizon spanning multiple macroeconomic regimes.
- Technically valid hierarchical Dirichlet action-space factorisation that correctly satisfies the portfolio simplex constraint and cleanly separates equity-cash allocation from within-equity asset selection.
- Honest and internally consistent reporting: the central hypothesis is explicitly described as only partially confirmed, with the statistically significant Euro Stoxx 50 alpha results correctly distinguished from the non-significant mean-return and risk-adjusted tests in other markets.
- Methodologically sound evaluation design including explicit survivorship-bias correction via Bloomberg membership matrices, look-ahead-free top-k momentum pre-filtering, HAC-robust Newey-West inference, and stationary block bootstrap tests.
- Well-specified adaptive retraining criterion with a cold-start safeguard, representing a practical engineering contribution to reducing overfitting and computational cost in rolling RL deployments.

## Weaknesses

- Critical reproducibility failure: no source code, scripts, or executable workflow are provided for any component (SAC agents, preprocessing, benchmarks, statistical tests, figures), and historical index constituent membership requires a Bloomberg Terminal subscription with no exported files supplied, making independent replication infeasible.
- Causal claims for the two key architectural contributions are confounded: the hierarchical Dirichlet policy benefit (RQ2) and the cash-constraint benefit (RQ3) are each compared against configurations that simultaneously differ along multiple dimensions (reward function, top-k, encoder), so the observed IR2 differences cannot be attributed to the claimed factor without ceteris-paribus ablations.
- No multiple-testing correction is applied across approximately 45 simultaneous hypothesis tests (Tables 7 and 8 combined); at a nominal 10% level the expected number of false discoveries under the global null is ~4.5, and no White (2000) reality-check, Hansen (2005) SPA test, or Holm/Benjamini-Hochberg adjustment is reported to control family-wise error or false discovery rate.
- All results are from a single random seed per configuration per fold; SAC is known to exhibit high seed sensitivity (Henderson et al. 2018), and without multi-seed statistics the headline IR2 orderings (e.g., LSTM_2 0.46 vs Equal-Weight 0.49 on NASDAQ-100) are not distinguishable from training noise.
- Incremental novelty (score 0.5): the paper combines existing components without a clear conceptual advance, and misses the foundational Jiang et al. 2017 EIIE paper that introduced the portfolio weight formulation and state-space design underlying modern DRL-for-finance approaches.
- The primary evaluation metric IR2 = ARC²·sign(ARC)/(ASD·MD) conflates return scale with risk adjustment and is non-monotone when maximum drawdown is small; standard scale-free complements (Sortino ratio, Calmar ratio) are absent, and bootstrap inference on IR2's non-smooth sign(ARC) component has unverified asymptotic properties.
- Citation quality could not be assessed because the citation specialist agent timed out, leaving reference accuracy and completeness unverified.

## Open Questions

- Will the authors provide a public code repository and, at minimum, the index constituent ticker lists (or a public-data substitute for Bloomberg membership) so that reviewers and readers can independently replicate the pipeline?
- Can the authors run controlled ablation experiments that isolate the hierarchical policy effect (flat vs. hierarchical, all other hyperparameters held constant, multiple seeds) and the cash constraint effect (cash vs. no-cash, same reward, same top-k, same encoder) to support the causal language used in RQ2 and RQ3?
- How do the Euro Stoxx 50 alpha p-values reported in Table 8 change after applying a Holm or Benjamini-Hochberg correction across all 45 hypothesis tests, or after applying Hansen's (2005) SPA test for data-snooping? Do any remain significant?
- When each configuration is trained with at least 5 independent seeds per fold, what are the mean and standard deviation of IR2 for LSTM_1, LSTM_2, and Transformer on each market? Does the ranking order remain stable or collapse into overlapping confidence intervals?
- How do the Sharpe ratios and alpha estimates change when local short-term interest rates (Fed Funds, BoJ policy rate, ECB deposit rate) are used as the risk-free rate rather than zero, particularly for the post-2022 rate-hike sub-period where the omission is most material?

## Per-Agent Reviews

### citation (`gemini-3-flash-preview`) — status: `fail`

```json
{
  "error": "agent Citation timed out after 360s at supervisor level",
  "role": "citation",
  "status": "agent_failed"
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.72,
  "questions": [
    "Will the authors provide a public code repository and, at minimum, the index constituent ticker lists (or a public-data substitute for Bloomberg membership) so that reviewers and readers can independently replicate the pipeline?",
    "Can the authors run controlled ablation experiments that isolate the hierarchical policy effect (flat vs. hierarchical, all other hyperparameters held constant, multiple seeds) and the cash constraint effect (cash vs. no-cash, same reward, same top-k, same encoder) to support the causal language used in RQ2 and RQ3?",
    "How do the Euro Stoxx 50 alpha p-values reported in Table 8 change after applying a Holm or Benjamini-Hochberg correction across all 45 hypothesis tests, or after applying Hansen's (2005) SPA test for data-snooping? Do any remain significant?",
    "When each configuration is trained with at least 5 independent seeds per fold, what are the mean and standard deviation of IR2 for LSTM_1, LSTM_2, and Transformer on each market? Does the ranking order remain stable or collapse into overlapping confidence intervals?",
    "How do the Sharpe ratios and alpha estimates change when local short-term interest rates (Fed Funds, BoJ policy rate, ECB deposit rate) are used as the risk-free rate rather than zero, particularly for the post-2022 rate-hike sub-period where the omission is most material?"
  ],
  "recommendation": "major_revision",
  "strengths": [
    "First unified walk-forward evaluation across three economically and culturally distinct global equity markets (US, Asia, Europe) using identical procedures and a 17-year out-of-sample horizon spanning multiple macroeconomic regimes.",
    "Technically valid hierarchical Dirichlet action-space factorisation that correctly satisfies the portfolio simplex constraint and cleanly separates equity-cash allocation from within-equity asset selection.",
    "Honest and internally consistent reporting: the central hypothesis is explicitly described as only partially confirmed, with the statistically significant Euro Stoxx 50 alpha results correctly distinguished from the non-significant mean-return and risk-adjusted tests in other markets.",
    "Methodologically sound evaluation design including explicit survivorship-bias correction via Bloomberg membership matrices, look-ahead-free top-k momentum pre-filtering, HAC-robust Newey-West inference, and stationary block bootstrap tests.",
    "Well-specified adaptive retraining criterion with a cold-start safeguard, representing a practical engineering contribution to reducing overfitting and computational cost in rolling RL deployments."
  ],
  "summary": "This paper applies Soft Actor-Critic with LSTM and Transformer encoders to multi-market equity portfolio allocation, evaluated via a 16-fold walk-forward procedure across NASDAQ-100, Nikkei 225, and Euro Stoxx 50. The framework includes a hierarchical Dirichlet policy separating equity-cash allocation from asset selection, an adaptive retraining criterion, survivorship-bias correction, and HAC-robust statistical inference. Four specialist reviews are available; the citation review failed due to agent timeout. The overall picture is a methodologically careful empirical study with honest reporting of mixed results, but with several critical deficiencies: no reproducibility artifacts (no code, restricted data), causal claims for key architectural choices that are not supported by controlled ablations, missing multiple-testing correction across ~45 simultaneous hypothesis tests, and single-seed training for a seed-sensitive algorithm. Novelty is incremental (score 0.5) and the foundational Jiang et al. 2017 EIIE precursor is absent from the related-work discussion. Technical correctness is mostly sound but four major-severity issues remain unresolved. The paper requires substantial revision before it is ready for publication.",
  "weaknesses": [
    "Critical reproducibility failure: no source code, scripts, or executable workflow are provided for any component (SAC agents, preprocessing, benchmarks, statistical tests, figures), and historical index constituent membership requires a Bloomberg Terminal subscription with no exported files supplied, making independent replication infeasible.",
    "Causal claims for the two key architectural contributions are confounded: the hierarchical Dirichlet policy benefit (RQ2) and the cash-constraint benefit (RQ3) are each compared against configurations that simultaneously differ along multiple dimensions (reward function, top-k, encoder), so the observed IR2 differences cannot be attributed to the claimed factor without ceteris-paribus ablations.",
    "No multiple-testing correction is applied across approximately 45 simultaneous hypothesis tests (Tables 7 and 8 combined); at a nominal 10% level the expected number of false discoveries under the global null is ~4.5, and no White (2000) reality-check, Hansen (2005) SPA test, or Holm/Benjamini-Hochberg adjustment is reported to control family-wise error or false discovery rate.",
    "All results are from a single random seed per configuration per fold; SAC is known to exhibit high seed sensitivity (Henderson et al. 2018), and without multi-seed statistics the headline IR2 orderings (e.g., LSTM_2 0.46 vs Equal-Weight 0.49 on NASDAQ-100) are not distinguishable from training noise.",
    "Incremental novelty (score 0.5): the paper combines existing components without a clear conceptual advance, and misses the foundational Jiang et al. 2017 EIIE paper that introduced the portfolio weight formulation and state-space design underlying modern DRL-for-finance approaches.",
    "The primary evaluation metric IR2 = ARC²·sign(ARC)/(ASD·MD) conflates return scale with risk adjustment and is non-monotone when maximum drawdown is small; standard scale-free complements (Sortino ratio, Calmar ratio) are absent, and bootstrap inference on IR2's non-smooth sign(ARC) component has unverified asymptotic properties.",
    "Citation quality could not be assessed because the citation specialist agent timed out, leaving reference accuracy and completeness unverified."
  ]
}
```

### novelty (`gemini-3-flash-preview`) — status: `pass`

```json
{
  "confidence": 0.9,
  "missing_prior_art": [
    {
      "reason": "This foundational paper introduced the EIIE architecture, which is a key precursor to the state-space representations and portfolio weight formulations used in modern DRL for finance.",
      "title": "A Deep Reinforcement Learning Framework for Financial Portfolio Management (Jiang et al., 2017)"
    }
  ],
  "novelty_score": 0.5,
  "related_work": [
    {
      "citation_key": "analytics2030031",
      "delta": "Implements a hierarchical Dirichlet policy that separates equity-cash allocation from asset selection in a model-free SAC framework, extending prior hierarchical model-based approaches to a multi-asset setting.",
      "relation": "builds_on",
      "title": "Hierarchical Model-Based Deep Reinforcement Learning for Single-Asset Trading"
    },
    {
      "citation_key": "yang2020deep",
      "delta": "Applies ensemble methods across three distinct global equity markets (NASDAQ-100, Nikkei 225, Euro Stoxx 50) using a unified walk-forward optimization and adaptive retraining framework.",
      "relation": "builds_on",
      "title": "Deep reinforcement learning for automated stock trading: An ensemble strategy"
    },
    {
      "citation_key": "DE_MIGEUL",
      "delta": "Uses the 1/N naive diversification strategy as a critical benchmark to evaluate whether RL-learned policies provide meaningful gains over simple momentum-filtered benchmarks across multiple market regimes.",
      "relation": "prior_art",
      "title": "Optimal Versus Naive Diversification: How Inefficient is the 1/N Portfolio Strategy?"
    },
    {
      "citation_key": "JIANG2024101016",
      "delta": "Introduces an adaptive retraining criterion based on rolling validation performance to mitigate computational costs and potential overfitting compared to the standard periodic retraining used in similar DRL frameworks.",
      "relation": "prior_art",
      "title": "Deep reinforcement learning for portfolio selection"
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
      "description": "No source code, repository, scripts, or executable workflow are provided for the SAC agents, preprocessing pipeline, benchmark construction, walk-forward training, statistical tests, or figure/table generation.",
      "severity": "critical"
    },
    {
      "area": "data",
      "description": "Price data are described as coming from yfinance, but historical constituent membership comes from Bloomberg Terminal Anywhere and no exported membership files or exact ticker lists are supplied; this makes exact universe reconstruction restricted and difficult.",
      "severity": "major"
    },
    {
      "area": "hyperparameters",
      "description": "Core hyperparameters are listed, but the predefined candidate configurations used for hyperparameter selection and some configuration-dependent values such as concentration penalties and top-k variants are not fully mapped to each reported experiment.",
      "severity": "major"
    },
    {
      "area": "evaluation",
      "description": "The walk-forward procedure, adaptive retraining rules, and metrics are described, but random seeds, stochastic training controls, exact retraining outcomes per fold, and model checkpoints are absent, limiting exact replication of RL results.",
      "severity": "major"
    },
    {
      "area": "compute",
      "description": "The paper reports an NVIDIA L4 cloud setup and long per-fold training times, so reproduction is computationally expensive even if code and restricted data access were available.",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "No package versions, operating system, Python/R framework versions, or dependency lockfile are specified, which reduces environment reproducibility.",
      "severity": "major"
    }
  ],
  "confidence": 0.86,
  "data_availability": "restricted",
  "data_url": null,
  "environment": {
    "dependencies": [
      "yfinance API for daily equity and benchmark price data",
      "Bloomberg Terminal Anywhere subscription for historical index membership",
      "Soft Actor-Critic implementation with LSTM and Transformer encoders"
    ],
    "hardware": "Cloud G2-standard instance with NVIDIA L4 GPU (24GB VRAM) and 30GB system memory",
    "software": null
  },
  "reproducibility_score": 0.32
}
```

### summary (`claude-haiku-4-5-20251001`) — status: `pass`

```json
{
  "audience": "Quantitative finance researchers, asset managers exploring AI-driven portfolio allocation, machine learning practitioners interested in financial applications, and academics studying reinforcement learning in finance",
  "key_contributions": [
    "Develops a practical deep reinforcement learning framework for multi-market portfolio allocation using the Soft Actor-Critic algorithm with realistic constraints (transaction costs, turnover penalties, diversification requirements)",
    "Provides first unified evaluation across three economically distinct global equity markets (US, Asia, Europe) using identical walk-forward testing procedures, enabling direct cross-market performance comparison",
    "Introduces a hierarchical Dirichlet policy architecture that separates equity-cash allocation from individual asset selection, advancing beyond flat policy structures in prior work",
    "Demonstrates that RL strategies add measurable value primarily during periods of elevated uncertainty and market stress, with regime analysis revealing heterogeneous performance across different macroeconomic conditions",
    "Reveals that no single RL strategy configuration consistently outperforms classical benchmarks (equal-weight, Markowitz) across all markets, highlighting the importance of careful design choices and the challenges of achieving statistically significant excess returns in practice"
  ],
  "plain_language_summary": "This research develops an artificial intelligence system to manage investment portfolios by using reinforcement learning—a technique where algorithms learn through trial and error to optimize long-term financial goals. The researchers test their approach on stocks from three major global markets (US technology stocks in the Nasdaq-100, Japanese stocks in the Nikkei 225, and European stocks in the Euro Stoxx 50) using historical data from 2003 to 2026. Unlike traditional portfolio methods that rely on statistical predictions, their AI-based system directly learns trading strategies that balance risk and return while accounting for real-world costs like transaction fees and the penalty for excessive portfolio changes.\n\nThe key finding is that the AI strategies achieve reasonable risk-adjusted returns—especially in European markets where they show statistically significant outperformance—but they do not consistently beat simple buy-and-hold investing when tested with robust statistical methods across all three markets. However, the researchers observe that AI strategies add the most value during periods of market turmoil and uncertainty. They also discover that combining predictions from the AI trained on multiple markets improves overall portfolio performance, demonstrating the benefits of geographic diversification. The study systematically compares different AI design choices (such as using LSTM versus Transformer neural networks for analyzing price patterns) to understand which configurations work best.\n\nThis research bridges machine learning and quantitative finance by showing both the promise and limitations of AI in portfolio management. While AI can adapt to changing market conditions better than rigid statistical models, real-world constraints like transaction costs and the inherent unpredictability of markets mean that even sophisticated AI systems struggle to consistently beat simple strategies.",
  "tldr": "A study applying deep reinforcement learning to portfolio allocation across three global equity markets finds competitive risk-adjusted returns, particularly in European stocks, but limited statistically significant outperformance versus passive buy-and-hold strategies."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `pass`

```json
{
  "claims": [
    {
      "assessment": "supported",
      "claim": "The portfolio allocation problem is correctly framed as a Markov Decision Process with the standard tuple (S, A, P, r, γ), and the Markov property is acknowledged as an approximation for financial markets.",
      "evidence": "The MDP definition matches the standard Puterman/Sutton-Barto formulation. The paper explicitly notes the Markov property is an approximation and addresses it via lookback windows in the state.",
      "id": "c1",
      "location": "Section: Theoretical Background — Markov Decision Processes (eq. with P(s_{t+1}|s_t,a_t))",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "The Sharpe ratio is defined as SR = (mean R / σ_R) × sqrt(252).",
      "evidence": "The formula omits the risk-free rate subtraction from the canonical Sharpe ratio SR = (E[R]−r_f)/σ. While using excess-of-zero is a common simplification in algorithmic trading studies, it is technically a 'volatility-adjusted return' rather than the Sharpe ratio per Sharpe (1994). For a 2009–2026 sample that spans both ZIRP and a substantial rate-hike regime, ignoring r_f can materially bias level comparisons across markets.",
      "id": "c2",
      "location": "Section: Performance Metrics, eq:sharpe",
      "severity": "minor",
      "suggested_fix": "State explicitly that r_f is assumed equal to zero (or use the local short-rate proxy) and discuss the implication for the post-2022 rate-hike sub-period."
    },
    {
      "assessment": "supported",
      "claim": "The Modified Information Ratio (IR2) is defined as IR** = IR* × ARC × sign(ARC)/MD, where IR* = ARC/ASD.",
      "evidence": "Algebraically, the formula equals ARC²·sign(ARC)/(ASD·MD), so the sign(ARC) factor preserves the sign of the underlying return when squaring; it is a well-defined non-standard metric used in the Michańków/Ślepaczuk family of papers cited (michankow2022lstm, PairTrading). MD is typically expressed as a positive number, so the formula is unambiguous provided MD>0; if MD=0 the metric is undefined.",
      "id": "c3",
      "location": "Section: Performance Metrics, eq:ir-starstar",
      "severity": "minor",
      "suggested_fix": "State the convention for MD's sign and define the behaviour at MD=0 to remove residual ambiguity."
    },
    {
      "assessment": "supported",
      "claim": "The minimum Herfindahl–Hirschman Index over N_t assets equals 1/N_t, attained at equal weights.",
      "evidence": "For weights summing to one, Σw_i² is minimised at w_i = 1/N_t by Cauchy–Schwarz, giving HHI_min = N_t·(1/N_t)² = 1/N_t. The reward derivation is correct.",
      "id": "c4",
      "location": "Section: Reward Function (eq. HHI_t = Σ w_{i,t}²)",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "The walk-forward scheme (5-year train, 1-year validation, 1-year test, non-anchored rolling) yields a strictly out-of-sample evaluation that mitigates look-ahead bias.",
      "evidence": "The procedure follows established practice (Carta et al. 2021; López de Prado 2018). The 120-day momentum filter and feature construction use only past prices at decision time, and survivorship bias is explicitly addressed via the Bloomberg membership matrix. The authors themselves acknowledge that the WFO parameters were not optimised over alternatives, citing Bailey (2014) for meta-overfitting.",
      "id": "c5",
      "location": "Section: Methodology — Walk Forward Optimization",
      "severity": "info",
      "suggested_fix": "Report sensitivity to the (5,1,1) split (e.g., (4,1,1) and (6,1,1)) to substantiate the robustness claim."
    },
    {
      "assessment": "supported",
      "claim": "None of the RL strategies achieve statistically significant excess returns relative to Buy & Hold under HAC-robust inference across all three markets, while the Euro Stoxx 50 alpha-regression yields statistically significant intercepts at the 10% level for LSTM-1, LSTM-2, LSTM-NC-2, and Transformer.",
      "evidence": "Table 7 reports HAC p-values ≥ 0.31 across all NASDAQ-100/Nikkei cells and ≥ 0.46 for the Euro Stoxx 50 mean-difference test, so mean-return outperformance is not rejected. Table 8 reports HAC-adjusted α p-values of 0.0333 (LSTM-1), 0.0120 (LSTM-2), 0.0417 (LSTM-NC-2), 0.0291 (Transformer) on the Euro Stoxx 50, supporting the abnormal-return finding under the one-sided H1: α>0. The mean-vs-alpha distinction is correctly drawn: the alpha regression controls for benchmark exposure and therefore can be significant when the unconditional mean-difference test is not.",
      "id": "c6",
      "location": "Section: Empirical results — Statistical Significance (Tables 7 and 8)",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Newey–West HAC estimators and the stationary block bootstrap of Politis & Romano are appropriate for inference on autocorrelated, heteroskedastic, non-normal financial returns.",
      "evidence": "Both methods are standard for the stated violations of i.i.d. and normality. However, the paper does not report the Newey–West bandwidth, the bootstrap mean block length, or the number of bootstrap replications, which are necessary to reproduce the inference exactly.",
      "id": "c7",
      "location": "Section: Empirical results — Statistical Significance",
      "severity": "info",
      "suggested_fix": "Disclose the HAC lag truncation parameter, the bootstrap block length (or its expectation under the stationary scheme), and the number of resamples."
    },
    {
      "assessment": "partially_supported",
      "claim": "Statistical inference for Sharpe-ratio differences is conducted only via the stationary bootstrap, without applying a Sharpe-specific correction such as Lo (2002) or the Ledoit–Wolf circular block bootstrap, and the alternative hypothesis for risk-adjusted measures is not stated explicitly.",
      "evidence": "The one-sided alternative is stated only for the mean-difference test; for ΔSharpe and ΔIR2 the alternative direction (one-sided vs two-sided) is left implicit, and standard Sharpe-difference tests (Jobson–Korkie–Memmich, Ledoit–Wolf 2008) are not used as a robustness check. Because IR2 has a non-standard form, bootstrap inference on it has unverified asymptotic properties.",
      "id": "c8",
      "location": "Section: Empirical results — Statistical Significance",
      "severity": "minor",
      "suggested_fix": "State the alternative explicitly for each metric, provide a Ledoit–Wolf (2008) Sharpe-difference robustness check, and discuss why bootstrap inference on IR2 is valid given its non-smooth sign(ARC) component."
    },
    {
      "assessment": "partially_supported",
      "claim": "Hierarchical Dirichlet policy improves risk-adjusted performance by 'decomposing the allocation decision into sequential stages.'",
      "evidence": "The empirical evidence is consistent with the claim (LSTM_2 vs LSTM_1 on IR2 across markets), but the paper itself notes that configurations co-vary along multiple dimensions and that RQ1–RQ4 are exploratory rather than causal. Attributing the lower volatility/drawdown of LSTM_2 specifically to the hierarchical policy structure is therefore an over-reach without a controlled ablation; the gains could equally reflect optimization-noise differences across runs since no seed-variation results are reported.",
      "id": "c9",
      "location": "Section: Discussion — RQ2",
      "severity": "major",
      "suggested_fix": "Either temper the causal language to match the exploratory caveat already stated, or run a ceteris-paribus ablation (flat vs hierarchical with all other hyperparameters identical and multiple random seeds) and report confidence intervals across seeds."
    },
    {
      "assessment": "partially_supported",
      "claim": "Cash-allowed configurations consistently achieve lower drawdowns and higher IR2 than fully invested counterparts, indicating that 'the ability to hold cash provides meaningful downside protection.'",
      "evidence": "This claim is confounded: the no-cash configurations (LSTM_NC_1, LSTM_NC_2) simultaneously use a benchmark-relative reward and different top-k values, so the observed difference cannot be attributed solely to the cash constraint. The paper acknowledges the lack of ceteris-paribus design but the discussion still phrases the conclusion causally.",
      "id": "c10",
      "location": "Section: Discussion — RQ3",
      "severity": "major",
      "suggested_fix": "Run an isolated experiment varying only the cash constraint (same reward, same top-k, same encoder) to attribute the IR2 gain causally."
    },
    {
      "assessment": "supported",
      "claim": "All experiments use 16 walk-forward out-of-sample folds spanning 2003–2026 (abstract) and trading commences 2009-04 (results sections).",
      "evidence": "5 + 1 + 1 = 7 years from 2003-01 places the first test year at 2009 with subsequent yearly steps through ≈2025–26, giving roughly 16–17 annual test folds — consistent with the 16-fold claim. The differing trading-start dates noted across panels (2009-04-01 vs 2009-04-06) are not material but are inconsistently reported across notes.",
      "id": "c11",
      "location": "Abstract; Section: Empirical results",
      "severity": "info",
      "suggested_fix": "Standardise the reported trading-start date across all market/panel notes."
    },
    {
      "assessment": "supported",
      "claim": "The ensemble portfolio is constructed by equally weighting per-market strategy returns and benchmarks across NASDAQ-100, Nikkei 225, and Euro Stoxx 50; LSTM_1 achieves IR2 = 0.41 versus benchmark IR2 = 0.34.",
      "evidence": "The equal-weight aggregation is mathematically well-defined for return series aligned on a common date index. However, computing IR2 by averaging the constituent returns implicitly assumes daily rebalancing of the ensemble itself; the paper does not state whether (or how) cross-market rebalancing costs are charged at the ensemble level, while transaction costs are presumably already embedded inside each per-market return stream.",
      "id": "c12",
      "location": "Section: Ensemble Total Fund",
      "severity": "info",
      "suggested_fix": "State explicitly that the ensemble is a constant-weight overlay (no additional cross-market rebalancing cost) and clarify currency conventions for combining USD/JPY/EUR return streams."
    },
    {
      "assessment": "supported",
      "claim": "Top-k momentum pre-filtering with k ∈ {10, 20, 30} fixed across folds 'guarantees a constant state-vector dimension' for the neural encoder.",
      "evidence": "Fixing k yields a constant cardinality of the action space irrespective of N_t; this is correctly argued and matches the SAC implementation. The pre-filter uses only data through time t (P_{i,t}/P_{i,t-120}), so no look-ahead is introduced.",
      "id": "c13",
      "location": "Section: State Representation — Dynamic asset universe",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Adaptive retraining triggers when S_k < 0, S_k < θ_k, or no retraining has occurred for 3 consecutive folds; θ_k = median(S_{k-m..k-1}) − 0.5·std(S_{k-m..k-1}) with m=5, requiring ≥3 prior observations.",
      "evidence": "The criterion is well-defined and the cold-start handling (always retrain when k<3) removes the ambiguity that would otherwise arise from std(·) being computed on too few points. With only 16 folds, however, the median and std of up to 5 validation Sharpe ratios are noisy estimators and the threshold is implicitly an exogenous design choice (0.5·std offset) that is not subject to sensitivity analysis.",
      "id": "c14",
      "location": "Section: Methodology — Adaptive Retraining Strategy, eq:retrain_threshold",
      "severity": "info",
      "suggested_fix": "Report how often each of the three retraining conditions actually fires across folds, and perform sensitivity analysis on the 0.5·std offset."
    },
    {
      "assessment": "partially_supported",
      "claim": "The entropy coefficient α is held fixed at 0.2; adaptive α tuning was found to be unstable due to non-stationarity and short validation windows.",
      "evidence": "Fixed α is a legitimate choice and the justification is plausible, but no quantitative evidence is presented (e.g., training-curve comparison with auto-α) to support the instability claim. This is an unverified empirical assertion.",
      "id": "c15",
      "location": "Section: Model Architecture — Soft Actor–Critic",
      "severity": "minor",
      "suggested_fix": "Provide at least one fold's training curves comparing fixed vs auto-tuned α to substantiate the choice."
    },
    {
      "assessment": "partially_supported",
      "claim": "Transaction costs of 2 bps per unit of turnover are 'consistent with the lower bound' of IBKR tiered commissions (0.05–0.35 bps per share).",
      "evidence": "The two figures are in different units: 2 bps of notional turnover is generally an order of magnitude larger than 0.05–0.35 bps per share for typical equity prices, and bid-ask spread plus market impact are not modelled. The cost assumption is internally fixed and not stress-tested, so robustness to realistic execution costs is unknown — a limitation that the paper itself acknowledges.",
      "id": "c16",
      "location": "Section: Methodology — environment parameters",
      "severity": "minor",
      "suggested_fix": "Either convert the per-share commission to per-notional-turnover units for a fair comparison, or add a robustness check at 5 bps and 10 bps."
    },
    {
      "assessment": "supported",
      "claim": "Across the NASDAQ-100, Buy & Hold attains IR2 = 0.52 (highest), Equal-Weight Monthly attains IR2 = 0.49, and LSTM_2 attains IR2 = 0.46 (best RL).",
      "evidence": "The numbers are consistent with the narrative and with the relative ordering shown in equity curves and HAC p-values. The underlying table (tab:perf_metric_qqq) was not included verbatim in the excerpt provided, so independent recomputation from raw outputs is not possible from the manuscript text alone, but the ordering is internally self-consistent.",
      "id": "c17",
      "location": "Section: Empirical results — NASDAQ 100",
      "severity": "info",
      "suggested_fix": "Ensure the IR2 cell values in tab:perf_metric_qqq match those quoted in the body."
    },
    {
      "assessment": "supported",
      "claim": "Across the Nikkei 225, Buy & Hold has an MLD of 11.345 years, reflecting the post-2008 recovery period.",
      "evidence": "Historical Nikkei 225 (or EWJ as proxy) data show that the index did not reach a new equity-curve high in USD/JPY terms for roughly a decade after 2008, so an MLD of about 11 years over 2009-04 to 2026-03 is plausible.",
      "id": "c18",
      "location": "Section: Empirical results — NIKKEI 225",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "The TD3 algorithm is described as the algorithm used in this study (in the literature review of related methods, but not in the model architecture).",
      "evidence": "There is no claim that this study uses TD3; the literature review cites TD3 work but the methodology consistently uses SAC. No misattribution.",
      "id": "c19",
      "location": "Section: Literature Review (Kabbani 2022) vs Section: Model Architecture (SAC)",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "The Transformer encoder uses self-attention and is reported to be more computationally expensive (23 h/fold vs 14 h/fold for LSTM), but yields no consistent risk-adjusted advantage.",
      "evidence": "Compute scaling for a two-layer self-attention encoder over a 60-day lookback with N_t ≤ 30 assets is plausible at roughly 1.6× the LSTM cost. The empirical IR2 ordering supports the 'no consistent improvement' conclusion in the markets reported.",
      "id": "c20",
      "location": "Section: Methodology — Computational Setup; Section: Discussion — RQ4",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Combining hierarchical Dirichlet policy with absolute-return reward and cash flexibility 'separates the equity-cash allocation decision from individual asset selection.'",
      "evidence": "The action-space factorisation (Bernoulli/Beta over equity-vs-cash mass, then Dirichlet over equity assets) is a valid and consistent parameterisation that satisfies the simplex constraint Σw_i + w^c = 1, w_i,w^c ≥ 0.",
      "id": "c21",
      "location": "Section: Action Space — hierarchical policy",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "The choice of the IR2 metric as 'the most important metric' is suitable because it penalises drawdowns in addition to volatility.",
      "evidence": "IR2 = ARC²·sign(ARC)/(ASD·MD) has scale ARC², which makes it highly sensitive to the magnitude of returns and not just to risk adjustment. Two strategies with similar Sharpe but different mean returns get very different IR2 values, so calling it strictly 'risk-adjusted' is misleading. The metric is also non-monotone in returns for short samples where MD is unstable.",
      "id": "c22",
      "location": "Section: Performance Metrics",
      "severity": "minor",
      "suggested_fix": "Acknowledge that IR2 mixes return-scale and risk-adjustment dimensions, and complement it with standard scale-free metrics (Sortino, Calmar = ARC/MD) for robustness."
    },
    {
      "assessment": "supported",
      "claim": "The central hypothesis is 'only partially confirmed' and the abstract correctly summarises that statistically significant abnormal returns are observed only in the Euro Stoxx 50, primarily through the alpha-regression analysis.",
      "evidence": "The conclusion accurately reflects the underlying tables: Table 7 (HAC and bootstrap) finds no significant mean-return or risk-adjusted outperformance, while Table 8 (HAC-adjusted alpha) flags Euro Stoxx 50 alphas at the 10% level. The framing as 'partial support' is consistent with the evidence and does not overstate the result.",
      "id": "c23",
      "location": "Abstract; Section: Conclusions",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "unsupported",
      "claim": "No multiple-testing correction is reported across the 30 hypothesis tests in Tables 7–8 (5 strategies × 3 markets × 2 tests for Table 7 and 5 strategies × 3 markets for Table 8) plus the ensemble tests.",
      "evidence": "At a nominal 10% one-sided level over roughly 45 tests, the expected number of false discoveries under the global null is ~4.5. The Euro Stoxx 50 alphas (4 of 5 significant in the same market) suggest a genuine market-specific effect rather than chance, but no Bonferroni/Holm/Benjamini–Hochberg adjustment, no White (2000) reality-check, and no Hansen (2005) SPA test are applied to control family-wise error or false discovery rate when claiming significance.",
      "id": "c24",
      "location": "Section: Empirical results — Statistical Significance",
      "severity": "major",
      "suggested_fix": "Apply a multiple-testing correction (Holm or Benjamini–Hochberg) across the full table of HAC and alpha p-values, or use Hansen's SPA test to control for data-snooping bias."
    },
    {
      "assessment": "unsupported",
      "claim": "All RL results are reported from a single training run per configuration per fold, without seed variability.",
      "evidence": "SAC is known to be highly sensitive to random seed (Henderson et al. 2018). The methodology does not describe repeated training across multiple seeds, nor does it report confidence intervals over seed-induced variability. With seed variance unaccounted for, the headline ordering between LSTM_1, LSTM_2, and Transformer (and the 0.46 vs 0.49 vs 0.52 IR2 ordering on NASDAQ-100) may not be statistically distinguishable from training noise.",
      "id": "c25",
      "location": "Section: Methodology — Training and Validation Procedure",
      "severity": "major",
      "suggested_fix": "Train each configuration with at least 5 independent seeds per fold and report mean/std (or quantiles) of all reported metrics; replace point estimates of IR2 etc. with seed-averaged values and bootstrap CIs."
    }
  ],
  "confidence": 0.78,
  "overall_correctness": "mostly_sound"
}
```

## Corrections

<!-- corrections-section: rendered from corrections table; empty on first publish -->
_No corrections have been recorded._

## Bibliography

_No bibliography extracted._

