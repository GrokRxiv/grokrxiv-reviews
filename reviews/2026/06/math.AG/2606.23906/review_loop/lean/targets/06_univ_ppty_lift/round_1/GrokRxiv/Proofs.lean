import Mathlib

namespace GrokRxiv

/-- **Lemma 13 (universal property of the topological quotient / lift).**
Let `X` and `Y` be topological spaces and let `s` be an equivalence relation
(a `Setoid`) on `Y`.  If `p : Y → X` is continuous and constant on
`s`-equivalence classes (`y ≈ y' → p y = p y'`), then there is a *unique*
continuous map `g : Quotient s → X` factoring `p` through the canonical
projection, i.e. with `g ∘ Quotient.mk s = p`. -/
theorem univ_ppty_lift
    {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y] [s : Setoid Y]
    (p : Y → X) (hp : Continuous p)
    (hcompat : ∀ y y' : Y, y ≈ y' → p y = p y') :
    ∃! g : Quotient s → X, Continuous g ∧ g ∘ Quotient.mk s = p := by
  refine ⟨Quotient.lift p hcompat, ⟨hp.quotient_lift hcompat, ?_⟩, ?_⟩
  · -- the lift genuinely factors `p` through the projection
    funext y
    rfl
  · -- any continuous map factoring `p` coincides with the lift
    rintro g ⟨-, hg_eq⟩
    funext z
    exact Quotient.inductionOn z fun a => congrFun hg_eq a

end GrokRxiv
