module SemanticModel where

-- | Review roles emitted by the GrokRxiv specialist pipeline.
data ReviewRole
  = Citation
  | MetaReviewer
  | Novelty
  | Summary
  | TechnicalCorrectness
  deriving (Eq, Show)

-- | Verifier statuses attached to each emitted claim.
data VerifierStatus
  = Pass
  | Warn
  | Fail
  deriving (Eq, Show)

-- | Paper-derived claim record.
data Claim = Claim
  { claimId     :: String
  , claimRole   :: ReviewRole
  , claimText   :: String
  , claimStatus :: VerifierStatus
  } deriving (Eq, Show)

-- | Stable review identifier from the canonical input.
reviewId :: String
reviewId = "76665eba-7670-47ef-b69d-42a0af86eba7"

-- | Total number of claims represented in the semantic model.
claimCount :: Int
claimCount = 43

-- | Category histogram exactly matching the supplied semantic_model block.
categoryCounts :: [(ReviewRole, Int)]
categoryCounts =
  [ (Citation,             12)
  , (MetaReviewer,         15)
  , (Novelty,               9)
  , (Summary,               6)
  , (TechnicalCorrectness,  1)
  ]

-- | Twelve claims emitted by the citation specialist (all verifier_status = warn).
citationClaims :: [Claim]
citationClaims =
  [ Claim "claim_1"  Citation "Citation hygiene assessment"                Warn
  , Claim "claim_2"  Citation "Weyl 1921 historical source"                Warn
  , Claim "claim_3"  Citation "Co-authored by James Read"                  Warn
  , Claim "claim_4"  Citation "Philosophical and axiomatic context"        Warn
  , Claim "claim_5"  Citation "Modern Carrollian physics contribution"     Warn
  , Claim "claim_6"  Citation "Newton-Cartan geometry foundation"          Warn
  , Claim "claim_7"  Citation "Galilean Weyl-type theorem reference"       Warn
  , Claim "claim_8"  Citation "Galilei-Carroll duality reference"          Warn
  , Claim "claim_9"  Citation "EPS framework reference"                    Warn
  , Claim "claim_10" Citation "Constructive spacetime geometry reference"  Warn
  , Claim "claim_11" Citation "Primary author self-reference"              Warn
  , Claim "claim_12" Citation "Connection classification background"       Warn
  ]

-- | Fifteen meta-reviewer claims (all verifier_status = pass).
metaReviewerClaims :: [Claim]
metaReviewerClaims =
  [ Claim "claim_13" MetaReviewer "Significant extension of Weyl's theorem" Pass
  , Claim "claim_14" MetaReviewer "major_revision"                          Pass
  , Claim "claim_15" MetaReviewer "Unification across c-limits"             Pass
  , Claim "claim_16" MetaReviewer "Cumulative lineage and progress"         Pass
  , Claim "claim_17" MetaReviewer "Bibliography quality"                    Pass
  , Claim "claim_18" MetaReviewer "Connection-level reformulation"          Pass
  , Claim "claim_19" MetaReviewer "Missing conformal-structure definitions" Pass
  , Claim "claim_20" MetaReviewer "Headline theorems unverifiable"          Pass
  , Claim "claim_21" MetaReviewer "No formal proof artifact provided"       Pass
  , Claim "claim_22" MetaReviewer "Missing Carrollian references"           Pass
  , Claim "claim_23" MetaReviewer "Galilei conformal structure question"    Pass
  , Claim "claim_24" MetaReviewer "Carroll rank-degeneracy question"        Pass
  , Claim "claim_25" MetaReviewer "Torsion-free necessity question"         Pass
  , Claim "claim_26" MetaReviewer "Proof-assistant formalisation request"   Pass
  , Claim "claim_27" MetaReviewer "Failure conditions question"             Pass
  ]

-- | Nine novelty claims (all verifier_status = pass).
noveltyClaims :: [Claim]
noveltyClaims =
  [ Claim "claim_28" Novelty "significant"                              Pass
  , Claim "claim_29" Novelty "prior_art"                                Pass
  , Claim "claim_30" Novelty "Foundational pseudo-Riemannian result"    Pass
  , Claim "claim_31" Novelty "prior_art"                                Pass
  , Claim "claim_32" Novelty "Newtonian Weyl-type extension"            Pass
  , Claim "claim_33" Novelty "builds_on"                                Pass
  , Claim "claim_34" Novelty "Newton-Cartan recent developments"        Pass
  , Claim "claim_35" Novelty "builds_on"                                Pass
  , Claim "claim_36" Novelty "Unified affine connection toolkit"        Pass
  ]

-- | Six summary claims (all verifier_status = pass).
summaryClaims :: [Claim]
summaryClaims =
  [ Claim "claim_37" Summary "Extends Weyl to non-Lorentzian geometries" Pass
  , Claim "claim_38" Summary "Plain-language description of Weyl extension" Pass
  , Claim "claim_39" Summary "Extension to Galilei geometry"              Pass
  , Claim "claim_40" Summary "Extension to Carroll geometry"              Pass
  , Claim "claim_41" Summary "Connection and projective formulations"    Pass
  , Claim "claim_42" Summary "Foundational results for non-Lorentzian limits" Pass
  ]

-- | One technical-correctness claim (verifier_status = warn).
technicalCorrectnessClaims :: [Claim]
technicalCorrectnessClaims =
  [ Claim "claim_43" TechnicalCorrectness "questionable" Warn
  ]

-- | All paper-derived claims in canonical ordering.
allClaims :: [Claim]
allClaims =
     citationClaims
  ++ metaReviewerClaims
  ++ noveltyClaims
  ++ summaryClaims
  ++ technicalCorrectnessClaims

-- | Number of claims for a given review role, derived from 'allClaims'.
claimsForRole :: ReviewRole -> [Claim]
claimsForRole r = filter (\c -> claimRole c == r) allClaims

-- | Lower-bound publisher-readiness check.
--
-- The check is intentionally conservative: it returns 'True' only when the
-- represented claim set is internally consistent (cardinality matches
-- 'claimCount', no failure-status claims, every claim carries a non-empty id
-- and body, and every declared category count matches the materialised
-- claims).  It does NOT assert that the paper itself is publisher-ready.
publisherReadyLowerBound :: Bool
publisherReadyLowerBound =
     length allClaims == claimCount
  && all wellFormedClaim allClaims
  && not (any failed allClaims)
  && all matchesHistogram categoryCounts
  where
    wellFormedClaim c =
      not (null (claimId c)) && not (null (claimText c))
    failed c = claimStatus c == Fail
    matchesHistogram (role, expected) =
      length (claimsForRole role) == expected
