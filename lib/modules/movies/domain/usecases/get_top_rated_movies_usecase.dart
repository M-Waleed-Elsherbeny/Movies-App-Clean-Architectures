import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/core/utils/custom_either.dart';
import 'package:movies_app/modules/movies/domain/entities/movies_entities.dart';
import 'package:movies_app/modules/movies/domain/repository/base_movies_repo.dart';

class GetTopRatedMoviesUsecase implements BaseUseCase<List<MoviesEntities>, NoParams> {
  final BaseMoviesRepository repository;

  GetTopRatedMoviesUsecase(this.repository);

  @override
  CustomEither<List<MoviesEntities>> call(NoParams params) async {
    return await repository.getTopRatedMovies();
  }
}
