import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq_add_model.freezed.dart';

part 'faq_add_model.g.dart';

///{@template FaqAddModel}
/// Model for adding frequently asked questions.
///{@endtemplate}
@freezed
class FaqAddModel with _$FaqAddModel {
  ///{@macro FaqAddModel}
  @JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
  )
  const factory FaqAddModel({
    required String question,
    required String answer,
  }) = _FaqAddModel;

  factory FaqAddModel.fromJson(Map<String, dynamic> json) =>
      _$FaqAddModelFromJson(json);
}
