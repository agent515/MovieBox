import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_box/core/failure/failure.dart';
import 'package:movie_box/domain/data_source/remote_data_source.dart';
import 'package:movie_box/domain/entities/watchlist/watchlist.dart';

@Singleton(as: RemoteDataSource)
class RemoteDataSourceImpl implements RemoteDataSource {
  final FirebaseFirestore _firestore;

  RemoteDataSourceImpl(this._firestore);

  @override
  Future<Either<Failure, Stream<Watchlist>>> getWatchlistForUser(
      String uid) async {
    try {
      CollectionReference _watchlistRef = _firestore
          .collection('users/$uid/watchlists')
          .withConverter<Watchlist>(
            fromFirestore: (snapshot, _) =>
                Watchlist.fromJson(snapshot.data()!),
            toFirestore: (watchlist, _) => watchlist.toJson(),
          );

      _watchlistRef.snapshots();
    } catch (e, stack) {}
  }
}
