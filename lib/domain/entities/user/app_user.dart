import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_box/domain/entities/watchlist/watchlist.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    required String uid,
    required String name,
    required String email,
    required DateTime dob,
    @Default([]) List<Watchlist> watchlists,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}
