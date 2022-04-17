// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Watchlist _$$_WatchlistFromJson(Map<String, dynamic> json) => _$_Watchlist(
      name: json['name'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => WatchlistItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_WatchlistToJson(_$_Watchlist instance) =>
    <String, dynamic>{
      'name': instance.name,
      'items': instance.items,
    };
