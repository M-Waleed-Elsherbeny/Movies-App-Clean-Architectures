import 'package:equatable/equatable.dart';
import 'package:movies_app/modules/movies/domain/entities/movies_entities.dart';

enum MoviesStatus { loading, success, failure }

class MoviesState extends Equatable {
  final List<MoviesEntities> nowPlayingMovies;
  final List<MoviesEntities> popularMovies;
  final List<MoviesEntities> topRatedMovies;
  final MoviesStatus status;
  final String errorMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.popularMovies = const [],
    this.topRatedMovies = const [],
    this.status = MoviesStatus.loading,
    this.errorMessage = '',
  });

  MoviesState copyWith({
    List<MoviesEntities>? nowPlayingMovies,
    List<MoviesEntities>? popularMovies,
    List<MoviesEntities>? topRatedMovies,
    MoviesStatus? status,
    String? errorMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      popularMovies: popularMovies ?? this.popularMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    nowPlayingMovies,
    popularMovies,
    topRatedMovies,
    status,
    errorMessage,
  ];
}
