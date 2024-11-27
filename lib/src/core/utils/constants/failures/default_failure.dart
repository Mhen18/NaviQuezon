import 'package:naviquezon/src/core/abstracts/failure_abstract.dart';
import 'package:naviquezon/src/core/utils/keys/string_keys.dart';

///{@template DefaultFailure}
/// Failure class that used to return default failures message
///{@endtemplate}
class DefaultFailure extends Failure {
  const DefaultFailure({
    super.status,
    String? message,
    super.data,
  }) : super(message: message ?? sUnexpectedError);
}
