import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/enums/request_state.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_movies_recommendation.dart';
import 'package:movies_app/modules/movies/presentation/controller/bloc/movie_details_event.dart';
import 'package:movies_app/modules/movies/presentation/controller/bloc/movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUsecase getMovieDetailsUsecase;
  final GetMoviesRecommendationUseCase getMoviesRecommendationUseCase;
  MovieDetailsBloc({
    required this.getMovieDetailsUsecase,
    required this.getMoviesRecommendationUseCase,
  }) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationsEvent>(_getMovieRecommendations);
  }

  FutureOr<void> _getMovieDetails(
    GetMovieDetailsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    final result = await getMovieDetailsUsecase(
      MovieDetailsParams(movieId: event.id),
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          movieDetailsState: RequestState.failure,
          movieDetailsErrorMessage: failure.errMessage,
        ),
      ),

      (movieDetails) => emit(
        state.copyWith(
          movieDetailsState: RequestState.success,
          movieDetails: movieDetails,
        ),
      ),
    );
  }

  FutureOr<void> _getMovieRecommendations(
    GetMovieRecommendationsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    final result = await getMoviesRecommendationUseCase(
      MovieDetailsParams(movieId: event.id),
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          moviesRecommendationState: RequestState.failure,
          moviesRecommendationErrorMessage: failure.errMessage,
        ),
      ),

      (moviesRecommendation) => emit(
        state.copyWith(
          moviesRecommendationState: RequestState.success,
          moviesRecommendation: moviesRecommendation,
        ),
      ),
    );
  }
}
