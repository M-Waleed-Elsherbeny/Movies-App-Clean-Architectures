import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/server_exception_handler.dart';
import 'package:movies_app/core/utils/custom_either.dart';
import 'package:movies_app/modules/movies/data/datasource/movies_remote_datasource.dart';
import 'package:movies_app/modules/movies/domain/repository/base_movies_repo.dart';

class MoviesRemoteRepository extends BaseMoviesRepository {
  final BaseMoviesRemoteDatasource baseMoviesRemoteDatasource;
  MoviesRemoteRepository({required this.baseMoviesRemoteDatasource});

  @override
  CustomEither<ServerFailure> getNowPlayingMovies() async {
    try {
      final result = await baseMoviesRemoteDatasource.getNowPlayingMovies();
      return Right(result);
    } on ServerFailure catch (failure) {
      return Left(ServerFailure(errMessage: failure.errMessage));
    }
  }

  @override
  CustomEither<ServerFailure> getPopularMovies() async {
    try {
      final result = await baseMoviesRemoteDatasource.getPopularMovies();
      return Right(result);
    } on ServerFailure catch (failure) {
      return Left(ServerFailure(errMessage: failure.errMessage));
    }
  }

  @override
  CustomEither<ServerFailure> getTopRatedMovies() async {
    try {
      final result = await baseMoviesRemoteDatasource.getTopRatedMovies();
      return Right(result);
    } on ServerFailure catch (failure) {
      return Left(ServerFailure(errMessage: failure.errMessage));
    }
  }
}
