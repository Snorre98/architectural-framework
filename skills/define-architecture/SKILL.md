---
name: define-architecture
description: Define a software system's architecture before building it, producing a complete docs-as-code set (arc42 + C4, Nygard ADRs, Gherkin behavior contracts, precise contracts, traceability matrix) through an interactive interview, with compact modules exposing only defined public APIs as the required base model. Use when user wants to define, design, or document the architecture of a new system, service, library, or subsystem — or mentions arc42, ADR, architecture definition, modules, public API, service layer, "architect this", or "design before coding".
---

# Define Architecture

Produce a defensible architecture for a system *before* it is built, as a
docs-as-code set under `docs/<system>/`. Follow the documentation framework in
[REFERENCE.md](REFERENCE.md). You may skip steps you consider unnecessary.

## Workflow

1. **Ask** for a long, detailed description of the system to be built and any
   ideas for its solution.

2. **Explore** the current repo (if present) to ground the system in what
   already exists and avoid contradicting it.

3. **Interview relentlessly** until shared understanding. Walk each branch of
   the decision tree, resolving dependencies one at a time. Cover, at minimum:
   - Stakeholders and their expectations
   - Top-5 quality goals, each as a measurable Gherkin-style scenario
   - Constraints (platform, scale, tech, non-negotiable)
   - **Modules and their public APIs** — for each module: what concern does it
     own, what is its public API (the deliberately defined operations others may
     call), and what does it hide? Everything not in a public API is private.
   - The first architectural decisions (one ADR each) and their alternatives
   - Quality-attribute scenarios (probe with the SEI tactics reference)

4. **Determine `<system>`** (short kebab-case name). Scaffold from the bundled
   templates in [templates/](templates/):

   ```
   docs/<system>/
   ├── architecture.md      # arc42 (12 sections) + Appendices A/B, C4 as Mermaid
   ├── adr/                 # Nygard ADRs, numbered 0001…
   ├── behaviors/           # *.feature (Gherkin)
   ├── contracts/           # module-boundaries + data-model / interface / state-machine / failure-semantics / concurrency-topology
   └── traceability.md      # ADR → arc42 → behavior → contract matrix
   ```

   Write **ADR-0001 = base architectural model**: either affirm the base model
   (compact modules + public APIs) or record a deviation with its rationale.
   Every later module ADR references the boundary it defines.

5. **Fill each section**, working top-to-bottom and revisiting earlier sections
   as decisions land. Write one ADR per decision. Give each behavior scenario a
   source ADR. Give each cross-cutting mechanism a precise contract. Fill
   `contracts/module-boundaries.md` with every module, its public API, and the
   (acyclic, public-API-only) dependency graph.

6. **Enforce the process rule:** every architectural change = new ADR → update
   the arc42 sections it touches. ADRs are immutable once accepted; supersede,
   never edit.

7. **Verify against the Definition of Done** (architecture.md §10.3):
   no `TBD`/placeholder remains, every ADR appears in §9, every module has a
   documented public API in `contracts/module-boundaries.md` and no
   cross-module dependency reaches outside one, every §10.2 scenario links a
   behavior contract, and the traceability matrix is complete.

## Templates

Bundled skeletons live in [templates/](templates/). The framework, ADR format,
arc42 section guide, and SEI quality-attribute/tactics reference are in
[REFERENCE.md](REFERENCE.md).
