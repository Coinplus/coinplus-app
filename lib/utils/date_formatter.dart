import '../extensions/extensions.dart';

String formatDate(String dateString) {
  final dateTime = DateTime.parse(dateString);
  final formattedDate = DateFormat('dd MMM yyyy').format(dateTime);
  return formattedDate;
}

String formatDateString(String dateString) {
  final dateTime = DateTime.parse(dateString);
  final formattedDate = DateFormat('MMM d, y hh:mm a').format(dateTime);
  return formattedDate;
}

String priceChangeDateFormatter(String dateString) {
  final dateTime = DateTime.parse(dateString);
  final formattedDate =
      DateFormat("MMMM d, yyyy 'at' hh:mm:ss a").format(dateTime);
  return formattedDate;
}
