import 'package:get_it/get_it.dart';
import 'package:movies_app/core/networking/api_services.dart';
import 'package:movies_app/modules/movies/data/datasource/movies_remote_datasource.dart';
import 'package:movies_app/modules/movies/data/repository/movies_remote_repository.dart';
import 'package:movies_app/modules/movies/domain/repository/base_movies_repo.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_app/modules/movies/presentation/controller/bloc/movie_details_bloc.dart';
import 'package:movies_app/modules/movies/presentation/controller/bloc/movies_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void initServiceLocator() {
    initCore();
    initMoviesModule();
  }

  void initCore() {
    /// Dio
    sl.registerLazySingleton(() => ApiServices());
  }

  void initMoviesModule() {
    /// Data Source
    sl.registerLazySingleton<BaseMoviesRemoteDatasource>(
      () => MoviesRemoteDatasource(apiService: sl<ApiServices>()),
    );

    /// Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
      () => MoviesRemoteRepository(
        baseMoviesRemoteDatasource: sl<BaseMoviesRemoteDatasource>(),
      ),
    );

    /// Use Cases
    sl.registerLazySingleton(
      () => GetNowPlayingMoviesUsecase(sl<BaseMoviesRepository>()),
    );
    sl.registerLazySingleton(
      () => GetPopularMoviesUsecase(sl<BaseMoviesRepository>()),
    );
    sl.registerLazySingleton(
      () => GetTopRatedMoviesUsecase(sl<BaseMoviesRepository>()),
    );
    sl.registerLazySingleton(
      () => GetMovieDetailsUsecase(sl<BaseMoviesRepository>()),
    );

    /// Bloc
    sl.registerFactory(
      () => MoviesBloc(
        getNowPlayingMoviesUsecase: sl<GetNowPlayingMoviesUsecase>(),
        getPopularMoviesUsecase: sl<GetPopularMoviesUsecase>(),
        getTopRatedMoviesUsecase: sl<GetTopRatedMoviesUsecase>(),
      ),
    );

    sl.registerFactory(
      () => MovieDetailsBloc(
        getMovieDetailsUsecase: sl<GetMovieDetailsUsecase>(),
      ),
    );
  }
}
