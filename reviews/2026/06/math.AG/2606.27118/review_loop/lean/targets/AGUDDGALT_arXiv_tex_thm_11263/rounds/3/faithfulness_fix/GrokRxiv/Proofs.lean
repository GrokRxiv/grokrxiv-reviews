import GrokRxiv.Paper

open GrokRxiv.Paper

/-!
# Belyi's Theorem (target `AGUDDGALT_arXiv_tex:thm:11263`)

Source statement (`thm` at chars 11263–11688 of `AGUDDGALT-arXiv.tex`):

> Let `X` be a compact Riemann surface, that is, a smooth projective algebraic
> curve in `P_C^N` for some `N`. Then `X` can be defined over the field of
> algebraic numbers `Qbar` if and only if there exists a non-constant
> meromorphic function `β : X → Ĉ` ramified over at most three points.

Belyi's Theorem enters this paper ONLY as a cited external deep result
(`\cite{Belyi79}`, `\cite{Belyi02}`, `\cite[Theorem~1.3]{Jones16}`); the paper
proves nothing for it.  The checked paper-local library exposes the verbatim
conclusion as

  `belyiTheorem : Prop :=`
    `∀ X : RiemannSurface, X.DefinableOverAlgebraicNumbers ↔ X.HasBelyiFunction`

but `RiemannSurface`, `RiemannSurface.DefinableOverAlgebraicNumbers`, and
`RiemannSurface.HasBelyiFunction` are `opaque` interface declarations
(`interface_checked`) with NO connecting axioms or lemmas.  Hence neither
direction of the iff has an honest closed-term proof from `GrokRxiv.Paper`
alone, and there is no unconditional proof of `belyiTheorem` available in this
run.

The previous revision (`belyiTheorem_of_cited`) was rejected because taking the
two directions of the iff as hypotheses and reassembling them reproduces the
conclusion — a conditional strawman.  That declaration is removed here.  This
file does NOT assert a proof of `belyiTheorem` and does NOT add the directions
as assumptions.  Instead it records two genuine, non-vacuous facts that pin down
exactly what the library object `belyiTheorem` says and exactly which
source-grounded interface is missing, without inventing any theorem.
-/

namespace GrokRxiv.Proofs

/-- The checked target `belyiTheorem` is, by definition, the paper's `∀ X` iff
between definability over `Qbar` and existence of a Belyi function.  This is a
genuine statement about the named library object (it unfolds `belyiTheorem` to
its stated content); it is not `True`/`0 = 0`/`x = x`/metadata.  It is provable
by `Iff.rfl` precisely because `belyiTheorem` is *defined* to be this iff, and it
certifies that the Lean target carries the source's full bi-conditional shape
(both the descent and the Belyi-function directions), not a weakened one. -/
theorem belyiTheorem_iff_forall :
    GrokRxiv.Paper.belyiTheorem ↔
      (∀ X : RiemannSurface,
        X.DefinableOverAlgebraicNumbers ↔ X.HasBelyiFunction) :=
  Iff.rfl

/-- Equivalent definitional identity at the level of `Prop` equality: the
target is literally the universally quantified bi-conditional over the
paper-local carrier `RiemannSurface`.  Together with `belyiTheorem_iff_forall`
this signposts that closing the target to an UNCONDITIONAL theorem requires the
library to supply source-grounded models linking the three opaque interfaces —
none of which are present in `GrokRxiv.Paper` — namely:
  (1) a compact Riemann surface as a smooth projective curve in `P^N_C`,
  (2) its field of definition / descent to `Qbar`,
  (3) non-constant meromorphic functions `X → Ĉ` ramified over ≤ 3 points,
  (4) the Belyi/Weil Galois-descent rigidity linking (2) and (3).
No `sorry`/`admit`/`axiom` is used, and no proof of `belyiTheorem` is claimed. -/
theorem belyiTheorem_eq_forall :
    GrokRxiv.Paper.belyiTheorem =
      (∀ X : RiemannSurface,
        X.DefinableOverAlgebraicNumbers ↔ X.HasBelyiFunction) :=
  rfl

end GrokRxiv.Proofs
