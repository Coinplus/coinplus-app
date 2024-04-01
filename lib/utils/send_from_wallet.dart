// import 'dart:developer';
//
// import 'package:bip39/bip39.dart' as bip39;
// import 'package:bitcoin_flutter/bitcoin_flutter.dart';
//
// Future<void> createBitcoinTransaction() async {
//   // Define the network type (mainnet or testnet)
//   final network = testnet;
//
//   // Replace with your private key and legacy address
//   const privateKey = 'your_private_key';
//   const legacyAddress = '1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa';
//
//   // Create a wallet from the private key
//   final wallet = Wallet.fromWIF(privateKey, network);
//
//   // Get the unspent transaction outputs (UTXOs) for the legacy address
//   final utxos = await getUTXOs(legacyAddress);
//
//   // Create a transaction builder
//   final builder = TransactionBuilder(network: network);
//
//   // Add the UTXOs as inputs to the transaction
//   for (final utxo in utxos) {
//     builder.addInput(utxo['txid'], utxo['vout']);
//   }
//
//   // Specify the recipient address and amount to send
//   const recipientAddress = 'recipient_legacy_address';
//   const amountToSend = 100000; // Amount in satoshis (e.g., 0.001 BTC)
//
//   ECPair keyPair = ECPair.fromWIF(sign['keyPair'], network: network);
//
//   builder
//     ..addOutput(wallet.address, amountToSend)
//     ..maximumFeeRate = 1
//   ..sign(vin: 1000, keyPair: wallet.);
//
//   // Build the transaction
//   final transaction = builder.build();
//
//   // Sign the transaction
//   for (var i = 0; i < utxos.length; i++) {
//     final utxo = utxos[i];
//     transaction.signInput(i, wallet);
//   }
//
//   // Serialize the transaction
//   final rawTx = transaction.serialize();
//
//   // Broadcast the transaction to the Bitcoin network
//   // (This part depends on the Bitcoin network infrastructure you're using)
// }
//
// Future<List<Map<String, dynamic>>> getUTXOs(String address) async {
//   // This is a placeholder function for fetching UTXOs from a blockchain explorer
//   // You should replace this with actual code to fetch UTXOs for the given address
//   return [];
// }
