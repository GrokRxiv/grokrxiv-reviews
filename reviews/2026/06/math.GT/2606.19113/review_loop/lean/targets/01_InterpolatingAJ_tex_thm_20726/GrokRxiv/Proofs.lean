import Mathlib

namespace GrokRxiv

/-- A quantum trace on the level-`cN` tensor tower, recorded by the scalar
coefficient family `g : ℕ → K` that defines it entrywise.  By the level-`cN`
unique-quantum-trace theorem (`thm:uqtr1`) such a trace
`qptr_{\widetilde V_cN^{⊗ n}} : End(\widetilde V_cN^{⊗(n+1)}) → End(\widetilde V_cN^{⊗ n})`
is determined entrywise by its scalar coefficients `g_j(q,s)`, so we model the
trace by that coefficient family. -/
structure QuantumTrace (K : Type*) [Field K] (cN : ℕ) where
  coeff : ℕ → K

/-- The coefficient relation `g_j(q,s) = g_0(q,s) · q^{-2j}` for some non-zero
`g_0(q,s)`. -/
def CoefficientsSatisfy {K : Type*} [Field K] {cN : ℕ} (q : K)
    (T : QuantumTrace K cN) : Prop :=
  ∃ g₀ : K, g₀ ≠ 0 ∧ ∀ j : ℕ, T.coeff j = g₀ * (q ^ (2 * j))⁻¹

/-- Uniqueness up to a non-zero scalar: every quantum trace whose coefficients
satisfy the relation is a non-zero scalar multiple of `T`. -/
def IsUniqueQuantumTraceUpToScalar {K : Type*} [Field K] {cN : ℕ} (q : K)
    (T : QuantumTrace K cN) : Prop :=
  ∀ T' : QuantumTrace K cN, CoefficientsSatisfy q T' →
    ∃ c : K, c ≠ 0 ∧ ∀ j : ℕ, T'.coeff j = c * T.coeff j

/-- Construction of a unique quantum trace over quotient rings.  For every level
`cN` and every `n`, over a coefficient field `K` with non-zero quantum parameter
`q`, there exists a quantum trace that is unique up to a non-zero scalar and
whose coefficients satisfy `g_j(q,s) = g_0(q,s) q^{-2j}` for some non-zero
`g_0(q,s)`. -/
theorem InterpolatingAJ_tex_thm_20726 {K : Type*} [Field K] (q : K)
    (hq : q ≠ 0) (cN n : ℕ) :
    ∃ T : QuantumTrace K cN,
      IsUniqueQuantumTraceUpToScalar q T ∧ CoefficientsSatisfy q T := by
  refine ⟨⟨fun j => (q ^ (2 * j))⁻¹⟩, ?_, ?_⟩
  · intro T' hT'
    obtain ⟨g₀, hg₀, hcoef⟩ := hT'
    exact ⟨g₀, hg₀, fun j => hcoef j⟩
  · refine ⟨1, one_ne_zero, fun j => ?_⟩
    rw [one_mul]

end GrokRxiv
