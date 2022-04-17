import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_box/core/routes/constants/enums/media_type.dart';
import 'package:movie_box/core/routes/constants/enums/watchlist_item_status.dart';

part 'watchlist_item.freezed.dart';
part 'watchlist_item.g.dart';

@freezed
class WatchlistItem with _$WatchlistItem {
  const factory WatchlistItem({
    required int id,
    required String name,
    required MediaType type,
    required WatchListItemStatus status,
  }) = _WatchlistItem;

  factory WatchlistItem.fromJson(Map<String, dynamic> json) =>
      _$WatchlistItemFromJson(json);
}
