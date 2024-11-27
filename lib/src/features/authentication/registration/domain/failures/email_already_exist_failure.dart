import 'package:naviquezon/src/core/abstracts/failure_abstract.dart';

///{@template EmailAlreadyExistFailure}
/// Failure that thrown if the email is already exist.
///{@endtemplate}
class EmailAlreadyExistFailure extends Failure {
  ///{@macro EmailAlreadyExistFailure}
  EmailAlreadyExistFailure({
    super.message = 'Email is already exist',
  });
}
