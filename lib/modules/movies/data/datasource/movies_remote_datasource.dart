import 'package:movies_app/core/networking/api_services.dart';
import 'package:movies_app/core/server/api_constance.dart';
import 'package:movies_app/modules/movies/data/model/movies_details_model.dart';
import 'package:movies_app/modules/movies/data/model/movies_model.dart';
import 'package:movies_app/modules/movies/data/model/movies_recommendation_model.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_movie_details_usecase.dart';

abstract class BaseMoviesRemoteDatasource {
  Future<List<MoviesModel>> getNowPlayingMovies();
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRatedMovies();

  Future<MoviesDetailsModel> getMovieDetails({
    required MovieDetailsParams params,
  });
  Future<List<MoviesRecommendationModel>> getMoviesRecommendation({
    required MovieDetailsParams params,
  });
}

class MoviesRemoteDatasource implements BaseMoviesRemoteDatasource {
  final ApiServices apiService;

  MoviesRemoteDatasource({required this.apiService});
  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    final response = await apiService.get(
      endPoint: ApiConstance.nowPlayingMovies,
    );
    return List<MoviesModel>.from(
      (response.data['results'] as List).map((x) => MoviesModel.fromJson(x)),
    );
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    final response = await apiService.get(endPoint: ApiConstance.popularMovies);
    return List<MoviesModel>.from(
      (response.data['results'] as List).map((x) => MoviesModel.fromJson(x)),
    );
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async {
    final response = await apiService.get(
      endPoint: ApiConstance.topRatedMovies,
    );
    return List<MoviesModel>.from(
      (response.data['results'] as List).map((x) => MoviesModel.fromJson(x)),
    );
  }

  @override
  Future<MoviesDetailsModel> getMovieDetails({
    required MovieDetailsParams params,
  }) async {
    final response = await apiService.get(
      endPoint: ApiConstance.movieDetailsPath(params.movieId),
    );
    return MoviesDetailsModel.fromJson(response.data);
  }

  @override
  Future<List<MoviesRecommendationModel>> getMoviesRecommendation({
    required MovieDetailsParams params,
  }) async {
    final response = await apiService.get(
      endPoint: ApiConstance.movieRecommendationsPath(params.movieId),
    );
    return List<MoviesRecommendationModel>.from(
      (response.data['results'] as List).map(
        (x) => MoviesRecommendationModel.fromJson(x),
      ),
    );
  }
}
