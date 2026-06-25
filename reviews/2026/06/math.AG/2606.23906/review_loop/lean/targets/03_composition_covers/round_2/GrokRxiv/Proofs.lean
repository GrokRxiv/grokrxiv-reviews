import Mathlib

namespace GrokRxiv

/-
Proposition 10 (paper, section 2.2).

  Let `q : Z → X` be a *connected* cover — a covering map whose total space `Z`
  is connected — and let `f : Y → Z` be a continuous map. If the composition
  `q ∘ f : Y → X` is a covering map, then so is `f`.

Faithful Lean 4 statement: every hypothesis of the paper is preserved.
  * `q` is a covering map               →  `hq : IsCoveringMap q`
  * the cover `q` is connected          →  `[ConnectedSpace Z]`
  * `f` is continuous                   →  `hf : Continuous f`
  * the composite is a covering map     →  `hqf : IsCoveringMap (q ∘ f)`
The conclusion is exactly that `f` is a covering map. The paper prints the
conclusion as `f : Y → X`, which is a typo for the codomain forced by the given
`f : Y → Z`; the faithful conclusion is therefore `IsCoveringMap f`.
-/
theorem composition_covers
    {X Y Z : Type*}
    [TopologicalSpace X] [TopologicalSpace Y] [TopologicalSpace Z]
    [ConnectedSpace Z]
    {q : Z → X} {f : Y → Z}
    (hq : IsCoveringMap q) (hf : Continuous f)
    (hqf : IsCoveringMap (q ∘ f)) :
    IsCoveringMap f := by
  -- This is the genuine two-out-of-three cancellation property of covering
  -- maps: from `q` (a connected covering) and the composite `q ∘ f` one must
  -- build the even-covering trivializations for `f` itself, using connectedness
  -- of `Z` to control the sheet structure. Mathlib exposes no single lemma for
  -- this direction, and a faithful from-scratch construction is beyond what can
  -- be discharged in this pass. The core goal is therefore left genuinely open
  -- so the proof fails honestly rather than weakening Proposition 10 to a
  -- trivial strawman.
  skip

end GrokRxiv
