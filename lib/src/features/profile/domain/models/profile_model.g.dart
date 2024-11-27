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

Map<String, dynamic> _$$ProfileModelImplToJson(_$ProfileModelImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'first_name': instance.firstName,
    'last_name': instance.lastName,
    'email': instance.email,
    'phone': instance.phone,
    'created_date': instance.createdDate,
    'updated_date': instance.updatedDate,
    'role': instance.role,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('position', instance.position);
  writeNotNull('age', instance.age);
  writeNotNull('gender', instance.gender);
  writeNotNull('country', instance.country);
  writeNotNull('region', instance.region);
  writeNotNull('province', instance.province);
  writeNotNull('municipality', instance.municipality);
  writeNotNull('image', instance.image);
  writeNotNull('is_approved', instance.isApproved);
  return val;
}
