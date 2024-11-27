import 'package:intl/intl.dart';

///{@template NumExtension}
/// Extension for int types.
///{@endtemplate}
extension IntExtension on int {
  /// Extension for formatting the timestamp to (hh:mm a).
  ///
  String timeFromTimestamp({bool isUtc = false}) {
    return DateFormat('hh:mm a').format(toUnixTime(isUtc: isUtc));
  }

  /// Extension for converting int timestamp to DateTime.
  ///
  DateTime toUnixTime({bool isUtc = false}) {
    return DateTime.fromMillisecondsSinceEpoch(
      this * Duration.millisecondsPerSecond,
      isUtc: isUtc,
    );
  }
}


///{@template NullIntExtension}
/// Extension for nullable int types.
///{@endtemplate}
extension NullIntExtension on int? {
  /// Extension for getting the value or return 0.
  ///
  num get orZero => this ?? 0;
}
