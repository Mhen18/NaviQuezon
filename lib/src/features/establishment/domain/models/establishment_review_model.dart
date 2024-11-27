import 'package:freezed_annotation/freezed_annotation.dart';

part 'establishment_review_model.freezed.dart';

part 'establishment_review_model.g.dart';

///{@template EstablishmentReviewModel}
/// Model for user's review to the establishment.
///{@endtemplate}
@freezed
class EstablishmentReviewModel with _$EstablishmentReviewModel {
  ///{@macro EstablishmentReviewModel}
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    includeIfNull: false,
    explicitToJson: true,
  )
  const factory EstablishmentReviewModel({
    required String userId,
    required num rate,
    required num createdDate,
    required num updatedDate,
    @JsonKey(defaultValue: 'Anonymous') String? userName,
    String? comment,
    num? room,
    num? cleanliness,
    num? breakfast,
    num? service,
    num? bathroom,
  }) = _EstablishmentReviewModel;

  factory EstablishmentReviewModel.fromJson(Map<String, dynamic> json) =>
      _$EstablishmentReviewModelFromJson(json);
}
