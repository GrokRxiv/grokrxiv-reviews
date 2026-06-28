import GrokRxiv.Paper

/-!
# GrokRxiv/Proofs.lean — target `item_lift`

Proposition `prop_main` item (1) of `main.tex`:
  the restriction `Pic(A)_rig → Pic(A_η)` is a group isomorphism.

This is the checked paper-local statement
`GrokRxiv.Paper.itemLift : Setup → Prop`, evaluated on the checked
`GrokRxiv.Paper.Setup`. Both are reused verbatim from the paper-local
library; neither is redefined here, and no strawman (`True`, `0 = 0`,
`x = x`, metadata) is substituted for the real claim.

SOURCE/LIBRARY GAP. The compiler reports that `itemLift S` unfolds to
  `(∀ x y : PicRigCarrier, S.restrict (x + y) = S.restrict x + S.restrict y)`
  `∧ Function.Bijective S.restrict`.
The paper proves this from the equivalence of cubist `𝔾_m`-torsor
categories `CUB(A, 𝔾_{m,C}) → CUB(A_η, 𝔾_{m,η})` (cited [M85, Ch.2,
Thm 1.1]; Breen [B83]), composed with the forgetful functor to
rigidified torsors. That restriction-equivalence — exactly what makes
`restrict` additive and bijective — is NOT among the 19 checked
`GrokRxiv.Paper` declarations, and `Setup` carries no field asserting
additivity or bijectivity of `restrict`. The carriers `PicRigCarrier`
and `PicEtaCarrier` are `opaque := PUnit`, so neither subgoal is
closable in-library. We keep the genuine checked statement
`GrokRxiv.Paper.itemLift S` (no strawman, no `sorry`/`admit`/`axiom`)
and split the conjunction with `refine ⟨?_, ?_⟩` so the two real
blockers are exposed to `lake build`:
  * `?_restrict_add`        — additivity of `S.restrict`;
  * `?_restrict_bijective`  — `Function.Bijective S.restrict`.
To close honestly, add the cubist restriction-equivalence to
`GrokRxiv.Paper` (e.g. `Setup` fields `restrict_map_add` and
`restrict_bijective`, or a packaged `restrict_isAddIso`); the holes
then become `exact S.restrict_map_add` / `exact S.restrict_bijective`.
The Lake compile is diagnostic-only and the file is preserved despite
the genuine library gap; we do not invent the missing equivalence.
-/

open GrokRxiv.Paper

theorem item_lift (S : Setup) : itemLift S := by
  unfold itemLift
  refine ⟨?_restrict_add, ?_restrict_bijective⟩
