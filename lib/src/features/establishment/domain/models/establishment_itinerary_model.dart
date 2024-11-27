import 'package:freezed_annotation/freezed_annotation.dart';

part 'establishment_itinerary_model.freezed.dart';

part 'establishment_itinerary_model.g.dart';

///{@template EstablishmentItineraryModel}
/// Model for user's itinerary establishment.
///{@endtemplate}
@freezed
class EstablishmentItineraryModel with _$EstablishmentItineraryModel {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    explicitToJson: true,
  )

  ///{@macro EstablishmentItineraryModel}
  const factory EstablishmentItineraryModel({
    required String establishmentId,
    required num createdDate,
    required num updatedDate,
  }) = _EstablishmentItineraryModel;


  @JsonSerializable(
    fieldRename: FieldRename.snake,
    explicitToJson: true,
  )
  ///{@macro EstablishmentItineraryModel.add}
  const factory EstablishmentItineraryModel.add({
    required String establishmentId,
    Map<String, dynamic>? createdDate,
    Map<String, dynamic>? updatedDate,
  }) = _EstablishmentItineraryAddModel;

  ///{@macro EstablishmentItineraryModel}

  factory EstablishmentItineraryModel.fromJson(Map<String, dynamic> json) =>
      _$EstablishmentItineraryModelFromJson(json);
}
