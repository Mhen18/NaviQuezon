///{@template AppRoleEnums}
/// Enum to define the roles of the user.
///{@endtemplate}
enum AppRoleEnum {
  superAdmin('super_admin'),
  admin('admin'),
  owner('owner'),
  user('user');

  ///{@macro AppRoleEnums}
  const AppRoleEnum(this.value);

  final String value;

  /// Method to convert the enum to a string.
  static AppRoleEnum fromString(String? value) {
    return AppRoleEnum.values.firstWhere(
      (e) => e.value.toLowerCase() == value?.toLowerCase(),
      orElse: () => AppRoleEnum.user,
    );
  }
}
