import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/service_locator.dart';
import 'package:movie_app/core/widgets/section_title_with_button.dart';
import 'package:movie_app/movies/presentation/components/now_playing_component.dart';
import 'package:movie_app/movies/presentation/components/popular_movies_component.dart';
import 'package:movie_app/movies/presentation/components/top_rated_movies_component.dart';
import 'package:movie_app/movies/presentation/controller/movie_cubit/movie_cubit.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('Build...');
    return BlocProvider(
      create: (context) => getIt<MovieCubit>()
        ..getNowPlayingMovies()
        ..getPopularMovies()
        ..getTopRatedMovies(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NowPlayingComponent(),
              SectionTitleWithButton(
                title: 'Popular',
                onTap: () {
                  /// TODO : NAVIGATION TO Popular SCREEN
                },
              ),
              const PopularMoviesComponent(),
              SectionTitleWithButton(
                title: "Top Rated",
                onTap: () {
                  /// TODO : NAVIGATION TO TOP RATED SCREEN
                },
              ),
              const TopRatedMoviesComponent(),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
