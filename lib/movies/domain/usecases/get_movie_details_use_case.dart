import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/base_usecase.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/domain/repositories/base_movies_repository.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetails, int> {
  final BaseMoviesRepository moviesRepository;
  GetMovieDetailsUseCase(this.moviesRepository);
  @override
  Future<Either<Failure, MovieDetails>> call(int parameters) async {
    return moviesRepository.getMovieDetails(parameters);
  }
}
