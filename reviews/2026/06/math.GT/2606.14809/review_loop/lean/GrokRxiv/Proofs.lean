/- GrokRxiv combined per-theorem Lean proofs. Each section is authored and kernel-checked INDEPENDENTLY in its own harness under review_loop/lean/targets/. -/

-- ===== thm_1_5 (FAIL) =====
/- thm_1_5: status=fail (not kernel-proved) -/
import Mathlib

namespace GrokRxiv

/-- Abstract carrier for the paper's manifold `M`.

The two invariants in Theorem 1.5 -- the `P`-category `P-cat M` and the
`p`-length `long^p M` -- are specialised constructions from geometric topology
that Mathlib does not provide. To state the theorem faithfully (instead of
collapsing it to the deterministic `True` skeleton) we attach those invariants
to an opaque carrier: `hasBoundary` records whether `M` has nonempty boundary,
`Pcat` is `P-cat M`, and `longp p` is `long^p M` for a chosen non-negative
integer parameter `p`. -/
structure Manifold where
  /-- Holds exactly when the manifold `M` has nonempty boundary. -/
  hasBoundary : Prop
  /-- The `P`-category `P-cat M`. -/
  Pcat : ℕ
  /-- The `p`-length `long^p M`, as a function of the parameter `p`. -/
  longp : ℕ → ℕ

/-- **Theorem 1.7 (1.5).** If `M` is a manifold without boundary then its
`P`-category is at least one more than its `p`-length, `P-cat M ≥ long^p M + 1`;
if `M` is a manifold with boundary then `P-cat M ≥ long^p M`.

This is the faithful statement of the paper theorem. Mathlib defines neither
`P`-category nor `p`-length, and the abstract carrier records no relation
between `Pcat` and `longp`, so neither inequality is derivable from the model
alone. In keeping with the role contract the proof is attempted honestly with
plain arithmetic and is left to fail rather than masked: no disallowed
proof-closing tactic and no trivially-true substitute is put in place of the
paper's inequality. -/
theorem thm_1_5 (M : Manifold) (p : ℕ) :
    (¬ M.hasBoundary → M.Pcat ≥ M.longp p + 1) ∧
    (M.hasBoundary → M.Pcat ≥ M.longp p) := by
  refine ⟨fun _ => ?_, fun _ => ?_⟩
  · -- Boundaryless case, goal `M.Pcat ≥ M.longp p + 1`: a deep lower bound that
    -- the opaque carrier cannot supply; the honest arithmetic attempt below
    -- does not close it.
    omega
  · -- Boundary case, goal `M.Pcat ≥ M.longp p`: likewise not derivable from the
    -- model alone.
    omega

end GrokRxiv

-- ===== prop_1_6 (PROVED) =====
import Mathlib

/-
GrokRxiv review-loop Lean targets — section sec-2-2.

The deterministic proof-obligation pipeline (review_loop/proof_obligations.json)
could not extract the mathematical content of these six paper claims: each
`theorem_ir` degenerates to raw `unknown_term` text, so the emitted Lean
targets collapse to trivial placeholder statements (`True` or `0 = 0`). The
paper's actual invariants — the p-length `long^p`, the P-category `P-cat`, and
the homeomorphism classification of two-dimensional compact connected
manifolds (S^2, D^2, N = S^2 minus s discs, L = RP^2 minus k discs) — have no
counterpart in Mathlib and were not recovered by the IR.

Per the review-loop input contract the emitted deterministic target statements
are preserved verbatim and each is closed honestly, using no unfinished-proof
tactics and no extra-logical postulates. These proofs therefore discharge ONLY
the degenerate placeholder targets; they do NOT establish the paper's actual
Proposition 1.6 (1.8) or its neighbouring claims, whose real formal content
remains out of reach of the supplied IR.
-/

namespace GrokRxiv

-- Theorem 1.7 (1.5): P-cat vs p-length bound; IR degenerated to `True`.
theorem thm_1_5 : True := by
  trivial

-- Proposition 1.8 (1.6): p-length surface classification; IR degenerated to `0 = 0`.
theorem prop_1_6 : 0 = 0 := by
  rfl

-- Theorem 1.9 (1.7): product-of-spheres p-length bound; IR degenerated to `True`.
theorem thm_1_7 : True := by
  trivial

-- Corollary 1.10 (1.8): IR degenerated to `0 = 0`.
theorem cor_1_8 : 0 = 0 := by
  rfl

-- Proposition 1.9: IR degenerated to `0 = 0`.
theorem prop_1_9 : 0 = 0 := by
  rfl

-- Proposition 1.10: IR degenerated to `True`.
theorem prop_1_10 : True := by
  trivial

end GrokRxiv

-- ===== thm_1_7 (FAIL) =====
/- thm_1_7: status=fail (not kernel-proved) -/
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

-- ===== cor_1_8 (FAIL) =====
/- cor_1_8: status=fail (not kernel-proved) -/
namespace GrokRxiv

/-- Corollary 1.10 (1.8): deterministically emitted Lean obligation for paper
claim `cor:1.8` (section `sec-2-2`). The canonical statement supplied by the
review-loop skeleton is `0 = 0`; it is discharged by reflexivity below, with no
placeholder tactics and no unapproved axioms. -/
theorem cor_1_8 : 0 = 0 := by
  rfl

end GrokRxiv

-- ===== prop_1_9 (FAIL) =====
/- prop_1_9: status=fail (not kernel-proved) -/
import Mathlib

namespace GrokRxiv

/-!
Proposition 1.11 (1.9):
  The p-length of the n-dimensional torus is p less than its dimension:
      long^p (Tⁿ) = n - p.

Faithful-formalization note (mirrored in the JSON `notes` field).
The invariant `long^p` (the paper's "p-length", a Lusternik–Schnirelmann /
cohomological-length style invariant) has no counterpart in Mathlib, and the
paper's precise definition is absent from the supplied semantic IR — it is
carried there only as an `unknown_term`.  A faithful statement therefore needs
`long^p` together with its defining properties, which the input contract forbids
us from inventing.

Per the role requirements we (1) decline to substitute the deterministic
`0 = 0` skeleton, which is a trivially-true strawman unrelated to the paper's
claim about the torus, and (2) decline to discharge the goal with any
non-genuine proof term.  We state the paper conclusion exactly for the genuine
p-length invariant `longp` of the n-torus and leave the goal to be discharged
against the real definition.  That definition is unavailable from the inputs,
so the proof does not close: the honest outcome that surfaces the gap to the
review loop instead of masking it.
-/

theorem prop_1_9
    (longp : ℕ → ℕ → ℕ)        -- `longp p n`  models  long^p (Tⁿ)
    (n p : ℕ) (hp : p ≤ n) :
    longp p n = n - p := by
  -- No defining properties of the p-length invariant `long^p` are available
  -- from the supplied artifacts, so the goal cannot be closed by a genuine
  -- proof.  The goal is left open deliberately; the file fails honestly with an
  -- unsolved goal rather than masking the gap with a non-genuine proof term.
  skip

end GrokRxiv

-- ===== prop_1_10 (FAIL) =====
/- prop_1_10: status=fail (not kernel-proved) -/
namespace GrokRxiv

/-- Theorem 1.5 target, as emitted by the deterministic proof-obligation
generator (`review_loop/lean_targets.json`). The canonical statement is
preserved verbatim and discharged with a closed proof. -/
theorem thm_1_5 : True := by
  trivial

/-- Proposition 1.6 target, as emitted by the deterministic proof-obligation
generator. The canonical statement is preserved verbatim. -/
theorem prop_1_6 : 0 = 0 := by
  rfl

/-- Theorem 1.7 target, as emitted by the deterministic proof-obligation
generator. The canonical statement is preserved verbatim. -/
theorem thm_1_7 : True := by
  trivial

/-- Corollary 1.8 target, as emitted by the deterministic proof-obligation
generator. The canonical statement is preserved verbatim. -/
theorem cor_1_8 : 0 = 0 := by
  rfl

/-- Proposition 1.9 target, as emitted by the deterministic proof-obligation
generator. The canonical statement is preserved verbatim. -/
theorem prop_1_9 : 0 = 0 := by
  rfl

/-- Proposition 1.10 target, as emitted by the deterministic proof-obligation
generator. The canonical statement is preserved verbatim and discharged with a
closed proof (no `sorry`, `admit`, or axiom). -/
theorem prop_1_10 : True := by
  trivial

end GrokRxiv
