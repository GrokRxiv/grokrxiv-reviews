import GrokRxiv.Paper

/-!
# `lem:order-n`

Source (AGUDDGALT-arXiv.tex):
  "A dessin d'enfant with `n` edges is regular if and only if the order of its
   monodromy group is `n`."

The target statement is already exported by the checked paper-local library as
`GrokRxiv.Paper.lemOrderN : ∀ D : Dessin, D.IsRegular ↔ D.monodromyOrder = D.edges`.
We reuse it verbatim together with the opaque interface accessors `Dessin`,
`Dessin.IsRegular`, `Dessin.monodromyOrder`, and `Dessin.edges`.

LIBRARY GAP: `Dessin` and its accessors are opaque (`interface_checked`) and
`GrokRxiv.Paper` exports no lemma connecting `IsRegular`, `monodromyOrder`, and
`edges`.  The paper itself discharges the lemma only by external citation
[Ohnishi26, Lemma 2.7], via the three action-theoretic facts recorded in the
surrounding text:
  * the monodromy group `G` acts transitively on the `n` edges, so `n ≤ |G|`;
  * a regular dessin's `G` acts freely, so `|G| ≤ n`;
  * if `|G| = n` then the action is free, i.e. the dessin is regular.
None of these bridges is available as a checked declaration, so the biconditional
is not derivable from the library alone (and we must not use `sorry`/`axiom`).

We therefore expose the blocker honestly as a *conditional* theorem: given exactly
those three bridge facts as hypotheses, the lemma follows by `le_antisymm` on ℕ.
Each hypothesis is strictly weaker than the goal and pinpoints the missing
interface lemma; once `GrokRxiv.Paper` exports them (or the full lemma), this
theorem discharges `lemOrderN` by application.
-/

namespace GrokRxiv.Proofs

open GrokRxiv.Paper

/-- `lem:order-n`, reduced to the three interface bridge facts the cited proof
supplies.  `htrans` is `n ≤ |G|` (transitivity of the monodromy action),
`hfree` is regular ⇒ `|G| ≤ n` (free action), and `hregular` is `|G| = n ⇒`
regular.  Combined they give the biconditional `D.IsRegular ↔ D.monodromyOrder = D.edges`. -/
theorem lemOrderN_of_bridges
    (htrans : ∀ D : Dessin, D.edges ≤ D.monodromyOrder)
    (hfree : ∀ D : Dessin, D.IsRegular → D.monodromyOrder ≤ D.edges)
    (hregular : ∀ D : Dessin, D.monodromyOrder = D.edges → D.IsRegular) :
    lemOrderN := by
  unfold lemOrderN
  intro D
  constructor
  · intro hreg
    exact le_antisymm (hfree D hreg) (htrans D)
  · intro h
    exact hregular D h

end GrokRxiv.Proofs
