import Mathlib

/-!
# Paper-local notation

Notation and basic carriers for *Generalized Zariski cancellation for
Brieskorn–Pham varieties* (arXiv:2606.26890).

A Brieskorn–Pham variety is attached to an exponent tuple
`a = (a_1, …, a_n) ∈ (ℕ_{≥2})^n`.  We model the tuple as a function
`Fin n → ℕ`; the constraint `a_i ≥ 2` is recorded separately by
`GrokRxiv.Paper.ValidExponent` so that an exponent tuple can be named without
carrying its proof obligations.
-/

namespace GrokRxiv
namespace Paper

/-- An exponent tuple `a = (a_1, …, a_n)`.  Source: the tuples
`\ba = (a_1,\ldots,a_n) \in (\N_{\geq 2})^n` of `B-P_Cancellation.tex`. -/
abbrev ExponentTuple (n : ℕ) : Type := Fin n → ℕ

end Paper
end GrokRxiv
