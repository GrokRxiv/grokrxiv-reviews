# Homotopy transfers of curved $L_\infty$ algebras

GrokRxiv review of [arXiv:2606.23965](https://arxiv.org/abs/2606.23965) · `math.DG`

_Authors_: Shuhan Jiang

## TL;DR

The paper proves that L∞ spaces over a dg manifold form a category of fibrant objects (CFO), with supporting results including a fully faithful global sections functor (Proposition 18) and a homotopy transfer theorem for curved L∞ algebras over filtered cdgas (Proposition 44). The technical reviewer (confidence 0.70, overall_correctness: mostly_sound) identified two major gaps: Proposition 28 — on which Theorem 1 directly depends — is stated without proof, leaving three CFO axioms (2-out-of-3 for weak equivalences, terminal object existence, fibrancy of the terminal morphism) unverified; and no formal proof artifact is provided for any load-bearing categorical claim in a code-amenable field (math.AT/math.CT). The reproducibility specialist (confidence 0.86, score 0.22) independently corroborates both issues, rating the absence of a formal artifact for Theorem 1 as critical and identifying three further major concerns for the homotopy-transfer, global-sections, and companion-equivalence components. Two pipeline failures reduce overall review completeness and must not be attributed to the paper: (1) the novelty reviewer failed before producing a substantive assessment due to a schema validation error — the reported novelty_score of 0.0 and verdict 'marginal' are pipeline artifacts; (2) the citation specialist received the bibliography of a different manuscript — a CSCW/HCI paper about invisible work and AI in the workplace — rather than the mathematics paper reviewed by the other specialists; its bibliography findings and missing-reference suggestions are non-authoritative for this submission. Applying the code-amenable recommendation gate, both technical_correctness and reproducibility flagged missing proof-as-code artifacts at major and critical severity; because the missing Proposition 28 proof is load-bearing for the headline claim but the overall proof strategy is coherent and largely sound, major_revision is warranted rather than reject.

_Recommendation_: **Major revision** · _Confidence_: 70%

## Strengths

- The proof architecture reduces the geometric claim (L∞ spaces form a CFO) to an algebraic one (L∞ Alg(R_M)_fgp forms a CFO) via the fully faithful functor Γ, allowing each reduction step to be verified independently against established results in Getzler (2009, 2025) and Rogers (2020, 2023).
- The homotopy transfer theorem for curved L∞ algebras over filtered cdgas (Lemmas 43, 44) extends the Berglund–Getzler framework to a curved filtered setting, with intermediate lemmas (Lemmas 24, 26, 41) verified in detail via explicit combinatorial computations that are largely correct.
- Proposition 15 and Lemma 17 correctly establish that Ω̂_M satisfies the fineness and locally-free-kernel assumptions required by the abstract homotopy-theory machinery, using clean filtration arguments and a Nakayama-type reduction to the companion paper.
- Via the equivalence established in a companion paper, the CFO result extends immediately to transitive L∞ algebroids, demonstrating concrete downstream applicability in derived geometry beyond the paper's core setting.

## Weaknesses

- Proposition 28 (L∞ Alg(R_M)_fgp is a CFO with a framing) is stated without proof; Theorem 1 depends on it, and three CFO axioms — 2-out-of-3 for weak equivalences, existence/uniqueness of the terminal object, and fibrancy of the terminal morphism — are neither proved nor cited for this specific subcategory.
- No formal verification artifact (Lean 4, Coq, or Agda) is provided for any load-bearing categorical claim, despite the paper's primary fields (math.AT, math.CT) being code-amenable and the main results being precisely the kind of universal-property checks and combinatorial-identity verifications that proof assistants handle well; the reproducibility score is 0.22 with a critical-severity concern for Theorem 1.
- The coherence argument for Proposition 23 (fiber product construction) contains an unjustified step: D^2 = 0 is concluded from D^2 lying in the joint kernel of CE(φ̃) and CE(ψ̃), but the triviality of that joint kernel is not established anywhere in the proof.
- Proposition 18 verifies the underlying R_M-module structure of the quasi-inverse S(g_M) but does not confirm that the multi-bracket structure descends to a sheaf morphism under completed base change.

## Revision Targets

- [ ] **Manuscript: Proposition 28**
  - Location: `Proposition 28`
  - Evidence: The proposition is stated but no proof is given in the manuscript. Although the supporting Proposition 23 (pullbacks) and Proposition 27 (framing) are proved for the bigger class L_infty Alg(R)_fgp, the paper does not explicitly verify (i) the existence/uniqueness of the terminal object beyond a one-line assertion, (ii) the 2-out-of-3 property for weak equivalences, or (iii) that the terminal morphism is a fibration in this category.
  - Required change: Insert an explicit proof of Proposition 28 that verifies each CFO axiom (terminal object, 2-out-of-3, pullback stability, path-space factorization). Note specifically that 2-out-of-3 for weak equivalences is not obviously inherited from the associated graded picture.
  - Verification: Re-review should confirm `Proposition 28` is corrected or justified.
- [ ] **Manuscript: Throughout — no code repository or formal proof files are referenced or shipped**
  - Location: `Throughout — no code repository or formal proof files are referenced or shipped`
  - Evidence: The paper is in math.AT / math.CT (a code-amenable field per the proof-as-code axiom). The main results are abstract categorical statements whose verification reduces to checking finitely many universal-property diagrams and combinatorial identities — these are precisely the kinds of statements mathlib (Lean 4) is well-suited to formalize, and similar CFO/model-category results have been partially formalized (e.g., model-category-theory libraries). No accompanying artifact is provided.
  - Required change: Ship a Lean 4 / mathlib formalization at, e.g., src/formal/LInftySpaces/CFO.lean covering: (i) the CFO axiom check for L_infty Alg(R)_fgp (Proposition 28), (ii) the pullback construction (Proposition 23), (iii) the simplicial frame construction (Proposition 27). Even partial formalization of the combinatorial identity in Lemma 41 (src/formal/HPT/Berglund.lean) and the Jacobi-identity coherence in Proposition 23 would substantially strengthen the manuscript.
  - Verification: Re-review should confirm `Throughout — no code repository or formal proof files are referenced or shipped` is corrected or justified.
- [ ] **Manuscript: Proposition 23, proof spanning eqs (compphi), (solpsi), (pullback-morphism)**
  - Location: `Proposition 23, proof spanning eqs (compphi), (solpsi), (pullback-morphism)`
  - Evidence: The explicit construction of multi-brackets on k ⊕ n is given by characterization equations and the universal property is verified concretely. Coherence (D^2 = 0) is argued via 'D^2 lies in the kernels of both CE(φ̃) and CE(ψ̃), and hence must vanish' — but the claim that being in both kernels implies vanishing requires that CE(φ̃) and CE(ψ̃) have trivial common kernel, which is not justified. The graded computation for trivial fibrations correctly identifies H^•(Gr ψ̃_1) with projection, since H^•(Gr k) = 0 when φ is a weak equivalence.
  - Required change: Expand the D^2 = 0 argument: explicitly state why the joint kernel of CE(φ̃) and CE(ψ̃) is zero (presumably because (φ̃, ψ̃) embeds Sym̂((g×_m n)[1]) into Sym̂(g[1]) ⊕ Sym̂(n[1]) — or whatever the correct categorical statement is). Alternatively, verify the (n)-ary Jacobi identities directly from the explicit formula for π_1 ∘ l_n.
  - Verification: Re-review should confirm `Proposition 23, proof spanning eqs (compphi), (solpsi), (pullback-morphism)` is corrected or justified.
- [ ] **Manuscript: Proposition 18 with proof**
  - Location: `Proposition 18 with proof`
  - Evidence: Follows from Proposition 15 (assumptions (a1),(a2)) and Lemma 13 (Γ fully faithful), combined with the observation that S(g_M) on U is the completed base change. The proof that 'S(g_M) is a sheaf of curved L_infty algebras over R_M' relies on the completion of base change being well-behaved, but the paper does not fully verify the sheaf condition for the multi-bracket structure — only the underlying module is checked.
  - Required change: Add a sentence justifying that the multi-bracket structure descends to a sheaf morphism (e.g., by R^♯-linearity and the strict-filtration property derived from finitely-generated projectivity).
  - Verification: Re-review should confirm `Proposition 18 with proof` is corrected or justified.

## Open Questions

- Can the authors provide a self-contained proof of Proposition 28 verifying each CFO axiom — terminal object, 2-out-of-3 property for weak equivalences, pullback stability of (trivial) fibrations, and path-space factorization — for L∞ Alg(R_M)_fgp specifically, rather than by inheritance from the larger class L∞ Alg(R)_fgp?
- In Proposition 23, what is the precise argument establishing that the joint kernel of CE(φ̃) and CE(ψ̃) is trivial, so that D^2 lying in this kernel implies D^2 = 0 — is it the injectivity of the combined map (φ̃, ψ̃): Sym̂((g×_m n)[1]) → Sym̂(g[1]) ⊕ Sym̂(n[1])?
- Do the authors intend to provide a formal proof artifact (e.g., Lean 4/mathlib) covering at minimum the CFO axiom check in Proposition 28 and the pullback construction in Proposition 23, and if not, what justifies the omission for a result in a code-amenable field?
- What is the version and provenance of the companion paper establishing L∞ spaces ≃ transitive L∞ algebroids — is a pinned preprint available so that the corollary can be reproduced end-to-end without tracking an unpublished manuscript?
- In Proposition 18, where in the manuscript is it verified that the multi-bracket structure (not just the underlying R_M-module) on S(g_M) satisfies the sheaf gluing condition under completed base change?

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
  "confidence": 0.7,
  "questions": [
    "Can the authors provide a self-contained proof of Proposition 28 verifying each CFO axiom — terminal object, 2-out-of-3 property for weak equivalences, pullback stability of (trivial) fibrations, and path-space factorization — for L∞ Alg(R_M)_fgp specifically, rather than by inheritance from the larger class L∞ Alg(R)_fgp?",
    "In Proposition 23, what is the precise argument establishing that the joint kernel of CE(φ̃) and CE(ψ̃) is trivial, so that D^2 lying in this kernel implies D^2 = 0 — is it the injectivity of the combined map (φ̃, ψ̃): Sym̂((g×_m n)[1]) → Sym̂(g[1]) ⊕ Sym̂(n[1])?",
    "Do the authors intend to provide a formal proof artifact (e.g., Lean 4/mathlib) covering at minimum the CFO axiom check in Proposition 28 and the pullback construction in Proposition 23, and if not, what justifies the omission for a result in a code-amenable field?",
    "What is the version and provenance of the companion paper establishing L∞ spaces ≃ transitive L∞ algebroids — is a pinned preprint available so that the corollary can be reproduced end-to-end without tracking an unpublished manuscript?",
    "In Proposition 18, where in the manuscript is it verified that the multi-bracket structure (not just the underlying R_M-module) on S(g_M) satisfies the sheaf gluing condition under completed base change?"
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "The proposition is stated but no proof is given in the manuscript. Although the supporting Proposition 23 (pullbacks) and Proposition 27 (framing) are proved for the bigger class L_infty Alg(R)_fgp, the paper does not explicitly verify (i) the existence/uniqueness of the terminal object beyond a one-line assertion, (ii) the 2-out-of-3 property for weak equivalences, or (iii) that the terminal morphism is a fibration in this category.",
      "id": "weakness-1",
      "locator": "Proposition 28",
      "required_update": "Insert an explicit proof of Proposition 28 that verifies each CFO axiom (terminal object, 2-out-of-3, pullback stability, path-space factorization). Note specifically that 2-out-of-3 for weak equivalences is not obviously inherited from the associated graded picture.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Proposition 28` is corrected or justified.",
      "weakness_index": 0
    },
    {
      "evidence": "The paper is in math.AT / math.CT (a code-amenable field per the proof-as-code axiom). The main results are abstract categorical statements whose verification reduces to checking finitely many universal-property diagrams and combinatorial identities — these are precisely the kinds of statements mathlib (Lean 4) is well-suited to formalize, and similar CFO/model-category results have been partially formalized (e.g., model-category-theory libraries). No accompanying artifact is provided.",
      "id": "weakness-2",
      "locator": "Throughout — no code repository or formal proof files are referenced or shipped",
      "required_update": "Ship a Lean 4 / mathlib formalization at, e.g., src/formal/LInftySpaces/CFO.lean covering: (i) the CFO axiom check for L_infty Alg(R)_fgp (Proposition 28), (ii) the pullback construction (Proposition 23), (iii) the simplicial frame construction (Proposition 27). Even partial formalization of the combinatorial identity in Lemma 41 (src/formal/HPT/Berglund.lean) and the Jacobi-identity coherence in Proposition 23 would substantially strengthen the manuscript.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Throughout — no code repository or formal proof files are referenced or shipped` is corrected or justified.",
      "weakness_index": 1
    },
    {
      "evidence": "The explicit construction of multi-brackets on k ⊕ n is given by characterization equations and the universal property is verified concretely. Coherence (D^2 = 0) is argued via 'D^2 lies in the kernels of both CE(φ̃) and CE(ψ̃), and hence must vanish' — but the claim that being in both kernels implies vanishing requires that CE(φ̃) and CE(ψ̃) have trivial common kernel, which is not justified. The graded computation for trivial fibrations correctly identifies H^•(Gr ψ̃_1) with projection, since H^•(Gr k) = 0 when φ is a weak equivalence.",
      "id": "weakness-3",
      "locator": "Proposition 23, proof spanning eqs (compphi), (solpsi), (pullback-morphism)",
      "required_update": "Expand the D^2 = 0 argument: explicitly state why the joint kernel of CE(φ̃) and CE(ψ̃) is zero (presumably because (φ̃, ψ̃) embeds Sym̂((g×_m n)[1]) into Sym̂(g[1]) ⊕ Sym̂(n[1]) — or whatever the correct categorical statement is). Alternatively, verify the (n)-ary Jacobi identities directly from the explicit formula for π_1 ∘ l_n.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Proposition 23, proof spanning eqs (compphi), (solpsi), (pullback-morphism)` is corrected or justified.",
      "weakness_index": 2
    },
    {
      "evidence": "Follows from Proposition 15 (assumptions (a1),(a2)) and Lemma 13 (Γ fully faithful), combined with the observation that S(g_M) on U is the completed base change. The proof that 'S(g_M) is a sheaf of curved L_infty algebras over R_M' relies on the completion of base change being well-behaved, but the paper does not fully verify the sheaf condition for the multi-bracket structure — only the underlying module is checked.",
      "id": "weakness-4",
      "locator": "Proposition 18 with proof",
      "required_update": "Add a sentence justifying that the multi-bracket structure descends to a sheaf morphism (e.g., by R^♯-linearity and the strict-filtration property derived from finitely-generated projectivity).",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Proposition 18 with proof` is corrected or justified.",
      "weakness_index": 3
    }
  ],
  "strengths": [
    "The proof architecture reduces the geometric claim (L∞ spaces form a CFO) to an algebraic one (L∞ Alg(R_M)_fgp forms a CFO) via the fully faithful functor Γ, allowing each reduction step to be verified independently against established results in Getzler (2009, 2025) and Rogers (2020, 2023).",
    "The homotopy transfer theorem for curved L∞ algebras over filtered cdgas (Lemmas 43, 44) extends the Berglund–Getzler framework to a curved filtered setting, with intermediate lemmas (Lemmas 24, 26, 41) verified in detail via explicit combinatorial computations that are largely correct.",
    "Proposition 15 and Lemma 17 correctly establish that Ω̂_M satisfies the fineness and locally-free-kernel assumptions required by the abstract homotopy-theory machinery, using clean filtration arguments and a Nakayama-type reduction to the companion paper.",
    "Via the equivalence established in a companion paper, the CFO result extends immediately to transitive L∞ algebroids, demonstrating concrete downstream applicability in derived geometry beyond the paper's core setting."
  ],
  "summary": "The paper proves that L∞ spaces over a dg manifold form a category of fibrant objects (CFO), with supporting results including a fully faithful global sections functor (Proposition 18) and a homotopy transfer theorem for curved L∞ algebras over filtered cdgas (Proposition 44). The technical reviewer (confidence 0.70, overall_correctness: mostly_sound) identified two major gaps: Proposition 28 — on which Theorem 1 directly depends — is stated without proof, leaving three CFO axioms (2-out-of-3 for weak equivalences, terminal object existence, fibrancy of the terminal morphism) unverified; and no formal proof artifact is provided for any load-bearing categorical claim in a code-amenable field (math.AT/math.CT). The reproducibility specialist (confidence 0.86, score 0.22) independently corroborates both issues, rating the absence of a formal artifact for Theorem 1 as critical and identifying three further major concerns for the homotopy-transfer, global-sections, and companion-equivalence components. Two pipeline failures reduce overall review completeness and must not be attributed to the paper: (1) the novelty reviewer failed before producing a substantive assessment due to a schema validation error — the reported novelty_score of 0.0 and verdict 'marginal' are pipeline artifacts; (2) the citation specialist received the bibliography of a different manuscript — a CSCW/HCI paper about invisible work and AI in the workplace — rather than the mathematics paper reviewed by the other specialists; its bibliography findings and missing-reference suggestions are non-authoritative for this submission. Applying the code-amenable recommendation gate, both technical_correctness and reproducibility flagged missing proof-as-code artifacts at major and critical severity; because the missing Proposition 28 proof is load-bearing for the headline claim but the overall proof strategy is coherent and largely sound, major_revision is warranted rather than reject.",
  "weaknesses": [
    "Proposition 28 (L∞ Alg(R_M)_fgp is a CFO with a framing) is stated without proof; Theorem 1 depends on it, and three CFO axioms — 2-out-of-3 for weak equivalences, existence/uniqueness of the terminal object, and fibrancy of the terminal morphism — are neither proved nor cited for this specific subcategory.",
    "No formal verification artifact (Lean 4, Coq, or Agda) is provided for any load-bearing categorical claim, despite the paper's primary fields (math.AT, math.CT) being code-amenable and the main results being precisely the kind of universal-property checks and combinatorial-identity verifications that proof assistants handle well; the reproducibility score is 0.22 with a critical-severity concern for Theorem 1.",
    "The coherence argument for Proposition 23 (fiber product construction) contains an unjustified step: D^2 = 0 is concluded from D^2 lying in the joint kernel of CE(φ̃) and CE(ψ̃), but the triviality of that joint kernel is not established anywhere in the proof.",
    "Proposition 18 verifies the underlying R_M-module structure of the quasi-inverse S(g_M) but does not confirm that the multi-bracket structure descends to a sheaf morphism under completed base change."
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
      "description": "No code repository, license, pinned release, or machine-checkable proof artifact is provided for the headline theorem that L_infinity spaces over a dg manifold form a category of fibrant objects. A formal artifact such as proofs/LInfinitySpacesCFO.lean would close this gap.",
      "severity": "critical"
    },
    {
      "area": "code",
      "description": "The homotopy transfer results for curved L_infinity algebras over filtered cdgas, including the perturbation and transfer lemmas used in the main argument, are only supplied as prose mathematics. A proof artifact such as proofs/CurvedLInfinityHomotopyTransfer.lean would be needed for independent formal reproduction.",
      "severity": "major"
    },
    {
      "area": "code",
      "description": "The global sections, Serre-Swan, pullback, and fibration constructions that bridge L_infinity spaces to finitely generated projective curved L_infinity algebras are not accompanied by a formal proof artifact. A file such as proofs/GlobalSectionsAndCFO.lean would make these load-bearing reductions reproducible.",
      "severity": "major"
    },
    {
      "area": "code",
      "description": "The claimed consequence for transitive L_infinity algebroids depends on a companion paper result, but no linked formalization or version-pinned artifact is provided for that equivalence. A closure artifact such as proofs/CompanionEquivalence.lean would be needed to reproduce the corollary end to end.",
      "severity": "major"
    },
    {
      "area": "compute",
      "description": "No proof assistant, library versions, build manifest, or verification command is specified for checking the theoretical claims mechanically. A pinned environment file such as lean-toolchain plus lake-manifest.json would be needed if formal artifacts are supplied.",
      "severity": "minor"
    }
  ],
  "confidence": 0.86,
  "data_availability": "unspecified",
  "data_url": null,
  "environment": null,
  "reproducibility_score": 0.22
}
```

### summary (`claude-haiku-4-5-20251001`) — status: `pass`

```json
{
  "audience": "Mathematicians in differential geometry, homological algebra, and homotopy theory, particularly those working on derived manifolds and higher categorical structures.",
  "key_contributions": [
    "L∞ spaces over a dg manifold form a category of fibrant objects",
    "The global sections functor from L∞ spaces to finitely generated projective curved L∞ algebras is fully faithful",
    "Homotopy transfer theorem for curved L∞ algebras over filtered commutative differential graded algebras",
    "The functor Fib can be interpreted as a fibrant replacement functor that detects weak equivalences"
  ],
  "plain_language_summary": "This paper addresses a foundational question in derived geometry: whether certain infinite-dimensional algebraic structures support the axiomatic framework of homotopy theory. The main objects of study are L∞ spaces, which are sheaves of L∞ algebras (generalizations of Lie algebras) over differential graded manifolds—manifolds equipped with compatible algebraic structure.\n\nThe central result proves that L∞ spaces over dg manifolds form a category of fibrant objects, a framework from homological algebra that enables systematic study of objects up to weak equivalence. The proof translates the geometric problem into an algebraic one via the global sections functor, then applies homotopy transfer techniques from L∞ algebra theory, adapted to filtered commutative differential graded algebras. The paper establishes a generalized homotopy transfer theorem for curved L∞ algebras in this filtered setting.\n\nWhen combined with a companion paper establishing an equivalence between L∞ spaces and transitive L∞ algebroids, these results imply that the latter objects also form a category of fibrant objects. This solidifies the algebraic foundations for performing derived geometry and homotopy theory in this context.",
  "tldr": "The paper proves that infinite-dimensional Lie algebras over differential graded manifolds form a category of fibrant objects, providing a foundation for homotopy theory in this setting."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `pass`

```json
{
  "claims": [
    {
      "assessment": "partially_supported",
      "claim": "Theorem 1 (main result): L_infty spaces over a dg manifold form a category of fibrant objects (CFO).",
      "evidence": "The proof reduces the claim to Theorem 30 via Proposition 18 (Γ is fully faithful), Proposition 27 (simplicial frame), and Proposition 23 (pullbacks of fibrations). The derivations are largely self-contained and broadly consistent with prior treatments in Getzler (2009, 2025) and Rogers (2020, 2023). However: (a) the proof of Theorem 30 only verifies that the simplicial frame and pullback constructions preserve the subcategory L_infty Alg(R_M)_vec — it does not check that L_infty Alg(R_M)_fgp itself is a CFO independently (Proposition 28 is stated without proof); (b) for math.* / category-theoretic results, no executable formal proof artifact (Lean/Coq/Agda mathlib formalization) is provided despite the proof being a pure formal manipulation of categorical axioms.",
      "id": "C1",
      "location": "Introduction, Theorem 1; full proof assembled in Theorem 30 and Proposition 28",
      "severity": "major",
      "suggested_fix": "Provide a self-contained proof of Proposition 28 (or explicit reference to which intermediate results combine to give it). Ship a formalization of the CFO axiom check in Lean 4 / mathlib (e.g., src/formal/LInftyCFO.lean) verifying terminal object, pullback stability of (trivial) fibrations, and path-space factorization for L_infty Alg(R)_fgp."
    },
    {
      "assessment": "partially_supported",
      "claim": "Proposition 28: The category L_infty Alg(R_M)_fgp is a CFO with a framing.",
      "evidence": "The proposition is stated but no proof is given in the manuscript. Although the supporting Proposition 23 (pullbacks) and Proposition 27 (framing) are proved for the bigger class L_infty Alg(R)_fgp, the paper does not explicitly verify (i) the existence/uniqueness of the terminal object beyond a one-line assertion, (ii) the 2-out-of-3 property for weak equivalences, or (iii) that the terminal morphism is a fibration in this category.",
      "id": "C2",
      "location": "Proposition 28",
      "severity": "major",
      "suggested_fix": "Insert an explicit proof of Proposition 28 that verifies each CFO axiom (terminal object, 2-out-of-3, pullback stability, path-space factorization). Note specifically that 2-out-of-3 for weak equivalences is not obviously inherited from the associated graded picture."
    },
    {
      "assessment": "supported",
      "claim": "Proposition 15: The graded ringed space (M, Ω̂_M) satisfies assumptions (a1) and (a2) — Ω̂_M is fine and kernels of surjections of locally free Ω̂_M-modules of finite total rank are locally free.",
      "evidence": "The argument for fineness invokes the standard splitting of graded manifolds (Ω̂_M is a C^∞_M-module). The kernel argument uses Lemma 17 (every locally free Ω̂_M-module is induced from an O_M-module via completed base change) and the invertibility of id + s̃ ∘ (ρ - ρ̃_0) on the complete filtration, then reduces to Lemma 16 (companion paper, Proposition 2.6). The reduction is correct; the proof composition is sound.",
      "id": "C3",
      "location": "Proposition 15; proof using Lemmas 16, 17",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Lemma 17: Every locally free graded Ω̂_M-module of finite total rank is of the form Ω̂_M ⊗_{O_M} E for E a locally free O_M-module.",
      "evidence": "Standard splitting argument: split the filtration F^1 g ↪ g → Gr^0 g, use fineness to obtain a splitting ι, then check that the induced map Ω̂_M ⊗ E → g is locally an isomorphism using completeness of the filtration. The proof is a routine application of Nakayama-type arguments in the filtered setting and is correct as stated.",
      "id": "C4",
      "location": "Lemma 17, with proof",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Lemma 24: Every fibration in L_infty Alg(R)_fgp is strict up to isomorphism.",
      "evidence": "The proof constructs an explicit automorphism Ψ of Sym̂(g[1]) with Taylor coefficients Ψ_1 = id, Ψ_n = s ∘ φ_n (n ≠ 1). Invertibility holds because s ∘ φ_n raises the filtration and the symmetric algebra is complete. The computation (φ ∘ ψ)_n = φ_n is then a direct expansion of the composition formula. The derivation is correct.",
      "id": "C5",
      "location": "Lemma 24 with detailed proof",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Proposition 23: If φ: g → m is a fibration, the fiber product g ×_m n exists in L_infty Alg(R)_fgp; if φ is a trivial fibration, then φ̃ is also a trivial fibration.",
      "evidence": "The explicit construction of multi-brackets on k ⊕ n is given by characterization equations and the universal property is verified concretely. Coherence (D^2 = 0) is argued via 'D^2 lies in the kernels of both CE(φ̃) and CE(ψ̃), and hence must vanish' — but the claim that being in both kernels implies vanishing requires that CE(φ̃) and CE(ψ̃) have trivial common kernel, which is not justified. The graded computation for trivial fibrations correctly identifies H^•(Gr ψ̃_1) with projection, since H^•(Gr k) = 0 when φ is a weak equivalence.",
      "id": "C6",
      "location": "Proposition 23, proof spanning eqs (compphi), (solpsi), (pullback-morphism)",
      "severity": "minor",
      "suggested_fix": "Expand the D^2 = 0 argument: explicitly state why the joint kernel of CE(φ̃) and CE(ψ̃) is zero (presumably because (φ̃, ψ̃) embeds Sym̂((g×_m n)[1]) into Sym̂(g[1]) ⊕ Sym̂(n[1]) — or whatever the correct categorical statement is). Alternatively, verify the (n)-ary Jacobi identities directly from the explicit formula for π_1 ∘ l_n."
    },
    {
      "assessment": "supported",
      "claim": "Lemma 41 (Berglund's explicit formula for Green's operator): G|_{Sym^n(g[1])} = (1/n) Σ_ε C(n-1,|ε|)^{-1} (ip)^{ε_1} ⊗ ... ⊗ (ip)^{ε_n}.",
      "evidence": "The combinatorial verification reduces the identity [d,L_h] G = id^{⊗n} - (ip)^{⊗n} to showing that the coefficient c_|ε| vanishes for 0 < |ε| < n and equals 1, -1 at the boundary. The reduction uses the binomial identity (n-|ε|)/C(n-1,|ε|) = |ε|/C(n-1,|ε|-1), which is correct. Matches the formula in Berglund (2014, Proposition 5.1) as cited.",
      "id": "C7",
      "location": "Lemma 41, combinatorial proof",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Lemma 43 / Proposition 44 (homotopy transfer of curved L_infty algebras): the harmonization h induces, via HPT, a curved L_infty algebra structure on h ⊂ g and morphisms p_μ, i_μ which are weak equivalences.",
      "evidence": "The proof outline follows Berglund (2014) and Getzler (2025) and the key identities (h ⊗ h) Δ h = 0 etc., together with the perturbation lemma, are checked. The combinatorial identity (1/m) Σ_{ε_1=0} C(m-1,|ε|)^{-1} = 1 used to show (hμ)^k i p = (1/k!)(L_h μ)^k i p is correct (it telescopes to summing 1 over m-1 indices then dividing by m, which actually gives (m-1)/m, not 1 — see note). The remainder of the argument depends on this step and the broader HPT theorem.",
      "id": "C8",
      "location": "Lemmas 42, 43; Proposition 44",
      "severity": "minor",
      "suggested_fix": "Re-examine the combinatorial identity '(1/m) Σ_{ε_1=0} C(m-1,|ε|)^{-1} = 1': as written, Σ_{ε ∈ {0,1}^m, ε_1=0} C(m-1,|ε|)^{-1} = Σ_{r=0}^{m-1} C(m-1,r) C(m-1,r)^{-1} = m, giving (1/m)·m = 1 — verify carefully that the sum range is indeed |ε_1| = 0 with ε ∈ {0,1}^m (the subscript range of |ε| should be 0..m-1 since ε_1=0 fixes one coordinate). The computation as printed is correct but worth a single-line justification of why the sum has exactly m terms summing to 1."
    },
    {
      "assessment": "partially_supported",
      "claim": "Proposition 18: Γ: L_infty Sp(M) → L_infty Alg(R_M)_fgp is well-defined and fully faithful, with quasi-inverse S onto the essential image L_infty Alg(R_M)_vec.",
      "evidence": "Follows from Proposition 15 (assumptions (a1),(a2)) and Lemma 13 (Γ fully faithful), combined with the observation that S(g_M) on U is the completed base change. The proof that 'S(g_M) is a sheaf of curved L_infty algebras over R_M' relies on the completion of base change being well-behaved, but the paper does not fully verify the sheaf condition for the multi-bracket structure — only the underlying module is checked.",
      "id": "C9",
      "location": "Proposition 18 with proof",
      "severity": "minor",
      "suggested_fix": "Add a sentence justifying that the multi-bracket structure descends to a sheaf morphism (e.g., by R^♯-linearity and the strict-filtration property derived from finitely-generated projectivity)."
    },
    {
      "assessment": "unsupported",
      "claim": "Proof-as-code: For load-bearing categorical claims (Theorem 1, Proposition 14, Proposition 18, Proposition 27, Proposition 28, Theorem 30), no formal verification artifact (Lean/Coq/Agda) is provided.",
      "evidence": "The paper is in math.AT / math.CT (a code-amenable field per the proof-as-code axiom). The main results are abstract categorical statements whose verification reduces to checking finitely many universal-property diagrams and combinatorial identities — these are precisely the kinds of statements mathlib (Lean 4) is well-suited to formalize, and similar CFO/model-category results have been partially formalized (e.g., model-category-theory libraries). No accompanying artifact is provided.",
      "id": "C10",
      "location": "Throughout — no code repository or formal proof files are referenced or shipped",
      "severity": "major",
      "suggested_fix": "Ship a Lean 4 / mathlib formalization at, e.g., src/formal/LInftySpaces/CFO.lean covering: (i) the CFO axiom check for L_infty Alg(R)_fgp (Proposition 28), (ii) the pullback construction (Proposition 23), (iii) the simplicial frame construction (Proposition 27). Even partial formalization of the combinatorial identity in Lemma 41 (src/formal/HPT/Berglund.lean) and the Jacobi-identity coherence in Proposition 23 would substantially strengthen the manuscript."
    },
    {
      "assessment": "supported",
      "claim": "Footnote 1 / Remark 35: Dropping the axiom [h,r]=0 from the contraction definition modifies the strong-deformation-retract identity to id - ip = [d,h] - hrh, with the consequence that ([d,h] - hrh) is idempotent.",
      "evidence": "The computation [d,h]^2 = [d,h] + hrh (using hdh = h) and the algebraic verification ([d,h] - hrh)^2 = [d,h] - hrh are direct and correct.",
      "id": "C11",
      "location": "Remark 35, footnote prior",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Lemma 26: s_n ⊗ id defines a contraction of the curved L_infty algebra Ω_n ⊗̂ g over R.",
      "evidence": "The verification of the three contraction identities (h^2 = 0, hdh = h, [h,r] = 0) reduces to the corresponding identities for s_n (Lemma 25) and the fact that s_n ⊗ id annihilates 1 ⊗ l_0 because s_n(1) = 0 (since h^i_n(1) = 0). The R^♯-linearity is immediate. Argument is correct.",
      "id": "C12",
      "location": "Lemma 26 with proof",
      "severity": "info",
      "suggested_fix": null
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

