import 'package:movie_box/features/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
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

  MovieModel(
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

  factory MovieModel.fromJson(Map<String, dynamic> jsonData) {
    return MovieModel(
        adult: jsonData['adult'],
        backdropPath: jsonData['backdrop_path'],
        genreIds: jsonData['genre_ids'].cast<int>(),
        id: jsonData['id'],
        originalLanguage: jsonData['original_language'],
        originalTitle: jsonData['original_title'],
        overview: jsonData['overview'],
        popularity: jsonData['popularity'],
        posterPath: jsonData['poster_path'],
        releaseDate: DateTime(
          int.parse(jsonData['release_date'].toString().substring(0, 4)),
          int.parse(jsonData['release_date'].toString().substring(5, 7)),
          int.parse(jsonData['release_date'].toString().substring(8, 10)),
        ),
        title: jsonData['title'],
        video: jsonData['video'],
        voteAverage: jsonData['vote_average'],
        voteCount: jsonData['vote_count']);
  }

  Map<String, dynamic> toJson() {
    return {
      "adult": this.adult,
      "backdrop_path": this.backdropPath,
      "genre_ids": this.genreIds,
      "id": this.id,
      "original_language": this.originalLanguage,
      "original_title": this.originalTitle,
      "overview": this.overview,
      "popularity": this.popularity,
      "poster_path": this.posterPath,
      "release_date":
          "${this.releaseDate.year.toString()}-${this.releaseDate.month.toString().padLeft(2, '0')}-${this.releaseDate.day.toString().padLeft(2, '0')}",
      "title": this.title,
      "video": this.video,
      "vote_average": this.voteAverage,
      "vote_count": this.voteCount
    };
  }
}
