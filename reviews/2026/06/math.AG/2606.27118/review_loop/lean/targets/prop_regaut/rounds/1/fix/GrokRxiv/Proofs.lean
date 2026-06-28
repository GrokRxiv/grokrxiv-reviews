import GrokRxiv.Paper

/-!
# GrokRxiv/Proofs.lean — target `prop:regaut`

Source (AGUDDGALT-arXiv.tex, prop:regaut):
  "A dessin d'enfant `D` is regular if and only if its monodromy group `G`
   is isomorphic to `Aut(D)`."

This maps exactly to the checked paper-local statement
  `GrokRxiv.Paper.propRegaut : Prop := ∀ D : Dessin, D.IsRegular ↔ D.MonodromyIsoAut`
so we restate the proposition faithfully rather than re-inventing it.

SOURCE / LIBRARY GAP (see `notes`): the equivalence cannot be honestly proven
in this project. `Dessin.IsRegular` and `Dessin.MonodromyIsoAut` are opaque
interface constants (trust_status `interface_checked`) with no defining
equations, so neither direction of the `↔` has any logical content to unfold.
The paper's own proof is the external citation `See [Theorem 2.1]{Jones16}`,
and `packet.paper_local_library.declarations` contains no bridging lemma between
`IsRegular` and `MonodromyIsoAut` (`lemOrderN` only links `IsRegular` to
`monodromyOrder = edges`, never to `MonodromyIsoAut`). Per the contract we do
not substitute `True`/`0 = 0`/`x = x`/metadata and do not use
`sorry`/`admit`/`axiom`. Instead the two genuine proof obligations are left
open via `skip`, so `lake build GrokRxiv.Proofs` fails with `unsolved goals`,
exposing the blocker. The fix that would make this compile is a new checked
paper-local lemma in `GrokRxiv.Paper` of the form
  `Dessin.isRegular_iff_monodromyIsoAut : ∀ D : Dessin, D.IsRegular ↔ D.MonodromyIsoAut`
formalizing [Jones16, Thm 2.1]; without it no honest proof exists.
-/

open GrokRxiv.Paper

theorem propRegaut_proof : GrokRxiv.Paper.propRegaut := by
  -- `propRegaut` unfolds to `∀ D : Dessin, D.IsRegular ↔ D.MonodromyIsoAut`.
  unfold GrokRxiv.Paper.propRegaut
  intro D
  constructor
  · -- `D.IsRegular → D.MonodromyIsoAut`
    -- Blocked: `IsRegular`/`MonodromyIsoAut` are opaque; no bridging lemma
    -- and no internal proof (paper cites [Jones16, Theorem 2.1]).
    intro _hreg
    skip
  · -- `D.MonodromyIsoAut → D.IsRegular`
    intro _hiso
    skip
