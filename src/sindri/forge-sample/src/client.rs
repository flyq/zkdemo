use std::fs::File;
use std::io::Read;

use reqwest::{header::HeaderMap, Client, Response};
use serde::Deserialize;
use serde::Serialize;

pub struct ForgeClient {
    api_key: String,
    api_version: String,
    base_url: String,
    pub circuit_id: Option<String>,
    pub proof_id: Option<String>,
}

#[derive(Debug, Clone, Deserialize)]
pub struct ForgeResponse {
    circuit_id: String,
}

impl ForgeClient {
    pub fn new(api_key: String, api_version: String, base_url: String) -> Self {
        Self {
            api_key,
            api_version,
            base_url,
            circuit_id: None,
            proof_id: None,
        }
    }

    pub async fn create_circuit_id(&mut self) {
        let mut url = self.base_url.clone();
        url.push_str(&format!(
            "/{}/{}?api_key={}",
            self.api_version, "circuit/create", self.api_key
        ));

        let form = [
            ("circuit_name", "add_N"),
            ("circuit_type", "Circom C Groth16 bn254"),
        ];

        let res = post(url, headers_json(), &form).await;
        assert_eq!(res.status().as_u16(), 201u16, "Expected status code 201");

        let forge_res = res.json::<ForgeResponse>().await.unwrap();
        self.circuit_id = Some(forge_res.circuit_id)
    }

    pub async fn upload_files(&self, file_path: &str) {
        let circuit_id = self.circuit_id.clone().unwrap();

        let mut url = self.base_url.clone();
        url.push_str(&format!(
            "/{}/{}/{}/{}?api_key={}",
            self.api_version, "circuit", circuit_id, "uploadfiles", self.api_key
        ));

        let mut file = File::open(file_path).unwrap();
        let mut contents = String::new();
        file.read_to_string(&mut contents).unwrap();

        let upload = ["files", &contents];

        let res = post(url, headers_multipart(), &upload).await;

        assert_eq!(res.status().as_u16(), 201u16, "Expected status code 201");
    }

    pub async fn compile(&self) {
        let circuit_id = self.circuit_id.clone().unwrap();

        let mut url = self.base_url.clone();
        url.push_str(&format!(
            "/{}/{}/{}/{}?api_key={}",
            self.api_version, "circuit", circuit_id, "compile", self.api_key
        ));

        let res = post(url, headers_json(), &()).await;
        assert_eq!(res.status().as_u16(), 201u16, "Expected status code 201");
    }

    pub async fn get_circuit_detail(&self) -> Response {
        let circuit_id = self.circuit_id.clone().unwrap();

        let mut url = self.base_url.clone();
        url.push_str(&format!(
            "/{}/{}/{}/{}?api_key={}",
            self.api_version, "circuit", circuit_id, "detail", self.api_key
        ));

        let form = [("include_verification_key", "False")];

        let res = get(url, headers_json(), &form).await;
        assert_eq!(res.status().as_u16(), 200u16, "Expected status code 200");
        res
    }

    // pub async fn prove()
}

fn headers_json() -> HeaderMap {
    let mut headers_json = HeaderMap::new();
    headers_json.insert("Accept", "application/json".parse().unwrap());
    headers_json
}

fn headers_multipart() -> HeaderMap {
    let mut headers_multipart = HeaderMap::new();
    headers_multipart.insert("Accept", "multipart/form-data".parse().unwrap());
    headers_multipart
}

fn headers_urlencode() -> HeaderMap {
    let mut headers_urlencode = HeaderMap::new();
    headers_urlencode.insert("Accept", "application/json".parse().unwrap());
    headers_urlencode.insert(
        "Content-Type",
        "application/x-www-form-urlencoded".parse().unwrap(),
    );
    headers_urlencode
}

async fn post<T: Serialize + ?Sized>(url: String, headers: HeaderMap, form: &T) -> Response {
    let client = Client::new();
    client
        .post(url)
        .headers(headers)
        .form(form)
        .send()
        .await
        .unwrap()
}

async fn get<T: Serialize + ?Sized>(url: String, headers: HeaderMap, form: &T) -> Response {
    let client = Client::new();
    client
        .get(url)
        .headers(headers)
        .form(form)
        .send()
        .await
        .unwrap()
}
