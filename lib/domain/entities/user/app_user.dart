import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../watchlist/watchlist.dart';

part 'app_user.freezed.dart';

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    required String uid,
    required String email,
    required Map<String, Watchlist> watchlists,
  }) = _AppUser;

  // const factory AppUser.fromUser(User user, Map<String, Watchlist> watchlists) =
  //     _AppUser(uid: user.uid, );
}
