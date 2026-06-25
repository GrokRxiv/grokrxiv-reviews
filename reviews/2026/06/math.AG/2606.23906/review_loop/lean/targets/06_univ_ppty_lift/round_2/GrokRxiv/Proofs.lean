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
