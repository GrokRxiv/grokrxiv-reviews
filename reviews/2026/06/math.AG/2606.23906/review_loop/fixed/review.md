# \'Etale Fundamental Groups -- a geometric and topological approach to fundamental groups in algebraic geometry

GrokRxiv review of [arXiv:2606.23906](https://arxiv.org/abs/2606.23906) · `math.AG`

_Authors_: Loris De Vos

## TL;DR

The submission is a thesis-level exposition of fundamental groups in algebraic geometry, covering topological covering theory, Galois-category formalism, and Tannakian duality. Three of the four aligned specialists (technical_correctness, novelty, reproducibility) converge on a serious structural completeness problem: the entire second chapter—which is the title contribution of the thesis, covering étale morphisms, the construction of π_1^ét, and the transcendental comparison theorem—is absent from the submitted text. The Tannakian chapter internally references this missing chapter ('In the last chapter, we established an equivalence…'), confirming it was intended to appear. The technical correctness specialist (confidence 0.68, overall_correctness 'questionable') flags this at critical severity in C1 and C9; the reproducibility specialist (confidence 0.86) independently flags the absence of any proof-as-code artifacts for headline claims at critical severity. The field is code-amenable (math.AG, math.CT), triggering the recommendation gate. Because at least two critical-severity findings from aligned specialists directly block the headline claim—constructing the étale fundamental group and proving the transcendental comparison—the default recommendation is major_revision. The novelty review correctly identifies this as a purely expository work (novelty_score 0.0, verdict 'marginal'); the absence of original results is appropriate for a thesis exposition, but Deligne (1990) and Saavedra Rivano (1972), the two primary sources for the Tannakian duality chapter, are missing from the bibliography. The citation specialist review is flagged as a review-input problem: its bibliography entries pertain to a workplace-AI paper about invisible labor (Abbas et al. 2025, onboarding, AI technostress, etc.) and are wholly inconsistent with the mathematical content described by every other specialist. The citation findings should not be applied as paper weaknesses; the citation pipeline must be rerun against the correct manuscript bibliography. Excluding that mismatch, the mathematical content present in the submission—the topological Galois correspondence, monodromy theory, local systems, and the Tannakian reconstruction—is handled with minor gaps and typographic errors only, and the expository clarity is appropriate for the target audience.

_Recommendation_: **Major revision** · _Confidence_: 74%

## Strengths

- The topological covering-space chapter (Chapter 1) is largely mathematically sound, with the Galois correspondence (Theorem 25, Theorem 26), monodromy action (Theorem 14), and profinite refinement (Theorem 67) all following standard arguments with only minor proof gaps.
- The Tannakian chapter provides a coherent and self-contained exposition linking monodromy representations of local systems to Tannaka–Krein duality and Nori's fundamental group scheme, which is pedagogically valuable for graduate students entering this area.
- The thesis correctly identifies and develops the conceptual thread unifying topological covering theory, Grothendieck's Galois-category formalism, and the Tannakian reconstruction of fundamental groups as automorphism groups of fibre functors.
- The appendices on commutative algebra and category theory supply the necessary background machinery (Theorem 264, tensor categories) and are cross-referenced consistently within the proofs.

## Weaknesses

- The entire étale fundamental group chapter is absent from the submitted text: no construction of π_1^ét, no definition of the étale site, and no transcendental comparison with π_1^top is delivered, despite being promised in the abstract and introduction and referenced internally by the Tannakian chapter (C1, C9; critical severity in technical_correctness).
- No proof-as-code artifact is provided for any headline claim in this math.AG/math.CT thesis; the categorical equivalences (Galois correspondence, Tannaka–Krein duality, FÉt(X) ↔ π_1^ét-sets) are exactly the kind of results amenable to Lean 4/mathlib formalization, and their absence is a reproducibility gap at critical severity.
- Deligne (1990) 'Catégories Tannakiennes' and Saavedra Rivano (1972) 'Catégories Tannakiennes', the two foundational sources for the Tannakian duality chapter, are cited in the text but absent from the bibliography (novelty specialist, missing_prior_art).
- The citation specialist review was executed against a bibliography belonging to a different paper (a workplace-AI study on invisible labor), making those findings inapplicable to this manuscript; this is a review-input pipeline error that must be corrected before the citation review can be used.
- Several minor proof gaps exist in Chapter 1: silent use of path-connectedness without flagging dependence on the standing local-path-connectedness assumption (C2), citation mislabel of Hatcher propositions as Hartshorne (C3), incomplete kernel-identification step in Theorem 26 with a notation typo (C5), implicit commutativity of tensor product with direct products in Theorem 60 (C6), and a clerical gap and missing parenthesis in Lemma 23 (C12).

## Revision Targets

- [ ] **Manuscript: Abstract; Introduction (Sec. Introduction); chapter promised between Sec. 1 and Sec. 'Tannaki...**
  - Location: `Abstract; Introduction (Sec. Introduction); chapter promised between Sec. 1 and Sec. 'Tannakian Fundamental Groups'`
  - Evidence: The submitted text contains only three top-level chapters: 'Topological Covering Spaces and Galois Theory' (line 120), 'Tannakian Fundamental Groups' (line 2585), and two appendices ('Selected Results from Commutative Algebra...', 'Review of Category Theory'). No chapter introducing the étale topology, étale morphisms, the étale fundamental group, the transcendental comparison theorem, or structure theorems for π_1^ét is present. The Tannakian chapter opens with 'In the last chapter, we established an equivalence... finite étale covers over a connected scheme... finite continuous representations of its étale fundamental group' (line 2587), referring to a chapter that does not appear in the submitted text. The titular contribution of the thesis is therefore not delivered in the submission.
  - Required change: Insert the missing Chapter 2 covering: (i) étale morphisms and the étale site, (ii) construction of π_1^ét(X, \bar{x}) as the automorphism group of the fibre functor on FÉt(X) (or as inverse limit over Galois covers), (iii) Riemann existence / transcendental comparison π_1^ét(X) ≅ π_1^top(X^{an})^^ for connected finite-type C-schemes (citing Szamuely/SGA1), (iv) at minimum statements with full references for structure theorems. Until inserted, the abstract overstates what is proved.
  - Verification: Re-review should confirm `Abstract; Introduction (Sec. Introduction); chapter promised between Sec. 1 and Sec. 'Tannakian Fundamental Groups'` is corrected or justified.
- [ ] **Manuscript: Throughout (proof-as-code consideration; field math.AG / math.CT)**
  - Location: `Throughout (proof-as-code consideration; field math.AG / math.CT)`
  - Evidence: The thesis is in a code-amenable field (math.AG, math.CT). Central load-bearing theorems — Galois correspondence for covers (Thm 26), Grothendieck reformulation of Galois theory (Thm 56), the cover↔Gal(k_s/k)-set equivalence (Thm 58), the cover↔π_1-set equivalence (Thm 64) and its profinite refinement (Thm 67), Tannaka-Krein duality (Sec. 'Tannaka-Krein Duality'), and the equivalence FÉt(X) ↔ continuous π_1^ét-sets — are exactly the kind of categorical-equivalence statements amenable to formal verification in Lean (mathlib) / Coq (UniMath) / Agda (HoTT-Agda). The thesis ships no formal-proof artifact, no machine-checkable companion repository. Per the proof-as-code axiom for math.* fields, the absence of executable verification is a weakness for results of this scope and centrality.
  - Required change: Provide a companion Lean 4 + mathlib formalisation of at least the core equivalences. Suggested file layout: src/Topology/CoveringSpaces/GaloisCorrespondence.lean (Thm 26), src/FieldTheory/Galois/GrothendieckReformulation.lean (Thm 56, Thm 58), src/CategoryTheory/Tannaka/TannakaKrein.lean (Tannaka-Krein duality), src/AlgebraicGeometry/EtaleFundamentalGroup.lean (FÉt(X) ↔ π_1^ét-sets equivalence). Even formalising the topological Galois correspondence (Thm 26), which sits entirely in mathlib's reach today, would materially strengthen the technical foundation.
  - Verification: Re-review should confirm `Throughout (proof-as-code consideration; field math.AG / math.CT)` is corrected or justified.
- [ ] **Bibliography: Catégories Tannakiennes (Saavedra Rivano, 1972)**
  - Location: bibliography entry: `Catégories Tannakiennes (Saavedra Rivano, 1972)`
  - Evidence: This work originally extended Tannaka-Krein duality to affine group schemes over arbitrary fields, and is mentioned in the text but not cited in the bibliography.
  - Required change: Add or discuss missing prior art `Catégories Tannakiennes (Saavedra Rivano, 1972)`. This work originally extended Tannaka-Krein duality to affine group schemes over arbitrary fields, and is mentioned in the text but not cited in the bibliography.
  - Verification: Re-review should confirm the related-work discussion addresses this prior art.
- [ ] **Bibliography: Making Work Visible: Representation of Work**
  - Location: bibliography entry: `Making Work Visible: Representation of Work`
  - Evidence: This foundational paper discusses the tension between representation of work in systems (like org charts or workflow tools) and the actual, informal practices of workers. It is highly relevant to the paper's proposal of making invisible work visible to managers and organization leaders.
  - Required change: Add a bibliography entry for `Making Work Visible: Representation of Work` and cite it where the affected method or claim is introduced, or explicitly justify its omission.
  - Verification: Re-review should confirm the bibliography and citation context address this reference.
- [ ] **Manuscript: Lemma 23**
  - Location: `Lemma 23`
  - Evidence: The argument contains a clerical gap: the chain of equalities concluding 'so p_*(π_1(Y,y))' has a missing closing claim ('hence [γ] ∈ p_*(π_1(Y,y))'), and 'p_* : π_1(Y,y) → π_1(X,x' is missing a closing parenthesis. The mathematical content is standard and correct: the stabiliser equals the image of p_* by uniqueness of path lifts, and the set of stabilisers across the fibre is a single conjugacy class by the orbit-stabiliser correspondence (Thm 264 in the appendix).
  - Required change: Close the equality chain with 'hence [γ] ∈ p_*(π_1(Y,y))', and fix the typographical error 'π_1(X,x' → 'π_1(X,x)'.
  - Verification: Re-review should confirm `Lemma 23` is corrected or justified.

## Open Questions

- Has the étale fundamental group chapter been inadvertently omitted from the submitted PDF? If the full manuscript exists, please resubmit including Chapter 2 in its entirety.
- What proof strategy does the author intend for the transcendental comparison theorem (π_1^ét(X) ≅ (π_1^top(X^an))^) — via GAGA/Riemann existence following Szamuely §5.7, or an alternative approach — and what hypotheses (connectedness, finite type over ℂ, compatible base-points) are assumed?
- Which Tannakian incarnations (differential-Galois, motivic Galois groups) does the thesis intend to prove versus merely cite as motivation, and will the boundary between proved and referenced results be made explicit in the introduction of Chapter 3?
- Given that Deligne (1990) and Saavedra Rivano (1972) are the primary sources for the reconstruction theorem for neutral Tannakian categories, why do they not appear in the bibliography, and has the author verified that the proofs in Chapter 3 do not implicitly depend on results from these works without attribution?
- For the purposes of the proof-as-code requirement in this math.AG/math.CT submission: does the author plan to provide a Lean 4/mathlib companion formalizing at least the topological Galois correspondence (Theorem 26) and the Tannaka–Krein duality, or will the paper explicitly justify the absence of formal verification?

## Per-Agent Reviews

### citation (`Gemini 3.5 Flash (Medium)`) — status: `fail`

```json
{
  "confidence": 0.95,
  "entries": [
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Abbas, T.",
          "Rathore, S. A.",
          "Turki, A.",
          "Khan, S.",
          "Alghushairy, O.",
          "Daud, A."
        ],
        "doi": null,
        "key": "1",
        "raw": "Abbas, T.; Rathore, S. A.; Turki, A.; Khan, S.; Alghushairy,\nO.; and Daud, A. 2025. Enhancing Software Engineering\nWith AI: Innovations, Challenges, and Future Directions.\nIET Software, 2025(1): 5691460.\nAlam, A. 2023. Harnessing the power of AI to create intelligent tutoring systems for enhanced classroom experience\nand improved learning outcomes. In Intelligent communication technologies and virtual mobile networks, 571–591.\nSpringer.\nAllen, T. J. 1977. Managing the flow of technology: technology transfer and the dissemination of technological information within the R and D organization. Massachusetts\nInstitute of Technology,Cambridge, MA.\nBakker, A. B.; and Demerouti, E. 2017. Job demands–\nresources theory: Taking stock and looking forward. Journal\nof occupational health psychology, 22(3): 273.\nBaksa, M.; and Branyiczki, I. 2023. Invisible Foundations of\nCollaboration in the Workplace: A Multiplex Network Approach to Advice Seeking and Knowledge Sharing. Central\nEuropean Business Review, 12(2).\nBarke, S.; James, M. B.; and Polikarpova, N. 2023.\nGrounded copilot: How programmers interact with codegenerating models. Proceedings of the ACM on Programming Languages, 7(OOPSLA1): 85–111.\nBhat, A.; Aubin Le Qu´er´e, M.; Naaman, M.; and Jakesch, M.",
        "title": "Enhancing Software Engineering With AI: Innovations, Challenges, and Future Directions",
        "url": null,
        "venue": "IET Software",
        "year": 2025
      },
      "exists": null,
      "explanation": "The first citation in this concatenated block, Abbas et al. 2025, is highly relevant as it provides background on how AI adoption transforms software engineering tasks and productivity, which the paper builds on to analyze invisible work.",
      "notes": "This bibliography entry concatenates multiple unrelated references (Abbas et al. 2025, Alam 2023, Allen 1977, Bakker & Demerouti 2017, Baksa & Branyiczki 2023, Barke et al. 2023) and truncates the last reference (Bhat et al. 2026), containing only its authors.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2510.00762",
        "authors": [
          "Bhat, A.",
          "Aubin Le Qu´er´e, M.",
          "Naaman, M.",
          "Jakesch, M."
        ],
        "doi": null,
        "key": "2",
        "raw": "Reactive Writers: How Co-Writing with AI Changes\nHow We Engage with Ideas. In Proceedings of the 2026 CHI\nConference on Human Factors in Computing Systems, 1–21.\nBorgatti; and Cross. 2003. A Relational View of Information\nSeeking and Learning in Social Networks. 49.\nBrown, J. S.; and Duguid, P. 1991. Organizational Learning and Communities-of-Practice: Toward a Unified View of\nWorking, Learning, and Innovation. Organization Science,\n2(1): 40–57.\nBrynjolfsson, E.; Li, D.; and Raymond, L. 2025. Generative\nAI at work. The Quarterly Journal of Economics, 140(2):\n889–942.\nButler, J.; Suh, J.; Haniyur, S.; and Hadley, C. 2025. Dear\nDiary: A randomized controlled trial of Generative AI coding tools in the workplace. In 2025 IEEE/ACM 47th International Conference on Software Engineering: Software\nEngineering in Practice (ICSE-SEIP), 319–329. IEEE.\nCampbell, B. 2021. Alone Together: Why We Expect More\nfrom Technology and Less from Each Other. Journal of Interdisciplinary Studies, 33(1-2): 196–199.\nChang, P.-C.; Zhang, W.; Cai, Q.; and Guo, H. 2024. Does\nAI-driven technostress promote or hinder employees’ artificial intelligence adoption intention? A moderated mediation\nmodel of affective reactions and technical self-efficacy. Psychology Research and Behavior Management, 413–427.\nCheng, M.; Lee, C.; Khadpe, P.; Yu, S.; Han, D.; and Jurafsky, D. 2026. Sycophantic AI decreases prosocial intentions\nand promotes dependence. Science, 391(6792): eaec8352.\nChoudhuri, R.; Badea, C.; Bird, C.; Butler, J.; DeLine, R.;\nand Houck, B. 2025. AI Where It Matters: Where, Why,\nand How Developers Want AI Support in Daily Work. arXiv\npreprint arXiv:2510.00762.\nCohen, S.; and Wills, T. A. 1985. Stress, social support, and\nthe buffering hypothesis. Psychological bulletin, 98(2): 310.\nCranefield, J.; Yoong, P.; and Huff, S. L. 2015. Rethinking lurking: Invisible leading and following in a knowledge\ntransfer ecosystem. Journal of the Association for Information Systems, 16(4): 3.\nCross, R.; Borgatti, S. P.; and Parker, A. 2002. Making invisible work visible: Using social network analysis to support strategic collaboration. California management review,\n44(2): 25–46.\nCross, R. L.; and Parker, A. 2004. The hidden power of\nsocial networks: Understanding how work really gets done\nin organizations. Harvard Business Press.\nDaniels, A. K. 1987. Invisible Work. Social Problems,\n34(5): 403–415.\nDe Laat, M.; and Schreurs, B. 2013. Visualizing informal professional development networks: Building a case for\nlearning analytics in the workplace. American Behavioral\nScientist, 57(10): 1421–1438.\nDemerouti, E.; Bakker, A. B.; Nachreiner, F.; and Schaufeli,\nW. B. 2001. The job demands-resources model of burnout.\nJournal of Applied psychology, 86(3): 499.\nEhsan, U.; Passi, S.; Saha, K.; McNutt, T.; Riedl, M. O.; and\nAlcorn, S. 2026. From Future of Work to Future of Workers: Addressing Asymptomatic AI Harms to Foster Dignified Human-AI Interaction. In Proceedings of the 2026 CHI\nConference on Human Factors in Computing Systems, 1–21.\nFarmer, N. 2017. The invisible organization: How informal\nnetworks can lead organizational change. Routledge.\nFawzy, A.; Tahir, A.; and Blincoe, K. 2025. Vibe Coding in\nPractice: Motivations, Challenges, and a Future Outlook–a\nGrey Literature Review. arXiv preprint arXiv:2510.00328.",
        "title": "Reactive Writers: How Co-Writing with AI Changes How We Engage with Ideas",
        "url": null,
        "venue": "Proceedings of the 2026 CHI Conference on Human Factors in Computing Systems",
        "year": 2026
      },
      "exists": null,
      "explanation": "The first citation in this block, Bhat et al. 2026 ('Reactive Writers'), is highly relevant to the paper as it discusses how co-writing with AI changes writing processes, which is cited in the context of role changes and tool adoption.",
      "notes": "This bibliography entry concatenates multiple unrelated references and starts with the title/venue of Bhat et al. 2026 ('Reactive Writers') whose authors are placed in the previous bibliography entry.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Fr¨og´eli, E.",
          "Jenner, B.",
          "Gustavsson, P."
        ],
        "doi": null,
        "key": "3",
        "raw": "Fr¨og´eli, E.; Jenner, B.; and Gustavsson, P. 2023. Effectiveness of formal onboarding for facilitating organizational socialization: A systematic review. PloS one, 18(2): e0281823.\nGil-Garcia, J. R.; Guler, A.; Pardo, T. A.; and Burke, G. B.",
        "title": "Effectiveness of formal onboarding for facilitating organizational socialization: A systematic review",
        "url": null,
        "venue": "PloS one",
        "year": 2023
      },
      "exists": null,
      "explanation": "The first citation, Fr¨og´eli et al. 2023, is highly relevant as it reviews the effectiveness of onboarding programs, which supports the paper's discussion on how AI affects informal onboarding and socialization.",
      "notes": "This bibliography entry concatenates Fr¨og´eli et al. 2023 and the authors of Gil-Garcia et al. 2019, whose title and venue are placed in the next entry.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Gil-Garcia, J. R.",
          "Guler, A.",
          "Pardo, T. A.",
          "Burke, G. B."
        ],
        "doi": null,
        "key": "4",
        "raw": "Characterizing the importance of clarity of roles and\nresponsibilities in government inter-organizational collaboration and information sharing initiatives. Government Information Quarterly, 36(4): 101393.\nGoerisch, D.; Basiliere, J.; Rosener, A.; McKee, K.; Hunt,\nJ.; and Parker, T. M. 2019. Mentoring with: reimagining\nmentoring across the university. Gender, Place & Culture,\n26(12): 1740–1758.\nGranovetter, M. S. 1973. The Strength of Weak Ties. American Journal of Sociology, 78(6): 1360–1380.\nGunasekaran, T. S.; Lim, S.; Gupta, K.; Bai, H.; Pai, Y. S.;\nand Billinghurst, M. 2026. Cognitive Bridge: AI-Generated\nBoundary Objects for Cross-Functional Collaboration. In\nProceedings of the 2026 CHI Conference on Human Factors\nin Computing Systems, 1–35.\nHadley, C. N.; and Wright, S. L. 2024. We’re Still Lonely at\nWork. Harvard Business Review, 103(11-12): 68–77.\nHadley, C. N.; and Wright, S. L. 2026. Employees Are Relying on AI for Personal Support. That’s Risky. Harvard\nBusiness Review.\nHarris, J. I.; Winskowski, A. M.; and Engdahl, B. E. 2007.\nTypes of workplace social support in the prediction of job\nsatisfaction. The career development quarterly, 56(2): 150–",
        "title": "Characterizing the importance of clarity of roles and responsibilities in government inter-organizational collaboration and information sharing initiatives",
        "url": null,
        "venue": "Government Information Quarterly",
        "year": 2019
      },
      "exists": null,
      "explanation": "The first citation, Gil-Garcia et al. 2019, is highly relevant as it characterizes the importance of role clarity and responsibilities in collaborations, supporting the paper's section on how AI blurs role boundaries.",
      "notes": "This bibliography entry concatenates multiple unrelated references, starting with the title and venue of Gil-Garcia et al. 2019 whose authors are in the previous entry.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Hatton, E."
        ],
        "doi": null,
        "key": "5",
        "raw": "Hatton, E. 2017. Mechanisms of invisibility: rethinking the\nconcept of invisible work. Work, employment and society,\n31(2): 336–351.\nHiggins, M. C.; and Kram, K. E. 2001. Reconceptualizing\nmentoring at work: A developmental network perspective.\nAcademy of management review, 26(2): 264–288.\nHohn, C.; and Loydl, K. 2026. Vibe Coding: intention instead of implementation: How UX professionals build, evaluate, and hand over functional prototypes with AI. i-com,\n(0).\nHouse, J.; and Kahn, R. 1985. Measures and concepts of\nsocial support. Cohen, S. Syme, S.L. (Eds.) Social support\nand health, 83–108.\nHouse, J. S. 1983. Work stress and social support. Addison-\nWesley series on occupational stress.\nKahn, W. A. 1990. Psychological conditions of personal\nengagement and disengagement at work. Academy of management journal, 33(4): 692–724.\nKommers, C.; Duede, E.; Gordon, J.; Holtzman, A.; Mc-\nNulty, T.; Stewart, S.; Thomas, L.; Jean So, R.; and Long,\nH. 2026. Why slop matters. ACM AI Letters, 1(1): 1–6.\nKrackhardt, D.; and Hanson, J. R. 1993. Informal networks.\nHarvard business review, 71(4): 104–111.\nKwon, H.; Oh, J.; Lee, S.; Lee, S.; and Lee, S. 2026. Investigating AI-induced Technostress and Coping Strategies of\nProfessionals. In Proceedings of the 2026 CHI Conference\non Human Factors in Computing Systems, 1–16.\nLaird, M. D.; Perryman, A. A.; Hochwarter, W. A.; Ferris,\nG. R.; and Zinko, R. 2009. The moderating effects of personal reputation on accountability-strain relationships. Journal of occupational health psychology, 14(1): 70.\nLi, C.; Zhang, Y.; Niu, X.; Chen, F.; and Zhou, H. 2023.\nDoes artificial intelligence promote or inhibit on-the-job\nlearning? Human reactions to AI at work. Systems, 11(3):",
        "title": "Mechanisms of invisibility: rethinking the concept of invisible work",
        "url": null,
        "venue": "Work, employment and society",
        "year": 2017
      },
      "exists": null,
      "explanation": "The first citation, Hatton 2017, is highly relevant as it discusses the mechanisms of invisible work in employment, providing the core theoretical foundation for the paper's focus on invisible work.",
      "notes": "This bibliography entry concatenates multiple unrelated references.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Mendel, T.",
          "Mandal, S.",
          "Nov, O.",
          "Wiesenfeld, B. M."
        ],
        "doi": null,
        "key": "6",
        "raw": "Mendel, T.; Mandal, S.; Nov, O.; and Wiesenfeld, B. M.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "This entry only contains author names for Mendel et al. 2025, so its citation context is incomplete within this entry.",
      "notes": "This entry contains only the authors of Mendel et al. 2025, while the title and venue are in the next entry.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "7",
        "raw": "Who is Responsible, the Advisor or the AI? Understanding the Effects of Advisors Disclosing Their AI Use on\nTheir Perceived Responsibility and AI Reliance. Proc. ACM\nHum.-Comput. Interact., 9(7).\nMeske, C.; Hermanns, T.; Von der Weiden, E.; Loser, K.-U.;\nand Berger, T. 2025. Vibe coding as a reconfiguration of\nintent mediation in software development: Definition, implications, and research agenda. IEEE Access, 13: 213242–",
        "title": "Who is Responsible, the Advisor or the AI? Understanding the Effects of Advisors Disclosing Their AI Use on Their Perceived Responsibility and AI Reliance",
        "url": null,
        "venue": "Proc. ACM Hum.-Comput. Interact.",
        "year": 2025
      },
      "exists": null,
      "explanation": "The first citation, Mendel et al. 2025, is highly relevant as it investigates accountability and perceived responsibility when advisors disclose AI use, supporting the paper's section on accountability and reputation.",
      "notes": "This entry contains the title/venue of Mendel et al. 2025 (whose authors are in the previous entry) and the reference Meske et al. 2025.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Mitschelen, A.",
          "Kauffeld, S."
        ],
        "doi": null,
        "key": "8",
        "raw": "Mitschelen, A.; and Kauffeld, S. 2025. Workplace learning\nduring organizational onboarding: integrating formal, informal, and self-regulated workplace learning. Frontiers in Organizational Psychology, 3: 1569098.\nMoreland, R. L. 1996. Socially shared cognition at work\n: Transactive memory and group performance. What’s So\nSocial About Social Cognition? : Social Cognition Research\nin Small Groups, 57–84.\nNahar, N.; K¨astner, C.; Butler, J.; Parnin, C.; Zimmermann,\nT.; and Bird, C. 2025. Beyond the comfort zone: Emerging solutions to overcome challenges in integrating llms into\nsoftware products. In 2025 IEEE/ACM 47th International\nConference on Software Engineering: Software Engineering\nin Practice (ICSE-SEIP), 516–527. IEEE.\nNass, C.; and Moon, Y. 2000. Machines and mindlessness:\nSocial responses to computers. Journal of social issues,\n56(1): 81–103.\nNg, T. W.; and Sorensen, K. L. 2008. Toward a further understanding of the relationships between perceptions of support and work attitudes: A meta-analysis. Group & Organization Management, 33(3): 243–268.\nNiederhoffer, K.; Kellerman, G. R.; Lee, A.; Liebscher, A.;\nRapuano, K.; and Hancock, J. T. 2025. AI-generated “workslop” is destroying productivity. Harvard Business Review.\nNwana, H. S. 1990. Intelligent tutoring systems: an\noverview. Artificial Intelligence Review, 4(4): 251–277.\nOliveira, P.; Carvalho, J. M. S.; and Faria, S. 2025. AI Integration in Organisational Workflows: A Case Study on Job\nReconfiguration, Efficiency, and Workforce Adaptation. Information, 16(9).\nPark, Y. S.; Arvi, N. A. P.; Kim, S.; and Kim, J. 2026. Authorship Drift: How Self-Efficacy and Trust Evolve During\nLLM-Assisted Writing. In Proceedings of the 2026 CHI\nConference on Human Factors in Computing Systems, 1–18.\nPelau, C.; Dabija, D.-C.; and Ene, I. 2021. What makes an\nAI device human-like? The role of interaction quality, empathy and perceived psychological anthropomorphic characteristics in the acceptance of artificial intelligence in the service\nindustry. Computers in Human Behavior, 122: 106855.",
        "title": "Workplace learning during organizational onboarding: integrating formal, informal, and self-regulated workplace learning",
        "url": null,
        "venue": "Frontiers in Organizational Psychology",
        "year": 2025
      },
      "exists": null,
      "explanation": "The first citation, Mitschelen & Kauffeld 2025, is highly relevant as it integrates formal and informal learning during onboarding, which supports the paper's discussion on how AI impacts on-the-job learning.",
      "notes": "This bibliography entry concatenates multiple unrelated references.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [
          "Pereira, V.",
          "Hadjielias, E.",
          "Christofi, M.",
          "Vrontis, D."
        ],
        "doi": null,
        "key": "9",
        "raw": "Pereira, V.; Hadjielias, E.; Christofi, M.; and Vrontis, D.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "This entry only contains author names for Pereira et al. 2023, so its citation context is incomplete within this entry.",
      "notes": "This entry contains only the authors of Pereira et al. 2023, while the title and venue are in the next entry.",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "10",
        "raw": "A systematic literature review on the impact of artificial intelligence on workplace outcomes: A multi-process\nperspective. Human Resource Management Review, 33(1):",
        "title": "A systematic literature review on the impact of artificial intelligence on workplace outcomes: A multi-process perspective",
        "url": null,
        "venue": "Human Resource Management Review",
        "year": 2023
      },
      "exists": null,
      "explanation": "The citation, Pereira et al. 2023, is highly relevant as it provides a systematic review of the impact of AI on workplace outcomes, which directly aligns with the paper's investigation.",
      "notes": "This entry contains only the title and venue of Pereira et al. 2023, whose authors are in the previous entry.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2510.22780",
        "authors": [
          "Poquet, O.",
          "De Laat, M."
        ],
        "doi": null,
        "key": "11",
        "raw": "Poquet, O.; and De Laat, M. 2021. Developing capabilities:\nLifelong learning in the age of AI. British Journal of Educational Technology, 52(4): 1695–1708.\nPost, C.; De Lia, E.; DiTomaso, N.; Tirpak, T. M.; and Borwankar, R. 2009. Capitalizing on thought diversity for innovation. Research-Technology Management, 52(6): 14–25.\nRanganathan, A.; and Ye, X. M. 2026. AI doesn’t reduce\nwork—it intensifies it. Harvard Bus. Rev.\nRanjit, J.; Zhou, K.; Swayamdipta, S.; and Quercia, D. 2026.\nAre We Automating the Joy Out of Work? Designing AI to\nAugment Work, Not Meaning. In Proceedings of the 2026\nCHI Conference on Human Factors in Computing Systems,\n1–46.\nReif, J. A.; Larrick, R. P.; and Soll, J. B. 2025. Evidence of\na social evaluation penalty for using AI. Proceedings of the\nNational Academy of Sciences, 122(19): e2426766122.\nSalas, E.; Prince, C.; Baker, D. P.; and Shrestha, L. 1995.\nSituation awareness in team performance: Implications for\nmeasurement and training. Human Factors, 37(1): 123–136.\nSzulanski, G. 1996. Exploring internal stickiness: Impediments to the transfer of best practice within the firm. Strategic Management Journal, 17(S2): 27–43.\nTime. 2023. How to end the unfairness of invisible work.\nVallance, C. 2023. AI could replace equivalent of 300 million jobs. BBC News.\nViswesvaran, C.; Sanchez, J. I.; and Fisher, J. 1999. The\nrole of social support in the process of work stress: A metaanalysis. Journal of vocational behavior, 54(2): 314–334.\nWang, D.; Waldman, D. A.; and Ashforth, B. E. 2019. Building relationships through accountability: An expanded idea\nof accountability. Organizational Psychology Review, 9(2-\n3): 184–206.\nWang, Z. Z.; Shao, Y.; Shaikh, O.; Fried, D.; Neubig, G.;\nand Yang, D. 2025. How Do AI Agents Do Human Work?\nComparing AI and Human Workflows Across Diverse Occupations. arXiv:2510.22780.\nWebster, J.; Brown, G.; Zweig, D.; Connelly, C. E.; Brodt,\nS.; and Sitkin, S. 2008. Beyond knowledge sharing: Withholding knowledge at work. Research in Personnel and Human Resources Management, 27: 1–37.\nWells, J. E.; and MacAulay, D. ???? What ’Invisible Work’\nLooks Like in the 21st Century.\nWolfe, D. A.; Choe, A.; and Kidd, F. 2025. The Architecture of AI Transformation: Four Strategic Patterns and an\nEmerging Frontier. arXiv preprint arXiv:2509.02853.\nWoodruff, A.; Shelby, R.; Kelley, P. G.; Rousso-Schindler,\nS.; Smith-Loud, J.; and Wilcox, L. 2024. How knowledge\nworkers think generative ai will (not) transform their industries. In Proceedings of the 2024 CHI Conference on Human\nFactors in Computing Systems, 1–26.\nZabbo, E. Feb 3 2026. Invisible labor at\nwork: what it is and how to address it.\nhttps://www.circles.com/resources/invisible-labor-atwork-what-it-is-and-how-to-address-it.\nZhang, S.; Zhang, T.; Cheng, J.; and Zhou, S. 2025a. Who\nis to Blame: A Comprehensive Review of Challenges and\nOpportunities in Designer-Developer Collaboration. Proceedings of the ACM on Human-Computer Interaction, 9(2):\n1–32.\nZhang, X.; De Pablos, P. O.; and Zhou, Z. 2013. Effect of\nknowledge sharing visibility on incentive-based relationship\nin Electronic Knowledge Management Systems: An empirical investigation. Computers in Human Behavior, 29(2):\n307–313.\nZhang, X.; Subramonyam, H.; Sarkar, A.; Drosos, I.; Wang,\nZ.; Lee, K.; Pimenova, V.; Chen, X.; and Lukoff, K.",
        "title": "Developing capabilities: Lifelong learning in the age of AI",
        "url": null,
        "venue": "British Journal of Educational Technology",
        "year": 2021
      },
      "exists": null,
      "explanation": "The first citation, Poquet & De Laat 2021, is highly relevant as it discusses lifelong learning capabilities in the age of AI, supporting the paper's findings on on-the-job learning.",
      "notes": "This bibliography entry concatenates multiple unrelated references and ends with the authors of Zhang et al. 2026, whose title and venue are in the next entry.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2506.12605",
        "authors": [],
        "doi": null,
        "key": "12",
        "raw": "Generative Design and Vibe Coding: Rethinking The\nDesign-Development Divide for UI Prototyping. In Proceedings of the Extended Abstracts of the 2026 CHI Conference on Human Factors in Computing Systems, 1–3.\nZhang, Y.; Zhao, D.; Hancock, J. T.; Kraut, R.; and Yang,\nD. 2025b. The rise of AI companions: how humanchatbot relationships influence well-being. arXiv preprint\narXiv:2506.12605.\nZhou, X.; ...",
        "title": "Generative Design and Vibe Coding: Rethinking The Design-Development Divide for UI Prototyping",
        "url": null,
        "venue": "Proceedings of the Extended Abstracts of the 2026 CHI Conference on Human Factors in Computing Systems",
        "year": 2026
      },
      "exists": null,
      "explanation": "The first citation, Zhang et al. 2026 ('Generative Design and Vibe Coding'), is highly relevant as it discusses vibe coding and rethinking the design-development divide, which supports the paper's findings on vibe coding and cross-discipline communication.",
      "notes": "This entry starts with the title/venue of Zhang et al. 2026 (whose authors are in the previous entry) and contains Zhang et al. 2025b and Zhou et al. 2025.",
      "relevance": "high",
      "resolved_doi": null,
      "resolved_url": null
    }
  ],
  "missing_references": [
    {
      "reason": "This seminal paper in Computer-Supported Cooperative Work (CSCW) defines and conceptualizes how systems and technologies create and depend on invisible labor. Given the paper's focus on how AI systems shift and hide professional work, referencing Star's foundational CSCW framework would significantly strengthen the theoretical grounding.",
      "title": "Invisible Work and System Design"
    },
    {
      "reason": "This foundational paper discusses the tension between representation of work in systems (like org charts or workflow tools) and the actual, informal practices of workers. It is highly relevant to the paper's proposal of making invisible work visible to managers and organization leaders.",
      "title": "Making Work Visible: Representation of Work"
    }
  ],
  "summary": "The bibliography has severe formatting and structural issues, with most entries containing concatenations of multiple unrelated papers due to incorrect citation boundary detection. Additionally, several citations (such as Bhat et al., Gil-Garcia et al., Mendel et al., and Pereira et al.) are split across separate bibliography entries, isolating author lists from their titles, venues, and publication years."
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.74,
  "questions": [
    "Has the étale fundamental group chapter been inadvertently omitted from the submitted PDF? If the full manuscript exists, please resubmit including Chapter 2 in its entirety.",
    "What proof strategy does the author intend for the transcendental comparison theorem (π_1^ét(X) ≅ (π_1^top(X^an))^) — via GAGA/Riemann existence following Szamuely §5.7, or an alternative approach — and what hypotheses (connectedness, finite type over ℂ, compatible base-points) are assumed?",
    "Which Tannakian incarnations (differential-Galois, motivic Galois groups) does the thesis intend to prove versus merely cite as motivation, and will the boundary between proved and referenced results be made explicit in the introduction of Chapter 3?",
    "Given that Deligne (1990) and Saavedra Rivano (1972) are the primary sources for the reconstruction theorem for neutral Tannakian categories, why do they not appear in the bibliography, and has the author verified that the proofs in Chapter 3 do not implicitly depend on results from these works without attribution?",
    "For the purposes of the proof-as-code requirement in this math.AG/math.CT submission: does the author plan to provide a Lean 4/mathlib companion formalizing at least the topological Galois correspondence (Theorem 26) and the Tannaka–Krein duality, or will the paper explicitly justify the absence of formal verification?"
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "The submitted text contains only three top-level chapters: 'Topological Covering Spaces and Galois Theory' (line 120), 'Tannakian Fundamental Groups' (line 2585), and two appendices ('Selected Results from Commutative Algebra...', 'Review of Category Theory'). No chapter introducing the étale topology, étale morphisms, the étale fundamental group, the transcendental comparison theorem, or structure theorems for π_1^ét is present. The Tannakian chapter opens with 'In the last chapter, we established an equivalence... finite étale covers over a connected scheme... finite continuous representations of its étale fundamental group' (line 2587), referring to a chapter that does not appear in the submitted text. The titular contribution of the thesis is therefore not delivered in the submission.",
      "id": "weakness-1",
      "locator": "Abstract; Introduction (Sec. Introduction); chapter promised between Sec. 1 and Sec. 'Tannakian Fundamental Groups'",
      "required_update": "Insert the missing Chapter 2 covering: (i) étale morphisms and the étale site, (ii) construction of π_1^ét(X, \\bar{x}) as the automorphism group of the fibre functor on FÉt(X) (or as inverse limit over Galois covers), (iii) Riemann existence / transcendental comparison π_1^ét(X) ≅ π_1^top(X^{an})^^ for connected finite-type C-schemes (citing Szamuely/SGA1), (iv) at minimum statements with full references for structure theorems. Until inserted, the abstract overstates what is proved.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Abstract; Introduction (Sec. Introduction); chapter promised between Sec. 1 and Sec. 'Tannakian Fundamental Groups'` is corrected or justified.",
      "weakness_index": 0
    },
    {
      "evidence": "The thesis is in a code-amenable field (math.AG, math.CT). Central load-bearing theorems — Galois correspondence for covers (Thm 26), Grothendieck reformulation of Galois theory (Thm 56), the cover↔Gal(k_s/k)-set equivalence (Thm 58), the cover↔π_1-set equivalence (Thm 64) and its profinite refinement (Thm 67), Tannaka-Krein duality (Sec. 'Tannaka-Krein Duality'), and the equivalence FÉt(X) ↔ continuous π_1^ét-sets — are exactly the kind of categorical-equivalence statements amenable to formal verification in Lean (mathlib) / Coq (UniMath) / Agda (HoTT-Agda). The thesis ships no formal-proof artifact, no machine-checkable companion repository. Per the proof-as-code axiom for math.* fields, the absence of executable verification is a weakness for results of this scope and centrality.",
      "id": "weakness-2",
      "locator": "Throughout (proof-as-code consideration; field math.AG / math.CT)",
      "required_update": "Provide a companion Lean 4 + mathlib formalisation of at least the core equivalences. Suggested file layout: src/Topology/CoveringSpaces/GaloisCorrespondence.lean (Thm 26), src/FieldTheory/Galois/GrothendieckReformulation.lean (Thm 56, Thm 58), src/CategoryTheory/Tannaka/TannakaKrein.lean (Tannaka-Krein duality), src/AlgebraicGeometry/EtaleFundamentalGroup.lean (FÉt(X) ↔ π_1^ét-sets equivalence). Even formalising the topological Galois correspondence (Thm 26), which sits entirely in mathlib's reach today, would materially strengthen the technical foundation.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Throughout (proof-as-code consideration; field math.AG / math.CT)` is corrected or justified.",
      "weakness_index": 1
    },
    {
      "evidence": "This work originally extended Tannaka-Krein duality to affine group schemes over arbitrary fields, and is mentioned in the text but not cited in the bibliography.",
      "id": "weakness-3",
      "locator": "Catégories Tannakiennes (Saavedra Rivano, 1972)",
      "required_update": "Add or discuss missing prior art `Catégories Tannakiennes (Saavedra Rivano, 1972)`. This work originally extended Tannaka-Krein duality to affine group schemes over arbitrary fields, and is mentioned in the text but not cited in the bibliography.",
      "source_path": null,
      "source_role": "novelty",
      "status": "open",
      "target_kind": "bibliography",
      "verification_check": "Re-review should confirm the related-work discussion addresses this prior art.",
      "weakness_index": 2
    },
    {
      "evidence": "This foundational paper discusses the tension between representation of work in systems (like org charts or workflow tools) and the actual, informal practices of workers. It is highly relevant to the paper's proposal of making invisible work visible to managers and organization leaders.",
      "id": "weakness-4",
      "locator": "Making Work Visible: Representation of Work",
      "required_update": "Add a bibliography entry for `Making Work Visible: Representation of Work` and cite it where the affected method or claim is introduced, or explicitly justify its omission.",
      "source_path": null,
      "source_role": "citation",
      "status": "open",
      "target_kind": "bibliography",
      "verification_check": "Re-review should confirm the bibliography and citation context address this reference.",
      "weakness_index": 3
    },
    {
      "evidence": "The argument contains a clerical gap: the chain of equalities concluding 'so p_*(π_1(Y,y))' has a missing closing claim ('hence [γ] ∈ p_*(π_1(Y,y))'), and 'p_* : π_1(Y,y) → π_1(X,x' is missing a closing parenthesis. The mathematical content is standard and correct: the stabiliser equals the image of p_* by uniqueness of path lifts, and the set of stabilisers across the fibre is a single conjugacy class by the orbit-stabiliser correspondence (Thm 264 in the appendix).",
      "id": "weakness-5",
      "locator": "Lemma 23",
      "required_update": "Close the equality chain with 'hence [γ] ∈ p_*(π_1(Y,y))', and fix the typographical error 'π_1(X,x' → 'π_1(X,x)'.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Lemma 23` is corrected or justified.",
      "weakness_index": 4
    }
  ],
  "strengths": [
    "The topological covering-space chapter (Chapter 1) is largely mathematically sound, with the Galois correspondence (Theorem 25, Theorem 26), monodromy action (Theorem 14), and profinite refinement (Theorem 67) all following standard arguments with only minor proof gaps.",
    "The Tannakian chapter provides a coherent and self-contained exposition linking monodromy representations of local systems to Tannaka–Krein duality and Nori's fundamental group scheme, which is pedagogically valuable for graduate students entering this area.",
    "The thesis correctly identifies and develops the conceptual thread unifying topological covering theory, Grothendieck's Galois-category formalism, and the Tannakian reconstruction of fundamental groups as automorphism groups of fibre functors.",
    "The appendices on commutative algebra and category theory supply the necessary background machinery (Theorem 264, tensor categories) and are cross-referenced consistently within the proofs."
  ],
  "summary": "The submission is a thesis-level exposition of fundamental groups in algebraic geometry, covering topological covering theory, Galois-category formalism, and Tannakian duality. Three of the four aligned specialists (technical_correctness, novelty, reproducibility) converge on a serious structural completeness problem: the entire second chapter—which is the title contribution of the thesis, covering étale morphisms, the construction of π_1^ét, and the transcendental comparison theorem—is absent from the submitted text. The Tannakian chapter internally references this missing chapter ('In the last chapter, we established an equivalence…'), confirming it was intended to appear. The technical correctness specialist (confidence 0.68, overall_correctness 'questionable') flags this at critical severity in C1 and C9; the reproducibility specialist (confidence 0.86) independently flags the absence of any proof-as-code artifacts for headline claims at critical severity. The field is code-amenable (math.AG, math.CT), triggering the recommendation gate. Because at least two critical-severity findings from aligned specialists directly block the headline claim—constructing the étale fundamental group and proving the transcendental comparison—the default recommendation is major_revision. The novelty review correctly identifies this as a purely expository work (novelty_score 0.0, verdict 'marginal'); the absence of original results is appropriate for a thesis exposition, but Deligne (1990) and Saavedra Rivano (1972), the two primary sources for the Tannakian duality chapter, are missing from the bibliography. The citation specialist review is flagged as a review-input problem: its bibliography entries pertain to a workplace-AI paper about invisible labor (Abbas et al. 2025, onboarding, AI technostress, etc.) and are wholly inconsistent with the mathematical content described by every other specialist. The citation findings should not be applied as paper weaknesses; the citation pipeline must be rerun against the correct manuscript bibliography. Excluding that mismatch, the mathematical content present in the submission—the topological Galois correspondence, monodromy theory, local systems, and the Tannakian reconstruction—is handled with minor gaps and typographic errors only, and the expository clarity is appropriate for the target audience.",
  "weaknesses": [
    "The entire étale fundamental group chapter is absent from the submitted text: no construction of π_1^ét, no definition of the étale site, and no transcendental comparison with π_1^top is delivered, despite being promised in the abstract and introduction and referenced internally by the Tannakian chapter (C1, C9; critical severity in technical_correctness).",
    "No proof-as-code artifact is provided for any headline claim in this math.AG/math.CT thesis; the categorical equivalences (Galois correspondence, Tannaka–Krein duality, FÉt(X) ↔ π_1^ét-sets) are exactly the kind of results amenable to Lean 4/mathlib formalization, and their absence is a reproducibility gap at critical severity.",
    "Deligne (1990) 'Catégories Tannakiennes' and Saavedra Rivano (1972) 'Catégories Tannakiennes', the two foundational sources for the Tannakian duality chapter, are cited in the text but absent from the bibliography (novelty specialist, missing_prior_art).",
    "The citation specialist review was executed against a bibliography belonging to a different paper (a workplace-AI study on invisible labor), making those findings inapplicable to this manuscript; this is a review-input pipeline error that must be corrected before the citation review can be used.",
    "Several minor proof gaps exist in Chapter 1: silent use of path-connectedness without flagging dependence on the standing local-path-connectedness assumption (C2), citation mislabel of Hatcher propositions as Hartshorne (C3), incomplete kernel-identification step in Theorem 26 with a notation typo (C5), implicit commutativity of tensor product with direct products in Theorem 60 (C6), and a clerical gap and missing parenthesis in Lemma 23 (C12)."
  ]
}
```

### novelty (`Gemini 3.5 Flash (High)`) — status: `pass`

```json
{
  "confidence": 0.95,
  "missing_prior_art": [
    {
      "reason": "This paper is the standard modern reference on Tannakian categories and Tannakian duality, containing the definitive proof of the reconstruction theorem for neutral Tannakian categories, which is central to Chapter 3 of the thesis.",
      "title": "Catégories Tannakiennes (Deligne, 1990)"
    },
    {
      "reason": "This work originally extended Tannaka-Krein duality to affine group schemes over arbitrary fields, and is mentioned in the text but not cited in the bibliography.",
      "title": "Catégories Tannakiennes (Saavedra Rivano, 1972)"
    }
  ],
  "novelty_score": 0.0,
  "related_work": [
    {
      "citation_key": "SGA",
      "delta": "This thesis provides an expository overview of the étale fundamental group of schemes introduced in SGA 1, focusing on topological coverings and scheme-theoretic Galois theory, without introducing new results.",
      "relation": "prior_art",
      "title": "S\\'eminaire de g\\'eom\\'etrie alg\\'ebrique du Bois Marie 1960-61. Rev\\^etements \\'etales et groupe fondamental (SGA 1). Un s\\'eminaire dirig\\'e par Alexander Grothendieck. Augment\\'e de deux expos\\'es de M. Raynaud."
    },
    {
      "citation_key": "Szamuely",
      "delta": "The thesis follows Szamuely's algebraic approach to the construction of the étale fundamental group and transcendental comparison methods, offering a student-level exposition rather than new mathematical content.",
      "relation": "prior_art",
      "title": "Galois groups and fundamental groups"
    },
    {
      "citation_key": "Lenstra",
      "delta": "The thesis reviews Lenstra's Galois category approach to Galois theory for schemes as part of its expository scope.",
      "relation": "prior_art",
      "title": "Galois theory for schemes"
    },
    {
      "citation_key": "Nori",
      "delta": "The thesis reviews Nori's fundamental group scheme in the context of Tannakian categories as part of its exposition.",
      "relation": "prior_art",
      "title": "The fundamental group-scheme"
    },
    {
      "citation_key": "Etingof",
      "delta": "The thesis uses Etingof's monograph as background material on tensor categories for the section on Tannakian duality.",
      "relation": "prior_art",
      "title": "Tensor categories"
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
      "description": "No source repository, release, commit, or license is provided for any reproducibility artifact. The paper provides manuscript text and bibliography only, so an independent reader cannot rerun or inspect a formal proof-checking package.",
      "severity": "major"
    },
    {
      "area": "code",
      "description": "The headline mathematical claims about constructing the etale fundamental group, comparing it with the profinite completion of the topological fundamental group, and recovering fundamental groups via Tannakian fibre functors lack proof-as-code artifacts. A formalization such as formalization/EtaleFundamentalGroups.lean and formalization/TannakianFundamentalGroups.lean would be needed to close this gap.",
      "severity": "critical"
    },
    {
      "area": "evaluation",
      "description": "The manuscript relies on conventional mathematical exposition and cited references, with many results deferred to literature, but provides no machine-checkable theorem statement map, proof dependency graph, or proof checker output such as formalization/theorem_graph.json and formalization/proof_obligations.json.",
      "severity": "major"
    },
    {
      "area": "compute",
      "description": "No formal verification environment is specified: there is no theorem prover, math library version, dependency lockfile, or command line for checking the claimed theoretical development.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://stacks.math.columbia.edu/tag/01RV` (status=network_error)",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://stacks.math.columbia.edu/tag/01AG` (status=network_error)",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://stacks.math.columbia.edu/tag/01SA` (status=network_error)",
      "severity": "minor"
    }
  ],
  "confidence": 0.86,
  "data_availability": "unspecified",
  "data_url": null,
  "environment": null,
  "reproducibility_score": 0.18
}
```

### summary (`claude-haiku-4-5-20251001`) — status: `pass`

```json
{
  "audience": "Algebraic geometers, topologists, and students learning fundamental groups in algebraic contexts; suitable for graduate students and researchers seeking an introduction to the connections between topological and algebraic approaches to fundamental groups",
  "key_contributions": [
    "Presentation of the analogy between covering spaces and Galois theory as a conceptual foundation for extending fundamental group theory to algebraic geometry",
    "Exposition of Grothendieck's étale topology as a solution to the limitation that the Zariski topology makes many schemes trivially simply-connected",
    "Construction of the étale fundamental group and techniques for comparing it with the topological fundamental group via transcendental methods",
    "Development of Tannakian duality as a unifying framework that recovers fundamental groups as automorphism groups of fibre functors on monoidal categories",
    "Demonstration that the Tannakian framework encompasses étale, topological, and motivic Galois groups within a single conceptual approach"
  ],
  "plain_language_summary": "The fundamental group is a key tool in mathematics that encodes topological information about spaces as algebraic structures. This thesis presents three interconnected approaches to fundamental groups. It begins by reviewing the classical topological theory through covering spaces and exposing the deep analogy between how covering spaces work and how field extensions behave under Galois theory. The thesis then extends these ideas to algebraic geometry, where geometric objects called schemes lack a sufficiently rich topology in the classical sense. To address this limitation, the author develops the étale topology and constructs the étale fundamental group, which serves as the algebraic counterpart to the topological fundamental group. Using transcendental methods, the author compares these two notions and shows how they relate to one another. Finally, the thesis linearizes the theory through Tannakian duality, showing that fundamental groups can be recovered as automorphism groups of certain functors acting on monoidal categories—a framework that naturally encompasses the étale fundamental group, topological fundamental groups, and motivic Galois groups within a unified setting.",
  "tldr": "This thesis develops the étale fundamental group as an algebraic analogue of the topological fundamental group and unifies various notions of fundamental groups through Tannakian duality."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `pass`

```json
{
  "claims": [
    {
      "assessment": "unsupported",
      "claim": "The thesis covers three settings: topological covering spaces, the étale fundamental group of schemes, and Tannakian fundamental groups, with the étale chapter constructing the étale fundamental group, comparing it to the topological one via transcendental methods, and proving structure theorems.",
      "evidence": "The submitted text contains only three top-level chapters: 'Topological Covering Spaces and Galois Theory' (line 120), 'Tannakian Fundamental Groups' (line 2585), and two appendices ('Selected Results from Commutative Algebra...', 'Review of Category Theory'). No chapter introducing the étale topology, étale morphisms, the étale fundamental group, the transcendental comparison theorem, or structure theorems for π_1^ét is present. The Tannakian chapter opens with 'In the last chapter, we established an equivalence... finite étale covers over a connected scheme... finite continuous representations of its étale fundamental group' (line 2587), referring to a chapter that does not appear in the submitted text. The titular contribution of the thesis is therefore not delivered in the submission.",
      "id": "C1",
      "location": "Abstract; Introduction (Sec. Introduction); chapter promised between Sec. 1 and Sec. 'Tannakian Fundamental Groups'",
      "severity": "critical",
      "suggested_fix": "Insert the missing Chapter 2 covering: (i) étale morphisms and the étale site, (ii) construction of π_1^ét(X, \\bar{x}) as the automorphism group of the fibre functor on FÉt(X) (or as inverse limit over Galois covers), (iii) Riemann existence / transcendental comparison π_1^ét(X) ≅ π_1^top(X^{an})^^ for connected finite-type C-schemes (citing Szamuely/SGA1), (iv) at minimum statements with full references for structure theorems. Until inserted, the abstract overstates what is proved."
    },
    {
      "assessment": "partially_supported",
      "claim": "The monodromy action of π_1(X,x) on p^{-1}(x) for a connected covering p:Y→X is well-defined, a group action, and transitive.",
      "evidence": "The proof of well-definedness and the group-action axioms is correct and follows the standard path-lifting argument (Lemma 11). The transitivity argument, however, silently assumes Y is path-connected ('since Y is path-connected, any two points y, y' in p^{-1}(x) are joined by a path ω') but the hypothesis of Theorem 14 only says 'connected covering'. The theorem implicitly uses the standing assumption (Remark 2) that the base is locally path-connected, which together with connectedness of Y gives path-connectedness, but this dependence on the standing assumption is not flagged in the proof.",
      "id": "C2",
      "location": "Theorem 14 (Sec. 'Covering Spaces and their Galois structure')",
      "severity": "minor",
      "suggested_fix": "State explicitly that under the standing local-path-connectedness assumption of Remark 2, 'connected' implies 'path-connected' for Y, so the transitivity step is justified; alternatively, state Theorem 14 for path-connected covers."
    },
    {
      "assessment": "incorrect",
      "claim": "Citations for the lifting lemmas (Lemma 11 path/homotopy lifting; Lemma 12 lifting criterion) are given to Hartshorne, with the references 'Prop. 1.30 and 1.34' and 'Prop. 1.33'.",
      "evidence": "The path-lifting and homotopy-lifting properties for covering spaces, and the lifting criterion expressed in terms of fundamental-group image, are standard results in algebraic topology and appear in Hatcher's 'Algebraic Topology' (Propositions 1.30, 1.33, 1.34), not in Hartshorne's 'Algebraic Geometry' (which treats algebraic-geometry material, not topological covering spaces). The bibliography also lists Hatcher separately. This is a citation mislabel rather than a mathematical error; the propositions themselves are standard and correct.",
      "id": "C3",
      "location": "Proofs of Lemma 11 and Lemma 12",
      "severity": "minor",
      "suggested_fix": "Replace '@Hartshorne' with '@Hatcher' in the proofs of Lemma 11 and Lemma 12."
    },
    {
      "assessment": "supported",
      "claim": "A connected covering p:Y→X is Galois iff Aut(Y|X) acts transitively on each fibre iff p_*(π_1(Y,y)) is normal in π_1(X,x).",
      "evidence": "The (a)⇔(b) direction is argued correctly using Y/Aut(Y|X) being the orbit set and the standard fact that fibres of p are exactly the orbits when Aut(Y|X) acts transitively. The (b)⇔(c) direction invokes Lemmas 23 and 24, which themselves are proved (with reliance on the auxiliary classification result Theorem 264 in the appendix). The argument matches the standard treatment in Hatcher §1.3 / Szamuely §2.",
      "id": "C4",
      "location": "Theorem 25 (Sec. 'Covering Spaces and their Galois structure')",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "For X a connected topological space and p:Y→X a Galois cover with group G=Aut(Y|X), intermediate connected covers correspond bijectively to subgroups H ≤ G via H ↦ Y/H, and the cover Y/H → X is Galois iff H is normal in G, in which case Aut((Y/H)|X) ≅ G/H.",
      "evidence": "The bijection direction is correct. In the proof of the 'Galois iff normal' half (forward direction): the construction of the group homomorphism h:G → Aut(Z|X) by φ ↦ ϕ is given, and the proof asserts 'since the kernel of the morphism h is simply H = Aut(Z|X), we have that indeed H is a normal subgroup of G' — but the equality ker(h) = Aut(Y|Z) is only sketched: the proof does not verify that φ ∈ ker(h) (i.e., φ induces id on Z) implies φ stabilises every fibre of f setwise, which is the content of Aut(Y|Z). The conclusion is correct (this is a classical theorem) but the kernel-identification step warrants one more line. Additionally, the line 'x = p(x) = (q∘f)(y)' has a typo: should be 'x = p(y) = (q∘f)(y)'.",
      "id": "C5",
      "location": "Theorem 26 (Main Classification of Coverings)",
      "severity": "minor",
      "suggested_fix": "Add a sentence verifying ker(h) = Aut(Y|Z): φ ∈ ker(h) means the induced ϕ is id_Z, i.e., f∘φ = f, which is exactly the definition of φ ∈ Aut(Y|Z). Correct the typo 'x = p(x)' → 'x = p(y)'."
    },
    {
      "assessment": "partially_supported",
      "claim": "A finite-dimensional commutative k-algebra A is étale iff A ⊗_k \\bar{k} ≅ \\bar{k}^{⊕n} iff A ⊗_k \\bar{k} is reduced.",
      "evidence": "The implication (a)⇒(b) is argued only for a single finite separable extension L = k[x]/(f), then 'extends' implicitly to finite products ∏ L_i via the Chinese Remainder Theorem. The argument should note that ⊗_k\\bar{k} commutes with finite direct products (which is clear, but should be stated) before the conclusion. The other implications (b)⇒(a), (b)⇒(c), (c)⇒(b) are correct. The cardinality bound |Hom_k(L,\\bar{k})| ≤ [L:k] with equality iff separable is correctly invoked. The conclusion matches Bourbaki, A V §6 / Stacks 00U1.",
      "id": "C6",
      "location": "Theorem 60 ('Étale and Separable Algebras')",
      "severity": "minor",
      "suggested_fix": "Insert one line: 'Since ⊗_k\\bar{k} preserves finite direct products, applying the computation above to each separable factor L_i of A = ∏ L_i gives A ⊗_k \\bar{k} ≅ ∏_i \\bar{k}^{[L_i:k]} ≅ \\bar{k}^{dim_k A}.'"
    },
    {
      "assessment": "supported",
      "claim": "For X connected and locally simply-connected with base point x, the fibre functor Fib_x induces an equivalence between finite covers of X and finite continuous \\widehat{π_1(X,x)}-sets, with Galois covers corresponding to coset spaces of open normal subgroups.",
      "evidence": "The proof correctly reduces to Theorem 64 (the discrete version) and uses Lemma 66 (every finite-index subgroup contains a finite-index normal subgroup via the core construction), which is itself proved correctly. The continuity/openness argument via Lemma 43 is standard. This matches Szamuely §2.5.",
      "id": "C7",
      "location": "Theorem 67",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "The category of complex local systems on a connected, locally simply-connected space X is equivalent to the category of finite-dimensional complex representations of π_1(X,x) (monodromy representation).",
      "evidence": "Follows from the chain Theorem 75 (LCS_R(X) ≃ R[π_1]-Mod) → Theorem 76 (k[G]-Mod ≅ Rep_k(G)) → Corollary 77 (LCS_k ≃ Rep_k π_1). Each step is proved (with some indexing typos in Theorem 75 — e.g. 's, y ∈ F_M(U)' should be 's, t ∈ F_M(U)' — that do not affect correctness). The construction of M ×_{π_1} \\widetilde{X} → X as the cover from a representation is the standard 'associated cover' construction.",
      "id": "C8",
      "location": "Corollary 79 (and supporting Theorem 75, Theorem 76, Corollary 77)",
      "severity": "info",
      "suggested_fix": "Fix typos in Theorem 75 proof: 's, y' → 's, t'; clarify the use of free action of π_1 on \\widetilde{X} (Corollary 35) when arguing α_M is injective."
    },
    {
      "assessment": "unsupported",
      "claim": "The thesis transports the topology↔Galois analogy to the étale setting and constructs the étale fundamental group via a 'direct approach', then proves a transcendental comparison theorem identifying π_1^ét(X) with the profinite completion of π_1^top(X^{an}) for connected finite-type C-schemes.",
      "evidence": "The transcendental comparison theorem (Grothendieck, SGA 1, Exposé XII; Szamuely Thm 5.7.4) is a headline result the abstract and introduction promise to prove. Neither the construction of π_1^ét as the Aut of a fibre functor on FÉt(X), nor any formulation or proof of the comparison theorem appears in the submitted text. The only mention is in the Introduction at lines 64–68. Consequently, this load-bearing claim of the thesis is unsupported in the submission.",
      "id": "C9",
      "location": "Introduction (claimed program); chapter promised but absent",
      "severity": "critical",
      "suggested_fix": "Restore the missing étale chapter, including (i) the definition of π_1^ét via the fibre functor on the category of finite étale covers of X, with proof that this is a Galois category (or via the direct topological-analog approach the introduction advertises), (ii) the comparison theorem via GAGA / Riemann existence, with explicit hypotheses (connected, finite type over C) and compatible base-points. If executable verification is desired, the diagram chase establishing functoriality of the comparison map could be formalised in Lean (e.g. src/proofs/EtaleFundamental/Comparison.lean) building on mathlib's category-theory and algebraic-geometry libraries."
    },
    {
      "assessment": "partially_supported",
      "claim": "The Tannakian formalism recovers étale, topological, differential-Galois, and motivic Galois groups uniformly as automorphism groups of fibre functors; in particular Nori's fundamental group scheme π_1^N(S,s) is an affine group scheme.",
      "evidence": "Theorem 248 (Waterhouse: closed subgroups of GL_n are affine algebraic groups) is stated with reference to external sources; the proof in the submission relies on this citation rather than reproducing it (acceptable for an exposition). Proposition 252 (π_1^N affine) is stated. The broader unifying claim that Tannakian formalism encompasses differential-Galois and motivic Galois groups is asserted in the introduction but not proven; it is treated as motivation rather than a theorem of the thesis, which is appropriate, but the reader should be told explicitly that these unifications are reviewed only at the level of statement.",
      "id": "C10",
      "location": "Introduction; Theorem 248 (Waterhouse); Proposition 252 (Sec. 'Nori's Fundamental Group Scheme')",
      "severity": "minor",
      "suggested_fix": "In the introduction and at the start of Chapter 3, explicitly state which Tannakian incarnations are proved in the thesis (étale, topological via local systems) and which are referenced (differential-Galois, motivic) with citations to Deligne, Saavedra-Rivano, André."
    },
    {
      "assessment": "unsupported",
      "claim": "All the categorical equivalences and Galois-correspondence theorems stated in the thesis are mathematically rigorous.",
      "evidence": "The thesis is in a code-amenable field (math.AG, math.CT). Central load-bearing theorems — Galois correspondence for covers (Thm 26), Grothendieck reformulation of Galois theory (Thm 56), the cover↔Gal(k_s/k)-set equivalence (Thm 58), the cover↔π_1-set equivalence (Thm 64) and its profinite refinement (Thm 67), Tannaka-Krein duality (Sec. 'Tannaka-Krein Duality'), and the equivalence FÉt(X) ↔ continuous π_1^ét-sets — are exactly the kind of categorical-equivalence statements amenable to formal verification in Lean (mathlib) / Coq (UniMath) / Agda (HoTT-Agda). The thesis ships no formal-proof artifact, no machine-checkable companion repository. Per the proof-as-code axiom for math.* fields, the absence of executable verification is a weakness for results of this scope and centrality.",
      "id": "C11",
      "location": "Throughout (proof-as-code consideration; field math.AG / math.CT)",
      "severity": "major",
      "suggested_fix": "Provide a companion Lean 4 + mathlib formalisation of at least the core equivalences. Suggested file layout: src/Topology/CoveringSpaces/GaloisCorrespondence.lean (Thm 26), src/FieldTheory/Galois/GrothendieckReformulation.lean (Thm 56, Thm 58), src/CategoryTheory/Tannaka/TannakaKrein.lean (Tannaka-Krein duality), src/AlgebraicGeometry/EtaleFundamentalGroup.lean (FÉt(X) ↔ π_1^ét-sets equivalence). Even formalising the topological Galois correspondence (Thm 26), which sits entirely in mathlib's reach today, would materially strengthen the technical foundation."
    },
    {
      "assessment": "partially_supported",
      "claim": "Lemma 23 (stabiliser of y ∈ p^{-1}(x) under monodromy equals p_*(π_1(Y,y)); conjugacy class of these stabilisers is one conjugacy class in π_1(X,x)) is correctly proved.",
      "evidence": "The argument contains a clerical gap: the chain of equalities concluding 'so p_*(π_1(Y,y))' has a missing closing claim ('hence [γ] ∈ p_*(π_1(Y,y))'), and 'p_* : π_1(Y,y) → π_1(X,x' is missing a closing parenthesis. The mathematical content is standard and correct: the stabiliser equals the image of p_* by uniqueness of path lifts, and the set of stabilisers across the fibre is a single conjugacy class by the orbit-stabiliser correspondence (Thm 264 in the appendix).",
      "id": "C12",
      "location": "Lemma 23",
      "severity": "minor",
      "suggested_fix": "Close the equality chain with 'hence [γ] ∈ p_*(π_1(Y,y))', and fix the typographical error 'π_1(X,x' → 'π_1(X,x)'."
    }
  ],
  "confidence": 0.68,
  "overall_correctness": "questionable"
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

