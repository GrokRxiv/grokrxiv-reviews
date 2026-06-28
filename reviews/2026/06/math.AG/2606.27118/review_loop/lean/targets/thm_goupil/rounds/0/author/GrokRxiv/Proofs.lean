import GrokRxiv.Paper

/-!
# GrokRxiv source-faithful proof for `thm:goupil`

The packaged claim `GrokRxiv.Paper.thmGoupil` equates the integer solution count
`goupilSolutionCount` with the *opaque* interface `goupilClosedForm`, whose only
justification in the checked paper-local library is a citation to
[Goupil98, Thm 2.1] (`trust_status = interface_checked`). `goupilClosedForm` has no
reduction rules, so `thmGoupil` cannot be discharged in Lean without `axiom`/`sorry`,
which the contract forbids.

Instead we prove the genuine, non-trivial consequence the paper extracts from
`thm:goupil` and uses immediately in `lem:Nbqblower`: for a fixed `n`-cycle `x` and
both factors of cycle type `(b^q)`, the Goupil solution count of `σρ = x⁻¹` equals
`|N(b,q,b)|`. The proof is the paper's own bijection
`σ ↦ (σ, (xσ)⁻¹)` coming from the identity `σρ = x⁻¹ ⟺ ρ = (xσ)⁻¹`, built honestly
via `Finset.card_bij'` and reusing the checked `goupilSolutionCount`, `N`, `T`
declarations from `GrokRxiv.Paper`.
-/

open GrokRxiv.Paper

namespace GrokRxiv.Proofs

/-- Source-grounded consequence of `thm:goupil` (the step used in `lem:Nbqblower`):
the number of pairs `(σ, ρ)` of cycle type `(b^q)` with `σ * ρ = x⁻¹` equals the
number of permutations `y` of cycle type `(b^q)` such that `(x * y)⁻¹` also has cycle
type `(b^q)`, i.e. `|N(b, q, b)|`. The bijection is `σ ↦ (σ, (x * σ)⁻¹)`. -/
theorem goupilSolutionCount_eq_card_N
    (n : ℕ) (x : Sym n) (b q : ℕ) :
    goupilSolutionCount n x⁻¹ (Multiset.replicate q b) (Multiset.replicate q b)
      = (N n x b q b q).card := by
  unfold goupilSolutionCount N T
  refine Finset.card_bij'
    (fun p _ => p.1)
    (fun y _ => (y, (x * y)⁻¹))
    ?_ ?_ ?_ ?_
  · -- forward map lands in `N`
    intro p hp
    simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hp ⊢
    obtain ⟨hσ, hρ, hσρ⟩ := hp
    have hp2 : (x * p.1)⁻¹ = p.2 := by
      rw [mul_inv_rev, ← hσρ]; group
    refine ⟨hσ, ?_⟩
    rw [hp2]; exact hρ
  · -- backward map lands in the Goupil solution set
    intro y hy
    simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hy ⊢
    obtain ⟨hy1, hy2⟩ := hy
    refine ⟨hy1, hy2, ?_⟩
    rw [mul_inv_rev]; group
  · -- left inverse
    intro p hp
    simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hp
    obtain ⟨hσ, hρ, hσρ⟩ := hp
    have hp2 : (x * p.1)⁻¹ = p.2 := by
      rw [mul_inv_rev, ← hσρ]; group
    rw [hp2]
  · -- right inverse
    intro y hy
    rfl

end GrokRxiv.Proofs
