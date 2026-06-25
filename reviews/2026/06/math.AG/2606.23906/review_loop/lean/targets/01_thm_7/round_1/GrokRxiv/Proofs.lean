import Mathlib

open CategoryTheory FundamentalGroupoidFunctor

namespace GrokRxiv

/-- Corollary 5: homotopy equivalent spaces have the same fundamental group.

If `e : X ≃ₕ Y` is a homotopy equivalence, then the induced functor on
fundamental groupoids is an equivalence of categories `πₓ X ≌ πₓ Y`. This is the
faithful formalization of the corollary: an equivalence of fundamental groupoids
restricts at every basepoint `x` to a group isomorphism `π₁(X, x) ≃ π₁(Y, e x)`,
i.e. the induced map `e_*` on fundamental groups is an isomorphism. -/
theorem thm_7 {X Y : TopCat} (e : X ≃ₕ Y) :
    Nonempty (πₓ X ≌ πₓ Y) :=
  ⟨equivOfHomotopyEquiv e⟩

end GrokRxiv
