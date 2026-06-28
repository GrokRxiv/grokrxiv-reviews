import Mathlib
import GrokRxiv.Paper.Notation

namespace GrokRxiv.Paper

open Equiv
open scoped Classical

/-- `T(b,q)`: the permutations of `Fin n` of cycle type `(b^q)` (eq:tncd). -/
noncomputable def T (n b q : ℕ) : Finset (Sym n) :=
  Finset.univ.filter fun y => (y : Perm (Fin n)).cycleType = Multiset.replicate q b

/-- `N(b,q,a)`: elements `y ∈ T(b,q)` such that `(x y)⁻¹` has cycle type `(a^p)` (eq:tncd). -/
noncomputable def N (n : ℕ) (x : Sym n) (b q a p : ℕ) : Finset (Sym n) :=
  (T n b q).filter fun y => ((x * y)⁻¹ : Perm (Fin n)).cycleType = Multiset.replicate p a

/-- Closed-form value `n!/(b^q q!)` claimed for `|T(b,q)|` in prop:tbq. -/
def Tcount (n b q : ℕ) : ℕ := n.factorial / (b ^ q * q.factorial)

/-- The number of pairs `(σ,ρ)` of cycle types `lam`, `mu` with `σ ρ = x`
    (the quantity `c_{λμ}^n` of thm:goupil, for `x` a fixed `n`-cycle). -/
noncomputable def goupilSolutionCount (n : ℕ) (x : Sym n) (lam mu : Multiset ℕ) : ℕ :=
  (Finset.univ.filter fun p : Sym n × Sym n =>
    (p.1 : Perm (Fin n)).cycleType = lam ∧
      (p.2 : Perm (Fin n)).cycleType = mu ∧ p.1 * p.2 = x).card

end GrokRxiv.Paper
