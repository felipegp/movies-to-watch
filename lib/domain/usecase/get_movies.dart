import 'package:movies_to_watch/domain/entities/movies.dart';
import 'package:movies_to_watch/domain/entities/movies_type.dart';
import 'package:movies_to_watch/domain/repository/movies_repository.dart';

class GetMovies {
  final MoviesRepository moviesRepository;

  GetMovies(this.moviesRepository);

  Future<Movies> execute(MovieListType movieListType) {
    return moviesRepository.getMovies(movieListType);
  }
}