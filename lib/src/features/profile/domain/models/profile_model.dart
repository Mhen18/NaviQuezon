import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_itinerary_model.dart';
import 'package:naviquezon/src/features/profile/domain/models/profile_validation_model.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

///{@template ProfileModel}
/// Model for the profile.
///{@endtemplate}
@freezed
class ProfileModel with _$ProfileModel {
  ///{@macro ProfileModel}
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    includeIfNull: false,
    explicitToJson: true,
  )
  const factory ProfileModel({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required num createdDate,
    required num updatedDate,
    @JsonKey(defaultValue: 'user') required String role,
    String? position,
    int? age,
    String? gender,
    String? country,
    String? region,
    String? province,
    String? municipality,
    String? image,
    bool? isApproved,
    @JsonKey(includeFromJson: false) ProfileValidationModel? validation,
    @JsonKey(includeFromJson: false) List<String>? estaLike,
    @JsonKey(includeFromJson: false, includeToJson: false)
    List<EstablishmentItineraryModel>? estaItinerary,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}
