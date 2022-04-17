import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_box/domain/data_source/authentication_data_source.dart';
import 'package:movie_box/domain/entities/user/app_user.dart';
import 'package:movie_box/domain/entities/sign_in/sign_in_with_email_password_request.dart';
import 'package:movie_box/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_box/domain/repositories/authentication_repository.dart';

@Singleton(as: AuthenticationRepository)
class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationDataSource _authenticationDataSource;

  AuthenticationRepositoryImpl(this._authenticationDataSource);

  @override
  Future<Either<Failure, AppUser>> signInWithEmailPassword(
      SignInWithEmailPasswordRequest request) {
    return _authenticationDataSource.signInWithEmailPassword(request);
  }

  @override
  Future<Either<Failure, AppUser>> signInWithCredential(
      AuthCredential credential) {
    // TODO: implement signInWithCredential
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
