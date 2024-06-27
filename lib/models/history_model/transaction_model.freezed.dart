// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) {
  return _TransactionModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionModel {
  List<TransactionItem> get result => throw _privateConstructorUsedError;
  Meta get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionModelCopyWith<TransactionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionModelCopyWith<$Res> {
  factory $TransactionModelCopyWith(
          TransactionModel value, $Res Function(TransactionModel) then) =
      _$TransactionModelCopyWithImpl<$Res, TransactionModel>;
  @useResult
  $Res call({List<TransactionItem> result, Meta meta});

  $MetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$TransactionModelCopyWithImpl<$Res, $Val extends TransactionModel>
    implements $TransactionModelCopyWith<$Res> {
  _$TransactionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<TransactionItem>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MetaCopyWith<$Res> get meta {
    return $MetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransactionModelImplCopyWith<$Res>
    implements $TransactionModelCopyWith<$Res> {
  factory _$$TransactionModelImplCopyWith(_$TransactionModelImpl value,
          $Res Function(_$TransactionModelImpl) then) =
      __$$TransactionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TransactionItem> result, Meta meta});

  @override
  $MetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$TransactionModelImplCopyWithImpl<$Res>
    extends _$TransactionModelCopyWithImpl<$Res, _$TransactionModelImpl>
    implements _$$TransactionModelImplCopyWith<$Res> {
  __$$TransactionModelImplCopyWithImpl(_$TransactionModelImpl _value,
      $Res Function(_$TransactionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? meta = null,
  }) {
    return _then(_$TransactionModelImpl(
      result: null == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<TransactionItem>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionModelImpl implements _TransactionModel {
  _$TransactionModelImpl(
      {required final List<TransactionItem> result, required this.meta})
      : _result = result;

  factory _$TransactionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionModelImplFromJson(json);

  final List<TransactionItem> _result;
  @override
  List<TransactionItem> get result {
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_result);
  }

  @override
  final Meta meta;

  @override
  String toString() {
    return 'TransactionModel(result: $result, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionModelImpl &&
            const DeepCollectionEquality().equals(other._result, _result) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_result), meta);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionModelImplCopyWith<_$TransactionModelImpl> get copyWith =>
      __$$TransactionModelImplCopyWithImpl<_$TransactionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionModelImplToJson(
      this,
    );
  }
}

abstract class _TransactionModel implements TransactionModel {
  factory _TransactionModel(
      {required final List<TransactionItem> result,
      required final Meta meta}) = _$TransactionModelImpl;

  factory _TransactionModel.fromJson(Map<String, dynamic> json) =
      _$TransactionModelImpl.fromJson;

  @override
  List<TransactionItem> get result;
  @override
  Meta get meta;
  @override
  @JsonKey(ignore: true)
  _$$TransactionModelImplCopyWith<_$TransactionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TransactionItem _$TransactionItemFromJson(Map<String, dynamic> json) {
  return _TransactionItem.fromJson(json);
}

/// @nodoc
mixin _$TransactionItem {
  String? get type => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  MainContent? get mainContent => throw _privateConstructorUsedError;
  CoinData? get coinData => throw _privateConstructorUsedError;
  ProfitLoss? get profitLoss => throw _privateConstructorUsedError;
  List<Transaction>? get transactions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionItemCopyWith<TransactionItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionItemCopyWith<$Res> {
  factory $TransactionItemCopyWith(
          TransactionItem value, $Res Function(TransactionItem) then) =
      _$TransactionItemCopyWithImpl<$Res, TransactionItem>;
  @useResult
  $Res call(
      {String? type,
      String? date,
      MainContent? mainContent,
      CoinData? coinData,
      ProfitLoss? profitLoss,
      List<Transaction>? transactions});

  $MainContentCopyWith<$Res>? get mainContent;
  $CoinDataCopyWith<$Res>? get coinData;
  $ProfitLossCopyWith<$Res>? get profitLoss;
}

/// @nodoc
class _$TransactionItemCopyWithImpl<$Res, $Val extends TransactionItem>
    implements $TransactionItemCopyWith<$Res> {
  _$TransactionItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? date = freezed,
    Object? mainContent = freezed,
    Object? coinData = freezed,
    Object? profitLoss = freezed,
    Object? transactions = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      mainContent: freezed == mainContent
          ? _value.mainContent
          : mainContent // ignore: cast_nullable_to_non_nullable
              as MainContent?,
      coinData: freezed == coinData
          ? _value.coinData
          : coinData // ignore: cast_nullable_to_non_nullable
              as CoinData?,
      profitLoss: freezed == profitLoss
          ? _value.profitLoss
          : profitLoss // ignore: cast_nullable_to_non_nullable
              as ProfitLoss?,
      transactions: freezed == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MainContentCopyWith<$Res>? get mainContent {
    if (_value.mainContent == null) {
      return null;
    }

    return $MainContentCopyWith<$Res>(_value.mainContent!, (value) {
      return _then(_value.copyWith(mainContent: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CoinDataCopyWith<$Res>? get coinData {
    if (_value.coinData == null) {
      return null;
    }

    return $CoinDataCopyWith<$Res>(_value.coinData!, (value) {
      return _then(_value.copyWith(coinData: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfitLossCopyWith<$Res>? get profitLoss {
    if (_value.profitLoss == null) {
      return null;
    }

    return $ProfitLossCopyWith<$Res>(_value.profitLoss!, (value) {
      return _then(_value.copyWith(profitLoss: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransactionItemImplCopyWith<$Res>
    implements $TransactionItemCopyWith<$Res> {
  factory _$$TransactionItemImplCopyWith(_$TransactionItemImpl value,
          $Res Function(_$TransactionItemImpl) then) =
      __$$TransactionItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? type,
      String? date,
      MainContent? mainContent,
      CoinData? coinData,
      ProfitLoss? profitLoss,
      List<Transaction>? transactions});

  @override
  $MainContentCopyWith<$Res>? get mainContent;
  @override
  $CoinDataCopyWith<$Res>? get coinData;
  @override
  $ProfitLossCopyWith<$Res>? get profitLoss;
}

/// @nodoc
class __$$TransactionItemImplCopyWithImpl<$Res>
    extends _$TransactionItemCopyWithImpl<$Res, _$TransactionItemImpl>
    implements _$$TransactionItemImplCopyWith<$Res> {
  __$$TransactionItemImplCopyWithImpl(
      _$TransactionItemImpl _value, $Res Function(_$TransactionItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? date = freezed,
    Object? mainContent = freezed,
    Object? coinData = freezed,
    Object? profitLoss = freezed,
    Object? transactions = freezed,
  }) {
    return _then(_$TransactionItemImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      mainContent: freezed == mainContent
          ? _value.mainContent
          : mainContent // ignore: cast_nullable_to_non_nullable
              as MainContent?,
      coinData: freezed == coinData
          ? _value.coinData
          : coinData // ignore: cast_nullable_to_non_nullable
              as CoinData?,
      profitLoss: freezed == profitLoss
          ? _value.profitLoss
          : profitLoss // ignore: cast_nullable_to_non_nullable
              as ProfitLoss?,
      transactions: freezed == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionItemImpl implements _TransactionItem {
  _$TransactionItemImpl(
      {required this.type,
      required this.date,
      required this.mainContent,
      required this.coinData,
      required this.profitLoss,
      required final List<Transaction>? transactions})
      : _transactions = transactions;

  factory _$TransactionItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionItemImplFromJson(json);

  @override
  final String? type;
  @override
  final String? date;
  @override
  final MainContent? mainContent;
  @override
  final CoinData? coinData;
  @override
  final ProfitLoss? profitLoss;
  final List<Transaction>? _transactions;
  @override
  List<Transaction>? get transactions {
    final value = _transactions;
    if (value == null) return null;
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TransactionItem(type: $type, date: $date, mainContent: $mainContent, coinData: $coinData, profitLoss: $profitLoss, transactions: $transactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionItemImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.mainContent, mainContent) ||
                other.mainContent == mainContent) &&
            (identical(other.coinData, coinData) ||
                other.coinData == coinData) &&
            (identical(other.profitLoss, profitLoss) ||
                other.profitLoss == profitLoss) &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, date, mainContent,
      coinData, profitLoss, const DeepCollectionEquality().hash(_transactions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionItemImplCopyWith<_$TransactionItemImpl> get copyWith =>
      __$$TransactionItemImplCopyWithImpl<_$TransactionItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionItemImplToJson(
      this,
    );
  }
}

abstract class _TransactionItem implements TransactionItem {
  factory _TransactionItem(
      {required final String? type,
      required final String? date,
      required final MainContent? mainContent,
      required final CoinData? coinData,
      required final ProfitLoss? profitLoss,
      required final List<Transaction>? transactions}) = _$TransactionItemImpl;

  factory _TransactionItem.fromJson(Map<String, dynamic> json) =
      _$TransactionItemImpl.fromJson;

  @override
  String? get type;
  @override
  String? get date;
  @override
  MainContent? get mainContent;
  @override
  CoinData? get coinData;
  @override
  ProfitLoss? get profitLoss;
  @override
  List<Transaction>? get transactions;
  @override
  @JsonKey(ignore: true)
  _$$TransactionItemImplCopyWith<_$TransactionItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MainContent _$MainContentFromJson(Map<String, dynamic> json) {
  return _MainContent.fromJson(json);
}

/// @nodoc
mixin _$MainContent {
  List<String> get coinIcons => throw _privateConstructorUsedError;
  List<dynamic> get coinAssets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MainContentCopyWith<MainContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainContentCopyWith<$Res> {
  factory $MainContentCopyWith(
          MainContent value, $Res Function(MainContent) then) =
      _$MainContentCopyWithImpl<$Res, MainContent>;
  @useResult
  $Res call({List<String> coinIcons, List<dynamic> coinAssets});
}

/// @nodoc
class _$MainContentCopyWithImpl<$Res, $Val extends MainContent>
    implements $MainContentCopyWith<$Res> {
  _$MainContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coinIcons = null,
    Object? coinAssets = null,
  }) {
    return _then(_value.copyWith(
      coinIcons: null == coinIcons
          ? _value.coinIcons
          : coinIcons // ignore: cast_nullable_to_non_nullable
              as List<String>,
      coinAssets: null == coinAssets
          ? _value.coinAssets
          : coinAssets // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MainContentImplCopyWith<$Res>
    implements $MainContentCopyWith<$Res> {
  factory _$$MainContentImplCopyWith(
          _$MainContentImpl value, $Res Function(_$MainContentImpl) then) =
      __$$MainContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> coinIcons, List<dynamic> coinAssets});
}

/// @nodoc
class __$$MainContentImplCopyWithImpl<$Res>
    extends _$MainContentCopyWithImpl<$Res, _$MainContentImpl>
    implements _$$MainContentImplCopyWith<$Res> {
  __$$MainContentImplCopyWithImpl(
      _$MainContentImpl _value, $Res Function(_$MainContentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coinIcons = null,
    Object? coinAssets = null,
  }) {
    return _then(_$MainContentImpl(
      coinIcons: null == coinIcons
          ? _value._coinIcons
          : coinIcons // ignore: cast_nullable_to_non_nullable
              as List<String>,
      coinAssets: null == coinAssets
          ? _value._coinAssets
          : coinAssets // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MainContentImpl implements _MainContent {
  _$MainContentImpl(
      {required final List<String> coinIcons,
      required final List<dynamic> coinAssets})
      : _coinIcons = coinIcons,
        _coinAssets = coinAssets;

  factory _$MainContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$MainContentImplFromJson(json);

  final List<String> _coinIcons;
  @override
  List<String> get coinIcons {
    if (_coinIcons is EqualUnmodifiableListView) return _coinIcons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coinIcons);
  }

  final List<dynamic> _coinAssets;
  @override
  List<dynamic> get coinAssets {
    if (_coinAssets is EqualUnmodifiableListView) return _coinAssets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coinAssets);
  }

  @override
  String toString() {
    return 'MainContent(coinIcons: $coinIcons, coinAssets: $coinAssets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainContentImpl &&
            const DeepCollectionEquality()
                .equals(other._coinIcons, _coinIcons) &&
            const DeepCollectionEquality()
                .equals(other._coinAssets, _coinAssets));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_coinIcons),
      const DeepCollectionEquality().hash(_coinAssets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainContentImplCopyWith<_$MainContentImpl> get copyWith =>
      __$$MainContentImplCopyWithImpl<_$MainContentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MainContentImplToJson(
      this,
    );
  }
}

abstract class _MainContent implements MainContent {
  factory _MainContent(
      {required final List<String> coinIcons,
      required final List<dynamic> coinAssets}) = _$MainContentImpl;

  factory _MainContent.fromJson(Map<String, dynamic> json) =
      _$MainContentImpl.fromJson;

  @override
  List<String> get coinIcons;
  @override
  List<dynamic> get coinAssets;
  @override
  @JsonKey(ignore: true)
  _$$MainContentImplCopyWith<_$MainContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CoinData _$CoinDataFromJson(Map<String, dynamic> json) {
  return _CoinData.fromJson(json);
}

/// @nodoc
mixin _$CoinData {
  double get count => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  double get currentValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoinDataCopyWith<CoinData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinDataCopyWith<$Res> {
  factory $CoinDataCopyWith(CoinData value, $Res Function(CoinData) then) =
      _$CoinDataCopyWithImpl<$Res, CoinData>;
  @useResult
  $Res call({double count, String symbol, double currentValue});
}

/// @nodoc
class _$CoinDataCopyWithImpl<$Res, $Val extends CoinData>
    implements $CoinDataCopyWith<$Res> {
  _$CoinDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? symbol = null,
    Object? currentValue = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as double,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoinDataImplCopyWith<$Res>
    implements $CoinDataCopyWith<$Res> {
  factory _$$CoinDataImplCopyWith(
          _$CoinDataImpl value, $Res Function(_$CoinDataImpl) then) =
      __$$CoinDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double count, String symbol, double currentValue});
}

/// @nodoc
class __$$CoinDataImplCopyWithImpl<$Res>
    extends _$CoinDataCopyWithImpl<$Res, _$CoinDataImpl>
    implements _$$CoinDataImplCopyWith<$Res> {
  __$$CoinDataImplCopyWithImpl(
      _$CoinDataImpl _value, $Res Function(_$CoinDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? symbol = null,
    Object? currentValue = null,
  }) {
    return _then(_$CoinDataImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as double,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoinDataImpl implements _CoinData {
  _$CoinDataImpl(
      {required this.count, required this.symbol, required this.currentValue});

  factory _$CoinDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoinDataImplFromJson(json);

  @override
  final double count;
  @override
  final String symbol;
  @override
  final double currentValue;

  @override
  String toString() {
    return 'CoinData(count: $count, symbol: $symbol, currentValue: $currentValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoinDataImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, symbol, currentValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoinDataImplCopyWith<_$CoinDataImpl> get copyWith =>
      __$$CoinDataImplCopyWithImpl<_$CoinDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoinDataImplToJson(
      this,
    );
  }
}

abstract class _CoinData implements CoinData {
  factory _CoinData(
      {required final double count,
      required final String symbol,
      required final double currentValue}) = _$CoinDataImpl;

  factory _CoinData.fromJson(Map<String, dynamic> json) =
      _$CoinDataImpl.fromJson;

  @override
  double get count;
  @override
  String get symbol;
  @override
  double get currentValue;
  @override
  @JsonKey(ignore: true)
  _$$CoinDataImplCopyWith<_$CoinDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProfitLoss _$ProfitLossFromJson(Map<String, dynamic> json) {
  return _ProfitLoss.fromJson(json);
}

/// @nodoc
mixin _$ProfitLoss {
  double get profit => throw _privateConstructorUsedError;
  double get profitPercent => throw _privateConstructorUsedError;
  double get currentValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfitLossCopyWith<ProfitLoss> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfitLossCopyWith<$Res> {
  factory $ProfitLossCopyWith(
          ProfitLoss value, $Res Function(ProfitLoss) then) =
      _$ProfitLossCopyWithImpl<$Res, ProfitLoss>;
  @useResult
  $Res call({double profit, double profitPercent, double currentValue});
}

/// @nodoc
class _$ProfitLossCopyWithImpl<$Res, $Val extends ProfitLoss>
    implements $ProfitLossCopyWith<$Res> {
  _$ProfitLossCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profit = null,
    Object? profitPercent = null,
    Object? currentValue = null,
  }) {
    return _then(_value.copyWith(
      profit: null == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as double,
      profitPercent: null == profitPercent
          ? _value.profitPercent
          : profitPercent // ignore: cast_nullable_to_non_nullable
              as double,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfitLossImplCopyWith<$Res>
    implements $ProfitLossCopyWith<$Res> {
  factory _$$ProfitLossImplCopyWith(
          _$ProfitLossImpl value, $Res Function(_$ProfitLossImpl) then) =
      __$$ProfitLossImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double profit, double profitPercent, double currentValue});
}

/// @nodoc
class __$$ProfitLossImplCopyWithImpl<$Res>
    extends _$ProfitLossCopyWithImpl<$Res, _$ProfitLossImpl>
    implements _$$ProfitLossImplCopyWith<$Res> {
  __$$ProfitLossImplCopyWithImpl(
      _$ProfitLossImpl _value, $Res Function(_$ProfitLossImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profit = null,
    Object? profitPercent = null,
    Object? currentValue = null,
  }) {
    return _then(_$ProfitLossImpl(
      profit: null == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as double,
      profitPercent: null == profitPercent
          ? _value.profitPercent
          : profitPercent // ignore: cast_nullable_to_non_nullable
              as double,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfitLossImpl implements _ProfitLoss {
  _$ProfitLossImpl(
      {required this.profit,
      required this.profitPercent,
      required this.currentValue});

  factory _$ProfitLossImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfitLossImplFromJson(json);

  @override
  final double profit;
  @override
  final double profitPercent;
  @override
  final double currentValue;

  @override
  String toString() {
    return 'ProfitLoss(profit: $profit, profitPercent: $profitPercent, currentValue: $currentValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfitLossImpl &&
            (identical(other.profit, profit) || other.profit == profit) &&
            (identical(other.profitPercent, profitPercent) ||
                other.profitPercent == profitPercent) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, profit, profitPercent, currentValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfitLossImplCopyWith<_$ProfitLossImpl> get copyWith =>
      __$$ProfitLossImplCopyWithImpl<_$ProfitLossImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfitLossImplToJson(
      this,
    );
  }
}

abstract class _ProfitLoss implements ProfitLoss {
  factory _ProfitLoss(
      {required final double profit,
      required final double profitPercent,
      required final double currentValue}) = _$ProfitLossImpl;

  factory _ProfitLoss.fromJson(Map<String, dynamic> json) =
      _$ProfitLossImpl.fromJson;

  @override
  double get profit;
  @override
  double get profitPercent;
  @override
  double get currentValue;
  @override
  @JsonKey(ignore: true)
  _$$ProfitLossImplCopyWith<_$ProfitLossImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Transaction.fromJson(json);
}

/// @nodoc
mixin _$Transaction {
  String get action => throw _privateConstructorUsedError;
  List<Item> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res, Transaction>;
  @useResult
  $Res call({String action, List<Item> items});
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res, $Val extends Transaction>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionImplCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$TransactionImplCopyWith(
          _$TransactionImpl value, $Res Function(_$TransactionImpl) then) =
      __$$TransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String action, List<Item> items});
}

/// @nodoc
class __$$TransactionImplCopyWithImpl<$Res>
    extends _$TransactionCopyWithImpl<$Res, _$TransactionImpl>
    implements _$$TransactionImplCopyWith<$Res> {
  __$$TransactionImplCopyWithImpl(
      _$TransactionImpl _value, $Res Function(_$TransactionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? items = null,
  }) {
    return _then(_$TransactionImpl(
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionImpl implements _Transaction {
  _$TransactionImpl({required this.action, required final List<Item> items})
      : _items = items;

  factory _$TransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionImplFromJson(json);

  @override
  final String action;
  final List<Item> _items;
  @override
  List<Item> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'Transaction(action: $action, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionImpl &&
            (identical(other.action, action) || other.action == action) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, action, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      __$$TransactionImplCopyWithImpl<_$TransactionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionImplToJson(
      this,
    );
  }
}

abstract class _Transaction implements Transaction {
  factory _Transaction(
      {required final String action,
      required final List<Item> items}) = _$TransactionImpl;

  factory _Transaction.fromJson(Map<String, dynamic> json) =
      _$TransactionImpl.fromJson;

  @override
  String get action;
  @override
  List<Item> get items;
  @override
  @JsonKey(ignore: true)
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  String get id => throw _privateConstructorUsedError;
  double get count => throw _privateConstructorUsedError;
  double get totalWorth => throw _privateConstructorUsedError;
  Coin get coin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res, Item>;
  @useResult
  $Res call({String id, double count, double totalWorth, Coin coin});

  $CoinCopyWith<$Res> get coin;
}

/// @nodoc
class _$ItemCopyWithImpl<$Res, $Val extends Item>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? count = null,
    Object? totalWorth = null,
    Object? coin = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as double,
      totalWorth: null == totalWorth
          ? _value.totalWorth
          : totalWorth // ignore: cast_nullable_to_non_nullable
              as double,
      coin: null == coin
          ? _value.coin
          : coin // ignore: cast_nullable_to_non_nullable
              as Coin,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CoinCopyWith<$Res> get coin {
    return $CoinCopyWith<$Res>(_value.coin, (value) {
      return _then(_value.copyWith(coin: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ItemImplCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$ItemImplCopyWith(
          _$ItemImpl value, $Res Function(_$ItemImpl) then) =
      __$$ItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, double count, double totalWorth, Coin coin});

  @override
  $CoinCopyWith<$Res> get coin;
}

/// @nodoc
class __$$ItemImplCopyWithImpl<$Res>
    extends _$ItemCopyWithImpl<$Res, _$ItemImpl>
    implements _$$ItemImplCopyWith<$Res> {
  __$$ItemImplCopyWithImpl(_$ItemImpl _value, $Res Function(_$ItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? count = null,
    Object? totalWorth = null,
    Object? coin = null,
  }) {
    return _then(_$ItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as double,
      totalWorth: null == totalWorth
          ? _value.totalWorth
          : totalWorth // ignore: cast_nullable_to_non_nullable
              as double,
      coin: null == coin
          ? _value.coin
          : coin // ignore: cast_nullable_to_non_nullable
              as Coin,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemImpl implements _Item {
  _$ItemImpl(
      {required this.id,
      required this.count,
      required this.totalWorth,
      required this.coin});

  factory _$ItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemImplFromJson(json);

  @override
  final String id;
  @override
  final double count;
  @override
  final double totalWorth;
  @override
  final Coin coin;

  @override
  String toString() {
    return 'Item(id: $id, count: $count, totalWorth: $totalWorth, coin: $coin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.totalWorth, totalWorth) ||
                other.totalWorth == totalWorth) &&
            (identical(other.coin, coin) || other.coin == coin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, count, totalWorth, coin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      __$$ItemImplCopyWithImpl<_$ItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemImplToJson(
      this,
    );
  }
}

abstract class _Item implements Item {
  factory _Item(
      {required final String id,
      required final double count,
      required final double totalWorth,
      required final Coin coin}) = _$ItemImpl;

  factory _Item.fromJson(Map<String, dynamic> json) = _$ItemImpl.fromJson;

  @override
  String get id;
  @override
  double get count;
  @override
  double get totalWorth;
  @override
  Coin get coin;
  @override
  @JsonKey(ignore: true)
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Coin _$CoinFromJson(Map<String, dynamic> json) {
  return _Coin.fromJson(json);
}

/// @nodoc
mixin _$Coin {
  String get name => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoinCopyWith<Coin> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinCopyWith<$Res> {
  factory $CoinCopyWith(Coin value, $Res Function(Coin) then) =
      _$CoinCopyWithImpl<$Res, Coin>;
  @useResult
  $Res call({String name, String symbol, String icon});
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
    Object? name = null,
    Object? symbol = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoinImplCopyWith<$Res> implements $CoinCopyWith<$Res> {
  factory _$$CoinImplCopyWith(
          _$CoinImpl value, $Res Function(_$CoinImpl) then) =
      __$$CoinImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String symbol, String icon});
}

/// @nodoc
class __$$CoinImplCopyWithImpl<$Res>
    extends _$CoinCopyWithImpl<$Res, _$CoinImpl>
    implements _$$CoinImplCopyWith<$Res> {
  __$$CoinImplCopyWithImpl(_$CoinImpl _value, $Res Function(_$CoinImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? symbol = null,
    Object? icon = null,
  }) {
    return _then(_$CoinImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoinImpl implements _Coin {
  _$CoinImpl({required this.name, required this.symbol, required this.icon});

  factory _$CoinImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoinImplFromJson(json);

  @override
  final String name;
  @override
  final String symbol;
  @override
  final String icon;

  @override
  String toString() {
    return 'Coin(name: $name, symbol: $symbol, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoinImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, symbol, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoinImplCopyWith<_$CoinImpl> get copyWith =>
      __$$CoinImplCopyWithImpl<_$CoinImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoinImplToJson(
      this,
    );
  }
}

abstract class _Coin implements Coin {
  factory _Coin(
      {required final String name,
      required final String symbol,
      required final String icon}) = _$CoinImpl;

  factory _Coin.fromJson(Map<String, dynamic> json) = _$CoinImpl.fromJson;

  @override
  String get name;
  @override
  String get symbol;
  @override
  String get icon;
  @override
  @JsonKey(ignore: true)
  _$$CoinImplCopyWith<_$CoinImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return _Meta.fromJson(json);
}

/// @nodoc
mixin _$Meta {
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetaCopyWith<Meta> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaCopyWith<$Res> {
  factory $MetaCopyWith(Meta value, $Res Function(Meta) then) =
      _$MetaCopyWithImpl<$Res, Meta>;
  @useResult
  $Res call({int page, int limit});
}

/// @nodoc
class _$MetaCopyWithImpl<$Res, $Val extends Meta>
    implements $MetaCopyWith<$Res> {
  _$MetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetaImplCopyWith<$Res> implements $MetaCopyWith<$Res> {
  factory _$$MetaImplCopyWith(
          _$MetaImpl value, $Res Function(_$MetaImpl) then) =
      __$$MetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, int limit});
}

/// @nodoc
class __$$MetaImplCopyWithImpl<$Res>
    extends _$MetaCopyWithImpl<$Res, _$MetaImpl>
    implements _$$MetaImplCopyWith<$Res> {
  __$$MetaImplCopyWithImpl(_$MetaImpl _value, $Res Function(_$MetaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_$MetaImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetaImpl implements _Meta {
  _$MetaImpl({required this.page, required this.limit});

  factory _$MetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaImplFromJson(json);

  @override
  final int page;
  @override
  final int limit;

  @override
  String toString() {
    return 'Meta(page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      __$$MetaImplCopyWithImpl<_$MetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaImplToJson(
      this,
    );
  }
}

abstract class _Meta implements Meta {
  factory _Meta({required final int page, required final int limit}) =
      _$MetaImpl;

  factory _Meta.fromJson(Map<String, dynamic> json) = _$MetaImpl.fromJson;

  @override
  int get page;
  @override
  int get limit;
  @override
  @JsonKey(ignore: true)
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
