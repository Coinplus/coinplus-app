// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'eth_card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EthCardModel _$EthCardModelFromJson(Map<String, dynamic> json) {
  return _EthCardModel.fromJson(json);
}

/// @nodoc
mixin _$EthCardModel {
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  num? get finalBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'rank')
  int? get totalReceived => throw _privateConstructorUsedError;
  CardColor get color => throw _privateConstructorUsedError;
  CardType get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  WalletType get label => throw _privateConstructorUsedError;
  String get blockchain => throw _privateConstructorUsedError;
  bool get isBackup => throw _privateConstructorUsedError;
  @JsonKey(fromJson: timeFromJson)
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this EthCardModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EthCardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EthCardModelCopyWith<EthCardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EthCardModelCopyWith<$Res> {
  factory $EthCardModelCopyWith(
          EthCardModel value, $Res Function(EthCardModel) then) =
      _$EthCardModelCopyWithImpl<$Res, EthCardModel>;
  @useResult
  $Res call(
      {String address,
      @JsonKey(name: 'amount') num? finalBalance,
      @JsonKey(name: 'rank') int? totalReceived,
      CardColor color,
      CardType type,
      String name,
      WalletType label,
      String blockchain,
      bool isBackup,
      @JsonKey(fromJson: timeFromJson) String createdAt});
}

/// @nodoc
class _$EthCardModelCopyWithImpl<$Res, $Val extends EthCardModel>
    implements $EthCardModelCopyWith<$Res> {
  _$EthCardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EthCardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? finalBalance = freezed,
    Object? totalReceived = freezed,
    Object? color = null,
    Object? type = null,
    Object? name = null,
    Object? label = null,
    Object? blockchain = null,
    Object? isBackup = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      finalBalance: freezed == finalBalance
          ? _value.finalBalance
          : finalBalance // ignore: cast_nullable_to_non_nullable
              as num?,
      totalReceived: freezed == totalReceived
          ? _value.totalReceived
          : totalReceived // ignore: cast_nullable_to_non_nullable
              as int?,
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
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as WalletType,
      blockchain: null == blockchain
          ? _value.blockchain
          : blockchain // ignore: cast_nullable_to_non_nullable
              as String,
      isBackup: null == isBackup
          ? _value.isBackup
          : isBackup // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EthCardModelImplCopyWith<$Res>
    implements $EthCardModelCopyWith<$Res> {
  factory _$$EthCardModelImplCopyWith(
          _$EthCardModelImpl value, $Res Function(_$EthCardModelImpl) then) =
      __$$EthCardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String address,
      @JsonKey(name: 'amount') num? finalBalance,
      @JsonKey(name: 'rank') int? totalReceived,
      CardColor color,
      CardType type,
      String name,
      WalletType label,
      String blockchain,
      bool isBackup,
      @JsonKey(fromJson: timeFromJson) String createdAt});
}

/// @nodoc
class __$$EthCardModelImplCopyWithImpl<$Res>
    extends _$EthCardModelCopyWithImpl<$Res, _$EthCardModelImpl>
    implements _$$EthCardModelImplCopyWith<$Res> {
  __$$EthCardModelImplCopyWithImpl(
      _$EthCardModelImpl _value, $Res Function(_$EthCardModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EthCardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? finalBalance = freezed,
    Object? totalReceived = freezed,
    Object? color = null,
    Object? type = null,
    Object? name = null,
    Object? label = null,
    Object? blockchain = null,
    Object? isBackup = null,
    Object? createdAt = null,
  }) {
    return _then(_$EthCardModelImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      finalBalance: freezed == finalBalance
          ? _value.finalBalance
          : finalBalance // ignore: cast_nullable_to_non_nullable
              as num?,
      totalReceived: freezed == totalReceived
          ? _value.totalReceived
          : totalReceived // ignore: cast_nullable_to_non_nullable
              as int?,
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
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as WalletType,
      blockchain: null == blockchain
          ? _value.blockchain
          : blockchain // ignore: cast_nullable_to_non_nullable
              as String,
      isBackup: null == isBackup
          ? _value.isBackup
          : isBackup // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EthCardModelImpl implements _EthCardModel {
  const _$EthCardModelImpl(
      {required this.address,
      @JsonKey(name: 'amount') this.finalBalance,
      @JsonKey(name: 'rank') this.totalReceived,
      this.color = CardColor.ORANGE,
      this.type = CardType.CARD,
      this.name = 'Coinplus Ethereum Card',
      this.label = WalletType.COINPLUS_WALLET,
      this.blockchain = 'ETH',
      this.isBackup = false,
      @JsonKey(fromJson: timeFromJson) this.createdAt = ''});

  factory _$EthCardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EthCardModelImplFromJson(json);

  @override
  final String address;
  @override
  @JsonKey(name: 'amount')
  final num? finalBalance;
  @override
  @JsonKey(name: 'rank')
  final int? totalReceived;
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
  @JsonKey()
  final WalletType label;
  @override
  @JsonKey()
  final String blockchain;
  @override
  @JsonKey()
  final bool isBackup;
  @override
  @JsonKey(fromJson: timeFromJson)
  final String createdAt;

  @override
  String toString() {
    return 'EthCardModel(address: $address, finalBalance: $finalBalance, totalReceived: $totalReceived, color: $color, type: $type, name: $name, label: $label, blockchain: $blockchain, isBackup: $isBackup, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EthCardModelImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.finalBalance, finalBalance) ||
                other.finalBalance == finalBalance) &&
            (identical(other.totalReceived, totalReceived) ||
                other.totalReceived == totalReceived) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.blockchain, blockchain) ||
                other.blockchain == blockchain) &&
            (identical(other.isBackup, isBackup) ||
                other.isBackup == isBackup) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, address, finalBalance,
      totalReceived, color, type, name, label, blockchain, isBackup, createdAt);

  /// Create a copy of EthCardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EthCardModelImplCopyWith<_$EthCardModelImpl> get copyWith =>
      __$$EthCardModelImplCopyWithImpl<_$EthCardModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EthCardModelImplToJson(
      this,
    );
  }
}

abstract class _EthCardModel implements EthCardModel, AbstractCard {
  const factory _EthCardModel(
          {required final String address,
          @JsonKey(name: 'amount') final num? finalBalance,
          @JsonKey(name: 'rank') final int? totalReceived,
          final CardColor color,
          final CardType type,
          final String name,
          final WalletType label,
          final String blockchain,
          final bool isBackup,
          @JsonKey(fromJson: timeFromJson) final String createdAt}) =
      _$EthCardModelImpl;

  factory _EthCardModel.fromJson(Map<String, dynamic> json) =
      _$EthCardModelImpl.fromJson;

  @override
  String get address;
  @override
  @JsonKey(name: 'amount')
  num? get finalBalance;
  @override
  @JsonKey(name: 'rank')
  int? get totalReceived;
  @override
  CardColor get color;
  @override
  CardType get type;
  @override
  String get name;
  @override
  WalletType get label;
  @override
  String get blockchain;
  @override
  bool get isBackup;
  @override
  @JsonKey(fromJson: timeFromJson)
  String get createdAt;

  /// Create a copy of EthCardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EthCardModelImplCopyWith<_$EthCardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
