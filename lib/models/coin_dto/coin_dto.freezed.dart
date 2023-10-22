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
  String get icon => throw _privateConstructorUsedError;
  @JsonKey(name: 'price', defaultValue: 0)
  num get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'priceChange1d', defaultValue: 0)
  num get priceChange1d => throw _privateConstructorUsedError;

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
      String icon,
      @JsonKey(name: 'price', defaultValue: 0) num price,
      @JsonKey(name: 'priceChange1d', defaultValue: 0) num priceChange1d});
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
    Object? icon = null,
    Object? price = null,
    Object? priceChange1d = null,
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
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num,
      priceChange1d: null == priceChange1d
          ? _value.priceChange1d
          : priceChange1d // ignore: cast_nullable_to_non_nullable
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
      String icon,
      @JsonKey(name: 'price', defaultValue: 0) num price,
      @JsonKey(name: 'priceChange1d', defaultValue: 0) num priceChange1d});
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
    Object? icon = null,
    Object? price = null,
    Object? priceChange1d = null,
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
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num,
      priceChange1d: null == priceChange1d
          ? _value.priceChange1d
          : priceChange1d // ignore: cast_nullable_to_non_nullable
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
      required this.icon,
      @JsonKey(name: 'price', defaultValue: 0) required this.price,
      @JsonKey(name: 'priceChange1d', defaultValue: 0)
      required this.priceChange1d});

  factory _$_CoinDto.fromJson(Map<String, dynamic> json) =>
      _$$_CoinDtoFromJson(json);

  @override
  final String id;
  @override
  final String symbol;
  @override
  final String name;
  @override
  final String icon;
  @override
  @JsonKey(name: 'price', defaultValue: 0)
  final num price;
  @override
  @JsonKey(name: 'priceChange1d', defaultValue: 0)
  final num priceChange1d;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CoinDto(id: $id, symbol: $symbol, name: $name, icon: $icon, price: $price, priceChange1d: $priceChange1d)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CoinDto'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('symbol', symbol))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('icon', icon))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('priceChange1d', priceChange1d));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CoinDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.priceChange1d, priceChange1d) ||
                other.priceChange1d == priceChange1d));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, symbol, name, icon, price, priceChange1d);

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
      required final String icon,
      @JsonKey(name: 'price', defaultValue: 0) required final num price,
      @JsonKey(name: 'priceChange1d', defaultValue: 0)
      required final num priceChange1d}) = _$_CoinDto;

  factory _CoinDto.fromJson(Map<String, dynamic> json) = _$_CoinDto.fromJson;

  @override
  String get id;
  @override
  String get symbol;
  @override
  String get name;
  @override
  String get icon;
  @override
  @JsonKey(name: 'price', defaultValue: 0)
  num get price;
  @override
  @JsonKey(name: 'priceChange1d', defaultValue: 0)
  num get priceChange1d;
  @override
  @JsonKey(ignore: true)
  _$$_CoinDtoCopyWith<_$_CoinDto> get copyWith =>
      throw _privateConstructorUsedError;
}
