// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faq_add_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FaqAddModel _$FaqAddModelFromJson(Map<String, dynamic> json) {
  return _FaqAddModel.fromJson(json);
}

/// @nodoc
mixin _$FaqAddModel {
  String get question => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;

  /// Serializes this FaqAddModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FaqAddModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FaqAddModelCopyWith<FaqAddModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaqAddModelCopyWith<$Res> {
  factory $FaqAddModelCopyWith(
          FaqAddModel value, $Res Function(FaqAddModel) then) =
      _$FaqAddModelCopyWithImpl<$Res, FaqAddModel>;
  @useResult
  $Res call({String question, String answer});
}

/// @nodoc
class _$FaqAddModelCopyWithImpl<$Res, $Val extends FaqAddModel>
    implements $FaqAddModelCopyWith<$Res> {
  _$FaqAddModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FaqAddModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? answer = null,
  }) {
    return _then(_value.copyWith(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FaqAddModelImplCopyWith<$Res>
    implements $FaqAddModelCopyWith<$Res> {
  factory _$$FaqAddModelImplCopyWith(
          _$FaqAddModelImpl value, $Res Function(_$FaqAddModelImpl) then) =
      __$$FaqAddModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String question, String answer});
}

/// @nodoc
class __$$FaqAddModelImplCopyWithImpl<$Res>
    extends _$FaqAddModelCopyWithImpl<$Res, _$FaqAddModelImpl>
    implements _$$FaqAddModelImplCopyWith<$Res> {
  __$$FaqAddModelImplCopyWithImpl(
      _$FaqAddModelImpl _value, $Res Function(_$FaqAddModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FaqAddModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? answer = null,
  }) {
    return _then(_$FaqAddModelImpl(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _$FaqAddModelImpl implements _FaqAddModel {
  const _$FaqAddModelImpl({required this.question, required this.answer});

  factory _$FaqAddModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FaqAddModelImplFromJson(json);

  @override
  final String question;
  @override
  final String answer;

  @override
  String toString() {
    return 'FaqAddModel(question: $question, answer: $answer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaqAddModelImpl &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, question, answer);

  /// Create a copy of FaqAddModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FaqAddModelImplCopyWith<_$FaqAddModelImpl> get copyWith =>
      __$$FaqAddModelImplCopyWithImpl<_$FaqAddModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FaqAddModelImplToJson(
      this,
    );
  }
}

abstract class _FaqAddModel implements FaqAddModel {
  const factory _FaqAddModel(
      {required final String question,
      required final String answer}) = _$FaqAddModelImpl;

  factory _FaqAddModel.fromJson(Map<String, dynamic> json) =
      _$FaqAddModelImpl.fromJson;

  @override
  String get question;
  @override
  String get answer;

  /// Create a copy of FaqAddModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FaqAddModelImplCopyWith<_$FaqAddModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
