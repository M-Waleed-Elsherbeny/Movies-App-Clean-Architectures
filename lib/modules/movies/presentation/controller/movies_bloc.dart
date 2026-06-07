import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/modules/movies/presentation/controller/movies_event.dart';
import 'package:movies_app/modules/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  MoviesBloc(this.getNowPlayingMoviesUsecase) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUsecase.execute();
      result.fold(
        (failure) => emit(
          state.copyWith(
            status: MoviesStatus.failure,
            errorMessage: failure.errMessage,
          ),
        ),
        (nowPlayingMovies) =>
            emit(state.copyWith(status: MoviesStatus.success, nowPlayingMovies: nowPlayingMovies)),
      );
    });

    // on<GetPopularMoviesEvent>((event, emit) {
    //   // Implementation for handling popular movies event
    // });
    // on<GetTopRatedMoviesEvent>((event, emit) {
    //   // Implementation for handling top rated movies event
    // });
  }
}
