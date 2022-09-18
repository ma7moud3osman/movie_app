// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/base_usecase.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/repositories/base_movies_repository.dart';

class GetSimilarMoviesUseCase extends BaseUseCase<List<Movie>, int> {
  final BaseMoviesRepository moviesRepository;
  const GetSimilarMoviesUseCase(
    this.moviesRepository,
  );
  @override
  Future<Either<Failure, List<Movie>>> call(int parameters) {
    return moviesRepository.getSimilarMovies(parameters);
  }
}
