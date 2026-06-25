import Mathlib

open scoped TensorProduct

namespace GrokRxiv

/-
Lemma 20 — paper claim `lem:stl-cobracket-vanishing` (section sec-2-5-1):
the cobracket on 𝒮t^∞ has the vanishing property ζ_alt ∘ δ = 0.

Faithfulness note. The objects this statement quantifies over — the infinite
stable object 𝒮t^∞, its cobracket δ, and the alternating map ζ_alt — are NOT
supplied in the review input: the target dependency list is empty, the semantic
IR carries no definitions or assumptions, and the deterministic theorem IR
leaves both sides of the equation as un-parsed `unknown_term`s. The input
contract forbids inventing the missing paper mathematics, and the role
requirements forbid substituting the deterministic skeleton `0 = 0` strawman.

Best faithful approximation. 𝒮t^∞ is modelled as an arbitrary module over a
commutative ring, the cobracket δ as a linear map into its tensor square, and
ζ_alt as a linear map out of that square; the lemma asserts the composite
vanishes. This keeps the shape of the claim (a cobracket-vanishing identity)
without fabricating the concrete construction that would make it hold.

For unconstrained δ and ζ_alt the composite need not vanish, so the goal cannot
be closed honestly from the supplied input. Per requirement (7) the proof is
therefore left genuinely unfinished — using only ordinary tactics and no
proof-bypassing escape hatch — so review fails on an open goal rather than on a
masked gap.
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
  -- Remaining goal: `ζalt (δ x) = 0`. In the paper this closes by the explicit
  -- construction of 𝒮t^∞, δ and ζ_alt, none of which is available in the review
  -- input; there is no honest closing term, so review fails at this open goal.

end GrokRxiv
