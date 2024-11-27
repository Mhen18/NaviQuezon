import 'package:naviquezon/src/core/abstracts/failure_abstract.dart';

///{@template LoginPasswordFailure}
/// Failure that thrown when password is incorrect.
///{@endtemplate}
class LoginPasswordFailure extends Failure {
  ///{@macro LoginPasswordFailure}
  const LoginPasswordFailure({
    super.message = 'Password is incorrect.',
  });
}
