// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'establishment_itinerary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EstablishmentItineraryModel _$EstablishmentItineraryModelFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _EstablishmentItineraryModel.fromJson(json);
    case 'add':
      return _EstablishmentItineraryAddModel.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'EstablishmentItineraryModel',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$EstablishmentItineraryModel {
  String get establishmentId => throw _privateConstructorUsedError;
  Object? get createdDate => throw _privateConstructorUsedError;
  Object? get updatedDate => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String establishmentId, num createdDate, num updatedDate)
        $default, {
    required TResult Function(
            String establishmentId,
            Map<String, dynamic>? createdDate,
            Map<String, dynamic>? updatedDate)
        add,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String establishmentId, num createdDate, num updatedDate)?
        $default, {
    TResult? Function(String establishmentId, Map<String, dynamic>? createdDate,
            Map<String, dynamic>? updatedDate)?
        add,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String establishmentId, num createdDate, num updatedDate)?
        $default, {
    TResult Function(String establishmentId, Map<String, dynamic>? createdDate,
            Map<String, dynamic>? updatedDate)?
        add,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_EstablishmentItineraryModel value) $default, {
    required TResult Function(_EstablishmentItineraryAddModel value) add,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_EstablishmentItineraryModel value)? $default, {
    TResult? Function(_EstablishmentItineraryAddModel value)? add,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_EstablishmentItineraryModel value)? $default, {
    TResult Function(_EstablishmentItineraryAddModel value)? add,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this EstablishmentItineraryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EstablishmentItineraryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EstablishmentItineraryModelCopyWith<EstablishmentItineraryModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EstablishmentItineraryModelCopyWith<$Res> {
  factory $EstablishmentItineraryModelCopyWith(
          EstablishmentItineraryModel value,
          $Res Function(EstablishmentItineraryModel) then) =
      _$EstablishmentItineraryModelCopyWithImpl<$Res,
          EstablishmentItineraryModel>;
  @useResult
  $Res call({String establishmentId});
}

/// @nodoc
class _$EstablishmentItineraryModelCopyWithImpl<$Res,
        $Val extends EstablishmentItineraryModel>
    implements $EstablishmentItineraryModelCopyWith<$Res> {
  _$EstablishmentItineraryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EstablishmentItineraryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? establishmentId = null,
  }) {
    return _then(_value.copyWith(
      establishmentId: null == establishmentId
          ? _value.establishmentId
          : establishmentId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EstablishmentItineraryModelImplCopyWith<$Res>
    implements $EstablishmentItineraryModelCopyWith<$Res> {
  factory _$$EstablishmentItineraryModelImplCopyWith(
          _$EstablishmentItineraryModelImpl value,
          $Res Function(_$EstablishmentItineraryModelImpl) then) =
      __$$EstablishmentItineraryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String establishmentId, num createdDate, num updatedDate});
}

/// @nodoc
class __$$EstablishmentItineraryModelImplCopyWithImpl<$Res>
    extends _$EstablishmentItineraryModelCopyWithImpl<$Res,
        _$EstablishmentItineraryModelImpl>
    implements _$$EstablishmentItineraryModelImplCopyWith<$Res> {
  __$$EstablishmentItineraryModelImplCopyWithImpl(
      _$EstablishmentItineraryModelImpl _value,
      $Res Function(_$EstablishmentItineraryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EstablishmentItineraryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? establishmentId = null,
    Object? createdDate = null,
    Object? updatedDate = null,
  }) {
    return _then(_$EstablishmentItineraryModelImpl(
      establishmentId: null == establishmentId
          ? _value.establishmentId
          : establishmentId // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as num,
      updatedDate: null == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$EstablishmentItineraryModelImpl
    implements _EstablishmentItineraryModel {
  const _$EstablishmentItineraryModelImpl(
      {required this.establishmentId,
      required this.createdDate,
      required this.updatedDate,
      final String? $type})
      : $type = $type ?? 'default';

  factory _$EstablishmentItineraryModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EstablishmentItineraryModelImplFromJson(json);

  @override
  final String establishmentId;
  @override
  final num createdDate;
  @override
  final num updatedDate;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'EstablishmentItineraryModel(establishmentId: $establishmentId, createdDate: $createdDate, updatedDate: $updatedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EstablishmentItineraryModelImpl &&
            (identical(other.establishmentId, establishmentId) ||
                other.establishmentId == establishmentId) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, establishmentId, createdDate, updatedDate);

  /// Create a copy of EstablishmentItineraryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EstablishmentItineraryModelImplCopyWith<_$EstablishmentItineraryModelImpl>
      get copyWith => __$$EstablishmentItineraryModelImplCopyWithImpl<
          _$EstablishmentItineraryModelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String establishmentId, num createdDate, num updatedDate)
        $default, {
    required TResult Function(
            String establishmentId,
            Map<String, dynamic>? createdDate,
            Map<String, dynamic>? updatedDate)
        add,
  }) {
    return $default(establishmentId, createdDate, updatedDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String establishmentId, num createdDate, num updatedDate)?
        $default, {
    TResult? Function(String establishmentId, Map<String, dynamic>? createdDate,
            Map<String, dynamic>? updatedDate)?
        add,
  }) {
    return $default?.call(establishmentId, createdDate, updatedDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String establishmentId, num createdDate, num updatedDate)?
        $default, {
    TResult Function(String establishmentId, Map<String, dynamic>? createdDate,
            Map<String, dynamic>? updatedDate)?
        add,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(establishmentId, createdDate, updatedDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_EstablishmentItineraryModel value) $default, {
    required TResult Function(_EstablishmentItineraryAddModel value) add,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_EstablishmentItineraryModel value)? $default, {
    TResult? Function(_EstablishmentItineraryAddModel value)? add,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_EstablishmentItineraryModel value)? $default, {
    TResult Function(_EstablishmentItineraryAddModel value)? add,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EstablishmentItineraryModelImplToJson(
      this,
    );
  }
}

abstract class _EstablishmentItineraryModel
    implements EstablishmentItineraryModel {
  const factory _EstablishmentItineraryModel(
      {required final String establishmentId,
      required final num createdDate,
      required final num updatedDate}) = _$EstablishmentItineraryModelImpl;

  factory _EstablishmentItineraryModel.fromJson(Map<String, dynamic> json) =
      _$EstablishmentItineraryModelImpl.fromJson;

  @override
  String get establishmentId;
  @override
  num get createdDate;
  @override
  num get updatedDate;

  /// Create a copy of EstablishmentItineraryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EstablishmentItineraryModelImplCopyWith<_$EstablishmentItineraryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EstablishmentItineraryAddModelImplCopyWith<$Res>
    implements $EstablishmentItineraryModelCopyWith<$Res> {
  factory _$$EstablishmentItineraryAddModelImplCopyWith(
          _$EstablishmentItineraryAddModelImpl value,
          $Res Function(_$EstablishmentItineraryAddModelImpl) then) =
      __$$EstablishmentItineraryAddModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String establishmentId,
      Map<String, dynamic>? createdDate,
      Map<String, dynamic>? updatedDate});
}

/// @nodoc
class __$$EstablishmentItineraryAddModelImplCopyWithImpl<$Res>
    extends _$EstablishmentItineraryModelCopyWithImpl<$Res,
        _$EstablishmentItineraryAddModelImpl>
    implements _$$EstablishmentItineraryAddModelImplCopyWith<$Res> {
  __$$EstablishmentItineraryAddModelImplCopyWithImpl(
      _$EstablishmentItineraryAddModelImpl _value,
      $Res Function(_$EstablishmentItineraryAddModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EstablishmentItineraryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? establishmentId = null,
    Object? createdDate = freezed,
    Object? updatedDate = freezed,
  }) {
    return _then(_$EstablishmentItineraryAddModelImpl(
      establishmentId: null == establishmentId
          ? _value.establishmentId
          : establishmentId // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$EstablishmentItineraryAddModelImpl
    implements _EstablishmentItineraryAddModel {
  const _$EstablishmentItineraryAddModelImpl(
      {required this.establishmentId,
      final Map<String, dynamic>? createdDate,
      final Map<String, dynamic>? updatedDate,
      final String? $type})
      : _createdDate = createdDate,
        _updatedDate = updatedDate,
        $type = $type ?? 'add';

  factory _$EstablishmentItineraryAddModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EstablishmentItineraryAddModelImplFromJson(json);

  @override
  final String establishmentId;
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
    return 'EstablishmentItineraryModel.add(establishmentId: $establishmentId, createdDate: $createdDate, updatedDate: $updatedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EstablishmentItineraryAddModelImpl &&
            (identical(other.establishmentId, establishmentId) ||
                other.establishmentId == establishmentId) &&
            const DeepCollectionEquality()
                .equals(other._createdDate, _createdDate) &&
            const DeepCollectionEquality()
                .equals(other._updatedDate, _updatedDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      establishmentId,
      const DeepCollectionEquality().hash(_createdDate),
      const DeepCollectionEquality().hash(_updatedDate));

  /// Create a copy of EstablishmentItineraryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EstablishmentItineraryAddModelImplCopyWith<
          _$EstablishmentItineraryAddModelImpl>
      get copyWith => __$$EstablishmentItineraryAddModelImplCopyWithImpl<
          _$EstablishmentItineraryAddModelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String establishmentId, num createdDate, num updatedDate)
        $default, {
    required TResult Function(
            String establishmentId,
            Map<String, dynamic>? createdDate,
            Map<String, dynamic>? updatedDate)
        add,
  }) {
    return add(establishmentId, createdDate, updatedDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String establishmentId, num createdDate, num updatedDate)?
        $default, {
    TResult? Function(String establishmentId, Map<String, dynamic>? createdDate,
            Map<String, dynamic>? updatedDate)?
        add,
  }) {
    return add?.call(establishmentId, createdDate, updatedDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String establishmentId, num createdDate, num updatedDate)?
        $default, {
    TResult Function(String establishmentId, Map<String, dynamic>? createdDate,
            Map<String, dynamic>? updatedDate)?
        add,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(establishmentId, createdDate, updatedDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_EstablishmentItineraryModel value) $default, {
    required TResult Function(_EstablishmentItineraryAddModel value) add,
  }) {
    return add(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_EstablishmentItineraryModel value)? $default, {
    TResult? Function(_EstablishmentItineraryAddModel value)? add,
  }) {
    return add?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_EstablishmentItineraryModel value)? $default, {
    TResult Function(_EstablishmentItineraryAddModel value)? add,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EstablishmentItineraryAddModelImplToJson(
      this,
    );
  }
}

abstract class _EstablishmentItineraryAddModel
    implements EstablishmentItineraryModel {
  const factory _EstablishmentItineraryAddModel(
          {required final String establishmentId,
          final Map<String, dynamic>? createdDate,
          final Map<String, dynamic>? updatedDate}) =
      _$EstablishmentItineraryAddModelImpl;

  factory _EstablishmentItineraryAddModel.fromJson(Map<String, dynamic> json) =
      _$EstablishmentItineraryAddModelImpl.fromJson;

  @override
  String get establishmentId;
  @override
  Map<String, dynamic>? get createdDate;
  @override
  Map<String, dynamic>? get updatedDate;

  /// Create a copy of EstablishmentItineraryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EstablishmentItineraryAddModelImplCopyWith<
          _$EstablishmentItineraryAddModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
