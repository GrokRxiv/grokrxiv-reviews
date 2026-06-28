import GrokRxiv.Paper.Interfaces

/-! Bundled data for the paper settings.

    The abelian-group structures on the opaque carriers and the relevant set maps
    are carried as fields. Crucially, additivity of `restrict` and the
    homomorphism property of `psi` are NOT assumed here, since these are exactly
    the content of the target claims; baking them in would silently prove the
    claims. -/

namespace GrokRxiv.Paper

/-- Data for `A/C` a smooth commutative group scheme over a smooth projective
    curve with connected fibres and abelian-variety generic fibre. -/
structure Setup where
  mwGroup : AddCommGroup MWCarrier
  n1Group : AddCommGroup N1Carrier
  n1genGroup : AddCommGroup N1genCarrier
  picRigGroup : AddCommGroup PicRigCarrier
  picEtaGroup : AddCommGroup PicEtaCarrier
  /-- Restriction `Pic(A)_rig → Pic(A_η)` (bare set map; additivity is a target). -/
  restrict : PicRigCarrier → PicEtaCarrier
  /-- Natural set map `φ : MW(A/C) → N_1(A)`, `Z ↦ [Z] - [Z₀]`. -/
  phi : MWCarrier → N1Carrier
  /-- Natural set map `ψ : MW(A/C) → N_{1,gen}(A)`, `Z ↦ [Z] - [Z₀]`
      (homomorphism property is a target). -/
  psi : MWCarrier → N1genCarrier

/-- Data for the Kollár–Saccà rigidity theorem. -/
structure KSSetup where
  /-- Restriction `H^{2g}(J(S,H), ℤ) → H^{2g}(J_L, ℤ)`. -/
  restrictH : H2gTotal → H2gJL
  /-- Cohomology class in `H^{2g}(J_L, ℤ)` of a section. -/
  cohClass : KSSection → H2gJL
  /-- The zero section. -/
  zeroSection : KSSection

/-- Membership in the torsion subgroup `MW(A/C)_tors`. -/
def IsTors (S : Setup) (Z : MWCarrier) : Prop :=
  letI := S.mwGroup
  ∃ n : ℕ, 0 < n ∧ n • Z = 0

end GrokRxiv.Paper
