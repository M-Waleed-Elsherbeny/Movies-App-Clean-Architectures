import 'package:movies_app/core/networking/api_services.dart';
import 'package:movies_app/core/server/api_constance.dart';
import 'package:movies_app/modules/movies/data/model/movies_model.dart';

abstract class BaseMoviesRemoteDatasource {
  Future<List<MoviesModel>> getNowPlayingMovies();
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRatedMovies();
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
    final response = await apiService.get(
      endPoint: ApiConstance.popularMovies,
    );
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
}
