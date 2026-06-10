import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/core/utils/custom_either.dart';
import 'package:movies_app/modules/movies/domain/entities/movies_recommendation.dart';
import 'package:movies_app/modules/movies/domain/repository/base_movies_repo.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_movie_details_usecase.dart';

class GetMoviesRecommendationUseCase extends BaseUseCase<List<MoviesRecommendationEntities>, MovieDetailsParams> {
  final BaseMoviesRepository baseMoviesRepository;
  GetMoviesRecommendationUseCase(this.baseMoviesRepository);

  @override
  CustomEither<List<MoviesRecommendationEntities>> call(MovieDetailsParams params) async {
    return await baseMoviesRepository.getMoviesRecommendation(params: params);
  }
  
}