import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_box/domain/entities/watchlist/watchlist_item.dart';

part 'watchlist.freezed.dart';
part 'watchlist.g.dart';

@freezed
class Watchlist with _$Watchlist {
  const factory Watchlist({
    required String id,
    required String name,
    required List<WatchlistItem> items,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Watchlist;

  factory Watchlist.fromJson(Map<String, dynamic> json) =>
      _$WatchlistFromJson(json);
}
