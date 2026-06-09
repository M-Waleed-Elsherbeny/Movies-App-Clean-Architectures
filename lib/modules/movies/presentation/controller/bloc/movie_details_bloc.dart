import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/enums/request_state.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/modules/movies/presentation/controller/bloc/movie_details_event.dart';
import 'package:movies_app/modules/movies/presentation/controller/bloc/movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUsecase getMovieDetailsUsecase;
  MovieDetailsBloc({required this.getMovieDetailsUsecase})
    : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
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
          errorMessage: failure.errMessage,
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
}
