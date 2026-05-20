# Deep Reinforcement Learning Framework for Diversified Portfolio Management Across Global Equity Markets

GrokRxiv review of [arXiv:2605.17307](https://arxiv.org/abs/2605.17307) · `q-fin.PM`

## TL;DR

This paper presents a Soft Actor-Critic (SAC) framework for multi-asset portfolio management evaluated across three global equity indices (Nasdaq-100, Nikkei 225, Euro Stoxx 50) over a 23-year walk-forward horizon. Core innovations include a hierarchical Dirichlet policy decoupling equity-cash from asset-level allocation, an adaptive retraining heuristic, and regime-conditioned performance decomposition. Specialist reviews converge on a picture of solid methodological ambition—rigorous HAC and block-bootstrap inference, survivorship-bias correction, systematic ablations—offset by incremental novelty (score 0.65), one outright incorrect performance-metric formula, and severely inadequate reproducibility (score 0.28) stemming from absent code, restricted Bloomberg data, and underspecified hyperparameters. The foundational SAC citation is missing from the bibliography. The paper makes a genuine contribution as the first systematic multi-market RL portfolio study with identical evaluation procedures, but requires significant revisions before publication.

_Recommendation_: **Major revision** · _Confidence_: 82%

## Strengths

- First systematic multi-market RL portfolio comparison with identical evaluation procedures across U.S., Asian, and European indices, enabling direct cross-regional benchmarking absent in prior single-market studies.
- Hierarchical Dirichlet policy architecture is mathematically well-motivated: factoring the action distribution into equity-cash gating and per-asset Dirichlet is internally consistent and guarantees budget and non-negativity constraints by construction.
- Rigorous statistical inference employing both Newey-West HAC robust tests and stationary block bootstrap for Sharpe and IR2 differences; the distinction between mean-return tests (Table 7) and Jensen's alpha regression (Table 8) reflects methodological care.
- Long 23-year out-of-sample evaluation spanning post-GFC recovery, secular bull market, and COVID-19 shock provides meaningful regime-conditional performance attribution.
- Survivorship-bias correction via time-varying Bloomberg index membership reconstruction is a commendable and often-omitted step in financial ML backtests.
- Systematic ablation across five configuration axes (reward formulation, policy structure, cash constraint, encoder type, top-k selection) enables structured hypothesis testing.

## Weaknesses

- Reproducibility is critically deficient: no source code or repository is provided, Bloomberg membership data are proprietary and unshared, random seeds and exact hyperparameter grids are not specified, fold calendars are absent, and compute costs (~14–23 GPU-hours per fold) preclude independent replication without released checkpoints (reproducibility score 0.28).
- The Maximum Drawdown formula (eq:md) is mathematically incorrect: the inner maximization over t in [0,s] is degenerate because the argument (R_{i,T}−R_{i,s}) does not depend on t; additionally, the unexplained asset index i conflates a portfolio-level metric with an asset-level one.
- The foundational SAC paper (Haarnoja et al., 2018) is cited in text as [@Haarnoja2018] but is absent from the provided bibliography, and the seminal multi-asset DRL portfolio paper (Jiang et al., 2017) is also missing.
- Novelty is incremental (score 0.65): the hierarchical Dirichlet policy and adaptive retraining are the paper's main methodological contributions, but neither is validated by a single-factor ablation that holds all other design choices constant, leaving causal attribution unsubstantiated.
- The fixed entropy coefficient alpha=0.2 is asserted to be preferable to automatic tuning due to instability across folds, but no supporting diagnostics, fold-level traces, or sensitivity analysis over alternative alpha values are reported.
- The abstract conflates two distinct statistical tests: the non-significant mean-return difference (Table 7, HAC) and the significant Jensen's alpha in Euro Stoxx 50 (Table 8, HAC regression), which test different null hypotheses and cannot be summarized as a single 'only partially confirmed' verdict without clarification of beta≠1 implications.
- The transaction cost justification conflates bps-per-share (IBKR tiered pricing) with bps-per-dollar-of-notional, rendering the claimed consistency between 2 bps turnover cost and IBKR schedule dimensionally invalid.
- Non-standard performance metrics IR2 and IR3 lack dimensional justification; IR3 (ARC^3/(ASD·MD·MLD)) is particularly susceptible to outliers and should be clearly labeled as a heuristic rather than presented alongside established measures.

## Revision Targets

- [ ] **Experiment configuration**
  - Location: `boundaries/calendars` at `experiment configuration`
  - Evidence: Core hyperparameters are tabulated, but several reproducibility-critical choices remain underspecified, including random seeds, exact candidate grids for model selection, per-configuration concentration penalties and top-k choices, initialization, optimizer details beyond learning rates, and stopping-selection rules in implementation form.
  - Required change: Publish the exact experiment configuration: random seeds, candidate grids, fold boundaries/calendars, initialization policy, package versions, top-k choices, and penalty settings.
  - Verification: Re-review should confirm exact seeds, grids, folds, package versions, and configuration choices are specified.
- [ ] **Manuscript: Section 5.8, eq. eq:md**
  - Location: `corrections/2605.17307/paper.tex` at `Section 5.8, eq. eq:md`
  - Evidence: As written, the inner argument (R_{i,T} - R_{i,s}) is independent of t, so the inner max over t in [0,s] is degenerate. Moreover, the index i is unexplained (the metric is computed on the portfolio equity curve, not an asset i), and the standard peak-to-trough drawdown is max_{t<=s}(P_t - P_s)/P_t (or equivalently 1 - P_s/max_{t<=s} P_t). The current formula does not capture the peak-to-trough loss it is meant to measure.
  - Required change: Replace with the standard definition MD = max_{0<=t<=s<=T} (V_t - V_s)/V_t, where V_t is the portfolio value, and remove the spurious asset index i and inner max over t that does not appear in the argument.
  - Verification: Re-review should confirm `Section 5.8, eq. eq:md` is corrected or justified.
- [ ] **Bibliography: Soft Actor-Critic: Off-Policy Maximum Entropy Deep Reinforcement Learning with a Stochastic A...**
  - Location: bibliography entry: `Soft Actor-Critic: Off-Policy Maximum Entropy Deep Reinforcement Learning with a Stochastic Actor (Haarnoja et al., 2...`
  - Evidence: The paper uses Soft Actor-Critic (SAC) as its core algorithm and cites it in the text as [@Haarnoja2018], but the foundational paper is missing from the provided bibliography.
  - Required change: Add a bibliography entry for `Soft Actor-Critic: Off-Policy Maximum Entropy Deep Reinforcement Learning with a Stochastic Actor (Haarnoja et al., 2018)` and cite it where the affected method or claim is introduced, or explicitly justify its omission.
  - Verification: Re-review should confirm the bibliography and citation context address this reference.
- [ ] **Manuscript: Sections 5.2-5.4; Section 6, RQ2**
  - Location: `corrections/2605.17307/paper.tex` at `Sections 5.2-5.4; Section 6, RQ2`
  - Evidence: Mathematically, factoring an action distribution as P(w_eq, w_c) * P(w_1..w_N | w_eq) is well-defined and equivalent to a constrained Dirichlet on the joint simplex. Empirically, the paper reports that LSTM_2 has lower ASD and MD than LSTM_1 on the three markets. However, the paper explicitly notes that policy structure co-varies with other knobs across configurations and that the design is not ceteris paribus; thus the causal attribution to the hierarchical structure is not established.
  - Required change: Add a direct ablation that toggles only the policy hierarchy (holding encoder, reward, and constraint identical) on at least one market to substantiate the causal claim.
  - Verification: Re-review should confirm `Sections 5.2-5.4; Section 6, RQ2` is corrected or justified.
- [ ] **Manuscript: Section 5.4 (SAC subsection)**
  - Location: `corrections/2605.17307/paper.tex` at `Section 5.4 (SAC subsection)`
  - Evidence: The instability of automatic alpha is asserted but not demonstrated; no diagnostics, no comparison of fixed vs tuned alpha, and no sensitivity over alpha values (e.g., 0.05, 0.1, 0.2, 0.5) are reported. The choice may be reasonable but is empirically unjustified in the manuscript.
  - Required change: Add a small ablation comparing at least two fixed alpha values and (optionally) automatic tuning on one market/fold.
  - Verification: Re-review should confirm `Section 5.4 (SAC subsection)` is corrected or justified.
- [ ] **Manuscript: Abstract; Sections 6.4, 9**
  - Location: `corrections/2605.17307/paper.tex` at `Abstract; Sections 6.4, 9`
  - Evidence: The HAC inference on mean differences (Table 7) and the HAC regression on alpha (Table 8) test different null hypotheses. Equal mean returns implies alpha=0 only when beta=1; with beta < 1 a strategy can have statistically significant positive alpha while exhibiting non-significant mean-difference, which is what Tables 7 vs 8 show. The abstract conflates 'no excess returns' (mean difference) with the alpha test, since alpha-significance in EURO STOXX 50 is itself a form of HAC-robust evidence of risk-adjusted excess return.
  - Required change: Clarify the abstract: distinguish 'no significant mean-return difference (Table 7)' from 'evidence of significant Jensen's alpha in EURO STOXX 50 (Table 8)' and discuss the implications of beta != 1.
  - Verification: Re-review should confirm `Abstract; Sections 6.4, 9` is corrected or justified.
- [ ] **Manuscript: Section 5.5, Table 6 (tab:env_params)**
  - Location: `corrections/2605.17307/paper.tex` at `Section 5.5, Table 6 (tab:env_params)`
  - Evidence: bps-per-share and bps-per-dollar-of-turnover are not directly comparable: bps-per-share is a fee on share count and depends on average share price (e.g., 0.35 bps per share at a $50 share = 0.007 bps of notional, but the unit dimensions are inconsistent with how the comparison is stated). The justification, as written, conflates two different cost units and does not actually demonstrate consistency.
  - Required change: Either (i) restate IBKR fees in bps of traded notional by combining commissions with realistic share-price assumptions, or (ii) cite institutional bid-ask spread estimates that are directly expressed in bps of notional.
  - Verification: Re-review should confirm `Section 5.5, Table 6 (tab:env_params)` is corrected or justified.
- [ ] **Revision target: Non-standard performance metrics IR2 and IR3 lack dimensional justification; IR3 (ARC^3/(ASD·...**
  - Location: review artifact
  - Required change: Non-standard performance metrics IR2 and IR3 lack dimensional justification; IR3 (ARC^3/(ASD·MD·MLD)) is particularly susceptible to outliers and should be clearly labeled as a heuristic rather than presented alongside established measures.
  - Verification: Re-review should confirm this weakness has been addressed or justified.

## Open Questions

- Can the authors release source code and, where Bloomberg licensing permits, the reconstructed index-membership matrices and processed return datasets, so that at least the simulation layer of the pipeline can be independently verified?
- What is the correct mathematical definition of Maximum Drawdown as implemented in the codebase, and does the narrative in Section 6.2 (e.g., Nikkei MLD = 11.345 years) reflect formula eq:md as written or a corrected implementation?
- Can a sensitivity table over at least three fixed entropy-coefficient values (e.g., alpha in {0.05, 0.1, 0.2}) be added for one representative market, together with representative automatic-tuning traces that motivated the fixed-alpha choice?
- Can an explicit fold calendar (precise start and end dates for each of the stated 16 test windows) be provided as an appendix, along with clarification of how the apparent 17-year test span (2009-04 to 2026-03) maps to 16 folds?
- Does a single-factor ablation exist—or can one be run—that toggles only the hierarchical vs. flat Dirichlet policy while holding encoder type, reward formulation, and cash constraint identical, in order to substantiate the causal performance attribution to the policy structure?

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
        "url": "https://doi.org/10.1109/ACCESS.2021.3059960",
        "venue": "IEEE Access",
        "year": 2021
      },
      "exists": null,
      "explanation": "Cited in the Methodology section as a justification for using walk-forward optimization and for selecting specific training horizon parameters.",
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
        "url": "https://doi.org/10.3390/s22030917",
        "venue": "Sensors",
        "year": 2022
      },
      "exists": null,
      "explanation": "Cited in the Methodology section for performance metrics and the definition of Maximum Loss Duration (MLD).",
      "notes": null,
      "relevance": "high",
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
        "url": "https://doi.org/10.1016/j.physa.2021.126784",
        "venue": "Physica A: Statistical Mechanics and its Applications",
        "year": 2022
      },
      "exists": null,
      "explanation": "Cited in the Methodology section alongside other works for standard performance metrics.",
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
        "url": "https://doi.org/10.1111/j.1540-6261.1952.tb01525.x",
        "venue": "The Journal of Finance",
        "year": 1952
      },
      "exists": null,
      "explanation": "Foundational work for modern portfolio theory, cited in the Literature Review to establish the Mean-Variance Optimization (MVO) framework.",
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
        "url": "https://doi.org/10.2469/faj.v48.n5.28",
        "venue": "Financial Analysts Journal",
        "year": 1992
      },
      "exists": null,
      "explanation": "Cited in the Literature Review for its critique of standard Mean-Variance Optimization.",
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
        "url": "https://doi.org/10.1186/s40537-025-01164-z",
        "venue": "Journal of Big Data",
        "year": 2025
      },
      "exists": null,
      "explanation": "Cited in the Literature Review as a recent example of integrating machine learning forecasts into Markowitz optimization.",
      "notes": null,
      "relevance": "high",
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
        "url": "https://doi.org/10.1016/S0925-2312(03)00372-2",
        "venue": "Neurocomputing",
        "year": 2003
      },
      "exists": null,
      "explanation": "Cited in the Literature Review for early work using Support Vector Machines for stock market prediction.",
      "notes": null,
      "relevance": "medium",
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
        "url": "https://doi.org/10.48550/arXiv.1605.00003",
        "venue": "arXiv preprint",
        "year": 2016
      },
      "exists": null,
      "explanation": "Cited in the Literature Review for the application of Random Forests in capturing market patterns.",
      "notes": null,
      "relevance": "medium",
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
        "url": "https://doi.org/10.1016/j.ribaf.2023.102052",
        "venue": "Research in International Business and Finance",
        "year": 2023
      },
      "exists": null,
      "explanation": "Cited in the Literature Review for benchmarking SVM performance against other models in global markets.",
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
        "url": "https://doi.org/10.21314/JCF.2016.322",
        "venue": "The Journal of Computational Finance",
        "year": 2017
      },
      "exists": null,
      "explanation": "Critical work on backtest overfitting, cited in Literature Review, Methodology, and Conclusions to highlight risks of meta-overfitting in financial ML.",
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
        "url": "https://doi.org/10.3905/jpm.2018.44.6.120",
        "venue": "The Journal of Portfolio Management",
        "year": 2018
      },
      "exists": null,
      "explanation": "Cited in the Literature Review regarding the practical challenges and failure modes of machine learning in finance.",
      "notes": null,
      "relevance": "medium",
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
        "url": "https://doi.org/10.1109/TETCI.2020.2971218",
        "venue": "IEEE Transactions on Emerging Topics in Computational Intelligence",
        "year": 2021
      },
      "exists": null,
      "explanation": "Cited in the Literature Review as an early benchmark for Recurrent Neural Networks (RNNs) in capturing price dynamics.",
      "notes": "The bibliography entry 'Giles2001' actually lists a 2021 IEEE paper by Lin et al., which is likely a citation error or mismatch by the authors.",
      "relevance": "medium",
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
        "url": "https://doi.org/10.1186/s40537-025-01267-7",
        "venue": "Journal of Big Data",
        "year": 2025
      },
      "exists": null,
      "explanation": "Cited in the Literature Review for using supervised autoencoders with recurrent structures for feature extraction.",
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
        "url": "https://doi.org/10.1016/j.ejor.2017.11.054",
        "venue": "European Journal of Operational Research",
        "year": 2018
      },
      "exists": null,
      "explanation": "Cited in the Literature Review as a seminal work for LSTM applications in financial market predictions.",
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
        "url": "https://doi.org/10.2139/ssrn.4628806",
        "venue": "SSRN Electronic Journal",
        "year": 2023
      },
      "exists": null,
      "explanation": "Cited in the Literature Review for its analysis of LSTM architectures in regression vs. classification tasks.",
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
        "url": "https://doi.org/10.1016/j.knosys.2025.113563",
        "venue": "Knowledge-Based Systems",
        "year": 2025
      },
      "exists": null,
      "explanation": "Cited in the Literature Review for its hybrid econometric-LSTM approach.",
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
        "url": "https://doi.org/10.48550/arXiv.2503.18096",
        "venue": "arXiv preprint",
        "year": 2025
      },
      "exists": null,
      "explanation": "Cited in the Literature Review as evidence for Transformer-based (Informer) architectures in finance.",
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
        "url": "https://doi.org/10.1111/mafi.12382",
        "venue": "Mathematical Finance",
        "year": 2023
      },
      "exists": null,
      "explanation": "Cited in the Literature Review and Conclusions as a comprehensive survey of modern financial RL.",
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
        "url": "https://doi.org/10.1109/72.935097",
        "venue": "IEEE Transactions on Neural Networks",
        "year": 2001
      },
      "exists": null,
      "explanation": "Foundational work for Direct Reinforcement (DR) in trading, cited in the Literature Review.",
      "notes": null,
      "relevance": "medium",
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
        "url": "https://doi.org/10.1109/TNNLS.2016.2522401",
        "venue": "IEEE Transactions on Neural Networks and Learning Systems",
        "year": 2017
      },
      "exists": null,
      "explanation": "Cited in the Literature Review for combining deep learning with direct reinforcement learning for trading.",
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
        "url": "https://doi.org/10.48550/arXiv.2510.09247",
        "venue": "arXiv preprint",
        "year": 2025
      },
      "exists": null,
      "explanation": "Cited in the Literature Review as a recent application of TD3 in financial hedging.",
      "notes": null,
      "relevance": "low",
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
        "url": "https://doi.org/10.3390/sym18010112",
        "venue": "Symmetry",
        "year": 2026
      },
      "exists": null,
      "explanation": "Cited in the Literature Review for recent advances in RL with zero-shot and embedding enhancements.",
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
        "url": "https://doi.org/10.48550/arXiv.2112.06753",
        "venue": "arXiv preprint",
        "year": 2021
      },
      "exists": null,
      "explanation": "Cited in the Literature Review for providing an environment framework (FinRL-Meta) for financial RL research.",
      "notes": null,
      "relevance": "medium",
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
        "url": "https://doi.org/10.1080/14697688.2019.1571683",
        "venue": "Quantitative Finance",
        "year": 2019
      },
      "exists": null,
      "explanation": "Cited in the Literature Review for the 'deep hedging' framework under market frictions.",
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
        "url": "https://doi.org/10.1007/s10287-011-0131-1",
        "venue": "Computational Management Science",
        "year": 2012
      },
      "exists": null,
      "explanation": "Cited in the Literature Review for regime-switching extensions to recurrent RL models.",
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
        "url": "https://doi.org/10.3905/jfds.2020.1.045",
        "venue": "The Journal of Financial Data Science",
        "year": 2020
      },
      "exists": null,
      "explanation": "Cited in the Literature Review for hedging and option replication using deep RL.",
      "notes": null,
      "relevance": "low",
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
        "url": "https://doi.org/10.1109/ACCESS.2022.3203697",
        "venue": "IEEE Access",
        "year": 2022
      },
      "exists": null,
      "explanation": "Cited in the Literature Review for a POMDP formulation of portfolio allocation.",
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
        "url": "https://doi.org/10.1109/ICSIT65336.2025.11293906",
        "venue": "2025 International Conference on Sustainability, Innovation & Technology (ICSIT)",
        "year": 2025
      },
      "exists": null,
      "explanation": "Cited in the Literature Review for trade execution and market impact modeling.",
      "notes": null,
      "relevance": "low",
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
        "url": "https://doi.org/10.1145/3383455.3422540",
        "venue": "Proceedings of the First ACM International Conference on AI in Finance (ICAIF '20)",
        "year": 2020
      },
      "exists": null,
      "explanation": "Cited in Literature Review and Conclusions as a representative ensemble RL strategy for trading.",
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
        "url": "https://doi.org/10.1109/TBDATA.2025.3533905",
        "venue": "IEEE Transactions on Big Data",
        "year": 2025
      },
      "exists": null,
      "explanation": "Cited in the Literature Review for risk-constrained CMDP formulations in portfolio optimization.",
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
        "url": "https://doi.org/10.1109/INDISCON62179.2024.10744403",
        "venue": "2024 IEEE 5th India Council International Subsections Conference (INDISCON)",
        "year": 2024
      },
      "exists": null,
      "explanation": "Cited in the Literature Review for DQN-based portfolio optimization.",
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
        "url": "https://doi.org/10.1016/j.eswa.2020.113456",
        "venue": "Expert Systems with Applications",
        "year": 2020
      },
      "exists": null,
      "explanation": "Cited in the Literature Review for the DeepBreath framework combining autoencoders and CNNs for portfolio management.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    }
  ],
  "missing_references": [
    {
      "reason": "The paper uses Soft Actor-Critic (SAC) as its core algorithm and cites it in the text as [@Haarnoja2018], but the foundational paper is missing from the provided bibliography.",
      "title": "Soft Actor-Critic: Off-Policy Maximum Entropy Deep Reinforcement Learning with a Stochastic Actor (Haarnoja et al., 2018)"
    },
    {
      "reason": "The paper discusses hierarchical Dirichlet policies for cash management, but does not cite the foundational work for the underlying statistical framework, which is standard in RL literature using such structures.",
      "title": "Hierarchical Dirichlet Processes (Teh et al., 2006)"
    },
    {
      "reason": "The paper focuses on multi-asset portfolio management with deep reinforcement learning, and Jiang's 2017 work is a seminal DRL paper specifically for the multi-asset portfolio problem that is highly relevant to the methodology.",
      "title": "A Deep Reinforcement Learning Framework for the Financial Portfolio Management Problem (Jiang et al., 2017)"
    }
  ],
  "summary": "The paper provides a robust set of references covering classical portfolio theory, modern financial machine learning, and deep reinforcement learning. Key benchmarks like DeMiguel (2009) and foundational RL works are present. However, while the paper employs Soft Actor-Critic (SAC), it only cites Haarnoja (2018) in the text without including it in the provided bibliography block. The citation for Giles2001 appears to be a metadata mismatch, as it points to a 2021 IEEE paper. Per instructions, only the 32 bibliography entries included in the prompt have been reviewed."
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.82,
  "questions": [
    "Can the authors release source code and, where Bloomberg licensing permits, the reconstructed index-membership matrices and processed return datasets, so that at least the simulation layer of the pipeline can be independently verified?",
    "What is the correct mathematical definition of Maximum Drawdown as implemented in the codebase, and does the narrative in Section 6.2 (e.g., Nikkei MLD = 11.345 years) reflect formula eq:md as written or a corrected implementation?",
    "Can a sensitivity table over at least three fixed entropy-coefficient values (e.g., alpha in {0.05, 0.1, 0.2}) be added for one representative market, together with representative automatic-tuning traces that motivated the fixed-alpha choice?",
    "Can an explicit fold calendar (precise start and end dates for each of the stated 16 test windows) be provided as an appendix, along with clarification of how the apparent 17-year test span (2009-04 to 2026-03) maps to 16 folds?",
    "Does a single-factor ablation exist—or can one be run—that toggles only the hierarchical vs. flat Dirichlet policy while holding encoder type, reward formulation, and cash constraint identical, in order to substantiate the causal performance attribution to the policy structure?"
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "Core hyperparameters are tabulated, but several reproducibility-critical choices remain underspecified, including random seeds, exact candidate grids for model selection, per-configuration concentration penalties and top-k choices, initialization, optimizer details beyond learning rates, and stopping-selection rules in implementation form.",
      "id": "weakness-1",
      "locator": "experiment configuration",
      "required_update": "Publish the exact experiment configuration: random seeds, candidate grids, fold boundaries/calendars, initialization policy, package versions, top-k choices, and penalty settings.",
      "source_path": "boundaries/calendars",
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "code",
      "verification_check": "Re-review should confirm exact seeds, grids, folds, package versions, and configuration choices are specified.",
      "weakness_index": 0
    },
    {
      "evidence": "As written, the inner argument (R_{i,T} - R_{i,s}) is independent of t, so the inner max over t in [0,s] is degenerate. Moreover, the index i is unexplained (the metric is computed on the portfolio equity curve, not an asset i), and the standard peak-to-trough drawdown is max_{t<=s}(P_t - P_s)/P_t (or equivalently 1 - P_s/max_{t<=s} P_t). The current formula does not capture the peak-to-trough loss it is meant to measure.",
      "id": "weakness-2",
      "locator": "Section 5.8, eq. eq:md",
      "required_update": "Replace with the standard definition MD = max_{0<=t<=s<=T} (V_t - V_s)/V_t, where V_t is the portfolio value, and remove the spurious asset index i and inner max over t that does not appear in the argument.",
      "source_path": "corrections/2605.17307/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 5.8, eq. eq:md` is corrected or justified.",
      "weakness_index": 1
    },
    {
      "evidence": "The paper uses Soft Actor-Critic (SAC) as its core algorithm and cites it in the text as [@Haarnoja2018], but the foundational paper is missing from the provided bibliography.",
      "id": "weakness-3",
      "locator": "Soft Actor-Critic: Off-Policy Maximum Entropy Deep Reinforcement Learning with a Stochastic Actor (Haarnoja et al., 2018)",
      "required_update": "Add a bibliography entry for `Soft Actor-Critic: Off-Policy Maximum Entropy Deep Reinforcement Learning with a Stochastic Actor (Haarnoja et al., 2018)` and cite it where the affected method or claim is introduced, or explicitly justify its omission.",
      "source_path": null,
      "source_role": "citation",
      "status": "open",
      "target_kind": "bibliography",
      "verification_check": "Re-review should confirm the bibliography and citation context address this reference.",
      "weakness_index": 2
    },
    {
      "evidence": "Mathematically, factoring an action distribution as P(w_eq, w_c) * P(w_1..w_N | w_eq) is well-defined and equivalent to a constrained Dirichlet on the joint simplex. Empirically, the paper reports that LSTM_2 has lower ASD and MD than LSTM_1 on the three markets. However, the paper explicitly notes that policy structure co-varies with other knobs across configurations and that the design is not ceteris paribus; thus the causal attribution to the hierarchical structure is not established.",
      "id": "weakness-4",
      "locator": "Sections 5.2-5.4; Section 6, RQ2",
      "required_update": "Add a direct ablation that toggles only the policy hierarchy (holding encoder, reward, and constraint identical) on at least one market to substantiate the causal claim.",
      "source_path": "corrections/2605.17307/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Sections 5.2-5.4; Section 6, RQ2` is corrected or justified.",
      "weakness_index": 3
    },
    {
      "evidence": "The instability of automatic alpha is asserted but not demonstrated; no diagnostics, no comparison of fixed vs tuned alpha, and no sensitivity over alpha values (e.g., 0.05, 0.1, 0.2, 0.5) are reported. The choice may be reasonable but is empirically unjustified in the manuscript.",
      "id": "weakness-5",
      "locator": "Section 5.4 (SAC subsection)",
      "required_update": "Add a small ablation comparing at least two fixed alpha values and (optionally) automatic tuning on one market/fold.",
      "source_path": "corrections/2605.17307/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 5.4 (SAC subsection)` is corrected or justified.",
      "weakness_index": 4
    },
    {
      "evidence": "The HAC inference on mean differences (Table 7) and the HAC regression on alpha (Table 8) test different null hypotheses. Equal mean returns implies alpha=0 only when beta=1; with beta < 1 a strategy can have statistically significant positive alpha while exhibiting non-significant mean-difference, which is what Tables 7 vs 8 show. The abstract conflates 'no excess returns' (mean difference) with the alpha test, since alpha-significance in EURO STOXX 50 is itself a form of HAC-robust evidence of risk-adjusted excess return.",
      "id": "weakness-6",
      "locator": "Abstract; Sections 6.4, 9",
      "required_update": "Clarify the abstract: distinguish 'no significant mean-return difference (Table 7)' from 'evidence of significant Jensen's alpha in EURO STOXX 50 (Table 8)' and discuss the implications of beta != 1.",
      "source_path": "corrections/2605.17307/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Abstract; Sections 6.4, 9` is corrected or justified.",
      "weakness_index": 5
    },
    {
      "evidence": "bps-per-share and bps-per-dollar-of-turnover are not directly comparable: bps-per-share is a fee on share count and depends on average share price (e.g., 0.35 bps per share at a $50 share = 0.007 bps of notional, but the unit dimensions are inconsistent with how the comparison is stated). The justification, as written, conflates two different cost units and does not actually demonstrate consistency.",
      "id": "weakness-7",
      "locator": "Section 5.5, Table 6 (tab:env_params)",
      "required_update": "Either (i) restate IBKR fees in bps of traded notional by combining commissions with realistic share-price assumptions, or (ii) cite institutional bid-ask spread estimates that are directly expressed in bps of notional.",
      "source_path": "corrections/2605.17307/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 5.5, Table 6 (tab:env_params)` is corrected or justified.",
      "weakness_index": 6
    },
    {
      "evidence": "Non-standard performance metrics IR2 and IR3 lack dimensional justification; IR3 (ARC^3/(ASD·MD·MLD)) is particularly susceptible to outliers and should be clearly labeled as a heuristic rather than presented alongside established measures.",
      "id": "weakness-8",
      "locator": null,
      "required_update": "Non-standard performance metrics IR2 and IR3 lack dimensional justification; IR3 (ARC^3/(ASD·MD·MLD)) is particularly susceptible to outliers and should be clearly labeled as a heuristic rather than presented alongside established measures.",
      "source_path": null,
      "source_role": null,
      "status": "open",
      "target_kind": "unknown",
      "verification_check": "Re-review should confirm this weakness has been addressed or justified.",
      "weakness_index": 7
    }
  ],
  "strengths": [
    "First systematic multi-market RL portfolio comparison with identical evaluation procedures across U.S., Asian, and European indices, enabling direct cross-regional benchmarking absent in prior single-market studies.",
    "Hierarchical Dirichlet policy architecture is mathematically well-motivated: factoring the action distribution into equity-cash gating and per-asset Dirichlet is internally consistent and guarantees budget and non-negativity constraints by construction.",
    "Rigorous statistical inference employing both Newey-West HAC robust tests and stationary block bootstrap for Sharpe and IR2 differences; the distinction between mean-return tests (Table 7) and Jensen's alpha regression (Table 8) reflects methodological care.",
    "Long 23-year out-of-sample evaluation spanning post-GFC recovery, secular bull market, and COVID-19 shock provides meaningful regime-conditional performance attribution.",
    "Survivorship-bias correction via time-varying Bloomberg index membership reconstruction is a commendable and often-omitted step in financial ML backtests.",
    "Systematic ablation across five configuration axes (reward formulation, policy structure, cash constraint, encoder type, top-k selection) enables structured hypothesis testing."
  ],
  "summary": "This paper presents a Soft Actor-Critic (SAC) framework for multi-asset portfolio management evaluated across three global equity indices (Nasdaq-100, Nikkei 225, Euro Stoxx 50) over a 23-year walk-forward horizon. Core innovations include a hierarchical Dirichlet policy decoupling equity-cash from asset-level allocation, an adaptive retraining heuristic, and regime-conditioned performance decomposition. Specialist reviews converge on a picture of solid methodological ambition—rigorous HAC and block-bootstrap inference, survivorship-bias correction, systematic ablations—offset by incremental novelty (score 0.65), one outright incorrect performance-metric formula, and severely inadequate reproducibility (score 0.28) stemming from absent code, restricted Bloomberg data, and underspecified hyperparameters. The foundational SAC citation is missing from the bibliography. The paper makes a genuine contribution as the first systematic multi-market RL portfolio study with identical evaluation procedures, but requires significant revisions before publication.",
  "weaknesses": [
    "Reproducibility is critically deficient: no source code or repository is provided, Bloomberg membership data are proprietary and unshared, random seeds and exact hyperparameter grids are not specified, fold calendars are absent, and compute costs (~14–23 GPU-hours per fold) preclude independent replication without released checkpoints (reproducibility score 0.28).",
    "The Maximum Drawdown formula (eq:md) is mathematically incorrect: the inner maximization over t in [0,s] is degenerate because the argument (R_{i,T}−R_{i,s}) does not depend on t; additionally, the unexplained asset index i conflates a portfolio-level metric with an asset-level one.",
    "The foundational SAC paper (Haarnoja et al., 2018) is cited in text as [@Haarnoja2018] but is absent from the provided bibliography, and the seminal multi-asset DRL portfolio paper (Jiang et al., 2017) is also missing.",
    "Novelty is incremental (score 0.65): the hierarchical Dirichlet policy and adaptive retraining are the paper's main methodological contributions, but neither is validated by a single-factor ablation that holds all other design choices constant, leaving causal attribution unsubstantiated.",
    "The fixed entropy coefficient alpha=0.2 is asserted to be preferable to automatic tuning due to instability across folds, but no supporting diagnostics, fold-level traces, or sensitivity analysis over alternative alpha values are reported.",
    "The abstract conflates two distinct statistical tests: the non-significant mean-return difference (Table 7, HAC) and the significant Jensen's alpha in Euro Stoxx 50 (Table 8, HAC regression), which test different null hypotheses and cannot be summarized as a single 'only partially confirmed' verdict without clarification of beta≠1 implications.",
    "The transaction cost justification conflates bps-per-share (IBKR tiered pricing) with bps-per-dollar-of-notional, rendering the claimed consistency between 2 bps turnover cost and IBKR schedule dimensionally invalid.",
    "Non-standard performance metrics IR2 and IR3 lack dimensional justification; IR3 (ARC^3/(ASD·MD·MLD)) is particularly susceptible to outliers and should be clearly labeled as a heuristic rather than presented alongside established measures."
  ]
}
```

### novelty (`gemini-3-flash-preview`) — status: `pass`

```json
{
  "confidence": 0.95,
  "missing_prior_art": [],
  "novelty_score": 0.65,
  "related_work": [
    {
      "citation_key": "Liu_2025",
      "delta": "While FinRL-Meta provides a broad universe of environments, this paper applies a specific, unified multi-market walk-forward optimization framework with identical constraints across three distinct global regions (US, Asia, Europe).",
      "relation": "builds_on",
      "title": "FinRL-Meta: A universe of near-real market environments for data-driven deep reinforcement learning in quantitative finance"
    },
    {
      "citation_key": "DE_MIGEUL",
      "delta": "This study uses the 1/N portfolio as a primary benchmark and empirically confirms its competitiveness, while attempting to bridge the gap through an RL-based hierarchical Dirichlet policy structure.",
      "relation": "competing",
      "title": "Optimal Versus Naive Diversification: How Inefficient is the 1/N Portfolio Strategy?"
    },
    {
      "citation_key": "Haarnoja2018",
      "delta": "Adapts the standard SAC algorithm to the portfolio management domain by implementing a hierarchical Dirichlet policy and integrating domain-specific penalties (turnover, concentration) into the reward function.",
      "relation": "builds_on",
      "title": "Soft Actor-Critic: Off-Policy Maximum Entropy Deep Reinforcement Learning with a Stochastic Actor"
    },
    {
      "citation_key": "JIANG2024101016",
      "delta": "Unlike single-market TD3 approaches, this paper compares SAC across multiple global indices using a specific adaptive retraining criterion based on validation Sharpe ratios.",
      "relation": "prior_art",
      "title": "Deep reinforcement learning for portfolio selection"
    },
    {
      "citation_key": null,
      "delta": "Introduces a hierarchical Dirichlet policy structure that separates equity-cash allocation from individual asset selection, extending the flat architectures commonly seen in related RL-finance literature.",
      "relation": "orthogonal",
      "title": "Hierarchical Dirichlet Policy Structure for RL Portfolio Management"
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
      "description": "The paper describes a custom SAC portfolio framework with LSTM, Transformer, Dirichlet policies, adaptive retraining, benchmarks, and inference procedures, but provides no source code, repository, scripts, or executable workflow.",
      "severity": "critical"
    },
    {
      "area": "data",
      "description": "Price data are said to come from yfinance, but survivorship-bias correction depends on historical index membership from Bloomberg Terminal Anywhere; the reconstructed membership matrices and processed datasets are not provided.",
      "severity": "major"
    },
    {
      "area": "hyperparameters",
      "description": "Core hyperparameters are tabulated, but several reproducibility-critical choices remain underspecified, including random seeds, exact candidate grids for model selection, per-configuration concentration penalties and top-k choices, initialization, optimizer details beyond learning rates, and stopping-selection rules in implementation form.",
      "severity": "major"
    },
    {
      "area": "compute",
      "description": "The stated compute burden is high: about 14 hours per LSTM agent walk-forward cycle and 23 hours per Transformer cycle on an NVIDIA L4 instance, making full multi-market, multi-configuration replication expensive without released checkpoints or logs.",
      "severity": "major"
    },
    {
      "area": "evaluation",
      "description": "The walk-forward design and metrics are described, but exact fold calendars, trained model outputs, portfolio weights, bootstrap settings, HAC lag choices, benchmark return series, and result-generation scripts are not supplied, limiting independent verification of reported tables.",
      "severity": "major"
    }
  ],
  "confidence": 0.86,
  "data_availability": "restricted",
  "data_url": null,
  "environment": {
    "dependencies": [
      "yfinance",
      "Bloomberg Terminal Anywhere subscription",
      "Soft Actor-Critic implementation",
      "LSTM encoder",
      "Transformer encoder"
    ],
    "hardware": "Cloud-based G2-standard instance with NVIDIA L4 GPU, 24GB VRAM, and 30GB system memory.",
    "software": null
  },
  "reproducibility_score": 0.28
}
```

### summary (`claude-haiku-4-5-20251001`) — status: `pass`

```json
{
  "audience": "Quantitative finance researchers, portfolio managers and asset allocators exploring machine learning techniques, academic researchers in computational finance and deep reinforcement learning, and financial technologists developing adaptive trading systems",
  "key_contributions": [
    "First systematic multi-market comparison of reinforcement learning portfolio strategies using identical evaluation procedures across U.S., Asian, and European equity indices, enabling direct cross-market comparison absent in prior single-market studies",
    "Novel hierarchical Dirichlet policy architecture that separately optimizes equity-cash allocation from individual asset selection, extending flat policy structures commonly used in prior financial RL research",
    "Adaptive retraining criterion that selectively updates the model based on rolling validation performance, reducing computational cost while maintaining realistic deployment conditions",
    "Comprehensive decomposition of performance across three macroeconomic regimes (post-GFC recovery, secular bull market, COVID-19 shock), demonstrating that RL strategies add value specifically during periods of elevated market uncertainty",
    "Systematic ablation study comparing reward formulations (absolute vs. benchmark-relative), policy structures (flat vs. hierarchical), portfolio constraints (fully invested vs. flexible), and temporal encoders (LSTM vs. Transformer)"
  ],
  "plain_language_summary": "This paper tackles the challenge of dynamically adjusting investment portfolios across international stock markets using artificial intelligence. Rather than relying on traditional fixed allocation rules or market predictions, the authors train an AI agent (using a technique called Soft Actor-Critic) to learn optimal portfolio allocation strategies by directly optimizing for long-term investment returns while accounting for realistic trading costs and diversification requirements. The AI learns this policy by simulating millions of trading decisions and refining its strategy based on performance feedback, much like a human trader learning from experience.\n\nThe study tests five variations of this approach across three major stock indices—the U.S. Nasdaq-100, Japan's Nikkei 225, and Europe's Euro Stoxx 50—over 23 years of historical data from 2003 to 2026. The researchers use a rigorous evaluation method that trains the AI on past data and then tests it on completely separate future periods, ensuring they measure realistic out-of-sample performance. Key findings reveal that the AI-based strategies work particularly well in European markets and during periods of high market volatility, but they do not consistently beat simpler strategies like equal-weight portfolios or passive index investing when considering transaction costs and statistical significance.\n\nThe paper's most important insight is that reinforcement learning adds value not by consistently beating the market, but by adapting portfolio allocations in response to changing market conditions—specifically when uncertainty is high. The authors also show that combining predictions across multiple markets creates more stable results than focusing on a single country.",
  "tldr": "A deep reinforcement learning framework using Soft Actor-Critic successfully allocates portfolio weights across global equity markets, achieving strong risk-adjusted returns in European stocks during uncertain periods but only partially outperforming traditional Buy & Hold benchmarks across all markets."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `pass`

```json
{
  "claims": [
    {
      "assessment": "supported",
      "claim": "The portfolio allocation problem is formulated as a Markov Decision Process and solved with the Soft Actor-Critic algorithm using a Dirichlet policy that produces non-negative weights summing to one.",
      "evidence": "The MDP tuple (S, A, P, r, gamma) is correctly specified; Dirichlet outputs guarantee w_i >= 0 and sum_i w_i = 1, which is the standard property of a Dirichlet random vector. SAC twin critics, soft target updates (tau in (0,1)), and entropy regularization are described consistently with Haarnoja2018.",
      "id": "C1",
      "location": "Sections 4.1, 5.2, 5.4 (Model Architecture)",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "The Modified Information Ratio is defined as IR** = IR* x ARC x sign(ARC) / MD (eq:ir-starstar).",
      "evidence": "Substituting IR* = ARC/ASD yields IR** = ARC^2 * sign(ARC) / (ASD * MD), which is sign-preserving (negative when ARC<0 and positive when ARC>0). The factor ARC * sign(ARC) = |ARC| is mathematically well-defined. However, the construction is non-standard and the role of sign(ARC) is redundant relative to ARC itself in determining sign of IR**, so the definition could be written more transparently as ARC*|ARC|/(ASD*MD).",
      "id": "C2",
      "location": "Section 5.8, eq. eq:ir-starstar",
      "severity": "minor",
      "suggested_fix": "Rewrite IR** explicitly as ARC * |ARC| / (ASD * MD) to remove the redundant sign() factor and make the sign convention obvious."
    },
    {
      "assessment": "incorrect",
      "claim": "The Maximum Drawdown is defined by MD(T) = max_{s in [0,T]} max_{t in [0,s]} (R_{i,T} - R_{i,s}) x 100% (eq:md).",
      "evidence": "As written, the inner argument (R_{i,T} - R_{i,s}) is independent of t, so the inner max over t in [0,s] is degenerate. Moreover, the index i is unexplained (the metric is computed on the portfolio equity curve, not an asset i), and the standard peak-to-trough drawdown is max_{t<=s}(P_t - P_s)/P_t (or equivalently 1 - P_s/max_{t<=s} P_t). The current formula does not capture the peak-to-trough loss it is meant to measure.",
      "id": "C3",
      "location": "Section 5.8, eq. eq:md",
      "severity": "major",
      "suggested_fix": "Replace with the standard definition MD = max_{0<=t<=s<=T} (V_t - V_s)/V_t, where V_t is the portfolio value, and remove the spurious asset index i and inner max over t that does not appear in the argument."
    },
    {
      "assessment": "partially_supported",
      "claim": "ARC = (prod_{t=1..N} (1+R_t))^{252/N} - 1 x 100% (eq:arc).",
      "evidence": "The intended quantity (annualized compounded return) is standard, but the typeset expression has ambiguous operator precedence: ' - 1 x 100% ' parses as '- (1 x 100%)' rather than '(...-1) x 100%'. The verbal description in the surrounding text is unambiguous, so this is a notation rather than substantive error.",
      "id": "C4",
      "location": "Section 5.8, eq. eq:arc",
      "severity": "minor",
      "suggested_fix": "Parenthesize as ARC = [(prod (1+R_t))^{252/N} - 1] x 100%."
    },
    {
      "assessment": "partially_supported",
      "claim": "The Sharpe ratio is defined as SR = bar{R} / sigma_R * sqrt(252) (eq:sharpe).",
      "evidence": "This is the 'naive' or zero-risk-free-rate Sharpe ratio. The original Sharpe definition uses excess return over the risk-free rate. Given the long sample (2003-2026) includes periods where short-term rates exceeded several percent, ignoring r_f can bias the absolute level of SR upward, although the cross-strategy ranking within the same period is largely unaffected. The choice is internally consistent but should be explicitly justified.",
      "id": "C5",
      "location": "Section 5.8, eq. eq:sharpe",
      "severity": "minor",
      "suggested_fix": "State explicitly that r_f is set to zero (or include r_f) and justify the assumption, ideally reporting a robustness check with realized T-bill rates."
    },
    {
      "assessment": "supported",
      "claim": "Across all three markets, no RL strategy achieves statistically significant mean-return outperformance relative to Buy & Hold under Newey-West HAC inference and stationary block bootstrap (10% level).",
      "evidence": "All HAC p-values for mean differences in Table 7 are well above 0.10 (smallest ~0.31). Bootstrap p-values for Delta Sharpe and Delta IR2 in NASDAQ-100 and Nikkei 225 panels are all above 0.10. Only the EURO STOXX 50 panel shows one bootstrap-significant entry (LSTM-2: p=0.0719 Sharpe, p=0.0619 IR2), but this is a Sharpe/IR2 difference, not a mean-return difference; the corresponding HAC mean-difference p-value (0.5840) is non-significant. Thus the claim about mean returns is consistent with the reported numbers.",
      "id": "C6",
      "location": "Section 6.4, Table 7 (tab:hac_bootstrap_all); Abstract",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "For the EURO STOXX 50, LSTM_1, LSTM_2, LSTM_NC_2 and Transformer exhibit statistically significant positive HAC alphas at the 10% level (Table 8).",
      "evidence": "Reported one-sided p-values in the EURO STOXX 50 panel: LSTM-1 0.0333, LSTM-2 0.0120, LSTM-NC-2 0.0417, Transformer 0.0291; LSTM-NC-1 is 0.1243 (not significant). The text correctly identifies which models cross the 10% threshold. The use of one-sided tests under H1: alpha>0 is internally consistent with the stated hypothesis.",
      "id": "C7",
      "location": "Section 6.4, Table 8 (tab:alpha_regression_all)",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "The abstract's statement that the central hypothesis is 'only partially confirmed' because no strategy achieves statistically significant excess returns relative to Buy & Hold under HAC-robust inference across all markets, while abnormal returns are observed in the EURO STOXX 50.",
      "evidence": "The HAC inference on mean differences (Table 7) and the HAC regression on alpha (Table 8) test different null hypotheses. Equal mean returns implies alpha=0 only when beta=1; with beta < 1 a strategy can have statistically significant positive alpha while exhibiting non-significant mean-difference, which is what Tables 7 vs 8 show. The abstract conflates 'no excess returns' (mean difference) with the alpha test, since alpha-significance in EURO STOXX 50 is itself a form of HAC-robust evidence of risk-adjusted excess return.",
      "id": "C8",
      "location": "Abstract; Sections 6.4, 9",
      "severity": "minor",
      "suggested_fix": "Clarify the abstract: distinguish 'no significant mean-return difference (Table 7)' from 'evidence of significant Jensen's alpha in EURO STOXX 50 (Table 8)' and discuss the implications of beta != 1."
    },
    {
      "assessment": "partially_supported",
      "claim": "The framework uses 16 out-of-sample folds spanning 2003-2026 with a 5y/1y/1y train/val/test walk-forward.",
      "evidence": "With trading beginning in 2009-04 and ending in 2026-03 under a non-anchored WFO with 1-year test windows, this yields approximately 17 calendar years of test data, which would correspond to ~17 (not 16) one-year folds. The text does not show a fold-by-fold listing, so it is not possible to verify exactly how the final partial year is handled. Small but should be documented.",
      "id": "C9",
      "location": "Abstract; Section 5.6.1",
      "severity": "minor",
      "suggested_fix": "Provide an explicit table or appendix listing the start/end dates of each of the 16 folds to make the count auditable."
    },
    {
      "assessment": "unsupported",
      "claim": "A transaction cost assumption of 2 bps per unit of turnover is consistent with IBKR tiered pricing of 0.05-0.35 bps per share.",
      "evidence": "bps-per-share and bps-per-dollar-of-turnover are not directly comparable: bps-per-share is a fee on share count and depends on average share price (e.g., 0.35 bps per share at a $50 share = 0.007 bps of notional, but the unit dimensions are inconsistent with how the comparison is stated). The justification, as written, conflates two different cost units and does not actually demonstrate consistency.",
      "id": "C10",
      "location": "Section 5.5, Table 6 (tab:env_params)",
      "severity": "minor",
      "suggested_fix": "Either (i) restate IBKR fees in bps of traded notional by combining commissions with realistic share-price assumptions, or (ii) cite institutional bid-ask spread estimates that are directly expressed in bps of notional."
    },
    {
      "assessment": "partially_supported",
      "claim": "The hierarchical Dirichlet policy separates the equity-cash allocation from per-asset allocation and yields lower volatility and drawdown than the flat policy (LSTM_2 vs LSTM_1).",
      "evidence": "Mathematically, factoring an action distribution as P(w_eq, w_c) * P(w_1..w_N | w_eq) is well-defined and equivalent to a constrained Dirichlet on the joint simplex. Empirically, the paper reports that LSTM_2 has lower ASD and MD than LSTM_1 on the three markets. However, the paper explicitly notes that policy structure co-varies with other knobs across configurations and that the design is not ceteris paribus; thus the causal attribution to the hierarchical structure is not established.",
      "id": "C11",
      "location": "Sections 5.2-5.4; Section 6, RQ2",
      "severity": "minor",
      "suggested_fix": "Add a direct ablation that toggles only the policy hierarchy (holding encoder, reward, and constraint identical) on at least one market to substantiate the causal claim."
    },
    {
      "assessment": "partially_supported",
      "claim": "The adaptive retraining threshold theta_k = median(S_{k-m},...,S_{k-1}) - 0.5 * std(...) and the retraining trigger {S_k<0, S_k<theta_k, gap>3 folds} provide a principled, computation-saving mechanism (eq:retrain_threshold).",
      "evidence": "The threshold is a heuristic centered below the recent median (median - 0.5*std), with documented cold-start rule (always retrain when fewer than 3 prior validations exist). The rule is internally consistent. However, three potential issues are not analyzed: (i) the multiplicative constant 0.5 is unjustified, (ii) using validation Sharpe to decide retraining and then evaluating on the very next test window can leak information across folds if the validation set is not held strictly fixed, and (iii) no sensitivity analysis is reported.",
      "id": "C12",
      "location": "Section 5.6.2",
      "severity": "minor",
      "suggested_fix": "Document the choice of 0.5 (or test alternatives), confirm the validation set used for theta_k is not overlapping with the next test window, and report sensitivity to the gap cap (3 folds)."
    },
    {
      "assessment": "supported",
      "claim": "The HHI concentration penalty uses HHI_t - HHI_min where HHI_min = 1/N_t, and HHI_min is the equal-weight minimum.",
      "evidence": "For non-negative weights summing to one, HHI = sum w_i^2 is minimized by w_i = 1/N for all i, giving HHI_min = 1/N. This is standard.",
      "id": "C13",
      "location": "Section 5.3",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "The Buy & Hold benchmark for the Nikkei 225 has MLD = 11.345 years, reflecting recovery from the 2008 crisis.",
      "evidence": "Trading begins 2009-04; an MLD of ~11.3 years implies the Nikkei ETF (EWJ) did not regain its post-2009 peak until around 2020, which is broadly consistent with EWJ's recovery profile but the magnitude depends sensitively on dividend treatment and ETF tracking. The number itself is not independently verifiable from the manuscript without the underlying time series.",
      "id": "C14",
      "location": "Section 6.2",
      "severity": "info",
      "suggested_fix": "Briefly note whether EWJ total returns (dividends reinvested) or price returns are used in computing MLD, since this materially affects multi-year drawdown durations."
    },
    {
      "assessment": "supported",
      "claim": "The data construction eliminates survivorship bias by reconstructing time-varying index membership from Bloomberg.",
      "evidence": "The described masking procedure (Bloomberg membership x yfinance price availability) is the standard technique for eliminating survivorship bias, and explicitly excludes delisted/non-member assets from the investable universe on each date.",
      "id": "C15",
      "location": "Section 3.2.1",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "unsupported",
      "claim": "The fixed entropy coefficient alpha = 0.2 was chosen because automatic alpha tuning was unstable across walk-forward folds.",
      "evidence": "The instability of automatic alpha is asserted but not demonstrated; no diagnostics, no comparison of fixed vs tuned alpha, and no sensitivity over alpha values (e.g., 0.05, 0.1, 0.2, 0.5) are reported. The choice may be reasonable but is empirically unjustified in the manuscript.",
      "id": "C16",
      "location": "Section 5.4 (SAC subsection)",
      "severity": "minor",
      "suggested_fix": "Add a small ablation comparing at least two fixed alpha values and (optionally) automatic tuning on one market/fold."
    },
    {
      "assessment": "partially_supported",
      "claim": "Cash-allowed configurations consistently improve risk-adjusted performance (IR2) versus fully invested counterparts (RQ3).",
      "evidence": "The reported tables show that cash-allowed LSTM_2 dominates LSTM_NC variants on IR2 on NASDAQ-100 (claim consistent). Across the three markets and five configurations the comparison is multi-factor (constraints co-vary with reward formulation), so the attribution to 'cash allowance' alone overstates the evidence. The paper acknowledges this caveat in the discussion.",
      "id": "C17",
      "location": "Section 9, RQ3",
      "severity": "minor",
      "suggested_fix": "Tone down causal language in RQ3 conclusions, or perform a single-factor ablation toggling only the cash constraint."
    },
    {
      "assessment": "supported",
      "claim": "The Dirichlet output guarantees w_i >= 0 and sum w_i = 1, satisfying the long-only, fully-invested budget constraint.",
      "evidence": "Dirichlet samples are on the open simplex; with the equity-cash hierarchical extension, equity-only Dirichlet samples scale by w_eq, and (w_eq + w_c) = 1 is enforced by the gating distribution; both formulations satisfy the constraints by construction.",
      "id": "C18",
      "location": "Section 5.2",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "The top-k momentum pre-selection guarantees a constant state vector dimension, eliminating the need for variable-length neural architectures.",
      "evidence": "Selecting exactly k assets at every step yields a fixed input dimensionality regardless of how many assets are tradable at time t (provided k <= min_t N_t). This is mathematically correct and is a well-known technique to handle time-varying universes.",
      "id": "C19",
      "location": "Section 5.1 (Dynamic asset universe)",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "The IR3 (Extended Information Ratio) is ARC^3 / (ASD * MD * MLD) (eq:ir3).",
      "evidence": "The cubic numerator makes IR3 odd in ARC (negative when ARC<0), and the denominator is always positive, so the sign behavior is correct. However, the metric is dimensionally heterogeneous and not standard in the literature; it is sensitive to outliers in any of three denominators (especially MLD ~ 0). It should be reported as a heuristic rather than treated on par with established risk-adjusted measures.",
      "id": "C20",
      "location": "Section 5.8, eq. eq:ir3",
      "severity": "minor",
      "suggested_fix": "Either provide motivation/units for IR3 or restrict primary inference to IR2 and Sharpe ratio, which have established interpretations."
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

