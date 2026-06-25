# The Goncharov Lie coalgebra of a field

GrokRxiv review of [arXiv:2606.23863](https://arxiv.org/abs/2606.23863) · `math.KT`

_Authors_: Alexander Kupers, Daniil Rudenko, Ismael Sierra

## TL;DR

The paper introduces the Goncharov Lie coalgebra of a field F as the critical-line entries of the E∞-homology of BGL(F)_Q, presents it via correlators with an explicit Lie cobracket formula, identifies G_n(F) with classical objects for n≤3, constructs motivic and Hodge realisation functors, and proves K₄⁽³⁾(F)_Q ≅ H²(G(F))₃ for all fields. All five specialists concur that the mathematical programme is coherent, the contributions are significant (novelty score 0.78, verdict 'significant'), and the overall technical posture is 'mostly_sound'. The central disagreement is between the novelty and summary specialists, who assess the scope positively, and the reproducibility and technical-correctness specialists, who flag serious gaps in verifiable artifacts. These gaps are not in tension: the mathematics may be correct while still being unverifiable. Two technical-correctness items are marked 'unsupported' at severity 'major' (TC-12, TC-13), both arising from missing computational artifacts rather than identified mathematical errors. Reproducibility flags four 'critical' concerns: no public code, no machine-checkable proof of the headline presentation (Lean or equivalent), no machine-checkable proof of the cobracket identities, and no machine-checkable proof of the weight-3 K-theory isomorphism. The paper explicitly acknowledges computer-assisted computation in Section 7.3.3 (Acknowledgments credit Steven Charlton) but publishes no artifact. This combination — math.KT field, critical/major missing proof-as-code artifacts for headline claims, computer-assisted results without published scripts — triggers the recommendation gate: major_revision is required. Beyond reproducibility, the introduction delegates the entire Rognes rank spectral sequence argument to Theorem 150 in the body without even a pointer-annotated sketch, making the logical chain from definitions to Theorem 1 opaque. Bibliography issues are minor: the CMRR/CMRR24 duplicate should be resolved, the BPW second-author spelling should be verified against MathSciNet MR4798648, and the original Zagier (1991) conjecture paper and Milnor (1970) paper may be absent despite being foundational to the paper's central motivation.

_Recommendation_: **Major revision** · _Confidence_: 78%

## Strengths

- The Goncharov Lie coalgebra is given a complete presentation via correlators with explicit cobracket formulas, resolving a problem that had been open in the motivic cohomology literature for decades.
- The proof of K₄⁽³⁾(F)_Q ≅ H²(G(F))₃ for all fields independently confirms Bolbachan's [Bol24] result via a different spectral-sequence method, with the alternative proof providing a meaningful cross-check.
- The unified framework connecting E∞-homology, Steinberg modules, Koszul duality of Arnold algebras, and multiple polylogarithms is conceptually powerful and provides a clear roadmap for the stated sequel (KRS2).
- The identifications G_n(F) ≅ F^×_Q (n=1), B_2(F)_Q (n=2), and B_3(F)_Q (n=3) ground the abstract construction in concrete, independently understood algebraic objects, enabling immediate comparison with classical results of Suslin, Bloch, and Goncharov.
- Motivic and Hodge realisation functors from Comod^fd_{G(F)} are constructed explicitly, connecting the abstract Lie coalgebra to geometric and analytic structures and establishing the factorisation G(F) → L^f(F) → L^MTM(F).

## Weaknesses

- Section 7.3.3 relies on computer-assisted computations credited to Steven Charlton in the Acknowledgments, but no Sage worksheet, Mathematica notebook, or script is published, making the load-bearing n=3 identification G_3(F) ≅ B_3(F) in Theorem polyl-identification unverifiable by readers.
- The explicit decomposition operator D^FC_h and its key properties — that the only relations among h-normalized correlators are shuffle relations, and that the resulting cobracket satisfies co-Jacobi — lack any machine-checkable verification despite being directly amenable to symbolic computation for small n.
- The Rognes rank spectral sequence argument underpinning Theorem 1 is entirely bundled into Theorem 150 in the body with no pointer-annotated sketch in the introduction, leaving the logical chain from the slope-2 vanishing line and duality eigenspace decomposition to the stated K-theory isomorphisms opaque.
- A key categorical foundation (Blans-Blom-Kupers, 'Naturality of ∞-categorical bar-cobar duality') is cited as a paper in preparation by a co-author; the results it supplies are inaccessible to referees and readers and cannot be independently verified.
- The bibliography lists CMRR and CMRR24 as separate entries for the same paper at preprint and journal stages respectively; these should be consolidated, and the preprint entry should at minimum include its arXiv identifier, while the BPW second-author name ('K. I. Pitman') should be verified against MathSciNet MR4798648 for a potential transcription error ('K. I. Piterman').
- Milnor K-theory K^M_n(F) and Zagier's original 1991 conjecture paper appear to be absent from the visible bibliography despite being invoked from the abstract onward; the Matsumoto-Milnor result is attributed only through Suslin [Sus84] without a primary source.

## Revision Targets

- [ ] **Manuscript: Section 7.3.3 (referenced in Acknowledgments), supports Theorem polyl-identification at n=3**
  - Location: `Section 7.3.3 (referenced in Acknowledgments), supports Theorem polyl-identification at n=3`
  - Evidence: The Acknowledgments explicitly state: 'We would like to thank Steven Charlton for helping us to establish the results of Section 7.3.3 with computer-assisted methods.' This is a direct admission that the proof relies on computational verification, but the paper does not publish, link, or describe the verification artifact. The reader cannot reproduce or audit the computer-assisted step. Per the Proof-as-Code Axiom for math.KT, this is exactly the situation where a verifiable artifact is mandatory.
  - Required change: Publish the computer-assisted verification as a reproducible artifact (Sage worksheet, Mathematica notebook, or Python/Julia script) at code/trilogarithm_section_7_3_3/ and reference it from Section 7.3.3 of the paper with a DOI or a Zenodo/GitHub link. Include the input relations, the search procedure, and the output certificate.
  - Verification: Re-review should confirm `Section 7.3.3 (referenced in Acknowledgments), supports Theorem polyl-identification at n=3` is corrected or justified.
- [ ] **Manuscript: Theorem polyl-presentation-additive, Section 1.3 (Steinberg module presentation); proven via ...**
  - Location: `Theorem polyl-presentation-additive, Section 1.3 (Steinberg module presentation); proven via the projective resolution in Section 1.3.1 (and full proof in Sections 2–4 of the body).`
  - Evidence: The argument is outlined: (a) identify G_n(F) with H_1(GL_n(F); St^∞_n(F)) using GKRW20 equation (eqn:he1-st-heinfty-stl); (b) build a projective resolution of St^∞ in terms of FC and decomposition operators (eqn:dec-resolution); (c) take coinvariants and read off generators/relations. Step (a) is cited to GKRW20 [§6]; the user-supplied excerpt does not re-derive it. Step (b) hinges on the 'almost basis' claim attributed to [CharltonRadchenkoRudenko §3.9] together with the assertion that the only relations among normalized correlators with fixed h are the shuffle relations — this is asserted but not proved in the introduction excerpt. The combinatorial set T(n) and sign function (Proposition 26) are deferred to the body.
  - Required change: Provide, in the introduction or an appendix, the explicit verification that the differentials in (eqn:dec-resolution) square to zero and that the complex is acyclic in positive degrees (only its 0-th homology is St^∞). Cite a precise lemma in [CharltonRadchenkoRudenko] for the 'shuffle is the only relation among h-normalized correlators' claim, since this is load-bearing for the resolution.
  - Verification: Re-review should confirm `Theorem polyl-presentation-additive, Section 1.3 (Steinberg module presentation); proven via the projective resolution in Section 1.3.1 (and full proof in Sections 2–4 of the body).` is corrected or justified.
- [ ] **Manuscript: Theorem 1, item (i), Section 1.1.3 / 1.4**
  - Location: `Theorem 1, item (i), Section 1.1.3 / 1.4`
  - Evidence: The introduction derives this from the Rognes rank spectral sequence by taking the (-1)-eigenspace of duality on the E^2-page in row d=4, after discarding the Milnor K-theory contribution (Section 1.4). The argument is sketched and relies on (a) the slope-2 vanishing line of GKRW20 [cited], (b) the Koszul-duality identification G(F) = H_1(GL_n(F); St^∞_n(F)), (c) the duality involution acting by (-1)^n on G_n(F) (Theorem 145, deferred to body), and (d) the omnibus rank-SS analysis of Theorem 150. None of (a)–(d) are reproven in the introduction; the proof is delegated to Sections 5–8 of the paper, which are not included in the bounded context provided here. The argument is plausible and consistent with the cited results (and with [Bol24], whose alternative proof the authors cite as an instance).
  - Required change: In the introduction, explicitly state which lemmas/theorems of the body are invoked at each step of the sketch (vanishing line, duality eigenspace decomposition, discarding K^M_3, identification of E^2_{1,4}) so a reader can audit the chain without scanning the entire 4000-line paper. Verify the E^2-page diagrams (Figures 5–6) against the cited entries (Theorem 150) and tag them in the body.
  - Verification: Re-review should confirm `Theorem 1, item (i), Section 1.1.3 / 1.4` is corrected or justified.
- [ ] **Bibliography: BlansBlomKupers**
  - Location: bibliography entry: `BlansBlomKupers`
  - Evidence: Paper in preparation by one of the present paper's authors (A. Kupers). The results it supplies cannot be independently verified or accessed by readers; standard practice for self-citation of in-progress work.
  - Required change: Verify `BlansBlomKupers` against an authoritative source; replace it with a resolvable relevant citation or remove it.
  - Verification: Re-review should confirm the citation resolves and is relevant.
- [ ] **Bibliography: Milnor, Algebraic K-theory and quadratic forms (1970)**
  - Location: bibliography entry: `Milnor, Algebraic K-theory and quadratic forms (1970)`
  - Evidence: Milnor K-theory K^M_n(F) is a central concept throughout the paper—invoked in the abstract, repeatedly in the introduction, and in the statement of Theorem 1—yet no citation to Milnor's 1970 Inventiones paper introducing it appears in any visible citation context. The foundational result that K_n^(n)(F)_Q equals rationalised Milnor K-theory is attributed only via Suslin [@Sus84], and the 'Matsumoto--Milnor' result is mentioned without a primary source. With 90 bibliography entries omitted from this prompt the reference may be present, but its absence from visible contexts is notable for a paper whose main theorem is framed as a generalisation of the Matsumoto-Milnor computation.
  - Required change: Add a bibliography entry for `Milnor, Algebraic K-theory and quadratic forms (1970)` and cite it where the affected method or claim is introduced, or explicitly justify its omission.
  - Verification: Re-review should confirm the bibliography and citation context address this reference.
- [ ] **Bibliography: Milnor, Algebraic K-theory and quadratic forms (1970)**
  - Location: bibliography entry: `Milnor, Algebraic K-theory and quadratic forms (1970)`
  - Evidence: Milnor K-theory K^M_n(F) is a central concept throughout the paper—invoked in the abstract, repeatedly in the introduction, and in the statement of Theorem 1—yet no citation to Milnor's 1970 Inventiones paper introducing it appears in any visible citation context. The foundational result that K_n^(n)(F)_Q equals rationalised Milnor K-theory is attributed only via Suslin [@Sus84], and the 'Matsumoto--Milnor' result is mentioned without a primary source. With 90 bibliography entries omitted from this prompt the reference may be present, but its absence from visible contexts is notable for a paper whose main theorem is framed as a generalisation of the Matsumoto-Milnor computation.
  - Required change: Add a bibliography entry for `Milnor, Algebraic K-theory and quadratic forms (1970)` and cite it where the affected method or claim is introduced, or explicitly justify its omission.
  - Verification: Re-review should confirm the bibliography and citation context address this reference.

## Open Questions

- Can the authors publish the computer-assisted computations from Section 7.3.3 as a reproducible artifact (Sage worksheet, Mathematica notebook, or Python script) with a DOI-linked Zenodo or GitHub repository referenced from that section?
- What is the current status of Blans-Blom-Kupers (in preparation), and can the specific results it provides be stated and proved as a self-contained lemma or appendix in the present paper to remove the dependency?
- For the decomposition operator D^FC_h, can a self-contained proof or computer-verified certificate of co-Jacobi for the cobracket be provided for at least the n=2 and n=3 cases, ideally as a symbolic computation accompanying the paper?
- Is the original Milnor (1970) paper 'Algebraic K-theory and quadratic forms' present in the bibliography? Its absence from all visible citation contexts is notable given that Milnor K-theory is invoked from the abstract through the proof of Theorem 1.
- Can the introduction be augmented with explicit theorem numbers from the body at each step of the Rognes spectral sequence argument (slope-2 vanishing, duality eigenspace decomposition, discarding K^M contributions, E²-page identification) so that the derivation of Theorem 1 can be audited without traversing the full paper?

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
          "A. Alekseev",
          "N. Kawazumi",
          "Y. Kuno",
          "F. Naef"
        ],
        "doi": null,
        "key": "AKKN",
        "raw": "A. Alekseev, N. Kawazumi, Y. Kuno, and F. Naef, \\emph{The {G}oldman-{T}uraev {L}ie bialgebra in genus zero and the {K}ashiwara-{V}ergne problem}, Adv. Math. 326 (2018), 1--53. \\MR{3758425}",
        "title": "The Goldman-Turaev Lie bialgebra in genus zero and the Kashiwara-Vergne problem",
        "url": null,
        "venue": "Advances in Mathematics",
        "year": 2018
      },
      "exists": null,
      "explanation": "Cited in the higher-apartments section for the tangential-derivation framework and tree algebras used to build the commutative higher apartments. The paper's approach to special derivations is imported to identify the higher apartments with representations of Arnold algebras.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2404.13776",
        "authors": [
          "A. Ash",
          "J. Miller",
          "P. Patzt"
        ],
        "doi": null,
        "key": "AMP",
        "raw": "A. Ash, J. Miller, and P. Patzt, \\emph{Hopf algebras, {S}teinberg modules, and the unstable cohomology of ${SL}_n(\\mathbb{Z})$ and ${GL}_n(\\mathbb{Z})$}, 2024, arXiv:2404.13776.",
        "title": "Hopf algebras, Steinberg modules, and the unstable cohomology of SL_n(Z) and GL_n(Z)",
        "url": null,
        "venue": null,
        "year": 2024
      },
      "exists": null,
      "explanation": "Cited alongside BCGP in the introduction for developing similar Hopf-algebraic structures on Steinberg modules, and again in the Steinberg-modules section for product and coproduct formulas. Provides parallel work whose algebraic structures resemble those introduced here.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "M. Aguiar",
          "S. Mahajan"
        ],
        "doi": null,
        "key": "AguiarMahajan",
        "raw": "M. Aguiar and S. Mahajan, \\emph{Monoidal functors, species and {H}opf algebras}, CRM Monograph Series, vol. 29, American Mathematical Society, Providence, RI, 2010. \\MR{2724388}",
        "title": "Monoidal functors, species and Hopf algebras",
        "url": null,
        "venue": "CRM Monograph Series, vol. 29, American Mathematical Society",
        "year": 2010
      },
      "exists": null,
      "explanation": "Used in the E∞-algebraic and operadic foundations sections for the theory of monoidal functors and Day convolution, which underlie the symmetric monoidal structures on functor categories employed throughout the paper.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "A. Alekseev",
          "C. Torossian"
        ],
        "doi": null,
        "key": "AlekseevTorossian",
        "raw": "\\bysame, \\emph{The {K}ashiwara-{V}ergne conjecture and {D}rinfeld's associators}, Ann. of Math. (2) 175 (2012), no. 2, 415--463. \\MR{2877064}",
        "title": "The Kashiwara-Vergne conjecture and Drinfeld's associators",
        "url": null,
        "venue": "Annals of Mathematics (2)",
        "year": 2012
      },
      "exists": null,
      "explanation": "Cited in the higher-apartments section for the Lie variant of tangential derivations and special derivation algebras used in the commutative higher-apartments construction connecting to the Goncharov Lie coalgebra.",
      "notes": "The raw entry begins with \\bysame; based on the companion AlekseevTorossianNote entry listing full names, the authors are A. Alekseev and C. Torossian.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "A. Alekseev",
          "C. Torossian"
        ],
        "doi": null,
        "key": "AlekseevTorossianNote",
        "raw": "A. Alekseev and C. Torossian, Flat connections and trivalent graphs, \\url{https://web.archive.org/web/20211028202354/https://webusers.imj-prg.fr/~charles.torossian/publication/trivalent.pdf}, 2009.",
        "title": "Flat connections and trivalent graphs",
        "url": "https://web.archive.org/web/20211028202354/https://webusers.imj-prg.fr/~charles.torossian/publication/trivalent.pdf",
        "venue": null,
        "year": 2009
      },
      "exists": null,
      "explanation": "Cited once in the higher-apartments section for a construction relating universal traces to the special derivation algebra. Plays a supporting technical role, not central to the main arithmetic results.",
      "notes": "Unpublished note available only via a web-archive URL with no DOI or arXiv identifier; long-term accessibility is not guaranteed.",
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "V. I. Arnold"
        ],
        "doi": null,
        "key": "Arnold",
        "raw": "V. I. Arnold, The cohomology ring of the group of dyed braids, Mat. Zametki 5 (1969), 227--231. \\MR{242196}",
        "title": "The cohomology ring of the group of dyed braids",
        "url": null,
        "venue": "Matematicheskie Zametki",
        "year": 1969
      },
      "exists": null,
      "explanation": "Cited for the Arnold algebra (cohomology ring of the pure braid group / configuration space), whose PBW basis and Koszulity are exploited in the higher-apartments construction linking the Goncharov Lie coalgebra to representation theory.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "M. Aubry",
          "D. Chataur"
        ],
        "doi": null,
        "key": "AubryChataur",
        "raw": "M. Aubry and D. Chataur, Cooperads and coalgebras as closed model categories, J. Pure Appl. Algebra 180 (2003), no. 1-2, 1--23. \\MR{1966520}",
        "title": "Cooperads and coalgebras as closed model categories",
        "url": null,
        "venue": "Journal of Pure and Applied Algebra",
        "year": 2003
      },
      "exists": null,
      "explanation": "Provides model-category foundations for cooperads used in the operadic-foundations section. Supporting infrastructure rather than a direct source for the main polylogarithmic results.",
      "notes": null,
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2405.11528",
        "authors": [
          "F. Brown",
          "M. Chan",
          "S. Galatius",
          "S. Payne"
        ],
        "doi": null,
        "key": "BCGP",
        "raw": "F. Brown, M. Chan, S. Galatius, and S. Payne, \\emph{Hopf algebras in the cohomology of $A_g$, $GL_n(\\mathbb{Z})$, and $SL_n(\\mathbb{Z})$}, 2024, arXiv:2405.11528.",
        "title": "Hopf algebras in the cohomology of A_g, GL_n(Z), and SL_n(Z)",
        "url": null,
        "venue": null,
        "year": 2024
      },
      "exists": null,
      "explanation": "Cited alongside AMP for developing analogous Hopf-algebraic structures on Steinberg modules in recent parallel work, contextualising the algebraic structures studied in this paper.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "D. L. B. Brantner",
          "R. Campos",
          "J. Nuiten"
        ],
        "doi": null,
        "key": "BCN",
        "raw": "D. L. B. Brantner, R. Campos, and J. Nuiten, \\emph{P{D} operads and explicit partition {L}ie algebras}, Mem. Amer. Math. Soc. 315 (2025), no. 1597, v+125. \\MR{5003477}",
        "title": "PD operads and explicit partition Lie algebras",
        "url": null,
        "venue": "Memoirs of the American Mathematical Society",
        "year": 2025
      },
      "exists": null,
      "explanation": "Used in the operadic-foundations section for PD operads and partition Lie algebras, which provide the categorical framework for the Koszul-duality computations that extract the Goncharov Lie coalgebra from E∞-homology.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "A. Beilinson",
          "P. Deligne"
        ],
        "doi": null,
        "key": "BD94",
        "raw": "A. Beilinson and P. Deligne, \\emph{Interpr\\'{e}tation motivique de la conjecture de {Z}agier reliant polylogarithmes et r\\'{e}gulateurs}, Motives ({S}eattle, {WA}, 1991), Proc. Sympos. Pure Math., vol. 55, Amer. Math. Soc., Providence, RI, 1994, pp. 97--121. \\MR{1265552}",
        "title": "Interprétation motivique de la conjecture de Zagier reliant polylogarithmes et régulateurs",
        "url": null,
        "venue": "Proceedings of Symposia in Pure Mathematics, vol. 55",
        "year": 1994
      },
      "exists": null,
      "explanation": "The primary reference for the motivic programme connecting polylogarithms to K-theory. Cited three times in the introduction: for the mixed-Tate-motives category over a number field, for conjecturing that category over a general field, and for Beilinson's formula expressing K-groups as Ext-groups in the motivic category. Central to the paper's motivation and main conjecture.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "N. Berry",
          "A. Dubickas",
          "N. D. Elkies",
          "B. Poonen",
          "C. Smyth"
        ],
        "doi": null,
        "key": "BDEPS",
        "raw": "N. Berry, A. Dubickas, N. D. Elkies, B. Poonen, and C. Smyth, The conjugate dimension of algebraic numbers, Q. J. Math. 55 (2004), no. 3, 237--252. \\MR{2082091}",
        "title": "The conjugate dimension of algebraic numbers",
        "url": null,
        "venue": "Quarterly Journal of Mathematics",
        "year": 2004
      },
      "exists": null,
      "explanation": "Not cited in any visible portion of the text. The topic is peripheral to the paper's central concerns with Lie coalgebras, K-theory, and multiple polylogarithms.",
      "notes": "This reference on conjugate dimensions of algebraic numbers does not appear in any visible citation context. Its connection to the paper's main themes of E∞-homology and polylogarithms is not apparent; it may be invoked for a specific computation in an omitted section, possibly involving algebraic numbers in weight-3 calculations.",
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "C. Barwick",
          "S. Glasman",
          "J. Shah"
        ],
        "doi": null,
        "key": "BGSII",
        "raw": "C. Barwick, S. Glasman, and J. Shah, \\emph{Spectral {M}ackey functors and equivariant algebraic {$K$}-theory, {II}}, Tunis. J. Math. 2 (2020), no. 1, 97--146. \\MR{3933393}",
        "title": "Spectral Mackey functors and equivariant algebraic K-theory, II",
        "url": null,
        "venue": "Tunisian Journal of Mathematics",
        "year": 2020
      },
      "exists": null,
      "explanation": "Provides categorical K-theory foundations. Not cited in the visible introduction or main mathematical sections; likely invoked in the categorical-foundations sections for background on the K-theory spectrum.",
      "notes": null,
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "A. Beilinson",
          "A. Varchenko",
          "A. Goncharov",
          "V. Shekhtman"
        ],
        "doi": null,
        "key": "BGSV90",
        "raw": "A. Beilinson, A. Varchenko, A. Goncharov, and V. Shekhtman, \\emph{Projective geometry and {$K$}-theory}, Algebra i Analiz 2 (1990), no. 3, 78--130. \\MR{1073210}",
        "title": "Projective geometry and K-theory",
        "url": null,
        "venue": "Algebra i Analiz",
        "year": 1990
      },
      "exists": null,
      "explanation": "Cited in the introduction as the source of the Hopf algebra of Aomoto polylogarithms, one of the competing candidates for the Lie coalgebra of mixed Tate motives that the authors plan to compare with the Goncharov Lie coalgebra in future work. Directly relevant to the central objects of the paper.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "M. Bökstedt",
          "W. C. Hsiang",
          "I. Madsen"
        ],
        "doi": null,
        "key": "BHM",
        "raw": "M. B\\\"okstedt, W. C. Hsiang, and I. Madsen, \\emph{The cyclotomic trace and algebraic {$K$}-theory of spaces}, Invent. Math. 111 (1993), no. 3, 465--539. \\MR{1202133}",
        "title": "The cyclotomic trace and algebraic K-theory of spaces",
        "url": null,
        "venue": "Inventiones Mathematicae",
        "year": 1993
      },
      "exists": null,
      "explanation": "A foundational K-theory reference not cited in the visible introduction or main mathematical sections; likely invoked in the categorical-foundations sections for background on the K-theory spectrum.",
      "notes": null,
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "B. Brück",
          "K. I. Pitman",
          "V. Welker"
        ],
        "doi": null,
        "key": "BPW",
        "raw": "B. Br\\\"uck, K. I. Pitman, and V. Welker, The common basis complex and the partial decomposition poset, Int. Math. Res. Not. IMRN (2024), no. 18, 12746--12760. \\MR{4798648}",
        "title": "The common basis complex and the partial decomposition poset",
        "url": null,
        "venue": "International Mathematics Research Notices",
        "year": 2024
      },
      "exists": null,
      "explanation": "Cited in the introduction as an alternative combinatorial source for infinite Steinberg modules via the partial decomposition poset, complementing the common-basis-complex construction from Rognes.",
      "notes": "The second author is listed as 'K. I. Pitman'; MathSciNet record MR4798648 may list the name as 'K. I. Piterman'. Authors should verify the spelling.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "M. Barr"
        ],
        "doi": null,
        "key": "Barr1968HarrisonHH",
        "raw": "M. Barr, Harrison homology, hochschild homology and triples, Journal of Algebra 8 (1968), 314--323.",
        "title": "Harrison homology, Hochschild homology and triples",
        "url": null,
        "venue": "Journal of Algebra",
        "year": 1968
      },
      "exists": null,
      "explanation": "The E∞-indecomposables of BGL(F)_Q are computed via Harrison homology in the rational setting, as stated in the introduction. This is the foundational reference for that computation.",
      "notes": "The raw entry does not capitalise 'Hochschild', a proper noun; this appears to be a transcription error.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "M. Batanin",
          "M. Markl"
        ],
        "doi": null,
        "key": "BataninMarkl",
        "raw": "M. Batanin and M. Markl, Centers and homotopy centers in enriched monoidal categories, Adv. Math. 230 (2012), no. 4-6, 1811--1858. \\MR{2927355}",
        "title": "Centers and homotopy centers in enriched monoidal categories",
        "url": null,
        "venue": "Advances in Mathematics",
        "year": 2012
      },
      "exists": null,
      "explanation": "Cited in the Steinberg-modules section for the notion of lax functor of produoidal (E∞, E1)-categories. Provides categorical infrastructure for the duoidal structure but is not central to the main arithmetic results.",
      "notes": null,
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "S. Ben-Moshe",
          "T. M. Schlank"
        ],
        "doi": null,
        "key": "BenMosheSchlank",
        "raw": "S. Ben-Moshe and T. M. Schlank, \\emph{Higher semiadditive algebraic {K}-theory and redshift}, Compos. Math. 160 (2024), no. 2, 237--287. \\MR{4679205}",
        "title": "Higher semiadditive algebraic K-theory and redshift",
        "url": null,
        "venue": "Compositio Mathematica",
        "year": 2024
      },
      "exists": null,
      "explanation": "Not cited in any visible citation context. Its relevance to the paper's main results is not apparent from the rendered sections; likely cited for a categorical fact in the foundations sections.",
      "notes": null,
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "A. Berglund"
        ],
        "doi": null,
        "key": "BerglundKoszul",
        "raw": "A. Berglund, Koszul spaces, Trans. Amer. Math. Soc. 366 (2014), no. 9, 4551--4569. \\MR{3217692}",
        "title": "Koszul spaces",
        "url": null,
        "venue": "Transactions of the American Mathematical Society",
        "year": 2014
      },
      "exists": null,
      "explanation": "Cited in the higher-apartments section for an example of Koszul spaces relevant to the configuration-space computations. Supporting background for the Koszulity arguments.",
      "notes": null,
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "R. Bezrukavnikov"
        ],
        "doi": null,
        "key": "Bezrukavnikov",
        "raw": "R. Bezrukavnikov, \\emph{Koszul {DG}-algebras arising from configuration spaces}, Geom. Funct. Anal. 4 (1994), no. 2, 119--135. \\MR{1262702}",
        "title": "Koszul DG-algebras arising from configuration spaces",
        "url": null,
        "venue": "Geometric and Functional Analysis",
        "year": 1994
      },
      "exists": null,
      "explanation": "Cited in the higher-apartments section for Koszulity of DG-algebras from configuration spaces, used to establish Koszulity of the Arnold algebra and hence the indecomposable description of higher apartments.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2410.20504",
        "authors": [
          "M. Blans",
          "T. Blom"
        ],
        "doi": null,
        "key": "BlansBlom",
        "raw": "M. Blans and T. Blom, \\emph{On the chain rule in {G}oodwillie calculus}, 2024, arXiv:2410.20504.",
        "title": "On the chain rule in Goodwillie calculus",
        "url": null,
        "venue": null,
        "year": 2024
      },
      "exists": null,
      "explanation": "Cited for a chain rule in Goodwillie calculus used in the E∞-algebraic foundations. Provides supporting technical infrastructure; not directly relevant to the main polylogarithmic results.",
      "notes": null,
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "M. Blans",
          "T. Blom",
          "A. Kupers"
        ],
        "doi": null,
        "key": "BlansBlomKupers",
        "raw": "M. Blans, T. Blom, and A. Kupers, Naturality of $\\infty$-categorical bar-cobar duality, in preparation.",
        "title": "Naturality of ∞-categorical bar-cobar duality",
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Cited for the naturality of ∞-categorical bar-cobar duality, providing a categorical foundation for the Koszul duality arguments. Its in-preparation status means the dependency cannot be independently checked.",
      "notes": "Paper in preparation by one of the present paper's authors (A. Kupers). The results it supplies cannot be independently verified or accessed by readers; standard practice for self-citation of in-progress work.",
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "S. J. Bloch"
        ],
        "doi": null,
        "key": "Bloch",
        "raw": "S. J. Bloch, \\emph{Higher regulators, algebraic {$K$}-theory, and zeta functions of elliptic curves}, CRM Monograph Series, vol. 11, American Mathematical Society, Providence, RI, 2000. \\MR{1760901}",
        "title": "Higher regulators, algebraic K-theory, and zeta functions of elliptic curves",
        "url": null,
        "venue": "CRM Monograph Series, vol. 11, American Mathematical Society",
        "year": 2000
      },
      "exists": null,
      "explanation": "Cited in the introduction as the source for the Bloch group B_2(F) (called the pre-Bloch group by Bloch), which is identified with G_2(F) in the paper's central identification theorem. A primary predecessor for the weight-2 case.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "S. Bloch",
          "I. Křiž"
        ],
        "doi": null,
        "key": "BlochKriz",
        "raw": "S. Bloch and I. K\\v{r}\\'\\i\\v{z}, \\emph{Mixed {T}ate motives}, Ann. of Math. (2) 140 (1994), no. 3, 557--605. \\MR{1307897}",
        "title": "Mixed Tate motives",
        "url": null,
        "venue": "Annals of Mathematics (2)",
        "year": 1994
      },
      "exists": null,
      "explanation": "Cited in the introduction as the source of the 1-minimal model candidate for the Lie coalgebra of mixed Tate motives. Directly relevant to the central objects and programme of the paper.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "J. M. Boardman"
        ],
        "doi": null,
        "key": "BoardmanSS",
        "raw": "J. M. Boardman, Conditionally convergent spectral sequences, Homotopy invariant algebraic structures ({B}altimore, {MD}, 1998), Contemp. Math., vol. 239, Amer. Math. Soc., Providence, RI, 1999, pp. 49--84. \\MR{1718076}",
        "title": "Conditionally convergent spectral sequences",
        "url": null,
        "venue": "Contemporary Mathematics, vol. 239",
        "year": 1999
      },
      "exists": null,
      "explanation": "Provides convergence theory for conditionally convergent spectral sequences, required for the rigorous analysis of the Rognes rank spectral sequence whose E²-page yields the paper's main K-theory isomorphisms.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2404.06271",
        "authors": [
          "V. Bolbachan"
        ],
        "doi": null,
        "key": "Bol24",
        "raw": "V. Bolbachan, \\emph{On the {G}oncharov's conjecture in degree $m{-}1$ and weight $m$}, 2024, arXiv:2404.06271.",
        "title": "On the Goncharov's conjecture in degree m-1 and weight m",
        "url": null,
        "venue": null,
        "year": 2024
      },
      "exists": null,
      "explanation": "Cited prominently in the introduction for proving the i = n-1, n ≥ 1 case of the main conjecture and as providing a prior (different) proof of part (1) of Theorem 1. A direct predecessor result that the current paper extends.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "A. Borel"
        ],
        "doi": null,
        "key": "BorelStable",
        "raw": "A. Borel, Stable real cohomology of arithmetic groups, Ann. Sci. \\'{E}cole Norm. Sup. (4) 7 (1974), 235--272 (1975). \\MR{387496}",
        "title": "Stable real cohomology of arithmetic groups",
        "url": null,
        "venue": "Annales Scientifiques de l'École Normale Supérieure (4)",
        "year": 1974
      },
      "exists": null,
      "explanation": "Borel's computation of stable real cohomology of arithmetic groups underpins the Borel regulator, which the sequel KRS2 will use in a novel cocycle construction. Foundational for the rational K-theory computations.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "F. Brown"
        ],
        "doi": null,
        "key": "Bro12",
        "raw": "F. Brown, \\emph{Mixed {T}ate motives over {$\\Bbb Z$}}, Ann. of Math. (2) 175 (2012), no. 2, 949--976. \\MR{2993755}",
        "title": "Mixed Tate motives over Z",
        "url": null,
        "venue": "Annals of Mathematics (2)",
        "year": 2012
      },
      "exists": null,
      "explanation": "Cited in the introduction as the analogue result—universality of multiple polylogarithms for mixed Tate motives over Z—that the paper's main theorem generalises to number fields. A key comparison and motivation.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "K. S. Brown"
        ],
        "doi": null,
        "key": "Brown",
        "raw": "K. S. Brown, Cohomology of groups, Graduate Texts in Mathematics, vol. 87, Springer-Verlag, New York, 1994, Corrected reprint of the 1982 original. \\MR{1324339}",
        "title": "Cohomology of groups",
        "url": null,
        "venue": "Graduate Texts in Mathematics, vol. 87, Springer-Verlag",
        "year": 1994
      },
      "exists": null,
      "explanation": "Standard graduate textbook on group cohomology, likely cited for background facts about GL_n(F) homology. Not central to the main results.",
      "notes": null,
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "S. Charlton",
          "A. Matveiakin",
          "D. Radchenko",
          "D. Rudenko"
        ],
        "doi": null,
        "key": "CMRR",
        "raw": "S. Charlton, A. Matveiakin, D. Radchenko, and D. Rudenko, \\emph{The {H}opf algebra of formal multiple polylogarithms}, 2024.",
        "title": "The Hopf algebra of formal multiple polylogarithms",
        "url": null,
        "venue": null,
        "year": 2024
      },
      "exists": null,
      "explanation": "The Charlton-Matveiakin-Radchenko-Rudenko construction of the formal multiple polylogarithm Lie coalgebra is used extensively throughout the paper for the Steinberg-module presentation and formal realisation. Among the closest predecessors to the constructions introduced here.",
      "notes": "This entry appears to be the preprint version of CMRR24 (same title, same authors, published in IMRN 2026). Having both entries in the bibliography is a minor redundancy; authors should consolidate them or clarify the distinction. No arXiv identifier is provided for the preprint, which is unusual.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "S. Charlton",
          "A. Matveiakin",
          "D. Radchenko",
          "D. Rudenko"
        ],
        "doi": null,
        "key": "CMRR24",
        "raw": "\\bysame, \\emph{The {H}opf algebra of formal multiple polylogarithms}, Int. Math. Res. Not. IMRN (2026), no. 2, Paper No. rnaf361, 29. \\MR{5013247}",
        "title": "The Hopf algebra of formal multiple polylogarithms",
        "url": null,
        "venue": "International Mathematics Research Notices",
        "year": 2026
      },
      "exists": null,
      "explanation": "The published version of CMRR, cited in the introduction for the formal correlator construction and L^f(F). Directly relevant as the closest published predecessor to the paper's main constructions.",
      "notes": "Published year 2026 with MR number MR5013247 indicates advance-of-print publication. The raw entry opens with \\bysame, denoting the same authors as CMRR. This is the same paper as CMRR at a later publication stage; the dual listing is a citation-hygiene concern.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "J. A. Campbell",
          "I. Zakharevich"
        ],
        "doi": null,
        "key": "CampbellZakharevich",
        "raw": "J. A. Campbell and I. Zakharevich, \\emph{Hilbert's third problem and a conjecture of {G}oncharov}, Adv. Math. 451 (2024), Paper No. 109757, 57. \\MR{4759410}",
        "title": "Hilbert's third problem and a conjecture of Goncharov",
        "url": null,
        "venue": "Advances in Mathematics",
        "year": 2024
      },
      "exists": null,
      "explanation": "Related to the scissors-congruence Hopf algebra and Goncharov's conjecture, one of the alternative candidates for the Lie coalgebra of mixed Tate motives discussed in the introduction. Contextualises the paper's central objects within the scissors-congruence programme.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    }
  ],
  "missing_references": [
    {
      "reason": "Milnor K-theory K^M_n(F) is a central concept throughout the paper—invoked in the abstract, repeatedly in the introduction, and in the statement of Theorem 1—yet no citation to Milnor's 1970 Inventiones paper introducing it appears in any visible citation context. The foundational result that K_n^(n)(F)_Q equals rationalised Milnor K-theory is attributed only via Suslin [@Sus84], and the 'Matsumoto--Milnor' result is mentioned without a primary source. With 90 bibliography entries omitted from this prompt the reference may be present, but its absence from visible contexts is notable for a paper whose main theorem is framed as a generalisation of the Matsumoto-Milnor computation.",
      "title": "Milnor, Algebraic K-theory and quadratic forms (1970)"
    }
  ],
  "summary": "The 32 visible bibliography entries reflect careful citation practice: the primary motivic references (Beilinson-Deligne, Goncharov's various papers, Bloch, Bloch-Kriz, Brown) are cited at the correct primary sources, and recent directly relevant work (Bolbachan, GKRW series, Charlton-Matveiakin-Radchenko-Rudenko) is cited at precise theorem locations. Two citation-hygiene issues warrant attention: (1) CMRR and CMRR24 are duplicate entries for the same paper at preprint and published stages respectively; they should be consolidated or the preprint entry should at minimum include its arXiv identifier; (2) the bibliography entry BPW lists the second author as 'K. I. Pitman', which may be a transcription error for 'K. I. Piterman' per MathSciNet MR4798648. The entry BDEPS (conjugate dimension of algebraic numbers) does not appear in any visible citation context, and its connection to the paper's core themes is opaque without seeing its actual use site."
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.78,
  "questions": [
    "Can the authors publish the computer-assisted computations from Section 7.3.3 as a reproducible artifact (Sage worksheet, Mathematica notebook, or Python script) with a DOI-linked Zenodo or GitHub repository referenced from that section?",
    "What is the current status of Blans-Blom-Kupers (in preparation), and can the specific results it provides be stated and proved as a self-contained lemma or appendix in the present paper to remove the dependency?",
    "For the decomposition operator D^FC_h, can a self-contained proof or computer-verified certificate of co-Jacobi for the cobracket be provided for at least the n=2 and n=3 cases, ideally as a symbolic computation accompanying the paper?",
    "Is the original Milnor (1970) paper 'Algebraic K-theory and quadratic forms' present in the bibliography? Its absence from all visible citation contexts is notable given that Milnor K-theory is invoked from the abstract through the proof of Theorem 1.",
    "Can the introduction be augmented with explicit theorem numbers from the body at each step of the Rognes spectral sequence argument (slope-2 vanishing, duality eigenspace decomposition, discarding K^M contributions, E²-page identification) so that the derivation of Theorem 1 can be audited without traversing the full paper?"
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "The Acknowledgments explicitly state: 'We would like to thank Steven Charlton for helping us to establish the results of Section 7.3.3 with computer-assisted methods.' This is a direct admission that the proof relies on computational verification, but the paper does not publish, link, or describe the verification artifact. The reader cannot reproduce or audit the computer-assisted step. Per the Proof-as-Code Axiom for math.KT, this is exactly the situation where a verifiable artifact is mandatory.",
      "id": "weakness-1",
      "locator": "Section 7.3.3 (referenced in Acknowledgments), supports Theorem polyl-identification at n=3",
      "required_update": "Publish the computer-assisted verification as a reproducible artifact (Sage worksheet, Mathematica notebook, or Python/Julia script) at code/trilogarithm_section_7_3_3/ and reference it from Section 7.3.3 of the paper with a DOI or a Zenodo/GitHub link. Include the input relations, the search procedure, and the output certificate.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 7.3.3 (referenced in Acknowledgments), supports Theorem polyl-identification at n=3` is corrected or justified.",
      "weakness_index": 0
    },
    {
      "evidence": "The argument is outlined: (a) identify G_n(F) with H_1(GL_n(F); St^∞_n(F)) using GKRW20 equation (eqn:he1-st-heinfty-stl); (b) build a projective resolution of St^∞ in terms of FC and decomposition operators (eqn:dec-resolution); (c) take coinvariants and read off generators/relations. Step (a) is cited to GKRW20 [§6]; the user-supplied excerpt does not re-derive it. Step (b) hinges on the 'almost basis' claim attributed to [CharltonRadchenkoRudenko §3.9] together with the assertion that the only relations among normalized correlators with fixed h are the shuffle relations — this is asserted but not proved in the introduction excerpt. The combinatorial set T(n) and sign function (Proposition 26) are deferred to the body.",
      "id": "weakness-2",
      "locator": "Theorem polyl-presentation-additive, Section 1.3 (Steinberg module presentation); proven via the projective resolution in Section 1.3.1 (and full proof in Sections 2–4 of the body).",
      "required_update": "Provide, in the introduction or an appendix, the explicit verification that the differentials in (eqn:dec-resolution) square to zero and that the complex is acyclic in positive degrees (only its 0-th homology is St^∞). Cite a precise lemma in [CharltonRadchenkoRudenko] for the 'shuffle is the only relation among h-normalized correlators' claim, since this is load-bearing for the resolution.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Theorem polyl-presentation-additive, Section 1.3 (Steinberg module presentation); proven via the projective resolution in Section 1.3.1 (and full proof in Sections 2–4 of the body).` is corrected or justified.",
      "weakness_index": 1
    },
    {
      "evidence": "The introduction derives this from the Rognes rank spectral sequence by taking the (-1)-eigenspace of duality on the E^2-page in row d=4, after discarding the Milnor K-theory contribution (Section 1.4). The argument is sketched and relies on (a) the slope-2 vanishing line of GKRW20 [cited], (b) the Koszul-duality identification G(F) = H_1(GL_n(F); St^∞_n(F)), (c) the duality involution acting by (-1)^n on G_n(F) (Theorem 145, deferred to body), and (d) the omnibus rank-SS analysis of Theorem 150. None of (a)–(d) are reproven in the introduction; the proof is delegated to Sections 5–8 of the paper, which are not included in the bounded context provided here. The argument is plausible and consistent with the cited results (and with [Bol24], whose alternative proof the authors cite as an instance).",
      "id": "weakness-3",
      "locator": "Theorem 1, item (i), Section 1.1.3 / 1.4",
      "required_update": "In the introduction, explicitly state which lemmas/theorems of the body are invoked at each step of the sketch (vanishing line, duality eigenspace decomposition, discarding K^M_3, identification of E^2_{1,4}) so a reader can audit the chain without scanning the entire 4000-line paper. Verify the E^2-page diagrams (Figures 5–6) against the cited entries (Theorem 150) and tag them in the body.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Theorem 1, item (i), Section 1.1.3 / 1.4` is corrected or justified.",
      "weakness_index": 2
    },
    {
      "evidence": "Paper in preparation by one of the present paper's authors (A. Kupers). The results it supplies cannot be independently verified or accessed by readers; standard practice for self-citation of in-progress work.",
      "id": "weakness-4",
      "locator": "BlansBlomKupers",
      "required_update": "Verify `BlansBlomKupers` against an authoritative source; replace it with a resolvable relevant citation or remove it.",
      "source_path": null,
      "source_role": "citation",
      "status": "open",
      "target_kind": "bibliography",
      "verification_check": "Re-review should confirm the citation resolves and is relevant.",
      "weakness_index": 3
    },
    {
      "evidence": "Milnor K-theory K^M_n(F) is a central concept throughout the paper—invoked in the abstract, repeatedly in the introduction, and in the statement of Theorem 1—yet no citation to Milnor's 1970 Inventiones paper introducing it appears in any visible citation context. The foundational result that K_n^(n)(F)_Q equals rationalised Milnor K-theory is attributed only via Suslin [@Sus84], and the 'Matsumoto--Milnor' result is mentioned without a primary source. With 90 bibliography entries omitted from this prompt the reference may be present, but its absence from visible contexts is notable for a paper whose main theorem is framed as a generalisation of the Matsumoto-Milnor computation.",
      "id": "weakness-5",
      "locator": "Milnor, Algebraic K-theory and quadratic forms (1970)",
      "required_update": "Add a bibliography entry for `Milnor, Algebraic K-theory and quadratic forms (1970)` and cite it where the affected method or claim is introduced, or explicitly justify its omission.",
      "source_path": null,
      "source_role": "citation",
      "status": "open",
      "target_kind": "bibliography",
      "verification_check": "Re-review should confirm the bibliography and citation context address this reference.",
      "weakness_index": 4
    },
    {
      "evidence": "Milnor K-theory K^M_n(F) is a central concept throughout the paper—invoked in the abstract, repeatedly in the introduction, and in the statement of Theorem 1—yet no citation to Milnor's 1970 Inventiones paper introducing it appears in any visible citation context. The foundational result that K_n^(n)(F)_Q equals rationalised Milnor K-theory is attributed only via Suslin [@Sus84], and the 'Matsumoto--Milnor' result is mentioned without a primary source. With 90 bibliography entries omitted from this prompt the reference may be present, but its absence from visible contexts is notable for a paper whose main theorem is framed as a generalisation of the Matsumoto-Milnor computation.",
      "id": "weakness-6",
      "locator": "Milnor, Algebraic K-theory and quadratic forms (1970)",
      "required_update": "Add a bibliography entry for `Milnor, Algebraic K-theory and quadratic forms (1970)` and cite it where the affected method or claim is introduced, or explicitly justify its omission.",
      "source_path": null,
      "source_role": "citation",
      "status": "open",
      "target_kind": "bibliography",
      "verification_check": "Re-review should confirm the bibliography and citation context address this reference.",
      "weakness_index": 5
    }
  ],
  "strengths": [
    "The Goncharov Lie coalgebra is given a complete presentation via correlators with explicit cobracket formulas, resolving a problem that had been open in the motivic cohomology literature for decades.",
    "The proof of K₄⁽³⁾(F)_Q ≅ H²(G(F))₃ for all fields independently confirms Bolbachan's [Bol24] result via a different spectral-sequence method, with the alternative proof providing a meaningful cross-check.",
    "The unified framework connecting E∞-homology, Steinberg modules, Koszul duality of Arnold algebras, and multiple polylogarithms is conceptually powerful and provides a clear roadmap for the stated sequel (KRS2).",
    "The identifications G_n(F) ≅ F^×_Q (n=1), B_2(F)_Q (n=2), and B_3(F)_Q (n=3) ground the abstract construction in concrete, independently understood algebraic objects, enabling immediate comparison with classical results of Suslin, Bloch, and Goncharov.",
    "Motivic and Hodge realisation functors from Comod^fd_{G(F)} are constructed explicitly, connecting the abstract Lie coalgebra to geometric and analytic structures and establishing the factorisation G(F) → L^f(F) → L^MTM(F)."
  ],
  "summary": "The paper introduces the Goncharov Lie coalgebra of a field F as the critical-line entries of the E∞-homology of BGL(F)_Q, presents it via correlators with an explicit Lie cobracket formula, identifies G_n(F) with classical objects for n≤3, constructs motivic and Hodge realisation functors, and proves K₄⁽³⁾(F)_Q ≅ H²(G(F))₃ for all fields. All five specialists concur that the mathematical programme is coherent, the contributions are significant (novelty score 0.78, verdict 'significant'), and the overall technical posture is 'mostly_sound'. The central disagreement is between the novelty and summary specialists, who assess the scope positively, and the reproducibility and technical-correctness specialists, who flag serious gaps in verifiable artifacts. These gaps are not in tension: the mathematics may be correct while still being unverifiable. Two technical-correctness items are marked 'unsupported' at severity 'major' (TC-12, TC-13), both arising from missing computational artifacts rather than identified mathematical errors. Reproducibility flags four 'critical' concerns: no public code, no machine-checkable proof of the headline presentation (Lean or equivalent), no machine-checkable proof of the cobracket identities, and no machine-checkable proof of the weight-3 K-theory isomorphism. The paper explicitly acknowledges computer-assisted computation in Section 7.3.3 (Acknowledgments credit Steven Charlton) but publishes no artifact. This combination — math.KT field, critical/major missing proof-as-code artifacts for headline claims, computer-assisted results without published scripts — triggers the recommendation gate: major_revision is required. Beyond reproducibility, the introduction delegates the entire Rognes rank spectral sequence argument to Theorem 150 in the body without even a pointer-annotated sketch, making the logical chain from definitions to Theorem 1 opaque. Bibliography issues are minor: the CMRR/CMRR24 duplicate should be resolved, the BPW second-author spelling should be verified against MathSciNet MR4798648, and the original Zagier (1991) conjecture paper and Milnor (1970) paper may be absent despite being foundational to the paper's central motivation.",
  "weaknesses": [
    "Section 7.3.3 relies on computer-assisted computations credited to Steven Charlton in the Acknowledgments, but no Sage worksheet, Mathematica notebook, or script is published, making the load-bearing n=3 identification G_3(F) ≅ B_3(F) in Theorem polyl-identification unverifiable by readers.",
    "The explicit decomposition operator D^FC_h and its key properties — that the only relations among h-normalized correlators are shuffle relations, and that the resulting cobracket satisfies co-Jacobi — lack any machine-checkable verification despite being directly amenable to symbolic computation for small n.",
    "The Rognes rank spectral sequence argument underpinning Theorem 1 is entirely bundled into Theorem 150 in the body with no pointer-annotated sketch in the introduction, leaving the logical chain from the slope-2 vanishing line and duality eigenspace decomposition to the stated K-theory isomorphisms opaque.",
    "A key categorical foundation (Blans-Blom-Kupers, 'Naturality of ∞-categorical bar-cobar duality') is cited as a paper in preparation by a co-author; the results it supplies are inaccessible to referees and readers and cannot be independently verified.",
    "The bibliography lists CMRR and CMRR24 as separate entries for the same paper at preprint and journal stages respectively; these should be consolidated, and the preprint entry should at minimum include its arXiv identifier, while the BPW second-author name ('K. I. Pitman') should be verified against MathSciNet MR4798648 for a potential transcription error ('K. I. Piterman').",
    "Milnor K-theory K^M_n(F) and Zagier's original 1991 conjecture paper appear to be absent from the visible bibliography despite being invoked from the abstract onward; the Matsumoto-Milnor result is attributed only through Suslin [Sus84] without a primary source."
  ]
}
```

### novelty (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.7,
  "missing_prior_art": [
    {
      "reason": "Section 1.7 identifies the decomposition relation as the universal functional equation for correlators and discusses weight-3 functional equations at length. Gangl's explicit work on functional equations for the trilogarithm and their use in checking the Bloch group $B_3(F)$ is closely related and is referenced indirectly via the Bourbaki survey [Dup20] but not cited directly.",
      "title": "H. Gangl, Functional equations of higher logarithms (and related works on explicit functional equations for the trilogarithm)"
    },
    {
      "reason": "Zagier's conjecture connecting special values of Dedekind zeta functions to algebraic K-theory via polylogarithms is a central motivation, but only the dilogarithm survey [Zagier 2007] is cited; the original 1991 conjecture paper where the relationship to $K_{2n-1}(F)$ and $\\mathrm{Li}_n$ was first stated appears to be absent from the bibliography.",
      "title": "D. Zagier, Polylogarithms, Dedekind zeta functions and the algebraic K-theory of fields (original formulation of Zagier's conjecture, 1991)"
    }
  ],
  "novelty_score": 0.78,
  "related_work": [
    {
      "citation_key": "GKRW20",
      "delta": "Establishes the $E_\\infty$-homology framework for $\\mathbf{BGL}(F)_\\mathbb{Q}$, proves the slope-2 vanishing line confirming Rognes' conjecture, and identifies $E_k$-homology groups with homology of $\\mathrm{GL}_n(F)$ with Steinberg module coefficients. These are the foundational inputs enabling the definition and key properties of the Goncharov Lie coalgebra.",
      "relation": "prior_art",
      "title": "$E_\\infty$-cells and general linear groups of infinite fields"
    },
    {
      "citation_key": "CharltonRadchenkoRudenko",
      "delta": "Supplies the presentation of infinite Steinberg modules $\\mathrm{St}^\\infty_n(F)$ via Steinberg correlators and the explicit cobracket formula. This paper lifts those results via coinvariants to the presentation of $\\mathscr{G}(F)$ and derives the Lie cobracket formula for correlators.",
      "relation": "builds_on",
      "title": "Multiple polylogarithms and the Steinberg module"
    },
    {
      "citation_key": "CMRR24",
      "delta": "Constructs the formal Lie coalgebra $\\mathscr{L}^{\\mathrm{f}}(F)$ with formal correlators satisfying the same relations as in the Goncharov Lie coalgebra. This paper uses it to define the formal realisation map $r^{\\mathrm{f}}:\\mathscr{G}(F)\\to\\mathscr{L}^{\\mathrm{f}}(F)$ through which both the motivic and Hodge realisations factor.",
      "relation": "builds_on",
      "title": "The Hopf algebra of formal multiple polylogarithms"
    },
    {
      "citation_key": "Gon95b",
      "delta": "Introduces the Bloch group $B_3(F)$, the weight-3 polylogarithmic complex $\\Gamma_3(F)$, and conjectures that its homology computes $K_5^{(3)}(F)$, $K_4^{(3)}(F)$, and $K_3^M(F)$ respectively. The main theorem of the present paper verifies a variant of this conjecture, with Goncharov's complex identified as the Chevalley–Eilenberg complex of $\\mathscr{G}(F)$ in weight 3.",
      "relation": "prior_art",
      "title": "Geometry of configurations, polylogarithms, and motivic cohomology"
    },
    {
      "citation_key": "Gon19",
      "delta": "Provides the motivic Lie coalgebra $\\mathscr{L}^{\\mathrm{MTM}}(F)$, motivic correlators, and Hodge correlators used in this paper to construct the motivic and Hodge realisation functors from the category of comodules over $\\mathscr{G}(F)$.",
      "relation": "builds_on",
      "title": "Hodge correlators"
    },
    {
      "citation_key": "BD94",
      "delta": "Formulates the Beilinson–Deligne conjecture expressing Adams eigenspaces of algebraic K-theory as Ext groups in the category of mixed Tate motives. This is the primary motivating framework for the paper's approach and the source of the prediction that $K_{2n-i}^{(n)}(F)\\cong H^i(\\mathscr{G}(F))_n$.",
      "relation": "prior_art",
      "title": "Interprétation motivique de la conjecture de Zagier reliant polylogarithmes et régulateurs"
    },
    {
      "citation_key": "Rognes",
      "delta": "Constructs the rank filtration of the algebraic K-theory spectrum and the associated spectral sequence, which the paper uses (together with properties of $\\mathscr{G}(F)$) to derive the symbolic descriptions of $K_4^{(3)}(F)$ and the indecomposable part of $K_5^{(3)}(F)$.",
      "relation": "prior_art",
      "title": "A spectrum level rank filtration in algebraic K-theory"
    },
    {
      "citation_key": "Sus90",
      "delta": "Proves the exactness of the Bloch group sequence computing $K_3^{(2)}(F)$ and $K_2^{(2)}(F)$, providing the weight-2 precursor and verification framework for the weight-3 results of the present paper. Suslin's pre-Bloch group is identified with $\\mathscr{G}_2(F)$.",
      "relation": "prior_art",
      "title": "$K_3$ of a field, and the Bloch group"
    },
    {
      "citation_key": "Bol24",
      "delta": "Independently proves the Goncharov conjecture $K_{2n-(n-1)}^{(n)}(F)\\cong H^{n-1}(\\mathscr{G}(F))_n$ for all weights $n$ by a different method. The weight-3 case overlaps with Theorem 1(i) of this paper; both proofs are cited as independent.",
      "relation": "competing",
      "title": "On the Goncharov's conjecture in degree $m-1$ and weight $m$"
    },
    {
      "citation_key": "MPW23",
      "delta": "Studies rank filtrations and Steinberg modules and proves related vanishing results independently. Provides the equivalence between the stable building $D^\\infty$ and Rognes' common basis complex used in the paper, but does not construct or present the Goncharov Lie coalgebra.",
      "relation": "orthogonal",
      "title": "On rank filtrations of algebraic K-theory and Steinberg modules"
    },
    {
      "citation_key": "NesterenkoSuslin",
      "delta": "Establishes the Nesterenko–Suslin isomorphism comparing the two monoidal structures ($\\boxplus$ and $\\boxbackslash$) on $\\mathbf{BGL}(F)$, a key step in identifying $E_1$-indecomposables with GL-homology with Steinberg module coefficients.",
      "relation": "prior_art",
      "title": "Homology of the general linear group over a local ring, and Milnor's K-theory"
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
      "description": "No public code, proof repository, license, or pinned release is provided for reproducing the claimed constructions and computations.",
      "severity": "critical"
    },
    {
      "area": "code",
      "description": "The headline presentation of the Goncharov Lie coalgebra and its relations lacks a machine-checkable proof artifact such as formal/GoncharovLieCoalgebra/Presentation.lean.",
      "severity": "critical"
    },
    {
      "area": "code",
      "description": "The explicit Lie cobracket formula and its coalgebra identities lack a machine-checkable proof artifact such as formal/GoncharovLieCoalgebra/Cobracket.lean.",
      "severity": "critical"
    },
    {
      "area": "code",
      "description": "The motivic and Hodge realisation constructions lack formal proof artifacts such as formal/Realisations/MotivicHodge.lean.",
      "severity": "major"
    },
    {
      "area": "code",
      "description": "The Rognes rank spectral sequence argument yielding the weight-3 K-theory isomorphism and exact sequence lacks a machine-checkable proof artifact such as formal/KTheory/Weight3.lean.",
      "severity": "critical"
    },
    {
      "area": "code",
      "description": "Results in Section 7.3.3 are acknowledged as using computer-assisted methods, but no scripts, inputs, outputs, or reproducible notebook are supplied; an artifact such as computations/trilog/verify_relations.sage would be needed.",
      "severity": "major"
    },
    {
      "area": "compute",
      "description": "No software versions, proof assistant version, CAS version, dependency lockfile, hardware notes, or deterministic run instructions are specified for the computer-assisted or formal-verification-relevant parts.",
      "severity": "major"
    },
    {
      "area": "evaluation",
      "description": "No independent verification target, test suite, or acceptance checklist is provided to check the stated presentations, cobracket formulas, realisations, and K-theory consequences against the paper.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://web.archive.org/web/20211028202354/https://webusers.imj-prg.fr/` (status=network_error)",
      "severity": "minor"
    }
  ],
  "confidence": 0.86,
  "data_availability": "unspecified",
  "data_url": null,
  "environment": null,
  "reproducibility_score": 0.15
}
```

### summary (`claude-haiku-4-5`) — status: `pass`

```json
{
  "audience": "Algebraic topologists, K-theory specialists, and researchers in motivic geometry and polylogarithms; secondary audience includes those studying Hopf algebras, operadic structures, and higher algebra",
  "key_contributions": [
    "Definition of the Goncharov Lie coalgebra as the critical-line entries of E∞-homology groups of BGL(F)",
    "Complete presentation of the Goncharov Lie coalgebra using correlators, with explicit formulas for the Lie cobracket",
    "Identification of G_n(F) for n ≤ 3 with classical objects (Milnor K-theory, Bloch group, and Goncharov's B_3)",
    "Construction of motivic and Hodge realisations connecting the coalgebra to mixed Tate motives",
    "Proof that K₄⁽³⁾(F) ≅ H²(G(F))_3 for all fields, affirming Goncharov's weight 3 conjecture",
    "Exact sequence relating K₅⁽³⁾(F) to homology of the Goncharov Lie coalgebra",
    "Application of the Rognes rank spectral sequence to compute K-theory groups",
    "Derivation of functional equations for multiple polylogarithms from relations in infinite Steinberg modules"
  ],
  "plain_language_summary": "The paper develops a new mathematical object called the Goncharov Lie coalgebra, which bridges two important areas of mathematics: algebraic K-theory (which measures algebraic structure of fields) and polylogarithms (special multivalued functions studied in number theory). The authors define this coalgebra using advanced homotopy-theoretic tools (E∞-homology) and give it a complete presentation using \"correlators\"—formal expressions involving elements from a field. They show that the cobracket (a key structural feature of the coalgebra) can be explicitly computed and provide interpretations through motivic geometry and Hodge theory.\n\nThe paper proves a major result relating these structures to algebraic K-theory at weight 3, giving symbolic descriptions of otherwise mysterious K-groups. Specifically, they express K₄⁽³⁾(F) in terms of the second cohomology of the Goncharov Lie coalgebra and characterize part of K₅⁽³⁾(F) via homological algebra. These results support a longstanding conjecture of Goncharov predicting an isomorphism between K-theory groups and cohomology of polylogarithmic complexes. The authors also derive functional equations for multiple polylogarithms as consequences of their structural results about Steinberg modules.",
  "tldr": "This paper introduces the Goncharov Lie coalgebra of a field, a new algebraic structure derived from the E∞-homology of general linear groups that connects algebraic K-theory to polylogarithms."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `pass`

```json
{
  "claims": [
    {
      "assessment": "partially_supported",
      "claim": "Theorem 1(i): For any field F, there is an isomorphism K_4^{(3)}(F)_Q ≅ H^2(G(F))_3.",
      "evidence": "The introduction derives this from the Rognes rank spectral sequence by taking the (-1)-eigenspace of duality on the E^2-page in row d=4, after discarding the Milnor K-theory contribution (Section 1.4). The argument is sketched and relies on (a) the slope-2 vanishing line of GKRW20 [cited], (b) the Koszul-duality identification G(F) = H_1(GL_n(F); St^∞_n(F)), (c) the duality involution acting by (-1)^n on G_n(F) (Theorem 145, deferred to body), and (d) the omnibus rank-SS analysis of Theorem 150. None of (a)–(d) are reproven in the introduction; the proof is delegated to Sections 5–8 of the paper, which are not included in the bounded context provided here. The argument is plausible and consistent with the cited results (and with [Bol24], whose alternative proof the authors cite as an instance).",
      "id": "TC-1",
      "location": "Theorem 1, item (i), Section 1.1.3 / 1.4",
      "severity": "minor",
      "suggested_fix": "In the introduction, explicitly state which lemmas/theorems of the body are invoked at each step of the sketch (vanishing line, duality eigenspace decomposition, discarding K^M_3, identification of E^2_{1,4}) so a reader can audit the chain without scanning the entire 4000-line paper. Verify the E^2-page diagrams (Figures 5–6) against the cited entries (Theorem 150) and tag them in the body."
    },
    {
      "assessment": "partially_supported",
      "claim": "Theorem 1(ii): For any field F, there is an exact sequence K_4^{(2)}(F)_Q ⊗ F^×_Q → K_5^{(3)}(F)_Q → H^1(G(F))_3 → 0.",
      "evidence": "Derived in the introduction from the row d=5 of the duality-(-1)-eigenspace E^2-page of the Rognes rank spectral sequence. The derivation again rests on the omnibus rank-SS theorem (Theorem 150) and on the identification of E^1-entries via Theorem polyl-identification. The full proof is in the body sections not contained in the audit excerpt. The conditional converse (Corollary 169: equivalence with the Beilinson–Soulé instance K_4^{(2)}(E)_Q = 0) is internally consistent and is a meaningful sanity check.",
      "id": "TC-2",
      "location": "Theorem 1, item (ii), Section 1.1.3 / 1.4",
      "severity": "minor",
      "suggested_fix": "Annotate the introduction sketch with pointers to the precise auxiliary statements used at each step (e.g. which weight-bounds are invoked to terminate the SS, which duality eigenspace decomposition is used). Ensure that the discarded summands above weight 3 are explicitly accounted for, since the exact sequence's left term arises from a non-collapsed differential."
    },
    {
      "assessment": "partially_supported",
      "claim": "Theorem polyl-presentation-additive: G(F) is generated as a Q-vector space by correlators Cor^G(x_0,…,x_n) subject to homogeneity, cyclic symmetry, shuffle, and decomposition relations.",
      "evidence": "The argument is outlined: (a) identify G_n(F) with H_1(GL_n(F); St^∞_n(F)) using GKRW20 equation (eqn:he1-st-heinfty-stl); (b) build a projective resolution of St^∞ in terms of FC and decomposition operators (eqn:dec-resolution); (c) take coinvariants and read off generators/relations. Step (a) is cited to GKRW20 [§6]; the user-supplied excerpt does not re-derive it. Step (b) hinges on the 'almost basis' claim attributed to [CharltonRadchenkoRudenko §3.9] together with the assertion that the only relations among normalized correlators with fixed h are the shuffle relations — this is asserted but not proved in the introduction excerpt. The combinatorial set T(n) and sign function (Proposition 26) are deferred to the body.",
      "id": "TC-3",
      "location": "Theorem polyl-presentation-additive, Section 1.3 (Steinberg module presentation); proven via the projective resolution in Section 1.3.1 (and full proof in Sections 2–4 of the body).",
      "severity": "minor",
      "suggested_fix": "Provide, in the introduction or an appendix, the explicit verification that the differentials in (eqn:dec-resolution) square to zero and that the complex is acyclic in positive degrees (only its 0-th homology is St^∞). Cite a precise lemma in [CharltonRadchenkoRudenko] for the 'shuffle is the only relation among h-normalized correlators' claim, since this is load-bearing for the resolution."
    },
    {
      "assessment": "partially_supported",
      "claim": "Theorem polyl-presentation-cobracket: The cobracket on G(F) is δ(Cor^G(x_0,…,x_n)) = Σ_{j,i} Cor^G(x_j,…,x_{j+i}) ∧ Cor^G(x_j,x_{j+i+1},…,x_{j+n}) when x_0,…,x_n are distinct.",
      "evidence": "The introduction explains that the cobracket arises from a secondary operation obtained via the duoidal Eckmann–Hilton/Dunn–Lurie additivity argument (cited to LurieHA 5.1.2.2) and is computed by lifting the bar zigzag [St^∞→0] ← [St^∞→Λ^2 St^∞] → [0→St^∞ ⊠ St^∞] along formal-correlator resolutions. The choice of lift is acknowledged as 'a subtlety' deferred to Section 5.3.1. The formula matches the cobracket on St^∞ given by Charlton–Radchenko–Rudenko, which is a non-trivial sanity check.",
      "id": "TC-4",
      "location": "Theorem polyl-presentation-cobracket, Section 1.3.3 / Section 5.3",
      "severity": "minor",
      "suggested_fix": "Make the lifting argument in Section 5.3.1 self-contained or provide a worked example (e.g. n=2 reduced to the 5-term relation, n=3) verifying co-Jacobi by direct computation. A symbolic computer-algebra verification (Sage/Mathematica) of co-Jacobi for n≤4 generic inputs would strengthen the argument and could be shipped per the proof-as-code axiom; see TC-12."
    },
    {
      "assessment": "partially_supported",
      "claim": "Theorem polyl-identification: F^×_Q ≅ G_1(F), B_2(F)_Q ≅ G_2(F), B_3(F)_Q ≅ G_3(F) with explicit correlator formulas.",
      "evidence": "For n=1 the identification with F^× is essentially tautological (H_1 of GL_1 with trivial coefficients twisted by St^∞_1 = Q). For n=2 the equivalence with the Bloch (pre-Bloch) group B_2 reduces by Example 2 to the classical 5-term relation, which the introduction shows arises as the n=2 decomposition relation. For n=3, the identification with B_3 (Goncharov [Gon95b]) is cited to follow from comparing relations; the proof is deferred to the body. The n=3 case is the load-bearing one and is the basis for Theorem 1.",
      "id": "TC-5",
      "location": "Theorem polyl-identification, Section 1.3",
      "severity": "minor",
      "suggested_fix": "State explicitly in Section 1.3 the bijection between (i) the decomposition relations at n=3 and (ii) the relations defining B_3(F) (Goncharov's 22-term and related identities). A direct table or appendix matching generators/relations would aid verification."
    },
    {
      "assessment": "partially_supported",
      "claim": "Theorem motivic-realisation: For a number field F, there is a unique Tannakian functor R^MTM : Comod^fd_G(F) → MTM_Q(F) such that r^MTM(Cor^G(x_0,…,x_n)) = Cor^MTM(x_0,…,x_n).",
      "evidence": "The construction factors through the 'formal' Lie coalgebra L^f(F) of Charlton–Matveiakin–Radchenko–Rudenko [CMRR24]: G(F) → L^f(F) → L^MTM(F). The well-definedness of the first map follows because motivic correlators are stated (citing Gon19 §10.4.1) to satisfy the same homogeneity/cyclic/shuffle/decomposition relations. The introduction does not re-verify that motivic correlators satisfy the decomposition relation — it cites Proposition 139 ('formal realization') in the body. The uniqueness claim relies on Cor^G generating G(F), which is established in Theorem polyl-presentation-additive (TC-3).",
      "id": "TC-6",
      "location": "Theorem thm:motivic-realisation, Section 1.5",
      "severity": "minor",
      "suggested_fix": "Explicitly cite the lemma in [CMRR24] or [Gon19] establishing that motivic correlators satisfy the decomposition relation (rather than merely the standard shuffle/cyclic relations), since the decomposition relation is the most substantive of the four and is the key obstruction to well-definedness."
    },
    {
      "assessment": "partially_supported",
      "claim": "Theorem hodge-realisation: For an embedding σ : F ↪ C, there is a unique Tannakian functor R^Hod_σ : Comod^fd_G(F) → MHTS_Q sending correlators to Hodge correlators.",
      "evidence": "Analogous to TC-6 but with target the Lie coalgebra of framed Hodge–Tate structures. The Hodge correlators are cited to [Gon19 §3.2]. As for the motivic realization, the load-bearing verification is that Hodge correlators satisfy the decomposition relation — this is again deferred to the formal-realization Proposition 139 in the body.",
      "id": "TC-7",
      "location": "Theorem thm:hodge-realisation, Section 1.5",
      "severity": "minor",
      "suggested_fix": "Same as TC-6: cite the exact source/equation establishing that Hodge correlators satisfy the decomposition relation. The downstream consequence (G_n(C) uncountable for n≥1, used in the sequel KRS2) depends on this."
    },
    {
      "assessment": "partially_supported",
      "claim": "Theorem polyl-relations-from-stl-relations (Theorem 2): Every Q-linear relation among Steinberg correlators in St^∞(V) yields a functional equation in G_n(F) by evaluation against any linear functional h ∈ V^∨, with the resulting sum independent of h.",
      "evidence": "This is essentially a corollary of the resolution of TC-3: the projection π : St^∞ → G_n descends from St^∞(V) and, by the resolution, the dependence on h drops to coinvariants. The introduction states the result cleanly but defers the rigorous justification (commutation of taking GL(V)-coinvariants with the projection, h-independence) to the body. The decomposition relation is correctly identified as a special case (taking the elementary linear relation in St^∞ that defines the cobracket structure).",
      "id": "TC-8",
      "location": "Theorem 2 (thm:polyl-relations-from-stl-relations), Section 1.6",
      "severity": "minor",
      "suggested_fix": "Provide a one-line proof in Section 1.6 reducing to the exact sequence at the end of Section 1.3.2 to make the corollary character explicit; this would let the reader verify the result without traversing later sections."
    },
    {
      "assessment": "partially_supported",
      "claim": "Reduction G_n(F) = H_1(GL_n(F); St^∞_n(F)) (eqn:he1-st-heinfty-stl, bottom row).",
      "evidence": "Stated to follow from GKRW20 §6 by combining (i) E_1-indecomposables of underline-Q_{>0} w.r.t. flag-sum giving Steinberg modules, (ii) Nesterenko–Suslin's observation that applying dim_! to the comparison map ⊞ → \\\\backslash is an isomorphism, and (iii) E_∞-indecomposables w.r.t. ⊞ giving the infinite Steinberg modules. The chain of three identifications is cited but not reproduced. This identification is foundational for every downstream claim.",
      "id": "TC-9",
      "location": "Section 1.2.2, equation eqn:he1-st-heinfty-stl",
      "severity": "minor",
      "suggested_fix": "Add a 'sketch of proof' paragraph for this isomorphism in the introduction, with precise citations to GKRW20 (theorem numbers) and to Nesterenko–Suslin §1. The reader cannot evaluate Theorem 1 without trusting this black box."
    },
    {
      "assessment": "supported",
      "claim": "Conjecture (main gamma) is equivalent in weight n=3 to Goncharov's conjecture [Gon95b 1.15] on the weight-3 polylogarithmic complex Γ_3(F;Q).",
      "evidence": "This is a direct consequence of Theorem polyl-identification (TC-5): under the identifications G_1=F^×_Q, G_2=B_2_Q, G_3=B_3_Q, the weight-3 part of the Chevalley–Eilenberg complex (eqn:polyl-ce) literally becomes B_3(F)_Q → B_2(F)_Q ⊗ F^×_Q → Λ^3 F^×_Q, which is Γ_3(F;Q). The equivalence statement is therefore a tautology given TC-5; only the H^0 = K^M_3 part depends on Matsumoto–Milnor (cited).",
      "id": "TC-10",
      "location": "Section 1.1.4, paragraph following Theorem 1",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Convergence and structural properties of the Rognes rank spectral sequence: E^1_{n,d} ≅ H^{E_∞}_{n,d}(BGL(F)_Q) ⇒ K_d(F)_Q, with d^r-differential of bidegree (-r,-1), compatible with scaling splitting and duality involution, and d^1 determined by the σ-component of the Lie cobracket.",
      "evidence": "The existence and convergence are attributed to Rognes [Rognes] and GKRW18 §13.8 (cited). The four enumerated structural properties (scaling splitting, duality compatibility, d^1 formula, σ-component computability) are bundled into 'Theorem 150' (rank-ss-omnibus) which is in the body. The downstream weight-3 calculation (TC-1, TC-2) depends entirely on items (i)–(iv), so any gap there propagates. The introduction does not derive these; it asserts them.",
      "id": "TC-11",
      "location": "Section 1.4, items (i)–(iv); referencing Theorem 150 (omnibus) and Section 6 (sigma-component)",
      "severity": "minor",
      "suggested_fix": "In the introduction, expand item (iii) with the precise definition of the σ-component (the cited definition only appears later via §6). At minimum, state under what hypotheses item (iv) reduces δ_σ on the critical line to the Lie cobracket — this reduction is the workhorse for the weight-3 computation."
    },
    {
      "assessment": "unsupported",
      "claim": "Existence of a well-defined decomposition operator D^FC_h : FC(V) → FC(V) and validity of the explicit formula in Example 1 / Section 2.6.",
      "evidence": "The construction depends on the 'almost-basis' property of St^∞ ([CRR §3.9]) and on the assertion that for fixed h the only relations among normalized correlators C[0:v_1:…:v_n] with h(v_i)=1 are the shuffle relations. This is a combinatorial/algebraic claim that is highly amenable to symbolic verification (Sage, Macaulay2, or a direct Python/SymPy script) for small n. The paper acknowledges (Acknowledgments) that some n=3 trilogarithm results were obtained by computer-assisted methods (thanks to Steven Charlton), but the paper ships no public artifact (no Sage notebook, no Lean/Coq formalization, no Python script). Per the Proof-as-Code Axiom for math.* fields, an executable artifact verifying (a) closure of the decomposition relation under co-Jacobi, (b) the explicit formula for D^FC_h in V=F^2 and V=F^3, and (c) the shuffle-only relation claim for the h-normalized basis is appropriate and absent.",
      "id": "TC-12",
      "location": "Section 1.3.1, Example 1 (V=F^2), and general formula via Proposition 26.",
      "severity": "major",
      "suggested_fix": "Ship a computational artifact at e.g. code/decomposition_operator.py (or src/proofs/Decomposition.lean / experiments/cobracket_verify/sage_notebook.ipynb) that (i) generates D^FC_h symbolically for n=2,3,4, (ii) verifies the alternating-sign cancellation pattern on T(n) for small n, and (iii) checks co-Jacobi for the cobracket of Theorem polyl-presentation-cobracket on randomly sampled affine bases. A companion repository (cf. GitHub) referenced from the arXiv abstract would discharge this."
    },
    {
      "assessment": "unsupported",
      "claim": "The weight-3 trilogarithm computations in Section 7.3.3 (relied upon for, among other things, the relations defining B_3 and the identification G_3 ≅ B_3 of Theorem polyl-identification) are correct.",
      "evidence": "The Acknowledgments explicitly state: 'We would like to thank Steven Charlton for helping us to establish the results of Section 7.3.3 with computer-assisted methods.' This is a direct admission that the proof relies on computational verification, but the paper does not publish, link, or describe the verification artifact. The reader cannot reproduce or audit the computer-assisted step. Per the Proof-as-Code Axiom for math.KT, this is exactly the situation where a verifiable artifact is mandatory.",
      "id": "TC-13",
      "location": "Section 7.3.3 (referenced in Acknowledgments), supports Theorem polyl-identification at n=3",
      "severity": "major",
      "suggested_fix": "Publish the computer-assisted verification as a reproducible artifact (Sage worksheet, Mathematica notebook, or Python/Julia script) at code/trilogarithm_section_7_3_3/ and reference it from Section 7.3.3 of the paper with a DOI or a Zenodo/GitHub link. Include the input relations, the search procedure, and the output certificate."
    },
    {
      "assessment": "partially_supported",
      "claim": "Koszul property of the commutative algebra of Steinberg modules St under ⊞, with Koszul dual the infinite Steinberg modules St^∞.",
      "evidence": "Cited to [MNP], [MPW23], and [CharltonRadchenkoRudenko]. The introduction does not reprove the Koszulity but uses it as a black box. The three cited works are independent recent papers that converge on this result, lending strong credibility. Marking partially_supported because the audit cannot independently verify the cited proofs from the bounded context.",
      "id": "TC-14",
      "location": "Section 1.2.1 (paragraph 'A crucial property…') and Section 2",
      "severity": "info",
      "suggested_fix": "In the body, briefly indicate which of the three cited proofs of Koszulity is being used (they may have slightly different hypotheses or conventions, e.g. integral vs rational coefficients)."
    },
    {
      "assessment": "supported",
      "claim": "Slope-2 vanishing line: H^{E_∞}_{n,d}(BGL(F)_Q) vanishes for d ≤ 2n-2 with the exception of (n,d)=(1,0).",
      "evidence": "This is the main theorem of [GKRW20] (Galatius–Kupers–Randal-Williams, 'E_∞-cells and general linear groups of infinite fields', Duke 2025) and is cited correctly. Two of the three authors are Kupers (this paper) and the cited work is the immediate predecessor in the same research program. The result is established peer-reviewed mathematics.",
      "id": "TC-15",
      "location": "Section 1.2.1, Figure 1 (fig:gltable1)",
      "severity": "info",
      "suggested_fix": null
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

1. AKKN: A. Alekseev, N. Kawazumi, Y. Kuno, and F. Naef, \emph{The {G}oldman-{T}uraev {L}ie bialgebra in genus zero and the {K}ashiwara-{V}ergne problem}, Adv. Math. 326 (2018), 1--53. \MR{3758425}
2. AMP: A. Ash, J. Miller, and P. Patzt, \emph{Hopf algebras, {S}teinberg modules, and the unstable cohomology of ${SL}_n(\mathbb {Z})$ and ${GL}_n(\mathbb {Z})$}, 2024, arXiv:2404.13776. arXiv:[2404.13776](https://arxiv.org/abs/2404.13776)
3. AguiarMahajan: M. Aguiar and S. Mahajan, \emph{Monoidal functors, species and {H}opf algebras}, CRM Monograph Series, vol. 29, American Mathematical Society, Providence, RI, 2010, With forewords by Kenneth Brown and Stephen Chase and Andr\'{e} Joyal. \MR{2724388}
4. AlekseevTorossian: \bysame, \emph{The {K}ashiwara-{V}ergne conjecture and {D}rinfeld's associators}, Ann. of Math. (2) 175 (2012), no. 2, 415--463. \MR{2877064}
5. AlekseevTorossianNote: A. Alekseev and C. Torossian, Flat connections and trivalent graphs, \url{https://web.archive.org/web/20211028202354/https://webusers.imj-prg.fr/ charles.torossian/publication/trivalent.pdf}, 2009.
6. Arnold: V. I. Arnold, The cohomology ring of the group of dyed braids, Mat. Zametki 5 (1969), 227--231. \MR{242196}
7. AubryChataur: M. Aubry and D. Chataur, Cooperads and coalgebras as closed model categories, J. Pure Appl. Algebra 180 (2003), no. 1-2, 1--23. \MR{1966520}
8. BCGP: F. Brown, M. Chan, S. Galatius, and S. Payne, \emph{Hopf algebras in the cohomology of $A_g$, $GL_n(\mathbb{Z})$, and $SL_n(\mathbb{Z})$}, 2024, arXiv:2405.11528. arXiv:[2405.11528](https://arxiv.org/abs/2405.11528)
9. BCN: D. L. B. Brantner, R. Campos, and J. Nuiten, \emph{P{D} operads and explicit partition {L}ie algebras}, Mem. Amer. Math. Soc. 315 (2025), no. 1597, v+125. \MR{5003477}
10. BD94: A. Beilinson and P. Deligne, \emph{Interpr\'{e}tation motivique de la conjecture de {Z}agier reliant polylogarithmes et r\'{e}gulateurs}, Motives ({S}eattle, {WA}, 1991), Proc. Sympos. Pure Math., vol. 55, Amer. Math. Soc., Providence, RI, 1994, pp. 97--121. \MR{1265552}
11. BDEPS: N. Berry, A. Dubickas, N. D. Elkies, B. Poonen, and C. Smyth, The conjugate dimension of algebraic numbers, Q. J. Math. 55 (2004), no. 3, 237--252. \MR{2082091}
12. BGSII: C. Barwick, S. Glasman, and J. Shah, \emph{Spectral {M}ackey functors and equivariant algebraic {$K$}-theory, {II}}, Tunis. J. Math. 2 (2020), no. 1, 97--146. \MR{3933393}
13. BGSV90: A. Beilinson, A. Varchenko, A. Goncharov, and V. Shekhtman, \emph{Projective geometry and {$K$}-theory}, Algebra i Analiz 2 (1990), no. 3, 78--130. \MR{1073210}
14. BHM: M. B\"{o}kstedt, W. C. Hsiang, and I. Madsen, \emph{The cyclotomic trace and algebraic {$K$}-theory of spaces}, Invent. Math. 111 (1993), no. 3, 465--539. \MR{1202133}
15. BPW: B. Br\"{u}ck, K. I. Piterman, and V. Welker, The common basis complex and the partial decomposition poset, Int. Math. Res. Not. IMRN (2024), no. 18, 12746--12760. \MR{4798648}
16. Barr1968HarrisonHH: M. Barr, Harrison homology, hochschild homology and triples, Journal of Algebra 8 (1968), 314--323.
17. BataninMarkl: M. Batanin and M. Markl, Centers and homotopy centers in enriched monoidal categories, Adv. Math. 230 (2012), no. 4-6, 1811--1858. \MR{2927355}
18. BenMosheSchlank: S. Ben-Moshe and T. M. Schlank, \emph{Higher semiadditive algebraic {K}-theory and redshift}, Compos. Math. 160 (2024), no. 2, 237--287. \MR{4679205}
19. BerglundKoszul: A. Berglund, Koszul spaces, Trans. Amer. Math. Soc. 366 (2014), no. 9, 4551--4569. \MR{3217692}
20. Bezrukavnikov: R. Bezrukavnikov, \emph{Koszul {DG}-algebras arising from configuration spaces}, Geom. Funct. Anal. 4 (1994), no. 2, 119--135. \MR{1262702}
21. BlansBlom: M. Blans and T. Blom, \emph{On the chain rule in {G}oodwillie calculus}, 2024, arXiv:2410.20504. arXiv:[2410.20504](https://arxiv.org/abs/2410.20504)
22. BlansBlomKupers: M. Blans, T. Blom, and A. Kupers, Naturality of $\infty$-categorical bar-cobar duality, in preparation.
23. Bloch: S. J. Bloch, \emph{Higher regulators, algebraic {$K$}-theory, and zeta functions of elliptic curves}, CRM Monograph Series, vol. 11, American Mathematical Society, Providence, RI, 2000. \MR{1760901}
24. BlochKriz: S. Bloch and I. K\v{r}\'{\i}\v{z}, \emph{Mixed {T}ate motives}, Ann. of Math. (2) 140 (1994), no. 3, 557--605. \MR{1307897}
25. BoardmanSS: J. M. Boardman, Conditionally convergent spectral sequences, Homotopy invariant algebraic structures ({B}altimore, {MD}, 1998), Contemp. Math., vol. 239, Amer. Math. Soc., Providence, RI, 1999, pp. 49--84. \MR{1718076}
26. Bol24: V. Bolbachan, \emph{On the {G}oncharov's conjecture in degree $m{-}1$ and weight $m$}, 2024, arXiv:2404.06271. arXiv:[2404.06271](https://arxiv.org/abs/2404.06271)
27. BorelStable: A. Borel, Stable real cohomology of arithmetic groups, Ann. Sci. \'{E}cole Norm. Sup. (4) 7 (1974), 235--272 (1975). \MR{387496}
28. Bro12: F. Brown, \emph{Mixed {T}ate motives over {$\Bbb Z$}}, Ann. of Math. (2) 175 (2012), no. 2, 949--976. \MR{2993755}
29. Brown: K. S. Brown, Cohomology of groups, Graduate Texts in Mathematics, vol. 87, Springer-Verlag, New York, 1994, Corrected reprint of the 1982 original. \MR{1324339}
30. CMRR: S. Charlton, A. Matveiakin, D. Radchenko, and D. Rudenko, \emph{The {H}opf algebra of formal multiple polylogarithms}, 2024.
31. CMRR24: \bysame, \emph{The {H}opf algebra of formal multiple polylogarithms}, Int. Math. Res. Not. IMRN (2026), no. 2, Paper No. rnaf361, 29. \MR{5013247}
32. CampbellZakharevich: J. A. Campbell and I. Zakharevich, \emph{Hilbert's third problem and a conjecture of {G}oncharov}, Adv. Math. 451 (2024), Paper No. 109757, 57. \MR{4759410}
33. Cartier: P. Cartier, \emph{A primer of {H}opf algebras}, Frontiers in number theory, physics, and geometry. {II}, Springer, Berlin, 2007, pp. 537--615. \MR{2290769}
34. Cathelineau: J.-L. Cathelineau, \emph{Homologie du groupe lin\'{e}aire et polylogarithmes (d'apr\`es {A}. {B}. {G}oncharov et d'autres)}, Ast\'{e}risque (1993), no. 216, Exp. No. 772, 5, 311--341, S\'{e}minaire Bourbaki, Vol. 1992/93. \MR{1246402}
35. CharltonRadchenkoRudenko: S. Charlton, D. Radchenko, and D. Rudenko, \emph{Multiple polylogarithms and the {S}teinberg module}, 2025.
36. ChingSalvatore: M. Ching and P. Salvatore, \emph{Koszul duality for topological {$E_n$}-operads}, Proc. Lond. Math. Soc. (3) 125 (2022), no. 1, 1--60. \MR{4456966}
37. Cohen: F. R. Cohen, \emph{On configuration spaces, their homology, and {L}ie algebras}, J. Pure Appl. Algebra 100 (1995), no. 1-3, 19--42. \MR{1344842}
38. ConantVogtmann: J. Conant and K. Vogtmann, \emph{On a theorem of {K}ontsevich}, Algebr. Geom. Topol. 3 (2003), 1167--1224. \MR{2026331}
39. DG05: P. Deligne and A. B. Goncharov, \emph{Groupes fondamentaux motiviques de {T}ate mixte}, Ann. Sci. \'{E}cole Norm. Sup. (4) 38 (2005), no. 1, 1--56. \MR{2136480}
40. Day: B. Day, On closed categories of functors, Reports of the {M}idwest {C}ategory {S}eminar, {IV}, Lecture Notes in Math., Vol. 137, Springer, Berlin-New York, 1970, pp. 1--38. \MR{272852}
41. Del71b: P. Deligne, \emph{Th\'{e}orie de {H}odge. {II}}, Inst. Hautes \'{E}tudes Sci. Publ. Math. (1971), no. 40, 5--57. \MR{498551}
42. Drinfeld: V. G. {Drinfeld}, \emph{On quasitriangular quasi-{H}opf algebras and on a group that is closely connected with {${\rm Gal}(\overline{\bf Q}/{\bf Q})$}}, Algebra i Analiz 2 (1990), no. 4, 149--181, translated in Leningrad Math. J. 2 (1991), no. 4, 829--860. \MR{1080203}
43. Dup20: C. Dupont, \emph{Progr{\`e}s rec{\'e}nts sur la conjecture de {Z}agier et le programme de {G}oncharov [d'apr{\`e}s {G}oncharov, {R}udenko, {G}angl, ...]}, S{\'e}minaire Bourbaki \textbf{73{\`e}me ann{\'e}e} (2021), no. 1176.
44. Felder: M. Felder, \emph{Internally connected graphs and the {K}ashiwara-{V}ergne {L}ie algebra}, Lett. Math. Phys. 108 (2018), no. 6, 1407--1441. \MR{3797752}
45. FengGalatiusVenkatesh: T. Feng, S. Galatius, and A. Venkatesh, \emph{The {G}alois action on symplectic {K}-theory}, Invent. Math. 230 (2022), no. 1, 225--319. \MR{4480148}
46. GKRW18: \bysame, \emph{Cellular {$E_k$}-algebras}, Ast\'{e}risque (2025), no. 460, x+299. \MR{4987221}
47. GKRW19: S. Galatius, A. Kupers, and O. Randal-Williams, \emph{{$E_\infty$}-cells and general linear groups of finite fields}, Ann. Sci. \'{E}c. Norm. Sup\'{e}r. (4) 57 (2024), no. 6, 1845--1882. \MR{4862505}
48. GKRW20: \bysame, \emph{{$E_\infty$}-cells and general linear groups of infinite fields}, Duke Math. J. 174 (2025), no. 14, 2927--3046. \MR{4974473}
49. GarnerLopezFranco: R. Garner and I. L\'{o}pez Franco, Commutativity, J. Pure Appl. Algebra 220 (2016), no. 5, 1707--1751. \MR{3437265}
50. GepnerHaugsengNikolaus: D. Gepner, R. Haugseng, and T. Nikolaus, \emph{Lax colimits and free fibrations in {$\infty$}-categories}, Doc. Math. 22 (2017), 1225--1266. \MR{3690268}
51. GetzlerJones: E. Getzler and J. D. S. Jones, Operads, homotopy algebra and iterated integrals for double loop spaces, 1994, arXiv:hep-th/9403055.
52. GetzlerKapranov: E. Getzler and M. M. Kapranov, Cyclic operads and cyclic homology, Geometry, topology, \& physics, Conf. Proc. Lecture Notes Geom. Topology, IV, Int. Press, Cambridge, MA, 1995, pp. 167--201. \MR{1358617}
53. Gon01: A. Goncharov, \emph{Multiple polylogarithms and mixed {T}ate motives}, arXiv:math/0103059 [math.AG], 2001.
54. Gon19: A. Goncharov, Hodge correlators, J. Reine Angew. Math. 748 (2019), 1--138. \MR{3918430}
55. Gon95: \bysame, Polylogarithms in arithmetic and geometry, Proceedings of the {I}nternational {C}ongress of {M}athematicians, {V}ol. 1, 2 ({Z}\"{u}rich, 1994), Birkh\"{a}user, Basel, 1995, pp. 374--387. \MR{1403938}
56. Gon95b: A. Goncharov, Geometry of configurations, polylogarithms, and motivic cohomology, Adv. Math. 114 (1995), no. 2, 197--318. \MR{1348706}
57. Gon99: Alexander Goncharov, \emph{Volumes of hyperbolic manifolds and mixed {T}ate motives}, J. Amer. Math. Soc. 12 (1999), no. 2, 569--618. \MR{1649192}
58. Goncharov01: A. B. Goncharov, \emph{The dihedral {L}ie algebras and {G}alois symmetries of {$\pi_1^{(l)}(\Bbb P^1-(\{0,\infty\}\cup\mu_N))$}}, Duke Math. J. 110 (2001), no. 3, 397--487. \MR{1869113}
59. GoncharovEuler: \bysame, Euler complexes and geometry of modular varieties, Geom. Funct. Anal. 17 (2008), no. 6, 1872--1914. \MR{2399086}
60. GrinbergReiner: D. Grinberg and V. Reiner, Hopf algebras in combinatorics, 2014, arXiv:1409.8356. arXiv:[1409.8356](https://arxiv.org/abs/1409.8356)
61. HHLN: R. Haugseng, F. Hebestreit, S. Linskens, and J. Nuiten, Lax monoidal adjunctions, two-variable fibrations and the calculus of mates, Proc. Lond. Math. Soc. (3) 127 (2023), no. 4, 889--957. \MR{4655344}
62. HHS: P. Hanlon, P. Hersh, and J. Shareshian, \emph{A ${G}l_n(q)$ analogue of the partition lattice}, arXiv:2505.02202, 2025. arXiv:[2505.02202](https://arxiv.org/abs/2505.02202)
63. HainClassical: \bysame, Classical polylogarithms, Motives ({S}eattle, {WA}, 1991), Proc. Sympos. Pure Math., vol. 55, Amer. Math. Soc., Providence, RI, 1994, pp. 3--42. \MR{1265550}
64. HainIndec: R. M. Hain, On the indecomposable elements of the bar construction, Proc. Amer. Math. Soc. 98 (1986), no. 2, 312--316. \MR{854039}
65. Harder: G. Harder, \emph{Die {K}ohomologie {$S$}-arithmetischer {G}ruppen \"{u}ber {F}unktionenk\"{o}rpern}, Invent. Math. 42 (1977), 135--175. \MR{473102}
66. HaugsengMonads: R. Haugseng, \emph{On lax transformations, adjunctions, and monads in {$(\infty,2)$}-categories}, High. Struct. 5 (2021), no. 1, 244--281. \MR{4367222}
67. HaugsengSS: \bysame, \emph{{$\infty$}-operads via symmetric sequences}, Math. Z. 301 (2022), no. 1, 115--171. \MR{4405646}
68. Heine: H. Heine, A monadicity theorem for higher algebraic structures, 2017, arXiv:1712.00555. arXiv:[1712.00555](https://arxiv.org/abs/1712.00555)
69. HeineMM: \bysame, \emph{A derived {M}ilnor-{M}oore theorem}, Selecta Math. (N.S.) 32 (2026), no. 2, Paper No. 39. \MR{5060174}
70. HeutsKoszul: G. Heuts, \emph{Koszul duality and a conjecture of {F}rancis--{G}aitsgory}, 2024, arXiv:2408.06173. arXiv:[2408.06173](https://arxiv.org/abs/2408.06173)
71. HeutsLand: G. S. K. S. Heuts and M. Land, \emph{Koszul duality of ${E}_n$-algebras and ${E}_n$-operads}, in preparation.
72. HeutsLandFormality: \bysame, \emph{Formality of $\mathbb{E}_n$-algebras and cochains on spheres}, 2024, arXiv:2407.00790. arXiv:[2407.00790](https://arxiv.org/abs/2407.00790)
73. Hinich: \bysame, \emph{Yoneda lemma for enriched {$\infty$}-categories}, Adv. Math. 367 (2020), 107129, 119. \MR{4080581}
74. HinichRectification: V. Hinich, Rectification of algebras and modules, Doc. Math. 20 (2015), 879--926. \MR{3404213}
75. KKMMW: I. Klang, J. Kuijper, C. Malkiewich, D. Mehrle, and T. Wittich, \emph{Higher spherical scissors congruence {I}: {H}opf algebra}, arxiv:2509.18009. arXiv:[2509.18009](https://arxiv.org/abs/2509.18009)
76. KRS2: A. Kupers, D. Rudenko, and I. Sierra, Mixed tate motives over number fields, 2026, in preparation.
77. KahnSun: B. Kahn and F. Sun, On universal modular symbols, 2014, arXiv:1407.0475. arXiv:[1407.0475](https://arxiv.org/abs/1407.0475)
78. KontsevichFormal: M. Kontsevich, Formal (non)commutative symplectic geometry, The {G}elfand {M}athematical {S}eminars, 1990--1992, Birkh\"{a}user Boston, Boston, MA, 1993, pp. 173--187. \MR{1247289}
79. Levine: M. Levine, \emph{Tate motives and the vanishing conjectures for algebraic {$K$}-theory}, Algebraic {$K$}-theory and algebraic topology ({L}ake {L}ouise, {AB}, 1991), NATO Adv. Sci. Inst. Ser. C: Math. Phys. Sci., vol. 407, Kluwer Acad. Publ., Dordrecht, 1993, pp. 167--188. \MR{1367296}
80. LevineBloch: \bysame, \emph{Bloch's higher {C}how groups revisited}, no. 226, 1994, $K$-theory (Strasbourg, 1992), pp. 10, 235--320. \MR{1317122}
81. LinskensNardinPol: S. Linskens, D. Nardin, and L. Pol, Global homotopy theory via partially lax limits, Geom. Topol. 29 (2025), no. 3, 1345--1440. \MR{4918109}
82. LodayCyclic: J.-L. Loday, Cyclic homology, second ed., Grundlehren der mathematischen Wissenschaften [Fundamental Principles of Mathematical Sciences], vol. 301, Springer-Verlag, Berlin, 1998, Appendix E by Mar\'{\i}a O. Ronco, Chapter 13 by the author in collaboration with Teimuraz Pirashvili. \MR{1600246}
83. LodayVallette: J.-L. Loday and B. Vallette, Algebraic operads, Grundlehren der mathematischen Wissenschaften [Fundamental Principles of Mathematical Sciences], vol. 346, Springer, Heidelberg, 2012. \MR{2954392}
84. LurieHA: \bysame, \emph{{Higher algebra}}, September 2017 version (2017).
85. LurieHTT: J. Lurie, Higher topos theory, Annals of Mathematics Studies, vol. 170, Princeton University Press, 2009. \MR{2522659}
86. MNP: J. Miller, R. Nagpal, and P. Patzt, Stability in the high-dimensional cohomology of congruence subgroups, Compos. Math. 156 (2020), no. 4, 822--861. \MR{4079629}
87. MPPII: J. Miller, P. Patzt, and A. Putman, \emph{Homological vanishing for the {S}teinberg representation {II}: reductive groups and integral conjectures}, 2025, arXiv:2509.01559. arXiv:[2509.01559](https://arxiv.org/abs/2509.01559)
88. MPW23: J. Miller, P. Patzt, and J. C. H. Wilson, \emph{On rank filtrations of algebraic {K}-theory and {S}teinberg modules}, 2023, arXiv:2303.00245. arXiv:[2303.00245](https://arxiv.org/abs/2303.00245)
89. MVW: C. Mazza, V. Voevodsky, and C. Weibel, Lecture notes on motivic cohomology, Clay Mathematics Monographs, vol. 2, American Mathematical Society, Providence, RI; Clay Mathematics Institute, Cambridge, MA, 2006. \MR{2242284}
90. Mal20: N. Malkin, \emph{Shuffle relations for {H}odge and motivic correlators}, arXiv:2003.06521 [math.AG], 2020. arXiv:[2003.06521](https://arxiv.org/abs/2003.06521)
91. Michaelis: W. Michaelis, Lie coalgebras, Adv. in Math. 38 (1980), no. 1, 1--54. \MR{594993}
92. Mirzaii: B. Mirzaii, \emph{Bloch-{W}igner theorem over rings with many units}, Math. Z. 268 (2011), no. 1-2, 329--346. \MR{2805438}
93. MirzaiiErratum: \bysame, \emph{Erratum to: {B}loch-{W}igner theorem over rings with many units [mr2805438]}, Math. Z. 275 (2013), no. 1-2, 653--655. \MR{3101826}
94. NardinShah: D. Nardin and J. Shah, Parametrized and equivariant higher algebra, 2022, arXiv:2203.00072. arXiv:[2203.00072](https://arxiv.org/abs/2203.00072)
95. NesterenkoSuslin: Yu. P. Nesterenko and A. A. Suslin, \emph{Homology of the general linear group over a local ring, and {M}ilnor's {$K$}-theory}, Izv. Akad. Nauk SSSR Ser. Mat. 53 (1989), no. 1, 121--146. \MR{992981}
96. PRY: D. Petersen, V. Roca i Lucio, and S. Yalin, \emph{Unifying {K}oszul dualities via point-set models}, 2026, arXiv:2603.29910. arXiv:[2603.29910](https://arxiv.org/abs/2603.29910)
97. PortaTeyssier: M. Porta and J.-B. Teyssier, Day's convolution for pro-$\infty$-categories, \url{http://jbteyssier.com/papers/jbteyssier_day.pdf}.
98. Priddy: S. B. Priddy, Koszul resolutions, Trans. Amer. Math. Soc. 152 (1970), 39--60. \MR{265437}
99. QuillenFiniteGeneration: D. Quillen, \emph{Finite generation of the groups {$K\sb{i}$} of rings of algebraic integers}, Algebraic {$K$}-theory, {I}: {H}igher {$K$}-theories ({P}roc. {C}onf., {B}attelle {M}emorial {I}nst., {S}eattle, {W}ash., 1972), Lecture Notes in Math., Vol. 341, Springer, Berlin-New York, 1973, pp. 179--198. \MR{349812}
100. RWchromatic: O. Randal-Williams, A chromatic approach to homological stability, 2025, arXiv:2508.20629. arXiv:[2508.20629](https://arxiv.org/abs/2508.20629)
101. Ramakrishnan: D. Ramakrishnan, On the monodromy of higher logarithms, Proc. Amer. Math. Soc. 85 (1982), no. 4, 596--599. \MR{660611}
102. Robinson: A. Robinson, Partition complexes, duality and integral tree representations, Algebr. Geom. Topol. 4 (2004), 943--960. \MR{2100687}
103. Rognes: J. Rognes, \emph{A spectrum level rank filtration in algebraic {$K$}-theory}, Topology 31 (1992), no. 4, 813--845. \MR{1191383}
104. RognesMotivic: \bysame, Motivic complexes from the stable rank filtration, 2010, \url{https://www.mn.uio.no/math/personer/vit/rognes/papers/bergen10.pdf}.
105. RognesWeight: \bysame, The weight and rank filtrations, 2021, arXiv:2110.12264. arXiv:[2110.12264](https://arxiv.org/abs/2110.12264)
106. SegalConfiguration: G. Segal, Configuration-spaces and iterated loop-spaces, Invent. Math. 21 (1973), 213--221. \MR{331377}
107. SeveraWillwacher: P. {\v{S}}evera and T. Willwacher, Equivalence of formalities of the little discs operad, Duke Math. J. 160 (2011), no. 1, 175--206. \MR{2838354}
108. Sinha: D. P. Sinha, The (non-equivariant) homology of the little disks operad, O{PERADS} 2009, S\'{e}min. Congr., vol. 26, Soc. Math. France, Paris, 2013, pp. 253--279. \MR{3203375}
109. Souderes: I. Soud\`eres, \emph{A relative basis for mixed {T}ate motives over the projective line minus three points}, Commun. Number Theory Phys. 10 (2016), no. 1, 87--131. \MR{3521910}
110. Soule: Christophe Soul\'e, \emph{Op\'erations en {$K$}-th\'eorie alg\'ebrique}, Canad. J. Math. 37 (1985), no. 3, 488--550. \MR{787114}
111. Sun: F. Sun, \emph{Algebraic {K}-theory and modular symbols}, 2016, arXiv:1604.04700. arXiv:[1604.04700](https://arxiv.org/abs/1604.04700)
112. Sus84: A. Suslin, \emph{Homology of {${\rm GL}_{n}$}, characteristic classes and {M}ilnor {$K$}-theory}, vol. 165, 1984, Algebraic geometry and its applications, pp. 188--204. \MR{752941}
113. Sus90: \bysame, \emph{{$K_3$} of a field, and the {B}loch group}, vol. 183, 1990, Translated in Proc. Steklov Inst. Math. {1991}, no. 4, 217--239, Galois theory, rings, algebraic groups and their applications (Russian), pp. 180--199, 229. \MR{1092031}
114. ToriiDuoidal: \bysame, \emph{On duoidal {$\infty$}-categories}, J. Homotopy Relat. Struct. 20 (2025), no. 1, 125--162. \MR{4868047}
115. ToriiHigher: T. Torii, On higher monoidal $\infty$-categories, 2021, arXiv:2111.00158. arXiv:[2111.00158](https://arxiv.org/abs/2111.00158)
116. ToriiMult: \bysame, Multiplicative structures on comodules in higher categories, 2025.
117. Weibel: C.A. Weibel, \emph{The {$K$}-book}, Graduate Studies in Mathematics, vol. 145, American Mathematical Society, Providence, RI, 2013, An introduction to algebraic $K$-theory. \MR{3076731}
118. Whitehouse: S. Whitehouse, The integral tree representation of the symmetric group, J. Algebraic Combin. 13 (2001), no. 3, 317--326. \MR{1836907}
119. Wojtkowiak: Z. Wojtkowiak, The basic structure of polylogarithmic functional equations, Structural properties of polylogarithms, Math. Surveys Monogr., vol. 37, Amer. Math. Soc., Providence, RI, 1991, pp. 205--231. \MR{1148381}
120. Wu: H. Wu, \emph{A {H}opf algebra model for {D}wyer's tame spaces}, Ph.D. thesis, EFPL, 2023, \url{https://infoscience.epfl.ch/entities/publication/89700c3d-c155-4cd1-8ac6-0973ca4ee813}.
121. Zagier: D. Zagier, The dilogarithm function, Frontiers in number theory, physics, and geometry. {II}, Springer, Berlin, 2007, pp. 3--65. \MR{2290758}
122. deJeu: R. De Jeu, A remark on the rank conjecture, $K$-Theory 25 (2002), no. 3, 215--231. \MR{1909867}

