// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_email_template_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminEmailTemplateModelImpl _$$AdminEmailTemplateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AdminEmailTemplateModelImpl(
      subject: json['user_subject'] as String,
      email: json['user_email'] as String,
      name: json['user_name'] as String,
      password: json['user_password'] as String,
    );

Map<String, dynamic> _$$AdminEmailTemplateModelImplToJson(
        _$AdminEmailTemplateModelImpl instance) =>
    <String, dynamic>{
      'user_subject': instance.subject,
      'user_email': instance.email,
      'user_name': instance.name,
      'user_password': instance.password,
    };
