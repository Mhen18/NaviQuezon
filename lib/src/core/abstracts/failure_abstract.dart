import 'package:naviquezon/src/core/utils/keys/string_keys.dart';

///{@template Failure}
/// Class that used to return default failures message
///{@endtemplate}
abstract class Failure {
  const Failure({
    this.status,
    this.title = sSomethingWentWrong,
    this.message = sUnexpectedError,
    this.data,
  });

  final int? status;
  final String title;
  final String message;
  final dynamic data;
}
