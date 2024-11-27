import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_model.freezed.dart';
part 'email_model.g.dart';

///{@template EmailModel}
/// Model for the email.
///{@endtemplate}
@freezed
class EmailModel with _$EmailModel {
  ///{@macro EmailModel}
  @JsonSerializable(
    includeIfNull: false,
  )
  const factory EmailModel({
    @JsonKey(name: 'service_id') required String serviceId,
    @JsonKey(name: 'template_id') required String templateId,
    @JsonKey(name: 'user_id') required String userId,
    required String accessToken,
    @JsonKey(name: 'template_params') required Map<String, dynamic> template,
  }) = _EmailModel;

  factory EmailModel.fromJson(Map<String, dynamic> json) =>
      _$EmailModelFromJson(json);
}
