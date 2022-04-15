import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_box/domain/entities/watchlist/watchlist_item.dart';

part 'watchlist.freezed.dart';

@freezed
class Watchlist with _$Watchlist {
  const factory Watchlist({
    required String name,
    required List<WatchlistItem> items,
  }) = _Watchlist;
}
