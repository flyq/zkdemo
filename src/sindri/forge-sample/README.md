# Forge Sample

```sh
cd src/sindri/forge-sample/

tar -zcvf andN.tar.gz andN/


```

error info:

```sh
cargo run --package forge-sample --bin forge-sample --all-features 

1. Creating circuit...
"https://forge.sindri.app/api/v1/circuit/create?api_key=7tUYWrc0Ob0Jpqro8p4VSXo4SnNyhVXV"
Response { url: Url { scheme: "https", cannot_be_a_base: false, username: "", password: None, host: Some(Domain("forge.sindri.app")), port: None, path: "/api/v1/circuit/create", query: Some("api_key=7tUYWrc0Ob0Jpqro8p4VSXo4SnNyhVXV"), fragment: None }, status: 401, headers: {"access-control-allow-origin": "*", "content-length": "26", "content-type": "application/json; charset=utf-8", "date": "Tue, 12 Sep 2023 08:52:05 GMT", "referrer-policy": "same-origin", "server": "gunicorn", "vary": "Cookie,Origin", "x-content-type-options": "nosniff", "x-frame-options": "SAMEORIGIN"} }
```