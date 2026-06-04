import 'package:equatable/equatable.dart';

class MoviesEntities extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final List<int> genreIds;
  final double voteAverage;
  final int voteCount;
  final DateTime releaseDate;

  const MoviesEntities({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.genreIds,
    required this.voteAverage,
    required this.voteCount,
    required this.releaseDate,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    overview,
    posterPath,
    backdropPath,
    genreIds,
    voteAverage,
    voteCount,
    releaseDate,
  ];
}
