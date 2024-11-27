// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_email_template_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AdminEmailTemplateModel _$AdminEmailTemplateModelFromJson(
    Map<String, dynamic> json) {
  return _AdminEmailTemplateModel.fromJson(json);
}

/// @nodoc
mixin _$AdminEmailTemplateModel {
  @JsonKey(name: 'user_subject')
  String get subject => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_email')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_password')
  String get password => throw _privateConstructorUsedError;

  /// Serializes this AdminEmailTemplateModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AdminEmailTemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminEmailTemplateModelCopyWith<AdminEmailTemplateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminEmailTemplateModelCopyWith<$Res> {
  factory $AdminEmailTemplateModelCopyWith(AdminEmailTemplateModel value,
          $Res Function(AdminEmailTemplateModel) then) =
      _$AdminEmailTemplateModelCopyWithImpl<$Res, AdminEmailTemplateModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_subject') String subject,
      @JsonKey(name: 'user_email') String email,
      @JsonKey(name: 'user_name') String name,
      @JsonKey(name: 'user_password') String password});
}

/// @nodoc
class _$AdminEmailTemplateModelCopyWithImpl<$Res,
        $Val extends AdminEmailTemplateModel>
    implements $AdminEmailTemplateModelCopyWith<$Res> {
  _$AdminEmailTemplateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminEmailTemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subject = null,
    Object? email = null,
    Object? name = null,
    Object? password = null,
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
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminEmailTemplateModelImplCopyWith<$Res>
    implements $AdminEmailTemplateModelCopyWith<$Res> {
  factory _$$AdminEmailTemplateModelImplCopyWith(
          _$AdminEmailTemplateModelImpl value,
          $Res Function(_$AdminEmailTemplateModelImpl) then) =
      __$$AdminEmailTemplateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_subject') String subject,
      @JsonKey(name: 'user_email') String email,
      @JsonKey(name: 'user_name') String name,
      @JsonKey(name: 'user_password') String password});
}

/// @nodoc
class __$$AdminEmailTemplateModelImplCopyWithImpl<$Res>
    extends _$AdminEmailTemplateModelCopyWithImpl<$Res,
        _$AdminEmailTemplateModelImpl>
    implements _$$AdminEmailTemplateModelImplCopyWith<$Res> {
  __$$AdminEmailTemplateModelImplCopyWithImpl(
      _$AdminEmailTemplateModelImpl _value,
      $Res Function(_$AdminEmailTemplateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminEmailTemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subject = null,
    Object? email = null,
    Object? name = null,
    Object? password = null,
  }) {
    return _then(_$AdminEmailTemplateModelImpl(
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
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: false)
class _$AdminEmailTemplateModelImpl implements _AdminEmailTemplateModel {
  const _$AdminEmailTemplateModelImpl(
      {@JsonKey(name: 'user_subject') required this.subject,
      @JsonKey(name: 'user_email') required this.email,
      @JsonKey(name: 'user_name') required this.name,
      @JsonKey(name: 'user_password') required this.password});

  factory _$AdminEmailTemplateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminEmailTemplateModelImplFromJson(json);

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
  @JsonKey(name: 'user_password')
  final String password;

  @override
  String toString() {
    return 'AdminEmailTemplateModel(subject: $subject, email: $email, name: $name, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminEmailTemplateModelImpl &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, subject, email, name, password);

  /// Create a copy of AdminEmailTemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminEmailTemplateModelImplCopyWith<_$AdminEmailTemplateModelImpl>
      get copyWith => __$$AdminEmailTemplateModelImplCopyWithImpl<
          _$AdminEmailTemplateModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdminEmailTemplateModelImplToJson(
      this,
    );
  }
}

abstract class _AdminEmailTemplateModel implements AdminEmailTemplateModel {
  const factory _AdminEmailTemplateModel(
          {@JsonKey(name: 'user_subject') required final String subject,
          @JsonKey(name: 'user_email') required final String email,
          @JsonKey(name: 'user_name') required final String name,
          @JsonKey(name: 'user_password') required final String password}) =
      _$AdminEmailTemplateModelImpl;

  factory _AdminEmailTemplateModel.fromJson(Map<String, dynamic> json) =
      _$AdminEmailTemplateModelImpl.fromJson;

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
  @JsonKey(name: 'user_password')
  String get password;

  /// Create a copy of AdminEmailTemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminEmailTemplateModelImplCopyWith<_$AdminEmailTemplateModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
