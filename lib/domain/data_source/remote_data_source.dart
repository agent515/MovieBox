import 'package:dartz/dartz.dart';
import 'package:movie_box/domain/entities/watchlist/watchlist.dart';

import '../../core/failure/failure.dart';

abstract class RemoteDataSource {
  Future<Either<Failure, Stream<Watchlist>>> getWatchlistForUser(String uid);
}
