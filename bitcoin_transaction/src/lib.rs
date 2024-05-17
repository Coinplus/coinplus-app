use grpcio::{Empty, Server};
use bitcoin::{Transaction, ECKeyPair, Amount};
use bitcoin::consensus::encode::serialize;
use prost::Message;

use crate::{TransactionRequest, TransactionResponse};

struct BitcoinService {
    private_key: ECKeyPair,
}

impl BitcoinService {
    fn new(private_key: &[u8]) -> Result<Self, bitcoin::Error> {
        Ok(BitcoinService {
            private_key: ECKeyPair::from_private_key(private_key)?,
        })
    }
}

impl grpc_bitcoin::Bitcoin for BitcoinService {
    fn create_transaction(
        &mut self,
        ctx: grpc::RpcContext<'_>,
        req: TransactionRequest,
        mut resp: grpc::UnarySink<TransactionResponse>,
    ) -> grpc::Result<()> {
        let from_address = bitcoin::Address::decode(&req.from_address)?;
        let to_address = bitcoin::Address::decode(&req.to_address)?;
        let amount = Amount::new(req.amount);

        let tx = Transaction::new(
            None,
            vec![
                Transaction::OutPoint {
                    txid: bitcoin::Txid::default(),
                    vout: 0,
                },
            ],
            vec![
                Transaction::Output {
                    value: amount,
                    script_pubkey: to_address.script_pubkey(),
                },
            ],
            bitcoin::Locktime::new(0),
        )?;

        let mut signed_tx = tx.clone();
        self.private_key.sign_input(&mut signed_tx, from_address)?;

        let raw_tx = serialize(&signed_tx)?;
        resp.finished(TransactionResponse { raw_transaction: raw_tx })?;

        Ok(())
    }
}

fn main() {
    let env = dotenv::var("PRIVATE_KEY").expect("PRIVATE_KEY environment variable not set");
    let private_key = hex::decode(&env).unwrap();
    let service = BitcoinService::new(&private_key)?;

    let mut server = grpc::Server::builder()
        .add_service(BitcoinServiceServer::new(service))
        .bind("localhost", 50051)
        .build()
        .unwrap();
    server.start();
    println!("Server listening on port 50051");
    loop {
        let _ = server.check_shutdown();
    }
}

#[derive(Message)]
pub struct TransactionRequest {
    pub from_address: String,
    pub to_address: String,
    pub amount: u64,
}

#[derive(Message)]
pub struct TransactionResponse {
    pub raw_transaction: String,
}
