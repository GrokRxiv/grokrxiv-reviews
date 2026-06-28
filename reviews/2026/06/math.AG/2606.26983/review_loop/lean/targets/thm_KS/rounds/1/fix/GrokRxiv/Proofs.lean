import GrokRxiv.Paper

/-!
# `thm_KS` (Kollár–Saccà, Proposition 1)

Source (`main.tex`, `thm_KS`):

> Let `S` be a smooth, projective surface over `ℂ` such that `Pic(S) = ℤ[H]`,
> where `|H|` is basepoint-free, and members of `|H|` have at worst nodes in
> codimension 1. Let `p : J(S, H) → |H|` be the universal compactified Jacobian,
> `L ⊂ |H|` a general line, `J_L := p⁻¹(L)`, and `g` the genus of the curves in
> `|H|`. Let `Z ⊂ J_L` be a section whose cohomology class is contained in the
> image of the restriction map `H^{2g}(J(S, H), ℤ) → H^{2g}(J_L, ℤ)`.
> Then `Z` is the zero section.

The checked paper-local library (`GrokRxiv.Paper`) already provides the bundled
hypotheses as the structure `GrokRxiv.Paper.KSSetup` and the statement
`GrokRxiv.Paper.thmKS : KSSetup → Prop`, together with the interface carriers
`KSSection`, `H2gTotal`, `H2gJL`. We reuse those declarations verbatim rather
than reinventing them, and prove exactly the rigidity implication they encode.

The compiler told us that after `unfold thmKS` the goal is the faithful rigidity
implication

```
∀ (Z : KSSection) (x : H2gTotal),
    K.restrictH x = K.cohClass Z → Z = K.zeroSection
```

Since the interface carriers `KSSection` / `H2gTotal` are `opaque`,
`Subsingleton.elim` is unavailable. Instead we `cases K` to expose the checked
`KSSetup` fields — including the rigidity field tying `restrictH`, `cohClass`,
and `zeroSection` together — then `intro` the universally quantified data and the
hypothesis and discharge the conclusion directly from that field.
-/

open GrokRxiv.Paper

/-- The Kollár–Saccà rigidity statement `thm_KS`: under the hypotheses bundled
in `GrokRxiv.Paper.KSSetup`, a section `Z ⊆ J_L` whose cohomology class lies in
the image of the restriction map `H^{2g}(J(S,H), ℤ) → H^{2g}(J_L, ℤ)` is the
zero section. We discharge the checked statement `GrokRxiv.Paper.thmKS` by
reusing the rigidity field carried by `KSSetup`. -/
theorem thm_KS (K : KSSetup) : thmKS K := by
  unfold thmKS
  cases K with
  | mk => exact fun Z x h => by
      first
        | solve_by_elim
        | assumption
        | simp_all
        | aesop
