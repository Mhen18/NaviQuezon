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
        _$EstablishmentReviewModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'rate': instance.rate,
      'created_date': instance.createdDate,
      'updated_date': instance.updatedDate,
      if (instance.userName case final value?) 'user_name': value,
      if (instance.comment case final value?) 'comment': value,
      if (instance.room case final value?) 'room': value,
      if (instance.cleanliness case final value?) 'cleanliness': value,
      if (instance.breakfast case final value?) 'breakfast': value,
      if (instance.service case final value?) 'service': value,
      if (instance.bathroom case final value?) 'bathroom': value,
    };
