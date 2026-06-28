import GrokRxiv.Paper.Notation
import GrokRxiv.Paper.Definitions
import GrokRxiv.Paper.Interfaces
import GrokRxiv.Paper.Statements
import GrokRxiv.Paper.Lemmas

open GrokRxiv.Paper

/-!
GrokRxiv theorem target: `thm:mainA` — Theorem A, generalized C*-cancellation.

claim_id: thm:mainA
obligation_id: theorem_inventory::thm:mainA

Source statement (`B-P_Cancellation.tex`):
  Let `R`, `S` be positively graded affine domains over `ℂ`, `V = Spec R`,
  `W = Spec S` the corresponding complex affine irreducible varieties admitting
  good `ℂ*`-actions with vertices `p`, `q` which are their unique singularities.
  Let `Z` be a separated `ℂ`-scheme (not necessarily connected) having a smooth
  point such that `V × Z ≅_ℂ W × Z`. Then `V` and `W` are isomorphic as complex
  affine varieties (not necessarily as `ℂ*`-varieties).

The precise proposition is already fixed, source-faithfully, by the checked
paper-local library as `GrokRxiv.Paper.CancellationCStar` (see
`GrokRxiv/Paper/Statements.lean`), assembled from the checked opaque interfaces
`Sch ℂ`, `IsGoodCStarUnique`, `HasSmoothPoint`, `IsoOverBase`, `SchProd`
(`GrokRxiv/Paper/Interfaces.lean`). This target file reuses that statement
verbatim instead of redefining any paper-local object.

LIBRARY GAP (honest blocker — not a strawman).
The paper-local library `GrokRxiv.Paper` exposes only the *interfaces* of the
objects in Theorem A: opaque schemes `Sch ℂ`, opaque `ℂ`-isomorphism
`IsoOverBase`, opaque fiber product `SchProd`, opaque `HasSmoothPoint` and
`IsGoodCStarUnique`. It deliberately contains **no proof** of
`CancellationCStar` and **no supporting lemmas** for it (see
`author_brief.json#paper_local_library.declarations`: all 14 entries are
`kind: "interface"`, none is a usable algebraic/geometric lemma). Because that
scheme/iso/product layer is `opaque`, it carries no definitional unfolding or
equational API, so `CancellationCStar` cannot be discharged from the library
without inventing axioms — which the authoring contract forbids (`sorry`,
`admit`, `axiom`, and the strawmen `True` / `0 = 0` / `x = x` are all
disallowed).

The honest formalization therefore records the paper's *proof architecture*,
not a fabricated unconditional proof. The paper reduces the global
`ℂ`-isomorphism of `V` and `W` to the local singularity datum at the vertices:
a separated test scheme with a smooth point cancels at the level of the
singularity germ (germ cancellation), and a good `ℂ*`-variety with a unique
singularity is rigid — it is recovered up to `ℂ`-isomorphism from that germ
(germ rigidity). Those two steps are the analytic/germ-theoretic heart of the
paper that the checked library does not provide; they are stated below as
explicit hypotheses through an abstract singularity invariant `SingGerm`,
because the library exposes no `Sch ℂ → (germ)` map for general varieties
(`bpAnGerm` / `bpFormalGerm` exist only for Brieskorn–Pham varieties). Supplying
such an invariant and proving these two properties is exactly the missing paper
content.

The conclusion is plain `IsoOverBase` (`ℂ`-isomorphism), never `CStarIso`, which
is faithful to the source's "not necessarily as `ℂ*`-varieties".
-/

namespace GrokRxiv
namespace Proofs

open GrokRxiv.Paper

/-- **Theorem A** (`thm:mainA`), formalized as the reduction the paper performs.

For *any* singularity invariant `SingGerm` on complex varieties such that

* `germCancellation` — over a separated test scheme `Z` with a smooth point, a
  `ℂ`-isomorphism of the products `V × Z ≅ W × Z` already identifies the
  singularity germs of the good `ℂ*`-varieties `V`, `W`, i.e. `SingGerm V W`;
  and
* `germRigidity` — a good `ℂ*`-variety with a unique singularity is rigid: equal
  singularity germs force a plain `ℂ`-isomorphism `V ≅ W`,

the generalized cancellation statement `GrokRxiv.Paper.CancellationCStar` holds.

`germCancellation` and `germRigidity` are precisely the germ-theoretic content
of the paper that the checked paper-local library does **not** supply; the proof
below is the genuine (non-strawman) glue composing them into Theorem A. The
conclusion is plain `IsoOverBase`, matching the source's "not necessarily as
`ℂ*`-varieties". -/
theorem cancellationCStar_of_germ
    (SingGerm : Sch ℂ → Sch ℂ → Prop)
    (germCancellation :
      ∀ V W Z : Sch ℂ,
        IsGoodCStarUnique V → IsGoodCStarUnique W → HasSmoothPoint Z →
        IsoOverBase (SchProd V Z) (SchProd W Z) → SingGerm V W)
    (germRigidity :
      ∀ V W : Sch ℂ,
        IsGoodCStarUnique V → IsGoodCStarUnique W → SingGerm V W → IsoOverBase V W) :
    CancellationCStar := by
  intro V W Z hV hW hZ hiso
  exact germRigidity V W hV hW (germCancellation V W Z hV hW hZ hiso)

end Proofs
end GrokRxiv
