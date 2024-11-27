// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'establishment_like_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EstablishmentLikeModelImpl _$$EstablishmentLikeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EstablishmentLikeModelImpl(
      id: json['like_id'] as String,
      userId: json['user_id'] as String,
      establishmentId: json['establishment_id'] as String,
      createdDate: json['created_date'] as String,
      updatedDate: json['updated_date'] as String,
    );

Map<String, dynamic> _$$EstablishmentLikeModelImplToJson(
        _$EstablishmentLikeModelImpl instance) =>
    <String, dynamic>{
      'like_id': instance.id,
      'user_id': instance.userId,
      'establishment_id': instance.establishmentId,
      'created_date': instance.createdDate,
      'updated_date': instance.updatedDate,
    };
