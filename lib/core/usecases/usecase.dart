import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_box/core/errors/failures.dart';
import 'package:meta/meta.dart';

abstract class Usecase<Type, Params> extends Equatable {
  Future<Either<Failure, Type>> call(Params params);
}

class MovieCategoryParams extends Equatable {
  final String category;
  final int pageNo;

  MovieCategoryParams({@required this.category, @required this.pageNo});

  @override
  List<Object> get props => [category, pageNo];
}

class MovieParams extends Equatable {
  final String query;
  final int pageNo;
  String lang;
  int year;
  String region;
  int releaseYear;
  bool includeAdult;

  MovieParams(
      {@required this.query,
      @required this.pageNo,
      this.lang = "en-US",
      this.year,
      this.region,
      this.releaseYear,
      this.includeAdult = false});

  @override
  List<Object> get props =>
      [query, pageNo, lang, year, region, releaseYear, includeAdult];
}
