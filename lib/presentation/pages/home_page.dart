import 'package:flutter/material.dart';
import 'package:movies_to_watch/domain/entities/movies.dart';
import 'package:movies_to_watch/domain/entities/movies_type.dart';
import 'package:movies_to_watch/presentation/view_models/home_view_model.dart';
import 'package:movies_to_watch/presentation/widgets/header/header.dart';
import 'package:movies_to_watch/presentation/widgets/movies_grid/movies_grid.dart';

import '../../config/injection_container.dart';
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HomeViewModel homeViewModel = getIt<HomeViewModel>();
  Future<Movies> futureMovies;
  
  void _headerClickHandler(String buttonType) {
    MovieListType movieListType = MovieListType.values.firstWhere((e) => e.toString() == 'MovieListType.' + buttonType.toUpperCase());

    setState(() {
      futureMovies = homeViewModel.getMoviesByType(movieListType);      
    });
  }

  @override
  void initState() { 
    super.initState();
    futureMovies = homeViewModel.getMoviesByType(MovieListType.UPCOMING);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            Header(_headerClickHandler),
            FutureBuilder<Movies>(
              future: futureMovies,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return MoviesGrid(snapshot.data.movies);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            )
          ],
        ));
  }
}
