import 'package:movies_app/core/utils/custom_either.dart';
import 'package:movies_app/modules/movies/domain/entities/movies_details_entities.dart';
import 'package:movies_app/modules/movies/domain/entities/movies_entities.dart';
import 'package:movies_app/modules/movies/domain/entities/movies_recommendation.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_movie_details_usecase.dart';

abstract class BaseMoviesRepository {
  CustomEither<List<MoviesEntities>> getNowPlayingMovies();

  CustomEither<List<MoviesEntities>> getPopularMovies();

  CustomEither<List<MoviesEntities>> getTopRatedMovies();

  CustomEither<MovieDetailsEntities> getMovieDetails({
    required MovieDetailsParams params,
  });

  CustomEither<List<MoviesRecommendationEntities>> getMoviesRecommendation({
    required MovieDetailsParams params,
  });
}
