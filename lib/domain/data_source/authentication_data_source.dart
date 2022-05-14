import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_box/domain/entities/sign_in/sign_in_with_email_password_request.dart';

import '../../core/failure/failure.dart';

abstract class AuthenticationDataSource {
  Stream<User?> get authChanges;
  Future<Either<Failure, void>> signInWithEmailPassword(
      SignInWithEmailPasswordRequest request);
  Future<Either<Failure, void>> signInWithCredential(AuthCredential credential);
  Future<Either<Failure, void>> signOut();
}
