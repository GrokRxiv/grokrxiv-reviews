# Deep Reinforcement Learning Framework for Diversified Portfolio Management Across Global Equity Markets

GrokRxiv review of [arXiv:2605.17307](https://arxiv.org/abs/2605.17307) · `q-fin.PM`

_Authors_: Kamil Kashif, Robert Ślepaczuk

## TL;DR

This paper evaluates Soft Actor-Critic (SAC) deep reinforcement learning for multi-asset portfolio management across three global equity indices (Nasdaq-100, Nikkei 225, Euro Stoxx 50) using a rigorous 23-year walk-forward framework with 16 out-of-sample folds, five model configurations, and adaptive retraining. The primary finding is a mixed one: risk-adjusted outperformance is observed on Euro Stoxx 50 but not consistently across all markets. Five specialist reviews converge on an incremental but genuinely useful empirical contribution that is undermined by several correctable statistical and reporting flaws. The most serious issues are: (1) approximately 60-75 hypothesis tests conducted at α=0.10 without any multiple-testing correction, with the EURO STOXX 50 alpha-regression results—which drive the 'partial confirmation' conclusion—being quantitatively consistent with chance under the global null; (2) directly contradictory significance claims between the abstract/discussion and Tables 7-8; (3) a mathematically incorrect Maximum Drawdown formula; (4) a single training seed per configuration, making the 'consistently improves' claim for the hierarchical Dirichlet policy unsupportable; and (5) a reproducibility score of 0.32 due to no public code and proprietary Bloomberg membership data. The missing citation of the core SAC paper (Haarnoja et al. 2018) is a notable bibliographic gap. These issues are addressable in a focused revision.

_Recommendation_: **Major revision** · _Confidence_: 82%

## Strengths

- Long-horizon, out-of-sample evaluation framework spanning 23 years (2003–2026) with walk-forward optimization across 16 folds, closely simulating realistic deployment conditions and substantially reducing look-ahead bias.
- Novel hierarchical Dirichlet policy structure that explicitly separates the equity-cash allocation decision from individual stock selection, providing a principled mechanism to enforce full-investment constraints while preserving stochastic gradient compatibility.
- Multi-market evaluation across three economically distinct global indices with identical procedures enabling direct cross-market comparisons and revealing geographic diversification benefits in ensemble aggregation.
- Honest null-result reporting: the paper does not cherry-pick markets or metrics, explicitly acknowledges the failure to consistently beat buy-and-hold across all three markets, and cites Bailey & Lopez de Prado throughout to contextualize its own findings.
- Adaptive retraining mechanism with a statistically motivated threshold (median minus 0.5 std of recent validation Sharpe values) that avoids unnecessary retraining while responding to structural performance degradation.
- Comprehensive performance metric suite (ARC, ASD, MD, MLD, HHI, IR1, IR2, IR3, SR, alpha-regression) grounded in the quantitative finance literature and aligned with cited methodological best practices.

## Weaknesses

- Multiple hypothesis tests (~60–75 across Tables 7 and 8) conducted at α=0.10 with no family-wise error rate correction (Bonferroni, Holm, BH, or the deflated Sharpe ratio already cited by the paper); the EURO STOXX 50 alpha-regression p-values (0.012–0.042) and bootstrap Sharpe/IR2 results that drive the 'partial confirmation' narrative are consistent with chance inflation under the global null.
- Directly contradictory statistical language: the abstract and Discussion state that no strategy achieves statistically significant outperformance, while Tables 7–8 prominently bold multiple significant p-values for EURO STOXX 50 under both bootstrap and alpha-regression tests; the inconsistency is unresolved in the text.
- Maximum Drawdown formula (eq:md) is mathematically incorrect: the inner maximisation is over index t but the inner expression R_{i,T}−R_{i,s} is independent of t, making the inner max degenerate; the formula does not yield standard maximum drawdown.
- Single random seed per configuration throughout; no seed-variance is reported for any fold, configuration, or market, yet the paper claims the hierarchical policy 'consistently improves' risk-adjusted performance—a claim that cannot be established from a single stochastic trajectory per cell.
- Regime boundaries (post-GFC recovery 2009–2013, secular bull 2014–2019, COVID and rate-hike cycle 2020–2026) are defined ex-post on the same data used to evaluate strategy performance with no formal structural-break or regime-switching test; sub-period performance comparisons are presented without statistical inference.
- No source code, trained model weights, or public repository is provided for a custom SAC-Dirichlet implementation across five configurations, three markets, and 16 folds; full replication requires independent re-implementation of the complete pipeline.
- Time-varying index constituent membership data from Bloomberg Terminal Anywhere is proprietary and not released; survivorship-bias-free reconstruction of the tradable universe is not independently feasible, making the data pipeline partially irreproducible.
- The primary algorithm (Soft Actor-Critic, Haarnoja et al. 2018) is absent from the bibliography; foundational RL technical references for policy gradients (Williams 1992) and hierarchical reinforcement learning (Sutton et al. 1999) used to motivate the architectural choices are also missing.
- Transaction cost assumption of 2 bps excludes bid-ask spread, exchange fees, market impact, and FX costs; for globally allocated strategies on Nikkei 225 and Euro Stoxx 50 constituents a realistic round-trip is 5–15 bps; no sensitivity analysis tests whether the EURO STOXX 50 outperformance result survives more realistic cost assumptions.
- The SAC-Dirichlet implementation is underspecified: the reparameterisation used for Dirichlet rsample (implicit vs. explicit pathwise), the entropy term in the SAC objective (analytic Dirichlet differential entropy on the simplex vs. Gaussian approximation), and the interaction of the fixed temperature α=0.2 with Dirichlet concentration parameters—which themselves act as an entropy regulariser—are not described.

## Revision Targets

- [ ] **Manuscript: Section 6.4 Statistical Significance; Tables 7 and 8**
  - Location: `corrections/2605.17307/paper.tex` at `Section 6.4 Statistical Significance; Tables 7 and 8`
  - Evidence: Across Tables 7 and 8 the paper conducts roughly 5 strategies x 3 markets x 4-5 test statistics ~ 60-75 hypothesis tests, plus additional ensemble tests, all at alpha=0.10. Under a global null one would expect ~6-7 'significant' results purely by chance. The EURO STOXX 50 alpha results (3-4 significant p-values in the 0.012-0.042 range) are consistent with chance under such multiplicity, yet the paper interprets them as substantive abnormal returns and as the basis for the 'partial confirmation' of the central hypothesis. The Bailey/Lopez de Prado work cited elsewhere in the paper specifically warns against this pattern.
  - Required change: Apply a multiple-testing correction (Bonferroni, Holm, Benjamini-Hochberg, or the deflated Sharpe ratio of Bailey & Lopez de Prado, which is already cited in the literature review) and report adjusted p-values. Discuss whether the EURO STOXX 50 results survive adjustment.
  - Verification: Re-review should confirm `Section 6.4 Statistical Significance; Tables 7 and 8` is corrected or justified.
- [ ] **Manuscript: Abstract; Section 6.4 Statistical Significance; Discussion**
  - Location: `corrections/2605.17307/paper.tex` at `Abstract; Section 6.4 Statistical Significance; Discussion`
  - Evidence: For mean-return differences the HAC p-values reported in Table 7 are indeed all >>0.10, supporting the claim. However, (a) the bootstrap test of Delta-Sharpe and Delta-IR2 for LSTM_2 on EURO STOXX 50 gives p-values 0.0719 and 0.0619 (bold in the table), so 'no strategy achieves statistical significance' is contradicted by the paper's own risk-adjusted bootstrap tests for at least one configuration; (b) the alpha-regression results in Table 8 report four EURO STOXX 50 strategies and two ensemble strategies that are 'significant' at 10%. The text alternately treats Section 6.4 results as fully non-significant and as evidence of abnormal returns, which is inconsistent.
  - Required change: Rewrite the abstract and Discussion to distinguish (i) mean-difference HAC tests (uniformly non-significant), (ii) bootstrap tests on Sharpe/IR2 (one EURO STOXX 50 strategy significant), and (iii) alpha-regression tests (several EURO STOXX 50 strategies significant). Use consistent language across sections.
  - Verification: Re-review should confirm `Abstract; Section 6.4 Statistical Significance; Discussion` is corrected or justified.
- [ ] **Manuscript: Methodology, eq:md (Performance Metrics)**
  - Location: `corrections/2605.17307/paper.tex` at `Methodology, eq:md (Performance Metrics)`
  - Evidence: As written the inner expression uses R_{i,T} (a fixed terminal value) and R_{i,s} (the outer index), with no dependence on the inner index t, so the inner max is degenerate. The standard MD definition compares the running maximum of the equity/return curve up to s with the value at s (e.g., max_{t<=s}(R_t - R_s) where R denotes cumulative return). The formula as printed does not yield maximum drawdown and contains a transcription error in the subscripts.
  - Required change: Replace with MD = max_{0<=t<=s<=T} (R_t - R_s) (using cumulative log-returns or equity-curve values), or equivalently MD = max_{s} (max_{t<=s} R_t - R_s)/max_{t<=s} R_t for a percentage drawdown; ensure the inner index actually varies inside the inner max.
  - Verification: Re-review should confirm `Methodology, eq:md (Performance Metrics)` is corrected or justified.
- [ ] **Manuscript: Discussion, RQ2; Empirical Results Sections 6.1-6.3**
  - Location: `corrections/2605.17307/paper.tex` at `Discussion, RQ2; Empirical Results Sections 6.1-6.3`
  - Evidence: The numerical comparison rests on a single training seed per configuration (no seed-variance is reported anywhere), and the paper itself acknowledges in the Limitations that reward formulation, encoder, and constraints co-vary across configurations, so the LSTM_1 vs LSTM_2 contrast is not strictly ceteris paribus either (they share the cash setting but differ in policy structure only by design - which is fine - yet the noise floor from SAC stochasticity over 16 folds with 50 epochs is not characterised). 'Consistently improves' is too strong without seed-replicate variance or formal pairwise tests across folds.
  - Required change: Run at least 3-5 independent seeds per fold per configuration and report mean +/- s.d. of IR2/MD/ASD differences between LSTM_1 and LSTM_2, or apply a paired test across folds. Soften 'consistently' to 'on average across the 16 folds' if multi-seed analysis is infeasible.
  - Verification: Re-review should confirm `Discussion, RQ2; Empirical Results Sections 6.1-6.3` is corrected or justified.
- [ ] **Manuscript: Section 7 Regime Analysis; Discussion RQ6**
  - Location: `corrections/2605.17307/paper.tex` at `Section 7 Regime Analysis; Discussion RQ6`
  - Evidence: The regime boundaries are chosen ex-post on the same data used to estimate strategy performance, which is a textbook in-sample regime classification. No formal statistical test (e.g., Markov regime-switching, structural-break test, or out-of-sample HMM) is used to identify regimes. Furthermore, no statistical inference is reported for the sub-period comparisons (only point estimates of IR2/IR3), so 'RL adds the most value during periods of elevated uncertainty' is a narrative inference from at most 5-7 years of data per regime per market.
  - Required change: Either (i) pre-register regime boundaries using an out-of-sample procedure such as fitting an HMM/regime-switching model on the training window and applying labels to the test window, or (ii) frame the regime narrative explicitly as descriptive rather than inferential. Report HAC-robust mean-difference tests per sub-period.
  - Verification: Re-review should confirm `Section 7 Regime Analysis; Discussion RQ6` is corrected or justified.
- [ ] **Compute reproducibility**
  - Location: code/reproducibility artifacts: `compute requirements and runnable smoke path`
  - Evidence: The reported compute requirement is substantial: about 14 hours per LSTM walk-forward cycle and 23 hours per Transformer cycle on an NVIDIA L4 GPU, with multiple markets, folds, and configurations. This raises the cost of independent replication even if code and restricted data were available.
  - Required change: Document the hardware, expected runtime per training cycle, and a reduced smoke configuration or checkpoint path that lets reviewers validate the pipeline without rerunning the full training workload.
  - Verification: Re-review should confirm compute requirements and a smaller validation path are documented.
- [ ] **Data availability and restricted inputs**
  - Location: data/reproducibility artifacts: `data availability and restricted inputs`
  - Evidence: Constituent prices are obtained through yfinance, but the time-varying index membership data needed to address survivorship bias comes from Bloomberg Terminal Anywhere and is not released with the paper. This restricted/proprietary membership history is central to reconstructing the tradable universe.
  - Required change: Add a frozen data snapshot or a reproducible data-access appendix covering price series, historical index membership, data URLs, licenses, and restricted Bloomberg access constraints.
  - Verification: Re-review should find data artifacts or access instructions sufficient to rebuild the reported tables.
- [ ] **Bibliography: Soft Actor-Critic: Off-Policy Maximum Entropy Deep Reinforcement Learning with a Stochastic A...**
  - Location: bibliography entry: `Soft Actor-Critic: Off-Policy Maximum Entropy Deep Reinforcement Learning with a Stochastic Actor (Haarnoja et al., 2...`
  - Evidence: The paper uses the Soft Actor-Critic (SAC) algorithm as its core methodology but does not cite the original paper that introduced it, which is essential for establishing technical foundations.
  - Required change: Add a bibliography entry for `Soft Actor-Critic: Off-Policy Maximum Entropy Deep Reinforcement Learning with a Stochastic Actor (Haarnoja et al., 2018)` and cite it where the affected method or claim is introduced, or explicitly justify its omission.
  - Verification: Re-review should confirm the bibliography and citation context address this reference.
- [ ] **Manuscript: Methodology, Section 5.5 / Table 6**
  - Location: `corrections/2605.17307/paper.tex` at `Methodology, Section 5.5 / Table 6`
  - Evidence: IBKR's 0.05-0.35 bps figure cited is commission only and excludes the bid-ask spread, exchange fees, market impact, and (for foreign markets) FX costs. For a globally-allocated strategy holding 10-30 names in Nasdaq-100, Nikkei 225, and Euro Stoxx 50 with monthly rebalancing on small constituents, a realistic round-trip cost is closer to 5-15 bps. The paper acknowledges this as a limitation in the Conclusions but the headline claim that 2 bps reflects institutional reality is optimistic and is not stress-tested.
  - Required change: Run a sensitivity analysis with 5, 10, and 20 bps per unit of turnover and report how IR2 ranks (especially LSTM_2's EURO STOXX 50 outperformance) hold up.
  - Verification: Re-review should confirm `Methodology, Section 5.5 / Table 6` is corrected or justified.
- [ ] **Manuscript: Methodology, Sections 5.4 Model Architecture and 5.2 Action Space**
  - Location: `corrections/2605.17307/paper.tex` at `Methodology, Sections 5.4 Model Architecture and 5.2 Action Space`
  - Evidence: Replacing SAC's default squashed-Gaussian policy with a Dirichlet introduces non-trivial issues for the standard SAC loss: (i) Dirichlet samples produced via standard PyTorch rsample use an implicit reparameterisation that has known higher-variance gradients than Gaussian rsample, and (ii) the SAC entropy term must be computed using the Dirichlet differential entropy on the simplex rather than the change-of-variables-corrected entropy used for tanh-squashed Gaussians. The paper does not describe these implementation details or cite a SAC-Dirichlet variant, so reproducibility and the validity of fixed alpha=0.2 are unclear.
  - Required change: State explicitly which reparameterisation/log-prob is used for the Dirichlet, whether the entropy term in the SAC loss is the analytic Dirichlet differential entropy on the simplex, and how the temperature scale interacts with the Dirichlet's concentration parameters (which themselves act as an entropy regulariser).
  - Verification: Re-review should confirm `Methodology, Sections 5.4 Model Architecture and 5.2 Action Space` is corrected or justified.

## Open Questions

- Do the EURO STOXX 50 alpha-regression p-values and bootstrap Sharpe/IR2 results survive a Benjamini-Hochberg correction applied jointly to all hypothesis tests reported in Tables 7 and 8? If they do not, how does the paper's central conclusion change?
- Why is the Haarnoja et al. (2018) Soft Actor-Critic paper not cited given that SAC is explicitly named as the core algorithm? Is the implementation based on a specific variant or library that should be cited instead?
- How is the Dirichlet log-probability computed in the SAC actor loss (pathwise reparameterisation vs. REINFORCE), and is the analytic Dirichlet differential entropy or a Gaussian surrogate used for the temperature-weighted entropy term?
- How do the IR2 and MD rankings for LSTM_1 vs. LSTM_2 change when averaged over 3–5 independent seeds per fold? Is the 'consistently improves' claim for the hierarchical policy robust to seed variation?
- Were the three regime boundary years (2013, 2019) determined before or after computing strategy performance on the out-of-sample test data? Would the regime narrative hold under a pre-registered HMM or Markov regime-switching classification?
- How do the key results—especially LSTM_2's EURO STOXX 50 outperformance—change when transaction costs are raised to 5, 10, and 20 bps to reflect realistic round-trip costs including spread and market impact?

## Per-Agent Reviews

### citation (`gemini-3-flash-preview`) — status: `pass`

```json
{
  "confidence": 0.95,
  "entries": [
    {
      "citation": {
        "arxiv_id": "2021.30599",
        "authors": [
          "Carta, Salvatore M.",
          "Consoli, Sergio",
          "Piras, Luca",
          "Podda, Alessandro Sebastian",
          "Recupero, Diego Reforgiato"
        ],
        "doi": "10.1109/ACCESS.2021.3059960",
        "key": "cartaetal9355141",
        "raw": "cartaetal9355141: author = {Carta, Salvatore M. and Consoli, Sergio and Piras, Luca and Podda, Alessandro Sebastian and Recupero, Diego Reforgiato}, title = {Explainable Machine Learning Exploiting News and Domain-Specific Lexicon for Stock Market Forecasting}, journal = {IEEE Access}, volume = {9}, pages = {30193--30205}, year = {2021}, publisher = {IEEE}, issn = {2169-3536}, doi = {10.1109/ACCESS.2021.3059960}",
        "title": "Explainable Machine Learning Exploiting News and Domain-Specific Lexicon for Stock Market Forecasting",
        "url": null,
        "venue": "IEEE Access",
        "year": 2021
      },
      "exists": null,
      "explanation": "Cited in the Methodology section as the source for walk-forward optimization conventions and parameter selection in financial machine learning research.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Michańków, Jakub",
          "Sakowski, Paweł",
          "Ślepaczuk, Robert"
        ],
        "doi": "10.3390/s22030917",
        "key": "michankow2022lstm",
        "raw": "michankow2022lstm: author = {Micha{\\'n}k{\\'o}w, Jakub and Sakowski, Pawe{\\l} and {\\'S}lepaczuk, Robert}, title = {{LSTM} in Algorithmic Investment Strategies on {BTC} and {S\\&P500} Index}, journal = {Sensors}, volume = {22}, number = {3}, pages = {917}, year = {2022}, publisher = {MDPI}, issn = {1424-8220}, doi = {10.3390/s22030917}",
        "title": "LSTM in Algorithmic Investment Strategies on BTC and S&P500 Index",
        "url": null,
        "venue": "Sensors",
        "year": 2022
      },
      "exists": null,
      "explanation": "Cited in the Methodology section for performance metrics and the definition of Maximum Loss Duration (MLD).",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2021.12678",
        "authors": [
          "Bui, Quynh",
          "Ślepaczuk, Robert"
        ],
        "doi": "10.1016/j.physa.2021.126784",
        "key": "PairTrading",
        "raw": "PairTrading: author = {Bui, Quynh and {\\'S}lepaczuk, Robert}, title = {Applying {H}urst Exponent in pair trading strategies on {N}asdaq 100 index}, journal = {Physica A: Statistical Mechanics and its Applications}, volume = {592}, pages = {126784}, year = {2022}, publisher = {Elsevier}, issn = {0378-4371}, doi = {10.1016/j.physa.2021.126784}",
        "title": "Applying Hurst Exponent in pair trading strategies on Nasdaq 100 index",
        "url": null,
        "venue": "Physica A: Statistical Mechanics and its Applications",
        "year": 2022
      },
      "exists": null,
      "explanation": "Cited in the Methodology section as a reference for performance metrics commonly used in financial literature.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "6261.1952",
        "authors": [
          "Markowitz, Harry"
        ],
        "doi": "10.1111/j.1540-6261.1952.tb01525.x",
        "key": "Markowitz_1952",
        "raw": "Markowitz_1952: author = {Markowitz, Harry}, title = {Portfolio Selection}, journal = {The Journal of Finance}, volume = {7}, number = {1}, pages = {77--91}, year = {1952}, publisher = {American Finance Association; Wiley}, issn = {0022-1082}, doi = {10.1111/j.1540-6261.1952.tb01525.x}",
        "title": "Portfolio Selection",
        "url": null,
        "venue": "The Journal of Finance",
        "year": 1952
      },
      "exists": null,
      "explanation": "Foundational work for modern portfolio optimization (MVO) discussed in the Literature Review.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Black, Fischer",
          "Litterman, Robert"
        ],
        "doi": "10.2469/faj.v48.n5.28",
        "key": "Black_Literman",
        "raw": "Black_Literman: author = {Black, Fischer and Litterman, Robert}, title = {Global Portfolio Optimization}, journal = {Financial Analysts Journal}, volume = {48}, number = {5}, pages = {28--43}, year = {1992}, publisher = {CFA Institute; Taylor \\& Francis}, issn = {0015-198X}, doi = {10.2469/faj.v48.n5.28}",
        "title": "Global Portfolio Optimization",
        "url": null,
        "venue": "Financial Analysts Journal",
        "year": 1992
      },
      "exists": null,
      "explanation": "Cited in the Literature Review for its critique of mean-variance optimization hypersensitivity and concentration.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Ślusarczyk, Damian",
          "Ślepaczuk, Robert"
        ],
        "doi": "10.1186/s40537-025-01164-z",
        "key": "slusarczyk2025optimal",
        "raw": "slusarczyk2025optimal: author = {{\\'S}lusarczyk, Damian and {\\'S}lepaczuk, Robert}, title = {Optimal {M}arkowitz portfolio using returns forecasted with time series and machine learning models}, journal = {Journal of Big Data}, volume = {12}, number = {1}, pages = {127}, year = {2025}, publisher = {Springer}, issn = {2196-1115}, doi = {10.1186/s40537-025-01164-z}",
        "title": "Optimal Markowitz portfolio using returns forecasted with time series and machine learning models",
        "url": null,
        "venue": "Journal of Big Data",
        "year": 2025
      },
      "exists": null,
      "explanation": "Cited in the Literature Review as a modern example of integrating hybrid predictive modeling with traditional optimization.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Kim, Kyoung-jae"
        ],
        "doi": "10.1016/S0925-2312(03)00372-2",
        "key": "Kim2003",
        "raw": "Kim2003: author = {Kim, Kyoung-jae}, title = {Financial time series forecasting using support vector machines}, journal = {Neurocomputing}, volume = {55}, number = {1--2}, pages = {307--319}, year = {2003}, publisher = {Elsevier}, issn = {0925-2312}, doi = {10.1016/S0925-2312(03)00372-2}",
        "title": "Financial time series forecasting using support vector machines",
        "url": null,
        "venue": "Neurocomputing",
        "year": 2003
      },
      "exists": null,
      "explanation": "Cited in the Literature Review for demonstrating the effectiveness of SVMs in index prediction.",
      "notes": null,
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "1605.00003",
        "authors": [
          "Khaidem, Luckyson",
          "Saha, Snehanshu",
          "Dey, Sudeepa Roy"
        ],
        "doi": "10.48550/arXiv.1605.00003",
        "key": "Khaidem2016",
        "raw": "Khaidem2016: author = {Khaidem, Luckyson and Saha, Snehanshu and Dey, Sudeepa Roy}, title = {Predicting the direction of stock market prices using random forest}, journal = {arXiv preprint arXiv:1605.00003}, year = {2016}, eprint = {1605.00003}, archivePrefix = {arXiv}, primaryClass = {cs.LG}, doi = {10.48550/arXiv.1605.00003}",
        "title": "Predicting the direction of stock market prices using random forest",
        "url": null,
        "venue": "arXiv preprint arXiv:1605.00003",
        "year": 2016
      },
      "exists": null,
      "explanation": "Cited in the Literature Review regarding the use of Random Forests for capturing market patterns.",
      "notes": null,
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2023.10205",
        "authors": [
          "Grudniewicz, Jan",
          "Ślepaczuk, Robert"
        ],
        "doi": "10.1016/j.ribaf.2023.102052",
        "key": "Grudniewicz_Slepaczuk_2023",
        "raw": "Grudniewicz_Slepaczuk_2023: author = {Grudniewicz, Jan and {\\'S}lepaczuk, Robert}, title = {Application of machine learning in algorithmic investment strategies on global stock markets}, journal = {Research in International Business and Finance}, volume = {66}, pages = {102052}, year = {2023}, publisher = {Elsevier}, issn = {0275-5319}, doi = {10.1016/j.ribaf.2023.102052}",
        "title": "Application of machine learning in algorithmic investment strategies on global stock markets",
        "url": null,
        "venue": "Research in International Business and Finance",
        "year": 2023
      },
      "exists": null,
      "explanation": "Cited in the Literature Review for its comparative study of ML algorithms (SVM, Bayesian GLM) in global markets.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Bailey, David H.",
          "Borwein, Jonathan M.",
          "López de Prado, Marcos",
          "Zhu, Qiji Jim"
        ],
        "doi": "10.21314/JCF.2016.322",
        "key": "Bailey2014",
        "raw": "Bailey2014: author = {Bailey, David H. and Borwein, Jonathan M. and {L\\'opez de Prado}, Marcos and Zhu, Qiji Jim}, title = {The probability of backtest overfitting}, journal = {The Journal of Computational Finance}, volume = {20}, number = {4}, pages = {39--69}, year = {2017}, publisher = {Infopro Digital Risk}, issn = {1460-1559}, doi = {10.21314/JCF.2016.322}",
        "title": "The probability of backtest overfitting",
        "url": null,
        "venue": "The Journal of Computational Finance",
        "year": 2017
      },
      "exists": null,
      "explanation": "High relevance as it provides the mathematical framework for quantifying backtest overfitting, cited in Literature Review, Methodology, and Conclusions.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "López de Prado, Marcos"
        ],
        "doi": "10.3905/jpm.2018.44.6.120",
        "key": "LopezDePrado2018",
        "raw": "LopezDePrado2018: author = {{L\\'opez de Prado}, Marcos}, title = {The 10 reasons most machine learning funds fail}, journal = {The Journal of Portfolio Management}, volume = {44}, number = {6}, pages = {120--133}, year = {2018}, publisher = {Portfolio Management Research}, issn = {0095-4918}, doi = {10.3905/jpm.2018.44.6.120}",
        "title": "The 10 reasons most machine learning funds fail",
        "url": null,
        "venue": "The Journal of Portfolio Management",
        "year": 2018
      },
      "exists": null,
      "explanation": "Cited in the Literature Review for its methodological recommendations on walk-forward backtesting and robust performance metrics.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2020.29712",
        "authors": [
          "Lin, Yu-Fei",
          "Huang, Tzu-Ming",
          "Chung, Wei-Ho",
          "Ueng, Yeong-Luh"
        ],
        "doi": "10.1109/TETCI.2020.2971218",
        "key": "Giles2001",
        "raw": "Giles2001: author = {Lin, Yu-Fei and Huang, Tzu-Ming and Chung, Wei-Ho and Ueng, Yeong-Luh}, title = {Forecasting Fluctuations in the Financial Index Using a Recurrent Neural Network Based on Price Features}, journal = {IEEE Transactions on Emerging Topics in Computational Intelligence}, volume = {5}, number = {5}, pages = {780--791}, year = {2021}, publisher = {IEEE}, issn = {2471-285X}, doi = {10.1109/TETCI.2020.2971218}",
        "title": "Forecasting Fluctuations in the Financial Index Using a Recurrent Neural Network Based on Price Features",
        "url": null,
        "venue": "IEEE Transactions on Emerging Topics in Computational Intelligence",
        "year": 2021
      },
      "exists": null,
      "explanation": "Cited in the Literature Review for early RNN benchmarks in capturing stock dynamics.",
      "notes": null,
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Bieganowski, Bartosz",
          "Ślepaczuk, Robert"
        ],
        "doi": "10.1186/s40537-025-01267-7",
        "key": "Bieganowski_Slepaczuk_2024",
        "raw": "Bieganowski_Slepaczuk_2024: author = {Bieganowski, Bartosz and {\\'S}lepaczuk, Robert}, title = {Supervised autoencoder {MLP} for financial time series forecasting}, journal = {Journal of Big Data}, volume = {12}, number = {1}, pages = {207}, year = {2025}, publisher = {Springer}, issn = {2196-1115}, doi = {10.1186/s40537-025-01267-7}",
        "title": "Supervised autoencoder MLP for financial time series forecasting",
        "url": null,
        "venue": "Journal of Big Data",
        "year": 2025
      },
      "exists": null,
      "explanation": "Cited in the Literature Review regarding supervised autoencoders and robust labeling techniques (Triple Barrier Method).",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Fischer, Thomas",
          "Krauss, Christopher"
        ],
        "doi": "10.1016/j.ejor.2017.11.054",
        "key": "Fischer2018",
        "raw": "Fischer2018: author = {Fischer, Thomas and Krauss, Christopher}, title = {Deep learning with long short-term memory networks for financial market predictions}, journal = {European Journal of Operational Research}, volume = {270}, number = {2}, pages = {654--669}, year = {2018}, publisher = {Elsevier}, issn = {0377-2217}, doi = {10.1016/j.ejor.2017.11.054}",
        "title": "Deep learning with long short-term memory networks for financial market predictions",
        "url": null,
        "venue": "European Journal of Operational Research",
        "year": 2018
      },
      "exists": null,
      "explanation": "Cited in the Literature Review as the standard for LSTMs in predicting S&P 500 constituents.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Krynska, Katarzyna",
          "Ślepaczuk, Robert"
        ],
        "doi": "10.2139/ssrn.4628806",
        "key": "Krynska_Slepaczuk_2022",
        "raw": "Krynska_Slepaczuk_2022: author = {Krynska, Katarzyna and {\\'S}lepaczuk, Robert}, title = {Daily and intraday application of various architectures of the {LSTM} model in algorithmic investment strategies on {B}itcoin and the {S\\&P} 500 Index}, journal = {SSRN Electronic Journal}, year = {2023}, publisher = {Elsevier}, note = {Available at SSRN: 4628806}, doi = {10.2139/ssrn.4628806}",
        "title": "Daily and intraday application of various architectures of the LSTM model in algorithmic investment strategies on Bitcoin and the S&P 500 Index",
        "url": null,
        "venue": "SSRN Electronic Journal",
        "year": 2023
      },
      "exists": null,
      "explanation": "Cited in the Literature Review regarding LSTM architectures for Bitcoin and S&P 500.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2025.11356",
        "authors": [
          "Kashif, Kamil",
          "Ślepaczuk, Robert"
        ],
        "doi": "10.1016/j.knosys.2025.113563",
        "key": "Kashif_Slepaczuk_2024",
        "raw": "Kashif_Slepaczuk_2024: author = {Kashif, Kamil and {\\'S}lepaczuk, Robert}, title = {{LSTM-ARIMA} as a hybrid approach in algorithmic investment strategies}, journal = {Knowledge-Based Systems}, volume = {320}, pages = {113563}, year = {2025}, publisher = {Elsevier}, issn = {0950-7051}, doi = {10.1016/j.knosys.2025.113563}",
        "title": "LSTM-ARIMA as a hybrid approach in algorithmic investment strategies",
        "url": null,
        "venue": "Knowledge-Based Systems",
        "year": 2025
      },
      "exists": null,
      "explanation": "Cited in the Literature Review as a hybrid approach pairing LSTMs with econometric components.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2503.18096",
        "authors": [
          "Stefaniuk, Filip",
          "Ślepaczuk, Robert"
        ],
        "doi": "10.48550/arXiv.2503.18096",
        "key": "Stefaniuk_Slepaczuk_2025",
        "raw": "Stefaniuk_Slepaczuk_2025: author = {Stefaniuk, Filip and {\\'S}lepaczuk, Robert}, title = {Informer in algorithmic investment strategies on high frequency bitcoin data}, journal = {arXiv preprint arXiv:2503.18096}, year = {2025}, eprint = {2503.18096}, archivePrefix = {arXiv}, primaryClass = {q-fin.TR}, doi = {10.48550/arXiv.2503.18096}",
        "title": "Informer in algorithmic investment strategies on high frequency bitcoin data",
        "url": null,
        "venue": "arXiv preprint arXiv:2503.18096",
        "year": 2025
      },
      "exists": null,
      "explanation": "Cited in the Literature Review for the application of Transformer-based (Informer) architectures to financial data.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Hambly, Ben",
          "Xu, Renyuan",
          "Yang, Huining"
        ],
        "doi": "10.1111/mafi.12382",
        "key": "Hambly_2023",
        "raw": "Hambly_2023: author = {Hambly, Ben and Xu, Renyuan and Yang, Huining}, title = {Recent advances in reinforcement learning in finance}, journal = {Mathematical Finance}, volume = {33}, number = {3}, pages = {437--503}, year = {2023}, publisher = {Wiley}, issn = {0960-1627}, doi = {10.1111/mafi.12382}",
        "title": "Recent advances in reinforcement learning in finance",
        "url": null,
        "venue": "Mathematical Finance",
        "year": 2023
      },
      "exists": null,
      "explanation": "Cited in the Literature Review as a key survey of RL in finance and in the Conclusions for its contrast with the proposed hierarchical policy.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Moody, John",
          "Saffell, Matthew"
        ],
        "doi": "10.1109/72.935097",
        "key": "MOODY",
        "raw": "MOODY: author = {Moody, John and Saffell, Matthew}, title = {Learning to trade via direct reinforcement}, journal = {IEEE Transactions on Neural Networks}, volume = {12}, number = {4}, pages = {875--889}, year = {2001}, publisher = {IEEE}, issn = {1045-9227}, doi = {10.1109/72.935097}",
        "title": "Learning to trade via direct reinforcement",
        "url": null,
        "venue": "IEEE Transactions on Neural Networks",
        "year": 2001
      },
      "exists": null,
      "explanation": "Foundational reference for the Direct Reinforcement (DR) approach in trading, cited in the Literature Review.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2016.25224",
        "authors": [
          "Deng, Yue",
          "Bao, Feng",
          "Kong, Youyong",
          "Ren, Zhiquan",
          "Dai, Qionghai"
        ],
        "doi": "10.1109/TNNLS.2016.2522401",
        "key": "Deng2016",
        "raw": "Deng2016: author = {Deng, Yue and Bao, Feng and Kong, Youyong and Ren, Zhiquan and Dai, Qionghai}, title = {Deep Direct Reinforcement Learning for Financial Signal Representation and Trading}, journal = {IEEE Transactions on Neural Networks and Learning Systems}, volume = {28}, number = {3}, pages = {653--664}, year = {2017}, publisher = {IEEE}, issn = {2162-237X}, doi = {10.1109/TNNLS.2016.2522401}",
        "title": "Deep Direct Reinforcement Learning for Financial Signal Representation and Trading",
        "url": null,
        "venue": "IEEE Transactions on Neural Networks and Learning Systems",
        "year": 2017
      },
      "exists": null,
      "explanation": "Cited in the Literature Review for its recurrent deep RL framework for real-time trading.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2510.09247",
        "authors": [
          "Bracha, Zofia",
          "Sakowski, Paweł",
          "Michańków, Jakub"
        ],
        "doi": "10.48550/arXiv.2510.09247",
        "key": "bracha2025application",
        "raw": "bracha2025application: author = {Bracha, Zofia and Sakowski, Pawe{\\l} and Micha{\\'n}k{\\'o}w, Jakub}, title = {Application of Deep Reinforcement Learning to At-the-Money {S\\&P} 500 Options Hedging}, journal = {arXiv preprint arXiv:2510.09247}, year = {2025}, eprint = {2510.09247}, archivePrefix = {arXiv}, primaryClass = {q-fin.TR}, doi = {10.48550/arXiv.2510.09247}",
        "title": "Application of Deep Reinforcement Learning to At-the-Money S&P 500 Options Hedging",
        "url": null,
        "venue": "arXiv preprint arXiv:2510.09247",
        "year": 2025
      },
      "exists": null,
      "explanation": "Cited in the Literature Review as a recent extension to deep hedging with TD3.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Zhang, Haoran",
          "Li, Xiaofei",
          "Wan, Tianjiao",
          "Du, Junjie"
        ],
        "doi": "10.3390/sym18010112",
        "key": "Meng2026",
        "raw": "Meng2026: author = {Zhang, Haoran and Li, Xiaofei and Wan, Tianjiao and Du, Junjie}, title = {Deep Reinforcement Learning for Financial Trading: Enhanced by Cluster Embedding and Zero-Shot Prediction}, journal = {Symmetry}, volume = {18}, number = {1}, pages = {112}, year = {2026}, publisher = {MDPI}, issn = {2073-8994}, doi = {10.3390/sym18010112}",
        "title": "Deep Reinforcement Learning for Financial Trading: Enhanced by Cluster Embedding and Zero-Shot Prediction",
        "url": null,
        "venue": "Symmetry",
        "year": 2026
      },
      "exists": null,
      "explanation": "Cited in the Literature Review for cluster embedding and zero-shot prediction in DRL for trading.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2112.06753",
        "authors": [
          "Liu, Xiao-Yang",
          "Rui, Jingyang",
          "Gao, Jiechao",
          "Yang, Liuqing",
          "Yang, Hongyang",
          "Wang, Zhaoran",
          "Wang, Christina Dan",
          "Guo, Jian"
        ],
        "doi": "10.48550/arXiv.2112.06753",
        "key": "Liu_2025",
        "raw": "Liu_2025: author = {Liu, Xiao-Yang and Rui, Jingyang and Gao, Jiechao and Yang, Liuqing and Yang, Hongyang and Wang, Zhaoran and Wang, Christina Dan and Guo, Jian}, title = {{FinRL-Meta}: A universe of near-real market environments for data-driven deep reinforcement learning in quantitative finance}, journal = {arXiv preprint arXiv:2112.06753}, year = {2021}, eprint = {2112.06753}, archivePrefix = {arXiv}, primaryClass = {q-fin.TR}, doi = {10.48550/arXiv.2112.06753}",
        "title": "FinRL-Meta: A universe of near-real market environments for data-driven deep reinforcement learning in quantitative finance",
        "url": null,
        "venue": "arXiv preprint arXiv:2112.06753",
        "year": 2021
      },
      "exists": null,
      "explanation": "Cited in the Literature Review for providing standardized RL environments (FinRL-Meta).",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2019.15716",
        "authors": [
          "Buehler, Hans",
          "Gonon, Lukas",
          "Teichmann, Josef",
          "Wood, Ben"
        ],
        "doi": "10.1080/14697688.2019.1571683",
        "key": "Buehler_2019",
        "raw": "Buehler_2019: author = {Buehler, Hans and Gonon, Lukas and Teichmann, Josef and Wood, Ben}, title = {Deep hedging}, journal = {Quantitative Finance}, volume = {19}, number = {8}, pages = {1271--1291}, year = {2019}, publisher = {Taylor \\& Francis}, issn = {1469-7688}, doi = {10.1080/14697688.2019.1571683}",
        "title": "Deep hedging",
        "url": null,
        "venue": "Quantitative Finance",
        "year": 2019
      },
      "exists": null,
      "explanation": "Cited in the Literature Review for hedging derivative portfolios with DRL under market frictions.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Maringer, Dietmar",
          "Ramtohul, Tikesh"
        ],
        "doi": "10.1007/s10287-011-0131-1",
        "key": "maringer2012regime",
        "raw": "maringer2012regime: author = {Maringer, Dietmar and Ramtohul, Tikesh}, title = {Regime-switching recurrent reinforcement learning for investment decision making}, journal = {Computational Management Science}, volume = {9}, number = {1}, pages = {89--107}, year = {2012}, publisher = {Springer}, issn = {1619-697X}, doi = {10.1007/s10287-011-0131-1}",
        "title": "Regime-switching recurrent reinforcement learning for investment decision making",
        "url": null,
        "venue": "Computational Management Science",
        "year": 2012
      },
      "exists": null,
      "explanation": "Cited in the Literature Review for incorporating regime-switching into reinforcement learning models.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Du, Jiayi",
          "Jin, Muyang",
          "Kolm, Petter N.",
          "Ritter, Gordon",
          "Wang, Yixuan",
          "Zhang, Bofei"
        ],
        "doi": "10.3905/jfds.2020.1.045",
        "key": "Zhang_2020",
        "raw": "Zhang_2020: author = {Du, Jiayi and Jin, Muyang and Kolm, Petter N. and Ritter, Gordon and Wang, Yixuan and Zhang, Bofei}, title = {Deep reinforcement learning for option replication and hedging}, journal = {The Journal of Financial Data Science}, volume = {2}, number = {4}, pages = {44--57}, year = {2020}, publisher = {Portfolio Management Research}, issn = {2640-3943}, doi = {10.3905/jfds.2020.1.045}",
        "title": "Deep reinforcement learning for option replication and hedging",
        "url": null,
        "venue": "The Journal of Financial Data Science",
        "year": 2020
      },
      "exists": null,
      "explanation": "Cited in the Literature Review regarding DRL for option replication under market frictions.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2022.32036",
        "authors": [
          "Kabbani, Taylan",
          "Duman, Ekrem"
        ],
        "doi": "10.1109/ACCESS.2022.3203697",
        "key": "kabbani2022deep",
        "raw": "kabbani2022deep: author = {Kabbani, Taylan and Duman, Ekrem}, title = {Deep reinforcement learning approach for trading automation in the stock market}, journal = {IEEE Access}, volume = {10}, pages = {93564--93574}, year = {2022}, publisher = {IEEE}, issn = {2169-3536}, doi = {10.1109/ACCESS.2022.3203697}",
        "title": "Deep reinforcement learning approach for trading automation in the stock market",
        "url": null,
        "venue": "IEEE Access",
        "year": 2022
      },
      "exists": null,
      "explanation": "Cited in the Literature Review as a POMDP formulation of portfolio allocation and price prediction.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2025.11293",
        "authors": [
          "Rani, Ishta",
          "Gandhi, Hina",
          "Kumar, Ramesh",
          "Marannan, Nithya",
          "Kim, Na Kyung",
          "Kumar, Tejaswini"
        ],
        "doi": "10.1109/ICSIT65336.2025.11293906",
        "key": "rani2025deep",
        "raw": "rani2025deep: author = {Rani, Ishta and Gandhi, Hina and Kumar, Ramesh and Marannan, Nithya and Kim, Na Kyung and Kumar, Tejaswini}, title = {Deep Reinforcement Learning for High-Frequency Trading with Market Impact Modeling}, booktitle = {2025 International Conference on Sustainability, Innovation \\& Technology (ICSIT)}, pages = {1--6}, year = {2025}, publisher = {IEEE}, doi = {10.1109/ICSIT65336.2025.11293906}",
        "title": "Deep Reinforcement Learning for High-Frequency Trading with Market Impact Modeling",
        "url": null,
        "venue": "2025 International Conference on Sustainability, Innovation & Technology (ICSIT)",
        "year": 2025
      },
      "exists": null,
      "explanation": "Cited in the Literature Review for DRL in high-frequency trading incorporating market impact.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Yang, Hongyang",
          "Liu, Xiao-Yang",
          "Zhong, Shan",
          "Walid, Anwar"
        ],
        "doi": "10.1145/3383455.3422540",
        "key": "yang2020deep",
        "raw": "yang2020deep: author = {Yang, Hongyang and Liu, Xiao-Yang and Zhong, Shan and Walid, Anwar}, title = {Deep reinforcement learning for automated stock trading: An ensemble strategy}, booktitle = {Proceedings of the First ACM International Conference on AI in Finance (ICAIF '20)}, pages = {1--8}, year = {2020}, publisher = {Association for Computing Machinery}, address = {New York, NY, USA}, doi = {10.1145/3383455.3422540}",
        "title": "Deep reinforcement learning for automated stock trading: An ensemble strategy",
        "url": null,
        "venue": "Proceedings of the First ACM International Conference on AI in Finance (ICAIF '20)",
        "year": 2020
      },
      "exists": null,
      "explanation": "Highly relevant as a reference for ensemble DRL strategies, cited in Literature Review, Empirical results, and Conclusions.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2025.35339",
        "authors": [
          "Enkhsaikhan, Bayaraa",
          "Jo, Ohyun"
        ],
        "doi": "10.1109/TBDATA.2025.3533905",
        "key": "Ohyun2025",
        "raw": "Ohyun2025: author = {Enkhsaikhan, Bayaraa and Jo, Ohyun}, title = {Risk-Constrained Reinforcement Learning With Augmented {L}agrangian Multiplier for Portfolio Optimization}, journal = {IEEE Transactions on Big Data}, volume = {11}, number = {5}, pages = {2489--2502}, year = {2025}, publisher = {IEEE}, issn = {2332-7790}, doi = {10.1109/TBDATA.2025.3533905}",
        "title": "Risk-Constrained Reinforcement Learning With Augmented Lagrangian Multiplier for Portfolio Optimization",
        "url": null,
        "venue": "IEEE Transactions on Big Data",
        "year": 2025
      },
      "exists": null,
      "explanation": "Cited in the Literature Review for formulating portfolio optimization as a constrained MDP (CMDP).",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2024.10744",
        "authors": [
          "Tamuly, Adrika",
          "Bhutani, Gariman",
          "Sukriti"
        ],
        "doi": "10.1109/INDISCON62179.2024.10744403",
        "key": "park2022portfolio",
        "raw": "park2022portfolio: author = {Tamuly, Adrika and Bhutani, Gariman and Sukriti}, title = {Portfolio Optimization using Deep Reinforcement Learning}, booktitle = {2024 IEEE 5th India Council International Subsections Conference (INDISCON)}, pages = {1--6}, year = {2024}, publisher = {IEEE}, address = {Piscataway, NJ, USA}, doi = {10.1109/INDISCON62179.2024.10744403}",
        "title": "Portfolio Optimization using Deep Reinforcement Learning",
        "url": null,
        "venue": "2024 IEEE 5th India Council International Subsections Conference (INDISCON)",
        "year": 2024
      },
      "exists": null,
      "explanation": "Cited in the Literature Review for applying DQN with experience replay to portfolio optimization.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2020.11345",
        "authors": [
          "Soleymani, Farzan",
          "Paquet, Eric"
        ],
        "doi": "10.1016/j.eswa.2020.113456",
        "key": "SOLEYMANI2020113456",
        "raw": "SOLEYMANI2020113456: author = {Soleymani, Farzan and Paquet, Eric}, title = {Financial portfolio optimization with online deep reinforcement learning and restricted stacked autoencoder---{D}eep{B}reath}, journal = {Expert Systems with Applications}, volume = {156}, pages = {113456}, year = {2020}, publisher = {Elsevier}, issn = {0957-4174}, doi = {10.1016/j.eswa.2020.113456}",
        "title": "Financial portfolio optimization with online deep reinforcement learning and restricted stacked autoencoder---DeepBreath",
        "url": null,
        "venue": "Expert Systems with Applications",
        "year": 2020
      },
      "exists": null,
      "explanation": "Cited in the Literature Review for the DeepBreath framework combining autoencoders and CNNs.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    }
  ],
  "missing_references": [
    {
      "reason": "The paper uses the Soft Actor-Critic (SAC) algorithm as its core methodology but does not cite the original paper that introduced it, which is essential for establishing technical foundations.",
      "title": "Soft Actor-Critic: Off-Policy Maximum Entropy Deep Reinforcement Learning with a Stochastic Actor (Haarnoja et al., 2018)"
    },
    {
      "reason": "While referencing Moody & Saffell (2001) for direct reinforcement, it lacks citation of this foundational work for policy gradients in RL, which PPO and SAC build upon.",
      "title": "Simple Statistical Gradient-Following Algorithms for Connectionist Reinforcement Learning (Williams, 1992)"
    },
    {
      "reason": "The paper discusses hierarchical policies but omits this classic reference which established the framework for hierarchical RL.",
      "title": "Between MDPs and semi-MDPs: A framework for temporal abstraction in reinforcement learning (Sutton et al., 1999)"
    }
  ],
  "summary": "The paper provides a comprehensive review of classical and modern portfolio management techniques, transitioning from foundational Markowitz (1952) and Black-Litterman (1992) frameworks to advanced deep reinforcement learning (DRL) and transformer-based architectures. Key methodological citations include Bailey (2014) for backtest overfitting and DeMiguel et al. (2009) for the 1/N benchmark. While the literature review is extensive in covering recent deep learning applications in finance (Fischer 2018, Yang 2020), it notably misses foundational RL technical papers for the specific algorithms used (SAC, options framework)."
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.82,
  "questions": [
    "Do the EURO STOXX 50 alpha-regression p-values and bootstrap Sharpe/IR2 results survive a Benjamini-Hochberg correction applied jointly to all hypothesis tests reported in Tables 7 and 8? If they do not, how does the paper's central conclusion change?",
    "Why is the Haarnoja et al. (2018) Soft Actor-Critic paper not cited given that SAC is explicitly named as the core algorithm? Is the implementation based on a specific variant or library that should be cited instead?",
    "How is the Dirichlet log-probability computed in the SAC actor loss (pathwise reparameterisation vs. REINFORCE), and is the analytic Dirichlet differential entropy or a Gaussian surrogate used for the temperature-weighted entropy term?",
    "How do the IR2 and MD rankings for LSTM_1 vs. LSTM_2 change when averaged over 3–5 independent seeds per fold? Is the 'consistently improves' claim for the hierarchical policy robust to seed variation?",
    "Were the three regime boundary years (2013, 2019) determined before or after computing strategy performance on the out-of-sample test data? Would the regime narrative hold under a pre-registered HMM or Markov regime-switching classification?",
    "How do the key results—especially LSTM_2's EURO STOXX 50 outperformance—change when transaction costs are raised to 5, 10, and 20 bps to reflect realistic round-trip costs including spread and market impact?"
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "Across Tables 7 and 8 the paper conducts roughly 5 strategies x 3 markets x 4-5 test statistics ~ 60-75 hypothesis tests, plus additional ensemble tests, all at alpha=0.10. Under a global null one would expect ~6-7 'significant' results purely by chance. The EURO STOXX 50 alpha results (3-4 significant p-values in the 0.012-0.042 range) are consistent with chance under such multiplicity, yet the paper interprets them as substantive abnormal returns and as the basis for the 'partial confirmation' of the central hypothesis. The Bailey/Lopez de Prado work cited elsewhere in the paper specifically warns against this pattern.",
      "id": "weakness-1",
      "locator": "Section 6.4 Statistical Significance; Tables 7 and 8",
      "required_update": "Apply a multiple-testing correction (Bonferroni, Holm, Benjamini-Hochberg, or the deflated Sharpe ratio of Bailey & Lopez de Prado, which is already cited in the literature review) and report adjusted p-values. Discuss whether the EURO STOXX 50 results survive adjustment.",
      "source_path": "corrections/2605.17307/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 6.4 Statistical Significance; Tables 7 and 8` is corrected or justified.",
      "weakness_index": 0
    },
    {
      "evidence": "For mean-return differences the HAC p-values reported in Table 7 are indeed all >>0.10, supporting the claim. However, (a) the bootstrap test of Delta-Sharpe and Delta-IR2 for LSTM_2 on EURO STOXX 50 gives p-values 0.0719 and 0.0619 (bold in the table), so 'no strategy achieves statistical significance' is contradicted by the paper's own risk-adjusted bootstrap tests for at least one configuration; (b) the alpha-regression results in Table 8 report four EURO STOXX 50 strategies and two ensemble strategies that are 'significant' at 10%. The text alternately treats Section 6.4 results as fully non-significant and as evidence of abnormal returns, which is inconsistent.",
      "id": "weakness-2",
      "locator": "Abstract; Section 6.4 Statistical Significance; Discussion",
      "required_update": "Rewrite the abstract and Discussion to distinguish (i) mean-difference HAC tests (uniformly non-significant), (ii) bootstrap tests on Sharpe/IR2 (one EURO STOXX 50 strategy significant), and (iii) alpha-regression tests (several EURO STOXX 50 strategies significant). Use consistent language across sections.",
      "source_path": "corrections/2605.17307/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Abstract; Section 6.4 Statistical Significance; Discussion` is corrected or justified.",
      "weakness_index": 1
    },
    {
      "evidence": "As written the inner expression uses R_{i,T} (a fixed terminal value) and R_{i,s} (the outer index), with no dependence on the inner index t, so the inner max is degenerate. The standard MD definition compares the running maximum of the equity/return curve up to s with the value at s (e.g., max_{t<=s}(R_t - R_s) where R denotes cumulative return). The formula as printed does not yield maximum drawdown and contains a transcription error in the subscripts.",
      "id": "weakness-3",
      "locator": "Methodology, eq:md (Performance Metrics)",
      "required_update": "Replace with MD = max_{0<=t<=s<=T} (R_t - R_s) (using cumulative log-returns or equity-curve values), or equivalently MD = max_{s} (max_{t<=s} R_t - R_s)/max_{t<=s} R_t for a percentage drawdown; ensure the inner index actually varies inside the inner max.",
      "source_path": "corrections/2605.17307/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Methodology, eq:md (Performance Metrics)` is corrected or justified.",
      "weakness_index": 2
    },
    {
      "evidence": "The numerical comparison rests on a single training seed per configuration (no seed-variance is reported anywhere), and the paper itself acknowledges in the Limitations that reward formulation, encoder, and constraints co-vary across configurations, so the LSTM_1 vs LSTM_2 contrast is not strictly ceteris paribus either (they share the cash setting but differ in policy structure only by design - which is fine - yet the noise floor from SAC stochasticity over 16 folds with 50 epochs is not characterised). 'Consistently improves' is too strong without seed-replicate variance or formal pairwise tests across folds.",
      "id": "weakness-4",
      "locator": "Discussion, RQ2; Empirical Results Sections 6.1-6.3",
      "required_update": "Run at least 3-5 independent seeds per fold per configuration and report mean +/- s.d. of IR2/MD/ASD differences between LSTM_1 and LSTM_2, or apply a paired test across folds. Soften 'consistently' to 'on average across the 16 folds' if multi-seed analysis is infeasible.",
      "source_path": "corrections/2605.17307/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Discussion, RQ2; Empirical Results Sections 6.1-6.3` is corrected or justified.",
      "weakness_index": 3
    },
    {
      "evidence": "The regime boundaries are chosen ex-post on the same data used to estimate strategy performance, which is a textbook in-sample regime classification. No formal statistical test (e.g., Markov regime-switching, structural-break test, or out-of-sample HMM) is used to identify regimes. Furthermore, no statistical inference is reported for the sub-period comparisons (only point estimates of IR2/IR3), so 'RL adds the most value during periods of elevated uncertainty' is a narrative inference from at most 5-7 years of data per regime per market.",
      "id": "weakness-5",
      "locator": "Section 7 Regime Analysis; Discussion RQ6",
      "required_update": "Either (i) pre-register regime boundaries using an out-of-sample procedure such as fitting an HMM/regime-switching model on the training window and applying labels to the test window, or (ii) frame the regime narrative explicitly as descriptive rather than inferential. Report HAC-robust mean-difference tests per sub-period.",
      "source_path": "corrections/2605.17307/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 7 Regime Analysis; Discussion RQ6` is corrected or justified.",
      "weakness_index": 4
    },
    {
      "evidence": "The reported compute requirement is substantial: about 14 hours per LSTM walk-forward cycle and 23 hours per Transformer cycle on an NVIDIA L4 GPU, with multiple markets, folds, and configurations. This raises the cost of independent replication even if code and restricted data were available.",
      "id": "weakness-6",
      "locator": "compute requirements and runnable smoke path",
      "required_update": "Document the hardware, expected runtime per training cycle, and a reduced smoke configuration or checkpoint path that lets reviewers validate the pipeline without rerunning the full training workload.",
      "source_path": null,
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "code",
      "verification_check": "Re-review should confirm compute requirements and a smaller validation path are documented.",
      "weakness_index": 5
    },
    {
      "evidence": "Constituent prices are obtained through yfinance, but the time-varying index membership data needed to address survivorship bias comes from Bloomberg Terminal Anywhere and is not released with the paper. This restricted/proprietary membership history is central to reconstructing the tradable universe.",
      "id": "weakness-7",
      "locator": "data availability and restricted inputs",
      "required_update": "Add a frozen data snapshot or a reproducible data-access appendix covering price series, historical index membership, data URLs, licenses, and restricted Bloomberg access constraints.",
      "source_path": null,
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "data",
      "verification_check": "Re-review should find data artifacts or access instructions sufficient to rebuild the reported tables.",
      "weakness_index": 6
    },
    {
      "evidence": "The paper uses the Soft Actor-Critic (SAC) algorithm as its core methodology but does not cite the original paper that introduced it, which is essential for establishing technical foundations.",
      "id": "weakness-8",
      "locator": "Soft Actor-Critic: Off-Policy Maximum Entropy Deep Reinforcement Learning with a Stochastic Actor (Haarnoja et al., 2018)",
      "required_update": "Add a bibliography entry for `Soft Actor-Critic: Off-Policy Maximum Entropy Deep Reinforcement Learning with a Stochastic Actor (Haarnoja et al., 2018)` and cite it where the affected method or claim is introduced, or explicitly justify its omission.",
      "source_path": null,
      "source_role": "citation",
      "status": "open",
      "target_kind": "bibliography",
      "verification_check": "Re-review should confirm the bibliography and citation context address this reference.",
      "weakness_index": 7
    },
    {
      "evidence": "IBKR's 0.05-0.35 bps figure cited is commission only and excludes the bid-ask spread, exchange fees, market impact, and (for foreign markets) FX costs. For a globally-allocated strategy holding 10-30 names in Nasdaq-100, Nikkei 225, and Euro Stoxx 50 with monthly rebalancing on small constituents, a realistic round-trip cost is closer to 5-15 bps. The paper acknowledges this as a limitation in the Conclusions but the headline claim that 2 bps reflects institutional reality is optimistic and is not stress-tested.",
      "id": "weakness-9",
      "locator": "Methodology, Section 5.5 / Table 6",
      "required_update": "Run a sensitivity analysis with 5, 10, and 20 bps per unit of turnover and report how IR2 ranks (especially LSTM_2's EURO STOXX 50 outperformance) hold up.",
      "source_path": "corrections/2605.17307/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Methodology, Section 5.5 / Table 6` is corrected or justified.",
      "weakness_index": 8
    },
    {
      "evidence": "Replacing SAC's default squashed-Gaussian policy with a Dirichlet introduces non-trivial issues for the standard SAC loss: (i) Dirichlet samples produced via standard PyTorch rsample use an implicit reparameterisation that has known higher-variance gradients than Gaussian rsample, and (ii) the SAC entropy term must be computed using the Dirichlet differential entropy on the simplex rather than the change-of-variables-corrected entropy used for tanh-squashed Gaussians. The paper does not describe these implementation details or cite a SAC-Dirichlet variant, so reproducibility and the validity of fixed alpha=0.2 are unclear.",
      "id": "weakness-10",
      "locator": "Methodology, Sections 5.4 Model Architecture and 5.2 Action Space",
      "required_update": "State explicitly which reparameterisation/log-prob is used for the Dirichlet, whether the entropy term in the SAC loss is the analytic Dirichlet differential entropy on the simplex, and how the temperature scale interacts with the Dirichlet's concentration parameters (which themselves act as an entropy regulariser).",
      "source_path": "corrections/2605.17307/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Methodology, Sections 5.4 Model Architecture and 5.2 Action Space` is corrected or justified.",
      "weakness_index": 9
    }
  ],
  "strengths": [
    "Long-horizon, out-of-sample evaluation framework spanning 23 years (2003–2026) with walk-forward optimization across 16 folds, closely simulating realistic deployment conditions and substantially reducing look-ahead bias.",
    "Novel hierarchical Dirichlet policy structure that explicitly separates the equity-cash allocation decision from individual stock selection, providing a principled mechanism to enforce full-investment constraints while preserving stochastic gradient compatibility.",
    "Multi-market evaluation across three economically distinct global indices with identical procedures enabling direct cross-market comparisons and revealing geographic diversification benefits in ensemble aggregation.",
    "Honest null-result reporting: the paper does not cherry-pick markets or metrics, explicitly acknowledges the failure to consistently beat buy-and-hold across all three markets, and cites Bailey & Lopez de Prado throughout to contextualize its own findings.",
    "Adaptive retraining mechanism with a statistically motivated threshold (median minus 0.5 std of recent validation Sharpe values) that avoids unnecessary retraining while responding to structural performance degradation.",
    "Comprehensive performance metric suite (ARC, ASD, MD, MLD, HHI, IR1, IR2, IR3, SR, alpha-regression) grounded in the quantitative finance literature and aligned with cited methodological best practices."
  ],
  "summary": "This paper evaluates Soft Actor-Critic (SAC) deep reinforcement learning for multi-asset portfolio management across three global equity indices (Nasdaq-100, Nikkei 225, Euro Stoxx 50) using a rigorous 23-year walk-forward framework with 16 out-of-sample folds, five model configurations, and adaptive retraining. The primary finding is a mixed one: risk-adjusted outperformance is observed on Euro Stoxx 50 but not consistently across all markets. Five specialist reviews converge on an incremental but genuinely useful empirical contribution that is undermined by several correctable statistical and reporting flaws. The most serious issues are: (1) approximately 60-75 hypothesis tests conducted at α=0.10 without any multiple-testing correction, with the EURO STOXX 50 alpha-regression results—which drive the 'partial confirmation' conclusion—being quantitatively consistent with chance under the global null; (2) directly contradictory significance claims between the abstract/discussion and Tables 7-8; (3) a mathematically incorrect Maximum Drawdown formula; (4) a single training seed per configuration, making the 'consistently improves' claim for the hierarchical Dirichlet policy unsupportable; and (5) a reproducibility score of 0.32 due to no public code and proprietary Bloomberg membership data. The missing citation of the core SAC paper (Haarnoja et al. 2018) is a notable bibliographic gap. These issues are addressable in a focused revision.",
  "weaknesses": [
    "Multiple hypothesis tests (~60–75 across Tables 7 and 8) conducted at α=0.10 with no family-wise error rate correction (Bonferroni, Holm, BH, or the deflated Sharpe ratio already cited by the paper); the EURO STOXX 50 alpha-regression p-values (0.012–0.042) and bootstrap Sharpe/IR2 results that drive the 'partial confirmation' narrative are consistent with chance inflation under the global null.",
    "Directly contradictory statistical language: the abstract and Discussion state that no strategy achieves statistically significant outperformance, while Tables 7–8 prominently bold multiple significant p-values for EURO STOXX 50 under both bootstrap and alpha-regression tests; the inconsistency is unresolved in the text.",
    "Maximum Drawdown formula (eq:md) is mathematically incorrect: the inner maximisation is over index t but the inner expression R_{i,T}−R_{i,s} is independent of t, making the inner max degenerate; the formula does not yield standard maximum drawdown.",
    "Single random seed per configuration throughout; no seed-variance is reported for any fold, configuration, or market, yet the paper claims the hierarchical policy 'consistently improves' risk-adjusted performance—a claim that cannot be established from a single stochastic trajectory per cell.",
    "Regime boundaries (post-GFC recovery 2009–2013, secular bull 2014–2019, COVID and rate-hike cycle 2020–2026) are defined ex-post on the same data used to evaluate strategy performance with no formal structural-break or regime-switching test; sub-period performance comparisons are presented without statistical inference.",
    "No source code, trained model weights, or public repository is provided for a custom SAC-Dirichlet implementation across five configurations, three markets, and 16 folds; full replication requires independent re-implementation of the complete pipeline.",
    "Time-varying index constituent membership data from Bloomberg Terminal Anywhere is proprietary and not released; survivorship-bias-free reconstruction of the tradable universe is not independently feasible, making the data pipeline partially irreproducible.",
    "The primary algorithm (Soft Actor-Critic, Haarnoja et al. 2018) is absent from the bibliography; foundational RL technical references for policy gradients (Williams 1992) and hierarchical reinforcement learning (Sutton et al. 1999) used to motivate the architectural choices are also missing.",
    "Transaction cost assumption of 2 bps excludes bid-ask spread, exchange fees, market impact, and FX costs; for globally allocated strategies on Nikkei 225 and Euro Stoxx 50 constituents a realistic round-trip is 5–15 bps; no sensitivity analysis tests whether the EURO STOXX 50 outperformance result survives more realistic cost assumptions.",
    "The SAC-Dirichlet implementation is underspecified: the reparameterisation used for Dirichlet rsample (implicit vs. explicit pathwise), the entropy term in the SAC objective (analytic Dirichlet differential entropy on the simplex vs. Gaussian approximation), and the interaction of the fixed temperature α=0.2 with Dirichlet concentration parameters—which themselves act as an entropy regulariser—are not described."
  ]
}
```

### novelty (`gemini-3-flash-preview`) — status: `pass`

```json
{
  "confidence": 0.9,
  "missing_prior_art": [],
  "novelty_score": 0.6,
  "related_work": [
    {
      "citation_key": "Liu_2025",
      "delta": "While Liu et al. (FinRL-Meta) provide a library for multi-environment DRL, this paper implements a specific unified evaluation framework across three distinct global equity markets (Nasdaq-100, Nikkei 225, Euro Stoxx 50) with identical walk-forward optimization and adaptive retraining procedures.",
      "relation": "builds_on",
      "title": "FinRL-Meta: A universe of near-real market environments for data-driven deep reinforcement learning in quantitative finance"
    },
    {
      "citation_key": "yang2020deep",
      "delta": "Yang et al. propose an ensemble of PPO, A2C, and DDPG; this study instead focuses on a single SAC-based agent with a hierarchical Dirichlet policy to manage cash vs. equity allocation separately from individual asset selection.",
      "relation": "competing",
      "title": "Deep reinforcement learning for automated stock trading: An ensemble strategy"
    },
    {
      "citation_key": "analytics2030031",
      "delta": "Millea employs a hierarchical agent to select among specialized sub-agents for single-asset trading; this work applies a hierarchical policy structure to the action space itself for multi-asset portfolio allocation.",
      "relation": "builds_on",
      "title": "Hierarchical Model-Based Deep Reinforcement Learning for Single-Asset Trading"
    },
    {
      "citation_key": "cheng2024multiagent",
      "delta": "Cheng et al. use a multi-agent approach where individual agents operate on separate assets; this study employs a single-agent framework that captures cross-asset relationships through a shared encoder and a hierarchical Dirichlet action space.",
      "relation": "competing",
      "title": "Multiagent-based deep reinforcement learning framework for multi-asset adaptive trading and portfolio management"
    },
    {
      "citation_key": "DE_MIGEUL",
      "delta": "This paper uses the 1/N benchmark established by DeMiguel et al. as a primary point of comparison to validate whether the RL agent's learned allocation adds value beyond naive diversification across multiple global indices.",
      "relation": "prior_art",
      "title": "Optimal Versus Naive Diversification: How Inefficient is the 1/N Portfolio Strategy?"
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
      "description": "The paper describes the SAC framework, model variants, and many hyperparameters, but does not provide source code, scripts, trained models, or a repository URL. Reproducing the reported tables would require independently reimplementing the full data pipeline, RL environment, training loop, and evaluation logic.",
      "severity": "critical"
    },
    {
      "area": "data",
      "description": "Constituent prices are obtained through yfinance, but the time-varying index membership data needed to address survivorship bias comes from Bloomberg Terminal Anywhere and is not released with the paper. This restricted/proprietary membership history is central to reconstructing the tradable universe.",
      "severity": "major"
    },
    {
      "area": "hyperparameters",
      "description": "Common SAC and environment parameters are reported, but full reproducibility still depends on details not specified in the paper, including random seeds, exact hyperparameter candidate grids, model-selection tie-breaks, initialization, and implementation-level preprocessing choices.",
      "severity": "major"
    },
    {
      "area": "compute",
      "description": "The reported compute requirement is substantial: about 14 hours per LSTM walk-forward cycle and 23 hours per Transformer cycle on an NVIDIA L4 GPU, with multiple markets, folds, and configurations. This raises the cost of independent replication even if code and restricted data were available.",
      "severity": "minor"
    },
    {
      "area": "evaluation",
      "description": "The walk-forward design, benchmark definitions, and significance tests are described, but exact generated portfolios, fold-level outputs, and test artifacts are not provided, making it difficult to verify table-level numerical results against an independent implementation.",
      "severity": "major"
    }
  ],
  "confidence": 0.86,
  "data_availability": "restricted",
  "data_url": null,
  "environment": {
    "dependencies": [
      "yfinance API",
      "Bloomberg Terminal Anywhere data access"
    ],
    "hardware": "Cloud-based G2-standard instance with NVIDIA L4 GPU (24GB VRAM) and 30GB system memory",
    "software": null
  },
  "reproducibility_score": 0.32
}
```

### summary (`claude-haiku-4-5-20251001`) — status: `pass`

```json
{
  "audience": "Quantitative finance practitioners, algorithmic traders, portfolio managers, machine learning researchers in computational finance, and academics investigating reinforcement learning applications to investment management and dynamic portfolio optimization",
  "key_contributions": [
    "Systematic empirical comparison of five different deep RL model configurations varying in reward formulation, policy structure (flat vs. hierarchical), portfolio constraints, and temporal encoders (LSTM vs. Transformer)",
    "Implementation of walk-forward optimization methodology with adaptive retraining across sixteen out-of-sample folds spanning 2003-2026, simulating realistic deployment scenarios",
    "Introduction of a novel hierarchical Dirichlet policy structure that separates equity-cash allocation decisions from individual stock selection",
    "Comprehensive multi-market evaluation framework applying identical procedures across three economically distinct global equity indices with direct cross-market comparisons",
    "Regime-dependent performance analysis demonstrating that RL strategies add greatest value during periods of elevated market uncertainty, with ensemble aggregation enhancing risk-adjusted returns through geographic diversification"
  ],
  "plain_language_summary": "This paper investigates whether an artificial intelligence system can learn to invest money better than traditional approaches. The researchers trained a deep learning algorithm called Soft Actor-Critic (SAC) to dynamically manage investment portfolios by deciding how much money to allocate to different stocks across three major global stock markets: the US (Nasdaq-100), Japan (Nikkei 225), and Europe (Euro Stoxx 50). The system learned from 23 years of historical data while accounting for real-world constraints like trading costs and the desire to maintain diversification.\n\nThe results reveal a mixed picture. In the European market, the RL strategies achieved statistically significant outperformance with superior risk-adjusted returns compared to simple buy-and-hold investing. However, when evaluated rigorously across all three markets using strict statistical tests, no single strategy consistently beat the straightforward approach of buying and holding the index. The analysis also uncovered important nuances: RL strategies proved most valuable during periods of high market volatility and uncertainty, and combining predictions across multiple markets improved overall performance, demonstrating the benefits of geographic diversification.\n\nOverall, the study shows that while reinforcement learning can learn reasonable investment strategies, simply introducing more complexity does not guarantee better results, and careful design of both the learning algorithm and evaluation procedures is essential for practical success in portfolio management.",
  "tldr": "A deep reinforcement learning framework using Soft Actor-Critic achieves competitive risk-adjusted portfolio performance in European markets but fails to consistently outperform buy-and-hold strategies across all global equity markets tested."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `pass`

```json
{
  "claims": [
    {
      "assessment": "incorrect",
      "claim": "Maximum Drawdown is defined as MD(T) = max_{s in [0,T]}(max_{t in [0,s]}(R_{i,T} - R_{i,s})) x 100%.",
      "evidence": "As written the inner expression uses R_{i,T} (a fixed terminal value) and R_{i,s} (the outer index), with no dependence on the inner index t, so the inner max is degenerate. The standard MD definition compares the running maximum of the equity/return curve up to s with the value at s (e.g., max_{t<=s}(R_t - R_s) where R denotes cumulative return). The formula as printed does not yield maximum drawdown and contains a transcription error in the subscripts.",
      "id": "C1",
      "location": "Methodology, eq:md (Performance Metrics)",
      "severity": "major",
      "suggested_fix": "Replace with MD = max_{0<=t<=s<=T} (R_t - R_s) (using cumulative log-returns or equity-curve values), or equivalently MD = max_{s} (max_{t<=s} R_t - R_s)/max_{t<=s} R_t for a percentage drawdown; ensure the inner index actually varies inside the inner max."
    },
    {
      "assessment": "partially_supported",
      "claim": "ARC = (prod_{t=1..N} (1+R_t))^{252/N} - 1 x 100%.",
      "evidence": "The intended quantity (annualised compounded return as a percentage) is standard, but the printed equation is malformed: '- 1 x 100%' parses as '- (1 x 100%)' rather than '(... - 1) x 100%'. The reader must infer the correct grouping.",
      "id": "C2",
      "location": "Methodology, eq:arc",
      "severity": "minor",
      "suggested_fix": "Rewrite as ARC = [(prod_t (1+R_t))^{252/N} - 1] x 100%."
    },
    {
      "assessment": "partially_supported",
      "claim": "Sharpe Ratio SR = (bar{R}/sigma_R) sqrt(252) measures risk-adjusted performance by evaluating excess return per unit of volatility.",
      "evidence": "The formula uses raw mean returns rather than excess returns over a risk-free rate, so the verbal description ('excess return per unit of total volatility') is inaccurate. With near-zero short rates over much of 2009-2021 the bias is small, but during the 2022-2026 rate-hike period this materially overstates risk-adjusted performance for all strategies. The same caveat applies to IR1, IR2, IR3 because they are functions of ARC and ASD without any risk-free deduction.",
      "id": "C3",
      "location": "Methodology, eq:sharpe",
      "severity": "minor",
      "suggested_fix": "Either subtract a proxy for the risk-free rate (e.g., 3-month T-bill or local equivalent) from bar{R}, or relabel SR as the 'Sharpe-like ratio of raw returns' and acknowledge that comparisons across periods with very different rate environments are affected."
    },
    {
      "assessment": "partially_supported",
      "claim": "The Soft Actor-Critic algorithm is used with a Dirichlet policy that outputs portfolio weights summing to one and is trained via experience replay with twin critics and soft target updates.",
      "evidence": "Replacing SAC's default squashed-Gaussian policy with a Dirichlet introduces non-trivial issues for the standard SAC loss: (i) Dirichlet samples produced via standard PyTorch rsample use an implicit reparameterisation that has known higher-variance gradients than Gaussian rsample, and (ii) the SAC entropy term must be computed using the Dirichlet differential entropy on the simplex rather than the change-of-variables-corrected entropy used for tanh-squashed Gaussians. The paper does not describe these implementation details or cite a SAC-Dirichlet variant, so reproducibility and the validity of fixed alpha=0.2 are unclear.",
      "id": "C4",
      "location": "Methodology, Sections 5.4 Model Architecture and 5.2 Action Space",
      "severity": "minor",
      "suggested_fix": "State explicitly which reparameterisation/log-prob is used for the Dirichlet, whether the entropy term in the SAC loss is the analytic Dirichlet differential entropy on the simplex, and how the temperature scale interacts with the Dirichlet's concentration parameters (which themselves act as an entropy regulariser)."
    },
    {
      "assessment": "partially_supported",
      "claim": "None of the reinforcement learning strategies achieve statistically significant outperformance relative to Buy & Hold under HAC-robust inference across all markets (central hypothesis only partially confirmed).",
      "evidence": "For mean-return differences the HAC p-values reported in Table 7 are indeed all >>0.10, supporting the claim. However, (a) the bootstrap test of Delta-Sharpe and Delta-IR2 for LSTM_2 on EURO STOXX 50 gives p-values 0.0719 and 0.0619 (bold in the table), so 'no strategy achieves statistical significance' is contradicted by the paper's own risk-adjusted bootstrap tests for at least one configuration; (b) the alpha-regression results in Table 8 report four EURO STOXX 50 strategies and two ensemble strategies that are 'significant' at 10%. The text alternately treats Section 6.4 results as fully non-significant and as evidence of abnormal returns, which is inconsistent.",
      "id": "C5",
      "location": "Abstract; Section 6.4 Statistical Significance; Discussion",
      "severity": "major",
      "suggested_fix": "Rewrite the abstract and Discussion to distinguish (i) mean-difference HAC tests (uniformly non-significant), (ii) bootstrap tests on Sharpe/IR2 (one EURO STOXX 50 strategy significant), and (iii) alpha-regression tests (several EURO STOXX 50 strategies significant). Use consistent language across sections."
    },
    {
      "assessment": "unsupported",
      "claim": "Statistical significance is evaluated at the 10% level for many strategy x market x metric combinations without multiple-testing correction.",
      "evidence": "Across Tables 7 and 8 the paper conducts roughly 5 strategies x 3 markets x 4-5 test statistics ~ 60-75 hypothesis tests, plus additional ensemble tests, all at alpha=0.10. Under a global null one would expect ~6-7 'significant' results purely by chance. The EURO STOXX 50 alpha results (3-4 significant p-values in the 0.012-0.042 range) are consistent with chance under such multiplicity, yet the paper interprets them as substantive abnormal returns and as the basis for the 'partial confirmation' of the central hypothesis. The Bailey/Lopez de Prado work cited elsewhere in the paper specifically warns against this pattern.",
      "id": "C6",
      "location": "Section 6.4 Statistical Significance; Tables 7 and 8",
      "severity": "major",
      "suggested_fix": "Apply a multiple-testing correction (Bonferroni, Holm, Benjamini-Hochberg, or the deflated Sharpe ratio of Bailey & Lopez de Prado, which is already cited in the literature review) and report adjusted p-values. Discuss whether the EURO STOXX 50 results survive adjustment."
    },
    {
      "assessment": "partially_supported",
      "claim": "The empirical analysis covers 2003-2026 daily and is evaluated via walk-forward optimization across sixteen out-of-sample folds.",
      "evidence": "With a 5-year training + 1-year validation window before the first test fold, the earliest possible test year starts in 2009; the body confirms 'trading commencing on 2009-04-06'. From 2009-04 to 2026-03 there are approximately 17 one-year test folds, but the abstract states 16. The off-by-one is likely due to the first/last partial fold but is not reconciled in the text; this is small but matters for the reproducibility of the reported sample size N used in HAC and bootstrap standard errors.",
      "id": "C7",
      "location": "Abstract; Methodology Section 5.6.1",
      "severity": "minor",
      "suggested_fix": "State precisely the start and end date of each of the 16 test folds and how partial-year boundaries are handled."
    },
    {
      "assessment": "partially_supported",
      "claim": "The hierarchical policy structure consistently improves risk-adjusted performance because LSTM_2 attains lower volatility and drawdown than LSTM_1 across all three markets (answer to RQ2).",
      "evidence": "The numerical comparison rests on a single training seed per configuration (no seed-variance is reported anywhere), and the paper itself acknowledges in the Limitations that reward formulation, encoder, and constraints co-vary across configurations, so the LSTM_1 vs LSTM_2 contrast is not strictly ceteris paribus either (they share the cash setting but differ in policy structure only by design - which is fine - yet the noise floor from SAC stochasticity over 16 folds with 50 epochs is not characterised). 'Consistently improves' is too strong without seed-replicate variance or formal pairwise tests across folds.",
      "id": "C8",
      "location": "Discussion, RQ2; Empirical Results Sections 6.1-6.3",
      "severity": "major",
      "suggested_fix": "Run at least 3-5 independent seeds per fold per configuration and report mean +/- s.d. of IR2/MD/ASD differences between LSTM_1 and LSTM_2, or apply a paired test across folds. Soften 'consistently' to 'on average across the 16 folds' if multi-seed analysis is infeasible."
    },
    {
      "assessment": "supported",
      "claim": "The validation Sharpe ratio for adaptive retraining is S_k = (bar{r}_k/sigma_k) sqrt(A) with A=252, computed from daily net portfolio returns.",
      "evidence": "The formula is internally consistent and the annualisation factor matches the 252-trading-day convention used throughout. The associated threshold theta_k = median(.) - 0.5 std(.) over up to the last m=5 validation values is a sensible heuristic, and the cold-start rule (always retrain if k<3) avoids a malformed threshold.",
      "id": "C9",
      "location": "Methodology Section 5.6.2 (eq:val_sharpe) and Adaptive Retraining Strategy",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "HHI_t = sum_i w_{i,t}^2 with minimum HHI_min_t = 1/N_t corresponding to an equal-weight allocation.",
      "evidence": "Standard result: on the simplex {w >=0, sum w=1}, sum w_i^2 is convex and minimised at the centroid w_i=1/N where it equals 1/N. The reward penalty (HHI - HHI_min) is therefore non-negative.",
      "id": "C10",
      "location": "Methodology, Reward Function",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Modified Information Ratio IR** = IR* x ARC x sign(ARC)/MD.",
      "evidence": "With IR* = ARC/ASD this simplifies to IR** = ARC^2 x sign(ARC) / (ASD x MD) = sign(ARC) x ARC^2 / (ASD x MD). The expression is well-defined only for MD > 0; when a strategy experiences no drawdown over the test window MD=0 and IR** is undefined or infinite. The paper does not state how this degenerate case is handled. Also, defining IR** as the 'most important' metric while using a single deterministic ranking from one seed amplifies sensitivity to the realised MD of one trajectory.",
      "id": "C11",
      "location": "Methodology, eq:ir-starstar",
      "severity": "minor",
      "suggested_fix": "Add a guard for MD->0 (e.g., floor MD at 1 trading day's volatility) and discuss the metric's sensitivity to a single tail draw of MD; consider reporting bootstrap confidence intervals on IR** instead of point estimates."
    },
    {
      "assessment": "partially_supported",
      "claim": "Transaction costs of 2 bps per unit of turnover are 'consistent with the lower bound of equity commissions available to institutional and high-volume traders on Interactive Brokers'.",
      "evidence": "IBKR's 0.05-0.35 bps figure cited is commission only and excludes the bid-ask spread, exchange fees, market impact, and (for foreign markets) FX costs. For a globally-allocated strategy holding 10-30 names in Nasdaq-100, Nikkei 225, and Euro Stoxx 50 with monthly rebalancing on small constituents, a realistic round-trip cost is closer to 5-15 bps. The paper acknowledges this as a limitation in the Conclusions but the headline claim that 2 bps reflects institutional reality is optimistic and is not stress-tested.",
      "id": "C12",
      "location": "Methodology, Section 5.5 / Table 6",
      "severity": "minor",
      "suggested_fix": "Run a sensitivity analysis with 5, 10, and 20 bps per unit of turnover and report how IR2 ranks (especially LSTM_2's EURO STOXX 50 outperformance) hold up."
    },
    {
      "assessment": "supported",
      "claim": "The Markov property is approximated by including a window of past observations in the state representation (60-day lookback).",
      "evidence": "Standard practice in deep RL on financial time series. The 60-day lookback is consistent with the cited literature (e.g., Fischer & Krauss 2018). The paper appropriately acknowledges this is an approximation.",
      "id": "C13",
      "location": "Theoretical Background, MDP section; Methodology State Representation; Table 6",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Sub-period regime analysis distinguishes post-GFC recovery (2009-2013), secular bull market (2014-2019), and COVID-19 plus rate-hike cycle (2020-2026), and shows RL adds the most value during elevated uncertainty.",
      "evidence": "The regime boundaries are chosen ex-post on the same data used to estimate strategy performance, which is a textbook in-sample regime classification. No formal statistical test (e.g., Markov regime-switching, structural-break test, or out-of-sample HMM) is used to identify regimes. Furthermore, no statistical inference is reported for the sub-period comparisons (only point estimates of IR2/IR3), so 'RL adds the most value during periods of elevated uncertainty' is a narrative inference from at most 5-7 years of data per regime per market.",
      "id": "C14",
      "location": "Section 7 Regime Analysis; Discussion RQ6",
      "severity": "major",
      "suggested_fix": "Either (i) pre-register regime boundaries using an out-of-sample procedure such as fitting an HMM/regime-switching model on the training window and applying labels to the test window, or (ii) frame the regime narrative explicitly as descriptive rather than inferential. Report HAC-robust mean-difference tests per sub-period."
    },
    {
      "assessment": "unsupported",
      "claim": "The Newey-West HAC estimator (cited as NEWEY_WEST) is used to obtain robust standard errors, but no bandwidth/lag truncation is reported.",
      "evidence": "Newey-West requires choosing a lag truncation parameter (often L ~ floor(4(T/100)^(2/9))), and its choice meaningfully affects p-values for long-horizon strategies. The paper does not state the bandwidth, kernel, or any pre-whitening, so the HAC inference cannot be replicated and its sensitivity to the lag choice is unknown.",
      "id": "C15",
      "location": "Section 6.4 Statistical Significance",
      "severity": "minor",
      "suggested_fix": "Report the bandwidth and kernel used in Newey-West, and show robustness of the headline conclusions to alternative bandwidths (e.g., Andrews 1991 automatic bandwidth)."
    },
    {
      "assessment": "partially_supported",
      "claim": "Stationary block bootstrap (cited as POLITIS) is used to construct empirical distributions of Sharpe and IR2 differences.",
      "evidence": "The procedure is appropriate for serially dependent return data, but the mean block length and number of bootstrap replications are not reported. Block-length choice (e.g., via Politis-White 2004) is critical for the validity of bootstrap p-values reported to four decimal places.",
      "id": "C16",
      "location": "Section 6.4 Statistical Significance",
      "severity": "minor",
      "suggested_fix": "Report expected block length, number of replications, and any pre-whitening used."
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

1. cartaetal9355141: author = {Carta, Salvatore M. and Consoli, Sergio and Piras, Luca and Podda, Alessandro Sebastian and Recupero, Diego Reforgiato}, title = {Explainable Machine Learning Exploiting News and Domain-Specific Lexicon for Stock Market Forecasting}, journal = {IEEE Access}, volume = {9}, pages = {30193--30205}, year = {2021}, publisher = {IEEE}, issn = {2169-3536}, doi = {10.1109/ACCESS.2021.3059960} doi:[10.1109/ACCESS.2021.3059960](https://doi.org/10.1109/ACCESS.2021.3059960) arXiv:[2021.30599](https://arxiv.org/abs/2021.30599)
2. michankow2022lstm: author = {Micha{\'n}k{\'o}w, Jakub and Sakowski, Pawe{\l} and {\'S}lepaczuk, Robert}, title = {{LSTM} in Algorithmic Investment Strategies on {BTC} and {S\&P500} Index}, journal = {Sensors}, volume = {22}, number = {3}, pages = {917}, year = {2022}, publisher = {MDPI}, issn = {1424-8220}, doi = {10.3390/s22030917} doi:[10.3390/s22030917](https://doi.org/10.3390/s22030917)
3. PairTrading: author = {Bui, Quynh and {\'S}lepaczuk, Robert}, title = {Applying {H}urst Exponent in pair trading strategies on {N}asdaq 100 index}, journal = {Physica A: Statistical Mechanics and its Applications}, volume = {592}, pages = {126784}, year = {2022}, publisher = {Elsevier}, issn = {0378-4371}, doi = {10.1016/j.physa.2021.126784} doi:[10.1016/j.physa.2021.126784](https://doi.org/10.1016/j.physa.2021.126784) arXiv:[2021.12678](https://arxiv.org/abs/2021.12678)
4. Markowitz_1952: author = {Markowitz, Harry}, title = {Portfolio Selection}, journal = {The Journal of Finance}, volume = {7}, number = {1}, pages = {77--91}, year = {1952}, publisher = {American Finance Association; Wiley}, issn = {0022-1082}, doi = {10.1111/j.1540-6261.1952.tb01525.x} doi:[10.1111/j.1540-6261.1952.tb01525.x](https://doi.org/10.1111/j.1540-6261.1952.tb01525.x) arXiv:[6261.1952](https://arxiv.org/abs/6261.1952)
5. Black_Literman: author = {Black, Fischer and Litterman, Robert}, title = {Global Portfolio Optimization}, journal = {Financial Analysts Journal}, volume = {48}, number = {5}, pages = {28--43}, year = {1992}, publisher = {CFA Institute; Taylor \& Francis}, issn = {0015-198X}, doi = {10.2469/faj.v48.n5.28} doi:[10.2469/faj.v48.n5.28](https://doi.org/10.2469/faj.v48.n5.28)
6. slusarczyk2025optimal: author = {{\'S}lusarczyk, Damian and {\'S}lepaczuk, Robert}, title = {Optimal {M}arkowitz portfolio using returns forecasted with time series and machine learning models}, journal = {Journal of Big Data}, volume = {12}, number = {1}, pages = {127}, year = {2025}, publisher = {Springer}, issn = {2196-1115}, doi = {10.1186/s40537-025-01164-z} doi:[10.1186/s40537-025-01164-z](https://doi.org/10.1186/s40537-025-01164-z)
7. Kim2003: author = {Kim, Kyoung-jae}, title = {Financial time series forecasting using support vector machines}, journal = {Neurocomputing}, volume = {55}, number = {1--2}, pages = {307--319}, year = {2003}, publisher = {Elsevier}, issn = {0925-2312}, doi = {10.1016/S0925-2312(03)00372-2} doi:[10.1016/S0925-2312(03)00372-2](https://doi.org/10.1016/S0925-2312(03)00372-2)
8. Khaidem2016: author = {Khaidem, Luckyson and Saha, Snehanshu and Dey, Sudeepa Roy}, title = {Predicting the direction of stock market prices using random forest}, journal = {arXiv preprint arXiv:1605.00003}, year = {2016}, eprint = {1605.00003}, archivePrefix = {arXiv}, primaryClass = {cs.LG}, doi = {10.48550/arXiv.1605.00003} doi:[10.48550/arXiv.1605.00003](https://doi.org/10.48550/arXiv.1605.00003) arXiv:[1605.00003](https://arxiv.org/abs/1605.00003)
9. Grudniewicz_Slepaczuk_2023: author = {Grudniewicz, Jan and {\'S}lepaczuk, Robert}, title = {Application of machine learning in algorithmic investment strategies on global stock markets}, journal = {Research in International Business and Finance}, volume = {66}, pages = {102052}, year = {2023}, publisher = {Elsevier}, issn = {0275-5319}, doi = {10.1016/j.ribaf.2023.102052} doi:[10.1016/j.ribaf.2023.102052](https://doi.org/10.1016/j.ribaf.2023.102052) arXiv:[2023.10205](https://arxiv.org/abs/2023.10205)
10. Bailey2014: author = {Bailey, David H. and Borwein, Jonathan M. and {L\'opez de Prado}, Marcos and Zhu, Qiji Jim}, title = {The probability of backtest overfitting}, journal = {The Journal of Computational Finance}, volume = {20}, number = {4}, pages = {39--69}, year = {2017}, publisher = {Infopro Digital Risk}, issn = {1460-1559}, doi = {10.21314/JCF.2016.322} doi:[10.21314/JCF.2016.322](https://doi.org/10.21314/JCF.2016.322)
11. LopezDePrado2018: author = {{L\'opez de Prado}, Marcos}, title = {The 10 reasons most machine learning funds fail}, journal = {The Journal of Portfolio Management}, volume = {44}, number = {6}, pages = {120--133}, year = {2018}, publisher = {Portfolio Management Research}, issn = {0095-4918}, doi = {10.3905/jpm.2018.44.6.120} doi:[10.3905/jpm.2018.44.6.120](https://doi.org/10.3905/jpm.2018.44.6.120)
12. Giles2001: author = {Lin, Yu-Fei and Huang, Tzu-Ming and Chung, Wei-Ho and Ueng, Yeong-Luh}, title = {Forecasting Fluctuations in the Financial Index Using a Recurrent Neural Network Based on Price Features}, journal = {IEEE Transactions on Emerging Topics in Computational Intelligence}, volume = {5}, number = {5}, pages = {780--791}, year = {2021}, publisher = {IEEE}, issn = {2471-285X}, doi = {10.1109/TETCI.2020.2971218} doi:[10.1109/TETCI.2020.2971218](https://doi.org/10.1109/TETCI.2020.2971218) arXiv:[2020.29712](https://arxiv.org/abs/2020.29712)
13. Bieganowski_Slepaczuk_2024: author = {Bieganowski, Bartosz and {\'S}lepaczuk, Robert}, title = {Supervised autoencoder {MLP} for financial time series forecasting}, journal = {Journal of Big Data}, volume = {12}, number = {1}, pages = {207}, year = {2025}, publisher = {Springer}, issn = {2196-1115}, doi = {10.1186/s40537-025-01267-7} doi:[10.1186/s40537-025-01267-7](https://doi.org/10.1186/s40537-025-01267-7)
14. Fischer2018: author = {Fischer, Thomas and Krauss, Christopher}, title = {Deep learning with long short-term memory networks for financial market predictions}, journal = {European Journal of Operational Research}, volume = {270}, number = {2}, pages = {654--669}, year = {2018}, publisher = {Elsevier}, issn = {0377-2217}, doi = {10.1016/j.ejor.2017.11.054} doi:[10.1016/j.ejor.2017.11.054](https://doi.org/10.1016/j.ejor.2017.11.054)
15. Krynska_Slepaczuk_2022: author = {Krynska, Katarzyna and {\'S}lepaczuk, Robert}, title = {Daily and intraday application of various architectures of the {LSTM} model in algorithmic investment strategies on {B}itcoin and the {S\&P} 500 Index}, journal = {SSRN Electronic Journal}, year = {2023}, publisher = {Elsevier}, note = {Available at SSRN: 4628806}, doi = {10.2139/ssrn.4628806} doi:[10.2139/ssrn.4628806](https://doi.org/10.2139/ssrn.4628806)
16. Kashif_Slepaczuk_2024: author = {Kashif, Kamil and {\'S}lepaczuk, Robert}, title = {{LSTM-ARIMA} as a hybrid approach in algorithmic investment strategies}, journal = {Knowledge-Based Systems}, volume = {320}, pages = {113563}, year = {2025}, publisher = {Elsevier}, issn = {0950-7051}, doi = {10.1016/j.knosys.2025.113563} doi:[10.1016/j.knosys.2025.113563](https://doi.org/10.1016/j.knosys.2025.113563) arXiv:[2025.11356](https://arxiv.org/abs/2025.11356)
17. Stefaniuk_Slepaczuk_2025: author = {Stefaniuk, Filip and {\'S}lepaczuk, Robert}, title = {Informer in algorithmic investment strategies on high frequency bitcoin data}, journal = {arXiv preprint arXiv:2503.18096}, year = {2025}, eprint = {2503.18096}, archivePrefix = {arXiv}, primaryClass = {q-fin.TR}, doi = {10.48550/arXiv.2503.18096} doi:[10.48550/arXiv.2503.18096](https://doi.org/10.48550/arXiv.2503.18096) arXiv:[2503.18096](https://arxiv.org/abs/2503.18096)
18. Hambly_2023: author = {Hambly, Ben and Xu, Renyuan and Yang, Huining}, title = {Recent advances in reinforcement learning in finance}, journal = {Mathematical Finance}, volume = {33}, number = {3}, pages = {437--503}, year = {2023}, publisher = {Wiley}, issn = {0960-1627}, doi = {10.1111/mafi.12382} doi:[10.1111/mafi.12382](https://doi.org/10.1111/mafi.12382)
19. MOODY: author = {Moody, John and Saffell, Matthew}, title = {Learning to trade via direct reinforcement}, journal = {IEEE Transactions on Neural Networks}, volume = {12}, number = {4}, pages = {875--889}, year = {2001}, publisher = {IEEE}, issn = {1045-9227}, doi = {10.1109/72.935097} doi:[10.1109/72.935097](https://doi.org/10.1109/72.935097)
20. Deng2016: author = {Deng, Yue and Bao, Feng and Kong, Youyong and Ren, Zhiquan and Dai, Qionghai}, title = {Deep Direct Reinforcement Learning for Financial Signal Representation and Trading}, journal = {IEEE Transactions on Neural Networks and Learning Systems}, volume = {28}, number = {3}, pages = {653--664}, year = {2017}, publisher = {IEEE}, issn = {2162-237X}, doi = {10.1109/TNNLS.2016.2522401} doi:[10.1109/TNNLS.2016.2522401](https://doi.org/10.1109/TNNLS.2016.2522401) arXiv:[2016.25224](https://arxiv.org/abs/2016.25224)
21. bracha2025application: author = {Bracha, Zofia and Sakowski, Pawe{\l} and Micha{\'n}k{\'o}w, Jakub}, title = {Application of Deep Reinforcement Learning to At-the-Money {S\&P} 500 Options Hedging}, journal = {arXiv preprint arXiv:2510.09247}, year = {2025}, eprint = {2510.09247}, archivePrefix = {arXiv}, primaryClass = {q-fin.TR}, doi = {10.48550/arXiv.2510.09247} doi:[10.48550/arXiv.2510.09247](https://doi.org/10.48550/arXiv.2510.09247) arXiv:[2510.09247](https://arxiv.org/abs/2510.09247)
22. Meng2026: author = {Zhang, Haoran and Li, Xiaofei and Wan, Tianjiao and Du, Junjie}, title = {Deep Reinforcement Learning for Financial Trading: Enhanced by Cluster Embedding and Zero-Shot Prediction}, journal = {Symmetry}, volume = {18}, number = {1}, pages = {112}, year = {2026}, publisher = {MDPI}, issn = {2073-8994}, doi = {10.3390/sym18010112} doi:[10.3390/sym18010112](https://doi.org/10.3390/sym18010112)
23. Liu_2025: author = {Liu, Xiao-Yang and Rui, Jingyang and Gao, Jiechao and Yang, Liuqing and Yang, Hongyang and Wang, Zhaoran and Wang, Christina Dan and Guo, Jian}, title = {{FinRL-Meta}: A universe of near-real market environments for data-driven deep reinforcement learning in quantitative finance}, journal = {arXiv preprint arXiv:2112.06753}, year = {2021}, eprint = {2112.06753}, archivePrefix = {arXiv}, primaryClass = {q-fin.TR}, doi = {10.48550/arXiv.2112.06753} doi:[10.48550/arXiv.2112.06753](https://doi.org/10.48550/arXiv.2112.06753) arXiv:[2112.06753](https://arxiv.org/abs/2112.06753)
24. Buehler_2019: author = {Buehler, Hans and Gonon, Lukas and Teichmann, Josef and Wood, Ben}, title = {Deep hedging}, journal = {Quantitative Finance}, volume = {19}, number = {8}, pages = {1271--1291}, year = {2019}, publisher = {Taylor \& Francis}, issn = {1469-7688}, doi = {10.1080/14697688.2019.1571683} doi:[10.1080/14697688.2019.1571683](https://doi.org/10.1080/14697688.2019.1571683) arXiv:[2019.15716](https://arxiv.org/abs/2019.15716)
25. maringer2012regime: author = {Maringer, Dietmar and Ramtohul, Tikesh}, title = {Regime-switching recurrent reinforcement learning for investment decision making}, journal = {Computational Management Science}, volume = {9}, number = {1}, pages = {89--107}, year = {2012}, publisher = {Springer}, issn = {1619-697X}, doi = {10.1007/s10287-011-0131-1} doi:[10.1007/s10287-011-0131-1](https://doi.org/10.1007/s10287-011-0131-1)
26. Zhang_2020: author = {Du, Jiayi and Jin, Muyang and Kolm, Petter N. and Ritter, Gordon and Wang, Yixuan and Zhang, Bofei}, title = {Deep reinforcement learning for option replication and hedging}, journal = {The Journal of Financial Data Science}, volume = {2}, number = {4}, pages = {44--57}, year = {2020}, publisher = {Portfolio Management Research}, issn = {2640-3943}, doi = {10.3905/jfds.2020.1.045} doi:[10.3905/jfds.2020.1.045](https://doi.org/10.3905/jfds.2020.1.045)
27. kabbani2022deep: author = {Kabbani, Taylan and Duman, Ekrem}, title = {Deep reinforcement learning approach for trading automation in the stock market}, journal = {IEEE Access}, volume = {10}, pages = {93564--93574}, year = {2022}, publisher = {IEEE}, issn = {2169-3536}, doi = {10.1109/ACCESS.2022.3203697} doi:[10.1109/ACCESS.2022.3203697](https://doi.org/10.1109/ACCESS.2022.3203697) arXiv:[2022.32036](https://arxiv.org/abs/2022.32036)
28. rani2025deep: author = {Rani, Ishta and Gandhi, Hina and Kumar, Ramesh and Marannan, Nithya and Kim, Na Kyung and Kumar, Tejaswini}, title = {Deep Reinforcement Learning for High-Frequency Trading with Market Impact Modeling}, booktitle = {2025 International Conference on Sustainability, Innovation \& Technology (ICSIT)}, pages = {1--6}, year = {2025}, publisher = {IEEE}, doi = {10.1109/ICSIT65336.2025.11293906} doi:[10.1109/ICSIT65336.2025.11293906](https://doi.org/10.1109/ICSIT65336.2025.11293906) arXiv:[2025.11293](https://arxiv.org/abs/2025.11293)
29. yang2020deep: author = {Yang, Hongyang and Liu, Xiao-Yang and Zhong, Shan and Walid, Anwar}, title = {Deep reinforcement learning for automated stock trading: An ensemble strategy}, booktitle = {Proceedings of the First ACM International Conference on AI in Finance (ICAIF '20)}, pages = {1--8}, year = {2020}, publisher = {Association for Computing Machinery}, address = {New York, NY, USA}, doi = {10.1145/3383455.3422540} doi:[10.1145/3383455.3422540](https://doi.org/10.1145/3383455.3422540)
30. Ohyun2025: author = {Enkhsaikhan, Bayaraa and Jo, Ohyun}, title = {Risk-Constrained Reinforcement Learning With Augmented {L}agrangian Multiplier for Portfolio Optimization}, journal = {IEEE Transactions on Big Data}, volume = {11}, number = {5}, pages = {2489--2502}, year = {2025}, publisher = {IEEE}, issn = {2332-7790}, doi = {10.1109/TBDATA.2025.3533905} doi:[10.1109/TBDATA.2025.3533905](https://doi.org/10.1109/TBDATA.2025.3533905) arXiv:[2025.35339](https://arxiv.org/abs/2025.35339)
31. park2022portfolio: author = {Tamuly, Adrika and Bhutani, Gariman and Sukriti}, title = {Portfolio Optimization using Deep Reinforcement Learning}, booktitle = {2024 IEEE 5th India Council International Subsections Conference (INDISCON)}, pages = {1--6}, year = {2024}, publisher = {IEEE}, address = {Piscataway, NJ, USA}, doi = {10.1109/INDISCON62179.2024.10744403} doi:[10.1109/INDISCON62179.2024.10744403](https://doi.org/10.1109/INDISCON62179.2024.10744403) arXiv:[2024.10744](https://arxiv.org/abs/2024.10744)
32. SOLEYMANI2020113456: author = {Soleymani, Farzan and Paquet, Eric}, title = {Financial portfolio optimization with online deep reinforcement learning and restricted stacked autoencoder---{D}eep{B}reath}, journal = {Expert Systems with Applications}, volume = {156}, pages = {113456}, year = {2020}, publisher = {Elsevier}, issn = {0957-4174}, doi = {10.1016/j.eswa.2020.113456} doi:[10.1016/j.eswa.2020.113456](https://doi.org/10.1016/j.eswa.2020.113456) arXiv:[2020.11345](https://arxiv.org/abs/2020.11345)
33. JIANG2024101016: author = {Jiang, Yifu and Olmo, Jose and Atwi, Majed}, title = {Deep reinforcement learning for portfolio selection}, journal = {Global Finance Journal}, volume = {62}, pages = {101016}, year = {2024}, publisher = {Elsevier}, issn = {1044-0283}, doi = {10.1016/j.gfj.2024.101016} doi:[10.1016/j.gfj.2024.101016](https://doi.org/10.1016/j.gfj.2024.101016) arXiv:[2024.10101](https://arxiv.org/abs/2024.10101)
34. sterling2026deep: author = {Sterling, Helena J. and Thorne, Marcus V.}, title = {Deep Reinforcement Learning for Dynamic Portfolio Optimization in Financial Markets}, journal = {International Journal of Artificial Intelligence Research}, volume = {1}, number = {1}, year = {2026}, publisher = {ISI Press}
35. cheng2024multiagent: author = {Cheng, Li-Chen and Sun, Jian-Shiou}, title = {Multiagent-based deep reinforcement learning framework for multi-asset adaptive trading and portfolio management}, journal = {Neurocomputing}, volume = {594}, pages = {127800}, year = {2024}, publisher = {Elsevier}, issn = {0925-2312}, doi = {10.1016/j.neucom.2024.127800} doi:[10.1016/j.neucom.2024.127800](https://doi.org/10.1016/j.neucom.2024.127800) arXiv:[2024.12780](https://arxiv.org/abs/2024.12780)
36. analytics2030031: author = {Millea, Adrian}, title = {Hierarchical Model-Based Deep Reinforcement Learning for Single-Asset Trading}, journal = {Analytics}, volume = {2}, number = {3}, pages = {560--576}, year = {2023}, publisher = {MDPI}, issn = {2813-2203}, doi = {10.3390/analytics2030031} doi:[10.3390/analytics2030031](https://doi.org/10.3390/analytics2030031)
37. jrfm16030201: author = {Hao, Zheng and Zhang, Haowei and Zhang, Yipu}, title = {Stock Portfolio Management by Using Fuzzy Ensemble Deep Reinforcement Learning Algorithm}, journal = {Journal of Risk and Financial Management}, volume = {16}, number = {3}, pages = {201}, year = {2023}, publisher = {MDPI}, issn = {1911-8074}, doi = {10.3390/jrfm16030201} doi:[10.3390/jrfm16030201](https://doi.org/10.3390/jrfm16030201)
38. shavandi2022multi: author = {Shavandi, Ali and Khedmati, Majid}, title = {A multi-agent deep reinforcement learning framework for algorithmic trading in financial markets}, journal = {Expert Systems with Applications}, volume = {208}, pages = {118124}, year = {2022}, publisher = {Elsevier}, issn = {0957-4174}, doi = {10.1016/j.eswa.2022.118124} doi:[10.1016/j.eswa.2022.118124](https://doi.org/10.1016/j.eswa.2022.118124) arXiv:[2022.11812](https://arxiv.org/abs/2022.11812)
39. wu2020adaptive: author = {Wu, Xing and Chen, Haolei and Wang, Jianjia and Troiano, Luigi and Loia, Vincenzo and Fujita, Hamido}, title = {Adaptive stock trading strategies with deep reinforcement learning methods}, journal = {Information Sciences}, volume = {538}, pages = {142--158}, year = {2020}, publisher = {Elsevier}, issn = {0020-0255}, doi = {10.1016/j.ins.2020.05.066} doi:[10.1016/j.ins.2020.05.066](https://doi.org/10.1016/j.ins.2020.05.066)
40. mnih2015human: author = {Mnih, Volodymyr and Kavukcuoglu, Koray and Silver, David and Rusu, Andrei A. and Veness, Joel and Bellemare, Marc G. and Graves, Alex and Riedmiller, Martin and Fidjeland, Andreas K. and Ostrovski, Georg and others}, title = {Human-level control through deep reinforcement learning}, journal = {Nature}, volume = {518}, number = {7540}, pages = {529--533}, year = {2015}, publisher = {Nature Publishing Group}, issn = {0028-0836}, doi = {10.1038/nature14236} doi:[10.1038/nature14236](https://doi.org/10.1038/nature14236)
41. schulman2017proximal: author = {Schulman, John and Wolski, Filip and Dhariwal, Prafulla and Radford, Alec and Klimov, Oleg}, title = {Proximal policy optimization algorithms}, journal = {arXiv preprint arXiv:1707.06347}, year = {2017}, eprint = {1707.06347}, archivePrefix = {arXiv}, primaryClass = {cs.LG}, doi = {10.48550/arXiv.1707.06347} doi:[10.48550/arXiv.1707.06347](https://doi.org/10.48550/arXiv.1707.06347) arXiv:[1707.06347](https://arxiv.org/abs/1707.06347)
42. lopez2025enhancing: author = {{L\'opez de Prado}, Marcos and Simonian, Joseph and Fabozzi, Francesco A. and Fabozzi, Frank J.}, title = {Enhancing {M}arkowitz's portfolio selection paradigm with machine learning}, journal = {Annals of Operations Research}, volume = {346}, number = {1}, pages = {319--340}, year = {2025}, publisher = {Springer}, issn = {0254-5330}, doi = {10.1007/s10479-024-06257-1} doi:[10.1007/s10479-024-06257-1](https://doi.org/10.1007/s10479-024-06257-1)
43. chaweewanchon2022markowitz: author = {Chaweewanchon, Apichat and Chaysiri, Rujira}, title = {{M}arkowitz mean-variance portfolio optimization with predictive stock selection using machine learning}, journal = {International Journal of Financial Studies}, volume = {10}, number = {3}, pages = {64}, year = {2022}, publisher = {MDPI}, issn = {2227-7072}, doi = {10.3390/ijfs10030064} doi:[10.3390/ijfs10030064](https://doi.org/10.3390/ijfs10030064)
44. NEWEY_WEST: author = {Newey, Whitney K. and West, Kenneth D.}, title = {A Simple, Positive Semi-Definite, Heteroskedasticity and Autocorrelation Consistent Covariance Matrix}, journal = {Econometrica}, volume = {55}, number = {3}, pages = {703--708}, year = {1987}, publisher = {Wiley; Econometric Society}, issn = {0012-9682}, doi = {10.2307/1913610} doi:[10.2307/1913610](https://doi.org/10.2307/1913610)
45. POLITIS: author = {Politis, Dimitris N. and Romano, Joseph P.}, title = {The Stationary Bootstrap}, journal = {Journal of the American Statistical Association}, volume = {89}, number = {428}, pages = {1303--1313}, year = {1994}, publisher = {Taylor \& Francis}, issn = {0162-1459}, doi = {10.1080/01621459.1994.10476870} doi:[10.1080/01621459.1994.10476870](https://doi.org/10.1080/01621459.1994.10476870) arXiv:[1994.10476](https://arxiv.org/abs/1994.10476)
46. DE_MIGEUL: author = {DeMiguel, Victor and Garlappi, Lorenzo and Uppal, Raman}, title = {Optimal Versus Naive Diversification: How Inefficient is the 1/{N} Portfolio Strategy?}, journal = {The Review of Financial Studies}, volume = {22}, number = {5}, pages = {1915--1953}, year = {2009}, publisher = {Oxford University Press}, issn = {0893-9454}, doi = {10.1093/rfs/hhm075} doi:[10.1093/rfs/hhm075](https://doi.org/10.1093/rfs/hhm075)
47. Ding2025: author = {Kabir, Md R. and Bhadra, Dipayan and Ridoy, Moinul and Milanova, Mariofanna}, title = {{LSTM--Transformer}-Based Robust Hybrid Deep Learning Model for Financial Time Series Forecasting}, journal = {Sci}, volume = {7}, number = {1}, pages = {7}, year = {2025}, publisher = {MDPI}, issn = {2413-4155}, doi = {10.3390/sci7010007} doi:[10.3390/sci7010007](https://doi.org/10.3390/sci7010007)

