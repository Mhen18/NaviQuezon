// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'establishment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EstablishmentModel _$EstablishmentModelFromJson(Map<String, dynamic> json) {
  return _EstablishmentModel.fromJson(json);
}

/// @nodoc
mixin _$EstablishmentModel {
  String get id => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  num get longitude => throw _privateConstructorUsedError;
  num get latitude => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;
  @JsonKey(name: 'number')
  String get contactNumber => throw _privateConstructorUsedError;
  num get createdDate => throw _privateConstructorUsedError;
  num get updatedDate => throw _privateConstructorUsedError;
  String? get municipality => throw _privateConstructorUsedError;
  bool? get isOpen => throw _privateConstructorUsedError;
  String? get schedule => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;
  String? get video => throw _privateConstructorUsedError;
  List<String>? get images => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: true)
  List<EstablishmentAmenityModel>? get amenities =>
      throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<EstablishmentReviewModel>? get reviews =>
      throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<EstablishmentSurveyModel>? get survey =>
      throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<EstablishmentReportModel>? get report =>
      throw _privateConstructorUsedError;
  num? get rating => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  BitmapDescriptor? get markerIcon => throw _privateConstructorUsedError;

  /// Serializes this EstablishmentModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EstablishmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EstablishmentModelCopyWith<EstablishmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EstablishmentModelCopyWith<$Res> {
  factory $EstablishmentModelCopyWith(
          EstablishmentModel value, $Res Function(EstablishmentModel) then) =
      _$EstablishmentModelCopyWithImpl<$Res, EstablishmentModel>;
  @useResult
  $Res call(
      {String id,
      String ownerId,
      String name,
      String address,
      String? description,
      num longitude,
      num latitude,
      List<String> categories,
      @JsonKey(name: 'number') String contactNumber,
      num createdDate,
      num updatedDate,
      String? municipality,
      bool? isOpen,
      String? schedule,
      String? thumbnail,
      String? video,
      List<String>? images,
      @JsonKey(includeFromJson: false, includeToJson: true)
      List<EstablishmentAmenityModel>? amenities,
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<EstablishmentReviewModel>? reviews,
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<EstablishmentSurveyModel>? survey,
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<EstablishmentReportModel>? report,
      num? rating,
      @JsonKey(includeToJson: false, includeFromJson: false)
      BitmapDescriptor? markerIcon});
}

/// @nodoc
class _$EstablishmentModelCopyWithImpl<$Res, $Val extends EstablishmentModel>
    implements $EstablishmentModelCopyWith<$Res> {
  _$EstablishmentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EstablishmentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? name = null,
    Object? address = null,
    Object? description = freezed,
    Object? longitude = null,
    Object? latitude = null,
    Object? categories = null,
    Object? contactNumber = null,
    Object? createdDate = null,
    Object? updatedDate = null,
    Object? municipality = freezed,
    Object? isOpen = freezed,
    Object? schedule = freezed,
    Object? thumbnail = freezed,
    Object? video = freezed,
    Object? images = freezed,
    Object? amenities = freezed,
    Object? reviews = freezed,
    Object? survey = freezed,
    Object? report = freezed,
    Object? rating = freezed,
    Object? markerIcon = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as num,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as num,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      contactNumber: null == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as num,
      updatedDate: null == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as num,
      municipality: freezed == municipality
          ? _value.municipality
          : municipality // ignore: cast_nullable_to_non_nullable
              as String?,
      isOpen: freezed == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool?,
      schedule: freezed == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      amenities: freezed == amenities
          ? _value.amenities
          : amenities // ignore: cast_nullable_to_non_nullable
              as List<EstablishmentAmenityModel>?,
      reviews: freezed == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<EstablishmentReviewModel>?,
      survey: freezed == survey
          ? _value.survey
          : survey // ignore: cast_nullable_to_non_nullable
              as List<EstablishmentSurveyModel>?,
      report: freezed == report
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as List<EstablishmentReportModel>?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as num?,
      markerIcon: freezed == markerIcon
          ? _value.markerIcon
          : markerIcon // ignore: cast_nullable_to_non_nullable
              as BitmapDescriptor?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EstablishmentModelImplCopyWith<$Res>
    implements $EstablishmentModelCopyWith<$Res> {
  factory _$$EstablishmentModelImplCopyWith(_$EstablishmentModelImpl value,
          $Res Function(_$EstablishmentModelImpl) then) =
      __$$EstablishmentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String ownerId,
      String name,
      String address,
      String? description,
      num longitude,
      num latitude,
      List<String> categories,
      @JsonKey(name: 'number') String contactNumber,
      num createdDate,
      num updatedDate,
      String? municipality,
      bool? isOpen,
      String? schedule,
      String? thumbnail,
      String? video,
      List<String>? images,
      @JsonKey(includeFromJson: false, includeToJson: true)
      List<EstablishmentAmenityModel>? amenities,
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<EstablishmentReviewModel>? reviews,
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<EstablishmentSurveyModel>? survey,
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<EstablishmentReportModel>? report,
      num? rating,
      @JsonKey(includeToJson: false, includeFromJson: false)
      BitmapDescriptor? markerIcon});
}

/// @nodoc
class __$$EstablishmentModelImplCopyWithImpl<$Res>
    extends _$EstablishmentModelCopyWithImpl<$Res, _$EstablishmentModelImpl>
    implements _$$EstablishmentModelImplCopyWith<$Res> {
  __$$EstablishmentModelImplCopyWithImpl(_$EstablishmentModelImpl _value,
      $Res Function(_$EstablishmentModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EstablishmentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? name = null,
    Object? address = null,
    Object? description = freezed,
    Object? longitude = null,
    Object? latitude = null,
    Object? categories = null,
    Object? contactNumber = null,
    Object? createdDate = null,
    Object? updatedDate = null,
    Object? municipality = freezed,
    Object? isOpen = freezed,
    Object? schedule = freezed,
    Object? thumbnail = freezed,
    Object? video = freezed,
    Object? images = freezed,
    Object? amenities = freezed,
    Object? reviews = freezed,
    Object? survey = freezed,
    Object? report = freezed,
    Object? rating = freezed,
    Object? markerIcon = freezed,
  }) {
    return _then(_$EstablishmentModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as num,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as num,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      contactNumber: null == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as num,
      updatedDate: null == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as num,
      municipality: freezed == municipality
          ? _value.municipality
          : municipality // ignore: cast_nullable_to_non_nullable
              as String?,
      isOpen: freezed == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool?,
      schedule: freezed == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      amenities: freezed == amenities
          ? _value._amenities
          : amenities // ignore: cast_nullable_to_non_nullable
              as List<EstablishmentAmenityModel>?,
      reviews: freezed == reviews
          ? _value._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<EstablishmentReviewModel>?,
      survey: freezed == survey
          ? _value._survey
          : survey // ignore: cast_nullable_to_non_nullable
              as List<EstablishmentSurveyModel>?,
      report: freezed == report
          ? _value._report
          : report // ignore: cast_nullable_to_non_nullable
              as List<EstablishmentReportModel>?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as num?,
      markerIcon: freezed == markerIcon
          ? _value.markerIcon
          : markerIcon // ignore: cast_nullable_to_non_nullable
              as BitmapDescriptor?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$EstablishmentModelImpl implements _EstablishmentModel {
  const _$EstablishmentModelImpl(
      {required this.id,
      required this.ownerId,
      required this.name,
      required this.address,
      required this.description,
      required this.longitude,
      required this.latitude,
      required final List<String> categories,
      @JsonKey(name: 'number') required this.contactNumber,
      required this.createdDate,
      required this.updatedDate,
      this.municipality,
      this.isOpen,
      this.schedule,
      this.thumbnail,
      this.video,
      final List<String>? images,
      @JsonKey(includeFromJson: false, includeToJson: true)
      final List<EstablishmentAmenityModel>? amenities,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<EstablishmentReviewModel>? reviews,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<EstablishmentSurveyModel>? survey,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<EstablishmentReportModel>? report,
      this.rating,
      @JsonKey(includeToJson: false, includeFromJson: false) this.markerIcon})
      : _categories = categories,
        _images = images,
        _amenities = amenities,
        _reviews = reviews,
        _survey = survey,
        _report = report;

  factory _$EstablishmentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EstablishmentModelImplFromJson(json);

  @override
  final String id;
  @override
  final String ownerId;
  @override
  final String name;
  @override
  final String address;
  @override
  final String? description;
  @override
  final num longitude;
  @override
  final num latitude;
  final List<String> _categories;
  @override
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  @JsonKey(name: 'number')
  final String contactNumber;
  @override
  final num createdDate;
  @override
  final num updatedDate;
  @override
  final String? municipality;
  @override
  final bool? isOpen;
  @override
  final String? schedule;
  @override
  final String? thumbnail;
  @override
  final String? video;
  final List<String>? _images;
  @override
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<EstablishmentAmenityModel>? _amenities;
  @override
  @JsonKey(includeFromJson: false, includeToJson: true)
  List<EstablishmentAmenityModel>? get amenities {
    final value = _amenities;
    if (value == null) return null;
    if (_amenities is EqualUnmodifiableListView) return _amenities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<EstablishmentReviewModel>? _reviews;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<EstablishmentReviewModel>? get reviews {
    final value = _reviews;
    if (value == null) return null;
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<EstablishmentSurveyModel>? _survey;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<EstablishmentSurveyModel>? get survey {
    final value = _survey;
    if (value == null) return null;
    if (_survey is EqualUnmodifiableListView) return _survey;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<EstablishmentReportModel>? _report;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<EstablishmentReportModel>? get report {
    final value = _report;
    if (value == null) return null;
    if (_report is EqualUnmodifiableListView) return _report;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final num? rating;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final BitmapDescriptor? markerIcon;

  @override
  String toString() {
    return 'EstablishmentModel(id: $id, ownerId: $ownerId, name: $name, address: $address, description: $description, longitude: $longitude, latitude: $latitude, categories: $categories, contactNumber: $contactNumber, createdDate: $createdDate, updatedDate: $updatedDate, municipality: $municipality, isOpen: $isOpen, schedule: $schedule, thumbnail: $thumbnail, video: $video, images: $images, amenities: $amenities, reviews: $reviews, survey: $survey, report: $report, rating: $rating, markerIcon: $markerIcon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EstablishmentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.contactNumber, contactNumber) ||
                other.contactNumber == contactNumber) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.municipality, municipality) ||
                other.municipality == municipality) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.video, video) || other.video == video) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality()
                .equals(other._amenities, _amenities) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            const DeepCollectionEquality().equals(other._survey, _survey) &&
            const DeepCollectionEquality().equals(other._report, _report) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.markerIcon, markerIcon) ||
                other.markerIcon == markerIcon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        ownerId,
        name,
        address,
        description,
        longitude,
        latitude,
        const DeepCollectionEquality().hash(_categories),
        contactNumber,
        createdDate,
        updatedDate,
        municipality,
        isOpen,
        schedule,
        thumbnail,
        video,
        const DeepCollectionEquality().hash(_images),
        const DeepCollectionEquality().hash(_amenities),
        const DeepCollectionEquality().hash(_reviews),
        const DeepCollectionEquality().hash(_survey),
        const DeepCollectionEquality().hash(_report),
        rating,
        markerIcon
      ]);

  /// Create a copy of EstablishmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EstablishmentModelImplCopyWith<_$EstablishmentModelImpl> get copyWith =>
      __$$EstablishmentModelImplCopyWithImpl<_$EstablishmentModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EstablishmentModelImplToJson(
      this,
    );
  }
}

abstract class _EstablishmentModel implements EstablishmentModel {
  const factory _EstablishmentModel(
      {required final String id,
      required final String ownerId,
      required final String name,
      required final String address,
      required final String? description,
      required final num longitude,
      required final num latitude,
      required final List<String> categories,
      @JsonKey(name: 'number') required final String contactNumber,
      required final num createdDate,
      required final num updatedDate,
      final String? municipality,
      final bool? isOpen,
      final String? schedule,
      final String? thumbnail,
      final String? video,
      final List<String>? images,
      @JsonKey(includeFromJson: false, includeToJson: true)
      final List<EstablishmentAmenityModel>? amenities,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<EstablishmentReviewModel>? reviews,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<EstablishmentSurveyModel>? survey,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<EstablishmentReportModel>? report,
      final num? rating,
      @JsonKey(includeToJson: false, includeFromJson: false)
      final BitmapDescriptor? markerIcon}) = _$EstablishmentModelImpl;

  factory _EstablishmentModel.fromJson(Map<String, dynamic> json) =
      _$EstablishmentModelImpl.fromJson;

  @override
  String get id;
  @override
  String get ownerId;
  @override
  String get name;
  @override
  String get address;
  @override
  String? get description;
  @override
  num get longitude;
  @override
  num get latitude;
  @override
  List<String> get categories;
  @override
  @JsonKey(name: 'number')
  String get contactNumber;
  @override
  num get createdDate;
  @override
  num get updatedDate;
  @override
  String? get municipality;
  @override
  bool? get isOpen;
  @override
  String? get schedule;
  @override
  String? get thumbnail;
  @override
  String? get video;
  @override
  List<String>? get images;
  @override
  @JsonKey(includeFromJson: false, includeToJson: true)
  List<EstablishmentAmenityModel>? get amenities;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<EstablishmentReviewModel>? get reviews;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<EstablishmentSurveyModel>? get survey;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<EstablishmentReportModel>? get report;
  @override
  num? get rating;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  BitmapDescriptor? get markerIcon;

  /// Create a copy of EstablishmentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EstablishmentModelImplCopyWith<_$EstablishmentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
