# Failure semantics contract

How the system handles <failure class>: retry policy + backoff, degrade rules,
and error surfacing to the caller. Source ADRs: (list).

## 1. Retry policy + backoff

| Failure class | Retries | Backoff | Never retried |
|---|---|---|---|
| | | | |

## 2. <Failure class> failure

- <what happens per failure class; source-level vs. run-level degradation>

## 3. Degrade-to-partial-<result>

- <when a partial result is still acceptable, and how it is labeled>

## 4. Error surfacing to the caller

| Outcome | Caller-visible result |
|---|---|
| | |

## 5. Invariants

- <no failure aborts the unit unless unrecoverable; retries bounded; all failures recorded>
