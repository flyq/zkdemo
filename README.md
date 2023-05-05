# ZK Demo

```sh
cargo run --example cost-model -- -a 0,1 -a 0 -a 0,-1,1 -f 0 -g 4 11

Circuit {
    k: 11,
    max_deg: 4,
    advice_columns: 3,
    lookups: 0,
    permutations: [],
    column_queries: 7,
    point_sets: 3,
    estimator: Estimator,
}
Proof size: 1440 bytes
Verification: at least 8.341ms
```