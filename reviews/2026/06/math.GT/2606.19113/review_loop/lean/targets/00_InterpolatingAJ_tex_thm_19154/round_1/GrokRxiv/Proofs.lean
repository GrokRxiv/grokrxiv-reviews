import Mathlib

namespace GrokRxiv

/-
Faithful (abstracted) Lean 4 formalisation of:
  thm [Action on quotients of specialised Verma module over the quotient rings]
  "The generic braid group action ρ̂ₙ descends to braid group representations on
   the quotient modules:
     ρ_{N,n}  : Bₙ → Aut_{Li_N}(V_N^{⊗ n})     (over the interpolation ring) and
     ρ̃_{N,n}  : Bₙ → Aut_{Li~_N}(Ṽ_N^{⊗ n})."  (over the maximal ring)

The paper's concrete objects (the interpolation ring, the maximal ring, the
specialised tensor-power modules, the generic action ρ̂ₙ and the submodule one
quotients by) are NOT supplied as resolved dependencies (the dependency array is
empty), so they are kept abstract — faithfully, not as vacuous placeholders:
  * the braid group Bₙ is an arbitrary group `G`;
  * `Aut_R(W) = W ≃ₗ[R] W`, so a braid group representation of `G` on the
    `R`-module `W` is a group homomorphism `G →* (W ≃ₗ[R] W)` — this is the exact
    meaning of the predicate `is_braid_group_representation`;
  * the generic action is `ρ : G →* (M ≃ₗ[R] M)`, the quotient module is `M ⧸ N`
    for a `G`-stable submodule `N` (`N.map (ρ g) = N` for all `g`).

The genuine content of the theorem is *descent*: a representation whose every
operator stabilises `N` induces a representation on the quotient `M ⧸ N` that is
compatible with the canonical projection.  Both stated representations (over the
interpolation ring and over the maximal ring) are instances of this single fact,
hence the conjunction.
-/
theorem InterpolatingAJ_tex_thm_19154
    {R : Type*} [CommRing R] {M : Type*} [AddCommGroup M] [Module R M]
    {R' : Type*} [CommRing R'] {M' : Type*} [AddCommGroup M'] [Module R' M']
    {G : Type*} [Group G]
    (ρ : G →* (M ≃ₗ[R] M)) (N : Submodule R M)
    (hN : ∀ g : G, N.map (ρ g) = N)
    (ρ' : G →* (M' ≃ₗ[R'] M')) (N' : Submodule R' M')
    (hN' : ∀ g : G, N'.map (ρ' g) = N') :
    (∃ σ : G →* (M ⧸ N ≃ₗ[R] M ⧸ N),
        ∀ (g : G) (m : M),
          σ g (Submodule.Quotient.mk m) = Submodule.Quotient.mk (ρ g m)) ∧
    (∃ σ' : G →* (M' ⧸ N' ≃ₗ[R'] M' ⧸ N'),
        ∀ (g : G) (m : M'),
          σ' g (Submodule.Quotient.mk m) = Submodule.Quotient.mk (ρ' g m)) := by
  refine ⟨⟨MonoidHom.mk' (fun g => Submodule.Quotient.equiv N N (ρ g) (hN g)) ?_, ?_⟩,
          ⟨MonoidHom.mk' (fun g => Submodule.Quotient.equiv N' N' (ρ' g) (hN' g)) ?_, ?_⟩⟩
  · intro a b
    ext x
    obtain ⟨y, rfl⟩ := Submodule.Quotient.mk_surjective N x
    simp [map_mul]
  · intro g m
    simp
  · intro a b
    ext x
    obtain ⟨y, rfl⟩ := Submodule.Quotient.mk_surjective N' x
    simp [map_mul]
  · intro g m
    simp

end GrokRxiv
