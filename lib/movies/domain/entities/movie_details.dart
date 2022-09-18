import 'package:equatable/equatable.dart';
import 'package:movie_app/movies/domain/entities/genre.dart';

class MovieDetails extends Equatable {
  final int id;
  final String backdropPath;
  final String posterPath;
  final String title;
  final String overview;
  final String releaseDate;
  final double voteAverage;
  final List<Genre> genres;
  final String imdbId;
  final int runtime;
  final String tagline;

  const MovieDetails({
    required this.id,
    required this.backdropPath,
    required this.posterPath,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.genres,
    required this.imdbId,
    required this.runtime,
    required this.tagline,
  });

  @override
  List<Object> get props {
    return [
      id,
      backdropPath,
      posterPath,
      title,
      overview,
      releaseDate,
      voteAverage,
      genres,
      imdbId,
      runtime,
      tagline,
    ];
  }
}
