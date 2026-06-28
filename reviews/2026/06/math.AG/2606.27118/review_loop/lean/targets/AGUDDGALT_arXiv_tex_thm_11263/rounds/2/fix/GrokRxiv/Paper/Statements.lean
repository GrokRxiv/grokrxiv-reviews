import Mathlib
import GrokRxiv.Paper.Definitions
import GrokRxiv.Paper.Interfaces

/-! Target claims, stated as `Prop`-valued definitions only.  None are proved. -/

namespace GrokRxiv.Paper

open Equiv

/-- Belyi's Theorem (thm:11263): a compact Riemann surface is definable over `Qbar`
    iff it admits a Belyi function. -/
def belyiTheorem : Prop :=
  ∀ X : RiemannSurface,
    X.DefinableOverAlgebraicNumbers ↔ X.HasBelyiFunction

/-- lem:order-n: a dessin with `n` edges is regular iff its monodromy order is `n`. -/
def lemOrderN : Prop :=
  ∀ D : Dessin, D.IsRegular ↔ D.monodromyOrder = D.edges

/-- prop:regaut: a dessin is regular iff its monodromy group is isomorphic to `Aut D`. -/
def propRegaut : Prop :=
  ∀ D : Dessin, D.IsRegular ↔ D.MonodromyIsoAut

/-- prop:reguni: a regular dessin has a uniform passport. -/
def propReguni : Prop :=
  ∀ D : Dessin, D.IsRegular → D.HasUniformPassport

/-- prop:tbq: `|T(b,q)| = n!/(b^q q!)` when `n = b q`. -/
def propTbq : Prop :=
  ∀ n b q : ℕ, 0 < b → n = b * q →
    (T n b q).card = n.factorial / (b ^ q * q.factorial)

/-- thm:goupil: the solution count `c_{λμ}^n` equals Goupil's closed form. -/
def thmGoupil : Prop :=
  ∀ (n : ℕ) (x : Sym n) (lam mu : Multiset ℕ),
    lam.sum = n → mu.sum = n →
    ((goupilSolutionCount n x lam mu : ℚ)) = goupilClosedForm lam mu n

/-- thm:MN: `N(b,q,n)/T(b,q) ≥ 2/(n+2)` for `n = b q ≥ 3`, `b ≥ 2`, `n ≡ q (mod 2)`. -/
def thmMN : Prop :=
  ∀ (n b q : ℕ) (x : Sym n),
    3 ≤ n → 2 ≤ b → n = b * q → n % 2 = q % 2 →
    (n + 2) * (N n x b q n 1).card ≥ 2 * (T n b q).card

/-- lem:Nbqblower: explicit lower bound for `|N(b,q,b)|` (genus ≥ 1 case). -/
def lemNbqblower : Prop :=
  ∀ (n b q : ℕ) (x : Sym n),
    n = q * b → 1 ≤ q →
    ((N n x b q b q).card : ℚ) ≥ NbqbLowerBound b q n

end GrokRxiv.Paper
