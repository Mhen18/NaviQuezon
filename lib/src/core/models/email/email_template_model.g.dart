// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_template_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmailTemplateModelImpl _$$EmailTemplateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EmailTemplateModelImpl(
      subject: json['user_subject'] as String,
      email: json['user_email'] as String,
      name: json['user_name'] as String,
      resetOtp: json['reset_otp'] as String,
    );

Map<String, dynamic> _$$EmailTemplateModelImplToJson(
        _$EmailTemplateModelImpl instance) =>
    <String, dynamic>{
      'user_subject': instance.subject,
      'user_email': instance.email,
      'user_name': instance.name,
      'reset_otp': instance.resetOtp,
    };
