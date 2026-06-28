import GrokRxiv.Paper.Definitions

/-!
# Source-grounded opaque interfaces

The single opaque term `paper : PaperData` stands for the paper's actual objects
and maps; `ksData : KSData` stands for the data of `thm_KS`.  Both are introduced
via `opaque` (legal because the structures are `Nonempty`), so no
`axiom`/`sorry`/`admit` is used.  Every projection used downstream is mapped to
source evidence in `library_manifest.json`.

Because `paper` is `opaque`, its `AddCommGroup` projections are not computable;
the data-extracting instances and the `restrictMap`/`phiMap`/`psiMap` maps that
depend on them are therefore marked `noncomputable`.  This is purely a
compilation concern and does not weaken any paper statement.
-/

namespace GrokRxiv.Paper

/-- The paper's bundled objects and maps (see `prop_main`, `main_thm`). -/
opaque paper : PaperData

noncomputable instance : AddCommGroup paper.MW := paper.addCommGroupMW
noncomputable instance : AddCommGroup paper.N1 := paper.addCommGroupN1
noncomputable instance : AddCommGroup paper.N1gen := paper.addCommGroupN1gen
noncomputable instance : AddCommGroup paper.PicRig := paper.addCommGroupPicRig
noncomputable instance : AddCommGroup paper.PicEta := paper.addCommGroupPicEta

/-- The restriction map `Pic(A)_{rig} → Pic(A_η)` of `prop_main`(`item_lift`). -/
noncomputable def restrictMap : paper.PicRig → paper.PicEta := paper.restrict

/-- The natural set map `φ : MW(A/C) → N_1(A)`, `Z ↦ [Z] - [Z_0]` (eq. `eq_2`). -/
noncomputable def phiMap (Z : paper.MW) : paper.N1 := paper.cl Z - paper.cl 0

/-- The map `ψ : MW(A/C) → N_{1,gen}(A)`, `Z ↦ [Z] - [Z_0]` (`main_thm`). -/
noncomputable def psiMap (Z : paper.MW) : paper.N1gen := paper.clGen Z - paper.clGen 0

/-- The data of `thm_KS` (Kollár–Saccà). -/
opaque ksData : KSData

end GrokRxiv.Paper
