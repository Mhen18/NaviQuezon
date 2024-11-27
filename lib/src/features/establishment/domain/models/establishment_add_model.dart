import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_amenity_model.dart';

part 'establishment_add_model.freezed.dart';

part 'establishment_add_model.g.dart';

///{@template EstablishmentAddModel}
/// Model for adding an establishment.
///{@endtemplate}
@freezed
class EstablishmentAddModel with _$EstablishmentAddModel {
  ///{@macro EstablishmentAddModel}
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    includeIfNull: false,
    explicitToJson: true,
  )
  const factory EstablishmentAddModel({
    required String name,
    required String description,
    required String address,
    @JsonKey(name: 'number') required String contactNumber,
    required List<String> categories,
    required double latitude,
    required double longitude,
    String? ownerId,
    List<EstablishmentAmenityModel>? amenities,
    List<String>? imageUrl,
    String? schedule,
    bool? isOpen,
  }) = _EstablishmentAddModel;

  /// Method to convert the model to a json.
  ///
  factory EstablishmentAddModel.fromJson(Map<String, dynamic> json) =>
      _$EstablishmentAddModelFromJson(json);
}
