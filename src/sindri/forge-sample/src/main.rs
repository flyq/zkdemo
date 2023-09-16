use std::{env, thread, time};

mod client;

#[tokio::main]
async fn main() {
    let api_key = get_api_key();

    println!("api_key: {:?}", api_key);

    let mut client = client::ForgeClient::new(
        api_key,
        "v1".to_string(),
        "https://forge.sindri.app/api".to_string(),
    );

    // Create new circuit
    println!("1. Creating circuit...");
    client.create_circuit_id().await;
    print!("circuit_id: {:?}", client.circuit_id);

    // update the file
    client
        .upload_files("./src/sindri/forge-sample/andN.tar.gz")
        .await;

    // compile
    client.compile().await;

    // waiting
    let duration = time::Duration::from_secs(20);
    thread::sleep(duration);

    // get detail
    let res = client.get_circuit_detail().await;
    println!("res: {:?}", res);
}

fn get_api_key() -> String {
    let key = "SINDRI_API_KEY";
    let val = env::var(key).unwrap();
    val
}
