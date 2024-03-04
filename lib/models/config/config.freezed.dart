// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Config _$ConfigFromJson(Map<String, dynamic> json) {
  return _Config.fromJson(json);
}

/// @nodoc
mixin _$Config {
  Flavor get env => throw _privateConstructorUsedError;
  bool get production => throw _privateConstructorUsedError;
  String get apiUrl => throw _privateConstructorUsedError;
  String get coinsUrl => throw _privateConstructorUsedError;
  String get ipUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConfigCopyWith<Config> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigCopyWith<$Res> {
  factory $ConfigCopyWith(Config value, $Res Function(Config) then) = _$ConfigCopyWithImpl<$Res, Config>;
  @useResult
  $Res call({Flavor env, bool production, String apiUrl, String coinsUrl, String ipUrl});
}

/// @nodoc
class _$ConfigCopyWithImpl<$Res, $Val extends Config> implements $ConfigCopyWith<$Res> {
  _$ConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? env = null,
    Object? production = null,
    Object? apiUrl = null,
    Object? coinsUrl = null,
    Object? ipUrl = null,
  }) {
    return _then(_value.copyWith(
      env: null == env
          ? _value.env
          : env // ignore: cast_nullable_to_non_nullable
              as Flavor,
      production: null == production
          ? _value.production
          : production // ignore: cast_nullable_to_non_nullable
              as bool,
      apiUrl: null == apiUrl
          ? _value.apiUrl
          : apiUrl // ignore: cast_nullable_to_non_nullable
              as String,
      coinsUrl: null == coinsUrl
          ? _value.coinsUrl
          : coinsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      ipUrl: null == ipUrl
          ? _value.ipUrl
          : ipUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConfigImplCopyWith<$Res> implements $ConfigCopyWith<$Res> {
  factory _$$ConfigImplCopyWith(_$ConfigImpl value, $Res Function(_$ConfigImpl) then) =
      __$$ConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Flavor env, bool production, String apiUrl, String coinsUrl, String ipUrl});
}

/// @nodoc
class __$$ConfigImplCopyWithImpl<$Res> extends _$ConfigCopyWithImpl<$Res, _$ConfigImpl>
    implements _$$ConfigImplCopyWith<$Res> {
  __$$ConfigImplCopyWithImpl(_$ConfigImpl _value, $Res Function(_$ConfigImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? env = null,
    Object? production = null,
    Object? apiUrl = null,
    Object? coinsUrl = null,
    Object? ipUrl = null,
  }) {
    return _then(_$ConfigImpl(
      env: null == env
          ? _value.env
          : env // ignore: cast_nullable_to_non_nullable
              as Flavor,
      production: null == production
          ? _value.production
          : production // ignore: cast_nullable_to_non_nullable
              as bool,
      apiUrl: null == apiUrl
          ? _value.apiUrl
          : apiUrl // ignore: cast_nullable_to_non_nullable
              as String,
      coinsUrl: null == coinsUrl
          ? _value.coinsUrl
          : coinsUrl // ignore: cast_nullable_to_non_nullable
              as String,
      ipUrl: null == ipUrl
          ? _value.ipUrl
          : ipUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConfigImpl implements _Config {
  _$ConfigImpl(
      {required this.env, required this.production, required this.apiUrl, required this.coinsUrl, required this.ipUrl});

  factory _$ConfigImpl.fromJson(Map<String, dynamic> json) => _$$ConfigImplFromJson(json);

  @override
  final Flavor env;
  @override
  final bool production;
  @override
  final String apiUrl;
  @override
  final String coinsUrl;
  @override
  final String ipUrl;

  @override
  String toString() {
    return 'Config(env: $env, production: $production, apiUrl: $apiUrl, coinsUrl: $coinsUrl, ipUrl: $ipUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigImpl &&
            (identical(other.env, env) || other.env == env) &&
            (identical(other.production, production) || other.production == production) &&
            (identical(other.apiUrl, apiUrl) || other.apiUrl == apiUrl) &&
            (identical(other.coinsUrl, coinsUrl) || other.coinsUrl == coinsUrl) &&
            (identical(other.ipUrl, ipUrl) || other.ipUrl == ipUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, env, production, apiUrl, coinsUrl, ipUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfigImplCopyWith<_$ConfigImpl> get copyWith => __$$ConfigImplCopyWithImpl<_$ConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfigImplToJson(
      this,
    );
  }
}

abstract class _Config implements Config {
  factory _Config(
      {required final Flavor env,
      required final bool production,
      required final String apiUrl,
      required final String coinsUrl,
      required final String ipUrl}) = _$ConfigImpl;

  factory _Config.fromJson(Map<String, dynamic> json) = _$ConfigImpl.fromJson;

  @override
  Flavor get env;
  @override
  bool get production;
  @override
  String get apiUrl;
  @override
  String get coinsUrl;
  @override
  String get ipUrl;
  @override
  @JsonKey(ignore: true)
  _$$ConfigImplCopyWith<_$ConfigImpl> get copyWith => throw _privateConstructorUsedError;
}
