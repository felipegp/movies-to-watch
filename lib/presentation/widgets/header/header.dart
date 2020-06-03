import 'package:flutter/material.dart';
import 'package:movies_to_watch/domain/entities/movies_type.dart';
import 'package:movies_to_watch/presentation/widgets/header/button-header.dart';

class Header extends StatelessWidget {
  final Function buttonClickHandler;

  Header(this.buttonClickHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ButtonHeader(text: MovieListType.UPCOMING.name, clickHandler: buttonClickHandler),
          ButtonHeader(text: MovieListType.POPULAR.name, clickHandler: buttonClickHandler)
        ],
      ),
    );
  }
}
