import 'package:movies_app/core/errors/server_exception_handler.dart';
import 'package:movies_app/core/utils/custom_either.dart';
import 'package:movies_app/modules/movies/domain/repository/base_movies_repo.dart';

class GetNowPlayingMoviesUsecase {
  final BaseMoviesRepository repository;
  GetNowPlayingMoviesUsecase(this.repository);

  CustomEither<ServerFailure> execute() async {
    return await repository.getNowPlayingMovies();
  }
}
