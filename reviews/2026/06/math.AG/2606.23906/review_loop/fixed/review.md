# \'Etale Fundamental Groups -- a geometric and topological approach to fundamental groups in algebraic geometry

GrokRxiv review of [arXiv:2606.23906](https://arxiv.org/abs/2606.23906) · `math.AG`

_Authors_: Loris De Vos

## TL;DR

The thesis presents a systematic pedagogical exposition of fundamental groups across three domains: classical covering space theory and Galois theory (Chapter 1), the étale fundamental group of schemes (Chapter 2), and the Tannakian approach connecting all three (Chapter 3). The technical_correctness specialist (confidence 0.70) rated the work mostly_sound with only minor presentational errors and no headline claim found false; TC13 flags a major absence—no machine-checked formalization of any load-bearing result. The reproducibility specialist (confidence 0.88) assigned a score of 0.22, citing two critical-severity concerns: absence of a proof repository and lack of a formal proof artifact for the headline étale-vs-topological comparison theorem, plus two major concerns for the Tannakian and Nori comparisons. The novelty specialist (confidence 0.75) assigned 0.08 with verdict marginal, finding the thesis reproduces constructions from SGA 1, Szamuely, Schauenburg, and Nori without novel mathematical content. The citation specialist (confidence 0.72) flagged two missing references central to the Tannakian chapter—Deligne–Milne 'Tannakian Categories' (1982) and Saavedra Rivano 'Catégories Tannakiennes' (1972)—along with reliance on an unpublished student thesis (Horosiewicz 2022) as a primary Chapter 2 proof source. Specialists are in agreement: the exposition is clear and mostly correct, but the thesis lacks novel contributions, lacks formal proof artifacts, and under-references its core Tannakian framework. The paper's field (math.AG) is code-amenable under the recommendation gate, and both technical_correctness (TC13, major) and reproducibility (critical) flagged missing proof-as-code artifacts, mandating major_revision.

_Recommendation_: **Major revision** · _Confidence_: 82%

## Strengths

- Self-contained, pedagogically clear exposition unifying three foundational frameworks—topological covering theory, étale fundamental groups, and Tannakian duality—within a single coherent narrative.
- All headline theorems are technically correct as stated; the technical_correctness specialist found only minor presentational errors and no false claim across Chapters 1–3.
- Bibliography is appropriately anchored in primary sources (SGA 1, EGA IV, Hartshorne, Szamuely, Serre's GAGA), with stable-tag Stacks Project citations that will not rot.
- The comparison between the étale and topological fundamental groups over ℂ is carefully set up via GAGA and transcendental methods, providing a useful bridge for readers coming from topology.

## Weaknesses

- The thesis contains no novel mathematical contributions: every construction—étale fundamental group (SGA 1 / Szamuely), Tannakian reconstruction (Schauenburg), Nori fundamental group scheme (Nori 1982)—is reproduced from existing literature, yielding a novelty score of 0.08.
- No machine-checked proof artifact accompanies any load-bearing claim; both technical_correctness (TC13, major) and reproducibility (critical) identify this absence as a significant gap for a math.AG thesis whose central results (Galois correspondence, étale–topological comparison, Tannakian reconstruction) are formalizable in Lean/Mathlib.
- The Tannakian chapter omits the two canonical foundational references—Deligne–Milne 'Tannakian Categories' (1982, LNM 900) and Saavedra Rivano 'Catégories Tannakiennes' (1972, LNM 265)—leaving the precise fibre-functor framework employed without its primary citations.
- Multiple proofs contain presentational defects that impede verification: notation collision in Theorem 34 (δ used for two distinct objects), conflation of group elements with deck transformations in Proposition 21, reversed natural-transformation direction in Theorem 75, and typographic errors throughout.
- Reliance on the unpublished student thesis Horosiewicz (2022) as a primary proof source for 'many of the following proofs and concepts' in Chapter 2 is unusual and reduces verifiability; the extent of adaptation versus original presentation is not delineated.

## Revision Targets

- [ ] **Manuscript: Whole thesis (Chapters 1–3); particularly Theorems 26, 56, 67, 73, 75, and the (truncated) Ta...**
  - Location: `Whole thesis (Chapters 1–3); particularly Theorems 26, 56, 67, 73, 75, and the (truncated) Tannakian reconstruction in Chapter 3`
  - Evidence: The thesis is entirely informal LaTeX prose with diagram-chase proofs. Foundational results such as Galois correspondence (Krull’s theorem), the equivalence Cov(X)≃π_1-Set, the Tannakian fundamental group construction, and the comparison theorem between π_1^{ét} and the profinite completion of π_1^{top} have been (or could be) formalised in Lean’s Mathlib / Coq / Agda, and a thesis whose stated aim is a ‘unifying’ treatment would substantially benefit from at least the headline correspondence being machine-checked. No such artifact accompanies the submission.
  - Required change: Add a companion repository — e.g. src/proofs/CoveringSpaceGaloisCorrespondence.lean formalising Theorem 26 in Lean/Mathlib, src/proofs/KrullInfiniteGalois.lean for Theorem 52, and src/proofs/TannakianReconstruction.lean for the Hopf-algebra reconstruction of Proposition 222 / Lemma 224 — and link these from the introduction.
  - Verification: Re-review should confirm `Whole thesis (Chapters 1–3); particularly Theorems 26, 56, 67, 73, 75, and the (truncated) Tannakian reconstruction in Chapter 3` is corrected or justified.
- [ ] **Manuscript: Whole thesis (Chapters 1–3); particularly Theorems 26, 56, 67, 73, 75, and the (truncated) Ta...**
  - Location: `Whole thesis (Chapters 1–3); particularly Theorems 26, 56, 67, 73, 75, and the (truncated) Tannakian reconstruction in Chapter 3`
  - Evidence: The thesis is entirely informal LaTeX prose with diagram-chase proofs. Foundational results such as Galois correspondence (Krull’s theorem), the equivalence Cov(X)≃π_1-Set, the Tannakian fundamental group construction, and the comparison theorem between π_1^{ét} and the profinite completion of π_1^{top} have been (or could be) formalised in Lean’s Mathlib / Coq / Agda, and a thesis whose stated aim is a ‘unifying’ treatment would substantially benefit from at least the headline correspondence being machine-checked. No such artifact accompanies the submission.
  - Required change: Add a companion repository — e.g. src/proofs/CoveringSpaceGaloisCorrespondence.lean formalising Theorem 26 in Lean/Mathlib, src/proofs/KrullInfiniteGalois.lean for Theorem 52, and src/proofs/TannakianReconstruction.lean for the Hopf-algebra reconstruction of Proposition 222 / Lemma 224 — and link these from the introduction.
  - Verification: Re-review should confirm `Whole thesis (Chapters 1–3); particularly Theorems 26, 56, 67, 73, 75, and the (truncated) Tannakian reconstruction in Chapter 3` is corrected or justified.
- [ ] **Bibliography: Tannakian Categories**
  - Location: bibliography entry: `Tannakian Categories`
  - Evidence: The thesis devotes an entire chapter to Tannakian duality but does not cite the canonical Deligne–Milne article 'Tannakian Categories' (1982, in Hodge Cycles, Motives, and Shimura Varieties, Lecture Notes in Mathematics 900), which is the standard reference for neutral Tannakian categories and the precise framework employed.
  - Required change: Add a bibliography entry for `Tannakian Categories` and cite it where the affected method or claim is introduced, or explicitly justify its omission.
  - Verification: Re-review should confirm the bibliography and citation context address this reference.
- [ ] **Manuscript: Whole thesis (Chapters 1–3); particularly Theorems 26, 56, 67, 73, 75, and the (truncated) Ta...**
  - Location: `Whole thesis (Chapters 1–3); particularly Theorems 26, 56, 67, 73, 75, and the (truncated) Tannakian reconstruction in Chapter 3`
  - Evidence: The thesis is entirely informal LaTeX prose with diagram-chase proofs. Foundational results such as Galois correspondence (Krull’s theorem), the equivalence Cov(X)≃π_1-Set, the Tannakian fundamental group construction, and the comparison theorem between π_1^{ét} and the profinite completion of π_1^{top} have been (or could be) formalised in Lean’s Mathlib / Coq / Agda, and a thesis whose stated aim is a ‘unifying’ treatment would substantially benefit from at least the headline correspondence being machine-checked. No such artifact accompanies the submission.
  - Required change: Add a companion repository — e.g. src/proofs/CoveringSpaceGaloisCorrespondence.lean formalising Theorem 26 in Lean/Mathlib, src/proofs/KrullInfiniteGalois.lean for Theorem 52, and src/proofs/TannakianReconstruction.lean for the Hopf-algebra reconstruction of Proposition 222 / Lemma 224 — and link these from the introduction.
  - Verification: Re-review should confirm `Whole thesis (Chapters 1–3); particularly Theorems 26, 56, 67, 73, 75, and the (truncated) Tannakian reconstruction in Chapter 3` is corrected or justified.
- [ ] **Code release and entrypoints**
  - Location: code/reproducibility artifacts: `code release and execution entrypoints`
  - Evidence: No repository, license, commit, release, or machine-checkable proof artifact is provided for the main mathematical development. A reproducibility package such as formal/EtaleFundamentalGroups/Thesis.lean with pinned dependencies would be needed to independently verify the load-bearing claims.
  - Required change: Release the source code, scripts, model configuration, and execution entrypoints needed to regenerate the reported tables, or document why those artifacts cannot be released.
  - Verification: Re-review should confirm runnable code or a documented non-release justification is present.

## Open Questions

- What, if any, is the novel mathematical contribution beyond pedagogical synthesis? Is there a result, comparison, or construction the author claims as original?
- Would the author provide a companion Lean/Mathlib or Coq formalization of at least the headline comparison theorem (étale π₁ ≅ profinite completion of topological π₁ for connected finite-type ℂ-schemes)?
- Why are Deligne–Milne 'Tannakian Categories' (1982) and Saavedra Rivano 'Catégories Tannakiennes' (1972) absent from the bibliography, given that they are the foundational references for the neutral Tannakian framework employed throughout Chapter 3?
- Can the author clarify which proofs in Chapter 2 are direct adaptations of Horosiewicz (2022) and which represent independent presentations, and can published sources be substituted where available?
- The Chow citation uses the 2018 reprint but the text attributes the result to 'Chow 1949'; can the bibliography be corrected to cite the original Amer. J. Math. 71 (1949), 893–914 publication?

## Per-Agent Reviews

### citation (`claude-sonnet-4-6`) — status: `warn`

```json
{
  "confidence": 0.72,
  "entries": [
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Maurice Auslander",
          "D. A. Buchsbaum"
        ],
        "doi": "10.1073/pnas.45.5.733",
        "key": "Auslander_Buchsbaum",
        "raw": "Auslander, Maurice and Buchsbaum, D. A., Unique factorization in regular local rings, Proc. Natl. Acad. Sci. USA, vol. 45, pp. 733–734, 1959",
        "title": "Unique factorization in regular local rings",
        "url": "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC222624",
        "venue": "Proceedings of the National Academy of Sciences of the United States of America",
        "year": 1959
      },
      "exists": null,
      "explanation": "Cited for the Auslander–Buchsbaum theorem that regular local rings are UFDs, used to establish normality properties needed in the theory of étale morphisms.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Peter J. Cameron"
        ],
        "doi": null,
        "key": "Cameron_groups",
        "raw": "Cameron, Peter J., Permutation groups, Lond. Math. Soc. Stud. Texts 45, Cambridge University Press, 1999",
        "title": "Permutation groups",
        "url": null,
        "venue": "London Mathematical Society Student Texts",
        "year": 1999
      },
      "exists": null,
      "explanation": "Cited for Theorem 1.3 on the classification of transitive G-spaces by stabilisers, which underpins the Galois correspondence developed in the covering space chapter.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Wei-Liang Chow"
        ],
        "doi": null,
        "key": "Chow",
        "raw": "Chow, Wei-Liang, On compact complex analytic varieties, in Complex geometry from Riemann to Kähler-Einstein and Calabi-Yau, International Press/Higher Education Press, 2018, pp. 189–206",
        "title": "On compact complex analytic varieties",
        "url": null,
        "venue": "Complex geometry from Riemann to Kähler-Einstein and Calabi-Yau",
        "year": 2018
      },
      "exists": null,
      "explanation": "Chow's theorem comparing algebraic and analytic subvarieties of projective space is a key result in the transcendental methods section.",
      "notes": "The text attributes this result to 'Chow from 1949' but cites a 2018 reprint volume; readers may find the year mismatch confusing. The original paper appeared in Amer. J. Math. 71 (1949), 893–914.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Sorin Dăscălescu",
          "Constantin Năstăsescu",
          "Şerban Raianu"
        ],
        "doi": null,
        "key": "DNR",
        "raw": "Dăscălescu, Sorin and Năstăsescu, Constantin and Raianu, Şerban, Hopf algebras. An introduction, Pure Appl. Math., Marcel Dekker 235, Marcel Dekker, 2001",
        "title": "Hopf algebras. An introduction",
        "url": null,
        "venue": "Pure and Applied Mathematics, Marcel Dekker",
        "year": 2001
      },
      "exists": null,
      "explanation": "Cited in the category theory appendix for a coalgebra corollary related to the Tannakian machinery.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Simon Donaldson"
        ],
        "doi": null,
        "key": "Donaldson",
        "raw": "Donaldson, Simon, Riemann surfaces, Oxf. Grad. Texts Math. 22, Oxford University Press, 2011",
        "title": "Riemann surfaces",
        "url": null,
        "venue": "Oxford Graduate Texts in Mathematics",
        "year": 2011
      },
      "exists": null,
      "explanation": "Cited multiple times in the transcendental methods section for results on branched covers, properness, and Riemann surfaces, directly supporting the comparison between algebraic and analytic covers.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "A. Grothendieck"
        ],
        "doi": "10.1007/BF02684343",
        "key": "EGA",
        "raw": "Grothendieck, A., Éléments de géométrie algébrique. IV: Étude locale des schémas et des morphismes de schémas, Publ. Math. IHÉS 28, pp. 1–255, 1966",
        "title": "Éléments de géométrie algébrique. IV: Étude locale des schémas et des morphismes de schémas",
        "url": "https://eudml.org/doc/103860",
        "venue": "Publications Mathématiques de l'IHÉS",
        "year": 1966
      },
      "exists": null,
      "explanation": "Primary source for the local study of étale and flat morphisms, cited for specific theorems on unramifiedness and flatness central to the construction of the étale fundamental group.",
      "notes": "Only EGA IV is cited; earlier EGA volumes may also be relevant background but are not explicitly referenced.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "David Eisenbud"
        ],
        "doi": null,
        "key": "Eisenbud",
        "raw": "Eisenbud, David, Commutative algebra. With a view toward algebraic geometry, Grad. Texts Math. 150, Springer-Verlag, 1995",
        "title": "Commutative algebra. With a view toward algebraic geometry",
        "url": null,
        "venue": "Graduate Texts in Mathematics",
        "year": 1995
      },
      "exists": null,
      "explanation": "A standard commutative algebra reference cited throughout for results on UFDs, normality, nilradicals, and algebraic foundations underlying scheme theory.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Pavel Etingof",
          "Shlomo Gelaki",
          "Dmitri Nikshych",
          "Victor Ostrik"
        ],
        "doi": "10.1090/surv/205",
        "key": "Etingof",
        "raw": "Etingof, Pavel and Gelaki, Shlomo and Nikshych, Dmitri and Ostrik, Victor, Tensor categories, Math. Surv. Monogr. 205, AMS, 2015",
        "title": "Tensor categories",
        "url": null,
        "venue": "Mathematical Surveys and Monographs",
        "year": 2015
      },
      "exists": null,
      "explanation": "Cited in the Tannakian chapter for Morita equivalence and tensor category results, providing modern categorical background for the linearisation approach to fundamental groups.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Otto Forster"
        ],
        "doi": null,
        "key": "Forster",
        "raw": "Forster, Otto, Lectures on Riemann surfaces, Grad. Texts Math. 81, Springer, 1981",
        "title": "Lectures on Riemann surfaces",
        "url": null,
        "venue": "Graduate Texts in Mathematics",
        "year": 1981
      },
      "exists": null,
      "explanation": "Cited for a result on sections of analytic sheaves over discs, supporting the analogy between Riemann surface coverings and étale coverings.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Robin Hartshorne"
        ],
        "doi": null,
        "key": "Hartshorne",
        "raw": "Hartshorne, Robin, Algebraic geometry. Corr. 3rd printing, Grad. Texts Math. 52, Springer, 1983",
        "title": "Algebraic geometry",
        "url": null,
        "venue": "Graduate Texts in Mathematics",
        "year": 1983
      },
      "exists": null,
      "explanation": "The most heavily cited reference, used throughout for foundational results on schemes, morphisms, coherent sheaves, and projective geometry.",
      "notes": "One citation context appears under 'Topological Covering Spaces and Galois Theory' without a clear proposition reference, which is unusual since Hartshorne is an algebraic geometry text; the citation may be mislocated in that section.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Allen Hatcher"
        ],
        "doi": null,
        "key": "Hatcher",
        "raw": "Hatcher, Allen, Algebraic topology, Cambridge University Press, 2002",
        "title": "Algebraic topology",
        "url": null,
        "venue": null,
        "year": 2002
      },
      "exists": null,
      "explanation": "Primary reference for the topological foundations chapter, cited for the fundamental group, covering space theory, van Kampen's theorem, and CW complex topology.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "John M. Lee"
        ],
        "doi": "10.1007/978-1-4419-7940-7",
        "key": "Intro_manifolds",
        "raw": "Lee, John M., Introduction to topological manifolds, 2nd ed., Grad. Texts Math. 202, Springer, 2011",
        "title": "Introduction to topological manifolds",
        "url": null,
        "venue": "Graduate Texts in Mathematics",
        "year": 2011
      },
      "exists": null,
      "explanation": "Cited for Tychonoff's theorem and covering space classification results supporting the topological prerequisites established in the first chapter.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Serge Lang"
        ],
        "doi": null,
        "key": "Lang_algebra",
        "raw": "Lang, Serge, Algebra, 3rd revised ed., Grad. Texts Math. 211, Springer, 2002",
        "title": "Algebra",
        "url": null,
        "venue": "Graduate Texts in Mathematics",
        "year": 2002
      },
      "exists": null,
      "explanation": "A primary algebra reference cited extensively for Galois theory, field extensions, ring theory, and module theory underpinning the algebraic aspects of the thesis.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Hendrik W. Lenstra"
        ],
        "doi": null,
        "key": "Lenstra",
        "raw": "Hendrik W. Lenstra, Galois theory for schemes, 1985",
        "title": "Galois theory for schemes",
        "url": "https://api.semanticscholar.org/CorpusID:59409422",
        "venue": null,
        "year": 1985
      },
      "exists": null,
      "explanation": "Cited in the introduction as an alternative axiomatic approach to the étale fundamental group via Galois categories, directly relevant to the paper's central construction.",
      "notes": "The entry lacks venue information; these are unpublished lecture notes from the University of Amsterdam. The URL points to a SemanticScholar metadata page rather than the source document.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Saunders Mac Lane"
        ],
        "doi": "book/10.1007/978-1-4757-4721-8",
        "key": "McLane_Sau",
        "raw": "Mac Lane, Saunders, Categories for the working mathematician, 2nd ed., Grad. Texts Math. 5, Springer, 1998",
        "title": "Categories for the working mathematician",
        "url": null,
        "venue": "Graduate Texts in Mathematics",
        "year": 1998
      },
      "exists": null,
      "explanation": "Cited throughout the category theory appendix and Tannakian chapter for limits, adjunctions, monoidal categories, and Mac Lane's coherence theorem.",
      "notes": "The doi field uses the non-standard form 'book/10.1007/...' rather than a bare DOI string beginning with '10.'; this may cause issues with automated resolvers.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "J. S. Milne"
        ],
        "doi": "10.1017/9781316711736",
        "key": "Milne_alg_group",
        "raw": "Milne, J. S., Algebraic groups. The theory of group schemes of finite type over a field, Camb. Stud. Adv. Math. 170, Cambridge University Press, 2017",
        "title": "Algebraic groups. The theory of group schemes of finite type over a field",
        "url": null,
        "venue": "Cambridge Studies in Advanced Mathematics",
        "year": 2017
      },
      "exists": null,
      "explanation": "Cited in the Tannakian chapter for a result on algebraic groups, connecting the group scheme perspective to the Tannakian framework.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Madhav V. Nori"
        ],
        "doi": "10.1007/BF02967978",
        "key": "Nori",
        "raw": "Nori, Madhav V., The fundamental group-scheme, Proc. Indian Acad. Sci., Math. Sci., vol. 91, pp. 73–122, 1982",
        "title": "The fundamental group-scheme",
        "url": null,
        "venue": "Proceedings of the Indian Academy of Sciences. Mathematical Sciences",
        "year": 1982
      },
      "exists": null,
      "explanation": "Central reference for the final section on Nori's fundamental group scheme and its relationship to the Tannakian formalism and the étale fundamental group.",
      "notes": "The text describes this as 'Nori in his PhD thesis' but the citation points to a published journal article (1982). The journal article is the appropriate published reference; the phrasing may mislead readers.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "David Mumford"
        ],
        "doi": "10.1007/978-3-662-21581-4",
        "key": "Red_Book",
        "raw": "Mumford, David, The red book of varieties and schemes, Lect. Notes Math. 1358, Springer-Verlag, 1988",
        "title": "The red book of varieties and schemes",
        "url": null,
        "venue": "Lecture Notes in Mathematics",
        "year": 1988
      },
      "exists": null,
      "explanation": "Cited for Mumford's motivating quote and discussion of flat morphisms in the chapter on covers and fundamental groups of schemes.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Luis Ribes",
          "Pavel Zalesskii"
        ],
        "doi": "10.1007/978-3-642-01642-4",
        "key": "Ribes",
        "raw": "Ribes, Luis and Zalesskii, Pavel, Profinite groups, 2nd ed., Ergeb. Math. Grenzgeb. 40, Springer, 2010",
        "title": "Profinite groups",
        "url": null,
        "venue": "Ergebnisse der Mathematik und ihrer Grenzgebiete",
        "year": 2010
      },
      "exists": null,
      "explanation": "Key reference for profinite group theory, cited for profinite completion properties and topological generation results essential for the étale fundamental group construction.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "A. Grothendieck"
        ],
        "doi": null,
        "key": "SGA",
        "raw": "Grothendieck, A. (ed.), Séminaire de géométrie algébrique du Bois Marie 1960–61. Revêtements étales et groupe fondamental (SGA 1), Doc. Math. (SMF) 3, Société Mathématique de France, 2003",
        "title": "Séminaire de géométrie algébrique du Bois Marie 1960–61. Revêtements étales et groupe fondamental (SGA 1)",
        "url": null,
        "venue": "Documents Mathématiques (SMF)",
        "year": 2003
      },
      "exists": null,
      "explanation": "The foundational reference for étale coverings and the étale fundamental group, cited throughout the second chapter as Grothendieck's primary source for the construction.",
      "notes": "The 2003 SMF recomposed and annotated edition is cited; the original was published by Springer in 1971. Both versions are standard references.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Peter Schauenburg"
        ],
        "doi": null,
        "key": "Schauenburg",
        "raw": "Schauenburg, Peter, Tannaka duality for arbitrary Hopf algebras, Algebra-Ber. 66, R. Fischer, München, 1992",
        "title": "Tannaka duality for arbitrary Hopf algebras",
        "url": null,
        "venue": "Algebra-Berichte",
        "year": 1992
      },
      "exists": null,
      "explanation": "A primary technical reference for the Tannakian chapter, cited extensively for coendomorphism coalgebras, the comodule category equivalence, and related Tannaka duality results.",
      "notes": "Published by a small publisher (R. Fischer, München) and may be difficult to access; multiple specific lemmas and theorems are cited, which readers may find hard to verify.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Timothy J. Ford"
        ],
        "doi": "10.1090/gsm/183",
        "key": "Sep_al",
        "raw": "Ford, Timothy J., Separable algebras, Grad. Stud. Math. 183, AMS, 2017",
        "title": "Separable algebras",
        "url": null,
        "venue": "Graduate Studies in Mathematics",
        "year": 2017
      },
      "exists": null,
      "explanation": "Cited for the characterization of separable commutative k-algebras as finite direct sums of fields, connecting to the algebraic formulation of étale covers.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Jean-Pierre Serre"
        ],
        "doi": "10.5802/aif.59",
        "key": "Serre",
        "raw": "Serre, Jean-Pierre, Géométrie algébrique et géométrie analytique, Ann. Inst. Fourier, vol. 6, pp. 1–42, 1956",
        "title": "Géométrie algébrique et géométrie analytique",
        "url": "https://eudml.org/doc/73726",
        "venue": "Annales de l'Institut Fourier",
        "year": 1956
      },
      "exists": null,
      "explanation": "The GAGA paper is a central reference for the transcendental methods section, cited multiple times for comparison theorems between coherent sheaves on algebraic and analytic spaces.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "The Stacks Project Authors"
        ],
        "doi": null,
        "key": "Stacks",
        "raw": "The Stacks Project Authors, Stacks Project, https://stacks.math.columbia.edu/",
        "title": "Stacks Project",
        "url": "https://stacks.math.columbia.edu/",
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Cited for specific scheme-theoretic results using stable tag numbers, providing accessible online references for algebraic geometry facts.",
      "notes": "No year is given; the Stacks Project is a living document. Citations use stable tag numbers (01RV, 01AG, 01SA), which provide reliable anchors.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Tamás Szamuely"
        ],
        "doi": "10.1017/CBO9780511627064",
        "key": "Szamuely",
        "raw": "Szamuely, Tamás, Galois groups and fundamental groups, Camb. Stud. Adv. Math. 117, Cambridge University Press, 2009",
        "title": "Galois groups and fundamental groups",
        "url": null,
        "venue": "Cambridge Studies in Advanced Mathematics",
        "year": 2009
      },
      "exists": null,
      "explanation": "The primary monograph followed in Chapter 2 for the algebraic construction of the étale fundamental group, cited throughout as the direct reference for the approach taken.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Ravi Vakil"
        ],
        "doi": null,
        "key": "Vakil",
        "raw": "Vakil, Ravi, The rising sea. Foundations of algebraic geometry, Princeton University Press, 2025",
        "title": "The rising sea. Foundations of algebraic geometry",
        "url": null,
        "venue": null,
        "year": 2025
      },
      "exists": null,
      "explanation": "Cited for foundational results on finiteness conditions for morphisms of schemes and other algebraic geometry prerequisites.",
      "notes": "The 2025 Princeton University Press edition is cited; widely circulated preprint drafts have been available for years and section numbering may differ from earlier versions.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Robert C. Gunning",
          "Hugo Rossi"
        ],
        "doi": null,
        "key": "anal_compx_func",
        "raw": "Gunning, Robert C. and Rossi, Hugo, Analytic functions of several complex variables, Reprint of 1965 original, AMS Chelsea Publishing, 2009",
        "title": "Analytic functions of several complex variables",
        "url": null,
        "venue": null,
        "year": 2009
      },
      "exists": null,
      "explanation": "A reference on analytic functions of several complex variables that does not appear in any rendered citation context; its role in the thesis is unclear from the available text.",
      "notes": "No explicit citation context for this key appears in the rendered portions of the paper; it may be cited in the omitted sections or may be an unused bibliography entry.",
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "P. Deligne"
        ],
        "doi": null,
        "key": "droit_p_minus_3_pts",
        "raw": "Deligne, P., Le groupe fondamental de la droite projective moins trois points, in Galois groups over Q, Proc. Workshop Berkeley/CA 1987, Publ. Math. Sci. Res. Inst. 16, pp. 79–297, 1989",
        "title": "Le groupe fondamental de la droite projective moins trois points",
        "url": null,
        "venue": "Galois groups over Q (MSRI Publications)",
        "year": 1989
      },
      "exists": null,
      "explanation": "Cited for Deligne's study of the motivic fundamental group of the projective line minus three points as a Tannakian realisation, providing a non-trivial example motivating the Tannakian framework.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "M. Artin"
        ],
        "doi": null,
        "key": "etale_topology_schemes",
        "raw": "Artin, M., The etale topology of schemes, Tr. Mezhdunarod. Kongr. Mat., Moskva 1966, pp. 44–56, 1968",
        "title": "The etale topology of schemes",
        "url": null,
        "venue": "Tr. Mezhdunarod. Kongr. Mat., Moskva 1966 (Proceedings ICM 1966)",
        "year": 1968
      },
      "exists": null,
      "explanation": "Artin's foundational ICM paper on the étale topology; if cited in omitted sections, it provides historical context for the introduction of the étale site.",
      "notes": "No explicit citation context for this key appears in the rendered portions of the paper; it may be cited in the omitted sections.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Lukas Horosiewicz"
        ],
        "doi": null,
        "key": "fundamental_group_of_schemes_thesis",
        "raw": "Lukas Horosiewicz, Fundamental groups of schemes, 2022, supervisor: Sofiaa Tirabassi",
        "title": "Fundamental groups of schemes",
        "url": null,
        "venue": null,
        "year": 2022
      },
      "exists": null,
      "explanation": "Cited as a direct structural inspiration for Chapter 2 proofs; the extent of reliance on an unpublished student thesis merits scrutiny regarding the originality of the presented arguments.",
      "notes": "Cited as the inspiration for 'many of the following proofs and concepts' in Chapter 2; relying on an unpublished or lightly reviewed student thesis as a primary proof source is unusual and may raise concerns about verifiability.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Philippe Gille",
          "Tamás Szamuely"
        ],
        "doi": "10.1017/9781316661277",
        "key": "galois_descent_Szamuely",
        "raw": "Gille, Philippe and Szamuely, Tamás, Central simple algebras and Galois cohomology, 2nd revised ed., Camb. Stud. Adv. Math. 165, Cambridge University Press, 2017",
        "title": "Central simple algebras and Galois cohomology",
        "url": null,
        "venue": "Cambridge Studies in Advanced Mathematics",
        "year": 2017
      },
      "exists": null,
      "explanation": "Cited for Galois descent results (Section 2) used in the chapter on covers and fundamental groups of schemes.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "James S. Milne"
        ],
        "doi": null,
        "key": "milneEtCoH",
        "raw": "Milne, James S., Étale cohomology, Reprint of 1980 edition, Princeton Math. Ser. 33, Princeton University Press, 2025",
        "title": "Étale cohomology",
        "url": null,
        "venue": "Princeton Mathematical Series",
        "year": 2025
      },
      "exists": null,
      "explanation": "Cited multiple times in the chapter on covers and fundamental groups of schemes for étale morphism theory and comparison results.",
      "notes": "The 2025 reprint edition is cited; the original work is from 1980. This edition likely post-dates most of the thesis writing, suggesting a late-stage bibliography update.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    }
  ],
  "missing_references": [
    {
      "reason": "The thesis devotes an entire chapter to Tannakian duality but does not cite the canonical Deligne–Milne article 'Tannakian Categories' (1982, in Hodge Cycles, Motives, and Shimura Varieties, Lecture Notes in Mathematics 900), which is the standard reference for neutral Tannakian categories and the precise framework employed.",
      "title": "Tannakian Categories"
    },
    {
      "reason": "The text credits Grothendieck and Saavedra Rivano with extending Tannaka–Krein duality to affine group schemes, but Saavedra Rivano's foundational thesis (Lecture Notes in Mathematics 265, Springer, 1972) is not cited, leaving this attribution unsupported by a direct reference.",
      "title": "Catégories Tannakiennes"
    }
  ],
  "summary": "The bibliography is well-chosen for a thesis on étale fundamental groups, with appropriate coverage of foundational texts (SGA, EGA, Hartshorne, Szamuely) and supporting references in topology, algebra, and category theory. Two notable gaps stand out: the Tannakian chapter credits Grothendieck and Saavedra Rivano for extending Tannaka–Krein duality to affine group schemes without citing either Saavedra Rivano's thesis or the canonical Deligne–Milne 'Tannakian Categories' article, leaving the core theoretical framework under-referenced. The reliance on an unpublished student thesis (Horosiewicz 2022) as a primary proof source in Chapter 2 is unusual and may raise questions about verifiability. Minor issues include a year mismatch for the Chow citation (2018 reprint cited, original 1949), a non-standard DOI format for Mac Lane, and two bibliography entries (anal_compx_func, etale_topology_schemes) with no visible citation contexts in the rendered text."
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.82,
  "questions": [
    "What, if any, is the novel mathematical contribution beyond pedagogical synthesis? Is there a result, comparison, or construction the author claims as original?",
    "Would the author provide a companion Lean/Mathlib or Coq formalization of at least the headline comparison theorem (étale π₁ ≅ profinite completion of topological π₁ for connected finite-type ℂ-schemes)?",
    "Why are Deligne–Milne 'Tannakian Categories' (1982) and Saavedra Rivano 'Catégories Tannakiennes' (1972) absent from the bibliography, given that they are the foundational references for the neutral Tannakian framework employed throughout Chapter 3?",
    "Can the author clarify which proofs in Chapter 2 are direct adaptations of Horosiewicz (2022) and which represent independent presentations, and can published sources be substituted where available?",
    "The Chow citation uses the 2018 reprint but the text attributes the result to 'Chow 1949'; can the bibliography be corrected to cite the original Amer. J. Math. 71 (1949), 893–914 publication?"
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "The thesis is entirely informal LaTeX prose with diagram-chase proofs. Foundational results such as Galois correspondence (Krull’s theorem), the equivalence Cov(X)≃π_1-Set, the Tannakian fundamental group construction, and the comparison theorem between π_1^{ét} and the profinite completion of π_1^{top} have been (or could be) formalised in Lean’s Mathlib / Coq / Agda, and a thesis whose stated aim is a ‘unifying’ treatment would substantially benefit from at least the headline correspondence being machine-checked. No such artifact accompanies the submission.",
      "id": "weakness-1",
      "locator": "Whole thesis (Chapters 1–3); particularly Theorems 26, 56, 67, 73, 75, and the (truncated) Tannakian reconstruction in Chapter 3",
      "required_update": "Add a companion repository — e.g. src/proofs/CoveringSpaceGaloisCorrespondence.lean formalising Theorem 26 in Lean/Mathlib, src/proofs/KrullInfiniteGalois.lean for Theorem 52, and src/proofs/TannakianReconstruction.lean for the Hopf-algebra reconstruction of Proposition 222 / Lemma 224 — and link these from the introduction.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Whole thesis (Chapters 1–3); particularly Theorems 26, 56, 67, 73, 75, and the (truncated) Tannakian reconstruction in Chapter 3` is corrected or justified.",
      "weakness_index": 0
    },
    {
      "evidence": "The thesis is entirely informal LaTeX prose with diagram-chase proofs. Foundational results such as Galois correspondence (Krull’s theorem), the equivalence Cov(X)≃π_1-Set, the Tannakian fundamental group construction, and the comparison theorem between π_1^{ét} and the profinite completion of π_1^{top} have been (or could be) formalised in Lean’s Mathlib / Coq / Agda, and a thesis whose stated aim is a ‘unifying’ treatment would substantially benefit from at least the headline correspondence being machine-checked. No such artifact accompanies the submission.",
      "id": "weakness-2",
      "locator": "Whole thesis (Chapters 1–3); particularly Theorems 26, 56, 67, 73, 75, and the (truncated) Tannakian reconstruction in Chapter 3",
      "required_update": "Add a companion repository — e.g. src/proofs/CoveringSpaceGaloisCorrespondence.lean formalising Theorem 26 in Lean/Mathlib, src/proofs/KrullInfiniteGalois.lean for Theorem 52, and src/proofs/TannakianReconstruction.lean for the Hopf-algebra reconstruction of Proposition 222 / Lemma 224 — and link these from the introduction.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Whole thesis (Chapters 1–3); particularly Theorems 26, 56, 67, 73, 75, and the (truncated) Tannakian reconstruction in Chapter 3` is corrected or justified.",
      "weakness_index": 1
    },
    {
      "evidence": "The thesis devotes an entire chapter to Tannakian duality but does not cite the canonical Deligne–Milne article 'Tannakian Categories' (1982, in Hodge Cycles, Motives, and Shimura Varieties, Lecture Notes in Mathematics 900), which is the standard reference for neutral Tannakian categories and the precise framework employed.",
      "id": "weakness-3",
      "locator": "Tannakian Categories",
      "required_update": "Add a bibliography entry for `Tannakian Categories` and cite it where the affected method or claim is introduced, or explicitly justify its omission.",
      "source_path": null,
      "source_role": "citation",
      "status": "open",
      "target_kind": "bibliography",
      "verification_check": "Re-review should confirm the bibliography and citation context address this reference.",
      "weakness_index": 2
    },
    {
      "evidence": "The thesis is entirely informal LaTeX prose with diagram-chase proofs. Foundational results such as Galois correspondence (Krull’s theorem), the equivalence Cov(X)≃π_1-Set, the Tannakian fundamental group construction, and the comparison theorem between π_1^{ét} and the profinite completion of π_1^{top} have been (or could be) formalised in Lean’s Mathlib / Coq / Agda, and a thesis whose stated aim is a ‘unifying’ treatment would substantially benefit from at least the headline correspondence being machine-checked. No such artifact accompanies the submission.",
      "id": "weakness-4",
      "locator": "Whole thesis (Chapters 1–3); particularly Theorems 26, 56, 67, 73, 75, and the (truncated) Tannakian reconstruction in Chapter 3",
      "required_update": "Add a companion repository — e.g. src/proofs/CoveringSpaceGaloisCorrespondence.lean formalising Theorem 26 in Lean/Mathlib, src/proofs/KrullInfiniteGalois.lean for Theorem 52, and src/proofs/TannakianReconstruction.lean for the Hopf-algebra reconstruction of Proposition 222 / Lemma 224 — and link these from the introduction.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Whole thesis (Chapters 1–3); particularly Theorems 26, 56, 67, 73, 75, and the (truncated) Tannakian reconstruction in Chapter 3` is corrected or justified.",
      "weakness_index": 3
    },
    {
      "evidence": "No repository, license, commit, release, or machine-checkable proof artifact is provided for the main mathematical development. A reproducibility package such as formal/EtaleFundamentalGroups/Thesis.lean with pinned dependencies would be needed to independently verify the load-bearing claims.",
      "id": "weakness-5",
      "locator": "code release and execution entrypoints",
      "required_update": "Release the source code, scripts, model configuration, and execution entrypoints needed to regenerate the reported tables, or document why those artifacts cannot be released.",
      "source_path": null,
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "code",
      "verification_check": "Re-review should confirm runnable code or a documented non-release justification is present.",
      "weakness_index": 4
    }
  ],
  "strengths": [
    "Self-contained, pedagogically clear exposition unifying three foundational frameworks—topological covering theory, étale fundamental groups, and Tannakian duality—within a single coherent narrative.",
    "All headline theorems are technically correct as stated; the technical_correctness specialist found only minor presentational errors and no false claim across Chapters 1–3.",
    "Bibliography is appropriately anchored in primary sources (SGA 1, EGA IV, Hartshorne, Szamuely, Serre's GAGA), with stable-tag Stacks Project citations that will not rot.",
    "The comparison between the étale and topological fundamental groups over ℂ is carefully set up via GAGA and transcendental methods, providing a useful bridge for readers coming from topology."
  ],
  "summary": "The thesis presents a systematic pedagogical exposition of fundamental groups across three domains: classical covering space theory and Galois theory (Chapter 1), the étale fundamental group of schemes (Chapter 2), and the Tannakian approach connecting all three (Chapter 3). The technical_correctness specialist (confidence 0.70) rated the work mostly_sound with only minor presentational errors and no headline claim found false; TC13 flags a major absence—no machine-checked formalization of any load-bearing result. The reproducibility specialist (confidence 0.88) assigned a score of 0.22, citing two critical-severity concerns: absence of a proof repository and lack of a formal proof artifact for the headline étale-vs-topological comparison theorem, plus two major concerns for the Tannakian and Nori comparisons. The novelty specialist (confidence 0.75) assigned 0.08 with verdict marginal, finding the thesis reproduces constructions from SGA 1, Szamuely, Schauenburg, and Nori without novel mathematical content. The citation specialist (confidence 0.72) flagged two missing references central to the Tannakian chapter—Deligne–Milne 'Tannakian Categories' (1982) and Saavedra Rivano 'Catégories Tannakiennes' (1972)—along with reliance on an unpublished student thesis (Horosiewicz 2022) as a primary Chapter 2 proof source. Specialists are in agreement: the exposition is clear and mostly correct, but the thesis lacks novel contributions, lacks formal proof artifacts, and under-references its core Tannakian framework. The paper's field (math.AG) is code-amenable under the recommendation gate, and both technical_correctness (TC13, major) and reproducibility (critical) flagged missing proof-as-code artifacts, mandating major_revision.",
  "weaknesses": [
    "The thesis contains no novel mathematical contributions: every construction—étale fundamental group (SGA 1 / Szamuely), Tannakian reconstruction (Schauenburg), Nori fundamental group scheme (Nori 1982)—is reproduced from existing literature, yielding a novelty score of 0.08.",
    "No machine-checked proof artifact accompanies any load-bearing claim; both technical_correctness (TC13, major) and reproducibility (critical) identify this absence as a significant gap for a math.AG thesis whose central results (Galois correspondence, étale–topological comparison, Tannakian reconstruction) are formalizable in Lean/Mathlib.",
    "The Tannakian chapter omits the two canonical foundational references—Deligne–Milne 'Tannakian Categories' (1982, LNM 900) and Saavedra Rivano 'Catégories Tannakiennes' (1972, LNM 265)—leaving the precise fibre-functor framework employed without its primary citations.",
    "Multiple proofs contain presentational defects that impede verification: notation collision in Theorem 34 (δ used for two distinct objects), conflation of group elements with deck transformations in Proposition 21, reversed natural-transformation direction in Theorem 75, and typographic errors throughout.",
    "Reliance on the unpublished student thesis Horosiewicz (2022) as a primary proof source for 'many of the following proofs and concepts' in Chapter 2 is unusual and reduces verifiability; the extent of adaptation versus original presentation is not delineated."
  ]
}
```

### novelty (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.75,
  "missing_prior_art": [
    {
      "reason": "This is the standard reference for neutral Tannakian categories in the form the thesis uses, including the definition of fibre functor and the reconstruction theorem. The thesis cites only Schauenburg and Etingof et al. for this material, omitting the foundational Deligne–Milne source that established the framework in the algebraic-geometry community.",
      "title": "Tannakian categories (Deligne–Milne, 1982, in 'Hodge cycles, motives, and Shimura varieties', LNM 900)"
    },
    {
      "reason": "The abstract names Grothendieck and Saavedra Rivano as the originators of the extension of Tannaka–Krein to affine group schemes, yet Saavedra Rivano's thesis is absent from the bibliography. Any treatment of Tannakian categories in algebraic geometry should cite this primary source.",
      "title": "Catégories tannakiennes (Saavedra Rivano, 1972, LNM 265)"
    },
    {
      "reason": "Although listed in the bibliography, this work is not engaged with in the sections provided despite the abstract's claim to unify étale, topological, and motivic Galois groups—motivic aspects that are central to Deligne's paper. Including it as substantive prior art rather than a dormant citation would strengthen the claimed unifying scope.",
      "title": "Le groupe fondamental de la droite projective moins trois points (Deligne, 1989)"
    }
  ],
  "novelty_score": 0.08,
  "related_work": [
    {
      "citation_key": "SGA",
      "delta": "The étale fundamental group theory constructed in the thesis originates entirely from SGA 1. The thesis replicates the construction while opting for Szamuely's more elementary presentation over the Galois-category axiomatic route of SGA.",
      "relation": "prior_art",
      "title": "Séminaire de géométrie algébrique du Bois Marie 1960–61 (SGA 1)"
    },
    {
      "citation_key": "Szamuely",
      "delta": "The thesis explicitly follows Szamuely's direct approach to étale fundamental groups throughout Chapter 2, reproducing his proofs and organisation with no stated extensions.",
      "relation": "builds_on",
      "title": "Galois groups and fundamental groups"
    },
    {
      "citation_key": "Lenstra",
      "delta": "Mentioned as the canonical axiomatic Galois-category approach; the thesis deliberately chooses Szamuely's route instead, so Lenstra serves as acknowledged prior art rather than a base.",
      "relation": "prior_art",
      "title": "Galois theory for schemes"
    },
    {
      "citation_key": "Nori",
      "delta": "The final section of Chapter 3 reproduces Nori's construction of the fundamental group scheme and his comparison with the étale fundamental group in characteristic 0, with no additions.",
      "relation": "prior_art",
      "title": "The fundamental group-scheme"
    },
    {
      "citation_key": "Schauenburg",
      "delta": "The core results of the Tannakian chapter—reconstruction of coalgebras from comodule categories, Tannaka duality theorem—are drawn directly from Schauenburg; the thesis provides expanded exposition of his proofs.",
      "relation": "prior_art",
      "title": "Tannaka duality for arbitrary Hopf algebras"
    },
    {
      "citation_key": "Etingof",
      "delta": "The Morita-equivalence motivation and background on endomorphism algebras of fibre functors are taken from this reference; the thesis uses it to motivate the passage from modules to comodules.",
      "relation": "prior_art",
      "title": "Tensor categories"
    },
    {
      "citation_key": "waterhouse",
      "delta": "Waterhouse's theorem that every representation of a closed subgroup scheme of GL_n is generated under tensor operations by the standard representation is cited directly and used to identify Tannakian subcategories with Zariski closures.",
      "relation": "prior_art",
      "title": "Introduction to affine group schemes"
    },
    {
      "citation_key": "Milne_alg_group",
      "delta": "The fundamental theorem of comodules (Theorem 221) is deferred entirely to Milne's book; the thesis quotes the result without proof beyond the citation.",
      "relation": "prior_art",
      "title": "Algebraic groups (Milne)"
    }
  ],
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
      "description": "No repository, license, commit, release, or machine-checkable proof artifact is provided for the main mathematical development. A reproducibility package such as formal/EtaleFundamentalGroups/Thesis.lean with pinned dependencies would be needed to independently verify the load-bearing claims.",
      "severity": "critical"
    },
    {
      "area": "other",
      "description": "The headline comparison between the etale fundamental group of a connected finite-type scheme over C and the profinite completion of the topological fundamental group is described but no formal proof artifact is provided. A file such as formal/EtaleFundamentalGroups/ComparisonTheorem.lean would close this gap.",
      "severity": "critical"
    },
    {
      "area": "other",
      "description": "The Tannaka duality and neutral Tannakian reconstruction claims rely partly on citations and informal exposition rather than a checkable proof artifact. A file such as formal/Tannakian/TannakaDuality.lean would be needed for proof-as-code reproduction.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "The claimed relation between Nori's fundamental group scheme and the etale fundamental group in characteristic zero is not accompanied by a formalized proof or executable verification artifact. A file such as formal/Tannakian/NoriEtaleComparison.lean would close the gap.",
      "severity": "major"
    },
    {
      "area": "data",
      "description": "No empirical dataset is involved or specified; this is appropriate for the thesis scope, but it means there is no data-based reproduction path.",
      "severity": "info"
    },
    {
      "area": "compute",
      "description": "No computational environment, theorem prover version, library commit, hardware, or dependency lockfile is specified for independent formal verification.",
      "severity": "major"
    }
  ],
  "confidence": 0.88,
  "data_availability": "unspecified",
  "data_url": null,
  "environment": null,
  "reproducibility_score": 0.22
}
```

### summary (`claude-haiku-4-5`) — status: `pass`

```json
{
  "audience": "Graduate students in algebraic geometry, students of Galois theory, and mathematicians seeking to understand Grothendieck's conceptual innovations connecting topology and algebraic geometry.",
  "key_contributions": [
    "Systematic exposition of the analogy between topological covering spaces and Galois theory, demonstrating how both encode symmetries through profinite groups.",
    "Construction and detailed study of the étale fundamental group for schemes, including comparison with the topological fundamental group via transcendental methods for complex varieties.",
    "Unified treatment of fundamental groups through Tannakian duality, showing how étale, topological, and motivic Galois groups arise naturally within a single categorical framework.",
    "Self-contained development of category-theoretic foundations (functors, limits, adjunctions, abelian categories) necessary for modern algebraic geometry."
  ],
  "plain_language_summary": "This thesis presents a systematic exploration of how fundamental groups—objects that capture the essential structure of spaces and their symmetries—appear across three major mathematical domains. The work begins with classical topological covering spaces, where fundamental groups classify how spaces can be continuously wrapped around themselves. It then follows Grothendieck's revolutionary insight that similar ideas apply to algebraic varieties, the geometric objects defined by polynomial equations. However, standard topological methods fail for varieties because they lack sufficient structure; the solution is the étale topology, a combinatorial framework where covering spaces are replaced by certain algebraic morphisms. Through this lens, the étale fundamental group emerges as the algebraic analogue of its topological cousin, and remarkably, the two coincide when the variety is complex—a deep connection bridging algebra and analysis. Finally, the thesis reveals that all three versions of the fundamental group—topological, étale, and motivic—are unified through Tannakian duality, a principle that recovers groups as symmetry groups of fiber functors on monoidal categories of representations.",
  "tldr": "A thesis developing fundamental groups as a unifying framework across topology, algebraic geometry via étale theory, and linear algebra through Tannakian duality."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `pass`

```json
{
  "claims": [
    {
      "assessment": "supported",
      "claim": "The fundamental group is a topological invariant: homeomorphic (and more generally homotopy equivalent) spaces have isomorphic fundamental groups (Proposition 4, Corollary 5).",
      "evidence": "Standard result reproduced verbatim from Hatcher and Munkres; the one-line functorial proof given is correct.",
      "id": "TC1",
      "location": "Section 1.1 (Topological Covering Spaces), Proposition 4 and Corollary 5",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Main Classification of Coverings (Theorem 26): for a connected base X with a Galois cover p:Y→X with group G, the maps H↦Y/H and Z↦Aut(Y|Z) induce an order-reversing bijection between subgroups of G and intermediate connected covers Z, with q:Z→X Galois iff H=Aut(Y|Z) is normal in G, in which case Aut(Z|X)≅G/H.",
      "evidence": "Equivalent to the standard correspondence in Hatcher §1.3 and Szamuely §2. The proof presented composes Proposition 17 (quotient by properly discontinuous action), Proposition 10 (composition of covers), and Theorem 15 (rigidity of cover morphisms) in the standard way; the inverse-correspondence verification and the normality argument via the induced map G→Aut(Z|X) with kernel Aut(Y|Z) is the textbook construction.",
      "id": "TC2",
      "location": "Section 1.2 (Covering Spaces and their Galois structure), Theorem 26",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "For the universal cover q:X̃→X, there is a natural anti-isomorphism Aut(X̃|X)^{op} ≅ π_1(X,x) (Theorem 34), and π_1(X,x) acts freely on X̃ (Corollary 35).",
      "evidence": "The theorem statement is the standard deck-transformation theorem and is correct (cf. Hatcher Proposition 1.39). However, in the surjectivity step the letter δ is reused for two different objects (a class in π_1(X,x) and the homotopy class of f^{-1}•g), and the closing line ‘there exists δ∈π_1(X,x) such that φ_δ=φ’ does not explicitly invoke Theorem 15 to identify φ^{-1}∘φ_δ with the identity from its fixing one point; the cited reference is also Proposition 15 where it should be Theorem 15. The argument is correct on careful reading but the presentation should be tightened.",
      "id": "TC3",
      "location": "Section 1.3 (Universal Cover and Fundamental Group), Theorem 34 and Corollary 35",
      "severity": "minor",
      "suggested_fix": "Rename the second δ (e.g. use ε for the class of f^{-1}•g) and explicitly state ‘since φ^{-1}∘φ_δ fixes ỹ, by Theorem 15 it equals the identity, so φ=φ_δ.’"
    },
    {
      "assessment": "partially_supported",
      "claim": "If G acts properly discontinuously on a connected space Y, then Aut(Y|(Y/G)) ≅ G (Proposition 21).",
      "evidence": "The result is standard and correct (cf. Hatcher Proposition 1.40(a)). The displayed proof, however, reads ‘applying Corollary 19 to the homeomorphism φ∘g^{-1}, we get g=φ’ — this is a notational shortcut conflating the element g∈G with the deck transformation it induces. The intended argument (φ∘g^{-1} is a deck transformation fixing y, hence the identity, so φ equals the action of g) is correct but is not literally what is written.",
      "id": "TC4",
      "location": "Section 1.2, Proposition 21",
      "severity": "minor",
      "suggested_fix": "Rewrite the last sentence as: ‘the deck transformation φ∘(action of g^{-1}) fixes y, so by Corollary 19 it is the identity; therefore φ coincides with the action of g, and G→Aut(Y|(Y/G)) is surjective.’"
    },
    {
      "assessment": "supported",
      "claim": "π_1(S^1) ≅ ℤ (Theorem 37).",
      "evidence": "Classical result; the lifting-of-loops proof via the universal cover ℝ→S^1, t↦e^{2πit} is the standard one (cf. Hatcher Theorem 1.7). The morphism Γ(n)=[γ_n] is well-defined and the injectivity/surjectivity arguments via path/homotopy lifting are correct.",
      "id": "TC5",
      "location": "Section 1.3, Theorem 37",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Krull’s theorem (Theorem 52): for a (possibly infinite) Galois extension K|k with group G, the maps H↦K^H and L↦Gal(K|L) give an inclusion-reversing bijection between closed subgroups of G and intermediate fields, and L|k is Galois iff Gal(K|L)◁G, with Gal(L|k)≅G/Gal(K|L).",
      "evidence": "This is the standard infinite Galois theory of Krull. The proof presented uses Proposition 51 (Galois groups as inverse limits), Lemma 41 (Galois closure of finite subextensions), and the topological argument that any σ∈Gal(K|L) lies in the closure of H — the textbook approach (cf. Szamuely §1.3). The construction U_L=pr_M^{-1}(Gal(M|L)) and the identification U_L=Gal(K|L) are correct.",
      "id": "TC6",
      "location": "Section 1.4 (Reformulation of Classical Galois Theory), Theorem 52",
      "severity": "info",
      "suggested_fix": "Minor: typo ‘Galois if ans only if’ in the statement; should be ‘if and only if’."
    },
    {
      "assessment": "supported",
      "claim": "Reformulation of Galois Theory (Theorem 56): Hom_k(−,k_s) gives an anti-equivalence between FSep_k and the category of finite, continuous, transitive left Gal(k)-sets, with Galois extensions corresponding to finite quotients of Gal(k).",
      "evidence": "Standard Grothendieck reformulation (cf. Szamuely Theorem 1.5.4). The essential-surjectivity argument via H_t=Gal(k)_t, L=k_s^{H_t} and the identification U_ι=Gal(k_s|L)≅H_t is correct, and full faithfulness is established via the standard equivariance computation.",
      "id": "TC7",
      "location": "Section 1.4, Theorem 56",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Equivalence between finite covers of X and finite continuous π̂_1(X,x)-sets, with connected covers corresponding to transitive actions and Galois covers to coset spaces of open normal subgroups (Theorem 67).",
      "evidence": "The proof correctly invokes Theorem 64 (the unrestricted equivalence with π_1-sets), Lemma 66 (core of a finite-index subgroup is normal of finite index), and Lemma 43 (continuity ↔ open stabilizers) to factor the π_1-action through finite quotients. This is the standard refinement appearing in Szamuely §2.",
      "id": "TC8",
      "location": "Section 1.6 (Another Classification of Covering Spaces), Theorem 67",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Equivalence between the category of locally constant sheaves of R-modules on X and the category of R[π_1(X,x)]-modules (Theorem 75).",
      "evidence": "The statement is a correct R-linear extension of Corollary 74 / Theorem 73 and matches the monodromy-representation correspondence. However, the proof has presentational defects: (i) the natural transformations are introduced with reversed direction (‘α:FG⇒id_{π_1 Mod}’ rather than the stated id⇒FG); (ii) the construction of the cover q_M=M×_{π_1}X̃→X uses the universal-cover trivialisation locally, and the argument that q_M^{-1}(U) is homeomorphic to M×_{π_1}V (any V_y) implicitly uses that V_y is connected and simply connected, which holds but is not invoked explicitly; (iii) several typos (‘equivarient’, ‘y∈U and s,y∈F_M(U)’ should be ‘s,t’).",
      "id": "TC9",
      "location": "Section 1.7 (Classification of Locally Constant Sheaves), Theorem 75",
      "severity": "minor",
      "suggested_fix": "Fix the direction of α and β to match the statement of natural isomorphism between the composites and the identities; explicitly justify the local triviality of q_M using the universal-cover trivialisation; correct typos."
    },
    {
      "assessment": "supported",
      "claim": "Coalgebra dualisation gives an anti-equivalence between finite-dimensional k-coalgebras and finite-dimensional k-algebras (Proposition 218), and the fundamental theorem of comodules: every element of a C-comodule lies in a finite-dimensional subcomodule (Theorem 221).",
      "evidence": "Both results are standard. The proof of Proposition 218 correctly identifies the finite-dimensionality hypothesis needed for B*⊗B*→(B⊗B)* to be an isomorphism, and Remark 33 properly explains why the infinite-dimensional case fails (k[x] counterexample). Theorem 221 is cited correctly to Milne, ‘Algebraic Groups’, Proposition 4.7.",
      "id": "TC10",
      "location": "Section 3.1 (Representation of Group Schemes and Comodules), Proposition 218 and Theorem 221",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Equivalence between right A-comodules over a commutative Hopf algebra A and left representations of the corresponding affine group scheme (Proposition 222), and the lemma Hom(ω,ω)=Hom(ω^f,ω^f) (Lemma 223) connecting full and finite-dimensional fibre functors.",
      "evidence": "Proposition 222 is the standard equivalence in Milne / Waterhouse; the constructions π_R = (id⊗g)∘ρ and ν=π_A(id_A)∘(v↦v⊗1) are correctly verified to be mutual inverses. Lemma 223 follows from the fundamental theorem of comodules applied to subcomodules, as written.",
      "id": "TC11",
      "location": "Section 3.1, Proposition 222 and Lemma 223",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Étale algebras: A is étale over k ⇔ A⊗_k k̄ ≅ k̄^{⊕n} ⇔ A⊗_k k̄ is reduced (Theorem 60).",
      "evidence": "Standard characterisation. The implications (a)⇒(b) (via CRT applied to L=k[x]/(f) and a separable f), (b)⇒(a) (via the reduction A_r=A/Nil(A) and the bijection Hom_k(A,k̄)≅Hom_{k̄}(A⊗k̄, k̄)), and the trivial direction (b)⇒(c) plus (c)⇒(b) (Lemma 59 applied over k̄) are all correctly carried out.",
      "id": "TC12",
      "location": "Section 1.4 (Étale and Separable Algebras), Theorem 60",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "unsupported",
      "claim": "No machine-checked formalisation of the headline claims (étale-vs-topological π_1 comparison, Tannakian reconstruction of the fundamental group scheme, classification of finite covers via π̂_1) is provided in Lean/Coq/Agda/Isabelle or any other proof assistant, despite the field being math.AG / cs.LO-amenable to formalisation.",
      "evidence": "The thesis is entirely informal LaTeX prose with diagram-chase proofs. Foundational results such as Galois correspondence (Krull’s theorem), the equivalence Cov(X)≃π_1-Set, the Tannakian fundamental group construction, and the comparison theorem between π_1^{ét} and the profinite completion of π_1^{top} have been (or could be) formalised in Lean’s Mathlib / Coq / Agda, and a thesis whose stated aim is a ‘unifying’ treatment would substantially benefit from at least the headline correspondence being machine-checked. No such artifact accompanies the submission.",
      "id": "TC13",
      "location": "Whole thesis (Chapters 1–3); particularly Theorems 26, 56, 67, 73, 75, and the (truncated) Tannakian reconstruction in Chapter 3",
      "severity": "major",
      "suggested_fix": "Add a companion repository — e.g. src/proofs/CoveringSpaceGaloisCorrespondence.lean formalising Theorem 26 in Lean/Mathlib, src/proofs/KrullInfiniteGalois.lean for Theorem 52, and src/proofs/TannakianReconstruction.lean for the Hopf-algebra reconstruction of Proposition 222 / Lemma 224 — and link these from the introduction."
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

1. Auslander_Buchsbaum: author = Auslander, Maurice and Buchsbaum, D. A., title = Unique factorization in regular local rings, fjournal = Proceedings of the National Academy of Sciences of the United States of America, journal = Proc. Natl. Acad. Sci. USA, issn = 0027-8424, volume = 45, pages = 733--734, year = 1959, language = English, doi = 10.1073/pnas.45.5.733, url = www.ncbi.nlm.nih.gov/pmc/articles/222624, zbMATH = 3138287, Zbl = 0084.26504 doi:[10.1073/pnas.45.5.733](https://doi.org/10.1073/pnas.45.5.733) arXiv:[0084.26504](https://arxiv.org/abs/0084.26504)
2. Cameron_groups: author = Cameron, Peter J., title = Permutation groups, fseries = London Mathematical Society Student Texts, series = Lond. Math. Soc. Stud. Texts, issn = 0963-1631, volume = 45, isbn = 0-521-65378-9; 0-521-65302-9, year = 1999, publisher = Cambridge: Cambridge University Press, language = English, keywords = 20B05,20-01,20B07,20B15,20B20,20B40,20B27,20-02, zbMATH = 1261512, Zbl = 0922.20003 arXiv:[0922.20003](https://arxiv.org/abs/0922.20003)
3. Chow: author = Chow, Wei-Liang, title = On compact complex analytic varieties, booktitle = Complex geometry from Riemann to K\"ahler-Einstein and Calabi-Yau, isbn = 978-1-57146-352-4, pages = 189--206, year = 2018, publisher = Somerville, MA: International Press; Beijing: Higher Education Press, language = English, keywords = 32C25, zbMATH = 7034468, Zbl = 1415.32009 arXiv:[1415.32009](https://arxiv.org/abs/1415.32009)
4. DNR: author = D\uasc\ualescu, Sorin and N\uast\uasescu, Constantin and Raianu, \cSerban, title = Hopf algebras. An introduction, fseries = Pure and Applied Mathematics, Marcel Dekker, series = Pure Appl. Math., Marcel Dekker, volume = 235, isbn = 0-8247-0481-9, year = 2001, publisher = New York, NY: Marcel Dekker, language = English, keywords = 16W30,16-02, zbMATH = 1543261, Zbl = 0962.16026 arXiv:[0962.16026](https://arxiv.org/abs/0962.16026)
5. Donaldson: author = Donaldson, Simon, title = Riemann surfaces, fseries = Oxford Graduate Texts in Mathematics, series = Oxf. Grad. Texts Math., volume = 22, isbn = 978-0-19-852639-1; 978-0-19-960674-0, year = 2011, publisher = Oxford: Oxford University Press, language = English, keywords = 30-01,30F10,14H55,14H15,14H40,30C20, zbMATH = 5900831, Zbl = 1235.30001 arXiv:[1235.30001](https://arxiv.org/abs/1235.30001)
6. EGA: author = Grothendieck, A., title = \'El\'ements de g\'eom\'etrie alg\'ebrique. IV: \'Etude locale des sch\'emas et des morphismes de sch\'emas. R\'edig\'e avec la colloboration de J. Dieudonn\'e, fjournal = Publications Math\'ematiques, journal = Publ. Math., Inst. Hautes \'Etud. Sci., issn = 0073-8301, volume = 28, pages = 1--255, year = 1966, language = French, doi = 10.1007/BF02684343, keywords = 14-02,14Axx, url = https://eudml.org/doc/103860, zbMATH = 3232548, Zbl = 0144.19904 doi:[10.1007/BF02684343](https://doi.org/10.1007/BF02684343) arXiv:[0144.19904](https://arxiv.org/abs/0144.19904)
7. Eisenbud: author = Eisenbud, David, title = Commutative algebra. With a view toward algebraic geometry, fseries = Graduate Texts in Mathematics, series = Grad. Texts Math., issn = 0072-5285, volume = 150, isbn = 3-540-94269-6; 3-540-94268-8, year = 1995, publisher = Berlin: Springer-Verlag, language = English, keywords = 13-01,14-01,13-03,13Axx,13Cxx,13A50,13C15, zbMATH = 704831, Zbl = 0819.13001 arXiv:[0819.13001](https://arxiv.org/abs/0819.13001)
8. Etingof: author = Etingof, Pavel and Gelaki, Shlomo and Nikshych, Dmitri and Ostrik, Victor, title = Tensor categories, fseries = Mathematical Surveys and Monographs, series = Math. Surv. Monogr., issn = 0076-5376, volume = 205, isbn = 978-1-4704-2024-6, year = 2015, publisher = Providence, RI: American Mathematical Society (AMS), language = English, doi = 10.1090/surv/205, keywords = 18-02,18D10,16T05, zbMATH = 6444410, Zbl = 1365.18001 doi:[10.1090/surv/205](https://doi.org/10.1090/surv/205) arXiv:[1365.18001](https://arxiv.org/abs/1365.18001)
9. Forster: author = Forster, Otto, title = Lectures on Riemann surfaces. Transl. from the German by Bruce Gilligan, fseries = Graduate Texts in Mathematics, series = Grad. Texts Math., issn = 0072-5285, volume = 81, year = 1981, publisher = Springer, Cham, language = English, keywords = 30-02,30F10,30F15,30F30,30F20,32Q99, zbMATH = 3745550, Zbl = 0475.30002 arXiv:[0475.30002](https://arxiv.org/abs/0475.30002)
10. Hartshorne: author = Hartshorne, Robin, title = Algebraic geometry. Corr. 3rd printing, fseries = Graduate Texts in Mathematics, series = Grad. Texts Math., issn = 0072-5285, volume = 52, year = 1983, publisher = Springer, Cham, language = English, keywords = 14-02,14-01,14Exx,14Fxx,14Hxx,14Axx,14Jxx,14Nxx, zbMATH = 3842033, Zbl = 0531.14001 arXiv:[0531.14001](https://arxiv.org/abs/0531.14001)
11. Hatcher: author = Hatcher, Allen, title = Algebraic topology, isbn = 0-521-79540-0, year = 2002, publisher = Cambridge: Cambridge University Press, language = English, keywords = 55-01,55Nxx,55Pxx,55Qxx, zbMATH = 2103273, Zbl = 1044.55001 arXiv:[1044.55001](https://arxiv.org/abs/1044.55001)
12. Intro_manifolds: author = Lee, John M., title = Introduction to topological manifolds, edition = 2nd ed., fseries = Graduate Texts in Mathematics, series = Grad. Texts Math., issn = 0072-5285, volume = 202, isbn = 978-1-4419-7939-1; 978-1-4419-7940-7, year = 2011, publisher = New York, NY: Springer, language = English, doi = 10.1007/978-1-4419-7940-7, keywords = 57-01,55N10,57N65,57M05,57M10,57N05,57Q05,55-01,55Q05, zbMATH = 5832459, Zbl = 1209.57001 doi:[10.1007/978-1-4419-7940-7](https://doi.org/10.1007/978-1-4419-7940-7) arXiv:[1209.57001](https://arxiv.org/abs/1209.57001)
13. Lang_algebra: author = Lang, Serge, title = Algebra., edition = 3rd revised ed., fseries = Graduate Texts in Mathematics, series = Grad. Texts Math., issn = 0072-5285, volume = 211, isbn = 0-387-95385-X, year = 2002, publisher = New York, NY: Springer, language = English, keywords = 00A05,12-01,13-01,15-01,16-01,18-01,20-01,14-01,11-01, zbMATH = 1703931, Zbl = 0984.00001 arXiv:[0984.00001](https://arxiv.org/abs/0984.00001)
14. Lenstra: title=Galois theory for schemes, author=Hendrik W. Lenstra, year=1985, url=https://api.semanticscholar.org/CorpusID:59409422
15. McLane_Sau: author = Mac Lane, Saunders, title = Categories for the working mathematician., edition = 2nd ed, fseries = Graduate Texts in Mathematics, series = Grad. Texts Math., issn = 0072-5285, volume = 5, isbn = 0-387-98403-8, year = 1998, publisher = New York, NY: Springer, language = English, doi = book/10.1007/978-1-4757-4721-8, keywords = 18-01, zbMATH = 1216133, Zbl = 0906.18001 doi:[book/10.1007/978-1-4757-4721-8](https://doi.org/book/10.1007/978-1-4757-4721-8) arXiv:[0906.18001](https://arxiv.org/abs/0906.18001)
16. Milne_alg_group: author = Milne, J. S., title = Algebraic groups. The theory of group schemes of finite type over a field, fseries = Cambridge Studies in Advanced Mathematics, series = Camb. Stud. Adv. Math., volume = 170, isbn = 978-1-107-16748-3; 978-1-00-901858-6; 978-1-316-71173-6, year = 2017, publisher = Cambridge: Cambridge University Press, language = English, doi = 10.1017/9781316711736, keywords = 14-02,14L15,14L10,14L17,14L30,16T05,17B45, zbMATH = 6713849, Zbl = 1390.14004 doi:[10.1017/9781316711736](https://doi.org/10.1017/9781316711736) arXiv:[1390.14004](https://arxiv.org/abs/1390.14004)
17. Nori: author = Nori, Madhav V., title = The fundamental group-scheme, fjournal = Proceedings of the Indian Academy of Sciences. Mathematical Sciences, journal = Proc. Indian Acad. Sci., Math. Sci., issn = 0253-4142, volume = 91, pages = 73--122, year = 1982, language = English, doi = 10.1007/BF02967978, keywords = 14E20,14L15,14F35,14A15, zbMATH = 3939489, Zbl = 0586.14006 doi:[10.1007/BF02967978](https://doi.org/10.1007/BF02967978) arXiv:[0586.14006](https://arxiv.org/abs/0586.14006)
18. Red_Book: author = Mumford, David, title = The red book of varieties and schemes, fseries = Lecture Notes in Mathematics, series = Lect. Notes Math., issn = 0075-8434, volume = 1358, isbn = 3-540-50497-4, year = 1988, publisher = Berlin etc.: Springer-Verlag, language = English, doi = 10.1007/978-3-662-21581-4, keywords = 14-02,14A10,14-01,14A15, zbMATH = 193787, Zbl = 0658.14001 doi:[10.1007/978-3-662-21581-4](https://doi.org/10.1007/978-3-662-21581-4) arXiv:[0658.14001](https://arxiv.org/abs/0658.14001)
19. Ribes: author = Ribes, Luis and Zalesskii, Pavel, title = Profinite groups., edition = 2nd ed., fseries = Ergebnisse der Mathematik und ihrer Grenzgebiete. 3. Folge, series = Ergeb. Math. Grenzgeb., 3. Folge, issn = 0071-1136, volume = 40, isbn = 978-3-642-01641-7; 978-3-642-01642-4, year = 2010, publisher = Berlin: Springer, language = English, doi = 10.1007/978-3-642-01642-4, keywords = 20E18,20-02,20J05,12G05,20E06,20E05,20E07,20F05, zbMATH = 5662352, Zbl = 1197.20022 doi:[10.1007/978-3-642-01642-4](https://doi.org/10.1007/978-3-642-01642-4) arXiv:[1197.20022](https://arxiv.org/abs/1197.20022)
20. SGA: editor = Grothendieck, A., title = S\'eminaire de g\'eom\'etrie alg\'ebrique du Bois Marie 1960-61. Rev\^etements \'etales et groupe fondamental (SGA 1). Un s\'eminaire dirig\'e par Alexander Grothendieck. Augment\'e de deux expos\'es de M. Raynaud., edition = \'Edition recompos\'ee et annot\'ee du original publi\'e en 1971 par Springer, fseries = Documents Math\'ematiques, series = Doc. Math. (SMF), issn = 1629-4939, volume = 3, isbn = 2-85629-141-4, year = 2003, publisher = Paris: Soci\'et\'e Math\'ematique de France, language = French, keywords = 14-02,14B25,14E20,14F20,14F35, zbMATH = 1992950, Zbl = 1039.14001 arXiv:[1039.14001](https://arxiv.org/abs/1039.14001)
21. Schauenburg: author = Schauenburg, Peter, title = Tannaka duality for arbitrary Hopf algebras, fseries = Algebra-Berichte, series = Algebra-Ber., volume = 66, isbn = 3-88927-100-6, year = 1992, publisher = M\"unchen: R. Fischer, language = English, keywords = 16W30,19D23,18D10,18-02,19-02,17B37,16D90, zbMATH = 773721, Zbl = 0830.16029 arXiv:[0830.16029](https://arxiv.org/abs/0830.16029)
22. Sep_al: author = Ford, Timothy J., title = Separable algebras, fseries = Graduate Studies in Mathematics, series = Grad. Stud. Math., issn = 1065-7339, volume = 183, isbn = 978-1-4704-3770-1; 978-1-4704-4230-9, year = 2017, publisher = Providence, RI: American Mathematical Society (AMS), language = English, doi = 10.1090/gsm/183, keywords = 16H05,13B05,13B40,13J15,12G05,12H05,14F22, zbMATH = 6798476, Zbl = 1422.16014 doi:[10.1090/gsm/183](https://doi.org/10.1090/gsm/183) arXiv:[1422.16014](https://arxiv.org/abs/1422.16014)
23. Serre: author = Serre, Jean-Pierre, title = Algebraic geometry and analytic geometry, fjournal = Annales de l'Institut Fourier, journal = Ann. Inst. Fourier, issn = 0373-0956, volume = 6, pages = 1--42, year = 1956, language = French, doi = 10.5802/aif.59, keywords = 14-02,32-02, url = https://eudml.org/doc/73726, zbMATH = 3125545, Zbl = 0075.30401 doi:[10.5802/aif.59](https://doi.org/10.5802/aif.59) arXiv:[0075.30401](https://arxiv.org/abs/0075.30401)
24. Stacks: author = "Authors, The Stacks Project", title = "Stacks Project", url = "https://stacks.math.columbia.edu/"
25. Szamuely: author = Szamuely, Tam\'as, title = Galois groups and fundamental groups, fseries = Cambridge Studies in Advanced Mathematics, series = Camb. Stud. Adv. Math., volume = 117, isbn = 978-0-521-88850-9, year = 2009, publisher = Cambridge: Cambridge University Press, language = English, doi = 10.1017/CBO9780511627064, keywords = 14-02,14E20,14H30,14F35,12F10,18D10, zbMATH = 5593533, Zbl = 1189.14002 doi:[10.1017/CBO9780511627064](https://doi.org/10.1017/CBO9780511627064) arXiv:[1189.14002](https://arxiv.org/abs/1189.14002)
26. Vakil: author = Vakil, Ravi, title = The rising sea. Foundations of algebraic geometry, isbn = 978-0-691-26866-8; 978-0-691-26867-5; 978-0-691-26868-2, year = 2025, publisher = Princeton, NJ: Princeton University Press, language = English, keywords = 14-01, zbMATH = 7961837
27. anal_compx_func: author = Gunning, Robert C. and Rossi, Hugo, title = Analytic functions of several complex variables, edition = Reprint of the 1965 original, isbn = 978-0-8218-2165-7, year = 2009, publisher = Providence, RI: AMS Chelsea Publishing, language = English, keywords = 01A75,32-01,32Axx,32Bxx,32Cxx, zbMATH = 5619837, Zbl = 1204.01045 arXiv:[1204.01045](https://arxiv.org/abs/1204.01045)
28. droit_p_minus_3_pts: author = Deligne, P., title = Le groupe fondamental de la droite projective moins trois points. (Fundamental group of the straight line minus three points), year = 1989, language = French, howpublished = Galois groups over \(\mathbbQ\), Proc. Workshop, Berkeley/CA (USA) 1987, Publ., Math. Sci. Res. Inst. 16, 79-297 (1989)., keywords = 14H30,14A20, zbMATH = 15170, Zbl = 0742.14022 arXiv:[0742.14022](https://arxiv.org/abs/0742.14022)
29. etale_topology_schemes: author = Artin, M., title = The etale topology of schemes, year = 1968, language = English, howpublished = Tr. Mezhdunarod. Kongr. Mat., Moskva 1966, 44-56 (1968)., zbMATH = 3317595, Zbl = 0199.24603 arXiv:[0199.24603](https://arxiv.org/abs/0199.24603)
30. fundamental_group_of_schemes_thesis: author = "Lukas, Horosiewicz", title = "Fundamental groups of schemes", year = "2022", supervisor = "Sofiaa Tirabassi"
31. galois_descent_Szamuely: author = Gille, Philippe and Szamuely, Tam\'as, title = Central simple algebras and Galois cohomology, edition = 2nd revised and updated edition, fseries = Cambridge Studies in Advanced Mathematics, series = Camb. Stud. Adv. Math., volume = 165, isbn = 978-1-107-15637-1; 978-1-316-60988-0; 978-1-316-66127-7, year = 2017, publisher = Cambridge: Cambridge University Press, language = English, doi = 10.1017/9781316661277, keywords = 19-02,12-02,16-02,12G05,16K20,14F22,19C30, zbMATH = 6732223, Zbl = 1373.19001 doi:[10.1017/9781316661277](https://doi.org/10.1017/9781316661277) arXiv:[1373.19001](https://arxiv.org/abs/1373.19001)
32. milneEtCoH: author = Milne, James S., title = \'Etale cohomology, edition = Reprint of the 1980 edition, fseries = Princeton Mathematical Series, series = Princeton Math. Ser., volume = 33, isbn = 978-0-691-27379-2; 978-0-691-27378-5, year = 2025, publisher = Princeton, NJ: Princeton University Press, language = English, keywords = 14F20,14-02,14-01,14F08,14G10,14G99,14B25, zbMATH = 8031623, Zbl = 1560.14006 arXiv:[1560.14006](https://arxiv.org/abs/1560.14006)
33. munkrs: author = Munkres, James R., title = Topology., edition = 2nd ed., isbn = 0-13-181629-2, year = 2000, publisher = Upper Saddle River, NJ: Prentice Hall, language = English, keywords = 54-01,55-01, zbMATH = 1461253, Zbl = 0951.54001 arXiv:[0951.54001](https://arxiv.org/abs/0951.54001)
34. profinite_waterhouse: author = Waterhouse, William C., title = Profinite groups are Galois groups, fjournal = Proceedings of the American Mathematical Society, journal = Proc. Am. Math. Soc., issn = 0002-9939, volume = 42, pages = 639--640, year = 1974, language = English, doi = 10.2307/2039560, keywords = 20E18,12F10, zbMATH = 3440655, Zbl = 0281.20031 doi:[10.2307/2039560](https://doi.org/10.2307/2039560) arXiv:[0281.20031](https://arxiv.org/abs/0281.20031)
35. set_theory: author = Takeuti, Gaisi and Zaring, Wilson M., title = Introduction to axiomatic set theory. 2nd ed, fseries = Graduate Texts in Mathematics, series = Grad. Texts Math., issn = 0072-5285, volume = 1, year = 1982, publisher = Springer, Cham, language = English, keywords = 03Exx,03-01,03-02,03C62,03E40,03E10,03E25, zbMATH = 3769614, Zbl = 0489.03017 arXiv:[0489.03017](https://arxiv.org/abs/0489.03017)
36. sheaves_geometry_logic: author = Mac Lane, Saunders and Moerdijk, Ieke, title = Sheaves in geometry and logic: a first introduction to topos theory, fseries = Universitext, series = Universitext, issn = 0172-5939, isbn = 0-387-97710-4, year = 1992, publisher = New York etc.: Springer-Verlag, language = English, keywords = 18-01,03-01,18B25,03G30,18-02,03-02,03E99,14F20,18F20,54B40, zbMATH = 53911, Zbl = 0822.18001 arXiv:[0822.18001](https://arxiv.org/abs/0822.18001)
37. waterhouse: author = Waterhouse, William C., title = Introduction to affine group schemes, fseries = Graduate Texts in Mathematics, series = Grad. Texts Math., issn = 0072-5285, volume = 66, year = 1979, publisher = Springer, Cham, language = English, keywords = 14L15,14L17,16W30,16U70,20G15,14-02, zbMATH = 3689557, Zbl = 0442.14017 arXiv:[0442.14017](https://arxiv.org/abs/0442.14017)

