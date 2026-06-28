import GrokRxiv.Paper

/-!
# GrokRxiv/Proofs.lean — prop:tbq

Source (AGUDDGALT-arXiv.tex, `prop:tbq`):
"The number of elements in $S_n$ of cycle type $(b^q)$ $(n = bq)$ is
$\vt{T(b,q)} = \f{n!}{b^{q} q!}$."

This file reuses the checked paper-local declarations from `GrokRxiv.Paper`
(`Sym`, `T`) rather than redefining them, and proves the cardinality of the
`(b^q)`-cycle-type set FROM FIRST PRINCIPLES via Mathlib's genuine cycle-type
enumeration `Equiv.Perm.card_of_cycleType`.  No counting identity is assumed.

## Why the result is stated for `2 ≤ b` (forced encoding-faithfulness condition)

The paper-local statement `GrokRxiv.Paper.propTbq` carries only `0 < b`.
However, `Equiv.Perm.cycleType` in Lean DROPS fixed points (1-cycles), so the
paper phrase "cycle type `(b^q)`" is faithfully encoded by
`cycleType = Multiset.replicate q b` only when `b ≥ 2`.  For `b = 1`, `q ≥ 1`
the predicate is unsatisfiable, hence `(T n 1 q).card = 0`, while
`n! / (1^q · q!) = 1` (e.g. `b = q = n = 1`).  Thus `propTbq` with `0 < b` is
LITERALLY FALSE in this encoding and cannot be honestly proved; the paper only
ever uses `T(b,q)` with a genuine cycle length `b ≥ 2` (uniform passport part
`b^q`).  We therefore prove the source-faithful regime `2 ≤ b`, reusing the
checked set `GrokRxiv.Paper.T` and the EXACT source right-hand side
`n! / (b^q · q!)`, with no extra combinatorial hypothesis.

## How the count is obtained from first principles

`Equiv.Perm.card_of_cycleType (Multiset.replicate q b)` evaluates the cardinality
`|{σ : Perm (Fin n) | σ.cycleType = m}|` under an `if`-GUARD whose condition is
`m.sum ≤ Fintype.card (Fin n) ∧ ∀ a ∈ m, 2 ≤ a` (note: `≤`, not `=`), with
then-branch
`(Fintype.card (Fin n))! / ((Fintype.card (Fin n) - m.sum)! · m.prod · ∏ k ∈ m.toFinset, (m.count k)!)`.
For the paper cycle type `m = Multiset.replicate q b`:
* `m.sum = q • b = b·q = n` (`Multiset.sum_replicate`, `nsmul_eq_mul`); we keep
  this as the equality `hsum` and feed `le_of_eq hsum` into the `≤`-guard;
* all parts equal `b ≥ 2` (`Multiset.eq_of_mem_replicate`);
* `m.prod = b ^ q` (`Multiset.prod_replicate`);
* `∏ k ∈ m.toFinset, (m.count k)! = q!` (singleton `{b}` with count `q`, plus
  the `q = 0` empty case).
The surplus `(card - m.sum)!` factor collapses: `hsum` turns `card - m.sum`
into `card - card`, `Nat.sub_self` to `0`, `Nat.factorial_zero` to `1`, and
`Nat.one_mul` clears it, leaving exactly the source formula `n! / (b^q · q!)`.
-/

open GrokRxiv.Paper

/-- prop:tbq (source-faithful regime `2 ≤ b`), proved from first principles.
The number of permutations of `S_n` of cycle type `(b^q)` with `n = b*q` equals
`n! / (b^q q!)`.  The cardinality is computed by Mathlib's cycle-type
enumeration `Equiv.Perm.card_of_cycleType`; no counting identity is assumed.
Stated with the checked paper-local set `GrokRxiv.Paper.T`. -/
theorem card_T_eq_cycleType
    (n b q : ℕ) (hb : 2 ≤ b) (hn : n = b * q) :
    (T n b q).card = n.factorial / (b ^ q * q.factorial) := by
  have hsum : (Multiset.replicate q b).sum = Fintype.card (Fin n) := by
    rw [Multiset.sum_replicate, nsmul_eq_mul, Nat.cast_id, Fintype.card_fin, hn,
      Nat.mul_comm]
  have hmem : ∀ a ∈ Multiset.replicate q b, 2 ≤ a := by
    intro a ha
    rw [Multiset.eq_of_mem_replicate ha]
    exact hb
  have hcond :
      (Multiset.replicate q b).sum ≤ Fintype.card (Fin n) ∧
        ∀ a ∈ Multiset.replicate q b, 2 ≤ a := ⟨le_of_eq hsum, hmem⟩
  have hprod : (Multiset.replicate q b).prod = b ^ q := Multiset.prod_replicate q b
  have hcount :
      (∏ k ∈ (Multiset.replicate q b).toFinset,
          ((Multiset.replicate q b).count k).factorial) = q.factorial := by
    rcases Nat.eq_zero_or_pos q with hq | hq
    · subst hq; simp
    · rw [Multiset.toFinset_replicate, if_neg (by omega), Finset.prod_singleton,
        Multiset.count_replicate_self]
  unfold T
  rw [Finset.filter_congr_decidable, Equiv.Perm.card_of_cycleType, if_pos hcond,
    hsum, Nat.sub_self, Nat.factorial_zero, Nat.one_mul, hprod, hcount,
    Fintype.card_fin]
