import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_template_model.freezed.dart';
part 'email_template_model.g.dart';

///{@template EmailTemplateModel}
/// Model for the email template.
///{@endtemplate}
@freezed
class EmailTemplateModel with _$EmailTemplateModel {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    includeIfNull: false,
  )
  const factory EmailTemplateModel({
    @JsonKey(name: 'user_subject') required String subject,
    @JsonKey(name: 'user_email') required String email,
    @JsonKey(name: 'user_name') required String name,
    required String resetOtp,
  }) = _EmailTemplateModel;

  factory EmailTemplateModel.fromJson(Map<String, dynamic> json) =>
      _$EmailTemplateModelFromJson(json);
}
