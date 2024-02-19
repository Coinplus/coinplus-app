import '../extensions/extensions.dart';

String formatDate(String dateString) {
  final dateTime = DateTime.parse(dateString);
  final formattedDate = DateFormat('dd MMM yyyy').format(dateTime);
  return formattedDate;
}
