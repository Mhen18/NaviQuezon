import 'package:naviquezon/src/core/abstracts/failure_abstract.dart';

///{@template LoginFailure}
/// Failure that thrown when login account is not exist.
///{@endtemplate}
class LoginFailure extends Failure {
  const LoginFailure({
    super.message = 'Login account is not exist.',
  });
}
