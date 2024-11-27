import 'package:intl/intl.dart';

///{@template DateTimeExtension}
/// Extension for DateTime types.
///{@endtemplate}
extension DateTimeExtension on DateTime {
  /// Extension for formatting the date to (dd MMM yyy)
  ///
  String formatDate({String format = 'MMM dd, yyyy'}) {
    // Now, format the DateTime object to any format you need
    return DateFormat(format).format(this);
  }

  /// Extension for converting DateTime to Unix time.
  ///
  int secondsSinceEpoch() {
    return millisecondsSinceEpoch ~/ 1000;
  }

  /// Extension for converting DateTime to a time ago String.
  ///
  String timeAgo({bool numericDates = true}) {
    final date2 = DateTime.now();
    final difference = date2.difference(this);

    if ((difference.inDays / 7).floor() >= 1) {
      return numericDates ? '1 week ago' : 'Last week';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return numericDates ? '1 day ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hrs ago';
    } else if (difference.inHours >= 1) {
      return numericDates ? '1 hr ago' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} min ago';
    } else if (difference.inMinutes >= 1) {
      return numericDates ? '1 min ago' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }
}
