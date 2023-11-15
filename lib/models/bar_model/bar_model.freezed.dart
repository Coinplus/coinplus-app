// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bar_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BarModel _$BarModelFromJson(Map<String, dynamic> json) {
  return _BarModel.fromJson(json);
}

/// @nodoc
mixin _$BarModel {
  String get address => throw _privateConstructorUsedError;
  CardColor get color => throw _privateConstructorUsedError;
  CardType get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int? get totalReceived => throw _privateConstructorUsedError;
  int? get totalSent => throw _privateConstructorUsedError;
  int? get balance => throw _privateConstructorUsedError;
  @JsonKey(fromJson: timeFromJson)
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'chain_stats')
  ChainStats? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'mempool_stats')
  MempoolStats? get mempoolStats => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BarModelCopyWith<BarModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BarModelCopyWith<$Res> {
  factory $BarModelCopyWith(BarModel value, $Res Function(BarModel) then) = _$BarModelCopyWithImpl<$Res, BarModel>;
  @useResult
  $Res call(
      {String address,
      CardColor color,
      CardType type,
      String name,
      int? totalReceived,
      int? totalSent,
      int? balance,
      @JsonKey(fromJson: timeFromJson) String createdAt,
      @JsonKey(name: 'chain_stats') ChainStats? data,
      @JsonKey(name: 'mempool_stats') MempoolStats? mempoolStats});
}

/// @nodoc
class _$BarModelCopyWithImpl<$Res, $Val extends BarModel> implements $BarModelCopyWith<$Res> {
  _$BarModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? color = null,
    Object? type = null,
    Object? name = null,
    Object? totalReceived = freezed,
    Object? totalSent = freezed,
    Object? balance = freezed,
    Object? createdAt = null,
    Object? data = freezed,
    Object? mempoolStats = freezed,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as CardColor,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CardType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      totalReceived: freezed == totalReceived
          ? _value.totalReceived
          : totalReceived // ignore: cast_nullable_to_non_nullable
              as int?,
      totalSent: freezed == totalSent
          ? _value.totalSent
          : totalSent // ignore: cast_nullable_to_non_nullable
              as int?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ChainStats?,
      mempoolStats: freezed == mempoolStats
          ? _value.mempoolStats
          : mempoolStats // ignore: cast_nullable_to_non_nullable
              as MempoolStats?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BarModelImplCopyWith<$Res> implements $BarModelCopyWith<$Res> {
  factory _$$BarModelImplCopyWith(_$BarModelImpl value, $Res Function(_$BarModelImpl) then) =
      __$$BarModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String address,
      CardColor color,
      CardType type,
      String name,
      int? totalReceived,
      int? totalSent,
      int? balance,
      @JsonKey(fromJson: timeFromJson) String createdAt,
      @JsonKey(name: 'chain_stats') ChainStats? data,
      @JsonKey(name: 'mempool_stats') MempoolStats? mempoolStats});
}

/// @nodoc
class __$$BarModelImplCopyWithImpl<$Res> extends _$BarModelCopyWithImpl<$Res, _$BarModelImpl>
    implements _$$BarModelImplCopyWith<$Res> {
  __$$BarModelImplCopyWithImpl(_$BarModelImpl _value, $Res Function(_$BarModelImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? color = null,
    Object? type = null,
    Object? name = null,
    Object? totalReceived = freezed,
    Object? totalSent = freezed,
    Object? balance = freezed,
    Object? createdAt = null,
    Object? data = freezed,
    Object? mempoolStats = freezed,
  }) {
    return _then(_$BarModelImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as CardColor,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CardType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      totalReceived: freezed == totalReceived
          ? _value.totalReceived
          : totalReceived // ignore: cast_nullable_to_non_nullable
              as int?,
      totalSent: freezed == totalSent
          ? _value.totalSent
          : totalSent // ignore: cast_nullable_to_non_nullable
              as int?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ChainStats?,
      mempoolStats: freezed == mempoolStats
          ? _value.mempoolStats
          : mempoolStats // ignore: cast_nullable_to_non_nullable
              as MempoolStats?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BarModelImpl implements _BarModel {
  const _$BarModelImpl(
      {required this.address,
      this.color = CardColor.SILVER,
      this.type = CardType.BAR,
      this.name = 'Coinplus Bitcoin Bar',
      this.totalReceived,
      this.totalSent,
      this.balance,
      @JsonKey(fromJson: timeFromJson) this.createdAt = '',
      @JsonKey(name: 'chain_stats') this.data,
      @JsonKey(name: 'mempool_stats') this.mempoolStats});

  factory _$BarModelImpl.fromJson(Map<String, dynamic> json) => _$$BarModelImplFromJson(json);

  @override
  final String address;
  @override
  @JsonKey()
  final CardColor color;
  @override
  @JsonKey()
  final CardType type;
  @override
  @JsonKey()
  final String name;
  @override
  final int? totalReceived;
  @override
  final int? totalSent;
  @override
  final int? balance;
  @override
  @JsonKey(fromJson: timeFromJson)
  final String createdAt;
  @override
  @JsonKey(name: 'chain_stats')
  final ChainStats? data;
  @override
  @JsonKey(name: 'mempool_stats')
  final MempoolStats? mempoolStats;

  @override
  String toString() {
    return 'BarModel(address: $address, color: $color, type: $type, name: $name, totalReceived: $totalReceived, totalSent: $totalSent, balance: $balance, createdAt: $createdAt, data: $data, mempoolStats: $mempoolStats)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BarModelImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.totalReceived, totalReceived) || other.totalReceived == totalReceived) &&
            (identical(other.totalSent, totalSent) || other.totalSent == totalSent) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.mempoolStats, mempoolStats) || other.mempoolStats == mempoolStats));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, address, color, type, name, totalReceived, totalSent, balance, createdAt, data, mempoolStats);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BarModelImplCopyWith<_$BarModelImpl> get copyWith =>
      __$$BarModelImplCopyWithImpl<_$BarModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BarModelImplToJson(
      this,
    );
  }
}

abstract class _BarModel implements BarModel, AbstractCard {
  const factory _BarModel(
      {required final String address,
      final CardColor color,
      final CardType type,
      final String name,
      final int? totalReceived,
      final int? totalSent,
      final int? balance,
      @JsonKey(fromJson: timeFromJson) final String createdAt,
      @JsonKey(name: 'chain_stats') final ChainStats? data,
      @JsonKey(name: 'mempool_stats') final MempoolStats? mempoolStats}) = _$BarModelImpl;

  factory _BarModel.fromJson(Map<String, dynamic> json) = _$BarModelImpl.fromJson;

  @override
  String get address;
  @override
  CardColor get color;
  @override
  CardType get type;
  @override
  String get name;
  @override
  int? get totalReceived;
  @override
  int? get totalSent;
  @override
  int? get balance;
  @override
  @JsonKey(fromJson: timeFromJson)
  String get createdAt;
  @override
  @JsonKey(name: 'chain_stats')
  ChainStats? get data;
  @override
  @JsonKey(name: 'mempool_stats')
  MempoolStats? get mempoolStats;
  @override
  @JsonKey(ignore: true)
  _$$BarModelImplCopyWith<_$BarModelImpl> get copyWith => throw _privateConstructorUsedError;
}
