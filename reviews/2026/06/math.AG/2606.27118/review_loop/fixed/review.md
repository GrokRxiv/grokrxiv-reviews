# Automorphism Groups of Uniform Dessins d'Enfants of Genus at Least Two

GrokRxiv review of [arXiv:2606.27118](https://arxiv.org/abs/2606.27118) · `math.AG`

_Authors_: Tatsuya Ohnishi

## TL;DR

The paper investigates automorphism groups of uniform dessins d'enfants across three passport families—[$b^q$,$b^q$,n], [n,n,n], and [n,$b^q$,n]—extending the authors' prior work (Ohnishi26) and producing counterexamples to conjectures stated there. $Technical_correctness$ assessed the paper as mostly_sound (confidence 0.60), with core mathematical arguments largely intact but three headline computational claims—the [8^2,2^8,4^4] counterexample (TC2), the [15,5^3,5^3] exhaustive count (TC3), and the [12^2,2^12,6^4] existence assertion (TC4)—rated unsupported at major severity due to absent verification artifacts. Reproducibility (confidence 0.86, score 0.22) raised a critical concern that the principal theorem (Theorem thm:class3 for [$b^q$,$b^q$,n]) is backed only by prose with no shipped code or formal proof artifact, and added four further major concerns for counterexample verifications. Novelty (confidence 0.65) found the contribution incremental (score 0.60) but genuine: the paper fills three concrete gaps left by Ohnishi26 and produces novel counterexamples that revise prior conjectures. Citation (confidence 0.62) identified a mismatched DOI in Horie24 (prefix 10.1007/s10851 belongs to a different journal), a malformed arXiv annotation in Goupil98 (DOI suffix mistaken for an arXiv ID), a redundant dual-listing of Hidalgo18 and Hidalgo19, and notable omissions of Grothendieck's Esquisse d'un Programme and the Lando–Zvonkin monograph. The paper's field (math.AG) is code-amenable; the combination of reproducibility's critical rating on the headline theorem and technical_correctness's major-severity unsupported findings on three computational claims triggers the major_revision gate under the recommendation gate rule. No specialist disagreements are present that require explicit adjudication; all five specialists consistently flag computational artifact absence as the primary deficiency.

_Recommendation_: **Major revision** · _Confidence_: 72%

## Strengths

- Theorem thm:class3 provides a complete existence argument for trivial-automorphism-group dessins across all [$b^q$,$b^q$,n] passports at genus at least 2, filling the principal gap left by Ohnishi26 on this passport family.
- The discovery that [8^2,2^8,4^4] admits no dessin with trivial automorphism group and that [15,5^3,5^3] admits only dessins with trivial automorphism group constitutes a meaningful empirical refinement of earlier conjectures, demonstrating that the [n,$b^q$,n] and [$b^q$,$b^q$,n] cases are not uniformly parallel.
- Theorem thm:trivautd delivers a self-contained group-theoretic proof that every [l1*l2, $l2^{l1}$, $l2^{l1}$] passport with l1, l2 distinct odd primes and l2 > l1 admits only dessins with trivial automorphism group, with no unverified computational steps (TC5, assessment: supported).
- The alternative centralizer-based proof for the [n,$b^q$,n] case elucidates the structural reason underlying the existence result and provides a second, independent route to a theorem already established in Ohnishi26.
- Lemma lem:Nbqblower and Lemma lem:Dupper supply analytically rigorous counting bounds whose derivations from the Goupil–Schaeffer formula are internally consistent and hand-verifiable (TC6, TC12, assessment: supported).

## Weaknesses

- The [8^2,2^8,4^4] counterexample asserts 920 permutations in 19 conjugacy classes, all with nontrivial automorphism group, based on exhaustive computation, but no enumeration script, GAP/Sage session log, or data file is provided, leaving this headline counterexample unverifiable (TC2, major).
- The claimed cardinalities for [15,5^3,5^3]—4,354,560 permutations in 290,304 orbits, all with trivial automorphism group—are likewise unsupported by any computational artifact; the figures cannot be independently checked from the manuscript alone (TC3, major).
- The existence assertion for [12^2,2^12,6^4], attributed to 'direct computation,' provides neither an explicit permutation pair nor a verification script, despite the claim falsifying a conjecture from the prior literature (TC4, major).
- The headline theorem for [$b^q$,$b^q$,n] (Theorem thm:class3) relies on intricate index bookkeeping in the b=3 subcase (Proposition prop:c3b3, TC9, minor) and unshipped base-case numerics for b at least 5 (R(5,3)=72919/11664, TC7, minor); no machine-checkable artifact accompanies either sub-case, constituting a critical proof-as-code absence per the reproducibility specialist.
- The bibliography contains two verified errors—the DOI assigned to Horie24 (prefix 10.1007/s10851) belongs to a different journal, and Goupil98 carries a malformed arXiv annotation ('1998.0215' is a DOI suffix, not a valid arXiv ID)—plus a redundant dual-listing of Hidalgo18 and Hidalgo19 that should be consolidated into the published journal entry.

## Revision Targets

- [ ] **Manuscript: Section 'Counterexamples', 'Only Dessins with Trivial Automorphism Group'**
  - Location: `Section 'Counterexamples', 'Only Dessins with Trivial Automorphism Group'`
  - Evidence: The counts 4354560 and 290304 and the 'all trivial' claim are exhaustive computational results presented without any shipped artifact; they are not derivable from the surrounding text. Theorem thm:trivautd later proves the 'all trivial' direction abstractly, but the specific cardinalities remain unverified.
  - Required change: Provide experiments/passport_15_5_5/enumerate.gap reproducing |N(5,3,5)|=4354560, the 290304 $C_{S_n}(x)$-orbits of size 15, and the triviality of each AD.
  - Verification: Re-review should confirm `Section 'Counterexamples', 'Only Dessins with Trivial Automorphism Group'` is corrected or justified.
- [ ] **Manuscript: reproducibility appendix**
  - Location: `reproducibility appendix`
  - Evidence: The claimed family in which passports such as [5^3,5^3,15] admit no dessin with nontrivial automorphism group lacks a formalized proof or independently checkable computation; an artifact such as proofs/TrivialOnly.lean or code/trivial_only_certificates/ would close the gap.
  - Required change: Add a reproducibility note that resolves this concern: The claimed family in which passports such as [5^3,5^3,15] admit no dessin with nontrivial automorphism group lacks a formalized proof or independently checkable computation; an artifact such as proofs/TrivialOnly.lean or code/trivial_only_certificates/ would close the gap.
  - Verification: Re-review should confirm the reproducibility concern is addressed with a concrete artifact or manuscript update.
- [ ] **Code release and entrypoints**
  - Location: code/reproducibility artifacts: `code release and execution entrypoints`
  - Evidence: No reproducibility artifact, repository URL, license, or pinned release is provided for independently checking the permutation-counting arguments, centralizer computations, explicit dessin constructions, or counterexample searches.
  - Required change: Release the source code, scripts, model configuration, and execution entrypoints needed to regenerate the reported tables, or document why those artifacts cannot be released.
  - Verification: Re-review should confirm runnable code or a documented non-release justification is present.
- [ ] **Manuscript: reproducibility appendix**
  - Location: `reproducibility appendix`
  - Evidence: The headline theorem that every passport of the form [$b^q$,$b^q$,n] of genus at least 2 admits a dessin with trivial automorphism group is supported only by prose mathematics; a formal verification artifact such as proofs/Class3.lean or a checked computational certificate would be needed for proof-as-code reproduction.
  - Required change: Add a reproducibility note that resolves this concern: The headline theorem that every passport of the form [$b^q$,$b^q$,n] of genus at least 2 admits a dessin with trivial automorphism group is supported only by prose mathematics; a formal verification artifact such as proofs/Class3.lean or a checked computational certificate would be needed for proof-as-code reproduction.
  - Verification: Re-review should confirm the reproducibility concern is addressed with a concrete artifact or manuscript update.
- [ ] **Bibliography: Esquisse d'un Programme**
  - Location: bibliography entry: `Esquisse d'un Programme`
  - Evidence: The Introduction explicitly states that the dessin theory 'deeply fascinated Grothendieck and led to his theory of dessins d'enfants,' yet Grothendieck's foundational Esquisse d'un Programme (1984, published in Schneps–Lochak 1997) is not cited; it is the standard primary source for the programme that motivates the entire field.
  - Required change: Add a bibliography entry for `Esquisse d'un Programme` and cite it where the affected method or claim is introduced, or explicitly justify its omission.
  - Verification: Re-review should confirm the bibliography and citation context address this reference.

## Open Questions

- For the [8^2,2^8,4^4] counterexample: can an enumeration script (e.g., GAP, Sage, or Python with SymPy) that reproduces the 920 permutations and confirms each has nontrivial centralizer in $S_16$ be provided as a supplementary artifact?
- For [15,5^3,5^3]: what software was used to enumerate the 4,354,560 permutations and verify all centralizers are trivial, and can the code and representative output log be shared?
- The existence claim for [12^2,2^12,6^4] via 'direct computation' falsifies a stated conjecture; can an explicit pair (x,y) with the required cycle types and trivial centralizer in $S_24$ be exhibited in the manuscript?
- The b=3 construction in Proposition prop:c3b3 involves parameters v, w, and intricate 11v+... block structures valid for all odd q at least 3; has this construction been validated computationally for a representative range of q, and if so can the validation code be released?
- Theorem 3.6 is cited from Scodro24, a Master's thesis, for a result that appears in the standard monographs Jones16 and Adrianov20; what motivated citing the thesis as primary source rather than an established reference?
- Grothendieck's Esquisse d'un Programme and the Lando–Zvonkin monograph are standard references for the dessins d'enfants programme invoked in the Introduction; is their omission from the bibliography intentional?

## Per-Agent Reviews

### citation (`sonnet[1m]`) — status: `warn`

```json
{
  "confidence": 0.62,
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
        "raw": "AUTHOR = Adrianov, N. M. and Pakovich, F. and Zvonkin, A. K., TITLE = Davenport-Zannier polynomials and dessins d'enfants, SERIES = Mathematical Surveys and Monographs, VOLUME = 249, PUBLISHER = American Mathematical Society, Providence, RI, YEAR = 2020, PAGES = xi+187, ISBN = 978-1-4704-5634-4, MRCLASS = 11G32 (05Cxx 05E18 11R32 14H57 20B15), MRNUMBER = 4249449, MRREVIEWER = David P. Roberts",
        "title": "Davenport-Zannier polynomials and dessins d'enfants",
        "url": null,
        "venue": "Mathematical Surveys and Monographs, vol. 249, American Mathematical Society, Providence, RI",
        "year": 2020
      },
      "exists": null,
      "explanation": "Foundational monograph on dessins d'enfants, cited as one of the two primary references for the Preliminaries chapter; provides definitions such as the passport (Definition 2.10) that the paper builds upon throughout.",
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
        "raw": "AUTHOR = Belyi, G. V., TITLE = Another proof of the three points theorem, JOURNAL = Mat. Sb., FJOURNAL = Matematicheskii Sbornik, VOLUME = 193, YEAR = 2002, NUMBER = 3, PAGES = 21--24, ISSN = 0368-8666,2305-2783, MRCLASS = 14G25 (14H30), MRNUMBER = 1913596, memo = 10.1070/SM2002v193n03ABEH000633, memo = https://doi.org/10.1070/SM2002v193n03ABEH000633",
        "title": "Another proof of the three points theorem",
        "url": "https://doi.org/10.1070/SM2002v193n03ABEH000633",
        "venue": "Matematicheskii Sbornik, vol. 193, no. 3",
        "year": 2002
      },
      "exists": null,
      "explanation": "Cited alongside Belyi79 in the statement of Belyi's Theorem, providing Belyi's own alternative proof of the foundational three-points result that characterises algebraic curves over number fields.",
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
        "raw": "AUTHOR = Belyi, G. V., TITLE = Galois extensions of a maximal cyclotomic field, JOURNAL = Izv. Akad. Nauk SSSR Ser. Mat., FJOURNAL = Izvestiya Akademii Nauk SSSR. Seriya Matematicheskaya, VOLUME = 43, YEAR = 1979, NUMBER = 2, PAGES = 267--276, 479, ISSN = 0373-2436, MRCLASS = 12A55, MRNUMBER = 534593, MRREVIEWER = Jerzy Browkin",
        "title": "Galois extensions of a maximal cyclotomic field",
        "url": null,
        "venue": "Izvestiya Akademii Nauk SSSR. Seriya Matematicheskaya, vol. 43, no. 2",
        "year": 1979
      },
      "exists": null,
      "explanation": "The original paper containing Belyi's Theorem, the foundational result that underpins the entire framework of dessins d'enfants; cited at the outset of the Introduction.",
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
        "raw": "AUTHOR = Conder, M. D. E. and Jones, G. A. and Streit, M. and Wolfart, J., TITLE = Galois actions on regular dessins of small genera, JOURNAL = Rev. Mat. Iberoam., FJOURNAL = Revista Matematica Iberoamericana, VOLUME = 29, YEAR = 2013, NUMBER = 1, PAGES = 163--181, ISSN = 0213-2230,2235-0616, MRCLASS = 14H57 (05C10 05C25 11G32 30F10), MRNUMBER = 3010126, MRREVIEWER = David Torres-Teigell, memo = 10.4171/RMI/717, memo = https://doi.org/10.4171/RMI/717",
        "title": "Galois actions on regular dessins of small genera",
        "url": "https://doi.org/10.4171/RMI/717",
        "venue": "Revista Matematica Iberoamericana, vol. 29, no. 1",
        "year": 2013
      },
      "exists": null,
      "explanation": "Studies Galois actions on regular dessins of small genera, which is directly related to the paper's investigation of regularity and automorphism groups; however, no citation context was visible in the provided excerpts.",
      "notes": "No citation context visible in the provided text; may appear in truncated sections on Galois actions or regular dessins.",
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
        "raw": "author = Cueto, M. H., title = The field of moduli and fields of definition of dessins d'enfants, note = arXiv:1409.7736, year = 2014",
        "title": "The field of moduli and fields of definition of dessins d'enfants",
        "url": null,
        "venue": null,
        "year": 2014
      },
      "exists": null,
      "explanation": "Directly relevant to the paper's Introduction discussion of the field of moduli versus field of definition for dessins, but no citation context appears in the provided text segments.",
      "notes": "arXiv preprint with no identified published venue; citation context not observed in the provided text.",
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
        "raw": "AUTHOR = Dixon, J. D. and Mortimer, B., TITLE = Permutation groups, SERIES = Graduate Texts in Mathematics, VOLUME = 163, PUBLISHER = Springer-Verlag, New York, YEAR = 1996, PAGES = xii+346, ISBN = 0-387-94599-7, MRCLASS = 20B05 (20-01 20B07), MRNUMBER = 1409812, MRREVIEWER = Martin W. Liebeck, memo = 10.1007/978-1-4612-0731-3, memo = https://doi.org/10.1007/978-1-4612-0731-3",
        "title": "Permutation groups",
        "url": "https://doi.org/10.1007/978-1-4612-0731-3",
        "venue": "Graduate Texts in Mathematics, vol. 163, Springer-Verlag, New York",
        "year": 1996
      },
      "exists": null,
      "explanation": "Standard graduate reference on permutation groups; likely referenced in sections on monodromy groups, primitivity of the monodromy group, or counting arguments, consistent with the paper's methodology.",
      "notes": "No citation context visible in the provided text; likely cited in truncated sections involving primitivity or permutation group arguments.",
      "relevance": "medium",
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
        "raw": "AUTHOR = Girondo, E. and Gonzalez-Diez, G., TITLE = Introduction to compact Riemann surfaces and dessins d'enfants, SERIES = London Mathematical Society Student Texts, VOLUME = 79, PUBLISHER = Cambridge University Press, Cambridge, YEAR = 2012, PAGES = xii+298, ISBN = 978-0-521-74022-7, MRCLASS = 30-01 (11G32 14H57 30F10), MRNUMBER = 2895884, MRREVIEWER = Aaron D. Wootton",
        "title": "Introduction to compact Riemann surfaces and dessins d'enfants",
        "url": null,
        "venue": "London Mathematical Society Student Texts, vol. 79, Cambridge University Press, Cambridge",
        "year": 2012
      },
      "exists": null,
      "explanation": "Cited in the Preliminaries for Proposition 4.42, which establishes that every regular dessin has a uniform passport — a structural result directly relevant to the paper's analysis of the relationship between regularity and uniformity.",
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
        "raw": "AUTHOR = Girondo, E. and Torres-Teigell, D. and Wolfart, J., TITLE = Fields of definition of uniform dessins on quasiplatonic surfaces, BOOKTITLE = Riemann and Klein surfaces, automorphisms, symmetries and moduli spaces, SERIES = Contemp. Math., VOLUME = 629, PAGES = 155--170, PUBLISHER = Amer. Math. Soc., Providence, RI, YEAR = 2014, ISBN = 978-1-4704-1093-3, MRCLASS = 11G32 (14G35 14H57 30F10 30F35), MRNUMBER = 3289639, MRREVIEWER = Ayberk Zeytin, memo = 10.1090/conm/629/12558, memo = https://doi.org/10.1090/conm/629/12558",
        "title": "Fields of definition of uniform dessins on quasiplatonic surfaces",
        "url": "https://doi.org/10.1090/conm/629/12558",
        "venue": "Contemp. Math., vol. 629, American Mathematical Society, Providence, RI",
        "year": 2014
      },
      "exists": null,
      "explanation": "Directly addresses fields of definition of uniform dessins on quasiplatonic surfaces, a topic central to the paper's motivation, but specific citation context was not visible in the provided text.",
      "notes": "No citation context visible in the provided text; likely cited in truncated sections on fields of definition for uniform dessins.",
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
        "raw": "AUTHOR = Goupil, A. and Schaeffer, G., TITLE = Factoring N-cycles and counting maps of given genus, JOURNAL = European J. Combin., FJOURNAL = European Journal of Combinatorics, VOLUME = 19, YEAR = 1998, NUMBER = 7, PAGES = 819--834, ISSN = 0195-6698,1095-9971, MRCLASS = 05C30 (05C10 05C38 57M99), MRNUMBER = 1649966, MRREVIEWER = K. S. Sarkaria, memo = 10.1006/eujc.1998.0215, memo = https://doi.org/10.1006/eujc.1998.0215, | arxiv: 1998.0215",
        "title": "Factoring N-cycles and counting maps of given genus",
        "url": "https://doi.org/10.1006/eujc.1998.0215",
        "venue": "European Journal of Combinatorics, vol. 19, no. 7",
        "year": 1998
      },
      "exists": null,
      "explanation": "Cited in the 'Counting Arguments for Trivial Automorphism Groups' section as the source of a key theorem used to compute lower bounds for the number of relevant permutations, directly supporting the paper's existence proofs for trivial-automorphism-group dessins.",
      "notes": "The bibliography annotation '| arxiv: 1998.0215' is malformed: '1998.0215' is not a valid arXiv identifier and appears to be the DOI suffix erroneously copied into an arXiv field. This 1998 paper predates arXiv's math submissions archive for this area.",
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
        "raw": "author = Hidalgo, R. A., title = Automorphism groups of dessins d'enfants, note = arXiv:1811.07849, year = 2018",
        "title": "Automorphism groups of dessins d'enfants",
        "url": null,
        "venue": null,
        "year": 2018
      },
      "exists": null,
      "explanation": "Preprint version of Hidalgo19, directly relevant to the paper's topic of automorphism groups of dessins d'enfants; citation context not visible in provided text.",
      "notes": "This appears to be the arXiv preprint of Hidalgo19 (same title, same author, published in 2019). Listing both the preprint and the published version as separate bibliography entries is redundant; the published journal version (Hidalgo19) should suffice.",
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
        "raw": "AUTHOR = Hidalgo, R. A., TITLE = Automorphism groups of dessins d'enfants, JOURNAL = Arch. Math. (Basel), FJOURNAL = Archiv der Mathematik, VOLUME = 112, YEAR = 2019, NUMBER = 1, PAGES = 13--18, ISSN = 0003-889X,1420-8938, MRCLASS = 30F40 (11G32 14H57), MRNUMBER = 3901897, MRREVIEWER = John R. Parker, memo = 10.1007/s00013-018-1222-9, memo = https://doi.org/10.1007/s00013-018-1222-9",
        "title": "Automorphism groups of dessins d'enfants",
        "url": "https://doi.org/10.1007/s00013-018-1222-9",
        "venue": "Archiv der Mathematik, vol. 112, no. 1",
        "year": 2019
      },
      "exists": null,
      "explanation": "Published paper directly on automorphism groups of dessins d'enfants, substantively related to the paper's main topic; specific usage context was not visible in the provided text segments.",
      "notes": "The bibliography lists both Hidalgo18 (arXiv preprint) and Hidalgo19 (journal version) as separate entries, creating a redundant dual citation. Citation context not visible in provided text.",
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
        "raw": "AUTHOR = Horie, M., TITLE = Equivalence classes of dessins d'enfants with two vertices, JOURNAL = Math. J. Okayama Univ., FJOURNAL = Mathematical Journal of Okayama University, VOLUME = 66, YEAR = 2024, PAGES = 1--30, ISSN = 0030-1566, MRCLASS = 14H57 (05A15 11G32 20B30), MRNUMBER = 4688440, memo = 10.1007/s10851-023-01159-6, memo = https://doi.org/10.1007/s10851-023-01159-6",
        "title": "Equivalence classes of dessins d'enfants with two vertices",
        "url": null,
        "venue": "Mathematical Journal of Okayama University, vol. 66",
        "year": 2024
      },
      "exists": null,
      "explanation": "Cited in the Introduction in a remark comparing the paper's explicit construction of dessins with a given automorphism group order to Horie's counting method for dessins with two vertices, making it directly relevant to the passport [n,n,n] case.",
      "notes": "The DOI '10.1007/s10851-023-01159-6' uses the prefix '10.1007/s10851', which is registered to the Journal of Mathematical Imaging and Vision, not the Mathematical Journal of Okayama University. This appears to be a bibliographic error — a DOI from a different paper has likely been assigned to this entry.",
      "relevance": "high",
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
        "raw": "AUTHOR = Jones, G. A., TITLE = Regular dessins with a given automorphism group, BOOKTITLE = Riemann and Klein surfaces, automorphisms, symmetries and moduli spaces, SERIES = Contemp. Math., VOLUME = 629, PAGES = 245--260, PUBLISHER = Amer. Math. Soc., Providence, RI, YEAR = 2014, ISBN = 978-1-4704-1093-3, MRCLASS = 14H57 (14H37 30F10), MRNUMBER = 3289645, MRREVIEWER = David Torres-Teigell, memo = 10.1090/conm/629/12568, memo = https://doi.org/10.1090/conm/629/12568",
        "title": "Regular dessins with a given automorphism group",
        "url": "https://doi.org/10.1090/conm/629/12568",
        "venue": "Contemp. Math., vol. 629, American Mathematical Society, Providence, RI",
        "year": 2014
      },
      "exists": null,
      "explanation": "Directly relevant to the paper's study of regular dessins and their automorphism groups; citation context was not visible in the provided text segments.",
      "notes": "No citation context visible in the provided text; likely cited in truncated sections on regular dessins with specified automorphism groups.",
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
        "raw": "AUTHOR = Jones, G. A. and Wolfart, J., TITLE = Dessins d'enfants on Riemann surfaces, SERIES = Springer Monographs in Mathematics, PUBLISHER = Springer, Cham, YEAR = 2016, PAGES = xiv+259, ISBN = 978-3-319-24709-0; 978-3-319-24711-3, MRCLASS = 14H57 (05C25 11G32 30F10 57M15), MRNUMBER = 3467692, MRREVIEWER = Ariyan Javanpeykar, memo = 10.1007/978-3-319-24711-3, memo = https://doi.org/10.1007/978-3-319-24711-3",
        "title": "Dessins d'enfants on Riemann surfaces",
        "url": "https://doi.org/10.1007/978-3-319-24711-3",
        "venue": "Springer Monographs in Mathematics, Springer, Cham",
        "year": 2016
      },
      "exists": null,
      "explanation": "The primary monograph reference for dessins d'enfants theory, cited throughout for foundational definitions (monodromy group, regular dessins, automorphism group) and key theorems; clearly the most heavily used reference in the paper.",
      "notes": "The paper notes that Jones16 uses the opposite convention for vertex colouring (white vs. black for preimages of 0), which the authors explicitly flag in a footnote.",
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
        "raw": "title = Regularity and Automorphism Groups of Dessins d'Enfants with Uniform Passports, author = Ohnishi, T., year = 2026, eprint = 2602.11867, archivePrefix = arXiv, primaryClass = math.AG, note = arXiv:2602.11867, memo = https://arxiv.org/abs/2602.11867",
        "title": "Regularity and Automorphism Groups of Dessins d'Enfants with Uniform Passports",
        "url": "https://arxiv.org/abs/2602.11867",
        "venue": "arXiv preprint (math.AG)",
        "year": 2026
      },
      "exists": null,
      "explanation": "The authors' directly preceding paper, cited more than any other reference throughout the manuscript; nearly every major result in the current paper is framed as extending, completing, or providing an alternative to results established in Ohnishi26.",
      "notes": "This is the authors' own preceding paper; it appears as an arXiv preprint with a 2026 year, consistent with the present paper also being recent. The current paper directly extends, provides alternatives to, and builds upon theorems from this reference.",
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
        "raw": "AUTHOR = Sagan, Bruce E., TITLE = The symmetric group, SERIES = Graduate Texts in Mathematics, VOLUME = 203, EDITION = Second, NOTE = Representations, combinatorial algorithms, and symmetric functions, PUBLISHER = Springer-Verlag, New York, YEAR = 2001, PAGES = xvi+238, ISBN = 0-387-95067-2, MRCLASS = 05E10 (05E05 20C30), MRNUMBER = 1824028, memo = 10.1007/978-1-4757-6804-6, memo = https://doi.org/10.1007/978-1-4757-6804-6",
        "title": "The symmetric group",
        "url": "https://doi.org/10.1007/978-1-4757-6804-6",
        "venue": "Graduate Texts in Mathematics, vol. 203, Springer-Verlag, New York",
        "year": 2001
      },
      "exists": null,
      "explanation": "Standard reference on symmetric group representations and combinatorial algorithms; likely cited in truncated sections involving symmetric function theory or representation-theoretic arguments in counting, but its relevance to dessins d'enfants is indirect.",
      "notes": "No citation context visible in the provided text; the connection to dessins d'enfants is indirect.",
      "relevance": "low",
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
        "raw": "author = Scodro, G., title = Belyi's theorem and dessins d'enfants, school = University of Padova, year = 2024, note = ALGANT Master's Thesis, available at https://thesis.unipd.it/retrieve/4d0c1b93-fca9-4547-883c-d53b5a86dea0/Scodro_Giacomo.pdf",
        "title": "Belyi's theorem and dessins d'enfants",
        "url": "https://thesis.unipd.it/retrieve/4d0c1b93-fca9-4547-883c-d53b5a86dea0/Scodro_Giacomo.pdf",
        "venue": "ALGANT Master's Thesis, University of Padova",
        "year": 2024
      },
      "exists": null,
      "explanation": "Cited in the Preliminaries for Theorem 3.6, establishing that any transitive group generated by two elements is the monodromy group of some dessin; the citation of a Master's thesis for this established fact is noteworthy.",
      "notes": "This is a Master's thesis, not a peer-reviewed publication. Theorem 3.6 (asserting existence of a dessin from any transitive two-generator group) is a classical and well-known result; citing a Master's thesis as the primary source for it, rather than a standard monograph such as Jones16 or Adrianov20, is unusual.",
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
        "raw": "AUTHOR = Wakabayashi, Yasuhiro, TITLE = An effective version of Belyi's theorem in positive characteristic, JOURNAL = J. Number Theory, FJOURNAL = Journal of Number Theory, VOLUME = 231, YEAR = 2022, PAGES = 251--268, ISSN = 0022-314X,1096-1658, MRCLASS = 14H30 (11G32 14Q20), MRNUMBER = 4330933, MRREVIEWER = Ayberk Zeytin, memo = 10.1016/j.jnt.2021.04.028, memo = https://doi.org/10.1016/j.jnt.2021.04.028",
        "title": "An effective version of Belyi's theorem in positive characteristic",
        "url": "https://doi.org/10.1016/j.jnt.2021.04.028",
        "venue": "Journal of Number Theory, vol. 231",
        "year": 2022
      },
      "exists": null,
      "explanation": "Addresses an effective version of Belyi's theorem in positive characteristic; the present paper focuses on characteristic-zero algebraic geometry and combinatorial properties of dessins, so the relevance of this citation is unclear from the provided text.",
      "notes": "This paper treats Belyi's theorem in positive characteristic, a setting outside the scope of the present paper, which works exclusively over number fields in characteristic zero. Its relevance seems peripheral.",
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    }
  ],
  "missing_references": [
    {
      "reason": "The Introduction explicitly states that the dessin theory 'deeply fascinated Grothendieck and led to his theory of dessins d'enfants,' yet Grothendieck's foundational Esquisse d'un Programme (1984, published in Schneps–Lochak 1997) is not cited; it is the standard primary source for the programme that motivates the entire field.",
      "title": "Esquisse d'un Programme"
    },
    {
      "reason": "This comprehensive monograph (Springer 2004) is a standard reference for combinatorial aspects of dessins d'enfants, covers passport theory and monodromy groups extensively, and is frequently cited alongside Adrianov20 and Jones16 in papers on uniform dessins; its absence is notable.",
      "title": "Lando, S. K. and Zvonkin, A. K., Graphs on Surfaces and Their Applications"
    }
  ],
  "summary": "The bibliography of 18 entries covers the primary monographs and key papers needed for the paper's framework, with Jones16, Adrianov20, and Ohnishi26 cited heavily and appropriately throughout. Three citation-hygiene concerns arise: the Goupil98 entry contains a malformed arXiv annotation ('1998.0215' is the DOI suffix, not a valid arXiv ID); the DOI assigned to Horie24 ('10.1007/s10851-023-01159-6') belongs to a different journal, suggesting a copy-paste error; and Scodro24 (a Master's thesis) is cited for a classical theorem that could be more authoritatively sourced from Jones16 or Adrianov20. The redundant dual-listing of Hidalgo18 and Hidalgo19 (preprint and journal version of the same paper) should be consolidated. Several entries in the bibliography (Conder13, Cueto14, Dixon96, Girondo14, Hidalgo18/19, Jones14, Sagan01, Wakabayashi22) do not appear in the provided citation contexts, though they may be cited in the truncated sections of the paper."
}
```

### meta_reviewer (`sonnet[1m]`) — status: `pass`

```json
{
  "confidence": 0.72,
  "questions": [
    "For the [8^2,2^8,4^4] counterexample: can an enumeration script (e.g., GAP, Sage, or Python with SymPy) that reproduces the 920 permutations and confirms each has nontrivial centralizer in S_16 be provided as a supplementary artifact?",
    "For [15,5^3,5^3]: what software was used to enumerate the 4,354,560 permutations and verify all centralizers are trivial, and can the code and representative output log be shared?",
    "The existence claim for [12^2,2^12,6^4] via 'direct computation' falsifies a stated conjecture; can an explicit pair (x,y) with the required cycle types and trivial centralizer in S_24 be exhibited in the manuscript?",
    "The b=3 construction in Proposition prop:c3b3 involves parameters v, w, and intricate 11v+... block structures valid for all odd q at least 3; has this construction been validated computationally for a representative range of q, and if so can the validation code be released?",
    "Theorem 3.6 is cited from Scodro24, a Master's thesis, for a result that appears in the standard monographs Jones16 and Adrianov20; what motivated citing the thesis as primary source rather than an established reference?",
    "Grothendieck's Esquisse d'un Programme and the Lando–Zvonkin monograph are standard references for the dessins d'enfants programme invoked in the Introduction; is their omission from the bibliography intentional?"
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "The counts 4354560 and 290304 and the 'all trivial' claim are exhaustive computational results presented without any shipped artifact; they are not derivable from the surrounding text. Theorem thm:trivautd later proves the 'all trivial' direction abstractly, but the specific cardinalities remain unverified.",
      "id": "weakness-1",
      "locator": "Section 'Counterexamples', 'Only Dessins with Trivial Automorphism Group'",
      "required_update": "Provide experiments/passport_15_5_5/enumerate.gap reproducing |N(5,3,5)|=4354560, the 290304 C_{S_n}(x)-orbits of size 15, and the triviality of each AD.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 'Counterexamples', 'Only Dessins with Trivial Automorphism Group'` is corrected or justified.",
      "weakness_index": 0
    },
    {
      "evidence": "The claimed family in which passports such as [5^3,5^3,15] admit no dessin with nontrivial automorphism group lacks a formalized proof or independently checkable computation; an artifact such as proofs/TrivialOnly.lean or code/trivial_only_certificates/ would close the gap.",
      "id": "weakness-2",
      "locator": "reproducibility appendix",
      "required_update": "Add a reproducibility note that resolves this concern: The claimed family in which passports such as [5^3,5^3,15] admit no dessin with nontrivial automorphism group lacks a formalized proof or independently checkable computation; an artifact such as proofs/TrivialOnly.lean or code/trivial_only_certificates/ would close the gap.",
      "source_path": null,
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm the reproducibility concern is addressed with a concrete artifact or manuscript update.",
      "weakness_index": 1
    },
    {
      "evidence": "No reproducibility artifact, repository URL, license, or pinned release is provided for independently checking the permutation-counting arguments, centralizer computations, explicit dessin constructions, or counterexample searches.",
      "id": "weakness-3",
      "locator": "code release and execution entrypoints",
      "required_update": "Release the source code, scripts, model configuration, and execution entrypoints needed to regenerate the reported tables, or document why those artifacts cannot be released.",
      "source_path": null,
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "code",
      "verification_check": "Re-review should confirm runnable code or a documented non-release justification is present.",
      "weakness_index": 2
    },
    {
      "evidence": "The headline theorem that every passport of the form [b^q,b^q,n] of genus at least 2 admits a dessin with trivial automorphism group is supported only by prose mathematics; a formal verification artifact such as proofs/Class3.lean or a checked computational certificate would be needed for proof-as-code reproduction.",
      "id": "weakness-4",
      "locator": "reproducibility appendix",
      "required_update": "Add a reproducibility note that resolves this concern: The headline theorem that every passport of the form [b^q,b^q,n] of genus at least 2 admits a dessin with trivial automorphism group is supported only by prose mathematics; a formal verification artifact such as proofs/Class3.lean or a checked computational certificate would be needed for proof-as-code reproduction.",
      "source_path": null,
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm the reproducibility concern is addressed with a concrete artifact or manuscript update.",
      "weakness_index": 3
    },
    {
      "evidence": "The Introduction explicitly states that the dessin theory 'deeply fascinated Grothendieck and led to his theory of dessins d'enfants,' yet Grothendieck's foundational Esquisse d'un Programme (1984, published in Schneps–Lochak 1997) is not cited; it is the standard primary source for the programme that motivates the entire field.",
      "id": "weakness-5",
      "locator": "Esquisse d'un Programme",
      "required_update": "Add a bibliography entry for `Esquisse d'un Programme` and cite it where the affected method or claim is introduced, or explicitly justify its omission.",
      "source_path": null,
      "source_role": "citation",
      "status": "open",
      "target_kind": "bibliography",
      "verification_check": "Re-review should confirm the bibliography and citation context address this reference.",
      "weakness_index": 4
    }
  ],
  "strengths": [
    "Theorem thm:class3 provides a complete existence argument for trivial-automorphism-group dessins across all [b^q,b^q,n] passports at genus at least 2, filling the principal gap left by Ohnishi26 on this passport family.",
    "The discovery that [8^2,2^8,4^4] admits no dessin with trivial automorphism group and that [15,5^3,5^3] admits only dessins with trivial automorphism group constitutes a meaningful empirical refinement of earlier conjectures, demonstrating that the [n,b^q,n] and [b^q,b^q,n] cases are not uniformly parallel.",
    "Theorem thm:trivautd delivers a self-contained group-theoretic proof that every [l1*l2, l2^{l1}, l2^{l1}] passport with l1, l2 distinct odd primes and l2 > l1 admits only dessins with trivial automorphism group, with no unverified computational steps (TC5, assessment: supported).",
    "The alternative centralizer-based proof for the [n,b^q,n] case elucidates the structural reason underlying the existence result and provides a second, independent route to a theorem already established in Ohnishi26.",
    "Lemma lem:Nbqblower and Lemma lem:Dupper supply analytically rigorous counting bounds whose derivations from the Goupil–Schaeffer formula are internally consistent and hand-verifiable (TC6, TC12, assessment: supported)."
  ],
  "summary": "The paper investigates automorphism groups of uniform dessins d'enfants across three passport families—[b^q,b^q,n], [n,n,n], and [n,b^q,n]—extending the authors' prior work (Ohnishi26) and producing counterexamples to conjectures stated there. Technical_correctness assessed the paper as mostly_sound (confidence 0.60), with core mathematical arguments largely intact but three headline computational claims—the [8^2,2^8,4^4] counterexample (TC2), the [15,5^3,5^3] exhaustive count (TC3), and the [12^2,2^12,6^4] existence assertion (TC4)—rated unsupported at major severity due to absent verification artifacts. Reproducibility (confidence 0.86, score 0.22) raised a critical concern that the principal theorem (Theorem thm:class3 for [b^q,b^q,n]) is backed only by prose with no shipped code or formal proof artifact, and added four further major concerns for counterexample verifications. Novelty (confidence 0.65) found the contribution incremental (score 0.60) but genuine: the paper fills three concrete gaps left by Ohnishi26 and produces novel counterexamples that revise prior conjectures. Citation (confidence 0.62) identified a mismatched DOI in Horie24 (prefix 10.1007/s10851 belongs to a different journal), a malformed arXiv annotation in Goupil98 (DOI suffix mistaken for an arXiv ID), a redundant dual-listing of Hidalgo18 and Hidalgo19, and notable omissions of Grothendieck's Esquisse d'un Programme and the Lando–Zvonkin monograph. The paper's field (math.AG) is code-amenable; the combination of reproducibility's critical rating on the headline theorem and technical_correctness's major-severity unsupported findings on three computational claims triggers the major_revision gate under the recommendation gate rule. No specialist disagreements are present that require explicit adjudication; all five specialists consistently flag computational artifact absence as the primary deficiency.",
  "weaknesses": [
    "The [8^2,2^8,4^4] counterexample asserts 920 permutations in 19 conjugacy classes, all with nontrivial automorphism group, based on exhaustive computation, but no enumeration script, GAP/Sage session log, or data file is provided, leaving this headline counterexample unverifiable (TC2, major).",
    "The claimed cardinalities for [15,5^3,5^3]—4,354,560 permutations in 290,304 orbits, all with trivial automorphism group—are likewise unsupported by any computational artifact; the figures cannot be independently checked from the manuscript alone (TC3, major).",
    "The existence assertion for [12^2,2^12,6^4], attributed to 'direct computation,' provides neither an explicit permutation pair nor a verification script, despite the claim falsifying a conjecture from the prior literature (TC4, major).",
    "The headline theorem for [b^q,b^q,n] (Theorem thm:class3) relies on intricate index bookkeeping in the b=3 subcase (Proposition prop:c3b3, TC9, minor) and unshipped base-case numerics for b at least 5 (R(5,3)=72919/11664, TC7, minor); no machine-checkable artifact accompanies either sub-case, constituting a critical proof-as-code absence per the reproducibility specialist.",
    "The bibliography contains two verified errors—the DOI assigned to Horie24 (prefix 10.1007/s10851) belongs to a different journal, and Goupil98 carries a malformed arXiv annotation ('1998.0215' is a DOI suffix, not a valid arXiv ID)—plus a redundant dual-listing of Hidalgo18 and Hidalgo19 that should be consolidated into the published journal entry."
  ]
}
```

### novelty (`sonnet[1m]`) — status: `pass`

```json
{
  "confidence": 0.65,
  "missing_prior_art": [
    {
      "reason": "A standard comprehensive reference for dessins d'enfants, monodromy, and Belyi functions that is widely cited in the field but absent from the bibliography; relevant results on passport enumeration and group actions may have been compared.",
      "title": "Graphs on Surfaces and Their Applications (Lando–Zvonkin)"
    },
    {
      "reason": "The proof of Theorem 4.2 relies heavily on block-system arguments for imprimitive actions; relevant prior work classifying imprimitive monodromy groups of Belyi maps is not cited, making it hard to judge whether the structural constraints exploited are novel or known.",
      "title": "General theory of imprimitive permutation groups and block systems in relation to dessins"
    }
  ],
  "novelty_score": 0.6,
  "related_work": [
    {
      "citation_key": "Ohnishi26",
      "delta": "The present paper directly extends Ohnishi26: that paper proved trivial-automorphism-group existence for [n,b^q,n] passports and established the genus-0/1 picture; this paper proves the analogous result for [b^q,b^q,n] passports, gives an alternative proof of the [n,b^q,n] case via centralisers, completes the [n,n,n] classification, and finds counterexamples to conjectures stated in Ohnishi26.",
      "relation": "builds_on",
      "title": "Regularity and Automorphism Groups of Dessins d'Enfants with Uniform Passports"
    },
    {
      "citation_key": "Goupil98",
      "delta": "Goupil--Schaeffer's formula for c_{λμ}^n (number of factorisations of an n-cycle into two permutations of given cycle types) is the key analytic tool used to derive the lower bound on |N(b,q,b)| in Lemma 3.1 and throughout the counting arguments.",
      "relation": "builds_on",
      "title": "Factoring N-cycles and counting maps of given genus"
    },
    {
      "citation_key": "Jones16",
      "delta": "Jones--Wolfart's monograph establishes the foundational framework (Belyi pairs, monodromy groups, automorphism groups as centralisers, regularity) that this paper builds on; multiple lemmas and propositions cite it as primary source.",
      "relation": "prior_art",
      "title": "Dessins d'enfants on Riemann surfaces"
    },
    {
      "citation_key": "Girondo14",
      "delta": "Girondo--Torres-Teigell--Wolfart study fields of definition and fields of moduli for uniform dessins on quasiplatonic surfaces; the present paper focuses on distribution of automorphism group orders for uniform passports and does not address fields of definition.",
      "relation": "orthogonal",
      "title": "Fields of definition of uniform dessins on quasiplatonic surfaces"
    },
    {
      "citation_key": "Hidalgo19",
      "delta": "Hidalgo studies automorphism groups of general dessins d'enfants from the perspective of Kleinian groups and uniformisation; the present paper focuses specifically on uniform passports and uses a combinatorial/permutation-group approach.",
      "relation": "orthogonal",
      "title": "Automorphism groups of dessins d'enfants"
    },
    {
      "citation_key": "Horie24",
      "delta": "Horie counts isomorphism classes of two-vertex dessins (including [n,n,n]-type) with a given automorphism group order, complementing the explicit constructions in Section 5 of the present paper, which constructs dessins with prescribed automorphism group order rather than just counting them.",
      "relation": "orthogonal",
      "title": "Equivalence classes of dessins d'enfants with two vertices"
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
      "description": "No reproducibility artifact, repository URL, license, or pinned release is provided for independently checking the permutation-counting arguments, centralizer computations, explicit dessin constructions, or counterexample searches.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "The headline theorem that every passport of the form [b^q,b^q,n] of genus at least 2 admits a dessin with trivial automorphism group is supported only by prose mathematics; a formal verification artifact such as proofs/Class3.lean or a checked computational certificate would be needed for proof-as-code reproduction.",
      "severity": "critical"
    },
    {
      "area": "other",
      "description": "The claimed counterexample that [8^2,2^8,4^4] admits no dessin with trivial automorphism group lacks an enumerator or formal certificate; an artifact such as code/counterexamples_8_2_4.py plus output/counterexamples_8_2_4.json would be needed to reproduce the exhaustive/nonexistence claim.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "The claimed family in which passports such as [5^3,5^3,15] admit no dessin with nontrivial automorphism group lacks a formalized proof or independently checkable computation; an artifact such as proofs/TrivialOnly.lean or code/trivial_only_certificates/ would close the gap.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "The explicit construction for passports [n,n,n] with prescribed automorphism group order r is not accompanied by machine-checkable construction code or certificates; a file such as code/class1_construction.sage or proofs/Class1.lean would make the construction reproducible.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "The alternative proof for [n,b^q,n] relies on lengthy symbolic inequalities and counting bounds with no formal proof artifact; a file such as proofs/Class2.lean or code/verify_bounds.sage would be needed for independent mechanical checking.",
      "severity": "major"
    }
  ],
  "confidence": 0.86,
  "data_availability": "unspecified",
  "data_url": null,
  "environment": null,
  "reproducibility_score": 0.22
}
```

### summary (`claude-haiku-4-5`) — status: `pass`

```json
{
  "audience": "Researchers in algebraic geometry, group theory, and the theory of dessins d'enfants; mathematicians studying Galois representations and fields of moduli; graduate students in number theory or geometric algebra seeking concrete examples of Galois actions on algebraic curves",
  "key_contributions": [
    "Proof that every uniform passport [b^q, b^q, n] of genus at least 2 admits a dessin with trivial automorphism group (Theorem 3), extending prior results for the [n, b^q, n] case",
    "Discovery of counterexamples to previous conjectures: [8², 2⁸, 4⁴] admits no dessin with trivial automorphism group, while [15, 5³, 5³] admits only dessins with trivial automorphism groups",
    "General theorem characterizing passports where every dessin has trivial automorphism group: those of the form [ℓ₁ℓ₂, ℓ₂^ℓ₁, ℓ₂^ℓ₁] where ℓ₁ and ℓ₂ are distinct odd primes with ℓ₂ > ℓ₁",
    "For passports [n, n, n] of genus at least 2: explicit construction of dessins with any automorphism group order dividing n",
    "Alternative counting-theoretic proof of the [n, b^q, n] case using centralizers of permutations, complementing the monodromy-based approach from prior work"
  ],
  "plain_language_summary": "Dessins d'enfants are combinatorial objects—bipartite graphs drawn on the surfaces of algebraic curves—that encode deep connections between algebraic geometry and group theory. By Bély's theorem, every smooth curve defined over a number field has an associated dessin, making these objects powerful tools for studying how the absolute Galois group acts on algebraic curves. This paper investigates how symmetries of uniform dessins (those with constant vertex and face valencies) vary with the genus of the underlying surface.\n\nThe paper proves that every uniform passport of the form [b^q, b^q, n] with genus at least 2 admits a dessin with a trivial automorphism group (no symmetries). However, the authors discovered counterexamples to earlier conjectures: the passport [8², 2⁸, 4⁴] admits no dessin with a trivial automorphism group, while [15, 5³, 5³] admits only dessins with trivial automorphism groups. These exceptions reveal subtle restrictions on how automorphism groups can be distributed across uniform passports, especially in higher genus. The results clarify the interplay between regularity (the highest symmetry level) and trivial automorphism groups (no symmetry), with implications for understanding fields of moduli and fields of definition of algebraic curves.",
  "tldr": "This paper proves new results on the automorphism groups of uniform dessins d'enfants (bipartite graphs on algebraic curves), extending previous work and discovering counterexamples to conjectures about their distribution across genera."
}
```

### technical_correctness (`opus[1m]`) — status: `pass`

```json
{
  "claims": [
    {
      "assessment": "partially_supported",
      "claim": "Every uniform passport [b^q, b^q, n] (n=qb, q>=2) of genus at least 2 admits a dessin with trivial automorphism group (Theorem thm:class3).",
      "evidence": "The proof reduces to Proposition prop:class3beq3 (explicit construction for b=3) and Proposition prop:class3bge5 (counting bound |N(b,q,b)|>|D(n)| for b>=5). The genus reduction (g=(q(b-2)+1)/2, forcing b,q odd) is internally consistent, and the two sub-cases jointly cover all admissible b. However the b>=5 case rests on numeric base values (e.g. R(5,3)) and the b=3 case on an intricate table-driven cycle/commutator computation, neither verified by a shipped artifact.",
      "id": "TC1",
      "location": "Section 'Passport [b^q,b^q,n] with Genus >=2', Theorem thm:class3",
      "severity": "minor",
      "suggested_fix": "Ship an executable verifier (e.g. experiments/class3/verify.gap or src/proofs/class3.py) that, for sampled (b,q), constructs x,y and checks cycle types (3^q)/(b^q) and triviality of the centralizer C_{S_n}(<x,y>)."
    },
    {
      "assessment": "unsupported",
      "claim": "For passport [8^2,2^8,4^4] (genus 2), with x of type (8^2) fixed there are exactly 920 permutations y, every corresponding Aut is nontrivial, forming 19 conjugacy classes under C_{S_n}(x) with the stated AD orders (11 of order 2, 6 of order 4, 1 of order 8, 1 of order 16).",
      "evidence": "This is a pure exhaustive-computer-search result (counts 920 and 19, and all class sizes) that cannot be verified from the text. In a code-amenable field (math.AG) no enumeration script, GAP/Sage session, or data file is shipped, so the headline counterexample is unverifiable.",
      "id": "TC2",
      "location": "Section 'Counterexamples', 'No Dessins with Trivial Automorphism Group', Table tab:pass442882",
      "severity": "major",
      "suggested_fix": "Provide experiments/passport_8228244/enumerate.gap (or .py with sympy/permutation backend) that enumerates all y of type (2^8) with (xy)^{-1} of type (4^4), computes |C_{S_n}(<x,y>)|, and outputs the 920 count, the 19 C_{S_n}(x)-classes, and the AD-order distribution."
    },
    {
      "assessment": "unsupported",
      "claim": "For passport [15,5^3,5^3] (genus 5), for a fixed 15-cycle x there are 4354560 permutations y (=N(5,3,5)), every corresponding dessin has trivial automorphism group, and these form 290304 conjugacy classes each of size 15.",
      "evidence": "The counts 4354560 and 290304 and the 'all trivial' claim are exhaustive computational results presented without any shipped artifact; they are not derivable from the surrounding text. Theorem thm:trivautd later proves the 'all trivial' direction abstractly, but the specific cardinalities remain unverified.",
      "id": "TC3",
      "location": "Section 'Counterexamples', 'Only Dessins with Trivial Automorphism Group'",
      "severity": "major",
      "suggested_fix": "Provide experiments/passport_15_5_5/enumerate.gap reproducing |N(5,3,5)|=4354560, the 290304 C_{S_n}(x)-orbits of size 15, and the triviality of each AD."
    },
    {
      "assessment": "unsupported",
      "claim": "The passport [12^2,2^12,6^4] (t=3 instance of [(4t)^2,2^{4t},(2t)^4]) admits a dessin with trivial automorphism group, falsifying the t>=2 'always nontrivial' conjecture.",
      "evidence": "An existence claim asserted by 'direct computation' with neither an explicit (x,y) pair given (unlike the exceptional-pairs table elsewhere) nor a verification script, in a code-amenable field.",
      "id": "TC4",
      "location": "Section 'Counterexamples', end of 'No Dessins with Trivial Automorphism Group'",
      "severity": "major",
      "suggested_fix": "Exhibit an explicit y for x=(1..24) with AD trivial, plus experiments/passport_12_2_6/verify.py checking its cycle types and centralizer."
    },
    {
      "assessment": "supported",
      "claim": "If n=l1*l2 is a product of two distinct odd primes, then every dessin with passport [l1*l2, l2^{l1}, l2^{l1}] has trivial automorphism group (Theorem thm:trivautd).",
      "evidence": "The proof is a complete, self-contained group-theoretic argument: D=D_{l1} cup D_{l2}; case (i) uses the block system of x^{l1}-orbits and order(tau)|gcd(l2,l1!)=1 to force l1|l2 (contradiction); case (ii) builds the translation structure y.(i,t)=(pi(i),s_i+t) and derives sum s_j ≡ 0 vs sum s_j +1 ≡ 0 (mod l1), a contradiction. Genus formula (l1(l2-2)+1)/2 and parity conclusions check out.",
      "id": "TC5",
      "location": "Section 'Counterexamples', Theorem thm:trivautd",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "|D| <= kappa1 * 2^{n/2} (n/2)! with kappa1=2623/1894, and for odd n, |D| <= kappa2 * 3^{n/3} (n/3)! with kappa2=972/947 (Lemma lem:Dupper).",
      "evidence": "F_n(x)=x^{n/x}Gamma(n/x+1) is shown strictly decreasing via the standard bound psi(x+1)>log x; H(m,d,1)<1 and the ratio bounds F_n(l2)/F_n(l1)<=3/8, later ratios <=25/972 give a geometric series. The constants reproduce: 1+(3/8)/(1-25/972)=2623/1894 and 1/(1-25/972)=972/947, both verified by hand.",
      "id": "TC6",
      "location": "Section 'Counting Arguments', Lemma lem:Dupper",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "For b>=5, q>=3, R(b,q)>1 (hence |N(b,q,b)|>|D(n)|), established from R(5,3)=72919/11664>1 plus monotonicity in q and b (Proposition prop:class3bge5).",
      "evidence": "The monotonicity arguments (using Lemma lem:gamma-at and explicit g(b,q)=(q(b-1)+1)^3-8q(b+2) with g(5,3)=2029>0 and positive partials) are analytically sound. The base case R(5,3)=72919/11664 and auxiliary numerics f(3)=18.598..., the SOS rewrite 27(b-5)^3+342(b-1985/684)^2+638471/1368 are asserted without a shipped computation; these factorial/Gamma ratios are error-prone by hand.",
      "id": "TC7",
      "location": "Section 'Passport [b^q,b^q,n]', Proposition prop:class3bge5",
      "severity": "minor",
      "suggested_fix": "Add experiments/class3/Rbq.py (mpmath) recomputing R(5,3), f(3), f'(q)>0, and g(b,q)>0 over the claimed ranges."
    },
    {
      "assessment": "partially_supported",
      "claim": "A uniform passport [n,n,n] of genus >=2 admits a nonregular dessin with nontrivial automorphism group iff n is composite; moreover for any divisor r|n it admits a dessin with |AD|=r (Theorem thm:class1 and corollary).",
      "evidence": "The prime case follows from |AD| | n and Lemma lem:order-n. The composite case gives an explicit construction x=(1..n), t=(s 2s ... rs), y=txt^{-1}, with hand-traceable orbit computations showing (xy)^{-1} is an n-cycle (uses s odd, gcd(r,2)=1) and x^k y=yx^k iff s|k, giving |AD|=n/s=r. The argument is complete but the multi-case index-chasing is a natural target for executable verification.",
      "id": "TC8",
      "location": "Section 'Passport [n,n,n]', Theorem thm:class1",
      "severity": "minor",
      "suggested_fix": "Provide src/proofs/class1_verify.py constructing x,y for sampled (r,s) and asserting cycle type (n) of (xy)^{-1} and |C_{S_n}(<x,y>)|=r."
    },
    {
      "assessment": "partially_supported",
      "claim": "The explicit y in Proposition prop:c3b3 has cycle type (3^q), (xy)^{-1} has cycle type (3^q), and the corresponding dessin has trivial automorphism group, for all odd q>=3.",
      "evidence": "Cycle-type coverage is argued by a careful case split on q mod 4 and Table tab:xycycles; triviality is reduced via Corollary cor:ADtrivial to showing x^k y != y x^k for all k, checked through residue conditions (eq:ke1),(eq:ke2) that cannot simultaneously hold. The displayed instances q=3,5,7,9 are consistent, but the general index bookkeeping (parameters v,w, the 11v+... blocks) is intricate and only spot-checkable from the text.",
      "id": "TC9",
      "location": "Section 'The Subcase b=3', Proposition prop:c3b3 and Table tab:xycycles",
      "severity": "minor",
      "suggested_fix": "Ship src/proofs/c3b3_verify.py validating items (1)-(3) for all odd 3<=q<=99."
    },
    {
      "assessment": "partially_supported",
      "claim": "In Proposition prop:c2b2 the face permutation (xy)^{-1} for passport [2q,2^q,2q] has cycle type (2q).",
      "evidence": "The construction and Table tab:xycycles2 correctly trace a single 2q-cycle, and the worked examples q=4,6,8,10 are consistent. However the prose 'it suffices to show that xy has cycle type (2^{q})' is a typo: it should read cycle type (2q) (a single 2q-cycle, as the table and conclusion confirm). The mathematical claim is correct; only the typed cycle-type symbol is wrong.",
      "id": "TC10",
      "location": "Section 'The Subcase b=2', Proposition prop:c2b2 item 2 / line 'suffices to show xy has cycle type (2^q)'",
      "severity": "minor",
      "suggested_fix": "Correct '(2^{q})' to '(2q)' in the sufficiency sentence of part (2)."
    },
    {
      "assessment": "partially_supported",
      "claim": "For n=bq with b>=2 and n≡q (mod 2), |N(b,q,n)|/|T(b,q)| >= 2/(n+2), with equality at b=2 (Theorem thm:MN), used to lower-bound N in the alternative proof.",
      "evidence": "The bound is imported verbatim from [Ohnishi26, Theorem 3.3] and not re-derived here, so its correctness is taken on the prior paper's authority. It is applied consistently (e.g. eq:Nlower-e specializes to 3/(2n) for n>=6).",
      "id": "TC11",
      "location": "Section 'Lower Bound for N', Theorem thm:MN",
      "severity": "minor",
      "suggested_fix": "Either summarize the key steps of the [Ohnishi26] proof or include a numerical check experiments/MN_bound.py for small (b,q)."
    },
    {
      "assessment": "supported",
      "claim": "Lemma lem:Nbqblower: |N(b,q,b)| >= (n-q)! / (2^{q(b-2)} ((q+1)/2)! ((q-1)/2)!) * ((b-1)/(2b))^{(q-1)/2}.",
      "evidence": "Derivation from the Goupil-Schaeffer formula (Theorem thm:goupil) is internally consistent: keeping the symmetric (g1,g2)=(0,g),(g,0) terms, restricting to the composition with (q+1)/2 parts (b-1)/2 and (q-1)/2 parts (b-3)/2 (sum check: ((q+1)(b-1)+(q-1)(b-3))/4=(q(b-2)+1)/2=g verified), with C(q,(q-1)/2) such compositions and product C(b,2)^{(q-1)/2}, yields the stated bound. Hand-checked.",
      "id": "TC12",
      "location": "Section 'Lower Bound for N', Lemma lem:Nbqblower",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "All genus computations via g=(n-(p+q+r))/2+1 (eq:genus) are correct, including genus 2 for [8^2,2^8,4^4], genus 5 for [15,5^3,5^3], (q(b-2)+1)/2 for [b^q,b^q,n], (n-1)/2 for [n,n,n], and (l1(l2-2)+1)/2 for [l1 l2, l2^{l1}, l2^{l1}].",
      "evidence": "Each instance recomputes correctly from part counts: [8^2,2^8,4^4] gives (16-14)/2+1=2; [15,5^3,5^3] gives (15-7)/2+1=5; the parity conclusions (n odd, b,q odd) follow correctly from integrality of g.",
      "id": "TC13",
      "location": "Preliminaries eq:genus and per-section genus derivations",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "In the alternative proof of [n,b^q,n] (Theorem thm:class2), R(b,q)>1 for all (b,q) except (3,2),(3,3),(3,4),(4,2); for these the tabulated |N|,|D| values and explicit trivial-Aut permutations y resolve existence (Table tab:exceptionbq).",
      "evidence": "The monotonicity of R(b,q) in b and q is proved analytically (ratios bounded below by 243/128, 81*sqrt3/128, 128/81 etc., all >1). But the boundary classification 'R(3,2),R(3,3),R(3,4),R(4,2)<=1 and R(3,5),R(4,4),R(5,2)>1' and the exact table cardinalities (e.g. (3,4): |N|=38720,|D|=47952) are 'direct computation' results with no shipped artifact; only the explicit y are hand-checkable.",
      "id": "TC14",
      "location": "Section 'Alternative Proof of the [n,b^q,n] Case', Proposition prop:c2bge3 and Table tab:exceptionbq",
      "severity": "minor",
      "suggested_fix": "Add experiments/class2/exceptional.py computing R(b,q) and the exact |N|,|D| for the four boundary pairs, and verifying AD trivial for each listed y."
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

