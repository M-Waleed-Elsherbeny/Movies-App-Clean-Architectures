import 'package:equatable/equatable.dart';
import 'package:movies_app/core/enums/request_state.dart';
import 'package:movies_app/modules/movies/domain/entities/movies_details_entities.dart';
import 'package:movies_app/modules/movies/domain/entities/movies_recommendation.dart';

class MovieDetailsState extends Equatable {
  final RequestState movieDetailsState;
  final MovieDetailsEntities? movieDetails;
  final String movieDetailsErrorMessage;
  final List<MoviesRecommendationEntities> moviesRecommendation;
  final RequestState moviesRecommendationState;
  final String moviesRecommendationErrorMessage;

  const MovieDetailsState({
    this.movieDetailsState = RequestState.loading,
    this.movieDetails,
    this.movieDetailsErrorMessage = '',
    this.moviesRecommendation = const [],
    this.moviesRecommendationState = RequestState.loading,
    this.moviesRecommendationErrorMessage = '',
  });

  MovieDetailsState copyWith({
    RequestState? movieDetailsState,
    MovieDetailsEntities? movieDetails,
    String? movieDetailsErrorMessage,
    List<MoviesRecommendationEntities>? moviesRecommendation,
    RequestState? moviesRecommendationState,
    String? moviesRecommendationErrorMessage,
  }) {
    return MovieDetailsState(
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsErrorMessage: movieDetailsErrorMessage ?? this.movieDetailsErrorMessage,
      moviesRecommendation: moviesRecommendation ?? this.moviesRecommendation,
      moviesRecommendationState: moviesRecommendationState ?? this.moviesRecommendationState,
      moviesRecommendationErrorMessage: moviesRecommendationErrorMessage ?? this.moviesRecommendationErrorMessage,
    );
  }

  @override
  List<Object?> get props => [
    movieDetailsState,
    movieDetails,
    movieDetailsErrorMessage,
    moviesRecommendation,
    moviesRecommendationState,
    moviesRecommendationErrorMessage
  ];
}
