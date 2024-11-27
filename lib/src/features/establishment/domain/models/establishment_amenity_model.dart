import 'package:freezed_annotation/freezed_annotation.dart';

part 'establishment_amenity_model.freezed.dart';

part 'establishment_amenity_model.g.dart';

///{@template EstablishmentAmenityModel}
/// Model for establishment's amenity details.
///{@endtemplate}
@freezed
class EstablishmentAmenityModel with _$EstablishmentAmenityModel {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    includeIfNull: false,
    explicitToJson: true,
  )

  ///{@macro EstablishmentAmenityModel}
  const factory EstablishmentAmenityModel({
    required String name,
    @JsonKey(defaultValue: false) bool? isFree,
    @JsonKey(defaultValue: false) bool? isPopular,
  }) = _EstablishmentAmenityModel;

  ///{@macro EstablishmentAmenityModel}

  factory EstablishmentAmenityModel.fromJson(Map<String, dynamic> json) =>
      _$EstablishmentAmenityModelFromJson(json);
}
