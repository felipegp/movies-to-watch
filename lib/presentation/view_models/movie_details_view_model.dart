import 'package:movies_to_watch/domain/entities/movie.dart';
import 'package:movies_to_watch/domain/usecase/get_movie_details.dart';

class MovieDetailsViewModel {
  final GetMovieDetails getMovieDetails;

  MovieDetailsViewModel(this.getMovieDetails);

  Future<Movie> getMoviesById(int id) {
    return getMovieDetails.execute(id);
  }
}