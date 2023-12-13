// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'amplitude_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AmplitudeEvent _$AmplitudeEventFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'login':
      return LoginEvent.fromJson(json);
    case 'cardAdded':
      return CardAddedEvent.fromJson(json);
    case 'barAdded':
      return BarAddedEvent.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json, 'runtimeType', 'AmplitudeEvent', 'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$AmplitudeEvent {
  String get eventType => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) login,
    required TResult Function(String eventType, CardModel card) cardAdded,
    required TResult Function(String eventType, BarModel bar) barAdded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? login,
    TResult? Function(String eventType, CardModel card)? cardAdded,
    TResult? Function(String eventType, BarModel bar)? barAdded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? login,
    TResult Function(String eventType, CardModel card)? cardAdded,
    TResult Function(String eventType, BarModel bar)? barAdded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginEvent value) login,
    required TResult Function(CardAddedEvent value) cardAdded,
    required TResult Function(BarAddedEvent value) barAdded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginEvent value)? login,
    TResult? Function(CardAddedEvent value)? cardAdded,
    TResult? Function(BarAddedEvent value)? barAdded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginEvent value)? login,
    TResult Function(CardAddedEvent value)? cardAdded,
    TResult Function(BarAddedEvent value)? barAdded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AmplitudeEventCopyWith<AmplitudeEvent> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AmplitudeEventCopyWith<$Res> {
  factory $AmplitudeEventCopyWith(AmplitudeEvent value, $Res Function(AmplitudeEvent) then) =
      _$AmplitudeEventCopyWithImpl<$Res, AmplitudeEvent>;
  @useResult
  $Res call({String eventType});
}

/// @nodoc
class _$AmplitudeEventCopyWithImpl<$Res, $Val extends AmplitudeEvent> implements $AmplitudeEventCopyWith<$Res> {
  _$AmplitudeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
  }) {
    return _then(_value.copyWith(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginEventImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$LoginEventImplCopyWith(_$LoginEventImpl value, $Res Function(_$LoginEventImpl) then) =
      __$$LoginEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType});
}

/// @nodoc
class __$$LoginEventImplCopyWithImpl<$Res> extends _$AmplitudeEventCopyWithImpl<$Res, _$LoginEventImpl>
    implements _$$LoginEventImplCopyWith<$Res> {
  __$$LoginEventImplCopyWithImpl(_$LoginEventImpl _value, $Res Function(_$LoginEventImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
  }) {
    return _then(_$LoginEventImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginEventImpl with DiagnosticableTreeMixin implements LoginEvent {
  const _$LoginEventImpl({this.eventType = 'LOGIN', final String? $type}) : $type = $type ?? 'login';

  factory _$LoginEventImpl.fromJson(Map<String, dynamic> json) => _$$LoginEventImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.login(eventType: $eventType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.login'))
      ..add(DiagnosticsProperty('eventType', eventType));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginEventImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginEventImplCopyWith<_$LoginEventImpl> get copyWith =>
      __$$LoginEventImplCopyWithImpl<_$LoginEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) login,
    required TResult Function(String eventType, CardModel card) cardAdded,
    required TResult Function(String eventType, BarModel bar) barAdded,
  }) {
    return login(eventType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? login,
    TResult? Function(String eventType, CardModel card)? cardAdded,
    TResult? Function(String eventType, BarModel bar)? barAdded,
  }) {
    return login?.call(eventType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? login,
    TResult Function(String eventType, CardModel card)? cardAdded,
    TResult Function(String eventType, BarModel bar)? barAdded,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(eventType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginEvent value) login,
    required TResult Function(CardAddedEvent value) cardAdded,
    required TResult Function(BarAddedEvent value) barAdded,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginEvent value)? login,
    TResult? Function(CardAddedEvent value)? cardAdded,
    TResult? Function(BarAddedEvent value)? barAdded,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginEvent value)? login,
    TResult Function(CardAddedEvent value)? cardAdded,
    TResult Function(BarAddedEvent value)? barAdded,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginEventImplToJson(
      this,
    );
  }
}

abstract class LoginEvent implements AmplitudeEvent {
  const factory LoginEvent({final String eventType}) = _$LoginEventImpl;

  factory LoginEvent.fromJson(Map<String, dynamic> json) = _$LoginEventImpl.fromJson;

  @override
  String get eventType;
  @override
  @JsonKey(ignore: true)
  _$$LoginEventImplCopyWith<_$LoginEventImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CardAddedEventImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$CardAddedEventImplCopyWith(_$CardAddedEventImpl value, $Res Function(_$CardAddedEventImpl) then) =
      __$$CardAddedEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, CardModel card});

  $CardModelCopyWith<$Res> get card;
}

/// @nodoc
class __$$CardAddedEventImplCopyWithImpl<$Res> extends _$AmplitudeEventCopyWithImpl<$Res, _$CardAddedEventImpl>
    implements _$$CardAddedEventImplCopyWith<$Res> {
  __$$CardAddedEventImplCopyWithImpl(_$CardAddedEventImpl _value, $Res Function(_$CardAddedEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? card = null,
  }) {
    return _then(_$CardAddedEventImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      card: null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as CardModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CardModelCopyWith<$Res> get card {
    return $CardModelCopyWith<$Res>(_value.card, (value) {
      return _then(_value.copyWith(card: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$CardAddedEventImpl with DiagnosticableTreeMixin implements CardAddedEvent {
  const _$CardAddedEventImpl({this.eventType = 'CARD_ADDED', required this.card, final String? $type})
      : $type = $type ?? 'cardAdded';

  factory _$CardAddedEventImpl.fromJson(Map<String, dynamic> json) => _$$CardAddedEventImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;
  @override
  final CardModel card;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.cardAdded(eventType: $eventType, card: $card)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.cardAdded'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('card', card));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardAddedEventImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType) &&
            (identical(other.card, card) || other.card == card));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, card);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardAddedEventImplCopyWith<_$CardAddedEventImpl> get copyWith =>
      __$$CardAddedEventImplCopyWithImpl<_$CardAddedEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) login,
    required TResult Function(String eventType, CardModel card) cardAdded,
    required TResult Function(String eventType, BarModel bar) barAdded,
  }) {
    return cardAdded(eventType, card);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? login,
    TResult? Function(String eventType, CardModel card)? cardAdded,
    TResult? Function(String eventType, BarModel bar)? barAdded,
  }) {
    return cardAdded?.call(eventType, card);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? login,
    TResult Function(String eventType, CardModel card)? cardAdded,
    TResult Function(String eventType, BarModel bar)? barAdded,
    required TResult orElse(),
  }) {
    if (cardAdded != null) {
      return cardAdded(eventType, card);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginEvent value) login,
    required TResult Function(CardAddedEvent value) cardAdded,
    required TResult Function(BarAddedEvent value) barAdded,
  }) {
    return cardAdded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginEvent value)? login,
    TResult? Function(CardAddedEvent value)? cardAdded,
    TResult? Function(BarAddedEvent value)? barAdded,
  }) {
    return cardAdded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginEvent value)? login,
    TResult Function(CardAddedEvent value)? cardAdded,
    TResult Function(BarAddedEvent value)? barAdded,
    required TResult orElse(),
  }) {
    if (cardAdded != null) {
      return cardAdded(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CardAddedEventImplToJson(
      this,
    );
  }
}

abstract class CardAddedEvent implements AmplitudeEvent {
  const factory CardAddedEvent({final String eventType, required final CardModel card}) = _$CardAddedEventImpl;

  factory CardAddedEvent.fromJson(Map<String, dynamic> json) = _$CardAddedEventImpl.fromJson;

  @override
  String get eventType;
  CardModel get card;
  @override
  @JsonKey(ignore: true)
  _$$CardAddedEventImplCopyWith<_$CardAddedEventImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BarAddedEventImplCopyWith<$Res> implements $AmplitudeEventCopyWith<$Res> {
  factory _$$BarAddedEventImplCopyWith(_$BarAddedEventImpl value, $Res Function(_$BarAddedEventImpl) then) =
      __$$BarAddedEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventType, BarModel bar});

  $BarModelCopyWith<$Res> get bar;
}

/// @nodoc
class __$$BarAddedEventImplCopyWithImpl<$Res> extends _$AmplitudeEventCopyWithImpl<$Res, _$BarAddedEventImpl>
    implements _$$BarAddedEventImplCopyWith<$Res> {
  __$$BarAddedEventImplCopyWithImpl(_$BarAddedEventImpl _value, $Res Function(_$BarAddedEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? bar = null,
  }) {
    return _then(_$BarAddedEventImpl(
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      bar: null == bar
          ? _value.bar
          : bar // ignore: cast_nullable_to_non_nullable
              as BarModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BarModelCopyWith<$Res> get bar {
    return $BarModelCopyWith<$Res>(_value.bar, (value) {
      return _then(_value.copyWith(bar: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$BarAddedEventImpl with DiagnosticableTreeMixin implements BarAddedEvent {
  const _$BarAddedEventImpl({this.eventType = 'BAR_ADDED', required this.bar, final String? $type})
      : $type = $type ?? 'barAdded';

  factory _$BarAddedEventImpl.fromJson(Map<String, dynamic> json) => _$$BarAddedEventImplFromJson(json);

  @override
  @JsonKey()
  final String eventType;
  @override
  final BarModel bar;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AmplitudeEvent.barAdded(eventType: $eventType, bar: $bar)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AmplitudeEvent.barAdded'))
      ..add(DiagnosticsProperty('eventType', eventType))
      ..add(DiagnosticsProperty('bar', bar));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BarAddedEventImpl &&
            (identical(other.eventType, eventType) || other.eventType == eventType) &&
            (identical(other.bar, bar) || other.bar == bar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, bar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BarAddedEventImplCopyWith<_$BarAddedEventImpl> get copyWith =>
      __$$BarAddedEventImplCopyWithImpl<_$BarAddedEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventType) login,
    required TResult Function(String eventType, CardModel card) cardAdded,
    required TResult Function(String eventType, BarModel bar) barAdded,
  }) {
    return barAdded(eventType, bar);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventType)? login,
    TResult? Function(String eventType, CardModel card)? cardAdded,
    TResult? Function(String eventType, BarModel bar)? barAdded,
  }) {
    return barAdded?.call(eventType, bar);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventType)? login,
    TResult Function(String eventType, CardModel card)? cardAdded,
    TResult Function(String eventType, BarModel bar)? barAdded,
    required TResult orElse(),
  }) {
    if (barAdded != null) {
      return barAdded(eventType, bar);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginEvent value) login,
    required TResult Function(CardAddedEvent value) cardAdded,
    required TResult Function(BarAddedEvent value) barAdded,
  }) {
    return barAdded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginEvent value)? login,
    TResult? Function(CardAddedEvent value)? cardAdded,
    TResult? Function(BarAddedEvent value)? barAdded,
  }) {
    return barAdded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginEvent value)? login,
    TResult Function(CardAddedEvent value)? cardAdded,
    TResult Function(BarAddedEvent value)? barAdded,
    required TResult orElse(),
  }) {
    if (barAdded != null) {
      return barAdded(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$BarAddedEventImplToJson(
      this,
    );
  }
}

abstract class BarAddedEvent implements AmplitudeEvent {
  const factory BarAddedEvent({final String eventType, required final BarModel bar}) = _$BarAddedEventImpl;

  factory BarAddedEvent.fromJson(Map<String, dynamic> json) = _$BarAddedEventImpl.fromJson;

  @override
  String get eventType;
  BarModel get bar;
  @override
  @JsonKey(ignore: true)
  _$$BarAddedEventImplCopyWith<_$BarAddedEventImpl> get copyWith => throw _privateConstructorUsedError;
}
