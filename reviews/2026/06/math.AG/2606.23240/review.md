# A conjecture on the action of Hecke operators

GrokRxiv review of [arXiv:2606.23240](https://arxiv.org/abs/2606.23240) · `math.AG`

_Authors_: David Kazhdan

## TL;DR

The paper formulates Conjecture 47 — that Hecke operator algebras acting on spaces of half-measures of division algebra bundles over curves are canonically isomorphic across division algebras of the same rank — and develops the technical framework (moduli spaces Bun^L, Hecke correspondences, 1/2-density spaces S^L) necessary to state it precisely. Reduction Lemma 48 (Conjecture 47 ⇒ Conjecture 16) is the main structural result, relating the global conjecture to an earlier eigendecomposition conjecture in the local P^1 setting.

Three specialist findings converge on major-revision status. Technical correctness (overall_correctness 'mostly_sound', confidence 0.55) identified four major-severity gaps: the homeomorphism π^L_E (C3) is claimed without proof of continuity, properness, injectivity, or surjectivity; Claim 33 (C16), the bridge identifying F-points of the Hecke stack with local H_D and equating ω_x with the Gelfand–Leray form, is asserted without proof; commutativity of H(L) (C18) is unsubstantiated for inner forms; and no computational or formal artifacts accompany the paper (C22). Reproducibility (score 0.18, confidence 0.9) independently flagged one critical concern (no formal specification of Conjecture 47) and three major concerns (no code for Conjecture 16/Lemma 48, no load-bearing claim formalizations, no small-case checks). The paper's fields (math.RT, math.NT, math.AG) are in the code-amenable set; the recommendation gate therefore applies, mandating major_revision.

Two review-input anomalies are flagged as pipeline artifacts, not paper weaknesses. The citation specialist verified only Vaswani et al. 2017 ('Attention is all you need'), a deep-learning paper unrelated to the paper's arithmetic geometry content; the novelty specialist's related-work section references LoRA and adapter methods rather than automorphic forms literature, and its confidence value (5.0) exceeds the 0–1 range. The paper's actual bibliography (BD, BK, DKV, HN, HK, Leray, Weil) is standard arithmetic geometry canon and was not assessed. Citation and novelty assessments for this paper should be treated as unreliable due to these input mismatches.

_Recommendation_: **Major revision** · _Confidence_: 72%

## Strengths

- The conjecture is stated with mathematical precision using the established half-measure (1/2-density) framework and Hecke correspondences, building naturally on classical Jacquet–Langlands isomorphisms and the Beilinson–Drinfeld/Braverman–Kazhdan constructions.
- Lemma 48 (Conjecture 47 ⇒ Conjecture 16) provides a concrete structural consequence of the main conjecture and tests its coherence in the local P^1 setting, giving the paper substantive content beyond mere conjecture formulation.
- Supporting lemmas (Lemma 18: semistable endomorphism vanishing; Lemma 22: base-change semistability) are proved correctly using standard Harder–Narasimhan arguments, giving confidence in the geometric framework.
- The moduli problem is novel: extending the classical division-algebra convolution-algebra isomorphism to Hecke operators on spaces of bundles over curves is a well-motivated and original problem at the intersection of geometric Langlands, p-adic representation theory, and arithmetic geometry.
- The integral-transform construction for Hecke operators (Claim 36/Definition 34) is routine and correctly set up via smooth proper correspondences and half-density pullback, consistent with established BK and BD frameworks.

## Weaknesses

- The homeomorphism π^L_E (Claim 7, C3 at major severity) is stated without proof of G^L-invariance on the double quotient, continuity, properness, injectivity, or surjectivity; this claim is load-bearing for Corollary 8 (canonical isomorphism of measure spaces M^L_E) and the entire local–global comparison.
- Claim 33 (C16, major severity) — identification of F-points of the Hecke stack with the local correspondence H_D and equality of ω_x with the Gelfand–Leray form dx/da — is asserted without proof, making Lemma 48 conditional on an unverified bridge that requires non-trivial Galois cohomology vanishing and explicit coordinate unwinding of α_C.
- Commutativity of the Hecke algebra H(L) (Claim 46, C18 at major severity) is asserted without proof or reference to Satake/Drinfeld commutativity results for inner forms of GL_n, yet the eigendecomposition in Conjecture 47 presupposes it.
- No formal or computational artifacts accompany the paper (reproducibility critical + C22 major): Conjecture 47 has no machine-checked formal specification, and no small-case symbolic verification (e.g., n=2 over Q_p) is provided to validate the local Hecke operator construction.
- Pervasive typographic errors (C21) — unbalanced parentheses in Definition 24, subscript errors I^I→I^E in Conjecture 16, π^L_{ref}→π^L_{reg} in Claim 13, malformed notation in Conjecture 47 — materially impede claim-by-claim verification of the technical chain.
- The citation and novelty specialist inputs appear mismatched to the paper's actual content (verifying a deep-learning citation; assessing novelty relative to adapter methods), meaning the paper's bibliography coverage and prior-art positioning in arithmetic geometry have not been independently audited.

## Revision Targets

- [ ] **Manuscript: reproducibility appendix**
  - Location: `corrections/2606.23240/paper.tex` at `reproducibility appendix`
  - Evidence: Proof-as-code gap: load-bearing supporting claims about the homeomorphism pi_E^L, smoothness/properness of Hecke correspondences, Gelfand-Leray forms, and commutativity of generated Hecke algebras are stated with informal or cited proofs only; a consolidated artifact such as formal/supporting_claims.lean is missing.
  - Required change: Add a reproducibility note that resolves this concern: Proof-as-code gap: load-bearing supporting claims about the homeomorphism pi_E^L, smoothness/properness of Hecke correspondences, Gelfand-Leray forms, and commutativity of generated Hecke algebras are stated with informal or cited proofs only; a consolidated artifact such as formal/supporting_claims.lean is missing.
  - Verification: Re-review should confirm the reproducibility concern is addressed with a concrete artifact or manuscript update.
- [ ] **Manuscript: Section 4.4, Lemma 48**
  - Location: `corrections/2606.23240/paper.tex` at `Section 4.4, Lemma 48`
  - Evidence: The proof is 'Follows from Claim 33', i.e., from the identification of the global Hecke correspondence on \mathbb P^1 (specialised at the given M and D) with the local operator T_D^E(L) of Definition 14. Since Claim 33 itself is asserted without proof (see C16), the implication is conditional. If Claim 33 holds, the implication is essentially immediate by inspection of definitions.
  - Required change: Make the proof self-contained by inlining the explicit identification of \mathcal S^L (in the \mathbb P^1, |M|=2 case) with \mathcal S^L_E and of T_{\underline D} with T_D^E(L), referencing the parts of Claim 31 and Claim 33 that are used.
  - Verification: Re-review should confirm `Section 4.4, Lemma 48` is corrected or justified.
- [ ] **Manuscript: Section 4.3, Claim 46**
  - Location: `corrections/2606.23240/paper.tex` at `Section 4.3, Claim 46`
  - Evidence: Commutativity of Hecke operators at different divisors is a load-bearing claim for the conjecture (the eigendecomposition in Conjecture 47 requires it). For GL_n on a curve, commutativity is a classical result of Drinfeld; the variant for inner forms of GL_n (division-algebra-twisted Hecke algebras) is plausible by reduction to GL_n via base change to \bar F, but is non-trivial and is here asserted without proof or reference. The notation '\mathbb C^*-subalgebra' is also unclear — likely a typo for 'commutative \mathbb C-subalgebra'.
  - Required change: Either cite a commutativity result for L-twisted Hecke algebras (e.g., reduction to the split case via Galois descent, or a Satake-style argument) or sketch the proof: the convolution of two divisorial correspondences is commutative because the underlying double-coset algebra at the formal disk is commutative (Satake isomorphism for inner forms).
  - Verification: Re-review should confirm `Section 4.3, Claim 46` is corrected or justified.
- [ ] **Manuscript: entire paper (no accompanying artifact)**
  - Location: `corrections/2606.23240/paper.tex` at `entire paper (no accompanying artifact)`
  - Evidence: This is a pure-mathematics paper in code-amenable fields (math.RT, math.NT, math.AG). Per the proof-as-code axiom for such fields: load-bearing structural claims (e.g., Claim 7's homeomorphism, Claim 31's classification, Claim 33's identification of Gelfand–Leray forms, Claim 46's commutativity) admit either symbolic/computer-algebra verification (e.g., explicit P^1 computations in SageMath/Pari for n=2 or n=3) or formalisation in a proof assistant. No accompanying repository, scripts, or formal artifacts are referenced. While the paper's primary content is conjectural and a full formalisation is unrealistic, finite-rank symbolic checks of the local identification π^L_E and the Hecke commutativity at n=2 would substantially strengthen confidence.
  - Required change: Provide a small companion artifact (e.g., experiments/n2_p3/local_hecke.sage or src/verification/Hecke_n2.lean) implementing the n=2 local case: build \mathcal S^L_E for the two rank-2 division algebras over \mathbb Q_p (split and non-split quaternion), compute T_D for several D, and numerically verify the asserted spectral coincidence (Conjecture 16, n=2) for at least one quadratic E/F.
  - Verification: Re-review should confirm `entire paper (no accompanying artifact)` is corrected or justified.
- [ ] **Manuscript: throughout (Definitions 24, 27, 32; Conjectures 16, 47)**
  - Location: `corrections/2606.23240/paper.tex` at `throughout (Definitions 24, 27, 32; Conjectures 16, 47)`
  - Evidence: Multiple formula-level typographic errors compromise verifiability: Definition 24's formula for \mathcal L is duplicated and unbalanced ('det^{⊗n}(RΓ(\bar C, \bar E)) ⊗ det^{-1}(RΓ(\underline C, det(\bar E))' lacks closing parentheses); Conjecture 16 uses 'I^I' instead of 'I^E' and 'λ^D_i' where 'λ^E_i' is meant; Claim 13 writes 'π^L_{ref}' for 'π^L_{reg}'; Conjecture 47 writes 'T_{D | \mathcal S^i L(i)}'; Definition 27.5 ends with 'α_{\underline C}' but later Claim 33 refers to it without the subscript; reference [@DKV] is mis-spelt 'cintained' as 'contained'; reference cluster includes 'betIen' (between) and 'bundled on curved' (bundles on curves). These do not invalidate the mathematics but materially impede claim-by-claim verification.
  - Required change: Run a careful proof-reading pass focusing on subscript/superscript balance, parenthesis matching, and consistent naming of indexing sets and maps.
  - Verification: Re-review should confirm `throughout (Definitions 24, 27, 32; Conjectures 16, 47)` is corrected or justified.
- [ ] **Bibliography: Exploiting Linear Structure for Efficient Large-Scale Deep Learning**
  - Location: bibliography entry: `Exploiting Linear Structure for Efficient Large-Scale Deep Learning`
  - Evidence: This work explored using low-rank decomposition to approximate and compress neural network weight matrices to speed up inference, which is a related application of low-rank matrix techniques to neural networks.
  - Required change: Add or discuss missing prior art `Exploiting Linear Structure for Efficient Large-Scale Deep Learning`. This work explored using low-rank decomposition to approximate and compress neural network weight matrices to speed up inference, which is a related application of low-rank matrix techniques to neural networks.
  - Verification: Re-review should confirm the related-work discussion addresses this prior art.

## Open Questions

- Can the author provide a complete proof of the homeomorphism π^L_E (Claim 7), explicitly addressing G^L-invariance on the double quotient \bar G^L\G^L_E/G^L, continuity and properness in the p-adic topology, and an explicit formula for the inverse map using the companion matrix of P?
- What is the precise argument establishing \underline{H}_D(F) = H_D in Claim 33, including the required Galois cohomology vanishing (H^1(F, G^L) considerations), and how does the canonical isomorphism α_C of [BD] reduce to the Gelfand–Leray form dx/da in the explicit P^1 coordinate system?
- Is there a reference or proof sketch establishing commutativity of the L-twisted Hecke algebra H(L) for inner forms of GL_n — for example, via the Satake isomorphism at the formal disk or via Galois descent from the split (GL_n) case where commutativity is classical?
- Can a companion computational artifact be provided — for instance, a SageMath script computing T_D for the two rank-2 division algebras over Q_p (split and non-split quaternion) and numerically verifying the spectral coincidence of Conjecture 16 for at least one quadratic extension E/F with n=2?
- Are there low-rank or low-genus cases (e.g., n=2, g=0, |M|=2, |D|=2) where Conjecture 47 can be verified directly or partially, even by finite-group or small-matrix analogy, to provide evidence beyond the logical reduction to Conjecture 16?

## Per-Agent Reviews

### citation (`Gemini 3.5 Flash (Medium)`) — status: `pass`

```json
{
  "confidence": 0.95,
  "entries": [
    {
      "citation": {
        "arxiv_id": "1706.03762",
        "authors": [
          "Vaswani, A.",
          "Shazeer, N.",
          "Parmar, N.",
          "Uszkoreit, J.",
          "Jones, L.",
          "Gomez, A. N.",
          "Polosukhin, I."
        ],
        "doi": "10.5555/3295222.3295349",
        "key": "vaswani2017attention",
        "raw": "Vaswani, A., Shazeer, N., Parmar, N., Uszkoreit, J., Jones, L., Gomez, A. N., ... & Polosukhin, I. (2017). Attention is all you need. Advances in neural information processing systems, 30.",
        "title": "Attention is all you need",
        "url": "https://arxiv.org/abs/1706.03762",
        "venue": "Advances in neural information processing systems",
        "year": 2017
      },
      "exists": true,
      "explanation": "This is the primary citation for the Transformer architecture introduced in the paper, which has been verified as existing and highly relevant.",
      "notes": "Verified successfully.",
      "relevance": "high",
      "resolved_doi": "10.5555/3295222.3295349",
      "resolved_url": "https://arxiv.org/abs/1706.03762"
    }
  ],
  "missing_references": [],
  "summary": "All bibliographic references have been verified. The citations are accurate, relevant, and correctly formatted."
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.72,
  "questions": [
    "Can the author provide a complete proof of the homeomorphism π^L_E (Claim 7), explicitly addressing G^L-invariance on the double quotient \\bar G^L\\G^L_E/G^L, continuity and properness in the p-adic topology, and an explicit formula for the inverse map using the companion matrix of P?",
    "What is the precise argument establishing \\underline{H}_D(F) = H_D in Claim 33, including the required Galois cohomology vanishing (H^1(F, G^L) considerations), and how does the canonical isomorphism α_C of [BD] reduce to the Gelfand–Leray form dx/da in the explicit P^1 coordinate system?",
    "Is there a reference or proof sketch establishing commutativity of the L-twisted Hecke algebra H(L) for inner forms of GL_n — for example, via the Satake isomorphism at the formal disk or via Galois descent from the split (GL_n) case where commutativity is classical?",
    "Can a companion computational artifact be provided — for instance, a SageMath script computing T_D for the two rank-2 division algebras over Q_p (split and non-split quaternion) and numerically verifying the spectral coincidence of Conjecture 16 for at least one quadratic extension E/F with n=2?",
    "Are there low-rank or low-genus cases (e.g., n=2, g=0, |M|=2, |D|=2) where Conjecture 47 can be verified directly or partially, even by finite-group or small-matrix analogy, to provide evidence beyond the logical reduction to Conjecture 16?"
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "Proof-as-code gap: load-bearing supporting claims about the homeomorphism pi_E^L, smoothness/properness of Hecke correspondences, Gelfand-Leray forms, and commutativity of generated Hecke algebras are stated with informal or cited proofs only; a consolidated artifact such as formal/supporting_claims.lean is missing.",
      "id": "weakness-1",
      "locator": "reproducibility appendix",
      "required_update": "Add a reproducibility note that resolves this concern: Proof-as-code gap: load-bearing supporting claims about the homeomorphism pi_E^L, smoothness/properness of Hecke correspondences, Gelfand-Leray forms, and commutativity of generated Hecke algebras are stated with informal or cited proofs only; a consolidated artifact such as formal/supporting_claims.lean is missing.",
      "source_path": "corrections/2606.23240/paper.tex",
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm the reproducibility concern is addressed with a concrete artifact or manuscript update.",
      "weakness_index": 0
    },
    {
      "evidence": "The proof is 'Follows from Claim 33', i.e., from the identification of the global Hecke correspondence on \\mathbb P^1 (specialised at the given M and D) with the local operator T_D^E(L) of Definition 14. Since Claim 33 itself is asserted without proof (see C16), the implication is conditional. If Claim 33 holds, the implication is essentially immediate by inspection of definitions.",
      "id": "weakness-2",
      "locator": "Section 4.4, Lemma 48",
      "required_update": "Make the proof self-contained by inlining the explicit identification of \\mathcal S^L (in the \\mathbb P^1, |M|=2 case) with \\mathcal S^L_E and of T_{\\underline D} with T_D^E(L), referencing the parts of Claim 31 and Claim 33 that are used.",
      "source_path": "corrections/2606.23240/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 4.4, Lemma 48` is corrected or justified.",
      "weakness_index": 1
    },
    {
      "evidence": "Commutativity of Hecke operators at different divisors is a load-bearing claim for the conjecture (the eigendecomposition in Conjecture 47 requires it). For GL_n on a curve, commutativity is a classical result of Drinfeld; the variant for inner forms of GL_n (division-algebra-twisted Hecke algebras) is plausible by reduction to GL_n via base change to \\bar F, but is non-trivial and is here asserted without proof or reference. The notation '\\mathbb C^*-subalgebra' is also unclear — likely a typo for 'commutative \\mathbb C-subalgebra'.",
      "id": "weakness-3",
      "locator": "Section 4.3, Claim 46",
      "required_update": "Either cite a commutativity result for L-twisted Hecke algebras (e.g., reduction to the split case via Galois descent, or a Satake-style argument) or sketch the proof: the convolution of two divisorial correspondences is commutative because the underlying double-coset algebra at the formal disk is commutative (Satake isomorphism for inner forms).",
      "source_path": "corrections/2606.23240/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 4.3, Claim 46` is corrected or justified.",
      "weakness_index": 2
    },
    {
      "evidence": "This is a pure-mathematics paper in code-amenable fields (math.RT, math.NT, math.AG). Per the proof-as-code axiom for such fields: load-bearing structural claims (e.g., Claim 7's homeomorphism, Claim 31's classification, Claim 33's identification of Gelfand–Leray forms, Claim 46's commutativity) admit either symbolic/computer-algebra verification (e.g., explicit P^1 computations in SageMath/Pari for n=2 or n=3) or formalisation in a proof assistant. No accompanying repository, scripts, or formal artifacts are referenced. While the paper's primary content is conjectural and a full formalisation is unrealistic, finite-rank symbolic checks of the local identification π^L_E and the Hecke commutativity at n=2 would substantially strengthen confidence.",
      "id": "weakness-4",
      "locator": "entire paper (no accompanying artifact)",
      "required_update": "Provide a small companion artifact (e.g., experiments/n2_p3/local_hecke.sage or src/verification/Hecke_n2.lean) implementing the n=2 local case: build \\mathcal S^L_E for the two rank-2 division algebras over \\mathbb Q_p (split and non-split quaternion), compute T_D for several D, and numerically verify the asserted spectral coincidence (Conjecture 16, n=2) for at least one quadratic E/F.",
      "source_path": "corrections/2606.23240/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `entire paper (no accompanying artifact)` is corrected or justified.",
      "weakness_index": 3
    },
    {
      "evidence": "Multiple formula-level typographic errors compromise verifiability: Definition 24's formula for \\mathcal L is duplicated and unbalanced ('det^{⊗n}(RΓ(\\bar C, \\bar E)) ⊗ det^{-1}(RΓ(\\underline C, det(\\bar E))' lacks closing parentheses); Conjecture 16 uses 'I^I' instead of 'I^E' and 'λ^D_i' where 'λ^E_i' is meant; Claim 13 writes 'π^L_{ref}' for 'π^L_{reg}'; Conjecture 47 writes 'T_{D | \\mathcal S^i L(i)}'; Definition 27.5 ends with 'α_{\\underline C}' but later Claim 33 refers to it without the subscript; reference [@DKV] is mis-spelt 'cintained' as 'contained'; reference cluster includes 'betIen' (between) and 'bundled on curved' (bundles on curves). These do not invalidate the mathematics but materially impede claim-by-claim verification.",
      "id": "weakness-5",
      "locator": "throughout (Definitions 24, 27, 32; Conjectures 16, 47)",
      "required_update": "Run a careful proof-reading pass focusing on subscript/superscript balance, parenthesis matching, and consistent naming of indexing sets and maps.",
      "source_path": "corrections/2606.23240/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `throughout (Definitions 24, 27, 32; Conjectures 16, 47)` is corrected or justified.",
      "weakness_index": 4
    },
    {
      "evidence": "This work explored using low-rank decomposition to approximate and compress neural network weight matrices to speed up inference, which is a related application of low-rank matrix techniques to neural networks.",
      "id": "weakness-6",
      "locator": "Exploiting Linear Structure for Efficient Large-Scale Deep Learning",
      "required_update": "Add or discuss missing prior art `Exploiting Linear Structure for Efficient Large-Scale Deep Learning`. This work explored using low-rank decomposition to approximate and compress neural network weight matrices to speed up inference, which is a related application of low-rank matrix techniques to neural networks.",
      "source_path": null,
      "source_role": "novelty",
      "status": "open",
      "target_kind": "bibliography",
      "verification_check": "Re-review should confirm the related-work discussion addresses this prior art.",
      "weakness_index": 5
    }
  ],
  "strengths": [
    "The conjecture is stated with mathematical precision using the established half-measure (1/2-density) framework and Hecke correspondences, building naturally on classical Jacquet–Langlands isomorphisms and the Beilinson–Drinfeld/Braverman–Kazhdan constructions.",
    "Lemma 48 (Conjecture 47 ⇒ Conjecture 16) provides a concrete structural consequence of the main conjecture and tests its coherence in the local P^1 setting, giving the paper substantive content beyond mere conjecture formulation.",
    "Supporting lemmas (Lemma 18: semistable endomorphism vanishing; Lemma 22: base-change semistability) are proved correctly using standard Harder–Narasimhan arguments, giving confidence in the geometric framework.",
    "The moduli problem is novel: extending the classical division-algebra convolution-algebra isomorphism to Hecke operators on spaces of bundles over curves is a well-motivated and original problem at the intersection of geometric Langlands, p-adic representation theory, and arithmetic geometry.",
    "The integral-transform construction for Hecke operators (Claim 36/Definition 34) is routine and correctly set up via smooth proper correspondences and half-density pullback, consistent with established BK and BD frameworks."
  ],
  "summary": "The paper formulates Conjecture 47 — that Hecke operator algebras acting on spaces of half-measures of division algebra bundles over curves are canonically isomorphic across division algebras of the same rank — and develops the technical framework (moduli spaces Bun^L, Hecke correspondences, 1/2-density spaces S^L) necessary to state it precisely. Reduction Lemma 48 (Conjecture 47 ⇒ Conjecture 16) is the main structural result, relating the global conjecture to an earlier eigendecomposition conjecture in the local P^1 setting.\n\nThree specialist findings converge on major-revision status. Technical correctness (overall_correctness 'mostly_sound', confidence 0.55) identified four major-severity gaps: the homeomorphism π^L_E (C3) is claimed without proof of continuity, properness, injectivity, or surjectivity; Claim 33 (C16), the bridge identifying F-points of the Hecke stack with local H_D and equating ω_x with the Gelfand–Leray form, is asserted without proof; commutativity of H(L) (C18) is unsubstantiated for inner forms; and no computational or formal artifacts accompany the paper (C22). Reproducibility (score 0.18, confidence 0.9) independently flagged one critical concern (no formal specification of Conjecture 47) and three major concerns (no code for Conjecture 16/Lemma 48, no load-bearing claim formalizations, no small-case checks). The paper's fields (math.RT, math.NT, math.AG) are in the code-amenable set; the recommendation gate therefore applies, mandating major_revision.\n\nTwo review-input anomalies are flagged as pipeline artifacts, not paper weaknesses. The citation specialist verified only Vaswani et al. 2017 ('Attention is all you need'), a deep-learning paper unrelated to the paper's arithmetic geometry content; the novelty specialist's related-work section references LoRA and adapter methods rather than automorphic forms literature, and its confidence value (5.0) exceeds the 0–1 range. The paper's actual bibliography (BD, BK, DKV, HN, HK, Leray, Weil) is standard arithmetic geometry canon and was not assessed. Citation and novelty assessments for this paper should be treated as unreliable due to these input mismatches.",
  "weaknesses": [
    "The homeomorphism π^L_E (Claim 7, C3 at major severity) is stated without proof of G^L-invariance on the double quotient, continuity, properness, injectivity, or surjectivity; this claim is load-bearing for Corollary 8 (canonical isomorphism of measure spaces M^L_E) and the entire local–global comparison.",
    "Claim 33 (C16, major severity) — identification of F-points of the Hecke stack with the local correspondence H_D and equality of ω_x with the Gelfand–Leray form dx/da — is asserted without proof, making Lemma 48 conditional on an unverified bridge that requires non-trivial Galois cohomology vanishing and explicit coordinate unwinding of α_C.",
    "Commutativity of the Hecke algebra H(L) (Claim 46, C18 at major severity) is asserted without proof or reference to Satake/Drinfeld commutativity results for inner forms of GL_n, yet the eigendecomposition in Conjecture 47 presupposes it.",
    "No formal or computational artifacts accompany the paper (reproducibility critical + C22 major): Conjecture 47 has no machine-checked formal specification, and no small-case symbolic verification (e.g., n=2 over Q_p) is provided to validate the local Hecke operator construction.",
    "Pervasive typographic errors (C21) — unbalanced parentheses in Definition 24, subscript errors I^I→I^E in Conjecture 16, π^L_{ref}→π^L_{reg} in Claim 13, malformed notation in Conjecture 47 — materially impede claim-by-claim verification of the technical chain.",
    "The citation and novelty specialist inputs appear mismatched to the paper's actual content (verifying a deep-learning citation; assessing novelty relative to adapter methods), meaning the paper's bibliography coverage and prior-art positioning in arithmetic geometry have not been independently audited."
  ]
}
```

### novelty (`Gemini 3.5 Flash (High)`) — status: `pass`

```json
{
  "confidence": 5.0,
  "missing_prior_art": [
    {
      "reason": "This work explored using low-rank decomposition to approximate and compress neural network weight matrices to speed up inference, which is a related application of low-rank matrix techniques to neural networks.",
      "title": "Exploiting Linear Structure for Efficient Large-Scale Deep Learning"
    }
  ],
  "novelty_score": 0.85,
  "related_work": [
    {
      "citation_key": "houlsby2019parameter",
      "delta": "LoRA performs adaptation via low-rank updates to weight matrices rather than adding sequential adapter layers, avoiding additional inference latency.",
      "relation": "competing",
      "title": "Parameter-Efficient Transfer Learning for NLP"
    },
    {
      "citation_key": "li2021prefix",
      "delta": "LoRA adapts the weights of existing layers directly using low-rank decomposition, whereas prefix-tuning prepends trainable continuous prompts to the keys and values in attention layers, reducing the sequence length available for context.",
      "relation": "competing",
      "title": "Prefix-Tuning: Optimizing Continuous Prompts for Generation"
    },
    {
      "citation_key": "aghajanyan2020intrinsic",
      "delta": "LoRA builds on the empirical finding that parameter updates during fine-tuning have a low intrinsic dimension by explicitly forcing the weight updates to be low-rank matrices.",
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
  "code_availability": "unspecified",
  "code_url": null,
  "concerns": [
    {
      "area": "code",
      "description": "No source repository, license, commit, release, proof assistant project, or executable scripts are provided for reproducing the paper's mathematical constructions or operator calculations.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "Proof-as-code gap: the headline Conjecture 47 on canonical isomorphism of Hecke subalgebras and common eigenspace decompositions has no formal specification or checked supporting artifact; an artifact such as formal/Conjecture47.lean would be needed to make the statement mechanically reproducible.",
      "severity": "critical"
    },
    {
      "area": "other",
      "description": "Proof-as-code gap: the special-case Conjecture 16 and its reduction from Lemma 48 are not accompanied by formalized definitions or checked proof objects; artifacts such as formal/Conjecture16.lean and formal/Lemma48.lean would close this gap.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "Proof-as-code gap: load-bearing supporting claims about the homeomorphism pi_E^L, smoothness/properness of Hecke correspondences, Gelfand-Leray forms, and commutativity of generated Hecke algebras are stated with informal or cited proofs only; a consolidated artifact such as formal/supporting_claims.lean is missing.",
      "severity": "major"
    },
    {
      "area": "evaluation",
      "description": "No worked computational or finite/small-rank checks are supplied for basic cases such as n=1, split E=F plus F, or explicit local fields; reproducible examples under experiments/small_cases/ would help validate the constructions.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "External mathematical dependencies are cited bibliographically but not pinned to theorem numbers, formal libraries, or machine-checkable dependency versions, making independent verification rely on manual literature reconstruction.",
      "severity": "minor"
    }
  ],
  "confidence": 0.9,
  "data_availability": "unspecified",
  "data_url": null,
  "environment": {
    "dependencies": [
      "Local non-Archimedean field F with char(F) != 2 for the main analytic setting",
      "Central division F-algebra L of rank n",
      "Smooth complete absolutely irreducible F-curve C with divisors M and D",
      "Cited mathematical references BD, BK, DKV, HN, HK, Leray, and Weil"
    ],
    "hardware": null,
    "software": null
  },
  "reproducibility_score": 0.18
}
```

### summary (`claude-haiku-4-5-20251001`) — status: `pass`

```json
{
  "audience": "Researchers in arithmetic geometry, automorphic forms, representation theory of p-adic groups, and algebraic geometry, particularly those interested in invariants of division algebras and moduli spaces of bundles",
  "key_contributions": [
    "Formulation of Conjecture 47: Hecke operator algebras on bundle measure spaces for different division algebras of the same rank are canonically isomorphic",
    "Technical framework for defining Hecke operators on spaces of 1/2-measures via integration over Hecke correspondences",
    "Proof that Conjecture 47 for projective lines implies an earlier conjecture (Conjecture 16) about simultaneous diagonalization of Hecke operators",
    "Extension of classical isomorphism results for convolution algebras to the setting of bundles over curves"
  ],
  "plain_language_summary": "The paper studies division algebras—certain algebraic structures with properties similar to quaternions—over local non-Archimedean fields. A classical result states that convolution algebras built from different division algebras of the same rank are isomorphic in a canonical way. The author conjectures this isomorphism extends to more complex structures: algebras generated by Hecke operators acting on spaces of measures associated with bundles of division algebras over curves.\n\nThe main technical contribution is formulating this conjecture precisely using geometric tools from algebraic geometry, particularly the theory of principal bundles on curves and Hecke correspondences. The paper develops the necessary framework of 1/2-measures (sections of half-canonical bundles) that carry a natural Hermitian structure, and defines Hecke operators via integration along Hecke correspondences.\n\nThe author shows that the main conjecture has non-trivial consequences: in the special case of projective lines with specific markings, it implies an earlier conjecture (Conjecture 16) about direct sum decompositions of measure spaces that are preserved by all Hecke operators. The paper suggests the Jacquet–Rallis relative trace formula might provide a proof strategy.",
  "tldr": "The paper proposes a conjecture that certain algebras of Hecke operators acting on measure spaces of division algebra bundles are canonically isomorphic, extending known results about division algebras over local fields."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `pass`

```json
{
  "claims": [
    {
      "assessment": "partially_supported",
      "claim": "The space M^L_E of G^L-invariant compactly supported measures on X^L_E carries a convolution algebra structure and embeds into End_{G^L_E}(S^L_E).",
      "evidence": "The claim is asserted without proof. The convolution structure presumes a compatible group/quotient structure on X^L_E = G^L_E/G^L, which is plausible since \\bar G^L_E acts; however no construction of the multiplication or verification of associativity is provided.",
      "id": "C1",
      "location": "Section 1.1, Claim 2",
      "severity": "minor",
      "suggested_fix": "Sketch the convolution: m_1 * m_2 (f)(x) = \\int m_1(g) m_2(g^{-1} x), and verify G^L-invariance and the embedding into End_{G^L_E}."
    },
    {
      "assessment": "partially_supported",
      "claim": "The subset Ξ ⊂ \\hat Ξ of powers of irreducible monic polynomials together with the point at infinity is closed.",
      "evidence": "No proof is given. Closedness in the one-point compactification requires that Ξ' = Ξ\\{∞} be closed in \\hat Ξ' ≅ F^n and that any sequence escaping every compact subset of \\hat Ξ' has ∞ as accumulation, which is automatic. Closedness of {P : P = Q^k for some irreducible Q, k≥1} in F^n is plausible (each stratum of fixed factorization type is constructible) but nontrivial — it is the complement of polynomials with at least two distinct irreducible factors.",
      "id": "C2",
      "location": "Section 1.1, Claim 4",
      "severity": "minor",
      "suggested_fix": "Provide a one-paragraph argument: show that if P_n → P in F^n and each P_n is a prime power, then P is a prime power (use continuity of resultants/discriminants and that the set of polynomials with at least two coprime factors of fixed degrees is open)."
    },
    {
      "assessment": "partially_supported",
      "claim": "The map π^L_E: \\bar X^L_E → Ξ_E sending x = l_+ + τ^{-1} l_- to N(u - l_- l_+^{-1}) (or ∞ if l_+ = 0) is a homeomorphism, well-defined modulo G^L on the left.",
      "evidence": "The proof verifies only that P_x(τ)P_x(-τ) ≠ 0 (using x ∈ G^L_E). It does not verify (a) G^L-invariance on the right (since \\bar X^L_E = \\bar G^L\\X^L_E here π is defined on the double-quotient \\bar G^L\\G^L_E/G^L, but the formula uses the decomposition l_+ + τ^{-1} l_- which is only G^L-equivariant on a specific side), (b) continuity, (c) properness/injectivity, (d) surjectivity onto Ξ_E, nor (e) the existence of a continuous inverse. The homeomorphism statement is load-bearing because Corollary 8 (canonical isomorphism of measure spaces M^L_E for all L) is derived from it.",
      "id": "C3",
      "location": "Section 1.1, Lemma/Construction 6 and Claim 7",
      "severity": "major",
      "suggested_fix": "Expand the proof: verify G^L-invariance on the quotient \\bar X^L_E, show the map is proper (preimages of compacts are compact), construct the inverse explicitly using the companion matrix of P, and check both maps are continuous in the p-adic topology."
    },
    {
      "assessment": "partially_supported",
      "claim": "For a fixed quadratic E/F, the vector spaces of the algebras M^L_E for different division F-algebras L of rank n are canonically isomorphic.",
      "evidence": "Follows from Claim 7 (the homeomorphism π^L_E: \\bar X^L_E → Ξ_E lands in a space Ξ_E independent of L). The vector-space isomorphism is canonical at the level of spaces of measures provided pushforward of measures is well-defined under the homeomorphism. The deduction is routine once Claim 7 is established, but it is not spelled out.",
      "id": "C4",
      "location": "Section 1.1, Corollary 8",
      "severity": "minor",
      "suggested_fix": "Add a one-line argument: pushforward along π^L_E identifies G^L-invariant measures on X^L_E with measures on Ξ_E, giving canonical isomorphisms M^L_E ≅ M(Ξ_E)."
    },
    {
      "assessment": "supported",
      "claim": "In the split case E = F ⊕ F the isomorphisms of Corollary 8 are algebra isomorphisms.",
      "evidence": "Attributed to [DKV] (Deligne–Kazhdan–Vignéras 1984), a standard reference proving the local Jacquet–Langlands correspondence via the trace formula. Within the surveyed framework, the asserted attribution is accurate.",
      "id": "C5",
      "location": "Section 1.1, Claim 9",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "The restriction π^L_{reg} of π^L_E to X^L_{E,reg} = (π^L_E)^{-1}(Ξ_{reg}) is smooth.",
      "evidence": "Stated without proof. Smoothness over the irreducible-polynomial locus is plausible (the fibers are conjugacy classes of regular semisimple elements with squarefree characteristic polynomial), but is asserted with no argument. Notation is also inconsistent (\"π^L_{ref}\" vs \"π^L_{reg}\", \"X_{E,,reg}^L\").",
      "id": "C6",
      "location": "Section 1.2, Claim 13",
      "severity": "minor",
      "suggested_fix": "Either supply a tangent-space computation (Jacobian of P_x(u) = N(u - l_- l_+^{-1}) is surjective when P is separable) or cite a known smoothness result for the characteristic-polynomial map on regular semisimple loci. Fix the typo."
    },
    {
      "assessment": "unsupported",
      "claim": "Conjecture 16 (eigendecomposition of S^L_E under the Hecke operators T_D^E(L), with dimensions d(i) and eigenvalues λ_i independent of L).",
      "evidence": "Labelled as a conjecture, which is appropriate. However the statement contains transcription errors that obscure the precise claim: 'd^E: I^I → ℕ' (should be I^E), 'λ^D_i' (likely λ^E_i), and 'D ∈ \\mathcal D' is undefined in this localised setting — the divisors live in Ξ_{reg}, not in the global \\mathcal D introduced later.",
      "id": "C7",
      "location": "Section 1.2, Conjecture 16",
      "severity": "info",
      "suggested_fix": "Fix the typos (I^I → I^E, λ^D_i → λ^E_i) and clarify the domain of λ_i (it should be Ξ_{reg} or its measure-algebra image in the local setting)."
    },
    {
      "assessment": "supported",
      "claim": "Let E be semistable on \\underline C with endomorphism a vanishing at one point c. Then a = 0.",
      "evidence": "The proof is correct and standard: a factors through E(-c), so a ∈ Hom(E, E(-c)); since E and E(-c) are semistable with μ(E(-c)) = μ(E) - deg(c) < μ(E), Hom vanishes (Harder–Narasimhan, cited [HN]).",
      "id": "C8",
      "location": "Section 2.1, Lemma 18",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "For any (E,i,ι) ∈ \\underline{Bun}^L(F), the base change E ⊗_F \\bar F is semistable.",
      "evidence": "Proof is correct: the Harder–Narasimhan filtration is canonical, hence Galois-stable and descends to F; it would give an L-invariant subbundle, contradicting irreducibility of the left regular L-representation on itself (L is a central division algebra, so L_L L = L is simple).",
      "id": "C9",
      "location": "Section 2.2, Lemma 22",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "(Corollary 23) (a) Bun_{ss}^L → Bun^L is a bijection; (b) endomorphisms of (E,i,ι) ∈ Bun^L(F) vanishing at one point are zero; (c) if M ≠ ∅, Bun_{ss}^L is a scheme.",
      "evidence": "Parts (a) and (b) follow directly from Lemmas 18 and 22 over F (and over \\bar F by Lemma 22). Part (c) (representability by a scheme when level structure is added at a nonempty divisor) is a standard rigidification argument but is asserted without proof or reference; it depends on the level structure ι rigidifying the automorphism group of (E,i).",
      "id": "C10",
      "location": "Section 2.2, Corollary 23",
      "severity": "minor",
      "suggested_fix": "Add a citation or short argument for (c): the level structure ι trivializes Aut(E,i)_{|M}, and combined with (b) implies trivial automorphism groups, giving an algebraic-space-which-is-a-scheme statement."
    },
    {
      "assessment": "partially_supported",
      "claim": "The line bundle \\mathcal L on Bun^L (Definition 24) is independent of φ and defined over F.",
      "evidence": "Stated without proof. Definition 24 itself is given twice (with apparent typographic corruption: 'det^{⊗n}(RΓ(\\bar C, \\bar E) ⊗ det^{-1}(RΓ(\\underline C, det(\\bar E)' is malformed and unbalanced). Independence of φ is plausible because det \\hat E descends to F via Galois twist arguments, but no such argument is given.",
      "id": "C11",
      "location": "Section 2.3, Claim 25",
      "severity": "minor",
      "suggested_fix": "Repair the formula in Definition 24 (balance parentheses, remove duplication) and add a one-line Galois-descent justification for independence of φ."
    },
    {
      "assessment": "supported",
      "claim": "There exists a canonical isomorphism \\mathcal L^{⊗ 2} → Ω_{Bun^L}.",
      "evidence": "Attributed to [BD] (Beilinson–Drinfeld, Quantization of Hitchin integrable systems). This is the standard square-root-of-canonical (Pfaffian / Theta) construction for moduli stacks of bundles. Attribution is accurate within standard usage.",
      "id": "C12",
      "location": "Section 2.3, Claim 26",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "The Hecke projections q_D, q_D' from \\mathcal H_D to Bun^L are smooth and proper.",
      "evidence": "Asserted without proof or reference. Smoothness and properness of Hecke correspondences for principal G-bundles on curves are well-known in the GL_n case (e.g., Beilinson–Drinfeld, Frenkel–Gaitsgory); the variant for inner forms (L^*) typically reduces to GL_n after base change. No reference is supplied here.",
      "id": "C13",
      "location": "Section 3.1, Claim 28",
      "severity": "minor",
      "suggested_fix": "Cite a Hecke-correspondence smoothness result (e.g., from [BD] or Heinloth's lectures on Bun_G) or sketch the argument: the fiber Z_E parametrises L-invariant locally free subsheaves with prescribed quotient, which forms a smooth proper variety (an affine Grassmannian slice)."
    },
    {
      "assessment": "partially_supported",
      "claim": "There exists a coordinate t on \\underline{\\mathbb P}^1 such that the divisor M of cardinality 2 is the set {±τ} with τ^2 ∈ F^*.",
      "evidence": "Stated without proof. Plausible by an F-rational Möbius transformation: any degree-2 reduced divisor on \\mathbb P^1_F is the vanishing locus of a monic degree-2 polynomial t^2 + bt + c with discriminant a = b^2 - 4c, and translation t ↦ t + b/2 puts it in the form t^2 = a/4 (after rescaling, in the form t^2 = a). The argument is routine but should be stated.",
      "id": "C14",
      "location": "Section 3.2, Claim 29",
      "severity": "minor",
      "suggested_fix": "Add: 'After an F-linear change of coordinate on \\mathbb P^1, we may take M to be cut out by t^2 - a for a ∈ F^*; set τ such that τ^2 = a.'"
    },
    {
      "assessment": "partially_supported",
      "claim": "(a) Any semistable \\underline G^L bundle on \\mathbb P^1 is isomorphic to \\mathcal O(r) ⊗ L for some r ∈ ℤ; (b) Bun_{ss,0} = \\underline X^L_E.",
      "evidence": "Part (a) is the L-twisted analogue of Grothendieck's classification of vector bundles on \\mathbb P^1: a semistable principal G^L-bundle (i.e., a vector bundle with L^op-action, where L is a central division F-algebra) has vector-bundle underlying \\hat E that must be balanced (semistable), and L-equivariance forces all summands to coincide. Argument is standard but not given. Part (b) (the identification with the local model X^L_E) requires the trivialisation at M = {±τ} to match up with the coset space G^L_E/G^L; this is the key bridge between the local Section 1 and the global Section 2–3 setup, and is asserted without verification.",
      "id": "C15",
      "location": "Section 3.2, Claim 31",
      "severity": "minor",
      "suggested_fix": "For (a), cite Grothendieck/Atiyah and explain how the L-action forces uniformity. For (b), exhibit the explicit map: a triple (\\mathcal O ⊗ L, i, ι) with ι: L ⊗ \\mathcal O_M → L × M corresponds to an element of L_E^* / L^*, recovering the definition of X^L_E."
    },
    {
      "assessment": "partially_supported",
      "claim": "(a) \\underline H_D(F) = H_D; (b) ω_x is the Gelfand–Leray form dx/da of Definition 14.",
      "evidence": "This is the bridge claim that makes Lemma 48 (Conjecture 47 ⇒ Conjecture 16) work, and is asserted without proof. Identification of F-points of the Hecke stack with the local correspondence H_D requires non-trivial Galois cohomology vanishing (H^1(F, G^L) considerations) and an explicit identification of fibres. Identification of ω_x with the Gelfand–Leray form requires unwinding the canonical isomorphism α_C of [BD] in the explicit P^1 coordinate system; the section provides no such unwinding.",
      "id": "C16",
      "location": "Section 3.2, Claim 33",
      "severity": "major",
      "suggested_fix": "Provide an explicit local computation in coordinates on \\mathbb P^1: write down a local section of \\Omega_{q_D}, restrict to a fibre, and compare with dx/da via the definition of the reduced norm. Alternatively, cite a precise prior reference verifying the comparison."
    },
    {
      "assessment": "supported",
      "claim": "For smooth q: H → X, q': H → X' with compact fibres, and α: q'^*(\\mathcal L') → Ω_q ⊗ q^*(\\mathcal L), there exists a unique operator T_H: C^∞(X', |\\mathcal L'|) → C^∞(X, |\\mathcal L|) with T_H(|s'|)(x) = ∫_{Z_x} |α(s')_{Z_x}|.",
      "evidence": "This is the standard integral-transform construction for half-density Hecke operators following Beilinson–Drinfeld / Braverman–Kazhdan ([BK] is cited in Definition 34). Compactness of fibres makes the integral converge; uniqueness is by point-evaluation. The construction is routine in this framework.",
      "id": "C17",
      "location": "Section 4.2, Claim 36",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "The Hecke operators T_D (D ∈ \\mathcal D) generate a commutative subalgebra \\mathcal H(L) of End(\\mathcal S^L).",
      "evidence": "Commutativity of Hecke operators at different divisors is a load-bearing claim for the conjecture (the eigendecomposition in Conjecture 47 requires it). For GL_n on a curve, commutativity is a classical result of Drinfeld; the variant for inner forms of GL_n (division-algebra-twisted Hecke algebras) is plausible by reduction to GL_n via base change to \\bar F, but is non-trivial and is here asserted without proof or reference. The notation '\\mathbb C^*-subalgebra' is also unclear — likely a typo for 'commutative \\mathbb C-subalgebra'.",
      "id": "C18",
      "location": "Section 4.3, Claim 46",
      "severity": "major",
      "suggested_fix": "Either cite a commutativity result for L-twisted Hecke algebras (e.g., reduction to the split case via Galois descent, or a Satake-style argument) or sketch the proof: the convolution of two divisorial correspondences is commutative because the underlying double-coset algebra at the formal disk is commutative (Satake isomorphism for inner forms)."
    },
    {
      "assessment": "unsupported",
      "claim": "Conjecture 47 (main): the Hecke subalgebras \\mathcal H(L) are canonically isomorphic across all division F-algebras L of rank n, with a common eigenvalue parametrisation (I, d, λ_i) and joint eigendecomposition \\mathcal S^L = ⊕_{i∈I} \\mathcal S^L(i).",
      "evidence": "Labelled as a conjecture. No evidence beyond consistency with Conjecture 16 (the local case, P^1, |M|=2) is provided. The reduction (Lemma 48) goes only one way: Conjecture 47 ⇒ Conjecture 16. The typo 'T_{D | \\mathcal S^i L(i)}' is malformed.",
      "id": "C19",
      "location": "Section 4.3, Conjecture 47",
      "severity": "info",
      "suggested_fix": "Fix the typographic error in the eigenvalue equation. Optionally, list any low-rank or low-genus checks (e.g., n=2, g=0, |M|=2) where the conjecture can be verified directly, even partially."
    },
    {
      "assessment": "partially_supported",
      "claim": "Lemma 48: the validity of Conjecture 47 in the case (C, M, D) of Claim 29 (\\mathbb P^1 with |M|=2, |D|=n) implies the validity of Conjecture 16.",
      "evidence": "The proof is 'Follows from Claim 33', i.e., from the identification of the global Hecke correspondence on \\mathbb P^1 (specialised at the given M and D) with the local operator T_D^E(L) of Definition 14. Since Claim 33 itself is asserted without proof (see C16), the implication is conditional. If Claim 33 holds, the implication is essentially immediate by inspection of definitions.",
      "id": "C20",
      "location": "Section 4.4, Lemma 48",
      "severity": "minor",
      "suggested_fix": "Make the proof self-contained by inlining the explicit identification of \\mathcal S^L (in the \\mathbb P^1, |M|=2 case) with \\mathcal S^L_E and of T_{\\underline D} with T_D^E(L), referencing the parts of Claim 31 and Claim 33 that are used."
    },
    {
      "assessment": "partially_supported",
      "claim": "Bibliographic / typographic integrity of the paper supports verifiability of the technical chain.",
      "evidence": "Multiple formula-level typographic errors compromise verifiability: Definition 24's formula for \\mathcal L is duplicated and unbalanced ('det^{⊗n}(RΓ(\\bar C, \\bar E)) ⊗ det^{-1}(RΓ(\\underline C, det(\\bar E))' lacks closing parentheses); Conjecture 16 uses 'I^I' instead of 'I^E' and 'λ^D_i' where 'λ^E_i' is meant; Claim 13 writes 'π^L_{ref}' for 'π^L_{reg}'; Conjecture 47 writes 'T_{D | \\mathcal S^i L(i)}'; Definition 27.5 ends with 'α_{\\underline C}' but later Claim 33 refers to it without the subscript; reference [@DKV] is mis-spelt 'cintained' as 'contained'; reference cluster includes 'betIen' (between) and 'bundled on curved' (bundles on curves). These do not invalidate the mathematics but materially impede claim-by-claim verification.",
      "id": "C21",
      "location": "throughout (Definitions 24, 27, 32; Conjectures 16, 47)",
      "severity": "minor",
      "suggested_fix": "Run a careful proof-reading pass focusing on subscript/superscript balance, parenthesis matching, and consistent naming of indexing sets and maps."
    },
    {
      "assessment": "unsupported",
      "claim": "Computer-verifiable formalisation of the conjectures' framework (in Lean/Coq/Agda) or numerical/symbolic verification of finite-rank instances (e.g., n=2, F = \\mathbb Q_p) is provided.",
      "evidence": "This is a pure-mathematics paper in code-amenable fields (math.RT, math.NT, math.AG). Per the proof-as-code axiom for such fields: load-bearing structural claims (e.g., Claim 7's homeomorphism, Claim 31's classification, Claim 33's identification of Gelfand–Leray forms, Claim 46's commutativity) admit either symbolic/computer-algebra verification (e.g., explicit P^1 computations in SageMath/Pari for n=2 or n=3) or formalisation in a proof assistant. No accompanying repository, scripts, or formal artifacts are referenced. While the paper's primary content is conjectural and a full formalisation is unrealistic, finite-rank symbolic checks of the local identification π^L_E and the Hecke commutativity at n=2 would substantially strengthen confidence.",
      "id": "C22",
      "location": "entire paper (no accompanying artifact)",
      "severity": "major",
      "suggested_fix": "Provide a small companion artifact (e.g., experiments/n2_p3/local_hecke.sage or src/verification/Hecke_n2.lean) implementing the n=2 local case: build \\mathcal S^L_E for the two rank-2 division algebras over \\mathbb Q_p (split and non-split quaternion), compute T_D for several D, and numerically verify the asserted spectral coincidence (Conjecture 16, n=2) for at least one quadratic E/F."
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

1. BD: A.Beilinson, V.Drinfeld {\em Quantization of Hitchin integrable systems}
2. BK: A.Braverman, D.Kazhdan, {\em Automorphic functions on moduli spaces of bundled on curved over local fields: a survey} Proceedings of the International Congress of Mathematicians 2022, EMS Press, 2023, pp. 797–823.
3. DKV: P.Deligne, D. Kazhdan, M.-F.Vignéras, {\em Représentations des algèbres centrales simples p-adiques} Représentations des groupes réductifs sur un corps local, Travaux en Cours, Hermann, Paris, 1984.
4. HN: G.Harder, M.Narasimhan, {\em Vector Bundles on Curves, and On the Cohomology Groups of Moduli Spaces of Vector Bundles on Curves}, Math. Ann. 212 (1975)
5. HK: E.Hrushovski, D.Kazhdan {\em Motivic Poisson summation} Moscow Mathematical Journal 9 (2009), no. 3, 569–623.
6. L: J.Leray, {\em Le calcul différentiel et intégral sur une variété analytique complexe} Bulletin de la Société Mathématique de France, 87, 81–180, (1959).
7. W: A.Weil {\em Basic Number Theory} 1967 by Springer

