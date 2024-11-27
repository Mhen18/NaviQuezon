import 'package:freezed_annotation/freezed_annotation.dart';

part 'establishment_review_add_model.freezed.dart';

part 'establishment_review_add_model.g.dart';

///{@template EstablishmentReviewAddModel}
/// Model for user's review to the establishment.
///{@endtemplate}
@freezed
class EstablishmentReviewAddModel with _$EstablishmentReviewAddModel {
  ///{@macro EstablishmentReviewAddModel}
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    includeIfNull: false,
    explicitToJson: true,
  )
  const factory EstablishmentReviewAddModel({
    required num rate,
    String? userId,
    String? comment,
    num? room,
    num? cleanliness,
    num? breakfast,
    num? service,
    num? bathroom,
    Map<String, String>? createdDate,
    Map<String, String>? updatedDate,
  }) = _EstablishmentReviewAddModel;

  factory EstablishmentReviewAddModel.fromJson(Map<String, dynamic> json) =>
      _$EstablishmentReviewAddModelFromJson(json);
}
