import 'package:flutter/material.dart';
import 'package:movies_to_watch/domain/entities/movies.dart';
import 'package:movies_to_watch/domain/entities/movies_type.dart';
import 'package:movies_to_watch/presentation/pages/movie_details_page.dart';
import 'package:movies_to_watch/presentation/view_models/home_view_model.dart';
import 'package:movies_to_watch/presentation/widgets/header/header.dart';
import 'package:movies_to_watch/presentation/widgets/movies_grid/movies_grid.dart';
import 'package:movies_to_watch/shred/variables.dart';

import '../../config/injection_container.dart';
class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HomeViewModel homeViewModel = getIt<HomeViewModel>();
  Future<Movies> futureMovies;
  MovieListType movieListType = MovieListType.UPCOMING;
  
  void _headerClickHandler(String buttonType) {
    movieListType = MovieListType.values.firstWhere((e) => e.toString() == 'MovieListType.' + buttonType.toUpperCase());

    setState(() {
      futureMovies = homeViewModel.getMoviesByType(movieListType);
    });
  }

  void _openMovieDetails(int movieId) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MovieDetailsPage(movieId))
    );
  }

  @override
  void initState() { 
    super.initState();
    futureMovies = homeViewModel.getMoviesByType(movieListType);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          // color: Variables.primary,
          color: Colors.black87,
          child: Column(
            children: <Widget>[
              Header(buttonClickHandler: _headerClickHandler, movieListType: movieListType),
              FutureBuilder<Movies>(
                future: futureMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return MoviesGrid(movies: snapshot.data.movies, movieClickhandler: _openMovieDetails);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  return CircularProgressIndicator();
                },
              )
            ],
          ),
        ));
  }
}
