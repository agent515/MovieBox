import 'package:dartz/dartz.dart';
import 'package:movie_box/domain/entities/watchlist/watchlist.dart';

import '../../core/failure/failure.dart';
import '../entities/user/app_user.dart';

abstract class RemoteDataSource {
  Future<Either<Failure, AppUser>> getUserInfo(String uid);
  Future<Either<Failure, List<Watchlist>>> getWatchlistForUser(String uid);
}
