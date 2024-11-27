// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'establishment_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EstablishmentReportModelImpl _$$EstablishmentReportModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EstablishmentReportModelImpl(
      date: json['date'] as num,
      total: json['total'] as num,
      female: json['female'] as num,
      male: json['male'] as num,
      userId: json['user_id'] as String?,
      municipality: json['municipality'] as String?,
      province: json['province'] as String?,
      country: json['country'] as String?,
      establishmentId: json['establishment_id'] as String?,
      establishmentName: json['establishment_name'] as String?,
    );

Map<String, dynamic> _$$EstablishmentReportModelImplToJson(
        _$EstablishmentReportModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'total': instance.total,
      'female': instance.female,
      'male': instance.male,
      'user_id': instance.userId,
      'municipality': instance.municipality,
      'province': instance.province,
      'country': instance.country,
      'establishment_id': instance.establishmentId,
      'establishment_name': instance.establishmentName,
    };
