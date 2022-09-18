import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String posterPath;
  final String backdropPath;
  final String overview;
  final String releaseDate;
  final double voteAverage;
  final List<int> genreIds;

  const Movie({
    required this.id,
    required this.title,
    required this.genreIds,
    required this.posterPath,
    required this.backdropPath,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
  });

  @override
  List<Object> get props {
    return [
      id,
      title,
      posterPath,
      genreIds,
      backdropPath,
      overview,
      releaseDate,
      voteAverage,
    ];
  }
}
