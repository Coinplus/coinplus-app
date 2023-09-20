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
  List<Coin> get coins => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoinDtoCopyWith<CoinDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinDtoCopyWith<$Res> {
  factory $CoinDtoCopyWith(CoinDto value, $Res Function(CoinDto) then) =
      _$CoinDtoCopyWithImpl<$Res, CoinDto>;
  @useResult
  $Res call({List<Coin> coins});
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
    Object? coins = null,
  }) {
    return _then(_value.copyWith(
      coins: null == coins
          ? _value.coins
          : coins // ignore: cast_nullable_to_non_nullable
              as List<Coin>,
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
  $Res call({List<Coin> coins});
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
    Object? coins = null,
  }) {
    return _then(_$_CoinDto(
      coins: null == coins
          ? _value._coins
          : coins // ignore: cast_nullable_to_non_nullable
              as List<Coin>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CoinDto with DiagnosticableTreeMixin implements _CoinDto {
  const _$_CoinDto({required final List<Coin> coins}) : _coins = coins;

  factory _$_CoinDto.fromJson(Map<String, dynamic> json) =>
      _$$_CoinDtoFromJson(json);

  final List<Coin> _coins;
  @override
  List<Coin> get coins {
    if (_coins is EqualUnmodifiableListView) return _coins;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coins);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CoinDto(coins: $coins)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CoinDto'))
      ..add(DiagnosticsProperty('coins', coins));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CoinDto &&
            const DeepCollectionEquality().equals(other._coins, _coins));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_coins));

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
  const factory _CoinDto({required final List<Coin> coins}) = _$_CoinDto;

  factory _CoinDto.fromJson(Map<String, dynamic> json) = _$_CoinDto.fromJson;

  @override
  List<Coin> get coins;
  @override
  @JsonKey(ignore: true)
  _$$_CoinDtoCopyWith<_$_CoinDto> get copyWith =>
      throw _privateConstructorUsedError;
}

Coin _$CoinFromJson(Map<String, dynamic> json) {
  return _Coin.fromJson(json);
}

/// @nodoc
mixin _$Coin {
  String get id => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'priceChange1d', defaultValue: 0)
  double get priceChange1d => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoinCopyWith<Coin> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinCopyWith<$Res> {
  factory $CoinCopyWith(Coin value, $Res Function(Coin) then) =
      _$CoinCopyWithImpl<$Res, Coin>;
  @useResult
  $Res call(
      {String id,
      String icon,
      String name,
      String symbol,
      double price,
      @JsonKey(name: 'priceChange1d', defaultValue: 0) double priceChange1d});
}

/// @nodoc
class _$CoinCopyWithImpl<$Res, $Val extends Coin>
    implements $CoinCopyWith<$Res> {
  _$CoinCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? icon = null,
    Object? name = null,
    Object? symbol = null,
    Object? price = null,
    Object? priceChange1d = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      priceChange1d: null == priceChange1d
          ? _value.priceChange1d
          : priceChange1d // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CoinCopyWith<$Res> implements $CoinCopyWith<$Res> {
  factory _$$_CoinCopyWith(_$_Coin value, $Res Function(_$_Coin) then) =
      __$$_CoinCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String icon,
      String name,
      String symbol,
      double price,
      @JsonKey(name: 'priceChange1d', defaultValue: 0) double priceChange1d});
}

/// @nodoc
class __$$_CoinCopyWithImpl<$Res> extends _$CoinCopyWithImpl<$Res, _$_Coin>
    implements _$$_CoinCopyWith<$Res> {
  __$$_CoinCopyWithImpl(_$_Coin _value, $Res Function(_$_Coin) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? icon = null,
    Object? name = null,
    Object? symbol = null,
    Object? price = null,
    Object? priceChange1d = null,
  }) {
    return _then(_$_Coin(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      priceChange1d: null == priceChange1d
          ? _value.priceChange1d
          : priceChange1d // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Coin with DiagnosticableTreeMixin implements _Coin {
  const _$_Coin(
      {required this.id,
      required this.icon,
      required this.name,
      required this.symbol,
      required this.price,
      @JsonKey(name: 'priceChange1d', defaultValue: 0)
      required this.priceChange1d});

  factory _$_Coin.fromJson(Map<String, dynamic> json) => _$$_CoinFromJson(json);

  @override
  final String id;
  @override
  final String icon;
  @override
  final String name;
  @override
  final String symbol;
  @override
  final double price;
  @override
  @JsonKey(name: 'priceChange1d', defaultValue: 0)
  final double priceChange1d;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Coin(id: $id, icon: $icon, name: $name, symbol: $symbol, price: $price, priceChange1d: $priceChange1d)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Coin'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('icon', icon))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('symbol', symbol))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('priceChange1d', priceChange1d));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Coin &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.priceChange1d, priceChange1d) ||
                other.priceChange1d == priceChange1d));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, icon, name, symbol, price, priceChange1d);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CoinCopyWith<_$_Coin> get copyWith =>
      __$$_CoinCopyWithImpl<_$_Coin>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CoinToJson(
      this,
    );
  }
}

abstract class _Coin implements Coin {
  const factory _Coin(
      {required final String id,
      required final String icon,
      required final String name,
      required final String symbol,
      required final double price,
      @JsonKey(name: 'priceChange1d', defaultValue: 0)
      required final double priceChange1d}) = _$_Coin;

  factory _Coin.fromJson(Map<String, dynamic> json) = _$_Coin.fromJson;

  @override
  String get id;
  @override
  String get icon;
  @override
  String get name;
  @override
  String get symbol;
  @override
  double get price;
  @override
  @JsonKey(name: 'priceChange1d', defaultValue: 0)
  double get priceChange1d;
  @override
  @JsonKey(ignore: true)
  _$$_CoinCopyWith<_$_Coin> get copyWith => throw _privateConstructorUsedError;
}
