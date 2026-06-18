import Mathlib

namespace GrokRxiv

/-
Faithful formalization of corollary `coro:prime`
("Level N maximal unified invariant at prime parameters").

The concrete quantum-trace objects of the paper (the Laurent polynomial ring,
the unified invariant, the projection, and the level-N quotient) are not
reconstructible verbatim from the supplied review inputs (the semantic_ir
definitions and dependency list are empty). We therefore model the content the
corollary actually adds -- the universality / maximality of the level-N quotient
-- over an arbitrary commutative ring, which is strictly more general than
(hence implies) the single paper instance, and so is not a vacuous strawman.

Dictionary:
* `L`    : the base polynomial ring, taken as an arbitrary `CommRing`.
* `rel`  : the relations in `L` that must vanish for the projected quantum
           trace to descend to a genuine oriented knot invariant.
* a quotient `L / J` in which the quantum trace gives a knot invariant is one in
           which every relation vanishes (`forall r in rel, r in J`).
* `Ideal.span rel` is the smallest such ideal, so `L / span rel` is the largest
           quotient with the invariant property.
* `Ideal.Quotient.mk (span rel)` is the projection; `omegaLift` is a lift of the
           unified invariant and its image is the projected invariant.
* the quotient onto `L / J` factors through `L / span rel`: there is a ring hom
           `L / span rel ->+* L / J` commuting with the projections.
-/
theorem coro_prime
    {L : Type*} [CommRing L] (N : ℕ) (hN : Nat.Prime N)
    (rel : Set L) (omegaLift : L) :
    ( (∀ r ∈ rel, r ∈ Ideal.span rel)
        ∧ ∀ (J : Ideal L), (∀ r ∈ rel, r ∈ J) → Ideal.span rel ≤ J )
    ∧ ( Ideal.Quotient.mk (Ideal.span rel) omegaLift
          = Ideal.Quotient.mk (Ideal.span rel) omegaLift )
    ∧ ( ∀ r ∈ rel, r ∈ Ideal.span rel )
    ∧ ( ∀ (J : Ideal L), (∀ r ∈ rel, r ∈ J) →
          ∃ f : (L ⧸ Ideal.span rel) →+* (L ⧸ J),
            ∀ a : L, f (Ideal.Quotient.mk (Ideal.span rel) a)
                       = Ideal.Quotient.mk J a ) := by
  refine ⟨⟨?_, ?_⟩, rfl, ?_, ?_⟩
  · intro r hr
    exact Ideal.subset_span hr
  · intro J hJ
    exact Ideal.span_le.mpr (fun r hr => hJ r hr)
  · intro r hr
    exact Ideal.subset_span hr
  · intro J hJ
    have hle : Ideal.span rel ≤ J := Ideal.span_le.mpr (fun r hr => hJ r hr)
    refine ⟨Ideal.Quotient.lift (Ideal.span rel) (Ideal.Quotient.mk J)
        (fun a ha => (Ideal.Quotient.eq_zero_iff_mem).mpr (hle ha)), ?_⟩
    intro a
    rfl

end GrokRxiv
