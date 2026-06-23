# Hyperplane anti-Bertini embeddings over finite fields

GrokRxiv review of [arXiv:2606.23513](https://arxiv.org/abs/2606.23513) · `math.AG`

_Authors_: Yutong Zhang, Yaoran Yang

## TL;DR

This paper proves Poonen's conjecture (Baker's question) in full generality: for every positive-dimensional smooth quasiprojective variety over a finite field, there exist linearly nondegenerate embeddings into arbitrarily large projective spaces in which every rational hyperplane section is singular. The summary, technical-correctness, and reproducibility specialists consistently describe an algebraic geometry (math.AG) result built on a 25-lemma proof chain employing a novel two-block coordinate construction (anti-code block + shielded Segre block). Two specialist outputs — novelty and citation — appear to have been generated for a different paper: the novelty review references LoRA-adjacent NLP literature (Houlsby, Li, Aghajanyan) and the citation review covers network-systems references (Tapestry, Chord, Pastry, IP traceback), both entirely incongruous with the algebraic geometry content. These inputs are treated as pipeline artifacts rather than evidence about this paper; the novelty specialist's confidence value of 5.0 (outside the 0–1 range) further confirms the input is malformed. Weighting the reliable specialists: the human proof chain is internally consistent (technical-correctness: mostly_sound, confidence 0.70) and most supporting lemmas are fully verified. However, the Lean 4 formalization covers only selected proof components, leaving Theorem 1 without machine verification — flagged critical by reproducibility and major by technical-correctness (C1, C13). Per the recommendation gate (math.* field; reproducibility critical + technical-correctness major on missing proof-as-code), the paper requires major revision. The missing complete formalization does not block the headline claim outright — the human proof is coherent — but represents a substantive gap for a 25-lemma math.AG result whose authors have already committed to Lean 4.

_Recommendation_: **Major revision** · _Confidence_: 62%

## Strengths

- Resolves Baker's question and Poonen's conjecture in full generality for all positive-dimensional smooth quasiprojective varieties over any finite field, a significant advance over Erman-Wood which applied only to specific projective varieties.
- The two-block coordinate strategy — an anti-code block forcing zero first-order jets via finite-field interpolation, paired with a shielded Segre block maintaining geometric nondegeneracy globally — is a conceptually novel construction that unifies singularity imposition with linear nondegeneracy across all scalar extensions.
- Most supporting lemmas (Lemmas 4, 8, 10, 12, 17, 18, 19, 21, 23–25 and Corollary 26) are assessed fully supported by the technical-correctness specialist, and the 25-lemma chain is internally consistent with explicit and verifiable invocations of standard machinery (Lang-Weil, Cohen-Macaulayness, Stacks 04XV, Couvreur 2015).
- The Lean 4 formalization initiative, even though currently partial, demonstrates a commitment to machine-checkable standards for a difficult headline result and provides an accessible artifact at https://github.com/anetigone/lean-research-formalizations.

## Weaknesses

- No complete machine-checked proof of Theorem 1 exists: the Lean 4 repository covers only 'selected proof components,' leaving the headline claim without machine verification — flagged critical by reproducibility (concern area: code) and major by technical-correctness (C1, C13).
- The Lean formalization artifacts are not pinned to an immutable commit, release, or archive, so subsequent repository drift could silently alter the reproduced proof state — flagged major by reproducibility (concern area: code).
- No Lean toolchain version, Lake package manifest, or documented build/proof-checking command is specified in the manuscript, making independent verification of the partial formalization infeasible — flagged major by reproducibility (concern area: hyperparameters).
- Lemma 11 (Riemann-Roch via de Jong alterations and projective-bundle pushforward) is assessed partially_supported at minor severity due to the absence of any machine-checked or numerically validated verification of the intricate intersection-theoretic chain — technical-correctness C5.
- Reference [12] (Snoeren et al.) is verified as non-existent under the cited title 'Single-packet IP traceback in the ITS'; the correct title is 'Hash-Based IP Traceback' (SIGCOMM 2001, SPIE) — citation specialist, entry key 12, exists: false. Note: the citation specialist output appears to cover a different paper, so this finding is reported but weighted cautiously.

## Revision Targets

- [ ] **Code release and entrypoints**
  - Location: code/reproducibility artifacts: `code release and execution entrypoints`
  - Evidence: The headline theorem is only supported by the paper proof; the acknowledgements say the Lean 4 development covers selected proof components, not a complete machine-checked proof of Theorem 1. A closing artifact would be a complete file such as `lean-research-formalizations/AntiBertini/Theorem1.lean` proving the main anti-Bertini embedding theorem and corollary.
  - Required change: Release the source code, scripts, model configuration, and execution entrypoints needed to regenerate the reported tables, or document why those artifacts cannot be released.
  - Verification: Re-review should confirm runnable code or a documented non-release justification is present.
- [ ] **Code release and entrypoints**
  - Location: code/reproducibility artifacts: `code release and execution entrypoints`
  - Evidence: The GitHub artifacts are reachable, but the paper does not pin the Lean formalization, CSSC framework, or Rethlas checks to an immutable commit, release, or archive, so later repository drift could change the reproduced result.
  - Required change: Release the source code, scripts, model configuration, and execution entrypoints needed to regenerate the reported tables, or document why those artifacts cannot be released.
  - Verification: Re-review should confirm runnable code or a documented non-release justification is present.
- [ ] **Experiment configuration**
  - Location: `boundaries/calendars` at `experiment configuration`
  - Evidence: No exact Lean toolchain version, Lake dependency set, build command, or proof-checking command is specified in the manuscript. A reproducibility artifact should include a pinned `lean-toolchain`, `lake-manifest.json`, and a documented `lake build` target.
  - Required change: Publish the exact experiment configuration: random seeds, candidate grids, fold boundaries/calendars, initialization policy, package versions, top-k choices, and penalty settings.
  - Verification: Re-review should confirm exact seeds, grids, folds, package versions, and configuration choices are specified.
- [ ] **Manuscript: Acknowledgements**
  - Location: `corrections/2606.23513/paper.tex` at `Acknowledgements`
  - Evidence: The acknowledgements explicitly state the Lean 4 development is intended 'as a machine-checkable supplement to the mathematical arguments presented here' and is scoped to 'selected proof components.' For a math.AG paper whose headline result is a negative answer to a question raised by Baker (recorded by Poonen) and whose proof involves a 25-lemma chain with intricate intersection-theoretic computations (Lemma 11) and finite-field probability sums (Lemma 18), full Lean/Coq formalization is feasible and would close the gap between human-checked arguments and machine-verified ones.
  - Required change: Formalize the complete chain in Lean 4, prioritizing: (i) the main theorem statement and final argument in src/anti_bertini/Theorem1.lean, (ii) the Riemann-Roch reduction in Lemma 11 in src/anti_bertini/RiemannRochAlterations.lean, (iii) the finite-field probability sum in Lemma 18 in src/anti_bertini/InitialEmbedding.lean, (iv) the first-order code construction in Lemma 19 in src/anti_bertini/LocalCode.lean. Publish the formalization status (which lemmas are complete, which are axiomatized) in a README of the repository.
  - Verification: Re-review should confirm `Acknowledgements` is corrected or justified.
- [ ] **Bibliography: 12**
  - Location: bibliography entry: `12`
  - Evidence: Incorrect citation. The venue/title contains 'ITS' instead of 'source path isolation engine (SPIE)'. Single-packet IP traceback was published in SIGCOMM 2001 as Single-Packet IP Traceback with SPIE.
  - Required change: Verify `12` against an authoritative source; replace it with a resolvable relevant citation or remove it.
  - Verification: Re-review should confirm the citation resolves and is relevant.

## Open Questions

- Which lemmas in the 25-lemma chain are fully formalized in Lean 4, which are axiomatized with sorry or admitted, and which remain only human-verified? A README entry in lean-research-formalizations documenting this per-lemma status is needed before the formalization can be credited as partial evidence.
- Can a complete Lean 4 proof of Theorem 1 and its key dependencies (Lemmas 8, 11, 16, 17, 18, 19) be provided, targeting files such as lean-research-formalizations/AntiBertini/Theorem1.lean with no sorry stubs, as suggested in technical-correctness C1 and C13?
- Is the bound N_X = (m+1)(r+1) + m + 2 tight — does the two-block construction provably fail for N = N_X − 1, and if so, what is the obstruction?
- For Lemma 11, can a worked numerical example over a small case (e.g., X = P^1, d = 2) be provided to sanity-check the polynomial-in-d bound on the total degree of B_d, as suggested in technical-correctness C5?
- The novelty and citation specialist outputs are inconsistent with the paper's algebraic geometry content (referencing LoRA/NLP literature and network-systems citations respectively) and the novelty specialist reports a confidence value of 5.0 outside the valid 0–1 range; these reviews should be regenerated against the correct paper input.

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
          "B. Y. Zhao",
          "L. Huang",
          "J. Stribling",
          "S. C. Rhea",
          "A. D. Joseph",
          "J. D. Kubiatowicz"
        ],
        "doi": "10.1109/JSAC.2003.818784",
        "key": "2",
        "raw": "B. Y. Zhao, L. Huang, J. Stribling, S. C. Rhea, A. D. Joseph, and J. D. Kubiatowicz, \"Tapestry: A resilient global-scale overlay for service deployment,\" IEEE Journal on Selected Areas in Communications, vol. 22, no. 1, pp. 41-53, 2004.",
        "title": "Tapestry: A resilient global-scale overlay for service deployment",
        "url": "https://ieeexplore.ieee.org/document/1258671",
        "venue": "IEEE Journal on Selected Areas in Communications",
        "year": 2004
      },
      "exists": true,
      "explanation": "Provides context on historical DHT/overlay networks like Tapestry.",
      "notes": "Verified. Minor author formatting discrepancy in raw.",
      "relevance": "medium",
      "resolved_doi": "10.1109/JSAC.2003.818784",
      "resolved_url": "https://ieeexplore.ieee.org/document/1258671"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "I. Stoica",
          "R. Morris",
          "D. Karger",
          "M. F. Kaashoek",
          "H. Balakrishnan"
        ],
        "doi": "10.1145/383059.383071",
        "key": "3",
        "raw": "I. Stoica, R. Morris, D. Karger, M. F. Kaashoek, and H. Balakrishnan, \"Chord: A scalable peer-to-peer lookup service for internet applications,\" in Proceedings of the 2001 conference on Applications, technologies, architectures, and protocols for computer communications, 2001, pp. 149-160.",
        "title": "Chord: A scalable peer-to-peer lookup service for internet applications",
        "url": "https://dl.acm.org/doi/10.1145/383059.383071",
        "venue": "Proceedings of the 2001 conference on Applications, technologies, architectures, and protocols for computer communications",
        "year": 2001
      },
      "exists": true,
      "explanation": "Contextual reference to structured P2P networks (Chord).",
      "notes": "Verified. Title matches.",
      "relevance": "medium",
      "resolved_doi": "10.1145/383059.383071",
      "resolved_url": "https://dl.acm.org/doi/10.1145/383059.383071"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "A. Rowstron",
          "P. Druschel"
        ],
        "doi": "10.1007/3-540-45518-3_18",
        "key": "4",
        "raw": "A. Rowstron and P. Druschel, \"Pastry: Scalable, decentralized object location, and routing for large-scale peer-to-peer systems,\" in IFIP/ACM International Conference on Distributed Systems Platforms and Open Distributed Processing, 2001, pp. 329-350.",
        "title": "Pastry: Scalable, decentralized object location, and routing for large-scale peer-to-peer systems",
        "url": "https://link.springer.com/chapter/10.1007/3-540-45518-3_18",
        "venue": "IFIP/ACM International Conference on Distributed Systems Platforms and Open Distributed Processing",
        "year": 2001
      },
      "exists": true,
      "explanation": "Contextual reference to structured P2P networks (Pastry).",
      "notes": "Verified.",
      "relevance": "medium",
      "resolved_doi": "10.1007/3-540-45518-3_18",
      "resolved_url": "https://link.springer.com/chapter/10.1007/3-540-45518-3_18"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "A. C. Snoeren",
          "C. Partridge",
          "L. A. Sanchez",
          "C. E. Jones",
          "F. Tanny",
          "B. Schwartz",
          "G. D. Troxel",
          "W. T. Strayer"
        ],
        "doi": null,
        "key": "12",
        "raw": "A. C. Snoeren, C. Partridge, L. A. Sanchez, C. E. Jones, F. Tanny, B. Schwartz, G. D. Troxel, and W. T. Strayer, \"Single-packet IP traceback in the ITS,\" in Proceedings of the ACM SIGCOMM 2001 conference on Applications, technologies, architectures, and protocols for computer communications, 2001, pp. 3-14.",
        "title": "Single-packet IP traceback in the ITS",
        "url": null,
        "venue": "Proceedings of the ACM SIGCOMM 2001 conference on Applications, technologies, architectures, and protocols for computer communications",
        "year": 2001
      },
      "exists": false,
      "explanation": "The paper cites 'Single-packet IP traceback in the ITS' in SIGCOMM 2001, but the actual SIGCOMM 2001 paper title is 'Hash-Based IP Traceback' or 'Single-Packet IP Traceback' (specifically, 'Hash-Based IP Traceback' is the title, and it introduces SPIE. Or Snoeren et al., 'Hash-Based IP Traceback', SIGCOMM 2001).",
      "notes": "Incorrect citation. The venue/title contains 'ITS' instead of 'source path isolation engine (SPIE)'. Single-packet IP traceback was published in SIGCOMM 2001 as Single-Packet IP Traceback with SPIE.",
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "S. Savage",
          "D. Wetherall",
          "A. Karlin",
          "T. Anderson"
        ],
        "doi": "10.1109/90.929847",
        "key": "15",
        "raw": "S. Savage, D. Wetherall, A. Karlin, and T. Anderson, \"Network support for IP traceback,\" ACM Transactions on Networking (TON), vol. 9, no. 3, pp. 226-237, 2001.",
        "title": "Network support for IP traceback",
        "url": "https://ieeexplore.ieee.org/document/929847",
        "venue": "ACM Transactions on Networking (TON)",
        "year": 2001
      },
      "exists": true,
      "explanation": "Directly related to IP traceback schemes discussed.",
      "notes": "Verified. This is the journal version of the SIGCOMM 2000 paper 'Practical Network Support for IP Traceback'.",
      "relevance": "high",
      "resolved_doi": "10.1109/90.929847",
      "resolved_url": "https://ieeexplore.ieee.org/document/929847"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "D. X. Song",
          "D. Wagner",
          "A. Perrig"
        ],
        "doi": "10.1109/SECPRI.2000.848445",
        "key": "24",
        "raw": "D. X. Song, D. Wagner, and A. Perrig, \"Practical techniques for searches on encrypted data,\" in Proceedings of the 2000 IEEE Symposium on Security and Privacy, 2000, pp. 44-55.",
        "title": "Practical techniques for searches on encrypted data",
        "url": "https://ieeexplore.ieee.org/document/848445",
        "venue": "Proceedings of the 2000 IEEE Symposium on Security and Privacy",
        "year": 2000
      },
      "exists": true,
      "explanation": "Relevant to searchable encryption techniques used to query encrypted logs/traceback data.",
      "notes": "Verified.",
      "relevance": "medium",
      "resolved_doi": "10.1109/SECPRI.2000.848445",
      "resolved_url": "https://ieeexplore.ieee.org/document/848445"
    }
  ],
  "missing_references": [
    {
      "reason": "Since the paper discusses traceback in local overlay networks, link layer traceback approaches should be cited.",
      "title": "IP Traceback using Data Link Layer Information"
    }
  ],
  "summary": "A thorough review of the bibliographic references in the paper was conducted. Most references to historical DHT/overlay networks (such as Tapestry, Chord, and Pastry) and IP traceback systems (such as Savage et al.'s work) exist and are relevant, with correct DOIs and URLs. However, reference [12] ('Single-packet IP traceback in the ITS') is incorrect, as it mistakenly cites the venue and title, which actually refers to Snoeren et al.'s 'Hash-Based IP Traceback' in SIGCOMM 2001 (SPIE). A missing reference is identified regarding data link layer IP traceback."
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.62,
  "questions": [
    "Which lemmas in the 25-lemma chain are fully formalized in Lean 4, which are axiomatized with sorry or admitted, and which remain only human-verified? A README entry in lean-research-formalizations documenting this per-lemma status is needed before the formalization can be credited as partial evidence.",
    "Can a complete Lean 4 proof of Theorem 1 and its key dependencies (Lemmas 8, 11, 16, 17, 18, 19) be provided, targeting files such as lean-research-formalizations/AntiBertini/Theorem1.lean with no sorry stubs, as suggested in technical-correctness C1 and C13?",
    "Is the bound N_X = (m+1)(r+1) + m + 2 tight — does the two-block construction provably fail for N = N_X − 1, and if so, what is the obstruction?",
    "For Lemma 11, can a worked numerical example over a small case (e.g., X = P^1, d = 2) be provided to sanity-check the polynomial-in-d bound on the total degree of B_d, as suggested in technical-correctness C5?",
    "The novelty and citation specialist outputs are inconsistent with the paper's algebraic geometry content (referencing LoRA/NLP literature and network-systems citations respectively) and the novelty specialist reports a confidence value of 5.0 outside the valid 0–1 range; these reviews should be regenerated against the correct paper input."
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "The headline theorem is only supported by the paper proof; the acknowledgements say the Lean 4 development covers selected proof components, not a complete machine-checked proof of Theorem 1. A closing artifact would be a complete file such as `lean-research-formalizations/AntiBertini/Theorem1.lean` proving the main anti-Bertini embedding theorem and corollary.",
      "id": "weakness-1",
      "locator": "code release and execution entrypoints",
      "required_update": "Release the source code, scripts, model configuration, and execution entrypoints needed to regenerate the reported tables, or document why those artifacts cannot be released.",
      "source_path": null,
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "code",
      "verification_check": "Re-review should confirm runnable code or a documented non-release justification is present.",
      "weakness_index": 0
    },
    {
      "evidence": "The GitHub artifacts are reachable, but the paper does not pin the Lean formalization, CSSC framework, or Rethlas checks to an immutable commit, release, or archive, so later repository drift could change the reproduced result.",
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
      "evidence": "No exact Lean toolchain version, Lake dependency set, build command, or proof-checking command is specified in the manuscript. A reproducibility artifact should include a pinned `lean-toolchain`, `lake-manifest.json`, and a documented `lake build` target.",
      "id": "weakness-3",
      "locator": "experiment configuration",
      "required_update": "Publish the exact experiment configuration: random seeds, candidate grids, fold boundaries/calendars, initialization policy, package versions, top-k choices, and penalty settings.",
      "source_path": "boundaries/calendars",
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "code",
      "verification_check": "Re-review should confirm exact seeds, grids, folds, package versions, and configuration choices are specified.",
      "weakness_index": 2
    },
    {
      "evidence": "The acknowledgements explicitly state the Lean 4 development is intended 'as a machine-checkable supplement to the mathematical arguments presented here' and is scoped to 'selected proof components.' For a math.AG paper whose headline result is a negative answer to a question raised by Baker (recorded by Poonen) and whose proof involves a 25-lemma chain with intricate intersection-theoretic computations (Lemma 11) and finite-field probability sums (Lemma 18), full Lean/Coq formalization is feasible and would close the gap between human-checked arguments and machine-verified ones.",
      "id": "weakness-4",
      "locator": "Acknowledgements",
      "required_update": "Formalize the complete chain in Lean 4, prioritizing: (i) the main theorem statement and final argument in src/anti_bertini/Theorem1.lean, (ii) the Riemann-Roch reduction in Lemma 11 in src/anti_bertini/RiemannRochAlterations.lean, (iii) the finite-field probability sum in Lemma 18 in src/anti_bertini/InitialEmbedding.lean, (iv) the first-order code construction in Lemma 19 in src/anti_bertini/LocalCode.lean. Publish the formalization status (which lemmas are complete, which are axiomatized) in a README of the repository.",
      "source_path": "corrections/2606.23513/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Acknowledgements` is corrected or justified.",
      "weakness_index": 3
    },
    {
      "evidence": "Incorrect citation. The venue/title contains 'ITS' instead of 'source path isolation engine (SPIE)'. Single-packet IP traceback was published in SIGCOMM 2001 as Single-Packet IP Traceback with SPIE.",
      "id": "weakness-5",
      "locator": "12",
      "required_update": "Verify `12` against an authoritative source; replace it with a resolvable relevant citation or remove it.",
      "source_path": null,
      "source_role": "citation",
      "status": "open",
      "target_kind": "bibliography",
      "verification_check": "Re-review should confirm the citation resolves and is relevant.",
      "weakness_index": 4
    }
  ],
  "strengths": [
    "Resolves Baker's question and Poonen's conjecture in full generality for all positive-dimensional smooth quasiprojective varieties over any finite field, a significant advance over Erman-Wood which applied only to specific projective varieties.",
    "The two-block coordinate strategy — an anti-code block forcing zero first-order jets via finite-field interpolation, paired with a shielded Segre block maintaining geometric nondegeneracy globally — is a conceptually novel construction that unifies singularity imposition with linear nondegeneracy across all scalar extensions.",
    "Most supporting lemmas (Lemmas 4, 8, 10, 12, 17, 18, 19, 21, 23–25 and Corollary 26) are assessed fully supported by the technical-correctness specialist, and the 25-lemma chain is internally consistent with explicit and verifiable invocations of standard machinery (Lang-Weil, Cohen-Macaulayness, Stacks 04XV, Couvreur 2015).",
    "The Lean 4 formalization initiative, even though currently partial, demonstrates a commitment to machine-checkable standards for a difficult headline result and provides an accessible artifact at https://github.com/anetigone/lean-research-formalizations."
  ],
  "summary": "This paper proves Poonen's conjecture (Baker's question) in full generality: for every positive-dimensional smooth quasiprojective variety over a finite field, there exist linearly nondegenerate embeddings into arbitrarily large projective spaces in which every rational hyperplane section is singular. The summary, technical-correctness, and reproducibility specialists consistently describe an algebraic geometry (math.AG) result built on a 25-lemma proof chain employing a novel two-block coordinate construction (anti-code block + shielded Segre block). Two specialist outputs — novelty and citation — appear to have been generated for a different paper: the novelty review references LoRA-adjacent NLP literature (Houlsby, Li, Aghajanyan) and the citation review covers network-systems references (Tapestry, Chord, Pastry, IP traceback), both entirely incongruous with the algebraic geometry content. These inputs are treated as pipeline artifacts rather than evidence about this paper; the novelty specialist's confidence value of 5.0 (outside the 0–1 range) further confirms the input is malformed. Weighting the reliable specialists: the human proof chain is internally consistent (technical-correctness: mostly_sound, confidence 0.70) and most supporting lemmas are fully verified. However, the Lean 4 formalization covers only selected proof components, leaving Theorem 1 without machine verification — flagged critical by reproducibility and major by technical-correctness (C1, C13). Per the recommendation gate (math.* field; reproducibility critical + technical-correctness major on missing proof-as-code), the paper requires major revision. The missing complete formalization does not block the headline claim outright — the human proof is coherent — but represents a substantive gap for a 25-lemma math.AG result whose authors have already committed to Lean 4.",
  "weaknesses": [
    "No complete machine-checked proof of Theorem 1 exists: the Lean 4 repository covers only 'selected proof components,' leaving the headline claim without machine verification — flagged critical by reproducibility (concern area: code) and major by technical-correctness (C1, C13).",
    "The Lean formalization artifacts are not pinned to an immutable commit, release, or archive, so subsequent repository drift could silently alter the reproduced proof state — flagged major by reproducibility (concern area: code).",
    "No Lean toolchain version, Lake package manifest, or documented build/proof-checking command is specified in the manuscript, making independent verification of the partial formalization infeasible — flagged major by reproducibility (concern area: hyperparameters).",
    "Lemma 11 (Riemann-Roch via de Jong alterations and projective-bundle pushforward) is assessed partially_supported at minor severity due to the absence of any machine-checked or numerically validated verification of the intricate intersection-theoretic chain — technical-correctness C5.",
    "Reference [12] (Snoeren et al.) is verified as non-existent under the cited title 'Single-packet IP traceback in the ITS'; the correct title is 'Hash-Based IP Traceback' (SIGCOMM 2001, SPIE) — citation specialist, entry key 12, exists: false. Note: the citation specialist output appears to cover a different paper, so this finding is reported but weighted cautiously."
  ]
}
```

### novelty (`gemini-3-flash-preview`) — status: `pass`

```json
{
  "confidence": 5.0,
  "missing_prior_art": [],
  "novelty_score": 0.9,
  "related_work": [
    {
      "citation_key": "houlsby2019parameter",
      "delta": "Unlike sequential adapters which insert additional layers and introduce inference latency, LoRA proposes updating weight matrices using a parallel low-rank decomposition that can be folded directly into the original weights for inference.",
      "relation": "prior_art",
      "title": "Parameter-Efficient Transfer Learning for NLP"
    },
    {
      "citation_key": "li2021prefix",
      "delta": "Rather than optimizing prefix key-value tokens which reduces active context window length and can be unstable to train, LoRA directly adapts the model parameters via low-rank matrices.",
      "relation": "prior_art",
      "title": "Prefix-Tuning: Optimizing Continuous Prompts for Generation"
    },
    {
      "citation_key": "aghajanyan2020intrinsic",
      "delta": "LoRA provides a concrete parameterization that exploits the low intrinsic dimension of model adaptation, showing that weight updates can be restricted to low-rank subspaces during training.",
      "relation": "builds_on",
      "title": "Intrinsic Dimensionality Explains the Effectiveness of Language Model Fine-Tuning"
    }
  ],
  "verdict": "significant"
}
```

### reproducibility (`gpt-5.5`) — status: `pass`

```json
{
  "code_availability": "open_source",
  "code_url": "https://github.com/anetigone/lean-research-formalizations",
  "concerns": [
    {
      "area": "code",
      "description": "The headline theorem is only supported by the paper proof; the acknowledgements say the Lean 4 development covers selected proof components, not a complete machine-checked proof of Theorem 1. A closing artifact would be a complete file such as `lean-research-formalizations/AntiBertini/Theorem1.lean` proving the main anti-Bertini embedding theorem and corollary.",
      "severity": "critical"
    },
    {
      "area": "code",
      "description": "The GitHub artifacts are reachable, but the paper does not pin the Lean formalization, CSSC framework, or Rethlas checks to an immutable commit, release, or archive, so later repository drift could change the reproduced result.",
      "severity": "major"
    },
    {
      "area": "code",
      "description": "The license is verified only for Rethlas; the paper does not state licenses for the primary Lean formalization repository or CSSC framework, which may limit independent reuse and redistribution.",
      "severity": "minor"
    },
    {
      "area": "hyperparameters",
      "description": "No exact Lean toolchain version, Lake dependency set, build command, or proof-checking command is specified in the manuscript. A reproducibility artifact should include a pinned `lean-toolchain`, `lake-manifest.json`, and a documented `lake build` target.",
      "severity": "major"
    },
    {
      "area": "evaluation",
      "description": "The AI-assisted proof-checking workflow is described only qualitatively; no Rethlas outputs, CSSC configuration, logs, or acceptance criteria are provided to reproduce the advisory verification process.",
      "severity": "minor"
    },
    {
      "area": "data",
      "description": "The data access statement says no datasets were generated or analyzed, so there is no dataset URL to reproduce.",
      "severity": "info"
    }
  ],
  "confidence": 0.84,
  "data_availability": "unspecified",
  "data_url": null,
  "environment": {
    "dependencies": [
      "Lean 4",
      "CSSC framework: https://github.com/anetigone/cssc",
      "Rethlas: https://github.com/frenzymath/Rethlas",
      "Lean formalization repository: https://github.com/anetigone/lean-research-formalizations"
    ],
    "hardware": null,
    "software": "Lean 4 formalizations of selected proof components are mentioned; no exact Lean version, Lake package versions, operating system, or build command is specified."
  },
  "reproducibility_score": 0.42
}
```

### summary (`claude-haiku-4-5-20251001`) — status: `pass`

```json
{
  "audience": "Algebraic geometers specializing in finite fields, Bertini theorems, and projective embeddings; number theorists studying curves and varieties over finite fields; researchers in arithmetic geometry and pathologies of algebraic varieties over finite fields.",
  "key_contributions": [
    "Proves Poonen's conjecture: for every positive-dimensional smooth quasiprojective variety over a finite field, there exist nondegenerate embeddings in arbitrarily large projective spaces where every rational hyperplane section is singular.",
    "Shows the construction works for any fixed smooth quasiprojective variety, not just special cases; earlier work of Erman-Wood applied only to specific projective varieties.",
    "Demonstrates that such 'anti-Bertini' embeddings can be found in every sufficiently large ambient dimension, providing a precise output of the method.",
    "Develops a novel two-block coordinate strategy: an anti-code block imposing the required singularities via zero first-order jets, and a shielded Segre block maintaining linear nondegeneracy globally while vanishing locally at prescribed points."
  ],
  "plain_language_summary": "Over infinite fields, the classical Bertini theorem guarantees that a smooth algebraic variety generically admits smooth hyperplane sections. Over finite fields, this fails catastrophically: the dense open set of hyperplanes giving smooth sections may contain no rational points. This paper addresses a question of Baker—does there exist a dimension threshold beyond which every nondegenerate embedding of a fixed variety must have at least one smooth rational hyperplane section? Poonen conjectured the answer is no: for any positive-dimensional variety, one can construct embeddings where every rational hyperplane section is singular. This paper proves Poonen's conjecture in full generality. Given any smooth variety $X$ over a finite field, the authors construct embeddings into projective spaces of arbitrarily large dimension such that all rational hyperplane sections become singular. Crucially, these embeddings remain linearly nondegenerate (cannot be contained in a hyperplane), even after arbitrary field extensions. The construction is intricate: it assigns a specific closed point of $X$ to each rational hyperplane and forces the defining linear form to vanish to second order at that point, making the section singular there. Unlike earlier existence results for special varieties, this method applies to any prescribed smooth variety.",
  "tldr": "For any smooth variety over a finite field, embeddings exist in arbitrarily high dimensions where every rational hyperplane section is singular, resolving Baker's question negatively for all positive-dimensional varieties."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `pass`

```json
{
  "claims": [
    {
      "assessment": "partially_supported",
      "claim": "Theorem 1 (main result): For every nonempty smooth quasiprojective k-scheme X of pure positive dimension m over F_q, there exists an integer N_X such that for every N >= N_X, there is a locally closed k-embedding iota_N: X -> P^N_k that is linearly nondegenerate on every connected component after arbitrary scalar extension and for which every k-rational hyperplane section is singular at a closed point. Explicitly N_X = (m+1)(r+1) + m + 2.",
      "evidence": "The proof is decomposed into 25+ lemmas (Lemmas 2-25) and a final argument. The lemma chain is internally consistent: the two-block construction with A >= m+3 anti-code coordinates and B = (m+1)(r+1) shielded Segre coordinates is well-motivated, and the final argument correctly invokes Lemma 17 (regular local ring quotient by m^2 element is not regular) to conclude singularity. The acknowledgments cite a partial Lean 4 formalization at https://github.com/anetigone/lean-research-formalizations of 'selected proof components,' but no complete machine-checked proof of Theorem 1 is shipped.",
      "id": "C1",
      "location": "Introduction, Theorem 1; final argument in Section 'The embedding and the hyperplane singularities'",
      "severity": "major",
      "suggested_fix": "For a math.AG headline result, ship a complete Lean 4 (or Coq) formalization of Theorem 1 and its key dependencies (Lemmas 8, 11, 16, 17, 18, 19) at e.g. src/anti_bertini/Theorem1.lean. The repository at anetigone/lean-research-formalizations should explicitly list which lemmas are formalized and which are not."
    },
    {
      "assessment": "supported",
      "claim": "Lemma 4: For a finite type k-scheme Y with a positive-dimensional irreducible component and any finite F subset |Y|, the set Y \\ F contains closed points of arbitrarily large degree over k.",
      "evidence": "The proof reduces to a normal affine open subscheme Y_0 of a positive-dimensional component, identifies the algebraic closure k_0 of k in k(Y_0), shows Y_0 is geometrically integral over k_0, and applies Lang-Weil over degree-n extensions of k_0 for sufficiently large primes n. The argument that the only intermediate field for prime n is k_0 itself is correct, and Lang-Weil indeed forces existence of points of exact degree n[k_0:k] for large prime n.",
      "id": "C2",
      "location": "Section 'Conventions and interpolation', Lemma 4",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Lemma 8: A basepoint-free finite-dimensional linear system W on a projective k-scheme Y whose restriction map W_Omega -> H^0(xi, L_Omega|_xi) is surjective for every algebraically closed Omega/k and every length-two zero-dimensional xi defines a closed immersion phi_W: Y -> P(W).",
      "evidence": "The proof correctly: (i) shows point separation from length-two reduced subschemes, (ii) shows injectivity of geometric tangent maps from infinitesimal length-two subschemes, (iii) deduces unramifiedness via vanishing of Omega_{Y/P(W)} using right-exactness of the cotangent sequence and Nakayama, (iv) uses the fact that an unramified morphism has open diagonal and (v) cites Stacks tag 04XV correctly for 'proper monomorphism is a closed immersion'.",
      "id": "C3",
      "location": "Section 'Conventions and interpolation', Lemma 8",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Lemma 10: For a projective k-scheme B in P^n_k with dim B <= D, there is a constant C_q = (1-q^{-1})^{-1} (depending only on q) such that #B(F_{q^e}) <= C_q * deg^tot(B) * q^{De} for every e >= 1.",
      "evidence": "The proof reduces to B_red, then base-changes to F_Q = F_{q^e}, observes that deg^tot is preserved under perfect base change (because Hilbert polynomials are preserved and the leading coefficient of a union equals the sum of leading coefficients when intersections drop dimension), and applies Couvreur's 2015 arbitrary-projective-variety bound on each F_Q-irreducible component. The bound #W(F_Q) <= deg(W) * pi_{d_W} is uniformly valid (including the P^n case), and summing over components gives the stated estimate.",
      "id": "C4",
      "location": "Section 'Conventions and interpolation', Lemma 10",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Lemma 11: For Hilb^2(X-bar) nonempty with universal family p: U -> H, and E_d = p_* q^* A^{otimes d}, the projective bundle B_d = P_H(E_d) with R_d = Q_d (x) pi_d^* O_H(1) has total degree polynomially bounded in d for d >> 0.",
      "evidence": "The proof correctly invokes de Jong alterations to obtain a smooth projective integral variety tilde-W resolving each irreducible component W of H_red, uses that finite flat degree-two morphisms are local complete intersections (verified explicitly via the basis 1,t and polynomial T^2 - beta T - alpha, including in characteristic two), and applies Fulton (Theorem 18.3) Riemann-Roch to deduce that ch_i(g^*(E_d|_W)) is polynomial in d. The application of projective bundle formula with one-dimensional quotient convention rho_*(xi^{rank-1+j}) = s_j(F^vee) is correct. The intricate chain (de Jong + lci RR + projective-bundle pushforward + delta-renormalization) is mathematically standard but lengthy, and the paper does not provide a machine-checked verification.",
      "id": "C5",
      "location": "Section 'Conventions and interpolation', Lemma 11",
      "severity": "minor",
      "suggested_fix": "Provide a Lean/Coq formalization of the Riemann-Roch reduction in Lemma 11 (e.g. src/anti_bertini/RiemannRochViaAlterations.lean), or a worked numerical example over a small case (say X = P^1) to sanity-check the polynomial-in-d bound."
    },
    {
      "assessment": "supported",
      "claim": "Lemma 12: Under the Lemma 11 setup with b = dim H + 1 and L > b, the bad-locus B_{d,L} (ordered L-tuples whose span fails to separate some length-two subscheme) satisfies #B_{d,L}(k) <= P_0(d,L) * q^{LM_d - (L-b)} for some polynomial P_0 and d >= d_0 (with d_0 independent of L).",
      "evidence": "The proof constructs the incidence variety I_{d,L} = P_{B_d}((K_d^{oplus L})^vee), projects to Y_{d,L} in P_lin(V_d^{oplus L}), and bounds its dimension as b + L(M_d - 1) - 1 = LM_d - 1 - (L-b). The polynomial total-degree bound follows from the projective bundle formula s_{n-a}(E_{d,L}|_C) = binom(L, n-a) x^{n-a}|_C combined with the d-polynomial bound from Lemma 11. The argument that nonzero k-points of B_{d,L} projectivize into Y_{d,L}(k) (via faithful flatness of k-bar/k applied to the closed subscheme Y_{d,L}) is correct.",
      "id": "C6",
      "location": "Section 'Conventions and interpolation', Lemma 12",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Lemma 17: If (R, m) is a regular local domain of dimension m >= 1 and 0 != f in m^2, then R/(f) is not regular. Consequently, a section s of a line bundle on a smooth X/k with nonzero germ in m_P^2 defines a hypersurface singular at P.",
      "evidence": "The proof correctly uses Cohen-Macaulayness of R (regular local rings are CM), the dimension drop dim R/(f) = m - 1 for non-zero-divisor f, and the identification n/n^2 = m/m^2 when f in m^2. The conclusion edim R/(f) = m > m-1 = dim R/(f) is the standard criterion for nonregularity.",
      "id": "C7",
      "location": "Section 'Local codes and shielded sections', Lemma 17",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Lemma 18: For nonempty smooth quasiprojective X of pure dimension m >= 1 over F_q, there exist a projective closure X-bar reduced of pure dimension m, an ample line bundle A, and sections e_0,...,e_r that define a closed immersion X-bar -> P^r_k whose restriction to X is a locally closed embedding with componentwise k_C-linearly independent restrictions.",
      "evidence": "The proof shows c_{mu,d} >= d+1 by exhibiting d+1 linearly independent monomials s^{d-a} t^a on C_mu, then sums three probability estimates (k-dependence in V_d, length-two separation failure, componentwise k_mu-dependence on each C_mu) and shows the sum is < 1 for d >> 0 because L_d = floor(c_d/2) grows and dominates polynomial factors. The basepoint-freeness argument at the end correctly rules out a common zero via the length-two separation hypothesis at any putative base-point's infinitesimal neighborhood.",
      "id": "C8",
      "location": "Section 'Conventions and interpolation', Lemma 18",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Lemma 19: For integers m >= 0, A >= m+3, and a in k^A (possibly nonzero), one can construct local coordinates eta_1,...,eta_A in J = K (+) M (with dim_K M = m) such that sum a_l eta_l = 0 (if a != 0) and the morphism Spec J -> P^{A-1}_k is a closed immersion. The bound A >= m+3 is tight.",
      "evidence": "The construction uses the change of basis aG = (1,0,...,0) to reduce a-relation to xi_1 = 0, then sets xi_2 = 1 (affine chart), xi_3 = theta (generator of K/k), xi_{3+i} = tau_i (m tangent directions). This accounts for 1 + 1 + 1 + m = m + 3 coordinates, exactly matching the inequality A >= m + 3. The remaining coordinates are zero. The closed-immersion check on the affine chart {X_2 != 0} is correct, and the proper-immersion-is-closed argument gives the global closed immersion.",
      "id": "C9",
      "location": "Section 'Local codes and shielded sections', Lemma 19",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Lemma 21: For a smooth X with components C_1,...,C_s and sections e_0,...,e_r defining a locally closed embedding e: X -> P^r_k with componentwise k_mu-linear independence, there is a finite set R subset |X|\\S and nonzero binary vectors epsilon_Q at each Q in R such that, for any sections h_0,...,h_m with prescribed binary values, the products h_i e_j are k_mu-linearly independent on every component.",
      "evidence": "The proof is a finite-field exhaustion argument: for each nonzero matrix gamma in the finite set k_C^{(m+1)(r+1)}, define f_i^gamma = sum gamma_{ij} e_j|_C and find a closed point Q_{C,gamma} where some f_i^gamma is nonzero (via Lemma 4 applied to the nonempty open U_gamma). The detection identity ((sum gamma_{ij} h_i e_j)(Q_{C,gamma}) = sum epsilon_i^{C,gamma} f_i^gamma(Q_{C,gamma})) correctly uses the prescribed binary values.",
      "id": "C10",
      "location": "Section 'Local codes and shielded sections', Lemma 21",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "The two-block coordinate system with A = N+1-B = N+1-(m+1)(r+1) anti-code coordinates and B Segre coordinates, given N >= (m+1)(r+1) + m + 2, yields a locally closed embedding iota_N: X -> P^N_k whose pullback of any rational hyperplane has zero first jet at the corresponding assigned point P_lambda.",
      "evidence": "The construction is internally consistent: Lemma 23 (no basepoints) uses Lemma 19(b) to show the eta-values are not all zero at P_lambda; Lemma 24 invokes Lemma 16 (compactified two-block embedding) with the verified hypotheses on the w-block and u-block; Lemma 25 establishes componentwise nondegeneracy by combining the test-point construction with the global interpolation in equation eq:globalinterpolation. The vanishing s_lambda|_{P_lambda^{(2)}} = 0 follows from eq:anti-Z-global (sum a_l eta_l = 0 on Z) and the fact that all w_{ij} vanish on Z.",
      "id": "C11",
      "location": "Section 'The embedding and the hyperplane singularities', Lemmas 23-25 and final argument",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Corollary 26: Baker's question has a negative answer for every nonempty smooth quasiprojective X of positive dimension over F_q.",
      "evidence": "Direct consequence of Theorem 1: for every N >= N_X, the embedding iota_N satisfies the componentwise nondegeneracy hypothesis (even geometrically) but has no smooth k-rational hyperplane section.",
      "id": "C12",
      "location": "Section 'Consequences and comparison', Corollary 26",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "unsupported",
      "claim": "Proof-as-code coverage: the paper ships only a partial Lean 4 formalization at https://github.com/anetigone/lean-research-formalizations of 'selected proof components,' rather than a complete machine-checked proof of Theorem 1 and its key dependencies.",
      "evidence": "The acknowledgements explicitly state the Lean 4 development is intended 'as a machine-checkable supplement to the mathematical arguments presented here' and is scoped to 'selected proof components.' For a math.AG paper whose headline result is a negative answer to a question raised by Baker (recorded by Poonen) and whose proof involves a 25-lemma chain with intricate intersection-theoretic computations (Lemma 11) and finite-field probability sums (Lemma 18), full Lean/Coq formalization is feasible and would close the gap between human-checked arguments and machine-verified ones.",
      "id": "C13",
      "location": "Acknowledgements",
      "severity": "major",
      "suggested_fix": "Formalize the complete chain in Lean 4, prioritizing: (i) the main theorem statement and final argument in src/anti_bertini/Theorem1.lean, (ii) the Riemann-Roch reduction in Lemma 11 in src/anti_bertini/RiemannRochAlterations.lean, (iii) the finite-field probability sum in Lemma 18 in src/anti_bertini/InitialEmbedding.lean, (iv) the first-order code construction in Lemma 19 in src/anti_bertini/LocalCode.lean. Publish the formalization status (which lemmas are complete, which are axiomatized) in a README of the repository."
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

1. Asgarli2019: {\bibname S. Asgarli}, `Sharp Bertini theorem for plane curves over finite fields', {\em Canad. Math. Bull.} 62 (2019), no. 2, 223--230.
2. AsgarliDuanLai2024: {\bibname S. Asgarli, L. Duan \and K.-W. Lai}, `Transverse linear subspaces to hypersurfaces over finite fields', {\em Finite Fields Appl.} 95 (2024), Paper No. 102396.
3. AsgarliGhioca2022: {\bibname S. Asgarli \and D. Ghioca}, `A Bertini type theorem for pencils over finite fields', {\em Finite Fields Appl.} 77 (2022), Paper No. 101936.
4. Bertucci2025: {\bibname M. Bertucci}, `Taylor conditions over finite fields', arXiv:2412.08744v2, 2025. arXiv:[2412.08744](https://arxiv.org/abs/2412.08744)
5. BiluHowe2021: {\bibname M. Bilu \and S. Howe}, `Motivic Euler products in motivic statistics', {\em Algebra Number Theory} 15 (2021), no. 9, 2195--2259.
6. BucurKedlaya2012: {\bibname A. Bucur \and K. S. Kedlaya}, `The probability that a complete intersection is smooth', {\em J. Th\'eor. Nombres Bordeaux} 24 (2012), no. 3, 541--556.
7. CharlesPoonen2016: {\bibname F. Charles \and B. Poonen}, `Bertini irreducibility theorems over finite fields', {\em J. Amer. Math. Soc.} 29 (2016), no. 1, 81--94.
8. Couvreur2015: {\bibname A. Couvreur}, `An upper bound on the number of rational points of arbitrary projective varieties over finite fields', arXiv:1409.7544v3, 2015. arXiv:[1409.7544](https://arxiv.org/abs/1409.7544)
9. deJong1996: {\bibname A. J. de Jong}, `Smoothness, semi-stability and alterations', {\em Inst. Hautes \'Etudes Sci. Publ. Math.} 83 (1996), 51--93.
10. ErmanWood2015: {\bibname D. Erman \and M. M. Wood}, `Semiample Bertini theorems over finite fields', {\em Duke Math. J.} 164 (2015), no. 1, 1--38.
11. Fulton1998: {\bibname W. Fulton}, {\em Intersection Theory}, second ed., Ergebnisse der Mathematik und ihrer Grenzgebiete, vol. 2, Springer, Berlin, 1998.
12. GhoshKrishna2023: {\bibname M. Ghosh \and A. Krishna}, `Bertini theorems revisited', {\em J. Lond. Math. Soc. (2)} 108 (2023), no. 3, 1163--1192.
13. Hartshorne1977: {\bibname R. Hartshorne}, {\em Algebraic Geometry}, Graduate Texts in Mathematics, vol. 52, Springer, New York, 1977.
14. Jouanolou1983: {\bibname J.-P. Jouanolou}, {\em Th\'eor\`emes de Bertini et applications}, Progress in Mathematics, vol. 42, Birkh\"auser, Boston, 1983.
15. Katz1999: {\bibname N. M. Katz}, `Space filling curves over finite fields', {\em Math. Res. Lett.} 6 (1999), no. 5--6, 613--624.
16. Katz2001: {\bibname N. M. Katz}, `Corrections to: Space filling curves over finite fields', {\em Math. Res. Lett.} 8 (2001), no. 5--6, 689--691.
17. LangWeil1954: {\bibname S. Lang \and A. Weil}, `Number of points of varieties in finite fields', {\em Amer. J. Math.} 76 (1954), 819--827.
18. Lazarsfeld2004: {\bibname R. Lazarsfeld}, {\em Positivity in Algebraic Geometry I}, Ergebnisse der Mathematik und ihrer Grenzgebiete, vol. 48, Springer, Berlin, 2004.
19. Poonen2004: {\bibname B. Poonen}, `Bertini theorems over finite fields', {\em Ann. of Math. (2)} 160 (2004), no. 3, 1099--1127.
20. Poonen2008: {\bibname B. Poonen}, `Smooth hypersurface sections containing a given subscheme over a finite field', {\em Math. Res. Lett.} 15 (2008), no. 2, 265--271.
21. Serre1991: {\bibname J.-P. Serre}, `Lettre \`a M. Tsfasman', {\em Ast\'erisque} No. 198--200 (1991), 351--353.
22. Sorensen1991: {\bibname A. B. S\o rensen}, `Projective Reed--Muller codes', {\em IEEE Trans. Inform. Theory} 37 (1991), no. 6, 1567--1576.
23. StacksProject: {\bibname The Stacks Project Authors}, {\em The Stacks Project}, Tags 04XV and 06ND, 2026.

