import Mathlib

/-!
# Theorem 1.9 (1.7): cohomological p-length of a product of spheres

Paper claim (`thm:1.7`): for `M = S^{k_1} × ... × S^{k_r}` (a product of
`k_i`-spheres) and `p ≥ 0`, `long^p M ≥ r - min l(p)`, where the minimum of the
cardinality `l` is over subsets of `{k_1,...,k_r}` whose dimension sum is `≥ p`,
and `long^p` is the cohomological p-length of Definition 1.3.

A kernel-checked proof needs the cup-product cohomology ring of a product of
spheres (`H^*(∏ S^{k_i}; Z/2) ≅ Λ(x_1,...,x_r)`, `deg x_i = k_i`) and a
cup-length API. Self-contained Mathlib has neither, so the invariant of a real
product of spheres cannot be defined or computed here.

This file gives the best faithful approximation: `min l(p)` is formalized
exactly; `long^p` is encoded per Definition 1.3 over an abstract graded ring;
the topological structure Mathlib cannot derive is NAMED as hypotheses
(`hdeg`, `hne`, `hdegprod`) rather than fabricated; and the proof is left OPEN
(no unfinished-proof placeholder, no proof-skipping bypass, no extra postulated
rule, and not a trivially-true `True` restatement). `lake env lean` then reports
"unsolved goals" — the honest signal that the obligation is not discharged.
-/

namespace GrokRxiv

open scoped BigOperators

/-- `minSubsetCard k p` is the paper's `min l(p)`: the least number of sphere
factors whose dimensions sum to at least `p`. -/
noncomputable def minSubsetCard {r : ℕ} (k : Fin r → ℕ) (p : ℕ) : ℕ :=
  sInf {l : ℕ | ∃ s : Finset (Fin r), s.card = l ∧ p ≤ ∑ i ∈ s, k i}

/-- Abstract graded cohomology ring: the data Definition 1.3 quantifies over.
The genuine ring `H^*(M; A)` of a product of spheres is unavailable in Mathlib. -/
structure GradedCohRing where
  Carrier : Type
  one : Carrier
  zero : Carrier
  mul : Carrier → Carrier → Carrier
  deg : Carrier → ℕ

namespace GradedCohRing

/-- Cup product of a list of classes. -/
def listProd (H : GradedCohRing) : List H.Carrier → H.Carrier
  | [] => H.one
  | a :: as => H.mul a (H.listProd as)

/-- Cohomological `p`-length (Definition 1.3): the largest `q` for which there
exist `q` positive-degree classes whose cup product is nonzero of degree `≤ m - p`. -/
noncomputable def cohPLength (H : GradedCohRing) (m p : ℕ) : ℕ :=
  sSup {q : ℕ | ∃ a : Fin q → H.Carrier,
    (∀ i, 0 < H.deg (a i)) ∧
    H.listProd (List.ofFn a) ≠ H.zero ∧
    H.deg (H.listProd (List.ofFn a)) ≤ m - p}

end GradedCohRing

/-- **Theorem 1.9 (1.7).** Best faithful approximation: with `m = ∑ k_i` and the
cohomology ring of `M = S^{k_1} × ... × S^{k_r}` modelled by `H`, the
cohomological `p`-length satisfies `long^p M ≥ r - min l(p)`. `hne`/`hdegprod`
record that every squarefree product of generators is nonzero of the expected
degree — the structure of `H^*(∏ S^{k_i}; Z/2)` Mathlib cannot derive. The proof
is left intentionally open (honest gap; see the file header). -/
theorem thm_1_7
    {r : ℕ} (k : Fin r → ℕ) (hk : ∀ i, 1 ≤ k i) (p : ℕ)
    (H : GradedCohRing) (gen : Fin r → H.Carrier)
    (hdeg : ∀ i, H.deg (gen i) = k i)
    (hne : ∀ s : Finset (Fin r), H.listProd ((s.toList).map gen) ≠ H.zero)
    (hdegprod : ∀ s : Finset (Fin r),
      H.deg (H.listProd ((s.toList).map gen)) = ∑ i ∈ s, k i) :
    r - minSubsetCard k p ≤ H.cohPLength (∑ i, k i) p := by
  -- Faithful proof sketch: pick a minimal factor set `S` with `∑_{i∈S} k_i ≥ p`,
  -- take the `r - |S|` complementary generators (positive degree, nonzero
  -- product of degree `(∑ k_i) - ∑_{i∈S} k_i ≤ m - p`), then apply the `sSup`
  -- lower bound for `cohPLength`. This needs the cup-product cohomology ring of
  -- `∏ S^{k_i}`, absent from Mathlib; the goal is left unresolved on purpose.
  skip

end GrokRxiv
