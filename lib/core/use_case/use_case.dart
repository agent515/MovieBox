import 'package:dartz/dartz.dart';
import 'package:movie_box/core/failure/failure.dart';

///
/// The abstract UseCase to be implemented by use cases that return [Either].
/// [T] Is the type to be returned by the UseCase.
/// [S] is the parameter passed to use case
///
abstract class UseCase<T, S> {
  Future<Either<Failure, T>> call(S param);
}

///
/// The abstract NoParamUseCase to be implemented by use cases that return [Either] without any param.
/// [T] Is the type to be returned by the UseCase.
///
abstract class NoParamUseCase<T> {
  Future<Either<Failure, T>> call();
}
