import GrokRxiv.Paper.Definitions

/-!
# Paper-local interfaces (opaque, source-grounded)

The geometric, analytic and formal constructions used by the paper are not
available in Mathlib in a directly usable form, so they are introduced here as
*source-grounded opaque interfaces*.  Each interface maps to explicit source
evidence in `library_manifest.json`.

Abstract carrier types are introduced through `NonemptyType` so that they carry
a guaranteed inhabitant *without* an `axiom`/`sorry`; the bodyless opaque
operations and constants that land in these (possibly non-`Prop`) types are
therefore declared `noncomputable opaque`, as required.

Modelled here:

* separated `k`-schemes `Sch k` (the paper's "varieties": reduced separated
  finite-type `k`-schemes, together with the auxiliary test schemes `Z`);
* `k`-isomorphism `IsoOverBase` (`≅_k`) and fiber product `SchProd` (`×_k`);
* `HasSmoothPoint`;
* the Theorem A hypothesis `IsGoodCStarUnique` (complex affine irreducible
  variety with a good `𝔾_m`-action whose vertex is its unique singularity);
* `CStarIso` — isomorphism as `C*`-varieties (`𝔾_m`-equivariant isomorphism);
* the Brieskorn–Pham variety `bpVariety k a = Spec B_{a,k}`;
* complex analytic germs `AnGerm` and formal germs `FormalGerm`, the associated
  Brieskorn–Pham germs, biholomorphic equivalence `BiholAn` / `BiholFormal`, and
  the formal `ℂ`-algebra isomorphism relation `FormalRingIso`.
-/

namespace GrokRxiv
namespace Paper

/-! ## Separated `k`-schemes and their morphisms -/

/-- Carrier for the type of separated `k`-schemes (paper "varieties": reduced
separated schemes of finite type over `k`), packaged with a guaranteed
inhabitant.  Source: "by a *variety* over a field `k` we mean a reduced
separated scheme of finite type over `k`". -/
opaque SchemeCarrier (k : Type) : NonemptyType

/-- The type of separated `k`-schemes used throughout the paper. -/
noncomputable def Sch (k : Type) : Type := (SchemeCarrier k).type

instance (k : Type) : Nonempty (Sch k) := (SchemeCarrier k).property

/-- Isomorphism of `k`-schemes, written `≅_k` in the paper. -/
opaque IsoOverBase {k : Type} : Sch k → Sch k → Prop

/-- Fiber product of `k`-schemes over `k`, written `×` (over `k`) in the paper,
e.g. `V \times Z`. -/
noncomputable opaque SchProd {k : Type} : Sch k → Sch k → Sch k

/-- `Z` has a smooth point.  Source: a separated `k`-scheme "having a smooth
point". -/
opaque HasSmoothPoint {k : Type} : Sch k → Prop

/-- The Theorem A hypothesis on a complex scheme `V`: it is the spectrum of a
positively graded affine domain over `ℂ`, i.e. a complex affine irreducible
variety admitting a good `𝔾_{m}`-action (good `C*`-action) whose vertex is its
unique singular point.  Source: "Let `R` … be positively graded affine domains
over `ℂ` … admitting good `ℂ^*`-actions with vertices `p` … Assume that `p` …
[is] the unique singularit[y] of `V`". -/
opaque IsGoodCStarUnique : Sch ℂ → Prop

/-- Isomorphism as `C*`-varieties (a `𝔾_{m}`-equivariant isomorphism).  Source:
"`V_\ba` and `V_\bb` are isomorphic as `ℂ^*`-varieties". -/
opaque CStarIso : Sch ℂ → Sch ℂ → Prop

/-- The Brieskorn–Pham variety `V_{a,k} = Spec(B_{a,k}) ⊆ 𝔸^n_k`.  Source:
`V_{\ba,k} := \Spec(B_{\ba,k}) \subseteq \A^n_k`. -/
noncomputable opaque bpVariety (k : Type) [Field k] {n : ℕ} (a : ExponentTuple n) : Sch k

/-! ## Complex analytic germs and formal completions -/

/-- Carrier for complex analytic space germs, with a guaranteed inhabitant. -/
opaque AnGermCarrier : NonemptyType

/-- The type of complex analytic space germs `(V, o)`. -/
noncomputable def AnGerm : Type := AnGermCarrier.type

instance : Nonempty AnGerm := AnGermCarrier.property

/-- Carrier for formal (algebroid) germs, with a guaranteed inhabitant. -/
opaque FormalGermCarrier : NonemptyType

/-- The type of formal completions / algebroid space germs. -/
noncomputable def FormalGerm : Type := FormalGermCarrier.type

instance : Nonempty FormalGerm := FormalGermCarrier.property

/-- The analytic germ `V_a^{an} = (V_a, o_a)` at the singular point.  Source:
`V^{\rm an}_\ba := (V_\ba, \oo_\ba)`. -/
noncomputable opaque bpAnGerm {n : ℕ} (a : ExponentTuple n) : AnGerm

/-- The formal completion germ `\hat V_a = \widehat{(V_a, o_a)}`.  Source:
`\widehat{V}_\ba := \widehat{(V_\ba, \oo_\ba)}`. -/
noncomputable opaque bpFormalGerm {n : ℕ} (a : ExponentTuple n) : FormalGerm

/-- Biholomorphic equivalence of analytic germs, written `≅_{bihol}`.  Source:
`V_\ba^{\rm an} \cong_{\rm bihol} V_\bb^{\rm an}`. -/
opaque BiholAn : AnGerm → AnGerm → Prop

/-- Biholomorphic equivalence of formal germs, written `≅_{bihol}`.  Source:
`\widehat{V}_\ba \cong_{\rm bihol} \widehat{V}_\bb`. -/
opaque BiholFormal : FormalGerm → FormalGerm → Prop

/-- `ℂ`-algebra isomorphism of the formal completions of the Brieskorn–Pham
rings, `\hat B_a ≅_{ℂ-alg} \hat B_b`, where
`\hat B_a = ℂ[[X_1, …, X_n]] / (X_1^{a_1} + ⋯ + X_n^{a_n})`.  Modelled as an
opaque relation because the formal-completion algebra is not used elsewhere in
Mathlib in this quotient form.  Source:
`\widehat{B}_\ba \cong_{\C\text{-alg}} \widehat{B}_\bb`. -/
opaque FormalRingIso {n : ℕ} (a b : ExponentTuple n) : Prop

end Paper
end GrokRxiv
