import GrokRxiv.Paper.Definitions

/-! Target statements, recorded as Prop-valued defs and left unproved. -/

namespace GrokRxiv.Paper

/-- `prop_main`/`item_lift`: the restriction `Pic(A)_rig → Pic(A_η)` is a group
    isomorphism, i.e. additive and bijective. (Unproved target.) -/
def itemLift (S : Setup) : Prop :=
  letI := S.picRigGroup
  letI := S.picEtaGroup
  (∀ x y : PicRigCarrier, S.restrict (x + y) = S.restrict x + S.restrict y)
    ∧ Function.Bijective S.restrict

/-- `main_thm` (1): `ψ : MW(A/C) → N_{1,gen}(A)` is a group homomorphism.
    (Unproved target.) -/
def mainThmHom (S : Setup) : Prop :=
  letI := S.mwGroup
  letI := S.n1genGroup
  ∀ x y : MWCarrier, S.psi (x + y) = S.psi x + S.psi y

/-- `main_thm` (2): under the no-abelian-subvariety hypothesis,
    `ker ψ = MW(A/C)_tors`. (Unproved target.) -/
def mainThmKernel (S : Setup) : Prop :=
  letI := S.n1genGroup
  ∀ Z : MWCarrier, S.psi Z = 0 ↔ IsTors S Z

/-- `main_thm`: conjunction of the homomorphism and kernel statements. -/
def mainThm (S : Setup) : Prop := mainThmHom S ∧ mainThmKernel S

/-- `cor_main`: the set map `MW(A/C)/tors → N_1(A)`, `Z ↦ [Z] - [Z₀]`, is
    injective (injectivity-modulo-torsion of `φ`). (Unproved target.) -/
def corMain (S : Setup) : Prop :=
  letI := S.mwGroup
  ∀ Z₁ Z₂ : MWCarrier, S.phi Z₁ = S.phi Z₂ → IsTors S (Z₁ - Z₂)

/-- `thm_KS` (Kollár–Saccà, Proposition 1): a section whose cohomology class lies
    in the image of the restriction map is the zero section. (Unproved target.) -/
def thmKS (K : KSSetup) : Prop :=
  ∀ Z : KSSection,
    (∃ c : H2gTotal, K.restrictH c = K.cohClass Z) → Z = K.zeroSection

end GrokRxiv.Paper
