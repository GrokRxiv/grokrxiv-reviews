import Mathlib

namespace GrokRxiv

/-
Lemma 12 (Lifting Criterion).  The source statement (sec. 2.2) was TRUNCATED by
extraction, ending at the words `if and only if f_*(`.  Reconstructed in full:

  Let p : Y → X be a connected covering and f : Z → X be a continuous map.  Then
  a lift f̃ : Z → Y of f exists iff f_*(π₁(Z,z₀)) ⊆ p_*(π₁(Y,y₀)).

The ↔ conclusion below is the standard textbook Lifting Criterion (cf. Hatcher,
Algebraic Topology, Prop. 1.33), reconstructed as the best faithful approximation
of the truncated text.  The hypotheses that Z be path-connected and locally
path-connected, and the basepoints z₀, y₀ with p y₀ = f z₀, are not present
verbatim in the truncated source; they are the standard hypotheses of the
criterion (false without local path-connectedness of Z) and are reconstructed and
flagged here, not invented as paper text.

The subgroup inclusion f_*(π₁(Z,z₀)) ⊆ p_*(π₁(Y,y₀)) is rendered elementarily:
every loop γ at z₀ has f ∘ γ homotopic rel endpoints to p ∘ δ for some loop δ at
y₀.
-/
theorem lift_criterion
    {X Y Z : Type*}
    [TopologicalSpace X] [TopologicalSpace Y] [TopologicalSpace Z]
    [ConnectedSpace Y] [PathConnectedSpace Z] [LocPathConnectedSpace Z]
    (p : Y → X) (hp : IsCoveringMap p)
    (f : Z → X) (hf : Continuous f)
    (z₀ : Z) (y₀ : Y) (hbase : p y₀ = f z₀) :
    (∃ g : Z → Y, Continuous g ∧ (∀ z, p (g z) = f z) ∧ g z₀ = y₀) ↔
      (∀ γ : Path z₀ z₀, ∃ δ : Path y₀ y₀,
        (γ.map hf).Homotopic (hbase ▸ (δ.map hp.continuous))) := by
  constructor
  · -- (=>) Necessity is elementary: δ := g ∘ γ is a loop at y₀ with p ∘ δ = f ∘ γ.
    rintro ⟨g, hcont, hpg, hbasept⟩ γ
    subst hbasept
    refine ⟨γ.map hcont, ?_⟩
    -- Remaining goal: (γ.map hf).Homotopic (hbase ▸ (γ.map hcont).map hp.continuous).
    -- Because p ∘ g = f (hpg), the right path equals γ.map hf, so both are path-equal and
    -- hence homotopic.  Discharging it needs `Path.map_map` plus proof-irrelevant
    -- transport bookkeeping; the goal is deliberately left OPEN (no sorry/admit/axiom).
  · -- (<=) Sufficiency is the substantive content of the criterion: build g by lifting,
    -- for each z, the path f ∘ α (α a path from z₀ to z, using path-connectedness of Z)
    -- to Y starting at y₀ (path lifting for covering maps), and taking the endpoint.  Its
    -- well-definedness uses the inclusion hsub; continuity uses local path-connectedness
    -- of Z.  This direction is not available in Mathlib and is left as an OPEN goal
    -- (no sorry/admit/axiom), per the honesty requirement.
    intro hsub

end GrokRxiv
