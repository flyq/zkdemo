# andN

```sh
cd andn/

circom andn.circom --r1cs --wasm --sym

node andn_js/generate_witness.js andn_js/andn.wasm input.json witness.wtns

snarkjs powersoftau new bn128 12 pot12_0000.ptau -v
 
snarkjs powersoftau contribute pot12_0000.ptau pot12_0001.ptau --name="First contribution" -v

snarkjs powersoftau prepare phase2 pot12_0001.ptau pot12_final.ptau -v

snarkjs groth16 setup ./andn.r1cs pot12_final.ptau andn_0000.zkey

snarkjs zkey contribute andn_0000.zkey andn_0001.zkey --name="1st Contributor Name" -v

snarkjs zkey export verificationkey andn_0001.zkey verification_key.json


snarkjs groth16 prove andn_0001.zkey witness.wtns proof.json public.json

snarkjs groth16 verify verification_key.json public.json proof.json
[INFO]  snarkJS: OK!

snarkjs zkey export solidityverifier andn_0001.zkey verifier.sol

snarkjs generatecall
["0x23e3b184607ab9fa02e2ab3e94dbeef2b9aaad628a6faefad6be7820df2a70a0", "0x203fcb07fb46784b30e19f1c0917f573df369fd388865d359a8a1805678f3b54"],[["0x107f525dda96b51cd3af2af5fd58c5972a47a6de6729b4362e700a452991b5c2", "0x0853fe6db205f0859167336623dfd931bcf1e54e2f78a473039d0f628aab1b16"],["0x0a7ef9f5263f24491ec6f91bd299aee18e66278d6154bc9e89d8ad0fcb510992", "0x10c0f6f09f6d7555a84007130e4b9bed9b6f0003bcf1de8e34c9363921091481"]],["0x23fb6fb90abe1023bb419efe2d762ec9952cbe7f09c9de9ba57eae4ca8054129", "0x207c71f8e794be5cf6701d5ddb6d63ced06f43630bec7de9e4921446ce5d15a8"],["0x0000000000000000000000000000000000000000000000000000000000000001"]
```