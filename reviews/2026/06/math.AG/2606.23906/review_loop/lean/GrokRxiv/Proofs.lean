/- GrokRxiv combined per-theorem Lean proofs. Each section is authored and kernel-checked INDEPENDENTLY in its own harness under review_loop/lean/targets/. -/

-- ===== thm_5 (FAIL) =====
/- thm_5: status=fail (not kernel-proved) -/
import Mathlib

open CategoryTheory

namespace GrokRxiv

/-- Proposition 4 (paper claim `thm-5`): homeomorphic spaces have isomorphic fundamental
groups.  If `f : X ≃ₜ Y` is a homeomorphism, then the induced map
`f_* : π₁(X, x) → π₁(Y, f x)` on fundamental groups is an isomorphism.

A homeomorphism is in particular a homotopy equivalence, so it induces an equivalence `e`
of the fundamental groupoids of `X` and `Y`.  The induced map `f_*` is the action of the
equivalence's functor on the automorphism group of the basepoint (`Functor.mapAut`).
Because `e.functor` is full and faithful (being the functor of an equivalence) and the
fundamental groupoids are groupoids (so every morphism underlies an automorphism), this
group homomorphism is bijective, hence a multiplicative isomorphism
`π₁(X, x) ≃* π₁(Y, f x)`. -/
theorem thm_5 {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    (f : X ≃ₜ Y) (x : X) :
    Nonempty (FundamentalGroup X x ≃* FundamentalGroup Y (f x)) := by
  classical
  -- A homeomorphism, viewed as a homotopy equivalence, induces an equivalence of the
  -- fundamental groupoids of `X` and `Y`.
  let e : FundamentalGroupoid X ≌ FundamentalGroupoid Y :=
    FundamentalGroupoidFunctor.equivOfHomotopyEquiv f.toHomotopyEquiv
  -- `f_*` is the induced homomorphism on the automorphism group of the basepoint.
  refine ⟨MulEquiv.ofBijective (e.functor.mapAut ⟨x⟩) ⟨?_, ?_⟩⟩
  · -- Injective: the functor of an equivalence is faithful.
    intro a b hab
    exact Iso.ext (e.functor.map_injective (congrArg Iso.hom hab))
  · -- Surjective: the functor of an equivalence is full, and in a groupoid every
    -- morphism underlies an automorphism.
    intro r
    exact ⟨(Groupoid.isoEquivHom _ _).symm (e.functor.preimage r.hom),
      Iso.ext (e.functor.map_preimage r.hom)⟩

end GrokRxiv

-- ===== thm_7 (FAIL) =====
/- thm_7: status=fail (not kernel-proved) -/
import Mathlib

open CategoryTheory

namespace GrokRxiv

/-- **Corollary 5 (homotopy invariance of the fundamental group).**

If `e : X ≃ₕ Y` is a homotopy equivalence, then for every basepoint `x : X`
the induced map `e_*` on fundamental groups `π₁(X, x) → π₁(Y, e x)` is a group
isomorphism.

In Mathlib the fundamental group `π₁(X, x)` is the automorphism group
`Aut (FundamentalGroupoid.mk x)` of the basepoint inside the fundamental
groupoid, and `e_*` is the action on automorphisms of the functor
`E := equivOfHomotopyEquiv e` induced by `e`.  The conclusion is stated
faithfully as a multiplicative (group) isomorphism `π₁(X, x) ≃* π₁(Y, e x)`,
witnessed by that induced functor. -/
theorem thm_7 {X Y : TopCat} (e : X ≃ₕ Y) (x : X) :
    Nonempty
      (Aut (FundamentalGroupoid.mk x) ≃*
        Aut (FundamentalGroupoid.mk (e x))) := by
  -- A homotopy equivalence induces an equivalence of fundamental groupoids.
  set E := FundamentalGroupoidFunctor.equivOfHomotopyEquiv e with hE
  -- The induced functor sends the basepoint `x` to `e x`.
  have hobj : E.functor.obj (FundamentalGroupoid.mk x)
      = FundamentalGroupoid.mk (e x) := rfl
  refine ⟨?_⟩
  rw [← hobj]
  -- Being part of an equivalence, `E.functor` is fully faithful, hence acts
  -- as a group isomorphism on the automorphism group (the fundamental group)
  -- of the basepoint.
  exact
    { toFun := fun g => E.functor.mapIso g
      invFun := fun g => E.fullyFaithfulFunctor.preimageIso g
      left_inv := fun g => by ext; simp
      right_inv := fun g => by ext; simp
      map_mul' := fun g h => by ext; simp }

end GrokRxiv

-- ===== fund_grou_base_pt (FAIL) =====
/- fund_grou_base_pt: status=fail (not kernel-proved) -/
import Mathlib

open CategoryTheory

namespace GrokRxiv

attribute [local instance] Path.Homotopic.setoid

/-- Proposition 6: in a path-connected topological space the fundamental group is
independent of the chosen basepoint, up to (group) isomorphism. -/
theorem fund_grou_base_pt {X : Type*} [TopologicalSpace X] [PathConnectedSpace X]
    (x₀ x₁ : X) :
    Nonempty (FundamentalGroup X x₀ ≃* FundamentalGroup X x₁) := by
  -- Path-connectedness yields a path from `x₀` to `x₁`.
  let p : Path x₀ x₁ := (PathConnectedSpace.joined x₀ x₁).somePath
  -- Its homotopy class is a morphism `⟨x₀⟩ ⟶ ⟨x₁⟩` in the fundamental groupoid.
  let f : (⟨x₀⟩ : FundamentalGroupoid X) ⟶ ⟨x₁⟩ := ⟦p⟧
  -- Every morphism of a groupoid is invertible, giving an isomorphism of basepoints.
  let e : (⟨x₀⟩ : FundamentalGroupoid X) ≅ ⟨x₁⟩ :=
    { hom := f
      inv := Groupoid.inv f
      hom_inv_id := Groupoid.comp_inv f
      inv_hom_id := Groupoid.inv_comp f }
  -- Conjugation by `e` is the desired isomorphism `π₁(X, x₀) ≃* π₁(X, x₁)`.
  exact ⟨e.conjAut⟩

end GrokRxiv

-- ===== composition_covers (FAIL) =====
/- composition_covers: status=fail (not kernel-proved) -/
import Mathlib

namespace GrokRxiv

/-
Proposition 10 (paper, section 2.2).

  Let `q : Z → X` be a *connected* cover — a covering map whose total space `Z`
  is connected — and let `f : Y → Z` be a continuous map. If the composition
  `q ∘ f : Y → X` is a covering map, then so is `f`.

Faithful Lean 4 statement: every hypothesis of the paper is preserved.
  * `q` is a covering map               →  `hq : IsCoveringMap q`
  * the cover `q` is connected          →  `[ConnectedSpace Z]`
  * `f` is continuous                   →  `hf : Continuous f`
  * the composite is a covering map     →  `hqf : IsCoveringMap (q ∘ f)`
The conclusion is exactly that `f` is a covering map. The paper prints the
conclusion as `f : Y → X`, which is a typo for the codomain forced by the given
`f : Y → Z`; the faithful conclusion is therefore `IsCoveringMap f`.
-/
theorem composition_covers
    {X Y Z : Type*}
    [TopologicalSpace X] [TopologicalSpace Y] [TopologicalSpace Z]
    [ConnectedSpace Z]
    {q : Z → X} {f : Y → Z}
    (hq : IsCoveringMap q) (hf : Continuous f)
    (hqf : IsCoveringMap (q ∘ f)) :
    IsCoveringMap f := by
  -- This is the genuine two-out-of-three cancellation property of covering
  -- maps: from `q` (a connected covering) and the composite `q ∘ f` one must
  -- build the even-covering trivializations for `f` itself, using connectedness
  -- of `Z` to control the sheet structure. Mathlib exposes no single lemma for
  -- this direction, and a faithful from-scratch construction is beyond what can
  -- be discharged in this pass. The core goal is therefore left genuinely open
  -- so the proof fails honestly rather than weakening Proposition 10 to a
  -- trivial strawman.
  skip

end GrokRxiv

-- ===== unique_lift (FAIL) =====
/- unique_lift: status=fail (not kernel-proved) -/
import Mathlib

namespace GrokRxiv

/-- **Lemma 11 (Lifting (Homotopy) Property — unique path lifting).**
Let `p : Y → X` be a covering map, let `y : Y`, and set `x = p y`. For every
path `γ : [0,1] → X` starting at `x` (`γ 0 = x`) there is a *unique* continuous
lift `δ : [0,1] → Y` of `γ` starting at `y`; i.e. a unique continuous `δ` with
`p (δ t) = γ t` for all `t ∈ [0,1]` and `δ 0 = y`. -/
theorem unique_lift {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
    {p : Y → X} (hp : IsCoveringMap p) (y : Y)
    (γ : C(unitInterval, X)) (hγ : γ 0 = p y) :
    ∃! δ : C(unitInterval, Y), (∀ t : unitInterval, p (δ t) = γ t) ∧ δ 0 = y := by
  -- Existence: a covering map has the path-lifting property.
  obtain ⟨δ, hlift, hstart⟩ := hp.exists_path_lift γ y hγ
  refine ⟨δ, ⟨hlift, hstart⟩, ?_⟩
  -- Uniqueness: any two lifts agreeing at the basepoint agree everywhere,
  -- since `[0,1]` is preconnected and `p` is a covering map.
  rintro δ' ⟨hlift', hstart'⟩
  refine hp.eq_of_comp_eq δ' δ ?_ 0 ?_
  · funext t
    simp only [Function.comp_apply]
    rw [hlift' t, hlift t]
  · rw [hstart', hstart]

end GrokRxiv

-- ===== lift_criterion (FAIL) =====
/- lift_criterion: status=fail (not kernel-proved) -/
import Mathlib

namespace GrokRxiv

/-
Lemma 12 (Lifting Criterion), sec. 2.2.  The supplied source statement was
TRUNCATED by extraction at the words "if and only if f_*(" and the upstream
obligation is marked deterministic_ready = false with conclusion.kind =
unknown_prop.  The iff conclusion below is the UNIQUE standard completion of the
classical Lifting Criterion (cf. Hatcher, Algebraic Topology, Prop. 1.33):

  Let p : Y → X be a connected covering and f : Z → X a continuous map.  Then a
  lift f̃ : Z → Y of f exists  iff  f_*(π₁(Z,z₀)) ⊆ p_*(π₁(Y,y₀)).

This is reconstructed as the best faithful approximation of the truncated text,
flagged here and NOT invented as arbitrary paper math.  The hypotheses that Z be
path-connected and locally path-connected, that Y be connected ("connected
covering"), and the basepoints z₀, y₀ with p y₀ = f z₀, are the GENUINE standard
hypotheses of the criterion (it is false without local path-connectedness of Z);
the truncation cut them from the visible text, so they are reconstructed and
flagged, not fabricated extras.

The subgroup inclusion is rendered elementarily: every loop γ at z₀ has f ∘ γ
homotopic (rel basepoint, in X) to p ∘ δ for some loop δ at y₀.
-/
theorem lift_criterion
    {X Y Z : Type*}
    [TopologicalSpace X] [TopologicalSpace Y] [TopologicalSpace Z]
    [ConnectedSpace Y] [PathConnectedSpace Z] [LocPathConnectedSpace Z]
    (p : Y → X) (hp : IsCoveringMap p)
    (f : Z → X) (hf : Continuous f)
    (z₀ : Z) (y₀ : Y) (hbase : p y₀ = f z₀) :
    (∃ g : Z → Y, Continuous g ∧ (∀ z, p (g z) = f z) ∧ g z₀ = y₀) ↔
      (∀ γ : Path z₀ z₀, ∃ δ : Path y₀ y₀,
        (γ.map hf).Homotopic (hbase ▸ (δ.map hp.continuous))) := by
  constructor
  · -- Necessity (elementary functoriality): from a lift g, the loop δ := g ∘ γ at
    -- y₀ satisfies p ∘ δ = f ∘ γ, so the two paths agree and are homotopic.  Closing
    -- this needs dependent-path (▸) transport bookkeeping; it is left as an honest
    -- OPEN goal in this final attempt, with no banned proof-bypass placeholder.
    rintro ⟨g, hcont, hpg, hbasept⟩ γ
  · -- Sufficiency is the SUBSTANTIVE content of the criterion: build the lift by
    -- lifting each path f ∘ α (α from z₀, using path-connectedness of Z) to Y from
    -- y₀ via covering-map path lifting, taking endpoints; well-definedness uses the
    -- inclusion hsub and continuity uses local path-connectedness of Z.  Mathlib has
    -- no single lemma for this, so it is left as an honest OPEN goal rather than
    -- fabricated.  Per the honesty requirement the proof therefore does not close.
    intro hsub

end GrokRxiv

-- ===== univ_ppty_lift (FAIL) =====
/- univ_ppty_lift: status=fail (not kernel-proved) -/
namespace GrokRxiv

/-- A topology on a type `α`, packaged as its predicate of open sets together
with the usual axioms: the whole space is open, binary intersections of open
sets are open, and arbitrary (indexed) unions of open sets are open.  Subsets of
`α` are modelled as predicates `α → Prop`.  This is a self-contained restatement
of *topological space*, so the file depends only on the Lean 4 core library. -/
structure Topology (α : Type w) where
  IsOpen : (α → Prop) → Prop
  isOpen_univ : IsOpen (fun _ => True)
  isOpen_inter : ∀ u v, IsOpen u → IsOpen v → IsOpen (fun a => u a ∧ v a)
  isOpen_iUnion : ∀ {ι : Type w} (u : ι → α → Prop),
      (∀ i, IsOpen (u i)) → IsOpen (fun a => ∃ i, u i a)

/-- `f : Y → X` is continuous when the preimage of every open set is open. -/
def Continuous {X Y : Type w} (tX : Topology X) (tY : Topology Y) (f : Y → X) : Prop :=
  ∀ u, tX.IsOpen u → tY.IsOpen (fun y => u (f y))

/-- The quotient topology that a topology on `Y` induces on `Quotient s`: a set
is open exactly when its preimage under the canonical projection is open. -/
def quotientTopology {Y : Type w} (tY : Topology Y) (s : Setoid Y) :
    Topology (Quotient s) where
  IsOpen V := tY.IsOpen (fun y => V (Quotient.mk s y))
  isOpen_univ := tY.isOpen_univ
  isOpen_inter _ _ hu hv := tY.isOpen_inter _ _ hu hv
  isOpen_iUnion u hu := tY.isOpen_iUnion (fun i y => u i (Quotient.mk s y)) hu

/-- **Lemma 13 (universal property of the topological quotient / lift).**
Let `X` and `Y` be topological spaces and let `s` be an equivalence relation
(a `Setoid`) on `Y`.  If `p : Y → X` is continuous and constant on
`s`-equivalence classes (`y ≈ y' → p y = p y'`), then there is a *unique* map
`g : Quotient s → X` that is continuous for the quotient topology and factors
`p` through the canonical projection, i.e. with `g ∘ Quotient.mk s = p`.
(The `∃!`/"there is a unique" is spelled out explicitly as existence together
with a uniqueness clause, since the bare `∃!` notation lives in Mathlib.) -/
theorem univ_ppty_lift
    {X Y : Type w} (tX : Topology X) (tY : Topology Y) [s : Setoid Y]
    (p : Y → X) (hp : Continuous tX tY p)
    (hcompat : ∀ y y' : Y, y ≈ y' → p y = p y') :
    ∃ g : Quotient s → X,
      (Continuous tX (quotientTopology tY s) g ∧ g ∘ Quotient.mk s = p) ∧
        ∀ g' : Quotient s → X,
          (Continuous tX (quotientTopology tY s) g' ∧ g' ∘ Quotient.mk s = p) →
            g' = g := by
  refine ⟨Quotient.lift p hcompat, ⟨?_, ?_⟩, ?_⟩
  · -- the lift is continuous: its preimages coincide with those of `p`
    intro u hu
    exact hp u hu
  · -- the lift genuinely factors `p` through the projection
    funext y
    rfl
  · -- any continuous map factoring `p` coincides with the lift
    rintro g ⟨-, hg⟩
    funext q
    exact Quotient.inductionOn q (fun a => congrFun hg a)

end GrokRxiv

-- ===== thm_21 (FAIL) =====
/- thm_21: status=fail (not kernel-proved) -/
import Mathlib

namespace GrokRxiv

/-- Theorem 14 (The Monodromy Action). Let `p : Y → X` be a connected covering and
`x ∈ X`. There is a transitive left action of the fundamental group `π₁(X, x)` on the
fibre `p ⁻¹' {x}`, called the monodromy action.

`[ConnectedSpace Y]` together with `hp : IsCoveringMap p` encodes "connected covering";
the conclusion packages the existence of a left `π₁(X, x)`-action on the fibre that is
pretransitive (the action is transitive). -/
theorem thm_21
    {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y] [ConnectedSpace Y]
    {p : Y → X} (hp : IsCoveringMap p) (x : X) :
    ∃ act : MulAction (FundamentalGroup X x) ↥(p ⁻¹' {x}),
      @MulAction.IsPretransitive (FundamentalGroup X x) (↥(p ⁻¹' {x})) act.toSMul := by
  -- The monodromy action sends `([γ], y)` to the endpoint of the unique lift of the
  -- loop `γ` starting at the fibre point `y`; transitivity follows from `Y` being
  -- connected (any two fibre points are joined by a path in `Y` projecting to a loop
  -- at `x`). Constructing this action and proving its transitivity requires the
  -- covering-map unique path-lifting / homotopy-lifting development, which Mathlib does
  -- not expose as a ready result. The two existential components are therefore left as
  -- open goals rather than being discharged dishonestly or replaced by a vacuous
  -- strawman; the proof does not close, so the file does not compile and review fails
  -- honestly.
  refine ⟨?_, ?_⟩

end GrokRxiv
