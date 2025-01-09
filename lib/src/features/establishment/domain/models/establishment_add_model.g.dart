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
        _$EstablishmentAddModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'address': instance.address,
      'number': instance.contactNumber,
      'categories': instance.categories,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      if (instance.ownerId case final value?) 'owner_id': value,
      if (instance.amenities?.map((e) => e.toJson()).toList() case final value?)
        'amenities': value,
      if (instance.imageUrl case final value?) 'image_url': value,
      if (instance.schedule case final value?) 'schedule': value,
      if (instance.isOpen case final value?) 'is_open': value,
    };
