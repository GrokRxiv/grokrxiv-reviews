# Activation Functions, Statistics and Learning of Higher-Order Interactions in Restricted Boltzmann Machines

GrokRxiv review of [arXiv:2605.19178](https://arxiv.org/abs/2605.19178) · `cond-mat.dis-nn`

_Authors_: Giovanni di Sarra, Yasser Roudi

## TL;DR

This paper presents a novel analytical framework for characterizing how the choice of activation function in Restricted Boltzmann Machines (RBMs) determines the order-structure of the induced multi-spin interactions representable by the model. Four activation functions are systematically compared — Linear, Step, ReLU, and Exponential — via closed-form expressions for the ensemble-average interaction moments, fluctuation statistics, and critical transition loci in the Gaussian weight ensemble. The central finding is that Exponential activations are uniquely capable of generating dominant higher-order (non-decaying) interaction models, while Linear, Step, and ReLU activations are confined to pairwise-dominant (decaying) regimes. The analytical derivations are largely correct and internally consistent (overall_correctness: mostly_sound, confidence 0.70), novelty is rated significant (score 0.75, confidence 0.80), and a public GitHub repository is provided. However, the recommendation gate is triggered: the reproducibility specialist flagged a critical proof-as-code gap — the headline analytical claims (interaction moment formulas, covariance expressions, transition conditions) are supported only by manuscript derivations without an accompanying executable verification artifact. Three additional major reproducibility gaps were flagged: missing commit hash and per-figure script entry points, unspecified random seeds, and absent optimizer sweep documentation. Several minor technical issues also require attention: a confirmed typographic error in the s=2 Exponential variance specialization (C4), quantitative agreement metrics missing from Figs. 6-10 (C9), narrow empirical support for training conclusions (C11, C13), and an insufficiently general three-body representation result (C12). The citation record is strong but would benefit from foundational additions (Hinton 2002 CD, Barra et al. 2018). The recommendation is major_revision, contingent on closing the proof-as-code gap and addressing the reproducibility deficits.

_Recommendation_: **Major revision** · _Confidence_: 78%

## Strengths

- Novel comparative analytical framework that derives closed-form ensemble statistics (mean, covariance, fluctuation ratio) for four activation functions, providing a unified characterization of RBM representational capacity
- Analytical results for the Exponential activation — especially the critical line w_0 + sigma^2/2 = log 2 and the Delta^Exp_s = 1 boundary — are rigorously derived and internally consistent, with correct combinatorial identities confirmed by the technical reviewer
- Identification of the Exponential activation as the unique function enabling non-decaying higher-order interaction models is a significant conceptual contribution with practical implications for activation-function selection
- Public code repository at https://github.com/gdisarra/RBM_nonlinearity is provided, partially satisfying the artifact requirement for the numerical and simulation claims
- Citation profile is current and comprehensive, covering the statistical physics literature (replica theory, mean-field approaches, training regimes) alongside relevant ML overparameterization and simplicity-bias results through 2025
- The inductive-bias framing — connecting activation choice to the order-structure of learnable data correlations — is clearly articulated and bridges theoretical and practical perspectives

## Weaknesses

- [Reproducibility, critical] No executable verification artifact (e.g., notebooks/verify_interaction_moments.ipynb or a symbolic-algebra script) is provided for the headline analytical claims about interaction moments, covariance formulas, and decaying/non-decaying transition conditions; the derivations are manuscript-only
- [Reproducibility, major] The GitHub repository is cited without a pinned commit hash, script entry points, or a reproducibility manifest mapping figures to commands, making the numerical artifact difficult to use independently
- [Reproducibility, major] Exact random seeds and serialized parameter files for the synthetic lattice-gas and Gaussian RBM ensemble experiments are not specified, preventing bit-for-bit reproduction
- [Reproducibility, major] Full optimizer details, stopping criteria, sweep grids, and activation-specific training settings are not centrally documented; only partial per-figure hyperparameters appear in captions
- [Technical, minor] Confirmed typographic error in the s=2 specialization of the Exponential covariance formula: the prefactor should be gamma_1^4 (not gamma_2^4) and the exponent should be gamma_1^{-4} (not gamma_1^4), inconsistent with the general Eq. exp_exact2 (claim C4)
- [Technical, minor] Training experiments rest on very small systems (N=3, M=4 in main figures) and a single hyperparameter point (w_0=0.3, g=3) for the Exponential non-decaying learning claim; generality of the conclusion is unquantified
- [Technical, minor] The post-training applicability of the Gaussian i.i.d. ensemble formula is assumed but not validated: empirical weight moments and correlation structure of trained networks are not reported
- [Technical, minor] The claim that an RBM can represent an arbitrary three-body interaction model is demonstrated only for T=0.5 with N=3, M=4 by numerical root-finding; no analytical existence argument or sweep over T is provided
- [Citation] Missing foundational references: Hinton (2002) on Contrastive Divergence training and Barra et al. (2018) on phase transitions in RBMs with generic priors, both directly relevant to the paper's context and discussion

## Revision Targets

- [ ] **Manuscript: reproducibility appendix**
  - Location: `corrections/2605.19178/paper.tex` at `reproducibility appendix`
  - Evidence: Proof-as-code gap: the headline analytical characterization of induced interaction moments, covariance formulas, and decaying/non-decaying transition conditions is only presented as derivations in the manuscript. A formal or executable verification artifact such as proofs/interaction_moments.lean or notebooks/verify_interaction_moments.ipynb would close this gap.
  - Required change: Add a reproducibility note that resolves this concern: Proof-as-code gap: the headline analytical characterization of induced interaction moments, covariance formulas, and decaying/non-decaying transition conditions is only presented as derivations in the manuscript. A formal or executable verification artifact such as proofs/interaction_moments.lean or notebooks/verify_interaction_moments.ipynb would close this gap.
  - Verification: Re-review should confirm the reproducibility concern is addressed with a concrete artifact or manuscript update.
- [ ] **Code release and entrypoints**
  - Location: code/reproducibility artifacts: `code release and execution entrypoints`
  - Evidence: The paper gives a GitHub URL, but the manuscript does not specify a commit hash, script entry points, figure reproduction commands, or expected outputs for each figure. A reproducibility manifest such as repro/manifest.yml mapping figures to commands would make the code artifact actionable.
  - Required change: Release the source code, scripts, model configuration, and execution entrypoints needed to regenerate the reported tables, or document why those artifacts cannot be released.
  - Verification: Re-review should confirm runnable code or a documented non-release justification is present.
- [ ] **Data availability and restricted inputs**
  - Location: data/reproducibility artifacts: `data availability and restricted inputs`
  - Evidence: The empirical results use synthetic ground-truth lattice gas models, Gaussian RBM ensembles, random initializations, and parameter sweeps, but exact random seeds or generated parameter/data files are not specified in the paper. Releasing data/generated_instances/ with seeds and serialized parameters would close this gap.
  - Required change: Add a frozen data snapshot or a reproducible data-access appendix covering price series, historical index membership, data URLs, licenses, and restricted Bloomberg access constraints.
  - Verification: Re-review should find data artifacts or access instructions sufficient to rebuild the reported tables.
- [ ] **Experiment configuration**
  - Location: `boundaries/calendars` at `experiment configuration`
  - Evidence: Many captions report N, M, initialization scale, epochs, and learning rates, but the full optimizer details, stopping criteria, sweep grids, numerical precision choices beyond one figure, and any activation-specific training settings are not centrally specified. A configs/ directory with per-figure YAML files would improve repeatability.
  - Required change: Publish the exact experiment configuration: random seeds, candidate grids, fold boundaries/calendars, initialization policy, package versions, top-k choices, and penalty settings.
  - Verification: Re-review should confirm exact seeds, grids, folds, package versions, and configuration choices are specified.
- [ ] **Manuscript: Section 3.1, displayed equations following Eq. exp_exact2 (s=2 specialization)**
  - Location: `corrections/2605.19178/paper.tex` at `Section 3.1, displayed equations following Eq. exp_exact2 (s=2 specialization)`
  - Evidence: Specializing the general Eq. exp_exact2 with s=s'=2 and m=2 yields M gamma_1^4 [gamma_2^2 gamma_1^{-4} - 1] <e^{-2c_mu}>, not M gamma_2^4 [gamma_2^2 gamma_1^4 - 1] <e^{-2c_mu}>. The subscripts and the sign of the exponent on gamma_1 are transposed — the prefactor should be gamma_1^4 (not gamma_2^4) and the bracketed power should be gamma_1^{-4} (not gamma_1^4). Analogous typo affects the m=1 case (should be M gamma_1^4 [gamma_2 gamma_1^{-2} - 1] <e^{-2c_mu}>). This is a transcription error: the conclusions that follow (fluctuation dispersion, transition line, etc.) use the correct general Eq. exp_exact2, so the substantive analysis is unaffected.
  - Required change: Correct the two displayed equations between lines 'Focusing on the case of s=2' and the start of the fluctuations paragraph to read M gamma_1^4 [gamma_2^2 gamma_1^{-4} - 1] <e^{-2c_mu}> and M gamma_1^4 [gamma_2 gamma_1^{-2} - 1] <e^{-2c_mu}>, consistent with Eq. exp_exact2.
  - Verification: Re-review should confirm `Section 3.1, displayed equations following Eq. exp_exact2 (s=2 specialization)` is corrected or justified.
- [ ] **Manuscript: Section 4, Figs. 14-20 (N=3, M=4; larger networks in Figs. 24-26)**
  - Location: `corrections/2605.19178/paper.tex` at `Section 4, Figs. 14-20 (N=3, M=4; larger networks in Figs. 24-26)`
  - Evidence: The training experiments use very small systems (N=3, M=4 in main figures; N=10, M=15 in supplementary), a single ground-truth target per regime, and report a single-trajectory Delta_KL value at the end of training rather than statistics over multiple random initializations or random ground-truth draws. The claim that Exponential RBMs uniquely learn non-decaying interactions is supported by Fig. 20 + Fig. 27 but rests on one combination of hyperparameters (w_0=0.3, g=3) and one ground-truth model. The data/code repository (https://github.com/gdisarra/RBM_nonlinearity) is provided and would allow verification of these specific runs, satisfying the proof-as-code requirement, but the claim's generality is not quantified.
  - Required change: Provide statistics over multiple random initializations and ground-truth draws (mean and dispersion of Delta_KL) and sweep the (w_0, g) plane for the Exponential case to delineate the boundary of the non-decaying learning regime, rather than rely on a single hyperparameter point.
  - Verification: Re-review should confirm `Section 4, Figs. 14-20 (N=3, M=4; larger networks in Figs. 24-26)` is corrected or justified.
- [ ] **Manuscript: Section 4 (Figs. 14-15)**
  - Location: `corrections/2605.19178/paper.tex` at `Section 4 (Figs. 14-15)`
  - Evidence: The figures visually show the trained-RBM empirical moments lying close to the ensemble-average curves, but the post-training weights are not Gaussian i.i.d. — they are correlated due to learning. The match is plausible because training in this small-N regime produces weights with small dispersion, but the paper does not test the i.i.d. Gaussian assumption on the trained weights (e.g., empirical w_0, sigma^2, off-diagonal correlations) to justify why the ensemble formula applies.
  - Required change: Report empirical first and second moments of the trained weight distribution (or a normality/independence test) to justify use of the Gaussian-ensemble formulae as the predictor.
  - Verification: Re-review should confirm `Section 4 (Figs. 14-15)` is corrected or justified.
- [ ] **Manuscript: Appendix; Fig. 21 (T=0.5)**
  - Location: `corrections/2605.19178/paper.tex` at `Appendix; Fig. 21 (T=0.5)`
  - Evidence: The appendix demonstrates existence of weight/bias configurations solving Eq. exact for a single target value T=0.5 with N=3, M=4 by numerical root-finding. The statement 'arbitrary T' is asserted but not demonstrated as T is varied; in particular, there is no analytical proof that the nonlinear system has solutions for all T, nor a numerical sweep over T showing solvability holds across a range of three-body strengths.
  - Required change: Either (a) provide an analytical existence argument (e.g., via degree counting, surjectivity of the map from RBM weights to (I_{ij}, I_{ijk}) at this dimensionality, or implicit function theorem near a known solution), or (b) include a numerical sweep of T over a representative interval showing solutions persist (and discuss any T at which the solver fails).
  - Verification: Re-review should confirm `Appendix; Fig. 21 (T=0.5)` is corrected or justified.
- [ ] **Bibliography: Barra, A., Genovese, G., Peter, G., & Tantari, D. (2018). Phase transitions in restricted Bol...**
  - Location: bibliography entry: `Barra, A., Genovese, G., Peter, G., & Tantari, D. (2018). Phase transitions in restricted Boltzmann machines with gen...`
  - Evidence: Crucial for the discussion on RBM storage capacity and phase transitions, providing the statistical mechanics foundation for the study.
  - Required change: Add a bibliography entry for `Barra, A., Genovese, G., Peter, G., & Tantari, D. (2018). Phase transitions in restricted Boltzmann machines with generic priors. Physical Review E, 98(2), 022139` and cite it where the affected method or claim is introduced, or explicitly justify its omission.
  - Verification: Re-review should confirm the bibliography and citation context address this reference.

## Open Questions

- Does the Gaussian i.i.d. ensemble approximation remain quantitatively predictive for trained weights, and how sensitive are the reported interaction-moment predictions to systematic deviations such as weight correlations or non-zero off-diagonal covariances induced by learning?
- How does the non-decaying interaction regime for Exponential activations scale with increasing system size N and M? Are the qualitative conclusions from the N=3–8 experiments expected to persist, and is there a finite-size scaling argument?
- Can the authors provide a numerical sweep over the three-body target strength T across a representative interval (e.g., T in [0.1, 1.0]) in the existence appendix, or alternatively an analytical argument (implicit function theorem or surjectivity) demonstrating that solutions persist for all T?
- Does the critical transition line w_0 + sigma^2/2 = log 2 remain a sharp boundary under stochastic mini-batch training, or do gradient-noise effects shift the effective transition and if so, how?
- For the training experiments, what is the dispersion of Delta_KL over multiple random initializations and random ground-truth draws? Is the qualitative ordering of activation functions (Exponential uniquely reaching non-decaying targets) robust to initialization variance?

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
          "Shah, H.",
          "Tamuly, K.",
          "Raghunathan, A.",
          "Jain, P.",
          "Netrapalli, P."
        ],
        "doi": null,
        "key": "shah2020pitfalls",
        "raw": "shah2020pitfalls: title={The pitfalls of simplicity bias in neural networks}, author={Shah, H. and Tamuly, K. and Raghunathan, A. and Jain, P. and Netrapalli, P.}, journal={Advances in Neural Information Processing Systems}, volume={33}, pages={9573--9585}, year={2020}",
        "title": "The pitfalls of simplicity bias in neural networks",
        "url": null,
        "venue": "Advances in Neural Information Processing Systems",
        "year": 2020
      },
      "exists": null,
      "explanation": "Cited in the Discussion regarding simplicity bias, where networks tend to learn low-order features first.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2022.12815",
        "authors": [
          "Decelle, A.",
          "Furtlehner, C.",
          "Seoane, B."
        ],
        "doi": "10.1088/1742-5468/ac98a7",
        "key": "Decelle_2022",
        "raw": "Decelle_2022: abstract = {Training restricted Boltzmann machines (RBMs) have been challenging for a long time...}, author = {Decelle, A. and Furtlehner, C. and Seoane, B.}, doi = {10.1088/1742-5468/ac98a7}, journal = {Journal of Statistical Mechanics: Theory and Experiment}, year = {2022}",
        "title": "Equilibrium and non-equilibrium regimes in the learning of restricted Boltzmann machines*",
        "url": null,
        "venue": "Journal of Statistical Mechanics: Theory and Experiment",
        "year": 2022
      },
      "exists": null,
      "explanation": "Discusses RBM training regimes (equilibrium vs out-of-equilibrium), cited in Introduction and Discussion.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2022.31828",
        "authors": [
          "Huang, Haiping",
          "Toyoizumi, Taro"
        ],
        "doi": "10.1103/PhysRevE.91.050101",
        "key": "PhysRevE.91.050101",
        "raw": "PhysRevE.91.050101: author = {Huang, Haiping and Toyoizumi, Taro}, doi = {10.1103/PhysRevE.91.050101}, journal = {Phys. Rev. E}, volume = {91}, year = {2015}",
        "title": "Advanced mean-field theory of the restricted Boltzmann machine",
        "url": "https://link.aps.org/doi/10.1103/PhysRevE.91.050101",
        "venue": "Phys. Rev. E",
        "year": 2015
      },
      "exists": null,
      "explanation": "Provides advanced mean-field theory for RBMs, relevant to the statistical physics approach used in the paper.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Agliari, E.",
          "Alessandrelli, A.",
          "Barra, A.",
          "Centonze, M.S.",
          "Ricci-Tersenghi, F."
        ],
        "doi": null,
        "key": "agliari2025networks",
        "raw": "agliari2025networks: title={Networks of Hebbian networks: more is different}, author={Agliari, E. and Alessandrelli, A. and Barra, A. and Centonze, M.S. and Ricci-Tersenghi, F.}, journal={Neural Networks}, pages={108181}, year={2025}",
        "title": "Networks of Hebbian networks: more is different",
        "url": null,
        "venue": "Neural Networks",
        "year": 2025
      },
      "exists": null,
      "explanation": "Discusses Hebbian network structures, relevant to the RBM and Hopfield model connections.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Agliari, E.",
          "Alessandrelli, A.",
          "Barra, A.",
          "Centonze, M.S.",
          "Ricci-Tersenghi, F."
        ],
        "doi": null,
        "key": "agliari2025generalized",
        "raw": "agliari2025generalized: title={Generalized hetero-associative neural networks}, author={Agliari, E. and Alessandrelli, A. and Barra, A. and Centonze, M.S. and Ricci-Tersenghi, F.}, journal={Journal of Statistical Mechanics: Theory and Experiment}, volume={2025}, number={1}, pages={013302}, year={2025}",
        "title": "Generalized hetero-associative neural networks",
        "url": null,
        "venue": "Journal of Statistical Mechanics: Theory and Experiment",
        "year": 2025
      },
      "exists": null,
      "explanation": "Relates to associative neural networks, which provide context for RBM functionality.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Fachechi, A.",
          "Agliari, E.",
          "Aquaro, M.",
          "Coolen, A.",
          "Mulder, M."
        ],
        "doi": null,
        "key": "fachechi2025fundamental",
        "raw": "fachechi2025fundamental: title={Fundamental operating regimes, hyper-parameter fine-tuning and glassiness: towards an interpretable replica-theory for trained restricted Boltzmann machines}, author={Fachechi, A. and Agliari, E. and Aquaro, M. and Coolen, A. and Mulder, M.}, journal={Journal of Physics A: Mathematical and Theoretical}, volume={58}, number={6}, pages={065004}, year={2025}",
        "title": "Fundamental operating regimes, hyper-parameter fine-tuning and glassiness: towards an interpretable replica-theory for trained restricted Boltzmann machines",
        "url": null,
        "venue": "Journal of Physics A: Mathematical and Theoretical",
        "year": 2025
      },
      "exists": null,
      "explanation": "Provides theoretical background on RBM regimes and learning dynamics, cited multiple times for its replica-theory approach.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2010.55968",
        "authors": [
          "Marcus, C. M.",
          "Waugh, F. R.",
          "Westervelt, R. M."
        ],
        "doi": "10.1103/PhysRevA.41.3355",
        "key": "PhysRevA.41.3355",
        "raw": "PhysRevA.41.3355: author = {Marcus, C. M. and Waugh, F. R. and Westervelt, R. M.}, doi = {10.1103/PhysRevA.41.3355}, journal = {Phys. Rev. A}, volume = {41}, year = {1990}",
        "title": "Associative memory in an analog iterated-map neural network",
        "url": "https://link.aps.org/doi/10.1103/PhysRevA.41.3355",
        "venue": "Phys. Rev. A",
        "year": 1990
      },
      "exists": null,
      "explanation": "Cited for early work on suppression of spin-glass phases in nonlinear analog networks.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "7305.1948",
        "authors": [
          "Cybenko, G."
        ],
        "doi": "10.1007/BF02551274",
        "key": "Cybenko:1989aa",
        "raw": "Cybenko:1989aa: author = {Cybenko, G.}, doi = {10.1007/BF02551274}, journal = {Mathematics of Control, Signals and Systems}, volume = {2}, year = {1989}",
        "title": "Approximation by superpositions of a sigmoidal function",
        "url": "https://doi.org/10.1007/BF02551274",
        "venue": "Mathematics of Control, Signals and Systems",
        "year": 1989
      },
      "exists": null,
      "explanation": "Standard reference for the universal approximation property of neural networks.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2203.10036",
        "authors": [
          "Coates, Adam",
          "Ng, Andrew",
          "Lee, Honglak"
        ],
        "doi": "10.1145/1273496.1273596",
        "key": "pmlr-v15-coates11a",
        "raw": "pmlr-v15-coates11a: author = {Coates, Adam and Ng, Andrew and Lee, Honglak}, booktitle = {Proceedings of the Fourteenth International Conference on Artificial Intelligence and Statistics}, year = {2011}",
        "title": "Proceedings of the Fourteenth International Conference on Artificial Intelligence and Statistics",
        "url": null,
        "venue": "Proceedings of the Fourteenth International Conference on Artificial Intelligence and Statistics",
        "year": 2011
      },
      "exists": null,
      "explanation": "Cited regarding the importance of the number of hidden nodes in model performance.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Decelle, A.",
          "Furtlehner, C."
        ],
        "doi": null,
        "key": "decelle2021restricted",
        "raw": "decelle2021restricted: title={Restricted Boltzmann machine: Recent advances and mean-field theory}, author={Decelle, A. and Furtlehner, C.}, journal={Chinese Physics B}, volume={30}, number={4}, pages={040202}, year={2021}",
        "title": "Restricted Boltzmann machine: Recent advances and mean-field theory",
        "url": null,
        "venue": "Chinese Physics B",
        "year": 2021
      },
      "exists": null,
      "explanation": "Review of recent advances and mean-field theories for RBMs, cited for theoretical background.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2025.13076",
        "authors": [
          "Manzan, G.",
          "Tantari, D."
        ],
        "doi": "10.1016/j.physa.2025.130766",
        "key": "MANZAN2025",
        "raw": "MANZAN2025: title = {The effect of priors on Learning with Restricted Boltzmann Machines}, author = {G. Manzan and D. Tantari}, journal = {Physica A: Statistical Mechanics and its Applications}, year = {2025}",
        "title": "The effect of priors on Learning with Restricted Boltzmann Machines",
        "url": "https://www.sciencedirect.com/science/article/pii/S0378437125004182",
        "venue": "Physica A: Statistical Mechanics and its Applications",
        "year": 2025
      },
      "exists": null,
      "explanation": "Discusses the role of priors in RBM learning, relevant to the hidden layer prior potentials discussed in the paper.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Bonnaire, T.",
          "Catania, G.",
          "Decelle, A.",
          "Seoane, B."
        ],
        "doi": "10.21468/SciPostPhys.19.6.141",
        "key": "Bonnaire2025",
        "raw": "Bonnaire2025: title={{On the role of non-linear latent features in bipartite generative neural networks}}, author={T. Bonnaire and G. Catania and A. Decelle and B. Seoane}, journal={SciPost Phys.}, volume={19}, pages={141}, year={2025}",
        "title": "{On the role of non-linear latent features in bipartite generative neural networks",
        "url": "https://scipost.org/10.21468/SciPostPhys.19.6.141",
        "venue": "SciPost Phys.",
        "year": 2025
      },
      "exists": null,
      "explanation": "Explores non-linear latent features in generative networks, directly relevant to the study of activation functions.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Li, Y.",
          "Liang, Y."
        ],
        "doi": null,
        "key": "li2018learning",
        "raw": "li2018learning: title={Learning overparameterized neural networks via stochastic gradient descent on structured data}, author={Li, Y. and Liang, Y.}, journal={Advances in neural information processing systems}, volume={31}, year={2018}",
        "title": "Learning overparameterized neural networks via stochastic gradient descent on structured data",
        "url": null,
        "venue": "Advances in neural information processing systems",
        "year": 2018
      },
      "exists": null,
      "explanation": "Cited for general neural network learning context in overparameterized regimes.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Oymak, S.",
          "Soltanolkotabi, M."
        ],
        "doi": null,
        "key": "oymak2020toward",
        "raw": "oymak2020toward: title={Toward moderate overparameterization: Global convergence guarantees for training shallow neural networks}, author={Oymak, S. and Soltanolkotabi, M.}, journal={IEEE Journal on Selected Areas in Information Theory}, volume={1}, number={1}, pages={84--105}, year={2020}",
        "title": "Toward moderate overparameterization: Global convergence guarantees for training shallow neural networks",
        "url": null,
        "venue": "IEEE Journal on Selected Areas in Information Theory",
        "year": 2020
      },
      "exists": null,
      "explanation": "Discusses convergence in shallow networks, providing context for RBM learning guarantees.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Refinetti, M.",
          "Ingrosso, A.",
          "Goldt, S."
        ],
        "doi": null,
        "key": "refinetti2023neural",
        "raw": "refinetti2023neural: title={Neural networks trained with SGD learn distributions of increasing complexity}, author={Refinetti, M. and Ingrosso, A. and Goldt, S.}, booktitle={International Conference on Machine Learning}, pages={28843--28863}, year={2023}",
        "title": "Neural networks trained with SGD learn distributions of increasing complexity",
        "url": null,
        "venue": "International Conference on Machine Learning",
        "year": 2023
      },
      "exists": null,
      "explanation": "Relates to the complexity bias in learning, cited in Discussion.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Allen-Zhu, Z.",
          "Li, Y.",
          "Song, Z."
        ],
        "doi": null,
        "key": "allen2019convergence",
        "raw": "allen2019convergence: title={A convergence theory for deep learning via over-parameterization}, author={Allen-Zhu, Z. and Li, Y. and Song, Z.}, booktitle={International conference on machine learning}, pages={242--252}, year={2019}",
        "title": "A convergence theory for deep learning via over-parameterization",
        "url": null,
        "venue": "International conference on machine learning",
        "year": 2019
      },
      "exists": null,
      "explanation": "Standard convergence theory for deep learning, providing context for neural network optimization.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Arora, S.",
          "Du, S.",
          "Hu, W.",
          "Li, Z.",
          "Wang, R."
        ],
        "doi": null,
        "key": "arora2019fine",
        "raw": "arora2019fine: title={Fine-grained analysis of optimization and generalization for overparameterized two-layer neural networks}, author={Arora, S. and Du, S. and Hu, W. and Li, Z. and Wang, R.}, booktitle={International conference on machine learning}, pages={322--332}, year={2019}",
        "title": "Fine-grained analysis of optimization and generalization for overparameterized two-layer neural networks",
        "url": null,
        "venue": "International conference on machine learning",
        "year": 2019
      },
      "exists": null,
      "explanation": "Analyzes optimization in two-layer networks, relevant to the bipartite structure of RBMs.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Allen-Zhu, Z.",
          "Li, Y.",
          "Liang, Y."
        ],
        "doi": null,
        "key": "allen2019learning",
        "raw": "allen2019learning: title={Learning and generalization in overparameterized neural networks, going beyond two layers}, author={Allen-Zhu, Z. and Li, Y. and Liang, Y.}, journal={Advances in neural information processing systems}, volume={32}, year={2019}",
        "title": "Learning and generalization in overparameterized neural networks, going beyond two layers",
        "url": null,
        "venue": "Advances in neural information processing systems",
        "year": 2019
      },
      "exists": null,
      "explanation": "Discusses generalization in deep networks, providing context for the broader learning algorithm research.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Decelle, A.",
          "Navas Gómez, A.",
          "Seoane, B."
        ],
        "doi": "10.1103/lyny-6r9y",
        "key": "decelle2024inferring",
        "raw": "decelle2024inferring: title = {Inferring Higher-Order Couplings with Neural Networks}, author = {Decelle, A. and Navas G\\'omez, A. and Seoane, B.}, journal = {Phys. Rev. Lett.}, volume = {135}, issue = {20}, pages = {207301}, year = {2025}",
        "title": "Inferring Higher-Order Couplings with Neural Networks",
        "url": "https://link.aps.org/doi/10.1103/lyny-6r9y",
        "venue": "Phys. Rev. Lett.",
        "year": 2025
      },
      "exists": null,
      "explanation": "Directly relevant work on inferring higher-order couplings, cited for the Potts-binary RBM mapping.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2410.19637",
        "authors": [
          "Rende, R.",
          "Gerace, F.",
          "Laio, A.",
          "Goldt, S."
        ],
        "doi": null,
        "key": "rende2024distributional",
        "raw": "rende2024distributional: title={A distributional simplicity bias in the learning dynamics of transformers}, author={Rende, R. and Gerace, F. and Laio, A. and Goldt, S.}, journal={arXiv preprint arXiv:2410.19637}, year={2024}",
        "title": "A distributional simplicity bias in the learning dynamics of transformers",
        "url": null,
        "venue": "arXiv preprint arXiv:2410.19637",
        "year": 2024
      },
      "exists": null,
      "explanation": "Discusses simplicity bias in Transformers, cited as part of the evidence for learning low-order features first.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "1710.05941",
        "authors": [
          "Tubiana, J.",
          "Monasson, R."
        ],
        "doi": "10.1103/PhysRevLett.118.138301",
        "key": "PhysRevLett.118.138301",
        "raw": "PhysRevLett.118.138301: author = {Tubiana, J. and Monasson, R.}, doi = {10.1103/PhysRevLett.118.138301}, journal = {Phys. Rev. Lett.}, volume = {118}, year = {2017}",
        "title": "Emergence of Compositional Representations in Restricted Boltzmann Machines",
        "url": "https://link.aps.org/doi/10.1103/PhysRevLett.118.138301",
        "venue": "Phys. Rev. Lett.",
        "year": 2017
      },
      "exists": null,
      "explanation": "Key paper on compositional representations in ReLU RBMs, defining the compositional phase.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "1606.08415",
        "authors": [
          "Hendrycks, D.",
          "Gimpel, K."
        ],
        "doi": null,
        "key": "hendrycks2016gaussian",
        "raw": "hendrycks2016gaussian: title={Gaussian error linear units (gelus)}, author={Hendrycks, D. and Gimpel, K.}, journal={arXiv preprint arXiv:1606.08415}, year={2016}",
        "title": "Gaussian error linear units (gelus)",
        "url": null,
        "venue": "arXiv preprint arXiv:1606.08415",
        "year": 2016
      },
      "exists": null,
      "explanation": "Introduces GELU activation, cited as evidence for the importance of activation functions.",
      "notes": null,
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Krizhevsky, A.",
          "Sutskever, I.",
          "Hinton, G. E."
        ],
        "doi": null,
        "key": "krizhevsky2012imagenet",
        "raw": "krizhevsky2012imagenet: title={Imagenet classification with deep convolutional neural networks}, author={Krizhevsky, A. and Sutskever, I. and Hinton, G. E.}, journal={Advances in neural information processing systems}, volume={25}, year={2012}",
        "title": "Imagenet classification with deep convolutional neural networks",
        "url": null,
        "venue": "Advances in neural information processing systems",
        "year": 2012
      },
      "exists": null,
      "explanation": "Landmark paper for deep learning using ReLU, cited for the impact of activation functions on performance.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Glorot, X.",
          "Bordes, A.",
          "Bengio, Y."
        ],
        "doi": null,
        "key": "pmlr-v15-glorot11a",
        "raw": "pmlr-v15-glorot11a: author = {Glorot, X. and Bordes, A. and Bengio, Y.}, booktitle = {Proceedings of the Fourteenth International Conference on Artificial Intelligence and Statistics}, year = {2011}",
        "title": "Deep Sparse Rectifier Neural Networks",
        "url": "https://proceedings.mlr.press/v15/glorot11a.html",
        "venue": "Proceedings of the Fourteenth International Conference on Artificial Intelligence and Statistics",
        "year": 2011
      },
      "exists": null,
      "explanation": "Foundational paper on ReLU activations in deep learning, cited for their role in training and performance.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2402.09092",
        "authors": [
          "Nair, V.",
          "Hinton, G. E."
        ],
        "doi": "10.1162/neco_a_01420",
        "key": "10.5555/3104322.3104425",
        "raw": "10.5555/3104322.3104425: title = {Rectified Linear Units Improve Restricted Boltzmann Machines}, author = {Nair, V. and Hinton, G. E.}, booktitle = {Proceedings of the 27th International Conference on International Conference on Machine Learning}, year = {2010}",
        "title": "Proceedings of the 27th International Conference on International Conference on Machine Learning",
        "url": null,
        "venue": "Proceedings of the 27th International Conference on International Conference on Machine Learning",
        "year": 2010
      },
      "exists": null,
      "explanation": "Introduced ReLU to RBMs, cited multiple times for the mapping to interaction models and performance improvements.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Nishiyama, S.",
          "Ohzeki, M."
        ],
        "doi": null,
        "key": "nishiyama2025solution",
        "raw": "nishiyama2025solution: title={Solution space and storage capacity of fully connected two-layer neural networks with generic activation functions}, author={Nishiyama, S. and Ohzeki, M.}, journal={Journal of the Physical Society of Japan}, volume={94}, number={1}, pages={014802}, year={2025}",
        "title": "Solution space and storage capacity of fully connected two-layer neural networks with generic activation functions",
        "url": null,
        "venue": "Journal of the Physical Society of Japan",
        "year": 2025
      },
      "exists": null,
      "explanation": "Discusses storage capacity for generic activation functions in two-layer networks.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Oostwal, E.",
          "Straat, M.",
          "Biehl, M."
        ],
        "doi": null,
        "key": "oostwal2021hidden",
        "raw": "oostwal2021hidden: title={Hidden unit specialization in layered neural networks: ReLU vs. sigmoidal activation}, author={Oostwal, E. and Straat, M. and Biehl, M.}, journal={Physica A: Statistical Mechanics and its Applications}, volume={564}, pages={125517}, year={2021}",
        "title": "Hidden unit specialization in layered neural networks: ReLU vs. sigmoidal activation",
        "url": null,
        "venue": "Physica A: Statistical Mechanics and its Applications",
        "year": 2021
      },
      "exists": null,
      "explanation": "Compares ReLU and sigmoidal activation in student-teacher settings, cited in the Introduction.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Citton, O.",
          "Richert, F.",
          "Biehl, M."
        ],
        "doi": null,
        "key": "citton2025phase",
        "raw": "citton2025phase: title={Phase transition analysis for shallow neural networks with arbitrary activation functions}, author={Citton, O. and Richert, F. and Biehl, M.}, journal={Physica A: Statistical Mechanics and its Applications}, volume={660}, pages={130356}, year={2025}",
        "title": "Phase transition analysis for shallow neural networks with arbitrary activation functions",
        "url": null,
        "venue": "Physica A: Statistical Mechanics and its Applications",
        "year": 2025
      },
      "exists": null,
      "explanation": "Phase transition analysis for arbitrary activations in shallow networks, providing theoretical context.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "di Sarra, G.",
          "Bravi, B.",
          "Roudi, Y."
        ],
        "doi": "10.1209/0295-5075/ada636",
        "key": "diSarra_2025",
        "raw": "diSarra_2025: author = {di Sarra, G. and Bravi, B. and Roudi, Y.}, title = {The unbearable lightness of restricted Boltzmann machines: Theoretical insights and biological applications}, journal = {Europhysics Letters}, year = {2025}",
        "title": "The unbearable lightness of restricted Boltzmann machines: Theoretical insights and biological applications",
        "url": "https://dx.doi.org/10.1209/0295-5075/ada636",
        "venue": "Europhysics Letters",
        "year": 2025
      },
      "exists": null,
      "explanation": "Key review paper by the same authors, provides theoretical insights and biological applications of RBMs.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    }
  ],
  "missing_references": [
    {
      "reason": "Foundational work for RBM learning and Contrastive Divergence, which is the standard training algorithm mentioned in the introduction.",
      "title": "Hinton, G. E. (2002). Training products of experts by minimizing contrastive divergence. Neural computation, 14(8), 1771-1800."
    },
    {
      "reason": "Crucial for the discussion on RBM storage capacity and phase transitions, providing the statistical mechanics foundation for the study.",
      "title": "Barra, A., Genovese, G., Peter, G., & Tantari, D. (2018). Phase transitions in restricted Boltzmann machines with generic priors. Physical Review E, 98(2), 022139."
    },
    {
      "reason": "Highly relevant for the discussion on ReLU and its variants in RBMs, specifically for the 'compositional phase' mentioned in the text.",
      "title": "Tubiana, J., Cocco, S., & Monasson, R. (2019). Learning protein constitutive motifs from sequence data. Elife, 8, e39397."
    }
  ],
  "summary": "The paper provides a comprehensive review of activation functions in Restricted Boltzmann Machines, utilizing a statistical physics approach to characterize representable models through induced interactions. The citation profile is strong, referencing key works in both machine learning (ReLU foundational papers) and statistical mechanics (mean-field theories, replica theory). The review includes recent 2024 and 2025 citations, indicating up-to-date scholarship. Some foundational RBM training papers (Hinton 2002) and specific prior-related physics papers (Barra 2018) could further strengthen the context."
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.78,
  "questions": [
    "Does the Gaussian i.i.d. ensemble approximation remain quantitatively predictive for trained weights, and how sensitive are the reported interaction-moment predictions to systematic deviations such as weight correlations or non-zero off-diagonal covariances induced by learning?",
    "How does the non-decaying interaction regime for Exponential activations scale with increasing system size N and M? Are the qualitative conclusions from the N=3–8 experiments expected to persist, and is there a finite-size scaling argument?",
    "Can the authors provide a numerical sweep over the three-body target strength T across a representative interval (e.g., T in [0.1, 1.0]) in the existence appendix, or alternatively an analytical argument (implicit function theorem or surjectivity) demonstrating that solutions persist for all T?",
    "Does the critical transition line w_0 + sigma^2/2 = log 2 remain a sharp boundary under stochastic mini-batch training, or do gradient-noise effects shift the effective transition and if so, how?",
    "For the training experiments, what is the dispersion of Delta_KL over multiple random initializations and random ground-truth draws? Is the qualitative ordering of activation functions (Exponential uniquely reaching non-decaying targets) robust to initialization variance?"
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "Proof-as-code gap: the headline analytical characterization of induced interaction moments, covariance formulas, and decaying/non-decaying transition conditions is only presented as derivations in the manuscript. A formal or executable verification artifact such as proofs/interaction_moments.lean or notebooks/verify_interaction_moments.ipynb would close this gap.",
      "id": "weakness-1",
      "locator": "reproducibility appendix",
      "required_update": "Add a reproducibility note that resolves this concern: Proof-as-code gap: the headline analytical characterization of induced interaction moments, covariance formulas, and decaying/non-decaying transition conditions is only presented as derivations in the manuscript. A formal or executable verification artifact such as proofs/interaction_moments.lean or notebooks/verify_interaction_moments.ipynb would close this gap.",
      "source_path": "corrections/2605.19178/paper.tex",
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm the reproducibility concern is addressed with a concrete artifact or manuscript update.",
      "weakness_index": 0
    },
    {
      "evidence": "The paper gives a GitHub URL, but the manuscript does not specify a commit hash, script entry points, figure reproduction commands, or expected outputs for each figure. A reproducibility manifest such as repro/manifest.yml mapping figures to commands would make the code artifact actionable.",
      "id": "weakness-2",
      "locator": "code release and execution entrypoints",
      "required_update": "Release the source code, scripts, model configuration, and execution entrypoints needed to regenerate the reported tables, or document why those artifacts cannot be released.",
      "source_path": null,
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "code",
      "verification_check": "Re-review should confirm runnable code or a documented non-release justification is present.",
      "weakness_index": 1
    },
    {
      "evidence": "The empirical results use synthetic ground-truth lattice gas models, Gaussian RBM ensembles, random initializations, and parameter sweeps, but exact random seeds or generated parameter/data files are not specified in the paper. Releasing data/generated_instances/ with seeds and serialized parameters would close this gap.",
      "id": "weakness-3",
      "locator": "data availability and restricted inputs",
      "required_update": "Add a frozen data snapshot or a reproducible data-access appendix covering price series, historical index membership, data URLs, licenses, and restricted Bloomberg access constraints.",
      "source_path": null,
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "data",
      "verification_check": "Re-review should find data artifacts or access instructions sufficient to rebuild the reported tables.",
      "weakness_index": 2
    },
    {
      "evidence": "Many captions report N, M, initialization scale, epochs, and learning rates, but the full optimizer details, stopping criteria, sweep grids, numerical precision choices beyond one figure, and any activation-specific training settings are not centrally specified. A configs/ directory with per-figure YAML files would improve repeatability.",
      "id": "weakness-4",
      "locator": "experiment configuration",
      "required_update": "Publish the exact experiment configuration: random seeds, candidate grids, fold boundaries/calendars, initialization policy, package versions, top-k choices, and penalty settings.",
      "source_path": "boundaries/calendars",
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "code",
      "verification_check": "Re-review should confirm exact seeds, grids, folds, package versions, and configuration choices are specified.",
      "weakness_index": 3
    },
    {
      "evidence": "Specializing the general Eq. exp_exact2 with s=s'=2 and m=2 yields M gamma_1^4 [gamma_2^2 gamma_1^{-4} - 1] <e^{-2c_mu}>, not M gamma_2^4 [gamma_2^2 gamma_1^4 - 1] <e^{-2c_mu}>. The subscripts and the sign of the exponent on gamma_1 are transposed — the prefactor should be gamma_1^4 (not gamma_2^4) and the bracketed power should be gamma_1^{-4} (not gamma_1^4). Analogous typo affects the m=1 case (should be M gamma_1^4 [gamma_2 gamma_1^{-2} - 1] <e^{-2c_mu}>). This is a transcription error: the conclusions that follow (fluctuation dispersion, transition line, etc.) use the correct general Eq. exp_exact2, so the substantive analysis is unaffected.",
      "id": "weakness-5",
      "locator": "Section 3.1, displayed equations following Eq. exp_exact2 (s=2 specialization)",
      "required_update": "Correct the two displayed equations between lines 'Focusing on the case of s=2' and the start of the fluctuations paragraph to read M gamma_1^4 [gamma_2^2 gamma_1^{-4} - 1] <e^{-2c_mu}> and M gamma_1^4 [gamma_2 gamma_1^{-2} - 1] <e^{-2c_mu}>, consistent with Eq. exp_exact2.",
      "source_path": "corrections/2605.19178/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 3.1, displayed equations following Eq. exp_exact2 (s=2 specialization)` is corrected or justified.",
      "weakness_index": 4
    },
    {
      "evidence": "The training experiments use very small systems (N=3, M=4 in main figures; N=10, M=15 in supplementary), a single ground-truth target per regime, and report a single-trajectory Delta_KL value at the end of training rather than statistics over multiple random initializations or random ground-truth draws. The claim that Exponential RBMs uniquely learn non-decaying interactions is supported by Fig. 20 + Fig. 27 but rests on one combination of hyperparameters (w_0=0.3, g=3) and one ground-truth model. The data/code repository (https://github.com/gdisarra/RBM_nonlinearity) is provided and would allow verification of these specific runs, satisfying the proof-as-code requirement, but the claim's generality is not quantified.",
      "id": "weakness-6",
      "locator": "Section 4, Figs. 14-20 (N=3, M=4; larger networks in Figs. 24-26)",
      "required_update": "Provide statistics over multiple random initializations and ground-truth draws (mean and dispersion of Delta_KL) and sweep the (w_0, g) plane for the Exponential case to delineate the boundary of the non-decaying learning regime, rather than rely on a single hyperparameter point.",
      "source_path": "corrections/2605.19178/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 4, Figs. 14-20 (N=3, M=4; larger networks in Figs. 24-26)` is corrected or justified.",
      "weakness_index": 5
    },
    {
      "evidence": "The figures visually show the trained-RBM empirical moments lying close to the ensemble-average curves, but the post-training weights are not Gaussian i.i.d. — they are correlated due to learning. The match is plausible because training in this small-N regime produces weights with small dispersion, but the paper does not test the i.i.d. Gaussian assumption on the trained weights (e.g., empirical w_0, sigma^2, off-diagonal correlations) to justify why the ensemble formula applies.",
      "id": "weakness-7",
      "locator": "Section 4 (Figs. 14-15)",
      "required_update": "Report empirical first and second moments of the trained weight distribution (or a normality/independence test) to justify use of the Gaussian-ensemble formulae as the predictor.",
      "source_path": "corrections/2605.19178/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 4 (Figs. 14-15)` is corrected or justified.",
      "weakness_index": 6
    },
    {
      "evidence": "The appendix demonstrates existence of weight/bias configurations solving Eq. exact for a single target value T=0.5 with N=3, M=4 by numerical root-finding. The statement 'arbitrary T' is asserted but not demonstrated as T is varied; in particular, there is no analytical proof that the nonlinear system has solutions for all T, nor a numerical sweep over T showing solvability holds across a range of three-body strengths.",
      "id": "weakness-8",
      "locator": "Appendix; Fig. 21 (T=0.5)",
      "required_update": "Either (a) provide an analytical existence argument (e.g., via degree counting, surjectivity of the map from RBM weights to (I_{ij}, I_{ijk}) at this dimensionality, or implicit function theorem near a known solution), or (b) include a numerical sweep of T over a representative interval showing solutions persist (and discuss any T at which the solver fails).",
      "source_path": "corrections/2605.19178/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Appendix; Fig. 21 (T=0.5)` is corrected or justified.",
      "weakness_index": 7
    },
    {
      "evidence": "Crucial for the discussion on RBM storage capacity and phase transitions, providing the statistical mechanics foundation for the study.",
      "id": "weakness-9",
      "locator": "Barra, A., Genovese, G., Peter, G., & Tantari, D. (2018). Phase transitions in restricted Boltzmann machines with generic priors. Physical Review E, 98(2), 022139.",
      "required_update": "Add a bibliography entry for `Barra, A., Genovese, G., Peter, G., & Tantari, D. (2018). Phase transitions in restricted Boltzmann machines with generic priors. Physical Review E, 98(2), 022139` and cite it where the affected method or claim is introduced, or explicitly justify its omission.",
      "source_path": null,
      "source_role": "citation",
      "status": "open",
      "target_kind": "bibliography",
      "verification_check": "Re-review should confirm the bibliography and citation context address this reference.",
      "weakness_index": 8
    }
  ],
  "strengths": [
    "Novel comparative analytical framework that derives closed-form ensemble statistics (mean, covariance, fluctuation ratio) for four activation functions, providing a unified characterization of RBM representational capacity",
    "Analytical results for the Exponential activation — especially the critical line w_0 + sigma^2/2 = log 2 and the Delta^Exp_s = 1 boundary — are rigorously derived and internally consistent, with correct combinatorial identities confirmed by the technical reviewer",
    "Identification of the Exponential activation as the unique function enabling non-decaying higher-order interaction models is a significant conceptual contribution with practical implications for activation-function selection",
    "Public code repository at https://github.com/gdisarra/RBM_nonlinearity is provided, partially satisfying the artifact requirement for the numerical and simulation claims",
    "Citation profile is current and comprehensive, covering the statistical physics literature (replica theory, mean-field approaches, training regimes) alongside relevant ML overparameterization and simplicity-bias results through 2025",
    "The inductive-bias framing — connecting activation choice to the order-structure of learnable data correlations — is clearly articulated and bridges theoretical and practical perspectives"
  ],
  "summary": "This paper presents a novel analytical framework for characterizing how the choice of activation function in Restricted Boltzmann Machines (RBMs) determines the order-structure of the induced multi-spin interactions representable by the model. Four activation functions are systematically compared — Linear, Step, ReLU, and Exponential — via closed-form expressions for the ensemble-average interaction moments, fluctuation statistics, and critical transition loci in the Gaussian weight ensemble. The central finding is that Exponential activations are uniquely capable of generating dominant higher-order (non-decaying) interaction models, while Linear, Step, and ReLU activations are confined to pairwise-dominant (decaying) regimes. The analytical derivations are largely correct and internally consistent (overall_correctness: mostly_sound, confidence 0.70), novelty is rated significant (score 0.75, confidence 0.80), and a public GitHub repository is provided. However, the recommendation gate is triggered: the reproducibility specialist flagged a critical proof-as-code gap — the headline analytical claims (interaction moment formulas, covariance expressions, transition conditions) are supported only by manuscript derivations without an accompanying executable verification artifact. Three additional major reproducibility gaps were flagged: missing commit hash and per-figure script entry points, unspecified random seeds, and absent optimizer sweep documentation. Several minor technical issues also require attention: a confirmed typographic error in the s=2 Exponential variance specialization (C4), quantitative agreement metrics missing from Figs. 6-10 (C9), narrow empirical support for training conclusions (C11, C13), and an insufficiently general three-body representation result (C12). The citation record is strong but would benefit from foundational additions (Hinton 2002 CD, Barra et al. 2018). The recommendation is major_revision, contingent on closing the proof-as-code gap and addressing the reproducibility deficits.",
  "weaknesses": [
    "[Reproducibility, critical] No executable verification artifact (e.g., notebooks/verify_interaction_moments.ipynb or a symbolic-algebra script) is provided for the headline analytical claims about interaction moments, covariance formulas, and decaying/non-decaying transition conditions; the derivations are manuscript-only",
    "[Reproducibility, major] The GitHub repository is cited without a pinned commit hash, script entry points, or a reproducibility manifest mapping figures to commands, making the numerical artifact difficult to use independently",
    "[Reproducibility, major] Exact random seeds and serialized parameter files for the synthetic lattice-gas and Gaussian RBM ensemble experiments are not specified, preventing bit-for-bit reproduction",
    "[Reproducibility, major] Full optimizer details, stopping criteria, sweep grids, and activation-specific training settings are not centrally documented; only partial per-figure hyperparameters appear in captions",
    "[Technical, minor] Confirmed typographic error in the s=2 specialization of the Exponential covariance formula: the prefactor should be gamma_1^4 (not gamma_2^4) and the exponent should be gamma_1^{-4} (not gamma_1^4), inconsistent with the general Eq. exp_exact2 (claim C4)",
    "[Technical, minor] Training experiments rest on very small systems (N=3, M=4 in main figures) and a single hyperparameter point (w_0=0.3, g=3) for the Exponential non-decaying learning claim; generality of the conclusion is unquantified",
    "[Technical, minor] The post-training applicability of the Gaussian i.i.d. ensemble formula is assumed but not validated: empirical weight moments and correlation structure of trained networks are not reported",
    "[Technical, minor] The claim that an RBM can represent an arbitrary three-body interaction model is demonstrated only for T=0.5 with N=3, M=4 by numerical root-finding; no analytical existence argument or sweep over T is provided",
    "[Citation] Missing foundational references: Hinton (2002) on Contrastive Divergence training and Barra et al. (2018) on phase transitions in RBMs with generic priors, both directly relevant to the paper's context and discussion"
  ]
}
```

### novelty (`gemini-3-flash-preview`) — status: `pass`

```json
{
  "confidence": 0.8,
  "missing_prior_art": [],
  "novelty_score": 0.75,
  "related_work": [
    {
      "citation_key": "10.1162/neco_a_01420",
      "delta": "While the cited work provides the exact mapping for interaction terms, this paper extends the theory by analytically deriving the ensemble statistics (moments and fluctuations) of these interactions, which allows for the systematic characterization of the representational landscape.",
      "relation": "builds_on",
      "title": "Exact mapping between restricted Boltzmann machines and models of interacting binary variables"
    },
    {
      "citation_key": "fachechi2025fundamental",
      "delta": "Prior work focused on the replica theory and operating regimes of linear RBMs; this study focuses on the role of hidden-layer nonlinearities in enabling or suppressing higher-order interactions.",
      "relation": "prior_art",
      "title": "Fundamental operating regimes, hyper-parameter fine-tuning and glassiness: towards an interpretable replica-theory for trained restricted Boltzmann machines"
    },
    {
      "citation_key": "PhysRevLett.118.138301",
      "delta": "This paper provides a comparative analytical framework for multiple activation functions, explaining how Exponential activation, unlike ReLU or Step, can escape the 'simplicity bias' to learn non-decaying higher-order interaction models.",
      "relation": "prior_art",
      "title": "Emergence of Compositional Representations in Restricted Boltzmann Machines"
    }
  ],
  "verdict": "significant"
}
```

### reproducibility (`gpt-5.5`) — status: `pass`

```json
{
  "code_availability": "open_source",
  "code_url": "https://github.com/gdisarra/RBM_nonlinearity",
  "concerns": [
    {
      "area": "other",
      "description": "Proof-as-code gap: the headline analytical characterization of induced interaction moments, covariance formulas, and decaying/non-decaying transition conditions is only presented as derivations in the manuscript. A formal or executable verification artifact such as proofs/interaction_moments.lean or notebooks/verify_interaction_moments.ipynb would close this gap.",
      "severity": "critical"
    },
    {
      "area": "code",
      "description": "The paper gives a GitHub URL, but the manuscript does not specify a commit hash, script entry points, figure reproduction commands, or expected outputs for each figure. A reproducibility manifest such as repro/manifest.yml mapping figures to commands would make the code artifact actionable.",
      "severity": "major"
    },
    {
      "area": "data",
      "description": "The empirical results use synthetic ground-truth lattice gas models, Gaussian RBM ensembles, random initializations, and parameter sweeps, but exact random seeds or generated parameter/data files are not specified in the paper. Releasing data/generated_instances/ with seeds and serialized parameters would close this gap.",
      "severity": "major"
    },
    {
      "area": "hyperparameters",
      "description": "Many captions report N, M, initialization scale, epochs, and learning rates, but the full optimizer details, stopping criteria, sweep grids, numerical precision choices beyond one figure, and any activation-specific training settings are not centrally specified. A configs/ directory with per-figure YAML files would improve repeatability.",
      "severity": "major"
    },
    {
      "area": "evaluation",
      "description": "Evaluation is mostly figure-based, with Delta_KL defined and shown in legends, but the paper does not provide machine-readable numerical tables or tolerances for reproducing the plotted claims. A results/expected_metrics.csv file would enable objective comparison.",
      "severity": "minor"
    },
    {
      "area": "compute",
      "description": "The paper does not state software versions, dependency versions, operating system, or hardware requirements. The experiments appear modest, but an environment.yml or requirements.txt plus hardware note is needed for reliable reruns.",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://www.amazon.com/Machine-Learning-Probabilistic-Perspective-Computation/dp/0262018020/ref=sr_1_2?ie=UTF8&qid=1336857747&sr=8-2` (status=405)",
      "severity": "minor"
    }
  ],
  "confidence": 0.82,
  "data_availability": "public",
  "data_url": "https://github.com/gdisarra/RBM_nonlinearity",
  "environment": {
    "dependencies": [],
    "hardware": null,
    "software": null
  },
  "reproducibility_score": 0.64
}
```

### summary (`claude-haiku-4-5-20251001`) — status: `pass`

```json
{
  "audience": "Researchers in machine learning theory, neural network design, and statistical physics approaches to learning; practitioners seeking to understand activation function selection and its impact on representational capacity; theoreticians interested in the foundations of unsupervised learning.",
  "key_contributions": [
    "Analytical characterization of interaction statistics for four activation functions in RBMs: Linear, Step, ReLU, and Exponential",
    "Proof that exponential activation functions are uniquely capable of generating models with dominant higher-order interactions, while other functions favor lower-order pairwise interactions",
    "Demonstration that activation functions impose an inductive bias on the types of data structures RBMs are naturally inclined to learn",
    "Quantitative verification showing excellent agreement between theoretical predictions of interaction moments and empirical simulations",
    "Identification of specific parameter regimes where exponential activations enable representation of non-decaying interaction models"
  ],
  "plain_language_summary": "Neural networks excel at recognizing patterns in data, and a key factor in their success is how individual neurons transform and process information through activation functions. This paper investigates how the choice of activation function in Restricted Boltzmann Machines (RBMs)—a type of neural network often used as a theoretical model to understand learning—affects what kinds of patterns and relationships the network can learn. By analyzing the mathematics of four common activation functions (Linear, Step, ReLU, and Exponential), the authors show that each function produces a characteristically different landscape of interactions among the network's variables: linear activations only generate simple pairwise interactions, while exponential activations naturally produce higher-order interactions involving three or more variables. The authors verify their theoretical predictions through numerical simulations and demonstrate that exponential activations can more readily learn data structures containing complex, higher-order correlations.\n\nThe practical implication is that the choice of activation function acts as a form of inductive bias—it shapes what types of patterns the network is naturally predisposed to learn. This finding helps explain why certain activation functions like ReLU have become standard in deep learning and suggests that matching the activation function to the statistical structure of your data could improve learning efficiency. The paper bridges theory and practice by showing that simple mathematical analysis of random networks can reveal deep insights about what makes neural networks work, and it opens the door to more intentional design of activation functions based on the task at hand.",
  "tldr": "Different activation functions in Restricted Boltzmann Machines produce fundamentally different types of learned interactions, with exponential functions better capturing higher-order correlations in data."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `pass`

```json
{
  "claims": [
    {
      "assessment": "supported",
      "claim": "For the Linear activation function, the expected interactions over the Gaussian RBM ensemble are I^Lin_1 = b + (M/2)(w_0^2 + sigma^2) - M w_0 c_0 and I^Lin_2 = M w_0^2 (Eq. lin_exact).",
      "evidence": "Direct substitution of K^Lin(q)=q^2/2 - q c_mu into Eq. exact reproduces the stated expressions: for s=1 one obtains b_i + sum_mu(w^2/2 - c w), giving M(w_0^2+sigma^2)/2 - M w_0 c_0 + b_i; for s=2, K(w_{k1}+w_{k2}) - K(w_{k1}) - K(w_{k2}) = w_{k1}w_{k2}, giving M w_0^2 in expectation. The combinatorial identities in the appendix (sum (-1)^{s-n} C(s,n) n = 0 for s>=2 and = delta_{s,2} for n^2) are standard and correct. The accompanying second-moment expressions (2 M sigma^2 (w_0^2 + sigma^2/2) and M w_0^2 sigma^2 for the shared-index covariance) check out by direct calculation of Var(w_{k1}w_{k2}) = (w_0^2+sigma^2)^2 - w_0^4 = 2 w_0^2 sigma^2 + sigma^4.",
      "id": "C1",
      "location": "Section 3.1, Eq. eq:lin_exact; Appendix 'The expected interaction in the Linear case'",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "For the Exponential (Poisson) activation function, the expected s-th order interaction over the Gaussian RBM ensemble is I^Exp_s = M gamma_1^s <e^{-c_mu}>, where gamma_1 = <exp w> - 1 (Eq. exp_exact).",
      "evidence": "With K^Exp(q) = e^{-c}(e^q - 1) and visible-index independence of weights, the inclusion-exclusion sum in Eq. exact collapses to sum_mu e^{-c_mu} prod_l (e^{w_{k_l,mu}}-1). Taking expectations and using i.i.d. weights yields M gamma_1^s <e^{-c_mu}>. The derivation is consistent and reproducible.",
      "id": "C2",
      "location": "Section 3.1, Eq. exp_exact",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "The covariance between two Exponential-activation interaction terms sharing m visible indices is M gamma_1^{s+s'} [gamma_2^m gamma_1^{-2m} - 1] <e^{-2c_mu}> (Eq. exp_exact2).",
      "evidence": "Splitting the double sum over hidden indices into diagonal (mu=nu) and off-diagonal (mu!=nu) contributions and using <(e^{w_{k_i,mu}}-1)^2>=gamma_2 for shared indices and gamma_1 otherwise gives the stated result. Substituting s=s'=m=s into the formula recovers the fluctuation ratio Delta^Exp_s = M_0^{-1}[(gamma_2/gamma_1^2)^s - 1] used downstream, which is internally consistent.",
      "id": "C3",
      "location": "Section 3.1, Eq. exp_exact2; Appendix 'Derivation of Eq. exp_exact2'",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "incorrect",
      "claim": "For pairwise (s=2) Exponential-activation interactions, the variance equals M gamma_2^4 [gamma_2^2 gamma_1^4 - 1] <e^{-2c_mu}> and the analogous one-index-shared covariance is M gamma_2^4 [gamma_2 gamma_1^2 - 1] <e^{-2c_mu}>.",
      "evidence": "Specializing the general Eq. exp_exact2 with s=s'=2 and m=2 yields M gamma_1^4 [gamma_2^2 gamma_1^{-4} - 1] <e^{-2c_mu}>, not M gamma_2^4 [gamma_2^2 gamma_1^4 - 1] <e^{-2c_mu}>. The subscripts and the sign of the exponent on gamma_1 are transposed — the prefactor should be gamma_1^4 (not gamma_2^4) and the bracketed power should be gamma_1^{-4} (not gamma_1^4). Analogous typo affects the m=1 case (should be M gamma_1^4 [gamma_2 gamma_1^{-2} - 1] <e^{-2c_mu}>). This is a transcription error: the conclusions that follow (fluctuation dispersion, transition line, etc.) use the correct general Eq. exp_exact2, so the substantive analysis is unaffected.",
      "id": "C4",
      "location": "Section 3.1, displayed equations following Eq. exp_exact2 (s=2 specialization)",
      "severity": "minor",
      "suggested_fix": "Correct the two displayed equations between lines 'Focusing on the case of s=2' and the start of the fluctuations paragraph to read M gamma_1^4 [gamma_2^2 gamma_1^{-4} - 1] <e^{-2c_mu}> and M gamma_1^4 [gamma_2 gamma_1^{-2} - 1] <e^{-2c_mu}>, consistent with Eq. exp_exact2."
    },
    {
      "assessment": "supported",
      "claim": "For Gaussian weights, the critical line w_0 + sigma^2/2 = log 2 marks the locus where gamma_1 = 1 and the expected (s+1)-th order interaction equals the s-th order interaction (Eq. eq:exponential_transition).",
      "evidence": "For w ~ N(w_0, sigma^2), <e^w> = e^{w_0 + sigma^2/2}, hence gamma_1 = e^{w_0+sigma^2/2} - 1. Setting gamma_1 = 1 yields w_0 + sigma^2/2 = log 2. The ratio I^Exp_{s+1}/I^Exp_s = gamma_1 follows directly from Eq. exp_exact, confirming this line is the order-crossing locus, independent of s, M, and c_mu.",
      "id": "C5",
      "location": "Section 3.1, Eq. eq:exponential_transition",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "For Gaussian weights, the critical line Delta^Exp_s = 1 is given by w_0^{+/-} = -sigma^2/2 - log[1 +/- sqrt((e^{sigma^2}-1)/(a_s(M_0)-1))], with a_s(M_0) = (M_0+1)^{1/s} (Eq. delta_line).",
      "evidence": "Setting gamma_2/gamma_1^2 = a_s gives (e^{sigma^2}-1)(gamma_1+1)^2 = (a_s-1) gamma_1^2 after using gamma_2 = e^{sigma^2}(gamma_1+1)^2 - 2 gamma_1 - 1. Solving for y = gamma_1+1 = e^{w_0+sigma^2/2} yields y = 1/(1 -/+ r) with r = sqrt((e^{sigma^2}-1)/(a_s-1)), giving w_0 = -sigma^2/2 - log[1 -/+ r], matching the paper modulo the +/- labeling convention.",
      "id": "C6",
      "location": "Section 3.1, Eq. delta_line",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "For arbitrary activation, the small-w fluctuation expansion produces delta I_{k_1,...,k_s} = sum_mu [alpha_{s mu} sum_i delta w_{k_i,mu} + beta_{s mu} sum_i delta w_{k_i,mu}^2 + eta_{s mu} sum_{i<j} delta w_{k_i,mu} delta w_{k_j,mu}], with explicit alpha, beta, eta given by Eqs. alpha, beta, eta.",
      "evidence": "The combinatorial identity sum_{1<=j_1<...<j_n} sum_l x_{k_{jl}} = C(s-1,n-1) sum_l x_{k_l} (and the analogous identity for cross products yielding C(s-2,n-2)) is correctly proved by the j_n=s book-keeping argument in the appendix. For the Exponential case I verified eta^{Exp}_{s mu} = e^{-c_mu + 2 w_0} (e^{w_0} - 1)^{s-2} reduces correctly via sum_{p=0}^{s-2}(-1)^p C(s-2,s-2-p) e^{(s-p) w_0} = e^{2 w_0}(e^{w_0}-1)^{s-2}, matching the paper. The upper-bound notation 'sum_{1<=j_1<...<j_n<=n}^s' is slightly inconsistent typographically (should read '<=s'), but the combinatorial content is correct.",
      "id": "C7",
      "location": "Section 3.2, Eqs. fluct_comp, alpha, beta, eta; Appendix 'Expansion in Eq. fluct_comp'",
      "severity": "info",
      "suggested_fix": "Clarify the index-range notation in Eq. eq:proof and Eq. eq:proof2 by writing 'sum_{1<=j_1<...<j_n<=s}' explicitly to remove the ambiguous '<=n' upper bound."
    },
    {
      "assessment": "supported",
      "claim": "The variance of an s-th order interaction in the Gaussian ensemble under the small-fluctuation expansion is sigma^2 s sum_mu [alpha_mu^2 + 2 sigma^2 beta_mu^2 + ((s-1)/2) sigma^2 eta_mu^2] (Eq. variance_fluct).",
      "evidence": "The three terms contribute independently because each summand alpha sum_i delta w, beta sum_i delta w^2, and eta sum_{i<j} delta w delta w involves different Wick contractions; with delta w i.i.d. Gaussian N(0, sigma^2), the s(s-1)/2 pairs in the eta term give variance s(s-1)/2 * sigma^4 * eta^2 (and s factor from sum over i for alpha and beta terms), exactly matching the displayed formula after factoring s.",
      "id": "C8",
      "location": "Section 3.2, Eq. eq:variance_fluct",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "The interaction-state-space diagrams (Figs. 6-10) demonstrate good agreement between the empirical single-RBM interaction moments (Eq. empirical) and the analytical ensemble-average expressions over a wide region of (w_0, g), including the gamma_1=1 transition for the Exponential case.",
      "evidence": "The figures qualitatively show empirical curves tracking the analytical ones, and the data/code repository (https://github.com/gdisarra/RBM_nonlinearity) is provided, so the figures should be reproducible. However, no quantitative goodness-of-fit metric (e.g., chi-squared, residuals, error bars from multiple RBM realizations) is reported, and the systems are small (N=8, M=20). The text attributes residual disagreement for s>2 near w_0~0 to the leading-order scaling I_s ~ w^s vs second-order expansion, which is internally consistent but is not quantitatively bounded.",
      "id": "C9",
      "location": "Section 3.3, Figs. 6-10 with N=8, M=20",
      "severity": "minor",
      "suggested_fix": "Add quantitative agreement metrics (e.g., relative error, confidence bands across multiple ensemble draws) in Figs. 6-10 captions or supplementary tables, and discuss expected scaling of disagreement with M and N."
    },
    {
      "assessment": "supported",
      "claim": "RBMs with Exponential hidden-unit activation have a strong-coupling regime (large g, or w_0 near the transition) in which the ensemble is dominated by non-decaying interaction models, while Step and ReLU ensembles remain decaying.",
      "evidence": "Fig. 12 directly counts the fraction of decaying-versus-non-decaying interaction models in a 500-sample Gaussian ensemble and shows the Exponential curve dropping near g~10 while Step/ReLU remain near 1. This is consistent with the analytical result that the I_s ordering crosses for Exponential at gamma_1=1 but not for Step/ReLU. The threshold of 10^{-4} used to suppress near-zero high-order interactions is reasonable; sensitivity of the curve to this threshold is not reported but appears to be a minor concern given the magnitude of the effect.",
      "id": "C10",
      "location": "Section 4, Fig. 12 (N=5, M=500, 500 RBM samples)",
      "severity": "info",
      "suggested_fix": "Report sensitivity of Fig. 12 to the 10^{-4} truncation threshold (e.g., overlay results for 10^{-3} and 10^{-5}) to confirm the qualitative non-decaying transition is robust."
    },
    {
      "assessment": "partially_supported",
      "claim": "Training a randomly initialized RBM (N=3, M=4) to match a ground-truth decaying lattice-gas model converges in cross-entropy to the ground truth for Linear, Step, ReLU and Exponential activations, but the recovered interaction terms do not reproduce the ground-truth interactions exactly; non-decaying ground-truth models are learned as decaying approximations except for the Exponential case in the strong-coupling regime.",
      "evidence": "The training experiments use very small systems (N=3, M=4 in main figures; N=10, M=15 in supplementary), a single ground-truth target per regime, and report a single-trajectory Delta_KL value at the end of training rather than statistics over multiple random initializations or random ground-truth draws. The claim that Exponential RBMs uniquely learn non-decaying interactions is supported by Fig. 20 + Fig. 27 but rests on one combination of hyperparameters (w_0=0.3, g=3) and one ground-truth model. The data/code repository (https://github.com/gdisarra/RBM_nonlinearity) is provided and would allow verification of these specific runs, satisfying the proof-as-code requirement, but the claim's generality is not quantified.",
      "id": "C11",
      "location": "Section 4, Figs. 14-20 (N=3, M=4; larger networks in Figs. 24-26)",
      "severity": "minor",
      "suggested_fix": "Provide statistics over multiple random initializations and ground-truth draws (mean and dispersion of Delta_KL) and sweep the (w_0, g) plane for the Exponential case to delineate the boundary of the non-decaying learning regime, rather than rely on a single hyperparameter point."
    },
    {
      "assessment": "partially_supported",
      "claim": "An RBM can in principle represent an arbitrary pure three-body interaction model (Appendix 'RBMs represent arbitrary three-body interaction model.').",
      "evidence": "The appendix demonstrates existence of weight/bias configurations solving Eq. exact for a single target value T=0.5 with N=3, M=4 by numerical root-finding. The statement 'arbitrary T' is asserted but not demonstrated as T is varied; in particular, there is no analytical proof that the nonlinear system has solutions for all T, nor a numerical sweep over T showing solvability holds across a range of three-body strengths.",
      "id": "C12",
      "location": "Appendix; Fig. 21 (T=0.5)",
      "severity": "minor",
      "suggested_fix": "Either (a) provide an analytical existence argument (e.g., via degree counting, surjectivity of the map from RBM weights to (I_{ij}, I_{ijk}) at this dimensionality, or implicit function theorem near a known solution), or (b) include a numerical sweep of T over a representative interval showing solutions persist (and discuss any T at which the solver fails)."
    },
    {
      "assessment": "partially_supported",
      "claim": "The empirical-vs-ensemble averages remain in good agreement even for the trained RBMs (Figs. 14-15), supporting the conclusion that training drives the model into a regime where the Gaussian ensemble approximation captures the first moment of the induced interactions.",
      "evidence": "The figures visually show the trained-RBM empirical moments lying close to the ensemble-average curves, but the post-training weights are not Gaussian i.i.d. — they are correlated due to learning. The match is plausible because training in this small-N regime produces weights with small dispersion, but the paper does not test the i.i.d. Gaussian assumption on the trained weights (e.g., empirical w_0, sigma^2, off-diagonal correlations) to justify why the ensemble formula applies.",
      "id": "C13",
      "location": "Section 4 (Figs. 14-15)",
      "severity": "minor",
      "suggested_fix": "Report empirical first and second moments of the trained weight distribution (or a normality/independence test) to justify use of the Gaussian-ensemble formulae as the predictor."
    },
    {
      "assessment": "supported",
      "claim": "Code and data are available at https://github.com/gdisarra/RBM_nonlinearity (Data availability).",
      "evidence": "A public repository URL is provided. Per the proof-as-code requirement, this satisfies the artifact criterion for the numerical/simulation claims; the repository's contents (training scripts, ensemble generators, interaction-mapping code, plotting scripts for Figs. 6-21) could not be inspected in this review but are nominally accessible.",
      "id": "C14",
      "location": "Data availability section",
      "severity": "info",
      "suggested_fix": "Confirm the repository contains, at minimum, scripts that regenerate each figure (Figs. 3-21) and the random-ensemble fraction-decaying experiment (Fig. 12), and pin software versions in a requirements file or environment.yml."
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

1. shah2020pitfalls: title={The pitfalls of simplicity bias in neural networks}, author={Shah, H. and Tamuly, K. and Raghunathan, A. and Jain, P. and Netrapalli, P.}, journal={Advances in Neural Information Processing Systems}, volume={33}, pages={9573--9585}, year={2020}
2. Decelle_2022: abstract = {Training restricted Boltzmann machines (RBMs) have been challenging for a long time due to the difficulty of precisely computing the log-likelihood gradient. Over the past few decades, many works have proposed more or less successful training recipes but without studying the crucial quantity of the problem: the mixing time, i.e. the number of Monte Carlo iterations needed to sample new configurations from a model. In this work, we show that this mixing time plays a crucial role in the dynamics and stability of the trained model, and that RBMs operate in two well-defined regimes, namely equilibrium and out-of-equilibrium, depending on the interplay between this mixing time of the model and the number of steps, k, used to approximate the gradient. We further show empirically that this mixing time increases with the learning, which often implies a transition from one regime to another as soon as k becomes smaller than this time. In particular, we show that using the popular k (persistent) contrastive divergence approaches, with k small, the dynamics of the learned model are extremely slow and often dominated by strong out-of-equilibrium effects. On the contrary, RBMs trained in equilibrium display faster dynamics, and a smooth convergence to dataset-like configurations during the sampling. Finally, we discuss how to exploit in practice both regimes depending on the task one aims to fulfill: (i) short k can be used to generate convincing samples in short learning times, (ii) large k (or increasingly large) is needed to learn the correct equilibrium distribution of the RBM. Finally, the existence of these two operational regimes seems to be a general property of energy based models trained via likelihood maximization.}, author = {Decelle, A. and Furtlehner, C. and Seoane, B.}, date-added = {2023-03-24 14:56:58 -0700}, date-modified = {2023-03-24 14:56:58 -0700}, doi = {10.1088/1742-5468/ac98a7}, journal = {Journal of Statistical Mechanics: Theory and Experiment}, month = {nov}, number = {11}, pages = {114009}, publisher = {IOP Publishing and SISSA}, title = {Equilibrium and non-equilibrium regimes in the learning of restricted Boltzmann machines*}, url = {https://dx.doi.org/10.1088/1742-5468/ac98a7}, volume = {2022}, year = {2022}, bdsk-url-1 = {https://dx.doi.org/10.1088/1742-5468/ac98a7}} @article{10.21468/SciPostPhys.14.3.032, author = {B{\'e}reux, N. and Decelle, A. and Furtlehner, C. and Seoane, B.}, date-added = {2023-03-23 18:21:00 -0700}, date-modified = {2023-03-23 18:21:00 -0700}, doi = {10.21468/SciPostPhys.14.3.032}, journal = {SciPost Phys.}, pages = {032}, publisher = {SciPost}, title = {{Learning a restricted Boltzmann machine using biased Monte Carlo sampling}}, url = {https://scipost.org/10.21468/SciPostPhys.14.3.032}, volume = {14}, year = {2023}, bdsk-url-1 = {https://scipost.org/10.21468/SciPostPhys.14.3.032}, bdsk-url-2 = {https://doi.org/10.21468/SciPostPhys.14.3.032}} @article{salakhutdinov2008learning, author = {Salakhutdinov, Ruslan}, date-added = {2023-03-23 15:04:53 -0700}, date-modified = {2023-03-23 15:04:53 -0700}, journal = {Utml Tr}, pages = {21}, title = {Learning and evaluating Boltzmann machines}, volume = {2}, year = {2008}} @inbook{murphy2013machine27, added-at = {2017-02-27T11:22:42.000+0100}, address = {Cambridge, Mass. [u.a.]}, author = {Murphy, Kevin P.}, biburl = {https://www.bibsonomy.org/bibtex/270148d65a6a66e0ae962bf22c5f66148/hotho}, chapter = {27, Latent variable models for discrete data}, date-added = {2023-03-17 11:51:39 -0700}, date-modified = {2023-03-17 12:04:19 -0700}, description = {Machine Learning: A Probabilistic Perspective (Adaptive Computation and Machine Learning series): Kevin P. Murphy: 9780262018029: Amazon.com: Books}, interhash = {e99d8a06cc36507b05c38192ab80573e}, intrahash = {70148d65a6a66e0ae962bf22c5f66148}, isbn = {9780262018029 0262018020}, publisher = {MIT Press}, refid = {904442949}, timestamp = {2017-02-27T11:22:42.000+0100}, title = {Machine learning : a probabilistic perspective}, url = {https://www.amazon.com/Machine-Learning-Probabilistic-Perspective-Computation/dp/0262018020/ref=sr_1_2?ie=UTF8&qid=1336857747&sr=8-2}, year = 2013, bdsk-url-1 = {https://www.amazon.com/Machine-Learning-Probabilistic-Perspective-Computation/dp/0262018020/ref=sr_1_2?ie=UTF8&qid=1336857747&sr=8-2}} @article{PhysRevX.8.041006, author = {Tramel, Eric W. and Gabri\'e, Marylou and Manoel, Andre and Caltagirone, Francesco and Krzakala, Florent}, date-added = {2023-03-16 11:56:46 -0700}, date-modified = {2023-03-16 11:56:46 -0700}, doi = {10.1103/PhysRevX.8.041006}, issue = {4}, journal = {Phys. Rev. X}, month = {Oct}, numpages = {29}, pages = {041006}, publisher = {American Physical Society}, title = {Deterministic and Generalized Framework for Unsupervised Learning with Restricted Boltzmann Machines}, url = {https://link.aps.org/doi/10.1103/PhysRevX.8.041006}, volume = {8}, year = {2018}, bdsk-url-1 = {https://link.aps.org/doi/10.1103/PhysRevX.8.041006}, bdsk-url-2 = {https://doi.org/10.1103/PhysRevX.8.041006}} @article{Bolthausen, abstract = {We propose an iterative scheme for the solutions of the TAP-equations in the Sherrington--Kirkpatrick model which is shown to converge up to and including the de Almeida--Thouless line. The main tool is a representation of the iterations which reveals an interesting structure of them. This representation does not depend on the temperature parameter, but for temperatures below the de Almeida--Thouless line, it contains a part which does not converge to zero in the limit.}, author = {Bolthausen, Erwin}, date = {2014/01/01}, date-added = {2023-03-15 17:26:50 -0700}, date-modified = {2023-03-15 17:26:50 -0700}, doi = {10.1007/s00220-013-1862-3}, id = {Bolthausen2014}, isbn = {1432-0916}, journal = {Communications in Mathematical Physics}, number = {1}, pages = {333--366}, title = {An Iterative Construction of Solutions of the TAP Equations for the Sherrington--Kirkpatrick Model}, url = {https://doi.org/10.1007/s00220-013-1862-3}, volume = {325}, year = {2014}, bdsk-url-1 = {https://doi.org/10.1007/s00220-013-1862-3}} @article{Georges_1991, author = {A Georges and J S Yedidia}, date-added = {2023-03-15 16:46:23 -0700}, date-modified = {2023-03-15 16:48:29 -0700}, journal = {Journal of Physics A: Mathematical and General}, month = {May}, number = {9}, pages = {2173}, title = {How to expand around mean-field theory using high-temperature expansions}, volume = {24}, year = {1991}} @inproceedings{10.1007/3-540-46084-5_57, abstract = {We present a new learning algorithm for Mean Field Boltzmann Machines based on the contrastive divergence optimization criterion. In addition to minimizing the divergence between the data distribution and the equilibrium distribution, we maximize the divergence between one-step reconstructions of the data and the equilibrium distribution. This eliminates the need to estimate equilibrium statistics, so we do not need to approximate the multimodal probability distribution of the free network with the unimodal mean field distribution. We test the learning algorithm on the classification of digits.}, address = {Berlin, Heidelberg}, author = {Welling, Max and Hinton, Geoffrey E.}, booktitle = {Artificial Neural Networks --- ICANN 2002}, date-added = {2023-03-15 15:51:19 -0700}, date-modified = {2023-03-15 15:51:19 -0700}, editor = {Dorronsoro, Jos{\'e} R.}, isbn = {978-3-540-46084-8}, pages = {351--357}, publisher = {Springer Berlin Heidelberg}, title = {A New Learning Algorithm for Mean Field Boltzmann Machines}, year = {2002}} @article{PhysRevE.102.030301, author = {Huang, Haiping}, date-added = {2023-03-09 17:27:22 -0800}, date-modified = {2023-03-09 17:27:22 -0800}, doi = {10.1103/PhysRevE.102.030301}, issue = {3}, journal = {Phys. Rev. E}, month = {Sep}, numpages = {6}, pages = {030301}, publisher = {American Physical Society}, title = {Variational mean-field theory for training restricted Boltzmann machines with binary synapses}, url = {https://link.aps.org/doi/10.1103/PhysRevE.102.030301}, volume = {102}, year = {2020}, bdsk-url-1 = {https://link.aps.org/doi/10.1103/PhysRevE.102.030301}, bdsk-url-2 = {https://doi.org/10.1103/PhysRevE.102.030301}} @article{Martin-Mayor:2011aa, abstract = {Tethering methods allow us to perform Monte Carlo simulations in ensembles with conserved quantities. Specifically, one couples a reservoir to the physical magnitude of interest, and studies the statistical ensemble where the total magnitude (system+reservoir) is conserved. The reservoir is actually integrated out, which leaves us with a fluctuation-dissipation formalism that allows us to recover the appropriate Helmholtz effective potential with great accuracy. These methods are demonstrating a remarkable flexibility. In fact, we illustrate two very different applications: hard spheres crystallization and the phase transition of the diluted antiferromagnet in a field (the physical realization of the random field Ising model). The tethered approach holds the promise to transform cartoon drawings of corrugated free-energy landscapes into real computations. Besides, it reduces the algorithmic dynamic slowing-down, probably because the conservation law holds non-locally.}, author = {Martin-Mayor, V. and Seoane, B. and Yllanes, D.}, date = {2011/08/01}, date-added = {2023-03-09 17:17:55 -0800}, date-modified = {2023-03-09 17:17:55 -0800}, doi = {10.1007/s10955-011-0261-4}, id = {Martin-Mayor2011}, isbn = {1572-9613}, journal = {Journal of Statistical Physics}, number = {3}, pages = {554--596}, title = {Tethered Monte Carlo: Managing Rugged Free-Energy Landscapes with a Helmholtz-Potential Formalism}, url = {https://doi.org/10.1007/s10955-011-0261-4}, volume = {144}, year = {2011}, bdsk-url-1 = {https://doi.org/10.1007/s10955-011-0261-4}} @article{DECELLE2022128154, abstract = {The recent progresses in Machine Learning opened the door to actual applications of learning algorithms but also to new research directions both in the field of Machine Learning directly and, at the edges with other disciplines. The case that interests us is the interface with physics, and more specifically Statistical Physics. In this short lecture, I will try to present first a brief introduction to Machine Learning from the angle of neural networks. After explaining quickly some fundamental models and global aspects of the training procedure, I will discuss into more detail two examples illustrate what can be done from the Statistical Physics perspective.}, author = {Decelle, A.}, date-added = {2023-03-09 13:51:14 -0800}, date-modified = {2023-03-09 13:51:14 -0800}, doi = {https://doi.org/10.1016/j.physa.2022.128154}, issn = {0378-4371}, journal = {Physica A: Statistical Mechanics and its Applications}, keywords = {Machine Learning, Perceptron, Restricted Boltzmann Machine, Phase diagram}, pages = {128154}, title = {An Introduction to Machine Learning: a perspective from Statistical Physics}, url = {https://www.sciencedirect.com/science/article/pii/S0378437122007129}, year = {2022}, bdsk-url-1 = {https://www.sciencedirect.com/science/article/pii/S0378437122007129}, bdsk-url-2 = {https://doi.org/10.1016/j.physa.2022.128154}} @article{Decelle:2018ab, abstract = {We investigate the thermodynamic properties of a restricted Boltzmann machine (RBM), a simple energy-based generative model used in the context of unsupervised learning. Assuming the information content of this model to be mainly reflected by the spectral properties of its weight matrix W, we try to make a realistic analysis by averaging over an appropriate statistical ensemble of RBMs. First, a phase diagram is derived. Otherwise similar to that of the Sherrington--Kirkpatrick (SK) model with ferromagnetic couplings, the RBM's phase diagram presents a ferromagnetic phase which may or may not be of compositional type depending on the kurtosis of the distribution of the components of the singular vectors of W. Subsequently, the learning dynamics of the RBM is studied in the thermodynamic limit. A ``typical''learning trajectory is shown to solve an effective dynamical equation, based on the aforementioned ensemble average and explicitly involving order parameters obtained from the thermodynamic analysis. In particular, this let us show how the evolution of the dominant singular values of W, and thus of the unstable modes, is driven by the input data. At the beginning of the training, in which the RBM is found to operate in the linear regime, the unstable modes reflect the dominant covariance modes of the data. In the non-linear regime, instead, the selected modes interact and eventually impose a matching of the order parameters to their empirical counterparts estimated from the data. Finally, we illustrate our considerations by performing experiments on both artificial and real data, showing in particular how the RBM operates in the ferromagnetic compositional phase.}, author = {Decelle, A. and Fissore, G. and Furtlehner, C.}, date = {2018/09/01}, date-added = {2023-02-27 19:52:42 -0800}, date-modified = {2023-02-27 19:52:42 -0800}, doi = {10.1007/s10955-018-2105-y}, id = {Decelle2018}, isbn = {1572-9613}, journal = {Journal of Statistical Physics}, number = {6}, pages = {1576--1608}, title = {Thermodynamics of Restricted Boltzmann Machines and Related Learning Dynamics}, url = {https://doi.org/10.1007/s10955-018-2105-y}, volume = {172}, year = {2018}, bdsk-url-1 = {https://doi.org/10.1007/s10955-018-2105-y}} @article{Huang_2017, abstract = {Revealing hidden features in unlabeled data is called unsupervised feature learning, which plays an important role in pretraining a deep neural network. Here we provide a statistical mechanics analysis of the unsupervised learning in a restricted Boltzmann machine with binary synapses. A message passing equation to infer the hidden feature is derived, and furthermore, variants of this equation are analyzed. A statistical analysis by replica theory describes the thermodynamic properties of the model. Our analysis confirms an entropy crisis preceding the non-convergence of the message passing equation, suggesting a discontinuous phase transition as a key characteristic of the restricted Boltzmann machine. Continuous phase transition is also confirmed depending on the embedded feature strength in the data. The mean-field result under the replica symmetric assumption agrees with that obtained by running message passing algorithms on single instances of finite sizes. Interestingly, in an approximate Hopfield model, the entropy crisis is absent, and a continuous phase transition is observed instead. We also develop an iterative equation to infer the hyper-parameter (temperature) hidden in the data, which in physics corresponds to iteratively imposing Nishimori condition. Our study provides insights towards understanding the thermodynamic properties of the restricted Boltzmann machine learning, and moreover important theoretical basis to build simplified deep networks.}, author = {Haiping Huang}, date-added = {2023-02-24 16:13:28 -0800}, date-modified = {2023-02-24 16:13:28 -0800}, doi = {10.1088/1742-5468/aa6ddc}, journal = {Journal of Statistical Mechanics: Theory and Experiment}, month = {may}, number = {5}, pages = {053302}, publisher = {IOP Publishing and SISSA}, title = {Statistical mechanics of unsupervised feature learning in a restricted Boltzmann machine with binary synapses}, url = {https://dx.doi.org/10.1088/1742-5468/aa6ddc}, volume = {2017}, year = {2017}, bdsk-url-1 = {https://dx.doi.org/10.1088/1742-5468/aa6ddc}} @article{Jangjoo, title = {Lost in Retraining: Closed-Loop Learning and Model Collapse in Exponential Families}, author = {Jangjoo, F. and di Sarra, G. and Marsili, M. and Roudi, Y.}, journal = {Phys. Rev. Lett.}, volume = {136}, issue = {19}, pages = {197301}, numpages = {6}, year = {2026}, month = {May}, publisher = {American Physical Society}, doi = {10.1103/156q-3ngc}, url = {https://link.aps.org/doi/10.1103/156q-3ngc} doi:[10.1088/1742-5468/ac98a7](https://doi.org/10.1088/1742-5468/ac98a7) arXiv:[2022.12815](https://arxiv.org/abs/2022.12815)
3. PhysRevE.91.050101: author = {Huang, Haiping and Toyoizumi, Taro}, date-added = {2023-02-24 16:09:34 -0800}, date-modified = {2023-02-24 16:09:34 -0800}, doi = {10.1103/PhysRevE.91.050101}, issue = {5}, journal = {Phys. Rev. E}, month = {May}, numpages = {5}, pages = {050101}, publisher = {American Physical Society}, title = {Advanced mean-field theory of the restricted Boltzmann machine}, url = {https://link.aps.org/doi/10.1103/PhysRevE.91.050101}, volume = {91}, year = {2015}, bdsk-url-1 = {https://link.aps.org/doi/10.1103/PhysRevE.91.050101}, bdsk-url-2 = {https://doi.org/10.1103/PhysRevE.91.050101}} @article{PhysRevLett.124.248302, author = {Hou, Tianqi and Huang, Haiping}, date-added = {2023-02-24 16:02:08 -0800}, date-modified = {2023-02-24 16:02:08 -0800}, doi = {10.1103/PhysRevLett.124.248302}, issue = {24}, journal = {Phys. Rev. Lett.}, month = {Jun}, numpages = {5}, pages = {248302}, publisher = {American Physical Society}, title = {Statistical Physics of Unsupervised Learning with Prior Knowledge in Neural Networks}, url = {https://link.aps.org/doi/10.1103/PhysRevLett.124.248302}, volume = {124}, year = {2020}, bdsk-url-1 = {https://link.aps.org/doi/10.1103/PhysRevLett.124.248302}, bdsk-url-2 = {https://doi.org/10.1103/PhysRevLett.124.248302}} @article{Agliari17, author = {Agliari, E. and Barra, A. and Longo, C. and Tantari, D.}, date-added = {2023-02-24 15:51:11 -0800}, date-modified = {2023-02-24 15:52:23 -0800}, journal = {Journal of Statistical Physics}, number = {5}, pages = {1085-1104}, title = {Neural Networks Retrieving Boolean Patterns in a Sea of Gaussian Ones}, volume = {168}, year = {2017}} @book{amit1989, author = {Amit, Daniel J}, date-added = {2023-02-24 11:18:08 -0800}, date-modified = {2023-02-24 11:23:05 -0800}, publisher = {Cambridge university press}, title = {Modeling brain function: The world of attractor neural networks}, year = {1989}} @article{9801668, author = {Fachechi, A. and Barra, A. and Agliari, E. and Alemanno, F.}, date-added = {2023-02-23 15:37:42 -0800}, date-modified = {2023-02-23 15:47:41 -0800}, doi = {10.1109/TNNLS.2022.3182882}, journal = {IEEE Transactions on Neural Networks and Learning Systems}, pages = {1-10}, title = {Outperforming RBM Feature-Extraction Capabilities by "Dreaming" Mechanism}, year = {2022}, bdsk-url-1 = {https://doi.org/10.1109/TNNLS.2022.3182882}} @article{AGLIARI2022232, abstract = {We consider restricted Boltzmann machine (RBMs) trained over an unstructured dataset made of blurred copies of definite but unavailable ``archetypes'' and we show that there exists a critical sample size beyond which the RBM can learn archetypes, namely the machine can successfully play as a generative model or as a classifier, according to the operational routine. In general, assessing a critical sample size (possibly in relation to the quality of the dataset) is still an open problem in machine learning. Here, restricting to the random theory, where shallow networks suffice and the ``grandmother-cell'' scenario is correct, we leverage the formal equivalence between RBMs and Hopfield networks, to obtain a phase diagram for both the neural architectures which highlights regions, in the space of the control parameters (i.e., number of archetypes, number of neurons, size and quality of the training set), where learning can be accomplished. Our investigations are led by analytical methods based on the statistical-mechanics of disordered systems and results are further corroborated by extensive Monte Carlo simulations.}, author = {Agliari E. and Alemanno F. and Barra A. and {De Marzo} G.}, date-added = {2023-02-23 15:37:01 -0800}, date-modified = {2023-02-24 16:01:45 -0800}, doi = {https://doi.org/10.1016/j.neunet.2022.01.017}, issn = {0893-6080}, journal = {Neural Networks}, pages = {232-253}, title = {The emergence of a concept in shallow neural networks}, url = {https://www.sciencedirect.com/science/article/pii/S0893608022000272}, volume = {148}, year = {2022}, bdsk-url-1 = {https://www.sciencedirect.com/science/article/pii/S0893608022000272}, bdsk-url-2 = {https://doi.org/10.1016/j.neunet.2022.01.017}} @article{AGLIARI2022126716, abstract = {The formal equivalence between the Hopfield network (HN) and the Boltzmann Machine (BM) has been well established in the context of random, unstructured and unbiased patterns to be retrieved and recognised. Here we extend this equivalence to the case of ``biased'' patterns, that is patterns which display an unbalanced count of positive neurons/pixels: starting from previous results of the bias paradigm for the HN, we construct the BM's equivalent Hamiltonian introducing a constraint parameter for the bias correction. We show analytically and numerically that the parameters suggested by equivalence are fixed points under contrastive divergence evolution when exposed to a dataset of blurred examples of each pattern, also enjoying large basins of attraction when the model suffers of a noisy initialisation. These results are also shown to be robust against increasing storage of the models, and increasing bias in the reference patterns. This picture, together with analytical derivation of HN's phase diagram via self-consistency equations, allows us to enhance our mathematical control on BM's performance when approaching more realistic datasets.}, author = {E. Agliari and F. E. Leonelli and C. Marullo}, date-added = {2023-02-23 15:36:26 -0800}, date-modified = {2023-02-24 16:01:50 -0800}, doi = {https://doi.org/10.1016/j.amc.2021.126716}, issn = {0096-3003}, journal = {Applied Mathematics and Computation}, pages = {126716}, title = {Storing, learning and retrieving biased patterns}, url = {https://www.sciencedirect.com/science/article/pii/S0096300321008006}, volume = {415}, year = {2022}, bdsk-url-1 = {https://www.sciencedirect.com/science/article/pii/S0096300321008006}, bdsk-url-2 = {https://doi.org/10.1016/j.amc.2021.126716}} @article{LEONELLI2021314, abstract = {Restricted Boltzmann machines (RBMs) with a binary visible layer of size N and a Gaussian hidden layer of size P have been proved to be equivalent to a Hopfield neural network (HNN) made of N binary neurons and storing P patterns ξ, as long as the weights w in the former are identified with the patterns. Here we aim to leverage this equivalence to find effective initialisations for weights in the RBM when what is available is a set of noisy examples of each pattern, aiming to translate statistical mechanics background available for HNN to the study of RBM's learning and retrieval abilities. In particular, given a set of definite, structureless patterns we build a sample of blurred examples and prove that the initialisation where w corresponds to the empirical average ξ¯ over the sample is a fixed point under stochastic gradient descent. Further, as a toy application of the duality between HNN and RBM, we consider the simplest random auto-encoder (a three layer network made of two RBMs coupled by their hidden layer) and evidence that, as long as the parameter setting corresponds to the retrieval region of the dual HNN, reconstruction and denoising can be accomplished trivially, while when the system is in the spin-glass phase inference algorithms are necessary. This questions the need for larger retrieval regions which we obtain by applying a Gram--Schmidt orthogonalisation to the patterns: in fact, this procedure yields to a set of patterns devoid of correlations and for which the largest retrieval region can be accomplished. Finally we consider an application of duality also in a structured case: we test this approach on the MNIST dataset, and obtain that the network performs already ∼67% of successful classifications, suggesting it can be exploited as a computationally-cheap pre-training.}, author = {Leonelli, F. E. and Agliari, E. and Albanese, L. and Barra, A.}, date-added = {2023-02-23 15:35:52 -0800}, date-modified = {2023-02-24 16:01:42 -0800}, doi = {https://doi.org/10.1016/j.neunet.2021.06.017}, issn = {0893-6080}, journal = {Neural Networks}, pages = {314-326}, title = {On the effective initialisation for restricted Boltzmann machines via duality with Hopfield model}, url = {https://www.sciencedirect.com/science/article/pii/S0893608021002495}, volume = {143}, year = {2021}, bdsk-url-1 = {https://www.sciencedirect.com/science/article/pii/S0893608021002495}, bdsk-url-2 = {https://doi.org/10.1016/j.neunet.2021.06.017}} @article{PhysRevLett.113.238106, author = {Sollich, P. and Tantari, D. and Annibale, A. and Barra, A.}, date-added = {2023-02-23 11:40:50 -0800}, date-modified = {2023-02-23 11:40:50 -0800}, doi = {10.1103/PhysRevLett.113.238106}, issue = {23}, journal = {Phys. Rev. Lett.}, month = {Dec}, numpages = {5}, pages = {238106}, publisher = {American Physical Society}, title = {Extensive Parallel Processing on Scale-Free Networks}, url = {https://link.aps.org/doi/10.1103/PhysRevLett.113.238106}, volume = {113}, year = {2014}, bdsk-url-1 = {https://link.aps.org/doi/10.1103/PhysRevLett.113.238106}, bdsk-url-2 = {https://doi.org/10.1103/PhysRevLett.113.238106}} @article{Agliari_2013b, abstract = {Associative network models featuring multi-tasking properties have been introduced recently and studied in the low-load regime, where the number P of simultaneously retrievable patterns scales with the number N of nodes as P ∼ log N. In addition to their relevance in artificial intelligence, these models are increasingly important in immunology, where stored patterns represent strategies to fight pathogens and nodes represent lymphocyte clones. They allow us to understand the crucial ability of the immune system to respond simultaneously to multiple distinct antigen invasions. Here we develop further the statistical mechanical analysis of such systems, by studying the medium-load regime, P ∼ Nδ with δ ∈ (0, 1]. We derive three main results. First, we reveal the nontrivial architecture of these networks: they exhibit a high degree of modularity and clustering, which is linked to their retrieval abilities. Second, by solving the model we demonstrate for δ &lt; 1 the existence of large regions in the phase diagram where the network can retrieve all stored patterns simultaneously. Finally, in the high-load regime δ = 1 we find that the system behaves as a spin-glass, suggesting that finite-connectivity frameworks are required to achieve effective retrieval.}, author = {E Agliari and A Annibale and A Barra and A C C Coolen and D Tantari}, date-added = {2023-02-23 11:30:38 -0800}, date-modified = {2023-02-23 11:30:38 -0800}, doi = {10.1088/1751-8113/46/33/335101}, journal = {Journal of Physics A: Mathematical and Theoretical}, month = {jul}, number = {33}, pages = {335101}, publisher = {IOP Publishing}, title = {Immune networks: multi-tasking capabilities at medium load}, url = {https://dx.doi.org/10.1088/1751-8113/46/33/335101}, volume = {46}, year = {2013}, bdsk-url-1 = {https://dx.doi.org/10.1088/1751-8113/46/33/335101}} @article{Harsh_2020, abstract = {Distributions of data or sensory stimuli often enjoy underlying invariances. How and to what extent those symmetries are captured by unsupervised learning methods is a relevant question in machine learning and in computational neuroscience. We study here, through a combination of numerical and analytical tools, the learning dynamics of restricted Boltzmann machines (RBM), a neural network paradigm for representation learning. As learning proceeds from a random configuration of the network weights, we show the existence of, and characterize a symmetry-breaking phenomenon, in which the latent variables acquire receptive fields focusing on limited parts of the invariant manifold supporting the data. The symmetry is restored at large learning times through the diffusion of the receptive field over the invariant manifold; hence, the RBM effectively spans a continuous attractor in the space of network weights. This symmetry-breaking phenomenon takes place only if the amount of data available for training exceeds some critical value, depending on the network size and the intensity of symmetry-induced correlations in the data; below this `retarded-learning' threshold, the network weights are essentially noisy and overfit the data.}, author = {Moshir Harsh and J{\'e}r{\^o}me Tubiana and Simona Cocco and Remi Monasson}, date-added = {2023-02-23 11:19:56 -0800}, date-modified = {2023-02-23 11:19:56 -0800}, doi = {10.1088/1751-8121/ab7d00}, journal = {Journal of Physics A: Mathematical and Theoretical}, month = {apr}, number = {17}, pages = {174002}, publisher = {IOP Publishing}, title = {`Place-cell' emergence and learning of invariant data with restricted Boltzmann machines: breaking and dynamical restoration of continuous symmetries in the weight space}, url = {https://dx.doi.org/10.1088/1751-8121/ab7d00}, volume = {53}, year = {2020}, bdsk-url-1 = {https://dx.doi.org/10.1088/1751-8121/ab7d00}} @article{deeptemp, author = {Roussel, Cl{\'e}ment and Fernandez-De-Cossio-Diaz, Jorge and Cocco, Simona and Monasson, R{\'e}mi}, date-added = {2023-02-23 09:44:43 -0800}, date-modified = {2023-02-23 09:55:27 -0800}, journal = {hal-03919483f}, title = {Deep Tempering with Nested Restricted Boltzmann Machines}, year = {2023}} @article{PhysRevA.32.1007, author = {Amit, Daniel J. and Gutfreund, Hanoch and Sompolinsky, H.}, date-added = {2023-02-22 14:42:21 -0800}, date-modified = {2023-02-22 14:42:21 -0800}, doi = {10.1103/PhysRevA.32.1007}, issue = {2}, journal = {Phys. Rev. A}, month = {Aug}, numpages = {0}, pages = {1007--1018}, publisher = {American Physical Society}, title = {Spin-glass models of neural networks}, url = {https://link.aps.org/doi/10.1103/PhysRevA.32.1007}, volume = {32}, year = {1985}, bdsk-url-1 = {https://link.aps.org/doi/10.1103/PhysRevA.32.1007}, bdsk-url-2 = {https://doi.org/10.1103/PhysRevA.32.1007}} @inproceedings{7410480, abstract = {Rectified activation units (rectifiers) are essential for state-of-the-art neural networks. In this work, we study rectifier neural networks for image classification from two aspects. First, we propose a Parametric Rectified Linear Unit (PReLU) that generalizes the traditional rectified unit. PReLU improves model fitting with nearly zero extra computational cost and little overfitting risk. Second, we derive a robust initialization method that particularly considers the rectifier nonlinearities. This method enables us to train extremely deep rectified models directly from scratch and to investigate deeper or wider network architectures. Based on the learnable activation and advanced initialization, we achieve 4.94% top-5 test error on the ImageNet 2012 classification dataset. This is a 26% relative improvement over the ILSVRC 2014 winner (GoogLeNet, 6.66% [33]). To our knowledge, our result is the first to surpass the reported human-level performance (5.1%, [26]) on this dataset.}, address = {Los Alamitos, CA, USA}, author = {K. He and X. Zhang and S. Ren and J. Sun}, booktitle = {2015 IEEE International Conference on Computer Vision (ICCV)}, date-added = {2023-02-17 11:05:35 -0800}, date-modified = {2023-02-22 14:42:47 -0800}, doi = {10.1109/ICCV.2015.123}, issn = {2380-7504}, month = {dec}, pages = {1026-1034}, publisher = {IEEE Computer Society}, title = {Delving Deep into Rectifiers: Surpassing Human-Level Performance on ImageNet Classification}, url = {https://doi.ieeecomputersociety.org/10.1109/ICCV.2015.123}, year = {2015}, bdsk-url-1 = {https://doi.ieeecomputersociety.org/10.1109/ICCV.2015.123}, bdsk-url-2 = {https://doi.org/10.1109/ICCV.2015.123} doi:[10.1103/PhysRevE.91.050101](https://doi.org/10.1103/PhysRevE.91.050101) arXiv:[2022.31828](https://arxiv.org/abs/2022.31828)
4. agliari2025networks: title={Networks of Hebbian networks: more is different}, author={Agliari, E. and Alessandrelli, A. and Barra, A. and Centonze, M.S. and Ricci-Tersenghi, F.}, journal={Neural Networks}, pages={108181}, year={2025}, publisher={Elsevier}
5. agliari2025generalized: title={Generalized hetero-associative neural networks}, author={Agliari, E. and Alessandrelli, A. and Barra, A. and Centonze, M.S. and Ricci-Tersenghi, F.}, journal={Journal of Statistical Mechanics: Theory and Experiment}, volume={2025}, number={1}, pages={013302}, year={2025}, publisher={IOP Publishing}
6. fachechi2025fundamental: title={Fundamental operating regimes, hyper-parameter fine-tuning and glassiness: towards an interpretable replica-theory for trained restricted Boltzmann machines}, author={Fachechi, A. and Agliari, E. and Aquaro, M. and Coolen, A. and Mulder, M.}, journal={Journal of Physics A: Mathematical and Theoretical}, volume={58}, number={6}, pages={065004}, year={2025}, publisher={IOP Publishing}
7. PhysRevA.41.3355: author = {Marcus, C. M. and Waugh, F. R. and Westervelt, R. M.}, date-added = {2023-02-16 15:37:35 -0800}, date-modified = {2023-02-16 15:37:35 -0800}, doi = {10.1103/PhysRevA.41.3355}, issue = {6}, journal = {Phys. Rev. A}, month = {Mar}, numpages = {0}, pages = {3355--3364}, publisher = {American Physical Society}, title = {Associative memory in an analog iterated-map neural network}, url = {https://link.aps.org/doi/10.1103/PhysRevA.41.3355}, volume = {41}, year = {1990}, bdsk-url-1 = {https://link.aps.org/doi/10.1103/PhysRevA.41.3355}, bdsk-url-2 = {https://doi.org/10.1103/PhysRevA.41.3355}} @article{AMIT198730, abstract = {The Hopfield model of a neural network is studied near its saturation, i.e., when the number p of stored patterns increases with the size of the network N, as p = αN. The mean-field theory for this system is described in detail. The system possesses, at low α, both a spin-glass phase and 2p dynamically stable degenerate ferromagnetic phases. The latter have essentially full macroscopic overlaps with the memorized patterns, and provide effective associative memory, despite the spin-glass features. The network can retrieve patterns, at T = 0, with an error of less than 1.5% for α <αc = 0.14. At αc the ferromagnetic (FM) retrieval states disappear discontinuously. Numerical simulations show that even above αc the overlaps with the sored patterns are not zero, but the level of error precludes meaningful retrieval. The difference between the statistical mechanics and the simulations is discussed. As α decreases below 0.05 the FM retrieval states become ground states of the system, and for α < 0.03 mixture states appear. The level of storage creates noise, akin to temperature at finite p. Replica symmetry breaking is found to be salient in the spin-glass state, but in the retrieval states it appears at extremely low temperatures, and is argued to have a very weak effect. This is corroborated by simulations. The study is extended to survey the phase diagram of the system in the presence of stochastic synaptic noise (temperature), and the effect of external fields (neuronal thresholds) coupled to groups of patterns. It is found that a field coupled to many patterns has a very limited utility in enhancing their learning. Finally, we discuss the robustness of the network to the relaxation of various underlying assumptions, as well as some new trends in the study of neural networks.}, author = {Daniel J Amit and Hanoch Gutfreund and H Sompolinsky}, date-added = {2023-02-16 13:04:42 -0800}, date-modified = {2023-02-16 13:04:42 -0800}, doi = {https://doi.org/10.1016/0003-4916(87)90092-3}, issn = {0003-4916}, journal = {Annals of Physics}, number = {1}, pages = {30-67}, title = {Statistical mechanics of neural networks near saturation}, url = {https://www.sciencedirect.com/science/article/pii/0003491687900923}, volume = {173}, year = {1987}, bdsk-url-1 = {https://www.sciencedirect.com/science/article/pii/0003491687900923}, bdsk-url-2 = {https://doi.org/10.1016/0003-4916(87)90092-3}} @article{ROUDI2015110, abstract = {Learning and inferring features that generate sensory input is a task continuously performed by cortex. In recent years, novel algorithms and learning rules have been proposed that allow neural network models to learn such features from natural images, written text, audio signals, etc. These networks usually involve deep architectures with many layers of hidden neurons. Here we review recent advancements in this area emphasizing, amongst other things, the processing of dynamical inputs by networks with hidden nodes and the role of single neuron models. These points and the questions they arise can provide conceptual advancements in understanding of learning in the cortex and the relationship between machine learning approaches to learning with hidden nodes and those in cortical circuits.}, author = {Yasser Roudi and Graham Taylor}, date-added = {2023-02-06 14:41:19 +0100}, date-modified = {2023-02-06 14:41:19 +0100}, doi = {https://doi.org/10.1016/j.conb.2015.07.006}, issn = {0959-4388}, journal = {Current Opinion in Neurobiology}, note = {Circuit plasticity and memory}, pages = {110-118}, title = {Learning with hidden variables}, url = {https://www.sciencedirect.com/science/article/pii/S0959438815001245}, volume = {35}, year = {2015}, bdsk-url-1 = {https://www.sciencedirect.com/science/article/pii/S0959438815001245}, bdsk-url-2 = {https://doi.org/10.1016/j.conb.2015.07.006}} @article{PhysRevLett.64.1986, author = {Waugh, F. R. and Marcus, C. M. and Westervelt, R. M.}, date-added = {2023-02-06 14:04:23 +0100}, date-modified = {2023-02-06 14:04:23 +0100}, doi = {10.1103/PhysRevLett.64.1986}, issue = {16}, journal = {Phys. Rev. Lett.}, month = {Apr}, numpages = {0}, pages = {1986--1989}, publisher = {American Physical Society}, title = {Fixed-point attractors in analog neural computation}, url = {https://link.aps.org/doi/10.1103/PhysRevLett.64.1986}, volume = {64}, year = {1990}, bdsk-url-1 = {https://link.aps.org/doi/10.1103/PhysRevLett.64.1986}, bdsk-url-2 = {https://doi.org/10.1103/PhysRevLett.64.1986}} @article{PhysRevA.42.7459, author = {Fukai, T. and Shiino, M.}, date-added = {2023-02-06 13:18:37 +0100}, date-modified = {2023-02-06 13:18:37 +0100}, doi = {10.1103/PhysRevA.42.7459}, issue = {12}, journal = {Phys. Rev. A}, month = {Dec}, numpages = {0}, pages = {7459--7466}, publisher = {American Physical Society}, title = {Large suppression of spurious states in neural networks of nonlinear analog neurons}, url = {https://link.aps.org/doi/10.1103/PhysRevA.42.7459}, volume = {42}, year = {1990}, bdsk-url-1 = {https://link.aps.org/doi/10.1103/PhysRevA.42.7459}, bdsk-url-2 = {https://doi.org/10.1103/PhysRevA.42.7459}} @article{Treves1, author = {Alessandro Treves}, date-added = {2023-02-06 13:15:37 +0100}, date-modified = {2023-02-06 13:16:52 +0100}, journal = {Journal of Physics A: Mathematical and General}, number = {11}, title = {Are spin-glass effects relevant to understanding realistic auto-associative networks?}, volume = {24}, year = {1991}} @inproceedings{pmlr-v9-marlin10a, abstract = {Recent research has seen the proposal of several new inductive principles designed specifically to avoid the problems associated with maximum likelihood learning in models with intractable partition functions. In this paper, we study learning methods for binary restricted Boltzmann machines (RBMs) based on ratio matching and generalized score matching. We compare these new RBM learning methods to a range of existing learning methods including stochastic maximum likelihood, contrastive divergence, and pseudo-likelihood. We perform an extensive empirical evaluation across multiple tasks and data sets.}, address = {Chia Laguna Resort, Sardinia, Italy}, author = {Marlin, Benjamin and Swersky, Kevin and Chen, Bo and Freitas, Nando}, booktitle = {Proceedings of the Thirteenth International Conference on Artificial Intelligence and Statistics}, date-added = {2023-01-20 13:25:55 +0100}, date-modified = {2023-01-20 13:25:55 +0100}, editor = {Teh, Yee Whye and Titterington, Mike}, month = {13--15 May}, pages = {509--516}, pdf = {http://proceedings.mlr.press/v9/marlin10a/marlin10a.pdf}, publisher = {PMLR}, series = {Proceedings of Machine Learning Research}, title = {Inductive Principles for Restricted Boltzmann Machine Learning}, url = {https://proceedings.mlr.press/v9/marlin10a.html}, volume = {9}, year = {2010}, bdsk-url-1 = {https://proceedings.mlr.press/v9/marlin10a.html}} @article{LINGENHEIL200980, abstract = {In replica exchange simulations a fast diffusion of the replicas through the temperature space maximizes the efficiency of the statistical sampling. Here, we compare the diffusion speed as measured by the round trip rates for four exchange algorithms. We find different efficiency profiles with optimal average acceptance probabilities ranging from 8% to 41%. The best performance is determined by benchmark simulations for the most widely used algorithm, which alternately tries to exchange all even and all odd replica pairs. By analytical mathematics we show that the excellent performance of this exchange scheme is due to the high diffusivity of the underlying random walk.}, author = {Martin Lingenheil and Robert Denschlag and Gerald Mathias and Paul Tavan}, date-added = {2023-01-19 13:02:54 +0100}, date-modified = {2023-01-19 13:02:54 +0100}, doi = {https://doi.org/10.1016/j.cplett.2009.07.039}, issn = {0009-2614}, journal = {Chemical Physics Letters}, number = {1}, pages = {80-84}, title = {Efficiency of exchange schemes in replica exchange}, url = {https://www.sciencedirect.com/science/article/pii/S0009261409008604}, volume = {478}, year = {2009}, bdsk-url-1 = {https://www.sciencedirect.com/science/article/pii/S0009261409008604}, bdsk-url-2 = {https://doi.org/10.1016/j.cplett.2009.07.039}} @inproceedings{5596837, author = {Cho, KyungHyun and Raiko, Tapani and Ilin, Alexander}, booktitle = {The 2010 International Joint Conference on Neural Networks (IJCNN)}, date-added = {2023-01-19 12:52:02 +0100}, date-modified = {2023-01-19 12:52:02 +0100}, doi = {10.1109/IJCNN.2010.5596837}, pages = {1-8}, title = {Parallel tempering is efficient for learning restricted Boltzmann machines}, year = {2010}, bdsk-url-1 = {https://doi.org/10.1109/IJCNN.2010.5596837}} @inproceedings{NIPS2009_b7ee6f5f, author = {Salakhutdinov, Russ R}, booktitle = {Advances in Neural Information Processing Systems}, date-added = {2023-01-19 12:51:07 +0100}, date-modified = {2023-01-19 12:51:07 +0100}, editor = {Y. Bengio and D. Schuurmans and J. Lafferty and C. Williams and A. Culotta}, publisher = {Curran Associates, Inc.}, title = {Learning in Markov Random Fields using Tempered Transitions}, url = {https://proceedings.neurips.cc/paper/2009/file/b7ee6f5f9aa5cd17ca1aea43ce848496-Paper.pdf}, volume = {22}, year = {2009}, bdsk-url-1 = {https://proceedings.neurips.cc/paper/2009/file/b7ee6f5f9aa5cd17ca1aea43ce848496-Paper.pdf}} @article{PhysRevLett.57.2607, author = {Swendsen, Robert H. and Wang, Jian-Sheng}, date-added = {2023-01-19 10:57:14 +0100}, date-modified = {2023-01-19 10:57:14 +0100}, doi = {10.1103/PhysRevLett.57.2607}, issue = {21}, journal = {Phys. Rev. Lett.}, month = {Nov}, numpages = {0}, pages = {2607--2609}, publisher = {American Physical Society}, title = {Replica Monte Carlo Simulation of Spin-Glasses}, url = {https://link.aps.org/doi/10.1103/PhysRevLett.57.2607}, volume = {57}, year = {1986}, bdsk-url-1 = {https://link.aps.org/doi/10.1103/PhysRevLett.57.2607}, bdsk-url-2 = {https://doi.org/10.1103/PhysRevLett.57.2607}} @inproceedings{desjardins2010parallel, author = {Desjardins, Guillaume and Courville, Aaron and Bengio, Yoshua and Vincent, Pascal and Delalleau, Olivier and others}, booktitle = {Proceedings of the thirteenth international conference on artificial intelligence and statistics}, date-added = {2023-01-18 16:06:57 +0100}, date-modified = {2023-01-18 16:06:57 +0100}, organization = {MIT Press Cambridge, MA}, pages = {145--152}, title = {Parallel tempering for training of restricted Boltzmann machines}, year = {2010}} @inproceedings{10.1145/1390156.1390290, abstract = {A new algorithm for training Restricted Boltzmann Machines is introduced. The algorithm, named Persistent Contrastive Divergence, is different from the standard Contrastive Divergence algorithms in that it aims to draw samples from almost exactly the model distribution. It is compared to some standard Contrastive Divergence and Pseudo-Likelihood algorithms on the tasks of modeling and classifying various types of data. The Persistent Contrastive Divergence algorithm outperforms the other algorithms, and is equally fast and simple.}, address = {New York, NY, USA}, author = {Tieleman, Tijmen}, booktitle = {Proceedings of the 25th International Conference on Machine Learning}, date-added = {2023-01-18 15:34:40 +0100}, date-modified = {2023-01-18 15:34:40 +0100}, doi = {10.1145/1390156.1390290}, isbn = {9781605582054}, location = {Helsinki, Finland}, numpages = {8}, pages = {1064--1071}, publisher = {Association for Computing Machinery}, series = {ICML '08}, title = {Training Restricted Boltzmann Machines Using Approximations to the Likelihood Gradient}, url = {https://doi.org/10.1145/1390156.1390290}, year = {2008}, bdsk-url-1 = {https://doi.org/10.1145/1390156.1390290}} @inproceedings{6889573, author = {Nagatani, Koki and Hagiwara, Masafumi}, booktitle = {2014 International Joint Conference on Neural Networks (IJCNN)}, date-added = {2022-12-20 15:59:54 +0000}, date-modified = {2022-12-20 15:59:54 +0000}, doi = {10.1109/IJCNN.2014.6889573}, pages = {3745-3750}, title = {Restricted Boltzmann machine associative memory}, year = {2014}, bdsk-url-1 = {http://dx.doi.org/10.1109/IJCNN.2014.6889573}} @inproceedings{NIPS2015_13f3cf8c, author = {Gabrie, Marylou and Tramel, Eric W and Krzakala, Florent}, booktitle = {Advances in Neural Information Processing Systems}, date-added = {2022-12-20 15:32:37 +0000}, date-modified = {2022-12-20 16:05:34 +0000}, editor = {C. Cortes and N. Lawrence and D. Lee and M. Sugiyama and R. Garnett}, publisher = {Curran Associates, Inc.}, title = {Training Restricted Boltzmann Machine via the Thouless-Anderson-Palmer free energy}, url = {https://proceedings.neurips.cc/paper/2015/file/13f3cf8c531952d72e5847c4183e6910-Paper.pdf}, volume = {28}, year = {2015}, bdsk-url-1 = {https://proceedings.neurips.cc/paper/2015/file/13f3cf8c531952d72e5847c4183e6910-Paper.pdf}} @article{87054, author = {Kosko, B.}, date-added = {2022-12-20 15:06:10 +0000}, date-modified = {2022-12-20 15:06:10 +0000}, doi = {10.1109/21.87054}, journal = {IEEE Transactions on Systems, Man, and Cybernetics}, number = {1}, pages = {49-60}, title = {Bidirectional associative memories}, volume = {18}, year = {1988}, bdsk-url-1 = {http://dx.doi.org/10.1109/21.87054}} @misc{https://doi.org/10.48550/arxiv.2211.09694, author = {Barra, A. and Catania, G. and Decelle, A. and Seoane, B.}, copyright = {Creative Commons Attribution Non Commercial No Derivatives 4.0 International}, date-added = {2022-12-20 13:45:07 +0000}, date-modified = {2023-01-18 12:58:11 +0100}, doi = {10.48550/ARXIV.2211.09694}, publisher = {arXiv}, title = {Thermodynamics of bidirectional associative memories}, url = {https://arxiv.org/abs/2211.09694}, year = {2022}, bdsk-url-1 = {https://arxiv.org/abs/2211.09694}, bdsk-url-2 = {http://dx.doi.org/10.48550/ARXIV.2211.09694}} @inbook{murphy2013machine11, added-at = {2017-02-27T11:22:42.000+0100}, address = {Cambridge, Mass. [u.a.]}, author = {Murphy, Kevin P.}, biburl = {https://www.bibsonomy.org/bibtex/270148d65a6a66e0ae962bf22c5f66148/hotho}, chapter = {11, Mixture models and the EM algorithm}, date-added = {2022-12-19 13:17:46 +0000}, date-modified = {2023-03-17 12:04:09 -0700}, description = {Machine Learning: A Probabilistic Perspective (Adaptive Computation and Machine Learning series): Kevin P. Murphy: 9780262018029: Amazon.com: Books}, interhash = {e99d8a06cc36507b05c38192ab80573e}, intrahash = {70148d65a6a66e0ae962bf22c5f66148}, isbn = {9780262018029 0262018020}, publisher = {MIT Press}, refid = {904442949}, timestamp = {2017-02-27T11:22:42.000+0100}, title = {Machine learning : a probabilistic perspective}, url = {https://www.amazon.com/Machine-Learning-Probabilistic-Perspective-Computation/dp/0262018020/ref=sr_1_2?ie=UTF8&qid=1336857747&sr=8-2}, year = 2013, bdsk-url-1 = {https://www.amazon.com/Machine-Learning-Probabilistic-Perspective-Computation/dp/0262018020/ref=sr_1_2?ie=UTF8&qid=1336857747&sr=8-2}} @article{HINTON1989185, abstract = {A major goal of research on networks of neuron-like processing units is to discover efficient learning procedures that allow these networks to construct complex internal representations of their environment. The learning procedures must be capable of modifying the connection strengths in such a way that internal units which are not part of the input or output come to represent important features of the task domain. Several interesting gradient-descent procedures have recently been discovered. Each connection computes the derivative, with respect to the connection strength, of a global measure of the error in the performance of the network. The strength is then adjusted in the direction that decreases the error. These relatively simple, gradient-descent learning procedures work well for small tasks and the new challenge is to find ways of improving their convergence rate and their generalization abilities so that they can be applied to larger, more realistic tasks.}, author = {Geoffrey E. Hinton}, date-added = {2022-12-19 09:40:50 +0000}, date-modified = {2022-12-19 09:40:50 +0000}, doi = {https://doi.org/10.1016/0004-3702(89)90049-0}, issn = {0004-3702}, journal = {Artificial Intelligence}, number = {1}, pages = {185-234}, title = {Connectionist learning procedures}, url = {https://www.sciencedirect.com/science/article/pii/0004370289900490}, volume = {40}, year = {1989}, bdsk-url-1 = {https://www.sciencedirect.com/science/article/pii/0004370289900490}, bdsk-url-2 = {https://doi.org/10.1016/0004-3702(89)90049-0}} @article{HORNIK1991251, abstract = {We show that standard multilayer feedforward networks with as few as a single hidden layer and arbitrary bounded and nonconstant activation function are universal approximators with respect to Lp(μ) performance criteria, for arbitrary finite input environment measures μ, provided only that sufficiently many hidden units are available. If the activation function is continuous, bounded and nonconstant, then continuous mappings can be learned uniformly over compact input sets. We also give very general conditions ensuring that networks with sufficiently smooth activation functions are capable of arbitrarily accurate approximation to a function and its derivatives.}, author = {Kurt Hornik}, date-added = {2022-12-11 18:35:04 +0000}, date-modified = {2023-01-18 12:58:33 +0100}, doi = {https://doi.org/10.1016/0893-6080(91)90009-T}, issn = {0893-6080}, journal = {Neural Networks}, number = {2}, pages = {251-257}, title = {Approximation capabilities of multilayer feedforward networks}, url = {https://www.sciencedirect.com/science/article/pii/089360809190009T}, volume = {4}, year = {1991}, bdsk-url-1 = {https://www.sciencedirect.com/science/article/pii/089360809190009T}, bdsk-url-2 = {https://doi.org/10.1016/0893-6080(91)90009-T}} @article{le2008representational, title={Representational power of restricted Boltzmann machines and deep belief networks}, author={Le Roux, N. and Bengio, Y.}, journal={Neural computation}, volume={20}, number={6}, pages={1631--1649}, year={2008}, publisher={MIT Press} doi:[10.1103/PhysRevA.41.3355](https://doi.org/10.1103/PhysRevA.41.3355) arXiv:[2010.55968](https://arxiv.org/abs/2010.55968)
8. Cybenko:1989aa: abstract = {In this paper we demonstrate that finite linear combinations of compositions of a fixed, univariate function and a set of affine functionals can uniformly approximate any continuous function ofn real variables with support in the unit hypercube; only mild conditions are imposed on the univariate function. Our results settle an open question about representability in the class of single hidden layer neural networks. In particular, we show that arbitrary decision regions can be arbitrarily well approximated by continuous feedforward neural networks with only a single internal, hidden layer and any continuous sigmoidal nonlinearity. The paper discusses approximation properties of other possible types of nonlinearities that might be implemented by artificial neural networks.}, author = {Cybenko, G.}, da = {1989/12/01}, date-added = {2022-12-11 18:26:59 +0000}, date-modified = {2022-12-11 18:26:59 +0000}, doi = {10.1007/BF02551274}, id = {Cybenko1989}, isbn = {1435-568X}, journal = {Mathematics of Control, Signals and Systems}, number = {4}, pages = {303--314}, title = {Approximation by superpositions of a sigmoidal function}, ty = {JOUR}, url = {https://doi.org/10.1007/BF02551274}, volume = {2}, year = {1989}, bdsk-url-1 = {https://doi.org/10.1007/BF02551274}, bdsk-url-2 = {http://dx.doi.org/10.1007/BF02551274}} @inproceedings{NIPS2017_3f5ee243, author = {Vaswani, Ashish and Shazeer, Noam and Parmar, Niki and Uszkoreit, Jakob and Jones, Llion and Gomez, Aidan N and Kaiser, \L ukasz and Polosukhin, Illia}, booktitle = {Advances in Neural Information Processing Systems}, date-added = {2022-12-11 17:32:30 +0000}, date-modified = {2022-12-11 17:32:30 +0000}, editor = {I. Guyon and U. Von Luxburg and S. Bengio and H. Wallach and R. Fergus and S. Vishwanathan and R. Garnett}, publisher = {Curran Associates, Inc.}, title = {Attention is All you Need}, url = {https://proceedings.neurips.cc/paper/2017/file/3f5ee243547dee91fbd053c1c4a845aa-Paper.pdf}, volume = {30}, year = {2017}, bdsk-url-1 = {https://proceedings.neurips.cc/paper/2017/file/3f5ee243547dee91fbd053c1c4a845aa-Paper.pdf}} @article{Huembeli:2022aa, abstract = {Energy-based models (EBMs) are experiencing a resurgence of interest in both the physics community and the machine learning community. This article provides an intuitive introduction to EBMs, without requiring any background in machine learning, connecting elementary concepts from physics with basic concepts and tools in generative models, and finally giving a perspective where current research in the field is heading. This article, in its original form, was written as an online lecture note in HTML and Javascript and contains interactive graphics. We recommend the reader to also visit the interactive version.}, author = {Huembeli, Patrick and Arrazola, Juan Miguel and Killoran, Nathan and Mohseni, Masoud and Wittek, Peter}, da = {2022/01/06}, date-added = {2022-11-29 17:58:44 +0000}, date-modified = {2022-11-29 17:58:44 +0000}, doi = {10.1007/s42484-021-00057-7}, id = {Huembeli2022}, isbn = {2524-4914}, journal = {Quantum Machine Intelligence}, number = {1}, pages = {1}, title = {The physics of energy-based models}, ty = {JOUR}, url = {https://doi.org/10.1007/s42484-021-00057-7}, volume = {4}, year = {2022}, bdsk-url-1 = {https://doi.org/10.1007/s42484-021-00057-7}, bdsk-url-2 = {http://dx.doi.org/10.1007/s42484-021-00057-7}} @inproceedings{10.1007/3-540-52255-7_36, abstract = {By separating the search control and the solution updating of the commonly used simulated annealing technique, we propose a revised version of the simulated annealing method which produces better solutions and can reduce the computation time. We also use it to improve the performance of the Boltzmann machine. Furthermore, we present a simple combinatorial optimization model for solving the attributed graph matching problem of e.g. computer vision and give two algorithms to solve the model, one using our improved simulated annealing method directly, the other using it via the Boltzmann machine. Computer simulations have been conducted on the model using both the revised and the original simulated annealing and the Boltzmann machine. The advantages of our revised methods are shown by the results.}, address = {Berlin, Heidelberg}, author = {Xu, Lei and Oja, Erkki}, booktitle = {Neural Networks}, date-added = {2022-11-10 19:52:43 +0000}, date-modified = {2022-11-10 19:52:43 +0000}, editor = {Almeida, Luis B. and Wellekens, Christian J.}, isbn = {978-3-540-46939-1}, pages = {151--160}, publisher = {Springer Berlin Heidelberg}, title = {Improved simulated annealing, Boltzmann machine, and attributed graph matching}, year = {1990}} @article{_1993, abstract = {The stochastic Boltzmann machine (SBM) learning procedure allows a system of stochastic binary units at thermal equilibrium to model arbitrary probabilistic distributions of binary vectors, but the inefficiency inherent in stochastic simulations limits its usefulness. By employing mean field theory, the stochastic settling to thermal equilibrium can be replaced by efficient deterministic settling to a steady state. The analogous deterministic Boltzmann machine (DBM) learning rule performs steepest descent in an appropriately defined error measure under certain circumstances and has been empirically shown to solve a variety of non-trivial supervised, input-output problems. However, by applying 'naive' mean field theory to a finite system with non-random interactions, the true stochastic system is not well described, and representational problems result that significantly limit the situations in which the DBM procedure can be successfully applied. It is shown that the independence assumption is unacceptably inaccurate in multiple hidden layer configurations, thus accounting for the empirically observed failure of DBM learning in such networks. Further restrictions in network architecture are suggested that maximize the utility of the supervised DBM procedure, but its inherent limitations are shown to be quite severe. An analogous system based on the TAP equations is also discussed.}, author = {C C Galland}, date-added = {2022-11-10 18:28:40 +0000}, date-modified = {2022-11-10 18:28:40 +0000}, doi = {10.1088/0954-898X/4/3/007}, journal = {Network: Computation in Neural Systems}, month = {aug}, number = {3}, pages = {355}, title = {The limitations of deterministic Boltzmann machine learning}, url = {https://dx.doi.org/10.1088/0954-898X/4/3/007}, volume = {4}, year = {1993}, bdsk-url-1 = {https://dx.doi.org/10.1088/0954-898X/4/3/007}, bdsk-url-2 = {http://dx.doi.org/10.1088/0954-898X/4/3/007}} @article{Peterson, author = {Carsten Peterson and James R . Anderson}, date-added = {2022-11-10 18:25:10 +0000}, date-modified = {2022-11-10 18:27:28 +0000}, journal = {Complex Systems}, pages = {995-1019}, title = {A Mean Field Theory Learning Algorithm for Neural Networks}, volume = {1}, year = {1987}} @inproceedings{inproceedings, author = {Hinton, Geoffrey and Sejnowski, Terrence}, date-added = {2022-11-10 11:23:40 +0000}, date-modified = {2022-11-10 11:23:40 +0000}, journal = {Proceedings of the IEEE Conference on Computer Vision and Pattern Recognition}, month = {01}, pages = {448-453}, title = {Optimal perceptual inference}, year = {1983}} @article{6773024, author = {Shannon, C. E.}, date-added = {2022-11-10 10:07:08 +0000}, date-modified = {2022-11-10 10:07:08 +0000}, doi = {10.1002/j.1538-7305.1948.tb01338.x}, journal = {The Bell System Technical Journal}, number = {3}, pages = {379-423}, title = {A mathematical theory of communication}, volume = {27}, year = {1948}, bdsk-url-1 = {http://dx.doi.org/10.1002/j.1538-7305.1948.tb01338.x}} @article{10.1371/journal.pbio.2003663, abstract = {Sleep science is entering a new era, thanks to new data-driven analysis approaches that, combined with mouse gene--editing technologies, show a promise in functional genomics and translational research. However, the investigation of sleep is time consuming and not suitable for large-scale phenotypic datasets, mainly due to the need for subjective manual annotations of electrophysiological states. Moreover, the heterogeneous nature of sleep, with all its physiological aspects, is not fully accounted for by the current system of sleep stage classification. In this study, we present a new data-driven analysis approach offering a plethora of novel features for the characterization of sleep. This novel approach allowed for identifying several substages of sleep that were hidden to standard analysis. For each of these substages, we report an independent set of homeostatic responses following sleep deprivation. By using our new substages classification, we have identified novel differences among various genetic backgrounds. Moreover, in a specific experiment with the Zfhx3 mouse line, a recent circadian mutant expressing both shortening of the circadian period and abnormal sleep architecture, we identified specific sleep states that account for genotypic differences at specific times of the day. These results add a further level of interaction between circadian clock and sleep homeostasis and indicate that dissecting sleep in multiple states is physiologically relevant and can lead to the discovery of new links between sleep phenotypes and genetic determinants. Therefore, our approach has the potential to significantly enhance the understanding of sleep physiology through the study of single mutations. Moreover, this study paves the way to systematic high-throughput analyses of sleep.}, author = {Katsageorgiou, Vasiliki-Maria AND Sona, Diego AND Zanotto, Matteo AND Lassi, Glenda AND Garcia-Garcia, Celina AND Tucci, Valter AND Murino, Vittorio}, date-added = {2022-10-25 14:34:55 +0000}, date-modified = {2022-10-25 14:34:55 +0000}, doi = {10.1371/journal.pbio.2003663}, journal = {PLOS Biology}, month = {05}, number = {5}, pages = {1-23}, publisher = {Public Library of Science}, title = {A novel unsupervised analysis of electrophysiological signals reveals new sleep substages in mice}, url = {https://doi.org/10.1371/journal.pbio.2003663}, volume = {16}, year = {2018}, bdsk-url-1 = {https://doi.org/10.1371/journal.pbio.2003663}, bdsk-url-2 = {http://dx.doi.org/10.1371/journal.pbio.2003663}} @article{Plas:2022aa, author = {van der Plas, Thijs L. and Tubiana, J{\'e}r{\^o}me and Le Goc, Guillaume and Migault, Geoffrey and Kunst, Michael and Baier, Herwig and Bormuth, Volker and Englitz, Bernhard and Debr{\'e}geas, Georges}, date = {2022/01/01}, date-added = {2022-10-25 14:22:11 +0000}, date-modified = {2022-10-25 14:22:11 +0000}, doi = {10.1101/2021.11.09.467900}, journal = {bioRxiv}, month = {01}, n2 = {Patterns of endogenous activity in the brain reflect a stochastic exploration of the neuronal state space that is constrained by the underlying assembly organization of neurons. Yet it remains to be shown that this interplay between neurons and their assembly dynamics indeed suffices to generate whole-brain data statistics. Here we recorded the activity from \ {} 40,000 neurons simultaneously in zebrafish larvae, and show that a data-driven generative model of neuron-assembly interactions can accurately reproduce the mean activity and pairwise correlation statistics of their spontaneous activity. This model, the compositional Restricted Boltzmann Machine (cRBM), unveils \ {} 200 neural assemblies, which compose neurophysiological circuits and whose various com-binations form successive brain states. We then performed in silico perturbation experiments to determine the interregional functional connectivity, which is conserved across individual animals and correlates well with structural connectivity. Our results showcase how cRBMs can capture the coarse-grained organization of the zebrafish brain. Notably, this generative model can readily be deployed to parse neural data obtained by other large-scale recording techniques.Competing Interest StatementThe authors have declared no competing interest.}, pages = {2021.11.09.467900}, title = {Neural assemblies uncovered by generative modeling explain whole-brain activity statistics and reflect structural connectivity}, ty = {JOUR}, url = {http://biorxiv.org/content/early/2022/06/10/2021.11.09.467900.abstract}, year = {2022}, bdsk-url-1 = {http://biorxiv.org/content/early/2022/06/10/2021.11.09.467900.abstract}, bdsk-url-2 = {http://dx.doi.org/10.1101/2021.11.09.467900}} @article{e22070714, abstract = {In this work we explore encoding strategies learned by statistical models of sensory coding in noisy spiking networks. Early stages of sensory communication in neural systems can be viewed as encoding channels in the information-theoretic sense. However, neural populations face constraints not commonly considered in communications theory. Using restricted Boltzmann machines as a model of sensory encoding, we find that networks with sufficient capacity learn to balance precision and noise-robustness in order to adaptively communicate stimuli with varying information content. Mirroring variability suppression observed in sensory systems, informative stimuli are encoded with high precision, at the cost of more variable responses to frequent, hence less informative stimuli. Curiously, we also find that statistical criticality in the neural population code emerges at model sizes where the input statistics are well captured. These phenomena have well-defined thermodynamic interpretations, and we discuss their connection to prevailing theories of coding and statistical criticality in neural populations.}, article-number = {714}, author = {Rule, Michael E. and Sorbaro, Martino and Hennig, Matthias H.}, date-added = {2022-10-24 19:19:52 +0000}, date-modified = {2022-10-24 19:19:52 +0000}, doi = {10.3390/e22070714}, issn = {1099-4300}, journal = {Entropy}, number = {7}, title = {Optimal Encoding in Stochastic Latent-Variable Models}, url = {https://www.mdpi.com/1099-4300/22/7/714}, volume = {22}, year = {2020}, bdsk-url-1 = {https://www.mdpi.com/1099-4300/22/7/714}, bdsk-url-2 = {http://dx.doi.org/10.3390/e22070714}} @article{Volpi:2020aa, abstract = {The retina is a complex circuit of the central nervous system whose aim is to encode visual stimuli prior the higher order processing performed in the visual cortex. Due to the importance of its role, modeling the retina to advance in interpreting its spiking activity output is a well studied problem. In particular, it has been shown that latent variable models can be used to model the joint distribution of Retinal Ganglion Cells (RGCs). In this work, we validate the applicability of Restricted Boltzmann Machines to model the spiking activity responses of a large a population of RGCs recorded with high-resolution electrode arrays. In particular, we show that latent variables can encode modes in the RGC activity distribution that are closely related to the visual stimuli. In contrast to previous work, we further validate our findings by comparing results associated with recordings from retinas under normal and altered encoding conditions obtained by pharmacological manipulation. In these conditions, we observe that the model reflects well-known physiological behaviors of the retina. Finally, we show that we can also discover temporal patterns, associated with distinct dynamics of the stimuli.}, author = {Volpi, R. and Zanotto, Matteo and Maccione, Alessandro and Di Marco, Stefano and Berdondini, Luca and Sona, Diego and Murino, Vittorio}, da = {2020/10/06}, date-added = {2022-10-24 19:03:18 +0000}, date-modified = {2022-10-24 19:03:18 +0000}, doi = {10.1038/s41598-020-73691-z}, id = {Volpi2020}, isbn = {2045-2322}, journal = {Scientific Reports}, number = {1}, pages = {16549}, title = {Modeling a population of retinal ganglion cells with restricted Boltzmann machines}, ty = {JOUR}, url = {https://doi.org/10.1038/s41598-020-73691-z}, volume = {10}, year = {2020}, bdsk-url-1 = {https://doi.org/10.1038/s41598-020-73691-z}, bdsk-url-2 = {http://dx.doi.org/10.1038/s41598-020-73691-z}} @article{doi:10.1073/pnas.1718710115, abstract = {The brain has no direct access to physical stimuli but only to the spiking activity evoked in sensory organs. It is unclear how the brain can learn representations of the stimuli based on those noisy, correlated responses alone. Here we show how to build an accurate distance map of responses solely from the structure of the population activity of retinal ganglion cells. We introduce the Temporal Restricted Boltzmann Machine to learn the spatiotemporal structure of the population activity and use this model to define a distance between spike trains. We show that this metric outperforms existing neural distances at discriminating pairs of stimuli that are barely distinguishable. The proposed method provides a generic and biologically plausible way to learn to associate similar stimuli based on their spiking responses, without any other knowledge of these stimuli.}, author = {Christophe Gardella and Olivier Marre and Thierry Mora}, date-added = {2022-10-24 19:03:13 +0000}, date-modified = {2022-10-24 19:03:13 +0000}, doi = {10.1073/pnas.1718710115}, eprint = {https://www.pnas.org/doi/pdf/10.1073/pnas.1718710115}, journal = {Proceedings of the National Academy of Sciences}, number = {13}, pages = {3267-3272}, title = {Blindfold learning of an accurate neural metric}, url = {https://www.pnas.org/doi/abs/10.1073/pnas.1718710115}, volume = {115}, year = {2018}, bdsk-url-1 = {https://www.pnas.org/doi/abs/10.1073/pnas.1718710115}, bdsk-url-2 = {http://dx.doi.org/10.1073/pnas.1718710115}} @misc{https://doi.org/10.48550/arxiv.1605.07371, author = {Humplik, Jan and Tka{\v c}ik, Ga{\v s}per}, copyright = {arXiv.org perpetual, non-exclusive license}, date-added = {2022-10-24 18:08:41 +0000}, date-modified = {2023-01-18 12:58:21 +0100}, doi = {10.48550/ARXIV.1605.07371}, publisher = {arXiv}, title = {Semiparametric energy-based probabilistic models}, url = {https://arxiv.org/abs/1605.07371}, year = {2016}, bdsk-url-1 = {https://arxiv.org/abs/1605.07371}, bdsk-url-2 = {http://dx.doi.org/10.48550/ARXIV.1605.07371}} @article{Huang:2011aa, abstract = {Predictive coding is a unifying framework for understanding redundancy reduction and efficient coding in the nervous system. By transmitting only the unpredicted portions of an incoming sensory signal, predictive coding allows the nervous system to reduce redundancy and make full use of the limited dynamic range of neurons. Starting with the hypothesis of efficient coding as a design principle in the sensory system, predictive coding provides a functional explanation for a range of neural responses and many aspects of brain organization. The lateral and temporal antagonism in receptive fields in the retina and lateral geniculate nucleus occur naturally as a consequence of predictive coding of natural images. In the higher visual system, predictive coding provides an explanation for oriented receptive fields and contextual effects as well as the hierarchical reciprocally connected organization of the cortex. Predictive coding has also been found to be consistent with a variety of neurophysiological and psychophysical data obtained from different areas of the brain. WIREs Cogni Sci 2011 2 580-593 DOI: 10.1002/wcs.142 For further resources related to this article, please visit the WIREs website.}, address = {Department of Computer Science and Engineering, University of Washington, Seattle, WA, USA.}, address1 = {Department of Computer Science and Engineering, University of Washington, Seattle, WA, USA.}, author = {Huang, Yanping and Rao, Rajesh P N}, copyright = {Copyright {\copyright}2011 John Wiley \& Sons, Ltd.}, crdt = {2015/08/25 06:00}, date = {2011 Sep}, date-added = {2022-10-22 12:28:01 +0000}, date-modified = {2022-10-22 12:28:01 +0000}, dcom = {20150826}, dep = {20110324}, doi = {10.1002/wcs.142}, edat = {2011/09/01 00:00}, issn = {1939-5078 (Print); 1939-5078 (Linking)}, jid = {101524169}, journal = {Wiley Interdiscip Rev Cogn Sci}, jt = {Wiley interdisciplinary reviews. Cognitive science}, language = {eng}, lid = {10.1002/wcs.142 {$[$}doi{$]$}}, lr = {20180228}, mhda = {2011/09/01 00:01}, month = {Sep}, number = {5}, own = {NLM}, pages = {580--593}, phst = {2015/08/25 06:00 {$[$}entrez{$]$}; 2011/09/01 00:00 {$[$}pubmed{$]$}; 2011/09/01 00:01 {$[$}medline{$]$}}, pl = {United States}, pmid = {26302308}, pst = {ppublish}, pt = {Journal Article}, status = {PubMed-not-MEDLINE}, title = {Predictive coding.}, volume = {2}, year = {2011}, bdsk-url-1 = {http://dx.doi.org/10.1002/wcs.142}} @article{10.1162/neco.1995.7.5.889, abstract = {{Discovering the structure inherent in a set of patterns is a fundamental aim of statistical inference or learning. One fruitful approach is to build a parameterized stochastic generative model, independent draws from which are likely to produce the patterns. For all but the simplest generative models, each pattern can be generated in exponentially many ways. It is thus intractable to adjust the parameters to maximize the probability of the observed patterns. We describe a way of finessing this combinatorial explosion by maximizing an easily computed lower bound on the probability of the observations. Our method can be viewed as a form of hierarchical self-supervised learning that may relate to the function of bottom-up and top-down cortical processing pathways.}}, author = {Dayan, Peter and Hinton, Geoffrey E. and Neal, Radford M. and Zemel, Richard S.}, date-added = {2022-10-22 12:18:15 +0000}, date-modified = {2022-10-22 12:18:15 +0000}, doi = {10.1162/neco.1995.7.5.889}, eprint = {https://direct.mit.edu/neco/article-pdf/7/5/889/813131/neco.1995.7.5.889.pdf}, issn = {0899-7667}, journal = {Neural Computation}, month = {09}, number = {5}, pages = {889-904}, title = {{The Helmholtz Machine}}, url = {https://doi.org/10.1162/neco.1995.7.5.889}, volume = {7}, year = {1995}, bdsk-url-1 = {https://doi.org/10.1162/neco.1995.7.5.889}, bdsk-url-2 = {http://dx.doi.org/10.1162/neco.1995.7.5.889}} @article{10.1371/journal.pcbi.1003684, abstract = {We statistically characterize the population spiking activity obtained from simultaneous recordings of neurons across all layers of a cortical microcolumn. Three types of models are compared: an Ising model which captures pairwise correlations between units, a Restricted Boltzmann Machine (RBM) which allows for modeling of higher-order correlations, and a semi-Restricted Boltzmann Machine which is a combination of Ising and RBM models. Model parameters were estimated in a fast and efficient manner using minimum probability flow, and log likelihoods were compared using annealed importance sampling. The higher-order models reveal localized activity patterns which reflect the laminar organization of neurons within a cortical column. The higher-order models also outperformed the Ising model in log-likelihood: On populations of 20 cells, the RBM had 10% higher log-likelihood (relative to an independent model) than a pairwise model, increasing to 45% gain in a larger network with 100 spatiotemporal elements, consisting of 10 neurons over 10 time steps. We further removed the need to model stimulus-induced correlations by incorporating a peri-stimulus time histogram term, in which case the higher order models continued to perform best. These results demonstrate the importance of higher-order interactions to describe the structure of correlated activity in cortical networks. Boltzmann Machines with hidden units provide a succinct and effective way to capture these dependencies without increasing the difficulty of model estimation and evaluation.}, author = {K{\"o}ster, Urs AND Sohl-Dickstein, Jascha AND Gray, Charles M. AND Olshausen, Bruno A.}, date-added = {2022-10-22 11:40:31 +0000}, date-modified = {2022-10-22 11:40:31 +0000}, doi = {10.1371/journal.pcbi.1003684}, journal = {PLOS Computational Biology}, month = {07}, number = {7}, pages = {1-12}, publisher = {Public Library of Science}, title = {Modeling Higher-Order Correlations within Cortical Microcolumns}, url = {https://doi.org/10.1371/journal.pcbi.1003684}, volume = {10}, year = {2014}, bdsk-url-1 = {https://doi.org/10.1371/journal.pcbi.1003684}, bdsk-url-2 = {http://dx.doi.org/10.1371/journal.pcbi.1003684}} @article{doi:10.1073/pnas.79.8.2554, abstract = {Computational properties of use of biological organisms or to the construction of computers can emerge as collective properties of systems having a large number of simple equivalent components (or neurons). The physical meaning of content-addressable memory is described by an appropriate phase space flow of the state of a system. A model of such a system is given, based on aspects of neurobiology but readily adapted to integrated circuits. The collective properties of this model produce a content-addressable memory which correctly yields an entire memory from any subpart of sufficient size. The algorithm for the time evolution of the state of the system is based on asynchronous parallel processing. Additional emergent collective properties include some capacity for generalization, familiarity recognition, categorization, error correction, and time sequence retention. The collective properties are only weakly sensitive to details of the modeling or the failure of individual devices.}, author = {J J Hopfield}, date-added = {2022-10-22 11:18:35 +0000}, date-modified = {2022-10-22 11:18:35 +0000}, doi = {10.1073/pnas.79.8.2554}, eprint = {https://www.pnas.org/doi/pdf/10.1073/pnas.79.8.2554}, journal = {Proceedings of the National Academy of Sciences}, number = {8}, pages = {2554-2558}, title = {Neural networks and physical systems with emergent collective computational abilities.}, url = {https://www.pnas.org/doi/abs/10.1073/pnas.79.8.2554}, volume = {79}, year = {1982}, bdsk-url-1 = {https://www.pnas.org/doi/abs/10.1073/pnas.79.8.2554}, bdsk-url-2 = {http://dx.doi.org/10.1073/pnas.79.8.2554}} @article{Agliari_2013, abstract = {Pattern-diluted associative networks were recently introduced as models for the immune system, with nodes representing T-lymphocytes and stored patterns representing signalling protocols between T- and B-lymphocytes. It was shown earlier that in the regime of extreme pattern dilution, a system with NT T-lymphocytes can manage a number of B-lymphocytes simultaneously, with δ &lt; 1. Here we study this model in the extensive load regime NB = αNT, with a high degree of pattern dilution, in agreement with immunological findings. We use graph theory and statistical mechanical analysis based on replica methods to show that in the finite-connectivity regime, where each T-lymphocyte interacts with a finite number of B-lymphocytes as NT → ∞, the T-lymphocytes can coordinate effective immune responses to an extensive number of distinct antigen invasions in parallel. As α increases, the system eventually undergoes a second order transition to a phase with clonal cross-talk interference, where the system's performance degrades gracefully. Mathematically, the model is equivalent to a spin system on a finitely connected graph with many short loops, so one would expect the available analytical methods, which all assume locally tree-like graphs, to fail. Yet it turns out to be solvable. Our results are supported by numerical simulations.}, author = {E Agliari and A Annibale and A Barra and A C C Coolen and D Tantari}, date-added = {2022-10-20 18:01:50 +0000}, date-modified = {2022-10-20 18:01:50 +0000}, doi = {10.1088/1751-8113/46/41/415003}, journal = {Journal of Physics A: Mathematical and Theoretical}, month = {sep}, number = {41}, pages = {415003}, publisher = {IOP Publishing}, title = {Immune networks: multitasking capabilities near saturation}, url = {https://dx.doi.org/10.1088/1751-8113/46/41/415003}, volume = {46}, year = {2013}, bdsk-url-1 = {https://dx.doi.org/10.1088/1751-8113/46/41/415003}, bdsk-url-2 = {http://dx.doi.org/10.1088/1751-8113/46/41/415003}} @article{Barra:2012aa, abstract = {A specific type of neural networks, the Restricted Boltzmann Machines (RBM), are implemented for classification and feature detection in machine learning. They are characterized by separate layers of visible and hidden units, which are able to learn efficiently a generative model of the observed data. We study a "hybrid" version of RBMs, in which hidden units are analog and visible units are binary, and we show that thermodynamics of visible units are equivalent to those of a Hopfield network, in which the N visible units are the neurons and the P hidden units are the learned patterns. We apply the method of stochastic stability to derive the thermodynamics of the model, by considering a formal extension of this technique to the case of multiple sets of stored patterns, which may act as a benchmark for the study of correlated sets. Our results imply that simulating the dynamics of a Hopfield network, requiring the update of N neurons and the storage of N(N-1)/2 synapses, can be accomplished by a hybrid Boltzmann Machine, requiring the update of N+P neurons but the storage of only NP synapses. In addition, the well known glass transition of the Hopfield network has a counterpart in the Boltzmann Machine: it corresponds to an optimum criterion for selecting the relative sizes of the hidden and visible layers, resolving the trade-off between flexibility and generality of the model. The low storage phase of the Hopfield model corresponds to few hidden units and hence a overly constrained RBM, while the spin-glass phase (too many hidden units) corresponds to unconstrained RBM prone to overfitting of the observed data.}, address = {Dipartimento di Fisica, Sapienza Universit{\`a}di Roma, Piazzale Aldo Moro 5, 00185, Roma, Italy. adriano.barra@roma1.infn.it}, author = {Barra, A. and Bernacchia, A. and Santucci, E. and Contucci, P.}, copyright = {Copyright {\copyright}2012 Elsevier Ltd. All rights reserved.}, crdt = {2012/07/13 06:00}, date = {2012 Oct}, date-added = {2022-10-20 17:38:20 +0000}, date-modified = {2022-10-20 17:38:20 +0000}, dcom = {20130611}, dep = {20120623}, doi = {10.1016/j.neunet.2012.06.003}, edat = {2012/07/13 06:00}, issn = {1879-2782 (Electronic); 0893-6080 (Linking)}, jid = {8805018}, journal = {Neural Netw}, jt = {Neural networks : the official journal of the International Neural Network Society}, language = {eng}, lid = {10.1016/j.neunet.2012.06.003 {$[$}doi{$]$}}, lr = {20191210}, mh = {*Models, Neurological; *Neural Networks, Computer; Stochastic Processes}, mhda = {2013/06/12 06:00}, month = {Oct}, own = {NLM}, pages = {1--9}, phst = {2011/05/28 00:00 {$[$}received{$]$}; 2012/01/05 00:00 {$[$}revised{$]$}; 2012/06/12 00:00 {$[$}accepted{$]$}; 2012/07/13 06:00 {$[$}entrez{$]$}; 2012/07/13 06:00 {$[$}pubmed{$]$}; 2013/06/12 06:00 {$[$}medline{$]$}}, pii = {S0893-6080(12)00160-8}, pl = {United States}, pmid = {22784924}, pst = {ppublish}, pt = {Journal Article; Research Support, Non-U.S. Gov't}, sb = {IM}, status = {MEDLINE}, title = {On the equivalence of Hopfield networks and Boltzmann Machines.}, volume = {34}, year = {2012}, bdsk-url-1 = {http://dx.doi.org/10.1016/j.neunet.2012.06.003}} @inproceedings{NIPS2006_1091660f, author = {Taylor, Graham W and Hinton, Geoffrey E and Roweis, Sam}, booktitle = {Advances in Neural Information Processing Systems}, date-added = {2022-10-20 17:32:08 +0000}, date-modified = {2022-10-20 17:32:08 +0000}, editor = {B. Sch\"{o}lkopf and J. Platt and T. Hoffman}, publisher = {MIT Press}, title = {Modeling Human Motion Using Binary Latent Variables}, url = {https://proceedings.neurips.cc/paper/2006/file/1091660f3dff84fd648efe31391c5524-Paper.pdf}, volume = {19}, year = {2006}, bdsk-url-1 = {https://proceedings.neurips.cc/paper/2006/file/1091660f3dff84fd648efe31391c5524-Paper.pdf}} @article{https://doi.org/10.1002/minf.201501008, abstract = {Abstract Artificial neural networks had their first heyday in molecular informatics and drug discovery approximately two decades ago. Currently, we are witnessing renewed interest in adapting advanced neural network architectures for pharmaceutical research by borrowing from the field of ``deep learning''. Compared with some of the other life sciences, their application in drug discovery is still limited. Here, we provide an overview of this emerging field of molecular informatics, present the basic concepts of prominent deep learning methods and offer motivation to explore these techniques for their usefulness in computer-assisted drug discovery and design. We specifically emphasize deep neural networks, restricted Boltzmann machine networks and convolutional networks.}, author = {Gawehn, Erik and Hiss, Jan A. and Schneider, Gisbert}, date-added = {2022-10-20 17:31:45 +0000}, date-modified = {2023-01-18 12:58:25 +0100}, doi = {https://doi.org/10.1002/minf.201501008}, eprint = {https://onlinelibrary.wiley.com/doi/pdf/10.1002/minf.201501008}, journal = {Molecular Informatics}, number = {1}, pages = {3-14}, title = {Deep Learning in Drug Discovery}, url = {https://onlinelibrary.wiley.com/doi/abs/10.1002/minf.201501008}, volume = {35}, year = {2016}, bdsk-url-1 = {https://onlinelibrary.wiley.com/doi/abs/10.1002/minf.201501008}, bdsk-url-2 = {https://doi.org/10.1002/minf.201501008}} @article{7981315, author = {Movahedi, Faezeh and Coyle, James L. and Sejdi{\'c}, Ervin}, date-added = {2022-10-20 17:30:27 +0000}, date-modified = {2022-10-20 17:30:27 +0000}, doi = {10.1109/JBHI.2017.2727218}, journal = {IEEE Journal of Biomedical and Health Informatics}, number = {3}, pages = {642-652}, title = {Deep Belief Networks for Electroencephalography: A Review of Recent Contributions and Future Outlooks}, volume = {22}, year = {2018}, bdsk-url-1 = {http://dx.doi.org/10.1109/JBHI.2017.2727218}} @inproceedings{a0e6bfb584ff44d2a6b2756c099dacff, abstract = {We present an unsupervised method for learning a hierarchy of sparse feature detectors that are invariant to small shifts and distortions. The resulting feature extractor consists of multiple convolution filters, followed by a feature-pooling layer that computes the max of each filter output within adjacent windows, and a point-wise sigmoid non-linearity. A second level of larger and more invariant features is obtained by training the same algorithm on patches of features from the first level. Training a supervised classifier on these features yields 0.64% error on MNIST, and 54% average recognition rate on Caltech 101 with 30 training samples per category. While the resulting architecture is similar to convolutional networks, the layer-wise unsupervised training procedure alleviates the over-parameterization problems that plague purely supervised learning procedures, and yields good performance with very few labeled training samples.}, author = {Marc'Aurelio Ranzato and Huang, {Fu Jie} and Boureau, {Y. Lan} and Yann LeCun}, booktitle = {2007 IEEE Computer Society Conference on Computer Vision and Pattern Recognition, CVPR'07}, date-added = {2022-10-20 17:30:00 +0000}, date-modified = {2022-10-20 17:30:00 +0000}, doi = {10.1109/CVPR.2007.383157}, isbn = {1424411807}, language = {English (US)}, note = {Copyright: Copyright 2008 Elsevier B.V., All rights reserved.; 2007 IEEE Computer Society Conference on Computer Vision and Pattern Recognition, CVPR'07 ; Conference date: 17-06-2007 Through 22-06-2007}, series = {Proceedings of the IEEE Computer Society Conference on Computer Vision and Pattern Recognition}, title = {Unsupervised learning of invariant feature hierarchies with applications to object recognition}, year = {2007}, bdsk-url-1 = {http://dx.doi.org/10.1109/CVPR.2007.383157}} @inproceedings{NIPS2004_0e900ad8, author = {Welling, Max and Rosen-zvi, Michal and Hinton, Geoffrey E}, booktitle = {Advances in Neural Information Processing Systems}, date-added = {2022-10-20 17:09:37 +0000}, date-modified = {2022-10-20 17:09:37 +0000}, editor = {L. Saul and Y. Weiss and L. Bottou}, publisher = {MIT Press}, title = {Exponential Family Harmoniums with an Application to Information Retrieval}, url = {https://proceedings.neurips.cc/paper/2004/file/0e900ad84f63618452210ab8baae0218-Paper.pdf}, volume = {17}, year = {2004}, bdsk-url-1 = {https://proceedings.neurips.cc/paper/2004/file/0e900ad84f63618452210ab8baae0218-Paper.pdf}} @book{Goodfellow-et-al-2016, author = {Ian Goodfellow and Yoshua Bengio and Aaron Courville}, date-added = {2022-10-20 17:09:11 +0000}, date-modified = {2022-10-20 17:09:11 +0000}, note = {\url{http://www.deeplearningbook.org}}, publisher = {MIT Press}, title = {Deep Learning}, year = {2016}} @article{10.1162/neco.2008.04-07-510, abstract = {{Deep belief networks (DBN) are generative neural network models with many layers of hidden explanatory factors, recently introduced by Hinton, Osindero, and Teh (2006) along with a greedy layer-wise unsupervised learning algorithm. The building block of a DBN is a probabilistic model called a restricted Boltzmann machine (RBM), used to represent one layer of the model. Restricted Boltzmann machines are interesting because inference is easy in them and because they have been successfully used as building blocks for training deeper models. We first prove that adding hidden units yields strictly improved modeling power, while a second theorem shows that RBMs are universal approximators of discrete distributions. We then study the question of whether DBNs with more layers are strictly more powerful in terms of representational power. This suggests a new and less greedy criterion for training RBMs within DBNs.}}, author = {Le Roux, Nicolas and Bengio, Yoshua}, date-added = {2022-10-20 16:20:28 +0000}, date-modified = {2022-10-20 16:20:28 +0000}, doi = {10.1162/neco.2008.04-07-510}, eprint = {https://direct.mit.edu/neco/article-pdf/20/6/1631/817339/neco.2008.04-07-510.pdf}, issn = {0899-7667}, journal = {Neural Computation}, month = {06}, number = {6}, pages = {1631-1649}, title = {{Representational Power of Restricted Boltzmann Machines and Deep Belief Networks}}, url = {https://doi.org/10.1162/neco.2008.04-07-510}, volume = {20}, year = {2008}, bdsk-url-1 = {https://doi.org/10.1162/neco.2008.04-07-510}, bdsk-url-2 = {http://dx.doi.org/10.1162/neco.2008.04-07-510}} @article{SCHMIDHUBER201585, abstract = {In recent years, deep artificial neural networks (including recurrent ones) have won numerous contests in pattern recognition and machine learning. This historical survey compactly summarizes relevant work, much of it from the previous millennium. Shallow and Deep Learners are distinguished by the depth of their credit assignment paths, which are chains of possibly learnable, causal links between actions and effects. I review deep supervised learning (also recapitulating the history of backpropagation), unsupervised learning, reinforcement learning & evolutionary computation, and indirect search for short programs encoding deep and large networks.}, author = {J{\"u}rgen Schmidhuber}, date-added = {2022-10-20 15:50:17 +0000}, date-modified = {2023-01-18 12:58:04 +0100}, doi = {https://doi.org/10.1016/j.neunet.2014.09.003}, issn = {0893-6080}, journal = {Neural Networks}, pages = {85-117}, title = {Deep learning in neural networks: An overview}, url = {https://www.sciencedirect.com/science/article/pii/S0893608014002135}, volume = {61}, year = {2015}, bdsk-url-1 = {https://www.sciencedirect.com/science/article/pii/S0893608014002135}, bdsk-url-2 = {https://doi.org/10.1016/j.neunet.2014.09.003}} @article{Alzubaidi:2021aa, abstract = {In the last few years, the deep learning (DL) computing paradigm has been deemed the Gold Standard in the machine learning (ML) community. Moreover, it has gradually become the most widely used computational approach in the field of ML, thus achieving outstanding results on several complex cognitive tasks, matching or even beating those provided by human performance. One of the benefits of DL is the ability to learn massive amounts of data. The DL field has grown fast in the last few years and it has been extensively used to successfully address a wide range of traditional applications. More importantly, DL has outperformed well-known ML techniques in many domains, e.g., cybersecurity, natural language processing, bioinformatics, robotics and control, and medical information processing, among many others. Despite it has been contributed several works reviewing the State-of-the-Art on DL, all of them only tackled one aspect of the DL, which leads to an overall lack of knowledge about it. Therefore, in this contribution, we propose using a more holistic approach in order to provide a more suitable starting point from which to develop a full understanding of DL. Specifically, this review attempts to provide a more comprehensive survey of the most important aspects of DL and including those enhancements recently added to the field. In particular, this paper outlines the importance of DL, presents the types of DL techniques and networks. It then presents convolutional neural networks (CNNs) which the most utilized DL network type and describes the development of CNNs architectures together with their main features, e.g., starting with the AlexNet network and closing with the High-Resolution network (HR.Net). Finally, we further present the challenges and suggested solutions to help researchers understand the existing research gaps. It is followed by a list of the major DL applications. Computational tools including FPGA, GPU, and CPU are summarized along with a description of their influence on DL. The paper ends with the evolution matrix, benchmark datasets, and summary and conclusion.}, author = {Alzubaidi, Laith and Zhang, Jinglan and Humaidi, Amjad J. and Al-Dujaili, Ayad and Duan, Ye and Al-Shamma, Omran and Santamar{\'\i}a, J. and Fadhel, Mohammed A. and Al-Amidie, Muthana and Farhan, Laith}, da = {2021/03/31}, date-added = {2022-10-20 15:34:38 +0000}, date-modified = {2022-10-20 15:34:38 +0000}, doi = {10.1186/s40537-021-00444-8}, id = {Alzubaidi2021}, isbn = {2196-1115}, journal = {Journal of Big Data}, number = {1}, pages = {53}, title = {Review of deep learning: concepts, CNN architectures, challenges, applications, future directions}, ty = {JOUR}, url = {https://doi.org/10.1186/s40537-021-00444-8}, volume = {8}, year = {2021}, bdsk-url-1 = {https://doi.org/10.1186/s40537-021-00444-8}, bdsk-url-2 = {http://dx.doi.org/10.1186/s40537-021-00444-8}} @inproceedings{pmlr-v5-salakhutdinov09a, abstract = {We present a new learning algorithm for Boltzmann machines that contain many layers of hidden variables. Data-dependent expectations are estimated using a variational approximation that tends to focus on a single mode, and data-independent expectations are approximated using persistent Markov chains. The use of two quite different techniques for estimating the two types of expectation that enter into the gradient of the log-likelihood makes it practical to learn Boltzmann machines with multiple hidden layers and millions of parameters. The learning can be made more efficient by using a layer-by-layer ``pre-training'' phase that allows variational inference to be initialized by a single bottom-up pass. We present results on the MNIST and NORB datasets showing that deep Boltzmann machines learn good generative models and perform well on handwritten digit and visual object recognition tasks.}, address = {Hilton Clearwater Beach Resort, Clearwater Beach, Florida USA}, author = {Salakhutdinov, Ruslan and Hinton, Geoffrey}, booktitle = {Proceedings of the Twelth International Conference on Artificial Intelligence and Statistics}, date-added = {2022-10-20 14:07:25 +0000}, date-modified = {2022-10-20 14:07:25 +0000}, editor = {van Dyk, David and Welling, Max}, month = {16--18 Apr}, pages = {448--455}, pdf = {http://proceedings.mlr.press/v5/salakhutdinov09a/salakhutdinov09a.pdf}, publisher = {PMLR}, series = {Proceedings of Machine Learning Research}, title = {Deep Boltzmann Machines}, url = {https://proceedings.mlr.press/v5/salakhutdinov09a.html}, volume = {5}, year = {2009}, bdsk-url-1 = {https://proceedings.mlr.press/v5/salakhutdinov09a.html}} @article{doi:10.1126/science.7761831, abstract = {An unsupervised learning algorithm for a multilayer network of stochastic neurons is described. Bottom-up "recognition" connections convert the input into representations in successive hidden layers, and top-down "generative" connections reconstruct the representation in one layer from the representation in the layer above. In the "wake" phase, neurons are driven by recognition connections, and generative connections are adapted to increase the probability that they would reconstruct the correct activity vector in the layer below. In the "sleep" phase, neurons are driven by generative connections, and recognition connections are adapted to increase the probability that they would produce the correct activity vector in the layer above.}, author = {Geoffrey E. Hinton and Peter Dayan and Brendan J. Frey and Radford M. Neal}, date-added = {2022-10-20 14:01:11 +0000}, date-modified = {2022-10-20 14:01:11 +0000}, doi = {10.1126/science.7761831}, eprint = {https://www.science.org/doi/pdf/10.1126/science.7761831}, journal = {Science}, number = {5214}, pages = {1158-1161}, title = {The "Wake-Sleep" Algorithm for Unsupervised Neural Networks}, url = {https://www.science.org/doi/abs/10.1126/science.7761831}, volume = {268}, year = {1995}, bdsk-url-1 = {https://www.science.org/doi/abs/10.1126/science.7761831}, bdsk-url-2 = {http://dx.doi.org/10.1126/science.7761831}} @article{Rumelhart:1986aa, abstract = {We describe a new learning procedure, back-propagation, for networks of neurone-like units. The procedure repeatedly adjusts the weights of the connections in the network so as to minimize a measure of the difference between the actual output vector of the net and the desired output vector. As a result of the weight adjustments, internal `hidden'units which are not part of the input or output come to represent important features of the task domain, and the regularities in the task are captured by the interactions of these units. The ability to create useful new features distinguishes back-propagation from earlier, simpler methods such as the perceptron-convergence procedure1.}, author = {Rumelhart, David E. and Hinton, Geoffrey E. and Williams, Ronald J.}, da = {1986/10/01}, date-added = {2022-10-20 13:05:06 +0000}, date-modified = {2022-10-20 13:05:06 +0000}, doi = {10.1038/323533a0}, id = {Rumelhart1986}, isbn = {1476-4687}, journal = {Nature}, number = {6088}, pages = {533--536}, title = {Learning representations by back-propagating errors}, ty = {JOUR}, url = {https://doi.org/10.1038/323533a0}, volume = {323}, year = {1986}, bdsk-url-1 = {https://doi.org/10.1038/323533a0}, bdsk-url-2 = {http://dx.doi.org/10.1038/323533a0}} @article{6795724, author = {LeCun, Y. and Boser, B. and Denker, J. S. and Henderson, D. and Howard, R. E. and Hubbard, W. and Jackel, L. D.}, date-added = {2022-10-20 12:42:43 +0000}, date-modified = {2022-10-20 12:42:43 +0000}, doi = {10.1162/neco.1989.1.4.541}, journal = {Neural Computation}, number = {4}, pages = {541-551}, title = {Backpropagation Applied to Handwritten Zip Code Recognition}, volume = {1}, year = {1989}, bdsk-file-1 = {YnBsaXN0MDDSAQIDBFxyZWxhdGl2ZVBhdGhZYWxpYXNEYXRhXxAwLi4vLi4vRG93bmxvYWRzL2NpdGF0aW9ucy0yMDIyMTAyMlQxMjE0MDkuYmlidGV4TxEBogAAAAABogACAAAMTWFjaW50b3NoIEhEAAAAAAAAAAAAAAAAAAAAAAAAAEJEAAH/////H2NpdGF0aW9ucy0yMDIyMTAyMlQxMjEjRkZGRkZGRkYAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP////8AAAAAAAAAAAAAAAAAAgACAAAKIGN1AAAAAAAAAAAAAAAAAAlEb3dubG9hZHMAAAIAQi86VXNlcnM6Z2lvdmFubmlkaXNhcnJhOkRvd25sb2FkczpjaXRhdGlvbnMtMjAyMjEwMjJUMTIxNDA5LmJpYnRleAAOAEIAIABjAGkAdABhAHQAaQBvAG4AcwAtADIAMAAyADIAMQAwADIAMgBUADEAMgAxADQAMAA5AC4AYgBpAGIAdABlAHgADwAaAAwATQBhAGMAaQBuAHQAbwBzAGgAIABIAEQAEgBAVXNlcnMvZ2lvdmFubmlkaXNhcnJhL0Rvd25sb2Fkcy9jaXRhdGlvbnMtMjAyMjEwMjJUMTIxNDA5LmJpYnRleAATAAEvAAAVAAIAFv//AAAACAANABoAJABXAAAAAAAAAgEAAAAAAAAABQAAAAAAAAAAAAAAAAAAAf0=}, bdsk-url-1 = {http://dx.doi.org/10.1162/neco.1989.1.4.541}} @inproceedings{NIPS2009_31839b03, author = {Hinton, Geoffrey E and Salakhutdinov, Russ R}, booktitle = {Advances in Neural Information Processing Systems}, date-added = {2022-10-19 15:53:15 +0000}, date-modified = {2022-10-19 15:53:15 +0000}, editor = {Y. Bengio and D. Schuurmans and J. Lafferty and C. Williams and A. Culotta}, publisher = {Curran Associates, Inc.}, title = {Replicated Softmax: an Undirected Topic Model}, url = {https://proceedings.neurips.cc/paper/2009/file/31839b036f63806cba3f47b93af8ccb5-Paper.pdf}, volume = {22}, year = {2009}, bdsk-url-1 = {https://proceedings.neurips.cc/paper/2009/file/31839b036f63806cba3f47b93af8ccb5-Paper.pdf}} @article{Ventura_2024, doi = {10.1088/2632-2153/ad5a5f}, url = {https://doi.org/10.1088/2632-2153/ad5a5f}, year = {2024}, month = {jun}, publisher = {IOP Publishing}, volume = {5}, number = {2}, pages = {025078}, author = {Ventura, E. and Cocco, S. and Monasson, R. and Zamponi, Francesco}, title = {Unlearning regularization for Boltzmann machines}, journal = {Machine Learning: Science and Technology}, doi:[10.1007/BF02551274](https://doi.org/10.1007/BF02551274) arXiv:[7305.1948](https://arxiv.org/abs/7305.1948)
9. pmlr-v15-coates11a: abstract = {A great deal of research has focused on algorithms for learning features from unlabeled data. Indeed, much progress has been made on benchmark datasets like NORB and CIFAR-10 by employing increasingly complex unsupervised learning algorithms and deep models. In this paper, however, we show that several simple factors, such as the number of hidden nodes in the model, may be more important to achieving high performance than the learning algorithm or the depth of the model. Specifically, we will apply several off-the-shelf feature learning algorithms (sparse auto-encoders, sparse RBMs, K-means clustering, and Gaussian mixtures) to CIFAR-10, NORB, and STL datasets using only single-layer networks. We then present a detailed analysis of the effect of changes in the model setup: the receptive field size, number of hidden nodes (features), the step-size (``stride'') between extracted features, and the effect of whitening. Our results show that large numbers of hidden nodes and dense feature extraction are critical to achieving high performance - so critical, in fact, that when these parameters are pushed to their limits, we achieve state-of-the-art performance on both CIFAR-10 and NORB using only a single layer of features. More surprisingly, our best performance is based on K-means clustering, which is extremely fast, has no hyper-parameters to tune beyond the model structure itself, and is very easy to implement. Despite the simplicity of our system, we achieve accuracy beyond all previously published results on the CIFAR-10 and NORB datasets (79.6% and 97.2% respectively).}, address = {Fort Lauderdale, FL, USA}, author = {Coates, Adam and Ng, Andrew and Lee, Honglak}, booktitle = {Proceedings of the Fourteenth International Conference on Artificial Intelligence and Statistics}, date-added = {2022-10-19 15:52:13 +0000}, date-modified = {2022-10-19 15:52:13 +0000}, editor = {Gordon, Geoffrey and Dunson, David and Dud{\'\i}k, Miroslav}, month = {11--13 Apr}, pages = {215--223}, pdf = {http://proceedings.mlr.press/v15/coates11a/coates11a.pdf}, publisher = {PMLR}, series = {Proceedings of Machine Learning Research}, title = {An Analysis of Single-Layer Networks in Unsupervised Feature Learning}, url = {https://proceedings.mlr.press/v15/coates11a.html}, volume = {15}, year = {2011}, bdsk-url-1 = {https://proceedings.mlr.press/v15/coates11a.html}} @inproceedings{10.1145/1273496.1273596, abstract = {Most of the existing approaches to collaborative filtering cannot handle very large data sets. In this paper we show how a class of two-layer undirected graphical models, called Restricted Boltzmann Machines (RBM's), can be used to model tabular data, such as user's ratings of movies. We present efficient learning and inference procedures for this class of models and demonstrate that RBM's can be successfully applied to the Netflix data set, containing over 100 million user/movie ratings. We also show that RBM's slightly outperform carefully-tuned SVD models. When the predictions of multiple RBM models and multiple SVD models are linearly combined, we achieve an error rate that is well over 6% better than the score of Netflix's own system.}, address = {New York, NY, USA}, author = {Salakhutdinov, Ruslan and Mnih, Andriy and Hinton, Geoffrey}, booktitle = {Proceedings of the 24th International Conference on Machine Learning}, date-added = {2022-10-19 15:51:15 +0000}, date-modified = {2022-10-19 15:51:15 +0000}, doi = {10.1145/1273496.1273596}, isbn = {9781595937933}, location = {Corvalis, Oregon, USA}, numpages = {8}, pages = {791--798}, publisher = {Association for Computing Machinery}, series = {ICML '07}, title = {Restricted Boltzmann Machines for Collaborative Filtering}, url = {https://doi.org/10.1145/1273496.1273596}, year = {2007}, bdsk-url-1 = {https://doi.org/10.1145/1273496.1273596}, bdsk-url-2 = {http://dx.doi.org/10.1145/1273496.1273596}} @inproceedings{10.1145/1390156.1390224, abstract = {Recently, many applications for Restricted Boltzmann Machines (RBMs) have been developed for a large variety of learning problems. However, RBMs are usually used as feature extractors for another learning algorithm or to provide a good initialization for deep feed-forward neural network classifiers, and are not considered as a standalone solution to classification problems. In this paper, we argue that RBMs provide a self-contained framework for deriving competitive non-linear classifiers. We present an evaluation of different learning algorithms for RBMs which aim at introducing a discriminative component to RBM training and improve their performance as classifiers. This approach is simple in that RBMs are used directly to build a classifier, rather than as a stepping stone. Finally, we demonstrate how discriminative RBMs can also be successfully employed in a semi-supervised setting.}, address = {New York, NY, USA}, author = {Larochelle, Hugo and Bengio, Yoshua}, booktitle = {Proceedings of the 25th International Conference on Machine Learning}, date-added = {2022-10-19 15:50:45 +0000}, date-modified = {2022-10-19 15:50:45 +0000}, doi = {10.1145/1390156.1390224}, isbn = {9781605582054}, location = {Helsinki, Finland}, numpages = {8}, pages = {536--543}, publisher = {Association for Computing Machinery}, series = {ICML '08}, title = {Classification Using Discriminative Restricted Boltzmann Machines}, url = {https://doi.org/10.1145/1390156.1390224}, year = {2008}, bdsk-file-1 = {YnBsaXN0MDDSAQIDBFxyZWxhdGl2ZVBhdGhZYWxpYXNEYXRhXxAqLi4vLi4vLlRyYXNoL2NpdGF0aW9ucy0yMDIyMTAyMlQxMjE1MjkucmlzTxEBjAAAAAABjAACAAAMTWFjaW50b3NoIEhEAAAAAAAAAAAAAAAAAAAAAAAAAEJEAAH/////HWNpdGF0aW9ucy0yMDIyMTAyMlQxMjE1MjkucmlzAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP////8AAAAAAAAAAAAAAAAAAgACAAAKIGN1AAAAAAAAAAAAAAAAAAYuVHJhc2gAAgA8LzpVc2VyczpnaW92YW5uaWRpc2FycmE6LlRyYXNoOmNpdGF0aW9ucy0yMDIyMTAyMlQxMjE1MjkucmlzAA4APAAdAGMAaQB0AGEAdABpAG8AbgBzAC0AMgAwADIAMgAxADAAMgAyAFQAMQAyADEANQAyADkALgByAGkAcwAPABoADABNAGEAYwBpAG4AdABvAHMAaAAgAEgARAASADpVc2Vycy9naW92YW5uaWRpc2FycmEvLlRyYXNoL2NpdGF0aW9ucy0yMDIyMTAyMlQxMjE1MjkucmlzABMAAS8AABUAAgAW//8AAAAIAA0AGgAkAFEAAAAAAAACAQAAAAAAAAAFAAAAAAAAAAAAAAAAAAAB4Q==}, bdsk-url-1 = {https://doi.org/10.1145/1390156.1390224}, bdsk-url-2 = {http://dx.doi.org/10.1145/1390156.1390224}} @article{doi:10.1126/science.1127647, abstract = {High-dimensional data can be converted to low-dimensional codes by training a multilayer neural network with a small central layer to reconstruct high-dimensional input vectors. Gradient descent can be used for fine-tuning the weights in such ``autoencoder'' networks, but this works well only if the initial weights are close to a good solution. We describe an effective way of initializing the weights that allows deep autoencoder networks to learn low-dimensional codes that work much better than principal components analysis as a tool to reduce the dimensionality of data.}, author = {G. E. Hinton and R. R. Salakhutdinov}, date-added = {2022-10-19 15:49:20 +0000}, date-modified = {2022-10-19 15:49:20 +0000}, doi = {10.1126/science.1127647}, eprint = {https://www.science.org/doi/pdf/10.1126/science.1127647}, journal = {Science}, number = {5786}, pages = {504-507}, title = {Reducing the Dimensionality of Data with Neural Networks}, url = {https://www.science.org/doi/abs/10.1126/science.1127647}, volume = {313}, year = {2006}, bdsk-url-1 = {https://www.science.org/doi/abs/10.1126/science.1127647}, bdsk-url-2 = {http://dx.doi.org/10.1126/science.1127647}} @article{HINTON2007428, abstract = {To achieve its impressive performance in tasks such as speech perception or object recognition, the brain extracts multiple levels of representation from the sensory input. Backpropagation was the first computationally efficient model of how neural networks could learn multiple layers of representation, but it required labeled training data and it did not work well in deep networks. The limitations of backpropagation learning can now be overcome by using multilayer neural networks that contain top-down connections and training them to generate sensory data rather than to classify it. Learning multilayer generative models might seem difficult, but a recent discovery makes it easy to learn nonlinear distributed representations one layer at a time.}, author = {Geoffrey E. Hinton}, date-added = {2022-10-19 11:40:08 +0000}, date-modified = {2022-10-19 11:40:08 +0000}, doi = {https://doi.org/10.1016/j.tics.2007.09.004}, issn = {1364-6613}, journal = {Trends in Cognitive Sciences}, number = {10}, pages = {428-434}, title = {Learning multiple layers of representation}, url = {https://www.sciencedirect.com/science/article/pii/S1364661307002173}, volume = {11}, year = {2007}, bdsk-url-1 = {https://www.sciencedirect.com/science/article/pii/S1364661307002173}, bdsk-url-2 = {https://doi.org/10.1016/j.tics.2007.09.004}} @article{10.1162/neco.2006.18.7.1527, abstract = {{We show how to use ``complementary priors'' to eliminate the explaining-away effects that make inference difficult in densely connected belief nets that have many hidden layers. Using complementary priors, we derive a fast, greedy algorithm that can learn deep, directed belief networks one layer at a time, provided the top two layers form an undirected associative memory. The fast, greedy algorithm is used to initialize a slower learning procedure that fine-tunes the weights using a contrastive version of the wake-sleep algorithm. After fine-tuning, a network with three hidden layers forms a very good generative model of the joint distribution of handwritten digit images and their labels. This generative model gives better digit classification than the best discriminative learning algorithms. The low-dimensional manifolds on which the digits lie are modeled by long ravines in the free-energy landscape of the top-level associative memory, and it is easy to explore these ravines by using the directed connections to display what the associative memory has in mind.}}, author = {Hinton, Geoffrey E. and Osindero, Simon and Teh, Yee-Whye}, date-added = {2022-10-19 11:36:49 +0000}, date-modified = {2022-10-19 11:36:49 +0000}, doi = {10.1162/neco.2006.18.7.1527}, eprint = {https://direct.mit.edu/neco/article-pdf/18/7/1527/816558/neco.2006.18.7.1527.pdf}, issn = {0899-7667}, journal = {Neural Computation}, month = {07}, number = {7}, pages = {1527-1554}, title = {{A Fast Learning Algorithm for Deep Belief Nets}}, url = {https://doi.org/10.1162/neco.2006.18.7.1527}, volume = {18}, year = {2006}, bdsk-url-1 = {https://doi.org/10.1162/neco.2006.18.7.1527}, bdsk-url-2 = {http://dx.doi.org/10.1162/neco.2006.18.7.1527}} @book{RumelhartMcClellandGroup86, added-at = {2008-09-16T23:39:07.000+0200}, address = {Cambridge, MA}, biburl = {https://www.bibsonomy.org/bibtex/2fe95fe80b50d2417a1eac5f76f4c54a3/brian.mingus}, booktitle = {Parallel Distributed Processing. {Volume 1}: Foundations}, date-added = {2022-10-19 10:10:41 +0000}, date-modified = {2023-01-18 12:57:04 +0100}, description = {CCNLab BibTeX}, editor = {Rumelhart, D. E. and McClelland, J. L. and {{PDP Research Group}}}, interhash = {a722d977fefd68986735a679d10ce661}, intrahash = {fe95fe80b50d2417a1eac5f76f4c54a3}, publisher = {MIT Press}, timestamp = {2008-09-16T23:41:32.000+0200}, title = {Parallel Distributed Processing. {Volume 1}: Foundations}, year = 1986} @book{PDR, address = {Cambridge, MA}, author = {D. E. Rumelhart and J. L. McClelland}, date-added = {2022-10-19 10:05:07 +0000}, date-modified = {2022-10-19 10:10:41 +0000}, month = {January}, publisher = {MIT Press}, title = {Parallel Distributed Processing: Explorations in the Microstructure of Cognition: Foundations}, volume = {1}, year = {1986}} @inproceedings{10.5555/2986916.2987028, abstract = {We study a particular type of Boltzmann machine with a bipartite graph structure called a harmonium. Our interest is in using such a machine to model a probability distribution on binary input vectors. We analyze the class of probability distributions that can be modeled by such machines, showing that for each n ≥ 1 this class includes arbitrarily good approximations to any distribution on the set of all n-vectors of binary inputs. We then present two learning algorithms for these machines. The first learning algorithm is the standard gradient ascent heuristic for computing maximum likelihood estimates for the parameters (i.e. weights and thresholds) of the model. Here we give a closed form for this gradient that is significantly easier to compute than the corresponding gradient for the general Boltzmann machine. The second learning algorithm is a greedy method that creates the hidden units and computes their weights one at a time. This method is a variant of the standard method for projection pursuit density estimation. We give experimental results for these learning methods on synthetic data and natural data from the domain of handwritten digits.}, address = {San Francisco, CA, USA}, author = {Freund, Yoav and Haussler, David}, booktitle = {Proceedings of the 4th International Conference on Neural Information Processing Systems}, date-added = {2022-10-19 09:13:52 +0000}, date-modified = {2022-10-19 09:13:52 +0000}, isbn = {1558602224}, location = {Denver, Colorado}, numpages = {8}, pages = {912--919}, publisher = {Morgan Kaufmann Publishers Inc.}, series = {NIPS'91}, title = {Unsupervised Learning of Distributions on Binary Vectors Using Two Layer Networks}, year = {1991}} @article{Hinton:2002aa, abstract = {It is possible to combine multiple latent-variable models of the same data by multiplying their probability distributions together and then renormalizing. This way of combining individual "expert" models makes it hard to generate samples from the combined model but easy to infer the values of the latent variables of each expert, because the combination rule ensures that the latent variables of different experts are conditionally independent when given the data. A product of experts (PoE) is therefore an interesting candidate for a perceptual system in which rapid inference is vital and generation is unnecessary. Training a PoE by maximizing the likelihood of the data is difficult because it is hard even to approximate the derivatives of the renormalization term in the combination rule. Fortunately, a PoE can be trained using a different objective function called "contrastive divergence" whose derivatives with regard to the parameters can be approximated accurately and efficiently. Examples are presented of contrastive divergence learning using several types of expert on several types of data.}, address = {Gatsby Computational Neuroscience Unit, University College London, UK. hinton@cs.toronto.edu}, author = {Hinton, Geoffrey E}, crdt = {2002/08/16 10:00}, date = {2002 Aug}, date-added = {2022-10-19 08:48:54 +0000}, date-modified = {2022-10-19 08:48:54 +0000}, dcom = {20020906}, doi = {10.1162/089976602760128018}, edat = {2002/08/16 10:00}, issn = {0899-7667 (Print); 0899-7667 (Linking)}, jid = {9426182}, journal = {Neural Comput}, jt = {Neural computation}, language = {eng}, lr = {20220316}, mhda = {2002/08/16 10:01}, month = {Aug}, number = {8}, own = {NLM}, pages = {1771--1800}, phst = {2002/08/16 10:00 {$[$}pubmed{$]$}; 2002/08/16 10:01 {$[$}medline{$]$}; 2002/08/16 10:00 {$[$}entrez{$]$}}, pl = {United States}, pmid = {12180402}, pst = {ppublish}, pt = {Journal Article}, status = {PubMed-not-MEDLINE}, title = {Training products of experts by minimizing contrastive divergence.}, volume = {14}, year = {2002}, bdsk-url-1 = {http://dx.doi.org/10.1162/089976602760128018}} @article{PhysRevLett.35.1792, author = {Sherrington, David and Kirkpatrick, Scott}, date-added = {2022-10-18 16:03:14 +0000}, date-modified = {2022-10-18 16:03:14 +0000}, doi = {10.1103/PhysRevLett.35.1792}, issue = {26}, journal = {Phys. Rev. Lett.}, month = {Dec}, numpages = {0}, pages = {1792--1796}, publisher = {American Physical Society}, title = {Solvable Model of a Spin-Glass}, url = {https://link.aps.org/doi/10.1103/PhysRevLett.35.1792}, volume = {35}, year = {1975}, bdsk-url-1 = {https://link.aps.org/doi/10.1103/PhysRevLett.35.1792}, bdsk-url-2 = {http://dx.doi.org/10.1103/PhysRevLett.35.1792}} @inproceedings{BM, address = {Washington D. C.}, author = {S.E. Fahlman, G. E. Hinton and T.J. Sejnowski}, booktitle = {Proceedings of the AAAI-83 conference}, date-added = {2022-10-18 15:42:45 +0000}, date-modified = {2022-10-18 15:51:57 +0000}, journal = {Procccdings of the AAAI-83 confcrence}, month = {August}, title = {Massively Parallel Architectures for Al: NETL, Thistle, and Boltzmann Machines}, year = {1983}, bdsk-file-1 = {YnBsaXN0MDDSAQIDBFxyZWxhdGl2ZVBhdGhZYWxpYXNEYXRhXxAwLi4vLi4vRG93bmxvYWRzL2NpdGF0aW9ucy0yMDIyMTAyMlQxMjE0MDkuYmlidGV4TxEBogAAAAABogACAAAMTWFjaW50b3NoIEhEAAAAAAAAAAAAAAAAAAAAAAAAAEJEAAH/////H2NpdGF0aW9ucy0yMDIyMTAyMlQxMjEjRkZGRkZGRkYAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP////8AAAAAAAAAAAAAAAAAAgACAAAKIGN1AAAAAAAAAAAAAAAAAAlEb3dubG9hZHMAAAIAQi86VXNlcnM6Z2lvdmFubmlkaXNhcnJhOkRvd25sb2FkczpjaXRhdGlvbnMtMjAyMjEwMjJUMTIxNDA5LmJpYnRleAAOAEIAIABjAGkAdABhAHQAaQBvAG4AcwAtADIAMAAyADIAMQAwADIAMgBUADEAMgAxADQAMAA5AC4AYgBpAGIAdABlAHgADwAaAAwATQBhAGMAaQBuAHQAbwBzAGgAIABIAEQAEgBAVXNlcnMvZ2lvdmFubmlkaXNhcnJhL0Rvd25sb2Fkcy9jaXRhdGlvbnMtMjAyMjEwMjJUMTIxNDA5LmJpYnRleAATAAEvAAAVAAIAFv//AAAACAANABoAJABXAAAAAAAAAgEAAAAAAAAABQAAAAAAAAAAAAAAAAAAAf0=}} @article{ACKLEY1985147, abstract = {The computational power of massively parallel networks of simple processing elements resides in the communication bandwidth provided by the hardware connections between elements. These connections can allow a significant fraction of the knowledge of the system to be applied to an instance of a problem in a very short time. One kind of computation for which massively parallel networks appear to be well suited is large constraint satisfaction searches, but to use the connections efficiently two conditions must be met: First, a search technique that is suitable for parallel networks must be found. Second, there must be some way of choosing internal representations which allow the preexisting hardware connections to be used efficiently for encoding the constraints in the domain being searched. We describe a general parallel search method, based on statistical mechanics, and we show how it leads to a general learning rule for modifying the connection strengths so as to incorporate knowledge about a task domain in an efficient way. We describe some simple examples in which the learning algorithm creates internal representations that are demonstrably the most efficient way of using the preexisting connectivity structure.}, author = {D. H. Ackley and G. E. Hinton and T. J. Sejnowski}, date-added = {2022-10-18 14:53:51 +0000}, date-modified = {2022-10-18 14:53:51 +0000}, doi = {https://doi.org/10.1016/S0364-0213(85)80012-4}, issn = {0364-0213}, journal = {Cognitive Science}, number = {1}, pages = {147-169}, title = {A learning algorithm for boltzmann machines}, url = {https://www.sciencedirect.com/science/article/pii/S0364021385800124}, volume = {9}, year = {1985}, bdsk-url-1 = {https://www.sciencedirect.com/science/article/pii/S0364021385800124}, bdsk-url-2 = {https://doi.org/10.1016/S0364-0213(85)80012-4}} @article{pand, author = {O. G. Selfridge and U. Neisser}, date-added = {2022-10-18 14:46:30 +0000}, date-modified = {2022-10-18 14:48:44 +0000}, journal = {Scientific American}, month = {August}, number = {2}, pages = {60-68}, title = {Pattern recognition by machine}, volume = {203}, year = {1960}} @inbook{6302930, author = {G. E. Hinton and T.J. Sejnowski}, booktitle = {Parallel Distributed Processing: Explorations in the Microstructure of Cognition: Foundations}, date-added = {2022-10-18 14:17:28 +0000}, date-modified = {2022-11-07 11:57:45 +0000}, pages = {282-317}, publisher = {MIT Press}, title = {Learning and Relearning in Boltzmann Machines. In: Rumelhart, D. E., McClelland, J. S. Parallel Distributed Processing: Explorations in the Microstructure of Cognition}, volume = {1}, year = {1986}} @inbook{6302931, author = {P. Smolensky}, booktitle = {Parallel Distributed Processing: Explorations in the Microstructure of Cognition: Foundations}, date-added = {2022-10-18 14:16:57 +0000}, date-modified = {2022-11-10 09:41:38 +0000}, pages = {194-281}, publisher = {MIT Press}, title = {Information Processing in Dynamical Systems: Foundations of Harmony Theory. In: Rumelhart, D. E., McClelland, J. S. Parallel Distributed Processing: Explorations in the Microstructure of Cognition}, volume = {1}, year = {1986}} @inproceedings{10.1007/978-3-642-33275-3_2, abstract = {Restricted Boltzmann machines (RBMs) are probabilistic graphical models that can be interpreted as stochastic neural networks. The increase in computational power and the development of faster learning algorithms have made them applicable to relevant machine learning problems. They attracted much attention recently after being proposed as building blocks of multi-layer learning systems called deep belief networks. This tutorial introduces RBMs as undirected graphical models. The basic concepts of graphical models are introduced first, however, basic knowledge in statistics is presumed. Different learning algorithms for RBMs are discussed. As most of them are based on Markov chain Monte Carlo (MCMC) methods, an introduction to Markov chains and the required MCMC techniques is provided.}, address = {Berlin, Heidelberg}, author = {Fischer, A. and Igel, C.}, booktitle = {Progress in Pattern Recognition, Image Analysis, Computer Vision, and Applications}, date-added = {2022-10-11 11:36:01 +0000}, date-modified = {2022-10-11 11:36:01 +0000}, editor = {Alvarez, L. and Mejail, M. and Gomez, L. and Jacobo, J.}, isbn = {978-3-642-33275-3}, pages = {14--36}, publisher = {Springer Berlin Heidelberg}, title = {An Introduction to Restricted Boltzmann Machines}, year = {2012}} @article{Decelle_2020, abstract = {We consider a special type of restricted Boltzmann machine (RBM), namely a Gaussian-spherical RBM where the visible units have Gaussian priors while the vector of hidden variables is constrained to stay on an sphere. The spherical constraint having the advantage to admit exact asymptotic treatments, various scaling regimes are explicitly identified based solely on the spectral properties of the coupling matrix (also called weight matrix of the RBM). Incidentally these happen to be formally related to similar scaling behaviors obtained in a different context dealing with spatial condensation of zero range processes. More specifically, when the spectrum of the coupling matrix is doubly degenerated an exact treatment can be proposed to deal with finite size effects. Interestingly the known parallel between the ferromagnetic transition of the spherical model and the Bose--Einstein condensation can be made explicit in that case. More importantly this gives us the ability to extract all needed response functions with arbitrary precision for the training algorithm of the RBM. This allows us then to numerically integrate the dynamics of the spectrum of the weight matrix during learning in a precise way. This dynamics reveals in particular a sequential emergence of modes from the Marchenko--Pastur bulk of singular vectors of the coupling matrix.}, author = {Aur{\'{e}}lien Decelle and Cyril Furtlehner}, date-added = {2022-10-11 11:21:29 +0000}, date-modified = {2022-10-11 11:21:29 +0000}, doi = {10.1088/1751-8121/ab79f3}, journal = {Journal of Physics A: Mathematical and Theoretical}, month = {apr}, number = {18}, pages = {184002}, publisher = {{IOP} Publishing}, title = {Gaussian-spherical restricted Boltzmann machines}, url = {https://doi.org/10.1088/1751-8121/ab79f3}, volume = {53}, year = 2020, bdsk-file-1 = {YnBsaXN0MDDSAQIDBFxyZWxhdGl2ZVBhdGhZYWxpYXNEYXRhXxAcLi4vLi4vRG93bmxvYWRzL2NzcF8zMTNfLmJpYk8RAVIAAAAAAVIAAgAADE1hY2ludG9zaCBIRAAAAAAAAAAAAAAAAAAAAAAAAABCRAAB/////wxjc3BfMzEzXy5iaWIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/////AAAAAAAAAAAAAAAAAAIAAgAACiBjdQAAAAAAAAAAAAAAAAAJRG93bmxvYWRzAAACAC4vOlVzZXJzOmdpb3Zhbm5pZGlzYXJyYTpEb3dubG9hZHM6Y3NwXzMxM18uYmliAA4AGgAMAGMAcwBwAF8AMwAxADMAXwAuAGIAaQBiAA8AGgAMAE0AYQBjAGkAbgB0AG8AcwBoACAASABEABIALFVzZXJzL2dpb3Zhbm5pZGlzYXJyYS9Eb3dubG9hZHMvY3NwXzMxM18uYmliABMAAS8AABUAAgAW//8AAAAIAA0AGgAkAEMAAAAAAAACAQAAAAAAAAAFAAAAAAAAAAAAAAAAAAABmQ==}, bdsk-url-1 = {https://doi.org/10.1088/1751-8121/ab79f3}, bdsk-url-2 = {http://dx.doi.org/10.1088/1751-8121/ab79f3}} @article{Decelle_2021, abstract = {This review deals with restricted Boltzmann machine (RBM) under the light of statistical physics. The RBM is a classical family of machine learning (ML) models which played a central role in the development of deep learning. Viewing it as a spin glass model and exhibiting various links with other models of statistical physics, we gather recent results dealing with mean-field theory in this context. First the functioning of the RBM can be analyzed via the phase diagrams obtained for various statistical ensembles of RBM, leading in particular to identify a compositional phase where a small number of features or modes are combined to form complex patterns. Then we discuss recent works either able to devise mean-field based learning algorithms; either able to reproduce generic aspects of the learning process from some ensemble dynamics equations or/and from linear stability arguments.}, author = {Aur{\'{e}}lien Decelle and Cyril Furtlehner}, date-added = {2022-10-11 11:21:03 +0000}, date-modified = {2022-10-18 14:22:54 +0000}, doi = {10.1088/1674-1056/abd160}, journal = {Chinese Physics B}, month = {apr}, number = {4}, pages = {040202}, publisher = {{IOP} Publishing}, title = {Restricted Boltzmann machine: Recent advances and mean-field theory}, url = {https://doi.org/10.1088/1674-1056/abd160}, volume = {30}, year = 2021, bdsk-url-1 = {https://doi.org/10.1088/1674-1056/abd160}, bdsk-url-2 = {http://dx.doi.org/10.1088/1674-1056/abd160}} @article{Huang_2018, abstract = {Synapses in real neural circuits can take discrete values including zero (silent or potential) synapses. The computational role of zero synapses in unsupervised feature learning of unlabeled noisy data is still unclear, thus it is important to understand how the sparseness of synaptic activity is shaped during learning and its relationship with receptive field formation. Here, we formulate this kind of sparse feature learning by a statistical mechanics approach. We find that learning decreases the fraction of zero synapses, and when the fraction decreases rapidly around a critical data size, an intrinsically structured receptive field starts to develop. Further increasing the data size refines the receptive field, while a very small fraction of zero synapses remain to act as contour detectors. This phenomenon is discovered not only in learning a handwritten digits dataset, but also in learning retinal neural activity measured in a natural-movie-stimuli experiment.}, author = {Haiping Huang}, date-added = {2022-10-11 11:02:54 +0000}, date-modified = {2022-10-11 11:02:54 +0000}, doi = {10.1088/1751-8121/aaa631}, journal = {Journal of Physics A: Mathematical and Theoretical}, month = {jan}, number = {8}, pages = {08LT01}, publisher = {{IOP} Publishing}, title = {Role of zero synapses in unsupervised feature learning}, url = {https://doi.org/10.1088/1751-8121/aaa631}, volume = {51}, year = 2018, bdsk-url-1 = {https://doi.org/10.1088/1751-8121/aaa631}, bdsk-url-2 = {http://dx.doi.org/10.1088/1751-8121/aaa631}} @article{e23010034, abstract = {The Hopfield model and the Boltzmann machine are among the most popular examples of neural networks. The latter, widely used for classification and feature detection, is able to efficiently learn a generative model from observed data and constitutes the benchmark for statistical learning. The former, designed to mimic the retrieval phase of an artificial associative memory lays in between two paradigmatic statistical mechanics models, namely the Curie-Weiss and the Sherrington-Kirkpatrick, which are recovered as the limiting cases of, respectively, one and many stored memories. Interestingly, the Boltzmann machine and the Hopfield network, if considered to be two cognitive processes (learning and information retrieval), are nothing more than two sides of the same coin. In fact, it is possible to exactly map the one into the other. We will inspect such an equivalence retracing the most representative steps of the research in this field.}, article-number = {34}, author = {Marullo, C. and Agliari, E.}, date-added = {2022-10-11 10:39:09 +0000}, date-modified = {2022-10-11 10:39:09 +0000}, doi = {10.3390/e23010034}, issn = {1099-4300}, journal = {Entropy}, number = {1}, pubmedid = {33383716}, title = {Boltzmann Machines as Generalized Hopfield Networks: A Review of Recent Results and Outlooks}, url = {https://www.mdpi.com/1099-4300/23/1/34}, volume = {23}, year = {2021}, bdsk-url-1 = {https://www.mdpi.com/1099-4300/23/1/34}, bdsk-url-2 = {http://dx.doi.org/10.3390/e23010034}} @article{PhysRevE.96.042156, author = {Barra, A. and Genovese, G. and Sollich, P. and Tantari, D.}, date-added = {2022-10-11 10:30:43 +0000}, date-modified = {2022-10-11 10:30:43 +0000}, doi = {10.1103/PhysRevE.96.042156}, issue = {4}, journal = {Phys. Rev. E}, month = {Oct}, numpages = {5}, pages = {042156}, publisher = {American Physical Society}, title = {Phase transitions in restricted Boltzmann machines with generic priors}, url = {https://link.aps.org/doi/10.1103/PhysRevE.96.042156}, volume = {96}, year = {2017}, bdsk-file-1 = {YnBsaXN0MDDSAQIDBFxyZWxhdGl2ZVBhdGhZYWxpYXNEYXRhXxAwLi4vLi4vRG93bmxvYWRzL2NpdGF0aW9ucy0yMDIyMTAxOVQwODQ3MjQuYmlidGV4TxEBogAAAAABogACAAAMTWFjaW50b3NoIEhEAAAAAAAAAAAAAAAAAAAAAAAAAEJEAAH/////H2NpdGF0aW9ucy0yMDIyMTAxOVQwODQjRkZGRkZGRkYAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP////8AAAAAAAAAAAAAAAAAAgACAAAKIGN1AAAAAAAAAAAAAAAAAAlEb3dubG9hZHMAAAIAQi86VXNlcnM6Z2lvdmFubmlkaXNhcnJhOkRvd25sb2FkczpjaXRhdGlvbnMtMjAyMjEwMTlUMDg0NzI0LmJpYnRleAAOAEIAIABjAGkAdABhAHQAaQBvAG4AcwAtADIAMAAyADIAMQAwADEAOQBUADAAOAA0ADcAMgA0AC4AYgBpAGIAdABlAHgADwAaAAwATQBhAGMAaQBuAHQAbwBzAGgAIABIAEQAEgBAVXNlcnMvZ2lvdmFubmlkaXNhcnJhL0Rvd25sb2Fkcy9jaXRhdGlvbnMtMjAyMjEwMTlUMDg0NzI0LmJpYnRleAATAAEvAAAVAAIAFv//AAAACAANABoAJABXAAAAAAAAAgEAAAAAAAAABQAAAAAAAAAAAAAAAAAAAf0=}, bdsk-url-1 = {https://link.aps.org/doi/10.1103/PhysRevE.96.042156}, bdsk-url-2 = {http://dx.doi.org/10.1103/PhysRevE.96.042156}} @article{PhysRevE.97.022310, author = {Barra, A. and Genovese, G. and Sollich, P. and Tantari, D.}, date-added = {2022-10-11 10:29:38 +0000}, date-modified = {2022-10-11 10:29:38 +0000}, doi = {10.1103/PhysRevE.97.022310}, issue = {2}, journal = {Phys. Rev. E}, month = {Feb}, numpages = {14}, pages = {022310}, publisher = {American Physical Society}, title = {Phase diagram of restricted Boltzmann machines and generalized Hopfield networks with arbitrary priors}, url = {https://link.aps.org/doi/10.1103/PhysRevE.97.022310}, volume = {97}, year = {2018}, bdsk-url-1 = {https://link.aps.org/doi/10.1103/PhysRevE.97.022310}, bdsk-url-2 = {http://dx.doi.org/10.1103/PhysRevE.97.022310}} @article{PhysRevLett.109.268101, author = {Agliari, E. and Barra, A. and Galluzzi, A. and Guerra, F. and Moauro, F.}, date-added = {2022-10-11 10:29:05 +0000}, date-modified = {2022-10-11 10:29:05 +0000}, doi = {10.1103/PhysRevLett.109.268101}, issue = {26}, journal = {Phys. Rev. Lett.}, month = {Dec}, numpages = {5}, pages = {268101}, publisher = {American Physical Society}, title = {Multitasking Associative Networks}, url = {https://link.aps.org/doi/10.1103/PhysRevLett.109.268101}, volume = {109}, year = {2012}, bdsk-url-1 = {https://link.aps.org/doi/10.1103/PhysRevLett.109.268101}, bdsk-url-2 = {http://dx.doi.org/10.1103/PhysRevLett.109.268101}} @article{BARRA20121, abstract = {A specific type of neural networks, the Restricted Boltzmann Machines (RBM), are implemented for classification and feature detection in machine learning. They are characterized by separate layers of visible and hidden units, which are able to learn efficiently a generative model of the observed data. We study a ``hybrid'' version of RBMs, in which hidden units are analog and visible units are binary, and we show that thermodynamics of visible units are equivalent to those of a Hopfield network, in which the N visible units are the neurons and the P hidden units are the learned patterns. We apply the method of stochastic stability to derive the thermodynamics of the model, by considering a formal extension of this technique to the case of multiple sets of stored patterns, which may act as a benchmark for the study of correlated sets. Our results imply that simulating the dynamics of a Hopfield network, requiring the update of N neurons and the storage of N(N−1)/2 synapses, can be accomplished by a hybrid Boltzmann Machine, requiring the update of N+P neurons but the storage of only NP synapses. In addition, the well known glass transition of the Hopfield network has a counterpart in the Boltzmann Machine: it corresponds to an optimum criterion for selecting the relative sizes of the hidden and visible layers, resolving the trade-off between flexibility and generality of the model. The low storage phase of the Hopfield model corresponds to few hidden units and hence a overly constrained RBM, while the spin-glass phase (too many hidden units) corresponds to unconstrained RBM prone to overfitting of the observed data.}, author = {Barra A. and Bernacchia A. and Santucci E. and Contucci P.}, date-added = {2022-10-11 10:28:09 +0000}, date-modified = {2023-01-18 12:58:18 +0100}, doi = {https://doi.org/10.1016/j.neunet.2012.06.003}, issn = {0893-6080}, journal = {Neural Networks}, pages = {1-9}, title = {On the equivalence of Hopfield networks and Boltzmann Machines}, url = {https://www.sciencedirect.com/science/article/pii/S0893608012001608}, volume = {34}, year = {2012}, bdsk-url-1 = {https://www.sciencedirect.com/science/article/pii/S0893608012001608}, bdsk-url-2 = {https://doi.org/10.1016/j.neunet.2012.06.003}} @article{10.1162/neco_a_01210, abstract = {{A restricted Boltzmann machine (RBM) is an unsupervised machine learning bipartite graphical model that jointly learns a probability distribution over data and extracts their relevant statistical features. RBMs were recently proposed for characterizing the patterns of coevolution between amino acids in protein sequences and for designing new sequences. Here, we study how the nature of the features learned by RBM changes with its defining parameters, such as the dimensionality of the representations (size of the hidden layer) and the sparsity of the features. We show that for adequate values of these parameters, RBMs operate in a so-called compositional phase in which visible configurations sampled from the RBM are obtained by recombining these features. We then compare the performance of RBM with other standard representation learning algorithms, including principal or independent component analysis (PCA, ICA), autoencoders (AE), variational autoencoders (VAE), and their sparse variants. We show that RBMs, due to the stochastic mapping between data configurations and representations, better capture the underlying interactions in the system and are significantly more robust with respect to sample size than deterministic methods such as PCA or ICA. In addition, this stochastic mapping is not prescribed a priori as in VAE, but learned from data, which allows RBMs to show good performance even with shallow architectures. All numerical results are illustrated on synthetic lattice protein data that share similar statistical features with real protein sequences and for which ground-truth interactions are known.}}, author = {Tubiana, Jerome and Cocco, Simona and Monasson, Remi}, date-added = {2022-10-11 10:05:52 +0000}, date-modified = {2022-10-11 10:05:52 +0000}, doi = {10.1162/neco_a_01210}, eprint = {https://direct.mit.edu/neco/article-pdf/31/8/1671/1053381/neco\_a\_01210.pdf}, issn = {0899-7667}, journal = {Neural Computation}, month = {08}, number = {8}, pages = {1671-1717}, title = {{Learning Compositional Representations of Interacting Systems with Restricted Boltzmann Machines: Comparative Study of Lattice Proteins}}, url = {https://doi.org/10.1162/neco\_a\_01210}, volume = {31}, year = {2019}, bdsk-url-1 = {https://doi.org/10.1162/neco%5C_a%5C_01210}, bdsk-url-2 = {http://dx.doi.org/10.1162/neco_a_01210}} @article{chatterjee2022generalization, title={On the generalization mystery in deep learning}, author={Chatterjee, S. and Zielinski, P.}, journal={arXiv preprint arXiv:2203.10036}, year={2022} doi:[10.1145/1273496.1273596](https://doi.org/10.1145/1273496.1273596) arXiv:[2203.10036](https://arxiv.org/abs/2203.10036)
10. decelle2021restricted: title={Restricted Boltzmann machine: Recent advances and mean-field theory}, author={Decelle, A. and Furtlehner, C.}, journal={Chinese Physics B}, volume={30}, number={4}, pages={040202}, year={2021}, publisher={IOP Publishing}
11. MANZAN2025: title = {The effect of priors on Learning with Restricted Boltzmann Machines}, journal = {Physica A: Statistical Mechanics and its Applications}, volume = {674}, pages = {130766}, year = {2025}, issn = {0378-4371}, doi = {https://doi.org/10.1016/j.physa.2025.130766}, url = {https://www.sciencedirect.com/science/article/pii/S0378437125004182}, author = {G. Manzan and D. Tantari}, keywords = {Statistical mechanics, Machine learning, Self-supervised learning} doi:[10.1016/j.physa.2025.130766](https://doi.org/10.1016/j.physa.2025.130766) arXiv:[2025.13076](https://arxiv.org/abs/2025.13076)
12. Bonnaire2025: title={{On the role of non-linear latent features in bipartite generative neural networks}}, author={T. Bonnaire and G. Catania and A. Decelle and B. Seoane}, journal={SciPost Phys.}, volume={19}, pages={141}, year={2025}, publisher={SciPost}, doi={10.21468/SciPostPhys.19.6.141}, url={https://scipost.org/10.21468/SciPostPhys.19.6.141}, doi:[10.21468/SciPostPhys.19.6.141](https://doi.org/10.21468/SciPostPhys.19.6.141)
13. li2018learning: title={Learning overparameterized neural networks via stochastic gradient descent on structured data}, author={Li, Y. and Liang, Y.}, journal={Advances in neural information processing systems}, volume={31}, year={2018}
14. oymak2020toward: title={Toward moderate overparameterization: Global convergence guarantees for training shallow neural networks}, author={Oymak, S. and Soltanolkotabi, M.}, journal={IEEE Journal on Selected Areas in Information Theory}, volume={1}, number={1}, pages={84--105}, year={2020}, publisher={IEEE}
15. refinetti2023neural: title={Neural networks trained with SGD learn distributions of increasing complexity}, author={Refinetti, M. and Ingrosso, A. and Goldt, S.}, booktitle={International Conference on Machine Learning}, pages={28843--28863}, year={2023}, organization={PMLR}
16. allen2019convergence: title={A convergence theory for deep learning via over-parameterization}, author={Allen-Zhu, Z. and Li, Y. and Song, Z.}, booktitle={International conference on machine learning}, pages={242--252}, year={2019}, organization={PMLR}
17. arora2019fine: title={Fine-grained analysis of optimization and generalization for overparameterized two-layer neural networks}, author={Arora, S. and Du, S. and Hu, W. and Li, Z. and Wang, R.}, booktitle={International conference on machine learning}, pages={322--332}, year={2019}, organization={PMLR}
18. allen2019learning: title={Learning and generalization in overparameterized neural networks, going beyond two layers}, author={Allen-Zhu, Z. and Li, Y. and Liang, Y.}, journal={Advances in neural information processing systems}, volume={32}, year={2019}
19. decelle2024inferring: title = {Inferring Higher-Order Couplings with Neural Networks}, author = {Decelle, A. and Navas G\'omez, A. and Seoane, B.}, journal = {Phys. Rev. Lett.}, volume = {135}, issue = {20}, pages = {207301}, numpages = {7}, year = {2025}, month = {Nov}, publisher = {American Physical Society}, doi = {10.1103/lyny-6r9y}, url = {https://link.aps.org/doi/10.1103/lyny-6r9y} doi:[10.1103/lyny-6r9y](https://doi.org/10.1103/lyny-6r9y)
20. rende2024distributional: title={A distributional simplicity bias in the learning dynamics of transformers}, author={Rende, R. and Gerace, F. and Laio, A. and Goldt, S.}, journal={arXiv preprint arXiv:2410.19637}, year={2024} arXiv:[2410.19637](https://arxiv.org/abs/2410.19637)
21. PhysRevLett.118.138301: author = {Tubiana, J. and Monasson, R.}, date-added = {2022-10-11 10:03:34 +0000}, date-modified = {2022-10-11 10:03:34 +0000}, doi = {10.1103/PhysRevLett.118.138301}, issue = {13}, journal = {Phys. Rev. Lett.}, month = {Mar}, numpages = {5}, pages = {138301}, publisher = {American Physical Society}, title = {Emergence of Compositional Representations in Restricted Boltzmann Machines}, url = {https://link.aps.org/doi/10.1103/PhysRevLett.118.138301}, volume = {118}, year = {2017}, bdsk-url-1 = {https://link.aps.org/doi/10.1103/PhysRevLett.118.138301}, bdsk-url-2 = {http://dx.doi.org/10.1103/PhysRevLett.118.138301}} @article{ramachandran2017searching, title={Searching for activation functions}, author={Ramachandran, P. and Zoph, B. and Le, Q. V.}, journal={arXiv preprint arXiv:1710.05941}, year={2017} doi:[10.1103/PhysRevLett.118.138301](https://doi.org/10.1103/PhysRevLett.118.138301) arXiv:[1710.05941](https://arxiv.org/abs/1710.05941)
22. hendrycks2016gaussian: title={Gaussian error linear units (gelus)}, author={Hendrycks, D. and Gimpel, K.}, journal={arXiv preprint arXiv:1606.08415}, year={2016} arXiv:[1606.08415](https://arxiv.org/abs/1606.08415)
23. krizhevsky2012imagenet: title={Imagenet classification with deep convolutional neural networks}, author={Krizhevsky, A. and Sutskever, I. and Hinton, G. E.}, journal={Advances in neural information processing systems}, volume={25}, year={2012}
24. pmlr-v15-glorot11a: title = {Deep Sparse Rectifier Neural Networks}, author = {Glorot, X. and Bordes, A. and Bengio, Y.}, booktitle = {Proceedings of the Fourteenth International Conference on Artificial Intelligence and Statistics}, pages = {315--323}, year = {2011}, editor = {Gordon, Geoffrey and Dunson, David and Dudík, Miroslav}, volume = {15}, series = {Proceedings of Machine Learning Research}, address = {Fort Lauderdale, FL, USA}, month = {11--13 Apr}, publisher = {PMLR}, pdf = {http://proceedings.mlr.press/v15/glorot11a/glorot11a.pdf}, url = {https://proceedings.mlr.press/v15/glorot11a.html}
25. 10.5555/3104322.3104425: abstract = {Restricted Boltzmann machines were developed using binary stochastic hidden units. These can be generalized by replacing each binary unit by an infinite number of copies that all have the same weights but have progressively more negative biases. The learning and inference rules for these "Stepped Sigmoid Units" are unchanged. They can be approximated efficiently by noisy, rectified linear units. Compared with binary units, these units learn features that are better for object recognition on the NORB dataset and face verification on the Labeled Faces in the Wild dataset. Unlike binary units, rectified linear units preserve information about relative intensities as information travels through multiple layers of feature detectors.}, address = {Madison, WI, USA}, author = {Nair, V. and Hinton, G. E.}, booktitle = {Proceedings of the 27th International Conference on International Conference on Machine Learning}, date-added = {2022-10-11 09:59:53 +0000}, date-modified = {2022-10-11 09:59:53 +0000}, isbn = {9781605589077}, location = {Haifa, Israel}, numpages = {8}, pages = {807--814}, publisher = {Omnipress}, series = {ICML'10}, title = {Rectified Linear Units Improve Restricted Boltzmann Machines}, year = {2010}} @inproceedings{Maas13rectifiernonlinearities, author = {Andrew L. Maas and Awni Y. Hannun and Andrew Y. Ng}, booktitle = {in ICML Workshop on Deep Learning for Audio, Speech and Language Processing}, date-added = {2022-10-11 09:59:22 +0000}, date-modified = {2022-10-11 09:59:22 +0000}, title = {Rectifier nonlinearities improve neural network acoustic models}, year = {2013}} @article{10.1162/neco_a_01420, abstract = {{We study the type of distributions that restricted Boltzmann machines (RBMs) with different activation functions can express by investigating the effect of the activation function of the hidden nodes on the marginal distribution they impose on observed binary nodes. We report an exact expression for these marginals in the form of a model of interacting binary variables with the explicit form of the interactions depending on the hidden node activation function. We study the properties of these interactions in detail and evaluate how the accuracy with which the RBM approximates distributions over binary variables depends on the hidden node activation function and the number of hidden nodes. When the inferred RBM parameters are weak, an intuitive pattern is found for the expression of the interaction terms, which reduces substantially the differences across activation functions. We show that the weak parameter approximation is a good approximation for different RBMs trained on the MNIST data set. Interestingly, in these cases, the mapping reveals that the inferred models are essentially low order interaction models.}}, author = {Bulso, N. and Roudi, Y.}, date-added = {2022-10-11 09:53:05 +0000}, date-modified = {2022-10-11 09:53:05 +0000}, doi = {10.1162/neco_a_01420}, eprint = {https://direct.mit.edu/neco/article-pdf/33/10/2646/1963307/neco\_a\_01420.pdf}, issn = {0899-7667}, journal = {Neural Computation}, month = {09}, number = {10}, pages = {2646-2681}, title = {{Restricted Boltzmann Machines as Models of Interacting Variables}}, url = {https://doi.org/10.1162/neco\_a\_01420}, volume = {33}, year = {2021}, bdsk-url-1 = {https://doi.org/10.1162/neco%5C_a%5C_01420}, bdsk-url-2 = {http://dx.doi.org/10.1162/neco_a_01420}} @article{kunc2024three, title={Three decades of activations: A comprehensive survey of 400 activation functions for neural networks}, author={Kunc, V. and Kl{\'e}ma, J.}, journal={arXiv preprint arXiv:2402.09092}, year={2024} doi:[10.1162/neco_a_01420](https://doi.org/10.1162/neco_a_01420) arXiv:[2402.09092](https://arxiv.org/abs/2402.09092)
26. nishiyama2025solution: title={Solution space and storage capacity of fully connected two-layer neural networks with generic activation functions}, author={Nishiyama, S. and Ohzeki, M.}, journal={Journal of the Physical Society of Japan}, volume={94}, number={1}, pages={014802}, year={2025}, publisher={The Physical Society of Japan}
27. oostwal2021hidden: title={Hidden unit specialization in layered neural networks: ReLU vs. sigmoidal activation}, author={Oostwal, E. and Straat, M. and Biehl, M.}, journal={Physica A: Statistical Mechanics and its Applications}, volume={564}, pages={125517}, year={2021}, publisher={Elsevier}
28. citton2025phase: title={Phase transition analysis for shallow neural networks with arbitrary activation functions}, author={Citton, O. and Richert, F. and Biehl, M.}, journal={Physica A: Statistical Mechanics and its Applications}, volume={660}, pages={130356}, year={2025}, publisher={Elsevier}
29. diSarra_2025: author = {di Sarra, G. and Bravi, B. and Roudi, Y.}, title = {The unbearable lightness of restricted Boltzmann machines: Theoretical insights and biological applications}, doi = {10.1209/0295-5075/ada636}, url = {https://dx.doi.org/10.1209/0295-5075/ada636}, year = {2025}, month = {jan}, publisher = {EDP Sciences, IOP Publishing and Societa Italiana di Fisica}, volume = {149}, number = {2}, pages = {21002}, journal = {Europhysics Letters} doi:[10.1209/0295-5075/ada636](https://doi.org/10.1209/0295-5075/ada636)

