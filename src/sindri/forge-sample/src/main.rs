use std::env;

use reqwest::{header::HeaderMap, Client, Error, Response};

#[tokio::main]
async fn main() {
    let mut headers_json = HeaderMap::new();
    headers_json.insert("Accept", "application/json".parse().unwrap());

    let mut headers_multipart = HeaderMap::new();
    headers_multipart.insert("Accept", "multipart/form-data".parse().unwrap());

    let mut headers_urlencode = HeaderMap::new();
    headers_urlencode.insert("Accept", "application/json".parse().unwrap());
    headers_urlencode.insert(
        "Content-Type",
        "application/x-www-form-urlencoded".parse().unwrap(),
    );

    let create_body =
        r#"{"circuit_name": "multiplier_example", "circuit_type": "Circom C Groth16 bn254"}"#;

    let api_key = get_api_key();

    // Create new circuit
    println!("1. Creating circuit...");
    let response = post_sindri(api_key, "/circuit/create", headers_json, create_body)
        .await
        .unwrap();
    println!("{:?}", response);
}

async fn post_sindri(
    key: String,
    sub_path: &str,
    headers: HeaderMap,
    body: &str,
) -> Result<Response, Error> {
    let mut url = "https://forge.sindri.app/api/v1".to_string();
    url.push_str(sub_path);
    url.push_str(&format!("?api_key={}", key));

    println!("{:?}", url);

    let client = Client::new();
    let res = client
        .post(url)
        .headers(headers)
        .body(body.to_owned())
        .send()
        .await;
    res
}

fn get_api_key() -> String {
    let key = "SINDRI_API_KEY";
    let val = env::var(key).unwrap();
    val
}
