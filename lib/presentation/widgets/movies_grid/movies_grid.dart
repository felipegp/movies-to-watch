import 'package:flutter/material.dart';
import 'package:movies_to_watch/domain/entities/movie.dart';
import 'package:movies_to_watch/presentation/widgets/movies_grid/movie_card.dart';

class MoviesGrid extends StatelessWidget {
  final List<Movie> movies;

  MoviesGrid(this.movies);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(16),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 3,
      children: <Widget>[
        ...movies.map(
          (movie) => MovieCard(movie: movie, clickHandler: null,)).toList()
      ],
    );
  }
}