import 'package:movies_to_watch/domain/entities/movies.dart';
import 'package:movies_to_watch/domain/entities/movies_type.dart';
import 'package:movies_to_watch/domain/usecase/get_movies.dart';

class HomeViewModel {
  final GetMovies getMovies;

  HomeViewModel(this.getMovies);

  Future<Movies> getMoviesByType(MovieListType movieListType) {
    return getMovies.execute(movieListType);
  }
}