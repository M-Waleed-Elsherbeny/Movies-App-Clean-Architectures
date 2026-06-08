import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_app/modules/movies/presentation/controller/movies_event.dart';
import 'package:movies_app/modules/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;
  MoviesBloc({
    required this.getNowPlayingMoviesUsecase,
    required this.getPopularMoviesUsecase,
    required this.getTopRatedMoviesUsecase,
  }) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUsecase.execute();
      result.fold(
        (failure) => emit(
          state.copyWith(
            status: MoviesStatus.failure,
            errorMessage: failure.errMessage,
          ),
        ),
        (nowPlayingMovies) => emit(
          state.copyWith(
            status: MoviesStatus.success,
            nowPlayingMovies: nowPlayingMovies,
          ),
        ),
      );
    });

    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMoviesUsecase.execute();
      result.fold(
        (failure) => emit(
          state.copyWith(
            status: MoviesStatus.failure,
            errorMessage: failure.errMessage,
          ),
        ),
        (popularMovies) => emit(
          state.copyWith(status: MoviesStatus.success, popularMovies: popularMovies),
        ),
      );
    });

    on<GetTopRatedMoviesEvent>((event, emit) async {
      final result = await getTopRatedMoviesUsecase.execute();
      result.fold(
        (failure) => emit(
          state.copyWith(
            status: MoviesStatus.failure,
            errorMessage: failure.errMessage,
          ),
        ),
        (topRatedMovies) => emit(
          state.copyWith(status: MoviesStatus.success, topRatedMovies: topRatedMovies),
        ),
      );
    });
  }
}
