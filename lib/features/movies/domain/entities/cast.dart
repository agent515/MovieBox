import 'package:equatable/equatable.dart';

class Cast extends Equatable {
  final bool adult;
  final String gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String profilePath;
  final int castId;
  final String character;

  Cast(
      {this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.castId,
      this.character});

  @override
  List<Object> get props => [
        this.adult,
        this.gender,
        this.id,
        this.knownForDepartment,
        this.name,
        this.originalName,
        this.popularity,
        this.profilePath,
        this.castId,
        this.character
      ];
}

// {
//     "adult": false,
//     "gender": 2,
//     "id": 73421,
//     "known_for_department": "Acting",
//     "name": "Joaquin Phoenix",
//     "original_name": "Joaquin Phoenix",
//     "popularity": 6.937,
//     "profile_path": "/nXMzvVF6xR3OXOedozfOcoA20xh.jpg",
//     "cast_id": 357,
//     "character": "Arthur Fleck / Joker",
//     "credit_id": "5e8593bd98f1f10014aacb71",
//     "order": 0
// },
