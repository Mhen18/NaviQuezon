// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegistrationModelImpl _$$RegistrationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RegistrationModelImpl(
      email: json['email'] as String,
      password: json['password'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      phone: json['phone'] as String,
      age: (json['age'] as num).toInt(),
      gender: json['gender'] as String,
      country: json['country'] as String,
      region: json['region'] as String,
      province: json['province'] as String,
      municipality: json['municipality'] as String,
      role: json['role'] as String,
      validation: json['validation'] == null
          ? null
          : RegistrationValidationModel.fromJson(
              json['validation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RegistrationModelImplToJson(
        _$RegistrationModelImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone': instance.phone,
      'age': instance.age,
      'gender': instance.gender,
      'country': instance.country,
      'region': instance.region,
      'province': instance.province,
      'municipality': instance.municipality,
      'role': instance.role,
    };
