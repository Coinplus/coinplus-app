// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'utxo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UtxoModel _$UtxoModelFromJson(Map<String, dynamic> json) {
  return _UtxoModel.fromJson(json);
}

/// @nodoc
mixin _$UtxoModel {
  @JsonKey(name: 'tx_hash_big_endian')
  String get txHashBigEndian => throw _privateConstructorUsedError;
  @JsonKey(name: 'tx_hash')
  String get txHash => throw _privateConstructorUsedError;
  @JsonKey(name: 'tx_output_n')
  int get txOutputN => throw _privateConstructorUsedError;
  String get script => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;
  @JsonKey(name: 'value_hex')
  String get valueHex => throw _privateConstructorUsedError;
  int get confirmations => throw _privateConstructorUsedError;
  @JsonKey(name: 'tx_index')
  int get txIndex => throw _privateConstructorUsedError;

  /// Serializes this UtxoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UtxoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UtxoModelCopyWith<UtxoModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UtxoModelCopyWith<$Res> {
  factory $UtxoModelCopyWith(UtxoModel value, $Res Function(UtxoModel) then) = _$UtxoModelCopyWithImpl<$Res, UtxoModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'tx_hash_big_endian') String txHashBigEndian,
      @JsonKey(name: 'tx_hash') String txHash,
      @JsonKey(name: 'tx_output_n') int txOutputN,
      String script,
      int value,
      @JsonKey(name: 'value_hex') String valueHex,
      int confirmations,
      @JsonKey(name: 'tx_index') int txIndex});
}

/// @nodoc
class _$UtxoModelCopyWithImpl<$Res, $Val extends UtxoModel> implements $UtxoModelCopyWith<$Res> {
  _$UtxoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UtxoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? txHashBigEndian = null,
    Object? txHash = null,
    Object? txOutputN = null,
    Object? script = null,
    Object? value = null,
    Object? valueHex = null,
    Object? confirmations = null,
    Object? txIndex = null,
  }) {
    return _then(_value.copyWith(
      txHashBigEndian: null == txHashBigEndian
          ? _value.txHashBigEndian
          : txHashBigEndian // ignore: cast_nullable_to_non_nullable
              as String,
      txHash: null == txHash
          ? _value.txHash
          : txHash // ignore: cast_nullable_to_non_nullable
              as String,
      txOutputN: null == txOutputN
          ? _value.txOutputN
          : txOutputN // ignore: cast_nullable_to_non_nullable
              as int,
      script: null == script
          ? _value.script
          : script // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      valueHex: null == valueHex
          ? _value.valueHex
          : valueHex // ignore: cast_nullable_to_non_nullable
              as String,
      confirmations: null == confirmations
          ? _value.confirmations
          : confirmations // ignore: cast_nullable_to_non_nullable
              as int,
      txIndex: null == txIndex
          ? _value.txIndex
          : txIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UtxoModelImplCopyWith<$Res> implements $UtxoModelCopyWith<$Res> {
  factory _$$UtxoModelImplCopyWith(_$UtxoModelImpl value, $Res Function(_$UtxoModelImpl) then) =
      __$$UtxoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'tx_hash_big_endian') String txHashBigEndian,
      @JsonKey(name: 'tx_hash') String txHash,
      @JsonKey(name: 'tx_output_n') int txOutputN,
      String script,
      int value,
      @JsonKey(name: 'value_hex') String valueHex,
      int confirmations,
      @JsonKey(name: 'tx_index') int txIndex});
}

/// @nodoc
class __$$UtxoModelImplCopyWithImpl<$Res> extends _$UtxoModelCopyWithImpl<$Res, _$UtxoModelImpl>
    implements _$$UtxoModelImplCopyWith<$Res> {
  __$$UtxoModelImplCopyWithImpl(_$UtxoModelImpl _value, $Res Function(_$UtxoModelImpl) _then) : super(_value, _then);

  /// Create a copy of UtxoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? txHashBigEndian = null,
    Object? txHash = null,
    Object? txOutputN = null,
    Object? script = null,
    Object? value = null,
    Object? valueHex = null,
    Object? confirmations = null,
    Object? txIndex = null,
  }) {
    return _then(_$UtxoModelImpl(
      txHashBigEndian: null == txHashBigEndian
          ? _value.txHashBigEndian
          : txHashBigEndian // ignore: cast_nullable_to_non_nullable
              as String,
      txHash: null == txHash
          ? _value.txHash
          : txHash // ignore: cast_nullable_to_non_nullable
              as String,
      txOutputN: null == txOutputN
          ? _value.txOutputN
          : txOutputN // ignore: cast_nullable_to_non_nullable
              as int,
      script: null == script
          ? _value.script
          : script // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      valueHex: null == valueHex
          ? _value.valueHex
          : valueHex // ignore: cast_nullable_to_non_nullable
              as String,
      confirmations: null == confirmations
          ? _value.confirmations
          : confirmations // ignore: cast_nullable_to_non_nullable
              as int,
      txIndex: null == txIndex
          ? _value.txIndex
          : txIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UtxoModelImpl with DiagnosticableTreeMixin implements _UtxoModel {
  const _$UtxoModelImpl(
      {@JsonKey(name: 'tx_hash_big_endian') required this.txHashBigEndian,
      @JsonKey(name: 'tx_hash') required this.txHash,
      @JsonKey(name: 'tx_output_n') required this.txOutputN,
      required this.script,
      required this.value,
      @JsonKey(name: 'value_hex') required this.valueHex,
      required this.confirmations,
      @JsonKey(name: 'tx_index') required this.txIndex});

  factory _$UtxoModelImpl.fromJson(Map<String, dynamic> json) => _$$UtxoModelImplFromJson(json);

  @override
  @JsonKey(name: 'tx_hash_big_endian')
  final String txHashBigEndian;
  @override
  @JsonKey(name: 'tx_hash')
  final String txHash;
  @override
  @JsonKey(name: 'tx_output_n')
  final int txOutputN;
  @override
  final String script;
  @override
  final int value;
  @override
  @JsonKey(name: 'value_hex')
  final String valueHex;
  @override
  final int confirmations;
  @override
  @JsonKey(name: 'tx_index')
  final int txIndex;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UtxoModel(txHashBigEndian: $txHashBigEndian, txHash: $txHash, txOutputN: $txOutputN, script: $script, value: $value, valueHex: $valueHex, confirmations: $confirmations, txIndex: $txIndex)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UtxoModel'))
      ..add(DiagnosticsProperty('txHashBigEndian', txHashBigEndian))
      ..add(DiagnosticsProperty('txHash', txHash))
      ..add(DiagnosticsProperty('txOutputN', txOutputN))
      ..add(DiagnosticsProperty('script', script))
      ..add(DiagnosticsProperty('value', value))
      ..add(DiagnosticsProperty('valueHex', valueHex))
      ..add(DiagnosticsProperty('confirmations', confirmations))
      ..add(DiagnosticsProperty('txIndex', txIndex));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UtxoModelImpl &&
            (identical(other.txHashBigEndian, txHashBigEndian) || other.txHashBigEndian == txHashBigEndian) &&
            (identical(other.txHash, txHash) || other.txHash == txHash) &&
            (identical(other.txOutputN, txOutputN) || other.txOutputN == txOutputN) &&
            (identical(other.script, script) || other.script == script) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.valueHex, valueHex) || other.valueHex == valueHex) &&
            (identical(other.confirmations, confirmations) || other.confirmations == confirmations) &&
            (identical(other.txIndex, txIndex) || other.txIndex == txIndex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, txHashBigEndian, txHash, txOutputN, script, value, valueHex, confirmations, txIndex);

  /// Create a copy of UtxoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UtxoModelImplCopyWith<_$UtxoModelImpl> get copyWith =>
      __$$UtxoModelImplCopyWithImpl<_$UtxoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UtxoModelImplToJson(
      this,
    );
  }
}

abstract class _UtxoModel implements UtxoModel {
  const factory _UtxoModel(
      {@JsonKey(name: 'tx_hash_big_endian') required final String txHashBigEndian,
      @JsonKey(name: 'tx_hash') required final String txHash,
      @JsonKey(name: 'tx_output_n') required final int txOutputN,
      required final String script,
      required final int value,
      @JsonKey(name: 'value_hex') required final String valueHex,
      required final int confirmations,
      @JsonKey(name: 'tx_index') required final int txIndex}) = _$UtxoModelImpl;

  factory _UtxoModel.fromJson(Map<String, dynamic> json) = _$UtxoModelImpl.fromJson;

  @override
  @JsonKey(name: 'tx_hash_big_endian')
  String get txHashBigEndian;
  @override
  @JsonKey(name: 'tx_hash')
  String get txHash;
  @override
  @JsonKey(name: 'tx_output_n')
  int get txOutputN;
  @override
  String get script;
  @override
  int get value;
  @override
  @JsonKey(name: 'value_hex')
  String get valueHex;
  @override
  int get confirmations;
  @override
  @JsonKey(name: 'tx_index')
  int get txIndex;

  /// Create a copy of UtxoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UtxoModelImplCopyWith<_$UtxoModelImpl> get copyWith => throw _privateConstructorUsedError;
}

Status _$StatusFromJson(Map<String, dynamic> json) {
  return _Status.fromJson(json);
}

/// @nodoc
mixin _$Status {
  String get notice => throw _privateConstructorUsedError;
  @JsonKey(name: 'unspent_outputs')
  List<UtxoModel> get unspentOutputs => throw _privateConstructorUsedError;

  /// Serializes this Status to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatusCopyWith<Status> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusCopyWith<$Res> {
  factory $StatusCopyWith(Status value, $Res Function(Status) then) = _$StatusCopyWithImpl<$Res, Status>;
  @useResult
  $Res call({String notice, @JsonKey(name: 'unspent_outputs') List<UtxoModel> unspentOutputs});
}

/// @nodoc
class _$StatusCopyWithImpl<$Res, $Val extends Status> implements $StatusCopyWith<$Res> {
  _$StatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notice = null,
    Object? unspentOutputs = null,
  }) {
    return _then(_value.copyWith(
      notice: null == notice
          ? _value.notice
          : notice // ignore: cast_nullable_to_non_nullable
              as String,
      unspentOutputs: null == unspentOutputs
          ? _value.unspentOutputs
          : unspentOutputs // ignore: cast_nullable_to_non_nullable
              as List<UtxoModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatusImplCopyWith<$Res> implements $StatusCopyWith<$Res> {
  factory _$$StatusImplCopyWith(_$StatusImpl value, $Res Function(_$StatusImpl) then) =
      __$$StatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String notice, @JsonKey(name: 'unspent_outputs') List<UtxoModel> unspentOutputs});
}

/// @nodoc
class __$$StatusImplCopyWithImpl<$Res> extends _$StatusCopyWithImpl<$Res, _$StatusImpl>
    implements _$$StatusImplCopyWith<$Res> {
  __$$StatusImplCopyWithImpl(_$StatusImpl _value, $Res Function(_$StatusImpl) _then) : super(_value, _then);

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notice = null,
    Object? unspentOutputs = null,
  }) {
    return _then(_$StatusImpl(
      notice: null == notice
          ? _value.notice
          : notice // ignore: cast_nullable_to_non_nullable
              as String,
      unspentOutputs: null == unspentOutputs
          ? _value._unspentOutputs
          : unspentOutputs // ignore: cast_nullable_to_non_nullable
              as List<UtxoModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatusImpl with DiagnosticableTreeMixin implements _Status {
  const _$StatusImpl(
      {required this.notice, @JsonKey(name: 'unspent_outputs') required final List<UtxoModel> unspentOutputs})
      : _unspentOutputs = unspentOutputs;

  factory _$StatusImpl.fromJson(Map<String, dynamic> json) => _$$StatusImplFromJson(json);

  @override
  final String notice;
  final List<UtxoModel> _unspentOutputs;
  @override
  @JsonKey(name: 'unspent_outputs')
  List<UtxoModel> get unspentOutputs {
    if (_unspentOutputs is EqualUnmodifiableListView) return _unspentOutputs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unspentOutputs);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Status(notice: $notice, unspentOutputs: $unspentOutputs)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Status'))
      ..add(DiagnosticsProperty('notice', notice))
      ..add(DiagnosticsProperty('unspentOutputs', unspentOutputs));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusImpl &&
            (identical(other.notice, notice) || other.notice == notice) &&
            const DeepCollectionEquality().equals(other._unspentOutputs, _unspentOutputs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, notice, const DeepCollectionEquality().hash(_unspentOutputs));

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusImplCopyWith<_$StatusImpl> get copyWith => __$$StatusImplCopyWithImpl<_$StatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatusImplToJson(
      this,
    );
  }
}

abstract class _Status implements Status {
  const factory _Status(
      {required final String notice,
      @JsonKey(name: 'unspent_outputs') required final List<UtxoModel> unspentOutputs}) = _$StatusImpl;

  factory _Status.fromJson(Map<String, dynamic> json) = _$StatusImpl.fromJson;

  @override
  String get notice;
  @override
  @JsonKey(name: 'unspent_outputs')
  List<UtxoModel> get unspentOutputs;

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatusImplCopyWith<_$StatusImpl> get copyWith => throw _privateConstructorUsedError;
}
