# Beyond the Org Chart: AI and the Transformation of Invisible Work

GrokRxiv review of [arXiv:2605.22707](https://arxiv.org/abs/2605.22707) · `cs.AI`

_Authors_: Stephanie Rosenthal, Shamsi Iqbal

## TL;DR

This paper makes a timely contribution by examining AI's impact on informal workplace practices—so-called invisible work—across seven thematic dimensions, drawn from 24 semi-structured interviews at a single large technology company. The technical correctness reviewer (confidence 0.72, overall: mostly_sound) and the reproducibility reviewer (confidence 0.87, score 0.22) together identify a cluster of major and critical concerns that prevent acceptance in the current form. Five major-severity technical issues were flagged: the thematic participant counts in Table 3 cannot be independently verified without a codebook or inter-rater reliability data (C2); the seven dimensions are framed as canonical without a saturation analysis or mutual-exclusivity argument (C6); generalization language in the Introduction and Discussion overstates what a single-site, 24-person observational study can support (C7, C8); causal language is used where the data support only participant-reported associations (C15); and no proof-as-code or supplementary analysis artifacts are provided for a cs.HC study whose load-bearing quantitative outputs could be reproduced from such materials (C9—unsupported, major). The reproducibility reviewer independently flagged the absence of any transcript corpus, interview instrument, or qualitative analysis protocol, with the missing data corpus rated critical severity. The paper falls within cs.HC, a code-amenable field, and the missing proof-as-code artifact (C9) triggers the recommendation gate: major_revision is the default. The novelty and citation specialist agents both failed to produce assessments (confidence 0.0 each); those dimensions remain unresolved and should be addressed in resubmission.

_Recommendation_: **Major revision** · _Confidence_: 70%

## Strengths

- The paper addresses a genuinely underexplored dimension of AI's organizational impact—informal and invisible work—filling a gap in the CHI/CSCW literature that has focused primarily on task-level productivity effects.
- The seven-theme taxonomy yields concrete, actionable recommendations for organizations, managers, and individuals, making findings accessible beyond academic audiences.
- Participant sampling is internally consistent and gender-balanced across three job families, as verified by Table 1 arithmetic (C1, C5, C10: all supported by the technical correctness reviewer).
- The paper situates its findings within an appropriate body of literature on informal organizational networks, peer learning, and AI-assisted productivity, with several citations confirmed well-matched to their paraphrased claims (C4, C13: supported).
- The identification of a dual effect—AI enabling professional independence while simultaneously eroding the relational infrastructure of career development and mentorship—is a coherent and practically significant theoretical framing.

## Weaknesses

- The single-company, 24-participant convenience sample does not support the broad generalization claims made in the Introduction and Discussion (e.g., 'AI is impacting invisible work just as much or more than visible work'); the Ethical Considerations section's acknowledgment of constrained generalizability is not consistently honored throughout the paper (C7: major; C8: minor).
- No codebook, inter-coder agreement statistic, or operational definition of theme membership is provided, making the participant counts in Table 3 independently unverifiable by any reviewer (C2: major; reproducibility evaluation concern: major).
- The seven thematic dimensions are presented as a canonical decomposition of AI's effect on invisible work without a saturation analysis or mutual-exclusivity argument, leaving open whether they are exhaustive of the domain or characteristic of this particular sample (C6: major).
- Causal language throughout the Discussion and Conclusion (e.g., 'AI is dismantling the existing mechanisms that drive productivity') overstates what a cross-sectional, self-report observational study can support; self-report and recall bias, the absence of a comparison group, and confounding by concurrent organizational change are not discussed as limitations (C15: major).
- No anonymized transcript corpus, complete interview instrument, codebook, or analysis scripts are provided for a cs.HC empirical study whose load-bearing outputs (Table 3) could be reproduced from such materials; no data-availability statement or IRB explanation for non-disclosure is included (C9: unsupported, major; reproducibility data concern: critical).
- Multiple load-bearing citations are 2026-dated without DOIs or arXiv identifiers, and the Cheng et al. 2026 Science citation carries anomalous bibliographic metadata that was not independently verifiable from the review input (C11: minor; C14: minor).

## Revision Targets

- [ ] **Manuscript: Introduction (closing paragraph of contributions); Discussion**
  - Location: `corrections/2605.22707/paper.pdf` at `Introduction (closing paragraph of contributions); Discussion`
  - Evidence: The comparative magnitude claim ('just as much or more') is not quantified anywhere; it is asserted as a synthesis of qualitative impressions from one company. The Ethical Considerations section acknowledges 'broader generalizability should be treated with caution,' which contradicts the strength of this framing.
  - Required change: Reconcile the Introduction/Discussion with the Limitations: either reframe as a hypothesis prompted by the data, or quantify via a follow-up survey with sample-size justification.
  - Verification: Re-review should confirm `Introduction (closing paragraph of contributions); Discussion` is corrected or justified.
- [ ] **Manuscript: Tables 2 and 3; 'AI Transformation of Invisible Work' section**
  - Location: `corrections/2605.22707/paper.pdf` at `Tables 2 and 3; 'AI Transformation of Invisible Work' section`
  - Evidence: The counts are stated as outputs of a thematic analysis conducted by the interviewer after a secondary review of ≥80% of transcripts, but the paper ships no codebook, no operational definitions of when a participant 'discussed' a theme, no inter-rater reliability statistics, and no second coder. With a single coder and no anonymized transcripts released, the counts cannot be independently reproduced.
  - Required change: Release a codebook and a tabulation script (e.g., supplement/coding/codebook.md and supplement/coding/theme_counts.py operating on anonymized transcript excerpts) so reviewers can recover Table 3. Report inter-coder agreement (e.g., Cohen's κ) on a subset, or explicitly acknowledge single-coder analysis as a limitation.
  - Verification: Re-review should confirm `Tables 2 and 3; 'AI Transformation of Invisible Work' section` is corrected or justified.
- [ ] **Manuscript: AI Transformation of Invisible Work; Discussion**
  - Location: `corrections/2605.22707/paper.pdf` at `AI Transformation of Invisible Work; Discussion`
  - Evidence: The seven themes emerge inductively from a single-site, single-company convenience sample of 24 participants in three job families. The paper does not justify exhaustiveness (no saturation analysis), nor mutual exclusivity (a participant counted under 'Cross-Discipline Communication' could plausibly also be coded under 'Task Support and Collaboration'). No comparison with the broader CSCW/HCI invisible-work taxonomy (e.g., Cross, Borgatti, Parker 2002) is offered to argue these are *the* seven dimensions rather than seven prominent ones in this sample.
  - Required change: State the analysis as descriptive of this sample rather than definitional; report a saturation curve (themes newly introduced vs. interviews completed) and discuss theme overlap. A supplementary figure supplement/figures/saturation.py is straightforward to produce from coded data.
  - Verification: Re-review should confirm `AI Transformation of Invisible Work; Discussion` is corrected or justified.
- [ ] **Manuscript: Discussion and Conclusion**
  - Location: `corrections/2605.22707/paper.pdf` at `Discussion and Conclusion`
  - Evidence: The study design is observational/interpretive (semi-structured interviews about self-reported changes). It does not include before/after measurement, a non-AI control group, or longitudinal data, so causal language overstates what the data can support. Self-report and recall bias are not discussed as threats.
  - Required change: Reframe causal language as associations or perceptions ('participants attributed X to AI use'), and add a Limitations paragraph on self-report and recall bias, the absence of a comparison group, and confounding by company-level transformation initiatives.
  - Verification: Re-review should confirm `Discussion and Conclusion` is corrected or justified.
- [ ] **Manuscript: Paper-wide; no Code/Data Availability section**
  - Location: `corrections/2605.22707/paper.pdf` at `Paper-wide; no Code/Data Availability section`
  - Evidence: The paper is in a code-amenable field (cs.HC) and ships no executable or reviewable artifact backing its counts and themes. There is no link to a repository, no DOI for materials, and no statement of why data cannot be shared in any anonymized form. By the Proof-as-Code axiom this is treated as evidence of weakness.
  - Required change: Provide a minimal artifact at e.g. supplement/coding/codebook.md, supplement/coding/anonymized_excerpts.jsonl, and supplement/coding/theme_counts.py that regenerates Table 3 from the excerpts. If full transcripts cannot be released for IRB reasons, release the codebook and a per-theme example-quote mapping with participant IDs.
  - Verification: Re-review should confirm `Paper-wide; no Code/Data Availability section` is corrected or justified.
- [ ] **Manuscript: Throughout; e.g., Bhat et al. 2026; Park et al. 2026; Ranjit et al. 2026; Gunasekaran et al. ...**
  - Location: `corrections/2605.22707/paper.pdf` at `Throughout; e.g., Bhat et al. 2026; Park et al. 2026; Ranjit et al. 2026; Gunasekaran et al. 2026; Hadley & Wright 2026; Ehsan et al. 2026; Cheng et al. 2026; Hohn & Loydl 2026; Zhang et al. 2026; Kommers et al. 2026; Kwon et al. 2026; Ranganathan & Ye 2026.`
  - Evidence: Given the submission window (the interviews ran March–April 2026), 2026 venue citations are temporally plausible (CHI 2026 publishes in spring 2026), but the volume of forward-dated and 'in press' items means several load-bearing claims rest on works whose final published forms cannot be independently verified from the input.
  - Required change: For each 2026 citation supporting a non-trivial claim, include a DOI or arXiv id, mark in-press items clearly, and ensure the paraphrased claim survives if a cited 2026 paper changes between accepted manuscript and final version.
  - Verification: Re-review should confirm `Throughout; e.g., Bhat et al. 2026; Park et al. 2026; Ranjit et al. 2026; Gunasekaran et al. 2026; Hadley & Wright 2026; Ehsan et al. 2026; Cheng et al. 2026; Hohn & Loydl 2026; Zhang et al. 2026; Kommers et al. 2026; Kwon et al. 2026; Ranganathan & Ye 2026.` is corrected or justified.

## Open Questions

- Can the authors provide the complete interview instrument (fixed questions and representative follow-up prompts) and a codebook with operational definitions sufficient to recover the per-theme participant counts in Table 3, or explain any IRB or consent constraints that prevent releasing even anonymized materials?
- Were interviews conducted until thematic saturation? If so, can a saturation curve (new themes introduced per interview) be reported, and can the mutual exclusivity of the seven dimensions be addressed—particularly potential overlap between dimensions such as 'Cross-Discipline Communication' and 'Task Support and Collaboration'?
- How do the authors justify the claim that AI is impacting invisible work 'just as much or more than' visible work given the observational design—is this a hypothesis prompted by the data or a conclusion the study can directly support, and how should the framing be revised to align with the Limitations section?
- Would the authors consider reframing causal language (e.g., 'AI is dismantling...') as participant-reported perceptions ('participants attributed X to AI adoption'), and adding explicit Limitations discussion of self-report bias, absence of a pre-AI baseline or control group, and potential confounding by concurrent company-level transformation initiatives?
- Can DOIs or arXiv IDs be supplied for the 2026-dated citations used to support non-trivial claims, and can the Cheng et al. 2026 Science citation (volume 391, article eaec8352) be verified, corrected, or marked as in-press?

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
        "raw": "Institute of Technology,Cambridge, MA.",
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
        "key": "ref5",
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
        "key": "ref6",
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
        "key": "ref7",
        "raw": "European Business Review, 12(2).",
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
        "key": "ref8",
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
        "key": "ref9",
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
        "key": "ref10",
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
        "key": "ref11",
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
        "key": "ref12",
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
        "key": "ref13",
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
        "key": "ref14",
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
        "key": "ref15",
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
        "key": "ref16",
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
        "key": "ref17",
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
        "key": "ref18",
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
        "key": "ref19",
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
        "key": "ref20",
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
        "key": "ref21",
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
        "key": "ref22",
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
        "key": "ref23",
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
        "key": "ref24",
        "raw": "Demerouti, E.; Bakker, A. B.; Nachreiner, F.; and Schaufeli,",
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
        "key": "ref25",
        "raw": "W. B. 2001. The job demands-resources model of burnout. Journal of Applied psychology, 86(3): 499.",
        "title": null,
        "url": null,
        "venue": null,
        "year": null
      },
      "exists": true,
      "explanation": "Deterministic citation verifier result; citation-use agent timed out before relevance analysis.",
      "notes": "resolved via crossref_bibliographic",
      "relevance": "medium",
      "resolved_doi": "10.1037/0021-9010.86.3.499",
      "resolved_url": "https://doi.org/10.1037/0021-9010.86.3.499"
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref26",
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
        "key": "ref27",
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
        "key": "ref28",
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
        "key": "ref29",
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
        "key": "ref30",
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
        "key": "ref31",
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
        "key": "ref32",
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
        "key": "ref33",
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
        "key": "ref34",
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
        "key": "ref35",
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
        "key": "ref36",
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
        "key": "ref37",
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
        "key": "ref38",
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
        "key": "ref39",
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
        "key": "ref40",
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
        "key": "ref41",
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
        "key": "ref42",
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
        "key": "ref43",
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
        "key": "ref44",
        "raw": "Kommers, C.; Duede, E.; Gordon, J.; Holtzman, A.; Mc-",
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
        "key": "ref45",
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
        "key": "ref46",
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
        "key": "ref47",
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
        "key": "ref48",
        "raw": "Laird, M. D.; Perryman, A. A.; Hochwarter, W. A.; Ferris,",
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
        "key": "ref49",
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
    },
    {
      "citation": {
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref50",
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
        "key": "ref51",
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
        "key": "ref52",
        "raw": "Hum.-Comput. Interact., 9(7).",
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
        "key": "ref53",
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
        "key": "ref54",
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
        "key": "ref55",
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
        "key": "ref56",
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
        "key": "ref57",
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
        "key": "ref58",
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
        "key": "ref59",
        "raw": "Niederhoffer, K.; Kellerman, G. R.; Lee, A.; Liebscher, A.;",
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
        "key": "ref62",
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
        "key": "ref63",
        "raw": "Reconfiguration, Efficiency, and Workforce Adaptation. Information, 16(9).",
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
        "key": "ref64",
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
        "key": "ref65",
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
        "key": "ref66",
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
        "key": "ref67",
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
        "key": "ref68",
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
        "key": "ref69",
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
        "key": "ref70",
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
        "key": "ref71",
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
        "key": "ref72",
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
        "key": "ref73",
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
        "key": "ref74",
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
        "key": "ref75",
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
        "key": "ref76",
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
        "key": "ref77",
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
        "key": "ref78",
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
        "key": "ref79",
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
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref80",
        "raw": "Wells, J. E.; and MacAulay, D. ???? What ’Invisible Work’ Looks Like in the 21st Century.",
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
        "arxiv_id": "2509.02853",
        "authors": [],
        "doi": null,
        "key": "ref81",
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
        "key": "ref82",
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
        "key": "ref83",
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
        "key": "ref84",
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
        "arxiv_id": null,
        "authors": [],
        "doi": null,
        "key": "ref85",
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
        "key": "ref86",
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
        "arxiv_id": "2506.12605",
        "authors": [],
        "doi": null,
        "key": "ref87",
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
        "key": "ref88",
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
    }
  ],
  "missing_references": [],
  "summary": "Citation-use agent failed before producing a normal citation relevance review. Deterministic citation verification still runs separately; see external citation checks and verifier provenance for existence, DOI, URL, and resolver evidence. Failure: CliRunner parse/validate failure after corrective retry for role citation: first=not valid JSON: EOF while parsing a value at line 1 column 0; raw=\"\"; retry=not valid JSON: EOF while parsing a value at line 1 column 0; raw=\"\" Deterministic citation verifier checked 88 bibliography entries."
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.7,
  "questions": [
    "Can the authors provide the complete interview instrument (fixed questions and representative follow-up prompts) and a codebook with operational definitions sufficient to recover the per-theme participant counts in Table 3, or explain any IRB or consent constraints that prevent releasing even anonymized materials?",
    "Were interviews conducted until thematic saturation? If so, can a saturation curve (new themes introduced per interview) be reported, and can the mutual exclusivity of the seven dimensions be addressed—particularly potential overlap between dimensions such as 'Cross-Discipline Communication' and 'Task Support and Collaboration'?",
    "How do the authors justify the claim that AI is impacting invisible work 'just as much or more than' visible work given the observational design—is this a hypothesis prompted by the data or a conclusion the study can directly support, and how should the framing be revised to align with the Limitations section?",
    "Would the authors consider reframing causal language (e.g., 'AI is dismantling...') as participant-reported perceptions ('participants attributed X to AI adoption'), and adding explicit Limitations discussion of self-report bias, absence of a pre-AI baseline or control group, and potential confounding by concurrent company-level transformation initiatives?",
    "Can DOIs or arXiv IDs be supplied for the 2026-dated citations used to support non-trivial claims, and can the Cheng et al. 2026 Science citation (volume 391, article eaec8352) be verified, corrected, or marked as in-press?"
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "The comparative magnitude claim ('just as much or more') is not quantified anywhere; it is asserted as a synthesis of qualitative impressions from one company. The Ethical Considerations section acknowledges 'broader generalizability should be treated with caution,' which contradicts the strength of this framing.",
      "id": "weakness-1",
      "locator": "Introduction (closing paragraph of contributions); Discussion",
      "required_update": "Reconcile the Introduction/Discussion with the Limitations: either reframe as a hypothesis prompted by the data, or quantify via a follow-up survey with sample-size justification.",
      "source_path": "corrections/2605.22707/paper.pdf",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Introduction (closing paragraph of contributions); Discussion` is corrected or justified.",
      "weakness_index": 0
    },
    {
      "evidence": "The counts are stated as outputs of a thematic analysis conducted by the interviewer after a secondary review of ≥80% of transcripts, but the paper ships no codebook, no operational definitions of when a participant 'discussed' a theme, no inter-rater reliability statistics, and no second coder. With a single coder and no anonymized transcripts released, the counts cannot be independently reproduced.",
      "id": "weakness-2",
      "locator": "Tables 2 and 3; 'AI Transformation of Invisible Work' section",
      "required_update": "Release a codebook and a tabulation script (e.g., supplement/coding/codebook.md and supplement/coding/theme_counts.py operating on anonymized transcript excerpts) so reviewers can recover Table 3. Report inter-coder agreement (e.g., Cohen's κ) on a subset, or explicitly acknowledge single-coder analysis as a limitation.",
      "source_path": "corrections/2605.22707/paper.pdf",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Tables 2 and 3; 'AI Transformation of Invisible Work' section` is corrected or justified.",
      "weakness_index": 1
    },
    {
      "evidence": "The seven themes emerge inductively from a single-site, single-company convenience sample of 24 participants in three job families. The paper does not justify exhaustiveness (no saturation analysis), nor mutual exclusivity (a participant counted under 'Cross-Discipline Communication' could plausibly also be coded under 'Task Support and Collaboration'). No comparison with the broader CSCW/HCI invisible-work taxonomy (e.g., Cross, Borgatti, Parker 2002) is offered to argue these are *the* seven dimensions rather than seven prominent ones in this sample.",
      "id": "weakness-3",
      "locator": "AI Transformation of Invisible Work; Discussion",
      "required_update": "State the analysis as descriptive of this sample rather than definitional; report a saturation curve (themes newly introduced vs. interviews completed) and discuss theme overlap. A supplementary figure supplement/figures/saturation.py is straightforward to produce from coded data.",
      "source_path": "corrections/2605.22707/paper.pdf",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `AI Transformation of Invisible Work; Discussion` is corrected or justified.",
      "weakness_index": 2
    },
    {
      "evidence": "The study design is observational/interpretive (semi-structured interviews about self-reported changes). It does not include before/after measurement, a non-AI control group, or longitudinal data, so causal language overstates what the data can support. Self-report and recall bias are not discussed as threats.",
      "id": "weakness-4",
      "locator": "Discussion and Conclusion",
      "required_update": "Reframe causal language as associations or perceptions ('participants attributed X to AI use'), and add a Limitations paragraph on self-report and recall bias, the absence of a comparison group, and confounding by company-level transformation initiatives.",
      "source_path": "corrections/2605.22707/paper.pdf",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Discussion and Conclusion` is corrected or justified.",
      "weakness_index": 3
    },
    {
      "evidence": "The paper is in a code-amenable field (cs.HC) and ships no executable or reviewable artifact backing its counts and themes. There is no link to a repository, no DOI for materials, and no statement of why data cannot be shared in any anonymized form. By the Proof-as-Code axiom this is treated as evidence of weakness.",
      "id": "weakness-5",
      "locator": "Paper-wide; no Code/Data Availability section",
      "required_update": "Provide a minimal artifact at e.g. supplement/coding/codebook.md, supplement/coding/anonymized_excerpts.jsonl, and supplement/coding/theme_counts.py that regenerates Table 3 from the excerpts. If full transcripts cannot be released for IRB reasons, release the codebook and a per-theme example-quote mapping with participant IDs.",
      "source_path": "corrections/2605.22707/paper.pdf",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Paper-wide; no Code/Data Availability section` is corrected or justified.",
      "weakness_index": 4
    },
    {
      "evidence": "Given the submission window (the interviews ran March–April 2026), 2026 venue citations are temporally plausible (CHI 2026 publishes in spring 2026), but the volume of forward-dated and 'in press' items means several load-bearing claims rest on works whose final published forms cannot be independently verified from the input.",
      "id": "weakness-6",
      "locator": "Throughout; e.g., Bhat et al. 2026; Park et al. 2026; Ranjit et al. 2026; Gunasekaran et al. 2026; Hadley & Wright 2026; Ehsan et al. 2026; Cheng et al. 2026; Hohn & Loydl 2026; Zhang et al. 2026; Kommers et al. 2026; Kwon et al. 2026; Ranganathan & Ye 2026.",
      "required_update": "For each 2026 citation supporting a non-trivial claim, include a DOI or arXiv id, mark in-press items clearly, and ensure the paraphrased claim survives if a cited 2026 paper changes between accepted manuscript and final version.",
      "source_path": "corrections/2605.22707/paper.pdf",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Throughout; e.g., Bhat et al. 2026; Park et al. 2026; Ranjit et al. 2026; Gunasekaran et al. 2026; Hadley & Wright 2026; Ehsan et al. 2026; Cheng et al. 2026; Hohn & Loydl 2026; Zhang et al. 2026; Kommers et al. 2026; Kwon et al. 2026; Ranganathan & Ye 2026.` is corrected or justified.",
      "weakness_index": 5
    }
  ],
  "strengths": [
    "The paper addresses a genuinely underexplored dimension of AI's organizational impact—informal and invisible work—filling a gap in the CHI/CSCW literature that has focused primarily on task-level productivity effects.",
    "The seven-theme taxonomy yields concrete, actionable recommendations for organizations, managers, and individuals, making findings accessible beyond academic audiences.",
    "Participant sampling is internally consistent and gender-balanced across three job families, as verified by Table 1 arithmetic (C1, C5, C10: all supported by the technical correctness reviewer).",
    "The paper situates its findings within an appropriate body of literature on informal organizational networks, peer learning, and AI-assisted productivity, with several citations confirmed well-matched to their paraphrased claims (C4, C13: supported).",
    "The identification of a dual effect—AI enabling professional independence while simultaneously eroding the relational infrastructure of career development and mentorship—is a coherent and practically significant theoretical framing."
  ],
  "summary": "This paper makes a timely contribution by examining AI's impact on informal workplace practices—so-called invisible work—across seven thematic dimensions, drawn from 24 semi-structured interviews at a single large technology company. The technical correctness reviewer (confidence 0.72, overall: mostly_sound) and the reproducibility reviewer (confidence 0.87, score 0.22) together identify a cluster of major and critical concerns that prevent acceptance in the current form. Five major-severity technical issues were flagged: the thematic participant counts in Table 3 cannot be independently verified without a codebook or inter-rater reliability data (C2); the seven dimensions are framed as canonical without a saturation analysis or mutual-exclusivity argument (C6); generalization language in the Introduction and Discussion overstates what a single-site, 24-person observational study can support (C7, C8); causal language is used where the data support only participant-reported associations (C15); and no proof-as-code or supplementary analysis artifacts are provided for a cs.HC study whose load-bearing quantitative outputs could be reproduced from such materials (C9—unsupported, major). The reproducibility reviewer independently flagged the absence of any transcript corpus, interview instrument, or qualitative analysis protocol, with the missing data corpus rated critical severity. The paper falls within cs.HC, a code-amenable field, and the missing proof-as-code artifact (C9) triggers the recommendation gate: major_revision is the default. The novelty and citation specialist agents both failed to produce assessments (confidence 0.0 each); those dimensions remain unresolved and should be addressed in resubmission.",
  "weaknesses": [
    "The single-company, 24-participant convenience sample does not support the broad generalization claims made in the Introduction and Discussion (e.g., 'AI is impacting invisible work just as much or more than visible work'); the Ethical Considerations section's acknowledgment of constrained generalizability is not consistently honored throughout the paper (C7: major; C8: minor).",
    "No codebook, inter-coder agreement statistic, or operational definition of theme membership is provided, making the participant counts in Table 3 independently unverifiable by any reviewer (C2: major; reproducibility evaluation concern: major).",
    "The seven thematic dimensions are presented as a canonical decomposition of AI's effect on invisible work without a saturation analysis or mutual-exclusivity argument, leaving open whether they are exhaustive of the domain or characteristic of this particular sample (C6: major).",
    "Causal language throughout the Discussion and Conclusion (e.g., 'AI is dismantling the existing mechanisms that drive productivity') overstates what a cross-sectional, self-report observational study can support; self-report and recall bias, the absence of a comparison group, and confounding by concurrent organizational change are not discussed as limitations (C15: major).",
    "No anonymized transcript corpus, complete interview instrument, codebook, or analysis scripts are provided for a cs.HC empirical study whose load-bearing outputs (Table 3) could be reproduced from such materials; no data-availability statement or IRB explanation for non-disclosure is included (C9: unsupported, major; reproducibility data concern: critical).",
    "Multiple load-bearing citations are 2026-dated without DOIs or arXiv identifiers, and the Cheng et al. 2026 Science citation carries anomalous bibliographic metadata that was not independently verifiable from the review input (C11: minor; C14: minor)."
  ]
}
```

### novelty (`gemini-3-flash-preview`) — status: `pass`

```json
{
  "confidence": 0.0,
  "missing_prior_art": [
    {
      "reason": "Automated novelty review failed before producing a normal prior-art assessment. Failure: CliRunner parse/validate failure after corrective retry for role novelty: first=not valid JSON: EOF while parsing a value at line 1 column 0; raw=\"\"; retry=not valid JSON: EOF while parsing a value at line 1 column 0; raw=\"\"",
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
      "description": "The empirical findings depend on 24 internal interview transcripts/notes, but no transcript corpus, anonymized dataset, excerpt table, or data-access procedure is provided; exact reanalysis of the main themes is therefore not possible.",
      "severity": "critical"
    },
    {
      "area": "evaluation",
      "description": "The paper states that transcripts were analyzed for common themes, but does not provide a reproducible qualitative analysis protocol such as a codebook, coding assignments, adjudication process, inter-rater agreement, or audit trail.",
      "severity": "major"
    },
    {
      "area": "evaluation",
      "description": "The fixed interview questions and any optional follow-up prompts are not provided as a complete instrument, limiting independent replication of the study design.",
      "severity": "major"
    },
    {
      "area": "data",
      "description": "Participants were recruited from a single large technology firm through internal channels, and the sampling frame and company context are not publicly reproducible beyond the reported role and gender counts.",
      "severity": "major"
    },
    {
      "area": "code",
      "description": "No repository, scripts, notebooks, or archived analysis artifacts are supplied for any transcript processing, theme aggregation, or table generation; no license or pinned version is available.",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "The transcription setup is described only as built-in video-chat transcription for 22 interviews and manual notes for 2 interviews; the specific tool, version, settings, and transcript-cleaning procedure are not specified.",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://www.circles.com/resources/invisible-labor-atwork-what-it-is-and-how-to-address-it` (status=404)",
      "severity": "minor"
    }
  ],
  "confidence": 0.87,
  "data_availability": "private",
  "data_url": null,
  "environment": {
    "dependencies": [],
    "hardware": null,
    "software": "Video-chat interviews with built-in transcription for 22 participants and manual notes for 2 participants; no specific tool, version, or analysis software is specified."
  },
  "reproducibility_score": 0.22
}
```

### summary (`claude-haiku-4-5-20251001`) — status: `pass`

```json
{
  "audience": "Managers and leaders at technology companies, HR professionals, organizational psychologists and researchers, anyone concerned with workplace culture and employee well-being in AI-forward organizations",
  "key_contributions": [
    "AI adoption is transforming invisible work (informal support, mentoring, collaboration) as significantly as visible work, impacting workers' career growth and well-being",
    "Identified seven dimensions of how AI is changing invisible work: cross-discipline communication, role clarity and division of labor, situational awareness, reputation and accountability, personal growth and learning, instructional support and feedback, and task support and collaboration",
    "Workers using AI for independent support risk losing professional networks and informal mentoring relationships critical for career advancement and organizational learning",
    "Proposed concrete steps for AI companies, leaders, and individuals to preserve human connection and professional support systems while leveraging AI's productivity benefits"
  ],
  "plain_language_summary": "AI is changing how professionals work together—not just by making individual tasks faster, but by transforming the informal work that holds teams together. Researchers from Microsoft interviewed 24 product-focused professionals at a large technology company to understand how AI has affected their daily work, team collaboration, and career development. They found that AI is changing seven key areas of invisible work (the mentoring, feedback-giving, and relationship-building that typically goes unrecognized but is essential for healthy organizations). For example, AI helps designers and engineers communicate better through shared prototypes, but it also blurs job roles and creates anxiety about whether certain positions will still be needed. AI tools let people write faster and learn new skills independently, but people are increasingly turning to AI instead of colleagues for feedback.\n\nThe benefits are real: workers feel more empowered and productive, collaboration across different disciplines is smoother, and people can develop new skills without waiting for human input. But there are significant risks. As workers rely more on AI for support—advice, feedback, and help with tasks—they are losing the informal professional networks that are critical for learning their jobs well and for advancing their careers. Some workers report feeling socially isolated or concerned that mentorship and informal knowledge-sharing are disappearing. Workers also report that as they delegate tasks to AI, they lose opportunities to build relationships and professional reputation with colleagues, which traditionally have been pathways to career growth.\n\nThe authors conclude that companies need to intentionally protect informal practices while leveraging AI's benefits. They propose concrete steps that organizations, managers, and individuals can take to maintain human connection and support during AI transformation—such as creating intentional spaces for mentoring and feedback, making invisible work more visible and valued, and designing AI systems that encourage rather than discourage human collaboration.",
  "tldr": "A study of 24 professionals reveals that AI adoption is transforming informal workplace practices like mentoring and feedback, increasing productivity but risking social isolation and career development."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `warn`

```json
{
  "claims": [
    {
      "assessment": "supported",
      "claim": "24 participants were interviewed, distributed as 7 Design (4M/3F), 7 User Research (4M/3F), and 10 Applied/Data Science (5M/5F).",
      "evidence": "Arithmetic of Table 1 sums to 24 (7+7+10), matching the stated total. Gender counts within each row also sum correctly (4+3=7, 4+3=7, 5+5=10).",
      "id": "C1",
      "location": "Table 1; Participants section",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Seven thematic dimensions of AI impact on invisible work were identified, with per-theme participant counts of 14, 14, 14, 13, 11, 11, 10.",
      "evidence": "The counts are stated as outputs of a thematic analysis conducted by the interviewer after a secondary review of ≥80% of transcripts, but the paper ships no codebook, no operational definitions of when a participant 'discussed' a theme, no inter-rater reliability statistics, and no second coder. With a single coder and no anonymized transcripts released, the counts cannot be independently reproduced.",
      "id": "C2",
      "location": "Tables 2 and 3; 'AI Transformation of Invisible Work' section",
      "severity": "major",
      "suggested_fix": "Release a codebook and a tabulation script (e.g., supplement/coding/codebook.md and supplement/coding/theme_counts.py operating on anonymized transcript excerpts) so reviewers can recover Table 3. Report inter-coder agreement (e.g., Cohen's κ) on a subset, or explicitly acknowledge single-coder analysis as a limitation."
    },
    {
      "assessment": "partially_supported",
      "claim": "Agents could complete tasks ~90% faster than humans on the same set of 16 tasks (Wang et al. 2025).",
      "evidence": "The cited preprint (arXiv:2510.22780) compares AI and human workflows across occupations, but the '~90% faster on 16 tasks' framing is a tight, specific numeric claim whose phrasing is not directly quoted from the abstract supplied in the bibliography and cannot be confirmed from the review_input alone. The paper does not include a verified fact block for this statistic.",
      "id": "C3",
      "location": "Introduction, paragraph beginning 'The rapid integration of artificial intelligence...'",
      "severity": "minor",
      "suggested_fix": "Quote the original statistic verbatim with the specific task set and time-comparison methodology (e.g., 'medians across 16 occupational task workflows'), or weaken to a qualitative phrasing if the precise 90%/16-task figure is not stated in the cited source."
    },
    {
      "assessment": "supported",
      "claim": "A large-scale study of over 5000 customer support specialists found AI-assisted workers completed more tasks, delivered higher-quality outputs, and worked faster (Brynjolfsson, Li, and Raymond 2025).",
      "evidence": "Citation matches the well-known QJE 2025 paper on generative AI at work, whose headline findings are consistent with the paraphrase.",
      "id": "C4",
      "location": "Introduction",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "supported",
      "claim": "Twenty-two of the 24 participants agreed to AI transcription; for the other two the interviewer took notes manually.",
      "evidence": "Counts are internally consistent (22 transcribed + 2 hand-noted = 24).",
      "id": "C5",
      "location": "Data Collection section; footnote 1",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "The thematic analysis identifies seven impact areas as the canonical decomposition of AI's effect on invisible work.",
      "evidence": "The seven themes emerge inductively from a single-site, single-company convenience sample of 24 participants in three job families. The paper does not justify exhaustiveness (no saturation analysis), nor mutual exclusivity (a participant counted under 'Cross-Discipline Communication' could plausibly also be coded under 'Task Support and Collaboration'). No comparison with the broader CSCW/HCI invisible-work taxonomy (e.g., Cross, Borgatti, Parker 2002) is offered to argue these are *the* seven dimensions rather than seven prominent ones in this sample.",
      "id": "C6",
      "location": "AI Transformation of Invisible Work; Discussion",
      "severity": "major",
      "suggested_fix": "State the analysis as descriptive of this sample rather than definitional; report a saturation curve (themes newly introduced vs. interviews completed) and discuss theme overlap. A supplementary figure supplement/figures/saturation.py is straightforward to produce from coded data."
    },
    {
      "assessment": "partially_supported",
      "claim": "Findings generalize to broader claims about organizational culture, e.g., 'AI is impacting the invisible work just as much or more than the visible work.'",
      "evidence": "The comparative magnitude claim ('just as much or more') is not quantified anywhere; it is asserted as a synthesis of qualitative impressions from one company. The Ethical Considerations section acknowledges 'broader generalizability should be treated with caution,' which contradicts the strength of this framing.",
      "id": "C7",
      "location": "Introduction (closing paragraph of contributions); Discussion",
      "severity": "major",
      "suggested_fix": "Reconcile the Introduction/Discussion with the Limitations: either reframe as a hypothesis prompted by the data, or quantify via a follow-up survey with sample-size justification."
    },
    {
      "assessment": "partially_supported",
      "claim": "Single-site, single-company sample at 'a large AI-first technology company' supports conclusions about 'AI companies' and organizations broadly.",
      "evidence": "All 24 participants are at one firm with one organizational culture and one AI tooling stack. External validity to other firms is asserted rather than triangulated against, e.g., the cited Nahar et al. 2025 or Choudhuri et al. 2025 multi-site studies. The Limitations note constrains this but Discussion claims do not consistently honor the constraint.",
      "id": "C8",
      "location": "Throughout; explicit in Discussion ('AI is empowering people to be independent at work and, at the same time, is dismantling the existing mechanisms...').",
      "severity": "minor",
      "suggested_fix": "Triangulate at least one signature finding (e.g., the help/feedback erosion theme) with prior multi-site results, or restrict each Discussion claim to 'within this firm.'"
    },
    {
      "assessment": "unsupported",
      "claim": "Reproducibility/proof artifacts (anonymized transcripts, coding rubric, counting script) are not provided for a cs.HC empirical study whose load-bearing numbers (Table 3) could be reproduced from such an artifact.",
      "evidence": "The paper is in a code-amenable field (cs.HC) and ships no executable or reviewable artifact backing its counts and themes. There is no link to a repository, no DOI for materials, and no statement of why data cannot be shared in any anonymized form. By the Proof-as-Code axiom this is treated as evidence of weakness.",
      "id": "C9",
      "location": "Paper-wide; no Code/Data Availability section",
      "severity": "major",
      "suggested_fix": "Provide a minimal artifact at e.g. supplement/coding/codebook.md, supplement/coding/anonymized_excerpts.jsonl, and supplement/coding/theme_counts.py that regenerates Table 3 from the excerpts. If full transcripts cannot be released for IRB reasons, release the codebook and a per-theme example-quote mapping with participant IDs."
    },
    {
      "assessment": "supported",
      "claim": "Four participants self-reported as 'avid AI users' and one as 'particularly pessimistic'; three were managers.",
      "evidence": "Specific counts stated; consistent with sample of 24.",
      "id": "C10",
      "location": "Participants section",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Sycophancy in AI has been shown to be harmful to judgments and decision-making (Cheng et al. 2026, Science 391(6792): eaec8352).",
      "evidence": "The substantive direction (sycophancy harms decisions) is plausible and consistent with publicly documented findings on sycophancy. However, the bibliographic metadata — Science volume 391 issue 6792 with a 2026 date and DOI-like article id 'eaec8352' — is not independently verifiable from the input and looks anomalous relative to Science's normal volume cadence; this should be checked.",
      "id": "C11",
      "location": "Section 7 (Task Support and Collaboration)",
      "severity": "minor",
      "suggested_fix": "Verify and correct the Science citation (volume, issue, article id, year). If the article is in press, mark it as such."
    },
    {
      "assessment": "partially_supported",
      "claim": "The secondary review of transcripts (with 'themes around institutional knowledge and help/feedback' emerging later) yielded the analytic categories used in Table 2.",
      "evidence": "Procedure is described qualitatively (single interviewer + secondary review after ≥80% of interviews) but lacks methodological detail typical of CHI-style thematic analyses: no explicit method label (e.g., Braun & Clarke reflexive TA), no statement on how many passes, and no documentation of how disagreements (if any) between primary and secondary tagging were resolved.",
      "id": "C12",
      "location": "Transcript Analysis section",
      "severity": "minor",
      "suggested_fix": "Name the analytic framework, describe the number of coding passes, and document divergences between primary and secondary tagging. If only one analyst coded, state this explicitly."
    },
    {
      "assessment": "supported",
      "claim": "'Past research has shown that relationships with peers are critical for obtaining information (Krackhardt and Hanson 1993), learning to perform one's job (Mitschelen and Kauffeld 2025), and collectively solving complex tasks (Kahn 1990).'",
      "evidence": "Citations align with established literature on informal networks, workplace onboarding, and engagement. No internal inconsistencies.",
      "id": "C13",
      "location": "Section 6 (Instructional Support and Feedback)",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Heavy reliance on multiple future-dated (2026) citations as load-bearing evidence for current claims.",
      "evidence": "Given the submission window (the interviews ran March–April 2026), 2026 venue citations are temporally plausible (CHI 2026 publishes in spring 2026), but the volume of forward-dated and 'in press' items means several load-bearing claims rest on works whose final published forms cannot be independently verified from the input.",
      "id": "C14",
      "location": "Throughout; e.g., Bhat et al. 2026; Park et al. 2026; Ranjit et al. 2026; Gunasekaran et al. 2026; Hadley & Wright 2026; Ehsan et al. 2026; Cheng et al. 2026; Hohn & Loydl 2026; Zhang et al. 2026; Kommers et al. 2026; Kwon et al. 2026; Ranganathan & Ye 2026.",
      "severity": "minor",
      "suggested_fix": "For each 2026 citation supporting a non-trivial claim, include a DOI or arXiv id, mark in-press items clearly, and ensure the paraphrased claim survives if a cited 2026 paper changes between accepted manuscript and final version."
    },
    {
      "assessment": "partially_supported",
      "claim": "Implicit causal claims that AI use *causes* changes in invisible work (e.g., 'AI is dismantling the existing mechanisms... that drive productivity').",
      "evidence": "The study design is observational/interpretive (semi-structured interviews about self-reported changes). It does not include before/after measurement, a non-AI control group, or longitudinal data, so causal language overstates what the data can support. Self-report and recall bias are not discussed as threats.",
      "id": "C15",
      "location": "Discussion and Conclusion",
      "severity": "major",
      "suggested_fix": "Reframe causal language as associations or perceptions ('participants attributed X to AI use'), and add a Limitations paragraph on self-report and recall bias, the absence of a comparison group, and confounding by company-level transformation initiatives."
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

1. Abbas, T.; Rathore, S. A.; Turki, A.; Khan, S.; Alghushairy, O.; and Daud, A. 2025. Enhancing Software Engineering With AI: Innovations, Challenges, and Future Directions. IET Software, 2025(1): 5691460.
2. Alam, A. 2023. Harnessing the power of AI to create intelligent tutoring systems for enhanced classroom experience and improved learning outcomes. In Intelligent communication technologies and virtual mobile networks, 571–591. Springer.
3. Allen, T. J. 1977. Managing the flow of technology: technology transfer and the dissemination of technological information within the R and D organization. Massachusetts
4. Institute of Technology,Cambridge, MA.
5. Bakker, A. B.; and Demerouti, E. 2017. Job demands– resources theory: Taking stock and looking forward. Journal of occupational health psychology, 22(3): 273.
6. Baksa, M.; and Branyiczki, I. 2023. Invisible Foundations of Collaboration in the Workplace: A Multiplex Network Approach to Advice Seeking and Knowledge Sharing. Central
7. European Business Review, 12(2).
8. Barke, S.; James, M. B.; and Polikarpova, N. 2023. Grounded copilot: How programmers interact with codegenerating models. Proceedings of the ACM on Programming Languages, 7(OOPSLA1): 85–111.
9. Bhat, A.; Aubin Le Qu´er´e, M.; Naaman, M.; and Jakesch, M. 2026. Reactive Writers: How Co-Writing with AI Changes How We Engage with Ideas. In Proceedings of the 2026 CHI Conference on Human Factors in Computing Systems, 1–21.
10. Borgatti; and Cross. 2003. A Relational View of Information Seeking and Learning in Social Networks. 49.
11. Brown, J. S.; and Duguid, P. 1991. Organizational Learning and Communities-of-Practice: Toward a Unified View of Working, Learning, and Innovation. Organization Science, 2(1): 40–57.
12. Brynjolfsson, E.; Li, D.; and Raymond, L. 2025. Generative AI at work. The Quarterly Journal of Economics, 140(2): 889–942.
13. Butler, J.; Suh, J.; Haniyur, S.; and Hadley, C. 2025. Dear Diary: A randomized controlled trial of Generative AI coding tools in the workplace. In 2025 IEEE/ACM 47th International Conference on Software Engineering: Software Engineering in Practice (ICSE-SEIP), 319–329. IEEE.
14. Campbell, B. 2021. Alone Together: Why We Expect More from Technology and Less from Each Other. Journal of Interdisciplinary Studies, 33(1-2): 196–199.
15. Chang, P.-C.; Zhang, W.; Cai, Q.; and Guo, H. 2024. Does AI-driven technostress promote or hinder employees’ artificial intelligence adoption intention? A moderated mediation model of affective reactions and technical self-efficacy. Psychology Research and Behavior Management, 413–427.
16. Cheng, M.; Lee, C.; Khadpe, P.; Yu, S.; Han, D.; and Jurafsky, D. 2026. Sycophantic AI decreases prosocial intentions and promotes dependence. Science, 391(6792): eaec8352.
17. Choudhuri, R.; Badea, C.; Bird, C.; Butler, J.; DeLine, R.; and Houck, B. 2025. AI Where It Matters: Where, Why, and How Developers Want AI Support in Daily Work. arXiv preprint arXiv:2510.00762. arXiv:[2510.00762](https://arxiv.org/abs/2510.00762)
18. Cohen, S.; and Wills, T. A. 1985. Stress, social support, and the buffering hypothesis. Psychological bulletin, 98(2): 310.
19. Cranefield, J.; Yoong, P.; and Huff, S. L. 2015. Rethinking lurking: Invisible leading and following in a knowledge transfer ecosystem. Journal of the Association for Information Systems, 16(4): 3.
20. Cross, R.; Borgatti, S. P.; and Parker, A. 2002. Making invisible work visible: Using social network analysis to support strategic collaboration. California management review, 44(2): 25–46.
21. Cross, R. L.; and Parker, A. 2004. The hidden power of social networks: Understanding how work really gets done in organizations. Harvard Business Press.
22. Daniels, A. K. 1987. Invisible Work. Social Problems, 34(5): 403–415.
23. De Laat, M.; and Schreurs, B. 2013. Visualizing informal professional development networks: Building a case for learning analytics in the workplace. American Behavioral Scientist, 57(10): 1421–1438.
24. Demerouti, E.; Bakker, A. B.; Nachreiner, F.; and Schaufeli,
25. W. B. 2001. The job demands-resources model of burnout. Journal of Applied psychology, 86(3): 499.
26. Ehsan, U.; Passi, S.; Saha, K.; McNutt, T.; Riedl, M. O.; and Alcorn, S. 2026. From Future of Work to Future of Workers: Addressing Asymptomatic AI Harms to Foster Dignified Human-AI Interaction. In Proceedings of the 2026 CHI Conference on Human Factors in Computing Systems, 1–21.
27. Farmer, N. 2017. The invisible organization: How informal networks can lead organizational change. Routledge.
28. Fawzy, A.; Tahir, A.; and Blincoe, K. 2025. Vibe Coding in Practice: Motivations, Challenges, and a Future Outlook–a Grey Literature Review. arXiv preprint arXiv:2510.00328. arXiv:[2510.00328](https://arxiv.org/abs/2510.00328)
29. Fr¨og´eli, E.; Jenner, B.; and Gustavsson, P. 2023. Effectiveness of formal onboarding for facilitating organizational socialization: A systematic review. PloS one, 18(2): e0281823.
30. Gil-Garcia, J. R.; Guler, A.; Pardo, T. A.; and Burke, G. B. 2019. Characterizing the importance of clarity of roles and responsibilities in government inter-organizational collaboration and information sharing initiatives. Government Information Quarterly, 36(4): 101393.
31. Goerisch, D.; Basiliere, J.; Rosener, A.; McKee, K.; Hunt, J.; and Parker, T. M. 2019. Mentoring with: reimagining mentoring across the university. Gender, Place & Culture, 26(12): 1740–1758.
32. Granovetter, M. S. 1973. The Strength of Weak Ties. American Journal of Sociology, 78(6): 1360–1380.
33. Gunasekaran, T. S.; Lim, S.; Gupta, K.; Bai, H.; Pai, Y. S.; and Billinghurst, M. 2026. Cognitive Bridge: AI-Generated Boundary Objects for Cross-Functional Collaboration. In
34. Proceedings of the 2026 CHI Conference on Human Factors in Computing Systems, 1–35.
35. Hadley, C. N.; and Wright, S. L. 2024. We’re Still Lonely at Work. Harvard Business Review, 103(11-12): 68–77.
36. Hadley, C. N.; and Wright, S. L. 2026. Employees Are Relying on AI for Personal Support. That’s Risky. Harvard Business Review.
37. Harris, J. I.; Winskowski, A. M.; and Engdahl, B. E. 2007. Types of workplace social support in the prediction of job satisfaction. The career development quarterly, 56(2): 150–
38. Hatton, E. 2017. Mechanisms of invisibility: rethinking the concept of invisible work. Work, employment and society, 31(2): 336–351.
39. Higgins, M. C.; and Kram, K. E. 2001. Reconceptualizing mentoring at work: A developmental network perspective. Academy of management review, 26(2): 264–288.
40. Hohn, C.; and Loydl, K. 2026. Vibe Coding: intention instead of implementation: How UX professionals build, evaluate, and hand over functional prototypes with AI. i-com, (0).
41. House, J.; and Kahn, R. 1985. Measures and concepts of social support. Cohen, S. Syme, S.L. (Eds.) Social support and health, 83–108.
42. House, J. S. 1983. Work stress and social support. Addison- Wesley series on occupational stress.
43. Kahn, W. A. 1990. Psychological conditions of personal engagement and disengagement at work. Academy of management journal, 33(4): 692–724.
44. Kommers, C.; Duede, E.; Gordon, J.; Holtzman, A.; Mc-
45. Nulty, T.; Stewart, S.; Thomas, L.; Jean So, R.; and Long, H. 2026. Why slop matters. ACM AI Letters, 1(1): 1–6.
46. Krackhardt, D.; and Hanson, J. R. 1993. Informal networks. Harvard business review, 71(4): 104–111.
47. Kwon, H.; Oh, J.; Lee, S.; Lee, S.; and Lee, S. 2026. Investigating AI-induced Technostress and Coping Strategies of Professionals. In Proceedings of the 2026 CHI Conference on Human Factors in Computing Systems, 1–16.
48. Laird, M. D.; Perryman, A. A.; Hochwarter, W. A.; Ferris,
49. G. R.; and Zinko, R. 2009. The moderating effects of personal reputation on accountability-strain relationships. Journal of occupational health psychology, 14(1): 70.
50. Li, C.; Zhang, Y.; Niu, X.; Chen, F.; and Zhou, H. 2023. Does artificial intelligence promote or inhibit on-the-job learning? Human reactions to AI at work. Systems, 11(3):
51. Mendel, T.; Mandal, S.; Nov, O.; and Wiesenfeld, B. M. 2025. Who is Responsible, the Advisor or the AI? Understanding the Effects of Advisors Disclosing Their AI Use on Their Perceived Responsibility and AI Reliance. Proc. ACM
52. Hum.-Comput. Interact., 9(7).
53. Meske, C.; Hermanns, T.; Von der Weiden, E.; Loser, K.-U.; and Berger, T. 2025. Vibe coding as a reconfiguration of intent mediation in software development: Definition, implications, and research agenda. IEEE Access, 13: 213242– 213259.
54. Mitschelen, A.; and Kauffeld, S. 2025. Workplace learning during organizational onboarding: integrating formal, informal, and self-regulated workplace learning. Frontiers in Organizational Psychology, 3: 1569098.
55. Moreland, R. L. 1996. Socially shared cognition at work : Transactive memory and group performance. What’s So Social About Social Cognition? : Social Cognition Research in Small Groups, 57–84.
56. Nahar, N.; K¨astner, C.; Butler, J.; Parnin, C.; Zimmermann, T.; and Bird, C. 2025. Beyond the comfort zone: Emerging solutions to overcome challenges in integrating llms into software products. In 2025 IEEE/ACM 47th International Conference on Software Engineering: Software Engineering in Practice (ICSE-SEIP), 516–527. IEEE.
57. Nass, C.; and Moon, Y. 2000. Machines and mindlessness: Social responses to computers. Journal of social issues, 56(1): 81–103.
58. Ng, T. W.; and Sorensen, K. L. 2008. Toward a further understanding of the relationships between perceptions of support and work attitudes: A meta-analysis. Group & Organization Management, 33(3): 243–268.
59. Niederhoffer, K.; Kellerman, G. R.; Lee, A.; Liebscher, A.;
60. Rapuano, K.; and Hancock, J. T. 2025. AI-generated “workslop” is destroying productivity. Harvard Business Review.
61. Nwana, H. S. 1990. Intelligent tutoring systems: an overview. Artificial Intelligence Review, 4(4): 251–277.
62. Oliveira, P.; Carvalho, J. M. S.; and Faria, S. 2025. AI Integration in Organisational Workflows: A Case Study on Job
63. Reconfiguration, Efficiency, and Workforce Adaptation. Information, 16(9).
64. Park, Y. S.; Arvi, N. A. P.; Kim, S.; and Kim, J. 2026. Authorship Drift: How Self-Efficacy and Trust Evolve During LLM-Assisted Writing. In Proceedings of the 2026 CHI Conference on Human Factors in Computing Systems, 1–18.
65. Pelau, C.; Dabija, D.-C.; and Ene, I. 2021. What makes an AI device human-like? The role of interaction quality, empathy and perceived psychological anthropomorphic characteristics in the acceptance of artificial intelligence in the service industry. Computers in Human Behavior, 122: 106855.
66. Pereira, V.; Hadjielias, E.; Christofi, M.; and Vrontis, D. 2023. A systematic literature review on the impact of artificial intelligence on workplace outcomes: A multi-process perspective. Human Resource Management Review, 33(1): 100857.
67. Poquet, O.; and De Laat, M. 2021. Developing capabilities: Lifelong learning in the age of AI. British Journal of Educational Technology, 52(4): 1695–1708.
68. Post, C.; De Lia, E.; DiTomaso, N.; Tirpak, T. M.; and Borwankar, R. 2009. Capitalizing on thought diversity for innovation. Research-Technology Management, 52(6): 14–25.
69. Ranganathan, A.; and Ye, X. M. 2026. AI doesn’t reduce work—it intensifies it. Harvard Bus. Rev.
70. Ranjit, J.; Zhou, K.; Swayamdipta, S.; and Quercia, D. 2026. Are We Automating the Joy Out of Work? Designing AI to Augment Work, Not Meaning. In Proceedings of the 2026 CHI Conference on Human Factors in Computing Systems, 1–46.
71. Reif, J. A.; Larrick, R. P.; and Soll, J. B. 2025. Evidence of a social evaluation penalty for using AI. Proceedings of the National Academy of Sciences, 122(19): e2426766122.
72. Salas, E.; Prince, C.; Baker, D. P.; and Shrestha, L. 1995. Situation awareness in team performance: Implications for measurement and training. Human Factors, 37(1): 123–136.
73. Szulanski, G. 1996. Exploring internal stickiness: Impediments to the transfer of best practice within the firm. Strategic Management Journal, 17(S2): 27–43.
74. Time. 2023. How to end the unfairness of invisible work.
75. Vallance, C. 2023. AI could replace equivalent of 300 million jobs. BBC News.
76. Viswesvaran, C.; Sanchez, J. I.; and Fisher, J. 1999. The role of social support in the process of work stress: A metaanalysis. Journal of vocational behavior, 54(2): 314–334.
77. Wang, D.; Waldman, D. A.; and Ashforth, B. E. 2019. Building relationships through accountability: An expanded idea of accountability. Organizational Psychology Review, 9(2- 3): 184–206.
78. Wang, Z. Z.; Shao, Y.; Shaikh, O.; Fried, D.; Neubig, G.; and Yang, D. 2025. How Do AI Agents Do Human Work? Comparing AI and Human Workflows Across Diverse Occupations. arXiv:2510.22780. arXiv:[2510.22780](https://arxiv.org/abs/2510.22780)
79. Webster, J.; Brown, G.; Zweig, D.; Connelly, C. E.; Brodt, S.; and Sitkin, S. 2008. Beyond knowledge sharing: Withholding knowledge at work. Research in Personnel and Human Resources Management, 27: 1–37.
80. Wells, J. E.; and MacAulay, D. ???? What ’Invisible Work’ Looks Like in the 21st Century.
81. Wolfe, D. A.; Choe, A.; and Kidd, F. 2025. The Architecture of AI Transformation: Four Strategic Patterns and an Emerging Frontier. arXiv preprint arXiv:2509.02853. arXiv:[2509.02853](https://arxiv.org/abs/2509.02853)
82. Woodruff, A.; Shelby, R.; Kelley, P. G.; Rousso-Schindler, S.; Smith-Loud, J.; and Wilcox, L. 2024. How knowledge workers think generative ai will (not) transform their industries. In Proceedings of the 2024 CHI Conference on Human Factors in Computing Systems, 1–26.
83. Zabbo, E. Feb 3 2026. Invisible labor at work: what it is and how to address it. https://www.circles.com/resources/invisible-labor-atwork-what-it-is-and-how-to-address-it.
84. Zhang, S.; Zhang, T.; Cheng, J.; and Zhou, S. 2025a. Who is to Blame: A Comprehensive Review of Challenges and Opportunities in Designer-Developer Collaboration. Proceedings of the ACM on Human-Computer Interaction, 9(2): 1–32.
85. Zhang, X.; De Pablos, P. O.; and Zhou, Z. 2013. Effect of knowledge sharing visibility on incentive-based relationship in Electronic Knowledge Management Systems: An empirical investigation. Computers in Human Behavior, 29(2): 307–313.
86. Zhang, X.; Subramonyam, H.; Sarkar, A.; Drosos, I.; Wang, Z.; Lee, K.; Pimenova, V.; Chen, X.; and Lukoff, K. 2026. Generative Design and Vibe Coding: Rethinking The Design-Development Divide for UI Prototyping. In Proceedings of the Extended Abstracts of the 2026 CHI Conference on Human Factors in Computing Systems, 1–3.
87. Zhang, Y.; Zhao, D.; Hancock, J. T.; Kraut, R.; and Yang, D. 2025b. The rise of AI companions: how humanchatbot relationships influence well-being. arXiv preprint arXiv:2506.12605. arXiv:[2506.12605](https://arxiv.org/abs/2506.12605)
88. Zhou, X.; Chen, C.; Li, W.; Yao, Y.; Cai, F.; Xu, J.; and Qin, X. 2025. How Do Coworkers Interpret Employee AI Usage: Coworkers’ Perceived Morality and Helping as Responses to Employee AI Usage. Human Resource Management, 64(4): 1077–1097.

