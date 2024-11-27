// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'establishment_review_add_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EstablishmentReviewAddModelImpl _$$EstablishmentReviewAddModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EstablishmentReviewAddModelImpl(
      rate: json['rate'] as num,
      userId: json['user_id'] as String?,
      comment: json['comment'] as String?,
      room: json['room'] as num?,
      cleanliness: json['cleanliness'] as num?,
      breakfast: json['breakfast'] as num?,
      service: json['service'] as num?,
      bathroom: json['bathroom'] as num?,
      createdDate: (json['created_date'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      updatedDate: (json['updated_date'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$$EstablishmentReviewAddModelImplToJson(
    _$EstablishmentReviewAddModelImpl instance) {
  final val = <String, dynamic>{
    'rate': instance.rate,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user_id', instance.userId);
  writeNotNull('comment', instance.comment);
  writeNotNull('room', instance.room);
  writeNotNull('cleanliness', instance.cleanliness);
  writeNotNull('breakfast', instance.breakfast);
  writeNotNull('service', instance.service);
  writeNotNull('bathroom', instance.bathroom);
  writeNotNull('created_date', instance.createdDate);
  writeNotNull('updated_date', instance.updatedDate);
  return val;
}
