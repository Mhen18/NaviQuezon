import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_entity.freezed.dart';

///{@template ForgotPasswordEntity}
/// Entity for forgot password.
///{@endtemplate}
@freezed
class ForgotPasswordEntity with _$ForgotPasswordEntity {
  ///{@macro ForgotPasswordEntity}
  const factory ForgotPasswordEntity({
    required String email,
    required String otp,
    required DateTime date,
  }) = _ForgotPasswordEntity;
}
