// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_add_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminAddModelImpl _$$AdminAddModelImplFromJson(Map<String, dynamic> json) =>
    _$AdminAddModelImpl(
      municipality: json['municipality'] as String,
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$$AdminAddModelImplToJson(_$AdminAddModelImpl instance) =>
    <String, dynamic>{
      'municipality': instance.municipality,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone': instance.phone,
    };
