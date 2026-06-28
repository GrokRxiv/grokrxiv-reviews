import Mathlib

universe u v

namespace GrokRxiv

open CategoryTheory

/--
`BigDiagram` packages the data asserted to exist by the paper's "big diagram" theorem
(main.tex:25354, thm:bigdiagram): a commutative 3×3 grid of left adjoint functors relating
nine ∞-categories in which all six horizontal functors are equivalences of ∞-categories.

Modelling choices (an honest 1-categorical approximation of the ∞-categorical statement):
* an ∞-category is modelled by a `Category`;
* an equivalence of ∞-categories by `CategoryTheory.Equivalence` (`≌`);
* a left adjoint functor by a functor equipped with a chosen right adjoint and an
  adjunction (`⊣`);
* commutativity of each square by a natural isomorphism (`≅`) between the two composites.

Row-major entries of the grid:
* `C₁₁ = 𝒟Perm(G;R)`            `C₁₂ = Mod_underline(R)(Sp^G)`      `C₁₃ = Sh_Nis(CorrFEt_R;Sp)`
* `C₂₁ = colim_i 𝒟(Mod(G_i;R))`  `C₂₂ = Mod_(R_G)(Sp^G)_lwBorel`    `C₂₃ = Sh_ét(CorrFEt_R;Sp)`
* `C₃₁ = 𝒟(Mod(G;R))`           `C₃₂ = Mod_(R_G)(Sp^G)_Borel`      `C₃₃ = Sh_ét^∧(CorrFEt_R;Sp)`

The vertical left adjoints are étale sheafification (`d₃ = a_ét`) and the hypercompletion /
homotopy-localisation functors (`d₄, d₅ = L^h`, `d₆ = (-)^∧_ét`).
-/
structure BigDiagram
    (C₁₁ C₁₂ C₁₃ C₂₁ C₂₂ C₂₃ C₃₁ C₃₂ C₃₃ : Type u)
    [Category.{v} C₁₁] [Category.{v} C₁₂] [Category.{v} C₁₃]
    [Category.{v} C₂₁] [Category.{v} C₂₂] [Category.{v} C₂₃]
    [Category.{v} C₃₁] [Category.{v} C₃₂] [Category.{v} C₃₃] where
  /-- Horizontal functor `C₁₁ → C₁₂`, an equivalence of ∞-categories. -/
  e₁ : C₁₁ ≌ C₁₂
  /-- Horizontal functor `C₁₂ → C₁₃`, an equivalence of ∞-categories. -/
  e₂ : C₁₂ ≌ C₁₃
  /-- Horizontal functor `C₂₁ → C₂₂`, an equivalence of ∞-categories. -/
  e₃ : C₂₁ ≌ C₂₂
  /-- Horizontal functor `C₂₂ → C₂₃`, an equivalence of ∞-categories. -/
  e₄ : C₂₂ ≌ C₂₃
  /-- Horizontal functor `C₃₁ → C₃₂`, an equivalence of ∞-categories. -/
  e₅ : C₃₁ ≌ C₃₂
  /-- Horizontal functor `C₃₂ → C₃₃`, an equivalence of ∞-categories. -/
  e₆ : C₃₂ ≌ C₃₃
  /-- Vertical left adjoint `C₁₁ → C₂₁` with its right adjoint and adjunction. -/
  d₁ : C₁₁ ⥤ C₂₁
  d₁r : C₂₁ ⥤ C₁₁
  d₁adj : d₁ ⊣ d₁r
  /-- Vertical left adjoint `C₁₂ → C₂₂`. -/
  d₂ : C₁₂ ⥤ C₂₂
  d₂r : C₂₂ ⥤ C₁₂
  d₂adj : d₂ ⊣ d₂r
  /-- Vertical left adjoint `C₁₃ → C₂₃` (étale sheafification `a_ét`). -/
  d₃ : C₁₃ ⥤ C₂₃
  d₃r : C₂₃ ⥤ C₁₃
  d₃adj : d₃ ⊣ d₃r
  /-- Vertical left adjoint `C₂₁ → C₃₁` (`L^h`). -/
  d₄ : C₂₁ ⥤ C₃₁
  d₄r : C₃₁ ⥤ C₂₁
  d₄adj : d₄ ⊣ d₄r
  /-- Vertical left adjoint `C₂₂ → C₃₂` (`L^h`). -/
  d₅ : C₂₂ ⥤ C₃₂
  d₅r : C₃₂ ⥤ C₂₂
  d₅adj : d₅ ⊣ d₅r
  /-- Vertical left adjoint `C₂₃ → C₃₃` (`(-)^∧_ét`). -/
  d₆ : C₂₃ ⥤ C₃₃
  d₆r : C₃₃ ⥤ C₂₃
  d₆adj : d₆ ⊣ d₆r
  /-- Commutativity of the top-left square. -/
  sq₁ : e₁.functor ⋙ d₂ ≅ d₁ ⋙ e₃.functor
  /-- Commutativity of the top-right square. -/
  sq₂ : e₂.functor ⋙ d₃ ≅ d₂ ⋙ e₄.functor
  /-- Commutativity of the bottom-left square. -/
  sq₃ : e₃.functor ⋙ d₅ ≅ d₄ ⋙ e₅.functor
  /-- Commutativity of the bottom-right square. -/
  sq₄ : e₄.functor ⋙ d₆ ≅ d₅ ⋙ e₆.functor

/--
The paper's conclusion: *there is* a commutative diagram of left adjoint functors all of
whose horizontal functors are equivalences. This is exactly inhabitation of `BigDiagram`.
-/
def CommutativeDiagramOfEquivalences
    (C₁₁ C₁₂ C₁₃ C₂₁ C₂₂ C₂₃ C₃₁ C₃₂ C₃₃ : Type u)
    [Category.{v} C₁₁] [Category.{v} C₁₂] [Category.{v} C₁₃]
    [Category.{v} C₂₁] [Category.{v} C₂₂] [Category.{v} C₂₃]
    [Category.{v} C₃₁] [Category.{v} C₃₂] [Category.{v} C₃₃] : Prop :=
  Nonempty (BigDiagram C₁₁ C₁₂ C₁₃ C₂₁ C₂₂ C₂₃ C₃₁ C₃₂ C₃₃)

variable (cDPerm_G_R Mod_underl_R_Sp_G Sh_Nis_CorrFEt_R_Sp
    colim_i_cD_Mod_G_i_R Mod_R_G_Sp_G_lwBorel Sh_et_CorrFEt_R_Sp
    cD_Mod_G_R Mod_R_G_Sp_G_Borel Sh_et_wedge_CorrFEt_R_Sp : Type u)
variable [Category.{v} cDPerm_G_R] [Category.{v} Mod_underl_R_Sp_G]
    [Category.{v} Sh_Nis_CorrFEt_R_Sp] [Category.{v} colim_i_cD_Mod_G_i_R]
    [Category.{v} Mod_R_G_Sp_G_lwBorel] [Category.{v} Sh_et_CorrFEt_R_Sp]
    [Category.{v} cD_Mod_G_R] [Category.{v} Mod_R_G_Sp_G_Borel]
    [Category.{v} Sh_et_wedge_CorrFEt_R_Sp]

/--
Faithful Lean transcription of `main.tex:thm*:25354` (the "big diagram" theorem).

The nine specific ∞-categories of the paper are not definable in Mathlib, so they are taken
as arbitrary ∞-categories; the statement then asserts the existence of the full commutative
3×3 grid of left adjoints whose six horizontal functors are equivalences. Building this grid
requires the paper's comparison theorems (derived permutation modules ≃ Borel /
locally-weakly-Borel `R_G`-module spectra ≃ Nisnevich/étale sheaves on finite étale
correspondences, related by étale sheafification and hypercompletion); none of these are
available here, so the statement cannot be proved honestly. Per the role contract the proof
is left to fail rather than closed with `sorry`, `admit`, or an `axiom`.
-/
theorem main_tex_thm_25354 :
    CommutativeDiagramOfEquivalences cDPerm_G_R Mod_underl_R_Sp_G Sh_Nis_CorrFEt_R_Sp
      colim_i_cD_Mod_G_i_R Mod_R_G_Sp_G_lwBorel Sh_et_CorrFEt_R_Sp
      cD_Mod_G_R Mod_R_G_Sp_G_Borel Sh_et_wedge_CorrFEt_R_Sp := by
  -- An honest proof must exhibit a `BigDiagram` for these nine arbitrary ∞-categories,
  -- i.e. produce six equivalences, six left adjoints, and four commuting squares.
  -- No such construction exists in self-contained Lean/Mathlib, so the goal is left open
  -- (genuine `unsolved goals` failure; no `sorry`/`admit`/`axiom`).
  skip

end GrokRxiv
