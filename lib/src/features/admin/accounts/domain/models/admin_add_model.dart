import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_add_model.freezed.dart';
part 'admin_add_model.g.dart';

///{@template AdminAddModel}
/// Model for adding an admin.
///{@endtemplate}
@freezed
class AdminAddModel with _$AdminAddModel {
  ///{@macro AdminAddModel}
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    explicitToJson: true,
  )
  const factory AdminAddModel({
    required String municipality,
    required String email,
    required String firstName,
    required String lastName,
    required String phone,
  }) = _AdminAddModel;

  factory AdminAddModel.fromJson(Map<String, dynamic> json) =>
      _$AdminAddModelFromJson(json);
}
