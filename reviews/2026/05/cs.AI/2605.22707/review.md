# Beyond the Org Chart: AI and the Transformation of Invisible Work

GrokRxiv review of [arXiv:2605.22707](https://arxiv.org/abs/2605.22707) · `cs.AI`

_Authors_: Stephanie Rosenthal, Shamsi Iqbal

## TL;DR

The paper makes a timely contribution to understanding how AI adoption reshapes informal workplace practices in technology organizations. The summary specialist identifies seven well-illustrated themes—derived from 24 interviews across designers, user researchers, and applied/data scientists—covering cross-role boundary blurring, communication changes, accountability ambiguity, and erosion of mentorship networks. The technical correctness reviewer (confidence 0.62, overall: mostly_sound) flags two major issues that recur independently in the reproducibility review (confidence 0.90, score 0.18): causal language throughout a paper whose cross-sectional design can only support perceptual claims (C3, major), and the complete absence of supplementary methodological artifacts—codebook, coding matrix, interview protocol, analysis scripts—that would render the seven-theme taxonomy auditable (C8, major). The reproducibility specialist adds a critical-severity finding: all 24 transcripts are private and no data-access mechanism exists, making independent re-coding impossible. Together, C8 and the reproducibility critical concern constitute missing proof-as-code analogs for a cs.HC paper; per the recommendation gate, this mandates major_revision. The novelty and citation specialists both failed to produce outputs due to pipeline errors, so no independent novelty assessment or full citation verification is available; the technical correctness reviewer separately identified bibliography parsing artifacts (nine split entries, one missing year) and minor citation metadata concerns. The paper's conceptual contributions are genuine and practically relevant; the revision requirements are methodological and fixable.

_Recommendation_: **Major revision** · _Confidence_: 78%

## Strengths

- The invisible-work framing is original and practically significant, capturing organizational dynamics—mentorship, peer collaboration, professional identity—that productivity metrics systematically miss.
- The seven-theme taxonomy is grounded in rich participant quotations from three distinct professional roles, providing concrete, differentiated evidence for each finding.
- The study addresses a timely and underexplored area with direct implications for organizational policy during a period of rapid AI adoption.
- Internal participant counts are fully consistent across the abstract, Table 1, and the methods text (C1: supported), establishing baseline empirical integrity.
- The paper's actionable recommendations—making invisible work visible and actively supporting peer connections—translate findings into guidance accessible to organizational leaders.

## Weaknesses

- Causal language throughout the paper ('AI is enabling,' 'AI is dismantling') is not licensed by a cross-sectional, single-company, retrospective study design that supports only perceptual claims, not causal attribution (C3, major).
- The thematic analysis rests on a single coder with no reported inter-rater reliability statistic, no codebook, no description of inductive versus deductive derivation, and no thematic saturation analysis, leaving the seven-theme taxonomy unauditable (C2, major).
- No supplementary methodological artifacts—interview guide, codebook with theme definitions and inclusion/exclusion rules, anonymized coding matrix, or analysis scripts reproducing Tables 1–3—are provided, constituting a missing proof-as-code analog for a cs.HC study and blocking independent replication of all headline counts (C8, major; reproducibility code concern, major).
- All 24 interview transcripts are private with no data access mechanism described, preventing independent re-coding or verification of reported themes and participant counts (reproducibility data concern, critical).
- The Discussion employs unqualified plural-subject language ('workers,' 'organizations') that overstates the generalizability of N=24 findings from a single unnamed technology company, in tension with the paper's own ethical-considerations caveat (C5, minor).
- The bibliography contains at least nine references each parsed into two split entries and one entry with a missing year, which will degrade citation indexing and impair source retrieval (C10, minor).

## Revision Targets

- [ ] **Manuscript: Sections 4 (Reputation and Accountability) and 7 (Task Support and Collaboration); Related Work**
  - Location: `corrections/2605.22707/paper.pdf` at `Sections 4 (Reputation and Accountability) and 7 (Task Support and Collaboration); Related Work`
  - Evidence: These claims are second-hand and rest on cited sources. The Cheng et al. 2026 entry shows a non-standard article identifier ('eaec8352') and a volume/issue ('391(6792)') that the reviewer cannot fully verify against Science's publication schedule; if these bibliographic details are inaccurate, downstream readers will struggle to locate the source. The substance of the cited findings (sycophancy harms; social-evaluation penalty) is broadly consistent with the wider literature, so the conceptual point stands even if metadata needs correction.
  - Required change: Verify the Cheng et al. 2026 Science citation (volume, issue, article ID) and the Reif/Larrick/Soll 2025 PNAS DOI. Where strong cited results are pivotal to an argument, briefly summarize the study design (sample, measurement) rather than relying on a single adjective.
  - Verification: Re-review should confirm `Sections 4 (Reputation and Accountability) and 7 (Task Support and Collaboration); Related Work` is corrected or justified.
- [ ] **Evaluation pipeline**
  - Location: `HAC/bootstrap` at `evaluation and statistical-testing pipeline`
  - Evidence: The qualitative analysis is only summarized: the paper does not provide the full interview guide, tag/codebook definitions, coding decisions, audit trail, coder roles, or inter-rater/reliability checks needed to reproduce the seven-theme thematic analysis.
  - Required change: Publish evaluation scripts or executable pseudocode for walk-forward retraining, validation selection, HAC/bootstrap settings, benchmark construction, and table regeneration.
  - Verification: Re-review should confirm the evaluation pipeline can reproduce the reported statistical tests and benchmarks.
- [ ] **Manuscript: Throughout; explicitly nothing in Ethical Considerations or Methods**
  - Location: `corrections/2605.22707/paper.pdf` at `Throughout; explicitly nothing in Ethical Considerations or Methods`
  - Evidence: This is a cs.HC qualitative study. The code-amenable analogs of executable proofs in this field are: (a) an interview protocol / probe guide, (b) a published codebook with theme definitions and inclusion criteria, (c) anonymized excerpts or a coded transcript matrix, and (d) the analytic scripts (even simple count scripts that produced Tables 1 and 3). The paper provides none of these. As a result, none of the headline counts in Tables 1–3 or the seven-theme taxonomy can be independently re-derived, and a second analyst cannot audit the coding for bias or over-fitting.
  - Required change: Ship a supplementary package containing, at minimum: `protocol/interview_guide.md`, `protocol/consent_form.md`, `coding/codebook.md` (theme definitions, inclusion/exclusion rules), `coding/code_matrix.csv` (one row per participant × theme), and a small `analysis/tables.py` (or equivalent R/Quarto) script that regenerates Tables 1 and 3 from the matrix. Even with transcripts withheld for privacy, releasing the codebook and matrix would make the empirical scaffolding auditable.
  - Verification: Re-review should confirm `Throughout; explicitly nothing in Ethical Considerations or Methods` is corrected or justified.
- [ ] **Data availability and restricted inputs**
  - Location: data/reproducibility artifacts: `data availability and restricted inputs`
  - Evidence: The study's main empirical claims depend on 24 private interview transcripts and saved anonymized portions, but no transcript corpus, de-identified excerpts beyond selected quotations, or data access mechanism is provided, preventing independent re-coding or verification of the reported themes and counts.
  - Required change: Add a frozen data snapshot or a reproducible data-access appendix covering price series, historical index membership, data URLs, licenses, and restricted Bloomberg access constraints.
  - Verification: Re-review should find data artifacts or access instructions sufficient to rebuild the reported tables.
- [ ] **Manuscript: Discussion and Conclusion; partially mitigated in Ethical Considerations**
  - Location: `corrections/2605.22707/paper.pdf` at `Discussion and Conclusion; partially mitigated in Ethical Considerations`
  - Evidence: The Ethical Considerations section appropriately notes 'findings … are based on interview responses from a small sample for four job functions and broader generalizability should be treated with caution'. However, the Discussion frequently uses unqualified plural-subject language ('workers', 'colleagues', 'organizations') that reads as broader than N=24 at a single firm warrants. The sample is restricted to designers, user researchers, and applied/data scientists — software engineers are explicitly excluded — yet many recommendations are framed as company- or industry-wide.
  - Required change: Tighten claims in the Discussion to mirror the limitation already stated in Ethical Considerations. Where company- or industry-level recommendations are made, explicitly flag them as hypotheses to be tested in future, larger, multi-site studies.
  - Verification: Re-review should confirm `Discussion and Conclusion; partially mitigated in Ethical Considerations` is corrected or justified.
- [ ] **Manuscript: References**
  - Location: `corrections/2605.22707/paper.pdf` at `References`
  - Evidence: The bibliography parsing is visibly broken in several places: entries [3]/[4] split a single Allen 1977 reference into two entries; [6]/[7] split Baksa & Branyiczki 2023; [24]/[25] split Demerouti et al. 2001; [33]/[34] split Gunasekaran et al. 2026; [44]/[45] split Kommers et al. 2026; [48]/[49] split Laird et al. 2009; [51]/[52] split Mendel et al. 2025; [59]/[60] split Niederhoffer et al. 2025; [62]/[63] split Oliveira et al. 2025. Entry [80] (Wells & MacAulay) has '????' for the year. These look like ingestion artifacts rather than substantive errors, but they will degrade citation indexing.
  - Required change: Rebuild the bibliography from the source `.bib` file to merge the split entries and supply a year for Wells & MacAulay (or mark it 'n.d.'). Run a final bibtex/biber pass and verify entry counts (current numbering suggests 88 entries but several are partial fragments).
  - Verification: Re-review should confirm `References` is corrected or justified.

## Open Questions

- Will the authors release a supplementary package containing, at minimum, the interview guide, a codebook with theme definitions and inclusion/exclusion criteria, and an anonymized participant × theme coding matrix to make the thematic analysis independently auditable?
- Can load-bearing causal statements throughout the manuscript be reframed as perceptual or attributional ('participants reported,' 'participants attributed to AI') to align claims with what the cross-sectional study design can actually support?
- Was any portion of the coding conducted by a second analyst, and if so, what was the inter-rater reliability statistic? If not, how was thematic saturation or coding consistency assessed?
- Did the video-chat AI transcription service capture and transiently store audio (even if not retained), and how were the two manually-noted interviews rendered comparable to the 22 AI-transcribed ones during coding and analysis?
- Can the bibliography be rebuilt from the source .bib file to merge split entries and supply a year or 'n.d.' for Wells and MacAulay, and can the Cheng et al. 2026 Science article identifier and the Reif/Larrick/Soll 2025 PNAS DOI be verified?

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
  "confidence": 0.78,
  "questions": [
    "Will the authors release a supplementary package containing, at minimum, the interview guide, a codebook with theme definitions and inclusion/exclusion criteria, and an anonymized participant × theme coding matrix to make the thematic analysis independently auditable?",
    "Can load-bearing causal statements throughout the manuscript be reframed as perceptual or attributional ('participants reported,' 'participants attributed to AI') to align claims with what the cross-sectional study design can actually support?",
    "Was any portion of the coding conducted by a second analyst, and if so, what was the inter-rater reliability statistic? If not, how was thematic saturation or coding consistency assessed?",
    "Did the video-chat AI transcription service capture and transiently store audio (even if not retained), and how were the two manually-noted interviews rendered comparable to the 22 AI-transcribed ones during coding and analysis?",
    "Can the bibliography be rebuilt from the source .bib file to merge split entries and supply a year or 'n.d.' for Wells and MacAulay, and can the Cheng et al. 2026 Science article identifier and the Reif/Larrick/Soll 2025 PNAS DOI be verified?"
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "These claims are second-hand and rest on cited sources. The Cheng et al. 2026 entry shows a non-standard article identifier ('eaec8352') and a volume/issue ('391(6792)') that the reviewer cannot fully verify against Science's publication schedule; if these bibliographic details are inaccurate, downstream readers will struggle to locate the source. The substance of the cited findings (sycophancy harms; social-evaluation penalty) is broadly consistent with the wider literature, so the conceptual point stands even if metadata needs correction.",
      "id": "weakness-1",
      "locator": "Sections 4 (Reputation and Accountability) and 7 (Task Support and Collaboration); Related Work",
      "required_update": "Verify the Cheng et al. 2026 Science citation (volume, issue, article ID) and the Reif/Larrick/Soll 2025 PNAS DOI. Where strong cited results are pivotal to an argument, briefly summarize the study design (sample, measurement) rather than relying on a single adjective.",
      "source_path": "corrections/2605.22707/paper.pdf",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Sections 4 (Reputation and Accountability) and 7 (Task Support and Collaboration); Related Work` is corrected or justified.",
      "weakness_index": 0
    },
    {
      "evidence": "The qualitative analysis is only summarized: the paper does not provide the full interview guide, tag/codebook definitions, coding decisions, audit trail, coder roles, or inter-rater/reliability checks needed to reproduce the seven-theme thematic analysis.",
      "id": "weakness-2",
      "locator": "evaluation and statistical-testing pipeline",
      "required_update": "Publish evaluation scripts or executable pseudocode for walk-forward retraining, validation selection, HAC/bootstrap settings, benchmark construction, and table regeneration.",
      "source_path": "HAC/bootstrap",
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "code",
      "verification_check": "Re-review should confirm the evaluation pipeline can reproduce the reported statistical tests and benchmarks.",
      "weakness_index": 1
    },
    {
      "evidence": "This is a cs.HC qualitative study. The code-amenable analogs of executable proofs in this field are: (a) an interview protocol / probe guide, (b) a published codebook with theme definitions and inclusion criteria, (c) anonymized excerpts or a coded transcript matrix, and (d) the analytic scripts (even simple count scripts that produced Tables 1 and 3). The paper provides none of these. As a result, none of the headline counts in Tables 1–3 or the seven-theme taxonomy can be independently re-derived, and a second analyst cannot audit the coding for bias or over-fitting.",
      "id": "weakness-3",
      "locator": "Throughout; explicitly nothing in Ethical Considerations or Methods",
      "required_update": "Ship a supplementary package containing, at minimum: `protocol/interview_guide.md`, `protocol/consent_form.md`, `coding/codebook.md` (theme definitions, inclusion/exclusion rules), `coding/code_matrix.csv` (one row per participant × theme), and a small `analysis/tables.py` (or equivalent R/Quarto) script that regenerates Tables 1 and 3 from the matrix. Even with transcripts withheld for privacy, releasing the codebook and matrix would make the empirical scaffolding auditable.",
      "source_path": "corrections/2605.22707/paper.pdf",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Throughout; explicitly nothing in Ethical Considerations or Methods` is corrected or justified.",
      "weakness_index": 2
    },
    {
      "evidence": "The study's main empirical claims depend on 24 private interview transcripts and saved anonymized portions, but no transcript corpus, de-identified excerpts beyond selected quotations, or data access mechanism is provided, preventing independent re-coding or verification of the reported themes and counts.",
      "id": "weakness-4",
      "locator": "data availability and restricted inputs",
      "required_update": "Add a frozen data snapshot or a reproducible data-access appendix covering price series, historical index membership, data URLs, licenses, and restricted Bloomberg access constraints.",
      "source_path": null,
      "source_role": "reproducibility",
      "status": "open",
      "target_kind": "data",
      "verification_check": "Re-review should find data artifacts or access instructions sufficient to rebuild the reported tables.",
      "weakness_index": 3
    },
    {
      "evidence": "The Ethical Considerations section appropriately notes 'findings … are based on interview responses from a small sample for four job functions and broader generalizability should be treated with caution'. However, the Discussion frequently uses unqualified plural-subject language ('workers', 'colleagues', 'organizations') that reads as broader than N=24 at a single firm warrants. The sample is restricted to designers, user researchers, and applied/data scientists — software engineers are explicitly excluded — yet many recommendations are framed as company- or industry-wide.",
      "id": "weakness-5",
      "locator": "Discussion and Conclusion; partially mitigated in Ethical Considerations",
      "required_update": "Tighten claims in the Discussion to mirror the limitation already stated in Ethical Considerations. Where company- or industry-level recommendations are made, explicitly flag them as hypotheses to be tested in future, larger, multi-site studies.",
      "source_path": "corrections/2605.22707/paper.pdf",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Discussion and Conclusion; partially mitigated in Ethical Considerations` is corrected or justified.",
      "weakness_index": 4
    },
    {
      "evidence": "The bibliography parsing is visibly broken in several places: entries [3]/[4] split a single Allen 1977 reference into two entries; [6]/[7] split Baksa & Branyiczki 2023; [24]/[25] split Demerouti et al. 2001; [33]/[34] split Gunasekaran et al. 2026; [44]/[45] split Kommers et al. 2026; [48]/[49] split Laird et al. 2009; [51]/[52] split Mendel et al. 2025; [59]/[60] split Niederhoffer et al. 2025; [62]/[63] split Oliveira et al. 2025. Entry [80] (Wells & MacAulay) has '????' for the year. These look like ingestion artifacts rather than substantive errors, but they will degrade citation indexing.",
      "id": "weakness-6",
      "locator": "References",
      "required_update": "Rebuild the bibliography from the source `.bib` file to merge the split entries and supply a year for Wells & MacAulay (or mark it 'n.d.'). Run a final bibtex/biber pass and verify entry counts (current numbering suggests 88 entries but several are partial fragments).",
      "source_path": "corrections/2605.22707/paper.pdf",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `References` is corrected or justified.",
      "weakness_index": 5
    }
  ],
  "strengths": [
    "The invisible-work framing is original and practically significant, capturing organizational dynamics—mentorship, peer collaboration, professional identity—that productivity metrics systematically miss.",
    "The seven-theme taxonomy is grounded in rich participant quotations from three distinct professional roles, providing concrete, differentiated evidence for each finding.",
    "The study addresses a timely and underexplored area with direct implications for organizational policy during a period of rapid AI adoption.",
    "Internal participant counts are fully consistent across the abstract, Table 1, and the methods text (C1: supported), establishing baseline empirical integrity.",
    "The paper's actionable recommendations—making invisible work visible and actively supporting peer connections—translate findings into guidance accessible to organizational leaders."
  ],
  "summary": "The paper makes a timely contribution to understanding how AI adoption reshapes informal workplace practices in technology organizations. The summary specialist identifies seven well-illustrated themes—derived from 24 interviews across designers, user researchers, and applied/data scientists—covering cross-role boundary blurring, communication changes, accountability ambiguity, and erosion of mentorship networks. The technical correctness reviewer (confidence 0.62, overall: mostly_sound) flags two major issues that recur independently in the reproducibility review (confidence 0.90, score 0.18): causal language throughout a paper whose cross-sectional design can only support perceptual claims (C3, major), and the complete absence of supplementary methodological artifacts—codebook, coding matrix, interview protocol, analysis scripts—that would render the seven-theme taxonomy auditable (C8, major). The reproducibility specialist adds a critical-severity finding: all 24 transcripts are private and no data-access mechanism exists, making independent re-coding impossible. Together, C8 and the reproducibility critical concern constitute missing proof-as-code analogs for a cs.HC paper; per the recommendation gate, this mandates major_revision. The novelty and citation specialists both failed to produce outputs due to pipeline errors, so no independent novelty assessment or full citation verification is available; the technical correctness reviewer separately identified bibliography parsing artifacts (nine split entries, one missing year) and minor citation metadata concerns. The paper's conceptual contributions are genuine and practically relevant; the revision requirements are methodological and fixable.",
  "weaknesses": [
    "Causal language throughout the paper ('AI is enabling,' 'AI is dismantling') is not licensed by a cross-sectional, single-company, retrospective study design that supports only perceptual claims, not causal attribution (C3, major).",
    "The thematic analysis rests on a single coder with no reported inter-rater reliability statistic, no codebook, no description of inductive versus deductive derivation, and no thematic saturation analysis, leaving the seven-theme taxonomy unauditable (C2, major).",
    "No supplementary methodological artifacts—interview guide, codebook with theme definitions and inclusion/exclusion rules, anonymized coding matrix, or analysis scripts reproducing Tables 1–3—are provided, constituting a missing proof-as-code analog for a cs.HC study and blocking independent replication of all headline counts (C8, major; reproducibility code concern, major).",
    "All 24 interview transcripts are private with no data access mechanism described, preventing independent re-coding or verification of reported themes and participant counts (reproducibility data concern, critical).",
    "The Discussion employs unqualified plural-subject language ('workers,' 'organizations') that overstates the generalizability of N=24 findings from a single unnamed technology company, in tension with the paper's own ethical-considerations caveat (C5, minor).",
    "The bibliography contains at least nine references each parsed into two split entries and one entry with a missing year, which will degrade citation indexing and impair source retrieval (C10, minor)."
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
      "description": "The study's main empirical claims depend on 24 private interview transcripts and saved anonymized portions, but no transcript corpus, de-identified excerpts beyond selected quotations, or data access mechanism is provided, preventing independent re-coding or verification of the reported themes and counts.",
      "severity": "critical"
    },
    {
      "area": "evaluation",
      "description": "The qualitative analysis is only summarized: the paper does not provide the full interview guide, tag/codebook definitions, coding decisions, audit trail, coder roles, or inter-rater/reliability checks needed to reproduce the seven-theme thematic analysis.",
      "severity": "major"
    },
    {
      "area": "data",
      "description": "Participants were recruited inside a single unnamed large technology company through internal channels, so the sampling frame and recruitment materials are not independently accessible and the population cannot be replicated directly.",
      "severity": "major"
    },
    {
      "area": "code",
      "description": "No analysis scripts, notebooks, or machine-readable coding tables are provided for reproducing participant/theme counts, correlation searches among themes, or table construction.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "The paper names use of video chat and built-in transcription services for 22 interviews, but omits the transcription tool/version, anonymization procedure details, and exact handling of the two manually-noted interviews.",
      "severity": "minor"
    },
    {
      "area": "other",
      "description": "Verifier could not reach `https://www.circles.com/resources/invisible-labor-atwork-what-it-is-and-how-to-address-it` (status=404)",
      "severity": "minor"
    }
  ],
  "confidence": 0.9,
  "data_availability": "private",
  "data_url": null,
  "environment": {
    "dependencies": [],
    "hardware": null,
    "software": "Video-chat interviews; built-in transcription services used for 22 of 24 participants, with manual notes for the remaining interviews. No tool names or versions specified."
  },
  "reproducibility_score": 0.18
}
```

### summary (`claude-haiku-4-5-20251001`) — status: `pass`

```json
{
  "audience": "HR leaders, organizational psychologists, and professionals working in technology companies interested in understanding how AI adoption affects workplace culture, professional development, and employee well-being; also relevant to researchers studying AI's impact on work and organizations",
  "key_contributions": [
    "AI adoption is changing invisible work—informal cultural practices like mentoring, collaboration, and knowledge-sharing—as much or more than visible work and productivity",
    "AI-enabled tools are smoothing cross-disciplinary communication by creating new boundary objects like interactive prototypes and markdown documentation",
    "AI is blurring professional boundaries between job roles (for example, designers now doing coding) in ways that create both empowerment and role anxiety",
    "Workers are experiencing reduced access to human feedback and mentorship as they substitute AI tools for peer interactions, risking professional isolation and slowed career growth",
    "The quality and accountability of AI-generated content remains ambiguous, with some workers internalizing responsibility while others feel less accountable",
    "Workers are using AI as a personalized learning tool to rapidly acquire new skills outside traditional peer-learning channels",
    "Organizational leaders should make invisible work more visible and actively support peer connections to preserve healthy company culture during AI transformation"
  ],
  "plain_language_summary": "This paper investigates how AI is changing the everyday work practices at a large technology company by interviewing 24 professionals in design, user research, and data science. Beyond the obvious productivity gains from AI tools, the researchers found that AI is fundamentally altering informal workplace activities—like mentoring, getting feedback from colleagues, and building professional relationships—that are essential for career growth and company culture but often go unrecognized. The study identifies seven key areas where AI is reshaping invisible work: improving cross-team communication through new tools, blurring job boundaries in ways that both empower and create anxiety, making it easier to write reports but harder for people to actually engage with them, complicating accountability for AI-generated content, accelerating personal learning from AI interactions, replacing human feedback with AI assistance, and increasing independence at the expense of lost peer connections. While workers report feeling more independent and productive with AI tools, they also express concern about losing the human connections, informal knowledge-sharing networks, and mentorship opportunities that have traditionally been central to professional development and workplace belonging.",
  "tldr": "A qualitative study of 24 professionals at a large technology company reveals that AI adoption is transforming not just productivity but also invisible work like mentoring, collaboration, and social support, with both empowering and isolating consequences."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `warn`

```json
{
  "claims": [
    {
      "assessment": "supported",
      "claim": "The authors interviewed 24 product-focused professionals (7 designers, 7 user researchers, 10 applied/data scientists) at a large technology company in March–April 2026.",
      "evidence": "Counts in Table 1 (7+7+10) sum to 24, matching the abstract and Research Methods text. Internally consistent. Three managers, four self-identified avid AI users, one pessimist are also internally consistent.",
      "id": "C1",
      "location": "Abstract; Research Methods → Participants; Table 1",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Thematic analysis of interview transcripts yielded seven dimensions of AI impact on invisible work (Tables 2 and 3), with participant counts per theme ranging 10–14.",
      "evidence": "The paper describes a two-pass tagging process by what appears to be a single coder ('the interviewer collected the transcript, cleaned and anonymized it, and tagged it') with a 'secondary review' after >80% of interviews. No inter-rater reliability statistic (e.g., Cohen's κ), no codebook, no description of how themes were derived (inductive vs. deductive), and no saturation analysis are reported. Per-theme participant counts in Table 3 cannot be independently verified because no coding matrix or quote-to-participant mapping is shared. The seven-theme taxonomy is plausible and well-illustrated with quotations, but rests on a single analyst's judgement.",
      "id": "C2",
      "location": "AI Transformation of Invisible Work; Table 2; Table 3",
      "severity": "major",
      "suggested_fix": "Report inter-rater reliability with a second coder on at least a subsample; publish the codebook and code-to-quote mapping; release an anonymized coding matrix as supplementary data, e.g., `data/codebook.md` and `data/coding_matrix.csv`. State whether thematic saturation was assessed."
    },
    {
      "assessment": "partially_supported",
      "claim": "AI adoption is causing changes in invisible work practices (e.g., 'AI is not only changing formal role responsibilities … but also changing informal cultural practices').",
      "evidence": "The study design is a single-shot, cross-sectional, retrospective semi-structured interview at one company. Such a design supports descriptive claims about how participants *perceive* and *report* changes, but does not license the causal language used throughout (e.g., 'AI is enabling', 'AI is dismantling'). There is no pre/post baseline, no comparison group, and no longitudinal follow-up. Participants' attributions of change to AI are not triangulated against organizational data, telemetry, or productivity metrics.",
      "id": "C3",
      "location": "Abstract; Introduction; Discussion and Conclusion",
      "severity": "major",
      "suggested_fix": "Reframe load-bearing causal statements as 'participants reported / perceived' or 'participants attributed to AI'. Acknowledge the absence of a counterfactual in the Limitations subsection. For future work, propose a longitudinal or matched-comparison design and (where possible) augment with telemetry from collaboration tools."
    },
    {
      "assessment": "partially_supported",
      "claim": "Quantitative productivity claims drawn from cited work — e.g., 'agents could complete tasks ~90% faster than humans on the same set of 16 tasks (Wang et al. 2025)' and the 5000-specialist customer-support study (Brynjolfsson, Li, and Raymond 2025).",
      "evidence": "These figures are imported verbatim from cited sources and not independently re-verified in this paper. The Brynjolfsson/Li/Raymond result is widely reported and broadly consistent with the cited paper. The Wang et al. 2025 ~90%-faster claim on 16 tasks is repeated without nuance about which agent, which baseline, and on what task subset — the actual paper's headline number is more qualified. Single-number citations of contested productivity results risk overstating consensus.",
      "id": "C4",
      "location": "Introduction (paragraph beginning 'The rapid integration of artificial intelligence …')",
      "severity": "minor",
      "suggested_fix": "Add a qualifying clause for the Wang et al. result (e.g., '… on a curated subset of 16 occupational tasks, when comparing best-case agent runs to median human time'). Avoid framing as a settled productivity finding given the paper explicitly notes 'disagreements in exactly how much productivity improvement workers see.'"
    },
    {
      "assessment": "partially_supported",
      "claim": "The paper's generalizability claim — that the seven invisible-work impact patterns reflect AI-driven changes at AI-forward technology companies broadly.",
      "evidence": "The Ethical Considerations section appropriately notes 'findings … are based on interview responses from a small sample for four job functions and broader generalizability should be treated with caution'. However, the Discussion frequently uses unqualified plural-subject language ('workers', 'colleagues', 'organizations') that reads as broader than N=24 at a single firm warrants. The sample is restricted to designers, user researchers, and applied/data scientists — software engineers are explicitly excluded — yet many recommendations are framed as company- or industry-wide.",
      "id": "C5",
      "location": "Discussion and Conclusion; partially mitigated in Ethical Considerations",
      "severity": "minor",
      "suggested_fix": "Tighten claims in the Discussion to mirror the limitation already stated in Ethical Considerations. Where company- or industry-level recommendations are made, explicitly flag them as hypotheses to be tested in future, larger, multi-site studies."
    },
    {
      "assessment": "partially_supported",
      "claim": "Interviews were transcribed live but 'not recorded', with 22/24 participants consenting to AI transcription and the remaining 2 captured via manual notes.",
      "evidence": "There is an internal tension: the Data Collection section says 22 participants 'agreed to our use of AI transcription' (footnote 1: 'the interviewer took notes manually' for the other two), while Ethical Considerations says 'Interview responses were transcribed live but not recorded'. AI transcription services typically produce a transcript from audio, which implies at least transient recording even if audio is not retained. The provenance and fidelity of the analyzed transcripts for the 2 hand-noted interviews differ materially from the 22 AI-transcribed ones, and this asymmetry is not discussed.",
      "id": "C6",
      "location": "Data Collection; Ethical Considerations",
      "severity": "minor",
      "suggested_fix": "Clarify whether audio was captured by the transcription service (even if later discarded) and how the 2 hand-noted interviews were rendered comparable to the 22 AI-transcribed ones during coding. Discuss any reliability implications of the dual transcription regime."
    },
    {
      "assessment": "partially_supported",
      "claim": "The paper claims selected mechanistic effects in the literature (e.g., sycophancy in AI is 'harmful to judgments and decision-making' citing Cheng et al. 2026 in Science; 'social evaluation penalty' for AI users citing Reif, Larrick, and Soll 2025 in PNAS).",
      "evidence": "These claims are second-hand and rest on cited sources. The Cheng et al. 2026 entry shows a non-standard article identifier ('eaec8352') and a volume/issue ('391(6792)') that the reviewer cannot fully verify against Science's publication schedule; if these bibliographic details are inaccurate, downstream readers will struggle to locate the source. The substance of the cited findings (sycophancy harms; social-evaluation penalty) is broadly consistent with the wider literature, so the conceptual point stands even if metadata needs correction.",
      "id": "C7",
      "location": "Sections 4 (Reputation and Accountability) and 7 (Task Support and Collaboration); Related Work",
      "severity": "minor",
      "suggested_fix": "Verify the Cheng et al. 2026 Science citation (volume, issue, article ID) and the Reif/Larrick/Soll 2025 PNAS DOI. Where strong cited results are pivotal to an argument, briefly summarize the study design (sample, measurement) rather than relying on a single adjective."
    },
    {
      "assessment": "unsupported",
      "claim": "No data, code, or analytic artifact is shared to support the qualitative findings (proof-as-code analog for cs.HC).",
      "evidence": "This is a cs.HC qualitative study. The code-amenable analogs of executable proofs in this field are: (a) an interview protocol / probe guide, (b) a published codebook with theme definitions and inclusion criteria, (c) anonymized excerpts or a coded transcript matrix, and (d) the analytic scripts (even simple count scripts that produced Tables 1 and 3). The paper provides none of these. As a result, none of the headline counts in Tables 1–3 or the seven-theme taxonomy can be independently re-derived, and a second analyst cannot audit the coding for bias or over-fitting.",
      "id": "C8",
      "location": "Throughout; explicitly nothing in Ethical Considerations or Methods",
      "severity": "major",
      "suggested_fix": "Ship a supplementary package containing, at minimum: `protocol/interview_guide.md`, `protocol/consent_form.md`, `coding/codebook.md` (theme definitions, inclusion/exclusion rules), `coding/code_matrix.csv` (one row per participant × theme), and a small `analysis/tables.py` (or equivalent R/Quarto) script that regenerates Tables 1 and 3 from the matrix. Even with transcripts withheld for privacy, releasing the codebook and matrix would make the empirical scaffolding auditable."
    },
    {
      "assessment": "partially_supported",
      "claim": "Specific within-paper participant attributions used as evidence for themes (e.g., Participants H, J, X, G, I, C, U, V, N, F, L, S, D, O, Q, R, P).",
      "evidence": "Quotations are internally consistent in voice and theme assignment, and pseudonyms appear stable across mentions. However, with N=24 there are 17 distinct participant letters referenced; the paper does not provide a participant-by-participant profile table (role, gender, tenure, manager/IC status) that would let readers contextualize each quote. Anonymization is appropriate but the loss of contextual metadata limits readers' ability to assess representativeness of each quote.",
      "id": "C9",
      "location": "Section-by-section quotations in 'AI Transformation of Invisible Work'",
      "severity": "info",
      "suggested_fix": "Add a per-participant table (anonymized) listing role family, IC vs. manager, self-identified AI stance, and which themes they spoke to — this preserves anonymity while making representativeness inspectable."
    },
    {
      "assessment": "partially_supported",
      "claim": "Bibliographic completeness and integrity (88-entry bibliography).",
      "evidence": "The bibliography parsing is visibly broken in several places: entries [3]/[4] split a single Allen 1977 reference into two entries; [6]/[7] split Baksa & Branyiczki 2023; [24]/[25] split Demerouti et al. 2001; [33]/[34] split Gunasekaran et al. 2026; [44]/[45] split Kommers et al. 2026; [48]/[49] split Laird et al. 2009; [51]/[52] split Mendel et al. 2025; [59]/[60] split Niederhoffer et al. 2025; [62]/[63] split Oliveira et al. 2025. Entry [80] (Wells & MacAulay) has '????' for the year. These look like ingestion artifacts rather than substantive errors, but they will degrade citation indexing.",
      "id": "C10",
      "location": "References",
      "severity": "minor",
      "suggested_fix": "Rebuild the bibliography from the source `.bib` file to merge the split entries and supply a year for Wells & MacAulay (or mark it 'n.d.'). Run a final bibtex/biber pass and verify entry counts (current numbering suggests 88 entries but several are partial fragments)."
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

