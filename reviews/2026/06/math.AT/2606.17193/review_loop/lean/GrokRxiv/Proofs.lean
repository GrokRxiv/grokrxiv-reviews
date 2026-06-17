/- GrokRxiv combined per-theorem Lean proofs. Each section is authored and kernel-checked INDEPENDENTLY in its own harness under review_loop/lean/targets/. -/

-- ===== thm_Hall (FAIL) =====
/- thm_Hall: status=fail (not kernel-proved) -/
import Mathlib

namespace GrokRxiv

/-- A group `G` is *finitely presented* when it is isomorphic to a group presented by
finitely many generators (modelled by `Fin n`) subject to a finite set of relators.
The generated-and-related group is `PresentedGroup rels`, that is `FreeGroup (Fin n)`
modulo the normal closure of `rels`. -/
def FinitelyPresented (G : Type*) [Group G] : Prop :=
  ∃ (n : ℕ) (rels : Set (FreeGroup (Fin n))),
    rels.Finite ∧ Nonempty (G ≃* PresentedGroup rels)

/-- A *short exact sequence of groups* `1 → N → G → Q → 1`: an injective homomorphism
`N →* G`, a surjective homomorphism `G →* Q`, and exactness at the middle term, namely
the image of `N` equals the kernel of the projection onto `Q`. -/
structure ShortExactSequence (N G Q : Type*) [Group N] [Group G] [Group Q] where
  /-- inclusion of the kernel term `N` into `G` -/
  inl : N →* G
  /-- projection of `G` onto the quotient term `Q` -/
  proj : G →* Q
  /-- the inclusion is injective (exactness at `N`) -/
  inl_injective : Function.Injective inl
  /-- the projection is surjective (exactness at `Q`) -/
  proj_surjective : Function.Surjective proj
  /-- image of `N` equals kernel of the projection (exactness at `G`) -/
  exact_middle : inl.range = proj.ker

/-- **P. Hall's theorem.** If `1 → N → G → Q → 1` is a short exact sequence of groups
with `N` and `Q` finitely presented, then `G` is finitely presented. -/
theorem thm_Hall {N G Q : Type*} [Group N] [Group G] [Group Q]
    (seq : ShortExactSequence N G Q)
    (hN : FinitelyPresented N) (hQ : FinitelyPresented Q) :
    FinitelyPresented G := by
  -- Standard argument (Reidemeister–Schreier / extension presentation):
  --   * take finite presentations ⟨Y | S⟩ of N and ⟨X | R⟩ of Q;
  --   * lift each generator of X to G through a set-theoretic section of `seq.proj`;
  --   * generate G by the lifted copies of X together with `seq.inl '' Y`;
  --   * relators: the relators S of N, each relator of R rewritten as a word in Y
  --     (possible because every relator of R lands in N = ker proj), and the
  --     conjugation relations expressing normality of N in G.
  -- The construction yields a finite presentation of G, but the rewriting and the
  -- normal-form steps require an extension result for finite presentability that
  -- Mathlib does not currently provide, so the construction is not carried out here.
  obtain ⟨nN, relsN, hN_fin, ⟨eN⟩⟩ := hN
  obtain ⟨nQ, relsQ, hQ_fin, ⟨eQ⟩⟩ := hQ
  -- The remaining goal `FinitelyPresented G` is the genuine content of Hall's theorem
  -- and is deliberately left open: this file does not supply a complete kernel-checked
  -- proof, and therefore fails to compile with `unsolved goals`.

end GrokRxiv
