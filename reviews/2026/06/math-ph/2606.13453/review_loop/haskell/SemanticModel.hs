module SemanticModel where

data SourceSpan = SourceSpan { sourceArtifact :: String, sourceClaimId :: String, sourcePaperSourceId :: String, sourceSectionId :: String, sourceTextExcerpt :: String } deriving (Eq, Show)

data MathType = UnknownType String | PropType | CustomType String deriving (Eq, Show)

data Term = UnknownTerm String | Var String | RawTerm String SourceSpan deriving (Eq, Show)

data Proposition = SemanticGap SourceSpan String | UninterpretedPredicate String [Term] SourceSpan | Equals Term Term | Implies Proposition Proposition | And [Proposition] deriving (Eq, Show)

data Binder = Binder { binderName :: String, binderType :: MathType, binderSpan :: SourceSpan } deriving (Eq, Show)

data Definition = Definition { definitionId :: String, definitionStatement :: String, definitionSpan :: SourceSpan } deriving (Eq, Show)

data Assumption = Assumption { assumptionId :: String, assumptionStatement :: String, assumptionSpan :: SourceSpan } deriving (Eq, Show)

data Limitation = Limitation { limitationId :: String, limitationKind :: String, limitationStatement :: String, limitationSpan :: SourceSpan } deriving (Eq, Show)

data LeanTarget = LeanTarget { targetDeclaration :: String, targetExpectedShape :: String, targetSource :: SourceSpan } deriving (Eq, Show)

data SemanticCategory = SemCatEquivalence | SemCatPlainTheorem | SemCatInvariantPreservation | SemCatOther String deriving (Eq, Show)

data TheoremKind = KindEquivalence | KindTheorem | KindInvariant | KindEquation | KindOther String deriving (Eq, Show)

data FormalizationClass = FormalMath | InformalProse | FCOther String deriving (Eq, Show)

data TranscriptionStatus = StatusTranscribed | StatusPartial | StatusUntranscribed | StatusOther String deriving (Eq, Show)

data TheoremIR = TheoremIR { theoremId :: String, theoremStatement :: String, theoremSpan :: SourceSpan, theoremBinders :: [Binder], theoremAssumptions :: [Proposition], theoremConclusion :: Proposition, theoremTarget :: LeanTarget, theoremKind :: TheoremKind, theoremSemanticCategory :: SemanticCategory, theoremFormalizationClass :: FormalizationClass, theoremTranscriptionStatus :: TranscriptionStatus } deriving (Eq, Show)

data ClaimIR = ClaimIR { claimId :: String, claimRawText :: String, claimSource :: SourceSpan, claimSemanticCategory :: SemanticCategory, claimTheorem :: Maybe TheoremIR } deriving (Eq, Show)

data ProofObligation = ProofObligation { obligationId :: String, obligationStatement :: Proposition, obligationSource :: SourceSpan, obligationLean :: LeanTarget } deriving (Eq, Show)

definitions :: [Definition]
definitions =
  [ Definition "definition_def:Langevingenerator" "Definition 17. Let $(M, g)$ be a Riemannian manifold, $F \\in C^\\infty(M)$, and $\\beta > 0$. The [generator of the Langevin dynamics]{.upright} $\\operatorname{L}$ is the operator acting on[^5] $C^2(M)$..." (SourceSpan "theorem_graph.json" "def:Langevingenerator" "def:Langevingenerator" "sec-2" "Definition 17. Let $(M, g)$ be a Riemannian manifold, $F \\in C^\\infty(M)$, and $\\beta > 0$. The [generator of the Langevin dynamics]{.upright} $\\operatorname{L}$ is the operator acting on[^5] $C^2(M)$...")
  , Definition "definition_thm-8" "Definition 18. Let $(\\Omega, \\mathcal{F}, \\mathbb{P})$ be a probability space and $M$ be a smooth manifold. A [continuous-time stochastic process]{.upright} in $M$ is a family of random variables $$\\{..." (SourceSpan "theorem_graph.json" "thm-8" "thm-8" "sec-2" "Definition 18. Let $(\\Omega, \\mathcal{F}, \\mathbb{P})$ be a probability space and $M$ be a smooth manifold. A [continuous-time stochastic process]{.upright} in $M$ is a family of random variables $$\\{...")
  , Definition "definition_def:LangevinDiffusion" "Definition 19. Given some filtered probability space $(\\Omega, \\mathcal{F})$, a compact Riemannian manifold $(M,g)$, the [Langevin diffusion process]{.upright} $X_t$ is the unique $\\mathcal{F}$-adapte..." (SourceSpan "theorem_graph.json" "def:LangevinDiffusion" "def:LangevinDiffusion" "sec-2" "Definition 19. Given some filtered probability space $(\\Omega, \\mathcal{F})$, a compact Riemannian manifold $(M,g)$, the [Langevin diffusion process]{.upright} $X_t$ is the unique $\\mathcal{F}$-adapte...")
  , Definition "definition_def:carreduchampLangevin" "Definition 20 (Carré du champ operator). Let $(M, g)$ be a compact manifold, and let $\\operatorname{L}$ be as given in [17](#def:Langevingenerator){reference-type=\"ref+label\" reference=\"def:Langevinge..." (SourceSpan "theorem_graph.json" "def:carreduchampLangevin" "def:carreduchampLangevin" "sec-2" "Definition 20 (Carré du champ operator). Let $(M, g)$ be a compact manifold, and let $\\operatorname{L}$ be as given in [17](#def:Langevingenerator){reference-type=\"ref+label\" reference=\"def:Langevinge...")
  , Definition "definition_def:markovtripleLangevin" "Definition 23 (Markov triple). Let $(M, g)$ be a compact manifold, $F \\in C^\\infty(M)$, ${\\beta >0}$, and $\\operatorname{L}$ be the associated Langevin diffusion generator. The [Markov triple]{.uprigh..." (SourceSpan "theorem_graph.json" "def:markovtripleLangevin" "def:markovtripleLangevin" "sec-2" "Definition 23 (Markov triple). Let $(M, g)$ be a compact manifold, $F \\in C^\\infty(M)$, ${\\beta >0}$, and $\\operatorname{L}$ be the associated Langevin diffusion generator. The [Markov triple]{.uprigh...")
  , Definition "definition_defPoincareIneq" "Definition 24 (Poincaré inequality). Let $(M, g)$ be a compact Riemannian manifold, $F \\in C^\\infty(M)$, and $\\beta >0$. The Markov triple $(M, \\nu, \\Gamma)$ satisfies a [Poincaré inequality]{.upright..." (SourceSpan "theorem_graph.json" "defPoincareIneq" "defPoincareIneq" "sec-2" "Definition 24 (Poincaré inequality). Let $(M, g)$ be a compact Riemannian manifold, $F \\in C^\\infty(M)$, and $\\beta >0$. The Markov triple $(M, \\nu, \\Gamma)$ satisfies a [Poincaré inequality]{.upright...")
  , Definition "definition_thm-17" "Definition 35 (Lyapunov function). Let $(M, g)$ be a Riemannian manifold, and let $\\operatorname{L}$ denote the Langevin generator from [17](#def:Langevingenerator){reference-type=\"ref+label\" referenc..." (SourceSpan "theorem_graph.json" "thm-17" "thm-17" "sec-2-2" "Definition 35 (Lyapunov function). Let $(M, g)$ be a Riemannian manifold, and let $\\operatorname{L}$ denote the Langevin generator from [17](#def:Langevingenerator){reference-type=\"ref+label\" referenc...")
  , Definition "definition_thm-18" "Definition 36 (Quasi-Lyapunov function). Let $(M, g)$ be a Riemannian manifold, and $\\operatorname{L}$ be the Langevin generator. A function $W: M \\rightarrow \\mathbb{R}$ is said to be a [quasi-Lyapun..." (SourceSpan "theorem_graph.json" "thm-18" "thm-18" "sec-2-2" "Definition 36 (Quasi-Lyapunov function). Let $(M, g)$ be a Riemannian manifold, and $\\operatorname{L}$ be the Langevin generator. A function $W: M \\rightarrow \\mathbb{R}$ is said to be a [quasi-Lyapun...")
  , Definition "definition_def:auxfunctionH" "Definition 45. Let $\\tilde F$ be the function on $B$ associated with the Markov triple $(B, \\tilde \\nu, \\tilde \\Gamma)$. Let $y \\in B$ be some fixed critical point of $\\tilde F$. Using normal coordina..." (SourceSpan "theorem_graph.json" "def:auxfunctionH" "def:auxfunctionH" "sec-2-2-2" "Definition 45. Let $\\tilde F$ be the function on $B$ associated with the Markov triple $(B, \\tilde \\nu, \\tilde \\Gamma)$. Let $y \\in B$ be some fixed critical point of $\\tilde F$. Using normal coordina...")
  , Definition "definition_def:tilder" "Definition 47. Let $y \\in B$ be fixed, and let $v \\in T_y B$ be a fixed unit vector. For every $x$ outside the cut locus of $y$, we define, in normal coordinates $$\\tilde{r}_{y, v}(x) := \\langle v, \\l..." (SourceSpan "theorem_graph.json" "def:tilder" "def:tilder" "sec-2-2-2" "Definition 47. Let $y \\in B$ be fixed, and let $v \\in T_y B$ be a fixed unit vector. For every $x$ outside the cut locus of $y$, we define, in normal coordinates $$\\tilde{r}_{y, v}(x) := \\langle v, \\l...")
  , Definition "definition_thm-66" "Definition 64 (Logarithmic Sobolev inequalities). We say that the Markov triple $(M, \\nu, \\Gamma)$ satisfies a [defective logarithmic Sobolev inequality]{.upright} with constants $\\alpha$ and $A > 0$,..." (SourceSpan "theorem_graph.json" "thm-66" "thm-66" "sec-4" "Definition 64 (Logarithmic Sobolev inequalities). We say that the Markov triple $(M, \\nu, \\Gamma)$ satisfies a [defective logarithmic Sobolev inequality]{.upright} with constants $\\alpha$ and $A > 0$,...")
  , Definition "definition_thm-67" "Definition 65 (Total variation distance). Let $\\mu$ and $\\nu$ be two probability measures on a measure space $(E, \\mathcal{F})$. Then we define their total variation distance as $$\\norm{\\mu - \\nu}_{\\t..." (SourceSpan "theorem_graph.json" "thm-67" "thm-67" "sec-4" "Definition 65 (Total variation distance). Let $\\mu$ and $\\nu$ be two probability measures on a measure space $(E, \\mathcal{F})$. Then we define their total variation distance as $$\\norm{\\mu - \\nu}_{\\t...")
  , Definition "definition_thm-75" "Definition 71 (Wasserstein distance). Let $(\\mathcal{X}, d)$ be a separable and complete metric space, and let $p \\in [1, \\infty)$. Let $\\mu$ and $\\eta$ be two probability measures of $\\mathcal{X}$. W..." (SourceSpan "theorem_graph.json" "thm-75" "thm-75" "sec-4-1" "Definition 71 (Wasserstein distance). Let $(\\mathcal{X}, d)$ be a separable and complete metric space, and let $p \\in [1, \\infty)$. Let $\\mu$ and $\\eta$ be two probability measures of $\\mathcal{X}$. W...")
  , Definition "definition_prop:mainthmtrace1" "Proposition 87. Let $F$, $f$ and $\\tilde f$ be defined as in [\\[eq:traceratiofunction,eq:traceratioUn,eq:traceratiograssmann\\]](#eq:traceratiofunction,eq:traceratioUn,eq:traceratiograssmann){reference..." (SourceSpan "theorem_graph.json" "prop:mainthmtrace1" "prop:mainthmtrace1" "sec-7-1-2" "Proposition 87. Let $F$, $f$ and $\\tilde f$ be defined as in [\\[eq:traceratiofunction,eq:traceratioUn,eq:traceratiograssmann\\]](#eq:traceratiofunction,eq:traceratioUn,eq:traceratiograssmann){reference...")
  , Definition "definition_prop:mainthmtrace2" "Proposition 92. Let $F$, $f$ and $\\tilde f$ be defined as in [\\[eq:traceratiofunction,eq:traceratioUn,eq:traceratiograssmann\\]](#eq:traceratiofunction,eq:traceratioUn,eq:traceratiograssmann){reference..." (SourceSpan "theorem_graph.json" "prop:mainthmtrace2" "prop:mainthmtrace2" "sec-7-1-2" "Proposition 92. Let $F$, $f$ and $\\tilde f$ be defined as in [\\[eq:traceratiofunction,eq:traceratioUn,eq:traceratiograssmann\\]](#eq:traceratiofunction,eq:traceratioUn,eq:traceratiograssmann){reference...")
  , Definition "definition_CriticalPointsOneGate" "Proposition 97. Let $\\hat{H}$ be some Hermitian matrix and let $f$ be defined as $$\\begin{align} f: &\\ \\textup{SU}(n) \\rightarrow \\mathbb{R}\\\\ &U \\mapsto \\bra{0}U^\\dagger \\hat{H} U \\ket{0}, \\end{align..." (SourceSpan "theorem_graph.json" "CriticalPointsOneGate" "CriticalPointsOneGate" "sec-7-2-1" "Proposition 97. Let $\\hat{H}$ be some Hermitian matrix and let $f$ be defined as $$\\begin{align} f: &\\ \\textup{SU}(n) \\rightarrow \\mathbb{R}\\\\ &U \\mapsto \\bra{0}U^\\dagger \\hat{H} U \\ket{0}, \\end{align...")
  , Definition "definition_thm:descriptioncriticalpointsIsing" "Proposition 99. Let $F$ be defined as in [\\[eq:isingfunction\\]](#eq:isingfunction){reference-type=\"ref+label\" reference=\"eq:isingfunction\"}. Then every critical point of $F$ corresponds to an eigenvec..." (SourceSpan "theorem_graph.json" "thm:descriptioncriticalpointsIsing" "thm:descriptioncriticalpointsIsing" "sec-7-2-1" "Proposition 99. Let $F$ be defined as in [\\[eq:isingfunction\\]](#eq:isingfunction){reference-type=\"ref+label\" reference=\"eq:isingfunction\"}. Then every critical point of $F$ corresponds to an eigenvec...")
  , Definition "definition_prop:mainthmising1" "Proposition 104. Let $F: \\textup{SU}(2)^{\\times n^2} \\to \\mathbb{R}$ be defined as in [\\[eq:isingfunction\\]](#eq:isingfunction){reference-type=\"ref+label\" reference=\"eq:isingfunction\"} and let $\\tilde..." (SourceSpan "theorem_graph.json" "prop:mainthmising1" "prop:mainthmising1" "sec-7-2-2" "Proposition 104. Let $F: \\textup{SU}(2)^{\\times n^2} \\to \\mathbb{R}$ be defined as in [\\[eq:isingfunction\\]](#eq:isingfunction){reference-type=\"ref+label\" reference=\"eq:isingfunction\"} and let $\\tilde...")
  , Definition "definition_prop:mainthmising2" "Proposition 106. Let $F: \\textup{SU}(2)^{\\times n^2} \\to \\mathbb{R}$ be defined as in [\\[eq:isingfunction\\]](#eq:isingfunction){reference-type=\"ref+label\" reference=\"eq:isingfunction\"} and let $\\tilde..." (SourceSpan "theorem_graph.json" "prop:mainthmising2" "prop:mainthmising2" "sec-7-2-2" "Proposition 106. Let $F: \\textup{SU}(2)^{\\times n^2} \\to \\mathbb{R}$ be defined as in [\\[eq:isingfunction\\]](#eq:isingfunction){reference-type=\"ref+label\" reference=\"eq:isingfunction\"} and let $\\tilde...")
  , Definition "definition_thm-125" "Definition 108 (Lie group). A [Lie group]{.upright} is a group $G$ that can be endowed with a smooth (real) manifold structure in such a way that both the group operation and the inverse map are smoot..." (SourceSpan "theorem_graph.json" "thm-125" "thm-125" "sec-9-1" "Definition 108 (Lie group). A [Lie group]{.upright} is a group $G$ that can be endowed with a smooth (real) manifold structure in such a way that both the group operation and the inverse map are smoot...")
  , Definition "definition_thm-127" "Definition 110 (Lie bracket). Given a Lie algebra $\\mathfrak{g}$, a [Lie bracket]{.upright} is a bilinear map $$[\\cdot, \\cdot] : \\mathfrak{g} \\times \\mathfrak{g} \\to \\mathfrak{g},$$ satisfying - $[u, ..." (SourceSpan "theorem_graph.json" "thm-127" "thm-127" "sec-9-1" "Definition 110 (Lie bracket). Given a Lie algebra $\\mathfrak{g}$, a [Lie bracket]{.upright} is a bilinear map $$[\\cdot, \\cdot] : \\mathfrak{g} \\times \\mathfrak{g} \\to \\mathfrak{g},$$ satisfying - $[u, ...")
  , Definition "definition_thm-130" "Definition 113 (Bi-invariant metric). Given a linear Lie group $G$ endowed with a Riemannian metric $g$, we say that $g$ is [bi-invariant]{.upright} if, for every $a, b \\in G$ and every $X, Y \\in T_b ..." (SourceSpan "theorem_graph.json" "thm-130" "thm-130" "sec-9-1" "Definition 113 (Bi-invariant metric). Given a linear Lie group $G$ endowed with a Riemannian metric $g$, we say that $g$ is [bi-invariant]{.upright} if, for every $a, b \\in G$ and every $X, Y \\in T_b ...")
  , Definition "definition_def:symmetricspace" "Definition 116. A connected Riemannian manifold $(M, g)$ is a [symmetric space]{.upright} if for each point $p \\in M$ there exists a point reflexion, i.e. an isometry $\\varphi : M \\to M$ that fixes $p..." (SourceSpan "theorem_graph.json" "def:symmetricspace" "def:symmetricspace" "sec-9-1" "Definition 116. A connected Riemannian manifold $(M, g)$ is a [symmetric space]{.upright} if for each point $p \\in M$ there exists a point reflexion, i.e. an isometry $\\varphi : M \\to M$ that fixes $p...")
  , Definition "definition_thm-134" "Definition 117 (Killing form). Given a Lie algebra $\\mathfrak{g}$ of a linear Lie group $G$, the [Killing form]{.upright} of $G$ is a symmetric bilinear form $\\mathfrak{B}: \\mathfrak{g} \\times \\mathfr..." (SourceSpan "theorem_graph.json" "thm-134" "thm-134" "sec-9-1-1" "Definition 117 (Killing form). Given a Lie algebra $\\mathfrak{g}$ of a linear Lie group $G$, the [Killing form]{.upright} of $G$ is a symmetric bilinear form $\\mathfrak{B}: \\mathfrak{g} \\times \\mathfr...")
  , Definition "definition_thm-147" "Definition 126 (Einstein manifold). We say a manifold $M$ is [Einstein]{.upright} if $$\\textup{Ric}_g = \\lambda g,$$ for some constant $\\lambda \\in \\mathbb{R}$." (SourceSpan "theorem_graph.json" "thm-147" "thm-147" "sec-9-2" "Definition 126 (Einstein manifold). We say a manifold $M$ is [Einstein]{.upright} if $$\\textup{Ric}_g = \\lambda g,$$ for some constant $\\lambda \\in \\mathbb{R}$.")
  , Definition "definition_def:exponentialmap" "Definition 128 (Exponential map, logarithm). Let $(M, g)$ be a compact[^14] Riemannian manifold. For every $x \\in M$, the [exponential map]{.upright} at $p$, $\\exp_p : T_p M \\to M$, is defined as $$\\e..." (SourceSpan "theorem_graph.json" "def:exponentialmap" "def:exponentialmap" "sec-9-3" "Definition 128 (Exponential map, logarithm). Let $(M, g)$ be a compact[^14] Riemannian manifold. For every $x \\in M$, the [exponential map]{.upright} at $p$, $\\exp_p : T_p M \\to M$, is defined as $$\\e...")
  , Definition "definition_def:injectivityradius" "Definition 130 (Injectivity Radius). Let $(M, g)$ be a Riemannian manifold. The [injectivity radius]{.upright} of $M$, denoted by $i(M)$, is the greatest radius $r > 0$ for which the exponential map d..." (SourceSpan "theorem_graph.json" "def:injectivityradius" "def:injectivityradius" "sec-9-3" "Definition 130 (Injectivity Radius). Let $(M, g)$ be a Riemannian manifold. The [injectivity radius]{.upright} of $M$, denoted by $i(M)$, is the greatest radius $r > 0$ for which the exponential map d...")
  , Definition "definition_thm-153" "Definition 132 (Cut locus). Let $(M, g)$ be a complete and connected Riemannian manifold, and let $p \\in M$, $v \\in T_p M$. We define the [cut time]{.upright} associated with $p$ and $v$ as the maximu..." (SourceSpan "theorem_graph.json" "thm-153" "thm-153" "sec-9-3" "Definition 132 (Cut locus). Let $(M, g)$ be a complete and connected Riemannian manifold, and let $p \\in M$, $v \\in T_p M$. We define the [cut time]{.upright} associated with $p$ and $v$ as the maximu...")
  , Definition "definition_thm-154" "Definition 133. Given a manifold $M$ a subset $U \\subset M$ is said to be [geodesically convex]{.upright}---or simply [convex]{.upright}---if, for any two points $x$ and $y$ in $U$, there exists a uni..." (SourceSpan "theorem_graph.json" "thm-154" "thm-154" "sec-9-3" "Definition 133. Given a manifold $M$ a subset $U \\subset M$ is said to be [geodesically convex]{.upright}---or simply [convex]{.upright}---if, for any two points $x$ and $y$ in $U$, there exists a uni...")
  , Definition "definition_thm-155" "Definition 134 (Convexity radius). The [convexity radius]{.upright} of a Riemannian manifold, denoted by $\\mathit{conv}(M)$, is the greatest radius $r > 0$ for which the ball $\\mathcal{B}(r,x)$ is geo..." (SourceSpan "theorem_graph.json" "thm-155" "thm-155" "sec-9-3" "Definition 134 (Convexity radius). The [convexity radius]{.upright} of a Riemannian manifold, denoted by $\\mathit{conv}(M)$, is the greatest radius $r > 0$ for which the ball $\\mathcal{B}(r,x)$ is geo...")
  , Definition "definition_thm-157" "Definition 136 (Submersion). Let $M$ and $B$ be two smooth manifolds, and let $F : M \\rightarrow B$ be a smooth map. We say that $F$ is a [submersion]{.upright} if its differential $F_|_p$ is surjecti..." (SourceSpan "theorem_graph.json" "thm-157" "thm-157" "sec-9-4" "Definition 136 (Submersion). Let $M$ and $B$ be two smooth manifolds, and let $F : M \\rightarrow B$ be a smooth map. We say that $F$ is a [submersion]{.upright} if its differential $F_|_p$ is surjecti...")
  , Definition "definition_verticalhorizontaltangent" "Definition 137 (Vertical and horizontal tangent spaces). Given a submersion $\\pi: M \\rightarrow B$, we define the [vertical tangent space]{.upright} at $p \\in M$ as $V_p M := \\ker \\pi_|_p$. Note that ..." (SourceSpan "theorem_graph.json" "verticalhorizontaltangent" "verticalhorizontaltangent" "sec-9-4" "Definition 137 (Vertical and horizontal tangent spaces). Given a submersion $\\pi: M \\rightarrow B$, we define the [vertical tangent space]{.upright} at $p \\in M$ as $V_p M := \\ker \\pi_|_p$. Note that ...")
  , Definition "definition_thm-159" "Definition 139 (Riemannian Submersion). Let $(M, g)$ and $(B, h)$ be two Riemannian manifolds, and let $\\pi: M \\rightarrow B$ be a submersion. We say $\\pi$ is a [Riemannian submersion]{.upright} if fo..." (SourceSpan "theorem_graph.json" "thm-159" "thm-159" "sec-9-4" "Definition 139 (Riemannian Submersion). Let $(M, g)$ and $(B, h)$ be two Riemannian manifolds, and let $\\pi: M \\rightarrow B$ be a submersion. We say $\\pi$ is a [Riemannian submersion]{.upright} if fo...")
  , Definition "definition_thm-163" "Definition 142 (Group action on a manifold). Let $G$ be a group and $M$ be a manifold. A [left action]{.upright} of $G$ on $M$ is a map $G \\times M \\to M$, usually denoted as $(x, p) \\mapsto x\\cdot p$..." (SourceSpan "theorem_graph.json" "thm-163" "thm-163" "sec-9-4" "Definition 142 (Group action on a manifold). Let $G$ be a group and $M$ be a manifold. A [left action]{.upright} of $G$ on $M$ is a map $G \\times M \\to M$, usually denoted as $(x, p) \\mapsto x\\cdot p$...")
  , Definition "definition_thm-164" "Definition 143 (Free action). A group action of $G$ on a manifold $M$ is [free]{.upright} if for every $p \\in M$, $$\\{x \\in G : x p = p\\} = \\{e\\},$$ where $e$ denotes the unit of $G$." (SourceSpan "theorem_graph.json" "thm-164" "thm-164" "sec-9-4" "Definition 143 (Free action). A group action of $G$ on a manifold $M$ is [free]{.upright} if for every $p \\in M$, $$\\{x \\in G : x p = p\\} = \\{e\\},$$ where $e$ denotes the unit of $G$.")
  , Definition "definition_thm-165" "Definition 144 (Smooth action). The action of a Lie group $G$ on a manifold $M$ is [smooth]{.upright} if the map $G \\times M \\rightarrow M$ given by $(x, p)\\mapsto x \\cdot p$ is smooth." (SourceSpan "theorem_graph.json" "thm-165" "thm-165" "sec-9-4" "Definition 144 (Smooth action). The action of a Lie group $G$ on a manifold $M$ is [smooth]{.upright} if the map $G \\times M \\rightarrow M$ given by $(x, p)\\mapsto x \\cdot p$ is smooth.")
  , Definition "definition_thm-166" "Definition 145 (Proper action). A group action of $G$ on a manifold $M$ is said to be [proper]{.upright} if the map $$\\begin{align} G \\times M &\\rightarrow M \\times M\\\\ (x, p) &\\mapsto (x\\cdot p, p) \\..." (SourceSpan "theorem_graph.json" "thm-166" "thm-166" "sec-9-4" "Definition 145 (Proper action). A group action of $G$ on a manifold $M$ is said to be [proper]{.upright} if the map $$\\begin{align} G \\times M &\\rightarrow M \\times M\\\\ (x, p) &\\mapsto (x\\cdot p, p) \\...")
  , Definition "definition_thm-167" "Definition 146 (Isometric action). A group action of $G$ on a Riemannian manifold $(M, g)$ is said to be [isometric]{.upright} if, for every $x \\in G$, the map $$\\begin{align} \\alpha_x : M &\\to M\\\\ p ..." (SourceSpan "theorem_graph.json" "thm-167" "thm-167" "sec-9-4" "Definition 146 (Isometric action). A group action of $G$ on a Riemannian manifold $(M, g)$ is said to be [isometric]{.upright} if, for every $x \\in G$, the map $$\\begin{align} \\alpha_x : M &\\to M\\\\ p ...")
  , Definition "definition_thm-169" "Definition 148. Let $M$ and $B$ be two connected manifolds. We say that $\\pi: M \\to B$ is a [locally trivial fibration, or fiber bundle with fiber $F$]{.upright} if it satisfies all of the following c..." (SourceSpan "theorem_graph.json" "thm-169" "thm-169" "sec-9-4" "Definition 148. Let $M$ and $B$ be two connected manifolds. We say that $\\pi: M \\to B$ is a [locally trivial fibration, or fiber bundle with fiber $F$]{.upright} if it satisfies all of the following c...")
  , Definition "definition_thm-172" "Definition 151 (Totally geodesic submanifold). A Riemannian submanifold $(\\tilde{M}, \\tilde{g})$ of $(M, g)$ is said to be [totally geodesic]{.upright} if every $g$-geodesic that is tangent to $\\tilde..." (SourceSpan "theorem_graph.json" "thm-172" "thm-172" "sec-9-4" "Definition 151 (Totally geodesic submanifold). A Riemannian submanifold $(\\tilde{M}, \\tilde{g})$ of $(M, g)$ is said to be [totally geodesic]{.upright} if every $g$-geodesic that is tangent to $\\tilde...")
  , Definition "definition_defOneilTensors" "Definition 153 (O'Neill tensor). Let $\\pi : M \\to B$ be a Riemannian submersion. For any two vector fields $E, F \\in \\mathfrak{X}(M)$, we define the [O'Neill tensor]{.upright} $T$ as $$T_E F := (\\nabl..." (SourceSpan "theorem_graph.json" "defOneilTensors" "defOneilTensors" "sec-9-4-1" "Definition 153 (O'Neill tensor). Let $\\pi : M \\to B$ be a Riemannian submersion. For any two vector fields $E, F \\in \\mathfrak{X}(M)$, we define the [O'Neill tensor]{.upright} $T$ as $$T_E F := (\\nabl...")
  , Definition "definition_thm-181" "Definition 158 (Stiefel manifold). Given $k, n \\in \\mathbb{N}$ with $1 \\leq k \\leq n$, the set of linear isometries from $\\mathbb{C}^k$ to $\\mathbb{C}^n$ is a smooth manifold known as the [complex Sti..." (SourceSpan "theorem_graph.json" "thm-181" "thm-181" "sec-9-4-2" "Definition 158 (Stiefel manifold). Given $k, n \\in \\mathbb{N}$ with $1 \\leq k \\leq n$, the set of linear isometries from $\\mathbb{C}^k$ to $\\mathbb{C}^n$ is a smooth manifold known as the [complex Sti...")
  , Definition "definition_thm-186" "Definition 161 (Grassmann manifold). We define the [complex Grassmann manifold]{.upright} $\\textup{Gr}_k(\\mathbb{C}^n)$ as $$\\textup{Gr}_k(\\mathbb{C}^n) = \\{P \\in \\mathbb{C}^{n \\times n} : P^\\dagger =..." (SourceSpan "theorem_graph.json" "thm-186" "thm-186" "sec-9-4-3" "Definition 161 (Grassmann manifold). We define the [complex Grassmann manifold]{.upright} $\\textup{Gr}_k(\\mathbb{C}^n)$ as $$\\textup{Gr}_k(\\mathbb{C}^n) = \\{P \\in \\mathbb{C}^{n \\times n} : P^\\dagger =...")
  , Definition "definition_thm-188" "Definition 163. Let $\\pi: (M, g) \\to (B, h)$ be a Riemannian submersion, let $x \\in M$, and let $v \\in T_{\\pi(x)} B$. The [horizontal lift]{.upright} of $v$ at $x$, denoted as $\\textup{lift}_x\\, v$, i..." (SourceSpan "theorem_graph.json" "thm-188" "thm-188" "sec-9-5" "Definition 163. Let $\\pi: (M, g) \\to (B, h)$ be a Riemannian submersion, let $x \\in M$, and let $v \\in T_{\\pi(x)} B$. The [horizontal lift]{.upright} of $v$ at $x$, denoted as $\\textup{lift}_x\\, v$, i...")
  , Definition "definition_thm-189" "Definition 164 (Gradient). Let $(M, g)$ be a Riemannian manifold. Given a differentiable function $f: M \\rightarrow \\mathbb{R}$, the [gradient]{.upright} of $f$, denoted by $\\textup{grad}_{g}\\, f$ it ..." (SourceSpan "theorem_graph.json" "thm-189" "thm-189" "sec-9-5" "Definition 164 (Gradient). Let $(M, g)$ be a Riemannian manifold. Given a differentiable function $f: M \\rightarrow \\mathbb{R}$, the [gradient]{.upright} of $f$, denoted by $\\textup{grad}_{g}\\, f$ it ...")
  , Definition "definition_definicionhessian" "Definition 167 (Hessian). Let $(M, g)$ be a Riemannian manifold. Let $f : M \\rightarrow \\mathbb{R}$ be a twice differentiable function on $M$. The [Hessian]{.upright} of $f$ is the tensor defined as $..." (SourceSpan "theorem_graph.json" "definicionhessian" "definicionhessian" "sec-9-5" "Definition 167 (Hessian). Let $(M, g)$ be a Riemannian manifold. Let $f : M \\rightarrow \\mathbb{R}$ be a twice differentiable function on $M$. The [Hessian]{.upright} of $f$ is the tensor defined as $...")
  , Definition "definition_thm-197" "Definition 171 (Laplace-Beltrami operator). Given a Riemannian manifold $(M, g)$, let $f : M \\to \\mathbb{R}$ be twice differentiable. We define the [Laplacian]{.upright} of $f$ as $$\\Delta_g f = \\text..." (SourceSpan "theorem_graph.json" "thm-197" "thm-197" "sec-9-5" "Definition 171 (Laplace-Beltrami operator). Given a Riemannian manifold $(M, g)$, let $f : M \\to \\mathbb{R}$ be twice differentiable. We define the [Laplacian]{.upright} of $f$ as $$\\Delta_g f = \\text...")
  , Definition "definition_def:lipschitzfunction" "Definition 174 (Lipschitz function). Let $(M, g)$ be a compact Riemannian manifold. We say that a function $f: M \\rightarrow \\mathbb{R}$ is $A_1$-Lipschitz if $$|f(x) - f(y)| \\leq A_1 d_g(x,y),\\quad \\..." (SourceSpan "theorem_graph.json" "def:lipschitzfunction" "def:lipschitzfunction" "sec-9-5" "Definition 174 (Lipschitz function). Let $(M, g)$ be a compact Riemannian manifold. We say that a function $f: M \\rightarrow \\mathbb{R}$ is $A_1$-Lipschitz if $$|f(x) - f(y)| \\leq A_1 d_g(x,y),\\quad \\...")
  , Definition "definition_thm-220" "Definition 186 (Weighted manifold). Let $(M, g)$ be a Riemannian manifold, and let $D(x)$ be a smooth and positive function on $M$, also known as a [density function]{.upright}. Let us define the meas..." (SourceSpan "theorem_graph.json" "thm-220" "thm-220" "sec-10" "Definition 186 (Weighted manifold). Let $(M, g)$ be a Riemannian manifold, and let $D(x)$ be a smooth and positive function on $M$, also known as a [density function]{.upright}. Let us define the meas...")
  , Definition "definition_thm-222" "Definition 188 (Spaces $\\overrightarrow{L}^2(M, \\mu)$ and $\\overrightarrow{L}^2_{\\mathit{loc}}(M, \\mu)$). Given a weighted manifold $(M, g, \\mu)$, we denote by $\\overrightarrow{L}^2(M, \\mu)$ the space..." (SourceSpan "theorem_graph.json" "thm-222" "thm-222" "sec-10" "Definition 188 (Spaces $\\overrightarrow{L}^2(M, \\mu)$ and $\\overrightarrow{L}^2_{\\mathit{loc}}(M, \\mu)$). Given a weighted manifold $(M, g, \\mu)$, we denote by $\\overrightarrow{L}^2(M, \\mu)$ the space...")
  , Definition "definition_thm-223" "Definition 189 (Weak gradient). Let $u : M \\to \\mathbb{R}$ be such that $u \\in L^2_{\\mathit{loc}}(M, \\mu)$. A [weak gradient]{.upright} of $u$ is a vector field $v \\in \\overrightarrow{L}^2_{\\mathit{lo..." (SourceSpan "theorem_graph.json" "thm-223" "thm-223" "sec-10" "Definition 189 (Weak gradient). Let $u : M \\to \\mathbb{R}$ be such that $u \\in L^2_{\\mathit{loc}}(M, \\mu)$. A [weak gradient]{.upright} of $u$ is a vector field $v \\in \\overrightarrow{L}^2_{\\mathit{lo...")
  , Definition "definition_def:Sobolevspace" "Definition 192 (Sobolev space $H^1$). We denote by $H^1(M, \\mu)$ the [Sobolev space]{.upright} $$H^1(M, \\mu) := \\left\\{u \\in L^2(M, \\mu) : \\textup{grad}_{g}\\,u \\in \\overrightarrow{L}^2(M, \\mu) \\right\\..." (SourceSpan "theorem_graph.json" "def:Sobolevspace" "def:Sobolevspace" "sec-10" "Definition 192 (Sobolev space $H^1$). We denote by $H^1(M, \\mu)$ the [Sobolev space]{.upright} $$H^1(M, \\mu) := \\left\\{u \\in L^2(M, \\mu) : \\textup{grad}_{g}\\,u \\in \\overrightarrow{L}^2(M, \\mu) \\right\\...")
  , Definition "definition_thm-230" "Definition 196 (Domain). Let $M$ be a manifold, and let $U \\subset M$ be a subset. We say that $U$ is a [domain]{.upright} if the closure of $U$ coincides with that of its interior." (SourceSpan "theorem_graph.json" "thm-230" "thm-230" "sec-11" "Definition 196 (Domain). Let $M$ be a manifold, and let $U \\subset M$ be a subset. We say that $U$ is a [domain]{.upright} if the closure of $U$ coincides with that of its interior.")
  , Definition "definition_thm-231" "Definition 197 (Weakly geodesically convex set). Let $(M, g)$ be a Riemannian manifold. A subset $U \\subset M$ is said to be [weakly geodesically convex]{.upright} if, for each $p, q \\in U$ there exis..." (SourceSpan "theorem_graph.json" "thm-231" "thm-231" "sec-11" "Definition 197 (Weakly geodesically convex set). Let $(M, g)$ be a Riemannian manifold. A subset $U \\subset M$ is said to be [weakly geodesically convex]{.upright} if, for each $p, q \\in U$ there exis...")
  , Definition "definition_thm-232" "Definition 198 (Second fundamental form of a manifold with boundary). Let $(M, g)$ be a Riemannian manifold with boundary, and let $N$ be the inward pointing unit normal vector field of $\\partial M$. ..." (SourceSpan "theorem_graph.json" "thm-232" "thm-232" "sec-11" "Definition 198 (Second fundamental form of a manifold with boundary). Let $(M, g)$ be a Riemannian manifold with boundary, and let $N$ be the inward pointing unit normal vector field of $\\partial M$. ...")
  , Definition "definition_thm-233" "Definition 199 (Convex boundary). Let $(M, g)$ be a Riemmanian manifold and let $U \\subset M$ be a domain. We say that $\\partial U$ is [convex]{.upright} if $\\mathbb{I}(X,X) \\geq 0$ for every $X \\in \\..." (SourceSpan "theorem_graph.json" "thm-233" "thm-233" "sec-11" "Definition 199 (Convex boundary). Let $(M, g)$ be a Riemmanian manifold and let $U \\subset M$ be a domain. We say that $\\partial U$ is [convex]{.upright} if $\\mathbb{I}(X,X) \\geq 0$ for every $X \\in \\...")
  , Definition "definition_def:carreduchampGeneric" "Definition 200 (Carré du champ operator). Let $(M, g)$ be a compact manifold, given some operator $\\mathcal{L}$ as in [\\[eq:generaloperatorL\\]](#eq:generaloperatorL){reference-type=\"ref+label\" referen..." (SourceSpan "theorem_graph.json" "def:carreduchampGeneric" "def:carreduchampGeneric" "sec-11" "Definition 200 (Carré du champ operator). Let $(M, g)$ be a compact manifold, given some operator $\\mathcal{L}$ as in [\\[eq:generaloperatorL\\]](#eq:generaloperatorL){reference-type=\"ref+label\" referen...")
  , Definition "definition_def:markovtripleGeneric" "Definition 202 (Markov triple). Let $(M, g)$ be a compact manifold, and let $\\mathcal{L}$ be defined as $$\\mathcal{L} = \\alpha(\\textup{grad}_{g}\\, V + \\Delta_g),$$ where $\\alpha > 0$ is some constant ..." (SourceSpan "theorem_graph.json" "def:markovtripleGeneric" "def:markovtripleGeneric" "sec-11" "Definition 202 (Markov triple). Let $(M, g)$ be a compact manifold, and let $\\mathcal{L}$ be defined as $$\\mathcal{L} = \\alpha(\\textup{grad}_{g}\\, V + \\Delta_g),$$ where $\\alpha > 0$ is some constant ...")
  , Definition "definition_secondordercarreduchamp" "Definition 203 (Second order carré du champ operator). Given a compact manifold $(M, g)$ and an operator $\\mathcal{L}$ defined as above, we define the [second order carré du champ operator]{.upright} ..." (SourceSpan "theorem_graph.json" "secondordercarreduchamp" "secondordercarreduchamp" "sec-11" "Definition 203 (Second order carré du champ operator). Given a compact manifold $(M, g)$ and an operator $\\mathcal{L}$ defined as above, we define the [second order carré du champ operator]{.upright} ...")
  , Definition "definition_thm-242" "Lemma 207. Let $(M, g)$ be a compact Riemannian manifold and let $U$ be a connected bounded open domain of $M$ with smooth boundary. Let $\\hat{\\mathcal{L}}$ be defined as in [\\[eq:operatorsinalpha\\]](..." (SourceSpan "theorem_graph.json" "thm-242" "thm-242" "sec-11" "Lemma 207. Let $(M, g)$ be a compact Riemannian manifold and let $U$ be a connected bounded open domain of $M$ with smooth boundary. Let $\\hat{\\mathcal{L}}$ be defined as in [\\[eq:operatorsinalpha\\]](...")
  , Definition "definition_rmk:gapimpliesPI" "Remark 208. Let $(M, g)$ be a compact Riemannian manifold and let $U$ be a connected bounded open domain of $M$ with smooth boundary. Let $\\hat{\\mathcal{L}}$ be defined as in [\\[eq:operatorsinalpha\\]]..." (SourceSpan "theorem_graph.json" "rmk:gapimpliesPI" "rmk:gapimpliesPI" "sec-11" "Remark 208. Let $(M, g)$ be a compact Riemannian manifold and let $U$ be a connected bounded open domain of $M$ with smooth boundary. Let $\\hat{\\mathcal{L}}$ be defined as in [\\[eq:operatorsinalpha\\]]...")
  , Definition "definition_thm-249" "Definition 212. A continuous semimartingale is a continuous process $Y_t$ which can be (uniquely) written as $Y_t = M_t + A_t$, where $M_t$ is a continuous local martingale (cf. [@revuz2013continuous ..." (SourceSpan "theorem_graph.json" "thm-249" "thm-249" "sec-12-1" "Definition 212. A continuous semimartingale is a continuous process $Y_t$ which can be (uniquely) written as $Y_t = M_t + A_t$, where $M_t$ is a continuous local martingale (cf. [@revuz2013continuous ...")
  , Definition "definition_thm-263" "Definition 221. Let $M$ be a manifold, we say a subset $U$ of $M$ is [precompact]{.upright} if its closure $\\overline{U}$ is compact in $M$." (SourceSpan "theorem_graph.json" "thm-263" "thm-263" "sec-13-1" "Definition 221. Let $M$ be a manifold, we say a subset $U$ of $M$ is [precompact]{.upright} if its closure $\\overline{U}$ is compact in $M$.")
  , Definition "definition_thm-264" "Definition 222. Let $M$ be a manifold and let $U$ be an open subset of $M$. Define $H^1_0(U)$ as the closure of $C^\\infty_c(M)$, the space of smooth functions with compact support, in $H^1(U)$---cf. [..." (SourceSpan "theorem_graph.json" "thm-264" "thm-264" "sec-13-1" "Definition 222. Let $M$ be a manifold and let $U$ be an open subset of $M$. Define $H^1_0(U)$ as the closure of $C^\\infty_c(M)$, the space of smooth functions with compact support, in $H^1(U)$---cf. [...")
  , Definition "definition_thm-267" "Definition 225 (Spectrum of an operator). Given a bounded linear operator $\\mathcal{K} : H \\to H$ on a real Banach space $H$, the [resolvent]{.upright} of $\\mathcal{K}$ is $$\\rho(\\mathcal{K}) := \\{x \\..." (SourceSpan "theorem_graph.json" "thm-267" "thm-267" "sec-13-1" "Definition 225 (Spectrum of an operator). Given a bounded linear operator $\\mathcal{K} : H \\to H$ on a real Banach space $H$, the [resolvent]{.upright} of $\\mathcal{K}$ is $$\\rho(\\mathcal{K}) := \\{x \\...")
  , Definition "definition_thm-269" "Definition 227 (Bounded operator). A bilinear form $\\mathfrak{B}$ on a Hilbert space $H$ is said to be [bounded]{.upright} if there exists a constant $\\kappa>0$ such that $$|\\mathfrak{B}(x,y)|\\leq \\ka..." (SourceSpan "theorem_graph.json" "thm-269" "thm-269" "sec-13-1" "Definition 227 (Bounded operator). A bilinear form $\\mathfrak{B}$ on a Hilbert space $H$ is said to be [bounded]{.upright} if there exists a constant $\\kappa>0$ such that $$|\\mathfrak{B}(x,y)|\\leq \\ka...")
  , Definition "definition_thm-270" "Definition 228 (Coercive). A bilinear form $\\mathfrak{B}$ on a Hilbert space $H$ is said to be [coercive]{.upright} if there exists a number $k > 0$ such that $$\\mathfrak{B}(x,x) \\geq k \\norm{x}^2\\qua..." (SourceSpan "theorem_graph.json" "thm-270" "thm-270" "sec-13-1" "Definition 228 (Coercive). A bilinear form $\\mathfrak{B}$ on a Hilbert space $H$ is said to be [coercive]{.upright} if there exists a number $k > 0$ such that $$\\mathfrak{B}(x,x) \\geq k \\norm{x}^2\\qua...")
  , Definition "definition_thm-272" "Definition 230 (Weak solution and bilinear form associated with $\\mathfrak{L}$). Let $M$ be a compact manifold and let $U \\subset M$ be open. Given some second-order differential operator $\\mathfrak{L..." (SourceSpan "theorem_graph.json" "thm-272" "thm-272" "sec-13-2" "Definition 230 (Weak solution and bilinear form associated with $\\mathfrak{L}$). Let $M$ be a compact manifold and let $U \\subset M$ be open. Given some second-order differential operator $\\mathfrak{L...")
  , Definition "definition_thm-276" "Definition 233 (Weak solution of adjoint problem). Let $M$ be a compact manifold and let $U$ be some open subset of $M$. Given some $f \\in L^2(U)$, we say that $v \\in H^1_0(U)$ is a [weak solution of ..." (SourceSpan "theorem_graph.json" "thm-276" "thm-276" "sec-13-2" "Definition 233 (Weak solution of adjoint problem). Let $M$ be a compact manifold and let $U$ be some open subset of $M$. Given some $f \\in L^2(U)$, we say that $v \\in H^1_0(U)$ is a [weak solution of ...")
  , Definition "definition_def:boundaryregularity" "Definition 236 (Boundary regularity). Let $U$ be a subset of $\\mathbb{R}^n$. We say that its boundary $\\partial U$ is $C^k$ if, for every $x \\in \\partial U$, there exists some radius $r > 0$ and a $C^..." (SourceSpan "theorem_graph.json" "def:boundaryregularity" "def:boundaryregularity" "sec-13-3" "Definition 236 (Boundary regularity). Let $U$ be a subset of $\\mathbb{R}^n$. We say that its boundary $\\partial U$ is $C^k$ if, for every $x \\in \\partial U$, there exists some radius $r > 0$ and a $C^...")
  , Definition "definition_def:regularvalue" "Definition 238 (Regular value). Let $M$ be an $n$-dimensional manifold, and let $N$ be a $k$-dimensional manifold. Let $F: X \\to Y$ be a smooth function. We say $x \\in M$ is a [regular point]{.upright..." (SourceSpan "theorem_graph.json" "def:regularvalue" "def:regularvalue" "sec-13-3" "Definition 238 (Regular value). Let $M$ be an $n$-dimensional manifold, and let $N$ be a $k$-dimensional manifold. Let $F: X \\to Y$ be a smooth function. We say $x \\in M$ is a [regular point]{.upright...")
  , Definition "definition_thm-291" "Definition 243. Let $(M, g)$ be a complete and connected Riemannian manifold. For every fixed $p \\in M$ and any $x \\in M$ outside the cut locus of $p$, we define $\\varphi$ as $$\\begin{align} \\varphi: ..." (SourceSpan "theorem_graph.json" "thm-291" "thm-291" "sec-14-2-1" "Definition 243. Let $(M, g)$ be a complete and connected Riemannian manifold. For every fixed $p \\in M$ and any $x \\in M$ outside the cut locus of $p$, we define $\\varphi$ as $$\\begin{align} \\varphi: ...")
  , Definition "definition_lem:boundcoeffsCn" "Lemma 265. Let $C_{2n}$ be defined as above. Then $$|C_{2n}| \\leq (2n)!$$ for every $n \\geq 0$." (SourceSpan "theorem_graph.json" "lem:boundcoeffsCn" "lem:boundcoeffsCn" "sec-14-4-2" "Lemma 265. Let $C_{2n}$ be defined as above. Then $$|C_{2n}| \\leq (2n)!$$ for every $n \\geq 0$.")
  ]

globalAssumptions :: [Assumption]
globalAssumptions =
  [ Assumption "assumption_thm:MainInformal1" "Theorem 14 (Main result 1 - informal version). Let $(M, g)$ be a compact Riemannian manifold of dimension $\\dim(M) \\geq 2$ which is furthermore a symmetric space. Assume there exists a group $G$ actin..." (SourceSpan "theorem_graph.json" "thm:MainInformal1" "thm:MainInformal1" "sec-1-1" "Theorem 14 (Main result 1 - informal version). Let $(M, g)$ be a compact Riemannian manifold of dimension $\\dim(M) \\geq 2$ which is furthermore a symmetric space. Assume there exists a group $G$ actin...")
  , Assumption "assumption_lem:deflyapunov1" "Proposition 39. Under the assumptions of [37](#lemma9.8){reference-type=\"ref+label\" reference=\"lemma9.8\"}, the function $W_1$ from [\\[eq:defW1\\]](#eq:defW1){reference-type=\"ref+label\" reference=\"eq:de..." (SourceSpan "theorem_graph.json" "lem:deflyapunov1" "lem:deflyapunov1" "sec-2-2-1" "Proposition 39. Under the assumptions of [37](#lemma9.8){reference-type=\"ref+label\" reference=\"lemma9.8\"}, the function $W_1$ from [\\[eq:defW1\\]](#eq:defW1){reference-type=\"ref+label\" reference=\"eq:de...")
  , Assumption "assumption_simplificationsTheorem" "Proposition 40. Let $\\mathscr{L}$ be the generator of a Markov process $Y_t$ on a manifold $M$ and assume that the associated martingale problem has a unique solution, given by $Y_t$. Let $V \\subset M..." (SourceSpan "theorem_graph.json" "simplificationsTheorem" "simplificationsTheorem" "sec-2-2-2" "Proposition 40. Let $\\mathscr{L}$ be the generator of a Markov process $Y_t$ on a manifold $M$ and assume that the associated martingale problem has a unique solution, given by $Y_t$. Let $V \\subset M...")
  , Assumption "assumption_theorem9.4" "Lemma 43 ([@wainwright2019high Theorem 2.13]). Let $X$ be a random variable, and assume that there exist two constants $c_1, c_2 > 0$ such that $$\\begin{equation} \\label{eq9.16} \\mathbb{P}[|X| \\geq t]..." (SourceSpan "theorem_graph.json" "theorem9.4" "theorem9.4" "sec-2-2-2" "Lemma 43 ([@wainwright2019high Theorem 2.13]). Let $X$ be a random variable, and assume that there exist two constants $c_1, c_2 > 0$ such that $$\\begin{equation} \\label{eq9.16} \\mathbb{P}[|X| \\geq t]...")
  , Assumption "assumption_cor:lyapunov2" "Corollary 49. Let $(M, g)$ be a compact and symmetric manifold. Let $\\pi: (M, g) \\to (B, h)$ be a surjective Riemannian submersion with totally geodesic fibers. Assume that there exists a constant $\\m..." (SourceSpan "theorem_graph.json" "cor:lyapunov2" "cor:lyapunov2" "sec-2-2-2" "Corollary 49. Let $(M, g)$ be a compact and symmetric manifold. Let $\\pi: (M, g) \\to (B, h)$ be a surjective Riemannian submersion with totally geodesic fibers. Assume that there exists a constant $\\m...")
  , Assumption "assumption_lemma9.9" "Lemma 50 (Poincaré Inequality on $G_3$). Suppose that $\\tilde F$ satisfies and assume that the Ricci curvature of $(B, h)$ is lower-bounded by some non-positive constant, i.e. $\\textup{Ric}_{h} \\geq -..." (SourceSpan "theorem_graph.json" "lemma9.9" "lemma9.9" "sec-2-3-1" "Lemma 50 (Poincaré Inequality on $G_3$). Suppose that $\\tilde F$ satisfies and assume that the Ricci curvature of $(B, h)$ is lower-bounded by some non-positive constant, i.e. $\\textup{Ric}_{h} \\geq -...")
  , Assumption "assumption_Neumannboundarycondition" "Lemma 53 (Neumann boundary condition). Let $\\tilde{\\operatorname{L}}$ and $\\tilde\\nu$ be as defined in [\\[eq:defMarkovB\\]](#eq:defMarkovB){reference-type=\"ref+label\" reference=\"eq:defMarkovB\"}, and le..." (SourceSpan "theorem_graph.json" "Neumannboundarycondition" "Neumannboundarycondition" "sec-2-3-2" "Lemma 53 (Neumann boundary condition). Let $\\tilde{\\operatorname{L}}$ and $\\tilde\\nu$ be as defined in [\\[eq:defMarkovB\\]](#eq:defMarkovB){reference-type=\"ref+label\" reference=\"eq:defMarkovB\"}, and le...")
  , Assumption "assumption_rem:upgradedregularity" "Proposition 56 (Upgraded regularity). Consider a principal $G$-bundle which is also a Riemannian submersion, $\\pi: (M, g) \\to (M/G, h)$. Further assume that the fibers of $\\pi$ are all isometric to so..." (SourceSpan "theorem_graph.json" "rem:upgradedregularity" "rem:upgradedregularity" "sec-3-1" "Proposition 56 (Upgraded regularity). Consider a principal $G$-bundle which is also a Riemannian submersion, $\\pi: (M, g) \\to (M/G, h)$. Further assume that the fibers of $\\pi$ are all isometric to so...")
  , Assumption "assumption_Fubini" "Proposition 57 (Fubini's theorem for Gibbs measures). Consider a principal $G$-bundle which is also a Riemannian submersion, $\\pi: (M, g) \\to (M/G, h)$. Further assume that the fibers of $\\pi$ are all..." (SourceSpan "theorem_graph.json" "Fubini" "Fubini" "sec-3-1" "Proposition 57 (Fubini's theorem for Gibbs measures). Consider a principal $G$-bundle which is also a Riemannian submersion, $\\pi: (M, g) \\to (M/G, h)$. Further assume that the fibers of $\\pi$ are all...")
  , Assumption "assumption_teoremaPIGenerico" "Theorem 58 ([@zhong1984estimate Theorem 14.2]). Let $(N,h)$ be a compact, connected Riemannian manifold of finite volume $\\textup{Vol}(N)$. Assume that $N$ has non-negative Ricci curvature. Let $d\\mu ..." (SourceSpan "theorem_graph.json" "teoremaPIGenerico" "teoremaPIGenerico" "sec-3-2" "Theorem 58 ([@zhong1984estimate Theorem 14.2]). Let $(N,h)$ be a compact, connected Riemannian manifold of finite volume $\\textup{Vol}(N)$. Assume that $N$ has non-negative Ricci curvature. Let $d\\mu ...")
  , Assumption "assumption_thmliftPI" "Theorem 59. Let $(M, g)$ be a complete manifold and let $\\pi: (M, g) \\to (M/G, h)$ be a principal $G$-bundle that is also a Riemannian submersion. Assume that the fibers are all isometric to a compact..." (SourceSpan "theorem_graph.json" "thmliftPI" "thmliftPI" "sec-3-2" "Theorem 59. Let $(M, g)$ be a complete manifold and let $\\pi: (M, g) \\to (M/G, h)$ be a principal $G$-bundle that is also a Riemannian submersion. Assume that the fibers are all isometric to a compact...")
  , Assumption "assumption_thmlowerPI" "Theorem 60. Under the conditions of [59](#thmliftPI){reference-type=\"ref+label\" reference=\"thmliftPI\"}, where $(G, \\hat{g})$ may not have non-negative Ricci curvature, if $(M, \\nu, \\Gamma)$ satisfies ..." (SourceSpan "theorem_graph.json" "thmlowerPI" "thmlowerPI" "sec-3-2" "Theorem 60. Under the conditions of [59](#thmliftPI){reference-type=\"ref+label\" reference=\"thmliftPI\"}, where $(G, \\hat{g})$ may not have non-negative Ricci curvature, if $(M, \\nu, \\Gamma)$ satisfies ...")
  , Assumption "assumption_LemmaGradienteHorizontal" "Lemma 61. Let $\\pi: (M, g) \\to (M/G, h)$ be a principal $G$-bundle which is also a Riemannian submersion, where $G$ is a compact Lie group. Assume that the fibers are all isometric to $(G, \\hat{g})$. ..." (SourceSpan "theorem_graph.json" "LemmaGradienteHorizontal" "LemmaGradienteHorizontal" "sec-3-2" "Lemma 61. Let $\\pi: (M, g) \\to (M/G, h)$ be a principal $G$-bundle which is also a Riemannian submersion, where $G$ is a compact Lie group. Assume that the fibers are all isometric to $(G, \\hat{g})$. ...")
  , Assumption "assumption_LemmaGradienteVertical" "Lemma 62. Let $\\pi: (M, g) \\to (M/G, h)$ be a principal $G$-bundle, for some compact Lie group $G$, that is also a Riemannian submersion. Assume that the fibers are all isometric to $(G, \\hat{g})$. Th..." (SourceSpan "theorem_graph.json" "LemmaGradienteVertical" "LemmaGradienteVertical" "sec-3-2" "Lemma 62. Let $\\pi: (M, g) \\to (M/G, h)$ be a principal $G$-bundle, for some compact Lie group $G$, that is also a Riemannian submersion. Assume that the fibers are all isometric to $(G, \\hat{g})$. Th...")
  , Assumption "assumption_lem:lemmaregularityintegral" "Lemma 63. Under the conditions of [59](#thmliftPI){reference-type=\"ref+label\" reference=\"thmliftPI\"}, let $f \\in C^2(M) \\cap H^1(M, \\nu)$. Then $$\\hat F(x) := \\int_{\\pi^{-1}(x)} f(y)\\,\\textup{dVol}_{\\..." (SourceSpan "theorem_graph.json" "lem:lemmaregularityintegral" "lem:lemmaregularityintegral" "sec-3-2" "Lemma 63. Under the conditions of [59](#thmliftPI){reference-type=\"ref+label\" reference=\"thmliftPI\"}, let $f \\in C^2(M) \\cap H^1(M, \\nu)$. Then $$\\hat F(x) := \\int_{\\pi^{-1}(x)} f(y)\\,\\textup{dVol}_{\\...")
  , Assumption "assumption_prop9.15" "Theorem 68 (Poincaré inequality and curvature-dimension condition imply log-Sobolev inequality). Consider the Markov triple $(M, \\nu, \\Gamma)$ and let $\\beta \\geq 1$. Suppose that the following two co..." (SourceSpan "theorem_graph.json" "prop9.15" "prop9.15" "sec-4-1" "Theorem 68 (Poincaré inequality and curvature-dimension condition imply log-Sobolev inequality). Consider the Markov triple $(M, \\nu, \\Gamma)$ and let $\\beta \\geq 1$. Suppose that the following two co...")
  , Assumption "assumption_thm-73" "Remark 69. Note that we can assume that $\\kappa_1 > 1$ since $\\textup{CD}(-\\kappa_1)$ with $0 < \\kappa_1 \\leq 1$ implies $\\textup{CD}(-\\kappa')$ for any $\\kappa' > 1$. Similarly, we can assume that $1..." (SourceSpan "theorem_graph.json" "thm-73" "thm-73" "sec-4-1" "Remark 69. Note that we can assume that $\\kappa_1 > 1$ since $\\textup{CD}(-\\kappa_1)$ with $0 < \\kappa_1 \\leq 1$ implies $\\textup{CD}(-\\kappa')$ for any $\\kappa' > 1$. Similarly, we can assume that $1...")
  , Assumption "assumption_thm-74" "Remark 70. [68](#prop9.15){reference-type=\"ref+label\" reference=\"prop9.15\"} is a generalization of [@LiErd2022Supp Proposition D.17]. Note that we are allowing for the curvature-dimension condition to..." (SourceSpan "theorem_graph.json" "thm-74" "thm-74" "sec-4-1" "Remark 70. [68](#prop9.15){reference-type=\"ref+label\" reference=\"prop9.15\"} is a generalization of [@LiErd2022Supp Proposition D.17]. Note that we are allowing for the curvature-dimension condition to...")
  , Assumption "assumption_proptightening" "Proposition 75 (Tightening of a log-Sobolev inequality with a Poincaré inequality - [@bakry2013analysis Proposition 5.1.3]). Assume that $(M, \\nu, \\Gamma)$ satisfies an $\\textup{LSI}(C, D)$ and a $\\te..." (SourceSpan "theorem_graph.json" "proptightening" "proptightening" "sec-4-1" "Proposition 75 (Tightening of a log-Sobolev inequality with a Poincaré inequality - [@bakry2013analysis Proposition 5.1.3]). Assume that $(M, \\nu, \\Gamma)$ satisfies an $\\textup{LSI}(C, D)$ and a $\\te...")
  , Assumption "assumption_cor:rapidmixing" "Corollary 77. Under the assumptions of [76](#thm:MainFormal1){reference-type=\"ref+label\" reference=\"thm:MainFormal1\"}, the Langevin diffusion process $X_t$ defined in [\\[LangevinDiffusionEq\\]](#Langev..." (SourceSpan "theorem_graph.json" "cor:rapidmixing" "cor:rapidmixing" "sec-5" "Corollary 77. Under the assumptions of [76](#thm:MainFormal1){reference-type=\"ref+label\" reference=\"thm:MainFormal1\"}, the Langevin diffusion process $X_t$ defined in [\\[LangevinDiffusionEq\\]](#Langev...")
  , Assumption "assumption_thm-93" "Proposition 83 ([@shen2010tracequotient Lemma 1]). Let $P$ be a global minimum of $\\tilde f$. Assume that there is a gap between the $k$-th and the $k+1$-th largest eigenvalue of $\\Phi(P) := A - \\tild..." (SourceSpan "theorem_graph.json" "thm-93" "thm-93" "sec-7-1" "Proposition 83 ([@shen2010tracequotient Lemma 1]). Let $P$ be a global minimum of $\\tilde f$. Assume that there is a gap between the $k$-th and the $k+1$-th largest eigenvalue of $\\Phi(P) := A - \\tild...")
  , Assumption "assumption_prop:criticalpointsGr1" "Proposition 85. Let $\\tilde f$ be as defined in [\\[eq:traceratioGr1\\]](#eq:traceratioGr1){reference-type=\"ref+label\" reference=\"eq:traceratioGr1\"}, and assume that $B^{-1}A$ has $n$ distinct eigenvalu..." (SourceSpan "theorem_graph.json" "prop:criticalpointsGr1" "prop:criticalpointsGr1" "sec-7-1-1-1" "Proposition 85. Let $\\tilde f$ be as defined in [\\[eq:traceratioGr1\\]](#eq:traceratioGr1){reference-type=\"ref+label\" reference=\"eq:traceratioGr1\"}, and assume that $B^{-1}A$ has $n$ distinct eigenvalu...")
  , Assumption "assumption_thm-97" "Proposition 86. Let $\\tilde f$ be defined as in [\\[eq:traceratiograssmannBid\\]](#eq:traceratiograssmannBid){reference-type=\"ref+label\" reference=\"eq:traceratiograssmannBid\"}, and assume that $A$ has $..." (SourceSpan "theorem_graph.json" "thm-97" "thm-97" "sec-7-1-1-2" "Proposition 86. Let $\\tilde f$ be defined as in [\\[eq:traceratiograssmannBid\\]](#eq:traceratiograssmannBid){reference-type=\"ref+label\" reference=\"eq:traceratiograssmannBid\"}, and assume that $A$ has $...")
  , Assumption "assumption_InjectivityRadiusBound" "Proposition 131 ([@Klingenberg]). Let $(M, g)$ be a compact Riemannian manifold, and let $K_g$ denote its sectional curvature. Assume that there exists a constant $D > 0$ such that $K_g \\leq D$. Then ..." (SourceSpan "theorem_graph.json" "InjectivityRadiusBound" "InjectivityRadiusBound" "sec-9-3" "Proposition 131 ([@Klingenberg]). Let $(M, g)$ be a compact Riemannian manifold, and let $K_g$ denote its sectional curvature. Assume that there exists a constant $D > 0$ such that $K_g \\leq D$. Then ...")
  , Assumption "assumption_controlconvexityradius" "Proposition 135 ([@berger2007panoramic Proposition 95]). Let $(M, g)$ be a compact Riemannian manifold, and let $K_g$ denote its sectional curvature. Assume that there exists a constant $D > 0$ such t..." (SourceSpan "theorem_graph.json" "controlconvexityradius" "controlconvexityradius" "sec-9-3" "Proposition 135 ([@berger2007panoramic Proposition 95]). Let $(M, g)$ be a compact Riemannian manifold, and let $K_g$ denote its sectional curvature. Assume that there exists a constant $D > 0$ such t...")
  , Assumption "assumption_thm-170" "Definition 149. Let $G$ be a Lie group. A [principal $G$-bundle]{.upright} is a fiber bundle $\\pi: M \\to B$ with fiber $G$ satisfying all of the following conditions: - There exists a free action $\\mu..." (SourceSpan "theorem_graph.json" "thm-170" "thm-170" "sec-9-4" "Definition 149. Let $G$ be a Lie group. A [principal $G$-bundle]{.upright} is a fiber bundle $\\pi: M \\to B$ with fiber $G$ satisfying all of the following conditions: - There exists a free action $\\mu...")
  , Assumption "assumption_thm-238" "Definition 204 (Curvature-dimension condition). Let $(M, g)$ be a compact Riemannian manifold, let $\\mathcal{L}$ be as above and let $(M, \\mu, \\mathbf{\\Gamma})$ be the associated Markov triple. Given ..." (SourceSpan "theorem_graph.json" "thm-238" "thm-238" "sec-11" "Definition 204 (Curvature-dimension condition). Let $(M, g)$ be a compact Riemannian manifold, let $\\mathcal{L}$ be as above and let $(M, \\mu, \\mathbf{\\Gamma})$ be the associated Markov triple. Given ...")
  , Assumption "assumption_rem:CDimpliesPI" "Proposition 210. Let $(M, g)$ be a compact Riemannian manifold and let $U$ be a bounded open domain with smooth convex boundary $\\partial U$. Let $F$ be some smooth function on $M$ and assume that the..." (SourceSpan "theorem_graph.json" "rem:CDimpliesPI" "rem:CDimpliesPI" "sec-11" "Proposition 210. Let $(M, g)$ be a compact Riemannian manifold and let $U$ be a bounded open domain with smooth convex boundary $\\partial U$. Let $F$ be some smooth function on $M$ and assume that the...")
  , Assumption "assumption_prop:boundsol" "Proposition 216. Let $Y_t$ be the solution to [\\[eq:SDEmodifiedCIR\\]](#eq:SDEmodifiedCIR){reference-type=\"ref+label\" reference=\"eq:SDEmodifiedCIR\"} with initial condition $Y_0 = \\xi \\geq 0$. Then for ..." (SourceSpan "theorem_graph.json" "prop:boundsol" "prop:boundsol" "sec-12-2" "Proposition 216. Let $Y_t$ be the solution to [\\[eq:SDEmodifiedCIR\\]](#eq:SDEmodifiedCIR){reference-type=\"ref+label\" reference=\"eq:SDEmodifiedCIR\"} with initial condition $Y_0 = \\xi \\geq 0$. Then for ...")
  , Assumption "assumption_spectrumCompact" "Theorem 226 ([@evans2010partial Appendix D - Theorem 6]). Let $H$ be a Hilbert space, assume $\\dim(H) = \\infty$, and let $\\mathcal{K}: H \\rightarrow H$ be a compact linear operator. Then the following..." (SourceSpan "theorem_graph.json" "spectrumCompact" "spectrumCompact" "sec-13-1" "Theorem 226 ([@evans2010partial Appendix D - Theorem 6]). Let $H$ be a Hilbert space, assume $\\dim(H) = \\infty$, and let $\\mathcal{K}: H \\rightarrow H$ be a compact linear operator. Then the following...")
  , Assumption "assumption_rem:boundtaylor" "Remark 251. Under the conditions of [250](#prop:boundmetricterms){reference-type=\"ref+label\" reference=\"prop:boundmetricterms\"}, let $$r \\leq \\frac{1}{d^{3/2} \\mathbf{K}^{1/2}}.$$ Then $$\\left|\\sum_{n..." (SourceSpan "theorem_graph.json" "rem:boundtaylor" "rem:boundtaylor" "sec-14-2-2" "Remark 251. Under the conditions of [250](#prop:boundmetricterms){reference-type=\"ref+label\" reference=\"prop:boundmetricterms\"}, let $$r \\leq \\frac{1}{d^{3/2} \\mathbf{K}^{1/2}}.$$ Then $$\\left|\\sum_{n...")
  , Assumption "assumption_prop:lowerboundgradtilder" "Proposition 258. Under the conditions of [257](#AuxLemma2){reference-type=\"ref+label\" reference=\"AuxLemma2\"}, assume that there exists a constant $\\mathbf{K} \\geq 1$ such that for every $x \\in M$, in ..." (SourceSpan "theorem_graph.json" "prop:lowerboundgradtilder" "prop:lowerboundgradtilder" "sec-14-3" "Proposition 258. Under the conditions of [257](#AuxLemma2){reference-type=\"ref+label\" reference=\"AuxLemma2\"}, assume that there exists a constant $\\mathbf{K} \\geq 1$ such that for every $x \\in M$, in ...")
  , Assumption "assumption_lem:boundtermgradlaplacian" "Lemma 259. Let $\\pi: (M, g) \\to (B, h)$ be a surjective Riemannian submersion with totally geodesic fibers, where $(M, g)$ is a compact and connected symmetric space. Assume that there exists some con..." (SourceSpan "theorem_graph.json" "lem:boundtermgradlaplacian" "lem:boundtermgradlaplacian" "sec-14-4-1" "Lemma 259. Let $\\pi: (M, g) \\to (B, h)$ be a surjective Riemannian submersion with totally geodesic fibers, where $(M, g)$ is a compact and connected symmetric space. Assume that there exists some con...")
  , Assumption "assumption_AuxLemma3" "Lemma 261. Let $\\pi: (M, g) \\to (B, h)$ be a surjective Riemannian submersion, where $(M, g)$ is a compact and connected symmetric space. Assume that there exists some constant $\\mathbf{K} \\geq 1$ suc..." (SourceSpan "theorem_graph.json" "AuxLemma3" "AuxLemma3" "sec-14-4-2" "Lemma 261. Let $\\pi: (M, g) \\to (B, h)$ be a surjective Riemannian submersion, where $(M, g)$ is a compact and connected symmetric space. Assume that there exists some constant $\\mathbf{K} \\geq 1$ suc...")
  , Assumption "assumption_lem:boundderitvativesgradient" "Lemma 266. Let $(M, g)$ be a Riemannian manifold of dimension $d$ which is also a complete and connected symmetric space. Assume that there exists some constant $\\mathbf{K} \\geq 1$ such that, for ever..." (SourceSpan "theorem_graph.json" "lem:boundderitvativesgradient" "lem:boundderitvativesgradient" "sec-14-4-2" "Lemma 266. Let $(M, g)$ be a Riemannian manifold of dimension $d$ which is also a complete and connected symmetric space. Assume that there exists some constant $\\mathbf{K} \\geq 1$ such that, for ever...")
  ]

limitations :: [Limitation]
limitations =
  []

theorem_1_thm_1 :: TheoremIR
theorem_1_thm_1 =
  let span = (SourceSpan "theorem_graph.json" "thm-1" "thm-1" "sec-1-1" "Remark 5. Since $M$ is compact and $F$ is smooth, there exist constants $A_1, A_2, A_3 \\geq 1$ such that $F$ is $A_1$-Lipschitz, $\\textup{grad}_{g}\\,F$ is $A_2$-Lipschitz, and $\\nabla^2 F$ is $A_3$-Li...")
      conclusion = SemanticGap span "Remark 5. Since $M$ is compact and $F$ is smooth, there exist constants $A_1, A_2, A_3 \\geq 1$ such that $F$ is $A_1$-Lipschitz, $\\textup{grad}_{g}\\,F$ is $A_2$-Lipschitz, and $\\nabla^2 F$ is $A_3$-Li..."
      target = LeanTarget "thm_1" "theorem" span
  in TheoremIR
       { theoremId = "theorem_thm_1"
       , theoremStatement = "Remark 5. Since $M$ is compact and $F$ is smooth, there exist constants $A_1, A_2, A_3 \\geq 1$ such that $F$ is $A_1$-Lipschitz, $\\textup{grad}_{g}\\,F$ is $A_2$-Lipschitz, and $\\nabla^2 F$ is $A_3$-Li..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_2_thm_2 :: TheoremIR
theorem_2_thm_2 =
  let span = (SourceSpan "theorem_graph.json" "thm-2" "thm-2" "sec-1-1" "Remark 11. Assumptions [9](#assumption3.5.1){reference-type=\"ref\" reference=\"assumption3.5.1\"} and [10](#assumption3.5.2){reference-type=\"ref\" reference=\"assumption3.5.2\"} hold if 1. For every saddle ...")
      conclusion = SemanticGap span "Remark 11. Assumptions [9](#assumption3.5.1){reference-type=\"ref\" reference=\"assumption3.5.1\"} and [10](#assumption3.5.2){reference-type=\"ref\" reference=\"assumption3.5.2\"} hold if 1. For every saddle ..."
      target = LeanTarget "thm_2" "theorem" span
  in TheoremIR
       { theoremId = "theorem_thm_2"
       , theoremStatement = "Remark 11. Assumptions [9](#assumption3.5.1){reference-type=\"ref\" reference=\"assumption3.5.1\"} and [10](#assumption3.5.2){reference-type=\"ref\" reference=\"assumption3.5.2\"} hold if 1. For every saddle ..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindEquation
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_3_thm_3 :: TheoremIR
theorem_3_thm_3 =
  let span = (SourceSpan "theorem_graph.json" "thm-3" "thm-3" "sec-1-1" "Remark 13. This assumption holds whenever $$|\\textup{grad}_g\\, F(x)|_g \\geq C_{\\tilde F} d_g(x, \\mathcal{C}),$$ for every $x \\in M$, where $\\mathcal{C}$ denotes the set of critical points of $F$. Inde...")
      conclusion = SemanticGap span "Remark 13. This assumption holds whenever $$|\\textup{grad}_g\\, F(x)|_g \\geq C_{\\tilde F} d_g(x, \\mathcal{C}),$$ for every $x \\in M$, where $\\mathcal{C}$ denotes the set of critical points of $F$. Inde..."
      target = LeanTarget "thm_3" "theorem" span
  in TheoremIR
       { theoremId = "theorem_thm_3"
       , theoremStatement = "Remark 13. This assumption holds whenever $$|\\textup{grad}_g\\, F(x)|_g \\geq C_{\\tilde F} d_g(x, \\mathcal{C}),$$ for every $x \\in M$, where $\\mathcal{C}$ denotes the set of critical points of $F$. Inde..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_4_thm_maininformal2 :: TheoremIR
theorem_4_thm_maininformal2 =
  let span = (SourceSpan "theorem_graph.json" "thm:MainInformal2" "thm:MainInformal2" "sec-1-1" "Theorem 15 (Main result 2 - informal version). Let $(M, g)$ be a compact Riemannian manifold of dimension $\\dim(M) \\geq 2$. Let $F: M \\to \\mathbb{R}$ be twice differentiable with an $A_2$-Lipschitz gr...")
      conclusion = SemanticGap span "Theorem 15 (Main result 2 - informal version). Let $(M, g)$ be a compact Riemannian manifold of dimension $\\dim(M) \\geq 2$. Let $F: M \\to \\mathbb{R}$ be twice differentiable with an $A_2$-Lipschitz gr..."
      target = LeanTarget "thm_MainInformal2" "theorem" span
  in TheoremIR
       { theoremId = "theorem_thm_MainInformal2"
       , theoremStatement = "Theorem 15 (Main result 2 - informal version). Let $(M, g)$ be a compact Riemannian manifold of dimension $\\dim(M) \\geq 2$. Let $F: M \\to \\mathbb{R}$ be twice differentiable with an $A_2$-Lipschitz gr..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_5_thm_6 :: TheoremIR
theorem_5_thm_6 =
  let span = (SourceSpan "theorem_graph.json" "thm-6" "thm-6" "sec-1-1" "Remark 16. As a consequence of [14](#thm:MainInformal1){reference-type=\"ref+label\" reference=\"thm:MainInformal1\"}, if $$\\beta \\in \\Omega(\\textup{poly}(\\dim(M))),$$ i.e. if the constants that lower bou...")
      conclusion = SemanticGap span "Remark 16. As a consequence of [14](#thm:MainInformal1){reference-type=\"ref+label\" reference=\"thm:MainInformal1\"}, if $$\\beta \\in \\Omega(\\textup{poly}(\\dim(M))),$$ i.e. if the constants that lower bou..."
      target = LeanTarget "thm_6" "theorem" span
  in TheoremIR
       { theoremId = "theorem_thm_6"
       , theoremStatement = "Remark 16. As a consequence of [14](#thm:MainInformal1){reference-type=\"ref+label\" reference=\"thm:MainInformal1\"}, if $$\\beta \\in \\Omega(\\textup{poly}(\\dim(M))),$$ i.e. if the constants that lower bou..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindEquation
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_6_rem_explicitexprlangevin :: TheoremIR
theorem_6_rem_explicitexprlangevin =
  let span = (SourceSpan "theorem_graph.json" "rem:explicitexprLangevin" "rem:explicitexprLangevin" "sec-2" "Remark 22. The carré du champ operator associated with $\\operatorname{L}$ as given in [17](#def:Langevingenerator){reference-type=\"ref+label\" reference=\"def:Langevingenerator\"} can be written as $$\\Ga...")
      conclusion = SemanticGap span "Remark 22. The carré du champ operator associated with $\\operatorname{L}$ as given in [17](#def:Langevingenerator){reference-type=\"ref+label\" reference=\"def:Langevingenerator\"} can be written as $$\\Ga..."
      target = LeanTarget "rem_explicitexprLangevin" "theorem" span
  in TheoremIR
       { theoremId = "theorem_rem_explicitexprLangevin"
       , theoremStatement = "Remark 22. The carré du champ operator associated with $\\operatorname{L}$ as given in [17](#def:Langevingenerator){reference-type=\"ref+label\" reference=\"def:Langevingenerator\"} can be written as $$\\Ga..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindEquation
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_7_thm_15 :: TheoremIR
theorem_7_thm_15 =
  let span = (SourceSpan "theorem_graph.json" "thm-15" "thm-15" "sec-2-1" "Remark 27. Since $M$ is compact and $F$ is smooth, we know that there exist constants $A_1, A_2, A_3 \\geq 1$ such that $F$ is $A_1$-Lipschitz, $\\textup{grad}_{g}\\,F$ is $A_2$-Lipschitz, and $\\nabla^2 ...")
      conclusion = SemanticGap span "Remark 27. Since $M$ is compact and $F$ is smooth, we know that there exist constants $A_1, A_2, A_3 \\geq 1$ such that $F$ is $A_1$-Lipschitz, $\\textup{grad}_{g}\\,F$ is $A_2$-Lipschitz, and $\\nabla^2 ..."
      target = LeanTarget "thm_15" "theorem" span
  in TheoremIR
       { theoremId = "theorem_thm_15"
       , theoremStatement = "Remark 27. Since $M$ is compact and $F$ is smooth, we know that there exist constants $A_1, A_2, A_3 \\geq 1$ such that $F$ is $A_1$-Lipschitz, $\\textup{grad}_{g}\\,F$ is $A_2$-Lipschitz, and $\\nabla^2 ..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_8_prop9_12 :: TheoremIR
theorem_8_prop9_12 =
  let span = (SourceSpan "theorem_graph.json" "prop9.12" "prop9.12" "sec-2-1" "Theorem 34 (Poincaré Inequality on $B$). Let $(M, g)$ and $(B, h)$ be two Riemannian manifolds satisfying [25](#modassumption3.9){reference-type=\"ref+label\" reference=\"modassumption3.9\"} with constant...")
      conclusion = SemanticGap span "Theorem 34 (Poincaré Inequality on $B$). Let $(M, g)$ and $(B, h)$ be two Riemannian manifolds satisfying [25](#modassumption3.9){reference-type=\"ref+label\" reference=\"modassumption3.9\"} with constant..."
      target = LeanTarget "prop9_12" "theorem" span
  in TheoremIR
       { theoremId = "theorem_prop9_12"
       , theoremStatement = "Theorem 34 (Poincaré Inequality on $B$). Let $(M, g)$ and $(B, h)$ be two Riemannian manifolds satisfying [25](#modassumption3.9){reference-type=\"ref+label\" reference=\"modassumption3.9\"} with constant..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindEquation
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_9_lemma9_8 :: TheoremIR
theorem_9_lemma9_8 =
  let span = (SourceSpan "theorem_graph.json" "lemma9.8" "lemma9.8" "sec-2-2-1" "Lemma 37 ([@LiErd2022Supp Lemma D.8]). Let $(B, h)$ be a compact Riemannian manifold. Let $\\tilde F: B \\to \\mathbb{R}$ be smooth, and suppose that it satisfies . Let $\\tilde{\\mathcal{C}}$ be the set o...")
      conclusion = SemanticGap span "Lemma 37 ([@LiErd2022Supp Lemma D.8]). Let $(B, h)$ be a compact Riemannian manifold. Let $\\tilde F: B \\to \\mathbb{R}$ be smooth, and suppose that it satisfies . Let $\\tilde{\\mathcal{C}}$ be the set o..."
      target = LeanTarget "lemma9_8" "theorem" span
  in TheoremIR
       { theoremId = "theorem_lemma9_8"
       , theoremStatement = "Lemma 37 ([@LiErd2022Supp Lemma D.8]). Let $(B, h)$ be a compact Riemannian manifold. Let $\\tilde F: B \\to \\mathbb{R}$ be smooth, and suppose that it satisfies . Let $\\tilde{\\mathcal{C}}$ be the set o..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "lemma"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_10_cor9_3 :: TheoremIR
theorem_10_cor9_3 =
  let span = (SourceSpan "theorem_graph.json" "cor9.3" "cor9.3" "sec-2-2-2" "Corollary 41. Let $(B, h)$ be a compact Riemannian manifold. Suppose that $\\tilde F : B \\to \\mathbb{R}$ is smooth and satisfies . Let $a, \\beta > 0$, $$\\tilde{\\operatorname{L}} = -\\textup{grad}_{h}\\,\\...")
      conclusion = SemanticGap span "Corollary 41. Let $(B, h)$ be a compact Riemannian manifold. Suppose that $\\tilde F : B \\to \\mathbb{R}$ is smooth and satisfies . Let $a, \\beta > 0$, $$\\tilde{\\operatorname{L}} = -\\textup{grad}_{h}\\,\\..."
      target = LeanTarget "cor9_3" "theorem" span
  in TheoremIR
       { theoremId = "theorem_cor9_3"
       , theoremStatement = "Corollary 41. Let $(B, h)$ be a compact Riemannian manifold. Suppose that $\\tilde F : B \\to \\mathbb{R}$ is smooth and satisfies . Let $a, \\beta > 0$, $$\\tilde{\\operatorname{L}} = -\\textup{grad}_{h}\\,\\..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindEquation
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_11_rmk_assumptions :: TheoremIR
theorem_11_rmk_assumptions =
  let span = (SourceSpan "theorem_graph.json" "rmk:assumptions" "rmk:assumptions" "sec-2-2-2" "Remark 42. The regularity assumption of the boundary of $U\\Big(\\frac{a}{\\sqrt{\\beta}}, \\tilde{\\mathcal{S}}\\Big)$ is made to guarantee that $W_2$ is smooth up to the boundary of $U\\Big(\\frac{a}{\\sqrt{\\...")
      conclusion = SemanticGap span "Remark 42. The regularity assumption of the boundary of $U\\Big(\\frac{a}{\\sqrt{\\beta}}, \\tilde{\\mathcal{S}}\\Big)$ is made to guarantee that $W_2$ is smooth up to the boundary of $U\\Big(\\frac{a}{\\sqrt{\\..."
      target = LeanTarget "rmk_assumptions" "theorem" span
  in TheoremIR
       { theoremId = "theorem_rmk_assumptions"
       , theoremStatement = "Remark 42. The regularity assumption of the boundary of $U\\Big(\\frac{a}{\\sqrt{\\beta}}, \\tilde{\\mathcal{S}}\\Big)$ is made to guarantee that $W_2$ is smooth up to the boundary of $U\\Big(\\frac{a}{\\sqrt{\\..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "bound"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_12_proposition10_55 :: TheoremIR
theorem_12_proposition10_55 =
  let span = (SourceSpan "theorem_graph.json" "proposition10.55" "proposition10.55" "sec-2-2-2" "Lemma 44 ([@boumal2022intromanifolds Proposition 10.55]). Let $(M, g)$ be a Riemannian manifold and let $f \\in C^2(M)$. Let $x \\in M$, $v \\in T_xM$, and let $\\gamma(t) = \\exp_x(tv)$ be defined on $[0,...")
      conclusion = SemanticGap span "Lemma 44 ([@boumal2022intromanifolds Proposition 10.55]). Let $(M, g)$ be a Riemannian manifold and let $f \\in C^2(M)$. Let $x \\in M$, $v \\in T_xM$, and let $\\gamma(t) = \\exp_x(tv)$ be defined on $[0,..."
      target = LeanTarget "proposition10_55" "theorem" span
  in TheoremIR
       { theoremId = "theorem_proposition10_55"
       , theoremStatement = "Lemma 44 ([@boumal2022intromanifolds Proposition 10.55]). Let $(M, g)$ be a Riemannian manifold and let $f \\in C^2(M)$. Let $x \\in M$, $v \\in T_xM$, and let $\\gamma(t) = \\exp_x(tv)$ be defined on $[0,..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "lemma"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_13_lem_normdifferencegradfh :: TheoremIR
theorem_13_lem_normdifferencegradfh =
  let span = (SourceSpan "theorem_graph.json" "lem:normdifferencegradFH" "lem:normdifferencegradFH" "sec-2-2-2" "Lemma 46. Let $y \\in \\tilde{\\mathcal{S}}$ be some fixed saddle point of $\\tilde F$. Then for every $x$ outside the cut locus of $y$ it holds that $$|\\textup{P}^{-1}_{\\log_y x}\\, \\textup{grad}_{h}\\,\\ti...")
      conclusion = SemanticGap span "Lemma 46. Let $y \\in \\tilde{\\mathcal{S}}$ be some fixed saddle point of $\\tilde F$. Then for every $x$ outside the cut locus of $y$ it holds that $$|\\textup{P}^{-1}_{\\log_y x}\\, \\textup{grad}_{h}\\,\\ti..."
      target = LeanTarget "lem_normdifferencegradFH" "theorem" span
  in TheoremIR
       { theoremId = "theorem_lem_normdifferencegradFH"
       , theoremStatement = "Lemma 46. Let $y \\in \\tilde{\\mathcal{S}}$ be some fixed saddle point of $\\tilde F$. Then for every $x$ outside the cut locus of $y$ it holds that $$|\\textup{P}^{-1}_{\\log_y x}\\, \\textup{grad}_{h}\\,\\ti..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "lemma"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_14_prop9_6 :: TheoremIR
theorem_14_prop9_6 =
  let span = (SourceSpan "theorem_graph.json" "prop9.6" "prop9.6" "sec-2-2-2" "Proposition 48 (Local Escape Time Bound). Let $(M, g)$ be a compact manifold which is furthermore a symmetric space. Let $\\pi: (M, g) \\to (B, h)$ be a surjective Riemannian submersion with totally geo...")
      conclusion = SemanticGap span "Proposition 48 (Local Escape Time Bound). Let $(M, g)$ be a compact manifold which is furthermore a symmetric space. Let $\\pi: (M, g) \\to (B, h)$ be a surjective Riemannian submersion with totally geo..."
      target = LeanTarget "prop9_6" "theorem" span
  in TheoremIR
       { theoremId = "theorem_prop9_6"
       , theoremStatement = "Proposition 48 (Local Escape Time Bound). Let $(M, g)$ be a compact manifold which is furthermore a symmetric space. Let $\\pi: (M, g) \\to (B, h)$ be a surjective Riemannian submersion with totally geo..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "bound"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_15_auxlemma1 :: TheoremIR
theorem_15_auxlemma1 =
  let span = (SourceSpan "theorem_graph.json" "AuxLemma1" "AuxLemma1" "sec-2-3-2" "Lemma 51 ([@lee2018introductionRiemannian Theorem 6.31]). Let $y \\in B$ be some fixed point. The distance function $x \\mapsto d_h(x, y)$ is a smooth function on $\\mathcal{B}(i(B),y) \\setminus \\{y\\}$ w...")
      conclusion = SemanticGap span "Lemma 51 ([@lee2018introductionRiemannian Theorem 6.31]). Let $y \\in B$ be some fixed point. The distance function $x \\mapsto d_h(x, y)$ is a smooth function on $\\mathcal{B}(i(B),y) \\setminus \\{y\\}$ w..."
      target = LeanTarget "AuxLemma1" "theorem" span
  in TheoremIR
       { theoremId = "theorem_AuxLemma1"
       , theoremStatement = "Lemma 51 ([@lee2018introductionRiemannian Theorem 6.31]). Let $y \\in B$ be some fixed point. The distance function $x \\mapsto d_h(x, y)$ is a smooth function on $\\mathcal{B}(i(B),y) \\setminus \\{y\\}$ w..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "lemma"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_16_lem_defbumpfunction :: TheoremIR
theorem_16_lem_defbumpfunction =
  let span = (SourceSpan "theorem_graph.json" "lem:defbumpfunction" "lem:defbumpfunction" "sec-2-3-2" "Lemma 52. Let $$r := \\frac{a}{\\sqrt{\\beta}} \\leq \\min\\Big\\{i(B), \\frac{D}{3}\\Big\\},$$ where $D$ is the lower bound on the distance between any two saddle points of $\\tilde F$ (cf. [30](#modassumption3...")
      conclusion = SemanticGap span "Lemma 52. Let $$r := \\frac{a}{\\sqrt{\\beta}} \\leq \\min\\Big\\{i(B), \\frac{D}{3}\\Big\\},$$ where $D$ is the lower bound on the distance between any two saddle points of $\\tilde F$ (cf. [30](#modassumption3..."
      target = LeanTarget "lem_defbumpfunction" "theorem" span
  in TheoremIR
       { theoremId = "theorem_lem_defbumpfunction"
       , theoremStatement = "Lemma 52. Let $$r := \\frac{a}{\\sqrt{\\beta}} \\leq \\min\\Big\\{i(B), \\frac{D}{3}\\Big\\},$$ where $D$ is the lower bound on the distance between any two saddle points of $\\tilde F$ (cf. [30](#modassumption3..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "lemma"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_17_thm_fubinimanifolds :: TheoremIR
theorem_17_thm_fubinimanifolds =
  let span = (SourceSpan "theorem_graph.json" "thm:fubinimanifolds" "thm:fubinimanifolds" "sec-3-1" "Theorem 54 ([@sulanke1972differentialgeometrie Chapter III, Section 2, Theorem 1]). Let $M$ and $N$ be two smooth manifolds of dimensions $m$ and $n$, respectively. Let $\\varphi : M \\to N$ be a $C^1$ ...")
      conclusion = SemanticGap span "Theorem 54 ([@sulanke1972differentialgeometrie Chapter III, Section 2, Theorem 1]). Let $M$ and $N$ be two smooth manifolds of dimensions $m$ and $n$, respectively. Let $\\varphi : M \\to N$ be a $C^1$ ..."
      target = LeanTarget "thm_fubinimanifolds" "theorem" span
  in TheoremIR
       { theoremId = "theorem_thm_fubinimanifolds"
       , theoremStatement = "Theorem 54 ([@sulanke1972differentialgeometrie Chapter III, Section 2, Theorem 1]). Let $M$ and $N$ be two smooth manifolds of dimensions $m$ and $n$, respectively. Let $\\varphi : M \\to N$ be a $C^1$ ..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_18_liftingsobolev :: TheoremIR
theorem_18_liftingsobolev =
  let span = (SourceSpan "theorem_graph.json" "LiftingSobolev" "LiftingSobolev" "sec-3-1" "Corollary 55. Let $\\pi : (M, g) \\rightarrow (N, h)$ be a Riemannian submersion. Let us denote by $\\hat{g}(x) := g|_{\\pi^{-1}(x)}$ the induced metric on the fiber $\\pi^{-1}(x)$, for every $x \\in N$. Fo...")
      conclusion = SemanticGap span "Corollary 55. Let $\\pi : (M, g) \\rightarrow (N, h)$ be a Riemannian submersion. Let us denote by $\\hat{g}(x) := g|_{\\pi^{-1}(x)}$ the induced metric on the fiber $\\pi^{-1}(x)$, for every $x \\in N$. Fo..."
      target = LeanTarget "LiftingSobolev" "theorem" span
  in TheoremIR
       { theoremId = "theorem_LiftingSobolev"
       , theoremStatement = "Corollary 55. Let $\\pi : (M, g) \\rightarrow (N, h)$ be a Riemannian submersion. Let us denote by $\\hat{g}(x) := g|_{\\pi^{-1}(x)}$ the induced metric on the fiber $\\pi^{-1}(x)$, for every $x \\in N$. Fo..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindEquation
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_19_thm_lsiimplieshypercontract :: TheoremIR
theorem_19_thm_lsiimplieshypercontract =
  let span = (SourceSpan "theorem_graph.json" "thm:LSIImpliesHypercontract" "thm:LSIImpliesHypercontract" "sec-4" "Proposition 66. If the Markov triple $(M, \\nu, \\Gamma)$ satisfies an $\\textup{LSI}(\\alpha)$, then $$\\norm{\\rho_t - \\nu}^2_{\\textup{TV}} \\leq \\frac{1}{2} e^{-2\\alpha t} H(\\rho_0 | \\nu),\\quad \\forall t ...")
      conclusion = SemanticGap span "Proposition 66. If the Markov triple $(M, \\nu, \\Gamma)$ satisfies an $\\textup{LSI}(\\alpha)$, then $$\\norm{\\rho_t - \\nu}^2_{\\textup{TV}} \\leq \\frac{1}{2} e^{-2\\alpha t} H(\\rho_0 | \\nu),\\quad \\forall t ..."
      target = LeanTarget "thm_LSIImpliesHypercontract" "theorem" span
  in TheoremIR
       { theoremId = "theorem_thm_LSIImpliesHypercontract"
       , theoremStatement = "Proposition 66. If the Markov triple $(M, \\nu, \\Gamma)$ satisfies an $\\textup{LSI}(\\alpha)$, then $$\\norm{\\rho_t - \\nu}^2_{\\textup{TV}} \\leq \\frac{1}{2} e^{-2\\alpha t} H(\\rho_0 | \\nu),\\quad \\forall t ..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_20_boundinitialrelativeentropy :: TheoremIR
theorem_20_boundinitialrelativeentropy =
  let span = (SourceSpan "theorem_graph.json" "BoundInitialRelativeEntropy" "BoundInitialRelativeEntropy" "sec-4" "Proposition 67. Let $\\mu$ be the uniform distribution on a compact Riemannian manifold $(M, g)$, let $F : M \\to \\mathbb{R}$ be a smooth function satisfying $\\min_{x \\in M} F(x) \\geq 0$, and let $\\nu$ ...")
      conclusion = SemanticGap span "Proposition 67. Let $\\mu$ be the uniform distribution on a compact Riemannian manifold $(M, g)$, let $F : M \\to \\mathbb{R}$ be a smooth function satisfying $\\min_{x \\in M} F(x) \\geq 0$, and let $\\nu$ ..."
      target = LeanTarget "BoundInitialRelativeEntropy" "theorem" span
  in TheoremIR
       { theoremId = "theorem_BoundInitialRelativeEntropy"
       , theoremStatement = "Proposition 67. Let $\\mu$ be the uniform distribution on a compact Riemannian manifold $(M, g)$, let $F : M \\to \\mathbb{R}$ be a smooth function satisfying $\\min_{x \\in M} F(x) \\geq 0$, and let $\\nu$ ..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_21_theorem9_13 :: TheoremIR
theorem_21_theorem9_13 =
  let span = (SourceSpan "theorem_graph.json" "theorem9.13" "theorem9.13" "sec-4-1" "Proposition 72 (HWI Inequality, [@villani2008optimal Corollary 20.13]). Let $(M, g)$ be a compact Riemannian manifold equipped with a measure $\\mu = e^{-V}$, $V \\in C^2(M)$, satisfying the following c...")
      conclusion = SemanticGap span "Proposition 72 (HWI Inequality, [@villani2008optimal Corollary 20.13]). Let $(M, g)$ be a compact Riemannian manifold equipped with a measure $\\mu = e^{-V}$, $V \\in C^2(M)$, satisfying the following c..."
      target = LeanTarget "theorem9_13" "theorem" span
  in TheoremIR
       { theoremId = "theorem_theorem9_13"
       , theoremStatement = "Proposition 72 (HWI Inequality, [@villani2008optimal Corollary 20.13]). Let $(M, g)$ be a compact Riemannian manifold equipped with a measure $\\mu = e^{-V}$, $V \\in C^2(M)$, satisfying the following c..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindEquation
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_22_target_9_14li :: TheoremIR
theorem_22_target_9_14li =
  let span = (SourceSpan "theorem_graph.json" "9.14Li" "9.14Li" "sec-4-1" "Lemma 73 ([@villani2008optimal Theorem 6.15]). Let $\\mu, \\eta$ be two probability measures on a separable and complete metric space $(\\mathcal{X}, d)$. Then for every $p \\geq 1$ and every $x_0 \\in \\ma...")
      conclusion = SemanticGap span "Lemma 73 ([@villani2008optimal Theorem 6.15]). Let $\\mu, \\eta$ be two probability measures on a separable and complete metric space $(\\mathcal{X}, d)$. Then for every $p \\geq 1$ and every $x_0 \\in \\ma..."
      target = LeanTarget "9_14Li" "theorem" span
  in TheoremIR
       { theoremId = "theorem_9_14Li"
       , theoremStatement = "Lemma 73 ([@villani2008optimal Theorem 6.15]). Let $\\mu, \\eta$ be two probability measures on a separable and complete metric space $(\\mathcal{X}, d)$. Then for every $p \\geq 1$ and every $x_0 \\in \\ma..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "lemma"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_23_cotawasserstein :: TheoremIR
theorem_23_cotawasserstein =
  let span = (SourceSpan "theorem_graph.json" "cotaWasserstein" "cotaWasserstein" "sec-4-1" "Remark 74. Let $(M, g)$ be a compact Riemannian manifold with diameter $\\textup{diam}(M)$. Then for any two probability measures $\\mu, \\eta \\in P_2(M)$ it holds that $$W_2(\\mu, \\eta)^2 \\leq 4\\, \\textu...")
      conclusion = SemanticGap span "Remark 74. Let $(M, g)$ be a compact Riemannian manifold with diameter $\\textup{diam}(M)$. Then for any two probability measures $\\mu, \\eta \\in P_2(M)$ it holds that $$W_2(\\mu, \\eta)^2 \\leq 4\\, \\textu..."
      target = LeanTarget "cotaWasserstein" "theorem" span
  in TheoremIR
       { theoremId = "theorem_cotaWasserstein"
       , theoremStatement = "Remark 74. Let $(M, g)$ be a compact Riemannian manifold with diameter $\\textup{diam}(M)$. Then for any two probability measures $\\mu, \\eta \\in P_2(M)$ it holds that $$W_2(\\mu, \\eta)^2 \\leq 4\\, \\textu..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_24_thm_mainformal1 :: TheoremIR
theorem_24_thm_mainformal1 =
  let span = (SourceSpan "theorem_graph.json" "thm:MainFormal1" "thm:MainFormal1" "sec-5" "Theorem 76 ([14](#thm:MainInformal1){reference-type=\"ref+label\" reference=\"thm:MainInformal1\"} - formal version). Let $(M, g)$ be a compact Riemannian manifold of dimension $\\dim(M) \\geq 2$, which is ...")
      conclusion = SemanticGap span "Theorem 76 ([14](#thm:MainInformal1){reference-type=\"ref+label\" reference=\"thm:MainInformal1\"} - formal version). Let $(M, g)$ be a compact Riemannian manifold of dimension $\\dim(M) \\geq 2$, which is ..."
      target = LeanTarget "thm_MainFormal1" "theorem" span
  in TheoremIR
       { theoremId = "theorem_thm_MainFormal1"
       , theoremStatement = "Theorem 76 ([14](#thm:MainInformal1){reference-type=\"ref+label\" reference=\"thm:MainInformal1\"} - formal version). Let $(M, g)$ be a compact Riemannian manifold of dimension $\\dim(M) \\geq 2$, which is ..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindEquation
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_25_thm_mainformal2 :: TheoremIR
theorem_25_thm_mainformal2 =
  let span = (SourceSpan "theorem_graph.json" "thm:MainFormal2" "thm:MainFormal2" "sec-6" "Theorem 78 ([15](#thm:MainInformal2){reference-type=\"ref+label\" reference=\"thm:MainInformal2\"} - formal version). Let $(M, g)$ be a compact Riemannian manifold of dimension $d \\geq 2$, and let $F : M ...")
      conclusion = SemanticGap span "Theorem 78 ([15](#thm:MainInformal2){reference-type=\"ref+label\" reference=\"thm:MainInformal2\"} - formal version). Let $(M, g)$ be a compact Riemannian manifold of dimension $d \\geq 2$, and let $F : M ..."
      target = LeanTarget "thm_MainFormal2" "theorem" span
  in TheoremIR
       { theoremId = "theorem_thm_MainFormal2"
       , theoremStatement = "Theorem 78 ([15](#thm:MainInformal2){reference-type=\"ref+label\" reference=\"thm:MainInformal2\"} - formal version). Let $(M, g)$ be a compact Riemannian manifold of dimension $d \\geq 2$, and let $F : M ..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindEquation
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_26_lem_firstlemsubopt :: TheoremIR
theorem_26_lem_firstlemsubopt =
  let span = (SourceSpan "theorem_graph.json" "lem:firstlemsubopt" "lem:firstlemsubopt" "sec-6" "Lemma 79 ([@LiErd2022Supp Lemma C.1]). Let $(M, g)$, $\\varepsilon_{\\max}$ and $F$ be as in [78](#thm:MainFormal2){reference-type=\"ref+label\" reference=\"thm:MainFormal2\"}. Let $x^ \\in M$ be any global ...")
      conclusion = SemanticGap span "Lemma 79 ([@LiErd2022Supp Lemma C.1]). Let $(M, g)$, $\\varepsilon_{\\max}$ and $F$ be as in [78](#thm:MainFormal2){reference-type=\"ref+label\" reference=\"thm:MainFormal2\"}. Let $x^ \\in M$ be any global ..."
      target = LeanTarget "lem_firstlemsubopt" "theorem" span
  in TheoremIR
       { theoremId = "theorem_lem_firstlemsubopt"
       , theoremStatement = "Lemma 79 ([@LiErd2022Supp Lemma C.1]). Let $(M, g)$, $\\varepsilon_{\\max}$ and $F$ be as in [78](#thm:MainFormal2){reference-type=\"ref+label\" reference=\"thm:MainFormal2\"}. Let $x^ \\in M$ be any global ..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "lemma"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_27_thm_88 :: TheoremIR
theorem_27_thm_88 =
  let span = (SourceSpan "theorem_graph.json" "thm-88" "thm-88" "sec-6" "Lemma 80. Let $(M, g)$ be a compact Riemannian manifold of dimension $d$. Let $$\\varepsilon_{\\max} = \\min\\Big\\{\\frac{i(M)^2 A_2}{8}, 1\\Big\\}$$ and let $\\varepsilon \\in (0, \\varepsilon_{\\max}]$, $R = \\...")
      conclusion = SemanticGap span "Lemma 80. Let $(M, g)$ be a compact Riemannian manifold of dimension $d$. Let $$\\varepsilon_{\\max} = \\min\\Big\\{\\frac{i(M)^2 A_2}{8}, 1\\Big\\}$$ and let $\\varepsilon \\in (0, \\varepsilon_{\\max}]$, $R = \\..."
      target = LeanTarget "thm_88" "theorem" span
  in TheoremIR
       { theoremId = "theorem_thm_88"
       , theoremStatement = "Lemma 80. Let $(M, g)$ be a compact Riemannian manifold of dimension $d$. Let $$\\varepsilon_{\\max} = \\min\\Big\\{\\frac{i(M)^2 A_2}{8}, 1\\Big\\}$$ and let $\\varepsilon \\in (0, \\varepsilon_{\\max}]$, $R = \\..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "lemma"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_28_thm_91 :: TheoremIR
theorem_28_thm_91 =
  let span = (SourceSpan "theorem_graph.json" "thm-91" "thm-91" "sec-6" "Remark 81. The choice of $\\beta$ in [78](#thm:MainFormal2){reference-type=\"ref+label\" reference=\"thm:MainFormal2\"} scales as $$\\Omega\\left(\\frac{d^2}{\\varepsilon}\\log\\left(\\frac{dA_2 \\textup{Vol}(M)}{...")
      conclusion = SemanticGap span "Remark 81. The choice of $\\beta$ in [78](#thm:MainFormal2){reference-type=\"ref+label\" reference=\"thm:MainFormal2\"} scales as $$\\Omega\\left(\\frac{d^2}{\\varepsilon}\\log\\left(\\frac{dA_2 \\textup{Vol}(M)}{..."
      target = LeanTarget "thm_91" "theorem" span
  in TheoremIR
       { theoremId = "theorem_thm_91"
       , theoremStatement = "Remark 81. The choice of $\\beta$ in [78](#thm:MainFormal2){reference-type=\"ref+label\" reference=\"thm:MainFormal2\"} scales as $$\\Omega\\left(\\frac{d^2}{\\varepsilon}\\log\\left(\\frac{dA_2 \\textup{Vol}(M)}{..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindEquation
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_29_thm_nolocalminimatraceratio :: TheoremIR
theorem_29_thm_nolocalminimatraceratio =
  let span = (SourceSpan "theorem_graph.json" "thm:nolocalminimatraceratio" "thm:nolocalminimatraceratio" "sec-7-1" "Proposition 82 ([@shen2010tracequotient Theorem 2]). Every local minimum of $\\tilde f$ is a global minimum.")
      conclusion = SemanticGap span "Proposition 82 ([@shen2010tracequotient Theorem 2]). Every local minimum of $\\tilde f$ is a global minimum"
      target = LeanTarget "thm_nolocalminimatraceratio" "theorem" span
  in TheoremIR
       { theoremId = "theorem_thm_nolocalminimatraceratio"
       , theoremStatement = "Proposition 82 ([@shen2010tracequotient Theorem 2]). Every local minimum of $\\tilde f$ is a global minimum."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_30_thm_simultdiag :: TheoremIR
theorem_30_thm_simultdiag =
  let span = (SourceSpan "theorem_graph.json" "thm:simultdiag" "thm:simultdiag" "sec-7-1-1" "Proposition 84 ([@horn2012matrix Theorem 7.6.4]). Let $A, B$ be two Hermitian matrices. If $B$ is positive definite, then there exists a non-singular matrix $S$ such that $B = SS^\\dagger$ and $A = S \\...")
      conclusion = SemanticGap span "Proposition 84 ([@horn2012matrix Theorem 7.6.4]). Let $A, B$ be two Hermitian matrices. If $B$ is positive definite, then there exists a non-singular matrix $S$ such that $B = SS^\\dagger$ and $A = S \\..."
      target = LeanTarget "thm_simultdiag" "theorem" span
  in TheoremIR
       { theoremId = "theorem_thm_simultdiag"
       , theoremStatement = "Proposition 84 ([@horn2012matrix Theorem 7.6.4]). Let $A, B$ be two Hermitian matrices. If $B$ is positive definite, then there exists a non-singular matrix $S$ such that $B = SS^\\dagger$ and $A = S \\..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindEquation
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_31_thm_103 :: TheoremIR
theorem_31_thm_103 =
  let span = (SourceSpan "theorem_graph.json" "thm-103" "thm-103" "sec-7-1-2" "Remark 93. In the case when $\\tilde f$ is defined on $\\textup{Gr}_1(\\mathbb{C}^n)$ or $B = \\mathds{1}$, [88](#ass:sec8.1assumption1){reference-type=\"ref+label\" reference=\"ass:sec8.1assumption1\"} holds...")
      conclusion = SemanticGap span "Remark 93. In the case when $\\tilde f$ is defined on $\\textup{Gr}_1(\\mathbb{C}^n)$ or $B = \\mathds{1}$, [88](#ass:sec8.1assumption1){reference-type=\"ref+label\" reference=\"ass:sec8.1assumption1\"} holds..."
      target = LeanTarget "thm_103" "theorem" span
  in TheoremIR
       { theoremId = "theorem_thm_103"
       , theoremStatement = "Remark 93. In the case when $\\tilde f$ is defined on $\\textup{Gr}_1(\\mathbb{C}^n)$ or $B = \\mathds{1}$, [88](#ass:sec8.1assumption1){reference-type=\"ref+label\" reference=\"ass:sec8.1assumption1\"} holds..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindEquation
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_32_thm_104 :: TheoremIR
theorem_32_thm_104 =
  let span = (SourceSpan "theorem_graph.json" "thm-104" "thm-104" "sec-7-1-2" "Corollary 94. Let $X_t$, $\\hat X_t$ and $\\tilde X_t$ be the Langevin diffusion processes generated by $\\operatorname{L}_F$, $\\operatorname{L}_f$, and $\\operatorname{L}_{\\tilde f}$, with initial unifor...")
      conclusion = SemanticGap span "Corollary 94. Let $X_t$, $\\hat X_t$ and $\\tilde X_t$ be the Langevin diffusion processes generated by $\\operatorname{L}_F$, $\\operatorname{L}_f$, and $\\operatorname{L}_{\\tilde f}$, with initial unifor..."
      target = LeanTarget "thm_104" "theorem" span
  in TheoremIR
       { theoremId = "theorem_thm_104"
       , theoremStatement = "Corollary 94. Let $X_t$, $\\hat X_t$ and $\\tilde X_t$ be the Langevin diffusion processes generated by $\\operatorname{L}_F$, $\\operatorname{L}_f$, and $\\operatorname{L}_{\\tilde f}$, with initial unifor..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_33_prop_isomsus :: TheoremIR
theorem_33_prop_isomsus =
  let span = (SourceSpan "theorem_graph.json" "prop:isomSUS" "prop:isomSUS" "sec-7-2" "Proposition 95. Let $\\textup{SU}(2)$ be endowed with the bi-invariant metric $g_{\\mathit{bi}}$. Then $$(\\textup{SU}(2), g_{\\mathit{bi}}) \\simeq (\\mathbb{S}^3, 2g_{\\textit{round}}),$$ where $g_{\\textit...")
      conclusion = SemanticGap span "Proposition 95. Let $\\textup{SU}(2)$ be endowed with the bi-invariant metric $g_{\\mathit{bi}}$. Then $$(\\textup{SU}(2), g_{\\mathit{bi}}) \\simeq (\\mathbb{S}^3, 2g_{\\textit{round}}),$$ where $g_{\\textit..."
      target = LeanTarget "prop_isomSUS" "theorem" span
  in TheoremIR
       { theoremId = "theorem_prop_isomSUS"
       , theoremStatement = "Proposition 95. Let $\\textup{SU}(2)$ be endowed with the bi-invariant metric $g_{\\mathit{bi}}$. Then $$(\\textup{SU}(2), g_{\\mathit{bi}}) \\simeq (\\mathbb{S}^3, 2g_{\\textit{round}}),$$ where $g_{\\textit..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindInvariant
       , theoremSemanticCategory = SemCatInvariantPreservation
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_34_lemmamatrixtheory :: TheoremIR
theorem_34_lemmamatrixtheory =
  let span = (SourceSpan "theorem_graph.json" "LemmaMatrixTheory" "LemmaMatrixTheory" "sec-7-2-1" "Lemma 96. Let $A$ be an $n$-square complex matrix. Then $$\\textup{Tr}(AX) = 0$$ for every Hermitian matrix $X$ if and only if $A = 0$.")
      conclusion = Equals (RawTerm "unknown_term: Lemma 96. Let $A$ be an $n$-square complex matrix. Then $$\\textup{Tr}(AX" span) (RawTerm "unknown_term: 0$$ for every Hermitian matrix $X$ if and only if $A = 0$" span)
      target = LeanTarget "LemmaMatrixTheory" "theorem" span
  in TheoremIR
       { theoremId = "theorem_LemmaMatrixTheory"
       , theoremStatement = "Lemma 96. Let $A$ be an $n$-square complex matrix. Then $$\\textup{Tr}(AX) = 0$$ for every Hermitian matrix $X$ if and only if $A = 0$."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "lemma"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_35_productrulegradient :: TheoremIR
theorem_35_productrulegradient =
  let span = (SourceSpan "theorem_graph.json" "productrulegradient" "productrulegradient" "sec-7-2-1" "Lemma 98. Let $(M_1, g_1)$ and $(M_2, g_2)$ be two Riemannian manifolds and let $M_1 \\times M_2$ be the product manifold endowed with the product metric $g$. Let us define $$\\begin{align} \\hat{f}: &\\ ...")
      conclusion = SemanticGap span "Lemma 98. Let $(M_1, g_1)$ and $(M_2, g_2)$ be two Riemannian manifolds and let $M_1 \\times M_2$ be the product manifold endowed with the product metric $g$. Let us define $$\\begin{align} \\hat{f}: &\\ ..."
      target = LeanTarget "productrulegradient" "theorem" span
  in TheoremIR
       { theoremId = "theorem_productrulegradient"
       , theoremStatement = "Lemma 98. Let $(M_1, g_1)$ and $(M_2, g_2)$ be two Riemannian manifolds and let $M_1 \\times M_2$ be the product manifold endowed with the product metric $g$. Let us define $$\\begin{align} \\hat{f}: &\\ ..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "lemma"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_36_thm_113 :: TheoremIR
theorem_36_thm_113 =
  let span = (SourceSpan "theorem_graph.json" "thm-113" "thm-113" "sec-7-2-1-3" "Remark 100. Note that the proof of [99](#thm:descriptioncriticalpointsIsing){reference-type=\"ref+label\" reference=\"thm:descriptioncriticalpointsIsing\"} only relies on the magnetic field being greater ...")
      conclusion = SemanticGap span "Remark 100. Note that the proof of [99](#thm:descriptioncriticalpointsIsing){reference-type=\"ref+label\" reference=\"thm:descriptioncriticalpointsIsing\"} only relies on the magnetic field being greater ..."
      target = LeanTarget "thm_113" "theorem" span
  in TheoremIR
       { theoremId = "theorem_thm_113"
       , theoremStatement = "Remark 100. Note that the proof of [99](#thm:descriptioncriticalpointsIsing){reference-type=\"ref+label\" reference=\"thm:descriptioncriticalpointsIsing\"} only relies on the magnetic field being greater ..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindEquation
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_37_lem_distancecriticalpoints :: TheoremIR
theorem_37_lem_distancecriticalpoints =
  let span = (SourceSpan "theorem_graph.json" "lem:distancecriticalpoints" "lem:distancecriticalpoints" "sec-7-2-1-3" "Lemma 101. Let $\\tilde F$ be the unique function on $((\\mathbb{S}^2)^{\\times n^2}, \\frac{1}{2}g_{\\mathit{round}})$ such that $F = \\tilde F \\circ \\pi$. Then for any two critical points $x, y$ of $\\tild...")
      conclusion = SemanticGap span "Lemma 101. Let $\\tilde F$ be the unique function on $((\\mathbb{S}^2)^{\\times n^2}, \\frac{1}{2}g_{\\mathit{round}})$ such that $F = \\tilde F \\circ \\pi$. Then for any two critical points $x, y$ of $\\tild..."
      target = LeanTarget "lem_distancecriticalpoints" "theorem" span
  in TheoremIR
       { theoremId = "theorem_lem_distancecriticalpoints"
       , theoremStatement = "Lemma 101. Let $\\tilde F$ be the unique function on $((\\mathbb{S}^2)^{\\times n^2}, \\frac{1}{2}g_{\\mathit{round}})$ such that $F = \\tilde F \\circ \\pi$. Then for any two critical points $x, y$ of $\\tild..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "lemma"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_38_lem_escapingeigenvalueising :: TheoremIR
theorem_38_lem_escapingeigenvalueising =
  let span = (SourceSpan "theorem_graph.json" "lem:escapingeigenvalueIsing" "lem:escapingeigenvalueIsing" "sec-7-2-1-3" "Lemma 102. Let $F$ be as defined in [\\[eq:isingfunction\\]](#eq:isingfunction){reference-type=\"ref+label\" reference=\"eq:isingfunction\"}. Then $F$ has a unique minimum, a unique maximum and the rest of ...")
      conclusion = SemanticGap span "Lemma 102. Let $F$ be as defined in [\\[eq:isingfunction\\]](#eq:isingfunction){reference-type=\"ref+label\" reference=\"eq:isingfunction\"}. Then $F$ has a unique minimum, a unique maximum and the rest of ..."
      target = LeanTarget "lem_escapingeigenvalueIsing" "theorem" span
  in TheoremIR
       { theoremId = "theorem_lem_escapingeigenvalueIsing"
       , theoremStatement = "Lemma 102. Let $F$ be as defined in [\\[eq:isingfunction\\]](#eq:isingfunction){reference-type=\"ref+label\" reference=\"eq:isingfunction\"}. Then $F$ has a unique minimum, a unique maximum and the rest of ..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "lemma"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_39_lem_hessiandefpos :: TheoremIR
theorem_39_lem_hessiandefpos =
  let span = (SourceSpan "theorem_graph.json" "lem:hessiandefpos" "lem:hessiandefpos" "sec-7-2-1-3" "Proposition 103. The Hessian of $\\tilde F$ at its global minimum is definite-positive.")
      conclusion = SemanticGap span "Proposition 103. The Hessian of $\\tilde F$ at its global minimum is definite-positive"
      target = LeanTarget "lem_hessiandefpos" "theorem" span
  in TheoremIR
       { theoremId = "theorem_lem_hessiandefpos"
       , theoremStatement = "Proposition 103. The Hessian of $\\tilde F$ at its global minimum is definite-positive."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_40_thm_124 :: TheoremIR
theorem_40_thm_124 =
  let span = (SourceSpan "theorem_graph.json" "thm-124" "thm-124" "sec-7-2-2" "Corollary 107. Let $X_t$ and $\\tilde X_t$ be the Langevin diffusion processes generated by $\\operatorname{L}_F$ and $\\operatorname{L}_{\\tilde F}$, with initial uniform distribution on $\\textup{SU}(2)^...")
      conclusion = SemanticGap span "Corollary 107. Let $X_t$ and $\\tilde X_t$ be the Langevin diffusion processes generated by $\\operatorname{L}_F$ and $\\operatorname{L}_{\\tilde F}$, with initial uniform distribution on $\\textup{SU}(2)^..."
      target = LeanTarget "thm_124" "theorem" span
  in TheoremIR
       { theoremId = "theorem_thm_124"
       , theoremStatement = "Corollary 107. Let $X_t$ and $\\tilde X_t$ be the Langevin diffusion processes generated by $\\operatorname{L}_F$ and $\\operatorname{L}_{\\tilde F}$, with initial uniform distribution on $\\textup{SU}(2)^..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_41_prop_liealgebracident :: TheoremIR
theorem_41_prop_liealgebracident =
  let span = (SourceSpan "theorem_graph.json" "prop:liealgebracident" "prop:liealgebracident" "sec-9-1" "Proposition 109. For the Lie groups $\\textup{U}(n)$ and $\\textup{SU}(n)$, their associated Lie algebras $\\mathfrak{u}(n)$ and $\\mathfrak{su}(n)$ are given by the following sets: $$\\mathfrak{u}(n) = \\{...")
      conclusion = SemanticGap span "Proposition 109. For the Lie groups $\\textup{U}(n)$ and $\\textup{SU}(n)$, their associated Lie algebras $\\mathfrak{u}(n)$ and $\\mathfrak{su}(n)$ are given by the following sets: $$\\mathfrak{u}(n) = \\{..."
      target = LeanTarget "prop_liealgebracident" "theorem" span
  in TheoremIR
       { theoremId = "theorem_prop_liealgebracident"
       , theoremStatement = "Proposition 109. For the Lie groups $\\textup{U}(n)$ and $\\textup{SU}(n)$, their associated Lie algebras $\\mathfrak{u}(n)$ and $\\mathfrak{su}(n)$ are given by the following sets: $$\\mathfrak{u}(n) = \\{..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindEquation
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_42_propinvvectorfields1 :: TheoremIR
theorem_42_propinvvectorfields1 =
  let span = (SourceSpan "theorem_graph.json" "propinvvectorfields1" "propinvvectorfields1" "sec-9-1" "Proposition 111. The Lie derivative of two left-invariant (resp. right-invariant) vector fields is again left-invariant (resp. right-invariant).")
      conclusion = SemanticGap span "Proposition 111. The Lie derivative of two left-invariant (resp. right-invariant) vector fields is again left-invariant (resp. right-invariant)"
      target = LeanTarget "propinvvectorfields1" "theorem" span
  in TheoremIR
       { theoremId = "theorem_propinvvectorfields1"
       , theoremStatement = "Proposition 111. The Lie derivative of two left-invariant (resp. right-invariant) vector fields is again left-invariant (resp. right-invariant)."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindInvariant
       , theoremSemanticCategory = SemCatInvariantPreservation
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_43_propinvvectorfields2 :: TheoremIR
theorem_43_propinvvectorfields2 =
  let span = (SourceSpan "theorem_graph.json" "propinvvectorfields2" "propinvvectorfields2" "sec-9-1" "Proposition 112 ([@gallier2020differential Proposition 19.11]). Let $G$ be a linear Lie group with unit $e$, and let $u, v \\in \\mathfrak{g}$. Then $$[u^L, v^L](e) = uv - vu$$ and $$[u^R, v^R](e) = vu ...")
      conclusion = SemanticGap span "Proposition 112 ([@gallier2020differential Proposition 19.11]). Let $G$ be a linear Lie group with unit $e$, and let $u, v \\in \\mathfrak{g}$. Then $$[u^L, v^L](e) = uv - vu$$ and $$[u^R, v^R](e) = vu ..."
      target = LeanTarget "propinvvectorfields2" "theorem" span
  in TheoremIR
       { theoremId = "theorem_propinvvectorfields2"
       , theoremStatement = "Proposition 112 ([@gallier2020differential Proposition 19.11]). Let $G$ be a linear Lie group with unit $e$, and let $u, v \\in \\mathfrak{g}$. Then $$[u^L, v^L](e) = uv - vu$$ and $$[u^R, v^R](e) = vu ..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindEquation
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_44_metrica :: TheoremIR
theorem_44_metrica =
  let span = (SourceSpan "theorem_graph.json" "metrica" "metrica" "sec-9-1" "Remark 114. We can define a bi-invariant metric on $G = \\textup{U}(n)$ or $\\textup{SU}(n)$ as follows; for every $X, Y \\in \\mathfrak{g}$, let $$g(X, Y) = \\Tr(Y^\\dagger X).$$ Now, we can extend the met...")
      conclusion = SemanticGap span "Remark 114. We can define a bi-invariant metric on $G = \\textup{U}(n)$ or $\\textup{SU}(n)$ as follows; for every $X, Y \\in \\mathfrak{g}$, let $$g(X, Y) = \\Tr(Y^\\dagger X).$$ Now, we can extend the met..."
      target = LeanTarget "metrica" "theorem" span
  in TheoremIR
       { theoremId = "theorem_metrica"
       , theoremStatement = "Remark 114. We can define a bi-invariant metric on $G = \\textup{U}(n)$ or $\\textup{SU}(n)$ as follows; for every $X, Y \\in \\mathfrak{g}$, let $$g(X, Y) = \\Tr(Y^\\dagger X).$$ Now, we can extend the met..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindInvariant
       , theoremSemanticCategory = SemCatInvariantPreservation
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_45_thm_132 :: TheoremIR
theorem_45_thm_132 =
  let span = (SourceSpan "theorem_graph.json" "thm-132" "thm-132" "sec-9-1" "Proposition 115. Consider $G = \\textup{SU}(n)$ or $\\textup{U}(n)$ endowed with the bi-invariant metric shown in [114](#metrica){reference-type=\"ref+label\" reference=\"metrica\"}. For every $p \\in G$, th...")
      conclusion = SemanticGap span "Proposition 115. Consider $G = \\textup{SU}(n)$ or $\\textup{U}(n)$ endowed with the bi-invariant metric shown in [114](#metrica){reference-type=\"ref+label\" reference=\"metrica\"}. For every $p \\in G$, th..."
      target = LeanTarget "thm_132" "theorem" span
  in TheoremIR
       { theoremId = "theorem_thm_132"
       , theoremStatement = "Proposition 115. Consider $G = \\textup{SU}(n)$ or $\\textup{U}(n)$ endowed with the bi-invariant metric shown in [114](#metrica){reference-type=\"ref+label\" reference=\"metrica\"}. For every $p \\in G$, th..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindInvariant
       , theoremSemanticCategory = SemCatInvariantPreservation
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_46_curvliegroups :: TheoremIR
theorem_46_curvliegroups =
  let span = (SourceSpan "theorem_graph.json" "curvLieGroups" "curvLieGroups" "sec-9-1-1" "Proposition 118 ([@gallier2020differential Proposition 21.19]). For any Lie group $G$ equipped with a bi-invariant metric $g$, the following hold: 1. For all pairs of orthonormal vectors $u, v \\in \\ma...")
      conclusion = SemanticGap span "Proposition 118 ([@gallier2020differential Proposition 21.19]). For any Lie group $G$ equipped with a bi-invariant metric $g$, the following hold: 1. For all pairs of orthonormal vectors $u, v \\in \\ma..."
      target = LeanTarget "curvLieGroups" "theorem" span
  in TheoremIR
       { theoremId = "theorem_curvLieGroups"
       , theoremStatement = "Proposition 118 ([@gallier2020differential Proposition 21.19]). For any Lie group $G$ equipped with a bi-invariant metric $g$, the following hold: 1. For all pairs of orthonormal vectors $u, v \\in \\ma..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindInvariant
       , theoremSemanticCategory = SemCatInvariantPreservation
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_47_killingliegroups :: TheoremIR
theorem_47_killingliegroups =
  let span = (SourceSpan "theorem_graph.json" "KillingLieGroups" "KillingLieGroups" "sec-9-1-1" "Remark 119 ([@gallier2020differential Remark of Page 648]). The Killing form of $\\textup{U}(n)$ is $$\\mathfrak{B}(X,Y) = 2n\\Tr(XY) - 2\\Tr(X) \\Tr(Y), \\quad X, Y \\in \\mathfrak{u}(n).$$ Furthermore, the ...")
      conclusion = SemanticGap span "Remark 119 ([@gallier2020differential Remark of Page 648]). The Killing form of $\\textup{U}(n)$ is $$\\mathfrak{B}(X,Y) = 2n\\Tr(XY) - 2\\Tr(X) \\Tr(Y), \\quad X, Y \\in \\mathfrak{u}(n).$$ Furthermore, the ..."
      target = LeanTarget "KillingLieGroups" "theorem" span
  in TheoremIR
       { theoremId = "theorem_KillingLieGroups"
       , theoremStatement = "Remark 119 ([@gallier2020differential Remark of Page 648]). The Killing form of $\\textup{U}(n)$ is $$\\mathfrak{B}(X,Y) = 2n\\Tr(XY) - 2\\Tr(X) \\Tr(Y), \\quad X, Y \\in \\mathfrak{u}(n).$$ Furthermore, the ..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindEquation
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_48_lemacurvaturaun :: TheoremIR
theorem_48_lemacurvaturaun =
  let span = (SourceSpan "theorem_graph.json" "LemaCurvaturaUn" "LemaCurvaturaUn" "sec-9-1-1" "Proposition 120. Let $\\textup{U}(n)$ be endowed with the bi-invariant metric $g$ from [114](#metrica){reference-type=\"ref+label\" reference=\"metrica\"}. Then $$\\textup{Ric}_{g} \\geq 0,\\quad \\textup{\\tex...")
      conclusion = SemanticGap span "Proposition 120. Let $\\textup{U}(n)$ be endowed with the bi-invariant metric $g$ from [114](#metrica){reference-type=\"ref+label\" reference=\"metrica\"}. Then $$\\textup{Ric}_{g} \\geq 0,\\quad \\textup{\\tex..."
      target = LeanTarget "LemaCurvaturaUn" "theorem" span
  in TheoremIR
       { theoremId = "theorem_LemaCurvaturaUn"
       , theoremStatement = "Proposition 120. Let $\\textup{U}(n)$ be endowed with the bi-invariant metric $g$ from [114](#metrica){reference-type=\"ref+label\" reference=\"metrica\"}. Then $$\\textup{Ric}_{g} \\geq 0,\\quad \\textup{\\tex..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindInvariant
       , theoremSemanticCategory = SemCatInvariantPreservation
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_49_lemacurvaturasun :: TheoremIR
theorem_49_lemacurvaturasun =
  let span = (SourceSpan "theorem_graph.json" "LemaCurvaturaSUn" "LemaCurvaturaSUn" "sec-9-1-1" "Proposition 121. Consider $\\textup{SU}(n)$ endowed with the bi-invariant metric $g$ from [114](#metrica){reference-type=\"ref+label\" reference=\"metrica\"}. Then $$\\textup{Ric}_{g} = \\frac{n}{2}g,\\quad \\...")
      conclusion = SemanticGap span "Proposition 121. Consider $\\textup{SU}(n)$ endowed with the bi-invariant metric $g$ from [114](#metrica){reference-type=\"ref+label\" reference=\"metrica\"}. Then $$\\textup{Ric}_{g} = \\frac{n}{2}g,\\quad \\..."
      target = LeanTarget "LemaCurvaturaSUn" "theorem" span
  in TheoremIR
       { theoremId = "theorem_LemaCurvaturaSUn"
       , theoremStatement = "Proposition 121. Consider $\\textup{SU}(n)$ endowed with the bi-invariant metric $g$ from [114](#metrica){reference-type=\"ref+label\" reference=\"metrica\"}. Then $$\\textup{Ric}_{g} = \\frac{n}{2}g,\\quad \\..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindInvariant
       , theoremSemanticCategory = SemCatInvariantPreservation
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_50_prop_boundriemanntensorliegroup :: TheoremIR
theorem_50_prop_boundriemanntensorliegroup =
  let span = (SourceSpan "theorem_graph.json" "prop:boundRiemanntensorLiegroup" "prop:boundRiemanntensorLiegroup" "sec-9-1-1" "Proposition 122. Let $G = \\textup{SU}(n)$ or $\\textup{U}(n)$ be endowed with the bi-invariant metric $g$. Then, for every $x \\in G$, considering normal coordinates centered at $x$ it follows that $$|R...")
      conclusion = SemanticGap span "Proposition 122. Let $G = \\textup{SU}(n)$ or $\\textup{U}(n)$ be endowed with the bi-invariant metric $g$. Then, for every $x \\in G$, considering normal coordinates centered at $x$ it follows that $$|R..."
      target = LeanTarget "prop_boundRiemanntensorLiegroup" "theorem" span
  in TheoremIR
       { theoremId = "theorem_prop_boundRiemanntensorLiegroup"
       , theoremStatement = "Proposition 122. Let $G = \\textup{SU}(n)$ or $\\textup{U}(n)$ be endowed with the bi-invariant metric $g$. Then, for every $x \\in G$, considering normal coordinates centered at $x$ it follows that $$|R..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindInvariant
       , theoremSemanticCategory = SemCatInvariantPreservation
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_51_productmanifoldsmetric :: TheoremIR
theorem_51_productmanifoldsmetric =
  let span = (SourceSpan "theorem_graph.json" "productmanifoldsmetric" "productmanifoldsmetric" "sec-9-2" "Lemma 123. Let $(M, g)$ and $(N, h)$ be two Riemannian manifolds and let $M \\times N$ be the product manifold endowed with the product metric $g \\oplus h$. Let $X, Y \\in \\mathfrak{X}(M\\times N)$ be tw...")
      conclusion = SemanticGap span "Lemma 123. Let $(M, g)$ and $(N, h)$ be two Riemannian manifolds and let $M \\times N$ be the product manifold endowed with the product metric $g \\oplus h$. Let $X, Y \\in \\mathfrak{X}(M\\times N)$ be tw..."
      target = LeanTarget "productmanifoldsmetric" "theorem" span
  in TheoremIR
       { theoremId = "theorem_productmanifoldsmetric"
       , theoremStatement = "Lemma 123. Let $(M, g)$ and $(N, h)$ be two Riemannian manifolds and let $M \\times N$ be the product manifold endowed with the product metric $g \\oplus h$. Let $X, Y \\in \\mathfrak{X}(M\\times N)$ be tw..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "lemma"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_52_riemannprod :: TheoremIR
theorem_52_riemannprod =
  let span = (SourceSpan "theorem_graph.json" "RiemannProd" "RiemannProd" "sec-9-2" "Lemma 124. Let $(M, g)$ and $(N, h)$ be two Riemannian manifolds and let $M \\times N$ be the product manifold endowed with the product metric. Then for every point $(x, y) \\in M \\times N$ and every fo...")
      conclusion = SemanticGap span "Lemma 124. Let $(M, g)$ and $(N, h)$ be two Riemannian manifolds and let $M \\times N$ be the product manifold endowed with the product metric. Then for every point $(x, y) \\in M \\times N$ and every fo..."
      target = LeanTarget "RiemannProd" "theorem" span
  in TheoremIR
       { theoremId = "theorem_RiemannProd"
       , theoremStatement = "Lemma 124. Let $(M, g)$ and $(N, h)$ be two Riemannian manifolds and let $M \\times N$ be the product manifold endowed with the product metric. Then for every point $(x, y) \\in M \\times N$ and every fo..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "lemma"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_53_curvproduct :: TheoremIR
theorem_53_curvproduct =
  let span = (SourceSpan "theorem_graph.json" "curvProduct" "curvProduct" "sec-9-2" "Proposition 125 (Curvature of the product). Let $(M, g)$, $(N, h)$ be two Riemannian manifolds of dimension $d_M$ and $d_N$, respectively, verifying $$K_g \\leq D_1,\\quad K_h \\leq D_2,$$ $$\\textup{Ric}...")
      conclusion = SemanticGap span "Proposition 125 (Curvature of the product). Let $(M, g)$, $(N, h)$ be two Riemannian manifolds of dimension $d_M$ and $d_N$, respectively, verifying $$K_g \\leq D_1,\\quad K_h \\leq D_2,$$ $$\\textup{Ric}..."
      target = LeanTarget "curvProduct" "theorem" span
  in TheoremIR
       { theoremId = "theorem_curvProduct"
       , theoremStatement = "Proposition 125 (Curvature of the product). Let $(M, g)$, $(N, h)$ be two Riemannian manifolds of dimension $d_M$ and $d_N$, respectively, verifying $$K_g \\leq D_1,\\quad K_h \\leq D_2,$$ $$\\textup{Ric}..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_54_producteinstein :: TheoremIR
theorem_54_producteinstein =
  let span = (SourceSpan "theorem_graph.json" "productEinstein" "productEinstein" "sec-9-2" "Proposition 127 ([@besse2007einstein Proposition 1.99]). The product of two Riemannian manifolds which are Einstein with the same constant $\\lambda$ is again Einstein with the same constant when endow...")
      conclusion = SemanticGap span "Proposition 127 ([@besse2007einstein Proposition 1.99]). The product of two Riemannian manifolds which are Einstein with the same constant $\\lambda$ is again Einstein with the same constant when endow..."
      target = LeanTarget "productEinstein" "theorem" span
  in TheoremIR
       { theoremId = "theorem_productEinstein"
       , theoremStatement = "Proposition 127 ([@besse2007einstein Proposition 1.99]). The product of two Riemannian manifolds which are Einstein with the same constant $\\lambda$ is again Einstein with the same constant when endow..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_55_def_normalcoordinates :: TheoremIR
theorem_55_def_normalcoordinates =
  let span = (SourceSpan "theorem_graph.json" "def:normalcoordinates" "def:normalcoordinates" "sec-9-3" "Remark 129 (Normal coordinates). On any connected neighborhood of $0 \\in T_xM$ on which $\\exp_x$ is a diffeomorphism onto its image, the exponential map induces local coordinates in a natural way. The...")
      conclusion = SemanticGap span "Remark 129 (Normal coordinates). On any connected neighborhood of $0 \\in T_xM$ on which $\\exp_x$ is a diffeomorphism onto its image, the exponential map induces local coordinates in a natural way. The..."
      target = LeanTarget "def_normalcoordinates" "theorem" span
  in TheoremIR
       { theoremId = "theorem_def_normalcoordinates"
       , theoremStatement = "Remark 129 (Normal coordinates). On any connected neighborhood of $0 \\in T_xM$ on which $\\exp_x$ is a diffeomorphism onto its image, the exponential map induces local coordinates in a natural way. The..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_56_lemmahorizontalgeodesics :: TheoremIR
theorem_56_lemmahorizontalgeodesics =
  let span = (SourceSpan "theorem_graph.json" "LemmaHorizontalGeodesics" "LemmaHorizontalGeodesics" "sec-9-4" "Proposition 140 ([@oneil1967submersions Corollary 2]). Let $\\pi: (M, g) \\rightarrow (B, h)$ be a Riemannian submersion. If $\\gamma$ is a geodesic on $M$ that is horizontal at some point $\\gamma(t_0)$ ...")
      conclusion = SemanticGap span "Proposition 140 ([@oneil1967submersions Corollary 2]). Let $\\pi: (M, g) \\rightarrow (B, h)$ be a Riemannian submersion. If $\\gamma$ is a geodesic on $M$ that is horizontal at some point $\\gamma(t_0)$ ..."
      target = LeanTarget "LemmaHorizontalGeodesics" "theorem" span
  in TheoremIR
       { theoremId = "theorem_LemmaHorizontalGeodesics"
       , theoremStatement = "Proposition 140 ([@oneil1967submersions Corollary 2]). Let $\\pi: (M, g) \\rightarrow (B, h)$ be a Riemannian submersion. If $\\gamma$ is a geodesic on $M$ that is horizontal at some point $\\gamma(t_0)$ ..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_57_prop_submersionsubmetry :: TheoremIR
theorem_57_prop_submersionsubmetry =
  let span = (SourceSpan "theorem_graph.json" "prop:submersionsubmetry" "prop:submersionsubmetry" "sec-9-4" "Proposition 141. Let $(M, g)$ be a complete Riemannian manifold, let $x \\in M$ and let $\\pi: (M, g) \\to (B, h)$ be a Riemannian submersion, then $$\\pi(\\mathcal{B}(r,x)) = \\mathcal{B}(r,\\pi(x)),$$ for ...")
      conclusion = SemanticGap span "Proposition 141. Let $(M, g)$ be a complete Riemannian manifold, let $x \\in M$ and let $\\pi: (M, g) \\to (B, h)$ be a Riemannian submersion, then $$\\pi(\\mathcal{B}(r,x)) = \\mathcal{B}(r,\\pi(x)),$$ for ..."
      target = LeanTarget "prop_submersionsubmetry" "theorem" span
  in TheoremIR
       { theoremId = "theorem_prop_submersionsubmetry"
       , theoremStatement = "Proposition 141. Let $(M, g)$ be a complete Riemannian manifold, let $x \\in M$ and let $\\pi: (M, g) \\to (B, h)$ be a Riemannian submersion, then $$\\pi(\\mathcal{B}(r,x)) = \\mathcal{B}(r,\\pi(x)),$$ for ..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindEquation
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_58_existenceriemanniansubmersionmetrics :: TheoremIR
theorem_58_existenceriemanniansubmersionmetrics =
  let span = (SourceSpan "theorem_graph.json" "existenceRiemannianSubmersionMetrics" "existenceRiemannianSubmersionMetrics" "sec-9-4" "Proposition 147 ([@lee2018introductionRiemannian Corollary 2.29]). Suppose $(M, g)$ is a Riemannian manifold, and let $G$ be a Lie group acting smoothly, freely, properly and isometrically on $M$. The...")
      conclusion = SemanticGap span "Proposition 147 ([@lee2018introductionRiemannian Corollary 2.29]). Suppose $(M, g)$ is a Riemannian manifold, and let $G$ be a Lie group acting smoothly, freely, properly and isometrically on $M$. The..."
      target = LeanTarget "existenceRiemannianSubmersionMetrics" "theorem" span
  in TheoremIR
       { theoremId = "theorem_existenceRiemannianSubmersionMetrics"
       , theoremStatement = "Proposition 147 ([@lee2018introductionRiemannian Corollary 2.29]). Suppose $(M, g)$ is a Riemannian manifold, and let $G$ be a Lie group acting smoothly, freely, properly and isometrically on $M$. The..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_59_thm_171 :: TheoremIR
theorem_59_thm_171 =
  let span = (SourceSpan "theorem_graph.json" "thm-171" "thm-171" "sec-9-4" "Proposition 150 ([@cohen1998topology Theorem 1.3]). Let $M$ be a manifold and let $G$ be a compact Lie group acting freely and smoothly on $M$. Then $$\\pi: M \\to M/G$$ is a principal $G$-bundle.")
      conclusion = SemanticGap span "Proposition 150 ([@cohen1998topology Theorem 1.3]). Let $M$ be a manifold and let $G$ be a compact Lie group acting freely and smoothly on $M$. Then $$\\pi: M \\to M/G$$ is a principal $G$-bundle"
      target = LeanTarget "thm_171" "theorem" span
  in TheoremIR
       { theoremId = "theorem_thm_171"
       , theoremStatement = "Proposition 150 ([@cohen1998topology Theorem 1.3]). Let $M$ be a manifold and let $G$ be a compact Lie group acting freely and smoothly on $M$. Then $$\\pi: M \\to M/G$$ is a principal $G$-bundle."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_60_geodesicstotallygeodesic :: TheoremIR
theorem_60_geodesicstotallygeodesic =
  let span = (SourceSpan "theorem_graph.json" "geodesicstotallygeodesic" "geodesicstotallygeodesic" "sec-9-4" "Proposition 152 ([@lee2018introductionRiemannian Proposition 8.12]). Let $(\\tilde{M}, \\tilde{g})$ be an embedded Riemannian submanifold of a Riemannian manifold $(M, g)$. If $\\tilde{M}$ is totally geo...")
      conclusion = SemanticGap span "Proposition 152 ([@lee2018introductionRiemannian Proposition 8.12]). Let $(\\tilde{M}, \\tilde{g})$ be an embedded Riemannian submanifold of a Riemannian manifold $(M, g)$. If $\\tilde{M}$ is totally geo..."
      target = LeanTarget "geodesicstotallygeodesic" "theorem" span
  in TheoremIR
       { theoremId = "theorem_geodesicstotallygeodesic"
       , theoremStatement = "Proposition 152 ([@lee2018introductionRiemannian Proposition 8.12]). Let $(\\tilde{M}, \\tilde{g})$ be an embedded Riemannian submanifold of a Riemannian manifold $(M, g)$. If $\\tilde{M}$ is totally geo..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_61_curvaturasubmersion :: TheoremIR
theorem_61_curvaturasubmersion =
  let span = (SourceSpan "theorem_graph.json" "CurvaturaSubmersion" "CurvaturaSubmersion" "sec-9-4-1" "Lemma 154 ([@oneill1966fundamental Corollary 1]). Let $\\pi : (M, g) \\rightarrow (B, h)$ be a Riemannian submersion. Given two horizontal orthonormal vectors $X, Y \\in H_xM$ and two vertical orthonorma...")
      conclusion = SemanticGap span "Lemma 154 ([@oneill1966fundamental Corollary 1]). Let $\\pi : (M, g) \\rightarrow (B, h)$ be a Riemannian submersion. Given two horizontal orthonormal vectors $X, Y \\in H_xM$ and two vertical orthonorma..."
      target = LeanTarget "CurvaturaSubmersion" "theorem" span
  in TheoremIR
       { theoremId = "theorem_CurvaturaSubmersion"
       , theoremStatement = "Lemma 154 ([@oneill1966fundamental Corollary 1]). Let $\\pi : (M, g) \\rightarrow (B, h)$ be a Riemannian submersion. Given two horizontal orthonormal vectors $X, Y \\in H_xM$ and two vertical orthonorma..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "lemma"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_62_remarkcurvaturasubmersion :: TheoremIR
theorem_62_remarkcurvaturasubmersion =
  let span = (SourceSpan "theorem_graph.json" "remarkcurvaturasubmersion" "remarkcurvaturasubmersion" "sec-9-4-1" "Remark 155. The expressions shown in [154](#CurvaturaSubmersion){reference-type=\"ref+label\" reference=\"CurvaturaSubmersion\"} are well-defined, as for any two horizontal vector fields $X, Y \\in \\mathfr...")
      conclusion = SemanticGap span "Remark 155. The expressions shown in [154](#CurvaturaSubmersion){reference-type=\"ref+label\" reference=\"CurvaturaSubmersion\"} are well-defined, as for any two horizontal vector fields $X, Y \\in \\mathfr..."
      target = LeanTarget "remarkcurvaturasubmersion" "theorem" span
  in TheoremIR
       { theoremId = "theorem_remarkcurvaturasubmersion"
       , theoremStatement = "Remark 155. The expressions shown in [154](#CurvaturaSubmersion){reference-type=\"ref+label\" reference=\"CurvaturaSubmersion\"} are well-defined, as for any two horizontal vector fields $X, Y \\in \\mathfr..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindEquation
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_63_vanishingt :: TheoremIR
theorem_63_vanishingt =
  let span = (SourceSpan "theorem_graph.json" "vanishingT" "vanishingT" "sec-9-4-1" "Lemma 156. Let $\\pi: (M, g) \\to (B, h)$ be a Riemannian submersion. $\\pi$ has totally geodesic fibers if and only if the O'Neill tensor $T$ from [153](#defOneilTensors){reference-type=\"ref+label\" refe...")
      conclusion = SemanticGap span "Lemma 156. Let $\\pi: (M, g) \\to (B, h)$ be a Riemannian submersion. $\\pi$ has totally geodesic fibers if and only if the O'Neill tensor $T$ from [153](#defOneilTensors){reference-type=\"ref+label\" refe..."
      target = LeanTarget "vanishingT" "theorem" span
  in TheoremIR
       { theoremId = "theorem_vanishingT"
       , theoremStatement = "Lemma 156. Let $\\pi: (M, g) \\to (B, h)$ be a Riemannian submersion. $\\pi$ has totally geodesic fibers if and only if the O'Neill tensor $T$ from [153](#defOneilTensors){reference-type=\"ref+label\" refe..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "lemma"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_64_prop_inducedtotgeodfibers :: TheoremIR
theorem_64_prop_inducedtotgeodfibers =
  let span = (SourceSpan "theorem_graph.json" "prop:inducedtotgeodfibers" "prop:inducedtotgeodfibers" "sec-9-4-1" "Proposition 157. Let $(M_1, g_1)$, $(M_2, g_2)$ and $(M_3, g_3)$ be three Riemannian manifolds, and let $\\pi_1, \\pi_2$ and $\\pi_3$ be three Riemannian submersions, $$\\begin{align} \\pi_1 : (M_1, g_1) \\...")
      conclusion = SemanticGap span "Proposition 157. Let $(M_1, g_1)$, $(M_2, g_2)$ and $(M_3, g_3)$ be three Riemannian manifolds, and let $\\pi_1, \\pi_2$ and $\\pi_3$ be three Riemannian submersions, $$\\begin{align} \\pi_1 : (M_1, g_1) \\..."
      target = LeanTarget "prop_inducedtotgeodfibers" "theorem" span
  in TheoremIR
       { theoremId = "theorem_prop_inducedtotgeodfibers"
       , theoremStatement = "Proposition 157. Let $(M_1, g_1)$, $(M_2, g_2)$ and $(M_3, g_3)$ be three Riemannian manifolds, and let $\\pi_1, \\pi_2$ and $\\pi_3$ be three Riemannian submersions, $$\\begin{align} \\pi_1 : (M_1, g_1) \\..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_65_horizontalleftinvariant :: TheoremIR
theorem_65_horizontalleftinvariant =
  let span = (SourceSpan "theorem_graph.json" "horizontalleftinvariant" "horizontalleftinvariant" "sec-9-4-2" "Proposition 159. Let $G$ be a Lie group endowed with a bi-invariant metric and let $H$ be a closed subgroup of $G$. Consider the action of $H$ on $G$ from the right: $$\\begin{align} H \\times G \\to G\\\\...")
      conclusion = SemanticGap span "Proposition 159. Let $G$ be a Lie group endowed with a bi-invariant metric and let $H$ be a closed subgroup of $G$. Consider the action of $H$ on $G$ from the right: $$\\begin{align} H \\times G \\to G\\\\..."
      target = LeanTarget "horizontalleftinvariant" "theorem" span
  in TheoremIR
       { theoremId = "theorem_horizontalleftinvariant"
       , theoremStatement = "Proposition 159. Let $G$ be a Lie group endowed with a bi-invariant metric and let $H$ be a closed subgroup of $G$. Consider the action of $H$ on $G$ from the right: $$\\begin{align} H \\times G \\to G\\\\..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindInvariant
       , theoremSemanticCategory = SemCatInvariantPreservation
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_66_curvstiefel :: TheoremIR
theorem_66_curvstiefel =
  let span = (SourceSpan "theorem_graph.json" "curvStiefel" "curvStiefel" "sec-9-4-2" "Proposition 160. Let $\\textup{U}(n)$ be endowed with its bi-invariant metric $g$ (cf. [114](#metrica){reference-type=\"ref+label\" reference=\"metrica\"}). Let $k < n$ and consider the induced metric $h$ ...")
      conclusion = SemanticGap span "Proposition 160. Let $\\textup{U}(n)$ be endowed with its bi-invariant metric $g$ (cf. [114](#metrica){reference-type=\"ref+label\" reference=\"metrica\"}). Let $k < n$ and consider the induced metric $h$ ..."
      target = LeanTarget "curvStiefel" "theorem" span
  in TheoremIR
       { theoremId = "theorem_curvStiefel"
       , theoremStatement = "Proposition 160. Let $\\textup{U}(n)$ be endowed with its bi-invariant metric $g$ (cf. [114](#metrica){reference-type=\"ref+label\" reference=\"metrica\"}). Let $k < n$ and consider the induced metric $h$ ..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindInvariant
       , theoremSemanticCategory = SemCatInvariantPreservation
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_67_prop_curvgrassmann :: TheoremIR
theorem_67_prop_curvgrassmann =
  let span = (SourceSpan "theorem_graph.json" "prop:curvGrassmann" "prop:curvGrassmann" "sec-9-4-3" "Proposition 162. Let $\\textup{U}(n)$ be endowed with its bi-invariant metric $g$ (cf. [114](#metrica){reference-type=\"ref+label\" reference=\"metrica\"}). Consider the induced metric $h$ on $\\textup{Gr}_...")
      conclusion = SemanticGap span "Proposition 162. Let $\\textup{U}(n)$ be endowed with its bi-invariant metric $g$ (cf. [114](#metrica){reference-type=\"ref+label\" reference=\"metrica\"}). Consider the induced metric $h$ on $\\textup{Gr}_..."
      target = LeanTarget "prop_curvGrassmann" "theorem" span
  in TheoremIR
       { theoremId = "theorem_prop_curvGrassmann"
       , theoremStatement = "Proposition 162. Let $\\textup{U}(n)$ be endowed with its bi-invariant metric $g$ (cf. [114](#metrica){reference-type=\"ref+label\" reference=\"metrica\"}). Consider the induced metric $h$ on $\\textup{Gr}_..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindInvariant
       , theoremSemanticCategory = SemCatInvariantPreservation
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_68_prop_gradientprojectedfunction :: TheoremIR
theorem_68_prop_gradientprojectedfunction =
  let span = (SourceSpan "theorem_graph.json" "prop:gradientprojectedfunction" "prop:gradientprojectedfunction" "sec-9-5" "Proposition 165 ([@boumal2022intromanifolds Proposition 9.39]). Let $\\pi: (M, g) \\to (B, h)$ be a surjective Riemannian submersion. Let $\\tilde f \\in C^1(B)$, and let $f : M \\to \\mathbb{R}$ be the uni...")
      conclusion = SemanticGap span "Proposition 165 ([@boumal2022intromanifolds Proposition 9.39]). Let $\\pi: (M, g) \\to (B, h)$ be a surjective Riemannian submersion. Let $\\tilde f \\in C^1(B)$, and let $f : M \\to \\mathbb{R}$ be the uni..."
      target = LeanTarget "prop_gradientprojectedfunction" "theorem" span
  in TheoremIR
       { theoremId = "theorem_prop_gradientprojectedfunction"
       , theoremStatement = "Proposition 165 ([@boumal2022intromanifolds Proposition 9.39]). Let $\\pi: (M, g) \\to (B, h)$ be a surjective Riemannian submersion. Let $\\tilde f \\in C^1(B)$, and let $f : M \\to \\mathbb{R}$ be the uni..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_69_thm_191 :: TheoremIR
theorem_69_thm_191 =
  let span = (SourceSpan "theorem_graph.json" "thm-191" "thm-191" "sec-9-5" "Remark 166. Since $\\pi$ preserves the norm of horizontal vectors, it holds that $$|\\textup{grad}_g\\, f(x)|_g = |\\textup{grad}_{h}\\, \\tilde f(\\pi(x))|_{h},$$ for every $x \\in M$.")
      conclusion = Equals (RawTerm "unknown_term: Remark 166. Since $\\pi$ preserves the norm of horizontal vectors, it holds that $$|\\textup{grad}_g\\, f(x)|_g" span) (RawTerm "unknown_term: |\\textup{grad}_{h}\\, \\tilde f(\\pi(x))|_{h},$$ for every $x \\in M$" span)
      target = LeanTarget "thm_191" "theorem" span
  in TheoremIR
       { theoremId = "theorem_thm_191"
       , theoremStatement = "Remark 166. Since $\\pi$ preserves the norm of horizontal vectors, it holds that $$|\\textup{grad}_g\\, f(x)|_g = |\\textup{grad}_{h}\\, \\tilde f(\\pi(x))|_{h},$$ for every $x \\in M$."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindEquation
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_70_prop_projectedhessian :: TheoremIR
theorem_70_prop_projectedhessian =
  let span = (SourceSpan "theorem_graph.json" "prop:projectedHessian" "prop:projectedHessian" "sec-9-5" "Proposition 168 ([@boumal2022intromanifolds Proposition 9.45]). Let $(M, g)$ and $(B, h)$ be two Riemannian manifolds. Let $\\pi: (M, g) \\to (B, h)$ be a surjective Riemannian submersion. Let $\\tilde f...")
      conclusion = SemanticGap span "Proposition 168 ([@boumal2022intromanifolds Proposition 9.45]). Let $(M, g)$ and $(B, h)$ be two Riemannian manifolds. Let $\\pi: (M, g) \\to (B, h)$ be a surjective Riemannian submersion. Let $\\tilde f..."
      target = LeanTarget "prop_projectedHessian" "theorem" span
  in TheoremIR
       { theoremId = "theorem_prop_projectedHessian"
       , theoremStatement = "Proposition 168 ([@boumal2022intromanifolds Proposition 9.45]). Let $(M, g)$ and $(B, h)$ be two Riemannian manifolds. Let $\\pi: (M, g) \\to (B, h)$ be a surjective Riemannian submersion. Let $\\tilde f..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_71_prop_kernelofhessian :: TheoremIR
theorem_71_prop_kernelofhessian =
  let span = (SourceSpan "theorem_graph.json" "prop:kernelofhessian" "prop:kernelofhessian" "sec-9-5" "Proposition 169 ([@boumal2022intromanifolds Lemma 9.41]). Let $\\pi: (M, g) \\to (B, h)$ be a surjective Riemannian submersion. If $x \\in M$ is a critical point of a function $f \\in C^2(M)$ which is con...")
      conclusion = SemanticGap span "Proposition 169 ([@boumal2022intromanifolds Lemma 9.41]). Let $\\pi: (M, g) \\to (B, h)$ be a surjective Riemannian submersion. If $x \\in M$ is a critical point of a function $f \\in C^2(M)$ which is con..."
      target = LeanTarget "prop_kernelofhessian" "theorem" span
  in TheoremIR
       { theoremId = "theorem_prop_kernelofhessian"
       , theoremStatement = "Proposition 169 ([@boumal2022intromanifolds Lemma 9.41]). Let $\\pi: (M, g) \\to (B, h)$ be a surjective Riemannian submersion. If $x \\in M$ is a critical point of a function $f \\in C^2(M)$ which is con..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "lemma"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_72_prop_equalityhessians :: TheoremIR
theorem_72_prop_equalityhessians =
  let span = (SourceSpan "theorem_graph.json" "prop:equalityHessians" "prop:equalityHessians" "sec-9-5" "Proposition 170. Let $\\pi: (M, g) \\to (B, h)$ be a surjective Riemannian submersion. Let $\\tilde f \\in C^2(B)$, and let $f: M \\to \\mathbb{R}$ be such that $f = \\tilde f \\circ \\pi$. Let $x \\in M$ be a ...")
      conclusion = SemanticGap span "Proposition 170. Let $\\pi: (M, g) \\to (B, h)$ be a surjective Riemannian submersion. Let $\\tilde f \\in C^2(B)$, and let $f: M \\to \\mathbb{R}$ be such that $f = \\tilde f \\circ \\pi$. Let $x \\in M$ be a ..."
      target = LeanTarget "prop_equalityHessians" "theorem" span
  in TheoremIR
       { theoremId = "theorem_prop_equalityHessians"
       , theoremStatement = "Proposition 170. Let $\\pi: (M, g) \\to (B, h)$ be a surjective Riemannian submersion. Let $\\tilde f \\in C^2(B)$, and let $f: M \\to \\mathbb{R}$ be such that $f = \\tilde f \\circ \\pi$. Let $x \\in M$ be a ..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindEquation
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_73_prop_laplacianriemanniansubmersion :: TheoremIR
theorem_73_prop_laplacianriemanniansubmersion =
  let span = (SourceSpan "theorem_graph.json" "prop:laplacianriemanniansubmersion" "prop:laplacianriemanniansubmersion" "sec-9-5" "Proposition 172. Let $\\pi: (M, g) \\to (B, h)$ be a surjective Riemannian submersion with totally geodesic fibers. Let $\\tilde f \\in C^2(B)$, and let $f = \\tilde f \\circ \\pi$. Then for every $x \\in M$ ...")
      conclusion = SemanticGap span "Proposition 172. Let $\\pi: (M, g) \\to (B, h)$ be a surjective Riemannian submersion with totally geodesic fibers. Let $\\tilde f \\in C^2(B)$, and let $f = \\tilde f \\circ \\pi$. Then for every $x \\in M$ ..."
      target = LeanTarget "prop_laplacianriemanniansubmersion" "theorem" span
  in TheoremIR
       { theoremId = "theorem_prop_laplacianriemanniansubmersion"
       , theoremStatement = "Proposition 172. Let $\\pi: (M, g) \\to (B, h)$ be a surjective Riemannian submersion with totally geodesic fibers. Let $\\tilde f \\in C^2(B)$, and let $f = \\tilde f \\circ \\pi$. Then for every $x \\in M$ ..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindEquation
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_74_def_paralleltransport :: TheoremIR
theorem_74_def_paralleltransport =
  let span = (SourceSpan "theorem_graph.json" "def:paralleltransport" "def:paralleltransport" "sec-9-5" "Remark 173 (parallel transport). Given some curve $\\gamma$ in $M$ and two points $\\gamma(t_1), \\gamma(t_2)$ along the curve, the [parallel transport]{.upright} along $\\gamma$ is a vector space isomorp...")
      conclusion = SemanticGap span "Remark 173 (parallel transport). Given some curve $\\gamma$ in $M$ and two points $\\gamma(t_1), \\gamma(t_2)$ along the curve, the [parallel transport]{.upright} along $\\gamma$ is a vector space isomorp..."
      target = LeanTarget "def_paralleltransport" "theorem" span
  in TheoremIR
       { theoremId = "theorem_def_paralleltransport"
       , theoremStatement = "Remark 173 (parallel transport). Given some curve $\\gamma$ in $M$ and two points $\\gamma(t_1), \\gamma(t_2)$ along the curve, the [parallel transport]{.upright} along $\\gamma$ is a vector space isomorp..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_75_lem_paralleltransportandrs :: TheoremIR
theorem_75_lem_paralleltransportandrs =
  let span = (SourceSpan "theorem_graph.json" "lem:paralleltransportandRS" "lem:paralleltransportandRS" "sec-9-5" "Lemma 175 ([@gallier2020differential Proposition 18.3]). Let $\\pi:(M, g) \\to (B, h)$ be a Riemannian submersion. Then for every $x \\in M$ it holds that $$\\pi \\circ \\exp_x^M = \\exp^B_{\\pi(x)} \\circ\\, \\...")
      conclusion = SemanticGap span "Lemma 175 ([@gallier2020differential Proposition 18.3]). Let $\\pi:(M, g) \\to (B, h)$ be a Riemannian submersion. Then for every $x \\in M$ it holds that $$\\pi \\circ \\exp_x^M = \\exp^B_{\\pi(x)} \\circ\\, \\..."
      target = LeanTarget "lem_paralleltransportandRS" "theorem" span
  in TheoremIR
       { theoremId = "theorem_lem_paralleltransportandRS"
       , theoremStatement = "Lemma 175 ([@gallier2020differential Proposition 18.3]). Let $\\pi:(M, g) \\to (B, h)$ be a Riemannian submersion. Then for every $x \\in M$ it holds that $$\\pi \\circ \\exp_x^M = \\exp^B_{\\pi(x)} \\circ\\, \\..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "lemma"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_76_prop_preservationoflipschitz :: TheoremIR
theorem_76_prop_preservationoflipschitz =
  let span = (SourceSpan "theorem_graph.json" "prop:preservationofLipschitz" "prop:preservationofLipschitz" "sec-9-5" "Proposition 176. Let $(M, g)$ be a compact Riemannian manifold, and let $\\pi: (M, g) \\to (B, h)$ be a surjective Riemannian submersion. Let $f \\in C^2(M)$ be constant in the fibers of $\\pi$ and assume...")
      conclusion = SemanticGap span "Proposition 176. Let $(M, g)$ be a compact Riemannian manifold, and let $\\pi: (M, g) \\to (B, h)$ be a surjective Riemannian submersion. Let $f \\in C^2(M)$ be constant in the fibers of $\\pi$ and assume..."
      target = LeanTarget "prop_preservationofLipschitz" "theorem" span
  in TheoremIR
       { theoremId = "theorem_prop_preservationofLipschitz"
       , theoremStatement = "Proposition 176. Let $(M, g)$ be a compact Riemannian manifold, and let $\\pi: (M, g) \\to (B, h)$ be a surjective Riemannian submersion. Let $f \\in C^2(M)$ be constant in the fibers of $\\pi$ and assume..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_77_sectionalcurvatureofsphere :: TheoremIR
theorem_77_sectionalcurvatureofsphere =
  let span = (SourceSpan "theorem_graph.json" "sectionalcurvatureofsphere" "sectionalcurvatureofsphere" "sec-9-6" "Proposition 177 ([@lee2018introductionRiemannian Theorem 8.34]). The sphere $\\mathbb{S}^n$ endowed with the round metric has constant sectional curvature $1$. Furthermore, it is an Einstein manifold w...")
      conclusion = SemanticGap span "Proposition 177 ([@lee2018introductionRiemannian Theorem 8.34]). The sphere $\\mathbb{S}^n$ endowed with the round metric has constant sectional curvature $1$. Furthermore, it is an Einstein manifold w..."
      target = LeanTarget "sectionalcurvatureofsphere" "theorem" span
  in TheoremIR
       { theoremId = "theorem_sectionalcurvatureofsphere"
       , theoremStatement = "Proposition 177 ([@lee2018introductionRiemannian Theorem 8.34]). The sphere $\\mathbb{S}^n$ endowed with the round metric has constant sectional curvature $1$. Furthermore, it is an Einstein manifold w..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_78_shortestperiodicgeodun :: TheoremIR
theorem_78_shortestperiodicgeodun =
  let span = (SourceSpan "theorem_graph.json" "shortestperiodicgeodUn" "shortestperiodicgeodUn" "sec-9-6-1" "Proposition 178. The length of the shortest non-trivial periodic geodesic of $\\textup{U}(n)$ endowed with the bi-invariant metric is bounded from below by $2\\pi$.")
      conclusion = SemanticGap span "Proposition 178. The length of the shortest non-trivial periodic geodesic of $\\textup{U}(n)$ endowed with the bi-invariant metric is bounded from below by $2\\pi$"
      target = LeanTarget "shortestperiodicgeodUn" "theorem" span
  in TheoremIR
       { theoremId = "theorem_shortestperiodicgeodUn"
       , theoremStatement = "Proposition 178. The length of the shortest non-trivial periodic geodesic of $\\textup{U}(n)$ endowed with the bi-invariant metric is bounded from below by $2\\pi$."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindInvariant
       , theoremSemanticCategory = SemCatInvariantPreservation
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_79_thm_208 :: TheoremIR
theorem_79_thm_208 =
  let span = (SourceSpan "theorem_graph.json" "thm-208" "thm-208" "sec-9-6-1" "Proposition 179. Consider $\\textup{U}(n)$ endowed with the bi-invariant metric, and let $\\textup{Gr}_k(\\mathbb{C}^n)$ be endowed with the metric making the quotient map $\\pi: \\textup{U}(n) \\to \\textup...")
      conclusion = SemanticGap span "Proposition 179. Consider $\\textup{U}(n)$ endowed with the bi-invariant metric, and let $\\textup{Gr}_k(\\mathbb{C}^n)$ be endowed with the metric making the quotient map $\\pi: \\textup{U}(n) \\to \\textup..."
      target = LeanTarget "thm_208" "theorem" span
  in TheoremIR
       { theoremId = "theorem_thm_208"
       , theoremStatement = "Proposition 179. Consider $\\textup{U}(n)$ endowed with the bi-invariant metric, and let $\\textup{Gr}_k(\\mathbb{C}^n)$ be endowed with the metric making the quotient map $\\pi: \\textup{U}(n) \\to \\textup..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindInvariant
       , theoremSemanticCategory = SemCatInvariantPreservation
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_80_cor_injectivityradii :: TheoremIR
theorem_80_cor_injectivityradii =
  let span = (SourceSpan "theorem_graph.json" "cor:injectivityradii" "cor:injectivityradii" "sec-9-6-1" "Corollary 180. Consider the manifolds $\\textup{U}(n)$, $\\mathbb{S}^n$, $\\textup{V}_k(\\mathbb{C}^n)$ and $\\textup{Gr}_k(\\mathbb{C}^n)$ endowed with the metrics shown in [2](#tab:TablaGeodDiametro){refe...")
      conclusion = SemanticGap span "Corollary 180. Consider the manifolds $\\textup{U}(n)$, $\\mathbb{S}^n$, $\\textup{V}_k(\\mathbb{C}^n)$ and $\\textup{Gr}_k(\\mathbb{C}^n)$ endowed with the metrics shown in [2](#tab:TablaGeodDiametro){refe..."
      target = LeanTarget "cor_injectivityradii" "theorem" span
  in TheoremIR
       { theoremId = "theorem_cor_injectivityradii"
       , theoremStatement = "Corollary 180. Consider the manifolds $\\textup{U}(n)$, $\\mathbb{S}^n$, $\\textup{V}_k(\\mathbb{C}^n)$ and $\\textup{Gr}_k(\\mathbb{C}^n)$ endowed with the metrics shown in [2](#tab:TablaGeodDiametro){refe..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_81_diametersubmersion :: TheoremIR
theorem_81_diametersubmersion =
  let span = (SourceSpan "theorem_graph.json" "diametersubmersion" "diametersubmersion" "sec-9-6-2" "Proposition 181. Let $M$ be a compact Riemannian manifold and let $\\pi : (M, g) \\to (B, h)$ be a Riemannian submersion. Denote by $d_g$ and $d_h$ the geodesic distances on $M$ and $B$, respectively. T...")
      conclusion = SemanticGap span "Proposition 181. Let $M$ be a compact Riemannian manifold and let $\\pi : (M, g) \\to (B, h)$ be a Riemannian submersion. Denote by $d_g$ and $d_h$ the geodesic distances on $M$ and $B$, respectively. T..."
      target = LeanTarget "diametersubmersion" "theorem" span
  in TheoremIR
       { theoremId = "theorem_diametersubmersion"
       , theoremStatement = "Proposition 181. Let $M$ be a compact Riemannian manifold and let $\\pi : (M, g) \\to (B, h)$ be a Riemannian submersion. Denote by $d_g$ and $d_h$ the geodesic distances on $M$ and $B$, respectively. T..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_82_diameterproduct :: TheoremIR
theorem_82_diameterproduct =
  let span = (SourceSpan "theorem_graph.json" "diameterProduct" "diameterProduct" "sec-9-6-2" "Proposition 182 (Diameter of the product). Given two Riemannian manifolds $(M, g)$ and $(N, h)$, if we consider the product manifold $(M \\times N, g\\oplus h)$ endowed with the product metric, the dist...")
      conclusion = SemanticGap span "Proposition 182 (Diameter of the product). Given two Riemannian manifolds $(M, g)$ and $(N, h)$, if we consider the product manifold $(M \\times N, g\\oplus h)$ endowed with the product metric, the dist..."
      target = LeanTarget "diameterProduct" "theorem" span
  in TheoremIR
       { theoremId = "theorem_diameterProduct"
       , theoremStatement = "Proposition 182 (Diameter of the product). Given two Riemannian manifolds $(M, g)$ and $(N, h)$, if we consider the product manifold $(M \\times N, g\\oplus h)$ endowed with the product metric, the dist..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_83_thm_215 :: TheoremIR
theorem_83_thm_215 =
  let span = (SourceSpan "theorem_graph.json" "thm-215" "thm-215" "sec-9-6-2" "Proposition 183 (Bonnet-Myers). Let $(M, g)$ be a compact, connected Riemmanian manifold of dimension $n$, and suppose that there is a positive constant $c = \\frac{1}{R^2}$ such that the Ricci curvatu...")
      conclusion = SemanticGap span "Proposition 183 (Bonnet-Myers). Let $(M, g)$ be a compact, connected Riemmanian manifold of dimension $n$, and suppose that there is a positive constant $c = \\frac{1}{R^2}$ such that the Ricci curvatu..."
      target = LeanTarget "thm_215" "theorem" span
  in TheoremIR
       { theoremId = "theorem_thm_215"
       , theoremStatement = "Proposition 183 (Bonnet-Myers). Let $(M, g)$ be a compact, connected Riemmanian manifold of dimension $n$, and suppose that there is a positive constant $c = \\frac{1}{R^2}$ such that the Ricci curvatu..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindEquation
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_84_diamsun :: TheoremIR
theorem_84_diamsun =
  let span = (SourceSpan "theorem_graph.json" "diamSUn" "diamSUn" "sec-9-6-2" "Corollary 184. Let $\\mathbb{S}^n$ be endowed with the round metric, and let $\\textup{SU}(n)$ be endowed with the bi-invariant metric. Then $$\\textup{diam}(\\mathbb{S}^n) \\leq \\pi,\\quad \\textup{\\textit{...")
      conclusion = SemanticGap span "Corollary 184. Let $\\mathbb{S}^n$ be endowed with the round metric, and let $\\textup{SU}(n)$ be endowed with the bi-invariant metric. Then $$\\textup{diam}(\\mathbb{S}^n) \\leq \\pi,\\quad \\textup{\\textit{..."
      target = LeanTarget "diamSUn" "theorem" span
  in TheoremIR
       { theoremId = "theorem_diamSUn"
       , theoremStatement = "Corollary 184. Let $\\mathbb{S}^n$ be endowed with the round metric, and let $\\textup{SU}(n)$ be endowed with the bi-invariant metric. Then $$\\textup{diam}(\\mathbb{S}^n) \\leq \\pi,\\quad \\textup{\\textit{..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindInvariant
       , theoremSemanticCategory = SemCatInvariantPreservation
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_85_diamun :: TheoremIR
theorem_85_diamun =
  let span = (SourceSpan "theorem_graph.json" "diamUn" "diamUn" "sec-9-6-2" "Corollary 185. Let $\\textup{U}(n)$ be endowed with the bi-invariant metric. Then $$\\textup{diam}(\\textup{U}(n)) \\leq \\pi\\sqrt{n}(1+ \\sqrt{2}).$$")
      conclusion = UninterpretedPredicate "less_equal" [] span
      target = LeanTarget "diamUn" "theorem" span
  in TheoremIR
       { theoremId = "theorem_diamUn"
       , theoremStatement = "Corollary 185. Let $\\textup{U}(n)$ be endowed with the bi-invariant metric. Then $$\\textup{diam}(\\textup{U}(n)) \\leq \\pi\\sqrt{n}(1+ \\sqrt{2}).$$"
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindInvariant
       , theoremSemanticCategory = SemCatInvariantPreservation
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_86_lem_nestedlp :: TheoremIR
theorem_86_lem_nestedlp =
  let span = (SourceSpan "theorem_graph.json" "lem:nestedLp" "lem:nestedLp" "sec-10" "Lemma 187. Let $(E, \\mu)$ be a measure space with finite measure $\\mu$. Let $p, q \\in [1, \\infty]$, be such that $p > q$. Then $L^p(E, \\mu) \\subset L^q(E, \\mu)$.")
      conclusion = SemanticGap span "Lemma 187. Let $(E, \\mu)$ be a measure space with finite measure $\\mu$. Let $p, q \\in [1, \\infty]$, be such that $p > q$. Then $L^p(E, \\mu) \\subset L^q(E, \\mu)$"
      target = LeanTarget "lem_nestedLp" "theorem" span
  in TheoremIR
       { theoremId = "theorem_lem_nestedLp"
       , theoremStatement = "Lemma 187. Let $(E, \\mu)$ be a measure space with finite measure $\\mu$. Let $p, q \\in [1, \\infty]$, be such that $p > q$. Then $L^p(E, \\mu) \\subset L^q(E, \\mu)$."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "lemma"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_87_propdiv :: TheoremIR
theorem_87_propdiv =
  let span = (SourceSpan "theorem_graph.json" "propdiv" "propdiv" "sec-10" "Proposition 190. Given a smooth function $f: M \\rightarrow \\mathbb{R}$ and a smooth vector field $X \\in \\mathfrak{X}(M)$, the following identity holds $$\\textup{div}(fX) = f\\textup{div}(X) + X(f).$$")
      conclusion = Equals (RawTerm "unknown_term: Proposition 190. Given a smooth function $f: M \\rightarrow \\mathbb{R}$ and a smooth vector field $X \\in \\mathfrak{X}(M)$, the following identity holds $$\\textup{div}(fX" span) (RawTerm "add: unknown term" span)
      target = LeanTarget "propdiv" "theorem" span
  in TheoremIR
       { theoremId = "theorem_propdiv"
       , theoremStatement = "Proposition 190. Given a smooth function $f: M \\rightarrow \\mathbb{R}$ and a smooth vector field $X \\in \\mathfrak{X}(M)$, the following identity holds $$\\textup{div}(fX) = f\\textup{div}(X) + X(f).$$"
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindEquation
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_88_divtheo :: TheoremIR
theorem_88_divtheo =
  let span = (SourceSpan "theorem_graph.json" "divtheo" "divtheo" "sec-10" "Proposition 191 (Divergence theorem). Let $(M, g)$ be an oriented Riemannian manifold with boundary and let $X \\in \\mathfrak{X}(M)$ be a compactly supported smooth vector field, then $$\\int_{M} \\textu...")
      conclusion = SemanticGap span "Proposition 191 (Divergence theorem). Let $(M, g)$ be an oriented Riemannian manifold with boundary and let $X \\in \\mathfrak{X}(M)$ be a compactly supported smooth vector field, then $$\\int_{M} \\textu..."
      target = LeanTarget "divtheo" "theorem" span
  in TheoremIR
       { theoremId = "theorem_divtheo"
       , theoremStatement = "Proposition 191 (Divergence theorem). Let $(M, g)$ be an oriented Riemannian manifold with boundary and let $X \\in \\mathfrak{X}(M)$ be a compactly supported smooth vector field, then $$\\int_{M} \\textu..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "bound"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_89_equivlpspaces :: TheoremIR
theorem_89_equivlpspaces =
  let span = (SourceSpan "theorem_graph.json" "equivLpspaces" "equivLpspaces" "sec-10" "Remark 194. Let $(M, g, \\mu)$ be a compact weighted manifold, and let $U$ be a submanifold of $M$ endowed with the restricted measure $\\mu$ on $U$. Then 1. $L^2(U, \\mu|_U) = L^2(U),$ 2. $L^2_{\\mathit{...")
      conclusion = SemanticGap span "Remark 194. Let $(M, g, \\mu)$ be a compact weighted manifold, and let $U$ be a submanifold of $M$ endowed with the restricted measure $\\mu$ on $U$. Then 1. $L^2(U, \\mu|_U) = L^2(U),$ 2. $L^2_{\\mathit{..."
      target = LeanTarget "equivLpspaces" "theorem" span
  in TheoremIR
       { theoremId = "theorem_equivLpspaces"
       , theoremStatement = "Remark 194. Let $(M, g, \\mu)$ be a compact weighted manifold, and let $U$ be a submanifold of $M$ endowed with the restricted measure $\\mu$ on $U$. Then 1. $L^2(U, \\mu|_U) = L^2(U),$ 2. $L^2_{\\mathit{..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindEquation
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_90_equivsobolev :: TheoremIR
theorem_90_equivsobolev =
  let span = (SourceSpan "theorem_graph.json" "equivSobolev" "equivSobolev" "sec-10" "Remark 195. Let $(M, g, \\mu)$ be a compact weighted manifold, and let $U$ be a submanifold of $M$ endowed with the restricted measure $\\mu$ on $U$. Then $$H^1(U) = H^1(U, \\mu|_U).$$")
      conclusion = Equals (RawTerm "unknown_term: Remark 195. Let $(M, g, \\mu)$ be a compact weighted manifold, and let $U$ be a submanifold of $M$ endowed with the restricted measure $\\mu$ on $U$. Then $$H^1(U" span) (RawTerm "unknown_term: H^1(U, \\mu|_U).$$" span)
      target = LeanTarget "equivSobolev" "theorem" span
  in TheoremIR
       { theoremId = "theorem_equivSobolev"
       , theoremStatement = "Remark 195. Let $(M, g, \\mu)$ be a compact weighted manifold, and let $U$ be a submanifold of $M$ endowed with the restricted measure $\\mu$ on $U$. Then $$H^1(U) = H^1(U, \\mu|_U).$$"
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindEquation
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_91_thm_235 :: TheoremIR
theorem_91_thm_235 =
  let span = (SourceSpan "theorem_graph.json" "thm-235" "thm-235" "sec-11" "Remark 201. The carré du champ operator associated with $\\mathcal{L}$ as defined in [\\[eq:generaloperatorL\\]](#eq:generaloperatorL){reference-type=\"ref+label\" reference=\"eq:generaloperatorL\"} can be w...")
      conclusion = SemanticGap span "Remark 201. The carré du champ operator associated with $\\mathcal{L}$ as defined in [\\[eq:generaloperatorL\\]](#eq:generaloperatorL){reference-type=\"ref+label\" reference=\"eq:generaloperatorL\"} can be w..."
      target = LeanTarget "thm_235" "theorem" span
  in TheoremIR
       { theoremId = "theorem_thm_235"
       , theoremStatement = "Remark 201. The carré du champ operator associated with $\\mathcal{L}$ as defined in [\\[eq:generaloperatorL\\]](#eq:generaloperatorL){reference-type=\"ref+label\" reference=\"eq:generaloperatorL\"} can be w..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindEquation
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_92_lem_explicitsecondorder :: TheoremIR
theorem_92_lem_explicitsecondorder =
  let span = (SourceSpan "theorem_graph.json" "lem:explicitsecondorder" "lem:explicitsecondorder" "sec-11" "Lemma 205 ([@LiErd2022Supp Lemma G.1]). Let $(M, g)$ be a compact Riemannian manifold. Let $\\beta >0$, let $F$ be some smooth function on $M$ and consider the Langevin diffusion generator $\\operatorna...")
      conclusion = SemanticGap span "Lemma 205 ([@LiErd2022Supp Lemma G.1]). Let $(M, g)$ be a compact Riemannian manifold. Let $\\beta >0$, let $F$ be some smooth function on $M$ and consider the Langevin diffusion generator $\\operatorna..."
      target = LeanTarget "lem_explicitsecondorder" "theorem" span
  in TheoremIR
       { theoremId = "theorem_lem_explicitsecondorder"
       , theoremStatement = "Lemma 205 ([@LiErd2022Supp Lemma G.1]). Let $(M, g)$ be a compact Riemannian manifold. Let $\\beta >0$, let $F$ be some smooth function on $M$ and consider the Langevin diffusion generator $\\operatorna..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "lemma"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_93_thm_240 :: TheoremIR
theorem_93_thm_240 =
  let span = (SourceSpan "theorem_graph.json" "thm-240" "thm-240" "sec-11" "Remark 206. Let $(M, g)$ be a compact Riemannian manifold, let $\\beta > 0$, let $F$ be some smooth function on $M$ and let $\\operatorname{L}$ be the Langevin diffusion generator. Then the curvature-di...")
      conclusion = SemanticGap span "Remark 206. Let $(M, g)$ be a compact Riemannian manifold, let $\\beta > 0$, let $F$ be some smooth function on $M$ and let $\\operatorname{L}$ be the Langevin diffusion generator. Then the curvature-di..."
      target = LeanTarget "thm_240" "theorem" span
  in TheoremIR
       { theoremId = "theorem_thm_240"
       , theoremStatement = "Remark 206. Let $(M, g)$ be a compact Riemannian manifold, let $\\beta > 0$, let $F$ be some smooth function on $M$ and let $\\operatorname{L}$ be the Langevin diffusion generator. Then the curvature-di..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_94_thm_boundneumanneigval :: TheoremIR
theorem_94_thm_boundneumanneigval =
  let span = (SourceSpan "theorem_graph.json" "thm:boundneumanneigval" "thm:boundneumanneigval" "sec-11" "Proposition 209 ([@wang2006functional Theorem 2.2.5]). Let $(M, g)$ be a compact Riemannian manifold and let $U$ be a bounded open domain of $M$ with smooth boundary $\\partial U$. Consider the second-...")
      conclusion = SemanticGap span "Proposition 209 ([@wang2006functional Theorem 2.2.5]). Let $(M, g)$ be a compact Riemannian manifold and let $U$ be a bounded open domain of $M$ with smooth boundary $\\partial U$. Consider the second-..."
      target = LeanTarget "thm_boundneumanneigval" "theorem" span
  in TheoremIR
       { theoremId = "theorem_thm_boundneumanneigval"
       , theoremStatement = "Proposition 209 ([@wang2006functional Theorem 2.2.5]). Let $(M, g)$ be a compact Riemannian manifold and let $U$ be a bounded open domain of $M$ with smooth boundary $\\partial U$. Consider the second-..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "bound"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_95_rmk_generalisedito :: TheoremIR
theorem_95_rmk_generalisedito =
  let span = (SourceSpan "theorem_graph.json" "rmk:generalisedito" "rmk:generalisedito" "sec-12-1" "Proposition 211. Let $(M, g)$ be a compact manifold and let $F \\in C^\\infty (M)$. Consider the Langevin diffusion generator $$\\operatorname{L}\\phi = \\langle -\\textup{grad}_{g}\\,F, \\textup{grad}_{g}\\,\\...")
      conclusion = SemanticGap span "Proposition 211. Let $(M, g)$ be a compact manifold and let $F \\in C^\\infty (M)$. Consider the Langevin diffusion generator $$\\operatorname{L}\\phi = \\langle -\\textup{grad}_{g}\\,F, \\textup{grad}_{g}\\,\\..."
      target = LeanTarget "rmk_generalisedito" "theorem" span
  in TheoremIR
       { theoremId = "theorem_rmk_generalisedito"
       , theoremStatement = "Proposition 211. Let $(M, g)$ be a compact manifold and let $F \\in C^\\infty (M)$. Consider the Langevin diffusion generator $$\\operatorname{L}\\phi = \\langle -\\textup{grad}_{g}\\,F, \\textup{grad}_{g}\\,\\..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindEquation
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_96_prop_quadraticvariationsemimartingale :: TheoremIR
theorem_96_prop_quadraticvariationsemimartingale =
  let span = (SourceSpan "theorem_graph.json" "prop:quadraticvariationsemimartingale" "prop:quadraticvariationsemimartingale" "sec-12-1" "Proposition 213 ([@revuz2013continuous Proposition 1.18]). A continuous real semimartingale $Y_t = M_t + A_t$ has a finite quadratic variation and $\\langle Y, Y\\rangle_t = \\langle M , M\\rangle_t$.")
      conclusion = Equals (RawTerm "unknown_term: Proposition 213 ([@revuz2013continuous Proposition 1.18]). A continuous real semimartingale $Y_t" span) (RawTerm "add: unknown term" span)
      target = LeanTarget "prop_quadraticvariationsemimartingale" "theorem" span
  in TheoremIR
       { theoremId = "theorem_prop_quadraticvariationsemimartingale"
       , theoremStatement = "Proposition 213 ([@revuz2013continuous Proposition 1.18]). A continuous real semimartingale $Y_t = M_t + A_t$ has a finite quadratic variation and $\\langle Y, Y\\rangle_t = \\langle M , M\\rangle_t$."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindEquation
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_97_prop_identifyvariation :: TheoremIR
theorem_97_prop_identifyvariation =
  let span = (SourceSpan "theorem_graph.json" "prop:identifyvariation" "prop:identifyvariation" "sec-12-1" "Proposition 214. Let $(M, g)$ be a compact manifold and let $F \\in C^\\infty (M)$. Consider the Langevin diffusion generator $\\operatorname{L}$ and let $X_t$ be the Langevin diffusion process. Given $f...")
      conclusion = SemanticGap span "Proposition 214. Let $(M, g)$ be a compact manifold and let $F \\in C^\\infty (M)$. Consider the Langevin diffusion generator $\\operatorname{L}$ and let $X_t$ be the Langevin diffusion process. Given $f..."
      target = LeanTarget "prop_identifyvariation" "theorem" span
  in TheoremIR
       { theoremId = "theorem_prop_identifyvariation"
       , theoremStatement = "Proposition 214. Let $(M, g)$ be a compact manifold and let $F \\in C^\\infty (M)$. Consider the Langevin diffusion generator $\\operatorname{L}$ and let $X_t$ be the Langevin diffusion process. Given $f..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_98_prop_identifymartingale :: TheoremIR
theorem_98_prop_identifymartingale =
  let span = (SourceSpan "theorem_graph.json" "prop:identifymartingale" "prop:identifymartingale" "sec-12-1" "Proposition 215 ([@revuz2013continuous Proposition 3.8, Chapter V]). If $M_t$ is a continuous local martingale such that the measure $d\\langle M,M\\rangle_t$ is almost surely equivalent[^17] to the Leb...")
      conclusion = SemanticGap span "Proposition 215 ([@revuz2013continuous Proposition 3.8, Chapter V]). If $M_t$ is a continuous local martingale such that the measure $d\\langle M,M\\rangle_t$ is almost surely equivalent[^17] to the Leb..."
      target = LeanTarget "prop_identifymartingale" "theorem" span
  in TheoremIR
       { theoremId = "theorem_prop_identifymartingale"
       , theoremStatement = "Proposition 215 ([@revuz2013continuous Proposition 3.8, Chapter V]). If $M_t$ is a continuous local martingale such that the measure $d\\langle M,M\\rangle_t$ is almost surely equivalent[^17] to the Leb..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindEquivalence
       , theoremSemanticCategory = SemCatEquivalence
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_99_prop_existencesol :: TheoremIR
theorem_99_prop_existencesol =
  let span = (SourceSpan "theorem_graph.json" "prop:existencesol" "prop:existencesol" "sec-12-2" "Proposition 217. Let $(\\Omega, \\mathcal{F}, (\\mathcal{F}_t)_{t \\geq 0}, \\mathbb{P})$ carrying a one-dimensional Brownian motion $(B_t)_{t \\geq 0}$. Let $\\sigma_t$ be a $(\\mathcal{F}_t)$-adapted contin...")
      conclusion = SemanticGap span "Proposition 217. Let $(\\Omega, \\mathcal{F}, (\\mathcal{F}_t)_{t \\geq 0}, \\mathbb{P})$ carrying a one-dimensional Brownian motion $(B_t)_{t \\geq 0}$. Let $\\sigma_t$ be a $(\\mathcal{F}_t)$-adapted contin..."
      target = LeanTarget "prop_existencesol" "theorem" span
  in TheoremIR
       { theoremId = "theorem_prop_existencesol"
       , theoremStatement = "Proposition 217. Let $(\\Omega, \\mathcal{F}, (\\mathcal{F}_t)_{t \\geq 0}, \\mathbb{P})$ carrying a one-dimensional Brownian motion $(B_t)_{t \\geq 0}$. Let $\\sigma_t$ be a $(\\mathcal{F}_t)$-adapted contin..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_100_prop_itolemmar :: TheoremIR
theorem_100_prop_itolemmar =
  let span = (SourceSpan "theorem_graph.json" "prop:itolemmaR" "prop:itolemmaR" "sec-12-2" "Proposition 218 ([@steele2012stochastic Theorem 8.4]). If $f \\in C^{1,2}(\\mathbb{R}^+ \\times \\mathbb{R})$ and $Y_t$ is a standard process satisfying $$Y_t = a(t, Y_t) dt + b(t, Y_t) dB_t,\\quad t \\geq ...")
      conclusion = SemanticGap span "Proposition 218 ([@steele2012stochastic Theorem 8.4]). If $f \\in C^{1,2}(\\mathbb{R}^+ \\times \\mathbb{R})$ and $Y_t$ is a standard process satisfying $$Y_t = a(t, Y_t) dt + b(t, Y_t) dB_t,\\quad t \\geq ..."
      target = LeanTarget "prop_itolemmaR" "theorem" span
  in TheoremIR
       { theoremId = "theorem_prop_itolemmaR"
       , theoremStatement = "Proposition 218 ([@steele2012stochastic Theorem 8.4]). If $f \\in C^{1,2}(\\mathbb{R}^+ \\times \\mathbb{R})$ and $Y_t$ is a standard process satisfying $$Y_t = a(t, Y_t) dt + b(t, Y_t) dB_t,\\quad t \\geq ..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindEquation
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_101_prop_markovsineq :: TheoremIR
theorem_101_prop_markovsineq =
  let span = (SourceSpan "theorem_graph.json" "prop:markovsineq" "prop:markovsineq" "sec-12-2" "Proposition 219 (Markov's inequality). Let $X$ be a non-negative real variable. Then for every positive constant $\\lambda > 0$, it holds that $$\\mathbb{P}[X \\geq \\lambda] \\leq \\frac{1}{\\lambda}\\mathbb...")
      conclusion = SemanticGap span "Proposition 219 (Markov's inequality). Let $X$ be a non-negative real variable. Then for every positive constant $\\lambda > 0$, it holds that $$\\mathbb{P}[X \\geq \\lambda] \\leq \\frac{1}{\\lambda}\\mathbb..."
      target = LeanTarget "prop_markovsineq" "theorem" span
  in TheoremIR
       { theoremId = "theorem_prop_markovsineq"
       , theoremStatement = "Proposition 219 (Markov's inequality). Let $X$ be a non-negative real variable. Then for every positive constant $\\lambda > 0$, it holds that $$\\mathbb{P}[X \\geq \\lambda] \\leq \\frac{1}{\\lambda}\\mathbb..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_102_prop_comparisonthm :: TheoremIR
theorem_102_prop_comparisonthm =
  let span = (SourceSpan "theorem_graph.json" "prop:comparisonthm" "prop:comparisonthm" "sec-12-3" "Proposition 220. The processes $\\tilde{r}(\\tilde X_t)$ and $z_t$ are such that, if $\\tilde{r}(X_0) = z_0$. Then $$\\mathbb{P}[\\tilde{r}^2(\\tilde X_t) \\geq z_t^2 | t < \\tau^c_{\\mathcal{B}(i(B), p)}] = 1...")
      conclusion = SemanticGap span "Proposition 220. The processes $\\tilde{r}(\\tilde X_t)$ and $z_t$ are such that, if $\\tilde{r}(X_0) = z_0$. Then $$\\mathbb{P}[\\tilde{r}^2(\\tilde X_t) \\geq z_t^2 | t < \\tau^c_{\\mathcal{B}(i(B), p)}] = 1..."
      target = LeanTarget "prop_comparisonthm" "theorem" span
  in TheoremIR
       { theoremId = "theorem_prop_comparisonthm"
       , theoremStatement = "Proposition 220. The processes $\\tilde{r}(\\tilde X_t)$ and $z_t$ are such that, if $\\tilde{r}(X_0) = z_0$. Then $$\\mathbb{P}[\\tilde{r}^2(\\tilde X_t) \\geq z_t^2 | t < \\tau^c_{\\mathcal{B}(i(B), p)}] = 1..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindEquation
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_103_rellichkondrachov :: TheoremIR
theorem_103_rellichkondrachov =
  let span = (SourceSpan "theorem_graph.json" "RellichKondrachov" "RellichKondrachov" "sec-13-1" "Theorem 223 (Compact embedding theorem - Rellich--Kondrachov - [@Grigoryan_2024 Theorem 2.9]). Let $M$ be a manifold and let $U$ be a precompact open subset of $M$. Then the identical embedding $$H^1_...")
      conclusion = SemanticGap span "Theorem 223 (Compact embedding theorem - Rellich--Kondrachov - [@Grigoryan_2024 Theorem 2.9]). Let $M$ be a manifold and let $U$ be a precompact open subset of $M$. Then the identical embedding $$H^1_..."
      target = LeanTarget "RellichKondrachov" "theorem" span
  in TheoremIR
       { theoremId = "theorem_RellichKondrachov"
       , theoremStatement = "Theorem 223 (Compact embedding theorem - Rellich--Kondrachov - [@Grigoryan_2024 Theorem 2.9]). Let $M$ be a manifold and let $U$ be a precompact open subset of $M$. Then the identical embedding $$H^1_..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_104_fredholm :: TheoremIR
theorem_104_fredholm =
  let span = (SourceSpan "theorem_graph.json" "Fredholm" "Fredholm" "sec-13-1" "Theorem 224 (Fredholm alternative, [@evans2010partial Appendix D - Theorem 5]). Let $H$ be a Hilbert space and $\\mathcal{K}: H \\rightarrow H$ be a compact linear operator. Then either for each $f \\in ...")
      conclusion = SemanticGap span "Theorem 224 (Fredholm alternative, [@evans2010partial Appendix D - Theorem 5]). Let $H$ be a Hilbert space and $\\mathcal{K}: H \\rightarrow H$ be a compact linear operator. Then either for each $f \\in ..."
      target = LeanTarget "Fredholm" "theorem" span
  in TheoremIR
       { theoremId = "theorem_Fredholm"
       , theoremStatement = "Theorem 224 (Fredholm alternative, [@evans2010partial Appendix D - Theorem 5]). Let $H$ be a Hilbert space and $\\mathcal{K}: H \\rightarrow H$ be a compact linear operator. Then either for each $f \\in ..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_105_laxmilgram :: TheoremIR
theorem_105_laxmilgram =
  let span = (SourceSpan "theorem_graph.json" "LaxMilgram" "LaxMilgram" "sec-13-1" "Theorem 229 (Lax-Milgram, [@evans2010partial Theorem 1, Section 6.2]). Let $\\mathfrak{B}$ be a bounded, coercive and bilinear form on a Hilbert space $H$. Then for every bounded linear functional $\\ps...")
      conclusion = SemanticGap span "Theorem 229 (Lax-Milgram, [@evans2010partial Theorem 1, Section 6.2]). Let $\\mathfrak{B}$ be a bounded, coercive and bilinear form on a Hilbert space $H$. Then for every bounded linear functional $\\ps..."
      target = LeanTarget "LaxMilgram" "theorem" span
  in TheoremIR
       { theoremId = "theorem_LaxMilgram"
       , theoremStatement = "Theorem 229 (Lax-Milgram, [@evans2010partial Theorem 1, Section 6.2]). Let $\\mathfrak{B}$ be a bounded, coercive and bilinear form on a Hilbert space $H$. Then for every bounded linear functional $\\ps..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "bound"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_106_theoremaexistencianuestraedp :: TheoremIR
theorem_106_theoremaexistencianuestraedp =
  let span = (SourceSpan "theorem_graph.json" "theoremaexistencianuestraEDP" "theoremaexistencianuestraEDP" "sec-13-2" "Theorem 231. Let $(M, g)$ be a compact Riemannian manifold, let $U \\subset M$ be open, and let $F$ be some smooth function on $M$. Let $\\operatorname{L}$ be the Langevin diffusion operator given by $$...")
      conclusion = SemanticGap span "Theorem 231. Let $(M, g)$ be a compact Riemannian manifold, let $U \\subset M$ be open, and let $F$ be some smooth function on $M$. Let $\\operatorname{L}$ be the Langevin diffusion operator given by $$..."
      target = LeanTarget "theoremaexistencianuestraEDP" "theorem" span
  in TheoremIR
       { theoremId = "theorem_theoremaexistencianuestraEDP"
       , theoremStatement = "Theorem 231. Let $(M, g)$ be a compact Riemannian manifold, let $U \\subset M$ be open, and let $F$ be some smooth function on $M$. Let $\\operatorname{L}$ be the Langevin diffusion operator given by $$..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_107_firsttheorem :: TheoremIR
theorem_107_firsttheorem =
  let span = (SourceSpan "theorem_graph.json" "firstTheorem" "firstTheorem" "sec-13-2" "Theorem 232 (First existence theorem for weak solutions, [@evans2010partial Theorem 3, Section 6.2]). Let $\\mathfrak{L}$ be an elliptic operator. Let $M$ be a compact manifold and let $U$ be some open...")
      conclusion = SemanticGap span "Theorem 232 (First existence theorem for weak solutions, [@evans2010partial Theorem 3, Section 6.2]). Let $\\mathfrak{L}$ be an elliptic operator. Let $M$ be a compact manifold and let $U$ be some open..."
      target = LeanTarget "firstTheorem" "theorem" span
  in TheoremIR
       { theoremId = "theorem_firstTheorem"
       , theoremStatement = "Theorem 232 (First existence theorem for weak solutions, [@evans2010partial Theorem 3, Section 6.2]). Let $\\mathfrak{L}$ be an elliptic operator. Let $M$ be a compact manifold and let $U$ be some open..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_108_secondtheorem :: TheoremIR
theorem_108_secondtheorem =
  let span = (SourceSpan "theorem_graph.json" "secondTheorem" "secondTheorem" "sec-13-2" "Theorem 234 (Second existence theorem for weak solutions, [@evans2010partial Theorem 4, Section 6.2]). Let $\\mathfrak{L}$ be an elliptic operator. Let $M$ be a compact manifold and let $U$ be some ope...")
      conclusion = SemanticGap span "Theorem 234 (Second existence theorem for weak solutions, [@evans2010partial Theorem 4, Section 6.2]). Let $\\mathfrak{L}$ be an elliptic operator. Let $M$ be a compact manifold and let $U$ be some ope..."
      target = LeanTarget "secondTheorem" "theorem" span
  in TheoremIR
       { theoremId = "theorem_secondTheorem"
       , theoremStatement = "Theorem 234 (Second existence theorem for weak solutions, [@evans2010partial Theorem 4, Section 6.2]). Let $\\mathfrak{L}$ be an elliptic operator. Let $M$ be a compact manifold and let $U$ be some ope..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_109_existenciaevans :: TheoremIR
theorem_109_existenciaevans =
  let span = (SourceSpan "theorem_graph.json" "existenciaEvans" "existenciaEvans" "sec-13-2" "Theorem 235 (Third Existence Theorem for weak solutions, [@evans2010partial Theorem 5, Section 6.2]). Let $\\mathfrak{L}$ be an elliptic operator. Let $M$ be a compact manifold and let $U$ be some open...")
      conclusion = SemanticGap span "Theorem 235 (Third Existence Theorem for weak solutions, [@evans2010partial Theorem 5, Section 6.2]). Let $\\mathfrak{L}$ be an elliptic operator. Let $M$ be a compact manifold and let $U$ be some open..."
      target = LeanTarget "existenciaEvans" "theorem" span
  in TheoremIR
       { theoremId = "theorem_existenciaEvans"
       , theoremStatement = "Theorem 235 (Third Existence Theorem for weak solutions, [@evans2010partial Theorem 5, Section 6.2]). Let $\\mathfrak{L}$ be an elliptic operator. Let $M$ be a compact manifold and let $U$ be some open..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_110_thm_283 :: TheoremIR
theorem_110_thm_283 =
  let span = (SourceSpan "theorem_graph.json" "thm-283" "thm-283" "sec-13-3" "Theorem 237 ([@evans2010partial Section 6.3 - Theorem 6]). Let $u$ be the weak solution of the boundary-value problem from [231](#theoremaexistencianuestraEDP){reference-type=\"ref+label\" reference=\"th...")
      conclusion = SemanticGap span "Theorem 237 ([@evans2010partial Section 6.3 - Theorem 6]). Let $u$ be the weak solution of the boundary-value problem from [231](#theoremaexistencianuestraEDP){reference-type=\"ref+label\" reference=\"th..."
      target = LeanTarget "thm_283" "theorem" span
  in TheoremIR
       { theoremId = "theorem_thm_283"
       , theoremStatement = "Theorem 237 ([@evans2010partial Section 6.3 - Theorem 6]). Let $u$ be the weak solution of the boundary-value problem from [231](#theoremaexistencianuestraEDP){reference-type=\"ref+label\" reference=\"th..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "bound"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_111_regularvaluesdense :: TheoremIR
theorem_111_regularvaluesdense =
  let span = (SourceSpan "theorem_graph.json" "regularvaluesdense" "regularvaluesdense" "sec-13-3" "Theorem 239. Let $M$ and $N$ be two smooth manifolds, and let $f: M \\to N$ be a smooth function. The set of regular values of $f$ is everywhere dense in $N$.")
      conclusion = SemanticGap span "Theorem 239. Let $M$ and $N$ be two smooth manifolds, and let $f: M \\to N$ be a smooth function. The set of regular values of $f$ is everywhere dense in $N$"
      target = LeanTarget "regularvaluesdense" "theorem" span
  in TheoremIR
       { theoremId = "theorem_regularvaluesdense"
       , theoremStatement = "Theorem 239. Let $M$ and $N$ be two smooth manifolds, and let $f: M \\to N$ be a smooth function. The set of regular values of $f$ is everywhere dense in $N$."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_112_rem_laplaciannotpositive :: TheoremIR
theorem_112_rem_laplaciannotpositive =
  let span = (SourceSpan "theorem_graph.json" "rem:laplaciannotpositive" "rem:laplaciannotpositive" "sec-14-1" "Remark 240. Let $(\\mathbb{S}^2, g_{\\mathit{round}})$ be the two-sphere endowed with the usual round metric, let $p \\in \\mathbb{S}^2$ be a fixed point and let $v \\in T_p \\mathbb{S}^2$ with $|v|_{g_{\\ma...")
      conclusion = SemanticGap span "Remark 240. Let $(\\mathbb{S}^2, g_{\\mathit{round}})$ be the two-sphere endowed with the usual round metric, let $p \\in \\mathbb{S}^2$ be a fixed point and let $v \\in T_p \\mathbb{S}^2$ with $|v|_{g_{\\ma..."
      target = LeanTarget "rem_laplaciannotpositive" "theorem" span
  in TheoremIR
       { theoremId = "theorem_rem_laplaciannotpositive"
       , theoremStatement = "Remark 240. Let $(\\mathbb{S}^2, g_{\\mathit{round}})$ be the two-sphere endowed with the usual round metric, let $p \\in \\mathbb{S}^2$ be a fixed point and let $v \\in T_p \\mathbb{S}^2$ with $|v|_{g_{\\ma..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_113_thm_288 :: TheoremIR
theorem_113_thm_288 =
  let span = (SourceSpan "theorem_graph.json" "thm-288" "thm-288" "sec-14-1" "Remark 241. There is no radius $R$ such that $|\\textup{grad}_{g_{\\mathit{round}}}\\, \\tilde r_{p, v}|_{g_{\\mathit{round}}} \\equiv 1$ then restricted to the ball $\\mathcal{B}(R, p)$.")
      conclusion = SemanticGap span "Remark 241. There is no radius $R$ such that $|\\textup{grad}_{g_{\\mathit{round}}}\\, \\tilde r_{p, v}|_{g_{\\mathit{round}}} \\equiv 1$ then restricted to the ball $\\mathcal{B}(R, p)$"
      target = LeanTarget "thm_288" "theorem" span
  in TheoremIR
       { theoremId = "theorem_thm_288"
       , theoremStatement = "Remark 241. There is no radius $R$ such that $|\\textup{grad}_{g_{\\mathit{round}}}\\, \\tilde r_{p, v}|_{g_{\\mathit{round}}} \\equiv 1$ then restricted to the ball $\\mathcal{B}(R, p)$."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_114_thm_taylorexpansionmetric :: TheoremIR
theorem_114_thm_taylorexpansionmetric =
  let span = (SourceSpan "theorem_graph.json" "thm:taylorexpansionmetric" "thm:taylorexpansionmetric" "sec-14-2-1" "Proposition 242. Let $(M, g)$ be a complete and connected $d$-dimensional Riemannian manifold which is furthermore a symmetric space, and let $p \\in M$ be some fixed point in $M$. For every $x \\in M$ ...")
      conclusion = SemanticGap span "Proposition 242. Let $(M, g)$ be a complete and connected $d$-dimensional Riemannian manifold which is furthermore a symmetric space, and let $p \\in M$ be some fixed point in $M$. For every $x \\in M$ ..."
      target = LeanTarget "thm_taylorexpansionmetric" "theorem" span
  in TheoremIR
       { theoremId = "theorem_thm_taylorexpansionmetric"
       , theoremStatement = "Proposition 242. Let $(M, g)$ be a complete and connected $d$-dimensional Riemannian manifold which is furthermore a symmetric space, and let $p \\in M$ be some fixed point in $M$. For every $x \\in M$ ..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_115_lem_pushforwardandcovariant :: TheoremIR
theorem_115_lem_pushforwardandcovariant =
  let span = (SourceSpan "theorem_graph.json" "lem:pushforwardandcovariant" "lem:pushforwardandcovariant" "sec-14-2-1" "Lemma 245. Let $(M, g)$ be a complete and connected Riemannian manifold. Let $p \\in M$ be fixed, let $x \\in M$ be outside the cut locus of $p$ and let $\\varphi$ be as defined previously. Consider $(\\p...")
      conclusion = SemanticGap span "Lemma 245. Let $(M, g)$ be a complete and connected Riemannian manifold. Let $p \\in M$ be fixed, let $x \\in M$ be outside the cut locus of $p$ and let $\\varphi$ be as defined previously. Consider $(\\p..."
      target = LeanTarget "lem_pushforwardandcovariant" "theorem" span
  in TheoremIR
       { theoremId = "theorem_lem_pushforwardandcovariant"
       , theoremStatement = "Lemma 245. Let $(M, g)$ be a complete and connected Riemannian manifold. Let $p \\in M$ be fixed, let $x \\in M$ be outside the cut locus of $p$ and let $\\varphi$ be as defined previously. Consider $(\\p..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "lemma"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_116_lem_covariantderivativeszero :: TheoremIR
theorem_116_lem_covariantderivativeszero =
  let span = (SourceSpan "theorem_graph.json" "lem:covariantderivativeszero" "lem:covariantderivativeszero" "sec-14-2-1" "Lemma 246. For every $k \\in \\mathbb{N}$, it holds that $${}^{\\varphi}\\nabla^{(2k)}_{\\partial_t} \\varphi_ \\partial_s|_{(0,0)} = 0.$$*")
      conclusion = Equals (RawTerm "unknown_term: Lemma 246. For every $k \\in \\mathbb{N}$, it holds that $${}^{\\varphi}\\nabla^{(2k)}_{\\partial_t} \\varphi_ \\partial_s|_{(0,0)}" span) (RawTerm "unknown_term: 0.$$*" span)
      target = LeanTarget "lem_covariantderivativeszero" "theorem" span
  in TheoremIR
       { theoremId = "theorem_lem_covariantderivativeszero"
       , theoremStatement = "Lemma 246. For every $k \\in \\mathbb{N}$, it holds that $${}^{\\varphi}\\nabla^{(2k)}_{\\partial_t} \\varphi_ \\partial_s|_{(0,0)} = 0.$$*"
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "lemma"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_117_thm_297 :: TheoremIR
theorem_117_thm_297 =
  let span = (SourceSpan "theorem_graph.json" "thm-297" "thm-297" "sec-14-2-1" "Remark 247. Although we did not give an explicit formula for the terms in the Taylor series of $g_{ij}(x)$ in the statement of [242](#thm:taylorexpansionmetric){reference-type=\"ref+label\" reference=\"t...")
      conclusion = SemanticGap span "Remark 247. Although we did not give an explicit formula for the terms in the Taylor series of $g_{ij}(x)$ in the statement of [242](#thm:taylorexpansionmetric){reference-type=\"ref+label\" reference=\"t..."
      target = LeanTarget "thm_297" "theorem" span
  in TheoremIR
       { theoremId = "theorem_thm_297"
       , theoremStatement = "Remark 247. Although we did not give an explicit formula for the terms in the Taylor series of $g_{ij}(x)$ in the statement of [242](#thm:taylorexpansionmetric){reference-type=\"ref+label\" reference=\"t..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindEquation
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_118_prop_explicitexpresisonmetricderivatives :: TheoremIR
theorem_118_prop_explicitexpresisonmetricderivatives =
  let span = (SourceSpan "theorem_graph.json" "prop:explicitexpresisonmetricderivatives" "prop:explicitexpresisonmetricderivatives" "sec-14-2-1" "Proposition 248. Let $(M, g)$ be a complete and connected symmetric space of dimension $d$. Let us denote by $R$ its Riemann curvature tensor. Let $p \\in M$ be fixed and let $x \\in M$ be outside the c...")
      conclusion = SemanticGap span "Proposition 248. Let $(M, g)$ be a complete and connected symmetric space of dimension $d$. Let us denote by $R$ its Riemann curvature tensor. Let $p \\in M$ be fixed and let $x \\in M$ be outside the c..."
      target = LeanTarget "prop_explicitexpresisonmetricderivatives" "theorem" span
  in TheoremIR
       { theoremId = "theorem_prop_explicitexpresisonmetricderivatives"
       , theoremStatement = "Proposition 248. Let $(M, g)$ be a complete and connected symmetric space of dimension $d$. Let us denote by $R$ its Riemann curvature tensor. Let $p \\in M$ be fixed and let $x \\in M$ be outside the c..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_119_prop_explicitexpresisoninversemetricderivatives :: TheoremIR
theorem_119_prop_explicitexpresisoninversemetricderivatives =
  let span = (SourceSpan "theorem_graph.json" "prop:explicitexpresisoninversemetricderivatives" "prop:explicitexpresisoninversemetricderivatives" "sec-14-2-1" "Proposition 249. Let $(M, g)$ be a complete and connected $d$-dimensional Riemannian manifold which is furthermore a symmetric space, and let $p \\in M$ be some fixed point in $M$. For any $x \\in M$ ou...")
      conclusion = SemanticGap span "Proposition 249. Let $(M, g)$ be a complete and connected $d$-dimensional Riemannian manifold which is furthermore a symmetric space, and let $p \\in M$ be some fixed point in $M$. For any $x \\in M$ ou..."
      target = LeanTarget "prop_explicitexpresisoninversemetricderivatives" "theorem" span
  in TheoremIR
       { theoremId = "theorem_prop_explicitexpresisoninversemetricderivatives"
       , theoremStatement = "Proposition 249. Let $(M, g)$ be a complete and connected $d$-dimensional Riemannian manifold which is furthermore a symmetric space, and let $p \\in M$ be some fixed point in $M$. For any $x \\in M$ ou..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_120_prop_boundmetricterms :: TheoremIR
theorem_120_prop_boundmetricterms =
  let span = (SourceSpan "theorem_graph.json" "prop:boundmetricterms" "prop:boundmetricterms" "sec-14-2-2" "Proposition 250. Let $(M, g)$ be a complete and connected $d$-dimensional Riemannian manifold which is also a symmetric space. Let $p \\in M$ be a fixed point and let us consider normal coordinates cen...")
      conclusion = SemanticGap span "Proposition 250. Let $(M, g)$ be a complete and connected $d$-dimensional Riemannian manifold which is also a symmetric space. Let $p \\in M$ be a fixed point and let us consider normal coordinates cen..."
      target = LeanTarget "prop_boundmetricterms" "theorem" span
  in TheoremIR
       { theoremId = "theorem_prop_boundmetricterms"
       , theoremStatement = "Proposition 250. Let $(M, g)$ be a complete and connected $d$-dimensional Riemannian manifold which is also a symmetric space. Let $p \\in M$ be a fixed point and let us consider normal coordinates cen..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_121_lem_frobeniusnorm :: TheoremIR
theorem_121_lem_frobeniusnorm =
  let span = (SourceSpan "theorem_graph.json" "lem:frobeniusnorm" "lem:frobeniusnorm" "sec-14-2-2" "Lemma 252. For every matrix $A$ of size $n \\times m$ it holds that $$\\max_{ij} |a_{ij}| \\leq \\norm{A}_F \\leq \\sqrt{nm} \\max_{ij} |a_{ij}|,$$ where $\\norm{A}_F$ denotes the Frobenius norm of $A$, namel...")
      conclusion = SemanticGap span "Lemma 252. For every matrix $A$ of size $n \\times m$ it holds that $$\\max_{ij} |a_{ij}| \\leq \\norm{A}_F \\leq \\sqrt{nm} \\max_{ij} |a_{ij}|,$$ where $\\norm{A}_F$ denotes the Frobenius norm of $A$, namel..."
      target = LeanTarget "lem_frobeniusnorm" "theorem" span
  in TheoremIR
       { theoremId = "theorem_lem_frobeniusnorm"
       , theoremStatement = "Lemma 252. For every matrix $A$ of size $n \\times m$ it holds that $$\\max_{ij} |a_{ij}| \\leq \\norm{A}_F \\leq \\sqrt{nm} \\max_{ij} |a_{ij}|,$$ where $\\norm{A}_F$ denotes the Frobenius norm of $A$, namel..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "lemma"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_122_prop_neumannseries :: TheoremIR
theorem_122_prop_neumannseries =
  let span = (SourceSpan "theorem_graph.json" "prop:neumannseries" "prop:neumannseries" "sec-14-2-2" "Lemma 253. Let $X$ be some matrix such that $\\norm{X} < 1$ for some matrix norm $\\norm{\\cdot}$. Then $(\\mathds{1}-X)$ is non-singular and $$(\\mathds{1} - X)^{-1} = \\sum_{k = 0}^{\\infty} X^k.$$")
      conclusion = Equals (RawTerm "unknown_term: Lemma 253. Let $X$ be some matrix such that $\\norm{X} < 1$ for some matrix norm $\\norm{\\cdot}$. Then $(\\mathds{1}-X)$ is non-singular and $$(\\mathds{1} - X)^{-1}" span) (RawTerm "unknown_term: \\sum_{k = 0}^{\\infty} X^k.$$" span)
      target = LeanTarget "prop_neumannseries" "theorem" span
  in TheoremIR
       { theoremId = "theorem_prop_neumannseries"
       , theoremStatement = "Lemma 253. Let $X$ be some matrix such that $\\norm{X} < 1$ for some matrix norm $\\norm{\\cdot}$. Then $(\\mathds{1}-X)$ is non-singular and $$(\\mathds{1} - X)^{-1} = \\sum_{k = 0}^{\\infty} X^k.$$"
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "lemma"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_123_prop_boundinversemetric :: TheoremIR
theorem_123_prop_boundinversemetric =
  let span = (SourceSpan "theorem_graph.json" "prop:boundinversemetric" "prop:boundinversemetric" "sec-14-2-2" "Proposition 254. Let $(M, g)$ be a complete and connected $d$-dimensional Riemannian manifold which is also a symmetric space. Let $p \\in M$ be a fixed point and let us consider normal coordinates cen...")
      conclusion = SemanticGap span "Proposition 254. Let $(M, g)$ be a complete and connected $d$-dimensional Riemannian manifold which is also a symmetric space. Let $p \\in M$ be a fixed point and let us consider normal coordinates cen..."
      target = LeanTarget "prop_boundinversemetric" "theorem" span
  in TheoremIR
       { theoremId = "theorem_prop_boundinversemetric"
       , theoremStatement = "Proposition 254. Let $(M, g)$ be a complete and connected $d$-dimensional Riemannian manifold which is also a symmetric space. Let $p \\in M$ be a fixed point and let us consider normal coordinates cen..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_124_prop_bounddermetric :: TheoremIR
theorem_124_prop_bounddermetric =
  let span = (SourceSpan "theorem_graph.json" "prop:bounddermetric" "prop:bounddermetric" "sec-14-2-2" "Proposition 255. Let $(M, g)$ be a complete and connected $d$-dimensional Riemannian manifold which is also a symmetric space. Let $p \\in M$ be a fixed point and let us consider normal coordinates cen...")
      conclusion = SemanticGap span "Proposition 255. Let $(M, g)$ be a complete and connected $d$-dimensional Riemannian manifold which is also a symmetric space. Let $p \\in M$ be a fixed point and let us consider normal coordinates cen..."
      target = LeanTarget "prop_bounddermetric" "theorem" span
  in TheoremIR
       { theoremId = "theorem_prop_bounddermetric"
       , theoremStatement = "Proposition 255. Let $(M, g)$ be a complete and connected $d$-dimensional Riemannian manifold which is also a symmetric space. Let $p \\in M$ be a fixed point and let us consider normal coordinates cen..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_125_thm_lowerboundlaplacianr :: TheoremIR
theorem_125_thm_lowerboundlaplacianr =
  let span = (SourceSpan "theorem_graph.json" "thm:lowerboundlaplacianr" "thm:lowerboundlaplacianr" "sec-14-2-2" "Proposition 256 (Upper bound on the absolute value of the Laplacian of $\\tilde r_{p, v}$). Let $(M, g)$ be a complete and connected $d$-dimensional Riemannian manifold, which is also a symmetric space...")
      conclusion = SemanticGap span "Proposition 256 (Upper bound on the absolute value of the Laplacian of $\\tilde r_{p, v}$). Let $(M, g)$ be a complete and connected $d$-dimensional Riemannian manifold, which is also a symmetric space..."
      target = LeanTarget "thm_lowerboundlaplacianr" "theorem" span
  in TheoremIR
       { theoremId = "theorem_thm_lowerboundlaplacianr"
       , theoremStatement = "Proposition 256 (Upper bound on the absolute value of the Laplacian of $\\tilde r_{p, v}$). Let $(M, g)$ be a complete and connected $d$-dimensional Riemannian manifold, which is also a symmetric space..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "bound"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_126_auxlemma2 :: TheoremIR
theorem_126_auxlemma2 =
  let span = (SourceSpan "theorem_graph.json" "AuxLemma2" "AuxLemma2" "sec-14-3" "Lemma 257. Let $(M, g)$ be a complete and connected Riemannian manifold which is also a symmetric space of dimension $d$. Let $p \\in M$ be a fixed point and let us consider normal coordinates centered...")
      conclusion = SemanticGap span "Lemma 257. Let $(M, g)$ be a complete and connected Riemannian manifold which is also a symmetric space of dimension $d$. Let $p \\in M$ be a fixed point and let us consider normal coordinates centered..."
      target = LeanTarget "AuxLemma2" "theorem" span
  in TheoremIR
       { theoremId = "theorem_AuxLemma2"
       , theoremStatement = "Lemma 257. Let $(M, g)$ be a complete and connected Riemannian manifold which is also a symmetric space of dimension $d$. Let $p \\in M$ be a fixed point and let us consider normal coordinates centered..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "lemma"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_127_rem_projectecrtilde :: TheoremIR
theorem_127_rem_projectecrtilde =
  let span = (SourceSpan "theorem_graph.json" "rem:projectecrtilde" "rem:projectecrtilde" "sec-14-4-1" "Proposition 260. Let $\\pi: (M, g) \\to (B, h)$ be a surjective Riemannian submersion. Let $p \\in B$ and let $z \\in \\pi^{-1}(p)$ be fixed. Let $\\alpha \\leq \\min\\{i(M), i(B)\\}$. Then for every $q \\in \\ma...")
      conclusion = SemanticGap span "Proposition 260. Let $\\pi: (M, g) \\to (B, h)$ be a surjective Riemannian submersion. Let $p \\in B$ and let $z \\in \\pi^{-1}(p)$ be fixed. Let $\\alpha \\leq \\min\\{i(M), i(B)\\}$. Then for every $q \\in \\ma..."
      target = LeanTarget "rem_projectecrtilde" "theorem" span
  in TheoremIR
       { theoremId = "theorem_rem_projectecrtilde"
       , theoremStatement = "Proposition 260. Let $\\pi: (M, g) \\to (B, h)$ be a surjective Riemannian submersion. Let $p \\in B$ and let $z \\in \\pi^{-1}(p)$ be fixed. Let $\\alpha \\leq \\min\\{i(M), i(B)\\}$. Then for every $q \\in \\ma..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindTheorem
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_128_thm_322 :: TheoremIR
theorem_128_thm_322 =
  let span = (SourceSpan "theorem_graph.json" "thm-322" "thm-322" "sec-14-4-1" "As we mentioned earlier, to obtain the above bounds, we will first obtain a lifted version of $\\tilde r_{p, v}$, which we will denote $\\tilde r^M_{z, v}$. We will then use the results from [\\[sec:boun...")
      conclusion = SemanticGap span "As we mentioned earlier, to obtain the above bounds, we will first obtain a lifted version of $\\tilde r_{p, v}$, which we will denote $\\tilde r^M_{z, v}$. We will then use the results from [\\[sec:boun..."
      target = LeanTarget "thm_322" "theorem" span
  in TheoremIR
       { theoremId = "theorem_thm_322"
       , theoremStatement = "As we mentioned earlier, to obtain the above bounds, we will first obtain a lifted version of $\\tilde r_{p, v}$, which we will denote $\\tilde r^M_{z, v}$. We will then use the results from [\\[sec:boun..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "bound"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_129_lem_projectedh :: TheoremIR
theorem_129_lem_projectedh =
  let span = (SourceSpan "theorem_graph.json" "lem:projectedH" "lem:projectedH" "sec-14-4-2" "Lemma 262. In the same setting as for [261](#AuxLemma3){reference-type=\"ref+label\" reference=\"AuxLemma3\"}, let $p \\in B$ be a fixed saddle point of $\\tilde F$, and let $z \\in \\pi^{-1}(p)$. Let $$H^M_z...")
      conclusion = SemanticGap span "Lemma 262. In the same setting as for [261](#AuxLemma3){reference-type=\"ref+label\" reference=\"AuxLemma3\"}, let $p \\in B$ be a fixed saddle point of $\\tilde F$, and let $z \\in \\pi^{-1}(p)$. Let $$H^M_z..."
      target = LeanTarget "lem_projectedH" "theorem" span
  in TheoremIR
       { theoremId = "theorem_lem_projectedH"
       , theoremStatement = "Lemma 262. In the same setting as for [261](#AuxLemma3){reference-type=\"ref+label\" reference=\"AuxLemma3\"}, let $p \\in B$ be a fixed saddle point of $\\tilde F$, and let $z \\in \\pi^{-1}(p)$. Let $$H^M_z..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "lemma"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_130_lem_identityexpressionofinterest :: TheoremIR
theorem_130_lem_identityexpressionofinterest =
  let span = (SourceSpan "theorem_graph.json" "lem:identityexpressionofinterest" "lem:identityexpressionofinterest" "sec-14-4-2" "Lemma 263. In the same setting as for [261](#AuxLemma3){reference-type=\"ref+label\" reference=\"AuxLemma3\"}, let $p \\in B$ be a fixed saddle point of $\\tilde F$, and let $z \\in \\pi^{-1}(p)$ be fixed. Th...")
      conclusion = SemanticGap span "Lemma 263. In the same setting as for [261](#AuxLemma3){reference-type=\"ref+label\" reference=\"AuxLemma3\"}, let $p \\in B$ be a fixed saddle point of $\\tilde F$, and let $z \\in \\pi^{-1}(p)$ be fixed. Th..."
      target = LeanTarget "lem_identityexpressionofinterest" "theorem" span
  in TheoremIR
       { theoremId = "theorem_lem_identityexpressionofinterest"
       , theoremStatement = "Lemma 263. In the same setting as for [261](#AuxLemma3){reference-type=\"ref+label\" reference=\"AuxLemma3\"}, let $p \\in B$ be a fixed saddle point of $\\tilde F$, and let $z \\in \\pi^{-1}(p)$ be fixed. Th..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "lemma"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_131_lem_ultimateboundexpressionofinterest :: TheoremIR
theorem_131_lem_ultimateboundexpressionofinterest =
  let span = (SourceSpan "theorem_graph.json" "lem:ultimateboundexpressionofinterest" "lem:ultimateboundexpressionofinterest" "sec-14-4-2" "Lemma 264. In the same setting as for [261](#AuxLemma3){reference-type=\"ref+label\" reference=\"AuxLemma3\"}, let $p \\in B$ be a fixed saddle point of $\\tilde F$, and let $z \\in \\pi^{-1}(p)$ be fixed. Th...")
      conclusion = SemanticGap span "Lemma 264. In the same setting as for [261](#AuxLemma3){reference-type=\"ref+label\" reference=\"AuxLemma3\"}, let $p \\in B$ be a fixed saddle point of $\\tilde F$, and let $z \\in \\pi^{-1}(p)$ be fixed. Th..."
      target = LeanTarget "lem_ultimateboundexpressionofinterest" "theorem" span
  in TheoremIR
       { theoremId = "theorem_lem_ultimateboundexpressionofinterest"
       , theoremStatement = "Lemma 264. In the same setting as for [261](#AuxLemma3){reference-type=\"ref+label\" reference=\"AuxLemma3\"}, let $p \\in B$ be a fixed saddle point of $\\tilde F$, and let $z \\in \\pi^{-1}(p)$ be fixed. Th..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "lemma"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theorem_132_thm_335 :: TheoremIR
theorem_132_thm_335 =
  let span = (SourceSpan "theorem_graph.json" "thm-335" "thm-335" "sec-14-4-2" "We proceed in the same manner as in the previous section; to prove [261](#AuxLemma3){reference-type=\"ref+label\" reference=\"AuxLemma3\"} we will *lift* the expression $$\\begin{equation} \\label{eq:expres...")
      conclusion = SemanticGap span "We proceed in the same manner as in the previous section; to prove [261](#AuxLemma3){reference-type=\"ref+label\" reference=\"AuxLemma3\"} we will *lift* the expression $$\\begin{equation} \\label{eq:expres..."
      target = LeanTarget "thm_335" "theorem" span
  in TheoremIR
       { theoremId = "theorem_thm_335"
       , theoremStatement = "We proceed in the same manner as in the previous section; to prove [261](#AuxLemma3){reference-type=\"ref+label\" reference=\"AuxLemma3\"} we will *lift* the expression $$\\begin{equation} \\label{eq:expres..."
       , theoremSpan = span
       , theoremBinders = []
       , theoremAssumptions = []
       , theoremConclusion = conclusion
       , theoremTarget = target
       , theoremKind = KindOther "lemma"
       , theoremSemanticCategory = SemCatPlainTheorem
       , theoremFormalizationClass = FormalMath
       , theoremTranscriptionStatus = StatusPartial
       }

theoremTargets :: [TheoremIR]
theoremTargets =
  [ theorem_1_thm_1
  , theorem_2_thm_2
  , theorem_3_thm_3
  , theorem_4_thm_maininformal2
  , theorem_5_thm_6
  , theorem_6_rem_explicitexprlangevin
  , theorem_7_thm_15
  , theorem_8_prop9_12
  , theorem_9_lemma9_8
  , theorem_10_cor9_3
  , theorem_11_rmk_assumptions
  , theorem_12_proposition10_55
  , theorem_13_lem_normdifferencegradfh
  , theorem_14_prop9_6
  , theorem_15_auxlemma1
  , theorem_16_lem_defbumpfunction
  , theorem_17_thm_fubinimanifolds
  , theorem_18_liftingsobolev
  , theorem_19_thm_lsiimplieshypercontract
  , theorem_20_boundinitialrelativeentropy
  , theorem_21_theorem9_13
  , theorem_22_target_9_14li
  , theorem_23_cotawasserstein
  , theorem_24_thm_mainformal1
  , theorem_25_thm_mainformal2
  , theorem_26_lem_firstlemsubopt
  , theorem_27_thm_88
  , theorem_28_thm_91
  , theorem_29_thm_nolocalminimatraceratio
  , theorem_30_thm_simultdiag
  , theorem_31_thm_103
  , theorem_32_thm_104
  , theorem_33_prop_isomsus
  , theorem_34_lemmamatrixtheory
  , theorem_35_productrulegradient
  , theorem_36_thm_113
  , theorem_37_lem_distancecriticalpoints
  , theorem_38_lem_escapingeigenvalueising
  , theorem_39_lem_hessiandefpos
  , theorem_40_thm_124
  , theorem_41_prop_liealgebracident
  , theorem_42_propinvvectorfields1
  , theorem_43_propinvvectorfields2
  , theorem_44_metrica
  , theorem_45_thm_132
  , theorem_46_curvliegroups
  , theorem_47_killingliegroups
  , theorem_48_lemacurvaturaun
  , theorem_49_lemacurvaturasun
  , theorem_50_prop_boundriemanntensorliegroup
  , theorem_51_productmanifoldsmetric
  , theorem_52_riemannprod
  , theorem_53_curvproduct
  , theorem_54_producteinstein
  , theorem_55_def_normalcoordinates
  , theorem_56_lemmahorizontalgeodesics
  , theorem_57_prop_submersionsubmetry
  , theorem_58_existenceriemanniansubmersionmetrics
  , theorem_59_thm_171
  , theorem_60_geodesicstotallygeodesic
  , theorem_61_curvaturasubmersion
  , theorem_62_remarkcurvaturasubmersion
  , theorem_63_vanishingt
  , theorem_64_prop_inducedtotgeodfibers
  , theorem_65_horizontalleftinvariant
  , theorem_66_curvstiefel
  , theorem_67_prop_curvgrassmann
  , theorem_68_prop_gradientprojectedfunction
  , theorem_69_thm_191
  , theorem_70_prop_projectedhessian
  , theorem_71_prop_kernelofhessian
  , theorem_72_prop_equalityhessians
  , theorem_73_prop_laplacianriemanniansubmersion
  , theorem_74_def_paralleltransport
  , theorem_75_lem_paralleltransportandrs
  , theorem_76_prop_preservationoflipschitz
  , theorem_77_sectionalcurvatureofsphere
  , theorem_78_shortestperiodicgeodun
  , theorem_79_thm_208
  , theorem_80_cor_injectivityradii
  , theorem_81_diametersubmersion
  , theorem_82_diameterproduct
  , theorem_83_thm_215
  , theorem_84_diamsun
  , theorem_85_diamun
  , theorem_86_lem_nestedlp
  , theorem_87_propdiv
  , theorem_88_divtheo
  , theorem_89_equivlpspaces
  , theorem_90_equivsobolev
  , theorem_91_thm_235
  , theorem_92_lem_explicitsecondorder
  , theorem_93_thm_240
  , theorem_94_thm_boundneumanneigval
  , theorem_95_rmk_generalisedito
  , theorem_96_prop_quadraticvariationsemimartingale
  , theorem_97_prop_identifyvariation
  , theorem_98_prop_identifymartingale
  , theorem_99_prop_existencesol
  , theorem_100_prop_itolemmar
  , theorem_101_prop_markovsineq
  , theorem_102_prop_comparisonthm
  , theorem_103_rellichkondrachov
  , theorem_104_fredholm
  , theorem_105_laxmilgram
  , theorem_106_theoremaexistencianuestraedp
  , theorem_107_firsttheorem
  , theorem_108_secondtheorem
  , theorem_109_existenciaevans
  , theorem_110_thm_283
  , theorem_111_regularvaluesdense
  , theorem_112_rem_laplaciannotpositive
  , theorem_113_thm_288
  , theorem_114_thm_taylorexpansionmetric
  , theorem_115_lem_pushforwardandcovariant
  , theorem_116_lem_covariantderivativeszero
  , theorem_117_thm_297
  , theorem_118_prop_explicitexpresisonmetricderivatives
  , theorem_119_prop_explicitexpresisoninversemetricderivatives
  , theorem_120_prop_boundmetricterms
  , theorem_121_lem_frobeniusnorm
  , theorem_122_prop_neumannseries
  , theorem_123_prop_boundinversemetric
  , theorem_124_prop_bounddermetric
  , theorem_125_thm_lowerboundlaplacianr
  , theorem_126_auxlemma2
  , theorem_127_rem_projectecrtilde
  , theorem_128_thm_322
  , theorem_129_lem_projectedh
  , theorem_130_lem_identityexpressionofinterest
  , theorem_131_lem_ultimateboundexpressionofinterest
  , theorem_132_thm_335
  ]

claims :: [ClaimIR]
claims =
  [ ClaimIR (theoremId theorem_1_thm_1) (theoremStatement theorem_1_thm_1) (theoremSpan theorem_1_thm_1) SemCatPlainTheorem (Just theorem_1_thm_1)
  , ClaimIR (theoremId theorem_2_thm_2) (theoremStatement theorem_2_thm_2) (theoremSpan theorem_2_thm_2) SemCatPlainTheorem (Just theorem_2_thm_2)
  , ClaimIR (theoremId theorem_3_thm_3) (theoremStatement theorem_3_thm_3) (theoremSpan theorem_3_thm_3) SemCatPlainTheorem (Just theorem_3_thm_3)
  , ClaimIR (theoremId theorem_4_thm_maininformal2) (theoremStatement theorem_4_thm_maininformal2) (theoremSpan theorem_4_thm_maininformal2) SemCatPlainTheorem (Just theorem_4_thm_maininformal2)
  , ClaimIR (theoremId theorem_5_thm_6) (theoremStatement theorem_5_thm_6) (theoremSpan theorem_5_thm_6) SemCatPlainTheorem (Just theorem_5_thm_6)
  , ClaimIR (theoremId theorem_6_rem_explicitexprlangevin) (theoremStatement theorem_6_rem_explicitexprlangevin) (theoremSpan theorem_6_rem_explicitexprlangevin) SemCatPlainTheorem (Just theorem_6_rem_explicitexprlangevin)
  , ClaimIR (theoremId theorem_7_thm_15) (theoremStatement theorem_7_thm_15) (theoremSpan theorem_7_thm_15) SemCatPlainTheorem (Just theorem_7_thm_15)
  , ClaimIR (theoremId theorem_8_prop9_12) (theoremStatement theorem_8_prop9_12) (theoremSpan theorem_8_prop9_12) SemCatPlainTheorem (Just theorem_8_prop9_12)
  , ClaimIR (theoremId theorem_9_lemma9_8) (theoremStatement theorem_9_lemma9_8) (theoremSpan theorem_9_lemma9_8) SemCatPlainTheorem (Just theorem_9_lemma9_8)
  , ClaimIR (theoremId theorem_10_cor9_3) (theoremStatement theorem_10_cor9_3) (theoremSpan theorem_10_cor9_3) SemCatPlainTheorem (Just theorem_10_cor9_3)
  , ClaimIR (theoremId theorem_11_rmk_assumptions) (theoremStatement theorem_11_rmk_assumptions) (theoremSpan theorem_11_rmk_assumptions) SemCatPlainTheorem (Just theorem_11_rmk_assumptions)
  , ClaimIR (theoremId theorem_12_proposition10_55) (theoremStatement theorem_12_proposition10_55) (theoremSpan theorem_12_proposition10_55) SemCatPlainTheorem (Just theorem_12_proposition10_55)
  , ClaimIR (theoremId theorem_13_lem_normdifferencegradfh) (theoremStatement theorem_13_lem_normdifferencegradfh) (theoremSpan theorem_13_lem_normdifferencegradfh) SemCatPlainTheorem (Just theorem_13_lem_normdifferencegradfh)
  , ClaimIR (theoremId theorem_14_prop9_6) (theoremStatement theorem_14_prop9_6) (theoremSpan theorem_14_prop9_6) SemCatPlainTheorem (Just theorem_14_prop9_6)
  , ClaimIR (theoremId theorem_15_auxlemma1) (theoremStatement theorem_15_auxlemma1) (theoremSpan theorem_15_auxlemma1) SemCatPlainTheorem (Just theorem_15_auxlemma1)
  , ClaimIR (theoremId theorem_16_lem_defbumpfunction) (theoremStatement theorem_16_lem_defbumpfunction) (theoremSpan theorem_16_lem_defbumpfunction) SemCatPlainTheorem (Just theorem_16_lem_defbumpfunction)
  , ClaimIR (theoremId theorem_17_thm_fubinimanifolds) (theoremStatement theorem_17_thm_fubinimanifolds) (theoremSpan theorem_17_thm_fubinimanifolds) SemCatPlainTheorem (Just theorem_17_thm_fubinimanifolds)
  , ClaimIR (theoremId theorem_18_liftingsobolev) (theoremStatement theorem_18_liftingsobolev) (theoremSpan theorem_18_liftingsobolev) SemCatPlainTheorem (Just theorem_18_liftingsobolev)
  , ClaimIR (theoremId theorem_19_thm_lsiimplieshypercontract) (theoremStatement theorem_19_thm_lsiimplieshypercontract) (theoremSpan theorem_19_thm_lsiimplieshypercontract) SemCatPlainTheorem (Just theorem_19_thm_lsiimplieshypercontract)
  , ClaimIR (theoremId theorem_20_boundinitialrelativeentropy) (theoremStatement theorem_20_boundinitialrelativeentropy) (theoremSpan theorem_20_boundinitialrelativeentropy) SemCatPlainTheorem (Just theorem_20_boundinitialrelativeentropy)
  , ClaimIR (theoremId theorem_21_theorem9_13) (theoremStatement theorem_21_theorem9_13) (theoremSpan theorem_21_theorem9_13) SemCatPlainTheorem (Just theorem_21_theorem9_13)
  , ClaimIR (theoremId theorem_22_target_9_14li) (theoremStatement theorem_22_target_9_14li) (theoremSpan theorem_22_target_9_14li) SemCatPlainTheorem (Just theorem_22_target_9_14li)
  , ClaimIR (theoremId theorem_23_cotawasserstein) (theoremStatement theorem_23_cotawasserstein) (theoremSpan theorem_23_cotawasserstein) SemCatPlainTheorem (Just theorem_23_cotawasserstein)
  , ClaimIR (theoremId theorem_24_thm_mainformal1) (theoremStatement theorem_24_thm_mainformal1) (theoremSpan theorem_24_thm_mainformal1) SemCatPlainTheorem (Just theorem_24_thm_mainformal1)
  , ClaimIR (theoremId theorem_25_thm_mainformal2) (theoremStatement theorem_25_thm_mainformal2) (theoremSpan theorem_25_thm_mainformal2) SemCatPlainTheorem (Just theorem_25_thm_mainformal2)
  , ClaimIR (theoremId theorem_26_lem_firstlemsubopt) (theoremStatement theorem_26_lem_firstlemsubopt) (theoremSpan theorem_26_lem_firstlemsubopt) SemCatPlainTheorem (Just theorem_26_lem_firstlemsubopt)
  , ClaimIR (theoremId theorem_27_thm_88) (theoremStatement theorem_27_thm_88) (theoremSpan theorem_27_thm_88) SemCatPlainTheorem (Just theorem_27_thm_88)
  , ClaimIR (theoremId theorem_28_thm_91) (theoremStatement theorem_28_thm_91) (theoremSpan theorem_28_thm_91) SemCatPlainTheorem (Just theorem_28_thm_91)
  , ClaimIR (theoremId theorem_29_thm_nolocalminimatraceratio) (theoremStatement theorem_29_thm_nolocalminimatraceratio) (theoremSpan theorem_29_thm_nolocalminimatraceratio) SemCatPlainTheorem (Just theorem_29_thm_nolocalminimatraceratio)
  , ClaimIR (theoremId theorem_30_thm_simultdiag) (theoremStatement theorem_30_thm_simultdiag) (theoremSpan theorem_30_thm_simultdiag) SemCatPlainTheorem (Just theorem_30_thm_simultdiag)
  , ClaimIR (theoremId theorem_31_thm_103) (theoremStatement theorem_31_thm_103) (theoremSpan theorem_31_thm_103) SemCatPlainTheorem (Just theorem_31_thm_103)
  , ClaimIR (theoremId theorem_32_thm_104) (theoremStatement theorem_32_thm_104) (theoremSpan theorem_32_thm_104) SemCatPlainTheorem (Just theorem_32_thm_104)
  , ClaimIR (theoremId theorem_33_prop_isomsus) (theoremStatement theorem_33_prop_isomsus) (theoremSpan theorem_33_prop_isomsus) SemCatInvariantPreservation (Just theorem_33_prop_isomsus)
  , ClaimIR (theoremId theorem_34_lemmamatrixtheory) (theoremStatement theorem_34_lemmamatrixtheory) (theoremSpan theorem_34_lemmamatrixtheory) SemCatPlainTheorem (Just theorem_34_lemmamatrixtheory)
  , ClaimIR (theoremId theorem_35_productrulegradient) (theoremStatement theorem_35_productrulegradient) (theoremSpan theorem_35_productrulegradient) SemCatPlainTheorem (Just theorem_35_productrulegradient)
  , ClaimIR (theoremId theorem_36_thm_113) (theoremStatement theorem_36_thm_113) (theoremSpan theorem_36_thm_113) SemCatPlainTheorem (Just theorem_36_thm_113)
  , ClaimIR (theoremId theorem_37_lem_distancecriticalpoints) (theoremStatement theorem_37_lem_distancecriticalpoints) (theoremSpan theorem_37_lem_distancecriticalpoints) SemCatPlainTheorem (Just theorem_37_lem_distancecriticalpoints)
  , ClaimIR (theoremId theorem_38_lem_escapingeigenvalueising) (theoremStatement theorem_38_lem_escapingeigenvalueising) (theoremSpan theorem_38_lem_escapingeigenvalueising) SemCatPlainTheorem (Just theorem_38_lem_escapingeigenvalueising)
  , ClaimIR (theoremId theorem_39_lem_hessiandefpos) (theoremStatement theorem_39_lem_hessiandefpos) (theoremSpan theorem_39_lem_hessiandefpos) SemCatPlainTheorem (Just theorem_39_lem_hessiandefpos)
  , ClaimIR (theoremId theorem_40_thm_124) (theoremStatement theorem_40_thm_124) (theoremSpan theorem_40_thm_124) SemCatPlainTheorem (Just theorem_40_thm_124)
  , ClaimIR (theoremId theorem_41_prop_liealgebracident) (theoremStatement theorem_41_prop_liealgebracident) (theoremSpan theorem_41_prop_liealgebracident) SemCatPlainTheorem (Just theorem_41_prop_liealgebracident)
  , ClaimIR (theoremId theorem_42_propinvvectorfields1) (theoremStatement theorem_42_propinvvectorfields1) (theoremSpan theorem_42_propinvvectorfields1) SemCatInvariantPreservation (Just theorem_42_propinvvectorfields1)
  , ClaimIR (theoremId theorem_43_propinvvectorfields2) (theoremStatement theorem_43_propinvvectorfields2) (theoremSpan theorem_43_propinvvectorfields2) SemCatPlainTheorem (Just theorem_43_propinvvectorfields2)
  , ClaimIR (theoremId theorem_44_metrica) (theoremStatement theorem_44_metrica) (theoremSpan theorem_44_metrica) SemCatInvariantPreservation (Just theorem_44_metrica)
  , ClaimIR (theoremId theorem_45_thm_132) (theoremStatement theorem_45_thm_132) (theoremSpan theorem_45_thm_132) SemCatInvariantPreservation (Just theorem_45_thm_132)
  , ClaimIR (theoremId theorem_46_curvliegroups) (theoremStatement theorem_46_curvliegroups) (theoremSpan theorem_46_curvliegroups) SemCatInvariantPreservation (Just theorem_46_curvliegroups)
  , ClaimIR (theoremId theorem_47_killingliegroups) (theoremStatement theorem_47_killingliegroups) (theoremSpan theorem_47_killingliegroups) SemCatPlainTheorem (Just theorem_47_killingliegroups)
  , ClaimIR (theoremId theorem_48_lemacurvaturaun) (theoremStatement theorem_48_lemacurvaturaun) (theoremSpan theorem_48_lemacurvaturaun) SemCatInvariantPreservation (Just theorem_48_lemacurvaturaun)
  , ClaimIR (theoremId theorem_49_lemacurvaturasun) (theoremStatement theorem_49_lemacurvaturasun) (theoremSpan theorem_49_lemacurvaturasun) SemCatInvariantPreservation (Just theorem_49_lemacurvaturasun)
  , ClaimIR (theoremId theorem_50_prop_boundriemanntensorliegroup) (theoremStatement theorem_50_prop_boundriemanntensorliegroup) (theoremSpan theorem_50_prop_boundriemanntensorliegroup) SemCatInvariantPreservation (Just theorem_50_prop_boundriemanntensorliegroup)
  , ClaimIR (theoremId theorem_51_productmanifoldsmetric) (theoremStatement theorem_51_productmanifoldsmetric) (theoremSpan theorem_51_productmanifoldsmetric) SemCatPlainTheorem (Just theorem_51_productmanifoldsmetric)
  , ClaimIR (theoremId theorem_52_riemannprod) (theoremStatement theorem_52_riemannprod) (theoremSpan theorem_52_riemannprod) SemCatPlainTheorem (Just theorem_52_riemannprod)
  , ClaimIR (theoremId theorem_53_curvproduct) (theoremStatement theorem_53_curvproduct) (theoremSpan theorem_53_curvproduct) SemCatPlainTheorem (Just theorem_53_curvproduct)
  , ClaimIR (theoremId theorem_54_producteinstein) (theoremStatement theorem_54_producteinstein) (theoremSpan theorem_54_producteinstein) SemCatPlainTheorem (Just theorem_54_producteinstein)
  , ClaimIR (theoremId theorem_55_def_normalcoordinates) (theoremStatement theorem_55_def_normalcoordinates) (theoremSpan theorem_55_def_normalcoordinates) SemCatPlainTheorem (Just theorem_55_def_normalcoordinates)
  , ClaimIR (theoremId theorem_56_lemmahorizontalgeodesics) (theoremStatement theorem_56_lemmahorizontalgeodesics) (theoremSpan theorem_56_lemmahorizontalgeodesics) SemCatPlainTheorem (Just theorem_56_lemmahorizontalgeodesics)
  , ClaimIR (theoremId theorem_57_prop_submersionsubmetry) (theoremStatement theorem_57_prop_submersionsubmetry) (theoremSpan theorem_57_prop_submersionsubmetry) SemCatPlainTheorem (Just theorem_57_prop_submersionsubmetry)
  , ClaimIR (theoremId theorem_58_existenceriemanniansubmersionmetrics) (theoremStatement theorem_58_existenceriemanniansubmersionmetrics) (theoremSpan theorem_58_existenceriemanniansubmersionmetrics) SemCatPlainTheorem (Just theorem_58_existenceriemanniansubmersionmetrics)
  , ClaimIR (theoremId theorem_59_thm_171) (theoremStatement theorem_59_thm_171) (theoremSpan theorem_59_thm_171) SemCatPlainTheorem (Just theorem_59_thm_171)
  , ClaimIR (theoremId theorem_60_geodesicstotallygeodesic) (theoremStatement theorem_60_geodesicstotallygeodesic) (theoremSpan theorem_60_geodesicstotallygeodesic) SemCatPlainTheorem (Just theorem_60_geodesicstotallygeodesic)
  , ClaimIR (theoremId theorem_61_curvaturasubmersion) (theoremStatement theorem_61_curvaturasubmersion) (theoremSpan theorem_61_curvaturasubmersion) SemCatPlainTheorem (Just theorem_61_curvaturasubmersion)
  , ClaimIR (theoremId theorem_62_remarkcurvaturasubmersion) (theoremStatement theorem_62_remarkcurvaturasubmersion) (theoremSpan theorem_62_remarkcurvaturasubmersion) SemCatPlainTheorem (Just theorem_62_remarkcurvaturasubmersion)
  , ClaimIR (theoremId theorem_63_vanishingt) (theoremStatement theorem_63_vanishingt) (theoremSpan theorem_63_vanishingt) SemCatPlainTheorem (Just theorem_63_vanishingt)
  , ClaimIR (theoremId theorem_64_prop_inducedtotgeodfibers) (theoremStatement theorem_64_prop_inducedtotgeodfibers) (theoremSpan theorem_64_prop_inducedtotgeodfibers) SemCatPlainTheorem (Just theorem_64_prop_inducedtotgeodfibers)
  , ClaimIR (theoremId theorem_65_horizontalleftinvariant) (theoremStatement theorem_65_horizontalleftinvariant) (theoremSpan theorem_65_horizontalleftinvariant) SemCatInvariantPreservation (Just theorem_65_horizontalleftinvariant)
  , ClaimIR (theoremId theorem_66_curvstiefel) (theoremStatement theorem_66_curvstiefel) (theoremSpan theorem_66_curvstiefel) SemCatInvariantPreservation (Just theorem_66_curvstiefel)
  , ClaimIR (theoremId theorem_67_prop_curvgrassmann) (theoremStatement theorem_67_prop_curvgrassmann) (theoremSpan theorem_67_prop_curvgrassmann) SemCatInvariantPreservation (Just theorem_67_prop_curvgrassmann)
  , ClaimIR (theoremId theorem_68_prop_gradientprojectedfunction) (theoremStatement theorem_68_prop_gradientprojectedfunction) (theoremSpan theorem_68_prop_gradientprojectedfunction) SemCatPlainTheorem (Just theorem_68_prop_gradientprojectedfunction)
  , ClaimIR (theoremId theorem_69_thm_191) (theoremStatement theorem_69_thm_191) (theoremSpan theorem_69_thm_191) SemCatPlainTheorem (Just theorem_69_thm_191)
  , ClaimIR (theoremId theorem_70_prop_projectedhessian) (theoremStatement theorem_70_prop_projectedhessian) (theoremSpan theorem_70_prop_projectedhessian) SemCatPlainTheorem (Just theorem_70_prop_projectedhessian)
  , ClaimIR (theoremId theorem_71_prop_kernelofhessian) (theoremStatement theorem_71_prop_kernelofhessian) (theoremSpan theorem_71_prop_kernelofhessian) SemCatPlainTheorem (Just theorem_71_prop_kernelofhessian)
  , ClaimIR (theoremId theorem_72_prop_equalityhessians) (theoremStatement theorem_72_prop_equalityhessians) (theoremSpan theorem_72_prop_equalityhessians) SemCatPlainTheorem (Just theorem_72_prop_equalityhessians)
  , ClaimIR (theoremId theorem_73_prop_laplacianriemanniansubmersion) (theoremStatement theorem_73_prop_laplacianriemanniansubmersion) (theoremSpan theorem_73_prop_laplacianriemanniansubmersion) SemCatPlainTheorem (Just theorem_73_prop_laplacianriemanniansubmersion)
  , ClaimIR (theoremId theorem_74_def_paralleltransport) (theoremStatement theorem_74_def_paralleltransport) (theoremSpan theorem_74_def_paralleltransport) SemCatPlainTheorem (Just theorem_74_def_paralleltransport)
  , ClaimIR (theoremId theorem_75_lem_paralleltransportandrs) (theoremStatement theorem_75_lem_paralleltransportandrs) (theoremSpan theorem_75_lem_paralleltransportandrs) SemCatPlainTheorem (Just theorem_75_lem_paralleltransportandrs)
  , ClaimIR (theoremId theorem_76_prop_preservationoflipschitz) (theoremStatement theorem_76_prop_preservationoflipschitz) (theoremSpan theorem_76_prop_preservationoflipschitz) SemCatPlainTheorem (Just theorem_76_prop_preservationoflipschitz)
  , ClaimIR (theoremId theorem_77_sectionalcurvatureofsphere) (theoremStatement theorem_77_sectionalcurvatureofsphere) (theoremSpan theorem_77_sectionalcurvatureofsphere) SemCatPlainTheorem (Just theorem_77_sectionalcurvatureofsphere)
  , ClaimIR (theoremId theorem_78_shortestperiodicgeodun) (theoremStatement theorem_78_shortestperiodicgeodun) (theoremSpan theorem_78_shortestperiodicgeodun) SemCatInvariantPreservation (Just theorem_78_shortestperiodicgeodun)
  , ClaimIR (theoremId theorem_79_thm_208) (theoremStatement theorem_79_thm_208) (theoremSpan theorem_79_thm_208) SemCatInvariantPreservation (Just theorem_79_thm_208)
  , ClaimIR (theoremId theorem_80_cor_injectivityradii) (theoremStatement theorem_80_cor_injectivityradii) (theoremSpan theorem_80_cor_injectivityradii) SemCatPlainTheorem (Just theorem_80_cor_injectivityradii)
  , ClaimIR (theoremId theorem_81_diametersubmersion) (theoremStatement theorem_81_diametersubmersion) (theoremSpan theorem_81_diametersubmersion) SemCatPlainTheorem (Just theorem_81_diametersubmersion)
  , ClaimIR (theoremId theorem_82_diameterproduct) (theoremStatement theorem_82_diameterproduct) (theoremSpan theorem_82_diameterproduct) SemCatPlainTheorem (Just theorem_82_diameterproduct)
  , ClaimIR (theoremId theorem_83_thm_215) (theoremStatement theorem_83_thm_215) (theoremSpan theorem_83_thm_215) SemCatPlainTheorem (Just theorem_83_thm_215)
  , ClaimIR (theoremId theorem_84_diamsun) (theoremStatement theorem_84_diamsun) (theoremSpan theorem_84_diamsun) SemCatInvariantPreservation (Just theorem_84_diamsun)
  , ClaimIR (theoremId theorem_85_diamun) (theoremStatement theorem_85_diamun) (theoremSpan theorem_85_diamun) SemCatInvariantPreservation (Just theorem_85_diamun)
  , ClaimIR (theoremId theorem_86_lem_nestedlp) (theoremStatement theorem_86_lem_nestedlp) (theoremSpan theorem_86_lem_nestedlp) SemCatPlainTheorem (Just theorem_86_lem_nestedlp)
  , ClaimIR (theoremId theorem_87_propdiv) (theoremStatement theorem_87_propdiv) (theoremSpan theorem_87_propdiv) SemCatPlainTheorem (Just theorem_87_propdiv)
  , ClaimIR (theoremId theorem_88_divtheo) (theoremStatement theorem_88_divtheo) (theoremSpan theorem_88_divtheo) SemCatPlainTheorem (Just theorem_88_divtheo)
  , ClaimIR (theoremId theorem_89_equivlpspaces) (theoremStatement theorem_89_equivlpspaces) (theoremSpan theorem_89_equivlpspaces) SemCatPlainTheorem (Just theorem_89_equivlpspaces)
  , ClaimIR (theoremId theorem_90_equivsobolev) (theoremStatement theorem_90_equivsobolev) (theoremSpan theorem_90_equivsobolev) SemCatPlainTheorem (Just theorem_90_equivsobolev)
  , ClaimIR (theoremId theorem_91_thm_235) (theoremStatement theorem_91_thm_235) (theoremSpan theorem_91_thm_235) SemCatPlainTheorem (Just theorem_91_thm_235)
  , ClaimIR (theoremId theorem_92_lem_explicitsecondorder) (theoremStatement theorem_92_lem_explicitsecondorder) (theoremSpan theorem_92_lem_explicitsecondorder) SemCatPlainTheorem (Just theorem_92_lem_explicitsecondorder)
  , ClaimIR (theoremId theorem_93_thm_240) (theoremStatement theorem_93_thm_240) (theoremSpan theorem_93_thm_240) SemCatPlainTheorem (Just theorem_93_thm_240)
  , ClaimIR (theoremId theorem_94_thm_boundneumanneigval) (theoremStatement theorem_94_thm_boundneumanneigval) (theoremSpan theorem_94_thm_boundneumanneigval) SemCatPlainTheorem (Just theorem_94_thm_boundneumanneigval)
  , ClaimIR (theoremId theorem_95_rmk_generalisedito) (theoremStatement theorem_95_rmk_generalisedito) (theoremSpan theorem_95_rmk_generalisedito) SemCatPlainTheorem (Just theorem_95_rmk_generalisedito)
  , ClaimIR (theoremId theorem_96_prop_quadraticvariationsemimartingale) (theoremStatement theorem_96_prop_quadraticvariationsemimartingale) (theoremSpan theorem_96_prop_quadraticvariationsemimartingale) SemCatPlainTheorem (Just theorem_96_prop_quadraticvariationsemimartingale)
  , ClaimIR (theoremId theorem_97_prop_identifyvariation) (theoremStatement theorem_97_prop_identifyvariation) (theoremSpan theorem_97_prop_identifyvariation) SemCatPlainTheorem (Just theorem_97_prop_identifyvariation)
  , ClaimIR (theoremId theorem_98_prop_identifymartingale) (theoremStatement theorem_98_prop_identifymartingale) (theoremSpan theorem_98_prop_identifymartingale) SemCatEquivalence (Just theorem_98_prop_identifymartingale)
  , ClaimIR (theoremId theorem_99_prop_existencesol) (theoremStatement theorem_99_prop_existencesol) (theoremSpan theorem_99_prop_existencesol) SemCatPlainTheorem (Just theorem_99_prop_existencesol)
  , ClaimIR (theoremId theorem_100_prop_itolemmar) (theoremStatement theorem_100_prop_itolemmar) (theoremSpan theorem_100_prop_itolemmar) SemCatPlainTheorem (Just theorem_100_prop_itolemmar)
  , ClaimIR (theoremId theorem_101_prop_markovsineq) (theoremStatement theorem_101_prop_markovsineq) (theoremSpan theorem_101_prop_markovsineq) SemCatPlainTheorem (Just theorem_101_prop_markovsineq)
  , ClaimIR (theoremId theorem_102_prop_comparisonthm) (theoremStatement theorem_102_prop_comparisonthm) (theoremSpan theorem_102_prop_comparisonthm) SemCatPlainTheorem (Just theorem_102_prop_comparisonthm)
  , ClaimIR (theoremId theorem_103_rellichkondrachov) (theoremStatement theorem_103_rellichkondrachov) (theoremSpan theorem_103_rellichkondrachov) SemCatPlainTheorem (Just theorem_103_rellichkondrachov)
  , ClaimIR (theoremId theorem_104_fredholm) (theoremStatement theorem_104_fredholm) (theoremSpan theorem_104_fredholm) SemCatPlainTheorem (Just theorem_104_fredholm)
  , ClaimIR (theoremId theorem_105_laxmilgram) (theoremStatement theorem_105_laxmilgram) (theoremSpan theorem_105_laxmilgram) SemCatPlainTheorem (Just theorem_105_laxmilgram)
  , ClaimIR (theoremId theorem_106_theoremaexistencianuestraedp) (theoremStatement theorem_106_theoremaexistencianuestraedp) (theoremSpan theorem_106_theoremaexistencianuestraedp) SemCatPlainTheorem (Just theorem_106_theoremaexistencianuestraedp)
  , ClaimIR (theoremId theorem_107_firsttheorem) (theoremStatement theorem_107_firsttheorem) (theoremSpan theorem_107_firsttheorem) SemCatPlainTheorem (Just theorem_107_firsttheorem)
  , ClaimIR (theoremId theorem_108_secondtheorem) (theoremStatement theorem_108_secondtheorem) (theoremSpan theorem_108_secondtheorem) SemCatPlainTheorem (Just theorem_108_secondtheorem)
  , ClaimIR (theoremId theorem_109_existenciaevans) (theoremStatement theorem_109_existenciaevans) (theoremSpan theorem_109_existenciaevans) SemCatPlainTheorem (Just theorem_109_existenciaevans)
  , ClaimIR (theoremId theorem_110_thm_283) (theoremStatement theorem_110_thm_283) (theoremSpan theorem_110_thm_283) SemCatPlainTheorem (Just theorem_110_thm_283)
  , ClaimIR (theoremId theorem_111_regularvaluesdense) (theoremStatement theorem_111_regularvaluesdense) (theoremSpan theorem_111_regularvaluesdense) SemCatPlainTheorem (Just theorem_111_regularvaluesdense)
  , ClaimIR (theoremId theorem_112_rem_laplaciannotpositive) (theoremStatement theorem_112_rem_laplaciannotpositive) (theoremSpan theorem_112_rem_laplaciannotpositive) SemCatPlainTheorem (Just theorem_112_rem_laplaciannotpositive)
  , ClaimIR (theoremId theorem_113_thm_288) (theoremStatement theorem_113_thm_288) (theoremSpan theorem_113_thm_288) SemCatPlainTheorem (Just theorem_113_thm_288)
  , ClaimIR (theoremId theorem_114_thm_taylorexpansionmetric) (theoremStatement theorem_114_thm_taylorexpansionmetric) (theoremSpan theorem_114_thm_taylorexpansionmetric) SemCatPlainTheorem (Just theorem_114_thm_taylorexpansionmetric)
  , ClaimIR (theoremId theorem_115_lem_pushforwardandcovariant) (theoremStatement theorem_115_lem_pushforwardandcovariant) (theoremSpan theorem_115_lem_pushforwardandcovariant) SemCatPlainTheorem (Just theorem_115_lem_pushforwardandcovariant)
  , ClaimIR (theoremId theorem_116_lem_covariantderivativeszero) (theoremStatement theorem_116_lem_covariantderivativeszero) (theoremSpan theorem_116_lem_covariantderivativeszero) SemCatPlainTheorem (Just theorem_116_lem_covariantderivativeszero)
  , ClaimIR (theoremId theorem_117_thm_297) (theoremStatement theorem_117_thm_297) (theoremSpan theorem_117_thm_297) SemCatPlainTheorem (Just theorem_117_thm_297)
  , ClaimIR (theoremId theorem_118_prop_explicitexpresisonmetricderivatives) (theoremStatement theorem_118_prop_explicitexpresisonmetricderivatives) (theoremSpan theorem_118_prop_explicitexpresisonmetricderivatives) SemCatPlainTheorem (Just theorem_118_prop_explicitexpresisonmetricderivatives)
  , ClaimIR (theoremId theorem_119_prop_explicitexpresisoninversemetricderivatives) (theoremStatement theorem_119_prop_explicitexpresisoninversemetricderivatives) (theoremSpan theorem_119_prop_explicitexpresisoninversemetricderivatives) SemCatPlainTheorem (Just theorem_119_prop_explicitexpresisoninversemetricderivatives)
  , ClaimIR (theoremId theorem_120_prop_boundmetricterms) (theoremStatement theorem_120_prop_boundmetricterms) (theoremSpan theorem_120_prop_boundmetricterms) SemCatPlainTheorem (Just theorem_120_prop_boundmetricterms)
  , ClaimIR (theoremId theorem_121_lem_frobeniusnorm) (theoremStatement theorem_121_lem_frobeniusnorm) (theoremSpan theorem_121_lem_frobeniusnorm) SemCatPlainTheorem (Just theorem_121_lem_frobeniusnorm)
  , ClaimIR (theoremId theorem_122_prop_neumannseries) (theoremStatement theorem_122_prop_neumannseries) (theoremSpan theorem_122_prop_neumannseries) SemCatPlainTheorem (Just theorem_122_prop_neumannseries)
  , ClaimIR (theoremId theorem_123_prop_boundinversemetric) (theoremStatement theorem_123_prop_boundinversemetric) (theoremSpan theorem_123_prop_boundinversemetric) SemCatPlainTheorem (Just theorem_123_prop_boundinversemetric)
  , ClaimIR (theoremId theorem_124_prop_bounddermetric) (theoremStatement theorem_124_prop_bounddermetric) (theoremSpan theorem_124_prop_bounddermetric) SemCatPlainTheorem (Just theorem_124_prop_bounddermetric)
  , ClaimIR (theoremId theorem_125_thm_lowerboundlaplacianr) (theoremStatement theorem_125_thm_lowerboundlaplacianr) (theoremSpan theorem_125_thm_lowerboundlaplacianr) SemCatPlainTheorem (Just theorem_125_thm_lowerboundlaplacianr)
  , ClaimIR (theoremId theorem_126_auxlemma2) (theoremStatement theorem_126_auxlemma2) (theoremSpan theorem_126_auxlemma2) SemCatPlainTheorem (Just theorem_126_auxlemma2)
  , ClaimIR (theoremId theorem_127_rem_projectecrtilde) (theoremStatement theorem_127_rem_projectecrtilde) (theoremSpan theorem_127_rem_projectecrtilde) SemCatPlainTheorem (Just theorem_127_rem_projectecrtilde)
  , ClaimIR (theoremId theorem_128_thm_322) (theoremStatement theorem_128_thm_322) (theoremSpan theorem_128_thm_322) SemCatPlainTheorem (Just theorem_128_thm_322)
  , ClaimIR (theoremId theorem_129_lem_projectedh) (theoremStatement theorem_129_lem_projectedh) (theoremSpan theorem_129_lem_projectedh) SemCatPlainTheorem (Just theorem_129_lem_projectedh)
  , ClaimIR (theoremId theorem_130_lem_identityexpressionofinterest) (theoremStatement theorem_130_lem_identityexpressionofinterest) (theoremSpan theorem_130_lem_identityexpressionofinterest) SemCatPlainTheorem (Just theorem_130_lem_identityexpressionofinterest)
  , ClaimIR (theoremId theorem_131_lem_ultimateboundexpressionofinterest) (theoremStatement theorem_131_lem_ultimateboundexpressionofinterest) (theoremSpan theorem_131_lem_ultimateboundexpressionofinterest) SemCatPlainTheorem (Just theorem_131_lem_ultimateboundexpressionofinterest)
  , ClaimIR (theoremId theorem_132_thm_335) (theoremStatement theorem_132_thm_335) (theoremSpan theorem_132_thm_335) SemCatPlainTheorem (Just theorem_132_thm_335)
  ]

categoryToObligations :: ClaimIR -> [ProofObligation]
categoryToObligations = claimToObligations

isProofReadyConclusion :: Proposition -> Bool
isProofReadyConclusion (SemanticGap _ _) = False
isProofReadyConclusion _ = True

isProofReadyTheorem :: TheoremIR -> Bool
isProofReadyTheorem theorem =
  theoremTranscriptionStatus theorem == StatusTranscribed
    && isProofReadyConclusion (theoremConclusion theorem)

claimToObligations :: ClaimIR -> [ProofObligation]
claimToObligations claim =
  case claimTheorem claim of
    Nothing -> []
    Just theorem ->
      case theoremFormalizationClass theorem of
        FormalMath | isProofReadyTheorem theorem ->
          [ ProofObligation
              (theoremId theorem)
              (theoremConclusion theorem)
              (theoremSpan theorem)
              (theoremTarget theorem)
          ]
        _ -> []

obligationToLean :: ProofObligation -> LeanTarget
obligationToLean = obligationLean

allProofObligations :: [ProofObligation]
allProofObligations = concatMap categoryToObligations claims
