import Mathlib

namespace GrokRxiv

/-- Proposition 9 of the source paper (`prop:st-explicit-pres`, sec-2-3-2).

Extracted statement: "The following map of `ℚ[GL(V)]`-modules is an
isomorphism ...". The explicit map together with its domain and codomain were
truncated from the extracted artifact (`conclusion.kind = unknown_prop`,
`reason = statement_truncated_by_extraction`), and the task input supplied no
defining dependencies, definitions, or assumptions. The concrete map cannot be
reconstructed without fabricating paper content, which the input contract
forbids.

The faithful content that survives extraction is only the *shape* of the
assertion: a `GL(V)`-equivariant `ℚ`-linear map between two `ℚ[GL(V)]`-modules
is a bijection. This best faithful approximation is stated below for the
supplied data and is intentionally left unproved -- the proof body fails rather
than discharging a strawman or fabricating a derivation -- so this obligation
correctly fails review instead of masking the gap with `sorry`/`admit`/`axiom`. -/
theorem prop_st_explicit_pres
    {V : Type*} [AddCommGroup V] [Module ℚ V]
    {M N : Type*}
    [AddCommGroup M] [Module ℚ M] [MulAction (V ≃ₗ[ℚ] V) M]
    [AddCommGroup N] [Module ℚ N] [MulAction (V ≃ₗ[ℚ] V) N]
    (f : M →ₗ[ℚ] N)
    (hf : ∀ (g : V ≃ₗ[ℚ] V) (m : M), f (g • m) = g • f m) :
    Function.Bijective f := by
  fail "Proposition 9 (prop:st-explicit-pres) cannot be faithfully proved: the explicit ℚ[GL(V)]-module map was truncated from the extracted statement (statement_truncated_by_extraction). Refusing to fabricate the map or prove a strawman; leaving the obligation to fail review."

end GrokRxiv
