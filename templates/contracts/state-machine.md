# <Run> state machine contract

Explicit states and transitions for one <unit of work>. Source ADRs: (list).

## 1. States

Three kinds: **phase** (linear pipeline), **condition** (orthogonal, coexists
with a phase), **terminal**.

| State | Kind | Meaning |
|---|---|---|
| | | |

## 2. Transition table

| From | To | Trigger | Notes |
|---|---|---|---|
| (start) | | | |

## 3. Checkpoint alignment

- Every transition persists <state> before the next step begins.

## 4. Invariants

- <forward-only / non-exclusive conditions / completion rules>
