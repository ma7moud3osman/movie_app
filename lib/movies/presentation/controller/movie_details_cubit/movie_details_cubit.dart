import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/request_states.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:movie_app/movies/domain/usecases/get_similar_movies_use_case.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetSimilarMoviesUseCase getSimilarMoviesUseCase;

  MovieDetailsCubit({
    required this.getMovieDetailsUseCase,
    required this.getSimilarMoviesUseCase,
  }) : super(const MovieDetailsState());

  Future<void> getMovieDetails(int movieId) async {
    emit(state.copyWith(movieState: RequestState.loading));

    final result = await getMovieDetailsUseCase(movieId);
    result.fold(
        (l) => emit(state.copyWith(
            movieState: RequestState.hasError, movieErrorMsg: l.message)),
        (r) => emit(
            state.copyWith(movieState: RequestState.hasData, movieDetails: r)));
  }

  Future<void> getSimilarMovies(int movieId) async {
    emit(state.copyWith(similarMoviesState: RequestState.loading));

    final result = await getSimilarMoviesUseCase(movieId);
    result.fold(
        (l) => emit(state.copyWith(
            similarMoviesState: RequestState.hasError,
            similarMoviesErrorMsg: l.message)),
        (r) => emit(state.copyWith(
            similarMoviesState: RequestState.hasData, similarMovies: r)));
  }
}
