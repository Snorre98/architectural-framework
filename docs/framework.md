# Documentation framework

This is the single, shared documentation framework for defining the architecture
of any system in any repository. Each *system* (a cohesive deliverable: a
service, a library, an app, a subsystem) documents its architecture with a
layered stack, each layer answering one question, under `docs/<system>/`.

It generalizes the framework first worked out in the `deep-research` project
(originally recorded as `docs/engine/adr/0001-architecture-documentation-framework.md`).

## The stack

1. `<system>/architecture.md` — **arc42** skeleton (all 12 sections, distilled),
   C4 diagrams as Mermaid (renders in GitHub, zero tooling).
2. `<system>/adr/` — **Nygard-format ADRs** (Title/Status/Context/Decision/
   Consequences + Alternatives Considered), immutable once accepted,
   supersession protocol, one decision per record. Numbering restarts per
   system (`<system>/adr/0001…`).
3. `<system>/behaviors/*.feature` — **Gherkin** contracts for deterministic
   behavior (acceptance criteria, executable).
4. `<system>/contracts/` — **precise contracts** (the exact data/interface/
   state shapes the behavior features and ADRs reference).
5. `<system>/traceability.md` — the matrix mapping ADRs → arc42 sections →
   behaviors → contracts (and, where relevant, acceptance criteria).

## Process rule

Every architectural change = new ADR → update the arc42 sections it touches.
Diagrams are Mermaid until a Structurizr DSL migration earns its keep.

## Standards mapping

The arc42 appendix in each `<system>/architecture.md` maps every section to the
SEI viewtypes (module / component-and-connector / allocation) and ISO/IEC/IEEE
42010 concepts. The canonical mapping table lives in
[`standards-mapping.md`](standards-mapping.md).

## Consequences

+ One defensible source of truth per system; high→low structure (C4),
  completeness (arc42), reasoning (ADRs), executable contracts (Gherkin).
+ Diagrams and decisions version with the repo, no tooling gate.
- Full 12-section skeletons carry near-empty sections early on (accepted —
  empty sections are the discipline).
- Mermaid can't express everything C4 tooling can (accepted; notation is
  secondary).

## Reference implementation

The `deep-research` project is the canonical worked example of this framework in
action: `docs/engine/` (a mature system) and `docs/ui/` (a minimal system). Use
it to see how a full set of ADRs, behaviors, contracts, and a traceability
matrix read end-to-end.
