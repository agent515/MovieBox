import 'package:movie_box/features/movies/domain/entities/review.dart';
import 'package:movie_box/features/movies/domain/entities/movie_details.dart';
import 'package:movie_box/features/movies/domain/entities/movie.dart';
import 'package:movie_box/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_box/features/movies/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either<Failure, List<Movie>>> getMoviesByCategory(
      {String category, int pageNo}) async {
    return null;
  }

  @override
  Future<Either<Failure, List<Movie>>> getMovie(
      {String query,
      int pageNo = 1,
      String lang = "en-US",
      int year,
      String region,
      int releaseYear,
      bool includeAdult = false}) async {
    // TODO: implement getMovie
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(int id) async {
    // TODO: implement getMovieDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Movie>>> getSimilarMovies(
      {int id, int pageNo = 1}) async {
    // TODO: implement getSimilarMovies
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getCastCrew({int id}) async {
    // TODO: implement getCastCrew
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Review>>> getReviews(
      {int id, int pageNo = 1}) async {
    // TODO: implement getReviews
    throw UnimplementedError();
  }
}
