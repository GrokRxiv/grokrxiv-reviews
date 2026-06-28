import GrokRxiv.Paper.Interfaces

/-!
# Target statements (stated, not proved)

These `Prop`s mirror the selected paper targets.  They are *not* proved in this
library; the theorem-proving phase will discharge them.  The genuine
scheme-theoretic content backing them is not available in Mathlib (see the
manifest `notes`), so they are stated against the abstract bundle of
`GrokRxiv/Paper/Interfaces.lean`.
-/

namespace GrokRxiv.Paper

/-- `prop_main`(`item_lift`): the restriction `Pic(A)_{rig} → Pic(A_η)` is a group
isomorphism (bijective and additive). -/
def itemLiftStatement : Prop :=
  Function.Bijective restrictMap ∧
    ∀ x y : paper.PicRig, restrictMap (x + y) = restrictMap x + restrictMap y

/-- `main_thm`(1): the map `ψ : MW(A/C) → N_{1,gen}(A)` is a group homomorphism. -/
def mainThmHomStatement : Prop :=
  ∀ x y : paper.MW, psiMap (x + y) = psiMap x + psiMap y

/-- `main_thm`(2): under the no-abelian-subvariety hypothesis,
`ker ψ = MW(A/C)_{tors}`. -/
def mainThmKerStatement : Prop :=
  ∀ Z : paper.MW, psiMap Z = 0 ↔ Z ∈ paper.torsion

/-- `thm_KS` (Kollár–Saccà, Proposition 1): a section whose class lies in the
image of the cohomology restriction map is the zero section. -/
def thmKSStatement : Prop :=
  ksData.inRestrictionImage ksData.Z → ksData.Z = ksData.zeroSection

end GrokRxiv.Paper
