// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_add_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AdminAddModel _$AdminAddModelFromJson(Map<String, dynamic> json) {
  return _AdminAddModel.fromJson(json);
}

/// @nodoc
mixin _$AdminAddModel {
  String get municipality => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;

  /// Serializes this AdminAddModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AdminAddModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminAddModelCopyWith<AdminAddModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminAddModelCopyWith<$Res> {
  factory $AdminAddModelCopyWith(
          AdminAddModel value, $Res Function(AdminAddModel) then) =
      _$AdminAddModelCopyWithImpl<$Res, AdminAddModel>;
  @useResult
  $Res call(
      {String municipality,
      String email,
      String firstName,
      String lastName,
      String phone});
}

/// @nodoc
class _$AdminAddModelCopyWithImpl<$Res, $Val extends AdminAddModel>
    implements $AdminAddModelCopyWith<$Res> {
  _$AdminAddModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminAddModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? municipality = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? phone = null,
  }) {
    return _then(_value.copyWith(
      municipality: null == municipality
          ? _value.municipality
          : municipality // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminAddModelImplCopyWith<$Res>
    implements $AdminAddModelCopyWith<$Res> {
  factory _$$AdminAddModelImplCopyWith(
          _$AdminAddModelImpl value, $Res Function(_$AdminAddModelImpl) then) =
      __$$AdminAddModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String municipality,
      String email,
      String firstName,
      String lastName,
      String phone});
}

/// @nodoc
class __$$AdminAddModelImplCopyWithImpl<$Res>
    extends _$AdminAddModelCopyWithImpl<$Res, _$AdminAddModelImpl>
    implements _$$AdminAddModelImplCopyWith<$Res> {
  __$$AdminAddModelImplCopyWithImpl(
      _$AdminAddModelImpl _value, $Res Function(_$AdminAddModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminAddModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? municipality = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? phone = null,
  }) {
    return _then(_$AdminAddModelImpl(
      municipality: null == municipality
          ? _value.municipality
          : municipality // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$AdminAddModelImpl implements _AdminAddModel {
  const _$AdminAddModelImpl(
      {required this.municipality,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.phone});

  factory _$AdminAddModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminAddModelImplFromJson(json);

  @override
  final String municipality;
  @override
  final String email;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String phone;

  @override
  String toString() {
    return 'AdminAddModel(municipality: $municipality, email: $email, firstName: $firstName, lastName: $lastName, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminAddModelImpl &&
            (identical(other.municipality, municipality) ||
                other.municipality == municipality) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, municipality, email, firstName, lastName, phone);

  /// Create a copy of AdminAddModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminAddModelImplCopyWith<_$AdminAddModelImpl> get copyWith =>
      __$$AdminAddModelImplCopyWithImpl<_$AdminAddModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdminAddModelImplToJson(
      this,
    );
  }
}

abstract class _AdminAddModel implements AdminAddModel {
  const factory _AdminAddModel(
      {required final String municipality,
      required final String email,
      required final String firstName,
      required final String lastName,
      required final String phone}) = _$AdminAddModelImpl;

  factory _AdminAddModel.fromJson(Map<String, dynamic> json) =
      _$AdminAddModelImpl.fromJson;

  @override
  String get municipality;
  @override
  String get email;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get phone;

  /// Create a copy of AdminAddModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminAddModelImplCopyWith<_$AdminAddModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
