import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naviquezon/src/features/admin/report/domain/models/report_record_model.dart';

part 'report_model.freezed.dart';

@freezed
class ReportModel with _$ReportModel {
  const factory ReportModel({
    required String municipality,
    required String monthYear,
    required List<ReportRecordModel> recordList,
  }) = _ReportModel;
}
