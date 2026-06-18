import Mathlib

open scoped BigOperators

namespace GrokRxiv

theorem InterpolatingAJ_tex_lem_72872
    {R : Type*} [CommRing R] {n : ℕ} (I : Fin n → Ideal R)
    (hco : ∀ i j, i ≠ j → I i ⊔ I j = ⊤) :
    ⨅ i, I i = ∏ i, I i := by
  -- For coprime ideals, the product equals the intersection.
  have mul_eq_inf : ∀ J K : Ideal R, J ⊔ K = ⊤ → J * K = J ⊓ K := by
    intro J K h
    refine le_antisymm Ideal.mul_le_inf ?_
    intro x hx
    rw [Submodule.mem_inf] at hx
    obtain ⟨hxJ, hxK⟩ := hx
    have h1 : (1 : R) ∈ J ⊔ K := by rw [h]; exact Submodule.mem_top
    rw [Submodule.mem_sup] at h1
    obtain ⟨y, hy, z, hz, hyz⟩ := h1
    have hxeq : x * y + x * z = x := by rw [← mul_add, hyz, mul_one]
    rw [← hxeq]
    refine add_mem ?_ ?_
    · rw [mul_comm x y]; exact Ideal.mul_mem_mul hy hxK
    · exact Ideal.mul_mem_mul hxJ hz
  -- The product over any finset of pairwise-coprime ideals equals their infimum.
  have key : ∀ s : Finset (Fin n), (∏ i ∈ s, I i) = s.inf I := by
    intro s
    refine Finset.induction_on s ?_ ?_
    · simp [Ideal.one_eq_top]
    · intro a t ha ih
      rw [Finset.prod_insert ha, Finset.inf_insert, ih]
      have hcop : I a ⊔ t.inf I = ⊤ := by
        rw [← ih, ← Ideal.isCoprime_iff_sup_eq]
        refine IsCoprime.prod_right ?_
        intro i hi
        rw [Ideal.isCoprime_iff_sup_eq]
        exact hco a i (by rintro rfl; exact ha hi)
      exact mul_eq_inf (I a) (t.inf I) hcop
  -- Convert the type-indexed infimum into the `Finset.univ` infimum.
  have hconv : (⨅ i, I i) = Finset.univ.inf I := by
    refine le_antisymm ?_ ?_
    · exact Finset.le_inf (fun i _ => iInf_le I i)
    · exact le_iInf (fun i => Finset.inf_le (Finset.mem_univ i))
  rw [hconv]
  exact (key Finset.univ).symm

end GrokRxiv
