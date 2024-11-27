import 'package:naviquezon/src/core/abstracts/failure_abstract.dart';

///{@template ProfileNotVerifiedFailure}
/// Failure class that used if the user is still not verified.
///{@endtemplate}
class ProfileNotVerifiedFailure extends Failure {
  const ProfileNotVerifiedFailure({
    super.message = 'Your profile is not verified yet.',
  });
}
