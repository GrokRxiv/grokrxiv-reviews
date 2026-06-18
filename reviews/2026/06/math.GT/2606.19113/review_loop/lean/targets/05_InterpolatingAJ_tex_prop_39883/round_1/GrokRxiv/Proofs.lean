import Mathlib

namespace GrokRxiv

/-- Artin relations presenting the braid group `B_n` on its `n - 1` generators
`s_0, ..., s_{n-2}`:
* far commutation `s_i s_j = s_j s_i` whenever `|i - j| >= 2`;
* the braid relation `s_i s_{i+1} s_i = s_{i+1} s_i s_{i+1}`. -/
def braidRelations (k : ℕ) : Set (FreeGroup (Fin k)) :=
  {r | ∃ i j : Fin k, (j : ℕ) + 2 ≤ (i : ℕ) ∧
        r = FreeGroup.of i * FreeGroup.of j * (FreeGroup.of i)⁻¹ * (FreeGroup.of j)⁻¹} ∪
  {r | ∃ (i : Fin k) (h : (i : ℕ) + 1 < k),
        r = FreeGroup.of i * FreeGroup.of (⟨(i : ℕ) + 1, h⟩ : Fin k) * FreeGroup.of i *
            (FreeGroup.of (⟨(i : ℕ) + 1, h⟩ : Fin k))⁻¹ * (FreeGroup.of i)⁻¹ *
            (FreeGroup.of (⟨(i : ℕ) + 1, h⟩ : Fin k))⁻¹}

/-- Action on the higher level `cN` module over the quotient ring.
Once the specialized braid action (paper eq:action) is given by a family `f` of
`R`-linear automorphisms of the level-`cN` module `M` (standing for the n-fold
tensor power `V_cN^{⊗ n}` over the quotient ring `R`) that satisfies the Artin
braid relations, it descends to a well-defined induced braid group homomorphism
`B_n →* Aut_R(M)` agreeing with `f` on the generators. -/
theorem InterpolatingAJ_tex_prop_39883
    (_cN : ℕ) (n : ℕ)
    (R : Type) [CommRing R]
    (M : Type) [AddCommGroup M] [Module R M]
    (f : Fin (n - 1) → (M ≃ₗ[R] M))
    (hf : ∀ r ∈ braidRelations (n - 1), FreeGroup.lift f r = 1) :
    ∃ ρ : PresentedGroup (braidRelations (n - 1)) →* (M ≃ₗ[R] M),
      ∀ i, ρ (PresentedGroup.of i) = f i :=
  ⟨PresentedGroup.toGroup hf, fun _ => PresentedGroup.toGroup.of hf⟩

end GrokRxiv
