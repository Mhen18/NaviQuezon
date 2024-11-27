import 'package:naviquezon/src/core/abstracts/failure_abstract.dart';

///{@template LoginValidationRejectFailure}
/// Failure that thrown if the account approval has been rejected.
///{@endtemplate}
class LoginValidationRejectFailure extends Failure {
  ///{@macro LoginValidationFailure}
  const LoginValidationRejectFailure({
    super.message = 'Account approval has been rejected.',
  });
}
