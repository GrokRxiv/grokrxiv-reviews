# Beyond the Org Chart: AI and the Transformation of Invisible Work

GrokRxiv review of [arXiv:2605.22707](https://arxiv.org/abs/2605.22707) · `cs.AI`

_Authors_: Stephanie Rosenthal, Shamsi Iqbal

## TL;DR

This qualitative study examines how generative AI tools reshape invisible workplace work—mentoring, cross-discipline communication, reputation, and informal support networks—through 24 semi-structured interviews at a single large AI-first technology firm. The novelty specialist rated the contribution incremental (score 0.65, confidence 0.9): the invisible-work framing is solidly grounded in Daniels (1987) and Cross (2002), and the empirical extension to AI-augmented knowledge work is timely but builds on an established prior-art literature. The technical-correctness specialist found the paper mostly sound (confidence 0.72) but raised four major concerns: the seven-theme taxonomy lacks a named qualitative methodology, codebook, and inter-coder reliability statistics (C1, C5); generalizability claims in the Discussion are not scoped to the single-company, manager-mediated sample (C4); the headline claim that AI is 'dismantling existing mechanisms' of peer help-seeking exceeds what an interview-only design can support (C8); and no qualitative-analog proof-as-code bundle—interview protocol, codebook, quote-theme map, analysis scripts—is present (C9). The reproducibility specialist scored the paper 0.24 of 1.0 (confidence 0.87), flagging a critical absence of primary data artifacts and two major gaps in methodology transparency. The citation specialist failed before producing output (CliRunner timeout after 360 s); citation provenance cannot be assessed from specialist evidence and must be evaluated separately. The recommendation gate applies: cs.HC is in the code-amenable set, and both the technical-correctness and reproducibility specialists flagged missing qualitative-analysis artifacts at major and critical severity respectively. The missing artifacts undermine independent verifiability of the seven-theme taxonomy—the paper's headline claim—but do not render the findings implausible. Major revision to supply a reproducibility bundle, name the qualitative methodology, add inter-coder reliability, and tighten scope claims is required before acceptance.

_Recommendation_: **Major revision** · _Confidence_: 81%

## Strengths

- The invisible-work theoretical framework is well-grounded in foundational literature (Daniels 1987; Hatton 2017; House and Kahn 1985), and the extension to AI-augmented knowledge work is coherent and clearly motivated.
- The seven-theme taxonomy is richly illustrated by verbatim participant quotes spanning three professional roles, providing thick qualitative evidence for the proposed dimensions.
- The productivity-versus-relational-erosion paradox is a timely and practically relevant contribution corroborated by multiple independent citations (Ehsan 2026; Hadley 2026; Brynjolfsson 2025; Ranganathan and Ye 2026).
- Sample composition is internally consistent—participant counts across role and gender sum correctly—and the sampling frame (manager-referred professionals at an AI-first firm) is clearly described.
- The paper offers concrete, actionable organizational recommendations that translate findings into guidance for HR professionals and leaders, extending its practical reach beyond the academic contribution.

## Weaknesses

- The seven-theme taxonomy lacks a disclosed qualitative analysis method (no named approach such as grounded theory or reflexive thematic analysis), no codebook, and no inter-coder reliability statistics, making the primary contribution unverifiable by independent reviewers (C1, C5, C9—all severity major).
- No qualitative reproducibility bundle is provided: the interview protocol, codebook, anonymized quote-to-theme mapping, and any analysis scripts are absent, preventing independent auditing of Table 3 theme counts and quoted evidence (reproducibility concern area=data, severity critical; area=evaluation, severity major).
- Discussion claims generalize broadly to 'the workplace' from 24 interviews at a single AI-first technology company with manager-mediated recruitment, without scoping language or enumerated threats to external validity (C4, severity major).
- The headline organizational claim that AI is 'dismantling existing mechanisms' of peer help-seeking is presented without counterfactual behavioral measurement (no pre/post data, no comparison group, no behavioral logs), overstating what the interview-only design can evidence (C8, severity major).
- The researcher–participant power asymmetry—Microsoft researchers interviewing employees at the studied organization—is not disclosed as a validity threat, leaving social-desirability and self-censorship risks unaddressed (C11, severity minor).
- Two interviews conducted via manual notes rather than AI transcription introduce an uncontrolled data-fidelity asymmetry between sources that is not acknowledged or addressed in the analysis (C5, severity major).

## Revision Targets

- [ ] **Manuscript: Introduction; AI Transformation of Invisible Work; Table 2**
  - Location: `corrections/2605.22707/paper.pdf` at `Introduction; AI Transformation of Invisible Work; Table 2`
  - Evidence: The seven dimensions are inductively derived from thematic analysis of 24 interviews at a single firm, with participant counts in Table 3 ranging from 10 to 14 (i.e., fewer than 60% of participants discussed several themes). No formal coding methodology (e.g., grounded theory steps, codebook, inter-rater reliability) is reported, and the authors themselves note that some themes only 'emerged later in our review' (Transcript Analysis section). The taxonomy is plausible and well-illustrated by quotes but is not validated against external samples or by independent coders.
  - Required change: State the qualitative analysis method explicitly (e.g., reflexive thematic analysis, grounded theory), describe codebook development, report inter-coder agreement (kappa or % agreement) between the two authors, and release the anonymized codebook plus de-identified quote table as supplementary material (e.g., supplementary/codebook.csv, supplementary/quote_table.csv).
  - Verification: Re-review should confirm `Introduction; AI Transformation of Invisible Work; Table 2` is corrected or justified.
- [ ] **Manuscript: Table 3**
  - Location: `corrections/2605.22707/paper.pdf` at `Table 3`
  - Evidence: Counts are internally consistent with N=24 and are reported as raw integers without confidence intervals or denominators normalized by interview length or prompt structure. Because the interview protocol explicitly prompted some of these areas (e.g., collaboration, feedback) while other themes 'emerged later,' the counts may reflect interviewer probing rather than spontaneous endorsement, biasing comparison across themes.
  - Required change: Disclose which themes were prompted vs. unprompted, report whether counts include only spontaneous mentions or also responses to direct probing, and provide the interview guide as supplementary material (e.g., supplementary/interview_protocol.pdf).
  - Verification: Re-review should confirm `Table 3` is corrected or justified.
- [ ] **Manuscript: Introduction; Discussion and Conclusion; Ethical Considerations**
  - Location: `corrections/2605.22707/paper.pdf` at `Introduction; Discussion and Conclusion; Ethical Considerations`
  - Evidence: The paper is based on 24 interviews at a single 'large AI-first technology firm' (identified contextually as Microsoft from the affiliation line). Recruitment was via manager email, introducing selection bias (managers nominate; volunteers self-select; one participant was 'particularly pessimistic'). The authors briefly acknowledge generalizability limits only in 'Ethical Considerations,' but the Discussion repeatedly states broad organizational implications without scoping language. No triangulation (e.g., survey of non-interviewees, observational data, archival records) is reported.
  - Required change: Scope discussion claims to the studied population (one large AI-first firm, four sociotechnical roles), explicitly list threats to validity (single-company effects, manager-mediated recruitment, voluntary participation, social-desirability bias toward an AI-positive employer narrative), and frame propositions as hypotheses for broader testing rather than findings.
  - Verification: Re-review should confirm `Introduction; Discussion and Conclusion; Ethical Considerations` is corrected or justified.
- [ ] **Manuscript: Instructional Support and Feedback; Task Support and Collaboration; Discussion**
  - Location: `corrections/2605.22707/paper.pdf` at `Instructional Support and Feedback; Task Support and Collaboration; Discussion`
  - Evidence: Supported qualitatively by multiple participant quotes (Participants F, L, Q, R, S, U, P) but presented without a counterfactual measurement (e.g., no pre/post help-seeking frequency data; no comparison to non-AI-first peers; no behavioral logs of communications, meetings, or chat usage). The interpretive leap from quotes to 'dismantling existing mechanisms' is a strong organizational-level claim that the interview-only design cannot directly evidence.
  - Required change: Either soften to 'participants reported feeling more independent and reported reduced peer help-seeking,' or triangulate with behavioral data (e.g., aggregated, anonymized counts of Teams/Slack help-channel messages, calendar-meeting density, or a follow-up survey instrument).
  - Verification: Re-review should confirm `Instructional Support and Feedback; Task Support and Collaboration; Discussion` is corrected or justified.
- [ ] **Manuscript: Header; Participants**
  - Location: `corrections/2605.22707/paper.pdf` at `Header; Participants`
  - Evidence: The paper never explicitly names the company under study and frames it as 'a large technology firm,' but the author affiliation (Microsoft) and the description ('AI-first,' broad AI tooling suite) make the identity readily inferable. This creates an undisclosed researcher–participant power asymmetry (employees interviewed by their own employer's researchers) that is not analyzed as a threat to validity.
  - Required change: Add a positionality / conflict-of-interest paragraph stating that the researchers are employees of the studied organization, describe steps taken to mitigate response bias (e.g., guaranteed anonymity, no involvement of participants' managers in analysis, IRB protections beyond standard consent), and discuss social-desirability and self-censorship risks.
  - Verification: Re-review should confirm `Header; Participants` is corrected or justified.
- [ ] **Manuscript: Transcript Analysis**
  - Location: `corrections/2605.22707/paper.pdf` at `Transcript Analysis`
  - Evidence: The Transcript Analysis section describes only one coder/interviewer ('the interviewer collected the transcript, cleaned and anonymized it, and tagged it'), with no second coder, no inter-rater reliability metric, no member checking, no audit trail, no saturation analysis, and no codebook. Two participants opted out of AI transcription and the interviewer 'took notes manually,' creating an uncontrolled fidelity asymmetry between 22 AI transcripts and 2 note-only sources that is not addressed in the analysis.
  - Required change: Add a second independent coder for a subset (≥20%) of transcripts, report agreement statistics, document the codebook, discuss saturation, and explicitly state how the two non-transcribed interviews were treated (excluded? down-weighted? coded from notes only?). Provide a methodology appendix following COREQ or SRQR reporting standards.
  - Verification: Re-review should confirm `Transcript Analysis` is corrected or justified.

## Open Questions

- What qualitative analysis method was applied (e.g., reflexive thematic analysis, grounded theory, template analysis), and can a codebook with inter-coder reliability statistics for at least 20% of transcripts be provided as supplementary material?
- Which interview questions directly prompted the reported themes, and how were spontaneous versus interviewer-elicited mentions distinguished in the Table 3 counts?
- What steps were taken to mitigate researcher–participant power dynamics given the organizational affiliation of the research team, and were any IRB protections beyond standard informed consent implemented to reduce self-censorship?
- Could behavioral or archival data—anonymized counts of help-channel messages, meeting frequency, documentation contributions—triangulate the interview-based claim that AI is reducing peer help-seeking at an organizational level?
- How might the findings differ in organizations outside the large-AI-first technology sector, and what organizational or sector-level moderators are hypothesized to moderate the seven-theme pattern?
- What was the total sampling-frame size, response rate, and rationale for theoretical saturation at N=24, given that several themes were endorsed by fewer than 60% of participants?

## Per-Agent Reviews

### citation (`gemini-3-flash-preview`) — status: `warn`

```json
{
  "confidence": 0.0,
  "entries": [],
  "missing_references": [],
  "summary": "Citation-use agent failed before producing a normal citation relevance review. Deterministic citation verification still runs separately; see external citation checks and verifier provenance for existence, DOI, URL, and resolver evidence. Failure: CliRunner timed out after 360s for role citation Deterministic citation verifier checked 12 bibliography entries."
}
```

### meta_reviewer (`claude-sonnet-4-6`) — status: `pass`

```json
{
  "confidence": 0.81,
  "questions": [
    "What qualitative analysis method was applied (e.g., reflexive thematic analysis, grounded theory, template analysis), and can a codebook with inter-coder reliability statistics for at least 20% of transcripts be provided as supplementary material?",
    "Which interview questions directly prompted the reported themes, and how were spontaneous versus interviewer-elicited mentions distinguished in the Table 3 counts?",
    "What steps were taken to mitigate researcher–participant power dynamics given the organizational affiliation of the research team, and were any IRB protections beyond standard informed consent implemented to reduce self-censorship?",
    "Could behavioral or archival data—anonymized counts of help-channel messages, meeting frequency, documentation contributions—triangulate the interview-based claim that AI is reducing peer help-seeking at an organizational level?",
    "How might the findings differ in organizations outside the large-AI-first technology sector, and what organizational or sector-level moderators are hypothesized to moderate the seven-theme pattern?",
    "What was the total sampling-frame size, response rate, and rationale for theoretical saturation at N=24, given that several themes were endorsed by fewer than 60% of participants?"
  ],
  "recommendation": "major_revision",
  "revision_targets": [
    {
      "evidence": "The seven dimensions are inductively derived from thematic analysis of 24 interviews at a single firm, with participant counts in Table 3 ranging from 10 to 14 (i.e., fewer than 60% of participants discussed several themes). No formal coding methodology (e.g., grounded theory steps, codebook, inter-rater reliability) is reported, and the authors themselves note that some themes only 'emerged later in our review' (Transcript Analysis section). The taxonomy is plausible and well-illustrated by quotes but is not validated against external samples or by independent coders.",
      "id": "weakness-1",
      "locator": "Introduction; AI Transformation of Invisible Work; Table 2",
      "required_update": "State the qualitative analysis method explicitly (e.g., reflexive thematic analysis, grounded theory), describe codebook development, report inter-coder agreement (kappa or % agreement) between the two authors, and release the anonymized codebook plus de-identified quote table as supplementary material (e.g., supplementary/codebook.csv, supplementary/quote_table.csv).",
      "source_path": "corrections/2605.22707/paper.pdf",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Introduction; AI Transformation of Invisible Work; Table 2` is corrected or justified.",
      "weakness_index": 0
    },
    {
      "evidence": "Counts are internally consistent with N=24 and are reported as raw integers without confidence intervals or denominators normalized by interview length or prompt structure. Because the interview protocol explicitly prompted some of these areas (e.g., collaboration, feedback) while other themes 'emerged later,' the counts may reflect interviewer probing rather than spontaneous endorsement, biasing comparison across themes.",
      "id": "weakness-2",
      "locator": "Table 3",
      "required_update": "Disclose which themes were prompted vs. unprompted, report whether counts include only spontaneous mentions or also responses to direct probing, and provide the interview guide as supplementary material (e.g., supplementary/interview_protocol.pdf).",
      "source_path": "corrections/2605.22707/paper.pdf",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Table 3` is corrected or justified.",
      "weakness_index": 1
    },
    {
      "evidence": "The paper is based on 24 interviews at a single 'large AI-first technology firm' (identified contextually as Microsoft from the affiliation line). Recruitment was via manager email, introducing selection bias (managers nominate; volunteers self-select; one participant was 'particularly pessimistic'). The authors briefly acknowledge generalizability limits only in 'Ethical Considerations,' but the Discussion repeatedly states broad organizational implications without scoping language. No triangulation (e.g., survey of non-interviewees, observational data, archival records) is reported.",
      "id": "weakness-3",
      "locator": "Introduction; Discussion and Conclusion; Ethical Considerations",
      "required_update": "Scope discussion claims to the studied population (one large AI-first firm, four sociotechnical roles), explicitly list threats to validity (single-company effects, manager-mediated recruitment, voluntary participation, social-desirability bias toward an AI-positive employer narrative), and frame propositions as hypotheses for broader testing rather than findings.",
      "source_path": "corrections/2605.22707/paper.pdf",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Introduction; Discussion and Conclusion; Ethical Considerations` is corrected or justified.",
      "weakness_index": 2
    },
    {
      "evidence": "Supported qualitatively by multiple participant quotes (Participants F, L, Q, R, S, U, P) but presented without a counterfactual measurement (e.g., no pre/post help-seeking frequency data; no comparison to non-AI-first peers; no behavioral logs of communications, meetings, or chat usage). The interpretive leap from quotes to 'dismantling existing mechanisms' is a strong organizational-level claim that the interview-only design cannot directly evidence.",
      "id": "weakness-4",
      "locator": "Instructional Support and Feedback; Task Support and Collaboration; Discussion",
      "required_update": "Either soften to 'participants reported feeling more independent and reported reduced peer help-seeking,' or triangulate with behavioral data (e.g., aggregated, anonymized counts of Teams/Slack help-channel messages, calendar-meeting density, or a follow-up survey instrument).",
      "source_path": "corrections/2605.22707/paper.pdf",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Instructional Support and Feedback; Task Support and Collaboration; Discussion` is corrected or justified.",
      "weakness_index": 3
    },
    {
      "evidence": "The paper never explicitly names the company under study and frames it as 'a large technology firm,' but the author affiliation (Microsoft) and the description ('AI-first,' broad AI tooling suite) make the identity readily inferable. This creates an undisclosed researcher–participant power asymmetry (employees interviewed by their own employer's researchers) that is not analyzed as a threat to validity.",
      "id": "weakness-5",
      "locator": "Header; Participants",
      "required_update": "Add a positionality / conflict-of-interest paragraph stating that the researchers are employees of the studied organization, describe steps taken to mitigate response bias (e.g., guaranteed anonymity, no involvement of participants' managers in analysis, IRB protections beyond standard consent), and discuss social-desirability and self-censorship risks.",
      "source_path": "corrections/2605.22707/paper.pdf",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Header; Participants` is corrected or justified.",
      "weakness_index": 4
    },
    {
      "evidence": "The Transcript Analysis section describes only one coder/interviewer ('the interviewer collected the transcript, cleaned and anonymized it, and tagged it'), with no second coder, no inter-rater reliability metric, no member checking, no audit trail, no saturation analysis, and no codebook. Two participants opted out of AI transcription and the interviewer 'took notes manually,' creating an uncontrolled fidelity asymmetry between 22 AI transcripts and 2 note-only sources that is not addressed in the analysis.",
      "id": "weakness-6",
      "locator": "Transcript Analysis",
      "required_update": "Add a second independent coder for a subset (≥20%) of transcripts, report agreement statistics, document the codebook, discuss saturation, and explicitly state how the two non-transcribed interviews were treated (excluded? down-weighted? coded from notes only?). Provide a methodology appendix following COREQ or SRQR reporting standards.",
      "source_path": "corrections/2605.22707/paper.pdf",
      "source_role": "technical_correctness",
      "status": "open",
      "target_kind": "paper_tex",
      "verification_check": "Re-review should confirm `Transcript Analysis` is corrected or justified.",
      "weakness_index": 5
    }
  ],
  "strengths": [
    "The invisible-work theoretical framework is well-grounded in foundational literature (Daniels 1987; Hatton 2017; House and Kahn 1985), and the extension to AI-augmented knowledge work is coherent and clearly motivated.",
    "The seven-theme taxonomy is richly illustrated by verbatim participant quotes spanning three professional roles, providing thick qualitative evidence for the proposed dimensions.",
    "The productivity-versus-relational-erosion paradox is a timely and practically relevant contribution corroborated by multiple independent citations (Ehsan 2026; Hadley 2026; Brynjolfsson 2025; Ranganathan and Ye 2026).",
    "Sample composition is internally consistent—participant counts across role and gender sum correctly—and the sampling frame (manager-referred professionals at an AI-first firm) is clearly described.",
    "The paper offers concrete, actionable organizational recommendations that translate findings into guidance for HR professionals and leaders, extending its practical reach beyond the academic contribution."
  ],
  "summary": "This qualitative study examines how generative AI tools reshape invisible workplace work—mentoring, cross-discipline communication, reputation, and informal support networks—through 24 semi-structured interviews at a single large AI-first technology firm. The novelty specialist rated the contribution incremental (score 0.65, confidence 0.9): the invisible-work framing is solidly grounded in Daniels (1987) and Cross (2002), and the empirical extension to AI-augmented knowledge work is timely but builds on an established prior-art literature. The technical-correctness specialist found the paper mostly sound (confidence 0.72) but raised four major concerns: the seven-theme taxonomy lacks a named qualitative methodology, codebook, and inter-coder reliability statistics (C1, C5); generalizability claims in the Discussion are not scoped to the single-company, manager-mediated sample (C4); the headline claim that AI is 'dismantling existing mechanisms' of peer help-seeking exceeds what an interview-only design can support (C8); and no qualitative-analog proof-as-code bundle—interview protocol, codebook, quote-theme map, analysis scripts—is present (C9). The reproducibility specialist scored the paper 0.24 of 1.0 (confidence 0.87), flagging a critical absence of primary data artifacts and two major gaps in methodology transparency. The citation specialist failed before producing output (CliRunner timeout after 360 s); citation provenance cannot be assessed from specialist evidence and must be evaluated separately. The recommendation gate applies: cs.HC is in the code-amenable set, and both the technical-correctness and reproducibility specialists flagged missing qualitative-analysis artifacts at major and critical severity respectively. The missing artifacts undermine independent verifiability of the seven-theme taxonomy—the paper's headline claim—but do not render the findings implausible. Major revision to supply a reproducibility bundle, name the qualitative methodology, add inter-coder reliability, and tighten scope claims is required before acceptance.",
  "weaknesses": [
    "The seven-theme taxonomy lacks a disclosed qualitative analysis method (no named approach such as grounded theory or reflexive thematic analysis), no codebook, and no inter-coder reliability statistics, making the primary contribution unverifiable by independent reviewers (C1, C5, C9—all severity major).",
    "No qualitative reproducibility bundle is provided: the interview protocol, codebook, anonymized quote-to-theme mapping, and any analysis scripts are absent, preventing independent auditing of Table 3 theme counts and quoted evidence (reproducibility concern area=data, severity critical; area=evaluation, severity major).",
    "Discussion claims generalize broadly to 'the workplace' from 24 interviews at a single AI-first technology company with manager-mediated recruitment, without scoping language or enumerated threats to external validity (C4, severity major).",
    "The headline organizational claim that AI is 'dismantling existing mechanisms' of peer help-seeking is presented without counterfactual behavioral measurement (no pre/post data, no comparison group, no behavioral logs), overstating what the interview-only design can evidence (C8, severity major).",
    "The researcher–participant power asymmetry—Microsoft researchers interviewing employees at the studied organization—is not disclosed as a validity threat, leaving social-desirability and self-censorship risks unaddressed (C11, severity minor).",
    "Two interviews conducted via manual notes rather than AI transcription introduce an uncontrolled data-fidelity asymmetry between sources that is not acknowledged or addressed in the analysis (C5, severity major)."
  ]
}
```

### novelty (`gemini-3-flash-preview`) — status: `pass`

```json
{
  "confidence": 0.9,
  "missing_prior_art": [],
  "novelty_score": 0.65,
  "related_work": [
    {
      "citation_key": "daniels1987",
      "delta": "This paper introduced the concept of invisible work in domestic contexts. The current paper applies this concept to the modern workplace, examining how artificial intelligence transforms invisible work dimensions like mentoring and cross-discipline communication.",
      "relation": "prior_art",
      "title": "Invisible Work"
    },
    {
      "citation_key": "cross2002",
      "delta": "Cross et al. use social network analysis to map and make invisible collaboration patterns visible, whereas this paper explores how the introduction of generative AI shifts and disrupts these informal network patterns.",
      "relation": "prior_art",
      "title": "Making invisible work visible: Using social network analysis to support strategic collaboration"
    },
    {
      "citation_key": "brynjolfsson2025",
      "delta": "While Brynjolfsson et al. focus on the impact of generative AI on visible work outcomes (productivity and speed) for customer support agents, this paper focuses on the invisible, relationship-centric aspects of knowledge work.",
      "relation": "builds_on",
      "title": "Generative AI at work"
    },
    {
      "citation_key": "hadley2026",
      "delta": "While Hadley and Wright discuss the broad risks of employees relying on AI for personal support, this paper empirically investigates and categorizes how this reliance alters specific informal workplace interactions and professional networks.",
      "relation": "builds_on",
      "title": "Employees Are Relying on AI for Personal Support. That's Risky."
    },
    {
      "citation_key": "ehsan2026",
      "delta": "Ehsan et al. conceptualize asymptomatic AI harms to workers, whereas this paper documents empirical evidence of the erosion of workplace relationships and informal support systems resulting from AI tools.",
      "relation": "builds_on",
      "title": "From Future of Work to Future of Workers: Addressing Asymptomatic AI Harms to Foster Dignified Human-AI Interaction"
    },
    {
      "citation_key": "wang2025",
      "delta": "Wang et al. map AI capabilities directly onto occupational tasks across a broad range of occupations, whereas this paper uses qualitative interviews to focus on the social, interpersonal, and collaborative changes in job roles.",
      "relation": "orthogonal",
      "title": "How Do AI Agents Do Human Work? Comparing AI and Human Workflows Across Diverse Occupations"
    }
  ],
  "verdict": "incremental"
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
      "description": "The primary empirical artifacts are interview transcripts, manual notes, survey/contact responses, and tagged/anonymized transcript excerpts from employees at a single large technology firm, but none of these data are released or linked. This prevents independent auditing of the quoted evidence, theme counts, and claimed patterns.",
      "severity": "critical"
    },
    {
      "area": "evaluation",
      "description": "The transcript analysis is described only at a high level. The paper does not provide a full interview guide, survey/recruitment materials, a codebook, coded transcript excerpts, coder identities/counts, adjudication procedure, inter-coder agreement, or an audit trail from raw statements to the seven reported themes.",
      "severity": "major"
    },
    {
      "area": "other",
      "description": "The company, teams, products, AI tools, coworkers, customers, and organizational context are deliberately anonymized. This is ethically understandable, but it limits exact replication of the sample and makes it hard to assess how company-specific practices shaped the findings.",
      "severity": "major"
    },
    {
      "area": "code",
      "description": "No repository, release, license, or analysis scripts are provided. The study appears primarily qualitative, but any tooling used to tag transcripts, search correlations, or produce the theme counts is not specified or shareable.",
      "severity": "minor"
    },
    {
      "area": "evaluation",
      "description": "Participant selection and saturation are only partly documented: the paper gives role and gender counts, manager/individual-contributor status, and some AI-use self-reports, but no response rate, sampling frame size, exclusion counts, or rationale for why 24 interviews were sufficient for the reported claims.",
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
    "dependencies": [
      "Semi-structured one-hour video interviews with 24 participants",
      "Built-in transcription services for 22 interviews, with manual notes where transcription was declined",
      "Cleaned, anonymized, and question/theme-tagged transcripts",
      "Secondary transcript review after more than 80% of interviews were complete"
    ],
    "hardware": null,
    "software": "Video chat with built-in transcription services; exact platform, transcription model/version, qualitative analysis software, and tagging tools are not specified."
  },
  "reproducibility_score": 0.24
}
```

### summary (`claude-haiku-4-5-20251001`) — status: `pass`

```json
{
  "audience": "HR professionals and organizational leaders managing AI adoption; workplace researchers studying organizational culture and social support systems; technology workers concerned about career development in AI-forward companies; anyone interested in the human and cultural impacts of AI adoption beyond productivity metrics",
  "key_contributions": [
    "Identified and empirically documented seven distinct dimensions of how AI adoption affects invisible work (cross-discipline communication, role clarity, situational awareness, reputation/accountability, personal growth, instructional support, and task collaboration) in organizations",
    "Demonstrated that AI streamlines formal work productivity but simultaneously erodes informal support systems, mentoring, and professional networks critical to organizational health",
    "Revealed that workers using AI tools feel more independent and empowered for individual tasks but experience increased social isolation and reduced career networking opportunities",
    "Showed that AI adoption blurs job role boundaries and creates role uncertainty, as professionals in different disciplines can now perform adjacent skills",
    "Found that attention to knowledge sharing is declining as shorter-form, AI-generated content and AI-summarized documents replace deeper mentoring and documentation",
    "Documented the paradox that AI tools can simultaneously increase individual productivity while undermining organizational effectiveness through loss of mentoring, feedback, and social support networks",
    "Proposed practical strategies for organizations, leaders, and individuals to preserve human connection and informal learning while leveraging AI for efficiency"
  ],
  "plain_language_summary": "Researchers at Microsoft interviewed 24 professionals about how AI tools are changing their work. The paper identifies that while AI makes individual tasks faster and easier, it is disrupting the invisible work that holds organizations together—the mentoring, feedback, collaboration, and professional networks that help people grow and feel supported. For example, designers now sketch prototypes faster and show them directly to engineers, smoothing some communications, but this also blurs job roles and creates anxiety about who does what. Similarly, AI tools let people write documentation and find answers independently, which feels empowering, but it is replacing human relationships that are crucial for career growth.\n\nThe research found seven specific ways AI is changing invisible work, from making cross-disciplinary communication easier but more impersonal, to replacing mentors and feedback with AI chatbots. Workers report that as they use AI to solve problems alone, they have fewer reasons to reach out to colleagues, colleagues refer questions to AI instead of helping directly, and there are fewer spontaneous learning opportunities during meetings. The result is that workers feel more capable working alone but more isolated—at risk for loneliness, slower career advancement, and burnout.\n\nThe authors recommend that organizations and leaders actively work to preserve human connection, mentoring opportunities, and feedback even as AI takes over routine tasks. They propose that companies should make invisible work more visible, encourage face-to-face collaboration, hold workers accountable for high-quality AI-augmented work, and ensure that career growth opportunities like mentoring remain prioritized despite efficiency gains from AI.",
  "tldr": "AI is streamlining productivity but eroding the informal support systems and mentoring relationships that sustain workplace culture."
}
```

### technical_correctness (`claude-opus-4-7`) — status: `warn`

```json
{
  "claims": [
    {
      "assessment": "partially_supported",
      "claim": "AI is impacting invisible work across seven specific dimensions (cross-discipline communication, role clarity, situational awareness, reputation/accountability, personal growth, instructional support, task support).",
      "evidence": "The seven dimensions are inductively derived from thematic analysis of 24 interviews at a single firm, with participant counts in Table 3 ranging from 10 to 14 (i.e., fewer than 60% of participants discussed several themes). No formal coding methodology (e.g., grounded theory steps, codebook, inter-rater reliability) is reported, and the authors themselves note that some themes only 'emerged later in our review' (Transcript Analysis section). The taxonomy is plausible and well-illustrated by quotes but is not validated against external samples or by independent coders.",
      "id": "C1",
      "location": "Introduction; AI Transformation of Invisible Work; Table 2",
      "severity": "major",
      "suggested_fix": "State the qualitative analysis method explicitly (e.g., reflexive thematic analysis, grounded theory), describe codebook development, report inter-coder agreement (kappa or % agreement) between the two authors, and release the anonymized codebook plus de-identified quote table as supplementary material (e.g., supplementary/codebook.csv, supplementary/quote_table.csv)."
    },
    {
      "assessment": "partially_supported",
      "claim": "Participant counts per theme are: Cross-Discipline Communication 14, Role Clarity 14, Project Situational Awareness 14, Reputation and Accountability 13, Personal Growth and Learning 11, Instructional Support and Feedback 11, Task Support and Collaboration 10 (out of 24).",
      "evidence": "Counts are internally consistent with N=24 and are reported as raw integers without confidence intervals or denominators normalized by interview length or prompt structure. Because the interview protocol explicitly prompted some of these areas (e.g., collaboration, feedback) while other themes 'emerged later,' the counts may reflect interviewer probing rather than spontaneous endorsement, biasing comparison across themes.",
      "id": "C2",
      "location": "Table 3",
      "severity": "minor",
      "suggested_fix": "Disclose which themes were prompted vs. unprompted, report whether counts include only spontaneous mentions or also responses to direct probing, and provide the interview guide as supplementary material (e.g., supplementary/interview_protocol.pdf)."
    },
    {
      "assessment": "supported",
      "claim": "Sample composition: 24 participants drawn from Design (7), User Research (7), and Applied/Data Science (10), with reported gender splits in Table 1.",
      "evidence": "Counts sum to 24 (7+7+10) and gender splits sum within each row (Design 4+3=7; UR 4+3=7; ADS 5+5=10). Sampling frame (managers of those four professions at one AI-first company) is described.",
      "id": "C3",
      "location": "Participants; Table 1",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Findings generalize to inform broader claims about 'workplace' AI transformation and organizational culture changes (e.g., headline claim that 'AI is impacting the invisible work just as much or more than the visible work').",
      "evidence": "The paper is based on 24 interviews at a single 'large AI-first technology firm' (identified contextually as Microsoft from the affiliation line). Recruitment was via manager email, introducing selection bias (managers nominate; volunteers self-select; one participant was 'particularly pessimistic'). The authors briefly acknowledge generalizability limits only in 'Ethical Considerations,' but the Discussion repeatedly states broad organizational implications without scoping language. No triangulation (e.g., survey of non-interviewees, observational data, archival records) is reported.",
      "id": "C4",
      "location": "Introduction; Discussion and Conclusion; Ethical Considerations",
      "severity": "major",
      "suggested_fix": "Scope discussion claims to the studied population (one large AI-first firm, four sociotechnical roles), explicitly list threats to validity (single-company effects, manager-mediated recruitment, voluntary participation, social-desirability bias toward an AI-positive employer narrative), and frame propositions as hypotheses for broader testing rather than findings."
    },
    {
      "assessment": "partially_supported",
      "claim": "Themes were identified through a documented two-pass transcript analysis with secondary review after >80% of interviews were complete.",
      "evidence": "The Transcript Analysis section describes only one coder/interviewer ('the interviewer collected the transcript, cleaned and anonymized it, and tagged it'), with no second coder, no inter-rater reliability metric, no member checking, no audit trail, no saturation analysis, and no codebook. Two participants opted out of AI transcription and the interviewer 'took notes manually,' creating an uncontrolled fidelity asymmetry between 22 AI transcripts and 2 note-only sources that is not addressed in the analysis.",
      "id": "C5",
      "location": "Transcript Analysis",
      "severity": "major",
      "suggested_fix": "Add a second independent coder for a subset (≥20%) of transcripts, report agreement statistics, document the codebook, discuss saturation, and explicitly state how the two non-transcribed interviews were treated (excluded? down-weighted? coded from notes only?). Provide a methodology appendix following COREQ or SRQR reporting standards."
    },
    {
      "assessment": "supported",
      "claim": "AI use creates a 'paradox' / 'double-edged sword' in which generative AI 'can increase productivity on individual tasks, but also may induce stress through the increased intensity of work,' and increases efficiency while undermining relational standing.",
      "evidence": "This is a literature-grounded framing claim, attributed to multiple cited sources (Zhou et al. 2025; Reif, Larrick, and Soll 2025; Ranganathan and Ye 2026; Ehsan et al. 2026; Hadley and Wright 2024, 2026) and is consistent with this study's own qualitative observations of mixed empowerment / isolation effects.",
      "id": "C6",
      "location": "Related Work (paragraphs citing Zhou et al. 2025; Reif et al. 2025; Ranganathan and Ye 2026; Ehsan et al. 2026)",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "External quantitative figures are reported as background, e.g., 'agents could complete tasks ~90% faster than humans on the same set of 16 tasks (Wang et al. 2025)' and customer-support gains from Brynjolfsson, Li, and Raymond (2025).",
      "evidence": "These are claims from cited sources, not original empirical results of this paper. The '90% faster' figure is a strong, specific quantitative claim presented without page/table reference inside Wang et al. 2025 (arXiv:2510.22780) and without context about task selection or human baseline. Cherry-picking risk: only one effect size from each cited paper is reproduced.",
      "id": "C7",
      "location": "Introduction",
      "severity": "minor",
      "suggested_fix": "Add specific section/figure pointers within the cited works, briefly note the conditions under which the headline numbers hold (which 16 tasks; which population), and add at least one counter-evidence citation to balance the framing (the paper already cites Ranganathan and Ye 2026 for intensification — surface that contrast earlier)."
    },
    {
      "assessment": "partially_supported",
      "claim": "AI is causing a measurable shift toward worker independence and away from human-to-human help-seeking ('AI is empowering people to be independent at work and, at the same time, is dismantling the existing mechanisms').",
      "evidence": "Supported qualitatively by multiple participant quotes (Participants F, L, Q, R, S, U, P) but presented without a counterfactual measurement (e.g., no pre/post help-seeking frequency data; no comparison to non-AI-first peers; no behavioral logs of communications, meetings, or chat usage). The interpretive leap from quotes to 'dismantling existing mechanisms' is a strong organizational-level claim that the interview-only design cannot directly evidence.",
      "id": "C8",
      "location": "Instructional Support and Feedback; Task Support and Collaboration; Discussion",
      "severity": "major",
      "suggested_fix": "Either soften to 'participants reported feeling more independent and reported reduced peer help-seeking,' or triangulate with behavioral data (e.g., aggregated, anonymized counts of Teams/Slack help-channel messages, calendar-meeting density, or a follow-up survey instrument)."
    },
    {
      "assessment": "unsupported",
      "claim": "Field-gated proof-as-code applicability: This paper presents no theorems, simulations, formal proofs, ML benchmarks, or complexity arguments. Its load-bearing artifacts are interview transcripts, a thematic codebook, and a quote table.",
      "evidence": "The paper is qualitative HCI (cs.HC). The Proof-as-Code Axiom for code-amenable fields maps here to the qualitative analog: shipping an executable / inspectable analysis artifact (codebook, anonymized quote-to-theme mapping, interview protocol, analysis scripts in Python/R for theme counts and any descriptive statistics). None of these artifacts are linked or promised in the paper. Without them, the seven-theme taxonomy and Table 3 counts are not independently verifiable.",
      "id": "C9",
      "location": "Whole paper; Transcript Analysis",
      "severity": "major",
      "suggested_fix": "Ship a reproducibility bundle: supplementary/interview_protocol.pdf, supplementary/codebook.json, supplementary/quote_theme_map.csv (anonymized), and analysis/theme_counts.py (or .R) producing Tables 1 and 3 from the codebook. Register the study (or its protocol) on OSF and link the OSF DOI in the paper."
    },
    {
      "assessment": "supported",
      "claim": "Internal definitional consistency for 'invisible work' as used in the paper aligns with the cited foundational literature (Daniels 1987; Hatton 2017).",
      "evidence": "The paper's operationalization of invisible work (interpersonal, social, cultural tasks that are necessary but unrewarded — mentoring, knowledge transfer, rapport-building, feedback) matches Hatton (2017) and Daniels (1987), and is appropriately extended via House and Kahn (1985), Cohen and Wills (1985), and the JD-R model (Demerouti et al. 2001; Bakker and Demerouti 2017).",
      "id": "C10",
      "location": "Related Work; AI Transformation of Invisible Work",
      "severity": "info",
      "suggested_fix": null
    },
    {
      "assessment": "partially_supported",
      "claim": "Authorship and affiliation: 'Stephanie Rosenthal and Shamsi Iqbal, Microsoft Corporation' is the author block, implying the 'large AI-first technology firm' studied is the authors' own employer.",
      "evidence": "The paper never explicitly names the company under study and frames it as 'a large technology firm,' but the author affiliation (Microsoft) and the description ('AI-first,' broad AI tooling suite) make the identity readily inferable. This creates an undisclosed researcher–participant power asymmetry (employees interviewed by their own employer's researchers) that is not analyzed as a threat to validity.",
      "id": "C11",
      "location": "Header; Participants",
      "severity": "minor",
      "suggested_fix": "Add a positionality / conflict-of-interest paragraph stating that the researchers are employees of the studied organization, describe steps taken to mitigate response bias (e.g., guaranteed anonymity, no involvement of participants' managers in analysis, IRB protections beyond standard consent), and discuss social-desirability and self-censorship risks."
    },
    {
      "assessment": "supported",
      "claim": "The 'AI-as-Amplifier paradox' regarding independence and deskilling is consistent with this study's findings.",
      "evidence": "Citation to Ehsan et al. 2026 ('From Future of Work to Future of Workers') is appropriately used to frame the empirical observation that AI augments individual output while eroding skill-development and mentoring pathways.",
      "id": "C12",
      "location": "Discussion",
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
2. Reactive Writers: How Co-Writing with AI Changes
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
3. Fr¨og´eli, E.; Jenner, B.; and Gustavsson, P. 2023. Effectiveness of formal onboarding for facilitating organizational socialization: A systematic review. PloS one, 18(2): e0281823.
Gil-Garcia, J. R.; Guler, A.; Pardo, T. A.; and Burke, G. B.
4. Characterizing the importance of clarity of roles and
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
5. Hatton, E. 2017. Mechanisms of invisibility: rethinking the
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
6. Mendel, T.; Mandal, S.; Nov, O.; and Wiesenfeld, B. M.
7. Who is Responsible, the Advisor or the AI? Understanding the Effects of Advisors Disclosing Their AI Use on
Their Perceived Responsibility and AI Reliance. Proc. ACM
Hum.-Comput. Interact., 9(7).
Meske, C.; Hermanns, T.; Von der Weiden, E.; Loser, K.-U.;
and Berger, T. 2025. Vibe coding as a reconfiguration of
intent mediation in software development: Definition, implications, and research agenda. IEEE Access, 13: 213242–
8. Mitschelen, A.; and Kauffeld, S. 2025. Workplace learning
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
9. Pereira, V.; Hadjielias, E.; Christofi, M.; and Vrontis, D.
10. A systematic literature review on the impact of artificial intelligence on workplace outcomes: A multi-process
perspective. Human Resource Management Review, 33(1):
11. Poquet, O.; and De Laat, M. 2021. Developing capabilities:
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
Z.; Lee, K.; Pimenova, V.; Chen, X.; and Lukoff, K. arXiv:[2510.22780](https://arxiv.org/abs/2510.22780)
12. Generative Design and Vibe Coding: Rethinking The
Design-Development Divide for UI Prototyping. In Proceedings of the Extended Abstracts of the 2026 CHI Conference on Human Factors in Computing Systems, 1–3.
Zhang, Y.; Zhao, D.; Hancock, J. T.; Kraut, R.; and Yang,
D. 2025b. The rise of AI companions: how humanchatbot relationships influence well-being. arXiv preprint
arXiv:2506.12605.
Zhou, X.; Chen, C.; Li, W.; Yao, Y.; Cai, F.; Xu, J.; and Qin,
X. 2025. How Do Coworkers Interpret Employee AI Usage:
Coworkers’ Perceived Morality and Helping as Responses to
Employee AI Usage. Human Resource Management, 64(4):
1077–1097. arXiv:[2506.12605](https://arxiv.org/abs/2506.12605)

