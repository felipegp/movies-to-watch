import 'package:movies_to_watch/domain/entities/movie.dart';
import 'package:movies_to_watch/domain/entities/movies.dart';
import 'package:movies_to_watch/domain/entities/movies_type.dart';

abstract class MoviesRepository {
  Future<Movies> getMovies(MovieListType movieListType);
  Future<Movie> getMovieById(int id);
}