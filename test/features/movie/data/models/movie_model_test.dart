import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_box/features/movies/data/models/movie_model.dart';

import '../../../../fixtures/fixtures.dart';

void main() {
  MovieModel tMovie;

  setUp(() {
    tMovie = MovieModel(
        adult: false,
        backdropPath: "/inJjDhCjfhh3RtrJWBmmDqeuSYC.jpg",
        genreIds: [28, 878],
        id: 399566,
        originalLanguage: "en",
        originalTitle: "Godzilla vs. Kong",
        overview:
            "In a time when monsters walk the Earth, humanity’s fight for its future sets Godzilla and Kong on a collision course that will see the two most powerful forces of nature on the planet collide in a spectacular battle for the ages.",
        popularity: 5581.344,
        posterPath: "/pgqgaUx1cJb5oZQQ5v0tNARCeBp.jpg",
        releaseDate: DateTime(2021, 3, 24),
        title: "Godzilla vs. Kong",
        video: false,
        voteAverage: 8.3,
        voteCount: 4450);
  });

  group('Movie Model', () {
    test('should return Movie object from Json using fromJson method.', () {
      final result = MovieModel.fromJson(json.decode(fixtures('movie.json')));
      expect(result, tMovie);
    });

    test('should return Json data from Movie object using toJson method.', () {
      final result = tMovie.toJson();
      expect(result, json.decode(fixtures('movie.json')));
    });
  });
}
