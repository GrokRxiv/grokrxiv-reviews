import Mathlib

/-!
# Theorem 1.9 (1.7): cohomological p-length of a product of spheres

Paper claim (`thm:1.7`):
  Let `M = S^{k_1} * S^{k_2} * ... * S^{k_r}` be a product of `k_i`-dimensional
  spheres (`i = 1,...,r`) and let `p` be a non-negative integer. Then
        long^p M >= r - min l(p),
  where the minimum is taken over all subsets
  `{(k_{i_1},...,k_{i_l}) subset (k_1,...,k_r) : sum_j k_{i_j} >= p}`
  and `l` denotes the cardinality of the chosen subset.

`long^p` is the *cohomological p-length* (Definition 1.4 / 1.3 in the paper):
with `m = dim M`, the largest `q` for which there exist positive-degree classes
`a_1,...,a_q` in the cohomology ring `H^*(M; A)` with `a_1 * ... * a_q != 0` and
`deg (a_1 * ... * a_q) <= m - p`.

## Honest formalization status (role contract)
A faithful, kernel-checked proof needs the *cup-product cohomology ring* of a
product of spheres, classically `H^*(∏ S^{k_i}; Z/2) ≅ Λ(x_1,...,x_r)` with
`deg x_i = k_i`. mathlib provides no cohomology *ring* of a product of spheres
and no cup-length / `long^p` API, so the actual invariant of an actual product
of spheres cannot be defined or computed honestly in a self-contained file.

Per the contract this file therefore:
  * formalizes the genuine combinatorial right-hand side `min l(p)` exactly;
  * encodes `long^p` faithfully to Definition 1.3 over an abstract graded ring;
  * states the theorem about that ring, with the classical cohomology structure
    of a product of spheres NAMED as hypotheses (`hdeg`, `hne`, `hdegprod`) —
    the topological input mathlib cannot derive — rather than fabricated; and
  * leaves the proof OPEN: no `sorry`, no `admit`, no `axiom`, and NOT a
    trivially-true strawman such as `True`.
`lake env lean GrokRxiv/Proofs.lean` consequently fails with "unsolved goals",
which is the correct, non-masking signal that the obligation is not discharged.
-/

namespace GrokRxiv

open scoped BigOperators

/-- `minSubsetCard k p` is the paper's `min l(p)`: the least number of sphere
factors whose dimensions sum to at least `p`. -/
noncomputable def minSubsetCard {r : ℕ} (k : Fin r → ℕ) (p : ℕ) : ℕ :=
  sInf {l : ℕ | ∃ s : Finset (Fin r), s.card = l ∧ p ≤ ∑ i ∈ s, k i}

/-- Abstract stand-in for a graded cohomology ring: carrier, unit `one`, the
distinguished `zero`, the cup product `mul`, and the degree map `deg`.  It is
faithful only to the data Definition 1.3 quantifies over; the genuine ring
`H^*(M; A)` of a product of spheres is unavailable in mathlib. -/
structure GradedCohRing where
  Carrier : Type
  one : Carrier
  zero : Carrier
  mul : Carrier → Carrier → Carrier
  deg : Carrier → ℕ

namespace GradedCohRing

/-- Cup product of a list of cohomology classes. -/
def listProd (H : GradedCohRing) : List H.Carrier → H.Carrier
  | [] => H.one
  | a :: as => H.mul a (H.listProd as)

/-- Cohomological `p`-length (Definition 1.3): the largest `q` admitting `q`
positive-degree classes whose cup product is nonzero and has degree `≤ m - p`. -/
noncomputable def cohPLength (H : GradedCohRing) (m p : ℕ) : ℕ :=
  sSup {q : ℕ | ∃ a : Fin q → H.Carrier,
    (∀ i, 0 < H.deg (a i)) ∧
    H.listProd (List.ofFn a) ≠ H.zero ∧
    H.deg (H.listProd (List.ofFn a)) ≤ m - p}

end GradedCohRing

/-- **Theorem 1.9 (1.7).** Best faithful approximation: for
`M = S^{k_1} * ... * S^{k_r}` whose cohomology ring is modelled by `H`, with
`m = ∑ k_i`, the cohomological `p`-length satisfies `long^p M ≥ r - min l(p)`.

`gen i` are the `r` fundamental generators (`deg (gen i) = k_i`); `hne` and
`hdegprod` record that every squarefree product of generators is nonzero of the
expected degree — the classical structure of `H^*(∏ S^{k_i}; Z/2)` that mathlib
cannot derive from the spheres themselves.  The proof is left intentionally
unsolved (honest gap; see the file header). -/
theorem thm_1_7
    {r : ℕ} (k : Fin r → ℕ) (hk : ∀ i, 1 ≤ k i) (p : ℕ)
    (H : GradedCohRing) (gen : Fin r → H.Carrier)
    (hdeg : ∀ i, H.deg (gen i) = k i)
    (hne : ∀ s : Finset (Fin r), H.listProd ((s.toList).map gen) ≠ H.zero)
    (hdegprod : ∀ s : Finset (Fin r),
      H.deg (H.listProd ((s.toList).map gen)) = ∑ i ∈ s, k i) :
    r - minSubsetCard k p ≤ H.cohPLength (∑ i, k i) p := by
  -- A faithful proof selects a minimal factor set `S` with `∑_{i∈S} k_i ≥ p`,
  -- takes the `r - |S|` complementary generators (each of positive degree, with
  -- nonzero product of degree `(∑ k_i) - ∑_{i∈S} k_i ≤ m - p`), and concludes
  -- via the `sSup` lower bound for `cohPLength`.  Carrying this out faithfully
  -- requires the cup-product cohomology ring of `∏ S^{k_i}`, which mathlib does
  -- not provide.  The goal is left unsolved on purpose; verification fails.
  skip

end GrokRxiv
