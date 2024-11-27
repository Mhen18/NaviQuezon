import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_validation_model.freezed.dart';
part 'registration_validation_model.g.dart';

///{@template RegistrationValidationModel}
/// Model for the owner validation for registration.
///{@endtemplate}
@freezed
class RegistrationValidationModel with _$RegistrationValidationModel {
  ///{@macro RegistrationValidationModel}
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    explicitToJson: true,
  )
  const factory RegistrationValidationModel({
    required String idFront,
    required String idBack,
    required String permitFront,
    required String permitBack,
    required String formalPicture,
  }) = _RegistrationValidationModell;

  factory RegistrationValidationModel.fromJson(Map<String, dynamic> json) =>
      _$RegistrationValidationModelFromJson(json);
}
