import Mathlib

/-! Source-grounded paper-local interfaces.  These are `opaque` because the
    underlying topological / algebraic-geometric objects (Riemann surfaces,
    dessins, monodromy and automorphism groups, Goupil's closed form) are not
    modelled concretely in this run; each is mapped to source evidence in the
    manifest. -/

namespace GrokRxiv.Paper

/-- A compact Riemann surface (a smooth projective algebraic curve). -/
opaque RiemannSurface : Type

/-- `X` can be defined over the field of algebraic numbers `Qbar`. -/
opaque RiemannSurface.DefinableOverAlgebraicNumbers : RiemannSurface → Prop

/-- `X` admits a non-constant meromorphic function ramified over at most three points. -/
opaque RiemannSurface.HasBelyiFunction : RiemannSurface → Prop

/-- A dessin d'enfant. -/
opaque Dessin : Type

/-- The number of edges of the dessin. -/
opaque Dessin.edges : Dessin → ℕ

/-- The dessin is regular (its monodromy group acts freely and transitively on edges). -/
opaque Dessin.IsRegular : Dessin → Prop

/-- The order of the monodromy group of the dessin. -/
opaque Dessin.monodromyOrder : Dessin → ℕ

/-- The monodromy group `G` of the dessin is isomorphic to `Aut D`. -/
opaque Dessin.MonodromyIsoAut : Dessin → Prop

/-- The dessin has a uniform passport. -/
opaque Dessin.HasUniformPassport : Dessin → Prop

/-- Goupil's closed-form value of `c_{λμ}^n` (thm:goupil). -/
opaque goupilClosedForm : Multiset ℕ → Multiset ℕ → ℕ → ℚ

/-- The explicit lower bound for `|N(b,q,b)|` of lem:Nbqblower (arguments `b q n`). -/
opaque NbqbLowerBound : ℕ → ℕ → ℕ → ℚ

end GrokRxiv.Paper
