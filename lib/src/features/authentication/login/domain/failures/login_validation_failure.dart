import 'package:naviquezon/src/core/abstracts/failure_abstract.dart';

///{@template LoginValidationFailure}
/// Failure that thrown if the account is not validated yet.
///{@endtemplate}
class LoginValidationFailure extends Failure {
  ///{@macro LoginValidationFailure}
  const LoginValidationFailure({
    super.message = 'Account is not approved yet.',
  });
}
