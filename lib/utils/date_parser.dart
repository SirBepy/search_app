String parseDate(String date) {
  final dateTime = DateTime.parse(date);
  return '${dateTime.day}.${dateTime.month}.${dateTime.year}';
}
