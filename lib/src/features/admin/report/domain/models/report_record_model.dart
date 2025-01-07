import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_record_model.freezed.dart';

@freezed
class ReportRecordModel with _$ReportRecordModel {
  const factory ReportRecordModel({
    required String name,
    required int thisMunicipalityMale,
    required int thisMunicipalityFemale,
    required int thisMunicipalityTotal,
    required int otherMunicipalityMale,
    required int otherMunicipalityFemale,
    required int otherMunicipalityTotal,
    required int otherProvinceMale,
    required int otherProvinceFemale,
    required int otherProvinceTotal,
    required int otherCountryMale,
    required int otherCountryFemale,
    required int otherCountryTotal,
    required int totalMale,
    required int totalFemale,
    required int totalTotal,
  }) = _ReportRecordModel;
}


