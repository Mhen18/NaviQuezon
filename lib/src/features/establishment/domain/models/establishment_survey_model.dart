import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naviquezon/src/core/utils/keys/string_keys.dart';

part 'establishment_survey_model.freezed.dart';

part 'establishment_survey_model.g.dart';

///{@template EstablishmentSurveyModel}
/// Model for establishment's survey details.
///{@endtemplate}
@freezed
class EstablishmentSurveyModel with _$EstablishmentSurveyModel {
  ///{@macro EstablishmentSurveyModel}
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    explicitToJson: true,
  )
  const factory EstablishmentSurveyModel({
    required num date,
    required num total,
    required num female,
    required num male,
    required num createdDate,
    required num updatedDate,
    @Default(sPhilippines) String? country,
    String? region,
    String? province,
    String? municipality,
  }) = _EstablishmentSurveyModel;

  ///{@macro EstablishmentSurveyModel.add}
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    explicitToJson: true,
  )
  const factory EstablishmentSurveyModel.add({
    required num total,
    required num female,
    required num male,
    required String country,
    String? region,
    String? province,
    String? municipality,
    num? date,
    Map<String, dynamic>? createdDate,
    Map<String, dynamic>? updatedDate,
  }) = _EstablishmentSurveyAddModel;

  factory EstablishmentSurveyModel.fromJson(Map<String, dynamic> json) =>
      _$EstablishmentSurveyModelFromJson(json);
}
