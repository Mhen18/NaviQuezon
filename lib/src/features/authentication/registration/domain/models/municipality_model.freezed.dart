// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'municipality_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MunicipalityModel _$MunicipalityModelFromJson(Map<String, dynamic> json) {
  return _MunicipalityModel.fromJson(json);
}

/// @nodoc
mixin _$MunicipalityModel {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get provinceCode => throw _privateConstructorUsedError;
  String get regionCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'islandGroupCode')
  String? get islandCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'psgc10DigitCode')
  String? get psgcCode => throw _privateConstructorUsedError;

  /// Serializes this MunicipalityModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MunicipalityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MunicipalityModelCopyWith<MunicipalityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MunicipalityModelCopyWith<$Res> {
  factory $MunicipalityModelCopyWith(
          MunicipalityModel value, $Res Function(MunicipalityModel) then) =
      _$MunicipalityModelCopyWithImpl<$Res, MunicipalityModel>;
  @useResult
  $Res call(
      {String code,
      String name,
      String provinceCode,
      String regionCode,
      @JsonKey(name: 'islandGroupCode') String? islandCode,
      @JsonKey(name: 'psgc10DigitCode') String? psgcCode});
}

/// @nodoc
class _$MunicipalityModelCopyWithImpl<$Res, $Val extends MunicipalityModel>
    implements $MunicipalityModelCopyWith<$Res> {
  _$MunicipalityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MunicipalityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? provinceCode = null,
    Object? regionCode = null,
    Object? islandCode = freezed,
    Object? psgcCode = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      provinceCode: null == provinceCode
          ? _value.provinceCode
          : provinceCode // ignore: cast_nullable_to_non_nullable
              as String,
      regionCode: null == regionCode
          ? _value.regionCode
          : regionCode // ignore: cast_nullable_to_non_nullable
              as String,
      islandCode: freezed == islandCode
          ? _value.islandCode
          : islandCode // ignore: cast_nullable_to_non_nullable
              as String?,
      psgcCode: freezed == psgcCode
          ? _value.psgcCode
          : psgcCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MunicipalityModelImplCopyWith<$Res>
    implements $MunicipalityModelCopyWith<$Res> {
  factory _$$MunicipalityModelImplCopyWith(_$MunicipalityModelImpl value,
          $Res Function(_$MunicipalityModelImpl) then) =
      __$$MunicipalityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String name,
      String provinceCode,
      String regionCode,
      @JsonKey(name: 'islandGroupCode') String? islandCode,
      @JsonKey(name: 'psgc10DigitCode') String? psgcCode});
}

/// @nodoc
class __$$MunicipalityModelImplCopyWithImpl<$Res>
    extends _$MunicipalityModelCopyWithImpl<$Res, _$MunicipalityModelImpl>
    implements _$$MunicipalityModelImplCopyWith<$Res> {
  __$$MunicipalityModelImplCopyWithImpl(_$MunicipalityModelImpl _value,
      $Res Function(_$MunicipalityModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MunicipalityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? provinceCode = null,
    Object? regionCode = null,
    Object? islandCode = freezed,
    Object? psgcCode = freezed,
  }) {
    return _then(_$MunicipalityModelImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      provinceCode: null == provinceCode
          ? _value.provinceCode
          : provinceCode // ignore: cast_nullable_to_non_nullable
              as String,
      regionCode: null == regionCode
          ? _value.regionCode
          : regionCode // ignore: cast_nullable_to_non_nullable
              as String,
      islandCode: freezed == islandCode
          ? _value.islandCode
          : islandCode // ignore: cast_nullable_to_non_nullable
              as String?,
      psgcCode: freezed == psgcCode
          ? _value.psgcCode
          : psgcCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$MunicipalityModelImpl implements _MunicipalityModel {
  const _$MunicipalityModelImpl(
      {required this.code,
      required this.name,
      required this.provinceCode,
      required this.regionCode,
      @JsonKey(name: 'islandGroupCode') this.islandCode,
      @JsonKey(name: 'psgc10DigitCode') this.psgcCode});

  factory _$MunicipalityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MunicipalityModelImplFromJson(json);

  @override
  final String code;
  @override
  final String name;
  @override
  final String provinceCode;
  @override
  final String regionCode;
  @override
  @JsonKey(name: 'islandGroupCode')
  final String? islandCode;
  @override
  @JsonKey(name: 'psgc10DigitCode')
  final String? psgcCode;

  @override
  String toString() {
    return 'MunicipalityModel(code: $code, name: $name, provinceCode: $provinceCode, regionCode: $regionCode, islandCode: $islandCode, psgcCode: $psgcCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MunicipalityModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.provinceCode, provinceCode) ||
                other.provinceCode == provinceCode) &&
            (identical(other.regionCode, regionCode) ||
                other.regionCode == regionCode) &&
            (identical(other.islandCode, islandCode) ||
                other.islandCode == islandCode) &&
            (identical(other.psgcCode, psgcCode) ||
                other.psgcCode == psgcCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, code, name, provinceCode, regionCode, islandCode, psgcCode);

  /// Create a copy of MunicipalityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MunicipalityModelImplCopyWith<_$MunicipalityModelImpl> get copyWith =>
      __$$MunicipalityModelImplCopyWithImpl<_$MunicipalityModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MunicipalityModelImplToJson(
      this,
    );
  }
}

abstract class _MunicipalityModel implements MunicipalityModel {
  const factory _MunicipalityModel(
          {required final String code,
          required final String name,
          required final String provinceCode,
          required final String regionCode,
          @JsonKey(name: 'islandGroupCode') final String? islandCode,
          @JsonKey(name: 'psgc10DigitCode') final String? psgcCode}) =
      _$MunicipalityModelImpl;

  factory _MunicipalityModel.fromJson(Map<String, dynamic> json) =
      _$MunicipalityModelImpl.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  String get provinceCode;
  @override
  String get regionCode;
  @override
  @JsonKey(name: 'islandGroupCode')
  String? get islandCode;
  @override
  @JsonKey(name: 'psgc10DigitCode')
  String? get psgcCode;

  /// Create a copy of MunicipalityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MunicipalityModelImplCopyWith<_$MunicipalityModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
