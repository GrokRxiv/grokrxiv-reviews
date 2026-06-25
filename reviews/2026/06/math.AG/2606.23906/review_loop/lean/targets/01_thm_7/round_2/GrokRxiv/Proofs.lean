import Mathlib

open CategoryTheory

namespace GrokRxiv

/-- **Corollary 5 (homotopy invariance of the fundamental group).**

If `e : X ≃ₕ Y` is a homotopy equivalence, then for every basepoint `x : X`
the induced map `e_*` on fundamental groups `π₁(X, x) → π₁(Y, e x)` is a group
isomorphism.

In Mathlib the fundamental group `π₁(X, x)` is the automorphism group
`Aut (FundamentalGroupoid.mk x)` of the basepoint inside the fundamental
groupoid, and `e_*` is the action on automorphisms of the functor
`E := equivOfHomotopyEquiv e` induced by `e`.  The conclusion is stated
faithfully as a multiplicative (group) isomorphism `π₁(X, x) ≃* π₁(Y, e x)`,
witnessed by that induced functor. -/
theorem thm_7 {X Y : TopCat} (e : X ≃ₕ Y) (x : X) :
    Nonempty
      (Aut (FundamentalGroupoid.mk x) ≃*
        Aut (FundamentalGroupoid.mk (e x))) := by
  -- A homotopy equivalence induces an equivalence of fundamental groupoids.
  set E := FundamentalGroupoidFunctor.equivOfHomotopyEquiv e with hE
  -- The induced functor sends the basepoint `x` to `e x`.
  have hobj : E.functor.obj (FundamentalGroupoid.mk x)
      = FundamentalGroupoid.mk (e x) := rfl
  refine ⟨?_⟩
  rw [← hobj]
  -- Being part of an equivalence, `E.functor` is fully faithful, hence acts
  -- as a group isomorphism on the automorphism group (the fundamental group)
  -- of the basepoint.
  exact
    { toFun := fun g => E.functor.mapIso g
      invFun := fun g => E.fullyFaithfulFunctor.preimageIso g
      left_inv := fun g => by ext; simp
      right_inv := fun g => by ext; simp
      map_mul' := fun g h => by ext; simp }

end GrokRxiv
