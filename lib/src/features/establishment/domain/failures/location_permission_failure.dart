import 'package:naviquezon/src/core/abstracts/failure_abstract.dart';

///{@template LocationPermissionFailure}
/// Failure class that used to return location permission failures message
///{@endtemplate}
class LocationPermissionFailure extends Failure {
  const LocationPermissionFailure({
    super.title = 'Location Permission Error',
    super.message = 'Location permission is required to use this feature',
  });
}
