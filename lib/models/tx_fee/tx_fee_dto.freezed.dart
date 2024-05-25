// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tx_fee_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TxFeeDto _$TxFeeDtoFromJson(Map<String, dynamic> json) {
  return _TxFeeDto.fromJson(json);
}

/// @nodoc
mixin _$TxFeeDto {
  int get fastestFee => throw _privateConstructorUsedError;
  int get halfHourFee => throw _privateConstructorUsedError;
  int get hourFee => throw _privateConstructorUsedError;
  int get economyFee => throw _privateConstructorUsedError;
  int get minimumFee => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TxFeeDtoCopyWith<TxFeeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TxFeeDtoCopyWith<$Res> {
  factory $TxFeeDtoCopyWith(TxFeeDto value, $Res Function(TxFeeDto) then) =
      _$TxFeeDtoCopyWithImpl<$Res, TxFeeDto>;
  @useResult
  $Res call(
      {int fastestFee,
      int halfHourFee,
      int hourFee,
      int economyFee,
      int minimumFee});
}

/// @nodoc
class _$TxFeeDtoCopyWithImpl<$Res, $Val extends TxFeeDto>
    implements $TxFeeDtoCopyWith<$Res> {
  _$TxFeeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fastestFee = null,
    Object? halfHourFee = null,
    Object? hourFee = null,
    Object? economyFee = null,
    Object? minimumFee = null,
  }) {
    return _then(_value.copyWith(
      fastestFee: null == fastestFee
          ? _value.fastestFee
          : fastestFee // ignore: cast_nullable_to_non_nullable
              as int,
      halfHourFee: null == halfHourFee
          ? _value.halfHourFee
          : halfHourFee // ignore: cast_nullable_to_non_nullable
              as int,
      hourFee: null == hourFee
          ? _value.hourFee
          : hourFee // ignore: cast_nullable_to_non_nullable
              as int,
      economyFee: null == economyFee
          ? _value.economyFee
          : economyFee // ignore: cast_nullable_to_non_nullable
              as int,
      minimumFee: null == minimumFee
          ? _value.minimumFee
          : minimumFee // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TxFeeDtoImplCopyWith<$Res>
    implements $TxFeeDtoCopyWith<$Res> {
  factory _$$TxFeeDtoImplCopyWith(
          _$TxFeeDtoImpl value, $Res Function(_$TxFeeDtoImpl) then) =
      __$$TxFeeDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int fastestFee,
      int halfHourFee,
      int hourFee,
      int economyFee,
      int minimumFee});
}

/// @nodoc
class __$$TxFeeDtoImplCopyWithImpl<$Res>
    extends _$TxFeeDtoCopyWithImpl<$Res, _$TxFeeDtoImpl>
    implements _$$TxFeeDtoImplCopyWith<$Res> {
  __$$TxFeeDtoImplCopyWithImpl(
      _$TxFeeDtoImpl _value, $Res Function(_$TxFeeDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fastestFee = null,
    Object? halfHourFee = null,
    Object? hourFee = null,
    Object? economyFee = null,
    Object? minimumFee = null,
  }) {
    return _then(_$TxFeeDtoImpl(
      fastestFee: null == fastestFee
          ? _value.fastestFee
          : fastestFee // ignore: cast_nullable_to_non_nullable
              as int,
      halfHourFee: null == halfHourFee
          ? _value.halfHourFee
          : halfHourFee // ignore: cast_nullable_to_non_nullable
              as int,
      hourFee: null == hourFee
          ? _value.hourFee
          : hourFee // ignore: cast_nullable_to_non_nullable
              as int,
      economyFee: null == economyFee
          ? _value.economyFee
          : economyFee // ignore: cast_nullable_to_non_nullable
              as int,
      minimumFee: null == minimumFee
          ? _value.minimumFee
          : minimumFee // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TxFeeDtoImpl implements _TxFeeDto {
  const _$TxFeeDtoImpl(
      {this.fastestFee = 0,
      this.halfHourFee = 0,
      this.hourFee = 0,
      this.economyFee = 0,
      this.minimumFee = 0});

  factory _$TxFeeDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TxFeeDtoImplFromJson(json);

  @override
  @JsonKey()
  final int fastestFee;
  @override
  @JsonKey()
  final int halfHourFee;
  @override
  @JsonKey()
  final int hourFee;
  @override
  @JsonKey()
  final int economyFee;
  @override
  @JsonKey()
  final int minimumFee;

  @override
  String toString() {
    return 'TxFeeDto(fastestFee: $fastestFee, halfHourFee: $halfHourFee, hourFee: $hourFee, economyFee: $economyFee, minimumFee: $minimumFee)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TxFeeDtoImpl &&
            (identical(other.fastestFee, fastestFee) ||
                other.fastestFee == fastestFee) &&
            (identical(other.halfHourFee, halfHourFee) ||
                other.halfHourFee == halfHourFee) &&
            (identical(other.hourFee, hourFee) || other.hourFee == hourFee) &&
            (identical(other.economyFee, economyFee) ||
                other.economyFee == economyFee) &&
            (identical(other.minimumFee, minimumFee) ||
                other.minimumFee == minimumFee));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, fastestFee, halfHourFee, hourFee, economyFee, minimumFee);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TxFeeDtoImplCopyWith<_$TxFeeDtoImpl> get copyWith =>
      __$$TxFeeDtoImplCopyWithImpl<_$TxFeeDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TxFeeDtoImplToJson(
      this,
    );
  }
}

abstract class _TxFeeDto implements TxFeeDto {
  const factory _TxFeeDto(
      {final int fastestFee,
      final int halfHourFee,
      final int hourFee,
      final int economyFee,
      final int minimumFee}) = _$TxFeeDtoImpl;

  factory _TxFeeDto.fromJson(Map<String, dynamic> json) =
      _$TxFeeDtoImpl.fromJson;

  @override
  int get fastestFee;
  @override
  int get halfHourFee;
  @override
  int get hourFee;
  @override
  int get economyFee;
  @override
  int get minimumFee;
  @override
  @JsonKey(ignore: true)
  _$$TxFeeDtoImplCopyWith<_$TxFeeDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
