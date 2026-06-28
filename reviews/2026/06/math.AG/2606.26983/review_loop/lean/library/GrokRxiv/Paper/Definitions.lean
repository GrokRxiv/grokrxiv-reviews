import GrokRxiv.Paper.Notation

/-!
# Bundled paper objects

Mathlib does not contain the scheme-theoretic machinery used by the paper
(cubist `\mathbb{G}_m`-torsors, the Theorem of the Cube, the M85 equivalence of
categories, Lang–Néron / Néron–Tate heights, generic numerical equivalence on
1-cycles).  We therefore model the paper objects abstractly as bundled data:
`PaperData` packages the groups and the source-grounded maps of
`prop_main`/`main_thm`, and `KSData` packages the data of `thm_KS`.

The actual paper instance of this data is supplied opaquely in
`GrokRxiv/Paper/Interfaces.lean`.  Both structures carry concrete `Nonempty`
witnesses here, so no `axiom`/`sorry` is needed to introduce the opaque terms.
-/

namespace GrokRxiv.Paper

/-- Abstract bundle of the paper's objects over a smooth commutative group
scheme `A/C` with abelian-variety generic fibre.

* `MW`     : the Mordell–Weil group `MW(A/C)`;
* `N1`     : complete 1-cycles modulo numerical equivalence `N_1(A)`;
* `N1gen`  : complete 1-cycles modulo generic numerical equivalence `N_{1,gen}(A)`;
* `PicRig` : rigidified invertible sheaves `Pic(A)_{rig}`;
* `PicEta` : `Pic(A_η)`;
* `cl`/`clGen` : the cycle-class assignments `Z ↦ [Z]` into `N1` resp. `N1gen`;
* `restrict`   : the restriction `Pic(A)_{rig} → Pic(A_η)` of `item_lift`;
* `torsion`    : the torsion subgroup `MW(A/C)_{tors}`. -/
structure PaperData where
  MW : Type
  N1 : Type
  N1gen : Type
  PicRig : Type
  PicEta : Type
  [addCommGroupMW : AddCommGroup MW]
  [addCommGroupN1 : AddCommGroup N1]
  [addCommGroupN1gen : AddCommGroup N1gen]
  [addCommGroupPicRig : AddCommGroup PicRig]
  [addCommGroupPicEta : AddCommGroup PicEta]
  cl : MW → N1
  clGen : MW → N1gen
  restrict : PicRig → PicEta
  torsion : AddSubgroup MW

instance : Nonempty PaperData :=
  ⟨{ MW := ℤ, N1 := ℤ, N1gen := ℤ, PicRig := ℤ, PicEta := ℤ,
     cl := id, clGen := id, restrict := id, torsion := ⊥ }⟩

/-- Abstract bundle of the data of `thm_KS` (Kollár–Saccà, Proposition 1):
a section `Z` of `J_L` together with the predicate that its class lies in the
image of the cohomology restriction map `H^{2g}(J(S,H)) → H^{2g}(J_L)`, and the
zero section. -/
structure KSData where
  Sec : Type
  zeroSection : Sec
  Z : Sec
  inRestrictionImage : Sec → Prop

instance : Nonempty KSData :=
  ⟨{ Sec := PUnit, zeroSection := PUnit.unit, Z := PUnit.unit,
     inRestrictionImage := fun _ => True }⟩

end GrokRxiv.Paper
