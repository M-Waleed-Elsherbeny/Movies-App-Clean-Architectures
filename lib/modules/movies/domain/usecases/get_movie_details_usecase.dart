import 'package:equatable/equatable.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/core/utils/custom_either.dart';
import 'package:movies_app/modules/movies/domain/entities/movies_details_entities.dart';
import 'package:movies_app/modules/movies/domain/repository/base_movies_repo.dart';

class GetMovieDetailsUsecase
    extends BaseUseCase<MovieDetailsEntities, MovieDetailsParams> {
  final BaseMoviesRepository baseMoviesRepository;
  GetMovieDetailsUsecase( this.baseMoviesRepository);
  @override
  CustomEither<MovieDetailsEntities> call(MovieDetailsParams params) async {
    return await baseMoviesRepository.getMovieDetails(params: params);
  }
}

class MovieDetailsParams extends Equatable {
  final int movieId;

  const MovieDetailsParams({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}
