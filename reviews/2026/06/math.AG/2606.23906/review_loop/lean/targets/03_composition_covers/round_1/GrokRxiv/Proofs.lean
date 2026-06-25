import Mathlib

namespace GrokRxiv

/-
Proposition 10 (paper sec. 2.2). Let `q : Z → X` be a *connected* cover — i.e. a
covering map whose total space `Z` is connected — and let `f : Y → Z` be a
continuous map. If the composition `q ∘ f : Y → X` is a covering map, then `f`
itself is a covering map.

Faithful Lean 4 statement: every hypothesis of the paper is preserved
  * `q` is a covering map                (`hq : IsCoveringMap q`),
  * the cover is connected               (`[ConnectedSpace Z]`),
  * `f` is continuous                    (`hf : Continuous f`),
  * the composite is a covering map      (`hqf : IsCoveringMap (q ∘ f)`),
and the conclusion is exactly that `f` is a covering map. The paper's printed
conclusion `f : Y → X` is a typo for `f : Y → Z`, the codomain forced by the
given `f : Y → Z`.
-/
theorem composition_covers
    {X Y Z : Type*}
    [TopologicalSpace X] [TopologicalSpace Y] [TopologicalSpace Z]
    [ConnectedSpace Z]
    {q : Z → X} {f : Y → Z}
    (hq : IsCoveringMap q) (hf : Continuous f)
    (hqf : IsCoveringMap (q ∘ f)) :
    IsCoveringMap f := by
  -- This is the genuine cancellation / two-out-of-three property of covering
  -- maps. Discharging it honestly requires using `ConnectedSpace Z` to equate
  -- the fibre cardinalities of `q` and `q ∘ f`; this lemma is not available in
  -- current Mathlib and a full from-scratch proof is out of reach in this pass.
  -- Per the task contract the goal is left genuinely open (no `sorry`/`admit`/
  -- `axiom`, and no weakening of the statement to a trivial strawman), so the
  -- proof fails honestly rather than masking the gap.
  skip

end GrokRxiv
