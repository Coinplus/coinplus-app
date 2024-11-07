bool isValidSecret(String secret) {
  final btcSecretRegex = RegExp(r'^[\s\S]{30}$');
  return btcSecretRegex.hasMatch(secret);
}

bool isValidSecret29(String secret) {
  final btcSecretRegex = RegExp(r'^[\s\S]{29}$');
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
