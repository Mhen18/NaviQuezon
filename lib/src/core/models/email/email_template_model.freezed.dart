// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_template_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EmailTemplateModel _$EmailTemplateModelFromJson(Map<String, dynamic> json) {
  return _EmailTemplateModel.fromJson(json);
}

/// @nodoc
mixin _$EmailTemplateModel {
  @JsonKey(name: 'user_subject')
  String get subject => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_email')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_name')
  String get name => throw _privateConstructorUsedError;
  String get resetOtp => throw _privateConstructorUsedError;

  /// Serializes this EmailTemplateModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmailTemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmailTemplateModelCopyWith<EmailTemplateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailTemplateModelCopyWith<$Res> {
  factory $EmailTemplateModelCopyWith(
          EmailTemplateModel value, $Res Function(EmailTemplateModel) then) =
      _$EmailTemplateModelCopyWithImpl<$Res, EmailTemplateModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_subject') String subject,
      @JsonKey(name: 'user_email') String email,
      @JsonKey(name: 'user_name') String name,
      String resetOtp});
}

/// @nodoc
class _$EmailTemplateModelCopyWithImpl<$Res, $Val extends EmailTemplateModel>
    implements $EmailTemplateModelCopyWith<$Res> {
  _$EmailTemplateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmailTemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subject = null,
    Object? email = null,
    Object? name = null,
    Object? resetOtp = null,
  }) {
    return _then(_value.copyWith(
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      resetOtp: null == resetOtp
          ? _value.resetOtp
          : resetOtp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmailTemplateModelImplCopyWith<$Res>
    implements $EmailTemplateModelCopyWith<$Res> {
  factory _$$EmailTemplateModelImplCopyWith(_$EmailTemplateModelImpl value,
          $Res Function(_$EmailTemplateModelImpl) then) =
      __$$EmailTemplateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_subject') String subject,
      @JsonKey(name: 'user_email') String email,
      @JsonKey(name: 'user_name') String name,
      String resetOtp});
}

/// @nodoc
class __$$EmailTemplateModelImplCopyWithImpl<$Res>
    extends _$EmailTemplateModelCopyWithImpl<$Res, _$EmailTemplateModelImpl>
    implements _$$EmailTemplateModelImplCopyWith<$Res> {
  __$$EmailTemplateModelImplCopyWithImpl(_$EmailTemplateModelImpl _value,
      $Res Function(_$EmailTemplateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmailTemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subject = null,
    Object? email = null,
    Object? name = null,
    Object? resetOtp = null,
  }) {
    return _then(_$EmailTemplateModelImpl(
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      resetOtp: null == resetOtp
          ? _value.resetOtp
          : resetOtp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _$EmailTemplateModelImpl implements _EmailTemplateModel {
  const _$EmailTemplateModelImpl(
      {@JsonKey(name: 'user_subject') required this.subject,
      @JsonKey(name: 'user_email') required this.email,
      @JsonKey(name: 'user_name') required this.name,
      required this.resetOtp});

  factory _$EmailTemplateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmailTemplateModelImplFromJson(json);

  @override
  @JsonKey(name: 'user_subject')
  final String subject;
  @override
  @JsonKey(name: 'user_email')
  final String email;
  @override
  @JsonKey(name: 'user_name')
  final String name;
  @override
  final String resetOtp;

  @override
  String toString() {
    return 'EmailTemplateModel(subject: $subject, email: $email, name: $name, resetOtp: $resetOtp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailTemplateModelImpl &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.resetOtp, resetOtp) ||
                other.resetOtp == resetOtp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, subject, email, name, resetOtp);

  /// Create a copy of EmailTemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailTemplateModelImplCopyWith<_$EmailTemplateModelImpl> get copyWith =>
      __$$EmailTemplateModelImplCopyWithImpl<_$EmailTemplateModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmailTemplateModelImplToJson(
      this,
    );
  }
}

abstract class _EmailTemplateModel implements EmailTemplateModel {
  const factory _EmailTemplateModel(
      {@JsonKey(name: 'user_subject') required final String subject,
      @JsonKey(name: 'user_email') required final String email,
      @JsonKey(name: 'user_name') required final String name,
      required final String resetOtp}) = _$EmailTemplateModelImpl;

  factory _EmailTemplateModel.fromJson(Map<String, dynamic> json) =
      _$EmailTemplateModelImpl.fromJson;

  @override
  @JsonKey(name: 'user_subject')
  String get subject;
  @override
  @JsonKey(name: 'user_email')
  String get email;
  @override
  @JsonKey(name: 'user_name')
  String get name;
  @override
  String get resetOtp;

  /// Create a copy of EmailTemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmailTemplateModelImplCopyWith<_$EmailTemplateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
