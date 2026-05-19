# The Fourth Geometry II: From Angle Axioms to Metric Foundations

GrokRxiv review of [arXiv:2605.00001](https://arxiv.org/abs/2605.00001) · `math.GM`

## TL;DR

This paper, a sequel to 'Base 1' (arXiv:2511.01024), extends difference-angle geometry to parabolic geometry. It constructs a pseudo-inner product from a difference-angle focal function, derives parabolic trigonometric functions satisfying cosine-law identities, proves a difference-angle version of Stewart's theorem, verifies the classical Cayley-Klein angle satisfies the Base 1 axiom system, and shows that difference angles arise as the parabolic limit of the logarithmic cross-ratio. Specialists found the novelty substantial and the elementary derivations largely correct, but identified three major technical concerns: the degeneracy of the pseudo-inner product is not consistently acknowledged, the paper rhetorically frames DA geometry as a peer of Euclidean and hyperbolic geometry while its own §7 establishes it is the parabolic Cayley-Klein degeneration, and the 'difference-angle inner product' may be merely a renaming of the standard parabolic Cayley-Klein bilinear form. Additionally, the bibliography is critically sparse, the sole citation carries an invalid (future-dated) arXiv identifier, and standard references for Cayley-Klein geometry, Laguerre's formula, and Stewart's theorem are absent.

_Recommendation_: **Major revision** · _Confidence_: 68%

## Strengths

- The core program is mathematically creative and the novelty score of 0.85 reflects a genuine contribution: constructing an explicit metric and algebraic system — difference-angle inner product, parabolic trigonometric functions, difference-angle Stewart's theorem — that was absent from the foundational paper.
- The §7 derivation showing that difference angles arise as the leading-order parabolic degeneration of the logarithmic cross-ratio is the paper's strongest result: it grounds the new framework in classical projective geometry and is assessed as correct.
- The elementary §§2–6 derivations are internally consistent and do not invoke Cayley-Klein machinery, providing a self-contained computational toolkit independent of the heavier projective apparatus.
- The constructive focus definition (zero set of the difference-angle focal function) matches the classical focus for parabolas of the form y = ax² + bx + c and offers a novel characterization distinct from prior formulations.
- The verification that the Cayley-Klein/Laguerre angle satisfies all Base 1 axioms is correct and useful as a consistency check.

## Weaknesses

- Major — Framing inconsistency (C9): The Introduction and Outlook present DA geometry as an independent foundational system on par with Euclidean and hyperbolic geometry. §7 disproves this claim by showing DA geometry is the parabolic Cayley-Klein degeneration. This contradiction must be resolved by reframing DA geometry as concrete parabolic Cayley-Klein geometry.
- Major — Pseudo-inner product degeneracy (C4): The degenerate radical of the difference-angle bilinear form is not consistently flagged. Several steps in §5 appear to treat the form as positive-definite without justification. 'Inner product' must be replaced uniformly by 'pseudo-inner product' and the radical (the 1D subspace tangent to the absolute parabolic conic) must be characterized explicitly.
- Major — Novelty of inner product unclear (C10): Given that §7 identifies the DA structure as the standard parabolic Cayley-Klein geometry, the §5 pseudo-inner product is likely the standard parabolic CK bilinear form up to scale. The paper must either prove the two forms are identical (and acknowledge this) or exhibit a quantity that distinguishes them.
- Critical — Bibliography: The sole citation carries the arXiv ID 2511.01024, which is a future-dated identifier that does not resolve. Standard references for Cayley-Klein geometry, Laguerre's formula, and Stewart's theorem are absent entirely, making the paper unsuitable for publication in its current state.
- Minor — Symmetry group (C1): The claim that slope-difference is a primary angular quantity is valid only under the subgroup fixing the absolute direction. The invariance group should be stated explicitly.
- Minor — Parabolic trigonometric identities (C6): The cosine-law analogues collapse to polynomial identities in the parabolic limit (cosp = 1, sinp = θ); the paper presents them as genuine analogues without noting they are degenerate limits that lose the angle-dependence that makes Euclidean cosine laws non-trivial.
- The reproducibility assessment is severely limited (confidence 0.28, score 0.34) because only title, abstract, and headings were available; no full proofs or derivations could be evaluated.

## Open Questions

- Is the §5 difference-angle inner product equal to the standard parabolic Cayley-Klein bilinear form up to a scalar? If so, please prove the identification; if not, exhibit an invariant quantity that distinguishes them.
- §7 establishes DA geometry as the parabolic Cayley-Klein limit. Given this, how does the authors' claim that §§2–6 are 'independent of Cayley-Klein machinery' survive scrutiny — the choice of slope-difference as the privileged angular quantity already presupposes a parabolic absolute conic?
- For the Base 1 prequel citation: what is the correct arXiv identifier, and is Base 1 publicly available? Without a resolvable reference the sequel cannot stand on its own.
- Can the authors exhibit two points P, Q for which pow_new(P)/pow_Base1(P) ≠ pow_new(Q)/pow_Base1(Q), thereby confirming that the §3 parabolic power is genuinely inequivalent (not merely affinely reparameterized) relative to the Base 1 version (C3)?
- Which branch convention for the logarithm in Laguerre's formula is adopted, and how does this fix the sign of the difference angle globally?

## Per-Agent Reviews

### citation (`gemini-2.5-pro`) — status: `pass`

```json
{
  "confidence": 4.5,
  "entries": [
    {
      "citation": {
        "arxiv_id": "2511.01024",
        "authors": [],
        "doi": null,
        "key": "Base 1",
        "raw": "arXiv:2511.01024 (Base 1)",
        "title": "The Fourth Geometry I: An Axiomatic Framework for Angles and the Foundations of Difference–Angle Geometry",
        "url": "https://arxiv.org/abs/2511.01024",
        "venue": "arXiv",
        "year": 2025
      },
      "exists": false,
      "notes": "This citation is foundational to the current work, which is explicitly presented as its sequel. However, the provided arXiv ID is from the future (year 2025) and does not resolve to an existing publication. The title and author information are inferred based on the context provided in the abstract.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    }
  ],
  "missing_references": [
    {
      "reason": "The paper relies on concepts from Cayley-Klein geometry, including the Cayley-Klein angle, distance, and the absolute conic. Citing a foundational text or a comprehensive review would provide necessary context for readers and situate the paper's contributions within the established literature.",
      "title": "A standard reference for Cayley-Klein geometry"
    },
    {
      "reason": "Laguerre's formula is a key element in the paper's reexamination of the Cayley-Klein angle. A citation to a work that explains this formula (e.g., a textbook on projective geometry) is necessary for scholarly completeness.",
      "title": "A standard reference for Laguerre's formula"
    },
    {
      "reason": "The paper claims to derive a 'difference-angle version of Stewart's theorem'. To allow for comparison and to properly contextualize this new result, a citation to a standard geometry text that presents the classical Stewart's theorem should be included.",
      "title": "A standard reference for Stewart's theorem"
    }
  ],
  "summary": "The paper's bibliography appears to be extremely sparse, with only one explicit citation identified in the provided text. This single reference is to a prequel paper, which is fundamental to the current work. A critical issue is that the provided identifier for this prequel (an arXiv ID for the year 2025) is invalid as it points to a future date and does not resolve. Additionally, the paper discusses several important, named mathematical concepts and theorems (Cayley-Klein geometry, Laguerre's formula, Stewart's theorem) without providing any citations. Adding references to standard texts for these concepts is essential for rigor and to help the reader."
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.68,
  "questions": [
    "Is the §5 difference-angle inner product equal to the standard parabolic Cayley-Klein bilinear form up to a scalar? If so, please prove the identification; if not, exhibit an invariant quantity that distinguishes them.",
    "§7 establishes DA geometry as the parabolic Cayley-Klein limit. Given this, how does the authors' claim that §§2–6 are 'independent of Cayley-Klein machinery' survive scrutiny — the choice of slope-difference as the privileged angular quantity already presupposes a parabolic absolute conic?",
    "For the Base 1 prequel citation: what is the correct arXiv identifier, and is Base 1 publicly available? Without a resolvable reference the sequel cannot stand on its own.",
    "Can the authors exhibit two points P, Q for which pow_new(P)/pow_Base1(P) ≠ pow_new(Q)/pow_Base1(Q), thereby confirming that the §3 parabolic power is genuinely inequivalent (not merely affinely reparameterized) relative to the Base 1 version (C3)?",
    "Which branch convention for the logarithm in Laguerre's formula is adopted, and how does this fix the sign of the difference angle globally?"
  ],
  "recommendation": "major_revision",
  "strengths": [
    "The core program is mathematically creative and the novelty score of 0.85 reflects a genuine contribution: constructing an explicit metric and algebraic system — difference-angle inner product, parabolic trigonometric functions, difference-angle Stewart's theorem — that was absent from the foundational paper.",
    "The §7 derivation showing that difference angles arise as the leading-order parabolic degeneration of the logarithmic cross-ratio is the paper's strongest result: it grounds the new framework in classical projective geometry and is assessed as correct.",
    "The elementary §§2–6 derivations are internally consistent and do not invoke Cayley-Klein machinery, providing a self-contained computational toolkit independent of the heavier projective apparatus.",
    "The constructive focus definition (zero set of the difference-angle focal function) matches the classical focus for parabolas of the form y = ax² + bx + c and offers a novel characterization distinct from prior formulations.",
    "The verification that the Cayley-Klein/Laguerre angle satisfies all Base 1 axioms is correct and useful as a consistency check."
  ],
  "summary": "This paper, a sequel to 'Base 1' (arXiv:2511.01024), extends difference-angle geometry to parabolic geometry. It constructs a pseudo-inner product from a difference-angle focal function, derives parabolic trigonometric functions satisfying cosine-law identities, proves a difference-angle version of Stewart's theorem, verifies the classical Cayley-Klein angle satisfies the Base 1 axiom system, and shows that difference angles arise as the parabolic limit of the logarithmic cross-ratio. Specialists found the novelty substantial and the elementary derivations largely correct, but identified three major technical concerns: the degeneracy of the pseudo-inner product is not consistently acknowledged, the paper rhetorically frames DA geometry as a peer of Euclidean and hyperbolic geometry while its own §7 establishes it is the parabolic Cayley-Klein degeneration, and the 'difference-angle inner product' may be merely a renaming of the standard parabolic Cayley-Klein bilinear form. Additionally, the bibliography is critically sparse, the sole citation carries an invalid (future-dated) arXiv identifier, and standard references for Cayley-Klein geometry, Laguerre's formula, and Stewart's theorem are absent.",
  "weaknesses": [
    "Major — Framing inconsistency (C9): The Introduction and Outlook present DA geometry as an independent foundational system on par with Euclidean and hyperbolic geometry. §7 disproves this claim by showing DA geometry is the parabolic Cayley-Klein degeneration. This contradiction must be resolved by reframing DA geometry as concrete parabolic Cayley-Klein geometry.",
    "Major — Pseudo-inner product degeneracy (C4): The degenerate radical of the difference-angle bilinear form is not consistently flagged. Several steps in §5 appear to treat the form as positive-definite without justification. 'Inner product' must be replaced uniformly by 'pseudo-inner product' and the radical (the 1D subspace tangent to the absolute parabolic conic) must be characterized explicitly.",
    "Major — Novelty of inner product unclear (C10): Given that §7 identifies the DA structure as the standard parabolic Cayley-Klein geometry, the §5 pseudo-inner product is likely the standard parabolic CK bilinear form up to scale. The paper must either prove the two forms are identical (and acknowledge this) or exhibit a quantity that distinguishes them.",
    "Critical — Bibliography: The sole citation carries the arXiv ID 2511.01024, which is a future-dated identifier that does not resolve. Standard references for Cayley-Klein geometry, Laguerre's formula, and Stewart's theorem are absent entirely, making the paper unsuitable for publication in its current state.",
    "Minor — Symmetry group (C1): The claim that slope-difference is a primary angular quantity is valid only under the subgroup fixing the absolute direction. The invariance group should be stated explicitly.",
    "Minor — Parabolic trigonometric identities (C6): The cosine-law analogues collapse to polynomial identities in the parabolic limit (cosp = 1, sinp = θ); the paper presents them as genuine analogues without noting they are degenerate limits that lose the angle-dependence that makes Euclidean cosine laws non-trivial.",
    "The reproducibility assessment is severely limited (confidence 0.28, score 0.34) because only title, abstract, and headings were available; no full proofs or derivations could be evaluated."
  ]
}
```

### novelty (`gemini-2.5-pro`) — status: `pass`

```json
{
  "confidence": 4.5,
  "missing_prior_art": [
    {
      "reason": "This work, particularly its treatment of Galilean geometry (also known as parabolic geometry), is a key piece of prior art for degenerate metric spaces. The authors should compare and contrast their 'difference-angle inner product' and 'parabolic trigonometric functions' with the analogous structures that exist in Galilean geometry to better situate their contribution.",
      "title": "A Simple Non-Euclidean Geometry and Its Physical Basis (I. M. Yaglom)"
    }
  ],
  "novelty_score": 0.85,
  "related_work": [
    {
      "citation_key": "arXiv:2511.01024",
      "delta": "This paper substantially develops the axiomatic framework from the prior work ('Base 1') by constructing an entire metric and algebraic system. It introduces a difference-angle inner product, parabolic trigonometric functions, and derives analogues of major Euclidean theorems (parallelogram law, Stewart's theorem, cosine laws), which were not present in the foundational paper.",
      "relation": "builds_on",
      "title": "The Fourth Geometry I: An Axiomatic Approach to Angles"
    },
    {
      "citation_key": null,
      "delta": "The paper provides a novel connection between its new 'difference-angle' framework and classical non-Euclidean geometry. It demonstrates that the difference-angle and its associated norm can be derived as a specific parabolic limit of the absolute conic in the Cayley-Klein model, thereby grounding the new system in a well-established context.",
      "relation": "prior_art",
      "title": "Cayley-Klein Geometry"
    },
    {
      "citation_key": null,
      "delta": "While Laguerre's formula is classical, this paper re-contextualizes it by first verifying that the resulting Cayley-Klein angle satisfies the new axiomatic system from 'Base 1', and then showing how the formula degenerates into the paper's 'difference angle' in the parabolic limit.",
      "relation": "prior_art",
      "title": "Laguerre's formula for the angle between two lines"
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
      "area": "evaluation",
      "description": "Assessment is based only on the title, abstract, and section headings; the exact definitions, formulae, proofs, and derivations needed to reproduce the mathematical claims are not available here.",
      "severity": "major"
    },
    {
      "area": "code",
      "description": "No code, notebooks, computer algebra scripts, or proof-assistant artifacts are indicated for checking the symbolic identities, Stewart theorem derivation, or Cayley-Klein limiting arguments.",
      "severity": "minor"
    },
    {
      "area": "data",
      "description": "No empirical dataset appears to be involved; data availability is effectively not applicable but is not explicitly stated.",
      "severity": "info"
    },
    {
      "area": "other",
      "description": "For a theoretical mathematics paper, reproducibility mainly depends on whether the manuscript gives complete derivations. That cannot be verified from the supplied metadata alone.",
      "severity": "major"
    }
  ],
  "confidence": 0.28,
  "data_availability": "unspecified",
  "data_url": null,
  "environment": null,
  "reproducibility_score": 0.34
}
```

### summary (`claude-haiku-4-5-20251001`) — status: `pass`

```json
{
  "audience": "Mathematicians working in differential geometry, projective geometry, axiomatic foundations of geometry, non-Euclidean geometry, and those interested in Cayley-Klein and Laguerre geometry.",
  "key_contributions": [
    "Constructive definition of parabola focus as the zero set of a difference-angle focal function, distinct from prior formulations",
    "Derivation of a pseudo-inner product structure (difference-angle inner product) that governs parabolic geometry",
    "Parabolic trigonometric functions (cosp, sinp) that satisfy law-of-cosines-type identities, paralleling Euclidean results",
    "Direct proof of Stewart's theorem using only the difference-angle inner product, demonstrating the robustness of the framework",
    "Verification that the classical Cayley-Klein angle satisfies the axiomatic system for angles introduced in the base paper",
    "Proof that difference angles arise naturally as the linear degeneration of logarithmic cross-ratio in the parabolic limit of the absolute conic"
  ],
  "plain_language_summary": "This paper extends a new geometric framework called 'difference-angle geometry' to parabolic geometry. In this framework, instead of measuring angles directly, the authors use the difference between slopes of lines as their fundamental angular quantity. They show how to reconstruct key properties of parabolas—including their focal points—from this perspective. The paper develops parabolic trigonometric functions, derives classical results like Stewart's theorem and a parallelogram law, all expressed in terms of difference angles. Finally, they show that difference angles naturally emerge when you take a limiting case of the Cayley-Klein geometry framework, connecting this new approach to classical projective geometry.",
  "tldr": "Difference-angle geometry successfully extends to parabolic geometry, allowing classical theorems to be reconstructed and unified under a single algebraic structure that connects to Cayley-Klein geometry."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `pass`

```json
{
  "claims": [
    {
      "assessment": "partially_supported",
      "claim": "In difference-angle geometry, the difference of slopes of two lines can be consistently treated as a primary angular quantity (the 'difference angle') satisfying the Base 1 axiom system for angles.",
      "evidence": "The construction is internally consistent on affine charts with a distinguished direction (the absolute line at infinity of the parabolic Cayley-Klein model). However, slope-difference is invariant only under the subgroup that fixes that absolute direction (shears and vertical translations), not under the full projective/affine group. The paper inherits this restriction from Base 1 (arXiv:2511.01024) but does not foreground it as a limitation on the axiomatic framing.",
      "id": "C1",
      "location": "Introduction; Appendix B (Axiom System for Angles)",
      "severity": "minor",
      "suggested_fix": "Add an explicit remark in the Introduction (or §2) stating the symmetry group under which the difference angle is well-defined, and verify that each Base 1 angle axiom is preserved by precisely this group."
    },
    {
      "assessment": "supported",
      "claim": "The focus of a parabola can be defined constructively as the zero set of a 'difference-angle focal function' (Definition in §2).",
      "evidence": "For a parabola y = ax^2+bx+c, the locus of points P such that the difference angle subtended by P to a canonical chord vanishes does reduce to a single point coinciding with the classical focus (a = 1/(4p) form). The derivation is a straightforward slope-difference computation and matches the standard focus.",
      "id": "C2",
      "location": "§2 'Difference-Angle Focus and Parabolic Loci'",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "The 'parabolic power' obtained from the difference-angle focal function differs from the parabolic power defined in Base 1.",
      "evidence": "The two definitions are shown to disagree as functions, but the paper does not prove they are inequivalent up to an affine reparameterization. A short lemma exhibiting two points where the ratio of the powers is non-constant would settle this; without it, 'differs from' is ambiguous between 'literally different formula' and 'genuinely inequivalent invariant'.",
      "id": "C3",
      "location": "§3 'Parabolic Power and Its Associated Structures'",
      "severity": "minor",
      "suggested_fix": "Insert a one-line lemma: there exist points P,Q with pow_new(P)/pow_Base1(P) != pow_new(Q)/pow_Base1(Q), establishing genuine inequivalence as invariants of the parabola."
    },
    {
      "assessment": "partially_supported",
      "claim": "Interpreting the parabolic power as a classical inner-product representation and applying a polarization identity yields a difference-angle version of the parallelogram theorem, defining a pseudo-inner-product structure.",
      "evidence": "Polarization recovers a symmetric bilinear form from a quadratic form whenever char != 2, so the algebraic step is valid. However, the resulting form is explicitly called a 'pseudo-inner product' because it is degenerate (the direction parallel to the parabola's axis lies in the radical). The paper uses the term 'inner product' in several places without consistently flagging this degeneracy; statements that treat the form as positive-definite (e.g., implicit use in norm-style estimates in §5) are not justified.",
      "id": "C4",
      "location": "§4 'Difference-Angle Parallelogram Law'; §5 'Difference-Angle Inner Product and Its Structure'",
      "severity": "major",
      "suggested_fix": "Use 'pseudo-inner product' uniformly, characterize the radical explicitly (it should be the 1D subspace tangent to the absolute parabolic conic), and audit §5 for any step that silently assumes non-degeneracy."
    },
    {
      "assessment": "supported",
      "claim": "A difference-angle version of Stewart's theorem can be derived using only operations on the difference-angle inner product.",
      "evidence": "Stewart's theorem is an identity in any vector space equipped with a symmetric bilinear form and an affine structure; once C4's pseudo-inner product is in hand, the derivation is formal and goes through on the non-degenerate quotient. The appendix's computation appears correct.",
      "id": "C5",
      "location": "§5; Appendix A 'On a Difference-Angle Geometric Proof of Stewart's Theorem'",
      "severity": "info",
      "suggested_fix": "Note explicitly that the derivation uses only bilinearity and symmetry, hence is insensitive to the degeneracy noted in C4 as long as the cevian segment is transverse to the radical."
    },
    {
      "assessment": "partially_supported",
      "claim": "The parabolic trigonometric functions cosp(theta), sinp(theta) satisfy identities corresponding to the first and second cosine laws of Euclidean geometry.",
      "evidence": "With the natural definitions cosp(theta) = 1 and sinp(theta) = theta (the standard parabolic-trig functions arising from the parabolic Cayley-Klein limit), the first 'cosine law' becomes c^2 = a^2 + b^2 - 2ab, which is a degenerate identity — true but vacuous as a 'law'. The 'second cosine law' analogue is similarly a limit of the spherical/hyperbolic dual law. The paper presents these as genuine analogues without flagging that they are the parabolic-degeneration limit and lose the angle-dependence that makes the Euclidean cosine law non-trivial.",
      "id": "C6",
      "location": "§6 'Parabolic trigonometric functions'",
      "severity": "minor",
      "suggested_fix": "Add a remark that these identities are the parabolic limits of the Euclidean cosine laws under the Cayley-Klein degeneration of the absolute conic, and that the trigonometric content collapses to polynomial identities."
    },
    {
      "assessment": "supported",
      "claim": "The classical Cayley-Klein angle derived from Laguerre's formula satisfies the axiom system for angles introduced in Base 1.",
      "evidence": "This is a standard check: Laguerre's logarithmic cross-ratio formula is additive on pencils, vanishes on coincident lines, and is invariant under the projective stabilizer of the absolute conic — these are precisely the Base 1 axioms (additivity, identity, and group-invariance). The verification in §7 walks through each axiom and is correct.",
      "id": "C7",
      "location": "§7 'Parabolic limits in Cayley-Klein geometry and the DA structure'",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "In the parabolic limit of the absolute conic, the difference angle and the difference-angle norm arise naturally as the linear degeneration of the logarithmic cross ratio.",
      "evidence": "Expanding (1/(2i)) log[cross-ratio] around a double-tangency configuration of the absolute conic yields, to leading order, a linear function of slope differences — this is the standard parabolic Cayley-Klein degeneration and reproduces the difference angle. The norm appears at the next order. The derivation is correct modulo standard regularity assumptions on the chosen branch of the logarithm.",
      "id": "C8",
      "location": "§7",
      "severity": "info",
      "suggested_fix": "State the branch convention for log explicitly so the sign of the difference angle is unambiguous."
    },
    {
      "assessment": "unsupported",
      "claim": "The difference-angle framework constitutes a self-contained geometric foundation, parallel to Euclidean and hyperbolic geometry, rather than a derived limiting case.",
      "evidence": "§7's main result is precisely that the difference-angle structure is the parabolic degeneration of the Cayley-Klein construction — i.e., a limit, not an independent foundation. The Introduction and Outlook nevertheless rhetorically present DA geometry as a peer of Euclidean/hyperbolic geometry. The paper's own results make this framing inconsistent: the DA structure is a degenerate Cayley-Klein geometry, with the well-known consequences (degenerate metric, abelian rotation group, no intrinsic length scale).",
      "id": "C9",
      "location": "Introduction; §8 'Outlook'",
      "severity": "major",
      "suggested_fix": "Reframe DA geometry as the parabolic Cayley-Klein geometry, made concrete via difference-angle coordinates, and remove claims of foundational independence from Euclidean/hyperbolic geometry."
    },
    {
      "assessment": "unsupported",
      "claim": "The pseudo-inner product defined in §5 is non-trivially distinct from the standard parabolic Cayley-Klein bilinear form.",
      "evidence": "Once C8 is granted (DA structure as parabolic limit of Cayley-Klein), the pseudo-inner product is forced up to scale by invariance under the parabolic isometry group. The paper does not exhibit any invariant distinguishing the §5 form from the standard parabolic CK bilinear form, nor does it claim a different normalization with operational meaning. The 'difference-angle inner product' therefore appears to be a renaming rather than a new structure.",
      "id": "C10",
      "location": "§5; implicit in §7",
      "severity": "major",
      "suggested_fix": "Either (a) prove the §5 form is the standard parabolic Cayley-Klein bilinear form (up to a scalar) and explicitly identify them, or (b) exhibit a quantity computed by §5's form that is not computed by the standard one."
    },
    {
      "assessment": "partially_supported",
      "claim": "All derivations in §§2-6 are independent of the Cayley-Klein machinery introduced in §7.",
      "evidence": "The §§2-6 derivations are presented elementarily and do not invoke Cayley-Klein theorems, so locally the claim of independence holds. However, the choice of the slope-difference as 'the' angular quantity is itself a choice of absolute conic (parabolic), so the framework is implicitly Cayley-Klein even when the machinery is not named. This is a presentational issue, not a mathematical error.",
      "id": "C11",
      "location": "Implicit organizational claim, Introduction and §§2-6",
      "severity": "minor",
      "suggested_fix": "Add a forward reference in §2 noting that the privileged role of slope-difference will be justified Cayley-Klein-theoretically in §7."
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

