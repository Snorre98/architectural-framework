# Base architectural model: compact modules + public APIs

The base architectural model for every system documented under this framework.
It is **required by default**: a system is assumed to follow it unless a
deviation is recorded by ADR (see "Deviation" below).

## Definition

A system is a set of **compact modules**. Each module is **sealed by default**:
its features are private and cannot be used by other modules. To expose
functionality, a module must **define a public API** — a narrow, stable,
deliberately specified set of operations that encapsulates the module's
business logic and hides its domain + data layers (the *service layer*, Fowler,
PoEAA). The public API is the only doorway in; anything not in it is
unreachable from outside.

The public API is the module's **interface**; everything it hides is its
**depth**. A module with a small public API hiding a large implementation is a
*deep module* (Ousterhout) — the model treats depth as the goal.

## Rules (normative)

- **R1 — Sealed by default.** Module features are private; nothing is
  cross-module usable unless it is listed in the module's public API.
- **R2 — Explicit public API.** A public API is a deliberate definition, never
  incidental exposure. It is narrow and stable: it changes rarely relative to
  the internals it hides.
- **R3 — Public-API-only dependencies.** Cross-module dependencies may target
  only another module's public API — never its internals (types, tables, state,
  files).
- **R4 — Inward, acyclic.** Dependency direction is inward and acyclic; leaf
  modules (no intra-system dependencies) hold pure/deterministic logic.
- **R5 — Test at the boundary.** Modules are exercised through their public
  API, not their internals.
- **R6 — Contracted.** Every public API is specified as a precise contract
  (see `contracts/module-boundaries.md` and per-module `contracts/interface.md`).

## Anti-patterns

- **Implicit cross-module access** — using a neighbor's internals without a
  defined public API.
- **Leaky exposure** — domain types, errors, or state escaping the public API.
- **Shallow module** — a public API nearly as complex as the implementation it
  hides.
- **God module** — many unrelated concerns behind one public API.

## Deviation

Required-by-default, not absolute. A system that does not follow the base model
must record the deviation in an ADR stating the reason and the alternative
adopted. Without such an ADR, the base model is assumed to hold.

## Sources

- Fowler, *Patterns of Enterprise Application Architecture* — Service Layer.
- Ousterhout, *A Philosophy of Software Design* — deep vs. shallow modules.
- Compatible with Evans (DDD) and hexagonal / ports-and-adapters as the
  boundary-discipline the public API embodies.
