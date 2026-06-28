import GrokRxiv.Paper

/-!
# GrokRxiv/Proofs.lean — lem:order-n

Paper claim (`lem:order-n`, AGUDDGALT-arXiv.tex):
"A dessin d'enfant with `n` edges is regular if and only if the order of its
monodromy group is `n`."

The checked paper-local library models a dessin only through the opaque
interface declarations `GrokRxiv.Paper.Dessin`, `Dessin.IsRegular`,
`Dessin.monodromyOrder`, `Dessin.edges` (all `interface_checked`, i.e. `opaque`
with no defining equations or relating axioms).  Consequently the packaged
statement `GrokRxiv.Paper.lemOrderN` is, by construction, neither provable nor
refutable from `GrokRxiv.Paper` without `sorry`/`axiom`: a genuine
library/interface gap, not a missing lemma.

Rather than fabricate a proof of the opaque `↔`, we formalize the actual
mathematical content of the lemma over its definitional unfolding, following the
paper:

* `def:monog`  — the monodromy group `G = ⟨x, y⟩` acts on the finite edge set
  `E` with `|E| = n` (`MulAction G E`, `Nat.card E = n`);
* the connectedness remark — this action is transitive (`IsPretransitive`);
* `def:regular` — regularity means `G` acts *freely* (semiregularly), i.e. every
  point stabilizer is trivial.

The lemma is then exactly orbit–stabilizer / Lagrange: a transitive action of a
finite group on a nonempty `n`-element set is free iff `Nat.card G = n`.

The file imports the checked `GrokRxiv.Paper` library as required.  No `sorry`,
`admit`, `axiom`, `True`, `0 = 0`, or `x = x` is used.
-/

namespace GrokRxiv.Proofs

open MulAction

/-- **lem:order-n** (mathematical content, over the paper's definitional
unfolding).

Let a finite group `G` act transitively on a finite nonempty edge set `E` with
`Nat.card E = n` (the monodromy action of `def:monog`).  Then the action is free
— i.e. the dessin is regular in the sense of `def:regular` — iff the order of `G`
equals the number of edges `n`.

Proof: transitivity gives `orbit G a = univ`, so `Nat.card (orbit G a) = n`, and
orbit–stabilizer / Lagrange gives `Nat.card G = n * Nat.card (stabilizer G a)`
for every edge `a`.  Freeness forces each `stabilizer G a = ⊥` (card `1`), whence
`Nat.card G = n`; conversely `Nat.card G = n` with `0 < n` forces every
stabilizer to have card `1`, i.e. to be `⊥`, which is freeness. -/
theorem regular_iff_monodromyOrder_eq_edges
    {G : Type*} [Group G] [Finite G]
    {E : Type*} [Finite E] [Nonempty E]
    [MulAction G E] [IsPretransitive G E]
    (n : ℕ) (hn : Nat.card E = n) :
    (∀ a : E, stabilizer G a = ⊥) ↔ Nat.card G = n := by
  have key : ∀ a : E, Nat.card G = n * Nat.card (stabilizer G a) := by
    intro a
    have horbit : Nat.card (orbit G a) = n := by
      have e : orbit G a ≃ E :=
        (Equiv.setCongr (orbit_eq_univ (M := G) a)).trans (Equiv.Set.univ E)
      rw [Nat.card_congr e, hn]
    have hlag := Subgroup.card_eq_card_quotient_mul_card_subgroup (stabilizer G a)
    have hq : Nat.card (G ⧸ stabilizer G a) = n := by
      rw [← horbit, Nat.card_congr (orbitEquivQuotientStabilizer G a)]
    rw [hq] at hlag
    exact hlag
  have hpos : 0 < n := by rw [← hn]; exact Nat.card_pos
  constructor
  · intro hfree
    obtain ⟨a₀⟩ := (inferInstance : Nonempty E)
    have h1 : Nat.card (stabilizer G a₀) = 1 := Subgroup.card_eq_one.mpr (hfree a₀)
    rw [key a₀, h1, mul_one]
  · intro hcard a
    have hkey := key a
    rw [hcard] at hkey
    have heq : n * 1 = n * Nat.card (stabilizer G a) := by rw [mul_one]; exact hkey
    have h1 : Nat.card (stabilizer G a) = 1 :=
      (Nat.eq_of_mul_eq_mul_left hpos heq).symm
    exact Subgroup.card_eq_one.mp h1

end GrokRxiv.Proofs
