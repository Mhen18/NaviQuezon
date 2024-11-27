import 'package:intl/intl.dart';
import 'package:naviquezon/src/core/utils/loggers/print_logger.dart';

///{@template NumExtension}
/// Extension for num types.
///{@endtemplate}
extension NumExtension on num {
  /// Extension for converting num to String with commas
  /// with parameter if with decimal number.
  ///
  String withComma({bool withDecimal = true}) {
    var f = NumberFormat('###,###,##0.00', 'en_US');

    /// If no decimal.
    if (!withDecimal) {
      f = NumberFormat('###,###,##0', 'en_US');
    }

    try {
      final value = f.format(this);
      return value;
    } catch (e) {
      printError(e, title: 'withComma');
    }

    return toString();
  }

  /// Extension for converting num to String with Peso sign.
  ///
  String toPeso({bool withDecimal = true}) {
    final amount = withComma(withDecimal: withDecimal);

    return '₱$amount';
  }

  /// Extension for formatting the timestamp to (hh:mm a).
  ///
  String timeFromTimestamp({bool isUtc = false}) {
    return DateFormat('hh:mm a').format(toUnixTime(isUtc: isUtc));
  }

  /// Extension for converting int timestamp to DateTime.
  ///
  DateTime toUnixTime({bool isUtc = false, bool isSeconds = false}) {
    var value = toInt();

    if (isSeconds) {
      value = value * 1000;
    }

    return DateTime.fromMillisecondsSinceEpoch(
      value,
      isUtc: isUtc,
    ).toLocal();
  }
}

///{@template NullNumExtension}
/// Extension for nullable num types.
///{@endtemplate}
extension NullNumExtension on num? {
  /// Extension for getting the value or return 0.
  ///
  num get orZero => this ?? 0;
}
