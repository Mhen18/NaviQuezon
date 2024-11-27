// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProvinceModelImpl _$$ProvinceModelImplFromJson(Map<String, dynamic> json) =>
    _$ProvinceModelImpl(
      code: json['code'] as String,
      name: json['name'] as String,
      regionCode: json['regionCode'] as String,
      islandCode: json['islandGroupCode'] as String?,
      psgcCode: json['psgc10DigitCode'] as String?,
    );

Map<String, dynamic> _$$ProvinceModelImplToJson(_$ProvinceModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'regionCode': instance.regionCode,
      'islandGroupCode': instance.islandCode,
      'psgc10DigitCode': instance.psgcCode,
    };
