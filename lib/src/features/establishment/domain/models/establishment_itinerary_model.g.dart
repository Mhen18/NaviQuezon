// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'establishment_itinerary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EstablishmentItineraryModelImpl _$$EstablishmentItineraryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EstablishmentItineraryModelImpl(
      establishmentId: json['establishment_id'] as String,
      createdDate: json['created_date'] as num,
      updatedDate: json['updated_date'] as num,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EstablishmentItineraryModelImplToJson(
        _$EstablishmentItineraryModelImpl instance) =>
    <String, dynamic>{
      'establishment_id': instance.establishmentId,
      'created_date': instance.createdDate,
      'updated_date': instance.updatedDate,
      'runtimeType': instance.$type,
    };

_$EstablishmentItineraryAddModelImpl
    _$$EstablishmentItineraryAddModelImplFromJson(Map<String, dynamic> json) =>
        _$EstablishmentItineraryAddModelImpl(
          establishmentId: json['establishment_id'] as String,
          createdDate: json['created_date'] as Map<String, dynamic>?,
          updatedDate: json['updated_date'] as Map<String, dynamic>?,
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$EstablishmentItineraryAddModelImplToJson(
        _$EstablishmentItineraryAddModelImpl instance) =>
    <String, dynamic>{
      'establishment_id': instance.establishmentId,
      'created_date': instance.createdDate,
      'updated_date': instance.updatedDate,
      'runtimeType': instance.$type,
    };
