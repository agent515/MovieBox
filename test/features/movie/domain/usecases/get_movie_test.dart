import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_box/core/usecases/usecase.dart';
import 'package:movie_box/features/movies/data/models/movie_model.dart';
import 'package:movie_box/features/movies/data/repositories/movie_repository_impl.dart';
import 'package:movie_box/features/movies/domain/entities/movie.dart';
import 'package:movie_box/features/movies/domain/usecases/get_movie.dart';

import '../../../../fixtures/fixtures.dart';

class MockMovieRepositoryImpl extends Mock implements MovieRepositoryImpl {}

void main() {
  MockMovieRepositoryImpl repository;
  GetMovie usecase;
  List<Movie> movieList;

  setUp(() {
    repository = MockMovieRepositoryImpl();
    usecase = GetMovie(repository);
    movieList = [
      MovieModel.fromJson(json.decode(fixtures('movie.json'))),
      MovieModel.fromJson(json.decode(fixtures('movie.json'))),
    ];
  });

  test('should call getMovie from MovieRepositoryImpl', () async {
    when(() => repository.getMovie(
            query: any(named: 'query'), pageNo: any(named: 'pageNo')))
        .thenAnswer((_) async => Right(movieList));

    await usecase(MovieParams(query: 'Joker', pageNo: 1));

    verify(() => repository.getMovie(
        query: any(named: 'query'), pageNo: any(named: 'pageNo')));
  });
}
