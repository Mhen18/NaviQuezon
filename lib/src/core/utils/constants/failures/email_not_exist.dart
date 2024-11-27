import 'package:naviquezon/src/core/abstracts/failure_abstract.dart';

///{@template EmailNotExistFailure}
/// Failure for email does not exist.
///{@endtemplate}
class EmailNotExistFailure extends Failure {
  ///{@macro EmailNotExistFailure}
  const EmailNotExistFailure() : super(message: 'Email does not exist.');
}
