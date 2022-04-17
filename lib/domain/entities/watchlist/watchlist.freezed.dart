// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'watchlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Watchlist _$WatchlistFromJson(Map<String, dynamic> json) {
  return _Watchlist.fromJson(json);
}

/// @nodoc
class _$WatchlistTearOff {
  const _$WatchlistTearOff();

  _Watchlist call({required String name, required List<WatchlistItem> items}) {
    return _Watchlist(
      name: name,
      items: items,
    );
  }

  Watchlist fromJson(Map<String, Object?> json) {
    return Watchlist.fromJson(json);
  }
}

/// @nodoc
const $Watchlist = _$WatchlistTearOff();

/// @nodoc
mixin _$Watchlist {
  String get name => throw _privateConstructorUsedError;
  List<WatchlistItem> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WatchlistCopyWith<Watchlist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchlistCopyWith<$Res> {
  factory $WatchlistCopyWith(Watchlist value, $Res Function(Watchlist) then) =
      _$WatchlistCopyWithImpl<$Res>;
  $Res call({String name, List<WatchlistItem> items});
}

/// @nodoc
class _$WatchlistCopyWithImpl<$Res> implements $WatchlistCopyWith<$Res> {
  _$WatchlistCopyWithImpl(this._value, this._then);

  final Watchlist _value;
  // ignore: unused_field
  final $Res Function(Watchlist) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<WatchlistItem>,
    ));
  }
}

/// @nodoc
abstract class _$WatchlistCopyWith<$Res> implements $WatchlistCopyWith<$Res> {
  factory _$WatchlistCopyWith(
          _Watchlist value, $Res Function(_Watchlist) then) =
      __$WatchlistCopyWithImpl<$Res>;
  @override
  $Res call({String name, List<WatchlistItem> items});
}

/// @nodoc
class __$WatchlistCopyWithImpl<$Res> extends _$WatchlistCopyWithImpl<$Res>
    implements _$WatchlistCopyWith<$Res> {
  __$WatchlistCopyWithImpl(_Watchlist _value, $Res Function(_Watchlist) _then)
      : super(_value, (v) => _then(v as _Watchlist));

  @override
  _Watchlist get _value => super._value as _Watchlist;

  @override
  $Res call({
    Object? name = freezed,
    Object? items = freezed,
  }) {
    return _then(_Watchlist(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<WatchlistItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Watchlist implements _Watchlist {
  const _$_Watchlist({required this.name, required this.items});

  factory _$_Watchlist.fromJson(Map<String, dynamic> json) =>
      _$$_WatchlistFromJson(json);

  @override
  final String name;
  @override
  final List<WatchlistItem> items;

  @override
  String toString() {
    return 'Watchlist(name: $name, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Watchlist &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(items));

  @JsonKey(ignore: true)
  @override
  _$WatchlistCopyWith<_Watchlist> get copyWith =>
      __$WatchlistCopyWithImpl<_Watchlist>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WatchlistToJson(this);
  }
}

abstract class _Watchlist implements Watchlist {
  const factory _Watchlist(
      {required String name,
      required List<WatchlistItem> items}) = _$_Watchlist;

  factory _Watchlist.fromJson(Map<String, dynamic> json) =
      _$_Watchlist.fromJson;

  @override
  String get name;
  @override
  List<WatchlistItem> get items;
  @override
  @JsonKey(ignore: true)
  _$WatchlistCopyWith<_Watchlist> get copyWith =>
      throw _privateConstructorUsedError;
}
