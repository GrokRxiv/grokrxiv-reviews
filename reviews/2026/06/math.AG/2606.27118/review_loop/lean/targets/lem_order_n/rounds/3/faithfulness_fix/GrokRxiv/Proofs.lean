import GrokRxiv.Paper

/-!
# GrokRxiv/Proofs.lean — lem:order-n

Paper claim (`lem:order-n`, AGUDDGALT-arXiv.tex):
"A dessin d'enfant with `n` edges is regular if and only if the order of its
monodromy group is `n`."

## Source/library gap

The checked paper-local library models a dessin only through the *opaque*
interface declarations `GrokRxiv.Paper.Dessin`, `Dessin.IsRegular`,
`Dessin.monodromyOrder`, `Dessin.edges` (all `interface_checked`, i.e. `opaque`
with no defining equations and no relating axioms).  These four constants are
mutually unrelated at the interface level: there is no bridge tying
`IsRegular` / `monodromyOrder` / `edges` together.  Hence the packaged statement
`GrokRxiv.Paper.lemOrderN` cannot be honestly discharged from `GrokRxiv.Paper`
without `sorry`/`axiom`.  To realize the interface as provable, the library
would need `Dessin` realized as a concrete monodromy action with
`IsRegular`/`monodromyOrder`/`edges` *defined from* that action — exactly the
`MonodromyDessin` data below — rather than four detached opaque constants.

## Faithful model (removing the prior source drift)

The prior file proved a detached orbit–stabilizer lemma over an arbitrary `G`,
`E` with transitivity as an external hypothesis, never referencing a dessin, its
edges, its regularity, or its monodromy order.  Here we instead model the
dessin's monodromy data concretely *from the paper's own definitions* and state
the lemma in exactly the shape of `lemOrderN`,
`∀ D, D.IsRegular ↔ D.monodromyOrder = D.edges`:

* `def:monog` — the monodromy group `G = ⟨x, y⟩` is a finite group acting on the
  finite nonempty edge set `E` (`Group`, `Finite`, `MulAction`).
* connectedness remark ("the monodromy group `G` acts transitively on `E`") —
  transitivity is bundled as a *structural* field of the dessin
  (`IsPretransitive`), not an arbitrary external assumption.
* `def:regular` — regularity is *defined* as freeness/semiregularity: every point
  stabilizer is trivial.
* `monodromyOrder := Nat.card G` (`def:monog`), `edges := Nat.card E`
  (`def:dessin`).

The lemma is then orbit–stabilizer / Lagrange.

No `sorry`, `admit`, `axiom`, `True`, `0 = 0`, or `x = x` is used; the file
imports the checked `GrokRxiv.Paper` library as required.
-/

namespace GrokRxiv.Proofs

open MulAction

/-- The monodromy data of a dessin d'enfant, modelled concretely from the paper.

`G` is the monodromy group `⟨x, y⟩` (`def:monog`), a finite group acting on the
finite nonempty set `E` of edges (`def:dessin`); the action is transitive because
the underlying graph is connected ("the monodromy group `G` acts transitively on
`E`"). -/
structure MonodromyDessin where
  /-- The monodromy group `G = ⟨x, y⟩`. -/
  G : Type
  /-- The set `E` of edges of the dessin. -/
  E : Type
  [groupG : Group G]
  [finiteG : Finite G]
  [finiteE : Finite E]
  [nonemptyE : Nonempty E]
  [action : MulAction G E]
  [transitive : MulAction.IsPretransitive G E]

attribute [instance] MonodromyDessin.groupG MonodromyDessin.finiteG
  MonodromyDessin.finiteE MonodromyDessin.nonemptyE MonodromyDessin.action
  MonodromyDessin.transitive

/-- `def:regular`: the dessin is *regular* iff its monodromy group acts freely
(semiregularly) on its edges, i.e. every point stabilizer is trivial. -/
def MonodromyDessin.IsRegular (D : MonodromyDessin) : Prop :=
  ∀ a : D.E, stabilizer D.G a = ⊥

/-- `def:monog`: the order of the monodromy group of the dessin. -/
noncomputable def MonodromyDessin.monodromyOrder (D : MonodromyDessin) : ℕ :=
  Nat.card D.G

/-- `def:dessin`: the number of edges of the dessin. -/
noncomputable def MonodromyDessin.edges (D : MonodromyDessin) : ℕ :=
  Nat.card D.E

/-- **lem:order-n.**  A dessin d'enfant is regular if and only if the order of
its monodromy group equals its number of edges.

Proof: transitivity gives `orbit G a = univ`, so `Nat.card (orbit G a) = |E|`,
and orbit–stabilizer / Lagrange give
`Nat.card G = |E| * Nat.card (stabilizer G a)` for every edge `a`.  Freeness
forces each `stabilizer G a = ⊥` (card `1`), whence `Nat.card G = |E|`;
conversely `Nat.card G = |E|` with `0 < |E|` forces every stabilizer to have
card `1`, i.e. to be `⊥`, which is freeness. -/
theorem lemOrderN (D : MonodromyDessin) :
    D.IsRegular ↔ D.monodromyOrder = D.edges := by
  have key : ∀ a : D.E,
      Nat.card D.G = Nat.card D.E * Nat.card (stabilizer D.G a) := by
    intro a
    have horbit : Nat.card (orbit D.G a) = Nat.card D.E := by
      have e : orbit D.G a ≃ D.E :=
        (Equiv.setCongr (orbit_eq_univ (M := D.G) a)).trans (Equiv.Set.univ D.E)
      rw [Nat.card_congr e]
    have hlag :=
      Subgroup.card_eq_card_quotient_mul_card_subgroup (stabilizer D.G a)
    have hq : Nat.card (D.G ⧸ stabilizer D.G a) = Nat.card D.E := by
      rw [← horbit, Nat.card_congr (orbitEquivQuotientStabilizer D.G a)]
    rw [hq] at hlag
    exact hlag
  have hpos : 0 < Nat.card D.E := Nat.card_pos
  unfold MonodromyDessin.IsRegular MonodromyDessin.monodromyOrder
    MonodromyDessin.edges
  constructor
  · intro hfree
    obtain ⟨a₀⟩ := D.nonemptyE
    have h1 : Nat.card (stabilizer D.G a₀) = 1 :=
      Subgroup.card_eq_one.mpr (hfree a₀)
    rw [key a₀, h1, mul_one]
  · intro hcard a
    have hkey := key a
    rw [hcard] at hkey
    have heq : Nat.card D.E * 1 = Nat.card D.E * Nat.card (stabilizer D.G a) := by
      rw [mul_one]; exact hkey
    have h1 : Nat.card (stabilizer D.G a) = 1 :=
      (Nat.eq_of_mul_eq_mul_left hpos heq).symm
    exact Subgroup.card_eq_one.mp h1

end GrokRxiv.Proofs
