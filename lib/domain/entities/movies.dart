import 'package:movies_to_watch/domain/entities/movie.dart';

class Movies {
  final int page;
  final int totalPages;
  final List<Movie> movies;

  Movies({ this.page, this.totalPages, this.movies });

  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(
      page: json['page'],
      totalPages: json['total_pages'],
      movies: (json['results'] as List<dynamic>).map(
        (movieJson) => Movie.fromJson(movieJson)).toList(),
    );
  }
}

