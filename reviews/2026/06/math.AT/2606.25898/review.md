# \vspace{-1cm}Structured Quotients in Real Homotopy Theory

GrokRxiv review of [arXiv:2606.25898](https://arxiv.org/abs/2606.25898) · `math.AT`

_Authors_: Ryan Quinn, Qi Zhu

## TL;DR

The five specialist reviews converge on a paper with significant mathematical novelty (novelty_score 0.72, verdict 'significant') and generally coherent arguments (technical_correctness overall_correctness 'mostly_sound'), but with reproducibility and verification gaps that require author action before acceptance. The paper works in math.AT (code-amenable field) and the reproducibility specialist flagged three critical concerns — no formal proof artifacts for Theorems 1, 2, and 3 — plus two major concerns for Corollary 2 and absence of any public code repository. The technical correctness specialist (confidence 0.62) rated Proposition 5 'unsupported' and Propositions 2 and 4 / Theorem 3 as 'partially_supported' at major severity, because the finite-field computations underlying the negative half of Theorem 3 are delegated to the reader with no verification artifact. Multiple headline results chain through the companion arXiv:2512.15573 (Quinn–Zhu) without self-contained restatements of the imported lemmas, making independent verification conditional on a separate preprint. Citation hygiene is adequate but marred by duplicate bibliography entries for arXiv:2512.15573 (keys QZ25 and quinnZhu2026multiplicativeequivariantthomspectra) and likely for Hahn–Wilson (HWv2 / hahnWilson2022redshift), and by malformed DOI fields in several entries. Applying the recommendation gate: the field is math.* (code-amenable), reproducibility flagged critical missing proof-as-code for all three main theorems, and technical correctness flagged Proposition 5 as unsupported (severity major), which underpins the negative half of the headline Theorem 3. Because the missing computational artifacts for a finite-field algebraic claim (Proposition 5) and the unverified inductive step (Theorem 4) are precisely the kind of verifiable-by-computer evidence whose absence blocks independent trust of a headline result, the gate defaults to major_revision. Rejection is not warranted because the technical reviewer finds the overall structure 'mostly_sound,' the novelty is substantial, and the identified gaps are addressable by supplying computational scripts and expanding two proof sketches.

_Recommendation_: **Major revision** · _Confidence_: 70%

## Strengths

- Theorem 1 is the first construction of E_σ-algebra structures on quotients of the non-periodic Real bordism spectrum MU_R, answering an open question of Angelini-Knoll–Kong–Quigley and an AimPL problem of Hahn–Wilson, with the harder non-periodic case requiring fundamentally different methods than the existing Hahn–Shi result for MUP_R.
- Theorem 3 delivers a sharp, complete characterization of when K(h)-localization of BP^(G)⟨m⟩ is equivalent to Lubin-Tate theory—holding if and only if n=1 or (m,n)=(1,2)—via a concrete F_4-point comparison that provides a clear and checkable criterion.
- Theorem 2 provides the first explicit factorizations BP^(G)⟨m⟩ → E(k,Γ_h) for higher truncated Brown–Peterson spectra, unlocking downstream applications including the Meier–Shi–Zeng transchromatic isomorphism theorem and a new equivariant model for higher real K-theories.
- The paper's scope and range are exceptional: a single framework (equivariant designer polynomial algebras via parametrized operadic Kan extension) simultaneously recovers equivariant analogues of Angeltveit, Basu–Sagave–Schlichtkrull, Hahn–Wilson, and Strickland, and produces new corollaries in chromatic homotopy and algebraic K-theory.

## Weaknesses

- Proposition 5's finite-field computation—the load-bearing step for the negative half of Theorem 3—is delegated as an 'algebra exercise' with no verification script, leaving the claim rated 'unsupported' by the technical reviewer; this is the most critical gap given the paper's code-amenable classification.
- Proposition 2 (the E_2-to-E_ρ lifting theorem) imports Roytman 2023 Theorem 6.1 as a black box without restating its hypotheses in the paper's conventions or sketching how finite-generatedness of π^{C_2}_{iρ}(E) kills the relevant obstruction classes; as the primary mechanism enabling Theorem 1, any subtlety here propagates globally.
- Multiple headline results depend on unrestated results from the companion preprint arXiv:2512.15573 (Quinn–Zhu), including the operadic left Kan extension along the Real J-homomorphism and the structured retraction theorem for BHSZ orientations; independent verification is conditional on a separate, as-yet-preprint work.
- Theorem 4 (v_k ≡ V_k mod I_k), whose correctness underpins Proposition 5 and thus Theorem 3, involves a substantial nested induction on index manipulations (γ_n^{2^s} = γ_{n−s}) presented only at headline level with no executable verification for small cases.
- The bibliography contains duplicate entries for the same arXiv:2512.15573 paper under keys QZ25 and quinnZhu2026multiplicativeequivariantthomspectra (differing only in key name and year label), a likely duplication between HWv2 and hahnWilson2022redshift for the Hahn–Wilson redshift paper, and multiple entries (HEWETT1995518, HahnYuan, MahowaldRezkfp) with malformed DOI fields containing full resolver URLs rather than bare DOI identifiers.

## Revision Targets

- [ ] **Manuscript: Theorem 3 (mainthm: characterization), Section 3.3**
  - Location: `corrections/2606.25898/paper.tex` at `Theorem 3 (mainthm: characterization), Section 3.3`
  - Evidence: The positive direction is established in Proposition 4 (cases n=1 and (m,n)=(1,2)) via direct algebraic identification of v_1, v_2 with t_1^{C_4}+\gamma t_1^{C_4} etc.; the (n=1) case follows from D=\bar{v}_h via BHSZ Prop. 6.3. The negative direction (Theorem 5) reduces to Proposition 5 by counting F_4-points after modding out by (2,v_1,\ldots,v_{h-1}). The reduction from a non-isomorphism of associated affine schemes to a non-equivalence of BP-modules is correct but does require the strong-evenness/Borel-completion machinery to identify the underlying ring with F_2[a_{r,i}][V_h^{-1}]/(V_1,\ldots,V_{h-1}). The F_4-point counts in Proposition 5 are constructive but presented as algebra exercises; the verification B_m(A_m(T))=T+T^{2^{2m}} is stated without explicit expansion.
  - Required change: Ship a small computer-algebra script (SageMath / Macaulay2) at experiments/F4_points/verify.sage that (a) verifies B_m(A_m(T))=T+T^{2^{2m}} symbolically over F_4 for m up to e.g. 5, (b) enumerates F_4-points for small (n,m) pairs to confirm the 3^{2^{n-2}} and "at least four" counts, and (c) confirms the recursive formula V_k≡v_k mod I_k for small n. Without this, the explicit polynomial construction in Proposition 5(ii) is the most fragile load-bearing step and is a natural candidate for the proof-as-code axiom in this code-amenable field.
  - Verification: Re-review should confirm `Theorem 3 (mainthm: characterization), Section 3.3` is corrected or justified.
- [ ] **Manuscript: Proposition 2 (prop:lift), Section 2.1**
  - Location: `corrections/2606.25898/paper.tex` at `Proposition 2 (prop:lift), Section 2.1`
  - Evidence: The proof reduces lifting to a question on group-completed C_2-mapping spaces and applies a Roytman 2023 (Theorem 6.1) obstruction calculation. The chain {E_\rho-algebra maps} ≃ {E_\rho^{gp}-maps into GL_1 E} relies on standard recognition, but the descent step to E_2 vs E_\rho is delicate: in equivariant little-disks theory, the E_2 to E_\rho lifting is not generically automatic and the finiteness hypothesis on \pi^{C_2}_{i\rho}(E) only appears at the end. From the bounded text, the precise way this hypothesis trivializes the obstruction is not transparent, and the cited Roytman 2023 Thm 6.1 is load-bearing without a self-contained restatement. Because Proposition 2 is then used to obtain the structured Real Snaith equivalence and the E_\sigma structure on Real bordism quotients, any subtle hypothesis failure would propagate.
  - Required change: Restate Roytman 2023 Theorem 6.1 in the conventions of this paper, or include a one-paragraph sketch of why finitely-generated \pi^{C_2}_{i\rho}(E) suffices to kill the obstruction classes that distinguish E_\rho from E_2-with-extra-structure. Where appropriate, add concrete small-case checks (e.g. n=0,1) in an appendix or supplementary computation.
  - Verification: Re-review should confirm `Proposition 2 (prop:lift), Section 2.1` is corrected or justified.
- [ ] **Manuscript: Theorem 1 / Theorems thm:MUR_quotients (Sec. 2) and thm:MUG_quotients (Sec. 2)**
  - Location: `corrections/2606.25898/paper.tex` at `Theorem 1 / Theorems thm:MUR_quotients (Sec. 2) and thm:MUG_quotients (Sec. 2)`
  - Evidence: The proof combines (a) the designer polynomial algebra construction (Proposition 1) via parametrized operadic left Kan extension along the Real J-homomorphism, (b) the lifting Proposition 2, and (c) a Thom-spectrum / total-cofiber identification. The construction is internally consistent and uses standard parametrized-higher-algebra machinery. However, multiple load-bearing inputs (operadic left Kan extension along E_\infty^{C_2}-maps; coinduction interaction with twisted norm quotients; the BU_R structure on Pic_{C_2}) are cited to quinnZhu2026multiplicativeequivariantthomspectra (Construction 2.2.5, Appendix A.2, Cor. 3.3.9, Cor. 6.1.6, Cor. 6.2.2, Thm. 6.3.3), the authors' own companion paper. From the bounded text I cannot independently verify those imported lemmas, so the result is contingent on their correctness.
  - Required change: Either (i) include a self-contained appendix sketching the cited inputs from quinnZhu2026multiplicativeequivariantthomspectra (operadic left Kan extension along the Real J-homomorphism, parametrized lifting), or (ii) explicitly mark the dependency on that work and confirm it is publicly accessible (arXiv link, version pinned) before the present paper goes to print.
  - Verification: Re-review should confirm `Theorem 1 / Theorems thm:MUR_quotients (Sec. 2) and thm:MUG_quotients (Sec. 2)` is corrected or justified.
- [ ] **Manuscript: Proposition 5 (prop: F4 points computation), Section 3.3**
  - Location: `corrections/2606.25898/paper.tex` at `Proposition 5 (prop: F4 points computation), Section 3.3`
  - Evidence: The proof gives explicit F_4-point constructions: in (i) by setting (\alpha_{0,1},\ldots,\alpha_{2^{n-1}-1,1})=(c_0,c_0,c_1,c_1,\ldots), and in (ii) by exhibiting polynomials A_m,B_m\in F_4[T] satisfying B_m(A_m(T))=T+T^{2^{2m}} with the displayed coefficients. The verification of B_m(A_m(T))=T+T^{2^{2m}} is delegated to the reader as "an algebra exercise". This is exactly the situation contemplated by the proof-as-code axiom: the claim is purely algebraic, finite-field, and trivially verifiable by computer algebra, yet the paper does not ship the verification artifact. While I find the construction plausible, the absence of an executable verification artifact is a substantive weakness for a load-bearing computation that underwrites half of the headline Theorem 3.
  - Required change: Ship an executable verification script (e.g. experiments/F4_points/verify_prop5.sage) that (a) symbolically confirms B_m(A_m(T))=T+T^{2^{2m}} for m∈{2,3,4,5,6} via SageMath polynomial arithmetic over F_4, (b) enumerates F_4-points exhaustively for small (n,m) and matches against 3^{2^{n-2}} and ≥4, and (c) verifies the recursion identity using S_m and R(T) symbolically. Reference this artifact in the proof of Proposition 5.
  - Verification: Re-review should confirm `Proposition 5 (prop: F4 points computation), Section 3.3` is corrected or justified.
- [ ] **Bibliography: MahowaldRezkfp**
  - Location: bibliography entry: `MahowaldRezkfp`
  - Evidence: The url field is malformed: it is missing the 'https://' scheme prefix. An arxiv field value of '1999.0043' appears to echo the DOI suffix rather than denoting an actual arXiv identifier; this 1999 paper predates arXiv math.AT systematic coverage. Not visible in any rendered citation context.
  - Required change: Verify `MahowaldRezkfp` against an authoritative source; replace it with a resolvable relevant citation or remove it.
  - Verification: Re-review should confirm the citation resolves and is relevant.

## Open Questions

- Can the authors supply an executable SageMath or Macaulay2 script confirming (a) B_m(A_m(T)) = T + T^{2^{2m}} over F_4 for m ∈ {2,3,4,5,6}, (b) the 3^{2^{n-2}} F_4-point count for small n by exhaustive enumeration, and (c) the recursion v_k ≡ V_k mod I_k for small (n,k) pairs as described in Theorem 4?
- Does Roytman 2023 Theorem 6.1 apply verbatim in this paper's conventions, and can the authors add a one-paragraph sketch showing how finitely-generated π^{C_2}_{iρ}(E) suffices to trivialize the obstruction classes that distinguish E_ρ from E_2-with-additional-structure in the equivariant little-disks context?
- Will arXiv:2512.15573 (Quinn–Zhu, companion paper) be publicly accessible at a pinned version before this paper is finalized, and can the bibliography be updated to cite exact theorem numbers (Construction 2.2.5, Appendix A.2, Cor. 3.3.9, Cor. 6.1.6, Cor. 6.2.2, Thm. 6.3.3) with a version-locked arXiv link?
- Corollary 3 (Real BSS Thom-spectrum description) relies on methods from arXiv:2512.15573 rather than a direct equivariantization of Basu–Sagave–Schlichtkrull; which specific theorem of that companion paper provides the E_σ-algebra-level Thom isomorphism, and can the authors add a dedicated paragraph making this explicit?
- Can the duplicate bibliography entries for arXiv:2512.15573 (QZ25 vs. quinnZhu2026multiplicativeequivariantthomspectra) and for the Hahn–Wilson redshift paper (HWv2 vs. hahnWilson2022redshift) be consolidated to single canonical keys, and the malformed DOI fields in HEWETT1995518, HahnYuan, and MahowaldRezkfp corrected to bare DOI identifiers?

## Per-Agent Reviews

### citation (`claude-sonnet-4-6`) — status: `warn`

```json
{
  "confidence": 0.68,
  "entries": [
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Natalie Stewart"
        ],
        "doi": null,
        "key": "StewartDunn",
        "raw": "title=Equivariant Higher Algebra, author=Natalie Stewart, year=2026, url=https://dash.harvard.edu/entities/publication/df60734e-53b2-47f9-88e2-08cd201a8b5e, NOTE = Doctoral Dissertation, Harvard University Graduate School of Arts and Sciences",
        "title": "Equivariant Higher Algebra",
        "url": "https://dash.harvard.edu/entities/publication/df60734e-53b2-47f9-88e2-08cd201a8b5e",
        "venue": "Doctoral Dissertation, Harvard University Graduate School of Arts and Sciences",
        "year": 2026
      },
      "exists": null,
      "explanation": "Stewart's doctoral dissertation provides the Dunn map theorem (Theorem III) and the tensor product of equivariant operads that are structural inputs for the paper's E_σ-algebra constructions and coinduction arguments.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2606.23309",
        "authors": [
          "Ryan Quinn",
          "Qi Zhu"
        ],
        "doi": null,
        "key": "quinnZhu20206realsnaith",
        "raw": "title=Structured Real Snaith Equivalences, author=Ryan Quinn and Qi Zhu, year=2026, eprint=2606.23309, archivePrefix=arXiv, primaryClass=math.AT, url=https://arxiv.org/abs/2606.23309",
        "title": "Structured Real Snaith Equivalences",
        "url": "https://arxiv.org/abs/2606.23309",
        "venue": null,
        "year": 2026
      },
      "exists": null,
      "explanation": "Authors' companion paper cited once for producing E_{2ρ}-algebra maps from MU_R to restrictions of Lubin–Tate theory, providing one specific ingredient in the orientation arguments of Section 3.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "AimPL"
        ],
        "doi": null,
        "key": "AimPL_equivstable_5",
        "raw": "author = AimPL, title = Equivariant techniques in stable homotopy theory, Section 5: Partially commutative ring spectra, howpublished = \\url{http://aimpl.org/equivstable/5/}, note = Available at \\url{http://aimpl.org/equivstable/5/}; accessed 2026-06-02",
        "title": "Equivariant techniques in stable homotopy theory, Section 5: Partially commutative ring spectra",
        "url": "http://aimpl.org/equivstable/5/",
        "venue": "AimPL workshop problem list",
        "year": null
      },
      "exists": null,
      "explanation": "Cited for Problem 5.5, attributed to Hahn–Wilson, which asks for E_σ-structures on generalized higher truncated Brown–Peterson spectra; the current paper answers this question affirmatively.",
      "notes": "The listed author 'AimPL' is the workshop platform rather than the scientific contributors; no publication year is given. This is an online problem list, not a peer-reviewed article, and should ideally credit the relevant session organizers or contributors. Accessed date is provided, which is appropriate for web resources.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2605.11390",
        "authors": [
          "Sophus Valentin Willumsgaard"
        ],
        "doi": null,
        "key": "willumsgaard2026obstructionsassociativitystablehomotopy",
        "raw": "title=Obstructions for Associativity in Stable Homotopy Theory, author=Sophus Valentin Willumsgaard, year=2026, eprint=2605.11390, archivePrefix=arXiv, primaryClass=math.AT, url=https://arxiv.org/abs/2605.11390",
        "title": "Obstructions for Associativity in Stable Homotopy Theory",
        "url": "https://arxiv.org/abs/2605.11390",
        "venue": null,
        "year": 2026
      },
      "exists": null,
      "explanation": "Cited in the introductory survey of techniques for constructing multiplicative structures on quotients in stable homotopy; provides obstruction-theoretic context complementing the paper's positive existence results.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "P. G. Goerss",
          "M. J. Hopkins"
        ],
        "doi": "10.1017/CBO9780511529955.009",
        "key": "GoerssHopkins2004Moduli",
        "raw": "author = Goerss, P. G. and Hopkins, M. J., title = Moduli spaces of commutative ring spectra, booktitle = Structured Ring Spectra, series = London Mathematical Society Lecture Note Series, volume = 315, pages = 151--200, publisher = Cambridge University Press, year = 2004, doi = 10.1017/CBO9780511529955.009",
        "title": "Moduli spaces of commutative ring spectra",
        "url": null,
        "venue": "Structured Ring Spectra, London Mathematical Society Lecture Note Series, vol. 315",
        "year": 2004
      },
      "exists": null,
      "explanation": "A classical reference on moduli of commutative ring spectra; likely used for background on obstruction theory for structured ring spectra in sections not captured by the rendered citation contexts.",
      "notes": "This entry does not appear in any citation context visible in the bounded prompt. Its role in the paper is unclear from the rendered text; it may be cited in technical sections on obstruction theory or moduli of E_∞-structures not rendered here.",
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "1502.07611",
        "authors": [
          "Michael A. Hill",
          "Michael J. Hopkins",
          "Douglas C. Ravenel"
        ],
        "doi": "10.1515/forum-2016-0017",
        "key": "HillHopkinsRavenel2017C4RealKTheory",
        "raw": "author = Hill, Michael A. and Hopkins, Michael J. and Ravenel, Douglas C., title = The slice spectral sequence for the C_4 analog of real K-theory, journal = Forum Mathematicum, volume = 29, number = 2, pages = 383--447, year = 2017, doi = 10.1515/forum-2016-0017, eprint = 1502.07611",
        "title": "The slice spectral sequence for the C_4 analog of real K-theory",
        "url": null,
        "venue": "Forum Mathematicum",
        "year": 2017
      },
      "exists": null,
      "explanation": "Hill–Hopkins–Ravenel's C_4 slice spectral sequence computation is directly related to the equivariant height-4 Lubin–Tate theory discussed in the paper's periodicity applications; likely cited in the technical sections on RO(G)-graded computations.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2410.10726",
        "authors": [
          "Juan C. Moreno Del Angel"
        ],
        "doi": null,
        "key": "delangel2024dualshigherrealktheories",
        "raw": "title=Duals of higher real K-theories at p=2, author=Juan C. Moreno Del Angel, year=2024, eprint=2410.10726, archivePrefix=arXiv, primaryClass=math.AT, url=https://arxiv.org/abs/2410.10726",
        "title": "Duals of higher real K-theories at p=2",
        "url": "https://arxiv.org/abs/2410.10726",
        "venue": null,
        "year": 2024
      },
      "exists": null,
      "explanation": "Cited in the orientations section to describe an alternative approach (Proposition 3) for producing factorizations through BP^((G))⟨m⟩ under the more restrictive hypothesis of an E_2-ring map MU_R → Res^G_{C_2} E(k,Γ_h), contrasting with the current paper's method.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2403.00741",
        "authors": [
          "Lennart Meier",
          "XiaoLin Danny Shi",
          "Mingcong Zeng"
        ],
        "doi": null,
        "key": "meier2024transchromaticphenomenaequivariantslice",
        "raw": "title=Transchromatic phenomena in the equivariant slice spectral sequence, author=Lennart Meier and XiaoLin Danny Shi and Mingcong Zeng, year=2024, eprint=2403.00741, archivePrefix=arXiv, primaryClass=math.AT, url=https://arxiv.org/abs/2403.00741",
        "title": "Transchromatic phenomena in the equivariant slice spectral sequence",
        "url": "https://arxiv.org/abs/2403.00741",
        "venue": null,
        "year": 2024
      },
      "exists": null,
      "explanation": "The Meier–Shi–Zeng transchromatic isomorphism theorem is one of the principal applications of Theorem 2; the paper's factorization maps BP^((G))⟨m⟩ → E(k,Γ_h) are explicitly identified as a key input for this theorem.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Ryan Quinn"
        ],
        "doi": null,
        "key": "Qtmf15",
        "raw": "author = Ryan Quinn, title = Topological modular forms with level structure and higher truncated Brown-Peterson spectra, note = In preparation, year = 2026",
        "title": "Topological modular forms with level structure and higher truncated Brown-Peterson spectra",
        "url": null,
        "venue": "In preparation",
        "year": 2026
      },
      "exists": null,
      "explanation": "Quinn's forthcoming work on topological modular forms with level structure is likely cited for results connecting tmf to the truncated Brown–Peterson spectra studied here, in sections not captured by the rendered citation contexts.",
      "notes": "This is a work in preparation by one of the paper's authors and is not yet publicly available or verifiable. Citation of unpublished in-preparation work is standard practice in homotopy theory but limits external verification.",
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Mark Mahowald",
          "Charles Rezk"
        ],
        "doi": "10.1353/ajm.1999.0043",
        "key": "MahowaldRezkfp",
        "raw": "author = Mahowald, Mark and Rezk, Charles, title = Brown-Comenetz duality and the Adams spectral sequence, journal = Am. J. Math., volume = 121, number = 6, pages = 1153--1177, year = 1999, doi = 10.1353/ajm.1999.0043, url = citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.23.8631",
        "title": "Brown-Comenetz duality and the Adams spectral sequence",
        "url": "citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.23.8631",
        "venue": "American Journal of Mathematics",
        "year": 1999
      },
      "exists": null,
      "explanation": "Mahowald–Rezk's work on Brown–Comenetz duality and the Adams spectral sequence is a classical chromatic reference likely cited in computational sections not rendered here, possibly related to the K(h)-local arguments or duality in the paper.",
      "notes": "The url field is malformed: it is missing the 'https://' scheme prefix. An arxiv field value of '1999.0043' appears to echo the DOI suffix rather than denoting an actual arXiv identifier; this 1999 paper predates arXiv math.AT systematic coverage. Not visible in any rendered citation context.",
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "T. Hewett"
        ],
        "doi": "https://doi.org/10.1006/jabr.1995.1101",
        "key": "HEWETT1995518",
        "raw": "title = Finite Subgroups of Division Algebras over Local Fields, journal = Journal of Algebra, volume = 173, number = 3, pages = 518-548, year = 1995, doi = https://doi.org/10.1006/jabr.1995.1101, url = https://www.sciencedirect.com/science/article/pii/S0021869385711015, author = T. Hewett",
        "title": "Finite Subgroups of Division Algebras over Local Fields",
        "url": "https://www.sciencedirect.com/science/article/pii/S0021869385711015",
        "venue": "Journal of Algebra",
        "year": 1995
      },
      "exists": null,
      "explanation": "Hewett's classification of finite subgroups of division algebras over local fields is relevant to determining the structure of the subgroups C(k,m) of the extended Morava stabilizer group that appear in the statement of Theorem 2 and Corollary 2.",
      "notes": "The doi field contains the full resolver URL 'https://doi.org/10.1006/jabr.1995.1101' rather than just the DOI identifier '10.1006/jabr.1995.1101'. An arxiv field value '1995.1101' present in the raw entry appears to echo the DOI suffix rather than an actual arXiv identifier; this 1995 paper predates arXiv.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Christian Carrick",
          "Michael A. Hill"
        ],
        "doi": "10.1090/bproc/265",
        "key": "CarrickHillMU",
        "raw": "author = Carrick, Christian and Hill, Michael A., title = On MU-homology of connective models of higher real K-theories, journal = Proc. Am. Math. Soc., Ser. B, volume = 12, pages = 172--186, year = 2025, doi = 10.1090/bproc/265",
        "title": "On MU-homology of connective models of higher real K-theories",
        "url": null,
        "venue": "Proceedings of the American Mathematical Society, Series B",
        "year": 2025
      },
      "exists": null,
      "explanation": "Carrick–Hill's computation of MU-homology for connective higher real K-theory models is directly relevant to understanding the spectra produced by the paper's orientation maps; cited for complementary structural results.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Vigleik Angeltveit"
        ],
        "doi": "10.2140/gt.2008.12.987",
        "key": "Angeltveit_2008",
        "raw": "title=Topological Hochschild homology and cohomology of A_∞-ring spectra, volume=12, DOI=10.2140/gt.2008.12.987, number=2, journal=Geometry & Topology, author=Angeltveit, Vigleik, year=2008, pages=987–1032",
        "title": "Topological Hochschild homology and cohomology of A_∞-ring spectra",
        "url": "http://dx.doi.org/10.2140/gt.2008.12.987",
        "venue": "Geometry & Topology",
        "year": 2008
      },
      "exists": null,
      "explanation": "Angeltveit's establishment of A_∞ multiplicative structures on MU-quotients is directly enhanced by Theorem 1 of the current paper; the authors explicitly state that their E_σ-algebra result upgrades Angeltveit's associative multiplications to the equivariant setting.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "N. P. Strickland"
        ],
        "doi": "10.1090/S0002-9947-99-02436-8",
        "key": "stricklandMU",
        "raw": "author = Strickland, N. P., title = Products on MU-modules, journal = Trans. Am. Math. Soc., volume = 351, number = 7, pages = 2569--2606, year = 1999, doi = 10.1090/S0002-9947-99-02436-8",
        "title": "Products on MU-modules",
        "url": null,
        "venue": "Transactions of the American Mathematical Society",
        "year": 1999
      },
      "exists": null,
      "explanation": "Strickland's foundational work constructing products on MU-modules is one of the earliest techniques for building multiplicative structures on MU-quotients; cited in the introduction as a key predecessor to the equivariant theory developed in this paper.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2203.14787",
        "authors": [
          "Robert Burklund"
        ],
        "doi": null,
        "key": "burklund2022multiplicativestructuresmoorespectra",
        "raw": "title=Multiplicative structures on Moore spectra, author=Robert Burklund, year=2022, eprint=2203.14787, archivePrefix=arXiv, primaryClass=math.AT, url=https://arxiv.org/abs/2203.14787",
        "title": "Multiplicative structures on Moore spectra",
        "url": "https://arxiv.org/abs/2203.14787",
        "venue": null,
        "year": 2022
      },
      "exists": null,
      "explanation": "Cited in the introductory survey of multiplicative structure techniques on quotients, providing context for the difficulty of Moore spectrum ring structures that motivates the more delicate equivariant setting addressed by the paper.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "M. J. Hopkins",
          "J. Lurie"
        ],
        "doi": null,
        "key": "hopkinslurieambi",
        "raw": "title=Ambidexterity in K(n)-Local Stable Homotopy Theory, AUTHOR = Hopkins, M. J. and Lurie, J., month=December, year=2013, NOTE = Ambidexterity.pdf",
        "title": "Ambidexterity in K(n)-Local Stable Homotopy Theory",
        "url": "https://www.math.ias.edu/~lurie/papers/Ambidexterity.pdf",
        "venue": "Preprint, Institute for Advanced Study",
        "year": 2013
      },
      "exists": null,
      "explanation": "Hopkins–Lurie's ambidexterity paper is foundational for K(n)-local stable homotopy and Lubin–Tate theory; cited in the introduction among the techniques for multiplicative structures, with broader relevance to the paper's chromatic orientation theory.",
      "notes": "The raw LaTeX for the URL contains a space character in the path (rendered as 'math.ias.edu/ lurie/...') which is a typographic artifact from the LaTeX href command; the intended URL is 'https://www.math.ias.edu/~lurie/papers/Ambidexterity.pdf'. This is an unpublished preprint.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Jacob Lurie"
        ],
        "doi": null,
        "key": "rotation",
        "raw": "title=Rotation invariance in algebraic K-theory, author=Lurie, Jacob, month=September, year=2015, NOTE = Waldhaus.pdf",
        "title": "Rotation invariance in algebraic K-theory",
        "url": "https://www.math.ias.edu/~lurie/papers/Waldhaus.pdf",
        "venue": "Preprint, Institute for Advanced Study",
        "year": 2015
      },
      "exists": null,
      "explanation": "Lurie's preprint on rotation invariance in algebraic K-theory is likely cited in the Real algebraic K-theory or THR portions of the paper not captured by the rendered citation contexts.",
      "notes": "As with hopkinslurieambi, the raw LaTeX URL contains a space artifact. This reference does not appear in any visible citation context; its role in the paper cannot be assessed from the rendered text.",
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Jeremy Hahn",
          "Allen Yuan"
        ],
        "doi": "https://doi.org/10.1016/j.aim.2019.03.022",
        "key": "HahnYuan",
        "raw": "title = Multiplicative structure in the stable splitting of ΩSL_n(C), journal = Advances in Mathematics, volume = 348, pages = 412-455, year = 2019, doi = https://doi.org/10.1016/j.aim.2019.03.022, author = Jeremy Hahn and Allen Yuan",
        "title": "Multiplicative structure in the stable splitting of ΩSL_n(C)",
        "url": "https://www.sciencedirect.com/science/article/pii/S0001870819301525",
        "venue": "Advances in Mathematics",
        "year": 2019
      },
      "exists": null,
      "explanation": "Hahn–Yuan's theorem on multiplicative structures in the stable splitting is the direct inspiration for the lifting result central to Section 2; the paper explicitly states it formulates an equivariant version of Hahn–Yuan Theorem 7.1 and cites it several times in the body.",
      "notes": "The doi field contains the full resolver URL 'https://doi.org/10.1016/j.aim.2019.03.022' rather than just the DOI identifier '10.1016/j.aim.2019.03.022'.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "M. A. Hill",
          "M. J. Hopkins"
        ],
        "doi": "10.1090/conm/620/12372",
        "key": "hillHopkins2014equivariantmultiplicativeclosure",
        "raw": "AUTHOR = Hill, M. A. and Hopkins, M. J., TITLE = Equivariant multiplicative closure, BOOKTITLE = Algebraic topology: applications and new directions, SERIES = Contemp. Math., VOLUME = 620, PAGES = 183--199, PUBLISHER = Amer. Math. Soc., YEAR = 2014, DOI = 10.1090/conm/620/12372",
        "title": "Equivariant multiplicative closure",
        "url": "https://doi.org/10.1090/conm/620/12372",
        "venue": "Algebraic topology: applications and new directions, Contemporary Mathematics, vol. 620",
        "year": 2014
      },
      "exists": null,
      "explanation": "Hill–Hopkins's work on equivariant multiplicative closure provides foundational results on normed algebras and equivariant ring spectra that underpin the categorical framework used in the paper.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Sarah Petersen"
        ],
        "doi": "10.2140/agt.2024.24.4487",
        "key": "peterson2024EMspaces",
        "raw": "AUTHOR = Petersen, Sarah, TITLE = The HF_2-homology of C_2-equivariant Eilenberg-Mac Lane spaces, JOURNAL = Algebr. Geom. Topol., VOLUME = 24, YEAR = 2024, NUMBER = 8, PAGES = 4487--4518, DOI = 10.2140/agt.2024.24.4487",
        "title": "The HF_2-homology of C_2-equivariant Eilenberg-Mac Lane spaces",
        "url": "https://doi.org/10.2140/agt.2024.24.4487",
        "venue": "Algebraic & Geometric Topology",
        "year": 2024
      },
      "exists": null,
      "explanation": "Petersen's computation of HF_2-homology of C_2-equivariant Eilenberg–Mac Lane spaces is tangentially related to equivariant homotopy theory but does not appear in any visible citation context; it is likely cited in a technical computation not rendered here.",
      "notes": null,
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "1809.04723",
        "authors": [
          "Jeremy Hahn",
          "Dylan Wilson"
        ],
        "doi": null,
        "key": "hahn2018quotientsrings",
        "raw": "title=Quotients of even rings, author=Jeremy Hahn and Dylan Wilson, year=2018, eprint=1809.04723, archivePrefix=arXiv, primaryClass=math.AT, url=https://arxiv.org/abs/1809.04723",
        "title": "Quotients of even rings",
        "url": "https://arxiv.org/abs/1809.04723",
        "venue": null,
        "year": 2018
      },
      "exists": null,
      "explanation": "Hahn–Wilson's work on quotients of even rings establishes E_1-algebra structures on MU-quotients; the current paper explicitly states that its proof recovers a C_2-equivariant version of this classical non-equivariant result, making this a direct antecedent.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Samik Basu",
          "Steffen Sagave",
          "Christian Schlichtkrull"
        ],
        "doi": "10.1017/s1474748017000421",
        "key": "Basu_2017",
        "raw": "title=GENERALIZED THOM SPECTRA AND THEIR TOPOLOGICAL HOCHSCHILD HOMOLOGY, volume=19, DOI=10.1017/s1474748017000421, number=1, journal=Journal of the Institute of Mathematics of Jussieu, author=Basu, Samik and Sagave, Steffen and Schlichtkrull, Christian, year=2017, pages=21–64",
        "title": "Generalized Thom Spectra and their Topological Hochschild Homology",
        "url": "http://dx.doi.org/10.1017/S1474748017000421",
        "venue": "Journal of the Institute of Mathematics of Jussieu",
        "year": 2017
      },
      "exists": null,
      "explanation": "Basu–Sagave–Schlichtkrull's theorem writing MU-quotients as E_1-Thom spectra over SU is the direct non-equivariant model for the paper's main result; the authors prove a C_2-equivariant version and discuss the technical difficulties of naive generalization extensively.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2012.00864",
        "authors": [
          "Jeremy Hahn",
          "Dylan Wilson"
        ],
        "doi": null,
        "key": "HWv2",
        "raw": "title=Redshift and multiplication for truncated Brown-Peterson spectra, arXiv version 2, author=Jeremy Hahn and Dylan Wilson, year=2022, eprint=2012.00864v2, archivePrefix=arXiv, primaryClass=math.AT, url=https://arxiv.org/abs/2012.00864v2",
        "title": "Redshift and multiplication for truncated Brown-Peterson spectra (arXiv version 2)",
        "url": "https://arxiv.org/abs/2012.00864v2",
        "venue": null,
        "year": 2022
      },
      "exists": null,
      "explanation": "Hahn–Wilson's designer polynomial MU-algebras construction from this paper is the primary non-equivariant template for the paper's equivariant designer spectra in Section 2; it is also cited for the conjectured E_{1+2σ} enhancement of the current paper's E_σ result.",
      "notes": "This entry explicitly pins to arXiv version 2 (2012.00864v2). The paper also cites a key hahnWilson2022redshift (e.g., for Remark 1.0.14) which likely refers to the same or published version of this paper. Having two separate bibliography keys for the same work—HWv2 and hahnWilson2022redshift—is a citation hygiene concern that may cause confusion or double-counting. The published version (Annals of Mathematics, 2022) should be cited with a stable DOI.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2512.15573",
        "authors": [
          "Ryan Quinn",
          "Qi Zhu"
        ],
        "doi": null,
        "key": "quinnZhu2026multiplicativeequivariantthomspectra",
        "raw": "title=Multiplicative Equivariant Thom Spectra & Structured Real Orientations, author=Ryan Quinn and Qi Zhu, year=2026, eprint=2512.15573, archivePrefix=arXiv, primaryClass=math.AT, url=https://arxiv.org/abs/2512.15573",
        "title": "Multiplicative Equivariant Thom Spectra & Structured Real Orientations",
        "url": "https://arxiv.org/abs/2512.15573",
        "venue": null,
        "year": 2026
      },
      "exists": null,
      "explanation": "The authors' companion paper arXiv:2512.15573 is the primary technical source for this paper, cited throughout for lifting theorems, cohomological slice tower techniques, coinduction constructions, and structured Real orientations that are the backbone of both main theorems.",
      "notes": "This entry is an apparent duplicate of QZ25 [key: QZ25]: both cite arXiv:2512.15573 by the same authors. The difference is only in citation key and year (2026 vs 2025), likely reflecting revised versus original preprint dates. The bibliography should consolidate to a single canonical key for this paper to avoid confusion.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2512.15573",
        "authors": [
          "Ryan Quinn",
          "Qi Zhu"
        ],
        "doi": null,
        "key": "QZ25",
        "raw": "title=Multiplicative Equivariant Thom Spectra & Structured Real Orientations, author=Ryan Quinn and Qi Zhu, year=2025, eprint=2512.15573, archivePrefix=arXiv, primaryClass=math.AT, url=https://arxiv.org/abs/2512.15573",
        "title": "Multiplicative Equivariant Thom Spectra & Structured Real Orientations",
        "url": "https://arxiv.org/abs/2512.15573",
        "venue": null,
        "year": 2025
      },
      "exists": null,
      "explanation": "Same paper as quinnZhu2026multiplicativeequivariantthomspectra (arXiv:2512.15573); the duplicate citation key QZ25 appearing in the bibliography creates a redundancy that should be resolved by choosing a single canonical key.",
      "notes": "Duplicate of quinnZhu2026multiplicativeequivariantthomspectra: both keys cite arXiv:2512.15573 by the same authors, differing only in key name and year label (2025 vs 2026). This dual-key pattern for a single preprint is a citation hygiene issue. All citations should be consolidated under one key.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Agnès Beaudry",
          "Irina Bobkova",
          "Michael Hill",
          "Vesna Stojanoska"
        ],
        "doi": "10.2140/agt.2020.20.3423",
        "key": "Beaudry_2020",
        "raw": "AUTHOR = Beaudry, Agnès and Bobkova, Irina and Hill, Michael and Stojanoska, Vesna, TITLE = Invertible K(2)-local E-modules in C_4-spectra, JOURNAL = Algebr. Geom. Topol., VOLUME = 20, YEAR = 2020, NUMBER = 7, PAGES = 3423--3503, DOI = 10.2140/agt.2020.20.3423",
        "title": "Invertible K(2)-local E-modules in C_4-spectra",
        "url": "https://doi.org/10.2140/agt.2020.20.3423",
        "venue": "Algebraic & Geometric Topology",
        "year": 2020
      },
      "exists": null,
      "explanation": "Beaudry–Bobkova–Hill–Stojanoska's work on invertible K(2)-local E-modules in C_4-spectra is relevant to the paper's treatment of Lubin–Tate theory and its Picard group; likely cited in technical sections on K(h)-localization not captured by the rendered contexts.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Michael Hill",
          "XiaoLin Shi",
          "Guozhen Wang",
          "Zhouli Xu"
        ],
        "doi": null,
        "key": "hill2023slice",
        "raw": "title=The Slice Spectral Sequence of a C_4-Equivariant Height-4 Lubin-Tate Theory, author=Hill, Michael and Shi, XiaoLin and Wang, Guozhen and Xu, Zhouli, volume=288, number=1429, year=2023, publisher=American Mathematical Society",
        "title": "The Slice Spectral Sequence of a C_4-Equivariant Height-4 Lubin-Tate Theory",
        "url": null,
        "venue": "Memoirs of the American Mathematical Society, vol. 288, no. 1429",
        "year": 2023
      },
      "exists": null,
      "explanation": "Hill–Shi–Wang–Xu's computation of the C_4 height-4 Lubin–Tate slice spectral sequence is directly relevant to the RO(G)-graded periodicity applications discussed in Section 3.3 and to the broader context of equivariant chromatic homotopy theory.",
      "notes": "The bibliography entry omits a DOI for this AMS Memoirs volume, which has a standard DOI available.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Zhipeng Duan",
          "Guchuan Li",
          "XiaoLin Danny Shi"
        ],
        "doi": "10.2140/gt.2025.29.903",
        "key": "Duan_2025",
        "raw": "title=Vanishing lines in chromatic homotopy theory, volume=29, DOI=10.2140/gt.2025.29.903, number=2, journal=Algebraic & Geometric Topology, author=Duan, Zhipeng and Li, Guchuan and Shi, XiaoLin Danny, year=2025, pages=903–930",
        "title": "Vanishing lines in chromatic homotopy theory",
        "url": "http://dx.doi.org/10.2140/gt.2025.29.903",
        "venue": "Algebraic & Geometric Topology",
        "year": 2025
      },
      "exists": null,
      "explanation": "Duan–Li–Shi's work on vanishing lines in chromatic homotopy theory is related to the paper's chromatic computations, but may be a different paper from the one cited in the introduction for RO(G)-graded periodicities of E(k,Γ_h).",
      "notes": "The text body cites @duan2025periodicityfinitecomplexityhigher (attributed to Duan–Hill–Li–Liu–Shi–Wang–Xu for RO(G)-graded periodicity results) which has a different title, different coauthors, and a different key from Duan_2025 (Duan–Li–Shi, vanishing lines). These appear to be distinct papers; the periodicity paper is likely among the 483 omitted bibliography entries. This is worth clarifying to avoid conflation.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Drew Heard",
          "Guchuan Li",
          "XiaoLin Danny Shi"
        ],
        "doi": "10.2140/agt.2021.21.2703",
        "key": "Heard2021",
        "raw": "AUTHOR = Heard, Drew and Li, Guchuan and Shi, XiaoLin Danny, TITLE = Picard groups and duality for real Morava E-theories, JOURNAL = Algebr. Geom. Topol., VOLUME = 21, YEAR = 2021, NUMBER = 6, PAGES = 2703--2760, DOI = 10.2140/agt.2021.21.2703",
        "title": "Picard groups and duality for real Morava E-theories",
        "url": "https://doi.org/10.2140/agt.2021.21.2703",
        "venue": "Algebraic & Geometric Topology",
        "year": 2021
      },
      "exists": null,
      "explanation": "Heard–Li–Shi's analysis of Picard groups and duality for real Morava E-theories provides structural results about the E(k,Γ_h) spectra central to the paper's orientation theory; likely cited in the sections on K(h)-localization and Lubin–Tate theory.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2507.07051",
        "authors": [
          "Christian Carrick",
          "Michael A. Hill"
        ],
        "doi": null,
        "key": "carrick2025higherrealktheoriesfinite",
        "raw": "title=On higher real K-theories and finite spectra, author=Christian Carrick and Michael A. Hill, year=2025, eprint=2507.07051, archivePrefix=arXiv, primaryClass=math.KT, NOTE = arXiv:2507.07051",
        "title": "On higher real K-theories and finite spectra",
        "url": null,
        "venue": null,
        "year": 2025
      },
      "exists": null,
      "explanation": "Carrick–Hill's paper is cited as a primary application of the orientation maps produced in Theorem 2; the paper explicitly states that the existence of BP^((G))⟨m⟩ → E(k,Γ_h) along with Beaudry–Hill–Shi–Zeng's results enables a new equivariant model for higher real K-theory, developed in this companion work.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Christian Carrick"
        ],
        "doi": "10.1007/s40062-022-00310-1",
        "key": "carrickSmashingLocalizationsEquivariant2022",
        "raw": "AUTHOR = Carrick, Christian, TITLE = Smashing localizations in equivariant stable homotopy, JOURNAL = J. Homotopy Relat. Struct., VOLUME = 17, YEAR = 2022, NUMBER = 3, PAGES = 355--392, DOI = 10.1007/s40062-022-00310-1",
        "title": "Smashing localizations in equivariant stable homotopy",
        "url": "https://doi.org/10.1007/s40062-022-00310-1",
        "venue": "Journal of Homotopy and Related Structures",
        "year": 2022
      },
      "exists": null,
      "explanation": "Carrick's work on smashing localizations in equivariant stable homotopy is likely used for the K(h)-localization arguments in Section 3; directly relevant to the chromatic localization results for BP^((G))⟨m⟩.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Andrew J. Blumberg",
          "Michael A. Hill"
        ],
        "doi": "10.2140/tunis.2020.2.237",
        "key": "Blumberg_2020",
        "raw": "title=G-symmetric monoidal categories of modules over equivariant commutative ring spectra, volume=2, DOI=10.2140/tunis.2020.2.237, number=2, journal=Tunisian Journal of Mathematics, author=Blumberg, Andrew J. and Hill, Michael A., year=2020, pages=237–286",
        "title": "G-symmetric monoidal categories of modules over equivariant commutative ring spectra",
        "url": "http://dx.doi.org/10.2140/tunis.2020.2.237",
        "venue": "Tunisian Journal of Mathematics",
        "year": 2020
      },
      "exists": null,
      "explanation": "Blumberg–Hill's framework for G-symmetric monoidal categories of modules provides the categorical foundations for the module-theoretic arguments over equivariant ring spectra used throughout the paper.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    }
  ],
  "missing_references": [
    {
      "reason": "The paper invokes 'Atiyah's K-theory with Reality' (KU_R) as a named classical object and identifies it with BP_R⟨1⟩, yet no direct citation to Atiyah's original 1966 Quarterly Journal of Mathematics paper appears among the 32 rendered bibliography entries; it is plausibly absent from the full bibliography given the paper's level of foundational detail.",
      "title": "Atiyah, M. F. — K-theory and reality (1966)"
    },
    {
      "reason": "The paper refers to MU_R as the 'Araki–Landweber Real bordism theory' but no direct citation to Araki's foundational work defining this spectrum is visible among the rendered entries; a reference to the original construction would strengthen the historical context of the paper's central object.",
      "title": "Araki, S. — Orientations in τ-cohomology theories (1978, or the foundational MU_R paper)"
    }
  ],
  "summary": "The paper's citation hygiene is generally strong, with appropriate references to foundational and recent literature in equivariant stable homotopy theory. The most notable issue is the duplicate bibliography entries QZ25 and quinnZhu2026multiplicativeequivariantthomspectra, which both point to the same arXiv preprint (arXiv:2512.15573) under different keys and years; these should be consolidated. A secondary concern is that HWv2 pins to a specific arXiv version of Hahn–Wilson rather than the published paper, and a separate key hahnWilson2022redshift used in the text body likely refers to the same work, suggesting a further duplication. Several entries (MahowaldRezkfp, HEWETT1995518, HahnYuan) carry malformed DOI fields containing full resolver URLs rather than bare DOI identifiers. The only substantive missing citations are likely among the 483 bibliography entries omitted from this bounded prompt, so the assessment is limited to the 32 rendered entries; overall, citation practice is appropriate for the field and the primary sources are well-chosen."
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.7,
  "questions": [
    "Can the authors supply an executable SageMath or Macaulay2 script confirming (a) B_m(A_m(T)) = T + T^{2^{2m}} over F_4 for m ∈ {2,3,4,5,6}, (b) the 3^{2^{n-2}} F_4-point count for small n by exhaustive enumeration, and (c) the recursion v_k ≡ V_k mod I_k for small (n,k) pairs as described in Theorem 4?",
    "Does Roytman 2023 Theorem 6.1 apply verbatim in this paper's conventions, and can the authors add a one-paragraph sketch showing how finitely-generated π^{C_2}_{iρ}(E) suffices to trivialize the obstruction classes that distinguish E_ρ from E_2-with-additional-structure in the equivariant little-disks context?",
    "Will arXiv:2512.15573 (Quinn–Zhu, companion paper) be publicly accessible at a pinned version before this paper is finalized, and can the bibliography be updated to cite exact theorem numbers (Construction 2.2.5, Appendix A.2, Cor. 3.3.9, Cor. 6.1.6, Cor. 6.2.2, Thm. 6.3.3) with a version-locked arXiv link?",
    "Corollary 3 (Real BSS Thom-spectrum description) relies on methods from arXiv:2512.15573 rather than a direct equivariantization of Basu–Sagave–Schlichtkrull; which specific theorem of that companion paper provides the E_σ-algebra-level Thom isomorphism, and can the authors add a dedicated paragraph making this explicit?",
    "Can the duplicate bibliography entries for arXiv:2512.15573 (QZ25 vs. quinnZhu2026multiplicativeequivariantthomspectra) and for the Hahn–Wilson redshift paper (HWv2 vs. hahnWilson2022redshift) be consolidated to single canonical keys, and the malformed DOI fields in HEWETT1995518, HahnYuan, and MahowaldRezkfp corrected to bare DOI identifiers?"
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "The positive direction is established in Proposition 4 (cases n=1 and (m,n)=(1,2)) via direct algebraic identification of v_1, v_2 with t_1^{C_4}+\\gamma t_1^{C_4} etc.; the (n=1) case follows from D=\\bar{v}_h via BHSZ Prop. 6.3. The negative direction (Theorem 5) reduces to Proposition 5 by counting F_4-points after modding out by (2,v_1,\\ldots,v_{h-1}). The reduction from a non-isomorphism of associated affine schemes to a non-equivalence of BP-modules is correct but does require the strong-evenness/Borel-completion machinery to identify the underlying ring with F_2[a_{r,i}][V_h^{-1}]/(V_1,\\ldots,V_{h-1}). The F_4-point counts in Proposition 5 are constructive but presented as algebra exercises; the verification B_m(A_m(T))=T+T^{2^{2m}} is stated without explicit expansion.",
      "id": "weakness-1",
      "locator": "Theorem 3 (mainthm: characterization), Section 3.3",
      "required_update": "Ship a small computer-algebra script (SageMath / Macaulay2) at experiments/F4_points/verify.sage that (a) verifies B_m(A_m(T))=T+T^{2^{2m}} symbolically over F_4 for m up to e.g. 5, (b) enumerates F_4-points for small (n,m) pairs to confirm the 3^{2^{n-2}} and \"at least four\" counts, and (c) confirms the recursive formula V_k≡v_k mod I_k for small n. Without this, the explicit polynomial construction in Proposition 5(ii) is the most fragile load-bearing step and is a natural candidate for the proof-as-code axiom in this code-amenable field.",
      "source_path": "corrections/2606.25898/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Theorem 3 (mainthm: characterization), Section 3.3` is corrected or justified.",
      "weakness_index": 0
    },
    {
      "evidence": "The proof reduces lifting to a question on group-completed C_2-mapping spaces and applies a Roytman 2023 (Theorem 6.1) obstruction calculation. The chain {E_\\rho-algebra maps} ≃ {E_\\rho^{gp}-maps into GL_1 E} relies on standard recognition, but the descent step to E_2 vs E_\\rho is delicate: in equivariant little-disks theory, the E_2 to E_\\rho lifting is not generically automatic and the finiteness hypothesis on \\pi^{C_2}_{i\\rho}(E) only appears at the end. From the bounded text, the precise way this hypothesis trivializes the obstruction is not transparent, and the cited Roytman 2023 Thm 6.1 is load-bearing without a self-contained restatement. Because Proposition 2 is then used to obtain the structured Real Snaith equivalence and the E_\\sigma structure on Real bordism quotients, any subtle hypothesis failure would propagate.",
      "id": "weakness-2",
      "locator": "Proposition 2 (prop:lift), Section 2.1",
      "required_update": "Restate Roytman 2023 Theorem 6.1 in the conventions of this paper, or include a one-paragraph sketch of why finitely-generated \\pi^{C_2}_{i\\rho}(E) suffices to kill the obstruction classes that distinguish E_\\rho from E_2-with-extra-structure. Where appropriate, add concrete small-case checks (e.g. n=0,1) in an appendix or supplementary computation.",
      "source_path": "corrections/2606.25898/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Proposition 2 (prop:lift), Section 2.1` is corrected or justified.",
      "weakness_index": 1
    },
    {
      "evidence": "The proof combines (a) the designer polynomial algebra construction (Proposition 1) via parametrized operadic left Kan extension along the Real J-homomorphism, (b) the lifting Proposition 2, and (c) a Thom-spectrum / total-cofiber identification. The construction is internally consistent and uses standard parametrized-higher-algebra machinery. However, multiple load-bearing inputs (operadic left Kan extension along E_\\infty^{C_2}-maps; coinduction interaction with twisted norm quotients; the BU_R structure on Pic_{C_2}) are cited to quinnZhu2026multiplicativeequivariantthomspectra (Construction 2.2.5, Appendix A.2, Cor. 3.3.9, Cor. 6.1.6, Cor. 6.2.2, Thm. 6.3.3), the authors' own companion paper. From the bounded text I cannot independently verify those imported lemmas, so the result is contingent on their correctness.",
      "id": "weakness-3",
      "locator": "Theorem 1 / Theorems thm:MUR_quotients (Sec. 2) and thm:MUG_quotients (Sec. 2)",
      "required_update": "Either (i) include a self-contained appendix sketching the cited inputs from quinnZhu2026multiplicativeequivariantthomspectra (operadic left Kan extension along the Real J-homomorphism, parametrized lifting), or (ii) explicitly mark the dependency on that work and confirm it is publicly accessible (arXiv link, version pinned) before the present paper goes to print.",
      "source_path": "corrections/2606.25898/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Theorem 1 / Theorems thm:MUR_quotients (Sec. 2) and thm:MUG_quotients (Sec. 2)` is corrected or justified.",
      "weakness_index": 2
    },
    {
      "evidence": "The proof gives explicit F_4-point constructions: in (i) by setting (\\alpha_{0,1},\\ldots,\\alpha_{2^{n-1}-1,1})=(c_0,c_0,c_1,c_1,\\ldots), and in (ii) by exhibiting polynomials A_m,B_m\\in F_4[T] satisfying B_m(A_m(T))=T+T^{2^{2m}} with the displayed coefficients. The verification of B_m(A_m(T))=T+T^{2^{2m}} is delegated to the reader as \"an algebra exercise\". This is exactly the situation contemplated by the proof-as-code axiom: the claim is purely algebraic, finite-field, and trivially verifiable by computer algebra, yet the paper does not ship the verification artifact. While I find the construction plausible, the absence of an executable verification artifact is a substantive weakness for a load-bearing computation that underwrites half of the headline Theorem 3.",
      "id": "weakness-4",
      "locator": "Proposition 5 (prop: F4 points computation), Section 3.3",
      "required_update": "Ship an executable verification script (e.g. experiments/F4_points/verify_prop5.sage) that (a) symbolically confirms B_m(A_m(T))=T+T^{2^{2m}} for m∈{2,3,4,5,6} via SageMath polynomial arithmetic over F_4, (b) enumerates F_4-points exhaustively for small (n,m) and matches against 3^{2^{n-2}} and ≥4, and (c) verifies the recursion identity using S_m and R(T) symbolically. Reference this artifact in the proof of Proposition 5.",
      "source_path": "corrections/2606.25898/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Proposition 5 (prop: F4 points computation), Section 3.3` is corrected or justified.",
      "weakness_index": 3
    },
    {
      "evidence": "The url field is malformed: it is missing the 'https://' scheme prefix. An arxiv field value of '1999.0043' appears to echo the DOI suffix rather than denoting an actual arXiv identifier; this 1999 paper predates arXiv math.AT systematic coverage. Not visible in any rendered citation context.",
      "id": "weakness-5",
      "locator": "MahowaldRezkfp",
      "required_update": "Verify `MahowaldRezkfp` against an authoritative source; replace it with a resolvable relevant citation or remove it.",
      "source_path": null,
      "source_role": "citation",
      "status": "open",
      "target_kind": "bibliography",
      "verification_check": "Re-review should confirm the citation resolves and is relevant.",
      "weakness_index": 4
    }
  ],
  "strengths": [
    "Theorem 1 is the first construction of E_σ-algebra structures on quotients of the non-periodic Real bordism spectrum MU_R, answering an open question of Angelini-Knoll–Kong–Quigley and an AimPL problem of Hahn–Wilson, with the harder non-periodic case requiring fundamentally different methods than the existing Hahn–Shi result for MUP_R.",
    "Theorem 3 delivers a sharp, complete characterization of when K(h)-localization of BP^(G)⟨m⟩ is equivalent to Lubin-Tate theory—holding if and only if n=1 or (m,n)=(1,2)—via a concrete F_4-point comparison that provides a clear and checkable criterion.",
    "Theorem 2 provides the first explicit factorizations BP^(G)⟨m⟩ → E(k,Γ_h) for higher truncated Brown–Peterson spectra, unlocking downstream applications including the Meier–Shi–Zeng transchromatic isomorphism theorem and a new equivariant model for higher real K-theories.",
    "The paper's scope and range are exceptional: a single framework (equivariant designer polynomial algebras via parametrized operadic Kan extension) simultaneously recovers equivariant analogues of Angeltveit, Basu–Sagave–Schlichtkrull, Hahn–Wilson, and Strickland, and produces new corollaries in chromatic homotopy and algebraic K-theory."
  ],
  "summary": "The five specialist reviews converge on a paper with significant mathematical novelty (novelty_score 0.72, verdict 'significant') and generally coherent arguments (technical_correctness overall_correctness 'mostly_sound'), but with reproducibility and verification gaps that require author action before acceptance. The paper works in math.AT (code-amenable field) and the reproducibility specialist flagged three critical concerns — no formal proof artifacts for Theorems 1, 2, and 3 — plus two major concerns for Corollary 2 and absence of any public code repository. The technical correctness specialist (confidence 0.62) rated Proposition 5 'unsupported' and Propositions 2 and 4 / Theorem 3 as 'partially_supported' at major severity, because the finite-field computations underlying the negative half of Theorem 3 are delegated to the reader with no verification artifact. Multiple headline results chain through the companion arXiv:2512.15573 (Quinn–Zhu) without self-contained restatements of the imported lemmas, making independent verification conditional on a separate preprint. Citation hygiene is adequate but marred by duplicate bibliography entries for arXiv:2512.15573 (keys QZ25 and quinnZhu2026multiplicativeequivariantthomspectra) and likely for Hahn–Wilson (HWv2 / hahnWilson2022redshift), and by malformed DOI fields in several entries. Applying the recommendation gate: the field is math.* (code-amenable), reproducibility flagged critical missing proof-as-code for all three main theorems, and technical correctness flagged Proposition 5 as unsupported (severity major), which underpins the negative half of the headline Theorem 3. Because the missing computational artifacts for a finite-field algebraic claim (Proposition 5) and the unverified inductive step (Theorem 4) are precisely the kind of verifiable-by-computer evidence whose absence blocks independent trust of a headline result, the gate defaults to major_revision. Rejection is not warranted because the technical reviewer finds the overall structure 'mostly_sound,' the novelty is substantial, and the identified gaps are addressable by supplying computational scripts and expanding two proof sketches.",
  "weaknesses": [
    "Proposition 5's finite-field computation—the load-bearing step for the negative half of Theorem 3—is delegated as an 'algebra exercise' with no verification script, leaving the claim rated 'unsupported' by the technical reviewer; this is the most critical gap given the paper's code-amenable classification.",
    "Proposition 2 (the E_2-to-E_ρ lifting theorem) imports Roytman 2023 Theorem 6.1 as a black box without restating its hypotheses in the paper's conventions or sketching how finite-generatedness of π^{C_2}_{iρ}(E) kills the relevant obstruction classes; as the primary mechanism enabling Theorem 1, any subtlety here propagates globally.",
    "Multiple headline results depend on unrestated results from the companion preprint arXiv:2512.15573 (Quinn–Zhu), including the operadic left Kan extension along the Real J-homomorphism and the structured retraction theorem for BHSZ orientations; independent verification is conditional on a separate, as-yet-preprint work.",
    "Theorem 4 (v_k ≡ V_k mod I_k), whose correctness underpins Proposition 5 and thus Theorem 3, involves a substantial nested induction on index manipulations (γ_n^{2^s} = γ_{n−s}) presented only at headline level with no executable verification for small cases.",
    "The bibliography contains duplicate entries for the same arXiv:2512.15573 paper under keys QZ25 and quinnZhu2026multiplicativeequivariantthomspectra (differing only in key name and year label), a likely duplication between HWv2 and hahnWilson2022redshift for the Hahn–Wilson redshift paper, and multiple entries (HEWETT1995518, HahnYuan, MahowaldRezkfp) with malformed DOI fields containing full resolver URLs rather than bare DOI identifiers."
  ]
}
```

### novelty (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.78,
  "missing_prior_art": [
    {
      "reason": "The paper relies heavily on equivariant Thom spectrum machinery and GL_1 of ring spectra (e.g., the Real J-homomorphism into Pic_{C_2}(Sp^{C_2})), but references primarily the Quinn–Zhu companion and Horev for this. The foundational non-equivariant literature on E_∞-orientations and units of structured ring spectra (Ando–Blumberg–Gepner line of work) is not explicitly cited even though it forms the conceptual precedent; citing it would better situate the equivariant generalizations.",
      "title": "Equivariant E_∞-Thom spectra and units of ring spectra (Ando–Blumberg–Gepner–Hopkins–Rezk style)"
    }
  ],
  "novelty_score": 0.72,
  "related_work": [
    {
      "citation_key": "hahnRealOrientationsLubin2020",
      "delta": "Hahn–Shi constructed E_σ-algebra structures on quotients of the periodic Real bordism spectrum MUP_R by using the periodicity generator to concentrate all elements in the same degree, accessed via the geometry of HP^∞. This paper treats the non-periodic MU_R case, which is fundamentally harder because that normalization trick is unavailable; it also extends to higher group norms and twisted monoid quotients via a completely different Thom-spectrum lifting strategy.",
      "relation": "builds_on",
      "title": "Real Orientations of Lubin–Tate Spectra"
    },
    {
      "citation_key": "Basu_2017",
      "delta": "Basu–Sagave–Schlichtkrull showed non-equivariantly that quotients of MU can be realized as E_1-Thom spectra over SU. This paper proves a C_2-equivariant analogue identifying MU_R quotients as C_2-Thom spectra over BΩ^σ SU_R via an E_σ-algebra map, but requires entirely different methods since naive equivariantization of the BSS argument fails due to the non-trivial twist forced by the equivariant setting.",
      "relation": "builds_on",
      "title": "Generalized Thom Spectra and Their Topological Hochschild Homology"
    },
    {
      "citation_key": "beaudryHillShiZeng2021modelsLubinTate",
      "delta": "Beaudry–Hill–Shi–Zeng constructed explicit G-equivariant homotopy ring maps BP^((G)) → E(k,Γ_h) and proved underlying non-equivariant equivalences. This paper provides the first rigorous construction of factorizations BP^((G))⟨m⟩ → E(k,Γ_h), refines the BHSZ orientation to a Coind^G_{C_2}E_ρ-ring map, and completely characterizes when the natural map without D-inversion is an equivalence (only for n=1 or (m,n)=(1,2)).",
      "relation": "builds_on",
      "title": "Models of Lubin–Tate Spectra via Real Bordism Theory"
    },
    {
      "citation_key": "quinnZhu2026multiplicativeequivariantthomspectra",
      "delta": "The authors' companion paper developed the parametrized-categorical framework for multiplicative equivariant Thom spectra, the Real J-homomorphism as an E^{C_2}_∞-map, and cohomological slice tower lifting techniques. The current paper applies these as core technical inputs, including the unique lifting proposition (Proposition 2) and the general factorization result for structured orientations.",
      "relation": "builds_on",
      "title": "Multiplicative Equivariant Thom Spectra and Structured Real Orientations"
    },
    {
      "citation_key": "hahnWilson2022redshift",
      "delta": "Hahn–Wilson introduced designer polynomial MU-algebras, established E_∞ structures on truncated BP spectra, and noted (Remark 1.0.14) that an E_{1+2σ}-algebra structure on BP_R⟨n⟩ is expected but unproven. This paper constructs the Real analogue of their designer algebras over MU_R and delivers the E_σ-algebra structures on BP_R⟨n⟩, which is the optimal generic result (as E_1 and E_{2σ} are provably unachievable in general).",
      "relation": "prior_art",
      "title": "Redshift and Multiplication for Truncated Brown–Peterson Spectra"
    },
    {
      "citation_key": "HHR16",
      "delta": "Hill–Hopkins–Ravenel introduced MU_R, BP_R, truncated BP_R spectra, higher real K-theories, and the norm construction N_{C_2}^G that underlies all examples in this paper. The Kervaire invariant one resolution also provided the key insight that higher real K-theories arise from BP^((G))⟨m⟩, motivating the orientations studied in Section 3.",
      "relation": "prior_art",
      "title": "On the Nonexistence of Elements of Kervaire Invariant One"
    },
    {
      "citation_key": "meier2024transchromaticphenomenaequivariantslice",
      "delta": "Meier–Shi–Zeng's transchromatic isomorphism theorem takes as input the existence of orientations BP^((G))⟨m⟩ → E(k,Γ_h), which this paper constructs for the first time. The two works address orthogonal aspects: this paper builds the maps; Meier–Shi–Zeng use them to derive periodicities in Lubin–Tate theory via the equivariant slice spectral sequence.",
      "relation": "orthogonal",
      "title": "Transchromatic Phenomena in the Equivariant Slice Spectral Sequence"
    },
    {
      "citation_key": "gabe2025realsyntomiccohomology",
      "delta": "Angelini-Knoll–Kong–Quigley computed Real syntomic cohomology of BP_R⟨n⟩ for −1≤n≤2 and explicitly identified the absence of E_σ-algebra structures on BP_R⟨n⟩ for n>2 as the sole obstruction to extending their results to all n. This paper resolves that obstruction, directly enabling the extension of their program.",
      "relation": "orthogonal",
      "title": "Real Syntomic Cohomology"
    },
    {
      "citation_key": "bakerWuergler1989liftings",
      "delta": "Baker–Würgler proved the non-equivariant equivalence L_{K(h)}BP⟨h⟩ ≃ Ê(h) to completed Johnson–Wilson theory. Experts expected an equivariant analogue, but Theorem 3 of this paper shows the equivariant version holds only for n=1 and (m,n)=(1,2), with the distinction detected by counting F_4-points on associated affine schemes — a sharp and surprising negative result.",
      "relation": "prior_art",
      "title": "Brave New Rings and Algebraic K-Theory"
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
      "description": "The paper does not state a public code repository, license, pinned release, or executable artifact for reproducing its constructions or computations.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "Theorem 1, asserting E_sigma algebra structures on quotients of MU_R and higher group analogues, lacks a machine-checkable proof artifact such as formal/StructuredQuotients/MURQuotients.lean.",
      "severity": "critical"
    },
    {
      "area": "other",
      "description": "Theorem 2, asserting the BHSZ orientation refinement and factorization through higher truncated Brown-Peterson spectra, lacks a formal proof artifact such as formal/StructuredQuotients/BHSZFactorization.lean.",
      "severity": "critical"
    },
    {
      "area": "evaluation",
      "description": "Theorem 3 relies on comparing K(h)-local homotopy computations and counting F4-points, but no reproducible computation script or checked transcript is provided; computations/theorem3_f4_point_count.sage would close this gap.",
      "severity": "critical"
    },
    {
      "area": "other",
      "description": "Corollary 2, the equivalence after inverting D, lacks a machine-checkable proof artifact such as formal/StructuredQuotients/EquivariantEquivalence.lean.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://arxiv.org/abs/2606.23309arXiv:2606.23309` (status=404)",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://arxiv.org/abs/2605.11390arXiv:2605.11390` (status=404)",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://arxiv.org/abs/2410.10726arXiv:2410.10726` (status=404)",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://arxiv.org/abs/2203.14787arXiv:2203.14787` (status=404)",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://arxiv.org/abs/1809.04723arXiv:1809.04723` (status=404)",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://arxiv.org/abs/2012.00864v2arXiv:2012.00864v2` (status=404)",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://arxiv.org/abs/2512.15573arXiv:2512.15573` (status=404)",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://arxiv.org/abs/2507.07051arXiv:2507.07051` (status=404)",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://arxiv.org/abs/2203.13743arXiv:2203.13743` (status=404)",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://arxiv.org/abs/2310.17459arXiv:2310.17459` (status=404)",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://arxiv.org/abs/1707.00956arXiv:1707.00956` (status=404)",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://arxiv.org/abs/1910.07226arXiv:1910.07226` (status=404)",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://arxiv.org/abs/2308.12945arXiv:2308.12945` (status=404)",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://arxiv.org/abs/2510.19501arXiv:2510.19501` (status=404)",
      "severity": "minor"
    }
  ],
  "confidence": 0.86,
  "data_availability": "unspecified",
  "data_url": null,
  "environment": null,
  "reproducibility_score": 0.24
}
```

### summary (`claude-haiku-4-5`) — status: `pass`

```json
{
  "audience": "Researchers in equivariant algebraic topology and chromatic homotopy theory, particularly those working on structured multiplicative invariants, Real bordism, truncated Brown–Peterson spectra, Lubin–Tate theory, and applications to computing periodicities and higher real K-theory.",
  "key_contributions": [
    "Theorem 1: Quotients of Real bordism MU_R admit E_σ-algebra structures, and similarly for higher group generalizations MU^(G) under norm constructions.",
    "Corollary 1: The truncated Real Brown–Peterson spectra BP_R⟨n⟩ admit E_σ-algebra structures for all n≥1, answering an open question about the structure needed for computing Real syntomic cohomology.",
    "Theorem 2: The Beaudry–Hill–Shi–Zeng orientations from BP^(G) to Lubin–Tate theory refine to ring maps and factor through higher truncated Brown–Peterson spectra BP^(G)⟨m⟩.",
    "Theorem 3: Complete characterization of when the localization of BP^(G)⟨m⟩ is equivalent to Lubin–Tate theory—this holds if and only if n=1 or (m,n)=(1,2), showing the equivalence fails in general cases."
  ],
  "plain_language_summary": "This paper develops a theory of quotients in equivariant algebraic topology, focusing on the Real bordism spectrum and its quotients. The authors construct multiplicative structures called E_σ-algebra structures on quotients of Real bordism MU_R, which generalizes a classical problem from non-equivariant homotopy theory to the equivariant setting where a group action is present. A key application is showing that truncated Real Brown–Peterson spectra, which are important examples in chromatic homotopy theory, admit these structured multiplicative operations—answering a question posed by Angelini-Knoll–Kong–Quigley about what structure enables computing Real topological Hochschild homology. The paper also refines orientations from truncated Brown–Peterson spectra to Lubin–Tate theories and characterizes precisely when these orientations remain equivalences after chromatic localization, providing explicit examples relevant to computing periodicities in Lubin–Tate theory.",
  "tldr": "The paper equips quotients of Real bordism with ring structures and uses these to characterize when truncated Brown–Peterson spectra match Lubin–Tate theories after chromatic localization."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `pass`

```json
{
  "claims": [
    {
      "assessment": "partially_supported",
      "claim": "Quotients MU_R/(\\bar{x}_i: i\\in I) admit an E_\\sigma-MU_R-algebra structure, and twisted monoid quotients MU^{((G))}/(G\\cdot \\bar{x}_i: i\\in I) admit a Coind^G_{C_2} E_\\sigma-MU^{((G))}-algebra structure (Main Theorem 1).",
      "evidence": "The proof combines (a) the designer polynomial algebra construction (Proposition 1) via parametrized operadic left Kan extension along the Real J-homomorphism, (b) the lifting Proposition 2, and (c) a Thom-spectrum / total-cofiber identification. The construction is internally consistent and uses standard parametrized-higher-algebra machinery. However, multiple load-bearing inputs (operadic left Kan extension along E_\\infty^{C_2}-maps; coinduction interaction with twisted norm quotients; the BU_R structure on Pic_{C_2}) are cited to quinnZhu2026multiplicativeequivariantthomspectra (Construction 2.2.5, Appendix A.2, Cor. 3.3.9, Cor. 6.1.6, Cor. 6.2.2, Thm. 6.3.3), the authors' own companion paper. From the bounded text I cannot independently verify those imported lemmas, so the result is contingent on their correctness.",
      "id": "C1",
      "location": "Theorem 1 / Theorems thm:MUR_quotients (Sec. 2) and thm:MUG_quotients (Sec. 2)",
      "severity": "minor",
      "suggested_fix": "Either (i) include a self-contained appendix sketching the cited inputs from quinnZhu2026multiplicativeequivariantthomspectra (operadic left Kan extension along the Real J-homomorphism, parametrized lifting), or (ii) explicitly mark the dependency on that work and confirm it is publicly accessible (arXiv link, version pinned) before the present paper goes to print."
    },
    {
      "assessment": "supported",
      "claim": "The truncated Real Brown–Peterson spectra BP_R<n> admit E_\\sigma-MU_R-algebra structures, and higher truncated variants BP^{((G))}<m> admit Coind^G_{C_2} E_\\sigma-MU^{((G))}-algebra structures (Corollary 1 of the introduction).",
      "evidence": "The corollary is an immediate specialization of Theorem 1 to the generators \\bar{v}_i and is consistent with the conditional statements that motivated it (Angelini-Knoll–Kong–Quigley's question; Hahn–Wilson Problem 5.5). Provided Theorem 1 holds, the deduction is mechanical and the citation chain to BHSZ for the existence of \\bar{v}_i as elements of the relevant homotopy is standard.",
      "id": "C2",
      "location": "Corollary 1 (main:BPRnkRn) of Section 1; Corollary 3 / Corollary 5 in Section 2",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Proposition 1 (designer MU_R polynomial): The free E_1-MU_R-algebra on a class in degree i\\rho admits an E_\\infty^{C_2}-MU_R-algebra structure, with underlying spectrum \\bigoplus_{k\\geq 0} \\Sigma^{ki\\rho} MU_R.",
      "evidence": "The construction follows the Hahn–Wilson designer-MU template adapted to Real bordism, using a lax C_2-symmetric monoidal Kan-extension along Z × BU_R → Z. The verification that this refines the free E_1-MU_R-algebra invokes strong-evenness checking on underlying via hillmeier2017 Lemma 3.4. The argument is plausible and well-structured. The main residual gap is that the proof asserts \"any map between strongly even C_2-spectra which is an equivalence on underlying is itself an equivalence\" via Lemma 3.4 of [hillmeier2017]; the user must trust that the citation matches exactly this statement. The two-step lax-monoidal left Kan extension (Z × BU_R → Z, then restriction along Z_{≥0} → Z) is also presented schematically.",
      "id": "C3",
      "location": "Proposition 1 (construction:designer_MUR_poly), Section 2.1",
      "severity": "minor",
      "suggested_fix": "Spell out at least one paragraph clarifying (a) why the chosen lax C_2-symmetric monoidal structure is unique up to homotopy on the target Sp^{C_2} (i.e. that the post-composition with Pic_{C_2}(Sp^{C_2}) → Sp^{C_2} preserves the needed symmetric-monoidal property), and (b) verify the strong-evenness on intermediate stages of the Kan extension. A short companion calculation script identifying the underlying graded summands would also be reassuring."
    },
    {
      "assessment": "partially_supported",
      "claim": "Proposition 2 (lifting): For E a strongly even E_\\infty^{C_2}-spectrum with finitely generated \\pi^{C_2}_{i\\rho}(E), every E_2-map \\Sigma^\\infty_+ BU → E^e lifts uniquely to an E_\\rho-map \\Sigma^\\infty_+ BU_R → E.",
      "evidence": "The proof reduces lifting to a question on group-completed C_2-mapping spaces and applies a Roytman 2023 (Theorem 6.1) obstruction calculation. The chain {E_\\rho-algebra maps} ≃ {E_\\rho^{gp}-maps into GL_1 E} relies on standard recognition, but the descent step to E_2 vs E_\\rho is delicate: in equivariant little-disks theory, the E_2 to E_\\rho lifting is not generically automatic and the finiteness hypothesis on \\pi^{C_2}_{i\\rho}(E) only appears at the end. From the bounded text, the precise way this hypothesis trivializes the obstruction is not transparent, and the cited Roytman 2023 Thm 6.1 is load-bearing without a self-contained restatement. Because Proposition 2 is then used to obtain the structured Real Snaith equivalence and the E_\\sigma structure on Real bordism quotients, any subtle hypothesis failure would propagate.",
      "id": "C4",
      "location": "Proposition 2 (prop:lift), Section 2.1",
      "severity": "major",
      "suggested_fix": "Restate Roytman 2023 Theorem 6.1 in the conventions of this paper, or include a one-paragraph sketch of why finitely-generated \\pi^{C_2}_{i\\rho}(E) suffices to kill the obstruction classes that distinguish E_\\rho from E_2-with-extra-structure. Where appropriate, add concrete small-case checks (e.g. n=0,1) in an appendix or supplementary computation."
    },
    {
      "assessment": "partially_supported",
      "claim": "Theorem 2 (BHSZ refinement): The Beaudry–Hill–Shi–Zeng orientation BP^{((G))} → E(k,\\Gamma_h) refines to a Coind^G_{C_2} E_\\rho-ring map, and there are G-equivariant factorizations through BP^{((G))}<m> and D^{-1} BP^{((G))}<m>.",
      "evidence": "The refinement appeals to quinnZhu2026 Cor. 6.1.6 (structured retraction of MU_R orientations) and Cor./Thm. 6.3.3 of the same paper; the existence of the factorization through BP^{((G))}<m> uses a general factorization result (Proposition 3) applied to quotients of the polynomial designer algebra. The argument outline is standard once those inputs are granted, and the equivariant factorization through D^{-1}BP^{((G))}<m> is consistent with BHSZ Section 6. The principal exposure is the same as in Theorem 1: the proof chains through quinnZhu2026 results not reproduced here.",
      "id": "C5",
      "location": "Theorem 2 (mainthm: BHSZ); Theorem thm:BHSZ_refinement, Section 3",
      "severity": "minor",
      "suggested_fix": "Either include a brief restatement of the structured-retraction theorem from quinnZhu2026 (or a precise sufficient-condition lemma) and verify in the present paper that the orientation BP^{((G))} → E(k,\\Gamma_h) meets that sufficient condition. Confirm the arXiv version of quinnZhu2026multiplicativeequivariantthomspectra is publicly available and cite the exact theorem numbers in the published version."
    },
    {
      "assessment": "partially_supported",
      "claim": "Corollary 2 / Corollary 7 (equivariant equivalence): For G=C_{2^n} and h=2^{n-1}m with k^\\times containing all (2^m-1)-roots of unity, map_G(\\Sigma^\\infty_+ EG, L_{Infl_e^G K(h)} D^{-1} BP^{((G))}<m>) ≃ E(k,\\Gamma_h)^{hC(k,m)} as BP^{((G))}-modules.",
      "evidence": "The derivation invokes Carrick (carrickSmashingLocalizationsEquivariant2022 Proposition X) on smashing of equivariant localizations together with the BHSZ identifications of the K(h)-local quotients. Once D is inverted, the computation reduces to the non-equivariant BHSZ identification of \\pi^e_*(E(k,\\Gamma_h)^{hC(k,m)}) modulo I_h with F_2[t^\\pm], and the standard chromatic-recognition argument gives the equivalence on the Borel side. The chain of inferences is plausible. I cannot from the text fully verify the smashing step and the choice of cited proposition number from Carrick.",
      "id": "C6",
      "location": "Corollary 2 (maincor: equivariant equivalence) of Section 1; Corollary 7 in Section 3",
      "severity": "minor",
      "suggested_fix": "Add a one-sentence display showing how the smashing localization step is used at each level G=C_{2^n} and explicitly pin the cited proposition number to the latest arXiv version of carrickSmashingLocalizationsEquivariant2022."
    },
    {
      "assessment": "partially_supported",
      "claim": "Theorem 3 (characterization): With G=C_{2^n}, h=2^{n-1}m, k^\\times containing all (2^m-1)-roots of unity, map_G(\\Sigma^\\infty_+ EG, L_{Infl_e^G K(h)} BP^{((G))}<m>) → E(k,\\Gamma_h)^{hC(k,m)} is an equivalence if and only if n=1 or (m,n)=(1,2).",
      "evidence": "The positive direction is established in Proposition 4 (cases n=1 and (m,n)=(1,2)) via direct algebraic identification of v_1, v_2 with t_1^{C_4}+\\gamma t_1^{C_4} etc.; the (n=1) case follows from D=\\bar{v}_h via BHSZ Prop. 6.3. The negative direction (Theorem 5) reduces to Proposition 5 by counting F_4-points after modding out by (2,v_1,\\ldots,v_{h-1}). The reduction from a non-isomorphism of associated affine schemes to a non-equivalence of BP-modules is correct but does require the strong-evenness/Borel-completion machinery to identify the underlying ring with F_2[a_{r,i}][V_h^{-1}]/(V_1,\\ldots,V_{h-1}). The F_4-point counts in Proposition 5 are constructive but presented as algebra exercises; the verification B_m(A_m(T))=T+T^{2^{2m}} is stated without explicit expansion.",
      "id": "C7",
      "location": "Theorem 3 (mainthm: characterization), Section 3.3",
      "severity": "major",
      "suggested_fix": "Ship a small computer-algebra script (SageMath / Macaulay2) at experiments/F4_points/verify.sage that (a) verifies B_m(A_m(T))=T+T^{2^{2m}} symbolically over F_4 for m up to e.g. 5, (b) enumerates F_4-points for small (n,m) pairs to confirm the 3^{2^{n-2}} and \"at least four\" counts, and (c) confirms the recursive formula V_k≡v_k mod I_k for small n. Without this, the explicit polynomial construction in Proposition 5(ii) is the most fragile load-bearing step and is a natural candidate for the proof-as-code axiom in this code-amenable field."
    },
    {
      "assessment": "partially_supported",
      "claim": "Theorem 4 (v_k≡V_k mod I_k): With the recursively-defined power series P(T)=T+\\sum V_k T^{2^k}, we have v_k≡V_k mod I_k.",
      "evidence": "The proof proceeds by a clean nested induction on s using BHSZ's recursive formula for v_k modulo I_k together with the invariance of I_k under the Galois action (BHSZ Prop. 3.7). The reductions modulo (2) and I_k look careful and the use of Frobenius for the (2^j)-th power terms is standard. However, the inductive step manipulates a substantial sum of products that depends on the specific behavior of \\gamma_n^{2^s}=\\gamma_{n-s}; subtle index errors here are easy to make and the bounded text gives only the headline display. As a load-bearing computational identity that propagates into Proposition 5 (and thus the negative half of Theorem 3), this benefits from independent verification.",
      "id": "C8",
      "location": "Theorem 4 (theorem: vk is Vk), Section 3.3",
      "severity": "major",
      "suggested_fix": "Provide an executable verification (Sage / Macaulay2 / Python with sympy) at experiments/theorem4/check_v_eq_V.sage that constructs the rings \\pi^e_*(BP^{((C_{2^n}))}) modulo (2,v_1,\\ldots,v_{k-1}) for small n,k and confirms the congruence symbolically. The base-case argument and the rewrite using \\gamma_{n-s}=\\gamma_n^{2^s} should also be expanded by one display line in the printed proof."
    },
    {
      "assessment": "unsupported",
      "claim": "Proposition 5 (F_4-points): For G=C_{2^n} and h=2^{n-1}m: (i) when n≥3 and m=1, the ring \\pi^e_*(L_{K(h)} BP^{((G))}<1>)/I_h has at least 3^{2^{n-2}} F_4-points; (ii) when n≥2 and m≥2, it has at least four F_4-points.",
      "evidence": "The proof gives explicit F_4-point constructions: in (i) by setting (\\alpha_{0,1},\\ldots,\\alpha_{2^{n-1}-1,1})=(c_0,c_0,c_1,c_1,\\ldots), and in (ii) by exhibiting polynomials A_m,B_m\\in F_4[T] satisfying B_m(A_m(T))=T+T^{2^{2m}} with the displayed coefficients. The verification of B_m(A_m(T))=T+T^{2^{2m}} is delegated to the reader as \"an algebra exercise\". This is exactly the situation contemplated by the proof-as-code axiom: the claim is purely algebraic, finite-field, and trivially verifiable by computer algebra, yet the paper does not ship the verification artifact. While I find the construction plausible, the absence of an executable verification artifact is a substantive weakness for a load-bearing computation that underwrites half of the headline Theorem 3.",
      "id": "C9",
      "location": "Proposition 5 (prop: F4 points computation), Section 3.3",
      "severity": "major",
      "suggested_fix": "Ship an executable verification script (e.g. experiments/F4_points/verify_prop5.sage) that (a) symbolically confirms B_m(A_m(T))=T+T^{2^{2m}} for m∈{2,3,4,5,6} via SageMath polynomial arithmetic over F_4, (b) enumerates F_4-points exhaustively for small (n,m) and matches against 3^{2^{n-2}} and ≥4, and (c) verifies the recursion identity using S_m and R(T) symbolically. Reference this artifact in the proof of Proposition 5."
    },
    {
      "assessment": "partially_supported",
      "claim": "Lemma 4 (BP^{((C_4))}<2> mod I_4 computation): \\pi^e_*(L_{K(4)} BP^{((C_4))}<2>)/(2,v_1,v_2,v_3) ≅ F_4[(t_1^{C_4})^{±1}] × F_2[(t_2^{C_4})^{±1}] as BP_*-modules.",
      "evidence": "The computation follows from K(h)-localization formula (Remark 10) together with explicit BHSZ formulas v_1,v_2,v_3,v_4 mod (2,v_1,\\ldots), an isomorphism quotienting by I_4, and a Chinese Remainder Theorem decomposition splitting along the factorization t_1^{C_4}(\\ldots). The presented chain of equalities is consistent and the CRT step is reasonable. The substitution maps t_1^{C_4}\\mapsto t_1^{C_4}, \\gamma_2 t_1^{C_4}\\mapsto t_1^{C_4}, t_2^{C_4}\\mapsto t_2^{C_4}, \\gamma_2 t_2^{C_4}\\mapsto t_2^{C_4}+(t_1^{C_4})^3 are not justified in detail (in particular why the apparently asymmetric assignment lands inside the relevant ideal).",
      "id": "C10",
      "location": "Lemma 4 (lemma: BP C4 2 mod I computation), Section 3.3",
      "severity": "minor",
      "suggested_fix": "Either expand the justification of the substitution map (showing it sends each generator into the indicated quotient ring and identifies the kernel with I_4 quotiented appropriately), or supplement Lemma 4 with a tiny computer-algebra check (Sage/Macaulay2) that the displayed isomorphism really holds at the level of F_2-algebras."
    },
    {
      "assessment": "supported",
      "claim": "Remark / Corollary 11: There is no equivalence between L_{K(4)} Res^{C_4}_e BP^{((C_4))}<2> and L_{K(4)} Res^{C_4}_e D^{-1} BP^{((C_4))}<2> as BP-modules.",
      "evidence": "This follows directly from Lemma 4 combined with BHSZ Proposition 7.1 (\\pi^e_*(L_{K(4)} D^{-1} BP^{((C_4))}<2>)/I_4 ≅ F_2[(t_2^{C_4})^{±1}]) by comparing the number of F_4-points (3 vs 9). The argument is elementary modulo Lemma 4 and BHSZ's Prop 7.1.",
      "id": "C11",
      "location": "Corollary 11, Section 3.3",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Generic optimality remark: E_\\sigma is the best possible structure on BP_R/\\bar{v}_i; in particular there is no homotopy associative C_2-ring structure on BP_R/\\bar{v}_i (after Shi, recorded by Bachmann–Hahn), and there exist quotients whose underlying spectra do not admit E_2 structure, ruling out E_{2\\sigma} generically.",
      "evidence": "This is presented as a citation/attribution to Shi as recorded by Bachmann–Hahn and is consistent with the known fact (going back to Strickland and others) that not all MU-quotients admit E_2-structures non-equivariantly; together these rule out E_1 and E_{2\\sigma} equivariant enhancements generically. The remark does not introduce new claims that this paper proves.",
      "id": "C12",
      "location": "Remark 3 (remark: MUR quotient theorem), Section 1",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Corollary 3 (Real BSS): Quotients of MU_R can be realized as C_2-Thom spectra over B\\Omega^\\sigma SU_R via an E_\\sigma-algebra map.",
      "evidence": "This is the Real / C_2-equivariant analog of Basu–Sagave–Schlichtkrull's Thom-spectrum description of MU-quotients. The authors note that a naive equivariantization fails (the right replacement of SU is B\\Omega^\\sigma SU_R, not SU_R with complex-conjugation action) and claim that their methods using quinnZhu2026 produce the result by an alternative route rather than mimicking BSS. From the bounded text, the actual derivation of the Thom-spectrum description appears later in Section 2 and again depends on quinnZhu2026 lifting/Thom-isomorphism inputs.",
      "id": "C13",
      "location": "Corollary 3 (corollary: Real BSS), Section 2",
      "severity": "minor",
      "suggested_fix": "Make explicit (a single paragraph or a dedicated subsection) which Thom-isomorphism / Thom-spectrum result of quinnZhu2026 is being invoked, including whether it is stated at the level of E_\\sigma-algebra maps. A worked low-rank example (e.g. for the BP_R/\\bar{v}_1 quotient) would be valuable as a sanity check."
    },
    {
      "assessment": "partially_supported",
      "claim": "The orientation map BP^{((G))}<m> → E(k,\\Gamma_h) of Theorem 2 is the first construction of this map in the literature.",
      "evidence": "The claim is one of historical novelty, not mathematical content per se. The cited literature (Meier–Shi–Zeng, Duan et al.) uses these maps but does not appear to construct them; the cited BHSZ paper constructs the BP^{((G))} → E orientation but not the factorization through BP^{((G))}<m>. Strictly verifying the \"first\" assertion is the job of the novelty / citation reviewers, not technical correctness; it is consistent with the bibliography provided.",
      "id": "C14",
      "location": "Introduction, Section 1 (\"To our knowledge, Theorem 2 gives the first construction…\")",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Theorem 1's equivariant Thom-spectrum chain (twisted monoid quotients identified as total cofibers of equivariant cubes via parametrized colimits, Section 4).",
      "evidence": "Section 4 records the technical infrastructure (parametrized colimit description of twisted monoid quotients) used implicitly throughout Section 2. From the bounded text the construction (Proposition 6 etc.) and its compatibility with restriction/coinduction look careful and follow Hilman's parametrized noncommutative motives framework. The principal exposure, again, is reliance on parametrized higher algebra results not re-proved here.",
      "id": "C15",
      "location": "Section 4 (twisted monoid quotients via parametrized colimits)",
      "severity": "minor",
      "suggested_fix": "Provide a small worked example (e.g. how the twisted monoid quotient MU^{((C_4))}/(C_4\\cdot\\bar{v}_1) decomposes as a total cofiber of the corresponding equivariant cube) to make the parametrized-colimit description concrete for the reader."
    }
  ],
  "confidence": 0.62,
  "overall_correctness": "mostly_sound"
}
```

## Corrections

<!-- corrections-section: rendered from corrections table; empty on first publish -->
_No corrections have been recorded._

## Bibliography

1. StewartDunn: title=Equivariant Higher Algebra, author=Natalie Stewart, year=2026, url=https://dash.harvard.edu/entities/publication/df60734e-53b2-47f9-88e2-08cd201a8b5e, NOTE = Doctoral Dissertation, Harvard University Graduate School of Arts and Sciences available at \hrefhttps://dash.harvard.edu/entities/publication/df60734e-53b2-47f9-88e2-08cd201a8b5edash.harvard.edu,
2. quinnZhu20206realsnaith: title=Structured Real Snaith Equivalences, author=Ryan Quinn and Qi Zhu, year=2026, eprint=2606.23309, archivePrefix=arXiv, primaryClass=math.AT, url=https://arxiv.org/abs/2606.23309, NOTE = \hrefhttps://arxiv.org/abs/2606.23309arXiv:2606.23309, arXiv:[2606.23309](https://arxiv.org/abs/2606.23309)
3. AimPL_equivstable_5: author = AimPL, title = Equivariant techniques in stable homotopy theory, Section 5: Partially commutative ring spectra, howpublished = \urlhttp://aimpl.org/equivstable/5/, note = Available at \urlhttp://aimpl.org/equivstable/5/; accessed 2026-06-02
4. willumsgaard2026obstructionsassociativitystablehomotopy: title=Obstructions for Associativity in Stable Homotopy Theory, author=Sophus Valentin Willumsgaard, year=2026, eprint=2605.11390, archivePrefix=arXiv, primaryClass=math.AT, url=https://arxiv.org/abs/2605.11390, NOTE = \hrefhttps://arxiv.org/abs/2605.11390arXiv:2605.11390, arXiv:[2605.11390](https://arxiv.org/abs/2605.11390)
5. GoerssHopkins2004Moduli: author = Goerss, P. G. and Hopkins, M. J., title = Moduli spaces of commutative ring spectra, booktitle = Structured Ring Spectra, editor = Baker, Andrew and Richter, Birgit, series = London Mathematical Society Lecture Note Series, volume = 315, pages = 151--200, publisher = Cambridge University Press, address = Cambridge, year = 2004, doi = 10.1017/CBO9780511529955.009 doi:[10.1017/CBO9780511529955.009](https://doi.org/10.1017/CBO9780511529955.009)
6. HillHopkinsRavenel2017C4RealKTheory: author = Hill, Michael A. and Hopkins, Michael J. and Ravenel, Douglas C., title = The slice spectral sequence for the $C_4$ analog of real $K$-theory, journal = Forum Mathematicum, volume = 29, number = 2, pages = 383--447, year = 2017, doi = 10.1515/forum-2016-0017, eprint = 1502.07611, archivePrefix = arXiv, primaryClass = math.AT doi:[10.1515/forum-2016-0017](https://doi.org/10.1515/forum-2016-0017) arXiv:[1502.07611](https://arxiv.org/abs/1502.07611)
7. delangel2024dualshigherrealktheories: title=Duals of higher real $K$-theories at $p=2$, author=Juan C. Moreno Del Angel, year=2024, eprint=2410.10726, archivePrefix=arXiv, primaryClass=math.AT, url=https://arxiv.org/abs/2410.10726, NOTE = \hrefhttps://arxiv.org/abs/2410.10726arXiv:2410.10726, arXiv:[2410.10726](https://arxiv.org/abs/2410.10726)
8. meier2024transchromaticphenomenaequivariantslice: title=Transchromatic phenomena in the equivariant slice spectral sequence, author=Lennart Meier and XiaoLin Danny Shi and Mingcong Zeng, year=2024, eprint=2403.00741, archivePrefix=arXiv, primaryClass=math.AT, url=https://arxiv.org/abs/2403.00741, arXiv:[2403.00741](https://arxiv.org/abs/2403.00741)
9. Qtmf15: author = Ryan Quinn, title = Topological modular forms with level structure and higher truncated Brown--Peterson spectra, note = In preparation, year = 2026
10. MahowaldRezkfp: author = Mahowald, Mark and Rezk, Charles, title = Brown-Comenetz duality and the Adams spectral sequence, fjournal = American Journal of Mathematics, journal = Am. J. Math., issn = 0002-9327, volume = 121, number = 6, pages = 1153--1177, year = 1999, language = English, doi = 10.1353/ajm.1999.0043, keywords = 55P42,55T15,55P43, url = citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.23.8631, zbMATH = 1394562, Zbl = 0942.55012 doi:[10.1353/ajm.1999.0043](https://doi.org/10.1353/ajm.1999.0043) arXiv:[1999.0043](https://arxiv.org/abs/1999.0043)
11. HEWETT1995518: title = Finite Subgroups of Division Algebras over Local Fields, journal = Journal of Algebra, volume = 173, number = 3, pages = 518-548, year = 1995, issn = 0021-8693, doi = https://doi.org/10.1006/jabr.1995.1101, url = https://www.sciencedirect.com/science/article/pii/S0021869385711015, author = T. Hewett doi:[https://doi.org/10.1006/jabr.1995.1101](https://doi.org/https://doi.org/10.1006/jabr.1995.1101) arXiv:[1995.1101](https://arxiv.org/abs/1995.1101)
12. CarrickHillMU: author = Carrick, Christian and Hill, Michael A., title = On \(MU\)-homology of connective models of higher real \(K\)-theories, fjournal = Proceedings of the American Mathematical Society. Series B, journal = Proc. Am. Math. Soc., Ser. B, issn = 2330-1511, volume = 12, pages = 172--186, year = 2025, language = English, doi = 10.1090/bproc/265, keywords = 55N91,55N34,55N22,55T25, zbMATH = 8071635 doi:[10.1090/bproc/265](https://doi.org/10.1090/bproc/265)
13. Angeltveit_2008: title=Topological Hochschild homology and cohomology of $A_\infty$-ring spectra, volume=12, ISSN=1465-3060, url=http://dx.doi.org/10.2140/gt.2008.12.987, DOI=10.2140/gt.2008.12.987, number=2, journal=Geometry \& Topology, publisher=Mathematical Sciences Publishers, author=Angeltveit, Vigleik, year=2008, month=may, pages=987–1032 doi:[10.2140/gt.2008.12.987](https://doi.org/10.2140/gt.2008.12.987)
14. stricklandMU: author = Strickland, N. P., title = Products on \(MU\)-modules, fjournal = Transactions of the American Mathematical Society, journal = Trans. Am. Math. Soc., issn = 0002-9947, volume = 351, number = 7, pages = 2569--2606, year = 1999, language = English, doi = 10.1090/S0002-9947-99-02436-8, keywords = 55N22,55P42,55T25,55N20, zbMATH = 1288974, Zbl = 0924.55005 doi:[10.1090/S0002-9947-99-02436-8](https://doi.org/10.1090/S0002-9947-99-02436-8) arXiv:[0924.55005](https://arxiv.org/abs/0924.55005)
15. burklund2022multiplicativestructuresmoorespectra: title=Multiplicative structures on Moore spectra, author=Robert Burklund, year=2022, eprint=2203.14787, archivePrefix=arXiv, primaryClass=math.AT, url=https://arxiv.org/abs/2203.14787, NOTE = \hrefhttps://arxiv.org/abs/2203.14787arXiv:2203.14787, arXiv:[2203.14787](https://arxiv.org/abs/2203.14787)
16. hopkinslurieambi: title=Ambidexterity in $K(n)$-Local Stable Homotopy Theory, AUTHOR = Hopkins, M. J. and Lurie, J., month=December, year=2013, NOTE = \hrefhttps://www.math.ias.edu/ lurie/papers/Ambidexterity.pdfAmbidexterity.pdf
17. rotation: title=Rotation invariance in algebraic $K$-theory, author=Lurie, Jacob, month=September, year=2015, NOTE = \hrefhttps://www.math.ias.edu/ lurie/papers/Waldhaus.pdfWaldhaus.pdf
18. HahnYuan: title = Multiplicative structure in the stable splitting of $\Omega SL_n(\mathbbC)$, journal = Advances in Mathematics, volume = 348, pages = 412-455, year = 2019, issn = 0001-8708, doi = https://doi.org/10.1016/j.aim.2019.03.022, url = https://www.sciencedirect.com/science/article/pii/S0001870819301525, author = Jeremy Hahn and Allen Yuan, keywords = Affine Grassmannian, Homotopy theory, Structured ring spectrum, Stable splitting, abstract = The space of based loops in SLn(C), also known as the affine Grassmannian of SLn(C), admits an E2 or fusion product. Work of Mitchell and Richter proves that this based loop space stably splits as an infinite wedge sum. We prove that the Mitchell–Richter splitting is coherently multiplicative, but not E2. Nonetheless, we show that the splitting becomes E2 after base-change to complex cobordism. Our proof of the A∞ splitting involves on the one hand an analysis of the multiplicative properties of Weiss calculus, and on the other a use of Beilinson–Drinfeld Grassmannians to verify a conjecture of Mahowald and Richter. Other results are obtained by explicit, obstruction-theoretic computations. doi:[https://doi.org/10.1016/j.aim.2019.03.022](https://doi.org/https://doi.org/10.1016/j.aim.2019.03.022)
19. hillHopkins2014equivariantmultiplicativeclosure: AUTHOR = Hill, M. A. and Hopkins, M. J., TITLE = Equivariant multiplicative closure, BOOKTITLE = Algebraic topology: applications and new directions, SERIES = Contemp. Math., VOLUME = 620, PAGES = 183--199, PUBLISHER = Amer. Math. Soc., Providence, RI, YEAR = 2014, ISBN = 978-0-8218-9474-3, MRCLASS = 55P43 (55P60 55P91), MRNUMBER = 3290092, MRREVIEWER = Steven\ R.\ Costenoble, DOI = 10.1090/conm/620/12372, URL = https://doi.org/10.1090/conm/620/12372, doi:[10.1090/conm/620/12372](https://doi.org/10.1090/conm/620/12372)
20. peterson2024EMspaces: AUTHOR = Petersen, Sarah, TITLE = The $H \Bbb F_2$-homology of $C_2$-equivariant Eilenberg--Mac Lane spaces, JOURNAL = Algebr. Geom. Topol., FJOURNAL = Algebraic \& Geometric Topology, VOLUME = 24, YEAR = 2024, NUMBER = 8, PAGES = 4487--4518, ISSN = 1472-2747,1472-2739, MRCLASS = 55P91 (55N91 55P20), MRNUMBER = 4843737, MRREVIEWER = Steven\ R.\ Costenoble, DOI = 10.2140/agt.2024.24.4487, URL = https://doi.org/10.2140/agt.2024.24.4487, doi:[10.2140/agt.2024.24.4487](https://doi.org/10.2140/agt.2024.24.4487)
21. hahn2018quotientsrings: title=Quotients of even rings, author=Jeremy Hahn and Dylan Wilson, year=2018, eprint=1809.04723, archivePrefix=arXiv, primaryClass=math.AT, url=https://arxiv.org/abs/1809.04723, NOTE = \hrefhttps://arxiv.org/abs/1809.04723arXiv:1809.04723, arXiv:[1809.04723](https://arxiv.org/abs/1809.04723)
22. Basu_2017: title=GENERALIZED THOM SPECTRA AND THEIR TOPOLOGICAL HOCHSCHILD HOMOLOGY, volume=19, ISSN=1475-3030, url=http://dx.doi.org/10.1017/S1474748017000421, DOI=10.1017/s1474748017000421, number=1, journal=Journal of the Institute of Mathematics of Jussieu, publisher=Cambridge University Press (CUP), author=Basu, Samik and Sagave, Steffen and Schlichtkrull, Christian, year=2017, month=nov, pages=21–64 doi:[10.1017/s1474748017000421](https://doi.org/10.1017/s1474748017000421)
23. HWv2: title=Redshift and multiplication for truncated Brown-Peterson spectra, arXiv version 2, author=Jeremy Hahn and Dylan Wilson, year=2022, eprint=2012.00864v2, archivePrefix=arXiv, primaryClass=math.AT, url=https://arxiv.org/abs/2012.00864v2, NOTE = \hrefhttps://arxiv.org/abs/2012.00864v2arXiv:2012.00864v2, arXiv:[2012.00864v2](https://arxiv.org/abs/2012.00864v2)
24. quinnZhu2026multiplicativeequivariantthomspectra: title=Multiplicative Equivariant Thom Spectra \& Structured Real Orientations, author=Ryan Quinn and Qi Zhu, year=2026, eprint=2512.15573, archivePrefix=arXiv, primaryClass=math.AT, url=https://arxiv.org/abs/2512.15573, NOTE = \hrefhttps://arxiv.org/abs/2512.15573arXiv:2512.15573, arXiv:[2512.15573](https://arxiv.org/abs/2512.15573)
25. QZ25: title=Multiplicative Equivariant Thom Spectra $\&$ Structured Real Orientations, author=Ryan Quinn and Qi Zhu, year=2025, eprint=2512.15573, archivePrefix=arXiv, primaryClass=math.AT, url=https://arxiv.org/abs/2512.15573, NOTE = \hrefhttps://arxiv.org/abs/2512.15573arXiv:2512.15573, arXiv:[2512.15573](https://arxiv.org/abs/2512.15573)
26. Beaudry_2020: AUTHOR = Beaudry, Agn\`es and Bobkova, Irina and Hill, Michael and Stojanoska, Vesna, TITLE = Invertible $K(2)$-local $E$-modules in $C_4$-spectra, JOURNAL = Algebr. Geom. Topol., FJOURNAL = Algebraic \& Geometric Topology, VOLUME = 20, YEAR = 2020, NUMBER = 7, PAGES = 3423--3503, ISSN = 1472-2747,1472-2739, MRCLASS = 55P42 (20J06 55M05 55P60 55Q51 55Q91), MRNUMBER = 4194286, MRREVIEWER = Dylan\ Wilson, DOI = 10.2140/agt.2020.20.3423, URL = https://doi.org/10.2140/agt.2020.20.3423, doi:[10.2140/agt.2020.20.3423](https://doi.org/10.2140/agt.2020.20.3423)
27. hill2023slice: title=The Slice Spectral Sequence of a $C_4$-Equivariant Height-4 Lubin--Tate Theory, author=Hill, Michael and Shi, XiaoLin and Wang, Guozhen and Xu, Zhouli, volume=288, number=1429, year=2023, publisher=American Mathematical Society
28. Duan_2025: title=Vanishing lines in chromatic homotopy theory, volume=29, ISSN=1465-3060, url=http://dx.doi.org/10.2140/gt.2025.29.903, DOI=10.2140/gt.2025.29.903, number=2, JOURNAL = Algebr. Geom. Topol., FJOURNAL = Algebraic \& Geometric Topology, publisher=Mathematical Sciences Publishers, author=Duan, Zhipeng and Li, Guchuan and Shi, XiaoLin Danny, year=2025, month=apr, pages=903–930 doi:[10.2140/gt.2025.29.903](https://doi.org/10.2140/gt.2025.29.903)
29. Heard2021: AUTHOR = Heard, Drew and Li, Guchuan and Shi, XiaoLin Danny, TITLE = Picard groups and duality for real Morava $E$-theories, JOURNAL = Algebr. Geom. Topol., FJOURNAL = Algebraic \& Geometric Topology, VOLUME = 21, YEAR = 2021, NUMBER = 6, PAGES = 2703--2760, ISSN = 1472-2747,1472-2739, MRCLASS = 55P91 (14C22 19L99 55N20 55P43 55U30), MRNUMBER = 4344869, MRREVIEWER = Tilman\ Bauer, DOI = 10.2140/agt.2021.21.2703, URL = https://doi.org/10.2140/agt.2021.21.2703, doi:[10.2140/agt.2021.21.2703](https://doi.org/10.2140/agt.2021.21.2703)
30. carrick2025higherrealktheoriesfinite: title=On higher real $K$-theories and finite spectra, author=Christian Carrick and Michael A. Hill, year=2025, eprint=2507.07051, archivePrefix=arXiv, primaryClass=math.KT, NOTE = \hrefhttps://arxiv.org/abs/2507.07051arXiv:2507.07051, arXiv:[2507.07051](https://arxiv.org/abs/2507.07051)
31. carrickSmashingLocalizationsEquivariant2022: AUTHOR = Carrick, Christian, TITLE = Smashing localizations in equivariant stable homotopy, JOURNAL = J. Homotopy Relat. Struct., FJOURNAL = Journal of Homotopy and Related Structures, VOLUME = 17, YEAR = 2022, NUMBER = 3, PAGES = 355--392, ISSN = 2193-8407,1512-2891, MRCLASS = 55P91, MRNUMBER = 4470384, MRREVIEWER = Andr\'e\ G.\ Henriques, DOI = 10.1007/s40062-022-00310-1, URL = https://doi.org/10.1007/s40062-022-00310-1, doi:[10.1007/s40062-022-00310-1](https://doi.org/10.1007/s40062-022-00310-1)
32. Blumberg_2020: title=G-symmetric monoidal categories of modules over equivariant commutative ring spectra, volume=2, ISSN=2576-7658, url=http://dx.doi.org/10.2140/tunis.2020.2.237, DOI=10.2140/tunis.2020.2.237, number=2, journal=Tunisian Journal of Mathematics, publisher=Mathematical Sciences Publishers, author=Blumberg, Andrew J. and Hill, Michael A., year=2020, month=jan, pages=237–286 doi:[10.2140/tunis.2020.2.237](https://doi.org/10.2140/tunis.2020.2.237)
33. hill2010arf: title=The Arf-Kervaire problem in algebraic topology: Sketch of the proof, author=Hill, Michael A and Hopkins, Michael J and Ravenel, Douglas C, journal=Current developments in mathematics, volume=2010, number=1, pages=1--44, year=2010, publisher=International Press of Boston
34. sengerleveln: title=Obstruction theory and the level $n$ elliptic genus, author=Andrew Senger, year=2022, eprint=2203.13743, archivePrefix=arXiv, primaryClass=math.AT, NOTE = \hrefhttps://arxiv.org/abs/2203.13743arXiv:2203.13743, arXiv:[2203.13743](https://arxiv.org/abs/2203.13743)
35. MeierHirzebruch: AUTHOR = Meier, Lennart, TITLE = Connective models for topological modular forms of level $n$, JOURNAL = Algebr. Geom. Topol., FJOURNAL = Algebraic \& Geometric Topology, VOLUME = 23, YEAR = 2023, NUMBER = 8, PAGES = 3553--3586, ISSN = 1472-2747,1472-2739, MRCLASS = 55N34 (55N22 55P91), MRNUMBER = 4665277, MRREVIEWER = Jianbo\ Wang, DOI = 10.2140/agt.2023.23.3553, URL = https://doi.org/10.2140/agt.2023.23.3553, doi:[10.2140/agt.2023.23.3553](https://doi.org/10.2140/agt.2023.23.3553)
36. HuKrizReal: title = Real-oriented homotopy theory and an analogue of the Adams–Novikov spectral sequence, journal = Topology, volume = 40, number = 2, pages = 317-399, year = 2001, issn = 0040-9383, doi = https://doi.org/10.1016/S0040-9383(99)00065-8, url = https://www.sciencedirect.com/science/article/pii/S0040938399000658, author = Po Hu and Igor Kriz, keywords = Equivariant stable homotopy theory, Cobordism, Adams–Novikov spectral sequence, Real K-theory, abstract = Using the Landweber–Araki theory of Real cobordism and Real-oriented spectra, we define a Real analogue of the Adams–Novikov spectral sequence. This is a new spectral sequence with a potentially calculable E2-term. It has versions converging to either the Z/2-equivariant or the non-equivariant stable 2-stems. We also construct a Real analogue of the Miller–Novikov ‘algebraic’ spectral sequence. doi:[https://doi.org/10.1016/S0040-9383(99)00065-8](https://doi.org/https://doi.org/10.1016/S0040-9383(99)00065-8)
37. BHLS: title=$K$-theoretic counterexamples to Ravenel's telescope conjecture, author=Robert Burklund and Jeremy Hahn and Ishan Levy and Tomer M. Schlank, year=2023, eprint=2310.17459, archivePrefix=arXiv, primaryClass=math.AT, NOTE = \hrefhttps://arxiv.org/abs/2310.17459arXiv:2310.17459, arXiv:[2310.17459](https://arxiv.org/abs/2310.17459)
38. hahn2017nilpotenceenalgebras: title=Nilpotence in $\mathbbE_n$ Algebras, author=Jeremy Hahn, year=2017, eprint=1707.00956, archivePrefix=arXiv, primaryClass=math.AT, NOTE = \hrefhttps://arxiv.org/abs/1707.00956arXiv:1707.00956, arXiv:[1707.00956](https://arxiv.org/abs/1707.00956)
39. Hahn2020Nishida: author = Jeremy Hahn, title = Nishida Nilpotence, year = 2020, month = sep, note = Online Algebraic Topology Seminar, howpublished = \urlhttps://www.youtube.com/watch?v=yqb0-7jZFmY, url = https://www.youtube.com/watch?v=yqb0-7jZFmY, urldate = 2025-11-08
40. DHS88: ISSN = 0003486X, 19398980, URL = http://www.jstor.org/stable/1971440, author = Ethan S. Devinatz and Michael J. Hopkins and Jeffrey H. Smith, journal = Annals of Mathematics, number = 2, pages = 207--241, publisher = [Annals of Mathematics, Trustees of Princeton University on Behalf of the Annals of Mathematics, Mathematics Department, Princeton University], title = Nilpotence and Stable Homotopy Theory I, urldate = 2025-11-07, volume = 128, year = 1988
41. MNNMayNilpotence: author = Mathew, Akhil and Naumann, Niko and Noel, Justin, title = On a nilpotence conjecture of J. P. May, journal = Journal of Topology, volume = 8, number = 4, pages = 917-932, doi = https://doi.org/10.1112/jtopol/jtv021, url = https://londmathsoc.onlinelibrary.wiley.com/doi/abs/10.1112/jtopol/jtv021, eprint = https://londmathsoc.onlinelibrary.wiley.com/doi/pdf/10.1112/jtopol/jtv021, abstract = We prove a conjecture of J.P. May concerning the nilpotence of elements in ring spectra with power operations, that is, H∞-ring spectra. Using an explicit nilpotence bound on the torsion elements in K(n)-local H∞-algebras over En, we reduce the conjecture to the nilpotence theorem of Devinatz, Hopkins, and Smith. As corollaries, we obtain nilpotence results in various bordism rings including MSpin* and MString*, results about the behavior of the Adams spectral sequence for E∞-ring spectra, and the non-existence of E∞-ring structures on certain complex-oriented ring spectra., year = 2015 doi:[https://doi.org/10.1112/jtopol/jtv021](https://doi.org/https://doi.org/10.1112/jtopol/jtv021)
42. Hill22disks: title = On the algebras over equivariant little disks, journal = Journal of Pure and Applied Algebra, volume = 226, number = 10, pages = 107052, year = 2022, issn = 0022-4049, doi = https://doi.org/10.1016/j.jpaa.2022.107052, url = https://www.sciencedirect.com/science/article/pii/S0022404922000482, author = Michael A. Hill, abstract = We describe the structure present in algebras over the little disks operads for various representations of a finite group G, including those that are not necessarily universe or that do not contain trivial summands. We then spell out in more detail what happens for G=C2, describing the structure on algebras over the little disks operad for the sign representation. Here we can also describe the resulting structure in Bredon homology. Finally, we produce a stable splitting of coinduced spaces analogous to the stable splitting of the product, and we use this to determine the homology of the signed James construction. doi:[https://doi.org/10.1016/j.jpaa.2022.107052](https://doi.org/https://doi.org/10.1016/j.jpaa.2022.107052) arXiv:[2022.10705](https://arxiv.org/abs/2022.10705)
43. horev2019genuineequivariantfactorizationhomology: title=Genuine equivariant factorization homology, author=Asaf Horev, year=2019, eprint=1910.07226, archivePrefix=arXiv, primaryClass=math.AT, NOTE = \hrefhttps://arxiv.org/abs/1910.07226arXiv:1910.07226, arXiv:[1910.07226](https://arxiv.org/abs/1910.07226)
44. li2023thom: title = A Thom Spectrum Model for $C_2$-Integral Brown--Gitler Spectra, author = Li, Guchuan and Petersen, Sarah and Tatum, Elizabeth Ellen, journal = Proceedings of the American Mathematical Society, note = To appear. \hrefhttps://arxiv.org/abs/2308.12945arXiv:2308.12945, year = 2023 arXiv:[2308.12945](https://arxiv.org/abs/2308.12945)
45. HW20thom: author = Jeremy Hahn and Dylan Wilson, title = Eilenberg–MacLane spectra as equivariant Thom spectra, volume = 24, journal = Geometry & Topology, number = 6, publisher = MSP, pages = 2709 -- 2748, keywords = Eilenberg–MacLane, equivariant, Mahowald, Thom spectrum, year = 2020, doi = 10.2140/gt.2020.24.2709, URL = https://doi.org/10.2140/gt.2020.24.2709 doi:[10.2140/gt.2020.24.2709](https://doi.org/10.2140/gt.2020.24.2709)
46. rognes2000algebraic: title = Algebraic K-theory of finitely presented ring spectra, author = Rognes, John, note = Preprint, year = 2000, month = September, day = 29
47. carrick2025slice: title=Slice spectral sequences through synthetic spectra, author=Christian Carrick, year=2025, eprint=2510.19501, archivePrefix=arXiv, primaryClass=math.AT, NOTE = \hrefhttps://arxiv.org/abs/2510.19501arXiv:2510.19501, arXiv:[2510.19501](https://arxiv.org/abs/2510.19501)
48. equivUCT: author = Lewis Jr, L. Gaunce and Mandell, Michael A., title = Equivariant Universal Coefficient and Künneth Spectral Sequences, journal = Proceedings of the London Mathematical Society, volume = 92, number = 2, pages = 505-544, doi = https://doi.org/10.1112/S0024611505015492, url = https://londmathsoc.onlinelibrary.wiley.com/doi/abs/10.1112/S0024611505015492, eprint = https://londmathsoc.onlinelibrary.wiley.com/doi/pdf/10.1112/S0024611505015492, abstract = This paper constructs hyper-homology spectral sequences of Z-graded and ROG-graded Mackey functors that compute Ext and Tor over G-equivariant S-algebras A∞ ring spectra) for finite groups G. These specialize to universal coefficient and Künneth spectral sequences. 2000 Mathematics Subject Classification 55N91 (primary), 55P43, 55U20, 55U25 (secondary)., year = 2006 doi:[https://doi.org/10.1112/S0024611505015492](https://doi.org/https://doi.org/10.1112/S0024611505015492)
49. Shimakawa1989: author = Shimakawa, Kazuhisa, title = Infinite Loop G-Spaces Associated to Monoidal G-Graded Categories, journal = Publications of the Research Institute for Mathematical Sciences, year = 1989, volume = 25, number = 2, pages = 239--262, doi = 10.2977/PRIMS/1195173610 doi:[10.2977/PRIMS/1195173610](https://doi.org/10.2977/PRIMS/1195173610)
50. Shimakawa1991: author = Kazuhisa Shimakawa, title = A note on $\Gamma_G$-spaces, volume = 28, journal = Osaka Journal of Mathematics, number = 2, publisher = The University of Osaka and Osaka Metropolitan University, Departments of Mathematics, pages = 223 -- 228, year = 1991,
51. Segal1978unpublished: author = Segal, Graeme, title = Some results in equivariant homotopy theory, note = Preprint, year = 1978
52. GMMO2023: title = Multiplicative equivariant K-theory and the Barratt-Priddy-Quillen theorem, journal = Advances in Mathematics, volume = 414, pages = 108865, year = 2023, issn = 0001-8708, doi = https://doi.org/10.1016/j.aim.2023.108865, url = https://www.sciencedirect.com/science/article/pii/S0001870823000087, author = Bertrand J. Guillou and J. Peter May and Mona Merling and Angélica M. Osorno doi:[https://doi.org/10.1016/j.aim.2023.108865](https://doi.org/https://doi.org/10.1016/j.aim.2023.108865) arXiv:[2023.10886](https://arxiv.org/abs/2023.10886)
53. Yau2024: title=Multifunctorial Equivariant Algebraic K-Theory, author=Donald Yau, year=2024, eprint=2404.02794, archivePrefix=arXiv, primaryClass=math.AT, url=https://arxiv.org/abs/2404.02794, arXiv:[2404.02794](https://arxiv.org/abs/2404.02794)
54. Guillou2012EquivariantIL: title=Equivariant iterated loop space theory and permutative G-categories, author=Bertrand Guillou and J. Peter May, journal=Algebraic \& Geometric Topology, year=2017, volume=17, pages=3259-3339, url=https://msp.org/agt/2017/17-6/p02.xhtml, doi=10.2140/agt.2017.17.3259 doi:[10.2140/agt.2017.17.3259](https://doi.org/10.2140/agt.2017.17.3259)
55. kerodon: title = Kerodon, author = Jacob Lurie, howpublished = \urlhttps://kerodon.net, year = 2018,
56. bertminicourse: author = Guillou, Bert, title = The Slice Filtration: eCHT Minicourse, year = 2022, month = May, howpublished = \urlhttps://www.ms.uky.edu/ guillou/echtSlices/SlicesMinicourse.html, note = Lecture notes and videos from a minicourse held May 10--19, 2022, urldate = 2025-10-17
57. hill2022freeness: author = Hill, Michael A., title = Freeness and equivariant stable homotopy, journal = Journal of Topology, volume = 15, number = 2, pages = 359-397, doi = https://doi.org/10.1112/topo.12227, url = https://londmathsoc.onlinelibrary.wiley.com/doi/abs/10.1112/topo.12227, eprint = https://londmathsoc.onlinelibrary.wiley.com/doi/pdf/10.1112/topo.12227, year = 2022 doi:[https://doi.org/10.1112/topo.12227](https://doi.org/https://doi.org/10.1112/topo.12227)
58. Atiyah66Real: title = K-Theory and Reality, author = Atiyah, M. F., year = 1966, month = jan, journal = The Quarterly Journal of Mathematics, volume = 17, number = 1, eprint = https://academic.oup.com/qjmath/article-pdf/17/1/367/7295753/17-1-367.pdf, pages = 367--386, issn = 0033-5606, doi = 10.1093/qmath/17.1.367 doi:[10.1093/qmath/17.1.367](https://doi.org/10.1093/qmath/17.1.367)
59. hillprimer: title=The Equivariant Slice Filtration: A Primer, author=Hill, Michael A., journal=Homology, Homotopy and Applications, volume=14, number=2, pages=143--166, year=2012
60. chadwickmandell: AUTHOR = Chadwick, Steven Greg and Mandell, Michael A., TITLE = $E_n$ genera, JOURNAL = Geom. Topol., FJOURNAL = Geometry \& Topology, VOLUME = 19, YEAR = 2015, NUMBER = 6, PAGES = 3193--3232, ISSN = 1465-3060,1364-0380, MRCLASS = 55P43 (55N22), MRNUMBER = 3447102, MRREVIEWER = Geoffrey\ M. L. Powell, DOI = 10.2140/gt.2015.19.3193, URL = https://doi.org/10.2140/gt.2015.19.3193, doi:[10.2140/gt.2015.19.3193](https://doi.org/10.2140/gt.2015.19.3193)
61. greenleesfour: AUTHOR = Greenlees, J. P. C., TITLE = Four approaches to cohomology theories with Reality, BOOKTITLE = An alpine bouquet of algebraic topology, SERIES = Contemp. Math., VOLUME = 708, PAGES = 139--156, PUBLISHER = Amer. Math. Soc., [Providence], RI, YEAR = 2018, ISBN = 978-1-4704-2911-9, MRCLASS = 55P91 (18G60 19L47 55N91 55Q91), MRNUMBER = 3807754, MRREVIEWER = Jose\ Cantarero, DOI = 10.1090/conm/708/14261, URL = https://doi.org/10.1090/conm/708/14261, doi:[10.1090/conm/708/14261](https://doi.org/10.1090/conm/708/14261)
62. Greenlees_2017: AUTHOR = Greenlees, J. P. C. and Meier, Lennart, TITLE = Gorenstein duality for Real spectra, JOURNAL = Algebr. Geom. Topol., FJOURNAL = Algebraic \& Geometric Topology, VOLUME = 17, YEAR = 2017, NUMBER = 6, PAGES = 3547--3619, ISSN = 1472-2747,1472-2739, MRCLASS = 55P91 (55P43 55Q91), MRNUMBER = 3709655, MRREVIEWER = John\ A.\ Lind, DOI = 10.2140/agt.2017.17.3547, URL = https://doi.org/10.2140/agt.2017.17.3547, doi:[10.2140/agt.2017.17.3547](https://doi.org/10.2140/agt.2017.17.3547)
63. ullman13regularslice: AUTHOR = Ullman, John Richard, TITLE = On the Regular Slice Spectral Sequence, NOTE = Thesis (Ph.D.)--Massachusetts Institute of Technology, PUBLISHER = ProQuest LLC, Ann Arbor, MI, YEAR = 2013, PAGES = (no paging), MRCLASS = 99-05, MRNUMBER = 3211466, URL = http://gateway.proquest.com/openurl?url_ver=Z39.88-2004&rft_val_fmt=info:ofi/fmt:kev:mtx:dissertation&res_dat=xri:pqm&rft_dat=xri:pqdiss:0829532,
64. HHR16: AUTHOR = Hill, M. A. and Hopkins, M. J. and Ravenel, D. C., TITLE = On the nonexistence of elements of Kervaire invariant one, JOURNAL = Ann. of Math. (2), FJOURNAL = Annals of Mathematics. Second Series, VOLUME = 184, YEAR = 2016, NUMBER = 1, PAGES = 1--262, ISSN = 0003-486X,1939-8980, MRCLASS = 55P91 (55N22 55P42 55Q45 55T15 55U35 57R15), MRNUMBER = 3505179, MRREVIEWER = Paul\ G.\ Goerss, DOI = 10.4007/annals.2016.184.1.1, URL = https://doi.org/10.4007/annals.2016.184.1.1, doi:[10.4007/annals.2016.184.1.1](https://doi.org/10.4007/annals.2016.184.1.1)
65. dugger05slice: AUTHOR = Dugger, Daniel, TITLE = An Atiyah-Hirzebruch spectral sequence for $KR$-theory, JOURNAL = $K$-Theory, FJOURNAL = $K$-Theory. An Interdisciplinary Journal for the Development, Application, and Influence of $K$-Theory in the Mathematical Sciences, VOLUME = 35, YEAR = 2005, NUMBER = 3-4, PAGES = 213--256, ISSN = 0920-3036,1573-0514, MRCLASS = 19L64 (55S45 55T25), MRNUMBER = 2240234, MRREVIEWER = G\'erald\ Gaudens, DOI = 10.1007/s10977-005-1552-9, URL = https://doi.org/10.1007/s10977-005-1552-9, doi:[10.1007/s10977-005-1552-9](https://doi.org/10.1007/s10977-005-1552-9)
66. gabe2025realsyntomiccohomology: title=Real Syntomic Cohomology, author=Gabriel Angelini-Knoll and Hana Jia Kong and J. D. Quigley, year=2025, eprint=2505.24734, archivePrefix=arXiv, primaryClass=math.AT, NOTE = \hrefhttps://arxiv.org/abs/2505.24734arXiv:2505.24734, arXiv:[2505.24734](https://arxiv.org/abs/2505.24734)
67. hahn2024motivicfiltrationtopologicalcyclic: title=A motivic filtration on the topological cyclic homology of commutative ring spectra, author=Jeremy Hahn and Arpon Raksit and Dylan Wilson, year=2024, eprint=2206.11208, archivePrefix=arXiv, primaryClass=math.KT, NOTE = \hrefhttps://arxiv.org/abs/2206.11208arXiv:2206.11208, arXiv:[2206.11208](https://arxiv.org/abs/2206.11208)
68. hill2018realwilsonspaces: title=Real Wilson Spaces I, author=Hill, Michael A. and Hopkins, Michael J., year=2018, eprint=1806.11033, archivePrefix=arXiv, primaryClass=math.AT, NOTE = \hrefhttps://arxiv.org/abs/1806.11033arXiv:1806.11033, arXiv:[1806.11033](https://arxiv.org/abs/1806.11033)
69. hahnRealOrientationsLubin2020: title = Real Orientations of Lubin--Tate Spectra, author = Hahn, Jeremy and Shi, XiaoLin Danny, year = 2020, month = sep, journal = Inventiones mathematicae, volume = 221, number = 3, pages = 731--776, issn = 1432-1297, doi = 10.1007/s00222-020-00960-z, abstract = We show that Lubin--Tate spectra at the prime 2 are Real oriented and Real Landweber exact. The proof is by application of the Goerss--Hopkins--Miller theorem to algebras with involution. For each height n, we compute the entire homotopy fixed point spectral sequence for \$\$E\_n\$\$with its \$\$C\_2\$\$-action given by the formal inverse. We study, as the height varies, the Hurewicz images of the stable homotopy groups of spheres in the homotopy of these \$\$C\_2\$\$-fixed points. doi:[10.1007/s00222-020-00960-z](https://doi.org/10.1007/s00222-020-00960-z)
70. hillmeier2017: title=The $C_2$--spectrum $Tmf_1(3)$ and its invertible modules, author=Hill, Michael and Meier, Lennart, journal=Algebraic \& Geometric Topology, volume=17, number=4, pages=1953--2011, year=2017, publisher=Mathematical Sciences Publishers
71. Roytman2023: author = Roytman, Bar, title = Highly structured orientations from equivariant Thom spectra, school = University of California, Los Angeles, year = 2023, type = Ph.D. dissertation, note = ProQuest ID: Roytman\_ucla\_0031D\_22360; Merritt ID: ark:/13030/m55r5rh7, url = https://escholarship.org/uc/item/8jc7s298
72. cnossen2024normedequivariantringspectra: title=Normed equivariant ring spectra and higher Tambara functors, author=Bastiaan Cnossen and Rune Haugseng and Tobias Lenz and Sil Linskens, year=2024, eprint=2407.08399, archivePrefix=arXiv, primaryClass=math.AT, NOTE = \hrefhttps://arxiv.org/abs/2407.08399arXiv:2407.08399, arXiv:[2407.08399](https://arxiv.org/abs/2407.08399)
73. Santhanam_2011: AUTHOR = Santhanam, Rekha, TITLE = Units of equivariant ring spectra, JOURNAL = Algebr. Geom. Topol., FJOURNAL = Algebraic \& Geometric Topology, VOLUME = 11, YEAR = 2011, NUMBER = 3, PAGES = 1361--1403, ISSN = 1472-2747,1472-2739, MRCLASS = 55P47 (55P43 55P48 55P91), MRNUMBER = 2821427, MRREVIEWER = Birgit\ Richter, DOI = 10.2140/agt.2011.11.1361, URL = https://doi.org/10.2140/agt.2011.11.1361, doi:[10.2140/agt.2011.11.1361](https://doi.org/10.2140/agt.2011.11.1361)
74. Wilson1973: author = Wilson, W. Stephen, journal = Commentarii mathematici Helvetici, pages = 45-55, title = The $\Omega$--spectrum for Brown--Peterson Cohomology. Part I, url = http://eudml.org/doc/139536, volume = 48, year = 1973,
75. carrick2024homologicalslice: title = The homological slice spectral sequence in motivic and Real bordism, journal = Advances in Mathematics, volume = 458, pages = 109955, year = 2024, issn = 0001-8708, doi = https://doi.org/10.1016/j.aim.2024.109955, url = https://www.sciencedirect.com/science/article/pii/S0001870824004705, author = Christian Carrick and Michael A. Hill and Douglas C. Ravenel, keywords = Motivic homotopy, Equivariant homotopy, Slice spectral sequence, Topological modular forms doi:[https://doi.org/10.1016/j.aim.2024.109955](https://doi.org/https://doi.org/10.1016/j.aim.2024.109955) arXiv:[2024.10995](https://arxiv.org/abs/2024.10995)
76. kollyrasekh2021filterquotientmodel: title=Filter Quotient Model Categories, author=Kolly, Gabin and Rasekh, Nima, journal=To appear, year=2021,
77. rasekh2021nno: AUTHOR = Rasekh, Nima, TITLE = Every Elementary Higher Topos has a Natural Number Object, JOURNAL = Theory Appl. Categ., FJOURNAL = Theory and Applications of Categories, VOLUME = 37, YEAR = 2021, PAGES = Paper No. 13, pp 337-377,
78. hessrasekh2021shadow: title=Shadows are Bicategorical Traces, author=Hess, Kathryn and Rasekh, Nima, journal=arXiv preprint, year=2021, NOTE = \hrefhttps://arxiv.org/abs/2109.02144arXiv:2109.02144, arXiv:[2109.02144](https://arxiv.org/abs/2109.02144)
79. freyrasekh2021coprod: title=Constructing Coproducts in locally Cartesian closed $\infty$-Categories, author=Frey, Jonas and Rasekh, Nima, journal=arXiv preprint, year=2021, NOTE = \hrefhttps://arxiv.org/abs/2108.11304v2arXiv:2108.11304v2, to appear in Homology, Homotopy and Applications, arXiv:[2108.11304](https://arxiv.org/abs/2108.11304)
80. rasekh2021nleft: title=Yoneda lemma for $D$-simplicial spaces, author=Rasekh, Nima, journal=arXiv preprint, year=2021, NOTE = \hrefhttps://arxiv.org/abs/2108.06168arXiv:2108.06168, arXiv:[2108.06168](https://arxiv.org/abs/2108.06168)
81. rasekh2021cartfibcss: title=Cartesian Fibrations of Complete Segal Spaces, author=Rasekh, Nima, journal=arXiv preprint, year=2021, NOTE = \hrefhttps://arxiv.org/abs/2102.05190v2arXiv:2102.05190v2, arXiv:[2102.05190](https://arxiv.org/abs/2102.05190)
82. rasekh2021cartfibmarkedvscso: AUTHOR = Rasekh, Nima, TITLE = Quasi-Categories vs. Segal Spaces: Cartesian Edition, JOURNAL = J. Homotopy Relat. Struct., FJOURNAL = Journal of Homotopy and Related Structures, year=2021, ISSN = 1512-2891, MRCLASS = 18N60 18N40 18N45 18N55, DOI = 10.1007/s40062-021-00288-2, URL = https://doi.org/10.1007/s40062-021-00288-2, doi:[10.1007/s40062-021-00288-2](https://doi.org/10.1007/s40062-021-00288-2)
83. rasekh2021univalence: title=Univalence in Higher Category Theory, author=Rasekh, Nima, journal=arXiv preprint, year=2021, NOTE = \hrefhttps://arxiv.org/abs/2103.12762arXiv:2103.12762, arXiv:[2103.12762](https://arxiv.org/abs/2103.12762)
84. rasekhstonek2020taq: AUTHOR = Rasekh, Nima and Stonek, Bruno, TITLE = The cotangent complex and Thom spectra, JOURNAL = Abh. Math. Semin. Univ. Hambg., FJOURNAL = Abhandlungen aus dem Mathematischen Seminar der Universit\"at Hamburg, VOLUME = 90, YEAR = 2020, NUMBER = 2, PAGES = 229--252, ISSN = 0025-5858, MRCLASS = 55P43 (14F10), MRNUMBER = 4217953, DOI = 10.1007/s12188-020-00226-8, URL = https://doi.org/10.1007/s12188-020-00226-8, doi:[10.1007/s12188-020-00226-8](https://doi.org/10.1007/s12188-020-00226-8)
85. rsv2019thom: Title = Thom spectra, higher $THH$ and tensors in $\infty$-categories, Author = Rasekh, Nima and Stonek, Bruno and Valenzuela, Gabriel, Journal=arXiv preprint, Year = 2019, NOTE = \hrefhttps://arxiv.org/abs/1911.04345v3arXiv:1911.04345v3, to appear in Algebraic $\&$ Geometric Topology, arXiv:[1911.04345](https://arxiv.org/abs/1911.04345)
86. rasekh2018elementarytopos: title=A theory of elementary higher toposes, author=Rasekh, Nima, year=2018, NOTE = \hrefhttps://arxiv.org/abs/1805.03805v3arXiv:1805.03805v3, arXiv:[1805.03805](https://arxiv.org/abs/1805.03805)
87. rasekh2018model: title=A Model for the Higher Category of Higher Categories, author=Rasekh, Nima, journal=arXiv preprint, year=2018, NOTE = \hrefhttps://arxiv.org/abs/1805.03816v3arXiv:1805.03816v3, arXiv:[1805.03816](https://arxiv.org/abs/1805.03816)
88. rasekh2017left: title=Yoneda lemma for simplicial spaces, author=Rasekh, Nima, journal=arXiv preprint, year=2017, NOTE = \hrefhttps://arxiv.org/abs/1711.03160v3arXiv:1711.03160v3, arXiv:[1711.03160](https://arxiv.org/abs/1711.03160)
89. rasekh2017cartesian: title=Cartesian fibrations and representability, author=Rasekh, Nima, journal=arXiv preprint, year=2017, NOTE = \hrefhttps://arxiv.org/abs/1711.03670v3arXiv:1711.03670v3, to appear in Homology, Homotopy and Applications, arXiv:[1711.03670](https://arxiv.org/abs/1711.03670)
90. rasekh2018elementaryyoneda: title=Yoneda Lemma for Elementary Higher Toposes, author=Rasekh, Nima, journal=arXiv preprint, year=2018, NOTE = \hrefhttps://arxiv.org/abs/1809.01736arXiv:1809.01736, arXiv:[1809.01736](https://arxiv.org/abs/1809.01736)
91. rasekh2018truncations: title=An Elementary Approach to Truncations, author=Rasekh, Nima, journal=arXiv preprint, year=2018, NOTE = \hrefhttps://arxiv.org/abs/1812.10527v2arXiv:1812.10527v2, arXiv:[1812.10527](https://arxiv.org/abs/1812.10527)
92. rasekh2021filterquotient: title = Filter quotients and non-presentable ($\infty$,1)-toposes, journal = Journal of Pure and Applied Algebra, volume = 225, number = 12, pages = 106770, year = 2021, issn = 0022-4049, doi = https://doi.org/10.1016/j.jpaa.2021.106770, url = https://www.sciencedirect.com/science/article/pii/S0022404921001109, author = Nima Rasekh, keywords = Elementary topos theory, Higher category theory, Filter quotients, abstract = We define filter quotients of (∞,1)-categories and prove that filter quotients preserve the structure of an elementary (∞,1)-topos and in particular lift the filter quotient of the underlying elementary topos. We then specialize to the case of filter products of (∞,1)-categories and prove a characterization theorem for equivalences in a filter product. Then we use filter products to construct a large class of elementary (∞,1)-toposes that are not Grothendieck (∞,1)-toposes. Moreover, we give one detailed example for the interested reader who would like to see how we can construct such an (∞,1)-category, but would prefer to avoid the technicalities regarding filters. doi:[https://doi.org/10.1016/j.jpaa.2021.106770](https://doi.org/https://doi.org/10.1016/j.jpaa.2021.106770) arXiv:[2021.10677](https://arxiv.org/abs/2021.10677)
93. rasekh2018cso: title=Complete segal objects, author=Rasekh, Nima, journal=arXiv preprint, year=2018, NOTE = \hrefhttps://arxiv.org/abs/1805.03561arXiv:1805.03561, arXiv:[1805.03561](https://arxiv.org/abs/1805.03561)
94. rasekh2018css: title=Introduction to Complete Segal Spaces, author=Rasekh, Nima, journal=arXiv preprint, year=2018, NOTE = \hrefhttps://arxiv.org/abs/1805.03131arXiv:1805.03131, arXiv:[1805.03131](https://arxiv.org/abs/1805.03131)
95. rasekh2020highercat: title=Lecture Notes on Higher Categories, author=Rasekh, Nima, year=2020, NOTE = \hrefhttps://www.epfl.ch/labs/hessbellwald-lab/wp-content/uploads/2020/03/Higher-Categories-EPFL.pdfLecture Notes,
96. bergnerrezk2013comparisoni: AUTHOR = Bergner, Julia E. and Rezk, Charles, TITLE = Comparison of models for $(\infty,n)$-categories, I, JOURNAL = Geom. Topol., FJOURNAL = Geometry \& Topology, VOLUME = 17, YEAR = 2013, NUMBER = 4, PAGES = 2163--2202, ISSN = 1465-3060, MRCLASS = 18D05 (18G55), MRNUMBER = 3109865, MRREVIEWER = Javier J. Guti\'errez, DOI = 10.2140/gt.2013.17.2163, URL = https://doi.org/10.2140/gt.2013.17.2163, doi:[10.2140/gt.2013.17.2163](https://doi.org/10.2140/gt.2013.17.2163)
97. rezk2010thetanspaces: AUTHOR = Rezk, Charles, TITLE = A Cartesian presentation of weak $n$-categories, JOURNAL = Geom. Topol., FJOURNAL = Geometry \& Topology, VOLUME = 14, YEAR = 2010, NUMBER = 1, PAGES = 521--571, ISSN = 1465-3060, MRCLASS = 18D05 (55U40), MRNUMBER = 2578310, DOI = 10.2140/gt.2010.14.521, URL = https://doi.org/10.2140/gt.2010.14.521, NOTE = \hrefhttps://rezk.web.illinois.edu/homotopy-topos-sketch.pdfUnpublished notes doi:[10.2140/gt.2010.14.521](https://doi.org/10.2140/gt.2010.14.521)
98. rezk2001css: AUTHOR = Rezk, Charles, TITLE = A model for the homotopy theory of homotopy theory, JOURNAL = Trans. Amer. Math. Soc., FJOURNAL = Transactions of the American Mathematical Society, VOLUME = 353, YEAR = 2001, NUMBER = 3, PAGES = 973--1007, ISSN = 0002-9947, MRCLASS = 55U35 (18G30), MRNUMBER = 1804411, MRREVIEWER = Brooke E. Shipley, DOI = 10.1090/S0002-9947-00-02653-2, URL = https://doi.org/10.1090/S0002-9947-00-02653-2, doi:[10.1090/S0002-9947-00-02653-2](https://doi.org/10.1090/S0002-9947-00-02653-2)
99. rezk2017qcats: title=Stuff about quasicategories, author=Rezk, Charles, NOTE = \hrefhttp://www.math.illinois.edu/rezk/595-fal16/quasicats.pdfUnpublished notes, year=2017
100. rezk2014globalhomotopytheorycohesion: title=Global Homotopy Theory and Cohesion, author=Rezk, Charles, NOTE = \hrefhttps://faculty.math.illinois.edu/ rezk/global-cohesion.pdfUnpublished notes, year=2014
101. bergnerrezk2020comparisonii: AUTHOR = Bergner, Julia E. and Rezk, Charles, TITLE = Comparison of models for $(\infty, n)$-categories, II, JOURNAL = J. Topol., FJOURNAL = Journal of Topology, VOLUME = 13, YEAR = 2020, NUMBER = 4, PAGES = 1554--1581, ISSN = 1753-8416, MRCLASS = 18N65 (18N40 55U35 55U40), MRNUMBER = 4186138, DOI = 10.1112/topo.12167, URL = https://doi.org/10.1112/topo.12167, doi:[10.1112/topo.12167](https://doi.org/10.1112/topo.12167)
102. rezk2010toposes: title=Toposes and homotopy toposes (version 0.15), author=Rezk, Charles, journal=Unpublished notes, https://faculty.math.illinois.edu/ rezk/homotopy-topos-sketch.pdf, year=2010
103. bergner2007bergnermodelcat: AUTHOR = Bergner, Julia E., TITLE = A model category structure on the category of simplicial categories, JOURNAL = Trans. Amer. Math. Soc., FJOURNAL = Transactions of the American Mathematical Society, VOLUME = 359, YEAR = 2007, NUMBER = 5, PAGES = 2043--2058, ISSN = 0002-9947, MRCLASS = 18G55 (18D20), MRNUMBER = 2276611, MRREVIEWER = Philippe Gaucher, DOI = 10.1090/S0002-9947-06-03987-0, URL = https://doi.org/10.1090/S0002-9947-06-03987-0, doi:[10.1090/S0002-9947-06-03987-0](https://doi.org/10.1090/S0002-9947-06-03987-0)
104. bergner2007threemodels: AUTHOR = Bergner, Julia E., TITLE = Three models for the homotopy theory of homotopy theories, JOURNAL = Topology, FJOURNAL = Topology. An International Journal of Mathematics, VOLUME = 46, YEAR = 2007, NUMBER = 4, PAGES = 397--436, ISSN = 0040-9383, MRCLASS = 55U35 (18E35 18G30), MRNUMBER = 2321038, MRREVIEWER = Henning Krause, DOI = 10.1016/j.top.2007.03.002, URL = https://doi.org/10.1016/j.top.2007.03.002, doi:[10.1016/j.top.2007.03.002](https://doi.org/10.1016/j.top.2007.03.002)
105. bergner2010survey: AUTHOR = Bergner, Julia E., TITLE = A survey of $(\infty,1)$-categories, BOOKTITLE = Towards higher categories, SERIES = IMA Vol. Math. Appl., VOLUME = 152, PAGES = 69--83, PUBLISHER = Springer, New York, YEAR = 2010, MRCLASS = 18-02 (18D05 55-02 55U35 55U40), MRNUMBER = 2664620, DOI = 10.1007/978-1-4419-1524-5_2, URL = https://doi.org/10.1007/978-1-4419-1524-5_2, doi:[10.1007/978-1-4419-1524-5_2](https://doi.org/10.1007/978-1-4419-1524-5_2)
106. bergner2018book: AUTHOR = Bergner, Julia E., TITLE = The homotopy theory of $(\infty, 1)$-categories, SERIES = London Mathematical Society Student Texts, VOLUME = 90, PUBLISHER = Cambridge University Press, Cambridge, YEAR = 2018, PAGES = xiv+273, ISBN = 978-1-107-49902-7; 978-1-107-10136-4, MRCLASS = 18-02 (18D99 18G30 18G55 55U35 55U40), MRNUMBER = 3791455, MRREVIEWER = David A. Blanc,
107. bergner2020surveyn: title=A survey of models for $(\infty, n)$-categories, author=Bergner, Julia E, journal=Handbook of Homotopy Theory, edited by Haynes Miller, Chapman \& Hall/CRC, pages=263--295, year=2020
108. bergner2011modelsinftyn: AUTHOR = Bergner, Julia E., TITLE = Models for $(\infty,n)$-categories and the cobordism hypothesis, BOOKTITLE = Mathematical foundations of quantum field theory and perturbative string theory, SERIES = Proc. Sympos. Pure Math., VOLUME = 83, PAGES = 17--30, PUBLISHER = Amer. Math. Soc., Providence, RI, YEAR = 2011, MRCLASS = 55U35 (18D20 18G30 18G55 57R56), MRNUMBER = 2742424, MRREVIEWER = David A. Blanc, DOI = 10.1090/pspum/083/2742424, URL = https://doi.org/10.1090/pspum/083/2742424, doi:[10.1090/pspum/083/2742424](https://doi.org/10.1090/pspum/083/2742424)
109. cesnavicius2021purity: TITLE = Purity for flat cohomology, AUTHOR = \v Cesnavi\v cius, Kęstutis and Scholze, Peter, year=2020, NOTE = \hrefhttps://arxiv.org/pdf/1912.10932.pdfarXiv:1912.10932, arXiv:[1912.10932](https://arxiv.org/abs/1912.10932)
110. gepnerhaugseng2015enrichedinftycat: AUTHOR = Gepner, David and Haugseng, Rune, TITLE = Enriched $\infty$-categories via non-symmetric $\infty$-operads, JOURNAL = Adv. Math., FJOURNAL = Advances in Mathematics, VOLUME = 279, YEAR = 2015, PAGES = 575--716, ISSN = 0001-8708, MRCLASS = 18D20 (18D10 18D50), MRNUMBER = 3345192, MRREVIEWER = Christopher L. Rogers, DOI = 10.1016/j.aim.2015.02.007, URL = https://doi.org/10.1016/j.aim.2015.02.007, doi:[10.1016/j.aim.2015.02.007](https://doi.org/10.1016/j.aim.2015.02.007)
111. gepnergrothnikolaus2015infiniteloopspacemachine: AUTHOR = Gepner, David and Groth, Moritz and Nikolaus, Thomas, TITLE = Universality of multiplicative infinite loop space machines, JOURNAL = Algebr. Geom. Topol., FJOURNAL = Algebraic \& Geometric Topology, VOLUME = 15, YEAR = 2015, NUMBER = 6, PAGES = 3107--3153, ISSN = 1472-2747, MRCLASS = 55P48 (19D23 55P43), MRNUMBER = 3450758, MRREVIEWER = John A. Lind, DOI = 10.2140/agt.2015.15.3107, URL = https://doi.org/10.2140/agt.2015.15.3107, doi:[10.2140/agt.2015.15.3107](https://doi.org/10.2140/agt.2015.15.3107)
112. gepnerkock2017univalence: AUTHOR = Gepner, David and Kock, Joachim, TITLE = Univalence in locally cartesian closed $\infty$-categories, JOURNAL = Forum Math., FJOURNAL = Forum Mathematicum, VOLUME = 29, YEAR = 2017, NUMBER = 3, PAGES = 617--652, ISSN = 0933-7741, MRCLASS = 55U35 (18B25 18C50), MRNUMBER = 3641669, MRREVIEWER = Andrzej Wi\'snicki, DOI = 10.1515/forum-2015-0228, URL = https://doi.org/10.1515/forum-2015-0228, doi:[10.1515/forum-2015-0228](https://doi.org/10.1515/forum-2015-0228)
113. gepnerhaugsengnikolaus2017laxcolimits: AUTHOR = Gepner, David and Haugseng, Rune and Nikolaus, Thomas, TITLE = Lax colimits and free fibrations in $\infty$-categories, JOURNAL = Doc. Math., FJOURNAL = Documenta Mathematica, VOLUME = 22, YEAR = 2017, PAGES = 1225--1266, ISSN = 1431-0635, MRCLASS = 18D30 (18A30), MRNUMBER = 3690268, MRREVIEWER = Josep Elgueta,
114. chuhaugseng2020enrichedoperads: AUTHOR = Chu, Hongyi and Haugseng, Rune, TITLE = Enriched $\infty$-operads, JOURNAL = Adv. Math., FJOURNAL = Advances in Mathematics, VOLUME = 361, YEAR = 2020, PAGES = 106913, 85, ISSN = 0001-8708, MRCLASS = 18D50 (18D20 18F20), MRNUMBER = 4038556, DOI = 10.1016/j.aim.2019.106913, URL = https://doi.org/10.1016/j.aim.2019.106913, doi:[10.1016/j.aim.2019.106913](https://doi.org/10.1016/j.aim.2019.106913) arXiv:[2019.10691](https://arxiv.org/abs/2019.10691)
115. haugseng2018equivthetanSegalspace: AUTHOR = Haugseng, Rune, TITLE = On the equivalence between $\Theta_n$-spaces and iterated Segal spaces, JOURNAL = Proc. Amer. Math. Soc., FJOURNAL = Proceedings of the American Mathematical Society, VOLUME = 146, YEAR = 2018, NUMBER = 4, PAGES = 1401--1415, ISSN = 0002-9939, MRCLASS = 18D05 (55U40), MRNUMBER = 3754328, MRREVIEWER = Charles Rezk, DOI = 10.1090/proc/13695, URL = https://doi.org/10.1090/proc/13695, doi:[10.1090/proc/13695](https://doi.org/10.1090/proc/13695)
116. haugseng2017highermorita: AUTHOR = Haugseng, Rune, TITLE = The higher Morita category of $\BbbE_n$-algebras, JOURNAL = Geom. Topol., FJOURNAL = Geometry \& Topology, VOLUME = 21, YEAR = 2017, NUMBER = 3, PAGES = 1631--1730, ISSN = 1465-3060, MRCLASS = 18D50 (16D20 18D10 55U35), MRNUMBER = 3650080, MRREVIEWER = Julia Bergner, DOI = 10.2140/gt.2017.21.1631, URL = https://doi.org/10.2140/gt.2017.21.1631, doi:[10.2140/gt.2017.21.1631](https://doi.org/10.2140/gt.2017.21.1631)
117. haugseng2015rectenrichedinftycat: AUTHOR = Haugseng, Rune, TITLE = Rectification of enriched $\infty$-categories, JOURNAL = Algebr. Geom. Topol., FJOURNAL = Algebraic \& Geometric Topology, VOLUME = 15, YEAR = 2015, NUMBER = 4, PAGES = 1931--1982, ISSN = 1472-2747, MRCLASS = 18G55 (18D10 18D20 55P48 55U35), MRNUMBER = 3402334, MRREVIEWER = Philippe Gaucher, DOI = 10.2140/agt.2015.15.1931, URL = https://doi.org/10.2140/agt.2015.15.1931, doi:[10.2140/agt.2015.15.1931](https://doi.org/10.2140/agt.2015.15.1931)
118. lurie2009htt: AUTHOR = Lurie, Jacob, TITLE = Higher topos theory, SERIES = Annals of Mathematics Studies, VOLUME = 170, PUBLISHER = Princeton University Press, Princeton, NJ, YEAR = 2009, PAGES = xviii+925, ISBN = 978-0-691-14049-0; 0-691-14049-9, MRCLASS = 18-02 (18B25 18E35 18G30 18G55 55U40), MRNUMBER = 2522659, MRREVIEWER = Mark Hovey, DOI = 10.1515/9781400830558, URL = https://doi.org/10.1515/9781400830558, doi:[10.1515/9781400830558](https://doi.org/10.1515/9781400830558)
119. lurie2009goodwillie: title=(Infinity, 2)-Categories and the Goodwillie Calculus I, author=Lurie, Jacob, journal=arXiv preprint, year=2009, NOTE = \hrefhttps://arxiv.org/abs/0905.0462v2arXiv:0905.0462v2, arXiv:[0905.0462](https://arxiv.org/abs/0905.0462)
120. lurie2017htt: AUTHOR = Lurie, Jacob, TITLE = Higher topos theory, SERIES = Annals of Mathematics Studies, VOLUME = 170, PUBLISHER = Princeton University Press, Princeton, NJ, YEAR = 2017,
121. lurie2017ha: title=Higher algebra, author=Lurie, Jacob, month=September, year=2017, NOTE = \hrefhttp://www.math.ias.edu/ lurie/papers/HA.pdfUnpublished notes
122. lurie2012ha: title=Higher algebra, author=Lurie, Jacob, month=August, year=2012, NOTE = \hrefhttps://www.math.ias.edu/ lurie/papers/HA2012.pdfUnpublished notes
123. lurie2018sag: title=Spectral Algebraic Geometry, author=Lurie, Jacob, month=February, year=2018, NOTE = \hrefhttps://www.math.ias.edu/ lurie/papers/SAG-rootfile.pdfUnpublished notes
124. lurie2009cobordism: AUTHOR = Lurie, Jacob, TITLE = On the classification of topological field theories, BOOKTITLE = Current developments in mathematics, 2008, PAGES = 129--280, PUBLISHER = Int. Press, Somerville, MA, YEAR = 2009, MRCLASS = 57R56 (18D10 18G30 57R15 57R75), MRNUMBER = 2555928, MRREVIEWER = Julia Bergner,
125. riehl2014categoricalhomotopytheory: AUTHOR = Riehl, Emily, TITLE = Categorical homotopy theory, SERIES = New Mathematical Monographs, VOLUME = 24, PUBLISHER = Cambridge University Press, Cambridge, YEAR = 2014, PAGES = xviii+352, ISBN = 978-1-107-04845-4, MRCLASS = 18Gxx, MRNUMBER = 3221774, DOI = 10.1017/CBO9781107261457, URL = http://dx.doi.org/10.1017/CBO9781107261457, doi:[10.1017/CBO9781107261457](https://doi.org/10.1017/CBO9781107261457)
126. riehl2017context: title=Category theory in context, author=Riehl, Emily, year=2017, publisher=Courier Dover Publications
127. riehlshulman2017rezktypes: AUTHOR = Riehl, Emily and Shulman, Michael, TITLE = A type theory for synthetic $\infty$-categories, JOURNAL = High. Struct., FJOURNAL = Higher Structures, VOLUME = 1, YEAR = 2017, NUMBER = 1, PAGES = 147--224, MRCLASS = 18D05 (03G30 18G35 18G55), MRNUMBER = 3912054, MRREVIEWER = Thomas Streicher, DOI = 10.1007/s42001-017-0005-6, URL = https://doi.org/10.1007/s42001-017-0005-6, doi:[10.1007/s42001-017-0005-6](https://doi.org/10.1007/s42001-017-0005-6)
128. riehlverity2017inftycosmos: AUTHOR = Riehl, Emily and Verity, Dominic, TITLE = Fibrations and Yoneda's lemma in an $\infty$-cosmos, JOURNAL = J. Pure Appl. Algebra, FJOURNAL = Journal of Pure and Applied Algebra, VOLUME = 221, YEAR = 2017, NUMBER = 3, PAGES = 499--564, ISSN = 0022-4049, MRCLASS = 18D99 (55U35), MRNUMBER = 3556697, MRREVIEWER = Luciano Stramaccia, DOI = 10.1016/j.jpaa.2016.07.003, URL = https://doi.org/10.1016/j.jpaa.2016.07.003, doi:[10.1016/j.jpaa.2016.07.003](https://doi.org/10.1016/j.jpaa.2016.07.003)
129. riehlverity2018elements: title=Elements of $\infty$-category theory, author=Riehl, Emily and Verity, Dominic, howpublished = http://www.math.jhu.edu/ eriehl/elements.pdf, YEAR=2021, urldate = 01.02.2021, NOTE= Version of February 01, 2021,
130. riehlverity2022elements: author=Riehl, Emily and Verity, Dominic, title=Elements of $\infty$-Category Theory, publisher=Cambridge University Press, series=Cambridge Studies in Advanced Mathematics, collection=Cambridge Studies in Advanced Mathematics, year=2022, place=Cambridge, DOI=10.1017/9781108936880 doi:[10.1017/9781108936880](https://doi.org/10.1017/9781108936880)
131. riehl2011simpcatofqcat: AUTHOR = Riehl, Emily, TITLE = On the structure of simplicial categories associated to quasi-categories, JOURNAL = Math. Proc. Cambridge Philos. Soc., FJOURNAL = Mathematical Proceedings of the Cambridge Philosophical Society, VOLUME = 150, YEAR = 2011, NUMBER = 3, PAGES = 489--504, ISSN = 0305-0041, MRCLASS = 18G30 (55U10 55U40), MRNUMBER = 2784771, MRREVIEWER = Mark W. Johnson, DOI = 10.1017/S0305004111000053, URL = https://doi.org/10.1017/S0305004111000053, doi:[10.1017/S0305004111000053](https://doi.org/10.1017/S0305004111000053)
132. hovey1999modelcategories: AUTHOR = Hovey, Mark, TITLE = Model categories, SERIES = Mathematical Surveys and Monographs, VOLUME = 63, PUBLISHER = American Mathematical Society, Providence, RI, YEAR = 1999, PAGES = xii+209, ISBN = 0-8218-1359-5, MRCLASS = 55U35 (18D15 18G30 18G55), MRNUMBER = 1650134, MRREVIEWER = Teimuraz Pirashvili,
133. hirschhorn2003modelcategories: AUTHOR = Hirschhorn, Philip S., TITLE = Model categories and their localizations, SERIES = Mathematical Surveys and Monographs, VOLUME = 99, PUBLISHER = American Mathematical Society, Providence, RI, YEAR = 2003, PAGES = xvi+457, ISBN = 0-8218-3279-4, MRCLASS = 18G55 (55P60 55U35), MRNUMBER = 1944041, MRREVIEWER = David A. Blanc,
134. quillen1967modelcats: AUTHOR = Quillen, Daniel G., TITLE = Homotopical algebra, SERIES = Lecture Notes in Mathematics, No. 43, PUBLISHER = Springer-Verlag, Berlin-New York, YEAR = 1967, PAGES = iv+156 pp. (not consecutively paged), MRCLASS = 18.20 (55.00), MRNUMBER = 0223432, MRREVIEWER = A. K. Bousfield,
135. quillen1972higherktheories: AUTHOR = Quillen, Daniel, TITLE = Higher algebraic $K$-theory. I, BOOKTITLE = Algebraic $K$-theory, I: Higher $K$-theories (Proc. Conf., Battelle Memorial Inst., Seattle, Wash., 1972), PAGES = 85--147. Lecture Notes in Math., Vol. 341, YEAR = 1973, MRCLASS = 18F25, MRNUMBER = 0338129, MRREVIEWER = Stephen M. Gersten,
136. goerssjardine1999simplicialhomotopytheory: AUTHOR = Goerss, Paul G. and Jardine, John F., TITLE = Simplicial homotopy theory, SERIES = Progress in Mathematics, VOLUME = 174, PUBLISHER = Birkh\"auser Verlag, Basel, YEAR = 1999, PAGES = xvi+510, ISBN = 3-7643-6064-X, MRCLASS = 55U10 (18G55 55-01 55Pxx), MRNUMBER = 1711612 (2001d:55012), MRREVIEWER = R. M. Vogt, DOI = 10.1007/978-3-0348-8707-6, URL = http://dx.doi.org/10.1007/978-3-0348-8707-6, doi:[10.1007/978-3-0348-8707-6](https://doi.org/10.1007/978-3-0348-8707-6)
137. cisinski2006cisinskimodelstructure: AUTHOR = Cisinski, Denis-Charles, TITLE = Les pr\'efaisceaux comme mod\`eles des types d'homotopie, JOURNAL = Ast\'erisque, FJOURNAL = Ast\'erisque, NUMBER = 308, YEAR = 2006, PAGES = xxiv+390, ISSN = 0303-1179, ISBN = 978-2-85629-225-9, MRCLASS = 55-02 (18F20 18G50 55P60 55U35), MRNUMBER = 2294028, MRREVIEWER = Philippe Gaucher,
138. cisinski2019highercategories: AUTHOR = Cisinski, Denis-Charles, TITLE = Higher categories and homotopical algebra, SERIES = Cambridge Studies in Advanced Mathematics, VOLUME = 180, PUBLISHER = Cambridge University Press, Cambridge, YEAR = 2019, PAGES = xviii+430, ISBN = 978-1-108-47320-0, MRCLASS = 18D05 (18F20 18G55 55U35), MRNUMBER = 3931682, DOI = 10.1017/9781108588737, URL = https://doi.org/10.1017/9781108588737, doi:[10.1017/9781108588737](https://doi.org/10.1017/9781108588737)
139. barwickschommerpries2011unicity: title=On the unicity of the homotopy theory of higher categories, author=Barwick, Clark and Schommer-Pries, Christopher, journal=arXiv preprint arXiv:1112.0040, year=2011 arXiv:[1112.0040](https://arxiv.org/abs/1112.0040)
140. barwickkan2012relativecategory: AUTHOR = Barwick, C. and Kan, D. M., TITLE = Relative categories: another model for the homotopy theory of homotopy theories, JOURNAL = Indag. Math. (N.S.), FJOURNAL = Koninklijke Nederlandse Akademie van Wetenschappen. Indagationes Mathematicae. New Series, VOLUME = 23, YEAR = 2012, NUMBER = 1-2, PAGES = 42--68, ISSN = 0019-3577, MRCLASS = 55U40 (18G55), MRNUMBER = 2877401, MRREVIEWER = Geoffrey M. L. Powell, DOI = 10.1016/j.indag.2011.10.002, URL = https://doi.org/10.1016/j.indag.2011.10.002, doi:[10.1016/j.indag.2011.10.002](https://doi.org/10.1016/j.indag.2011.10.002)
141. barwick2005nfoldsegalspaces: AUTHOR = Barwick, Clark, TITLE = (infinity, n)-Cat as a closed model category, NOTE = Thesis (Ph.D.)--University of Pennsylvania, PUBLISHER = ProQuest LLC, Ann Arbor, MI, YEAR = 2005, PAGES = 48, ISBN = 978-0542-00534-3, MRCLASS = Thesis, MRNUMBER = 2706984, URL = http://gateway.proquest.com/openurl?url_ver=Z39.88-2004&rft_val_fmt=info:ofi/fmt:kev:mtx:dissertation&res_dat=xri:pqdiss&rft_dat=xri:pqdiss:3165639,
142. barwickglasmannardin2018dualizingfibrations: AUTHOR = Barwick, Clark and Glasman, Saul and Nardin, Denis, TITLE = Dualizing cartesian and cocartesian fibrations, JOURNAL = Theory Appl. Categ., FJOURNAL = Theory and Applications of Categories, VOLUME = 33, YEAR = 2018, PAGES = Paper No. 4, 67--94, MRCLASS = 18D15, MRNUMBER = 3746613, MRREVIEWER = Josep Elgueta,
143. rijkeshulmanspitters2020modalities: AUTHOR = Rijke, Egbert and Shulman, Michael and Spitters, Bas, TITLE = Modalities in homotopy type theory, JOURNAL = Log. Methods Comput. Sci., FJOURNAL = Logical Methods in Computer Science, VOLUME = 16, YEAR = 2020, NUMBER = 1, PAGES = Paper No. 2, 79, MRCLASS = 03G30 (03B38 03B45 18N45 55U35), MRNUMBER = 4054355,
144. rijke2017join: title=The join construction, author=Rijke, Egbert, journal=arXiv preprint arXiv:1701.07538, year=2017 arXiv:[1701.07538](https://arxiv.org/abs/1701.07538)
145. shulman2019inftytoposunivalent: title=All ($\infty$, 1)-toposes have strict univalent universes, author=Shulman, Michael, journal=arXiv preprint, year=2019, NOTE = \hrefhttps://arxiv.org/abs/1904.07004arXiv:1904.07004, arXiv:[1904.07004](https://arxiv.org/abs/1904.07004)
146. shulman2015elegantunivalence: AUTHOR = Shulman, Michael, TITLE = The univalence axiom for elegant Reedy presheaves, JOURNAL = Homology Homotopy Appl., FJOURNAL = Homology, Homotopy and Applications, VOLUME = 17, YEAR = 2015, NUMBER = 2, PAGES = 81--106, ISSN = 1532-0073, MRCLASS = 03G30 (18G55 55U35), MRNUMBER = 3421464, MRREVIEWER = Krzysztof R. Kapulkin, DOI = 10.4310/HHA.2015.v17.n2.a6, URL = https://doi.org/10.4310/HHA.2015.v17.n2.a6, doi:[10.4310/HHA.2015.v17.n2.a6](https://doi.org/10.4310/HHA.2015.v17.n2.a6)
147. shulman2018brouwer: AUTHOR = Shulman, Michael, TITLE = Brouwer's fixed-point theorem in real-cohesive homotopy type theory, JOURNAL = Math. Structures Comput. Sci., FJOURNAL = Mathematical Structures in Computer Science. A Journal in the Applications of Categorical, Algebraic and Geometric Methods in Computer Science, VOLUME = 28, YEAR = 2018, NUMBER = 6, PAGES = 856--941, ISSN = 0960-1295, MRCLASS = 18G55 (03B40 55M20), MRNUMBER = 3798599, MRREVIEWER = Krzysztof R. Kapulkin, DOI = 10.1017/S0960129517000147, URL = https://doi.org/10.1017/S0960129517000147, doi:[10.1017/S0960129517000147](https://doi.org/10.1017/S0960129517000147)
148. kapulkinlumsdaine2021kanunivalent: AUTHOR = Kapulkin, Krzysztof and Lumsdaine, Peter LeFanu, TITLE = The simplicial model of univalent foundations (after Voevodsky), JOURNAL = J. Eur. Math. Soc. (JEMS), FJOURNAL = Journal of the European Mathematical Society (JEMS), VOLUME = 23, YEAR = 2021, NUMBER = 6, PAGES = 2071--2126, ISSN = 1435-9855, MRCLASS = 03B38 (18N45 55U35), MRNUMBER = 4244523, DOI = 10.4171/JEMS/1050, URL = https://doi.org/10.4171/JEMS/1050, doi:[10.4171/JEMS/1050](https://doi.org/10.4171/JEMS/1050)
149. kapulkin2017lccc: AUTHOR = Kapulkin, Krzysztof, TITLE = Locally cartesian closed quasi-categories from type theory, JOURNAL = J. Topol., FJOURNAL = Journal of Topology, VOLUME = 10, YEAR = 2017, NUMBER = 4, PAGES = 1029--1049, ISSN = 1753-8416, MRCLASS = 18G55 (03B15 03B70 55U35), MRNUMBER = 3743067, MRREVIEWER = Thomas Streicher, DOI = 10.1112/topo.12031, URL = https://doi.org/10.1112/topo.12031, doi:[10.1112/topo.12031](https://doi.org/10.1112/topo.12031)
150. kapulkinszumilo2019completequasicat: AUTHOR = Kapulkin, Krzysztof and Szumi\lo, Karol, TITLE = Internal languages of finitely complete $(\infty,1)$-categories, JOURNAL = Selecta Math. (N.S.), FJOURNAL = Selecta Mathematica. New Series, VOLUME = 25, YEAR = 2019, NUMBER = 2, PAGES = Paper No. 33, 46, ISSN = 1022-1824, MRCLASS = 18G55 (03B15 55U35), MRNUMBER = 3943478, MRREVIEWER = Andrzej Wi\'snicki, DOI = 10.1007/s00029-019-0480-0, URL = https://doi.org/10.1007/s00029-019-0480-0, doi:[10.1007/s00029-019-0480-0](https://doi.org/10.1007/s00029-019-0480-0)
151. hottbook2013: AUTHOR = The Univalent Foundations Program, TITLE = Homotopy type theory---univalent foundations of mathematics, PUBLISHER = The Univalent Foundations Program, Princeton, NJ; Institute for Advanced Study (IAS), Princeton, NJ, YEAR = 2013, PAGES = xiv+589, MRCLASS = 03-02 (03B15 55U35), MRNUMBER = 3204653, MRREVIEWER = Julio Rubio,
152. abfj2018goodwillie: AUTHOR = Anel, M. and Biedermann, G. and Finster, E. and Joyal, A., TITLE = Goodwillie's calculus of functors and higher topos theory, JOURNAL = J. Topol., FJOURNAL = Journal of Topology, VOLUME = 11, YEAR = 2018, NUMBER = 4, PAGES = 1100--1132, ISSN = 1753-8416, MRCLASS = 18B25 (18F05 55P65), MRNUMBER = 3989439, DOI = 10.1112/topo.12082, URL = https://doi.org/10.1112/topo.12082, doi:[10.1112/topo.12082](https://doi.org/10.1112/topo.12082)
153. joyaltierney2007qcatvssegal: AUTHOR = Joyal, Andr\'e and Tierney, Myles, TITLE = Quasi-categories vs Segal spaces, BOOKTITLE = Categories in algebra, geometry and mathematical physics, SERIES = Contemp. Math., VOLUME = 431, PAGES = 277--326, PUBLISHER = Amer. Math. Soc., Providence, RI, YEAR = 2007, MRCLASS = 55U35 (18G55), MRNUMBER = 2342834, MRREVIEWER = Nicola Gambino, DOI = 10.1090/conm/431/08278, URL = https://doi.org/10.1090/conm/431/08278, doi:[10.1090/conm/431/08278](https://doi.org/10.1090/conm/431/08278)
154. joyal2008notes: title=Notes on quasi-categories, author=Joyal, Andr\'e, journal=preprint, year=2008, NOTE = \hrefhttps://www.math.uchicago.edu/ may/IMA/Joyal.pdfUnpublished notes,
155. joyal2008theory: title=The theory of quasi-categories and its applications, author=Joyal, Andr\'e, year=2008, publisher=Citeseer, NOTE = \hrefhttps://mat.uab.cat/ kock/crm/hocat/advanced-course/Quadern45-2.pdfUnpublished notes,
156. abfj2020blakersmassey: AUTHOR = Anel, Mathieu and Biedermann, Georg and Finster, Eric and Joyal, Andr\'e, TITLE = A generalized Blakers-Massey theorem, JOURNAL = J. Topol., FJOURNAL = Journal of Topology, VOLUME = 13, YEAR = 2020, NUMBER = 4, PAGES = 1521--1553, ISSN = 1753-8416, MRCLASS = 18N20 (18B25 18N45 55U35), MRNUMBER = 4186137, DOI = 10.1112/topo.12163, URL = https://doi.org/10.1112/topo.12163, doi:[10.1112/topo.12163](https://doi.org/10.1112/topo.12163)
157. maclanemoerdijk1994topos: AUTHOR = Mac Lane, Saunders and Moerdijk, Ieke, TITLE = Sheaves in geometry and logic, SERIES = Universitext, NOTE = A first introduction to topos theory, Corrected reprint of the 1992 edition, PUBLISHER = Springer-Verlag, New York, YEAR = 1994, PAGES = xii+629, ISBN = 0-387-97710-4, MRCLASS = 03G30 (18B25 54B40), MRNUMBER = 1300636, MRREVIEWER = M. Makkai,
158. maclane1998categories: AUTHOR = Mac Lane, Saunders, TITLE = Categories for the working mathematician, SERIES = Graduate Texts in Mathematics, VOLUME = 5, EDITION = Second, PUBLISHER = Springer-Verlag, New York, YEAR = 1998, PAGES = xii+314, ISBN = 0-387-98403-8, MRCLASS = 18-02, MRNUMBER = 1712872,
159. johnstone2002elephantsii: AUTHOR = Johnstone, Peter T., TITLE = Sketches of an elephant: a topos theory compendium. Vol. 2, SERIES = Oxford Logic Guides, VOLUME = 44, PUBLISHER = The Clarendon Press, Oxford University Press, Oxford, YEAR = 2002, PAGES = i--xxii, 469--1089 and I1--I71, ISBN = 0-19-851598-7, MRCLASS = 18B25 (03B15 03G30 18-02 54A05), MRNUMBER = 2063092, MRREVIEWER = Colin McLarty,
160. johnstone2002elephanti: AUTHOR = Johnstone, Peter T., TITLE = Sketches of an elephant: a topos theory compendium. Vol. 1, SERIES = Oxford Logic Guides, VOLUME = 43, PUBLISHER = The Clarendon Press, Oxford University Press, New York, YEAR = 2002, PAGES = xxii+468+71, ISBN = 0-19-853425-6, MRCLASS = 18B25 (18-02), MRNUMBER = 1953060, MRREVIEWER = Colin McLarty,
161. johnstone2002elephants: AUTHOR = Johnstone, Peter T., TITLE = Sketches of an elephant: a topos theory compendium. Vol. 1 $\&$ 2, SERIES = Oxford Logic Guides, VOLUME = 44, PUBLISHER = The Clarendon Press, Oxford University Press, Oxford, YEAR = 2002, PAGES = i--xxii, 469--1089 and I1--I71, ISBN = 0-19-851598-7, MRCLASS = 18B25 (03B15 03G30 18-02 54A05), MRNUMBER = 2063092, MRREVIEWER = Colin McLarty,
162. adelmanjohnstone1982serreclasses: AUTHOR = Adelman, M. and Johnstone, P. T., TITLE = Serre classes for toposes, JOURNAL = Bull. Austral. Math. Soc., FJOURNAL = Bulletin of the Australian Mathematical Society, VOLUME = 25, YEAR = 1982, NUMBER = 1, PAGES = 103--115, ISSN = 0004-9727, MRCLASS = 18E35 (03G30 18B25), MRNUMBER = 651424, MRREVIEWER = Marta C. Bunge, DOI = 10.1017/S0004972700005086, URL = https://doi.org/10.1017/S0004972700005086, doi:[10.1017/S0004972700005086](https://doi.org/10.1017/S0004972700005086)
163. kazhdanvarshvsky2014yoneda: AUTHOR = Kazhdan, D. and Varshavski\u\i, Ya., TITLE = The Yoneda lemma for complete Segal spaces, JOURNAL = Funktsional. Anal. i Prilozhen., FJOURNAL = Funktsional\cprime ny\u\i Analiz i ego Prilozheniya, VOLUME = 48, YEAR = 2014, NUMBER = 2, PAGES = 3--38, ISSN = 0374-1990, MRCLASS = 18G30 (18G55), MRNUMBER = 3288174, MRREVIEWER = Svetoslav Zahariev, DOI = 10.1007/s10688-014-0050-3, URL = https://doi.org/10.1007/s10688-014-0050-3, doi:[10.1007/s10688-014-0050-3](https://doi.org/10.1007/s10688-014-0050-3)
164. dwyersspalinski1995modelcat: title=Homotopy theories and model categories, author=Dwyer, William G and Spalinski, Jan, journal=Handbook of algebraic topology, volume=73, pages=126, year=1995
165. debrito2018leftfibration: AUTHOR = Boavida de Brito, Pedro, TITLE = Segal objects and the Grothendieck construction, BOOKTITLE = An alpine bouquet of algebraic topology, SERIES = Contemp. Math., VOLUME = 708, PAGES = 19--44, PUBLISHER = Amer. Math. Soc., Providence, RI, YEAR = 2018, MRCLASS = 55U35 (18G55 55U40), MRNUMBER = 3807750, MRREVIEWER = Karol Szumi\l o, DOI = 10.1090/conm/708/14271, URL = https://doi.org/10.1090/conm/708/14271, doi:[10.1090/conm/708/14271](https://doi.org/10.1090/conm/708/14271)
166. duggerspivak2011rigidification: AUTHOR = Dugger, Daniel and Spivak, David I., TITLE = Rigidification of quasi-categories, JOURNAL = Algebr. Geom. Topol., FJOURNAL = Algebraic \& Geometric Topology, VOLUME = 11, YEAR = 2011, NUMBER = 1, PAGES = 225--261, ISSN = 1472-2747, MRCLASS = 55U40 (18G30), MRNUMBER = 2764042, MRREVIEWER = G\'erald Gaudens, DOI = 10.2140/agt.2011.11.225, URL = https://doi.org/10.2140/agt.2011.11.225, doi:[10.2140/agt.2011.11.225](https://doi.org/10.2140/agt.2011.11.225)
167. ara2014highersegal: AUTHOR = Ara, Dimitri, TITLE = Higher quasi-categories vs higher Rezk spaces, JOURNAL = J. K-Theory, FJOURNAL = Journal of K-Theory. K-Theory and its Applications in Algebra, Geometry, Analysis \& Topology, VOLUME = 14, YEAR = 2014, NUMBER = 3, PAGES = 701--749, ISSN = 1865-2433, MRCLASS = 18D05 (18D20 18G55 55U35), MRNUMBER = 3350089, MRREVIEWER = Javier J. Guti\'errez, DOI = 10.1017/S1865243315000021, URL = https://doi.org/10.1017/S1865243315000021, doi:[10.1017/S1865243315000021](https://doi.org/10.1017/S1865243315000021)
168. toen2005unicity: AUTHOR = To\"en, Bertrand, TITLE = Vers une axiomatisation de la th\'eorie des cat\'egories sup\'erieures, JOURNAL = $K$-Theory, FJOURNAL = $K$-Theory. An Interdisciplinary Journal for the Development, Application, and Influence of $K$-Theory in the Mathematical Sciences, VOLUME = 34, YEAR = 2005, NUMBER = 3, PAGES = 233--263, ISSN = 0920-3036, MRCLASS = 55U35 (18D05 18G55), MRNUMBER = 2182378, MRREVIEWER = Mamuka Jibladze, DOI = 10.1007/s10977-005-4556-6, URL = https://doi.org/10.1007/s10977-005-4556-6, doi:[10.1007/s10977-005-4556-6](https://doi.org/10.1007/s10977-005-4556-6)
169. dwyerkan1980simplocalization: AUTHOR = Dwyer, W. G. and Kan, D. M., TITLE = Simplicial localizations of categories, JOURNAL = J. Pure Appl. Algebra, FJOURNAL = Journal of Pure and Applied Algebra, VOLUME = 17, YEAR = 1980, NUMBER = 3, PAGES = 267--284, ISSN = 0022-4049, MRCLASS = 55U35 (18D20), MRNUMBER = 579087, MRREVIEWER = Timothy Porter, DOI = 10.1016/0022-4049(80)90049-3, URL = https://doi.org/10.1016/0022-4049(80)90049-3, doi:[10.1016/0022-4049(80)90049-3](https://doi.org/10.1016/0022-4049(80)90049-3)
170. dwyerkan1980calculatingsimplocalizations: AUTHOR = Dwyer, W. G. and Kan, D. M., TITLE = Calculating simplicial localizations, JOURNAL = J. Pure Appl. Algebra, FJOURNAL = Journal of Pure and Applied Algebra, VOLUME = 18, YEAR = 1980, NUMBER = 1, PAGES = 17--35, ISSN = 0022-4049, MRCLASS = 55U35 (18D20), MRNUMBER = 578563, MRREVIEWER = Timothy Porter, DOI = 10.1016/0022-4049(80)90113-9, URL = https://doi.org/10.1016/0022-4049(80)90113-9, doi:[10.1016/0022-4049(80)90113-9](https://doi.org/10.1016/0022-4049(80)90113-9)
171. heutsmoerdijk2015leftfibrationi: AUTHOR = Heuts, Gijs and Moerdijk, Ieke, TITLE = Left fibrations and homotopy colimits, JOURNAL = Math. Z., FJOURNAL = Mathematische Zeitschrift, VOLUME = 279, YEAR = 2015, NUMBER = 3-4, PAGES = 723--744, ISSN = 0025-5874, MRCLASS = 18G55 (55U35), MRNUMBER = 3318247, MRREVIEWER = J\'er\^ome Scherer, DOI = 10.1007/s00209-014-1390-7, URL = https://doi.org/10.1007/s00209-014-1390-7, doi:[10.1007/s00209-014-1390-7](https://doi.org/10.1007/s00209-014-1390-7)
172. heutsmoerdijk2016leftfibrationii: title=Left fibrations and homotopy colimits II, author=Heuts, Gijs and Moerdijk, Ieke, journal=arXiv preprint, year=2016, NOTE = \hrefhttps://arxiv.org/abs/1602.01274v1arXiv:1602.01274v1, arXiv:[1602.01274](https://arxiv.org/abs/1602.01274)
173. ayalafrancis2018flagged: AUTHOR = Ayala, David and Francis, John, TITLE = Flagged higher categories, BOOKTITLE = Topology and quantum theory in interaction, SERIES = Contemp. Math., VOLUME = 718, PAGES = 137--173, PUBLISHER = Amer. Math. Soc., Providence, RI, YEAR = 2018, MRCLASS = 55U35 (18A05 18D05 18D20 55P65), MRNUMBER = 3869643, MRREVIEWER = Julia Bergner, DOI = 10.1090/conm/718/14489, URL = https://doi.org/10.1090/conm/718/14489, doi:[10.1090/conm/718/14489](https://doi.org/10.1090/conm/718/14489)
174. ayalafrancis2020fibrations: AUTHOR = Ayala, David and Francis, John, TITLE = Fibrations of $\infty$-categories, JOURNAL = High. Struct., FJOURNAL = Higher Structures, VOLUME = 4, YEAR = 2020, NUMBER = 1, PAGES = 168--265, MRCLASS = 18N60 (18A22 55P65 55U35), MRNUMBER = 4074276, DOI = 10.1007/jhep01(2020)036, URL = https://doi.org/10.1007/jhep01(2020)036, doi:[10.1007/jhep01(2020)036](https://doi.org/10.1007/jhep01(2020)036)
175. calaquescheimbauer2019cobordism: AUTHOR = Calaque, Damien and Scheimbauer, Claudia, TITLE = A note on the $(\infty,n)$-category of cobordisms, JOURNAL = Algebr. Geom. Topol., FJOURNAL = Algebraic \& Geometric Topology, VOLUME = 19, YEAR = 2019, NUMBER = 2, PAGES = 533--655, ISSN = 1472-2747, MRCLASS = 18D05 (57R56), MRNUMBER = 3924174, DOI = 10.2140/agt.2019.19.533, URL = https://doi.org/10.2140/agt.2019.19.533, doi:[10.2140/agt.2019.19.533](https://doi.org/10.2140/agt.2019.19.533)
176. stevenson2017covariant: AUTHOR = Stevenson, Danny, TITLE = Covariant model structures and simplicial localization, JOURNAL = North-West. Eur. J. Math., FJOURNAL = North-Western European Journal of Mathematics, VOLUME = 3, YEAR = 2017, PAGES = 141--203, MRCLASS = 55U35 (18G30 18G55), MRNUMBER = 3683375, MRREVIEWER = Philippe Gaucher,
177. kelly1982enriched: AUTHOR = Kelly, Gregory Maxwell, TITLE = Basic concepts of enriched category theory, SERIES = London Mathematical Society Lecture Note Series, VOLUME = 64, PUBLISHER = Cambridge University Press, Cambridge-New York, YEAR = 1982, PAGES = 245, ISBN = 0-521-28702-2, MRCLASS = 18-02 (18D20), MRNUMBER = 651714, MRREVIEWER = F. E. J. Linton,
178. kelly2005enriched: AUTHOR = Kelly, G. M., TITLE = Basic concepts of enriched category theory, NOTE = Reprint of the 1982 original [Cambridge Univ. Press, Cambridge; MR0651714], JOURNAL = Repr. Theory Appl. Categ., FJOURNAL = Reprints in Theory and Applications of Categories, NUMBER = 10, YEAR = 2005, PAGES = vi+137, MRCLASS = 18-02 (00B60 18D10 18D20), MRNUMBER = 2177301,
179. verity2008complicial: AUTHOR = Verity, D. R. B., TITLE = Weak complicial sets. I. Basic homotopy theory, JOURNAL = Adv. Math., FJOURNAL = Advances in Mathematics, VOLUME = 219, YEAR = 2008, NUMBER = 4, PAGES = 1081--1149, ISSN = 0001-8708, MRCLASS = 18G30 (55U10), MRNUMBER = 2450607, MRREVIEWER = R. H. Street, DOI = 10.1016/j.aim.2008.06.003, URL = https://doi.org/10.1016/j.aim.2008.06.003, doi:[10.1016/j.aim.2008.06.003](https://doi.org/10.1016/j.aim.2008.06.003)
180. dkls2020cubical: title=Cubical models of $(\infty,1)$-categories, author=Doherty, Brandon and Kapulkin, Krzysztof and Lindsey, Zachery and Sattler, Christian, journal=arXiv preprint, year=2020, NOTE = \hrefhttps://arxiv.org/abs/2005.04853arXiv:2005.04853, arXiv:[2005.04853](https://arxiv.org/abs/2005.04853)
181. dohertykapulkinmaehara2021comical: title=Equivalence of cubical and simplicial approaches to $(\infty,n)$-categories, author=Doherty, Brandon and Kapulkin, Krzysztof and Maehara, Yuki, journal=arXiv preprint, year=2021, NOTE = \hrefhttps://arxiv.org/abs/2106.09428arXiv:2106.09428, arXiv:[2106.09428](https://arxiv.org/abs/2106.09428)
182. campionkapulkinmaehara2020comical: title=A cubical model for $(\infty,n)$-categories, author=Campion, Timothy and Kapulkin, Krzysztof and Maehara, Yuki, journal=arXiv preprint, year=2020, NOTE = \hrefhttps://arxiv.org/abs/2005.07603v2arXiv:2005.07603v2, arXiv:[2005.07603](https://arxiv.org/abs/2005.07603)
183. streicher2018fibration: title=Fibred categories \`a la Jean B\'enabou, author=Streicher, Thomas, journal=arXiv preprint, year=2018, NOTE = \hrefhttps://arxiv.org/abs/1801.02927v11arXiv:1801.02927v11, arXiv:[1801.02927](https://arxiv.org/abs/1801.02927)
184. lambekscott1988higherorderlogic: AUTHOR = Lambek, J. and Scott, P. J., TITLE = Introduction to higher order categorical logic, SERIES = Cambridge Studies in Advanced Mathematics, VOLUME = 7, NOTE = Reprint of the 1986 original, PUBLISHER = Cambridge University Press, Cambridge, YEAR = 1988, PAGES = x+293, ISBN = 0-521-35653-9, MRCLASS = 03B40 (03-02 03B15 03G30 18-02 18B25 18D15), MRNUMBER = 939612,
185. conduche1972fibrations: AUTHOR = Conduch\'e, Fran\ccois, TITLE = Au sujet de l'existence d'adjoints \`a droite aux foncteurs ``image r\'eciproque'' dans la cat\'egorie des cat\'egories, JOURNAL = C. R. Acad. Sci. Paris S\'er. A-B, FJOURNAL = Comptes Rendus Hebdomadaires des S\'eances de l'Acad\'emie des Sciences. S\'eries A et B, VOLUME = 275, YEAR = 1972, PAGES = A891--A894, ISSN = 0151-0509, MRCLASS = 18A40 (18F99), MRNUMBER = 310033, MRREVIEWER = F. E. J. Linton,
186. boardmanvogt1973qcats: AUTHOR = Boardman, J. M. and Vogt, R. M., TITLE = Homotopy invariant algebraic structures on topological spaces, SERIES = Lecture Notes in Mathematics, Vol. 347, PUBLISHER = Springer-Verlag, Berlin-New York, YEAR = 1973, PAGES = x+257, MRCLASS = 55D35, MRNUMBER = 0420609, MRREVIEWER = J. Stasheff,
187. nguyen2019covariant: title=Covariant \& Contravariant Homotopy Theories, author=Nguyen, Hoang Kim, journal=arXiv preprint, year=2019, NOTE = \hrefhttps://arxiv.org/abs/1908.06879v1arXiv:1908.06879v1, arXiv:[1908.06879](https://arxiv.org/abs/1908.06879)
188. reedy1974modelstructure: AUTHOR = Reedy, Christopher Leonard, TITLE = HOMOLOGY OF ALGEBRAIC THEORIES, NOTE = Thesis (Ph.D.)--University of California, San Diego, PUBLISHER = ProQuest LLC, Ann Arbor, MI, YEAR = 1974, PAGES = 52, MRCLASS = Thesis, MRNUMBER = 2624278, URL = http://gateway.proquest.com/openurl?url_ver=Z39.88-2004&rft_val_fmt=info:ofi/fmt:kev:mtx:dissertation&res_dat=xri:pqdiss&rft_dat=xri:pqdiss:7423973,
189. vergura2019localization: title=Localization theory in an $\infty$-topos, author=Vergura, Marco, journal=arXiv preprint, year=2019, NOTE = \hrefhttps://arxiv.org/abs/1907.03836v1arXiv:1907.03836v1, arXiv:[1907.03836](https://arxiv.org/abs/1907.03836)
190. cors2020localization: AUTHOR = Christensen, J. Daniel and Opie, Morgan and Rijke, Egbert and Scoccola, Luis, TITLE = Localization in homotopy type theory, JOURNAL = High. Struct., FJOURNAL = Higher Structures, VOLUME = 4, YEAR = 2020, NUMBER = 1, PAGES = 1--32, MRCLASS = 18E35 (03B38), MRNUMBER = 4074272,
191. christensensoccola2020hurewicz: title=The Hurewicz theorem in Homotopy Type Theory, author=Christensen, J Daniel and Scoccola, Luis, journal=arXiv preprint arXiv:2007.05833, year=2020 arXiv:[2007.05833](https://arxiv.org/abs/2007.05833)
192. brunerie2016homotopy: title=On the homotopy groups of spheres in homotopy type theory, author=Brunerie, Guillaume, journal=arXiv preprint arXiv:1606.05916, year=2016 arXiv:[1606.05916](https://arxiv.org/abs/1606.05916)
193. wellen2018cartan: title=Cartan Geometry in Modal Homotopy Type Theory, author=Wellen, Felix, journal=arXiv preprint arXiv:1806.05966, year=2018 arXiv:[1806.05966](https://arxiv.org/abs/1806.05966)
194. hochschild1945hh: AUTHOR = Hochschild, G., TITLE = On the cohomology groups of an associative algebra, JOURNAL = Ann. of Math. (2), FJOURNAL = Annals of Mathematics. Second Series, VOLUME = 46, YEAR = 1945, PAGES = 58--67, ISSN = 0003-486X, MRCLASS = 09.1X, MRNUMBER = 11076, MRREVIEWER = R. Baer, DOI = 10.2307/1969145, URL = https://doi.org/10.2307/1969145, doi:[10.2307/1969145](https://doi.org/10.2307/1969145)
195. cartaneilenberg1956homologicalalgebra: AUTHOR = Cartan, Henri and Eilenberg, Samuel, TITLE = Homological algebra, PUBLISHER = Princeton University Press, Princeton, N. J., YEAR = 1956, PAGES = xv+390, MRCLASS = 09.0X, MRNUMBER = 0077480, MRREVIEWER = G. Hochschild,
196. loday1998cyclic: AUTHOR = Loday, Jean-Louis, TITLE = Cyclic homology, SERIES = Grundlehren der Mathematischen Wissenschaften [Fundamental Principles of Mathematical Sciences], VOLUME = 301, EDITION = Second, NOTE = Appendix E by Mar\'\ia O. Ronco, Chapter 13 by the author in collaboration with Teimuraz Pirashvili, PUBLISHER = Springer-Verlag, Berlin, YEAR = 1998, PAGES = xx+513, ISBN = 3-540-63074-0, MRCLASS = 16E40 (13D03 17B55 18G60 19D55), MRNUMBER = 1600246, DOI = 10.1007/978-3-662-11389-9, URL = https://doi.org/10.1007/978-3-662-11389-9, doi:[10.1007/978-3-662-11389-9](https://doi.org/10.1007/978-3-662-11389-9)
197. connesmarcolli2008noncommgeometry: AUTHOR = Connes, Alain and Marcolli, Matilde, TITLE = A walk in the noncommutative garden, BOOKTITLE = An invitation to noncommutative geometry, PAGES = 1--128, PUBLISHER = World Sci. Publ., Hackensack, NJ, YEAR = 2008, MRCLASS = 58B34 (11F25 46L87 58J42 81R60), MRNUMBER = 2408150, MRREVIEWER = \'Eric Leichtnam, DOI = 10.1142/9789812814333\_0001, URL = https://doi.org/10.1142/9789812814333_0001, doi:[10.1142/9789812814333\_0001](https://doi.org/10.1142/9789812814333\_0001)
198. waldhausen1979ktheoryii: AUTHOR = Waldhausen, Friedhelm, TITLE = Algebraic $K$-theory of topological spaces. II, BOOKTITLE = Algebraic topology, Aarhus 1978 (Proc. Sympos., Univ. Aarhus, Aarhus, 1978), SERIES = Lecture Notes in Math., VOLUME = 763, PAGES = 356--394, PUBLISHER = Springer, Berlin, YEAR = 1979, MRCLASS = 18F25 (57Q10 57Q20 57R90), MRNUMBER = 561230, MRREVIEWER = Ross Staffeldt,
199. waldhausen1978ktheoryi: AUTHOR = Waldhausen, Friedhelm, TITLE = Algebraic $K$-theory of topological spaces. I, BOOKTITLE = Algebraic and geometric topology (Proc. Sympos. Pure Math., Stanford Univ., Stanford, Calif., 1976), Part 1, SERIES = Proc. Sympos. Pure Math., XXXII, PAGES = 35--60, PUBLISHER = Amer. Math. Soc., Providence, R.I., YEAR = 1978, MRCLASS = 18F25 (57Q10 57Q20 57R90), MRNUMBER = 520492, MRREVIEWER = Ross Staffeldt,
200. dennis1976ktheory: title=Algebraic K-theory and Hochschild homology, author=Dennis, K., journal=Unpublished lecture in Algebraic K-theory, Evanston, IL., year=1976
201. bokstedt1985thh: title=Topological Hochschild homology, author=B\"okstedt, M., journal=Preprint Universit\"at Bielefeld., year=1985
202. ekmm1997stablehomotopy: AUTHOR = Elmendorf, A. D. and Kriz, I. and Mandell, M. A. and May, J. P., TITLE = Rings, modules, and algebras in stable homotopy theory, SERIES = Mathematical Surveys and Monographs, VOLUME = 47, NOTE = With an appendix by M. Cole, PUBLISHER = American Mathematical Society, Providence, RI, YEAR = 1997, PAGES = xii+249, ISBN = 0-8218-0638-6, MRCLASS = 55N20 (19D10 19D55 55P42 55T25), MRNUMBER = 1417719, MRREVIEWER = Donald M. Davis, DOI = 10.1090/surv/047, URL = https://doi.org/10.1090/surv/047, doi:[10.1090/surv/047](https://doi.org/10.1090/surv/047)
203. waldhausen1985ktheory: AUTHOR = Waldhausen, Friedhelm, TITLE = Algebraic $K$-theory of spaces, BOOKTITLE = Algebraic and geometric topology (New Brunswick, N.J., 1983), SERIES = Lecture Notes in Math., VOLUME = 1126, PAGES = 318--419, PUBLISHER = Springer, Berlin, YEAR = 1985, MRCLASS = 18F25 (19D10 55N15 57Q60), MRNUMBER = 802796, MRREVIEWER = V. P. Snaith, DOI = 10.1007/BFb0074449, URL = https://doi.org/10.1007/BFb0074449, doi:[10.1007/BFb0074449](https://doi.org/10.1007/BFb0074449)
204. mccarthy1994cyclic: AUTHOR = McCarthy, Randy, TITLE = The cyclic homology of an exact category, JOURNAL = J. Pure Appl. Algebra, FJOURNAL = Journal of Pure and Applied Algebra, VOLUME = 93, YEAR = 1994, NUMBER = 3, PAGES = 251--296, ISSN = 0022-4049, MRCLASS = 19D55 (18F25 18G60 19D10), MRNUMBER = 1275967, MRREVIEWER = Dominique Arlettaz, DOI = 10.1016/0022-4049(94)90091-4, URL = https://doi.org/10.1016/0022-4049(94)90091-4, doi:[10.1016/0022-4049(94)90091-4](https://doi.org/10.1016/0022-4049(94)90091-4)
205. keller1999cyclichomology: AUTHOR = Keller, Bernhard, TITLE = On the cyclic homology of exact categories, JOURNAL = J. Pure Appl. Algebra, FJOURNAL = Journal of Pure and Applied Algebra, VOLUME = 136, YEAR = 1999, NUMBER = 1, PAGES = 1--56, ISSN = 0022-4049, MRCLASS = 18G60 (18E10), MRNUMBER = 1667558, MRREVIEWER = Teimuraz Pirashvili, DOI = 10.1016/S0022-4049(97)00152-7, URL = https://doi.org/10.1016/S0022-4049(97)00152-7, doi:[10.1016/S0022-4049(97)00152-7](https://doi.org/10.1016/S0022-4049(97)00152-7)
206. blumbergmandell2012cyclichomology: AUTHOR = Blumberg, Andrew J. and Mandell, Michael A., TITLE = Localization theorems in topological Hochschild homology and topological cyclic homology, JOURNAL = Geom. Topol., FJOURNAL = Geometry \& Topology, VOLUME = 16, YEAR = 2012, NUMBER = 2, PAGES = 1053--1120, ISSN = 1465-3060, MRCLASS = 19D55 (14F43), MRNUMBER = 2928988, MRREVIEWER = Guillermo Corti\ nas, DOI = 10.2140/gt.2012.16.1053, URL = https://doi.org/10.2140/gt.2012.16.1053, doi:[10.2140/gt.2012.16.1053](https://doi.org/10.2140/gt.2012.16.1053)
207. blumberggepnertabuada2013ktheory: AUTHOR = Blumberg, Andrew J. and Gepner, David and Tabuada, Gon\ccalo, TITLE = A universal characterization of higher algebraic $K$-theory, JOURNAL = Geom. Topol., FJOURNAL = Geometry \& Topology, VOLUME = 17, YEAR = 2013, NUMBER = 2, PAGES = 733--838, ISSN = 1465-3060, MRCLASS = 19D10 (18D20 19D25 19D55 55N15 55U40), MRNUMBER = 3070515, MRREVIEWER = Ross Staffeldt, DOI = 10.2140/gt.2013.17.733, URL = https://doi.org/10.2140/gt.2013.17.733, doi:[10.2140/gt.2013.17.733](https://doi.org/10.2140/gt.2013.17.733)
208. blumberggepnertabuada2014ktheory: AUTHOR = Blumberg, Andrew J. and Gepner, David and Tabuada, Gon\ccalo, TITLE = Uniqueness of the multiplicative cyclotomic trace, JOURNAL = Adv. Math., FJOURNAL = Advances in Mathematics, VOLUME = 260, YEAR = 2014, PAGES = 191--232, ISSN = 0001-8708, MRCLASS = 19D55 (19D23 55N15), MRNUMBER = 3209352, MRREVIEWER = Jeffrey Giansiracusa, DOI = 10.1016/j.aim.2014.02.004, URL = https://doi.org/10.1016/j.aim.2014.02.004, doi:[10.1016/j.aim.2014.02.004](https://doi.org/10.1016/j.aim.2014.02.004)
209. bgmn2021ktheory: title=K-theory and polynomial functors, author=Barwick, Clark and Glasman, Saul and Mathew, Akhil and Nikolaus, Thomas, journal=arXiv preprint, year=2021, NOTE = \hrefhttps://arxiv.org/abs/2102.00936arXiv:2102.00936, arXiv:[2102.00936](https://arxiv.org/abs/2102.00936)
210. nikolausscholze2019tccorrection: AUTHOR = Nikolaus, Thomas and Scholze, Peter, TITLE = Correction to ``On topological cyclic homology'' [ MR3904731], JOURNAL = Acta Math., FJOURNAL = Acta Mathematica, VOLUME = 222, YEAR = 2019, NUMBER = 1, PAGES = 215--218, ISSN = 0001-5962, MRCLASS = 55U35 (16E40 18E30 19D99), MRNUMBER = 3941804, DOI = 10.4310/ACTA.2019.v222.n1.a2, URL = https://doi.org/10.4310/ACTA.2019.v222.n1.a2, doi:[10.4310/ACTA.2019.v222.n1.a2](https://doi.org/10.4310/ACTA.2019.v222.n1.a2)
211. nikolausscholze2018tc: AUTHOR = Nikolaus, Thomas and Scholze, Peter, TITLE = On topological cyclic homology, JOURNAL = Acta Math., FJOURNAL = Acta Mathematica, VOLUME = 221, YEAR = 2018, NUMBER = 2, PAGES = 203--409, ISSN = 0001-5962, MRCLASS = 55U35 (16E40 18E30 19D99), MRNUMBER = 3904731, MRREVIEWER = Geoffrey M. L. Powell, DOI = 10.4310/ACTA.2018.v221.n2.a1, URL = https://doi.org/10.4310/ACTA.2018.v221.n2.a1, doi:[10.4310/ACTA.2018.v221.n2.a1](https://doi.org/10.4310/ACTA.2018.v221.n2.a1)
212. hessshipley2021cothh: AUTHOR = Hess, Kathryn and Shipley, Brooke, TITLE = Invariance properties of coHochschild homology, JOURNAL = J. Pure Appl. Algebra, FJOURNAL = Journal of Pure and Applied Algebra, VOLUME = 225, YEAR = 2021, NUMBER = 2, PAGES = 106505, 27, ISSN = 0022-4049, MRCLASS = 19D55 (16E40 16T15 55P43 55U35), MRNUMBER = 4128640, DOI = 10.1016/j.jpaa.2020.106505, URL = https://doi.org/10.1016/j.jpaa.2020.106505, doi:[10.1016/j.jpaa.2020.106505](https://doi.org/10.1016/j.jpaa.2020.106505) arXiv:[2020.10650](https://arxiv.org/abs/2020.10650)
213. moser2019enrichedproj: AUTHOR = Moser, Lyne, TITLE = Injective and projective model structures on enriched diagram categories, JOURNAL = Homology Homotopy Appl., FJOURNAL = Homology, Homotopy and Applications, VOLUME = 21, YEAR = 2019, NUMBER = 2, PAGES = 279--300, ISSN = 1532-0073, MRCLASS = 18G55 (18D20 55U35), MRNUMBER = 3923784, MRREVIEWER = Philippe Gaucher, DOI = 10.4310/HHA.2019.v21.n2.a15, URL = https://doi.org/10.4310/HHA.2019.v21.n2.a15, doi:[10.4310/HHA.2019.v21.n2.a15](https://doi.org/10.4310/HHA.2019.v21.n2.a15)
214. heller1983injectivemodelerratum: AUTHOR = Heller, Alex, TITLE = Erratum to: ``Homotopy in functor categories'', JOURNAL = Trans. Amer. Math. Soc., FJOURNAL = Transactions of the American Mathematical Society, VOLUME = 279, YEAR = 1983, NUMBER = 1, PAGES = 429, ISSN = 0002-9947, MRCLASS = 55U35 (18A25 18G55), MRNUMBER = 704625, DOI = 10.2307/1999394, URL = https://doi.org/10.2307/1999394, doi:[10.2307/1999394](https://doi.org/10.2307/1999394)
215. heller1982injectivemodel: AUTHOR = Heller, Alex, TITLE = Homotopy in functor categories, JOURNAL = Trans. Amer. Math. Soc., FJOURNAL = Transactions of the American Mathematical Society, VOLUME = 272, YEAR = 1982, NUMBER = 1, PAGES = 185--202, ISSN = 0002-9947, MRCLASS = 55U35 (18A25 18G55), MRNUMBER = 656485, DOI = 10.2307/1998955, URL = https://doi.org/10.2307/1998955, doi:[10.2307/1998955](https://doi.org/10.2307/1998955)
216. eilenbergkelly1966closedcat: AUTHOR = Eilenberg, Samuel and Kelly, G. Max, TITLE = Closed categories, BOOKTITLE = Proc. Conf. Categorical Algebra (La Jolla, Calif., 1965), PAGES = 421--562, PUBLISHER = Springer, New York, YEAR = 1966, MRCLASS = 18.10, MRNUMBER = 0225841, MRREVIEWER = F. E. J. Linton,
217. rezk2002rightproper: AUTHOR = Rezk, Charles, TITLE = Every homotopy theory of simplicial algebras admits a proper model, JOURNAL = Topology Appl., FJOURNAL = Topology and its Applications, VOLUME = 119, YEAR = 2002, NUMBER = 1, PAGES = 65--94, ISSN = 0166-8641, MRCLASS = 55U35 (18G30 18G55), MRNUMBER = 1881711, MRREVIEWER = Pilar C. Carrasco, DOI = 10.1016/S0166-8641(01)00057-8, URL = https://doi.org/10.1016/S0166-8641(01)00057-8, doi:[10.1016/S0166-8641(01)00057-8](https://doi.org/10.1016/S0166-8641(01)00057-8)
218. hkrs2017induced: AUTHOR = Hess, Kathryn and K\cedziorek, Magdalena and Riehl, Emily and Shipley, Brooke, TITLE = A necessary and sufficient condition for induced model structures, JOURNAL = J. Topol., FJOURNAL = Journal of Topology, VOLUME = 10, YEAR = 2017, NUMBER = 2, PAGES = 324--369, ISSN = 1753-8416, MRCLASS = 55U35 (18G55), MRNUMBER = 3653314, MRREVIEWER = J\'er\^ome Scherer, DOI = 10.1112/topo.12011, URL = https://doi.org/10.1112/topo.12011, doi:[10.1112/topo.12011](https://doi.org/10.1112/topo.12011)
219. bergnerrezk2013elegantreedy: AUTHOR = Bergner, Julia E. and Rezk, Charles, TITLE = Reedy categories and the $\varTheta$-construction, JOURNAL = Math. Z., FJOURNAL = Mathematische Zeitschrift, VOLUME = 274, YEAR = 2013, NUMBER = 1-2, PAGES = 499--514, ISSN = 0025-5874, MRCLASS = 55U35 (18G55 55U10), MRNUMBER = 3054341, MRREVIEWER = J\'er\^ome Scherer, DOI = 10.1007/s00209-012-1082-0, URL = https://doi.org/10.1007/s00209-012-1082-0, doi:[10.1007/s00209-012-1082-0](https://doi.org/10.1007/s00209-012-1082-0)
220. gagnaharpazlanari2020inftytwolimits: title=Fibrations and lax limits of $(\infty,2)$-categories, author=Gagna, Andrea and Harpaz, Yonatan and Lanari, Edoardo, journal=arXiv preprint, year=2020, NOTE = \hrefhttps://arxiv.org/abs/2012.04537arXiv:2012.04537, arXiv:[2012.04537](https://arxiv.org/abs/2012.04537)
221. gagnaharpazlanari2021inftytwocartfib: title=Cartesian Fibrations of $(\infty,2)$-categories, author=Gagna, Andrea and Harpaz, Yonatan and Lanari, Edoardo, journal=arXiv preprint, year=2021, NOTE = \hrefhttps://arxiv.org/abs/2107.12356arXiv:2107.12356, arXiv:[2107.12356](https://arxiv.org/abs/2107.12356)
222. gagnaharpazlanari2021bilimits: title=Bilimits are Bifinal Objects, author=Gagna, Andrea and Harpaz, Yonatan and Lanari, Edoardo, journal=arXiv preprint, year=2021, NOTE = \hrefhttps://arxiv.org/abs/2103.16394arXiv:2103.16394, arXiv:[2103.16394](https://arxiv.org/abs/2103.16394)
223. gagnaharpazlanari2020graytensor: title=Gray tensor products and lax functors of $(\infty,2)$-categories, author=Gagna, Andrea and Harpaz, Yonatan and Lanari, Edoardo, journal=arXiv preprint, year=2020, NOTE = \hrefhttps://arxiv.org/abs/2006.14495arXiv:2006.14495, arXiv:[2006.14495](https://arxiv.org/abs/2006.14495)
224. gagnaharpazlanari2019twocat: title=On the equivalence of all models for $(\infty,2)$-categories, author=Gagna, Andrea and Harpaz, Yonatan and Lanari, Edoardo, journal=arXiv preprint, year=2019, NOTE = \hrefhttps://arxiv.org/abs/1911.01905arXiv:1911.01905, arXiv:[1911.01905](https://arxiv.org/abs/1911.01905)
225. beardsleywong2019grothendieck: AUTHOR = Beardsley, Jonathan and Wong, Liang Ze, TITLE = The enriched Grothendieck construction, JOURNAL = Adv. Math., FJOURNAL = Advances in Mathematics, VOLUME = 344, YEAR = 2019, PAGES = 234--261, ISSN = 0001-8708, MRCLASS = 18D20, MRNUMBER = 3895649, MRREVIEWER = Luciano Stramaccia, DOI = 10.1016/j.aim.2018.12.009, URL = https://doi.org/10.1016/j.aim.2018.12.009, doi:[10.1016/j.aim.2018.12.009](https://doi.org/10.1016/j.aim.2018.12.009)
226. moser2020double: title=A double $(\infty,1)$-categorical nerve for double categories, author=Moser, Lyne, journal=arXiv preprint, year=2020, NOTE = \hrefhttps://arxiv.org/abs/2007.01848v3arXiv:2007.01848v3, arXiv:[2007.01848](https://arxiv.org/abs/2007.01848)
227. clingmanmoser2020bipres: title=Bi-initial objects and bi-representations are not so different, author=Clingman, Tslil and Moser, Lyne, journal=arXiv preprint, year=2020, NOTE = \hrefhttps://arxiv.org/abs/2009.05545arXiv:2009.05545, arXiv:[2009.05545](https://arxiv.org/abs/2009.05545)
228. clingmanmoser2020bilim: title=2-limits and 2-terminal objects are too different, author=Clingman, Tslil and Moser, Lyne, journal=arXiv preprint, year=2020, NOTE = \hrefhttps://arxiv.org/abs/2004.01313arXiv:2004.01313, arXiv:[2004.01313](https://arxiv.org/abs/2004.01313)
229. mosersarazolaverdugo2020twocatmodel: title=A 2Cat-inspired model structure for double categories, author=Moser, Lyne and Sarazola, Maru and Verdugo, Paula, journal=arXiv preprint, year=2020, NOTE = \hrefhttps://arxiv.org/abs/2004.14233arXiv:2004.14233, arXiv:[2004.14233](https://arxiv.org/abs/2004.14233)
230. mosersarazolaverdugo2020doublecatmodel: title=A model structure for weakly horizontally invariant double categories, author=Moser, Lyne and Sarazola, Maru and Verdugo, Paula, journal=arXiv preprint, year=2020, NOTE = \hrefhttps://arxiv.org/abs/2007.00588arXiv:2007.00588, arXiv:[2007.00588](https://arxiv.org/abs/2007.00588)
231. vasilakopouloumoeller2020monoidalgrothendieck: AUTHOR = Moeller, Joe and Vasilakopoulou, Christina, TITLE = Monoidal Grothendieck construction, JOURNAL = Theory Appl. Categ., FJOURNAL = Theory and Applications of Categories, VOLUME = 35, YEAR = 2020, PAGES = Paper No. 31, 1159--1207, MRCLASS = 18D30 (18M05), MRNUMBER = 4127726, MRREVIEWER = Laurent Poinsot,
232. mazelgee2019cartfib: AUTHOR = Mazel-Gee, Aaron, TITLE = A user's guide to co/cartesian fibrations, JOURNAL = Grad. J. Math., FJOURNAL = The Graduate Journal of Mathematics, VOLUME = 4, YEAR = 2019, NUMBER = 1, PAGES = 42--53, MRCLASS = 18D30 (55U35), MRNUMBER = 3999274,
233. mazelgee2019grothendieck: AUTHOR = Mazel-Gee, Aaron, TITLE = On the Grothendieck construction for $\infty$-categories, JOURNAL = J. Pure Appl. Algebra, FJOURNAL = Journal of Pure and Applied Algebra, VOLUME = 223, YEAR = 2019, NUMBER = 11, PAGES = 4602--4651, ISSN = 0022-4049, MRCLASS = 18A99 (18N40 55U35), MRNUMBER = 3955033, MRREVIEWER = Julia Bergner, DOI = 10.1016/j.jpaa.2019.02.007, URL = https://doi.org/10.1016/j.jpaa.2019.02.007, doi:[10.1016/j.jpaa.2019.02.007](https://doi.org/10.1016/j.jpaa.2019.02.007)
234. buchholtzweinberger2021cartesianfibhott: title=Synthetic fibered $(\infty,1)$-category theory, author=Buchholtz, Ulrik and Weinberger, Jonathan, journal=arXiv preprint, year=2021, NOTE = \hrefhttps://arxiv.org/abs/2105.01724arXiv:2105.01724, arXiv:[2105.01724](https://arxiv.org/abs/2105.01724)
235. garcia2020markedcolimits: title=Marked colimits and higher cofinality, author=Abell\'an Garc\'\ia, Fernando, journal=arXiv preprint, year=2020, NOTE = \hrefhttps://arxiv.org/abs/2006.12416arXiv:2006.12416, arXiv:[2006.12416](https://arxiv.org/abs/2006.12416)
236. garciastern2020theorema: title=Theorem A for marked $2$-categories, author=Abell\'an Garc\'\ia, Fernando and Stern, Walker H., journal=arXiv preprint, year=2020, NOTE = \hrefhttps://arxiv.org/abs/2002.12817arXiv:2002.12817, arXiv:[2002.12817](https://arxiv.org/abs/2002.12817)
237. garciastern2020twistedarrow: title=Enhanced twisted arrow categories, author=Abell\'an Garc\'\ia, Fernando and Stern, Walker H., journal=arXiv preprint, year=2020, NOTE = \hrefhttps://arxiv.org/abs/2009.11969arXiv:2009.11969, arXiv:[2009.11969](https://arxiv.org/abs/2009.11969)
238. garciastern2021twocat: title=2-Cartesian fibrations I: A model for $\infty$-bicategories fibred in $\infty$-bicategories, author=Abell\'an Garc\'\ia, Fernando and Stern, Walker H., journal=arXiv preprint, year=2021, NOTE = \hrefhttps://arxiv.org/abs/2106.03606arXiv:2106.03606, arXiv:[2106.03606](https://arxiv.org/abs/2106.03606)
239. garciastern2022twocat: title=2-Cartesian fibrations II: Higher cofinality, author=Abell\'an Garc\'\ia, Fernando and Stern, Walker H., journal=arXiv preprint, year=2022, NOTE = \hrefhttps://arxiv.org/abs/2201.09589arXiv:2201.09589, arXiv:[2201.09589](https://arxiv.org/abs/2201.09589)
240. bergnerrovelliozornova2021comparisonthetatwo: title=An explicit comparison between $2$-complicial sets and $\Theta_2$-spaces, author=Bergner, Julia E. and Ozornova, Viktoriya and Rovelli, Martina, journal=arXiv preprint, year=2021, NOTE = \hrefhttps://arxiv.org/abs/2104.13292arXiv:2104.13292, arXiv:[2104.13292](https://arxiv.org/abs/2104.13292)
241. stenzel2020comprehension: title=$(\infty, 1) $-Categorical Comprehension Schemes, author=Stenzel, Raffael, journal=arXiv preprint, year=2020, NOTE = \hrefhttps://arxiv.org/abs/2010.09663v1arXiv:2010.09663v1, arXiv:[2010.09663](https://arxiv.org/abs/2010.09663)
242. stenzel2019univalence: title=Univalence and completeness of Segal objects, author = Stenzel, Raffael, journal=arXiv preprint, year=2019, NOTE = \hrefhttps://arxiv.org/abs/1911.06640v2arXiv:1911.06640v2, arXiv:[1911.06640](https://arxiv.org/abs/1911.06640)
243. mathewstojanoska2016tmf: AUTHOR = Mathew, Akhil and Stojanoska, Vesna, TITLE = The Picard group of topological modular forms via descent theory, JOURNAL = Geom. Topol., FJOURNAL = Geometry \& Topology, VOLUME = 20, YEAR = 2016, NUMBER = 6, PAGES = 3133--3217, ISSN = 1465-3060, MRCLASS = 55P43 (14C22 55N34 55P47 55S35), MRNUMBER = 3590352, MRREVIEWER = Lennart Meier, DOI = 10.2140/gt.2016.20.3133, URL = https://doi.org/10.2140/gt.2016.20.3133, doi:[10.2140/gt.2016.20.3133](https://doi.org/10.2140/gt.2016.20.3133)
244. grothendieck2003etalegroup: TITLE = Rev\^etements \'etales et groupe fondamental (SGA 1), SERIES = Documents Math\'ematiques (Paris) [Mathematical Documents (Paris)], VOLUME = 3, NOTE = S\'eminaire de g\'eom\'etrie alg\'ebrique du Bois Marie 1960--61. [Algebraic Geometry Seminar of Bois Marie 1960-61], Directed by A. Grothendieck, With two papers by M. Raynaud, Updated and annotated reprint of the 1971 original [Lecture Notes in Math., 224, Springer, Berlin; MR0354651 (50 \#7129)], PUBLISHER = Soci\'et\'e Math\'ematique de France, Paris, YEAR = 2003, PAGES = xviii+327, ISBN = 2-85629-141-4, MRCLASS = 14E20 (14-06 14F35), MRNUMBER = 2017446,
245. kellyross1974twocat: AUTHOR = Kelly, G. M. and Street, Ross, TITLE = Review of the elements of $2$-categories, BOOKTITLE = Category Seminar (Proc. Sem., Sydney, 1972/1973), PAGES = 75--103. Lecture Notes in Math., Vol. 420, YEAR = 1974, MRCLASS = 18D05, MRNUMBER = 0357542, MRREVIEWER = E. G. Manes,
246. gaitsgoryrozenblyum2017dagII: AUTHOR = Gaitsgory, Dennis and Rozenblyum, Nick, TITLE = A study in derived algebraic geometry. Vol. II. Deformations, Lie theory and formal geometry, SERIES = Mathematical Surveys and Monographs, VOLUME = 221, PUBLISHER = American Mathematical Society, Providence, RI, YEAR = 2017, PAGES = xxxv+436, ISBN = 978-1-4704-3570-7, MRCLASS = 14F05 (18D05 18G55), MRNUMBER = 3701353, MRREVIEWER = Adrian Langer, DOI = 10.1090/surv/221.2, URL = https://doi.org/10.1090/surv/221.2, doi:[10.1090/surv/221.2](https://doi.org/10.1090/surv/221.2)
247. gaitsgoryrozenblyum2017dagI: AUTHOR = Gaitsgory, Dennis and Rozenblyum, Nick, TITLE = A study in derived algebraic geometry. Vol. I. Correspondences and duality, SERIES = Mathematical Surveys and Monographs, VOLUME = 221, PUBLISHER = American Mathematical Society, Providence, RI, YEAR = 2017, PAGES = xl+533pp, ISBN = 978-1-4704-3569-1, MRCLASS = 14F05 (18D05 18G55), MRNUMBER = 3701352, MRREVIEWER = Adrian Langer, DOI = 10.1090/surv/221.1, URL = https://doi.org/10.1090/surv/221.1, doi:[10.1090/surv/221.1](https://doi.org/10.1090/surv/221.1)
248. hirschowitzsimpson1998segalcat: title=Descente pour les n-champs (Descent for n-stacks), author=Hirschowitz, Andr\'e and Simpson, Carlos, journal=arXiv preprint, year=1998, NOTE = \hrefhttps://arxiv.org/abs/math/9807049arXiv:9807049,
249. stolzteichner2011fieldtheory: AUTHOR = Stolz, Stephan and Teichner, Peter, TITLE = Supersymmetric field theories and generalized cohomology, BOOKTITLE = Mathematical foundations of quantum field theory and perturbative string theory, SERIES = Proc. Sympos. Pure Math., VOLUME = 83, PAGES = 279--340, PUBLISHER = Amer. Math. Soc., Providence, RI, YEAR = 2011, MRCLASS = 55N20 (11F23 18D10 55N34 57R56 81T60), MRNUMBER = 2742432, MRREVIEWER = Theo Johnson-Freyd, DOI = 10.1090/pspum/083/2742432, URL = https://doi.org/10.1090/pspum/083/2742432, doi:[10.1090/pspum/083/2742432](https://doi.org/10.1090/pspum/083/2742432)
250. witten1988tqft: AUTHOR = Witten, Edward, TITLE = Topological quantum field theory, JOURNAL = Comm. Math. Phys., FJOURNAL = Communications in Mathematical Physics, VOLUME = 117, YEAR = 1988, NUMBER = 3, PAGES = 353--386, ISSN = 0010-3616, MRCLASS = 57R55 (58A10 58F30 58G30 81E99), MRNUMBER = 953828, MRREVIEWER = Daniel S. Freed, URL = http://projecteuclid.org/euclid.cmp/1104161738,
251. freedhopkins2016invtft: title=REFLECTION POSITIVITY AND INVERTIBLE TOPOLOGICAL PHASES, author=Freed, Daniel S. and Hopkins, Michael J., journal=arXiv preprint, year=2021, NOTE = \hrefhttps://arxiv.org/abs/1604.06527arXiv:1604.06527, arXiv:[1604.06527](https://arxiv.org/abs/1604.06527)
252. baezdolan1995tqft: AUTHOR = Baez, John C. and Dolan, James, TITLE = Higher-dimensional algebra and topological quantum field theory, JOURNAL = J. Math. Phys., FJOURNAL = Journal of Mathematical Physics, VOLUME = 36, YEAR = 1995, NUMBER = 11, PAGES = 6073--6105, ISSN = 0022-2488, MRCLASS = 18D05 (55P42 57R57), MRNUMBER = 1355899, DOI = 10.1063/1.531236, URL = https://doi.org/10.1063/1.531236, doi:[10.1063/1.531236](https://doi.org/10.1063/1.531236)
253. mmst2020tqft: AUTHOR = Mathieu, Philippe and Murray, Laura and Schenkel, Alexander and Teh, Nicholas J., TITLE = Homological perspective on edge modes in linear Yang-Mills and Chern-Simons theory, JOURNAL = Lett. Math. Phys., FJOURNAL = Letters in Mathematical Physics, VOLUME = 110, YEAR = 2020, NUMBER = 7, PAGES = 1559--1584, ISSN = 0377-9017, MRCLASS = 70S15 (18G35), MRNUMBER = 4114381, MRREVIEWER = Vladislav G. Kupriyanov, DOI = 10.1007/s11005-020-01269-x, URL = https://doi.org/10.1007/s11005-020-01269-x, doi:[10.1007/s11005-020-01269-x](https://doi.org/10.1007/s11005-020-01269-x)
254. freedhopkins2021invtft: AUTHOR = Freed, Daniel S. and Hopkins, Michael J., TITLE = Reflection positivity and invertible topological phases, JOURNAL = Geom. Topol., FJOURNAL = Geometry \& Topology, VOLUME = 25, YEAR = 2021, NUMBER = 3, PAGES = 1165--1330, ISSN = 1465-3060, MRCLASS = 81T45 (55N22 57R90 81T50 82D03), MRNUMBER = 4268163, DOI = 10.2140/gt.2021.25.1165, URL = https://doi.org/10.2140/gt.2021.25.1165, doi:[10.2140/gt.2021.25.1165](https://doi.org/10.2140/gt.2021.25.1165)
255. turaev2010tft: AUTHOR = Turaev, Vladimir G., TITLE = Quantum invariants of knots and 3-manifolds, SERIES = De Gruyter Studies in Mathematics, VOLUME = 18, EDITION = revised, PUBLISHER = Walter de Gruyter \& Co., Berlin, YEAR = 2010, PAGES = xii+592, ISBN = 978-3-11-022183-1, MRCLASS = 57M27 (57M25 57N10 57R56), MRNUMBER = 2654259, DOI = 10.1515/9783110221848, URL = https://doi.org/10.1515/9783110221848, doi:[10.1515/9783110221848](https://doi.org/10.1515/9783110221848)
256. dyckerhoffkapranov2019higherset: AUTHOR = Dyckerhoff, Tobias and Kapranov, Mikhail, TITLE = Higher Segal spaces, SERIES = Lecture Notes in Mathematics, VOLUME = 2244, PUBLISHER = Springer, Cham, YEAR = 2019, PAGES = xv+218, ISBN = 978-3-030-27122-0; 978-3-030-27124-4, MRCLASS = 55U35 (05E05 05E10 18G30 19D10 55U10), MRNUMBER = 3970975, DOI = 10.1007/978-3-030-27124-4, URL = https://doi.org/10.1007/978-3-030-27124-4, doi:[10.1007/978-3-030-27124-4](https://doi.org/10.1007/978-3-030-27124-4)
257. riehl2018jmm: title=On the directed univalence axiom, author=Riehl, Emily, year=2018, journal=Talk at the JMM, note = \hrefhttps://math.jhu.edu/ eriehl/JMM2018-directed-univalence.pdfSlides available online
258. weber2007twotopos: AUTHOR = Weber, Mark, TITLE = Yoneda structures from 2-toposes, JOURNAL = Appl. Categ. Structures, FJOURNAL = Applied Categorical Structures. A Journal Devoted to Applications of Categorical Methods in Algebra, Analysis, Order, Topology and Computer Science, VOLUME = 15, YEAR = 2007, NUMBER = 3, PAGES = 259--323, ISSN = 0927-2852, MRCLASS = 18A05 (18A15 18B25 18D05), MRNUMBER = 2320763, MRREVIEWER = Stephen Lack, DOI = 10.1007/s10485-007-9079-2, URL = https://doi.org/10.1007/s10485-007-9079-2, doi:[10.1007/s10485-007-9079-2](https://doi.org/10.1007/s10485-007-9079-2)
259. calaquehaugsengscheimbauer2019aksz: title=The AKSZ Construction in Derived Algebraic Geometry as an Extended Topological Field Theory, author = Calaque, Damien and Haugseng, Rune and Scheimbauer, Claudia, journal=arXiv preprint, year=2021, NOTE = \hrefhttps://arxiv.org/abs/2108.02473arXiv:2108.02473, arXiv:[2108.02473](https://arxiv.org/abs/2108.02473)
260. joyal1997disks: title=Disks, duality and $\Theta$-categories, author=Joyal, Andr\'e, journal=preprint, NOTE = \hrefhttps://ncatlab.org/nlab/files/JoyalThetaCategories.pdfCan be found online, year=1997
261. hinich2020enrichedyoneda: AUTHOR = Hinich, Vladimir, TITLE = Yoneda lemma for enriched $\infty$-categories, JOURNAL = Adv. Math., FJOURNAL = Advances in Mathematics, VOLUME = 367, YEAR = 2020, PAGES = 107129, 119, ISSN = 0001-8708, MRCLASS = 18D20 (18M05), MRNUMBER = 4080581, MRREVIEWER = Luciano Stramaccia, DOI = 10.1016/j.aim.2020.107129, URL = https://doi.org/10.1016/j.aim.2020.107129, doi:[10.1016/j.aim.2020.107129](https://doi.org/10.1016/j.aim.2020.107129) arXiv:[2020.10712](https://arxiv.org/abs/2020.10712)
262. berman2020enrichedpresheaves: title=Enriched infinity categories I: enriched presheaves, author = Berman, John D, journal=arXiv preprint, year=2020, NOTE = \hrefhttps://arxiv.org/abs/2008.11323arXiv:2008.11323, arXiv:[2008.11323](https://arxiv.org/abs/2008.11323)
263. berman2020laxlimits: title=On lax limits in infinity categories, author = Berman, John D, journal=arXiv preprint, year=2020, NOTE = \hrefhttps://arxiv.org/abs/2006.10851arXiv:2006.10851, arXiv:[2006.10851](https://arxiv.org/abs/2006.10851)
264. harpaznuitenprasma2019twisted: AUTHOR = Harpaz, Yonatan and Nuiten, Joost and Prasma, Matan, TITLE = Quillen cohomology of $(\infty,2)$-categories, JOURNAL = High. Struct., FJOURNAL = Higher Structures, VOLUME = 3, YEAR = 2019, NUMBER = 1, PAGES = 17--66, MRCLASS = 55P42 (18D05 55S35 55T25), MRNUMBER = 3939045, MRREVIEWER = Birgit Richter,
265. lawvere1964elementarysets: AUTHOR = Lawvere, F. William, TITLE = An elementary theory of the category of sets, JOURNAL = Proc. Nat. Acad. Sci. U.S.A., FJOURNAL = Proceedings of the National Academy of Sciences of the United States of America, VOLUME = 52, YEAR = 1964, PAGES = 1506--1511, ISSN = 0027-8424, MRCLASS = 04.99 (18.10), MRNUMBER = 172807, MRREVIEWER = A. Heller, DOI = 10.1073/pnas.52.6.1506, URL = https://doi.org/10.1073/pnas.52.6.1506, doi:[10.1073/pnas.52.6.1506](https://doi.org/10.1073/pnas.52.6.1506)
266. tierney1973elementarytopos: AUTHOR = Tierney, M., TITLE = Axiomatic sheaf theory: some constructions and applications, BOOKTITLE = Categories and commutative algebra (C.I.M.E., III Ciclo, Varenna, 1971), PAGES = 249--326, YEAR = 1973, MRCLASS = 18A15 (02K15), MRNUMBER = 0354800, MRREVIEWER = M. L. Laplaza,
267. tierney1972elementarycontinuum: AUTHOR = Tierney, Myles, TITLE = Sheaf theory and the continuum hypothesis, BOOKTITLE = Toposes, algebraic geometry and logic (Conf., Dalhousie Univ., Halifax, N.S., 1971), PAGES = 13--42. Lecture Notes in Math., Vol. 274, YEAR = 1972, MRCLASS = 02K05 (18B05), MRNUMBER = 0373888, MRREVIEWER = Andreas Blass,
268. sga1972tome1: TITLE = Th'eorie des topos et cohomologie 'etale des sch'emas. Tome 1: Th'eorie des topos, SERIES = Lecture Notes in Mathematics, VOLUME = Vol. 269, NOTE = S'eminaire de G'eom'etrie Alg'ebrique du Bois-Marie 1963--1964 (SGA 4), Dirig'e par M. Artin, A. Grothendieck, et J. L. Verdier. Avec la collaboration de N. Bourbaki, P. Deligne et B. Saint-Donat, PUBLISHER = Springer-Verlag, Berlin-New York, YEAR = 1972, PAGES = xix+525, MRCLASS = 14-06, MRNUMBER = 354652,
269. basterramandell2005taq: AUTHOR = Basterra, Maria and Mandell, Michael A., TITLE = Homology and cohomology of $E_\infty$ ring spectra, JOURNAL = Math. Z., FJOURNAL = Mathematische Zeitschrift, VOLUME = 249, YEAR = 2005, NUMBER = 4, PAGES = 903--944, ISSN = 0025-5874, MRCLASS = 55P43 (55P48 55U35), MRNUMBER = 2126222, MRREVIEWER = Birgit Richter, URL = https://doi.org/10.1007/s00209-004-0744-y, doi:[10.1007/s00209-004-0744-y](https://doi.org/10.1007/s00209-004-0744-y)
270. schlichtkrull2009thom: AUTHOR = Schlichtkrull, Christian, TITLE = Thom spectra that are symmetric spectra, JOURNAL = Doc. Math., FJOURNAL = Documenta Mathematica, VOLUME = 14, YEAR = 2009, PAGES = 699--748, ISSN = 1431-0635, MRCLASS = 55P43, MRNUMBER = 2578805, MRREVIEWER = Jo\ ao Paulo Santos,
271. stonek2020thhku: AUTHOR = Stonek, Bruno, TITLE = Higher topological Hochschild homology of periodic complex K-theory, JOURNAL = Topology Appl., FJOURNAL = Topology and its Applications, VOLUME = 282, YEAR = 2020, PAGES = 107302, 43, ISSN = 0166-8641, MRCLASS = 55P43 (16E40 19L99), MRNUMBER = 4116834, DOI = 10.1016/j.topol.2020.107302, URL = https://doi.org/10.1016/j.topol.2020.107302, doi:[10.1016/j.topol.2020.107302](https://doi.org/10.1016/j.topol.2020.107302) arXiv:[2020.10730](https://arxiv.org/abs/2020.10730)
272. abghr2014infty: AUTHOR = Ando, Matthew and Blumberg, Andrew J. and Gepner, David and Hopkins, Michael J. and Rezk, Charles, TITLE = An $\infty$-categorical approach to $R$-line bundles, $R$-module Thom spectra, and twisted $R$-homology, JOURNAL = J. Topol., FJOURNAL = Journal of Topology, VOLUME = 7, YEAR = 2014, NUMBER = 3, PAGES = 869--893, ISSN = 1753-8416, MRCLASS = 55P43 (55N20 55U40), MRNUMBER = 3252967, MRREVIEWER = Tyler D. Lawson, DOI = 10.1112/jtopol/jtt035, URL = https://doi.org/10.1112/jtopol/jtt035, doi:[10.1112/jtopol/jtt035](https://doi.org/10.1112/jtopol/jtt035)
273. abg2018thom: AUTHOR = Ando, Matthew and Blumberg, Andrew J. and Gepner, David, TITLE = Parametrized spectra, multiplicative Thom spectra and the twisted Umkehr map, JOURNAL = Geom. Topol., FJOURNAL = Geometry \& Topology, VOLUME = 22, YEAR = 2018, NUMBER = 7, PAGES = 3761--3825, ISSN = 1465-3060, MRCLASS = 55P43 (55R70), MRNUMBER = 3890766, DOI = 10.2140/gt.2018.22.3761, URL = https://doi.org/10.2140/gt.2018.22.3761, doi:[10.2140/gt.2018.22.3761](https://doi.org/10.2140/gt.2018.22.3761)
274. antolinbarthel2019thom: AUTHOR = Antol\'\in-Camarena, Omar and Barthel, Tobias, TITLE = A simple universal property of Thom ring spectra, JOURNAL = J. Topol., FJOURNAL = Journal of Topology, VOLUME = 12, YEAR = 2019, NUMBER = 1, PAGES = 56--78, ISSN = 1753-8416, MRCLASS = 55P42 (55P43 55P48), MRNUMBER = 3875978, DOI = 10.1112/topo.12084, URL = https://doi.org/10.1112/topo.12084, doi:[10.1112/topo.12084](https://doi.org/10.1112/topo.12084)
275. andre1967taq: AUTHOR = Andr\'e, Michel, TITLE = M\'ethode simpliciale en alg\`ebre homologique et alg\`ebre commutative, SERIES = Lecture Notes in Mathematics, Vol. 32, PUBLISHER = Springer-Verlag, Berlin-New York, YEAR = 1967, PAGES = iii+122, MRCLASS = 18.20 (13.00), MRNUMBER = 0214644, MRREVIEWER = D. W. Knudson,
276. quillen1973ktheory: AUTHOR = Quillen, Daniel, TITLE = Higher algebraic $K$-theory. I, BOOKTITLE = Algebraic $K$-theory, I: Higher $K$-theories (Proc. Conf., Battelle Memorial Inst., Seattle, Wash., 1972), PAGES = 85--147. Lecture Notes in Math., Vol. 341, PUBLISHER = Springer, Berlin, YEAR = 1973, MRCLASS = 18F25, MRNUMBER = 0338129 (49 \#2895), MRREVIEWER = Stephen M. Gersten,
277. quillen1970cohomology: AUTHOR = Quillen, Daniel, TITLE = On the (co-) homology of commutative rings, BOOKTITLE = Applications of Categorical Algebra (Proc. Sympos. Pure Math., Vol. XVII, New York, 1968), PAGES = 65--87, PUBLISHER = Amer. Math. Soc., Providence, R.I., YEAR = 1970, MRCLASS = 13.90 (18.00), MRNUMBER = 0257068, MRREVIEWER = S. Yuan,
278. blumbergmandell2012thh: AUTHOR = Blumberg, Andrew J. and Mandell, Michael A., TITLE = Localization theorems in topological Hochschild homology and topological cyclic homology, JOURNAL = Geom. Topol., FJOURNAL = Geometry \& Topology, VOLUME = 16, YEAR = 2012, NUMBER = 2, PAGES = 1053--1120, ISSN = 1465-3060, MRCLASS = 19D55 (14F43), MRNUMBER = 2928988, MRREVIEWER = Guillermo Corti\ nas, DOI = 10.2140/gt.2012.16.1053, URL = https://doi.org/10.2140/gt.2012.16.1053, doi:[10.2140/gt.2012.16.1053](https://doi.org/10.2140/gt.2012.16.1053)
279. ponto2010shadow: AUTHOR = Ponto, Kate, TITLE = Fixed point theory and trace for bicategories, JOURNAL = Ast\'erisque, FJOURNAL = Ast\'erisque, NUMBER = 333, YEAR = 2010, PAGES = xii+102, ISSN = 0303-1179, ISBN = 978-2-85629-293-8, MRCLASS = 55M20 (16D90 18D05), MRNUMBER = 2741967, MRREVIEWER = R. H. Street,
280. campbellponto2019thh: AUTHOR = Campbell, Jonathan A. and Ponto, Kate, TITLE = Topological Hochschild homology and higher characteristics, JOURNAL = Algebr. Geom. Topol., FJOURNAL = Algebraic \& Geometric Topology, VOLUME = 19, YEAR = 2019, NUMBER = 2, PAGES = 965--1017, ISSN = 1472-2747, MRCLASS = 16D90 (18D05 19D55 55M20 55R12), MRNUMBER = 3924181, MRREVIEWER = Andrew J. Baker, DOI = 10.2140/agt.2019.19.965, URL = https://doi.org/10.2140/agt.2019.19.965, doi:[10.2140/agt.2019.19.965](https://doi.org/10.2140/agt.2019.19.965)
281. berman2019thh: title=THH and traces of enriched categories, author=Berman, John D, journal=arXiv preprint, year=2019, NOTE =\hrefhttps://arxiv.org/abs/1911.01341arXiv:1911.01341, arXiv:[1911.01341](https://arxiv.org/abs/1911.01341)
282. gepnerhaugseng2015enriched: AUTHOR = Gepner, David and Haugseng, Rune, TITLE = Enriched $\infty$-categories via non-symmetric $\infty$-operads, JOURNAL = Adv. Math., FJOURNAL = Advances in Mathematics, VOLUME = 279, YEAR = 2015, PAGES = 575--716, ISSN = 0001-8708, MRCLASS = 18D20 (18D10 18D50), MRNUMBER = 3345192, MRREVIEWER = Christopher L. Rogers, DOI = 10.1016/j.aim.2015.02.007, URL = https://doi.org/10.1016/j.aim.2015.02.007, doi:[10.1016/j.aim.2015.02.007](https://doi.org/10.1016/j.aim.2015.02.007)
283. perouxshipley2019coalgebras: AUTHOR = P\'eroux, Maximilien and Shipley, Brooke, TITLE = Coalgebras in symmetric monoidal categories of spectra, JOURNAL = Homology Homotopy Appl., FJOURNAL = Homology, Homotopy and Applications, VOLUME = 21, YEAR = 2019, NUMBER = 1, PAGES = 1--18, ISSN = 1532-0073, MRCLASS = 55P43 (16T15 18D10 55P42), MRNUMBER = 3852287, MRREVIEWER = Birgit Richter, DOI = 10.4310/HHA.2019.v21.n1.a1, URL = https://doi.org/10.4310/HHA.2019.v21.n1.a1, doi:[10.4310/HHA.2019.v21.n1.a1](https://doi.org/10.4310/HHA.2019.v21.n1.a1)
284. schanuelstreet1986freeadj: AUTHOR = Schanuel, Stephen and Street, Ross, TITLE = The free adjunction, JOURNAL = Cahiers Topologie G\'eom. Diff\'erentielle Cat\'eg., FJOURNAL = Cahiers de Topologie et G\'eom\'etrie Diff\'erentielle Cat\'egoriques, VOLUME = 27, YEAR = 1986, NUMBER = 1, PAGES = 81--83, ISSN = 0008-0004, MRCLASS = 18D05 (18A40), MRNUMBER = 845410,
285. lack2004quillenbicat: AUTHOR = Lack, Stephen, TITLE = A Quillen model structure for bicategories, JOURNAL = $K$-Theory, FJOURNAL = $K$-Theory. An Interdisciplinary Journal for the Development, Application, and Influence of $K$-Theory in the Mathematical Sciences, VOLUME = 33, YEAR = 2004, NUMBER = 3, PAGES = 185--197, ISSN = 0920-3036, MRCLASS = 55U35 (18D05 18D15 18G55), MRNUMBER = 2138540, MRREVIEWER = J\vir\'\i Rosick\'y, DOI = 10.1007/s10977-004-6757-9, URL = https://doi.org/10.1007/s10977-004-6757-9, doi:[10.1007/s10977-004-6757-9](https://doi.org/10.1007/s10977-004-6757-9)
286. lack2002quillentwocat: AUTHOR = Lack, Stephen, TITLE = A Quillen model structure for 2-categories, JOURNAL = $K$-Theory, FJOURNAL = $K$-Theory. An Interdisciplinary Journal for the Development, Application, and Influence of $K$-Theory in the Mathematical Sciences, VOLUME = 26, YEAR = 2002, NUMBER = 2, PAGES = 171--205, ISSN = 0920-3036, MRCLASS = 55U35 (18D05 18G55), MRNUMBER = 1931220, MRREVIEWER = J. Daniel Christensen, DOI = 10.1023/A:1020305604826, URL = https://doi.org/10.1023/A:1020305604826, doi:[10.1023/A:1020305604826](https://doi.org/10.1023/A:1020305604826)
287. street1976twolimits: AUTHOR = Street, Ross, TITLE = Limits indexed by category-valued $2$-functors, JOURNAL = J. Pure Appl. Algebra, FJOURNAL = Journal of Pure and Applied Algebra, VOLUME = 8, YEAR = 1976, NUMBER = 2, PAGES = 149--181, ISSN = 0022-4049, MRCLASS = 18D05, MRNUMBER = 401868, MRREVIEWER = Robert C. Davis, DOI = 10.1016/0022-4049(76)90013-X, URL = https://doi.org/10.1016/0022-4049(76)90013-X, doi:[10.1016/0022-4049(76)90013-X](https://doi.org/10.1016/0022-4049(76)90013-X)
288. mikkelsen1976lattice: AUTHOR = Mikkelsen, Christian Juul, TITLE = Lattice theoretic and logical aspects of elementary topoi, SERIES = Various Publications Series, No. 25, PUBLISHER = Aarhus Universitet, Matematisk Institut, Aarhus, YEAR = 1976, PAGES = iv+122, MRCLASS = 02K10 (02H10 18A15 18B05), MRNUMBER = 0429560, MRREVIEWER = Hugo Volger,
289. mikkelsen1972finite: title=Finite colimits in toposes, author=Mikkelsen, C.J., booktitle=Talk at the conference on category theory at Oberwolfach, year=1972
290. pare1974colimits: title=Colimits in topoi, author=Par\'e, R., journal=Bulletin of the American Mathematical Society, volume=80, number=3, pages=556--561, year=1974
291. lawvere1963algebraictheory: AUTHOR = Lawvere, F. William, TITLE = Functorial semantics of algebraic theories, JOURNAL = Proc. Nat. Acad. Sci. U.S.A., FJOURNAL = Proceedings of the National Academy of Sciences of the United States of America, VOLUME = 50, YEAR = 1963, PAGES = 869--872, ISSN = 0027-8424, MRCLASS = 18.10, MRNUMBER = 158921, MRREVIEWER = M. Artin, DOI = 10.1073/pnas.50.5.869, URL = https://doi.org/10.1073/pnas.50.5.869, doi:[10.1073/pnas.50.5.869](https://doi.org/10.1073/pnas.50.5.869)
292. palmgren1997nonstandardanalysis: AUTHOR = Palmgren, Erik, TITLE = A sheaf-theoretic foundation for nonstandard analysis, JOURNAL = Ann. Pure Appl. Logic, FJOURNAL = Annals of Pure and Applied Logic, VOLUME = 85, YEAR = 1997, NUMBER = 1, PAGES = 69--86, ISSN = 0168-0072, MRCLASS = 03H05 (03F60), MRNUMBER = 1443276, DOI = 10.1016/S0168-0072(96)00041-3, URL = https://doi.org/10.1016/S0168-0072(96)00041-3, doi:[10.1016/S0168-0072(96)00041-3](https://doi.org/10.1016/S0168-0072(96)00041-3)
293. raptisstrunk2018motivictopos: AUTHOR = Raptis, Georgios and Strunk, Florian, TITLE = Model topoi and motivic homotopy theory, JOURNAL = Doc. Math., FJOURNAL = Documenta Mathematica, VOLUME = 23, YEAR = 2018, PAGES = 1757--1797, ISSN = 1431-0635, MRCLASS = 55U35 (14F42 18B25), MRNUMBER = 3890956, MRREVIEWER = Matthias Wendt,
294. isaksen2019stablecomputation: AUTHOR = Isaksen, Daniel C., TITLE = Stable stems, JOURNAL = Mem. Amer. Math. Soc., FJOURNAL = Memoirs of the American Mathematical Society, VOLUME = 262, YEAR = 2019, NUMBER = 1269, PAGES = viii+159, ISSN = 0065-9266, ISBN = 978-1-4704-3788-6; 978-1-4704-5511-8, MRCLASS = 14F42 (16T05 55P42 55Q10 55Q45 55S10 55S30 55T15), MRNUMBER = 4046815, MRREVIEWER = Masaki Kameko, DOI = 10.1090/memo/1269, URL = https://doi.org/10.1090/memo/1269, doi:[10.1090/memo/1269](https://doi.org/10.1090/memo/1269)
295. bayindirperoux2020cothh: title=Spanier-Whitehead duality for topological coHochschild homology, author=Bay\ind\ir, Haldun \"Ozg\"ur and P\'eroux, Maximilien, journal=arXiv preprint, year=2020, NOTE = \hrefhttps://arxiv.org/abs/2012.03966arXiv:2012.03966, arXiv:[2012.03966](https://arxiv.org/abs/2012.03966)
296. hess2010mixed: AUTHOR = Hess, Kathryn, TITLE = The Hochschild complex of a twisting cochain, JOURNAL = J. Algebra, FJOURNAL = Journal of Algebra, VOLUME = 451, YEAR = 2016, PAGES = 302--356, ISSN = 0021-8693, MRCLASS = 16E40 (16E45 16T15 18G55 55P35 55U15), MRNUMBER = 3454410, MRREVIEWER = Kenneth A. Brown, DOI = 10.1016/j.jalgebra.2015.11.040, URL = https://doi.org/10.1016/j.jalgebra.2015.11.040, doi:[10.1016/j.jalgebra.2015.11.040](https://doi.org/10.1016/j.jalgebra.2015.11.040)
297. nuiten2021straightening: title=On straightening for Segal spaces, author=Nuiten, Joost, journal=arXiv preprint, year=2021, NOTE = \hrefhttps://arxiv.org/abs/2108.11431arXiv:2108.11431, arXiv:[2108.11431](https://arxiv.org/abs/2108.11431)
298. thomason1979deltaspace: AUTHOR = Thomason, R. W., TITLE = Uniqueness of delooping machines, JOURNAL = Duke Math. J., FJOURNAL = Duke Mathematical Journal, VOLUME = 46, YEAR = 1979, NUMBER = 2, PAGES = 217--252, ISSN = 0012-7094, MRCLASS = 55P35 (55R35), MRNUMBER = 534053, MRREVIEWER = J. F. Adams, URL = http://projecteuclid.org/euclid.dmj/1077313403,
299. satake1956orbifolds: AUTHOR = Satake, I., TITLE = On a generalization of the notion of manifold, JOURNAL = Proc. Nat. Acad. Sci. U.S.A., FJOURNAL = Proceedings of the National Academy of Sciences of the United States of America, VOLUME = 42, YEAR = 1956, PAGES = 359--363, ISSN = 0027-8424, MRCLASS = 55.0X, MRNUMBER = 79769, MRREVIEWER = H. Samelson, DOI = 10.1073/pnas.42.6.359, URL = https://doi.org/10.1073/pnas.42.6.359, doi:[10.1073/pnas.42.6.359](https://doi.org/10.1073/pnas.42.6.359)
300. satake1957orbifolds: AUTHOR = Satake, Ichir\^o, TITLE = The Gauss-Bonnet theorem for $V$-manifolds, JOURNAL = J. Math. Soc. Japan, FJOURNAL = Journal of the Mathematical Society of Japan, VOLUME = 9, YEAR = 1957, PAGES = 464--492, ISSN = 0025-5645, MRCLASS = 53.00, MRNUMBER = 95520, MRREVIEWER = C. B. Allendoerfer, DOI = 10.2969/jmsj/00940464, URL = https://doi.org/10.2969/jmsj/00940464, doi:[10.2969/jmsj/00940464](https://doi.org/10.2969/jmsj/00940464)
301. atiyah1988tft: AUTHOR = Atiyah, Michael, TITLE = Topological quantum field theories, JOURNAL = Inst. Hautes \'Etudes Sci. Publ. Math., FJOURNAL = Institut des Hautes \'Etudes Scientifiques. Publications Math\'ematiques, NUMBER = 68, YEAR = 1988, PAGES = 175--186 (1989), ISSN = 0073-8301, MRCLASS = 57R55 (58E15 81E13 81E40), MRNUMBER = 1001453, MRREVIEWER = Matthias Blau, URL = http://www.numdam.org/item?id=PMIHES_1988__68__175_0,
302. martinlof1975inttypetheories: AUTHOR = Martin-L\"of, Per, TITLE = About models for intuitionistic type theories and the notion of definitional equality, BOOKTITLE = Proceedings of the Third Scandinavian Logic Symposium (Univ. Uppsala, Uppsala, 1973), PAGES = 81--109. Stud. Logic Found. Math., Vol. 82, YEAR = 1975, MRCLASS = 02C15 (02C20 02D99), MRNUMBER = 0389545, MRREVIEWER = J. P. Seldin,
303. altenkirch2021martin: title=Martin Hofmann’s contributions to type theory: Groupoids and univalence, DOI=10.1017/S0960129520000316, journal=Mathematical Structures in Computer Science, publisher=Cambridge University Press, author=Altenkirch, Thorsten, year=2021, pages=1–5 doi:[10.1017/S0960129520000316](https://doi.org/10.1017/S0960129520000316)
304. moerdijk2002orbifolds: AUTHOR = Moerdijk, Ieke, TITLE = Orbifolds as groupoids: an introduction, BOOKTITLE = Orbifolds in mathematics and physics (Madison, WI, 2001), SERIES = Contemp. Math., VOLUME = 310, PAGES = 205--222, PUBLISHER = Amer. Math. Soc., Providence, RI, YEAR = 2002, MRCLASS = 22A22 (55N30 55P15 58H05), MRNUMBER = 1950948, MRREVIEWER = Janez Mr\vcun, DOI = 10.1090/conm/310/05405, URL = https://doi.org/10.1090/conm/310/05405, doi:[10.1090/conm/310/05405](https://doi.org/10.1090/conm/310/05405)
305. voevodsky2014origins: title=The origins and motivations of univalent foundations, author=Voevodsky, Vladimir, journal=The Institute Letter, pages=8--9, year=2014
306. bergmoerdijk2018univalentcompletion: AUTHOR = van den Berg, Benno and Moerdijk, Ieke, TITLE = Univalent completion, JOURNAL = Math. Ann., FJOURNAL = Mathematische Annalen, VOLUME = 371, YEAR = 2018, NUMBER = 3-4, PAGES = 1337--1350, ISSN = 0025-5831, MRCLASS = 55U35 (18C50 18D05 18G30 55P15 55R15 55R35 55U10), MRNUMBER = 3831273, MRREVIEWER = David A. Blanc, DOI = 10.1007/s00208-017-1614-3, URL = https://doi.org/10.1007/s00208-017-1614-3, doi:[10.1007/s00208-017-1614-3](https://doi.org/10.1007/s00208-017-1614-3)
307. ahrenskapulkinshulman2015rezkcompletion: AUTHOR = Ahrens, Benedikt and Kapulkin, Krzysztof and Shulman, Michael, TITLE = Univalent categories and the Rezk completion, JOURNAL = Math. Structures Comput. Sci., FJOURNAL = Mathematical Structures in Computer Science. A Journal in the Applications of Categorical, Algebraic and Geometric Methods in Computer Science, VOLUME = 25, YEAR = 2015, NUMBER = 5, PAGES = 1010--1039, ISSN = 0960-1295, MRCLASS = 18B99 (03B15), MRNUMBER = 3340533, MRREVIEWER = Thomas Streicher, DOI = 10.1017/S0960129514000486, URL = https://doi.org/10.1017/S0960129514000486, doi:[10.1017/S0960129514000486](https://doi.org/10.1017/S0960129514000486)
308. thom1954thomspace: AUTHOR = Thom, Ren\'e, TITLE = Quelques propri\'et\'es globales des vari\'et\'es diff\'erentiables, JOURNAL = Comment. Math. Helv., FJOURNAL = Commentarii Mathematici Helvetici, VOLUME = 28, YEAR = 1954, PAGES = 17--86, ISSN = 0010-2571, MRCLASS = 56.0X, MRNUMBER = 61823, MRREVIEWER = W. S. Massey, DOI = 10.1007/BF02566923, URL = https://doi.org/10.1007/BF02566923, doi:[10.1007/BF02566923](https://doi.org/10.1007/BF02566923)
309. milnor1958mu: AUTHOR = Milnor, J., TITLE = On the cobordism ring $\Omega ^\ast $ and a complex analogue. I, JOURNAL = Amer. J. Math., FJOURNAL = American Journal of Mathematics, VOLUME = 82, YEAR = 1960, PAGES = 505--521, ISSN = 0002-9327, MRCLASS = 55.00, MRNUMBER = 119209, MRREVIEWER = J. F. Adams, DOI = 10.2307/2372970, URL = https://doi.org/10.2307/2372970, doi:[10.2307/2372970](https://doi.org/10.2307/2372970)
310. milnor1974characteristic: title=Characteristic Classes, author=Milnor, J.W. and Stasheff, J.D., isbn=9780691081229, lccn=lc72004050, series=Annals of mathematics studies, url=https://books.google.de/books?id=5zQ9AFk1i4EC, year=1974, publisher=Princeton University Press
311. novikov1960mu: AUTHOR = Novikov, S. P., TITLE = Some problems in the topology of manifolds connected with the theory of Thom spaces, JOURNAL = Soviet Math. Dokl., FJOURNAL = Soviet Mathematics. Doklady, VOLUME = 1, YEAR = 1960, PAGES = 717--720, ISSN = 0197-6788, MRCLASS = 57.00, MRNUMBER = 0121815, MRREVIEWER = J. F. Adams,
312. novikov1962mu: AUTHOR = Novikov, S. P., TITLE = Homotopy properties of Thom complexes, JOURNAL = Mat. Sb. (N.S.), VOLUME = 57 (99), YEAR = 1962, PAGES = 407--442, MRCLASS = 55.50 (55.60), MRNUMBER = 0157381, MRREVIEWER = J. W. Jaworowski,
313. quillen1969complexcobordism: AUTHOR = Quillen, Daniel, TITLE = On the formal group laws of unoriented and complex cobordism theory, JOURNAL = Bull. Amer. Math. Soc., FJOURNAL = Bulletin of the American Mathematical Society, VOLUME = 75, YEAR = 1969, PAGES = 1293--1298, ISSN = 0002-9904, MRCLASS = 57.10, MRNUMBER = 253350, MRREVIEWER = R. E. Stong, DOI = 10.1090/S0002-9904-1969-12401-8, URL = https://doi.org/10.1090/S0002-9904-1969-12401-8, doi:[10.1090/S0002-9904-1969-12401-8](https://doi.org/10.1090/S0002-9904-1969-12401-8)
314. arendtkapulkin2011typetheory: AUTHOR = Arndt, Peter and Kapulkin, Krzysztof, TITLE = Homotopy-theoretic models of type theory, BOOKTITLE = Typed lambda calculi and applications, SERIES = Lecture Notes in Comput. Sci., VOLUME = 6690, PAGES = 45--60, PUBLISHER = Springer, Heidelberg, YEAR = 2011, MRCLASS = 03B15, MRNUMBER = 2830786, DOI = 10.1007/978-3-642-21691-6\_7, URL = https://doi.org/10.1007/978-3-642-21691-6_7, doi:[10.1007/978-3-642-21691-6\_7](https://doi.org/10.1007/978-3-642-21691-6\_7)
315. lumsdaineshulman2020goodmodel: AUTHOR = LeFanu Lumsdaine, Peter and Shulman, Michael, TITLE = Semantics of higher inductive types, JOURNAL = Math. Proc. Cambridge Philos. Soc., FJOURNAL = Mathematical Proceedings of the Cambridge Philosophical Society, VOLUME = 169, YEAR = 2020, NUMBER = 1, PAGES = 159--208, ISSN = 0305-0041, MRCLASS = 18C50 (03B38 18N40 18N45 18N60), MRNUMBER = 4120789, MRREVIEWER = Thomas Streicher, DOI = 10.1017/s030500411900015x, URL = https://doi.org/10.1017/s030500411900015x, doi:[10.1017/s030500411900015x](https://doi.org/10.1017/s030500411900015x)
316. riemann1953gesammelt: AUTHOR = Riemann, Bernhard, TITLE = Gesammelte mathematische Werke und wissenschaftlicher Nachlass, PUBLISHER = Dover Publications, Inc., New York, N. Y., YEAR = 1953, PAGES = xix+558+viii+116, MRCLASS = 01.0X, MRNUMBER = 0052364,
317. grothendieck1995stack: AUTHOR = Grothendieck, Alexander, TITLE = Technique de descente et th\'eor\`emes d'existence en g\'eom\'etrie alg\'ebrique. I. G\'en\'eralit\'es. Descente par morphismes fid\`element plats, BOOKTITLE = S\'eminaire Bourbaki, Vol. 5, PAGES = Exp. No. 190, 299--327, PUBLISHER = Soc. Math. France, Paris, YEAR = 1995, MRCLASS = 14A15, MRNUMBER = 1603475,
318. atiyahhirzebruch1959ktheory: AUTHOR = Atiyah, M. F. and Hirzebruch, F., TITLE = Riemann-Roch theorems for differentiable manifolds, JOURNAL = Bull. Amer. Math. Soc., FJOURNAL = Bulletin of the American Mathematical Society, VOLUME = 65, YEAR = 1959, PAGES = 276--281, ISSN = 0002-9904, MRCLASS = 57.00, MRNUMBER = 110106, MRREVIEWER = M. A. Kervaire, DOI = 10.1090/S0002-9904-1959-10344-X, URL = https://doi.org/10.1090/S0002-9904-1959-10344-X, doi:[10.1090/S0002-9904-1959-10344-X](https://doi.org/10.1090/S0002-9904-1959-10344-X)
319. grothendieck1960etale: AUTHOR = Grothendieck, Alexander, TITLE = The cohomology theory of abstract algebraic varieties, BOOKTITLE = Proc. Internat. Congress Math. (Edinburgh, 1958), PAGES = 103--118, PUBLISHER = Cambridge Univ. Press, New York, YEAR = 1960, MRCLASS = 14.55, MRNUMBER = 0130879, MRREVIEWER = R. Bott,
320. mumford1963ellipticcurves: AUTHOR = Mumford, David, TITLE = Picard groups of moduli problems, BOOKTITLE = Arithmetical Algebraic Geometry (Proc. Conf. Purdue Univ., 1963), PAGES = 33--81, PUBLISHER = Harper \& Row, New York, YEAR = 1965, MRCLASS = 14.20, MRNUMBER = 0201443, MRREVIEWER = S. S. Shatz,
321. voevodsky2003milnor: AUTHOR = Voevodsky, Vladimir, TITLE = Motivic cohomology with $\bf Z/2$-coefficients, JOURNAL = Publ. Math. Inst. Hautes \'Etudes Sci., FJOURNAL = Publications Math\'ematiques. Institut de Hautes \'Etudes Scientifiques, NUMBER = 98, YEAR = 2003, PAGES = 59--104, ISSN = 0073-8301, MRCLASS = 14F42 (12G05 19D45 19E15), MRNUMBER = 2031199, MRREVIEWER = Eric M. Friedlander, DOI = 10.1007/s10240-003-0010-6, URL = https://doi.org/10.1007/s10240-003-0010-6, doi:[10.1007/s10240-003-0010-6](https://doi.org/10.1007/s10240-003-0010-6)
322. morelvoevodsky1999motivic: AUTHOR = Morel, Fabien and Voevodsky, Vladimir, TITLE = $\bf A^1$-homotopy theory of schemes, JOURNAL = Inst. Hautes \'Etudes Sci. Publ. Math., FJOURNAL = Institut des Hautes \'Etudes Scientifiques. Publications Math\'ematiques, NUMBER = 90, YEAR = 1999, PAGES = 45--143, ISSN = 0073-8301,1618-1913, MRCLASS = 14F35 (19E08), MRNUMBER = 1813224, MRREVIEWER = Marc\ Levine, URL = http://www.numdam.org/item?id=PMIHES_1999__90__45_0,
323. leanteam2021liquidtensor: author = Barton, Reid and Commelin, Johan and Lean community, title = Liquid Tensor Lean Github Library, year = 2021, url = https://github.com/leanprover-community/lean-liquid, howpublished = \hrefhttps://github.com/leanprover-community/lean-liquidAvailable online,
324. leanteam2022liquidtensorcomplete: author = Barton, Reid and Commelin, Johan and Lean community, title = Liquid Tensor Lean Github Library, year = 2021, url = https://github.com/leanprover-community/lean-liquid, howpublished = \hrefhttps://github.com/leanprover-community/lean-liquidhttps://github.com/leanprover-community/lean-liquid,
325. hartnett2021liquidtensor: author = Hartnett, Kevin, year = 2021, title = Proof Assistant Makes Jump to Big-League Math, journal = Quanta Magazine, url = https://www.quantamagazine.org/lean-computer-program-confirms-peter-scholze-proof-20210728/, howpublished = \hrefhttps://www.quantamagazine.org/lean-computer-program-confirms-peter-scholze-proof-20210728/https://www.quantamagazine.org/lean-computer-program-confirms-peter-scholze-proof-20210728/, urldate = 2021-07-28
326. hartnett2015coq: author = Hartnett, Kevin, year = 2015, title = Will Computers Redefine the Roots of Math?, journal = Quanta Magazine, url = https://www.quantamagazine.org/univalent-foundations-redefines-mathematics-20150519/, howpublished = \hrefhttps://www.quantamagazine.org/univalent-foundations-redefines-mathematics-20150519/https://www.quantamagazine.org/univalent-foundations-redefines-mathematics-20150519/, urldate = 2015-05-19
327. hatcher2002at: AUTHOR = Hatcher, Allen, TITLE = Algebraic topology, PUBLISHER = Cambridge University Press, Cambridge, YEAR = 2002, PAGES = xii+544, ISBN = 0-521-79160-X; 0-521-79540-0, MRCLASS = 55-01 (55-00), MRNUMBER = 1867354, MRREVIEWER = Donald W. Kahn,
328. hatcher2003vb: author=Hatcher, Allen, title=Vector Bundles and K-Theory, NOTE = \hrefhttps://pi.math.cornell.edu/ hatcher/VBKT/VB.pdfUnpublished notes, year=2003
329. gray1974formal: AUTHOR = Gray, John W., TITLE = Formal category theory: adjointness for $2$-categories, SERIES = Lecture Notes in Mathematics, Vol. 391, PUBLISHER = Springer-Verlag, Berlin-New York, YEAR = 1974, PAGES = xii+282, MRCLASS = 18DXX, MRNUMBER = 0371990, MRREVIEWER = R. H. Street,
330. benabou1967bicat: AUTHOR = B\'enabou, Jean, TITLE = Introduction to bicategories, BOOKTITLE = Reports of the Midwest Category Seminar, PAGES = 1--77, PUBLISHER = Springer, Berlin, YEAR = 1967, MRCLASS = 18.10, MRNUMBER = 0220789, MRREVIEWER = J. R. Isbell,
331. riehlverity2020limits: AUTHOR = Riehl, Emily and Verity, Dominic, TITLE = Recognizing quasi-categorical limits and colimits in homotopy coherent nerves, JOURNAL = Appl. Categ. Structures, FJOURNAL = Applied Categorical Structures. A Journal Devoted to Applications of Categorical Methods in Algebra, Analysis, Order, Topology and Computer Science, VOLUME = 28, YEAR = 2020, NUMBER = 4, PAGES = 669--716, ISSN = 0927-2852, MRCLASS = 18A30 (18A05 18N40 18N50 55U10 55U35 55U40), MRNUMBER = 4114996, MRREVIEWER = J\'er\^ome Scherer, DOI = 10.1007/s10485-020-09594-x, URL = https://doi.org/10.1007/s10485-020-09594-x, doi:[10.1007/s10485-020-09594-x](https://doi.org/10.1007/s10485-020-09594-x)
332. grandis2020doublecat: AUTHOR = Grandis, Marco, TITLE = Higher dimensional categories, NOTE = From double to multiple categories, PUBLISHER = World Scientific Publishing Co. Pte. Ltd., Hackensack, NJ, YEAR = 2020, PAGES = xi+522, ISBN = 978-981-120-510-1, MRCLASS = 18-02 (18A99 18N10), MRNUMBER = 3970290, MRREVIEWER = Dominic Robert Verity,
333. rezk2019highertopos: title=Lectures on Higher Topos Theory, author=Rezk, Charles, NOTE = \hrefhttps://faculty.math.illinois.edu/ rezk/leeds-lectures-2019.pdfUnpublished notes, year=2019
334. riehl2019ct: title=A formal category theory for $\infty$-categories, author=Riehl, Emily, year=2019, journal=Talk at the Category Theory Conference, note = \hrefhttps://math.jhu.edu/ eriehl/CT2019.pdfSlides available online
335. streetwalters1978yonedastructures: AUTHOR = Street, Ross and Walters, Robert, TITLE = Yoneda structures on 2-categories, JOURNAL = J. Algebra, FJOURNAL = Journal of Algebra, VOLUME = 50, YEAR = 1978, NUMBER = 2, PAGES = 350--379, ISSN = 0021-8693, MRCLASS = 18D05, MRNUMBER = 463261, MRREVIEWER = Sym\'eon Bozapalid\`es, DOI = 10.1016/0021-8693(78)90160-6, URL = https://doi.org/10.1016/0021-8693(78)90160-6, doi:[10.1016/0021-8693(78)90160-6](https://doi.org/10.1016/0021-8693(78)90160-6)
336. lambekscott1980freetopos: AUTHOR = Lambek, J. and Scott, P. J., TITLE = Intuitionist type theory and the free topos, JOURNAL = J. Pure Appl. Algebra, FJOURNAL = Journal of Pure and Applied Algebra, VOLUME = 19, YEAR = 1980, PAGES = 215--257, ISSN = 0022-4049, MRCLASS = 03G30 (03F50 18B25), MRNUMBER = 593255, MRREVIEWER = Andreas Blass, DOI = 10.1016/0022-4049(80)90102-4, URL = https://doi.org/10.1016/0022-4049(80)90102-4, doi:[10.1016/0022-4049(80)90102-4](https://doi.org/10.1016/0022-4049(80)90102-4)
337. lambek1980freetopos: AUTHOR = Lambek, Joachim, TITLE = From types to sets, JOURNAL = Adv. in Math., FJOURNAL = Advances in Mathematics, VOLUME = 36, YEAR = 1980, NUMBER = 2, PAGES = 113--164, ISSN = 0001-8708, MRCLASS = 03G30 (18B25), MRNUMBER = 574645, MRREVIEWER = John L. Bell, DOI = 10.1016/0001-8708(80)90013-4, URL = https://doi.org/10.1016/0001-8708(80)90013-4, doi:[10.1016/0001-8708(80)90013-4](https://doi.org/10.1016/0001-8708(80)90013-4)
338. dubuckelly1983toposcomplete: AUTHOR = Dubuc, Eduardo J. and Kelly, G. M., TITLE = A presentation of Topoi as algebraic relative to categories or graphs, JOURNAL = J. Algebra, FJOURNAL = Journal of Algebra, VOLUME = 81, YEAR = 1983, NUMBER = 2, PAGES = 420--433, ISSN = 0021-8693, MRCLASS = 18D20 (18B25 18C15), MRNUMBER = 700293, MRREVIEWER = Marta C. Bunge, DOI = 10.1016/0021-8693(83)90197-7, URL = https://doi.org/10.1016/0021-8693(83)90197-7, doi:[10.1016/0021-8693(83)90197-7](https://doi.org/10.1016/0021-8693(83)90197-7)
339. gepnerhaugsengkock2017analyticmonad: title=$\infty$-Operads as Analytic Monads, author=Gepner, David and Haugseng, Rune and Kock, Joachim, journal=arXiv preprint, year=2017, NOTE = \hrefhttps://arxiv.org/abs/1712.06469arXiv:1712.06469, arXiv:[1712.06469](https://arxiv.org/abs/1712.06469)
340. chuhaugseng2020enrichedoperad: AUTHOR = Chu, Hongyi and Haugseng, Rune, TITLE = Enriched $\infty$-operads, JOURNAL = Adv. Math., FJOURNAL = Advances in Mathematics, VOLUME = 361, YEAR = 2020, PAGES = 106913, 85, ISSN = 0001-8708, MRCLASS = 18D50 (18D20 18F20), MRNUMBER = 4038556, DOI = 10.1016/j.aim.2019.106913, URL = https://doi.org/10.1016/j.aim.2019.106913, doi:[10.1016/j.aim.2019.106913](https://doi.org/10.1016/j.aim.2019.106913) arXiv:[2019.10691](https://arxiv.org/abs/2019.10691)
341. bss2020chromatic: AUTHOR = Barthel, Tobias and Schlank, Tomer M. and Stapleton, Nathaniel, TITLE = Chromatic homotopy theory is asymptotically algebraic, JOURNAL = Invent. Math., FJOURNAL = Inventiones Mathematicae, VOLUME = 220, YEAR = 2020, NUMBER = 3, PAGES = 737--845, ISSN = 0020-9910, MRCLASS = 55N22 (03C20 55P42), MRNUMBER = 4094970, DOI = 10.1007/s00222-019-00943-9, URL = https://doi.org/10.1007/s00222-019-00943-9, doi:[10.1007/s00222-019-00943-9](https://doi.org/10.1007/s00222-019-00943-9)
342. anel2021coherent: title=The elementary infinity-topos of truncated coherent spaces, author=Anel, Mathieu, journal=arXiv preprint, year=2021, NOTE = \hrefhttps://arxiv.org/abs/2107.02082arXiv:2107.02082, arXiv:[2107.02082](https://arxiv.org/abs/2107.02082)
343. cisinskitabuada2014noncommmotive: AUTHOR = Cisinski, Denis-Charles and Tabuada, Gon\ccalo, TITLE = Lefschetz and Hirzebruch-Riemann-Roch formulas via noncommutative motives, JOURNAL = J. Noncommut. Geom., FJOURNAL = Journal of Noncommutative Geometry, VOLUME = 8, YEAR = 2014, NUMBER = 4, PAGES = 1171--1190, ISSN = 1661-6952, MRCLASS = 14A22 (14F05 18D10), MRNUMBER = 3310944, MRREVIEWER = Pawel Sosna, DOI = 10.4171/JNCG/183, URL = https://doi.org/10.4171/JNCG/183, doi:[10.4171/JNCG/183](https://doi.org/10.4171/JNCG/183)
344. cisinskideglise2016etalemotive: AUTHOR = Cisinski, Denis-Charles and D\'eglise, Fr\'ed\'eric, TITLE = \'Etale motives, JOURNAL = Compos. Math., FJOURNAL = Compositio Mathematica, VOLUME = 152, YEAR = 2016, NUMBER = 3, PAGES = 556--666, ISSN = 0010-437X, MRCLASS = 14F20 (14F42), MRNUMBER = 3477640, MRREVIEWER = Matthias Wendt, DOI = 10.1112/S0010437X15007459, URL = https://doi.org/10.1112/S0010437X15007459, doi:[10.1112/S0010437X15007459](https://doi.org/10.1112/S0010437X15007459)
345. cisinski2014univalence: title=Univalent universes for elegant models of homotopy types, author=Cisinski, Denis-Charles, journal=arXiv preprint, year=2014, NOTE = \hrefhttps://arxiv.org/abs/1406.0058arXiv:1406.0058, arXiv:[1406.0058](https://arxiv.org/abs/1406.0058)
346. nardinshah2022equivarianttopos: title=Parametrized and equivariant higher algebra, author=Denis Nardin and Jay Shah, year=2022, eprint=2203.00072, archivePrefix=arXiv, primaryClass=math.AT, note = \hrefhttps://arxiv.org/abs/2203.00072arXiv:2203.00072, arXiv:[2203.00072](https://arxiv.org/abs/2203.00072)
347. cisinskynguyen2020hottest: title=Univalence of the universal coCartesian fibration, author=Cisinski, Denis-Charles, year=2020, journal=Talk at the Homotopy Type Theory Electronic Seminar, note = \hrefhttps://www.uwo.ca/math/faculty/kapulkin/seminars/hottestfiles/Cisinski-2020-04-02-HoTTEST.pdfSlides available online
348. ross1982twotopos: AUTHOR = Street, Ross, TITLE = Two-dimensional sheaf theory, JOURNAL = J. Pure Appl. Algebra, FJOURNAL = Journal of Pure and Applied Algebra, VOLUME = 23, YEAR = 1982, NUMBER = 3, PAGES = 251--270, ISSN = 0022-4049, MRCLASS = 18F20 (18D05), MRNUMBER = 644277, MRREVIEWER = M. Barr, DOI = 10.1016/0022-4049(82)90101-3, URL = https://doi.org/10.1016/0022-4049(82)90101-3, doi:[10.1016/0022-4049(82)90101-3](https://doi.org/10.1016/0022-4049(82)90101-3)
349. bournpenon2010twotopos: AUTHOR = Bourn, Dominique and Penon, Jacques, TITLE = 2-cat\'egories r\'eductibles, NOTE = Reprint of ``2-cat\'egories r\'eductibles'' (French) [Reducible 2-categories], January 1978, JOURNAL = Repr. Theory Appl. Categ., FJOURNAL = Reprints in Theory and Applications of Categories, NUMBER = 19, YEAR = 2010, PAGES = 1--38, MRCLASS = 18A32 (18B25 18C15 18D05 18D35), MRNUMBER = 2747094, MRREVIEWER = Kimmo I. Rosenthal,
350. shulman2018jmm: title=Homotopical trinitarianism: A perspective on homotopy type theory, author=Shulman, Michael, year=2018, journal=Talk at the JMM, note = \hrefhttps://home.sandiego.edu/ shulman/papers/trinity.pdfSlides available online
351. shulman2017eht: title=Elementary $(\infty,1)$-Topoi, author=Shulman, Michael, year=2017, journal=The n-Category Cafe, note = \hrefhttps://golem.ph.utexas.edu/category/2017/04/elementary_1topoi.htmlAvailable online
352. cesnaviciusscholze2017anima: title=Purity for flat cohomology, author=Cesnavicius, Kestutis and Scholze, Peter, journal=arXiv preprint, year=2019, NOTE = \hrefhttps://arxiv.org/abs/1912.10932arXiv:1912.10932, arXiv:[1912.10932](https://arxiv.org/abs/1912.10932)
353. aczel1978setvstype: AUTHOR = Aczel, Peter, TITLE = The type theoretic interpretation of constructive set theory, BOOKTITLE = Logic Colloquium '77 (Proc. Conf., Wroc\l aw, 1977), SERIES = Stud. Logic Foundations Math., VOLUME = 96, PAGES = 55--66, PUBLISHER = North-Holland, Amsterdam-New York, YEAR = 1978, MRCLASS = 03F65 (03E70), MRNUMBER = 519801, MRREVIEWER = Herman R. Jervell,
354. church1940typetheory: AUTHOR = Church, Alonzo, TITLE = A formulation of the simple theory of types, JOURNAL = J. Symbolic Logic, FJOURNAL = The Journal of Symbolic Logic, VOLUME = 5, YEAR = 1940, PAGES = 56--68, ISSN = 0022-4812, MRCLASS = 02.0X, MRNUMBER = 1931, MRREVIEWER = H. B. Curry, DOI = 10.2307/2266170, URL = https://doi.org/10.2307/2266170, doi:[10.2307/2266170](https://doi.org/10.2307/2266170)
355. zermelo1908settheory: AUTHOR = Zermelo, E., TITLE = Untersuchungen \"uber die Grundlagen der Mengenlehre. I, JOURNAL = Math. Ann., FJOURNAL = Mathematische Annalen, VOLUME = 65, YEAR = 1908, NUMBER = 2, PAGES = 261--281, ISSN = 0025-5831, MRCLASS = DML, MRNUMBER = 1511466, DOI = 10.1007/BF01449999, URL = https://doi.org/10.1007/BF01449999, doi:[10.1007/BF01449999](https://doi.org/10.1007/BF01449999)
356. fraenkel1922settheory: AUTHOR = Fraenkel, Adolf, TITLE = Zu den Grundlagen der Cantor-Zermeloschen Mengenlehre, JOURNAL = Math. Ann., FJOURNAL = Mathematische Annalen, VOLUME = 86, YEAR = 1922, NUMBER = 3-4, PAGES = 230--237, ISSN = 0025-5831, MRCLASS = DML, MRNUMBER = 1512088, DOI = 10.1007/BF01457986, URL = https://doi.org/10.1007/BF01457986, doi:[10.1007/BF01457986](https://doi.org/10.1007/BF01457986)
357. russell1908typetheory: AUTHOR = Russell, Bertrand, TITLE = Mathematical Logic as Based on the Theory of Types, JOURNAL = Amer. J. Math., FJOURNAL = American Journal of Mathematics, VOLUME = 30, YEAR = 1908, NUMBER = 3, PAGES = 222--262, ISSN = 0002-9327, MRCLASS = DML, MRNUMBER = 1506041, DOI = 10.2307/2369948, URL = https://doi.org/10.2307/2369948, doi:[10.2307/2369948](https://doi.org/10.2307/2369948)
358. coquandhuet1988coc: AUTHOR = Coquand, Thierry and Huet, G\'erard, TITLE = The calculus of constructions, JOURNAL = Inform. and Comput., FJOURNAL = Information and Computation, VOLUME = 76, YEAR = 1988, NUMBER = 2-3, PAGES = 95--120, ISSN = 0890-5401, MRCLASS = 68Q55 (03B15 03B35 03B40 03B70), MRNUMBER = 935892, MRREVIEWER = R. P. Nederpelt, DOI = 10.1016/0890-5401(88)90005-3, URL = https://doi.org/10.1016/0890-5401(88)90005-3, doi:[10.1016/0890-5401(88)90005-3](https://doi.org/10.1016/0890-5401(88)90005-3)
359. street1982twosheaves: AUTHOR = Street, Ross, TITLE = Two-dimensional sheaf theory, JOURNAL = J. Pure Appl. Algebra, FJOURNAL = Journal of Pure and Applied Algebra, VOLUME = 23, YEAR = 1982, NUMBER = 3, PAGES = 251--270, ISSN = 0022-4049, MRCLASS = 18F20 (18D05), MRNUMBER = 644277, MRREVIEWER = M. Barr, DOI = 10.1016/0022-4049(82)90101-3, URL = https://doi.org/10.1016/0022-4049(82)90101-3, doi:[10.1016/0022-4049(82)90101-3](https://doi.org/10.1016/0022-4049(82)90101-3)
360. gindi2021nerve: AUTHOR = Gindi, Harry, TITLE = Coherent nerves for higher quasicategories, JOURNAL = Theory Appl. Categ., FJOURNAL = Theory and Applications of Categories, VOLUME = 37, YEAR = 2021, PAGES = Paper No. 23, 709--817, MRCLASS = 18D20 (18A30 18E35 18N40 55U35), MRNUMBER = 4276763,
361. mrr2022nerves: title=Homotopy coherent nerves of enriched categories, author=Moser, Lyne and Rasekh, Nima and Rovelli, Martina, journal=arXiv preprint, year=2022, NOTE = \hrefhttps://arxiv.org/abs/2208.02745arXiv:2208.02745 arXiv:[2208.02745](https://arxiv.org/abs/2208.02745)
362. cherradi2022hottsemantics: title=Interpreting type theory in a quasicategory: a Yoneda approach, author=Cherradi, El Mehdi, journal=arXiv preprint, year=2022, NOTE = \hrefhttps://arxiv.org/abs/2207.01967arXiv:2207.01967, arXiv:[2207.01967](https://arxiv.org/abs/2207.01967)
363. land2021qcat: AUTHOR = Land, Markus, TITLE = Introduction to infinity-categories, SERIES = Compact Textbooks in Mathematics, PUBLISHER = Birkh\"auser/Springer, Cham, YEAR = 2021, PAGES = ix+296, ISBN = 978-3-030-61523-9; 978-3-030-61524-6, MRCLASS = 18-02 (18N50 18N55 18N60), MRNUMBER = 4259746, MRREVIEWER = Gijs\ Heuts, DOI = 10.1007/978-3-030-61524-6, URL = https://doi.org/10.1007/978-3-030-61524-6, doi:[10.1007/978-3-030-61524-6](https://doi.org/10.1007/978-3-030-61524-6)
364. scholze2019condensed: title=Lectures on Condensed Mathematics, author=Scholze, Peter, NOTE = \hrefhttps://www.math.uni-bonn.de/people/scholze/Condensed.pdfUnpublished notes, year=2019
365. barwickhaine2019pyknotic: title=Pyknotic objects, I. Basic notions, author=Barwick, Clark and Haine, Peter, year=2019, NOTE = \hrefhttps://arxiv.org/abs/1904.09966arXiv:1904.09966, arXiv:[1904.09966](https://arxiv.org/abs/1904.09966)
366. schreiber2013cohesive: title=Differential cohomology in a cohesive infinity-topos, author=Schreiber, Urs, year=2013, NOTE = \hrefhttps://arxiv.org/abs/1310.7930arXiv:1310.7930, arXiv:[1310.7930](https://arxiv.org/abs/1310.7930)
367. carchedi2020topoi: AUTHOR = Carchedi, David Joseph, TITLE = Higher orbifolds and Deligne-Mumford stacks as structured infinity-topoi, JOURNAL = Mem. Amer. Math. Soc., FJOURNAL = Memoirs of the American Mathematical Society, VOLUME = 264, YEAR = 2020, NUMBER = 1282, PAGES = v+120, ISSN = 0065-9266, ISBN = 978-1-4704-4144-9; 978-1-4704-5810-2, MRCLASS = 14A30 (14D23 18B25 58A03), MRNUMBER = 4075269, MRREVIEWER = Laura Pertusi, DOI = 10.1090/memo/1282, URL = https://doi.org/10.1090/memo/1282, doi:[10.1090/memo/1282](https://doi.org/10.1090/memo/1282)
368. clough2021fracturedtopos: AUTHOR = Clough, Adrian, TITLE = A convenient category for geometric topology, PUBLISHER = Thesis (Ph.D.)--University of Texas at Austin, NOTE = \hrefhttps://repositories.lib.utexas.edu/handle/2152/114981Unpublished notes, YEAR=2021,
369. haine2022condensed: title=Descent for sheaves on compact Hausdorff spaces, author=Haine, Peter, year=2022, NOTE = \hrefhttps://arxiv.org/abs/2210.00186arXiv:2210.00186, arXiv:[2210.00186](https://arxiv.org/abs/2210.00186)
370. yamazaki2022condensed: title=Condensed Sets on Compact Hausdorff Spaces, author=Yamazaki, Koji, journal=arXiv preprint, year=2022, NOTE = \hrefhttps://arxiv.org/abs/2211.13855arXiv:2211.13855, arXiv:[2211.13855](https://arxiv.org/abs/2211.13855)
371. lawvere2007cohesion: AUTHOR = Lawvere, F. William, TITLE = Axiomatic cohesion, JOURNAL = Theory Appl. Categ., FJOURNAL = Theory and Applications of Categories, VOLUME = 19, YEAR = 2007, PAGES = No. 3, 41--49, ISSN = 1201-561X, MRCLASS = 18A40 (18A25 18B30), MRNUMBER = 2369017,
372. myersriley2023cohesion: title=Commuting Cohesions, author=Myers, David Jaz and Riley, Mitchell, journal=arXiv preprint, year=2023, NOTE = \hrefhttps://arxiv.org/abs/2301.13780arXiv:2301.13780, arXiv:[2301.13780](https://arxiv.org/abs/2301.13780)
373. brueckler2018geschichtekompakt: author = Brueckler, Franka, year = 2018, month = 01, pages = , title = Geschichte der Mathematik kompakt: Das Wichtigste aus Analysis, Wahrscheinlichkeitstheorie, angewandter Mathematik, Topologie und Mengenlehre, isbn = 978-3-662-55573-6, doi = 10.1007/978-3-662-55574-3 doi:[10.1007/978-3-662-55574-3](https://doi.org/10.1007/978-3-662-55574-3)
374. hausdorff1914grundzuege: AUTHOR = Hausdorff, Felix, TITLE = Grundz\"uge der Mengenlehre, PUBLISHER = Chelsea Publishing Co., New York, YEAR = 1949, PAGES = viii+476, MRCLASS = 27.2X, MRNUMBER = 31025,
375. SGA4: AUTHOR = "Artin, Michael and Grothendieck, Alexander and Verdier, Jean-Louis", TITLE = "Theorie de Topos et Cohomologie Etale des Schemas I, II, III", PUBLISHER = "Springer", YEAR = "1971", SERIES = "Lecture Notes in Mathematics", VOLUME = "269, 270, 305"
376. sati2020proper: title=Proper Orbifold Cohomology, author=Hisham Sati and Urs Schreiber, year=2020, NOTE = \hrefhttps://arxiv.org/pdf/2008.01101.pdfarXiv:2008.01101, arXiv:[2008.01101](https://arxiv.org/abs/2008.01101)
377. iversen1986cohomology: AUTHOR = Iversen, Birger, TITLE = Cohomology of sheaves, SERIES = Universitext, PUBLISHER = Springer-Verlag, Berlin, YEAR = 1986, PAGES = xii+464, ISBN = 3-540-16389-1, MRCLASS = 14F05 (14-01 18-01 54-01), MRNUMBER = 842190, MRREVIEWER = G. Horrocks, DOI = 10.1007/978-3-642-82783-9, URL = https://doi.org/10.1007/978-3-642-82783-9, doi:[10.1007/978-3-642-82783-9](https://doi.org/10.1007/978-3-642-82783-9)
378. slaoui2020sheafcohomology: title=A primer on Sheaf Theory and Sheaf Cohomology, author=Saad, Slaoui, journal = Online Note, year=2020, NOTE = \hrefhttps://web.ma.utexas.edu/users/slaoui/notes/Sheaf_Cohomology_3.pdfOnline Note,
379. tu2022sheafcohomology: title=Introduction to Sheaf Cohomology, author=Tu, Loring, journal = arXiv preprint, year=2022, NOTE = \hrefhttps://arxiv.org/pdf/2206.07512.pdfarXiv:2206.07512, arXiv:[2206.07512](https://arxiv.org/abs/2206.07512)
380. petersen2021sheafcohomology: title=A remark on singular cohomology and sheaf cohomology, author=Petersen, Dan, journal = arXiv preprint, year=2021, NOTE = \hrefhttps://arxiv.org/pdf/2102.06927.pdfarXiv:2102.06927, arXiv:[2102.06927](https://arxiv.org/abs/2102.06927)
381. scholze2022sixfunctors: title=Six-Functor Formalisms, author=Scholze, Peter, NOTE = \hrefhttps://people.mpim-bonn.mpg.de/scholze/SixFunctors.pdfUnpublished notes, year=2022
382. volpe2021sixfunctors: title=The six operations in topology, author=Volpe, Marco, journal = arXiv preprint, year=2021, NOTE = \hrefhttps://arxiv.org/pdf/2110.10212.pdfarXiv:2110.10212, arXiv:[2110.10212](https://arxiv.org/abs/2110.10212)
383. hpt2020sixfunctors: title=The homotopy-invariance of constructible sheaves, author=Haine, Peter and Porta, Mauro and Teyssier, Jean-Baptiste, journal = arXiv preprint, year=2020, NOTE = \hrefhttps://arxiv.org/pdf/2010.06473.pdfarXiv:2010.06473, arXiv:[2010.06473](https://arxiv.org/abs/2010.06473)
384. mair2021animated: title=Animated Condensed Sets and Their Homotopy Groups, author=Mair, Catrin, year=2021, NOTE = \hrefhttps://arxiv.org/pdf/2206.07512.pdfarXiv:2206.07512, arXiv:[2206.07512](https://arxiv.org/abs/2206.07512)
385. lurie2019ultracategories: title=Ultracategories, author=Lurie, Jacob, NOTE = \hrefhttps://www.math.ias.edu/ lurie/papers/Conceptual.pdfUnpublished notes, year=2019
386. Gleason1958ProjectiveTS: AUTHOR = Gleason, Andrew M., TITLE = Projective topological spaces, JOURNAL = Illinois J. Math., FJOURNAL = Illinois Journal of Mathematics, VOLUME = 2, YEAR = 1958, PAGES = 482--489, ISSN = 0019-2082, MRCLASS = 54.00, MRNUMBER = 121775, MRREVIEWER = Dana\ Scott, URL = http://projecteuclid.org/euclid.ijm/1255454110,
387. cnossen2023partial: title=Partial parametrized presentability and the universal property of equivariant spectra, author=Bastiaan Cnossen and Tobias Lenz and Sil Linskens, year=2023, eprint=2307.11001, archivePrefix=arXiv, primaryClass=math.AT, NOTE = \hrefhttps://arxiv.org/pdf/2307.11001.pdfarXiv:2307.11001 arXiv:[2307.11001](https://arxiv.org/abs/2307.11001)
388. book: author = Arhangel'skii, Alexander and Tkachenko, Mikhail, year = 2008, month = 01, pages = , title = Topological Groups and Related Structures, isbn = 978-94-91216-35-0, doi = 10.2991/978-94-91216-35-0 doi:[10.2991/978-94-91216-35-0](https://doi.org/10.2991/978-94-91216-35-0)
389. aoki2023tens: AUTHOR = Aoki, Ko, TITLE = Tensor triangular geometry of filtered objects and sheaves, JOURNAL = Math. Z., FJOURNAL = Mathematische Zeitschrift, VOLUME = 303, YEAR = 2023, NUMBER = 3, PAGES = Paper No. 62, 27, ISSN = 0025-5874,1432-1823, MRCLASS = 18G80 (18F20 18F70 18N60), MRNUMBER = 4549105, MRREVIEWER = Maosong\ Xiang, DOI = 10.1007/s00209-023-03210-z, URL = https://doi.org/10.1007/s00209-023-03210-z, doi:[10.1007/s00209-023-03210-z](https://doi.org/10.1007/s00209-023-03210-z)
390. hoyois2014: author = Hoyois, Marc, year = 2014, month = 12, pages = 3603-3658, title = A quadratic refinement of the Grothendieck–Lefschetz–Verdier trace formula, volume = 14, journal = Algebraic \& Geometric Topology, doi = 10.2140/agt.2014.14.3603 doi:[10.2140/agt.2014.14.3603](https://doi.org/10.2140/agt.2014.14.3603)
391. johnstone1982stone: AUTHOR = Johnstone, Peter T., TITLE = Stone spaces, SERIES = Cambridge Studies in Advanced Mathematics, VOLUME = 3, NOTE = Reprint of the 1982 edition, PUBLISHER = Cambridge University Press, Cambridge, YEAR = 1986, PAGES = xxii+370, ISBN = 0-521-33779-8, MRCLASS = 54-02 (06E15 18-02 46E05), MRNUMBER = 861951,
392. barwick2020exodromy: title=Exodromy, author=Clark Barwick and Saul Glasman and Peter Haine, year=2020, eprint=1807.03281, archivePrefix=arXiv, primaryClass=math.AT, NOTE = \hrefhttps://arxiv.org/pdf/1807.03281.pdfarXiv:1807.03281 arXiv:[1807.03281](https://arxiv.org/abs/1807.03281)
393. haine2022homotopyinvariance: title=The homotopy-invariance of constructible sheaves, author=Peter J. Haine and Mauro Porta and Jean-Baptiste Teyssier, year=2022, eprint=2010.06473, archivePrefix=arXiv, primaryClass=math.AT, NOTE = \hrefhttps://arxiv.org/pdf/2010.06473.pdfarXiv:2010.06473 arXiv:[2010.06473](https://arxiv.org/abs/2010.06473)
394. clough2023homotopy: title=The homotopy theory of differentiable sheaves, author=Adrian Clough, year=2023, eprint=2309.01757, archivePrefix=arXiv, primaryClass=math.AT, NOTE = \hrefhttps://arxiv.org/pdf/2309.01757.pdfarXiv:2309.01757 arXiv:[2309.01757](https://arxiv.org/abs/2309.01757)
395. Dyckhoff1976CategoricalMI: AUTHOR = Dyckhoff, Roy, TITLE = Categorical methods in dimension theory, BOOKTITLE = Categorical topology (Proc. Conf., Mannheim, 1975), SERIES = Lecture Notes in Math., VOLUME = Vol. 540, PAGES = 220--242, PUBLISHER = Springer, Berlin-New York, YEAR = 1976, MRCLASS = 54F45 (18A99), MRNUMBER = 448318, MRREVIEWER = A.\ V.\ Zarelua,
396. hindman2012: AUTHOR = Hindman, Neil and Strauss, Dona, TITLE = Algebra in the Stone-\vCech compactification, SERIES = De Gruyter Textbook, EDITION = extended, NOTE = Theory and applications, PUBLISHER = Walter de Gruyter \& Co., Berlin, YEAR = 2012, PAGES = xviii+591, ISBN = 978-3-11-025623-9, MRCLASS = 54-02 (03E05 22A15 54D35 54H99), MRNUMBER = 2893605,
397. tsaban: title=Numbers and Colors, author=Tsaban, Boaz, NOTE = \hrefhttps://u.cs.biu.ac.il/ tsaban/RT/Book/BookSkeleton.pdfUnpublished notes,
398. bradley2020: AUTHOR = Bradley, Tai-Danae and Bryson, Tyler and Terilla, John, TITLE = Topology---a categorical approach, PUBLISHER = MIT Press, Cambridge, MA, YEAR = 2020, PAGES = x+156, ISBN = 978-0-262-53935-7, MRCLASS = 54-01 (18Axx 18F60 54B30 55-01), MRNUMBER = 4232168, MRREVIEWER = Thomas\ Weighill,
399. gabriel1967: AUTHOR = Gabriel, P. and Zisman, M., TITLE = Calculus of fractions and homotopy theory, SERIES = Ergebnisse der Mathematik und ihrer Grenzgebiete [Results in Mathematics and Related Areas], VOLUME = Band 35, PUBLISHER = Springer-Verlag New York, Inc., New York, YEAR = 1967, PAGES = x+168, MRCLASS = 55.40 (18.00), MRNUMBER = 210125, MRREVIEWER = A.\ K.\ Bousfield,
400. Loregian_2021: doi = 10.1017/9781108778657, url = https://doi.org/10.1017%2F9781108778657, year = 2021, publisher = Cambridge University Press, author = Fosco Loregian, title = (Co)end Calculus, doi:[10.1017/9781108778657](https://doi.org/10.1017/9781108778657)
401. schwede_2018: place=Cambridge, series=New Mathematical Monographs, title=Global Homotopy Theory, DOI=10.1017/9781108349161, publisher=Cambridge University Press, author=Schwede, Stefan, year=2018, collection=New Mathematical Monographs doi:[10.1017/9781108349161](https://doi.org/10.1017/9781108349161)
402. lewis2006equivariant: title=Equivariant Stable Homotopy Theory, author=Lewis, L.G.J. and McClure, J.E. and May, J.P. and Steinberger, M., isbn=9783540470779, lccn=86025968, series=Lecture Notes in Mathematics, url=https://books.google.de/books?id=XK56CwAAQBAJ, year=2006, publisher=Springer Berlin Heidelberg
403. colemichaelgreenless2000equivariantformalgrouplaws: author = Cole, Michael and Greenlees, J. P. C. and Kriz, I., title = "Equivariant Formal Group Laws", journal = Proceedings of the London Mathematical Society, volume = 81, number = 2, pages = 355-386, year = 2000, month = 09, abstract = "Motivated by complex oriented equivariant cohomology theories, we give a natural algebraic definition of an A-equivariant formal group law for any abelian compact Lie group A. The complex oriented cohomology of the classifying space for line bundles gives an example. We also show how the choice of a complete flag gives rise to a basis and a means of calculation. This allows us to deduce that there is a universal ring LA for A-equivariant formal group laws and that it is generated by the Euler classes and the coefficients of the coproduct of the orientation. We study a number of topological cases in some detail. 1991 Mathematics Subject Classification: 14L05, 55N22, 55N91, 57R85.", issn = 0024-6115, doi = 10.1112/S0024611500012466, url = https://doi.org/10.1112/S0024611500012466, eprint = https://academic.oup.com/plms/article-pdf/81/2/355/4471224/81-2-355.pdf, doi:[10.1112/S0024611500012466](https://doi.org/10.1112/S0024611500012466)
404. Hausmann2019GlobalGL: title=Global group laws and equivariant bordism rings, author=Markus Hausmann, journal=Annals of Mathematics, year=2019, url=https://api.semanticscholar.org/CorpusID:209376168
405. WASSERMAN1969127: title = Equivariant differential topology, journal = Topology, volume = 8, number = 2, pages = 127-150, year = 1969, issn = 0040-9383, doi = https://doi.org/10.1016/0040-9383(69)90005-6, url = https://www.sciencedirect.com/science/article/pii/0040938369900056, author = Arthur G. Wasserman doi:[https://doi.org/10.1016/0040-9383(69)90005-6](https://doi.org/https://doi.org/10.1016/0040-9383(69)90005-6)
406. bousfieldfriedlanderHomotopyTheoryOfGammaSpaces: author="Bousfield, A. K. and Friedlander, E. M.", editor="Barratt, M. G. and Mahowald, M. E.", title="Homotopy theory of $\Gamma$-spaces, spectra, and bisimplicial sets", booktitle="Geometric Applications of Homotopy Theory II", year="1978", publisher="Springer Berlin Heidelberg", address="Berlin, Heidelberg", pages="80--130", isbn="978-3-540-35808-4"
407. hss:symmetric: author = Hovey, Mark and Shipley, Brooke and Smith, Jeff, fjournal = Journal of the American Mathematical Society, issn = 0894-0347, journal = J. Amer. Math. Soc., mrclass = 55P42 (18D10 18D50 18G30 18G55 55U10 55U35), mrnumber = MR1695653 (2000h:55016), mrreviewer = J. P. C. Greenlees, number = 1, pages = 149--208, title = Symmetric spectra, volume = 13, year = 2000
408. mandellmayschwedeshipley: author = Mandell, M. A. and May, J. P. and Schwede, S. and Shipley, B., title = "Model Categories of Diagram Spectra", journal = Proceedings of the London Mathematical Society, volume = 82, number = 2, pages = 441-512, year = 2001, month = 03, abstract = "Working in the category T of based spaces, we give the basic theory of diagram spaces and diagram spectra. These are functorsD→T for a suitable small topological categoryD. WhenD is symmetric monoidal, there is a smash product that gives the category of D-spaces a symmetric monoidal structure. Examples includeprespectra, as defined classically,symmetric spectra, as defined by Jeff Smith,orthogonal spectra, a coordinate-free analogue of symmetric spectra with symmetric groups replaced by orthogonal groups in the domain category,Γ-spaces, as defined by Graeme Segal,W-spaces, an analogue of Γ-spaces with finite sets replaced by finite CW complexes in the domain category. We construct and compare model structures on these categories. With the caveat that Γ-spaces are always connective, these categories, and their simplicial analogues, are Quillen equivalent and their associated homotopy categories are equivalent to the classical stable homotopy category. Monoids in these categories are (strict) ring spectra. Often the subcategories of ring spectra, module spectra over a ring spectrum, and commutative ring spectra are also model categories. When this holds, the respective categories of ring and module spectra are Quillen equivalent and thus have equivalent homotopy categories. This allows interchangeable use of these categories in applications.2000Mathematics Subject Classification: primary 55P42; secondary 18A25, 18E30, 55U35.", issn = 0024-6115, doi = 10.1112/S0024611501012692, url = https://doi.org/10.1112/S0024611501012692, eprint = https://academic.oup.com/plms/article-pdf/82/2/441/4253038/82-2-441.pdf, doi:[10.1112/S0024611501012692](https://doi.org/10.1112/S0024611501012692)
409. mandellmay2002EquivariantOrthogonal: author = Mandell, MA and May, J., year = 2002, month = 09, pages = 0-0, title = Equivariant orthogonal spectra and S-modules, volume = 159, journal = Memoirs of the American Mathematical Society, doi = 10.1090/memo/0755 doi:[10.1090/memo/0755](https://doi.org/10.1090/memo/0755)
410. Brun2016EquivariantSO: title=Equivariant Structure on Smash Powers, author=Morten Brun and Bj\orn Ian Dundas and Martin Stolz, journal=arXiv: Algebraic Topology, year=2016, url=https://api.semanticscholar.org/CorpusID:119708225
411. hillhopkinsravenel2009Kervaire: author = Hill, Michael and Hopkins, Michael and Ravenel, Douglas, year = 2009, month = 08, pages = , title = On the non-existence of elements of Kervaire invariant one, volume = 184, journal = Annals of Mathematics, doi = 10.4007/annals.2016.184.1.1 doi:[10.4007/annals.2016.184.1.1](https://doi.org/10.4007/annals.2016.184.1.1)
412. hopkinslawson2018: AUTHOR = Hopkins, Michael J. and Lawson, Tyler, TITLE = Strictly commutative complex orientation theory, JOURNAL = Math. Z., FJOURNAL = Mathematische Zeitschrift, VOLUME = 290, YEAR = 2018, NUMBER = 1-2, PAGES = 83--101, ISSN = 0025-5874,1432-1823, MRCLASS = 55P42 (19D55 55N15), MRNUMBER = 3848424, MRREVIEWER = Bj\o rn\ Ian\ Dundas, DOI = 10.1007/s00209-017-2009-6, URL = https://doi.org/10.1007/s00209-017-2009-6, doi:[10.1007/s00209-017-2009-6](https://doi.org/10.1007/s00209-017-2009-6)
413. hausmannostermayr2020: AUTHOR = Hausmann, Markus and Ostermayr, Dominik, TITLE = Filtrations of global equivariant $K$-theory, JOURNAL = Math. Z., FJOURNAL = Mathematische Zeitschrift, VOLUME = 295, YEAR = 2020, NUMBER = 1-2, PAGES = 161--210, ISSN = 0025-5874,1432-1823, MRCLASS = 19L47 (55P42 55P91), MRNUMBER = 4100005, MRREVIEWER = Dae-Woong\ Lee, DOI = 10.1007/s00209-019-02338-1, URL = https://doi.org/10.1007/s00209-019-02338-1, doi:[10.1007/s00209-019-02338-1](https://doi.org/10.1007/s00209-019-02338-1)
414. BHNNNS2019: AUTHOR = Barthel, Tobias and Hausmann, Markus and Naumann, Niko and Nikolaus, Thomas and Noel, Justin and Stapleton, Nathaniel, TITLE = The Balmer spectrum of the equivariant homotopy category of a finite abelian group, JOURNAL = Invent. Math., FJOURNAL = Inventiones Mathematicae, VOLUME = 216, YEAR = 2019, NUMBER = 1, PAGES = 215--240, ISSN = 0020-9910,1432-1297, MRCLASS = 55P42 (18E30 55U35), MRNUMBER = 3935041, MRREVIEWER = Julia\ Bergner, DOI = 10.1007/s00222-018-0846-5, URL = https://doi.org/10.1007/s00222-018-0846-5, doi:[10.1007/s00222-018-0846-5](https://doi.org/10.1007/s00222-018-0846-5)
415. ando1992operations: AUTHOR = Ando, Matthew, TITLE = Operations in complex-oriented cohomology theories related to subgroups of formal groups, NOTE = Thesis (Ph.D.)--Massachusetts Institute of Technology, PUBLISHER = ProQuest LLC, Ann Arbor, MI, YEAR = 1992, PAGES = (no paging), MRCLASS = 99-05, MRNUMBER = 2716371, URL = http://gateway.proquest.com/openurl?url_ver=Z39.88-2004&rft_val_fmt=info:ofi/fmt:kev:mtx:dissertation&res_dat=xri:pqdiss&rft_dat=xri:pqdiss:0572308,
416. hebestreitwagner: title=Algebraic and Hermitian $K$-Theory, author=Hebestreit, Fabian and Wagner, Ferdinand, year=2021, NOTE = \hrefhttps://florianadler.github.io/AlgebraBonn/KTheory.pdfLecture Notes,
417. abghr2014units: AUTHOR = Ando, Matthew and Blumberg, Andrew J. and Gepner, David and Hopkins, Michael J. and Rezk, Charles, TITLE = Units of ring spectra, orientations and Thom spectra via rigid infinite loop space theory, JOURNAL = J. Topol., FJOURNAL = Journal of Topology, VOLUME = 7, YEAR = 2014, NUMBER = 4, PAGES = 1077--1117, ISSN = 1753-8416,1753-8424, MRCLASS = 55P43 (55N34 55R65), MRNUMBER = 3286898, MRREVIEWER = Steven\ R.\ Costenoble, DOI = 10.1112/jtopol/jtu009, URL = https://doi.org/10.1112/jtopol/jtu009, doi:[10.1112/jtopol/jtu009](https://doi.org/10.1112/jtopol/jtu009)
418. hausmann2022globalgrouplaws: AUTHOR = Hausmann, Markus, TITLE = Global group laws and equivariant bordism rings, JOURNAL = Ann. of Math. (2), FJOURNAL = Annals of Mathematics. Second Series, VOLUME = 195, YEAR = 2022, NUMBER = 3, PAGES = 841--910, ISSN = 0003-486X,1939-8980, MRCLASS = 57R85 (14L05 55N22 55P91), MRNUMBER = 4413745, MRREVIEWER = Jason\ Stuart\ Hanson, DOI = 10.4007/annals.2022.195.3.2, URL = https://doi.org/10.4007/annals.2022.195.3.2, doi:[10.4007/annals.2022.195.3.2](https://doi.org/10.4007/annals.2022.195.3.2)
419. barwick2017spectral: AUTHOR = Barwick, Clark, TITLE = Spectral Mackey functors and equivariant algebraic $K$-theory (I), JOURNAL = Adv. Math., FJOURNAL = Advances in Mathematics, VOLUME = 304, YEAR = 2017, PAGES = 646--727, ISSN = 0001-8708,1090-2082, MRCLASS = 19L47 (19D99 55P91), MRNUMBER = 3558219, MRREVIEWER = Anna\ Marie\ Bohmann, DOI = 10.1016/j.aim.2016.08.043, URL = https://doi.org/10.1016/j.aim.2016.08.043, doi:[10.1016/j.aim.2016.08.043](https://doi.org/10.1016/j.aim.2016.08.043)
420. linskens2022global: AUTHOR = Linskens, Sil and Nardin, Denis and Pol, Luca, TITLE = Global homotopy theory via partially lax limits, JOURNAL = Geom. Topol., FJOURNAL = Geometry \& Topology, VOLUME = 29, YEAR = 2025, NUMBER = 3, PAGES = 1345--1440, ISSN = 1465-3060,1364-0380, MRCLASS = 55N91 (18N70 55P91), MRNUMBER = 4918109, DOI = 10.2140/gt.2025.29.1345, URL = https://doi.org/10.2140/gt.2025.29.1345, doi:[10.2140/gt.2025.29.1345](https://doi.org/10.2140/gt.2025.29.1345)
421. aronelesh2007filtered: AUTHOR = Arone, Gregory and Lesh, Kathryn, TITLE = Filtered spectra arising from permutative categories, JOURNAL = J. Reine Angew. Math., FJOURNAL = Journal f\"ur die Reine und Angewandte Mathematik. [Crelle's Journal], VOLUME = 604, YEAR = 2007, PAGES = 73--136, ISSN = 0075-4102,1435-5345, MRCLASS = 55P42 (18D10 55N15 55P47), MRNUMBER = 2320314, MRREVIEWER = Julia\ Bergner, DOI = 10.1515/CRELLE.2007.020, URL = https://doi.org/10.1515/CRELLE.2007.020, doi:[10.1515/CRELLE.2007.020](https://doi.org/10.1515/CRELLE.2007.020)
422. aronelesh2010augmented: AUTHOR = Arone, Gregory Z. and Lesh, Kathryn, TITLE = Augmented $\Gamma$-spaces, the stable rank filtration, and a $bu$ analogue of the Whitehead conjecture, JOURNAL = Fund. Math., FJOURNAL = Fundamenta Mathematicae, VOLUME = 207, YEAR = 2010, NUMBER = 1, PAGES = 29--70, ISSN = 0016-2736,1730-6329, MRCLASS = 55P48 (19L41 55P65 55P91 55R45), MRNUMBER = 2576278, MRREVIEWER = J\'er\^ome\ Scherer, DOI = 10.4064/fm207-1-3, URL = https://doi.org/10.4064/fm207-1-3, doi:[10.4064/fm207-1-3](https://doi.org/10.4064/fm207-1-3)
423. hausmann2018symmetricproducts: AUTHOR = Hausmann, Markus, TITLE = Symmetric products and subgroup lattices, JOURNAL = Geom. Topol., FJOURNAL = Geometry \& Topology, VOLUME = 22, YEAR = 2018, NUMBER = 3, PAGES = 1547--1591, ISSN = 1465-3060,1364-0380, MRCLASS = 55P62 (55P42 55P91), MRNUMBER = 3780441, MRREVIEWER = Donald\ M.\ Davis, DOI = 10.2140/gt.2018.22.1547, URL = https://doi.org/10.2140/gt.2018.22.1547, doi:[10.2140/gt.2018.22.1547](https://doi.org/10.2140/gt.2018.22.1547)
424. greenlees2000equivariantfglandcomplex: AUTHOR = Greenlees, J. P. C., TITLE = Equivariant formal group laws and complex oriented cohomology theories, NOTE = Equivariant stable homotopy theory and related areas (Stanford, CA, 2000), JOURNAL = Homology Homotopy Appl., FJOURNAL = Homology, Homotopy and Applications, VOLUME = 3, YEAR = 2001, NUMBER = 2, PAGES = 225--263, ISSN = 1532-0081, MRCLASS = 55N91 (14L05 19L47 55N22 57R85), MRNUMBER = 1856028, MRREVIEWER = Mark\ Hovey, DOI = 10.4310/hha.2001.v3.n2.a1, URL = https://doi.org/10.4310/hha.2001.v3.n2.a1, doi:[10.4310/hha.2001.v3.n2.a1](https://doi.org/10.4310/hha.2001.v3.n2.a1)
425. segal1968equivariantK: AUTHOR = Segal, Graeme, TITLE = Equivariant $K$-theory, JOURNAL = Inst. Hautes \'Etudes Sci. Publ. Math., FJOURNAL = Institut des Hautes \'Etudes Scientifiques. Publications Math\'ematiques, NUMBER = 34, YEAR = 1968, PAGES = 129--151, ISSN = 0073-8301,1618-1913, MRCLASS = 55.30, MRNUMBER = 234452, MRREVIEWER = S.\ Y.\ Husseini, URL = http://www.numdam.org/item?id=PMIHES_1968__34__129_0,
426. pützstück2024parametrized: title=Parametrized Higher Algebra and Global Picard Spectra, author=Pützstück, Phil, year=2024, NOTE = \hrefhttps://philpuetzstueck.gitlab.io/documents/msc_thesis.pdfMaster's Thesis,
427. barkanhaugsengsteinebrunner2024envelopesalgebraicpatterns: title=Envelopes for Algebraic Patterns, author=Shaul Barkan and Rune Haugseng and Jan Steinebrunner, year=2024, eprint=2208.07183, archivePrefix=arXiv, primaryClass=math.CT, NOTE = \hrefhttps://arxiv.org/abs/2208.07183arXiv:2208.07183, arXiv:[2208.07183](https://arxiv.org/abs/2208.07183)
428. hahn2024equivariantnonabelianpoincareduality: title=Equivariant nonabelian Poincar\'e duality and equivariant factorization homology of Thom spectra, author=Jeremy Hahn and Asaf Horev and Inbar Klang and Dylan Wilson and Foling Zou, year=2024, eprint=2006.13348, archivePrefix=arXiv, primaryClass=math.AT, NOTE = \hrefhttps://arxiv.org/abs/2006.13348arXiv:2006.13348, arXiv:[2006.13348](https://arxiv.org/abs/2006.13348)
429. shah2023parametrized: AUTHOR = Shah, Jay, TITLE = Parametrized higher category theory, JOURNAL = Algebr. Geom. Topol., FJOURNAL = Algebraic \& Geometric Topology, VOLUME = 23, YEAR = 2023, NUMBER = 2, PAGES = 509--644, ISSN = 1472-2747,1472-2739, MRCLASS = 55U35 (55U10 55U40), MRNUMBER = 4587313, MRREVIEWER = Philippe\ Gaucher, DOI = 10.2140/agt.2023.23.509, URL = https://doi.org/10.2140/agt.2023.23.509, doi:[10.2140/agt.2023.23.509](https://doi.org/10.2140/agt.2023.23.509)
430. shah2022parametrizedhighercategorytheory: title=Parametrized higher category theory II: Universal constructions, author=Jay Shah, year=2022, eprint=2109.11954, archivePrefix=arXiv, primaryClass=math.CT, url=https://arxiv.org/abs/2109.11954, arXiv:[2109.11954](https://arxiv.org/abs/2109.11954)
431. hilman2024parametrisedpresentability: AUTHOR = Hilman, Kaif, TITLE = Parametrised presentability over orbital categories, JOURNAL = Appl. Categ. Structures, FJOURNAL = Applied Categorical Structures. A Journal Devoted to Applications of Categorical Methods in Algebra, Analysis, Computer Science, Logic, Order and Topology, VOLUME = 32, YEAR = 2024, NUMBER = 3, PAGES = Paper No. 15, 53, ISSN = 0927-2852,1572-9095, MRCLASS = 18N40 (18C35), MRNUMBER = 4756154, DOI = 10.1007/s10485-024-09772-1, URL = https://doi.org/10.1007/s10485-024-09772-1, doi:[10.1007/s10485-024-09772-1](https://doi.org/10.1007/s10485-024-09772-1)
432. reutter2025enrichedinftycategoriesmarkedmodule: title=Enriched $\infty$-categories as marked module categories, author=David Reutter and Markus Zetto, year=2025, eprint=2501.07697, archivePrefix=arXiv, primaryClass=math.AT, NOTE = \hrefhttps://arxiv.org/abs/2501.07697arXiv:2501.07697, arXiv:[2501.07697](https://arxiv.org/abs/2501.07697)
433. andoblumberggepner2018parametrized: AUTHOR = Ando, Matthew and Blumberg, Andrew J. and Gepner, David, TITLE = Parametrized spectra, multiplicative Thom spectra and the twisted Umkehr map, JOURNAL = Geom. Topol., FJOURNAL = Geometry \& Topology, VOLUME = 22, YEAR = 2018, NUMBER = 7, PAGES = 3761--3825, ISSN = 1465-3060,1364-0380, MRCLASS = 55P43 (55R70), MRNUMBER = 3890766, MRREVIEWER = Birgit\ Richter, DOI = 10.2140/gt.2018.22.3761, URL = https://doi.org/10.2140/gt.2018.22.3761, doi:[10.2140/gt.2018.22.3761](https://doi.org/10.2140/gt.2018.22.3761)
434. bonventre2019genuineoperadic: AUTHOR = Bonventre, Peter, TITLE = The genuine operadic nerve, JOURNAL = Theory Appl. Categ., FJOURNAL = Theory and Applications of Categories, VOLUME = 34, YEAR = 2019, PAGES = 736--780, ISSN = 1201-561X, MRCLASS = 55P48 (18M60 19D23 55P91), MRNUMBER = 4011810, MRREVIEWER = Steffen\ Sagave,
435. ramzi2022monoidalgrothendieckconstructioninftycategories: title=A monoidal Grothendieck construction for $\infty$-categories, author=Maxime Ramzi, year=2022, eprint=2209.12569, archivePrefix=arXiv, primaryClass=math.CT, NOTE = \hrefhttps://arxiv.org/abs/2209.12569arXiv:2209.12569, arXiv:[2209.12569](https://arxiv.org/abs/2209.12569)
436. haugsengmelanisafronov2022shiftedisotropic: AUTHOR = Haugseng, Rune and Melani, Valerio and Safronov, Pavel, TITLE = Shifted coisotropic correspondences, JOURNAL = J. Inst. Math. Jussieu, FJOURNAL = Journal of the Institute of Mathematics of Jussieu. JIMJ. Journal de l'Institut de Math\'ematiques de Jussieu, VOLUME = 21, YEAR = 2022, NUMBER = 3, PAGES = 785--849, ISSN = 1474-7480,1475-3030, MRCLASS = 14A20 (17B63 18N60), MRNUMBER = 4404126, MRREVIEWER = Stefan\ Schr\"oer, DOI = 10.1017/S1474748020000274, URL = https://doi.org/10.1017/S1474748020000274, doi:[10.1017/S1474748020000274](https://doi.org/10.1017/S1474748020000274)
437. stewart2025equivariantoperadssymmetricsequences: title=Equivariant operads, symmetric sequences, and Boardman--Vogt tensor products, author=Natalie Stewart, year=2025, eprint=2501.02129, archivePrefix=arXiv, primaryClass=math.CT, NOTE = \hrefhttps://arxiv.org/abs/2501.02129arXiv:2501.02129, arXiv:[2501.02129](https://arxiv.org/abs/2501.02129)
438. haugsengkock2024inftyoperadsassymmetricmonoidal: AUTHOR = Haugseng, Rune and Kock, Joachim, TITLE = $\infty$-operads as symmetric monoidal $\infty$-categories, JOURNAL = Publ. Mat., FJOURNAL = Publicacions Matem\`atiques, VOLUME = 68, YEAR = 2024, NUMBER = 1, PAGES = 111--137, ISSN = 0214-1493,2014-4350, MRCLASS = 18N70, MRNUMBER = 4682726, DOI = 10.5565/publmat6812406, URL = https://doi.org/10.5565/publmat6812406, doi:[10.5565/publmat6812406](https://doi.org/10.5565/publmat6812406)
439. barwick2016parametrizedhighercategorytheory: title=Parametrized higher category theory and higher algebra: Expos\'e I -- Elements of parametrized higher category theory, author=Clark Barwick and Emanuele Dotto and Saul Glasman and Denis Nardin and Jay Shah, year=2016, eprint=1608.03657, archivePrefix=arXiv, primaryClass=math.AT, NOTE = \hrefhttps://arxiv.org/abs/1608.03657arXiv:1608.03657, arXiv:[1608.03657](https://arxiv.org/abs/1608.03657)
440. stewart2025tensorproductsequivariantcommutative: title=On tensor products with equivariant commutative operads, author=Natalie Stewart, year=2025, eprint=2504.02143, archivePrefix=arXiv, primaryClass=math.AT, NOTE = \hrefhttps://arxiv.org/abs/2504.02143arXiv:2504.02143, arXiv:[2504.02143](https://arxiv.org/abs/2504.02143)
441. hilman2024parametrisednoncommutativemotivesequivariant: title=Parametrised noncommutative motives and equivariant cubical descent in algebraic K-theory, author=Kaif Hilman, year=2024, eprint=2202.02591, archivePrefix=arXiv, primaryClass=math.KT, NOTE = \hrefhttps://arxiv.org/abs/2202.02591arXiv:2202.02591, arXiv:[2202.02591](https://arxiv.org/abs/2202.02591)
442. lenz2025normsequivarianthomotopytheory: title=Norms in equivariant homotopy theory, author=Tobias Lenz and Sil Linskens and Phil Pützstück, year=2025, eprint=2503.02839, archivePrefix=arXiv, primaryClass=math.AT, NOTE = \hrefhttps://arxiv.org/abs/2503.02839arXiv:2503.02839, arXiv:[2503.02839](https://arxiv.org/abs/2503.02839)
443. blumberghill2015operadic: AUTHOR = Blumberg, Andrew J. and Hill, Michael A., TITLE = Operadic multiplications in equivariant spectra, norms, and transfers, JOURNAL = Adv. Math., FJOURNAL = Advances in Mathematics, VOLUME = 285, YEAR = 2015, PAGES = 658--708, ISSN = 0001-8708,1090-2082, MRCLASS = 55P91 (18D50 55P43 55P48), MRNUMBER = 3406512, MRREVIEWER = Markus\ Szymik, DOI = 10.1016/j.aim.2015.07.013, URL = https://doi.org/10.1016/j.aim.2015.07.013, doi:[10.1016/j.aim.2015.07.013](https://doi.org/10.1016/j.aim.2015.07.013)
444. cnossen2023parametrizedstabilityuniversalproperty: title=Parametrized stability and the universal property of global spectra, author=Bastiaan Cnossen and Tobias Lenz and Sil Linskens, year=2023, eprint=2301.08240, archivePrefix=arXiv, primaryClass=math.AT, NOTE = \hrefhttps://arxiv.org/abs/2301.08240arXiv:2301.08240, arXiv:[2301.08240](https://arxiv.org/abs/2301.08240)
445. pützstück2025globalpicardspectraborel: title=Global Picard Spectra and Borel Parametrized Algebra, author=Phil Pützstück, year=2025, eprint=2503.04456, archivePrefix=arXiv, primaryClass=math.AT, NOTE = \hrefhttps://arxiv.org/abs/2503.04456arXiv:2503.04456, arXiv:[2503.04456](https://arxiv.org/abs/2503.04456)
446. nardin2017stabilitydistributivity: AUTHOR = Nardin, Denis, TITLE = Stability and distributivity over orbital infinity-categories, NOTE = Thesis (Ph.D.)--Massachusetts Institute of Technology, PUBLISHER = ProQuest LLC, Ann Arbor, MI, YEAR = 2017, PAGES = (no paging), MRCLASS = 99-05, MRNUMBER = 3781929, URL = http://gateway.proquest.com/openurl?url_ver=Z39.88-2004&rft_val_fmt=info:ofi/fmt:kev:mtx:dissertation&res_dat=xri:pqm&rft_dat=xri:pqdiss:10797490,
447. lawson2018secondary: AUTHOR = Lawson, Tyler, TITLE = Secondary power operations and the Brown-Peterson spectrum at the prime 2, JOURNAL = Ann. of Math. (2), FJOURNAL = Annals of Mathematics. Second Series, VOLUME = 188, YEAR = 2018, NUMBER = 2, PAGES = 513--576, ISSN = 0003-486X,1939-8980, MRCLASS = 55P43 (55N22 55S12 55S20), MRNUMBER = 3862946, MRREVIEWER = Lennart\ Meier, DOI = 10.4007/annals.2018.188.2.3, URL = https://doi.org/10.4007/annals.2018.188.2.3, doi:[10.4007/annals.2018.188.2.3](https://doi.org/10.4007/annals.2018.188.2.3)
448. juran2025genuineequivariantrecognitionprinciple: title=A genuine equivariant recognition principle for finite groups, author=Branko Juran, year=2025, eprint=2508.04421, archivePrefix=arXiv, primaryClass=math.AT, NOTE = \hrefhttps://arxiv.org/abs/2508.04421arXiv:2508.04421, arXiv:[2508.04421](https://arxiv.org/abs/2508.04421)
449. ragimov2022inftycategoricalreflectiontheoremapplications: title=The $\infty$-Categorical Reflection Theorem and Applications, author=Shaul Ragimov and Tomer M. Schlank, year=2022, eprint=2207.09244, archivePrefix=arXiv, primaryClass=math.AT, NOTE = \hrefhttps://arxiv.org/abs/2207.09244arXiv:2207.09244, arXiv:[2207.09244](https://arxiv.org/abs/2207.09244)
450. carmelicnossenramziyanovski2025characters: AUTHOR = Carmeli, Shachar and Cnossen, Bastiaan and Ramzi, Maxime and Yanovski, Lior, TITLE = Characters and transfer maps via categorified traces, JOURNAL = Forum Math. Sigma, FJOURNAL = Forum of Mathematics. Sigma, VOLUME = 13, YEAR = 2025, PAGES = Paper No. e93, 84, ISSN = 2050-5094, MRCLASS = 55P42 (18N65), MRNUMBER = 4914895, DOI = 10.1017/fms.2025.23, URL = https://doi.org/10.1017/fms.2025.23, doi:[10.1017/fms.2025.23](https://doi.org/10.1017/fms.2025.23)
451. chuHaugseng2021homotopycoherent: AUTHOR = Chu, Hongyi and Haugseng, Rune, TITLE = Homotopy-coherent algebra via Segal conditions, JOURNAL = Adv. Math., FJOURNAL = Advances in Mathematics, VOLUME = 385, YEAR = 2021, PAGES = Paper No. 107733, 95, ISSN = 0001-8708,1090-2082, MRCLASS = 18N60 (18N65 18N70 55P48), MRNUMBER = 4256131, MRREVIEWER = Julia\ Bergner, DOI = 10.1016/j.aim.2021.107733, URL = https://doi.org/10.1016/j.aim.2021.107733, doi:[10.1016/j.aim.2021.107733](https://doi.org/10.1016/j.aim.2021.107733) arXiv:[2021.10773](https://arxiv.org/abs/2021.10773)
452. may1972iteratedloopspaces: AUTHOR = May, J. P., TITLE = The geometry of iterated loop spaces, SERIES = Lecture Notes in Mathematics, VOLUME = Vol. 271, PUBLISHER = Springer-Verlag, Berlin-New York, YEAR = 1972, PAGES = viii+175, MRCLASS = 55D35, MRNUMBER = 420610, MRREVIEWER = J.\ Stasheff,
453. wilson1975wilsonspaces2: AUTHOR = Wilson, W. Stephen, TITLE = The $\Omega $--spectrum for Brown-Peterson cohomology. II, JOURNAL = Amer. J. Math., FJOURNAL = American Journal of Mathematics, VOLUME = 97, YEAR = 1975, PAGES = 101--123, ISSN = 0002-9327,1080-6377, MRCLASS = 55B20, MRNUMBER = 383390, MRREVIEWER = J.\ W.\ Vick, DOI = 10.2307/2373662, URL = https://doi.org/10.2307/2373662, doi:[10.2307/2373662](https://doi.org/10.2307/2373662)
454. levy2022Eilenberg: AUTHOR = Levy, Ishan, TITLE = Eilenberg Mac Lane spectra as $p$-cyclonic Thom spectra, JOURNAL = J. Topol., FJOURNAL = Journal of Topology, VOLUME = 15, YEAR = 2022, NUMBER = 2, PAGES = 878--895, ISSN = 1753-8416,1753-8424, MRCLASS = 55P42 (55P91), MRNUMBER = 4441607, MRREVIEWER = Vidhyanath\ K.\ Rao, DOI = 10.1112/topo.12230, URL = https://doi.org/10.1112/topo.12230, doi:[10.1112/topo.12230](https://doi.org/10.1112/topo.12230)
455. behrenswilson2018C2mahowald: AUTHOR = Behrens, Mark and Wilson, Dylan, TITLE = A $C_2$-equivariant analog of Mahowald's Thom spectrum theorem, JOURNAL = Proc. Amer. Math. Soc., FJOURNAL = Proceedings of the American Mathematical Society, VOLUME = 146, YEAR = 2018, NUMBER = 11, PAGES = 5003--5012, ISSN = 0002-9939,1088-6826, MRCLASS = 55P91 (55S91), MRNUMBER = 3856165, MRREVIEWER = Samik\ Basu, DOI = 10.1090/proc/14175, URL = https://doi.org/10.1090/proc/14175, doi:[10.1090/proc/14175](https://doi.org/10.1090/proc/14175)
456. hahnwilson2020eilenberg: AUTHOR = Hahn, Jeremy and Wilson, Dylan, TITLE = Eilenberg--Mac Lane spectra as equivariant Thom spectra, JOURNAL = Geom. Topol., FJOURNAL = Geometry \& Topology, VOLUME = 24, YEAR = 2020, NUMBER = 6, PAGES = 2709--2748, ISSN = 1465-3060,1364-0380, MRCLASS = 55P43 (55P91), MRNUMBER = 4194302, MRREVIEWER = Birgit\ Richter, DOI = 10.2140/gt.2020.24.2709, URL = https://doi.org/10.2140/gt.2020.24.2709, doi:[10.2140/gt.2020.24.2709](https://doi.org/10.2140/gt.2020.24.2709)
457. mahowaldray1981thomiso: AUTHOR = Mahowald, Mark and Ray, Nigel, TITLE = A note on the Thom isomorphism, JOURNAL = Proc. Amer. Math. Soc., FJOURNAL = Proceedings of the American Mathematical Society, VOLUME = 82, YEAR = 1981, NUMBER = 2, PAGES = 307--308, ISSN = 0002-9939,1088-6826, MRCLASS = 55N20, MRNUMBER = 609673, MRREVIEWER = R.\ M.\ Vogt, DOI = 10.2307/2043331, URL = https://doi.org/10.2307/2043331, doi:[10.2307/2043331](https://doi.org/10.2307/2043331)
458. johnsonNoel2010complexorientations: AUTHOR = Johnson, Niles and Noel, Justin, TITLE = For complex orientations preserving power operations, $p$-typicality is atypical, JOURNAL = Topology Appl., FJOURNAL = Topology and its Applications, VOLUME = 157, YEAR = 2010, NUMBER = 14, PAGES = 2271--2288, ISSN = 0166-8641,1879-3207, MRCLASS = 55P43 (55P42), MRNUMBER = 2670503, MRREVIEWER = Yutaka\ Hemmi, DOI = 10.1016/j.topol.2010.06.007, URL = https://doi.org/10.1016/j.topol.2010.06.007, doi:[10.1016/j.topol.2010.06.007](https://doi.org/10.1016/j.topol.2010.06.007)
459. zhu2020normcoherence: AUTHOR = Zhu, Yifei, TITLE = Norm coherence for descent of level structures on formal deformations, JOURNAL = J. Pure Appl. Algebra, FJOURNAL = Journal of Pure and Applied Algebra, VOLUME = 224, YEAR = 2020, NUMBER = 10, PAGES = 106382, 35, ISSN = 0022-4049,1873-1376, MRCLASS = 55P43 (11S31 14L05 55N20 55N22 55N34 55S12), MRNUMBER = 4093069, MRREVIEWER = Steffen\ Sagave, DOI = 10.1016/j.jpaa.2020.106382, URL = https://doi.org/10.1016/j.jpaa.2020.106382, doi:[10.1016/j.jpaa.2020.106382](https://doi.org/10.1016/j.jpaa.2020.106382) arXiv:[2020.10638](https://arxiv.org/abs/2020.10638)
460. carmeli2025tatevaluedcharacteristicclasses: title=Tate-valued Characteristic Classes, author=Shachar Carmeli and Kiran Luecke, year=2025, eprint=2503.12134, archivePrefix=arXiv, primaryClass=math.AT, url=https://arxiv.org/abs/2503.12134, arXiv:[2503.12134](https://arxiv.org/abs/2503.12134)
461. carmeli2025tatevaluedcharacteristicclassesii: title=Tate-valued Characteristic Classes II: Applications, author=Shachar Carmeli and Kiran Luecke, year=2025, eprint=2510.01488, archivePrefix=arXiv, primaryClass=math.AT, url=https://arxiv.org/abs/2510.01488, arXiv:[2510.01488](https://arxiv.org/abs/2510.01488)
462. andoHopkinsStrickland2004sigmaorientation: AUTHOR = Ando, Matthew and Hopkins, Michael J. and Strickland, Neil P., TITLE = The sigma orientation is an $H_\infty$ map, JOURNAL = Amer. J. Math., FJOURNAL = American Journal of Mathematics, VOLUME = 126, YEAR = 2004, NUMBER = 2, PAGES = 247--334, ISSN = 0002-9327,1080-6377, MRCLASS = 55N34 (55P42 55P43), MRNUMBER = 2045503, MRREVIEWER = Paul\ G.\ Goerss, URL = http://muse.jhu.edu/journals/american_journal_of_mathematics/v126/126.2ando.pdf,
463. balderrama2023algebraictheories: AUTHOR = Balderrama, William, TITLE = Algebraic theories of power operations, JOURNAL = J. Topol., FJOURNAL = Journal of Topology, VOLUME = 16, YEAR = 2023, NUMBER = 4, PAGES = 1543--1640, ISSN = 1753-8416,1753-8424, MRCLASS = 55Q35 (16S37 18C10 55N22 55S35), MRNUMBER = 4828047, MRREVIEWER = Adriana\ Ciampella, DOI = 10.1112/topo.12318, URL = https://doi.org/10.1112/topo.12318, doi:[10.1112/topo.12318](https://doi.org/10.1112/topo.12318)
464. chathamHahnYuan2024wilson: AUTHOR = Chatham, Hood and Hahn, Jeremy and Yuan, Allen, TITLE = Wilson spaces, Snaith constructions, and elliptic orientations, JOURNAL = Invent. Math., FJOURNAL = Inventiones Mathematicae, VOLUME = 236, YEAR = 2024, NUMBER = 1, PAGES = 165--217, ISSN = 0020-9910,1432-1297, MRCLASS = 19E20 (11F23 19F99 55P43), MRNUMBER = 4712865, MRREVIEWER = Bj\o rn\ Ian\ Dundas, DOI = 10.1007/s00222-024-01239-3, URL = https://doi.org/10.1007/s00222-024-01239-3, doi:[10.1007/s00222-024-01239-3](https://doi.org/10.1007/s00222-024-01239-3)
465. hahnYuan2020exotic: AUTHOR = Hahn, Jeremy and Yuan, Allen, TITLE = Exotic multiplications on periodic complex bordism, JOURNAL = J. Topol., FJOURNAL = Journal of Topology, VOLUME = 13, YEAR = 2020, NUMBER = 4, PAGES = 1839--1852, ISSN = 1753-8416,1753-8424, MRCLASS = 55P43 (55S25), MRNUMBER = 4186145, MRREVIEWER = Bruno\ Stonek, DOI = 10.1112/topo.12169, URL = https://doi.org/10.1112/topo.12169, doi:[10.1112/topo.12169](https://doi.org/10.1112/topo.12169)
466. barthelGreenleesHausmann2020balmercompactlie: AUTHOR = Barthel, Tobias and Greenlees, J. P. C. and Hausmann, Markus, TITLE = On the Balmer spectrum for compact Lie groups, JOURNAL = Compos. Math., FJOURNAL = Compositio Mathematica, VOLUME = 156, YEAR = 2020, NUMBER = 1, PAGES = 39--76, ISSN = 0010-437X,1570-5846, MRCLASS = 55P42 (55P91), MRNUMBER = 4036448, MRREVIEWER = Samik\ Basu, DOI = 10.1112/s0010437x19007656, URL = https://doi.org/10.1112/s0010437x19007656, doi:[10.1112/s0010437x19007656](https://doi.org/10.1112/s0010437x19007656)
467. araki1979orientations: AUTHOR = Araki, Sh\^or\^o, TITLE = Orientations in $\tau $-cohomology theories, JOURNAL = Japan. J. Math. (N.S.), FJOURNAL = Japanese Journal of Mathematics. New Series, VOLUME = 5, YEAR = 1979, NUMBER = 2, PAGES = 403--430, ISSN = 0289-2316, MRCLASS = 55N22 (55N20), MRNUMBER = 614829, MRREVIEWER = A.\ Dold, DOI = 10.4099/math1924.5.403, URL = https://doi.org/10.4099/math1924.5.403, doi:[10.4099/math1924.5.403](https://doi.org/10.4099/math1924.5.403)
468. schwede2014global: title=Global Homotopy Theory, v0.17, author=Stefan Schwede, year=2014,
469. burklund2022chromaticnullstellensatz: title=The Chromatic Nullstellensatz, author=Robert Burklund and Tomer M. Schlank and Allen Yuan, year=2022, eprint=2207.09929, archivePrefix=arXiv, primaryClass=math.AT, NOTE = \hrefhttps://arxiv.org/abs/2207.09929arXiv:2207.09929, arXiv:[2207.09929](https://arxiv.org/abs/2207.09929)
470. martiniWolf2024colimits: AUTHOR = Martini, Louis and Wolf, Sebastian, TITLE = Colimits and cocompletions in internal higher category theory, JOURNAL = High. Struct., FJOURNAL = Higher Structures, VOLUME = 8, YEAR = 2024, NUMBER = 1, PAGES = 97--192, ISSN = 2209-0606, MRCLASS = 18Nxx (18Axx 18B25 18F20 55Pxx), MRNUMBER = 4752519, MRREVIEWER = Tobias\ Lenz,
471. möller2010K(1): title=$K(1)$-local complex $E_\infty$-orientations, author=Jan-David Möllers, year=2010, NOTE = \hrefhttps://d-nb.info/1252865902/34PhD Thesis,
472. walker2009orientationspadicanalysis: title=Orientations and p-Adic Analysis, author=Barry John Walker, year=2009, eprint=0905.0022, archivePrefix=arXiv, primaryClass=math.AT, url=https://arxiv.org/abs/0905.0022, arXiv:[0905.0022](https://arxiv.org/abs/0905.0022)
473. 9authors2023hermitian1: AUTHOR = Calm\`es, Baptiste and Dotto, Emanuele and Harpaz, Yonatan and Hebestreit, Fabian and Land, Markus and Moi, Kristian and Nardin, Denis and Nikolaus, Thomas and Steimle, Wolfgang, TITLE = Hermitian K-theory for stable $\infty$-categories I: Foundations, JOURNAL = Selecta Math. (N.S.), FJOURNAL = Selecta Mathematica. New Series, VOLUME = 29, YEAR = 2023, NUMBER = 1, PAGES = Paper No. 10, 269, ISSN = 1022-1824,1420-9020, MRCLASS = 19G38 (18N99 55U35), MRNUMBER = 4514986, MRREVIEWER = Mohamed\ Elhamdadi, DOI = 10.1007/s00029-022-00758-2, URL = https://doi.org/10.1007/s00029-022-00758-2, doi:[10.1007/s00029-022-00758-2](https://doi.org/10.1007/s00029-022-00758-2)
474. cnossen2023twistedambidexterityequivarianthomotopy: title=Twisted ambidexterity in equivariant homotopy theory, author=Bastiaan Cnossen, year=2023, eprint=2303.00736, archivePrefix=arXiv, primaryClass=math.AT, NOTE = \hrefhttps://arxiv.org/abs/2303.00736arXiv:2303.00736, arXiv:[2303.00736](https://arxiv.org/abs/2303.00736)
475. devinatzHopkins2004homotopyfixedpoints: AUTHOR = Devinatz, Ethan S. and Hopkins, Michael J., TITLE = Homotopy fixed point spectra for closed subgroups of the Morava stabilizer groups, JOURNAL = Topology, FJOURNAL = Topology. An International Journal of Mathematics, VOLUME = 43, YEAR = 2004, NUMBER = 1, PAGES = 1--47, ISSN = 0040-9383, MRCLASS = 55P43 (55N22 55T15), MRNUMBER = 2030586, MRREVIEWER = R.\ E.\ Stong, DOI = 10.1016/S0040-9383(03)00029-6, URL = https://doi.org/10.1016/S0040-9383(03)00029-6, doi:[10.1016/S0040-9383(03)00029-6](https://doi.org/10.1016/S0040-9383(03)00029-6)
476. lewisMaySteinberger1986equivariant: AUTHOR = Lewis, Jr., L. G. and May, J. P. and Steinberger, M. and McClure, J. E., TITLE = Equivariant stable homotopy theory, SERIES = Lecture Notes in Mathematics, VOLUME = 1213, NOTE = With contributions by J. E. McClure, PUBLISHER = Springer-Verlag, Berlin, YEAR = 1986, PAGES = x+538, ISBN = 3-540-16820-6, MRCLASS = 55-02 (55Nxx 55Pxx 57S99), MRNUMBER = 866482, MRREVIEWER = T.\ tom Dieck, DOI = 10.1007/BFb0075778, URL = https://doi.org/10.1007/BFb0075778, doi:[10.1007/BFb0075778](https://doi.org/10.1007/BFb0075778)
477. rezk1998hopkinsmiller: AUTHOR = Rezk, Charles, TITLE = Notes on the Hopkins-Miller theorem, BOOKTITLE = Homotopy theory via algebraic geometry and group representations (Evanston, IL, 1997), SERIES = Contemp. Math., VOLUME = 220, PAGES = 313--366, PUBLISHER = Amer. Math. Soc., Providence, RI, YEAR = 1998, ISBN = 0-8218-0805-2, MRCLASS = 55N22 (55S99), MRNUMBER = 1642902, DOI = 10.1090/conm/220/03107, URL = https://doi.org/10.1090/conm/220/03107, doi:[10.1090/conm/220/03107](https://doi.org/10.1090/conm/220/03107)
478. senger2024BP: AUTHOR = Senger, Andrew, TITLE = The Brown-Peterson spectrum is not $\BbbE_2 ( p^2 + 2 )$ at odd primes, JOURNAL = Adv. Math., FJOURNAL = Advances in Mathematics, VOLUME = 458, YEAR = 2024, PAGES = Paper No. 109996, 33, ISSN = 0001-8708,1090-2082, MRCLASS = 55N22 (55P43 55S20), MRNUMBER = 4815051, MRREVIEWER = Ningchuan\ Zhang, DOI = 10.1016/j.aim.2024.109996, URL = https://doi.org/10.1016/j.aim.2024.109996, doi:[10.1016/j.aim.2024.109996](https://doi.org/10.1016/j.aim.2024.109996) arXiv:[2024.10999](https://arxiv.org/abs/2024.10999)
479. basterraMandell2013BP: AUTHOR = Basterra, Maria and Mandell, Michael A., TITLE = The multiplication on BP, JOURNAL = J. Topol., FJOURNAL = Journal of Topology, VOLUME = 6, YEAR = 2013, NUMBER = 2, PAGES = 285--310, ISSN = 1753-8416,1753-8424, MRCLASS = 55P43 (55N22 55S35), MRNUMBER = 3065177, MRREVIEWER = Jes\'us\ Gonz\'alez, DOI = 10.1112/jtopol/jts032, URL = https://doi.org/10.1112/jtopol/jts032, doi:[10.1112/jtopol/jts032](https://doi.org/10.1112/jtopol/jts032)
480. hahnWilson2022redshift: AUTHOR = Hahn, Jeremy and Wilson, Dylan, TITLE = Redshift and multiplication for truncated Brown-Peterson spectra, JOURNAL = Ann. of Math. (2), FJOURNAL = Annals of Mathematics. Second Series, VOLUME = 196, YEAR = 2022, NUMBER = 3, PAGES = 1277--1351, ISSN = 0003-486X,1939-8980, MRCLASS = 55P43 (18N70 19D55), MRNUMBER = 4503327, MRREVIEWER = Dae-Woong\ Lee, DOI = 10.4007/annals.2022.196.3.6, URL = https://doi.org/10.4007/annals.2022.196.3.6, doi:[10.4007/annals.2022.196.3.6](https://doi.org/10.4007/annals.2022.196.3.6)
481. devalapurkar2025examplesdiskalgebras: title=Examples of disk algebras, author=Sanath Devalapurkar and Jeremy Hahn and Tyler Lawson and Andrew Senger and Dylan Wilson, year=2025, eprint=2302.11702, archivePrefix=arXiv, primaryClass=math.AT, NOTE = \hrefhttps://arxiv.org/abs/2302.11702arXiv:2302.11702, arXiv:[2302.11702](https://arxiv.org/abs/2302.11702)
482. devalapurkar2024higherchromaticthom: AUTHOR = Devalapurkar, Sanath K., TITLE = Higher chromatic Thom spectra via unstable homotopy theory, JOURNAL = Algebr. Geom. Topol., FJOURNAL = Algebraic \& Geometric Topology, VOLUME = 24, YEAR = 2024, NUMBER = 1, PAGES = 49--108, ISSN = 1472-2747,1472-2739, MRCLASS = 55P43 (55N34 55S12), MRNUMBER = 4721363, MRREVIEWER = Yifei\ Zhu, DOI = 10.2140/agt.2024.24.49, URL = https://doi.org/10.2140/agt.2024.24.49, doi:[10.2140/agt.2024.24.49](https://doi.org/10.2140/agt.2024.24.49)
483. greenleesMay1997localization: AUTHOR = Greenlees, J. P. C. and May, J. P., TITLE = Localization and completion theorems for $M\rm U$-module spectra, JOURNAL = Ann. of Math. (2), FJOURNAL = Annals of Mathematics. Second Series, VOLUME = 146, YEAR = 1997, NUMBER = 3, PAGES = 509--544, ISSN = 0003-486X,1939-8980, MRCLASS = 55P42 (19L47 55N22 55P60 55P91 57R77 57R85), MRNUMBER = 1491447, MRREVIEWER = Kathryn\ P.\ Hess, DOI = 10.2307/2952455, URL = https://doi.org/10.2307/2952455, doi:[10.2307/2952455](https://doi.org/10.2307/2952455)
484. yang2025normedCp: AUTHOR = Yang, Lucy, TITLE = On normed $\Bbb E_\infty$-rings in genuine equivariant $C_p$-spectra, JOURNAL = Int. Math. Res. Not. IMRN, FJOURNAL = International Mathematics Research Notices. IMRN, YEAR = 2025, NUMBER = 3, PAGES = Paper No. rnae262, 32, ISSN = 1073-7928,1687-0247, MRCLASS = 55P91, MRNUMBER = 4859134, DOI = 10.1093/imrn/rnae262, URL = https://doi.org/10.1093/imrn/rnae262, doi:[10.1093/imrn/rnae262](https://doi.org/10.1093/imrn/rnae262)
485. yang2025filteredhochschildkostantrosenbergtheoremreal: title=A filtered Hochschild--Kostant--Rosenberg theorem for real Hochschild homology, author=Lucy Yang, year=2025, eprint=2503.03024, archivePrefix=arXiv, primaryClass=math.AT, NOTE = \hrefhttps://arxiv.org/abs/2503.03024arXiv:2503.03024, arXiv:[2503.03024](https://arxiv.org/abs/2503.03024)
486. rognes2008galois: AUTHOR = Rognes, John, TITLE = Galois extensions of structured ring spectra. Stably dualizable groups, JOURNAL = Mem. Amer. Math. Soc., FJOURNAL = Memoirs of the American Mathematical Society, VOLUME = 192, YEAR = 2008, NUMBER = 898, PAGES = viii+137, ISSN = 0065-9266,1947-6221, MRCLASS = 55P43 (55M05 55P35 57T05), MRNUMBER = 2387923, MRREVIEWER = Alberto\ Cavicchioli, DOI = 10.1090/memo/0898, URL = https://doi.org/10.1090/memo/0898, doi:[10.1090/memo/0898](https://doi.org/10.1090/memo/0898)
487. brunerMaySteinberger1986Hinfty: AUTHOR = Bruner, R. R. and May, J. P. and McClure, J. E. and Steinberger, M., TITLE = $H\sb \infty $ ring spectra and their applications, SERIES = Lecture Notes in Mathematics, VOLUME = 1176, PUBLISHER = Springer-Verlag, Berlin, YEAR = 1986, PAGES = viii+388, ISBN = 3-540-16434-0, MRCLASS = 55-02 (55P42 55Sxx), MRNUMBER = 836132, MRREVIEWER = Haynes\ R.\ Miller, DOI = 10.1007/BFb0075405, URL = https://doi.org/10.1007/BFb0075405, doi:[10.1007/BFb0075405](https://doi.org/10.1007/BFb0075405)
488. brownPeterson1966BP: AUTHOR = Brown, Jr., Edgar H. and Peterson, Franklin P., TITLE = A spectrum whose $Z\sbp$ cohomology is the algebra of reduced $p\spth$ powers, JOURNAL = Topology, FJOURNAL = Topology. An International Journal of Mathematics, VOLUME = 5, YEAR = 1966, PAGES = 149--154, ISSN = 0040-9383, MRCLASS = 55.34, MRNUMBER = 192494, MRREVIEWER = J.\ F.\ Adams, DOI = 10.1016/0040-9383(66)90015-2, URL = https://doi.org/10.1016/0040-9383(66)90015-2, doi:[10.1016/0040-9383(66)90015-2](https://doi.org/10.1016/0040-9383(66)90015-2)
489. beaudryHillShiZeng2021modelsLubinTate: AUTHOR = Beaudry, Agn\`es and Hill, Michael A. and Shi, XiaoLin Danny and Zeng, Mingcong, TITLE = Models of Lubin-Tate spectra via Real bordism theory, JOURNAL = Adv. Math., FJOURNAL = Advances in Mathematics, VOLUME = 392, YEAR = 2021, PAGES = Paper No. 108020, 58, ISSN = 0001-8708,1090-2082, MRCLASS = 55N22 (11S31 55P42), MRNUMBER = 4313964, MRREVIEWER = Jonathan\ Beardsley, DOI = 10.1016/j.aim.2021.108020, URL = https://doi.org/10.1016/j.aim.2021.108020, doi:[10.1016/j.aim.2021.108020](https://doi.org/10.1016/j.aim.2021.108020) arXiv:[2021.10802](https://arxiv.org/abs/2021.10802)
490. duan2025periodicityfinitecomplexityhigher: title=Periodicity and finite complexity in higher real $K$-theories, author=Zhipeng Duan and Michael A. Hill and Guchuan Li and Yutao Liu and XiaoLin Danny Shi and Guozhen Wang and Zhouli Xu, year=2025, eprint=2512.01161, archivePrefix=arXiv, primaryClass=math.AT, NOTE = \hrefhttps://arxiv.org/abs/2512.01161arXiv:2512.01161, arXiv:[2512.01161](https://arxiv.org/abs/2512.01161)
491. beaudryhilllawsonshizeng2025slicequotientsnorms: AUTHOR = Beaudry, Agn\`es and Hill, Michael A. and Lawson, Tyler and Shi, XiaoLin Danny and Zeng, Mingcong, TITLE = On the slice spectral sequence for quotients of norms of Real bordism, JOURNAL = J. Topol., FJOURNAL = Journal of Topology, VOLUME = 18, YEAR = 2025, NUMBER = 1, PAGES = Paper No. e70015, 66, ISSN = 1753-8416,1753-8424, MRCLASS = 55P91 (55P92 55Q91 55T15 55T25), MRNUMBER = 4877605, DOI = 10.1112/topo.70015, URL = https://doi.org/10.1112/topo.70015, doi:[10.1112/topo.70015](https://doi.org/10.1112/topo.70015)
492. hilman2024mcduff: AUTHOR = Hilman, Kaif, TITLE = An equivariant generalisation of McDuff-Segal's group-completion theorem, JOURNAL = Int. Math. Res. Not. IMRN, FJOURNAL = International Mathematics Research Notices. IMRN, YEAR = 2024, NUMBER = 9, PAGES = 7552--7570, ISSN = 1073-7928,1687-0247, MRCLASS = 18M15 (18N99 19A99 20J15 55P43 55Q91), MRNUMBER = 4742834, MRREVIEWER = J.\ P. C. Greenlees, DOI = 10.1093/imrn/rnad278, URL = https://doi.org/10.1093/imrn/rnad278, doi:[10.1093/imrn/rnad278](https://doi.org/10.1093/imrn/rnad278)
493. schwede2026realglobalequivariantsegalbeckersplitting: title=A Real-global equivariant Segal--Becker splitting, explicit Brauer induction, and global Adams operations, author=Stefan Schwede, year=2026, eprint=2603.17848, archivePrefix=arXiv, primaryClass=math.AT, NOTE = \hrefhttps://arxiv.org/abs/2603.17848arXiv:2603.17848, arXiv:[2603.17848](https://arxiv.org/abs/2603.17848)
494. gepnerSnaith2009motivicspectrarepresentingalgebraic: AUTHOR = Gepner, David and Snaith, Victor, TITLE = On the motivic spectra representing algebraic cobordism and algebraic $K$-theory, JOURNAL = Doc. Math., FJOURNAL = Documenta Mathematica, VOLUME = 14, YEAR = 2009, PAGES = 359--396, ISSN = 1431-0635,1431-0643, MRCLASS = 55N15 (14F42 55N22), MRNUMBER = 2540697, MRREVIEWER = Keith\ Peter\ Johnson,
495. annalaHoyoisIwasa2025algebraiccobordismconnerfloydisomorphism: AUTHOR = Annala, Toni and Hoyois, Marc and Iwasa, Ryomei, TITLE = Algebraic cobordism and a Conner-Floyd isomorphism for algebraic K-theory, JOURNAL = J. Amer. Math. Soc., FJOURNAL = Journal of the American Mathematical Society, VOLUME = 38, YEAR = 2025, NUMBER = 1, PAGES = 243--289, ISSN = 0894-0347,1088-6834, MRCLASS = 14F42 (14A30 19E08), MRNUMBER = 4810064, MRREVIEWER = Mikhail\ V.\ Bondarko, DOI = 10.1090/jams/1045, URL = https://doi.org/10.1090/jams/1045, doi:[10.1090/jams/1045](https://doi.org/10.1090/jams/1045)
496. annalaIwasa2025motivicspectrauniversalityktheory: title=Motivic spectra and universality of $K$-theory, author=Toni Annala and Ryomei Iwasa, year=2025, eprint=2204.03434, archivePrefix=arXiv, primaryClass=math.AG, NOTE = \hrefhttps://arxiv.org/abs/2204.03434arXiv:2204.03434, arXiv:[2204.03434](https://arxiv.org/abs/2204.03434)
497. rasekhStonekValenzuela2022thom: AUTHOR = Rasekh, Nima and Stonek, Bruno and Valenzuela, Gabriel, TITLE = Thom spectra, higher THH and tensors in $\infty$-categories, JOURNAL = Algebr. Geom. Topol., FJOURNAL = Algebraic \& Geometric Topology, VOLUME = 22, YEAR = 2022, NUMBER = 4, PAGES = 1841--1903, ISSN = 1472-2747,1472-2739, MRCLASS = 55P43 (18D20 55N20), MRNUMBER = 4495670, MRREVIEWER = Rui\ Miguel\ Saramago, DOI = 10.2140/agt.2022.22.1841, URL = https://doi.org/10.2140/agt.2022.22.1841, doi:[10.2140/agt.2022.22.1841](https://doi.org/10.2140/agt.2022.22.1841)
498. bayindirMoulinos2022KTHHFp: AUTHOR = Bay\i nd\i r, Haldun \"Ozg\"ur and Moulinos, Tasos, TITLE = Algebraic $K$-theory of $\rm THH(\BbbF_p)$, JOURNAL = Trans. Amer. Math. Soc., FJOURNAL = Transactions of the American Mathematical Society, VOLUME = 375, YEAR = 2022, NUMBER = 6, PAGES = 4177--4207, ISSN = 0002-9947,1088-6850, MRCLASS = 55P99 (19D99), MRNUMBER = 4419056, DOI = 10.1090/tran/8613, URL = https://doi.org/10.1090/tran/8613, doi:[10.1090/tran/8613](https://doi.org/10.1090/tran/8613)
499. dottoMoiPatchkoriaReeh2021THR: AUTHOR = Dotto, Emanuele and Moi, Kristian and Patchkoria, Irakli and Reeh, Sune Precht, TITLE = Real topological Hochschild homology, JOURNAL = J. Eur. Math. Soc. (JEMS), FJOURNAL = Journal of the European Mathematical Society (JEMS), VOLUME = 23, YEAR = 2021, NUMBER = 1, PAGES = 63--152, ISSN = 1435-9855,1435-9863, MRCLASS = 16E40 (19D55 55P43 55P91), MRNUMBER = 4186464, MRREVIEWER = Beno\^it\ Fresse, DOI = 10.4171/jems/1007, URL = https://doi.org/10.4171/jems/1007, doi:[10.4171/jems/1007](https://doi.org/10.4171/jems/1007)
500. quigleyShah2022equivalencetheoriesrealcyclotomic: title=On the equivalence of two theories of real cyclotomic spectra, author=J. D. Quigley and Jay Shah, year=2022, eprint=2112.07462, archivePrefix=arXiv, primaryClass=math.AT, NOTE = \hrefhttps://arxiv.org/abs/2112.07462arXiv:2112.07462, arXiv:[2112.07462](https://arxiv.org/abs/2112.07462)
501. pitschRickaScherer2021conjugationspaces: AUTHOR = Pitsch, Wolfgang and Ricka, Nicolas and Scherer, J\'er\^ome, TITLE = Conjugation spaces are cohomologically pure, JOURNAL = Proc. Lond. Math. Soc. (3), FJOURNAL = Proceedings of the London Mathematical Society. Third Series, VOLUME = 123, YEAR = 2021, NUMBER = 3, PAGES = 313--344, ISSN = 0024-6115,1460-244X, MRCLASS = 55P91 (55N91 55P42 55S10 57S17), MRNUMBER = 4311118, MRREVIEWER = Sa\"id\ Zarati, DOI = 10.1112/plms.12399, URL = https://doi.org/10.1112/plms.12399, doi:[10.1112/plms.12399](https://doi.org/10.1112/plms.12399)
502. snaith1979algebraiccobordism: AUTHOR = Snaith, Victor P., TITLE = Algebraic cobordism and $K$-theory, JOURNAL = Mem. Amer. Math. Soc., FJOURNAL = Memoirs of the American Mathematical Society, VOLUME = 21, YEAR = 1979, NUMBER = 221, PAGES = vii+152, ISSN = 0065-9266,1947-6221, MRCLASS = 57R75 (18F25 55N15 57R77), MRNUMBER = 539791, MRREVIEWER = Donald\ W.\ Kahn, DOI = 10.1090/memo/0221, URL = https://doi.org/10.1090/memo/0221, doi:[10.1090/memo/0221](https://doi.org/10.1090/memo/0221)
503. stong1963BU: AUTHOR = Stong, Robert E., TITLE = Determination of $H\sp\ast (\rm BO(k,\cdots,\infty ),Z\sb2)$\ and $H\sp\ast (\rm BU(k,\cdots,\infty ),Z\sb2)$, JOURNAL = Trans. Amer. Math. Soc., FJOURNAL = Transactions of the American Mathematical Society, VOLUME = 107, YEAR = 1963, PAGES = 526--544, ISSN = 0002-9947,1088-6850, MRCLASS = 55.99, MRNUMBER = 151963, MRREVIEWER = H.\ Wada, DOI = 10.2307/1993817, URL = https://doi.org/10.2307/1993817, doi:[10.2307/1993817](https://doi.org/10.2307/1993817)
504. fauskLewisMay2001picardequivariant: AUTHOR = Fausk, H. and Lewis, Jr., L. G. and May, J. P., TITLE = The Picard group of equivariant stable homotopy theory, JOURNAL = Adv. Math., FJOURNAL = Advances in Mathematics, VOLUME = 163, YEAR = 2001, NUMBER = 1, PAGES = 17--33, ISSN = 0001-8708,1090-2082, MRCLASS = 55P42 (18D10 55P91), MRNUMBER = 1867202, MRREVIEWER = Po\ Hu, DOI = 10.1006/aima.2001.1997, URL = https://doi.org/10.1006/aima.2001.1997, doi:[10.1006/aima.2001.1997](https://doi.org/10.1006/aima.2001.1997) arXiv:[2001.1997](https://arxiv.org/abs/2001.1997)
505. greenleesSadofsky1996tate: AUTHOR = Greenlees, J. P. C. and Sadofsky, Hal, TITLE = The Tate spectrum of $v_n$-periodic complex oriented theories, JOURNAL = Math. Z., FJOURNAL = Mathematische Zeitschrift, VOLUME = 222, YEAR = 1996, NUMBER = 3, PAGES = 391--405, ISSN = 0025-5874,1432-1823, MRCLASS = 55N22, MRNUMBER = 1400199, MRREVIEWER = Mark\ Hovey, DOI = 10.1007/PL00004264, URL = https://doi.org/10.1007/PL00004264, doi:[10.1007/PL00004264](https://doi.org/10.1007/PL00004264)
506. bachmannHahn2022nilpotencenormedmglmodules: title=Nilpotence in normed MGL-modules, author=Tom Bachmann and Jeremy Hahn, year=2022, eprint=1906.01306, archivePrefix=arXiv, primaryClass=math.AT, url=https://arxiv.org/abs/1906.01306, NOTE = \hrefhttps://arxiv.org/abs/1906.01306arXiv:1906.01306, arXiv:[1906.01306](https://arxiv.org/abs/1906.01306)
507. bakerJeanneret2002brave: AUTHOR = Baker, Andrew and Jeanneret, Alain, TITLE = Brave new Hopf algebroids and extensions of $MU$-algebras, JOURNAL = Homology Homotopy Appl., FJOURNAL = Homology, Homotopy and Applications, VOLUME = 4, YEAR = 2002, NUMBER = 1, PAGES = 163--173, ISSN = 1532-0081, MRCLASS = 55P43 (55N20), MRNUMBER = 1937961, MRREVIEWER = Richard\ John\ Steiner, DOI = 10.4310/hha.2002.v4.n1.a9, URL = https://doi.org/10.4310/hha.2002.v4.n1.a9, doi:[10.4310/hha.2002.v4.n1.a9](https://doi.org/10.4310/hha.2002.v4.n1.a9)
508. lazarev2001homotopy: AUTHOR = Lazarev, A., TITLE = Homotopy theory of $A_\infty$ ring spectra and applications to $MU$-modules, JOURNAL = $K$-Theory, FJOURNAL = $K$-Theory. An Interdisciplinary Journal for the Development, Application, and Influence of $K$-Theory in the Mathematical Sciences, VOLUME = 24, YEAR = 2001, NUMBER = 3, PAGES = 243--281, ISSN = 0920-3036,1573-0514, MRCLASS = 55P43 (55N20 55P42 55S35 55T25), MRNUMBER = 1876800, MRREVIEWER = Andrew\ J.\ Baker, DOI = 10.1023/A:1013394125552, URL = https://doi.org/10.1023/A:1013394125552, doi:[10.1023/A:1013394125552](https://doi.org/10.1023/A:1013394125552)
509. hoveySadofsky1996tate: AUTHOR = Hovey, Mark and Sadofsky, Hal, TITLE = Tate cohomology lowers chromatic Bousfield classes, JOURNAL = Proc. Amer. Math. Soc., FJOURNAL = Proceedings of the American Mathematical Society, VOLUME = 124, YEAR = 1996, NUMBER = 11, PAGES = 3579--3585, ISSN = 0002-9939,1088-6826, MRCLASS = 55P60 (55P42 55P91), MRNUMBER = 1343699, MRREVIEWER = Richard\ John\ Steiner, DOI = 10.1090/S0002-9939-96-03495-8, URL = https://doi.org/10.1090/S0002-9939-96-03495-8, doi:[10.1090/S0002-9939-96-03495-8](https://doi.org/10.1090/S0002-9939-96-03495-8)
510. tomDieck1978homotopy: AUTHOR = tom Dieck, Tammo, TITLE = Homotopy equivalent group representations and Picard groups of the Burnside ring and the character ring, JOURNAL = Manuscripta Math., FJOURNAL = Manuscripta Mathematica, VOLUME = 26, YEAR = 1978/79, NUMBER = 1-2, PAGES = 179--200, ISSN = 0025-2611,1432-1785, MRCLASS = 20C10 (55R50 57R85), MRNUMBER = 513152, MRREVIEWER = Timo\ Neuvonen, DOI = 10.1007/BF01167973, URL = https://doi.org/10.1007/BF01167973, doi:[10.1007/BF01167973](https://doi.org/10.1007/BF01167973)
511. bakerWuergler1989liftings: AUTHOR = Baker, Andrew and W\"urgler, Urs, TITLE = Liftings of formal groups and the Artinian completion of $v_n^-1\rm BP$, JOURNAL = Math. Proc. Cambridge Philos. Soc., FJOURNAL = Mathematical Proceedings of the Cambridge Philosophical Society, VOLUME = 106, YEAR = 1989, NUMBER = 3, PAGES = 511--530, ISSN = 0305-0041,1469-8064, MRCLASS = 55N22 (55P42), MRNUMBER = 1010375, MRREVIEWER = N.\ J.\ Kuhn, DOI = 10.1017/S0305004100068249, URL = https://doi.org/10.1017/S0305004100068249, doi:[10.1017/S0305004100068249](https://doi.org/10.1017/S0305004100068249)
512. duggerShipley2006postnikov: AUTHOR = Dugger, Daniel and Shipley, Brooke, TITLE = Postnikov extensions of ring spectra, JOURNAL = Algebr. Geom. Topol., FJOURNAL = Algebraic \& Geometric Topology, VOLUME = 6, YEAR = 2006, PAGES = 1785--1829, ISSN = 1472-2747,1472-2739, MRCLASS = 55P43 (55S45), MRNUMBER = 2263050, MRREVIEWER = Donald\ M.\ Davis, DOI = 10.2140/agt.2006.6.1785, URL = https://doi.org/10.2140/agt.2006.6.1785, doi:[10.2140/agt.2006.6.1785](https://doi.org/10.2140/agt.2006.6.1785)
513. robinson1989obstruction: AUTHOR = Robinson, Alan, TITLE = Obstruction theory and the strict associativity of Morava $K$-theories, BOOKTITLE = Advances in homotopy theory (Cortona, 1988), SERIES = London Math. Soc. Lecture Note Ser., VOLUME = 139, PAGES = 143--152, PUBLISHER = Cambridge Univ. Press, Cambridge, YEAR = 1989, ISBN = 0-521-37907-5, MRCLASS = 55N20 (55P99 55S35), MRNUMBER = 1055874, MRREVIEWER = Nobuaki\ Yagita, DOI = 10.1017/CBO9780511662614.014, URL = https://doi.org/10.1017/CBO9780511662614.014, doi:[10.1017/CBO9780511662614.014](https://doi.org/10.1017/CBO9780511662614.014)
514. rognes2025localizationsequenceslogarithmictopological: title=Localization sequences for logarithmic topological cyclic homology, author=John Rognes and Steffen Sagave and Christian Schlichtkrull, year=2025, eprint=2506.08492, archivePrefix=arXiv, primaryClass=math.AT, url=https://arxiv.org/abs/2506.08492, NOTE = \hrefhttps://arxiv.org/abs/2506.08492arXiv:2506.08492, arXiv:[2506.08492](https://arxiv.org/abs/2506.08492)
515. hesselholtMadsen2015Realalgebra: author = Lars Hesselholt and Ib Madsen, title = Real Algebraic $K$-Theory, NOTE = \hrefhttps://web.math.ku.dk/ larsh/papers/s05/Unpublished book, year = 2015

