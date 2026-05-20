# Directed type theory, with a twist

GrokRxiv review of [arXiv:2602.17480](https://arxiv.org/abs/2602.17480) · `cs.LO`

## TL;DR

This paper introduces Twisted Type Theory (TTT), a directed type theory extending Martin-Löf Type Theory with novel twist operations, Hom-types equipped with introduction and elimination rules, and dependent 2-sided fibrations (D2SFibs) as the semantic backbone. The novelty specialist (score 0.85, confidence 0.90) confirms the contributions are significant: TTT advances beyond North's 2019 category model by simultaneously satisfying three design desiderata—closed types are categories, categorical structure emerges from typing rules, and directed equalities correspond to path objects—none of which prior systems achieved together. The bibliography is comprehensive (citation confidence 0.95), covering the relevant classical and contemporary landscape. However, the technical correctness reviewer (overall: mostly_sound, confidence 0.62) identifies three major-severity gaps: the Hom-elimination computation rule Hom-Comp is not fully verified (C7), the synthetic Yoneda proof depends on unverified components and an unexplained 12-step chain of strict context isomorphisms (C11), and the overall system soundness is unsupported by any mechanized artifact (C12). The reproducibility specialist (score 0.32, confidence 0.87) flags a critical-severity concern that the headline TTT syntax and semantics lack any executable proof artifact, and three additional major-severity gaps covering Hom-Elim, the D2SFib straightening theorem, and Yoneda. This is the paper's most consequential deficiency relative to the cs.LO publication standard: directly comparable papers (Ahrens–North–van der Weide Bicategorical Type Theory; Neumann–Altenkirch Synthetic 1-Categories) ship companion formalizations. Per the proof-as-code gate, the absence of mechanization for a paper introducing new judgmental equalities warrants major revision.

_Recommendation_: **Major revision** · _Confidence_: 82%

## Strengths

- Significant conceptual novelty: the twist operation and D2SFibs constitute a genuinely new contribution to directed type theory, with a score of 0.85 and verdict 'significant' from the novelty specialist, and a clear delineation from prior systems via three sharp design desiderata.
- Well-motivated design framework: the three desiderata (categories as closed types, emergent categorical structure, directed equalities as path objects) provide precise evaluation criteria and successfully distinguish TTT from both Riehl–Shulman STT and Neumann–Altenkirch extensions of North's theory.
- Solid categorical semantics for the core rules: the category model over Cat, the interpretation of Twist and Hom-Intro via the indexed arrow category, and the appendix verification of D2SFib conditions are internally consistent and mostly sound per the technical correctness specialist.
- Elegant and expressive applications: the internal derivation of natural transformations and the synthetic Yoneda proof demonstrate practical expressiveness, with a proof structure that elegantly mirrors the Yoneda-as-J-rule paradigm from HoTT.
- Comprehensive and well-chosen bibliography: key classical sources (Street 1974, Grothendieck SGA1) and contemporary directed type theories (Ahrens–North 2023, Neumann–Altenkirch 2025, New–Licata 2023) are all appropriately cited with high-relevance entries well-matched to the semantic content.

## Weaknesses

- No mechanized proof artifact (critical/major): the paper introduces new judgmental rules—Twist-Weak, Hom-Comp, directed univalence conversion—whose soundness depends on intertwined strict equalities, yet ships no Coq/Agda/Lean/UniMath formalization of the rules, interpretations, or worked examples; this is the defining deficiency for a cs.LO paper at this level (C12, reproducibility critical concern).
- Hom-elimination and Hom-Comp soundness incompletely verified (major): the appendix leaves three load-bearing checks unaddressed—functoriality of j on composable pairs, strict identity for the D-action in the Hom-Comp case, and the interplay between substitution strictness and the split displayed CC structure (C7).
- Synthetic Yoneda proof depends on unverified components (major): the proof of Yoneda relies on the partially verified Hom-Comp rule and a 12+-step chain of strict context isomorphisms (lemma:yoneda-perm-proof) with several silent steps; the Ψ∘Φ = id direction is not expanded into a diagrammatic check (C11).
- Splitness of the displayed category model is labeled 'folklore' and left unverified (minor): the DCat model's strict-pullback construction does not explicitly verify that the resulting comprehension category is split, leaving a potential gap in the semantic foundation for MLTT-style strict substitution (C3).
- Missing contemporary comparison—Lossin (2026) on fibrations in directed type theory via the Rzk-formalized simplicial approach is not cited, leaving TTT's position relative to the state-of-the-art simplicial approach to directed fibrations underspecified (citation specialist, most significant missing reference).

## Open Questions

- Can the authors provide at least a partial Agda or Coq/UniMath formalization covering the Twist and Hom-Elim/Comp rules and their categorical interpretations, given that the cited Bicategorical Type Theory paper (Ahrens–North–van der Weide 2023) provides full UniMath mechanization as a direct comparator?
- In the Hom-Comp verification, can the authors make explicit that the D-profunctor action on the identity 2-cell (id_γ, (id_a, id_a), id_x) is strictly the identity, and cite the specific splitness condition of the cleavage that guarantees this strict equality?
- Does the directed univalence conversion rule A → B ≡ Hom_Set(A,B) preserve canonicity or normalization for TTT overall, and is there a decision procedure for this judgmental equality that is compatible with the Russell-to-Coquand universe elaboration?
- How does TTT relate to Lossin (2026)'s Rzk-formalized treatment of cocartesian fibrations in Riehl–Shulman STT, and what are the respective tradeoffs between the categorical (D2SFib/Cat-model) and simplicial (bisimplicial set) semantic approaches for directed fibrations?
- Is the name 'Twisted Type Theory' intended to contrast deliberately with or is it independent of earlier uses of similar terminology in stratification-based logics (e.g., Holmes 1995), and would a brief terminological note clarify this for readers?

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
          "Bénabou, Jean"
        ],
        "doi": null,
        "key": "benabou2000distributors",
        "raw": "benabou2000distributors: title = {Distributors at work}, author = {B{\\'e}nabou, Jean}, year = {2000}, url = {https://www2.mathematik.tu-darmstadt.de/ streicher/FIBR/DiWo.pdf}, pubstate = {prepublished}",
        "title": "Distributors at work",
        "url": "https://www2.mathematik.tu-darmstadt.de/ streicher/FIBR/DiWo.pdf",
        "venue": "Prepublished",
        "year": 2000
      },
      "exists": null,
      "explanation": "Cited for the straightening-unstraightening result for distributors (profunctors), providing historical categorical background for the paper's core semantic results.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Bozapalides, Syméon"
        ],
        "doi": null,
        "key": "bozapalides1976theorie",
        "raw": "bozapalides1976theorie: title = {Th{\\'e}orie formelle des bicat{\\'e}gories}, author = {Bozapalides, Sym{\\'e}on}, year = {1976}, publisher = {Ehresmann, Bastiani}, url = {https://ncatlab.org/nlab/files/BOZAPALIDES_theorie_formelle_bicategories.pdf}",
        "title": "Théorie formelle des bicatégories",
        "url": "https://ncatlab.org/nlab/files/BOZAPALIDES_theorie_formelle_bicategories.pdf",
        "venue": "Ehresmann, Bastiani",
        "year": 1976
      },
      "exists": null,
      "explanation": "Provides formal theory of bicategories, relevant to the semantic foundations of directed type theory.",
      "notes": null,
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Hofmann, Martin"
        ],
        "doi": "10.1017/CBO9780511526619.004",
        "key": "hofmannSyntaxSemanticsDependent1997",
        "raw": "hofmannSyntaxSemanticsDependent1997: title = {Syntax and {{Semantics}} of {{Dependent Types}}}, booktitle = {Semantics and {{Logics}} of {{Computation}}}, author = {Hofmann, Martin}, editor = {Pitts, Andrew M. and Dybjer, P.}, year = 1997, month = jan, edition = {1}, pages = {79--130}, publisher = {Cambridge University Press}, doi = {10.1017/CBO9780511526619.004}, urldate = {2024-03-08}, isbn = {978-0-521-58057-1 978-0-521-11846-0 978-0-511-52661-9}, file = {/home/fernando/Zotero/storage/6VQDN7HI/Syntax and Semantics of Dependent Types - Hofmann.djvu}",
        "title": "Syntax and Semantics of Dependent Types",
        "url": null,
        "venue": "Semantics and Logics of Computation",
        "year": 1997
      },
      "exists": null,
      "explanation": "Used as a standard survey for the syntax and semantics of Martin-Löf Type Theory (MLTT), upon which TTT is built.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Loregian, Fosco"
        ],
        "doi": null,
        "key": "loregianCoendCalculus2021",
        "raw": "loregianCoendCalculus2021: title = {({{Co}})End {{Calculus}}}, author = {Loregian, Fosco}, year = 2021, series = {London {{Mathematical Society Lecture Note Ser}}}, number = {v.468}, publisher = {Cambridge University Press}, address = {Cambridge}, abstract = {This easy-to-cite handbook gives the first systematic treatment of the (co)end calculus in category theory and its applications}, isbn = {978-1-108-78860-1}, langid = {english}",
        "title": "(Co)End Calculus",
        "url": null,
        "venue": "London Mathematical Society Lecture Note Ser",
        "year": 2021
      },
      "exists": null,
      "explanation": "Cited for the straightening-unstraightening theorem (Theorem 5.1), which is central to the paper's characterization of D2SFibs.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Jacobs, Bart"
        ],
        "doi": null,
        "key": "jacobsCategoricalLogicType2001",
        "raw": "jacobsCategoricalLogicType2001: title = {Categorical Logic and Type Theory}, author = {Jacobs, Bart}, year = 2001, series = {Studies in Logic and the Foundations of Mathematics}, edition = {paperback ed}, number = {141}, publisher = {Elsevier}, address = {Amsterdam}, isbn = {978-0-444-50853-9 978-0-444-50170-7}, langid = {english}, file = {/home/fernando/Zotero/storage/I2G5KHIP/Jacobs - 2001 - Categorical logic and type theory.pdf}",
        "title": "Categorical Logic and Type Theory",
        "url": null,
        "venue": "Studies in Logic and the Foundations of Mathematics",
        "year": 2001
      },
      "exists": null,
      "explanation": "General reference for the categorical logic and type theory background required for the paper.",
      "notes": null,
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Ahrens, Benedikt",
          "North, Paige Randall",
          "Van Der Weide, Niels"
        ],
        "doi": "10.1017/S0960129523000312",
        "key": "ahrensBicategoricalTypeTheory2023",
        "raw": "ahrensBicategoricalTypeTheory2023: title = {Bicategorical Type Theory: Semantics and Syntax}, shorttitle = {Bicategorical Type Theory}, author = {Ahrens, Benedikt and North, Paige Randall and Van Der Weide, Niels}, year = 2023, month = nov, journal = {Mathematical Structures in Computer Science}, volume = {33}, number = {10}, pages = {868--912}, issn = {0960-1295, 1469-8072}, doi = {10.1017/S0960129523000312}, urldate = {2026-01-23}, abstract = {Abstract We develop semantics and syntax for bicategorical type theory. Bicategorical type theory features contexts, types, terms, and directed reductions between terms. This type theory is naturally interpreted in a class of structured bicategories. We start by developing the semantics, in the form of comprehension bicategories . Examples of comprehension bicategories are plentiful; we study both specific examples as well as classes of examples constructed from other data. From the notion of comprehension bicategory, we extract the syntax of bicategorical type theory, that is, judgment forms and structural inference rules. We prove soundness of the rules by giving an interpretation in any comprehension bicategory. The semantic aspects of our work are fully checked in the Coq proof assistant, based on the UniMath library.}, langid = {english}, file = {/home/fernando/Zotero/storage/AF5JEPQT/Ahrens et al. - 2023 - Bicategorical type theory semantics and syntax.pdf}",
        "title": "Bicategorical Type Theory: Semantics and Syntax",
        "url": null,
        "venue": "Mathematical Structures in Computer Science",
        "year": 2023
      },
      "exists": null,
      "explanation": "Cited as an example of a directed type theory that gives the category of contexts a bicategorical structure, generalizing earlier 2-dimensional work.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Cohen, Cyril",
          "Coquand, Thierry",
          "Huber, Simon",
          "Mörtberg, Anders"
        ],
        "doi": "10.4230/LIPICS.TYPES.2015.5",
        "key": "cohenCubicalTypeTheory2018",
        "raw": "cohenCubicalTypeTheory2018: title = {Cubical {{Type Theory}}: {{A Constructive Interpretation}} of the {{Univalence Axiom}}}, shorttitle = {Cubical {{Type Theory}}}, author = {Cohen, Cyril and Coquand, Thierry and Huber, Simon and M{\\\"o}rtberg, Anders}, editor = {Uustalu, Tarmo}, year = 2018, journal = {LIPIcs, Volume 69, TYPES 2015}, volume = {69}, pages = {5:1-5:34}, publisher = {Schloss Dagstuhl -- Leibniz-Zentrum f\\\"ur Informatik}, issn = {1868-8969}, doi = {10.4230/LIPICS.TYPES.2015.5}, urldate = {2026-01-23}, abstract = {This paper presents a type theory in which it is possible to directly manipulate \\$n\\$-dimensional cubes (points, lines, squares, cubes, etc.) based on an interpretation of dependent type theory in a cubical set model. This enables new ways to reason about identity types, for instance, function extensionality is directly provable in the system. Further, Voevodsky's univalence axiom is provable in this system. We also explain an extension with some higher inductive types like the circle and propositional truncation. Finally we provide semantics for this cubical type theory in a constructive meta-theory.}, copyright = {Creative Commons Attribution 3.0 Unported license, info:eu-repo/semantics/openAccess}, isbn = {9783959770309}, langid = {english}, keywords = {cubical sets,dependent type theory,univalence axiom}",
        "title": "Cubical Type Theory",
        "url": null,
        "venue": "LIPIcs, Volume 69, TYPES 2015",
        "year": 2018
      },
      "exists": null,
      "explanation": "Cited for comparison with Riehl & Shulman's STT, which is reminiscent of Cubical Type Theory.",
      "notes": null,
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "New, Max S.",
          "Licata, Daniel R."
        ],
        "doi": "10.1007/978-3-031-30829-1_6",
        "key": "newFormalLogicFormal2023",
        "raw": "newFormalLogicFormal2023: title = {A {{Formal Logic}} for {{Formal Category Theory}}}, booktitle = {Foundations of {{Software Science}} and {{Computation Structures}}}, author = {New, Max S. and Licata, Daniel R.}, editor = {Kupferman, Orna and Sobocinski, Pawel}, year = {2023}, volume = {13992}, pages = {113--134}, publisher = {Springer Nature Switzerland}, location = {Cham}, doi = {10.1007/978-3-031-30829-1_6}, urldate = {2026-01-22}, abstract = {Abstract We present a domain-specific type theory for constructions and proofs in category theory. The type theory axiomatizes notions of category, functor, profunctor and a generalized form of natural transformations. The type theory imposes an ordered linear restriction on standard predicate logic, which guarantees that all functions between categories are functorial, all relations are profunctorial, and all transformations are natural by construction, with no separate proofs necessary. Important category-theoretic proofs such as the Yoneda lemma and Co-yoneda lemma become simple type-theoretic proofs about the relationship between unit, tensor and (ordered) function types, and can be seen to be ordered refinements of theorems in predicate logic. The type theory is sound and complete for a categorical model in virtual equipments , which model both internal and enriched category theory. While the proofs in our type theory look like standard set-based arguments, the syntactic discipline ensure that all proofs and constructions carry over to enriched and internal settings as well.}, isbn = {978-3-031-30828-4 978-3-031-30829-1}, langid = {english}, file = {/home/fernando/Zotero/storage/2QSWSHZX/New and Licata - 2023 - A Formal Logic for Formal Category Theory.pdf}",
        "title": "A Formal Logic for Formal Category Theory",
        "url": null,
        "venue": "Foundations of Software Science and Computation Structures",
        "year": 2023
      },
      "exists": null,
      "explanation": "Cited as a related directed type theory whose semantics are based on virtual equipments.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2410.06792",
        "authors": [
          "Nasu, Hayato"
        ],
        "doi": "10.48550/ARXIV.2410.06792",
        "key": "nasuInternalLogicVirtual2024",
        "raw": "nasuInternalLogicVirtual2024: title = {An {{Internal Logic}} of {{Virtual Double Categories}}}, author = {Nasu, Hayato}, year = {2024}, doi = {10.48550/ARXIV.2410.06792}, urldate = {2026-01-22}, abstract = {We present a type theory called fibrational virtual double type theory (FVDblTT) designed specifically for formal category theory, which is a succinct reformulation of New and Licata's Virtual Equipment Type Theory (VETT). FVDblTT formalizes reasoning on isomorphisms that are commonly employed in category theory. Virtual double categories are one of the most successful frameworks for developing formal category theory, and FVDblTT has them as a theoretical foundation. We validate its worth as an internal language of virtual double categories by providing a syntax-semantics duality between virtual double categories and specifications in FVDblTT as a biadjunction.}, pubstate = {prepublished}, version = {2}, keywords = {18C50 18D70 18N10(Primary) 68Q65 18D60 (Secondary),Category Theory (math.CT),FOS: Computer and information sciences,FOS: Mathematics,Logic in Computer Science (cs.LO)}",
        "title": "An Internal Logic of Virtual Double Categories",
        "url": null,
        "venue": "arXiv",
        "year": 2024
      },
      "exists": null,
      "explanation": "Cited as a related directed type theory based on virtual double categories.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Ahrens, Benedikt",
          "North, Paige Randall",
          "Van Der Weide, Niels"
        ],
        "doi": "10.1145/3531130.3533334",
        "key": "ahrensSemanticsTwodimensionalType2022",
        "raw": "ahrensSemanticsTwodimensionalType2022: title = {Semantics for Two-Dimensional Type Theory}, booktitle = {Proceedings of the 37th {{Annual ACM}}/{{IEEE Symposium}} on {{Logic}} in {{Computer Science}}}, author = {Ahrens, Benedikt and North, Paige Randall and Van Der Weide, Niels}, date = {2022-08-02}, pages = {1--14}, publisher = {ACM}, location = {Haifa Israel}, doi = {10.1145/3531130.3533334}, urldate = {2026-01-22}, eventtitle = {{{LICS}} '22: 37th {{Annual ACM}}/{{IEEE Symposium}} on {{Logic}} in {{Computer Science}}}, isbn = {978-1-4503-9351-5}, langid = {english}, file = {/home/fernando/Zotero/storage/6E43HRLE/Ahrens et al. - 2022 - Semantics for two-dimensional type theory.pdf}",
        "title": "Semantics for Two-Dimensional Type Theory",
        "url": null,
        "venue": "Proceedings of the 37th Annual ACM/IEEE Symposium on Logic in Computer Science",
        "year": 2022
      },
      "exists": null,
      "explanation": "Relevant work on the semantics of 2D type theory, contributing to the development of directed type theories.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Coquand, Thierry"
        ],
        "doi": null,
        "key": "coquandPresheafModelType2013",
        "raw": "coquandPresheafModelType2013: title = {Presheaf Model of Type Theory}, author = {Coquand, Thierry}, year = {2013}, url = {https://www.cse.chalmers.se/ coquand/presheaf.pdf}, pubstate = {prepublished}",
        "title": "Presheaf Model of Type Theory",
        "url": "https://www.cse.chalmers.se/ coquand/presheaf.pdf",
        "venue": "Prepublished",
        "year": 2013
      },
      "exists": null,
      "explanation": "Cited for the assumption of Coquand universes in the category model of TTT.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Rezk, Charles"
        ],
        "doi": null,
        "key": "rezk1996model",
        "raw": "rezk1996model: title = {A model category for categories}, author = {Rezk, Charles}, year = {1996}, url = {https://ncatlab.org/nlab/files/Rezk_ModelCategoryForCategories.pdf}, pubstate = {prepublished}",
        "title": "A model category for categories",
        "url": "https://ncatlab.org/nlab/files/Rezk_ModelCategoryForCategories.pdf",
        "venue": "Prepublished",
        "year": 1996
      },
      "exists": null,
      "explanation": "Provides the model category for categories, relevant to the semantic underpinnings of directed type theories.",
      "notes": null,
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "North, Paige Randall"
        ],
        "doi": "10.17863/CAM.11207",
        "key": "northTypeTheoreticWeak2017",
        "raw": "northTypeTheoreticWeak2017: title = {Type Theoretic Weak Factorization Systems}, author = {North, Paige Randall}, year = 2017, month = jun, doi = {10.17863/CAM.11207}, urldate = {2026-01-30}, abstract = {This thesis presents a characterization of those categories with weak factorization systems that can interpret the theory of intensional dependent type theory with {$\\Sigma$}, {$\\Pi$}, and identity types. We use display map categories to serve as models of intensional dependent type theory. If a display map category (C, D) models {$\\Sigma$} and identity types, then this structure generates a weak factorization system (L, R). Moreover, we show that if the underlying category C is Cauchy complete, then (C, R) is also a display map category modeling {$\\Sigma$} and identity types (as well as {$\\Pi$} types if (C, D) models {$\\Pi$} types). Thus, our main result is to characterize display map categories (C, R) which model {$\\Sigma$} and identity types and where R is part of a weak factorization system (L, R) on the category C. We offer three such characterizations and show that they are all equivalent when C has all finite limits. The first is that the weak factorization system (L, R) has the properties that L is stable under pullback along R and all maps to a terminal object are in R. We call such weak factorization systems type theoretic. The second is that the weak factorization system has what we call an Id-presentation: it can be built from certain categorical structure in the same way that a model of {$\\Sigma$} and identity types generates a weak factorization system. The third is that the weak factorization system (L, R) is generated by a Moore relation system. This is a technical tool used to establish the equivalence between the first and second characterizations described. To conclude the thesis, we describe a certain class of convenient categories of topological spaces (a generalization of compactly generated weak Hausdorff spaces). We then construct a Moor... [truncated]",
        "title": "Type Theoretic Weak Factorization Systems",
        "url": null,
        "venue": "PhD Thesis",
        "year": 2017
      },
      "exists": null,
      "explanation": "Foundation for understanding weak factorization systems in the context of type theory, relevant to the paper's discussion on model structures.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Awodey, Steve",
          "Warren, Michael A."
        ],
        "doi": "10.1017/S0305004108001783",
        "key": "awodeyHomotopyTheoreticModels2009",
        "raw": "awodeyHomotopyTheoreticModels2009: title = {Homotopy Theoretic Models of Identity Types}, author = {Awodey, Steve and Warren, Michael A.}, year = 2009, month = jan, journal = {Mathematical Proceedings of the Cambridge Philosophical Society}, volume = {146}, number = {1}, pages = {45--55}, issn = {0305-0041, 1469-8064}, doi = {10.1017/S0305004108001783}, urldate = {2025-02-17}, abstract = {Quillen [17] introduced model categories as an abstract framework for homotopy theory which would apply to a wide range of mathematical settings. By all accounts this program has been a success and---as, e.g., the work of Voevodsky on the homotopy theory of schemes [15] or the work of Joyal [11, 12] and Lurie [13] on quasicategories seem to indicate---it will likely continue to facilitate mathematical advances. In this paper we present a novel connection between model categories and mathematical logic, inspired by the groupoid model of (intensional) Martin--L\\\"of type theory [14] due to Hofmann and Streicher [9]. In particular, we show that a form of Martin--L\\\"of type theory can be soundly modelled in any model category. This result indicates moreover that any model category has an associated ``internal language'' which is itself a form of Martin-L\\\"of type theory. This suggests applications both to type theory and to homotopy theory. Because Martin--L\\\"of type theory is, in one form or another, the theoretical basis for many of the computer proof assistants currently in use, such as Coq and Agda (cf. [3] and [5]), this promise of applications is of a practical, as well as theoretical, nature.}, copyright = {https://www.cambridge.org/core/terms}, langid = {english}, file = {/home/fernando/Zotero/storage/DKARBPZS/Awodey and Warren - 2009 - Homotopy theoretic models of identity types.pdf}",
        "title": "Homotopy Theoretic Models of Identity Types",
        "url": null,
        "venue": "Mathematical Proceedings of the Cambridge Philosophical Society",
        "year": 2009
      },
      "exists": null,
      "explanation": "Cited for the interpretation of identity types in model categories, providing the homotopy-theoretic context for identity types.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Grothendieck, Alexander"
        ],
        "doi": null,
        "key": "grothendieckRevetementsEtalesGroupe2003",
        "raw": "grothendieckRevetementsEtalesGroupe2003: title = {{Rev\\^etements \\'etales et groupe fondamental (SGA1)}}, shorttitle = {{Rev\\^etements \\'etales et groupe fondamental}}, editor = {Grothendieck, Alexander and Raynaud, Mich{\\`e}le}, year = 2003, series = {{Documents math\\'ematiques}}, number = {3}, publisher = {Soc. Math\\'ematique de France}, address = {Paris}, isbn = {978-2-85629-141-2}, langid = {fre}",
        "title": "Revêtements étales et groupe fondamental (SGA1)",
        "url": null,
        "venue": "Documents mathématiques",
        "year": 2003
      },
      "exists": null,
      "explanation": "Cited for the well-known result giving a different perspective on comprehension categories via fibrations.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Street, Ross"
        ],
        "doi": "10.1007/BFb0063102",
        "key": "streetFibrationsYonedasLemma1974",
        "raw": "streetFibrationsYonedasLemma1974: title = {Fibrations and {{Yoneda}}'s Lemma in a 2-Category}, booktitle = {Category {{Seminar}}}, author = {Street, Ross}, editor = {Kelly, Gregory M.}, year = 1974, volume = {420}, pages = {104--133}, publisher = {Springer Berlin Heidelberg}, address = {Berlin, Heidelberg}, doi = {10.1007/BFb0063102}, urldate = {2025-01-13}, copyright = {http://www.springer.com/tdm}, isbn = {978-3-540-06966-9 978-3-540-37270-7}, file = {/home/fernando/Zotero/storage/JX7NRFE4/Street - 1974 - Fibrations and Yoneda's lemma in a 2-category.pdf}",
        "title": "Fibrations and Yoneda's Lemma in a 2-Category",
        "url": null,
        "venue": "Category Seminar",
        "year": 1974
      },
      "exists": null,
      "explanation": "Primary source for the notion of 2-sided fibrations and their relation to profunctors, which the paper generalizes to the dependent case.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Dybjer, Peter"
        ],
        "doi": "10.1007/3-540-61780-9_66",
        "key": "dybjerInternalTypeTheory1996",
        "raw": "dybjerInternalTypeTheory1996: title = {Internal Type Theory}, booktitle = {Types for {{Proofs}} and {{Programs}}}, author = {Dybjer, Peter}, editor = {Berardi, Stefano and Coppo, Mario}, editora = {Goos, Gerhard and Hartmanis, Juris and Leeuwen, Jan}, editoratype = {redactor}, date = {1996}, volume = {1158}, pages = {120--134}, publisher = {Springer Berlin Heidelberg}, location = {Berlin, Heidelberg}, doi = {10.1007/3-540-61780-9_66}, url = {http://link.springer.com/10.1007/3-540-61780-9_66}, urldate = {2025-02-24}, isbn = {978-3-540-61780-8 978-3-540-70722-6}, file = {/home/fernando/Zotero/storage/EEPQQLVJ/Dybjer - 1996 - Internal type theory.pdf}",
        "title": "Internal Type Theory",
        "url": "http://link.springer.com/10.1007/3-540-61780-9_66",
        "venue": "Types for Proofs and Programs",
        "year": 1996
      },
      "exists": null,
      "explanation": "Cited for internal type theory, providing context for the development of languages for categories.",
      "notes": null,
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2503.10868",
        "authors": [
          "Najmaei, Niyousha",
          "van der Weide, Niels",
          "Ahrens, Benedikt",
          "North, Paige Randall"
        ],
        "doi": "10.48550/ARXIV.2503.10868",
        "key": "najmaeiTypeTheoryComprehension2025",
        "raw": "najmaeiTypeTheoryComprehension2025: title = {A {{Type Theory}} for {{Comprehension Categories}} with {{Applications}} to {{Subtyping}}}, author = {Najmaei, Niyousha and family=Weide, given=Niels, prefix=van der, useprefix=true and Ahrens, Benedikt and North, Paige Randall}, date = {2025}, doi = {10.48550/ARXIV.2503.10868}, url = {https://arxiv.org/abs/2503.10868}, urldate = {2025-10-06}, abstract = {In this paper we develop a type theory that we show is an internal language for comprehension categories. This type theory is closely related to Martin-Löf type theory (MLTT). Indeed, semantics of MLTT are often given in comprehension categories, albeit usually only in discrete or full ones. As we explain, requiring a comprehension category to be full or discrete can be understood as removing one `dimension' of morphisms. Thus, in our syntax, we recover this extra dimension. We show that this extra dimension can be used to encode subtyping in a natural way. Important instances of non-full comprehension categories include ones used for constructive or univalent intensional models of MLTT and directed type theory, and so our syntax is a more faithful internal language for these than is MLTT.}, pubstate = {prepublished}, version = {1}, keywords = {Category Theory (math.CT),FOS: Computer and information sciences,FOS: Mathematics,Logic in Computer Science (cs.LO),Programming Languages (cs.PL)}",
        "title": "A Type Theory for Comprehension Categories with Applications to Subtyping",
        "url": "https://arxiv.org/abs/2503.10868",
        "venue": "arXiv",
        "year": 2025
      },
      "exists": null,
      "explanation": "Develops an internal language for comprehension categories, providing recent related work on the link between type theory and categorical semantics.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Ahrens, Benedikt",
          "Lumsdaine, Peter LeFanu"
        ],
        "doi": "10.23638/LMCS-15(1:20)2019",
        "key": "ahrensDisplayedCategories2019",
        "raw": "ahrensDisplayedCategories2019: title = {Displayed {{Categories}}}, author = {Ahrens, Benedikt and Lumsdaine, Peter LeFanu}, date = {2019-03-05}, journaltitle = {Logical Methods in Computer Science}, volume = {Volume 15, Issue 1}, pages = {4308}, issn = {1860-5974}, doi = {10.23638/LMCS-15(1:20)2019}, urldate = {2025-10-03}, abstract = {We introduce and develop the notion of *displayed categories*. A displayed category over a category C is equivalent to \\&quot;a category D and functor F : D --\\&gt; C\\&quot;, but instead of having a single collection of \\&quot;objects of D\\&quot; with a map to the objects of C, the objects are given as a family indexed by objects of C, and similarly for the morphisms. This encapsulates a common way of building categories in practice, by starting with an existing category and adding extra data/properties to the objects and morphisms. The interest of this seemingly trivial reformulation is that various properties of functors are more naturally defined as properties of the corresponding displayed categories. Grothendieck fibrations, for example, when defined as certain functors, use equality on objects in their definition. When defined instead as certain displayed categories, no reference to equality on objects is required. Moreover, almost all examples of fibrations in nature are, in fact, categories whose standard construction can be seen as going via displayed categories. We therefore propose displayed categories as a basis for the development of fibrations in the type-theoretic setting, and similarly for various other notions whose classical definitions involve equality on objects. Besides giving a conceptual clarification of such issues, displayed categories also provide a powerful tool in computer formalisation, unifying and abstracting common constructions and proof techniques of category theory, and enabling modular reasoning about categories of multi-component structures. As such, most of the material of this ... [truncated]",
        "title": "Displayed Categories",
        "url": null,
        "venue": "Logical Methods in Computer Science",
        "year": 2019
      },
      "exists": null,
      "explanation": "Primary source for the term \"displayed category,\" which the paper uses to study functors to a base category.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Jacobs, Bart"
        ],
        "doi": "10.1016/0304-3975(93)90169-T",
        "key": "jacobsComprehensionCategoriesSemantics1993",
        "raw": "jacobsComprehensionCategoriesSemantics1993: title = {Comprehension Categories and the Semantics of Type Dependency}, author = {Jacobs, Bart}, date = {1993-01}, journaltitle = {Theoretical Computer Science}, shortjournal = {Theoretical Computer Science}, volume = {107}, number = {2}, pages = {169--207}, issn = {03043975}, doi = {10.1016/0304-3975(93)90169-T}, urldate = {2024-05-02}, langid = {english}, file = {/home/fernando/Zotero/storage/W5L5W3XF/Jacobs - 1993 - Comprehension categories and the semantics of type.pdf}",
        "title": "Comprehension Categories and the Semantics of Type Dependency",
        "url": null,
        "venue": "Theoretical Computer Science",
        "year": 1993
      },
      "exists": null,
      "explanation": "Primary source for the result that full split comprehension categories provide semantics for MLTT.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Street, Ross"
        ],
        "doi": null,
        "key": "street_fibrations_1980",
        "raw": "street_fibrations_1980: title = {Fibrations in bicategories}, volume = {21}, url = {http://www.numdam.org/item/CTGDC_1980__21_2_111_0/}, language = {en}, number = {2}, journal = {Cahiers de topologie et géométrie différentielle}, author = {Street, Ross}, year = {1980}, note = {(Corrections in 28(1):53–56, 1987)}, pages = {111--160}, file = {Street - 1980 - Fibrations in bicategories.pdf:/home/fernando/Zotero/storage/5IP4T9XM/Street - 1980 - Fibrations in bicategories.pdf:application/pdf}",
        "title": "Fibrations in bicategories",
        "url": "http://www.numdam.org/item/CTGDC_1980__21_2_111_0/",
        "venue": "Cahiers de topologie et géométrie différentielle",
        "year": 1980
      },
      "exists": null,
      "explanation": "Cited for the observation that for a category A, the functor <dom, cod> can be obtained from the profunctor hom_A.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Chu, Fernando",
          "Mangel, Éléonore",
          "North, Paige Randall"
        ],
        "doi": null,
        "key": "chu_fernando_directed_2024",
        "raw": "chu_fernando_directed_2024: title = {A directed type theory for 1-categories}, booktitle = {30th {International} {Conference} on {Types} for {Proofs} and {Programs} ({TYPES} 2024)}, author = {{Chu, Fernando} and {Mangel, Éléonore} and {North, Paige Randall}}, year = {2024}",
        "title": "A directed type theory for 1-categories",
        "url": null,
        "venue": "30th International Conference on Types for Proofs and Programs (TYPES 2024)",
        "year": 2024
      },
      "exists": null,
      "explanation": "Earlier version or related work by the same authors on directed type theory for 1-categories.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Hofmann, Martin",
          "Streicher, Thomas"
        ],
        "doi": null,
        "key": "hofmann_groupoid_1998",
        "raw": "hofmann_groupoid_1998: title = {The groupoid interpretation of type theory}, booktitle = {Twenty-{Five} {Years} of {Constructive} {Type} {Theory}}, publisher = {Oxford University Press}, author = {Hofmann, Martin and Streicher, Thomas}, year = {1998}, pages = {83--111}, file = {Hofmann and Streicher - 1998 - The groupoid interpretation of type theory.pdf:/home/fernando/Zotero/storage/Q7YWQ2X7/Hofmann and Streicher - 1998 - The groupoid interpretation of type theory.pdf:application/pdf}",
        "title": "The groupoid interpretation of type theory",
        "url": null,
        "venue": "Twenty-Five Years of Constructive Type Theory",
        "year": 1998
      },
      "exists": null,
      "explanation": "Seminal paper that constructed the groupoid model of MLTT, a foundational work for HoTT and its extensions.",
      "notes": null,
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Fajstrup, Lisbeth",
          "Goubault, Eric",
          "Haucourt, Emmanuel",
          "Mimram, Samuel",
          "Raussen, Martin"
        ],
        "doi": "10.1007/978-3-319-15398-8",
        "key": "fajstrup_directed_2016",
        "raw": "fajstrup_directed_2016: address = {Cham}, title = {Directed {Algebraic} {Topology} and {Concurrency}}, copyright = {http://www.springer.com/tdm}, isbn = {978-3-319-15397-1 978-3-319-15398-8}, url = {http://link.springer.com/10.1007/978-3-319-15398-8}, language = {en}, urldate = {2025-02-17}, publisher = {Springer International Publishing}, author = {Fajstrup, Lisbeth and Goubault, Eric and Haucourt, Emmanuel and Mimram, Samuel and Raussen, Martin}, year = {2016}, doi = {10.1007/978-3-319-15398-8}",
        "title": "Directed Algebraic Topology and Concurrency",
        "url": "http://link.springer.com/10.1007/978-3-319-15398-8",
        "venue": "Springer International Publishing",
        "year": 2016
      },
      "exists": null,
      "explanation": "Provides the broader context of directed algebraic topology and its applications to concurrency, which motivates the development of directed type theory.",
      "notes": null,
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Ahrens, Benedikt",
          "North, Paige Randall",
          "Shulman, Michael",
          "Tsementzis, Dimitris"
        ],
        "doi": "10.1145/3373718.3394755",
        "key": "ahrens_higher_2020",
        "raw": "ahrens_higher_2020: address = {Saarbrücken Germany}, title = {A {Higher} {Structure} {Identity} {Principle}}, isbn = {978-1-4503-7104-9}, doi = {10.1145/3373718.3394755}, language = {en}, urldate = {2024-10-17}, booktitle = {Proceedings of the 35th {Annual} {ACM}/{IEEE} {Symposium} on {Logic} in {Computer} {Science}}, publisher = {ACM}, author = {Ahrens, Benedikt and North, Paige Randall and Shulman, Michael and Tsementzis, Dimitris}, month = jul, year = {2020}, pages = {53--66}, file = {Full Text:/home/fernando/Zotero/storage/CDYPWQST/Ahrens et al. - 2020 - A Higher Structure Identity Principle.pdf:application/pdf}",
        "title": "A Higher Structure Identity Principle",
        "url": null,
        "venue": "Proceedings of the 35th Annual ACM/IEEE Symposium on Logic in Computer Science",
        "year": 2020
      },
      "exists": null,
      "explanation": "Cited as an application of HoTT (the Structure Identity Principle) used to transport properties between equivalent structures.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Brunerie, Guillaume"
        ],
        "doi": "10.1007/s10817-018-9468-2",
        "key": "brunerie_james_2019",
        "raw": "brunerie_james_2019: title = {The {James} {Construction} and $\\pi_4(\\mathbb{S}^3)$ in {Homotopy} {Type} {Theory}}, volume = {63}, issn = {0168-7433, 1573-0670}, doi = {10.1007/s10817-018-9468-2}, language = {en}, number = {2}, urldate = {2025-02-20}, journal = {Journal of Automated Reasoning}, author = {Brunerie, Guillaume}, month = aug, year = {2019}, pages = {255--284}",
        "title": "The James Construction and $\\pi_4(\\mathbb{S}^3)$ in Homotopy Type Theory",
        "url": null,
        "venue": "Journal of Automated Reasoning",
        "year": 2019
      },
      "exists": null,
      "explanation": "Example of synthetic reasoning in HoTT, specifically the computation of homotopy groups of CW-complexes.",
      "notes": null,
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Kovács, András"
        ],
        "doi": "10.4230/LIPICS.CSL.2022.28",
        "key": "kovacs_generalized_2022",
        "raw": "kovacs_generalized_2022: title = {Generalized {Universe} {Hierarchies} and {First}-{Class} {Universe} {Levels}}, volume = {216}, copyright = {Creative Commons Attribution 4.0 International license, info:eu-repo/semantics/openAccess}, issn = {1868-8969}, doi = {10.4230/LIPICS.CSL.2022.28}, abstract = {In type theories, universe hierarchies are commonly used to increase the expressive power of the theory while avoiding inconsistencies arising from size issues. There are numerous ways to specify universe hierarchies, and theories may differ in details of cumulativity, choice of universe levels, specification of type formers and eliminators, and available internal operations on levels. In the current work, we aim to provide a framework which covers a large part of the design space. First, we develop syntax and semantics for cumulative universe hierarchies, where levels may come from any set equipped with a transitive well-founded ordering. In the semantics, we show that induction-recursion can be used to model transfinite hierarchies, and also support lifting operations on type codes which strictly preserve type formers. Then, we consider a setup where universe levels are first-class types and subject to arbitrary internal reasoning. This generalizes the bounded polymorphism features of Coq and at the same time the internal level computations in Agda.}, language = {en}, urldate = {2025-03-01}, journal = {LIPIcs, Volume 216, CSL 2022}, author = {Kovács, András}, collaborator = {Manea, Florin and Simpson, Alex}, year = {2022}, keywords = {Theory of computation â†’ Type theory, type theory, universes}, pages = {28:1--28:17}",
        "title": "Generalized Universe Hierarchies and First-Class Universe Levels",
        "url": null,
        "venue": "LIPIcs, Volume 216, CSL 2022",
        "year": 2022
      },
      "exists": null,
      "explanation": "Cited for the assumption of universe inclusions and hierarchies in TTT.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Licata, Daniel R.",
          "Brunerie, Guillaume"
        ],
        "doi": "10.1007/978-3-319-03545-1_1",
        "key": "hutchison_pi_n_2013",
        "raw": "hutchison_pi_n_2013: address = {Cham}, title = {$\\pi_n({S})^n$ in {Homotopy} {Type} {Theory}}, volume = {8307}, isbn = {978-3-319-03544-4 978-3-319-03545-1}, language = {en}, urldate = {2025-02-20}, booktitle = {Certified {Programs} and {Proofs}}, publisher = {Springer International Publishing}, author = {Licata, Daniel R. and Brunerie, Guillaume}, editor = {Hutchison, David and Kanade, Takeo and Kittler, Josef and Kleinberg, Jon M. and Mattern, Friedemann and Mitchell, John C. and Naor, Moni and Nierstrasz, Oscar and Pandu Rangan, C. and Steffen, Bernhard and Sudan, Madhu and Terzopoulos, Demetri and Tygar, Doug and Vardi, Moshe Y. and Weikum, Gerhard and Gonthier, Georges and Norrish, Michael}, year = {2013}, doi = {10.1007/978-3-319-03545-1_1}, note = {Series Title: Lecture Notes in Computer Science}, pages = {1--16}",
        "title": "$\\pi_n({S})^n$ in Homotopy Type Theory",
        "url": null,
        "venue": "Certified Programs and Proofs",
        "year": 2013
      },
      "exists": null,
      "explanation": "Another example of synthetic reasoning in HoTT, computing homotopy groups.",
      "notes": null,
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Ahrens, Benedikt",
          "Kapulkin, Krzysztof",
          "Shulman, Michael"
        ],
        "doi": "10.1017/S0960129514000486",
        "key": "ahrens_univalent_2015",
        "raw": "ahrens_univalent_2015: title = {Univalent categories and the {Rezk} completion}, volume = {25}, copyright = {https://www.cambridge.org/core/terms}, issn = {0960-1295, 1469-8072}, url = {https://www.cambridge.org/core/product/identifier/S0960129514000486/type/journal_article}, doi = {10.1017/S0960129514000486}, abstract = {We develop category theory within Univalent Foundations, which is a foundational system for mathematics based on a homotopical interpretation of dependent type theory. In this system, we propose a definition of â€˜categoryâ€™ for which equality and equivalence of categories agree. Such categories satisfy a version of the univalence axiom, saying that the type of isomorphisms between any two objects is equivalent to the identity type between these objects; we call them â€˜saturatedâ€™ or â€˜univalentâ€™ categories. Moreover, we show that any category is weakly equivalent to a univalent one in a universal way. In homotopical and higher-categorical semantics, this construction corresponds to a truncated version of the Rezk completion for Segal spaces, and also to the stack completion of a prestack.}, language = {en}, number = {5}, urldate = {2025-02-20}, journal = {Mathematical Structures in Computer Science}, author = {Ahrens, Benedikt and Kapulkin, Krzysztof and Shulman, Michael}, month = jun, year = {2015}, pages = {1010--1039}, file = {Full Text:/home/fernando/Zotero/storage/QZ5RZ9HZ/Ahrens et al. - 2015 - Univalent categories and the Rezk completion.pdf:application/pdf}",
        "title": "Univalent categories and the Rezk completion",
        "url": "https://www.cambridge.org/core/product/identifier/S0960129514000486/type/journal_article",
        "venue": "Mathematical Structures in Computer Science",
        "year": 2015
      },
      "exists": null,
      "explanation": "Primary work on univalent categories in the context of Univalent Foundations.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Birkedal, Lars",
          "Clouston, Ranald",
          "Mannaa, Bassel",
          "Ejlers Møgelberg, Rasmus",
          "Pitts, Andrew M.",
          "Spitters, Bas"
        ],
        "doi": "10.1017/S0960129519000197",
        "key": "birkedalModalDependentType2020",
        "raw": "birkedalModalDependentType2020: title = {Modal Dependent Type Theory and Dependent Right Adjoints}, author = {Birkedal, Lars and Clouston, Ranald and Mannaa, Bassel and Ejlers M{\\o}gelberg, Rasmus and Pitts, Andrew M. and Spitters, Bas}, year = 2020, month = feb, journal = {Mathematical Structures in Computer Science}, volume = {30}, number = {2}, pages = {118--138}, issn = {0960-1295, 1469-8072}, doi = {10.1017/S0960129519000197}, urldate = {2025-06-22}, abstract = {Abstract In recent years, we have seen several new models of dependent type theory extended with some form of modal necessity operator, including nominal type theory, guarded and clocked type theory and spatial and cohesive type theory. In this paper, we study modal dependent type theory : dependent type theory with an operator satisfying (a dependent version of) the K axiom of modal logic. We investigate both semantics and syntax. For the semantics, we introduce categories with families with a dependent right adjoint (CwDRA) and show that the examples above can be presented as such. Indeed, we show that any category with finite limits and an adjunction of endofunctors give rise to a CwDRA via the local universe construction. For the syntax, we introduce a dependently typed extension of Fitch-style modal {$\\lambda$} -calculus, show that it can be interpreted in any CwDRA, and build a term model. We extend the syntax and semantics with universes.}, copyright = {https://www.cambridge.org/core/terms}, langid = {english}, file = {/home/fernando/Zotero/storage/YT6FD9SA/Birkedal et al. - 2020 - Modal dependent type theory and dependent right adjoints.pdf}",
        "title": "Modal Dependent Type Theory and Dependent Right Adjoints",
        "url": null,
        "venue": "Mathematical Structures in Computer Science",
        "year": 2020
      },
      "exists": null,
      "explanation": "Cited for the view of discrete universes as dependent right adjoints to the identity functor on contexts.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Van Der Weide, Niels",
          "Rasekh, Nima",
          "Ahrens, Benedikt",
          "North, Paige Randall"
        ],
        "doi": "10.1145/3636501.3636955",
        "key": "van_der_weide_univalent_2024",
        "raw": "van_der_weide_univalent_2024: address = {London UK}, title = {Univalent {Double} {Categories}}, isbn = {9798400704888}, url = {https://dl.acm.org/doi/10.1145/3636501.3636955}, doi = {10.1145/3636501.3636955}, language = {en}, urldate = {2025-02-20}, booktitle = {Proceedings of the 13th {ACM} {SIGPLAN} {International} {Conference} on {Certified} {Programs} and {Proofs}}, publisher = {ACM}, author = {Van Der Weide, Niels and Rasekh, Nima and Ahrens, Benedikt and North, Paige Randall}, month = jan, year = {2024}, pages = {246--259}, file = {Full Text:/home/fernando/Zotero/storage/7YAP5KFM/Van Der Weide et al. - 2024 - Univalent Double Categories.pdf:application/pdf}",
        "title": "Univalent Double Categories",
        "url": "https://dl.acm.org/doi/10.1145/3636501.3636955",
        "venue": "Proceedings of the 13th ACM SIGPLAN International Conference on Certified Programs and Proofs",
        "year": 2024
      },
      "exists": null,
      "explanation": "Recent work on univalent double categories, providing context for the development of directed type theories.",
      "notes": null,
      "relevance": "low",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Coquand, Thierry",
          "Danielsson, Nils Anders"
        ],
        "doi": "10.1016/j.indag.2013.09.002",
        "key": "coquand_isomorphism_2013",
        "raw": "coquand_isomorphism_2013: title = {Isomorphism is equality}, volume = {24}, issn = {00193577}, doi = {10.1016/j.indag.2013.09.002}, language = {en}, number = {4}, urldate = {2025-02-20}, journal = {Indagationes Mathematicae}, author = {Coquand, Thierry and Danielsson, Nils Anders}, month = nov, year = {2013}, pages = {1105--1120}",
        "title": "Isomorphism is equality",
        "url": null,
        "venue": "Indagationes Mathematicae",
        "year": 2013
      },
      "exists": null,
      "explanation": "Cited for the Structure Identity Principle in HoTT, allowing transportation of properties between equivalent structures.",
      "notes": null,
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    }
  ],
  "missing_references": [
    {
      "reason": "Lossin formalizes cocartesian fibrations in Riehl-Shulman simplicial type theory (STT) and provides Rzk formalizations. While TTT focuses on the categorical/D2SFib approach, Lossin's work represents the state-of-the-art for the alternative simplicial approach to directed fibrations and is a notable omission for comparison.",
      "title": "Lossin, B. (2026). Fibrations in Directed Type Theory. arXiv:2604.18668."
    },
    {
      "reason": "While perhaps a different branch of logic (New Foundations), the name \"Twisted Type Theory\" was used by Randall Holmes in the 1990s. Given the identical name, a brief historical or terminological note would clarify the distinction between Chu and North's categorical twist and Holmes's stratification-based twist.",
      "title": "Holmes, M. R. (1995). The restricted ordinal in Quine's New Foundations. The Journal of Symbolic Logic."
    }
  ],
  "summary": "The paper provides a comprehensive bibliography covering the historical development of HoTT (Hofmann & Streicher 1998, Martin-Löf 1975) and the recent landscape of directed type theories (North 2019, Riehl & Shulman 2017, Neumann & Altenkirch 2025). The most relevant citations are those providing the semantic foundation for the paper's new twisted types, particularly the work on 2-sided fibrations (Street 1974) and displayed categories (Ahrens & Lumsdaine 2019). The missing work by Lossin (2026) is the most significant omission regarding contemporary developments in directed fibrations."
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.82,
  "questions": [
    "Can the authors provide at least a partial Agda or Coq/UniMath formalization covering the Twist and Hom-Elim/Comp rules and their categorical interpretations, given that the cited Bicategorical Type Theory paper (Ahrens–North–van der Weide 2023) provides full UniMath mechanization as a direct comparator?",
    "In the Hom-Comp verification, can the authors make explicit that the D-profunctor action on the identity 2-cell (id_γ, (id_a, id_a), id_x) is strictly the identity, and cite the specific splitness condition of the cleavage that guarantees this strict equality?",
    "Does the directed univalence conversion rule A → B ≡ Hom_Set(A,B) preserve canonicity or normalization for TTT overall, and is there a decision procedure for this judgmental equality that is compatible with the Russell-to-Coquand universe elaboration?",
    "How does TTT relate to Lossin (2026)'s Rzk-formalized treatment of cocartesian fibrations in Riehl–Shulman STT, and what are the respective tradeoffs between the categorical (D2SFib/Cat-model) and simplicial (bisimplicial set) semantic approaches for directed fibrations?",
    "Is the name 'Twisted Type Theory' intended to contrast deliberately with or is it independent of earlier uses of similar terminology in stratification-based logics (e.g., Holmes 1995), and would a brief terminological note clarify this for readers?"
  ],
  "recommendation": "major_revision",
  "strengths": [
    "Significant conceptual novelty: the twist operation and D2SFibs constitute a genuinely new contribution to directed type theory, with a score of 0.85 and verdict 'significant' from the novelty specialist, and a clear delineation from prior systems via three sharp design desiderata.",
    "Well-motivated design framework: the three desiderata (categories as closed types, emergent categorical structure, directed equalities as path objects) provide precise evaluation criteria and successfully distinguish TTT from both Riehl–Shulman STT and Neumann–Altenkirch extensions of North's theory.",
    "Solid categorical semantics for the core rules: the category model over Cat, the interpretation of Twist and Hom-Intro via the indexed arrow category, and the appendix verification of D2SFib conditions are internally consistent and mostly sound per the technical correctness specialist.",
    "Elegant and expressive applications: the internal derivation of natural transformations and the synthetic Yoneda proof demonstrate practical expressiveness, with a proof structure that elegantly mirrors the Yoneda-as-J-rule paradigm from HoTT.",
    "Comprehensive and well-chosen bibliography: key classical sources (Street 1974, Grothendieck SGA1) and contemporary directed type theories (Ahrens–North 2023, Neumann–Altenkirch 2025, New–Licata 2023) are all appropriately cited with high-relevance entries well-matched to the semantic content."
  ],
  "summary": "This paper introduces Twisted Type Theory (TTT), a directed type theory extending Martin-Löf Type Theory with novel twist operations, Hom-types equipped with introduction and elimination rules, and dependent 2-sided fibrations (D2SFibs) as the semantic backbone. The novelty specialist (score 0.85, confidence 0.90) confirms the contributions are significant: TTT advances beyond North's 2019 category model by simultaneously satisfying three design desiderata—closed types are categories, categorical structure emerges from typing rules, and directed equalities correspond to path objects—none of which prior systems achieved together. The bibliography is comprehensive (citation confidence 0.95), covering the relevant classical and contemporary landscape. However, the technical correctness reviewer (overall: mostly_sound, confidence 0.62) identifies three major-severity gaps: the Hom-elimination computation rule Hom-Comp is not fully verified (C7), the synthetic Yoneda proof depends on unverified components and an unexplained 12-step chain of strict context isomorphisms (C11), and the overall system soundness is unsupported by any mechanized artifact (C12). The reproducibility specialist (score 0.32, confidence 0.87) flags a critical-severity concern that the headline TTT syntax and semantics lack any executable proof artifact, and three additional major-severity gaps covering Hom-Elim, the D2SFib straightening theorem, and Yoneda. This is the paper's most consequential deficiency relative to the cs.LO publication standard: directly comparable papers (Ahrens–North–van der Weide Bicategorical Type Theory; Neumann–Altenkirch Synthetic 1-Categories) ship companion formalizations. Per the proof-as-code gate, the absence of mechanization for a paper introducing new judgmental equalities warrants major revision.",
  "weaknesses": [
    "No mechanized proof artifact (critical/major): the paper introduces new judgmental rules—Twist-Weak, Hom-Comp, directed univalence conversion—whose soundness depends on intertwined strict equalities, yet ships no Coq/Agda/Lean/UniMath formalization of the rules, interpretations, or worked examples; this is the defining deficiency for a cs.LO paper at this level (C12, reproducibility critical concern).",
    "Hom-elimination and Hom-Comp soundness incompletely verified (major): the appendix leaves three load-bearing checks unaddressed—functoriality of j on composable pairs, strict identity for the D-action in the Hom-Comp case, and the interplay between substitution strictness and the split displayed CC structure (C7).",
    "Synthetic Yoneda proof depends on unverified components (major): the proof of Yoneda relies on the partially verified Hom-Comp rule and a 12+-step chain of strict context isomorphisms (lemma:yoneda-perm-proof) with several silent steps; the Ψ∘Φ = id direction is not expanded into a diagrammatic check (C11).",
    "Splitness of the displayed category model is labeled 'folklore' and left unverified (minor): the DCat model's strict-pullback construction does not explicitly verify that the resulting comprehension category is split, leaving a potential gap in the semantic foundation for MLTT-style strict substitution (C3).",
    "Missing contemporary comparison—Lossin (2026) on fibrations in directed type theory via the Rzk-formalized simplicial approach is not cited, leaving TTT's position relative to the state-of-the-art simplicial approach to directed fibrations underspecified (citation specialist, most significant missing reference)."
  ]
}
```

### novelty (`gemini-3-flash-preview`) — status: `pass`

```json
{
  "confidence": 0.9,
  "missing_prior_art": [],
  "novelty_score": 0.85,
  "related_work": [
    {
      "citation_key": "north_towards_2019",
      "delta": "TTT extends North's category model by introducing 'twisted types' and a more powerful Hom-introduction rule that satisfies the desideratum of directed path objects (factorization of the diagonal map through the arrow category).",
      "relation": "builds_on",
      "title": "Towards a Directed Homotopy Type Theory"
    },
    {
      "citation_key": "riehl_type_2017",
      "delta": "Unlike Simplicial Type Theory (STT) where types are bisimplicial sets and categories are recovered as types satisfying extra conditions, TTT ensures closed types are categories by construction (Desideratum 1).",
      "relation": "competing",
      "title": "A type theory for synthetic ∞-categories"
    },
    {
      "citation_key": "licata_2-dimensional_2011",
      "delta": "Licata & Harper's work lacks Hom-types and thus does not satisfy TTT's desiderata for emergent categorical structure or directed path objects.",
      "relation": "prior_art",
      "title": "2-Dimensional Directed Type Theory"
    },
    {
      "citation_key": "streetFibrationsYonedasLemma1974",
      "delta": "TTT generalizes Street's 2-sided fibrations to a dependent version (D2SFibs) and provides a corresponding straightening-unstraightening theorem to provide semantics for the twist operation.",
      "relation": "builds_on",
      "title": "Fibrations and Yoneda's Lemma in a 2-Category"
    },
    {
      "citation_key": "neumannSynthetic1CategoriesDirected2025",
      "delta": "Neumann & Altenkirch extend North's theory with groupoid cores, but TTT achieves the directed SIP and natural transformations via the twist operation instead.",
      "relation": "competing",
      "title": "Synthetic 1-Categories in Directed Type Theory"
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
      "area": "other",
      "description": "Proof-as-code gap: the headline Twisted Type Theory syntax and semantics are not accompanied by a mechanized artifact such as formal/TTT/SyntaxAndSemantics.agda or formal/TTT/SyntaxAndSemantics.lean that checks the rules, contexts, twists, and Hom-type judgments.",
      "severity": "critical"
    },
    {
      "area": "other",
      "description": "Proof-as-code gap: the dependent 2-sided fibration development and straightening-unstraightening equivalence are only presented as paper proofs; a formal artifact such as formal/D2SFib/StraighteningUnstraightening.agda would be needed to reproduce the categorical construction mechanically.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "Proof-as-code gap: the new Hom-elimination and computation rules, which support the main directed path-object behavior, lack a checked proof artifact such as formal/TTT/HomElim.agda or formal/TTT/HomElim.lean.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "Proof-as-code gap: the synthetic Yoneda lemma application is not mechanized; a file such as formal/Applications/Yoneda.agda or formal/Applications/Yoneda.lean would be needed to reproduce the claimed derivation in the proposed theory.",
      "severity": "major"
    }
  ],
  "confidence": 0.87,
  "data_availability": "unspecified",
  "data_url": null,
  "environment": null,
  "reproducibility_score": 0.32
}
```

### summary (`claude-haiku-4-5-20251001`) — status: `pass`

```json
{
  "audience": "Mathematical logicians and type theorists, especially those working on homotopy type theory, categorical logic, and directed type theories; computer scientists developing formal verification systems and proof assistants for category theory; mathematicians interested in computational and synthetic approaches to categorical reasoning",
  "key_contributions": [
    "Twisted Type Theory (TTT), a new directed type theory extending Martin-Löf Type Theory with twisting operations, Hom-types, opposite types, and displayed types, with a complete categorical semantics in the category model",
    "Dependent 2-sided fibrations (D2SFibs), a generalization of Street's classical notion from profunctors to dependent profunctors, characterized by a straightening-unstraightening equivalence",
    "Novel Hom-type elimination rule (Hom-Elim) enabling synthetic categorical reasoning in HoTT-like style without requiring full Π-types",
    "Three design desiderata all satisfied: types in empty context are categories, categorical structure emerges from Hom-type rules, and directed equalities correspond to path objects in categories",
    "Applications demonstrating synthetic proof of Yoneda's lemma and reasoning about natural transformations, overcoming previous difficulties in directed type theories"
  ],
  "plain_language_summary": "Homotopy Type Theory (HoTT) has provided a successful foundation for mathematics and computer science by allowing rigorous, synthetic reasoning about spaces and groupoid structures. However, many areas of mathematics and computer science prioritize categories over groupoids. This paper introduces Twisted Type Theory (TTT), a new directed type theory that extends HoTT specifically to enable synthetic reasoning about categories. The key innovation is a \"twist\" operation: given a type that mixes covariant and contravariant dependencies on variables, the twist produces a new type with only covariant dependencies, while encoding the directedness semantically. TTT achieves this through dependent 2-sided fibrations (D2SFibs), which generalize a classical categorical structure and admit a straightening-unstraightening characterization analogous to Street's foundational work. The result is a type theory where constructing a category becomes as simple as typechecking, where categorical structure emerges naturally from the type system's rules, and where familiar HoTT proof techniques apply. The paper demonstrates this with a synthetic proof of Yoneda's lemma and reasoning about natural transformations, opening a path toward using directed type theory as a practical language for formal category theory.",
  "tldr": "A type theory extending homotopy type theory to reason synthetically about categories through a novel twisting operation on types."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `pass`

```json
{
  "claims": [
    {
      "assessment": "supported",
      "claim": "The category model (full split CC over Cat using lax-natural indexed categories) validates strong Σ-types, an opposite-type interpretation via post-composition with op, Hom-types via Hom_A(γ)(x,y) := hom_{A(γ)}(x,y), and, under inaccessibles, Coquand universes 𝒰_i.",
      "evidence": "The constructions are standard for the indexed-category model: Grothendieck Σ on a fibered category with cleavage, post-composition with op:Cat→Cat, and the hom set/category construction. Coquand universes under a hierarchy of inaccessibles is well established (Coquand 2013; Gratzer et al. 2021).",
      "id": "C1",
      "location": "Section 2, Proposition prop:Sigma (proof sketch)",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Restricted to split opfibrations and lax natural transformations, the comprehension functor induces a fibred equivalence ICat_lax ≃ Opfib^split_lax over Cat (Grothendieck straightening).",
      "evidence": "This is the classical Grothendieck correspondence specialized to split, cloven opfibrations and lax naturality, attributed in the paper to Grothendieck (SGA1). The caveat that cod:Opfib^split_lax → Cat is itself non-split is correctly flagged and handled by working on the indexed-category side.",
      "id": "C2",
      "location": "Section 2, Proposition prop:straight-icat",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "There is a fibred equivalence (⊕^d)*: DCat ≃ Cat^→ over Cat, providing a 'displayed category model' as a full split CC over Cat whose types correspond to arbitrary functors over a base.",
      "evidence": "The proof is a one-paragraph sketch following Loregian's Coend Calculus (Theorem 5.4.5), invoking the forgetful U:(Cat_Prof)_* → Cat_Prof and a strict pullback construction. The 'splitness' of the resulting CC and the verification that the comprehension preserves the relevant strict structure (so that it can model MLTT with strict substitution) are not verified explicitly in the paper. The authors themselves call the existence of this CC 'folklore'. The category-vs-bicategory bookkeeping around lax-normal functors into the bicategory Cat_Prof, especially with respect to splitness, is where errors typically appear.",
      "id": "C3",
      "location": "Section 2.2, Proposition prop:dcat-model and Definition def:dcat-model",
      "severity": "minor",
      "suggested_fix": "Add an appendix with the complete verification that (i) the strict-pullback construction along F^*U is functorial on the nose, (ii) the resulting CC is split (i.e. substitution acts strictly), and (iii) the embedding ICat_lax ↪ DCat is a strict family inclusion in the sense of Kovács 2022. Ideally formalize the CC structure in UniMath/Coq (next to ahrensDisplayedCategories2019) at e.g. `src/DCatModel/SplitCC.v`."
    },
    {
      "assessment": "supported",
      "claim": "The Twist rule Tw_b(C) and the Twist-Weak rule are validated by the category model, with ⟦Tw_b(C)⟧ being the displayed category corresponding to the projection π_2: A ⋈ B ⨃ C → A ⋈ B.",
      "evidence": "The interpretation matches the construction of the unstraightening A ⋈ (B ⨃ C) of a dependent profunctor C:A ⋈ B^op → Cat (Definition def:unstraightening-dprof). The Twist-Weak equation is automatic since if C does not depend on b, then ∑_{b:B^op}C^op = B^op × C^op and ((·)^op)^op restores the unmodified type. The explicit on-objects and on-morphisms description provided is consistent.",
      "id": "C4",
      "location": "Section 3, Proposition prop:twists",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Straightening/unstraightening induces a fibred equivalence DProf ≃ D2SFib over ICat_str (Proposition prop:straight-d2sfibs), generalizing Street's Prof ≃ 2SFib.",
      "evidence": "The appendix verifies the four D2SFib conditions explicitly on the canonical projection π_2:A ⋈ B ⨃ C → A ⋈ B; checks the functoriality of Φ on natural transformations including cartesianness of opfibrations and fibrewise cartesianness; constructs the inverse ε and ε^{-1} via the universal properties of (op)cartesian lifts; and verifies that η is the identity natural iso. The lemma showing α_!β^* = (B(α)β)^*α_! is proved with the standard universal-property dashed-diagonal argument. Naturality in A,B is asserted rather than spelled out, but the formulas are evidently functorial in (F,G).",
      "id": "C5",
      "location": "Section 3 (statement) and Appendix Section 8 (full proof)",
      "severity": "minor",
      "suggested_fix": "Spell out naturality of Φ and Ψ in A,B explicitly (one square per direction) to upgrade the fibred-equivalence statement from 'follows from the previous proposition' to a self-contained proof. A mechanization in Coq/UniMath (e.g. `src/D2SFib/Straightening.v`) would substantially raise confidence given the multiple universal-property diagram chases."
    },
    {
      "assessment": "supported",
      "claim": "The Hom-introduction rule a:A ⊢ Refl_a : Hom_A(ā,a) is validated in the category model, with ⟦Refl⟧(γ,a) := (γ, id_a) realising the diagonal factorization A → A^→ → A × A.",
      "evidence": "The proof uses Example ex:sctxe-hom to identify ⟦Γ ⋈ b:A ⋈ a:A tscxe Hom_A(ā,b)⟧ with ⟦Γ⟧ ⋈ ⟦A⟧^→ (the indexed arrow category), and then defines the section by (γ,a) ↦ (γ, id_a), whose composition with the projection is the diagonal. This matches the path-object factorization invoked in desideratum (3) and is the directed analogue of the Hofmann–Streicher Refl interpretation.",
      "id": "C6",
      "location": "Section 4.1, Proposition prop:hom-intro",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "The Hom-elimination rule (Hom-Elim) and its computation rule Hom-Comp (j(Refl_a, x, d) ≡ d) are validated, expressed as the lifting of r:Γ ⋈ A ⋈ X → Γ ⋈ A^→ ⋈ X[dom] against the D2SFib π_2 over D considered as a dependent profunctor Γ ⋈ A^→ ⋈ X[dom]^op → Cat.",
      "evidence": "The construction j(γ,f:a→b,x) := (γ, f, x, D(φ)(d^*(γ,a,x))) with φ = (id_γ, (id_a, f), id_x), and the lifted construction on morphisms in the appendix (with the commutative rectangle of D-actions) is plausible and consistent with the lax-end picture noted in Remark remark:lax-ends. However, three load-bearing checks are not made fully explicit: (i) functoriality of j on morphisms — the appendix supplies endpoints via the commuting rectangle but does not verify j(g∘f) = j(g)∘j(f) for a generic composable pair; (ii) the Hom-Comp rule j(Refl_a, x, d) ≡ d is asserted to follow but never verified — when f=id_a the morphism φ becomes (id_γ, (id_a, id_a), id_x), and one needs the chosen D-action on the identity-on-id_a 2-cell to be strictly the identity, which requires that D's profunctor-action on identities is strict (this is the case for the strict natural transformation conventions used, but it deserves an explicit pointer); (iii) the rule's statement uses substitutions D[ā/b, Refl_A/f, x̄/x] whose strictness depends on splitness of the underlying displayed CC — that interplay is not discussed. Crucially, no executable artifact (Coq/Agda/Lean/UniMath) certifies these strict equalities.",
      "id": "C7",
      "location": "Section 4.1 and Appendix Section 9.1",
      "severity": "major",
      "suggested_fix": "In the appendix, (a) verify functoriality of j on morphisms by a direct calculation on composable pairs (one extra paragraph); (b) verify Hom-Comp by substituting f=id_a explicitly into the j formula and showing each D-action evaluates to an identity, citing splitness of the cleavages; (c) mechanize Hom-Elim and Hom-Comp in UniMath at e.g. `src/TTT/HomElim.v` against the displayed-CC model. Without (c) the proof-as-code expectation for a directed type-theory paper that introduces a new judgmental equality is unmet."
    },
    {
      "assessment": "partially_supported",
      "claim": "Directed univalence — the judgemental conversion A → B ≡ Hom_Set(A,B) : Set for Γ^op ⊢ A:Set and Γ ⊢ B:Set — is validated in the category model.",
      "evidence": "Semantically, when ⟦A⟧ and ⟦B⟧ are discrete categories (sets), the functor category [⟦A⟧, ⟦B⟧] coincides with the set of functions Set(⟦A⟧, ⟦B⟧) = hom_Set(⟦A⟧, ⟦B⟧), so the interpretations agree on the nose. The proposition is stated as a corollary of the preceding informal discussion, with no separate proof. The strength of asserting a judgemental (not merely propositional) equality requires that the elaboration of Russell universes to Coquand universes preserves this strict equality across substitution; this is not discussed. The footnote acknowledging that an internal equivalence-based formulation would 'severely complicate typechecking' is honest, but the metatheoretic status of postulating this judgmental equality (e.g. canonicity preservation) is not addressed.",
      "id": "C8",
      "location": "Section 5.1, Definition def:dunivalence and Proposition prop:dunivalence",
      "severity": "minor",
      "suggested_fix": "Add a short proof of prop:dunivalence verifying the strict equality on the semantic side, and discuss whether the conversion rule preserves canonicity/normalization. If a syntactic decision procedure is intended, sketch how it interacts with substitution."
    },
    {
      "assessment": "supported",
      "claim": "For terms F,G : A → B, terms t : Hom_B(F̄a, Ga) in the displayed copy correspond, on interpretation, exactly to natural transformations ⟦F⟧ → ⟦G⟧.",
      "evidence": "By the universal property of the pullback of A^→ → A × A along ⟨F,G⟩:A → A × A, sections of the resulting pullback are functors τ:A → A^→ such that dom∘τ = F and cod∘τ = G — exactly natural transformations from F to G. This is the directed analogue of the HoTT correspondence between paths and homotopies and is correctly identified with a lax end in Remark remark:lax-ends.",
      "id": "C9",
      "location": "Section 5.2, Proposition prop:internal-nat-hom",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "For copresheaves F,G : A → Set, the interpretation of Nat(F,G) := ∏_{(a,x):∑_{a:A}Fa} Ga is the set of natural transformations F → G; further, equalities of such natural transformations are captured by hom-terms in Ga (which is discrete).",
      "evidence": "The chain of isomorphisms uses prop:pi-types (currying), prop:Sigma (Σ-elimination), prop:function-twist (twist of a Π), prop:dunivalence (Hom = → on Set), and prop:internal-nat-hom. Each step is a standard categorical adjunction / equivalence applied to the indexed-category model, and discreteness of Ga indeed kills the higher hom-structure so equalities collapse to identities of natural transformations. The argument is internally consistent.",
      "id": "C10",
      "location": "Section 5.2, Proposition prop:internal-nat-pi and surrounding propositions",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Synthetic Yoneda lemma (Lemma lemma:yoneda): for A:𝒰 in the empty context, the functors Y(F,a) = Nat(Hom_A(a,−), F) and Ȳ(F,a) = Fa are naturally isomorphic.",
      "evidence": "The proof structure is sound and elegant — Φ by evaluation on Refl_a, Ψ by Hom-elimination — and mirrors the analogous HoTT-style proof from the Yoneda-as-J-rule perspective. However, the appendix proof depends critically on (a) Lemma yoneda-perm-proof, a chain of 12+ context isomorphisms/strict equalities that mixes Σ-rules, opposite-type rules, opposite-context rules, twist rules, and a step ((Γ^op ⋈ A^op) ≡ w:ΣΓ × A)^op that silently uses repeated extensionality of Σ over context tuples; (b) the Hom-Comp rule from C7, which is itself only partially verified; (c) the still-not-fully-verified functoriality of j on morphisms (Φ ∘ Ψ = id 'follows from the computation rule', Ψ ∘ Φ = id 'follows from another application of Hom-elimination', neither expanded into a diagrammatic check). The authors explicitly note in the conclusion that 'our current proof of its correctness is quite technical'. Given the centrality of Yoneda as the headline application and the fact that mechanized synthetic Yoneda proofs exist for comparable systems (e.g. via UniMath), the absence of any machine-checked proof is a major weakness for a cs.LO paper introducing new judgmental rules.",
      "id": "C11",
      "location": "Section 5.3 (sketch) and Appendix Section 9.2 (full proof)",
      "severity": "major",
      "suggested_fix": "(i) Add an explicit diagrammatic verification of Ψ∘Φ = id using Hom-elimination, not just an appeal to 'another application'. (ii) Add intermediate justifications (one line each) for the strict equalities in lemma:yoneda-perm-proof — particularly the step that re-bundles a context into a Σ-type and the swap moves between opposite-type and opposite-context constructors. (iii) Mechanize the proof of Yoneda in TTT against the category model in UniMath/Coq at e.g. `src/TTT/Yoneda.v`. This is the most natural target for a proof-as-code artifact and would close the gap noted in C12."
    },
    {
      "assessment": "unsupported",
      "claim": "TTT (with its new Twist, Hom-Intro/Elim/Comp rules, displayed copy of MLTT, opposite contexts, and directed univalence) is sound for the proposed category model, as evidenced by the pen-and-paper proofs in this paper.",
      "evidence": "This is a cs.LO paper introducing a substantial new judgmental type theory with novel rules whose soundness depends on multiple intertwined strict equalities (Twist-Weak, Hom-Comp, opposite-context judgmental equalities like ⋄^op ≡ ⋄, the Set-level conversion A → B ≡ Hom_Set(A,B), strict family inclusion between the two MLTT copies). Comparable directed type theories in the cited literature ship companion mechanizations: e.g. Ahrens–North–van der Weide's Bicategorical Type Theory (cited [6]) is 'fully checked in the Coq proof assistant, based on the UniMath library', and Neumann–Altenkirch's Synthetic 1-Categories (cited [34]) is framed in generalized algebraic theories with an automatic syntax model. The present paper ships no Coq/Agda/Lean/UniMath formalization of either the rules, their semantic interpretation, or the worked examples. Per the proof-as-code expectation for cs.LO, absence of an executable verification artifact is itself evidence of weakness — particularly because the rules involve strict equalities that are notoriously easy to break under elaboration or substitution.",
      "id": "C12",
      "location": "Section 4 (definition of TTT) and Appendix Section 7 (complete rules)",
      "severity": "major",
      "suggested_fix": "Provide a UniMath/Coq formalization of (i) the displayed category model and category model as comprehension categories; (ii) the Twist, Hom-Intro, Hom-Elim, and Hom-Comp rules with their interpretations; (iii) at minimum the proof of synthetic Yoneda. A natural layout would be `src/TTT/CategoryModel.v`, `src/TTT/Twist.v`, `src/TTT/HomElim.v`, `src/TTT/Yoneda.v`, building on `ahrensDisplayedCategories2019` UniMath libraries. Alternatively, an Agda formalization in cubical-Agda style would suffice."
    },
    {
      "assessment": "supported",
      "claim": "The Π-type rule (prop:pi-types) and the function-twist correspondence Tm_d(Γ, Ā → B) ≅ Tm(Γ ⋈ a:A, B) (prop:function-twist), together with the opposite-Σ correspondence (prop:op-sigma), each give natural bijections in the category model.",
      "evidence": "prop:pi-types asserts the bijection for Π but does not exhibit the application/abstraction functors on either side — only their existence. The companion prop:function-twist is proven by analogy and depends on the unstraightening interpretation of twisted function types being the arrow category, which is consistent with C4 and C5. prop:op-sigma exploits the isomorphism Γ ⋈ A^op tscxe B^op ≅ Γ ⋈ (∑_{a:A} B)^op — a direct combinatorial check on objects and morphisms, plausible but not spelled out. None of the bijections look incorrect, but readers must reconstruct the morphism actions.",
      "id": "C13",
      "location": "Section 4.2, Propositions prop:pi-types, prop:function-twist, prop:op-sigma",
      "severity": "minor",
      "suggested_fix": "Add the explicit definitions of λ/app and pair/⟨fst,snd⟩ on the semantic side (each takes one display equation) in either the body or the appendix, and verify that the bijections are natural in Γ. Mechanization in the same UniMath project as C12 would close this together."
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

_No bibliography extracted._

