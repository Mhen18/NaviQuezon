///{@template TouristType}
/// Enum for the type of tourist.
///{@endtemplate}
enum TouristType {
  local('Local'),
  foreign('Foreign');

  ///{@macro TouristType}
  const TouristType(this.value);

  final String value;
}
