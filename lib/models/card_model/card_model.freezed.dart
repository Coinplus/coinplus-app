// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CardModel _$CardModelFromJson(Map<String, dynamic> json) {
  return _CardModel.fromJson(json);
}

/// @nodoc
mixin _$CardModel {
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'final_balance')
  int? get finalBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_received')
  int? get totalReceived => throw _privateConstructorUsedError;
  CardColor get color => throw _privateConstructorUsedError;
  CardType get type => throw _privateConstructorUsedError;
  WalletType get label => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get blockchain => throw _privateConstructorUsedError;
  @JsonKey(fromJson: timeFromJson)
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardModelCopyWith<CardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardModelCopyWith<$Res> {
  factory $CardModelCopyWith(CardModel value, $Res Function(CardModel) then) =
      _$CardModelCopyWithImpl<$Res, CardModel>;
  @useResult
  $Res call(
      {String address,
      @JsonKey(name: 'final_balance') int? finalBalance,
      @JsonKey(name: 'total_received') int? totalReceived,
      CardColor color,
      CardType type,
      WalletType label,
      String name,
      String blockchain,
      @JsonKey(fromJson: timeFromJson) String createdAt});
}

/// @nodoc
class _$CardModelCopyWithImpl<$Res, $Val extends CardModel>
    implements $CardModelCopyWith<$Res> {
  _$CardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? finalBalance = freezed,
    Object? totalReceived = freezed,
    Object? color = null,
    Object? type = null,
    Object? label = null,
    Object? name = null,
    Object? blockchain = null,
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
              as int?,
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
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as WalletType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      blockchain: null == blockchain
          ? _value.blockchain
          : blockchain // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CardModelImplCopyWith<$Res>
    implements $CardModelCopyWith<$Res> {
  factory _$$CardModelImplCopyWith(
          _$CardModelImpl value, $Res Function(_$CardModelImpl) then) =
      __$$CardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String address,
      @JsonKey(name: 'final_balance') int? finalBalance,
      @JsonKey(name: 'total_received') int? totalReceived,
      CardColor color,
      CardType type,
      WalletType label,
      String name,
      String blockchain,
      @JsonKey(fromJson: timeFromJson) String createdAt});
}

/// @nodoc
class __$$CardModelImplCopyWithImpl<$Res>
    extends _$CardModelCopyWithImpl<$Res, _$CardModelImpl>
    implements _$$CardModelImplCopyWith<$Res> {
  __$$CardModelImplCopyWithImpl(
      _$CardModelImpl _value, $Res Function(_$CardModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? finalBalance = freezed,
    Object? totalReceived = freezed,
    Object? color = null,
    Object? type = null,
    Object? label = null,
    Object? name = null,
    Object? blockchain = null,
    Object? createdAt = null,
  }) {
    return _then(_$CardModelImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      finalBalance: freezed == finalBalance
          ? _value.finalBalance
          : finalBalance // ignore: cast_nullable_to_non_nullable
              as int?,
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
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as WalletType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      blockchain: null == blockchain
          ? _value.blockchain
          : blockchain // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CardModelImpl implements _CardModel {
  const _$CardModelImpl(
      {required this.address,
      @JsonKey(name: 'final_balance') this.finalBalance,
      @JsonKey(name: 'total_received') this.totalReceived,
      this.color = CardColor.ORANGE,
      this.type = CardType.CARD,
      this.label = WalletType.COINPLUS_WALLET,
      this.name = 'Coinplus Bitcoin Card',
      this.blockchain = 'BTC',
      @JsonKey(fromJson: timeFromJson) this.createdAt = ''});

  factory _$CardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardModelImplFromJson(json);

  @override
  final String address;
  @override
  @JsonKey(name: 'final_balance')
  final int? finalBalance;
  @override
  @JsonKey(name: 'total_received')
  final int? totalReceived;
  @override
  @JsonKey()
  final CardColor color;
  @override
  @JsonKey()
  final CardType type;
  @override
  @JsonKey()
  final WalletType label;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String blockchain;
  @override
  @JsonKey(fromJson: timeFromJson)
  final String createdAt;

  @override
  String toString() {
    return 'CardModel(address: $address, finalBalance: $finalBalance, totalReceived: $totalReceived, color: $color, type: $type, label: $label, name: $name, blockchain: $blockchain, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardModelImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.finalBalance, finalBalance) ||
                other.finalBalance == finalBalance) &&
            (identical(other.totalReceived, totalReceived) ||
                other.totalReceived == totalReceived) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.blockchain, blockchain) ||
                other.blockchain == blockchain) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, address, finalBalance,
      totalReceived, color, type, label, name, blockchain, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardModelImplCopyWith<_$CardModelImpl> get copyWith =>
      __$$CardModelImplCopyWithImpl<_$CardModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CardModelImplToJson(
      this,
    );
  }
}

abstract class _CardModel implements CardModel, AbstractCard {
  const factory _CardModel(
          {required final String address,
          @JsonKey(name: 'final_balance') final int? finalBalance,
          @JsonKey(name: 'total_received') final int? totalReceived,
          final CardColor color,
          final CardType type,
          final WalletType label,
          final String name,
          final String blockchain,
          @JsonKey(fromJson: timeFromJson) final String createdAt}) =
      _$CardModelImpl;

  factory _CardModel.fromJson(Map<String, dynamic> json) =
      _$CardModelImpl.fromJson;

  @override
  String get address;
  @override
  @JsonKey(name: 'final_balance')
  int? get finalBalance;
  @override
  @JsonKey(name: 'total_received')
  int? get totalReceived;
  @override
  CardColor get color;
  @override
  CardType get type;
  @override
  WalletType get label;
  @override
  String get name;
  @override
  String get blockchain;
  @override
  @JsonKey(fromJson: timeFromJson)
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$CardModelImplCopyWith<_$CardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
