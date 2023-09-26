bool isValidBTCAddress(String address) {
  final btcAddressRegex = RegExp(r'^(bc1|[13])[a-zA-HJ-NP-Z0-9]{33,39}$');
  return btcAddressRegex.hasMatch(address);
}