import 'package:naviquezon/src/core/abstracts/failure_abstract.dart';

///{@template PhoneAlreadyExistFailure}
/// Failure that thrown if the phone number is already exist.
///{@endtemplate}
class PhoneAlreadyExistFailure extends Failure {
  ///{@macro PhoneAlreadyExistFailure}
  PhoneAlreadyExistFailure({
    super.message = 'Phone number is already exist',
  });
}
