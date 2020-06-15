import 'package:flutter/material.dart';
import 'package:movies_to_watch/domain/entities/movies_type.dart';
import 'package:movies_to_watch/presentation/widgets/header/button-header.dart';

class Header extends StatelessWidget {
  final Function buttonClickHandler;
  final MovieListType movieListType;

  Header({ this.buttonClickHandler, this.movieListType });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ButtonHeader(text: MovieListType.UPCOMING.name, clickHandler: buttonClickHandler, active: movieListType == MovieListType.UPCOMING),
          ButtonHeader(text: MovieListType.POPULAR.name, clickHandler: buttonClickHandler, active: movieListType == MovieListType.POPULAR)
        ],
      ),
    );
  }
}
