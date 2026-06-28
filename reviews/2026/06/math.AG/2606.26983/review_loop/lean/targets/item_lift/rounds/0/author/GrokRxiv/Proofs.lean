import GrokRxiv.Paper

/-!
# GrokRxiv/Proofs.lean — target `item_lift`

Proposition `prop_main` (1) of `main.tex`:
  the restriction `Pic(A)_rig → Pic(A_η)` is a group isomorphism.

This is the checked paper-local statement
`GrokRxiv.Paper.itemLift : Setup → Prop`, evaluated on the checked
`GrokRxiv.Paper.Setup`. Both are reused verbatim from the paper-local
library; neither is redefined here, and no strawman (`True`, `0 = 0`,
`x = x`, metadata) is substituted for the real claim.

SOURCE/LIBRARY GAP: the paper proves `item_lift` from the equivalence of
cubist `𝔾_m`-torsor categories
`CUB(A, 𝔾_{m,C}) → CUB(A_η, 𝔾_{m,η})` (cited as [M85, Ch.2 Thm 1.1],
Breen), composed with the forgetful functor to rigidified torsors. That
restriction-equivalence is NOT present as a checked declaration in
`GrokRxiv.Paper`, and the carriers `PicRigCarrier` / `PicEtaCarrier` are
`opaque` (no constructible elements), so `itemLift S` has no in-library
constructive proof witness. Rather than fabricate one with `sorry` /
`axiom` / a fake lemma, we state the genuine claim and `unfold` it,
leaving the exact unfolded goal for `lake build` to report to the fixer.
To close this honestly the library must add the cubist
restriction-equivalence (or a packaged group-isomorphism field on
`Setup`) as a checked `GrokRxiv.Paper` declaration; the fixer can then
finish with `exact <that lemma>`.
-/

open GrokRxiv.Paper

theorem item_lift (S : Setup) : itemLift S := by
  unfold itemLift
