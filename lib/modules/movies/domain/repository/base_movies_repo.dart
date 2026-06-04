import 'package:movies_app/modules/movies/domain/entities/movies_entities.dart';

abstract class BaseMoviesRepository {
  Future<List<MoviesEntities>> getNowPlayingMovies();
  Future<List<MoviesEntities>> getPopularMovies();
  Future<List<MoviesEntities>> getTopRatedMovies();
}
