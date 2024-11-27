import 'package:freezed_annotation/freezed_annotation.dart';

part 'establishment_like_model.freezed.dart';

part 'establishment_like_model.g.dart';

///{@template EstablishmentLikeModel}
/// Model for user's like establishment.
///{@endtemplate}
@freezed
class EstablishmentLikeModel with _$EstablishmentLikeModel {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    explicitToJson: true,
  )

  ///{@macro EstablishmentLikeModel}
  const factory EstablishmentLikeModel({
    @JsonKey(name: 'like_id') required String id,
    required String userId,
    required String establishmentId,
    required String createdDate,
    required String updatedDate,
  }) = _EstablishmentLikeModel;

  ///{@macro EstablishmentLikeModel}

  factory EstablishmentLikeModel.fromJson(Map<String, dynamic> json) =>
      _$EstablishmentLikeModelFromJson(json);
}
