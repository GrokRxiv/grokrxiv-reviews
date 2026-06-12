module SemanticModel where

import Data.List (nub)

-- SourceSpan: provenance pointer into a paper artifact (semantic_ir.json,
-- equations.json, theorem_graph.json, body.md) used so every IR record can
-- be traced back to its origin and replayed against canonical inputs.
data SourceSpan = SourceSpan
  { sourceArtifact :: String
  , sourcePaperId  :: Maybe String
  , sourceClaimId  :: Maybe String
  , sourceLocator  :: Maybe String
  } deriving (Eq, Show)

-- MathType: typed mathematical universe used by the transcription IR.
-- These constructors describe the kind of mathematical object a Term or
-- Definition inhabits (manifolds, connections, conformal/projective
-- structures, metrics, tensors), not any review-process category.
data MathType
  = TyManifold
  | TyVectorBundle MathType
  | TyTangentBundle
  | TyCotangentBundle
  | TyConnection MathType
  | TyMetric MathType
  | TyConformalStructure MathType
  | TyProjectiveStructure MathType
  | TyOneForm
  | TyTensor Int Int
  | TyProp
  | TyFun MathType MathType
  | TyNamed String
  deriving (Eq, Show)

-- Binder: a typed variable name introduced by a quantifier, lambda, or
-- definition signature.
data Binder = Binder
  { binderName :: String
  , binderType :: MathType
  } deriving (Eq, Show)

-- Term: typed mathematical expression. The IR keeps lambda-calculus shape
-- so theorem statements can be re-emitted into Lean 4 syntax later. Terms
-- never encode review categories or histograms.
data Term
  = TVar String MathType
  | TConst String MathType
  | TApp Term Term
  | TLam Binder Term
  | TAnnot Term MathType
  deriving (Eq, Show)

-- Proposition: typed logical statement at TyProp. Used for theorem
-- statements, assumptions, and definitional equalities transcribed from
-- the paper.
data Proposition
  = PEq Term Term
  | PForall Binder Proposition
  | PExists Binder Proposition
  | PImplies Proposition Proposition
  | PAnd Proposition Proposition
  | POr Proposition Proposition
  | PNot Proposition
  | PHolds Term
  deriving (Eq, Show)

-- Definition: a named, typed entity introduced (or referenced) by the
-- paper. The body is optional because some definitions are imported by
-- name from prior work cited in the paper.
data Definition = Definition
  { defName    :: String
  , defBinders :: [Binder]
  , defType    :: MathType
  , defBody    :: Maybe Term
  , defSource  :: SourceSpan
  } deriving (Eq, Show)

-- Assumption: a typed proposition serving as a hypothesis of a theorem.
data Assumption = Assumption
  { assumptionId        :: String
  , assumptionStatement :: Proposition
  , assumptionSource    :: SourceSpan
  } deriving (Eq, Show)

-- TheoremIR: a candidate theorem in transcription IR form. Statement is a
-- typed Proposition under explicit binders and assumptions, with full
-- source provenance so Lean emission is deterministic.
data TheoremIR = TheoremIR
  { theoremId          :: String
  , theoremBinders     :: [Binder]
  , theoremAssumptions :: [Assumption]
  , theoremStatement   :: Proposition
  , theoremSource      :: SourceSpan
  } deriving (Eq, Show)

-- SemanticCategory: annotation describing what kind of paper-derived
-- content a ClaimIR carries. Per the formalization policy these are
-- annotations OVER typed mathematics, never substitutes for it. Review
-- roles (summary, novelty, citation, meta_reviewer, technical_correctness)
-- are deliberately absent here; the corresponding claims land under
-- CatNonFormalContext.
data SemanticCategory
  = CatTheoremStatement
  | CatDefinition
  | CatAssumption
  | CatEquation
  | CatProofObligation
  | CatNonFormalContext
  deriving (Eq, Show)

-- ClaimIR: a paper-derived claim with provenance, semantic category, and
-- (when applicable) its typed Proposition. Lean-eligibility is decided by
-- category, not by review role.
data ClaimIR = ClaimIR
  { claimId           :: String
  , claimSource       :: SourceSpan
  , claimCategory     :: SemanticCategory
  , claimStatement    :: Maybe Proposition
  , claimLeanEligible :: Bool
  } deriving (Eq, Show)

-- ProofObligation: a typed mathematical goal to discharge in Lean,
-- including the binders in scope and the assumptions available. Always
-- derived from a ClaimIR in a formal category.
data ProofObligation = ProofObligation
  { obligationId          :: String
  , obligationClaimId     :: String
  , obligationBinders     :: [Binder]
  , obligationAssumptions :: [Assumption]
  , obligationGoal        :: Proposition
  , obligationSource      :: SourceSpan
  } deriving (Eq, Show)

-- LeanTarget: a deterministically-emitted Lean 4 declaration descriptor.
-- The signature is a textual rendering of the typed goal; sorry/admit/
-- axiom are never emitted by construction.
data LeanTarget = LeanTarget
  { leanDeclName   :: String
  , leanSignature  :: String
  , leanObligation :: String
  , leanSource     :: SourceSpan
  } deriving (Eq, Show)

-- Categories that yield Lean obligations. Theorem statements,
-- definitions, assumptions, equations, and explicit proof obligations are
-- formal mathematical content; non-formal review context is not.
formalCategories :: [SemanticCategory]
formalCategories =
  [ CatTheoremStatement
  , CatDefinition
  , CatAssumption
  , CatEquation
  , CatProofObligation
  ]

-- isFormalCategory: predicate used by the obligation generators to gate
-- which claims may seed Lean targets.
isFormalCategory :: SemanticCategory -> Bool
isFormalCategory cat = cat `elem` formalCategories

-- categoryToObligations: select claims of the given category from a pool
-- and turn each into its proof obligation(s). Non-formal categories yield
-- no obligations, enforcing the policy that review roles never reach Lean.
categoryToObligations :: SemanticCategory -> [ClaimIR] -> [ProofObligation]
categoryToObligations cat claims
  | isFormalCategory cat = concatMap claimToObligations matching
  | otherwise            = []
  where
    matching = filter (\c -> claimCategory c == cat) claims

-- claimToObligations: lift a single ClaimIR to its proof obligation list.
-- A claim contributes nothing unless it is Lean-eligible, lives in a
-- formal category, and carries a transcribed Proposition.
claimToObligations :: ClaimIR -> [ProofObligation]
claimToObligations c
  | not (claimLeanEligible c)         = []
  | not (isFormalCategory (claimCategory c)) = []
  | otherwise = case claimStatement c of
      Nothing   -> []
      Just prop ->
        [ ProofObligation
            { obligationId          = "obl_" ++ claimId c
            , obligationClaimId     = claimId c
            , obligationBinders     = []
            , obligationAssumptions = []
            , obligationGoal        = prop
            , obligationSource      = claimSource c
            }
        ]

-- obligationToLean: deterministic Lean 4 target emission. The declaration
-- name is derived from the obligation id; the signature is rendered from
-- the typed goal. No proof body is emitted here; the forbidden Lean terms
-- (sorry, admit, axiom) cannot be introduced by this function.
obligationToLean :: ProofObligation -> LeanTarget
obligationToLean o = LeanTarget
  { leanDeclName   = "thm_" ++ obligationId o
  , leanSignature  = renderProposition (obligationGoal o)
  , leanObligation = obligationId o
  , leanSource     = obligationSource o
  }

-- renderProposition / renderTerm / renderType: total textual rendering of
-- the typed IR for Lean signature emission. Intentionally minimal; not a
-- parser, not a proof checker, not a normalizer.
renderProposition :: Proposition -> String
renderProposition (PEq a b)      =
  "(" ++ renderTerm a ++ " = " ++ renderTerm b ++ ")"
renderProposition (PForall b p)  =
  "(forall " ++ binderName b ++ " : " ++ renderType (binderType b)
    ++ ", " ++ renderProposition p ++ ")"
renderProposition (PExists b p)  =
  "(exists " ++ binderName b ++ " : " ++ renderType (binderType b)
    ++ ", " ++ renderProposition p ++ ")"
renderProposition (PImplies a b) =
  "(" ++ renderProposition a ++ " -> " ++ renderProposition b ++ ")"
renderProposition (PAnd a b)     =
  "(" ++ renderProposition a ++ " /\\ " ++ renderProposition b ++ ")"
renderProposition (POr a b)      =
  "(" ++ renderProposition a ++ " \\/ " ++ renderProposition b ++ ")"
renderProposition (PNot p)       = "(~ " ++ renderProposition p ++ ")"
renderProposition (PHolds t)     = renderTerm t

renderTerm :: Term -> String
renderTerm (TVar n _)    = n
renderTerm (TConst n _)  = n
renderTerm (TApp f x)    = "(" ++ renderTerm f ++ " " ++ renderTerm x ++ ")"
renderTerm (TLam b body) =
  "(fun " ++ binderName b ++ " : " ++ renderType (binderType b)
    ++ " => " ++ renderTerm body ++ ")"
renderTerm (TAnnot t ty) =
  "(" ++ renderTerm t ++ " : " ++ renderType ty ++ ")"

renderType :: MathType -> String
renderType TyManifold                = "Manifold"
renderType (TyVectorBundle b)        = "VectorBundle " ++ renderType b
renderType TyTangentBundle           = "TangentBundle"
renderType TyCotangentBundle         = "CotangentBundle"
renderType (TyConnection m)          = "Connection " ++ renderType m
renderType (TyMetric m)              = "Metric " ++ renderType m
renderType (TyConformalStructure m)  = "ConformalStructure " ++ renderType m
renderType (TyProjectiveStructure m) = "ProjectiveStructure " ++ renderType m
renderType TyOneForm                 = "OneForm"
renderType (TyTensor p q)            = "Tensor " ++ show p ++ " " ++ show q
renderType TyProp                    = "Prop"
renderType (TyFun a b)               =
  "(" ++ renderType a ++ " -> " ++ renderType b ++ ")"
renderType (TyNamed n)               = n

-- The canonical IR for review eca527eb-3930-49e6-a828-66dd64611430
-- (arxiv:2606.00799). semantic_ir.json reports an empty theorem_graph and
-- equations list and a single limitation: "no_paper_math_transcribed".
-- The Haskell artifact is a faithful round-trip of that state: no formal
-- definitions, assumptions, or theorem candidates are encoded inline.
canonicalDefinitions :: [Definition]
canonicalDefinitions = []

canonicalAssumptions :: [Assumption]
canonicalAssumptions = []

canonicalTheorems :: [TheoremIR]
canonicalTheorems = []

-- Review-output records (summary / novelty / citation / meta_reviewer /
-- technical_correctness claims) are NOT modelled here. They are context,
-- not formal math sources, per the formalization policy
-- (reject_review_role_histograms = True). Keeping this list empty is the
-- enforcement: no obligations can be derived from review roles.
nonformalContextClaims :: [ClaimIR]
nonformalContextClaims = []

-- canonicalObligations: all obligations derivable from the canonical IR.
-- Empty by construction while no paper math has been transcribed.
canonicalObligations :: [ProofObligation]
canonicalObligations =
  concatMap (\cat -> categoryToObligations cat nonformalContextClaims)
            formalCategories

-- canonicalLeanTargets: Lean 4 declarations emitted from canonical
-- obligations. Empty whenever canonicalObligations is empty.
canonicalLeanTargets :: [LeanTarget]
canonicalLeanTargets = map obligationToLean canonicalObligations

-- obligationIdsUnique: structural invariant the IR must satisfy. True
-- trivially when canonicalObligations is empty; required to remain True
-- as the IR is populated from paper sources.
obligationIdsUnique :: Bool
obligationIdsUnique =
  let ids = map obligationId canonicalObligations
  in length ids == length (nub ids)
