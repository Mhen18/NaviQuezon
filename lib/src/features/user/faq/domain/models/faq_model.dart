import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq_model.freezed.dart';

part 'faq_model.g.dart';

///{@template FaqModel}
/// Model for frequently asked questions.
///{@endtemplate}
@freezed
class FaqModel with _$FaqModel {
  ///{@macro FaqModel}
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    includeIfNull: false,
    explicitToJson: true,
  )
  const factory FaqModel({
    required String id,
    required String question,
    required String answer,
    required num createdDate,
    required num updatedDate,
  }) = _FaqModel;

  factory FaqModel.fromJson(Map<String, dynamic> json) =>
      _$FaqModelFromJson(json);
}
