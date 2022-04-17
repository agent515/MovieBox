import 'package:dartz/dartz.dart';

import '../../core/failure/failure.dart';

abstract class SocialSignInRepository {
  Future<Either<Failure, void>> signInWithGoogle();
  Future<Either<Failure, void>> signOutWithGoogle();
}
