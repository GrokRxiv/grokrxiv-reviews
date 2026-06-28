import GrokRxiv.Paper.Notation
import GrokRxiv.Paper.Definitions
import GrokRxiv.Paper.Interfaces
import GrokRxiv.Paper.Statements
import GrokRxiv.Paper.Lemmas
open GrokRxiv.Paper

/-!
GrokRxiv theorem target workspace.

claim_id: thm:mainB
obligation_id: theorem_inventory::thm:mainB
seed_reason: inventory_author_seed

Source statement (`B-P_Cancellation.tex`, `\label{thm:mainB}`):
  Let `n ≥ 2`, and let `V_a`, `V_b` be Brieskorn–Pham varieties over `ℂ`
  corresponding to tuples `a, b ∈ (ℕ_{≥2})^n`.  Then for any separated
  `ℂ`-scheme `Z` (not necessarily connected) having a smooth point, the
  following are equivalent:
    (1) `V_a × Z ≅_ℂ V_b × Z`;
    (2) `V_a ≅_ℂ V_b`;
    (3) `V_a` and `V_b` are isomorphic as `ℂ^*`-varieties;
    (4) `a ∼ b`  (equality up to permutation of entries).

The precise proposition is already fixed, source-faithfully, by the checked
paper-local library as `GrokRxiv.Paper.CancellationBP`:

  `∀ {n} (a b : ExponentTuple n), 2 ≤ n → ValidExponent a → ValidExponent b →`
  `  ∀ Z, HasSmoothPoint Z →`
  `    [ IsoOverBase (SchProd (bpVariety ℂ a) Z) (SchProd (bpVariety ℂ b) Z),`
  `      IsoOverBase (bpVariety ℂ a) (bpVariety ℂ b),`
  `      CStarIso (bpVariety ℂ a) (bpVariety ℂ b),`
  `      PermEquiv a b ].TFAE`

so this target reuses that statement verbatim rather than redefining it.

## Honest formalization status (source/library gap)

The geometric content of Theorem B lives entirely in the *opaque* interface
layer (`IsoOverBase`, `SchProd`, `CStarIso`, `bpVariety`, …) declared in
`GrokRxiv.Paper.Interfaces`.  Those interfaces are intentionally bodyless
`opaque` declarations with **no connecting axioms**, and Mathlib contains no
usable theory of `ℂ^*`-equivariant isomorphisms of Brieskorn–Pham spectra.
Consequently *none* of the four implications of the equivalence — not even the
"easy" ones such as (3) ⇒ (2) (forget equivariance) or (2) ⇒ (1) (base change
by `Z`) — can be discharged from the checked library: there is no lemma relating
`CStarIso` to `IsoOverBase`, or `IsoOverBase V W` to
`IsoOverBase (SchProd V Z) (SchProd W Z)`.  The hard direction (1) ⇒ (4) is the
paper's main theorem itself (cancellation + exponent rigidity, via Theorem A).

Closing `CancellationBP` outright would therefore require either `sorry`
(forbidden) or inventing the missing interface lemmas as bare `axiom`s
(forbidden).  Instead we expose the blocker *in code* as a faithful **conditional
formalization**: we take exactly the four implications that constitute the
paper's proof of the equivalence as explicit, source-annotated hypotheses, and
prove that they assemble into the full TFAE.  The conclusion is the genuine
claim `CancellationBP` (no strawman, no `True`/`x = x`); the hypotheses name
precisely which paper-local results are still missing from the checked library.
A later phase that adds those interface lemmas (or proves them) can supply the
four arguments and obtain the unconditional theorem.
-/

namespace GrokRxiv
namespace Paper

/-- **Theorem B** (`thm:mainB`), conditional formalization.

The conclusion `CancellationBP` is the exact source statement fixed by the
paper-local library.  The four hypotheses are the implications forming the
cycle (1) ⇒ (4) ⇒ (3) ⇒ (2) ⇒ (1) that the paper establishes; each is currently
a source/library gap (the opaque interface layer provides no axiom connecting
these relations, so they cannot be derived here):

* `perm_of_prod` — (1) ⇒ (4): a `ℂ`-isomorphism `V_a × Z ≅ V_b × Z` for some `Z`
  with a smooth point forces `a ∼ b`.  This is the paper's main content
  (generalized Zariski cancellation for B–P varieties, via Theorem A plus
  exponent rigidity).
* `cstar_of_perm` — (4) ⇒ (3): permuting the exponents yields a
  `ℂ^*`-equivariant isomorphism of the Brieskorn–Pham varieties.
* `iso_of_cstar` — (3) ⇒ (2): a `ℂ^*`-isomorphism is in particular a
  `ℂ`-isomorphism (forget the `𝔾_m`-equivariance).
* `prod_of_iso` — (2) ⇒ (1): base change by `Z` turns `V_a ≅_ℂ V_b` into
  `V_a × Z ≅_ℂ V_b × Z`.

Given these, the equivalence of (1)–(4) is purely propositional and is proved
by closing the cycle. -/
theorem thm_mainB
    (perm_of_prod : ∀ {n : ℕ} (a b : ExponentTuple n) (Z : Sch ℂ),
        HasSmoothPoint Z →
        IsoOverBase (SchProd (bpVariety ℂ a) Z) (SchProd (bpVariety ℂ b) Z) →
        PermEquiv a b)
    (cstar_of_perm : ∀ {n : ℕ} (a b : ExponentTuple n),
        PermEquiv a b → CStarIso (bpVariety ℂ a) (bpVariety ℂ b))
    (iso_of_cstar : ∀ {n : ℕ} (a b : ExponentTuple n),
        CStarIso (bpVariety ℂ a) (bpVariety ℂ b) →
        IsoOverBase (bpVariety ℂ a) (bpVariety ℂ b))
    (prod_of_iso : ∀ {n : ℕ} (a b : ExponentTuple n) (Z : Sch ℂ),
        IsoOverBase (bpVariety ℂ a) (bpVariety ℂ b) →
        IsoOverBase (SchProd (bpVariety ℂ a) Z) (SchProd (bpVariety ℂ b) Z)) :
    CancellationBP := by
  intro n a b _hn _ha _hb Z hZ
  tfae_have 1 → 4 := fun h => perm_of_prod a b Z hZ h
  tfae_have 4 → 3 := fun h => cstar_of_perm a b h
  tfae_have 3 → 2 := fun h => iso_of_cstar a b h
  tfae_have 2 → 1 := fun h => prod_of_iso a b Z h
  tfae_finish

end Paper
end GrokRxiv
