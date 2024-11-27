// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FaqModelImpl _$$FaqModelImplFromJson(Map<String, dynamic> json) =>
    _$FaqModelImpl(
      id: json['id'] as String,
      question: json['question'] as String,
      answer: json['answer'] as String,
      createdDate: json['created_date'] as num,
      updatedDate: json['updated_date'] as num,
    );

Map<String, dynamic> _$$FaqModelImplToJson(_$FaqModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answer': instance.answer,
      'created_date': instance.createdDate,
      'updated_date': instance.updatedDate,
    };
