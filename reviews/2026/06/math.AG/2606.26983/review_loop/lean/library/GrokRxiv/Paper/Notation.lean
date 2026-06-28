import Mathlib

/-!
# Paper-local notation for arXiv:2606.26983

"On a conjecture by Koll\u00e1r and Sacc\u00e0" (Autissier–Fanelli).

This file only fixes the `GrokRxiv.Paper` namespace and a small piece of
notation used to mirror the paper's zero section `Z_0`.
-/

namespace GrokRxiv.Paper

/-- `Z₀` denotes the additive identity, modelling the paper's zero section `Z_0`
of a smooth commutative group scheme `A/C`. -/
scoped notation:max "Z₀" => (0)

end GrokRxiv.Paper
