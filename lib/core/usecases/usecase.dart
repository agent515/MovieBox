import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_box/core/errors/failures.dart';

abstract class Usecase<Type, Params> extends Equatable {
  Future<Either<Failure, Type>> call(Params params);
}

class MovieCategoryParams extends Equatable {
  final String category;
  final int pageNo;

  MovieCategoryParams({this.category, this.pageNo});

  @override
  List<Object> get props => [category, pageNo];
}
