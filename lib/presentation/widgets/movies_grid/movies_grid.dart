import 'package:flutter/material.dart';
import 'package:movies_to_watch/domain/entities/movie.dart';
import 'package:movies_to_watch/presentation/widgets/movies_grid/movie_card.dart';

class MoviesGrid extends StatelessWidget {
  final List<Movie> movies;
  final Function movieClickhandler;

  MoviesGrid({ this.movies, this.movieClickhandler });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          ...movies
              .map((movie) => MovieCard(
                    movie: movie,
                    clickHandler: movieClickhandler,
                  ))
              .toList()
        ],
      ),
    );
  }
}
