import Mathlib

namespace GrokRxiv

/-- A group `G` is *finitely presented* when it is isomorphic to a group given by
finitely many generators (modelled by `Fin n`) subject to a finite set of relators.
The generated-and-related group is `PresentedGroup rels`, i.e. `FreeGroup (Fin n)`
modulo the normal closure of `rels`. -/
def FinitelyPresented (G : Type*) [Group G] : Prop :=
  ∃ (n : ℕ) (rels : Set (FreeGroup (Fin n))),
    rels.Finite ∧ Nonempty (G ≃* PresentedGroup rels)

/-- A *short exact sequence of groups* `1 → N → G → Q → 1`: an injective homomorphism
`N →* G`, a surjective homomorphism `G →* Q`, and exactness at the middle term, namely
the image of `N` equals the kernel of the projection to `Q`. -/
structure ShortExactSequence (N G Q : Type*) [Group N] [Group G] [Group Q] where
  /-- inclusion of the kernel term `N` into `G` -/
  inl : N →* G
  /-- projection of `G` onto the quotient term `Q` -/
  proj : G →* Q
  /-- exactness at `N`: the inclusion is injective -/
  inl_injective : Function.Injective inl
  /-- exactness at `Q`: the projection is surjective -/
  proj_surjective : Function.Surjective proj
  /-- exactness at `G`: image of `N` equals kernel of the projection -/
  exact_middle : inl.range = proj.ker

/-- **P. Hall's theorem.** If `1 → N → G → Q → 1` is a short exact sequence of groups
with `N` and `Q` finitely presented, then `G` is finitely presented. -/
theorem thm_Hall {N G Q : Type*} [Group N] [Group G] [Group Q]
    (seq : ShortExactSequence N G Q)
    (hN : FinitelyPresented N) (hQ : FinitelyPresented Q) :
    FinitelyPresented G := by
  -- Standard proof (Reidemeister–Schreier / extension-presentation argument):
  --   * take finite presentations ⟨Y | S⟩ of N and ⟨X | R⟩ of Q;
  --   * lift each generator of X to G through a set-theoretic section of `seq.proj`;
  --   * generate G by {lifted X} ∪ {seq.inl '' Y};
  --   * relators: the relators S of N, each relator of R rewritten as a word in Y
  --     (valid because R maps into N = ker proj), and conjugation relations
  --     encoding the normality of N in G.
  -- This yields a finite presentation of G. Formalizing the rewriting and the
  -- normal-form argument is well beyond the machinery available here (Mathlib has no
  -- finite-presentation-of-extensions result), so the goal is left GENUINELY OPEN.
  -- Per the role instructions it is NOT discharged by `sorry`, `admit`, an `axiom`,
  -- or a trivial strawman; consequently this file fails to compile (`unsolved goals`),
  -- which honestly reflects the unmet proof obligation.
  obtain ⟨nN, relsN, hN_fin, ⟨eN⟩⟩ := hN
  obtain ⟨nQ, relsQ, hQ_fin, ⟨eQ⟩⟩ := hQ
  -- Remaining goal: `FinitelyPresented G` — honestly unproven.

end GrokRxiv
