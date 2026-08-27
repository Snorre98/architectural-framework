# Standards mapping

Canonical mapping of the documentation framework's arc42 sections to the SEI
viewtypes ("Views & Beyond") and ISO/IEC/IEEE 42010 concepts. Each system's
`architecture.md` carries this mapping in its appendices; this file is the
single source the skill emits from.

## Base model → SEI

The required base model ("compact modules + public APIs", `base-model.md`)
maps to the SEI **module** viewtype in the **decomposition** + **layered**
styles: modules are code/data units, the public API is each module's interface,
and the inward-acyclic dependency rule is the layering constraint. Its runtime
manifestation (service calls across public APIs) is the **component-and-connector**
viewtype, with the public API as the connector.

## ISO/IEC/IEEE 42010 — architecture description

| 42010 concept | Where in the framework |
|---|---|
| Concerns | §1.2 quality goals, §10.1 quality tree |
| Viewpoints | Appendix B (declared below) |
| Views | §5 (structure), §6 (runtime), §7 (deployment) |
| Architecture decisions | §9 + ADR log |
| Rationale | ADR Context/Consequences sections |
| Correspondences | Appendix B mapping table |

## SEI viewtypes ("Views & Beyond")

| SEI viewtype | Style | Manifestation |
|---|---|---|
| **Module** | layered, decomposition | §5.2 components; packages/modules; agent/component hierarchy |
| **Component-and-connector** | communicating-processes, shared-data | §6: components as runtime elements; connectors = queues, shared data stores, message buses, network |
| **Allocation** | deployment | §7: software-to-hardware/environment mapping |

Per Views & Beyond's seven rules: document the views that serve the
stakeholders' concerns (§1.3), keep documentation artifact-aligned with code
(docs-as-code, ADR process rule), and record rationale for every view choice.

## Appendix A (emit in every `architecture.md`)

| 42010 concept | Where |
|---|---|
| Concerns | §1.2 quality goals, §10.1 tree |
| Viewpoints | Appendix B (declared below) |
| Views | §5 (structure), §6 (runtime), §7 (deployment) |
| Architecture decisions | §9 + ADR log |
| Rationale | ADR Context/Consequences sections |
| Correspondences | Appendix B mapping table |

| SEI viewtype | Style | This system |
|---|---|---|
| **Module** | layered, decomposition | §5.2 components; packages; hierarchy |
| **Component-and-connector** | communicating-processes, shared-data | §6: runtime elements + connectors |
| **Allocation** | deployment | §7: environment/hardware mapping |

## Appendix B (emit in every `architecture.md`)

| Viewpoint | Audience | Concern | Section |
|---|---|---|---|
| Context | everyone | scope, interfaces | §3 |
| Container | architects | technology choices, boundaries | §5.1 |
| Component | developers | responsibilities, seams | §5.2 |
| Runtime | developers/ops | behavior, failure, degradation | §6 |
| Deployment | platform engineers | environment, constraints | §7 |
| Decision | all future maintainers | why | §9, ADR log |
| Behavior contracts | testers/agents | executable rules | behaviors/ |
