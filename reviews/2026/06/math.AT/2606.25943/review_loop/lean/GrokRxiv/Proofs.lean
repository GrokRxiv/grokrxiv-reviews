/- GrokRxiv combined per-theorem Lean proofs. Each section is authored and kernel-checked INDEPENDENTLY in its own harness under review_loop/lean/targets/. -/

-- ===== main_tex_thm_15574 (FAIL) =====
/- main_tex_thm_15574: status=fail (not kernel-proved) -/
import Mathlib

/-!
# Faithful Lean 4 transcription of paper theorem `main_tex:thm*:15574`
  (`DAM_Nis_symmonoidal_equiv_DPerm`)

Paper statement:
  Let `S` be a connected, noetherian scheme of finite Krull dimension. Then there is a
  symmetric monoidal equivalence `DAM_Nis(S; R) ≃ DPerm(π₁ᵉᵗ(S, s); R)`, where
  `s : Spec(k) → S` is a geometric point of `S`.

Mathlib does not contain the objects this theorem is about — the derived category of
Nisnevich (Artin) motives `DAM_Nis(S; R)`, the derived category of permutation modules
`DPerm(π₁ᵉᵗ(S, s); R)`, or the profinite étale fundamental group `π₁ᵉᵗ(S, s)`. They are
therefore taken as abstract data, but with their genuine dependencies preserved:
`DAM_Nis` is a function of the scheme `S` and the coefficient ring `R`; the fundamental
group is a function of `S` and the chosen geometric point `s`; and `DPerm` is a function
of that group and `R`. Every hypothesis of the paper is kept (`S` connected, noetherian,
of finite Krull dimension; `R` a coefficient ring; `s` a geometric point), and the
conclusion is a genuine symmetric monoidal equivalence — an equivalence of categories
together with unit- and tensor-comparison isomorphisms compatible with the braidings —
not a weaker relation and not a vacuous placeholder.

Because the symbols range over arbitrary interpretations, the statement is `false` for
generic interpretations and is provable only when the specific equivalence of the cited
paper is supplied; that construction is the entire content of the paper and is unavailable
in Mathlib. The proof is therefore left genuinely unfinished: the file uses no forbidden
proof terms and is expected to fail to compile rather than disguise the gap with a
fabricated or strawman proof.
-/

namespace GrokRxiv

universe u v w

open CategoryTheory MonoidalCategory

/-- Paper theorem `main_tex:thm*:15574`. A symmetric monoidal equivalence between the
derived category of Nisnevich motives `DAM_Nis(S; R)` and the derived category of
permutation modules over the profinite étale fundamental group `DPerm(π₁ᵉᵗ(S, s); R)`,
phrased as an equivalence `e` together with a unit-comparison isomorphism, a
tensor-comparison family `μ`, and braiding (symmetry) compatibility for `μ`. -/
theorem main_tex_thm_15574
    (R : Type u) [CommRing R]
    {Sch : Type u}
    (IsConnected IsNoetherian HasFiniteKrullDim : Sch → Prop)
    (S : Sch)
    (hConn : IsConnected S) (hNoeth : IsNoetherian S)
    (hFin : HasFiniteKrullDim S)
    (GeometricPoint : Sch → Type u)
    (s : GeometricPoint S)
    (EtFundGroup : (X : Sch) → GeometricPoint X → Type u)
    [Group (EtFundGroup S s)]
    (DAMNis : Sch → Type u → Type v)
    [Category.{w} (DAMNis S R)] [MonoidalCategory (DAMNis S R)]
      [SymmetricCategory (DAMNis S R)]
    (DPerm : Type u → Type u → Type v)
    [Category.{w} (DPerm (EtFundGroup S s) R)]
      [MonoidalCategory (DPerm (EtFundGroup S s) R)]
      [SymmetricCategory (DPerm (EtFundGroup S s) R)] :
    ∃ e : DAMNis S R ≌ DPerm (EtFundGroup S s) R,
      ∃ _unitIso :
          (𝟙_ (DPerm (EtFundGroup S s) R)) ≅ e.functor.obj (𝟙_ (DAMNis S R)),
        ∃ μ : ∀ X Y : DAMNis S R,
            (e.functor.obj X ⊗ e.functor.obj Y) ≅ e.functor.obj (X ⊗ Y),
          ∀ X Y : DAMNis S R,
            (BraidedCategory.braiding (e.functor.obj X) (e.functor.obj Y)).hom
                ≫ (μ Y X).hom
              = (μ X Y).hom ≫ e.functor.map (BraidedCategory.braiding X Y).hom := by
  fail "main_tex_thm_15574: the symmetric monoidal equivalence DAM_Nis(S;R) ≃ DPerm(pi_1^et(S,s);R) is a deep theorem of the cited paper; its objects (Nisnevich Artin motives, the permutation-module derived category, and the profinite etale fundamental group) are absent from Mathlib, so no honest closed kernel proof can be produced. Left deliberately unfinished rather than fabricated or replaced by a strawman."

end GrokRxiv

-- ===== main_tex_thm_21529 (FAIL) =====
/- main_tex_thm_21529: status=fail (not kernel-proved) -/
import Mathlib

namespace GrokRxiv

open CategoryTheory
open scoped MonoidalCategory

/-- A symmetric monoidal ∞-category, modeled at the 1-categorical level as a
bundled category carrying a symmetric monoidal structure.  Mathlib has no
genuine theory of ∞-categories, so this 1-truncation is the most faithful
carrier available for the objects of this theorem. -/
structure SymMonInftyCat where
  C : Type 1
  [cat : Category.{0} C]
  [mon : MonoidalCategory C]
  [sym : SymmetricCategory C]

attribute [instance] SymMonInftyCat.cat SymMonInftyCat.mon SymMonInftyCat.sym

noncomputable instance : Inhabited SymMonInftyCat := ⟨{ C := Type }⟩

/-- A symmetric monoidal equivalence between symmetric monoidal ∞-categories
`X` and `Y`: an equivalence of the underlying categories together with the
tensor- and unit-comparison isomorphisms of a strong monoidal functor, required
to be compatible with the symmetric braiding.  (The associativity/unit coherence
conditions of the comparison data, and the genuine ∞-categorical content, are not
expressible at this 1-categorical truncation; see the accompanying notes.  This
predicate is deliberately NOT `True`/vacuous: discharging it requires constructing
a genuine braided equivalence.) -/
def symmetric_monoidal_equivalence (X Y : SymMonInftyCat) : Prop :=
  ∃ (e : X.C ≌ Y.C)
    (μ : ∀ a b : X.C, e.functor.obj (a ⊗ b) ≅ e.functor.obj a ⊗ e.functor.obj b)
    (_ε : e.functor.obj (𝟙_ X.C) ≅ 𝟙_ Y.C),
    ∀ a b : X.C,
      (μ a b).hom ≫ (BraidedCategory.braiding (e.functor.obj a) (e.functor.obj b)).hom
        = e.functor.map (BraidedCategory.braiding a b).hom ≫ (μ b a).hom

/-- The ∞-category of Borel `G`-spectra `Spec_G^Borel`, as a symmetric monoidal
∞-category.  Its genuine construction belongs to equivariant stable homotopy
theory and is not available in Mathlib, so it is introduced abstractly. -/
opaque specg_Borel : SymMonInftyCat

/-- The homotopy fixed points `(Spec_G^lwBorel)^h` of the lw-Borel `G`-spectra,
as a symmetric monoidal ∞-category.  Introduced abstractly for the same reason. -/
opaque specg_lwBorel_homotopy_fixed_points : SymMonInftyCat

/-- main.tex `thm*:21529` (depends on `thm:borelandhyperlewelwise`):

There is a symmetric monoidal equivalence
`Spec_G^Borel ≃ (Spec_G^lwBorel)^h`.

This is a deep theorem of equivariant stable homotopy theory.  Neither the two
∞-categories nor the comparison equivalence can be constructed in Mathlib, so for
the abstract `opaque` objects above the goal is genuinely not derivable.  As
required by the task, the proof is left honestly open: it uses no placeholder
tactics and no unproven postulates, and it is NOT replaced by a trivially-true
strawman.  `lake env lean` therefore reports an `unsolved goals` failure, which is
the correct outcome for a theorem that cannot currently be faithfully proved. -/
theorem main_tex_thm_21529 :
    symmetric_monoidal_equivalence specg_Borel specg_lwBorel_homotopy_fixed_points := by
  skip

end GrokRxiv

-- ===== main_tex_prop_22191 (FAIL) =====
/- main_tex_prop_22191: status=fail (not kernel-proved) -/
import Mathlib

open CategoryTheory

namespace GrokRxiv

/-
main.tex prop* 22191  (depends on prop:sheavesborelcomplete and prop:sheavesgrmodules)

Paper claim: there is a commutative diagram with horizontal equivalences and
fully faithful vertical functors

  Mod_{R_G}(Spec G)_Borel    --≃-->  sheaves^∧(G-Set; R)   --≃-->  D(mod_gr)
        |  (hook, full+faithful)        |  (hook, full+faithful)     |  (hook, full+faithful)
        v                               v                            v
  Mod_{R_G}(Spec G)_lwBorel  --≃-->  sheaves(G-Set; R)     --≃-->  colim_i D(Mod(G_i; R))

The four horizontal arrows are equivalences, the three vertical arrows are fully
faithful inclusions, and the two squares commute (up to natural isomorphism).

The six categories above are the paper's own constructions (established in the two
cited results) and are NOT present in Mathlib; no dependency definitions were
supplied with this obligation.  The statement below is the best faithful
structural rendering available from the supplied material: the six categories are
taken as given abstract categories and the diagram is asserted in its natural
existence form, with the diagram structure (horizontal equivalences, fully
faithful verticals, commuting squares) kept explicit rather than collapsed to an
opaque predicate or a placeholder.

Honesty: a faithful kernel-checked closed proof would require formalizing those
six categories together with the seven functors and the proofs that the
horizontal functors are equivalences -- none of which is reconstructible from the
supplied inputs.  Per the integrity policy this goal is therefore left genuinely
open: the Lean kernel reports unsolved goals and rejects the file, which is the
intended faithful signal of the formalization gap.  No fabricated proof and no
trivially-true witness (e.g. collapsing every category to a single point) is
substituted in place of the paper's theorem.
-/
theorem main_tex_prop_22191
    {ModBorel : Type*} [Category ModBorel]      -- Mod_{R_G}(Spec G)_Borel
    {ShWedge : Type*} [Category ShWedge]        -- sheaves^∧(G-Set; R)
    {DModGr : Type*} [Category DModGr]          -- D(mod_gr)
    {ModLwBorel : Type*} [Category ModLwBorel]  -- Mod_{R_G}(Spec G)_lwBorel
    {Sh : Type*} [Category Sh]                  -- sheaves(G-Set; R)
    {ColimD : Type*} [Category ColimD] :        -- colim_i D(Mod(G_i; R))
    ∃ (top₁ : ModBorel ⥤ ShWedge) (top₂ : ShWedge ⥤ DModGr)
      (bot₁ : ModLwBorel ⥤ Sh) (bot₂ : Sh ⥤ ColimD)
      (vleft : ModBorel ⥤ ModLwBorel) (vmid : ShWedge ⥤ Sh)
      (vright : DModGr ⥤ ColimD),
        -- horizontal (top and bottom) functors are equivalences
        top₁.IsEquivalence ∧ top₂.IsEquivalence ∧
        bot₁.IsEquivalence ∧ bot₂.IsEquivalence ∧
        -- vertical functors are fully faithful inclusions
        (vleft.Full ∧ vleft.Faithful) ∧
        (vmid.Full ∧ vmid.Faithful) ∧
        (vright.Full ∧ vright.Faithful) ∧
        -- the two squares commute up to natural isomorphism
        Nonempty (top₁ ⋙ vmid ≅ vleft ⋙ bot₁) ∧
        Nonempty (top₂ ⋙ vright ≅ vmid ⋙ bot₂) := by
  -- The paper's six categories and the seven functors realizing this diagram are
  -- not reconstructible from the supplied material, so the existence claim is
  -- left unproved rather than discharged dishonestly.  The kernel rejects this
  -- open goal, faithfully signalling the formalization gap.
  skip

end GrokRxiv

-- ===== main_tex_thm_25354 (FAIL) =====
/- main_tex_thm_25354: status=fail (not kernel-proved) -/
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
3×3 grid of left adjoints whose six horizontal functors are equivalences of ∞-categories.
Building this grid requires the paper's comparison results (derived permutation modules ≃
Borel / locally-weakly-Borel `R_G`-module spectra ≃ Nisnevich/étale sheaves on finite étale
correspondences, related by étale sheafification and hypercompletion); none of these are
available in self-contained Lean/Mathlib, so the statement cannot be established honestly.
Per the role contract the proof is therefore left to genuinely fail rather than being closed
with a placeholder tactic or an unproved escape hatch.
-/
theorem main_tex_thm_25354 :
    CommutativeDiagramOfEquivalences cDPerm_G_R Mod_underl_R_Sp_G Sh_Nis_CorrFEt_R_Sp
      colim_i_cD_Mod_G_i_R Mod_R_G_Sp_G_lwBorel Sh_et_CorrFEt_R_Sp
      cD_Mod_G_R Mod_R_G_Sp_G_Borel Sh_et_wedge_CorrFEt_R_Sp := by
  -- An honest proof must exhibit a `BigDiagram` for these nine arbitrary ∞-categories,
  -- i.e. produce six equivalences, six left adjoints, and four commuting squares.
  -- No such construction exists in self-contained Lean/Mathlib, so the goal is left open
  -- (a genuine `unsolved goals` failure, with no forbidden proof terms used).
  skip

end GrokRxiv

-- ===== lem_completionexplicit (FAIL) =====
/- lem_completionexplicit: status=fail (not kernel-proved) -/
import Mathlib

/-
  GrokRxiv review-loop formalization of `lem:completionexplicit`
  (paper lemma, main.tex:43379).

  Paper statement:
    "Let X ∈ Mod_R(BG). The natural map
       X → imap_{Mod_R(BG)}(Σ^∞_+ EG ⊗ R, X)
     exhibits the target as the Borel completion of X."

  Mathematical setting (equivariant stable homotopy theory):
    • Mod_R(BG) is the ∞-category of R-modules in Borel G-spectra;
    • imap(-, -) is its internal mapping object;
    • Σ^∞_+ EG ⊗ R is the suspension R-spectrum of EG_+;
    • the "Borel completion" is the F-completion at the family of free
      subgroups, characterised by a universal property.
  Neither these objects nor the universal property naming the Borel
  completion are available in Mathlib.

  Faithful formalization: the paper states no hypotheses, so the ambient data
  is modelled abstractly (section variables) and the lemma is stated exactly --
  for every object X the natural map exhibits the target as the Borel
  completion of X. The relation `exhibits_Borel_completion` is the paper's
  *defined* universal property; encoding it faithfully would require the
  underlying homotopy theory. Kept as an opaque binary relation it carries no
  content, so the conclusion does NOT follow and the statement is genuinely
  unprovable in this setting.

  Per the role contract the gap is surfaced honestly: no unproven proof-term
  placeholder, no unapproved postulate, and no trivially-true strawman is
  substituted for the relation (it is NOT collapsed to `True`). The proof goal
  is left open, so `lake env lean GrokRxiv/Proofs.lean` reports `unsolved
  goals`, exposing the real formalization gap instead of masking it.
-/

namespace GrokRxiv

variable {Mod_R_BG : Type*}
-- internal mapping object  imap_{Mod_R(BG)}(-, -)
variable (imap_Mod_R_BG : Mod_R_BG → Mod_R_BG → Mod_R_BG)
-- the object  Σ^∞_+ EG ⊗ R  of Mod_R(BG)
variable (EG_plus_R : Mod_R_BG)
-- "the natural map X → Y exhibits Y as the Borel completion of X"
variable (exhibits_Borel_completion : Mod_R_BG → Mod_R_BG → Prop)

theorem lem_completionexplicit (X : Mod_R_BG) :
    exhibits_Borel_completion X (imap_Mod_R_BG EG_plus_R X) := by
  -- Paper proof: the natural map is the unit of the Borel-completion
  -- (F-completion / homotopy-fixed-point) adjunction at the family of free
  -- subgroups; it is an underlying equivalence into an F-complete object and
  -- hence satisfies the universal property defining the Borel completion.
  -- That argument needs ∞-categorical machinery absent from Mathlib, and the
  -- relation is opaque here, so the goal cannot be discharged honestly.
  skip

end GrokRxiv

-- ===== cor_completionunderlying (FAIL) =====
/- cor_completionunderlying: status=fail (not kernel-proved) -/
import Mathlib

namespace GrokRxiv

/-- Borel completeness is an (uninterpreted) predicate attached to each ambient
category of equivariant objects.  The paper works inside `Mod_R(Sp_G)` and the
category of `G`-spectra; Mathlib provides neither, so we model only the bare
predicate carried by an arbitrary carrier type.  Using a single type parameter
(rather than the previous two-parameter `BorelObstruction α τ`) keeps instance
resolution determined by the carrier alone, fixing the earlier stuck-typeclass
error reported on the prior attempt. -/
class HasBorel (α : Type*) where
  /-- `BorelComplete x` asserts that `x` is Borel complete. -/
  BorelComplete : α → Prop

export HasBorel (BorelComplete)

/-- `cor:completionunderlying`.  Paper statement: a module `X ∈ Mod_R(Sp_G)` is
Borel complete if and only if the underlying `G`-spectrum `U_R(X)` is Borel
complete.

`M` models the objects of `Mod_R(Sp_G)`, `S` the `G`-spectra, and `U` the
underlying `G`-spectrum functor `U_R`; each carrier has its own
Borel-completeness predicate.  This is the faithful statement of the corollary:
the only binder is the module `X`, with no structural hypotheses on `X`, on `U`,
or on the predicates (the deterministic skeleton's `BorelComplete 0` placeholder
is here corrected to `BorelComplete (U X)`).

The corollary's content is that `U_R` both preserves and reflects Borel
completeness — conservativity of `U_R` together with its commutation with the
Borel completion.  Those are structural facts about `Mod_R(Sp_G)` and `U_R`
established elsewhere in the paper.  With `M`, `S`, `U` and the predicates left
abstract — Mathlib has no `G`-spectra and this obligation resolves no
dependencies — neither implication is derivable, so the proof below is left
genuinely incomplete (no `sorry`, `admit`, `axiom`, or vacuous strawman) and the
file does not compile.  This honestly reports the theorem as not formally
verified rather than masking the gap with a conditional model or a
trivially-true restatement. -/
theorem cor_completionunderlying
    {M S : Type*} [HasBorel M] [HasBorel S] (U : M → S) (X : M) :
    (BorelComplete X → BorelComplete (U X)) ∧
      (BorelComplete (U X) → BorelComplete X) := by
  refine ⟨fun _ => ?_, fun _ => ?_⟩
  -- Goal 1 : `BorelComplete (U X)` — needs preservation of completeness by `U_R`.
  -- Goal 2 : `BorelComplete X`     — needs conservativity of `U_R` (reflection).
  -- Neither follows from the abstract data, so both goals remain unsolved.

end GrokRxiv

-- ===== lem_resasbasechange (FAIL) =====
/- lem_resasbasechange: status=fail (not kernel-proved) -/
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
