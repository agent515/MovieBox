// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WatchlistItem _$$_WatchlistItemFromJson(Map<String, dynamic> json) =>
    _$_WatchlistItem(
      id: json['id'] as int,
      name: json['name'] as String,
      type: $enumDecode(_$MediaTypeEnumMap, json['type']),
      status: $enumDecode(_$WatchListItemStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$_WatchlistItemToJson(_$_WatchlistItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$MediaTypeEnumMap[instance.type],
      'status': _$WatchListItemStatusEnumMap[instance.status],
    };

const _$MediaTypeEnumMap = {
  MediaType.movie: 'movie',
  MediaType.tvShow: 'tvShow',
};

const _$WatchListItemStatusEnumMap = {
  WatchListItemStatus.notYetStarted: 'notYetStarted',
  WatchListItemStatus.watching: 'watching',
  WatchListItemStatus.waitingForNewSeason: 'waitingForNewSeason',
  WatchListItemStatus.completed: 'completed',
};
