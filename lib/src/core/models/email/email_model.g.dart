// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmailModelImpl _$$EmailModelImplFromJson(Map<String, dynamic> json) =>
    _$EmailModelImpl(
      serviceId: json['service_id'] as String,
      templateId: json['template_id'] as String,
      userId: json['user_id'] as String,
      accessToken: json['accessToken'] as String,
      template: json['template_params'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$EmailModelImplToJson(_$EmailModelImpl instance) =>
    <String, dynamic>{
      'service_id': instance.serviceId,
      'template_id': instance.templateId,
      'user_id': instance.userId,
      'accessToken': instance.accessToken,
      'template_params': instance.template,
    };
