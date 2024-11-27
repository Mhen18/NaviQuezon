import 'package:freezed_annotation/freezed_annotation.dart';

part 'province_model.freezed.dart';
part 'province_model.g.dart';

///{@template ProvinceModel}
/// Model for province that will get from API.
///{@endtemplate}
@freezed
class ProvinceModel with _$ProvinceModel {
  ///{@macro ProvinceModel}
  @JsonSerializable(explicitToJson: true)
  const factory ProvinceModel({
    required String code,
    required String name,
    required String regionCode,
    @JsonKey(name: 'islandGroupCode') String? islandCode,
    @JsonKey(name: 'psgc10DigitCode') String? psgcCode,
  }) = _ProvinceModel;

  factory ProvinceModel.fromJson(Map<String, dynamic> json) =>
      _$ProvinceModelFromJson(json);
}
