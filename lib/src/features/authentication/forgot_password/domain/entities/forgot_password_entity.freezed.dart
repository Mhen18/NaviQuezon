// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ForgotPasswordEntity {
  String get email => throw _privateConstructorUsedError;
  String get otp => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  /// Create a copy of ForgotPasswordEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForgotPasswordEntityCopyWith<ForgotPasswordEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordEntityCopyWith<$Res> {
  factory $ForgotPasswordEntityCopyWith(ForgotPasswordEntity value,
          $Res Function(ForgotPasswordEntity) then) =
      _$ForgotPasswordEntityCopyWithImpl<$Res, ForgotPasswordEntity>;
  @useResult
  $Res call({String email, String otp, DateTime date});
}

/// @nodoc
class _$ForgotPasswordEntityCopyWithImpl<$Res,
        $Val extends ForgotPasswordEntity>
    implements $ForgotPasswordEntityCopyWith<$Res> {
  _$ForgotPasswordEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgotPasswordEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? otp = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForgotPasswordEntityImplCopyWith<$Res>
    implements $ForgotPasswordEntityCopyWith<$Res> {
  factory _$$ForgotPasswordEntityImplCopyWith(_$ForgotPasswordEntityImpl value,
          $Res Function(_$ForgotPasswordEntityImpl) then) =
      __$$ForgotPasswordEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String otp, DateTime date});
}

/// @nodoc
class __$$ForgotPasswordEntityImplCopyWithImpl<$Res>
    extends _$ForgotPasswordEntityCopyWithImpl<$Res, _$ForgotPasswordEntityImpl>
    implements _$$ForgotPasswordEntityImplCopyWith<$Res> {
  __$$ForgotPasswordEntityImplCopyWithImpl(_$ForgotPasswordEntityImpl _value,
      $Res Function(_$ForgotPasswordEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgotPasswordEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? otp = null,
    Object? date = null,
  }) {
    return _then(_$ForgotPasswordEntityImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$ForgotPasswordEntityImpl implements _ForgotPasswordEntity {
  const _$ForgotPasswordEntityImpl(
      {required this.email, required this.otp, required this.date});

  @override
  final String email;
  @override
  final String otp;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'ForgotPasswordEntity(email: $email, otp: $otp, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordEntityImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, otp, date);

  /// Create a copy of ForgotPasswordEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordEntityImplCopyWith<_$ForgotPasswordEntityImpl>
      get copyWith =>
          __$$ForgotPasswordEntityImplCopyWithImpl<_$ForgotPasswordEntityImpl>(
              this, _$identity);
}

abstract class _ForgotPasswordEntity implements ForgotPasswordEntity {
  const factory _ForgotPasswordEntity(
      {required final String email,
      required final String otp,
      required final DateTime date}) = _$ForgotPasswordEntityImpl;

  @override
  String get email;
  @override
  String get otp;
  @override
  DateTime get date;

  /// Create a copy of ForgotPasswordEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgotPasswordEntityImplCopyWith<_$ForgotPasswordEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
