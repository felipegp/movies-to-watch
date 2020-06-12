import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_to_watch/domain/entities/movie.dart';

import 'package:movies_to_watch/domain/entities/movies_type.dart';
import 'package:movies_to_watch/domain/entities/movies.dart';
import 'package:movies_to_watch/domain/repository/movies_repository.dart';


class MoviesGatewayRest implements MoviesRepository {
  static const API_KEY = '***';
  static const baseUrl = 'https://api.themoviedb.org/3/movie/';

  @override
  Future<Movies> getMovies(MovieListType movieListType) async {
    final response = await http.get(baseUrl + movieListType.name.toLowerCase() + '?api_key=' + API_KEY + '&language=en-US&page=1');

    if (response.statusCode == 200) {
      return Movies.fromJson(json.decode(response.body));
    }

    throw Exception('Failed to load movies');
  }

  @override
  Future<Movie> getMovieById(int id) async {
    final response = await http.get(baseUrl + id.toString() + '?api_key=' + API_KEY + '&language=en-US&page=1');

    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return Movie.fromJson(json.decode(response.body));
    }

    throw Exception('Failed to load movie');
  }

}