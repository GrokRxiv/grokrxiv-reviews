# Beyond the Org Chart: AI and the Transformation of Invisible Work

GrokRxiv review of [arXiv:2605.22707](https://arxiv.org/abs/2605.22707) · `cs.AI`

_Authors_: Stephanie Rosenthal, Shamsi Iqbal

## TL;DR

This qualitative HCI study examines how AI tools are reshaping invisible and informal work — mentoring, peer feedback, cross-discipline collaboration, and professional networking — among 24 product professionals at a single large AI-first technology firm. The paper's seven-dimension taxonomy of AI impacts on invisible work is conceptually motivated and grounded in participant quotes, and the core observation (AI boosts individual autonomy while eroding relational infrastructure) is timely and practically significant. Two specialist reviewers (citation, novelty) failed due to API quota exhaustion and cannot contribute substantive findings; citation integrity and novelty positioning are therefore unassessed in this review cycle. The two available technical reviewers (technical_correctness confidence 0.70, reproducibility confidence 0.84) converge on a shared critical gap: the thematic analysis relies on a single coder with no reported inter-rater reliability statistic (C2, major; reproducibility evaluation concern, major), and no supplementary materials — interview protocol, codebook, reliability worksheet, or de-identified frequency table — are provided (C8, major; reproducibility code and other concerns, major). Under the recommendation gate for field cs.HC (code-amenable), the missing proof-as-code artifacts at major severity require a major_revision default. The paper's descriptive and practical contributions are real, but the methodological documentation must be substantially strengthened before findings can be evaluated at current CHI/CSCW standards. Causal language throughout the manuscript overstates what a single-time-point, single-firm, retrospective design can support, and the Discussion's industry-wide prescriptions exceed the evidential scope of a one-firm sample.

_Recommendation_: **Major revision** · _Confidence_: 65%

## Strengths

- The seven-dimension taxonomy (Cross-Discipline Communication, Role Clarity and Division of Labor, Project Situational Awareness, Reputation and Accountability, Personal Growth and Learning, Instructional Support and Feedback, Task Support and Collaboration) is conceptually coherent and each dimension is illustrated with direct participant quotes that make mechanisms legible to readers.
- The paper identifies a consequential and underexplored tension in AI adoption: individual productivity gains are accompanied by erosion of the relational and social infrastructure — mentoring, peer feedback, professional networks — that sustains career development and organizational health.
- The participant sample spans four technically distinct professional roles (Design, User Research, Applied Science, Data Science), providing cross-functional breadth within the study's single-firm scope.
- Demographic data in Table 1 and headline participant counts are internally consistent (7+7+10=24, 22/24 transcription consents, 3 managers/21 ICs), reflecting careful data management (C7, supported).
- The Discussion provides differentiated, actionable recommendations for three distinct actor groups — organizational leaders, individuals, and AI system designers — moving beyond description toward applied guidance.

## Weaknesses

- The thematic coding was performed by a single analyst; no independent second coder was engaged, and no inter-rater reliability statistic (Cohen's κ or Krippendorff's α) is reported, placing the methodology below current CHI/CSCW norms for qualitative HCI empirical work (C2, unsupported, major; reproducibility evaluation concern, major).
- No supplementary materials are provided: the interview guide, codebook with code definitions and exemplar quotes per theme, coding-reliability worksheet, and de-identified theme-frequency table are all absent, preventing independent replication or audit of the analysis (C8, unsupported, major; reproducibility evaluation, code, and other concerns, major).
- Causal language recurrent throughout the manuscript ('AI is creating conditions that hinder professional and career growth', 'AI is changing how we interact') is not warranted by a single-time-point, retrospective, self-report design with no control group or baseline, and concurrent organizational changes at the firm are uncontrolled confounders (C3, partially_supported, minor).
- The Discussion generalizes prescriptive recommendations to 'AI companies' and the AI industry broadly, despite all data deriving from a single unnamed firm; firm-specific culture, internal tooling, and organizational dynamics cannot be ruled out as confounds (C4, partially_supported, minor).
- Table 3 participant counts (range 10–14 of 24) conflate interviewer-probed mentions with spontaneously raised themes, potentially biasing apparent prevalence in favor of themes covered by direct structured probes (C6, partially_supported, minor).
- Recruitment via manager-forwarded emails introduces a manager-mediated selection channel that plausibly over-samples AI-engaged or AI-vocal employees; volunteer bias is not acknowledged as a limitation (C10, partially_supported, minor).
- Two specialist reviewers (citation, novelty) failed due to API quota exhaustion; citation integrity and novelty positioning relative to prior work are unassessed and represent unresolved uncertainty in this meta-review.

## Revision Targets

- [ ] **Manuscript: Section 'Research Methods' and 'Ethical Considerations'**
  - Location: `Section 'Research Methods' and 'Ethical Considerations'`
  - Evidence: No interview protocol, no codebook, no anonymized excerpt corpus beyond inline quotes, no coding-reliability worksheet, and no supplementary materials are linked. IRB constraints can legitimately block raw transcript release, but they do not block release of the interview guide, the final codebook with code definitions and exemplar quotes, or de-identified frequency tables. Proof-as-code axiom (field cs.HC): an executable-artifact equivalent exists (protocol + codebook + reliability report) and is missing.
  - Required change: Ship a supplementary package: e.g., 'supplementary/interview_protocol.md' (the full structured question set + probes), 'supplementary/codebook.md' (codes, definitions, exemplar quotes per code), 'supplementary/coding_reliability.csv' (per-code agreement statistics from a second coder), and 'supplementary/theme_frequencies.csv' (Table 3 data with probed-vs-spontaneous annotation).
  - Verification: Re-review should confirm `Section 'Research Methods' and 'Ethical Considerations'` is corrected or justified.
- [ ] **Manuscript: Section 'Research Methods' and 'Ethical Considerations'**
  - Location: `Section 'Research Methods' and 'Ethical Considerations'`
  - Evidence: No interview protocol, no codebook, no anonymized excerpt corpus beyond inline quotes, no coding-reliability worksheet, and no supplementary materials are linked. IRB constraints can legitimately block raw transcript release, but they do not block release of the interview guide, the final codebook with code definitions and exemplar quotes, or de-identified frequency tables. Proof-as-code axiom (field cs.HC): an executable-artifact equivalent exists (protocol + codebook + reliability report) and is missing.
  - Required change: Ship a supplementary package: e.g., 'supplementary/interview_protocol.md' (the full structured question set + probes), 'supplementary/codebook.md' (codes, definitions, exemplar quotes per code), 'supplementary/coding_reliability.csv' (per-code agreement statistics from a second coder), and 'supplementary/theme_frequencies.csv' (Table 3 data with probed-vs-spontaneous annotation).
  - Verification: Re-review should confirm `Section 'Research Methods' and 'Ethical Considerations'` is corrected or justified.
- [ ] **Manuscript: Introduction and Discussion/Conclusion (recurrent throughout)**
  - Location: `Introduction and Discussion/Conclusion (recurrent throughout)`
  - Evidence: The design is a single-time-point, retrospective, self-report interview study at one 'AI-first' firm with no control group, baseline measurement, or longitudinal arm. Concurrent organizational changes at the firm (workload, hiring, reorganizations, AI-tool mandates) are uncontrolled confounders that the data cannot disentangle from AI exposure itself. The participants' own attributions are taken as evidence of causal mechanism.
  - Required change: Soften causal language to associational/attributional phrasing ('participants attributed X to AI', 'X co-occurred with AI rollout'), or augment the study with a longitudinal panel or matched non-AI-first comparison sample before issuing causal claims.
  - Verification: Re-review should confirm `Introduction and Discussion/Conclusion (recurrent throughout)` is corrected or justified.
- [ ] **Manuscript: Discussion and Conclusion; Ethical Considerations**
  - Location: `Discussion and Conclusion; Ethical Considerations`
  - Evidence: All 24 participants are employed at a single large 'AI-first' technology firm (the @microsoft.com author affiliation strongly suggests Microsoft). The paper itself acknowledges this scope limit ('a small sample for four job functions and broader generalizability should be treated with caution'), yet the Discussion still proposes recommendations targeted at 'AI companies' generically and the AI industry as a whole. Single-firm samples cannot rule out firm-specific cultural confounds (e.g., internal tooling, leadership messaging, reorg pressure).
  - Required change: Replicate at one or more non-AI-first or non-tech firms before issuing industry-wide prescriptions, OR explicitly scope each recommendation to firms with comparable AI saturation and product-team structures.
  - Verification: Re-review should confirm `Discussion and Conclusion; Ethical Considerations` is corrected or justified.
- [ ] **Manuscript: Table 3; Section 'Transcript Analysis' and 'Ethical Considerations'**
  - Location: `Table 3; Section 'Transcript Analysis' and 'Ethical Considerations'`
  - Evidence: The paper notes that although there was a fixed question set, 'occasionally additional questions were asked based on the responses,' yet does not disclose which of the seven themes were addressed by direct structured probes vs. arose spontaneously. Counts therefore conflate participant-initiated mention with interviewer-elicited mention, biasing theme prevalence in favor of themes that received explicit probes and biasing against ones that did not.
  - Required change: Annotate Table 3 with a 'probed' vs. 'spontaneous' breakdown per theme, and publish the interview guide so readers can audit probe scope and ordering effects.
  - Verification: Re-review should confirm `Table 3; Section 'Transcript Analysis' and 'Ethical Considerations'` is corrected or justified.
- [ ] **Manuscript: Section 'Participants'**
  - Location: `Section 'Participants'`
  - Evidence: Recruitment via manager-forwarded emails introduces a manager-mediated selection channel (managers choose which reports see the email, and which employees opt in), plausibly over-sampling AI-engaged or AI-vocal employees. The paper notes 'four participants self-reported as avid AI users, and one was particularly pessimistic about AI,' suggesting the sample skews toward strong AI engagement (positive or negative) rather than median use. Volunteer bias is not discussed as a limitation.
  - Required change: Add a 'Limitations: selection and volunteer bias' subsection acknowledging the manager-mediated recruitment channel and the likely over-representation of AI-engaged employees, and ideally triangulate with a broader, randomly sampled survey of the same population.
  - Verification: Re-review should confirm `Section 'Participants'` is corrected or justified.
- [ ] **Bibliography: Novelty reviewer unavailable**
  - Location: bibliography entry: `Novelty reviewer unavailable`
  - Evidence: Automated novelty review failed before producing a normal prior-art assessment. Failure: `agy` exited successfully with empty stdout for role novelty but its log contains a quota signal: gemini CLI quota exhausted. Set --runner api or wait for reset. stderr=I0522 20:11:27.215844  4759 server.go:1301] Starting language server pr...
  - Required change: Add or discuss missing prior art `Novelty reviewer unavailable`. Automated novelty review failed before producing a normal prior-art assessment. Failure: `agy` exited successfully with empty stdout for role novelty but its log contains a quota signal: gemini CLI quota exhausted. Set --runner api or wait for reset. stderr=I0522 20:11:27.215844  4759 server.go:1301] Starting language server pr...
  - Verification: Re-review should confirm the related-work discussion addresses this prior art.

## Open Questions

- Can the authors release the full interview guide — the structured question set and any supplementary probes used — as a supplementary file so readers can audit probe scope, ordering effects, and the distinction between probed and spontaneous theme emergence?
- Was a second coder engaged at any stage of the analysis, formally or informally? If so, can inter-rater reliability (Cohen's κ or Krippendorff's α) be computed and reported on at least a 20–30% subsample of transcripts?
- For each of the seven themes in Table 3, which were addressed by direct structured interview probes versus arising spontaneously from participant responses? Can the table be annotated with a probed/spontaneous breakdown per theme?
- Are the causal claims in the Introduction and Discussion (e.g., 'AI is creating conditions that hinder professional and career growth') intended to assert causal mechanism, or to summarize participants' attributions? If the former, what design features support causal inference beyond retrospective self-report?
- Are the Discussion recommendations scoped to large AI-first technology firms, or are they intended to generalize more broadly? If broadly, what evidence from outside this single-firm sample supports that generalization?
- What specific AI tools were participants primarily using, at what adoption intensity, and over what time horizon? The unnamed firm's particular AI-first mandate and internal tooling may be a significant moderator that limits portability of findings to organizations at earlier AI-adoption stages.

## Per-Agent Reviews

### citation (`gemini-3-flash-preview`) — status: `warn`

```json
{
  "confidence": 0.0,
  "entries": [
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref1",
        "raw": "Abbas, T.; Rathore, S. A.; Turki, A.; Khan, S.; Alghushairy, O.; and Daud, A. 2025. Enhancing Software Engineering With AI: Innovations, Challenges, and Future Directions. IET Software, 2025(1): 5691460.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1049/sfw2/5691460",
      "resolved_url": "https://doi.org/10.1049/sfw2/5691460"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref2",
        "raw": "Alam, A. 2023. Harnessing the power of AI to create intelligent tutoring systems for enhanced classroom experience and improved learning outcomes. In Intelligent communication technologies and virtual mobile networks, 571–591. Springer.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1007/978-981-99-1767-9_42",
      "resolved_url": "https://doi.org/10.1007/978-981-99-1767-9_42"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref3",
        "raw": "Allen, T. J. 1977. Managing the flow of technology: technology transfer and the dissemination of technological information within the R and D organization. Massachusetts",
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
        "raw": "Bakker, A. B.; and Demerouti, E. 2017. Job demands– resources theory: Taking stock and looking forward. Journal of occupational health psychology, 22(3): 273.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1037/ocp0000056",
      "resolved_url": "https://doi.org/10.1037/ocp0000056"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref5",
        "raw": "Baksa, M.; and Branyiczki, I. 2023. Invisible Foundations of Collaboration in the Workplace: A Multiplex Network Approach to Advice Seeking and Knowledge Sharing. Central",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.18267/j.cebr.322",
      "resolved_url": "https://doi.org/10.18267/j.cebr.322"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref6",
        "raw": "Barke, S.; James, M. B.; and Polikarpova, N. 2023. Grounded copilot: How programmers interact with codegenerating models. Proceedings of the ACM on Programming Languages, 7(OOPSLA1): 85–111.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1145/3586030",
      "resolved_url": "https://doi.org/10.1145/3586030"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref7",
        "raw": "Bhat, A.; Aubin Le Qu´er´e, M.; Naaman, M.; and Jakesch, M. 2026. Reactive Writers: How Co-Writing with AI Changes How We Engage with Ideas. In Proceedings of the 2026 CHI Conference on Human Factors in Computing Systems, 1–21.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1145/3772318.3791529",
      "resolved_url": "https://doi.org/10.1145/3772318.3791529"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref8",
        "raw": "Borgatti; and Cross. 2003. A Relational View of Information Seeking and Learning in Social Networks. 49.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1287/mnsc.49.4.432.14428",
      "resolved_url": "https://doi.org/10.1287/mnsc.49.4.432.14428"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref9",
        "raw": "Brown, J. S.; and Duguid, P. 1991. Organizational Learning and Communities-of-Practice: Toward a Unified View of Working, Learning, and Innovation. Organization Science, 2(1): 40–57.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1287/orsc.2.1.40",
      "resolved_url": "https://doi.org/10.1287/orsc.2.1.40"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref10",
        "raw": "Brynjolfsson, E.; Li, D.; and Raymond, L. 2025. Generative AI at work. The Quarterly Journal of Economics, 140(2): 889–942.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1093/qje/qjae044",
      "resolved_url": "https://doi.org/10.1093/qje/qjae044"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref11",
        "raw": "Butler, J.; Suh, J.; Haniyur, S.; and Hadley, C. 2025. Dear Diary: A randomized controlled trial of Generative AI coding tools in the workplace. In 2025 IEEE/ACM 47th International Conference on Software Engineering: Software Engineering in Practice (ICSE-SEIP), 319–329. IEEE.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1109/icse-seip66354.2025.00034",
      "resolved_url": "https://doi.org/10.1109/icse-seip66354.2025.00034"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref12",
        "raw": "Campbell, B. 2021. Alone Together: Why We Expect More from Technology and Less from Each Other. Journal of Interdisciplinary Studies, 33(1-2): 196–199.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.5840/jis2021331/222",
      "resolved_url": "https://doi.org/10.5840/jis2021331/222"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref13",
        "raw": "Chang, P.-C.; Zhang, W.; Cai, Q.; and Guo, H. 2024. Does AI-driven technostress promote or hinder employees’ artificial intelligence adoption intention? A moderated mediation model of affective reactions and technical self-efficacy. Psychology Research and Behavior Management, 413–427.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.2147/prbm.s441444",
      "resolved_url": "https://doi.org/10.2147/prbm.s441444"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref14",
        "raw": "Cheng, M.; Lee, C.; Khadpe, P.; Yu, S.; Han, D.; and Jurafsky, D. 2026. Sycophantic AI decreases prosocial intentions and promotes dependence. Science, 391(6792): eaec8352.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1126/science.aec8352",
      "resolved_url": "https://doi.org/10.1126/science.aec8352"
    },
    {
      "citation": {
        "arxiv_id": "2510.00762",
        "authors": [],
        "doi": null,
        "key": "ref15",
        "raw": "Choudhuri, R.; Badea, C.; Bird, C.; Butler, J.; DeLine, R.; and Houck, B. 2025. AI Where It Matters: Where, Why, and How Developers Want AI Support in Daily Work. arXiv preprint arXiv:2510.00762.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via arxiv",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": "https://arxiv.org/abs/2510.00762"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref16",
        "raw": "Cohen, S.; and Wills, T. A. 1985. Stress, social support, and the buffering hypothesis. Psychological bulletin, 98(2): 310.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1037/0033-2909.98.2.310",
      "resolved_url": "https://doi.org/10.1037/0033-2909.98.2.310"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref17",
        "raw": "Cranefield, J.; Yoong, P.; and Huff, S. L. 2015. Rethinking lurking: Invisible leading and following in a knowledge transfer ecosystem. Journal of the Association for Information Systems, 16(4): 3.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.26686/wgtn.12909995.v1",
      "resolved_url": "https://doi.org/10.26686/wgtn.12909995.v1"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref18",
        "raw": "Cross, R. L.; and Parker, A. 2004. The hidden power of social networks: Understanding how work really gets done in organizations. Harvard Business Press.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.5860/choice.42-0398",
      "resolved_url": "https://doi.org/10.5860/choice.42-0398"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref19",
        "raw": "Cross, R.; Borgatti, S. P.; and Parker, A. 2002. Making invisible work visible: Using social network analysis to support strategic collaboration. California management review, 44(2): 25–46.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.2307/41166121",
      "resolved_url": "https://doi.org/10.2307/41166121"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref20",
        "raw": "Daniels, A. K. 1987. Invisible Work. Social Problems, 34(5): 403–415.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.2307/800538",
      "resolved_url": "https://doi.org/10.2307/800538"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref21",
        "raw": "De Laat, M.; and Schreurs, B. 2013. Visualizing informal professional development networks: Building a case for learning analytics in the workplace. American Behavioral Scientist, 57(10): 1421–1438.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1177/0002764213479364",
      "resolved_url": "https://doi.org/10.1177/0002764213479364"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref22",
        "raw": "Ehsan, U.; Passi, S.; Saha, K.; McNutt, T.; Riedl, M. O.; and Alcorn, S. 2026. From Future of Work to Future of Workers: Addressing Asymptomatic AI Harms to Foster Dignified Human-AI Interaction. In Proceedings of the 2026 CHI Conference on Human Factors in Computing Systems, 1–21.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1145/3772318.3791081",
      "resolved_url": "https://doi.org/10.1145/3772318.3791081"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref23",
        "raw": "Farmer, N. 2017. The invisible organization: How informal networks can lead organizational change. Routledge.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1108/hrmid.2010.04418cae.001",
      "resolved_url": "https://doi.org/10.1108/hrmid.2010.04418cae.001"
    },
    {
      "citation": {
        "arxiv_id": "2510.00328",
        "authors": [],
        "doi": null,
        "key": "ref24",
        "raw": "Fawzy, A.; Tahir, A.; and Blincoe, K. 2025. Vibe Coding in Practice: Motivations, Challenges, and a Future Outlook–a Grey Literature Review. arXiv preprint arXiv:2510.00328.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via arxiv",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": "https://arxiv.org/abs/2510.00328"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref25",
        "raw": "Fr¨og´eli, E.; Jenner, B.; and Gustavsson, P. 2023. Effectiveness of formal onboarding for facilitating organizational socialization: A systematic review. PloS one, 18(2): e0281823.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1371/journal.pone.0281823",
      "resolved_url": "https://doi.org/10.1371/journal.pone.0281823"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref26",
        "raw": "Gil-Garcia, J. R.; Guler, A.; Pardo, T. A.; and Burke, G. B. 2019. Characterizing the importance of clarity of roles and responsibilities in government inter-organizational collaboration and information sharing initiatives. Government Information Quarterly, 36(4): 101393.",
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
        "key": "ref27",
        "raw": "Goerisch, D.; Basiliere, J.; Rosener, A.; McKee, K.; Hunt, J.; and Parker, T. M. 2019. Mentoring with: reimagining mentoring across the university. Gender, Place & Culture, 26(12): 1740–1758.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1080/0966369x.2019.1668752",
      "resolved_url": "https://doi.org/10.1080/0966369x.2019.1668752"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref28",
        "raw": "Granovetter, M. S. 1973. The Strength of Weak Ties. American Journal of Sociology, 78(6): 1360–1380.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1086/225469",
      "resolved_url": "https://doi.org/10.1086/225469"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref29",
        "raw": "Gunasekaran, T. S.; Lim, S.; Gupta, K.; Bai, H.; Pai, Y. S.; and Billinghurst, M. 2026. Cognitive Bridge: AI-Generated Boundary Objects for Cross-Functional Collaboration. In",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1145/3772318.3791399",
      "resolved_url": "https://doi.org/10.1145/3772318.3791399"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref30",
        "raw": "Hadley, C. N.; and Wright, S. L. 2024. We’re Still Lonely at Work. Harvard Business Review, 103(11-12): 68–77.",
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
        "key": "ref31",
        "raw": "Hadley, C. N.; and Wright, S. L. 2026. Employees Are Relying on AI for Personal Support. That’s Risky. Harvard Business Review.",
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
        "key": "ref32",
        "raw": "Harris, J. I.; Winskowski, A. M.; and Engdahl, B. E. 2007. Types of workplace social support in the prediction of job satisfaction. The career development quarterly, 56(2): 150–",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1002/j.2161-0045.2007.tb00027.x",
      "resolved_url": "https://doi.org/10.1002/j.2161-0045.2007.tb00027.x"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref33",
        "raw": "Hatton, E. 2017. Mechanisms of invisibility: rethinking the concept of invisible work. Work, employment and society, 31(2): 336–351.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1177/0950017016674894",
      "resolved_url": "https://doi.org/10.1177/0950017016674894"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref34",
        "raw": "Higgins, M. C.; and Kram, K. E. 2001. Reconceptualizing mentoring at work: A developmental network perspective. Academy of management review, 26(2): 264–288.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.2307/259122",
      "resolved_url": "https://doi.org/10.2307/259122"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref35",
        "raw": "Hohn, C.; and Loydl, K. 2026. Vibe Coding: intention instead of implementation: How UX professionals build, evaluate, and hand over functional prototypes with AI. i-com, (0).",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1515/icom-2026-0018",
      "resolved_url": "https://doi.org/10.1515/icom-2026-0018"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref36",
        "raw": "House, J. S. 1983. Work stress and social support. Addison- Wesley series on occupational stress.",
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
        "key": "ref37",
        "raw": "House, J.; and Kahn, R. 1985. Measures and concepts of social support. Cohen, S. Syme, S.L. (Eds.) Social support and health, 83–108.",
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
        "key": "ref38",
        "raw": "Kahn, W. A. 1990. Psychological conditions of personal engagement and disengagement at work. Academy of management journal, 33(4): 692–724.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.2307/256287",
      "resolved_url": "https://doi.org/10.2307/256287"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref39",
        "raw": "Krackhardt, D.; and Hanson, J. R. 1993. Informal networks. Harvard business review, 71(4): 104–111.",
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
        "key": "ref40",
        "raw": "Kwon, H.; Oh, J.; Lee, S.; Lee, S.; and Lee, S. 2026. Investigating AI-induced Technostress and Coping Strategies of Professionals. In Proceedings of the 2026 CHI Conference on Human Factors in Computing Systems, 1–16.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1145/3772318.3791671",
      "resolved_url": "https://doi.org/10.1145/3772318.3791671"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref41",
        "raw": "Li, C.; Zhang, Y.; Niu, X.; Chen, F.; and Zhou, H. 2023. Does artificial intelligence promote or inhibit on-the-job learning? Human reactions to AI at work. Systems, 11(3):",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.3390/systems11030114",
      "resolved_url": "https://doi.org/10.3390/systems11030114"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref42",
        "raw": "Mendel, T.; Mandal, S.; Nov, O.; and Wiesenfeld, B. M. 2025. Who is Responsible, the Advisor or the AI? Understanding the Effects of Advisors Disclosing Their AI Use on Their Perceived Responsibility and AI Reliance. Proc. ACM",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1145/3757524",
      "resolved_url": "https://doi.org/10.1145/3757524"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref43",
        "raw": "Meske, C.; Hermanns, T.; Von der Weiden, E.; Loser, K.-U.; and Berger, T. 2025. Vibe coding as a reconfiguration of intent mediation in software development: Definition, implications, and research agenda. IEEE Access, 13: 213242– 213259.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1109/access.2025.3645466",
      "resolved_url": "https://doi.org/10.1109/access.2025.3645466"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref44",
        "raw": "Mitschelen, A.; and Kauffeld, S. 2025. Workplace learning during organizational onboarding: integrating formal, informal, and self-regulated workplace learning. Frontiers in Organizational Psychology, 3: 1569098.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.3389/forgp.2025.1569098",
      "resolved_url": "https://doi.org/10.3389/forgp.2025.1569098"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref45",
        "raw": "Moreland, R. L. 1996. Socially shared cognition at work : Transactive memory and group performance. What’s So Social About Social Cognition? : Social Cognition Research in Small Groups, 57–84.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.4135/9781483327648.n3",
      "resolved_url": "https://doi.org/10.4135/9781483327648.n3"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref46",
        "raw": "Nahar, N.; K¨astner, C.; Butler, J.; Parnin, C.; Zimmermann, T.; and Bird, C. 2025. Beyond the comfort zone: Emerging solutions to overcome challenges in integrating llms into software products. In 2025 IEEE/ACM 47th International Conference on Software Engineering: Software Engineering in Practice (ICSE-SEIP), 516–527. IEEE.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1109/icse-seip66354.2025.00051",
      "resolved_url": "https://doi.org/10.1109/icse-seip66354.2025.00051"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref47",
        "raw": "Nass, C.; and Moon, Y. 2000. Machines and mindlessness: Social responses to computers. Journal of social issues, 56(1): 81–103.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1111/0022-4537.00153",
      "resolved_url": "https://doi.org/10.1111/0022-4537.00153"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref48",
        "raw": "Ng, T. W.; and Sorensen, K. L. 2008. Toward a further understanding of the relationships between perceptions of support and work attitudes: A meta-analysis. Group & Organization Management, 33(3): 243–268.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1177/1059601107313307",
      "resolved_url": "https://doi.org/10.1177/1059601107313307"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref49",
        "raw": "Nulty, T.; Stewart, S.; Thomas, L.; Jean So, R.; and Long, H. 2026. Why slop matters. ACM AI Letters, 1(1): 1–6.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1145/3786777",
      "resolved_url": "https://doi.org/10.1145/3786777"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref50",
        "raw": "Nwana, H. S. 1990. Intelligent tutoring systems: an overview. Artificial Intelligence Review, 4(4): 251–277.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1007/bf00168958",
      "resolved_url": "https://doi.org/10.1007/bf00168958"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref51",
        "raw": "Oliveira, P.; Carvalho, J. M. S.; and Faria, S. 2025. AI Integration in Organisational Workflows: A Case Study on Job",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.3390/info16090764",
      "resolved_url": "https://doi.org/10.3390/info16090764"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref52",
        "raw": "Park, Y. S.; Arvi, N. A. P.; Kim, S.; and Kim, J. 2026. Authorship Drift: How Self-Efficacy and Trust Evolve During LLM-Assisted Writing. In Proceedings of the 2026 CHI Conference on Human Factors in Computing Systems, 1–18.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1145/3772318.3790276",
      "resolved_url": "https://doi.org/10.1145/3772318.3790276"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref53",
        "raw": "Pelau, C.; Dabija, D.-C.; and Ene, I. 2021. What makes an AI device human-like? The role of interaction quality, empathy and perceived psychological anthropomorphic characteristics in the acceptance of artificial intelligence in the service industry. Computers in Human Behavior, 122: 106855.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1016/j.chb.2021.106855",
      "resolved_url": "https://doi.org/10.1016/j.chb.2021.106855"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref54",
        "raw": "Pereira, V.; Hadjielias, E.; Christofi, M.; and Vrontis, D. 2023. A systematic literature review on the impact of artificial intelligence on workplace outcomes: A multi-process perspective. Human Resource Management Review, 33(1): 100857.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1016/j.hrmr.2021.100857",
      "resolved_url": "https://doi.org/10.1016/j.hrmr.2021.100857"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref55",
        "raw": "Poquet, O.; and De Laat, M. 2021. Developing capabilities: Lifelong learning in the age of AI. British Journal of Educational Technology, 52(4): 1695–1708.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1111/bjet.13123",
      "resolved_url": "https://doi.org/10.1111/bjet.13123"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref56",
        "raw": "Post, C.; De Lia, E.; DiTomaso, N.; Tirpak, T. M.; and Borwankar, R. 2009. Capitalizing on thought diversity for innovation. Research-Technology Management, 52(6): 14–25.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1080/08956308.2009.11657596",
      "resolved_url": "https://doi.org/10.1080/08956308.2009.11657596"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref57",
        "raw": "Proceedings of the 2026 CHI Conference on Human Factors in Computing Systems, 1–35.",
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
        "key": "ref58",
        "raw": "Ranganathan, A.; and Ye, X. M. 2026. AI doesn’t reduce work—it intensifies it. Harvard Bus. Rev.",
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
        "key": "ref59",
        "raw": "Ranjit, J.; Zhou, K.; Swayamdipta, S.; and Quercia, D. 2026. Are We Automating the Joy Out of Work? Designing AI to Augment Work, Not Meaning. In Proceedings of the 2026 CHI Conference on Human Factors in Computing Systems, 1–46.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1145/3772318.3791845",
      "resolved_url": "https://doi.org/10.1145/3772318.3791845"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref60",
        "raw": "Rapuano, K.; and Hancock, J. T. 2025. AI-generated “workslop” is destroying productivity. Harvard Business Review.",
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
        "key": "ref61",
        "raw": "Reif, J. A.; Larrick, R. P.; and Soll, J. B. 2025. Evidence of a social evaluation penalty for using AI. Proceedings of the National Academy of Sciences, 122(19): e2426766122.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1073/pnas.2426766122",
      "resolved_url": "https://doi.org/10.1073/pnas.2426766122"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref62",
        "raw": "Salas, E.; Prince, C.; Baker, D. P.; and Shrestha, L. 1995. Situation awareness in team performance: Implications for measurement and training. Human Factors, 37(1): 123–136.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1518/001872095779049525",
      "resolved_url": "https://doi.org/10.1518/001872095779049525"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref63",
        "raw": "Szulanski, G. 1996. Exploring internal stickiness: Impediments to the transfer of best practice within the firm. Strategic Management Journal, 17(S2): 27–43.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1002/smj.4250171105",
      "resolved_url": "https://doi.org/10.1002/smj.4250171105"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref64",
        "raw": "Time. 2023. How to end the unfairness of invisible work.",
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
        "key": "ref65",
        "raw": "Vallance, C. 2023. AI could replace equivalent of 300 million jobs. BBC News.",
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
        "key": "ref66",
        "raw": "Viswesvaran, C.; Sanchez, J. I.; and Fisher, J. 1999. The role of social support in the process of work stress: A metaanalysis. Journal of vocational behavior, 54(2): 314–334.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1006/jvbe.1998.1661",
      "resolved_url": "https://doi.org/10.1006/jvbe.1998.1661"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref67",
        "raw": "Wang, D.; Waldman, D. A.; and Ashforth, B. E. 2019. Building relationships through accountability: An expanded idea of accountability. Organizational Psychology Review, 9(2- 3): 184–206.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1177/2041386619878876",
      "resolved_url": "https://doi.org/10.1177/2041386619878876"
    },
    {
      "citation": {
        "arxiv_id": "2510.22780",
        "authors": [],
        "doi": null,
        "key": "ref68",
        "raw": "Wang, Z. Z.; Shao, Y.; Shaikh, O.; Fried, D.; Neubig, G.; and Yang, D. 2025. How Do AI Agents Do Human Work? Comparing AI and Human Workflows Across Diverse Occupations. arXiv:2510.22780.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via arxiv",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": "https://arxiv.org/abs/2510.22780"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref69",
        "raw": "Webster, J.; Brown, G.; Zweig, D.; Connelly, C. E.; Brodt, S.; and Sitkin, S. 2008. Beyond knowledge sharing: Withholding knowledge at work. Research in Personnel and Human Resources Management, 27: 1–37.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1016/s0742-7301(08)27001-5",
      "resolved_url": "https://doi.org/10.1016/s0742-7301(08)27001-5"
    },
    {
      "citation": {
        "arxiv_id": "2509.02853",
        "authors": [],
        "doi": null,
        "key": "ref70",
        "raw": "Wolfe, D. A.; Choe, A.; and Kidd, F. 2025. The Architecture of AI Transformation: Four Strategic Patterns and an Emerging Frontier. arXiv preprint arXiv:2509.02853.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via arxiv",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": "https://arxiv.org/abs/2509.02853"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref71",
        "raw": "Woodruff, A.; Shelby, R.; Kelley, P. G.; Rousso-Schindler, S.; Smith-Loud, J.; and Wilcox, L. 2024. How knowledge workers think generative ai will (not) transform their industries. In Proceedings of the 2024 CHI Conference on Human Factors in Computing Systems, 1–26.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1145/3613904.3642700",
      "resolved_url": "https://doi.org/10.1145/3613904.3642700"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref72",
        "raw": "Zabbo, E. Feb 3 2026. Invisible labor at work: what it is and how to address it. https://www.circles.com/resources/invisible-labor-atwork-what-it-is-and-how-to-address-it.",
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
        "key": "ref73",
        "raw": "Zhang, X.; De Pablos, P. O.; and Zhou, Z. 2013. Effect of knowledge sharing visibility on incentive-based relationship in Electronic Knowledge Management Systems: An empirical investigation. Computers in Human Behavior, 29(2): 307–313.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1016/j.chb.2012.01.029",
      "resolved_url": "https://doi.org/10.1016/j.chb.2012.01.029"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref74",
        "raw": "Zhang, S.; Zhang, T.; Cheng, J.; and Zhou, S. 2025a. Who is to Blame: A Comprehensive Review of Challenges and Opportunities in Designer-Developer Collaboration. Proceedings of the ACM on Human-Computer Interaction, 9(2): 1–32.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1145/3711105",
      "resolved_url": "https://doi.org/10.1145/3711105"
    },
    {
      "citation": {
        "arxiv_id": "2506.12605",
        "authors": [],
        "doi": null,
        "key": "ref75",
        "raw": "Zhang, Y.; Zhao, D.; Hancock, J. T.; Kraut, R.; and Yang, D. 2025b. The rise of AI companions: how humanchatbot relationships influence well-being. arXiv preprint arXiv:2506.12605.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via arxiv",
      "relevance": "medium",
      "resolved_doi": null,
      "resolved_url": "https://arxiv.org/abs/2506.12605"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref76",
        "raw": "Zhang, X.; Subramonyam, H.; Sarkar, A.; Drosos, I.; Wang, Z.; Lee, K.; Pimenova, V.; Chen, X.; and Lukoff, K. 2026. Generative Design and Vibe Coding: Rethinking The Design-Development Divide for UI Prototyping. In Proceedings of the Extended Abstracts of the 2026 CHI Conference on Human Factors in Computing Systems, 1–3.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1145/3772363.3778802",
      "resolved_url": "https://doi.org/10.1145/3772363.3778802"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref77",
        "raw": "Zhou, X.; Chen, C.; Li, W.; Yao, Y.; Cai, F.; Xu, J.; and Qin, X. 2025. How Do Coworkers Interpret Employee AI Usage: Coworkers’ Perceived Morality and Helping as Responses to Employee AI Usage. Human Resource Management, 64(4): 1077–1097.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1002/hrm.22299",
      "resolved_url": "https://doi.org/10.1002/hrm.22299"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref78",
        "raw": "G. R.; and Zinko, R. 2009. The moderating effects of personal reputation on accountability-strain relationships. Journal of occupational health psychology, 14(1): 70.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1037/a0012567",
      "resolved_url": "https://doi.org/10.1037/a0012567"
    }
  ],
  "missing_references": [],
  "summary": "Citation-use agent failed before producing a normal citation relevance review. Deterministic citation verification still runs separately; see external citation checks and verifier provenance for existence, DOI, URL, and resolver evidence. Failure: `agy` exited successfully with empty stdout for role citation but its log contains a quota signal: gemini CLI quota exhausted. Set --runner api or wait for reset. stderr=I0522 20:11:27.215370  4770 server.go:1301] Starting language server p... Deterministic citation verifier checked 78 bibliography entries."
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.65,
  "questions": [
    "Can the authors release the full interview guide — the structured question set and any supplementary probes used — as a supplementary file so readers can audit probe scope, ordering effects, and the distinction between probed and spontaneous theme emergence?",
    "Was a second coder engaged at any stage of the analysis, formally or informally? If so, can inter-rater reliability (Cohen's κ or Krippendorff's α) be computed and reported on at least a 20–30% subsample of transcripts?",
    "For each of the seven themes in Table 3, which were addressed by direct structured interview probes versus arising spontaneously from participant responses? Can the table be annotated with a probed/spontaneous breakdown per theme?",
    "Are the causal claims in the Introduction and Discussion (e.g., 'AI is creating conditions that hinder professional and career growth') intended to assert causal mechanism, or to summarize participants' attributions? If the former, what design features support causal inference beyond retrospective self-report?",
    "Are the Discussion recommendations scoped to large AI-first technology firms, or are they intended to generalize more broadly? If broadly, what evidence from outside this single-firm sample supports that generalization?",
    "What specific AI tools were participants primarily using, at what adoption intensity, and over what time horizon? The unnamed firm's particular AI-first mandate and internal tooling may be a significant moderator that limits portability of findings to organizations at earlier AI-adoption stages."
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "No interview protocol, no codebook, no anonymized excerpt corpus beyond inline quotes, no coding-reliability worksheet, and no supplementary materials are linked. IRB constraints can legitimately block raw transcript release, but they do not block release of the interview guide, the final codebook with code definitions and exemplar quotes, or de-identified frequency tables. Proof-as-code axiom (field cs.HC): an executable-artifact equivalent exists (protocol + codebook + reliability report) and is missing.",
      "id": "weakness-1",
      "locator": "Section 'Research Methods' and 'Ethical Considerations'",
      "required_update": "Ship a supplementary package: e.g., 'supplementary/interview_protocol.md' (the full structured question set + probes), 'supplementary/codebook.md' (codes, definitions, exemplar quotes per code), 'supplementary/coding_reliability.csv' (per-code agreement statistics from a second coder), and 'supplementary/theme_frequencies.csv' (Table 3 data with probed-vs-spontaneous annotation).",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 'Research Methods' and 'Ethical Considerations'` is corrected or justified.",
      "weakness_index": 0
    },
    {
      "evidence": "No interview protocol, no codebook, no anonymized excerpt corpus beyond inline quotes, no coding-reliability worksheet, and no supplementary materials are linked. IRB constraints can legitimately block raw transcript release, but they do not block release of the interview guide, the final codebook with code definitions and exemplar quotes, or de-identified frequency tables. Proof-as-code axiom (field cs.HC): an executable-artifact equivalent exists (protocol + codebook + reliability report) and is missing.",
      "id": "weakness-2",
      "locator": "Section 'Research Methods' and 'Ethical Considerations'",
      "required_update": "Ship a supplementary package: e.g., 'supplementary/interview_protocol.md' (the full structured question set + probes), 'supplementary/codebook.md' (codes, definitions, exemplar quotes per code), 'supplementary/coding_reliability.csv' (per-code agreement statistics from a second coder), and 'supplementary/theme_frequencies.csv' (Table 3 data with probed-vs-spontaneous annotation).",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 'Research Methods' and 'Ethical Considerations'` is corrected or justified.",
      "weakness_index": 1
    },
    {
      "evidence": "The design is a single-time-point, retrospective, self-report interview study at one 'AI-first' firm with no control group, baseline measurement, or longitudinal arm. Concurrent organizational changes at the firm (workload, hiring, reorganizations, AI-tool mandates) are uncontrolled confounders that the data cannot disentangle from AI exposure itself. The participants' own attributions are taken as evidence of causal mechanism.",
      "id": "weakness-3",
      "locator": "Introduction and Discussion/Conclusion (recurrent throughout)",
      "required_update": "Soften causal language to associational/attributional phrasing ('participants attributed X to AI', 'X co-occurred with AI rollout'), or augment the study with a longitudinal panel or matched non-AI-first comparison sample before issuing causal claims.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Introduction and Discussion/Conclusion (recurrent throughout)` is corrected or justified.",
      "weakness_index": 2
    },
    {
      "evidence": "All 24 participants are employed at a single large 'AI-first' technology firm (the @microsoft.com author affiliation strongly suggests Microsoft). The paper itself acknowledges this scope limit ('a small sample for four job functions and broader generalizability should be treated with caution'), yet the Discussion still proposes recommendations targeted at 'AI companies' generically and the AI industry as a whole. Single-firm samples cannot rule out firm-specific cultural confounds (e.g., internal tooling, leadership messaging, reorg pressure).",
      "id": "weakness-4",
      "locator": "Discussion and Conclusion; Ethical Considerations",
      "required_update": "Replicate at one or more non-AI-first or non-tech firms before issuing industry-wide prescriptions, OR explicitly scope each recommendation to firms with comparable AI saturation and product-team structures.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Discussion and Conclusion; Ethical Considerations` is corrected or justified.",
      "weakness_index": 3
    },
    {
      "evidence": "The paper notes that although there was a fixed question set, 'occasionally additional questions were asked based on the responses,' yet does not disclose which of the seven themes were addressed by direct structured probes vs. arose spontaneously. Counts therefore conflate participant-initiated mention with interviewer-elicited mention, biasing theme prevalence in favor of themes that received explicit probes and biasing against ones that did not.",
      "id": "weakness-5",
      "locator": "Table 3; Section 'Transcript Analysis' and 'Ethical Considerations'",
      "required_update": "Annotate Table 3 with a 'probed' vs. 'spontaneous' breakdown per theme, and publish the interview guide so readers can audit probe scope and ordering effects.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Table 3; Section 'Transcript Analysis' and 'Ethical Considerations'` is corrected or justified.",
      "weakness_index": 4
    },
    {
      "evidence": "Recruitment via manager-forwarded emails introduces a manager-mediated selection channel (managers choose which reports see the email, and which employees opt in), plausibly over-sampling AI-engaged or AI-vocal employees. The paper notes 'four participants self-reported as avid AI users, and one was particularly pessimistic about AI,' suggesting the sample skews toward strong AI engagement (positive or negative) rather than median use. Volunteer bias is not discussed as a limitation.",
      "id": "weakness-6",
      "locator": "Section 'Participants'",
      "required_update": "Add a 'Limitations: selection and volunteer bias' subsection acknowledging the manager-mediated recruitment channel and the likely over-representation of AI-engaged employees, and ideally triangulate with a broader, randomly sampled survey of the same population.",
      "source_path": null,
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Section 'Participants'` is corrected or justified.",
      "weakness_index": 5
    },
    {
      "evidence": "Automated novelty review failed before producing a normal prior-art assessment. Failure: `agy` exited successfully with empty stdout for role novelty but its log contains a quota signal: gemini CLI quota exhausted. Set --runner api or wait for reset. stderr=I0522 20:11:27.215844  4759 server.go:1301] Starting language server pr...",
      "id": "weakness-7",
      "locator": "Novelty reviewer unavailable",
      "required_update": "Add or discuss missing prior art `Novelty reviewer unavailable`. Automated novelty review failed before producing a normal prior-art assessment. Failure: `agy` exited successfully with empty stdout for role novelty but its log contains a quota signal: gemini CLI quota exhausted. Set --runner api or wait for reset. stderr=I0522 20:11:27.215844  4759 server.go:1301] Starting language server pr...",
      "source_path": null,
      "source_role": "novelty",
      "status": "open",
      "target_kind": "bibliography",
      "verification_check": "Re-review should confirm the related-work discussion addresses this prior art.",
      "weakness_index": 6
    }
  ],
  "strengths": [
    "The seven-dimension taxonomy (Cross-Discipline Communication, Role Clarity and Division of Labor, Project Situational Awareness, Reputation and Accountability, Personal Growth and Learning, Instructional Support and Feedback, Task Support and Collaboration) is conceptually coherent and each dimension is illustrated with direct participant quotes that make mechanisms legible to readers.",
    "The paper identifies a consequential and underexplored tension in AI adoption: individual productivity gains are accompanied by erosion of the relational and social infrastructure — mentoring, peer feedback, professional networks — that sustains career development and organizational health.",
    "The participant sample spans four technically distinct professional roles (Design, User Research, Applied Science, Data Science), providing cross-functional breadth within the study's single-firm scope.",
    "Demographic data in Table 1 and headline participant counts are internally consistent (7+7+10=24, 22/24 transcription consents, 3 managers/21 ICs), reflecting careful data management (C7, supported).",
    "The Discussion provides differentiated, actionable recommendations for three distinct actor groups — organizational leaders, individuals, and AI system designers — moving beyond description toward applied guidance."
  ],
  "summary": "This qualitative HCI study examines how AI tools are reshaping invisible and informal work — mentoring, peer feedback, cross-discipline collaboration, and professional networking — among 24 product professionals at a single large AI-first technology firm. The paper's seven-dimension taxonomy of AI impacts on invisible work is conceptually motivated and grounded in participant quotes, and the core observation (AI boosts individual autonomy while eroding relational infrastructure) is timely and practically significant. Two specialist reviewers (citation, novelty) failed due to API quota exhaustion and cannot contribute substantive findings; citation integrity and novelty positioning are therefore unassessed in this review cycle. The two available technical reviewers (technical_correctness confidence 0.70, reproducibility confidence 0.84) converge on a shared critical gap: the thematic analysis relies on a single coder with no reported inter-rater reliability statistic (C2, major; reproducibility evaluation concern, major), and no supplementary materials — interview protocol, codebook, reliability worksheet, or de-identified frequency table — are provided (C8, major; reproducibility code and other concerns, major). Under the recommendation gate for field cs.HC (code-amenable), the missing proof-as-code artifacts at major severity require a major_revision default. The paper's descriptive and practical contributions are real, but the methodological documentation must be substantially strengthened before findings can be evaluated at current CHI/CSCW standards. Causal language throughout the manuscript overstates what a single-time-point, single-firm, retrospective design can support, and the Discussion's industry-wide prescriptions exceed the evidential scope of a one-firm sample.",
  "weaknesses": [
    "The thematic coding was performed by a single analyst; no independent second coder was engaged, and no inter-rater reliability statistic (Cohen's κ or Krippendorff's α) is reported, placing the methodology below current CHI/CSCW norms for qualitative HCI empirical work (C2, unsupported, major; reproducibility evaluation concern, major).",
    "No supplementary materials are provided: the interview guide, codebook with code definitions and exemplar quotes per theme, coding-reliability worksheet, and de-identified theme-frequency table are all absent, preventing independent replication or audit of the analysis (C8, unsupported, major; reproducibility evaluation, code, and other concerns, major).",
    "Causal language recurrent throughout the manuscript ('AI is creating conditions that hinder professional and career growth', 'AI is changing how we interact') is not warranted by a single-time-point, retrospective, self-report design with no control group or baseline, and concurrent organizational changes at the firm are uncontrolled confounders (C3, partially_supported, minor).",
    "The Discussion generalizes prescriptive recommendations to 'AI companies' and the AI industry broadly, despite all data deriving from a single unnamed firm; firm-specific culture, internal tooling, and organizational dynamics cannot be ruled out as confounds (C4, partially_supported, minor).",
    "Table 3 participant counts (range 10–14 of 24) conflate interviewer-probed mentions with spontaneously raised themes, potentially biasing apparent prevalence in favor of themes covered by direct structured probes (C6, partially_supported, minor).",
    "Recruitment via manager-forwarded emails introduces a manager-mediated selection channel that plausibly over-samples AI-engaged or AI-vocal employees; volunteer bias is not acknowledged as a limitation (C10, partially_supported, minor).",
    "Two specialist reviewers (citation, novelty) failed due to API quota exhaustion; citation integrity and novelty positioning relative to prior work are unassessed and represent unresolved uncertainty in this meta-review."
  ]
}
```

### novelty (`gemini-3-flash-preview`) — status: `pass`

```json
{
  "confidence": 0.0,
  "missing_prior_art": [
    {
      "reason": "Automated novelty review failed before producing a normal prior-art assessment. Failure: `agy` exited successfully with empty stdout for role novelty but its log contains a quota signal: gemini CLI quota exhausted. Set --runner api or wait for reset. stderr=I0522 20:11:27.215844  4759 server.go:1301] Starting language server pr...",
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
      "area": "data",
      "description": "The main empirical claims rely on 24 private interview transcripts/notes from an unnamed company, but the transcripts, notes, anonymized participant-level data, and coding matrix are not provided. This prevents independent reproduction of the reported themes and participant counts.",
      "severity": "critical"
    },
    {
      "area": "evaluation",
      "description": "The paper describes transcript tagging and secondary review but does not provide a codebook, full coding protocol, coder assignments, adjudication procedure, or reliability checks needed to reproduce the thematic analysis.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "The fixed interview questions, recruitment materials, survey instrument, and consent materials are only summarized rather than released, limiting faithful replication of the data collection protocol.",
      "severity": "major"
    },
    {
      "area": "code",
      "description": "No analysis scripts, qualitative analysis project export, or other machine-readable workflow artifacts are provided for reproducing theme counts, correlations between themes, or table generation.",
      "severity": "major"
    },
    {
      "area": "data",
      "description": "The study setting and participant pool are a single large technology firm that is not identified, so independent researchers cannot directly sample the same population or verify organizational context effects.",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://www.circles.com/resources/invisible-labor-atwork-what-it-is-and-how-to-address-it` (status=404)",
      "severity": "minor"
    }
  ],
  "confidence": 0.84,
  "data_availability": "private",
  "data_url": null,
  "environment": {
    "dependencies": [],
    "hardware": null,
    "software": "Interviews were conducted over video chat; 22 participants allowed built-in AI transcription and 2 were handled by manual notes. No transcription platform version, qualitative analysis software, or reproducible analysis environment is specified."
  },
  "reproducibility_score": 0.22
}
```

### summary (`claude-haiku-4-5-20251001`) — status: `pass`

```json
{
  "audience": "Organizational leaders, human resources professionals, workplace researchers, managers of knowledge workers, and AI product designers interested in understanding how AI adoption affects workplace culture, employee well-being, and long-term organizational health beyond immediate productivity metrics.",
  "key_contributions": [
    "Seven dimensions of how AI impacts invisible work in organizations: cross-discipline communication, role clarity and division of labor, project situational awareness, reputation and accountability, personal growth and learning, instructional support and feedback, and task support and collaboration",
    "Evidence that AI transformation is affecting invisible work as much as or more than visible work, despite most discussions focusing on productivity gains",
    "Documentation that workers are substituting AI for human social support, with consequences for career development, professional networks, and organizational culture",
    "Identification of a core tension in AI adoption: individual productivity and independence gains coupled with erosion of the relational and social systems that support career growth and organizational health",
    "Recommendations for organizational leaders, individuals, and AI system designers to maintain human connection and informal support mechanisms while integrating AI tools"
  ],
  "plain_language_summary": "As AI tools become integrated into knowledge work, they are changing not just how people do their individual tasks, but also the informal mentoring, feedback, and collaboration that keeps organizations healthy. Researchers at Microsoft interviewed 24 product professionals about how AI has affected their work and their interactions with colleagues. They found that AI is smoothing some collaboration challenges—designers can now create working code prototypes using natural language, making it easier to demonstrate ideas to engineers; researchers can generate documentation more easily; and employees can ask AI to explain complex concepts rather than risking embarrassment asking colleagues. However, these changes are also blurring traditional job boundaries, creating anxiety about role clarity and whether certain positions will remain necessary.\n\nMore significantly, the study found that professionals are increasingly turning to AI instead of asking colleagues for help, feedback, and learning opportunities. While this makes people feel more independent and productive, it's eroding the informal relationships and professional networks that are essential for career advancement, knowledge transfer, and workplace well-being. Colleagues are reading fewer status documents, people feel less accountable for AI-written content, and workers report greater social isolation and concern about losing professional connections. The researchers argue that organizations must intentionally preserve human support systems and collaborative practices alongside AI adoption, not to slow productivity, but to maintain healthy work cultures where people feel connected and supported in their growth.",
  "tldr": "AI is transforming how colleagues help and support each other at work, enabling independence but risking the professional relationships critical for career growth and organizational culture."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `warn`

```json
{
  "claims": [
    {
      "assessment": "partially_supported",
      "claim": "AI is transforming workplace invisible work along exactly seven distinct dimensions (Cross-Discipline Communication, Role Clarity & Division of Labor, Project Situational Awareness, Reputation & Accountability, Personal Growth & Learning, Instructional Support & Feedback, Task Support & Collaboration).",
      "evidence": "Each of the seven themes is illustrated by direct participant quotes and tied to relevant prior literature, lending qualitative face validity. However, the seven-dimension factorization is derived inductively by a single analyst, with no inter-rater reliability statistic, no documented saturation criterion, and overlapping construct boundaries (e.g., 'Instructional Support and Feedback' and 'Task Support and Collaboration' both concern peer help/feedback dynamics and could plausibly be collapsed or further subdivided).",
      "id": "C1",
      "location": "Section 'AI Transformation of Invisible Work'; Tables 2 and 3",
      "severity": "minor",
      "suggested_fix": "Engage an independent second coder on a random subset of transcripts and report Cohen's κ or Krippendorff's α; document saturation criteria; justify the seven-dimension cardinality against alternative groupings."
    },
    {
      "assessment": "unsupported",
      "claim": "The thematic coding underlying Table 3 and the seven-theme taxonomy is methodologically reliable.",
      "evidence": "The paper states 'the interviewer collected the transcript, cleaned and anonymized it, and tagged it' and that 'a secondary review of each transcript after more than 80% of the interviews were complete' was performed — but does not indicate a second independent coder, inter-rater agreement, member-checking, or any other reliability check. For a qualitative HCI study whose headline findings depend on a thematic taxonomy, single-coder analysis is below current methodological norms (e.g., CHI/CSCW reporting expectations).",
      "id": "C2",
      "location": "Section 'Transcript Analysis'",
      "severity": "major",
      "suggested_fix": "Add an independent second coder on at least a 20–30% subsample, compute and report Cohen's κ (or Krippendorff's α for the multi-category case), and either revise the codebook to resolve disagreements or report disagreement bands."
    },
    {
      "assessment": "partially_supported",
      "claim": "AI is causing the observed changes in invisible work (e.g., 'AI is creating conditions that hinder professional and career growth', 'AI is changing how we interact').",
      "evidence": "The design is a single-time-point, retrospective, self-report interview study at one 'AI-first' firm with no control group, baseline measurement, or longitudinal arm. Concurrent organizational changes at the firm (workload, hiring, reorganizations, AI-tool mandates) are uncontrolled confounders that the data cannot disentangle from AI exposure itself. The participants' own attributions are taken as evidence of causal mechanism.",
      "id": "C3",
      "location": "Introduction and Discussion/Conclusion (recurrent throughout)",
      "severity": "minor",
      "suggested_fix": "Soften causal language to associational/attributional phrasing ('participants attributed X to AI', 'X co-occurred with AI rollout'), or augment the study with a longitudinal panel or matched non-AI-first comparison sample before issuing causal claims."
    },
    {
      "assessment": "partially_supported",
      "claim": "Findings generalize to 'AI companies', 'organization leaders', and 'individuals' broadly, justifying the prescriptive recommendations in the Discussion.",
      "evidence": "All 24 participants are employed at a single large 'AI-first' technology firm (the @microsoft.com author affiliation strongly suggests Microsoft). The paper itself acknowledges this scope limit ('a small sample for four job functions and broader generalizability should be treated with caution'), yet the Discussion still proposes recommendations targeted at 'AI companies' generically and the AI industry as a whole. Single-firm samples cannot rule out firm-specific cultural confounds (e.g., internal tooling, leadership messaging, reorg pressure).",
      "id": "C4",
      "location": "Discussion and Conclusion; Ethical Considerations",
      "severity": "minor",
      "suggested_fix": "Replicate at one or more non-AI-first or non-tech firms before issuing industry-wide prescriptions, OR explicitly scope each recommendation to firms with comparable AI saturation and product-team structures."
    },
    {
      "assessment": "partially_supported",
      "claim": "'agents could complete tasks ~90% faster than humans on the same set of 16 tasks (Wang et al. 2025)' is offered as motivating evidence for AI's productivity impact.",
      "evidence": "This is a single-study citation with a striking effect size on a narrow benchmark (n=16 tasks). The paper itself flags ongoing 'disagreements in exactly how much productivity improvement workers see,' which weakens the headline framing. The claim is motivational rather than load-bearing for the qualitative findings.",
      "id": "C5",
      "location": "Introduction (paragraph citing Wang et al. 2025)",
      "severity": "info",
      "suggested_fix": "Replace the single-study figure with a systematic review or meta-analytic estimate, and clarify the task domain and benchmark size inline so readers can calibrate the effect."
    },
    {
      "assessment": "partially_supported",
      "claim": "The participant counts per theme in Table 3 (range 10–14 of 24) accurately reflect the prevalence of each theme among participants.",
      "evidence": "The paper notes that although there was a fixed question set, 'occasionally additional questions were asked based on the responses,' yet does not disclose which of the seven themes were addressed by direct structured probes vs. arose spontaneously. Counts therefore conflate participant-initiated mention with interviewer-elicited mention, biasing theme prevalence in favor of themes that received explicit probes and biasing against ones that did not.",
      "id": "C6",
      "location": "Table 3; Section 'Transcript Analysis' and 'Ethical Considerations'",
      "severity": "minor",
      "suggested_fix": "Annotate Table 3 with a 'probed' vs. 'spontaneous' breakdown per theme, and publish the interview guide so readers can audit probe scope and ordering effects."
    },
    {
      "assessment": "supported",
      "claim": "Demographic counts in Table 1 and prose are internally consistent: 7 Design + 7 User Research + 10 Applied/Data Science = 24 participants; 22/24 consented to AI transcription; 3 of 24 are managers (21 ICs).",
      "evidence": "7+7+10=24 totals match the headline N. Gender breakdowns per row (4+3, 4+3, 5+5) sum to row totals. 22 transcription consents leaves 2 manual-note interviews, consistent with footnote 1. 24−3=21 ICs is internally consistent. The first row label in Table 1 appears truncated in the extracted text (likely 'Design') but the arithmetic is sound.",
      "id": "C7",
      "location": "Table 1; 'Participants' subsection",
      "severity": "info",
      "suggested_fix": "Cosmetic only: restore the truncated 'Design' row label in Table 1 so the table is self-contained."
    },
    {
      "assessment": "unsupported",
      "claim": "The study's findings are reproducible from the reported methods (implicit reproducibility claim for a cs.HC empirical paper).",
      "evidence": "No interview protocol, no codebook, no anonymized excerpt corpus beyond inline quotes, no coding-reliability worksheet, and no supplementary materials are linked. IRB constraints can legitimately block raw transcript release, but they do not block release of the interview guide, the final codebook with code definitions and exemplar quotes, or de-identified frequency tables. Proof-as-code axiom (field cs.HC): an executable-artifact equivalent exists (protocol + codebook + reliability report) and is missing.",
      "id": "C8",
      "location": "Section 'Research Methods' and 'Ethical Considerations'",
      "severity": "major",
      "suggested_fix": "Ship a supplementary package: e.g., 'supplementary/interview_protocol.md' (the full structured question set + probes), 'supplementary/codebook.md' (codes, definitions, exemplar quotes per code), 'supplementary/coding_reliability.csv' (per-code agreement statistics from a second coder), and 'supplementary/theme_frequencies.csv' (Table 3 data with probed-vs-spontaneous annotation)."
    },
    {
      "assessment": "supported",
      "claim": "Sycophancy in AI 'has been shown to be harmful to judgments and decision-making' (Cheng et al. 2026).",
      "evidence": "The cited Science paper is consistent with the established sycophancy literature and is congruent with the participant anecdote about AI agreeing rather than pushing back. The claim is used as a discussion touchpoint, not a load-bearing empirical claim of this paper.",
      "id": "C9",
      "location": "Section 7 'Task Support and Collaboration'",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Selection of participants is unbiased with respect to AI attitudes ('recruited through emails sent to managers of technical professions').",
      "evidence": "Recruitment via manager-forwarded emails introduces a manager-mediated selection channel (managers choose which reports see the email, and which employees opt in), plausibly over-sampling AI-engaged or AI-vocal employees. The paper notes 'four participants self-reported as avid AI users, and one was particularly pessimistic about AI,' suggesting the sample skews toward strong AI engagement (positive or negative) rather than median use. Volunteer bias is not discussed as a limitation.",
      "id": "C10",
      "location": "Section 'Participants'",
      "severity": "minor",
      "suggested_fix": "Add a 'Limitations: selection and volunteer bias' subsection acknowledging the manager-mediated recruitment channel and the likely over-representation of AI-engaged employees, and ideally triangulate with a broader, randomly sampled survey of the same population."
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

1. Abbas, T.; Rathore, S. A.; Turki, A.; Khan, S.; Alghushairy, O.; and Daud, A. 2025. Enhancing Software Engineering With AI: Innovations, Challenges, and Future Directions. IET Software, 2025(1): 5691460.
2. Alam, A. 2023. Harnessing the power of AI to create intelligent tutoring systems for enhanced classroom experience and improved learning outcomes. In Intelligent communication technologies and virtual mobile networks, 571–591. Springer.
3. Allen, T. J. 1977. Managing the flow of technology: technology transfer and the dissemination of technological information within the R and D organization. Massachusetts
4. Bakker, A. B.; and Demerouti, E. 2017. Job demands– resources theory: Taking stock and looking forward. Journal of occupational health psychology, 22(3): 273.
5. Baksa, M.; and Branyiczki, I. 2023. Invisible Foundations of Collaboration in the Workplace: A Multiplex Network Approach to Advice Seeking and Knowledge Sharing. Central
6. Barke, S.; James, M. B.; and Polikarpova, N. 2023. Grounded copilot: How programmers interact with codegenerating models. Proceedings of the ACM on Programming Languages, 7(OOPSLA1): 85–111.
7. Bhat, A.; Aubin Le Qu´er´e, M.; Naaman, M.; and Jakesch, M. 2026. Reactive Writers: How Co-Writing with AI Changes How We Engage with Ideas. In Proceedings of the 2026 CHI Conference on Human Factors in Computing Systems, 1–21.
8. Borgatti; and Cross. 2003. A Relational View of Information Seeking and Learning in Social Networks. 49.
9. Brown, J. S.; and Duguid, P. 1991. Organizational Learning and Communities-of-Practice: Toward a Unified View of Working, Learning, and Innovation. Organization Science, 2(1): 40–57.
10. Brynjolfsson, E.; Li, D.; and Raymond, L. 2025. Generative AI at work. The Quarterly Journal of Economics, 140(2): 889–942.
11. Butler, J.; Suh, J.; Haniyur, S.; and Hadley, C. 2025. Dear Diary: A randomized controlled trial of Generative AI coding tools in the workplace. In 2025 IEEE/ACM 47th International Conference on Software Engineering: Software Engineering in Practice (ICSE-SEIP), 319–329. IEEE.
12. Campbell, B. 2021. Alone Together: Why We Expect More from Technology and Less from Each Other. Journal of Interdisciplinary Studies, 33(1-2): 196–199.
13. Chang, P.-C.; Zhang, W.; Cai, Q.; and Guo, H. 2024. Does AI-driven technostress promote or hinder employees’ artificial intelligence adoption intention? A moderated mediation model of affective reactions and technical self-efficacy. Psychology Research and Behavior Management, 413–427.
14. Cheng, M.; Lee, C.; Khadpe, P.; Yu, S.; Han, D.; and Jurafsky, D. 2026. Sycophantic AI decreases prosocial intentions and promotes dependence. Science, 391(6792): eaec8352.
15. Choudhuri, R.; Badea, C.; Bird, C.; Butler, J.; DeLine, R.; and Houck, B. 2025. AI Where It Matters: Where, Why, and How Developers Want AI Support in Daily Work. arXiv preprint arXiv:2510.00762. arXiv:[2510.00762](https://arxiv.org/abs/2510.00762)
16. Cohen, S.; and Wills, T. A. 1985. Stress, social support, and the buffering hypothesis. Psychological bulletin, 98(2): 310.
17. Cranefield, J.; Yoong, P.; and Huff, S. L. 2015. Rethinking lurking: Invisible leading and following in a knowledge transfer ecosystem. Journal of the Association for Information Systems, 16(4): 3.
18. Cross, R. L.; and Parker, A. 2004. The hidden power of social networks: Understanding how work really gets done in organizations. Harvard Business Press.
19. Cross, R.; Borgatti, S. P.; and Parker, A. 2002. Making invisible work visible: Using social network analysis to support strategic collaboration. California management review, 44(2): 25–46.
20. Daniels, A. K. 1987. Invisible Work. Social Problems, 34(5): 403–415.
21. De Laat, M.; and Schreurs, B. 2013. Visualizing informal professional development networks: Building a case for learning analytics in the workplace. American Behavioral Scientist, 57(10): 1421–1438.
22. Ehsan, U.; Passi, S.; Saha, K.; McNutt, T.; Riedl, M. O.; and Alcorn, S. 2026. From Future of Work to Future of Workers: Addressing Asymptomatic AI Harms to Foster Dignified Human-AI Interaction. In Proceedings of the 2026 CHI Conference on Human Factors in Computing Systems, 1–21.
23. Farmer, N. 2017. The invisible organization: How informal networks can lead organizational change. Routledge.
24. Fawzy, A.; Tahir, A.; and Blincoe, K. 2025. Vibe Coding in Practice: Motivations, Challenges, and a Future Outlook–a Grey Literature Review. arXiv preprint arXiv:2510.00328. arXiv:[2510.00328](https://arxiv.org/abs/2510.00328)
25. Fr¨og´eli, E.; Jenner, B.; and Gustavsson, P. 2023. Effectiveness of formal onboarding for facilitating organizational socialization: A systematic review. PloS one, 18(2): e0281823.
26. Gil-Garcia, J. R.; Guler, A.; Pardo, T. A.; and Burke, G. B. 2019. Characterizing the importance of clarity of roles and responsibilities in government inter-organizational collaboration and information sharing initiatives. Government Information Quarterly, 36(4): 101393.
27. Goerisch, D.; Basiliere, J.; Rosener, A.; McKee, K.; Hunt, J.; and Parker, T. M. 2019. Mentoring with: reimagining mentoring across the university. Gender, Place & Culture, 26(12): 1740–1758.
28. Granovetter, M. S. 1973. The Strength of Weak Ties. American Journal of Sociology, 78(6): 1360–1380.
29. Gunasekaran, T. S.; Lim, S.; Gupta, K.; Bai, H.; Pai, Y. S.; and Billinghurst, M. 2026. Cognitive Bridge: AI-Generated Boundary Objects for Cross-Functional Collaboration. In
30. Hadley, C. N.; and Wright, S. L. 2024. We’re Still Lonely at Work. Harvard Business Review, 103(11-12): 68–77.
31. Hadley, C. N.; and Wright, S. L. 2026. Employees Are Relying on AI for Personal Support. That’s Risky. Harvard Business Review.
32. Harris, J. I.; Winskowski, A. M.; and Engdahl, B. E. 2007. Types of workplace social support in the prediction of job satisfaction. The career development quarterly, 56(2): 150–
33. Hatton, E. 2017. Mechanisms of invisibility: rethinking the concept of invisible work. Work, employment and society, 31(2): 336–351.
34. Higgins, M. C.; and Kram, K. E. 2001. Reconceptualizing mentoring at work: A developmental network perspective. Academy of management review, 26(2): 264–288.
35. Hohn, C.; and Loydl, K. 2026. Vibe Coding: intention instead of implementation: How UX professionals build, evaluate, and hand over functional prototypes with AI. i-com, (0).
36. House, J. S. 1983. Work stress and social support. Addison- Wesley series on occupational stress.
37. House, J.; and Kahn, R. 1985. Measures and concepts of social support. Cohen, S. Syme, S.L. (Eds.) Social support and health, 83–108.
38. Kahn, W. A. 1990. Psychological conditions of personal engagement and disengagement at work. Academy of management journal, 33(4): 692–724.
39. Krackhardt, D.; and Hanson, J. R. 1993. Informal networks. Harvard business review, 71(4): 104–111.
40. Kwon, H.; Oh, J.; Lee, S.; Lee, S.; and Lee, S. 2026. Investigating AI-induced Technostress and Coping Strategies of Professionals. In Proceedings of the 2026 CHI Conference on Human Factors in Computing Systems, 1–16.
41. Li, C.; Zhang, Y.; Niu, X.; Chen, F.; and Zhou, H. 2023. Does artificial intelligence promote or inhibit on-the-job learning? Human reactions to AI at work. Systems, 11(3):
42. Mendel, T.; Mandal, S.; Nov, O.; and Wiesenfeld, B. M. 2025. Who is Responsible, the Advisor or the AI? Understanding the Effects of Advisors Disclosing Their AI Use on Their Perceived Responsibility and AI Reliance. Proc. ACM
43. Meske, C.; Hermanns, T.; Von der Weiden, E.; Loser, K.-U.; and Berger, T. 2025. Vibe coding as a reconfiguration of intent mediation in software development: Definition, implications, and research agenda. IEEE Access, 13: 213242– 213259.
44. Mitschelen, A.; and Kauffeld, S. 2025. Workplace learning during organizational onboarding: integrating formal, informal, and self-regulated workplace learning. Frontiers in Organizational Psychology, 3: 1569098.
45. Moreland, R. L. 1996. Socially shared cognition at work : Transactive memory and group performance. What’s So Social About Social Cognition? : Social Cognition Research in Small Groups, 57–84.
46. Nahar, N.; K¨astner, C.; Butler, J.; Parnin, C.; Zimmermann, T.; and Bird, C. 2025. Beyond the comfort zone: Emerging solutions to overcome challenges in integrating llms into software products. In 2025 IEEE/ACM 47th International Conference on Software Engineering: Software Engineering in Practice (ICSE-SEIP), 516–527. IEEE.
47. Nass, C.; and Moon, Y. 2000. Machines and mindlessness: Social responses to computers. Journal of social issues, 56(1): 81–103.
48. Ng, T. W.; and Sorensen, K. L. 2008. Toward a further understanding of the relationships between perceptions of support and work attitudes: A meta-analysis. Group & Organization Management, 33(3): 243–268.
49. Nulty, T.; Stewart, S.; Thomas, L.; Jean So, R.; and Long, H. 2026. Why slop matters. ACM AI Letters, 1(1): 1–6.
50. Nwana, H. S. 1990. Intelligent tutoring systems: an overview. Artificial Intelligence Review, 4(4): 251–277.
51. Oliveira, P.; Carvalho, J. M. S.; and Faria, S. 2025. AI Integration in Organisational Workflows: A Case Study on Job
52. Park, Y. S.; Arvi, N. A. P.; Kim, S.; and Kim, J. 2026. Authorship Drift: How Self-Efficacy and Trust Evolve During LLM-Assisted Writing. In Proceedings of the 2026 CHI Conference on Human Factors in Computing Systems, 1–18.
53. Pelau, C.; Dabija, D.-C.; and Ene, I. 2021. What makes an AI device human-like? The role of interaction quality, empathy and perceived psychological anthropomorphic characteristics in the acceptance of artificial intelligence in the service industry. Computers in Human Behavior, 122: 106855.
54. Pereira, V.; Hadjielias, E.; Christofi, M.; and Vrontis, D. 2023. A systematic literature review on the impact of artificial intelligence on workplace outcomes: A multi-process perspective. Human Resource Management Review, 33(1): 100857.
55. Poquet, O.; and De Laat, M. 2021. Developing capabilities: Lifelong learning in the age of AI. British Journal of Educational Technology, 52(4): 1695–1708.
56. Post, C.; De Lia, E.; DiTomaso, N.; Tirpak, T. M.; and Borwankar, R. 2009. Capitalizing on thought diversity for innovation. Research-Technology Management, 52(6): 14–25.
57. Proceedings of the 2026 CHI Conference on Human Factors in Computing Systems, 1–35.
58. Ranganathan, A.; and Ye, X. M. 2026. AI doesn’t reduce work—it intensifies it. Harvard Bus. Rev.
59. Ranjit, J.; Zhou, K.; Swayamdipta, S.; and Quercia, D. 2026. Are We Automating the Joy Out of Work? Designing AI to Augment Work, Not Meaning. In Proceedings of the 2026 CHI Conference on Human Factors in Computing Systems, 1–46.
60. Rapuano, K.; and Hancock, J. T. 2025. AI-generated “workslop” is destroying productivity. Harvard Business Review.
61. Reif, J. A.; Larrick, R. P.; and Soll, J. B. 2025. Evidence of a social evaluation penalty for using AI. Proceedings of the National Academy of Sciences, 122(19): e2426766122.
62. Salas, E.; Prince, C.; Baker, D. P.; and Shrestha, L. 1995. Situation awareness in team performance: Implications for measurement and training. Human Factors, 37(1): 123–136.
63. Szulanski, G. 1996. Exploring internal stickiness: Impediments to the transfer of best practice within the firm. Strategic Management Journal, 17(S2): 27–43.
64. Time. 2023. How to end the unfairness of invisible work.
65. Vallance, C. 2023. AI could replace equivalent of 300 million jobs. BBC News.
66. Viswesvaran, C.; Sanchez, J. I.; and Fisher, J. 1999. The role of social support in the process of work stress: A metaanalysis. Journal of vocational behavior, 54(2): 314–334.
67. Wang, D.; Waldman, D. A.; and Ashforth, B. E. 2019. Building relationships through accountability: An expanded idea of accountability. Organizational Psychology Review, 9(2- 3): 184–206.
68. Wang, Z. Z.; Shao, Y.; Shaikh, O.; Fried, D.; Neubig, G.; and Yang, D. 2025. How Do AI Agents Do Human Work? Comparing AI and Human Workflows Across Diverse Occupations. arXiv:2510.22780. arXiv:[2510.22780](https://arxiv.org/abs/2510.22780)
69. Webster, J.; Brown, G.; Zweig, D.; Connelly, C. E.; Brodt, S.; and Sitkin, S. 2008. Beyond knowledge sharing: Withholding knowledge at work. Research in Personnel and Human Resources Management, 27: 1–37.
70. Wolfe, D. A.; Choe, A.; and Kidd, F. 2025. The Architecture of AI Transformation: Four Strategic Patterns and an Emerging Frontier. arXiv preprint arXiv:2509.02853. arXiv:[2509.02853](https://arxiv.org/abs/2509.02853)
71. Woodruff, A.; Shelby, R.; Kelley, P. G.; Rousso-Schindler, S.; Smith-Loud, J.; and Wilcox, L. 2024. How knowledge workers think generative ai will (not) transform their industries. In Proceedings of the 2024 CHI Conference on Human Factors in Computing Systems, 1–26.
72. Zabbo, E. Feb 3 2026. Invisible labor at work: what it is and how to address it. https://www.circles.com/resources/invisible-labor-atwork-what-it-is-and-how-to-address-it.
73. Zhang, X.; De Pablos, P. O.; and Zhou, Z. 2013. Effect of knowledge sharing visibility on incentive-based relationship in Electronic Knowledge Management Systems: An empirical investigation. Computers in Human Behavior, 29(2): 307–313.
74. Zhang, S.; Zhang, T.; Cheng, J.; and Zhou, S. 2025a. Who is to Blame: A Comprehensive Review of Challenges and Opportunities in Designer-Developer Collaboration. Proceedings of the ACM on Human-Computer Interaction, 9(2): 1–32.
75. Zhang, Y.; Zhao, D.; Hancock, J. T.; Kraut, R.; and Yang, D. 2025b. The rise of AI companions: how humanchatbot relationships influence well-being. arXiv preprint arXiv:2506.12605. arXiv:[2506.12605](https://arxiv.org/abs/2506.12605)
76. Zhang, X.; Subramonyam, H.; Sarkar, A.; Drosos, I.; Wang, Z.; Lee, K.; Pimenova, V.; Chen, X.; and Lukoff, K. 2026. Generative Design and Vibe Coding: Rethinking The Design-Development Divide for UI Prototyping. In Proceedings of the Extended Abstracts of the 2026 CHI Conference on Human Factors in Computing Systems, 1–3.
77. Zhou, X.; Chen, C.; Li, W.; Yao, Y.; Cai, F.; Xu, J.; and Qin, X. 2025. How Do Coworkers Interpret Employee AI Usage: Coworkers’ Perceived Morality and Helping as Responses to Employee AI Usage. Human Resource Management, 64(4): 1077–1097.
78. G. R.; and Zinko, R. 2009. The moderating effects of personal reputation on accountability-strain relationships. Journal of occupational health psychology, 14(1): 70.

