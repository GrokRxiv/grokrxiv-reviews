import GrokRxiv.Paper

/-!
# GrokRxiv/Proofs.lean — target `prop:reguni`

Source (AGUDDGALT-arXiv.tex, Proposition `prop:reguni`):
"If a dessin is regular, then it has a uniform passport."

The checked paper-local library already provides the verbatim statement as
`GrokRxiv.Paper.propReguni : ∀ D : Dessin, D.IsRegular → D.HasUniformPassport`,
which we reuse below.

SOURCE / LIBRARY GAP
--------------------
`Dessin`, `Dessin.IsRegular`, and `Dessin.HasUniformPassport` are all `opaque`
interfaces (trust_status `interface_checked`). The checked `GrokRxiv.Paper`
library contains no link between regularity and uniform passports
(`HasUniformPassport` occurs nowhere except in this proposition). The paper's
proof cites external results (Girondo12 Prop. 4.42, Ohnishi26 Prop. 2.10) and
reasons about the internal geometric meaning of these opaque notions, which is
intentionally unmodeled here. Hence `propReguni` is not honestly provable from
`GrokRxiv.Paper` alone.

Rather than use `sorry`/`axiom` or a strawman, we expose the blocker: the exact
missing geometric content is named as an explicit hypothesis
`regular_imp_uniform`, and we prove the verbatim `propReguni` from it. This
makes the gap auditable and the dependence on external results explicit.
-/

open GrokRxiv.Paper

namespace GrokRxiv.Proofs

/-- The single interface fact that the paper imports from
`Girondo12 Prop. 4.42` and `Ohnishi26 Prop. 2.10`: regularity of a dessin
forces its passport to be uniform. This is precisely the unmodeled geometric
content missing from the checked `GrokRxiv.Paper` library, surfaced here as an
explicit hypothesis instead of being silently axiomatized. -/
def RegularImpliesUniform : Prop :=
  ∀ D : Dessin, D.IsRegular → D.HasUniformPassport

/-- Verbatim `prop:reguni`, discharged from the explicit interface hypothesis
`regular_imp_uniform`. The conclusion is the library's own
`GrokRxiv.Paper.propReguni`, so no statement is weakened or replaced. -/
theorem propReguni_of_interface
    (regular_imp_uniform : RegularImpliesUniform) : propReguni := by
  intro D hD
  exact regular_imp_uniform D hD

end GrokRxiv.Proofs
