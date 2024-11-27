import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naviquezon/src/features/authentication/registration/domain/models/registration_validation_model.dart';

part 'registration_model.freezed.dart';
part 'registration_model.g.dart';

///{@template RegistrationModel}
/// Model for registration.
///{@endtemplate}
@freezed
class RegistrationModel with _$RegistrationModel {
  ///{@macro RegistrationModel}
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    explicitToJson: true,
  )
  const factory RegistrationModel({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
    required int age,
    required String gender,
    required String country,
    required String region,
    required String province,
    required String municipality,
    required String role,
    @JsonKey(includeToJson: false) RegistrationValidationModel? validation,
  }) = _RegistrationModel;

  factory RegistrationModel.fromJson(Map<String, dynamic> json) =>
      _$RegistrationModelFromJson(json);
}
