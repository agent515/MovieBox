// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'watchlist_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WatchlistItem _$WatchlistItemFromJson(Map<String, dynamic> json) {
  return _WatchlistItem.fromJson(json);
}

/// @nodoc
class _$WatchlistItemTearOff {
  const _$WatchlistItemTearOff();

  _WatchlistItem call(
      {required int id,
      required String name,
      required MediaType type,
      required WatchListItemStatus status}) {
    return _WatchlistItem(
      id: id,
      name: name,
      type: type,
      status: status,
    );
  }

  WatchlistItem fromJson(Map<String, Object?> json) {
    return WatchlistItem.fromJson(json);
  }
}

/// @nodoc
const $WatchlistItem = _$WatchlistItemTearOff();

/// @nodoc
mixin _$WatchlistItem {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  MediaType get type => throw _privateConstructorUsedError;
  WatchListItemStatus get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WatchlistItemCopyWith<WatchlistItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchlistItemCopyWith<$Res> {
  factory $WatchlistItemCopyWith(
          WatchlistItem value, $Res Function(WatchlistItem) then) =
      _$WatchlistItemCopyWithImpl<$Res>;
  $Res call({int id, String name, MediaType type, WatchListItemStatus status});
}

/// @nodoc
class _$WatchlistItemCopyWithImpl<$Res>
    implements $WatchlistItemCopyWith<$Res> {
  _$WatchlistItemCopyWithImpl(this._value, this._then);

  final WatchlistItem _value;
  // ignore: unused_field
  final $Res Function(WatchlistItem) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MediaType,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WatchListItemStatus,
    ));
  }
}

/// @nodoc
abstract class _$WatchlistItemCopyWith<$Res>
    implements $WatchlistItemCopyWith<$Res> {
  factory _$WatchlistItemCopyWith(
          _WatchlistItem value, $Res Function(_WatchlistItem) then) =
      __$WatchlistItemCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, MediaType type, WatchListItemStatus status});
}

/// @nodoc
class __$WatchlistItemCopyWithImpl<$Res>
    extends _$WatchlistItemCopyWithImpl<$Res>
    implements _$WatchlistItemCopyWith<$Res> {
  __$WatchlistItemCopyWithImpl(
      _WatchlistItem _value, $Res Function(_WatchlistItem) _then)
      : super(_value, (v) => _then(v as _WatchlistItem));

  @override
  _WatchlistItem get _value => super._value as _WatchlistItem;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? status = freezed,
  }) {
    return _then(_WatchlistItem(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MediaType,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WatchListItemStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WatchlistItem implements _WatchlistItem {
  const _$_WatchlistItem(
      {required this.id,
      required this.name,
      required this.type,
      required this.status});

  factory _$_WatchlistItem.fromJson(Map<String, dynamic> json) =>
      _$$_WatchlistItemFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final MediaType type;
  @override
  final WatchListItemStatus status;

  @override
  String toString() {
    return 'WatchlistItem(id: $id, name: $name, type: $type, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WatchlistItem &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$WatchlistItemCopyWith<_WatchlistItem> get copyWith =>
      __$WatchlistItemCopyWithImpl<_WatchlistItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WatchlistItemToJson(this);
  }
}

abstract class _WatchlistItem implements WatchlistItem {
  const factory _WatchlistItem(
      {required int id,
      required String name,
      required MediaType type,
      required WatchListItemStatus status}) = _$_WatchlistItem;

  factory _WatchlistItem.fromJson(Map<String, dynamic> json) =
      _$_WatchlistItem.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  MediaType get type;
  @override
  WatchListItemStatus get status;
  @override
  @JsonKey(ignore: true)
  _$WatchlistItemCopyWith<_WatchlistItem> get copyWith =>
      throw _privateConstructorUsedError;
}
