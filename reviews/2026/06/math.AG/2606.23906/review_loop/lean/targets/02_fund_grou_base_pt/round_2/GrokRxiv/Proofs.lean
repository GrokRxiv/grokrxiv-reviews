import Mathlib

open CategoryTheory

namespace GrokRxiv

attribute [local instance] Path.Homotopic.setoid

/-- Proposition 6: in a path-connected topological space the fundamental group is
independent of the chosen basepoint, up to (group) isomorphism. -/
theorem fund_grou_base_pt {X : Type*} [TopologicalSpace X] [PathConnectedSpace X]
    (x₀ x₁ : X) :
    Nonempty (FundamentalGroup X x₀ ≃* FundamentalGroup X x₁) := by
  -- Path-connectedness yields a path from `x₀` to `x₁`.
  let p : Path x₀ x₁ := (PathConnectedSpace.joined x₀ x₁).somePath
  -- Its homotopy class is a morphism `⟨x₀⟩ ⟶ ⟨x₁⟩` in the fundamental groupoid.
  let f : (⟨x₀⟩ : FundamentalGroupoid X) ⟶ ⟨x₁⟩ := ⟦p⟧
  -- Every morphism of a groupoid is invertible, giving an isomorphism of basepoints.
  let e : (⟨x₀⟩ : FundamentalGroupoid X) ≅ ⟨x₁⟩ :=
    { hom := f
      inv := Groupoid.inv f
      hom_inv_id := Groupoid.comp_inv f
      inv_hom_id := Groupoid.inv_comp f }
  -- Conjugation by `e` is the desired isomorphism `π₁(X, x₀) ≃* π₁(X, x₁)`.
  exact ⟨e.conjAut⟩

end GrokRxiv
