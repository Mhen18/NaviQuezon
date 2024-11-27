import 'package:freezed_annotation/freezed_annotation.dart';

part 'establishment_category_model.freezed.dart';

part 'establishment_category_model.g.dart';

///{@template EstablishmentCategoryModel}
/// Model for establishment's category.
///{@endtemplate}
@freezed
class EstablishmentCategoryModel with _$EstablishmentCategoryModel {
  @JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
  )

  ///{@macro EstablishmentCategoryModel}
  const factory EstablishmentCategoryModel({
    required String id,
    required String name,
  }) = _EstablishmentCategoryModel;

  ///{@macro EstablishmentCategoryModel}

  factory EstablishmentCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$EstablishmentCategoryModelFromJson(json);
}
