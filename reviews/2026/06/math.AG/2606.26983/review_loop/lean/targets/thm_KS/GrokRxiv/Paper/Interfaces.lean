import GrokRxiv.Paper.Notation

/-! Source-grounded paper-local interfaces.

    The paper's objects live in algebraic geometry (Mordell–Weil groups, 1-cycles
    modulo (generic) numerical equivalence, Picard groups of rigidified sheaves,
    cohomology of compactified Jacobians) and have no Mathlib counterparts. Each
    geometric carrier is modelled as an `opaque` paper-local type with a harmless
    inhabitation body, so no opaque value is bodyless and no `noncomputable`
    Classical choice is required. The relevant abelian-group structures and maps
    are carried as data in `Setup`/`KSSetup` (see Definitions.lean) rather than
    constructed, keeping the library axiom-free. -/

namespace GrokRxiv.Paper

/-- `MW(A/C)`, the Mordell–Weil group of sections of `A/C`. -/
opaque MWCarrier : Type := PUnit

/-- `N_1(A)`, complete 1-cycles modulo numerical equivalence. -/
opaque N1Carrier : Type := PUnit

/-- `N_{1,gen}(A)`, complete 1-cycles modulo generic numerical equivalence. -/
opaque N1genCarrier : Type := PUnit

/-- `Pic(A)_rig`, rigidified invertible sheaves on `A` modulo isomorphism. -/
opaque PicRigCarrier : Type := PUnit

/-- `Pic(A_η)`, the Picard group of the generic fibre. -/
opaque PicEtaCarrier : Type := PUnit

/-- A section of `J_L/L` in the Kollár–Saccà setting. -/
opaque KSSection : Type := PUnit

/-- `H^{2g}(J(S,H), ℤ)`. -/
opaque H2gTotal : Type := PUnit

/-- `H^{2g}(J_L, ℤ)`. -/
opaque H2gJL : Type := PUnit

end GrokRxiv.Paper
