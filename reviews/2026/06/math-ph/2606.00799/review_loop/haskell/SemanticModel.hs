module SemanticModel where

-- | Source span pointing at the canonical IR artifact location.
data SourceSpan = SourceSpan
  { spanArtifact      :: String
  , spanPaperSourceId :: String
  , spanClaimId       :: Maybe String
  , spanTextExcerpt   :: Maybe String
  } deriving (Eq, Show)

-- | Typed mathematical sort for a term or proposition.
data MathType
  = TyProp
  | TyType
  | TySet         String
  | TyFun         MathType MathType
  | TyDependent   String MathType MathType
  | TyConstructor String [MathType]
  deriving (Eq, Show)

-- | Variable binder in a definition, theorem statement, or proof.
data Binder = Binder
  { binderName     :: String
  , binderType     :: MathType
  , binderImplicit :: Bool
  } deriving (Eq, Show)

-- | Term-level expression (paper-derived, free of review metadata).
data Term
  = TVar   String
  | TConst String
  | TApp   Term [Term]
  | TLam   [Binder] Term
  | TPi    [Binder] Term
  | TLet   String Term Term
  | TAnnot Term MathType
  deriving (Eq, Show)

-- | Propositional content of a definition, assumption, or theorem.
data Proposition
  = PTerm    Term
  | PEq      Term Term
  | PForall  [Binder] Proposition
  | PExists  [Binder] Proposition
  | PImplies Proposition Proposition
  | PAnd     [Proposition]
  | POr      [Proposition]
  | PNot     Proposition
  deriving (Eq, Show)

-- | Paper-introduced definition lifted into typed IR.
data Definition = Definition
  { defName    :: String
  , defBinders :: [Binder]
  , defType    :: MathType
  , defBody    :: Maybe Term
  , defSpan    :: SourceSpan
  } deriving (Eq, Show)

-- | Paper-stated hypothesis/assumption.
data Assumption = Assumption
  { assumeId        :: String
  , assumeStatement :: Proposition
  , assumeSpan      :: SourceSpan
  } deriving (Eq, Show)

-- | Paper-asserted theorem in typed mathematical IR form.
data TheoremIR = TheoremIR
  { thmId         :: String
  , thmBinders    :: [Binder]
  , thmHypotheses :: [Proposition]
  , thmConclusion :: Proposition
  , thmSpan       :: SourceSpan
  } deriving (Eq, Show)

-- | Review-role provenance category. Annotates typed math; does NOT replace
-- it. Only CatFormalMath ever participates in Lean obligation lifting.
data ClaimCategory
  = CatFormalMath
  | CatSummary
  | CatNovelty
  | CatCitation
  | CatTechnicalCorrectness
  | CatReproducibility
  | CatMetaReviewer
  deriving (Eq, Show)

-- | A claim from the review pipeline. Only CatFormalMath with a typed
-- Proposition and claimLeanEligible == True becomes a proof obligation.
data ClaimIR = ClaimIR
  { claimId           :: String
  , claimCategory     :: ClaimCategory
  , claimContent      :: Maybe Proposition
  , claimSpan         :: SourceSpan
  , claimLeanEligible :: Bool
  } deriving (Eq, Show)

-- | Proof obligation derived from typed mathematical content only.
data ProofObligation = ProofObligation
  { obligationId        :: String
  , obligationContext   :: [Assumption]
  , obligationStatement :: Proposition
  , obligationOrigin    :: SourceSpan
  } deriving (Eq, Show)

-- | Lean 4 declaration target deterministically emitted from an obligation.
data LeanTarget = LeanTarget
  { leanModule      :: String
  , leanDeclaration :: String
  , leanSignature   :: String
  , leanOrigin      :: SourceSpan
  } deriving (Eq, Show)

-- ---------------------------------------------------------------------------
-- Canonical IR contents derived from review_loop/semantic_ir.json.
-- The canonical IR contains NO paper-transcribed math (see limitation
-- no_paper_math_transcribed in semantic_ir.limitations); these lists are
-- therefore empty. Empty is the only honest projection of the IR.
-- ---------------------------------------------------------------------------

assumptionsIR :: [Assumption]
assumptionsIR = []

definitionsIR :: [Definition]
definitionsIR = []

theoremsIR :: [TheoremIR]
theoremsIR = []

-- | Review-role claims emitted by the pipeline are non-formal and are NOT
-- lifted into typed IR claims here; see semantic_ir.nonformal_review_claims.
claimsIR :: [ClaimIR]
claimsIR = []

-- ---------------------------------------------------------------------------
-- Mapping functions.
-- ---------------------------------------------------------------------------

-- | Map a semantic category onto the proof obligations that category emits.
-- Only CatFormalMath emits obligations. Every other review category is
-- treated strictly as annotation and produces no Lean obligation.
categoryToObligations :: ClaimCategory -> [ClaimIR] -> [ProofObligation]
categoryToObligations CatFormalMath cs =
  concatMap claimToObligations
    [c | c <- cs, claimCategory c == CatFormalMath, claimLeanEligible c]
categoryToObligations _ _ = []

-- | Map a single claim onto its proof obligations. Review-role claims emit
-- none; only typed mathematical content (CatFormalMath with a Proposition)
-- is lifted into an obligation.
claimToObligations :: ClaimIR -> [ProofObligation]
claimToObligations c =
  case (claimCategory c, claimContent c, claimLeanEligible c) of
    (CatFormalMath, Just p, True) ->
      [ProofObligation
        { obligationId        = "obligation_" ++ claimId c
        , obligationContext   = assumptionsIR
        , obligationStatement = p
        , obligationOrigin    = claimSpan c
        }]
    _ -> []

-- | Deterministic Lean 4 declaration target for an obligation. The signature
-- is the rendered Proposition; downstream proof terms MUST NOT use sorry,
-- admit, or axiom (see formalization_policy.forbidden_lean_terms).
obligationToLean :: ProofObligation -> LeanTarget
obligationToLean o = LeanTarget
  { leanModule      = "GrokRxiv.SemanticIR.Generated"
  , leanDeclaration = "theorem " ++ obligationId o
  , leanSignature   = renderProposition (obligationStatement o)
  , leanOrigin      = obligationOrigin o
  }

-- ---------------------------------------------------------------------------
-- Pure structural renderers (no review-role data participates).
-- ---------------------------------------------------------------------------

renderProposition :: Proposition -> String
renderProposition (PTerm t)      = renderTerm t
renderProposition (PEq l r)      = renderTerm l ++ " = " ++ renderTerm r
renderProposition (PForall bs p) = "forall " ++ renderBinders bs ++ ", " ++ renderProposition p
renderProposition (PExists bs p) = "exists " ++ renderBinders bs ++ ", " ++ renderProposition p
renderProposition (PImplies p q) = "(" ++ renderProposition p ++ ") -> (" ++ renderProposition q ++ ")"
renderProposition (PAnd ps)      = "(" ++ intercalateStr " /\\ " (map renderProposition ps) ++ ")"
renderProposition (POr  ps)      = "(" ++ intercalateStr " \\/ " (map renderProposition ps) ++ ")"
renderProposition (PNot p)       = "~(" ++ renderProposition p ++ ")"

renderTerm :: Term -> String
renderTerm (TVar n)      = n
renderTerm (TConst n)    = n
renderTerm (TApp f xs)   = "(" ++ renderTerm f ++ concatMap ((" " ++) . renderTerm) xs ++ ")"
renderTerm (TLam bs b)   = "(fun " ++ renderBinders bs ++ " => " ++ renderTerm b ++ ")"
renderTerm (TPi  bs b)   = "(forall " ++ renderBinders bs ++ ", " ++ renderTerm b ++ ")"
renderTerm (TLet n v b)  = "let " ++ n ++ " := " ++ renderTerm v ++ " in " ++ renderTerm b
renderTerm (TAnnot t ty) = "(" ++ renderTerm t ++ " : " ++ renderType ty ++ ")"

renderBinders :: [Binder] -> String
renderBinders bs = intercalateStr " " (map renderBinder bs)

renderBinder :: Binder -> String
renderBinder b
  | binderImplicit b = "{" ++ binderName b ++ " : " ++ renderType (binderType b) ++ "}"
  | otherwise        = "(" ++ binderName b ++ " : " ++ renderType (binderType b) ++ ")"

renderType :: MathType -> String
renderType TyProp                 = "Prop"
renderType TyType                 = "Type"
renderType (TySet s)              = s
renderType (TyFun a b)            = "(" ++ renderType a ++ " -> " ++ renderType b ++ ")"
renderType (TyDependent n a b)    = "(" ++ n ++ " : " ++ renderType a ++ ") -> " ++ renderType b
renderType (TyConstructor n args) = "(" ++ n ++ concatMap ((" " ++) . renderType) args ++ ")"

intercalateStr :: String -> [String] -> String
intercalateStr _   []     = ""
intercalateStr _   [x]    = x
intercalateStr sep (x:xs) = x ++ sep ++ intercalateStr sep xs

-- ---------------------------------------------------------------------------
-- Derived top-level artifacts.
-- ---------------------------------------------------------------------------

obligationsIR :: [ProofObligation]
obligationsIR = categoryToObligations CatFormalMath claimsIR

leanTargetsIR :: [LeanTarget]
leanTargetsIR = map obligationToLean obligationsIR
