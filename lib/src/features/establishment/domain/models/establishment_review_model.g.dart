// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'establishment_review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EstablishmentReviewModelImpl _$$EstablishmentReviewModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EstablishmentReviewModelImpl(
      userId: json['user_id'] as String,
      rate: json['rate'] as num,
      createdDate: json['created_date'] as num,
      updatedDate: json['updated_date'] as num,
      userName: json['user_name'] as String? ?? 'Anonymous',
      comment: json['comment'] as String?,
      room: json['room'] as num?,
      cleanliness: json['cleanliness'] as num?,
      breakfast: json['breakfast'] as num?,
      service: json['service'] as num?,
      bathroom: json['bathroom'] as num?,
    );

Map<String, dynamic> _$$EstablishmentReviewModelImplToJson(
    _$EstablishmentReviewModelImpl instance) {
  final val = <String, dynamic>{
    'user_id': instance.userId,
    'rate': instance.rate,
    'created_date': instance.createdDate,
    'updated_date': instance.updatedDate,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user_name', instance.userName);
  writeNotNull('comment', instance.comment);
  writeNotNull('room', instance.room);
  writeNotNull('cleanliness', instance.cleanliness);
  writeNotNull('breakfast', instance.breakfast);
  writeNotNull('service', instance.service);
  writeNotNull('bathroom', instance.bathroom);
  return val;
}
