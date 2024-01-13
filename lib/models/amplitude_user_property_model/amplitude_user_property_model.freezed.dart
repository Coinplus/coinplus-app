// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'amplitude_user_property_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IdentifyModel _$IdentifyModelFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'cardTap':
      return CardTap.fromJson(json);
    case 'barTap':
      return BarTap.fromJson(json);
    case 'cardManual':
      return CardManual.fromJson(json);
    case 'barManual':
      return BarManual.fromJson(json);
    case 'tracker':
      return Tracker.fromJson(json);
    case 'cardHolder':
      return CardHolder.fromJson(json);
    case 'barHolder':
      return BarHolder.fromJson(json);
    case 'fraudActivity':
      return FraudActivity.fromJson(json);
    case 'activationFailed':
      return ActivationFailed.fromJson(json);
    case 'notificationsOn':
      return NotificationsOn.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json, 'runtimeType', 'IdentifyModel', 'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$IdentifyModel {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cardTap) cardTap,
    required TResult Function(String barTap) barTap,
    required TResult Function(String cardManual) cardManual,
    required TResult Function(String barManual) barManual,
    required TResult Function(String tracker) tracker,
    required TResult Function(String cardHolder) cardHolder,
    required TResult Function(String barHolder) barHolder,
    required TResult Function(String fraudActivity) fraudActivity,
    required TResult Function(String activationFailed) activationFailed,
    required TResult Function(String notificationOn) notificationsOn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cardTap)? cardTap,
    TResult? Function(String barTap)? barTap,
    TResult? Function(String cardManual)? cardManual,
    TResult? Function(String barManual)? barManual,
    TResult? Function(String tracker)? tracker,
    TResult? Function(String cardHolder)? cardHolder,
    TResult? Function(String barHolder)? barHolder,
    TResult? Function(String fraudActivity)? fraudActivity,
    TResult? Function(String activationFailed)? activationFailed,
    TResult? Function(String notificationOn)? notificationsOn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cardTap)? cardTap,
    TResult Function(String barTap)? barTap,
    TResult Function(String cardManual)? cardManual,
    TResult Function(String barManual)? barManual,
    TResult Function(String tracker)? tracker,
    TResult Function(String cardHolder)? cardHolder,
    TResult Function(String barHolder)? barHolder,
    TResult Function(String fraudActivity)? fraudActivity,
    TResult Function(String activationFailed)? activationFailed,
    TResult Function(String notificationOn)? notificationsOn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardTap value) cardTap,
    required TResult Function(BarTap value) barTap,
    required TResult Function(CardManual value) cardManual,
    required TResult Function(BarManual value) barManual,
    required TResult Function(Tracker value) tracker,
    required TResult Function(CardHolder value) cardHolder,
    required TResult Function(BarHolder value) barHolder,
    required TResult Function(FraudActivity value) fraudActivity,
    required TResult Function(ActivationFailed value) activationFailed,
    required TResult Function(NotificationsOn value) notificationsOn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CardTap value)? cardTap,
    TResult? Function(BarTap value)? barTap,
    TResult? Function(CardManual value)? cardManual,
    TResult? Function(BarManual value)? barManual,
    TResult? Function(Tracker value)? tracker,
    TResult? Function(CardHolder value)? cardHolder,
    TResult? Function(BarHolder value)? barHolder,
    TResult? Function(FraudActivity value)? fraudActivity,
    TResult? Function(ActivationFailed value)? activationFailed,
    TResult? Function(NotificationsOn value)? notificationsOn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardTap value)? cardTap,
    TResult Function(BarTap value)? barTap,
    TResult Function(CardManual value)? cardManual,
    TResult Function(BarManual value)? barManual,
    TResult Function(Tracker value)? tracker,
    TResult Function(CardHolder value)? cardHolder,
    TResult Function(BarHolder value)? barHolder,
    TResult Function(FraudActivity value)? fraudActivity,
    TResult Function(ActivationFailed value)? activationFailed,
    TResult Function(NotificationsOn value)? notificationsOn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdentifyModelCopyWith<$Res> {
  factory $IdentifyModelCopyWith(IdentifyModel value, $Res Function(IdentifyModel) then) =
      _$IdentifyModelCopyWithImpl<$Res, IdentifyModel>;
}

/// @nodoc
class _$IdentifyModelCopyWithImpl<$Res, $Val extends IdentifyModel> implements $IdentifyModelCopyWith<$Res> {
  _$IdentifyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CardTapImplCopyWith<$Res> {
  factory _$$CardTapImplCopyWith(_$CardTapImpl value, $Res Function(_$CardTapImpl) then) =
      __$$CardTapImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String cardTap});
}

/// @nodoc
class __$$CardTapImplCopyWithImpl<$Res> extends _$IdentifyModelCopyWithImpl<$Res, _$CardTapImpl>
    implements _$$CardTapImplCopyWith<$Res> {
  __$$CardTapImplCopyWithImpl(_$CardTapImpl _value, $Res Function(_$CardTapImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardTap = null,
  }) {
    return _then(_$CardTapImpl(
      cardTap: null == cardTap
          ? _value.cardTap
          : cardTap // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CardTapImpl with DiagnosticableTreeMixin implements CardTap {
  const _$CardTapImpl({this.cardTap = 'true', final String? $type}) : $type = $type ?? 'cardTap';

  factory _$CardTapImpl.fromJson(Map<String, dynamic> json) => _$$CardTapImplFromJson(json);

  @override
  @JsonKey()
  final String cardTap;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IdentifyModel.cardTap(cardTap: $cardTap)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IdentifyModel.cardTap'))
      ..add(DiagnosticsProperty('cardTap', cardTap));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardTapImpl &&
            (identical(other.cardTap, cardTap) || other.cardTap == cardTap));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cardTap);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardTapImplCopyWith<_$CardTapImpl> get copyWith => __$$CardTapImplCopyWithImpl<_$CardTapImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cardTap) cardTap,
    required TResult Function(String barTap) barTap,
    required TResult Function(String cardManual) cardManual,
    required TResult Function(String barManual) barManual,
    required TResult Function(String tracker) tracker,
    required TResult Function(String cardHolder) cardHolder,
    required TResult Function(String barHolder) barHolder,
    required TResult Function(String fraudActivity) fraudActivity,
    required TResult Function(String activationFailed) activationFailed,
    required TResult Function(String notificationOn) notificationsOn,
  }) {
    return cardTap(this.cardTap);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cardTap)? cardTap,
    TResult? Function(String barTap)? barTap,
    TResult? Function(String cardManual)? cardManual,
    TResult? Function(String barManual)? barManual,
    TResult? Function(String tracker)? tracker,
    TResult? Function(String cardHolder)? cardHolder,
    TResult? Function(String barHolder)? barHolder,
    TResult? Function(String fraudActivity)? fraudActivity,
    TResult? Function(String activationFailed)? activationFailed,
    TResult? Function(String notificationOn)? notificationsOn,
  }) {
    return cardTap?.call(this.cardTap);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cardTap)? cardTap,
    TResult Function(String barTap)? barTap,
    TResult Function(String cardManual)? cardManual,
    TResult Function(String barManual)? barManual,
    TResult Function(String tracker)? tracker,
    TResult Function(String cardHolder)? cardHolder,
    TResult Function(String barHolder)? barHolder,
    TResult Function(String fraudActivity)? fraudActivity,
    TResult Function(String activationFailed)? activationFailed,
    TResult Function(String notificationOn)? notificationsOn,
    required TResult orElse(),
  }) {
    if (cardTap != null) {
      return cardTap(this.cardTap);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardTap value) cardTap,
    required TResult Function(BarTap value) barTap,
    required TResult Function(CardManual value) cardManual,
    required TResult Function(BarManual value) barManual,
    required TResult Function(Tracker value) tracker,
    required TResult Function(CardHolder value) cardHolder,
    required TResult Function(BarHolder value) barHolder,
    required TResult Function(FraudActivity value) fraudActivity,
    required TResult Function(ActivationFailed value) activationFailed,
    required TResult Function(NotificationsOn value) notificationsOn,
  }) {
    return cardTap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CardTap value)? cardTap,
    TResult? Function(BarTap value)? barTap,
    TResult? Function(CardManual value)? cardManual,
    TResult? Function(BarManual value)? barManual,
    TResult? Function(Tracker value)? tracker,
    TResult? Function(CardHolder value)? cardHolder,
    TResult? Function(BarHolder value)? barHolder,
    TResult? Function(FraudActivity value)? fraudActivity,
    TResult? Function(ActivationFailed value)? activationFailed,
    TResult? Function(NotificationsOn value)? notificationsOn,
  }) {
    return cardTap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardTap value)? cardTap,
    TResult Function(BarTap value)? barTap,
    TResult Function(CardManual value)? cardManual,
    TResult Function(BarManual value)? barManual,
    TResult Function(Tracker value)? tracker,
    TResult Function(CardHolder value)? cardHolder,
    TResult Function(BarHolder value)? barHolder,
    TResult Function(FraudActivity value)? fraudActivity,
    TResult Function(ActivationFailed value)? activationFailed,
    TResult Function(NotificationsOn value)? notificationsOn,
    required TResult orElse(),
  }) {
    if (cardTap != null) {
      return cardTap(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CardTapImplToJson(
      this,
    );
  }
}

abstract class CardTap implements IdentifyModel {
  const factory CardTap({final String cardTap}) = _$CardTapImpl;

  factory CardTap.fromJson(Map<String, dynamic> json) = _$CardTapImpl.fromJson;

  String get cardTap;
  @JsonKey(ignore: true)
  _$$CardTapImplCopyWith<_$CardTapImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BarTapImplCopyWith<$Res> {
  factory _$$BarTapImplCopyWith(_$BarTapImpl value, $Res Function(_$BarTapImpl) then) =
      __$$BarTapImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String barTap});
}

/// @nodoc
class __$$BarTapImplCopyWithImpl<$Res> extends _$IdentifyModelCopyWithImpl<$Res, _$BarTapImpl>
    implements _$$BarTapImplCopyWith<$Res> {
  __$$BarTapImplCopyWithImpl(_$BarTapImpl _value, $Res Function(_$BarTapImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barTap = null,
  }) {
    return _then(_$BarTapImpl(
      barTap: null == barTap
          ? _value.barTap
          : barTap // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BarTapImpl with DiagnosticableTreeMixin implements BarTap {
  const _$BarTapImpl({this.barTap = 'true', final String? $type}) : $type = $type ?? 'barTap';

  factory _$BarTapImpl.fromJson(Map<String, dynamic> json) => _$$BarTapImplFromJson(json);

  @override
  @JsonKey()
  final String barTap;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IdentifyModel.barTap(barTap: $barTap)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IdentifyModel.barTap'))
      ..add(DiagnosticsProperty('barTap', barTap));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BarTapImpl &&
            (identical(other.barTap, barTap) || other.barTap == barTap));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, barTap);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BarTapImplCopyWith<_$BarTapImpl> get copyWith => __$$BarTapImplCopyWithImpl<_$BarTapImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cardTap) cardTap,
    required TResult Function(String barTap) barTap,
    required TResult Function(String cardManual) cardManual,
    required TResult Function(String barManual) barManual,
    required TResult Function(String tracker) tracker,
    required TResult Function(String cardHolder) cardHolder,
    required TResult Function(String barHolder) barHolder,
    required TResult Function(String fraudActivity) fraudActivity,
    required TResult Function(String activationFailed) activationFailed,
    required TResult Function(String notificationOn) notificationsOn,
  }) {
    return barTap(this.barTap);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cardTap)? cardTap,
    TResult? Function(String barTap)? barTap,
    TResult? Function(String cardManual)? cardManual,
    TResult? Function(String barManual)? barManual,
    TResult? Function(String tracker)? tracker,
    TResult? Function(String cardHolder)? cardHolder,
    TResult? Function(String barHolder)? barHolder,
    TResult? Function(String fraudActivity)? fraudActivity,
    TResult? Function(String activationFailed)? activationFailed,
    TResult? Function(String notificationOn)? notificationsOn,
  }) {
    return barTap?.call(this.barTap);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cardTap)? cardTap,
    TResult Function(String barTap)? barTap,
    TResult Function(String cardManual)? cardManual,
    TResult Function(String barManual)? barManual,
    TResult Function(String tracker)? tracker,
    TResult Function(String cardHolder)? cardHolder,
    TResult Function(String barHolder)? barHolder,
    TResult Function(String fraudActivity)? fraudActivity,
    TResult Function(String activationFailed)? activationFailed,
    TResult Function(String notificationOn)? notificationsOn,
    required TResult orElse(),
  }) {
    if (barTap != null) {
      return barTap(this.barTap);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardTap value) cardTap,
    required TResult Function(BarTap value) barTap,
    required TResult Function(CardManual value) cardManual,
    required TResult Function(BarManual value) barManual,
    required TResult Function(Tracker value) tracker,
    required TResult Function(CardHolder value) cardHolder,
    required TResult Function(BarHolder value) barHolder,
    required TResult Function(FraudActivity value) fraudActivity,
    required TResult Function(ActivationFailed value) activationFailed,
    required TResult Function(NotificationsOn value) notificationsOn,
  }) {
    return barTap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CardTap value)? cardTap,
    TResult? Function(BarTap value)? barTap,
    TResult? Function(CardManual value)? cardManual,
    TResult? Function(BarManual value)? barManual,
    TResult? Function(Tracker value)? tracker,
    TResult? Function(CardHolder value)? cardHolder,
    TResult? Function(BarHolder value)? barHolder,
    TResult? Function(FraudActivity value)? fraudActivity,
    TResult? Function(ActivationFailed value)? activationFailed,
    TResult? Function(NotificationsOn value)? notificationsOn,
  }) {
    return barTap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardTap value)? cardTap,
    TResult Function(BarTap value)? barTap,
    TResult Function(CardManual value)? cardManual,
    TResult Function(BarManual value)? barManual,
    TResult Function(Tracker value)? tracker,
    TResult Function(CardHolder value)? cardHolder,
    TResult Function(BarHolder value)? barHolder,
    TResult Function(FraudActivity value)? fraudActivity,
    TResult Function(ActivationFailed value)? activationFailed,
    TResult Function(NotificationsOn value)? notificationsOn,
    required TResult orElse(),
  }) {
    if (barTap != null) {
      return barTap(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$BarTapImplToJson(
      this,
    );
  }
}

abstract class BarTap implements IdentifyModel {
  const factory BarTap({final String barTap}) = _$BarTapImpl;

  factory BarTap.fromJson(Map<String, dynamic> json) = _$BarTapImpl.fromJson;

  String get barTap;
  @JsonKey(ignore: true)
  _$$BarTapImplCopyWith<_$BarTapImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CardManualImplCopyWith<$Res> {
  factory _$$CardManualImplCopyWith(_$CardManualImpl value, $Res Function(_$CardManualImpl) then) =
      __$$CardManualImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String cardManual});
}

/// @nodoc
class __$$CardManualImplCopyWithImpl<$Res> extends _$IdentifyModelCopyWithImpl<$Res, _$CardManualImpl>
    implements _$$CardManualImplCopyWith<$Res> {
  __$$CardManualImplCopyWithImpl(_$CardManualImpl _value, $Res Function(_$CardManualImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardManual = null,
  }) {
    return _then(_$CardManualImpl(
      cardManual: null == cardManual
          ? _value.cardManual
          : cardManual // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CardManualImpl with DiagnosticableTreeMixin implements CardManual {
  const _$CardManualImpl({this.cardManual = 'true', final String? $type}) : $type = $type ?? 'cardManual';

  factory _$CardManualImpl.fromJson(Map<String, dynamic> json) => _$$CardManualImplFromJson(json);

  @override
  @JsonKey()
  final String cardManual;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IdentifyModel.cardManual(cardManual: $cardManual)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IdentifyModel.cardManual'))
      ..add(DiagnosticsProperty('cardManual', cardManual));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardManualImpl &&
            (identical(other.cardManual, cardManual) || other.cardManual == cardManual));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cardManual);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardManualImplCopyWith<_$CardManualImpl> get copyWith =>
      __$$CardManualImplCopyWithImpl<_$CardManualImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cardTap) cardTap,
    required TResult Function(String barTap) barTap,
    required TResult Function(String cardManual) cardManual,
    required TResult Function(String barManual) barManual,
    required TResult Function(String tracker) tracker,
    required TResult Function(String cardHolder) cardHolder,
    required TResult Function(String barHolder) barHolder,
    required TResult Function(String fraudActivity) fraudActivity,
    required TResult Function(String activationFailed) activationFailed,
    required TResult Function(String notificationOn) notificationsOn,
  }) {
    return cardManual(this.cardManual);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cardTap)? cardTap,
    TResult? Function(String barTap)? barTap,
    TResult? Function(String cardManual)? cardManual,
    TResult? Function(String barManual)? barManual,
    TResult? Function(String tracker)? tracker,
    TResult? Function(String cardHolder)? cardHolder,
    TResult? Function(String barHolder)? barHolder,
    TResult? Function(String fraudActivity)? fraudActivity,
    TResult? Function(String activationFailed)? activationFailed,
    TResult? Function(String notificationOn)? notificationsOn,
  }) {
    return cardManual?.call(this.cardManual);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cardTap)? cardTap,
    TResult Function(String barTap)? barTap,
    TResult Function(String cardManual)? cardManual,
    TResult Function(String barManual)? barManual,
    TResult Function(String tracker)? tracker,
    TResult Function(String cardHolder)? cardHolder,
    TResult Function(String barHolder)? barHolder,
    TResult Function(String fraudActivity)? fraudActivity,
    TResult Function(String activationFailed)? activationFailed,
    TResult Function(String notificationOn)? notificationsOn,
    required TResult orElse(),
  }) {
    if (cardManual != null) {
      return cardManual(this.cardManual);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardTap value) cardTap,
    required TResult Function(BarTap value) barTap,
    required TResult Function(CardManual value) cardManual,
    required TResult Function(BarManual value) barManual,
    required TResult Function(Tracker value) tracker,
    required TResult Function(CardHolder value) cardHolder,
    required TResult Function(BarHolder value) barHolder,
    required TResult Function(FraudActivity value) fraudActivity,
    required TResult Function(ActivationFailed value) activationFailed,
    required TResult Function(NotificationsOn value) notificationsOn,
  }) {
    return cardManual(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CardTap value)? cardTap,
    TResult? Function(BarTap value)? barTap,
    TResult? Function(CardManual value)? cardManual,
    TResult? Function(BarManual value)? barManual,
    TResult? Function(Tracker value)? tracker,
    TResult? Function(CardHolder value)? cardHolder,
    TResult? Function(BarHolder value)? barHolder,
    TResult? Function(FraudActivity value)? fraudActivity,
    TResult? Function(ActivationFailed value)? activationFailed,
    TResult? Function(NotificationsOn value)? notificationsOn,
  }) {
    return cardManual?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardTap value)? cardTap,
    TResult Function(BarTap value)? barTap,
    TResult Function(CardManual value)? cardManual,
    TResult Function(BarManual value)? barManual,
    TResult Function(Tracker value)? tracker,
    TResult Function(CardHolder value)? cardHolder,
    TResult Function(BarHolder value)? barHolder,
    TResult Function(FraudActivity value)? fraudActivity,
    TResult Function(ActivationFailed value)? activationFailed,
    TResult Function(NotificationsOn value)? notificationsOn,
    required TResult orElse(),
  }) {
    if (cardManual != null) {
      return cardManual(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CardManualImplToJson(
      this,
    );
  }
}

abstract class CardManual implements IdentifyModel {
  const factory CardManual({final String cardManual}) = _$CardManualImpl;

  factory CardManual.fromJson(Map<String, dynamic> json) = _$CardManualImpl.fromJson;

  String get cardManual;
  @JsonKey(ignore: true)
  _$$CardManualImplCopyWith<_$CardManualImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BarManualImplCopyWith<$Res> {
  factory _$$BarManualImplCopyWith(_$BarManualImpl value, $Res Function(_$BarManualImpl) then) =
      __$$BarManualImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String barManual});
}

/// @nodoc
class __$$BarManualImplCopyWithImpl<$Res> extends _$IdentifyModelCopyWithImpl<$Res, _$BarManualImpl>
    implements _$$BarManualImplCopyWith<$Res> {
  __$$BarManualImplCopyWithImpl(_$BarManualImpl _value, $Res Function(_$BarManualImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barManual = null,
  }) {
    return _then(_$BarManualImpl(
      barManual: null == barManual
          ? _value.barManual
          : barManual // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BarManualImpl with DiagnosticableTreeMixin implements BarManual {
  const _$BarManualImpl({this.barManual = 'true', final String? $type}) : $type = $type ?? 'barManual';

  factory _$BarManualImpl.fromJson(Map<String, dynamic> json) => _$$BarManualImplFromJson(json);

  @override
  @JsonKey()
  final String barManual;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IdentifyModel.barManual(barManual: $barManual)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IdentifyModel.barManual'))
      ..add(DiagnosticsProperty('barManual', barManual));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BarManualImpl &&
            (identical(other.barManual, barManual) || other.barManual == barManual));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, barManual);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BarManualImplCopyWith<_$BarManualImpl> get copyWith =>
      __$$BarManualImplCopyWithImpl<_$BarManualImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cardTap) cardTap,
    required TResult Function(String barTap) barTap,
    required TResult Function(String cardManual) cardManual,
    required TResult Function(String barManual) barManual,
    required TResult Function(String tracker) tracker,
    required TResult Function(String cardHolder) cardHolder,
    required TResult Function(String barHolder) barHolder,
    required TResult Function(String fraudActivity) fraudActivity,
    required TResult Function(String activationFailed) activationFailed,
    required TResult Function(String notificationOn) notificationsOn,
  }) {
    return barManual(this.barManual);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cardTap)? cardTap,
    TResult? Function(String barTap)? barTap,
    TResult? Function(String cardManual)? cardManual,
    TResult? Function(String barManual)? barManual,
    TResult? Function(String tracker)? tracker,
    TResult? Function(String cardHolder)? cardHolder,
    TResult? Function(String barHolder)? barHolder,
    TResult? Function(String fraudActivity)? fraudActivity,
    TResult? Function(String activationFailed)? activationFailed,
    TResult? Function(String notificationOn)? notificationsOn,
  }) {
    return barManual?.call(this.barManual);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cardTap)? cardTap,
    TResult Function(String barTap)? barTap,
    TResult Function(String cardManual)? cardManual,
    TResult Function(String barManual)? barManual,
    TResult Function(String tracker)? tracker,
    TResult Function(String cardHolder)? cardHolder,
    TResult Function(String barHolder)? barHolder,
    TResult Function(String fraudActivity)? fraudActivity,
    TResult Function(String activationFailed)? activationFailed,
    TResult Function(String notificationOn)? notificationsOn,
    required TResult orElse(),
  }) {
    if (barManual != null) {
      return barManual(this.barManual);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardTap value) cardTap,
    required TResult Function(BarTap value) barTap,
    required TResult Function(CardManual value) cardManual,
    required TResult Function(BarManual value) barManual,
    required TResult Function(Tracker value) tracker,
    required TResult Function(CardHolder value) cardHolder,
    required TResult Function(BarHolder value) barHolder,
    required TResult Function(FraudActivity value) fraudActivity,
    required TResult Function(ActivationFailed value) activationFailed,
    required TResult Function(NotificationsOn value) notificationsOn,
  }) {
    return barManual(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CardTap value)? cardTap,
    TResult? Function(BarTap value)? barTap,
    TResult? Function(CardManual value)? cardManual,
    TResult? Function(BarManual value)? barManual,
    TResult? Function(Tracker value)? tracker,
    TResult? Function(CardHolder value)? cardHolder,
    TResult? Function(BarHolder value)? barHolder,
    TResult? Function(FraudActivity value)? fraudActivity,
    TResult? Function(ActivationFailed value)? activationFailed,
    TResult? Function(NotificationsOn value)? notificationsOn,
  }) {
    return barManual?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardTap value)? cardTap,
    TResult Function(BarTap value)? barTap,
    TResult Function(CardManual value)? cardManual,
    TResult Function(BarManual value)? barManual,
    TResult Function(Tracker value)? tracker,
    TResult Function(CardHolder value)? cardHolder,
    TResult Function(BarHolder value)? barHolder,
    TResult Function(FraudActivity value)? fraudActivity,
    TResult Function(ActivationFailed value)? activationFailed,
    TResult Function(NotificationsOn value)? notificationsOn,
    required TResult orElse(),
  }) {
    if (barManual != null) {
      return barManual(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$BarManualImplToJson(
      this,
    );
  }
}

abstract class BarManual implements IdentifyModel {
  const factory BarManual({final String barManual}) = _$BarManualImpl;

  factory BarManual.fromJson(Map<String, dynamic> json) = _$BarManualImpl.fromJson;

  String get barManual;
  @JsonKey(ignore: true)
  _$$BarManualImplCopyWith<_$BarManualImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TrackerImplCopyWith<$Res> {
  factory _$$TrackerImplCopyWith(_$TrackerImpl value, $Res Function(_$TrackerImpl) then) =
      __$$TrackerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String tracker});
}

/// @nodoc
class __$$TrackerImplCopyWithImpl<$Res> extends _$IdentifyModelCopyWithImpl<$Res, _$TrackerImpl>
    implements _$$TrackerImplCopyWith<$Res> {
  __$$TrackerImplCopyWithImpl(_$TrackerImpl _value, $Res Function(_$TrackerImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tracker = null,
  }) {
    return _then(_$TrackerImpl(
      tracker: null == tracker
          ? _value.tracker
          : tracker // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrackerImpl with DiagnosticableTreeMixin implements Tracker {
  const _$TrackerImpl({this.tracker = 'true', final String? $type}) : $type = $type ?? 'tracker';

  factory _$TrackerImpl.fromJson(Map<String, dynamic> json) => _$$TrackerImplFromJson(json);

  @override
  @JsonKey()
  final String tracker;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IdentifyModel.tracker(tracker: $tracker)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IdentifyModel.tracker'))
      ..add(DiagnosticsProperty('tracker', tracker));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackerImpl &&
            (identical(other.tracker, tracker) || other.tracker == tracker));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, tracker);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackerImplCopyWith<_$TrackerImpl> get copyWith => __$$TrackerImplCopyWithImpl<_$TrackerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cardTap) cardTap,
    required TResult Function(String barTap) barTap,
    required TResult Function(String cardManual) cardManual,
    required TResult Function(String barManual) barManual,
    required TResult Function(String tracker) tracker,
    required TResult Function(String cardHolder) cardHolder,
    required TResult Function(String barHolder) barHolder,
    required TResult Function(String fraudActivity) fraudActivity,
    required TResult Function(String activationFailed) activationFailed,
    required TResult Function(String notificationOn) notificationsOn,
  }) {
    return tracker(this.tracker);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cardTap)? cardTap,
    TResult? Function(String barTap)? barTap,
    TResult? Function(String cardManual)? cardManual,
    TResult? Function(String barManual)? barManual,
    TResult? Function(String tracker)? tracker,
    TResult? Function(String cardHolder)? cardHolder,
    TResult? Function(String barHolder)? barHolder,
    TResult? Function(String fraudActivity)? fraudActivity,
    TResult? Function(String activationFailed)? activationFailed,
    TResult? Function(String notificationOn)? notificationsOn,
  }) {
    return tracker?.call(this.tracker);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cardTap)? cardTap,
    TResult Function(String barTap)? barTap,
    TResult Function(String cardManual)? cardManual,
    TResult Function(String barManual)? barManual,
    TResult Function(String tracker)? tracker,
    TResult Function(String cardHolder)? cardHolder,
    TResult Function(String barHolder)? barHolder,
    TResult Function(String fraudActivity)? fraudActivity,
    TResult Function(String activationFailed)? activationFailed,
    TResult Function(String notificationOn)? notificationsOn,
    required TResult orElse(),
  }) {
    if (tracker != null) {
      return tracker(this.tracker);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardTap value) cardTap,
    required TResult Function(BarTap value) barTap,
    required TResult Function(CardManual value) cardManual,
    required TResult Function(BarManual value) barManual,
    required TResult Function(Tracker value) tracker,
    required TResult Function(CardHolder value) cardHolder,
    required TResult Function(BarHolder value) barHolder,
    required TResult Function(FraudActivity value) fraudActivity,
    required TResult Function(ActivationFailed value) activationFailed,
    required TResult Function(NotificationsOn value) notificationsOn,
  }) {
    return tracker(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CardTap value)? cardTap,
    TResult? Function(BarTap value)? barTap,
    TResult? Function(CardManual value)? cardManual,
    TResult? Function(BarManual value)? barManual,
    TResult? Function(Tracker value)? tracker,
    TResult? Function(CardHolder value)? cardHolder,
    TResult? Function(BarHolder value)? barHolder,
    TResult? Function(FraudActivity value)? fraudActivity,
    TResult? Function(ActivationFailed value)? activationFailed,
    TResult? Function(NotificationsOn value)? notificationsOn,
  }) {
    return tracker?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardTap value)? cardTap,
    TResult Function(BarTap value)? barTap,
    TResult Function(CardManual value)? cardManual,
    TResult Function(BarManual value)? barManual,
    TResult Function(Tracker value)? tracker,
    TResult Function(CardHolder value)? cardHolder,
    TResult Function(BarHolder value)? barHolder,
    TResult Function(FraudActivity value)? fraudActivity,
    TResult Function(ActivationFailed value)? activationFailed,
    TResult Function(NotificationsOn value)? notificationsOn,
    required TResult orElse(),
  }) {
    if (tracker != null) {
      return tracker(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackerImplToJson(
      this,
    );
  }
}

abstract class Tracker implements IdentifyModel {
  const factory Tracker({final String tracker}) = _$TrackerImpl;

  factory Tracker.fromJson(Map<String, dynamic> json) = _$TrackerImpl.fromJson;

  String get tracker;
  @JsonKey(ignore: true)
  _$$TrackerImplCopyWith<_$TrackerImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CardHolderImplCopyWith<$Res> {
  factory _$$CardHolderImplCopyWith(_$CardHolderImpl value, $Res Function(_$CardHolderImpl) then) =
      __$$CardHolderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String cardHolder});
}

/// @nodoc
class __$$CardHolderImplCopyWithImpl<$Res> extends _$IdentifyModelCopyWithImpl<$Res, _$CardHolderImpl>
    implements _$$CardHolderImplCopyWith<$Res> {
  __$$CardHolderImplCopyWithImpl(_$CardHolderImpl _value, $Res Function(_$CardHolderImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardHolder = null,
  }) {
    return _then(_$CardHolderImpl(
      cardHolder: null == cardHolder
          ? _value.cardHolder
          : cardHolder // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CardHolderImpl with DiagnosticableTreeMixin implements CardHolder {
  const _$CardHolderImpl({this.cardHolder = 'true', final String? $type}) : $type = $type ?? 'cardHolder';

  factory _$CardHolderImpl.fromJson(Map<String, dynamic> json) => _$$CardHolderImplFromJson(json);

  @override
  @JsonKey()
  final String cardHolder;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IdentifyModel.cardHolder(cardHolder: $cardHolder)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IdentifyModel.cardHolder'))
      ..add(DiagnosticsProperty('cardHolder', cardHolder));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardHolderImpl &&
            (identical(other.cardHolder, cardHolder) || other.cardHolder == cardHolder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cardHolder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardHolderImplCopyWith<_$CardHolderImpl> get copyWith =>
      __$$CardHolderImplCopyWithImpl<_$CardHolderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cardTap) cardTap,
    required TResult Function(String barTap) barTap,
    required TResult Function(String cardManual) cardManual,
    required TResult Function(String barManual) barManual,
    required TResult Function(String tracker) tracker,
    required TResult Function(String cardHolder) cardHolder,
    required TResult Function(String barHolder) barHolder,
    required TResult Function(String fraudActivity) fraudActivity,
    required TResult Function(String activationFailed) activationFailed,
    required TResult Function(String notificationOn) notificationsOn,
  }) {
    return cardHolder(this.cardHolder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cardTap)? cardTap,
    TResult? Function(String barTap)? barTap,
    TResult? Function(String cardManual)? cardManual,
    TResult? Function(String barManual)? barManual,
    TResult? Function(String tracker)? tracker,
    TResult? Function(String cardHolder)? cardHolder,
    TResult? Function(String barHolder)? barHolder,
    TResult? Function(String fraudActivity)? fraudActivity,
    TResult? Function(String activationFailed)? activationFailed,
    TResult? Function(String notificationOn)? notificationsOn,
  }) {
    return cardHolder?.call(this.cardHolder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cardTap)? cardTap,
    TResult Function(String barTap)? barTap,
    TResult Function(String cardManual)? cardManual,
    TResult Function(String barManual)? barManual,
    TResult Function(String tracker)? tracker,
    TResult Function(String cardHolder)? cardHolder,
    TResult Function(String barHolder)? barHolder,
    TResult Function(String fraudActivity)? fraudActivity,
    TResult Function(String activationFailed)? activationFailed,
    TResult Function(String notificationOn)? notificationsOn,
    required TResult orElse(),
  }) {
    if (cardHolder != null) {
      return cardHolder(this.cardHolder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardTap value) cardTap,
    required TResult Function(BarTap value) barTap,
    required TResult Function(CardManual value) cardManual,
    required TResult Function(BarManual value) barManual,
    required TResult Function(Tracker value) tracker,
    required TResult Function(CardHolder value) cardHolder,
    required TResult Function(BarHolder value) barHolder,
    required TResult Function(FraudActivity value) fraudActivity,
    required TResult Function(ActivationFailed value) activationFailed,
    required TResult Function(NotificationsOn value) notificationsOn,
  }) {
    return cardHolder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CardTap value)? cardTap,
    TResult? Function(BarTap value)? barTap,
    TResult? Function(CardManual value)? cardManual,
    TResult? Function(BarManual value)? barManual,
    TResult? Function(Tracker value)? tracker,
    TResult? Function(CardHolder value)? cardHolder,
    TResult? Function(BarHolder value)? barHolder,
    TResult? Function(FraudActivity value)? fraudActivity,
    TResult? Function(ActivationFailed value)? activationFailed,
    TResult? Function(NotificationsOn value)? notificationsOn,
  }) {
    return cardHolder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardTap value)? cardTap,
    TResult Function(BarTap value)? barTap,
    TResult Function(CardManual value)? cardManual,
    TResult Function(BarManual value)? barManual,
    TResult Function(Tracker value)? tracker,
    TResult Function(CardHolder value)? cardHolder,
    TResult Function(BarHolder value)? barHolder,
    TResult Function(FraudActivity value)? fraudActivity,
    TResult Function(ActivationFailed value)? activationFailed,
    TResult Function(NotificationsOn value)? notificationsOn,
    required TResult orElse(),
  }) {
    if (cardHolder != null) {
      return cardHolder(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CardHolderImplToJson(
      this,
    );
  }
}

abstract class CardHolder implements IdentifyModel {
  const factory CardHolder({final String cardHolder}) = _$CardHolderImpl;

  factory CardHolder.fromJson(Map<String, dynamic> json) = _$CardHolderImpl.fromJson;

  String get cardHolder;
  @JsonKey(ignore: true)
  _$$CardHolderImplCopyWith<_$CardHolderImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BarHolderImplCopyWith<$Res> {
  factory _$$BarHolderImplCopyWith(_$BarHolderImpl value, $Res Function(_$BarHolderImpl) then) =
      __$$BarHolderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String barHolder});
}

/// @nodoc
class __$$BarHolderImplCopyWithImpl<$Res> extends _$IdentifyModelCopyWithImpl<$Res, _$BarHolderImpl>
    implements _$$BarHolderImplCopyWith<$Res> {
  __$$BarHolderImplCopyWithImpl(_$BarHolderImpl _value, $Res Function(_$BarHolderImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barHolder = null,
  }) {
    return _then(_$BarHolderImpl(
      barHolder: null == barHolder
          ? _value.barHolder
          : barHolder // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BarHolderImpl with DiagnosticableTreeMixin implements BarHolder {
  const _$BarHolderImpl({this.barHolder = 'true', final String? $type}) : $type = $type ?? 'barHolder';

  factory _$BarHolderImpl.fromJson(Map<String, dynamic> json) => _$$BarHolderImplFromJson(json);

  @override
  @JsonKey()
  final String barHolder;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IdentifyModel.barHolder(barHolder: $barHolder)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IdentifyModel.barHolder'))
      ..add(DiagnosticsProperty('barHolder', barHolder));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BarHolderImpl &&
            (identical(other.barHolder, barHolder) || other.barHolder == barHolder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, barHolder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BarHolderImplCopyWith<_$BarHolderImpl> get copyWith =>
      __$$BarHolderImplCopyWithImpl<_$BarHolderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cardTap) cardTap,
    required TResult Function(String barTap) barTap,
    required TResult Function(String cardManual) cardManual,
    required TResult Function(String barManual) barManual,
    required TResult Function(String tracker) tracker,
    required TResult Function(String cardHolder) cardHolder,
    required TResult Function(String barHolder) barHolder,
    required TResult Function(String fraudActivity) fraudActivity,
    required TResult Function(String activationFailed) activationFailed,
    required TResult Function(String notificationOn) notificationsOn,
  }) {
    return barHolder(this.barHolder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cardTap)? cardTap,
    TResult? Function(String barTap)? barTap,
    TResult? Function(String cardManual)? cardManual,
    TResult? Function(String barManual)? barManual,
    TResult? Function(String tracker)? tracker,
    TResult? Function(String cardHolder)? cardHolder,
    TResult? Function(String barHolder)? barHolder,
    TResult? Function(String fraudActivity)? fraudActivity,
    TResult? Function(String activationFailed)? activationFailed,
    TResult? Function(String notificationOn)? notificationsOn,
  }) {
    return barHolder?.call(this.barHolder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cardTap)? cardTap,
    TResult Function(String barTap)? barTap,
    TResult Function(String cardManual)? cardManual,
    TResult Function(String barManual)? barManual,
    TResult Function(String tracker)? tracker,
    TResult Function(String cardHolder)? cardHolder,
    TResult Function(String barHolder)? barHolder,
    TResult Function(String fraudActivity)? fraudActivity,
    TResult Function(String activationFailed)? activationFailed,
    TResult Function(String notificationOn)? notificationsOn,
    required TResult orElse(),
  }) {
    if (barHolder != null) {
      return barHolder(this.barHolder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardTap value) cardTap,
    required TResult Function(BarTap value) barTap,
    required TResult Function(CardManual value) cardManual,
    required TResult Function(BarManual value) barManual,
    required TResult Function(Tracker value) tracker,
    required TResult Function(CardHolder value) cardHolder,
    required TResult Function(BarHolder value) barHolder,
    required TResult Function(FraudActivity value) fraudActivity,
    required TResult Function(ActivationFailed value) activationFailed,
    required TResult Function(NotificationsOn value) notificationsOn,
  }) {
    return barHolder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CardTap value)? cardTap,
    TResult? Function(BarTap value)? barTap,
    TResult? Function(CardManual value)? cardManual,
    TResult? Function(BarManual value)? barManual,
    TResult? Function(Tracker value)? tracker,
    TResult? Function(CardHolder value)? cardHolder,
    TResult? Function(BarHolder value)? barHolder,
    TResult? Function(FraudActivity value)? fraudActivity,
    TResult? Function(ActivationFailed value)? activationFailed,
    TResult? Function(NotificationsOn value)? notificationsOn,
  }) {
    return barHolder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardTap value)? cardTap,
    TResult Function(BarTap value)? barTap,
    TResult Function(CardManual value)? cardManual,
    TResult Function(BarManual value)? barManual,
    TResult Function(Tracker value)? tracker,
    TResult Function(CardHolder value)? cardHolder,
    TResult Function(BarHolder value)? barHolder,
    TResult Function(FraudActivity value)? fraudActivity,
    TResult Function(ActivationFailed value)? activationFailed,
    TResult Function(NotificationsOn value)? notificationsOn,
    required TResult orElse(),
  }) {
    if (barHolder != null) {
      return barHolder(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$BarHolderImplToJson(
      this,
    );
  }
}

abstract class BarHolder implements IdentifyModel {
  const factory BarHolder({final String barHolder}) = _$BarHolderImpl;

  factory BarHolder.fromJson(Map<String, dynamic> json) = _$BarHolderImpl.fromJson;

  String get barHolder;
  @JsonKey(ignore: true)
  _$$BarHolderImplCopyWith<_$BarHolderImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FraudActivityImplCopyWith<$Res> {
  factory _$$FraudActivityImplCopyWith(_$FraudActivityImpl value, $Res Function(_$FraudActivityImpl) then) =
      __$$FraudActivityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String fraudActivity});
}

/// @nodoc
class __$$FraudActivityImplCopyWithImpl<$Res> extends _$IdentifyModelCopyWithImpl<$Res, _$FraudActivityImpl>
    implements _$$FraudActivityImplCopyWith<$Res> {
  __$$FraudActivityImplCopyWithImpl(_$FraudActivityImpl _value, $Res Function(_$FraudActivityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fraudActivity = null,
  }) {
    return _then(_$FraudActivityImpl(
      fraudActivity: null == fraudActivity
          ? _value.fraudActivity
          : fraudActivity // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FraudActivityImpl with DiagnosticableTreeMixin implements FraudActivity {
  const _$FraudActivityImpl({this.fraudActivity = 'true', final String? $type}) : $type = $type ?? 'fraudActivity';

  factory _$FraudActivityImpl.fromJson(Map<String, dynamic> json) => _$$FraudActivityImplFromJson(json);

  @override
  @JsonKey()
  final String fraudActivity;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IdentifyModel.fraudActivity(fraudActivity: $fraudActivity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IdentifyModel.fraudActivity'))
      ..add(DiagnosticsProperty('fraudActivity', fraudActivity));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FraudActivityImpl &&
            (identical(other.fraudActivity, fraudActivity) || other.fraudActivity == fraudActivity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fraudActivity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FraudActivityImplCopyWith<_$FraudActivityImpl> get copyWith =>
      __$$FraudActivityImplCopyWithImpl<_$FraudActivityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cardTap) cardTap,
    required TResult Function(String barTap) barTap,
    required TResult Function(String cardManual) cardManual,
    required TResult Function(String barManual) barManual,
    required TResult Function(String tracker) tracker,
    required TResult Function(String cardHolder) cardHolder,
    required TResult Function(String barHolder) barHolder,
    required TResult Function(String fraudActivity) fraudActivity,
    required TResult Function(String activationFailed) activationFailed,
    required TResult Function(String notificationOn) notificationsOn,
  }) {
    return fraudActivity(this.fraudActivity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cardTap)? cardTap,
    TResult? Function(String barTap)? barTap,
    TResult? Function(String cardManual)? cardManual,
    TResult? Function(String barManual)? barManual,
    TResult? Function(String tracker)? tracker,
    TResult? Function(String cardHolder)? cardHolder,
    TResult? Function(String barHolder)? barHolder,
    TResult? Function(String fraudActivity)? fraudActivity,
    TResult? Function(String activationFailed)? activationFailed,
    TResult? Function(String notificationOn)? notificationsOn,
  }) {
    return fraudActivity?.call(this.fraudActivity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cardTap)? cardTap,
    TResult Function(String barTap)? barTap,
    TResult Function(String cardManual)? cardManual,
    TResult Function(String barManual)? barManual,
    TResult Function(String tracker)? tracker,
    TResult Function(String cardHolder)? cardHolder,
    TResult Function(String barHolder)? barHolder,
    TResult Function(String fraudActivity)? fraudActivity,
    TResult Function(String activationFailed)? activationFailed,
    TResult Function(String notificationOn)? notificationsOn,
    required TResult orElse(),
  }) {
    if (fraudActivity != null) {
      return fraudActivity(this.fraudActivity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardTap value) cardTap,
    required TResult Function(BarTap value) barTap,
    required TResult Function(CardManual value) cardManual,
    required TResult Function(BarManual value) barManual,
    required TResult Function(Tracker value) tracker,
    required TResult Function(CardHolder value) cardHolder,
    required TResult Function(BarHolder value) barHolder,
    required TResult Function(FraudActivity value) fraudActivity,
    required TResult Function(ActivationFailed value) activationFailed,
    required TResult Function(NotificationsOn value) notificationsOn,
  }) {
    return fraudActivity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CardTap value)? cardTap,
    TResult? Function(BarTap value)? barTap,
    TResult? Function(CardManual value)? cardManual,
    TResult? Function(BarManual value)? barManual,
    TResult? Function(Tracker value)? tracker,
    TResult? Function(CardHolder value)? cardHolder,
    TResult? Function(BarHolder value)? barHolder,
    TResult? Function(FraudActivity value)? fraudActivity,
    TResult? Function(ActivationFailed value)? activationFailed,
    TResult? Function(NotificationsOn value)? notificationsOn,
  }) {
    return fraudActivity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardTap value)? cardTap,
    TResult Function(BarTap value)? barTap,
    TResult Function(CardManual value)? cardManual,
    TResult Function(BarManual value)? barManual,
    TResult Function(Tracker value)? tracker,
    TResult Function(CardHolder value)? cardHolder,
    TResult Function(BarHolder value)? barHolder,
    TResult Function(FraudActivity value)? fraudActivity,
    TResult Function(ActivationFailed value)? activationFailed,
    TResult Function(NotificationsOn value)? notificationsOn,
    required TResult orElse(),
  }) {
    if (fraudActivity != null) {
      return fraudActivity(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FraudActivityImplToJson(
      this,
    );
  }
}

abstract class FraudActivity implements IdentifyModel {
  const factory FraudActivity({final String fraudActivity}) = _$FraudActivityImpl;

  factory FraudActivity.fromJson(Map<String, dynamic> json) = _$FraudActivityImpl.fromJson;

  String get fraudActivity;
  @JsonKey(ignore: true)
  _$$FraudActivityImplCopyWith<_$FraudActivityImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ActivationFailedImplCopyWith<$Res> {
  factory _$$ActivationFailedImplCopyWith(_$ActivationFailedImpl value, $Res Function(_$ActivationFailedImpl) then) =
      __$$ActivationFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String activationFailed});
}

/// @nodoc
class __$$ActivationFailedImplCopyWithImpl<$Res> extends _$IdentifyModelCopyWithImpl<$Res, _$ActivationFailedImpl>
    implements _$$ActivationFailedImplCopyWith<$Res> {
  __$$ActivationFailedImplCopyWithImpl(_$ActivationFailedImpl _value, $Res Function(_$ActivationFailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activationFailed = null,
  }) {
    return _then(_$ActivationFailedImpl(
      activationFailed: null == activationFailed
          ? _value.activationFailed
          : activationFailed // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivationFailedImpl with DiagnosticableTreeMixin implements ActivationFailed {
  const _$ActivationFailedImpl({this.activationFailed = 'true', final String? $type})
      : $type = $type ?? 'activationFailed';

  factory _$ActivationFailedImpl.fromJson(Map<String, dynamic> json) => _$$ActivationFailedImplFromJson(json);

  @override
  @JsonKey()
  final String activationFailed;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IdentifyModel.activationFailed(activationFailed: $activationFailed)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IdentifyModel.activationFailed'))
      ..add(DiagnosticsProperty('activationFailed', activationFailed));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivationFailedImpl &&
            (identical(other.activationFailed, activationFailed) || other.activationFailed == activationFailed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, activationFailed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivationFailedImplCopyWith<_$ActivationFailedImpl> get copyWith =>
      __$$ActivationFailedImplCopyWithImpl<_$ActivationFailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cardTap) cardTap,
    required TResult Function(String barTap) barTap,
    required TResult Function(String cardManual) cardManual,
    required TResult Function(String barManual) barManual,
    required TResult Function(String tracker) tracker,
    required TResult Function(String cardHolder) cardHolder,
    required TResult Function(String barHolder) barHolder,
    required TResult Function(String fraudActivity) fraudActivity,
    required TResult Function(String activationFailed) activationFailed,
    required TResult Function(String notificationOn) notificationsOn,
  }) {
    return activationFailed(this.activationFailed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cardTap)? cardTap,
    TResult? Function(String barTap)? barTap,
    TResult? Function(String cardManual)? cardManual,
    TResult? Function(String barManual)? barManual,
    TResult? Function(String tracker)? tracker,
    TResult? Function(String cardHolder)? cardHolder,
    TResult? Function(String barHolder)? barHolder,
    TResult? Function(String fraudActivity)? fraudActivity,
    TResult? Function(String activationFailed)? activationFailed,
    TResult? Function(String notificationOn)? notificationsOn,
  }) {
    return activationFailed?.call(this.activationFailed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cardTap)? cardTap,
    TResult Function(String barTap)? barTap,
    TResult Function(String cardManual)? cardManual,
    TResult Function(String barManual)? barManual,
    TResult Function(String tracker)? tracker,
    TResult Function(String cardHolder)? cardHolder,
    TResult Function(String barHolder)? barHolder,
    TResult Function(String fraudActivity)? fraudActivity,
    TResult Function(String activationFailed)? activationFailed,
    TResult Function(String notificationOn)? notificationsOn,
    required TResult orElse(),
  }) {
    if (activationFailed != null) {
      return activationFailed(this.activationFailed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardTap value) cardTap,
    required TResult Function(BarTap value) barTap,
    required TResult Function(CardManual value) cardManual,
    required TResult Function(BarManual value) barManual,
    required TResult Function(Tracker value) tracker,
    required TResult Function(CardHolder value) cardHolder,
    required TResult Function(BarHolder value) barHolder,
    required TResult Function(FraudActivity value) fraudActivity,
    required TResult Function(ActivationFailed value) activationFailed,
    required TResult Function(NotificationsOn value) notificationsOn,
  }) {
    return activationFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CardTap value)? cardTap,
    TResult? Function(BarTap value)? barTap,
    TResult? Function(CardManual value)? cardManual,
    TResult? Function(BarManual value)? barManual,
    TResult? Function(Tracker value)? tracker,
    TResult? Function(CardHolder value)? cardHolder,
    TResult? Function(BarHolder value)? barHolder,
    TResult? Function(FraudActivity value)? fraudActivity,
    TResult? Function(ActivationFailed value)? activationFailed,
    TResult? Function(NotificationsOn value)? notificationsOn,
  }) {
    return activationFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardTap value)? cardTap,
    TResult Function(BarTap value)? barTap,
    TResult Function(CardManual value)? cardManual,
    TResult Function(BarManual value)? barManual,
    TResult Function(Tracker value)? tracker,
    TResult Function(CardHolder value)? cardHolder,
    TResult Function(BarHolder value)? barHolder,
    TResult Function(FraudActivity value)? fraudActivity,
    TResult Function(ActivationFailed value)? activationFailed,
    TResult Function(NotificationsOn value)? notificationsOn,
    required TResult orElse(),
  }) {
    if (activationFailed != null) {
      return activationFailed(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivationFailedImplToJson(
      this,
    );
  }
}

abstract class ActivationFailed implements IdentifyModel {
  const factory ActivationFailed({final String activationFailed}) = _$ActivationFailedImpl;

  factory ActivationFailed.fromJson(Map<String, dynamic> json) = _$ActivationFailedImpl.fromJson;

  String get activationFailed;
  @JsonKey(ignore: true)
  _$$ActivationFailedImplCopyWith<_$ActivationFailedImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotificationsOnImplCopyWith<$Res> {
  factory _$$NotificationsOnImplCopyWith(_$NotificationsOnImpl value, $Res Function(_$NotificationsOnImpl) then) =
      __$$NotificationsOnImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String notificationOn});
}

/// @nodoc
class __$$NotificationsOnImplCopyWithImpl<$Res> extends _$IdentifyModelCopyWithImpl<$Res, _$NotificationsOnImpl>
    implements _$$NotificationsOnImplCopyWith<$Res> {
  __$$NotificationsOnImplCopyWithImpl(_$NotificationsOnImpl _value, $Res Function(_$NotificationsOnImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationOn = null,
  }) {
    return _then(_$NotificationsOnImpl(
      notificationOn: null == notificationOn
          ? _value.notificationOn
          : notificationOn // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationsOnImpl with DiagnosticableTreeMixin implements NotificationsOn {
  const _$NotificationsOnImpl({this.notificationOn = 'true', final String? $type}) : $type = $type ?? 'notificationsOn';

  factory _$NotificationsOnImpl.fromJson(Map<String, dynamic> json) => _$$NotificationsOnImplFromJson(json);

  @override
  @JsonKey()
  final String notificationOn;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IdentifyModel.notificationsOn(notificationOn: $notificationOn)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IdentifyModel.notificationsOn'))
      ..add(DiagnosticsProperty('notificationOn', notificationOn));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationsOnImpl &&
            (identical(other.notificationOn, notificationOn) || other.notificationOn == notificationOn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, notificationOn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationsOnImplCopyWith<_$NotificationsOnImpl> get copyWith =>
      __$$NotificationsOnImplCopyWithImpl<_$NotificationsOnImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cardTap) cardTap,
    required TResult Function(String barTap) barTap,
    required TResult Function(String cardManual) cardManual,
    required TResult Function(String barManual) barManual,
    required TResult Function(String tracker) tracker,
    required TResult Function(String cardHolder) cardHolder,
    required TResult Function(String barHolder) barHolder,
    required TResult Function(String fraudActivity) fraudActivity,
    required TResult Function(String activationFailed) activationFailed,
    required TResult Function(String notificationOn) notificationsOn,
  }) {
    return notificationsOn(notificationOn);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cardTap)? cardTap,
    TResult? Function(String barTap)? barTap,
    TResult? Function(String cardManual)? cardManual,
    TResult? Function(String barManual)? barManual,
    TResult? Function(String tracker)? tracker,
    TResult? Function(String cardHolder)? cardHolder,
    TResult? Function(String barHolder)? barHolder,
    TResult? Function(String fraudActivity)? fraudActivity,
    TResult? Function(String activationFailed)? activationFailed,
    TResult? Function(String notificationOn)? notificationsOn,
  }) {
    return notificationsOn?.call(notificationOn);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cardTap)? cardTap,
    TResult Function(String barTap)? barTap,
    TResult Function(String cardManual)? cardManual,
    TResult Function(String barManual)? barManual,
    TResult Function(String tracker)? tracker,
    TResult Function(String cardHolder)? cardHolder,
    TResult Function(String barHolder)? barHolder,
    TResult Function(String fraudActivity)? fraudActivity,
    TResult Function(String activationFailed)? activationFailed,
    TResult Function(String notificationOn)? notificationsOn,
    required TResult orElse(),
  }) {
    if (notificationsOn != null) {
      return notificationsOn(notificationOn);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardTap value) cardTap,
    required TResult Function(BarTap value) barTap,
    required TResult Function(CardManual value) cardManual,
    required TResult Function(BarManual value) barManual,
    required TResult Function(Tracker value) tracker,
    required TResult Function(CardHolder value) cardHolder,
    required TResult Function(BarHolder value) barHolder,
    required TResult Function(FraudActivity value) fraudActivity,
    required TResult Function(ActivationFailed value) activationFailed,
    required TResult Function(NotificationsOn value) notificationsOn,
  }) {
    return notificationsOn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CardTap value)? cardTap,
    TResult? Function(BarTap value)? barTap,
    TResult? Function(CardManual value)? cardManual,
    TResult? Function(BarManual value)? barManual,
    TResult? Function(Tracker value)? tracker,
    TResult? Function(CardHolder value)? cardHolder,
    TResult? Function(BarHolder value)? barHolder,
    TResult? Function(FraudActivity value)? fraudActivity,
    TResult? Function(ActivationFailed value)? activationFailed,
    TResult? Function(NotificationsOn value)? notificationsOn,
  }) {
    return notificationsOn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardTap value)? cardTap,
    TResult Function(BarTap value)? barTap,
    TResult Function(CardManual value)? cardManual,
    TResult Function(BarManual value)? barManual,
    TResult Function(Tracker value)? tracker,
    TResult Function(CardHolder value)? cardHolder,
    TResult Function(BarHolder value)? barHolder,
    TResult Function(FraudActivity value)? fraudActivity,
    TResult Function(ActivationFailed value)? activationFailed,
    TResult Function(NotificationsOn value)? notificationsOn,
    required TResult orElse(),
  }) {
    if (notificationsOn != null) {
      return notificationsOn(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationsOnImplToJson(
      this,
    );
  }
}

abstract class NotificationsOn implements IdentifyModel {
  const factory NotificationsOn({final String notificationOn}) = _$NotificationsOnImpl;

  factory NotificationsOn.fromJson(Map<String, dynamic> json) = _$NotificationsOnImpl.fromJson;

  String get notificationOn;
  @JsonKey(ignore: true)
  _$$NotificationsOnImplCopyWith<_$NotificationsOnImpl> get copyWith => throw _privateConstructorUsedError;
}
