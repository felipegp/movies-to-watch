import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:movies_to_watch/domain/entities/movies_type.dart';
import 'package:movies_to_watch/domain/entities/movies.dart';
import 'package:movies_to_watch/domain/repository/movies_repository.dart';


class MoviesGatewayRest implements MoviesRepository {
  static const API_KEY = '***';

  @override
  Future<Movies> getMovies(MovieListType movieListType) async {
    final response = await http.get(
        'https://api.themoviedb.org/3/movie/popular?api_key=' + API_KEY + '&language=en-US&page=1');

    print('retornou get movies');

    if (response.statusCode == 200) {
      return Movies.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load movies');
    }
  }

}