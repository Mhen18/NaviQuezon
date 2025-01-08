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
        _$EstablishmentReviewAddModelImpl instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      if (instance.userId case final value?) 'user_id': value,
      if (instance.comment case final value?) 'comment': value,
      if (instance.room case final value?) 'room': value,
      if (instance.cleanliness case final value?) 'cleanliness': value,
      if (instance.breakfast case final value?) 'breakfast': value,
      if (instance.service case final value?) 'service': value,
      if (instance.bathroom case final value?) 'bathroom': value,
      if (instance.createdDate case final value?) 'created_date': value,
      if (instance.updatedDate case final value?) 'updated_date': value,
    };
