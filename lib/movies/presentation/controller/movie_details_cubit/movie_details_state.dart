// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movie_details_cubit.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final List<Movie> similarMovies;
  final RequestState movieState;
  final RequestState similarMoviesState;
  final String movieErrorMsg;
  final String similarMoviesErrorMsg;
  const MovieDetailsState({
    this.movieDetails,
    this.similarMovies = const [],
    this.movieState = RequestState.idle,
    this.similarMoviesState = RequestState.idle,
    this.movieErrorMsg = '',
    this.similarMoviesErrorMsg = '',
  });

  @override
  List<Object> get props {
    return [
      similarMovies,
      movieState,
      similarMoviesState,
      movieErrorMsg,
      similarMoviesErrorMsg,
    ];
  }

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    List<Movie>? similarMovies,
    RequestState? movieState,
    RequestState? similarMoviesState,
    String? movieErrorMsg,
    String? similarMoviesErrorMsg,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      similarMovies: similarMovies ?? this.similarMovies,
      movieState: movieState ?? this.movieState,
      similarMoviesState: similarMoviesState ?? this.similarMoviesState,
      movieErrorMsg: movieErrorMsg ?? this.movieErrorMsg,
      similarMoviesErrorMsg:
          similarMoviesErrorMsg ?? this.similarMoviesErrorMsg,
    );
  }
}
