# Define Architecture — Reference

The method this skill applies: a layered, docs-as-code documentation framework
generalized from the `deep-research` project, extended with SEI "Documenting
Software Architectures" theory. A required base model — **compact modules +
public APIs** — sits under everything (layer 0).

## 0. Base model: compact modules + public APIs (required)

A system is a set of **compact modules**, each **sealed by default**: its
features are private. The only way another module can use them is through a
deliberately defined **public API** — a narrow, stable set of operations
(Fowler *service layer*) that hides the domain + data beneath it.

Rules (normative):
- **R1 — Sealed by default.** Nothing is cross-module usable unless listed in
  the module's public API.
- **R2 — Explicit public API.** Deliberately defined, narrow, stable.
- **R3 — Public-API-only dependencies.** Never reach into internals (types,
  tables, state, files).
- **R4 — Inward, acyclic.** Leaf modules hold pure/deterministic logic.
- **R5 — Test at the boundary.** Exercise modules through their public API.
- **R6 — Contracted.** Each public API is a precise contract.

Required-by-default: deviating requires an ADR (ADR-0001) recording the reason
and alternative. **Probe during the interview:** "for each module — what is its
public API? everything else is private."

## 1. The framework (per system)

Each system documents its architecture with a layered stack, each layer
answering one question, under `docs/<system>/`:

1. `architecture.md` — **arc42** skeleton (12 sections) + **C4** as Mermaid.
2. `adr/` — **Nygard ADRs**, immutable, numbered per system.
3. `behaviors/*.feature` — **Gherkin** executable contracts.
4. `contracts/` — `module-boundaries` (base model) + data/interface/state/failure/concurrency contracts.
5. `traceability.md` — matrix: ADR → arc42 → behavior → contract.

**Process rule:** every architectural change = new ADR → update the arc42
sections it touches. Diagrams are Mermaid until Structurizr DSL earns its keep.

## 2. ADR format (Nygard)

```
# ADR-NNNN: <Title>
Status: Accepted

## Context        — forces, constraints, why now
## Decision       — the precise choice
## Consequences   — + what improves, - what it costs
## Alternatives considered — rejected options + why
```

Rules: one decision per record; immutable once accepted; supersede with a new
ADR, never edit an accepted one; number restarts per system.

## 3. arc42 section guide

| § | Must answer |
|---|---|
| 1. Introduction & Goals | what + why; top-5 quality goals as scenarios; stakeholders |
| 2. Constraints | hard limits and their source |
| 3. Context & Scope | C4 L1 diagram + external interfaces |
| 4. Solution Strategy | the 2-5 defining moves |
| 5. Building Block View | C4 L2 (containers), L3 (components + responsibilities) |
| 6. Runtime View | happy path + failure/degradation path |
| 7. Deployment View | environments + mapping software→hardware |
| 8. Cross-cutting Concepts | shared mechanisms, linked to contracts |
| 9. Architectural Decisions | index of ADRs |
| 10. Quality Requirements | quality tree + scenarios + behavior-contract table + DoD |
| 11. Risks & Technical Debt | severity + mitigation |
| 12. Glossary | domain terms |
| Appendix A | SEI viewtypes + ISO/IEC/IEEE 42010 mapping |
| Appendix B | viewpoint declaration |

## 4. Precise contracts

| Contract | Covers |
|---|---|
| `module-boundaries` | every module, its public API (defined operations), hidden internals, and the acyclic public-API-only dependency graph (base model) |
| `data-model` | durable data formats: schemas, column types, invariants |
| `interface` | the seam between two parts: signatures, shapes, errors, invariants |
| `state-machine` | states (phase/condition/terminal), transitions, invariants |
| `failure-semantics` | retries + backoff, degrade-to-partial, error surfacing |
| `concurrency-topology` | bounded queues, capacities, backpressure, single-writer |

## 5. Gherkin behavior contracts

Each `.feature` file holds `Scenario:` blocks. Every scenario links a source
ADR. Scenarios are normative (must hold at integration level) and map 1:1 to a
§10.2 quality scenario.

```
Scenario: <Name>
  Given <precondition>
  When <trigger>
  Then <observable outcome>
  And <constraint>
```

## 6. Quality attributes (SEI)

Probe each candidate system for these, expressed as **general scenarios**
(source of stimulus, stimulus, artifact, environment, response, response
measure):

| Attribute | Concern | Sample response measure |
|---|---|---|
| Availability | ready when needed | downtime, recovery time |
| Performance | timing | latency, throughput, deadline |
| Security | CIA + authN/authZ | time to stop/cover an attack |
| Modifiability | cost of change | time/effort to change |
| Interoperability | exchange info | % exchanges correctly processed |
| Testability | expose faults | effort to find a fault |
| Usability | user efficiency | task time, error rate |
| Scalability / Deployability / Portability / Monitorability / Safety | as relevant | |

For each attribute, pick **tactics** (SEI) as the response mechanism — e.g. for
availability: detect faults (monitor, heartbeat, voting), recover (retry,
rollback, degradation, reconfiguration), prevent (transaction, removal from
service). See the full tactics reference in the toolkit's `docs/sei-theory.md`.

## 7. Definition of Done

The documentation set is complete when there is no `TBD`/placeholder, every ADR
appears in §9 (ADR-0001 = base model affirmed or deviated), every module has a
documented public API in `contracts/module-boundaries.md` with no cross-module
dependency reaching outside one, every §10.2 scenario links a behavior
contract, cross-cutting mechanisms have a contract, and the traceability matrix
is complete.
