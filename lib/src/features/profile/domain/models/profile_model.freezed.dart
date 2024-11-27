// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return _ProfileModel.fromJson(json);
}

/// @nodoc
mixin _$ProfileModel {
  String get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  num get createdDate => throw _privateConstructorUsedError;
  num get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 'user')
  String get role => throw _privateConstructorUsedError;
  String? get position => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get region => throw _privateConstructorUsedError;
  String? get province => throw _privateConstructorUsedError;
  String? get municipality => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  bool? get isApproved => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false)
  ProfileValidationModel? get validation => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false)
  List<String>? get estaLike => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<EstablishmentItineraryModel>? get estaItinerary =>
      throw _privateConstructorUsedError;

  /// Serializes this ProfileModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileModelCopyWith<ProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileModelCopyWith<$Res> {
  factory $ProfileModelCopyWith(
          ProfileModel value, $Res Function(ProfileModel) then) =
      _$ProfileModelCopyWithImpl<$Res, ProfileModel>;
  @useResult
  $Res call(
      {String id,
      String firstName,
      String lastName,
      String email,
      String phone,
      num createdDate,
      num updatedDate,
      @JsonKey(defaultValue: 'user') String role,
      String? position,
      int? age,
      String? gender,
      String? country,
      String? region,
      String? province,
      String? municipality,
      String? image,
      bool? isApproved,
      @JsonKey(includeFromJson: false) ProfileValidationModel? validation,
      @JsonKey(includeFromJson: false) List<String>? estaLike,
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<EstablishmentItineraryModel>? estaItinerary});

  $ProfileValidationModelCopyWith<$Res>? get validation;
}

/// @nodoc
class _$ProfileModelCopyWithImpl<$Res, $Val extends ProfileModel>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? phone = null,
    Object? createdDate = null,
    Object? updatedDate = null,
    Object? role = null,
    Object? position = freezed,
    Object? age = freezed,
    Object? gender = freezed,
    Object? country = freezed,
    Object? region = freezed,
    Object? province = freezed,
    Object? municipality = freezed,
    Object? image = freezed,
    Object? isApproved = freezed,
    Object? validation = freezed,
    Object? estaLike = freezed,
    Object? estaItinerary = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as num,
      updatedDate: null == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as num,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      province: freezed == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as String?,
      municipality: freezed == municipality
          ? _value.municipality
          : municipality // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      isApproved: freezed == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
      validation: freezed == validation
          ? _value.validation
          : validation // ignore: cast_nullable_to_non_nullable
              as ProfileValidationModel?,
      estaLike: freezed == estaLike
          ? _value.estaLike
          : estaLike // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      estaItinerary: freezed == estaItinerary
          ? _value.estaItinerary
          : estaItinerary // ignore: cast_nullable_to_non_nullable
              as List<EstablishmentItineraryModel>?,
    ) as $Val);
  }

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileValidationModelCopyWith<$Res>? get validation {
    if (_value.validation == null) {
      return null;
    }

    return $ProfileValidationModelCopyWith<$Res>(_value.validation!, (value) {
      return _then(_value.copyWith(validation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileModelImplCopyWith<$Res>
    implements $ProfileModelCopyWith<$Res> {
  factory _$$ProfileModelImplCopyWith(
          _$ProfileModelImpl value, $Res Function(_$ProfileModelImpl) then) =
      __$$ProfileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String firstName,
      String lastName,
      String email,
      String phone,
      num createdDate,
      num updatedDate,
      @JsonKey(defaultValue: 'user') String role,
      String? position,
      int? age,
      String? gender,
      String? country,
      String? region,
      String? province,
      String? municipality,
      String? image,
      bool? isApproved,
      @JsonKey(includeFromJson: false) ProfileValidationModel? validation,
      @JsonKey(includeFromJson: false) List<String>? estaLike,
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<EstablishmentItineraryModel>? estaItinerary});

  @override
  $ProfileValidationModelCopyWith<$Res>? get validation;
}

/// @nodoc
class __$$ProfileModelImplCopyWithImpl<$Res>
    extends _$ProfileModelCopyWithImpl<$Res, _$ProfileModelImpl>
    implements _$$ProfileModelImplCopyWith<$Res> {
  __$$ProfileModelImplCopyWithImpl(
      _$ProfileModelImpl _value, $Res Function(_$ProfileModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? phone = null,
    Object? createdDate = null,
    Object? updatedDate = null,
    Object? role = null,
    Object? position = freezed,
    Object? age = freezed,
    Object? gender = freezed,
    Object? country = freezed,
    Object? region = freezed,
    Object? province = freezed,
    Object? municipality = freezed,
    Object? image = freezed,
    Object? isApproved = freezed,
    Object? validation = freezed,
    Object? estaLike = freezed,
    Object? estaItinerary = freezed,
  }) {
    return _then(_$ProfileModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as num,
      updatedDate: null == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as num,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      province: freezed == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as String?,
      municipality: freezed == municipality
          ? _value.municipality
          : municipality // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      isApproved: freezed == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
      validation: freezed == validation
          ? _value.validation
          : validation // ignore: cast_nullable_to_non_nullable
              as ProfileValidationModel?,
      estaLike: freezed == estaLike
          ? _value._estaLike
          : estaLike // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      estaItinerary: freezed == estaItinerary
          ? _value._estaItinerary
          : estaItinerary // ignore: cast_nullable_to_non_nullable
              as List<EstablishmentItineraryModel>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(
    fieldRename: FieldRename.snake, includeIfNull: false, explicitToJson: true)
class _$ProfileModelImpl implements _ProfileModel {
  const _$ProfileModelImpl(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      required this.createdDate,
      required this.updatedDate,
      @JsonKey(defaultValue: 'user') required this.role,
      this.position,
      this.age,
      this.gender,
      this.country,
      this.region,
      this.province,
      this.municipality,
      this.image,
      this.isApproved,
      @JsonKey(includeFromJson: false) this.validation,
      @JsonKey(includeFromJson: false) final List<String>? estaLike,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<EstablishmentItineraryModel>? estaItinerary})
      : _estaLike = estaLike,
        _estaItinerary = estaItinerary;

  factory _$ProfileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileModelImplFromJson(json);

  @override
  final String id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final String phone;
  @override
  final num createdDate;
  @override
  final num updatedDate;
  @override
  @JsonKey(defaultValue: 'user')
  final String role;
  @override
  final String? position;
  @override
  final int? age;
  @override
  final String? gender;
  @override
  final String? country;
  @override
  final String? region;
  @override
  final String? province;
  @override
  final String? municipality;
  @override
  final String? image;
  @override
  final bool? isApproved;
  @override
  @JsonKey(includeFromJson: false)
  final ProfileValidationModel? validation;
  final List<String>? _estaLike;
  @override
  @JsonKey(includeFromJson: false)
  List<String>? get estaLike {
    final value = _estaLike;
    if (value == null) return null;
    if (_estaLike is EqualUnmodifiableListView) return _estaLike;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<EstablishmentItineraryModel>? _estaItinerary;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<EstablishmentItineraryModel>? get estaItinerary {
    final value = _estaItinerary;
    if (value == null) return null;
    if (_estaItinerary is EqualUnmodifiableListView) return _estaItinerary;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProfileModel(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, createdDate: $createdDate, updatedDate: $updatedDate, role: $role, position: $position, age: $age, gender: $gender, country: $country, region: $region, province: $province, municipality: $municipality, image: $image, isApproved: $isApproved, validation: $validation, estaLike: $estaLike, estaItinerary: $estaItinerary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.province, province) ||
                other.province == province) &&
            (identical(other.municipality, municipality) ||
                other.municipality == municipality) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.isApproved, isApproved) ||
                other.isApproved == isApproved) &&
            (identical(other.validation, validation) ||
                other.validation == validation) &&
            const DeepCollectionEquality().equals(other._estaLike, _estaLike) &&
            const DeepCollectionEquality()
                .equals(other._estaItinerary, _estaItinerary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        firstName,
        lastName,
        email,
        phone,
        createdDate,
        updatedDate,
        role,
        position,
        age,
        gender,
        country,
        region,
        province,
        municipality,
        image,
        isApproved,
        validation,
        const DeepCollectionEquality().hash(_estaLike),
        const DeepCollectionEquality().hash(_estaItinerary)
      ]);

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileModelImplCopyWith<_$ProfileModelImpl> get copyWith =>
      __$$ProfileModelImplCopyWithImpl<_$ProfileModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileModelImplToJson(
      this,
    );
  }
}

abstract class _ProfileModel implements ProfileModel {
  const factory _ProfileModel(
      {required final String id,
      required final String firstName,
      required final String lastName,
      required final String email,
      required final String phone,
      required final num createdDate,
      required final num updatedDate,
      @JsonKey(defaultValue: 'user') required final String role,
      final String? position,
      final int? age,
      final String? gender,
      final String? country,
      final String? region,
      final String? province,
      final String? municipality,
      final String? image,
      final bool? isApproved,
      @JsonKey(includeFromJson: false) final ProfileValidationModel? validation,
      @JsonKey(includeFromJson: false) final List<String>? estaLike,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<EstablishmentItineraryModel>?
          estaItinerary}) = _$ProfileModelImpl;

  factory _ProfileModel.fromJson(Map<String, dynamic> json) =
      _$ProfileModelImpl.fromJson;

  @override
  String get id;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get email;
  @override
  String get phone;
  @override
  num get createdDate;
  @override
  num get updatedDate;
  @override
  @JsonKey(defaultValue: 'user')
  String get role;
  @override
  String? get position;
  @override
  int? get age;
  @override
  String? get gender;
  @override
  String? get country;
  @override
  String? get region;
  @override
  String? get province;
  @override
  String? get municipality;
  @override
  String? get image;
  @override
  bool? get isApproved;
  @override
  @JsonKey(includeFromJson: false)
  ProfileValidationModel? get validation;
  @override
  @JsonKey(includeFromJson: false)
  List<String>? get estaLike;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<EstablishmentItineraryModel>? get estaItinerary;

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileModelImplCopyWith<_$ProfileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
