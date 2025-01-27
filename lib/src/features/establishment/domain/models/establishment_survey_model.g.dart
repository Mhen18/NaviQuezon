// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'establishment_survey_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EstablishmentSurveyModelImpl _$$EstablishmentSurveyModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EstablishmentSurveyModelImpl(
      date: json['date'] as num,
      total: json['total'] as num,
      female: json['female'] as num,
      male: json['male'] as num,
      createdDate: json['created_date'] as num,
      updatedDate: json['updated_date'] as num,
      country: json['country'] as String? ?? sPhilippines,
      region: json['region'] as String?,
      province: json['province'] as String?,
      municipality: json['municipality'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EstablishmentSurveyModelImplToJson(
        _$EstablishmentSurveyModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'total': instance.total,
      'female': instance.female,
      'male': instance.male,
      'created_date': instance.createdDate,
      'updated_date': instance.updatedDate,
      'country': instance.country,
      'region': instance.region,
      'province': instance.province,
      'municipality': instance.municipality,
      'runtimeType': instance.$type,
    };

_$EstablishmentSurveyAddModelImpl _$$EstablishmentSurveyAddModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EstablishmentSurveyAddModelImpl(
      total: json['total'] as num,
      female: json['female'] as num,
      male: json['male'] as num,
      country: json['country'] as String,
      region: json['region'] as String?,
      province: json['province'] as String?,
      municipality: json['municipality'] as String?,
      date: json['date'] as num?,
      createdDate: json['created_date'] as Map<String, dynamic>?,
      updatedDate: json['updated_date'] as Map<String, dynamic>?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EstablishmentSurveyAddModelImplToJson(
        _$EstablishmentSurveyAddModelImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'female': instance.female,
      'male': instance.male,
      'country': instance.country,
      'region': instance.region,
      'province': instance.province,
      'municipality': instance.municipality,
      'date': instance.date,
      'created_date': instance.createdDate,
      'updated_date': instance.updatedDate,
      'runtimeType': instance.$type,
    };
