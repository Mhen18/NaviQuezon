import 'package:freezed_annotation/freezed_annotation.dart';

part 'region_model.freezed.dart';
part 'region_model.g.dart';

///{@template RegionModel}
/// Model for region that will get from API.
///{@endtemplate}
@freezed
class RegionModel with _$RegionModel {
  ///{@macro RegionModel}
  @JsonSerializable(explicitToJson: true)
  const factory RegionModel({
    required String code,
    required String name,
    required String regionName,
    @JsonKey(name: 'islandGroupCode') String? islandCode,
    @JsonKey(name: 'psgc10DigitCode') String? psgcCode,
  }) = _RegionModel;

  factory RegionModel.fromJson(Map<String, dynamic> json) =>
      _$RegionModelFromJson(json);
}
