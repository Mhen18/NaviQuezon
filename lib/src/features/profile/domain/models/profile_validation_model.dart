import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_validation_model.freezed.dart';
part 'profile_validation_model.g.dart';

///{@template ProfileValidationModel}
/// Model for the validation.
///{@endtemplate}
@freezed
class ProfileValidationModel with _$ProfileValidationModel {
  ///{@macro ProfileValidationModel}
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    includeIfNull: false,
    explicitToJson: true,
  )
  const factory ProfileValidationModel({
    required String id,
    required String ownerId,
    required String idFront,
    required String idBack,
    required String permitFront,
    required String permitBack,
    required String formalPicture,
    required num createdDate,
    required num updatedDate,
  }) = _ProfileValidationModel;

  factory ProfileValidationModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileValidationModelFromJson(json);
}
