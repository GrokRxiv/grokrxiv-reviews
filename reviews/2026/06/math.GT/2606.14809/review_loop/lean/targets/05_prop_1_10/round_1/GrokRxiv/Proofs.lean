import Mathlib

namespace GrokRxiv

open Topology unitInterval

variable {X : Type*} [TopologicalSpace X]

/-- A subset `A ⊆ X` is *categorical* when it is contractible within `X` to a single
point: the inclusion `A ↪ X` is homotopic, through maps into `X`, to a constant map.
This is the `P`-category notion of the paper specialised to `P = {pt}`, i.e. the
classical Lyusternik–Shnirelman setting. -/
def Categorical (A : Set X) : Prop :=
  ∃ c : X, ∃ H : C(A × I, X),
    (∀ a : A, H (a, 0) = (a : X)) ∧ (∀ a : A, H (a, 1) = c)

/-- `X` has a categorical cover of size `n`: there exist `n` closed, categorical
subsets of `X` whose union is the whole space. -/
def HasCategoricalCover (X : Type*) [TopologicalSpace X] (n : ℕ) : Prop :=
  ∃ A : Fin n → Set X,
    (∀ i, IsClosed (A i)) ∧ (∀ i, Categorical (A i)) ∧ (⋃ i, A i) = Set.univ

/-- The Lyusternik–Shnirelman category of `X`: the least size of a categorical cover.
With this normalisation a non-empty contractible space (such as the disc `D²`) has
category one. -/
noncomputable def lsCat (X : Type*) [TopologicalSpace X] : ℕ :=
  sInf {n | HasCategoricalCover X n}

/-- Proposition 1.12 (1.10). The Lyusternik–Shnirelman category of a two-dimensional
compact connected manifold with boundary that is not homeomorphic to the disc `D²`
equals two.

The manifold-with-boundary hypothesis is encoded by charting `M` on the Euclidean
half-space `EuclideanHalfSpace 2`; compactness, connectedness and the
"not homeomorphic to the closed disc `D² = closedBall 0 1 ⊆ ℝ²`" hypothesis are kept
exactly. The paper's further refinement (the two categorical sets may be chosen to be
homeomorphic to `D²` and to meet only along their boundaries) strengthens the
conclusion; it is documented in the accompanying notes and omitted from the formal
statement as a faithful approximation. -/
theorem prop_1_10
    {M : Type*} [TopologicalSpace M] [CompactSpace M] [ConnectedSpace M]
    [ChartedSpace (EuclideanHalfSpace 2) M]
    (h_not_disc :
      ¬ Nonempty (M ≃ₜ ↥(Metric.closedBall (0 : EuclideanSpace ℝ (Fin 2)) 1))) :
    lsCat M = 2 := by
  -- A faithful proof requires the topological classification of compact connected
  -- surfaces with boundary together with both Lyusternik–Shnirelman bounds:
  --   • the lower bound `lsCat M ≥ 2` (the manifold is not contractible, so a single
  --     categorical set cannot cover it — typically a cup-length argument), and
  --   • the matching upper bound `lsCat M ≤ 2` via an explicit decomposition into two
  --     discs meeting along their boundaries.
  -- Neither the surface classification nor these category bounds are available as a
  -- self-contained Lean/Mathlib development. Per the task contract the goal is left
  -- open so the proof honestly fails, rather than masking the gap with `sorry`, an
  -- axiom, or a trivially-true strawman.

end GrokRxiv
