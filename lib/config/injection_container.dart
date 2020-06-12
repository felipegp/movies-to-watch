import 'package:get_it/get_it.dart';
import 'package:movies_to_watch/domain/repository/movies_repository.dart';
import 'package:movies_to_watch/domain/usecase/get_movie_details.dart';
import 'package:movies_to_watch/domain/usecase/get_movies.dart';
import 'package:movies_to_watch/gateway/rest/movies_gateway_rest.dart';
import 'package:movies_to_watch/presentation/view_models/home_view_model.dart';
import 'package:movies_to_watch/presentation/view_models/movie_details_view_model.dart';

GetIt getIt = GetIt.instance;

void init() {
  getIt.registerSingleton<MoviesRepository>(MoviesGatewayRest());
  getIt.registerSingleton<GetMovies>(GetMovies(getIt()));
  getIt.registerSingleton<GetMovieDetails>(GetMovieDetails(getIt()));
  getIt.registerFactory(() => HomeViewModel(getIt()));
  getIt.registerFactory(() => MovieDetailsViewModel(getIt()));
}