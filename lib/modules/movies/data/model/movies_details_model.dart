import 'package:movies_app/modules/movies/domain/entities/movies_details_entities.dart';

class MoviesDetailsModel extends MovieDetailsEntities {
  const MoviesDetailsModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.backdropPath,
    required super.genres,
    required super.runtime,
    required super.releaseDate,
    required super.voteAverage,
  });

  factory MoviesDetailsModel.fromJson(Map<String, dynamic> json) {
    return MoviesDetailsModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      backdropPath: json['backdrop_path'],
      genres: List<GenresModel>.from(
        json["genres"].map((x) => GenresModel.fromJson(x)),
      ),
      runtime: json['runtime'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'].toDouble(),
    );
  }
}

class GenresModel extends GenresEntities {
  const GenresModel({required super.id, required super.name});

  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(id: json['id'], name: json['name']);
  }
}
