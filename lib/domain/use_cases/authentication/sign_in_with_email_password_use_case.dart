import 'package:injectable/injectable.dart';
import 'package:movie_box/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_box/core/use_case/use_case.dart';
import 'package:movie_box/domain/repositories/authentication_repository.dart';

import '../../entities/sign_in/sign_in_with_email_password_request.dart';

@injectable
class SignInWithEmailPasswordUseCase
    implements UseCase<void, SignInWithEmailPasswordRequest> {
  final AuthenticationRepository _authenticationRepository;

  SignInWithEmailPasswordUseCase(this._authenticationRepository);

  @override
  Future<Either<Failure, void>> call(SignInWithEmailPasswordRequest param) {
    return _authenticationRepository.signInWithEmailPassword(param);
  }
}
