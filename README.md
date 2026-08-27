# architect-toolkit

A reusable toolkit for **defining proper architectural systems before developing
them** — the methods, strategies, templates, and the interactive `define-architecture`
agent that produces the docs for you.

Everything is docs-as-code: diagrams and decisions version with the repo, no
tooling gate, local-first. The methodology generalizes the documentation
framework first worked out in the
[deep-research](https://github.com) project (arc42 + C4 + ADR + Gherkin +
contracts + traceability), extended with the SEI "Documenting Software
Architectures" theory (quality attributes, scenarios, tactics, patterns).

## What's here

| Path | Purpose |
|---|---|
| `docs/framework.md` | The single, shared documentation framework (the layered stack + process rule) |
| `docs/base-model.md` | The required base architectural model: compact modules + public APIs |
| `docs/standards-mapping.md` | Maps every arc42 section to SEI viewtypes and ISO/IEC/IEEE 42010 |
| `docs/sei-theory.md` | Quality attributes, general scenarios, tactics, patterns, views (SEI) |
| `templates/` | Blank, reusable skeletons: arc42, ADR, Gherkin, traceability, contracts |
| `skills/define-architecture/` | The interactive agent (opencode skill) that drives the whole process |

## The base model (required)

Every system is a set of **compact modules**, each **sealed by default**: its
features are private, and the only way another module can use them is through a
deliberately defined **public API** (a narrow, stable set of operations — the
Fowler *service layer*). Dependencies point inward and are acyclic; leaf
modules hold pure logic. This is required by default — deviating requires an
ADR. See `docs/base-model.md`.

## The method in one page

Each system documents its architecture with a layered stack, each layer
answering one question, under `docs/<system>/`:

0. **base model** — compact modules + public APIs (required by default; see above)
1. `architecture.md` — **arc42** skeleton (all 12 sections) + **C4** as Mermaid
2. `adr/` — **Nygard-format ADRs** (immutable decision records)
3. `behaviors/*.feature` — **Gherkin** executable behavior contracts
4. `contracts/` — precise data/interface/state/failure/concurrency contracts,
   including `module-boundaries.md` (every module's public API)
5. `traceability.md` — matrix mapping ADRs → arc42 → behaviors → contracts

**Process rule:** every architectural change = new ADR → update the arc42
sections it touches. Diagrams are Mermaid until a Structurizr DSL migration
earns its keep.

See `docs/framework.md` for the full statement.

## Using the agent

The `define-architecture` skill is an interactive agent installed globally into
opencode (see below). In any project, say:

> define the architecture for a <thing you're about to build>

The agent interviews you (stakeholders, quality goals, constraints, decisions),
then scaffolds and fills `docs/<system>/` in the current repo, following the
process rule above.

### Installing the skill

The skill source lives in `skills/define-architecture/`. It is surfaced to
opencode by symlinking it into the skills directory managed by your
[OpencodeConfig](https://github.com) repo, then running its `install.sh`:

```bash
ln -sfn /Users/snorresaether/Documents/Liv/Projects/architect-toolkit/skills/define-architecture \
  /Users/snorresaether/Documents/Liv/Projects/OpencodeConfig/MattPSkills/opencode-fork/define-architecture
/Users/snorresaether/Documents/Liv/Projects/OpencodeConfig/install.sh
```

Restart opencode afterwards.

## Principles

- **Local LLM first** — no cloud dependency to produce the docs.
- **Reproducible format and directory layout** — one convention across every project.
- **Architecture before code** — decisions are cheap to change as documents, expensive as code.
- **Sealed modules** — modules expose only deliberately defined public APIs; everything else is private.
- **Traceability** — every decision, section, and behavior contract is cross-linked.
