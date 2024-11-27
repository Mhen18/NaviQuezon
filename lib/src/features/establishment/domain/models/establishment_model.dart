import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_amenity_model.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_report_model.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_review_model.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_survey_model.dart';

part 'establishment_model.freezed.dart';
part 'establishment_model.g.dart';

///{@template establishment_model}
/// Model for establishment details.
///{@endtemplate}
@freezed
class EstablishmentModel with _$EstablishmentModel {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    explicitToJson: true,
  )

  ///{@macro EstablishmentModel}
  const factory EstablishmentModel({
    required String id,
    required String ownerId,
    required String name,
    required String address,
    required String? description,
    required num longitude,
    required num latitude,
    required List<String> categories,
    @JsonKey(name: 'number') required String contactNumber,
    required num createdDate,
    required num updatedDate,
    String? municipality,
    bool? isOpen,
    String? schedule,
    String? thumbnail,
    String? video,
    List<String>? images,
    @JsonKey(
      includeFromJson: false,
      includeToJson: true,
    )
    List<EstablishmentAmenityModel>? amenities,
    @JsonKey(
      includeFromJson: false,
      includeToJson: false,
    )
    List<EstablishmentReviewModel>? reviews,
    @JsonKey(
      includeFromJson: false,
      includeToJson: false,
    )
    List<EstablishmentSurveyModel>? survey,
    @JsonKey(
      includeFromJson: false,
      includeToJson: false,
    )
    List<EstablishmentReportModel>? report,
    num? rating,
    @JsonKey(
      includeToJson: false,
      includeFromJson: false,
    )
    BitmapDescriptor? markerIcon,
  }) = _EstablishmentModel;

  factory EstablishmentModel.fromJson(Map<String, dynamic> json) =>
      _$EstablishmentModelFromJson(json);
}
