import 'package:flutter/material.dart';
import 'package:movies_to_watch/config/injection_container.dart';
import 'package:movies_to_watch/domain/entities/movie.dart';
import 'package:movies_to_watch/presentation/view_models/movie_details_view_model.dart';

class MovieDetailsPage extends StatelessWidget {
  final int movieId;
  final MovieDetailsViewModel movieDetailsViewModel = getIt<MovieDetailsViewModel>();

  MovieDetailsPage(this.movieId);
  
  @override
  Widget build(BuildContext context) {
    Future<Movie> futureMovieDetail = movieDetailsViewModel.getMoviesById(movieId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Container(
        child: FutureBuilder<Movie>(
                future: futureMovieDetail,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.title + ' - ' + snapshot.data.releaseDate);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  // By default, show a loading spinner.
                  return CircularProgressIndicator();
                },
              )
      ),
    );
  }
}