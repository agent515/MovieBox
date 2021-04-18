import 'package:dartz/dartz.dart';
import 'package:movie_box/core/errors/failures.dart';
import 'package:movie_box/features/movies/domain/entities/movie.dart';
import 'package:movie_box/features/movies/domain/entities/movie_details.dart';
import 'package:meta/meta.dart';
import 'package:movie_box/features/movies/domain/entities/review.dart';

/// Movie Repository is an abstract class that states contract for all the movie realted methods
abstract class MovieRepository {
  /// Method returns list of max 20 movies based on given [category].
  /// Valid categories = ["popular", "top_rated"]
  /// Use [pageNo] to fetch next or previous 20 movies.
  Future<Either<Failure, List<Movie>>> getMoviesByCategory(
      {String category, int pageNo});

  /// Method returns list of maximum 20 movies as a search result based on search [query].
  /// Use [pageNo] to fetch next or previous 20 movies.
  /// Other filters that you can apply are
  /// [language, year, region, releaseYear, includeAdult]
  Future<Either<Failure, List<Movie>>> getMovie(
      {@required String query,
      int pageNo = 1,
      String lang = "en-US",
      int year,
      String region,
      int releaseYear,
      bool includeAdult = false});

  /// Method returns MovieDetails for given movieId
  Future<Either<Failure, MovieDetails>> getMovieDetails(int id);

  /// Method returns a list of 20 Similar movies to movie with id [movieId] on a given [pageNo]
  Future<Either<Failure, List<Movie>>> getSimilarMovies(
      {@required int id, int pageNo = 1});

  /// Method returns a list of 20 Reviews to movie with id [movieId] on a given [pageNo]
  Future<Either<Failure, List<Review>>> getReviews(
      {@required int id, int pageNo = 1});

  /// Methods returns Cast & Crew members part of the movie with id [movieId]
  Future<Either<Failure, Map<String, dynamic>>> getCastCrew({@required int id});
}
