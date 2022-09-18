import 'package:movie_app/movies/data/models/genre_model.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.id,
      required super.backdropPath,
      required super.posterPath,
      required super.title,
      required super.overview,
      required super.releaseDate,
      required super.voteAverage,
      required super.genres,
      required super.imdbId,
      required super.runtime,
      required super.tagline});

  factory MovieDetailsModel.fromMap(Map<String, dynamic> map) {
    return MovieDetailsModel(
      id: map['id'] as int,
      backdropPath: map['backdrop_path'] as String,
      posterPath: map['poster_path'] as String,
      title: map['title'] as String,
      overview: map['overview'] as String,
      releaseDate: map['release_date'] as String,
      voteAverage: map['vote_average'].toDouble(),
      genres: List<GenreModel>.from(
        (map['genres'] as List).map<GenreModel>(
          (x) => GenreModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      imdbId: map['imdb_id'] as String,
      runtime: map['runtime'] as int,
      tagline: map['tagline'] as String,
    );
  }
}
