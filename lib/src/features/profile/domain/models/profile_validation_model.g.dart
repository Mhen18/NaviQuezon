// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_validation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileValidationModelImpl _$$ProfileValidationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileValidationModelImpl(
      id: json['id'] as String,
      ownerId: json['owner_id'] as String,
      idFront: json['id_front'] as String,
      idBack: json['id_back'] as String,
      permitFront: json['permit_front'] as String,
      permitBack: json['permit_back'] as String,
      formalPicture: json['formal_picture'] as String,
      createdDate: json['created_date'] as num,
      updatedDate: json['updated_date'] as num,
    );

Map<String, dynamic> _$$ProfileValidationModelImplToJson(
        _$ProfileValidationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner_id': instance.ownerId,
      'id_front': instance.idFront,
      'id_back': instance.idBack,
      'permit_front': instance.permitFront,
      'permit_back': instance.permitBack,
      'formal_picture': instance.formalPicture,
      'created_date': instance.createdDate,
      'updated_date': instance.updatedDate,
    };
