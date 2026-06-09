import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/server_exception_handler.dart';
import 'package:movies_app/core/utils/custom_either.dart';
import 'package:movies_app/modules/movies/data/datasource/movies_remote_datasource.dart';
import 'package:movies_app/modules/movies/domain/entities/movies_details_entities.dart';
import 'package:movies_app/modules/movies/domain/entities/movies_entities.dart';
import 'package:movies_app/modules/movies/domain/entities/movies_recommendation.dart';
import 'package:movies_app/modules/movies/domain/repository/base_movies_repo.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_movie_details_usecase.dart';

class MoviesRemoteRepository extends BaseMoviesRepository {
  final BaseMoviesRemoteDatasource baseMoviesRemoteDatasource;
  MoviesRemoteRepository({required this.baseMoviesRemoteDatasource});

  @override
  CustomEither<List<MoviesEntities>> getNowPlayingMovies() async {
    try {
      final result = await baseMoviesRemoteDatasource.getNowPlayingMovies();
      return Right(result);
    } on ServerFailure catch (failure) {
      return Left(ServerFailure(errMessage: failure.errMessage));
    }
  }

  @override
  CustomEither<List<MoviesEntities>> getPopularMovies() async {
    try {
      final result = await baseMoviesRemoteDatasource.getPopularMovies();
      return Right(result);
    } on ServerFailure catch (failure) {
      return Left(ServerFailure(errMessage: failure.errMessage));
    }
  }

  @override
  CustomEither<List<MoviesEntities>> getTopRatedMovies() async {
    try {
      final result = await baseMoviesRemoteDatasource.getTopRatedMovies();
      return Right(result);
    } on ServerFailure catch (failure) {
      return Left(ServerFailure(errMessage: failure.errMessage));
    }
  }

  @override
  CustomEither<MovieDetailsEntities> getMovieDetails({
    required MovieDetailsParams params,
  }) async {
    try {
      final result = await baseMoviesRemoteDatasource.getMovieDetails(
        params: params,
      );
      return Right(result);
    } on ServerFailure catch (failure) {
      return Left(ServerFailure(errMessage: failure.errMessage));
    }
  }
  
  @override
  CustomEither<List<MoviesRecommendationEntities>> getMoviesRecommendation({required MovieDetailsParams params}) async {
    try {
      final result = await baseMoviesRemoteDatasource.getMoviesRecommendation(params: params);
      return Right(result);
    } on ServerFailure catch (failure) {
      return Left(ServerFailure(errMessage: failure.errMessage));
    }
  }

}
