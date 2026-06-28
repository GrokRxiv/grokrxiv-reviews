import GrokRxiv.Paper.Notation
import GrokRxiv.Paper.Definitions
import GrokRxiv.Paper.Interfaces
import GrokRxiv.Paper.Statements
import GrokRxiv.Paper.Lemmas
open GrokRxiv.Paper

/-!
GrokRxiv theorem target workspace.

claim_id: thm:mainC
obligation_id: theorem_inventory::thm:mainC
seed_reason: inventory_author_seed

Source statement (`B-P_Cancellation.tex`, `\label{thm:mainC}`):
Let `n ≥ 2` and `a, b ∈ (ℕ_{≥2})^n`.
* (1) Over a field `k` of characteristic `0`,
      `B_{a,k} ≅_{k-alg} B_{b,k}  ⟺  V_{a,k} ≅_k V_{b,k}  ⟺  a ∼ b`,
      where `a ∼ b` denotes equality up to permutation of entries.
* (2) If `k = ℂ`, then
      `\hat B_a ≅_{ℂ-alg} \hat B_b ⟺ \hat V_a ≅_{bihol} \hat V_b
                                  ⟺ V_a^{an} ≅_{bihol} V_b^{an} ⟺ a ∼ b`.

# Faithful statement vs. provable content

The two parts of `thm:mainC` are recorded *verbatim* in the checked paper-local
library as the `Prop`-valued definitions `GrokRxiv.Paper.ExponentRigidityField`
(part 1) and `GrokRxiv.Paper.ExponentRigidityComplex` (part 2), each phrased as a
`List.TFAE` over the exact source equivalences.  `ExponentRigidityMainC` below
assembles them into the single faithful proposition of `thm:mainC`.

The *full* theorem cannot be honestly discharged here: the hard directions route
through the paper-local interfaces `IsoOverBase`, `bpVariety`, `BiholAn`,
`BiholFormal`, `FormalRingIso`, … which are deliberately introduced as
`noncomputable opaque` carriers (no `axiom`/`sorry` is permitted, so they carry
no equational content), and the source proof itself invokes machinery absent
from Mathlib (a Hilbert-series computation on Jacobian-ideal Artinian rings; the
Hauser–Müller analytic cancellation and unique-factorization theorems; Artin
approximation; Gurjar's theorem).  This blocker is recorded in `notes`.

What *is* honestly provable — and is genuine, non-strawman content of part (1) —
is the "easy" implication `a ∼ b ⟹ B_{a,k} ≅_{k-alg} B_{b,k}`: a permutation of
the variables of `k[X_1, …, X_n]` carries the Brieskorn polynomial `f_a` to
`f_b`, hence descends to a `k`-algebra isomorphism of the hypersurface rings.
This is proved below as `permEquiv_imp_bpRingIso`, reusing the paper-local
`BPRing`, `brieskornPoly` and `PermEquiv` definitions.
-/

namespace GrokRxiv
namespace Proofs

open MvPolynomial

/-- The faithful proposition of `thm:mainC`: part (1) for every characteristic-zero
field, and part (2) over `ℂ`, both taken from the checked paper-local library. -/
def ExponentRigidityMainC : Prop :=
  (∀ (k : Type) [Field k] [CharZero k], ExponentRigidityField k) ∧ ExponentRigidityComplex

/-- The "easy" direction of `thm:mainC` part (1): permutation-equivalent exponent
tuples give `k`-algebra–isomorphic Brieskorn–Pham hypersurface rings,
`a ∼ b ⟹ B_{a,k} ≅_{k-alg} B_{b,k}`.

The witness is variable renaming by the underlying permutation: `rename σ.symm`
is a `k`-algebra automorphism of `k[X_1, …, X_n]` sending `f_a = ∑ X_i^{a_i}` to
`f_b = ∑ X_i^{b_i}` (since `b i = a (σ i)`), hence carrying `(f_a)` onto `(f_b)`
and descending to an isomorphism of the quotient rings. -/
theorem permEquiv_imp_bpRingIso (k : Type) [CommRing k] {n : ℕ}
    {a b : ExponentTuple n} (h : PermEquiv a b) :
    Nonempty (BPRing k a ≃ₐ[k] BPRing k b) := by
  obtain ⟨σ, hσ⟩ := h
  -- `rename σ.symm` carries the Brieskorn polynomial of `a` to that of `b`.
  have hpoly :
      (MvPolynomial.renameEquiv k σ.symm) (brieskornPoly k a) = brieskornPoly k b := by
    rw [MvPolynomial.renameEquiv_apply]
    simp only [brieskornPoly, map_sum, map_pow, MvPolynomial.rename_X]
    refine (Fintype.sum_equiv σ
        (fun i => (MvPolynomial.X i : MvPolynomial (Fin n) k) ^ b i)
        (fun i => (MvPolynomial.X (σ.symm i) : MvPolynomial (Fin n) k) ^ a i) ?_).symm
    intro x
    simp only [Equiv.symm_apply_apply, hσ x]
  -- The induced map of principal ideals carries `(f_a)` onto `(f_b)`, so the
  -- `k`-algebra automorphism descends to the quotient rings.
  refine ⟨Ideal.quotientEquivAlg (Ideal.span {brieskornPoly k a})
      (Ideal.span {brieskornPoly k b}) (MvPolynomial.renameEquiv k σ.symm) ?_⟩
  rw [Ideal.map_span, Set.image_singleton]
  exact congrArg (fun p => Ideal.span {p}) hpoly.symm

end Proofs
end GrokRxiv
