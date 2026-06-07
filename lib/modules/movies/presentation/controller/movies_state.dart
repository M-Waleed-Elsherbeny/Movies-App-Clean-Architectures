import 'package:equatable/equatable.dart';
import 'package:movies_app/modules/movies/domain/entities/movies_entities.dart';

enum MoviesStatus { initial, loading, success, failure }

class MoviesState extends Equatable {
  final List<MoviesEntities> nowPlayingMovies;
  final MoviesStatus status;
  final String errorMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.status = MoviesStatus.initial,
    this.errorMessage = '',
  });

  MoviesState copyWith({
    List<MoviesEntities>? nowPlayingMovies,
    MoviesStatus? status,
    String? errorMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [nowPlayingMovies, status, errorMessage];
}
