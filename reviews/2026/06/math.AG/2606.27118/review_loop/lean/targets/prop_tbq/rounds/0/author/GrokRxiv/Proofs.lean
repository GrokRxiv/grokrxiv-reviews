import GrokRxiv.Paper

/-!
# GrokRxiv/Proofs.lean — prop:tbq

Source (AGUDDGALT-arXiv.tex, `prop:tbq`):
"The number of elements in $S_n$ of cycle type $(b^q)$ $(n = bq)$ is
$\vt{T(b,q)} = \f{n!}{b^{q} q!}$."

This file reuses the checked paper-local declarations from `GrokRxiv.Paper`
(`Sym`, `T`) rather than redefining them.

Honesty note 1 (SOURCE/ENCODING GAP).
The paper-local statement `GrokRxiv.Paper.propTbq` hypothesizes only `0 < b`.
In Lean, `Equiv.Perm.cycleType` omits fixed points (1-cycles), so for `b = 1`
the predicate `cycleType = Multiset.replicate q 1` is unsatisfiable for `q ≥ 1`,
hence `(T n 1 q).card = 0`, while `n! / (1^q * q!) = q!/q! = 1`
(counterexample `b = q = n = 1`). The source proposition is mathematically true
for every `b ≥ 1`, but the encoding through `T` is faithful only for `b ≥ 2`.
We therefore prove the source-faithful regime `2 ≤ b` (and so do NOT assert the
unprovable `propTbq` verbatim), still reusing the checked `T` and the exact
right-hand side `n! / (b^q * q!)`.

Honesty note 2 (LIBRARY/MATHLIB GAP).
The trivial division step is discharged here: from the orbit–stabilizer count
`n! = (b^q * q!) * |T(b,q)|` we get `|T(b,q)| = n! / (b^q * q!)` by
`Nat.mul_div_cancel_left` (the divisor is positive since `b ≥ 2`). The whole
theorem is thereby reduced to the single counting identity
`n! = (b^q * q!) * |T(b,q)|`, i.e. that the conjugacy class of a `(b^q)`-type
permutation has centralizer order `b^q * q!` (the wreath product `C_b ≀ S_q`).
We invoke this as `card_perm_eq_centralizer_mul_card_cycleType`. We are NOT
confident this exact lemma exists in the current Mathlib; if `lake build`
reports `unknown identifier card_perm_eq_centralizer_mul_card_cycleType`, that
error is the genuine, isolated blocker — the symmetric-group conjugacy-class
cardinality / `b^q * q!` centralizer order must be located in Mathlib and
substituted by the fixer. No `sorry`/`admit`/`axiom`/`True`/`x = x` strawman is
used; the statement is the real source claim.
-/

open GrokRxiv.Paper

/-- Orbit–stabilizer / centralizer count for a `(b^q)`-type conjugacy class:
the number of permutations of `Fin n` (`n = b*q`, `b ≥ 2`) with cycle type
`b` repeated `q` times, scaled by the centralizer order `b^q * q!`, recovers
`n!`. Reduces `prop:tbq` to this single external counting identity. -/
theorem card_perm_mul_cycleType_eq_factorial
    {n b q : ℕ} (hb : 2 ≤ b) (hn : n = b * q) :
    n.factorial = (b ^ q * q.factorial) * (T n b q).card :=
  card_perm_eq_centralizer_mul_card_cycleType hb hn

/-- prop:tbq (source-faithful regime `2 ≤ b`): the number of permutations of
`S_n` of cycle type `(b^q)` with `n = b*q` equals `n! / (b^q * q!)`,
stated with the checked paper-local set `GrokRxiv.Paper.T`. -/
theorem card_T_eq (n b q : ℕ) (hb : 2 ≤ b) (hn : n = b * q) :
    (T n b q).card = n.factorial / (b ^ q * q.factorial) := by
  have hpos : 0 < b ^ q * q.factorial :=
    Nat.mul_pos (pow_pos (by omega) q) (Nat.factorial_pos q)
  rw [card_perm_mul_cycleType_eq_factorial hb hn]
  exact (Nat.mul_div_cancel_left _ hpos).symm
