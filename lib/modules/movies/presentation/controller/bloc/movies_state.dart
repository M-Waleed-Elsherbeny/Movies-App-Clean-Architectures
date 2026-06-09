import 'package:equatable/equatable.dart';
import 'package:movies_app/core/enums/request_state.dart';
import 'package:movies_app/modules/movies/domain/entities/movies_entities.dart';


class MoviesState extends Equatable {
  final List<MoviesEntities> nowPlayingMovies;
  final List<MoviesEntities> popularMovies;
  final List<MoviesEntities> topRatedMovies;
  final RequestState movieStatus;
  final String errorMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.popularMovies = const [],
    this.topRatedMovies = const [],
    this.movieStatus = RequestState.loading,
    this.errorMessage = '',
  });

  MoviesState copyWith({
    List<MoviesEntities>? nowPlayingMovies,
    List<MoviesEntities>? popularMovies,
    List<MoviesEntities>? topRatedMovies,
    RequestState? movieStatus,
    String? errorMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      popularMovies: popularMovies ?? this.popularMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      movieStatus: movieStatus ?? this.movieStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    nowPlayingMovies,
    popularMovies,
    topRatedMovies,
    movieStatus,
    errorMessage,
  ];
}
