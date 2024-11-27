// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_validation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegistrationValidationModellImpl _$$RegistrationValidationModellImplFromJson(
        Map<String, dynamic> json) =>
    _$RegistrationValidationModellImpl(
      idFront: json['id_front'] as String,
      idBack: json['id_back'] as String,
      permitFront: json['permit_front'] as String,
      permitBack: json['permit_back'] as String,
      formalPicture: json['formal_picture'] as String,
    );

Map<String, dynamic> _$$RegistrationValidationModellImplToJson(
        _$RegistrationValidationModellImpl instance) =>
    <String, dynamic>{
      'id_front': instance.idFront,
      'id_back': instance.idBack,
      'permit_front': instance.permitFront,
      'permit_back': instance.permitBack,
      'formal_picture': instance.formalPicture,
    };
