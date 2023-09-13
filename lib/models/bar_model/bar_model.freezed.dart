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
  BarColor get barColor => throw _privateConstructorUsedError;
  CardType get cardType => throw _privateConstructorUsedError;
  String get barName => throw _privateConstructorUsedError;
  int? get totalReceived => throw _privateConstructorUsedError;
  int? get totalSent => throw _privateConstructorUsedError;
  int? get balance => throw _privateConstructorUsedError;
  String get cardAddedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      BarColor barColor,
      CardType cardType,
      String barName,
      int? totalReceived,
      int? totalSent,
      int? balance,
      String cardAddedDate});
}

/// @nodoc
class _$BarModelCopyWithImpl<$Res, $Val extends BarModel>
    implements $BarModelCopyWith<$Res> {
  _$BarModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? barColor = null,
    Object? cardType = null,
    Object? barName = null,
    Object? totalReceived = freezed,
    Object? totalSent = freezed,
    Object? balance = freezed,
    Object? cardAddedDate = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      barColor: null == barColor
          ? _value.barColor
          : barColor // ignore: cast_nullable_to_non_nullable
              as BarColor,
      cardType: null == cardType
          ? _value.cardType
          : cardType // ignore: cast_nullable_to_non_nullable
              as CardType,
      barName: null == barName
          ? _value.barName
          : barName // ignore: cast_nullable_to_non_nullable
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
      cardAddedDate: null == cardAddedDate
          ? _value.cardAddedDate
          : cardAddedDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BarModelCopyWith<$Res> implements $BarModelCopyWith<$Res> {
  factory _$$_BarModelCopyWith(
          _$_BarModel value, $Res Function(_$_BarModel) then) =
      __$$_BarModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String address,
      BarColor barColor,
      CardType cardType,
      String barName,
      int? totalReceived,
      int? totalSent,
      int? balance,
      String cardAddedDate});
}

/// @nodoc
class __$$_BarModelCopyWithImpl<$Res>
    extends _$BarModelCopyWithImpl<$Res, _$_BarModel>
    implements _$$_BarModelCopyWith<$Res> {
  __$$_BarModelCopyWithImpl(
      _$_BarModel _value, $Res Function(_$_BarModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? barColor = null,
    Object? cardType = null,
    Object? barName = null,
    Object? totalReceived = freezed,
    Object? totalSent = freezed,
    Object? balance = freezed,
    Object? cardAddedDate = null,
  }) {
    return _then(_$_BarModel(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      barColor: null == barColor
          ? _value.barColor
          : barColor // ignore: cast_nullable_to_non_nullable
              as BarColor,
      cardType: null == cardType
          ? _value.cardType
          : cardType // ignore: cast_nullable_to_non_nullable
              as CardType,
      barName: null == barName
          ? _value.barName
          : barName // ignore: cast_nullable_to_non_nullable
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
      cardAddedDate: null == cardAddedDate
          ? _value.cardAddedDate
          : cardAddedDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BarModel implements _BarModel {
  const _$_BarModel(
      {required this.address,
      this.barColor = BarColor.SILVER,
      this.cardType = CardType.BAR,
      this.barName = 'Coinplus Bitcoin Bar',
      this.totalReceived,
      this.totalSent,
      this.balance,
      this.cardAddedDate = '01/01/2023'});

  factory _$_BarModel.fromJson(Map<String, dynamic> json) =>
      _$$_BarModelFromJson(json);

  @override
  final String address;
  @override
  @JsonKey()
  final BarColor barColor;
  @override
  @JsonKey()
  final CardType cardType;
  @override
  @JsonKey()
  final String barName;
  @override
  final int? totalReceived;
  @override
  final int? totalSent;
  @override
  final int? balance;
  @override
  @JsonKey()
  final String cardAddedDate;

  @override
  String toString() {
    return 'BarModel(address: $address, barColor: $barColor, cardType: $cardType, barName: $barName, totalReceived: $totalReceived, totalSent: $totalSent, balance: $balance, cardAddedDate: $cardAddedDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BarModel &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.barColor, barColor) ||
                other.barColor == barColor) &&
            (identical(other.cardType, cardType) ||
                other.cardType == cardType) &&
            (identical(other.barName, barName) || other.barName == barName) &&
            (identical(other.totalReceived, totalReceived) ||
                other.totalReceived == totalReceived) &&
            (identical(other.totalSent, totalSent) ||
                other.totalSent == totalSent) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.cardAddedDate, cardAddedDate) ||
                other.cardAddedDate == cardAddedDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, address, barColor, cardType,
      barName, totalReceived, totalSent, balance, cardAddedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BarModelCopyWith<_$_BarModel> get copyWith =>
      __$$_BarModelCopyWithImpl<_$_BarModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BarModelToJson(
      this,
    );
  }
}

abstract class _BarModel implements BarModel {
  const factory _BarModel(
      {required final String address,
      final BarColor barColor,
      final CardType cardType,
      final String barName,
      final int? totalReceived,
      final int? totalSent,
      final int? balance,
      final String cardAddedDate}) = _$_BarModel;

  factory _BarModel.fromJson(Map<String, dynamic> json) = _$_BarModel.fromJson;

  @override
  String get address;
  @override
  BarColor get barColor;
  @override
  CardType get cardType;
  @override
  String get barName;
  @override
  int? get totalReceived;
  @override
  int? get totalSent;
  @override
  int? get balance;
  @override
  String get cardAddedDate;
  @override
  @JsonKey(ignore: true)
  _$$_BarModelCopyWith<_$_BarModel> get copyWith =>
      throw _privateConstructorUsedError;
}
