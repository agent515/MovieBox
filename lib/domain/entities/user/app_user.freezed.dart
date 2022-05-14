// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return _AppUser.fromJson(json);
}

/// @nodoc
class _$AppUserTearOff {
  const _$AppUserTearOff();

  _AppUser call(
      {required String uid,
      required String name,
      required String email,
      required DateTime dob,
      List<Watchlist> watchlists = const []}) {
    return _AppUser(
      uid: uid,
      name: name,
      email: email,
      dob: dob,
      watchlists: watchlists,
    );
  }

  AppUser fromJson(Map<String, Object?> json) {
    return AppUser.fromJson(json);
  }
}

/// @nodoc
const $AppUser = _$AppUserTearOff();

/// @nodoc
mixin _$AppUser {
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  DateTime get dob => throw _privateConstructorUsedError;
  List<Watchlist> get watchlists => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppUserCopyWith<AppUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res>;
  $Res call(
      {String uid,
      String name,
      String email,
      DateTime dob,
      List<Watchlist> watchlists});
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res> implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  final AppUser _value;
  // ignore: unused_field
  final $Res Function(AppUser) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? dob = freezed,
    Object? watchlists = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      dob: dob == freezed
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime,
      watchlists: watchlists == freezed
          ? _value.watchlists
          : watchlists // ignore: cast_nullable_to_non_nullable
              as List<Watchlist>,
    ));
  }
}

/// @nodoc
abstract class _$AppUserCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$AppUserCopyWith(_AppUser value, $Res Function(_AppUser) then) =
      __$AppUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uid,
      String name,
      String email,
      DateTime dob,
      List<Watchlist> watchlists});
}

/// @nodoc
class __$AppUserCopyWithImpl<$Res> extends _$AppUserCopyWithImpl<$Res>
    implements _$AppUserCopyWith<$Res> {
  __$AppUserCopyWithImpl(_AppUser _value, $Res Function(_AppUser) _then)
      : super(_value, (v) => _then(v as _AppUser));

  @override
  _AppUser get _value => super._value as _AppUser;

  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? dob = freezed,
    Object? watchlists = freezed,
  }) {
    return _then(_AppUser(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      dob: dob == freezed
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime,
      watchlists: watchlists == freezed
          ? _value.watchlists
          : watchlists // ignore: cast_nullable_to_non_nullable
              as List<Watchlist>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppUser implements _AppUser {
  const _$_AppUser(
      {required this.uid,
      required this.name,
      required this.email,
      required this.dob,
      this.watchlists = const []});

  factory _$_AppUser.fromJson(Map<String, dynamic> json) =>
      _$$_AppUserFromJson(json);

  @override
  final String uid;
  @override
  final String name;
  @override
  final String email;
  @override
  final DateTime dob;
  @JsonKey()
  @override
  final List<Watchlist> watchlists;

  @override
  String toString() {
    return 'AppUser(uid: $uid, name: $name, email: $email, dob: $dob, watchlists: $watchlists)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppUser &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.dob, dob) &&
            const DeepCollectionEquality()
                .equals(other.watchlists, watchlists));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(dob),
      const DeepCollectionEquality().hash(watchlists));

  @JsonKey(ignore: true)
  @override
  _$AppUserCopyWith<_AppUser> get copyWith =>
      __$AppUserCopyWithImpl<_AppUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppUserToJson(this);
  }
}

abstract class _AppUser implements AppUser {
  const factory _AppUser(
      {required String uid,
      required String name,
      required String email,
      required DateTime dob,
      List<Watchlist> watchlists}) = _$_AppUser;

  factory _AppUser.fromJson(Map<String, dynamic> json) = _$_AppUser.fromJson;

  @override
  String get uid;
  @override
  String get name;
  @override
  String get email;
  @override
  DateTime get dob;
  @override
  List<Watchlist> get watchlists;
  @override
  @JsonKey(ignore: true)
  _$AppUserCopyWith<_AppUser> get copyWith =>
      throw _privateConstructorUsedError;
}
