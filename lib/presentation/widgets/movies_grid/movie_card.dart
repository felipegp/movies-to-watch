import 'package:flutter/material.dart';
import 'package:movies_to_watch/domain/entities/movie.dart';
import 'package:movies_to_watch/shred/date_utils.dart';
import 'package:movies_to_watch/shred/variables.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final Function clickHandler;
  final String imageBaseUrl = 'https://image.tmdb.org/t/p/w300';

  MovieCard({this.movie, this.clickHandler});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => clickHandler(movie.id),
      child: Container(
          decoration: BoxDecoration(
            image: new DecorationImage(
              image: NetworkImage(imageBaseUrl + movie.poster),
              fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Wrap(
                children: <Widget>[
                  Center(
                    child: Container(
                    margin: EdgeInsets.only(bottom: 4),
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Variables.secondary),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Text(
                        DateUtils.toDateMonthYearFormat(movie.releaseDate),
                        style: TextStyle(
                          fontSize: 16.0, color: Variables.secondary))),
                  )),
                ],
              )
            ],
          )),
    );
  }
}
