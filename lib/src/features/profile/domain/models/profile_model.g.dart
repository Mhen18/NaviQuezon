// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileModelImpl _$$ProfileModelImplFromJson(Map<String, dynamic> json) =>
    _$ProfileModelImpl(
      id: json['id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      createdDate: json['created_date'] as num,
      updatedDate: json['updated_date'] as num,
      role: json['role'] as String? ?? 'user',
      position: json['position'] as String?,
      age: (json['age'] as num?)?.toInt(),
      gender: json['gender'] as String?,
      country: json['country'] as String?,
      region: json['region'] as String?,
      province: json['province'] as String?,
      municipality: json['municipality'] as String?,
      image: json['image'] as String?,
      isApproved: json['is_approved'] as bool?,
    );

Map<String, dynamic> _$$ProfileModelImplToJson(_$ProfileModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'created_date': instance.createdDate,
      'updated_date': instance.updatedDate,
      'role': instance.role,
      if (instance.position case final value?) 'position': value,
      if (instance.age case final value?) 'age': value,
      if (instance.gender case final value?) 'gender': value,
      if (instance.country case final value?) 'country': value,
      if (instance.region case final value?) 'region': value,
      if (instance.province case final value?) 'province': value,
      if (instance.municipality case final value?) 'municipality': value,
      if (instance.image case final value?) 'image': value,
      if (instance.isApproved case final value?) 'is_approved': value,
    };
