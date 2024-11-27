// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'establishment_add_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EstablishmentAddModel _$EstablishmentAddModelFromJson(
    Map<String, dynamic> json) {
  return _EstablishmentAddModel.fromJson(json);
}

/// @nodoc
mixin _$EstablishmentAddModel {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'number')
  String get contactNumber => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String? get ownerId => throw _privateConstructorUsedError;
  List<EstablishmentAmenityModel>? get amenities =>
      throw _privateConstructorUsedError;
  List<String>? get imageUrl => throw _privateConstructorUsedError;
  String? get schedule => throw _privateConstructorUsedError;
  bool? get isOpen => throw _privateConstructorUsedError;

  /// Serializes this EstablishmentAddModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EstablishmentAddModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EstablishmentAddModelCopyWith<EstablishmentAddModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EstablishmentAddModelCopyWith<$Res> {
  factory $EstablishmentAddModelCopyWith(EstablishmentAddModel value,
          $Res Function(EstablishmentAddModel) then) =
      _$EstablishmentAddModelCopyWithImpl<$Res, EstablishmentAddModel>;
  @useResult
  $Res call(
      {String name,
      String description,
      String address,
      @JsonKey(name: 'number') String contactNumber,
      List<String> categories,
      double latitude,
      double longitude,
      String? ownerId,
      List<EstablishmentAmenityModel>? amenities,
      List<String>? imageUrl,
      String? schedule,
      bool? isOpen});
}

/// @nodoc
class _$EstablishmentAddModelCopyWithImpl<$Res,
        $Val extends EstablishmentAddModel>
    implements $EstablishmentAddModelCopyWith<$Res> {
  _$EstablishmentAddModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EstablishmentAddModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? address = null,
    Object? contactNumber = null,
    Object? categories = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? ownerId = freezed,
    Object? amenities = freezed,
    Object? imageUrl = freezed,
    Object? schedule = freezed,
    Object? isOpen = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      contactNumber: null == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      ownerId: freezed == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String?,
      amenities: freezed == amenities
          ? _value.amenities
          : amenities // ignore: cast_nullable_to_non_nullable
              as List<EstablishmentAmenityModel>?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      schedule: freezed == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as String?,
      isOpen: freezed == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EstablishmentAddModelImplCopyWith<$Res>
    implements $EstablishmentAddModelCopyWith<$Res> {
  factory _$$EstablishmentAddModelImplCopyWith(
          _$EstablishmentAddModelImpl value,
          $Res Function(_$EstablishmentAddModelImpl) then) =
      __$$EstablishmentAddModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String description,
      String address,
      @JsonKey(name: 'number') String contactNumber,
      List<String> categories,
      double latitude,
      double longitude,
      String? ownerId,
      List<EstablishmentAmenityModel>? amenities,
      List<String>? imageUrl,
      String? schedule,
      bool? isOpen});
}

/// @nodoc
class __$$EstablishmentAddModelImplCopyWithImpl<$Res>
    extends _$EstablishmentAddModelCopyWithImpl<$Res,
        _$EstablishmentAddModelImpl>
    implements _$$EstablishmentAddModelImplCopyWith<$Res> {
  __$$EstablishmentAddModelImplCopyWithImpl(_$EstablishmentAddModelImpl _value,
      $Res Function(_$EstablishmentAddModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EstablishmentAddModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? address = null,
    Object? contactNumber = null,
    Object? categories = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? ownerId = freezed,
    Object? amenities = freezed,
    Object? imageUrl = freezed,
    Object? schedule = freezed,
    Object? isOpen = freezed,
  }) {
    return _then(_$EstablishmentAddModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      contactNumber: null == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      ownerId: freezed == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String?,
      amenities: freezed == amenities
          ? _value._amenities
          : amenities // ignore: cast_nullable_to_non_nullable
              as List<EstablishmentAmenityModel>?,
      imageUrl: freezed == imageUrl
          ? _value._imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      schedule: freezed == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as String?,
      isOpen: freezed == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(
    fieldRename: FieldRename.snake, includeIfNull: false, explicitToJson: true)
class _$EstablishmentAddModelImpl implements _EstablishmentAddModel {
  const _$EstablishmentAddModelImpl(
      {required this.name,
      required this.description,
      required this.address,
      @JsonKey(name: 'number') required this.contactNumber,
      required final List<String> categories,
      required this.latitude,
      required this.longitude,
      this.ownerId,
      final List<EstablishmentAmenityModel>? amenities,
      final List<String>? imageUrl,
      this.schedule,
      this.isOpen})
      : _categories = categories,
        _amenities = amenities,
        _imageUrl = imageUrl;

  factory _$EstablishmentAddModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EstablishmentAddModelImplFromJson(json);

  @override
  final String name;
  @override
  final String description;
  @override
  final String address;
  @override
  @JsonKey(name: 'number')
  final String contactNumber;
  final List<String> _categories;
  @override
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String? ownerId;
  final List<EstablishmentAmenityModel>? _amenities;
  @override
  List<EstablishmentAmenityModel>? get amenities {
    final value = _amenities;
    if (value == null) return null;
    if (_amenities is EqualUnmodifiableListView) return _amenities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _imageUrl;
  @override
  List<String>? get imageUrl {
    final value = _imageUrl;
    if (value == null) return null;
    if (_imageUrl is EqualUnmodifiableListView) return _imageUrl;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? schedule;
  @override
  final bool? isOpen;

  @override
  String toString() {
    return 'EstablishmentAddModel(name: $name, description: $description, address: $address, contactNumber: $contactNumber, categories: $categories, latitude: $latitude, longitude: $longitude, ownerId: $ownerId, amenities: $amenities, imageUrl: $imageUrl, schedule: $schedule, isOpen: $isOpen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EstablishmentAddModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.contactNumber, contactNumber) ||
                other.contactNumber == contactNumber) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            const DeepCollectionEquality()
                .equals(other._amenities, _amenities) &&
            const DeepCollectionEquality().equals(other._imageUrl, _imageUrl) &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      description,
      address,
      contactNumber,
      const DeepCollectionEquality().hash(_categories),
      latitude,
      longitude,
      ownerId,
      const DeepCollectionEquality().hash(_amenities),
      const DeepCollectionEquality().hash(_imageUrl),
      schedule,
      isOpen);

  /// Create a copy of EstablishmentAddModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EstablishmentAddModelImplCopyWith<_$EstablishmentAddModelImpl>
      get copyWith => __$$EstablishmentAddModelImplCopyWithImpl<
          _$EstablishmentAddModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EstablishmentAddModelImplToJson(
      this,
    );
  }
}

abstract class _EstablishmentAddModel implements EstablishmentAddModel {
  const factory _EstablishmentAddModel(
      {required final String name,
      required final String description,
      required final String address,
      @JsonKey(name: 'number') required final String contactNumber,
      required final List<String> categories,
      required final double latitude,
      required final double longitude,
      final String? ownerId,
      final List<EstablishmentAmenityModel>? amenities,
      final List<String>? imageUrl,
      final String? schedule,
      final bool? isOpen}) = _$EstablishmentAddModelImpl;

  factory _EstablishmentAddModel.fromJson(Map<String, dynamic> json) =
      _$EstablishmentAddModelImpl.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  String get address;
  @override
  @JsonKey(name: 'number')
  String get contactNumber;
  @override
  List<String> get categories;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  String? get ownerId;
  @override
  List<EstablishmentAmenityModel>? get amenities;
  @override
  List<String>? get imageUrl;
  @override
  String? get schedule;
  @override
  bool? get isOpen;

  /// Create a copy of EstablishmentAddModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EstablishmentAddModelImplCopyWith<_$EstablishmentAddModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
