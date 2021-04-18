import 'package:movie_box/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_box/core/usecases/usecase.dart';
import 'package:movie_box/features/movies/domain/entities/movie.dart';
import 'package:movie_box/features/movies/domain/repositories/movie_repository.dart';

class GetMoviesByCategory extends Usecase<List<Movie>, MovieCategoryParams> {
  final MovieRepository repository;

  GetMoviesByCategory(this.repository);

  @override
  Future<Either<Failure, List<Movie>>> call(MovieCategoryParams params) async {
    return await this
        .repository
        .getMoviesByCategory(category: params.category, pageNo: params.pageNo);
  }

  @override
  List<Object> get props => [repository];
}
