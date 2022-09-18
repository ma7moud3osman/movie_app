import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/network/api_constants.dart';
import 'package:movie_app/movies/data/models/movie_details_model.dart';
import 'package:movie_app/movies/data/models/movie_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<Either<Failure, List<MovieModel>>> getNowPlayingMovies();
  Future<Either<Failure, List<MovieModel>>> getPopularMovies();
  Future<Either<Failure, List<MovieModel>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetailsModel>> getMovieDetails(int movieId);
  Future<Either<Failure, List<MovieModel>>> getSimilarMovies(int movieId);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<Either<Failure, List<MovieModel>>> getNowPlayingMovies() async {
    final response =
        await http.get(Uri.parse('$baseUrl$nowPlayingEP?api_key=$apiKey'));

    if (response.statusCode == 200) {
      return Right(List<MovieModel>.from(json
          .decode(response.body)['results']
          .map((movieMap) => MovieModel.fromMap(movieMap))));
    } else {
      return Left(ApiFailure.fromMap(json.decode(response.body)));
    }
  }

  // @override
  // Future<Either<Failure, List<MovieModel>>> getPopularMovies() async {
  //   final response = await dio.request(popularMoviesEP);

  //   if (response.statusCode == 200) {
  //     return Right(List<MovieModel>.from(response.data['results']
  //         .map((movieMap) => MovieModel.fromMap(movieMap))));
  //   } else {
  //     return Left(ApiFailure.fromMap(response.data));
  //   }
  // }

  @override
  Future<Either<Failure, List<MovieModel>>> getPopularMovies() async {
    final response =
        await http.get(Uri.parse('$baseUrl$popularMoviesEP?api_key=$apiKey'));

    if (response.statusCode == 200) {
      return Right(List<MovieModel>.from(json
          .decode(response.body)['results']
          .map((movieMap) => MovieModel.fromMap(movieMap))));
    } else {
      return Left(ApiFailure.fromMap(json.decode(response.body)));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getTopRatedMovies() async {
    final response =
        await http.get(Uri.parse('$baseUrl$topRatedMoviesEP?api_key=$apiKey'));

    if (response.statusCode == 200) {
      return Right(List<MovieModel>.from(json
          .decode(response.body)['results']
          .map((movieMap) => MovieModel.fromMap(movieMap))));
    } else {
      return Left(ApiFailure.fromMap(json.decode(response.body)));
    }
  }

  @override
  Future<Either<Failure, MovieDetailsModel>> getMovieDetails(
      int movieId) async {
    final response = await http
        .get(Uri.parse('$baseUrl$movieDetails$movieId?api_key=$apiKey'));

    if (response.statusCode == 200) {
      return Right(MovieDetailsModel.fromMap(json.decode(response.body)));
    } else {
      return Left(ApiFailure.fromMap(json.decode(response.body)));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getSimilarMovies(
      int movieId) async {
    final response = await http.get(
        Uri.parse('$baseUrl${similarMoviesPath(movieId)}?api_key=$apiKey'));

    if (response.statusCode == 200) {
      return Right(List<MovieModel>.from(json
          .decode(response.body)['results']
          .map((movieMap) => MovieModel.fromMap(movieMap))));
    } else {
      return Left(ApiFailure.fromMap(json.decode(response.body)));
    }
  }
}
