bool isValidSecret(String secret) {
  final btcSecretRegex = RegExp(r'^[\s\S]{30}$');
  return btcSecretRegex.hasMatch(secret);
}

bool isValidEthSecretOne(String secret) {
  final btcSecretRegex = RegExp(r'^[\s\S]{28}$');
  return btcSecretRegex.hasMatch(secret);
}

bool isValidEthSecretTwo(String secret) {
  final btcSecretRegex = RegExp(r'^[\s\S]{14}$');
  return btcSecretRegex.hasMatch(secret);
}
