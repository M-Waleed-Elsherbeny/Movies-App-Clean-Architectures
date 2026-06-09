import 'package:equatable/equatable.dart';
import 'package:movies_app/core/enums/request_state.dart';
import 'package:movies_app/modules/movies/domain/entities/movies_details_entities.dart';

class MovieDetailsState extends Equatable {
  final RequestState movieDetailsState;
  final MovieDetailsEntities? movieDetails;
  final String errorMessage;

  const MovieDetailsState({
    this.movieDetailsState = RequestState.loading,
    this.movieDetails,
    this.errorMessage = '',
  });

  MovieDetailsState copyWith({
    RequestState? movieDetailsState,
    MovieDetailsEntities? movieDetails,
    String? errorMessage,
  }) {
    return MovieDetailsState(
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetails: movieDetails ?? this.movieDetails,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [movieDetailsState, movieDetails, errorMessage];
}
