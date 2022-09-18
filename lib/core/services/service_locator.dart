import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movie_app/movies/data/repositories/movies_repository.dart';
import 'package:movie_app/movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:movie_app/movies/domain/usecases/get_now_playing_use_case.dart';
import 'package:movie_app/movies/domain/usecases/get_popular_movies_use_case.dart';
import 'package:movie_app/movies/domain/usecases/get_similar_movies_use_case.dart';
import 'package:movie_app/movies/domain/usecases/get_top_rated_movies_use_case.dart';
import 'package:movie_app/movies/presentation/controller/movie_cubit/movie_cubit.dart';
import 'package:movie_app/movies/presentation/controller/movie_details_cubit/movie_details_cubit.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  static void register() {
    /// Register Data Sources
    getIt.registerLazySingleton(() => MovieRemoteDataSource());

    /// Register Repositories
    getIt.registerLazySingleton(() => MoviesRepository(
        movieRemoteDataSource: getIt<MovieRemoteDataSource>()));

    /// Register Use Cases
    getIt.registerLazySingleton(() =>
        GetNowPlayingUseCase(moviesRepository: getIt<MoviesRepository>()));
    getIt.registerLazySingleton(() =>
        GetPopularMoviesUseCase(moviesRepository: getIt<MoviesRepository>()));
    getIt.registerLazySingleton(() =>
        GetTopRatedMoviesUseCase(moviesRepository: getIt<MoviesRepository>()));
    getIt.registerLazySingleton(
        () => GetMovieDetailsUseCase(getIt<MoviesRepository>()));
    getIt.registerLazySingleton(
        () => GetSimilarMoviesUseCase(getIt<MoviesRepository>()));

    /// Register Movie Cubit
    getIt.registerFactory(() => MovieCubit(
          getIt<GetNowPlayingUseCase>(),
          getIt<GetPopularMoviesUseCase>(),
          getIt<GetTopRatedMoviesUseCase>(),
        ));

    /// Register Movie Details Cubit
    getIt.registerFactory(() => MovieDetailsCubit(
          getMovieDetailsUseCase: getIt<GetMovieDetailsUseCase>(),
          getSimilarMoviesUseCase: getIt<GetSimilarMoviesUseCase>(),
        ));
  }
}
