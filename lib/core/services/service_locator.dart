import 'package:get_it/get_it.dart';
import 'package:movies_app/core/networking/api_services.dart';
import 'package:movies_app/modules/movies/data/datasource/movies_remote_datasource.dart';
import 'package:movies_app/modules/movies/data/repository/movies_remote_repository.dart';
import 'package:movies_app/modules/movies/domain/repository/base_movies_repo.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/modules/movies/presentation/controller/movies_bloc.dart';

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

    /// Bloc
    sl.registerFactory(() => MoviesBloc(sl<GetNowPlayingMoviesUsecase>()));
  }
}
