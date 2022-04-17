// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_in_with_email_password_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignInWithEmailPasswordRequestTearOff {
  const _$SignInWithEmailPasswordRequestTearOff();

  _SignInWithEmailPasswordRequest call(
      {required String email, required String password}) {
    return _SignInWithEmailPasswordRequest(
      email: email,
      password: password,
    );
  }
}

/// @nodoc
const $SignInWithEmailPasswordRequest =
    _$SignInWithEmailPasswordRequestTearOff();

/// @nodoc
mixin _$SignInWithEmailPasswordRequest {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInWithEmailPasswordRequestCopyWith<SignInWithEmailPasswordRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInWithEmailPasswordRequestCopyWith<$Res> {
  factory $SignInWithEmailPasswordRequestCopyWith(
          SignInWithEmailPasswordRequest value,
          $Res Function(SignInWithEmailPasswordRequest) then) =
      _$SignInWithEmailPasswordRequestCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

/// @nodoc
class _$SignInWithEmailPasswordRequestCopyWithImpl<$Res>
    implements $SignInWithEmailPasswordRequestCopyWith<$Res> {
  _$SignInWithEmailPasswordRequestCopyWithImpl(this._value, this._then);

  final SignInWithEmailPasswordRequest _value;
  // ignore: unused_field
  final $Res Function(SignInWithEmailPasswordRequest) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SignInWithEmailPasswordRequestCopyWith<$Res>
    implements $SignInWithEmailPasswordRequestCopyWith<$Res> {
  factory _$SignInWithEmailPasswordRequestCopyWith(
          _SignInWithEmailPasswordRequest value,
          $Res Function(_SignInWithEmailPasswordRequest) then) =
      __$SignInWithEmailPasswordRequestCopyWithImpl<$Res>;
  @override
  $Res call({String email, String password});
}

/// @nodoc
class __$SignInWithEmailPasswordRequestCopyWithImpl<$Res>
    extends _$SignInWithEmailPasswordRequestCopyWithImpl<$Res>
    implements _$SignInWithEmailPasswordRequestCopyWith<$Res> {
  __$SignInWithEmailPasswordRequestCopyWithImpl(
      _SignInWithEmailPasswordRequest _value,
      $Res Function(_SignInWithEmailPasswordRequest) _then)
      : super(_value, (v) => _then(v as _SignInWithEmailPasswordRequest));

  @override
  _SignInWithEmailPasswordRequest get _value =>
      super._value as _SignInWithEmailPasswordRequest;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_SignInWithEmailPasswordRequest(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SignInWithEmailPasswordRequest
    implements _SignInWithEmailPasswordRequest {
  const _$_SignInWithEmailPasswordRequest(
      {required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'SignInWithEmailPasswordRequest(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignInWithEmailPasswordRequest &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$SignInWithEmailPasswordRequestCopyWith<_SignInWithEmailPasswordRequest>
      get copyWith => __$SignInWithEmailPasswordRequestCopyWithImpl<
          _SignInWithEmailPasswordRequest>(this, _$identity);
}

abstract class _SignInWithEmailPasswordRequest
    implements SignInWithEmailPasswordRequest {
  const factory _SignInWithEmailPasswordRequest(
      {required String email,
      required String password}) = _$_SignInWithEmailPasswordRequest;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$SignInWithEmailPasswordRequestCopyWith<_SignInWithEmailPasswordRequest>
      get copyWith => throw _privateConstructorUsedError;
}
