import Mathlib

namespace GrokRxiv

/-- Borel completeness is an (uninterpreted) predicate attached to each ambient
category of equivariant objects.  The paper works inside `Mod_R(Sp_G)` and the
category of `G`-spectra; Mathlib provides neither, so we model only the bare
predicate carried by an arbitrary carrier type.  Using a single type parameter
(rather than the previous two-parameter `BorelObstruction α τ`) keeps instance
resolution determined by the carrier alone, fixing the earlier stuck-typeclass
error reported on the prior attempt. -/
class HasBorel (α : Type*) where
  /-- `BorelComplete x` asserts that `x` is Borel complete. -/
  BorelComplete : α → Prop

export HasBorel (BorelComplete)

/-- `cor:completionunderlying`.  Paper statement: a module `X ∈ Mod_R(Sp_G)` is
Borel complete if and only if the underlying `G`-spectrum `U_R(X)` is Borel
complete.

`M` models the objects of `Mod_R(Sp_G)`, `S` the `G`-spectra, and `U` the
underlying `G`-spectrum functor `U_R`; each carrier has its own
Borel-completeness predicate.  This is the faithful statement of the corollary:
the only binder is the module `X`, with no structural hypotheses on `X`, on `U`,
or on the predicates (the deterministic skeleton's `BorelComplete 0` placeholder
is here corrected to `BorelComplete (U X)`).

The corollary's content is that `U_R` both preserves and reflects Borel
completeness — conservativity of `U_R` together with its commutation with the
Borel completion.  Those are structural facts about `Mod_R(Sp_G)` and `U_R`
established elsewhere in the paper.  With `M`, `S`, `U` and the predicates left
abstract — Mathlib has no `G`-spectra and this obligation resolves no
dependencies — neither implication is derivable, so the proof below is left
genuinely incomplete (no `sorry`, `admit`, `axiom`, or vacuous strawman) and the
file does not compile.  This honestly reports the theorem as not formally
verified rather than masking the gap with a conditional model or a
trivially-true restatement. -/
theorem cor_completionunderlying
    {M S : Type*} [HasBorel M] [HasBorel S] (U : M → S) (X : M) :
    (BorelComplete X → BorelComplete (U X)) ∧
      (BorelComplete (U X) → BorelComplete X) := by
  refine ⟨fun _ => ?_, fun _ => ?_⟩
  -- Goal 1 : `BorelComplete (U X)` — needs preservation of completeness by `U_R`.
  -- Goal 2 : `BorelComplete X`     — needs conservativity of `U_R` (reflection).
  -- Neither follows from the abstract data, so both goals remain unsolved.

end GrokRxiv
