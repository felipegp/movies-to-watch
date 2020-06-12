import 'package:flutter/material.dart';
import 'package:movies_to_watch/domain/entities/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final Function clickHandler;

  MovieCard({this.movie, this.clickHandler});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => clickHandler(movie.id),
      child: Container(
        child: Text(movie.title, style: TextStyle(fontSize: 16.0))));
  }
}
