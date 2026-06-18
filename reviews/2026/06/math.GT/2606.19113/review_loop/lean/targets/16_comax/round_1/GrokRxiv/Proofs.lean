import Mathlib

open Polynomial

namespace GrokRxiv

/-
Paper lemma `comax` (InterpolatingAJ.tex, label `comax`):
  If `d₁ ≠ d₂` then `φ_{d₁}(q²)` and `φ_{d₂}(q²)` are coprime in `ℚ[q^{±1}]`,
  and consequently the principal ideals `(φ_{d₁}(q²))` and `(φ_{d₂}(q²))` are
  comaximal.

Formalization:
* `φ_d`  := `Polynomial.cyclotomic d ℚ`  (the `d`-th cyclotomic polynomial).
* `q ↦ q²` substitution := `Polynomial.comp · (X ^ 2)`.
* The genuine arithmetic content lives in `ℚ[X]`; since `q` is a unit in the
  Laurent ring `ℚ[q^{±1}]`, coprimality/comaximality in `ℚ[X]` transports to
  `ℚ[q^{±1}]`, so we prove the substantive `ℚ[X]` statement here.
* "comaximal ideals" := `Ideal.span {a} ⊔ Ideal.span {b} = ⊤`.
-/
theorem comax (d_1 d_2 : ℕ) (h : d_1 ≠ d_2) :
    IsCoprime ((cyclotomic d_1 ℚ).comp (X ^ 2)) ((cyclotomic d_2 ℚ).comp (X ^ 2)) ∧
      Ideal.span {(cyclotomic d_1 ℚ).comp (X ^ 2)} ⊔
          Ideal.span {(cyclotomic d_2 ℚ).comp (X ^ 2)} = ⊤ := by
  classical
  -- Step 1: `φ_{d₁}` and `φ_{d₂}` are coprime in `ℚ[X]`.
  have hcop : IsCoprime (cyclotomic d_1 ℚ) (cyclotomic d_2 ℚ) := by
    rcases Nat.eq_zero_or_pos d_1 with rfl | hp1
    · simpa [cyclotomic_zero] using
        (isCoprime_one_left : IsCoprime (1 : ℚ[X]) (cyclotomic d_2 ℚ))
    rcases Nat.eq_zero_or_pos d_2 with rfl | hp2
    · simpa [cyclotomic_zero] using
        (isCoprime_one_right : IsCoprime (cyclotomic d_1 ℚ) (1 : ℚ[X]))
    have hi1 : Irreducible (cyclotomic d_1 ℚ) := cyclotomic.irreducible_rat hp1
    have hi2 : Irreducible (cyclotomic d_2 ℚ) := cyclotomic.irreducible_rat hp2
    have hne : cyclotomic d_1 ℚ ≠ cyclotomic d_2 ℚ := fun he =>
      h (cyclotomic_injective (R := ℚ) he)
    have hnotdvd : ¬ cyclotomic d_1 ℚ ∣ cyclotomic d_2 ℚ := by
      intro hdvd
      exact hne (eq_of_monic_of_associated (cyclotomic.monic d_1 ℚ)
        (cyclotomic.monic d_2 ℚ) (hi1.associated_of_dvd hi2 hdvd))
    exact (hi1.coprime_iff_not_dvd).2 hnotdvd
  -- Step 2: coprimality is preserved by the substitution `p ↦ p.comp (X²)`.
  have hcomp : IsCoprime ((cyclotomic d_1 ℚ).comp (X ^ 2))
      ((cyclotomic d_2 ℚ).comp (X ^ 2)) := by
    obtain ⟨u, v, huv⟩ := hcop
    refine ⟨u.comp (X ^ 2), v.comp (X ^ 2), ?_⟩
    have hcongr := congrArg (fun p : ℚ[X] => p.comp (X ^ 2)) huv
    simpa [add_comp, mul_comp, one_comp] using hcongr
  -- Step 3: coprime elements generate comaximal principal ideals.
  refine ⟨hcomp, ?_⟩
  rw [← Ideal.isCoprime_iff_sup_eq]
  exact (Ideal.isCoprime_span_singleton_iff _ _).2 hcomp

end GrokRxiv
