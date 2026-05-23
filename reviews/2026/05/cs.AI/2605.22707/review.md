# Beyond the Org Chart: AI and the Transformation of Invisible Work

GrokRxiv review of [arXiv:2605.22707](https://arxiv.org/abs/2605.22707) · `cs.AI`

_Authors_: Stephanie Rosenthal, Shamsi Iqbal

## TL;DR

This paper examines AI's effects on invisible workplace work through qualitative interviews with 24 professionals at a single large technology company, producing a seven-dimension taxonomy of affected informal practices. Two of five specialist agents failed (novelty, citation), leaving those dimensions unassessed; the meta-review is grounded in the summary, technical_correctness, and reproducibility specialists only. The technical_correctness specialist rated the paper 'mostly_sound' (confidence 0.72) but flagged one major issue: the headline claim that AI impacts invisible work 'as much or more than' visible work is unsupported by any direct comparison metric, resting instead on thematic interpretation of self-reports (C1). The reproducibility specialist (confidence 0.86, reproducibility_score 0.16) identified a critical data-unavailability concern—24 private transcripts with no stated access procedure—and four major methodological transparency gaps: no interview guide, no codebook, no inter-rater reliability statistic, and no analysis artifacts. The field (organizational HCI/CSCW) is outside the code-amenable set, so the proof-as-code gate does not apply, but the absence of qualitative methods transparency is nonetheless a serious barrier to credibility and replication. The paper addresses a timely and underexplored phenomenon and offers rich qualitative evidence for the productivity paradox framing; revision to strengthen methodological rigor and soften unsupported causal and comparative claims is warranted before publication.

_Recommendation_: **Major revision** · _Confidence_: 74%

## Strengths

- The seven-dimension taxonomy of AI-affected invisible work (cross-discipline communication, role clarity, situational awareness, reputation and accountability, personal growth and learning, instructional support and feedback, task support and collaboration) provides a concrete, empirically grounded organizing framework for future research on AI and informal workplace practices.
- The 'AI productivity paradox' framing—workers gaining individual capability while simultaneously losing peer feedback, mentoring, and professional networks—is a distinctive contribution supported by direct participant quotations across three professional roles.
- Participant diversity across designers, user researchers, and applied/data scientists within a single AI-forward organization strengthens internal breadth and reveals role-specific variation in how AI affects invisible work.
- Practical recommendations for organizational leaders, HR professionals, and AI companies are grounded in the thematic findings and address a gap between AI deployment practice and organizational well-being research.
- The paper explicitly grounds its analysis in organizational psychology and social support theory, extending the AI-in-workplace literature beyond productivity metrics to culture, well-being, and long-term workforce health.

## Weaknesses

- The headline claim that AI impacts invisible work 'as much or more than' visible work—the paper's primary thesis—is not supported by any quantitative comparison metric; the evidence is thematic interpretation of self-reports without effect sizes, time-allocation data, or any operationalization of 'as much or more' (C1, major).
- All 24 interview transcripts are private with no stated access procedure, yielding a reproducibility score of 0.16 and preventing independent verification of the central empirical claims; even anonymized coded excerpts are unavailable.
- The qualitative coding workflow is underspecified: no codebook, coding rubric, inter-rater reliability statistic, coder count, or audit trail mapping transcript evidence to the seven reported themes is provided, making the theme counts in Table 3 unverifiable.
- Participants are from a single anonymous technology company recruited via manager email with limited demographic data; organizational prescriptions in the Discussion are framed without consistently reattaching the single-site generalizability caveat acknowledged in Ethical Considerations (C10).
- Causal language is used throughout ('AI is enabling,' 'AI is changing,' 'AI is impacting') without a causal design; the cross-sectional self-report methodology supports participant-perceived associations, not causal inference (C12).
- No saturation analysis is provided to justify that N=24 is sufficient for the seven-theme taxonomy, and conceptual overlap between proximate themes (e.g., 'Project Situational Awareness' vs. 'Instructional Support and Feedback') is not formally addressed (C6).

## Revision Targets

- [ ] **Manuscript: Introduction (paragraph following the seven-dimension enumeration); Discussion and Conclusion**
  - Location: `corrections/2605.22707/paper.pdf` at `Introduction (paragraph following the seven-dimension enumeration); Discussion and Conclusion`
  - Evidence: This headline conclusion is drawn from N=24 semi-structured interviews at a single technology company, with no quantitative measurement comparing visible vs. invisible work impact. The paper offers only thematic interpretation of self-reports, not a direct comparison metric (e.g., effect sizes, time allocation, outcome differentials).
  - Required change: Soften to a qualitative, hypothesis-generating claim (e.g., 'AI's effects on invisible work appear comparable in scope to those on visible work within our sample'), or supplement with quantitative measurement (survey, time-use diary, or network analysis) that operationalizes 'as much or more'.
  - Verification: Re-review should confirm `Introduction (paragraph following the seven-dimension enumeration); Discussion and Conclusion` is corrected or justified.
- [ ] **Data availability and restricted inputs**
  - Location: data/reproducibility artifacts: `data availability and restricted inputs`
  - Evidence: The main empirical claims depend on 24 private interview transcripts from one large technology company, but the transcripts, anonymized excerpts corpus, survey responses, and coded dataset are not released or made available through a stated access procedure.
  - Required change: Add a frozen data snapshot or a reproducible data-access appendix covering price series, historical index membership, data URLs, licenses, and restricted Bloomberg access constraints.
  - Verification: Re-review should find data artifacts or access instructions sufficient to rebuild the reported tables.
- [ ] **Evaluation pipeline**
  - Location: `HAC/bootstrap` at `evaluation and statistical-testing pipeline`
  - Evidence: The qualitative analysis workflow is underspecified: no codebook, coding rubric, coder count, inter-rater reliability, audit trail, or complete mapping from transcript evidence to the seven reported themes is provided.
  - Required change: Publish evaluation scripts or executable pseudocode for walk-forward retraining, validation selection, HAC/bootstrap settings, benchmark construction, and table regeneration.
  - Verification: Re-review should confirm the evaluation pipeline can reproduce the reported statistical tests and benchmarks.
- [ ] **Manuscript: Abstract; Discussion and Conclusion**
  - Location: `corrections/2605.22707/paper.pdf` at `Abstract; Discussion and Conclusion`
  - Evidence: All participants are from a single large technology company, recruited via manager email, with no compensation and limited demographic data (only gender). The Ethical Considerations section appropriately acknowledges limited generalizability, but the Discussion's proposed organizational interventions are framed without consistently re-attaching that caveat.
  - Required change: In the Discussion, attach the single-site caveat to each prescriptive recommendation; ideally replicate with a multi-site sample before issuing organizational guidance.
  - Verification: Re-review should confirm `Abstract; Discussion and Conclusion` is corrected or justified.
- [ ] **Manuscript: Introduction; AI Transformation of Invisible Work; Discussion**
  - Location: `corrections/2605.22707/paper.pdf` at `Introduction; AI Transformation of Invisible Work; Discussion`
  - Evidence: These are framed causally but rest on cross-sectional self-report from a small qualitative sample without counterfactual comparison or longitudinal measurement. The data can support associations and perceived causation, not actual causal inference.
  - Required change: Replace causal verbs with associational/perception-based language (e.g., 'participants report that AI is enabling…', 'we observe an association between…'), or supplement with a comparative pre/post or matched-control design.
  - Verification: Re-review should confirm `Introduction; AI Transformation of Invisible Work; Discussion` is corrected or justified.
- [ ] **Manuscript: Table 3 and surrounding prose**
  - Location: `corrections/2605.22707/paper.pdf` at `Table 3 and surrounding prose`
  - Evidence: Counts are presented without any inter-rater or audit-trail evidence. The paper says the secondary review was conducted after >80% of interviews were complete; it is not specified whether both authors independently coded the transcripts or how disagreements were reconciled. Without a coding-reliability statistic (e.g., Cohen's kappa) or an explicit single-coder disclosure, the per-theme counts cannot be independently verified.
  - Required change: Report inter-coder reliability (or state explicitly that coding was performed by a single coder), describe the coding protocol, and share an anonymized codebook in supplementary material.
  - Verification: Re-review should confirm `Table 3 and surrounding prose` is corrected or justified.

## Open Questions

- How was thematic saturation assessed across the 24-interview sequence, and at what point did coding indicate that new themes were no longer emerging?
- What is the inter-rater reliability for the thematic coding (e.g., Cohen's kappa), and if a single coder performed primary coding, what member-checking or triangulation procedures were used to validate the themes?
- Can an anonymized subset of transcripts or a coded excerpts corpus be made available through a controlled access procedure (e.g., IRB-approved data request) to enable partial reproducibility of the seven-theme analysis?
- The headline claim of invisible work being affected 'as much or more than' visible work is the paper's primary thesis—how do the authors propose to operationalize or empirically bound this comparison in revision?
- How consistently did participants interpret 'invisible work'? Was a definition provided to participants during the interview, or was the concept inferred entirely during researcher coding?
- What distinguishes 'Project Situational Awareness' from 'Instructional Support and Feedback' in the coding scheme, and were any sub-codes reassigned between these themes during the secondary review?

## Per-Agent Reviews

### citation (`gemini-3-flash-preview`) — status: `warn`

```json
{
  "confidence": 0.0,
  "entries": [
    {
      "citation": {
        "arxiv_id": "2510.00762",
        "authors": [],
        "doi": null,
        "key": "ref1",
        "raw": "Abbas, T.; Rathore, S. A.; Turki, A.; Khan, S.; Alghushairy,\nO.; and Daud, A. 2025. Enhancing Software Engineering\nWith AI: Innovations, Challenges, and Future Directions.\nIET Software, 2025(1): 5691460.\nAlam, A. 2023. Harnessing the power of AI to create intelligent tutoring systems for enhanced classroom experience\nand improved learning outcomes. In Intelligent communication technologies and virtual mobile networks, 571–591.\nSpringer.\nAllen, T. J. 1977. Managing the flow of technology: technology transfer and the dissemination of technological information within the R and D organization. Massachusetts\nInstitute of Technology,Cambridge, MA.\nBakker, A. B.; and Demerouti, E. 2017. Job demands–\nresources theory: Taking stock and looking forward. Journal\nof occupational health psychology, 22(3): 273.\nBaksa, M.; and Branyiczki, I. 2023. Invisible Foundations of\nCollaboration in the Workplace: A Multiplex Network Approach to Advice Seeking and Knowledge Sharing. Central\nEuropean Business Review, 12(2).\nBarke, S.; James, M. B.; and Polikarpova, N. 2023.\nGrounded copilot: How programmers interact with codegenerating models. Proceedings of the ACM on Programming Languages, 7(OOPSLA1): 85–111.\nBhat, A.; Aubin Le Qu´er´e, M.; Naaman, M.; and Jakesch, M.\n2026. Reactive Writers: How Co-Writing with AI Changes\nHow We Engage with Ideas. In Proceedings of the 2026 CHI\nConference on Human Factors in Computing Systems, 1–21.\nBorgatti; and Cross. 2003. A Relational View of Information\nSeeking and Learning in Social Networks. 49.\nBrown, J. S.; and Duguid, P. 1991. Organizational Learning and Communities-of-Practice: Toward a Unified View of\nWorking, Learning, and Innovation. Organization Science,\n2(1): 40–57.\nBrynjolfsson, E.; Li, D.; and Raymond, L. 2025. Generative\nAI at work. The Quarterly Journal of Economics, 140(2):\n889–942.\nButler, J.; Suh, J.; Haniyur, S.; and Hadley, C. 2025. Dear\nDiary: A randomized controlled trial of Generative AI coding tools in the workplace. In 2025 IEEE/ACM 47th International Conference on Software Engineering: Software\nEngineering in Practice (ICSE-SEIP), 319–329. IEEE.\nCampbell, B. 2021. Alone Together: Why We Expect More\nfrom Technology and Less from Each Other. Journal of Interdisciplinary Studies, 33(1-2): 196–199.\nChang, P.-C.; Zhang, W.; Cai, Q.; and Guo, H. 2024. Does\nAI-driven technostress promote or hinder employees’ artificial intelligence adoption intention? A moderated mediation\nmodel of affective reactions and technical self-efficacy. Psychology Research and Behavior Management, 413–427.\nCheng, M.; Lee, C.; Khadpe, P.; Yu, S.; Han, D.; and Jurafsky, D. 2026. Sycophantic AI decreases prosocial intentions\nand promotes dependence. Science, 391(6792): eaec8352.\nChoudhuri, R.; Badea, C.; Bird, C.; Butler, J.; DeLine, R.;\nand Houck, B. 2025. AI Where It Matters: Where, Why,\nand How Developers Want AI Support in Daily Work. arXiv\npreprint arXiv:2510.00762.\nCohen, S.; and Wills, T. A. 1985. Stress, social support, and\nthe buffering hypothesis. Psychological bulletin, 98(2): 310.\nCranefield, J.; Yoong, P.; and Huff, S. L. 2015. Rethinking lurking: Invisible leading and following in a knowledge\ntransfer ecosystem. Journal of the Association for Information Systems, 16(4): 3.\nCross, R.; Borgatti, S. P.; and Parker, A. 2002. Making invisible work visible: Using social network analysis to support strategic collaboration. California management review,\n44(2): 25–46.\nCross, R. L.; and Parker, A. 2004. The hidden power of\nsocial networks: Understanding how work really gets done\nin organizations. Harvard Business Press.\nDaniels, A. K. 1987. Invisible Work. Social Problems,\n34(5): 403–415.\nDe Laat, M.; and Schreurs, B. 2013. Visualizing informal professional development networks: Building a case for\nlearning analytics in the workplace. American Behavioral\nScientist, 57(10): 1421–1438.\nDemerouti, E.; Bakker, A. B.; Nachreiner, F.; and Schaufeli,\nW. B. 2001. The job demands-resources model of burnout.\nJournal of Applied psychology, 86(3): 499.\nEhsan, U.; Passi, S.; Saha, K.; McNutt, T.; Riedl, M. O.; and\nAlcorn, S. 2026. From Future of Work to Future of Workers: Addressing Asymptomatic AI Harms to Foster Dignified Human-AI Interaction. In Proceedings of the 2026 CHI\nConference on Human Factors in Computing Systems, 1–21.\nFarmer, N. 2017. The invisible organization: How informal\nnetworks can lead organizational change. Routledge.\nFawzy, A.; Tahir, A.; and Blincoe, K. 2025. Vibe Coding in\nPractice: Motivations, Challenges, and a Future Outlook–a\nGrey Literature Review. arXiv preprint arXiv:2510.00328.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "transient_unknown via arxiv: status 429 Too Many Requests",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref2",
        "raw": "Fr¨og´eli, E.; Jenner, B.; and Gustavsson, P. 2023. Effectiveness of formal onboarding for facilitating organizational socialization: A systematic review. PloS one, 18(2): e0281823.\nGil-Garcia, J. R.; Guler, A.; Pardo, T. A.; and Burke, G. B.\n2019. Characterizing the importance of clarity of roles and\nresponsibilities in government inter-organizational collaboration and information sharing initiatives. Government Information Quarterly, 36(4): 101393.\nGoerisch, D.; Basiliere, J.; Rosener, A.; McKee, K.; Hunt,\nJ.; and Parker, T. M. 2019. Mentoring with: reimagining\nmentoring across the university. Gender, Place & Culture,\n26(12): 1740–1758.\nGranovetter, M. S. 1973. The Strength of Weak Ties. American Journal of Sociology, 78(6): 1360–1380.\nGunasekaran, T. S.; Lim, S.; Gupta, K.; Bai, H.; Pai, Y. S.;\nand Billinghurst, M. 2026. Cognitive Bridge: AI-Generated\nBoundary Objects for Cross-Functional Collaboration. In\nProceedings of the 2026 CHI Conference on Human Factors\nin Computing Systems, 1–35.\nHadley, C. N.; and Wright, S. L. 2024. We’re Still Lonely at\nWork. Harvard Business Review, 103(11-12): 68–77.\nHadley, C. N.; and Wright, S. L. 2026. Employees Are Relying on AI for Personal Support. That’s Risky. Harvard\nBusiness Review.\nHarris, J. I.; Winskowski, A. M.; and Engdahl, B. E. 2007.\nTypes of workplace social support in the prediction of job\nsatisfaction. The career development quarterly, 56(2): 150–",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1016/j.giq.2019.101393",
      "resolved_url": "https://doi.org/10.1016/j.giq.2019.101393"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref3",
        "raw": "Hatton, E. 2017. Mechanisms of invisibility: rethinking the\nconcept of invisible work. Work, employment and society,\n31(2): 336–351.\nHiggins, M. C.; and Kram, K. E. 2001. Reconceptualizing\nmentoring at work: A developmental network perspective.\nAcademy of management review, 26(2): 264–288.\nHohn, C.; and Loydl, K. 2026. Vibe Coding: intention instead of implementation: How UX professionals build, evaluate, and hand over functional prototypes with AI. i-com,\n(0).\nHouse, J.; and Kahn, R. 1985. Measures and concepts of\nsocial support. Cohen, S. Syme, S.L. (Eds.) Social support\nand health, 83–108.\nHouse, J. S. 1983. Work stress and social support. Addison-\nWesley series on occupational stress.\nKahn, W. A. 1990. Psychological conditions of personal\nengagement and disengagement at work. Academy of management journal, 33(4): 692–724.\nKommers, C.; Duede, E.; Gordon, J.; Holtzman, A.; Mc-\nNulty, T.; Stewart, S.; Thomas, L.; Jean So, R.; and Long,\nH. 2026. Why slop matters. ACM AI Letters, 1(1): 1–6.\nKrackhardt, D.; and Hanson, J. R. 1993. Informal networks.\nHarvard business review, 71(4): 104–111.\nKwon, H.; Oh, J.; Lee, S.; Lee, S.; and Lee, S. 2026. Investigating AI-induced Technostress and Coping Strategies of\nProfessionals. In Proceedings of the 2026 CHI Conference\non Human Factors in Computing Systems, 1–16.\nLaird, M. D.; Perryman, A. A.; Hochwarter, W. A.; Ferris,\nG. R.; and Zinko, R. 2009. The moderating effects of personal reputation on accountability-strain relationships. Journal of occupational health psychology, 14(1): 70.\nLi, C.; Zhang, Y.; Niu, X.; Chen, F.; and Zhou, H. 2023.\nDoes artificial intelligence promote or inhibit on-the-job\nlearning? Human reactions to AI at work. Systems, 11(3):",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "unverified via crossref_bibliographic: not verified by Crossref bibliographic search; no match above score threshold",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref4",
        "raw": "Mendel, T.; Mandal, S.; Nov, O.; and Wiesenfeld, B. M.\n2025. Who is Responsible, the Advisor or the AI? Understanding the Effects of Advisors Disclosing Their AI Use on\nTheir Perceived Responsibility and AI Reliance. Proc. ACM\nHum.-Comput. Interact., 9(7).\nMeske, C.; Hermanns, T.; Von der Weiden, E.; Loser, K.-U.;\nand Berger, T. 2025. Vibe coding as a reconfiguration of\nintent mediation in software development: Definition, implications, and research agenda. IEEE Access, 13: 213242–\n213259.\nMitschelen, A.; and Kauffeld, S. 2025. Workplace learning\nduring organizational onboarding: integrating formal, informal, and self-regulated workplace learning. Frontiers in Organizational Psychology, 3: 1569098.\nMoreland, R. L. 1996. Socially shared cognition at work\n: Transactive memory and group performance. What’s So\nSocial About Social Cognition? : Social Cognition Research\nin Small Groups, 57–84.\nNahar, N.; K¨astner, C.; Butler, J.; Parnin, C.; Zimmermann,\nT.; and Bird, C. 2025. Beyond the comfort zone: Emerging solutions to overcome challenges in integrating llms into\nsoftware products. In 2025 IEEE/ACM 47th International\nConference on Software Engineering: Software Engineering\nin Practice (ICSE-SEIP), 516–527. IEEE.\nNass, C.; and Moon, Y. 2000. Machines and mindlessness:\nSocial responses to computers. Journal of social issues,\n56(1): 81–103.\nNg, T. W.; and Sorensen, K. L. 2008. Toward a further understanding of the relationships between perceptions of support and work attitudes: A meta-analysis. Group & Organization Management, 33(3): 243–268.\nNiederhoffer, K.; Kellerman, G. R.; Lee, A.; Liebscher, A.;\nRapuano, K.; and Hancock, J. T. 2025. AI-generated “workslop” is destroying productivity. Harvard Business Review.\nNwana, H. S. 1990. Intelligent tutoring systems: an\noverview. Artificial Intelligence Review, 4(4): 251–277.\nOliveira, P.; Carvalho, J. M. S.; and Faria, S. 2025. AI Integration in Organisational Workflows: A Case Study on Job\nReconfiguration, Efficiency, and Workforce Adaptation. Information, 16(9).\nPark, Y. S.; Arvi, N. A. P.; Kim, S.; and Kim, J. 2026. Authorship Drift: How Self-Efficacy and Trust Evolve During\nLLM-Assisted Writing. In Proceedings of the 2026 CHI\nConference on Human Factors in Computing Systems, 1–18.\nPelau, C.; Dabija, D.-C.; and Ene, I. 2021. What makes an\nAI device human-like? The role of interaction quality, empathy and perceived psychological anthropomorphic characteristics in the acceptance of artificial intelligence in the service\nindustry. Computers in Human Behavior, 122: 106855.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "unverified via crossref_bibliographic: not verified by Crossref bibliographic search; no match above score threshold",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    },
    {
      "citation": {
        "arxiv_id": "2510.22780",
        "authors": [],
        "doi": null,
        "key": "ref5",
        "raw": "Pereira, V.; Hadjielias, E.; Christofi, M.; and Vrontis, D.\n2023. A systematic literature review on the impact of artificial intelligence on workplace outcomes: A multi-process\nperspective. Human Resource Management Review, 33(1):\n100857.\nPoquet, O.; and De Laat, M. 2021. Developing capabilities:\nLifelong learning in the age of AI. British Journal of Educational Technology, 52(4): 1695–1708.\nPost, C.; De Lia, E.; DiTomaso, N.; Tirpak, T. M.; and Borwankar, R. 2009. Capitalizing on thought diversity for innovation. Research-Technology Management, 52(6): 14–25.\nRanganathan, A.; and Ye, X. M. 2026. AI doesn’t reduce\nwork—it intensifies it. Harvard Bus. Rev.\nRanjit, J.; Zhou, K.; Swayamdipta, S.; and Quercia, D. 2026.\nAre We Automating the Joy Out of Work? Designing AI to\nAugment Work, Not Meaning. In Proceedings of the 2026\nCHI Conference on Human Factors in Computing Systems,\n1–46.\nReif, J. A.; Larrick, R. P.; and Soll, J. B. 2025. Evidence of\na social evaluation penalty for using AI. Proceedings of the\nNational Academy of Sciences, 122(19): e2426766122.\nSalas, E.; Prince, C.; Baker, D. P.; and Shrestha, L. 1995.\nSituation awareness in team performance: Implications for\nmeasurement and training. Human Factors, 37(1): 123–136.\nSzulanski, G. 1996. Exploring internal stickiness: Impediments to the transfer of best practice within the firm. Strategic Management Journal, 17(S2): 27–43.\nTime. 2023. How to end the unfairness of invisible work.\nVallance, C. 2023. AI could replace equivalent of 300 million jobs. BBC News.\nViswesvaran, C.; Sanchez, J. I.; and Fisher, J. 1999. The\nrole of social support in the process of work stress: A metaanalysis. Journal of vocational behavior, 54(2): 314–334.\nWang, D.; Waldman, D. A.; and Ashforth, B. E. 2019. Building relationships through accountability: An expanded idea\nof accountability. Organizational Psychology Review, 9(2-\n3): 184–206.\nWang, Z. Z.; Shao, Y.; Shaikh, O.; Fried, D.; Neubig, G.;\nand Yang, D. 2025. How Do AI Agents Do Human Work?\nComparing AI and Human Workflows Across Diverse Occupations. arXiv:2510.22780.\nWebster, J.; Brown, G.; Zweig, D.; Connelly, C. E.; Brodt,\nS.; and Sitkin, S. 2008. Beyond knowledge sharing: Withholding knowledge at work. Research in Personnel and Human Resources Management, 27: 1–37.\nWells, J. E.; and MacAulay, D. ???? What ’Invisible Work’\nLooks Like in the 21st Century.\nWolfe, D. A.; Choe, A.; and Kidd, F. 2025. The Architecture of AI Transformation: Four Strategic Patterns and an\nEmerging Frontier. arXiv preprint arXiv:2509.02853.\nWoodruff, A.; Shelby, R.; Kelley, P. G.; Rousso-Schindler,\nS.; Smith-Loud, J.; and Wilcox, L. 2024. How knowledge\nworkers think generative ai will (not) transform their industries. In Proceedings of the 2024 CHI Conference on Human\nFactors in Computing Systems, 1–26.\nZabbo, E. Feb 3 2026. Invisible labor at\nwork: what it is and how to address it.\nhttps://www.circles.com/resources/invisible-labor-atwork-what-it-is-and-how-to-address-it.\nZhang, S.; Zhang, T.; Cheng, J.; and Zhou, S. 2025a. Who\nis to Blame: A Comprehensive Review of Challenges and\nOpportunities in Designer-Developer Collaboration. Proceedings of the ACM on Human-Computer Interaction, 9(2):\n1–32.\nZhang, X.; De Pablos, P. O.; and Zhou, Z. 2013. Effect of\nknowledge sharing visibility on incentive-based relationship\nin Electronic Knowledge Management Systems: An empirical investigation. Computers in Human Behavior, 29(2):\n307–313.\nZhang, X.; Subramonyam, H.; Sarkar, A.; Drosos, I.; Wang,\nZ.; Lee, K.; Pimenova, V.; Chen, X.; and Lukoff, K.\n2026. Generative Design and Vibe Coding: Rethinking The\nDesign-Development Divide for UI Prototyping. In Proceedings of the Extended Abstracts of the 2026 CHI Conference on Human Factors in Computing Systems, 1–3.\nZhang, Y.; Zhao, D.; Hancock, J. T.; Kraut, R.; and Yang,\nD. 2025b. The rise of AI companions: how humanchatbot relationships influence well-being. arXiv preprint\narXiv:2506.12605.\nZhou, X.; Chen, C.; Li, W.; Yao, Y.; Cai, F.; Xu, J.; and Qin,\nX. 2025. How Do Coworkers Interpret Employee AI Usage:\nCoworkers’ Perceived Morality and Helping as Responses to\nEmployee AI Usage. Human Resource Management, 64(4):\n1077–1097.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": null,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "transient_unknown via arxiv: status 429 Too Many Requests",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": null
    }
  ],
  "missing_references": [],
  "summary": "Citation-use agent failed before producing a normal citation relevance review. Deterministic citation verification still runs separately; see external citation checks and verifier provenance for existence, DOI, URL, and resolver evidence. Failure: CliRunner parse/validate failure after corrective retry for role citation: first=not valid JSON: EOF while parsing a value at line 1 column 0; raw=\"\"; retry=not valid JSON: EOF while parsing a value at line 1 column 0; raw=\"\" Deterministic citation verifier checked 5 bibliography entries."
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.74,
  "questions": [
    "How was thematic saturation assessed across the 24-interview sequence, and at what point did coding indicate that new themes were no longer emerging?",
    "What is the inter-rater reliability for the thematic coding (e.g., Cohen's kappa), and if a single coder performed primary coding, what member-checking or triangulation procedures were used to validate the themes?",
    "Can an anonymized subset of transcripts or a coded excerpts corpus be made available through a controlled access procedure (e.g., IRB-approved data request) to enable partial reproducibility of the seven-theme analysis?",
    "The headline claim of invisible work being affected 'as much or more than' visible work is the paper's primary thesis—how do the authors propose to operationalize or empirically bound this comparison in revision?",
    "How consistently did participants interpret 'invisible work'? Was a definition provided to participants during the interview, or was the concept inferred entirely during researcher coding?",
    "What distinguishes 'Project Situational Awareness' from 'Instructional Support and Feedback' in the coding scheme, and were any sub-codes reassigned between these themes during the secondary review?"
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "This headline conclusion is drawn from N=24 semi-structured interviews at a single technology company, with no quantitative measurement comparing visible vs. invisible work impact. The paper offers only thematic interpretation of self-reports, not a direct comparison metric (e.g., effect sizes, time allocation, outcome differentials).",
      "id": "weakness-1",
      "locator": "Introduction (paragraph following the seven-dimension enumeration); Discussion and Conclusion",
      "required_update": "Soften to a qualitative, hypothesis-generating claim (e.g., 'AI's effects on invisible work appear comparable in scope to those on visible work within our sample'), or supplement with quantitative measurement (survey, time-use diary, or network analysis) that operationalizes 'as much or more'.",
      "source_path": "corrections/2605.22707/paper.pdf",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Introduction (paragraph following the seven-dimension enumeration); Discussion and Conclusion` is corrected or justified.",
      "weakness_index": 0
    },
    {
      "evidence": "The main empirical claims depend on 24 private interview transcripts from one large technology company, but the transcripts, anonymized excerpts corpus, survey responses, and coded dataset are not released or made available through a stated access procedure.",
      "id": "weakness-2",
      "locator": "data availability and restricted inputs",
      "required_update": "Add a frozen data snapshot or a reproducible data-access appendix covering price series, historical index membership, data URLs, licenses, and restricted Bloomberg access constraints.",
      "source_path": null,
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "data",
      "verification_check": "Re-review should find data artifacts or access instructions sufficient to rebuild the reported tables.",
      "weakness_index": 1
    },
    {
      "evidence": "The qualitative analysis workflow is underspecified: no codebook, coding rubric, coder count, inter-rater reliability, audit trail, or complete mapping from transcript evidence to the seven reported themes is provided.",
      "id": "weakness-3",
      "locator": "evaluation and statistical-testing pipeline",
      "required_update": "Publish evaluation scripts or executable pseudocode for walk-forward retraining, validation selection, HAC/bootstrap settings, benchmark construction, and table regeneration.",
      "source_path": "HAC/bootstrap",
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "code",
      "verification_check": "Re-review should confirm the evaluation pipeline can reproduce the reported statistical tests and benchmarks.",
      "weakness_index": 2
    },
    {
      "evidence": "All participants are from a single large technology company, recruited via manager email, with no compensation and limited demographic data (only gender). The Ethical Considerations section appropriately acknowledges limited generalizability, but the Discussion's proposed organizational interventions are framed without consistently re-attaching that caveat.",
      "id": "weakness-4",
      "locator": "Abstract; Discussion and Conclusion",
      "required_update": "In the Discussion, attach the single-site caveat to each prescriptive recommendation; ideally replicate with a multi-site sample before issuing organizational guidance.",
      "source_path": "corrections/2605.22707/paper.pdf",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Abstract; Discussion and Conclusion` is corrected or justified.",
      "weakness_index": 3
    },
    {
      "evidence": "These are framed causally but rest on cross-sectional self-report from a small qualitative sample without counterfactual comparison or longitudinal measurement. The data can support associations and perceived causation, not actual causal inference.",
      "id": "weakness-5",
      "locator": "Introduction; AI Transformation of Invisible Work; Discussion",
      "required_update": "Replace causal verbs with associational/perception-based language (e.g., 'participants report that AI is enabling…', 'we observe an association between…'), or supplement with a comparative pre/post or matched-control design.",
      "source_path": "corrections/2605.22707/paper.pdf",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Introduction; AI Transformation of Invisible Work; Discussion` is corrected or justified.",
      "weakness_index": 4
    },
    {
      "evidence": "Counts are presented without any inter-rater or audit-trail evidence. The paper says the secondary review was conducted after >80% of interviews were complete; it is not specified whether both authors independently coded the transcripts or how disagreements were reconciled. Without a coding-reliability statistic (e.g., Cohen's kappa) or an explicit single-coder disclosure, the per-theme counts cannot be independently verified.",
      "id": "weakness-6",
      "locator": "Table 3 and surrounding prose",
      "required_update": "Report inter-coder reliability (or state explicitly that coding was performed by a single coder), describe the coding protocol, and share an anonymized codebook in supplementary material.",
      "source_path": "corrections/2605.22707/paper.pdf",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Table 3 and surrounding prose` is corrected or justified.",
      "weakness_index": 5
    }
  ],
  "strengths": [
    "The seven-dimension taxonomy of AI-affected invisible work (cross-discipline communication, role clarity, situational awareness, reputation and accountability, personal growth and learning, instructional support and feedback, task support and collaboration) provides a concrete, empirically grounded organizing framework for future research on AI and informal workplace practices.",
    "The 'AI productivity paradox' framing—workers gaining individual capability while simultaneously losing peer feedback, mentoring, and professional networks—is a distinctive contribution supported by direct participant quotations across three professional roles.",
    "Participant diversity across designers, user researchers, and applied/data scientists within a single AI-forward organization strengthens internal breadth and reveals role-specific variation in how AI affects invisible work.",
    "Practical recommendations for organizational leaders, HR professionals, and AI companies are grounded in the thematic findings and address a gap between AI deployment practice and organizational well-being research.",
    "The paper explicitly grounds its analysis in organizational psychology and social support theory, extending the AI-in-workplace literature beyond productivity metrics to culture, well-being, and long-term workforce health."
  ],
  "summary": "This paper examines AI's effects on invisible workplace work through qualitative interviews with 24 professionals at a single large technology company, producing a seven-dimension taxonomy of affected informal practices. Two of five specialist agents failed (novelty, citation), leaving those dimensions unassessed; the meta-review is grounded in the summary, technical_correctness, and reproducibility specialists only. The technical_correctness specialist rated the paper 'mostly_sound' (confidence 0.72) but flagged one major issue: the headline claim that AI impacts invisible work 'as much or more than' visible work is unsupported by any direct comparison metric, resting instead on thematic interpretation of self-reports (C1). The reproducibility specialist (confidence 0.86, reproducibility_score 0.16) identified a critical data-unavailability concern—24 private transcripts with no stated access procedure—and four major methodological transparency gaps: no interview guide, no codebook, no inter-rater reliability statistic, and no analysis artifacts. The field (organizational HCI/CSCW) is outside the code-amenable set, so the proof-as-code gate does not apply, but the absence of qualitative methods transparency is nonetheless a serious barrier to credibility and replication. The paper addresses a timely and underexplored phenomenon and offers rich qualitative evidence for the productivity paradox framing; revision to strengthen methodological rigor and soften unsupported causal and comparative claims is warranted before publication.",
  "weaknesses": [
    "The headline claim that AI impacts invisible work 'as much or more than' visible work—the paper's primary thesis—is not supported by any quantitative comparison metric; the evidence is thematic interpretation of self-reports without effect sizes, time-allocation data, or any operationalization of 'as much or more' (C1, major).",
    "All 24 interview transcripts are private with no stated access procedure, yielding a reproducibility score of 0.16 and preventing independent verification of the central empirical claims; even anonymized coded excerpts are unavailable.",
    "The qualitative coding workflow is underspecified: no codebook, coding rubric, inter-rater reliability statistic, coder count, or audit trail mapping transcript evidence to the seven reported themes is provided, making the theme counts in Table 3 unverifiable.",
    "Participants are from a single anonymous technology company recruited via manager email with limited demographic data; organizational prescriptions in the Discussion are framed without consistently reattaching the single-site generalizability caveat acknowledged in Ethical Considerations (C10).",
    "Causal language is used throughout ('AI is enabling,' 'AI is changing,' 'AI is impacting') without a causal design; the cross-sectional self-report methodology supports participant-perceived associations, not causal inference (C12).",
    "No saturation analysis is provided to justify that N=24 is sufficient for the seven-theme taxonomy, and conceptual overlap between proximate themes (e.g., 'Project Situational Awareness' vs. 'Instructional Support and Feedback') is not formally addressed (C6)."
  ]
}
```

### novelty (`gemini-3-flash-preview`) — status: `fail`

```json
{
  "error": "CliRunner parse/validate failure after corrective retry for role novelty: first=not valid JSON: EOF while parsing a value at line 1 column 0; raw=\"\"; retry=not valid JSON: EOF while parsing a value at line 1 column 0; raw=\"\"",
  "role": "novelty",
  "status": "agent_failed"
}
```

### reproducibility (`gpt-5.5`) — status: `pass`

```json
{
  "code_availability": "unspecified",
  "code_url": null,
  "concerns": [
    {
      "area": "data",
      "description": "The main empirical claims depend on 24 private interview transcripts from one large technology company, but the transcripts, anonymized excerpts corpus, survey responses, and coded dataset are not released or made available through a stated access procedure.",
      "severity": "critical"
    },
    {
      "area": "evaluation",
      "description": "The paper describes broad interview topics but does not provide a full interview guide, recruitment materials, survey instrument, or consent script, making the data-collection protocol difficult to replicate exactly.",
      "severity": "major"
    },
    {
      "area": "evaluation",
      "description": "The qualitative analysis workflow is underspecified: no codebook, coding rubric, coder count, inter-rater reliability, audit trail, or complete mapping from transcript evidence to the seven reported themes is provided.",
      "severity": "major"
    },
    {
      "area": "code",
      "description": "No reproducible analysis artifact is provided for transcript tagging, theme extraction, or correlation searches; an artifact such as analysis/theme_coding_project.qda or analysis/theme_correlation_notebook.ipynb would be needed to rerun the analytic steps.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "The organizational setting and available AI tools are intentionally anonymized, so an independent replication may not be able to match the same workplace context, tool exposure, or participant population.",
      "severity": "major"
    },
    {
      "area": "data",
      "description": "The only checked external URL in the prompt, https://www.circles.com/resources/invisible-labor-atwork-what-it-is-and-how-to-address-it, is unreachable, though it appears to be a background reference rather than a dataset or code artifact.",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "The paper states that video-chat interviews used built-in AI transcription for 22 participants, but it does not name the transcription service, version, settings, or any qualitative-analysis software used after transcription.",
      "severity": "minor"
    }
  ],
  "confidence": 0.86,
  "data_availability": "private",
  "data_url": null,
  "environment": {
    "dependencies": [],
    "hardware": null,
    "software": "Video-chat interviews; built-in AI transcription for 22 of 24 participants and manual notes for transcription opt-outs; no named transcription service, version, or qualitative-analysis software."
  },
  "reproducibility_score": 0.16
}
```

### summary (`claude-haiku-4-5-20251001`) — status: `pass`

```json
{
  "audience": "Organizational leaders and HR professionals; researchers studying AI in organizations and workplace psychology; technology company employees navigating AI adoption; anyone concerned with how AI transforms workplace culture, mentoring systems, and employee well-being",
  "key_contributions": [
    "Empirical identification of seven specific dimensions of invisible work affected by AI adoption: cross-discipline communication, role clarity, situational awareness, reputation and accountability, personal growth and learning, instructional support and feedback, and task support and collaboration",
    "Evidence of an AI productivity paradox: workers gain individual independence and capability while simultaneously experiencing loss of peer feedback, mentoring, and professional networks critical for career growth",
    "Qualitative demonstration that AI substitution for human help increases worker social isolation and creates reliance on AI rather than colleagues, eroding informal support systems that are harder to measure than productivity gains",
    "Concrete recommendations for organizational leaders and AI companies to make invisible work visible, protect mentoring relationships, and design workplace norms that balance AI efficiency with human connection",
    "Grounding of AI workplace impact in organizational psychology and social support theory, extending discussion beyond productivity metrics to organizational culture, well-being, and long-term workforce health"
  ],
  "plain_language_summary": "This paper investigates how artificial intelligence is changing workplace practices beyond just improving productivity on visible tasks. Researchers interviewed 24 professionals at a large technology company about how AI has affected their daily work, collaboration, and career development. While AI tools make many tasks faster and easier—helping designers create prototypes, enabling workers to be more independent, and facilitating cross-disciplinary communication through better prototypes and documentation—the study reveals a troubling pattern: AI is replacing human interactions that were previously essential to professional growth and workplace culture.\n\nThe research identifies seven specific areas where AI changes invisible work (the behind-the-scenes mentoring, feedback, knowledge-sharing, and support that doesn't appear on official deliverables). Most concerning is the shift toward workers relying on AI for help instead of colleagues, leading to social isolation, weaker professional networks, reduced opportunities for feedback and mentoring, and a loss of institutional knowledge. Paradoxically, workers feel more capable and independent while simultaneously missing the human connection that has historically supported career advancement and well-being at work.\n\nThe paper argues that companies and leaders need to actively work to preserve and support the human interactions that AI is replacing. This includes creating systems to maintain visibility of invisible work, encouraging peer feedback despite AI availability, protecting mentoring relationships, and building organizational norms that value human connection alongside AI-driven efficiency. The challenge is not whether workers should use AI, but how to design workplaces that leverage AI's benefits while preserving the human support systems necessary for healthy, thriving organizations.",
  "tldr": "AI adoption in organizations is improving visible work productivity but simultaneously eroding invisible work like mentoring, feedback, and peer support that are critical for career development and organizational culture."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `warn`

```json
{
  "claims": [
    {
      "assessment": "partially_supported",
      "claim": "AI is impacting invisible work just as much or more than visible work.",
      "evidence": "This headline conclusion is drawn from N=24 semi-structured interviews at a single technology company, with no quantitative measurement comparing visible vs. invisible work impact. The paper offers only thematic interpretation of self-reports, not a direct comparison metric (e.g., effect sizes, time allocation, outcome differentials).",
      "id": "C1",
      "location": "Introduction (paragraph following the seven-dimension enumeration); Discussion and Conclusion",
      "severity": "major",
      "suggested_fix": "Soften to a qualitative, hypothesis-generating claim (e.g., 'AI's effects on invisible work appear comparable in scope to those on visible work within our sample'), or supplement with quantitative measurement (survey, time-use diary, or network analysis) that operationalizes 'as much or more'."
    },
    {
      "assessment": "partially_supported",
      "claim": "One recent study showed that agents could complete tasks ~90% faster than humans on the same set of 16 tasks (Wang et al. 2025).",
      "evidence": "Wang et al. 2025 (arXiv:2510.22780) is cited in the bibliography and the paraphrase is consistent in spirit with the cited title 'How Do AI Agents Do Human Work? Comparing AI and Human Workflows Across Diverse Occupations,' but the specific '~90%' speedup and '16 tasks' figures are not independently corroborated within the paper. Without direct access to the cited tables, the precise numbers cannot be confirmed.",
      "id": "C2",
      "location": "Introduction, paragraph beginning 'AI can significantly enhance worker performance'",
      "severity": "minor",
      "suggested_fix": "Add the table/figure reference from Wang et al. 2025 supporting the 90%/16-task numbers, or quote the original effect size verbatim with the page or section reference."
    },
    {
      "assessment": "partially_supported",
      "claim": "A large-scale study of over 5000 customer support specialists found that AI-assisted workers completed more tasks, delivered higher-quality outputs, and worked faster than those without AI assistance (Brynjolfsson, Li, and Raymond 2025).",
      "evidence": "The Brynjolfsson, Li, Raymond (2025) QJE paper studies AI assistance among customer service agents; the directional claim (more tasks, higher quality, faster) aligns with the paper's main findings. The 'over 5000' figure roughly matches the sample size, but the headline finding emphasizes productivity gains for less-experienced workers in particular—an important qualifier omitted here.",
      "id": "C3",
      "location": "Introduction, paragraph beginning 'AI can significantly enhance worker performance'",
      "severity": "info",
      "suggested_fix": "Add the qualifier that gains were concentrated among lower-skilled/novice workers, which is the headline result of that study."
    },
    {
      "assessment": "supported",
      "claim": "24 participants were recruited: 7 designers, 7 user researchers, and 10 applied/data scientists (Table 1).",
      "evidence": "Counts in Table 1 sum correctly (7+7+10=24) and are consistent with the prose ('24 product-focused individuals'). Gender breakdown also sums to 12 male / 11 female—however prose does not flag the 1-participant gender gap (24 total vs. 12+11=23 in Table 1's M/F columns).",
      "id": "C4",
      "location": "Research Methods / Participants; Table 1",
      "severity": "info",
      "suggested_fix": "Confirm whether Table 1 should sum to 24 by gender (it currently sums to 23: 4+4+5 male, 3+3+5 female); if there is a non-binary or undisclosed participant, state it explicitly."
    },
    {
      "assessment": "partially_supported",
      "claim": "Counts of participants who discussed each of the seven invisible-work themes are: Cross-Discipline Communication 14, Role Clarity & Division of Labor 14, Project Situational Awareness 14, Reputation and Accountability 13, Personal Growth and Learning 11, Instructional Support and Feedback 11, Task Support and Collaboration 10 (Table 3).",
      "evidence": "Counts are presented without any inter-rater or audit-trail evidence. The paper says the secondary review was conducted after >80% of interviews were complete; it is not specified whether both authors independently coded the transcripts or how disagreements were reconciled. Without a coding-reliability statistic (e.g., Cohen's kappa) or an explicit single-coder disclosure, the per-theme counts cannot be independently verified.",
      "id": "C5",
      "location": "Table 3 and surrounding prose",
      "severity": "minor",
      "suggested_fix": "Report inter-coder reliability (or state explicitly that coding was performed by a single coder), describe the coding protocol, and share an anonymized codebook in supplementary material."
    },
    {
      "assessment": "partially_supported",
      "claim": "The thematic analysis identified seven dimensions along which invisible work is changing, and these constitute the impact taxonomy presented.",
      "evidence": "Seven themes are clearly enumerated and each is illustrated with direct quotations from named participants, which is appropriate qualitative evidence. However, the paper offers no saturation analysis to justify completeness of the taxonomy at N=24, and several themes (e.g., 'Project Situational Awareness' vs. 'Instructional Support and Feedback') exhibit conceptual overlap that is not formally addressed.",
      "id": "C6",
      "location": "Introduction (numbered list 1–7); 'AI Transformation of Invisible Work' section",
      "severity": "minor",
      "suggested_fix": "Add a brief saturation discussion (e.g., when new themes stopped emerging) and a short paragraph on theme distinctness/overlap, or include a coding tree showing how sub-codes map to the seven top-level themes."
    },
    {
      "assessment": "partially_supported",
      "claim": "Nearly half of the papers published on AI in the workplace focus on learning and training (Pereira et al. 2023).",
      "evidence": "Pereira et al. 2023 is a systematic literature review in HRM Review; the framing in this paper paraphrases a single percentage from that review without citing the specific figure or table. The 'nearly half' claim is plausible but not precisely substantiated.",
      "id": "C7",
      "location": "Section 5 (Personal Growth and Learning)",
      "severity": "info",
      "suggested_fix": "Cite the exact percentage and table/figure from Pereira et al. 2023, or paraphrase more loosely (e.g., 'a substantial share')."
    },
    {
      "assessment": "partially_supported",
      "claim": "Workers' increasing use of AI for support is putting typical career growth opportunities—feedback from professional networks, leadership, and mentorship—at risk.",
      "evidence": "Supported within the sample by participant quotes indicating reduced peer interaction and substitution of AI for collegial help. However, the language 'at risk' implies a predicted longitudinal outcome that is not measured (no follow-up, no career outcomes data, no comparison cohort). It is a reasonable inference but not directly evidenced.",
      "id": "C8",
      "location": "Abstract; Introduction; Discussion",
      "severity": "minor",
      "suggested_fix": "Frame as a participant-perceived risk or hypothesis suitable for future longitudinal follow-up; avoid wording that implies measured career outcomes."
    },
    {
      "assessment": "partially_supported",
      "claim": "Methodological soundness of the thematic coding procedure (interviews coded by interviewer, secondary review performed after >80% of interviews were complete).",
      "evidence": "The procedure described—single interviewer cleaning, anonymizing, tagging, plus a secondary review—does not include inter-rater reliability, member-checking, or explicit triangulation. For thematic analysis in HCI, this is below current best practice when claims will be generalized.",
      "id": "C9",
      "location": "Research Methods / Transcript Analysis",
      "severity": "minor",
      "suggested_fix": "Add inter-rater agreement (or explicitly justify single-coder analysis), describe how coding disagreements were resolved if multiple coders participated, and disclose tool-assisted coding (if used)."
    },
    {
      "assessment": "partially_supported",
      "claim": "Findings generalize to AI-forward technology firms; the paper proposes design implications for 'AI companies, individuals, and leaders'.",
      "evidence": "All participants are from a single large technology company, recruited via manager email, with no compensation and limited demographic data (only gender). The Ethical Considerations section appropriately acknowledges limited generalizability, but the Discussion's proposed organizational interventions are framed without consistently re-attaching that caveat.",
      "id": "C10",
      "location": "Abstract; Discussion and Conclusion",
      "severity": "minor",
      "suggested_fix": "In the Discussion, attach the single-site caveat to each prescriptive recommendation; ideally replicate with a multi-site sample before issuing organizational guidance."
    },
    {
      "assessment": "partially_supported",
      "claim": "Interviews were transcribed live but not recorded (with 22 of 24 participants agreeing to AI transcription).",
      "evidence": "The paper states transcripts were 'live but not recorded,' implying no audio retention. With AI-assisted transcription and live note-taking, transcript fidelity (verbatimness, omissions) is unverified. Quoted excerpts appear cleaned; the rules used to lightly edit quotes for readability are not described.",
      "id": "C11",
      "location": "Data Collection; Ethical Considerations",
      "severity": "minor",
      "suggested_fix": "State the transcript editing policy (e.g., whether filler words/disfluencies were removed) and acknowledge fidelity constraints introduced by live, non-recorded transcription."
    },
    {
      "assessment": "partially_supported",
      "claim": "Causal phrasings such as 'AI is enabling new broader skill sets,' 'AI is changing the language of communication,' and 'AI is impacting workers' abilities to find help' (used throughout).",
      "evidence": "These are framed causally but rest on cross-sectional self-report from a small qualitative sample without counterfactual comparison or longitudinal measurement. The data can support associations and perceived causation, not actual causal inference.",
      "id": "C12",
      "location": "Introduction; AI Transformation of Invisible Work; Discussion",
      "severity": "minor",
      "suggested_fix": "Replace causal verbs with associational/perception-based language (e.g., 'participants report that AI is enabling…', 'we observe an association between…'), or supplement with a comparative pre/post or matched-control design."
    },
    {
      "assessment": "partially_supported",
      "claim": "The paper's count of 24 participants with the gender breakdown reported in Table 1 (Male: 4+4+5=13; Female: 3+3+5=11).",
      "evidence": "Table 1 row totals for Male (4,4,5) and Female (3,3,5) sum to 13 and 11 respectively, totaling 24, which matches the N. However, the per-profession 'Total' column (7, 7, 10) correctly sums to 24 only if all participants are reported as male or female; this is consistent but underscores the absence of any non-binary disclosure or 'prefer not to say' option.",
      "id": "C13",
      "location": "Table 1",
      "severity": "minor",
      "suggested_fix": "Add a brief footnote clarifying gender options offered and whether non-binary identification was possible; even reporting that all self-identified as male/female is informative."
    },
    {
      "assessment": "partially_supported",
      "claim": "AI sycophancy 'has been shown to be harmful to judgments and decision-making (Cheng et al. 2026).'",
      "evidence": "Cheng et al. 2026 is cited and the paraphrase aligns with that paper's framing (Science article on sycophantic AI). The paraphrase is directionally faithful but compresses a specific empirical finding into a strong general statement.",
      "id": "C14",
      "location": "Section 7 (Task Support and Collaboration)",
      "severity": "info",
      "suggested_fix": "Add the specific mechanism reported by Cheng et al. (e.g., 'decreases prosocial intentions and promotes dependence') rather than a broader 'harmful to judgments' phrasing."
    },
    {
      "assessment": "supported",
      "claim": "Themes around institutional knowledge and help/feedback 'emerged later in our review,' implying the analytic approach was inductive and iterative rather than pre-registered.",
      "evidence": "The text explicitly describes a two-pass coding process with later-emerging themes, which is consistent with reflexive thematic analysis. There is no claim of pre-registration; the inductive framing is internally consistent.",
      "id": "C15",
      "location": "Transcript Analysis",
      "severity": "info",
      "suggested_fix": null
    }
  ],
  "confidence": 0.72,
  "overall_correctness": "mostly_sound"
}
```

## Corrections

<!-- corrections-section: rendered from corrections table; empty on first publish -->
_No corrections have been recorded._

## Bibliography

1. Abbas, T.; Rathore, S. A.; Turki, A.; Khan, S.; Alghushairy,
O.; and Daud, A. 2025. Enhancing Software Engineering
With AI: Innovations, Challenges, and Future Directions.
IET Software, 2025(1): 5691460.
Alam, A. 2023. Harnessing the power of AI to create intelligent tutoring systems for enhanced classroom experience
and improved learning outcomes. In Intelligent communication technologies and virtual mobile networks, 571–591.
Springer.
Allen, T. J. 1977. Managing the flow of technology: technology transfer and the dissemination of technological information within the R and D organization. Massachusetts
Institute of Technology,Cambridge, MA.
Bakker, A. B.; and Demerouti, E. 2017. Job demands–
resources theory: Taking stock and looking forward. Journal
of occupational health psychology, 22(3): 273.
Baksa, M.; and Branyiczki, I. 2023. Invisible Foundations of
Collaboration in the Workplace: A Multiplex Network Approach to Advice Seeking and Knowledge Sharing. Central
European Business Review, 12(2).
Barke, S.; James, M. B.; and Polikarpova, N. 2023.
Grounded copilot: How programmers interact with codegenerating models. Proceedings of the ACM on Programming Languages, 7(OOPSLA1): 85–111.
Bhat, A.; Aubin Le Qu´er´e, M.; Naaman, M.; and Jakesch, M.
2026. Reactive Writers: How Co-Writing with AI Changes
How We Engage with Ideas. In Proceedings of the 2026 CHI
Conference on Human Factors in Computing Systems, 1–21.
Borgatti; and Cross. 2003. A Relational View of Information
Seeking and Learning in Social Networks. 49.
Brown, J. S.; and Duguid, P. 1991. Organizational Learning and Communities-of-Practice: Toward a Unified View of
Working, Learning, and Innovation. Organization Science,
2(1): 40–57.
Brynjolfsson, E.; Li, D.; and Raymond, L. 2025. Generative
AI at work. The Quarterly Journal of Economics, 140(2):
889–942.
Butler, J.; Suh, J.; Haniyur, S.; and Hadley, C. 2025. Dear
Diary: A randomized controlled trial of Generative AI coding tools in the workplace. In 2025 IEEE/ACM 47th International Conference on Software Engineering: Software
Engineering in Practice (ICSE-SEIP), 319–329. IEEE.
Campbell, B. 2021. Alone Together: Why We Expect More
from Technology and Less from Each Other. Journal of Interdisciplinary Studies, 33(1-2): 196–199.
Chang, P.-C.; Zhang, W.; Cai, Q.; and Guo, H. 2024. Does
AI-driven technostress promote or hinder employees’ artificial intelligence adoption intention? A moderated mediation
model of affective reactions and technical self-efficacy. Psychology Research and Behavior Management, 413–427.
Cheng, M.; Lee, C.; Khadpe, P.; Yu, S.; Han, D.; and Jurafsky, D. 2026. Sycophantic AI decreases prosocial intentions
and promotes dependence. Science, 391(6792): eaec8352.
Choudhuri, R.; Badea, C.; Bird, C.; Butler, J.; DeLine, R.;
and Houck, B. 2025. AI Where It Matters: Where, Why,
and How Developers Want AI Support in Daily Work. arXiv
preprint arXiv:2510.00762.
Cohen, S.; and Wills, T. A. 1985. Stress, social support, and
the buffering hypothesis. Psychological bulletin, 98(2): 310.
Cranefield, J.; Yoong, P.; and Huff, S. L. 2015. Rethinking lurking: Invisible leading and following in a knowledge
transfer ecosystem. Journal of the Association for Information Systems, 16(4): 3.
Cross, R.; Borgatti, S. P.; and Parker, A. 2002. Making invisible work visible: Using social network analysis to support strategic collaboration. California management review,
44(2): 25–46.
Cross, R. L.; and Parker, A. 2004. The hidden power of
social networks: Understanding how work really gets done
in organizations. Harvard Business Press.
Daniels, A. K. 1987. Invisible Work. Social Problems,
34(5): 403–415.
De Laat, M.; and Schreurs, B. 2013. Visualizing informal professional development networks: Building a case for
learning analytics in the workplace. American Behavioral
Scientist, 57(10): 1421–1438.
Demerouti, E.; Bakker, A. B.; Nachreiner, F.; and Schaufeli,
W. B. 2001. The job demands-resources model of burnout.
Journal of Applied psychology, 86(3): 499.
Ehsan, U.; Passi, S.; Saha, K.; McNutt, T.; Riedl, M. O.; and
Alcorn, S. 2026. From Future of Work to Future of Workers: Addressing Asymptomatic AI Harms to Foster Dignified Human-AI Interaction. In Proceedings of the 2026 CHI
Conference on Human Factors in Computing Systems, 1–21.
Farmer, N. 2017. The invisible organization: How informal
networks can lead organizational change. Routledge.
Fawzy, A.; Tahir, A.; and Blincoe, K. 2025. Vibe Coding in
Practice: Motivations, Challenges, and a Future Outlook–a
Grey Literature Review. arXiv preprint arXiv:2510.00328. arXiv:[2510.00762](https://arxiv.org/abs/2510.00762)
2. Fr¨og´eli, E.; Jenner, B.; and Gustavsson, P. 2023. Effectiveness of formal onboarding for facilitating organizational socialization: A systematic review. PloS one, 18(2): e0281823.
Gil-Garcia, J. R.; Guler, A.; Pardo, T. A.; and Burke, G. B.
2019. Characterizing the importance of clarity of roles and
responsibilities in government inter-organizational collaboration and information sharing initiatives. Government Information Quarterly, 36(4): 101393.
Goerisch, D.; Basiliere, J.; Rosener, A.; McKee, K.; Hunt,
J.; and Parker, T. M. 2019. Mentoring with: reimagining
mentoring across the university. Gender, Place & Culture,
26(12): 1740–1758.
Granovetter, M. S. 1973. The Strength of Weak Ties. American Journal of Sociology, 78(6): 1360–1380.
Gunasekaran, T. S.; Lim, S.; Gupta, K.; Bai, H.; Pai, Y. S.;
and Billinghurst, M. 2026. Cognitive Bridge: AI-Generated
Boundary Objects for Cross-Functional Collaboration. In
Proceedings of the 2026 CHI Conference on Human Factors
in Computing Systems, 1–35.
Hadley, C. N.; and Wright, S. L. 2024. We’re Still Lonely at
Work. Harvard Business Review, 103(11-12): 68–77.
Hadley, C. N.; and Wright, S. L. 2026. Employees Are Relying on AI for Personal Support. That’s Risky. Harvard
Business Review.
Harris, J. I.; Winskowski, A. M.; and Engdahl, B. E. 2007.
Types of workplace social support in the prediction of job
satisfaction. The career development quarterly, 56(2): 150–
3. Hatton, E. 2017. Mechanisms of invisibility: rethinking the
concept of invisible work. Work, employment and society,
31(2): 336–351.
Higgins, M. C.; and Kram, K. E. 2001. Reconceptualizing
mentoring at work: A developmental network perspective.
Academy of management review, 26(2): 264–288.
Hohn, C.; and Loydl, K. 2026. Vibe Coding: intention instead of implementation: How UX professionals build, evaluate, and hand over functional prototypes with AI. i-com,
(0).
House, J.; and Kahn, R. 1985. Measures and concepts of
social support. Cohen, S. Syme, S.L. (Eds.) Social support
and health, 83–108.
House, J. S. 1983. Work stress and social support. Addison-
Wesley series on occupational stress.
Kahn, W. A. 1990. Psychological conditions of personal
engagement and disengagement at work. Academy of management journal, 33(4): 692–724.
Kommers, C.; Duede, E.; Gordon, J.; Holtzman, A.; Mc-
Nulty, T.; Stewart, S.; Thomas, L.; Jean So, R.; and Long,
H. 2026. Why slop matters. ACM AI Letters, 1(1): 1–6.
Krackhardt, D.; and Hanson, J. R. 1993. Informal networks.
Harvard business review, 71(4): 104–111.
Kwon, H.; Oh, J.; Lee, S.; Lee, S.; and Lee, S. 2026. Investigating AI-induced Technostress and Coping Strategies of
Professionals. In Proceedings of the 2026 CHI Conference
on Human Factors in Computing Systems, 1–16.
Laird, M. D.; Perryman, A. A.; Hochwarter, W. A.; Ferris,
G. R.; and Zinko, R. 2009. The moderating effects of personal reputation on accountability-strain relationships. Journal of occupational health psychology, 14(1): 70.
Li, C.; Zhang, Y.; Niu, X.; Chen, F.; and Zhou, H. 2023.
Does artificial intelligence promote or inhibit on-the-job
learning? Human reactions to AI at work. Systems, 11(3):
4. Mendel, T.; Mandal, S.; Nov, O.; and Wiesenfeld, B. M.
2025. Who is Responsible, the Advisor or the AI? Understanding the Effects of Advisors Disclosing Their AI Use on
Their Perceived Responsibility and AI Reliance. Proc. ACM
Hum.-Comput. Interact., 9(7).
Meske, C.; Hermanns, T.; Von der Weiden, E.; Loser, K.-U.;
and Berger, T. 2025. Vibe coding as a reconfiguration of
intent mediation in software development: Definition, implications, and research agenda. IEEE Access, 13: 213242–
213259.
Mitschelen, A.; and Kauffeld, S. 2025. Workplace learning
during organizational onboarding: integrating formal, informal, and self-regulated workplace learning. Frontiers in Organizational Psychology, 3: 1569098.
Moreland, R. L. 1996. Socially shared cognition at work
: Transactive memory and group performance. What’s So
Social About Social Cognition? : Social Cognition Research
in Small Groups, 57–84.
Nahar, N.; K¨astner, C.; Butler, J.; Parnin, C.; Zimmermann,
T.; and Bird, C. 2025. Beyond the comfort zone: Emerging solutions to overcome challenges in integrating llms into
software products. In 2025 IEEE/ACM 47th International
Conference on Software Engineering: Software Engineering
in Practice (ICSE-SEIP), 516–527. IEEE.
Nass, C.; and Moon, Y. 2000. Machines and mindlessness:
Social responses to computers. Journal of social issues,
56(1): 81–103.
Ng, T. W.; and Sorensen, K. L. 2008. Toward a further understanding of the relationships between perceptions of support and work attitudes: A meta-analysis. Group & Organization Management, 33(3): 243–268.
Niederhoffer, K.; Kellerman, G. R.; Lee, A.; Liebscher, A.;
Rapuano, K.; and Hancock, J. T. 2025. AI-generated “workslop” is destroying productivity. Harvard Business Review.
Nwana, H. S. 1990. Intelligent tutoring systems: an
overview. Artificial Intelligence Review, 4(4): 251–277.
Oliveira, P.; Carvalho, J. M. S.; and Faria, S. 2025. AI Integration in Organisational Workflows: A Case Study on Job
Reconfiguration, Efficiency, and Workforce Adaptation. Information, 16(9).
Park, Y. S.; Arvi, N. A. P.; Kim, S.; and Kim, J. 2026. Authorship Drift: How Self-Efficacy and Trust Evolve During
LLM-Assisted Writing. In Proceedings of the 2026 CHI
Conference on Human Factors in Computing Systems, 1–18.
Pelau, C.; Dabija, D.-C.; and Ene, I. 2021. What makes an
AI device human-like? The role of interaction quality, empathy and perceived psychological anthropomorphic characteristics in the acceptance of artificial intelligence in the service
industry. Computers in Human Behavior, 122: 106855.
5. Pereira, V.; Hadjielias, E.; Christofi, M.; and Vrontis, D.
2023. A systematic literature review on the impact of artificial intelligence on workplace outcomes: A multi-process
perspective. Human Resource Management Review, 33(1):
100857.
Poquet, O.; and De Laat, M. 2021. Developing capabilities:
Lifelong learning in the age of AI. British Journal of Educational Technology, 52(4): 1695–1708.
Post, C.; De Lia, E.; DiTomaso, N.; Tirpak, T. M.; and Borwankar, R. 2009. Capitalizing on thought diversity for innovation. Research-Technology Management, 52(6): 14–25.
Ranganathan, A.; and Ye, X. M. 2026. AI doesn’t reduce
work—it intensifies it. Harvard Bus. Rev.
Ranjit, J.; Zhou, K.; Swayamdipta, S.; and Quercia, D. 2026.
Are We Automating the Joy Out of Work? Designing AI to
Augment Work, Not Meaning. In Proceedings of the 2026
CHI Conference on Human Factors in Computing Systems,
1–46.
Reif, J. A.; Larrick, R. P.; and Soll, J. B. 2025. Evidence of
a social evaluation penalty for using AI. Proceedings of the
National Academy of Sciences, 122(19): e2426766122.
Salas, E.; Prince, C.; Baker, D. P.; and Shrestha, L. 1995.
Situation awareness in team performance: Implications for
measurement and training. Human Factors, 37(1): 123–136.
Szulanski, G. 1996. Exploring internal stickiness: Impediments to the transfer of best practice within the firm. Strategic Management Journal, 17(S2): 27–43.
Time. 2023. How to end the unfairness of invisible work.
Vallance, C. 2023. AI could replace equivalent of 300 million jobs. BBC News.
Viswesvaran, C.; Sanchez, J. I.; and Fisher, J. 1999. The
role of social support in the process of work stress: A metaanalysis. Journal of vocational behavior, 54(2): 314–334.
Wang, D.; Waldman, D. A.; and Ashforth, B. E. 2019. Building relationships through accountability: An expanded idea
of accountability. Organizational Psychology Review, 9(2-
3): 184–206.
Wang, Z. Z.; Shao, Y.; Shaikh, O.; Fried, D.; Neubig, G.;
and Yang, D. 2025. How Do AI Agents Do Human Work?
Comparing AI and Human Workflows Across Diverse Occupations. arXiv:2510.22780.
Webster, J.; Brown, G.; Zweig, D.; Connelly, C. E.; Brodt,
S.; and Sitkin, S. 2008. Beyond knowledge sharing: Withholding knowledge at work. Research in Personnel and Human Resources Management, 27: 1–37.
Wells, J. E.; and MacAulay, D. ???? What ’Invisible Work’
Looks Like in the 21st Century.
Wolfe, D. A.; Choe, A.; and Kidd, F. 2025. The Architecture of AI Transformation: Four Strategic Patterns and an
Emerging Frontier. arXiv preprint arXiv:2509.02853.
Woodruff, A.; Shelby, R.; Kelley, P. G.; Rousso-Schindler,
S.; Smith-Loud, J.; and Wilcox, L. 2024. How knowledge
workers think generative ai will (not) transform their industries. In Proceedings of the 2024 CHI Conference on Human
Factors in Computing Systems, 1–26.
Zabbo, E. Feb 3 2026. Invisible labor at
work: what it is and how to address it.
https://www.circles.com/resources/invisible-labor-atwork-what-it-is-and-how-to-address-it.
Zhang, S.; Zhang, T.; Cheng, J.; and Zhou, S. 2025a. Who
is to Blame: A Comprehensive Review of Challenges and
Opportunities in Designer-Developer Collaboration. Proceedings of the ACM on Human-Computer Interaction, 9(2):
1–32.
Zhang, X.; De Pablos, P. O.; and Zhou, Z. 2013. Effect of
knowledge sharing visibility on incentive-based relationship
in Electronic Knowledge Management Systems: An empirical investigation. Computers in Human Behavior, 29(2):
307–313.
Zhang, X.; Subramonyam, H.; Sarkar, A.; Drosos, I.; Wang,
Z.; Lee, K.; Pimenova, V.; Chen, X.; and Lukoff, K.
2026. Generative Design and Vibe Coding: Rethinking The
Design-Development Divide for UI Prototyping. In Proceedings of the Extended Abstracts of the 2026 CHI Conference on Human Factors in Computing Systems, 1–3.
Zhang, Y.; Zhao, D.; Hancock, J. T.; Kraut, R.; and Yang,
D. 2025b. The rise of AI companions: how humanchatbot relationships influence well-being. arXiv preprint
arXiv:2506.12605.
Zhou, X.; Chen, C.; Li, W.; Yao, Y.; Cai, F.; Xu, J.; and Qin,
X. 2025. How Do Coworkers Interpret Employee AI Usage:
Coworkers’ Perceived Morality and Helping as Responses to
Employee AI Usage. Human Resource Management, 64(4):
1077–1097. arXiv:[2510.22780](https://arxiv.org/abs/2510.22780)

