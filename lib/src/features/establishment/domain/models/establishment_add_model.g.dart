// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'establishment_add_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EstablishmentAddModelImpl _$$EstablishmentAddModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EstablishmentAddModelImpl(
      name: json['name'] as String,
      description: json['description'] as String,
      address: json['address'] as String,
      contactNumber: json['number'] as String,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      ownerId: json['owner_id'] as String?,
      amenities: (json['amenities'] as List<dynamic>?)
          ?.map((e) =>
              EstablishmentAmenityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      imageUrl: (json['image_url'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      schedule: json['schedule'] as String?,
      isOpen: json['is_open'] as bool?,
    );

Map<String, dynamic> _$$EstablishmentAddModelImplToJson(
    _$EstablishmentAddModelImpl instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'description': instance.description,
    'address': instance.address,
    'number': instance.contactNumber,
    'categories': instance.categories,
    'latitude': instance.latitude,
    'longitude': instance.longitude,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('owner_id', instance.ownerId);
  writeNotNull(
      'amenities', instance.amenities?.map((e) => e.toJson()).toList());
  writeNotNull('image_url', instance.imageUrl);
  writeNotNull('schedule', instance.schedule);
  writeNotNull('is_open', instance.isOpen);
  return val;
}
