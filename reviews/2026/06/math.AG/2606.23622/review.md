# On Moduli spaces of vector bundles on $K3^{[n]}$-type IHS manifolds

GrokRxiv review of [arXiv:2606.23622](https://arxiv.org/abs/2606.23622) · `math.AG`

_Authors_: Nicolò Bignami, Ludovica Buelli, Irene Macías Tarrío, Roberto Vacca, Vanja Zuliani

## TL;DR

The paper generalizes O'Grady's K3^[2]-type construction to all K3^[n]-type IHS manifolds, proving that under explicit numerical conditions connected components of Gieseker-semistable moduli spaces of modular vector bundles are themselves IHS manifolds admitting Fourier-Mukai derived equivalences and rational Hodge isometries with the original manifold. The technical-correctness specialist (confidence 0.55) assessed overall correctness as mostly_sound but identified four major-severity gaps: the main theorem's lattice-theoretic closure (C1), universal slope stability of every fibre E_x (C5), transport of the Fourier-Mukai equivalence along generic diagonal twistor paths (C12), and total absence of executable verification of the admissibility conditions (C13, assessed unsupported). The reproducibility specialist (confidence 0.88) raised a critical concern: no machine-checkable proof artifact exists for the headline Theorem 37/Theorem 1 in a math.AG submission in the code-amenable set. Two specialist reviews (novelty, citation) failed due to a Gemini authentication error; their zero-confidence outputs are pipeline failures and carry no evidential weight for or against the paper. Per the recommendation gate for math.* fields with a critical-severity missing proof-as-code artifact on the headline theorem, the recommendation defaults to major_revision.

_Recommendation_: **Major revision** · _Confidence_: 62%

## Strengths

- The construction genuinely extends O'Grady's K3^[2]-type theory to all even-dimensional K3^[n]-type IHS manifolds, producing IHS manifolds and derived equivalences in a unified framework that applies across infinitely many deformation classes.
- Explicit, computable arithmetic conditions on the rank r and divisibility class div(w) are derived via Markman's monodromy invariant ell(w) and Eichler's criterion, making the construction checkable for concrete numerical input.
- The Fourier-Mukai equivalence, the rational Hodge isometry, and the moduli-space identification follow from a single universal family construction, giving the argument structural economy.
- The Chern invariant formulas (rank r^n n!, first Chern class, discriminant) are grounded in multiple Markman–O'Grady references, and the supported claims in the technical review confirm internal arithmetic consistency.
- Concrete corollaries for the three classically studied complete K3^[2]-type families (Beauville-Donagi, Debarre-Voisin, Iliev-Ranestad) demonstrate immediate geometric applicability of the general theory.

## Weaknesses

- The slope stability of every fibre E_x = E|_{{x}×Y} — the critical new step distinguishing the result from polystability — is not self-contained in the reviewed text; it is unclear whether the argument uses openness-plus-properness or an additional hyperholomorphic-symmetry step (C5, major).
- Transport of the Fourier-Mukai equivalence D^b(X)→D^b(Y) along generic diagonal twistor paths is asserted as part of 'Markman's package' without citing the specific proposition that handles the twisted-untwisted Brauer-class vanishing required by the divisibility hypotheses of Section 1.5 (C12, major).
- No executable certificate for the three numerical admissibility conditions (odd and even div(w)) is provided; Section 2 lattice-theoretic case checks are prose only, with no accompanying Sage/Magma/PARI/Lean script (C13, unsupported, major; reproducibility critical).
- The headline Theorem 37/Theorem 1 lacks any machine-checkable proof artifact; the reproducibility specialist (confidence 0.88) flags this as critical for a math.AG submission in the code-amenable set.
- The genericity assumption in Corollary 4 ('for generic Y in {}^n M_m^{(gamma)}') is not quantified; the excluded locus is not shown to have positive codimension in the moduli of polarised manifolds, leaving the corollary's scope unclear (C6, minor).
- The explicit verification that each of the three Corollary 5 classical cases satisfies the even div(w) conditions of Theorem 1 is deferred without a numerical table or computation (C7, minor).
- The novelty and citation specialist reviews failed due to a pipeline authentication error, leaving prior-art placement and reference validity unassessed; the completeness of this overall review is accordingly reduced.

## Revision Targets

- [ ] **Manuscript: Idea of proof in Introduction; Section 3 (proof of Thm 37)**
  - Location: `corrections/2606.23622/paper.tex` at `Idea of proof in Introduction; Section 3 (proof of Thm 37)`
  - Evidence: The argument is sketched as 'exploiting the symmetries of the Hermite-Einstein connection on End(E)' and uses the variation of slope stability across the Kahler cone collected in an appendix. Establishing universal slope stability of the family E_x as x ranges over X (as opposed to generic stability or polystability), together with the existence of a single polarisation H that works uniformly, is the most delicate step and the only one not directly imported from prior literature. Without access to the appendix in the visible excerpt, the chain from polystability of End(E) to slope stability of each fibre E_x is not verifiable.
  - Required change: Make the role of the Kahler-cone-wide stability variation appendix explicit, and state precisely whether slope stability for all x follows by openness + properness or by an extra hyperholomorphic symmetry argument; cite the exact prior result (e.g. ogrady-moduli-sheaves-hk Cor 2.1.5 or markman Prop 5.22) that closes the gap.
  - Verification: Re-review should confirm `Idea of proof in Introduction; Section 3 (proof of Thm 37)` is corrected or justified.
- [ ] **Manuscript: Theorem 1 part (3); Section 3**
  - Location: `corrections/2606.23622/paper.tex` at `Theorem 1 part (3); Section 3`
  - Evidence: Asserted as 'part of Markman's package (markman)'. The Fourier-Mukai equivalence for a Markman-style projectively hyperholomorphic universal family on X x Y is a delicate consequence of (i) the bundle E being a projectively hyperholomorphic deformation of U^{[n]} (which is itself an FM kernel of an equivalence by Bridgeland-King-Reid conjugation), and (ii) Markman's transport of FM equivalence along generic diagonal twistor paths. The introduction sketch suffices to identify the package but does not exhibit the explicit lemma that transports the equivalence, particularly when the deformed bundle is genuinely twisted along the chain (cf. the twisted-untwisted dichotomy invoked via Stiefel-Whitney/B-fields).
  - Required change: Cite the specific proposition in (markman) (e.g. Proposition 5.22 / 5.23) that transports the Fourier-Mukai equivalence along a generic diagonal twistor path and explain how vanishing of the obstructing Brauer class on the target component is ensured by the divisibility hypotheses (Section 1.5 'sec_vanishing_twist').
  - Verification: Re-review should confirm `Theorem 1 part (3); Section 3` is corrected or justified.
- [ ] **Manuscript: Section 3 (Thm 37), referenced from Introduction Thm 1**
  - Location: `corrections/2606.23622/paper.tex` at `Section 3 (Thm 37), referenced from Introduction Thm 1`
  - Evidence: The proof strategy is outlined in the 'Idea of proof' subsection of the Introduction and follows the Markman framework (markman, markmanstable) combined with Verbitsky's hyperholomorphic deformation theory (verbitsky-hyperholomorphic-bundles) and O'Grady's modularity theory (OG22, OG26c). The lattice-theoretic conditions appear to mirror those in O'Grady (OG26c) for the n=2 case, generalized using Markman's monodromy description of K3^{[n]}-type. The complete chain of dependencies (Verbitsky deformability of Azumaya algebras, generic diagonal twistor paths, Lemma 5.14 of Markman) is invoked but the verification that the explicit numerical hypotheses on r are exactly the ones needed for the lattice-theoretic Lemmata of Section 2 to close cannot be confirmed from the introduction-level text alone. The headline statements (rank, c_1, discriminant formulae) are consistent with Construction 13 fibre invariants from markmanstable Lemma 11.1 and ogrady-moduli-sheaves-hk Example 3.2.10, propagated through parallel transport.
  - Required change: Provide a self-contained numerical verification or a worked test of the divisibility constraints (conditions (1)-(3) for odd and even div(w)) against Markman's monodromy invariant ell(w); in code-amenable form, ship a Sage/Magma/Lean script under e.g. src/lattice/admissibility.sage that, given (n, w^2, div(w), r), verifies the three conditions and returns ell(w) by Markman's algorithm. Per the Proof-as-Code Axiom for math.* fields, the absence of such an executable certificate is itself a weakness for the headline arithmetic claim.
  - Verification: Re-review should confirm `Section 3 (Thm 37), referenced from Introduction Thm 1` is corrected or justified.
- [ ] **Code release and entrypoints**
  - Location: `37/Theorem` at `code release and execution entrypoints`
  - Evidence: No source repository, license, commit, or release is provided for reproducibility artifacts. For this math.AG theory paper, the headline Theorem 37/Theorem 1 would need a machine-checkable proof artifact such as formalization/Theorem37.lean covering the existence of the moduli component, stability, modular-bundle invariants, and derived equivalence.
  - Required change: Release the source code, scripts, model configuration, and execution entrypoints needed to regenerate the reported tables, or document why those artifacts cannot be released.
  - Verification: Re-review should confirm runnable code or a documented non-release justification is present.
- [ ] **Manuscript: Section 4, Corollaries 44, 46**
  - Location: `corrections/2606.23622/paper.tex` at `Section 4, Corollaries 44, 46`
  - Evidence: This is an arithmetic specialisation of Theorem 1 to the universal families {}^n M_m^{(gamma)}. The numerical compatibility appears consistent with the main theorem's hypotheses, but the genericity assumption ('for generic Y') and its relation to the analytic open condition under which psi_E maps Kahler cones into Kahler cones is asserted without elaboration in the introduction.
  - Required change: Clarify which subset of {}^n M_m^{(gamma)} is excluded by 'generic' and whether this set has positive codimension in the moduli of polarised manifolds.
  - Verification: Re-review should confirm `Section 4, Corollaries 44, 46` is corrected or justified.
- [ ] **Manuscript: Section 2 (lattice-theoretic Lemmata) and Section 3 (Theorem 37)**
  - Location: `corrections/2606.23622/paper.tex` at `Section 2 (lattice-theoretic Lemmata) and Section 3 (Theorem 37)`
  - Evidence: The paper relies on explicit divisibility, coprimality, and quadratic-form-modulo-divisor arguments that determine when ell(w) is realised by a chosen r. In a math.AG paper, these are exactly the kind of computations that can and should be backed by a short Sage/Magma/PARI script that, given a Mukai-type tuple, returns ell(w) and certifies the three conditions. The Proof-as-Code Axiom for math.* fields treats absence of such a certificate as a weakness for the headline arithmetic claim.
  - Required change: Ship src/lattice/check_admissibility.sage (or .lean) implementing Definition 33 (ell(w)) and Theorem 37 conditions; provide a unit test that verifies Corollary 5's three cases (r=3, w^2=6), (r=11, w^2=22), (r=19, w^2=38) and Corollary 4's family-level constraints.
  - Verification: Re-review should confirm `Section 2 (lattice-theoretic Lemmata) and Section 3 (Theorem 37)` is corrected or justified.
- [ ] **Bibliography: Novelty reviewer unavailable**
  - Location: bibliography entry: `Novelty reviewer unavailable`
  - Evidence: Automated novelty review failed before producing a normal prior-art assessment. Failure: `gemini` exited with Some(1) for role novelty: stderr=Error authenticating: IneligibleTierError: This client is no longer supported for Gemini Code Assist for individuals. To continue using Gemini, please migrate to the Antigravity suite of...
  - Required change: Add or discuss missing prior art `Novelty reviewer unavailable`. Automated novelty review failed before producing a normal prior-art assessment. Failure: `gemini` exited with Some(1) for role novelty: stderr=Error authenticating: IneligibleTierError: This client is no longer supported for Gemini Code Assist for individuals. To continue using Gemini, please migrate to the Antigravity suite of...
  - Verification: Re-review should confirm the related-work discussion addresses this prior art.

## Open Questions

- For the slope stability step (C5): does the argument from polystability of End(E) to slope stability of every fibre E_x use openness of the stability locus combined with properness of the family, or an additional hyperholomorphic-symmetry argument; and which proposition in (markman) or (ogrady-moduli-sheaves-hk) explicitly closes this step?
- For the FM equivalence (C12): which proposition in (markman) transports the Fourier-Mukai equivalence along a generic diagonal twistor path, and how does the Brauer-class obstruction vanish given the divisibility hypotheses of Section 1.5?
- What is the definition of 'level-zero Hodge structure [HSuntwisted]' used in Corollary 2/Corollary 39, and which result in (paolo_huy) or (markman) supplies the Mukai-pairing-preserving isometry property?
- For Corollary 4: what is the precise codimension of the locus excluded by 'generic Y in {}^n M_m^{(gamma)},' and does the Kähler-cone-mapping condition psi_E(Käh(X)) ∩ Käh(Y) ≠ ∅ impose an independent algebraic constraint on (Y,w)?
- Can the authors provide a short computational script (Sage, Magma, or PARI) implementing Definition 33 (ell(w)) and Theorem 37 conditions (1)–(3), with unit tests for the three Corollary 5 instances (r=3, w^2=6), (r=11, w^2=22), (r=19, w^2=38)?
- What is the explicit constant of proportionality in the rational Hodge isometry psi_E of Corollary 3/Corollary 42 in terms of (n, r, w^2), and where in the body is non-vanishing of that constant established?

## Per-Agent Reviews

### citation (`gemini-3-flash-preview`) — status: `warn`

```json
{
  "confidence": 0.0,
  "entries": [
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "apost_moduli_red",
        "raw": "apost_moduli_red: A. Apostolov, Moduli spaces of polarised irreducible symplectic manifolds are not necessarily connected, Ann. Inst. Fourier 64 (2014), no. 1, 189--202.",
        "title": "apost_moduli_red",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "unverified via citation_waterfall: not verified by resolver waterfall (Crossref -> openalex -> semantic_scholar -> ads -> inspire_hep -> zbmath); crossref_bibliographic: not verified by Crossref bibliographic search; no match above score threshold; openalex: no title match in provider response; semantic_scholar: no title match in provider response; ads: status 401 Unauthorized; inspire_hep: no title match in provider response; zbmath: status 404 Not Found",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "anchouche-biswas-einstein-hermitian",
        "raw": "anchouche-biswas-einstein-hermitian: B. Anchouche, I. Biswas, Einstein-Hermitian connections on polystable principal bundles over a compact K\\\"ahler manifold, Amer.\\ J.\\ Math.\\ 123 (2001), no. 2, 207--228.",
        "title": "anchouche-biswas-einstein-hermitian",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "unverified via citation_waterfall: not verified by resolver waterfall (Crossref -> openalex -> semantic_scholar -> ads -> inspire_hep -> zbmath); crossref_bibliographic: not verified by Crossref bibliographic search; no match above score threshold; openalex: no title match in provider response; semantic_scholar: no title match in provider response; ads: status 401 Unauthorized; inspire_hep: no title match in provider response; zbmath: status 404 Not Found",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "Alper-StacksModuli",
        "raw": "Alper-StacksModuli: J. Alper, Stacks and Moduli, working draft (lecture notes), version January 5, 2026. Available at \\url{https://sites.math.washington.edu/ jarod/moduli.pdf}.",
        "title": "Alper-StacksModuli",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "unverified via citation_waterfall: not verified by resolver waterfall (Crossref -> openalex -> semantic_scholar -> ads -> inspire_hep -> zbmath); crossref_bibliographic: not verified by Crossref bibliographic search; no match above score threshold; openalex: no title match in provider response; semantic_scholar: no title match in provider response; ads: status 401 Unauthorized; inspire_hep: no title match in provider response; zbmath: status 404 Not Found",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "Bea83",
        "raw": "Bea83: A. Beauville, Vari\\'et\\'es k\\\"ahl\\'eriennes dont la premi\\`ere classe de Chern est nulle, J.\\ Differential Geom.\\ 18 (1983), 755--782.",
        "title": "Bea83",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "insufficient_metadata via extraction: no DOI/arXiv id and no bibliographic text was extracted for this citation",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "beckmann",
        "raw": "beckmann: T. Beckmann, Atomic objects on hyper-K\\\"ahler manifolds, J. Algebraic Geom. {\\bf 34} (2025), no. 1, 109--160.",
        "title": "beckmann",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via openalex",
      "relevance": "medium",
      "resolved_doi": "10.1021/jo025960d",
      "resolved_url": "https://doi.org/10.1021/jo025960d"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "connectionontwistedhiggsbundles",
        "raw": "connectionontwistedhiggsbundles: I. Biswas, T. L. G\\'omez, N. Hoffmann, A. Hogadi, Einstein--Hermitian connection on twisted Higgs bundles, C.\\ R.\\ Math.\\ Acad.\\ Sci.\\ Paris 348 (2010), no. 17--18, 981--983",
        "title": "connectionontwistedhiggsbundles",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "unverified via citation_waterfall: not verified by resolver waterfall (Crossref -> openalex -> semantic_scholar -> ads -> inspire_hep -> zbmath); crossref_bibliographic: not verified by Crossref bibliographic search; no match above score threshold; openalex: no title match in provider response; semantic_scholar: no title match in provider response; ads: status 401 Unauthorized; inspire_hep: no title match in provider response; zbmath: status 404 Not Found",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "van-bree-gholampour-jiang-kool-pgl-sl",
        "raw": "van-bree-gholampour-jiang-kool-pgl-sl: D. van Bree, A. Gholampour, Y. Jiang, M. Kool, A virtual $PGL_r$-$SL_r$ correspondence for projective surfaces, Moduli 2 (2025), e5, 1--41.",
        "title": "van-bree-gholampour-jiang-kool-pgl-sl",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1112/mod.2024.13",
      "resolved_url": "https://doi.org/10.1112/mod.2024.13"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "bridgeland-king-reid-mckay",
        "raw": "bridgeland-king-reid-mckay: T. Bridgeland, A. King, M. Reid, The McKay correspondence as an equivalence of derived categories, J.\\ Amer.\\ Math.\\ Soc.\\ 14 (2001), no. 3, 535--554.",
        "title": "bridgeland-king-reid-mckay",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "unverified via citation_waterfall: not verified by resolver waterfall (Crossref -> openalex -> semantic_scholar -> ads -> inspire_hep -> zbmath); crossref_bibliographic: not verified by Crossref bibliographic search; no match above score threshold; openalex: no title match in provider response; semantic_scholar: no title match in provider response; ads: status 401 Unauthorized; inspire_hep: no title match in provider response; zbmath: status 404 Not Found",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2603.23033",
        "authors": [],
        "doi": null,
        "key": "bottini-macri-stellari-hk-varieties",
        "raw": "bottini-macri-stellari-hk-varieties: A. Bottini, E. Macr\\`i, P. Stellari, Hyper-K\\\"ahler varieties: Lagrangian fibrations, atomic sheaves, and categories, Preprint, \\href{https://arxiv.org/abs/2603.23033}{arXiv:2603.23033}.",
        "title": "bottini-macri-stellari-hk-varieties",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via arxiv",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": "https://arxiv.org/abs/2603.23033"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "Bot24a",
        "raw": "Bot24a: A. Bottini, Towards a modular construction of OG10, Compos. Math. 160 (2024), no. 10, 2496--2529.",
        "title": "Bot24a",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "insufficient_metadata via extraction: no DOI/arXiv id and no bibliographic text was extracted for this citation",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2411.18528",
        "authors": [],
        "doi": null,
        "key": "Bot24b",
        "raw": "Bot24b: A. Bottini, O'Grady's tenfolds from stable bundles on hyper-Kähler fourfolds, Preprint, \\href{https://arxiv.org/abs/2411.18528}{arXiv:2411.18528}.",
        "title": "Bot24b",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via arxiv",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": "https://arxiv.org/abs/2411.18528"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "boucksom",
        "raw": "boucksom: S. Boucksom, Le cône kählérien d'une variété hyperkählérienne. C. R. Acad. Sci. Paris Sér. I Math. 333 (2001), no. 10, 935--938.",
        "title": "boucksom",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via openalex",
      "relevance": "medium",
      "resolved_doi": "10.48550/arxiv.1010.4035",
      "resolved_url": "http://arxiv.org/abs/1010.4035"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "buskin-hodge-isometry-k3",
        "raw": "buskin-hodge-isometry-k3: N. Buskin, Every rational Hodge isometry between two K3 surfaces is algebraic, J.\\ Reine Angew.\\ Math.\\ 755 (2019), 127--150.",
        "title": "buskin-hodge-isometry-k3",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "unverified via citation_waterfall: not verified by resolver waterfall (Crossref -> openalex -> semantic_scholar -> ads -> inspire_hep -> zbmath); crossref_bibliographic: not verified by Crossref bibliographic search; no match above score threshold; openalex: no title match in provider response; semantic_scholar: no title match in provider response; ads: status 401 Unauthorized; inspire_hep: no title match in provider response; zbmath: status 404 Not Found",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "caldararu-thesis",
        "raw": "caldararu-thesis: A. C\\u{a}ld\\u{a}raru, Derived categories of twisted sheaves on Calabi--Yau manifolds, Ph.D.\\ thesis, Cornell University, 2000. Available at \\url{https://people.math.wisc.edu/ caldararu/publications/ThesisSingleSpaced.pdf}.",
        "title": "caldararu-thesis",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via semantic_scholar",
      "relevance": "medium",
      "resolved_doi": "10.5194/se-2020-89-sc4",
      "resolved_url": "https://www.semanticscholar.org/paper/41456401db746b9f8f579a3120b80b9791de9b18"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "caldararu-nonfine-k3",
        "raw": "caldararu-nonfine-k3: A. C\\u{a}ld\\u{a}raru, Nonfine moduli spaces of sheaves on K3 surfaces, Int.\\ Math.\\ Res.\\ Not.\\ 2002 (2002), no. 20, 1027--1056.",
        "title": "caldararu-nonfine-k3",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "unverified via citation_waterfall: not verified by resolver waterfall (Crossref -> openalex -> semantic_scholar -> ads -> inspire_hep -> zbmath); crossref_bibliographic: not verified by Crossref bibliographic search; no match above score threshold; openalex: no title match in provider response; semantic_scholar: no title match in provider response; ads: status 401 Unauthorized; inspire_hep: no title match in provider response; zbmath: status 404 Not Found",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "olivier_HK",
        "raw": "olivier_HK: O. Debarre, Hyper-Kähler manifolds, Milan J. Math. 90 (2022), no. 2, 305--387.",
        "title": "olivier_HK",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "unverified via citation_waterfall: not verified by resolver waterfall (Crossref -> openalex -> semantic_scholar -> ads -> inspire_hep -> zbmath); crossref_bibliographic: not verified by Crossref bibliographic search; no match above score threshold; openalex: no title match in provider response; semantic_scholar: no title match in provider response; ads: status 401 Unauthorized; inspire_hep: no title match in provider response; zbmath: status 404 Not Found",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "Fat24",
        "raw": "Fat24: E. Fatighenti, Examples of non-rigid, modular vector bundles on hyperk\\\"ahler manifolds, Int. Math. Res. Not. IMRN {\\bf 2024}, no. 10, 8782--8793; MR4749187.",
        "title": "Fat24",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "insufficient_metadata via extraction: no DOI/arXiv id and no bibliographic text was extracted for this citation",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2409.12821",
        "authors": [],
        "doi": null,
        "key": "FO24",
        "raw": "FO24: E. Fatighenti, C. Onorati, Modular vector bundles with and without moduli, Preprint, \\href{https://arxiv.org/abs/2409.12821}{arXiv:2409.12821}.",
        "title": "FO24",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via arxiv",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": "https://arxiv.org/abs/2409.12821"
    },
    {
      "citation": {
        "arxiv_id": "2502.18360",
        "authors": [],
        "doi": null,
        "key": "FT25",
        "raw": "FT25: A. Frassineti, F. Tufo, Modular vector bundles on hyperkähler manifolds of Debarre-Voisin type, Preprint, \\href{https://arxiv.org/abs/2502.18360}{arXiv:2502.18360}.",
        "title": "FT25",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via arxiv",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": "https://arxiv.org/abs/2502.18360"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "gritsenko-hulek-sankaran-abelianisation",
        "raw": "gritsenko-hulek-sankaran-abelianisation: V. Gritsenko, K. Hulek, G. K. Sankaran, Abelianisation of orthogonal groups and the fundamental group of modular varieties, J.\\ Algebra 322 (2009), no. 2, 463--478.",
        "title": "gritsenko-hulek-sankaran-abelianisation",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "unverified via citation_waterfall: not verified by resolver waterfall (Crossref -> openalex -> semantic_scholar -> ads -> inspire_hep -> zbmath); crossref_bibliographic: not verified by Crossref bibliographic search; no match above score threshold; openalex: no title match in provider response; semantic_scholar: no title match in provider response; ads: status 401 Unauthorized; inspire_hep: no title match in provider response; zbmath: status 404 Not Found",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "GHS_moduli_IHS",
        "raw": "GHS_moduli_IHS: V. Gritsenko, K. Hulek, G. K. Sankaran, Moduli spaces of irreducible symplectic manifolds, Compos. Math. 146 (2010), no. 2, 404--434.",
        "title": "GHS_moduli_IHS",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "unverified via citation_waterfall: not verified by resolver waterfall (Crossref -> openalex -> semantic_scholar -> ads -> inspire_hep -> zbmath); crossref_bibliographic: not verified by Crossref bibliographic search; no match above score threshold; openalex: no title match in provider response; semantic_scholar: no title match in provider response; ads: status 401 Unauthorized; inspire_hep: no title match in provider response; zbmath: status 404 Not Found",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "greb_ross_toma_moduli",
        "raw": "greb_ross_toma_moduli: D. Greb, J. Ross, M. Toma, Moduli of vector bundles on higher-dimensional base manifolds---construction and variation, Internat. J. Math. {\\bf 27} (2016), no. 7, 1650054, 27 pp.",
        "title": "greb_ross_toma_moduli",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "unverified via citation_waterfall: not verified by resolver waterfall (Crossref -> openalex -> semantic_scholar -> ads -> inspire_hep -> zbmath); crossref_bibliographic: not verified by Crossref bibliographic search; no match above score threshold; openalex: no title match in provider response; semantic_scholar: no title match in provider response; ads: status 401 Unauthorized; inspire_hep: no title match in provider response; zbmath: status 404 Not Found",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "greb_toma",
        "raw": "greb_toma: D. Greb, M. Toma, Compact moduli spaces for slope-semistable sheaves, Algebr. Geom. 4 (2017), no. 1, 40–-78.",
        "title": "greb_toma",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "unverified via citation_waterfall: not verified by resolver waterfall (Crossref -> openalex -> semantic_scholar -> ads -> inspire_hep -> zbmath); crossref_bibliographic: not verified by Crossref bibliographic search; no match above score threshold; openalex: no title match in provider response; semantic_scholar: no title match in provider response; ads: status 401 Unauthorized; inspire_hep: no title match in provider response; zbmath: status 404 Not Found",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2502.09774",
        "authors": [],
        "doi": null,
        "key": "hotchkissetal",
        "raw": "hotchkissetal: J. Hotchkiss, D. Maulik, J- Shen, Q. Yin, R. Zhang, The period-index problem for hyper-K\\\"ahler varieties via hyperholomorphic bundles, Preprint, \\href{https://arxiv.org/pdf/2502.09774}{arXiv:2502.09774}.",
        "title": "hotchkissetal",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via arxiv",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": "https://arxiv.org/abs/2502.09774"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "Huy-HK-basic",
        "raw": "Huy-HK-basic: D. Huybrechts, Compact hyperk\\\"ahler manifolds: basic results, Invent.\\ Math.\\ 135 (1999), no. 1, 63--113. Erratum: Invent.\\ Math.\\ 152 (2003), 209--212.",
        "title": "Huy-HK-basic",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via semantic_scholar",
      "relevance": "medium",
      "resolved_doi": "10.64024/upes13999",
      "resolved_url": "https://www.semanticscholar.org/paper/98c1a2fa4deffb6bcf912a001390d3a2918ea2a4"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "Huy03",
        "raw": "Huy03: D. Huybrechts, Fourier--Mukai transforms in algebraic geometry, Oxford Mathematical Monographs, Oxford Univ. Press, Oxford, 2006.",
        "title": "Huy03",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "insufficient_metadata via extraction: no DOI/arXiv id and no bibliographic text was extracted for this citation",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "HuyK3",
        "raw": "HuyK3: D. Huybrechts, Lectures on K3 Surfaces, Camb.\\ Stud.\\ Adv.\\ Math.\\ 158 (2016).",
        "title": "HuyK3",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "insufficient_metadata via extraction: no DOI/arXiv id and no bibliographic text was extracted for this citation",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "HL10",
        "raw": "HL10: D. Huybrechts, M. Lehn, The geometry of moduli spaces of sheaves (2nd ed.), Cambridge Univ.\\ Press (2010).",
        "title": "HL10",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "insufficient_metadata via extraction: no DOI/arXiv id and no bibliographic text was extracted for this citation",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "huybrechts-schroeer-brauer",
        "raw": "huybrechts-schroeer-brauer: D. Huybrechts, S. Schr\\\"oer, The Brauer group of analytic K3 surfaces, Int.\\ Math.\\ Res.\\ Not.\\ 2003 (2003), no. 50, 2687--2698.",
        "title": "huybrechts-schroeer-brauer",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "unverified via citation_waterfall: not verified by resolver waterfall (Crossref -> openalex -> semantic_scholar -> ads -> inspire_hep -> zbmath); crossref_bibliographic: not verified by Crossref bibliographic search; no match above score threshold; openalex: no title match in provider response; semantic_scholar: no title match in provider response; ads: status 401 Unauthorized; inspire_hep: no title match in provider response; zbmath: status 404 Not Found",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "paolo_huy",
        "raw": "paolo_huy: D. Huybrechts, P. Stellari, Equivalences of twisted K3 surfaces, Math.\\ Ann.\\ 332 (2005), 901--936.",
        "title": "paolo_huy",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "unverified via citation_waterfall: not verified by resolver waterfall (Crossref -> openalex -> semantic_scholar -> ads -> inspire_hep -> zbmath); crossref_bibliographic: not verified by Crossref bibliographic search; no match above score threshold; openalex: no title match in provider response; semantic_scholar: no title match in provider response; ads: status 401 Unauthorized; inspire_hep: no title match in provider response; zbmath: status 404 Not Found",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "EPWcubes",
        "raw": "EPWcubes: A. Iliev, G. Kapustka, M. Kapustka, K. Ranestad, EPW cubes, J. Reine Angew. Math. 748 (2019), 241--268.",
        "title": "EPWcubes",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "unverified via citation_waterfall: not verified by resolver waterfall (Crossref -> openalex -> semantic_scholar -> ads -> inspire_hep -> zbmath); crossref_bibliographic: not verified by Crossref bibliographic search; no match above score threshold; openalex: no title match in provider response; semantic_scholar: no title match in provider response; ads: status 401 Unauthorized; inspire_hep: no title match in provider response; zbmath: status 404 Not Found",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "dejong-gabber",
        "raw": "dejong-gabber: A. J. de Jong, A result of Gabber, Preprint, \\url{https://www.math.columbia.edu/ dejong/papers/2-gabber.pdf}.",
        "title": "dejong-gabber",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "unverified via citation_waterfall: not verified by resolver waterfall (Crossref -> openalex -> semantic_scholar -> ads -> inspire_hep -> zbmath); crossref_bibliographic: not verified by Crossref bibliographic search; no match above score threshold; openalex: no title match in provider response; semantic_scholar: no title match in provider response; ads: status 401 Unauthorized; inspire_hep: no title match in provider response; zbmath: status 404 Not Found",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2312.14543",
        "authors": [],
        "doi": null,
        "key": "kapustka-kapustka-derived-equivalent-hk4",
        "raw": "kapustka-kapustka-derived-equivalent-hk4: G. Kapustka, M. Kapustka, Constructions of derived equivalent hyper-K\\\"ahler fourfolds, Preprint, \\href{https://arxiv.org/abs/2312.14543}, 2023.",
        "title": "kapustka-kapustka-derived-equivalent-hk4",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via arxiv",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": "https://arxiv.org/abs/2312.14543"
    },
    {
      "citation": {
        "arxiv_id": "2510.11298",
        "authors": [],
        "doi": null,
        "key": "krug-reede-zhang",
        "raw": "krug-reede-zhang: A. Krug, F. Reede, Z. Zhang, Moduli spaces of generalised tautological bundles on Hilbert schemes, Preprint, \\href{https://arxiv.org/abs/2510.11298}{arXiv:2510.11298}.",
        "title": "krug-reede-zhang",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via arxiv",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": "https://arxiv.org/abs/2510.11298"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "LLSvS",
        "raw": "LLSvS: C. Lehn, M. Lehn, C. Sorger, D. van Straten, Twisted cubics on cubic fourfolds, J. Reine Angew. Math. 731 (2017), 87--128.",
        "title": "LLSvS",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "insufficient_metadata via extraction: no DOI/arXiv id and no bibliographic text was extracted for this citation",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "Mar08",
        "raw": "Mar08: E. Markman, On the monodromy of moduli spaces of sheaves on K3 surfaces, J.\\ Algebraic Geom.\\ 17 (2008), no. 3, 29--99.",
        "title": "Mar08",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "insufficient_metadata via extraction: no DOI/arXiv id and no bibliographic text was extracted for this citation",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "Mar10",
        "raw": "Mar10: E. Markman, Integral constraints on the monodromy group of the hyperk\\\"ahler resolution of a symmetric product of a K3 surface, Int.\\ J.\\ Math.\\ 21 (2010), 169--223.",
        "title": "Mar10",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "insufficient_metadata via extraction: no DOI/arXiv id and no bibliographic text was extracted for this citation",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "Mar11",
        "raw": "Mar11: E. Markman, A survey of Torelli and monodromy results for holomorphic-symplectic varieties, in Complex and differential geometry, Springer Proc.\\ Math.\\ 8, Springer, Heidelberg, 2011, 257--322.",
        "title": "Mar11",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "insufficient_metadata via extraction: no DOI/arXiv id and no bibliographic text was extracted for this citation",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "markman_bbf",
        "raw": "markman_bbf: E. Markman, The Beauville--Bogomolov class as a characteristic class, J.\\ Algebraic Geom.\\ 29 (2020), no. 2, 199--245.",
        "title": "markman_bbf",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "unverified via citation_waterfall: not verified by resolver waterfall (Crossref -> openalex -> semantic_scholar -> ads -> inspire_hep -> zbmath); crossref_bibliographic: not verified by Crossref bibliographic search; no match above score threshold; openalex: no title match in provider response; semantic_scholar: no title match in provider response; ads: status 401 Unauthorized; inspire_hep: no title match in provider response; zbmath: status 404 Not Found",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "markmanstable",
        "raw": "markmanstable: E. Markman, Stable vector bundles on a hyper-K\\\"ahler manifold with a rank $1$ obstruction map are modular, Kyoto J.\\ Math.\\ 64 (2024), no. 3, 635--742.",
        "title": "markmanstable",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "unverified via citation_waterfall: not verified by resolver waterfall (Crossref -> openalex -> semantic_scholar -> ads -> inspire_hep -> zbmath); crossref_bibliographic: not verified by Crossref bibliographic search; no match above score threshold; openalex: no title match in provider response; semantic_scholar: no title match in provider response; ads: status 401 Unauthorized; inspire_hep: no title match in provider response; zbmath: status 404 Not Found",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "markman",
        "raw": "markman: E. Markman, \\textit{Rational Hodge isometries of hyper-K\\\"ahler varieties of $K3^{[n]}$-type are algebraic}, Compos.\\ Math.\\ 160 (2024), no. 6, 1261--1303.",
        "title": "markman",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "insufficient_metadata via extraction: no DOI/arXiv id and no bibliographic text was extracted for this citation",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "dequivconj",
        "raw": "dequivconj: D. Maulik, J. Shen, Q. Yin, R. Zhang, The D-equivalence conjecture for hyper-K\\\"ahler varieties via hyperholomorphic bundles, Invent.\\ Math.\\ 241 (2025), no. 1, 309--324.",
        "title": "dequivconj",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "unverified via citation_waterfall: not verified by resolver waterfall (Crossref -> openalex -> semantic_scholar -> ads -> inspire_hep -> zbmath); crossref_bibliographic: not verified by Crossref bibliographic search; no match above score threshold; openalex: no title match in provider response; semantic_scholar: no title match in provider response; ads: status 401 Unauthorized; inspire_hep: no title match in provider response; zbmath: status 404 Not Found",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "Mukai1",
        "raw": "Mukai1: S. Mukai, Symplectic structure of the moduli space of sheaves on an abelian or K3 surface, Invent. Math. 77, 1984, no. 1, 101--116.",
        "title": "Mukai1",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "insufficient_metadata via extraction: no DOI/arXiv id and no bibliographic text was extracted for this citation",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "Mukai2",
        "raw": "Mukai2: S. Mukai, On the moduli space of bundles on K3 surfaces. I, in Vector Bundles on Algebraic Varieties (Bombay, 1984), Tata Inst.\\ Fund.\\ Res.\\ Stud.\\ Math.\\ 11, 1987, 341--413.",
        "title": "Mukai2",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "insufficient_metadata via extraction: no DOI/arXiv id and no bibliographic text was extracted for this citation",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "OG15",
        "raw": "OG15: K. G. O'Grady, Periods of double EPW-sextics, Math. Z. 280 (2015), no. 1--2, 485--524.",
        "title": "OG15",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "insufficient_metadata via extraction: no DOI/arXiv id and no bibliographic text was extracted for this citation",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "OG22",
        "raw": "OG22: K. G. O'Grady, Modular sheaves on hyperkähler varieties, Algebr. Geom. 9 (2022), no. 1, 1--38.",
        "title": "OG22",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "insufficient_metadata via extraction: no DOI/arXiv id and no bibliographic text was extracted for this citation",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "OGrady2026",
        "raw": "OGrady2026: K. G. O'Grady, Modular sheaves with many moduli, Geom.\\ Topol.\\ 30 (2026), no. 1, 203--246.",
        "title": "OGrady2026",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "unverified via citation_waterfall: not verified by resolver waterfall (Crossref -> openalex -> semantic_scholar -> ads -> inspire_hep -> zbmath); crossref_bibliographic: not verified by Crossref bibliographic search; no match above score threshold; openalex: no title match in provider response; semantic_scholar: no title match in provider response; ads: status 401 Unauthorized; inspire_hep: no title match in provider response; zbmath: status 404 Not Found",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2602.23194",
        "authors": [],
        "doi": null,
        "key": "ogrady-moduli-sheaves-hk",
        "raw": "ogrady-moduli-sheaves-hk: K. G. O'Grady, Moduli of sheaves on hyperk\\\"ahler manifolds, Preprint, \\href{https://arxiv.org/abs/2602.23194}{arXiv:2602.23194}.",
        "title": "ogrady-moduli-sheaves-hk",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via arxiv",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": "https://arxiv.org/abs/2602.23194"
    },
    {
      "citation": {
        "arxiv_id": "2606.03775",
        "authors": [],
        "doi": null,
        "key": "OG26c",
        "raw": "OG26c: K. G. O'Grady, \\textit{HK manifolds of Type $K3^{[a^2+1]}$ as moduli spaces of projective bundles on HK manifolds of Type $K3^{[2]}$}, Preprint, \\href{https://arxiv.org/abs/2606.03775}{arXiv:2606.03775}.",
        "title": "OG26c",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via arxiv",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": "https://arxiv.org/abs/2606.03775"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "pavel_toma_survey",
        "raw": "pavel_toma_survey: M. Pavel, M. Toma, Slope-semistability and moduli of coherent sheaves: a survey, Rev.\\ Roumaine Math.\\ Pures Appl.\\ 70 (2025), no. 1--2, 85--105.",
        "title": "pavel_toma_survey",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "unverified via citation_waterfall: not verified by resolver waterfall (Crossref -> openalex -> semantic_scholar -> ads -> inspire_hep -> zbmath); crossref_bibliographic: not verified by Crossref bibliographic search; no match above score threshold; openalex: no title match in provider response; semantic_scholar: no title match in provider response; ads: status 401 Unauthorized; inspire_hep: no title match in provider response; zbmath: status 404 Not Found",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "reede-zhang-smooth-components",
        "raw": "reede-zhang-smooth-components: F. Reede, Z. Zhang, Examples of smooth components of moduli spaces of stable sheaves, Manuscripta Math.\\ 165 (2021), no. 3--4, 605--621.",
        "title": "reede-zhang-smooth-components",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "unverified via citation_waterfall: not verified by resolver waterfall (Crossref -> openalex -> semantic_scholar -> ads -> inspire_hep -> zbmath); crossref_bibliographic: not verified by Crossref bibliographic search; no match above score threshold; openalex: no title match in provider response; semantic_scholar: no title match in provider response; ads: status 401 Unauthorized; inspire_hep: no title match in provider response; zbmath: status 404 Not Found",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "schroer-analytic-brauer",
        "raw": "schroer-analytic-brauer: S. Schr\\\"oer, Topological methods for complex-analytic Brauer groups, Topology 44 (2005), no. 5, 875--894.",
        "title": "schroer-analytic-brauer",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "unverified via citation_waterfall: not verified by resolver waterfall (Crossref -> openalex -> semantic_scholar -> ads -> inspire_hep -> zbmath); crossref_bibliographic: not verified by Crossref bibliographic search; no match above score threshold; openalex: no title match in provider response; semantic_scholar: no title match in provider response; ads: status 401 Unauthorized; inspire_hep: no title match in provider response; zbmath: status 404 Not Found",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "tae23",
        "raw": "tae23: L. Taelman, Derived equivalences of hyperkähler varieties, Geom. Topol., 27 7 (2023), 2649-2693.",
        "title": "tae23",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "insufficient_metadata via extraction: no DOI/arXiv id and no bibliographic text was extracted for this citation",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "verbitsky-hyperholomorphic-bundles",
        "raw": "verbitsky-hyperholomorphic-bundles: M. Verbitsky, Hyperholomorphic bundles over a hyperk\\\"ahler manifold, J.\\ Algebraic Geom.\\ 5 (1996), no. 4, 633--669.",
        "title": "verbitsky-hyperholomorphic-bundles",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via semantic_scholar",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": "https://www.semanticscholar.org/paper/307ad8275c337f3f752eaf87730f24f823a59f52"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "verbitsky-hyperholomorphic-sheaves",
        "raw": "verbitsky-hyperholomorphic-sheaves: M. Verbitsky, Hyperholomorphic sheaves and new examples of hyperk\\\"ahler manifolds, in Hyperk\\\"ahler Manifolds, International Press, Somerville, MA, 1999, 15--127.",
        "title": "ahler manifolds, in \\textitHyperk\\",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "unverified via citation_waterfall: not verified by resolver waterfall (Crossref -> openalex -> semantic_scholar -> ads -> inspire_hep -> zbmath); crossref_bibliographic: not verified by Crossref bibliographic search; no match above score threshold; openalex: no title match in provider response; semantic_scholar: no title match in provider response; ads: status 401 Unauthorized; inspire_hep: no title match in provider response; zbmath: status 404 Not Found",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "Ver09",
        "raw": "Ver09: M. Verbitsky, Mapping class group and a global Torelli theorem for hyperk\\\"ahler manifolds, Duke Math.\\ J.\\ 162 (2013), no. 15, 2929--2986. Appendix A by Eyal Markman.",
        "title": "Ver09",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "insufficient_metadata via extraction: no DOI/arXiv id and no bibliographic text was extracted for this citation",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "Yoshioka",
        "raw": "Yoshioka: K. Yoshioka, Stability and the Fourier-Mukai transform. II, Compos. Math. {\\bf 145} (2009), no. 1, 112--142.",
        "title": "Yoshioka",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via openalex",
      "relevance": "medium",
      "resolved_doi": "10.3354/meps07841",
      "resolved_url": "https://doi.org/10.3354/meps07841"
    },
    {
      "citation": {
        "arxiv_id": "2502.02143",
        "authors": [],
        "doi": null,
        "key": "zhang",
        "raw": "zhang: R. Zhang, \\textit{A twisted derived category of hyper-K\\\"ahler varieties of $K3^{[n]}$-type}, Preprint, \\href{https://arxiv.org/pdf/2502.02143}{arXiv:2502.02143}.",
        "title": "zhang",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via arxiv",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": "https://arxiv.org/abs/2502.02143"
    }
  ],
  "missing_references": [],
  "summary": "Citation-use agent failed before producing a normal citation relevance review. Deterministic citation verification still runs separately; see external citation checks and verifier provenance for existence, DOI, URL, and resolver evidence. Failure: `gemini` exited with Some(1) for role citation: stderr=Error authenticating: IneligibleTierError: This client is no longer supported for Gemini Code Assist for individuals. To continue using Gemini, please migrate to the Antigravity suite o... Deterministic citation verifier checked 58 bibliography entries."
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.62,
  "questions": [
    "For the slope stability step (C5): does the argument from polystability of End(E) to slope stability of every fibre E_x use openness of the stability locus combined with properness of the family, or an additional hyperholomorphic-symmetry argument; and which proposition in (markman) or (ogrady-moduli-sheaves-hk) explicitly closes this step?",
    "For the FM equivalence (C12): which proposition in (markman) transports the Fourier-Mukai equivalence along a generic diagonal twistor path, and how does the Brauer-class obstruction vanish given the divisibility hypotheses of Section 1.5?",
    "What is the definition of 'level-zero Hodge structure [HSuntwisted]' used in Corollary 2/Corollary 39, and which result in (paolo_huy) or (markman) supplies the Mukai-pairing-preserving isometry property?",
    "For Corollary 4: what is the precise codimension of the locus excluded by 'generic Y in {}^n M_m^{(gamma)},' and does the Kähler-cone-mapping condition psi_E(Käh(X)) ∩ Käh(Y) ≠ ∅ impose an independent algebraic constraint on (Y,w)?",
    "Can the authors provide a short computational script (Sage, Magma, or PARI) implementing Definition 33 (ell(w)) and Theorem 37 conditions (1)–(3), with unit tests for the three Corollary 5 instances (r=3, w^2=6), (r=11, w^2=22), (r=19, w^2=38)?",
    "What is the explicit constant of proportionality in the rational Hodge isometry psi_E of Corollary 3/Corollary 42 in terms of (n, r, w^2), and where in the body is non-vanishing of that constant established?"
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "The argument is sketched as 'exploiting the symmetries of the Hermite-Einstein connection on End(E)' and uses the variation of slope stability across the Kahler cone collected in an appendix. Establishing universal slope stability of the family E_x as x ranges over X (as opposed to generic stability or polystability), together with the existence of a single polarisation H that works uniformly, is the most delicate step and the only one not directly imported from prior literature. Without access to the appendix in the visible excerpt, the chain from polystability of End(E) to slope stability of each fibre E_x is not verifiable.",
      "id": "weakness-1",
      "locator": "Idea of proof in Introduction; Section 3 (proof of Thm 37)",
      "required_update": "Make the role of the Kahler-cone-wide stability variation appendix explicit, and state precisely whether slope stability for all x follows by openness + properness or by an extra hyperholomorphic symmetry argument; cite the exact prior result (e.g. ogrady-moduli-sheaves-hk Cor 2.1.5 or markman Prop 5.22) that closes the gap.",
      "source_path": "corrections/2606.23622/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Idea of proof in Introduction; Section 3 (proof of Thm 37)` is corrected or justified.",
      "weakness_index": 0
    },
    {
      "evidence": "Asserted as 'part of Markman's package (markman)'. The Fourier-Mukai equivalence for a Markman-style projectively hyperholomorphic universal family on X x Y is a delicate consequence of (i) the bundle E being a projectively hyperholomorphic deformation of U^{[n]} (which is itself an FM kernel of an equivalence by Bridgeland-King-Reid conjugation), and (ii) Markman's transport of FM equivalence along generic diagonal twistor paths. The introduction sketch suffices to identify the package but does not exhibit the explicit lemma that transports the equivalence, particularly when the deformed bundle is genuinely twisted along the chain (cf. the twisted-untwisted dichotomy invoked via Stiefel-Whitney/B-fields).",
      "id": "weakness-2",
      "locator": "Theorem 1 part (3); Section 3",
      "required_update": "Cite the specific proposition in (markman) (e.g. Proposition 5.22 / 5.23) that transports the Fourier-Mukai equivalence along a generic diagonal twistor path and explain how vanishing of the obstructing Brauer class on the target component is ensured by the divisibility hypotheses (Section 1.5 'sec_vanishing_twist').",
      "source_path": "corrections/2606.23622/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Theorem 1 part (3); Section 3` is corrected or justified.",
      "weakness_index": 1
    },
    {
      "evidence": "The proof strategy is outlined in the 'Idea of proof' subsection of the Introduction and follows the Markman framework (markman, markmanstable) combined with Verbitsky's hyperholomorphic deformation theory (verbitsky-hyperholomorphic-bundles) and O'Grady's modularity theory (OG22, OG26c). The lattice-theoretic conditions appear to mirror those in O'Grady (OG26c) for the n=2 case, generalized using Markman's monodromy description of K3^{[n]}-type. The complete chain of dependencies (Verbitsky deformability of Azumaya algebras, generic diagonal twistor paths, Lemma 5.14 of Markman) is invoked but the verification that the explicit numerical hypotheses on r are exactly the ones needed for the lattice-theoretic Lemmata of Section 2 to close cannot be confirmed from the introduction-level text alone. The headline statements (rank, c_1, discriminant formulae) are consistent with Construction 13 fibre invariants from markmanstable Lemma 11.1 and ogrady-moduli-sheaves-hk Example 3.2.10, propagated through parallel transport.",
      "id": "weakness-3",
      "locator": "Section 3 (Thm 37), referenced from Introduction Thm 1",
      "required_update": "Provide a self-contained numerical verification or a worked test of the divisibility constraints (conditions (1)-(3) for odd and even div(w)) against Markman's monodromy invariant ell(w); in code-amenable form, ship a Sage/Magma/Lean script under e.g. src/lattice/admissibility.sage that, given (n, w^2, div(w), r), verifies the three conditions and returns ell(w) by Markman's algorithm. Per the Proof-as-Code Axiom for math.* fields, the absence of such an executable certificate is itself a weakness for the headline arithmetic claim.",
      "source_path": "corrections/2606.23622/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 3 (Thm 37), referenced from Introduction Thm 1` is corrected or justified.",
      "weakness_index": 2
    },
    {
      "evidence": "No source repository, license, commit, or release is provided for reproducibility artifacts. For this math.AG theory paper, the headline Theorem 37/Theorem 1 would need a machine-checkable proof artifact such as formalization/Theorem37.lean covering the existence of the moduli component, stability, modular-bundle invariants, and derived equivalence.",
      "id": "weakness-4",
      "locator": "code release and execution entrypoints",
      "required_update": "Release the source code, scripts, model configuration, and execution entrypoints needed to regenerate the reported tables, or document why those artifacts cannot be released.",
      "source_path": "37/Theorem",
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "code",
      "verification_check": "Re-review should confirm runnable code or a documented non-release justification is present.",
      "weakness_index": 3
    },
    {
      "evidence": "This is an arithmetic specialisation of Theorem 1 to the universal families {}^n M_m^{(gamma)}. The numerical compatibility appears consistent with the main theorem's hypotheses, but the genericity assumption ('for generic Y') and its relation to the analytic open condition under which psi_E maps Kahler cones into Kahler cones is asserted without elaboration in the introduction.",
      "id": "weakness-5",
      "locator": "Section 4, Corollaries 44, 46",
      "required_update": "Clarify which subset of {}^n M_m^{(gamma)} is excluded by 'generic' and whether this set has positive codimension in the moduli of polarised manifolds.",
      "source_path": "corrections/2606.23622/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 4, Corollaries 44, 46` is corrected or justified.",
      "weakness_index": 4
    },
    {
      "evidence": "The paper relies on explicit divisibility, coprimality, and quadratic-form-modulo-divisor arguments that determine when ell(w) is realised by a chosen r. In a math.AG paper, these are exactly the kind of computations that can and should be backed by a short Sage/Magma/PARI script that, given a Mukai-type tuple, returns ell(w) and certifies the three conditions. The Proof-as-Code Axiom for math.* fields treats absence of such a certificate as a weakness for the headline arithmetic claim.",
      "id": "weakness-6",
      "locator": "Section 2 (lattice-theoretic Lemmata) and Section 3 (Theorem 37)",
      "required_update": "Ship src/lattice/check_admissibility.sage (or .lean) implementing Definition 33 (ell(w)) and Theorem 37 conditions; provide a unit test that verifies Corollary 5's three cases (r=3, w^2=6), (r=11, w^2=22), (r=19, w^2=38) and Corollary 4's family-level constraints.",
      "source_path": "corrections/2606.23622/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 2 (lattice-theoretic Lemmata) and Section 3 (Theorem 37)` is corrected or justified.",
      "weakness_index": 5
    },
    {
      "evidence": "Automated novelty review failed before producing a normal prior-art assessment. Failure: `gemini` exited with Some(1) for role novelty: stderr=Error authenticating: IneligibleTierError: This client is no longer supported for Gemini Code Assist for individuals. To continue using Gemini, please migrate to the Antigravity suite of...",
      "id": "weakness-7",
      "locator": "Novelty reviewer unavailable",
      "required_update": "Add or discuss missing prior art `Novelty reviewer unavailable`. Automated novelty review failed before producing a normal prior-art assessment. Failure: `gemini` exited with Some(1) for role novelty: stderr=Error authenticating: IneligibleTierError: This client is no longer supported for Gemini Code Assist for individuals. To continue using Gemini, please migrate to the Antigravity suite of...",
      "source_path": null,
      "source_role": "novelty",
      "status": "open",
      "target_kind": "bibliography",
      "verification_check": "Re-review should confirm the related-work discussion addresses this prior art.",
      "weakness_index": 6
    }
  ],
  "strengths": [
    "The construction genuinely extends O'Grady's K3^[2]-type theory to all even-dimensional K3^[n]-type IHS manifolds, producing IHS manifolds and derived equivalences in a unified framework that applies across infinitely many deformation classes.",
    "Explicit, computable arithmetic conditions on the rank r and divisibility class div(w) are derived via Markman's monodromy invariant ell(w) and Eichler's criterion, making the construction checkable for concrete numerical input.",
    "The Fourier-Mukai equivalence, the rational Hodge isometry, and the moduli-space identification follow from a single universal family construction, giving the argument structural economy.",
    "The Chern invariant formulas (rank r^n n!, first Chern class, discriminant) are grounded in multiple Markman–O'Grady references, and the supported claims in the technical review confirm internal arithmetic consistency.",
    "Concrete corollaries for the three classically studied complete K3^[2]-type families (Beauville-Donagi, Debarre-Voisin, Iliev-Ranestad) demonstrate immediate geometric applicability of the general theory."
  ],
  "summary": "The paper generalizes O'Grady's K3^[2]-type construction to all K3^[n]-type IHS manifolds, proving that under explicit numerical conditions connected components of Gieseker-semistable moduli spaces of modular vector bundles are themselves IHS manifolds admitting Fourier-Mukai derived equivalences and rational Hodge isometries with the original manifold. The technical-correctness specialist (confidence 0.55) assessed overall correctness as mostly_sound but identified four major-severity gaps: the main theorem's lattice-theoretic closure (C1), universal slope stability of every fibre E_x (C5), transport of the Fourier-Mukai equivalence along generic diagonal twistor paths (C12), and total absence of executable verification of the admissibility conditions (C13, assessed unsupported). The reproducibility specialist (confidence 0.88) raised a critical concern: no machine-checkable proof artifact exists for the headline Theorem 37/Theorem 1 in a math.AG submission in the code-amenable set. Two specialist reviews (novelty, citation) failed due to a Gemini authentication error; their zero-confidence outputs are pipeline failures and carry no evidential weight for or against the paper. Per the recommendation gate for math.* fields with a critical-severity missing proof-as-code artifact on the headline theorem, the recommendation defaults to major_revision.",
  "weaknesses": [
    "The slope stability of every fibre E_x = E|_{{x}×Y} — the critical new step distinguishing the result from polystability — is not self-contained in the reviewed text; it is unclear whether the argument uses openness-plus-properness or an additional hyperholomorphic-symmetry step (C5, major).",
    "Transport of the Fourier-Mukai equivalence D^b(X)→D^b(Y) along generic diagonal twistor paths is asserted as part of 'Markman's package' without citing the specific proposition that handles the twisted-untwisted Brauer-class vanishing required by the divisibility hypotheses of Section 1.5 (C12, major).",
    "No executable certificate for the three numerical admissibility conditions (odd and even div(w)) is provided; Section 2 lattice-theoretic case checks are prose only, with no accompanying Sage/Magma/PARI/Lean script (C13, unsupported, major; reproducibility critical).",
    "The headline Theorem 37/Theorem 1 lacks any machine-checkable proof artifact; the reproducibility specialist (confidence 0.88) flags this as critical for a math.AG submission in the code-amenable set.",
    "The genericity assumption in Corollary 4 ('for generic Y in {}^n M_m^{(gamma)}') is not quantified; the excluded locus is not shown to have positive codimension in the moduli of polarised manifolds, leaving the corollary's scope unclear (C6, minor).",
    "The explicit verification that each of the three Corollary 5 classical cases satisfies the even div(w) conditions of Theorem 1 is deferred without a numerical table or computation (C7, minor).",
    "The novelty and citation specialist reviews failed due to a pipeline authentication error, leaving prior-art placement and reference validity unassessed; the completeness of this overall review is accordingly reduced."
  ]
}
```

### novelty (`gemini-3-flash-preview`) — status: `fail`

```json
{
  "confidence": 0.0,
  "missing_prior_art": [
    {
      "reason": "Automated novelty review failed before producing a normal prior-art assessment. Failure: `gemini` exited with Some(1) for role novelty: stderr=Error authenticating: IneligibleTierError: This client is no longer supported for Gemini Code Assist for individuals. To continue using Gemini, please migrate to the Antigravity suite of...",
      "title": "Novelty reviewer unavailable"
    }
  ],
  "novelty_score": 0.0,
  "related_work": [],
  "verdict": "marginal"
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
      "description": "No source repository, license, commit, or release is provided for reproducibility artifacts. For this math.AG theory paper, the headline Theorem 37/Theorem 1 would need a machine-checkable proof artifact such as formalization/Theorem37.lean covering the existence of the moduli component, stability, modular-bundle invariants, and derived equivalence.",
      "severity": "critical"
    },
    {
      "area": "code",
      "description": "The lattice-theoretic and monodromy reductions used to verify the numerical hypotheses are only given as prose mathematics. A proof/code artifact such as formalization/LatticeMonodromy.lean or scripts/check_numerical_conditions.sage would be needed to independently reproduce those case checks.",
      "severity": "major"
    },
    {
      "area": "evaluation",
      "description": "The concrete corollary examples for K3^[2]-type cases list ranks, Chern classes, and discriminants but provide no executable verification harness or expected-output files, e.g. examples/k3n2_corollary_checks.json plus scripts/verify_examples.sage.",
      "severity": "major"
    },
    {
      "area": "compute",
      "description": "No proof-checking or symbolic-computation environment is specified; versions for Lean/mathlib, Sage, Magma, or equivalent dependencies are absent because no formal or computational artifact is supplied.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://arxiv.org/abs/2411.18528}{arXiv:2411.18528` (status=404)",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://arxiv.org/abs/2603.23033}{arXiv:2603.23033` (status=404)",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://arxiv.org/abs/2409.12821}{arXiv:2409.12821` (status=404)",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://arxiv.org/abs/2502.18360}{arXiv:2502.18360` (status=404)",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://arxiv.org/pdf/2502.09774}{arXiv:2502.09774` (status=404)",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://arxiv.org/abs/2510.11298}{arXiv:2510.11298` (status=404)",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://arxiv.org/abs/2606.03775}{arXiv:2606.03775` (status=404)",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://arxiv.org/pdf/2502.02143}{arXiv:2502.02143` (status=404)",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://arxiv.org/abs/2602.23194}{arXiv:2602.23194` (status=404)",
      "severity": "minor"
    }
  ],
  "confidence": 0.88,
  "data_availability": "unspecified",
  "data_url": null,
  "environment": null,
  "reproducibility_score": 0.22
}
```

### summary (`claude-haiku-4-5-20251001`) — status: `pass`

```json
{
  "audience": "Algebraic geometers specializing in moduli spaces of sheaves, derived equivalences, hyperkähler geometry, and irreducible holomorphic symplectic manifolds; researchers interested in deformation theory and Hodge structures on algebraic varieties",
  "key_contributions": [
    "Construction of IHS manifolds as connected components of moduli spaces of modular vector bundles on other IHS manifolds of $K3^{[n]}$-type",
    "Proof that under explicit numerical conditions on primitive divisibility classes, these moduli space components are smooth IHS manifolds of $K3^{[n]}$-type",
    "Establishment of Fourier-Mukai derived equivalences $\\mathrm{D}^b(X) \\xrightarrow{\\sim} \\mathrm{D}^b(Y)$ and rational Hodge isometries $H^2(X,\\mathbb{Q}) \\xrightarrow{\\sim} H^2(Y,\\mathbb{Q})$",
    "Application of monodromy operators and Eichler's criterion to characterize admissible numerical conditions for any $K3^{[n]}$-type IHS manifold",
    "Concrete examples including families of K3^{[2]}-type manifolds and derived-equivalent pairs with prescribed Chern character invariants"
  ],
  "plain_language_summary": "This paper studies moduli spaces of vector bundles on irreducible holomorphic symplectic (IHS) manifolds, which are higher-dimensional generalizations of K3 surfaces. The main result proves that under suitable numerical conditions, certain connected components of these moduli spaces are themselves IHS manifolds of the same deformation type, with the universal families of vector bundles inducing derived equivalences and Hodge isometries between the moduli space and the original manifold. The construction focuses on modular vector bundles, a special class satisfying a curvature condition discovered by O'Grady. The authors develop lattice-theoretic and monodromy techniques to establish when their deformations preserve the IHS property, extending classical results about K3 surfaces to all even-dimensional cases.",
  "tldr": "The paper constructs irreducible holomorphic symplectic manifolds as connected components of moduli spaces of modular vector bundles on IHS manifolds of $K3^{[n]}$-type, establishing derived equivalences between them."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `pass`

```json
{
  "claims": [
    {
      "assessment": "partially_supported",
      "claim": "Main Theorem (Thm 1/Thm 37): For Y of K3^{[n]}-type with primitive w in NS(Y), under the stated numerical conditions on r (depending on parity of div(w)), there exists a polarisation H and a connected component X of the Gieseker H-semistable moduli space M_{Y,H} such that X is IHS of K3^{[n]}-type, parametrises H-slope stable modular vector bundles E with explicit rank r^n n!, first Chern class r^{n-1} n! w (or r^{n-1} n! w/2 for even div(w)), and discriminant (r^n n!)^2 c_2(Y)/12, and the universal family induces a Fourier-Mukai equivalence D^b(X) -> D^b(Y).",
      "evidence": "The proof strategy is outlined in the 'Idea of proof' subsection of the Introduction and follows the Markman framework (markman, markmanstable) combined with Verbitsky's hyperholomorphic deformation theory (verbitsky-hyperholomorphic-bundles) and O'Grady's modularity theory (OG22, OG26c). The lattice-theoretic conditions appear to mirror those in O'Grady (OG26c) for the n=2 case, generalized using Markman's monodromy description of K3^{[n]}-type. The complete chain of dependencies (Verbitsky deformability of Azumaya algebras, generic diagonal twistor paths, Lemma 5.14 of Markman) is invoked but the verification that the explicit numerical hypotheses on r are exactly the ones needed for the lattice-theoretic Lemmata of Section 2 to close cannot be confirmed from the introduction-level text alone. The headline statements (rank, c_1, discriminant formulae) are consistent with Construction 13 fibre invariants from markmanstable Lemma 11.1 and ogrady-moduli-sheaves-hk Example 3.2.10, propagated through parallel transport.",
      "id": "C1",
      "location": "Section 3 (Thm 37), referenced from Introduction Thm 1",
      "severity": "major",
      "suggested_fix": "Provide a self-contained numerical verification or a worked test of the divisibility constraints (conditions (1)-(3) for odd and even div(w)) against Markman's monodromy invariant ell(w); in code-amenable form, ship a Sage/Magma/Lean script under e.g. src/lattice/admissibility.sage that, given (n, w^2, div(w), r), verifies the three conditions and returns ell(w) by Markman's algorithm. Per the Proof-as-Code Axiom for math.* fields, the absence of such an executable certificate is itself a weakness for the headline arithmetic claim."
    },
    {
      "assessment": "partially_supported",
      "claim": "Corollary 2 (Cor 39): The Mukai-type correspondence tau_E induced by ch(E) sqrt(td_{X x Y}) is an isomorphism of level-zero rational Hodge structures and an isometry with respect to the Mukai pairing.",
      "evidence": "This is presented as a direct consequence of the derived equivalence in Thm 1 combined with results of (paolo_huy) and (markman). The general fact that a Fourier-Mukai equivalence induces a Mukai-pairing-preserving isomorphism of total cohomology is standard for K3 surfaces and extended to IHS manifolds in cited literature; the upgrade to a 'level-zero Hodge structure' isomorphism relies on a specific notion defined in equation [HSuntwisted] of the body, not visible at the introduction level.",
      "id": "C2",
      "location": "Introduction Corollary 2; Corollary 39 in body",
      "severity": "minor",
      "suggested_fix": "State explicitly the definition of 'level-zero Hodge structure [HSuntwisted]' and which theorem in (paolo_huy)/(markman) supplies the isometry property used here."
    },
    {
      "assessment": "partially_supported",
      "claim": "Corollary 3 (Cor 42): There exists a rational Hodge isometry psi_E: H^2(X,Q) -> H^2(Y,Q) which is a nontrivial rational multiple of the composition (cup with c_2(X)^{n-1}) followed by phi_E (induced by kappa(E) sqrt(td)).",
      "evidence": "This follows the package outlined in (markman) for K3^{[n]}-type derived equivalences. The 'nontrivial rational multiple' claim depends on a non-degeneracy argument that uses the explicit Chern data computed in Theorem 1 and a Fujiki-type pairing computation; the introduction defers this to the body.",
      "id": "C3",
      "location": "Introduction Corollary 3; Corollary 42 in body",
      "severity": "minor",
      "suggested_fix": "Make explicit in the body the constant of proportionality (or at minimum its sign/non-vanishing argument) in terms of (n, r, w^2)."
    },
    {
      "assessment": "supported",
      "claim": "Construction 13 invariants: For S a K3 with Pic(S)=Zh and u=(r,mh,s) isotropic with gcd(r,m)=gcd(r,s)=1, the universal bundle U^{[n]} on M^{[n]} x S^{[n]} has fibrewise rank r^n n!, first Chern class r^{n-1} n! m h - r^n n! delta/2, and discriminant (r^n n!)^2 c_2(S^{[n]})/12.",
      "evidence": "These identities are explicitly attributed to (markmanstable Lemma 11.1), (ogrady-moduli-sheaves-hk Example 3.2.10), and (OGrady2026 Remark 2.10), all of which are established literature. The structure of the Bridgeland-King-Reid-conjugated Fourier-Mukai kernel is standard, and the rank/c_1 formulas follow from a symmetric group invariants computation on the isospectral Hilbert scheme.",
      "id": "C4",
      "location": "Construction 13 / Section 1.3, equations (rank1), (c11), (eq_modularity1)",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Slope stability of E_x := E|_{{x} x Y} for all x in X: There exists a polarisation H on Y such that the restriction of the deformed projectively hyperholomorphic bundle E to {x} x Y is H-slope stable for every x in X, hence X is isomorphic to a component of M_{Y,H} and E is a universal family.",
      "evidence": "The argument is sketched as 'exploiting the symmetries of the Hermite-Einstein connection on End(E)' and uses the variation of slope stability across the Kahler cone collected in an appendix. Establishing universal slope stability of the family E_x as x ranges over X (as opposed to generic stability or polystability), together with the existence of a single polarisation H that works uniformly, is the most delicate step and the only one not directly imported from prior literature. Without access to the appendix in the visible excerpt, the chain from polystability of End(E) to slope stability of each fibre E_x is not verifiable.",
      "id": "C5",
      "location": "Idea of proof in Introduction; Section 3 (proof of Thm 37)",
      "severity": "major",
      "suggested_fix": "Make the role of the Kahler-cone-wide stability variation appendix explicit, and state precisely whether slope stability for all x follows by openness + properness or by an extra hyperholomorphic symmetry argument; cite the exact prior result (e.g. ogrady-moduli-sheaves-hk Cor 2.1.5 or markman Prop 5.22) that closes the gap."
    },
    {
      "assessment": "partially_supported",
      "claim": "Corollary 4: For (Y,w) in {}^n M_m^{(gamma)} (gamma in {1,2}, with n+m ≡ 1 mod 4 when gamma=2), the arithmetic conditions of Thm 1 are realised by explicit r,k with (k,r)=1 and m = r(2k - r(n-1)/2) (resp. k = w^2/(2r) integer, coprime to r), producing a derived-equivalent IHS component X of K3^{[n]}-type for generic Y.",
      "evidence": "This is an arithmetic specialisation of Theorem 1 to the universal families {}^n M_m^{(gamma)}. The numerical compatibility appears consistent with the main theorem's hypotheses, but the genericity assumption ('for generic Y') and its relation to the analytic open condition under which psi_E maps Kahler cones into Kahler cones is asserted without elaboration in the introduction.",
      "id": "C6",
      "location": "Section 4, Corollaries 44, 46",
      "severity": "minor",
      "suggested_fix": "Clarify which subset of {}^n M_m^{(gamma)} is excluded by 'generic' and whether this set has positive codimension in the moduli of polarised manifolds."
    },
    {
      "assessment": "partially_supported",
      "claim": "Corollary 5 (Beauville-Donagi, Debarre-Voisin, Iliev-Ranestad cases): For div(w)=2 and w^2 in {6, 22, 38} in K3^{[2]}-type, there exist H-slope stable modular vector bundles with explicit ranks 18, 2*11^2, 2*19^2 and discriminants 27 c_2(Y), 11^4 c_2(Y)/3, 19^4 c_2(Y)/3 respectively on the corresponding moduli components.",
      "evidence": "These are specialisations to the three classical locally complete families of polarised K3^{[2]}-type IHS manifolds. The Chern data are computed via the main theorem's formulae (rk = r^n n! with n=2, r in {3, 11, 19}). The cited recent work (OGrady2026, OG26c) constructs analogous components for K3^{[2]}-type; the consistency claim that these three classical cases lie in the construction's domain is plausible but requires verifying div(w)=2 and the arithmetic conditions, which is not done explicitly in the introduction.",
      "id": "C7",
      "location": "Corollary 5 / Corollary 47",
      "severity": "minor",
      "suggested_fix": "Provide a one-line numerical check (or table) showing that (r=3, w^2=6), (r=11, w^2=22), (r=19, w^2=38) satisfy conditions (1)-(3) of the div(w) even case of Thm 1."
    },
    {
      "assessment": "supported",
      "claim": "Stiefel-Whitney class properties (Remark 10): w(A) is preserved under deformation in simply connected families; for A = End(E), w(A) = -pi(c_1(E)) where pi reduces mod r; restriction to slices is compatible with i_x^* on H^2(-, Z/rZ).",
      "evidence": "Standard PGL_r / mu_r boundary map theory; consistent with (caldararu-nonfine-k3 Section 4) and (markman) treatments of topological twisting classes. The three listed properties are textbook consequences of the central extension 1 -> mu_r -> SL_r -> PGL_r -> 1 in the analytic topology on locally contractible paracompact spaces.",
      "id": "C8",
      "location": "Remark 10, Section 1.2",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Verbitsky's deformability for Azumaya algebras (Theorem 5): An omega-slope stable Azumaya algebra A with c_2(A) of Hodge type (2,2) along the omega-twistor line and vanishing c_1 of every direct summand extends to an Azumaya algebra on the entire twistor family.",
      "evidence": "Quoted verbatim from (markman_bbf Corollary 6.12), a published prerequisite.",
      "id": "C9",
      "location": "Theorem 5, Section 1.1",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Connectedness of diagonal twistor paths (Lemma 14 / Markman Lemma 5.14 and 5.8): Any two points in a fixed connected component of M_phi can be joined by a generic diagonal twistor path; the projection pi_i to M_Lambda^circ is surjective.",
      "evidence": "Direct citation of (markman Lemma 5.14, Lemma 5.8). These are established results used as a black box.",
      "id": "C10",
      "location": "Lemma 14, Section 1.3",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Modularity formula: For a torsion-free sheaf F on a 2n-dim IHS Y, F is modular with constant d(F) iff int_Y Delta(F) alpha^{2n-2} = d(F)(2n-3)!! q_Y(alpha)^{n-1} for all alpha in H^2(Y,C); in particular if Delta(F) is a multiple of c_2(Y) then F is modular.",
      "evidence": "Definition originally due to O'Grady (OG22 Section 3); the multiplicity-of-c_2 sufficiency is standard via the Fujiki relation int_Y c_2(Y) alpha^{2n-2} proportional to q_Y(alpha)^{n-1}.",
      "id": "C11",
      "location": "Introduction (definition of modular), citing O'Grady (OG22)",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Universal family E gives a Fourier-Mukai equivalence Phi_E: D^b(X) -> D^b(Y).",
      "evidence": "Asserted as 'part of Markman's package (markman)'. The Fourier-Mukai equivalence for a Markman-style projectively hyperholomorphic universal family on X x Y is a delicate consequence of (i) the bundle E being a projectively hyperholomorphic deformation of U^{[n]} (which is itself an FM kernel of an equivalence by Bridgeland-King-Reid conjugation), and (ii) Markman's transport of FM equivalence along generic diagonal twistor paths. The introduction sketch suffices to identify the package but does not exhibit the explicit lemma that transports the equivalence, particularly when the deformed bundle is genuinely twisted along the chain (cf. the twisted-untwisted dichotomy invoked via Stiefel-Whitney/B-fields).",
      "id": "C12",
      "location": "Theorem 1 part (3); Section 3",
      "severity": "major",
      "suggested_fix": "Cite the specific proposition in (markman) (e.g. Proposition 5.22 / 5.23) that transports the Fourier-Mukai equivalence along a generic diagonal twistor path and explain how vanishing of the obstructing Brauer class on the target component is ensured by the divisibility hypotheses (Section 1.5 'sec_vanishing_twist')."
    },
    {
      "assessment": "unsupported",
      "claim": "Executable verification of the lattice-theoretic admissibility conditions for the main theorem (conditions (1)-(3) for both odd and even div(w)) is not provided.",
      "evidence": "The paper relies on explicit divisibility, coprimality, and quadratic-form-modulo-divisor arguments that determine when ell(w) is realised by a chosen r. In a math.AG paper, these are exactly the kind of computations that can and should be backed by a short Sage/Magma/PARI script that, given a Mukai-type tuple, returns ell(w) and certifies the three conditions. The Proof-as-Code Axiom for math.* fields treats absence of such a certificate as a weakness for the headline arithmetic claim.",
      "id": "C13",
      "location": "Section 2 (lattice-theoretic Lemmata) and Section 3 (Theorem 37)",
      "severity": "major",
      "suggested_fix": "Ship src/lattice/check_admissibility.sage (or .lean) implementing Definition 33 (ell(w)) and Theorem 37 conditions; provide a unit test that verifies Corollary 5's three cases (r=3, w^2=6), (r=11, w^2=22), (r=19, w^2=38) and Corollary 4's family-level constraints."
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

1. apost_moduli_red: A. Apostolov, Moduli spaces of polarised irreducible symplectic manifolds are not necessarily connected, Ann. Inst. Fourier 64 (2014), no. 1, 189--202.
2. anchouche-biswas-einstein-hermitian: B. Anchouche, I. Biswas, Einstein-Hermitian connections on polystable principal bundles over a compact K\"ahler manifold, Amer.\ J.\ Math.\ 123 (2001), no. 2, 207--228.
3. Alper-StacksModuli: J. Alper, Stacks and Moduli, working draft (lecture notes), version January 5, 2026. Available at \url{https://sites.math.washington.edu/ jarod/moduli.pdf}.
4. Bea83: A. Beauville, Vari\'et\'es k\"ahl\'eriennes dont la premi\`ere classe de Chern est nulle, J.\ Differential Geom.\ 18 (1983), 755--782.
5. beckmann: T. Beckmann, Atomic objects on hyper-K\"ahler manifolds, J. Algebraic Geom. {\bf 34} (2025), no. 1, 109--160.
6. connectionontwistedhiggsbundles: I. Biswas, T. L. G\'omez, N. Hoffmann, A. Hogadi, Einstein--Hermitian connection on twisted Higgs bundles, C.\ R.\ Math.\ Acad.\ Sci.\ Paris 348 (2010), no. 17--18, 981--983
7. van-bree-gholampour-jiang-kool-pgl-sl: D. van Bree, A. Gholampour, Y. Jiang, M. Kool, A virtual $PGL_r$-$SL_r$ correspondence for projective surfaces, Moduli 2 (2025), e5, 1--41.
8. bridgeland-king-reid-mckay: T. Bridgeland, A. King, M. Reid, The McKay correspondence as an equivalence of derived categories, J.\ Amer.\ Math.\ Soc.\ 14 (2001), no. 3, 535--554.
9. bottini-macri-stellari-hk-varieties: A. Bottini, E. Macr\`i, P. Stellari, Hyper-K\"ahler varieties: Lagrangian fibrations, atomic sheaves, and categories, Preprint, \href{https://arxiv.org/abs/2603.23033}{arXiv:2603.23033}. arXiv:[2603.23033](https://arxiv.org/abs/2603.23033)
10. Bot24a: A. Bottini, Towards a modular construction of OG10, Compos. Math. 160 (2024), no. 10, 2496--2529.
11. Bot24b: A. Bottini, O'Grady's tenfolds from stable bundles on hyper-Kähler fourfolds, Preprint, \href{https://arxiv.org/abs/2411.18528}{arXiv:2411.18528}. arXiv:[2411.18528](https://arxiv.org/abs/2411.18528)
12. boucksom: S. Boucksom, Le cône kählérien d'une variété hyperkählérienne. C. R. Acad. Sci. Paris Sér. I Math. 333 (2001), no. 10, 935--938.
13. buskin-hodge-isometry-k3: N. Buskin, Every rational Hodge isometry between two K3 surfaces is algebraic, J.\ Reine Angew.\ Math.\ 755 (2019), 127--150.
14. caldararu-thesis: A. C\u{a}ld\u{a}raru, Derived categories of twisted sheaves on Calabi--Yau manifolds, Ph.D.\ thesis, Cornell University, 2000. Available at \url{https://people.math.wisc.edu/ caldararu/publications/ThesisSingleSpaced.pdf}.
15. caldararu-nonfine-k3: A. C\u{a}ld\u{a}raru, Nonfine moduli spaces of sheaves on K3 surfaces, Int.\ Math.\ Res.\ Not.\ 2002 (2002), no. 20, 1027--1056.
16. olivier_HK: O. Debarre, Hyper-Kähler manifolds, Milan J. Math. 90 (2022), no. 2, 305--387.
17. Fat24: E. Fatighenti, Examples of non-rigid, modular vector bundles on hyperk\"ahler manifolds, Int. Math. Res. Not. IMRN {\bf 2024}, no. 10, 8782--8793; MR4749187.
18. FO24: E. Fatighenti, C. Onorati, Modular vector bundles with and without moduli, Preprint, \href{https://arxiv.org/abs/2409.12821}{arXiv:2409.12821}. arXiv:[2409.12821](https://arxiv.org/abs/2409.12821)
19. FT25: A. Frassineti, F. Tufo, Modular vector bundles on hyperkähler manifolds of Debarre-Voisin type, Preprint, \href{https://arxiv.org/abs/2502.18360}{arXiv:2502.18360}. arXiv:[2502.18360](https://arxiv.org/abs/2502.18360)
20. gritsenko-hulek-sankaran-abelianisation: V. Gritsenko, K. Hulek, G. K. Sankaran, Abelianisation of orthogonal groups and the fundamental group of modular varieties, J.\ Algebra 322 (2009), no. 2, 463--478.
21. GHS_moduli_IHS: V. Gritsenko, K. Hulek, G. K. Sankaran, Moduli spaces of irreducible symplectic manifolds, Compos. Math. 146 (2010), no. 2, 404--434.
22. greb_ross_toma_moduli: D. Greb, J. Ross, M. Toma, Moduli of vector bundles on higher-dimensional base manifolds---construction and variation, Internat. J. Math. {\bf 27} (2016), no. 7, 1650054, 27 pp.
23. greb_toma: D. Greb, M. Toma, Compact moduli spaces for slope-semistable sheaves, Algebr. Geom. 4 (2017), no. 1, 40–-78.
24. hotchkissetal: J. Hotchkiss, D. Maulik, J- Shen, Q. Yin, R. Zhang, The period-index problem for hyper-K\"ahler varieties via hyperholomorphic bundles, Preprint, \href{https://arxiv.org/pdf/2502.09774}{arXiv:2502.09774}. arXiv:[2502.09774](https://arxiv.org/abs/2502.09774)
25. Huy-HK-basic: D. Huybrechts, Compact hyperk\"ahler manifolds: basic results, Invent.\ Math.\ 135 (1999), no. 1, 63--113. Erratum: Invent.\ Math.\ 152 (2003), 209--212.
26. Huy03: D. Huybrechts, Fourier--Mukai transforms in algebraic geometry, Oxford Mathematical Monographs, Oxford Univ. Press, Oxford, 2006.
27. HuyK3: D. Huybrechts, Lectures on K3 Surfaces, Camb.\ Stud.\ Adv.\ Math.\ 158 (2016).
28. HL10: D. Huybrechts, M. Lehn, The geometry of moduli spaces of sheaves (2nd ed.), Cambridge Univ.\ Press (2010).
29. huybrechts-schroeer-brauer: D. Huybrechts, S. Schr\"oer, The Brauer group of analytic K3 surfaces, Int.\ Math.\ Res.\ Not.\ 2003 (2003), no. 50, 2687--2698.
30. paolo_huy: D. Huybrechts, P. Stellari, Equivalences of twisted K3 surfaces, Math.\ Ann.\ 332 (2005), 901--936.
31. EPWcubes: A. Iliev, G. Kapustka, M. Kapustka, K. Ranestad, EPW cubes, J. Reine Angew. Math. 748 (2019), 241--268.
32. dejong-gabber: A. J. de Jong, A result of Gabber, Preprint, \url{https://www.math.columbia.edu/ dejong/papers/2-gabber.pdf}.
33. kapustka-kapustka-derived-equivalent-hk4: G. Kapustka, M. Kapustka, Constructions of derived equivalent hyper-K\"ahler fourfolds, Preprint, \href{https://arxiv.org/abs/2312.14543}, 2023. arXiv:[2312.14543](https://arxiv.org/abs/2312.14543)
34. krug-reede-zhang: A. Krug, F. Reede, Z. Zhang, Moduli spaces of generalised tautological bundles on Hilbert schemes, Preprint, \href{https://arxiv.org/abs/2510.11298}{arXiv:2510.11298}. arXiv:[2510.11298](https://arxiv.org/abs/2510.11298)
35. LLSvS: C. Lehn, M. Lehn, C. Sorger, D. van Straten, Twisted cubics on cubic fourfolds, J. Reine Angew. Math. 731 (2017), 87--128.
36. Mar08: E. Markman, On the monodromy of moduli spaces of sheaves on K3 surfaces, J.\ Algebraic Geom.\ 17 (2008), no. 3, 29--99.
37. Mar10: E. Markman, Integral constraints on the monodromy group of the hyperk\"ahler resolution of a symmetric product of a K3 surface, Int.\ J.\ Math.\ 21 (2010), 169--223.
38. Mar11: E. Markman, A survey of Torelli and monodromy results for holomorphic-symplectic varieties, in Complex and differential geometry, Springer Proc.\ Math.\ 8, Springer, Heidelberg, 2011, 257--322.
39. markman_bbf: E. Markman, The Beauville--Bogomolov class as a characteristic class, J.\ Algebraic Geom.\ 29 (2020), no. 2, 199--245.
40. markmanstable: E. Markman, Stable vector bundles on a hyper-K\"ahler manifold with a rank $1$ obstruction map are modular, Kyoto J.\ Math.\ 64 (2024), no. 3, 635--742.
41. markman: E. Markman, \textit{Rational Hodge isometries of hyper-K\"ahler varieties of $K3^{[n]}$-type are algebraic}, Compos.\ Math.\ 160 (2024), no. 6, 1261--1303.
42. dequivconj: D. Maulik, J. Shen, Q. Yin, R. Zhang, The D-equivalence conjecture for hyper-K\"ahler varieties via hyperholomorphic bundles, Invent.\ Math.\ 241 (2025), no. 1, 309--324.
43. Mukai1: S. Mukai, Symplectic structure of the moduli space of sheaves on an abelian or K3 surface, Invent. Math. 77, 1984, no. 1, 101--116.
44. Mukai2: S. Mukai, On the moduli space of bundles on K3 surfaces. I, in Vector Bundles on Algebraic Varieties (Bombay, 1984), Tata Inst.\ Fund.\ Res.\ Stud.\ Math.\ 11, 1987, 341--413.
45. OG15: K. G. O'Grady, Periods of double EPW-sextics, Math. Z. 280 (2015), no. 1--2, 485--524.
46. OG22: K. G. O'Grady, Modular sheaves on hyperkähler varieties, Algebr. Geom. 9 (2022), no. 1, 1--38.
47. OGrady2026: K. G. O'Grady, Modular sheaves with many moduli, Geom.\ Topol.\ 30 (2026), no. 1, 203--246.
48. ogrady-moduli-sheaves-hk: K. G. O'Grady, Moduli of sheaves on hyperk\"ahler manifolds, Preprint, \href{https://arxiv.org/abs/2602.23194}{arXiv:2602.23194}. arXiv:[2602.23194](https://arxiv.org/abs/2602.23194)
49. OG26c: K. G. O'Grady, \textit{HK manifolds of Type $K3^{[a^2+1]}$ as moduli spaces of projective bundles on HK manifolds of Type $K3^{[2]}$}, Preprint, \href{https://arxiv.org/abs/2606.03775}{arXiv:2606.03775}. arXiv:[2606.03775](https://arxiv.org/abs/2606.03775)
50. pavel_toma_survey: M. Pavel, M. Toma, Slope-semistability and moduli of coherent sheaves: a survey, Rev.\ Roumaine Math.\ Pures Appl.\ 70 (2025), no. 1--2, 85--105.
51. reede-zhang-smooth-components: F. Reede, Z. Zhang, Examples of smooth components of moduli spaces of stable sheaves, Manuscripta Math.\ 165 (2021), no. 3--4, 605--621.
52. schroer-analytic-brauer: S. Schr\"oer, Topological methods for complex-analytic Brauer groups, Topology 44 (2005), no. 5, 875--894.
53. tae23: L. Taelman, Derived equivalences of hyperkähler varieties, Geom. Topol., 27 7 (2023), 2649-2693.
54. verbitsky-hyperholomorphic-bundles: M. Verbitsky, Hyperholomorphic bundles over a hyperk\"ahler manifold, J.\ Algebraic Geom.\ 5 (1996), no. 4, 633--669.
55. verbitsky-hyperholomorphic-sheaves: M. Verbitsky, Hyperholomorphic sheaves and new examples of hyperk\"ahler manifolds, in Hyperk\"ahler Manifolds, International Press, Somerville, MA, 1999, 15--127.
56. Ver09: M. Verbitsky, Mapping class group and a global Torelli theorem for hyperk\"ahler manifolds, Duke Math.\ J.\ 162 (2013), no. 15, 2929--2986. Appendix A by Eyal Markman.
57. Yoshioka: K. Yoshioka, Stability and the Fourier-Mukai transform. II, Compos. Math. {\bf 145} (2009), no. 1, 112--142.
58. zhang: R. Zhang, \textit{A twisted derived category of hyper-K\"ahler varieties of $K3^{[n]}$-type}, Preprint, \href{https://arxiv.org/pdf/2502.02143}{arXiv:2502.02143}. arXiv:[2502.02143](https://arxiv.org/abs/2502.02143)

