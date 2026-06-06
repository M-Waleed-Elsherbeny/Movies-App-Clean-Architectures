import 'package:movies_app/modules/movies/domain/entities/movies_entities.dart';

class MoviesModel extends MoviesEntities {
  const MoviesModel({
    required super.id,
    required super.title,
    required super.releaseDate,
    required super.voteAverage,
    required super.overview,
    required super.posterPath,
    required super.backdropPath,
    required super.genreIds,
    required super.voteCount,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    return MoviesModel(
      id: json['id'],
      title: json['title'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'].toDouble(),
      overview: json['overview'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      genreIds: List<int>.from(json['genre_ids'].map((x) => x)),
      voteCount: json['vote_count'],
    );
  }
}
