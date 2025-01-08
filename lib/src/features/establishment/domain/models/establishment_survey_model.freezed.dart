// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'establishment_survey_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EstablishmentSurveyModel _$EstablishmentSurveyModelFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _EstablishmentSurveyModel.fromJson(json);
    case 'add':
      return _EstablishmentSurveyAddModel.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'EstablishmentSurveyModel',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$EstablishmentSurveyModel {
  num? get date => throw _privateConstructorUsedError;
  num get total => throw _privateConstructorUsedError;
  num get female => throw _privateConstructorUsedError;
  num get male => throw _privateConstructorUsedError;
  Object? get createdDate => throw _privateConstructorUsedError;
  Object? get updatedDate => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get region => throw _privateConstructorUsedError;
  String? get province => throw _privateConstructorUsedError;
  String? get municipality => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            num date,
            num total,
            num female,
            num male,
            num createdDate,
            num updatedDate,
            String? country,
            String? region,
            String? province,
            String? municipality)
        $default, {
    required TResult Function(
            num total,
            num female,
            num male,
            String country,
            String? region,
            String? province,
            String? municipality,
            num? date,
            Map<String, dynamic>? createdDate,
            Map<String, dynamic>? updatedDate)
        add,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            num date,
            num total,
            num female,
            num male,
            num createdDate,
            num updatedDate,
            String? country,
            String? region,
            String? province,
            String? municipality)?
        $default, {
    TResult? Function(
            num total,
            num female,
            num male,
            String country,
            String? region,
            String? province,
            String? municipality,
            num? date,
            Map<String, dynamic>? createdDate,
            Map<String, dynamic>? updatedDate)?
        add,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            num date,
            num total,
            num female,
            num male,
            num createdDate,
            num updatedDate,
            String? country,
            String? region,
            String? province,
            String? municipality)?
        $default, {
    TResult Function(
            num total,
            num female,
            num male,
            String country,
            String? region,
            String? province,
            String? municipality,
            num? date,
            Map<String, dynamic>? createdDate,
            Map<String, dynamic>? updatedDate)?
        add,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_EstablishmentSurveyModel value) $default, {
    required TResult Function(_EstablishmentSurveyAddModel value) add,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_EstablishmentSurveyModel value)? $default, {
    TResult? Function(_EstablishmentSurveyAddModel value)? add,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_EstablishmentSurveyModel value)? $default, {
    TResult Function(_EstablishmentSurveyAddModel value)? add,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this EstablishmentSurveyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EstablishmentSurveyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EstablishmentSurveyModelCopyWith<EstablishmentSurveyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EstablishmentSurveyModelCopyWith<$Res> {
  factory $EstablishmentSurveyModelCopyWith(EstablishmentSurveyModel value,
          $Res Function(EstablishmentSurveyModel) then) =
      _$EstablishmentSurveyModelCopyWithImpl<$Res, EstablishmentSurveyModel>;
  @useResult
  $Res call(
      {num date,
      num total,
      num female,
      num male,
      String country,
      String? region,
      String? province,
      String? municipality});
}

/// @nodoc
class _$EstablishmentSurveyModelCopyWithImpl<$Res,
        $Val extends EstablishmentSurveyModel>
    implements $EstablishmentSurveyModelCopyWith<$Res> {
  _$EstablishmentSurveyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EstablishmentSurveyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? total = null,
    Object? female = null,
    Object? male = null,
    Object? country = null,
    Object? region = freezed,
    Object? province = freezed,
    Object? municipality = freezed,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date!
          : date // ignore: cast_nullable_to_non_nullable
              as num,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as num,
      female: null == female
          ? _value.female
          : female // ignore: cast_nullable_to_non_nullable
              as num,
      male: null == male
          ? _value.male
          : male // ignore: cast_nullable_to_non_nullable
              as num,
      country: null == country
          ? _value.country!
          : country // ignore: cast_nullable_to_non_nullable
              as String,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EstablishmentSurveyModelImplCopyWith<$Res>
    implements $EstablishmentSurveyModelCopyWith<$Res> {
  factory _$$EstablishmentSurveyModelImplCopyWith(
          _$EstablishmentSurveyModelImpl value,
          $Res Function(_$EstablishmentSurveyModelImpl) then) =
      __$$EstablishmentSurveyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {num date,
      num total,
      num female,
      num male,
      num createdDate,
      num updatedDate,
      String? country,
      String? region,
      String? province,
      String? municipality});
}

/// @nodoc
class __$$EstablishmentSurveyModelImplCopyWithImpl<$Res>
    extends _$EstablishmentSurveyModelCopyWithImpl<$Res,
        _$EstablishmentSurveyModelImpl>
    implements _$$EstablishmentSurveyModelImplCopyWith<$Res> {
  __$$EstablishmentSurveyModelImplCopyWithImpl(
      _$EstablishmentSurveyModelImpl _value,
      $Res Function(_$EstablishmentSurveyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EstablishmentSurveyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? total = null,
    Object? female = null,
    Object? male = null,
    Object? createdDate = null,
    Object? updatedDate = null,
    Object? country = freezed,
    Object? region = freezed,
    Object? province = freezed,
    Object? municipality = freezed,
  }) {
    return _then(_$EstablishmentSurveyModelImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as num,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as num,
      female: null == female
          ? _value.female
          : female // ignore: cast_nullable_to_non_nullable
              as num,
      male: null == male
          ? _value.male
          : male // ignore: cast_nullable_to_non_nullable
              as num,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as num,
      updatedDate: null == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as num,
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
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$EstablishmentSurveyModelImpl implements _EstablishmentSurveyModel {
  const _$EstablishmentSurveyModelImpl(
      {required this.date,
      required this.total,
      required this.female,
      required this.male,
      required this.createdDate,
      required this.updatedDate,
      this.country = sPhilippines,
      this.region,
      this.province,
      this.municipality,
      final String? $type})
      : $type = $type ?? 'default';

  factory _$EstablishmentSurveyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EstablishmentSurveyModelImplFromJson(json);

  @override
  final num date;
  @override
  final num total;
  @override
  final num female;
  @override
  final num male;
  @override
  final num createdDate;
  @override
  final num updatedDate;
  @override
  @JsonKey()
  final String? country;
  @override
  final String? region;
  @override
  final String? province;
  @override
  final String? municipality;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'EstablishmentSurveyModel(date: $date, total: $total, female: $female, male: $male, createdDate: $createdDate, updatedDate: $updatedDate, country: $country, region: $region, province: $province, municipality: $municipality)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EstablishmentSurveyModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.female, female) || other.female == female) &&
            (identical(other.male, male) || other.male == male) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.province, province) ||
                other.province == province) &&
            (identical(other.municipality, municipality) ||
                other.municipality == municipality));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, total, female, male,
      createdDate, updatedDate, country, region, province, municipality);

  /// Create a copy of EstablishmentSurveyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EstablishmentSurveyModelImplCopyWith<_$EstablishmentSurveyModelImpl>
      get copyWith => __$$EstablishmentSurveyModelImplCopyWithImpl<
          _$EstablishmentSurveyModelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            num date,
            num total,
            num female,
            num male,
            num createdDate,
            num updatedDate,
            String? country,
            String? region,
            String? province,
            String? municipality)
        $default, {
    required TResult Function(
            num total,
            num female,
            num male,
            String country,
            String? region,
            String? province,
            String? municipality,
            num? date,
            Map<String, dynamic>? createdDate,
            Map<String, dynamic>? updatedDate)
        add,
  }) {
    return $default(date, total, female, male, createdDate, updatedDate,
        country, region, province, municipality);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            num date,
            num total,
            num female,
            num male,
            num createdDate,
            num updatedDate,
            String? country,
            String? region,
            String? province,
            String? municipality)?
        $default, {
    TResult? Function(
            num total,
            num female,
            num male,
            String country,
            String? region,
            String? province,
            String? municipality,
            num? date,
            Map<String, dynamic>? createdDate,
            Map<String, dynamic>? updatedDate)?
        add,
  }) {
    return $default?.call(date, total, female, male, createdDate, updatedDate,
        country, region, province, municipality);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            num date,
            num total,
            num female,
            num male,
            num createdDate,
            num updatedDate,
            String? country,
            String? region,
            String? province,
            String? municipality)?
        $default, {
    TResult Function(
            num total,
            num female,
            num male,
            String country,
            String? region,
            String? province,
            String? municipality,
            num? date,
            Map<String, dynamic>? createdDate,
            Map<String, dynamic>? updatedDate)?
        add,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(date, total, female, male, createdDate, updatedDate,
          country, region, province, municipality);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_EstablishmentSurveyModel value) $default, {
    required TResult Function(_EstablishmentSurveyAddModel value) add,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_EstablishmentSurveyModel value)? $default, {
    TResult? Function(_EstablishmentSurveyAddModel value)? add,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_EstablishmentSurveyModel value)? $default, {
    TResult Function(_EstablishmentSurveyAddModel value)? add,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EstablishmentSurveyModelImplToJson(
      this,
    );
  }
}

abstract class _EstablishmentSurveyModel implements EstablishmentSurveyModel {
  const factory _EstablishmentSurveyModel(
      {required final num date,
      required final num total,
      required final num female,
      required final num male,
      required final num createdDate,
      required final num updatedDate,
      final String? country,
      final String? region,
      final String? province,
      final String? municipality}) = _$EstablishmentSurveyModelImpl;

  factory _EstablishmentSurveyModel.fromJson(Map<String, dynamic> json) =
      _$EstablishmentSurveyModelImpl.fromJson;

  @override
  num get date;
  @override
  num get total;
  @override
  num get female;
  @override
  num get male;
  @override
  num get createdDate;
  @override
  num get updatedDate;
  @override
  String? get country;
  @override
  String? get region;
  @override
  String? get province;
  @override
  String? get municipality;

  /// Create a copy of EstablishmentSurveyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EstablishmentSurveyModelImplCopyWith<_$EstablishmentSurveyModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EstablishmentSurveyAddModelImplCopyWith<$Res>
    implements $EstablishmentSurveyModelCopyWith<$Res> {
  factory _$$EstablishmentSurveyAddModelImplCopyWith(
          _$EstablishmentSurveyAddModelImpl value,
          $Res Function(_$EstablishmentSurveyAddModelImpl) then) =
      __$$EstablishmentSurveyAddModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {num total,
      num female,
      num male,
      String country,
      String? region,
      String? province,
      String? municipality,
      num? date,
      Map<String, dynamic>? createdDate,
      Map<String, dynamic>? updatedDate});
}

/// @nodoc
class __$$EstablishmentSurveyAddModelImplCopyWithImpl<$Res>
    extends _$EstablishmentSurveyModelCopyWithImpl<$Res,
        _$EstablishmentSurveyAddModelImpl>
    implements _$$EstablishmentSurveyAddModelImplCopyWith<$Res> {
  __$$EstablishmentSurveyAddModelImplCopyWithImpl(
      _$EstablishmentSurveyAddModelImpl _value,
      $Res Function(_$EstablishmentSurveyAddModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EstablishmentSurveyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? female = null,
    Object? male = null,
    Object? country = null,
    Object? region = freezed,
    Object? province = freezed,
    Object? municipality = freezed,
    Object? date = freezed,
    Object? createdDate = freezed,
    Object? updatedDate = freezed,
  }) {
    return _then(_$EstablishmentSurveyAddModelImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as num,
      female: null == female
          ? _value.female
          : female // ignore: cast_nullable_to_non_nullable
              as num,
      male: null == male
          ? _value.male
          : male // ignore: cast_nullable_to_non_nullable
              as num,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
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
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as num?,
      createdDate: freezed == createdDate
          ? _value._createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      updatedDate: freezed == updatedDate
          ? _value._updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$EstablishmentSurveyAddModelImpl
    implements _EstablishmentSurveyAddModel {
  const _$EstablishmentSurveyAddModelImpl(
      {required this.total,
      required this.female,
      required this.male,
      required this.country,
      this.region,
      this.province,
      this.municipality,
      this.date,
      final Map<String, dynamic>? createdDate,
      final Map<String, dynamic>? updatedDate,
      final String? $type})
      : _createdDate = createdDate,
        _updatedDate = updatedDate,
        $type = $type ?? 'add';

  factory _$EstablishmentSurveyAddModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EstablishmentSurveyAddModelImplFromJson(json);

  @override
  final num total;
  @override
  final num female;
  @override
  final num male;
  @override
  final String country;
  @override
  final String? region;
  @override
  final String? province;
  @override
  final String? municipality;
  @override
  final num? date;
  final Map<String, dynamic>? _createdDate;
  @override
  Map<String, dynamic>? get createdDate {
    final value = _createdDate;
    if (value == null) return null;
    if (_createdDate is EqualUnmodifiableMapView) return _createdDate;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _updatedDate;
  @override
  Map<String, dynamic>? get updatedDate {
    final value = _updatedDate;
    if (value == null) return null;
    if (_updatedDate is EqualUnmodifiableMapView) return _updatedDate;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'EstablishmentSurveyModel.add(total: $total, female: $female, male: $male, country: $country, region: $region, province: $province, municipality: $municipality, date: $date, createdDate: $createdDate, updatedDate: $updatedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EstablishmentSurveyAddModelImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.female, female) || other.female == female) &&
            (identical(other.male, male) || other.male == male) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.province, province) ||
                other.province == province) &&
            (identical(other.municipality, municipality) ||
                other.municipality == municipality) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality()
                .equals(other._createdDate, _createdDate) &&
            const DeepCollectionEquality()
                .equals(other._updatedDate, _updatedDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      total,
      female,
      male,
      country,
      region,
      province,
      municipality,
      date,
      const DeepCollectionEquality().hash(_createdDate),
      const DeepCollectionEquality().hash(_updatedDate));

  /// Create a copy of EstablishmentSurveyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EstablishmentSurveyAddModelImplCopyWith<_$EstablishmentSurveyAddModelImpl>
      get copyWith => __$$EstablishmentSurveyAddModelImplCopyWithImpl<
          _$EstablishmentSurveyAddModelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            num date,
            num total,
            num female,
            num male,
            num createdDate,
            num updatedDate,
            String? country,
            String? region,
            String? province,
            String? municipality)
        $default, {
    required TResult Function(
            num total,
            num female,
            num male,
            String country,
            String? region,
            String? province,
            String? municipality,
            num? date,
            Map<String, dynamic>? createdDate,
            Map<String, dynamic>? updatedDate)
        add,
  }) {
    return add(total, female, male, country, region, province, municipality,
        date, createdDate, updatedDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            num date,
            num total,
            num female,
            num male,
            num createdDate,
            num updatedDate,
            String? country,
            String? region,
            String? province,
            String? municipality)?
        $default, {
    TResult? Function(
            num total,
            num female,
            num male,
            String country,
            String? region,
            String? province,
            String? municipality,
            num? date,
            Map<String, dynamic>? createdDate,
            Map<String, dynamic>? updatedDate)?
        add,
  }) {
    return add?.call(total, female, male, country, region, province,
        municipality, date, createdDate, updatedDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            num date,
            num total,
            num female,
            num male,
            num createdDate,
            num updatedDate,
            String? country,
            String? region,
            String? province,
            String? municipality)?
        $default, {
    TResult Function(
            num total,
            num female,
            num male,
            String country,
            String? region,
            String? province,
            String? municipality,
            num? date,
            Map<String, dynamic>? createdDate,
            Map<String, dynamic>? updatedDate)?
        add,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(total, female, male, country, region, province, municipality,
          date, createdDate, updatedDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_EstablishmentSurveyModel value) $default, {
    required TResult Function(_EstablishmentSurveyAddModel value) add,
  }) {
    return add(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_EstablishmentSurveyModel value)? $default, {
    TResult? Function(_EstablishmentSurveyAddModel value)? add,
  }) {
    return add?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_EstablishmentSurveyModel value)? $default, {
    TResult Function(_EstablishmentSurveyAddModel value)? add,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EstablishmentSurveyAddModelImplToJson(
      this,
    );
  }
}

abstract class _EstablishmentSurveyAddModel
    implements EstablishmentSurveyModel {
  const factory _EstablishmentSurveyAddModel(
          {required final num total,
          required final num female,
          required final num male,
          required final String country,
          final String? region,
          final String? province,
          final String? municipality,
          final num? date,
          final Map<String, dynamic>? createdDate,
          final Map<String, dynamic>? updatedDate}) =
      _$EstablishmentSurveyAddModelImpl;

  factory _EstablishmentSurveyAddModel.fromJson(Map<String, dynamic> json) =
      _$EstablishmentSurveyAddModelImpl.fromJson;

  @override
  num get total;
  @override
  num get female;
  @override
  num get male;
  @override
  String get country;
  @override
  String? get region;
  @override
  String? get province;
  @override
  String? get municipality;
  @override
  num? get date;
  @override
  Map<String, dynamic>? get createdDate;
  @override
  Map<String, dynamic>? get updatedDate;

  /// Create a copy of EstablishmentSurveyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EstablishmentSurveyAddModelImplCopyWith<_$EstablishmentSurveyAddModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
