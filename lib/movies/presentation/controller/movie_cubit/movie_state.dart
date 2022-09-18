part of 'movie_cubit.dart';

class MovieState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final List<Movie> popularMovies;
  final List<Movie> topRatedMovies;
  final MovieDetails? movieDetails;
  final RequestState nowPlayingState;
  final RequestState popularState;
  final RequestState topRatedState;
  final RequestState movieDetailsState;
  final String nowPlayingErrorMsg;
  final String popularErrorMsg;
  final String topRatedErrorMsg;
  final String movieDetailsErrorMsg;

  const MovieState({
    this.nowPlayingMovies = const [],
    this.popularMovies = const [],
    this.topRatedMovies = const [],
    this.movieDetails,
    this.nowPlayingState = RequestState.idle,
    this.popularState = RequestState.idle,
    this.topRatedState = RequestState.idle,
    this.movieDetailsState = RequestState.idle,
    this.nowPlayingErrorMsg = '',
    this.popularErrorMsg = '',
    this.topRatedErrorMsg = '',
    this.movieDetailsErrorMsg = '',
  });

  @override
  List<Object> get props {
    return [
      nowPlayingMovies,
      popularMovies,
      topRatedMovies,
      nowPlayingState,
      popularState,
      topRatedState,
      topRatedState,
      movieDetailsState,
      popularErrorMsg,
      topRatedErrorMsg,
      movieDetailsErrorMsg,
    ];
  }

  MovieState copyWith({
    List<Movie>? nowPlayingMovies,
    List<Movie>? popularMovies,
    List<Movie>? topRatedMovies,
    RequestState? nowPlayingState,
    RequestState? popularState,
    RequestState? topRatedState,
    String? nowPlayingErrorMsg,
    String? popularErrorMsg,
    String? topRatedErrorMsg,
  }) {
    return MovieState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      popularMovies: popularMovies ?? this.popularMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      popularState: popularState ?? this.popularState,
      topRatedState: topRatedState ?? this.topRatedState,
      nowPlayingErrorMsg: nowPlayingErrorMsg ?? this.nowPlayingErrorMsg,
      popularErrorMsg: popularErrorMsg ?? this.popularErrorMsg,
      topRatedErrorMsg: topRatedErrorMsg ?? this.topRatedErrorMsg,
    );
  }
}
