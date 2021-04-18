import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_box/core/errors/failures.dart';
import 'package:movie_box/core/usecases/usecase.dart';
import 'package:movie_box/features/movies/data/models/movie_model.dart';
import 'package:movie_box/features/movies/data/repositories/movie_repository_impl.dart';
import 'package:movie_box/features/movies/domain/entities/movie.dart';
import 'package:movie_box/features/movies/domain/usecases/get_movies_by_category.dart';

import '../../../../fixtures/fixtures.dart';

class MockMovieRepositoryImpl extends Mock implements MovieRepositoryImpl {}

void main() {
  MockMovieRepositoryImpl repository;
  GetMoviesByCategory usecase;

  List<Movie> movieList;

  setUp(() {
    repository = MockMovieRepositoryImpl();
    usecase = GetMoviesByCategory(repository);
    movieList = [
      MovieModel.fromJson(json.decode(fixtures('movie.json'))),
      MovieModel.fromJson(json.decode(fixtures('movie.json'))),
    ];
  });

  group('GetMoviesByCategory', () {
    //* MoviesRepositryImpl.getmoviesbycategory was called
    test('should call getMoviesByCategory', () async {
      when(() => repository.getMoviesByCategory(
              category: any(named: 'category'), pageNo: any(named: 'pageNo')))
          .thenAnswer((_) async => Right(movieList));

      await usecase(MovieCategoryParams(category: 'popular', pageNo: 1));

      verify(() => repository.getMoviesByCategory(
          category: any(named: 'category'), pageNo: any(named: 'pageNo')));
    });

    //* returns list of movies
    test('should return list of movies', () async {
      when(() => repository.getMoviesByCategory(
              category: any(named: 'category'), pageNo: any(named: 'pageNo')))
          .thenAnswer((_) async => Right(movieList));

      final result =
          await usecase(MovieCategoryParams(category: 'popular', pageNo: 1));

      verify(() => repository.getMoviesByCategory(
          category: any(named: 'category'), pageNo: any(named: 'pageNo')));

      expect(result, Right(movieList));
    });

    //* returns failure
    test('should return Failure', () async {
      when(() => repository.getMoviesByCategory(
              category: any(named: 'category'), pageNo: any(named: 'pageNo')))
          .thenAnswer((_) async => Left(ServerFailure()));

      final result =
          await usecase(MovieCategoryParams(category: 'popular', pageNo: 1));

      verify(() => repository.getMoviesByCategory(
          category: any(named: 'category'), pageNo: any(named: 'pageNo')));

      expect(result, Left(ServerFailure()));
    });
  });
}
