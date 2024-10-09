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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BarModel _$BarModelFromJson(Map<String, dynamic> json) {
  return _BarModel.fromJson(json);
}

/// @nodoc
mixin _$BarModel {
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
  bool get isBackup => throw _privateConstructorUsedError;
  @JsonKey(fromJson: timeFromJson)
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this BarModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BarModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BarModelCopyWith<BarModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BarModelCopyWith<$Res> {
  factory $BarModelCopyWith(BarModel value, $Res Function(BarModel) then) =
      _$BarModelCopyWithImpl<$Res, BarModel>;
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
      bool isBackup,
      @JsonKey(fromJson: timeFromJson) String createdAt});
}

/// @nodoc
class _$BarModelCopyWithImpl<$Res, $Val extends BarModel>
    implements $BarModelCopyWith<$Res> {
  _$BarModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BarModel
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$BarModelImplCopyWith<$Res>
    implements $BarModelCopyWith<$Res> {
  factory _$$BarModelImplCopyWith(
          _$BarModelImpl value, $Res Function(_$BarModelImpl) then) =
      __$$BarModelImplCopyWithImpl<$Res>;
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
      bool isBackup,
      @JsonKey(fromJson: timeFromJson) String createdAt});
}

/// @nodoc
class __$$BarModelImplCopyWithImpl<$Res>
    extends _$BarModelCopyWithImpl<$Res, _$BarModelImpl>
    implements _$$BarModelImplCopyWith<$Res> {
  __$$BarModelImplCopyWithImpl(
      _$BarModelImpl _value, $Res Function(_$BarModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BarModel
  /// with the given fields replaced by the non-null parameter values.
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
    Object? isBackup = null,
    Object? createdAt = null,
  }) {
    return _then(_$BarModelImpl(
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
class _$BarModelImpl implements _BarModel {
  const _$BarModelImpl(
      {required this.address,
      @JsonKey(name: 'final_balance') this.finalBalance,
      @JsonKey(name: 'total_received') this.totalReceived,
      this.color = CardColor.SILVER,
      this.type = CardType.BAR,
      this.label = WalletType.COINPLUS_WALLET,
      this.name = 'Coinplus Bitcoin Bar',
      this.blockchain = 'BTC',
      this.isBackup = false,
      @JsonKey(fromJson: timeFromJson) this.createdAt = ''});

  factory _$BarModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BarModelImplFromJson(json);

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
  @JsonKey()
  final bool isBackup;
  @override
  @JsonKey(fromJson: timeFromJson)
  final String createdAt;

  @override
  String toString() {
    return 'BarModel(address: $address, finalBalance: $finalBalance, totalReceived: $totalReceived, color: $color, type: $type, label: $label, name: $name, blockchain: $blockchain, isBackup: $isBackup, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BarModelImpl &&
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
            (identical(other.isBackup, isBackup) ||
                other.isBackup == isBackup) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, address, finalBalance,
      totalReceived, color, type, label, name, blockchain, isBackup, createdAt);

  /// Create a copy of BarModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
          @JsonKey(name: 'final_balance') final int? finalBalance,
          @JsonKey(name: 'total_received') final int? totalReceived,
          final CardColor color,
          final CardType type,
          final WalletType label,
          final String name,
          final String blockchain,
          final bool isBackup,
          @JsonKey(fromJson: timeFromJson) final String createdAt}) =
      _$BarModelImpl;

  factory _BarModel.fromJson(Map<String, dynamic> json) =
      _$BarModelImpl.fromJson;

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
  bool get isBackup;
  @override
  @JsonKey(fromJson: timeFromJson)
  String get createdAt;

  /// Create a copy of BarModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BarModelImplCopyWith<_$BarModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
