import Mathlib

open CategoryTheory

namespace GrokRxiv

/-- Proposition 4 (paper claim `thm-5`): homeomorphic spaces have isomorphic fundamental
groups.  If `f : X ≃ₜ Y` is a homeomorphism, then the induced map
`f_* : π₁(X, x) → π₁(Y, f x)` on fundamental groups is an isomorphism.

A homeomorphism is in particular a homotopy equivalence, so it induces an equivalence `e`
of the fundamental groupoids of `X` and `Y`.  The induced map `f_*` is the action of the
equivalence's functor on the automorphism group of the basepoint (`Functor.mapAut`).
Because `e.functor` is full and faithful (being the functor of an equivalence) and the
fundamental groupoids are groupoids (so every morphism underlies an automorphism), this
group homomorphism is bijective, hence a multiplicative isomorphism
`π₁(X, x) ≃* π₁(Y, f x)`. -/
theorem thm_5 {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    (f : X ≃ₜ Y) (x : X) :
    Nonempty (FundamentalGroup X x ≃* FundamentalGroup Y (f x)) := by
  classical
  -- A homeomorphism, viewed as a homotopy equivalence, induces an equivalence of the
  -- fundamental groupoids of `X` and `Y`.
  let e : FundamentalGroupoid X ≌ FundamentalGroupoid Y :=
    FundamentalGroupoidFunctor.equivOfHomotopyEquiv f.toHomotopyEquiv
  -- `f_*` is the induced homomorphism on the automorphism group of the basepoint.
  refine ⟨MulEquiv.ofBijective (e.functor.mapAut ⟨x⟩) ⟨?_, ?_⟩⟩
  · -- Injective: the functor of an equivalence is faithful.
    intro a b hab
    exact Iso.ext (e.functor.map_injective (congrArg Iso.hom hab))
  · -- Surjective: the functor of an equivalence is full, and in a groupoid every
    -- morphism underlies an automorphism.
    intro r
    exact ⟨(Groupoid.isoEquivHom _ _).symm (e.functor.preimage r.hom),
      Iso.ext (e.functor.map_preimage r.hom)⟩

end GrokRxiv
