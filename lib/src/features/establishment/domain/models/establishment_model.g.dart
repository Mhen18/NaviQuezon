// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'establishment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EstablishmentModelImpl _$$EstablishmentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EstablishmentModelImpl(
      id: json['id'] as String,
      ownerId: json['owner_id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      description: json['description'] as String?,
      longitude: json['longitude'] as num,
      latitude: json['latitude'] as num,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      contactNumber: json['number'] as String,
      createdDate: json['created_date'] as num,
      updatedDate: json['updated_date'] as num,
      municipality: json['municipality'] as String?,
      isOpen: json['is_open'] as bool?,
      schedule: json['schedule'] as String?,
      thumbnail: json['thumbnail'] as String?,
      video: json['video'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      rating: json['rating'] as num?,
    );

Map<String, dynamic> _$$EstablishmentModelImplToJson(
        _$EstablishmentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner_id': instance.ownerId,
      'name': instance.name,
      'address': instance.address,
      'description': instance.description,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'categories': instance.categories,
      'number': instance.contactNumber,
      'created_date': instance.createdDate,
      'updated_date': instance.updatedDate,
      'municipality': instance.municipality,
      'is_open': instance.isOpen,
      'schedule': instance.schedule,
      'thumbnail': instance.thumbnail,
      'video': instance.video,
      'images': instance.images,
      'amenities': instance.amenities?.map((e) => e.toJson()).toList(),
      'rating': instance.rating,
    };
