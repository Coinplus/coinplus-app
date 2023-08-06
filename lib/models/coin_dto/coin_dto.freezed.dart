// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CoinDto _$CoinDtoFromJson(Map<String, dynamic> json) {
  return _CoinDto.fromJson(json);
}

/// @nodoc
mixin _$CoinDto {
  String get id => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_price', defaultValue: 0)
  num get currentPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_change_24h', defaultValue: 0)
  num get priceChange24h => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_change_percentage_24h', defaultValue: 0)
  num get priceChangePercentage_24h => throw _privateConstructorUsedError;
  @JsonKey(name: 'high_24h', defaultValue: 0)
  num get high24h => throw _privateConstructorUsedError;
  @JsonKey(name: 'low_24h', defaultValue: 0)
  num get low24h => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoinDtoCopyWith<CoinDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinDtoCopyWith<$Res> {
  factory $CoinDtoCopyWith(CoinDto value, $Res Function(CoinDto) then) =
      _$CoinDtoCopyWithImpl<$Res, CoinDto>;
  @useResult
  $Res call(
      {String id,
      String symbol,
      String name,
      String image,
      @JsonKey(name: 'current_price', defaultValue: 0) num currentPrice,
      @JsonKey(name: 'price_change_24h', defaultValue: 0) num priceChange24h,
      @JsonKey(name: 'price_change_percentage_24h', defaultValue: 0)
      num priceChangePercentage_24h,
      @JsonKey(name: 'high_24h', defaultValue: 0) num high24h,
      @JsonKey(name: 'low_24h', defaultValue: 0) num low24h});
}

/// @nodoc
class _$CoinDtoCopyWithImpl<$Res, $Val extends CoinDto>
    implements $CoinDtoCopyWith<$Res> {
  _$CoinDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? symbol = null,
    Object? name = null,
    Object? image = null,
    Object? currentPrice = null,
    Object? priceChange24h = null,
    Object? priceChangePercentage_24h = null,
    Object? high24h = null,
    Object? low24h = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      currentPrice: null == currentPrice
          ? _value.currentPrice
          : currentPrice // ignore: cast_nullable_to_non_nullable
              as num,
      priceChange24h: null == priceChange24h
          ? _value.priceChange24h
          : priceChange24h // ignore: cast_nullable_to_non_nullable
              as num,
      priceChangePercentage_24h: null == priceChangePercentage_24h
          ? _value.priceChangePercentage_24h
          : priceChangePercentage_24h // ignore: cast_nullable_to_non_nullable
              as num,
      high24h: null == high24h
          ? _value.high24h
          : high24h // ignore: cast_nullable_to_non_nullable
              as num,
      low24h: null == low24h
          ? _value.low24h
          : low24h // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CoinDtoCopyWith<$Res> implements $CoinDtoCopyWith<$Res> {
  factory _$$_CoinDtoCopyWith(
          _$_CoinDto value, $Res Function(_$_CoinDto) then) =
      __$$_CoinDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String symbol,
      String name,
      String image,
      @JsonKey(name: 'current_price', defaultValue: 0) num currentPrice,
      @JsonKey(name: 'price_change_24h', defaultValue: 0) num priceChange24h,
      @JsonKey(name: 'price_change_percentage_24h', defaultValue: 0)
      num priceChangePercentage_24h,
      @JsonKey(name: 'high_24h', defaultValue: 0) num high24h,
      @JsonKey(name: 'low_24h', defaultValue: 0) num low24h});
}

/// @nodoc
class __$$_CoinDtoCopyWithImpl<$Res>
    extends _$CoinDtoCopyWithImpl<$Res, _$_CoinDto>
    implements _$$_CoinDtoCopyWith<$Res> {
  __$$_CoinDtoCopyWithImpl(_$_CoinDto _value, $Res Function(_$_CoinDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? symbol = null,
    Object? name = null,
    Object? image = null,
    Object? currentPrice = null,
    Object? priceChange24h = null,
    Object? priceChangePercentage_24h = null,
    Object? high24h = null,
    Object? low24h = null,
  }) {
    return _then(_$_CoinDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      currentPrice: null == currentPrice
          ? _value.currentPrice
          : currentPrice // ignore: cast_nullable_to_non_nullable
              as num,
      priceChange24h: null == priceChange24h
          ? _value.priceChange24h
          : priceChange24h // ignore: cast_nullable_to_non_nullable
              as num,
      priceChangePercentage_24h: null == priceChangePercentage_24h
          ? _value.priceChangePercentage_24h
          : priceChangePercentage_24h // ignore: cast_nullable_to_non_nullable
              as num,
      high24h: null == high24h
          ? _value.high24h
          : high24h // ignore: cast_nullable_to_non_nullable
              as num,
      low24h: null == low24h
          ? _value.low24h
          : low24h // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CoinDto with DiagnosticableTreeMixin implements _CoinDto {
  const _$_CoinDto(
      {required this.id,
      required this.symbol,
      required this.name,
      required this.image,
      @JsonKey(name: 'current_price', defaultValue: 0)
      required this.currentPrice,
      @JsonKey(name: 'price_change_24h', defaultValue: 0)
      required this.priceChange24h,
      @JsonKey(name: 'price_change_percentage_24h', defaultValue: 0)
      required this.priceChangePercentage_24h,
      @JsonKey(name: 'high_24h', defaultValue: 0) required this.high24h,
      @JsonKey(name: 'low_24h', defaultValue: 0) required this.low24h});

  factory _$_CoinDto.fromJson(Map<String, dynamic> json) =>
      _$$_CoinDtoFromJson(json);

  @override
  final String id;
  @override
  final String symbol;
  @override
  final String name;
  @override
  final String image;
  @override
  @JsonKey(name: 'current_price', defaultValue: 0)
  final num currentPrice;
  @override
  @JsonKey(name: 'price_change_24h', defaultValue: 0)
  final num priceChange24h;
  @override
  @JsonKey(name: 'price_change_percentage_24h', defaultValue: 0)
  final num priceChangePercentage_24h;
  @override
  @JsonKey(name: 'high_24h', defaultValue: 0)
  final num high24h;
  @override
  @JsonKey(name: 'low_24h', defaultValue: 0)
  final num low24h;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CoinDto(id: $id, symbol: $symbol, name: $name, image: $image, currentPrice: $currentPrice, priceChange24h: $priceChange24h, priceChangePercentage_24h: $priceChangePercentage_24h, high24h: $high24h, low24h: $low24h)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CoinDto'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('symbol', symbol))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('currentPrice', currentPrice))
      ..add(DiagnosticsProperty('priceChange24h', priceChange24h))
      ..add(DiagnosticsProperty(
          'priceChangePercentage_24h', priceChangePercentage_24h))
      ..add(DiagnosticsProperty('high24h', high24h))
      ..add(DiagnosticsProperty('low24h', low24h));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CoinDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.currentPrice, currentPrice) ||
                other.currentPrice == currentPrice) &&
            (identical(other.priceChange24h, priceChange24h) ||
                other.priceChange24h == priceChange24h) &&
            (identical(other.priceChangePercentage_24h,
                    priceChangePercentage_24h) ||
                other.priceChangePercentage_24h == priceChangePercentage_24h) &&
            (identical(other.high24h, high24h) || other.high24h == high24h) &&
            (identical(other.low24h, low24h) || other.low24h == low24h));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, symbol, name, image,
      currentPrice, priceChange24h, priceChangePercentage_24h, high24h, low24h);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CoinDtoCopyWith<_$_CoinDto> get copyWith =>
      __$$_CoinDtoCopyWithImpl<_$_CoinDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CoinDtoToJson(
      this,
    );
  }
}

abstract class _CoinDto implements CoinDto {
  const factory _CoinDto(
      {required final String id,
      required final String symbol,
      required final String name,
      required final String image,
      @JsonKey(name: 'current_price', defaultValue: 0)
      required final num currentPrice,
      @JsonKey(name: 'price_change_24h', defaultValue: 0)
      required final num priceChange24h,
      @JsonKey(name: 'price_change_percentage_24h', defaultValue: 0)
      required final num priceChangePercentage_24h,
      @JsonKey(name: 'high_24h', defaultValue: 0) required final num high24h,
      @JsonKey(name: 'low_24h', defaultValue: 0)
      required final num low24h}) = _$_CoinDto;

  factory _CoinDto.fromJson(Map<String, dynamic> json) = _$_CoinDto.fromJson;

  @override
  String get id;
  @override
  String get symbol;
  @override
  String get name;
  @override
  String get image;
  @override
  @JsonKey(name: 'current_price', defaultValue: 0)
  num get currentPrice;
  @override
  @JsonKey(name: 'price_change_24h', defaultValue: 0)
  num get priceChange24h;
  @override
  @JsonKey(name: 'price_change_percentage_24h', defaultValue: 0)
  num get priceChangePercentage_24h;
  @override
  @JsonKey(name: 'high_24h', defaultValue: 0)
  num get high24h;
  @override
  @JsonKey(name: 'low_24h', defaultValue: 0)
  num get low24h;
  @override
  @JsonKey(ignore: true)
  _$$_CoinDtoCopyWith<_$_CoinDto> get copyWith =>
      throw _privateConstructorUsedError;
}
