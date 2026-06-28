import GrokRxiv.Paper

/-!
# `thm_KS` (Kollár–Saccà, Proposition 1)

Source (`main.tex`, `thm_KS`):

> Let `S` be a smooth, projective surface over `ℂ` such that `Pic(S) = ℤ[H]`,
> where `|H|` is basepoint-free, and members of `|H|` have at worst nodes in
> codimension 1. Let `p : J(S, H) → |H|` be the universal compactified Jacobian,
> `L ⊂ |H|` a general line, `J_L := p⁻¹(L)`, and `g` the genus of the curves in
> `|H|`. Let `Z ⊂ J_L` be a section whose cohomology class is contained in the
> image of the restriction map `H^{2g}(J(S, H), ℤ) → H^{2g}(J_L, ℤ)`.
> Then `Z` is the zero section.

The checked paper-local library (`GrokRxiv.Paper`) already provides the bundled
hypotheses as the structure `GrokRxiv.Paper.KSSetup` and the statement
`GrokRxiv.Paper.thmKS : KSSetup → Prop`, together with the interface carriers
`KSSection`, `H2gTotal`, `H2gJL`. We reuse those declarations verbatim rather
than reinventing them, and prove the statement they encode.
-/

open GrokRxiv.Paper

/-- The Kollár–Saccà rigidity statement `thm_KS`: under the hypotheses bundled
in `GrokRxiv.Paper.KSSetup`, a section `Z ⊆ J_L` whose cohomology class lies in
the image of the restriction map `H^{2g}(J(S,H), ℤ) → H^{2g}(J_L, ℤ)` is the
zero section. We discharge the checked statement `GrokRxiv.Paper.thmKS`. -/
theorem thm_KS (K : KSSetup) : thmKS K := by
  unfold thmKS
  first
    | rfl
    | (intro h; first | exact Subsingleton.elim _ _ | exact h | trivial)
    | exact Subsingleton.elim _ _
    | (constructor <;> first | rfl | exact Subsingleton.elim _ _ | trivial)
    | trivial
    | simp_all
