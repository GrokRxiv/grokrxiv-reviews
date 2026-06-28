import GrokRxiv.Paper

/-!
# GrokRxiv/Proofs.lean — target `AGUDDGALT_arXiv_tex:thm:11263` (Belyĭ's Theorem)

Source theorem (`source_tex`):

  Let `X` be a compact Riemann surface, that is, a smooth projective algebraic
  curve in `ℙ_ℂ^N` for some `N`. Then `X` can be defined over the field of
  algebraic numbers `Q̄` if and only if there exists a non-constant meromorphic
  function `β : X → Ĉ` ramified over at most three points.

The checked paper-local library already provides this source-faithful statement
as `GrokRxiv.Paper.belyiTheorem`:

  `∀ X : RiemannSurface, X.DefinableOverAlgebraicNumbers ↔ X.HasBelyiFunction`

assembled from the `interface_checked` opaque constants `RiemannSurface`,
`RiemannSurface.DefinableOverAlgebraicNumbers`, and
`RiemannSurface.HasBelyiFunction`.

LIBRARY/PROOF GAP. These three predicates are opaque interface constants and the
library supplies no axiom, structure, or lemma relating
`DefinableOverAlgebraicNumbers` to `HasBelyiFunction`. The biconditional is thus
logically independent of everything in scope: a genuine proof needs the full
content of Belyĭ's 1979 theorem (forward = arithmetic ⇒ a cover ramified over at
most three points; reverse = Weil/Grothendieck descent), which is present
neither in the opaque interface nor in Mathlib v4.30.0. Per the contract we
expose the blocker on the real claim rather than substitute a strawman; the two
equivalence directions are left genuinely open after `intro`/`constructor`,
producing an honest `unsolved goals` diagnostic. No
`sorry`/`admit`/`axiom`/`True`/`rfl`-strawman is used. To make this target
compile, the library must add a checked statement (or interface lemmas
`belyi_forward`/`belyi_reverse`) connecting the two predicates.
-/

open GrokRxiv.Paper

theorem belyi_theorem : GrokRxiv.Paper.belyiTheorem := by
  unfold GrokRxiv.Paper.belyiTheorem
  intro X
  constructor
  -- Forward (Belyĭ 1979): `X.DefinableOverAlgebraicNumbers → X.HasBelyiFunction`.
  · intro hX
    -- No in-scope term relates the opaque predicates; goal remains open.
    exact?
  -- Reverse (Weil descent): `X.HasBelyiFunction → X.DefinableOverAlgebraicNumbers`.
  · intro hX
    exact?
