import 'package:freezed_annotation/freezed_annotation.dart';

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
    required String userId,
    required num date,
    required num total,
    required num female,
    required num male,
    required num createdDate,
    required num updatedDate,
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
    String? userId,
    num? date,
    Map<String, dynamic>? createdDate,
    Map<String, dynamic>? updatedDate,
  }) = _EstablishmentSurveyAddModel;

  factory EstablishmentSurveyModel.fromJson(Map<String, dynamic> json) =>
      _$EstablishmentSurveyModelFromJson(json);
}
