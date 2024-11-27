import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_email_template_model.freezed.dart';
part 'admin_email_template_model.g.dart';

///{@template AdminEmailTemplateModel}
/// Model for the email template of admin access invite.
///{@endtemplate}
@freezed
class AdminEmailTemplateModel with _$AdminEmailTemplateModel {
  ///{@macro AdminEmailTemplateModel}
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    explicitToJson: false,
  )
  const factory AdminEmailTemplateModel({
    @JsonKey(name: 'user_subject') required String subject,
    @JsonKey(name: 'user_email') required String email,
    @JsonKey(name: 'user_name') required String name,
    @JsonKey(name: 'user_password')required String password,
  }) = _AdminEmailTemplateModel;

  factory AdminEmailTemplateModel.fromJson(Map<String, dynamic> json) =>
      _$AdminEmailTemplateModelFromJson(json);
}
