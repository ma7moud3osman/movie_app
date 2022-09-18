import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/domain/repositories/base_movies_repository.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSource movieRemoteDataSource;
  MoviesRepository({
    required this.movieRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final nowPlayingMovies = await movieRemoteDataSource.getNowPlayingMovies();
    return nowPlayingMovies;
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final popularMovies = await movieRemoteDataSource.getPopularMovies();
    return popularMovies;
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final topRatedMovies = await movieRemoteDataSource.getTopRatedMovies();
    return topRatedMovies;
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(int parameters) {
    final movieDetails = movieRemoteDataSource.getMovieDetails(parameters);
    return movieDetails;
  }

  @override
  Future<Either<Failure, List<Movie>>> getSimilarMovies(int parameters) {
    final similarMovies = movieRemoteDataSource.getSimilarMovies(parameters);
    return similarMovies;
  }
}
