import Mathlib

namespace GrokRxiv

/-- **Lemma 11 (Lifting (Homotopy) Property — unique path lifting).**
Let `p : Y → X` be a covering map, let `y : Y`, and set `x = p y`. For every
path `γ : [0,1] → X` starting at `x` (`γ 0 = x`) there is a *unique* continuous
lift `δ : [0,1] → Y` of `γ` starting at `y`; i.e. a unique continuous `δ` with
`p (δ t) = γ t` for all `t ∈ [0,1]` and `δ 0 = y`. -/
theorem unique_lift {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
    {p : Y → X} (hp : IsCoveringMap p) (y : Y)
    (γ : C(unitInterval, X)) (hγ : γ 0 = p y) :
    ∃! δ : C(unitInterval, Y), (∀ t : unitInterval, p (δ t) = γ t) ∧ δ 0 = y := by
  -- Existence: a covering map has the path-lifting property.
  obtain ⟨δ, hlift, hstart⟩ := hp.exists_path_lift γ y hγ
  refine ⟨δ, ⟨hlift, hstart⟩, ?_⟩
  -- Uniqueness: any two lifts agreeing at the basepoint agree everywhere,
  -- since `[0,1]` is preconnected and `p` is a covering map.
  rintro δ' ⟨hlift', hstart'⟩
  refine hp.eq_of_comp_eq δ' δ ?_ 0 ?_
  · funext t
    simp only [Function.comp_apply]
    rw [hlift' t, hlift t]
  · rw [hstart', hstart]

end GrokRxiv
