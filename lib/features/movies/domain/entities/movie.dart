import 'package:equatable/equatable.dart';

/// Movie entity
class Movie extends Equatable {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  Movie(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  @override
  List<Object> get props => [
        adult,
        backdropPath,
        genreIds,
        id,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        releaseDate,
        title,
        video,
        voteAverage,
        voteCount
      ];
}

// {
//       "adult": false,
//       "backdrop_path": "/inJjDhCjfhh3RtrJWBmmDqeuSYC.jpg",
//       "genre_ids": [
//           28,
//           878
//       ],
//       "id": 399566,
//       "original_language": "en",
//       "original_title": "Godzilla vs. Kong",
//       "overview": "In a time when monsters walk the Earth, humanity’s fight for its future sets Godzilla and Kong on a collision course that will see the two most powerful forces of nature on the planet collide in a spectacular battle for the ages.",
//       "popularity": 5581.344,
//       "poster_path": "/pgqgaUx1cJb5oZQQ5v0tNARCeBp.jpg",
//       "release_date": "2021-03-24",
//       "title": "Godzilla vs. Kong",
//       "video": false,
//       "vote_average": 8.3,
//       "vote_count": 4450
//   }
