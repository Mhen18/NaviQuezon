// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EmailModel _$EmailModelFromJson(Map<String, dynamic> json) {
  return _EmailModel.fromJson(json);
}

/// @nodoc
mixin _$EmailModel {
  @JsonKey(name: 'service_id')
  String get serviceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'template_id')
  String get templateId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  String get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'template_params')
  Map<String, dynamic> get template => throw _privateConstructorUsedError;

  /// Serializes this EmailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmailModelCopyWith<EmailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailModelCopyWith<$Res> {
  factory $EmailModelCopyWith(
          EmailModel value, $Res Function(EmailModel) then) =
      _$EmailModelCopyWithImpl<$Res, EmailModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'service_id') String serviceId,
      @JsonKey(name: 'template_id') String templateId,
      @JsonKey(name: 'user_id') String userId,
      String accessToken,
      @JsonKey(name: 'template_params') Map<String, dynamic> template});
}

/// @nodoc
class _$EmailModelCopyWithImpl<$Res, $Val extends EmailModel>
    implements $EmailModelCopyWith<$Res> {
  _$EmailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = null,
    Object? templateId = null,
    Object? userId = null,
    Object? accessToken = null,
    Object? template = null,
  }) {
    return _then(_value.copyWith(
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
      templateId: null == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      template: null == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmailModelImplCopyWith<$Res>
    implements $EmailModelCopyWith<$Res> {
  factory _$$EmailModelImplCopyWith(
          _$EmailModelImpl value, $Res Function(_$EmailModelImpl) then) =
      __$$EmailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'service_id') String serviceId,
      @JsonKey(name: 'template_id') String templateId,
      @JsonKey(name: 'user_id') String userId,
      String accessToken,
      @JsonKey(name: 'template_params') Map<String, dynamic> template});
}

/// @nodoc
class __$$EmailModelImplCopyWithImpl<$Res>
    extends _$EmailModelCopyWithImpl<$Res, _$EmailModelImpl>
    implements _$$EmailModelImplCopyWith<$Res> {
  __$$EmailModelImplCopyWithImpl(
      _$EmailModelImpl _value, $Res Function(_$EmailModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = null,
    Object? templateId = null,
    Object? userId = null,
    Object? accessToken = null,
    Object? template = null,
  }) {
    return _then(_$EmailModelImpl(
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
      templateId: null == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      template: null == template
          ? _value._template
          : template // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$EmailModelImpl implements _EmailModel {
  const _$EmailModelImpl(
      {@JsonKey(name: 'service_id') required this.serviceId,
      @JsonKey(name: 'template_id') required this.templateId,
      @JsonKey(name: 'user_id') required this.userId,
      required this.accessToken,
      @JsonKey(name: 'template_params')
      required final Map<String, dynamic> template})
      : _template = template;

  factory _$EmailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmailModelImplFromJson(json);

  @override
  @JsonKey(name: 'service_id')
  final String serviceId;
  @override
  @JsonKey(name: 'template_id')
  final String templateId;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  final String accessToken;
  final Map<String, dynamic> _template;
  @override
  @JsonKey(name: 'template_params')
  Map<String, dynamic> get template {
    if (_template is EqualUnmodifiableMapView) return _template;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_template);
  }

  @override
  String toString() {
    return 'EmailModel(serviceId: $serviceId, templateId: $templateId, userId: $userId, accessToken: $accessToken, template: $template)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailModelImpl &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            (identical(other.templateId, templateId) ||
                other.templateId == templateId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            const DeepCollectionEquality().equals(other._template, _template));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, serviceId, templateId, userId,
      accessToken, const DeepCollectionEquality().hash(_template));

  /// Create a copy of EmailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailModelImplCopyWith<_$EmailModelImpl> get copyWith =>
      __$$EmailModelImplCopyWithImpl<_$EmailModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmailModelImplToJson(
      this,
    );
  }
}

abstract class _EmailModel implements EmailModel {
  const factory _EmailModel(
      {@JsonKey(name: 'service_id') required final String serviceId,
      @JsonKey(name: 'template_id') required final String templateId,
      @JsonKey(name: 'user_id') required final String userId,
      required final String accessToken,
      @JsonKey(name: 'template_params')
      required final Map<String, dynamic> template}) = _$EmailModelImpl;

  factory _EmailModel.fromJson(Map<String, dynamic> json) =
      _$EmailModelImpl.fromJson;

  @override
  @JsonKey(name: 'service_id')
  String get serviceId;
  @override
  @JsonKey(name: 'template_id')
  String get templateId;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  String get accessToken;
  @override
  @JsonKey(name: 'template_params')
  Map<String, dynamic> get template;

  /// Create a copy of EmailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmailModelImplCopyWith<_$EmailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
