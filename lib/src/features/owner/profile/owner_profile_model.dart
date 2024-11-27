import 'package:freezed_annotation/freezed_annotation.dart';

part 'owner_profile_model.freezed.dart';

part 'owner_profile_model.g.dart';

///{@template OwnerProfileModel}
/// Model for the profile of the owner.
///{@endtemplate}
@freezed
class OwnerProfileModel with _$OwnerProfileModel {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    explicitToJson: true,
  )

  ///{@macro OwnerProfileModel}
  const factory OwnerProfileModel({
    required String email,
    required String password,
    @JsonKey(name: 'number') required String phoneNumber,
    required String firstName,
    required String lastName,
    required num age,
    required String gender,
    required String country,
    required String region,
    required String province,
    required String municipality,
    required bool isApproved,
    required String createdDate,
    required String updatedDate,
  }) = _OwnerProfileModel;

  factory OwnerProfileModel.fromJson(Map<String, dynamic> json) =>
      _$OwnerProfileModelFromJson(json);
}
