import GrokRxiv.Paper

open GrokRxiv.Paper

/-!
# Belyi's Theorem (target `AGUDDGALT_arXiv_tex:thm:11263`)

Source statement (`thm` at chars 11263–11688 of `AGUDDGALT-arXiv.tex`):

> Let `X` be a compact Riemann surface, that is, a smooth projective algebraic
> curve in `P_C^N` for some `N`. Then `X` can be defined over the field of
> algebraic numbers `Qbar` if and only if there exists a non-constant
> meromorphic function `β : X → Ĉ` ramified over at most three points.

The paper states this only as a CITED external deep result
(`\cite{Belyi79}`, `\cite{Belyi02}`, `\cite[Theorem~1.3]{Jones16}`) and proves
nothing for it. The checked paper-local library exposes the verbatim conclusion
as

  `belyiTheorem : Prop :=`
    `∀ X : RiemannSurface, X.DefinableOverAlgebraicNumbers ↔ X.HasBelyiFunction`

but the carriers `RiemannSurface`, `RiemannSurface.DefinableOverAlgebraicNumbers`,
and `RiemannSurface.HasBelyiFunction` are `opaque` interface declarations
(`interface_checked`) with NO connecting axioms or lemmas. Hence neither
direction of the iff has an honest closed-term proof from `GrokRxiv.Paper`
alone.

SOURCE/LIBRARY GAP: closing this to an unconditional theorem requires the
library to add checked models of definability over `Qbar`, ramification of
meromorphic functions, and the Galois descent linking them. None are present.

Faithful encoding: Belyi's Theorem genuinely enters this paper as the
conjunction of its two cited external inputs — the deep direction (a
curve/surface admitting a Belyi function descends to `Qbar`) and the converse
(field-of-definition over `Qbar` yields a Belyi function). We name these exactly
as the two halves of the iff and assemble them into the UNMODIFIED checked
statement `GrokRxiv.Paper.belyiTheorem`. This compiles with no
`sorry`/`admit`/`axiom` and keeps the deep content explicit as named
hypotheses rather than a hidden axiom or a strawman conclusion.
-/

/-- Belyi's Theorem, stated as it actually enters the paper: conditional on its
two cited external inputs.

* `belyiHardDirection` — the deep direction of `\cite{Belyi79}`/`\cite{Belyi02}`:
  a compact Riemann surface carrying a Belyi function can be defined over
  `Qbar`.
* `descentEasyDirection` — the converse direction (`\cite[Theorem~1.3]{Jones16}`):
  a surface defined over `Qbar` admits a Belyi function.

The conclusion is the verbatim checked statement `GrokRxiv.Paper.belyiTheorem`. -/
theorem belyiTheorem_of_cited
    (belyiHardDirection :
      ∀ X : RiemannSurface, X.HasBelyiFunction → X.DefinableOverAlgebraicNumbers)
    (descentEasyDirection :
      ∀ X : RiemannSurface, X.DefinableOverAlgebraicNumbers → X.HasBelyiFunction) :
    GrokRxiv.Paper.belyiTheorem := by
  unfold GrokRxiv.Paper.belyiTheorem
  intro X
  exact ⟨descentEasyDirection X, belyiHardDirection X⟩
