// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'establishment_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EstablishmentCategoryModel _$EstablishmentCategoryModelFromJson(
    Map<String, dynamic> json) {
  return _EstablishmentCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$EstablishmentCategoryModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this EstablishmentCategoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EstablishmentCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EstablishmentCategoryModelCopyWith<EstablishmentCategoryModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EstablishmentCategoryModelCopyWith<$Res> {
  factory $EstablishmentCategoryModelCopyWith(EstablishmentCategoryModel value,
          $Res Function(EstablishmentCategoryModel) then) =
      _$EstablishmentCategoryModelCopyWithImpl<$Res,
          EstablishmentCategoryModel>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$EstablishmentCategoryModelCopyWithImpl<$Res,
        $Val extends EstablishmentCategoryModel>
    implements $EstablishmentCategoryModelCopyWith<$Res> {
  _$EstablishmentCategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EstablishmentCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EstablishmentCategoryModelImplCopyWith<$Res>
    implements $EstablishmentCategoryModelCopyWith<$Res> {
  factory _$$EstablishmentCategoryModelImplCopyWith(
          _$EstablishmentCategoryModelImpl value,
          $Res Function(_$EstablishmentCategoryModelImpl) then) =
      __$$EstablishmentCategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$EstablishmentCategoryModelImplCopyWithImpl<$Res>
    extends _$EstablishmentCategoryModelCopyWithImpl<$Res,
        _$EstablishmentCategoryModelImpl>
    implements _$$EstablishmentCategoryModelImplCopyWith<$Res> {
  __$$EstablishmentCategoryModelImplCopyWithImpl(
      _$EstablishmentCategoryModelImpl _value,
      $Res Function(_$EstablishmentCategoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EstablishmentCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$EstablishmentCategoryModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$EstablishmentCategoryModelImpl implements _EstablishmentCategoryModel {
  const _$EstablishmentCategoryModelImpl(
      {required this.id, required this.name});

  factory _$EstablishmentCategoryModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EstablishmentCategoryModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'EstablishmentCategoryModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EstablishmentCategoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of EstablishmentCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EstablishmentCategoryModelImplCopyWith<_$EstablishmentCategoryModelImpl>
      get copyWith => __$$EstablishmentCategoryModelImplCopyWithImpl<
          _$EstablishmentCategoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EstablishmentCategoryModelImplToJson(
      this,
    );
  }
}

abstract class _EstablishmentCategoryModel
    implements EstablishmentCategoryModel {
  const factory _EstablishmentCategoryModel(
      {required final String id,
      required final String name}) = _$EstablishmentCategoryModelImpl;

  factory _EstablishmentCategoryModel.fromJson(Map<String, dynamic> json) =
      _$EstablishmentCategoryModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;

  /// Create a copy of EstablishmentCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EstablishmentCategoryModelImplCopyWith<_$EstablishmentCategoryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
