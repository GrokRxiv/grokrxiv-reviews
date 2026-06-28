import Mathlib

namespace GrokRxiv

/-- A type of objects equipped with a "Borel / geometric obstruction" `obs`
valued in `τ` together with a distinguished `zero`.  This is an abstract model:
Mathlib has no genuine `G`-spectra, so we record only the structure used by the
paper, namely that an object is *Borel complete* exactly when its obstruction
vanishes. -/
class BorelObstruction (α : Type*) (τ : Type*) where
  obs : α → τ
  zero : τ

/-- An object is Borel complete iff its Borel obstruction is `zero`. -/
def BorelComplete {α τ : Type*} [inst : BorelObstruction α τ] (x : α) : Prop :=
  inst.obs x = inst.zero

/-- `cor:completionunderlying` — "A module `X ∈ Mod_R(Sp_G)` is Borel complete
if and only if the underlying `G`-spectrum `U_R(X)` is Borel complete."

`Mod` / `Sp` model the objects of `Mod_R(Sp_G)` / `Sp_G`, `U` is the underlying
`G`-spectrum functor `U_R`, and `V` transports Borel obstructions along `U`.
The corollary's proof is exactly the two structural facts recorded as
hypotheses on the ambient data (never on `X`): `U_R` is conservative, so it
reflects vanishing of the obstruction (`V` injective, `hV`), and the Borel
completion commutes with `U_R` (`hcomm`).  The statement quantifies over `X`
with no extra hypothesis on `X`, matching the paper. -/
theorem cor_completionunderlying
    {Mod Sp τM τS : Type*}
    [instM : BorelObstruction Mod τM] [instS : BorelObstruction Sp τS]
    (U : Mod → Sp) (V : τM → τS)
    (hV : Function.Injective V)
    (hzero : V instM.zero = instS.zero)
    (hcomm : ∀ X : Mod, instS.obs (U X) = V (instM.obs X))
    (X : Mod) :
    (BorelComplete X → BorelComplete (U X)) ∧ (BorelComplete (U X) → BorelComplete X) := by
  refine ⟨fun hX => ?_, fun hUX => ?_⟩
  · show instS.obs (U X) = instS.zero
    have hX' : instM.obs X = instM.zero := hX
    rw [hcomm X, hX', hzero]
  · show instM.obs X = instM.zero
    have hUX' : instS.obs (U X) = instS.zero := hUX
    apply hV
    rw [hzero, ← hcomm X]
    exact hUX'

end GrokRxiv
