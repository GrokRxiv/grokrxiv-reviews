import GrokRxiv.Paper.Statements

/-!
# Helper lemmas (proved)

These only unfold definitional content of the interface maps; they do not prove
any selected target claim.
-/

namespace GrokRxiv.Paper

/-- `φ` sends the zero section to `0`: `φ(0) = [0] - [0] = 0`. -/
theorem phiMap_zero : phiMap (0 : paper.MW) = 0 := by
  simp only [phiMap, sub_self]

/-- `ψ` sends the zero section to `0`: `ψ(0) = [0] - [0] = 0`. -/
theorem psiMap_zero : psiMap (0 : paper.MW) = 0 := by
  simp only [psiMap, sub_self]

/-- `ψ(Z) = 0` exactly when `[Z] = [Z_0]` generically. -/
theorem psiMap_eq_zero_iff (Z : paper.MW) :
    psiMap Z = 0 ↔ paper.clGen Z = paper.clGen 0 := by
  simp only [psiMap, sub_eq_zero]

/-- Definitional reformulation of the `item_lift` statement. -/
theorem itemLiftStatement_iff :
    itemLiftStatement ↔
      Function.Bijective restrictMap ∧
        ∀ x y : paper.PicRig,
          restrictMap (x + y) = restrictMap x + restrictMap y :=
  Iff.rfl

end GrokRxiv.Paper
