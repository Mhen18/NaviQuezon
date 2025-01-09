// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReportModel {
  String get municipality => throw _privateConstructorUsedError;
  String get monthYear => throw _privateConstructorUsedError;
  List<ReportRecordModel> get recordList => throw _privateConstructorUsedError;

  /// Create a copy of ReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportModelCopyWith<ReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportModelCopyWith<$Res> {
  factory $ReportModelCopyWith(
          ReportModel value, $Res Function(ReportModel) then) =
      _$ReportModelCopyWithImpl<$Res, ReportModel>;
  @useResult
  $Res call(
      {String municipality,
      String monthYear,
      List<ReportRecordModel> recordList});
}

/// @nodoc
class _$ReportModelCopyWithImpl<$Res, $Val extends ReportModel>
    implements $ReportModelCopyWith<$Res> {
  _$ReportModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? municipality = null,
    Object? monthYear = null,
    Object? recordList = null,
  }) {
    return _then(_value.copyWith(
      municipality: null == municipality
          ? _value.municipality
          : municipality // ignore: cast_nullable_to_non_nullable
              as String,
      monthYear: null == monthYear
          ? _value.monthYear
          : monthYear // ignore: cast_nullable_to_non_nullable
              as String,
      recordList: null == recordList
          ? _value.recordList
          : recordList // ignore: cast_nullable_to_non_nullable
              as List<ReportRecordModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportModelImplCopyWith<$Res>
    implements $ReportModelCopyWith<$Res> {
  factory _$$ReportModelImplCopyWith(
          _$ReportModelImpl value, $Res Function(_$ReportModelImpl) then) =
      __$$ReportModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String municipality,
      String monthYear,
      List<ReportRecordModel> recordList});
}

/// @nodoc
class __$$ReportModelImplCopyWithImpl<$Res>
    extends _$ReportModelCopyWithImpl<$Res, _$ReportModelImpl>
    implements _$$ReportModelImplCopyWith<$Res> {
  __$$ReportModelImplCopyWithImpl(
      _$ReportModelImpl _value, $Res Function(_$ReportModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? municipality = null,
    Object? monthYear = null,
    Object? recordList = null,
  }) {
    return _then(_$ReportModelImpl(
      municipality: null == municipality
          ? _value.municipality
          : municipality // ignore: cast_nullable_to_non_nullable
              as String,
      monthYear: null == monthYear
          ? _value.monthYear
          : monthYear // ignore: cast_nullable_to_non_nullable
              as String,
      recordList: null == recordList
          ? _value._recordList
          : recordList // ignore: cast_nullable_to_non_nullable
              as List<ReportRecordModel>,
    ));
  }
}

/// @nodoc

class _$ReportModelImpl implements _ReportModel {
  const _$ReportModelImpl(
      {required this.municipality,
      required this.monthYear,
      required final List<ReportRecordModel> recordList})
      : _recordList = recordList;

  @override
  final String municipality;
  @override
  final String monthYear;
  final List<ReportRecordModel> _recordList;
  @override
  List<ReportRecordModel> get recordList {
    if (_recordList is EqualUnmodifiableListView) return _recordList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recordList);
  }

  @override
  String toString() {
    return 'ReportModel(municipality: $municipality, monthYear: $monthYear, recordList: $recordList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportModelImpl &&
            (identical(other.municipality, municipality) ||
                other.municipality == municipality) &&
            (identical(other.monthYear, monthYear) ||
                other.monthYear == monthYear) &&
            const DeepCollectionEquality()
                .equals(other._recordList, _recordList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, municipality, monthYear,
      const DeepCollectionEquality().hash(_recordList));

  /// Create a copy of ReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportModelImplCopyWith<_$ReportModelImpl> get copyWith =>
      __$$ReportModelImplCopyWithImpl<_$ReportModelImpl>(this, _$identity);
}

abstract class _ReportModel implements ReportModel {
  const factory _ReportModel(
      {required final String municipality,
      required final String monthYear,
      required final List<ReportRecordModel> recordList}) = _$ReportModelImpl;

  @override
  String get municipality;
  @override
  String get monthYear;
  @override
  List<ReportRecordModel> get recordList;

  /// Create a copy of ReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportModelImplCopyWith<_$ReportModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}