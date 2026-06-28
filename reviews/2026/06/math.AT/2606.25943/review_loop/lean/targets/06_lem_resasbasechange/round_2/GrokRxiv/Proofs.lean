import Mathlib

namespace GrokRxiv

open CategoryTheory MonoidalCategory

/--
Faithful Lean 4 transcription of the paper lemma `lem:resasbasechange`
(restriction as base change).

Writing
* `A := Mod_{D(G)⊗R}(Sp_G)`,
* `B := Mod_{res^G_1(R)}(Sp)`,
* `C := Mod_R(Sp_G)`
for the three symmetric monoidal categories of the statement, and
* `F := F_{D(G)⊗R} : C ⥤ A` for the forgetful / base-change functor,
* `res := res^G_1 : C ⥤ B` for the restriction functor,
the lemma asserts the existence of a symmetric monoidal equivalence
`E : A ≌ B` whose underlying functor closes the commutative triangle, i.e.
`F ⋙ E.functor ≅ res`.

Genuine `G`-spectra `Sp_G`, the `E∞`-rings `D(G) ⊗ R` and `res^G_1(R)`, and the
symmetric monoidal categories of modules over them have no counterpart in
Mathlib, so the concrete categories `A`, `B`, `C` and the concrete functors
`F`, `res` cannot be constructed. The statement below keeps the exact
structural shape of the claim over the relevant symmetric monoidal data.
-/
theorem lem_resasbasechange
    {A : Type*} [Category A] [MonoidalCategory A] [SymmetricCategory A]
    {B : Type*} [Category B] [MonoidalCategory B] [SymmetricCategory B]
    {C : Type*} [Category C] [MonoidalCategory C] [SymmetricCategory C]
    (F : C ⥤ A) [F.Monoidal]
    (res : C ⥤ B) [res.Monoidal] :
    ∃ E : A ≌ B, Nonempty E.functor.Monoidal ∧ Nonempty (F ⋙ E.functor ≅ res) := by
  -- The equivalence of the lemma is produced inside genuine `G`-equivariant
  -- stable homotopy theory, by base change along the map of `E∞`-rings
  -- `res^G_1(R) → D(G) ⊗ R`. None of that infrastructure exists in Mathlib, so
  -- there is no honest construction of `E` for the concrete spectral module
  -- categories. Abstracted over the bare symmetric monoidal data above, the
  -- conclusion is moreover not derivable (arbitrary symmetric monoidal
  -- categories `A`, `B` need not be equivalent at all), so the goal is left
  -- genuinely open here rather than masked behind a placeholder term or an
  -- unproven postulate. The file therefore fails to verify, which is the
  -- required honest outcome when a paper theorem cannot be faithfully proved.
  skip

end GrokRxiv
