// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'establishment_amenity_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EstablishmentAmenityModel _$EstablishmentAmenityModelFromJson(
    Map<String, dynamic> json) {
  return _EstablishmentAmenityModel.fromJson(json);
}

/// @nodoc
mixin _$EstablishmentAmenityModel {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool? get isFree => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool? get isPopular => throw _privateConstructorUsedError;

  /// Serializes this EstablishmentAmenityModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EstablishmentAmenityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EstablishmentAmenityModelCopyWith<EstablishmentAmenityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EstablishmentAmenityModelCopyWith<$Res> {
  factory $EstablishmentAmenityModelCopyWith(EstablishmentAmenityModel value,
          $Res Function(EstablishmentAmenityModel) then) =
      _$EstablishmentAmenityModelCopyWithImpl<$Res, EstablishmentAmenityModel>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(defaultValue: false) bool? isFree,
      @JsonKey(defaultValue: false) bool? isPopular});
}

/// @nodoc
class _$EstablishmentAmenityModelCopyWithImpl<$Res,
        $Val extends EstablishmentAmenityModel>
    implements $EstablishmentAmenityModelCopyWith<$Res> {
  _$EstablishmentAmenityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EstablishmentAmenityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? isFree = freezed,
    Object? isPopular = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isFree: freezed == isFree
          ? _value.isFree
          : isFree // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPopular: freezed == isPopular
          ? _value.isPopular
          : isPopular // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EstablishmentAmenityModelImplCopyWith<$Res>
    implements $EstablishmentAmenityModelCopyWith<$Res> {
  factory _$$EstablishmentAmenityModelImplCopyWith(
          _$EstablishmentAmenityModelImpl value,
          $Res Function(_$EstablishmentAmenityModelImpl) then) =
      __$$EstablishmentAmenityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(defaultValue: false) bool? isFree,
      @JsonKey(defaultValue: false) bool? isPopular});
}

/// @nodoc
class __$$EstablishmentAmenityModelImplCopyWithImpl<$Res>
    extends _$EstablishmentAmenityModelCopyWithImpl<$Res,
        _$EstablishmentAmenityModelImpl>
    implements _$$EstablishmentAmenityModelImplCopyWith<$Res> {
  __$$EstablishmentAmenityModelImplCopyWithImpl(
      _$EstablishmentAmenityModelImpl _value,
      $Res Function(_$EstablishmentAmenityModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EstablishmentAmenityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? isFree = freezed,
    Object? isPopular = freezed,
  }) {
    return _then(_$EstablishmentAmenityModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isFree: freezed == isFree
          ? _value.isFree
          : isFree // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPopular: freezed == isPopular
          ? _value.isPopular
          : isPopular // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(
    fieldRename: FieldRename.snake, includeIfNull: false, explicitToJson: true)
class _$EstablishmentAmenityModelImpl implements _EstablishmentAmenityModel {
  const _$EstablishmentAmenityModelImpl(
      {required this.name,
      @JsonKey(defaultValue: false) this.isFree,
      @JsonKey(defaultValue: false) this.isPopular});

  factory _$EstablishmentAmenityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EstablishmentAmenityModelImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(defaultValue: false)
  final bool? isFree;
  @override
  @JsonKey(defaultValue: false)
  final bool? isPopular;

  @override
  String toString() {
    return 'EstablishmentAmenityModel(name: $name, isFree: $isFree, isPopular: $isPopular)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EstablishmentAmenityModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isFree, isFree) || other.isFree == isFree) &&
            (identical(other.isPopular, isPopular) ||
                other.isPopular == isPopular));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, isFree, isPopular);

  /// Create a copy of EstablishmentAmenityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EstablishmentAmenityModelImplCopyWith<_$EstablishmentAmenityModelImpl>
      get copyWith => __$$EstablishmentAmenityModelImplCopyWithImpl<
          _$EstablishmentAmenityModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EstablishmentAmenityModelImplToJson(
      this,
    );
  }
}

abstract class _EstablishmentAmenityModel implements EstablishmentAmenityModel {
  const factory _EstablishmentAmenityModel(
          {required final String name,
          @JsonKey(defaultValue: false) final bool? isFree,
          @JsonKey(defaultValue: false) final bool? isPopular}) =
      _$EstablishmentAmenityModelImpl;

  factory _EstablishmentAmenityModel.fromJson(Map<String, dynamic> json) =
      _$EstablishmentAmenityModelImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(defaultValue: false)
  bool? get isFree;
  @override
  @JsonKey(defaultValue: false)
  bool? get isPopular;

  /// Create a copy of EstablishmentAmenityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EstablishmentAmenityModelImplCopyWith<_$EstablishmentAmenityModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
