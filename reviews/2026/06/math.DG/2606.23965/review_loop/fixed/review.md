# Homotopy transfers of curved $L_\infty$ algebras

GrokRxiv review of [arXiv:2606.23965](https://arxiv.org/abs/2606.23965) · `math.DG`

_Authors_: Shuhan Jiang

## TL;DR

The technical_correctness, reproducibility, and summary specialists consistently describe a pure mathematics paper (math.CT/math.AT) proving that L∞ spaces over dg manifolds form a category of fibrant objects and supplying a homotopy transfer theorem for curved L∞ algebras over filtered commutative dg algebras. Two specialist inputs are unusable as submitted: the citation specialist's report—referencing CHI conference papers, workplace-AI studies, and invisible-work literature in organizations—pertains to a different paper entirely, constituting a review-input mismatch rather than a paper weakness; the novelty specialist failed with a pipeline parse error and produced no usable prior-art assessment. Setting aside those corrupted inputs, the technical picture is as follows. The appendix machinery (Propositions 44, Lemmas 41, 43, 26, and Proposition 27) is detailed and internally consistent. However, three major gaps affect the load-bearing arguments for the headline Theorem 1: (i) Proposition 15 / Lemma 16 relies on an unpublished companion preprint [cattaneojiang26] for the kernel-of-surjection step, making assumption [a2] unverifiable from the submitted text; (ii) the Jacobi-identity check in Proposition 23 is compressed to a single line asserting that D² lies in the intersection of ker CE(φ̃) and ker CE(ψ̃) and must vanish, without establishing that this intersection is trivial on the symmetric coalgebra; (iii) no formal proof artifact exists for any of the principal theorems in a paper classified in the code-amenable field math.CT/math.AT. The reproducibility specialist assigns a score of 0.22 and flags the absence of a machine-checkable file for Theorem 1 at critical severity. Under the proof-as-code recommendation gate, the combination of a critical reproducibility finding and multiple major technical gaps in a code-amenable field mandates major_revision. The overall correctness is assessed as mostly_sound; no outright error was identified in the supported results.

_Recommendation_: **Major revision** · _Confidence_: 72%

## Strengths

- The appendix results—Lemmas 41, 43, 26 and Proposition 44—are detailed, self-contained, and correctly extend the Berglund–Getzler HPT machinery to the curved filtered setting.
- The strategy of reducing the geometric category-of-fibrant-objects problem to the algebraic setting via the global sections functor Γ (Proposition 18) is conceptually clean and follows well-established precedent from Getzler 2009 and 2025.
- Lemma 24 (every fibration is strict up to isomorphism) and Proposition 27 (simplicial framing via Dupont contraction) are completely supported and use the standard technical toolkit correctly.
- The homotopy transfer theorem for curved L∞ algebras over filtered cdgas (Proposition 44) fills a gap needed for the companion work on transitive L∞ algebroids and is proved at the right level of generality.

## Weaknesses

- Lemma 16—that the kernel of a surjection of locally free graded O_M-modules is locally free—is invoked from the unpublished companion preprint [cattaneojiang26] without an inline proof or publicly available substitute, leaving assumption [a2] and hence Proposition 15 unverifiable from the submitted manuscript alone.
- The critical Jacobi-identity step in Proposition 23 rests on a one-line assertion that D² vanishes because it lies in ker CE(φ̃) ∩ ker CE(ψ̃), without establishing that this joint kernel is trivial on Sym((k⊕n)[1]); this is the load-bearing check for the fiber-product curved L∞ structure that feeds directly into Theorem 1.
- No formal proof artifact (Lean 4, Coq, Agda, or equivalent) is provided for any CFO axiom, the homotopy transfer theorem, or the Berglund Green's operator formula, in a paper whose field (math.CT/math.AT) is code-amenable under the proof-as-code requirement; reproducibility score is 0.22 with a critical-severity finding against Theorem 1.
- The citation and novelty specialist inputs were produced from a different paper (an HCI/workplace-AI study) and a pipeline failure respectively; bibliographic quality and prior-art coverage of the mathematics manuscript are therefore entirely unreviewed.

## Revision Targets

- [ ] **Manuscript: Section 2, Proposition 15 with supporting Lemma 17.**
  - Location: `Section 2, Proposition 15 with supporting Lemma 17.`
  - Evidence: Assumption [a1] is established by the splitting theorem for graded manifolds plus the C^infty_M-module structure on Omega-hat_M. Assumption [a2] is reduced via Lemma 17 (locally free Omega-hat_M-modules of finite rank lift to Omega-hat_M tensor E for some locally free O_M-module E) to Lemma 16 of the companion paper [cattaneojiang26], which is invoked but not proved. The Lemma 17 splitting argument itself ('locally an isomorphism, hence an isomorphism') is brief and relies on completeness without explicit verification.
  - Required change: Add a short proof of Lemma 17 making the 'locally an isomorphism' step explicit (e.g. by trivializing in a chart and inverting the filtered automorphism degree by degree), and either inline Lemma 16 or replace the reference with a publicly available source.
  - Verification: Re-review should confirm `Section 2, Proposition 15 with supporting Lemma 17.` is corrected or justified.
- [ ] **Manuscript: Whole paper; no artifact repository, no formalization URL.**
  - Location: `Whole paper; no artifact repository, no formalization URL.`
  - Evidence: This is a paper in math.CT/math.AT (code-amenable field per the proof-as-code axiom). The principal theorems (Theorem 1 / Theorem 30, Propositions 14, 18, 23, 27, 28, 44 and the supporting CFO / HPT machinery) are exactly the kind of categorical and homotopical statements that mathlib/Lean4 or Coq-HoTT can express. The paper ships no executable artifact verifying any of the above; it relies entirely on prose-level proofs, several of which depend on an unpublished companion paper [cattaneojiang26].
  - Required change: Provide a companion Lean4/mathlib formalization of (a) the CFO axioms for L_infty Alg(R)_fgp (e.g. src/proofs/CFOLInfty.lean), (b) the explicit Berglund formula for the Green's operator (src/proofs/BerglundGreen.lean), and (c) the homotopy transfer theorem Proposition 44 (src/proofs/HTTCurvedLInfty.lean). Alternatively, supply a numerical/symbolic computer-algebra check (e.g. SageMath script experiments/hpt_check.sage) verifying the strong-homotopy Jacobi identities on the fiber product for small n, which would dramatically strengthen the load-bearing Proposition 23.
  - Verification: Re-review should confirm `Whole paper; no artifact repository, no formalization URL.` is corrected or justified.
- [ ] **Manuscript: Whole paper; no artifact repository, no formalization URL.**
  - Location: `Whole paper; no artifact repository, no formalization URL.`
  - Evidence: This is a paper in math.CT/math.AT (code-amenable field per the proof-as-code axiom). The principal theorems (Theorem 1 / Theorem 30, Propositions 14, 18, 23, 27, 28, 44 and the supporting CFO / HPT machinery) are exactly the kind of categorical and homotopical statements that mathlib/Lean4 or Coq-HoTT can express. The paper ships no executable artifact verifying any of the above; it relies entirely on prose-level proofs, several of which depend on an unpublished companion paper [cattaneojiang26].
  - Required change: Provide a companion Lean4/mathlib formalization of (a) the CFO axioms for L_infty Alg(R)_fgp (e.g. src/proofs/CFOLInfty.lean), (b) the explicit Berglund formula for the Green's operator (src/proofs/BerglundGreen.lean), and (c) the homotopy transfer theorem Proposition 44 (src/proofs/HTTCurvedLInfty.lean). Alternatively, supply a numerical/symbolic computer-algebra check (e.g. SageMath script experiments/hpt_check.sage) verifying the strong-homotopy Jacobi identities on the fiber product for small n, which would dramatically strengthen the load-bearing Proposition 23.
  - Verification: Re-review should confirm `Whole paper; no artifact repository, no formalization URL.` is corrected or justified.
- [ ] **Bibliography: Novelty reviewer unavailable**
  - Location: bibliography entry: `Novelty reviewer unavailable`
  - Evidence: Automated novelty review failed before producing a normal prior-art assessment. Failure: CliRunner parse/validate failure after corrective retry for role novelty: first=schema validation failed: Additional properties are not allowed ('entries', 'missing_references', 'summary' were unexpected); "novelty_score" is a required prop...
  - Required change: Add or discuss missing prior art `Novelty reviewer unavailable`. Automated novelty review failed before producing a normal prior-art assessment. Failure: CliRunner parse/validate failure after corrective retry for role novelty: first=schema validation failed: Additional properties are not allowed ('entries', 'missing_references', 'summary' were unexpected); "novelty_score" is a required prop...
  - Verification: Re-review should confirm the related-work discussion addresses this prior art.

## Open Questions

- Can the authors either supply a self-contained proof of Lemma 16 within the manuscript or post [cattaneojiang26] to arXiv (or another public preprint server) prior to final acceptance, so that assumption [a2] and its downstream consequences can be independently verified?
- What is the argument that the joint kernel of CE(φ̃) and CE(ψ̃) on Sym((k⊕n)[1]) is trivial, thereby completing the D² = 0 step in Proposition 23? The splitting g[1] = k[1] ⊕ s(m[1]) used earlier in the proof suggests a route; can the authors make this explicit?
- Would the authors consider providing a Lean 4/mathlib or Coq/HoTT formalization of at least the CFO axiom verification (Proposition 14 / Theorem 30) and the homotopy transfer theorem (Proposition 44), given the code-amenable classification of the paper?
- The Lemma 17 argument ('locally an isomorphism, hence an isomorphism') relies on completeness of the filtration without explicit verification; can a short chart-level computation be added to make the step rigorous?

## Per-Agent Reviews

### citation (`Gemini 3.5 Flash (Medium)`) — status: `pass`

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
        "raw": "Generative Design and Vibe Coding: Rethinking The\nDesign-Development Divide for UI Prototyping. In Proceedings of the Extended Abstracts of the 2026 CHI Conference on Human Factors in Computing Systems, 1–3.\nZhang, Y.; Zhao, D.; Hancock, J. T.; Kraut, R.; and Yang,\nD. 2025b. The rise of AI companions: how humanchatbot relationships influence well-being. arXiv preprint\narXiv:2506.12605.\nZhou, X.; Chen, C.; Li, W.; Yao, Y.; Cai, F.; Xu, J.; and Qin,\nX. 2025. How Do Coworkers Interpret Employee AI Usage:\nCoworkers’ Perceived Morality and Helping as Responses to\nEmployee AI Usage. Human Resource Management, 64(4):\n1077–1097.",
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
  "confidence": 0.72,
  "questions": [
    "Can the authors either supply a self-contained proof of Lemma 16 within the manuscript or post [cattaneojiang26] to arXiv (or another public preprint server) prior to final acceptance, so that assumption [a2] and its downstream consequences can be independently verified?",
    "What is the argument that the joint kernel of CE(φ̃) and CE(ψ̃) on Sym((k⊕n)[1]) is trivial, thereby completing the D² = 0 step in Proposition 23? The splitting g[1] = k[1] ⊕ s(m[1]) used earlier in the proof suggests a route; can the authors make this explicit?",
    "Would the authors consider providing a Lean 4/mathlib or Coq/HoTT formalization of at least the CFO axiom verification (Proposition 14 / Theorem 30) and the homotopy transfer theorem (Proposition 44), given the code-amenable classification of the paper?",
    "The Lemma 17 argument ('locally an isomorphism, hence an isomorphism') relies on completeness of the filtration without explicit verification; can a short chart-level computation be added to make the step rigorous?"
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "Assumption [a1] is established by the splitting theorem for graded manifolds plus the C^infty_M-module structure on Omega-hat_M. Assumption [a2] is reduced via Lemma 17 (locally free Omega-hat_M-modules of finite rank lift to Omega-hat_M tensor E for some locally free O_M-module E) to Lemma 16 of the companion paper [cattaneojiang26], which is invoked but not proved. The Lemma 17 splitting argument itself ('locally an isomorphism, hence an isomorphism') is brief and relies on completeness without explicit verification.",
      "id": "weakness-1",
      "locator": "Section 2, Proposition 15 with supporting Lemma 17.",
      "required_update": "Add a short proof of Lemma 17 making the 'locally an isomorphism' step explicit (e.g. by trivializing in a chart and inverting the filtered automorphism degree by degree), and either inline Lemma 16 or replace the reference with a publicly available source.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 2, Proposition 15 with supporting Lemma 17.` is corrected or justified.",
      "weakness_index": 0
    },
    {
      "evidence": "This is a paper in math.CT/math.AT (code-amenable field per the proof-as-code axiom). The principal theorems (Theorem 1 / Theorem 30, Propositions 14, 18, 23, 27, 28, 44 and the supporting CFO / HPT machinery) are exactly the kind of categorical and homotopical statements that mathlib/Lean4 or Coq-HoTT can express. The paper ships no executable artifact verifying any of the above; it relies entirely on prose-level proofs, several of which depend on an unpublished companion paper [cattaneojiang26].",
      "id": "weakness-2",
      "locator": "Whole paper; no artifact repository, no formalization URL.",
      "required_update": "Provide a companion Lean4/mathlib formalization of (a) the CFO axioms for L_infty Alg(R)_fgp (e.g. src/proofs/CFOLInfty.lean), (b) the explicit Berglund formula for the Green's operator (src/proofs/BerglundGreen.lean), and (c) the homotopy transfer theorem Proposition 44 (src/proofs/HTTCurvedLInfty.lean). Alternatively, supply a numerical/symbolic computer-algebra check (e.g. SageMath script experiments/hpt_check.sage) verifying the strong-homotopy Jacobi identities on the fiber product for small n, which would dramatically strengthen the load-bearing Proposition 23.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Whole paper; no artifact repository, no formalization URL.` is corrected or justified.",
      "weakness_index": 1
    },
    {
      "evidence": "This is a paper in math.CT/math.AT (code-amenable field per the proof-as-code axiom). The principal theorems (Theorem 1 / Theorem 30, Propositions 14, 18, 23, 27, 28, 44 and the supporting CFO / HPT machinery) are exactly the kind of categorical and homotopical statements that mathlib/Lean4 or Coq-HoTT can express. The paper ships no executable artifact verifying any of the above; it relies entirely on prose-level proofs, several of which depend on an unpublished companion paper [cattaneojiang26].",
      "id": "weakness-3",
      "locator": "Whole paper; no artifact repository, no formalization URL.",
      "required_update": "Provide a companion Lean4/mathlib formalization of (a) the CFO axioms for L_infty Alg(R)_fgp (e.g. src/proofs/CFOLInfty.lean), (b) the explicit Berglund formula for the Green's operator (src/proofs/BerglundGreen.lean), and (c) the homotopy transfer theorem Proposition 44 (src/proofs/HTTCurvedLInfty.lean). Alternatively, supply a numerical/symbolic computer-algebra check (e.g. SageMath script experiments/hpt_check.sage) verifying the strong-homotopy Jacobi identities on the fiber product for small n, which would dramatically strengthen the load-bearing Proposition 23.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Whole paper; no artifact repository, no formalization URL.` is corrected or justified.",
      "weakness_index": 2
    },
    {
      "evidence": "Automated novelty review failed before producing a normal prior-art assessment. Failure: CliRunner parse/validate failure after corrective retry for role novelty: first=schema validation failed: Additional properties are not allowed ('entries', 'missing_references', 'summary' were unexpected); \"novelty_score\" is a required prop...",
      "id": "weakness-4",
      "locator": "Novelty reviewer unavailable",
      "required_update": "Add or discuss missing prior art `Novelty reviewer unavailable`. Automated novelty review failed before producing a normal prior-art assessment. Failure: CliRunner parse/validate failure after corrective retry for role novelty: first=schema validation failed: Additional properties are not allowed ('entries', 'missing_references', 'summary' were unexpected); \"novelty_score\" is a required prop...",
      "source_path": null,
      "source_role": "novelty",
      "status": "open",
      "target_kind": "bibliography",
      "verification_check": "Re-review should confirm the related-work discussion addresses this prior art.",
      "weakness_index": 3
    }
  ],
  "strengths": [
    "The appendix results—Lemmas 41, 43, 26 and Proposition 44—are detailed, self-contained, and correctly extend the Berglund–Getzler HPT machinery to the curved filtered setting.",
    "The strategy of reducing the geometric category-of-fibrant-objects problem to the algebraic setting via the global sections functor Γ (Proposition 18) is conceptually clean and follows well-established precedent from Getzler 2009 and 2025.",
    "Lemma 24 (every fibration is strict up to isomorphism) and Proposition 27 (simplicial framing via Dupont contraction) are completely supported and use the standard technical toolkit correctly.",
    "The homotopy transfer theorem for curved L∞ algebras over filtered cdgas (Proposition 44) fills a gap needed for the companion work on transitive L∞ algebroids and is proved at the right level of generality."
  ],
  "summary": "The technical_correctness, reproducibility, and summary specialists consistently describe a pure mathematics paper (math.CT/math.AT) proving that L∞ spaces over dg manifolds form a category of fibrant objects and supplying a homotopy transfer theorem for curved L∞ algebras over filtered commutative dg algebras. Two specialist inputs are unusable as submitted: the citation specialist's report—referencing CHI conference papers, workplace-AI studies, and invisible-work literature in organizations—pertains to a different paper entirely, constituting a review-input mismatch rather than a paper weakness; the novelty specialist failed with a pipeline parse error and produced no usable prior-art assessment. Setting aside those corrupted inputs, the technical picture is as follows. The appendix machinery (Propositions 44, Lemmas 41, 43, 26, and Proposition 27) is detailed and internally consistent. However, three major gaps affect the load-bearing arguments for the headline Theorem 1: (i) Proposition 15 / Lemma 16 relies on an unpublished companion preprint [cattaneojiang26] for the kernel-of-surjection step, making assumption [a2] unverifiable from the submitted text; (ii) the Jacobi-identity check in Proposition 23 is compressed to a single line asserting that D² lies in the intersection of ker CE(φ̃) and ker CE(ψ̃) and must vanish, without establishing that this intersection is trivial on the symmetric coalgebra; (iii) no formal proof artifact exists for any of the principal theorems in a paper classified in the code-amenable field math.CT/math.AT. The reproducibility specialist assigns a score of 0.22 and flags the absence of a machine-checkable file for Theorem 1 at critical severity. Under the proof-as-code recommendation gate, the combination of a critical reproducibility finding and multiple major technical gaps in a code-amenable field mandates major_revision. The overall correctness is assessed as mostly_sound; no outright error was identified in the supported results.",
  "weaknesses": [
    "Lemma 16—that the kernel of a surjection of locally free graded O_M-modules is locally free—is invoked from the unpublished companion preprint [cattaneojiang26] without an inline proof or publicly available substitute, leaving assumption [a2] and hence Proposition 15 unverifiable from the submitted manuscript alone.",
    "The critical Jacobi-identity step in Proposition 23 rests on a one-line assertion that D² vanishes because it lies in ker CE(φ̃) ∩ ker CE(ψ̃), without establishing that this joint kernel is trivial on Sym((k⊕n)[1]); this is the load-bearing check for the fiber-product curved L∞ structure that feeds directly into Theorem 1.",
    "No formal proof artifact (Lean 4, Coq, Agda, or equivalent) is provided for any CFO axiom, the homotopy transfer theorem, or the Berglund Green's operator formula, in a paper whose field (math.CT/math.AT) is code-amenable under the proof-as-code requirement; reproducibility score is 0.22 with a critical-severity finding against Theorem 1.",
    "The citation and novelty specialist inputs were produced from a different paper (an HCI/workplace-AI study) and a pipeline failure respectively; bibliographic quality and prior-art coverage of the mathematics manuscript are therefore entirely unreviewed."
  ]
}
```

### novelty (`Gemini 3.5 Flash (High)`) — status: `fail`

```json
{
  "confidence": 0.0,
  "missing_prior_art": [
    {
      "reason": "Automated novelty review failed before producing a normal prior-art assessment. Failure: CliRunner parse/validate failure after corrective retry for role novelty: first=schema validation failed: Additional properties are not allowed ('entries', 'missing_references', 'summary' were unexpected); \"novelty_score\" is a required prop...",
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
      "description": "No formal proof artifact accompanies the headline Theorem 1 that L_infty spaces over a dg manifold form a category of fibrant objects; a machine-checkable file such as formalization/Lean/HomotopyTransfers/CFO.lean would be needed to reproduce the central theorem under the proof-as-code requirement.",
      "severity": "critical"
    },
    {
      "area": "code",
      "description": "The appendical homotopy transfer results for curved L_infty algebras over filtered cdgas are given only as prose mathematics; a proof artifact such as formalization/Lean/HomotopyTransfers/CurvedTransfer.lean covering the curved complex perturbation lemmas and induced L_infty morphisms would close this gap.",
      "severity": "major"
    },
    {
      "area": "code",
      "description": "No repository, commit, license, or release is provided for any supplementary verification scripts or formalization sources, so independent reproduction cannot pin the artifact state.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "The paper does not specify a proof-assistant environment, library versions, or dependency stack for independently checking the load-bearing formal statements.",
      "severity": "major"
    }
  ],
  "confidence": 0.87,
  "data_availability": "unspecified",
  "data_url": null,
  "environment": null,
  "reproducibility_score": 0.22
}
```

### summary (`claude-haiku-4-5-20251001`) — status: `pass`

```json
{
  "audience": "Researchers in derived algebraic geometry, homotopy theory, higher algebra, and mathematical physics working with L∞-algebroids, differential graded manifolds, and categorical approaches to algebraic structures",
  "key_contributions": [
    "Proves that L∞ spaces over a dg manifold form a category of fibrant objects",
    "Establishes that the Fib functor can be interpreted as a fibrant replacement functor detecting weak equivalences",
    "Provides a homotopy transfer theorem for curved L∞ algebras over filtered commutative differential graded algebras"
  ],
  "plain_language_summary": "This paper studies algebraic structures called L∞ spaces, which generalize Lie algebras and can be defined over differential graded manifolds—manifolds equipped with additional algebraic structure. The author proves these spaces satisfy important homotopy-theoretic properties called 'being a category of fibrant objects,' which allows mathematicians to apply powerful tools from homotopy theory. The key insight is that a geometric problem can be translated into a purely algebraic one using the global sections functor, and then classical techniques for relating algebraic structures at different complexity levels (homotopy transfer theorems) can be adapted to this filtered setting. A companion paper shows that even more geometric objects called transitive L∞ algebroids possess the same properties.",
  "tldr": "The paper proves that L∞ spaces over differential graded manifolds form a category of fibrant objects, establishing good homotopy-theoretic properties for these algebraic structures."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `pass`

```json
{
  "claims": [
    {
      "assessment": "partially_supported",
      "claim": "L_infty spaces over a dg manifold form a category of fibrant objects (Theorem 1).",
      "evidence": "The proof reduces the statement to the algebraic side via the global sections functor (Prop 18) and then uses Prop 23 (pullbacks of fibrations), Prop 27 (simplicial frame via Dupont contraction + HPT), and Prop 28. Each individual step is plausible and follows the strategy of Getzler 2009 and Getzler 2025 adapted to filtered cdgas. However, two load-bearing inputs are not self-contained: (i) Lemma 16 (kernel of a surjection of locally free graded O_M-modules is locally free) is cited from the unpublished companion preprint [cattaneojiang26] dated 2026, and (ii) the verification that the multi-brackets on the fiber product g x_m n satisfy the strong-homotopy Jacobi identities is compressed into a one-line argument ('D^2 lies in the kernels of both CE(phi-tilde) and CE(psi-tilde), and hence must vanish') without checking that the intersection of these kernels is trivial. Together these leave the headline theorem only partially verified from the text actually supplied.",
      "id": "T1",
      "location": "Section 1, Theorem 1; full proof assembled in Theorem 30, Section 4.",
      "severity": "major",
      "suggested_fix": "Either inline a self-contained proof of Lemma 16 (or replace the citation with a published reference), or upgrade the companion preprint to a public arXiv post; expand the D^2 = 0 step of Prop 23 to argue why the intersection of ker CE(phi-tilde) and ker CE(psi-tilde) on the relevant subspace is trivial (e.g. via the splitting g[1] = k[1] + s(m[1]) used earlier in the proof)."
    },
    {
      "assessment": "partially_supported",
      "claim": "For phi: g -> m a fibration and psi: n -> m, the fiber product of curved L_infty algebras exists; if phi is a trivial fibration so is the induced phi-tilde (Proposition 23).",
      "evidence": "The construction of the underlying module k + n, the explicit formulas (l1), (solpsi), (compphi), (pullback-morphism) and the universal property are written out clearly. The Leibniz rule and the universal property are verified. However the proof that the strong-homotopy Jacobi identities hold rests entirely on the assertion that D^2 lands inside ker CE(phi-tilde) ∩ ker CE(psi-tilde) and must therefore vanish; the paper does not justify why this intersection is zero on the symmetric-coalgebra component where D^2 lives. The trivial-fibration part is supported by the upper-triangular form of Gr l_1, which is correct modulo the same Jacobi-identity gap.",
      "id": "P23",
      "location": "Section 3, Proposition 23, with proof spanning the discussion after Lemma 24 through the matrix presentation of Gr l_1.",
      "severity": "major",
      "suggested_fix": "Spell out why the joint kernel of CE(phi-tilde) and CE(psi-tilde) on Sym((k+n)[1]) is zero, e.g. by showing that the Taylor coefficients of these morphisms together separate points on the symmetric coalgebra, or by computing the bracket identities directly along the lines of Getzler 2025."
    },
    {
      "assessment": "supported",
      "claim": "Every fibration in L_infty Alg(R)_fgp is strict up to isomorphism (Lemma 24).",
      "evidence": "Projectivity of m gives a splitting s of phi_1; the coalgebra automorphism Psi (with Taylor coefficients id in degree 1 and s o phi_n in other degrees) is invertible by completeness of the convolution filtration on Sym-hat, and the identity CE(phi) = Phi o Psi is checked directly. The argument is the standard one used in Getzler 2025 and Rogers 2020 and is reproduced correctly here.",
      "id": "L24",
      "location": "Section 3, Lemma 24 with explicit Phi, Psi.",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "The graded ringed space (M, Omega-hat_M) satisfies assumptions [a1] (fine sheaf on a manifold) and [a2] (kernels of surjections in Vec(X) stay in Vec(X)) (Proposition 15).",
      "evidence": "Assumption [a1] is established by the splitting theorem for graded manifolds plus the C^infty_M-module structure on Omega-hat_M. Assumption [a2] is reduced via Lemma 17 (locally free Omega-hat_M-modules of finite rank lift to Omega-hat_M tensor E for some locally free O_M-module E) to Lemma 16 of the companion paper [cattaneojiang26], which is invoked but not proved. The Lemma 17 splitting argument itself ('locally an isomorphism, hence an isomorphism') is brief and relies on completeness without explicit verification.",
      "id": "P15",
      "location": "Section 2, Proposition 15 with supporting Lemma 17.",
      "severity": "major",
      "suggested_fix": "Add a short proof of Lemma 17 making the 'locally an isomorphism' step explicit (e.g. by trivializing in a chart and inverting the filtered automorphism degree by degree), and either inline Lemma 16 or replace the reference with a publicly available source."
    },
    {
      "assessment": "partially_supported",
      "claim": "For a graded ringed space (X, O_X) satisfying [a1] and [a2], the global sections functor Gamma is fully faithful, S(Gamma(E)) is canonically isomorphic to E for every O_X-module E, and Gamma(Vec(X)) lies inside Fgp(A) (Lemma 13).",
      "evidence": "The fully-faithful and S o Gamma = id statements are deferred to Lemma 2.3 and Proposition 2.5 of [morye2013note]. The author claims these results carry over to the graded ringed setting because the proofs only use [a1], but does not reproduce the verification. The second part of Lemma 13 (image of Gamma lies in Fgp(A)) uses Sardanashvily's partition-of-unity argument and is written out, but the refinement step that produces a disjoint countable cover U_{beta i} per finite-index beta is asserted without proof.",
      "id": "L13",
      "location": "Section 2, Lemma 13.",
      "severity": "minor",
      "suggested_fix": "Add a short paragraph confirming that Morye's two results extend to graded rings of degree-bounded type (or cite a graded version), and either cite or sketch the standard 'disjoint countable refinement of an open cover of a manifold' result."
    },
    {
      "assessment": "supported",
      "claim": "For each n >= 0, the curved L_infty algebra g_n = W_n^sharp tensor g together with the maps from g and to g^{(n+1)} provides a factorization l_n g -> g_n ->> r_n g of the diagonal that is a weak equivalence followed by a fibration and an isomorphism in degree 0 (Proposition 27).",
      "evidence": "The argument uses Dupont's contraction s_n, Whitney's projection p_n, and the standard side conditions (Lemma 25, cited from Getzler 2009). HPT for curved L_infty algebras (Proposition 44 in the appendix) gives morphisms (i_mu)_n and (p_mu)_n that are weak equivalences and whose composition with the canonical inclusion and vertex evaluation produces the factorization. The surjectivity of the linear component of the composite onto g^{(n+1)} is correctly identified with evaluation on W_n^sharp at the vertices. The commutativity of the diagram is checked via (i_mu)_n (p_mu)_n = id - [D_n, (s_mu)_n] and the vanishing of s_n on the inclusion and of ev_n on s_n.",
      "id": "P27",
      "location": "Section 3, Proposition 27 with input Lemmas 25, 26 and the appendices.",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Berglund's explicit formula for the Green's operator G of [d, L_h] on Sym^n(g[1]) is the symmetrized tensor expression in Lemma 41.",
      "evidence": "The proof reduces the claim to checking that the displayed combination yields id^{otimes n} - (ip)^{otimes n}. The coefficient identity c_{|epsilon|} = (n - |epsilon|) / C(n-1, |epsilon|) - |epsilon| / C(n-1, |epsilon|-1) is shown to vanish for 0 < |epsilon| < n and to equal +/-1 at the extremes. The combinatorics matches Berglund 2014 Proposition 5.1, and the algebraic identity [d, L_h] = L_{[l_1, h]} (equation (ll1h)) follows from the assumption h(l_0) = 0.",
      "id": "L41",
      "location": "Section 6 (appendix), Lemma 41.",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "p_mu and i_mu are morphisms of filtered graded cocommutative coalgebras over R^sharp, and D_h = delta + p_mu mu i is a coderivation compatible with D_R (Lemma 43).",
      "evidence": "The proof verifies (p_mu tensor p_mu) Delta = Delta p_mu by combining the side conditions h^2 = ph = hi = 0, the identity [D_g, h] = id - ip + [mu, h], and invertibility of id + mu h. The dual identity for i_mu uses the combinatorial identity sum over epsilon with epsilon_1 = 0 of C(m-1, |epsilon|)^{-1} = m. The closing remark that D_h is a coderivation compatible with D_R is immediate. The argument mirrors and correctly extends Berglund 2014 and Getzler 2025 Theorem 4.1.",
      "id": "L43",
      "location": "Section 6 (appendix), Lemma 43.",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "A contraction h of g induces a curved L_infty algebra structure on h with curvature p(l_0) and unary bracket p l_1 i, and the induced maps p_mu: g -> h and i_mu: h -> g are weak equivalences of curved L_infty algebras (Proposition 44, homotopy transfer theorem).",
      "evidence": "By Lemma 43 the perturbed differentials lift to coderivations, so h carries a curved L_infty structure. The zeroth and first Taylor coefficients (p_mu)_0 = 0, (i_mu)_0 = 0, (p_mu)_1 = p, (i_mu)_1 = i follow by inspection. Weak equivalence reduces to the associated graded statement, where (Gr p, Gr i, Gr h) is a strong deformation retract of complexes from (Gr g, Gr l_1) to (Gr h, Gr p l_1 i); the unary bracket on h is then a quasi-isomorphism by the standard fact that a strong deformation retract induces an iso on cohomology.",
      "id": "P44",
      "location": "Section 6 (appendix), Proposition 44.",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "s_n tensor id defines a contraction of the curved L_infty algebra Omega_n^sharp tensor-hat g over R (Lemma 26).",
      "evidence": "The proof verifies (s_n tensor id)(d tensor id + id tensor l_1)(s_n tensor id) = s_n tensor id using s_n d s_n = s_n and s_n^2 = 0 from Lemma 25, and shows [s_n tensor id, (d tensor id + id tensor l_1)^2] = [s_n tensor id, id tensor l_1^2] = 0 using R^sharp-linearity of s_n. Finally (s_n tensor id)(1 tensor l_0) = 0 because s_n vanishes on constants (h_n^i(1) = 0).",
      "id": "L26",
      "location": "Section 3, Lemma 26.",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "unsupported",
      "claim": "All categorical/structural claims (CFO axioms, fully faithful exact functors, framing existence) are not accompanied by any formal-proof artifact in Lean, Coq, Agda or Isabelle.",
      "evidence": "This is a paper in math.CT/math.AT (code-amenable field per the proof-as-code axiom). The principal theorems (Theorem 1 / Theorem 30, Propositions 14, 18, 23, 27, 28, 44 and the supporting CFO / HPT machinery) are exactly the kind of categorical and homotopical statements that mathlib/Lean4 or Coq-HoTT can express. The paper ships no executable artifact verifying any of the above; it relies entirely on prose-level proofs, several of which depend on an unpublished companion paper [cattaneojiang26].",
      "id": "PAC",
      "location": "Whole paper; no artifact repository, no formalization URL.",
      "severity": "major",
      "suggested_fix": "Provide a companion Lean4/mathlib formalization of (a) the CFO axioms for L_infty Alg(R)_fgp (e.g. src/proofs/CFOLInfty.lean), (b) the explicit Berglund formula for the Green's operator (src/proofs/BerglundGreen.lean), and (c) the homotopy transfer theorem Proposition 44 (src/proofs/HTTCurvedLInfty.lean). Alternatively, supply a numerical/symbolic computer-algebra check (e.g. SageMath script experiments/hpt_check.sage) verifying the strong-homotopy Jacobi identities on the fiber product for small n, which would dramatically strengthen the load-bearing Proposition 23."
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

1. Behrend2020thx: author=Behrend, Kai, author=Liao, Hsuan-Yi, author=Xu, Ping, title=Derived Differentiable Manifolds, date=2020, eprint=2006.01376, arXiv:[2006.01376](https://arxiv.org/abs/2006.01376)
2. amorim2022inverse: title=The inverse function theorem for curved L-infinity spaces., author=Amorim, Lino, author=Tu, Junwu, journal=Journal of Noncommutative Geometry, volume=16, number=4, date=2022
3. berglund2014homological: title=Homological perturbation theory for algebras over operads, author=Berglund, Alexander, journal=Algebraic \& Geometric Topology, volume=14, number=5, pages=2511--2548, date=2014, publisher=Mathematical Sciences Publishers
4. brown1973abstract: title=Abstract homotopy theory and generalized sheaf cohomology, author=Brown, Kenneth S., journal=Transactions of the American Mathematical Society, volume=186, pages=419--458, date=1973
5. carchedi2023derivedmanifoldsdifferentialgraded: author=Carchedi, David, title=Derived Manifolds as Differential Graded Manifolds, date=2023, eprint=2303.11140, arXiv:[2303.11140](https://arxiv.org/abs/2303.11140)
6. cattaneojiang26: author = Cattaneo, Alberto S., author = Jiang, Shuhan, title = From $L_\infty$ algebroids to $L_\infty$ spaces: Part I, date = 2026,
7. costello2011geometric: author=Costello, Kevin, title=A geometric construction of the Witten genus, II, date=2011, eprint=1112.0816, arXiv:[1112.0816](https://arxiv.org/abs/1112.0816)
8. dupont1976simplicial: title=Simplicial de Rham cohomology and characteristic classes of flat bundles, author=Dupont, Johan L, journal=Topology, volume=15, number=3, pages=233--245, date=1976, publisher=Pergamon
9. getzler2009: author=Getzler, Ezra, title=Lie theory for nilpotent $L_\infty$-algebras, journal=Annals of Mathematics, volume=170, number=1, date=2009, pages=271--301,
10. getzler2025higherholonomycurvedlinftyalgebras: author=Getzler, Ezra, title=Higher holonomy for curved $L_\infty$-algebras 1: simplicial methods, date=2025, eprint=2408.11157, arXiv:[2408.11157](https://arxiv.org/abs/2408.11157)
11. hovey2007model: title=Model Categories, author=Hovey, Mark, number=63, date=2007, publisher=American Mathematical Soc.,
12. morye2013note: title=Note on the Serre-Swan theorem, author=Morye, Archana S, journal=Mathematische Nachrichten, volume=286, number=2-3, pages=272--278, date=2013, publisher=Wiley Online Library
13. rogers2020explicit: title=An explicit model for the homotopy theory of finite-type Lie n--algebras, author=Rogers, Christopher L, journal=Algebraic \& Geometric Topology, volume=20, number=3, pages=1371--1429, date=2020, publisher=Mathematical Sciences Publishers
14. rogers2020homotopy: title=On the homotopy theory for Lie∞--groupoids, with an application to integrating L∞--algebras, author=Rogers, Christopher L, author=Zhu, Chenchang, journal=Algebraic \& Geometric Topology, volume=20, number=3, pages=1127--1219, date=2020, publisher=Mathematical Sciences Publishers,
15. rogers2023complete: title=Complete $L_\infty$-algebras and their homotopy theory, author=Rogers, Christopher L, journal=Journal of Pure and Applied Algebra, volume=227, number=10, pages=107403, date=2023, publisher=Elsevier,
16. sardanashvily2001remark: title=Remark on the Serre-Swan theorem for non-compact manifolds, author=Sardanashvily, G, eprint=math-ph/0102016, date=2001 arXiv:[math-ph/0102016](https://arxiv.org/abs/math-ph/0102016)

