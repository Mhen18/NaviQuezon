// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddressModel {
  String get country => throw _privateConstructorUsedError;
  RegionModel? get region => throw _privateConstructorUsedError;
  ProvinceModel? get province => throw _privateConstructorUsedError;
  MunicipalityModel? get municipality => throw _privateConstructorUsedError;

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressModelCopyWith<AddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressModelCopyWith<$Res> {
  factory $AddressModelCopyWith(
          AddressModel value, $Res Function(AddressModel) then) =
      _$AddressModelCopyWithImpl<$Res, AddressModel>;
  @useResult
  $Res call(
      {String country,
      RegionModel? region,
      ProvinceModel? province,
      MunicipalityModel? municipality});

  $RegionModelCopyWith<$Res>? get region;
  $ProvinceModelCopyWith<$Res>? get province;
  $MunicipalityModelCopyWith<$Res>? get municipality;
}

/// @nodoc
class _$AddressModelCopyWithImpl<$Res, $Val extends AddressModel>
    implements $AddressModelCopyWith<$Res> {
  _$AddressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? country = null,
    Object? region = freezed,
    Object? province = freezed,
    Object? municipality = freezed,
  }) {
    return _then(_value.copyWith(
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as RegionModel?,
      province: freezed == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as ProvinceModel?,
      municipality: freezed == municipality
          ? _value.municipality
          : municipality // ignore: cast_nullable_to_non_nullable
              as MunicipalityModel?,
    ) as $Val);
  }

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RegionModelCopyWith<$Res>? get region {
    if (_value.region == null) {
      return null;
    }

    return $RegionModelCopyWith<$Res>(_value.region!, (value) {
      return _then(_value.copyWith(region: value) as $Val);
    });
  }

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProvinceModelCopyWith<$Res>? get province {
    if (_value.province == null) {
      return null;
    }

    return $ProvinceModelCopyWith<$Res>(_value.province!, (value) {
      return _then(_value.copyWith(province: value) as $Val);
    });
  }

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MunicipalityModelCopyWith<$Res>? get municipality {
    if (_value.municipality == null) {
      return null;
    }

    return $MunicipalityModelCopyWith<$Res>(_value.municipality!, (value) {
      return _then(_value.copyWith(municipality: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddressModelImplCopyWith<$Res>
    implements $AddressModelCopyWith<$Res> {
  factory _$$AddressModelImplCopyWith(
          _$AddressModelImpl value, $Res Function(_$AddressModelImpl) then) =
      __$$AddressModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String country,
      RegionModel? region,
      ProvinceModel? province,
      MunicipalityModel? municipality});

  @override
  $RegionModelCopyWith<$Res>? get region;
  @override
  $ProvinceModelCopyWith<$Res>? get province;
  @override
  $MunicipalityModelCopyWith<$Res>? get municipality;
}

/// @nodoc
class __$$AddressModelImplCopyWithImpl<$Res>
    extends _$AddressModelCopyWithImpl<$Res, _$AddressModelImpl>
    implements _$$AddressModelImplCopyWith<$Res> {
  __$$AddressModelImplCopyWithImpl(
      _$AddressModelImpl _value, $Res Function(_$AddressModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? country = null,
    Object? region = freezed,
    Object? province = freezed,
    Object? municipality = freezed,
  }) {
    return _then(_$AddressModelImpl(
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as RegionModel?,
      province: freezed == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as ProvinceModel?,
      municipality: freezed == municipality
          ? _value.municipality
          : municipality // ignore: cast_nullable_to_non_nullable
              as MunicipalityModel?,
    ));
  }
}

/// @nodoc

class _$AddressModelImpl implements _AddressModel {
  const _$AddressModelImpl(
      {required this.country,
      required this.region,
      required this.province,
      required this.municipality});

  @override
  final String country;
  @override
  final RegionModel? region;
  @override
  final ProvinceModel? province;
  @override
  final MunicipalityModel? municipality;

  @override
  String toString() {
    return 'AddressModel(country: $country, region: $region, province: $province, municipality: $municipality)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressModelImpl &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.province, province) ||
                other.province == province) &&
            (identical(other.municipality, municipality) ||
                other.municipality == municipality));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, country, region, province, municipality);

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressModelImplCopyWith<_$AddressModelImpl> get copyWith =>
      __$$AddressModelImplCopyWithImpl<_$AddressModelImpl>(this, _$identity);
}

abstract class _AddressModel implements AddressModel {
  const factory _AddressModel(
      {required final String country,
      required final RegionModel? region,
      required final ProvinceModel? province,
      required final MunicipalityModel? municipality}) = _$AddressModelImpl;

  @override
  String get country;
  @override
  RegionModel? get region;
  @override
  ProvinceModel? get province;
  @override
  MunicipalityModel? get municipality;

  /// Create a copy of AddressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressModelImplCopyWith<_$AddressModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
