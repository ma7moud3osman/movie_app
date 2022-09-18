const baseUrl = 'https://api.themoviedb.org/3';
const apiKey = '8a53e498b58244880e75ea0770bb32ef';
const baseImageUrl = 'https://image.tmdb.org/t/p/w500';
String imageUrl(String path) => '$baseImageUrl$path';

const nowPlayingEP = '/movie/now_playing';
const popularMoviesEP = '/movie/popular';
const topRatedMoviesEP = '/movie/top_rated';
const movieDetails = '/movie/';
String similarMoviesPath(int movieId) => '$movieDetails$movieId/similar';
