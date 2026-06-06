import 'package:movies_app/core/errors/server_exception_handler.dart';
import 'package:movies_app/core/utils/custom_either.dart';
abstract class BaseMoviesRepository {
  CustomEither<ServerFailure> getNowPlayingMovies();

  CustomEither<ServerFailure> getPopularMovies();

  CustomEither<ServerFailure> getTopRatedMovies();
}
