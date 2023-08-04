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
  CardColor get cardColor => throw _privateConstructorUsedError;
  CardType get cardType => throw _privateConstructorUsedError;
  int? get totalReceived => throw _privateConstructorUsedError;
  int? get totalSent => throw _privateConstructorUsedError;
  int? get balance => throw _privateConstructorUsedError;

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
      CardColor cardColor,
      CardType cardType,
      int? totalReceived,
      int? totalSent,
      int? balance});
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
    Object? cardColor = null,
    Object? cardType = null,
    Object? totalReceived = freezed,
    Object? totalSent = freezed,
    Object? balance = freezed,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      cardColor: null == cardColor
          ? _value.cardColor
          : cardColor // ignore: cast_nullable_to_non_nullable
              as CardColor,
      cardType: null == cardType
          ? _value.cardType
          : cardType // ignore: cast_nullable_to_non_nullable
              as CardType,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CardModelCopyWith<$Res> implements $CardModelCopyWith<$Res> {
  factory _$$_CardModelCopyWith(
          _$_CardModel value, $Res Function(_$_CardModel) then) =
      __$$_CardModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String address,
      CardColor cardColor,
      CardType cardType,
      int? totalReceived,
      int? totalSent,
      int? balance});
}

/// @nodoc
class __$$_CardModelCopyWithImpl<$Res>
    extends _$CardModelCopyWithImpl<$Res, _$_CardModel>
    implements _$$_CardModelCopyWith<$Res> {
  __$$_CardModelCopyWithImpl(
      _$_CardModel _value, $Res Function(_$_CardModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? cardColor = null,
    Object? cardType = null,
    Object? totalReceived = freezed,
    Object? totalSent = freezed,
    Object? balance = freezed,
  }) {
    return _then(_$_CardModel(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      cardColor: null == cardColor
          ? _value.cardColor
          : cardColor // ignore: cast_nullable_to_non_nullable
              as CardColor,
      cardType: null == cardType
          ? _value.cardType
          : cardType // ignore: cast_nullable_to_non_nullable
              as CardType,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CardModel implements _CardModel {
  const _$_CardModel(
      {required this.address,
      this.cardColor = CardColor.ORANGE,
      this.cardType = CardType.CARD,
      this.totalReceived,
      this.totalSent,
      this.balance});

  factory _$_CardModel.fromJson(Map<String, dynamic> json) =>
      _$$_CardModelFromJson(json);

  @override
  final String address;
  @override
  @JsonKey()
  final CardColor cardColor;
  @override
  @JsonKey()
  final CardType cardType;
  @override
  final int? totalReceived;
  @override
  final int? totalSent;
  @override
  final int? balance;

  @override
  String toString() {
    return 'CardModel(address: $address, cardColor: $cardColor, cardType: $cardType, totalReceived: $totalReceived, totalSent: $totalSent, balance: $balance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardModel &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.cardColor, cardColor) ||
                other.cardColor == cardColor) &&
            (identical(other.cardType, cardType) ||
                other.cardType == cardType) &&
            (identical(other.totalReceived, totalReceived) ||
                other.totalReceived == totalReceived) &&
            (identical(other.totalSent, totalSent) ||
                other.totalSent == totalSent) &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, address, cardColor, cardType,
      totalReceived, totalSent, balance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardModelCopyWith<_$_CardModel> get copyWith =>
      __$$_CardModelCopyWithImpl<_$_CardModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CardModelToJson(
      this,
    );
  }
}

abstract class _CardModel implements CardModel {
  const factory _CardModel(
      {required final String address,
      final CardColor cardColor,
      final CardType cardType,
      final int? totalReceived,
      final int? totalSent,
      final int? balance}) = _$_CardModel;

  factory _CardModel.fromJson(Map<String, dynamic> json) =
      _$_CardModel.fromJson;

  @override
  String get address;
  @override
  CardColor get cardColor;
  @override
  CardType get cardType;
  @override
  int? get totalReceived;
  @override
  int? get totalSent;
  @override
  int? get balance;
  @override
  @JsonKey(ignore: true)
  _$$_CardModelCopyWith<_$_CardModel> get copyWith =>
      throw _privateConstructorUsedError;
}