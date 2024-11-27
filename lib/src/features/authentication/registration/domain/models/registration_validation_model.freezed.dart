// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_validation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegistrationValidationModel _$RegistrationValidationModelFromJson(
    Map<String, dynamic> json) {
  return _RegistrationValidationModell.fromJson(json);
}

/// @nodoc
mixin _$RegistrationValidationModel {
  String get idFront => throw _privateConstructorUsedError;
  String get idBack => throw _privateConstructorUsedError;
  String get permitFront => throw _privateConstructorUsedError;
  String get permitBack => throw _privateConstructorUsedError;
  String get formalPicture => throw _privateConstructorUsedError;

  /// Serializes this RegistrationValidationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegistrationValidationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegistrationValidationModelCopyWith<RegistrationValidationModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationValidationModelCopyWith<$Res> {
  factory $RegistrationValidationModelCopyWith(
          RegistrationValidationModel value,
          $Res Function(RegistrationValidationModel) then) =
      _$RegistrationValidationModelCopyWithImpl<$Res,
          RegistrationValidationModel>;
  @useResult
  $Res call(
      {String idFront,
      String idBack,
      String permitFront,
      String permitBack,
      String formalPicture});
}

/// @nodoc
class _$RegistrationValidationModelCopyWithImpl<$Res,
        $Val extends RegistrationValidationModel>
    implements $RegistrationValidationModelCopyWith<$Res> {
  _$RegistrationValidationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegistrationValidationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idFront = null,
    Object? idBack = null,
    Object? permitFront = null,
    Object? permitBack = null,
    Object? formalPicture = null,
  }) {
    return _then(_value.copyWith(
      idFront: null == idFront
          ? _value.idFront
          : idFront // ignore: cast_nullable_to_non_nullable
              as String,
      idBack: null == idBack
          ? _value.idBack
          : idBack // ignore: cast_nullable_to_non_nullable
              as String,
      permitFront: null == permitFront
          ? _value.permitFront
          : permitFront // ignore: cast_nullable_to_non_nullable
              as String,
      permitBack: null == permitBack
          ? _value.permitBack
          : permitBack // ignore: cast_nullable_to_non_nullable
              as String,
      formalPicture: null == formalPicture
          ? _value.formalPicture
          : formalPicture // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegistrationValidationModellImplCopyWith<$Res>
    implements $RegistrationValidationModelCopyWith<$Res> {
  factory _$$RegistrationValidationModellImplCopyWith(
          _$RegistrationValidationModellImpl value,
          $Res Function(_$RegistrationValidationModellImpl) then) =
      __$$RegistrationValidationModellImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idFront,
      String idBack,
      String permitFront,
      String permitBack,
      String formalPicture});
}

/// @nodoc
class __$$RegistrationValidationModellImplCopyWithImpl<$Res>
    extends _$RegistrationValidationModelCopyWithImpl<$Res,
        _$RegistrationValidationModellImpl>
    implements _$$RegistrationValidationModellImplCopyWith<$Res> {
  __$$RegistrationValidationModellImplCopyWithImpl(
      _$RegistrationValidationModellImpl _value,
      $Res Function(_$RegistrationValidationModellImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegistrationValidationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idFront = null,
    Object? idBack = null,
    Object? permitFront = null,
    Object? permitBack = null,
    Object? formalPicture = null,
  }) {
    return _then(_$RegistrationValidationModellImpl(
      idFront: null == idFront
          ? _value.idFront
          : idFront // ignore: cast_nullable_to_non_nullable
              as String,
      idBack: null == idBack
          ? _value.idBack
          : idBack // ignore: cast_nullable_to_non_nullable
              as String,
      permitFront: null == permitFront
          ? _value.permitFront
          : permitFront // ignore: cast_nullable_to_non_nullable
              as String,
      permitBack: null == permitBack
          ? _value.permitBack
          : permitBack // ignore: cast_nullable_to_non_nullable
              as String,
      formalPicture: null == formalPicture
          ? _value.formalPicture
          : formalPicture // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$RegistrationValidationModellImpl
    implements _RegistrationValidationModell {
  const _$RegistrationValidationModellImpl(
      {required this.idFront,
      required this.idBack,
      required this.permitFront,
      required this.permitBack,
      required this.formalPicture});

  factory _$RegistrationValidationModellImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RegistrationValidationModellImplFromJson(json);

  @override
  final String idFront;
  @override
  final String idBack;
  @override
  final String permitFront;
  @override
  final String permitBack;
  @override
  final String formalPicture;

  @override
  String toString() {
    return 'RegistrationValidationModel(idFront: $idFront, idBack: $idBack, permitFront: $permitFront, permitBack: $permitBack, formalPicture: $formalPicture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationValidationModellImpl &&
            (identical(other.idFront, idFront) || other.idFront == idFront) &&
            (identical(other.idBack, idBack) || other.idBack == idBack) &&
            (identical(other.permitFront, permitFront) ||
                other.permitFront == permitFront) &&
            (identical(other.permitBack, permitBack) ||
                other.permitBack == permitBack) &&
            (identical(other.formalPicture, formalPicture) ||
                other.formalPicture == formalPicture));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, idFront, idBack, permitFront, permitBack, formalPicture);

  /// Create a copy of RegistrationValidationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationValidationModellImplCopyWith<
          _$RegistrationValidationModellImpl>
      get copyWith => __$$RegistrationValidationModellImplCopyWithImpl<
          _$RegistrationValidationModellImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegistrationValidationModellImplToJson(
      this,
    );
  }
}

abstract class _RegistrationValidationModell
    implements RegistrationValidationModel {
  const factory _RegistrationValidationModell(
          {required final String idFront,
          required final String idBack,
          required final String permitFront,
          required final String permitBack,
          required final String formalPicture}) =
      _$RegistrationValidationModellImpl;

  factory _RegistrationValidationModell.fromJson(Map<String, dynamic> json) =
      _$RegistrationValidationModellImpl.fromJson;

  @override
  String get idFront;
  @override
  String get idBack;
  @override
  String get permitFront;
  @override
  String get permitBack;
  @override
  String get formalPicture;

  /// Create a copy of RegistrationValidationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegistrationValidationModellImplCopyWith<
          _$RegistrationValidationModellImpl>
      get copyWith => throw _privateConstructorUsedError;
}
