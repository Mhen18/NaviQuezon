// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'municipality_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MunicipalityModelImpl _$$MunicipalityModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MunicipalityModelImpl(
      code: json['code'] as String,
      name: json['name'] as String,
      provinceCode: json['provinceCode'] as String,
      regionCode: json['regionCode'] as String,
      islandCode: json['islandGroupCode'] as String?,
      psgcCode: json['psgc10DigitCode'] as String?,
    );

Map<String, dynamic> _$$MunicipalityModelImplToJson(
        _$MunicipalityModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'provinceCode': instance.provinceCode,
      'regionCode': instance.regionCode,
      'islandGroupCode': instance.islandCode,
      'psgc10DigitCode': instance.psgcCode,
    };
