import GrokRxiv.Paper.Notation

/-!
# Paper-local definitions (concrete algebraic layer)

These objects are expressible directly in Mathlib and are modelled concretely
(no opaque interfaces are needed here):

* `ValidExponent` — the constraint `a ∈ (ℕ_{≥2})^n`.
* `PermEquiv` — the relation `a ∼ b` ("equality up to permutation of entries").
* `brieskornPoly` — the Brieskorn polynomial `f_a = X_1^{a_1} + ⋯ + X_n^{a_n}`.
* `BPRing` — the Brieskorn–Pham hypersurface ring
  `B_{a,k} = k[X_1, …, X_n] / (f_a)`.

All source quotations refer to `B-P_Cancellation.tex`.
-/

namespace GrokRxiv
namespace Paper

/-- Validity of an exponent tuple: `a ∈ (ℕ_{≥2})^n`, i.e. every entry is `≥ 2`.
Source: `\ba \in (\N_{\geq 2})^n`. -/
def ValidExponent {n : ℕ} (a : ExponentTuple n) : Prop :=
  ∀ i, 2 ≤ a i

/-- `PermEquiv a b` models the paper's relation `a ∼ b`, "equality up to
permutation of entries": there is a permutation `σ` of the index set with
`b i = a (σ i)` for all `i`.  Source: "where `\ba \sim \bb` denotes equality up
to permutation of entries." -/
def PermEquiv {n : ℕ} (a b : ExponentTuple n) : Prop :=
  ∃ σ : Equiv.Perm (Fin n), ∀ i, b i = a (σ i)

/-- The Brieskorn polynomial `f_a = X_1^{a_1} + ⋯ + X_n^{a_n}` over `k`.
Source: `f_\ba = X_1^{a_1}+\cdots+X_n^{a_n}`. -/
noncomputable def brieskornPoly (k : Type) [CommRing k] {n : ℕ} (a : ExponentTuple n) :
    MvPolynomial (Fin n) k :=
  ∑ i, (MvPolynomial.X i) ^ (a i)

/-- The Brieskorn–Pham hypersurface ring
`B_{a,k} = k[X_1, …, X_n] / (X_1^{a_1} + ⋯ + X_n^{a_n})`, with its canonical
`k`-algebra structure.  Source:
`B_{\ba,k} := k[X_1,\ldots,X_n] / (X_1^{a_1}+\cdots+X_n^{a_n})`. -/
noncomputable abbrev BPRing (k : Type) [CommRing k] {n : ℕ} (a : ExponentTuple n) : Type :=
  MvPolynomial (Fin n) k ⧸ Ideal.span {brieskornPoly k a}

end Paper
end GrokRxiv
