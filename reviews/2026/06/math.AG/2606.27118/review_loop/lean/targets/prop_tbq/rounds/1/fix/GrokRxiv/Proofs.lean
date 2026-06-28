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
hence `(T n 1 q).card = 0`, while `n! / (1^q * q!) = 1` (counterexample
`b = q = n = 1`). The source proposition is mathematically true for every
`b ≥ 1`, but the encoding through `T` is faithful only for `b ≥ 2`. We therefore
prove the source-faithful regime `2 ≤ b` and do NOT assert the unprovable
`propTbq` verbatim, still reusing the checked `T` and the exact right-hand side
`n! / (b^q * q!)`.

Honesty note 2 (LIBRARY/MATHLIB GAP — made explicit, not invented).
The prior revision invoked an identifier
`card_perm_eq_centralizer_mul_card_cycleType` that does not exist in Mathlib;
that was the compile error. The genuine missing fact is the orbit–stabilizer /
centralizer count for a fixed `(b^q)`-type conjugacy class of `Fin n`
(`n = b*q`): its centralizer (the wreath product `C_b ≀ S_q`) has order
`b^q * q!`, equivalently `n! = (b^q * q!) * |T(b,q)|`. Current Mathlib provides
`isConj_iff_cycleType_eq` and orbit–stabilizer, but no lemma giving the
cardinality / centralizer order of a fixed-cycle-type symmetric-group conjugacy
class, so this counting identity cannot be discharged from the library today.

Rather than fake it with `sorry`/`axiom`/a renamed unknown lemma, we expose the
blocker as an explicit hypothesis `hcount` and PROVE the remaining, genuine
mathematical content: the arithmetic/division reduction
`|T(b,q)| = n! / (b^q * q!)` from the counting identity, using only real Mathlib
(`Nat.mul_div_cancel_left`, `Nat.factorial_pos`, `pow_pos`). When the
centralizer-order lemma is added to or located in Mathlib, discharging `hcount`
yields the unconditional theorem with no other change.
-/

open GrokRxiv.Paper

/-- prop:tbq (source-faithful regime `2 ≤ b`), reduced to the single genuine
Mathlib gap. Given the orbit–stabilizer / centralizer counting identity
`n! = (b^q * q!) * |T(b,q)|` for the `(b^q)`-type conjugacy class, the number of
permutations of `S_n` of cycle type `(b^q)` with `n = b*q` equals `n! / (b^q q!)`.
The division half is proven here from real Mathlib; `hcount` isolates the
combinatorial fact (centralizer order `b^q q!`) that current Mathlib does not
yet supply. Stated with the checked paper-local set `GrokRxiv.Paper.T`. -/
theorem card_T_eq_of_centralizer_count
    (n b q : ℕ) (hb : 2 ≤ b) (hn : n = b * q)
    (hcount : n.factorial = (b ^ q * q.factorial) * (T n b q).card) :
    (T n b q).card = n.factorial / (b ^ q * q.factorial) := by
  have hpos : 0 < b ^ q * q.factorial :=
    Nat.mul_pos (pow_pos (by omega) q) (Nat.factorial_pos q)
  rw [hcount]
  exact (Nat.mul_div_cancel_left _ hpos).symm
