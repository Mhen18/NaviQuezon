import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_model.freezed.dart';

///{@template LoginModel}
/// Model for the login.
///{@endtemplate}
@freezed
class LoginModel with _$LoginModel {
  ///{@macro LoginModel}
  const factory LoginModel({
    required String password,
    String? emailOrPhone,
  }) = _LoginModel;
}
