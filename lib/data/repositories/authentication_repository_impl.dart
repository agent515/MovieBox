import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_box/domain/data_source/authentication_data_source.dart';
import 'package:movie_box/domain/data_source/remote_data_source.dart';
import 'package:movie_box/domain/entities/user/app_user.dart';
import 'package:movie_box/domain/entities/sign_in/sign_in_with_email_password_request.dart';
import 'package:movie_box/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_box/domain/repositories/authentication_repository.dart';

@Singleton(as: AuthenticationRepository)
class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationDataSource _authenticationDataSource;
  final RemoteDataSource _remoteDataSource;

  @override
  AppUser? currentUser;

  AuthenticationRepositoryImpl(
      this._authenticationDataSource, this._remoteDataSource);

  @override
  Future<Either<Failure, void>> signInWithEmailPassword(
      SignInWithEmailPasswordRequest request) {
    return _authenticationDataSource.signInWithEmailPassword(request);
  }

  @override
  Future<Either<Failure, void>> signInWithCredential(
      AuthCredential credential) {
    return _authenticationDataSource.signInWithCredential(credential);
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    final result = await _authenticationDataSource.signOut();
    return result.fold(
      (l) => Left(l),
      (r) => const Right(null),
    );
  }

  Future<AppUser?> _getUserInfo(String uid) async {
    final result = await _remoteDataSource.getUserInfo(uid);
    return result.fold(
      (l) {
        print(l.title);
        return null;
      },
      (user) async {
        final watchlistResult =
            await _remoteDataSource.getWatchlistForUser(uid);
        return watchlistResult.fold(
          (l) {
            print(l.title);
            return user;
          },
          (watchlists) => user.copyWith(watchlists: watchlists),
        );
      },
    );
  }

  @override
  Stream<Future<AppUser?>> get authChanges =>
      _authenticationDataSource.authChanges.map((User? _user) async {
        currentUser = _user != null ? await _getUserInfo(_user.uid) : null;
        return currentUser;
      });
}
