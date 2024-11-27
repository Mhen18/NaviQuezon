// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OwnerProfileModelImpl _$$OwnerProfileModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OwnerProfileModelImpl(
      email: json['email'] as String,
      password: json['password'] as String,
      phoneNumber: json['number'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      age: json['age'] as num,
      gender: json['gender'] as String,
      country: json['country'] as String,
      region: json['region'] as String,
      province: json['province'] as String,
      municipality: json['municipality'] as String,
      isApproved: json['is_approved'] as bool,
      createdDate: json['created_date'] as String,
      updatedDate: json['updated_date'] as String,
    );

Map<String, dynamic> _$$OwnerProfileModelImplToJson(
        _$OwnerProfileModelImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'number': instance.phoneNumber,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'age': instance.age,
      'gender': instance.gender,
      'country': instance.country,
      'region': instance.region,
      'province': instance.province,
      'municipality': instance.municipality,
      'is_approved': instance.isApproved,
      'created_date': instance.createdDate,
      'updated_date': instance.updatedDate,
    };
