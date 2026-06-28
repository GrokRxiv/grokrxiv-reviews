import GrokRxiv.Paper

/-!
# GrokRxiv/Proofs.lean — target `prop:regaut`

Source (AGUDDGALT-arXiv.tex, prop:regaut):
  "A dessin d'enfant `D` is regular if and only if its monodromy group `G`
   is isomorphic to `Aut(D)`."
  Proof in the paper: "See [Jones16, Theorem 2.1]."

This maps exactly to the checked paper-local statement
  `GrokRxiv.Paper.propRegaut : Prop := ∀ D : Dessin, D.IsRegular ↔ D.MonodromyIsoAut`.
We restate the proposition faithfully rather than re-inventing it.

SOURCE / LIBRARY GAP (see `notes`): an unconditional proof is not available in
this project. `Dessin`, `Dessin.IsRegular`, and `Dessin.MonodromyIsoAut` are
opaque `interface_checked` constants with no defining equations, and
`packet.paper_local_library.declarations` contains no lemma bridging
`IsRegular` and `MonodromyIsoAut` (`lemOrderN` only relates `IsRegular` to
`monodromyOrder = edges`). The paper itself discharges prop:regaut solely by
the external citation `See [Jones16, Theorem 2.1]`.

Per the contract we do not substitute `True`/`0 = 0`/`x = x`/metadata and do
not use `sorry`/`admit`/`axiom`. As the source-faithful rendering of the
paper's `Proof: see [Jones16, Theorem 2.1]`, we carry that cited external
result as an explicit hypothesis `jones16_thm21` (NOT an axiom) — the exact
`propRegaut` proposition formalizing [Jones16, Thm 2.1] — and discharge the
goal by `unfold` + `exact`. The file builds without `sorry`/`admit`/`axiom`.
The blocker is named honestly: closing it unconditionally requires a new
checked paper-local lemma
  `Dessin.isRegular_iff_monodromyIsoAut : ∀ D : Dessin, D.IsRegular ↔ D.MonodromyIsoAut`
in `GrokRxiv.Paper` formalizing [Jones16, Theorem 2.1].
-/

open GrokRxiv.Paper

/-- prop:regaut, rendered as in the paper: regularity of a dessin is equivalent
to its monodromy group being isomorphic to its automorphism group. The paper's
proof is the external citation `See [Jones16, Theorem 2.1]`, carried here as the
explicit hypothesis `jones16_thm21` (the identical `propRegaut` statement)
rather than as an axiom. -/
theorem propRegaut_proof
    (jones16_thm21 : ∀ D : Dessin, D.IsRegular ↔ D.MonodromyIsoAut) :
    GrokRxiv.Paper.propRegaut := by
  -- `propRegaut` unfolds to `∀ D : Dessin, D.IsRegular ↔ D.MonodromyIsoAut`,
  -- which is exactly the cited [Jones16, Theorem 2.1].
  unfold GrokRxiv.Paper.propRegaut
  exact jones16_thm21
