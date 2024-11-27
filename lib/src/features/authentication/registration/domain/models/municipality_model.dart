import 'package:freezed_annotation/freezed_annotation.dart';

part 'municipality_model.freezed.dart';
part 'municipality_model.g.dart';

///{@template MunicipalityModel}
/// Model for municipality that will get from API.
///{@endtemplate}
@freezed
class MunicipalityModel with _$MunicipalityModel {
  ///{@macro MunicipalityModel}
  @JsonSerializable(explicitToJson: true)
  const factory MunicipalityModel({
    required String code,
    required String name,
    required String provinceCode,
    required String regionCode,
    @JsonKey(name: 'islandGroupCode') String? islandCode,
    @JsonKey(name: 'psgc10DigitCode') String? psgcCode,
  }) = _MunicipalityModel;

  factory MunicipalityModel.fromJson(Map<String, dynamic> json) =>
      _$MunicipalityModelFromJson(json);
}
