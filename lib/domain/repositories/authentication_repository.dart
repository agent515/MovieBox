import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_box/domain/entities/sign_in/sign_in_with_email_password_request.dart';

import '../../core/failure/failure.dart';
import '../entities/user/app_user.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, AppUser>> signInWithEmailPassword(
      SignInWithEmailPasswordRequest request);
  Future<Either<Failure, AppUser>> signInWithCredential(
      AuthCredential credential);
  Future<Either<Failure, void>> signOut();
}
