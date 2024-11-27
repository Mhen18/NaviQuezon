import 'package:freezed_annotation/freezed_annotation.dart';

part 'establishment_report_model.freezed.dart';
part 'establishment_report_model.g.dart';

///{@template EstablishmentReportModel}
/// Model for establishment's report details.
///{@endtemplate}
@freezed
class EstablishmentReportModel with _$EstablishmentReportModel {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    explicitToJson: true,
  )
  const factory EstablishmentReportModel({
    required num date,
    required num total,
    required num female,
    required num male,
    String? userId,
    String? municipality,
    String? province,
    String? country,
    String? establishmentId,
    String? establishmentName,
  }) = _EstablishmentReportModel;

  factory EstablishmentReportModel.fromJson(Map<String, dynamic> json) =>
      _$EstablishmentReportModelFromJson(json);
}
