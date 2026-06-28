import GrokRxiv.Paper.Interfaces

/-!
# Paper-local statements (the selected `lean_target` theorems)

Each selected target theorem is recorded here as a `Prop`-valued definition
capturing the *statement* of the result.  These definitions are deliberately
**not proved** in this library (per the authoring rules): they fix the precise
proposition that a later formalization phase may attempt to establish.

Targets (all from `B-P_Cancellation.tex`):

* `CancellationCStar` — Theorem A (`thm:mainA`).
* `CancellationBP` — Theorem B (`thm:mainB`).
* `ExponentRigidityField` — Theorem C(1) (`thm:mainC`, part 1).
* `ExponentRigidityComplex` — Theorem C(2) (`thm:mainC`, part 2).
-/

namespace GrokRxiv
namespace Paper

/-- **Theorem A** (`thm:mainA`): generalized cancellation for complex affine
varieties with a good `C*`-action and a unique singularity.

For complex affine irreducible varieties `V`, `W` that are spectra of positively
graded affine domains over `ℂ`, admitting good `𝔾_m`-actions whose vertices are
their unique singular points, and any separated `ℂ`-scheme `Z` having a smooth
point, `V × Z ≅_ℂ W × Z` implies `V ≅_ℂ W` as complex affine varieties. -/
def CancellationCStar : Prop :=
  ∀ (V W Z : Sch ℂ),
    IsGoodCStarUnique V → IsGoodCStarUnique W → HasSmoothPoint Z →
    IsoOverBase (SchProd V Z) (SchProd W Z) → IsoOverBase V W

/-- **Theorem B** (`thm:mainB`): generalized Zariski cancellation for
Brieskorn–Pham varieties over `ℂ`.

For `n ≥ 2` and `a, b ∈ (ℕ_{≥2})^n`, and for any separated `ℂ`-scheme `Z` having
a smooth point, the following are equivalent:
1. `V_a × Z ≅_ℂ V_b × Z`;
2. `V_a ≅_ℂ V_b`;
3. `V_a` and `V_b` are isomorphic as `C*`-varieties;
4. `a ∼ b`. -/
def CancellationBP : Prop :=
  ∀ {n : ℕ} (a b : ExponentTuple n),
    2 ≤ n → ValidExponent a → ValidExponent b →
    ∀ Z : Sch ℂ, HasSmoothPoint Z →
      [ IsoOverBase (SchProd (bpVariety ℂ a) Z) (SchProd (bpVariety ℂ b) Z),
        IsoOverBase (bpVariety ℂ a) (bpVariety ℂ b),
        CStarIso (bpVariety ℂ a) (bpVariety ℂ b),
        PermEquiv a b ].TFAE

/-- **Theorem C(1)** (`thm:mainC`, part 1): exponent rigidity over a field `k` of
characteristic zero.

For `n ≥ 2` and `a, b ∈ (ℕ_{≥2})^n` the following are equivalent:
1. `B_{a,k} ≅_{k-alg} B_{b,k}`;
2. `V_{a,k} ≅_k V_{b,k}`;
3. `a ∼ b`. -/
def ExponentRigidityField (k : Type) [Field k] [CharZero k] : Prop :=
  ∀ {n : ℕ} (a b : ExponentTuple n),
    2 ≤ n → ValidExponent a → ValidExponent b →
      [ Nonempty (BPRing k a ≃ₐ[k] BPRing k b),
        IsoOverBase (bpVariety k a) (bpVariety k b),
        PermEquiv a b ].TFAE

/-- **Theorem C(2)** (`thm:mainC`, part 2): exponent rigidity over `ℂ` in the
formal and analytic settings.

For `n ≥ 2` and `a, b ∈ (ℕ_{≥2})^n` the following are equivalent:
1. `\hat B_a ≅_{ℂ-alg} \hat B_b`;
2. `\hat V_a ≅_{bihol} \hat V_b`;
3. `V_a^{an} ≅_{bihol} V_b^{an}`;
4. `a ∼ b`. -/
def ExponentRigidityComplex : Prop :=
  ∀ {n : ℕ} (a b : ExponentTuple n),
    2 ≤ n → ValidExponent a → ValidExponent b →
      [ FormalRingIso a b,
        BiholFormal (bpFormalGerm a) (bpFormalGerm b),
        BiholAn (bpAnGerm a) (bpAnGerm b),
        PermEquiv a b ].TFAE

end Paper
end GrokRxiv
