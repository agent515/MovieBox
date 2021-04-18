import 'package:movie_box/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_box/core/usecases/usecase.dart';
import 'package:movie_box/features/movies/domain/entities/movie.dart';
import 'package:movie_box/features/movies/domain/repositories/movie_repository.dart';

class GetMovie extends Usecase<List<Movie>, MovieParams> {
  final MovieRepository repository;

  GetMovie(this.repository);

  @override
  Future<Either<Failure, List<Movie>>> call(MovieParams params) async {
    return await this
        .repository
        .getMovie(query: params.query, pageNo: params.pageNo);
  }

  @override
  List<Object> get props => [repository];
}
