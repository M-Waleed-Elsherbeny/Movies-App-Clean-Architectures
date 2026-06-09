import 'package:equatable/equatable.dart';

class GenresEntities extends Equatable {
  final int id;
  final String name;

  const GenresEntities({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}

class MovieDetailsEntities extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String backdropPath;
  final List<GenresEntities> genres;
  final int runtime;
  final String releaseDate;
  final double voteAverage;

  const MovieDetailsEntities({
    required this.id,
    required this.title,
    required this.overview,
    required this.backdropPath,
    required this.genres,
    required this.runtime,
    required this.releaseDate,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    overview,
    backdropPath,
    genres,
    runtime,
    releaseDate,
    voteAverage,
  ];
}
