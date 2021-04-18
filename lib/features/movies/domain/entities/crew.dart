import 'package:equatable/equatable.dart';

class Crew extends Equatable {
  final bool adult;
  final String gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String profilePath;
  final String department;
  final String job;

  Crew(
      {this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.department,
      this.job});

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
        this.department,
        this.job
      ];
}

// {
//     "adult": false,
//     "gender": 0,
//     "id": 1742042,
//     "known_for_department": "Production",
//     "name": "Joan Altman",
//     "original_name": "Joan Altman",
//     "popularity": 0.98,
//     "profile_path": null,
//     "credit_id": "5e128b0bd8af670014bdbec1",
//     "department": "Production",
//     "job": "Production Accountant"
// }
