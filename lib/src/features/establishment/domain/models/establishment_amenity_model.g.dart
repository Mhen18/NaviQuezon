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
    _$EstablishmentAmenityModelImpl instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('is_free', instance.isFree);
  writeNotNull('is_popular', instance.isPopular);
  return val;
}
