// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'market_cap_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MarketCapDto _$MarketCapDtoFromJson(Map<String, dynamic> json) {
  return _MarketCapDto.fromJson(json);
}

/// @nodoc
mixin _$MarketCapDto {
  double get marketCap => throw _privateConstructorUsedError;
  double get volume => throw _privateConstructorUsedError;
  double get btcDominance => throw _privateConstructorUsedError;
  double get marketCapChange => throw _privateConstructorUsedError;
  double get volumeChange => throw _privateConstructorUsedError;
  double get btcDominanceChange => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarketCapDtoCopyWith<MarketCapDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketCapDtoCopyWith<$Res> {
  factory $MarketCapDtoCopyWith(MarketCapDto value, $Res Function(MarketCapDto) then) =
      _$MarketCapDtoCopyWithImpl<$Res, MarketCapDto>;
  @useResult
  $Res call(
      {double marketCap,
      double volume,
      double btcDominance,
      double marketCapChange,
      double volumeChange,
      double btcDominanceChange});
}

/// @nodoc
class _$MarketCapDtoCopyWithImpl<$Res, $Val extends MarketCapDto> implements $MarketCapDtoCopyWith<$Res> {
  _$MarketCapDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marketCap = null,
    Object? volume = null,
    Object? btcDominance = null,
    Object? marketCapChange = null,
    Object? volumeChange = null,
    Object? btcDominanceChange = null,
  }) {
    return _then(_value.copyWith(
      marketCap: null == marketCap
          ? _value.marketCap
          : marketCap // ignore: cast_nullable_to_non_nullable
              as double,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double,
      btcDominance: null == btcDominance
          ? _value.btcDominance
          : btcDominance // ignore: cast_nullable_to_non_nullable
              as double,
      marketCapChange: null == marketCapChange
          ? _value.marketCapChange
          : marketCapChange // ignore: cast_nullable_to_non_nullable
              as double,
      volumeChange: null == volumeChange
          ? _value.volumeChange
          : volumeChange // ignore: cast_nullable_to_non_nullable
              as double,
      btcDominanceChange: null == btcDominanceChange
          ? _value.btcDominanceChange
          : btcDominanceChange // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarketCapDtoImplCopyWith<$Res> implements $MarketCapDtoCopyWith<$Res> {
  factory _$$MarketCapDtoImplCopyWith(_$MarketCapDtoImpl value, $Res Function(_$MarketCapDtoImpl) then) =
      __$$MarketCapDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double marketCap,
      double volume,
      double btcDominance,
      double marketCapChange,
      double volumeChange,
      double btcDominanceChange});
}

/// @nodoc
class __$$MarketCapDtoImplCopyWithImpl<$Res> extends _$MarketCapDtoCopyWithImpl<$Res, _$MarketCapDtoImpl>
    implements _$$MarketCapDtoImplCopyWith<$Res> {
  __$$MarketCapDtoImplCopyWithImpl(_$MarketCapDtoImpl _value, $Res Function(_$MarketCapDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marketCap = null,
    Object? volume = null,
    Object? btcDominance = null,
    Object? marketCapChange = null,
    Object? volumeChange = null,
    Object? btcDominanceChange = null,
  }) {
    return _then(_$MarketCapDtoImpl(
      marketCap: null == marketCap
          ? _value.marketCap
          : marketCap // ignore: cast_nullable_to_non_nullable
              as double,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double,
      btcDominance: null == btcDominance
          ? _value.btcDominance
          : btcDominance // ignore: cast_nullable_to_non_nullable
              as double,
      marketCapChange: null == marketCapChange
          ? _value.marketCapChange
          : marketCapChange // ignore: cast_nullable_to_non_nullable
              as double,
      volumeChange: null == volumeChange
          ? _value.volumeChange
          : volumeChange // ignore: cast_nullable_to_non_nullable
              as double,
      btcDominanceChange: null == btcDominanceChange
          ? _value.btcDominanceChange
          : btcDominanceChange // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MarketCapDtoImpl with DiagnosticableTreeMixin implements _MarketCapDto {
  const _$MarketCapDtoImpl(
      {required this.marketCap,
      required this.volume,
      required this.btcDominance,
      required this.marketCapChange,
      required this.volumeChange,
      required this.btcDominanceChange});

  factory _$MarketCapDtoImpl.fromJson(Map<String, dynamic> json) => _$$MarketCapDtoImplFromJson(json);

  @override
  final double marketCap;
  @override
  final double volume;
  @override
  final double btcDominance;
  @override
  final double marketCapChange;
  @override
  final double volumeChange;
  @override
  final double btcDominanceChange;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MarketCapDto(marketCap: $marketCap, volume: $volume, btcDominance: $btcDominance, marketCapChange: $marketCapChange, volumeChange: $volumeChange, btcDominanceChange: $btcDominanceChange)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MarketCapDto'))
      ..add(DiagnosticsProperty('marketCap', marketCap))
      ..add(DiagnosticsProperty('volume', volume))
      ..add(DiagnosticsProperty('btcDominance', btcDominance))
      ..add(DiagnosticsProperty('marketCapChange', marketCapChange))
      ..add(DiagnosticsProperty('volumeChange', volumeChange))
      ..add(DiagnosticsProperty('btcDominanceChange', btcDominanceChange));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarketCapDtoImpl &&
            (identical(other.marketCap, marketCap) || other.marketCap == marketCap) &&
            (identical(other.volume, volume) || other.volume == volume) &&
            (identical(other.btcDominance, btcDominance) || other.btcDominance == btcDominance) &&
            (identical(other.marketCapChange, marketCapChange) || other.marketCapChange == marketCapChange) &&
            (identical(other.volumeChange, volumeChange) || other.volumeChange == volumeChange) &&
            (identical(other.btcDominanceChange, btcDominanceChange) ||
                other.btcDominanceChange == btcDominanceChange));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, marketCap, volume, btcDominance, marketCapChange, volumeChange, btcDominanceChange);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarketCapDtoImplCopyWith<_$MarketCapDtoImpl> get copyWith =>
      __$$MarketCapDtoImplCopyWithImpl<_$MarketCapDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarketCapDtoImplToJson(
      this,
    );
  }
}

abstract class _MarketCapDto implements MarketCapDto {
  const factory _MarketCapDto(
      {required final double marketCap,
      required final double volume,
      required final double btcDominance,
      required final double marketCapChange,
      required final double volumeChange,
      required final double btcDominanceChange}) = _$MarketCapDtoImpl;

  factory _MarketCapDto.fromJson(Map<String, dynamic> json) = _$MarketCapDtoImpl.fromJson;

  @override
  double get marketCap;
  @override
  double get volume;
  @override
  double get btcDominance;
  @override
  double get marketCapChange;
  @override
  double get volumeChange;
  @override
  double get btcDominanceChange;
  @override
  @JsonKey(ignore: true)
  _$$MarketCapDtoImplCopyWith<_$MarketCapDtoImpl> get copyWith => throw _privateConstructorUsedError;
}
