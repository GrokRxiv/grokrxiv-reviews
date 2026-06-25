import Mathlib

open scoped TensorProduct

namespace GrokRxiv

/-
Lemma 20 — paper claim `lem:stl-cobracket-vanishing` (section sec-2-5-1):
  "The cobracket on 𝒮t^∞ has the vanishing property ζ_alt ∘ δ = 0."

Faithfulness note. The objects this statement quantifies over — the infinite
stable object 𝒮t^∞, its cobracket δ, and the alternating map ζ_alt — are NOT
supplied in the review input: the target's dependency list is empty, the
semantic IR carries no definitions or assumptions, and the deterministic
theorem IR leaves both sides of the equation as un-parsed `unknown_term`s.
The input contract forbids inventing the missing paper mathematics, and the
role requirements forbid substituting the deterministic skeleton's strawman
(`0 = 0`).

Best faithful approximation. 𝒮t^∞ is modelled as an arbitrary module over a
commutative ring, the cobracket δ as a linear map into its tensor square, and
ζ_alt as a linear map out of that square; the lemma asserts the composite
vanishes. This preserves the shape of the claim (a cobracket-vanishing
identity) without fabricating the concrete construction.

For abstract δ and ζ_alt the composite need not vanish, so the goal cannot be
discharged honestly. Per the requirements the proof is therefore left to fail
(no `sorry`, `admit`, or `axiom`) rather than masking the gap.
-/

variable {R : Type*} [CommRing R]
variable {Stl Tgt : Type*}
variable [AddCommGroup Stl] [Module R Stl]
variable [AddCommGroup Tgt] [Module R Tgt]

theorem lem_stl_cobracket_vanishing
    (δ : Stl →ₗ[R] Stl ⊗[R] Stl) (ζalt : Stl ⊗[R] Stl →ₗ[R] Tgt) :
    ζalt ∘ₗ δ = 0 := by
  ext x
  simp only [LinearMap.comp_apply, LinearMap.zero_apply]
  -- Remaining goal: `ζalt (δ x) = 0`. This holds in the paper by the explicit
  -- construction of 𝒮t^∞, δ and ζ_alt, none of which is available here; there
  -- is no honest closing term, so review fails at this point.

end GrokRxiv
