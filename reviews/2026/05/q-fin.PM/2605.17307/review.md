# Deep Reinforcement Learning Framework for Diversified Portfolio Management Across Global Equity Markets

GrokRxiv review of [arXiv:2605.17307](https://arxiv.org/abs/2605.17307) · `q-fin.PM`

## TL;DR

This paper applies Soft Actor-Critic (SAC) reinforcement learning with a novel hierarchical Dirichlet allocation policy to dynamic portfolio management across three global equity markets (Nasdaq-100, Nikkei 225, Euro Stoxx 50) over a 23-year walk-forward horizon. The work introduces an adaptive retraining criterion, compares LSTM and Transformer temporal encoders, conducts a macroeconomic regime decomposition, and aggregates results into a cross-market ensemble. The methodology is ambitious and the empirical scope is commendable, but five specialist reviewers collectively identify multiple major correctness, reproducibility, and statistical integrity problems that must be addressed before the results can be accepted as presented. The most serious issues are: (1) the Nikkei 225 Buy-and-Hold benchmark is mis-specified as the MSCI Japan ETF (EWJ), potentially invalidating the Nikkei regime analysis; (2) alpha-significance p-values are reported without multiple-testing correction across 15+ simultaneous hypotheses, overstating the evidence for outperformance; (3) the same validation window is used for both hyperparameter selection and the adaptive retraining trigger, introducing unquantified selection bias; (4) transaction costs are set at 2 bps and no sensitivity robustness is provided for the small alphas found on Euro Stoxx 50; and (5) no source code or data snapshots are provided (reproducibility score 0.32). The Maximum Drawdown formula as typeset is mathematically incorrect, and the foundational SAC paper (Haarnoja et al. 2018) is absent from the bibliography despite being the paper's primary algorithm. These are substantive but correctable issues; the paper should not be rejected outright given its breadth of experimentation and genuine methodological contributions.

_Recommendation_: **Major revision** · _Confidence_: 82%

## Strengths

- Large-scale, long-horizon empirical evaluation spanning three geographically distinct equity markets and 23 years of daily data with a consistent walk-forward protocol, enabling meaningful cross-market comparison
- Novel hierarchical Dirichlet policy that explicitly separates the cash-equity allocation decision from intra-equity asset weighting, extending prior flat-policy architectures in a principled way
- Adaptive retraining criterion tied to rolling validation Sharpe ratio provides a practically motivated mechanism to reduce compute while preserving deployment realism
- Macroeconomic regime decomposition (bull/bear/volatile subperiods) reveals that RL strategies add most value in high-uncertainty regimes, a substantively useful finding for practitioners
- Rigorous choice of non-parametric statistics (Newey-West HAC t-tests and Politis-Romano stationary block bootstrap) appropriate for autocorrelated, heavy-tailed financial return series
- Cross-market ensemble analysis quantifies geographic diversification benefits and the LSTM-1 ensemble alpha on Euro Stoxx 50 represents one of the stronger empirical results in the paper
- Broad and well-contextualized literature review covering foundational MVO, backtest-overfitting concerns, and recent DRL portfolio literature

## Weaknesses

- The Nikkei 225 Buy-and-Hold benchmark uses the iShares MSCI Japan ETF (EWJ), which tracks the MSCI Japan Index, not the Nikkei 225; composition and weighting methodologies differ materially, potentially inflating apparent Nikkei B&H underperformance throughout the regime analysis
- Alpha-significance claims for Euro Stoxx 50 are based on uncorrected one-sided p-values across at least 15 simultaneous hypotheses; only LSTM-2 (p=0.012) survives a Holm step-down, and none survive Bonferroni, making the 'partial confirmation' framing fragile
- The same one-year validation window is used simultaneously for hyperparameter selection, the adaptive retraining trigger, and the IR2 threshold θ_k, creating overlapping selection bias that inflates apparent out-of-sample performance—a concern the authors acknowledge via Bailey et al. but do not quantify
- Transaction costs are set at 2 bps (commissions only), omitting bid-ask spread and market impact; for daily-rebalanced portfolios with 50–150% annual turnover, realistic all-in costs of 5–20 bps would likely erode the small Euro Stoxx 50 alphas—no sensitivity table is provided
- No source code, trained models, or data snapshots are released; Bloomberg constituent records are subscription-restricted and yfinance snapshots are not pinned, making independent replication effectively impossible (reproducibility score 0.32)
- The Maximum Drawdown formula as typeset is mathematically degenerate (inner index t does not appear in the integrand), potentially contaminating all reported MD and derived IR2 values
- The foundational SAC algorithm paper (Haarnoja et al. 2018) is not cited despite being the paper's primary model; the early DRL portfolio benchmark (Jiang et al. 2017) is also absent
- Reward function scaling coefficients (×1000, ×100) and penalty weights (λ_TO=0.003, λ_conc ∈ {0, 0.1, 0.5}) are heuristic with no sensitivity analysis justifying the chosen values
- The adaptive retraining threshold uses std of ≤5 observations (≤4 d.f.), and neither the retrain frequency per fold nor sensitivity to the 0.5 coefficient is reported, leaving the computational-savings claim unquantified
- Ensemble IR2 improvements are partly mechanical (variance reduction from averaging three weakly-correlated streams) rather than pure alpha; the paper does not decompose the two effects or compare against a passive Buy-and-Hold ensemble

## Open Questions

- After replacing EWJ with a Nikkei 225-tracking vehicle (e.g., 1321.T or the equal-weighted constituent average), do the Nikkei regime-analysis conclusions and the B&H underperformance narrative survive?
- When family-wise error rate correction (Holm or Romano-Wolf stepM) is applied to the alpha regression p-values across all markets and strategies, how many significant results remain, and does the Euro Stoxx 50 outperformance claim hold?
- Were the reported Maximum Drawdown and IR2 values computed using the correctly implemented peak-to-trough formula, or using the formula as typeset in the manuscript? If the latter, by how much do the values change after correction?
- What is the full transaction-cost sensitivity of the Euro Stoxx 50 alpha (ARC, IR2, p-value) at 5, 10, and 20 bps all-in costs, and are strategies retrained under those higher cost assumptions or only evaluated post hoc?
- How often (fraction of folds, per market) does the adaptive retraining criterion actually trigger retraining versus reuse of the existing model, and what happens to performance when the coefficient 0.5 in θ_k is replaced by 0 or 1.0?
- Can the authors release source code, random seeds, fold-by-fold selected hyperparameters, and a static constituent-ticker snapshot to enable independent replication without a Bloomberg subscription?

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
      "explanation": "Cited as the basis for using walk-forward optimization, a core validation technique in this study.",
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
      "explanation": "Provides the methodological definition for Maximum Loss Duration (MLD) used in the performance evaluation.",
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
      "explanation": "Cited alongside michankow2022lstm for performance metrics standards used in the methodology.",
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
      "explanation": "Foundational work for modern portfolio optimization (MVO) discussed in the literature review.",
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
      "explanation": "Provides a critique of MVO concentration issues, motivating the shift toward predictive modeling.",
      "notes": null,
      "relevance": "high",
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
      "explanation": "Modern application of MVO using machine learning forecasts, representing the state of the art in the literature review.",
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
        "url": null,
        "venue": "Neurocomputing",
        "year": 2003
      },
      "exists": null,
      "explanation": "Early evidence of SVM superiority over ANNs for index direction prediction, cited in the literature review.",
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
        "url": null,
        "venue": "arXiv preprint",
        "year": 2016
      },
      "exists": null,
      "explanation": "Illustrates the use of Random Forests for capturing complex patterns in stock market investing.",
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
        "url": null,
        "venue": "Research in International Business and Finance",
        "year": 2023
      },
      "exists": null,
      "explanation": "Explores SVM and Bayesian GLM in global stock market trading, providing context for ML applications.",
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
      "explanation": "Provides the mathematical framework for backtest overfitting, a critical methodological consideration for the study's walk-forward design.",
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
      "explanation": "Discusses failure modes of ML in finance, proposing walk-forward backtesting and deflated Sharpe ratios as solutions.",
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
      "explanation": "Provides an early benchmark for RNNs in capturing non-stationary stock price dynamics.",
      "notes": null,
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
        "url": null,
        "venue": "Journal of Big Data",
        "year": 2025
      },
      "exists": null,
      "explanation": "Demonstrates feature extraction with supervised autoencoders, informing the study's approach to data labeling.",
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
      "explanation": "Gold standard reference for LSTMs in predicting S&P 500 constituents through long-range historical interactions.",
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
      "explanation": "Granular analysis of LSTM architectures in algorithmic trading, cited to support classification-based outperformance.",
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
      "explanation": "Develops a hybrid LSTM-ARIMA model, providing comparative performance context for the current study's LSTM agents.",
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
        "venue": "arXiv preprint",
        "year": 2025
      },
      "exists": null,
      "explanation": "Applies Informer (attention mechanism) architecture to high-frequency data, relevant to the Transformer-based policy comparison.",
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
      "explanation": "Survey paper that contrasts RL with classical stochastic control, cited to justify the study's hierarchical policy structure.",
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
      "explanation": "Introduced the Direct Reinforcement (DR) approach, a foundational methodology for financial stochastic control.",
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
      "explanation": "Proposes a recurrent deep neural network framework for real-time financial trading, combining deep learning with RL.",
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
        "venue": "arXiv preprint",
        "year": 2025
      },
      "exists": null,
      "explanation": "Recent extension of deep hedging literature using TD3 agents, providing current research context.",
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
      "explanation": "Proposes a DRL framework enhanced by cluster embedding, cited in the literature review for technical advancements.",
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
        "venue": "arXiv preprint",
        "year": 2021
      },
      "exists": null,
      "explanation": "Introduces the FinRL-Meta framework for data-driven DRL, providing a key environment for comparative finance research.",
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
        "url": null,
        "venue": "Quantitative Finance",
        "year": 2019
      },
      "exists": null,
      "explanation": "Foundational paper for the deep hedging framework in the presence of market frictions.",
      "notes": null,
      "relevance": "high",
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
      "explanation": "Introduced the RSRRL model for regime-switching reinforcement learning, providing precedent for the study's regime analysis.",
      "notes": null,
      "relevance": "high",
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
      "explanation": "Introduces DRL for option replication under market frictions, paralleling the study's inclusion of costs and constraints.",
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
      "explanation": "Formulates stock trading as a POMDP integrating allocation and prediction, a direct methodological relative.",
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
      "explanation": "Incorporates market impact into DRL for trade execution, relevant to the study's discussion of frictions.",
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
      "explanation": "Proposes an ensemble DRL strategy, providing a comparative foundation for the multi-market ensemble used in this study.",
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
      "explanation": "Formulates portfolio optimization as a CMDP, relevant to the constrained SAC framework of this study.",
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
      "explanation": "Applies a DQN framework with experience replay to portfolio optimization, providing a benchmark for policy interaction.",
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
      "explanation": "Proposed DeepBreath framework, cited as a key DRL approach combining feature extraction with policy learning.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2024.10101",
        "authors": [
          "Jiang, Yifu",
          "Olmo, Jose",
          "Atwi, Majed"
        ],
        "doi": "10.1016/j.gfj.2024.101016",
        "key": "JIANG2024101016",
        "raw": "JIANG2024101016: author = {Jiang, Yifu and Olmo, Jose and Atwi, Majed}, title = {Deep reinforcement learning for portfolio selection}, journal = {Global Finance Journal}, volume = {62}, pages = {101016}, year = {2024}, publisher = {Elsevier}, issn = {1044-0283}, doi = {10.1016/j.gfj.2024.101016}",
        "title": "Deep reinforcement learning for portfolio selection",
        "url": null,
        "venue": "Global Finance Journal",
        "year": 2024
      },
      "exists": null,
      "explanation": "Proposes a model-free DRL framework incorporating transaction costs and risk aversion into the reward function.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Sterling, Helena J.",
          "Thorne, Marcus V."
        ],
        "doi": null,
        "key": "sterling2026deep",
        "raw": "sterling2026deep: author = {Sterling, Helena J. and Thorne, Marcus V.}, title = {Deep Reinforcement Learning for Dynamic Portfolio Optimization in Financial Markets}, journal = {International Journal of Artificial Intelligence Research}, volume = {1}, number = {1}, year = {2026}, publisher = {ISI Press}",
        "title": "Deep Reinforcement Learning for Dynamic Portfolio Optimization in Financial Markets",
        "url": null,
        "venue": "International Journal of Artificial Intelligence Research",
        "year": 2026
      },
      "exists": null,
      "explanation": "Recent work emphasizing DRL as an adaptive alternative to static allocation in non-linear environments.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2024.12780",
        "authors": [
          "Cheng, Li-Chen",
          "Sun, Jian-Shiou"
        ],
        "doi": "10.1016/j.neucom.2024.127800",
        "key": "cheng2024multiagent",
        "raw": "cheng2024multiagent: author = {Cheng, Li-Chen and Sun, Jian-Shiou}, title = {Multiagent-based deep reinforcement learning framework for multi-asset adaptive trading and portfolio management}, journal = {Neurocomputing}, volume = {594}, pages = {127800}, year = {2024}, publisher = {Elsevier}, issn = {0925-2312}, doi = {10.1016/j.neucom.2024.127800}",
        "title": "Multiagent-based deep reinforcement learning framework for multi-asset adaptive trading and portfolio management",
        "url": null,
        "venue": "Neurocomputing",
        "year": 2024
      },
      "exists": null,
      "explanation": "Multi-agent DRL framework where individual agents operate on separate assets, relevant to the hierarchical policy discussion.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Millea, Adrian"
        ],
        "doi": "10.3390/analytics2030031",
        "key": "analytics2030031",
        "raw": "analytics2030031: author = {Millea, Adrian}, title = {Hierarchical Model-Based Deep Reinforcement Learning for Single-Asset Trading}, journal = {Analytics}, volume = {2}, number = {3}, pages = {560--576}, year = {2023}, publisher = {MDPI}, issn = {2813-2203}, doi = {10.3390/analytics2030031}",
        "title": "Hierarchical Model-Based Deep Reinforcement Learning for Single-Asset Trading",
        "url": null,
        "venue": "Analytics",
        "year": 2023
      },
      "exists": null,
      "explanation": "Hierarchical DRL framework for trading, providing a model-based contrast to the study's model-free approach.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Hao, Zheng",
          "Zhang, Haowei",
          "Zhang, Yipu"
        ],
        "doi": "10.3390/jrfm16030201",
        "key": "jrfm16030201",
        "raw": "jrfm16030201: author = {Hao, Zheng",
        "title": "Stock Portfolio Management by Using Fuzzy Ensemble Deep Reinforcement Learning Algorithm",
        "url": null,
        "venue": "Journal of Risk and Financial Management",
        "year": 2023
      },
      "exists": null,
      "explanation": "Fuzzy logic ensemble for DRL in portfolio management, representing an alternative ensemble architecture.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2022.11812",
        "authors": [
          "Shavandi, Ali",
          "Khedmati, Majid"
        ],
        "doi": "10.1016/j.eswa.2022.118124",
        "key": "shavandi2022multi",
        "raw": "shavandi2022multi: author = {Shavandi, Ali and Khedmati, Majid}, title = {A multi-agent deep reinforcement learning framework for algorithmic trading in financial markets}, journal = {Expert Systems with Applications}, volume = {208}, pages = {118124}, year = {2022}, publisher = {Elsevier}, issn = {0957-4174}, doi = {10.1016/j.eswa.2022.118124}",
        "title": "A multi-agent deep reinforcement learning framework for algorithmic trading in financial markets",
        "url": null,
        "venue": "Expert Systems with Applications",
        "year": 2022
      },
      "exists": null,
      "explanation": "Multi-agent DRL framework specialized in distinct trading timeframes, cited to contrast with the study's approach.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Wu, Xing",
          "Chen, Haolei",
          "Wang, Jianjia",
          "Troiano, Luigi",
          "Loia, Vincenzo",
          "Fujita, Hamido"
        ],
        "doi": "10.1016/j.ins.2020.05.066",
        "key": "wu2020adaptive",
        "raw": "wu2020adaptive: author = {Wu, Xing and Chen, Haolei",
        "title": "Adaptive stock trading strategies with deep reinforcement learning methods",
        "url": null,
        "venue": "Information Sciences",
        "year": 2020
      },
      "exists": null,
      "explanation": "Integrates GRUs for feature extraction in DRL trading, relevant to the study's temporal encoder comparison.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Mnih, Volodymyr",
          "Kavukcuoglu, Koray",
          "Silver, David",
          "Rusu, Andrei A.",
          "Veness, Joel",
          "Bellemare, Marc G.",
          "Graves, Alex",
          "Riedmiller, Martin",
          "Fidjeland, Andreas K.",
          "Ostrovski, Georg",
          "others"
        ],
        "doi": "10.1038/nature14236",
        "key": "mnih2015human",
        "raw": "mnih2015human: author = {Mnih, Volodymyr and Kavukcuoglu, Koray and Silver, David and Rusu, Andrei A. and Veness, Joel and Bellemare, Marc G. and Graves, Alex and Riedmiller, Martin and Fidjeland, Andreas K. and Ostrovski, Georg and others}, title = {Human-level control through deep reinforcement learning}, journal = {Nature}, volume = {518}, number = {7540}, pages = {529--533}, year = {2015}, publisher = {Nature Publishing Group}, issn = {0028-0836}, doi = {10.1038/nature14236}",
        "title": "Human-level control through deep reinforcement learning",
        "url": null,
        "venue": "Nature",
        "year": 2015
      },
      "exists": null,
      "explanation": "Foundational paper for DQN, establishing the feasibility of deep neural networks for control policies.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "1707.06347",
        "authors": [
          "Schulman, John",
          "Wolski, Filip",
          "Dhariwal, Prafulla",
          "Radford, Alec",
          "Klimov, Oleg"
        ],
        "doi": "10.48550/arXiv.1707.06347",
        "key": "schulman2017proximal",
        "raw": "schulman2017proximal: author = {Schulman, John and Wolski, Filip and Dhariwal, Prafulla and Radford, Alec and Klimov, Oleg}, title = {Proximal policy optimization algorithms}, journal = {arXiv preprint arXiv:1707.06347}, year = {2017}, eprint = {1707.06347}, archivePrefix = {arXiv}, primaryClass = {cs.LG}, doi = {10.48550/arXiv.1707.06347}",
        "title": "Proximal policy optimization algorithms",
        "url": null,
        "venue": "arXiv preprint",
        "year": 2017
      },
      "exists": null,
      "explanation": "Introduced PPO, addressing training instability in policy gradient methods, a critical algorithm in the field.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "López de Prado, Marcos",
          "Simonian, Joseph",
          "Fabozzi, Francesco A.",
          "Fabozzi, Frank J."
        ],
        "doi": "10.1007/s10479-024-06257-1",
        "key": "lopez2025enhancing",
        "raw": "lopez2025enhancing: author = {{L\\'opez de Prado}, Marcos and Simonian, Joseph and Fabozzi, Francesco A. and Fabozzi, Frank J.}, title = {Enhancing {M}arkowitz's portfolio selection paradigm with machine learning}, journal = {Annals of Operations Research}, volume = {346}, number = {1}, pages = {319--340}, year = {2025}, publisher = {Springer}, issn = {0254-5330}, doi = {10.1007/s10479-024-06257-1}",
        "title": "Enhancing Markowitz's portfolio selection paradigm with machine learning",
        "url": null,
        "venue": "Annals of Operations Research",
        "year": 2025
      },
      "exists": null,
      "explanation": "Investigates incorporating ML into MVO for alpha generation and risk management, cited in the literature review.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Chaweewanchon, Apichat",
          "Chaysiri, Rujira"
        ],
        "doi": "10.3390/ijfs10030064",
        "key": "chaweewanchon2022markowitz",
        "raw": "chaweewanchon2022markowitz: author = {Chaweewanchon, Apichat and Chaysiri, Rujira}, title = {{M}arkowitz mean-variance portfolio optimization with predictive stock selection using machine learning}, journal = {International Journal of Financial Studies}, volume = {10}, number = {3}, pages = {64}, year = {2022}, publisher = {MDPI}, issn = {2227-7072}, doi = {10.3390/ijfs10030064}",
        "title": "Markowitz mean-variance portfolio optimization with predictive stock selection using machine learning",
        "url": null,
        "venue": "International Journal of Financial Studies",
        "year": 2022
      },
      "exists": null,
      "explanation": "Hybrid MVO framework integrating ML stock prediction, cited in the literature review.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Newey, Whitney K.",
          "West, Kenneth D."
        ],
        "doi": "10.2307/1913610",
        "key": "NEWEY_WEST",
        "raw": "NEWEY_WEST: author = {Newey, Whitney K. and West, Kenneth D.}, title = {A Simple, Positive Semi-Definite, Heteroskedasticity and Autocorrelation Consistent Covariance Matrix}, journal = {Econometrica}, volume = {55}, number = {3}, pages = {703--708}, year = {1987}, publisher = {Wiley; Econometric Society}, issn = {0012-9682}, doi = {10.2307/1913610}",
        "title": "A Simple, Positive Semi-Definite, Heteroskedasticity and Autocorrelation Consistent Covariance Matrix",
        "url": null,
        "venue": "Econometrica",
        "year": 1987
      },
      "exists": null,
      "explanation": "Introduced the HAC estimator, used in this study to obtain robust standard errors for performance significance.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "1994.10476",
        "authors": [
          "Politis, Dimitris N.",
          "Romano, Joseph P."
        ],
        "doi": "10.1080/01621459.1994.10476870",
        "key": "POLITIS",
        "raw": "POLITIS: author = {Politis, Dimitris N. and Romano, Joseph P.}, title = {The Stationary Bootstrap}, journal = {Journal of the American Statistical Association}, volume = {89}, number = {428}, pages = {1303--1313}, year = {1994}, publisher = {Taylor \\& Francis}, issn = {0162-1459}, doi = {10.1080/01621459.1994.10476870}",
        "title": "The Stationary Bootstrap",
        "url": null,
        "venue": "Journal of the American Statistical Association",
        "year": 1994
      },
      "exists": null,
      "explanation": "Introduced the stationary block bootstrap procedure used to assess significance without parametric assumptions.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "DeMiguel, Victor",
          "Garlappi, Lorenzo",
          "Uppal, Raman"
        ],
        "doi": "10.1093/rfs/hhm075",
        "key": "DE_MIGEUL",
        "raw": "DE_MIGEUL: author = {DeMiguel, Victor and Garlappi, Lorenzo and Uppal, Raman}, title = {Optimal Versus Naive Diversification: How Inefficient is the 1/{N} Portfolio Strategy?}, journal = {The Review of Financial Studies}, volume = {22}, number = {5}, pages = {1915--1953}, year = {2009}, publisher = {Oxford University Press}, issn = {0893-9454}, doi = {10.1093/rfs/hhm075}",
        "title": "Optimal Versus Naive Diversification: How Inefficient is the 1/N Portfolio Strategy?",
        "url": null,
        "venue": "The Review of Financial Studies",
        "year": 2009
      },
      "exists": null,
      "explanation": "Proves the 1/N strategy is difficult to outperform, cited throughout the study as a key benchmark and explanation for RL's relative performance.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Kabir, Md R.",
          "Bhadra, Dipayan",
          "Ridoy, Moinul",
          "Milanova, Mariofanna"
        ],
        "doi": "10.3390/sci7010007",
        "key": "Ding2025",
        "raw": "Ding2025: author = {Kabir, Md R. and Bhadra, Dipayan and Ridoy, Moinul and Milanova, Mariofanna}, title = {{LSTM--Transformer}-Based Robust Hybrid Deep Learning Model for Financial Time Series Forecasting}, journal = {Sci}, volume = {7}, number = {1}, pages = {7}, year = {2025}, publisher = {MDPI}, issn = {2413-4155}, doi = {10.3390/sci7010007}",
        "title": "LSTM--Transformer-Based Robust Hybrid Deep Learning Model for Financial Time Series Forecasting",
        "url": null,
        "venue": "Sci",
        "year": 2025
      },
      "exists": null,
      "explanation": "Argues for Transformer outperformance over LSTMs, cited to support the study's comparison of these encoders.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    }
  ],
  "missing_references": [
    {
      "reason": "This is the seminal paper that introduced the Soft Actor-Critic algorithm used as the primary model in this study. It should be explicitly cited in the methodology or literature review.",
      "title": "Soft Actor-Critic: Off-Policy Maximum Entropy Deep Reinforcement Learning with a Stochastic Actor (Haarnoja et al., 2018)"
    },
    {
      "reason": "Given the study's focus on deep reinforcement learning for portfolio management, this early foundational work using CNNs for portfolio allocation is a highly relevant predecessor that is notably absent.",
      "title": "A Deep Reinforcement Learning Framework for the Financial Portfolio Management Problem (Jiang et al., 2017)"
    },
    {
      "reason": "Since the paper discusses turnover penalties and transaction costs within an RL framework, this work on the 'Deep Dow' approach to differentiable portfolio optimization would be very relevant.",
      "title": "Deep Dow: Differentiable Portfolio Optimization (Schuchter, 2020)"
    }
  ],
  "summary": "The paper provides a comprehensive review of classical and modern portfolio optimization techniques, with a strong focus on the shift towards deep reinforcement learning. It correctly identifies foundational works in MVO (Markowitz), backtest overfitting (Bailey/López de Prado), and the efficiency of naive diversification (DeMiguel). The bibliography is technically sound and directly supports the architectural choices and performance benchmarks used. However, the seminal SAC paper (Haarnoja 2018) is missing from the explicit citation list despite being the core algorithm used, and earlier DRL portfolio benchmarks (Jiang 2017) are also omitted."
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.82,
  "questions": [
    "After replacing EWJ with a Nikkei 225-tracking vehicle (e.g., 1321.T or the equal-weighted constituent average), do the Nikkei regime-analysis conclusions and the B&H underperformance narrative survive?",
    "When family-wise error rate correction (Holm or Romano-Wolf stepM) is applied to the alpha regression p-values across all markets and strategies, how many significant results remain, and does the Euro Stoxx 50 outperformance claim hold?",
    "Were the reported Maximum Drawdown and IR2 values computed using the correctly implemented peak-to-trough formula, or using the formula as typeset in the manuscript? If the latter, by how much do the values change after correction?",
    "What is the full transaction-cost sensitivity of the Euro Stoxx 50 alpha (ARC, IR2, p-value) at 5, 10, and 20 bps all-in costs, and are strategies retrained under those higher cost assumptions or only evaluated post hoc?",
    "How often (fraction of folds, per market) does the adaptive retraining criterion actually trigger retraining versus reuse of the existing model, and what happens to performance when the coefficient 0.5 in θ_k is replaced by 0 or 1.0?",
    "Can the authors release source code, random seeds, fold-by-fold selected hyperparameters, and a static constituent-ticker snapshot to enable independent replication without a Bloomberg subscription?"
  ],
  "recommendation": "major_revision",
  "strengths": [
    "Large-scale, long-horizon empirical evaluation spanning three geographically distinct equity markets and 23 years of daily data with a consistent walk-forward protocol, enabling meaningful cross-market comparison",
    "Novel hierarchical Dirichlet policy that explicitly separates the cash-equity allocation decision from intra-equity asset weighting, extending prior flat-policy architectures in a principled way",
    "Adaptive retraining criterion tied to rolling validation Sharpe ratio provides a practically motivated mechanism to reduce compute while preserving deployment realism",
    "Macroeconomic regime decomposition (bull/bear/volatile subperiods) reveals that RL strategies add most value in high-uncertainty regimes, a substantively useful finding for practitioners",
    "Rigorous choice of non-parametric statistics (Newey-West HAC t-tests and Politis-Romano stationary block bootstrap) appropriate for autocorrelated, heavy-tailed financial return series",
    "Cross-market ensemble analysis quantifies geographic diversification benefits and the LSTM-1 ensemble alpha on Euro Stoxx 50 represents one of the stronger empirical results in the paper",
    "Broad and well-contextualized literature review covering foundational MVO, backtest-overfitting concerns, and recent DRL portfolio literature"
  ],
  "summary": "This paper applies Soft Actor-Critic (SAC) reinforcement learning with a novel hierarchical Dirichlet allocation policy to dynamic portfolio management across three global equity markets (Nasdaq-100, Nikkei 225, Euro Stoxx 50) over a 23-year walk-forward horizon. The work introduces an adaptive retraining criterion, compares LSTM and Transformer temporal encoders, conducts a macroeconomic regime decomposition, and aggregates results into a cross-market ensemble. The methodology is ambitious and the empirical scope is commendable, but five specialist reviewers collectively identify multiple major correctness, reproducibility, and statistical integrity problems that must be addressed before the results can be accepted as presented. The most serious issues are: (1) the Nikkei 225 Buy-and-Hold benchmark is mis-specified as the MSCI Japan ETF (EWJ), potentially invalidating the Nikkei regime analysis; (2) alpha-significance p-values are reported without multiple-testing correction across 15+ simultaneous hypotheses, overstating the evidence for outperformance; (3) the same validation window is used for both hyperparameter selection and the adaptive retraining trigger, introducing unquantified selection bias; (4) transaction costs are set at 2 bps and no sensitivity robustness is provided for the small alphas found on Euro Stoxx 50; and (5) no source code or data snapshots are provided (reproducibility score 0.32). The Maximum Drawdown formula as typeset is mathematically incorrect, and the foundational SAC paper (Haarnoja et al. 2018) is absent from the bibliography despite being the paper's primary algorithm. These are substantive but correctable issues; the paper should not be rejected outright given its breadth of experimentation and genuine methodological contributions.",
  "weaknesses": [
    "The Nikkei 225 Buy-and-Hold benchmark uses the iShares MSCI Japan ETF (EWJ), which tracks the MSCI Japan Index, not the Nikkei 225; composition and weighting methodologies differ materially, potentially inflating apparent Nikkei B&H underperformance throughout the regime analysis",
    "Alpha-significance claims for Euro Stoxx 50 are based on uncorrected one-sided p-values across at least 15 simultaneous hypotheses; only LSTM-2 (p=0.012) survives a Holm step-down, and none survive Bonferroni, making the 'partial confirmation' framing fragile",
    "The same one-year validation window is used simultaneously for hyperparameter selection, the adaptive retraining trigger, and the IR2 threshold θ_k, creating overlapping selection bias that inflates apparent out-of-sample performance—a concern the authors acknowledge via Bailey et al. but do not quantify",
    "Transaction costs are set at 2 bps (commissions only), omitting bid-ask spread and market impact; for daily-rebalanced portfolios with 50–150% annual turnover, realistic all-in costs of 5–20 bps would likely erode the small Euro Stoxx 50 alphas—no sensitivity table is provided",
    "No source code, trained models, or data snapshots are released; Bloomberg constituent records are subscription-restricted and yfinance snapshots are not pinned, making independent replication effectively impossible (reproducibility score 0.32)",
    "The Maximum Drawdown formula as typeset is mathematically degenerate (inner index t does not appear in the integrand), potentially contaminating all reported MD and derived IR2 values",
    "The foundational SAC algorithm paper (Haarnoja et al. 2018) is not cited despite being the paper's primary model; the early DRL portfolio benchmark (Jiang et al. 2017) is also absent",
    "Reward function scaling coefficients (×1000, ×100) and penalty weights (λ_TO=0.003, λ_conc ∈ {0, 0.1, 0.5}) are heuristic with no sensitivity analysis justifying the chosen values",
    "The adaptive retraining threshold uses std of ≤5 observations (≤4 d.f.), and neither the retrain frequency per fold nor sensitivity to the 0.5 coefficient is reported, leaving the computational-savings claim unquantified",
    "Ensemble IR2 improvements are partly mechanical (variance reduction from averaging three weakly-correlated streams) rather than pure alpha; the paper does not decompose the two effects or compare against a passive Buy-and-Hold ensemble"
  ]
}
```

### novelty (`gemini-3-flash-preview`) — status: `pass`

```json
{
  "confidence": 0.95,
  "missing_prior_art": [
    {
      "reason": "The paper relies on a momentum-based top-k filtering step (momentum pre-selection) that is exogenous to the RL agent. While it cites @DE_MIGEUL for the equal-weight benchmark, it does not extensively discuss literature on hybrid filtering-optimization pipelines in the specific context of DRL action space reduction, which is a common practice in high-dimensional financial RL.",
      "title": "Hybrid Filtering-Optimization for High-Dimensional Portfolio RL"
    }
  ],
  "novelty_score": 0.65,
  "related_work": [
    {
      "citation_key": "Hambly_2023",
      "delta": "The paper moves from the broad survey of RL in finance to a specific, multi-market empirical implementation using SAC and a hierarchical Dirichlet policy.",
      "relation": "builds_on",
      "title": "Recent advances in reinforcement learning in finance"
    },
    {
      "citation_key": "yang2020deep",
      "delta": "While Yang et al. focus on an ensemble of different RL algorithms (PPO, A2C, DDPG) for a single portfolio, this paper focuses on an ensemble of strategy returns across three geographically distinct equity indices.",
      "relation": "orthogonal",
      "title": "Deep reinforcement learning for automated stock trading: An ensemble strategy"
    },
    {
      "citation_key": "analytics2030031",
      "delta": "Unlike the hierarchical model-based approach for single-asset trading, this paper introduces a hierarchical Dirichlet policy specifically to separate cash-equity allocation from intra-equity asset selection in a multi-asset context.",
      "relation": "builds_on",
      "title": "Hierarchical Model-Based Deep Reinforcement Learning for Single-Asset Trading"
    },
    {
      "citation_key": "DE_MIGEUL",
      "delta": "The paper uses the 1/N benchmark as a primary hurdle and demonstrates that while DRL can match or exceed it in certain regimes (e.g., Euro Stoxx 50), it remains a stringent benchmark that is difficult to beat consistently across all markets.",
      "relation": "prior_art",
      "title": "Optimal Versus Naive Diversification: How Inefficient is the 1/N Portfolio Strategy?"
    },
    {
      "citation_key": "JIANG2024101016",
      "delta": "This paper extends the use of TD3/SAC in high-dimensional markets by adding an adaptive retraining criterion and conducting a systematic regime-based cross-market comparison.",
      "relation": "builds_on",
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
      "description": "No source code, repository, scripts, trained models, or exact implementation artifacts are identified. The SAC environment, preprocessing, walk-forward orchestration, adaptive retraining, and evaluation pipeline would need to be reimplemented from the prose.",
      "severity": "critical"
    },
    {
      "area": "data",
      "description": "Exact reproduction depends on historical index membership records from Bloomberg Terminal Anywhere. Those records are subscription-restricted and no static constituent snapshot or membership dataset is provided.",
      "severity": "major"
    },
    {
      "area": "data",
      "description": "Constituent prices are obtained through yfinance, but no exact downloaded snapshot, ticker mapping, adjustment policy, or data-cleaning outputs are supplied, so later API revisions or missing-history changes may alter results.",
      "severity": "major"
    },
    {
      "area": "hyperparameters",
      "description": "Several important details remain underspecified despite useful parameter tables, including the full candidate hyperparameter grid, fold-by-fold selected configurations, random seeds, exact top-k choices per market/configuration, and config-specific concentration penalties.",
      "severity": "major"
    },
    {
      "area": "evaluation",
      "description": "The paper reports HAC and stationary bootstrap inference but does not fully specify all implementation choices such as bootstrap replication count, block-length selection, Newey-West lag choice, or release the per-period return series needed to verify the tests.",
      "severity": "major"
    },
    {
      "area": "compute",
      "description": "The compute setup is described as an NVIDIA L4 GPU cloud instance, with 14 to 23 hours per walk-forward cycle, so reproducing all folds and markets is feasible but expensive and sensitive to implementation details.",
      "severity": "minor"
    }
  ],
  "confidence": 0.78,
  "data_availability": "restricted",
  "data_url": null,
  "environment": {
    "dependencies": [
      "yfinance API",
      "Bloomberg Terminal Anywhere subscription",
      "Soft Actor-Critic implementation with LSTM and Transformer encoders; exact ML framework and package versions not specified"
    ],
    "hardware": "NVIDIA L4 GPU with 24GB VRAM on a G2-standard cloud instance with 30GB system memory",
    "software": null
  },
  "reproducibility_score": 0.32
}
```

### summary (`claude-haiku-4-5-20251001`) — status: `pass`

```json
{
  "audience": "Quantitative finance researchers, portfolio managers, financial technologists, and machine learning practitioners interested in algorithmic trading and asset allocation",
  "key_contributions": [
    "Unified multi-market evaluation framework applying identical walk-forward optimization procedures across three economically distinct equity markets, enabling direct cross-market comparison",
    "Novel hierarchical Dirichlet policy structure that separates equity-cash allocation from individual asset selection, extending previous flat architectures",
    "Adaptive retraining criterion that selectively updates the model based on rolling validation performance, reducing computational costs while maintaining deployment realism",
    "Systematic macroeconomic regime decomposition showing that RL strategies add most value during periods of elevated uncertainty, not during sustained bull markets",
    "Empirical demonstration that ensemble aggregation across geographic markets improves risk-adjusted performance and quantifies the benefits of global diversification"
  ],
  "plain_language_summary": "This paper tackles the challenge of automatically managing investment portfolios across global equity markets using artificial intelligence. Instead of using traditional mathematical formulas that haven't kept pace with modern markets, the authors apply deep reinforcement learning—a technique where an AI agent learns trading strategies by interacting with historical market data and receiving rewards for profitable decisions. They test this approach on three major stock indices (U.S. Nasdaq-100, Japanese Nikkei 225, and European Euro Stoxx 50) over 23 years of data, comparing five different AI configurations with varying neural network designs and reward structures.\n\nThe results show that the AI-based strategies perform competitively against traditional benchmarks, particularly for European stocks, and excel during volatile market periods when uncertainty is high. However, the findings are mixed: while the AI strategies outperform simple buy-and-hold approaches in some markets and time periods, they don't consistently beat all traditional methods, and statistical proof of superior performance isn't strong across all three markets. The research demonstrates that combining strategies across multiple geographic markets through ensemble methods improves overall performance, validating the conventional wisdom that global diversification reduces portfolio risk.",
  "tldr": "A deep reinforcement learning framework for dynamic portfolio allocation across global equity markets achieves competitive risk-adjusted returns, particularly during periods of market uncertainty, though statistical significance is limited across all markets simultaneously."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `pass`

```json
{
  "claims": [
    {
      "assessment": "supported",
      "claim": "Portfolio allocation is formulated as a Markov Decision Process (S, A, P, r, γ) and addressed with Soft Actor-Critic (SAC) using twin critics, soft target updates, and entropy regularization with fixed α=0.2.",
      "evidence": "The MDP formulation is standard and the SAC description (twin critics, target smoothing τ=0.005, replay buffer, fixed α to stabilize across non-stationary folds) is consistent with Haarnoja et al. 2018. The Markov approximation is explicitly acknowledged and partially mitigated by a 60-day lookback. No internal inconsistency detected.",
      "id": "C1",
      "location": "Section 4 (Theoretical Background) and Section 5.4 (Model Architecture)",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "The reward function combines a log-return term (×1000), an L1 turnover penalty (×100), and a concentration penalty proportional to (HHI − HHI_min) (×100), with HHI = Σ w_i² and HHI_min = 1/N_t.",
      "evidence": "The HHI definition and lower bound 1/N_t are correct. The scaling factors (1000, 100, 100, λ_TO=0.003, λ_conc ∈ {0,0.1,0.5}) are ad hoc and not derived from any sensitivity analysis; the paper offers no justification beyond 'balance their relative magnitudes', so the chosen weights are heuristic.",
      "id": "C2",
      "location": "Section 5.3 (Reward Function), Eq. for r_t",
      "severity": "minor",
      "suggested_fix": "Report a sensitivity analysis of λ_TO, λ_conc and the multiplicative scales (e.g., 1000 vs 100) on out-of-sample IR2 across at least one fold per market, or motivate the scales from an information-theoretic argument."
    },
    {
      "assessment": "incorrect",
      "claim": "Maximum Drawdown is defined as MD(T) = max_{s∈[0,T]} (max_{t∈[0,s]} (R_{i,T} − R_{i,s})) × 100%.",
      "evidence": "As written, the inner max over t∈[0,s] of (R_{i,T} − R_{i,s}) does not depend on t — the expression is independent of the inner index, so the double max collapses and the formula does not encode the standard peak-to-trough drawdown. Moreover, R_{i,T} is a future-dated quantity making the formula non-causal as stated. The conventional MD is max_{s≤T}((V_max(s)−V_s)/V_max(s)) using the running peak of the equity curve up to time s.",
      "id": "C3",
      "location": "Section 5.8 (Performance Metrics), Eq. eq:md",
      "severity": "minor",
      "suggested_fix": "Replace with MD = max_{0≤t≤T} (1 − V_t / max_{0≤s≤t} V_s), or equivalently the largest peak-to-trough decline in the cumulative wealth process. Confirm that reported MD values were computed using the correct formula."
    },
    {
      "assessment": "partially_supported",
      "claim": "The Modified Information Ratio IR2 = IR1 × ARC × sign(ARC)/MD is the primary risk-adjusted criterion.",
      "evidence": "Algebraically the expression yields IR2 = ARC²·|ARC|/(ASD·|ARC|·MD) = |ARC|³·sign(ARC)/(ASD·MD)·... — i.e., it scales as ARC²/(ASD·MD) with the sign of ARC, which is the Slepaczuk/Michańków formulation. The construction is non-standard but internally consistent. However, the metric divides by MD; with the MD formula error in C3 the numerical values are suspect. Also no confidence intervals or sampling distribution for IR2 are reported despite its use as the central decision criterion.",
      "id": "C4",
      "location": "Section 5.8, Eq. eq:ir-starstar",
      "severity": "minor",
      "suggested_fix": "Re-compute IR2 after fixing the MD definition, and report bootstrap standard errors for IR2 alongside the point estimates."
    },
    {
      "assessment": "supported",
      "claim": "Statistical significance of mean-return differences is assessed with Newey–West HAC-adjusted t-tests, and Sharpe/IR2 differences are assessed using Politis–Romano stationary block bootstrap.",
      "evidence": "Both Newey–West (HAC) and Politis–Romano stationary bootstrap are appropriate for daily return series that exhibit autocorrelation, heteroskedasticity, and heavy tails. The choice is standard in the empirical finance literature and the conclusions (no significant mean-difference outperformance) are conservatively interpreted.",
      "id": "C5",
      "location": "Section 6.4 (Statistical Significance)",
      "severity": "info",
      "suggested_fix": "Report the Newey–West truncation lag and the bootstrap block length parameter so the tests are fully reproducible."
    },
    {
      "assessment": "partially_supported",
      "claim": "For EURO STOXX 50, LSTM-1, LSTM-2, LSTM-NC-2 and Transformer exhibit statistically significant positive abnormal returns α at the 10% level (p ∈ {0.0333, 0.0120, 0.0417, 0.0291}), supporting partial confirmation of the central hypothesis.",
      "evidence": "The reported one-sided p-values are uncorrected for multiple testing. Across the three markets and five strategies there are at least 15 simultaneous tests for α>0; a Bonferroni correction would require p<0.10/15 ≈ 0.0067 for global significance at 10%. Only LSTM-2 on EURO STOXX 50 (p=0.0120) survives a less conservative Holm step-down, and none survive Bonferroni. Combined with HAC mean-difference tests being insignificant and bootstrap Δ-Sharpe/Δ-IR2 also being insignificant (Table 7), the 'partial confirmation' claim is fragile.",
      "id": "C6",
      "location": "Section 6.4, Table 8 (Regression-based statistical significance)",
      "severity": "major",
      "suggested_fix": "Either report family-wise error rate-adjusted p-values (Bonferroni, Holm, Romano–Wolf stepM) or false discovery rate-adjusted q-values (Benjamini–Hochberg) for the alpha regressions, and weaken the EURO STOXX 50 outperformance claim accordingly."
    },
    {
      "assessment": "partially_supported",
      "claim": "Walk-forward optimization with 5y train / 1y validation / 1y test, adaptive retraining triggered by validation Sharpe ratio, and tiered hyperparameter selection yields strictly out-of-sample evaluation.",
      "evidence": "The walk-forward structure prevents look-ahead in the price data, but the same one-year validation window is used for (i) hyperparameter selection per fold, (ii) the adaptive retraining trigger, and (iii) the IR2 threshold θ_k. This dual use introduces selection bias that inflates apparent out-of-sample performance, a concern the authors themselves cite via Bailey et al. 2014 but do not quantify. The 'tiered' selection rule (preferring small train-vs-val performance gap) is also informally specified — no explicit tie-break or scoring function is given, making the procedure not fully reproducible.",
      "id": "C7",
      "location": "Section 5.6 (Training and Validation Procedure)",
      "severity": "major",
      "suggested_fix": "Either split validation into a hyperparameter-selection subset and a retraining-trigger subset, or report the Deflated Sharpe Ratio (Bailey & López de Prado 2014) accounting for the number of configurations evaluated. Formalize the tiered selection rule as a single ranking function."
    },
    {
      "assessment": "incorrect",
      "claim": "The iShares MSCI Japan ETF (EWJ) is used as the tradable Buy & Hold benchmark for the Nikkei 225 universe.",
      "evidence": "EWJ tracks the MSCI Japan Index (~250 large- and mid-cap Japanese equities), not the Nikkei 225 (price-weighted index of 225 specific Tokyo-listed large caps). The composition, weighting (MSCI is float-adjusted market-cap, Nikkei is price-weighted), and historical returns differ materially. Treating EWJ as the passive 'Buy & Hold' against a strategy whose universe is the Nikkei 225 constituents conflates two different exposures and likely inflates the apparent underperformance of B&H on Nikkei (which the paper relies on heavily in the regime analysis).",
      "id": "C8",
      "location": "Section 3.1 (Data Description); Section 5.9 (Benchmark Strategies)",
      "severity": "major",
      "suggested_fix": "Replace EWJ with a Nikkei 225-tracking ETF (e.g., 1321.T 'Nikkei 225 iShares Core' or the equal-weighted average of Nikkei 225 constituents themselves) so the benchmark and the investable universe are matched. Re-run the statistical and regime analyses; the 'Nikkei B&H is weak' finding may not survive."
    },
    {
      "assessment": "partially_supported",
      "claim": "Transaction costs are conservatively modeled at 2 bps per unit of turnover, consistent with the lower bound of IBKR institutional commissions.",
      "evidence": "2 bps captures explicit commissions only; it omits bid-ask spread, market impact, and short-term price drift, which for daily-rebalanced equity portfolios across Nikkei 225 mid-caps and Euro Stoxx names typically dominate commissions (5–20 bps per round-trip is more realistic). The reported turnover is on the order of 50–150% annually for several configurations; even a 5 bps total cost would erode the small alphas (~2 bps/day → ~5%/yr) the paper finds significant on EURO STOXX 50. The authors flag this as a limitation but do not quantify sensitivity.",
      "id": "C9",
      "location": "Section 5.5 (Model Configurations), Table 6 and surrounding text",
      "severity": "major",
      "suggested_fix": "Provide a robustness table showing ARC, IR2, and alpha p-values at total transaction costs of {2, 5, 10, 20} bps per unit of turnover. State whether strategies are merely evaluated under higher costs, or also retrained with higher cost-sensitive rewards."
    },
    {
      "assessment": "supported",
      "claim": "Top-k cross-sectional momentum pre-selection (k∈{10,20,30} on 120-day returns) is exogenous to the agent and does not introduce look-ahead bias.",
      "evidence": "The momentum measure uses only past prices P_{i,t-120} to P_{i,t} and the ranking is restricted to assets tradable at time t. There is no forward-looking information used. The constant-k assumption also keeps the encoder input dimension fixed, eliminating the need for padding or masking heuristics that could leak information.",
      "id": "C10",
      "location": "Section 5.1 (State Representation), Eq. m_{i,t}^{(120)}",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "The ensemble portfolio is constructed as the equal-weight cross-sectional average of the three market-level strategy returns, and the LSTM_1 ensemble's IR2=0.41 vs. benchmark IR2=0.34 demonstrates a benefit of geographic diversification.",
      "evidence": "The arithmetic average of three weakly-correlated return streams will mechanically reduce volatility by roughly √3 if the streams are uncorrelated, so an IR2 increase is expected from variance reduction alone and does not by itself imply diversification adds 'alpha'. The corresponding HAC mean-difference and bootstrap Δ-Sharpe/Δ-IR2 tests for the ensemble are not significant (Table 9, p=0.49, 0.83 etc.). The LSTM_1 and LSTM_2 ensemble alphas are significant at the 10% level (p=0.0496, 0.0481) but again uncorrected for multiple testing.",
      "id": "C11",
      "location": "Section 8 (Ensemble Total Fund)",
      "severity": "minor",
      "suggested_fix": "Decompose the IR2 improvement into (a) volatility reduction predictable from cross-market correlation structure vs. (b) residual alpha, and compare the ensemble against a Buy & Hold ensemble of the three benchmarks rather than the average benchmark to assess whether RL-specific ensembling adds value over passive diversification."
    },
    {
      "assessment": "partially_supported",
      "claim": "The adaptive retraining threshold θ_k = median(S_{k-m..k-1}) − 0.5·std(S_{k-m..k-1}) reduces computational cost while preserving deployment realism.",
      "evidence": "The threshold formula is well-defined for k ≥ 3 and the cold-start convention is explicit. However, std of up to m=5 values has very few degrees of freedom (≤4) and the coefficient 0.5 is unmotivated. The paper does not report how often retraining is actually triggered per fold or per market, so the computational savings claim is unquantified, and an unstable θ_k may either retrain almost always (negating savings) or almost never (degrading performance).",
      "id": "C12",
      "location": "Section 5.6.2, Eq. eq:retrain_threshold",
      "severity": "minor",
      "suggested_fix": "Report the empirical retrain frequency per fold per market, and provide a sensitivity check varying the coefficient (e.g., 0, 0.5, 1.0) and the window m."
    },
    {
      "assessment": "partially_supported",
      "claim": "The dataset is described as spanning 2 January 2003 to 13 March 2026 with daily frequency.",
      "evidence": "The end date 13 March 2026 lies in the future relative to the manuscript's content (the paper appears to be written in 2025-2026). Either this is a typo for 2024/2025 or the data was extended at submission time. Either way the claim is plausible but should be matched with the actual file timestamps cited.",
      "id": "C13",
      "location": "Section 3.1 (Data Description); abstract",
      "severity": "info",
      "suggested_fix": "Confirm the data cutoff date and the date the manuscript was finalized; ensure the test fold ending in 2026 has at least one full calendar year of returns to support the regime-analysis subperiod 2020–2026."
    }
  ],
  "confidence": 0.72,
  "overall_correctness": "mostly_sound"
}
```

## Corrections

<!-- corrections-section: rendered from corrections table; empty on first publish -->
_No corrections have been recorded._

## Bibliography

_No bibliography extracted._

