// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'establishment_like_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EstablishmentLikeModel _$EstablishmentLikeModelFromJson(
    Map<String, dynamic> json) {
  return _EstablishmentLikeModel.fromJson(json);
}

/// @nodoc
mixin _$EstablishmentLikeModel {
  @JsonKey(name: 'like_id')
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get establishmentId => throw _privateConstructorUsedError;
  String get createdDate => throw _privateConstructorUsedError;
  String get updatedDate => throw _privateConstructorUsedError;

  /// Serializes this EstablishmentLikeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EstablishmentLikeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EstablishmentLikeModelCopyWith<EstablishmentLikeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EstablishmentLikeModelCopyWith<$Res> {
  factory $EstablishmentLikeModelCopyWith(EstablishmentLikeModel value,
          $Res Function(EstablishmentLikeModel) then) =
      _$EstablishmentLikeModelCopyWithImpl<$Res, EstablishmentLikeModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'like_id') String id,
      String userId,
      String establishmentId,
      String createdDate,
      String updatedDate});
}

/// @nodoc
class _$EstablishmentLikeModelCopyWithImpl<$Res,
        $Val extends EstablishmentLikeModel>
    implements $EstablishmentLikeModelCopyWith<$Res> {
  _$EstablishmentLikeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EstablishmentLikeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? establishmentId = null,
    Object? createdDate = null,
    Object? updatedDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      establishmentId: null == establishmentId
          ? _value.establishmentId
          : establishmentId // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      updatedDate: null == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EstablishmentLikeModelImplCopyWith<$Res>
    implements $EstablishmentLikeModelCopyWith<$Res> {
  factory _$$EstablishmentLikeModelImplCopyWith(
          _$EstablishmentLikeModelImpl value,
          $Res Function(_$EstablishmentLikeModelImpl) then) =
      __$$EstablishmentLikeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'like_id') String id,
      String userId,
      String establishmentId,
      String createdDate,
      String updatedDate});
}

/// @nodoc
class __$$EstablishmentLikeModelImplCopyWithImpl<$Res>
    extends _$EstablishmentLikeModelCopyWithImpl<$Res,
        _$EstablishmentLikeModelImpl>
    implements _$$EstablishmentLikeModelImplCopyWith<$Res> {
  __$$EstablishmentLikeModelImplCopyWithImpl(
      _$EstablishmentLikeModelImpl _value,
      $Res Function(_$EstablishmentLikeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EstablishmentLikeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? establishmentId = null,
    Object? createdDate = null,
    Object? updatedDate = null,
  }) {
    return _then(_$EstablishmentLikeModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      establishmentId: null == establishmentId
          ? _value.establishmentId
          : establishmentId // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      updatedDate: null == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$EstablishmentLikeModelImpl implements _EstablishmentLikeModel {
  const _$EstablishmentLikeModelImpl(
      {@JsonKey(name: 'like_id') required this.id,
      required this.userId,
      required this.establishmentId,
      required this.createdDate,
      required this.updatedDate});

  factory _$EstablishmentLikeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EstablishmentLikeModelImplFromJson(json);

  @override
  @JsonKey(name: 'like_id')
  final String id;
  @override
  final String userId;
  @override
  final String establishmentId;
  @override
  final String createdDate;
  @override
  final String updatedDate;

  @override
  String toString() {
    return 'EstablishmentLikeModel(id: $id, userId: $userId, establishmentId: $establishmentId, createdDate: $createdDate, updatedDate: $updatedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EstablishmentLikeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.establishmentId, establishmentId) ||
                other.establishmentId == establishmentId) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, establishmentId, createdDate, updatedDate);

  /// Create a copy of EstablishmentLikeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EstablishmentLikeModelImplCopyWith<_$EstablishmentLikeModelImpl>
      get copyWith => __$$EstablishmentLikeModelImplCopyWithImpl<
          _$EstablishmentLikeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EstablishmentLikeModelImplToJson(
      this,
    );
  }
}

abstract class _EstablishmentLikeModel implements EstablishmentLikeModel {
  const factory _EstablishmentLikeModel(
      {@JsonKey(name: 'like_id') required final String id,
      required final String userId,
      required final String establishmentId,
      required final String createdDate,
      required final String updatedDate}) = _$EstablishmentLikeModelImpl;

  factory _EstablishmentLikeModel.fromJson(Map<String, dynamic> json) =
      _$EstablishmentLikeModelImpl.fromJson;

  @override
  @JsonKey(name: 'like_id')
  String get id;
  @override
  String get userId;
  @override
  String get establishmentId;
  @override
  String get createdDate;
  @override
  String get updatedDate;

  /// Create a copy of EstablishmentLikeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EstablishmentLikeModelImplCopyWith<_$EstablishmentLikeModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
