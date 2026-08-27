# <Interface> contract

The single seam between <consumer> and <provider>. Source ADRs: (list).

## 1. Interface (conceptual signatures)

```go
type <Interface> interface {
    // <method> — <what it does>.
    <Method>(ctx context.Context, req <Req>) (<Resp>, error)
}
```

## 2. Request / response shapes

| Field | Type | Notes |
|---|---|---|
| | | |

## 3. Semantics

- <streaming / ordering / idempotency / cancellation semantics>

## 4. Error codes

| Code | Meaning |
|---|---|
| | |

## 5. Invariants

- <invariants the two sides may rely on>
