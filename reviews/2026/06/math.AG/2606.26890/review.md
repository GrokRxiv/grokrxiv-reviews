# Generalized Zariski cancellation for Brieskorn--Pham varieties

GrokRxiv review of [arXiv:2606.26890](https://arxiv.org/abs/2606.26890) · `math.AG`

_Authors_: Buddhadev Hajra, Mohit Upmanyu

## TL;DR

The paper establishes three main results in algebraic geometry: (1) a generalized Zariski cancellation theorem for complex affine varieties with a unique singularity and a good C*-action; (2) an exponent rigidity theorem showing the exponent tuple of a Brieskorn–Pham variety completely determines its isomorphism class algebraically, analytically, and formally over any characteristic-zero field; and (3) a four-way equivalence theorem combining (1) and (2) for Brieskorn–Pham varieties specifically. The paper's field is math.AG, which falls within the code-amenable set. Both the reproducibility specialist (severity: critical, for the missing formal verification of the headline cancellation theorem) and the technical correctness specialist (severity: major, for Lemma 6 / Key Lemma, Theorem 7 Jacobian computation, Theorem 10 cancellation induction, and Theorem 14) flagged absent proof-as-code artifacts against the paper's core results. Under the recommendation gate, this mandates a default of major_revision. The technical correctness specialist judged the paper 'mostly_sound' overall (confidence 0.6), and the proofs are described as internally consistent and plausibly correct, but none of the load-bearing steps—the Hilbert-series factorization identity, the Jacobian ideal equality, the dimension-counting induction in Theorem 10—are accompanied by machine-checkable artifacts or computational verification. The novelty is rated 'significant' (score 0.72, confidence 0.78): the results cleanly extend and unify prior topological and metric rigidity results (Yoshinaga–Suzuki, Fernandes–Jelonek–Sampaio, Campesato) into a single algebraic framework, and the generalized cancellation represents a genuine advance. The citation review identified several potentially missing references—most notably Gupta (2014), which is absent from the portion of the bibliography reviewed, and the foundational Pham (1965) and Brieskorn (1966) papers—though 38 of 70 bibliography entries were not rendered in the review input, limiting confidence in these findings. The reproducibility specialist correctly noted that the paper is purely theoretical with no empirical datasets; the reproducibility gap is entirely about the absence of machine-checked proofs for a math.* paper making specific, formalizable algebraic claims.

_Recommendation_: **Major revision** · _Confidence_: 78%

## Strengths

- The four-way equivalence for Brieskorn–Pham varieties—algebraic isomorphism, C*-variety isomorphism, analytic germ isomorphism, and permutation of exponent tuples—is a complete and sharp classification result that substantially closes the cancellation problem for this class.
- The exponent rigidity theorem holds over any field of characteristic zero, not just C, giving the results broader applicability than prior topological and metric analogues.
- The proof architecture—composing Hauser–Müller analytic cancellation, Artin approximation, and Gurjar's algebraization theorem—is architecturally coherent and draws on deep tools across analytic, algebraic, and invariant-theoretic geometry in a non-trivial way.
- The results decisively improve on Yoshinaga–Suzuki (homeomorphism implies permuted exponents) and Fernandes–Jelonek–Sampaio (bi-Lipschitz equivalence forces equal minimal exponents) by recovering the full exponent tuple from purely algebraic isomorphism alone.

## Weaknesses

- The headline cancellation theorem (Theorem 2 / Theorem 14) and the exponent rigidity theorem (Theorem 3 / Theorem 7) are not accompanied by any machine-checkable proof artifact, leaving the critical inductive dimension-counting argument in Theorem 10 and the Hilbert-series factorization identity in Lemma 6 formally unverified.
- The introduction's survey of the Zariski cancellation landscape does not appear to cite Gupta's 2014 negative result for $A^3$ in positive characteristic (Invent. Math.), an important recent development whose absence leaves the characteristic-zero context of the paper's positive results undercontextualized.
- The foundational Pham (1965) and Brieskorn (1966) papers introducing Brieskorn–Pham singularities do not appear in the reviewed bibliography entries, a notable attribution gap for a paper whose central objects of study are these varieties.
- The proof of Theorem 10 loads critically on three distinct theorems from Hauser–Müller (1990), but the theorem numbers cited cannot be confirmed against the published paper from the provided text, introducing a bibliographic risk to the central analytic reduction.

## Revision Targets

- [ ] **Manuscript: Subsection 3.2, Theorem 10 (proof via eqn1, eqn2)**
  - Location: `corrections/2606.26890/paper.tex` at `Subsection 3.2, Theorem 10 (proof via eqn1, eqn2)`
  - Evidence: The inductive Claim and dimension bookkeeping (m≥in, ℓ≤⌊m/n⌋) are internally consistent and the final indecomposable-factor matching is valid given the cited Hauser–Müller cancellation (HM1990 Thm 1) and unique factorization (Thm 4), plus Artin approximation. The novel content is the intricate induction, which is not machine-verified, and the load-bearing external theorems cannot be confirmed from the text. (Cosmetic: stray '0◻' end-of-claim marker.)
  - Required change: Formalize the dimension-counting induction (the Claim) as src/proofs/CancellationInduction.lean treating Hauser–Müller cancellation/factorization as axioms, to make the bookkeeping machine-checkable independent of the analytic inputs.
  - Verification: Re-review should confirm `Subsection 3.2, Theorem 10 (proof via eqn1, eqn2)` is corrected or justified.
- [ ] **Bibliography: Gupta — On the cancellation problem for the affine space $A^3$ in characteristic p (Invent. M...**
  - Location: bibliography entry: `Gupta — On the cancellation problem for the affine space $A^3$ in characteristic p (Invent. Math., 2014)`
  - Evidence: The introduction surveys positive and negative results on the Zariski cancellation problem but does not appear to cite Gupta's landmark negative result showing cancellation fails for $A^3_k$ over fields of positive characteristic, one of the most significant recent developments in the area; even though the current paper works in characteristic zero, citing this result would complete the discussion of the cancellation landscape. It may, however, appear in the 38 omitted bibliography entries.
  - Required change: Add a bibliography entry for `Gupta — On the cancellation problem for the affine space A^3 in characteristic p (Invent. Math., 2014)` and cite it where the affected method or claim is introduced, or explicitly justify its omission.
  - Verification: Re-review should confirm the bibliography and citation context address this reference.
- [ ] **Bibliography: Pham (1965) original work on Brieskorn-Pham singularities**
  - Location: bibliography entry: `Pham (1965) original work on Brieskorn-Pham singularities`
  - Evidence: The original definition and study of the Brieskorn-Pham polynomials (or its precursor in Pham 1965, Brieskorn 1966) is not cited. These foundational papers introduced the varieties under study and would normally appear in the bibliography of any paper on BP varieties.
  - Required change: Add or discuss missing prior art `Pham (1965) original work on Brieskorn-Pham singularities`. The original definition and study of the Brieskorn-Pham polynomials (or its precursor in Pham 1965, Brieskorn 1966) is not cited. These foundational papers introduced the varieties under study and would normally appear in the bibliography of any paper on BP varieties.
  - Verification: Re-review should confirm the related-work discussion addresses this prior art.
- [ ] **Manuscript: Subsection 3.2, Theorem 10 (proof via eqn1, eqn2)**
  - Location: `corrections/2606.26890/paper.tex` at `Subsection 3.2, Theorem 10 (proof via eqn1, eqn2)`
  - Evidence: The inductive Claim and dimension bookkeeping (m≥in, ℓ≤⌊m/n⌋) are internally consistent and the final indecomposable-factor matching is valid given the cited Hauser–Müller cancellation (HM1990 Thm 1) and unique factorization (Thm 4), plus Artin approximation. The novel content is the intricate induction, which is not machine-verified, and the load-bearing external theorems cannot be confirmed from the text. (Cosmetic: stray '0◻' end-of-claim marker.)
  - Required change: Formalize the dimension-counting induction (the Claim) as src/proofs/CancellationInduction.lean treating Hauser–Müller cancellation/factorization as axioms, to make the bookkeeping machine-checkable independent of the analytic inputs.
  - Verification: Re-review should confirm `Subsection 3.2, Theorem 10 (proof via eqn1, eqn2)` is corrected or justified.

## Open Questions

- Can the authors provide a Lean, Isabelle, or Coq formalization—or at minimum a computer-algebra verification script (Macaulay2, Singular, or SageMath)—for the Hilbert-series factorization identity at the core of Lemma 6 and the associated induction?
- Does Gupta's 2014 negative cancellation result for $A^3$ in positive characteristic (Inventiones Mathematicae) appear in the full bibliography, and if not, do the authors intend to cite it in the introduction's survey?
- Are the original Pham (1965) and Brieskorn (1966) papers introducing Brieskorn–Pham singularities cited elsewhere in the full bibliography, or are they deliberately omitted?
- Can the authors confirm the exact theorem and proposition numbers from Hauser–Müller (1990) invoked in Theorem 10, and verify that 'Theorem 4' (unique factorization for algebroid spaces) matches the published numbering?
- The proof of Theorem 10 contains a stray '0◻' end-of-claim marker; is this a typesetting artifact, and has the manuscript been proofread for similar issues?

## Per-Agent Reviews

### citation (`sonnet[1m]`) — status: `warn`

```json
{
  "confidence": 0.71,
  "entries": [
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Fujita, Takao"
        ],
        "doi": null,
        "key": "Fuj1979",
        "raw": "AUTHOR = Fujita, Takao, TITLE = On Zariski problem, JOURNAL = Proc. Japan Acad. Ser. A Math. Sci., FJOURNAL = Japan Academy. Proceedings. Series A. Mathematical Sciences, VOLUME = 55, YEAR = 1979, NUMBER = 3, PAGES = 106--110, ISSN = 0386-2194, MRNUMBER = 531454, URL = http://projecteuclid.org/euclid.pja/1195517399",
        "title": "On Zariski problem",
        "url": "http://projecteuclid.org/euclid.pja/1195517399",
        "venue": "Proc. Japan Acad. Ser. A Math. Sci.",
        "year": 1979
      },
      "exists": null,
      "explanation": "Cited as the key positive result motivating the paper: Fujita proved Zariski cancellation for the affine plane A^2_k over any field of characteristic zero, framing the generalized cancellation problem studied here.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Danielewski, Wlodzimierz"
        ],
        "doi": null,
        "key": "Dan1989",
        "raw": "title=On the cancellation problem and automorphism groups of affine algebraic varieties, author=Danielewski, Wlodzimierz, journal=preprint, Warsaw, year=1989",
        "title": "On the cancellation problem and automorphism groups of affine algebraic varieties",
        "url": null,
        "venue": "preprint, Warsaw",
        "year": 1989
      },
      "exists": null,
      "explanation": "Introduces the Danielewski surfaces D_n, which are the foundational counterexamples to the classical Zariski cancellation problem that motivate the generalized cancellation framework of this paper.",
      "notes": "Unpublished preprint (Warsaw, 1989). Widely cited in the literature in this form; no DOI or URL is available.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Fieseler, Karl-Heinz"
        ],
        "doi": "10.1007/BF02564471",
        "key": "Fie1994",
        "raw": "AUTHOR = Fieseler, Karl-Heinz, TITLE = On complex affine surfaces with $C^+$-action, JOURNAL = Comment. Math. Helv., FJOURNAL = Commentarii Mathematici Helvetici, VOLUME = 69, YEAR = 1994, NUMBER = 1, PAGES = 5--27, ISSN = 0010-2571,1420-8946, MRCLASS = 14J26 (14D25 14L30), MRNUMBER = 1259603, DOI = 10.1007/BF02564471, URL = https://doi.org/10.1007/BF02564471",
        "title": "On complex affine surfaces with C+-action",
        "url": "https://doi.org/10.1007/BF02564471",
        "venue": "Comment. Math. Helv.",
        "year": 1994
      },
      "exists": null,
      "explanation": "Cited for proving that the Danielewski surfaces D_n are pairwise non-isomorphic via homology groups at infinity, confirming they provide genuine counterexamples to Zariski cancellation.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Shioda, Tetsuji"
        ],
        "doi": null,
        "key": "Shi1977",
        "raw": null,
        "title": null,
        "url": null,
        "venue": null,
        "year": 1977
      },
      "exists": null,
      "explanation": "Cited as a counterexample to cancellation in global complex analytic geometry: Shioda constructed pairwise non-isomorphic elliptic curves whose products are isomorphic, contrasting with the positive cancellation results the paper establishes.",
      "notes": "This entry falls among the 38 bibliography entries omitted from this prompt; full raw record unavailable. The attribution to Shioda 1977 for a non-cancellation result for elliptic curves in the global analytic setting should be confirmed by the verifier.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Fujita, Takao"
        ],
        "doi": "10.1007/BF01393936",
        "key": "Fuj1981",
        "raw": "AUTHOR = Fujita, Takao, TITLE = Cancellation problem of complete varieties, JOURNAL = Invent. Math., FJOURNAL = Inventiones Mathematicae, VOLUME = 64, YEAR = 1981, NUMBER = 1, PAGES = 119--121, ISSN = 0020-9910,1432-1297, MRCLASS = 14J05, MRNUMBER = 621772, DOI = 10.1007/BF01393936, URL = https://doi.org/10.1007/BF01393936",
        "title": "Cancellation problem of complete varieties",
        "url": "https://doi.org/10.1007/BF01393936",
        "venue": "Invent. Math.",
        "year": 1981
      },
      "exists": null,
      "explanation": "Cited for the positive cancellation theorem for complete varieties when Z is projective and one of (X,Z) or (Y,Z) is Picard-independent, contextualizing the analytic cancellation landscape surveyed in the introduction.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Hauser, Herwig",
          "Müller, Gerd"
        ],
        "doi": null,
        "key": "HM1990",
        "raw": null,
        "title": null,
        "url": null,
        "venue": null,
        "year": 1990
      },
      "exists": null,
      "explanation": "The most critically used reference in the paper: Hauser-Müller's generalized cancellation theorem for analytic space germs (Theorem 1) and their unique factorization theorems for algebroid spaces (Theorems 2 and 3) form the analytical backbone of the proofs of Theorems 1 and 2.",
      "notes": "Entry falls among the 38 bibliography entries omitted from this prompt. Three distinct theorems (Theorems 1, 2, 3) from this single paper are invoked as fundamental tools in the core proofs; the verifier should confirm bibliographic details and that all three theorem numbers match the actual paper.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Milnor, John W."
        ],
        "doi": null,
        "key": "Mil1968",
        "raw": null,
        "title": "Singular Points of Complex Hypersurfaces",
        "url": null,
        "venue": "Annals of Mathematics Studies 61, Princeton University Press",
        "year": 1968
      },
      "exists": null,
      "explanation": "Cited as the classical source for the fact that every isolated hypersurface singularity has a well-defined embedded topological type and algebraic knot, providing foundational context for the rigidity phenomena the paper builds upon.",
      "notes": "Entry falls among the 38 bibliography entries omitted from this prompt. Title and venue are inferred from the standard reference matching this key; the verifier should confirm.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Yoshinaga, Eiji",
          "Suzuki, Michio"
        ],
        "doi": null,
        "key": "YS1978",
        "raw": null,
        "title": null,
        "url": null,
        "venue": null,
        "year": 1978
      },
      "exists": null,
      "explanation": "Cited for the fundamental rigidity result that homeomorphism of Brieskorn-Pham germs implies equality of exponent tuples up to permutation, a key predecessor that Theorem 3 (Exponent Rigidity) strengthens and extends algebraically.",
      "notes": "Entry falls among the 38 bibliography entries omitted from this prompt. Cited in two locations: the introduction (topological type determines exponent tuple) and the proofs section (as an alternative route to a consequence of Theorem 3).",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Yoshinaga, Eiji"
        ],
        "doi": null,
        "key": "Yos1983",
        "raw": null,
        "title": null,
        "url": null,
        "venue": null,
        "year": 1983
      },
      "exists": null,
      "explanation": "Used in complementary roles: the Corollary supports the positive rigidity picture, while Examples 1 and 2 demonstrate that link topology alone is insufficient to determine the exponent tuple, illustrating the hierarchy of invariants that motivates Theorem 3.",
      "notes": "Entry falls among the 38 bibliography entries omitted from this prompt. Cited at two distinct locations: the Corollary (confirming topological rigidity, complementing YS1978) and Examples 1, 2 (exhibiting link-homeomorphic families with distinct exponent tuples).",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Blanloeil, Vincent",
          "Saeki, Osamu"
        ],
        "doi": "10.3836/tjm/1327931395",
        "key": "BS2011",
        "raw": "AUTHOR = Blanl\\oeil, Vincent and Saeki, Osamu, TITLE = Cobordism of algebraic knots defined by Brieskorn polynomials, JOURNAL = Tokyo J. Math., FJOURNAL = Tokyo Journal of Mathematics, VOLUME = 34, YEAR = 2011, NUMBER = 2, PAGES = 429--443, ISSN = 0387-3870, MRNUMBER = 2918915, DOI = 10.3836/tjm/1327931395, URL = https://doi.org/10.3836/tjm/1327931395",
        "title": "Cobordism of algebraic knots defined by Brieskorn polynomials",
        "url": "https://doi.org/10.3836/tjm/1327931395",
        "venue": "Tokyo J. Math.",
        "year": 2011
      },
      "exists": null,
      "explanation": "Cited for the result that cobordism of algebraic knots detects the exponent tuple under a non-divisibility assumption, situating Theorem 3 within the broader landscape of invariants that recover the exponent tuple.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2404.06922",
        "authors": [
          "Fernandes, Alexandre",
          "Jelonek, Zbigniew",
          "Sampaio, José Edson"
        ],
        "doi": null,
        "key": "FJS2024_arxiv",
        "raw": "title=On metric equivalence of the Brieskorn-Pham hypersurfaces, author=Alexandre Fernandes and Zbigniew Jelonek and Jos\\'e Edson Sampaio, year=2024, eprint=2404.06922, archivePrefix=arXiv, primaryClass=math.AG, url=https://arxiv.org/abs/2404.06922",
        "title": "On metric equivalence of the Brieskorn-Pham hypersurfaces",
        "url": "https://arxiv.org/abs/2404.06922",
        "venue": "arXiv preprint",
        "year": 2024
      },
      "exists": null,
      "explanation": "Cited for the recent result that bi-Lipschitz equivalence of Brieskorn-Pham analytic germs forces the smallest exponents to coincide, directly motivating the need for the stronger algebraic exponent rigidity proved as Theorem 3.",
      "notes": "Cited as an arXiv preprint (2404.06922, April 2024). The '_arxiv' suffix in the citation key indicates the authors are aware of its preprint status; should be checked for a published version.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Campesato, Jean-Baptiste"
        ],
        "doi": "10.1007/s00209-018-2056-7",
        "key": "Cam2018",
        "raw": "AUTHOR = Campesato, Jean-Baptiste, TITLE = Complete classification of Brieskorn polynomials up to the arc-analytic equivalence, JOURNAL = Math. Z., FJOURNAL = Mathematische Zeitschrift, VOLUME = 290, YEAR = 2018, NUMBER = 3-4, PAGES = 1145--1163, ISSN = 0025-5874,1432-1823, MRNUMBER = 3856848, DOI = 10.1007/s00209-018-2056-7, URL = https://doi.org/10.1007/s00209-018-2056-7",
        "title": "Complete classification of Brieskorn polynomials up to the arc-analytic equivalence",
        "url": "https://doi.org/10.1007/s00209-018-2056-7",
        "venue": "Math. Z.",
        "year": 2018
      },
      "exists": null,
      "explanation": "Cited for arc-analytic exponent rigidity of Brieskorn polynomials over the reals, described as an analogue of Yoshinaga-Suzuki, providing a real-algebraic counterpart to the rigidity phenomena the paper extends to the algebraic and analytic settings over C.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Ishii, Shihoko"
        ],
        "doi": null,
        "key": "Ish2014",
        "raw": null,
        "title": "Introduction to Singularities",
        "url": null,
        "venue": "Springer",
        "year": 2014
      },
      "exists": null,
      "explanation": "Cited as the textbook reference for the Hironaka-Rossi-Artin theorem on analytic germs and Artin's algebraization theorem, providing the foundational analytic tools for the reduction arguments in Section 3.2.",
      "notes": "Entry falls among the 38 bibliography entries omitted from this prompt. Title and venue are inferred from the standard Springer textbook on singularities by Ishii (2014). Used as a convenient source for two standard theorems (4.2.3, 4.2.4) rather than their original papers.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Avramov, Luchezar L.",
          "Buchweitz, Ragnar-Olaf"
        ],
        "doi": null,
        "key": "AB1993",
        "raw": "AUTHOR = Avramov, Luchezar L. and Buchweitz, Ragnar-Olaf, TITLE = Lower bounds for Betti numbers, JOURNAL = Compositio Math., FJOURNAL = Compositio Mathematica, VOLUME = 86, YEAR = 1993, NUMBER = 2, PAGES = 147--158, ISSN = 0010-437X,1570-5846, MRNUMBER = 1214454, URL = http://www.numdam.org/item?id=CM_1993__86_2_147_0",
        "title": "Lower bounds for Betti numbers",
        "url": "http://www.numdam.org/item?id=CM_1993__86_2_147_0",
        "venue": "Compositio Math.",
        "year": 1993
      },
      "exists": null,
      "explanation": "Cited in the proofs section for lower bounds on Betti numbers for quotient rings T/I and T/J of a polynomial ring over k, used in the Hilbert series argument that recovers the exponent tuple and establishes exponent rigidity (Theorem 3).",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Gurjar, R. V."
        ],
        "doi": "10.1007/978-3-030-42136-6_7",
        "key": "Gur2020",
        "raw": "AUTHOR = Gurjar, R. V., TITLE = A graded domain is determined at its vertex. Applications to invariant theory, BOOKTITLE = Polynomial rings and affine algebraic geometry, SERIES = Springer Proc. Math. Stat., VOLUME = 319, PAGES = 195--198, PUBLISHER = Springer, Cham, YEAR = 2020, DOI = 10.1007/978-3-030-42136-6\\_7, URL = https://doi.org/10.1007/978-3-030-42136-6_7",
        "title": "A graded domain is determined at its vertex. Applications to invariant theory",
        "url": "https://doi.org/10.1007/978-3-030-42136-6_7",
        "venue": "Polynomial rings and affine algebraic geometry, Springer Proc. Math. Stat., vol. 319, Springer, Cham",
        "year": 2020
      },
      "exists": null,
      "explanation": "Cited for Gurjar's theorem (Theorem 2 of that paper) that a graded domain is determined by its local ring at the vertex, which is invoked in the proof of the main cancellation theorem (Theorem 1) to pass from the analytic germ isomorphism to an algebraic isomorphism.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    }
  ],
  "missing_references": [
    {
      "reason": "The introduction surveys positive and negative results on the Zariski cancellation problem but does not appear to cite Gupta's landmark negative result showing cancellation fails for A^3_k over fields of positive characteristic, one of the most significant recent developments in the area; even though the current paper works in characteristic zero, citing this result would complete the discussion of the cancellation landscape. It may, however, appear in the 38 omitted bibliography entries.",
      "title": "Gupta — On the cancellation problem for the affine space A^3 in characteristic p (Invent. Math., 2014)"
    }
  ],
  "summary": "The paper's bibliography is purposeful and well-matched to its narrow topic: the most-cited references (Hauser-Müller 1990, Yoshinaga-Suzuki 1978, Fujita 1979, Gurjar 2020) are each invoked substantively and with precision in the core proofs. The Hauser-Müller work is the most critical dependency, with three distinct theorems drawn from it; since its full entry falls among the 38 entries omitted from this prompt, the verifier should prioritize confirming its bibliographic details and theorem numbering. The use of Danielewski 1989 as an unpublished preprint and FJS2024 as an arXiv preprint follows standard practice for these widely-known works. The bounded nature of this prompt (only 32 of 70 entries rendered) limits confidence in identifying genuinely missing references, but the absence of a citation to Gupta's 2014 positive-characteristic cancellation result is a potential gap in the introduction's survey."
}
```

### meta_reviewer (`sonnet[1m]`) — status: `pass`

```json
{
  "confidence": 0.78,
  "questions": [
    "Can the authors provide a Lean, Isabelle, or Coq formalization—or at minimum a computer-algebra verification script (Macaulay2, Singular, or SageMath)—for the Hilbert-series factorization identity at the core of Lemma 6 and the associated induction?",
    "Does Gupta's 2014 negative cancellation result for A^3 in positive characteristic (Inventiones Mathematicae) appear in the full bibliography, and if not, do the authors intend to cite it in the introduction's survey?",
    "Are the original Pham (1965) and Brieskorn (1966) papers introducing Brieskorn–Pham singularities cited elsewhere in the full bibliography, or are they deliberately omitted?",
    "Can the authors confirm the exact theorem and proposition numbers from Hauser–Müller (1990) invoked in Theorem 10, and verify that 'Theorem 4' (unique factorization for algebroid spaces) matches the published numbering?",
    "The proof of Theorem 10 contains a stray '0◻' end-of-claim marker; is this a typesetting artifact, and has the manuscript been proofread for similar issues?"
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "The inductive Claim and dimension bookkeeping (m≥in, ℓ≤⌊m/n⌋) are internally consistent and the final indecomposable-factor matching is valid given the cited Hauser–Müller cancellation (HM1990 Thm 1) and unique factorization (Thm 4), plus Artin approximation. The novel content is the intricate induction, which is not machine-verified, and the load-bearing external theorems cannot be confirmed from the text. (Cosmetic: stray '0◻' end-of-claim marker.)",
      "id": "weakness-1",
      "locator": "Subsection 3.2, Theorem 10 (proof via eqn1, eqn2)",
      "required_update": "Formalize the dimension-counting induction (the Claim) as src/proofs/CancellationInduction.lean treating Hauser–Müller cancellation/factorization as axioms, to make the bookkeeping machine-checkable independent of the analytic inputs.",
      "source_path": "corrections/2606.26890/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Subsection 3.2, Theorem 10 (proof via eqn1, eqn2)` is corrected or justified.",
      "weakness_index": 0
    },
    {
      "evidence": "The introduction surveys positive and negative results on the Zariski cancellation problem but does not appear to cite Gupta's landmark negative result showing cancellation fails for A^3_k over fields of positive characteristic, one of the most significant recent developments in the area; even though the current paper works in characteristic zero, citing this result would complete the discussion of the cancellation landscape. It may, however, appear in the 38 omitted bibliography entries.",
      "id": "weakness-2",
      "locator": "Gupta — On the cancellation problem for the affine space A^3 in characteristic p (Invent. Math., 2014)",
      "required_update": "Add a bibliography entry for `Gupta — On the cancellation problem for the affine space A^3 in characteristic p (Invent. Math., 2014)` and cite it where the affected method or claim is introduced, or explicitly justify its omission.",
      "source_path": null,
      "source_role": "citation",
      "status": "open",
      "target_kind": "bibliography",
      "verification_check": "Re-review should confirm the bibliography and citation context address this reference.",
      "weakness_index": 1
    },
    {
      "evidence": "The original definition and study of the Brieskorn-Pham polynomials (or its precursor in Pham 1965, Brieskorn 1966) is not cited. These foundational papers introduced the varieties under study and would normally appear in the bibliography of any paper on BP varieties.",
      "id": "weakness-3",
      "locator": "Pham (1965) original work on Brieskorn-Pham singularities",
      "required_update": "Add or discuss missing prior art `Pham (1965) original work on Brieskorn-Pham singularities`. The original definition and study of the Brieskorn-Pham polynomials (or its precursor in Pham 1965, Brieskorn 1966) is not cited. These foundational papers introduced the varieties under study and would normally appear in the bibliography of any paper on BP varieties.",
      "source_path": null,
      "source_role": "novelty",
      "status": "open",
      "target_kind": "bibliography",
      "verification_check": "Re-review should confirm the related-work discussion addresses this prior art.",
      "weakness_index": 2
    },
    {
      "evidence": "The inductive Claim and dimension bookkeeping (m≥in, ℓ≤⌊m/n⌋) are internally consistent and the final indecomposable-factor matching is valid given the cited Hauser–Müller cancellation (HM1990 Thm 1) and unique factorization (Thm 4), plus Artin approximation. The novel content is the intricate induction, which is not machine-verified, and the load-bearing external theorems cannot be confirmed from the text. (Cosmetic: stray '0◻' end-of-claim marker.)",
      "id": "weakness-4",
      "locator": "Subsection 3.2, Theorem 10 (proof via eqn1, eqn2)",
      "required_update": "Formalize the dimension-counting induction (the Claim) as src/proofs/CancellationInduction.lean treating Hauser–Müller cancellation/factorization as axioms, to make the bookkeeping machine-checkable independent of the analytic inputs.",
      "source_path": "corrections/2606.26890/paper.tex",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Subsection 3.2, Theorem 10 (proof via eqn1, eqn2)` is corrected or justified.",
      "weakness_index": 3
    }
  ],
  "strengths": [
    "The four-way equivalence for Brieskorn–Pham varieties—algebraic isomorphism, C*-variety isomorphism, analytic germ isomorphism, and permutation of exponent tuples—is a complete and sharp classification result that substantially closes the cancellation problem for this class.",
    "The exponent rigidity theorem holds over any field of characteristic zero, not just C, giving the results broader applicability than prior topological and metric analogues.",
    "The proof architecture—composing Hauser–Müller analytic cancellation, Artin approximation, and Gurjar's algebraization theorem—is architecturally coherent and draws on deep tools across analytic, algebraic, and invariant-theoretic geometry in a non-trivial way.",
    "The results decisively improve on Yoshinaga–Suzuki (homeomorphism implies permuted exponents) and Fernandes–Jelonek–Sampaio (bi-Lipschitz equivalence forces equal minimal exponents) by recovering the full exponent tuple from purely algebraic isomorphism alone."
  ],
  "summary": "The paper establishes three main results in algebraic geometry: (1) a generalized Zariski cancellation theorem for complex affine varieties with a unique singularity and a good C*-action; (2) an exponent rigidity theorem showing the exponent tuple of a Brieskorn–Pham variety completely determines its isomorphism class algebraically, analytically, and formally over any characteristic-zero field; and (3) a four-way equivalence theorem combining (1) and (2) for Brieskorn–Pham varieties specifically. The paper's field is math.AG, which falls within the code-amenable set. Both the reproducibility specialist (severity: critical, for the missing formal verification of the headline cancellation theorem) and the technical correctness specialist (severity: major, for Lemma 6 / Key Lemma, Theorem 7 Jacobian computation, Theorem 10 cancellation induction, and Theorem 14) flagged absent proof-as-code artifacts against the paper's core results. Under the recommendation gate, this mandates a default of major_revision. The technical correctness specialist judged the paper 'mostly_sound' overall (confidence 0.6), and the proofs are described as internally consistent and plausibly correct, but none of the load-bearing steps—the Hilbert-series factorization identity, the Jacobian ideal equality, the dimension-counting induction in Theorem 10—are accompanied by machine-checkable artifacts or computational verification. The novelty is rated 'significant' (score 0.72, confidence 0.78): the results cleanly extend and unify prior topological and metric rigidity results (Yoshinaga–Suzuki, Fernandes–Jelonek–Sampaio, Campesato) into a single algebraic framework, and the generalized cancellation represents a genuine advance. The citation review identified several potentially missing references—most notably Gupta (2014), which is absent from the portion of the bibliography reviewed, and the foundational Pham (1965) and Brieskorn (1966) papers—though 38 of 70 bibliography entries were not rendered in the review input, limiting confidence in these findings. The reproducibility specialist correctly noted that the paper is purely theoretical with no empirical datasets; the reproducibility gap is entirely about the absence of machine-checked proofs for a math.* paper making specific, formalizable algebraic claims.",
  "weaknesses": [
    "The headline cancellation theorem (Theorem 2 / Theorem 14) and the exponent rigidity theorem (Theorem 3 / Theorem 7) are not accompanied by any machine-checkable proof artifact, leaving the critical inductive dimension-counting argument in Theorem 10 and the Hilbert-series factorization identity in Lemma 6 formally unverified.",
    "The introduction's survey of the Zariski cancellation landscape does not appear to cite Gupta's 2014 negative result for A^3 in positive characteristic (Invent. Math.), an important recent development whose absence leaves the characteristic-zero context of the paper's positive results undercontextualized.",
    "The foundational Pham (1965) and Brieskorn (1966) papers introducing Brieskorn–Pham singularities do not appear in the reviewed bibliography entries, a notable attribution gap for a paper whose central objects of study are these varieties.",
    "The proof of Theorem 10 loads critically on three distinct theorems from Hauser–Müller (1990), but the theorem numbers cited cannot be confirmed against the published paper from the provided text, introducing a bibliographic risk to the central analytic reduction."
  ]
}
```

### novelty (`sonnet[1m]`) — status: `pass`

```json
{
  "confidence": 0.78,
  "missing_prior_art": [
    {
      "reason": "Neena Gupta's celebrated result showing the cancellation problem fails for A^n (n≥3) in positive characteristic is highly relevant context for the landscape of the Zariski cancellation problem and the significance of the present positive results in characteristic zero. It should be mentioned to sharpen the contrast with the positive-characteristic world.",
      "title": "Negative solution to the Zariski cancellation problem in positive characteristic (Gupta, 2014)"
    },
    {
      "reason": "The Makar-Limanov invariant has been widely used to attack Zariski cancellation problems for affine varieties; since BP varieties admit good C*-actions, their Makar-Limanov invariant equals the coordinate ring (trivial locally nilpotent derivations), and discussing this connection would contextualize the choice of method.",
      "title": "Makar-Limanov invariant and its role in cancellation results"
    },
    {
      "reason": "The original definition and study of the Brieskorn-Pham polynomials (or its precursor in Pham 1965, Brieskorn 1966) is not cited. These foundational papers introduced the varieties under study and would normally appear in the bibliography of any paper on BP varieties.",
      "title": "Pham (1965) original work on Brieskorn-Pham singularities"
    }
  ],
  "novelty_score": 0.72,
  "related_work": [
    {
      "citation_key": "HM1990",
      "delta": "This paper's Theorem 10 (analytic reduction) and its proof rely critically on Hauser-Müller's cancellation theorem for analytic space germs and their unique factorization theorem for algebroid spaces. The present work extends their analytic cancellation to the algebraic setting for varieties with isolated singularities by combining it with Artin's approximation, obtaining a generalized algebraic cancellation theorem.",
      "relation": "builds_on",
      "title": "The cancellation property for direct products of analytic space germs"
    },
    {
      "citation_key": "Gur2020",
      "delta": "Gurjar's algebraization theorem (Lemma 12) is a key ingredient: it shows that analytic isomorphism of germs at vertices implies algebraic isomorphism of the ambient good C*-varieties. Without this, the analytic conclusion of Theorem 10 could not be promoted to an algebraic isomorphism (Theorem 13).",
      "relation": "builds_on",
      "title": "A graded domain is determined at its vertex. Applications to invariant theory"
    },
    {
      "citation_key": "YS1978",
      "delta": "Yoshinaga-Suzuki proved that homeomorphism of the analytic germs of two BP singularities forces the exponent tuples to be permutations of each other. The present paper establishes the same rigidity conclusion from purely algebraic isomorphism of the varieties over any field of characteristic zero, and also for formal and analytic germs over C, giving a purely algebraic proof that does not rely on topological invariants.",
      "relation": "prior_art",
      "title": "On the topological types of singularities of Brieskorn-Pham type"
    },
    {
      "citation_key": "Dan1989",
      "delta": "Danielewski's construction provides the foundational counterexample to classical Zariski cancellation (X×A¹ ≅ Y×A¹ does not imply X≅Y) that motivates the paper. The present work shows BP varieties are immune to this failure and satisfy even generalized cancellation.",
      "relation": "prior_art",
      "title": "On the cancellation problem and automorphism groups of affine algebraic varieties"
    },
    {
      "citation_key": "Fuj1979",
      "delta": "Fujita proved cancellation for the affine plane A² over any characteristic-zero field, one of the earliest positive results on the Zariski cancellation problem. The present paper establishes a far stronger (generalized, arbitrary Z) cancellation result for BP varieties.",
      "relation": "prior_art",
      "title": "On Zariski problem"
    },
    {
      "citation_key": "Fuj1981",
      "delta": "Fujita proved cancellation for complete varieties with a Picard-independence condition. The present paper handles isolated-singularity affine varieties in the analytic category, a structurally different setting.",
      "relation": "prior_art",
      "title": "Cancellation problem of complete varieties"
    },
    {
      "citation_key": "Fie1994",
      "delta": "Fieseler distinguished Danielewski surfaces via homology groups at infinity, confirming the classical Zariski cancellation fails. The present paper complements this by establishing positive cancellation results for the different (isolated singularity, good C*-action) class of BP varieties.",
      "relation": "prior_art",
      "title": "On complex affine surfaces with C+-action"
    },
    {
      "citation_key": "Cam2018",
      "delta": "Campesato proved exponent rigidity under arc-analytic equivalence over R, an analogue of the Yoshinaga-Suzuki theorem in the real setting. The present paper establishes algebraic exponent rigidity over arbitrary char-0 fields, a strictly stronger and more general result.",
      "relation": "prior_art",
      "title": "Complete classification of Brieskorn polynomials up to the arc-analytic equivalence"
    },
    {
      "citation_key": "FJS2024_arxiv",
      "delta": "Fernandez-Jelonek-Sampaio showed that bi-Lipschitz equivalence of analytic germs forces the minimal exponents to agree. The present paper achieves complete exponent determination (all exponents up to permutation) from algebraic isomorphism alone, which is a strictly stronger conclusion.",
      "relation": "prior_art",
      "title": "On metric equivalence of the Brieskorn-Pham hypersurfaces"
    },
    {
      "citation_key": "BS2011",
      "delta": "Blanloeil-Saeki characterized when two Brieskorn polynomials have cobordant algebraic knots in terms of the exponent tuples (under no-divisibility hypothesis). The present paper uses algebraic/ring-theoretic methods to determine the exponent tuple under isomorphism of the varieties, with no hypothesis on divisibility among exponents.",
      "relation": "prior_art",
      "title": "Cobordism of algebraic knots defined by Brieskorn polynomials"
    },
    {
      "citation_key": "Mil1968",
      "delta": "Milnor's foundational monograph defines the topological invariants (Milnor fiber, monodromy, algebraic knot) associated to isolated hypersurface singularities, providing the framework within which BP singularities are studied. The present paper works in the algebraic rather than topological category.",
      "relation": "prior_art",
      "title": "Singular points of complex hypersurfaces"
    },
    {
      "citation_key": "AB1993",
      "delta": "The Hilbert-series multiplicativity formula (equation for H_{T/I ⊗ T/J}) used in the proof of the key Lemma 6 is cited from Avramov-Buchweitz. This is a technical tool in the exponent rigidity proof.",
      "relation": "builds_on",
      "title": "Lower bounds for Betti numbers"
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
      "description": "No source repository, release, commit, license, or executable/checkable artifact is provided for reproducing the paper's theoretical claims.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "The headline generalized Zariski cancellation theorem for Brieskorn--Pham varieties is not accompanied by a formal verification artifact; a file such as formalization/BrieskornPhamCancellation.lean or formalization/BrieskornPhamCancellation.v would be needed to independently check the proof mechanically.",
      "severity": "critical"
    },
    {
      "area": "other",
      "description": "The exponent rigidity theorem for Brieskorn--Pham varieties relies on algebraic arguments about singular schemes and Hilbert series but has no proof-as-code artifact; a file such as formalization/ExponentRigidity.lean would close this reproducibility gap.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "The analytic cancellation reduction using Hauser--Muller factorization, Artin approximation, and isolated-singularity indecomposability is not provided in a machine-checkable form; a file such as formalization/AnalyticCancellationReduction.lean would be needed for formal reproduction.",
      "severity": "major"
    },
    {
      "area": "data",
      "description": "The paper states that no datasets were generated or analyzed, so there is no empirical dataset to retrieve or rerun against.",
      "severity": "info"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `http://www.numdam.org/item?id=CM_1995__99_3_213_0` (status=network_error)",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `http://www.numdam.org/item?id=ASENS_1983_4_16_2_305_0` (status=network_error)",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://doi.org/10.1070/IM1988v030n03ABEH001027` (status=network_error)",
      "severity": "minor"
    }
  ],
  "confidence": 0.86,
  "data_availability": "unspecified",
  "data_url": null,
  "environment": null,
  "reproducibility_score": 0.25
}
```

### summary (`claude-haiku-4-5`) — status: `pass`

```json
{
  "audience": "Algebraic geometers and singularity theorists, particularly those interested in affine geometry, cancellation problems, and Brieskorn–Pham singularities; graduate students in commutative algebra and complex analytic geometry",
  "key_contributions": [
    "Proof of a generalized Zariski cancellation theorem for complex affine varieties with a single singular point and good C*-actions: if two such varieties become isomorphic after taking a product with any separated complex scheme having a smooth point, they are already isomorphic",
    "Exponent rigidity theorem: the exponent tuple of a Brieskorn–Pham variety completely determines its isomorphism class as an algebraic variety, analytic germ, and formal completion; this holds over any characteristic zero field",
    "A generalized Zariski cancellation theorem specific to Brieskorn–Pham varieties showing equivalence between product isomorphism, algebraic isomorphism, C*-variety isomorphism, and permutation equivalence of exponent tuples"
  ],
  "plain_language_summary": "In algebraic geometry, the Zariski cancellation problem asks whether isomorphic products necessarily contain isomorphic factors. For example, if X × Z is isomorphic to Y × Z, must X equal Y? The answer is generally no, but this paper shows that Brieskorn–Pham varieties (algebraic varieties defined by equations of the form X₁^a₁ + X₂^a₂ + · · · + Xₙ^aₙ = 0) satisfy a very strong form of cancellation.\n\nThe main contribution establishes that if two Brieskorn–Pham varieties with exponent tuples a and b become isomorphic after multiplying by any complex algebraic variety with a smooth point, then they must already be isomorphic to each other, and moreover their exponent tuples must be equal up to reordering. The proof combines several deep techniques: an exponent rigidity theorem showing the exponent tuple completely determines the algebraic structure, an analytic reduction theorem using Hauser–Müller's cancellation for analytic space germs, and tools from invariant theory under C*-actions.\n\nThese results strengthen earlier rigidity phenomena for Brieskorn–Pham varieties, which had been studied via topological and metric invariants. The exponent rigidity holds over any field of characteristic zero, making the results broadly applicable.",
  "tldr": "The paper proves that Brieskorn–Pham hypersurface varieties are completely determined by their exponent tuple, even after taking products with arbitrary schemes having smooth points."
}
```

### technical_correctness (`opus[1m]`) — status: `pass`

```json
{
  "claims": [
    {
      "assessment": "unsupported",
      "claim": "Lemma 6 (Key Lemma): if R=k[X]/(X_1^{a_1},...,X_r^{a_r}) and S=k[X]/(X_1^{b_1},...,X_s^{b_s}) are k-algebra isomorphic, then r=s and the sorted exponent tuples coincide. The proof reduces, via the nilradical-adic associated graded ring and multiplicativity of Hilbert series, to the polynomial identity ∏(1−t^{a_i})=∏(1−t^{b_i}) ⟹ equal sorted tuples.",
      "evidence": "The textual proof is complete and appears correct: gr_{N}(R)≅k[X_{r+1..n}]⊗k[U]/(U_i^{a_i}) gives the stated Hilbert series, and the lowest-nonconstant-term comparison plus inductive cancellation of (1−t^{a_1})^p validly forces a_1=b_1,p=q and inductively a_i=b_i. However, this is a purely symbolic/combinatorial fact in a math.* (code-amenable) field and the paper ships no machine-checked artifact; the unique-factorization-of-∏(1−t^{a_i}) step is fully formalizable but unverified.",
      "id": "C1",
      "location": "Subsection 3.1, Lemma 6; eq:key, eq:key1, eq:key2",
      "severity": "major",
      "suggested_fix": "Ship a Lean/Isabelle formalization of the Hilbert-series identity and the tuple-recovery induction, e.g. src/proofs/KeyLemma.lean, or a CAS verification script experiments/hilbert_series/check.py covering the factorization ∏(1−t^{a_i})=∏(1−t^{b_i}) ⟹ tuples equal."
    },
    {
      "assessment": "unsupported",
      "claim": "In Theorem 7, over a characteristic-0 field the Jacobian/singular-locus ideal satisfies (f_a,∂_1 f_a,...,∂_n f_a)=(X_1^{a_1-1},...,X_n^{a_n-1}), using ∂_i f_a=a_i X_i^{a_i-1} and the Euler relation f_a=Σ a_i^{-1} X_i ∂_i f_a.",
      "evidence": "The identity is correct: in char 0 each a_i is invertible so (∂_i f_a)=(X_i^{a_i-1}), and the Euler relation places f_a in that ideal, giving the claimed equality and Sing(V_{a,k̄})=Spec(k̄[X]/(X_i^{a_i-1})). This is an explicit ideal-equality computation amenable to a computer-algebra check, but no executable artifact (Macaulay2/Singular/Lean) is provided.",
      "id": "C2",
      "location": "Subsection 3.1, proof of Theorem 7",
      "severity": "major",
      "suggested_fix": "Add a symbolic verification, e.g. experiments/jacobian_ideal/check.m2 (Macaulay2) confirming (f,∂f)=(X_i^{a_i-1}) for representative tuples, or a Lean lemma src/proofs/JacobianIdeal.lean for the general Euler-relation argument."
    },
    {
      "assessment": "partially_supported",
      "claim": "Theorem 7 / Theorem 3(i) (headline exponent rigidity): for n≥2 and a,b∈(N_{≥2})^n over a char-0 field k, V_a≅_k V_b ⟺ B_a≅_{k-alg} B_b ⟺ a∼b.",
      "evidence": "The reduction is rigorous in the text: base-change to k̄, singular-locus preservation under isomorphism, the Jacobian computation (C2), and the Key Lemma (C1) chain correctly to a∼b; the reverse implication is by coordinate permutation. Correctness therefore inherits the unverified status of C1–C2. As a headline result in a code-amenable field, it ships no formal proof or reproducible verifier.",
      "id": "C3",
      "location": "Introduction Theorem 3; Subsection 3.1 Theorem 7",
      "severity": "major",
      "suggested_fix": "Provide an end-to-end formal proof src/proofs/ExponentRigidity.lean composing the Key Lemma and Jacobian-ideal results, and/or experiments/rigidity/verify_small.py exhaustively checking the equivalence for small n and bounded exponents."
    },
    {
      "assessment": "partially_supported",
      "claim": "Corollary 8: over C, completion/analytic-germ isomorphism of Brieskorn–Pham varieties recovers the exponent tuple (V̂_a≅V̂_b ⟺ V_a^{an}≅V_b^{an} ⟺ a∼b).",
      "evidence": "The argument retraces Lemma 6 over convergent/formal power series (Remark 1) and invokes Hironaka–Rossi/Artin (Theorem 1) for the completion/analytic equivalence; this is plausible and standard, but rests on the cited external equivalence and on the analytic version of Remark 1, neither of which is verifiable from the provided text.",
      "id": "C4",
      "location": "Subsection 3.1, Corollary 8 (cf. Theorem 3(ii))",
      "severity": "minor",
      "suggested_fix": "State and reference the precise power-series analogue of Lemma 6 explicitly (rather than 'retracing'), and cite the exact statement of the completed-local-ring criterion used; a formal artifact is optional here given the analytic dependency."
    },
    {
      "assessment": "partially_supported",
      "claim": "Theorem 10: if connected algebraic varieties X,Y over C each have a unique singular point P,Q and X×Z≅Y×Z for some separated Z with a smooth point, then the analytic germs (X,P),(Y,Q) are analytically isomorphic.",
      "evidence": "The inductive Claim and dimension bookkeeping (m≥in, ℓ≤⌊m/n⌋) are internally consistent and the final indecomposable-factor matching is valid given the cited Hauser–Müller cancellation (HM1990 Thm 1) and unique factorization (Thm 4), plus Artin approximation. The novel content is the intricate induction, which is not machine-verified, and the load-bearing external theorems cannot be confirmed from the text. (Cosmetic: stray '0◻' end-of-claim marker.)",
      "id": "C5",
      "location": "Subsection 3.2, Theorem 10 (proof via eqn1, eqn2)",
      "severity": "major",
      "suggested_fix": "Formalize the dimension-counting induction (the Claim) as src/proofs/CancellationInduction.lean treating Hauser–Müller cancellation/factorization as axioms, to make the bookkeeping machine-checkable independent of the analytic inputs."
    },
    {
      "assessment": "partially_supported",
      "claim": "Lemma 9: a connected algebroid space of positive dimension with an isolated singularity is indecomposable.",
      "evidence": "Proof is correct: from Sing(X)=(Sing(Y)×Z)∪(Y×Sing(Z)) and dim Sing(X)=0 with dim(Y)>0, one forces dim(Z)=0 and Sing(Z)=∅, so Z is a reduced point. The singular-locus product formula is standard over C; the result is sound but stated without a cited reference for that formula in the algebroid setting.",
      "id": "C6",
      "location": "Subsection 3.2, Lemma 9",
      "severity": "minor",
      "suggested_fix": "Cite or prove the product singular-locus formula Sing(Y×Z)=Sing(Y)×Z ∪ Y×Sing(Z) for algebroid spaces; optional formalization src/proofs/IndecomposableIsolated.lean."
    },
    {
      "assessment": "partially_supported",
      "claim": "Theorem 13 / Theorem 1: for positively graded affine C-domains R,S with good C*-actions whose vertices p,q are the unique singularities, V×Z≅W×Z (Z separated with a smooth point) implies V≅W as affine varieties.",
      "evidence": "The deduction is a clean composition of Theorem 10 (analytic germ iso at vertices) with Gurjar's algebraization (Lemma 12, cf. Gur2020 Thm 2). It is correct conditional on those two results; the Gurjar input is external and unverifiable here, and the whole theorem inherits the unverified status of Theorem 10.",
      "id": "C7",
      "location": "Subsection 3.2, Theorem 13; Remark 4",
      "severity": "minor",
      "suggested_fix": "Quote the precise statement of Gur2020 Theorem 2 used and confirm its hypotheses (graded domain, good C*-action) match; no separate code artifact needed beyond C5."
    },
    {
      "assessment": "partially_supported",
      "claim": "Theorem 14 / Theorem 2 (headline B–P cancellation): for n≥2 and a,b∈(N_{≥2})^n over C and any separated Z with a smooth point, V_a×Z≅V_b×Z ⟺ V_a≅V_b ⟺ V_a≅V_b as C*-varieties ⟺ a∼b.",
      "evidence": "(4)⟹(3) is an explicit, correct graded/equivariant isomorphism via the permutation σ with b_i=a_{σ(i)} and matching weights w_i=N/a_i; (3)⟹(2)⟹(1) are trivial; (1)⟹(4) invokes Theorem 10 and Corollary 8. The construction is sound, but the headline equivalence depends on the unverified Theorem 10 chain (C5) and exponent rigidity (C3–C4), and the paper ships no reproducible verifier even for small cases.",
      "id": "C8",
      "location": "Subsection 3.3, Theorem 14",
      "severity": "major",
      "suggested_fix": "Provide experiments/bp_cancellation/verify_small_cases.py confirming the four-way equivalence for small n and bounded exponents (constructing the explicit C*-isomorphism and checking exponent recovery), and/or a Lean assembly src/proofs/BPCancellation.lean combining C3 and C5."
    },
    {
      "assessment": "supported",
      "claim": "Each Brieskorn–Pham variety V_{a,k} (a∈(N_{≥2})^n) has a unique singular point at the origin, is normal for n≥3 and non-normal for n=2, and admits a good G_m-action with vertex the origin via deg(X_i)=N/a_i, N=lcm(a_i).",
      "evidence": "Standard and internally justified: the Jacobian criterion with ∂_i f=a_i X_i^{a_i-1} (a_i≥2) gives the origin as the only singular point; the weighting deg(X_i)=N/a_i makes f homogeneous of degree N with all positive weights and A_0=k, so the action is good with the origin as unique fixed point/vertex. These are routine facts not requiring an executable artifact.",
      "id": "C9",
      "location": "Introduction; Subsection 2.1",
      "severity": "info",
      "suggested_fix": null
    }
  ],
  "confidence": 0.6,
  "overall_correctness": "mostly_sound"
}
```

## Corrections

<!-- corrections-section: rendered from corrections table; empty on first publish -->
_No corrections have been recorded._

## Bibliography

1. AB1993: AUTHOR = Avramov, Luchezar L. and Buchweitz, Ragnar-Olaf, TITLE = Lower bounds for Betti numbers, JOURNAL = Compositio Math., FJOURNAL = Compositio Mathematica, VOLUME = 86, YEAR = 1993, NUMBER = 2, PAGES = 147--158, ISSN = 0010-437X,1570-5846, MRCLASS = 13D40 (13D02 13H15), MRNUMBER = 1214454, MRREVIEWER = Matthew\ Miller, URL = http://www.numdam.org/item?id=CM_1993__86_2_147_0,
2. AF1959: AUTHOR = Andreotti, Aldo and Frankel, Theodore, TITLE = The Lefschetz theorem on hyperplane sections, JOURNAL = Ann. of Math. (2), FJOURNAL = Annals of Mathematics. Second Series, VOLUME = 69, YEAR = 1959, PAGES = 713--717, ISSN = 0003-486X, MRCLASS = 57.20 (32.44), MRNUMBER = 177422, MRREVIEWER = S.\ I.\ Al\cprime ber, DOI = 10.2307/1970034, URL = https://doi.org/10.2307/1970034, doi:[10.2307/1970034](https://doi.org/10.2307/1970034)
3. BS2011: AUTHOR = Blanl\oeil, Vincent and Saeki, Osamu, TITLE = Cobordism of algebraic knots defined by Brieskorn polynomials, JOURNAL = Tokyo J. Math., FJOURNAL = Tokyo Journal of Mathematics, VOLUME = 34, YEAR = 2011, NUMBER = 2, PAGES = 429--443, ISSN = 0387-3870, MRCLASS = 32S55 (57Q60), MRNUMBER = 2918915, MRREVIEWER = Guangfeng\ Jiang, DOI = 10.3836/tjm/1327931395, URL = https://doi.org/10.3836/tjm/1327931395, doi:[10.3836/tjm/1327931395](https://doi.org/10.3836/tjm/1327931395)
4. BH2025: url = https://doi.org/10.1515/forum-2024-0147, title = On Stein spaces with finite homotopy rank-sum, title = , author = Indranil Biswas and Buddhadev Hajra, journal = Forum Mathematicum, doi = doi:10.1515/forum-2024-0147, year = 2025, lastchecked = 2025-06-02 doi:[doi:10.1515/forum-2024-0147](https://doi.org/doi:10.1515/forum-2024-0147)
5. Cam2018: AUTHOR = Campesato, Jean-Baptiste, TITLE = Complete classification of Brieskorn polynomials up to the arc-analytic equivalence, JOURNAL = Math. Z., FJOURNAL = Mathematische Zeitschrift, VOLUME = 290, YEAR = 2018, NUMBER = 3-4, PAGES = 1145--1163, ISSN = 0025-5874,1432-1823, MRCLASS = 14E18 (14B05 14P25 32S15), MRNUMBER = 3856848, MRREVIEWER = Julien\ Sebag, DOI = 10.1007/s00209-018-2056-7, URL = https://doi.org/10.1007/s00209-018-2056-7, doi:[10.1007/s00209-018-2056-7](https://doi.org/10.1007/s00209-018-2056-7)
6. Cha1983: AUTHOR = Chau, T. C., TITLE = A note concerning Fox's paper on Fenchel's conjecture, JOURNAL = Proc. Amer. Math. Soc., FJOURNAL = Proceedings of the American Mathematical Society, VOLUME = 88, YEAR = 1983, NUMBER = 4, PAGES = 584--586, ISSN = 0002-9939,1088-6826, MRCLASS = 20F05 (20B27 20H10), MRNUMBER = 702279, DOI = 10.2307/2045442, URL = https://doi.org/10.2307/2045442, doi:[10.2307/2045442](https://doi.org/10.2307/2045442)
7. Dan1989: title=On the cancellation problem and automorphism groups of affine algebraic varieties, author=Danielewski, Wlodzimierz, journal=preprint, Warsaw, year=1989
8. DF2014: AUTHOR = Dubouloz, Adrien and Finston, David R., TITLE = On exotic affine 3-spheres, JOURNAL = J. Algebraic Geom., FJOURNAL = Journal of Algebraic Geometry, VOLUME = 23, YEAR = 2014, NUMBER = 3, PAGES = 445--469, ISSN = 1056-3911,1534-7486, MRCLASS = 14R05 (14R20 14R25), MRNUMBER = 3205588, MRREVIEWER = Karol\ Palka, DOI = 10.1090/S1056-3911-2014-00612-3, URL = https://doi.org/10.1090/S1056-3911-2014-00612-3, doi:[10.1090/S1056-3911-2014-00612-3](https://doi.org/10.1090/S1056-3911-2014-00612-3)
9. FJS2024_arxiv: title=On metric equivalence of the Brieskorn-Pham hypersurfaces, author=Alexandre Fernandes and Zbigniew Jelonek and Jos\'e Edson Sampaio, year=2024, \tt arXiv: 2404.06922 [math.AG], eprint=2404.06922, archivePrefix=arXiv, primaryClass=math.AG, url=https://arxiv.org/abs/2404.06922, arXiv:[2404.06922](https://arxiv.org/abs/2404.06922)
10. Fie1994: AUTHOR = Fieseler, Karl-Heinz, TITLE = On complex affine surfaces with $C^+$-action, JOURNAL = Comment. Math. Helv., FJOURNAL = Commentarii Mathematici Helvetici, VOLUME = 69, YEAR = 1994, NUMBER = 1, PAGES = 5--27, ISSN = 0010-2571,1420-8946, MRCLASS = 14J26 (14D25 14L30), MRNUMBER = 1259603, MRREVIEWER = M.\ Miyanishi, DOI = 10.1007/BF02564471, URL = https://doi.org/10.1007/BF02564471, doi:[10.1007/BF02564471](https://doi.org/10.1007/BF02564471)
11. Fuj1979: AUTHOR = Fujita, Takao, TITLE = On Zariski problem, JOURNAL = Proc. Japan Acad. Ser. A Math. Sci., FJOURNAL = Japan Academy. Proceedings. Series A. Mathematical Sciences, VOLUME = 55, YEAR = 1979, NUMBER = 3, PAGES = 106--110, ISSN = 0386-2194, MRCLASS = 14J25 (13B25), MRNUMBER = 531454, MRREVIEWER = T.\ Kambayashi, URL = http://projecteuclid.org/euclid.pja/1195517399,
12. Fuj1981: AUTHOR = Fujita, Takao, TITLE = Cancellation problem of complete varieties, JOURNAL = Invent. Math., FJOURNAL = Inventiones Mathematicae, VOLUME = 64, YEAR = 1981, NUMBER = 1, PAGES = 119--121, ISSN = 0020-9910,1432-1297, MRCLASS = 14J05, MRNUMBER = 621772, MRREVIEWER = Allen\ B.\ Altman, DOI = 10.1007/BF01393936, URL = https://doi.org/10.1007/BF01393936, doi:[10.1007/BF01393936](https://doi.org/10.1007/BF01393936)
13. Fuj1982: AUTHOR = Fujita, Takao, TITLE = On the topology of noncomplete algebraic surfaces, JOURNAL = J. Fac. Sci. Univ. Tokyo Sect. IA Math., FJOURNAL = Journal of the Faculty of Science. University of Tokyo. Section IA. Mathematics, VOLUME = 29, YEAR = 1982, NUMBER = 3, PAGES = 503--566, ISSN = 0040-8980, MRCLASS = 14J25 (14E25 14F45 32J25 57R99), MRNUMBER = 687591, MRREVIEWER = M.\ Kh.\ Gizatullin,
14. Fur1989: AUTHOR = Furushima, Mikio, TITLE = Normal affine surfaces properly dominated by $\bf C\times \bf C^\ast$, JOURNAL = Math. Ann., FJOURNAL = Mathematische Annalen, VOLUME = 285, YEAR = 1989, NUMBER = 3, PAGES = 353--368, ISSN = 0025-5831,1432-1807, MRCLASS = 14E20 (14J99 32H25), MRNUMBER = 1019706, MRREVIEWER = Camilla\ Horst, DOI = 10.1007/BF01455061, URL = https://doi.org/10.1007/BF01455061, doi:[10.1007/BF01455061](https://doi.org/10.1007/BF01455061)
15. Gan1991: AUTHOR = Xiao, Gang, TITLE = $\pi_1$ of elliptic and hyperelliptic surfaces, JOURNAL = Internat. J. Math., FJOURNAL = International Journal of Mathematics, VOLUME = 2, YEAR = 1991, NUMBER = 5, PAGES = 599--615, ISSN = 0129-167X,1793-6519, MRCLASS = 14J27 (14E20 14F35), MRNUMBER = 1124285, MRREVIEWER = Ulf\ Persson, DOI = 10.1142/S0129167X91000338, URL = https://doi.org/10.1142/S0129167X91000338, doi:[10.1142/S0129167X91000338](https://doi.org/10.1142/S0129167X91000338)
16. Gie1964: AUTHOR = Giesecke, Burghart, TITLE = Simpliziale Zerlegung abz\"ahlbarer analytischer R\"aume, JOURNAL = Math. Z., FJOURNAL = Mathematische Zeitschrift, VOLUME = 83, YEAR = 1964, PAGES = 177--213, ISSN = 0025-5874,1432-1823, MRCLASS = 32.44 (57.60), MRNUMBER = 159346, MRREVIEWER = A.\ H.\ Wallace, DOI = 10.1007/BF01111199, URL = https://doi.org/10.1007/BF01111199, doi:[10.1007/BF01111199](https://doi.org/10.1007/BF01111199)
17. Gur1980a: author = R. V. Gurjar, title = Affine varieties dominated by $\C^2$, journal = Comment. Math. Helv., volume = 55, year = 1980, pages = 378--389
18. Gur1980b: author = R. V. Gurjar, title = Topology of affine varieties dominated by an affine space, journal = Invent. Math., volume = 59, year = 1980, pages = 221--225
19. Gur1982: author = R. V. Gurjar, title = Varieties dominated by $\C^n$, journal = Math. Ann., volume = 258, year = 1982, pages = 225--228
20. Gur1997: AUTHOR = Gurjar, R. V., TITLE = A new proof of Suzuki's formula, JOURNAL = Proc. Indian Acad. Sci. Math. Sci., FJOURNAL = Indian Academy of Sciences. Proceedings. Mathematical Sciences, VOLUME = 107, YEAR = 1997, NUMBER = 3, PAGES = 237--242, ISSN = 0253-4142,0973-7685, MRCLASS = 14J99 (14F45), MRNUMBER = 1467428, MRREVIEWER = Jean\ D'Almeida, DOI = 10.1007/BF02867254, URL = https://doi.org/10.1007/BF02867254, doi:[10.1007/BF02867254](https://doi.org/10.1007/BF02867254)
21. Gur2020: AUTHOR = Gurjar, R. V., TITLE = A graded domain is determined at its vertex. Applications to invariant theory, BOOKTITLE = Polynomial rings and affine algebraic geometry, SERIES = Springer Proc. Math. Stat., VOLUME = 319, PAGES = 195--198, PUBLISHER = Springer, Cham, YEAR = 2020, ISBN = 978-3-030-42136-6; 978-3-030-42135-9, MRCLASS = 14L24 (13A02 13A50 14L30), MRNUMBER = 4113946, DOI = 10.1007/978-3-030-42136-6\_7, URL = https://doi.org/10.1007/978-3-030-42136-6_7, doi:[10.1007/978-3-030-42136-6\_7](https://doi.org/10.1007/978-3-030-42136-6\_7)
22. GG2020: AUTHOR = Gurjar, R. V. and Gurjar, Sudarshan, TITLE = Topological characterization of $\rm C^2$ via open algebraic surface theory, JOURNAL = Internat. J. Math., FJOURNAL = International Journal of Mathematics, VOLUME = 31, YEAR = 2020, NUMBER = 7, PAGES = 2050055, 8, ISSN = 0129-167X,1793-6519, MRCLASS = 14R10 (14J25), MRNUMBER = 4123944, MRREVIEWER = Hideo\ Kojima, DOI = 10.1142/S0129167X2050055X, URL = https://doi.org/10.1142/S0129167X2050055X, doi:[10.1142/S0129167X2050055X](https://doi.org/10.1142/S0129167X2050055X)
23. GGH2023: AUTHOR = Gurjar, R. V. and Gurjar, S. R. and Hajra, B., TITLE = Eilenberg-MacLane spaces in algebraic surface theory, JOURNAL = Geom. Dedicata, FJOURNAL = Geometriae Dedicata, VOLUME = 217, YEAR = 2023, NUMBER = 2, PAGES = Paper No. 31, 27, ISSN = 0046-5755,1572-9168, MRCLASS = 14F35 (14F45 14J10 14R25 55P20), MRNUMBER = 4535847, MRREVIEWER = Rui\ Miguel\ Saramago, DOI = 10.1007/s10711-022-00761-z, URL = https://doi.org/10.1007/s10711-022-00761-z, doi:[10.1007/s10711-022-00761-z](https://doi.org/10.1007/s10711-022-00761-z)
24. GM1988: AUTHOR = Gurjar, R. V. and Miyanishi, M., TITLE = Affine surfaces with $\overline\kappa\leq 1$, BOOKTITLE = Algebraic geometry and commutative algebra, Vol.\ I, PAGES = 99--124, PUBLISHER = Kinokuniya, Tokyo, YEAR = 1988, ISBN = 4-314-10002-8, MRCLASS = 14J26 (14F45 14J10), MRNUMBER = 977756, MRREVIEWER = Takao\ Fujita,
25. GM1992: AUTHOR = Gurjar, R. V. and Miyanishi, M., TITLE = Affine lines on logarithmic $\bf Q$-homology planes, JOURNAL = Math. Ann., FJOURNAL = Mathematische Annalen, VOLUME = 294, YEAR = 1992, NUMBER = 3, PAGES = 463--482, ISSN = 0025-5831,1432-1807, MRCLASS = 14J25, MRNUMBER = 1188132, MRREVIEWER = Takao\ Fujita, DOI = 10.1007/BF01934336, URL = https://doi.org/10.1007/BF01934336, doi:[10.1007/BF01934336](https://doi.org/10.1007/BF01934336)
26. GS1984: AUTHOR = Gurjar, R. V. and Shastri, A. R., TITLE = The fundamental group at infinity of affine surfaces, JOURNAL = Comment. Math. Helv., FJOURNAL = Commentarii Mathematici Helvetici, VOLUME = 59, YEAR = 1984, NUMBER = 3, PAGES = 459--484, ISSN = 0010-2571,1420-8946, MRCLASS = 14E20 (14J25 32C15), MRNUMBER = 761808, MRREVIEWER = M.\ Miyanishi, DOI = 10.1007/BF02566361, URL = https://doi.org/10.1007/BF02566361, doi:[10.1007/BF02566361](https://doi.org/10.1007/BF02566361)
27. GSi1992: author = Gurjar, R. V. and Simha, R. R., title = Some results on the topology of varieties dominated by $\mathbbC^n$, journal = Mathematische Zeitschrift, volume = 211, year = 1992, number = 3, pages = 333--340
28. GMM2021: AUTHOR = Gurjar, Rajendra Vasant and Masuda, Kayo and Miyanishi, Masayoshi, TITLE = Affine space fibrations, SERIES = De Gruyter Studies in Mathematics, VOLUME = 79, PUBLISHER = De Gruyter, Berlin, YEAR = 2021, PAGES = xi+346, ISBN = 978-3-11-057736-5; 978-3-11-057756-3; 978-3-11-057742-6, MRCLASS = 14R25 (14-02 14R10), MRNUMBER = 4409696, MRREVIEWER = Tatiana\ M.\ Bandman, DOI = 10.1515/9783110577563-201, URL = https://doi.org/10.1515/9783110577563-201, doi:[10.1515/9783110577563-201](https://doi.org/10.1515/9783110577563-201)
29. GP1995a: AUTHOR = Gurjar, R. V. and Parameswaran, A. J., TITLE = Affine lines on $\bf Q$-homology planes, JOURNAL = J. Math. Kyoto Univ., FJOURNAL = Journal of Mathematics of Kyoto University, VOLUME = 35, YEAR = 1995, NUMBER = 1, PAGES = 63--77, ISSN = 0023-608X, MRCLASS = 14J25 (14C20), MRNUMBER = 1317274, MRREVIEWER = Takao\ Fujita, DOI = 10.1215/kjm/1250518841, URL = https://doi.org/10.1215/kjm/1250518841, doi:[10.1215/kjm/1250518841](https://doi.org/10.1215/kjm/1250518841)
30. GP1995b: AUTHOR = Gurjar, R. V. and Parameswaran, A. J., TITLE = Open surfaces with non-positive Euler characteristic, JOURNAL = Compositio Math., FJOURNAL = Compositio Mathematica, VOLUME = 99, YEAR = 1995, NUMBER = 3, PAGES = 213--229, ISSN = 0010-437X,1570-5846, MRCLASS = 14J26, MRNUMBER = 1361739, MRREVIEWER = Kristian\ Ranestad, URL = http://www.numdam.org/item?id=CM_1995__99_3_213_0,
31. GPr1999: AUTHOR = Gurjar, R. V. and Pradeep, C. R., TITLE = $\bf Q$-homology planes are rational. III, JOURNAL = Osaka J. Math., FJOURNAL = Osaka Journal of Mathematics, VOLUME = 36, YEAR = 1999, NUMBER = 2, PAGES = 259--335, ISSN = 0030-6126, MRCLASS = 14R05, MRNUMBER = 1736480, MRREVIEWER = N.\ Mohan Kumar, URL = http://projecteuclid.org/euclid.ojm/1200788567,
32. Ham1983: AUTHOR = Hamm, Helmut A., TITLE = Zur Homotopietyp Steinscher R\"aume, JOURNAL = J. Reine Angew. Math., FJOURNAL = Journal f\"ur die Reine und Angewandte Mathematik. [Crelle's Journal], VOLUME = 338, YEAR = 1983, PAGES = 121--135, ISSN = 0075-4102,1435-5345, MRCLASS = 32E10 (14F45 32C99), MRNUMBER = 684017, MRREVIEWER = L.\ Kaup, DOI = 10.1515/crll.1983.338.121, URL = https://doi.org/10.1515/crll.1983.338.121, doi:[10.1515/crll.1983.338.121](https://doi.org/10.1515/crll.1983.338.121)
33. Hat2002: AUTHOR = Hatcher, Allen, TITLE = Algebraic topology, PUBLISHER = Cambridge University Press, Cambridge, YEAR = 2002, PAGES = xii+544, ISBN = 0-521-79160-X; 0-521-79540-0, MRCLASS = 55-01 (55-00), MRNUMBER = 1867354, MRREVIEWER = Donald\ W.\ Kahn,
34. Hor1985: AUTHOR = Horst, Camilla, TITLE = Decomposition of compact complex varieties and the cancellation problem, JOURNAL = Math. Ann., FJOURNAL = Mathematische Annalen, VOLUME = 271, YEAR = 1985, NUMBER = 3, PAGES = 467--477, ISSN = 0025-5831,1432-1807, MRCLASS = 32J99, MRNUMBER = 787194, MRREVIEWER = David\ R.\ Morrison, DOI = 10.1007/BF01456081, URL = https://doi.org/10.1007/BF01456081, doi:[10.1007/BF01456081](https://doi.org/10.1007/BF01456081)
35. Iit1982: AUTHOR = Iitaka, Shigeru, TITLE = Algebraic geometry, SERIES = North-Holland Mathematical Library, VOLUME = 24, NOTE = An introduction to birational geometry of algebraic varieties, Graduate Texts in Mathematics, 76, PUBLISHER = Springer-Verlag, New York-Berlin, YEAR = 1982, PAGES = x+357, ISBN = 0-387-90546-4, MRCLASS = 14-01 (14-02 14E05), MRNUMBER = 637060, MRREVIEWER = Werner\ Kleinert,
36. Ish2014: AUTHOR = Ishii, Shihoko, TITLE = Introduction to singularities, PUBLISHER = Springer, Tokyo, YEAR = 2014, PAGES = viii+223, ISBN = 978-4-431-55080-8; 978-4-431-55081-5, MRCLASS = 14B05 (14E15), MRNUMBER = 3288750, MRREVIEWER = Santiago\ Encinas, DOI = 10.1007/978-4-431-55081-5, URL = https://doi.org/10.1007/978-4-431-55081-5, doi:[10.1007/978-4-431-55081-5](https://doi.org/10.1007/978-4-431-55081-5)
37. HM1990: AUTHOR = Hauser, Herwig and M\"uller, Gerd, TITLE = The cancellation property for direct products of analytic space germs, JOURNAL = Math. Ann., FJOURNAL = Mathematische Annalen, VOLUME = 286, YEAR = 1990, NUMBER = 1-3, PAGES = 209--223, ISSN = 0025-5831,1432-1807, MRCLASS = 32B10 (14B20), MRNUMBER = 1032931, MRREVIEWER = J\'on\ Magn\'usson, DOI = 10.1007/BF01453573, URL = https://doi.org/10.1007/BF01453573, doi:[10.1007/BF01453573](https://doi.org/10.1007/BF01453573)
38. JSXZ2024: AUTHOR = Jia, Jia and Shibata, Takahiro and Xie, Junyi and Zhang, De-Qi, TITLE = Endomorphisms of quasi-projective varieties: towards Zariski dense orbit and Kawaguchi-Silverman conjectures, JOURNAL = Math. Res. Lett., FJOURNAL = Mathematical Research Letters, VOLUME = 31, YEAR = 2024, NUMBER = 3, PAGES = 701--746, ISSN = 1073-2780,1945-001X, MRCLASS = 37P05 (14E05 37F80), MRNUMBER = 4831038, MRREVIEWER = Sheng\ Meng, DOI = 10.4310/mrl.241113041354, URL = https://doi.org/10.4310/mrl.241113041354, doi:[10.4310/mrl.241113041354](https://doi.org/10.4310/mrl.241113041354)
39. Kaw1979: AUTHOR = Kawamata, Yujiro, TITLE = On the classification of noncomplete algebraic surfaces, BOOKTITLE = Algebraic geometry (Proc. Summer Meeting, Univ. Copenhagen, Copenhagen, 1978), SERIES = Lecture Notes in Math., VOLUME = 732, PAGES = 215--232, PUBLISHER = Springer, Berlin, YEAR = 1979, ISBN = 3-540-09527-6, MRCLASS = 14J10, MRNUMBER = 555700, MRREVIEWER = Werner\ Kleinert,
40. Koj1999: AUTHOR = Kojima, Hideo, TITLE = Open rational surfaces with logarithmic Kodaira dimension zero, JOURNAL = Internat. J. Math., FJOURNAL = International Journal of Mathematics, VOLUME = 10, YEAR = 1999, NUMBER = 5, PAGES = 619--642, ISSN = 0129-167X,1793-6519, MRCLASS = 14J26 (14R05), MRNUMBER = 1708080, MRREVIEWER = De-Qi\ Zhang, DOI = 10.1142/S0129167X99000240, URL = https://doi.org/10.1142/S0129167X99000240, doi:[10.1142/S0129167X99000240](https://doi.org/10.1142/S0129167X99000240)
41. Mil1968: AUTHOR = Milnor, John, TITLE = Singular points of complex hypersurfaces, SERIES = Annals of Mathematics Studies, VOLUME = No. 61, PUBLISHER = Princeton University Press, Princeton, NJ; University of Tokyo Press, Tokyo, YEAR = 1968, PAGES = iii+122, MRCLASS = 57.20 (14.00), MRNUMBER = 239612, MRREVIEWER = J.\ P.\ Levine,
42. Miy1980a: author = Masayoshi Miyanishi, title = Affine surfaces containing cylinderlike open sets, journal = J. Math. Kyoto Univ., volume = 20, year = 1980, number = 1, pages = 11--42
43. Miy1980b: AUTHOR = Miyanishi, Masayoshi, TITLE = Regular subrings of a polynomial ring, JOURNAL = Osaka Math. J., FJOURNAL = Osaka Mathematical Journal, VOLUME = 17, YEAR = 1980, NUMBER = 2, PAGES = 329--338, ISSN = 0388-0699, MRCLASS = 13B25 (14J10 14M20), MRNUMBER = 587754, MRREVIEWER = M.\ Kh.\ Gizatullin, URL = http://projecteuclid.org/euclid.ojm/1200773129,
44. Miy1981: AUTHOR = Miyanishi, Masayoshi, TITLE = Noncomplete algebraic surfaces, SERIES = Lecture Notes in Mathematics, VOLUME = 857, PUBLISHER = Springer-Verlag, Berlin-New York, YEAR = 1981, PAGES = xviii+244, ISBN = 3-540-10703-7, MRCLASS = 14J10, MRNUMBER = 635930, MRREVIEWER = Jayant\ M.\ Shah,
45. Miy1986: AUTHOR = Miyanishi, Masayoshi, TITLE = Normal affine subalgebras of a polynomial ring, BOOKTITLE = Algebraic and topological theories (Kinosaki, 1984), PAGES = 37--51, PUBLISHER = Kinokuniya, Tokyo, YEAR = 1986, ISBN = 4-87573-098-5, MRCLASS = 14J25 (13F20 14J17), MRNUMBER = 1102251,
46. Miy2001: AUTHOR = Miyanishi, Masayoshi, TITLE = Open algebraic surfaces, SERIES = CRM Monograph Series, VOLUME = 12, PUBLISHER = American Mathematical Society, Providence, RI, YEAR = 2001, PAGES = viii+259, ISBN = 0-8218-0504-5, MRCLASS = 14R05 (14-02 14J99), MRNUMBER = 1800276, MRREVIEWER = M.\ Kh.\ Gizatullin, DOI = 10.1090/crmm/012, URL = https://doi.org/10.1090/crmm/012, doi:[10.1090/crmm/012](https://doi.org/10.1090/crmm/012)
47. MS1980: AUTHOR = Miyanishi, Masayoshi and Sugie, Tohru, TITLE = Affine surfaces containing cylinderlike open sets, JOURNAL = J. Math. Kyoto Univ., FJOURNAL = Journal of Mathematics of Kyoto University, VOLUME = 20, YEAR = 1980, NUMBER = 1, PAGES = 11--42, ISSN = 0023-608X, MRCLASS = 14J10 (14M20), MRNUMBER = 564667, MRREVIEWER = M.\ Kh.\ Gizatullin, DOI = 10.1215/kjm/1250522319, URL = https://doi.org/10.1215/kjm/1250522319, doi:[10.1215/kjm/1250522319](https://doi.org/10.1215/kjm/1250522319)
48. MS1991: AUTHOR = Miyanishi, M. and Sugie, T., TITLE = Homology planes with quotient singularities, JOURNAL = J. Math. Kyoto Univ., FJOURNAL = Journal of Mathematics of Kyoto University, VOLUME = 31, YEAR = 1991, NUMBER = 3, PAGES = 755--788, ISSN = 0023-608X, MRCLASS = 14J26 (14J10), MRNUMBER = 1127098, MRREVIEWER = Takao\ Fujita, DOI = 10.1215/kjm/1250519728, URL = https://doi.org/10.1215/kjm/1250519728, doi:[10.1215/kjm/1250519728](https://doi.org/10.1215/kjm/1250519728)
49. MT1968: AUTHOR = Mosher, Robert E. and Tangora, Martin C., TITLE = Cohomology operations and applications in homotopy theory, PUBLISHER = Harper \& Row, Publishers, New York-London, YEAR = 1968, PAGES = x+214, MRCLASS = 55.40, MRNUMBER = 226634, MRREVIEWER = Larry\ Smith,
50. Nar1967: AUTHOR = Narasimhan, Raghavan, TITLE = On the homology groups of Stein spaces, JOURNAL = Invent. Math., FJOURNAL = Inventiones Mathematicae, VOLUME = 2, YEAR = 1967, PAGES = 377--385, ISSN = 0020-9910,1432-1297, MRCLASS = 57.60 (32.00), MRNUMBER = 216525, MRREVIEWER = Shoshichi\ Kobayashi, DOI = 10.1007/BF01428900, URL = https://doi.org/10.1007/BF01428900, doi:[10.1007/BF01428900](https://doi.org/10.1007/BF01428900)
51. Nor1983: AUTHOR = Nori, Madhav V., TITLE = Zariski's conjecture and related problems, JOURNAL = Ann. Sci. \'Ecole Norm. Sup. (4), FJOURNAL = Annales Scientifiques de l'\'Ecole Normale Sup\'erieure. Quatri\`eme S\'erie, VOLUME = 16, YEAR = 1983, NUMBER = 2, PAGES = 305--344, ISSN = 0012-9593, MRCLASS = 14H30 (14H20), MRNUMBER = 732347, MRREVIEWER = Johan\ Hansen, URL = http://www.numdam.org/item?id=ASENS_1983_4_16_2_305_0,
52. Pal2011: AUTHOR = Palka, Karol, TITLE = Recent progress in the geometry of $\Bbb Q$-acyclic surfaces, BOOKTITLE = Affine algebraic geometry, SERIES = CRM Proc. Lecture Notes, VOLUME = 54, PAGES = 271--287, PUBLISHER = Amer. Math. Soc., Providence, RI, YEAR = 2011, ISBN = 978-0-8218-7283-3, MRCLASS = 14R05, MRNUMBER = 2768645, DOI = 10.1090/crmp/054/16, URL = https://doi.org/10.1090/crmp/054/16, doi:[10.1090/crmp/054/16](https://doi.org/10.1090/crmp/054/16)
53. PR2021: AUTHOR = Pe\l ka, Tomasz and Ra\'zny, Pawe\l, TITLE = Classification of smooth factorial affine surfaces of Kodaira dimension zero with trivial units, JOURNAL = Pacific J. Math., FJOURNAL = Pacific Journal of Mathematics, VOLUME = 311, YEAR = 2021, NUMBER = 2, PAGES = 385--422, ISSN = 0030-8730,1945-5844, MRCLASS = 14R05 (14J26 57M99 57R65), MRNUMBER = 4292935, MRREVIEWER = Masaru\ Nagaoka, DOI = 10.2140/pjm.2021.311.385, URL = https://doi.org/10.2140/pjm.2021.311.385, doi:[10.2140/pjm.2021.311.385](https://doi.org/10.2140/pjm.2021.311.385)
54. PS1997: AUTHOR = Pradeep, C. R. and Shastri, Anant R., TITLE = On rationality of logarithmic $\bold Q$-homology planes. I, JOURNAL = Osaka J. Math., FJOURNAL = Osaka Journal of Mathematics, VOLUME = 34, YEAR = 1997, NUMBER = 2, PAGES = 429--456, ISSN = 0030-6126, MRCLASS = 14J26, MRNUMBER = 1483859, MRREVIEWER = N.\ Mohan Kumar, URL = http://projecteuclid.org/euclid.ojm/1200787503,
55. Ram1971: AUTHOR = Ramanujam, C. P., TITLE = A topological characterisation of the affine plane as an algebraic variety, JOURNAL = Ann. of Math. (2), FJOURNAL = Annals of Mathematics. Second Series, VOLUME = 94, YEAR = 1971, PAGES = 69--88, ISSN = 0003-486X, MRCLASS = 14.50, MRNUMBER = 286801, MRREVIEWER = B\ d'Orgeval, DOI = 10.2307/1970735, URL = https://doi.org/10.2307/1970735, doi:[10.2307/1970735](https://doi.org/10.2307/1970735)
56. Sai1972: AUTHOR = Sait\B o, Hiroko, TITLE = Fonctions enti\`eres qui se r\'eduisent \`a certains polynomes. I, JOURNAL = Osaka Math. J., FJOURNAL = Osaka Mathematical Journal, VOLUME = 9, YEAR = 1972, PAGES = 293--332, ISSN = 0388-0699, MRCLASS = 32A15, MRNUMBER = 338422, MRREVIEWER = J.\ Kajiwara, URL = http://projecteuclid.org/euclid.ojm/1200693722,
57. Ser1959: AUTHOR = Serre, J.-P., TITLE = On the fundamental group of a unirational variety, JOURNAL = J. London Math. Soc., FJOURNAL = The Journal of the London Mathematical Society, VOLUME = 34, YEAR = 1959, PAGES = 481--484, ISSN = 0024-6107,1469-7750, MRCLASS = 14.00, MRNUMBER = 109155, MRREVIEWER = T.\ Matsusaka, DOI = 10.1112/jlms/s1-34.4.481, URL = https://doi.org/10.1112/jlms/s1-34.4.481, doi:[10.1112/jlms/s1-34.4.481](https://doi.org/10.1112/jlms/s1-34.4.481)
58. Sha1977: AUTHOR = Shafarevich, I. R., TITLE = Basic algebraic geometry, SERIES = Springer Study Edition, NOTE = Translated from the Russian by K. A. Hirsch, Revised printing of Grundlehren der mathematischen Wissenschaften, Vol. 213, 1974, PUBLISHER = Springer-Verlag, Berlin-New York, YEAR = 1977, PAGES = xv+439, MRCLASS = 14-01, MRNUMBER = 447223,
59. Sha1994a: AUTHOR = Shafarevich, Igor R., TITLE = Basic algebraic geometry. 1, EDITION = Second, EDITION = Russian, NOTE = Varieties in projective space, PUBLISHER = Springer-Verlag, Berlin, YEAR = 1994, PAGES = xx+303, ISBN = 3-540-54812-2, MRCLASS = 14-01, MRNUMBER = 1328833,
60. Sha1994b: AUTHOR = Shafarevich, Igor R., TITLE = Basic algebraic geometry. 2, EDITION = Second, EDITION = Russian, NOTE = Schemes and complex manifolds, PUBLISHER = Springer-Verlag, Berlin, YEAR = 1994, PAGES = xiv+269, ISBN = 3-540-57554-5, MRCLASS = 14-01, MRNUMBER = 1328834,
61. Shi1977: AUTHOR = Shioda, Tetsuji, TITLE = Some remarks on Abelian varieties, JOURNAL = J. Fac. Sci. Univ. Tokyo Sect. IA Math., FJOURNAL = Journal of the Faculty of Science. University of Tokyo. Section IA. Mathematics, VOLUME = 24, YEAR = 1977, NUMBER = 1, PAGES = 11--21, ISSN = 0040-8980, MRCLASS = 14K15, MRNUMBER = 450289, MRREVIEWER = Jacques\ V\'elu,
62. Spa1966: AUTHOR = Spanier, Edwin H., TITLE = Algebraic topology, PUBLISHER = McGraw-Hill Book Co., New York-Toronto-London, YEAR = 1966, PAGES = xiv+528, MRCLASS = 55.00, MRNUMBER = 210112, MRREVIEWER = S.-T.\ Hu,
63. Sug1980: AUTHOR = Sugie, Tohru, TITLE = On a characterization of surfaces containing cylinderlike open sets, JOURNAL = Osaka Math. J., FJOURNAL = Osaka Mathematical Journal, VOLUME = 17, YEAR = 1980, NUMBER = 2, PAGES = 363--376, ISSN = 0388-0699, MRCLASS = 14J10 (14E05 14J25), MRNUMBER = 587756, MRREVIEWER = M.\ Kh.\ Gizatullin, URL = http://projecteuclid.org/euclid.ojm/1200773131,
64. Suz1977: AUTHOR = Suzuki, Masakazu, TITLE = Sur les op\'erations holomorphes du groupe additif complexe sur l'espace de deux variables complexes, JOURNAL = Ann. Sci. \'Ecole Norm. Sup. (4), FJOURNAL = Annales Scientifiques de l'\'Ecole Normale Sup\'erieure. Quatri\`eme S\'erie, VOLUME = 10, YEAR = 1977, NUMBER = 4, PAGES = 517--546, ISSN = 0012-9593, MRCLASS = 32M05 (32C40), MRNUMBER = 590938, URL = http://www.numdam.org/item?id=ASENS_1977_4_10_4_517_0,
65. tDP1989: AUTHOR = tom Dieck, Tammo and Petrie, Ted, TITLE = Homology planes: an announcement and survey, BOOKTITLE = Topological methods in algebraic transformation groups (New Brunswick, NJ, 1988), SERIES = Progr. Math., VOLUME = 80, PAGES = 27--48, PUBLISHER = Birkh\"auser Boston, Boston, MA, YEAR = 1989, ISBN = 0-8176-3436-3, MRCLASS = 14J25 (14E05 14E35 57R99), MRNUMBER = 1040856, MRREVIEWER = M.\ Miyanishi,
66. Whi1949a: AUTHOR = Whitehead, J. H. C., TITLE = Combinatorial homotopy. I, JOURNAL = Bull. Amer. Math. Soc., FJOURNAL = Bulletin of the American Mathematical Society, VOLUME = 55, YEAR = 1949, PAGES = 213--245, ISSN = 0002-9904, MRCLASS = 56.0X, MRNUMBER = 30759, MRREVIEWER = H.\ Samelson, DOI = 10.1090/S0002-9904-1949-09175-9, URL = https://doi.org/10.1090/S0002-9904-1949-09175-9, doi:[10.1090/S0002-9904-1949-09175-9](https://doi.org/10.1090/S0002-9904-1949-09175-9)
67. Whi1949b: AUTHOR = Whitehead, J. H. C., TITLE = Combinatorial homotopy. II, JOURNAL = Bull. Amer. Math. Soc., FJOURNAL = Bulletin of the American Mathematical Society, VOLUME = 55, YEAR = 1949, PAGES = 453--496, ISSN = 0002-9904, MRCLASS = 56.0X, MRNUMBER = 30760, MRREVIEWER = H.\ Samelson, DOI = 10.1090/S0002-9904-1949-09213-3, URL = https://doi.org/10.1090/S0002-9904-1949-09213-3, doi:[10.1090/S0002-9904-1949-09213-3](https://doi.org/10.1090/S0002-9904-1949-09213-3)
68. Yos1983: AUTHOR = Yoshinaga, Etsuo, TITLE = Topological types of isolated singularities defined by weighted homogeneous polynomials, JOURNAL = J. Math. Soc. Japan, FJOURNAL = Journal of the Mathematical Society of Japan, VOLUME = 35, YEAR = 1983, NUMBER = 3, PAGES = 431--436, ISSN = 0025-5645,1881-1167, MRCLASS = 32B30 (57Q45), MRNUMBER = 702767, MRREVIEWER = Ulrich\ Karras, DOI = 10.2969/jmsj/03530431, URL = https://doi.org/10.2969/jmsj/03530431, doi:[10.2969/jmsj/03530431](https://doi.org/10.2969/jmsj/03530431)
69. YS1978: AUTHOR = Yoshinaga, Etsuo and Suzuki, Masahiko, TITLE = On the topological types of singularities of Brieskorn-Pham type, JOURNAL = Sci. Rep. Yokohama Nat. Univ. Sect. I, FJOURNAL = Science Reports of the Yokohama National University. Section I. Mathematics, Physics, NUMBER = 25, YEAR = 1978, PAGES = 37--43, ISSN = 0085-8366, MRCLASS = 32C40 (14B05), MRNUMBER = 523509, MRREVIEWER = P.\ Orlik,
70. Zai1987: AUTHOR = Zaidenberg, M. G., TITLE = Isotrivial families of curves on affine surfaces, and the characterization of the affine plane, JOURNAL = Izv. Akad. Nauk SSSR Ser. Mat., FJOURNAL = Izvestiya Akademii Nauk SSSR. Seriya Matematicheskaya, VOLUME = 51, YEAR = 1987, NUMBER = 3, PAGES = 534--567, 688, ISSN = 0373-2436, MRCLASS = 14J25 (32C10), MRNUMBER = 903623, MRREVIEWER = Gerhard\ Pfister, DOI = 10.1070/IM1988v030n03ABEH001027, URL = https://doi.org/10.1070/IM1988v030n03ABEH001027, doi:[10.1070/IM1988v030n03ABEH001027](https://doi.org/10.1070/IM1988v030n03ABEH001027)

