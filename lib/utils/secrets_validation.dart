bool isValidSecret(String secret) {
  final btcSecretRegex = RegExp(r'^[\s\S]{30}$');
  return btcSecretRegex.hasMatch(secret);
}
