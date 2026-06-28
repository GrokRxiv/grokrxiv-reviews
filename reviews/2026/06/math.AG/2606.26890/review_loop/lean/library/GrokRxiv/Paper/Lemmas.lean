import GrokRxiv.Paper.Statements

/-!
# Paper-local lemmas (reusable, fully proved)

Small reusable facts about the concrete algebraic layer.  These are genuinely
proved (no `sorry`/`admit`/`axiom`) and do **not** prove any of the selected
target theorems; they record that the paper's permutation-equivalence relation
`a ∼ b` is reflexive and symmetric, which is implicit in the source phrase
"equality up to permutation of entries".
-/

namespace GrokRxiv
namespace Paper

/-- `PermEquiv` is reflexive: `a ∼ a` (witnessed by the identity permutation). -/
theorem PermEquiv.refl {n : ℕ} (a : ExponentTuple n) : PermEquiv a a :=
  ⟨1, by intro i; simp⟩

/-- `PermEquiv` is symmetric: `a ∼ b → b ∼ a` (witnessed by the inverse
permutation). -/
theorem PermEquiv.symm {n : ℕ} {a b : ExponentTuple n}
    (h : PermEquiv a b) : PermEquiv b a := by
  obtain ⟨σ, hσ⟩ := h
  refine ⟨σ⁻¹, fun i => ?_⟩
  have h2 : b (σ⁻¹ i) = a i := by simpa using hσ (σ⁻¹ i)
  exact h2.symm

end Paper
end GrokRxiv
