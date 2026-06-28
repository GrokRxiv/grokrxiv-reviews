# Automorphism Groups of Uniform Dessins d'Enfants of Genus at Least Two

GrokRxiv review of [arXiv:2606.27118](https://arxiv.org/abs/2606.27118) · `math.AG`

_Authors_: Tatsuya Ohnishi

## TL;DR

The paper extends Ohnishi26 by completing the automorphism-group distribution classification for uniform dessins of genus ≥ 2. Its main positive contribution, Theorem thm:class3 (every [$b^q$, $b^q$, n] passport admits a trivial-Aut dessin), is analytically argued with internally consistent counting bounds; Theorem thm:trivautd (the [l1*l2, $l2^l1$, $l2^l1$] family) is fully proved via a clean block-system argument verified by the technical-correctness specialist. However, three load-bearing claims are asserted 'by direct computation' without any shipped artifact: the headline counterexample for [8^2, 2^8, 4^4] (C3, major, unsupported), the exception-case bound closures for the [n, $b^q$, n] alternative proof (C6, major, unsupported), and the existence witness for [12^2, 2^12, 6^4] (C10, major, unsupported). The paper lies in the code-amenable domain (math.*, combinatorial group theory) and the reproducibility specialist rated it 0.28 with a critical-severity concern about absent proof-as-code artifacts. Per the recommendation gate, this combination mandates major_revision. Citation practice is generally sound; two metadata errors (Horie24 DOI belonging to JMIV, Goupil98 spurious arXiv field) and two missing standard references (Grothendieck Esquisse, Lando–Zvonkin) are correctable. The novelty specialist rated the work incremental (0.45) relative to Ohnishi26, which is a fair assessment given that the central technical machinery is an extension of prior tools; nonetheless the explicit counterexamples and the new [$b^q$, $b^q$, n] treatment are genuine contributions. Specialist confidence ranged from 0.62 (technical_correctness) to 0.78 (citation, reproducibility); no specialist-level disagreements were identified.

_Recommendation_: **Major revision** · _Confidence_: 74%

## Strengths

- Theorem thm:trivautd (the [l1*l2, $l2^l1$, $l2^l1$] family forces trivial Aut) is proved via a self-contained block-system argument that is rigorous and requires no computational supplement.
- The explicit permutation construction in Prop prop:c3b3 for the b=3 subcase was independently spot-checked by the technical-correctness specialist for q=3 and found correct.
- The Goupil–Schaeffer counting framework is systematically applied to derive both a tight lower bound for |N(b,q,b)| (Lemma lem:Nbqblower) and an explicit upper bound for |D| (Lemma lem:Dupper), providing a reusable analytic tool for future passport problems.
- The paper clearly delineates the boundary between passport families where every dessin has trivial Aut, families where none does, and families admitting both, providing a complete classification picture for genus ≥ 2 uniform passports.
- The self-citation to Ohnishi26 is well-integrated: the paper explicitly identifies which conjectures are proved, which are refuted, and which results receive alternative proofs, making the incremental contribution transparent.

## Weaknesses

- The headline counterexample for passport [8^2, 2^8, 4^4]—asserting exactly 920 compatible permutations forming 19 conjugacy classes with every |Aut(D)| ≥ 2—is stated purely by direct computation with no code, data file, or exhaustive enumeration artifact provided (C3, major, unsupported).
- The exception-case closure of the [n, $b^q$, n] alternative proof relies on computed inequalities R(3,2), R(3,4), R(4,2) ≤ 1 and explicit witness permutations in Table tab:exceptionbq, none of which are accompanied by a verifiable artifact (C6, major, unsupported).
- The existence claim that [12^2, 2^12, 6^4] admits a dessin with trivial Aut—used to bound the scope of the [8^2, 2^8, 4^4] phenomenon—is asserted without an explicit witness pair or computational evidence (C10, major, unsupported).
- No code repository, script, or data file is provided for any of the permutation constructions, centralizer counts, or passport enumerations in the paper, making independent reproduction of even the constructive results impossible without re-implementing the entire framework.
- Two bibliographic metadata errors are present: the DOI recorded for Horie24 (10.1007/s10851-023-01159-6) belongs to the Journal of Mathematical Imaging and Vision rather than the Mathematical Journal of Okayama University, and Goupil98 records '1998.0215' as an arXiv identifier when it is the numeric suffix of the DOI.
- Standard references Grothendieck's Esquisse d'un programme and Lando–Zvonkin Graphs on Surfaces and Their Applications are absent despite their direct relevance to the paper's combinatorial and Galois-theoretic context.

## Revision Targets

- [ ] **Manuscript: Section 'Counterexamples to Previous Conjectures', subsection 'No Dessins with Trivial Automo...**
  - Location: `Section 'Counterexamples to Previous Conjectures', subsection 'No Dessins with Trivial Automorphism Group', list + Table tab:pass442882`
  - Evidence: This is a headline counterexample to a previously published conjecture, but it is asserted purely 'by direct computation'. No proof and no code/data are provided to substantiate the enumeration (920 permutations, 19 classes, the class-size and |Aut| breakdown). In a code-amenable field this exhaustive search is the canonical executable artifact, and its absence is a verification gap for a load-bearing claim.
  - Required change: Ship experiments/counterexamples/passport_8282_28_44.py (or a GAP script) that fixes x=(1..8)(9..16), enumerates all y of cycle type (8^2) with (xy)^{-1} of type (4^4), and prints the count (expected 920), the centralizer-conjugacy classes (expected 19) and the |Aut(D)| distribution; commit its output log.
  - Verification: Re-review should confirm `Section 'Counterexamples to Previous Conjectures', subsection 'No Dessins with Trivial Automorphism Group', list + Table tab:pass442882` is corrected or justified.
- [ ] **Manuscript: Section 'Alternative Proof of the [n,$b^q$,n] Case', Prop prop:c2bge3, Table tab:exceptionbq,...**
  - Location: `Section 'Alternative Proof of the [n,$b^q$,n] Case', Prop prop:c2bge3, Table tab:exceptionbq, Theorem thm:class2`
  - Evidence: The monotonicity of R(b,q) in b and q is proved analytically, but the decisive base/exception data is asserted 'by direct computation using (eq:Rbq)': the inequalities R(3,2),R(3,3),R(3,4),R(4,2)<=1 and R(3,5),R(4,4),R(5,2)>1, and the explicit exception values |N| and |D| (e.g. (3,4): N=38720, D=47952) together with the explicit y's claimed to give trivial Aut. These computations are the load-bearing closure of the proof and no executable artifact is provided. (Note: thm:class2 itself is also already established in cite Ohnishi26 Thm 7.6.)
  - Required change: Ship experiments/class2/verify_nbqn.py computing R(b,q) from eq:Rbq for the listed pairs, the exact |N|,|D| for the four exceptional pairs, and confirming Aut(D) trivial for each tabulated y; place at src/proofs/class2_exceptions.gap.
  - Verification: Re-review should confirm `Section 'Alternative Proof of the [n,b^q,n] Case', Prop prop:c2bge3, Table tab:exceptionbq, Theorem thm:class2` is corrected or justified.
- [ ] **Manuscript: Section 'Counterexamples to Previous Conjectures', subsection 'No Dessins with Trivial Automo...**
  - Location: `Section 'Counterexamples to Previous Conjectures', subsection 'No Dessins with Trivial Automorphism Group', closing paragraph`
  - Evidence: This existence claim (a dessin with trivial Aut for [12^2,2^12,6^4]) is stated without proof or an exhibited permutation pair, and is presented as the result of computation; no executable artifact or explicit witness y is provided. It is load-bearing because it bounds the scope of the [8^2,2^8,4^4] phenomenon.
  - Required change: Provide an explicit witness pair (x,y) for [12^2,2^12,6^4] with trivial Aut and ship experiments/counterexamples/passport_12_212_64.py that verifies the cycle types and triviality of Aut(D).
  - Verification: Re-review should confirm `Section 'Counterexamples to Previous Conjectures', subsection 'No Dessins with Trivial Automorphism Group', closing paragraph` is corrected or justified.
- [ ] **Code release and entrypoints**
  - Location: code/reproducibility artifacts: `code release and execution entrypoints`
  - Evidence: No code repository, license, pinned commit, or executable scripts are provided for reproducing the paper's permutation counts, centralizer bounds, or constructed dessin examples.
  - Required change: Release the source code, scripts, model configuration, and execution entrypoints needed to regenerate the reported tables, or document why those artifacts cannot be released.
  - Verification: Re-review should confirm runnable code or a documented non-release justification is present.
- [ ] **Bibliography: Esquisse d'un programme (Sketch of a Programme)**
  - Location: bibliography entry: `Esquisse d'un programme (Sketch of a Programme)`
  - Evidence: The introduction credits Grothendieck's fascination with dessins d'enfants and his theory as central motivation, yet does not cite his foundational 'Esquisse d'un programme' (1984, published 1997 in London Math. Soc. Lecture Note Ser. 242). This work is conventionally cited when attributing the origin of the theory to Grothendieck.
  - Required change: Add a bibliography entry for `Esquisse d'un programme (Sketch of a Programme)` and cite it where the affected method or claim is introduced, or explicitly justify its omission.
  - Verification: Re-review should confirm the bibliography and citation context address this reference.
- [ ] **Bibliography: Graphs on Surfaces and Their Applications**
  - Location: bibliography entry: `Graphs on Surfaces and Their Applications`
  - Evidence: The monograph by Lando and Zvonkin (Springer, 2004) is a standard companion reference in the dessins d'enfants literature alongside Jones16 and Adrianov20, and is frequently cited for combinatorial enumeration of maps and monodromy; its absence is conspicuous given the paper's counting arguments.
  - Required change: Add a bibliography entry for `Graphs on Surfaces and Their Applications` and cite it where the affected method or claim is introduced, or explicitly justify its omission.
  - Verification: Re-review should confirm the bibliography and citation context address this reference.

## Open Questions

- Can you provide explicit witness permutation pairs (x, y) or an executable enumeration script for the [8^2, 2^8, 4^4] computation, confirming the count of 920 valid y, the 19 conjugacy classes, and the |Aut(D)| distribution across classes?
- What is the current publication status of Cueto14 (arXiv:1409.7736, 2014)? If it remains unpublished after more than a decade, can a published replacement be cited for the field-of-moduli results it provides?
- Can you supply an explicit witness pair (x, y) demonstrating that [12^2, 2^12, 6^4] admits a dessin with trivial automorphism group, or alternatively include this claim in a supplementary computational appendix rather than the main text?
- For the four exception cases in Table tab:exceptionbq, can you exhibit the exact |N| and |D| values and confirm triviality of Aut(D) for each tabulated y via a verifiable computation?
- Why are Grothendieck's Esquisse d'un programme and Lando–Zvonkin Graphs on Surfaces and Their Applications absent from the bibliography, given their standard status in the dessins d'enfants literature?

## Per-Agent Reviews

### citation (`sonnet[1m]`) — status: `warn`

```json
{
  "confidence": 0.78,
  "entries": [
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Adrianov, N. M.",
          "Pakovich, F.",
          "Zvonkin, A. K."
        ],
        "doi": null,
        "key": "Adrianov20",
        "raw": "Adrianov, N. M. and Pakovich, F. and Zvonkin, A. K., Davenport-Zannier polynomials and dessins d'enfants, Mathematical Surveys and Monographs, vol. 249, American Mathematical Society, Providence, RI, 2020.",
        "title": "Davenport-Zannier polynomials and dessins d'enfants",
        "url": null,
        "venue": "Mathematical Surveys and Monographs, vol. 249, American Mathematical Society",
        "year": 2020
      },
      "exists": null,
      "explanation": "One of the two primary reference texts for the Preliminaries chapter; provides the definition of passport (Definition 2.10) that structures the paper's entire classification scheme.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Belyi, G. V."
        ],
        "doi": "10.1070/SM2002v193n03ABEH000633",
        "key": "Belyi02",
        "raw": "Belyi, G. V., Another proof of the three points theorem, Mat. Sb. (Matematicheskii Sbornik), vol. 193, no. 3, 2002, pp. 21–24.",
        "title": "Another proof of the three points theorem",
        "url": "https://doi.org/10.1070/SM2002v193n03ABEH000633",
        "venue": "Matematicheskii Sbornik, vol. 193, no. 3",
        "year": 2002
      },
      "exists": null,
      "explanation": "Cited alongside Belyi79 and Jones16 in the statement of Belyi's Theorem, which is the cornerstone result connecting algebraic curves over number fields with dessins d'enfants.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Belyi, G. V."
        ],
        "doi": null,
        "key": "Belyi79",
        "raw": "Belyi, G. V., Galois extensions of a maximal cyclotomic field, Izv. Akad. Nauk SSSR Ser. Mat., vol. 43, no. 2, 1979, pp. 267–276, 479.",
        "title": "Galois extensions of a maximal cyclotomic field",
        "url": null,
        "venue": "Izvestiya Akademii Nauk SSSR. Seriya Matematicheskaya, vol. 43, no. 2",
        "year": 1979
      },
      "exists": null,
      "explanation": "Original proof of Belyi's theorem, the foundational result from which the theory of dessins d'enfants emerges. Cited at the very first theorem statement in the paper.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Conder, M. D. E.",
          "Jones, G. A.",
          "Streit, M.",
          "Wolfart, J."
        ],
        "doi": "10.4171/RMI/717",
        "key": "Conder13",
        "raw": "Conder, M. D. E. and Jones, G. A. and Streit, M. and Wolfart, J., Galois actions on regular dessins of small genera, Rev. Mat. Iberoam., vol. 29, no. 1, 2013, pp. 163–181.",
        "title": "Galois actions on regular dessins of small genera",
        "url": "https://doi.org/10.4171/RMI/717",
        "venue": "Revista Matemática Iberoamericana, vol. 29, no. 1",
        "year": 2013
      },
      "exists": null,
      "explanation": "Studies Galois actions on regular dessins, directly related to the paper's analysis of regularity and automorphism groups. Its specific use is not shown in the provided citation contexts.",
      "notes": "Citation key does not appear in the visible citation contexts; likely used in the truncated sections on Galois actions or regular dessins.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "1409.7736",
        "authors": [
          "Cueto, M. H."
        ],
        "doi": null,
        "key": "Cueto14",
        "raw": "Cueto, M. H., The field of moduli and fields of definition of dessins d'enfants, arXiv:1409.7736, 2014.",
        "title": "The field of moduli and fields of definition of dessins d'enfants",
        "url": null,
        "venue": null,
        "year": 2014
      },
      "exists": null,
      "explanation": "Addresses the field of moduli vs. field of definition problem for dessins, a topic the paper's introduction identifies as an important motivation for studying automorphism groups. Not visible in the rendered citation contexts.",
      "notes": "Only available as an arXiv preprint from 2014 with no published venue listed. If still unpublished after more than a decade, this is noteworthy; a published replacement should be sought.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Dixon, J. D.",
          "Mortimer, B."
        ],
        "doi": "10.1007/978-1-4612-0731-3",
        "key": "Dixon96",
        "raw": "Dixon, J. D. and Mortimer, B., Permutation groups, Graduate Texts in Mathematics, vol. 163, Springer-Verlag, New York, 1996.",
        "title": "Permutation groups",
        "url": "https://doi.org/10.1007/978-1-4612-0731-3",
        "venue": "Graduate Texts in Mathematics, vol. 163, Springer-Verlag",
        "year": 1996
      },
      "exists": null,
      "explanation": "Standard graduate reference on permutation groups, providing foundational results for the monodromy group framework and counting arguments central to the paper's proofs.",
      "notes": "Not visible in the provided citation contexts; likely cited in the truncated Counting Arguments or passport sections where permutation group theory is applied.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Girondo, E.",
          "González-Diez, G."
        ],
        "doi": null,
        "key": "Girondo12",
        "raw": "Girondo, E. and González-Diez, G., Introduction to compact Riemann surfaces and dessins d'enfants, London Mathematical Society Student Texts, vol. 79, Cambridge University Press, Cambridge, 2012.",
        "title": "Introduction to compact Riemann surfaces and dessins d'enfants",
        "url": null,
        "venue": "London Mathematical Society Student Texts, vol. 79, Cambridge University Press",
        "year": 2012
      },
      "exists": null,
      "explanation": "Cited for Proposition 4.42 (regularity implies uniform passport), a key structural result used in Preliminaries and itself reused in Ohnishi26. The cited proposition is directly relevant to the paper's conceptual framework.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Girondo, E.",
          "Torres-Teigell, D.",
          "Wolfart, J."
        ],
        "doi": "10.1090/conm/629/12558",
        "key": "Girondo14",
        "raw": "Girondo, E. and Torres-Teigell, D. and Wolfart, J., Fields of definition of uniform dessins on quasiplatonic surfaces, in Riemann and Klein surfaces, automorphisms, symmetries and moduli spaces, Contemp. Math., vol. 629, pp. 155–170, Amer. Math. Soc., Providence, RI, 2014.",
        "title": "Fields of definition of uniform dessins on quasiplatonic surfaces",
        "url": "https://doi.org/10.1090/conm/629/12558",
        "venue": "Contemporary Mathematics, vol. 629, American Mathematical Society",
        "year": 2014
      },
      "exists": null,
      "explanation": "Directly studies fields of definition of uniform dessins, the same class of objects analyzed in the paper. The paper discusses fields of definition in the introduction as motivation, but Girondo14 is absent from the visible contexts.",
      "notes": "Not visible in the provided citation contexts; likely cited in sections on fields of definition not rendered in the prompt.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Goupil, A.",
          "Schaeffer, G."
        ],
        "doi": "10.1006/eujc.1998.0215",
        "key": "Goupil98",
        "raw": "Goupil, A. and Schaeffer, G., Factoring N-cycles and counting maps of given genus, European J. Combin., vol. 19, no. 7, 1998, pp. 819–834.",
        "title": "Factoring N-cycles and counting maps of given genus",
        "url": "https://doi.org/10.1006/eujc.1998.0215",
        "venue": "European Journal of Combinatorics, vol. 19, no. 7",
        "year": 1998
      },
      "exists": null,
      "explanation": "Explicitly named in the Counting Arguments section as the source of a key theorem for computing lower bounds on the count of N-cycle factorizations, directly enabling the paper's main technical approach to proving trivial automorphism group existence.",
      "notes": "The bibliography entry contains '| arxiv: 1998.0215', which is not a valid arXiv identifier; this string appears to be the numeric suffix of the DOI and has been incorrectly recorded as an arXiv ID.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "1811.07849",
        "authors": [
          "Hidalgo, R. A."
        ],
        "doi": null,
        "key": "Hidalgo18",
        "raw": "Hidalgo, R. A., Automorphism groups of dessins d'enfants, arXiv:1811.07849, 2018.",
        "title": "Automorphism groups of dessins d'enfants",
        "url": null,
        "venue": null,
        "year": 2018
      },
      "exists": null,
      "explanation": "Preprint version of Hidalgo19 on automorphism groups of dessins d'enfants. Topically central to the paper, but its specific use is not visible in the provided citation contexts.",
      "notes": "Shares the same title as Hidalgo19 and appears to be its arXiv preprint. Citing both under separate keys without distinct citation contexts is redundant; neither appears in the visible citation contexts.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Hidalgo, R. A."
        ],
        "doi": "10.1007/s00013-018-1222-9",
        "key": "Hidalgo19",
        "raw": "Hidalgo, R. A., Automorphism groups of dessins d'enfants, Arch. Math. (Basel), vol. 112, no. 1, 2019, pp. 13–18.",
        "title": "Automorphism groups of dessins d'enfants",
        "url": "https://doi.org/10.1007/s00013-018-1222-9",
        "venue": "Archiv der Mathematik, vol. 112, no. 1",
        "year": 2019
      },
      "exists": null,
      "explanation": "Peer-reviewed publication on automorphism groups of dessins, directly relevant to the paper's core topic. Specific citation context not visible in the provided excerpt.",
      "notes": "Published form of the preprint Hidalgo18 (arXiv:1811.07849); both have identical titles. Citing both under separate keys without differentiated use is slightly redundant. Neither citation key appears in the visible citation contexts.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Horie, M."
        ],
        "doi": "10.1007/s10851-023-01159-6",
        "key": "Horie24",
        "raw": "Horie, M., Equivalence classes of dessins d'enfants with two vertices, Math. J. Okayama Univ., vol. 66, 2024, pp. 1–30.",
        "title": "Equivalence classes of dessins d'enfants with two vertices",
        "url": "https://doi.org/10.1007/s10851-023-01159-6",
        "venue": "Mathematical Journal of Okayama University, vol. 66",
        "year": 2024
      },
      "exists": null,
      "explanation": "Cited in the Introduction for its counting method for isomorphism classes of dessins with two vertices, providing a comparison point for the paper's explicit constructions in the [n,n,n] passport case.",
      "notes": "The recorded DOI '10.1007/s10851-023-01159-6' carries the Springer prefix 's10851', which corresponds to the Journal of Mathematical Imaging and Vision, not the Mathematical Journal of Okayama University. This appears to be a misassigned DOI in the bibliography.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Jones, G. A."
        ],
        "doi": "10.1090/conm/629/12568",
        "key": "Jones14",
        "raw": "Jones, G. A., Regular dessins with a given automorphism group, in Riemann and Klein surfaces, automorphisms, symmetries and moduli spaces, Contemp. Math., vol. 629, pp. 245–260, Amer. Math. Soc., Providence, RI, 2014.",
        "title": "Regular dessins with a given automorphism group",
        "url": "https://doi.org/10.1090/conm/629/12568",
        "venue": "Contemporary Mathematics, vol. 629, American Mathematical Society",
        "year": 2014
      },
      "exists": null,
      "explanation": "Addresses regular dessins with prescribed automorphism groups, directly related to the paper's core question. Topically appropriate but absent from the visible citation contexts.",
      "notes": "Citation key not visible in the provided citation contexts; likely cited in the truncated sections on regular dessins.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Jones, G. A.",
          "Wolfart, J."
        ],
        "doi": "10.1007/978-3-319-24711-3",
        "key": "Jones16",
        "raw": "Jones, G. A. and Wolfart, J., Dessins d'enfants on Riemann surfaces, Springer Monographs in Mathematics, Springer, Cham, 2016.",
        "title": "Dessins d'enfants on Riemann surfaces",
        "url": "https://doi.org/10.1007/978-3-319-24711-3",
        "venue": "Springer Monographs in Mathematics, Springer",
        "year": 2016
      },
      "exists": null,
      "explanation": "The single most-cited reference in the paper, supplying definitions for dessins, monodromy groups, regularity, automorphism groups, the Galois action, and uniform passports. Appears in virtually every major definition and multiple proof steps.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2602.11867",
        "authors": [
          "Ohnishi, T."
        ],
        "doi": null,
        "key": "Ohnishi26",
        "raw": "Ohnishi, T., Regularity and Automorphism Groups of Dessins d'Enfants with Uniform Passports, arXiv:2602.11867, 2026.",
        "title": "Regularity and Automorphism Groups of Dessins d'Enfants with Uniform Passports",
        "url": "https://arxiv.org/abs/2602.11867",
        "venue": null,
        "year": 2026
      },
      "exists": null,
      "explanation": "The author's preceding paper whose partial results and conjectures the current paper extends or refutes. Cited extensively for prior theorems, lemmas, and the conjectural table that motivates the entire research programme.",
      "notes": "Self-citation to the author's companion paper; the current paper explicitly frames itself as extending Ohnishi26. Only available as an arXiv preprint; a peer-reviewed published form is not listed.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Sagan, Bruce E."
        ],
        "doi": "10.1007/978-1-4757-6804-6",
        "key": "Sagan01",
        "raw": "Sagan, Bruce E., The symmetric group: representations, combinatorial algorithms, and symmetric functions, 2nd ed., Graduate Texts in Mathematics, vol. 203, Springer-Verlag, New York, 2001.",
        "title": "The symmetric group",
        "url": "https://doi.org/10.1007/978-1-4757-6804-6",
        "venue": "Graduate Texts in Mathematics, vol. 203, Springer-Verlag",
        "year": 2001
      },
      "exists": null,
      "explanation": "Standard graduate reference on symmetric groups providing combinatorial tools used in the counting arguments for trivial automorphism groups, the paper's central technical innovation.",
      "notes": "Not explicitly named in visible citation contexts; the truncated 'See [Proposition 1.]' passage in the Counting Arguments section likely references this work.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Scodro, G."
        ],
        "doi": null,
        "key": "Scodro24",
        "raw": "Scodro, G., Belyi's theorem and dessins d'enfants, ALGANT Master's Thesis, University of Padova, 2024.",
        "title": "Belyi's theorem and dessins d'enfants",
        "url": "https://thesis.unipd.it/retrieve/4d0c1b93-fca9-4547-883c-d53b5a86dea0/Scodro_Giacomo.pdf",
        "venue": "ALGANT Master's Thesis, University of Padova",
        "year": 2024
      },
      "exists": null,
      "explanation": "Cited for Theorem 3.6 establishing that any two-generator group acting transitively on a set is the monodromy group of some dessin, used in Preliminaries to justify the combinatorial approach.",
      "notes": "An unpublished Master's thesis is an unconventional source for a structural theorem (Theorem 3.6: groups acting transitively on edges correspond to dessin monodromy groups). A peer-reviewed monograph such as Jones16 or Adrianov20 would be a more standard citation.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Wakabayashi, Yasuhiro"
        ],
        "doi": "10.1016/j.jnt.2021.04.028",
        "key": "Wakabayashi22",
        "raw": "Wakabayashi, Yasuhiro, An effective version of Belyi's theorem in positive characteristic, J. Number Theory, vol. 231, 2022, pp. 251–268.",
        "title": "An effective version of Belyi's theorem in positive characteristic",
        "url": "https://doi.org/10.1016/j.jnt.2021.04.028",
        "venue": "Journal of Number Theory, vol. 231",
        "year": 2022
      },
      "exists": null,
      "explanation": "Extends Belyi's theorem to positive characteristic, while the current paper focuses exclusively on algebraic curves over number fields in characteristic zero. The thematic connection is tenuous and no citation use is visible in the provided contexts.",
      "notes": "The current paper works entirely over number fields in characteristic zero; a positive-characteristic generalization of Belyi's theorem is at most tangentially relevant. No citation context for this entry is visible in the provided excerpt.",
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    }
  ],
  "missing_references": [
    {
      "reason": "The introduction credits Grothendieck's fascination with dessins d'enfants and his theory as central motivation, yet does not cite his foundational 'Esquisse d'un programme' (1984, published 1997 in London Math. Soc. Lecture Note Ser. 242). This work is conventionally cited when attributing the origin of the theory to Grothendieck.",
      "title": "Esquisse d'un programme (Sketch of a Programme)"
    },
    {
      "reason": "The monograph by Lando and Zvonkin (Springer, 2004) is a standard companion reference in the dessins d'enfants literature alongside Jones16 and Adrianov20, and is frequently cited for combinatorial enumeration of maps and monodromy; its absence is conspicuous given the paper's counting arguments.",
      "title": "Graphs on Surfaces and Their Applications"
    }
  ],
  "summary": "The paper's citation practice is overall sound: the two primary textbooks (Jones16 and Adrianov20) are used precisely for the definitions and propositions they supply, the three Belyi references are appropriately co-cited at the theorem statement, and the self-citation to Ohnishi26 is well-integrated into a clear narrative of extension. Two bibliographic metadata errors stand out: the DOI recorded for Horie24 (10.1007/s10851-023-01159-6) belongs to the Journal of Mathematical Imaging and Vision rather than the Mathematical Journal of Okayama University, and Goupil98 carries a spurious 'arxiv: 1998.0215' field that is not a valid arXiv identifier. Citing both Hidalgo18 (arXiv preprint) and Hidalgo19 (published version) under separate keys without distinguishing citation contexts is mildly redundant, and the reliance on a Master's thesis (Scodro24) for a foundational structural theorem is unconventional and could be replaced by an established monograph."
}
```

### meta_reviewer (`sonnet[1m]`) — status: `pass`

```json
{
  "confidence": 0.74,
  "questions": [
    "Can you provide explicit witness permutation pairs (x, y) or an executable enumeration script for the [8^2, 2^8, 4^4] computation, confirming the count of 920 valid y, the 19 conjugacy classes, and the |Aut(D)| distribution across classes?",
    "What is the current publication status of Cueto14 (arXiv:1409.7736, 2014)? If it remains unpublished after more than a decade, can a published replacement be cited for the field-of-moduli results it provides?",
    "Can you supply an explicit witness pair (x, y) demonstrating that [12^2, 2^12, 6^4] admits a dessin with trivial automorphism group, or alternatively include this claim in a supplementary computational appendix rather than the main text?",
    "For the four exception cases in Table tab:exceptionbq, can you exhibit the exact |N| and |D| values and confirm triviality of Aut(D) for each tabulated y via a verifiable computation?",
    "Why are Grothendieck's Esquisse d'un programme and Lando–Zvonkin Graphs on Surfaces and Their Applications absent from the bibliography, given their standard status in the dessins d'enfants literature?"
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "This is a headline counterexample to a previously published conjecture, but it is asserted purely 'by direct computation'. No proof and no code/data are provided to substantiate the enumeration (920 permutations, 19 classes, the class-size and |Aut| breakdown). In a code-amenable field this exhaustive search is the canonical executable artifact, and its absence is a verification gap for a load-bearing claim.",
      "id": "weakness-1",
      "locator": "Section 'Counterexamples to Previous Conjectures', subsection 'No Dessins with Trivial Automorphism Group', list + Table tab:pass442882",
      "required_update": "Ship experiments/counterexamples/passport_8282_28_44.py (or a GAP script) that fixes x=(1..8)(9..16), enumerates all y of cycle type (8^2) with (xy)^{-1} of type (4^4), and prints the count (expected 920), the centralizer-conjugacy classes (expected 19) and the |Aut(D)| distribution; commit its output log.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 'Counterexamples to Previous Conjectures', subsection 'No Dessins with Trivial Automorphism Group', list + Table tab:pass442882` is corrected or justified.",
      "weakness_index": 0
    },
    {
      "evidence": "The monotonicity of R(b,q) in b and q is proved analytically, but the decisive base/exception data is asserted 'by direct computation using (eq:Rbq)': the inequalities R(3,2),R(3,3),R(3,4),R(4,2)<=1 and R(3,5),R(4,4),R(5,2)>1, and the explicit exception values |N| and |D| (e.g. (3,4): N=38720, D=47952) together with the explicit y's claimed to give trivial Aut. These computations are the load-bearing closure of the proof and no executable artifact is provided. (Note: thm:class2 itself is also already established in cite Ohnishi26 Thm 7.6.)",
      "id": "weakness-2",
      "locator": "Section 'Alternative Proof of the [n,b^q,n] Case', Prop prop:c2bge3, Table tab:exceptionbq, Theorem thm:class2",
      "required_update": "Ship experiments/class2/verify_nbqn.py computing R(b,q) from eq:Rbq for the listed pairs, the exact |N|,|D| for the four exceptional pairs, and confirming Aut(D) trivial for each tabulated y; place at src/proofs/class2_exceptions.gap.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 'Alternative Proof of the [n,b^q,n] Case', Prop prop:c2bge3, Table tab:exceptionbq, Theorem thm:class2` is corrected or justified.",
      "weakness_index": 1
    },
    {
      "evidence": "This existence claim (a dessin with trivial Aut for [12^2,2^12,6^4]) is stated without proof or an exhibited permutation pair, and is presented as the result of computation; no executable artifact or explicit witness y is provided. It is load-bearing because it bounds the scope of the [8^2,2^8,4^4] phenomenon.",
      "id": "weakness-3",
      "locator": "Section 'Counterexamples to Previous Conjectures', subsection 'No Dessins with Trivial Automorphism Group', closing paragraph",
      "required_update": "Provide an explicit witness pair (x,y) for [12^2,2^12,6^4] with trivial Aut and ship experiments/counterexamples/passport_12_212_64.py that verifies the cycle types and triviality of Aut(D).",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 'Counterexamples to Previous Conjectures', subsection 'No Dessins with Trivial Automorphism Group', closing paragraph` is corrected or justified.",
      "weakness_index": 2
    },
    {
      "evidence": "No code repository, license, pinned commit, or executable scripts are provided for reproducing the paper's permutation counts, centralizer bounds, or constructed dessin examples.",
      "id": "weakness-4",
      "locator": "code release and execution entrypoints",
      "required_update": "Release the source code, scripts, model configuration, and execution entrypoints needed to regenerate the reported tables, or document why those artifacts cannot be released.",
      "source_path": null,
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "code",
      "verification_check": "Re-review should confirm runnable code or a documented non-release justification is present.",
      "weakness_index": 3
    },
    {
      "evidence": "The introduction credits Grothendieck's fascination with dessins d'enfants and his theory as central motivation, yet does not cite his foundational 'Esquisse d'un programme' (1984, published 1997 in London Math. Soc. Lecture Note Ser. 242). This work is conventionally cited when attributing the origin of the theory to Grothendieck.",
      "id": "weakness-5",
      "locator": "Esquisse d'un programme (Sketch of a Programme)",
      "required_update": "Add a bibliography entry for `Esquisse d'un programme (Sketch of a Programme)` and cite it where the affected method or claim is introduced, or explicitly justify its omission.",
      "source_path": null,
      "source_role": "citation",
      "status": "open",
      "target_kind": "bibliography",
      "verification_check": "Re-review should confirm the bibliography and citation context address this reference.",
      "weakness_index": 4
    },
    {
      "evidence": "The monograph by Lando and Zvonkin (Springer, 2004) is a standard companion reference in the dessins d'enfants literature alongside Jones16 and Adrianov20, and is frequently cited for combinatorial enumeration of maps and monodromy; its absence is conspicuous given the paper's counting arguments.",
      "id": "weakness-6",
      "locator": "Graphs on Surfaces and Their Applications",
      "required_update": "Add a bibliography entry for `Graphs on Surfaces and Their Applications` and cite it where the affected method or claim is introduced, or explicitly justify its omission.",
      "source_path": null,
      "source_role": "citation",
      "status": "open",
      "target_kind": "bibliography",
      "verification_check": "Re-review should confirm the bibliography and citation context address this reference.",
      "weakness_index": 5
    }
  ],
  "strengths": [
    "Theorem thm:trivautd (the [l1*l2, l2^l1, l2^l1] family forces trivial Aut) is proved via a self-contained block-system argument that is rigorous and requires no computational supplement.",
    "The explicit permutation construction in Prop prop:c3b3 for the b=3 subcase was independently spot-checked by the technical-correctness specialist for q=3 and found correct.",
    "The Goupil–Schaeffer counting framework is systematically applied to derive both a tight lower bound for |N(b,q,b)| (Lemma lem:Nbqblower) and an explicit upper bound for |D| (Lemma lem:Dupper), providing a reusable analytic tool for future passport problems.",
    "The paper clearly delineates the boundary between passport families where every dessin has trivial Aut, families where none does, and families admitting both, providing a complete classification picture for genus ≥ 2 uniform passports.",
    "The self-citation to Ohnishi26 is well-integrated: the paper explicitly identifies which conjectures are proved, which are refuted, and which results receive alternative proofs, making the incremental contribution transparent."
  ],
  "summary": "The paper extends Ohnishi26 by completing the automorphism-group distribution classification for uniform dessins of genus ≥ 2. Its main positive contribution, Theorem thm:class3 (every [b^q, b^q, n] passport admits a trivial-Aut dessin), is analytically argued with internally consistent counting bounds; Theorem thm:trivautd (the [l1*l2, l2^l1, l2^l1] family) is fully proved via a clean block-system argument verified by the technical-correctness specialist. However, three load-bearing claims are asserted 'by direct computation' without any shipped artifact: the headline counterexample for [8^2, 2^8, 4^4] (C3, major, unsupported), the exception-case bound closures for the [n, b^q, n] alternative proof (C6, major, unsupported), and the existence witness for [12^2, 2^12, 6^4] (C10, major, unsupported). The paper lies in the code-amenable domain (math.*, combinatorial group theory) and the reproducibility specialist rated it 0.28 with a critical-severity concern about absent proof-as-code artifacts. Per the recommendation gate, this combination mandates major_revision. Citation practice is generally sound; two metadata errors (Horie24 DOI belonging to JMIV, Goupil98 spurious arXiv field) and two missing standard references (Grothendieck Esquisse, Lando–Zvonkin) are correctable. The novelty specialist rated the work incremental (0.45) relative to Ohnishi26, which is a fair assessment given that the central technical machinery is an extension of prior tools; nonetheless the explicit counterexamples and the new [b^q, b^q, n] treatment are genuine contributions. Specialist confidence ranged from 0.62 (technical_correctness) to 0.78 (citation, reproducibility); no specialist-level disagreements were identified.",
  "weaknesses": [
    "The headline counterexample for passport [8^2, 2^8, 4^4]—asserting exactly 920 compatible permutations forming 19 conjugacy classes with every |Aut(D)| ≥ 2—is stated purely by direct computation with no code, data file, or exhaustive enumeration artifact provided (C3, major, unsupported).",
    "The exception-case closure of the [n, b^q, n] alternative proof relies on computed inequalities R(3,2), R(3,4), R(4,2) ≤ 1 and explicit witness permutations in Table tab:exceptionbq, none of which are accompanied by a verifiable artifact (C6, major, unsupported).",
    "The existence claim that [12^2, 2^12, 6^4] admits a dessin with trivial Aut—used to bound the scope of the [8^2, 2^8, 4^4] phenomenon—is asserted without an explicit witness pair or computational evidence (C10, major, unsupported).",
    "No code repository, script, or data file is provided for any of the permutation constructions, centralizer counts, or passport enumerations in the paper, making independent reproduction of even the constructive results impossible without re-implementing the entire framework.",
    "Two bibliographic metadata errors are present: the DOI recorded for Horie24 (10.1007/s10851-023-01159-6) belongs to the Journal of Mathematical Imaging and Vision rather than the Mathematical Journal of Okayama University, and Goupil98 records '1998.0215' as an arXiv identifier when it is the numeric suffix of the DOI.",
    "Standard references Grothendieck's Esquisse d'un programme and Lando–Zvonkin Graphs on Surfaces and Their Applications are absent despite their direct relevance to the paper's combinatorial and Galois-theoretic context."
  ]
}
```

### novelty (`sonnet[1m]`) — status: `pass`

```json
{
  "confidence": 0.68,
  "missing_prior_art": [
    {
      "reason": "This major monograph on maps, dessins d'enfants, and their combinatorics is a standard reference in the field and covers passport enumeration and monodromy groups in depth. Its absence from the bibliography is notable given its direct relevance to the combinatorial methods used.",
      "title": "Lando and Zvonkin, Graphs on Surfaces and Their Applications (Springer, 2004)"
    },
    {
      "reason": "Mednykh and Nedela produced a substantial body of work on counting and classifying maps by genus and symmetry group, which is directly related to the counting arguments and automorphism group analysis in this paper. Their work on regular maps and automorphism groups may constitute relevant prior art not acknowledged.",
      "title": "Mednykh and Nedela, Enumeration of unrooted maps of a given genus (2006–2010 series)"
    }
  ],
  "novelty_score": 0.45,
  "related_work": [
    {
      "citation_key": "Ohnishi26",
      "delta": "The current paper directly extends Ohnishi26: it proves the [b^q, b^q, n] case of the trivial-automorphism-group conjecture that was left open there, provides explicit counterexamples to two conjectures stated in that paper, gives an alternative proof of Ohnishi26 Theorem 7.6 via new centralizer-counting arguments, and completes the full classification table for genus ≥ 2 uniform passports.",
      "relation": "builds_on",
      "title": "Regularity and Automorphism Groups of Dessins d'Enfants with Uniform Passports"
    },
    {
      "citation_key": "Goupil98",
      "delta": "The Goupil–Schaeffer formula (Theorem 2.1) is the key combinatorial engine used to derive lower bounds on |N(b,q,b)|; the current paper applies it to the symmetric [b^q, b^q, n] case, whereas Goupil–Schaeffer proved it in full generality.",
      "relation": "prior_art",
      "title": "Factoring N-cycles and counting maps of given genus"
    },
    {
      "citation_key": "Jones16",
      "delta": "Provides the foundational framework (Belyi's theorem, monodromy groups, regularity, automorphism groups) on which all definitions and basic results in this paper rest. The current paper contributes new existence and non-existence theorems not present in Jones–Wolfart.",
      "relation": "prior_art",
      "title": "Dessins d'enfants on Riemann surfaces"
    },
    {
      "citation_key": "Hidalgo19",
      "delta": "Studies automorphism groups of dessins in a general setting; the current paper specialises to uniform passports and proves existence of trivial-automorphism-group representatives within specific passport families.",
      "relation": "prior_art",
      "title": "Automorphism groups of dessins d'enfants"
    },
    {
      "citation_key": "Girondo14",
      "delta": "Studies fields of definition of uniform dessins and their relation to automorphism groups, providing motivation for understanding when automorphism groups are trivial or nontrivial; the current paper addresses the distribution question for genus ≥ 2 explicitly.",
      "relation": "prior_art",
      "title": "Fields of definition of uniform dessins on quasiplatonic surfaces"
    },
    {
      "citation_key": "Horie24",
      "delta": "Provides a counting method for isomorphism classes of dessins with two vertices and a given automorphism group order; the current paper instead gives an explicit constructive existence proof and is explicitly noted in the paper as complementary (counting vs. construction).",
      "relation": "orthogonal",
      "title": "Equivalence classes of dessins d'enfants with two vertices"
    },
    {
      "citation_key": "Conder13",
      "delta": "Focuses on Galois actions on regular dessins for small genera via computational enumeration; the current paper addresses existence of dessins with trivial (or nontrivial) automorphism groups in uniform passport families across all sufficiently large genus.",
      "relation": "orthogonal",
      "title": "Galois actions on regular dessins of small genera"
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
      "description": "No code repository, license, pinned commit, or executable scripts are provided for reproducing the paper's permutation counts, centralizer bounds, or constructed dessin examples.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "The headline theorem for passports of the form [b^q,b^q,n] is supported only by prose mathematics in the provided context; a formal verification artifact such as Proofs/Class3.lean would be needed for proof-as-code reproducibility.",
      "severity": "critical"
    },
    {
      "area": "other",
      "description": "The counterexample claims for passports such as [8^2,2^8,4^4] and [5^3,5^3,15] lack a formal proof certificate or exhaustive enumeration artifact; a file such as Proofs/Counterexamples.lean or a checked enumeration script would close this gap.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "The construction and classification claims for the [n,n,n] genus-at-least-2 case lack a formalized proof artifact such as Proofs/Class1.lean, limiting independent machine-checkable reproduction.",
      "severity": "major"
    },
    {
      "area": "data",
      "description": "No machine-readable artifact is provided for the finite examples, passports, or permutation witnesses used in the constructions and counterexamples.",
      "severity": "minor"
    }
  ],
  "confidence": 0.78,
  "data_availability": "unspecified",
  "data_url": null,
  "environment": null,
  "reproducibility_score": 0.28
}
```

### summary (`claude-haiku-4-5`) — status: `pass`

```json
{
  "audience": "Algebraic geometers, number theorists, and researchers in combinatorial group theory interested in Galois actions on algebraic curves, dessins d'enfants, and the interplay between moduli theory and automorphism groups of geometric objects.",
  "key_contributions": [
    "Proof that uniform passports of the form [b^q, b^q, n] with genus ≥ 2 always admit dessins with trivial automorphism groups (Theorem 3.1)",
    "Discovery of counterexamples to prior conjectures: the passport [8^2, 2^8, 4^4] admits no dessin with trivial automorphism group, and [15, 5^3, 5^3] admits only dessins with trivial automorphism groups",
    "General theorem characterizing families of passports where every dessin has trivial automorphism group, specifically those of the form [ℓ₁ℓ₂, ℓ₂^ℓ₁, ℓ₂^ℓ₁] when ℓ₁ and ℓ₂ are distinct odd primes",
    "Alternative proof using counting arguments and centralizers for the [n, b^q, n] case previously established",
    "Construction of explicit examples demonstrating the distribution of automorphism groups across different passport families and genera"
  ],
  "plain_language_summary": "A dessin d'enfant is a special type of bipartite graph that can be drawn on a curved surface (such as a sphere or higher-genus surface) in connection with algebraic curves. This paper studies how the symmetries of these objects vary depending on their structural properties, measured by what mathematicians call \"passports\" and \"automorphism groups.\"\n\nThe authors extend previous results about uniform dessins—those with highly regular structure—particularly focusing on genus 2 and higher surfaces. The main contribution is proving that dessins with passports of the form [b^q, b^q, n] (where the black and white vertices have the same degree pattern) always admit examples with completely trivial symmetry. The paper also discovers surprising exceptions to earlier conjectures: some passport families have the property that every dessin with that passport must have nontrivial symmetry, while others guarantee all dessins are completely symmetric.",
  "tldr": "This paper proves that dessins d'enfants with uniform passports of the form [b^q, b^q, n] of genus at least 2 always admit examples with trivial automorphism groups, while also identifying passport families where all such dessins have either only trivial or only nontrivial automorphism groups."
}
```

### technical_correctness (`opus[1m]`) — status: `pass`

```json
{
  "claims": [
    {
      "assessment": "partially_supported",
      "claim": "Theorem (thm:class3): Every uniform passport [b^q, b^q, n] (n=bq, q>=1) of genus at least 2 admits a dessin d'enfant with trivial automorphism group.",
      "evidence": "A complete textual proof is given: the b=3 case uses the explicit permutation family of Prop prop:c3b3, and the b>=5 case reduces to showing |N(b,q,b)| > |D(n)| via the counting bound R(b,q)>1, with base case R(5,3)=72919/11664>1 and monotonicity in b and q. The argument is plausible and internally consistent, but the explicit permutation construction (general odd q) and the closed-form ratio computations are exactly the kind of load-bearing claim verifiable by a computer-algebra artifact, and no such artifact is shipped.",
      "id": "C1",
      "location": "Section 'Passport [b^q,b^q,n] with Genus >=2', Theorem thm:class3 (proved via Prop prop:class3beq3 for b=3 and Prop prop:class3bge5 for b>=5)",
      "severity": "major",
      "suggested_fix": "Ship an executable verification, e.g. experiments/class3/verify_bbn.py (or a GAP script) that, for a range of (b,q), constructs x,y per Prop prop:c3b3 / the counting argument, confirms cycle types (b^q) and (n), and confirms Aut(D) is trivial by checking x^k y != y x^k for all 1<=k<=n-1; place at src/proofs/class3_verify.gap."
    },
    {
      "assessment": "supported",
      "claim": "Theorem (thm:trivautd): For n=l1*l2 with l1<l2 distinct primes, every dessin with passport [l1*l2, l2^{l1}, l2^{l1}] has trivial automorphism group (e.g. [15,5^3,5^3], [21,7^3,7^3], ...).",
      "evidence": "The proof is a self-contained group-theoretic block-system argument: it shows y in D forces y in D_{l1} or D_{l2}; case (i) yields l1 | l2 (contradiction); case (ii) builds the block translations s_i and derives both sum s_j == 0 and sum s_j + 1 == 0 mod l1 (contradiction). The reasoning (block systems preserved by y and xy, order of induced permutation dividing prime l2, the +1 contribution from the single x-block-shift) is rigorous and does not depend on unverified computation.",
      "id": "C2",
      "location": "Section 'Counterexamples to Previous Conjectures', subsection 'Only Dessins with Trivial Automorphism Group', Theorem thm:trivautd",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "unsupported",
      "claim": "The passport [8^2, 2^8, 4^4] (genus 2) admits NO dessin with trivial automorphism group: with x of type (8^2) fixed there are exactly 920 permutations y, forming 19 conjugacy classes under C_{S_n}(x), and every Aut(D) is nontrivial (11/6/1/1 classes with |Aut|=2/4/8/16).",
      "evidence": "This is a headline counterexample to a previously published conjecture, but it is asserted purely 'by direct computation'. No proof and no code/data are provided to substantiate the enumeration (920 permutations, 19 classes, the class-size and |Aut| breakdown). In a code-amenable field this exhaustive search is the canonical executable artifact, and its absence is a verification gap for a load-bearing claim.",
      "id": "C3",
      "location": "Section 'Counterexamples to Previous Conjectures', subsection 'No Dessins with Trivial Automorphism Group', list + Table tab:pass442882",
      "severity": "major",
      "suggested_fix": "Ship experiments/counterexamples/passport_8282_28_44.py (or a GAP script) that fixes x=(1..8)(9..16), enumerates all y of cycle type (8^2) with (xy)^{-1} of type (4^4), and prints the count (expected 920), the centralizer-conjugacy classes (expected 19) and the |Aut(D)| distribution; commit its output log."
    },
    {
      "assessment": "partially_supported",
      "claim": "The passport [15, 5^3, 5^3] (genus 5) admits ONLY dessins with trivial automorphism group: for a fixed 15-cycle x there are 4354560 permutations y (=N(5,3,5)), every corresponding dessin has trivial Aut, and there are 290304 conjugacy classes of size 15 each.",
      "evidence": "The qualitative statement (all such dessins have trivial Aut) is a special case of Theorem thm:trivautd (l1=3, l2=5), which is proved analytically, so it is supported. However the precise numeric counts (N=4354560, 290304 conjugacy classes, 290304*15=4354560 consistency) are asserted 'by direct computation' with no shipped artifact; these specific numbers are unverified from the text.",
      "id": "C4",
      "location": "Section 'Counterexamples to Previous Conjectures', subsection 'Only Dessins with Trivial Automorphism Group', bullet list",
      "severity": "minor",
      "suggested_fix": "Add experiments/counterexamples/passport_15_53_53.py that fixes a 15-cycle x, enumerates N(5,3,5), confirms the count 4354560 and the 290304 size-15 conjugacy classes, and confirms triviality of Aut for each; commit the run log."
    },
    {
      "assessment": "partially_supported",
      "claim": "Theorem (thm:class1) and its corollary: A uniform passport [n,n,n] of genus >=2 admits a nonregular dessin with nontrivial automorphism group iff n is composite; more precisely it admits a dessin with |Aut(D)|=r iff r divides n. The construction y=t x t^{-1} with t=(s,2s,...,n) gives |Aut(D)|=r.",
      "evidence": "The proof is explicit and largely checkable: the prime case follows from divisibility of |Aut| by n plus Lemma lem:order-n; the composite case constructs x,y, shows (xy)^{-1} is an n-cycle via the step maps (+2, +s+2, -s+2) and gcd(s,2)=gcd(r,2)=1, and computes |Aut(D)|=n/s=r by showing x^k commutes with y iff s|k. The logic is sound; however the explicit permutation construction and the |Aut|=r conclusion are code-verifiable and no artifact is shipped to confirm the general (n,r) family.",
      "id": "C5",
      "location": "Section 'Passport [n,n,n] with Genus >=2', Theorem thm:class1 and following Corollary",
      "severity": "minor",
      "suggested_fix": "Ship experiments/class1/verify_nnn.py that, for several odd composite n and each divisor r|n, builds x,y per Theorem thm:class1, checks all three cycle types are (n), and checks |C_{S_n}(<x,y>)| = r."
    },
    {
      "assessment": "unsupported",
      "claim": "Theorem (thm:class2) / Prop prop:c2bge3: Every passport [n,b^q,n] of genus >=2 admits a dessin with trivial automorphism group; the counting bound R(b,q)>1 holds except for (b,q) in {(3,2),(3,3),(3,4),(4,2)}, with (3,3) still giving |N|>|D| and the remaining three handled by explicit y in Table tab:exceptionbq.",
      "evidence": "The monotonicity of R(b,q) in b and q is proved analytically, but the decisive base/exception data is asserted 'by direct computation using (eq:Rbq)': the inequalities R(3,2),R(3,3),R(3,4),R(4,2)<=1 and R(3,5),R(4,4),R(5,2)>1, and the explicit exception values |N| and |D| (e.g. (3,4): N=38720, D=47952) together with the explicit y's claimed to give trivial Aut. These computations are the load-bearing closure of the proof and no executable artifact is provided. (Note: thm:class2 itself is also already established in cite Ohnishi26 Thm 7.6.)",
      "id": "C6",
      "location": "Section 'Alternative Proof of the [n,b^q,n] Case', Prop prop:c2bge3, Table tab:exceptionbq, Theorem thm:class2",
      "severity": "major",
      "suggested_fix": "Ship experiments/class2/verify_nbqn.py computing R(b,q) from eq:Rbq for the listed pairs, the exact |N|,|D| for the four exceptional pairs, and confirming Aut(D) trivial for each tabulated y; place at src/proofs/class2_exceptions.gap."
    },
    {
      "assessment": "partially_supported",
      "claim": "Lemma (lem:Dupper): For an n-cycle x in S_n, |D| <= kappa_1 * 2^{n/2} (n/2)! with kappa_1=2623/1894, and if n is odd, |D| <= kappa_2 * 3^{n/3} (n/3)! with kappa_2=972/947.",
      "evidence": "The derivation is detailed and appears correct: F_n(x)=x^{n/x}Gamma(n/x+1) is shown strictly decreasing (via psi(x+1)>log x and log n - 1 >= log 3 - 1 > 0), and the multi-prime case bounds successive ratios by H(2,1,1)=3/8 and H(3,2,1)=25/972, giving the geometric series sum 1 + (3/8)/(1-25/972) = 2623/1894 = kappa_1 and 1/(1-25/972)=972/947=kappa_2. The constants and series sums are arithmetic facts that are correct on inspection but not independently machine-verified; the bound G_n'(x) uses log n - 1 >= log 3 - 1 which silently assumes n>=3 (the n=2 case is handled separately), so the argument is complete.",
      "id": "C7",
      "location": "Section 'Counting Arguments for Trivial Automorphism Groups', subsection 'Upper Bound for D', Lemma lem:Dupper",
      "severity": "minor",
      "suggested_fix": "Add a short numerical check (e.g. experiments/bounds/check_Dupper.py) evaluating the geometric series and the constants kappa_1, kappa_2 and spot-checking |D| <= bound for small n by direct centralizer enumeration."
    },
    {
      "assessment": "supported",
      "claim": "Proposition (prop:c3b3): The explicit permutations x=(1..3q), y=A B_0...B_{(q-5)/2} Gamma satisfy (1) y has cycle type (3^q), (2) (xy)^{-1} has cycle type (3^q), (3) Aut(D) is trivial, for every odd q>=3.",
      "evidence": "I directly verified the q=3 instance: y=(1 2 4)(3 7 5)(6 8 9) has type (3^3); computing xy gives (1 3 8)(2 5 4)(6 9 7), so (xy)^{-1}=(1 8 3)(2 4 5)(6 7 9), matching the paper, and both have type (3^3). The cover-all-elements arguments for the two residue cases q=1,3 mod 4 and the case analysis for x^k y != y x^k (e=1 and e=3 give incompatible k-conditions (eq:ke1) vs (eq:ke2)) are explicit and consistent. The general construction is well specified and the spot check passes.",
      "id": "C8",
      "location": "Section 'Passport [b^q,b^q,n] with Genus >=2', subsection 'The Subcase b=3', Prop prop:c3b3 and Table tab:xycycles",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Lemma (lem:Nbqblower): For a passport [n,b^q,b^q] of genus >=1, |N(b,q,b)| >= (n-q)! / (2^{q(b-2)} ((q+1)/2)! ((q-1)/2)!) * ((b-1)/2b)^{(q-1)/2}.",
      "evidence": "The bound is derived from Goupil's theorem (Theorem thm:goupil, cited) by keeping only the symmetric (g1,g2)=(0,g),(g,0) terms and restricting to the single composition type with (q+1)/2 parts equal to (b-1)/2 and (q-1)/2 parts equal to (b-3)/2, using the identity (b-1)/2*q - g = (q-1)/2 with g=(q(b-2)+1)/2. The algebra (factorial cancellations, binom(b,2)^{(q-1)/2}, binom(q,(q-1)/2)) is intricate but internally consistent; it relies on the externally cited Goupil formula and is not independently re-derived or numerically validated here.",
      "id": "C9",
      "location": "Section 'Counting Arguments for Trivial Automorphism Groups', subsection 'Lower Bound for N', Lemma lem:Nbqblower",
      "severity": "minor",
      "suggested_fix": "Add experiments/bounds/check_Nlower.py that computes |N(b,q,b)| exactly for small odd b,q by direct enumeration (or via the full Goupil sum) and confirms it exceeds the stated lower bound."
    },
    {
      "assessment": "unsupported",
      "claim": "The conjecture that every dessin with passport [(4t)^2, 2^{4t}, (2t)^4] (t>=2) has nontrivial automorphism group fails at t=3: the passport [12^2, 2^{12}, 6^4] admits a dessin with trivial automorphism group.",
      "evidence": "This existence claim (a dessin with trivial Aut for [12^2,2^12,6^4]) is stated without proof or an exhibited permutation pair, and is presented as the result of computation; no executable artifact or explicit witness y is provided. It is load-bearing because it bounds the scope of the [8^2,2^8,4^4] phenomenon.",
      "id": "C10",
      "location": "Section 'Counterexamples to Previous Conjectures', subsection 'No Dessins with Trivial Automorphism Group', closing paragraph",
      "severity": "major",
      "suggested_fix": "Provide an explicit witness pair (x,y) for [12^2,2^12,6^4] with trivial Aut and ship experiments/counterexamples/passport_12_212_64.py that verifies the cycle types and triviality of Aut(D)."
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

1. Adrianov20: AUTHOR = Adrianov, N. M. and Pakovich, F. and Zvonkin, A. K., TITLE = Davenport-Zannier polynomials and dessins d'enfants, SERIES = Mathematical Surveys and Monographs, VOLUME = 249, PUBLISHER = American Mathematical Society, Providence, RI, YEAR = 2020, PAGES = xi+187, ISBN = 978-1-4704-5634-4, MRCLASS = 11G32 (05Cxx 05E18 11R32 14H57 20B15), MRNUMBER = 4249449, MRREVIEWER = David\ P.\ Roberts,
2. Belyi02: AUTHOR = Bely\ui, G. V., TITLE = Another proof of the three points theorem, JOURNAL = Mat. Sb., FJOURNAL = Matematicheski\u i\ Sbornik, VOLUME = 193, YEAR = 2002, NUMBER = 3, PAGES = 21--24, ISSN = 0368-8666,2305-2783, MRCLASS = 14G25 (14H30), MRNUMBER = 1913596, memo = 10.1070/SM2002v193n03ABEH000633, memo = https://doi.org/10.1070/SM2002v193n03ABEH000633, doi:[10.1070/SM2002v193n03ABEH000633](https://doi.org/10.1070/SM2002v193n03ABEH000633)
3. Belyi79: AUTHOR = Bely\ui, G. V., TITLE = Galois extensions of a maximal cyclotomic field, JOURNAL = Izv. Akad. Nauk SSSR Ser. Mat., FJOURNAL = Izvestiya Akademii Nauk SSSR. Seriya Matematicheskaya, VOLUME = 43, YEAR = 1979, NUMBER = 2, PAGES = 267--276, 479, ISSN = 0373-2436, MRCLASS = 12A55, MRNUMBER = 534593, MRREVIEWER = Jerzy\ Browkin,
4. Conder13: AUTHOR = Conder, M. D. E. and Jones, G. A. and Streit, M. and Wolfart, J., TITLE = Galois actions on regular dessins of small genera, JOURNAL = Rev. Mat. Iberoam., FJOURNAL = Revista Matem\'atica Iberoamericana, VOLUME = 29, YEAR = 2013, NUMBER = 1, PAGES = 163--181, ISSN = 0213-2230,2235-0616, MRCLASS = 14H57 (05C10 05C25 11G32 30F10), MRNUMBER = 3010126, MRREVIEWER = David\ Torres-Teigell, memo = 10.4171/RMI/717, memo = https://doi.org/10.4171/RMI/717, doi:[10.4171/RMI/717](https://doi.org/10.4171/RMI/717)
5. Cueto14: author = Cueto, M. H., title = The field of moduli and fields of definition of dessins d'enfants, note = arXiv:1409.7736, year = 2014, arXiv:[1409.7736](https://arxiv.org/abs/1409.7736)
6. Dixon96: AUTHOR = Dixon, J. D. and Mortimer, B., TITLE = Permutation groups, SERIES = Graduate Texts in Mathematics, VOLUME = 163, PUBLISHER = Springer-Verlag, New York, YEAR = 1996, PAGES = xii+346, ISBN = 0-387-94599-7, MRCLASS = 20B05 (20-01 20B07), MRNUMBER = 1409812, MRREVIEWER = Martin\ W.\ Liebeck, memo = 10.1007/978-1-4612-0731-3, memo = https://doi.org/10.1007/978-1-4612-0731-3, doi:[10.1007/978-1-4612-0731-3](https://doi.org/10.1007/978-1-4612-0731-3)
7. Girondo12: AUTHOR = Girondo, E. and Gonz\'alez-Diez, G., TITLE = Introduction to compact Riemann surfaces and dessins d'enfants, SERIES = London Mathematical Society Student Texts, VOLUME = 79, PUBLISHER = Cambridge University Press, Cambridge, YEAR = 2012, PAGES = xii+298, ISBN = 978-0-521-74022-7, MRCLASS = 30-01 (11G32 14H57 30F10), MRNUMBER = 2895884, MRREVIEWER = Aaron\ D.\ Wootton,
8. Girondo14: AUTHOR = Girondo, E. and Torres-Teigell, D. and Wolfart, J., TITLE = Fields of definition of uniform dessins on quasiplatonic surfaces, BOOKTITLE = Riemann and Klein surfaces, automorphisms, symmetries and moduli spaces, SERIES = Contemp. Math., VOLUME = 629, PAGES = 155--170, PUBLISHER = Amer. Math. Soc., Providence, RI, YEAR = 2014, ISBN = 978-1-4704-1093-3, MRCLASS = 11G32 (14G35 14H57 30F10 30F35), MRNUMBER = 3289639, MRREVIEWER = Ayberk\ Zeytin, memo = 10.1090/conm/629/12558, memo = https://doi.org/10.1090/conm/629/12558, doi:[10.1090/conm/629/12558](https://doi.org/10.1090/conm/629/12558)
9. Goupil98: AUTHOR = Goupil, A. and Schaeffer, G., TITLE = Factoring N-cycles and counting maps of given genus, JOURNAL = European J. Combin., FJOURNAL = European Journal of Combinatorics, VOLUME = 19, YEAR = 1998, NUMBER = 7, PAGES = 819--834, ISSN = 0195-6698,1095-9971, MRCLASS = 05C30 (05C10 05C38 57M99), MRNUMBER = 1649966, MRREVIEWER = K.\ S.\ Sarkaria, memo = 10.1006/eujc.1998.0215, memo = https://doi.org/10.1006/eujc.1998.0215, doi:[10.1006/eujc.1998.0215](https://doi.org/10.1006/eujc.1998.0215) arXiv:[1998.0215](https://arxiv.org/abs/1998.0215)
10. Hidalgo18: author = Hidalgo, R. A., title = Automorphism groups of dessins d'enfants, note = arXiv:1811.07849, year = 2018, arXiv:[1811.07849](https://arxiv.org/abs/1811.07849)
11. Hidalgo19: AUTHOR = Hidalgo, R. A., TITLE = Automorphism groups of dessins d'enfants, JOURNAL = Arch. Math. (Basel), FJOURNAL = Archiv der Mathematik, VOLUME = 112, YEAR = 2019, NUMBER = 1, PAGES = 13--18, ISSN = 0003-889X,1420-8938, MRCLASS = 30F40 (11G32 14H57), MRNUMBER = 3901897, MRREVIEWER = John\ R.\ Parker, memo = 10.1007/s00013-018-1222-9, memo = https://doi.org/10.1007/s00013-018-1222-9, doi:[10.1007/s00013-018-1222-9](https://doi.org/10.1007/s00013-018-1222-9)
12. Horie24: AUTHOR = Horie, M., TITLE = Equivalence classes of dessins d'enfants with two vertices, JOURNAL = Math. J. Okayama Univ., FJOURNAL = Mathematical Journal of Okayama University, VOLUME = 66, YEAR = 2024, PAGES = 1--30, ISSN = 0030-1566, MRCLASS = 14H57 (05A15 11G32 20B30), MRNUMBER = 4688440, memo = 10.1007/s10851-023-01159-6, memo = https://doi.org/10.1007/s10851-023-01159-6, doi:[10.1007/s10851-023-01159-6](https://doi.org/10.1007/s10851-023-01159-6)
13. Jones14: AUTHOR = Jones, G. A., TITLE = Regular dessins with a given automorphism group, BOOKTITLE = Riemann and Klein surfaces, automorphisms, symmetries and moduli spaces, SERIES = Contemp. Math., VOLUME = 629, PAGES = 245--260, PUBLISHER = Amer. Math. Soc., Providence, RI, YEAR = 2014, ISBN = 978-1-4704-1093-3, MRCLASS = 14H57 (14H37 30F10), MRNUMBER = 3289645, MRREVIEWER = David\ Torres-Teigell, memo = 10.1090/conm/629/12568, memo = https://doi.org/10.1090/conm/629/12568, doi:[10.1090/conm/629/12568](https://doi.org/10.1090/conm/629/12568)
14. Jones16: AUTHOR = Jones, G. A. and Wolfart, J., TITLE = Dessins d'enfants on Riemann surfaces, SERIES = Springer Monographs in Mathematics, PUBLISHER = Springer, Cham, YEAR = 2016, PAGES = xiv+259, ISBN = 978-3-319-24709-0; 978-3-319-24711-3, MRCLASS = 14H57 (05C25 11G32 30F10 57M15), MRNUMBER = 3467692, MRREVIEWER = Ariyan\ Javanpeykar, memo = 10.1007/978-3-319-24711-3, memo = https://doi.org/10.1007/978-3-319-24711-3, doi:[10.1007/978-3-319-24711-3](https://doi.org/10.1007/978-3-319-24711-3)
15. Ohnishi26: title=Regularity and Automorphism Groups of Dessins d'Enfants with Uniform Passports, author=Ohnishi, T., year=2026, eprint=2602.11867, archivePrefix=arXiv, primaryClass=math.AG, note=arXiv:2602.11867, memo=https://arxiv.org/abs/2602.11867, arXiv:[2602.11867](https://arxiv.org/abs/2602.11867)
16. Sagan01: AUTHOR = Sagan, Bruce E., TITLE = The symmetric group, SERIES = Graduate Texts in Mathematics, VOLUME = 203, EDITION = Second, NOTE = Representations, combinatorial algorithms, and symmetric functions, PUBLISHER = Springer-Verlag, New York, YEAR = 2001, PAGES = xvi+238, ISBN = 0-387-95067-2, MRCLASS = 05E10 (05E05 20C30), MRNUMBER = 1824028, memo = 10.1007/978-1-4757-6804-6, memo = https://doi.org/10.1007/978-1-4757-6804-6, doi:[10.1007/978-1-4757-6804-6](https://doi.org/10.1007/978-1-4757-6804-6)
17. Scodro24: author = Scodro, G., title = Belyi's theorem and dessins d'enfants, school = University of Padova, year = 2024, note = ALGANT Master's Thesis, available at \urlhttps://thesis.unipd.it/retrieve/4d0c1b93-fca9-4547-883c-d53b5a86dea0/Scodro_Giacomo.pdf,
18. Wakabayashi22: AUTHOR = Wakabayashi, Yasuhiro, TITLE = An effective version of Bely\u i's theorem in positive characteristic, JOURNAL = J. Number Theory, FJOURNAL = Journal of Number Theory, VOLUME = 231, YEAR = 2022, PAGES = 251--268, ISSN = 0022-314X,1096-1658, MRCLASS = 14H30 (11G32 14Q20), MRNUMBER = 4330933, MRREVIEWER = Ayberk\ Zeytin, memo = 10.1016/j.jnt.2021.04.028, memo = https://doi.org/10.1016/j.jnt.2021.04.028, doi:[10.1016/j.jnt.2021.04.028](https://doi.org/10.1016/j.jnt.2021.04.028)

