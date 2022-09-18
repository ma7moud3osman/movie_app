import 'package:flutter/material.dart';
import 'package:movie_app/core/services/service_locator.dart';
import 'package:movie_app/movies/presentation/screens/movies_screen.dart';

void main() {
  ServiceLocator.register();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData.dark(),
      home: const MoviesScreen(),
    );
  }
}
