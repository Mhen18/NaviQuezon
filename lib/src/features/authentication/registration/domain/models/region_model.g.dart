// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegionModelImpl _$$RegionModelImplFromJson(Map<String, dynamic> json) =>
    _$RegionModelImpl(
      code: json['code'] as String,
      name: json['name'] as String,
      regionName: json['regionName'] as String,
      islandCode: json['islandGroupCode'] as String?,
      psgcCode: json['psgc10DigitCode'] as String?,
    );

Map<String, dynamic> _$$RegionModelImplToJson(_$RegionModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'regionName': instance.regionName,
      'islandGroupCode': instance.islandCode,
      'psgc10DigitCode': instance.psgcCode,
    };
