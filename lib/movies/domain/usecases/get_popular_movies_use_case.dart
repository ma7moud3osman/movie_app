import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/base_usecase.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/repositories/base_movies_repository.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseMoviesRepository moviesRepository;
  GetPopularMoviesUseCase({
    required this.moviesRepository,
  });

  @override
  Future<Either<Failure, List<Movie>>> call([NoParameters? parameters]) async {
    return await moviesRepository.getPopularMovies();
  }
}