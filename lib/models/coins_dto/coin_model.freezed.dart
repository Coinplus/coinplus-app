// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CoinModel _$CoinModelFromJson(Map<String, dynamic> json) {
  return _CoinModel.fromJson(json);
}

/// @nodoc
mixin _$CoinModel {
  List<CoinResultModel> get result => throw _privateConstructorUsedError;
  Meta get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoinModelCopyWith<CoinModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinModelCopyWith<$Res> {
  factory $CoinModelCopyWith(CoinModel value, $Res Function(CoinModel) then) =
      _$CoinModelCopyWithImpl<$Res, CoinModel>;
  @useResult
  $Res call({List<CoinResultModel> result, Meta meta});

  $MetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$CoinModelCopyWithImpl<$Res, $Val extends CoinModel>
    implements $CoinModelCopyWith<$Res> {
  _$CoinModelCopyWithImpl(this._value, this._then);

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
              as List<CoinResultModel>,
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
abstract class _$$CoinModelImplCopyWith<$Res>
    implements $CoinModelCopyWith<$Res> {
  factory _$$CoinModelImplCopyWith(
          _$CoinModelImpl value, $Res Function(_$CoinModelImpl) then) =
      __$$CoinModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CoinResultModel> result, Meta meta});

  @override
  $MetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$CoinModelImplCopyWithImpl<$Res>
    extends _$CoinModelCopyWithImpl<$Res, _$CoinModelImpl>
    implements _$$CoinModelImplCopyWith<$Res> {
  __$$CoinModelImplCopyWithImpl(
      _$CoinModelImpl _value, $Res Function(_$CoinModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? meta = null,
  }) {
    return _then(_$CoinModelImpl(
      result: null == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<CoinResultModel>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoinModelImpl with DiagnosticableTreeMixin implements _CoinModel {
  const _$CoinModelImpl(
      {required final List<CoinResultModel> result, required this.meta})
      : _result = result;

  factory _$CoinModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoinModelImplFromJson(json);

  final List<CoinResultModel> _result;
  @override
  List<CoinResultModel> get result {
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_result);
  }

  @override
  final Meta meta;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CoinModel(result: $result, meta: $meta)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CoinModel'))
      ..add(DiagnosticsProperty('result', result))
      ..add(DiagnosticsProperty('meta', meta));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoinModelImpl &&
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
  _$$CoinModelImplCopyWith<_$CoinModelImpl> get copyWith =>
      __$$CoinModelImplCopyWithImpl<_$CoinModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoinModelImplToJson(
      this,
    );
  }
}

abstract class _CoinModel implements CoinModel {
  const factory _CoinModel(
      {required final List<CoinResultModel> result,
      required final Meta meta}) = _$CoinModelImpl;

  factory _CoinModel.fromJson(Map<String, dynamic> json) =
      _$CoinModelImpl.fromJson;

  @override
  List<CoinResultModel> get result;
  @override
  Meta get meta;
  @override
  @JsonKey(ignore: true)
  _$$CoinModelImplCopyWith<_$CoinModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CoinResultModel _$CoinResultModelFromJson(Map<String, dynamic> json) {
  return _CoinResultModel.fromJson(json);
}

/// @nodoc
mixin _$CoinResultModel {
  String get id => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  @JsonKey(name: 'price', defaultValue: 0)
  num get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'priceChange1d', defaultValue: 0)
  num get priceChange1d => throw _privateConstructorUsedError;
  @JsonKey(name: 'marketCap', defaultValue: 0)
  num get marketCap => throw _privateConstructorUsedError;
  @JsonKey(name: 'rank', defaultValue: 0)
  num get rank => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoinResultModelCopyWith<CoinResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinResultModelCopyWith<$Res> {
  factory $CoinResultModelCopyWith(
          CoinResultModel value, $Res Function(CoinResultModel) then) =
      _$CoinResultModelCopyWithImpl<$Res, CoinResultModel>;
  @useResult
  $Res call(
      {String id,
      String symbol,
      String name,
      String icon,
      @JsonKey(name: 'price', defaultValue: 0) num price,
      @JsonKey(name: 'priceChange1d', defaultValue: 0) num priceChange1d,
      @JsonKey(name: 'marketCap', defaultValue: 0) num marketCap,
      @JsonKey(name: 'rank', defaultValue: 0) num rank});
}

/// @nodoc
class _$CoinResultModelCopyWithImpl<$Res, $Val extends CoinResultModel>
    implements $CoinResultModelCopyWith<$Res> {
  _$CoinResultModelCopyWithImpl(this._value, this._then);

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
    Object? marketCap = null,
    Object? rank = null,
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
      marketCap: null == marketCap
          ? _value.marketCap
          : marketCap // ignore: cast_nullable_to_non_nullable
              as num,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoinResultModelImplCopyWith<$Res>
    implements $CoinResultModelCopyWith<$Res> {
  factory _$$CoinResultModelImplCopyWith(_$CoinResultModelImpl value,
          $Res Function(_$CoinResultModelImpl) then) =
      __$$CoinResultModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String symbol,
      String name,
      String icon,
      @JsonKey(name: 'price', defaultValue: 0) num price,
      @JsonKey(name: 'priceChange1d', defaultValue: 0) num priceChange1d,
      @JsonKey(name: 'marketCap', defaultValue: 0) num marketCap,
      @JsonKey(name: 'rank', defaultValue: 0) num rank});
}

/// @nodoc
class __$$CoinResultModelImplCopyWithImpl<$Res>
    extends _$CoinResultModelCopyWithImpl<$Res, _$CoinResultModelImpl>
    implements _$$CoinResultModelImplCopyWith<$Res> {
  __$$CoinResultModelImplCopyWithImpl(
      _$CoinResultModelImpl _value, $Res Function(_$CoinResultModelImpl) _then)
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
    Object? marketCap = null,
    Object? rank = null,
  }) {
    return _then(_$CoinResultModelImpl(
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
      marketCap: null == marketCap
          ? _value.marketCap
          : marketCap // ignore: cast_nullable_to_non_nullable
              as num,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoinResultModelImpl
    with DiagnosticableTreeMixin
    implements _CoinResultModel {
  const _$CoinResultModelImpl(
      {required this.id,
      required this.symbol,
      required this.name,
      required this.icon,
      @JsonKey(name: 'price', defaultValue: 0) required this.price,
      @JsonKey(name: 'priceChange1d', defaultValue: 0)
      required this.priceChange1d,
      @JsonKey(name: 'marketCap', defaultValue: 0) required this.marketCap,
      @JsonKey(name: 'rank', defaultValue: 0) required this.rank});

  factory _$CoinResultModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoinResultModelImplFromJson(json);

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
  @JsonKey(name: 'marketCap', defaultValue: 0)
  final num marketCap;
  @override
  @JsonKey(name: 'rank', defaultValue: 0)
  final num rank;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CoinResultModel(id: $id, symbol: $symbol, name: $name, icon: $icon, price: $price, priceChange1d: $priceChange1d, marketCap: $marketCap, rank: $rank)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CoinResultModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('symbol', symbol))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('icon', icon))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('priceChange1d', priceChange1d))
      ..add(DiagnosticsProperty('marketCap', marketCap))
      ..add(DiagnosticsProperty('rank', rank));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoinResultModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.priceChange1d, priceChange1d) ||
                other.priceChange1d == priceChange1d) &&
            (identical(other.marketCap, marketCap) ||
                other.marketCap == marketCap) &&
            (identical(other.rank, rank) || other.rank == rank));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, symbol, name, icon, price,
      priceChange1d, marketCap, rank);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoinResultModelImplCopyWith<_$CoinResultModelImpl> get copyWith =>
      __$$CoinResultModelImplCopyWithImpl<_$CoinResultModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoinResultModelImplToJson(
      this,
    );
  }
}

abstract class _CoinResultModel implements CoinResultModel {
  const factory _CoinResultModel(
      {required final String id,
      required final String symbol,
      required final String name,
      required final String icon,
      @JsonKey(name: 'price', defaultValue: 0) required final num price,
      @JsonKey(name: 'priceChange1d', defaultValue: 0)
      required final num priceChange1d,
      @JsonKey(name: 'marketCap', defaultValue: 0) required final num marketCap,
      @JsonKey(name: 'rank', defaultValue: 0)
      required final num rank}) = _$CoinResultModelImpl;

  factory _CoinResultModel.fromJson(Map<String, dynamic> json) =
      _$CoinResultModelImpl.fromJson;

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
  @JsonKey(name: 'marketCap', defaultValue: 0)
  num get marketCap;
  @override
  @JsonKey(name: 'rank', defaultValue: 0)
  num get rank;
  @override
  @JsonKey(ignore: true)
  _$$CoinResultModelImplCopyWith<_$CoinResultModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return _Meta.fromJson(json);
}

/// @nodoc
mixin _$Meta {
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get itemCount => throw _privateConstructorUsedError;
  int get pageCount => throw _privateConstructorUsedError;
  bool get hasPreviousPage => throw _privateConstructorUsedError;
  bool get hasNextPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetaCopyWith<Meta> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaCopyWith<$Res> {
  factory $MetaCopyWith(Meta value, $Res Function(Meta) then) =
      _$MetaCopyWithImpl<$Res, Meta>;
  @useResult
  $Res call(
      {int page,
      int limit,
      int itemCount,
      int pageCount,
      bool hasPreviousPage,
      bool hasNextPage});
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
    Object? itemCount = null,
    Object? pageCount = null,
    Object? hasPreviousPage = null,
    Object? hasNextPage = null,
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
      itemCount: null == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
      pageCount: null == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int,
      hasPreviousPage: null == hasPreviousPage
          ? _value.hasPreviousPage
          : hasPreviousPage // ignore: cast_nullable_to_non_nullable
              as bool,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
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
  $Res call(
      {int page,
      int limit,
      int itemCount,
      int pageCount,
      bool hasPreviousPage,
      bool hasNextPage});
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
    Object? itemCount = null,
    Object? pageCount = null,
    Object? hasPreviousPage = null,
    Object? hasNextPage = null,
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
      itemCount: null == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
      pageCount: null == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int,
      hasPreviousPage: null == hasPreviousPage
          ? _value.hasPreviousPage
          : hasPreviousPage // ignore: cast_nullable_to_non_nullable
              as bool,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetaImpl with DiagnosticableTreeMixin implements _Meta {
  const _$MetaImpl(
      {required this.page,
      required this.limit,
      required this.itemCount,
      required this.pageCount,
      required this.hasPreviousPage,
      required this.hasNextPage});

  factory _$MetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaImplFromJson(json);

  @override
  final int page;
  @override
  final int limit;
  @override
  final int itemCount;
  @override
  final int pageCount;
  @override
  final bool hasPreviousPage;
  @override
  final bool hasNextPage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Meta(page: $page, limit: $limit, itemCount: $itemCount, pageCount: $pageCount, hasPreviousPage: $hasPreviousPage, hasNextPage: $hasNextPage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Meta'))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('limit', limit))
      ..add(DiagnosticsProperty('itemCount', itemCount))
      ..add(DiagnosticsProperty('pageCount', pageCount))
      ..add(DiagnosticsProperty('hasPreviousPage', hasPreviousPage))
      ..add(DiagnosticsProperty('hasNextPage', hasNextPage));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.itemCount, itemCount) ||
                other.itemCount == itemCount) &&
            (identical(other.pageCount, pageCount) ||
                other.pageCount == pageCount) &&
            (identical(other.hasPreviousPage, hasPreviousPage) ||
                other.hasPreviousPage == hasPreviousPage) &&
            (identical(other.hasNextPage, hasNextPage) ||
                other.hasNextPage == hasNextPage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, limit, itemCount,
      pageCount, hasPreviousPage, hasNextPage);

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
  const factory _Meta(
      {required final int page,
      required final int limit,
      required final int itemCount,
      required final int pageCount,
      required final bool hasPreviousPage,
      required final bool hasNextPage}) = _$MetaImpl;

  factory _Meta.fromJson(Map<String, dynamic> json) = _$MetaImpl.fromJson;

  @override
  int get page;
  @override
  int get limit;
  @override
  int get itemCount;
  @override
  int get pageCount;
  @override
  bool get hasPreviousPage;
  @override
  bool get hasNextPage;
  @override
  @JsonKey(ignore: true)
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
