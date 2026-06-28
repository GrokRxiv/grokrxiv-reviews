import Mathlib

namespace GrokRxiv

open CategoryTheory MonoidalCategory

/--
Faithful Lean 4 transcription of the paper lemma `lem:resasbasechange`
("restriction as base change").

The paper claims a symmetric monoidal equivalence
`Mod_{D(G)⊗R}(Sp_G) ⥲ Mod_{res^G_1(R)}(Sp)` whose underlying functor fits into a
commutative triangle together with the restriction functor
`res^G_1 : Mod_R(Sp_G) → Mod_{res^G_1(R)}(Sp)` and the forgetful / base-change
functor `F_{D(G)⊗R} : Mod_R(Sp_G) → Mod_{D(G)⊗R}(Sp_G)`.

Genuine `G`-spectra `Sp_G`, the `E∞`-rings `D(G)⊗R` and `res^G_1(R)`, and their
symmetric monoidal module categories are not available in Mathlib, so we
transcribe the structural content of the claim. Writing `A := Mod_{D(G)⊗R}(Sp_G)`,
`B := Mod_{res^G_1(R)}(Sp)` and `C := Mod_R(Sp_G)` for the three symmetric
monoidal categories, and `F := F_{D(G)⊗R} : C ⥤ A`, `res := res^G_1 : C ⥤ B` for
the two symmetric monoidal functors, the lemma asserts a symmetric monoidal
equivalence `E : A ≌ B` whose functor makes the triangle commute,
`F ⋙ E.functor ≅ res`.
-/
theorem lem_resasbasechange
    {A : Type*} [Category A] [MonoidalCategory A] [SymmetricCategory A]
    {B : Type*} [Category B] [MonoidalCategory B] [SymmetricCategory B]
    {C : Type*} [Category C] [MonoidalCategory C] [SymmetricCategory C]
    (F : C ⥤ A) [F.Monoidal]
    (res : C ⥤ B) [res.Monoidal] :
    ∃ E : A ≌ B, Nonempty E.functor.Monoidal ∧ Nonempty (F ⋙ E.functor ≅ res) := by
  -- The equivalence exists for the *specific* spectral module categories of the
  -- paper, where it is constructed via base change along `res^G_1(R) → D(G)⊗R`.
  -- The statement abstracted above instead quantifies over *arbitrary* symmetric
  -- monoidal categories `A`, `B`, `C` and monoidal functors `F`, `res`, where it
  -- is simply false (e.g. `A` and `B` need not be equivalent at all). Mathlib has
  -- no construction of genuine `G`-spectra or their module categories with which
  -- to instantiate the concrete categories that make the lemma true, so the goal
  -- cannot be closed honestly. It is left open here, discharged by neither
  -- `sorry`/`admit`/`axiom` nor a vacuous restatement, so the attempt fails to
  -- verify, as required by the honest-failure policy.
  skip

end GrokRxiv
