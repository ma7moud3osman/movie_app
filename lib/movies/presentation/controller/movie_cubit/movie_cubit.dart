import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/request_states.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/domain/usecases/get_now_playing_use_case.dart';
import 'package:movie_app/movies/domain/usecases/get_popular_movies_use_case.dart';
import 'package:movie_app/movies/domain/usecases/get_top_rated_movies_use_case.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final GetNowPlayingUseCase getNowPlayingUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MovieCubit(
    this.getNowPlayingUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MovieState());

  Future<void> getNowPlayingMovies() async {
    emit(state.copyWith(nowPlayingState: RequestState.loading));
    final result = await getNowPlayingUseCase();
    result.fold(
        (l) => emit(state.copyWith(
            nowPlayingState: RequestState.hasError,
            nowPlayingErrorMsg: l.message)),
        (r) => emit(state.copyWith(
            nowPlayingState: RequestState.hasData, nowPlayingMovies: r)));
  }

  Future<void> getPopularMovies() async {
    emit(state.copyWith(popularState: RequestState.loading));
    final result = await getPopularMoviesUseCase();
    result.fold(
        (l) => emit(state.copyWith(
            popularState: RequestState.hasError, popularErrorMsg: l.message)),
        (r) => emit(state.copyWith(
            popularState: RequestState.hasData, popularMovies: r)));
  }

  Future<void> getTopRatedMovies() async {
    emit(state.copyWith(topRatedState: RequestState.loading));
    final result = await getTopRatedMoviesUseCase();
    result.fold(
        (l) => emit(state.copyWith(
            topRatedState: RequestState.hasError, topRatedErrorMsg: l.message)),
        (r) => emit(state.copyWith(
            topRatedState: RequestState.hasData, topRatedMovies: r)));
  }
}
