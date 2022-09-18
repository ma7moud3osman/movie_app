import 'package:movie_app/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel(
      {required super.id,
      required super.title,
      required super.genreIds,
      required super.posterPath,
      required super.backdropPath,
      required super.overview,
      required super.releaseDate,
      required super.voteAverage});

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'],
      title: map['title'],
      genreIds: List<int>.from(map['genre_ids'] as List),
      posterPath: map['poster_path'],
      backdropPath: map['backdrop_path'],
      overview: map['overview'],
      releaseDate: map['release_date'],
      voteAverage: map['vote_average'].toDouble(),
    );
  }
}
