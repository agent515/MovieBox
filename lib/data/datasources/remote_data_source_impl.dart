import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_box/core/failure/failure.dart';
import 'package:movie_box/domain/data_source/remote_data_source.dart';
import 'package:movie_box/domain/entities/user/app_user.dart';
import 'package:movie_box/domain/entities/watchlist/watchlist.dart';

@Singleton(as: RemoteDataSource)
class RemoteDataSourceImpl implements RemoteDataSource {
  final FirebaseFirestore _firestore;

  RemoteDataSourceImpl(this._firestore);

  @override
  Future<Either<Failure, List<Watchlist>>> getWatchlistForUser(
      String uid) async {
    try {
      CollectionReference<Watchlist> _watchlistRef = _firestore
          .collection('users/$uid/watchlists')
          .withConverter<Watchlist>(
            fromFirestore: (snapshot, _) =>
                Watchlist.fromJson(snapshot.data()!),
            toFirestore: (watchlist, _) => watchlist.toJson(),
          );

      QuerySnapshot<Watchlist> _watchlistsSnapshot = await _watchlistRef.get();
      return Right(_watchlistsSnapshot.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left(Failure(title: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AppUser>> getUserInfo(String uid) async {
    try {
      DocumentReference<AppUser> _userRef =
          _firestore.collection('users').doc(uid).withConverter<AppUser>(
                fromFirestore: (snapshot, options) =>
                    AppUser.fromJson(snapshot.data()!),
                toFirestore: (user, options) => user.toJson(),
              );
      DocumentSnapshot<AppUser> _userSnapshot = await _userRef.get();
      AppUser? _user = _userSnapshot.data();

      if (_user != null) return Right(_user);
      return const Left(Failure(title: 'No user record found in db'));
    } catch (e) {
      return Left(Failure(title: e.toString()));
    }
  }
}
