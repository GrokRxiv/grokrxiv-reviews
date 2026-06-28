import GrokRxiv.Paper.Statements

/-! Genuinely proved, target-independent helpers. None of the selected target
    claims (`itemLift`, `mainThm`, `thmKS`, `corMain`) is proved here. -/

namespace GrokRxiv.Paper

/-- The zero section lies in the torsion subgroup `MW(A/C)_tors`. -/
theorem isTorsion_zero (S : Setup) :
    letI := S.mwGroup
    IsTors S 0 := by
  letI := S.mwGroup
  exact ⟨1, Nat.one_pos, by simp⟩

/-- Definitional split of `main_thm` into its two parts. -/
theorem mainThm_iff (S : Setup) :
    mainThm S ↔ (mainThmHom S ∧ mainThmKernel S) := Iff.rfl

end GrokRxiv.Paper
