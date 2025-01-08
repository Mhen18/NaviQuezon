// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'establishment_amenity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EstablishmentAmenityModelImpl _$$EstablishmentAmenityModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EstablishmentAmenityModelImpl(
      name: json['name'] as String,
      isFree: json['is_free'] as bool? ?? false,
      isPopular: json['is_popular'] as bool? ?? false,
    );

Map<String, dynamic> _$$EstablishmentAmenityModelImplToJson(
        _$EstablishmentAmenityModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      if (instance.isFree case final value?) 'is_free': value,
      if (instance.isPopular case final value?) 'is_popular': value,
    };
