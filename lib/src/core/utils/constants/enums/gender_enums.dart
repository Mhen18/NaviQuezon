///{@template GenderEnums}
/// Enum to define the gender of the user.
///{@endtemplate}
enum GenderEnums {
  male('Male'),
  female('Female'),
  none('Prefer not to say');

  ///{@macro GenderEnums}
  const GenderEnums(this.value);

  final String value;

  /// Method to convert the enum to a string.
  ///
  static GenderEnums fromString(String? value) {
    if (value == null) return GenderEnums.none;

    return GenderEnums.values.firstWhere(
      (e) => e.value == value.toLowerCase(),
      orElse: () => GenderEnums.none,
    );
  }
}
