
import 'package:movies_to_watch/domain/entities/movie.dart';
import 'package:movies_to_watch/domain/repository/movies_repository.dart';

class GetMovieDetails {
  final MoviesRepository moviesRepository;

  GetMovieDetails(this.moviesRepository);

  Future<Movie> execute(int id) {
    return moviesRepository.getMovieById(id);
  }
}
