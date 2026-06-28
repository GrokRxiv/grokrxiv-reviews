import Mathlib

/-! Paper-local notation for arXiv:2606.27118,
    "Automorphism Groups of Uniform Dessins d'Enfants of Genus at Least Two". -/

namespace GrokRxiv.Paper

/-- The symmetric group `S_n` on `Fin n` (the paper's `Sym(E)` with `E = {1,…,n}`). -/
abbrev Sym (n : ℕ) : Type := Equiv.Perm (Fin n)

end GrokRxiv.Paper
