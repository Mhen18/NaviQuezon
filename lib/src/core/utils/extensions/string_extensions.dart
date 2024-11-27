///{@template StringExtensions}
/// Extensions for the [String] class
///{@endtemplate}
extension StringExtensions on String {
  /// Capitalize the first letter of the string
  ///
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
