import Mathlib
import GrokRxiv.Paper.Definitions

/-! Checked structural lemmas about the concrete sets `T` and `N`.
    These are paper-local facts (`N ⊆ T`, used implicitly throughout §3),
    not target claims. -/

namespace GrokRxiv.Paper

/-- `N(b,q,a)` is a subset of `T(b,q)`. -/
lemma N_subset_T (n : ℕ) (x : Sym n) (b q a p : ℕ) :
    N n x b q a p ⊆ T n b q := by
  intro y hy
  unfold N at hy
  exact Finset.mem_of_mem_filter _ hy

/-- Hence `|N(b,q,a)| ≤ |T(b,q)|`. -/
lemma card_N_le_card_T (n : ℕ) (x : Sym n) (b q a p : ℕ) :
    (N n x b q a p).card ≤ (T n b q).card :=
  Finset.card_le_card (N_subset_T n x b q a p)

end GrokRxiv.Paper
